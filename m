Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853256;
	b=2PpSE2Dcee+jPZmRTctJHq4urUhfA63w5WDPheM2nZBQ3AfKT+eK1FRec2cTgavsB55i
	 mQls7vYyn5NBj0fYF3YOm6SqglVgCkpiuCeGKxD/jgS5ohdE/NdXBMt5LmC7t0aetpZxf
	 KVeQnCbtklaafiPSh0+xXK1yZVmUZSyb4N/zNCqwLD2gAVPvN8z4hIWD/nS1XcPNs2YJ6
	 xtamE6QH9SKYjVRnO4FT+nlRgdd1MJXNBf2cIoARG3TTj6jS+qyFNeKI78AvSl6GNaZoq
	 2rp3NkSHzAOnSWDtKcKMpZG9OmQdT113wUJqPLKt6bCIVwPtDpa0EUOR7kDKZYXpBmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qVAF2xmuC4wpTgZKSGLEQB7UFn6KXmZNBJ+RrXahVHw=;
	b=NSxjm/TKQH47AMPdLsFPJ6+7y4vOFXO1LqIwFr1zNxNjdo9U0LmrJnpEp27PVnYVehan
	 aVfyZGsKJTh8PC6ukN/kSb5bL9kGS9B1JMaZd4cU7s2N1p7TSA1meP/sivFAmG+UsdCgU
	 ARSwpTJE0EfLu5IoVriYAHS1ORQHeeCFHmtGqhGbNVxPnAXaQD3N3O5dAp+cjvUJyvFGI
	 larSe1Mkd5XkzwOhsLXbO+6GzzUa1M9RpE+Kb4JzzGbofzihFhZbi3XmzmGTkDC5rRJOw
	 k2YnlK/8M/zWr/5qvcD7t7Ep1lcyvLBj8k9GCCRWIPoGCTJJaJKU8wU6jDToj5xeaFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZcOKoPd;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438D8606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 438D8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZcOKoPd
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so3596366a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853255; x=1795458055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qVAF2xmuC4wpTgZKSGLEQB7UFn6KXmZNBJ+RrXahVHw=;
        b=FZcOKoPdyh8jxOWwm3uzwkTqwjC+TAiZxkllwC2MJHka0GAWrgen4iEh4GgO+1671L
         p1L9sTf2+G6FEON6rfCJb3I8vs/0tYI1Ncb2weKHNOatzj88aUp5I//LV3zipxhWTMuj
         wLcGKa+sTCvppwq/CyxjGFdYqRgmkIAHwmx3Qz76wXrKibZ6VUwZ+qhnLe6DgIVY8r9v
         sYvAo3ORvnPKC1VnYIFsjFzOqgIkoAIFIZN3zCP8YfNBEtwfFxjCEw/tiC49VuW3hLpZ
         PRqMNqOI1deRKYqzGEtxG7qxPW09xOxey5xBQESHYhzxf6zTcfPlfGRLguwgnXmqLg/5
         H9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853255; x=1795458055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qVAF2xmuC4wpTgZKSGLEQB7UFn6KXmZNBJ+RrXahVHw=;
        b=y0Gb9v+1+LRhbN9F0GXxKhbPGh80nbDLSUJpv8Qx40cgl5Civ2DXMepjuGjz9fGFwR
         zTsI5/yTCerw6FsE6W1AZazn3CnVJBy0vqj4aBDHt1m1ymFHsdoYoBcfBMpa4Pp87oDi
         wbNtLOMTSqLNsn2LxkTwODfUDDU4mRvVJgyog0MsusMgRAz3rIAlArvaod2RqYdousJj
         ucFInyNfzzbBcokQyQ5ZqbOMeBDQBKew7QHkaprBzCQKFYDQgKAw38NnbXmNir5CTfhf
         FEv2sFYyWh7jn9ZWZsgi5St1Tez/fCI28ATey3OeP/ARvCaOxjLfa/QmH2PvzHd9XtwU
         raaA==
