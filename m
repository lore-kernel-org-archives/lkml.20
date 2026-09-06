Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2107144607B
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704307; cv=none; b=XNUISvGnlC3n6ll5mrPn2gil6tFuMBGMAiXeXdBTzrkQc7okCChr5nuy5YcL0Q84rhF7zKVLiKAGi5ewzQL9PDi0Ijx24+ZBMunnN4nNwIH1HzVc1ho7X1JiKcViOvIoNxbUFiOi/ESddC7hB+KNzUXgk2E4nOQXhFTaJhn3yzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704307; c=relaxed/simple;
	bh=hcr2VuSq3luKU7N0o7OKoFiCXrujgoCgSs38Groo04k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SIdtuticj+e+KK96NtxITL6EYnwE2vJTisjs5Vaz+GyTZj9MHp6aDGGZ9IDF7IAc4P+XgdDYKJJyEK06VPKEWRn0v7WigZleCawrLoMo5n0WZZKjW4hCI3LeSn1fEE4weW3dAaKLnlXE+kV9HDgA5Z2IBN3Lq/zamJfXC03JT44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQeyqJxZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S2Yt/Jxe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQeyqJxZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S2Yt/Jxe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686BpZGC1165378
	for <linux-kernel@vger.kernel.org>; Sun, 6 Sep 2026 14:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WkzilBYJTCvxB6u8kpbN/ZYJzHO8iax+7Bkft4FDrRw=; b=cQeyqJxZfHQb/huz
	ibsYOmnNwFOxBQKF94/WYerDu+iJ7uRJznCWzBHvw6BsVtyEidEAr8z3jxCHsVqG
	Eo4X+IJJOrLfh+EPz+tcYfpqH4zt2Pz2NeMoiRC0pKckATWbWCx8kyX7GbQYf8x9
	40iDCf7MGhdrppdaq8ZIgbZ+u776XTvy2tpOPS81bPL3uE3YMlkttt+UqJLMHskf
	b6jstesHtTnvcQYDCvp3Xt29xFqlgRAg0+Tj2gkOv+JrcDgsYhh6ny5dP3St9ojF
	IFXpD8lNa6J/2BdJEkyFH5bmRC0gb/DzeG69DtBLxjzsrmBzvDUFEFwI3VsBibDl
	1rPEhA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggb5vbebd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 14:18:23 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so3253271a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788704303; x=1789309103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WkzilBYJTCvxB6u8kpbN/ZYJzHO8iax+7Bkft4FDrRw=;
        b=S2Yt/Jxetz3U5VAAcSW7P8zRGn+TdtvMghWCb36OxQtGt3JEtDg0fUeRicAMKlxMoP
         lNnVv1ZjK5VSeIm/c6SlmjlomnFYQlerAVmt9yXXVM1k8EgDvOSyFgiFP2CzCKkX3/8o
         +2zmghDIBBR0O6Qq3fKlgGZuBCWGTSryGoQ6wDQosRQB0vTuCYQnxl+SYIFbO6Rqo6/x
         5S2LudTgdTj82/wZbpXfccCTElQUwJEqMJ/UK013UUq525M+1obCU/QayxkbVvG5wam/
         VOQ0eNm/8NJh4M/NG3Knr0bjUW5p2noWbrndxE4R0EUD6hpN0TASjW5Rl0PLSdBIyOoA
         QfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704303; x=1789309103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WkzilBYJTCvxB6u8kpbN/ZYJzHO8iax+7Bkft4FDrRw=;
        b=d3Oe8J4U65FddNTmIQu7BD0QHZGB8OcY032dMWw86H6Fym87M+zpIX5FSSZiSCh5Li
         bcB09iuFGipLHiZecIe+p7g0lexvlFW2krj0Bqh8hRlbtTnPSlWwo9+LiJ1LcZuyjQYU
         TamjZM7sJqmk2uJ7TBCDDn6BIy9ilIJbfleTTWjT0S5hwyMer5/LhD7XnNEpY1zc6aPA
         xkSPv9Ul5+ML/eBN+C+B2GP+zcNeM6ou1gGYJFeAFqI6xjmwZFWjeibUH9fs/17qpkEQ
         0H7tQv4l31Cr//Tw/1lTfLmjSdGn4YVmydj0aCtr3ZMcrZsJbQVUlGKzVs71oxBRErtE
         aW0A==
