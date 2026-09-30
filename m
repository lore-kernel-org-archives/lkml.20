Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88881C84A2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727199; cv=none; b=B+a+/AaQlRbeR0XU+gRfkMKqYFr+fGYaRWTPNK1qr9qlEHG6gqOnOs8n347SYYciQRKlMowUePWRaTHM0R3z9McXjvyyfqB0Xew/y/Fatih05qTn8gUnIVJcORwuqL+e+tZNGLjW/mXwxbNNWmv/IckbwM3LjJDA7i63JkQha+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727199; c=relaxed/simple;
	bh=GWmLbQPkVqZvAacGJwWnj+TGudlmrrVKrK0k/SiCCQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QC5m45aBfJcQchQUL8t+TL0ijkRE4RBtoqxW9XjYYtw1RXMLJ5D9xHiNE2Novr9TmNSUT5xbNqfEzmp8vIlg705+cVax4fyMmr7kOKq6syqxDnkW/eU8Qklbs74z6e16QWfQH6g1UomqE9Hemp/7mx2psJKhZWi607uSPSifoCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ge01Yibx; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ge01Yibx"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so15154505e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790727194; x=1791331994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zunoGt3p1/PW1enbE+6uwAqIoWez0F52cgDPOOrhXyQ=;
        b=ge01Yibx7H+5ta8EC3bewK3HSAd4qI1xk7XhZf9WhSM/zzuTt3z/Y1841lKCzIQExL
         letnVuVxI4K7dp3P34MG5J7wAiajPeSWRegM/zZ91KAFDyzx7v5b8iYVEOw6zprlC+L+
         jwXZ3hBKLdzG5JfxlnCAqe01QTvJzGdP8o3izz2wccVxbi3i3N768Q0NNhMwF7I/Ev36
         5suqrbNG0sad1DkZeH+SdWZeERgMjZsCrLpV2nguKRlEZsHWJKMuxxS8V78zF+ni7ICT
         n/a139dUTdGbzwoeyqbDEckzO0+fCEYMo5h6e6FFYXKG9arTP9NiUoUr5q3gWcQh19U9
         gfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790727194; x=1791331994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zunoGt3p1/PW1enbE+6uwAqIoWez0F52cgDPOOrhXyQ=;
        b=uetBul1FTFcm4OV0oWd8QJ7bMVJq4rOmAsBAzIlF+FbzSOJbhGnaX6hWUDEDHogDdH
         prVBNvYNttGrp17ZiSq0LtsSQEmfgMEpdD9IzX6ngVofi4mUZhjZ6mOMlj6q/d8uIt61
         4SToP+pCq4md8iYQeOfnwRZrlfQrb+iX//+3cGZV8OM73A+nSfTzceltFzBtngi/LLjK
         KFFgxxf3JhwlciPjKos/hrol5I9YvgkuAwLFuRATFvpVxPoBLgkSq+rJH7hTfowzVNEs
         VTQvoCUJ8Ixq41Pnw2MM2MwJEFyS4a4qLBJpy6Gl0sRJZFr7lMVE6UF3vsyctWjIbKeU
         gWZA==
X-Forwarded-Encrypted: i=1; AKwUvBwOHlxjWVk7g/AEBIpu074e2h7EYAid2Ruc1ukQOcXRx8SCsdp+PLHPZLI0C/gkCDoMgPgeeVgRDq+1Q2A=@vger.kernel.org
X-Gm-Message-State: AFuF++k2Uil9LV5rnVxxU7Hj1iKD1ifYGdkmjUDj3hmEJdJYAy1TGOGJ
	uNZH/fmn/kRgy3i6LZ4OYDEstAdpIsJFDkdlklnHVJCcrx5iddhAexhqmcpclsMCDZA=
X-Gm-Gg: AYBFou3xOJstuUdrseuHfXIr1tBwwAKH0/63SQyEjUvLEqMNc44LuZ7vxUvJf7hkOlw
	RgsRB+aRux1MS9dQj27U2M3lDnRDlFufT5XLvOx43Hn6YW+5fh7ioYi/kHmELt8Bfj8Kn2irkCK
	fW89BN4iguC7HZXPpqnqCagGCYw3Z82JGrg7nNG1eFqKyGOyz9ebyHI/cyX/hxiOTjcEBBLRJHN
	wZB4BKmmZY8T9lDs19RQ6zB5umkgWrLMPcFsSqcqmppgRFAlmXVrReuMM7hoTQFp5BByhtlyAmJ
	ZiP1JZ8N6/4md6VWQF0fGBzoNn5U6alLBdRMHVdc2xylopIKze9CFaDn4v6l91pGcD70ltNYnMD
	HhEfVVqxmWDihK5iukjfkH1Aj5EcSprh5gEuKip+n0Tvdp0r3HNae7WnZPB1VbnuYFUrFZOQYV+
	NsBD8eYAojbwNqh3nAM4XBv+SskYIfS7MQXMtb27HDKNKNjhFaZUTlHQ6ugTPeQHBy29JfsaOdf
	ajRgxfBdHalTW64Mq1clQI+NVa/3q/Ag+hTdWrzVP/gcU8eYCZ9dnfoP73IIQ==
