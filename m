Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725441;
	b=NeRi9DGoNGJT2Tx2k586+bMVs7QmGWkgMce/ba4KaZC0HLJeAYZARGmzy5cds/KfVP4I
	 as3zjVYtwP/J6hO4GQCVS4vZPYKxIc/Y64JtN4hh3sHt4XkGwIIUUzj8ugzlV9LjJqORe
	 rM68UAAaYHhsGFURFs/XTkhMPGeeEQ5XH1fiEVC8PAEVHSDFllkWEwwCq3famrN9HAfdz
	 ez/slPVwGvgCl8fxyzaVwUSPDy6y62j09/7haMs6AAkzFbUcJWrVGDUZyLtEsmCbk9r4X
	 h+gAZFJs3G6gOF/2dmduB5hSuWOgEoX80Nb6bjRaRWrhiKL9Z/2nK6UgsXEqZRXgMJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725441;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=mkGGwXbQybCvoYCC3csEwc/txTzlfZkmjYSHY29OcVA=;
	b=wbXfof1ga8Gyr5ETMmjsYAXuodW+IZCU1dDU/jEE9GT5O23ZtA9RyI6WoKbx6zEpdiff
	 ssIa8wF1mOU/5wwf6eClgU3RR+/RraAXv3DjTo8ZE6T0hqWnLr5a8bfm26AOJGeeHJvEQ
	 w9SN7JZittnJfxYK23H//kH3b1T4szedaxyS/qs7vXHsizMgCO5gDvclxprw1SD1HLGxA
	 FfjuxAdsx4Ohm1rfjPZU3FxpdyIl5y8yKTyMaLWB04aPF7W6wsI60xhgc93E8XnNY1pHj
	 s3tFfTgk0vnKLz1AjslGw68yKrGT16nENobN1hZxSudoi7RF2dMJZWQSkuTwKp2fqzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=rdVNabaY;
	arc=none smtp.remote-ip=54.243.244.52
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E90606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6E90606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=rdVNabaY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725413;
	bh=mkGGwXbQybCvoYCC3csEwc/txTzlfZkmjYSHY29OcVA=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=rdVNabaYDe2qe63ugSQVADYQO6DOUyIOEVOEkeHWEITza72rpwtEC2VNJiFrDS643
	 3X6rgIZQ9d47dQxLceTqXfCB020Wm0huvipOfkam97BHArJVfbNggwmGiKCbDimS9i
	 umk4i6f1dOrm+zUKFLFNb6EqGdoI+woKsf8qZmK0=
