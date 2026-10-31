Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793421015;
	b=cT5YqKmYzP0jWgapFC7ho3iNY/kUiVfgBwjbrUn/PCtuLAN2AU1DxGiQ7A4du0J4kBcp
	 d3IGJ/PyBQeE1VHHGom54aLoJ5cpzNO52Md8oNWSVjSmn+2LyW0dpPbv1yLIq+yG7XrMm
	 e58vt8tmBOhOo150tK2QNpHahj52+eYY/pSQRZaACKo7pn1vQDQXG8sc0+Z3IrNbpLWVe
	 xT+8MwYfE3ZyFrBnyWo4ps53d2D26R3VAZlT73eilLhrGx456biYMOB9KokZnCJwNMf8c
	 QxAKdIX9zIYqCcDELgQ35zUB8suLKPUJaraoz2yjfYTmT/YJovUf2zRoj8mEmm1Wh9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793421015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=430DBB3YbMxGfumMFATZd+7P/xGBoFDYBpgUYJR5cMc=;
	b=hVMRFUq+PmxB0BC7IGN5ZY9nC0nrpi7a1+hQHUIsUC05uzI6VtGdWZUZBFeOnjh1TBZ6
	 4S6CLDfyMgdE4JdKspimTODRuZb2d4+ERWQh+4/Vd7DSDkzns5KcJVwt3MxObCTbY9Txi
	 6FgkMyUasbtusAZjydK5hp/8qFSHcMn6fwsqLgMNWVddJdlXID89Jxkr1eSC0Ym5mr93N
	 LxUimNcxmaG+9lipQO6rVcOgjZ1YPw3rTe5FvHrv/9k/Eg8DXMmQmMpoYZ7/3Y/nW/HFv
	 NBEdresTCC9PO+Jv0MxTszWUIbphJclzaLbD20GjiLrb539oDVuUfTCRz3xig4+kVwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thingy.jp;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=thingy.jp header.i=@thingy.jp header.a=rsa-sha256 header.s=google header.b=WQqhp4GS;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E741606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E741606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=thingy.jp header.i=@thingy.jp header.a=rsa-sha256 header.s=google header.b=WQqhp4GS
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-369f33df08eso2798526eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1793421013; x=1794025813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=430DBB3YbMxGfumMFATZd+7P/xGBoFDYBpgUYJR5cMc=;
        b=WQqhp4GSUYbk4mEt4Wvh+7VhhutGcSgdNKZVUoZDJKrDELXPaxGj5J/zsIxSvkmLW5
         fiQ0w6UGyRgA04DeEHcT2/NDHGFtO4BcLz3G1GsDvlB3QxuLB9YXkzI+nAMlRS1RfncX
         vgPv4+eCPhnBwV9YjAbc5j4tuCuqKmZhyPGzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793421013; x=1794025813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=430DBB3YbMxGfumMFATZd+7P/xGBoFDYBpgUYJR5cMc=;
        b=dGkxhCs9/vgVbfcaqoS9j6dKri8ltQeqnZ/MYDiVMe5tHLifE5iySRxzVKKaInTQzY
         t1q6+9iSofSJJw6L/G5zQTAFJ4IPkQAx8pBQ16EZEyj7P5+A22t3Sk/gsMfiR9kl+YFD
         nxggpVgLk4OjGGT3CR2T6ker0k6gK0wEQLgfoHp5KOgbp9XSKZbMVqjRG7GfnMcXM6O0
         4+a++INUmud07h9sEN6eM5qsqywx2Wv9t+S2t9bB40piNgyw14Lc9bKYva9jwkDg5trs
         pd+2Lp8thXbbqCoo2ppUzCrESoy9aI7EE3lN3L78LBQCH3KXPweXyHUAm/Ik0FAEbk4l
         d5Xg==
X-Gm-Message-State: AFq9FYKZzfm64DUDs41UtzmwILxxUNazgX77sT4Z9On9ephz9VwDb+1M
	hkf9Ie0HpDqpSUXCjdy4pvDzb1IFruWA/sojwBGlLGqBKXovlnlOvuMBROeMlGYZMYY=
