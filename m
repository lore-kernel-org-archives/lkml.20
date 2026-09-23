Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1397A569F13
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191334; cv=none; b=MYucEFrsmG/xsKY/ZWWGlxvi5v/jdAdSrJBwzD3OYW4xXSWBWM47jt/23RiqP7/51YMtsydbRNNRV7m5Oh0Hepm+ESHgcldkwwX97v4DH6csdlunYsiQmgXEU/iaEdQn15szv9hVdkUrfIhoxCE9xspBIRVVK2SmjMKDOQr2LKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191334; c=relaxed/simple;
	bh=sX+E+Anyu8CFs2952xi4vwpxNCngY7cIPMCPNrSrZqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UHzLCvDIEYGvQD86dw2fiPz9D4mm649aruldizeLbAbxtYb0BlrrtBrmojtCZPIqLTAsGCAQDaAmAAxK9Tgzk/9Qw1lgSxk9g6EnVJWopeF3t2BC6lBTAct84PiXys0AWZQ92u28AUcDe8JmG0mMQqogkp8jGMcL1MYE6i+I118=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFrgp7BH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IpezUcx5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFrgp7BH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IpezUcx5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTrAe596174
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EcvKdqD2Z99ZaO0jUIMo/vHNRZMwTcapU92eW9YWlJU=; b=IFrgp7BHSVZCRsR2
	ein3thYHgBG6N4JyBPjE5YmwhkankKZ1MuOUlU7IDnbsPCztaZvBRHUO5H30knwR
	veLpntXhJscufnP2+DaRPgA+CtICquYrIkD1Lw3Pf8T+sWoj67j1BBN16Q8h7u+7
	G21yEL83UQdMg0JHW9AjRrus6Fc1TWwGe3JSkxkYqG5fdVH34SV2aEOHKzPH3B1Z
	l6qLcgkTRGgwYp5tOUT7ktLZEe3UGqCitT+KiRe1bzOBvV4tiizVzZnABqdlFbf+
	TEscMynH6OtLnSkh94GWuwxEPMw2HFCzJTOrVPVeROC9UoCR7gHy9aOoX20TE+B0
	CqO0ag==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxsmrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:22:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3286d2bac04so1495200eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790191322; x=1790796122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EcvKdqD2Z99ZaO0jUIMo/vHNRZMwTcapU92eW9YWlJU=;
        b=IpezUcx5GUxUfwgZyzccUbr16sebf4yayuYZWSBIeVCgmSTbKUfCBAPy3JAQ4Phn5v
         I24Meq29Nc2Sq6SYXU/3vPUTwRA9zl+Cwu3ve1OAC1CffhFtPmpF8ntEw8Ib3ul1hPtq
         zkpdC+G6Rig/8tddP8MDeL5vVJV9JC4ot9MgPrMSi2eV++zEhL4WY/WLlPwUDLtQ1Xhm
         aH6KsQPUNv4cDSUrxsKGkHZOpwWTc+fJtEksJ8OY9XTTbD4fsUA0Ny63lf5RtQseuK6y
         xX/nBtCtkTCWopfR3J6dFgvVs+Lgg9IqlXxYkPa9OlSxyjzyZDj4mj24paDk6w6EzIqT
         i/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790191322; x=1790796122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EcvKdqD2Z99ZaO0jUIMo/vHNRZMwTcapU92eW9YWlJU=;
        b=LwcL49h0znd0kJc8V8AuLjX5vjZnkkrG+IrWMBGPn3SYzbURty0Kyr14eLD6mqQHv5
         BYk5HX6xJYMs/W+mtczU9d8WioZ3XStu0aERnsHOamxzCxYCjNRM82maTCsKKt3Ir4yN
         cOfKEYg5nbQVD0/+zZxGlIcFCp/xqsU3Ausx3GAtRPrIfVPQQOKpMn8b13w4KgVVVg+2
         y3F0jQ1Izjvj4l/3G22qHtklrCeer/w1VE1b3PpY+jOLAm1O/3WI272y2gQ2ANnXTdLt
         ZX6+++Ba1tb9k232l3JXI18vXI/fsLXz/RA3p0qTIA9a5tJjAeoxPkMLYY2gj4ydRpYF
         n5Pw==