X-Forwarded-Encrypted: i=1; AL+hErFm2h7Myin+zShA7RtfSAqWMRpaav2aXJZ5ma8wAjnvh08o3Y+pi9kJ8t2HRaKzMowBsgWocOjatkctKsY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bFvZNZUmSjlfWAu2iAJSI40GehwSJZdAt91HXkwDaB14afPw/
	Cv/9Sa39+SfJxMJckAKl80fm1uiZfQRxuPhnOXEww4x/1sMWTukgfM1a
X-Gm-Gg: AZFdTZe5MFaTxYeTiB1Uyq3Ok3CCovb72IdpR5flvDDac15QEcBlfkC18/swabwAryv
	qTz4KIKXCz06bXs5YBifYuR8R235DZeusOnx1q7LRiXCZ2V58sM9FO1r1kGniD7p5Vq7uqEDfZY
	mpNZvR79OnYfMVL2/BhmHmmgZYQTtiVKCpoPREhyVF15aXbrONvYRQ7YpnaBsfePbzY7qdle7PY
	rhS+ou+Fy/haNPyT3SsTHgHqUXd+Jn9tDRJF/msD5xeS5C0piO2o2OG4oU8OfTkUDWAAt37BAYf
	2LE2tCBM6/jXdYqXH0H6XTt8AxnkUI7+2K5sQuT0PpETVC1Pa764UnwKVd8FygoLIy5hTxmm9YX
	Nc3MQtHsVasgUPkEf6zkgz13z6xOJoCLKG90FD4MOaAyEV+ZNycl0YrJOroOM9ax/n59l7/7Uac
	Ga9jKwHe6lBL8CYhAKH4sqcQXv8X+264M1JF7mkCSWl19g1a0IJKqKYsqzD6Ga03r8hrJ5YFX4V
	ehyWYCi8/KgTqrsrwwRml5vPWapiMEXf57Ww2rFZlp2yAYAdjeCs3+HTM2fMbm8Z868EzguCCP5
	cBEWRcJMXE6BOvGl3D2HCUf30v/zFVfFe1E1o08f0OeCKRgkYEstkC3NzO4mCmYy+Mxlo7O2Dy5
	4aQre/8OwrekUIrVH+uGBjpUMopVr39WalQaybUhMoeZNDou3smml0NSJDQ==
X-Received: by 2002:a17:90b:2f08:b0:3b0:9a0d:b825 with SMTP id 98e67ed59e1d1-3b1b0a3c10cmr10695106a91.45.1794853255277;
        Mon, 16 Nov 2026 10:20:55 -0800 (PST)
Received: from localhost.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac29a846sm304780a91.9.2026.11.16.10.20.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 10:20:54 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michal.simek@amd.com
Subject: [PATCH net-next v3 2/3] i2c: xiic: add KUnit coverage for register access modes
Date: Mon, 16 Nov 2026 10:20:51 -0800
Message-ID: <20261116-wiwi-v3-87afa10a8-2-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261116-wiwi-v3-87afa10a8-0-ahmadexp@gmail.com>
References: <20261116-wiwi-v3-87afa10a8-0-ahmadexp@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exercise the driver's private register accessors with memory-backed
registers instead of physical hardware. Cover native byte/halfword and
forced 32-bit accesses in both register byte orders, across 22 register
offsets. Check payload truncation, high-bit values and neighboring
sentinels. These tests do not validate physical bus transaction widths
or hardware interrupt behavior.

An allocated RAM address is not a portable I/O cookie. Limit the test
to the direct x86-64 MMIO implementation, which uses ordinary memory
loads and stores at these addresses. Exclude UML (which can also set
X86_64) and indirect I/O. KUNIT_ALL_TESTS cannot enable the suite on
other architectures. This restriction does not apply to the driver.

Include the tests in the driver translation unit so no accessors need
to become exported interfaces. Require built-in KUnit to avoid a
built-in driver depending on a modular test framework. The tests follow
the driver into either its built-in image or module.

The four parameterized cases passed in an isolated x86-64 QEMU boot
with networking disabled and no physical-device passthrough.

