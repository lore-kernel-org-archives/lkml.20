Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014220;
	b=ZQgGe1tWkymThq4BAe0SQwZKe+hM2f9O7Gqv4Kj9nwsYZl1ogzbj18e6B96D2X8L/K4b
	 w6p2w9hcDjVfnnRTE1e1fNSvuWJSUXWcF3K6cWLdtWIoGBqj5N1EGE0t3AZA6cyLMTY6x
	 HCs/E0EdnbOtohIez0wPFReWCadtNl3a58oUk1rrHlyr9EWv5hWKd1zXoPiaVFW3ZWx+F
	 nFCnteOX6nV2FebEOCSYV9/Qi4Mj0uA+wqAfiqvTNkQj8IOw9+SbcYybkEKQp3doaAq/3
	 cGE2NNN407BuIfmuhSJjbpmrXphs2OYBXkYhKBBYQIqn6ar9UmKc8viA0P3c/5x5/3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014220;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aeF/SIMKp1AhqcMN428zlJG3WBlYI6x0ZLS3Cwh8XwU=;
	b=5MH72vbcT3pPDxFhxJIv6Ljfo5CB9K8bXl7g8hoeQce1lVJJYM7u5ozdbWc9SmF+KaXl
	 hiehbMlPPpLLDR4YS1N1xOBsSz0L5m/o7NvJtOJk8lcGaBKUgJIoyLdwZ5TtHd8BzJXgX
	 eD3iO6ObkZ1IbxsYoLN2O3Wwd+1Xl3BOYTGAv4ekjxVb3p/ytANHEg1189Nmpih5REFNf
	 FEikntfveAZ3hSy29mcA/z4JDRc/g/en66dJCQNWg8TBYY7/e7g1P15I6yrX8LRxaHNJn
	 xYBWofjJKJlWLg7rLKHDf+rzoetwSrqWhBYR8zYZPsCtPVq1FAzJYUf7VEtTkZ3ta/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S4qG6BFZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VI57qAbO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E9D60A2614
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08E9D60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S4qG6BFZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VI57qAbO
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtJsL3085733
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aeF/SIMKp1AhqcMN428zlJG3WBlYI6x0ZLS3Cwh8XwU=; b=S4qG6BFZIZ7R887c
	q08zSadn5YqdRl465l1JEkvMZtIQ4Iur6HbCjN/4lXxcggrGkZvAHSKe+mVZpeix
	/fM7kh8y/aw0dVx2b/TjjPbZZmJNg/3vK4Qw/hIk/IccKY325p2fQFeH/wE7mL/j
	Q31qOcW7rqFOO90kZLb/+DruiVRO5JjblKC4q+ZMhF4lyDh0c69Mj5mLEmXmMtsL
	1eAoORa4Z/eZgIEBK4agkqqlcUqFfpgaviNBcCjXR1HfuzaSFJe6bk3zNIF6m2l1
	XJblOSKdSc/w0jlfsQGgyaP/FL79/bTpUAOKMvYa19KdpXA/W3nNhqzYWWVltzZn
	gMZZlg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3p4fu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:30:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso4776177a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014218; x=1793619018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aeF/SIMKp1AhqcMN428zlJG3WBlYI6x0ZLS3Cwh8XwU=;
        b=VI57qAbOjSXEmndXRV0/G3nQ3P2j92eK4gCPsCLluiCeUy1NB2tBG8oiuS6oMS8pfs
         gJghGeC3QqYfpI5K8X2SE7HSLL7bdBWSeEfka6VmotkVjAdkFYeGDVvmrUA18E+I0dwe
         /9pXZDEfmupePfFpcCAE/ke7x5ouyKFA4fiubdq2LImcjr7kb/j1NFUXctLaIiL6M2dq
         xL5CUgbiVjsOrMkbwTmtqDBQfUGdv4rp+jY2HCP9iTmpLrGRIQy6L0na4sckc2VdWu0T
         aENsCvc/JmNGnUIhEeH/HTzG8Ntdc6wXp6x+TghwdeCES8xOGqKUhgBx0sLZvSYVjxmo
         EuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014218; x=1793619018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aeF/SIMKp1AhqcMN428zlJG3WBlYI6x0ZLS3Cwh8XwU=;
        b=eqhfmLLF+oWrXwewq7WFdVg514fiAh6UCMCwOfAkj02ZiliTqyFyeHuaCqIuBAJ7eJ
         wupQllwu4PKBYId4NdIf6WNh5/s/VNXOx6FqyNGTJVjPtv145i+Kti0JJsWaYqipNmS3
         7qiSYCBsDrerT2i+7k/52kFAa2Gkd62be20R3ePf+mR9MYcH908009iBqg5MxodsfAR2
         T341YNwCP3qDTW5/4YJhHSxSRTjcXS6eZt2W2jDqX7b3MF74EM4jz3WyZdaFiDY/weZt
         BK9KIaUU7Jh0ksyyTcZ54GA9qTdxrjuubU8vNd3vciFUBiRWDOdos4ZrvCb9t9lln2Qj
         tdaQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8ulxMKB6WWkBawvo4n+gZLQgtf0rYFbXRKAmG5OwUhmDKsOruZaSs8nBRQ8oz65+BQlrH8ZIySB1OS9g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIx9bnc7N11RLWGkBTWLSeaXHnrumauUsyoRW6FQX4lu0Q1pOzr
	D/+fzXuNIswVQg8YDQhcfnPBDmdPixcCYfFMFzAfiNB6aNEK2Vuru0aZmVXzo8bQ9caw+nK1xQY
	FYzlm/wetwcxDbfCZB79YJ6mqvr/4sxcGSN3qqfbij5V+HIq396q0JbUb+1DLkNx+M5A=