X-Forwarded-Encrypted: i=1; AKwUvBweNnSJYzLaLQRvDufVEKvEFbDQoEqlZu7JhlVGAyEq8X+2sOJVa6ss+NOmwoNsgZ+nsbk5h7iKDrQEtho=@vger.kernel.org
X-Gm-Message-State: AFuF++mkEFW2JGDTnnu4TQGem+KFhb0yvE7FEXrtXdXmWbM0G1+0YLXL
	PTH2DG0I0h1RbF5Zid1yV4h5cdw/meO9RANTnWrPslj8QtBQllOl9T+dm/7YuAGkVyF3Z0/GtqY
	VuK1LOPUINgDYjg4+ApcTRrdZRdW/3cZrDBjq0hu+bWqMz+tWNH8EK7Soo0RCQ29+bEQ=
X-Gm-Gg: AYBFou0hd6kJMhlo2gUAmXkBBO+H1qAPsIMu5hVMbx3sP3RK2pEuWC+oj3ydWxF6F0y
	L6Zerc/wOBSs722Hf1q8yUPFJ/7dyOBhmAnppryDoPM/7gOBwrSbthJKbfQHacucScpl3ue0mzX
	/2hWNZsL8+UNYVtR62pMdyyHUXLa7vvd5rtRreI7Ieid14KYvpXCj3Sh6uFrVwX18R7SRGLyCJO
	sD1MPK5DOcWkQ7gBN6WYszrr86lFPdp0NsEMjQyDCvPY8TSUxynj4YVnsHmIcbwx4ta3ue4KFH3
	5vBTLPyiVA/O9atsAJ6Gth99aRZKnr1S7vvg+akHNB/go2VTP0IsQJB+cPTvFv73jYh/KyEA+5G
	UVJLIvDWLKjMERBqwo2mT+GQ=
X-Received: by 2002:a05:693c:66cd:20b0:33b:d8b2:8fba with SMTP id 5a478bee46e88-34002be4d40mr106581eec.7.1790191321103;
        Wed, 23 Sep 2026 12:22:01 -0700 (PDT)
X-Received: by 2002:a05:693c:66cd:20b0:33b:d8b2:8fba with SMTP id 5a478bee46e88-34002be4d40mr106561eec.7.1790191320319;
        Wed, 23 Sep 2026 12:22:00 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9684d643sm17609309eec.18.2026.09.23.12.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:22:00 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 00:51:33 +0530
Subject: [PATCH v2 3/3] clk: qcom: dprxcc: Add Nord DPRX clock controller
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-nords_dprx-v2-3-fa4364e087ef@oss.qualcomm.com>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
In-Reply-To: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: 5EuFTgt3HGFYi9--8tjZs7FNa92nwJfr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA3NyBTYWx0ZWRfXwGfRm0UG6Am0
 YPrkw7C0cN/k5HWfXPcwXN5lxTAKiqjUO940QHRPKwy1yvo1yzJhf+tDypToSdy5anL5fhkl576
 0e/WqJIjr4OLdK1j/h9id7sRWvNZtANT0xglR477M6Tdv3Sg9dXWfGMcpgEbepG+i5gknxA/mYY
 n41h0/j4xAyE911KBcEfmNGK9s/ypWh4DLBpgvFSkvWzoGKRx79EkS6sIs9VDV13N+T8rYPTXgC
 ROuMtqN/rNQita81HOWzeSg8PEaeMKwkK7W2yPxHDSTNIAKI9hdRjtaz0AD/R1WLU0iTPhqVYG4
 ptWjsNrcwjKbtEoy6Pydl2Up88Hqz12agHbSe/THZxWAiIcCGVIV16EEaqLQ9UK9oopwRLSpf3B
 mucsl17thZeb+R/RVe00nViJUhWcjfItBHO4kP46AC+ucKNGOAsIeU0zNhklrsK//rOlx/yAaOK
 gY7Ff8kLAc4sWKGyang==
