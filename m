Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AED41D641
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704299; cv=none; b=f6UxSHsXUJxtYx/igfdSDZwKyJzO4lVOr7nMUdnL5yrD1tNz79HDv1xwaApHA8wBXMAqOfWTy0KcyZHko6ason9artVOxkZ8izA5jv/12Uk1hPT2ujgp+VbxoNVKMkajniSDtBPsUI6oa7PNYG/4eWcFAegGOjmjTSPD0y9yMHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704299; c=relaxed/simple;
	bh=gxoQSeMomlLlSgismEZYS34EWU7wg4s4uQ+gewbEBP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YROGBxxjzYRikXvxUFKyYgMe3SlSdX/ysYSyPG1AJNXz5ABAH4w1SnEPBw/hV58wk9VUMyhnRzKo5jcHy5gBwaHvnu81OqbpekIt35RupeB0o6ZbmZoIEeCiV1Lhd97Dr0Ry+00g92tT9eeIucT+XAZjrXSvm8Bgq8r5H3XTjUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dk/0w84e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PqhCt8vk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dk/0w84e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PqhCt8vk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68600DXr3654355
	for <linux-kernel@vger.kernel.org>; Sun, 6 Sep 2026 14:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h2LmOSNQ0tfPY2I8tKBVudBy9g7Ot7SAmrJJh3YTOxc=; b=dk/0w84euvhzt7/s
	3cZDvVyTBBXDZ4jtXQQfQx1qMzwYA+CDjwhO5RZ12+q9x6TTi82VrKpHerdkx2Z/
	9lpGmmFQdiLf+K51Y49bDXSRh7NlWZjrOVya3mxoR0QFtA3M3QydCwVMNqB5hWHt
	DTV//3EvI/UGX2TiObRK2SVgrqW2hXB27vMTZq8KYMKoEwiU/beo93LQc3B05FpR
	y20AMpaYTU3m+vEdWXw7lwOeMFZSWxymu6UZrmnfCK1u7Maf2vdNkP1qcDbwXAaH
	qz2C9TKdQFr/kOhkH59a+7xtFrm+Ajbw4n347rfHF424XzJvzXtn/03kRLVz5cH/
	KS43tQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggadhkjcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 14:18:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d55d8cd938so45049145ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788704296; x=1789309096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2LmOSNQ0tfPY2I8tKBVudBy9g7Ot7SAmrJJh3YTOxc=;
        b=PqhCt8vknPyeZxZ9FUjGkl3BBGDhbCeKwh2AQE5ftVo+SLRl0HBjwbDoYEUwuX0Rmu
         +XykZsBvQ8sjlN5iTGyoAGO9LPyzIe8z7hBQ+9HZb8DqR2e+SAvPEbjNNdg2IqTtwE7t
         0HDQNbWpNsMVO0bG3LXby2bRkyNTf81Ke2yjWDyKk+BJZxjNfVRfCxlsPrw6MhNkeZj7
         WcUtnGp5pQNQ8V1MxQY9JQLyJxL1GjfCbzT8LLOsJmOs9NLP6jLM3G9lcHbpSGV4c8MY
         e5FWHEUiMJO/588aj+U4AHk0cxlnbxWmciXNkYgfCivd/xdC4RNQ6piHXQzfPZoXF50/
         3QrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704296; x=1789309096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h2LmOSNQ0tfPY2I8tKBVudBy9g7Ot7SAmrJJh3YTOxc=;
        b=HKfbT+gKGYYwqSASizMWrbajNsFvaHV4EH9OcZ5U7bHX/bjcQR5TepA5d/ZpTXrYfC
         3vsRiliVKSjoA6Fj/AW+Os5xddMNQxapp1oogEQOknym8As8WdTCbkb7ZySJ0lcaVH5z
         W5V/CugtysdXGMKpKBnV89mbv1CxKT6mcmTKWaETt/7TmueHSM5xVfCicjLL4AKc6fBd
         XtVv/MSddxN/nd+sS7K4cunNWrYaFzzVrdcZFHoTmeCBf7pqOwCQDgt+LC2oqxc2gyDg
         Mko3gTU5COI8akx7YW8E0XEeNtIeVNoZq5kN30c0aCxfL6QNOA2TC8KfHv1GT0SRKhJS
         8e+Q==