X-Gm-Gg: AYBFou2L7M/tqVgd86kMCXp4S23XARCTsw2v6lvW3ZbIdyWsqjG7vUwEmHkXY2oFCu5
	8jccY9ddwlkM5CJaLH8mXWfoSouZk7GxKoELN6MUcIN/pmDVVIXR1tfpKuuhcZ22Q5BMNd9xPwn
	xj9v2nJS6CQ2aWUo19ecRBwVPbe837463r2X1/QPbtLtcvE/4rbJdJcXCNPr+b0W97Q9ZAn1xUZ
	AjgbaDCURrJPSYqYTJcibmWHx9hvI6HMfyMKxlYCy3uxeZccaaSdLcsFLYKTSBmPGbGUwYe1s+A
	XxYkVuBRBRjAjaziUXhGiDS7F8apujTZXISUqSF74sek0MZTkZ+Pjw9hiKHvlZd6V8tSJBWxCE5
	eE+2oihvdFlDgOwL8uPWt5Yg=
X-Received: by 2002:a17:90b:5101:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3adea0a4d0bmr5308444a91.9.1793014218333;
        Mon, 26 Oct 2026 04:30:18 -0700 (PDT)
X-Received: by 2002:a17:90b:5101:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3adea0a4d0bmr5308404a91.9.1793014217632;
        Mon, 26 Oct 2026 04:30:17 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:30:14 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:30 +0530
Subject: [PATCH v2 04/12] clk: qcom: gcc: Add configurable PDM XO4 div
 clocks across targets
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-4-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: mrgqc7yVzpkGrvfAWVWvDFlj7hf84KYy
X-Proofpoint-ORIG-GUID: mrgqc7yVzpkGrvfAWVWvDFlj7hf84KYy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfXwbVBAOnGdSBN
 bPIqd5iMEr0DyhYFr+giZewVbh3IYGXvgiSYECKL3HE5S1XnvEnKUJbgjJo/l29UYPCsPKz5/Dn
 +MrWDuT5ZabmlHVPy11ZPn8KL7p4+oU=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf39cb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=l3K8MKQ1fDOuS62S88UA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX22GorhsKtIFJ
 O9PfP2yCPg7IMRrMsRV1OUoluQ7SxrgE583IjbLG9kW1QJxvksk3xJsL0pLcIl9kL64p+uG92KP
 awpYIEEs1a+eWNAEXfVQR2R4kOpcLRAeQ5IyoaXT3Fvzc6jHhsj7inv+rfHZ6mRuj2nCSSN2X5X
 J31XekrHwidYrLkHtTsPdfRFk3W9R1bZIgtJch33VmfjylDPIO8pATju2kFl4FaBDNivfC8U7fu
 46loOnYU8LCEqP/IqogNZ6rZaeYXu5/rFLG2jVSu3tzlgo4uasl1QJ9SUIEMJhGO+O+K9vgTIl5
 YZ37JX0QCMQgxHNsWy6AkTiDGSXOaA04+lmH2CuFn0MOmf0pWmGi5eGVHc/npoBY1eYfC8xkHk0
 cnODm9/TOnDlSdZuu/uC3ufZLP++VTqu8JHKCe7Fm20wofQyKTNsvCxxQFnplHYM2OGlF3TZGGb
 WKgeXUtOJXJJMXoKZxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add PDM XO4 divider clocks and make the PDM XO4 branches propagate rate
requests to them on QCS615, QCS8300, SA8775P, and SC7280. This lets
GP_MND select the supported PDM source clock rates.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs615.c  | 20 ++++++++++++++++++++
 drivers/clk/qcom/gcc-qcs8300.c | 20 ++++++++++++++++++++
 drivers/clk/qcom/gcc-sa8775p.c | 20 ++++++++++++++++++++
 drivers/clk/qcom/gcc-sc7280.c  | 20 ++++++++++++++++++++
 4 files changed, 80 insertions(+)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index e096af7d82bf558bedf524eb2ca959f3e9e5c22e..9b558ea023ad62e6d465155e21c54376d7b99732 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -1654,6 +1654,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	},
 };
 
