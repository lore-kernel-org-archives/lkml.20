Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6452B479883
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531223; cv=none; b=WgpV55BSmnpLZJifruj4BCnrsWykhJNSsM4uYHaO9l4WDeIQGiTtH9Zr3IFWO5zEuSIo4Lb+LpKXeZKcOdOcbFDoeeMFzUYxxoAeoU97eUElBaD9drMAL4UXyXbnAGFG5ZsH+2xYGysV6zVm7Dbp+z3TrxPkKW0udhpu+RR3hEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531223; c=relaxed/simple;
	bh=8z/FFQnXOxdzl3p5tOL4cIwCDvHXyhm9zhyHQK545js=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KEexbZhjRUyng2/7VEWojEBxWNGHIwur2TNk/x3x7RdmdOeVkm/VgCU6m0SLPGDAJSnHgi6wAZBYWJ06qNb38gPlBvV0gkHVtgfQjAyubFmrgxLBcSV5gJBBKqH8IdI3d4PWhdjvpha8kXIMbUHrNVqEwq8Uq1fVSMCaJUxwW7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNZnLQKj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNZnLQKj"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so33939005e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791531219; x=1792136019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9zvsyCoSUSpU/kUBc5mwp1RR1hEpEUYd+NykVR8nqgo=;
        b=VNZnLQKjUzqzxkjoMCZmEJW0eQw1o3ybivJINlKE4apI521cYMRaC+O9neZU4C15qK
         G4+LNuFe11lR0YynWlwxXUlKvTTs6vhHt1jtI8vwoLhTTTN7Zv7mZFmoW/h66HdzHY/E
         EuYSLiir0kwtYOjrw9kTIGRVda3pVtxXuisiuWnFp1TknJ1zM88gaZ7G7J4D6Qn95XgW
         72fkbFxoas6FIhBuBT6qVAt121/tysaojjZl9x6GWXz7p/d8tY60UBANccbThlcVUUmf
         yuNZOUweMXhriKNOSnGvSxkpgG+rhEoDKnDaJ5zsYvkFu7jWwqUh1hha/cB3mrldbP+c
         PShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531219; x=1792136019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9zvsyCoSUSpU/kUBc5mwp1RR1hEpEUYd+NykVR8nqgo=;
        b=yQPpXXzlnGH0dZNq11Ht5QGIyedB9l2Hk3orVtZW4kCu4T2OU3FTIZhhtGATaQBcg3
         VA6+QNQFbYdckU7jzar3m7MAwUK1PmuTqaE9Hg8cX6cSbAuXJobAEYsRaxPh0Qr2N7m/
         ckjyOESjCPENMNvhGiwMoVVDRmIX1ytQBGyN2tQo1JY8RMmuGBgqxkNeXFTIYd+Hia7w
         WmQF1YtYGRuGPM0hHDf3fvmwOsZcFfJauycwYyahrSJ+umamISj/vaucQQVAUgzbR/n6
         rk78ALc6cwyTz/yzW4t6uy3jXobMWT6egyVOoZu72bDJV2Rjn000L4LM0VSbR5qyPCve
         HXNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxj/iJ6j3o2q7eR0d8f/pqHAFbYO6C34zund7i6E98RrFmI19URPJwPo1keDHYljjuY0TAk66+0vv40BYQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lCn9squY5tIxWO2jZqupB0HH7IM5gFkJhYjl9AV4/cPfSicyzL
	5MIf0bDOA5CPdsRG2vB2MfpBMBITGIQa9TY9g0FvizqrfHvlnIm4Rn5H0k2qWQ==
X-Gm-Gg: AYBFou2iphrjFHIHpmd99MfyvOxuOP7VmUSh8/dP9ToqlhHmn5TGma5bDrewUJ9MV9C
	cz2+ue8PdT9aVWM1uu3+IShUUFig3I0CzEspyPKZgGn4AOQWvtfGKTDKD5t0XgI2ecFFJBmUGom
	eWqebnu7DHwlcaWmWP3m06jPomQ4z4H2RaXUxGbjwUlVUsnqow2JiL4dmEfILMeN8592t7au38I
	OeeYac/1yUiGPW/wLz4RTKoDrp1I16ZM2egtAkU7I2nrwafy+EQZLvwDrU2CDWFn7ozAj0OYLYg
	M8pcQFMeqkYttMaJ6pxwRlpMLnWoQ7ZqvYV1Mg2l7HsVRLsrfru58DAZjj1yKTFEzpWrldLuiMD
	EYaccWrhSlogSdtpglaw6QO2bUqOsgUNQJMLbkXG4HjbrhEDcIXEQSDvh9Pa0+2RyYXg1PJGEMQ
	+mXHNlI5iXzweVzE0wYnxLmFK+7UPmF7JBc+MWZKnLP4ta95fso2U2xDmnP2+CYhczCch7Ixw3B
	Pb7epmEC0koonBwxYlOsmxm4w+3BQ5HqeXGqj4Ybyem+XTSxnrlaKX0OcLPkR9CMz8SDrby+G6d
	HKGRG+EYJpwU4wPrMOA=
X-Received: by 2002:a05:600c:3111:b0:4a1:811c:8069 with SMTP id 5b1f17b1804b1-4a18e49d640mr16841015e9.8.1791531219347;
        Fri, 09 Oct 2026 00:33:39 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18be96549sm55116365e9.6.2026.10.09.00.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:33:39 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] PM / devfreq: add Airoha SoC Subsystem devfreq driver
Date: Fri,  9 Oct 2026 09:33:29 +0200
Message-ID: <20261009073330.18175-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009073330.18175-1-ansuelsmth@gmail.com>
References: <20261009073330.18175-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add simple Airoha SoC devfreq driver. This simple driver register a
driver from a given clock and register a passive governor to scale the
frequency with the CPU frequency.

