Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.92.39.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725423;
	b=fGdfUx18NcTdL5effowed/KMztybSbdS2dbIdvnWejN7/fDW/GqS5SZEkFP84Chz25BI
	 vAq6ZJLe/HMp7TM2urPVd0euXMprHs4Kgpwvi2DAMSFxTcPDLolbCxT2dsWoPosJjTNUA
	 bB5qaguFtXloEoZKK9AE5tJK6Y5wWQ1R9grV/ROO3u9L2c0Hwh9ad4AhCsgD/xOSEOvu0
	 /1awpmrR0YQEJ01UTODCVfTrAVaAhHmWH6ymKNTSLHbfALqi2To8lXQ9mPQcxDhKNnZvc
	 jTXd882o8ezaL6Epn9PVkXfMLRr1WT6wSJiELfPUAIMgJAqetn/t8Ilj4e/Z0sZHqOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725423;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=H2IWjALvk048zmw1NNQJbWvBa81ip8KPbZToHaA7//w=;
	b=jaQifbib0ul3f/C3g+MskCGhRZYtYbREcX7Kia3JaxWTRDBcv2f2jZ/vttOcI6r14scI
	 MPDTmmp34pBM9MSzahzXc/1rBwxdNrw0MIQg1qsDivtgZXIJOQnl3AaNchT4vh77XPWAx
	 OfsiBKNfPjBftN4yd8KMB/SQNW8dcAeT9TsUJOdP8sguZCQobwcsR5pC2usWOMPVZPsnF
	 QxUHKjGQp3plnWytHX9CtUyLALcvEm/hGg3KXAtRDlpnZrh7ocW7J4zlQKyEHUvRzA0Mr
	 IvjobxjwhikfVU57GAAzgf3GDjAezZRJ9pWm8uHvLgRWtcdPpZhqcOHQvw296TCZVUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=c+ARJw9r;
	arc=none smtp.remote-ip=54.92.39.34
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F1A606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25F1A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=c+ARJw9r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725409;
	bh=H2IWjALvk048zmw1NNQJbWvBa81ip8KPbZToHaA7//w=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=c+ARJw9rrvLe9tFyyKcE7J9TVGK/tQi57xqOBNqKDUTk06ZCLoFQjS0s69s5qEzjH
	 rCpenispUA01R7V7lkvYgUElwSKMa/U66yXulgt+l1v7eew7o1+n0WgmaylKvvk2TR
	 UR5TMKl5LRAGPwNkXGdYuYDpiyqA+ipAIAJ4VilE=
