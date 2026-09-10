Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814373D3492
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022203; cv=none; b=JnmhvA2f55X5FRlF5qw7oXTD2mFB2A3vcE6rwlX+3pdXB5XCjSMiVy30JS7TK8nRXHaASwAY4tuICoj01C5nZw/D0Sqn/ioL+wnBsJiCumxZXjdtJ/RfHXhCe2NkdzkLGUiKH+X9FgGynDK3CV4naMMEEBNSbYUd31/i4pQUlDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022203; c=relaxed/simple;
	bh=Z/xuzhVwKiXOqQ0+szO9CMg0xobxzNfOPJ1um9M0KKs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y+bW6+4MHod9GjVd26N8GJiqUir4mzJVtaxl4aBe3a98a8HrNXc+AwTb29alZYXwwHp2uDt2M43q030f/TuXINdFzpC3rakJPdmP5rQ5NSIjzj1+jl58DW26OS0/fPZkBRgT8iAT1yk0BHp9JeQzonaKTvtlkPL04+pjN/qmU18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oyy+TGuY; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oyy+TGuY"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd6185db7so17535825e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022199; x=1789626999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b7aTmkgkOjMNLisksiT3PXivjuFocTpiOSE3RpArX7I=;
        b=Oyy+TGuYqs+oZwI+ScmE0pSVZm0KWaA9T3s5YDNqcm7UUcV5fDwxmXx40+Bojj4+rI
         PRsxoRIKLfmdeuUsC4KvhgloSTmadAN5kdIrm4IabJ0pLcNhaP9rujrXnk8M1/PZasMQ
         tTY0t98BkQ3yddTmzAkC3yDNjJvhZCjc38lvYKKxPvJ+v89KSQu7VeDeQ/aXtnC50naK
         ayQ/dm6wZIh4lnJdJ4vx+uyCPgl7jQ+zhyBLGVj5bT2Qbe0nH6BGP6x1189wgQEFHYjZ
         Sh46qyfo9eIWrq45AWYBWDsuyD3atJ1xRwWb7PpII486+q00vsVZ4JVmrkrForJEta+A
         fXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022199; x=1789626999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b7aTmkgkOjMNLisksiT3PXivjuFocTpiOSE3RpArX7I=;
        b=BtELZ9Y/XEVD056MejQg8DVEVEuQA7T2CDfYUCyODDNLZeYz+idJLMyDRrB45g8x/Y
         6QhfwqSJPSY5kW5zEbd6i0Z0a1C+8zTxtBmea7blY4Y+E8ppY2wXLZR0493a257mfLYI
         xqWNvci4ASjmEoWxl1gZvkvvw2qhe+oo5EAlwYKUpK8bkMLQ/bxAWKvoJk+MRek2rKVg
         xowyOqsBBXAf2CoXmasz+HEp1PlyiMxnzD5Dh+FQgrk+8k4facOIdoXR6A7qKVS5BIHN
         UUVm4xcm3B1nH/OBjIO4RxHxs44IaMLkKQ9kvoHjT+OjvzS32Y2UknN7L5ZbGMF013SO
         bSIw==
X-Forwarded-Encrypted: i=1; AKwUvBwvmjRqDqLhVeETyw5MhZccbYU3IdCfIoUAEIrulskqwVyHDk/xrP+WC6RH6v+QufQOnvUKFybBNxt540s=@vger.kernel.org
X-Gm-Message-State: AFuF++lhtS1+JhsQjBRQhwDNdmKEc3i1Becq38zZmHUeSxSUbgBV78Ka
	hqZW6Tcu608Sv+tuyfIwuvCAlCyzChQMGc9IqE7QIQ8V0tOXrP0tB1ii
