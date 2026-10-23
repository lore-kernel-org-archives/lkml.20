Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725372;
	b=xadYzLy7euFY3iYALFVuvaaqJMg5E4eaPd2Ful92HG+FiQnICNnyYogeo1weaq6g5oV3
	 hwIb3CR0gMHlBveqfZbypiIDLMZDdD4H9Zy7mFWqkkIkfkBQeYIIaV5DwDIk88psIhc60
	 NiUI5Y87OBPDPN2nenD4UQdhiEKvW4bLgffqXPeny1CnGuj4/Ac8H4ULE6GeSD4lkZd/F
	 bcsk07XXno8or8sTY6WtpEZ3Myvbn70Y6WXL1L5dKlz/+eyLwYnTPPE8/Y3waoz/5g6DH
	 C4cdrGk+jDLEhqCkWLXiXJxBmzkTQX/qnP4TX3WouxuD81w2Y6gSI0IV3hlD1xzLKMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725372;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=ycInvx1qy9e2Ou+CC/55gtU6rXfr+tHoZssJUfTsh4s=;
	b=rK6HuMB59Z0Mwso4eH2AFtPL8qamMYeQVyYD/WYx5RaiEmFCTE+45KThPI1EkmKr7I3A
	 ip8Fxs0z6A2BjL4KvmEUd/5yjfSM6/P2/ukc9oO4//AzeHRBFvR7Js0GZNpFNoYwqr1Vj
	 aw+0Jabv7cVRW+/bTGpGwPVFaqbOxV7mK0recYwzcnuTdrT7hzMKmdGVcFWWsa8n44YYs
	 EM01MOKMwIXHYqq4a7wcr9aaP7/K3xYRKk0ch0usY2P12yVrG/xH9nBhlGjNUnn0R4Owu
	 FxbyxN9KXpyZ9E+hqiRvmxPxv+wI9b5rECfnP3aeFXFIWT+BPYr+Pnow2Awy7lMyB6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=uvQ5PCED;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A2E606A323
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50A2E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=uvQ5PCED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725330;
	bh=ycInvx1qy9e2Ou+CC/55gtU6rXfr+tHoZssJUfTsh4s=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=uvQ5PCEDfK9+rmpJeYs6bvO3cXM4xnmJpagBNCwSMLbZQrI4d5wyWWcTQtyCUR3bb
	 04/A+LXLG8pRTWP1V44XOYctvoD2T8jwXHRXeRViN5GppHtmKu+Q9MCtIhFUNHEArF
	 c/hovYzhJVf0fnOJrBS+DMajlHQ+aXioCe5s3VWk=
