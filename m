Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712670;
	b=twajDeoqFOk2bRUcnVMLJ+4YOYsZHpH/TbpTCJaPlmV11nv8M07QcvS5u7+sA7p+PUY0
	 dSll1Dn4n4jNsSW3pVdLz4nMFaJhtQA+V8y4cQdmhK2OffhiSNw2Ca2r4e7IuFjt+hi1i
	 mGFjTPH9g3qbk8qCuzFgD5YHZT8Mul0aikbp7rBz95w8oWAC9NXm17kzUZxkyBowUfFls
	 zmR6j0yFFlYeM3AThVJ7iQ0eXshMnDrD7KRUzsC95+x4w8CuSn1eR4pqDCYhIE/ETkCFg
	 HRNKOZC0lj67yhLFeisFapoUWV66SBJYWN0YtXswkZREq1aNOnkhDbn5fHKJGtULwHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712670;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Developer-Signature:
	 X-Developer-Key;
	bh=E5l4PSEqseEPSiUoHghmPFG/3ehH+QwqD3+IcpFqsYo=;
	b=EaqvlkVGKnc9LoLPT4N6/C9IV8lJXsLEHxYW7GfCVKRRaRo9nRMea1Y6LQd6n70dTkXe
	 ERgcn90Epc0eZbEqrPV6dNp6SthzaEpoWERFQnWG6eO0X1/HY2MMHxuKKB39B8SWEYIx1
	 4T9B/nFCMD21ZlGgVLuMmaKoUQ4jlu/itQq+brklXwBgXUr2mfhqHCJn24/IFLwG7FtqV
	 8FUarD0J+JwYMeP/QE6x+SI69t+gBmVdElzB3TMT1evqHt98phVTbJRWrxiw9IlqtpYP5
	 s8OK1kNtcLPXwvfI/AinI+kveK+aL4TGOUjvTwRot377mxFdge03WnLO1y5bz5PAISw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens-energy.com;
	spf=pass smtp.mailfrom=errorhandling.siemens-energy.com;
	dkim=pass header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=pPGV3y4U;
	dkim=pass header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=Zq3L1P3R;
	arc=none smtp.remote-ip=185.136.64.129
Received: from mta-64-129.flowmailer.net (mta-64-129.flowmailer.net [185.136.64.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA36606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BA36606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=errorhandling.siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=pPGV3y4U;
	dkim=pass (2048-bit key, unprotected) header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=Zq3L1P3R
Received: by mta-64-129.flowmailer.net with ESMTPSA id 202611031331014e958246960019fd70
        for <linux-kernel@vger.kernel.org>;
        Tue, 03 Nov 2026 14:31:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=s1;
 d=flowmailer.net;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=E5l4PSEqseEPSiUoHghmPFG/3ehH+QwqD3+IcpFqsYo=;
 b=pPGV3y4UQdSWZ6kx0DhfBgbq9iYf3MvdCBNnj9R8df404+eh0hXaF6phXVMqVOiABGXEDp
 cIysXE0gZx4kFOP4oJWA9T+VmjIBhZSU2ve1elbSftbgAv4iNcFZqFKgZtU2s3rXy0gRk63c
 nSmUPeGaPXTxMkQ+6x5C3IqsAp4Wo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm4;
 d=siemens-energy.com; i=schuster.simon@siemens-energy.com;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=E5l4PSEqseEPSiUoHghmPFG/3ehH+QwqD3+IcpFqsYo=;
 b=Zq3L1P3RB3d2vKxCyD+Ccm4ZH35BWVLAC35QEa8XDBO5kOy6pVi2bBGxjTwoM/0jp2GpSB
 Nk9GeZgDC2hRwM6YQ4X2rB7Cv7NlqT7vgD7eIKjaR7MOF+O0ECWUE0Wh0sOxJeFKp+FfBgyI
 +h4YOX38GCzcgudHUCLRCQkCR39MnnLTfwtr9gvk6+FwzrEAr2BEByi4YqFUE+xSabB8KjIi
 ykR6SFs6QLpZqWROvhqlh0EFlrqbqDC27EBAweQ0gwJCFDrEcqTGDlpeLaZ/QjDjwape98Qh
 QQ1R87wgJt98CvDnvwMuIHi2SIbCBMmZz1zt75kHRT1Q/8DyeGz6b43w==;
From: Simon Schuster <schuster.simon@siemens-energy.com>
Date: Tue, 03 Nov 2026 14:30:28 +0100
Subject: [PATCH v2 1/3] lib: extract 32bit mul/div helpers from nios2 into
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
Message-Id: <20261103-nios2-remove-usage-of-libgcc-v2-1-5fabbedc49ec@siemens-energy.com>
References: <20261103-nios2-remove-usage-of-libgcc-v2-0-5fabbedc49ec@siemens-energy.com>
In-Reply-To: <20261103-nios2-remove-usage-of-libgcc-v2-0-5fabbedc49ec@siemens-energy.com>
To: Dinh Nguyen <dinguyen@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
 Vineet Gupta <vgupta@kernel.org>, 
 Simon Schuster <schuster.simon@siemens-energy.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793712660; l=5223;
 i=schuster.simon@siemens-energy.com; s=20250818; h=from:subject:message-id;
 bh=VZ661LQwoei69aNq5/aT0HlMQj3VU5wz5LK3TR14RLo=;
 b=uvF204HjM1l1lydGMcJflux/K5kpfZRy3m3KpWVzFqlH+I/f7u8ZUMChlAmBjGlq25F7Ku8c2
 fFd8+ucWv3dBY2/Wh6zFnzNO+EKMyCEn9drxh8EZgCSfGWYQul1lf9U
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
s32 __udivsi3(s32 a, s32 b);
s32 __modsi3(s32 a, s32 b);
s32 __umodsi3(s32 a, s32 b);

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
index 0d68f9d6a6a7e..f5db35a9bc146 100644
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
+s32 notrace __udivsi3(s32 a, s32 b);
+s32 notrace __modsi3(s32 a, s32 b);
+s32 notrace __umodsi3(s32 a, s32 b);
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
index 0000000000000..cc1df6f9978ce
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
+s32 __udivsi3(s32 a, s32 b)
+{
+	return udivmodsi4(a, b, 0);
+}
+EXPORT_SYMBOL(__udivsi3);
+#endif
+
+#ifdef CONFIG_GENERIC_LIB_UMODSI3
+s32 __umodsi3(s32 a, s32 b)
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

