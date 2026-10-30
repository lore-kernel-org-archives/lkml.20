Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375638;
	b=m8pHDCnq70dClLAXQf9DGZXEexKGs/1FdZLkgL0nhnH9pwboNvtS9S2hp9/JZN+vGiGe
	 C0YuF0PAAF6T7XZ+8C2NPI6teky6UBZx6T9eeKb6jEzSwUbxvYi3BP/Gokjxch0v+JBeK
	 9S6O9aHPvRQbUSCjVpr3aKV/Cd1olVRIeMXW/XKWT4uUqI/sRJs9NHj3FA8ORQALrad5x
	 ScIyAuFYvHXZlOLQEoxiPfhsuHQaFOhKqbKZgi25R68HR14xoqnpJTyFiws4PeobYcJKD
	 fnOoa1HzUBqnDMDjkO3eNfVK4Z+xiQHptbxc+pSHwg7W3UWkMy0pOGKx/qdwYuhlu2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375638;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Developer-Signature:
	 X-Developer-Key;
	bh=3qYsFL/qUA1QKIfa45pBJ0q5Qiet6ChbHeDnJgik++w=;
	b=cfK0K0y57+lcwsEbHLwBPClKd/IxOdxZQ0M/rJU5rCFQ4S8TId2bm2VRfEJVyFK1Uv1o
	 mPDS8ootTsZ9y630nq1ECFeP1a1nmRJDoijiofuEqRbpDg0UAgDUVi6oYEcVQ1xnAQY9Y
	 /X9hDGewaxDtIyuBMUtWrmh+hZdLI+T0rtx9+dik61tzvUOTzUtlDmzErxLNqJywJwLoK
	 TSiz9LmEDS/A0njH3cNg5bAq4cOMEl2ROZKIjiLOveN4Ch6oq2YJIAwRSyJakO7VPHbBm
	 OUILhqvB2+Dd2sJzLQSXcBSpdadp9TFJND27nxML3Z1KbI76Sr6Xro72x2vSrzCYR4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens-energy.com;
	spf=pass smtp.mailfrom=errorhandling.siemens-energy.com;
	dkim=pass header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=hp1o4a2k;
	dkim=pass header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=WCmIIyXC;
	arc=none smtp.remote-ip=185.136.64.142
Received: from mta-64-142.flowmailer.net (mta-64-142.flowmailer.net [185.136.64.142])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EABB606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EABB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=errorhandling.siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=hp1o4a2k;
	dkim=pass (2048-bit key, unprotected) header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=WCmIIyXC
Received: by mta-64-142.flowmailer.net with ESMTPSA id 202610301553484d213b05070019fdc6
        for <linux-kernel@vger.kernel.org>;
        Fri, 30 Oct 2026 16:53:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=s1;
 d=flowmailer.net;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=3qYsFL/qUA1QKIfa45pBJ0q5Qiet6ChbHeDnJgik++w=;
 b=hp1o4a2kx4GsfaSbgxmJkDBnHXqju3rw0Rns0QMAIJjvmfepZ0x6CEKHQd5MwB3PNrSd6J
 /Mzkc3Lc85Z5C1bhTC9wGgjc5HREOCAB4RlD3J9nd299x1Y7hV/fJdrikOw0QI7qKNrTVYKZ
 D0wqdNfSFM49obsyo+1dT+b1sr3Aw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm4;
 d=siemens-energy.com; i=schuster.simon@siemens-energy.com;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=3qYsFL/qUA1QKIfa45pBJ0q5Qiet6ChbHeDnJgik++w=;
 b=WCmIIyXCS98r+y4ofRciBaYUmolV3pvgalQ0l4faReuNcCwmibn6VmfdpsD25RNdozuTNb
 ynjtsYsjXT6SfwiEaJR8dturMJY9h3YGYgrkJ6TPpu10IVoVfvHiTDuBtgx3XrbySs3XaSR9
 aXUdtqGhfDkRbB79ITiBpxNfIUxIgpEKfPlWkoZTvWRgWiMjP9xgQHbTYSkK2vgeQzfx7pKl
 JymqXHS9NJs0+sO5DVEtb4hMsLJf5ipY3ss+AMqflYZ6sLXyaPgVlQ1uOhz38Mh9J6IrSQW0
 9m0yuukudA8VEoYqZ2K8PafTK1MCW2RmmprAZS3lA0hf0tJ661kd6FCQ==;
