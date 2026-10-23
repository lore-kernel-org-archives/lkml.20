Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725434;
	b=17fj1NKkhU+mTr0lAkZAhW223j+/XYk2H6OVPC4LzPvWBO1x5l3uK/ojqkbxmqFvfx6E
	 D+otbbN2RXDhzatx4a4FakiFT5r9vyq4vINyUVn9cmY/KxB336V6a4QlcdSJVqjPZijn/
	 j/JbcroaVuANQta3amE9h2qDF5avpCMVo6n/KCh/HyLkaKkqNfsjYwt8WNsjqx/U9dn8o
	 USs3MfAww0bnXBTCvR3BAPJiH0zSlIILFryY7lKTGrwo/j776rnO/XHoh8Dba7hcNP474
	 u6NEJpfJulzVswJqDawR7jYvVaZPLUxOEaKxafdDBtN/PqwLgM0y22hluoNV7aYoXFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725434;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=4i8JwP6oCKvaWFiCr0xBtQ3S5XL/T5PUUSds+1oSotw=;
	b=Qi2txKoQMwf3o0nhdGw7wPLniggPx3uJ3jxoNOAF+hBKTV/qIFEtlJ9yYUyy1Zh5vD6e
	 RKot8OnfHGs7dBTMQOv4BAyCJmzqfMxOPkEJOHaAOkDb+AlMAbYO0YRfyatE6P9V3JSwf
	 HrAZ/QBDbHpA8UoVzNS2tnJjoyH9E49MMa7hGVnv/cLv7bx7FtRxpK5hfEaeVSzpqZo89
	 yMVPQyGyEkxgEzsEQNWu0RfB+mKee/16HmEtUJapox+VKp1ooUHwPchK5TQO3k1XT4BlA
	 alyXHY/gD8+RNxen4SacvRenRLED4k8OmlfGezh7XqiBIkcexHiRvkwOgLkVAhZrzKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=mxebf6Xs;
	arc=none smtp.remote-ip=54.254.200.92
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1786C606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1786C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=mxebf6Xs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725414;
	bh=4i8JwP6oCKvaWFiCr0xBtQ3S5XL/T5PUUSds+1oSotw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=mxebf6Xsr7xry8LyQ/lmwoSzxCY5HEaVdqhGT3CqpCC9ONC2tqFUQtM7zA69iB352
	 j30QfER1/SXX8hra8e9XFtl4WvbJtYTfElZvDr+26N+/41PJD875JlTo7L1v+URQAC
	 gxVkcfHUF/6/gmViOVjx+KtIY5+qTNaCQy3ghyFc=
X-QQ-mid: esmtpsz11t1792725355td00874e0
X-QQ-Originating-IP: OUbCtLgyPlEsH2hTIB5YNITd6hW6VB/tUQYHlZsP6gU=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 745812888069500600
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
Subject: [PATCH 12/24] gtrace: Add RISC-V trace ATB bridge driver
Date: Fri, 23 Oct 2026 11:14:53 +0800
Message-Id: <20261023031505.2020925-13-liangzhen@linux.spacemit.com>
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
X-QQ-XMAILINFO: NvNI1j1EI4wHiQJK+4km4S/x40HiNslNA27T4u3xhBEgSMt+/PgCzWJG
	E1+OPCQA4n2nr9inzOcYmqtwbKdHr1HsSAaPPs9fVCcwQiD8tziBaCqTeR968cbzzePUme8
	57tixLZp7ONR9kdGqwiIbKFYfjJXkb2sIsKc5jxEc5UvlYU2NLoqe5XEgI1qIyzuLfH3QoT
	26QmvhRk2Yq8q/kE3MXqEdUqkN7uW2PCq+PrXnmo5AuJb4AHFYNQZFc2sE8NKj6T2XotQ4y
	OSoufEuwHutchPoIAp9YBwgfzTCBM/carljB0elffc2+5AnzpZdkOl5EVfCqo3EKo+4Klpc
	d3yGOEz9/Wz+e6y10siNM96+iasZReLeGlU0SUm3FBRqL+5NZwxbQqVuMfFXIlHTi2XGfdE
	GB3KXhUseBJ8+0z7trwVYzk0rC5v+3ecJpB4i/rZe1GYuMF3S0tg6ZAj9kDScaooXeIqmTj
	KsjSnzYuUO+dbrFLXzbuGj3L0Y/QGrrOArx5tDDTfr8aGKyD4PJas81ArToHY2krhgsXNiY
	JFST/hjpMWgaw/OQwHwydEX6wwtZonDSe/keyMhuLR1VOJNWAQPNy5PAwTkDYQIpt6Kv9jb
	2fst4jXZOwxt1S7htClLEn1NRtzypb/dPKFdtUagw1PCR4yAuy0flRU7P0/MySc0Y9rJb2r
	q/oj9Q3IBQ+Sk/FRh/x8AwExycdTnYfqWZWZo3TD42u93oQkKN9XySohAfYDS8E2kDDBgNe
	KT6NljbgAsSyq0g2yXZN+W0lVHdKbwCU5Dp2z13C9PcfxXRuZeQWIaGLaGOtW5aoj8XwIXQ
	1p9hB8+HLL3JrMsjiZIGeaNUQ/YDRpGlz0b5rqfyKWFTvA27yTIA7ydHOYBuQMDYVmFT1XA
	4dR2ZlRyl0MuI6tP5k2DZIz5wR55RevnaNGAxY0Or7GWJsrUBoN4myWNzwKrFjCuoPrUGbi
	Qnk6Ly+BvCo9UMnQxURkNWo+kuLfiRi2DDiikV/+kwvWK0cCkq6LyDiJP2ymK8BWnO6jwib
	Fi5SdC9P7DceeGRTmLbJeU/sryEh5/uLICGkoLVi7SyNl2IjXwebJi4fjFvfNCJVRZYemdO
	VZG9jFJ7M1yIvpT9uoJO6M=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

