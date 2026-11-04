Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793768933;
	b=egeLtpY5CR0sWNACuallgInWcaem4xbckUu2AdImps3OffAJvNf1sb7Zk971VO9FdjQE
	 vvUFRBFs0KOr2trTcj9Cyl4O7RjG/k840LszWFGpzd+MxIJOTPm+q+dWNOc4hNiXjKL57
	 Urq2tYFRfpVhv/6g4adHpETQkqh6rAOCSsETAicHWyD2RvK5SIoj6hhIy9vv3/9B5JUdW
	 v54FIu96bZl9Q3Y9t4Fwej6iRgwWPDUUDoA8Xt9l1rTVUGgdy/eTVeJ4UGSKpbT6nno+j
	 ONQ5/mqV+ZftUCrNovhOyDP8eMIjXtu04AbKCueSpHM8gTTmvaFnPLy0JI56Pp5K/5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793768933;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=33cz/emHwn5wUjHtLiOj2ARrLkGcWsFzEttPuz3/OL0=;
	b=yZFmqhtbxy1HXLsL46soaZNQ3zwPTjC7Szy4eMi2MxEdgaGhja8oC9SkIZfe1d24sEI+
	 ygPEwAQi4nsPORIsh/vLkNJ9iLXndflEH3Oa87sqjrL11ZjiNVGWKLuQWB9kWaymeLseN
	 EsHXjC1PRpbyzOnHBAEH3/09dg4gJxHqEpCD9mEdLwTJO3Tofv4Je5/FvnrWrtcFmBzKT
	 aKPFaUS5kZtoHedgQn4FhvxTzcPEo68TQkWmLSTVlOqmQ9NHAXxpWbZxIO+EeraBe9ot8
	 eSAs4rRUolySHm22D4+M4KmY0oZsHZ22jQGPyMoMJfHMJ1iXMIhhcVweS5zCnJ+kYIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZR+9gnJb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ioS1X2a6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDE0606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BDE0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZR+9gnJb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ioS1X2a6
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RwPf3868170
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 05:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	33cz/emHwn5wUjHtLiOj2ARrLkGcWsFzEttPuz3/OL0=; b=ZR+9gnJbrBxl85vn
	Rt03WYgTfDMGpM8EP5BxENUCx2j+J3vpp/9U7QP3F0vblvWpZyeLb9R8RBoiYRBP
	eUv3Un66+mde+2xGR55r4OpKTKL9Kb8EbuoKCl/Nd8AXmjHPfoG58N+jz2JAxc9A
	2mSCc4Q52oY+IWFrgjSuQ/3GnNSGM4aTnO13qul7fYrb+MmTB9P+vrsXzw5SydRB
	mBDyyl/0IJZL9MptfEBhmyjcP90zBTaNNa6ahoPxqWJ/vgkH/PjwbV2NRaYAuGwc
	dZv9ieAI40lg9HbrlKt2nG8wYc/B9Ydob8Lzf/kHKJ6pg+XLywZBUiJKXVxV3cwD
	pS5hCQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8y20f9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:08:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eac6e96bd4so4986395ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793768931; x=1794373731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=33cz/emHwn5wUjHtLiOj2ARrLkGcWsFzEttPuz3/OL0=;
        b=ioS1X2a6p/1FvRkKcg/ezkQx5fE15ULHUbZIlNFOkCxEKkdY1qFryQbtWZthP9mub0
         JU9VVpV9fmU59odZMJDK355FKb6KHkzA9Y8J34ZpJ5ASc5xT/YLbafhmtB1xo6Qi4+M5
         lgvuFW+SV4+m5nygmKH0gppFR6OgX5r9XGxE/8zNxBsz12oLSNRQViiimCWOr9Jj0E4Z
         7CjCAM2VvpaBTrmyc4up+DFShYbZHE3Ky/eB2j2F+8k2Q75uBhu5g/TLyEa5thojWtdP
         Y5boT689Wmfznes2kjNOcGNiwpyGAHx3Qkvpr6dIjy8rGjLCkk2II0Vna471Kk4eklUZ
         WjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793768931; x=1794373731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=33cz/emHwn5wUjHtLiOj2ARrLkGcWsFzEttPuz3/OL0=;
        b=BsIGHeuZQxMoQql3/NELnzrZDYUwjYvxW4sPAweNSKtmNmCpEbHEUlgFHsK4+zN494
         beXYIdgMqru8u8vr7nt4cUlvTApx1DlX/m4CEIsuReFql5eMQm6+V7MUEwjerqPMIY4B
         JN/GMReqmqDFGXzaK751pE+0HxsHd/nhB4ic1ZwOSqI5Vf2RM7zOD7QvoPvcTDXRiNUx
         tNHflEOpdEHwx/r8MmZIJx6JkJSz1ZplIL38DEKFF28kZAcmtPJSFVm22k0A55NJKSbN
         J2eSp2Z02H6U5/e+44KFbFL7wEa5Dc4/lO5UyUIfoUZE8DxIppgKL2sOX3MS+ZGYec3z
         0Ljg==
