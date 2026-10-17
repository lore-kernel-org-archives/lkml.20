Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C29D3BB9F1
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792258812; cv=none; b=BLfOxS9rDR0wDo6bitVF+WuUbQNIIeFKRkFZleIt9i5NS2MnbQ7VI+IZ/1UujKT1jSqEDtACzchu5e5n9kewF+CW3isDLUkweuox8t0Ko9JBD75DuCUlKEB6qhXBTJoK3+v2MQQPKcOZPjjYnImMkAtM4VnP6rZgcYXEAZTmUeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792258812; c=relaxed/simple;
	bh=KqqJO/IcDYjsFzjnqJnBZEt43GNaIA0QG1OV6gWE5WA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M78yUqi+Ffz5OLY2IjMAgp1LvoCgIvUZuuriSdJi59oZDdzTm4ECUHaRfr77jwxZdrqAD15Mhz0fj/ssS7SDg+uu2H2HKTF+pOn9HxIfHH6Su7EZzBDhGVhR8sOzJU5JeQ43ovVIfjy2FoNHJyBM6zv8fDYCTZKp4pXmkHqsLwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n150b8bI; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n150b8bI"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0d126f631so6992517b3.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792258810; x=1792863610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=77N3iS/xJPbAYDftlWHowV/xfb9UtTqizVAQYI0jVWo=;
        b=n150b8bIKiJSHwV7OKujznlhNXX22AaeL7XwKMNHpHTeqSt9F4NZwTUWG5NUtHXAaz
         f6JKNKij84Uc1M88RDCHwfPre2+yF2JMM93OzA9swVoUp72EQjddkaDE1TixTebUVqCf
         k7jb+R4SW+O9nXUmjMB1S8V7Y47gr2DuUsnxdYf1m7acIu64Bk1XO3p92M9wmSvRgldA
         4foNuF2PRdk5EE4dH6KpnxYQSo89V7zFRO245cWPmPnN8RtomjCThtrbsMutbaDfXg2/
         M8cHX13PdmqWxXns9nh+KUMhgv/5p5JeOxGhLRFRq4cErogpJOJqNuMVtd+NkhfSIvwJ
         pwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792258810; x=1792863610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=77N3iS/xJPbAYDftlWHowV/xfb9UtTqizVAQYI0jVWo=;
        b=V5ybjYWX6D3P13ElEHlzLUBstdux2SLNWMqYpJ+iRuEfP8B9lFE5+rc30wb1KiEzEi
         dVZV3CSvrDAGafMDraXz69pWL4o/ftjQB5ibTXIR4IMf0ibRZJUfESNtUFr47rFwLEqX
         Q5+cNKOmlyXIzlGO9IXx/5aecTzOd74V7C21MvogxAfyx3/z+DIKntT3yIqjjL2F1WaG
         qbD7TnpLTfHGdDFcDbvg5QPOWGwpZ+6QNtVZbM+vh4zFrZj9NxV1CVSDpHrJ9h/P2R4V
         ucgLkde2sT26uURQlWY/SRX5TQpc/UhCoJpUiUYHB9hr7gR+yREQOORCi+qpSyT8UIAi
         NAUw==
X-Forwarded-Encrypted: i=1; AKwUvBxYJkU8fMe84iTugfSP87NOfMef5lRl3ZrNVDSNfaCEsD2mC/qv9gSpmjl5kLAdW7hI6HgNM98sOpsbh1c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2wvtlK1Z7h64lD0Ny+v6E81TccoiTpv/zh/jn0QpVFchTrJ9G
	crgVZlQ4pKO8bzaNqbEgw4tcap8bWi9JVxc7MNE2U21iVe6KPMMSYfS3
