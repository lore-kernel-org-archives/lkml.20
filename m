Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1524BA1C1
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963969; cv=none; b=Cqko116LuzDROb7cmJWUB0c126MddDkL2jlPzGEsx+8rwc8t2lGZTvWv7gjq1jeNsuQZXuoJDyoSZI/Ra5lCRF7s0Cf8Gkbem/xGVJWQycj3KEXdC9GE/P2HEnFP+8ZfTpz5Qj3fCZg8QlYuCS1L9QoyfQlggmZY3tCjgBdaog8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963969; c=relaxed/simple;
	bh=RfqMKSFM0scXEd3t9DBM9oELeQHeOiEd/sfSVVzp2EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ccQwhEq/7oyoTVxVF2vPkVvJXmUrGf4/GWVnh/emiF1PKhqNiGvTa+pRC3UOz7lMayVoWwWUbweF3gIkonE6BuSBD81i0BEwzY6uXWQZXMyJozJpK6PAub+uySabRwICfrcp9X43IUKcH8B3xCE8HTGXrbgLHtIFo8RM76nhze4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qrSJzumr; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qrSJzumr"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8ad5b31c7so21423925ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791963961; x=1792568761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+mIieeGY1UVHx10SysmP5f2W/As1aw4zkNpA5Xc1vkM=;
        b=qrSJzumrtJkg+B4RfgqnPxs+SfHgjezLd/LPt4rFusPBaWjEM23Bw76vdsrR3ZjOvS
         ouC4UNPTZ8eZmaBW0JJFmGC2w+B3mCmYlyadvs7Mj6vsOi+ZUUuO49UEzBwR2LiCt4+f
         hthXc9rMDfaInropjGsGfaIIAlBSMGAGNnp5nBydPOWGLPuwp0bW9uMjyA1GMbi10cz7
         8e7NsJmDLpYi6b+/BXRM1W4b2Nv2NIctaE4F18IIF8qT70xrGMV8lDA/Pc34HZevE7rU
         ackWyk/VTYOsZEKdv6Lav0Ki91J0b7lYja9QSIn9uPqayZ+vtcV7104Qvyl8L+tmz7H6
         K8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963961; x=1792568761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+mIieeGY1UVHx10SysmP5f2W/As1aw4zkNpA5Xc1vkM=;
        b=hAYmQMA5ALSWARhj6rQUmF0DwnHB7DWGUo0MXSMznYvOugmtjia39xihXa/dY7fDmj
         xyxkzK9acJEjC+b4FlS5VwHlo0ugwHWFI2RhLzNx5uh/bxmpCJzU7h3vh6bIN2EQTygp
         A2iYMMNPSmGv9KVhYEmg0puA71z/XJljfjzmuSEIEo/4zfnKfaONZFrKWBGh+1kti2be
         ZctnRSL2FIUPu5yemUREpVLXaidDGk9g8wlL/bFx5WTxnhNKYs+nzSpJ2QCQDpHQO4WI
         klPp71Yjqy+hHApftfCnt6FF5GGTpwUbJUIbQkMXarxufbxD9Y88OZWnNMRS24EzKsD+
         7y1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxPZoZNH4HST+KQa8mNl9+B2B9rUqd+Oce9lim0JdkN6NYXXUZTJ/GmhW3DpsC8e765Bcrin4QKPMkrIUA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZEGKluXeu5YvwcTzBJZm1IUW3DAr+5qz9MdZD1gct5XFFj4jV
	x4ylxRCjXLpq7HkIB+ACqx4soLJqmzmZ0bUMBe5G/QdN/eZDK3gHc7n7
X-Gm-Gg: AYBFou3IN8+GG87X/CLBasO7+X3wpNmy9wOne8doV01EXpMAbkmxN9wYbqWPoKKvzkY
	M8gWAwBvt6Prq2KptPRHYM4Uwr79rdzA+ovCH3CJBfkmYOK/WlxbjPgRhjYOGOLi9ZTxBq85aFl
	uXsYE8whgAKgZm/W+PLgPQXePtcHuDT6UDkYRedP24u3C9+5LaZpnNoBeKwfQyEqca94Be3h/SH
	EA/TIUX7HXhcQIZUDuhHA47dwLIRy1Fh1bpPrUtION5SZ2b9MKyf9cYOqGeGUmfVotLSol3tNjy
	kuM9QldMWJT6nKrBMU48FXqB03GKWyg0zCl/XXu56aS8U2MlRZFrJ9Br+SAT7KVvqZidVxZ0hlX
	bBmbsr9TG5TXSCH8Z0NI+9wcG8VDgtIuLtx883K/+eYyZFLr1X/ymRNQ8bD+YAaU1KsS8jCAlG9
	7VHg5hdXw07tPoC1all6CnVu7h7tjNvBUw6yuO8Sbo6Ve1LxyoChgQnnh8j365eXkGVbSt
