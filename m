Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE3A4457C5
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790430221; cv=none; b=eUy/r10glgN00uvKh7unGs8XlQx53m/hCb0ea/Hd48dnKoVPL9eaxJb1WjouWf0ucAGjg/xxZQVwZjwdL30hKbPyWiZwBQqt02vDN5hQG4bidklX+YuW2zps9KviAEL05zqBhAPhnHbnYWIlmPqqZQBlVTh067lwvAkKopziUME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790430221; c=relaxed/simple;
	bh=p8q8S+t50Q/lthBy7TyZdCyK2F1VHCzwEkcLBr2vUDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D6+5bjcZPN8cVX8gzhB/bOpzhFQ+PR5tnLB0ONFw2gzBahzJn/7XKeZtpwdGua23KbwVJKIYIyGAI5juijA2xpBgWbhNOMZBIXU5yR4Fwqt4cm5YWOli43DOuZnfnJOIZ1RutM20ZC9yboB5ie/t3TUQFUZ3M2ri+95HNp8it2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7LLUJEl; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7LLUJEl"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4678d3e490bso2015117fac.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790430219; x=1791035019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wesr4wlntThYfZMKHQxMphlwtEmOCUFLraCacdEeC6k=;
        b=O7LLUJElr0QijasfqzYdKLAVRU8Cl6AWl7oktKCszr47ARk8Tbj7zi/hJ7U/qa2KsN
         QGw/8iyMaxLYGcvXPebgvQDcRa3+NGn3AS72LtJFY4aW9LY8KM4Ke0S8eu6NGkalRV4h
         EKFCRmkCxsqjE3iSEVa3Cqw702O8cz7P0k0xNsYVpXbyV1fpngAf7yhR9gy5nVpJmNin
         1RFnUVaUdvmOmkf840x7gVkLuUHSXawZb9+4HyEDKnaFyNsS57QkaqB3uoGtDn3JD9wM
         JwDbBzWJ215x51loVFVOyIjiY4C0sf0QwLZfcpMGxwNNAGFCE4lsKfXhSexWNmPIOuhJ
         sCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790430219; x=1791035019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wesr4wlntThYfZMKHQxMphlwtEmOCUFLraCacdEeC6k=;
        b=a8/T2wQlUnoB03AwwV+1WHE7wpRctRV6bCHgHUsQRVI0/NTcNKP+PuBpF1tNuMLffz
         C/xX1yOuuMMPQ2TPP/4ATlU08fGcCTwssOURzPXoC+4gJ0SPZDeFGDlsY+ColX/nL8Jc
         cWcuRyc4yB0aVOgVRvSLJR1s+/y7XcUt7SSF3r7nsHQm+fwMYFd/N9jm4Z/qJiPIpcdK
         UasrA9EjaSDluJHCrvRA+LpAVrPoPFEY6YqEo75TUaurZMnpJL686Nb6lLhf3UpsmoLg
         0huCSTZVdPiDdMMmmdIy1qMqrSzkMM4y+wDse7RMBwEbvob/qnGF+0tPdqP57CVxuhL4
         2ONg==
X-Forwarded-Encrypted: i=1; AKwUvBzZvmXPb4H7ollhPxMfgDrSxq5hdJSiHV2Wkrc+t104Z0z3jgmMH4NLET2262FJzq1p/0uKAsJKJeLgIr0=@vger.kernel.org
X-Gm-Message-State: AFuF++lCQ/kdaxM9wk99Rbg1PKamBotiPusFupBtxN5PWDI6fLHTrN4I
	5hHlDCvPn0j+ttsPp72XskkYcthBzOxrkTZ3S3Wnw3iUiQFKwI6H9FBG