X-Forwarded-Encrypted: i=1; AKwUvBwvacK49x2msTOdM3LwfKzk5fQbxzP33H8yo6+sfI/0O44R6+t+VOov/wU0uxR+6Px4KicSW4O2cHhq6dg=@vger.kernel.org
X-Gm-Message-State: AFuF++l9OL6YhOhWnbdT9Bmn/siiYz/0aLfYhyXYE8v7Kl8LJrrz7G5O
	q5SMLww4jcke81qsh8xqU8B84Pf73586OeLBM4RHkqtc392iNhjVHhxR8pSpLlPNo2FIvfJ/x1b
	EaPYLaVfaaVaYvKezjjjO7z7LjPCSE8ZrE6mDJ1KKT5qog8vNJalBHVorbUZ81Njcdno=
X-Gm-Gg: AYBFou3Hn5+9QIghVG8WmF0xJ3RRfj+HDBPbfm/USqt3ocWPFiBlfLmbGBybwmfthl+
	p0gZApZZN1/vMhNUTxdbHxoQ72e4HZdv7mgr1SAoI7eFKt0rMK0fXw9R4WtWXtvTr1Ja4Qe0G49
	v7AOBHjnKuSczYWhd1gfTR+9d/pWD/dAK5Lko1L3uDwdpMx9f8usglfyb83m9nX1+rMQ97naqll
	Wb7WiwXije5aNZlR7Ek4pnp9qhfJ9ITiRJluIZs7ewAptuvHEsUeOdixJpvfOYsWCrpI86DqEPG
	9EUCXdhObMN7ge0VZdnxFX0iRyRoRmvUqo0xcENOK6W9iP8w1bMaNP/SBflotFNDWfWNQRuaoet
	MBMYPL2OZbyROkezHhAVQC4+vOgMnik6ExVFEflojGL4=
X-Received: by 2002:a17:90b:1d52:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39b260d338bmr27504742a91.5.1788704302975;
        Sun, 06 Sep 2026 07:18:22 -0700 (PDT)
X-Received: by 2002:a17:90b:1d52:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39b260d338bmr27504676a91.5.1788704302509;
        Sun, 06 Sep 2026 07:18:22 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm17904550c88.3.2026.09.06.07.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:18:22 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 06 Sep 2026 07:18:16 -0700
Subject: [PATCH v4 10/12] clk: qcom: ipq-cmn-pll: Add all output clocks for
 IPQ5210
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-qcom_ipq5210_cmnpll-v4-10-aec5ed642f4f@oss.qualcomm.com>
References: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
In-Reply-To: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788704288; l=3649;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=hcr2VuSq3luKU7N0o7OKoFiCXrujgoCgSs38Groo04k=;
 b=aThLJQ7pIMKXYqmCwSqvc98NeJM36lgwSCAxZ1RXx11AtuiRXNwFlV6bEKMhVhHglDqJT5L5z
 D7DJ8PINgAZAsYgksnyvfIF4fjOuAtPyxT8pYYDIBHzyR14mfUtFXYK
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: iSBnlF61LyMJdJisqnN6l9fyK_xPlpYb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX2Ne35CYwPxXB
 CzIOlAz2/pESH9OoXZF1dLpf9FV/PPVPsXwKrYz5iVg7halOMKxtewBj5s4mtzBcyuBFy4RjsOm
 tpdDWdnXyLGwtQokeKE/FnEs4Qp8DXgDdxHn6AIB71i5ignw+/TARGyAA0Bxj2v72ftUD/SInrd
 bncBa977pbiayI3CUOZZqWiCQQUQ4dT2/QB/OQjzfmyl27T2NphN3BXyGiPM/emkhKv+uejQfcN
 /Z18kBOR6vPDzV26fDFNJDbjz0rWG4IzmBvsPE54HNmKaVBvv/qTcdy0ceUv4+KCj6vIX6nC1eW
 Cxh1fvHBWuCwsqiLnCpOUGSJb9i2JDWrVsGcZrk7rPBkDtznB5sndxVRElnowAsImW/+0Ex7HUZ
 Q2wBXdb8YLsb8/3FaK6x4LmJFzi/byJH8ngmgqCxkBICHx+IVBvOBAy/aryK2oH4qDzfsnJmqHn
 amPxa2Tfx2oNgCmEKQA==
X-Authority-Analysis: v=2.4 cv=UO3t2ify c=1 sm=1 tr=0 ts=6a9d762f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=P04cmAjberRrbCkX5BgA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: iSBnlF61LyMJdJisqnN6l9fyK_xPlpYb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX+uMNaIMGVoPG
 4EO0VdJ7mr64ytGM0y4OGbkaqJo7ppZdV1jVeAqgB/orTLAzSIA7fL2HYDoqNflim4T3WtMQ18Y
 47MpN9q1/PLXVlWBcUkl3Em/6IcLrKA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609060159

