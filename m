Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693E6486BAB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102710; cv=none; b=up9mK9vnGWgih1zTA55lHzeaTnxREj1XgtLkMYpRVLql4on6SyZ/XE3o9xT1K2FHGTPFSeh7RbW+3+xwziU56PTXW12scFm5kYFx085Rh845xcSdwVb8RqOU0krctl9Bw3KHoHEJW2VUgc9E+472fVOhxySfIK0fw+hBRCj6ODo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102710; c=relaxed/simple;
	bh=6pZSMPhpGtVh1HeRr5p/w3rxRl09Jzjmo+bfpYnGCwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AngEm2kXQooTxFO1Y4q690gH/ceJ9up0lDlEeKH9npvD5LIsK2zim9JAr2XVgCgBnDyIC0YNqLqv8CcwGTZAe7hFqJsN+ZX6COWB59jqHecf4iJrraRDoHm5K8Nv3vS/L6ob7e4kx23m077TTnwc7znoXGHwafDjcqbKNEFvsHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y5b3ZpEl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNYkdTss; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y5b3ZpEl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNYkdTss"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7eI93757231
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ODhrrCwnGw2
	W3p39B9wjCOIxv8MLy2qdSvEcpifGmbQ=; b=Y5b3ZpElzNbReDuSDEWq6GMYK25
	gvBVZV8S6bnyr8l3v/PVZo3eRM/Kfj4rSDff0EO5cprhIET8KKAvA9Gx7aVV/BaY
	5PIr2iQPW3AlFxSKiHek4e+CZqUXWUig5yhDBqpAbwfIrH41Xtri9se3+6u220Eg
	WeZ3MQcuaRVMfyB9hqOWM8Pc8DsypcSjsdRBl7Q/11dJHf1XrPo72xbFB/BRjitG
	x19Uf/nqDnJBFVYCHxvPuCjjylX/MItUOCCzVRV9ziAvzngnVpqUL92TsixiBH8o
	0G9BdoIqA7e7aVZrY4Z1wz07KgXLJ4SMnJc8ElkKgow6OburPeVa8/5DjTw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj113wdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:45:02 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c7c0d2b0aaso119328e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790102701; x=1790707501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ODhrrCwnGw2W3p39B9wjCOIxv8MLy2qdSvEcpifGmbQ=;
        b=HNYkdTssTT8Frv91RbqQjVDcRcTrH9zva8S/Mu/2/ZuQDWzJmALvR9FVYnDb0oMGk0
         bzATk+/0IwCv5K1WubBv3c4dRV/nrXb+T8hzJgSd8wWLnUhP3LTz2vlozphJvZ2+xYIC
         7voI4g2I0KL1ffHFtxx1Cg9P0juKVTHauRIkXXGifcEvt3fieU4TMRzczn1Tzm15D7e6
         ZRJZkS53gu9RpNp+rMGD/opdzXx3dR+J43TflpJibF9CvgPxxRU705bUlNZFLRQaA0Mo
         UBA5EbXBJrJj3PQSaEpzoKf+v8VNyyL1MbByvsRjLJOzmoRd8TNKfwMrdmy6pJngFD86
         PC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102701; x=1790707501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ODhrrCwnGw2W3p39B9wjCOIxv8MLy2qdSvEcpifGmbQ=;
        b=FtMhdlu6zFI+RaTvlLP1xBPr0ti7ACGgmrrt345/W9HTFNrsGuy7HawTIKOK8wXPL7
         tPRhFuvT4DGfJBU85y7PDaxA6qiwarCGwGG+FDG2cxPNLGgFbF+aEIPktzV2+Zd2jJEN
         4mI3tZoobkTF5Zn/iXOw5wpV8Np+uf10sh2sep3K2kuXmv3lhRGu6HjcPV4ml+YoTlq6
         lr1fZVuvSuO9voUMazyg2BaGeQwavXMkk2YFkt/5x9imd5L1TcdAcqxH+HuZ3hhhUspG
         d8syoEmvvOIa+45QRsTXdg4gjoDfvQi/z3f5Lg/ynvP4xpDaOjE5EQ8Ork0FtnVdQMFp
         0Dlw==
