Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326358;
	b=zY2FHoR46Wc3cwfq50XZp7ei8Apuji1jtffTLxjjrCjtgzi8X5+pImSTQcYyWFcFh6lN
	 yxd5H52ndDNB/JLAqgbSlRNYTBwiI39hrbOr0/2ZpzBWB9yCEGEFZJcuYYyikJ3f9bbcj
	 lEe1mpotj93THPCnDclxjO9075Y4zg6Kcu50KUkKAkPasXRMFXtptPrFuq+VyprbxcfqD
	 AcXBRwUCmT+U+fM+RE0YY8EtUNrAungxCh5pL4QF+QQtLH50HeXaMcb2kdXyzPuInvWDj
	 NTybk6uizVHVikZDC3CxtgIuEZaAcCVBmAcQkltLwJ9e69R19/zyn2oAxJh7oJfaveg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326358;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Developer-Signature:
	 X-Developer-Key;
	bh=lEabkiC/Ybfiru/RWBye/yDf2gxFnmL48E8IBSedPQc=;
	b=khAQ2X4O0dtBDEK2eAjGc+xf3DBSng5jKugXXrSa/ARaNfyLQe1u2uqFEck8dGKyMegV
	 wuesdex3sv3Jli6VtVDwUWpoBbkpjngs99Cux46YUiKYWcM6ikFDnRLcA8rcJNXYCHA2m
	 d6L2OVguJ/mYWPol+kf+4bR8Ur4pKKcnG1CWCXoLWoRHJs1v48o+31EXrTBl1oRIw5Fki
	 NJ96mq7Meu/1rvjVkclP7H0oKMNroCdVdZHhDLUDUYa6vNQouCeNcpjBBtHi8QNUcEYb+
	 ehjvveGEBIAjzoKg425s5VFsOSjuNIIAvUwSuVaoSJPYKX10KJObiyoIFuwwcZ8bLpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens-energy.com;
	spf=pass smtp.mailfrom=errorhandling.siemens-energy.com;
	dkim=pass header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=brx5czeP;
	dkim=pass header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=CZD1n2qS;
	arc=none smtp.remote-ip=185.136.64.131
Received: from mta-64-131.flowmailer.net (mta-64-131.flowmailer.net [185.136.64.131])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CB0606A330
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42CB0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=errorhandling.siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=brx5czeP;
	dkim=pass (2048-bit key, unprotected) header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=CZD1n2qS
Received: by mta-64-131.flowmailer.net with ESMTPSA id 2026111015590721fd7b5c3b0019fd50
        for <linux-kernel@vger.kernel.org>;
        Tue, 10 Nov 2026 16:59:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=s1;
 d=flowmailer.net;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=lEabkiC/Ybfiru/RWBye/yDf2gxFnmL48E8IBSedPQc=;
 b=brx5czePRqn968MFua4u+YokMj7AfFu7NKh4bwo3Ds9O1tskGKPNBMfa5VhnrhE0ouPtr9
 cdpZR8ZnYRmdOLb1DFzfDXQokyaRp8hdbRB2GmFNR4+iXXZBZ0OT/p/6Se0Ld62wDiy560Do
 wxlXlqLgf3A4lJQMVXazbTbdbvpmo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm4;
 d=siemens-energy.com; i=schuster.simon@siemens-energy.com;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=lEabkiC/Ybfiru/RWBye/yDf2gxFnmL48E8IBSedPQc=;
 b=CZD1n2qS5mcc4oeMl3qRXUAVwDxtFDD5ewg7LRE/7qQ4hidXlw2mT3p0CIbFmLMQvF+2Sq
 e/GEoyfBa6h+z3I8bpPOeegluDlQ1xUQioJwy9stAfSR8MKOlRF0vZtpaz7asonajpUC6ZxA
 kJEJ5JMeWntW+A/0uZZ6z6Pl885gq4KSC5/YfdDt6kxUEqHUOHCpZfbAkvSQva0pmuki0V6j
 Qy+XN8upxPtU+/YaiNBJ+U15HiZxrj2vpJ9SWujVDBukOGzZBd9py6pwwsBzoCl4GZc11UAx
 Z6gq3RjdRuyg1wBZ5ifbfwRJwGZCAGfBWlrWkKUnZyKtOsDqB3GLNoFA==;