X-Forwarded-Encrypted: i=1; AKwUvBx0RVXIyVcLaCbuWh90EOk2QRkyvpOVH1Bg3TFehJeKajLB7E9wnkt7RoJdKEvULhdj4Gn84RuQ+e3x498=@vger.kernel.org
X-Gm-Message-State: AFuF++nw3MLPV/OCjArm4eW2S7Ueo5l+CpZphnSNIuI5r2THIe70lPSZ
	r2pfNQh4HLPoArGx2AR+BmZv8fNcVDzbqwN0FCDerUL3SIYfV90GB9CvPJVj27P13peDgG3e12f
	3cxzF8kJB6adoB+TschoS05nW+e0awm3VCyPCnTBdqEvT8YTygT04CR1+X2TvMMY++aM=
X-Gm-Gg: AYBFou1NxMUGv+wUqVnmGXoYzhQ1FoQtnypRJ1ArrtzJZcvMZFoPoBbM/odUmbqaVVN
	ztSTOYrmYXfkK3j7+F8gbxBUjL28Dqi3MIGRS+CD6ZfMuHAVHBSPtqEdJ0ktipKLPbdw5JrAkIA
	iMfwxqhMduuValxpaBJIy9zBGWNF6NaKueT76/uK9oi25ILvDlUyV39FXvRCpMUei5qk9blVcpf
	bPB/1mh9olUtrVoppiFgAY+vi04/ko1VqUZldEf62tDARWy/U9F/FV69H91+5A7aNN6VorD5hqO
	odI3fPtILH/24uLQMs0bh4/MtxbMA4IlAN1fNwU0XNO7QcHyAZkvQcyDdxbkfFNcFlexdCwSc5d
	Z6x+mR/mdUs/ScWXTuhXIZUf9yl8LhQRdRSqVTshAiU8=
X-Received: by 2002:a17:90b:17c2:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-39b25f1c5bdmr25232887a91.0.1788704295802;
        Sun, 06 Sep 2026 07:18:15 -0700 (PDT)
X-Received: by 2002:a17:90b:17c2:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-39b25f1c5bdmr25232829a91.0.1788704295315;
        Sun, 06 Sep 2026 07:18:15 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm17904550c88.3.2026.09.06.07.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:18:14 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 06 Sep 2026 07:18:10 -0700
Subject: [PATCH v4 04/12] clk: qcom: ipq-cmn-pll: Register CMN PLL /2 clock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-qcom_ipq5210_cmnpll-v4-4-aec5ed642f4f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788704288; l=2809;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=gxoQSeMomlLlSgismEZYS34EWU7wg4s4uQ+gewbEBP0=;
 b=lL2f7yhu577Z3kaxQivGtNNGXXMQoDyrqm59F3pdMyZFS856aGeWn8pM//2J+WBUniT9uJXjX
 BSFvE02wcDXAkXpm8pDrjhPQV+Dit/p9Tu1vAzAJh6Z7qLMp8/ds1Vc
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: 7cUUaJYYZQtMyYw8DqdWd0TNx87SsMvA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX/nCy+uunhIGb
 ABPDLhm+TKxn2g+ZZ1fbiORM/QcX9gvO8MyMVWfjlvJYbvzku7PmH5pZbeh1c1hVdkiT1vQOh3v
 H7hGAj1NxBAMgA32deSCPu5oY8nYR/7uZPedizCzcM8z7Oies2sfP2QSxQ/9rEQ/ooZls0gEIL9
 ADThSoZoFHZKw5bqDm2hnCHqaZ/HapRn0wipS9jEoooKK0eF4bJowPFVeRpT4YmFpXlR5n0mNrU
 CJwgwC8VwOpywEzU0gOTYyFy6TkaeJW0vpw+kKSI3ZqDj6xxoIsHhDSQ0px5X1YnMm2EZ8Jkb9Y
 soPBMOrLlh4cWraBMkgdnmtHCX2u7GhkbYmBSfrSeicuKe6ZPmJt0Uk2X9pQ0h286mrUcEPY0UK
 FkMmfqtHuLwxDjdhZxl8HXcFgAdP7h28ZlNCJDukA9N/DPim0m98Y46FnP5eNMnR/u8a6q+Wp81
 F87FNFwiGbtnlL+GFHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfXzGRln1J+HROv
 wyHst1LaD6JzABPDSR/42gHcVNPY3lzyP8xrtNv/Pj2z3ALg3fv449f2I0nTL+wnnRl7KqgQUTx
 qTT98JN2/4lUNzlEWVV692C0s2At4JE=