X-QQ-mid: esmtpsz11t1792725325tcd4064c9
X-QQ-Originating-IP: ZUJ/9HzdDMZhP4cT6tmKa8YcwHzj6gLVQbvEb3UPIVk=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6095290627579753242
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
Subject: [PATCH 04/24] gtrace: Add RISC-V trace encoder sysfs support
Date: Fri, 23 Oct 2026 11:14:45 +0800
Message-Id: <20261023031505.2020925-5-liangzhen@linux.spacemit.com>
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
X-QQ-XMAILINFO: OZwhTftM2aBYMwPKOdSlf7gwBgDW649j56j8Ad7nyN/qJ800E0pK14XC
	MLuavakuaWe3Cru2roZ5DxHFWyrTHudMMS/r0tvLv6C0IwrJ1nSCWFipVKFmYFJZ14lxmfn
	WAOJ5/wJFvozIiBwjsGNsFeZn5LNKX1W5vjzCGOfDkccrIWYX19LcNtbcjUo11L/i/tVRAA
	vSgx19PTUA2D/Q5jMMSaHrUT+bSWCOkrWXuALy1Jbim6V3svw3am/AgMf7b4K1e4NkISu1R
	2cQ82mbs1RFu8Xh/+TlmQDcShGiGpdYpuxHFRUHRzesIjD9dkTO8joxgCK2EcPVub97dezD
	2UEB7fwBAFy4E+i0ZmDOOcXtD2IpUoIaJNbWe560XCPen9IpME03fhPBEIg2+0pw/toPifh
	V1Lnefpoua1o9tyLS1ysVpKYwFNO1+cgh8W9Fyy+xmFoBuQyu9XSFU8Yd2OgV+1jWGLUzxh
	ZM5Bp0RMrQQyp7yJ12ggMvN/k65X6rSZ2J9fqrV77qhnWVKRzcaIGv6qCusrB8h5VWqIhL5
	AHXMPmBXHOIYoATugMWAMBlauvyvZvNlcUm735g0gGyMu4OzPkbm4PCkxPMRtgfvte9FYHd
	k6E214DeSLRI+i75aWfkg36C0KdSUJmYUQxfoVs+ZpVUBZr1PCg3uRk0wO19m6q2xYW4rlj
	Ok8qX9gG0JEeIZFIycqxGtq+nIKlrEirw16TiRgn1N4zLg3Rfvcn3MtcA7tZPPpr1ee/dTb
	iJ6uCv/vfHQetNafWktY+jvB4tEAnJzRg2AZ+p01EADM2aAUlWb8aT6gGT4Q8yhHmweZpcm
	TfEV8HzaUdJZnuPhXRK5OlGrYrDzoGDuHRtVg2GthA5gXr/NPw+WpIjI1TaM97sutKTpyGK
	5MaKT+FsALFCvTI/WDFdpQCAtiqGYxXsQzzYgq7inf4BFtCxYopFXvzFC5UtNgvlaLd9yGy
	5gkDMpjBudroHiXxbgIA1KoqOno3hIcD73J5AJ4T2aMCl2eQDUr1UoxgeXEAY7ecvdokD//
	hpGpBqW+kWj+RSdF23MowLt3gN+K3d9myfw3DGxd4OfW2p6xtte+NPxXL8CVfVEWCsE4BLj
	SwctcxqwdaHIFRns7AVHKv1HOAj5FbI6A==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

Add sysfs attribute support for RISC-V trace encoder components in
the platform driver. The encoder attribute groups are now assigned to
pdata->groups based on component type during registration, enabling
encoder configuration through sysfs interfaces.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/Makefile             |   1 +
 ...trace-encoder.c => rvtrace-encoder-core.c} | 117 +++++--
 .../hwtracing/gtrace/rvtrace-encoder-sysfs.c  | 290 ++++++++++++++++++
 drivers/hwtracing/gtrace/rvtrace-encoder.h    |  53 ++++
 drivers/hwtracing/gtrace/rvtrace-platform.c   |   8 +
 drivers/hwtracing/gtrace/rvtrace.h            |   3 +
 6 files changed, 438 insertions(+), 34 deletions(-)
 rename drivers/hwtracing/gtrace/{rvtrace-encoder.c => rvtrace-encoder-core.c} (60%)
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-encoder-sysfs.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-encoder.h

diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index ff79a49bdb5e..87cb5add78d4 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -6,4 +6,5 @@ gtrace-$(CONFIG_OF) += gtrace-of.o
 
 obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
+rvtrace-encoder-y := rvtrace-encoder-core.o rvtrace-encoder-sysfs.o
 obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder.c b/drivers/hwtracing/gtrace/rvtrace-encoder-core.c
similarity index 60%
rename from drivers/hwtracing/gtrace/rvtrace-encoder.c
rename to drivers/hwtracing/gtrace/rvtrace-encoder-core.c
index f24780b1ca1e..01925ebdfbde 100644
--- a/drivers/hwtracing/gtrace/rvtrace-encoder.c
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder-core.c
@@ -10,28 +10,13 @@
 #include <linux/minmax.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/bitfield.h>
 #include "rvtrace.h"
+#include "rvtrace-encoder.h"
 