X-Received: by 2002:a17:903:2307:b0:2e9:401f:f102 with SMTP id d9443c01a7336-2e9401ffc4cmr7724765ad.32.1791963960773;
        Wed, 14 Oct 2026 00:46:00 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a05f70sm65986985ad.7.2026.10.14.00.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:46:00 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
Date: Wed, 14 Oct 2026 15:45:14 +0800
Message-ID: <20261014074516.240247-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014074516.240247-1-inochiama@gmail.com>
References: <20261014074516.240247-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sophgo SoCs such as SG2044 contain eFuses used to store
factory-programmed data.

As for SG2044, HW automatically loads the eFuse content
into shadow registers which are organized as 32bit values
exposed as MMIO.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/nvmem/Kconfig        |  12 +++
 drivers/nvmem/Makefile       |   2 +
 drivers/nvmem/sophgo-efuse.c | 176 +++++++++++++++++++++++++++++++++++
 3 files changed, 190 insertions(+)
 create mode 100644 drivers/nvmem/sophgo-efuse.c

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index c36c2a4c2a0b..a7936dd65bdd 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -465,6 +465,18 @@ config NVMEM_SNVS_LPGPR
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem-snvs-lpgpr.
 
+config NVMEM_SOPHGO_EFUSE
+	tristate "Sophgo eFuse support"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	default ARCH_SOPHGO
+	help
+	  Say y here to enable support for reading eFuses on Sophgo SoCs
+	  such as the CV1800B. These are e.g. used to store factory programmed
+	  calibration data required for the builtin ethernet PHY.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called nvmem-sophgo-efuse.
+
 config NVMEM_SPMI_SDAM
 	tristate "SPMI SDAM Support"
 	depends on SPMI
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 2bbfb9ff1885..430ddddf8c3c 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -79,6 +79,8 @@ obj-$(CONFIG_NVMEM_SC27XX_EFUSE)	+= nvmem-sc27xx-efuse.o
 nvmem-sc27xx-efuse-y			:= sc27xx-efuse.o
 obj-$(CONFIG_NVMEM_SNVS_LPGPR)		+= nvmem_snvs_lpgpr.o
 nvmem_snvs_lpgpr-y			:= snvs_lpgpr.o
+obj-$(CONFIG_NVMEM_SOPHGO_EFUSE)	+= nvmem-sophgo-efuse.o
+nvmem-sophgo-efuse-y			:= sophgo-efuse.o
 obj-$(CONFIG_NVMEM_SPMI_SDAM)		+= nvmem_qcom-spmi-sdam.o
 nvmem_qcom-spmi-sdam-y			+= qcom-spmi-sdam.o
 obj-$(CONFIG_NVMEM_SPRD_EFUSE)		+= nvmem_sprd_efuse.o