Tool-origin disclosure, as required by generated-content.rst: Codex was
used to implement this test suite, run the KUnit build/boot and draft
this changelog, in response to a request for upstream-quality testing.

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 MAINTAINERS                               |  1 +
 drivers/i2c/busses/Kconfig                | 15 ++++
 drivers/i2c/busses/i2c-xiic.c             |  4 +
 drivers/i2c/busses/tests/i2c_xiic_kunit.c | 91 +++++++++++++++++++++++
 4 files changed, 111 insertions(+)
 create mode 100644 drivers/i2c/busses/tests/i2c_xiic_kunit.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0cf311e6c..4588569e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4018,6 +4018,7 @@ F:	drivers/cpuidle/cpuidle-zynq.c
 F:	drivers/edac/synopsys_edac.c
 F:	drivers/i2c/busses/i2c-cadence.c
 F:	drivers/i2c/busses/i2c-xiic.c
+F:	drivers/i2c/busses/tests/i2c_xiic_kunit.c
 F:	drivers/mmc/host/sdhci-of-arasan.c
 N:	zynq
 N:	xilinx
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 275aaa7f3..0a7a2aeb7 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1322,6 +1322,21 @@ config I2C_XILINX
 	  This driver can also be built as a module.  If so, the module
 	  will be called xilinx_i2c.
 
+config I2C_XILINX_KUNIT_TEST
+	bool "KUnit tests for Xilinx I2C register accesses" if !KUNIT_ALL_TESTS
+	depends on I2C_XILINX && KUNIT=y
+	depends on X86_64 && !UML && !INDIRECT_IOMEM
+	default KUNIT_ALL_TESTS
+	help
+	  Test the Xilinx I2C driver's register accessors with both byte orders
+	  and with native-width or forced 32-bit accesses. The tests use
+	  allocated RAM in place of registers. This relies on the direct
+	  x86-64 MMIO accessor implementation; no controller is required.
+
+	  The tests are compiled into the driver to exercise its private
+	  accessors, and follow the driver's built-in or module configuration.
+	  If unsure, say N.
+
 config I2C_XLP9XX
 	tristate "Cavium ThunderX2 I2C support"
 	depends on ARCH_THUNDER2 || COMPILE_TEST
diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index edb5e271c..7e2ed61c6 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1650,3 +1650,7 @@ MODULE_ALIAS("platform:" DRIVER_NAME);
 MODULE_AUTHOR("info@mocean-labs.com");
 MODULE_DESCRIPTION("Xilinx I2C bus driver");
 MODULE_LICENSE("GPL v2");