Each subsystem is scaled to idle, nominal or turbo state based on the CPU
frequency to reflect the performance state required by the SoC.

required-opp on the CPU frequency will be used to correctly bind the
clock to the related CPU frequency.

GSW, NPU, SOE, BUS and many other clock will register this devfreq
driver to scale all these internal peripheral  from idle to performance
mode.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/devfreq/Kconfig                    |  10 +++
 drivers/devfreq/Makefile                   |   1 +
 drivers/devfreq/airoha-subsystem-devfreq.c | 100 +++++++++++++++++++++
 3 files changed, 111 insertions(+)
 create mode 100644 drivers/devfreq/airoha-subsystem-devfreq.c

diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
index c999c4a1e567..e8ea0c0af319 100644
--- a/drivers/devfreq/Kconfig
+++ b/drivers/devfreq/Kconfig
@@ -75,6 +75,16 @@ config DEVFREQ_GOV_PASSIVE
 
 comment "DEVFREQ Drivers"
 
+config ARM_AIROHA_SUBSYSTEM_DEVFREQ
+	tristate "Scaling support for Airoha SoC Subsystems"
+	depends on ARCH_AIROHA || COMPILE_TEST
+	select DEVFREQ_GOV_PASSIVE
+	help
+	  This adds the DEVFREQ driver for the Airoha SoC Subsystems.
+
+	  The driver register with the cpufreq notifier and find the right frequency
+	  based on the required OPP set in DT.
+
 config ARM_EXYNOS_BUS_DEVFREQ
 	tristate "ARM Exynos Generic Memory Bus DEVFREQ Driver"
 	depends on ARCH_EXYNOS || COMPILE_TEST
diff --git a/drivers/devfreq/Makefile b/drivers/devfreq/Makefile
index 404179d79a9d..31cdfe8fb704 100644
--- a/drivers/devfreq/Makefile
+++ b/drivers/devfreq/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_DEVFREQ_GOV_USERSPACE)	+= governor_userspace.o
 obj-$(CONFIG_DEVFREQ_GOV_PASSIVE)	+= governor_passive.o
 
 # DEVFREQ Drivers
+obj-$(CONFIG_ARM_AIROHA_SUBSYSTEM_DEVFREQ)	+= airoha-subsystem-devfreq.o
 obj-$(CONFIG_ARM_EXYNOS_BUS_DEVFREQ)	+= exynos-bus.o
 obj-$(CONFIG_ARM_HISI_UNCORE_DEVFREQ)	+= hisi_uncore_freq.o
 obj-$(CONFIG_ARM_IMX_BUS_DEVFREQ)	+= imx-bus.o
diff --git a/drivers/devfreq/airoha-subsystem-devfreq.c b/drivers/devfreq/airoha-subsystem-devfreq.c
new file mode 100644
index 000000000000..4b89121f7b8e
--- /dev/null
+++ b/drivers/devfreq/airoha-subsystem-devfreq.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/cpufreq.h>
+#include <linux/devfreq.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/slab.h>
+#include <linux/pm_opp.h>
+
+struct airoha_devfreq_data {
+	struct clk *clk;
+
+	struct devfreq_passive_data gov_data;
+};
+
+static int airoha_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
+{
+	struct airoha_devfreq_data *data = dev_get_drvdata(dev);
+
+	*freq = clk_get_rate(data->clk);
+
+	return 0;
+}
+
+static int airoha_devfreq_target(struct device *dev, unsigned long *freq,
+				 u32 flags)
+{
+	struct airoha_devfreq_data *data = dev_get_drvdata(dev);
+
+	return clk_set_rate(data->clk, *freq);
+}
+
+static int airoha_devfreq_get_dev_status(struct device *dev,
+					 struct devfreq_dev_status *stat)
+{
+	struct airoha_devfreq_data *data = dev_get_drvdata(dev);
+
+	stat->busy_time = 0;
+	stat->total_time = 0;
+	stat->current_frequency = clk_get_rate(data->clk);
+
+	return 0;
+}
+
+static struct devfreq_dev_profile airoha_devfreq_devfreq_profile = {
+	.target = airoha_devfreq_target,
+	.get_dev_status = airoha_devfreq_get_dev_status,
+	.get_cur_freq = airoha_devfreq_get_cur_freq
+};
+
+static int airoha_devfreq_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct airoha_devfreq_data *data;
+	struct devfreq *devfreq;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(data->clk))
+		return dev_err_probe(dev, PTR_ERR(data->clk), "failed to get clk\n");
+
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse fab freq thresholds\n");
+
+	dev_set_drvdata(dev, data);
+
+	data->gov_data.parent_type = CPUFREQ_PARENT_DEV;
+	devfreq = devm_devfreq_add_device(dev, &airoha_devfreq_devfreq_profile,
+					  DEVFREQ_GOV_PASSIVE, &data->gov_data);
+
+	return PTR_ERR_OR_ZERO(devfreq);
+}
+
+static const struct of_device_id airoha_devfreq_match_table[] = {
+	{ .compatible = "airoha,devfreq" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, airoha_devfreq_match_table);
+
+static struct platform_driver airoha_devfreq_driver = {
+	.probe		= airoha_devfreq_probe,
+	.driver		= {
+		.name   = "airoha-subsystem-devfreq",
+		.of_match_table = airoha_devfreq_match_table,
+	},
+};
+module_platform_driver(airoha_devfreq_driver);
+
+MODULE_DESCRIPTION("Airoha Devfreq driver");
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.55.0

