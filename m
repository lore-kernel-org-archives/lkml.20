Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF6B35F5E4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 20:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787949170; cv=none; b=dDONPCi7nBaqZ2lKziQfcSKuey7TPRIrxYka07puL+6OawjODXZn+GF4uxBX9KT7k6iqDUPJgc3eCmSPwGjkHlCB6mmW9VO7d1tgdwOHd3nPNt9RBs1RfbsQeqY1t1LNfZmgbzI9mv+oHy6Pg+BalWE5gRQ8pQbSuhKEOz9n03A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787949170; c=relaxed/simple;
	bh=/hLy7jiHkvVQqauhpnzFaBQ2niZctuMgZJb64e4wEBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jg82U4LJylMOeatRJMrvG45Epml4rU1O3APGBg+0SieznKFb8TfPIVOG/jhlgBZJmBoTQB/FAy1jwOkL24SR+xOLCceDrihnrTR5AFLT0Bgo08xmZiSZo+viY+Ky+CHvX8J1nwo9qUyjtWM7ae/DKqX5p8j3m/yCogRGK+QCw/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=HYALtHNU; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="HYALtHNU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=+X15T1fcpe3iI6rFk13FMG/iW6iRWR1lKoh9bfasM84=; t=1787949168; x=1789158768; 
	b=HYALtHNUwYvHCBcLZTNsCHf3B4vOCV5fRwhACKtAbrtqy+98TB6sUiBsLufWQHTpNIv8+fqANih
	/gvMm5AHhfdjC8rZsxVM0jaRVrCUaWU+qpmXwfmK/gVNzZoQjRnuCGAjiHkThar9XiiNBC5+JSX4s
	N/ty+IeMsSG1Dy9y6xqDP/wgpAQVnLnQsv5g1shRZvAONq1WZ2Zc/0SRYWJHXLmJvOIxm4H4K98HN
	LHWdWSUBbOxpgu6iTsgKjWa4SVj+/2A+t1EhUQ7d/eJroCAOK5rrrH/OrvSjmEaTYfmZAqRrQesRX
	G4CCHnWy1b5/K5EiVoNTdLbbvgDU5UBNnolQ==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Fri, 28 Aug 2026 22:32:20 +0200
Subject: [PATCH v2 2/3] ARM: compressed: Bump MALLOC_SIZE to 128 KiB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260828-zstd2-v2-2-4d9ce7150877@kemnade.info>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=+UrMNo6HSjDQ27FgGwmv5HaqBYMyLiKEYeg3oyNuDMc=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDFkTP6S9P3iq0d376Mv4M4/nBGmZ2N7PDAysjupRdFcoX
 OG+S6yho5SFQYyLQVZMkeWXtYLbJ5VnucFTI+xh5rAygQxh4OIUgIm8d2RkuJcTfOn/3tKp5wJa
 35cvFvnoYq0fEnfaTTwwfcryarkfLowMx3LOeR9tz79yPi56Y7LM9u3vH3/pW+WgzJo3o9+h8Zc
 5KwA=
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

From: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

The ZSTD compressor needs about 100 KiB.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/compressed/Makefile | 2 +-
 arch/arm/boot/compressed/head.S   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index e3f550d628578..fa6ee23cd72eb 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -62,7 +62,7 @@ ZTEXTADDR	:= 0
 ZBSSADDR	:= ALIGN(8)
 endif
 
-MALLOC_SIZE	:= 65536
+MALLOC_SIZE	:= 131072
 
 AFLAGS_head.o += -DTEXT_OFFSET=$(TEXT_OFFSET) -DMALLOC_SIZE=$(MALLOC_SIZE)
 CPPFLAGS_vmlinux.lds := -DTEXT_START="$(ZTEXTADDR)" -DBSS_START="$(ZBSSADDR)"
diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
index 9f406e9c0ea6f..23fbbe94da6e8 100644
--- a/arch/arm/boot/compressed/head.S
+++ b/arch/arm/boot/compressed/head.S
@@ -337,7 +337,7 @@ restart:	adr	r0, LC1
 		get_inflated_image_size	r9, r10, lr
 
 #ifndef CONFIG_ZBOOT_ROM
-		/* malloc space is above the relocated stack (64k max) */
+		/* malloc space is above the relocated stack (128k max) */
 		add	r10, sp, #MALLOC_SIZE
 #else
 		/*
@@ -629,7 +629,7 @@ not_relocated:	mov	r0, #0
  */
 		mov	r0, r4
 		mov	r1, sp			@ malloc space above stack
-		add	r2, sp, #MALLOC_SIZE	@ 64k max
+		add	r2, sp, #MALLOC_SIZE	@ 128k max
 		mov	r3, r7
 		bl	decompress_kernel
 

-- 
2.47.3