X-Proofpoint-GUID: 5EuFTgt3HGFYi9--8tjZs7FNa92nwJfr
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab426da cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=0-BBk2c4bgoaTx3pdGQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA3NyBTYWx0ZWRfX9hKmqyVQzuXM
 AtcZToeO3DFnYMLEQYgAfQHXaUAeENXMG9oB7+hLERTg8uPv8X7/iUegym30YR1e/79YzYZZ1fI
 Op9pQDXwo7F3gmoSD8ykKZrWOsn5Qlg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230077

Add support for the DisplayPort Receiver (DPRX) clock controllers on
Nord devices. There are two identical DPRX clock controller
instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
audio, AHB and video memory paths, along with core PLLs.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |  11 +
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/dprxcc0-nord.c | 434 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/dprxcc1-nord.c | 433 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 879 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 3bf39a2c54c85ee7d0c59608ad71b8ec6c899020..0fd6f5642db23599be8f0365e73faec5451e6411 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -255,6 +255,17 @@ config CLK_NORD_CAMCC
 	  Say Y if you want to support camera devices and functionality such as
 	  capturing pictures.
 
+config CLK_NORD_DPRXCC
+	tristate "Nord DPRX Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_NORD_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the Display Port Receiver (DPRX) clock controller on
+	  Nord devices. The DPRX clock controller provides clocks for the
+	  DPRX core, audio, AHB and video memory paths.
+	  Say Y if you want to support DPRX functionality.
+
 config CLK_NORD_GCC
 	tristate "Nord Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index bd70e18a7118126fa20427b3366956075cecb00f..f5294bb67e9a8387c40e629c2ec150e4dd4848b2 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -50,6 +50,7 @@ obj-$(CONFIG_CLK_KUNO_GCC) += gcc-kuno.o
 obj-$(CONFIG_CLK_MAILI_VIDEOCC) += videocc-maili.o
 obj-$(CONFIG_CLK_NORD_CAMCC) += camcc-nord.o
 obj-$(CONFIG_CLK_NORD_DISPCC) += dispcc0-nord.o dispcc1-nord.o
+obj-$(CONFIG_CLK_NORD_DPRXCC) += dprxcc0-nord.o dprxcc1-nord.o
 obj-$(CONFIG_CLK_NORD_GCC) += gcc-nord.o negcc-nord.o nwgcc-nord.o segcc-nord.o
 obj-$(CONFIG_CLK_NORD_GPUCC) += gpucc-nord.o gpu2cc-nord.o
 obj-$(CONFIG_CLK_NORD_TCSRCC) += tcsrcc-nord.o