X-Gm-Gg: AYBFou22mKzpHgKgZhTyekfGOGPZ7PykBCEEq0G35ePi9M5pmWqr1LrC8VKecTbcz9O
	DNqLpKVY4dLtJSYvv70cCPxPB34N9F7EzpDJvoGxJYKZWy3TuT3EhWSrtBwLJy4vhXYirpEYZmI
	0yTHIrOMoiEWJaix6FM/hgRyNAcz3vuRjiWDc+3yZkoVo8LQtPw4p0ftGagh96qiKCb/ng30h7h
	fZcoJ9yuUNK3NsNcpdfiCKJbEJo+P1NYu6hq7ZE2WQrl2EI+2zQ2HatNubnSNuaH8IS6kDwquoo
	t+fI953qkl7hbKAiv4vxbciHQ2gHIxfkQGz740NpeUKvmPvY2bi2FCXSzyrgqn5/JwfIT2S/P6u
	rngDrtbiZ5k12Gs8op302wMPoUGYSqYYPiRIQeT3XV4fAGFQLn0CIHeodlVgvGeV6GW2qOaxlaR
	LQ2M/NZmdd5+v1IT++/1/ucbcKLBTOJ8aldToM7o7BR88926ObvjZjB3mgJveWqFYLukmiakICw
	XYVx4UeFvv8ePHP7oR+QHzzyTQnJTVIjlCdtpBlDFqhxsC/sBIg17w5M7yLzNUzFjNUFqaTFH7j
	lTpyEDJ9nWSVhFO/T+jcgQUILmEILA4XVunFnR7cu6S56JaQs8MLWxvN9u2UEPAsHGBqNKTnAJX
	Eiphzm2wuZOamFxEKxzo=
X-Received: by 2002:a05:693c:4095:b0:351:4d2d:af26 with SMTP id 5a478bee46e88-36a4220016fmr7452496eec.2.1793421013213;
        Fri, 30 Oct 2026 21:30:13 -0700 (PDT)
Received: from kinako.work.home.arpa (p1795186-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.207.151.186])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm16603361eec.16.2026.10.30.21.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 21:30:12 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: w@1wt.eu,
	linux@weissschuh.net
Cc: linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH v3 1/3] tools/nolibc: Add internal __nolibc_dirfd() helper
Date: Sat, 31 Oct 2026 13:29:58 +0900
Message-ID: <20261031043000.145709-2-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031043000.145709-1-daniel@thingy.jp>
References: <20261031043000.145709-1-daniel@thingy.jp>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

closedir() and readdir_r() both convert a DIR pointer back into
an fd. Move that logic into a single helper.

The helper does not set errno so that it can be used by
readdir_r() which returns its own error.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 tools/include/nolibc/dirent.h | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/tools/include/nolibc/dirent.h b/tools/include/nolibc/dirent.h
index 19857369de2a..7666dc69506f 100644
--- a/tools/include/nolibc/dirent.h
+++ b/tools/include/nolibc/dirent.h
@@ -27,6 +27,18 @@ typedef struct {
 	char dummy[1];
 } DIR;
 
+/* Internal dirfd() that does not set errno */
+static __attribute__((unused))
+int __nolibc_dirfd(DIR *dirp)
+{
+	intptr_t fd = ~(intptr_t)dirp;
+
+	if (fd < 0)
+		return -1;
+
+	return fd;
+}
+
 static __attribute__((unused))
 DIR *fdopendir(int fd)
 {
@@ -65,13 +77,13 @@ DIR *opendir(const char *name)
 static __attribute__((unused))
 int closedir(DIR *dirp)
 {
-	intptr_t i = (intptr_t)dirp;
+	int fd = __nolibc_dirfd(dirp);
 
-	if (i >= 0) {
+	if (fd < 0) {
 		SET_ERRNO(EBADF);
 		return -1;
 	}
-	return close(~i);
+	return close(fd);
 }
 
 static __attribute__((unused))
@@ -79,15 +91,13 @@ int readdir_r(DIR *dirp, struct dirent *entry, struct dirent **result)
 {
 	char buf[sizeof(struct linux_dirent64) + NAME_MAX + 1] __nolibc_aligned_as(struct linux_dirent64);
 	struct linux_dirent64 *ldir = (void *)buf;
-	intptr_t i = (intptr_t)dirp;
 	int fd, ret;
 	off_t off;
 
-	if (i >= 0)
+	fd = __nolibc_dirfd(dirp);
+	if (fd < 0)
 		return EBADF;
 
-	fd = ~i;
-
 	ret = _sys_getdents64(fd, ldir, sizeof(buf));
 	if (ret < 0)
 		return -ret;
-- 
2.53.0

