Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F50C3F1048
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916139; cv=none; b=mywO+SwjLPgqfPTbPjbqNgmUxofu40GgOlSG9de4RJKXx/sWkvLazNA22TqRh40QUJ/YzieFpVhQ7WdPd6QMPtPmcEVguYH9hgWS5x7dgZCrFRZBh7xiUy0ep8HwrgzueC4Fo5CZUNFCG67bSkh+41IOUntIbhGCxnq9kWr7rvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916139; c=relaxed/simple;
	bh=UxibEGyh0ngX6WPIStCZE+luKCxsFWjamD4YeF+l55I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kLMmKvMGkufW/JTOqFe9ee0A9zjey9Cmhih0pOHIMHkiMgHb+12bZhtBmetwRZBU7M/buNuv04NkLLVS2jQxf6fNpgG5lc4fKhaTSfNS5/qOcwh03djG65hpe8MfpOasRyi3dWONseCThNFPX/BAlpinhCjtF28++u12Chq+2pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=EzyLhITY; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="EzyLhITY"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so1042747a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1787916137; x=1788520937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oiV7JIlpXQTeWvhUN2RPawVnRyDQAz0BFchJbeuzjeg=;
        b=EzyLhITY8PvH2H9eegea/3LG1SPudsrc4d1U61MuMnxZ1v3DwlWjQirxSpG1109wX0
         DyxE2RwySXshSSohVMSN268Jm+/LEdscAv0SUSzywHAFWa2Ehnqzi8b3uTOhb6UUCZYE
         pFrkHUwEujJ5rlBDd83hZvu00xqNDirKCeBxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787916137; x=1788520937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oiV7JIlpXQTeWvhUN2RPawVnRyDQAz0BFchJbeuzjeg=;
        b=pXGOj0eN2gNIwiUgzmD6Q/o5sYu6b3huBPN0ofiHeDXOaepEcKiAr3MeQlM5PAf8w8
         tQQZhUzG4YGAihfTy9W7rvYNOE7XGvgNLXSGPA6FVwFhlPUGGXl2tCTn7Iv7RnRbQHiV
         n6Wc/n1DevDi8fIg72+ogAbC2+xttF1vzMtIMHGAupE/Nj5Dj9g4gQwFAS2eTlpkx2y7
         1OVkaTMNDfuj4T97uvkhkKdPURzzpGijOITDVdpw2AzPBqyXZ2OEh89hrVhxlwf/Bkav
         uiLznnxPiH2S8t7Al2qzMsCioAwhM9zxsngV6LvKQaSzixSUp0ZdEXG75i9+PKWDeGDU
         gueA==
X-Gm-Message-State: AFuF++lgbWWmIFFGWW3a4jcmGxQ7EmS9ercIM4UsPRrsJrCwnounnUTV
	OKA+AU7Ajacl75gpqs2dlFd/z6zWsmyS9k6RN3i1Ujk1P3gRfhjVQ6qIMZfneC2Yxvc=
X-Gm-Gg: AR+sD12ZWfxSzkOYLs+9XQKaXPz33qtT35IEf3J7XaeRc7X6b/FBIVxba5PV2LUqiuR
	LLusx0Abwb7or037sHq+tHnPwEUT+sZopKQS5aUpf9xMiUQl3ik/NCcvIQ0nuV4TJ5rPJCHf5Ps
	EcszdLDrt5Y+paH2HrdSSKDtA3eu/gpbZ81xsM1IVCnDRMx89SanSiSNIcOEQ0ck72/Q9npfMp2
	RgNnxBr3twa+x6NP9MFBGpxoYNdsSWqZVCt6gCdRW3rR5Gode8gOI4u5FfEBjHWEU1p22a9Oyw5
	U6LeYfE6RHj4tRuu5+KbAt/BRq9GVQfIew7jm1W/q5TveQI4/9EHJ5g/ETHjkqwqJKRzy22E+CH
	XnFST8A4yFiE/G6PPaJ0qvzEpZHhMnaY2qrH7xP/OZ/ZNrWbLn9NW9WV+8sFWxXvyRgybEyLrpl
	ruRpU1rV1nB1m1IG1pwvpJK7Kt4zXAstO//UJficvDuA44jjytiV/x1KYcRh/cI6+Llv8Agc235
	g==
X-Received: by 2002:a17:90b:2885:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-396d0d2f6cbmr13271308a91.2.1787916136666;
        Fri, 28 Aug 2026 04:22:16 -0700 (PDT)
Received: from kinako.work.home.arpa ([2400:4162:2428:2ffe:a973:53e4:1a28:8545])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-396ddc08266sm2162747a91.11.2026.08.28.04.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 04:22:16 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: w@1wt.eu,
	linux@weissschuh.net
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH] tools/nolibc: Add dirfd()
Date: Fri, 28 Aug 2026 20:22:04 +0900
Message-ID: <20260828112204.104111-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is useful for things like fstatat() on children of directory
opened with opendir().

At the same time use it to replace the two places that are converting
the DIR point back into an fd.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 tools/include/nolibc/dirent.h | 38 +++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/tools/include/nolibc/dirent.h b/tools/include/nolibc/dirent.h
index 4e02ef25e72d..ba229b215a0b 100644
--- a/tools/include/nolibc/dirent.h
+++ b/tools/include/nolibc/dirent.h
@@ -27,6 +27,18 @@ typedef struct {
 	char dummy[1];
 } DIR;
 
+/* Internal dirfd() that does not set errno */
+static __attribute__((unused))
+int nolibc_dirfd(DIR *dirp)
+{
+	intptr_t i = (intptr_t)dirp;
+
+	if (i >= 0)
+		return -1;
+
+	return ~i;
+}
+
 static __attribute__((unused))
 DIR *fdopendir(int fd)
 {
@@ -49,15 +61,27 @@ DIR *opendir(const char *name)
 }
 
 static __attribute__((unused))
-int closedir(DIR *dirp)
+int dirfd(DIR *dirp)
 {
-	intptr_t i = (intptr_t)dirp;
+	int fd = nolibc_dirfd(dirp);
 
-	if (i >= 0) {
+	if (fd < 0) {
 		SET_ERRNO(EBADF);
 		return -1;
 	}
-	return close(~i);
+
+	return fd;
+}
+
+static __attribute__((unused))
+int closedir(DIR *dirp)
+{
+	int fd = dirfd(dirp);
+
+	if (fd < 0)
+		return -1;
+
+	return close(fd);
 }
 
 static __attribute__((unused))
@@ -65,14 +89,12 @@ int readdir_r(DIR *dirp, struct dirent *entry, struct dirent **result)
 {
 	char buf[sizeof(struct linux_dirent64) + NAME_MAX + 1] __nolibc_aligned_as(struct linux_dirent64);
 	struct linux_dirent64 *ldir = (void *)buf;
-	intptr_t i = (intptr_t)dirp;
 	int fd, ret;
 
-	if (i >= 0)
+	fd = nolibc_dirfd(dirp);
+	if (fd < 0)
 		return EBADF;
 
-	fd = ~i;
-
 	ret = _sys_getdents64(fd, ldir, sizeof(buf));
 	if (ret < 0)
 		return -ret;
-- 
2.53.0