From: Simon Schuster <schuster.simon@siemens-energy.com>
Date: Fri, 30 Oct 2026 16:53:06 +0100
Subject: [PATCH 3/3] lib: extract 32bit mul/div helpers from nios2 into
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
Message-Id: <20261030-nios2-remove-usage-of-libgcc-v1-3-4e341c66082e@siemens-energy.com>
References: <20261030-nios2-remove-usage-of-libgcc-v1-0-4e341c66082e@siemens-energy.com>
In-Reply-To: <20261030-nios2-remove-usage-of-libgcc-v1-0-4e341c66082e@siemens-energy.com>
To: Dinh Nguyen <dinguyen@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
 Simon Schuster <schuster.simon@siemens-energy.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793375627; l=8732;
 i=schuster.simon@siemens-energy.com; s=20250818; h=from:subject:message-id;
 bh=wXbJq4cLtAtm+cTR8poz2cgCQZk+U1/IaRFlwTDosro=;
 b=/b09On0bJtqfHVZk37RVEhvTyIVNFA2IcX4uKEbzcTPkRNUFSWigIcGfHLMYsfkmxAuWNBEMJ
 HUuf/AHrZBqAtpm0VyvEsOuwWz7Idg77uoASCJl9bLMCAmzJwgcIdqE
X-Developer-Key: i=schuster.simon@siemens-energy.com; a=ed25519;
 pk=PUhOMiSp43aSeRE1H41KApxYOluamBFFiMfKlBjocvo=

As suggested in 426c73b7-b4dc-4b68-9aa5-6145a13280bc@app.fastmail.com,
the software emulation of div/mul/mod on 32-bit platforms from nios2
might be of use to other smaller architectures as well when trying to
drop their libgcc dependency (e.g., arc, openrisc). The same applies to
__gcc_bcmp.
Therefore, extract and add them to lib/, guarded by respective
CONFIG_GENERIC_LIB_* options.

Symbols covered:
s32 __mulsi3(s32 a, s32 b);
s32 __divsi3(s32 a, s32 b);
s32 __udivsi3(s32 a, s32 b);
s32 __modsi3(s32 a, s32 b);
s32 __umodsi3(s32 a, s32 b);
int __gcc_bcmp(const void *s1, const void *s2, size_t len);

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>
---
 arch/nios2/Kconfig     |   6 +++
 arch/nios2/lib/math.c  | 112 -------------------------------------------------
 include/linux/libgcc.h |  12 ++++++
 lib/Kconfig            |  18 ++++++++
 lib/Makefile           |  11 +++++
 lib/divmod.c           |  94 +++++++++++++++++++++++++++++++++++++++++
 lib/gccbcmp.c          |  13 ++++++
 lib/mulsi3.c           |  24 +++++++++++
 8 files changed, 178 insertions(+), 112 deletions(-)

diff --git a/arch/nios2/Kconfig b/arch/nios2/Kconfig
index 9417bcf583957..08db6aa9c396f 100644
--- a/arch/nios2/Kconfig
+++ b/arch/nios2/Kconfig
@@ -19,6 +19,12 @@ config NIOS2
 	select GENERIC_LIB_ASHRDI3
 	select GENERIC_LIB_MULDI3
 	select GENERIC_LIB_UCMPDI2
+	select GENERIC_LIB_DIVSI3
+	select GENERIC_LIB_MODSI3
+	select GENERIC_LIB_UDIVSI3
+	select GENERIC_LIB_UMODSI3
+	select GENERIC_LIB_MULSI3
+	select GENERIC_LIB_GCC_BCMP
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_KGDB
 	select HAVE_PAGE_SIZE_4KB
diff --git a/arch/nios2/lib/math.c b/arch/nios2/lib/math.c
index f4a4e7d1afeee..ba16b57019227 100644
--- a/arch/nios2/lib/math.c
+++ b/arch/nios2/lib/math.c
@@ -3,120 +3,8 @@
  */
 
 #include <linux/export.h>
-#include <linux/string.h>
 #include <linux/types.h>
 