-#define RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT	2
-#define RVTRACE_COMPONENT_CTRL_INSTMODE_MASK	0x7
-#define RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT	4
-#define RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT	0x6
-#define RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT	15
-#define RVTRACE_COMPONENT_CTRL_FORMAT_MASK	0x7
-#define RVTRACE_COMPONENT_CTRL_FORMAT_SHIFT	24
-#define RVTRACE_COMPONENT_CTRL_FORMAT_ETRACE	0x0
-#define RVTRACE_COMPONENT_CTRL_FORMAT_NTRACE	0x1
-
-#define RVTRACE_ENCODER_INSTFEAT_OFFSET		0x8
-#define RVTRACE_ENCODER_INSTFEAT_SRCID_MASK	0xfff
-#define RVTRACE_ENCODER_INSTFEAT_SRCID_SHIFT	16
-#define RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK	0xf
-#define RVTRACE_ENCODER_INSTFEAT_SRCBITS_SHIFT	28
-#define RVTRACE_ENCODER_INSTFEAT_SRCBITS_MAX	12
-
-struct rvtrace_encoder_priv {
-	u32 srcbits;
-};
+static int boot_enable;
+module_param(boot_enable, int, 0444);
+MODULE_PARM_DESC(boot_enable, "Enable tracing on boot");
 
 /*
  * Set the srcid and clear trTeInhibitSrc bit so that the emitted trace messages carry
@@ -42,10 +27,10 @@ static void rvtrace_encoder_set_srcid(struct gtrace_platform_data *pdata, u32 sr
 	u32 val;
 
 	val = gtrace_read32(pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
-	val &= ~(RVTRACE_ENCODER_INSTFEAT_SRCID_MASK << RVTRACE_ENCODER_INSTFEAT_SRCID_SHIFT);
-	val &= ~(RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK << RVTRACE_ENCODER_INSTFEAT_SRCBITS_SHIFT);
-	val |= pdata->bound_cpu << RVTRACE_ENCODER_INSTFEAT_SRCID_SHIFT;
-	val |= srcbits << RVTRACE_ENCODER_INSTFEAT_SRCBITS_SHIFT;
+	val &= ~RVTRACE_ENCODER_INSTFEAT_SRCID_MASK;
+	val &= ~RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK;
+	val |= FIELD_PREP(RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK, srcbits);
+	val |= FIELD_PREP(RVTRACE_ENCODER_INSTFEAT_SRCID_MASK, pdata->bound_cpu);
 	gtrace_write32(pdata, val, RVTRACE_ENCODER_INSTFEAT_OFFSET);
 
 	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
@@ -53,11 +38,32 @@ static void rvtrace_encoder_set_srcid(struct gtrace_platform_data *pdata, u32 sr
 	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
 }
 
+static void rvtrace_encoder_get_syncmode_hw(struct gtrace_platform_data *pdata,
+					    bool *syncmode_hw)
+{
+	u32 ctrl, val;
+	enum rvtrace_encoder_syncmode mode;
+
+	ctrl = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+
+	for (mode = RVTRACE_ENCODER_SYNCMODE_OFF; mode < RVTRACE_ENCODER_SYNCMODE_MAX; mode++) {
+		val = ctrl & ~RVTRACE_COMPONENT_CTRL_SYNCMODE_MASK;
+		val |= FIELD_PREP(RVTRACE_COMPONENT_CTRL_SYNCMODE_MASK, mode);
+		gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+		val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+		val = FIELD_GET(RVTRACE_COMPONENT_CTRL_SYNCMODE_MASK, val);
+		syncmode_hw[mode] = (mode == val);
+	}
+
+	gtrace_write32(pdata, ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
+}
+
 static int rvtrace_encoder_probe(struct gtrace_component *comp)
 {
 	struct gtrace_platform_data *pdata = comp->pdata;
 	struct rvtrace_encoder_priv *priv;
 	u32 val, hw_srcbits, srcbits;
+	int ret;
 
 	if (pdata->bound_cpu < 0) {
 		dev_err(&comp->dev, "cpu property missing. Please fix firmware.\n");
@@ -68,6 +74,28 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 	if (!priv)
 		return -ENOMEM;
 
+	/* Get trTeFormat */
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	priv->format = FIELD_GET(RVTRACE_COMPONENT_CTRL_FORMAT_MASK, val);
+	if (priv->format > GTRACE_FORMAT_NTRACE) {
+		dev_err(&comp->dev, "unsupported trace format %d\n", priv->format);
+		return -EINVAL;
+	}
+
+	/* Get trTeInstSyncMode */
+	priv->syncmode = FIELD_GET(RVTRACE_COMPONENT_CTRL_SYNCMODE_MASK, val);
+	rvtrace_encoder_get_syncmode_hw(pdata, priv->syncmode_hw);
+
+	/* Check if trTeContext is hardwired to 0 */
+	val |= BIT(RVTRACE_COMPONENT_CTRL_CONTEXT_SHIFT);
+	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+	if (val & BIT(RVTRACE_COMPONENT_CTRL_CONTEXT_SHIFT)) {
+		priv->has_context = true;
+		val &= ~BIT(RVTRACE_COMPONENT_CTRL_CONTEXT_SHIFT);
+		gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+	}
+
 	/* Check if trTeInhibitSrc is hardwired to 1 */
 	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
 	val &= ~BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
