Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A292444E655
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456400; cv=none; b=WfDIvo8GgiWolaZRcStWcBQ2iP9vkeQUjhkdqQKOeO7L7n6oGEcdzELVjooBPNuLyqz4YMBPXBk3N6JKGd/hR75KRIwRdJq1z3b4K9sHInfRnH7ecuixH7lqkD7Z5BcEP8Jspm2tXIploYJWFydSbQJXMcTWn+P8b3dnpy8P0D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456400; c=relaxed/simple;
	bh=yB4DTPywDVS0kZaLiWSK4e+LQ75BupYNTAlBCvXkq8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ovc4jcTF0mvJcH6ZMEv2lYR57XFB1sRJFJUeW5jWgxyF5aTjot5vF6KaLaSwG9FgwYNwbonu5mnA5KxJPfCX+1ag93CU/UHuLA2lM5S2NIGB8oB7m4qcyBlXSe6uYq0Bfn1+tD01YMK2blrurdrqJxHPxHnInTCdMoY7b0AAClY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sYZs/A8u; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sYZs/A8u"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843172bff4so1380296f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789456397; x=1790061197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2PdkKNZ/AyrBmsE4RadQsZc68sMFv/kNqiw2CLuvNk=;
        b=sYZs/A8uGjtDlZKfJ64UJsspsmg8GAXmD+A4CnSUPlQohB5YkD+TxAVGm/J2gLROl/
         WsTg9ZpjdzAe0SBr5YoJJzdeFOvuYKMD+97y+ZhgJHRnLhLY1q7Fb11rxrA5Kpa03boY
         RG3vFzE6o95jt1vExy022oJMa2g8OlKJbV83WdO9eepMp5RJpQYfOznbdBdDEgnkxaDC
         YrySrwP5O/fxj2opuCQNeUVC/D9e26XIIM9etz4SZ+BPFKbZKU/KMS4eSQGlb/1g4mqP
         mdbNRXQhJAdYsFu1O9iCH/UM/NsUJqJ5dMNbeO5FWCOC0fUFxgIP0v+lE0e+BzppPRJJ
         jvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456397; x=1790061197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I2PdkKNZ/AyrBmsE4RadQsZc68sMFv/kNqiw2CLuvNk=;
        b=2QUcr+RmEZje1Qoe8mWi5akrvayeIQRYR6mA5XOipOMwgZhq5FUSGzczWKyN9HOg8e
         kk8TjJ5KWZu+qXKhLmwdQATV8qbA9UzvcaUC4ciP6HUVkPNT8FeyQX6kme4nj0WvTO0A
         YT8y+0esLgh3FQV1NhQeXDkmaxMBeiftD/9JQ2IKPvIG4B8jkdgE/b2m/+3LVB+ciQmU
         HQc5LVuPXtLv/i9h2ERY4Ycxsih4wsGcasnojG2VLyFyQGvxM9Puh2IFzzdcTAiWa9+8
         dqDSkAa3HWpB98dfI6ZPbeyDu6Y2CoakJPvSbSIs9iVCVAb2OWYy1q57fTNJ/S+119i3
         aoVg==
X-Forwarded-Encrypted: i=1; AKwUvBx2IHjoK1T+lkyXTCzhSGKF7Tg27JM2pIoQhyNyMXTItzRHDcsHU3dbaxfyaqtNSuUq5T+YvYrHaD/y0fI=@vger.kernel.org
X-Gm-Message-State: AFuF++kmm1/+p+ieJZyVnMF6HMUWCh/7wf+kTW/5RCm4BAezDeqAF1P7
	lgdb/fme2wB7xJ4jL7G+nhltixcenWeppdUl5zLX3UFanjwEd0C+R0V/
X-Gm-Gg: AYBFou2QHwNASm2qi/a74Kaaz7tHs0rvCSAVWWoaQ8uYiSYCKf1DuZ6P22KZ5zrbVv+
	diVTeMCexhHohIFv0Q7P+lgFx6XXeSeYsgGhbItO6AOaO7UYBYv28Jil/cgKuS4UrEWYKQA57/l
	c1fcfDSb+Pt1p14u+HOoFLIL/P82adsSTTr3HohCJ05JcLCKJY1XUbnGBZxQ2Qp4b29fo7w+mMH
	HSMmLS2UQud32QgMtPCOXT3rCOwVN/HMgnlUAjiMQKz8yShR2Kazg2eDhRVsoXzvluqtNZlxQLl
	JLapN3tsEDmqM96bkWGhRdRNypBUkKmM35eMTsG6DH5D1cIg73ofN5Pjtqp2L8SYvawIwUBhrJs
	Go5hM7cmAJgB/+ZC8Om7tiJDZfXFFI7oiga/wbOxkp9OeVKx0F6o3lP7d5w1nJyuUVaomA75AIm
	G/I7fSKFXyAP9v0p+dTGhOkN9vHamKmdtY3KG36jI9aq3NVRhkgijN8frOo5Ux0dPaL5zNUsD9I
	ptk2VU5zlAWcyaaH2SLoEH3o7mjYWAYzvgwlRE4Ei90tgpoZ6V1T0U6L4CKNGaj5GQxzsLoGmRF
	jVAjMUXMQg60QY89