X-Forwarded-Encrypted: i=1; AKwUvBxxN081t6sFa3VTLQ4RQZ+YGBCTQ3Ncw6cENYV+59KjuJFjNDk/nhWWe5SrHx18FpGStd7w3NDoWQz26lk=@vger.kernel.org
X-Gm-Message-State: AFuF++kjysJ+5oTcPl0Yya00FkpwCzqVGRYQNKMTTlVQFXGXhgYmgpVn
	cdPBH8+3NR1SMf8+szJ4oJaJ3GfPTyzJd/arwQUALxE5JwXb75MEzCClxbKvGfUr5dyg3vq2+ng
	A8rNbwS2e9LGQuqKapUH8T3KPF5sAVQvb9emZ1yhgvHDCBCOfKjgbpMpSVVXtEnRN/Z8=
X-Gm-Gg: AYBFou0GxWWjgq1TnxHFGl6E5ih6x3PBvTEz5SG40DGN9q680mPa+cdrJnhoEAOrjid
	uRNusuRR8mKo8947G08SZ1sbSnJzrTAlM67gzreHhecWsOxGvV1HXFBVby1EscTQeWWNL6gUc7D
	4kONvO0GJijuA1Zl4uKUYsRLsuWVkTsEhEcW8vWzIaIS+bkLzhVVjwxhBQvHvJRDObbG7qgfNce
	2LhDA+cmFhCufRkKZ6oRZppVwWCU+8E3R35wkrq+gUYHb5IJ3NyxZKL/zd0zCtf7UoSEEFq0O4P
	szcq2WqZ0Pwu1ayvPGuHcKoLbY82ZF0tDTm+vwWOux8wimZnp8U1D4pWszyqrs4zvXewD1E1OsG
	xPXWetpQVAdc42wknkU37zyw8bHJPXuT5xLP4GD4QXw02rIaImDAZ65v5UDjheO4x
X-Received: by 2002:a05:6122:8c8d:b0:5c9:a60b:e5ca with SMTP id 71dfb90a1353d-5c9f1666f58mr759836e0c.13.1790102701362;
        Tue, 22 Sep 2026 11:45:01 -0700 (PDT)
X-Received: by 2002:a05:6122:8c8d:b0:5c9:a60b:e5ca with SMTP id 71dfb90a1353d-5c9f1666f58mr759819e0c.13.1790102700898;
        Tue, 22 Sep 2026 11:45:00 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm374681f8f.19.2026.09.22.11.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:45:00 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/4] clk: qcom: Add lpass audio clock controller driver for Glymur
Date: Tue, 22 Sep 2026 19:44:24 +0100
Message-ID: <20260922184425.56114-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8k-qyrsj6uvIhMvBg28gea0rgwAFqVk8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX0kTCyMEKXvjU
 mGaXxKer3OPC398OmLN7PYvlxl0pWeULjxuAv0jz/v9ZnBzBJo7kAKecWMHGseudRqYEJgMbrCM
 1I2u7I0NLyDknA0M7FZivf245uo9Fnc=
X-Proofpoint-ORIG-GUID: 8k-qyrsj6uvIhMvBg28gea0rgwAFqVk8
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab2ccae cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=7GdS1con5BCYmhUutoQA:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX8JxaqhWbg+j+
 NJSayAEft5OqfvKA+oURfU2I3WAXQkaXbNskvA/rip1UVSjQzq58R7UdtptJLssc25jctO9KfBO
 0DslEn5KOxO16g0VLX2BV05y4BLp3BetKhK1JT2XL/A3E6i5e0T9rEFhIO36ktV+al8ueAchFO4
 vg1VGNZRKHaDA0/AsxAmM7p2CfZcVZgOPRncdkn/j1yJY8XRa6hk54D+b/kSpn4I8IsupBHZJwT
 7SjPdFKzTCzlKo94pynXamhorNCqhLDf5bVw5MS2lkq0Ji4qUTy0WfCl+n8dD01YXKqOk4oUqXF
 47TOq0e9LMcpzoJw4BfuWTgesZBBVgDSo510qGANoPqco4x1MCq3Bwbop65O5Yz/RBBPeP2L2GO
 wLvL1Z6iQgJ2/Ryzly1BBckcpnMxDLCkSr275/vwMRo/0Kei0AwZ/kSCIRKTjbyLAgUW6q4576S
 7vUI5Y7czgqXBBlmx/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220275