X-QQ-mid: esmtpsz11t1792725347t7dc60920
X-QQ-Originating-IP: FlUNMiK0eSMbacfSZBIik/POwMPtq8ySglL4HEmJvX0=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13336916703402963863
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
Subject: [PATCH 10/24] gtrace: Add RISC-V trace funnel driver
Date: Fri, 23 Oct 2026 11:14:51 +0800
Message-Id: <20261023031505.2020925-11-liangzhen@linux.spacemit.com>
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
X-QQ-XMAILINFO: NT6u5eG8AulLbI6iyyB4Wy1vaV39nIB+DTJ6HP+SpjsCgoYUUOpzm9oC
	pue3ozG5LDqV3wpFSZH9cKVMDvkhhtOCFYhTZndfAJ4FBAob/VH6f3LT+qgulNsXFC1p85J
	rDkrga0AYJy9T3hWOqoRyzPlBaMPOehLT4QG1L/y4t0G5lNTxPh+AkAWh8DaCzVfkMhpts6
	2x8h3MVuvIHJXLIxUULPjQc3LIHDUs5KhJLFGlG48dXWQ8+MNHs+UudPtlZzc2IREchbpWt
	QJn42KBw6Wv6mPksdO+INQ9Hasofg6vTjagxBXkNbvBLR09HAXOdFYbFJWSplqrg+M0m4qM
	FxZkyxLLs7XQxhEMGN2cKSYtTDDf4JB9N8Vit3uqWW5ftyeLwlkw28i5bv8MGkkwfLSMKVx
	T/Ge8qQ4pnUK+3D1QjJ98PRJie2sZ3t9f8ayevRKJL/N4sFhwMU1FB6+WaVylJC60XqebLf
	Y+XIguf1CZ3Waa2DZTgFce/mL/2uqFJUIqEQ559V6pXsskGhy2/Mkdr8xoSGZmquiFd9/h5
	ahOcdUk83yOAYhO/WLpzew3bD2PLJxkqO4MOMX3ubD4HkIy+l1X/lz8YKw4b9Ig8146JJkL
	V+YP06AdMGmIqwaAfAKWoRF37OPUz3ivkphf7B31TRvqEawompVaUEMrcs9sCZydfuOa4So
	wbRnwFOM+5qNO5x/tBZnTbWPthbx0vGiDGAbl93EouI63OxeuM0FRIanil/7XstOrc+BEtO
	8SKN3BhRXW4nZqi7DmV0KhmnVhcs4OHtsh+tkvZGUvY7YIkDGcsCLijV3puRaIZ94FF1RTG
	fvdXL326JaJWxeskhaSq18X1EByjOfFDqo+F8GDjLy1tE5lf/REP9qGPgnwbPdvaWMO5JGG
	2GiwxY2ZwJkaE1DJwGQQkA91alUVOsJQ6muaNsoPcgaqFNt9K2HFSyZccsXBxsUthD2kCye
	lJSOAn1/CUZ/FddrTWRm5OjFRVtk4ExJ5VNaOxU25KbwnNqFKIen7+PsaT0+m1+1scMYcDc
	6dZZHcBwxYa4QCrjB5uG6UEa6w7fTuDMoJhFPTyHI3OTjDBSGIj7i6vqgKIBfkpqCi15g2L
	bzOkZIVvhmNKzS0e80DRFk=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

Add initial implementation of RISC-V Trace funnel driver. The funnel
is defined in the RISC-V Trace Control Interface specification.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/Kconfig            |  14 ++
 drivers/hwtracing/gtrace/Makefile           |   1 +
 drivers/hwtracing/gtrace/rvtrace-funnel.c   | 165 ++++++++++++++++++++
 drivers/hwtracing/gtrace/rvtrace-funnel.h   |  21 +++
 drivers/hwtracing/gtrace/rvtrace-platform.c |   3 +
 drivers/hwtracing/gtrace/rvtrace.h          |   1 +
 6 files changed, 205 insertions(+)
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-funnel.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-funnel.h

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index e5b62d65e2fd..f6026965c54d 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -57,3 +57,17 @@ config RVTRACE_RAMSINK
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called rvtrace-ramsink.
+
+config RVTRACE_FUNNEL
+	tristate "RISC-V Trace Funnel driver"
+	depends on RVTRACE
+	default y
+	help
+	  This driver provides support for the RISC-V trace funnel component
+	  which is defined by the RISC-V Trace Control Interface specification.
+	  The funnel merges trace data from multiple input ports into a single
+	  output stream. It is a link component in the trace path between
+	  sources and sinks.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rvtrace-funnel.
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 87cb5add78d4..9c99d917b9f4 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -8,3 +8,4 @@ obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
 rvtrace-encoder-y := rvtrace-encoder-core.o rvtrace-encoder-sysfs.o
 obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