Add initial implementation of RISC-V Trace atbbridge driver. The
atbbridge is defined in the RISC-V Trace Control Interface specification.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/Kconfig             |  15 ++
 drivers/hwtracing/gtrace/Makefile            |   1 +
 drivers/hwtracing/gtrace/rvtrace-atbbridge.c | 153 +++++++++++++++++++
 drivers/hwtracing/gtrace/rvtrace-platform.c  |   3 +
 drivers/hwtracing/gtrace/rvtrace.h           |   1 +
 5 files changed, 173 insertions(+)
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-atbbridge.c

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index f6026965c54d..3af47d7c3ce3 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -71,3 +71,18 @@ config RVTRACE_FUNNEL
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called rvtrace-funnel.
+
+config RVTRACE_ATBBRIDGE
+	tristate "RISC-V Trace ATB Bridge driver"
+	depends on RVTRACE
+	default y
+	help
+	  This driver provides support for the RISC-V trace ATB bridge
+	  component which is defined by the RISC-V Trace Control Interface
+	  specification. The ATB bridge converts the RISC-V trace stream
+	  to the ARM Advanced Trace Bus (ATB) protocol, allowing RISC-V
+	  trace sources to feed into ARM CoreSight trace components. It is
+	  a link component in the trace path.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rvtrace-atbbridge.
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index b60d3cfe5248..3f1dcb5664a2 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
 rvtrace-encoder-y := rvtrace-encoder-core.o rvtrace-encoder-sysfs.o
 obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
 obj-$(CONFIG_RVTRACE_FUNNEL) += rvtrace-funnel.o
