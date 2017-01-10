#include "All.h"

#ifdef IO_USE_STD_LIB_FILE_IO

#include "StdLibFileIO.h"
#include "CharacterHelper.h"

///////////////////////////////////////////////////////

// low level I/O, where are prototypes and constants?
#if   defined _WIN32  ||  defined __TURBOC__  ||  defined __ZTC__  ||  defined _MSC_VER
# include <io.h>
# include <fcntl.h>
# include <time.h>
# include <sys/types.h>
# include <sys/stat.h>
#elif defined __unix__  ||  defined __linux__
# include <fcntl.h>
# include <unistd.h>
# include <sys/time.h>
# include <sys/ioctl.h>
# include <sys/types.h>
# include <sys/stat.h>
#else
# include <fcntl.h>
# include <unistd.h>
# include <sys/ioctl.h>
# include <sys/stat.h>
#endif


#ifndef O_BINARY
# ifdef _O_BINARY
#  define O_BINARY              _O_BINARY
# else
#  define O_BINARY              0
# endif
#endif

//// Binary/Low-Level-IO ///////////////////////////////////////////
//
// All file I/O is basicly handled via an ANSI file pointer (type: FILE*) in
// FILEIO-Mode 1 and via a POSIX file descriptor (type: int) in
// FILEIO-Mode 2 and 3.
//
// Some operation are only available via the POSIX interface (fcntl, setmode,
// ...) so we need a function to get the file descriptor from a file pointer.
// In FILEIO-Mode 2 and 3 this is a dummy function because we always working
// with this file descriptors.
//

#if   defined __BORLANDC__  ||  defined _WIN32
# define FILENO(__fp)          _fileno ((__fp))
#elif defined __CYGWIN__  ||  defined __TURBOC__  ||  defined __unix__  ||  defined __EMX__  ||  defined _MSC_VER
# define FILENO(__fp)          fileno  ((__fp))
#else
# define FILENO(__fp)          fileno  ((__fp))
#endif


//
// If we have access to a file via file name, we can open the file with an
// additional "b" or a O_BINARY within the (f)open function to get a
// transparent untranslated data stream which is necessary for audio bitstream
// data and also for PCM data. If we are working with
// stdin/stdout/FILENO_STDIN/FILENO_STDOUT we can't open the file with this
// attributes, because the files are already open. So we need a non
// standardized sequence to switch to this mode (not necessary for Unix).
// Mostly the sequency is the same for incoming and outgoing streams, but only
// mostly so we need one for IN and one for OUT.
// Macros are called with the file pointer and you get back the untransalted file
// pointer which can be equal or different from the original.
//

#if   defined __EMX__
# define SETBINARY_IN(__fp)     (_fsetmode ( (__fp), "b" ), (__fp))
# define SETBINARY_OUT(__fp)    (_fsetmode ( (__fp), "b" ), (__fp))
#elif defined __TURBOC__ || defined __BORLANDC__
# define SETBINARY_IN(__fp)     (setmode   ( FILENO ((__fp)),  O_BINARY ), (__fp))
# define SETBINARY_OUT(__fp)    (setmode   ( FILENO ((__fp)),  O_BINARY ), (__fp))
#elif defined __CYGWIN__
# define SETBINARY_IN(__fp)     (setmode   ( FILENO ((__fp)), _O_BINARY ), (__fp))
# define SETBINARY_OUT(__fp)    (setmode   ( FILENO ((__fp)), _O_BINARY ), (__fp))
#elif defined _WIN32
# define SETBINARY_IN(__fp)     (_setmode  ( FILENO ((__fp)), _O_BINARY ), (__fp))
# define SETBINARY_OUT(__fp)    (_setmode  ( FILENO ((__fp)), _O_BINARY ), (__fp))
#elif defined _MSC_VER
# define SETBINARY_IN(__fp)     (setmode   ( FILENO ((__fp)),  O_BINARY ), (__fp))
# define SETBINARY_OUT(__fp)    (setmode   ( FILENO ((__fp)),  O_BINARY ), (__fp))
#elif defined __unix__
# define SETBINARY_IN(__fp)     (__fp)
# define SETBINARY_OUT(__fp)    (__fp)
#elif 0
# define SETBINARY_IN(__fp)     (freopen   ( NULL, "rb", (__fp) ), (__fp))
# define SETBINARY_OUT(__fp)    (freopen   ( NULL, "wb", (__fp) ), (__fp))
#else
# define SETBINARY_IN(__fp)     (__fp)
# define SETBINARY_OUT(__fp)    (__fp)
#endif


