Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725451;
	b=hfDmQi3gFtuVIr8DgAiamtTeNKhdgMs6qTymR93Vz8H31xQ7da2ydysagGNhTecMdTgX
	 plkYIfpwpg2Noy7EsxsutFbeKjyOrW2mYJgN5RjhTwohOmn+6OxzVyqh5cIMow3ifaFCt
	 lVMBx2gUrWMu8oOhJn21Kq5cN6NJMwL2rCcuUmhTBk5tKkcCKCkShqy8gqiRBh+XLfpA8
	 UhOK79msAIkhfhh2+vmBedr6kIpsI3C8E6UfcxQPfIcqi6OxBaixqayuS2mUqLLKmp1KT
	 sNNU1nqW9Nh9WwR6q0F6mi9jDeUF1aXO/DEeYb6aVmNwWaSG7BaQeIiXEFV/vJ0yUJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725451;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=bsuNMawsZswDZeHZEj3++8TLnfQ2KNVFzLTMhe5/fD8=;
	b=W97Zfxj6j6mm9cfuvjJ05pL4ZB+iaHMzoETqRLWOltDRhyE/i3tNyAy6J90cYoyfr5YL
	 QDJNTv4lIJEXSjQM11+ApYcWO4q+96N4Drj9pTeeEnKGPkM/x7m8icVWmpGEfs5QFVlHW
	 /iRTR2hV+io6PQ2rJnC38DobEkyzMX4acNfmMQd/hr8DB9MVd12yEQjc9dg+Atxs7yVxD
	 a/v/W2Hf0ER9h6yJwp4MAYOy9nPHU6EriZNrqbFKjyo9K7ieDhrkb1MzKhcd3pSjjbANA
	 xRa4umUhokF0GEpfEyTSpg/YW6DE8XIG0Iyy/nc2Kz9J6jVn+dFYT6buwG8jt/MTquA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	arc=none smtp.remote-ip=54.243.244.52
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CED606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78CED606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725420;
	bh=bsuNMawsZswDZeHZEj3++8TLnfQ2KNVFzLTMhe5/fD8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=gC1JTMvRpggE60DRKe1AkEz99z317NU904oB1sAdsDiaNqGHO9PS7rWh9HVzrkR01
	 Gj0OJ84h3/9IBMlylqC3voGcE53sEyGwHOOUrwZt4TpUSf2TZZYFj5PYKPt/L7sltT
	 qd6QW6U5+VXKitJQaSMR3aCNnvsfbh9E2Z6BAlXQ=
X-QQ-mid: esmtpsz11t1792725362t82081f48
X-QQ-Originating-IP: VcyNqYW9njYNpQVBfz/f1c7Vuj+E1gizXSEdWY5ikc0=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:16:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18250832488890256495
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: gregkh@linuxfoundation.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	alexander.shishkin@linux.intel.com,
	suzuki.poulose@arm.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	irogers@google.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	liangzhen@linux.spacemit.com,
	zhuangqiubin@linux.spacemit.com,
	coresight@lists.linaro.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/24] gtrace: Add CoreSight funnel driver
