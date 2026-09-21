Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BAD36894D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971646; cv=none; b=fmRBayS/nrR8PW5wC4T530IM3R5t/ekd0I/q7n7w0kipkeTP6SblTC7bzDMxcEX7S8FhfSGmg++8a6S1cFYj+QFLp4iaVdL+oLoZX2Clk3oO99wu8ghxMm8T0gY46+xxiENffcOL74upXKpLz6kyi05kKmCthSeA2KY4UxAdEWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971646; c=relaxed/simple;
	bh=RUL7inyPVfMEDIdTmDPbTdi75bTvJjeuqLU+fEENxjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u/VWsrx31BJboul/bhVR1G5SN6LhxrAP/vy+YQxpdiymYgsnnav2bOdtFi64ZrsFoLCu7AYrqTin7NF0lq7H0YUnl98CmG43q5EVrGS04iRMjYf8d7e6MVJWrC0dV6BRqrTYSgFQ+WWhdgVa6jH6NSK4iJlL40otpvWpsf2Tdn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T34hDf+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LlBjWFCY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T34hDf+j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LlBjWFCY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3ZOQM3680997
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LDoqZrmU3C3bo0NhJ54zUh0/kmQH/pV2aeGmRzr4Zt8=; b=T34hDf+jP9P/ZCz0
	bhbJQC2Mxsi0e3PoP6Jtuqwr3Ue9cwQ22MzHQvb8BeriEUnBV5z9FANQUHLfZHp5
	EoooTHF/V07VBbXgf2IH82y/chc4RP3Usyef13bbOqo+HFG3mqbwIwFgDRwJGjnl
	1GFKrydgXlGmKyUoNvvIjLyJwG/AEjyBn/IiziyjGjYCidqwA2eWTQIQjB2rtmhb
	bqFe8vszG172gonOS00TwCQBWNn3b/M6mwKE0IOf2aUDXoxV7si/P37R6JKmu2cK
	w5JZ4+AESeZutt7dIiyanrGQxcgXpcCunAxymQziDrRZZECe0w9h7mAph2/hgS88
	PwC0qg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsk5emwpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:20:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso6142243a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971643; x=1790576443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDoqZrmU3C3bo0NhJ54zUh0/kmQH/pV2aeGmRzr4Zt8=;
        b=LlBjWFCYPwa0KALVt5jwhZDfy2kVC7Foig3KG0w+NAi3H/nNzPloZ5iBlqhUAH8pBb
         /BqOOGQAf8guuhFDs1Vu72sZlLHgwOS8aobDyVoyhZkR1F5pHF223ydrHkfyJ+Syfq0y
         ouX9fXtBrovyhcjlwyDpj9kiY8756AHMUCWe5kYOQHjtIrF0U3p9clkiJNf3l9EDWF6K
         j0Atpx+5HKC3pVs91U58zKsUzBTeOtdsSOUZOVSozsKuP7Zb9NkyJn+Sqzx3mqFZ00xV
         jHUkP/VTomxAekWaDNMtvUESf7KIkv4oGZOZySfNaoEvknw6OuF3YagNOwtqe7m4jN6/
         48Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971643; x=1790576443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDoqZrmU3C3bo0NhJ54zUh0/kmQH/pV2aeGmRzr4Zt8=;
        b=Q4PD7YaLG/UrF8DxDmqvpXZ9YgVxH6Fh7FsZELhGm3TQtGQIJXHSUOB4r9xnuAb72N
         slEwoccHdriHU1adB1kl643s16cMmFuKWh4TxuMLWQlKnR7ZXv8+9Of4YvMWby1+pm/t
         n1RVw2waEJeebiKOh6SVQ5y36g8VWQYIqm5AWFNCRg6Zg5R1R4HjJM3HDXZdQvRhDKJt
         9pMPcGQM/EU1dEuy/aCh2FSThQvou7jkuPqjmitLM7vfn4Ew9JQIAJmLZXsrpbt743hE
         zEa5HH89nsLOWIBK6VdV43vOoc7YEmx9ukA+2/W9I9D/79+pcixH7oMi13ouUqEcyuIF
         272w==
X-Forwarded-Encrypted: i=1; AKwUvBzBbKlP2BoyXrFhp356fJ8ZYZR3vZX5kbwnFp7Ne2XOTv0CVgPIOyes89BWVh5kyZDdQ2QrDz0kBlos/yQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kOc84wjuVAuV4zAckYoVim022PvivEV4aZq/0XAVbyGlq8KTCH
	hU/rq4TEbEBbAWa77RMYipN23aM5lk95bMxqgEySDW2iBDQ/6/xoLEmXTknsHTeDGB50rT7BHea
	POb/RiV+ommdlhw68zhvqfBwHGwNfD5AlLWlvtQ0O3i61Lk7EAwOjhDr+rtfL1yfDIMw=