X-Gm-Gg: AYBFou2wb3rAgTMjcL0wepEgDFEyTltWiwvl+ZnI3rE1x9Z0Kvocy6Oay7dEDisjH2m
	FhKtOS4A8dutQxtsHavNvtTnr30G/Q6u4oDLThpD7P1jaHPRgKwOL5lrqOhhMcj4H5+HSER+YeX
	aZ3lQiNCDj9F/YJuzzCDRb+lDLJgnV7c1+FM15xMCcCLnFp1OhAFKS2FENwwId0wrwmb1gE+kQ8
	2MNpj8vNxKQUJoTtpLzuyT6gw9Zf0P6+rcTSLspt/r2L3xkT06d+eOO8Hp3AiiLoe1woA/unjp+
	C9WTk3sAodCXTgNRIOoPBvC77pnDKVqw7H6YJpR5V6R5QGA9RQFJbNUavWNj+9GjH5397E6WPaz
	Oa4MOFnaLTA4VAlB67VokPyMfW1/tvFKz0/QZBpliyJndzzK/SimAfu5nvICT7+k/HVl18Cfphi
	5sqjIRUQ/Lo0REsrM58WmM1kseLspy5MPZEhBjW/9y8fzW65Y+oUFsSCGwt/XWQVuCJAYRsi0Xa
	Ic1t6CQMbp5Or13Zz2kKXQS6ZbegCX0NGvLeaShWBuguCwMn4rMeU7m6Wc70CWf6HkoKy0jClIf
	5mpdrXAxIpB+Y5ooMcLp46VqEiT/Wb3WnissL/gcmHLxQ1b8p8tM5X4P6N601xoq3+IFJ9Dn312
	XJT98fg==
X-Received: by 2002:a05:600c:68d5:b0:49b:4eb6:6ffd with SMTP id 5b1f17b1804b1-49d26d9efb9mr17702415e9.5.1789022198365;
        Wed, 09 Sep 2026 23:36:38 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b3d9-b901-0402-5aad-0ef4-88ac.310.pool.telefonica.de. [2a02:3100:b3d9:b901:402:5aad:ef4:88ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bfdb4asm47766655e9.11.2026.09.09.23.36.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 23:36:37 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christoph Hellwig <hch@lst.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] ARM: dma-mapping: flush FROM_DEVICE buffers on legacy backends
Date: Thu, 10 Sep 2026 08:36:20 +0200
Message-Id: <20260910063620.17768-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910063620.17768-1-kmehltretter@gmail.com>
References: <20260910063620.17768-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The legacy write-back cache backends invalidate DMA_FROM_DEVICE buffers
when ownership passes to the device. A plain invalidate can discard dirty
CPU cache lines. If the device writes only part of the buffer, untouched
bytes can expose memory contents older than those present at the handoff.

This was reproduced on the ARM926EJ-S (ARMv5TEJ) in a SAM9X75. A
mapping-only test lost 339,936 to 351,744 of 409,600 CPU-written bytes per
100-iteration run. In a separate usbfs test, a webcam returned short
isochronous packets into a buffer that usbfs had cleared. Across five
boots, the existing kernel exposed 29,403 non-zero bytes among 245,708
unwritten gap bytes to userspace.

With this change, five fresh 100-iteration runs on the same SAM9X75 board
each lost 0 of 409,600 bytes.

Use the existing clean-and-invalidate operation for DMA_FROM_DEVICE at
device handoff. The cache lines remain invalid after the handoff, but dirty
CPU data reaches memory first. Keep the existing no-op ownership-return
hooks. These backends already use the same operation for
DMA_BIDIRECTIONAL.

The XScale 80200 A0/A1 path already uses clean-and-invalidate for this case
and remains unchanged.

Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/mm/cache-fa.S      | 1 -
 arch/arm/mm/cache-v4wb.S    | 1 -
 arch/arm/mm/proc-arm1020.S  | 1 -
 arch/arm/mm/proc-arm1020e.S | 1 -
 arch/arm/mm/proc-arm1022.S  | 1 -
 arch/arm/mm/proc-arm1026.S  | 1 -
 arch/arm/mm/proc-arm920.S   | 1 -
 arch/arm/mm/proc-arm922.S   | 1 -
 arch/arm/mm/proc-arm925.S   | 1 -
 arch/arm/mm/proc-arm926.S   | 1 -
 arch/arm/mm/proc-arm940.S   | 1 -
 arch/arm/mm/proc-arm946.S   | 1 -
 arch/arm/mm/proc-feroceon.S | 2 --
 arch/arm/mm/proc-mohawk.S   | 1 -
 arch/arm/mm/proc-xsc3.S     | 1 -
 arch/arm/mm/proc-xscale.S   | 1 -
 16 files changed, 17 deletions(-)