///////////////////////////////////////////////////////

CStdLibFileIO::CStdLibFileIO()
{
    memset(m_cFileName, 0, MAX_PATH);
    m_bReadOnly = false;
    m_pFile = NULL;
}

CStdLibFileIO::~CStdLibFileIO()
{
    Close();
}

int CStdLibFileIO::GetHandle()
{
    return FILENO(m_pFile);
}

int CStdLibFileIO::Open(const wchar_t * pName)
{
    Close();

    m_bReadOnly = false;

    char * wpName = GetANSIFromUTF16(pName);

    if (0 == wcscmp(pName, L"-") || 0 == wcscmp(pName, L"/dev/stdin"))
    {
        m_pFile = SETBINARY_IN(stdin);
        m_bReadOnly = true;                                                     // ReadOnly
    }
    else if (0 == wcscmp (pName, L"/dev/stdout"))
    {
        m_pFile = SETBINARY_OUT(stdout);
        m_bReadOnly = false;                                                    // WriteOnly
    }
    else
    {
        m_pFile = fopen(wpName, "r+b");
	if (!m_pFile)
	{
	    /*
	     * if we fail to open it with Read/Write permission,
	     * we will try Read-Only.
	     */
	    m_pFile = fopen(wpName, "rb");                                      // ReadOnly
	    m_bReadOnly = true;
	}
	else
	    m_bReadOnly = false;                                                // Read/Write
    }

    if (!m_pFile)
        return -1;

    wcscpy(m_cFileName, pName);

    return 0;
}

int CStdLibFileIO::Close()
{
    int nRetVal = -1;

    if (m_pFile != NULL)
    {
        nRetVal = fclose(m_pFile);
        m_pFile = NULL;
    }

    return nRetVal;
}

int CStdLibFileIO::Read(void * pBuffer, unsigned int nBytesToRead, unsigned int * pBytesRead)
{
    *pBytesRead = fread(pBuffer, 1, nBytesToRead, m_pFile);
    return ferror(m_pFile) ? ERROR_IO_READ : 0;
}

int CStdLibFileIO::Write(const void * pBuffer, unsigned  int nBytesToWrite, unsigned int * pBytesWritten)
{
    *pBytesWritten = fwrite(pBuffer, 1, nBytesToWrite, m_pFile);

    return (ferror(m_pFile) || (*pBytesWritten != nBytesToWrite)) ? ERROR_IO_WRITE : 0;
}

int CStdLibFileIO::Seek(int nDistance, unsigned int nMoveMode)
{
    return fseek(m_pFile, nDistance, nMoveMode);
}

int CStdLibFileIO::SetEOF()
{
    return ftruncate(GetHandle(), GetPosition());
}

int CStdLibFileIO::GetPosition()
{
    fpos_t fPosition;

    memset(&fPosition, 0, sizeof(fPosition));
    fgetpos(m_pFile, &fPosition);
//    return _FPOSOFF(fPosition);
    return ftell(m_pFile);
}

int CStdLibFileIO::GetSize()
{
    int nCurrentPosition = GetPosition();
    Seek(0, FILE_END);
    int nLength = GetPosition();
    Seek(nCurrentPosition, FILE_BEGIN);
    return nLength;
}

int CStdLibFileIO::GetName(wchar_t * pBuffer)
{
    wcscpy(pBuffer, m_cFileName);
    return 0;
}

int CStdLibFileIO::Create(const wchar_t * pName)
{
    Close();

    if (0 == wcscmp (pName, L"-") || 0 == wcscmp (pName, L"/dev/stdout"))
    {
        m_pFile = SETBINARY_OUT(stdout);
        m_bReadOnly = false;                            // WriteOnly
    }
    else
    {
	char * wpName = GetANSIFromUTF16(pName);
        m_pFile = fopen (wpName, "wb+");                 // Read/Write
        m_bReadOnly = false;
    }

    if (!m_pFile)
        return -1;

    wcscpy (m_cFileName, pName);

    return 0;
}

int CStdLibFileIO::Delete()
{
    Close();
    return unlink (GetANSIFromUTF16(m_cFileName));    // 0 success, -1 error
}

#endif // #ifdef IO_USE_STD_LIB_FILE_IO