X-Received: by 2002:a05:600c:c48f:b0:4a0:2b0:1cb2 with SMTP id 5b1f17b1804b1-4a015147f97mr9643765e9.20.1790727193949;
        Tue, 29 Sep 2026 17:13:13 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015a89ffasm6320635e9.1.2026.09.29.17.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 17:13:13 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 30 Sep 2026 01:12:59 +0100
Subject: [PATCH v7 4/6] soc: samsung: exynos-pmu: add Exynos850 CPU hotplug
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-exynos850-cpuhotplug-v7-4-203245826333@linaro.org>
References: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
In-Reply-To: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Add cpuhotplug support for Exynos850 platforms. This SoC requires
its own specific set of writes/updates to PMU and PMU interrupts
generation block in order to put a CPU or a group of CPUs into
a different sleep states or prepare these entities for a CPU_OFF
or wake-up out of idle state or after CPU online.
Without these writes/updates the CPU(s) wake-up or online fails.

This also requires syscon regmap with raw spinlocks, so add
its initialisation to main exynos pmu probe() routine.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/Makefile                |  2 +-
 drivers/soc/samsung/exynos-pmu.c            | 24 ++++++++
 drivers/soc/samsung/exynos-pmu.h            |  1 +
 drivers/soc/samsung/exynos850-pmu.c         | 95 +++++++++++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |  5 ++
 5 files changed, 126 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/Makefile b/drivers/soc/samsung/Makefile
index 636a762608c9..7f544e3c1fcc 100644
--- a/drivers/soc/samsung/Makefile
+++ b/drivers/soc/samsung/Makefile
@@ -7,7 +7,7 @@ exynos_chipid-y			+= exynos-chipid.o exynos-asv.o
 obj-$(CONFIG_EXYNOS_USI)	+= exynos-usi.o
 
 obj-$(CONFIG_EXYNOS_PMU)	+= exynos_pmu.o
-exynos_pmu-y			+= exynos-pmu.o gs101-pmu.o
+exynos_pmu-y			+= exynos-pmu.o gs101-pmu.o exynos850-pmu.o
 
 obj-$(CONFIG_EXYNOS_PMU_ARM_DRIVERS)	+= exynos3250-pmu.o exynos4-pmu.o \
 					exynos5250-pmu.o exynos5420-pmu.o
diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 9efaaf4696cf..387ed149fa71 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -92,6 +92,14 @@ static const struct regmap_config regmap_smccfg = {
 	.use_raw_spinlock = true,
 };
 
+static const struct regmap_config regmap_pmu = {
+	.name = "pmu_regs",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.use_raw_spinlock = true,
+};
+
 static const struct regmap_config regmap_pmu_intr = {
 	.name = "pmu_intr_gen",
 	.reg_bits = 32,
@@ -133,6 +141,7 @@ static const struct of_device_id exynos_pmu_of_device_ids[] = {
 		.compatible = "samsung,exynos7-pmu",
 	}, {
 		.compatible = "samsung,exynos850-pmu",
+		.data = &exynos850_pmu_data,
 	},
 	{ /*sentinel*/ },
 };
@@ -480,6 +489,21 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 		ret = of_syscon_register_regmap(dev->of_node, regmap);
 		if (ret)
 			return ret;