X-Gm-Gg: AYBFou3mSeQMwAjaBzuNkLrLfjMZFM2x3/LqVEn4KDD2chA5RWLSiSud2YUYvh8CfCZ
	i23uPngBRANILwoclI0CUE5PMtc9BuwOA02wmwJFNTPjJpGBw+ZP5v0ZUF79ElY+/MYUGh7iccB
	LklRMaNBe4kFZkYMAIvA20W4BOGRF43qF9VNe1MipFeOTqYuv1n1eHwiIes4cIGC878FWd1OkBF
	u1CSh9OVhy6zOFH+2bbYabo+11Ph+uO/GH1kWshRfSkqZCQoGUme1W3ZRof/FD0CXgniCR47LvJ
	p5d9PM/5rc7UVaieif60tbzWwVYwrer97FC15rTW5S9NlN/7Jkjot4qu+jC/3cvtHbuDdUSHkBb
	f2ByUi/zAXFh3lQai+tD1zvf01V8auFZnJsojT6jrVr0pJZE+t+e3m+UcCSYPWawXi92buiMi+M
	Z+k7mR+Q8g/PXoJHAXxsWRof6U2NUtdU2I4Q==
X-Received: by 2002:a05:6a21:596:b0:3b3:216b:2743 with SMTP id adf61e73a8af0-3dd8c3f19acmr18925086637.4.1789971643290;
        Sun, 20 Sep 2026 23:20:43 -0700 (PDT)
X-Received: by 2002:a05:6a21:596:b0:3b3:216b:2743 with SMTP id adf61e73a8af0-3dd8c3f19acmr18925047637.4.1789971642854;
        Sun, 20 Sep 2026 23:20:42 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:20:42 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:41 +0530
Subject: [PATCH 08/11] clk: qcom: gcc-ipq5424: add the MEMNOC clocks needed
 for the NSS block
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq_clk_changes-v1-8-d242e3d49648@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
In-Reply-To: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: Kd6pOeKKMxwstCociRGmY847mIPTv8sd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX82VazWyLanUP
 aNJiF6sxSw3vf0nhzmkF323bY2dwAoQeJebZTcYqKS/5phpRUxf7TTRa5RGmXhRLxlETec3NWLY
 fU3p9IjAHPhX5lY6PfOudUTirPPr9J8Ra0eXFYY1hyO/VvJrG1CvYvM9bzbHXPg6qSvd0L+Wq8p
 +GE7yFaGR3VdqrUx3bO8QfA1GijF0qVFzOYELoM+ol805VHdhKxGqXy7W49Q7QuNKlfeBMgZ+Pp
 SKLZB1VOvIWrGYHQzmkvSnLtz+wfQznkyy7P2PszM0jHd4rwnai59XpOQ0THqDyYdGdVbR9YVYl
 bX94yAlp4acS9nra6TG08H9XcuhGJtN2O4rwg1nC6e5CcB1yaQFavGoy0K2pudlFbjoMIX7xjGP
 u+orKTjeWes6G8futycC/iFt5+emv6WJg7y4+oxl+gBtxHDVc4dH9BRhdCaugYiabBSwPeg8RDd
 baHZiL2du3/EMDilmkA==
X-Authority-Analysis: v=2.4 cv=f8Ddl+yM c=1 sm=1 tr=0 ts=6ab0ccbb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GGYtgJ29c02LjanIf4UA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX90q2nY/mkQ6B
 ULJRGi9VcnlSi2tryjbApadyXEW7tFAOW6E5YlXf+HUmDFAneSMzwNu2Wti8EPsSVFBg4VzXmfw
 8Pj4lcpliuqO/q2MYHh60fgR7fdpqa8=
X-Proofpoint-ORIG-GUID: Kd6pOeKKMxwstCociRGmY847mIPTv8sd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210089

