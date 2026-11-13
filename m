Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794541376;
	b=SQSzMrOhRm39WWH5eJBzIINkIkfBNXNiIUo6/PXNbA0EqmQaQDo1wCRcJLMBjUr1aKy2
	 jZMv4vA+sAg2V/WqzdQCfR7sd8cW99jv9KJADwfy517Pqm9oMOE9Y/v0fYwdmwQLJQDK+
	 J9VJXHQGeD1AxAOjaq+B3T8znnmdCWDHvpG44AQghl6bC50DFLGY82ozKgnZef//QyT+W
	 +OstUCu0f7W7fORMXZDMpvDBt2qEuNTuKAaumXE99YY0sAJVuY2zNd8wdopH/dk1IK8cJ
	 iSdXDzomnfZBEVlxMpCQcE2PuDFezrom+Fj/7BaznPBr9wsJsFxXBnLrhjlcaTJkxnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794541376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LKh2ZwYpeTM0ZCGUcNGyfm8IHaa5myXk/G20L7iFsfI=;
	b=R/V6dRX0MwT7jbFTi2Py8PmZ3ivNwKjrkz4JV1lUOABEtX7mOmQGWrPrEO8hoOx63JiC
	 UrP3uYBdbfmUUcF7tNKSCUFrLVwOQqtoMkGroDUxQMDsYhZj++DXA4lQZvrN+pGj2/oKc
	 1xM61zoQE8MLnGA9zQ8vwH8qWPSGAoGUbDpq76xhHhYW7zOrR8hsT5CSzk7OT/rla2hmD
	 jj1H02SZDqcrZOiVBDsJI7V/SAh0crV3NXEdIul9G6qIsSX6BkCccUNNZcoS0lt1K15VT
	 6092t2Q30p7eqIUKR6CQe8LgkWDQarSP1tlfXbz3jl4wtraQcWcdb/TnrT/3xEV02cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZdGBMwRi;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946E8606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 946E8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZdGBMwRi
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso690425eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794541375; x=1795146175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LKh2ZwYpeTM0ZCGUcNGyfm8IHaa5myXk/G20L7iFsfI=;
        b=ZdGBMwRiKjJ9CoevEffgSM2T4mak8uQ9m/m3wpjSeQYCWDvQqAlcg7Ghu6hSDL8xXn
         Ao2n5DxZuPoaqqzoMqml0LQrfbZcroBjWv89jfAn10FjwxqAX7323DlfLcw/w0IJQWhK
         63/XZR7FfpaMCs+DYu3HHQNa1jw7l10hN1vzXiYsVtsVs+JYsp7Wka/xQqzXO0mgfg57
         UV084PXE50QoWBJt9BdD9rAws1MizDy7yR60zzyc+2VqDR1eAvHqeWl/qLNybbYyB838
         WrOJf1s3efwBbaWttv2nDZIgmD3ZBNKu93tTJ2VH0EXihDXQdkNTT2L6X9CuGbFEYvEz
         dvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794541375; x=1795146175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LKh2ZwYpeTM0ZCGUcNGyfm8IHaa5myXk/G20L7iFsfI=;
        b=uUeylvFMnZvZJpTJLb0dWM9pxjDB9vI3kB6ZRWZx6hSAtaCrYnkLlJ3CochQw8BhHB
         z3YX+FyEHqMm/6lAfF6p9MXgDt9tzZGM/6y02F814Q5521bD3LS8hezZf5E1ZJoPw7L4
         fPbv5spmm6LXapxDySQBA5MaXK/hODdJ/QU831EqUnWit9X7iwd+IpXVc4f+KHEl39fL
         IeyDvF5H7OnlwlFN0QYcH4VM3bn4Gq+JuVwBzTsrdVqX2ZygbDkUj5axwNBpZhucSvp4
         ZPNz7axULEBjzuZk9vGOUdSpjTUpNsGRjo60p7bs9+rMd5Zd8FnS/DIiPZkP5uC78XZT
         xR/Q==