X-Received: by 2002:a05:600c:4e89:b0:49d:7f5:4cdd with SMTP id 5b1f17b1804b1-49e7a68d80emr65338705e9.27.1789456396433;
        Tue, 15 Sep 2026 00:13:16 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d284a7bsm117889265e9.3.2026.09.15.00.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:13:16 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] MIPS: OCTEON: cvmx-l2c: add the CN66XX L2 geometry
Date: Tue, 15 Sep 2026 07:12:45 +0000
Message-ID: <20260915071306.15006-2-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915071306.15006-1-orgads@gmail.com>
References: <20260915071306.15006-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cvmx_l2c_get_set_bits() and cvmx_l2c_get_num_assoc() know the CN63XX as
the only OCTEON II part, so on a CN6635 both fell through to their
"Unsupported OCTEON Model" defaults: 2048 sets, and 8 ways which the
CN3XXX/CN5XXX fuse path - a read of L2D_FUS3, which is not a register
on OCTEON II - then shifted down to 2.

The CN66XX L2 has the CN63XX geometry, 16 ways and 1024 sets, and
reports its fused-off ways in MIO_FUS_DAT3[l2c_crip] like the rest of
OCTEON II, so name it in those three branches. With this the board
reports assoc 16, sets 1024, and cvmx_l2c_lock_line() computes the tag
alias from the right associativity.

The CN68XX and CN61XX are deliberately left alone: their L2 geometry
differs from the CN63XX, and the CN68XX also uses bit <2> of
MIO_FUS_DAT3[l2c_crip], which the decoding here does not handle. I have
no such board to test on.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
diff --git a/arch/mips/cavium-octeon/executive/cvmx-l2c.c b/arch/mips/cavium-octeon/executive/cvmx-l2c.c
--- a/arch/mips/cavium-octeon/executive/cvmx-l2c.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-l2c.c
@@ -773,7 +773,9 @@ int cvmx_l2c_get_set_bits(void)
 
 	if (OCTEON_IS_MODEL(OCTEON_CN56XX) || OCTEON_IS_MODEL(OCTEON_CN58XX))
 		l2_set_bits = 11;	/* 2048 sets */
-	else if (OCTEON_IS_MODEL(OCTEON_CN38XX) || OCTEON_IS_MODEL(OCTEON_CN63XX))
+	else if (OCTEON_IS_MODEL(OCTEON_CN38XX) ||
+		 OCTEON_IS_MODEL(OCTEON_CN63XX) ||
+		 OCTEON_IS_MODEL(OCTEON_CN66XX))
 		l2_set_bits = 10;	/* 1024 sets */
 	else if (OCTEON_IS_MODEL(OCTEON_CN31XX) || OCTEON_IS_MODEL(OCTEON_CN52XX))
 		l2_set_bits = 9;	/* 512 sets */
@@ -805,7 +807,8 @@ int cvmx_l2c_get_num_assoc(void)
 	    OCTEON_IS_MODEL(OCTEON_CN50XX) ||
 	    OCTEON_IS_MODEL(OCTEON_CN38XX))
 		l2_assoc = 8;
-	else if (OCTEON_IS_MODEL(OCTEON_CN63XX))
+	else if (OCTEON_IS_MODEL(OCTEON_CN63XX) ||
+		 OCTEON_IS_MODEL(OCTEON_CN66XX))
 		l2_assoc = 16;
 	else if (OCTEON_IS_MODEL(OCTEON_CN31XX) ||
 		 OCTEON_IS_MODEL(OCTEON_CN30XX))
@@ -816,7 +819,7 @@ int cvmx_l2c_get_num_assoc(void)
 	}
 
 	/* Check to see if part of the cache is disabled */
-	if (OCTEON_IS_MODEL(OCTEON_CN63XX)) {
+	if (OCTEON_IS_MODEL(OCTEON_CN63XX) || OCTEON_IS_MODEL(OCTEON_CN66XX)) {
 		union cvmx_mio_fus_dat3 mio_fus_dat3;
 
 		mio_fus_dat3.u64 = cvmx_read_csr(CVMX_MIO_FUS_DAT3);
-- 
2.47.0
