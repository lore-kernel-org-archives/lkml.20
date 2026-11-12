Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501227;
	b=nk1DsreLgSrFCmuGzR0shzljNw8Qgumg/svkRJWokVaXvWWt1oDi56JNoczuZJ3AnBBK
	 th73iAAsoEt5q47NImZJ2JgI0vqx0PAOb4v8OXv6qzEZW3WP2eoSvukEmUBA4UJmqlqTg
	 bnpxxP0BXoD8xVhcdQXro2h15f3Xo4J8PpqGirPR41GGO4bmbeANqtsrjvQKJAN69iSXM
	 V2KBCIHks6ASY9TfuaLO07rSLrrZart6JlwazG91d0Gi8wzmtVFJEkYUlUOJ4beufkzxX
	 vmKSL8TuvSH/0TJKNqCArSXrr4CGfKWPvtIMOIPqxSDbWi1EnBqs5ccekfbcNLJWwjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fq2Tsxhf5rFExqtMe5i2fmiOO7MCidBfvMh2Y6TVSf4=;
	b=yD2ZhftDSLOoXOAbVieSRRKdK3iz6eGFe2n1VypjLDplAwjjmRY3QjxPIsRw68YGNF0x
	 rui88eSFxj8sMViz++M/uy2Bh5rU46Ml/52/M+uvMQo5LwS4cYepmP2pS4hvY5bebhw0o
	 wsNtYglX8iPtovOOYOwTPyeLPJBsaLqLNR8E2n3jJySxK6efEXPcNrLeihlbHmdhHbWx8
	 DcGsu991g7sc7wgi0sCPjT0td/JDsIPPy7fyH7TyQG+joPuac16m2egZScw+jI8ocKb3c
	 QHPHDTjWKyHBc9E+712BQ+dvq0Rq9LRIueZviCd/La1UScn8XCz+YO/7JXlAQEl3n2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gbxi3VQ6;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAA9606A330
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BAA9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gbxi3VQ6
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1438d9363fbso17430c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501226; x=1795106026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fq2Tsxhf5rFExqtMe5i2fmiOO7MCidBfvMh2Y6TVSf4=;
        b=Gbxi3VQ6FZ4SKA8SpkY+K+CI/ecuWylsppICb+x8IPsxjVU/Hmbl+EXZdNBHoVdA31
         IWXVcAJT5Kar6Ymq21q9MyjUeqDq9dkUIS3agnXxAhujjtYt2p6QF+hoWiFi7+epcJss
         ej0SvU3DyZd3hsjtjd/S4xMxqfmBS2oztn7Lsz4PQ/yxRzFRNG37KNPCSVMhv8s7ir8j
         bXfbI+x2u64n56WsUVv7eU69fv8vfnAn1EOrppcnYK4yeDsMLS4vzb7JskBHn/OtyJf9
         gqCqFUmOgqcfIW+ioD+KuSukPQrdUsJlBvA4CqGZASxMD0tkzVDQuBSG67gkRBqSRtlt
         mBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501226; x=1795106026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fq2Tsxhf5rFExqtMe5i2fmiOO7MCidBfvMh2Y6TVSf4=;
        b=NOpG4GjaKQHWLvNI+Td6nDTWTk3vNVfnuNunep11+R/rh2kZQPThyt6fJZIFAFkWnv
         fhgP2rJrEOWQezAVtlZMEy3ugDtk/yNIZpc122er+GrA2EtH6vZFpYzIey4Y/YD/MPVI
         gUI2Br/7MDHuJ/JLfhIgp//UvNFLq6EAAxKX7CujEoca0p/yqnZuz1dqUgSEKHxry3GS
         2mZ7yrWrnkSopV8IPBN+gY28eZw/5h/yPPY1WWsz/8aKA4YKTT67kqkr7a15xqebFlsj
         NQAKs9u4jb+2u+akwurONI7LDs6qlAU2dhodrMO5aa8cU5yXLG2AxXwH6qb1S9hT1i6t
         MqLQ==
X-Forwarded-Encrypted: i=1; AL+hErFrufUrDRj1MzNyW2CUMGb7k9NpL8JxuzUuknL56XWOBiluMk4eIB/jpj1HsRBGUdAiOHi7x1Yh8dFQePQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9z81BCFuldc1p5nRFlWvQBssVOR19bSmAcRolMjoHCCN6WpiEK
	r2KTM2MwEWVyXgmmBdrWFu5p/98NA1duEUpH9s8YdKIeFMZ9jSHz/15z