X-Forwarded-Encrypted: i=1; AKwUvBztUHmKXZ06ge8RD8utoRDb+Y04VXETaTYz3FSItzl8OX9d1HWZUexQpfj12sR10/UvA/gYd1EZaCxeSK8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mxPey5g4UQqWMY/3+M3YxFBPf0tRBRtv5s2d5JVW7PYAMQSTk
	5D/0E+whoOIHD9/bmhCFxxfXxcXA08G6c5OlnlnC8u/sCQ4Ux2lR7VEevAfQRJnuaa+70kV+Kue
	v8YcyE1JFL93zT5FMN5O6yebsXn9+io5PzfXNoUc85SbA00qnEgbnIx+simHM7gF/4f8=
X-Gm-Gg: AYBFou2igA2Q+HfxyxqQ5bw4lsQbJM2PXaivAkWLcAm/1jOU/BUDN5JomoicfzHBBAW
	2Z9lBYPYiarrk4hxTFAKlejUw8P3eHN4eKJClCYri/9vJ1IzLRimtIy31WRI88xN5lNSbefBcJo
	5WZ/9iWd/nuXpKcban9Vqh1ylrB4UQ1Mb+XAQLb4RlbGpWQ3qQoVeSKDELGi/1J9ngBbz6huBEl
	pDltqCoLvqWuyNHE13FQTD2vu1Un/hHFD1B9lHy4sD29eWWGm5ifvLkqSfYbGrnj5QyRKWXiqD9
	3ZBlT3YS+JYdtUHkZ11xzY8aRFmeKbAN6ZahmkMA8iZzvIRip6qw39CiablDUeLc/mFT3/N+Gv/
	OXfsPTO8VHLCRBdIEeNZ5soBcjWl8k/PotkZtAoOkYM81l5zbVO5y2E393rPm4EWuvHprSkOkeq
	gwL+M=
X-Received: by 2002:a17:90a:4084:b0:3b0:9a1b:b6fe with SMTP id 98e67ed59e1d1-3b09a1bb8abmr476673a91.62.1793768930844;
        Tue, 03 Nov 2026 21:08:50 -0800 (PST)
X-Received: by 2002:a17:90a:4084:b0:3b0:9a1b:b6fe with SMTP id 98e67ed59e1d1-3b09a1bb8abmr476654a91.62.1793768930307;
        Tue, 03 Nov 2026 21:08:50 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b095314e85sm1830242a91.15.2026.11.03.21.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:08:49 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 10:37:35 +0530
