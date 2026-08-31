Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CBB3C2BAF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788151734; cv=none; b=fbx82aF7Ct8CjpwIgTucStJ10C14KMNKKAMHv7yYMFUnnz77erYsGrHi7aqxlPW2R61nQkaSXR3LvZuWr02AcjA+ZYe53qt3muIDbZQ+3Ci29jreCIpQEq3hQARFgN4OHz6S7NCCvBveSngzUacsFT3fG5Z/0yhJEd3hnHUp6pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788151734; c=relaxed/simple;
	bh=zOfMkKvQ/4SyNTJ14DRTwpEpVyFE3GSJ3XgEqN5Li8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=flsvE9oa095L32Smqh1SMPgCaPjpr+1QwIEkHUV99N4rV23aaF3JKOpeN7/hvErsgEX1GnBUyQi+BklmmiZeQ38Lw6RJ4K2CIGursXurBNov21ta4wP/psfGY+COw0MmqrO4AjyD53eswbtaqUMczQesADXmqVbw9KH7GDPQxc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=nFlCAUAe; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="nFlCAUAe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1788151729;
	bh=zOfMkKvQ/4SyNTJ14DRTwpEpVyFE3GSJ3XgEqN5Li8w=;
	h=From:Date:Subject:To:Cc:From;
	b=nFlCAUAe/lfmfXAuO+W1t5vz9kjKH+2J5cjXll/LUH00ijcz4jYo88has2V+D2MAB
	 hdgpjaHnGv2WnimseD2Uf4oxnjvy7KjS8rMPH+xivd49+pEGMO3tCf4H24xPnSlIRF
	 32z4mS3woDCRiE+JMLIaF446Ri9RtitBEfBEXGmY=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 31 Aug 2026 06:48:47 +0200
Subject: [PATCH] tools/nolibc: rename SET_ERRNO() to __nolibc_set_errno()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260831-nolibc-set-errno-v1-1-516b7a970e7d@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrB2IP4S0VykuNE7slJKUGRVBv
 LupLr/FezsoCZPCs9hBaGXlFDOqsgD/7uNEyGM21Ka2xjUVxvTlwaPSjCQSE9oxtMb11rnwgJz
 9hAJv1/LV3dZl+JCf/x84jhMKv0zPdAAAAA==
X-Change-ID: 20260831-nolibc-set-errno-6df408a688f9
To: Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788151731; l=7553;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=zOfMkKvQ/4SyNTJ14DRTwpEpVyFE3GSJ3XgEqN5Li8w=;
 b=/W8zv356lpjP0ImEtB8lWZP9/u9z2jX6CwUuGXWKsHEVuqth0/BgYw5azbf9n/MW10rMqGhDW
 WPoXcs+3qggDC8X6cpgQew5zXpcBMxt6xHNLlxfQ2GAjOldusixHVuv
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The previous name infringes on the application's namespace.

Rename it to a nolibc-private name.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/dirent.h   |  4 ++--
 tools/include/nolibc/errno.h    |  4 ++--
 tools/include/nolibc/stdio.h    | 12 ++++++------
 tools/include/nolibc/stdlib.h   |  6 +++---
 tools/include/nolibc/sys.h      | 13 ++++++++-----
 tools/include/nolibc/sys/mman.h |  4 ++--
 tools/include/nolibc/sys/wait.h |  2 +-
 tools/include/nolibc/unistd.h   |  4 ++--
 8 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/tools/include/nolibc/dirent.h b/tools/include/nolibc/dirent.h