diff --git a/arch/arm/mm/cache-fa.S b/arch/arm/mm/cache-fa.S
index e1641799569b..1ff3d66fe944 100644
--- a/arch/arm/mm/cache-fa.S
+++ b/arch/arm/mm/cache-fa.S
@@ -232,7 +232,6 @@ SYM_TYPED_FUNC_START(fa_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	fa_dma_clean_range
-	bcs	fa_dma_inv_range
 	b	fa_dma_flush_range
 SYM_FUNC_END(fa_dma_map_area)
 
diff --git a/arch/arm/mm/cache-v4wb.S b/arch/arm/mm/cache-v4wb.S
index 874fe5310f9a..87036c8bb318 100644
--- a/arch/arm/mm/cache-v4wb.S
+++ b/arch/arm/mm/cache-v4wb.S
@@ -244,7 +244,6 @@ SYM_TYPED_FUNC_START(v4wb_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	v4wb_dma_clean_range
-	bcs	v4wb_dma_inv_range
 	b	v4wb_dma_flush_range
 SYM_FUNC_END(v4wb_dma_map_area)
 
diff --git a/arch/arm/mm/proc-arm1020.S b/arch/arm/mm/proc-arm1020.S
index 4612a4961e81..c79f3c3e47a0 100644
--- a/arch/arm/mm/proc-arm1020.S
+++ b/arch/arm/mm/proc-arm1020.S
@@ -350,7 +350,6 @@ SYM_TYPED_FUNC_START(arm1020_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm1020_dma_clean_range
-	bcs	arm1020_dma_inv_range
 	b	arm1020_dma_flush_range
 SYM_FUNC_END(arm1020_dma_map_area)
 
diff --git a/arch/arm/mm/proc-arm1020e.S b/arch/arm/mm/proc-arm1020e.S
index b4a8a3a8eda3..a117e26e4763 100644
--- a/arch/arm/mm/proc-arm1020e.S
+++ b/arch/arm/mm/proc-arm1020e.S
@@ -337,7 +337,6 @@ SYM_TYPED_FUNC_START(arm1020e_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm1020e_dma_clean_range
-	bcs	arm1020e_dma_inv_range
 	b	arm1020e_dma_flush_range
 SYM_FUNC_END(arm1020e_dma_map_area)
 
diff --git a/arch/arm/mm/proc-arm1022.S b/arch/arm/mm/proc-arm1022.S
index 709870e99e19..63b4992f8ad2 100644
--- a/arch/arm/mm/proc-arm1022.S
+++ b/arch/arm/mm/proc-arm1022.S
@@ -336,7 +336,6 @@ SYM_TYPED_FUNC_START(arm1022_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm1022_dma_clean_range
-	bcs	arm1022_dma_inv_range
 	b	arm1022_dma_flush_range
 SYM_FUNC_END(arm1022_dma_map_area)
 
diff --git a/arch/arm/mm/proc-arm1026.S b/arch/arm/mm/proc-arm1026.S
index 02f7370a8c5c..c5e50395473b 100644
--- a/arch/arm/mm/proc-arm1026.S
+++ b/arch/arm/mm/proc-arm1026.S
@@ -331,7 +331,6 @@ SYM_TYPED_FUNC_START(arm1026_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm1026_dma_clean_range
-	bcs	arm1026_dma_inv_range
 	b	arm1026_dma_flush_range
 SYM_FUNC_END(arm1026_dma_map_area)
 
diff --git a/arch/arm/mm/proc-arm920.S b/arch/arm/mm/proc-arm920.S
index 0326067c6c75..e30b013432f0 100644
--- a/arch/arm/mm/proc-arm920.S
+++ b/arch/arm/mm/proc-arm920.S
@@ -299,7 +299,6 @@ SYM_TYPED_FUNC_START(arm920_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm920_dma_clean_range
-	bcs	arm920_dma_inv_range
 	b	arm920_dma_flush_range
 SYM_FUNC_END(arm920_dma_map_area)
 
diff --git a/arch/arm/mm/proc-arm922.S b/arch/arm/mm/proc-arm922.S
index 3fe6fdf0d325..b1ace8c664e2 100644
--- a/arch/arm/mm/proc-arm922.S
+++ b/arch/arm/mm/proc-arm922.S
@@ -301,7 +301,6 @@ SYM_TYPED_FUNC_START(arm922_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm922_dma_clean_range
-	bcs	arm922_dma_inv_range
 	b	arm922_dma_flush_range
 SYM_FUNC_END(arm922_dma_map_area)
 
diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
index 2d15467e4a08..3d91d16e4af0 100644
--- a/arch/arm/mm/proc-arm925.S
+++ b/arch/arm/mm/proc-arm925.S
@@ -357,7 +357,6 @@ SYM_TYPED_FUNC_START(arm925_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm925_dma_clean_range
-	bcs	arm925_dma_inv_range
 	b	arm925_dma_flush_range
 SYM_FUNC_END(arm925_dma_map_area)
 
diff --git a/arch/arm/mm/proc-arm926.S b/arch/arm/mm/proc-arm926.S
index d94aa8199452..bd335d703590 100644
--- a/arch/arm/mm/proc-arm926.S
+++ b/arch/arm/mm/proc-arm926.S
@@ -320,7 +320,6 @@ SYM_TYPED_FUNC_START(arm926_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm926_dma_clean_range
-	bcs	arm926_dma_inv_range
 	b	arm926_dma_flush_range
 SYM_FUNC_END(arm926_dma_map_area)
 
diff --git a/arch/arm/mm/proc-arm940.S b/arch/arm/mm/proc-arm940.S
index 545c076c36d2..ba7158639ab7 100644
--- a/arch/arm/mm/proc-arm940.S
+++ b/arch/arm/mm/proc-arm940.S
@@ -264,7 +264,6 @@ SYM_TYPED_FUNC_START(arm940_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm940_dma_clean_range
-	bcs	arm940_dma_inv_range
 	b	arm940_dma_flush_range
 SYM_FUNC_END(arm940_dma_map_area)
 
diff --git a/arch/arm/mm/proc-arm946.S b/arch/arm/mm/proc-arm946.S
index f3d4e18c3fba..a135c654b854 100644
--- a/arch/arm/mm/proc-arm946.S
+++ b/arch/arm/mm/proc-arm946.S
@@ -306,7 +306,6 @@ SYM_TYPED_FUNC_START(arm946_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm946_dma_clean_range
-	bcs	arm946_dma_inv_range
 	b	arm946_dma_flush_range
 SYM_FUNC_END(arm946_dma_map_area)
 
diff --git a/arch/arm/mm/proc-feroceon.S b/arch/arm/mm/proc-feroceon.S
index 7f08d06c9625..dbaf01ba7cb5 100644
--- a/arch/arm/mm/proc-feroceon.S
+++ b/arch/arm/mm/proc-feroceon.S
@@ -391,7 +391,6 @@ SYM_TYPED_FUNC_START(feroceon_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	feroceon_dma_clean_range
-	bcs	feroceon_dma_inv_range
 	b	feroceon_dma_flush_range
 SYM_FUNC_END(feroceon_dma_map_area)
 
@@ -405,7 +404,6 @@ SYM_TYPED_FUNC_START(feroceon_range_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	feroceon_range_dma_clean_range
-	bcs	feroceon_range_dma_inv_range
 	b	feroceon_range_dma_flush_range
 SYM_FUNC_END(feroceon_range_dma_map_area)
 
diff --git a/arch/arm/mm/proc-mohawk.S b/arch/arm/mm/proc-mohawk.S
index 4669c63e3121..7df85a32f7b5 100644
--- a/arch/arm/mm/proc-mohawk.S
+++ b/arch/arm/mm/proc-mohawk.S
@@ -287,7 +287,6 @@ SYM_TYPED_FUNC_START(mohawk_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	mohawk_dma_clean_range
-	bcs	mohawk_dma_inv_range
 	b	mohawk_dma_flush_range
 SYM_FUNC_END(mohawk_dma_map_area)
 
diff --git a/arch/arm/mm/proc-xsc3.S b/arch/arm/mm/proc-xsc3.S
index fd25634a2ed5..6c5910bcc211 100644
--- a/arch/arm/mm/proc-xsc3.S
+++ b/arch/arm/mm/proc-xsc3.S
@@ -332,7 +332,6 @@ SYM_TYPED_FUNC_START(xsc3_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	xsc3_dma_clean_range
-	bcs	xsc3_dma_inv_range
 	b	xsc3_dma_flush_range
 SYM_FUNC_END(xsc3_dma_map_area)
 
diff --git a/arch/arm/mm/proc-xscale.S b/arch/arm/mm/proc-xscale.S
index d8462df8020b..86422559d91e 100644
--- a/arch/arm/mm/proc-xscale.S
+++ b/arch/arm/mm/proc-xscale.S
@@ -390,7 +390,6 @@ SYM_TYPED_FUNC_START(xscale_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	xscale_dma_clean_range
-	bcs	xscale_dma_inv_range
 	b	xscale_dma_flush_range
 SYM_FUNC_END(xscale_dma_map_area)
 
-- 
2.53.0