@@ -76,14 +104,16 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 	if (!(val & BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT))) {
 		/* Probe how many bits can trTeSrcID span in the emitted Trace messages */
 		val = gtrace_read32(pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
-		val |= (RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK <<
-			RVTRACE_ENCODER_INSTFEAT_SRCBITS_SHIFT);
-		gtrace_write32(pdata, val, RVTRACE_ENCODER_INSTFEAT_OFFSET);
-		val = gtrace_read32(pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
-		hw_srcbits = (val >> RVTRACE_ENCODER_INSTFEAT_SRCBITS_SHIFT) &
-			     RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK;
+		hw_srcbits = RVTRACE_ENCODER_INSTFEAT_SRCBITS_MAX;
+		do {
+			val &= ~RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK;
+			val |= FIELD_PREP(RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK, hw_srcbits);
+			gtrace_write32(pdata, val, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+			val = gtrace_read32(pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
+			if (FIELD_GET(RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK, val) == hw_srcbits)
+				break;
+		} while (--hw_srcbits);
 		/* Determine if there are sufficient bits to hold max cpus */
-		hw_srcbits = min_t(u32, hw_srcbits, RVTRACE_ENCODER_INSTFEAT_SRCBITS_MAX);
 		srcbits = min_t(u32, hw_srcbits, order_base_2(nr_cpu_ids));
 		if (srcbits && pdata->bound_cpu < BIT(srcbits)) {
 			rvtrace_encoder_set_srcid(pdata, srcbits);
@@ -98,6 +128,15 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 		gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
 	}
 	dev_set_drvdata(&comp->dev, priv);
+
+	if (boot_enable) {
+		ret = gtrace_enable_sysfs(comp);
+		if (ret) {
+			dev_err(&comp->dev, "failed to enable tracing on boot.\n");
+			return -EINVAL;
+		}
+		priv->boot_enable = true;
+	}
 	return 0;
 }
 
@@ -117,10 +156,20 @@ static int rvtrace_encoder_start(struct gtrace_component *comp)
 		return ret;
 	}
 
-	/* set mode */
 	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
-	val &= ~(RVTRACE_COMPONENT_CTRL_INSTMODE_MASK << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
-	val |= (RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
+	/* set mode */
+	val &= ~RVTRACE_COMPONENT_CTRL_INSTMODE_MASK;
+	val |= FIELD_PREP(RVTRACE_COMPONENT_CTRL_INSTMODE_MASK,
+		RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT);
+	/* set context */
+	val &= ~BIT(RVTRACE_COMPONENT_CTRL_CONTEXT_SHIFT);
+	val |= FIELD_PREP(BIT(RVTRACE_COMPONENT_CTRL_CONTEXT_SHIFT), !!priv->context);
+	/* set syncmode */
+	val &= ~RVTRACE_COMPONENT_CTRL_SYNCMODE_MASK;
+	val |= FIELD_PREP(RVTRACE_COMPONENT_CTRL_SYNCMODE_MASK, priv->syncmode);
+	/* set syncmax */
+	val &= ~RVTRACE_COMPONENT_CTRL_SYNCMAX_MASK;
+	val |= FIELD_PREP(RVTRACE_COMPONENT_CTRL_SYNCMAX_MASK, priv->syncmax);
 	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
 
 	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder-sysfs.c b/drivers/hwtracing/gtrace/rvtrace-encoder-sysfs.c
new file mode 100644
index 000000000000..e973d0e43036
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder-sysfs.c
@@ -0,0 +1,290 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/gtrace.h>
+#include <linux/types.h>
+#include "rvtrace.h"
+#include "rvtrace-encoder.h"
+
+struct rvtrace_component_reg {
+	struct gtrace_component *comp;
+	u32 offset;
+	u32 data;
+};
+
+static void do_smp_cross_read(void *data)
+{
+	struct rvtrace_component_reg *reg = data;
+
+	reg->data = gtrace_relaxed_read32(reg->comp->pdata, reg->offset);
+}
+
+static u32 rvtrace_cross_read(struct gtrace_component *comp, u32 offset)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct rvtrace_component_reg reg;
+
+	reg.comp = comp;
+	reg.offset = offset;
+	/*
+	 * smp cross call ensures the CPU will be powered up before
+	 * accessing the RISC-V trace core registers
+	 */
+	smp_call_function_single(pdata->bound_cpu, do_smp_cross_read, &reg, 1);
+	return reg.data;
+}
+
+static u32 rvtrace_attr_to_offset(struct device_attribute *attr)
+{
+	struct dev_ext_attribute *eattr;
+
+	eattr = container_of(attr, struct dev_ext_attribute, attr);
+	return (u32)(unsigned long)eattr->var;
+}
+
+static ssize_t rvtrace_reg_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	u32 val, offset;
+	struct gtrace_component *comp = to_gtrace_component(dev);
+
+	offset = rvtrace_attr_to_offset(attr);
+
+	val = rvtrace_cross_read(comp, offset);
+
+	return scnprintf(buf, PAGE_SIZE, "0x%x\n", val);
+}
+
+/*
+ * Macro to set an RO ext attribute with offset and show function.
+ */
+#define rvtrace_reg_showfn(name, offset, showfn) (	    \
+	&((struct dev_ext_attribute[]) {		    \
+	   {						    \
+		__ATTR(name, 0444, showfn, NULL),	    \
+		(void *)(unsigned long)offset		    \
+	   }						    \
+	})[0].attr.attr					    \
+	)
+
+/* macro using the default rvtrace_reg_show function */
+#define rvtrace_reg(name, offset)	\
+	rvtrace_reg_showfn(name, offset, rvtrace_reg_show)
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
+static struct attribute *rvtrace_encoder_attrs[] = {
+	&dev_attr_cpu.attr,
+	NULL,
+};
+
+static struct attribute *rvtrace_encoder_mgmt_attrs[] = {
+	rvtrace_reg(control, RVTRACE_COMPONENT_CTRL_OFFSET),
+	rvtrace_reg(features, RVTRACE_ENCODER_INSTFEAT_OFFSET),
+	NULL,
+};
+
+static ssize_t format_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+
+	return sysfs_emit(buf, "%u\n", priv->format);
+}
+static DEVICE_ATTR_RO(format);
+
+static ssize_t has_context_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+
+	return sysfs_emit(buf, "%u\n", priv->has_context);
+}
+static DEVICE_ATTR_RO(has_context);
+
+static ssize_t context_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+
+	return sysfs_emit(buf, "%u\n", priv->context);
+}
+
+static ssize_t context_store(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t size)
+{
+	int ret;
+	unsigned long val;
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+
+	if (!priv->has_context)
+		return -EINVAL;
+
+	ret = kstrtoul(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	priv->context = !!val;
+
+	return size;
+}
+static DEVICE_ATTR_RW(context);
+
+static const char *const syncmodes_str[] = {
+	[RVTRACE_ENCODER_SYNCMODE_OFF]		= "off",
+	[RVTRACE_ENCODER_SYNCMODE_MESSAGES]	= "messages",
+	[RVTRACE_ENCODER_SYNCMODE_CLOCK]	= "clock",
+	[RVTRACE_ENCODER_SYNCMODE_INSTRUCTION]	= "instruction",
+};
+
+static ssize_t syncmodes_available_show(struct device *dev,
+					struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+	ssize_t size = 0;
+	enum rvtrace_encoder_syncmode mode;
+
+	for (mode = RVTRACE_ENCODER_SYNCMODE_OFF; mode < RVTRACE_ENCODER_SYNCMODE_MAX; mode++) {
+		if (priv->syncmode_hw[mode])
+			size += sysfs_emit_at(buf, size, "%s ",
+				syncmodes_str[mode]);
+	}
+
+	size += sysfs_emit_at(buf, size, "\n");
+	return size;
+}
+static DEVICE_ATTR_RO(syncmodes_available);
+
+static ssize_t syncmode_preferred_show(struct device *dev,
+				       struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+
+	return sysfs_emit(buf, "%s\n", syncmodes_str[priv->syncmode]);
+}
+
+static ssize_t syncmode_preferred_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t size)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+
+	if (sysfs_streq(buf, syncmodes_str[RVTRACE_ENCODER_SYNCMODE_OFF]) &&
+			priv->syncmode_hw[RVTRACE_ENCODER_SYNCMODE_OFF])
+		priv->syncmode = RVTRACE_ENCODER_SYNCMODE_OFF;
+	else if (sysfs_streq(buf, syncmodes_str[RVTRACE_ENCODER_SYNCMODE_MESSAGES]) &&
+			priv->syncmode_hw[RVTRACE_ENCODER_SYNCMODE_MESSAGES])
+		priv->syncmode = RVTRACE_ENCODER_SYNCMODE_MESSAGES;
+	else if (sysfs_streq(buf, syncmodes_str[RVTRACE_ENCODER_SYNCMODE_CLOCK]) &&
+			priv->syncmode_hw[RVTRACE_ENCODER_SYNCMODE_CLOCK])
+		priv->syncmode = RVTRACE_ENCODER_SYNCMODE_CLOCK;
+	else if (sysfs_streq(buf, syncmodes_str[RVTRACE_ENCODER_SYNCMODE_INSTRUCTION]) &&
+			priv->syncmode_hw[RVTRACE_ENCODER_SYNCMODE_INSTRUCTION])
+		priv->syncmode = RVTRACE_ENCODER_SYNCMODE_INSTRUCTION;
+	else
+		return -EINVAL;
+	return size;
+}
+static DEVICE_ATTR_RW(syncmode_preferred);
+
+static ssize_t syncmax_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+
+	return sysfs_emit(buf, "%u\n", priv->syncmax);
+}
+
+static ssize_t syncmax_store(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t size)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	if (val > RVTRACE_COMPONENT_CTRL_SYNCMAX_MAX)
+		return -EINVAL;
+
+	priv->syncmax = val;
+	return size;
+}
+static DEVICE_ATTR_RW(syncmax);
+
+static struct attribute *rvtrace_encoder_control_attrs[] = {
+	&dev_attr_format.attr,
+	&dev_attr_has_context.attr,
+	&dev_attr_context.attr,
+	&dev_attr_syncmodes_available.attr,
+	&dev_attr_syncmode_preferred.attr,
+	&dev_attr_syncmax.attr,
+	NULL,
+};
+
+static ssize_t srcbits_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+
+	return sysfs_emit(buf, "%u\n", priv->srcbits);
+}
+static DEVICE_ATTR_RO(srcbits);
+
+static struct attribute *rvtrace_encoder_features_attrs[] = {
+	&dev_attr_srcbits.attr,
+	NULL,
+};
+
+static const struct attribute_group rvtrace_encoder_group = {
+	.attrs = rvtrace_encoder_attrs,
+};
+
+static const struct attribute_group rvtrace_encoder_mgmt_group = {
+	.attrs = rvtrace_encoder_mgmt_attrs,
+	.name = "mgmt",
+};
+
+static const struct attribute_group rvtrace_encoder_control_group = {
+	.attrs = rvtrace_encoder_control_attrs,
+	.name = "control",
+};
+
+static const struct attribute_group rvtrace_encoder_features_group = {
+	.attrs = rvtrace_encoder_features_attrs,
+	.name = "features",
+};
+
+const struct attribute_group *rvtrace_encoder_groups[] = {
+	&rvtrace_encoder_group,
+	&rvtrace_encoder_mgmt_group,
+	&rvtrace_encoder_control_group,
+	&rvtrace_encoder_features_group,
+	NULL,
+};
+EXPORT_SYMBOL_GPL(rvtrace_encoder_groups);
diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder.h b/drivers/hwtracing/gtrace/rvtrace-encoder.h
new file mode 100644
index 000000000000..733d44c0e641
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __RVTRACE_ENCODER_H__
+#define __RVTRACE_ENCODER_H__
+
+#define RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT     2
+#define RVTRACE_COMPONENT_CTRL_INSTMODE_MASK	GENMASK(6, 4)
+#define RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT	0x6
+#define RVTRACE_COMPONENT_CTRL_CONTEXT_SHIFT	9
+#define RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT	15
+#define RVTRACE_COMPONENT_CTRL_SYNCMODE_MASK	GENMASK(17, 16)
+#define RVTRACE_COMPONENT_CTRL_SYNCMAX_MASK	GENMASK(23, 20)
+#define RVTRACE_COMPONENT_CTRL_SYNCMAX_MAX	15
+#define RVTRACE_COMPONENT_CTRL_FORMAT_MASK	GENMASK(26, 24)
+#define RVTRACE_COMPONENT_CTRL_FORMAT_ETRACE	0x0
+#define RVTRACE_COMPONENT_CTRL_FORMAT_NTRACE	0x1
+
+#define RVTRACE_ENCODER_INSTFEAT_OFFSET		0x8
+#define RVTRACE_ENCODER_INSTFEAT_SRCID_MASK	GENMASK(27, 16)
+#define RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK	GENMASK(31, 28)
+#define RVTRACE_ENCODER_INSTFEAT_SRCBITS_MAX	12
+
+enum rvtrace_encoder_syncmode {
+	RVTRACE_ENCODER_SYNCMODE_OFF,
+	RVTRACE_ENCODER_SYNCMODE_MESSAGES,
+	RVTRACE_ENCODER_SYNCMODE_CLOCK,
+	RVTRACE_ENCODER_SYNCMODE_INSTRUCTION,
+	RVTRACE_ENCODER_SYNCMODE_MAX,
+};
+
+/**
+ * struct rvtrace_encoder_priv - Private driver data for the rvtrace encoder.
+ * @syncmode_hw: Hardware capability for synchronization modes.
+ * @syncmode:    Current operational synchronization mode configured in hardware.
+ * @syncmax:     Maximum interval value allowed for synchronization.
+ * @srcbits:     Width of source bits allocated for trace generation.
+ * @format:      Trace format type used by this encoder compinent.
+ * @has_context: Hardware flag for scontext/mcontext and privilege tracking.
+ * @context:     Current configuration for scontext/mcontext and privilege tracking.
+ * @boot_enable: Flag to automatically enable tracing on boot.
+ */
+struct rvtrace_encoder_priv {
+	bool syncmode_hw[RVTRACE_ENCODER_SYNCMODE_MAX];
+	u32 syncmode;
+	u32 syncmax;
+	u32 srcbits;
+	enum gtrace_format format;
+	bool has_context;
+	bool context;
+	bool boot_enable;
+};
+
+#endif/* __RVTRACE_ENCODER_H__ */
diff --git a/drivers/hwtracing/gtrace/rvtrace-platform.c b/drivers/hwtracing/gtrace/rvtrace-platform.c
index e5c1f47388a2..64496a638359 100644
--- a/drivers/hwtracing/gtrace/rvtrace-platform.c
+++ b/drivers/hwtracing/gtrace/rvtrace-platform.c
@@ -129,6 +129,14 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	id.type = gtype;
 	id.version = rvtrace_component_mkversion(major, minor);
 
+	switch (gtype) {
+	case GTRACE_RVTRACE_ENCODER:
+		pdata->groups = rvtrace_encoder_groups;
+		break;
+	default:
+		pdata->groups = NULL;
+	}
+
 	comp = gtrace_register_component(&id, rvtrace_type_name(gtype), pdata);
 	if (IS_ERR(comp))
 		return PTR_ERR(comp);
diff --git a/drivers/hwtracing/gtrace/rvtrace.h b/drivers/hwtracing/gtrace/rvtrace.h
index e6be1ce303cc..fee8e2e4f42a 100644
--- a/drivers/hwtracing/gtrace/rvtrace.h
+++ b/drivers/hwtracing/gtrace/rvtrace.h
@@ -118,4 +118,7 @@ static inline int rvtrace_comp_poll_empty(struct gtrace_component *comp)
 
 extern const struct gtrace_hw_ops rvtrace_hw_ops;
 
+/* Sysfs attribute groups for RISC-V trace components */
+extern const struct attribute_group *rvtrace_encoder_groups[];
+
 #endif /* __LINUX_RVTRACE_H__ */
-- 
2.34.1