X-Gm-Gg: AYBFou2NcwtXgHeivCKJoRv3XDndET3e0gX39snwoT7TWXPTAPV5F79GufaJhrWqd34
	v2HE7mIeaiA48vmmgezFsu2TbUVBsTL6cW5rM1HUPTmjUrS1fv2nwomQDQpKwmCemIGX8bfq+Qe
	lxJg1bhxnxaYQF9xbg4duXNG6LgmVn7sKvnZh9OJLPh1+63119RTCLOUvEPsBdpCHcuAb6bs4B8
	bizxFBN2TJzkUUB29jaPbOjd7/fYvBdb9+VilquEwkgO1Xib5n4zHs8Ot9edfOl7Z0WS/ZH5FQ+
	r3ChaYd2u0GcsFGG/yMPWNeHz+hIyZdddlqe+6nsOzxLWMdIwMffeYUrmOIo77TXwxFHojjFwIW
	E2ALgcSrEtim4/N053KoR6We9OCuTU2IWLH/knTLdYvfDNJ6BoNhJoctF9CzoRtHd5Gdb9x2PTP
	RyVd70+0VSMPJHkgzotb/1ICZnPauYY5DbUYTSNnr137fXJStLss6rhabx0Nn8ugXI6v5IjKho3
	8IB1DcGdDB0SLuG/v+77OlyI6OMkvWGN3Tim0CZrYuPHWCnaNSj
X-Received: by 2002:a05:6808:f04:b0:4d6:9133:cfe1 with SMTP id 5614622812f47-4d72cd36157mr8644772b6e.38.1790430218897;
        Sat, 26 Sep 2026 06:43:38 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf3d74281sm4452874b6e.5.2026.09.26.06.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 06:43:37 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 1/2] tools/nolibc: check for overflow in malloc()
Date: Sat, 26 Sep 2026 08:43:31 -0500
Message-ID: <20260926134332.58184-2-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926134332.58184-1-danishkhateeb03@gmail.com>
References: <20260926134332.58184-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

malloc() adds the size of its header to the requested size and rounds
the sum up to a multiple of 4096, without checking either step for
overflow. For a size within the header size of SIZE_MAX, the sum wraps
around to a few bytes, and malloc() returns a single page instead of
NULL. For a slightly smaller size, the rounding wraps around to 0, and
malloc() fails with EINVAL from mmap() instead of ENOMEM.

calloc() checks its multiplication for overflow, but then passes the
product to malloc(), so calloc(SIZE_MAX, 1) returns a single page too.
So does realloc(ptr, SIZE_MAX).

Such a size is usually a bug in the caller, for instance a length of -1
used as a size_t, and returning a page instead of NULL can turn it into
a heap overflow.

Fail with ENOMEM when adding the header or rounding up overflows, as
glibc does for sizes this large.

Fixes: 0e0ff638400b ("tools/nolibc/stdlib: Implement `malloc()`, `calloc()`, `realloc()` and `free()`")
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/include/nolibc/stdlib.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/include/nolibc/stdlib.h b/tools/include/nolibc/stdlib.h
index 6c3c620a04cf..ea315e60cdeb 100644
--- a/tools/include/nolibc/stdlib.h
+++ b/tools/include/nolibc/stdlib.h
@@ -130,9 +130,15 @@ void *malloc(size_t len)
 {
 	struct nolibc_heap *heap;
 
-	/* Always allocate memory with size multiple of 4096. */
-	len  = sizeof(*heap) + len;
-	len  = (len + 4095UL) & -4096UL;
+	/*
+	 * Always allocate memory with size multiple of 4096, and reject sizes
+	 * which would wrap around once the header is added and rounded up.
+	 */
+	if (__builtin_expect(__builtin_add_overflow(len, sizeof(*heap) + 4095UL, &len), 0)) {
+		SET_ERRNO(ENOMEM);
+		return NULL;
+	}
+	len &= -4096UL;
 	heap = mmap(NULL, len, PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE,
 		    -1, 0);
 	if (__builtin_expect(heap == MAP_FAILED, 0))
-- 
2.55.0