Date: Fri, 23 Oct 2026 11:14:55 +0800
Message-Id: <20261023031505.2020925-15-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
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
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MOJijf76Vc+iVJkuMCXYUOxGnbNiGYsOjMf2wt40Ac42iSLKG6eyf05K
	Rx5u5wUuEMquM1OFz7qXhpGcLPk81VTS7DAk8sUSZWq8Bq+4KGnm3+OgdioxoNIdXHij5UN
	e4S3g4sjY23fgmm6fFQPqV+r+BvwL0Yzn/k83w6YDu0wnSixkcuKS5y5MfYGWuS4aX2e+WX
	Hdps+N2dd9GfN3gPTczD3qSL1Zi/2Z4FZTR9d4rPD6EdfNmQ6Ayoq68JfwxWeh6D6IlR16Z
	ksjaacUUBIEGfszmI0gNzLHR3guwTarw1ZCxwi6VppZp0UcIIZ7arGyjUYsfyDRi7VIiXjF
	YQZ5D99Dl9+AWKW8zBBTC/lhOVQgXTZlgFmXLTBACuBtxCqM44uvTMtgT2IuQteUS4XB+g2
	kv3TlFe9RXIylcF//Gd/Phovj7J8Fr3lwVlPtuA2Oe/lEAIiaC7XI83+NX0Or4escjk8U6d
	71RuRbVAjrtinjqF8MVJdqIWqJxeCrgBQhnkPFT1DDGcgGb6T9fmdW7dESG/KNHZSsBHdze
	dUeN/Get0Fo6MotwvWoGEYZq93IcmpeXoVgcjh0/Kgc+s0uhu0Kqc36Mki0h80nS+LbkZwC
	4wDhtQXoiufeK6DziAvc/fPvHtC8UYEhCBWi0e3Kq57OHUyGjHgtN1yVj31aTLUDMi5mulD
	DNhdW4pjk+Uo5s5faQFdVmB0RoHLxiwTC2DisloEobD8nezQse9zxyDRsDBE48gjA33XQh0
	43hwWWhRf1GxlM/yCGBbNmqCiD1jyCzXbV9NOzXwQGZ1qbeeQ2A7w4JD71MAfT5Bgcf82ab
	1ALEr6aNOvlhj16fqx8NXjE+up9EXpWMbKiXHwbiV99MsJwftGo/QrB+tsEJ4B6tOsfES8F
	rK0w427Ka0DMTmnyplg5eopb+P5Ozq1m4gnAetRePnUtlW4etYahATet1qGiKOnA4uF9fdr
	F4BKam4jffLAd6jNdfIKfjbg/se6Yh0Cgi6LCIimPDYZlWYIFIyQ0ZgZjzNDNYK1lLVmjJV
	MMH/VPCK+4Awwc3nOL4wQgtW9vXN+7gTT+SBV3AXlWCUWk7uti6d2p+xAqC+bwbaBAlmlP4
	qy+NygNoodUKm9P2+uIhz8xvHkhQ8WBow==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

Add a CoreSight funnel driver for the gtrace framework, derived from
drivers/hwtracing/coresight/coresight-funnel.c.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/Kconfig            |  13 +
 drivers/hwtracing/gtrace/Makefile           |   1 +
 drivers/hwtracing/gtrace/coresight-funnel.c | 430 ++++++++++++++++++++
 3 files changed, 444 insertions(+)
 create mode 100644 drivers/hwtracing/gtrace/coresight-funnel.c

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index 5dce4474db7c..081af9c0c670 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -101,3 +101,16 @@ config GTRACE_CORESIGHT
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called coresight.
+
+config CORESIGHT_FUNNEL
+	tristate "CoreSight Trace Funnel driver"
+	depends on GTRACE_CORESIGHT
+	default y
+	help
+	  This driver provides support for the CoreSight funnel component.
+	  The funnel merges trace data from multiple input ports into a single
+	  output stream. It supports both static funnels (platform bus,
+	  arm,coresight-static-funnel) and dynamic funnels (AMBA bus).
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called coresight-funnel.
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 0833a40c397c..d2745c961a75 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -12,3 +12,4 @@ obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
 obj-$(CONFIG_RVTRACE_FUNNEL) += rvtrace-funnel.o
 obj-$(CONFIG_RVTRACE_ATBBRIDGE) += rvtrace-atbbridge.o
 obj-$(CONFIG_GTRACE_CORESIGHT) += coresight-platform.o
