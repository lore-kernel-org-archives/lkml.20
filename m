Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793218071;
	b=LlWvU9+R9o/gDV/cswVh7H5aTHrwN38yn7k/R6NRpPWbBmOdZHNqE9lFeQNuy2y6PzlN
	 Vptt3PeHjwJyMM+0EpRmGcYPChLVpHplMMnXDTK39CutE5szkTPPaB51qR6ATh+zr2dX+
	 NYTP8Bq7I7c8v+rAZkaOleJugOBCFKXn+cXScJSup/hijfPIggquQ9b8xFrzyhLPeH/lI
	 wSIC+LsUVZMW6jWAipPR7oBzDIO4XL0OdgpHuIOf6/l3hV6WZgIHYevsf7uiQBL81bPxh
	 qAWhEUmJXUL35cCXsZxvxj1YVd45HK25RoxlxiIAjS8Cl69oYjATGUuioOvUOLtQL+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=45B3EYVV7L9uR4EJrE7Zfbp22ck+MWK5PE+WpGQpSrM=;
	b=k2uBvpeaUc7RNlf4qDFWoSoOdWrLVEFLBZgIxrw/KFas0pnmhac1S18w7/Z6iFokRVZe
	 Jhs1B6IiQUAKzph3M9M5RUZrtecEcYFJdn9qhNHpck8cRquDjObQaLBg5J3OQKmnBjG1c
	 qQoPeQmOLZ+mig8ZC9JvO7ltlNiXlFd4EnipUdKK7f+yCzMOCq32fWeGGVN+xDMSY91cB
	 x43lWVXO9myELTPQ7q4xShpWf2cLcaieXMnO7P314M/9LV7WjGQIBDWnva+FReJ9io+2x
	 GY8LFyqUQjtcvWitqCv69TI+Kmf9K0cghkP1WOz3blW4pEM0fRwACTF9pxmhU5a2TDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yv2yY5bC;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F433606A336
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F433606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yv2yY5bC
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-85a5455bd3cso850993a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793218070; x=1793822870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45B3EYVV7L9uR4EJrE7Zfbp22ck+MWK5PE+WpGQpSrM=;
        b=Yv2yY5bCMtedG56M+matoiFXdcZTzrCvxxmk9VtZNA42QRT7hjNx0ivck+SsYuzKNd
         gU7ZJ1sOnYdLXuOSXe7A2r/KrJQsZXdcayOC1hjZJsseX59OABaTVNdgFd3uPZVq+uRg
         zgfcIAGsqJXItpfb11g4Pz0Gmu9IFGPgQdBHfqBB5MRtXUVfoAXI5wc63N9JIWUZpVXQ
         4IfnReIyQCyYtu0FT6LE2DY4tP45SVhUCaqoPhcP1x7Uipud71YNRNN7MWz61buBJWIa
         KnNre1ueV04832QeOIyaZx8I8CBKDAVX5F+clVSelbdWz19wdRGYaYBsLI3JAmblo8lA
         fvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793218070; x=1793822870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=45B3EYVV7L9uR4EJrE7Zfbp22ck+MWK5PE+WpGQpSrM=;
        b=ywfjEF/aa9GMFo9oo1v8rWeGxDYHu7/uQrWfbEyrSimrjr6Z3x0D+Cie+t3XCGvnJo
         Lxi5JzyvaABVmBaU60D8u3dCz1d3zMAuRfUw9DWAlvTITJRhMlapZsYDZT7lkpFhf9M8
         gdkCu/jzwZkVqCO7wxwlFqBmRoiG/pqWhGYc289U2xa0Haw4ZBN0oXUwIgox1ft7uYgL
         9vgFKQSAk9gX7DuH+sa8y6P0bpq4DSf7QICqvUTDFL5fRoMDOjWfXMUjfqYnkxbELki8
         GvYFwykND4T75eVYmjglUU5eCRTdMWlZF8w1M3QkY1vYNw4j0k/nxjGqAl6/8hteOhJc
         DP9w==
X-Forwarded-Encrypted: i=1; AKwUvBxm4VSxqnyBP03FjLIWr5gyJGd5HD+lv9D6UDgeDPvDEHblaRPvDdXOQZqyJhADNLtNRqJxFGBbwIWnfOI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgxihc/qSrAtlDtcfP5xD+Fh1fM53SZsztkdgojQ4vLRxOc0JR
	F4dNVAZQpE5vC6x9e23foXr8WYz16uD/mPscQnrOiURuHoC+jqM3V86Z