X-Gm-Gg: AYBFou36YYmO9KySYymuxOlrcblH8yY3qzve8AQEr5t6kLsB5SSp9xsB8NW4EdBgTCU
	Kmhyo2xAj2rdsIJUNYRleQMH5n7vb6yFQZyeyFHXI+1JGmN3jeWOQlmOxUDUdbrkY6re9Tdb2xu
	pwLu3diYMW29zDa9LS4/XgedjkmpyGTdyYwZ1wBH9BxdNQcWpQEXrFH5yHLY1Ioo+xunmUgLSGZ
	ff2cYzgf5nVRynZebTZUMTRv29/3RgOj/7JiN8rlOrQ3vHddN79RLRafhM/+vryEAexszNhv1Yb
	HSa8sJyCxuA8WM/MnnrpMWdO/FcL0gMZ5wLObkDoNw103WEI409xEMDwm2vcWGERj13asGECfDI
	Xf6msbI6gNajeFWLnsi8HZFBEGzNa47tdBIbetp4+Awa2tXdxgE0MFdT4VOu1OtJ4hoYKKHnypW
	VTt26/28eSCJKBmGrff/EoMLPfAAUVcJR98xZpfkSrnnhidse3Y68ZzsCIOsJHpL63C+xfRR1nU
	lj38RFwR/Imm2Ls2tY04JjdOLgsI6I36gxJpwBdyNLIVHpy5w3O3P+duAoLcaYE1WW830+w8k/K
	EVXnz+Ps/j1aFvBcR7pUwKzpCHg76btAsigq/jNwPCnPQh3v2rrP6rmC70MPObifCyUgmzUJuF8
	O2m2F0/+eMlAVXg3fvZIMyl+MX3r/02wUjkLslOo9hdAIZ5y4OEka3A7gxZGHQgEZ+fpnRthP
X-Received: by 2002:a05:701b:4294:10b0:1b3:b3d5:566f with SMTP id a92af1059eb24-1b5030990dbmr88896c88.11.1794501225666;
        Thu, 12 Nov 2026 08:33:45 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm230248c88.0.2026.11.12.08.33.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 08:33:45 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next v2 2/3] i2c: xiic: add KUnit coverage for register access modes
Date: Thu, 12 Nov 2026 08:33:31 -0800
Message-ID: <20261112163333.12523-3-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112163333.12523-1-ahmadexp@gmail.com>
References: <20261112163333.12523-1-ahmadexp@gmail.com>
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
 drivers/i2c/busses/Kconfig                | 14 ++++
 drivers/i2c/busses/i2c-xiic.c             |  4 +
 drivers/i2c/busses/tests/i2c_xiic_kunit.c | 91 +++++++++++++++++++++++
 4 files changed, 110 insertions(+)
 create mode 100644 drivers/i2c/busses/tests/i2c_xiic_kunit.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 893b0670a..64fa74c40 100644
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
index 275aaa7f3..014281fa2 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1322,6 +1322,20 @@ config I2C_XILINX
 	  This driver can also be built as a module.  If so, the module
 	  will be called xilinx_i2c.
 
+config I2C_XILINX_KUNIT_TEST
+	bool "KUnit tests for Xilinx I2C register accesses" if !KUNIT_ALL_TESTS
+	depends on I2C_XILINX && KUNIT=y
+	default KUNIT_ALL_TESTS
+	help
+	  Test the Xilinx I2C driver's register accessors with both byte orders
+	  and with native-width or forced 32-bit accesses. KUnit is a kernel
+	  unit testing framework. These tests use memory-backed registers and
+	  do not require an I2C controller.
+
+	  The tests are compiled into the driver to exercise its private
+	  accessors, and follow the driver's built-in or module configuration.
+	  If unsure, say N.
+
 config I2C_XLP9XX
 	tristate "Cavium ThunderX2 I2C support"
 	depends on ARCH_THUNDER2 || COMPILE_TEST
diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 8425a540f..6c0f04aaa 100644
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
index 000000000..b4c818d8b
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
+	/* Aligned RAM stands in for MMIO. No hardware is accessed. */
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