Add the IPQ5210 output clock array and the device match table entry,
wiring together all the infrastructure added in the previous patches.

The IPQ5210 CMN PLL supplies 12 output clocks:

Fixed-rate:           XO 24 MHz, sleep 32 kHz
Gated fixed-rate:     PCS 31.25 MHz, ETH0/1/2 50 MHz, EPHY 50 MHz,
	       	      ETH 25 MHz
Configurable divider: NSS, PPE
PON reference:        PON (enable/disable + 8-bit divider)
EPHY-RAW:             125/312.5 MHz select

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index f94656b8486d..4e5ceae2e449 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -56,6 +56,7 @@
 
 #include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5018-cmn-pll.h>
+#include <dt-bindings/clock/qcom,ipq5210-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5332-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5424-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq6018-cmn-pll.h>
@@ -181,6 +182,18 @@ struct clk_fixed_gate {
 #define CLK_PLL_GATE(_id, _name, _rate, _bit)	\
 	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_FIXED_GATE, _rate, _bit)
 
+#define CLK_PLL_NSS(_id, _name)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_NSS, 0, -1)
+
+#define CLK_PLL_PPE(_id, _name)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_PPE, 0, -1)
+
+#define CLK_PLL_PON(_id, _name)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_PON, 0, -1)
+
+#define CLK_PLL_EPHY_RAW(_id, _name)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_EPHY_RAW, 0, -1)
+
 #define to_clk_cmn_pll(_hw) container_of(_hw, struct clk_cmn_pll, hw)
 
 #define to_clk_fixed_gate(_hw) \
@@ -200,6 +213,22 @@ static const struct cmn_pll_fixed_output_clk ipq5018_output_clks[] = {
 	{ /* Sentinel */ }
 };
 
+static const struct cmn_pll_fixed_output_clk ipq5210_output_clks[] = {
+	CLK_PLL_OUTPUT(IPQ5210_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
+	CLK_PLL_OUTPUT(IPQ5210_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
+	CLK_PLL_GATE(IPQ5210_PCS_31P25MHZ_CLK, "pcs-31p25mhz", 31250000UL, CLK31P25M_EN_BIT),
+	CLK_PLL_GATE(IPQ5210_ETH0_50MHZ_CLK, "eth0-50mhz", 50000000UL, CLK50M_EN_BIT1),
+	CLK_PLL_GATE(IPQ5210_ETH1_50MHZ_CLK, "eth1-50mhz", 50000000UL, CLK50M_EN_BIT2),
+	CLK_PLL_GATE(IPQ5210_ETH2_50MHZ_CLK, "eth2-50mhz", 50000000UL, CLK50M_EN_BIT3),
+	CLK_PLL_GATE(IPQ5210_EPHY_50MHZ_CLK, "ephy-50mhz", 50000000UL, CLK250M_EN_BIT),
+	CLK_PLL_GATE(IPQ5210_ETH_25MHZ_CLK, "eth-25mhz", 25000000UL, CLK25M_EN_BIT),
+	CLK_PLL_NSS(IPQ5210_NSS_CLK, "nss"),
+	CLK_PLL_PPE(IPQ5210_PPE_CLK, "ppe"),
+	CLK_PLL_PON(IPQ5210_PON_CLK, "pon"),
+	CLK_PLL_EPHY_RAW(IPQ5210_EPHY_RAW_CLK, "ephy-raw"),
+	{ /* Sentinel */ }
+};
+
 static const struct cmn_pll_fixed_output_clk ipq6018_output_clks[] = {
 	CLK_PLL_OUTPUT(IPQ6018_BIAS_PLL_CC_CLK, "bias_pll_cc_clk", 300000000UL),
 	CLK_PLL_OUTPUT(IPQ6018_BIAS_PLL_NSS_NOC_CLK, "bias_pll_nss_noc_clk", 416500000UL),
@@ -923,6 +952,7 @@ static const struct dev_pm_ops ipq_cmn_pll_pm_ops = {
 
 static const struct of_device_id ipq_cmn_pll_clk_ids[] = {
 	{ .compatible = "qcom,ipq5018-cmn-pll", .data = &ipq5018_output_clks },
+	{ .compatible = "qcom,ipq5210-cmn-pll", .data = &ipq5210_output_clks },
 	{ .compatible = "qcom,ipq5332-cmn-pll", .data = &ipq5332_output_clks },
 	{ .compatible = "qcom,ipq5424-cmn-pll", .data = &ipq5424_output_clks },
 	{ .compatible = "qcom,ipq6018-cmn-pll", .data = &ipq6018_output_clks },

-- 
2.43.0