-/*
- * Software 32-bit multiply for cores built without the hardware multiplier.
- */
-s32 __mulsi3(s32 a, s32 b);
-s32 __divsi3(s32 a, s32 b);
-s32 __udivsi3(s32 a, s32 b);
-s32 __modsi3(s32 a, s32 b);
-s32 __umodsi3(s32 a, s32 b);
-int __gcc_bcmp(const void *s1, const void *s2, size_t len);
-
-static u32 udivmodsi4(u32 num, u32 den, int modwanted)
-{
-	u32 bit = 1;
-	u32 res = 0;
-
-	while (den < num && bit && !(den & (1U << 31))) {
-		den <<= 1;
-		bit <<= 1;
-	}
-
-	while (bit) {
-		if (num >= den) {
-			num -= den;
-			res |= bit;
-		}
-		bit >>= 1;
-		den >>= 1;
-	}
-
-	return modwanted ? num : res;
-}
-
-s32 __mulsi3(s32 a, s32 b)
-{
-	s32 res = 0;
-	u32 cnt = a;
-
-	while (cnt) {
-		if (cnt & 1)
-			res += b;
-
-		b <<= 1;
-		cnt >>= 1;
-	}
-
-	return res;
-}
-EXPORT_SYMBOL(__mulsi3);
-
-s32 __divsi3(s32 a, s32 b)
-{
-	int neg = 0;
-	s32 res;
-
-	if (a < 0) {
-		a = -a;
-		neg = !neg;
-	}
-
-	if (b < 0) {
-		b = -b;
-		neg = !neg;
-	}
-
-	res = udivmodsi4(a, b, 0);
-	if (neg)
-		res = -res;
-
-	return res;
-}
-EXPORT_SYMBOL(__divsi3);
-
-s32 __udivsi3(s32 a, s32 b)
-{
-	return udivmodsi4(a, b, 0);
-}
-EXPORT_SYMBOL(__udivsi3);
-
-s32 __modsi3(s32 a, s32 b)
-{
-	int neg = 0;
-	s32 res;
-
-	if (a < 0) {
-		a = -a;
-		neg = 1;
-	}
-
-	if (b < 0)
-		b = -b;
-
-	res = udivmodsi4(a, b, 1);
-	if (neg)
-		res = -res;
-
-	return res;
-}
-EXPORT_SYMBOL(__modsi3);
-
-s32 __umodsi3(s32 a, s32 b)
-{
-	return udivmodsi4(a, b, 1);
-}
-EXPORT_SYMBOL(__umodsi3);
-
-int __gcc_bcmp(const void *s1, const void *s2, size_t len)
-{
-	return memcmp(s1, s2, len);
-}
-EXPORT_SYMBOL(__gcc_bcmp);
-
 u8 __divsi3_table[] = {
 0, 0/1, 0/2, 0/3, 0/4, 0/5, 0/6, 0/7, 0/8, 0/9, 0/10, 0/11, 0/12, 0/13, 0/14, 0/15,
 0, 1/1, 1/2, 1/3, 1/4, 1/5, 1/6, 1/7, 1/8, 1/9, 1/10, 1/11, 1/12, 1/13, 1/14, 1/15,
diff --git a/include/linux/libgcc.h b/include/linux/libgcc.h
index 0d68f9d6a6a7e..85d7b7b0f1949 100644
--- a/include/linux/libgcc.h
+++ b/include/linux/libgcc.h
@@ -7,6 +7,7 @@
 #define __LIB_LIBGCC_H
 
 #include <asm/byteorder.h>
+#include <linux/types.h>
 
 typedef int word_type __attribute__ ((mode (__word__)));
 
@@ -34,6 +35,17 @@ long long notrace __lshrdi3(long long u, word_type b);
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
+int __gcc_bcmp(const void *s1, const void *s2, size_t len);
+
 #ifdef CONFIG_HAVE_ARCH_LIBGCC_H
 #include <asm/libgcc.h>
 #endif
diff --git a/lib/Kconfig b/lib/Kconfig
index 1e42f5167c68b..91a36aad2e625 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -611,6 +611,24 @@ config GENERIC_LIB_CMPDI2
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
+config GENERIC_LIB_GCC_BCMP
+	bool
+
 config GENERIC_LIB_DEVMEM_IS_ALLOWED
 	bool
 
diff --git a/lib/Makefile b/lib/Makefile
index a2afe954805cb..671ff5de1c397 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -337,6 +337,17 @@ obj-$(CONFIG_GENERIC_LIB_LSHRDI3) += lshrdi3.o
 obj-$(CONFIG_GENERIC_LIB_MULDI3) += muldi3.o
 obj-$(CONFIG_GENERIC_LIB_CMPDI2) += cmpdi2.o
 obj-$(CONFIG_GENERIC_LIB_UCMPDI2) += ucmpdi2.o
+obj-$(CONFIG_GENERIC_LIB_MULSI3) += mulsi3.o
+obj-$(CONFIG_GENERIC_LIB_GCC_BCMP) += gccbcmp.o
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
diff --git a/lib/gccbcmp.c b/lib/gccbcmp.c
new file mode 100644
index 0000000000000..7037176b04b35
--- /dev/null
+++ b/lib/gccbcmp.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright Altera Corporation (C) 2026. All rights reserved.
+ */
+
+#include <linux/libgcc.h>
+#include <linux/export.h>
+#include <linux/string.h>
+
+int __gcc_bcmp(const void *s1, const void *s2, size_t len)
+{
+	return memcmp(s1, s2, len);
+}
+EXPORT_SYMBOL(__gcc_bcmp);
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