index 4e02ef25e72d..49e5190cc1f0 100644
--- a/tools/include/nolibc/dirent.h
+++ b/tools/include/nolibc/dirent.h
@@ -31,7 +31,7 @@ static __attribute__((unused))
 DIR *fdopendir(int fd)
 {
 	if (fd < 0) {
-		SET_ERRNO(EBADF);
+		__nolibc_set_errno(EBADF);
 		return NULL;
 	}
 	return (DIR *)(intptr_t)~fd;
@@ -54,7 +54,7 @@ int closedir(DIR *dirp)
 	intptr_t i = (intptr_t)dirp;
 
 	if (i >= 0) {
-		SET_ERRNO(EBADF);
+		__nolibc_set_errno(EBADF);
 		return -1;
 	}
 	return close(~i);
diff --git a/tools/include/nolibc/errno.h b/tools/include/nolibc/errno.h
index a2325596d550..9c2fe7810073 100644
--- a/tools/include/nolibc/errno.h
+++ b/tools/include/nolibc/errno.h
@@ -13,12 +13,12 @@
 #include <linux/errno.h>
 
 #ifndef NOLIBC_IGNORE_ERRNO
-#define SET_ERRNO(v) do { errno = (v); } while (0)
+#define __nolibc_set_errno(v) do { errno = (v); } while (0)
 int errno __attribute__((weak));
 char *program_invocation_name __attribute__((weak)) = (char *)"";
 char *program_invocation_short_name __attribute__((weak)) = (char *)"";
 #else
-#define SET_ERRNO(v) do { } while (0)
+#define __nolibc_set_errno(v) do { } while (0)
 #define program_invocation_name ""
 #define program_invocation_short_name ""
 #endif
diff --git a/tools/include/nolibc/stdio.h b/tools/include/nolibc/stdio.h
index ebdd413d13ec..25205d40e2b3 100644
--- a/tools/include/nolibc/stdio.h
+++ b/tools/include/nolibc/stdio.h
@@ -50,7 +50,7 @@ static __attribute__((unused))
 FILE *fdopen(int fd, const char *mode __attribute__((unused)))
 {
 	if (fd < 0) {
-		SET_ERRNO(EBADF);
+		__nolibc_set_errno(EBADF);
 		return NULL;
 	}
 	return (FILE*)(intptr_t)~fd;
@@ -72,7 +72,7 @@ FILE *fopen(const char *pathname, const char *mode)
 		flags = O_WRONLY | O_CREAT | O_APPEND;
 		break;
 	default:
-		SET_ERRNO(EINVAL); return NULL;
+		__nolibc_set_errno(EINVAL); return NULL;
 	}
 
 	if (mode[1] == '+')
@@ -89,7 +89,7 @@ int fileno(FILE *stream)
 	intptr_t i = (intptr_t)stream;
 
 	if (i >= 0) {
-		SET_ERRNO(EBADF);
+		__nolibc_set_errno(EBADF);
 		return -1;
 	}
 	return ~i;
@@ -103,7 +103,7 @@ int fflush(FILE *stream)
 
 	/* NULL is valid here. */
 	if (i > 0) {
-		SET_ERRNO(EBADF);
+		__nolibc_set_errno(EBADF);
 		return -1;
 	}
 
@@ -118,7 +118,7 @@ int fclose(FILE *stream)
 	intptr_t i = (intptr_t)stream;
 
 	if (i >= 0) {
-		SET_ERRNO(EBADF);
+		__nolibc_set_errno(EBADF);
 		return -1;
 	}
 
@@ -900,7 +900,7 @@ int vsscanf(const char *str, const char *format, va_list args)
 			} else if (*format == 'p') {
 				*va_arg(args, void **) = (void *)strtoul(str, &endptr, 16);
 			} else {
-				SET_ERRNO(EILSEQ);
+				__nolibc_set_errno(EILSEQ);
 				goto done;
 			}
 
diff --git a/tools/include/nolibc/stdlib.h b/tools/include/nolibc/stdlib.h
index 1816c2368b68..400f160e2fa5 100644
--- a/tools/include/nolibc/stdlib.h
+++ b/tools/include/nolibc/stdlib.h
@@ -148,7 +148,7 @@ void *calloc(size_t size, size_t nmemb)
 	size_t x;
 
 	if (__builtin_expect(__builtin_mul_overflow(size, nmemb, &x), 0)) {
-		SET_ERRNO(ENOMEM);
+		__nolibc_set_errno(ENOMEM);
 		return NULL;
 	}
 