Subject: [PATCH v2 3/4] clk: qcom: av1ecc-glymur: Add AV1E clock controller
 driver
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-glymur-av1ecc-v2-3-7c25a73fe811@oss.qualcomm.com>
References: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
In-Reply-To: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 3tXoYM7RnvwhwlczyUd8_0d2T333Aq2O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX7/twAu7zLQ5B
 J5GzKB9MFcbEWypli7W7gKbPAD22jQE8xfqsPavn+BSm81fNF2PPI8oD32EXVH9F9n5XAE7fUrE
 OBKugnQt57Gy6qjuDQvCyxjgg7TEUay44sajHNss1h2LaU4j8UnfzAGYybLREw1onTh4ilKlcS1
 55E0IDOgU7kIPdKGiL0mi3R8iqgD30zYuUjDZTy87dH7mElyu/U+0XqTBo9wityJkIyCR6fKY1i
 1821lei+8z/lSjHbcQgHU32TRazcjMemVwzoOkQXFwLG15z5XtTGVoFIlBjGZ8DwuOW8jNbT8Y3
 ItIvGjB9uM2DNWkq8LofxHegWiGbTToe2K0G7POtHmPIX1cVeH+sURRbevG8bLK+NXHoLPndYn8
 6Yr8kLbS2MuVpLjX/nZrNoe3BtI7+lIJwt1Ijg+cV3tQ5ZbHJvgf0FDRqvqhdHfyFbWiWZLYmak
 n3Pm2G7dLUAOiIpEC8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX0SSH2lhXTBEO
 IMSz13HMNYWNhcFTpWbDnBdaKLC9+BlzNWML8yS0pDTruo3pqwh9nMo/cyOvYGinOKgE7GvV+D0
 OoxT8v3jYEJZ5pJ3Dik+W7fYbl8yZZo=
X-Proofpoint-ORIG-GUID: 3tXoYM7RnvwhwlczyUd8_0d2T333Aq2O
X-Authority-Analysis: v=2.4 cv=NP5AaE6g c=1 sm=1 tr=0 ts=6aeabde3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hq77mm9E1D9dZevUziYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040020

Add support for the AV1 encoder clock controller (AV1ECC) driver
for clients to be able to request for AV1ECC clocks on Qualcomm
Glymur platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig         |  11 ++
 drivers/clk/qcom/Makefile        |   1 +
 drivers/clk/qcom/av1ecc-glymur.c | 393 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 405 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 27d0ab24d50a4ca5587ed8d6085c4d6fcd57eb8c..94f3445f6bd0ecd297d83b5804ff0e4433d48261 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -69,6 +69,17 @@ config CLK_ELIZA_TCSRCC
 	  Support for the TCSR clock controller on Eliza devices.
 	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.
 
+config CLK_GLYMUR_AV1ECC
+	tristate "Glymur AV1E Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_GLYMUR_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the video AV1 encoder clock controller on
+	  Qualcomm Technologies, Inc. Glymur devices.
+	  Say Y if you want to support functionality such as AV1
+	  encoding.
+
 config CLK_GLYMUR_CAMCC
 	tristate "Glymur Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 6affb5073f269d18f1b78d6c7f92e14baeade1e5..61d4efb7547146544902dddf52e4853d073d5467 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_CLK_ELIZA_GPUCC) += gpucc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_VIDEOCC) += videocc-eliza.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