diff --git a/drivers/nvmem/sophgo-efuse.c b/drivers/nvmem/sophgo-efuse.c
new file mode 100644
index 000000000000..5f90adaf8e4f
--- /dev/null
+++ b/drivers/nvmem/sophgo-efuse.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Sophgo SoC eFuse driver
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/cleanup.h>
+#include <linux/iopoll.h>
+#include <linux/math.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nvmem-provider.h>
+#include <linux/platform_device.h>
+
+#define SG2044_EFUSE_CONTENT_SIZE		0x400
+
+#define SG2044_EFUSE_MD				0x000
+#define SG2044_EFUSE_ADR			0x004
+#define SG2044_EFUSE_RD_DATA			0x00c
+
+#define SG2044_EFUSE_MODE			GENMASK(1, 0)
+#define SG2044_EFUSE_MODE_READ			2
+
+#define SG2044_EFUSE_BOOT_DONE			BIT(7)
+#define SG2044_BOOT_TIMEOUT			10000
+
+#define SG2044_EFUSE_ADR_ADDR			GENMASK(7, 0)
+
+#define SG2044_EFUSE_ALIGN			4
+
+struct sophgo_efuses {
+	void __iomem *base;
+	struct clk_bulk_data *clks;
+	int num_clks;
+	struct mutex mutex;
+};
+
+static int sg2044_efuse_wait_mode(struct sophgo_efuses *efuse)
+{
+	u32 value;
+
+	return readl_poll_timeout(efuse->base + SG2044_EFUSE_MD, value,
+				  FIELD_GET(SG2044_EFUSE_MODE, value) == 0,
+				  1, SG2044_BOOT_TIMEOUT);
+}
+
+static int sg2044_efuse_set_mode(struct sophgo_efuses *efuse, int mode)
+{
+	u32 val = readl(efuse->base + SG2044_EFUSE_MD);
+
+	val &= ~SG2044_EFUSE_MODE;
+	val |= FIELD_PREP(SG2044_EFUSE_MODE, mode);
+
+	writel(val, efuse->base + SG2044_EFUSE_MD);
+
+	return sg2044_efuse_wait_mode(efuse);
+}
+
+static u32 sg2044_efuses_read_strip(struct sophgo_efuses *efuse,
+				    unsigned int offset, u32 *strip)
+{
+	u32 val = FIELD_PREP(SG2044_EFUSE_ADR_ADDR, offset);
+	int ret;
+
+	guard(mutex)(&efuse->mutex);
+
+	writel(val, efuse->base + SG2044_EFUSE_ADR);
+
+	ret = sg2044_efuse_set_mode(efuse, SG2044_EFUSE_MODE_READ);
+	if (ret < 0)
+		return ret;
+
+	*strip = readl(efuse->base + SG2044_EFUSE_RD_DATA);
+
+	return 0;
+}
+
+static int sg2044_efuses_read(void *context, unsigned int offset, void *val,
+			      size_t bytes)
+{
+	struct sophgo_efuses *efuse = context;
+	unsigned int start, start_offset, end, i;
+	u32 value;
+	u8 *buf;
+	int ret;
+
+	start = rounddown(offset, SG2044_EFUSE_ALIGN);
+	end = roundup(offset + bytes, SG2044_EFUSE_ALIGN);
+	start_offset = offset - start;
+
+	start /= SG2044_EFUSE_ALIGN;
+	end /= SG2044_EFUSE_ALIGN;
+
+	ret = readl_poll_timeout(efuse->base + SG2044_EFUSE_MD, value,
+				 (value & SG2044_EFUSE_BOOT_DONE),
+				 1, SG2044_BOOT_TIMEOUT);
+	if (ret < 0)
+		return ret;
+
+	buf = kzalloc(end - start, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	for (i = start; i < end; i++) {
+		ret = sg2044_efuses_read_strip(efuse, i, &value);
+		if (ret)
+			goto failed;
+
+		memcpy(&buf[(i - start) * 4], &value, SG2044_EFUSE_ALIGN);
+	}
+
+	memcpy(val, buf + start_offset, bytes);
+
+failed:
+	kfree(buf);
+
+	return ret;
+}
+
+static int sophgo_efuses_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sophgo_efuses *efuse;
+	struct nvmem_config config = {
+		.dev = &pdev->dev,
+		.add_legacy_fixed_of_cells = true,
+		.read_only = true,
+		.reg_read = sg2044_efuses_read,
+		.stride = 1,
+		.word_size = 1,
+		.name = "sophgo-efuse",
+		.id = NVMEM_DEVID_AUTO,
+		.root_only = true,
+	};
+
+	efuse = devm_kzalloc(dev, sizeof(*efuse), GFP_KERNEL);
+	if (!efuse)
+		return -ENOMEM;
+
+	efuse->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(efuse->base))
+		return PTR_ERR(efuse->base);
+
+	efuse->num_clks = devm_clk_bulk_get_all_enabled(&pdev->dev, &efuse->clks);
+	if (efuse->num_clks < 0)
+		return dev_err_probe(dev, efuse->num_clks, "failed to get clocks\n");
+
+	config.priv = efuse;
+	config.size = SG2044_EFUSE_CONTENT_SIZE;
+
+	return PTR_ERR_OR_ZERO(devm_nvmem_register(config.dev, &config));
+}
+
+static const struct of_device_id sophgo_efuses_of_match[] = {
+	{ .compatible = "sophgo,sg2044-efuse", },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, sophgo_efuses_of_match);
+
+static struct platform_driver sophgo_efuses_driver = {
+	.driver = {
+		.name = "sophgo_efuse",
+		.of_match_table = sophgo_efuses_of_match,
+	},
+	.probe = sophgo_efuses_probe,
+};
+
+module_platform_driver(sophgo_efuses_driver);
+
+MODULE_AUTHOR("Inochi Amaoto <inochiama@gmail.com>");
+MODULE_DESCRIPTION("Sophgo efuse driver");
+MODULE_LICENSE("GPL");
-- 
2.56.0