diff --git a/drivers/clk/qcom/dprxcc0-nord.c b/drivers/clk/qcom/dprxcc0-nord.c
new file mode 100644
index 0000000000000000000000000000000000000000..d17b9338f33bf4864d8a5968ada3806a921fe68e
--- /dev/null
+++ b/drivers/clk/qcom/dprxcc0-nord.c
@@ -0,0 +1,434 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,nord-dprxcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_AHB_CLK,
+	DT_SLEEP_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_DPRX_0_DPRX_CC_PLL0_OUT_EVEN,
+	P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN,
+	P_DPRX_0_DPRX_CC_PLL0_OUT_ODD,
+	P_DPRX_0_DPRX_CC_PLL1_OUT_EVEN,
+	P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN,
+	P_SLEEP_CLK,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+static const struct pll_vco zonda_ole_vco[] = {
+	{ 700000000, 3600000000, 0 },
+};
+
+/* 550.0 MHz Configuration */
+static const struct alpha_pll_config dprx_0_dprx_cc_pll0_config = {
+	.l = 0x1c,
+	.alpha = 0xa555,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00400005,
+};
+
+static struct clk_alpha_pll dprx_0_dprx_cc_pll0 = {
+	.offset = 0x0,
+	.config = &dprx_0_dprx_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+/* 1080.0 MHz Configuration */
+static const struct alpha_pll_config dprx_0_dprx_cc_pll1_config = {
+	.l = 0x38,
+	.alpha = 0x4000000,
+	.config_ctl_val = 0x08240800,
+	.config_ctl_hi_val = 0x05008001,
+	.config_ctl_hi1_val = 0x00000000,
+	.config_ctl_hi2_val = 0x00000000,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x02000080,
+};
+
+static struct clk_alpha_pll dprx_0_dprx_cc_pll1 = {
+	.offset = 0x1000,
+	.alpha_width = 28,
+	.config = &dprx_0_dprx_cc_pll1_config,
+	.vco_table = zonda_ole_vco,
+	.num_vco = ARRAY_SIZE(zonda_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_ZONDA_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_zonda_ole_ops,
+		},
+	},
+};
+
+static const struct parent_map dprx_cc_0_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DPRX_0_DPRX_CC_PLL0_OUT_EVEN, 1 },
+	{ P_DPRX_0_DPRX_CC_PLL0_OUT_ODD, 2 },
+	{ P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 4 },
+	{ P_SLEEP_CLK, 5 },
+};
+
+static const struct clk_parent_data dprx_cc_0_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &dprx_0_dprx_cc_pll0.clkr.hw },
+	{ .hw = &dprx_0_dprx_cc_pll0.clkr.hw },
+	{ .hw = &dprx_0_dprx_cc_pll0.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct parent_map dprx_cc_0_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DPRX_0_DPRX_CC_PLL1_OUT_EVEN, 3 },
+	{ P_SLEEP_CLK, 5 },
+	{ P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN, 6 },
+};
+
+static const struct clk_parent_data dprx_cc_0_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &dprx_0_dprx_cc_pll1.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+	{ .hw = &dprx_0_dprx_cc_pll1.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_dprx_0_dprx_cc_audio_clk_src[] = {
+	F(216000000, P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
+	F(300000000, P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
+	F(360000000, P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_0_dprx_cc_audio_clk_src = {
+	.cmd_rcgr = 0x80c8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_0_parent_map_1,
+	.freq_tbl = ftbl_dprx_0_dprx_cc_audio_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_0_dprx_cc_audio_clk_src",
+		.parent_data = dprx_cc_0_parent_data_1,
+		.num_parents = ARRAY_SIZE(dprx_cc_0_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dprx_0_dprx_cc_core_rcg0_clk_src[] = {
+	F(220000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(440000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_0_dprx_cc_core_rcg0_clk_src = {
+	.cmd_rcgr = 0x8004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_0_parent_map_0,
+	.freq_tbl = ftbl_dprx_0_dprx_cc_core_rcg0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_0_dprx_cc_core_rcg0_clk_src",
+		.parent_data = dprx_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(dprx_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dprx_0_dprx_cc_core_rcg2_clk_src[] = {
+	F(275000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(440000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(550000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_0_dprx_cc_core_rcg2_clk_src = {
+	.cmd_rcgr = 0x8068,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_0_parent_map_0,
+	.freq_tbl = ftbl_dprx_0_dprx_cc_core_rcg2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_0_dprx_cc_core_rcg2_clk_src",
+		.parent_data = dprx_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(dprx_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dprx_0_dprx_cc_core_rcg3_clk_src[] = {
+	F(275000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(550000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_0_dprx_cc_core_rcg3_clk_src = {
+	.cmd_rcgr = 0x8098,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_0_parent_map_0,
+	.freq_tbl = ftbl_dprx_0_dprx_cc_core_rcg3_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_0_dprx_cc_core_rcg3_clk_src",
+		.parent_data = dprx_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(dprx_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div dprx_0_dprx_cc_core_ahb_div_clk_src = {
+	.reg = 0x80b0,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_0_dprx_cc_core_ahb_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&dprx_0_dprx_cc_core_rcg3_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div dprx_0_dprx_cc_core_aud_div_clk_src = {
+	.reg = 0x80d0,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_0_dprx_cc_core_aud_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&dprx_0_dprx_cc_audio_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch dprx_0_dprx_cc_ahb_clk = {
+	.halt_reg = 0x80b4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80b4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_0_dprx_cc_core_ahb_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_0_dprx_cc_aud_clk = {
+	.halt_reg = 0x80d4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_aud_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_0_dprx_cc_core_aud_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_0_dprx_cc_mdp_mem_clk = {
+	.halt_reg = 0x8088,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8088,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8088,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_mdp_mem_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_0_dprx_cc_core_rcg2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_0_dprx_cc_mmcx_xo_clk = {
+	.halt_reg = 0x80d8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_mmcx_xo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_0_dprx_cc_vid_mem_clk = {
+	.halt_reg = 0x8028,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8028,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_vid_mem_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_0_dprx_cc_core_rcg0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *dprx_cc_0_nord_clocks[] = {
+	[DPRX_CC_AHB_CLK] = &dprx_0_dprx_cc_ahb_clk.clkr,
+	[DPRX_CC_AUD_CLK] = &dprx_0_dprx_cc_aud_clk.clkr,
+	[DPRX_CC_AUDIO_CLK_SRC] = &dprx_0_dprx_cc_audio_clk_src.clkr,
+	[DPRX_CC_CORE_AHB_DIV_CLK_SRC] = &dprx_0_dprx_cc_core_ahb_div_clk_src.clkr,
+	[DPRX_CC_CORE_AUD_DIV_CLK_SRC] = &dprx_0_dprx_cc_core_aud_div_clk_src.clkr,
+	[DPRX_CC_CORE_RCG0_CLK_SRC] = &dprx_0_dprx_cc_core_rcg0_clk_src.clkr,
+	[DPRX_CC_CORE_RCG2_CLK_SRC] = &dprx_0_dprx_cc_core_rcg2_clk_src.clkr,
+	[DPRX_CC_CORE_RCG3_CLK_SRC] = &dprx_0_dprx_cc_core_rcg3_clk_src.clkr,
+
+	[DPRX_CC_MDP_MEM_CLK] = &dprx_0_dprx_cc_mdp_mem_clk.clkr,
+	[DPRX_CC_MMCX_XO_CLK] = &dprx_0_dprx_cc_mmcx_xo_clk.clkr,
+	[DPRX_CC_PLL0] = &dprx_0_dprx_cc_pll0.clkr,
+	[DPRX_CC_PLL1] = &dprx_0_dprx_cc_pll1.clkr,
+	[DPRX_CC_VID_MEM_CLK] = &dprx_0_dprx_cc_vid_mem_clk.clkr,
+};
+
+static const struct qcom_reset_map dprx_cc_0_nord_resets[] = {
+	[DPRX_CC_DPRX_BLK_BCR] = { 0x8000 },
+};
+
+static struct clk_alpha_pll *dprx_cc_0_nord_plls[] = {
+	&dprx_0_dprx_cc_pll0,
+	&dprx_0_dprx_cc_pll1,
+};
+
+static const struct regmap_config dprx_cc_0_nord_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x8104,
+	.fast_io = true,
+};
+
+static void dprx_cc_0_nord_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/*
+	 * Configure cdiv 20 for core aud and 11 for core ahb clks of DPRX CC
+	 */
+	regmap_write(regmap, dprx_0_dprx_cc_core_aud_div_clk_src.reg, 0x13);
+	regmap_write(regmap, dprx_0_dprx_cc_core_ahb_div_clk_src.reg, 0x0A);
+}
+
+static const struct qcom_cc_driver_data dprx_cc_0_nord_driver_data = {
+	.alpha_plls = dprx_cc_0_nord_plls,
+	.num_alpha_plls = ARRAY_SIZE(dprx_cc_0_nord_plls),
+	.clk_regs_configure = dprx_cc_0_nord_regs_configure,
+};
+
+static const struct qcom_cc_desc dprx_cc_0_nord_desc = {
+	.config = &dprx_cc_0_nord_regmap_config,
+	.clks = dprx_cc_0_nord_clocks,
+	.num_clks = ARRAY_SIZE(dprx_cc_0_nord_clocks),
+	.resets = dprx_cc_0_nord_resets,
+	.num_resets = ARRAY_SIZE(dprx_cc_0_nord_resets),
+	.driver_data = &dprx_cc_0_nord_driver_data,
+};
+
+static const struct of_device_id dprx_cc_0_nord_match_table[] = {
+	{ .compatible = "qcom,nord-dprxcc0" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dprx_cc_0_nord_match_table);
+
+static int dprx_cc_0_nord_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &dprx_cc_0_nord_desc);
+}
+
+static struct platform_driver dprx_cc_0_nord_driver = {
+	.probe = dprx_cc_0_nord_probe,
+	.driver = {
+		.name = "dprxcc0-nord",
+		.of_match_table = dprx_cc_0_nord_match_table,
+	},
+};
+
+module_platform_driver(dprx_cc_0_nord_driver);
+
+MODULE_DESCRIPTION("QTI DPRXCC0 NORD Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/dprxcc1-nord.c b/drivers/clk/qcom/dprxcc1-nord.c
new file mode 100644
index 0000000000000000000000000000000000000000..851a97c196c0ae3c022858bb18f62bf295199d68
--- /dev/null
+++ b/drivers/clk/qcom/dprxcc1-nord.c
@@ -0,0 +1,433 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,nord-dprxcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_AHB_CLK,
+	DT_SLEEP_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_DPRX_1_DPRX_CC_PLL0_OUT_EVEN,
+	P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN,
+	P_DPRX_1_DPRX_CC_PLL0_OUT_ODD,
+	P_DPRX_1_DPRX_CC_PLL1_OUT_EVEN,
+	P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN,
+	P_SLEEP_CLK,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+static const struct pll_vco zonda_ole_vco[] = {
+	{ 700000000, 3600000000, 0 },
+};
+
+/* 550.0 MHz Configuration */
+static const struct alpha_pll_config dprx_1_dprx_cc_pll0_config = {
+	.l = 0x1c,
+	.alpha = 0xa555,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00400005,
+};
+
+static struct clk_alpha_pll dprx_1_dprx_cc_pll0 = {
+	.offset = 0x0,
+	.config = &dprx_1_dprx_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+/* 1080.0 MHz Configuration */
+static const struct alpha_pll_config dprx_1_dprx_cc_pll1_config = {
+	.l = 0x38,
+	.alpha = 0x4000000,
+	.config_ctl_val = 0x08240800,
+	.config_ctl_hi_val = 0x05008001,
+	.config_ctl_hi1_val = 0x00000000,
+	.config_ctl_hi2_val = 0x00000000,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x02000080,
+};
+
+static struct clk_alpha_pll dprx_1_dprx_cc_pll1 = {
+	.offset = 0x1000,
+	.alpha_width = 28,
+	.config = &dprx_1_dprx_cc_pll1_config,
+	.vco_table = zonda_ole_vco,
+	.num_vco = ARRAY_SIZE(zonda_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_ZONDA_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_zonda_ole_ops,
+		},
+	},
+};
+
+static const struct parent_map dprx_cc_1_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DPRX_1_DPRX_CC_PLL0_OUT_EVEN, 1 },
+	{ P_DPRX_1_DPRX_CC_PLL0_OUT_ODD, 2 },
+	{ P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 4 },
+	{ P_SLEEP_CLK, 5 },
+};
+
+static const struct clk_parent_data dprx_cc_1_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &dprx_1_dprx_cc_pll0.clkr.hw },
+	{ .hw = &dprx_1_dprx_cc_pll0.clkr.hw },
+	{ .hw = &dprx_1_dprx_cc_pll0.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct parent_map dprx_cc_1_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DPRX_1_DPRX_CC_PLL1_OUT_EVEN, 3 },
+	{ P_SLEEP_CLK, 5 },
+	{ P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN, 6 },
+};
+
+static const struct clk_parent_data dprx_cc_1_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &dprx_1_dprx_cc_pll1.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+	{ .hw = &dprx_1_dprx_cc_pll1.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_dprx_1_dprx_cc_audio_clk_src[] = {
+	F(216000000, P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
+	F(300000000, P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
+	F(360000000, P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_1_dprx_cc_audio_clk_src = {
+	.cmd_rcgr = 0x80c8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_1_parent_map_1,
+	.freq_tbl = ftbl_dprx_1_dprx_cc_audio_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_1_dprx_cc_audio_clk_src",
+		.parent_data = dprx_cc_1_parent_data_1,
+		.num_parents = ARRAY_SIZE(dprx_cc_1_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dprx_1_dprx_cc_core_rcg0_clk_src[] = {
+	F(220000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(440000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_1_dprx_cc_core_rcg0_clk_src = {
+	.cmd_rcgr = 0x8004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_1_parent_map_0,
+	.freq_tbl = ftbl_dprx_1_dprx_cc_core_rcg0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_1_dprx_cc_core_rcg0_clk_src",
+		.parent_data = dprx_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(dprx_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dprx_1_dprx_cc_core_rcg2_clk_src[] = {
+	F(275000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(440000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(550000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_1_dprx_cc_core_rcg2_clk_src = {
+	.cmd_rcgr = 0x8068,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_1_parent_map_0,
+	.freq_tbl = ftbl_dprx_1_dprx_cc_core_rcg2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_1_dprx_cc_core_rcg2_clk_src",
+		.parent_data = dprx_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(dprx_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dprx_1_dprx_cc_core_rcg3_clk_src[] = {
+	F(275000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(550000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_1_dprx_cc_core_rcg3_clk_src = {
+	.cmd_rcgr = 0x8098,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_1_parent_map_0,
+	.freq_tbl = ftbl_dprx_1_dprx_cc_core_rcg3_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_1_dprx_cc_core_rcg3_clk_src",
+		.parent_data = dprx_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(dprx_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div dprx_1_dprx_cc_core_ahb_div_clk_src = {
+	.reg = 0x80b0,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_1_dprx_cc_core_ahb_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&dprx_1_dprx_cc_core_rcg3_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div dprx_1_dprx_cc_core_aud_div_clk_src = {
+	.reg = 0x80d0,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_1_dprx_cc_core_aud_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&dprx_1_dprx_cc_audio_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch dprx_1_dprx_cc_ahb_clk = {
+	.halt_reg = 0x80b4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80b4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_1_dprx_cc_core_ahb_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_1_dprx_cc_aud_clk = {
+	.halt_reg = 0x80d4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_aud_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_1_dprx_cc_core_aud_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_1_dprx_cc_mdp_mem_clk = {
+	.halt_reg = 0x8088,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8088,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8088,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_mdp_mem_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_1_dprx_cc_core_rcg2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_1_dprx_cc_mmcx_xo_clk = {
+	.halt_reg = 0x80d8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_mmcx_xo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_1_dprx_cc_vid_mem_clk = {
+	.halt_reg = 0x8028,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8028,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_vid_mem_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_1_dprx_cc_core_rcg0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *dprx_cc_1_nord_clocks[] = {
+	[DPRX_CC_AHB_CLK] = &dprx_1_dprx_cc_ahb_clk.clkr,
+	[DPRX_CC_AUD_CLK] = &dprx_1_dprx_cc_aud_clk.clkr,
+	[DPRX_CC_AUDIO_CLK_SRC] = &dprx_1_dprx_cc_audio_clk_src.clkr,
+	[DPRX_CC_CORE_AHB_DIV_CLK_SRC] = &dprx_1_dprx_cc_core_ahb_div_clk_src.clkr,
+	[DPRX_CC_CORE_AUD_DIV_CLK_SRC] = &dprx_1_dprx_cc_core_aud_div_clk_src.clkr,
+	[DPRX_CC_CORE_RCG0_CLK_SRC] = &dprx_1_dprx_cc_core_rcg0_clk_src.clkr,
+	[DPRX_CC_CORE_RCG2_CLK_SRC] = &dprx_1_dprx_cc_core_rcg2_clk_src.clkr,
+	[DPRX_CC_CORE_RCG3_CLK_SRC] = &dprx_1_dprx_cc_core_rcg3_clk_src.clkr,
+	[DPRX_CC_MDP_MEM_CLK] = &dprx_1_dprx_cc_mdp_mem_clk.clkr,
+	[DPRX_CC_MMCX_XO_CLK] = &dprx_1_dprx_cc_mmcx_xo_clk.clkr,
+	[DPRX_CC_PLL0] = &dprx_1_dprx_cc_pll0.clkr,
+	[DPRX_CC_PLL1] = &dprx_1_dprx_cc_pll1.clkr,
+	[DPRX_CC_VID_MEM_CLK] = &dprx_1_dprx_cc_vid_mem_clk.clkr,
+};
+
+static const struct qcom_reset_map dprx_cc_1_nord_resets[] = {
+	[DPRX_CC_DPRX_BLK_BCR] = { 0x8000 },
+};
+
+static struct clk_alpha_pll *dprx_cc_1_nord_plls[] = {
+	&dprx_1_dprx_cc_pll0,
+	&dprx_1_dprx_cc_pll1,
+};
+
+static const struct regmap_config dprx_cc_1_nord_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x8104,
+	.fast_io = true,
+};
+
+static void dprx_cc_1_nord_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/*
+	 * Configure cdiv 20 for core aud and 11 for core ahb clks of DPRX CC
+	 */
+	regmap_write(regmap, dprx_1_dprx_cc_core_aud_div_clk_src.reg, 0x13);
+	regmap_write(regmap, dprx_1_dprx_cc_core_ahb_div_clk_src.reg, 0x0A);
+}
+
+static const struct qcom_cc_driver_data dprx_cc_1_nord_driver_data = {
+	.alpha_plls = dprx_cc_1_nord_plls,
+	.num_alpha_plls = ARRAY_SIZE(dprx_cc_1_nord_plls),
+	.clk_regs_configure = dprx_cc_1_nord_regs_configure,
+};
+
+static const struct qcom_cc_desc dprx_cc_1_nord_desc = {
+	.config = &dprx_cc_1_nord_regmap_config,
+	.clks = dprx_cc_1_nord_clocks,
+	.num_clks = ARRAY_SIZE(dprx_cc_1_nord_clocks),
+	.resets = dprx_cc_1_nord_resets,
+	.num_resets = ARRAY_SIZE(dprx_cc_1_nord_resets),
+	.driver_data = &dprx_cc_1_nord_driver_data,
+};
+
+static const struct of_device_id dprx_cc_1_nord_match_table[] = {
+	{ .compatible = "qcom,nord-dprxcc1" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dprx_cc_1_nord_match_table);
+
+static int dprx_cc_1_nord_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &dprx_cc_1_nord_desc);
+}
+
+static struct platform_driver dprx_cc_1_nord_driver = {
+	.probe = dprx_cc_1_nord_probe,
+	.driver = {
+		.name = "dprxcc1-nord",
+		.of_match_table = dprx_cc_1_nord_match_table,
+	},
+};
+
+module_platform_driver(dprx_cc_1_nord_driver);
+
+MODULE_DESCRIPTION("QTI DPRXCC1 NORD Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