X-Gm-Gg: AYBFou0LMMtlqJ9YaSX4VOgkhe90nNqneQpGPIEzjm/KSkwQcUeM4HS7L6HEMuGHVAt
	TYLM8JEfufkSj3JpgoN2tJFAU0Co4CH5DDFV/SQLg326l5YIvvsZTvSqMBagrRsZFier7DTbOm4
	G9aci4QP6g2asJDWntkd6GR4jpT2l+XFodshMUHWKmSEkueWz0GHGyrYuAIMH8gRVoJnkcV2qkq
	WLBDh+yEQv5q1iU8+dEUmv2nxtyYGNCKuRVz1RhzX27W6pvsnPeBH/eiE4+YsjTZHHuHbir2BPE
	4rjLxN86Wp3oHxARp2EpRuIEgFsT6oYavv9VIwZSVPcGCjsRZFoZeb2MjvqW6G0UfVsNHTnxbBO
	RszTXCzWKqJ/1reiLlT0ToLcRY0oI6Ehq8tBhlUDF5tUiF3ybbnjOhJmFou31axoFsmGvu6Agv6
	Oo0LJ32KlcXetm4/2julZhccj1hKMGi9mwGUoXF3dzV3XnFWv+6nCRqlqwlYggBZOv+QBqYuH5J
	aLLeXeN1ABZQI/AMGw1ouksgvqpjc/NDiH5k/4NnxA+iLW6ikwmuzp75PGkuhgWO/O938PpjyYo
	pkIO1zIVAbKQ66IqILkZUA259mRJ
X-Received: by 2002:a05:690c:298:b0:873:5bb2:6c06 with SMTP id 00721157ae682-8b0f21b6da3mr12125767b3.48.1792258810080;
        Sat, 17 Oct 2026 10:40:10 -0700 (PDT)
Received: from localhost (108-93-236-139.lightspeed.chtnsc.sbcglobal.net. [108.93.236.139])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e594757asm22603617b3.40.2026.10.17.10.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 10:40:09 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org
Cc: Magnus Lindholm <linmag7@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] alpha: select ARCH_SUPPORTS_INT128
Date: Sat, 17 Oct 2026 13:40:07 -0400
Message-ID: <20261017174007.695344-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gcc supports __int128 on Alpha, and the 64x64 to 128-bit multiply that
the users in the scheduler and in lib/ care about maps onto mulq/umulh
rather than an out-of-line libgcc helper.

Variable 128-bit shifts are another matter. gcc open-codes them when
optimizing for speed, but with CONFIG_CC_OPTIMIZE_FOR_SIZE=y it calls the
libgcc routines __ashlti3, __ashrti3 and __lshrti3 instead. The kernel
does not link against libgcc, so provide the three helpers in C, as s390
does, and export them for modules. They are built into the kernel proper
rather than lib.a so the exports are present even when nothing built in
references them. Like the s390 versions they are marked noinstr, since
the compiler may emit calls to them from noinstr code.