+obj-$(CONFIG_RVTRACE_FUNNEL) += rvtrace-funnel.o
diff --git a/drivers/hwtracing/gtrace/rvtrace-funnel.c b/drivers/hwtracing/gtrace/rvtrace-funnel.c
new file mode 100644
index 000000000000..941cd3360395
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-funnel.c
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Spacemit Technologies, Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/gtrace.h>
+#include <linux/types.h>
+#include "rvtrace.h"
+#include "rvtrace-funnel.h"
+
+static int rvtrace_funnel_start(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = gtrace_enable_component(comp);
+	if (ret)
+		dev_err(&comp->dev, "failed to start rvtrace funnel.\n");
+
+	return ret;
+}
+
+static int rvtrace_funnel_stop(struct gtrace_component *comp)
+{
+	struct rvtrace_funnel_priv *priv = dev_get_drvdata(&comp->dev);
+	int ret;
+
+	ret = gtrace_disable_component(comp);
+	if (ret) {
+		dev_err(&comp->dev, "failed to stop rvtrace funnel.\n");
+		return ret;
+	}
+
+	if (priv->disinput_mask)
+		gtrace_write32(comp->pdata, RVTRACE_FUNNEL_DISINPUT_MASK,
+				RVTRACE_FUNNEL_DISINPUT_OFFSET);
+
+	return 0;
+}
+
+static int _rvtrace_funnel_start_port(struct gtrace_component *comp, int port)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct rvtrace_funnel_priv *priv = dev_get_drvdata(&comp->dev);
+	u32 disinput;
+	int ret;
+
+	if (!(priv->disinput_mask & BIT(port)))
+		return 0;
+
+	disinput = gtrace_read32(pdata, RVTRACE_FUNNEL_DISINPUT_OFFSET);
+	disinput &= ~BIT(port);
+	gtrace_write32(pdata, disinput, RVTRACE_FUNNEL_DISINPUT_OFFSET);
+	ret = gtrace_poll_bit(pdata, RVTRACE_FUNNEL_DISINPUT_OFFSET,
+			      port, 0, comp->pdata->control_poll_timeout_usecs);
+	if (ret)
+		dev_err(&comp->dev, "failed to enable rvtrace funnel inport %d.\n", port);
+
+	return ret;
+}
+
+static int rvtrace_funnel_start_port(struct gtrace_component *comp,
+				     struct gtrace_connection *in,
+				     struct gtrace_connection *out)
+{
+	int ret = 0;
+
+	if (in->dest_refcnt == 0)
+		ret = _rvtrace_funnel_start_port(comp, in->dest_port);
+	if (!ret)
+		in->dest_refcnt++;
+
+	return ret;
+}
+
+static void rvtrace_funnel_stop_port(struct gtrace_component *comp,
+				     struct gtrace_connection *in,
+				     struct gtrace_connection *out)
+{
+	/*
+	 * Setting trFunnelEnable to 0 flushes any queued trace data to output.
+	 * Due to this flush behavior of the RISC-V trace funnel during component
+	 * disablement, we do not disable individual ports here. Instead, we
+	 * defer it and disable all ports at once when the entire component is
+	 * stopped. For now, we only need to decrement the reference count.
+	 */
+	--in->dest_refcnt;
+}
+
+static ssize_t disinput_show(struct device *dev,
+                            struct device_attribute *attr, char *buf)
+{
+	u32 val;
+	struct gtrace_component *comp = to_gtrace_component(dev);
+
+	val = gtrace_read32(comp->pdata, RVTRACE_FUNNEL_DISINPUT_OFFSET);
+
+	return scnprintf(buf, PAGE_SIZE, "0x%x\n", val);
+}
+static DEVICE_ATTR_RO(disinput);
+
+static struct attribute *rvtrace_funnel_attrs[] = {
+	&dev_attr_disinput.attr,
+	NULL,
+};
+
+static struct attribute_group rvtrace_funnel_group = {
+	.attrs = rvtrace_funnel_attrs,
+};
+
+const struct attribute_group *rvtrace_funnel_groups[] = {
+	&rvtrace_funnel_group,
+	NULL,
+};
+EXPORT_SYMBOL_GPL(rvtrace_funnel_groups);
+
+static int rvtrace_funnel_probe(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct rvtrace_funnel_priv *priv;
+
+	priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	gtrace_write32(pdata, RVTRACE_FUNNEL_DISINPUT_MASK, RVTRACE_FUNNEL_DISINPUT_OFFSET);
+	priv->disinput_mask = gtrace_read32(pdata, RVTRACE_FUNNEL_DISINPUT_OFFSET);
+	dev_set_drvdata(&comp->dev, priv);
+	return 0;
+}
+
+static const struct gtrace_component_id rvtrace_funnel_ids[] = {
+	{ .type = GTRACE_RVTRACE_FUNNEL,
+	  .version = rvtrace_component_mkversion(1, 0), },
+	{},
+};
+
+static struct gtrace_driver rvtrace_funnel_driver = {
+	.id_table = rvtrace_funnel_ids,
+	.start = rvtrace_funnel_start,
+	.stop = rvtrace_funnel_stop,
+	.start_port = rvtrace_funnel_start_port,
+	.stop_port = rvtrace_funnel_stop_port,
+	.probe = rvtrace_funnel_probe,
+	.driver = {
+		.name = "rvtrace-funnel",
+	},
+};
+
+static int __init rvtrace_funnel_init(void)
+{
+	return gtrace_register_driver(&rvtrace_funnel_driver);
+}
+
+static void __exit rvtrace_funnel_exit(void)
+{
+	gtrace_unregister_driver(&rvtrace_funnel_driver);
+}
+
+module_init(rvtrace_funnel_init);
+module_exit(rvtrace_funnel_exit);
+
+MODULE_AUTHOR("Zane Leung");
+MODULE_DESCRIPTION("RISC-V Trace Funnel Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwtracing/gtrace/rvtrace-funnel.h b/drivers/hwtracing/gtrace/rvtrace-funnel.h
new file mode 100644
index 000000000000..41547c8971ba
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-funnel.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 Spacemit Technologies, Inc.
+ */
+
+#ifndef __RVTRACE_HENNEL_H__
+#define __RVTRACE_HENNEL_H__
+
+#define RVTRACE_FUNNEL_DISINPUT_OFFSET	0x008
+#define RVTRACE_FUNNEL_DISINPUT_MASK	0xffff
+
+/**
+ * struct rvtrace_encoder_priv - Private driver data for the rvtrace funnel
+ * @disinput_mask: Bitmask of inputs supporting disable.
+ */
+
+struct rvtrace_funnel_priv {
+	u32 disinput_mask;
+};
+
+#endif /* __RVTRACE_ENCODER_H__ */
diff --git a/drivers/hwtracing/gtrace/rvtrace-platform.c b/drivers/hwtracing/gtrace/rvtrace-platform.c
index 64496a638359..ad8daa06e13e 100644
--- a/drivers/hwtracing/gtrace/rvtrace-platform.c
+++ b/drivers/hwtracing/gtrace/rvtrace-platform.c
@@ -133,6 +133,9 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	case GTRACE_RVTRACE_ENCODER:
 		pdata->groups = rvtrace_encoder_groups;
 		break;
+	case GTRACE_RVTRACE_FUNNEL:
+		pdata->groups = rvtrace_funnel_groups;
+		break;
 	default:
 		pdata->groups = NULL;
 	}
diff --git a/drivers/hwtracing/gtrace/rvtrace.h b/drivers/hwtracing/gtrace/rvtrace.h
index fee8e2e4f42a..a345ba110267 100644
--- a/drivers/hwtracing/gtrace/rvtrace.h
+++ b/drivers/hwtracing/gtrace/rvtrace.h
@@ -120,5 +120,6 @@ extern const struct gtrace_hw_ops rvtrace_hw_ops;
 
 /* Sysfs attribute groups for RISC-V trace components */
 extern const struct attribute_group *rvtrace_encoder_groups[];
+extern const struct attribute_group *rvtrace_funnel_groups[];
 
 #endif /* __LINUX_RVTRACE_H__ */
-- 
2.34.1