X-Forwarded-Encrypted: i=1; AL+hErEKii+OeQbKntQrePRurM4tbCZDwhkULlBEHSt6lRmXiWz4CG9/tZwGNlSUhLydyA7E1DI5rm95LFrqiPE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SCUpms3Y/74FO/Agc1OS2fzp/OTFJYge1N8Oxp11DcDZZ4apG
	KQj2OJ1mGmN5q0JRZb4tFvhVh6K8lIABMbgVM27FFUa4PoEapkGZjn/x
X-Gm-Gg: AYBFou2fDeTyFF0ijRb4Uy0iggNm7nfThwoXuFo2Q1QCaiM723RDBypQJjmtm41ZqHO
	7a3TsIbMTYS52+3qouL7kj6oYo/zUG/r5EggwK7Q5O5HLxz35yzERekDDIwoTAihAUWXnfnK3jC
	roS69gsTsQiM3Va5X1JCxiPyjsh09afhdDuy4mwaNzcnJINqDQqw53bY99u88cpSvPAZD/qWZwV
	cWjauSBGrHVojjgwwUqrNXabM01LwKgj0dvMfy3fYapGx3tJeGlHSCYyTdFJvRP6xFkP9cAOgO0
	XFHNDwpj85vK+NLi/DsOPgvvpRaBbWyIp+snKO9JMgUpGQNbfw8nhQvida0QD3nVP82n82kKUNv
	gr4FpMeVxr2spr7b8bsBNLd+6N/RpHigjewXqDMyydtW1OY92bAR8z7Op2r9vX4Do2fINlTaC3O
	GWDUL9WROPvsKdwwfUoIItnGct6EvGoueRha/K19b2kEjK0ng2sVJR6Rm8ebSx/iMt3NnQ+15My
	r7cHK4U9ZL8fesUL5Zn3yzTgPB4ZfGO77mutricDMyK7lgQZ5rVga47u2leewaCiyOMXnyyv9Xe
	O7T9bRwlE5NHqHQwP8cZnf5UWi2VW5IBnu/qOXAKzKj/
X-Received: by 2002:a05:693c:2a06:b0:36f:4981:da16 with SMTP id 5a478bee46e88-37967600833mr856686eec.25.1794541374349;
        Thu, 12 Nov 2026 19:42:54 -0800 (PST)