@@ -440,7 +440,7 @@ uintmax_t __strtox(const char *nptr, char **endptr, int base, intmax_t lower_lim
 	char c;
 
 	if (base < 0 || base > 36) {
-		SET_ERRNO(EINVAL);
+		__nolibc_set_errno(EINVAL);
 		goto out;
 	}
 
@@ -496,7 +496,7 @@ uintmax_t __strtox(const char *nptr, char **endptr, int base, intmax_t lower_lim
 
 out:
 	if (overflow) {
-		SET_ERRNO(ERANGE);
+		__nolibc_set_errno(ERANGE);
 		val = limit;
 	}
 	if (endptr)
diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 548f94d96ed2..650b7a85e0f1 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -40,9 +40,12 @@
 #define __sysret(arg)							\
 ({									\
 	__typeof__(arg) __sysret_arg = (arg);				\
-	(__sysret_arg < 0)                              /* error ? */	\
-		? (({ SET_ERRNO(-__sysret_arg); }), -1) /* ret -1 with errno = -arg */ \
-		: __sysret_arg;                         /* return original value */ \
+	/* error ? */							\
+	(__sysret_arg < 0)						\
+		/* return -1 with errno = -arg */			\
+		? (({ __nolibc_set_errno(-__sysret_arg); }), -1)	\
+		/* return original value */				\
+		: __sysret_arg;						\
 })
 
 /* Syscall ENOSYS helper: Avoids unused-parameter warnings, provides compile
@@ -121,7 +124,7 @@ int brk(void *addr)
 	void *ret = _sys_brk(addr);
 
 	if (!ret) {
-		SET_ERRNO(ENOMEM);
+		__nolibc_set_errno(ENOMEM);
 		return -1;
 	}
 	return 0;
@@ -136,7 +139,7 @@ void *sbrk(intptr_t inc)
 	if (ret && _sys_brk(ret + inc) == ret + inc)
 		return ret + inc;
 
-	SET_ERRNO(ENOMEM);
+	__nolibc_set_errno(ENOMEM);
 	return (void *)-1;
 }
 
diff --git a/tools/include/nolibc/sys/mman.h b/tools/include/nolibc/sys/mman.h
index 72bc1d43d1d4..e5eb42825783 100644
--- a/tools/include/nolibc/sys/mman.h
+++ b/tools/include/nolibc/sys/mman.h
@@ -37,7 +37,7 @@ void *mmap(void *addr, size_t length, int prot, int flags, int fd, off_t offset)
 	void *ret = _sys_mmap(addr, length, prot, flags, fd, offset);
 
 	if ((unsigned long)ret >= -4095UL) {
-		SET_ERRNO(-(long)ret);
+		__nolibc_set_errno(-(long)ret);
 		ret = MAP_FAILED;
 	}
 	return ret;
@@ -56,7 +56,7 @@ void *mremap(void *old_address, size_t old_size, size_t new_size, int flags, voi
 	void *ret = _sys_mremap(old_address, old_size, new_size, flags, new_address);
 
 	if ((unsigned long)ret >= -4095UL) {
-		SET_ERRNO(-(long)ret);
+		__nolibc_set_errno(-(long)ret);
 		ret = MAP_FAILED;
 	}
 	return ret;
diff --git a/tools/include/nolibc/sys/wait.h b/tools/include/nolibc/sys/wait.h
index 7a1feb2b66fc..7fb4b3fca013 100644
--- a/tools/include/nolibc/sys/wait.h
+++ b/tools/include/nolibc/sys/wait.h
@@ -41,7 +41,7 @@ pid_t waitpid(pid_t pid, int *status, int options)
 	pid_t id;
 
 	if (pid == INT_MIN) {
-		SET_ERRNO(ESRCH);
+		__nolibc_set_errno(ESRCH);
 		return -1;
 	} else if (pid < -1) {
 		idtype = P_PGID;
diff --git a/tools/include/nolibc/unistd.h b/tools/include/nolibc/unistd.h
index a264a20da13d..d48f02a00f5f 100644
--- a/tools/include/nolibc/unistd.h
+++ b/tools/include/nolibc/unistd.h
@@ -90,7 +90,7 @@ char *getcwd(char *buf, size_t size)
 
 	/* Unlike other libc's we don't handle passing NULL for buf */
 	if (!buf || !size) {
-		SET_ERRNO(EINVAL);
+		__nolibc_set_errno(EINVAL);
 		return NULL;
 	}
 
@@ -105,7 +105,7 @@ char *getcwd(char *buf, size_t size)
 	 * This matches what musl is doing.
 	 */
 	if (ret == 0 || buf[0] != '/') {
-		SET_ERRNO(ENOENT);
+		__nolibc_set_errno(ENOENT);
 		return NULL;
 	}
 

---
base-commit: 9c47af906bc655c8f45aaf1f156656239c2c5073
change-id: 20260831-nolibc-set-errno-6df408a688f9

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

