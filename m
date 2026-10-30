Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.65.141
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375638;
	b=uFs0V7dARMkdkb5z3ennpJz4pTNv9rbUwlEJQ2Tvkd9ycRrCBoHAW8DQQOnN5qPIcesU
	 LnvIjb5H++C3aSBFfyNcsJFZK/3aWSjFMNblRXKBitDAVC83jB8yMBkB/y8OTbPzxG0fp
	 4Vm5rPkBWEFChZDO+xu/JJcpggojdfR8ZUrboHvxIUqoBH6+DABcOfbSKBmGiZlZOd4EF
	 EgpyudpRrllMG5OCxG5O/96CdTrPNGuDVZ0xnssmV5in8iaFVh6jT63t4IrTQ0c8nit8t
	 TIjTnln8qa/nkcnfJ7znkUB08x8D450oyHdl1OfWiSK3fSBHhil0uEJtsx/s2vnBk4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375638;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Developer-Signature:
	 X-Developer-Key;
	bh=cpjNowf7VMm/HUPL7hbuRXJOs+m21N46OI2eAXFUvAA=;
	b=OkfQ6zmeTn4fLKqjrbfzK8IHydQkv+9sZrM/fnTN6gtScroAVlZuMtPgGMYQY4qMsjMM
	 EaCE+jpmZ3saQcIzfRPlagjt4vk+CWiNVlvdiwZIzdOpCgS0Tv4RyXPzYUox0TAfZyBRx
	 e3TVlUw4SNnyIOKfF7Vj2c8xR4sBesaj03dHcZ5bgpe3tLMvuemlF+Gey2oZt+XYESmB0
	 pfAPvwR373LwgRIUJ3Dt/k5UGleQms2vuu4vg0xopYrENIhJJsZT6VT4XBmea3DQRZDHm
	 qCqxC2Tpar4Uv2GUpibaVrYZeviBO9t7np5X88oOSq0KN3UJH2z3Hq/2GZf+J9GdBVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens-energy.com;
	spf=pass smtp.mailfrom=errorhandling.siemens-energy.com;
	dkim=pass header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=np9ADyET;
	dkim=pass header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=kve4lECv;
	arc=none smtp.remote-ip=185.136.65.141
Received: from mta-65-141.flowmailer.net (mta-65-141.flowmailer.net [185.136.65.141])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89259606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89259606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=errorhandling.siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=np9ADyET;
	dkim=pass (2048-bit key, unprotected) header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=kve4lECv
Received: by mta-65-141.flowmailer.net with ESMTPSA id 20261030155347e6ef842f820019fd3c
        for <linux-kernel@vger.kernel.org>;
        Fri, 30 Oct 2026 16:53:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=s1;
 d=flowmailer.net;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=cpjNowf7VMm/HUPL7hbuRXJOs+m21N46OI2eAXFUvAA=;
 b=np9ADyET4HJnxm6lR5shZosk1yJmMZbJkpG5GOOJQbuP29tDnUtR15Lbm+W3h2B0EdVYZ0
 6DGsFTYZdsLZZfyNmwdFltPUXUIZPK6cFPMalQbpd84wnS05pwFaQQsS1j7awaiRkR65IrPd
 gjeivIoPB5jSgRRFsdCRcIjjFGV04=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm4;
 d=siemens-energy.com; i=schuster.simon@siemens-energy.com;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=cpjNowf7VMm/HUPL7hbuRXJOs+m21N46OI2eAXFUvAA=;
 b=kve4lECvMwgSVNk/gBEToDewLOpCSTP0WZbscJdfOOIVZG3Luq4+6kDZPeTPt/ogRfE9Xd
 Ihhmmejk0GXwK/DCNhZpa8vQpB3w0ytC/+Bqz32QiC1P+8ajPuCuBSLr2Ip7XIql3Ia1U6tw
 p/pCQf+KpmUs9H4oliBDPrz8GVdbuUf1mEmxCgyRS+M1FOtPBg0EAvqgL4PkNEdBK62iCxSC
 cLPYIbHnImrQjlrtXSidLAjoGqwArHyGbdFCxGXsrJIZ4wlFYXnC6V0FZDd+WgsTCBbUff1k
 +qQEhb4f7F2Zn02VMrHmpM2q+chCTu6VIdYl7BUHQaS7wkFsx+XXx5dQ==;