From: Simon Schuster <schuster.simon@siemens-energy.com>
Date: Tue, 10 Nov 2026 16:58:50 +0100
Subject: [PATCH v3 1/3] lib: extract 32bit mul/div helpers from nios2 into
 GENERIC_LIB
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-nios2-remove-usage-of-libgcc-v3-1-1449ce37948e@siemens-energy.com>
References: <20261110-nios2-remove-usage-of-libgcc-v3-0-1449ce37948e@siemens-energy.com>
In-Reply-To: <20261110-nios2-remove-usage-of-libgcc-v3-0-1449ce37948e@siemens-energy.com>
To: Dinh Nguyen <dinguyen@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
 Vineet Gupta <vgupta@kernel.org>, 
 Simon Schuster <schuster.simon@siemens-energy.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794326347; l=5223;
 i=schuster.simon@siemens-energy.com; s=20250818; h=from:subject:message-id;
 bh=6A7q6Q3Z8X11fB9D7lbnnmfE7i9yv2x3jbhfX4Q/KRg=;
 b=bdU1xvk2UugQ/AqzinK6F06aBZmtR32hW/pnHlinoZMV+nQl/Nw/4zcReVmAfEH5OXaATUYPz
 0LQpyzXLdL+B68xIEd1WTaguJREVpc9Qd22Z6JlxUl2vbduZ9IrqufM
X-Developer-Key: i=schuster.simon@siemens-energy.com; a=ed25519;
 pk=PUhOMiSp43aSeRE1H41KApxYOluamBFFiMfKlBjocvo=

From: Dinh Nguyen <dinguyen@kernel.org>

As suggested in 426c73b7-b4dc-4b68-9aa5-6145a13280bc@app.fastmail.com,
the software emulation of div/mul/mod on 32-bit platforms from nios2
might be of use to other smaller architectures as well when trying to
drop their libgcc dependency (e.g., arc, openrisc).
Therefore, extract and add them to lib/, guarded by respective
CONFIG_GENERIC_LIB_* options.

Symbols covered:
s32 __mulsi3(s32 a, s32 b);
s32 __divsi3(s32 a, s32 b);
u32 __udivsi3(u32 a, u32 b);
s32 __modsi3(s32 a, s32 b);
u32 __umodsi3(u32 a, u32 b);

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
Co-developed-by: Simon Schuster <schuster.simon@siemens-energy.com>
Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>
---
 include/linux/libgcc.h | 10 ++++++
 lib/Kconfig            | 15 ++++++++
 lib/Makefile           | 10 ++++++
 lib/divmod.c           | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/mulsi3.c           | 24 +++++++++++++
 5 files changed, 153 insertions(+)

diff --git a/include/linux/libgcc.h b/include/linux/libgcc.h
index 0d68f9d6a6a7e..a26cedb509f25 100644
--- a/include/linux/libgcc.h
+++ b/include/linux/libgcc.h
@@ -7,6 +7,7 @@
 #define __LIB_LIBGCC_H
 
 #include <asm/byteorder.h>
+#include <linux/types.h>
 
 typedef int word_type __attribute__ ((mode (__word__)));
 
@@ -34,6 +35,15 @@ long long notrace __lshrdi3(long long u, word_type b);
 long long notrace __muldi3(long long u, long long v);
 word_type notrace __ucmpdi2(unsigned long long a, unsigned long long b);
 
+/*
+ * Software 32-bit multiply for cores built without the hardware multiplier.
+ */
+s32 notrace __mulsi3(s32 a, s32 b);
+s32 notrace __divsi3(s32 a, s32 b);
+u32 notrace __udivsi3(u32 a, u32 b);
+s32 notrace __modsi3(s32 a, s32 b);
+u32 notrace __umodsi3(u32 a, u32 b);
+
 #ifdef CONFIG_HAVE_ARCH_LIBGCC_H
 #include <asm/libgcc.h>
 #endif
diff --git a/lib/Kconfig b/lib/Kconfig
index 1e42f5167c68b..16c2f2008b82c 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -611,6 +611,21 @@ config GENERIC_LIB_CMPDI2
 config GENERIC_LIB_UCMPDI2
 	bool
 
+config GENERIC_LIB_DIVSI3
+	bool
+
+config GENERIC_LIB_MODSI3
+	bool
+
+config GENERIC_LIB_UDIVSI3
+	bool
+
+config GENERIC_LIB_UMODSI3
+	bool
+
+config GENERIC_LIB_MULSI3
+	bool
+
 config GENERIC_LIB_DEVMEM_IS_ALLOWED
 	bool
 