Received: from debian.prasanth ([114.79.136.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm2999565eec.15.2026.11.12.19.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 19:42:53 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: srini@kernel.org
Cc: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	neal_liu@aspeedtech.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v1 1/1] nvmem: aspeed: Add read-only AST2600 OTP support
Date: Fri, 13 Nov 2026 09:12:13 +0530
Message-ID: <20261113034213.158390-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
References: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
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

Expose permitted AST2600 OTP data through NVMEM using the existing SBC
node. Serialize controller transactions, bound completion polling and
reject reads into the configured secure prefix.

Adapt the read sequence from ASPEED's downstream driver, preserving its
attribution. Register the driver for ASPEED review and restrict raw OTP
access to root.

Link: https://github.com/AspeedTech-BMC/linux/blob/769f62b7baa84d6998723b0ea60280e380183553/drivers/soc/aspeed/ast2600-otp.c
---
Tested on ASRock Rack B650D4U, AST2600 A3, OpenBMC Linux 6.18.24:
- Repeated, paired and cross-pair reads matched.
- Four concurrent readers completed 40 matching reads.
- Bytes 8172..8183 matched a separate vendor-derived reader.
- Synthetic pre-MMIO timeout, failure latching and rebind recovery passed.
Host fault-injection tests passed all 42 polling-timeout cases.

 MAINTAINERS                 |   1 +
 drivers/nvmem/Kconfig       |  12 ++
 drivers/nvmem/Makefile      |   1 +
 drivers/nvmem/ast2600-otp.c | 259 ++++++++++++++++++++++++++++++++++++
 4 files changed, 273 insertions(+)
 create mode 100644 drivers/nvmem/ast2600-otp.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb3..c92ea8e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2813,6 +2813,7 @@ F:	Documentation/devicetree/bindings/arm/aspeed/
 F:	arch/arm/boot/dts/aspeed/
 F:	arch/arm/mach-aspeed/
 F:	arch/arm64/boot/dts/aspeed/
+F:	drivers/nvmem/ast2600-otp.c
 N:	aspeed
 
 ARM/AXIADO ARCHITECTURE
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index d2f5bb2..cdcd071 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -164,6 +164,18 @@ config NVMEM_APPLE_SPMI
 	  This driver can also be built as a module. If so, the module
 	  will be called apple-nvmem-spmi.
 
+config NVMEM_ASPEED_AST2600_OTP
+	tristate "ASPEED AST2600 OTP support"
+	depends on ARCH_ASPEED || COMPILE_TEST
+	depends on HAS_IOMEM
+	help
+	  Read-only access to the AST2600 OTP data region. The configured
+	  secure prefix is not exposed. Fuse programming is not supported.
+	  The controller reads paired 32-bit words through command registers.
+	  Access to raw OTP data is restricted to root.
+
+	  If built as a module, the module will be called ast2600-otp.
+
 config NVMEM_BCM_OCOTP
 	tristate "Broadcom On-Chip OTP Controller support"
 	depends on ARCH_BCM_IPROC || COMPILE_TEST
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 5e70bad..9fac69d 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_NVMEM_APPLE_EFUSES)	+= nvmem-apple-efuses.o
 nvmem-apple-efuses-y 			:= apple-efuses.o
 obj-$(CONFIG_NVMEM_APPLE_SPMI)		+= apple_nvmem_spmi.o
 apple_nvmem_spmi-y			:= apple-spmi-nvmem.o
+obj-$(CONFIG_NVMEM_ASPEED_AST2600_OTP)	+= ast2600-otp.o
 obj-$(CONFIG_NVMEM_BCM_OCOTP)		+= nvmem-bcm-ocotp.o
 nvmem-bcm-ocotp-y			:= bcm-ocotp.o
 obj-$(CONFIG_NVMEM_BRCM_NVRAM)		+= nvmem_brcm_nvram.o
