Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D7A370AEB
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 20:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787949170; cv=none; b=lUpLvj9OCN1jTs9PlrPk9bRYcQW/k4ZiPEMZaWik77r6z/lapR3KW8jqn84aFkmjBcXAeNLG8NNyBMz+PJJ4CEm/goZRvhEh/kmxUqKdJbJ/lzJOjxanNvPHtC80fUtcr+GpEM36TyGt1NYxKuieX+Z55fGDI8l3Sr2VWUBRBsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787949170; c=relaxed/simple;
	bh=6pP3PP/XJQVJ+6OA0XXV7DTtOLM6WgYYELukGIdg+4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sh1/pdlsoV9gDjrDZk0pwi6yU29W0GXZMBZjFhSE7JjUZ8TeftIVfPvUuhaf7840EyB0UJlp4BEO0CWmndp4PbmMQEhRdH86srNE/jFvRFprHmyFaDHODRW1RfnuOZLXYEFJHUzyEdVrfPM1C3oxad/Kn4otqYzfb7lwaT74+UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=1oLwS5PE; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="1oLwS5PE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=xD32YxabsHZLtPd2fWQoozGihUGIxltQHFZiqEPPor4=; t=1787949169; x=1789158769; 
	b=1oLwS5PEhrnsGXnMQbpaP8TObYyDi7meGoKrA4IuSYHepYOuw4IKBDYApXvpVJY3qZJ1uyXWP1t
	yDDw/aRlZkiTv7CZRKOfXGH4O09tax6tJ4UbeN/wYnZT8n8C/1VJIpLTftpl50KZfsxTK4F3+RyBi
	of+ijRNwcdUsZXymzDryps9L63MBE1zJrrzUnHwJriyqC2aBSbbmO0zVmMlWDAafq77j1jDL+5lBj
	4W80z8xeurCIlHHn6r7W48vr64z2SQl+wz3OR3zFwGFLYkGwYqw0RPvoR7tByKDSisl/6Y9VaCcco
	el0FICgYNWfMhPtVN+TP7/8gnoGqBDlJ/EKg==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Fri, 28 Aug 2026 22:32:21 +0200
Subject: [PATCH v2 3/3] ARM: compressed: Enable ZSTD compression
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-zstd2-v2-3-4d9ce7150877@kemnade.info>
References: <20260828-zstd2-v2-0-4d9ce7150877@kemnade.info>
In-Reply-To: <20260828-zstd2-v2-0-4d9ce7150877@kemnade.info>
To: Russell King <linux@armlinux.org.uk>, Nick Terrell <terrelln@fb.com>, 
 David Sterba <dsterba@suse.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, j.neuschaefer@gmx.net, 
 f.fainelli@gmail.com, Tony Lindgren <tony@atomide.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2984; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=6pP3PP/XJQVJ+6OA0XXV7DTtOLM6WgYYELukGIdg+4k=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDFkTP6QVHBa0Ky0S3VbdYt0g6r1QyfeA+ZLo4O+++S3hr
 nN2mm/tKGVhEONikBVTZPllreD2SeVZbvDUCHuYOaxMIEMYuDgFYCK7LBgZji3fOHHJm4uxmq0d
 G/jnXvv2bIphY5FW1sV392pCGdOu3GH4p15ZLLCo5cHWGU47vpT/FLGR2bnF78yTOfdkr642V//
 7mQ8A
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

With the previous two commits, it is possible to enable ZSTD
in the decompressor stub for 32-bit ARM.

KASAN logic for XZ is extended for ZSTD, since
the affected functions are also in use.

Measurement was done with clang-19.
Setup was: starting a fastboot image via u-boot,
serial console attached.
Time was measured using ts -s %.s </dev/ttyUSBx | tee logfile
from the last words from u-boot still the first
kernel message. No early serial output was in use.

GTA04 (OMAP3) with something based on omap2plus_defconfig:
     zImage size	time
GZIP 7997 KiB		1.6s
LZMA 5794 KiB		4.6s
ZSTD 6774 KiB		2.7s

Tolino Shine 2 HD (i.MX6SL) with something based on imx_v6_v7_defconfig

GZIP 10499 KiB		 0.9s
LZMA 7611 KiB		 3.8s
ZSTD 8884 KiB		 2.0s

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/Kconfig                      |  1 +
 arch/arm/boot/compressed/Makefile     |  1 +
 arch/arm/boot/compressed/decompress.c | 11 ++++++++++-
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9187240a02db5..cf612ee4064c3 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -122,6 +122,7 @@ config ARM
 	select HAVE_KERNEL_LZMA
 	select HAVE_KERNEL_LZO
 	select HAVE_KERNEL_XZ
+	select HAVE_KERNEL_ZSTD
 	select HAVE_KPROBES if !XIP_KERNEL && !CPU_ENDIAN_BE32 && !CPU_V7M
 	select HAVE_KRETPROBES if HAVE_KPROBES
 	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if (LD_VERSION >= 23600 || LD_IS_LLD) && LD_CAN_USE_KEEP_IN_OVERLAY
diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index fa6ee23cd72eb..1c6638e1999ab 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -74,6 +74,7 @@ compress-$(CONFIG_KERNEL_LZO)  = lzo_with_size
 compress-$(CONFIG_KERNEL_LZMA) = lzma_with_size
 compress-$(CONFIG_KERNEL_XZ)   = xzkern_with_size
 compress-$(CONFIG_KERNEL_LZ4)  = lz4_with_size
+compress-$(CONFIG_KERNEL_ZSTD)  = zstd22_with_size
 
 libfdt_objs := fdt_rw.o fdt_ro.o fdt_wip.o fdt.o
 
diff --git a/arch/arm/boot/compressed/decompress.c b/arch/arm/boot/compressed/decompress.c
index b0352f379277f..5f82c0c754fa5 100644
--- a/arch/arm/boot/compressed/decompress.c
+++ b/arch/arm/boot/compressed/decompress.c
@@ -47,15 +47,24 @@ extern char * strchrnul(const char *, int);
 #include "../../../../lib/decompress_unlzma.c"
 #endif
 
-#ifdef CONFIG_KERNEL_XZ
+#if defined(CONFIG_KERNEL_XZ) || defined(CONFIG_KERNEL_ZSTD)
 /* Prevent KASAN override of string helpers in decompressor */
 #undef memmove
 #define memmove memmove
 #undef memcpy
 #define memcpy memcpy
+#undef memset
+#define memset memset
+#endif
+
+#ifdef CONFIG_KERNEL_XZ
 #include "../../../../lib/decompress_unxz.c"
 #endif
 
+#ifdef CONFIG_KERNEL_ZSTD
+#include "../../../../lib/decompress_unzstd.c"
+#endif
+
 #ifdef CONFIG_KERNEL_LZ4
 #include "../../../../lib/decompress_unlz4.c"
 #endif

-- 
2.47.3