diff --git a/lib/Makefile b/lib/Makefile
index a2afe954805cb..352a012baecba 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -337,6 +337,16 @@ obj-$(CONFIG_GENERIC_LIB_LSHRDI3) += lshrdi3.o
 obj-$(CONFIG_GENERIC_LIB_MULDI3) += muldi3.o
 obj-$(CONFIG_GENERIC_LIB_CMPDI2) += cmpdi2.o
 obj-$(CONFIG_GENERIC_LIB_UCMPDI2) += ucmpdi2.o
+obj-$(CONFIG_GENERIC_LIB_MULSI3) += mulsi3.o
+
+divmod-needed := $(or \
+	$(CONFIG_GENERIC_LIB_DIVSI3),\
+	$(CONFIG_GENERIC_LIB_MODSI3),\
+	$(CONFIG_GENERIC_LIB_UDIVSI3),\
+	$(CONFIG_GENERIC_LIB_UMODSI3))
+obj-$(divmod-needed) += divmod.o
+
+
 obj-$(CONFIG_OBJAGG) += objagg.o
 
 # pldmfw library
diff --git a/lib/divmod.c b/lib/divmod.c
new file mode 100644
index 0000000000000..4ef3087d7ef28
--- /dev/null
+++ b/lib/divmod.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright Altera Corporation (C) 2026. All rights reserved.
+ */
+
+#include <linux/libgcc.h>
+#include <linux/export.h>
+#include <linux/types.h>
+
+static u32 udivmodsi4(u32 num, u32 den, int modwanted)
+{
+	u32 bit = 1;
+	u32 res = 0;
+
+	while (den < num && bit && !(den & (1U << 31))) {
+		den <<= 1;
+		bit <<= 1;
+	}
+
+	while (bit) {
+		if (num >= den) {
+			num -= den;
+			res |= bit;
+		}
+		bit >>= 1;
+		den >>= 1;
+	}
+
+	return modwanted ? num : res;
+}
+
+
+#ifdef CONFIG_GENERIC_LIB_DIVSI3
+s32 __divsi3(s32 a, s32 b)
+{
+	int neg = 0;
+	s32 res;
+
+	if (a < 0) {
+		a = -a;
+		neg = !neg;
+	}
+
+	if (b < 0) {
+		b = -b;
+		neg = !neg;
+	}
+
+	res = udivmodsi4(a, b, 0);
+	if (neg)
+		res = -res;
+
+	return res;
+}
+EXPORT_SYMBOL(__divsi3);
+#endif
+
+#ifdef CONFIG_GENERIC_LIB_MODSI3
+s32 __modsi3(s32 a, s32 b)
+{
+	int neg = 0;
+	s32 res;
+
+	if (a < 0) {
+		a = -a;
+		neg = 1;
+	}
+
+	if (b < 0)
+		b = -b;
+
+	res = udivmodsi4(a, b, 1);
+	if (neg)
+		res = -res;
+
+	return res;
+}
+EXPORT_SYMBOL(__modsi3);
+#endif
+
+#ifdef CONFIG_GENERIC_LIB_UDIVSI3
+u32 __udivsi3(u32 a, u32 b)
+{
+	return udivmodsi4(a, b, 0);
+}
+EXPORT_SYMBOL(__udivsi3);
+#endif
+
+#ifdef CONFIG_GENERIC_LIB_UMODSI3
+u32 __umodsi3(u32 a, u32 b)
+{
+	return udivmodsi4(a, b, 1);
+}
+EXPORT_SYMBOL(__umodsi3);
+#endif
diff --git a/lib/mulsi3.c b/lib/mulsi3.c
new file mode 100644
index 0000000000000..6596a6598de05
--- /dev/null
+++ b/lib/mulsi3.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright Altera Corporation (C) 2026. All rights reserved.
+ */
+
+#include <linux/libgcc.h>
+#include <linux/export.h>
+#include <linux/types.h>
+
+s32 __mulsi3(s32 a, s32 b)
+{
+	s32 res = 0;
+	u32 cnt = a;
+
+	while (cnt) {
+		if (cnt & 1)
+			res += b;
+
+		b <<= 1;
+		cnt >>= 1;
+	}
+
+	return res;
+}
+EXPORT_SYMBOL(__mulsi3);

-- 
2.39.5