Gate the select on CC_HAS_INT128 as the other 64-bit architectures do.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
v3:
- Fold in "alpha: add 128-bit shift helpers" so the select never lands
  without the libgcc shift routines that -Os builds need
  (https://lore.kernel.org/r/20261010022039.1610210-1-mattst88@gmail.com,
  reported at https://lore.kernel.org/oe-kbuild-all/202610090831.DSxrGQRc-lkp@intel.com/)
- Mark the helpers noinstr, as s390 does
- Drop Magnus's Reviewed-by and Tested-by given the new code

 arch/alpha/Kconfig                      |  1 +
 arch/alpha/include/asm/asm-prototypes.h |  6 +++
 arch/alpha/lib/Makefile                 |  2 +
 arch/alpha/lib/tishift.c                | 70 +++++++++++++++++++++++++
 4 files changed, 79 insertions(+)
 create mode 100644 arch/alpha/lib/tishift.c

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 2672971b83f3..bed3f1c8d9d2 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -16,6 +16,7 @@ config ALPHA
 	select ARCH_NO_PREEMPT
 	select ARCH_NO_SG_CHAIN
 	select ARCH_SUPPORTS_ATOMIC_RMW
+	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select FORCE_PCI
 	select PCI_DOMAINS if PCI
diff --git a/arch/alpha/include/asm/asm-prototypes.h b/arch/alpha/include/asm/asm-prototypes.h
index c8ae46fc2e74..672fea15032f 100644
--- a/arch/alpha/include/asm/asm-prototypes.h
+++ b/arch/alpha/include/asm/asm-prototypes.h
@@ -17,3 +17,9 @@ extern void __remlu(void);
 extern void __divqu(void);
 extern void __remqu(void);
 extern unsigned long __udiv_qrnnd(unsigned long *, unsigned long, unsigned long , unsigned long);
+
+#ifdef CONFIG_ARCH_SUPPORTS_INT128
+extern __int128_t __ashlti3(__int128_t a, int shift);
+extern __int128_t __ashrti3(__int128_t a, int shift);
+extern __int128_t __lshrti3(__int128_t a, int shift);
+#endif
diff --git a/arch/alpha/lib/Makefile b/arch/alpha/lib/Makefile
index 84046e730e6d..f77d4a46f2e6 100644
--- a/arch/alpha/lib/Makefile
+++ b/arch/alpha/lib/Makefile
@@ -35,6 +35,8 @@ lib-y =	__divqu.o __remqu.o __divlu.o __remlu.o \
 	callback_srm.o srm_puts.o srm_printk.o \
 	fls.o
 
+obj-$(CONFIG_ARCH_SUPPORTS_INT128) += tishift.o
+
 # The division routines are built from single source, with different defines.
 AFLAGS___divqu.o = -DDIV
 AFLAGS___remqu.o =       -DREM
diff --git a/arch/alpha/lib/tishift.c b/arch/alpha/lib/tishift.c
new file mode 100644
index 000000000000..8319907d8150
--- /dev/null
+++ b/arch/alpha/lib/tishift.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * 128-bit shift helpers.
+ *
+ * gcc open-codes a variable 128-bit shift when optimizing for speed, but
+ * calls these libgcc routines when optimizing for size.
+ */
+
+#include <linux/export.h>
+#include <linux/types.h>
+#include <asm/asm-prototypes.h>
+
+union ti {
+	__int128_t val;
+	struct {
+		u64 low;
+		u64 high;
+	};
+};
+
+noinstr __int128_t __ashlti3(__int128_t a, int shift)
+{
+	union ti ti = { .val = a };
+
+	if (!shift)
+		return ti.val;
+	if (shift < 64) {
+		ti.high = (ti.high << shift) | (ti.low >> (64 - shift));
+		ti.low <<= shift;
+	} else {
+		ti.high = ti.low << (shift - 64);
+		ti.low = 0;
+	}
+	return ti.val;
+}
+EXPORT_SYMBOL(__ashlti3);
+
+noinstr __int128_t __ashrti3(__int128_t a, int shift)
+{
+	union ti ti = { .val = a };
+
+	if (!shift)
+		return ti.val;
+	if (shift < 64) {
+		ti.low = (ti.low >> shift) | (ti.high << (64 - shift));
+		ti.high = (s64)ti.high >> shift;
+	} else {
+		ti.low = (s64)ti.high >> (shift - 64);
+		ti.high = (s64)ti.high >> 63;
+	}
+	return ti.val;
+}
+EXPORT_SYMBOL(__ashrti3);
+
+noinstr __int128_t __lshrti3(__int128_t a, int shift)
+{
+	union ti ti = { .val = a };
+
+	if (!shift)
+		return ti.val;
+	if (shift < 64) {
+		ti.low = (ti.low >> shift) | (ti.high << (64 - shift));
+		ti.high >>= shift;
+	} else {
+		ti.low = ti.high >> (shift - 64);
+		ti.high = 0;
+	}
+	return ti.val;
+}
+EXPORT_SYMBOL(__lshrti3);
-- 
2.55.0