+obj-$(CONFIG_CORESIGHT_FUNNEL) += coresight-funnel.o
diff --git a/drivers/hwtracing/gtrace/coresight-funnel.c b/drivers/hwtracing/gtrace/coresight-funnel.c
new file mode 100644
index 000000000000..e7a3f185da56
--- /dev/null
+++ b/drivers/hwtracing/gtrace/coresight-funnel.c
@@ -0,0 +1,430 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2011-2012, The Linux Foundation. All rights reserved.
+ *
+ * Description: CoreSight Funnel driver for the gtrace framework.
+ * Derived from drivers/hwtracing/coresight/coresight-funnel.c.
+ */
+
+#include <linux/acpi.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/types.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/fs.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/amba/bus.h>
+#include <linux/clk.h>
+
+#include "coresight.h"
+
+#define FUNNEL_FUNCTL		0x000
+#define FUNNEL_PRICTL		0x004
+
+#define FUNNEL_HOLDTIME_MASK	0xf00
+#define FUNNEL_HOLDTIME_SHFT	0x8
+#define FUNNEL_HOLDTIME		(0x7 << FUNNEL_HOLDTIME_SHFT)
+#define FUNNEL_ENSx_MASK	0xff
+
+/**
+ * struct funnel_drvdata - specifics associated to a funnel component
+ * @base:	memory mapped base address for this component.
+ * @atclk:	optional clock for the core parts of the funnel.
+ * @pclk:	APB clock if present, otherwise NULL
+ * @comp:	component vitals needed by the framework.
+ * @priority:	port selection order.
+ */
+struct funnel_drvdata {
+	void __iomem		*base;
+	struct clk		*atclk;
+	struct clk		*pclk;
+	struct gtrace_component *comp;
+	unsigned long		priority;
+};
+
+static int dynamic_funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
+{
+	u32 functl;
+	int rc = 0;
+	struct gtrace_component *comp = drvdata->comp;
+
+	CS_UNLOCK(drvdata->base);
+
+	functl = readl_relaxed(drvdata->base + FUNNEL_FUNCTL);
+	/* Claim the device only when we enable the first slave */
+	if (!(functl & FUNNEL_ENSx_MASK)) {
+		rc = coresight_claim_device_unlocked(comp);
+		if (rc)
+			goto done;
+	}
+
+	functl &= ~FUNNEL_HOLDTIME_MASK;
+	functl |= FUNNEL_HOLDTIME;
+	functl |= (1 << port);
+	writel_relaxed(functl, drvdata->base + FUNNEL_FUNCTL);
+	writel_relaxed(drvdata->priority, drvdata->base + FUNNEL_PRICTL);
+done:
+	CS_LOCK(drvdata->base);
+	return rc;
+}
+
+static int funnel_enable(struct gtrace_component *comp,
+			 struct gtrace_connection *in,
+			 struct gtrace_connection *out)
+{
+	int rc = 0;
+	struct funnel_drvdata *drvdata = dev_get_drvdata(comp->dev.parent);
+	bool first_enable = false;
+
+	if (in->dest_refcnt == 0) {
+		if (drvdata->base)
+			rc = dynamic_funnel_enable_hw(drvdata, in->dest_port);
+		if (!rc)
+			first_enable = true;
+	}
+	if (!rc)
+		in->dest_refcnt++;
+
+	if (first_enable)
+		dev_dbg(&comp->dev, "FUNNEL inport %d enabled\n",
+			in->dest_port);
+	return rc;
+}
+
+static void dynamic_funnel_disable_hw(struct funnel_drvdata *drvdata,
+				      int inport)
+{
+	u32 functl;
+	struct gtrace_component *comp = drvdata->comp;
+
+	CS_UNLOCK(drvdata->base);
+
+	functl = readl_relaxed(drvdata->base + FUNNEL_FUNCTL);
+	functl &= ~(1 << inport);
+	writel_relaxed(functl, drvdata->base + FUNNEL_FUNCTL);
+
+	/* Disclaim the device if none of the slaves are now active */
+	if (!(functl & FUNNEL_ENSx_MASK))
+		coresight_disclaim_device_unlocked(comp);
+
+	CS_LOCK(drvdata->base);
+}
+
+static void funnel_disable(struct gtrace_component *comp,
+			   struct gtrace_connection *in,
+			   struct gtrace_connection *out)
+{
+	struct funnel_drvdata *drvdata = dev_get_drvdata(comp->dev.parent);
+	bool last_disable = false;
+
+	if (--in->dest_refcnt == 0) {
+		if (drvdata->base)
+			dynamic_funnel_disable_hw(drvdata, in->dest_port);
+		last_disable = true;
+	}
+
+	if (last_disable)
+		dev_dbg(&comp->dev, "FUNNEL inport %d disabled\n",
+			in->dest_port);
+}
+
+static ssize_t priority_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct funnel_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val = drvdata->priority;
+
+	return sprintf(buf, "%#lx\n", val);
+}
+
+static ssize_t priority_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t size)
+{
+	int ret;
+	unsigned long val;
+	struct funnel_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	ret = kstrtoul(buf, 16, &val);
+	if (ret)
+		return ret;
+
+	drvdata->priority = val;
+	return size;
+}
+static DEVICE_ATTR_RW(priority);
+
+static u32 get_funnel_ctrl_hw(struct funnel_drvdata *drvdata)
+{
+	u32 functl;
+
+	CS_UNLOCK(drvdata->base);
+	functl = readl_relaxed(drvdata->base + FUNNEL_FUNCTL);
+	CS_LOCK(drvdata->base);
+
+	return functl;
+}
+
+static ssize_t funnel_ctrl_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	u32 val;
+	struct funnel_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	pm_runtime_get_sync(dev->parent);
+
+	val = get_funnel_ctrl_hw(drvdata);
+
+	pm_runtime_put(dev->parent);
+
+	return sprintf(buf, "%#x\n", val);
+}
+static DEVICE_ATTR_RO(funnel_ctrl);
+
+static struct attribute *coresight_funnel_attrs[] = {
+	&dev_attr_funnel_ctrl.attr,
+	&dev_attr_priority.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(coresight_funnel);
+
+static int funnel_probe(struct device *dev, struct resource *res)
+{
+	void __iomem *base;
+	struct gtrace_platform_data *pdata = NULL;
+	struct funnel_drvdata *drvdata;
+	struct gtrace_component_id id = {
+		.type = GTRACE_CORESIGHT_FUNNEL,
+		.version = CORESIGHT_COMPONENT_ID_VERSION,
+	};
+	int ret;
+
+	if (is_of_node(dev_fwnode(dev)) &&
+	    of_device_is_compatible(dev->of_node, "arm,coresight-funnel"))
+		dev_warn_once(dev, "Uses OBSOLETE CoreSight funnel binding\n");
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
+	if (ret)
+		return ret;
+
+	pdata = coresight_get_platform_data(dev);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+
+	/*
+	 * Map the device base for dynamic-funnel, which has been
+	 * validated by AMBA core.
+	 */
+	if (res) {
+		base = devm_ioremap_resource(dev, res);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+		drvdata->base = base;
+		pdata->groups = coresight_funnel_groups;
+		pdata->io_mem = true;
+		pdata->base = base;
+		coresight_clear_self_claim_tag(pdata);
+	}
+
+	dev_set_drvdata(dev, drvdata);
+
+	drvdata->comp = gtrace_register_component(&id, "cs_funnel", pdata);
+	if (IS_ERR(drvdata->comp))
+		return PTR_ERR(drvdata->comp);
+
+	return 0;
+}
+
+static void funnel_remove(struct device *dev)
+{
+	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
+
+	gtrace_unregister_component(drvdata->comp);
+}
+
+#ifdef CONFIG_PM
+static int funnel_runtime_suspend(struct device *dev)
+{
+	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->pclk);
+
+	return 0;
+}
+
+static int funnel_runtime_resume(struct device *dev)
+{
+	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(drvdata->pclk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(drvdata->atclk);
+	if (ret)
+		clk_disable_unprepare(drvdata->pclk);
+
+	return ret;
+}
+#endif
+
+static const struct dev_pm_ops funnel_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(funnel_runtime_suspend, funnel_runtime_resume, NULL)
+};
+
+static int funnel_platform_probe(struct platform_device *pdev)
+{
+	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	int ret;
+
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
+	ret = funnel_probe(&pdev->dev, res);
+	pm_runtime_put(&pdev->dev);
+	if (ret)
+		pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static void funnel_platform_remove(struct platform_device *pdev)
+{
+	struct funnel_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
+
+	if (WARN_ON(!drvdata))
+		return;
+
+	funnel_remove(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+}
+
+static const struct of_device_id funnel_match[] = {
+	{.compatible = "arm,coresight-static-funnel"},
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, funnel_match);
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id funnel_acpi_ids[] = {
+	{"ARMHC9FE", 0, 0, 0}, /* ARM Coresight Static Funnel */
+	{"ARMHC9FF", 0, 0, 0}, /* ARM CoreSight Dynamic Funnel */
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, funnel_acpi_ids);
+#endif
+
+static struct platform_driver funnel_driver = {
+	.probe		= funnel_platform_probe,
+	.remove		= funnel_platform_remove,
+	.driver		= {
+		.name   = "coresight-funnel",
+		/* THIS_MODULE is taken care of by platform_driver_register() */
+		.of_match_table = funnel_match,
+		.acpi_match_table = ACPI_PTR(funnel_acpi_ids),
+		.pm	= &funnel_dev_pm_ops,
+		.suppress_bind_attrs = true,
+	},
+};
+
+static int dynamic_funnel_probe(struct amba_device *adev,
+				const struct amba_id *id)
+{
+	int ret;
+
+	ret = funnel_probe(&adev->dev, &adev->res);
+	if (!ret)
+		pm_runtime_put(&adev->dev);
+
+	return ret;
+}
+
+static void dynamic_funnel_remove(struct amba_device *adev)
+{
+	funnel_remove(&adev->dev);
+}
+
+static const struct amba_id dynamic_funnel_ids[] = {
+	{
+		.id     = 0x000bb908,
+		.mask   = 0x000fffff,
+	},
+	{
+		/* Coresight SoC-600 */
+		.id     = 0x000bb9eb,
+		.mask   = 0x000fffff,
+	},
+	{ 0, 0, NULL },
+};
+
+MODULE_DEVICE_TABLE(amba, dynamic_funnel_ids);
+
+static struct amba_driver dynamic_funnel_driver = {
+	.drv = {
+		.name	= "coresight-dynamic-funnel",
+		.pm	= &funnel_dev_pm_ops,
+		.suppress_bind_attrs = true,
+	},
+	.probe		= dynamic_funnel_probe,
+	.remove		= dynamic_funnel_remove,
+	.id_table	= dynamic_funnel_ids,
+};
+
+static const struct gtrace_component_id coresight_funnel_ids[] = {
+	{ .type = GTRACE_CORESIGHT_FUNNEL,
+	  .version = CORESIGHT_COMPONENT_ID_VERSION, },
+	{},
+};
+
+static struct gtrace_driver coresight_funnel_driver = {
+	.id_table = coresight_funnel_ids,
+	.start_port = funnel_enable,
+	.stop_port = funnel_disable,
+	.driver = {
+		.name = "coresight-funnel",
+	},
+};
+
+static int __init funnel_init(void)
+{
+	int ret;
+
+	ret = gtrace_register_driver(&coresight_funnel_driver);
+	if (ret)
+		return ret;
+
+	ret = coresight_init_driver("funnel", &dynamic_funnel_driver, &funnel_driver);
+	if (ret) {
+		gtrace_unregister_driver(&coresight_funnel_driver);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void __exit funnel_exit(void)
+{
+	coresight_remove_driver(&dynamic_funnel_driver, &funnel_driver);
+	gtrace_unregister_driver(&coresight_funnel_driver);
+}
+
+module_init(funnel_init);
+module_exit(funnel_exit);
+
+MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
+MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");
+MODULE_AUTHOR("Zane Leung <liangzhen@linux.spacemit.com>");
+MODULE_DESCRIPTION("Arm CoreSight Funnel Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.34.1