X-Gm-Gg: AYBFou3Kw7UYAlQut79xU/D3+Emo7lxInQOVwTiUn/AiVkkijjxoVPO04i48AZ0YStq
	CTbaIHT0HwKYCjF6VzvuGL5Hf2adiXk5GeaOiqbhKjBoLEaq8Ay37IfevaTIzf5MhK9Vd8Hlrjx
	g9hlUkAq01ueMHFf1dmRRfbwEIYsSB7GWxPlQDppc0pW+k3QaOB4USOEOo5TuKS7fLuGr8vofaK
	GPvxhx1rrlvlKwy258SG83esaCytnNWO0bCyatSzeSyRgm5GF39HEcrj+fdUMEoLRK9lh0sW2Bi
	0kzjdd4IoyDT0hj499gCZgnmzix9xAwDBkfrGS5fAJPhOqLduM6uQ5oZwRkWbiUsokG/eniaupG
	IpslAsQr1QJQUW8CQZd0X3ruSGQlEI2B8eGHD9b6t18goGJZDKFm97sGI5ZX2G8Ew3UE8frINSP
	mqL5jTyq3qkTryCyywf1c6LyzngBoAuRnNuWoLWqThXu+aqA8mStjy2ULz6u2VQcEc+mpYAoG7g
	86HsiGTtwclSf1IgzpkA1aHcCMY4sXodjkX3dy3cO9taHZd1lW3VxAzNxHbnSzgyUY9ZZyDAJY9
	UMS4meQz/XFKd4IqmUWE+NqkvO9sTnPvDHXCVq6EgvjzWwOoQMCK93XZzCCZ8KbGMi92Xf8=
X-Received: by 2002:a05:6820:1394:b0:70d:d3a7:24d3 with SMTP id 006d021491bc7-713ee089ee5mr1973598eaf.24.1793218070241;
        Wed, 28 Oct 2026 13:07:50 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7142cc3982esm2275539eaf.11.2026.10.28.13.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:07:49 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 3/3] selftests/nolibc: test fopen() errors and update modes
Date: Wed, 28 Oct 2026 15:07:43 -0500
Message-ID: <20261028200743.154151-4-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028200743.154151-1-danishkhateeb03@gmail.com>
References: <20261028200743.154151-1-danishkhateeb03@gmail.com>
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

Check that fopen() of a missing file fails with ENOENT, and that a
stream opened in "rb+" or "wb+" mode can be both read and written.

Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index f3d0d27cdbe1..be501b5298d7 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -1035,6 +1035,27 @@ int test_file_stream_wsr(void)
 	return 0;
 }
 
+/* checks that a stream opened with <mode> is readable and writable */
+int test_fopen_rw(const char *mode)
+{
+	FILE *f;
+	char c;
+	int r;
+
+	f = fopen("/dev/null", mode);
+	if (!f)
+		return -1;
+
+	/* reading /dev/null hits end-of-file, so a write may follow */
+	errno = 0;
+	r = fread(&c, 1, 1, f) != 0 || errno || fwrite("x", 1, 1, f) != 1;
+
+	if (fclose(f) == EOF)
+		return -1;
+
+	return r ? -1 : 0;
+}
+
 enum fork_type {
 	FORK_STANDARD,
 	FORK_VFORK,
@@ -1759,6 +1780,9 @@ int run_syscall(int min, int max)
 		CASE_TEST(fdopendir_notdir);  EXPECT_SYSER(1, (uintptr_t)fdopendir(STDIN_FILENO), (uintptr_t)NULL, ENOTDIR); break;
 		CASE_TEST(file_stream);       EXPECT_SYSZR(1, test_file_stream()); break;
 		CASE_TEST(file_stream_wsr);   EXPECT_SYSZR(1, test_file_stream_wsr()); break;
+		CASE_TEST(fopen_blah);        EXPECT_PTRER(1, fopen("/proc/self/blah", "r"), NULL, ENOENT); break;
+		CASE_TEST(fopen_rb_plus);     EXPECT_SYSZR(1, test_fopen_rw("rb+")); break;
+		CASE_TEST(fopen_wb_plus);     EXPECT_SYSZR(1, test_fopen_rw("wb+")); break;
 		CASE_TEST(fork);              EXPECT_SYSZR(1, test_fork(FORK_STANDARD)); break;
 		CASE_TEST(ftruncate);         EXPECT_SYSZR(1, test_ftruncate()); break;
 		CASE_TEST(getdents64_root);   EXPECT_SYSNE(1, test_getdents64("/"), -1); break;
-- 
2.56.0

