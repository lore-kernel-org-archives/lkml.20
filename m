Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6229364941
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 20:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787949170; cv=none; b=nCGs6L7ihck2fWfXAHSFWlUw7M4SrYCHf6m1jZGtDbwDfm3ZVrguSH2XKE7SLOGUSO0jhMLFN+cshJGeca/zUB+72Wt4iFJwynqfvtfxJSFJQQHTV5uh3btoeNBp0KBFdxSzQQi/9sEptzGPPwHFBtC9QuR6gDG4YaLOyoQ3mtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787949170; c=relaxed/simple;
	bh=L0GPDlMwgRHPBrGDsJLCwygoIQ5B+ueaOAchdw4SIGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IZkj7Cq/RO0UjVKYwMyUenEEgkSO2flPDv87bKgZunNDTmQIKOpbZL5M1+AQQVRi4g7QaFWbKRJU7dYPaq68JZrD5ZOZzH5oXAaFSE+AlCq7sGE/pdi6EIa8eDD98IsqqSMva3ffYhFC6NxN09d9/VJRouzpx001mrkK1dZp3QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=QX8hKQnI; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="QX8hKQnI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=C/keNu9YOo7zAzx95aDUptk6EtzUmbckhpZVCqPPVXs=; t=1787949168; x=1789158768; 
	b=QX8hKQnIm9aN2VuusTRWCcC0AXyh2n7Q2M28XkekNi+uK1yttWrrOVe0toatFSe/4mrnWXzrB3E
	j+3Y/+SA4ca4aEwsTyM8Euk+qoKVkJiW/cd3KjDCKw2yaH3fz92DapfSd1pek1O2VHiYZz5Ixso3G
	pVJLAaVyCJ5JEBHstPIY5WTskvJkHw7ptz2iV6o8fmugt/UFMf96eJ30Au5TXV0zWNEUb5urtUHgs
	MF53rGWRJUoNkvUnSzXPzQztdn2mIh/9ccFaCJFOS7lC4bz2Jwg+npkyV7Y48XJ91AVP4Y8yCvOrR
	N1dBJMOZFwYiaxFWYvvmu3StaJR9F3jjGrWw==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Fri, 28 Aug 2026 22:32:19 +0200
Subject: [PATCH v2 1/3] ARM: compressed: Pass the actual output length to
 the decompressor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260828-zstd2-v2-1-4d9ce7150877@kemnade.info>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3671; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=/L/veojh/62XQryZCdewjJj5pfYPoiKhGTtsVvoXBR0=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDFkTP6RterV32emUhIOB0b79nl5Rq+Ritp9OnRgiPeXLg
 UsNVvpOHaUsDGJcDLJiiiy/rBXcPqk8yw2eGmEPM4eVCWQIAxenAEzkszwjw/EU0f8bdxcp5ftn
 L1moxrTk/3uPnTetdXhyLn3MM2mcUs/I8I4hRSvd9ZdtZkPMqceWTt9Yo6duTP6S90Hikam3Ak8
 +NwA=
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

From: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

ZSTD writes outside of the space that is necessary for the uncompressed
data, when it is told it has unlimited output length. To fix this, pass
the actual output length (the length of the uncompressed kernel) to the
decompressor.

The uncompressed length is already stored as a little endian 32-bit
constant before the input_data_end symbol.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Reviewed-by: Tony Lindgren <tony@atomide.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/compressed/decompress.c |  4 ++--
 arch/arm/boot/compressed/misc.c       | 10 +++++++++-
 arch/arm/boot/compressed/misc.h       |  3 ++-
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/compressed/decompress.c b/arch/arm/boot/compressed/decompress.c
index 0669851394f04..b0352f379277f 100644
--- a/arch/arm/boot/compressed/decompress.c
+++ b/arch/arm/boot/compressed/decompress.c
@@ -60,7 +60,7 @@ extern char * strchrnul(const char *, int);
 #include "../../../../lib/decompress_unlz4.c"
 #endif
 
-int do_decompress(u8 *input, int len, u8 *output, void (*error)(char *x))
+int do_decompress(u8 *input, int len, u8 *output, int outlen, void (*error)(char *x))
 {
-	return __decompress(input, len, NULL, NULL, output, 0, NULL, error);
+	return __decompress(input, len, NULL, NULL, output, outlen, NULL, error);
 }
diff --git a/arch/arm/boot/compressed/misc.c b/arch/arm/boot/compressed/misc.c
index 6c41b270560e1..58826885ccc82 100644
--- a/arch/arm/boot/compressed/misc.c
+++ b/arch/arm/boot/compressed/misc.c
@@ -22,6 +22,7 @@ unsigned int __machine_arch_type;
 #include <linux/compiler.h>	/* for inline */
 #include <linux/types.h>
 #include <linux/linkage.h>
+#include <linux/unaligned.h>
 #include "misc.h"
 #ifdef CONFIG_ARCH_EP93XX
 #include "misc-ep93xx.h"
@@ -128,14 +129,21 @@ asmlinkage void __div0(void)
 	error("Attempting division by 0!");
 }
 
+static u32 get_inflated_image_size(void)
+{
+	return get_unaligned_le32(input_data_end - 4);
+}
+
 void
 decompress_kernel(unsigned long output_start, unsigned long free_mem_ptr_p,
 		unsigned long free_mem_ptr_end_p,
 		int arch_id)
 {
+	unsigned long output_data_len;
 	int ret;
 
 	output_data		= (unsigned char *)output_start;
+	output_data_len         = get_inflated_image_size();
 	free_mem_ptr		= free_mem_ptr_p;
 	free_mem_end_ptr	= free_mem_ptr_end_p;
 	__machine_arch_type	= arch_id;
@@ -147,7 +155,7 @@ decompress_kernel(unsigned long output_start, unsigned long free_mem_ptr_p,
 
 	putstr("Uncompressing Linux...");
 	ret = do_decompress(input_data, input_data_end - input_data,
-			    output_data, error);
+			    output_data, output_data_len, error);
 	if (ret)
 		error("decompressor returned an error");
 	else
diff --git a/arch/arm/boot/compressed/misc.h b/arch/arm/boot/compressed/misc.h
index 8c73940b5fe46..ec8de2388f0ec 100644
--- a/arch/arm/boot/compressed/misc.h
+++ b/arch/arm/boot/compressed/misc.h
@@ -13,7 +13,8 @@ decompress_kernel(unsigned long output_start, unsigned long free_mem_ptr_p,
 void __fortify_panic(const u8 reason, size_t avail, size_t size);
 int atags_to_fdt(void *atag_list, void *fdt, int total_space);
 uint32_t fdt_check_mem_start(uint32_t mem_start, const void *fdt);
-int do_decompress(u8 *input, int len, u8 *output, void (*error)(char *x));
+int do_decompress(u8 *input, int len, u8 *output, int outlen,
+		  void (*error)(char *x));
 
 extern char input_data[];
 extern char input_data_end[];

-- 
2.47.3