X-QQ-mid: esmtpsz11t1792725351t814e59f4
X-QQ-Originating-IP: yzOEdM5/KM/iy2YXPZCwe3IX4Cbiir/s+/R1sBcG26I=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12203296309924822045
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
Subject: [PATCH 11/24] gtrace: Add RISC-V trace timestamp support
Date: Fri, 23 Oct 2026 11:14:52 +0800
Message-Id: <20261023031505.2020925-12-liangzhen@linux.spacemit.com>
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
X-QQ-XMAILINFO: N3w+cgKRwc63Ce/8Gi6fYLpJAIFNl8DFoyrUjb6M1iiPT0NSqWZKKXHE
	XUqLgTeZpcsdcbOHD8yIp0KlAalE1Hx//1ELL084GaJoaQ+QH5Ptd1/TzqohH3Hc01wsls0
	Jgo/MNcYBNqLsI4ESMOL84vJqyjv5rhEoNwh7q59P4AKK1Kfo6GK/YzukW1A8lP4gCq9X/9
	x0GoVM2qStU/uEmNnniEFW5PBhuEUSjcURbe3B5cA1tqLUjbcedJGIZESu76dPsK2iNpZH2
	u5q3wVY0TkNBRkU9QXqtCkIE8m07A4uBie75Rk7gNstE/RKbuLIhs4sZIlRG2ECLlQL0RTo
	UDtEKm3woY+FSKy4/BK8Ock6CtvA0S0uJM8qmFKVwfOaf5q0cjnlPsLYH37MEobABjzEDOr
	Ik6V0ZN8fXREqyq7JbKa06GcvGQiddvTGWyl+91hwgcHG71dZcjpbG6lyM5pCz6QHTRqpOY
	pHge2YDcQv1mQPB74GIOS9pS2E1zvHpwM7p1/fLBJoi6O68lwrNe4Moe8VStT/brXWBVele
	utyWpR+UVYNW53oRBbcgHVa5utyf05Gx+zs3pmlPvy7Tmt41lZrpwX7gCAK52S0kLFbXZAe
	/8SECriB3ez0DxcdEcCQ02dnZTPSZFhjR+Rb1m0iqDNcGVxGaRQv/YIfB8ulzH7ZiJ0fkNF
	TW+HpfneU6zY+oKnn2HSt7N7agUQxuMIyjmgeegc0cJ+UNabdBQRCZ0y9c280wab6vTASQM
	cXEfzb5ZPUkty+6NrQsGsYecNg7nWegG3NnB5W9t9HqgvD665tp2/XxpGsT2dtuM/zJ197p
	j4KjOPSg2OoDxYmRw2wo+N8RBDWl8nxsIRMUDP7S+Gr5yUJD0BAtronaZAsm7SP9GaLyYmR
	cPAtYQo7SMksMwVwRT3NA9N4mWHcn31ZOGk++pNk7llR6sWDo+YNsDPH8V8w5MvOCqd2Y0s
	gNXqzlloYNwwT5G0nCT6RmBWu0nddrcxiDEuKDkase/aOfIctc+NpodsR/Gb7MWBN/tofJC
	gKCMcg7QjGP9lU5LB9gmNN5HzyVBgXXbI4Br46CwKpk0ybg1bN8uLc2ZFOTY2JeJHdN0alQ
	WXJ9mgNzMZMgsfDkb4foZE=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

Add a shared timestamp component for the RISC-V trace encoder and
funnel.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/Makefile             |   3 +-
 .../hwtracing/gtrace/rvtrace-encoder-core.c   |  16 +-
 .../hwtracing/gtrace/rvtrace-encoder-sysfs.c  |  33 ++
 drivers/hwtracing/gtrace/rvtrace-encoder.h    |   8 +
 drivers/hwtracing/gtrace/rvtrace-funnel.c     |  55 +++
 drivers/hwtracing/gtrace/rvtrace-funnel.h     |   8 +
 drivers/hwtracing/gtrace/rvtrace-timestamp.c  | 336 ++++++++++++++++++
 drivers/hwtracing/gtrace/rvtrace-timestamp.h  |  44 +++
 8 files changed, 500 insertions(+), 3 deletions(-)
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-timestamp.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-timestamp.h

diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 9c99d917b9f4..b60d3cfe5248 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -4,7 +4,8 @@ obj-$(CONFIG_GTRACE) += gtrace.o
 gtrace-y := gtrace-core.o gtrace-perf.o gtrace-sysfs.o
 gtrace-$(CONFIG_OF) += gtrace-of.o
 
-obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
+obj-$(CONFIG_RVTRACE) += rvtrace.o
+rvtrace-y := rvtrace-platform.o rvtrace-timestamp.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
 rvtrace-encoder-y := rvtrace-encoder-core.o rvtrace-encoder-sysfs.o
 obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder-core.c b/drivers/hwtracing/gtrace/rvtrace-encoder-core.c
index 17a3dde1314c..c0541fee6b93 100644
--- a/drivers/hwtracing/gtrace/rvtrace-encoder-core.c
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder-core.c
@@ -127,6 +127,10 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 		val |= BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
 		gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
 	}
+
+	priv->has_timestamp = rvtrace_timestamp_reset(pdata) == 0;
+	if (priv->has_timestamp)
+		rvtrace_timestamp_init(pdata, &priv->ts_priv);
 	dev_set_drvdata(&comp->dev, priv);
 
 	ret = gtrace_perf_symlink(comp, true);