From: Simon Schuster <schuster.simon@siemens-energy.com>
Date: Fri, 30 Oct 2026 16:53:04 +0100
Subject: [PATCH 1/3] nios2: remove usage of libgcc
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
Message-Id: <20261030-nios2-remove-usage-of-libgcc-v1-1-4e341c66082e@siemens-energy.com>
References: <20261030-nios2-remove-usage-of-libgcc-v1-0-4e341c66082e@siemens-energy.com>
In-Reply-To: <20261030-nios2-remove-usage-of-libgcc-v1-0-4e341c66082e@siemens-energy.com>
To: Dinh Nguyen <dinguyen@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
 Simon Schuster <schuster.simon@siemens-energy.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793375627; l=5211;
 i=schuster.simon@siemens-energy.com; s=20250818; h=from:subject:message-id;
 bh=tudYzqMogIbEMV7LbZh9VjhbkFS0hjzSqFpyaZz0ong=;
 b=gmNJ9SmOdyovxdY5rf9LCt1wejJrTL+Hpsdn1bhID3raFC82u/Atgl1kb625exJTqW18D9oxV
 3ZXyuiBxBOzBMqRdDZ5STSEBIBwIdTlCe4R+Zkc87O8BulgV0Jr6S29
X-Developer-Key: i=schuster.simon@siemens-energy.com; a=ed25519;
 pk=PUhOMiSp43aSeRE1H41KApxYOluamBFFiMfKlBjocvo=

From: Dinh Nguyen <dinguyen@kernel.org>

Use the kernel's runtime support for lshrdi3, ashldi3, ashrdi3, muldi3,
and ucmpdi2.

Copy over the math functions from a GPLv2 GCC implementation of divsi3,
udivsi3, mulsi3, umulsi3, modsi3, and gcc_bcmp.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>
---
 arch/nios2/Kconfig              |   5 ++
 arch/nios2/Makefile             |   4 +-
 arch/nios2/kernel/nios2_ksyms.c |  22 --------
 arch/nios2/lib/Makefile         |   1 +
 arch/nios2/lib/math.c           | 119 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 126 insertions(+), 25 deletions(-)

diff --git a/arch/nios2/Kconfig b/arch/nios2/Kconfig
index 9c0e6eaeb005c..9417bcf583957 100644
--- a/arch/nios2/Kconfig
+++ b/arch/nios2/Kconfig
@@ -14,6 +14,11 @@ config NIOS2
 	select GENERIC_CPU_DEVICES
 	select GENERIC_IRQ_PROBE
 	select GENERIC_IRQ_SHOW
+	select GENERIC_LIB_LSHRDI3
+	select GENERIC_LIB_ASHLDI3
+	select GENERIC_LIB_ASHRDI3
+	select GENERIC_LIB_MULDI3
+	select GENERIC_LIB_UCMPDI2
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_KGDB
 	select HAVE_PAGE_SIZE_4KB
diff --git a/arch/nios2/Makefile b/arch/nios2/Makefile
index f1ff4ce0f1a2c..173588c31abf9 100644
--- a/arch/nios2/Makefile
+++ b/arch/nios2/Makefile
@@ -19,8 +19,6 @@ UTS_SYSNAME = Linux
 
 export MMU
 
-LIBGCC         := $(shell $(CC) $(KBUILD_CFLAGS) $(KCFLAGS) -print-libgcc-file-name)
-
 KBUILD_AFLAGS += -march=r$(CONFIG_NIOS2_ARCH_REVISION)
 
 KBUILD_CFLAGS += -pipe -D__linux__ -D__ELF__