Add gcc_nssnoc_memnoc_clk and gcc_nssnoc_memnoc_1_clk to the GCC driver
to enable the NSSNOC-to-GEMNOC path for the NSS block and expose them as
ICC clocks.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-ipq5424.c | 93 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
index 3ddd4b3aedea..34d1157155e5 100644
--- a/drivers/clk/qcom/gcc-ipq5424.c
+++ b/drivers/clk/qcom/gcc-ipq5424.c
@@ -34,6 +34,7 @@ enum {
 	DT_PCIE30_PHY2_PIPE_CLK,
 	DT_PCIE30_PHY3_PIPE_CLK,
 	DT_USB_PCIE_WRAPPER_PIPE_CLK,
+	DT_CMN_PLL_NSS_375M_CLK,
 };
 
 enum {
@@ -47,6 +48,7 @@ enum {
 	P_SLEEP_CLK,
 	P_XO,
 	P_USB3PHY_0_PIPE,
+	P_NSS_CMN_CLK,
 };
 
 static const struct clk_parent_data gcc_parent_data_xo = { .index = DT_XO };
@@ -291,6 +293,20 @@ static const struct clk_parent_data gcc_parent_data_11[] = {
 	{ .hw = &gpll2.clkr.hw },
 };
 
+static const struct parent_map gcc_parent_map_12[] = {
+	{ P_XO, 0 },
+	{ P_NSS_CMN_CLK, 1 },
+	{ P_GPLL0_OUT_AUX, 2 },
+	{ P_GPLL2_OUT_AUX, 3 },
+};
+
+static const struct clk_parent_data gcc_parent_data_12[] = {
+	{ .index = DT_XO },
+	{ .index = DT_CMN_PLL_NSS_375M_CLK },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll2.clkr.hw },
+};
+
 static const struct freq_tbl ftbl_gcc_adss_pwm_clk_src[] = {
 	F(24000000, P_XO, 1, 0, 0),
 	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
@@ -1108,6 +1124,41 @@ static struct clk_regmap_div gcc_usb1_mock_utmi_div_clk_src = {
 	},
 };
 
+static const struct freq_tbl ftbl_gcc_nssnoc_memnoc_bfdcd_clk_src[] = {
+	F(375000000, P_NSS_CMN_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_nssnoc_memnoc_bfdcd_clk_src = {
+	.cmd_rcgr = 0x17004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_12,
+	.freq_tbl = ftbl_gcc_nssnoc_memnoc_bfdcd_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_nssnoc_memnoc_bfdcd_clk_src",
+		.parent_data = gcc_parent_data_12,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_12),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div gcc_nssnoc_memnoc_div_clk_src = {
+	.reg = 0x1700c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_nssnoc_memnoc_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gcc_nssnoc_memnoc_bfdcd_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+
 static struct clk_branch gcc_adss_pwm_clk = {
 	.halt_reg = 0x1c00c,
 	.halt_check = BRANCH_HALT,
@@ -2793,6 +2844,42 @@ static struct clk_branch gcc_pcie3_rchng_clk = {
 	},
 };
 
+static struct clk_branch gcc_nssnoc_memnoc_clk = {
+	.halt_reg = 0x17024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17024,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nssnoc_memnoc_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_nssnoc_memnoc_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_memnoc_1_clk = {
+	.halt_reg = 0x17084,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17084,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nssnoc_memnoc_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_nssnoc_memnoc_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_regmap *gcc_ipq5424_clocks[] = {
 	[GCC_ADSS_PWM_CLK] = &gcc_adss_pwm_clk.clkr,
 	[GCC_ADSS_PWM_CLK_SRC] = &gcc_adss_pwm_clk_src.clkr,
@@ -2938,6 +3025,10 @@ static struct clk_regmap *gcc_ipq5424_clocks[] = {
 	[GPLL2_OUT_MAIN] = &gpll2_out_main.clkr,
 	[GPLL4] = &gpll4.clkr,
 	[GPLL0_OUT_AUX] = &gpll0_out_aux.clkr,
+	[GCC_NSSNOC_MEMNOC_BFDCD_CLK_SRC] = &gcc_nssnoc_memnoc_bfdcd_clk_src.clkr,
+	[GCC_NSSNOC_MEMNOC_DIV_CLK_SRC] = &gcc_nssnoc_memnoc_div_clk_src.clkr,
+	[GCC_NSSNOC_MEMNOC_CLK] = &gcc_nssnoc_memnoc_clk.clkr,
+	[GCC_NSSNOC_MEMNOC_1_CLK] = &gcc_nssnoc_memnoc_1_clk.clkr,
 };
 
 static const struct qcom_reset_map gcc_ipq5424_resets[] = {
@@ -3264,6 +3355,8 @@ static const struct qcom_icc_hws_data icc_ipq5424_hws[] = {
 	{ MASTER_NSSNOC_ATB, SLAVE_NSSNOC_ATB, GCC_NSSNOC_ATB_CLK },
 	{ MASTER_CNOC_LPASS_CFG, SLAVE_CNOC_LPASS_CFG, GCC_CNOC_LPASS_CFG_CLK },
 	{ MASTER_SNOC_LPASS, SLAVE_SNOC_LPASS, GCC_SNOC_LPASS_CLK },
+	{ MASTER_NSSNOC_MEMNOC, SLAVE_NSSNOC_MEMNOC, GCC_NSSNOC_MEMNOC_CLK },
+	{ MASTER_NSSNOC_MEMNOC_1, SLAVE_NSSNOC_MEMNOC_1, GCC_NSSNOC_MEMNOC_1_CLK },
 };
 
 static const struct of_device_id gcc_ipq5424_match_table[] = {

-- 
2.34.1