diff --git a/drivers/nvmem/ast2600-otp.c b/drivers/nvmem/ast2600-otp.c
new file mode 100644
index 0000000..94b1225
--- /dev/null
+++ b/drivers/nvmem/ast2600-otp.c
@@ -0,0 +1,259 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) ASPEED Technology Inc.
+ *
+ * ASPEED AST2600 OTP Controller driver
+ * Read sequencing adapted from ASPEED's downstream ast2600-otp driver.
+ */
+
+#include <linux/align.h>
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#define AST2600_OTP_PROTECT_KEY		0x00
+#define AST2600_OTP_CMD			0x04
+#define AST2600_OTP_ADDR		0x10
+#define AST2600_OTP_STATUS		0x14
+#define AST2600_OTP_COMPARE_1		0x20
+#define AST2600_OTP_COMPARE_2		0x24
+
+#define AST2600_OTP_CMD_READ		0x23b1e361
+#define AST2600_OTP_CMD_WRITE_MODE	0x23b1e362
+#define AST2600_OTP_UNLOCK_KEY		0x349fe38a
+#define AST2600_OTP_STATUS_DONE		0x6
+#define AST2600_OTP_TIMEOUT_US		100000
+
+#define AST2600_OTP_DATA_WORDS		0x800
+#define AST2600_OTP_SIZE			(AST2600_OTP_DATA_WORDS * sizeof(u32))
+#define AST2600_OTP_CONF0_ADDR		0x800
+#define AST2600_OTP_CONF0_SEC_SIZE		GENMASK(21, 16)
+#define AST2600_OTP_SEC_SIZE_UNIT		(32 * sizeof(u32))
+
+struct ast2600_otp {
+	void __iomem *base;
+	/* Serialize the complete unlock, read and relock sequence. */
+	struct mutex lock;
+	bool failed;
+};
+
+static int ast2600_otp_wait_complete(struct ast2600_otp *otp)
+{
+	u32 status;
+	int i, ret;
+
+	/* Allow the command to start before sampling the idle flags. */
+	udelay(1);
+
+	/* Match the downstream sequence: observe both idle flags twice. */
+	for (i = 0; i < 2; i++) {
+		ret = readl_poll_timeout(otp->base + AST2600_OTP_STATUS,
+					 status,
+					 (status & AST2600_OTP_STATUS_DONE) ==
+					 AST2600_OTP_STATUS_DONE,
+					 1, AST2600_OTP_TIMEOUT_US);
+		if (ret) {
+			/* Do not reuse a controller with an outstanding command. */
+			otp->failed = true;
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int ast2600_otp_prepare_read(struct ast2600_otp *otp)
+{
+	static const u32 mode_addresses[] = { 0x3000, 0x5000, 0x1000 };
+	int i, ret;
+
+	ret = ast2600_otp_wait_complete(otp);
+	if (ret)
+		return ret;
+
+	/*
+	 * Restore the macro's default read mode, as in otp_soak(ctx, 0).
+	 * These writes target volatile mode registers, not OTP fuse cells.
+	 * No fuse programming command or programming timing is used.
+	 */
+	for (i = 0; i < ARRAY_SIZE(mode_addresses); i++) {
+		writel(mode_addresses[i], otp->base + AST2600_OTP_ADDR);
+		writel(0, otp->base + AST2600_OTP_COMPARE_1);
+		writel(AST2600_OTP_CMD_WRITE_MODE, otp->base + AST2600_OTP_CMD);
+		ret = ast2600_otp_wait_complete(otp);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int ast2600_otp_read_pair(struct ast2600_otp *otp,
+				 unsigned int aligned_word,
+				 u32 *word0, u32 *word1)
+{
+	int ret;
+
+	/* The hardware reads two words starting at an even word index. */
+	if ((aligned_word & 1) || aligned_word >= AST2600_OTP_DATA_WORDS)
+		return -EINVAL;
+
+	writel(aligned_word, otp->base + AST2600_OTP_ADDR);
+
+	writel(AST2600_OTP_CMD_READ,
+	       otp->base + AST2600_OTP_CMD);
+
+	ret = ast2600_otp_wait_complete(otp);
+	if (ret)
+		return ret;
+
+	*word0 = readl(otp->base + AST2600_OTP_COMPARE_1);
+	*word1 = readl(otp->base + AST2600_OTP_COMPARE_2);
+
+	return 0;
+}
+
+static int ast2600_otp_read(void *context, unsigned int offset,
+			    void *val, size_t bytes)
+{
+	struct ast2600_otp *otp = context;
+	u8 *buf = val;
+	unsigned int word_index;
+	unsigned int aligned_word;
+	unsigned int secure_size;
+	__le32 pair[2];
+	u32 conf0;
+	u32 word0, word1;
+	size_t chunk, skip;
+	int ret;
+
+	if (!bytes)
+		return -EINVAL;
+
+	if (offset % sizeof(u32) || bytes % sizeof(u32))
+		return -EINVAL;
+
+	if (offset >= AST2600_OTP_SIZE ||
+	    bytes > AST2600_OTP_SIZE - offset)
+		return -EINVAL;
+
+	mutex_lock(&otp->lock);
+
+	if (otp->failed) {
+		ret = -EIO;
+		goto out_unlock;
+	}
+
+	writel(AST2600_OTP_UNLOCK_KEY, otp->base + AST2600_OTP_PROTECT_KEY);
+
+	ret = ast2600_otp_prepare_read(otp);
+	if (ret)
+		goto out_lock;
+
+	/* Configuration word 0 describes the unreadable secure data prefix. */
+	writel(AST2600_OTP_CONF0_ADDR, otp->base + AST2600_OTP_ADDR);
+	writel(AST2600_OTP_CMD_READ, otp->base + AST2600_OTP_CMD);
+	ret = ast2600_otp_wait_complete(otp);
+	if (ret)
+		goto out_lock;
+
+	conf0 = readl(otp->base + AST2600_OTP_COMPARE_1);
+	secure_size = FIELD_GET(AST2600_OTP_CONF0_SEC_SIZE, conf0) *
+		      AST2600_OTP_SEC_SIZE_UNIT;
+	/* Conservatively deny the entire secure prefix, including its header. */
+	if (offset < secure_size) {
+		ret = -EACCES;
+		goto out_lock;
+	}
+
+	while (bytes) {
+		word_index = offset / sizeof(u32);
+		aligned_word = ALIGN_DOWN(word_index, 2);
+
+		ret = ast2600_otp_read_pair(otp, aligned_word,
+					    &word0, &word1);
+		if (ret)
+			goto out_lock;
+
+		pair[0] = cpu_to_le32(word0);
+		pair[1] = cpu_to_le32(word1);
+		skip = (word_index - aligned_word) * sizeof(u32);
+		chunk = min(bytes, sizeof(pair) - skip);
+
+		memcpy(buf, (u8 *)pair + skip, chunk);
+		buf += chunk;
+		offset += chunk;
+		bytes -= chunk;
+	}
+
+	ret = 0;
+
+out_lock:
+	writel(0, otp->base + AST2600_OTP_PROTECT_KEY);
+	/* Flush the protection write before another reader takes the mutex. */
+	readl(otp->base + AST2600_OTP_PROTECT_KEY);
+out_unlock:
+	mutex_unlock(&otp->lock);
+	return ret;
+}
+
+static int ast2600_otp_probe(struct platform_device *pdev)
+{
+	struct nvmem_config config = {};
+	struct nvmem_device *nvmem;
+	struct ast2600_otp *otp;
+
+	otp = devm_kzalloc(&pdev->dev, sizeof(*otp), GFP_KERNEL);
+	if (!otp)
+		return -ENOMEM;
+
+	otp->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(otp->base))
+		return PTR_ERR(otp->base);
+
+	mutex_init(&otp->lock);
+
+	config.dev = &pdev->dev;
+	config.name = "ast2600-otp";
+	config.id = NVMEM_DEVID_AUTO;
+	config.owner = THIS_MODULE;
+	config.type = NVMEM_TYPE_OTP;
+	config.read_only = true;
+	config.root_only = true;
+	config.word_size = sizeof(u32);
+	config.stride = sizeof(u32);
+	config.size = AST2600_OTP_SIZE;
+	config.reg_read = ast2600_otp_read;
+	config.priv = otp;
+
+	nvmem = devm_nvmem_register(&pdev->dev, &config);
+	return PTR_ERR_OR_ZERO(nvmem);
+}
+
+static const struct of_device_id ast2600_otp_of_match[] = {
+	{ .compatible = "aspeed,ast2600-sbc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ast2600_otp_of_match);
+
+static struct platform_driver ast2600_otp_driver = {
+	.probe = ast2600_otp_probe,
+	.driver = {
+		.name = "ast2600-otp",
+		.of_match_table = ast2600_otp_of_match,
+	},
+};
+module_platform_driver(ast2600_otp_driver);
+
+MODULE_AUTHOR("Neal Liu <neal_liu@aspeedtech.com>");
+MODULE_AUTHOR("Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>");
+MODULE_DESCRIPTION("ASPEED AST2600 read-only OTP NVMEM driver");
+MODULE_LICENSE("GPL");
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