@@ -155,6 +159,8 @@ static void rvtrace_encoder_parse_event_config(struct rvtrace_encoder_priv *priv
 	u64 config = event->attr.config;
 	enum rvtrace_encoder_syncmode syncmode;
 
+	if (priv->has_timestamp)
+		priv->ts_ctrl = config & BIT(GTRACE_PMU_ATTR_CFG_TIMESTAMP_SHIFT);
 	if (priv->has_context)
 		priv->context = config & BIT(GTRACE_PMU_ATTR_CFG_CONTEXT_SHIFT);
 
@@ -170,11 +176,17 @@ static int rvtrace_encoder_start(struct gtrace_component *comp)
 	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
 	struct gtrace_platform_data *pdata = comp->pdata;
 	struct gtrace_path *path = comp->path;
+	struct perf_event *event = NULL;
 	int ret;
 	u32 val;
 
-	if (path->mode == GTRACE_COMPONENT_MODE_PERF)
-		rvtrace_encoder_parse_event_config(priv, path->event);
+	if (path->mode == GTRACE_COMPONENT_MODE_PERF) {
+		event = path->event;
+		rvtrace_encoder_parse_event_config(priv, event);
+	}
+
+	if (priv->has_timestamp)
+		rvtrace_timestamp_setup(pdata, &priv->ts_priv, event, priv->ts_ctrl);
 
 	if (priv->srcbits)
 		rvtrace_encoder_set_srcid(pdata, priv->srcbits);
diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder-sysfs.c b/drivers/hwtracing/gtrace/rvtrace-encoder-sysfs.c
index e973d0e43036..638759be2987 100644
--- a/drivers/hwtracing/gtrace/rvtrace-encoder-sysfs.c
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder-sysfs.c
@@ -84,8 +84,40 @@ static ssize_t cpu_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(cpu);
 
+static ssize_t ts_ctrl_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+
+	return sysfs_emit(buf, "%u\n", priv->ts_ctrl);
+}
+
+static ssize_t ts_ctrl_store(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t size)
+{
+	int ret;
+	unsigned long val;
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+
+	if (!priv->has_timestamp)
+		return -EINVAL;
+
+	ret = kstrtoul(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	priv->ts_ctrl = !!val;
+
+	return size;
+}
+static DEVICE_ATTR_RW(ts_ctrl);
+
 static struct attribute *rvtrace_encoder_attrs[] = {
 	&dev_attr_cpu.attr,
+	&dev_attr_ts_ctrl.attr,
 	NULL,
 };
 
@@ -285,6 +317,7 @@ const struct attribute_group *rvtrace_encoder_groups[] = {
 	&rvtrace_encoder_mgmt_group,
 	&rvtrace_encoder_control_group,
 	&rvtrace_encoder_features_group,
+	&rvtrace_timestamp_group,
 	NULL,
 };
 EXPORT_SYMBOL_GPL(rvtrace_encoder_groups);
diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder.h b/drivers/hwtracing/gtrace/rvtrace-encoder.h
index 733d44c0e641..579567dabb3a 100644
--- a/drivers/hwtracing/gtrace/rvtrace-encoder.h
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder.h
@@ -3,6 +3,8 @@
 #ifndef __RVTRACE_ENCODER_H__
 #define __RVTRACE_ENCODER_H__
 
+#include "rvtrace-timestamp.h"
+
 #define RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT     2
 #define RVTRACE_COMPONENT_CTRL_INSTMODE_MASK	GENMASK(6, 4)
 #define RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT	0x6
@@ -38,6 +40,9 @@ enum rvtrace_encoder_syncmode {
  * @has_context: Hardware flag for scontext/mcontext and privilege tracking.
  * @context:     Current configuration for scontext/mcontext and privilege tracking.
  * @boot_enable: Flag to automatically enable tracing on boot.
+ * @has_timestamp: Hardware flag indicating if timestamp generation is supported.
+ * @ts_ctrl:       Current configuration state of timestamp control.
+ * @ts_priv:       Private configuration data specific to the timestamp unit.
  */
 struct rvtrace_encoder_priv {
 	bool syncmode_hw[RVTRACE_ENCODER_SYNCMODE_MAX];
@@ -48,6 +53,9 @@ struct rvtrace_encoder_priv {
 	bool has_context;
 	bool context;
 	bool boot_enable;
+	bool has_timestamp;
+	bool ts_ctrl;
+	struct rvtrace_timestamp_priv ts_priv;
 };
 
 #endif/* __RVTRACE_ENCODER_H__ */
diff --git a/drivers/hwtracing/gtrace/rvtrace-funnel.c b/drivers/hwtracing/gtrace/rvtrace-funnel.c
index 941cd3360395..c4b3396568f7 100644
--- a/drivers/hwtracing/gtrace/rvtrace-funnel.c
+++ b/drivers/hwtracing/gtrace/rvtrace-funnel.c
@@ -9,10 +9,28 @@
 #include "rvtrace.h"
 #include "rvtrace-funnel.h"
 
+static void rvtrace_funnel_parse_event_config(struct rvtrace_funnel_priv *priv,
+					      struct perf_event *event)
+{
+	u64 config = event->attr.config;
+
+	priv->ts_ctrl = config & BIT(GTRACE_PMU_ATTR_CFG_TIMESTAMP_SHIFT);
+}
+
 static int rvtrace_funnel_start(struct gtrace_component *comp)
 {
+	struct gtrace_path *path = comp->path;
+	struct rvtrace_funnel_priv *priv = dev_get_drvdata(&comp->dev);
+	struct perf_event *event = NULL;
 	int ret;
 
+	if (path->mode == GTRACE_COMPONENT_MODE_PERF) {
+		event = path->event;
+		rvtrace_funnel_parse_event_config(priv, event);
+	}
+	if (priv->has_timestamp)
+		rvtrace_timestamp_setup(comp->pdata, &priv->ts_priv, event, priv->ts_ctrl);
+
 	ret = gtrace_enable_component(comp);
 	if (ret)
 		dev_err(&comp->dev, "failed to start rvtrace funnel.\n");
@@ -99,8 +117,40 @@ static ssize_t disinput_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(disinput);
 
+static ssize_t ts_ctrl_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_funnel_priv *priv = dev_get_drvdata(&comp->dev);
+
+	return sysfs_emit(buf, "%u\n", priv->ts_ctrl);
+}
+
+static ssize_t ts_ctrl_store(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t size)
+{
+	int ret;
+	unsigned long val;
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_funnel_priv *priv = dev_get_drvdata(&comp->dev);
+
+	if (!priv->has_timestamp)
+		return -EINVAL;
+
+	ret = kstrtoul(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	priv->ts_ctrl = !!val;
+
+	return size;
+}
+static DEVICE_ATTR_RW(ts_ctrl);
+
 static struct attribute *rvtrace_funnel_attrs[] = {
 	&dev_attr_disinput.attr,
+	&dev_attr_ts_ctrl.attr,
 	NULL,
 };
 
@@ -110,6 +160,7 @@ static struct attribute_group rvtrace_funnel_group = {
 
 const struct attribute_group *rvtrace_funnel_groups[] = {
 	&rvtrace_funnel_group,
+	&rvtrace_timestamp_group,
 	NULL,
 };
 EXPORT_SYMBOL_GPL(rvtrace_funnel_groups);
@@ -123,6 +174,10 @@ static int rvtrace_funnel_probe(struct gtrace_component *comp)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->has_timestamp = rvtrace_timestamp_reset(pdata) == 0;
+	if (priv->has_timestamp)
+		rvtrace_timestamp_init(pdata, &priv->ts_priv);
+
 	gtrace_write32(pdata, RVTRACE_FUNNEL_DISINPUT_MASK, RVTRACE_FUNNEL_DISINPUT_OFFSET);
 	priv->disinput_mask = gtrace_read32(pdata, RVTRACE_FUNNEL_DISINPUT_OFFSET);
 	dev_set_drvdata(&comp->dev, priv);
diff --git a/drivers/hwtracing/gtrace/rvtrace-funnel.h b/drivers/hwtracing/gtrace/rvtrace-funnel.h
index 41547c8971ba..dddab5db8bef 100644
--- a/drivers/hwtracing/gtrace/rvtrace-funnel.h
+++ b/drivers/hwtracing/gtrace/rvtrace-funnel.h
@@ -6,16 +6,24 @@
 #ifndef __RVTRACE_HENNEL_H__
 #define __RVTRACE_HENNEL_H__
 
+#include "rvtrace-timestamp.h"
+
 #define RVTRACE_FUNNEL_DISINPUT_OFFSET	0x008
 #define RVTRACE_FUNNEL_DISINPUT_MASK	0xffff
 
 /**
  * struct rvtrace_encoder_priv - Private driver data for the rvtrace funnel
  * @disinput_mask: Bitmask of inputs supporting disable.
+ * @has_timestamp: Hardware flag indicating if timestamp generation is supported.
+ * @ts_ctrl:       Current configuration state of timestamp control.
+ * @ts_priv:       Private configuration data specific to the timestamp unit.
  */
 
 struct rvtrace_funnel_priv {
 	u32 disinput_mask;
+	bool has_timestamp;
+	bool ts_ctrl;
+	struct rvtrace_timestamp_priv ts_priv;
 };
 
 #endif /* __RVTRACE_ENCODER_H__ */
diff --git a/drivers/hwtracing/gtrace/rvtrace-timestamp.c b/drivers/hwtracing/gtrace/rvtrace-timestamp.c
new file mode 100644
index 000000000000..0ec7436add16
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-timestamp.c
@@ -0,0 +1,336 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright(C) 2026 Spacemit Technologies, Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/gtrace.h>
+#include <linux/bitfield.h>
+#include "rvtrace.h"
+#include "rvtrace-timestamp.h"
+#include "rvtrace-encoder.h"
+#include "rvtrace-funnel.h"
+
+int rvtrace_timestamp_reset(struct gtrace_platform_data *pdata)
+{
+	gtrace_write32(pdata, 0, RVTRACE_TIMESTAMP_CTRL_OFFSET);
+	gtrace_write32(pdata, RVTRACE_COMPONENT_CTRL_ACTIVE_MASK, RVTRACE_TIMESTAMP_CTRL_OFFSET);
+	return gtrace_poll_bit(pdata, RVTRACE_TIMESTAMP_CTRL_OFFSET,
+			       RVTRACE_COMPONENT_CTRL_ACTIVE_SHIFT, 1,
+			       pdata->control_poll_timeout_usecs);
+}
+EXPORT_SYMBOL_GPL(rvtrace_timestamp_reset);
+
+void rvtrace_timestamp_init(struct gtrace_platform_data *pdata,
+			    struct rvtrace_timestamp_priv *priv)
+{
+	u32 ctrl, val;
+	enum rvtrace_timestamp_mode mode;
+
+	ctrl = gtrace_read32(pdata, RVTRACE_TIMESTAMP_CTRL_OFFSET);
+	priv->mode = FIELD_GET(RVTRACE_TIMESTAMP_MODE_MASK, ctrl);
+
+	/* get timestamp mode hw */
+	for (mode = RVTRACE_TIMESTAMP_MODE_NONE; mode < RVTRACE_TIMESTAMP_MODE_MAX; mode++) {
+		val = ctrl & ~RVTRACE_TIMESTAMP_MODE_MASK;
+		val |= FIELD_PREP(RVTRACE_TIMESTAMP_MODE_MASK, mode);
+		gtrace_write32(pdata, val, RVTRACE_TIMESTAMP_CTRL_OFFSET);
+		val = gtrace_read32(pdata, RVTRACE_TIMESTAMP_CTRL_OFFSET);
+		val = FIELD_GET(RVTRACE_TIMESTAMP_MODE_MASK, val);
+		priv->mode_hw[mode] = (mode == val);
+	}
+
+	gtrace_write32(pdata, ctrl, RVTRACE_TIMESTAMP_CTRL_OFFSET);
+}
+EXPORT_SYMBOL_GPL(rvtrace_timestamp_init);
+
+static bool rvtrace_timestamp_is_internal(struct rvtrace_timestamp_priv *priv)
+{
+	return (priv->mode == RVTRACE_TIMESTAMP_MODE_INTERNAL_SYSTEM ||
+		priv->mode == RVTRACE_TIMESTAMP_MODE_INTERNAL_CORE);
+}
+
+static void rvtrace_timestamp_parse_event_config(struct rvtrace_timestamp_priv *priv,
+						 struct perf_event *event)
+{
+	u64 config = event->attr.config;
+
+	if (priv->mode_hw[FIELD_GET(GTRACE_PMU_ATTR_CFG_TSMODE_MASK, config)])
+		priv->mode = FIELD_GET(GTRACE_PMU_ATTR_CFG_TSMODE_MASK, config);
+	if (rvtrace_timestamp_is_internal(priv))
+		priv->prescale = FIELD_GET(GTRACE_PMU_ATTR_CFG_TSPRESCALE_MASK, config);
+}
+
+void rvtrace_timestamp_setup(struct gtrace_platform_data *pdata,
+			     struct rvtrace_timestamp_priv *priv,
+			     struct perf_event *event,
+			     bool enable)
+{
+	u32 val;
+
+	if (event)
+		rvtrace_timestamp_parse_event_config(priv, event);
+
+	val = gtrace_read32(pdata, RVTRACE_TIMESTAMP_CTRL_OFFSET);
+	val &= ~RVTRACE_TIMESTAMP_MODE_MASK;
+	val &= ~RVTRACE_TIMESTAMP_PRESCALE_MASK;
+	val |= FIELD_PREP(RVTRACE_TIMESTAMP_MODE_MASK, priv->mode);
+	val |= FIELD_PREP(RVTRACE_TIMESTAMP_PRESCALE_MASK, priv->prescale);
+
+	val &= ~BIT(RVTRACE_TIMESTAMP_COUNT_SHIFT);
+	val &= ~BIT(RVTRACE_TIMESTAMP_ENABLE_SHIFT);
+	if (enable) {
+		val |= BIT(RVTRACE_TIMESTAMP_COUNT_SHIFT);
+		val |= BIT(RVTRACE_TIMESTAMP_ENABLE_SHIFT);
+	}
+
+	gtrace_write32(pdata, val, RVTRACE_TIMESTAMP_CTRL_OFFSET);
+}
+EXPORT_SYMBOL_GPL(rvtrace_timestamp_setup);
+
+static struct rvtrace_timestamp_priv *get_timestamp_priv(struct gtrace_component *comp)
+{
+	enum gtrace_component_type gtype = comp->id.type;
+
+	if (gtype == GTRACE_RVTRACE_ENCODER) {
+		struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+		return &priv->ts_priv;
+	} else if (gtype == GTRACE_RVTRACE_FUNNEL) {
+		struct rvtrace_funnel_priv *priv = dev_get_drvdata(&comp->dev);
+		return &priv->ts_priv;
+	}
+
+	return NULL;
+}
+
+static struct gtrace_component *rvtrace_find_funnel(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct gtrace_connection *conn = NULL;
+	int i;
+
+	if (comp->id.type == GTRACE_RVTRACE_FUNNEL)
+		return comp;
+
+	if (!pdata->nr_outconns)
+		return NULL;
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		if (conn && conn->dest_comp)
+			break;
+	}
+
+	if (!conn)
+		return NULL;
+
+	return rvtrace_find_funnel(conn->dest_comp);
+}
+
+static struct gtrace_component *rvtrace_timestamp_get_source(struct gtrace_component *comp)
+{
+	struct gtrace_component *dest = comp;
+
+	if (dest->id.type == GTRACE_RVTRACE_ENCODER) {
+		struct rvtrace_encoder_priv *priv = dev_get_drvdata(&dest->dev);
+
+		if (priv && priv->has_timestamp)
+			return dest;
+
+		dest = rvtrace_find_funnel(dest);
+		if (!dest)
+			return NULL;
+	}
+
+	if (dest->id.type == GTRACE_RVTRACE_FUNNEL) {
+		struct rvtrace_funnel_priv *priv = dev_get_drvdata(&dest->dev);
+
+		if (priv && priv->has_timestamp)
+			return dest;
+	}
+
+	return NULL;
+}
+
+static ssize_t source_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+
+	comp = rvtrace_timestamp_get_source(comp);
+	if (!comp)
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%s\n", dev_name(&comp->dev));
+}
+static DEVICE_ATTR_RO(source);
+
+static const char * const modes_str[] = {
+	[RVTRACE_TIMESTAMP_MODE_NONE] = "none",
+	[RVTRACE_TIMESTAMP_MODE_EXTERNAL] = "external",
+	[RVTRACE_TIMESTAMP_MODE_INTERNAL_SYSTEM] = "internal_system",
+	[RVTRACE_TIMESTAMP_MODE_INTERNAL_CORE] = "internal_core",
+	[RVTRACE_TIMESTAMP_MODE_SHARED] = "shared",
+};
+
+static ssize_t modes_available_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_timestamp_priv *priv;
+	enum rvtrace_timestamp_mode mode;
+	ssize_t size = 0;
+
+	comp = rvtrace_timestamp_get_source(comp);
+	if (!comp)
+		return -EINVAL;
+
+	priv = get_timestamp_priv(comp);
+
+	for (mode = RVTRACE_TIMESTAMP_MODE_NONE; mode < RVTRACE_TIMESTAMP_MODE_MAX; mode++) {
+		if (priv->mode_hw[mode])
+			size += sysfs_emit_at(buf, size, "%s ", modes_str[mode]);
+	}
+
+	size += sysfs_emit_at(buf, size, "\n");
+	return size;
+}
+static DEVICE_ATTR_RO(modes_available);
+
+static ssize_t mode_preferred_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_timestamp_priv *priv;
+
+	comp = rvtrace_timestamp_get_source(comp);
+	if (!comp)
+		return -EINVAL;
+
+	priv = get_timestamp_priv(comp);
+
+	return sysfs_emit(buf, "%s\n", modes_str[priv->mode]);
+}
+
+static ssize_t mode_preferred_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t size)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_timestamp_priv *priv;
+
+	comp = rvtrace_timestamp_get_source(comp);
+	if (!comp)
+		return -EINVAL;
+
+	priv = get_timestamp_priv(comp);
+
+	if (sysfs_streq(buf, modes_str[RVTRACE_TIMESTAMP_MODE_NONE]) &&
+			priv->mode_hw[RVTRACE_TIMESTAMP_MODE_NONE])
+		priv->mode = RVTRACE_TIMESTAMP_MODE_NONE;
+	else if (sysfs_streq(buf, modes_str[RVTRACE_TIMESTAMP_MODE_EXTERNAL]) &&
+			priv->mode_hw[RVTRACE_TIMESTAMP_MODE_EXTERNAL])
+		priv->mode = RVTRACE_TIMESTAMP_MODE_EXTERNAL;
+	else if (sysfs_streq(buf, modes_str[RVTRACE_TIMESTAMP_MODE_INTERNAL_SYSTEM]) &&
+			priv->mode_hw[RVTRACE_TIMESTAMP_MODE_INTERNAL_SYSTEM])
+		priv->mode = RVTRACE_TIMESTAMP_MODE_INTERNAL_SYSTEM;
+	else if (sysfs_streq(buf, modes_str[RVTRACE_TIMESTAMP_MODE_INTERNAL_CORE]) &&
+			priv->mode_hw[RVTRACE_TIMESTAMP_MODE_INTERNAL_CORE])
+		priv->mode = RVTRACE_TIMESTAMP_MODE_INTERNAL_CORE;
+	else if (sysfs_streq(buf, modes_str[RVTRACE_TIMESTAMP_MODE_SHARED]) &&
+			priv->mode_hw[RVTRACE_TIMESTAMP_MODE_SHARED])
+		priv->mode = RVTRACE_TIMESTAMP_MODE_SHARED;
+	else
+		return -EINVAL;
+	return size;
+}
+static DEVICE_ATTR_RW(mode_preferred);
+
+static ssize_t prescale_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_timestamp_priv *priv;
+
+	comp = rvtrace_timestamp_get_source(comp);
+	if (!comp)
+		return -EINVAL;
+
+	priv = get_timestamp_priv(comp);
+
+	return sysfs_emit(buf, "%u\n", priv->prescale);
+}
+
+static ssize_t prescale_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t size)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_timestamp_priv *priv;
+	unsigned long val;
+	int ret;
+
+	comp = rvtrace_timestamp_get_source(comp);
+	if (!comp)
+		return -EINVAL;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	if (val > RVTRACE_TIMESTAMP_PRESCALE_MAX)
+		return -EINVAL;
+
+	priv = get_timestamp_priv(comp);
+	if (!rvtrace_timestamp_is_internal(priv))
+		return -EINVAL;
+
+	priv->prescale = val;
+
+	return size;
+}
+static DEVICE_ATTR_RW(prescale);
+
+static ssize_t control_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	u32 val;
+	struct gtrace_component *comp = to_gtrace_component(dev);
+
+	comp = rvtrace_timestamp_get_source(comp);
+	if (!comp)
+		return -EINVAL;
+
+	val = gtrace_read32(comp->pdata, RVTRACE_TIMESTAMP_CTRL_OFFSET);
+
+	return sysfs_emit(buf, "0x%x\n", val);
+}
+static DEVICE_ATTR_RO(control);
+
+static struct attribute *rvtrace_timestamp_attrs[] = {
+	&dev_attr_source.attr,
+	&dev_attr_modes_available.attr,
+	&dev_attr_mode_preferred.attr,
+	&dev_attr_prescale.attr,
+	&dev_attr_control.attr,
+	NULL,
+};
+
+static umode_t timestamp_attr_is_visible(struct kobject *kobj,
+					 struct attribute *attr, int idx)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct gtrace_component *comp = to_gtrace_component(dev);
+
+	if (rvtrace_timestamp_get_source(comp))
+		return attr->mode;
+
+	return 0;
+}
+
+struct attribute_group rvtrace_timestamp_group = {
+	.attrs = rvtrace_timestamp_attrs,
+	.name = "timestamp",
+	.is_visible = timestamp_attr_is_visible,
+};
+EXPORT_SYMBOL_GPL(rvtrace_timestamp_group);
diff --git a/drivers/hwtracing/gtrace/rvtrace-timestamp.h b/drivers/hwtracing/gtrace/rvtrace-timestamp.h
new file mode 100644
index 000000000000..75924d397996
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-timestamp.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright(C) 2026 Spacemit Technologies, Inc.
+ */
+
+#ifndef __RVTRACE_TIMESTAMP_H__
+#define __RVTRACE_TIMESTAMP_H__
+
+#include <linux/types.h>
+
+#define RVTRACE_TIMESTAMP_CTRL_OFFSET		0x040
+#define RVTRACE_TIMESTAMP_COUNT_SHIFT		1
+#define RVTRACE_TIMESTAMP_MODE_MASK		GENMASK(6, 4)
+#define RVTRACE_TIMESTAMP_PRESCALE_MASK		GENMASK(9, 8)
+#define RVTRACE_TIMESTAMP_PRESCALE_MAX		3
+#define RVTRACE_TIMESTAMP_ENABLE_SHIFT		15
+#define RVTRACE_TIMESTAMP_WIDTH_MASK		GENMASK(29, 24)
+
+enum rvtrace_timestamp_mode {
+	RVTRACE_TIMESTAMP_MODE_NONE,
+	RVTRACE_TIMESTAMP_MODE_EXTERNAL,
+	RVTRACE_TIMESTAMP_MODE_INTERNAL_SYSTEM,
+	RVTRACE_TIMESTAMP_MODE_INTERNAL_CORE,
+	RVTRACE_TIMESTAMP_MODE_SHARED,
+	RVTRACE_TIMESTAMP_MODE_MAX
+};
+
+struct rvtrace_timestamp_priv {
+	bool mode_hw[RVTRACE_TIMESTAMP_MODE_MAX];
+	enum rvtrace_timestamp_mode mode;
+	u32 prescale;
+};
+
+int rvtrace_timestamp_reset(struct gtrace_platform_data *pdata);
+void rvtrace_timestamp_init(struct gtrace_platform_data *pdata,
+			    struct rvtrace_timestamp_priv *priv);
+void rvtrace_timestamp_setup(struct gtrace_platform_data *pdata,
+			     struct rvtrace_timestamp_priv *priv,
+			     struct perf_event *event,
+			     bool enable);
+
+extern struct attribute_group rvtrace_timestamp_group;
+
+#endif/* __RVTRACE_TIMESTAMP_H__ */
-- 
2.34.1