+static struct clk_regmap_div gcc_pdm_xo4_div_clk_src = {
+	.reg = 0x33028,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pdm_xo4_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.index = DT_BI_TCXO,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_pdm_xo4_clk = {
 	.halt_reg = 0x33008,
 	.halt_check = BRANCH_HALT,
@@ -1662,6 +1676,11 @@ static struct clk_branch gcc_pdm_xo4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_pdm_xo4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm_xo4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2802,6 +2821,7 @@ static struct clk_regmap *gcc_qcs615_clocks[] = {
 	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
 	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
 	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PDM_XO4_DIV_CLK_SRC] = &gcc_pdm_xo4_div_clk_src.clkr,
 	[GCC_PRNG_AHB_CLK] = &gcc_prng_ahb_clk.clkr,
 	[GCC_QMIP_CAMERA_NRT_AHB_CLK] = &gcc_qmip_camera_nrt_ahb_clk.clkr,
 	[GCC_QMIP_DISP_AHB_CLK] = &gcc_qmip_disp_ahb_clk.clkr,
diff --git a/drivers/clk/qcom/gcc-qcs8300.c b/drivers/clk/qcom/gcc-qcs8300.c
index 916617a001c854c1a0349c1793a427a2822acfab..4a152e95aa997bdcc7ec56a6ae96c61b3575cd88 100644
--- a/drivers/clk/qcom/gcc-qcs8300.c
+++ b/drivers/clk/qcom/gcc-qcs8300.c
@@ -2280,6 +2280,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	},
 };
 
+static struct clk_regmap_div gcc_pdm_xo4_div_clk_src = {
+	.reg = 0x3f028,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pdm_xo4_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.index = DT_BI_TCXO,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_pdm_xo4_clk = {
 	.halt_reg = 0x3f008,
 	.halt_check = BRANCH_HALT,
@@ -2288,6 +2302,11 @@ static struct clk_branch gcc_pdm_xo4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_pdm_xo4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm_xo4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -3501,6 +3520,7 @@ static struct clk_regmap *gcc_qcs8300_clocks[] = {
 	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
 	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
 	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PDM_XO4_DIV_CLK_SRC] = &gcc_pdm_xo4_div_clk_src.clkr,
 	[GCC_QMIP_CAMERA_NRT_AHB_CLK] = &gcc_qmip_camera_nrt_ahb_clk.clkr,
 	[GCC_QMIP_CAMERA_RT_AHB_CLK] = &gcc_qmip_camera_rt_ahb_clk.clkr,
 	[GCC_QMIP_DISP_AHB_CLK] = &gcc_qmip_disp_ahb_clk.clkr,
diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index 0e02af686614162dd7d5d9ab9f3a20c390ed0512..5ed3ec74b210807813f97120a4a19773f3f67d0d 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -2712,6 +2712,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	},
 };
 
+static struct clk_regmap_div gcc_pdm_xo4_div_clk_src = {
+	.reg = 0x3f028,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pdm_xo4_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.index = DT_BI_TCXO,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_pdm_xo4_clk = {
 	.halt_reg = 0x3f008,
 	.halt_check = BRANCH_HALT,
@@ -2720,6 +2734,11 @@ static struct clk_branch gcc_pdm_xo4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data){
 			.name = "gcc_pdm_xo4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm_xo4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -4406,6 +4425,7 @@ static struct clk_regmap *gcc_sa8775p_clocks[] = {
 	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
 	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
 	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PDM_XO4_DIV_CLK_SRC] = &gcc_pdm_xo4_div_clk_src.clkr,
 	[GCC_QMIP_CAMERA_NRT_AHB_CLK] = &gcc_qmip_camera_nrt_ahb_clk.clkr,
 	[GCC_QMIP_CAMERA_RT_AHB_CLK] = &gcc_qmip_camera_rt_ahb_clk.clkr,
 	[GCC_QMIP_DISP1_AHB_CLK] = &gcc_qmip_disp1_ahb_clk.clkr,
diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 78399993cdcee225d2f21f39844b056193bdfca3..dc7a855be0234f6135d461175099862f2d486d9a 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -1913,6 +1913,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	},
 };
 
+static struct clk_regmap_div gcc_pdm_xo4_div_clk_src = {
+	.reg = 0x33028,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pdm_xo4_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "bi_tcxo",
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_pdm_xo4_clk = {
 	.halt_reg = 0x33008,
 	.halt_check = BRANCH_HALT,
@@ -1921,6 +1935,11 @@ static struct clk_branch gcc_pdm_xo4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm_xo4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm_xo4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -3250,6 +3269,7 @@ static struct clk_regmap *gcc_sc7280_clocks[] = {
 	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
 	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
 	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PDM_XO4_DIV_CLK_SRC] = &gcc_pdm_xo4_div_clk_src.clkr,
 	[GCC_QMIP_CAMERA_NRT_AHB_CLK] = &gcc_qmip_camera_nrt_ahb_clk.clkr,
 	[GCC_QMIP_CAMERA_RT_AHB_CLK] = &gcc_qmip_camera_rt_ahb_clk.clkr,
 	[GCC_QMIP_DISP_AHB_CLK] = &gcc_qmip_disp_ahb_clk.clkr,

-- 
2.34.1