@@ -37,7 +35,7 @@ KBUILD_CFLAGS += -DUTS_SYSNAME=\"$(UTS_SYSNAME)\"
 KBUILD_CFLAGS += -fno-builtin
 KBUILD_CFLAGS += -G 0
 
-libs-y		+= arch/nios2/lib/ $(LIBGCC)
+libs-y		+= arch/nios2/lib/
 
 INSTALL_PATH ?= /tftpboot
 nios2-boot := arch/$(ARCH)/boot
diff --git a/arch/nios2/kernel/nios2_ksyms.c b/arch/nios2/kernel/nios2_ksyms.c
index e8710a269b398..351664e236fac 100644
--- a/arch/nios2/kernel/nios2_ksyms.c
+++ b/arch/nios2/kernel/nios2_ksyms.c
@@ -21,25 +21,3 @@ EXPORT_SYMBOL(memmove);
 /* memory management */
 
 EXPORT_SYMBOL(flush_icache_range);
-
-/*
- * libgcc functions - functions that are used internally by the
- * compiler...  (prototypes are not correct though, but that
- * doesn't really matter since they're not versioned).
- */
-#define DECLARE_EXPORT(name)	extern void name(void); EXPORT_SYMBOL(name)
-
-DECLARE_EXPORT(__gcc_bcmp);
-DECLARE_EXPORT(__divsi3);
-DECLARE_EXPORT(__moddi3);
-DECLARE_EXPORT(__modsi3);
-DECLARE_EXPORT(__udivmoddi4);
-DECLARE_EXPORT(__udivsi3);
-DECLARE_EXPORT(__umoddi3);
-DECLARE_EXPORT(__umodsi3);
-DECLARE_EXPORT(__muldi3);
-DECLARE_EXPORT(__mulsi3);
-DECLARE_EXPORT(__ucmpdi2);
-DECLARE_EXPORT(__lshrdi3);
-DECLARE_EXPORT(__ashldi3);
-DECLARE_EXPORT(__ashrdi3);
diff --git a/arch/nios2/lib/Makefile b/arch/nios2/lib/Makefile
index 9d5bf1df520c1..86433dcaac7e5 100644
--- a/arch/nios2/lib/Makefile
+++ b/arch/nios2/lib/Makefile
@@ -7,3 +7,4 @@ lib-y += delay.o
 lib-y += memcpy.o
 lib-y += memmove.o
 lib-y += memset.o
+lib-y += math.o
diff --git a/arch/nios2/lib/math.c b/arch/nios2/lib/math.c
new file mode 100644
index 0000000000000..9a89fa268a96e
--- /dev/null
+++ b/arch/nios2/lib/math.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright Altera Corporation (C) 2026. All rights reserved.
+ */
+
+#include <linux/export.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+/*
+ * Software 32-bit multiply for cores built without the hardware multiplier.
+ */
+s32 __mulsi3(s32 a, s32 b);
+s32 __divsi3(s32 a, s32 b);
+s32 __udivsi3(s32 a, s32 b);
+s32 __modsi3(s32 a, s32 b);
+s32 __umodsi3(s32 a, s32 b);
+int __gcc_bcmp(const void *s1, const void *s2, size_t len);
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
+
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
+
+s32 __udivsi3(s32 a, s32 b)
+{
+	return udivmodsi4(a, b, 0);
+}
+EXPORT_SYMBOL(__udivsi3);
+
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
+
+s32 __umodsi3(s32 a, s32 b)
+{
+	return udivmodsi4(a, b, 1);
+}
+EXPORT_SYMBOL(__umodsi3);
+
+int __gcc_bcmp(const void *s1, const void *s2, size_t len)
+{
+	return memcmp(s1, s2, len);
+}
+EXPORT_SYMBOL(__gcc_bcmp);
+

-- 
2.39.5