X-Authority-Analysis: v=2.4 cv=OceoyBTY c=1 sm=1 tr=0 ts=6a9d7628 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=LIjNjOY4wKn3Yy6eg_0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 7cUUaJYYZQtMyYw8DqdWd0TNx87SsMvA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060159

Most CMN PLL output clocks are derived from the 12 GHz PLL output
through a shared, physical /2 stage, ahead of any further per-clock
processing: a gated fixed rate (PCS/ETH0/ETH1/ETH2/EPHY/ETH), a
configurable divider (NSS/PPE/PON), or a rate-select bit (EPHY-RAW).
This /2 stage is present in the CMN PLL block on every SoC supported
by this driver.

Register this /2 stage once as a fixed-factor clock, "cmn_pll_div2",
and store it on struct clk_cmn_pll so the output clock types can parent
on it. The two plain fixed-rate outputs, xo-24mhz and sleep-32khz, are
the exception on IPQ5210 SoC: they stay parented directly on the main
PLL clock.

On SoCs other than IPQ5210, every output clock is a plain fixed-rate
clock (CMN_PLL_CLK_FIXED_RATE) whose rate is a hardcoded absolute
value rather than one computed from the parent rate, so this /2 clock
is registered there but currently has no consumers; IPQ5210 is simply
the first SoC in this driver whose output clocks are modeled as
depending on parent_rate, which is what makes the /2 stage significant.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 4fdf78f6829e..c86f7982607c 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -96,10 +96,13 @@ struct cmn_pll_fixed_output_clk {
  * struct clk_cmn_pll - CMN PLL hardware specific data
  * @regmap: hardware regmap.
  * @hw: handle between common and hardware-specific interfaces
+ * @div2_hw: fixed /2 clock derived from the CMN PLL output; present on
+ *           every supported SoC.
  */
 struct clk_cmn_pll {
 	struct regmap *regmap;
 	struct clk_hw hw;
+	struct clk_hw *div2_hw;
 };
 
 #define CLK_PLL_OUTPUT(_id, _name, _rate) {		\
@@ -362,6 +365,7 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
 	struct clk_hw_onecell_data *hw_data;
 	struct device *dev = &pdev->dev;
+	struct clk_cmn_pll *cmn_pll;
 	struct clk_hw *cmn_pll_hw;
 	unsigned int num_clks;
 	struct clk_hw *hw;
@@ -388,6 +392,14 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 	if (IS_ERR(cmn_pll_hw))
 		return PTR_ERR(cmn_pll_hw);
 
+	cmn_pll = to_clk_cmn_pll(cmn_pll_hw);
+	cmn_pll->div2_hw = devm_clk_hw_register_fixed_factor_parent_hw(dev,
+								       "cmn_pll_div2",
+								       cmn_pll_hw,
+								       0, 1, 2);
+	if (IS_ERR(cmn_pll->div2_hw))
+		return PTR_ERR(cmn_pll->div2_hw);
+
 	/* Register the fixed rate output clocks. */
 	for (i = 0; i < num_clks; i++) {
 		struct clk_parent_data pdata = { .hw = cmn_pll_hw };

-- 
2.43.0