+	/*
+	 * For SoCs that support cpuhotplug/cpuidle via PMU updates callbacks.
+	 * Such callbacks are executed under raw_spinlock so we need a custom
+	 * regmap too.
+	 */
+	} else if (pmu_context->pmu_data && pmu_context->pmu_data->pmu_cpuhp) {
+		regmap = devm_regmap_init_mmio(dev, pmu_base_addr, &regmap_pmu);
+		if (IS_ERR(regmap))
+			return dev_err_probe(dev, PTR_ERR(regmap),
+					     "hotplug regmap init failed\n");
+
+		ret = of_syscon_register_regmap(dev->of_node, regmap);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to register hotplug regmap with syscon\n");
 	} else {
 		/* let syscon create mmio regmap */
 		regmap = syscon_node_to_regmap(dev->of_node);
diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exynos-pmu.h
index 733e188fa2b1..4ecbf53cd4f7 100644
--- a/drivers/soc/samsung/exynos-pmu.h
+++ b/drivers/soc/samsung/exynos-pmu.h
@@ -104,6 +104,7 @@ extern const struct exynos_pmu_data exynos5250_pmu_data;
 extern const struct exynos_pmu_data exynos5420_pmu_data;
 #endif
 extern const struct exynos_pmu_data gs101_pmu_data;
+extern const struct exynos_pmu_data exynos850_pmu_data;
 
 extern void pmu_raw_writel(u32 val, u32 offset);
 extern u32 pmu_raw_readl(u32 offset);
diff --git a/drivers/soc/samsung/exynos850-pmu.c b/drivers/soc/samsung/exynos850-pmu.c
new file mode 100644
index 000000000000..0503c54d6363
--- /dev/null
+++ b/drivers/soc/samsung/exynos850-pmu.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2026 Linaro Ltd.
+ *
+ * Exynos850 PMU support
+ */
+
+#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+
+#include <linux/bits.h>
+#include <linux/printk.h>
+#include <linux/regmap.h>
+#include <linux/soc/samsung/exynos-pmu.h>
+#include <linux/soc/samsung/exynos-regs-pmu.h>
+#include <linux/topology.h>
+#include <asm/cputype.h>
+
+#include "exynos-pmu.h"
+
+static int exynos850_cpu_pmu_offline(struct exynos_pmu_context *pmu_context, unsigned int cpu)
+	__must_hold(&pmu_context->cpupm_lock)
+{
+	int cluster_id, core_id;
+	u32 reg, mask;
+
+	cluster_id = topology_cluster_id(cpu);
+	if (cluster_id < 0) {
+		pr_err_ratelimited("invalid cluster ID for cpu: %u\n", cpu);
+		return -EINVAL;
+	}
+
+	core_id = topology_core_id(cpu);
+	if (core_id < 0) {
+		pr_err_ratelimited("invalid core ID for cpu: %u\n", cpu);
+		return -EINVAL;
+	}
+
+	/* set cpu inform hint */
+	regmap_write(pmu_context->pmureg, EXYNOS850_CPU_INFORM(cpu), CPU_INFORM_C2);
+
+	mask = BIT(cpu);
+	regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
+			   mask, BIT(cpu));
+
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_UPEND, &reg);
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_CLEAR, reg & mask);
+
+	mask = (BIT(cpu + 8));
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_UPEND, &reg);
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_CLEAR, reg & mask);
+
+	regmap_update_bits(pmu_context->pmureg,
+			   EXYNOS850_CLUSTER_CPU_INT_EN(cluster_id, core_id), 1 << 3, 1 << 3);
+	return 0;
+}
+
+static int exynos850_cpu_pmu_online(struct exynos_pmu_context *pmu_context, unsigned int cpu)
+	__must_hold(&pmu_context->cpupm_lock)
+{
+	int cluster_id, core_id;
+	u32 reg, mask;
+
+	cluster_id = topology_cluster_id(cpu);
+	if (cluster_id < 0) {
+		pr_err_ratelimited("invalid cluster ID for cpu: %u\n", cpu);
+		return -EINVAL;
+	}
+
+	core_id = topology_core_id(cpu);
+	if (core_id < 0) {
+		pr_err_ratelimited("invalid core ID for cpu: %u\n", cpu);
+		return -EINVAL;
+	}
+
+	/* clear cpu inform hint */
+	regmap_write(pmu_context->pmureg, EXYNOS850_CPU_INFORM(cpu), CPU_INFORM_CLEAR);
+
+	mask = BIT(cpu);
+	regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
+			   mask, (0 << cpu));
+
+	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_UPEND, &reg);
+
+	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_CLEAR, reg & mask);
+
+	regmap_update_bits(pmu_context->pmureg,
+			   EXYNOS850_CLUSTER_CPU_INT_EN(cluster_id, core_id), 1 << 3, 0 << 3);
+	return 0;
+}
+
+const struct exynos_pmu_data exynos850_pmu_data = {
+	.pmu_cpuhp = true,
+	.cpu_pmu_offline = exynos850_cpu_pmu_offline,
+	.cpu_pmu_online = exynos850_cpu_pmu_online,
+};
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index 9c4d3da41dbf..c7a82635fc36 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -1015,6 +1015,11 @@
 #define EXYNOS_GRP2_INTR_BID_UPEND				(0x0208)
 #define EXYNOS_GRP2_INTR_BID_CLEAR				(0x020c)
 
+/* Exynos850 PMU Alive */
+#define EXYNOS850_CPU_INFORM(cpu)		(0x0860 + ((cpu) & 7) * 4)
+#define EXYNOS850_CLUSTER_CPU_OFFSET(cl, cpu)	(0x1000 + (((cl) * 0x400) + ((cpu) * 0x80)))
+#define EXYNOS850_CLUSTER_CPU_INT_EN(cl, cpu)	(EXYNOS850_CLUSTER_CPU_OFFSET(cl, cpu) + 0x44)
+
 /* exynosautov920 */
 #define EXYNOSAUTOV920_PHY_CTRL_USB20				(0x0710)
 #define EXYNOSAUTOV920_PHY_CTRL_USB31				(0x0714)

-- 
2.51.0