Add support for the lpass audio clock controller found on Glymur based
devices. This would allow lpass peripheral loader drivers to control the
clocks and bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig          | 11 +++++
 drivers/clk/qcom/Makefile         |  1 +
 drivers/clk/qcom/lpasscc-glymur.c | 70 +++++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+)
 create mode 100644 drivers/clk/qcom/lpasscc-glymur.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index b3ffe1dced01..1e571c237fc1 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1253,6 +1253,17 @@ config SC_LPASSCC_8280XP
 	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
 	  controller to reset the LPASS subsystem.
 
+config SC_LPASSCC_GLYMUR
+	tristate "GLYMUR Low Power Audio Subsystem (LPASS) Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
+	help
+	  Support for the LPASS clock controller on Glymur devices.
+	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
+	  controller to reset the LPASS subsystem.  Required for the LPASS
+	  audio macros and the SoundWire compute-mode controller to leave
+	  reset on Glymur.
+
 config SC_LPASS_CORECC_7180
 	tristate "SC7180 LPASS Core Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index a6c676f68b79..c8348218b6b8 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -149,6 +149,7 @@ obj-$(CONFIG_SC_LPASSCC_7280) += lpasscc-sc7280.o
 obj-$(CONFIG_SC_LPASSCC_8280XP) += lpasscc-sc8280xp.o
 obj-$(CONFIG_SC_LPASS_CORECC_7180) += lpasscorecc-sc7180.o
 obj-$(CONFIG_SC_LPASS_CORECC_7280) += lpasscorecc-sc7280.o lpassaudiocc-sc7280.o
+obj-$(CONFIG_SC_LPASSCC_GLYMUR) += lpasscc-glymur.o
 obj-$(CONFIG_SC_VIDEOCC_7180) += videocc-sc7180.o
 obj-$(CONFIG_SC_VIDEOCC_7280) += videocc-sc7280.o
 obj-$(CONFIG_SDM_CAMCC_845) += camcc-sdm845.o
diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc-glymur.c
new file mode 100644
index 000000000000..97fc099983b6
--- /dev/null
+++ b/drivers/clk/qcom/lpasscc-glymur.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,glymur-lpasscc.h>
+
+#include "common.h"
+#include "reset.h"
+
+static const struct qcom_reset_map lpass_audiocc_glymur_resets[] = {
+	[LPASS_AUDIO_SWR_RX_CGCR] = { 0xA0, 1 },
+	[LPASS_AUDIO_SWR_WSA1_CGCR] = { 0xB0, 1 },
+	[LPASS_AUDIO_SWR_WSA2_CGCR] = { 0xD8, 1 },
+	[LPASS_AUDIO_SWR_WSA3_CGCR] = { 0x300C, 1 },
+	[LPASS_AUDIO_SWR_WSA4_CGCR] = { 0x301C, 1 },
+};
+
+static const struct regmap_config lpass_audiocc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.name = "lpass-audio-csr",
+	.max_register = 0x1000,
+};
+
+static const struct qcom_cc_desc lpass_audiocc_glymur_reset_desc = {
+	.config = &lpass_audiocc_glymur_regmap_config,
+	.resets = lpass_audiocc_glymur_resets,
+	.num_resets = ARRAY_SIZE(lpass_audiocc_glymur_resets),
+};
+
+static const struct of_device_id lpasscc_glymur_match_table[] = {
+	{
+		.compatible = "qcom,glymur-lpassaudiocc",
+		.data = &lpass_audiocc_glymur_reset_desc,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpasscc_glymur_match_table);
+
+static int lpasscc_glymur_probe(struct platform_device *pdev)
+{
+	const struct qcom_cc_desc *desc = of_device_get_match_data(&pdev->dev);
+
+	return qcom_cc_probe_by_index(pdev, 0, desc);
+}
+
+static struct platform_driver lpasscc_glymur_driver = {
+	.probe = lpasscc_glymur_probe,
+	.driver = {
+		.name = "lpasscc-glymur",
+		.of_match_table = lpasscc_glymur_match_table,
+	},
+};
+
+module_platform_driver(lpasscc_glymur_driver);
+
+MODULE_AUTHOR("Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>");
+MODULE_DESCRIPTION("QTI LPASSCC Glymur Driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