+obj-$(CONFIG_CLK_GLYMUR_AV1ECC) += av1ecc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_CAMCC) += camcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_EVACC) += evacc-glymur.o
diff --git a/drivers/clk/qcom/av1ecc-glymur.c b/drivers/clk/qcom/av1ecc-glymur.c
new file mode 100644
index 0000000000000000000000000000000000000000..e59c8ecef44543f6c2c79f3f44f838fca8c142ab
--- /dev/null
+++ b/drivers/clk/qcom/av1ecc-glymur.c
@@ -0,0 +1,393 @@
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
+#include <dt-bindings/clock/qcom,glymur-av1ecc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_IFACE,
+};
+
+enum {
+	P_AV1E_CC_PLL0_OUT_EVEN,
+	P_AV1E_CC_PLL0_OUT_MAIN,
+	P_AV1E_CC_PLL0_OUT_ODD,
+	P_BI_TCXO,
+};
+
+static const struct pll_vco taycan_eko_t_vco[] = {
+	{ 249600000, 2500000000, 0 },
+};
+
+/* 600.0 MHz Configuration */
+static const struct alpha_pll_config av1e_cc_pll0_config = {
+	.l = 0x1f,
+	.cal_l = 0x48,
+	.alpha = 0x4000,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000008,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll av1e_cc_pll0 = {
+	.offset = 0x0,
+	.config = &av1e_cc_pll0_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+static const struct parent_map av1e_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_AV1E_CC_PLL0_OUT_MAIN, 1 },
+	{ P_AV1E_CC_PLL0_OUT_ODD, 2 },
+	{ P_AV1E_CC_PLL0_OUT_EVEN, 3 },
+};
+
+static const struct clk_parent_data av1e_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &av1e_cc_pll0.clkr.hw },
+	{ .hw = &av1e_cc_pll0.clkr.hw },
+	{ .hw = &av1e_cc_pll0.clkr.hw },
+};
+
+static const struct parent_map av1e_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data av1e_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct freq_tbl ftbl_av1e_cc_av1e_core_clk_src[] = {
+	F(300000000, P_AV1E_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(400000000, P_AV1E_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(600000000, P_AV1E_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 av1e_cc_av1e_core_clk_src = {
+	.cmd_rcgr = 0x4018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = av1e_cc_parent_map_0,
+	.freq_tbl = ftbl_av1e_cc_av1e_core_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "av1e_cc_av1e_core_clk_src",
+		.parent_data = av1e_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(av1e_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_av1e_cc_av1e_xo_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 av1e_cc_av1e_xo_clk_src = {
+	.cmd_rcgr = 0x601c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = av1e_cc_parent_map_1,
+	.freq_tbl = ftbl_av1e_cc_av1e_xo_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "av1e_cc_av1e_xo_clk_src",
+		.parent_data = av1e_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(av1e_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div av1e_cc_av1e_noc_ahb_div_clk_src = {
+	.reg = 0x5020,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "av1e_cc_av1e_noc_ahb_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&av1e_cc_av1e_core_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch av1e_cc_ahb_clk = {
+	.halt_reg = 0x6000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x6000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&av1e_cc_av1e_noc_ahb_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch av1e_cc_av1e_core_apb_clk = {
+	.halt_reg = 0x4044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_av1e_core_apb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&av1e_cc_av1e_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch av1e_cc_av1e_core_axi_clk = {
+	.halt_reg = 0x4040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_av1e_core_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&av1e_cc_av1e_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch av1e_cc_av1e_core_clk = {
+	.halt_reg = 0x4030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_av1e_core_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&av1e_cc_av1e_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch av1e_cc_av1e_gdsc_noc_ahb_clk = {
+	.halt_reg = 0x5024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5024,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_av1e_gdsc_noc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&av1e_cc_av1e_noc_ahb_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch av1e_cc_av1e_noc_ahb_clk = {
+	.halt_reg = 0x5028,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x5028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_av1e_noc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&av1e_cc_av1e_noc_ahb_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch av1e_cc_av1e_noc_core_axi_clk = {
+	.halt_reg = 0x5004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_av1e_noc_core_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&av1e_cc_av1e_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch av1e_cc_av1e_noc_xo_clk = {
+	.halt_reg = 0x6038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "av1e_cc_av1e_noc_xo_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&av1e_cc_av1e_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc av1e_cc_core_gdsc = {
+	.gdscr = 0x4004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "av1e_cc_core_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *av1e_cc_glymur_clocks[] = {
+	[AV1E_CC_AHB_CLK] = &av1e_cc_ahb_clk.clkr,
+	[AV1E_CC_AV1E_CORE_APB_CLK] = &av1e_cc_av1e_core_apb_clk.clkr,
+	[AV1E_CC_AV1E_CORE_AXI_CLK] = &av1e_cc_av1e_core_axi_clk.clkr,
+	[AV1E_CC_AV1E_CORE_CLK] = &av1e_cc_av1e_core_clk.clkr,
+	[AV1E_CC_AV1E_CORE_CLK_SRC] = &av1e_cc_av1e_core_clk_src.clkr,
+	[AV1E_CC_AV1E_GDSC_NOC_AHB_CLK] = &av1e_cc_av1e_gdsc_noc_ahb_clk.clkr,
+	[AV1E_CC_AV1E_NOC_AHB_CLK] = &av1e_cc_av1e_noc_ahb_clk.clkr,
+	[AV1E_CC_AV1E_NOC_AHB_DIV_CLK_SRC] = &av1e_cc_av1e_noc_ahb_div_clk_src.clkr,
+	[AV1E_CC_AV1E_NOC_CORE_AXI_CLK] = &av1e_cc_av1e_noc_core_axi_clk.clkr,
+	[AV1E_CC_AV1E_NOC_XO_CLK] = &av1e_cc_av1e_noc_xo_clk.clkr,
+	[AV1E_CC_AV1E_XO_CLK_SRC] = &av1e_cc_av1e_xo_clk_src.clkr,
+	[AV1E_CC_PLL0] = &av1e_cc_pll0.clkr,
+};
+
+static struct gdsc *av1e_cc_glymur_gdscs[] = {
+	[AV1E_CC_CORE_GDSC] = &av1e_cc_core_gdsc,
+};
+
+static const struct qcom_reset_map av1e_cc_glymur_resets[] = {
+	[AV1E_CC_AV1E_CORE_AXI_CLK_ARES] = { 0x4040, 2 },
+	[AV1E_CC_AV1E_CORE_CLK_ARES] = { 0x4030, 2 },
+	[AV1E_CC_AV1E_GDSC_NOC_AHB_CLK_ARES] = { 0x5024, 2 },
+	[AV1E_CC_AV1E_NOC_CORE_AXI_CLK_ARES] = { 0x5004, 2 },
+	[AV1E_CC_AV1E_NOC_XO_CLK_ARES] = { 0x6038, 2 },
+	[AV1E_CC_CORE_BCR] = { 0x4000 },
+	[AV1E_CC_NOC_BCR] = { 0x5000 },
+};
+
+static struct clk_alpha_pll *av1e_cc_glymur_plls[] = {
+	&av1e_cc_pll0,
+};
+
+static const u32 av1e_cc_glymur_critical_cbcrs[] = {
+	0x6034, /* AV1E_CC_AV1E_CC_XO_CLK */
+	0x6054, /* AV1E_CC_SLEEP_CLK */
+};
+
+static const struct regmap_config av1e_cc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xa01c,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_driver_data av1e_cc_glymur_driver_data = {
+	.alpha_plls = av1e_cc_glymur_plls,
+	.num_alpha_plls = ARRAY_SIZE(av1e_cc_glymur_plls),
+	.clk_cbcrs = av1e_cc_glymur_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(av1e_cc_glymur_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc av1e_cc_glymur_desc = {
+	.config = &av1e_cc_glymur_regmap_config,
+	.clks = av1e_cc_glymur_clocks,
+	.num_clks = ARRAY_SIZE(av1e_cc_glymur_clocks),
+	.resets = av1e_cc_glymur_resets,
+	.num_resets = ARRAY_SIZE(av1e_cc_glymur_resets),
+	.gdscs = av1e_cc_glymur_gdscs,
+	.num_gdscs = ARRAY_SIZE(av1e_cc_glymur_gdscs),
+	.use_rpm = true,
+	.driver_data = &av1e_cc_glymur_driver_data,
+};
+
+static const struct of_device_id av1e_cc_glymur_match_table[] = {
+	{ .compatible = "qcom,glymur-av1ecc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, av1e_cc_glymur_match_table);
+
+static int av1e_cc_glymur_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &av1e_cc_glymur_desc);
+}
+
+static struct platform_driver av1e_cc_glymur_driver = {
+	.probe = av1e_cc_glymur_probe,
+	.driver = {
+		.name = "av1ecc-glymur",
+		.of_match_table = av1e_cc_glymur_match_table,
+	},
+};
+
+module_platform_driver(av1e_cc_glymur_driver);
+
+MODULE_DESCRIPTION("QTI AV1ECC Glymur Driver");
+MODULE_LICENSE("GPL");

-- 
2.56.0