+
+#if IS_ENABLED(CONFIG_I2C_XILINX_KUNIT_TEST)
+#include "tests/i2c_xiic_kunit.c"
+#endif
diff --git a/drivers/i2c/busses/tests/i2c_xiic_kunit.c b/drivers/i2c/busses/tests/i2c_xiic_kunit.c
new file mode 100644
index 000000000..1b691de7e
--- /dev/null
+++ b/drivers/i2c/busses/tests/i2c_xiic_kunit.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Included by i2c-xiic.c to exercise the driver's private accessors. */
+#include <kunit/test.h>
+
+struct xiic_access_param {
+	const char *name;
+	enum xiic_endian endianness;
+	bool force_32bit_access;
+};
+
+static const struct xiic_access_param xiic_access_params[] = {
+	{ "native_little_endian", LITTLE, false },
+	{ "native_big_endian", BIG, false },
+	{ "word_little_endian", LITTLE, true },
+	{ "word_big_endian", BIG, true },
+};
+
+KUNIT_ARRAY_PARAM_DESC(xiic_access, xiic_access_params, name);
+
+static void xiic_register_access(struct kunit *test)
+{
+	static const int offsets[] = {
+		XIIC_DGIER_OFFSET, XIIC_IISR_OFFSET, XIIC_IIER_OFFSET,
+		XIIC_RESETR_OFFSET, XIIC_CR_REG_OFFSET, XIIC_SR_REG_OFFSET,
+		XIIC_DTR_REG_OFFSET, XIIC_DRR_REG_OFFSET, XIIC_ADR_REG_OFFSET,
+		XIIC_TFO_REG_OFFSET, XIIC_RFO_REG_OFFSET, XIIC_TBA_REG_OFFSET,
+		XIIC_RFD_REG_OFFSET, XIIC_GPO_REG_OFFSET,
+		XIIC_TSUSTA_REG_OFFSET, XIIC_TSUSTO_REG_OFFSET,
+		XIIC_THDSTA_REG_OFFSET,
+		XIIC_TSUDAT_REG_OFFSET, XIIC_TBUF_REG_OFFSET,
+		XIIC_THIGH_REG_OFFSET, XIIC_TLOW_REG_OFFSET,
+		XIIC_THDDAT_REG_OFFSET,
+	};
+	const struct xiic_access_param *param = test->param_value;
+	struct xiic_i2c *i2c;
+	u32 expected;
+	u8 *mem;
+	size_t i;
+	int reg;
+
+	i2c = kunit_kzalloc(test, sizeof(*i2c), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, i2c);
+	mem = kunit_kmalloc(test, 0x200, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, mem);
+	/* Only built for direct x86-64 MMIO, which accepts this RAM address. */
+	i2c->base = (void __force __iomem *)(mem + sizeof(u32));
+	i2c->endianness = param->endianness;
+	i2c->force_32bit_access = param->force_32bit_access;
+
+	for (i = 0; i < ARRAY_SIZE(offsets); i++) {
+		reg = offsets[i];
+		memset(mem, 0xa5, 0x200);
+
+		xiic_setreg8(i2c, reg, 0xc0);
+		expected = param->force_32bit_access ? 0xc0 : 0xa5a5a5c0;
+		KUNIT_EXPECT_EQ(test, (u32)xiic_getreg32(i2c, reg), expected);
+		KUNIT_EXPECT_EQ(test, xiic_getreg8(i2c, reg), (u8)0xc0);
+
+		xiic_setreg16(i2c, reg, 0x03ff);
+		expected = param->force_32bit_access ? 0x03ff : 0xa5a503ff;
+		KUNIT_EXPECT_EQ(test, (u32)xiic_getreg32(i2c, reg), expected);
+		KUNIT_EXPECT_EQ(test, xiic_getreg8(i2c, reg), (u8)0xff);
+
+		xiic_setreg32(i2c, reg, 0x12345678);
+		KUNIT_EXPECT_EQ(test, (u32)xiic_getreg32(i2c, reg),
+				0x12345678U);
+		KUNIT_EXPECT_EQ(test, xiic_getreg8(i2c, reg), (u8)0x78);
+		KUNIT_EXPECT_EQ(test, mem[reg + sizeof(u32)],
+				(u8)(param->endianness == BIG ? 0x12 : 0x78));
+		KUNIT_EXPECT_EQ(test, mem[reg + sizeof(u32) + 3],
+				(u8)(param->endianness == BIG ? 0x78 : 0x12));
+		xiic_setreg32(i2c, reg, 0x89abcdefU);
+		KUNIT_EXPECT_EQ(test, (u32)xiic_getreg32(i2c, reg),
+				0x89abcdefU);
+		KUNIT_EXPECT_EQ(test, xiic_getreg8(i2c, reg), (u8)0xef);
+		KUNIT_EXPECT_EQ(test, mem[reg + sizeof(u32) - 1], (u8)0xa5);
+		KUNIT_EXPECT_EQ(test, mem[reg + 2 * sizeof(u32)], (u8)0xa5);
+	}
+}
+
+static struct kunit_case xiic_access_test_cases[] = {
+	KUNIT_CASE_PARAM(xiic_register_access, xiic_access_gen_params),
+	{}
+};
+
+static struct kunit_suite xiic_access_test_suite = {
+	.name = "i2c_xiic",
+	.test_cases = xiic_access_test_cases,
+};
+
+kunit_test_suite(xiic_access_test_suite);