+obj-$(CONFIG_RVTRACE_ATBBRIDGE) += rvtrace-atbbridge.o
diff --git a/drivers/hwtracing/gtrace/rvtrace-atbbridge.c b/drivers/hwtracing/gtrace/rvtrace-atbbridge.c
new file mode 100644
index 000000000000..92a59ed80a11
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-atbbridge.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Spacemit Technologies, Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/gtrace.h>
+#include <linux/idr.h>
+#include <linux/types.h>
+#include <linux/bitfield.h>
+#include "rvtrace.h"
+
+#define RVTRACE_ATBBRIDGE_CTRL_ATID_MASK    GENMASK(14, 8)
+#define RVTRACE_ATBBRIDGE_ATID_MIN	    0x1
+#define RVTRACE_ATBBRIDGE_ATID_MAX	    0x6f
+
+static DEFINE_IDA(rvtrace_atbbridge_atid_ida);
+
+struct rvtrace_atbbridge_priv {
+	int atid;
+};
+
+static int rvtrace_atbbridge_start(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = gtrace_enable_component(comp);
+	if (ret)
+		dev_err(&comp->dev, "failed to start atbbridge.\n");
+
+	return ret;
+}
+
+static int rvtrace_atbbridge_stop(struct gtrace_component *comp)
+{
+	int ret;
+
+	ret = gtrace_disable_component(comp);
+	if (ret)
+		dev_err(&comp->dev, "failed to stop atbbridge.\n");
+
+	return ret;
+}
+
+static ssize_t cpu_show(struct device *dev,
+			struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+
+	return sysfs_emit(buf, "%d\n", comp->pdata->bound_cpu);
+}
+static DEVICE_ATTR_RO(cpu);
+
+static ssize_t atid_show(struct device *dev,
+			 struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_atbbridge_priv *priv = dev_get_drvdata(&comp->dev);
+
+	return sysfs_emit(buf, "%u\n", priv->atid);
+}
+static DEVICE_ATTR_RO(atid);
+
+static struct attribute *rvtrace_atbbridge_attrs[] = {
+	&dev_attr_cpu.attr,
+	&dev_attr_atid.attr,
+	NULL,
+};
+
+static const struct attribute_group rvtrace_atbbridge_group = {
+	.attrs = rvtrace_atbbridge_attrs,
+};
+
+const struct attribute_group *rvtrace_atbbridge_groups[] = {
+	&rvtrace_atbbridge_group,
+	NULL,
+};
+EXPORT_SYMBOL_GPL(rvtrace_atbbridge_groups);
+
+static void rvtrace_atbbridge_cleanup(struct gtrace_component *comp)
+{
+	struct rvtrace_atbbridge_priv *priv = dev_get_drvdata(&comp->dev);
+
+	ida_free(&rvtrace_atbbridge_atid_ida, priv->atid);
+}
+
+static int rvtrace_atbbridge_probe(struct gtrace_component *comp)
+{
+	struct rvtrace_atbbridge_priv *priv;
+	u32 val;
+
+	priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->atid = ida_alloc_range(&rvtrace_atbbridge_atid_ida,
+				     RVTRACE_ATBBRIDGE_ATID_MIN,
+				     RVTRACE_ATBBRIDGE_ATID_MAX,
+				     GFP_KERNEL);
+	if (priv->atid < 0) {
+		dev_err(&comp->dev, "failed to allocate ATID.\n");
+		return priv->atid;
+	}
+
+	val = gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val &= ~RVTRACE_ATBBRIDGE_CTRL_ATID_MASK;
+	val |= FIELD_PREP(RVTRACE_ATBBRIDGE_CTRL_ATID_MASK, priv->atid);
+	gtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	dev_set_drvdata(&comp->dev, priv);
+
+	return 0;
+}
+
+static void rvtrace_atbbridge_remove(struct gtrace_component *comp)
+{
+	rvtrace_atbbridge_cleanup(comp);
+}
+
+static const struct gtrace_component_id rvtrace_atbbridge_ids[] = {
+	{ .type = GTRACE_RVTRACE_ATBBRIDGE,
+	  .version = rvtrace_component_mkversion(1, 0), },
+	{},
+};
+
+static struct gtrace_driver rvtrace_atbbridge_driver = {
+	.id_table = rvtrace_atbbridge_ids,
+	.probe = rvtrace_atbbridge_probe,
+	.remove = rvtrace_atbbridge_remove,
+	.start = rvtrace_atbbridge_start,
+	.stop = rvtrace_atbbridge_stop,
+	.driver = {
+		.name = "rvtrace-atbbridge",
+	},
+};
+
+static int __init rvtrace_atbbridge_init(void)
+{
+	return gtrace_register_driver(&rvtrace_atbbridge_driver);
+}
+
+static void __exit rvtrace_atbbridge_exit(void)
+{
+	gtrace_unregister_driver(&rvtrace_atbbridge_driver);
+	ida_destroy(&rvtrace_atbbridge_atid_ida);
+}
+
+module_init(rvtrace_atbbridge_init);
+module_exit(rvtrace_atbbridge_exit);
+
+MODULE_AUTHOR("Zane Leung");
+MODULE_DESCRIPTION("RISC-V Trace ATB Bridge Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwtracing/gtrace/rvtrace-platform.c b/drivers/hwtracing/gtrace/rvtrace-platform.c
index ad8daa06e13e..9bd315867082 100644
--- a/drivers/hwtracing/gtrace/rvtrace-platform.c
+++ b/drivers/hwtracing/gtrace/rvtrace-platform.c
@@ -136,6 +136,9 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	case GTRACE_RVTRACE_FUNNEL:
 		pdata->groups = rvtrace_funnel_groups;
 		break;
+	case GTRACE_RVTRACE_ATBBRIDGE:
+		pdata->groups = rvtrace_atbbridge_groups;
+		break;
 	default:
 		pdata->groups = NULL;
 	}
diff --git a/drivers/hwtracing/gtrace/rvtrace.h b/drivers/hwtracing/gtrace/rvtrace.h
index a345ba110267..5cbe3405e274 100644
--- a/drivers/hwtracing/gtrace/rvtrace.h
+++ b/drivers/hwtracing/gtrace/rvtrace.h
@@ -121,5 +121,6 @@ extern const struct gtrace_hw_ops rvtrace_hw_ops;
 /* Sysfs attribute groups for RISC-V trace components */
 extern const struct attribute_group *rvtrace_encoder_groups[];
 extern const struct attribute_group *rvtrace_funnel_groups[];
+extern const struct attribute_group *rvtrace_atbbridge_groups[];
 
 #endif /* __LINUX_RVTRACE_H__ */
-- 
2.34.1

