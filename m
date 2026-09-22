Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8053E16A9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790049427; cv=none; b=Q8eYBMzxq1Msf6iPvpQXxqWlk/SJFUTXFlMCsQBXm9h6W4Y0Ls/qxbsEuVKOjUOuUt5dG9zo06LoIsIw7Z9PpvHUy+4T8CgCJpW9u5jlXzrwvHghm8SNXUOUg9dbmV2KoIqZClIZddT4ap8AmQCVhRtjdJpkNjxkq0a78dYRtD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790049427; c=relaxed/simple;
	bh=86g2LgUZcBXlLpzDwfKSsZdNgNen51dc54ZQKzbwhU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bbCVRoxQfCtmteYR/u4a24rzl/DWj0KAkoG7nOt7NMX+x7kBAT0xBX703oZkuc1a5T05LZOYhiVAUAOZzJUhjoxv52GXc6Wx8KzwDF5tv8uOAZH3L08Oci8BgdDznyTGrX8zZ9gVlwsyVeIXnbfWUTX8GinUQ9Cn9bqgRVSlsdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lkB24lAb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NO2FtZ6x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lkB24lAb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NO2FtZ6x"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M0ef5x3044233
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FWXUSHtrafSsKRyKqxqWNbuhxvUUO0c/7hlKRA8ywWg=; b=lkB24lAbNg2A1AeN
	pf8RnXZNJmBqJMaCS3wHMp85eXEOXbnyEPZqMaRhbuRvdxQGywMj6zx+U2R/CyJK
	s3DcEOv7EAG+vzLWp6mUFUv6WqaiC/NqVYIiU/wGP3YRx+h0m4ETx37r0xqnZWGi
	ohCFwsXwjZozGRI7OrD/7bahxvyoeRrw8YGkRnel4yrDUo5WcVGS2DrOG7aWWl+k
	Voyc7YLbuQASreVggvkdrspNTjCI5tRV98PjmfsM7FCXvK4Hxy6AuZ8lME4DSs82
	3kpjtb5jmDiixzVzlc85rHEiqednxKn2dEqj/TwNyjdezNlX/nrNphOrpDfHj0YC
	Z5etmw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufbarm7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:57:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df375fb9b2so29247315ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790049423; x=1790654223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FWXUSHtrafSsKRyKqxqWNbuhxvUUO0c/7hlKRA8ywWg=;
        b=NO2FtZ6xSy7kXY03VbjnHHcmorwcOQkKsl1prf8MZrmW+t3yOFtMtKLGWFWALH2/pC
         toVjWqBLOFzXju8NBVgUXVtxCnRPHEvLHmRUedI8I3LcHOc2LgdTGFQbYt6o+I0vbJ4w
         YOmtt4k6w1QxJbtg0MbXxlUt/+edRDRuiEYeU875F4UTnmBjvN+GdDf7uEtrhgNHReQv
         vfj1M1b6/63sOWLxN3GC8nDPIz1JUlWEyuD/lbgMm/i8yS2OLnJh38A6yn4llA6a0r9Y
         2nieQMQL5AW1VIfomYz9Zeddh0vt/UgCk1S4e+v/4tTcT0pjaA/P/uriSnNtWfh6S6Ez
         vsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790049423; x=1790654223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FWXUSHtrafSsKRyKqxqWNbuhxvUUO0c/7hlKRA8ywWg=;
        b=CO6Av61W+mc3pe+RSX3kypUSUEhkxVYFYoa5jgidF+T5wV6Ci47HBYBwj9nvRjWdMX
         yz0Na8zj8p7Jd8a4k0HLb3lhCUsKX3QsaH6AfSiBBuBKPsdCTkYq0hM7utO/14ePnZh5
         G6ZXtxBmfHaTMb86wGjRtrFc25ifQpQ3kZ9gv3e4i6TgpSRYw5JfQBdEOKSyMJRBvrD9
         jVI+GD2WBrAIba9F3soRg1Ik5DCgnLrg+ndG82yWQ+NNNz7MpXiVLGhQGaoa0l4wHNUm
         kA1lr2TmVq7Hz08kBfhfwgq5xBmhMku/lJFV7gSaQwfRi58xKCaov/WOudyFI1ekyriG
         7sqw==
X-Forwarded-Encrypted: i=1; AKwUvBz+hbXPGuAjiNO/YrywprubbIkJFTjok1R+MNdtaoHMnRlPcat8A71FWo86GxcJDhzf1XOWMRPF5Ggn0Io=@vger.kernel.org
X-Gm-Message-State: AFuF++lMmNrC8v+0a0lnDWZYWneiJrRqrCeviT6AY6OEAWRlgNE4qhx/
	0v7N2Icd5ak0G8tpFtZ3lZ4Vs3gDi95t2Bo4k2VdtDBbec4dbMQ3r9EqBLnr/+r1dLR4n/9vpdT
	eQVzGQDzL0qieLSYnfvE4HSzrz4yRrXw7fF0GVjku6Ivjhoh0JiZRjtzdPqAlEeoeZgQ=
X-Gm-Gg: AYBFou2dM25xynd6V1iAQbTdZFo/w701h7iM3bm//z5b/j+OoIao1eXz5dpKXNEK0eK
	LtXFuJR2m48Ck0XUeutam+lFBmlUVrWs0rjolWq88yqD1ZzBKgULQEkXrscJVeJO6a4y+K1Ipiv
	tbqRjJCezkk8EWM8o4o89isKtUsW89bL1jfilkkx6nqDd4fgXc/ccKmDbgC/VjFSgNOFoy6i2ja
	i/63iathYUr8LFUxYgFuw76QzehoBKtcqOk9z1cmmX4jYD6m2jeUz4FjPvF+kCz0o580451Fj2Z
	gdVgAf6PHdnnC5KyDUgXHjsjUezvAfu1NZm4VPcENNOOhbBJclKlnl6JFSrI+Z1YIVx2clhMCs/
	hTWEvRRFBfKjwiqXWbnlO6MDd5J3Ud2s=
X-Received: by 2002:a17:902:f609:b0:2dd:c0ff:e72f with SMTP id d9443c01a7336-2ddc0ffe9c2mr123577365ad.65.1790049423381;
        Mon, 21 Sep 2026 20:57:03 -0700 (PDT)
X-Received: by 2002:a17:902:f609:b0:2dd:c0ff:e72f with SMTP id d9443c01a7336-2ddc0ffe9c2mr123577075ad.65.1790049422931;
        Mon, 21 Sep 2026 20:57:02 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e610e58fcsm1613139eec.2.2026.09.21.20.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:57:02 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 09:26:38 +0530
Subject: [PATCH v4 2/2] clk: qcom: Add support for camera clock controller
 on Maili
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-maili_camcc-v4-2-87704b664dde@oss.qualcomm.com>
References: <20260922-maili_camcc-v4-0-87704b664dde@oss.qualcomm.com>
In-Reply-To: <20260922-maili_camcc-v4-0-87704b664dde@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA1MyBTYWx0ZWRfX9izvr9UAYJWx
 z7BCIK4kFglAFaclHCVKz5oxhgWf5W1FsGZtkNF5QIllNl9i8lTEXXlqkBHfo8G/s6+f2keoobO
 kVnIvzICOGlljTgl7q3shjOYg73M01O61H0EULUDEuiK/ROVSklQCfNNcgrnIx+yXMmXbAaKOnh
 +xXm0u33WbEq/JDX13Y0y+N+usaTeoGAmo/5y9DpKWhIVkU0HmkekD8hwNIBQptN2T+5ipXjsXS
 +XasNxJ9JfBnaz56mlwnby5SJ4a7VRQTPJHSXiT/JNd6Tt+2yhGWd9zxlJv6q7h20xwtOuGi6rK
 /DPC9xyWKdhK4BJ45R6yBxzKVoRIfZlIspItAsumLqKfNCTvmCoJ2d/T7jUoOhf8PC2boywWT+b
 N6UZ0BRq86LsJctAICXiR4r+p3Bac39bu9swFmHyHvem32Jw43QQ+iSRk2ZAI/TtX1P2+R+gwRk
 jcJljVWMJ3RzIqyEgEw==
X-Authority-Analysis: v=2.4 cv=IYYSymqa c=1 sm=1 tr=0 ts=6ab1fc90 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=x7oLaaGiLmRgSqN1hWIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA1MyBTYWx0ZWRfX1WejM3Jb/2Be
 5p8OTSDUWDVvedT5uDBDeU43jPZ22g3fjwSxFXrVGOA+7LJEFtJpt2ZJuw3spD8RqvH6RSIdYYB
 AwMf8IA8U/XyPP1OASa03plc6/+XP6k=
X-Proofpoint-ORIG-GUID: pwoSAfIBBJ34scxhLz6HU_O8uznASkYG
X-Proofpoint-GUID: pwoSAfIBBJ34scxhLz6HU_O8uznASkYG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220053

Maili camcc is mostly identical to Hawi camcc, with a few clocks
removed, frequency table updates for a few other clocks, and PLL
configuration changes. Hence, reuse the Hawi camera clock controller
driver and extend it for the Qualcomm Maili SoC.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-hawi.c | 159 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 159 insertions(+)

diff --git a/drivers/clk/qcom/camcc-hawi.c b/drivers/clk/qcom/camcc-hawi.c
index aa52b99aec003f7b9224bb89a15783dcf3889044..9842a9a4bf853b387f540c515b0f8231c3bdce00 100644
--- a/drivers/clk/qcom/camcc-hawi.c
+++ b/drivers/clk/qcom/camcc-hawi.c
@@ -66,6 +66,18 @@ static const struct alpha_pll_config cam_cc_pll0_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 1200.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll0_config_maili = {
+	.l = 0x3e,
+	.cal_l = 0x42,
+	.alpha = 0x8000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00008400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll0 = {
 	.offset = 0x0,
 	.config = &cam_cc_pll0_config,
@@ -141,6 +153,18 @@ static const struct alpha_pll_config cam_cc_pll1_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 493.2 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll1_config_maili = {
+	.l = 0x19,
+	.cal_l = 0x42,
+	.alpha = 0xb000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll1 = {
 	.offset = 0x1000,
 	.config = &cam_cc_pll1_config,
@@ -193,6 +217,18 @@ static const struct alpha_pll_config cam_cc_pll2_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 600.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll2_config_maili = {
+	.l = 0x1f,
+	.cal_l = 0x42,
+	.alpha = 0x4000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll2 = {
 	.offset = 0x2000,
 	.config = &cam_cc_pll2_config,
@@ -245,6 +281,18 @@ static const struct alpha_pll_config cam_cc_pll3_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 476.4 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll3_config_maili = {
+	.l = 0x18,
+	.cal_l = 0x42,
+	.alpha = 0xd000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll3 = {
 	.offset = 0x3000,
 	.config = &cam_cc_pll3_config,
@@ -297,6 +345,18 @@ static const struct alpha_pll_config cam_cc_pll4_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 476.4 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll4_config_maili = {
+	.l = 0x18,
+	.cal_l = 0x42,
+	.alpha = 0xd000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll4 = {
 	.offset = 0x4000,
 	.config = &cam_cc_pll4_config,
@@ -349,6 +409,18 @@ static const struct alpha_pll_config cam_cc_pll5_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 476.4 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll5_config_maili = {
+	.l = 0x18,
+	.cal_l = 0x42,
+	.alpha = 0xd000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll5 = {
 	.offset = 0x5000,
 	.config = &cam_cc_pll5_config,
@@ -401,6 +473,18 @@ static const struct alpha_pll_config cam_cc_pll6_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 960.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll6_config_maili = {
+	.l = 0x32,
+	.cal_l = 0x42,
+	.alpha = 0x0,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00008400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll6 = {
 	.offset = 0x6000,
 	.config = &cam_cc_pll6_config,
@@ -476,6 +560,18 @@ static const struct alpha_pll_config cam_cc_pll7_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 345.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll7_config_maili = {
+	.l = 0x11,
+	.cal_l = 0x42,
+	.alpha = 0xf800,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll7 = {
 	.offset = 0x7000,
 	.config = &cam_cc_pll7_config,
@@ -505,6 +601,18 @@ static const struct alpha_pll_config cam_cc_pll8_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* 493.2 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll8_config_maili = {
+	.l = 0x19,
+	.cal_l = 0x42,
+	.alpha = 0xb000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a806160,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll cam_cc_pll8 = {
 	.offset = 0x8000,
 	.config = &cam_cc_pll8_config,
@@ -682,6 +790,17 @@ static const struct freq_tbl ftbl_cam_cc_camnoc_rt_axi_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_cam_cc_camnoc_rt_axi_clk_src_maili[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(200000000, P_CAM_CC_PLL0_OUT_MAIN, 6, 0, 0),
+	F(240000000, P_CAM_CC_PLL0_OUT_MAIN, 5, 0, 0),
+	F(300000000, P_CAM_CC_PLL0_OUT_MAIN, 4, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(480000000, P_CAM_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(600000000, P_CAM_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 cam_cc_camnoc_rt_axi_clk_src = {
 	.cmd_rcgr = 0x212cc,
 	.mnd_width = 0,
@@ -703,6 +822,11 @@ static const struct freq_tbl ftbl_cam_cc_cci_0_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_cam_cc_cci_0_clk_src_maili[] = {
+	F(37500000, P_CAM_CC_PLL0_OUT_EVEN, 16, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 cam_cc_cci_0_clk_src = {
 	.cmd_rcgr = 0x21250,
 	.mnd_width = 8,
@@ -1076,6 +1200,17 @@ static const struct freq_tbl ftbl_cam_cc_ofe_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_cam_cc_ofe_clk_src_maili[] = {
+	F(300000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(376000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(445000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(500000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(609000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(688000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(841000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 cam_cc_ofe_clk_src = {
 	.cmd_rcgr = 0x20120,
 	.mnd_width = 0,
@@ -2970,12 +3105,36 @@ static const struct qcom_cc_desc cam_cc_hawi_desc = {
 
 static const struct of_device_id cam_cc_hawi_match_table[] = {
 	{ .compatible = "qcom,hawi-camcc" },
+	{ .compatible = "qcom,maili-camcc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, cam_cc_hawi_match_table);
 
 static int cam_cc_hawi_probe(struct platform_device *pdev)
 {
+	if (device_is_compatible(&pdev->dev, "qcom,maili-camcc")) {
+		cam_cc_pll0.config = &cam_cc_pll0_config_maili;
+		cam_cc_pll1.config = &cam_cc_pll1_config_maili;
+		cam_cc_pll2.config = &cam_cc_pll2_config_maili;
+		cam_cc_pll3.config = &cam_cc_pll3_config_maili;
+		cam_cc_pll4.config = &cam_cc_pll4_config_maili;
+		cam_cc_pll5.config = &cam_cc_pll5_config_maili;
+		cam_cc_pll6.config = &cam_cc_pll6_config_maili;
+		cam_cc_pll7.config = &cam_cc_pll7_config_maili;
+		cam_cc_pll8.config = &cam_cc_pll8_config_maili;
+
+		cam_cc_camnoc_rt_axi_clk_src.freq_tbl = ftbl_cam_cc_camnoc_rt_axi_clk_src_maili;
+		cam_cc_cci_0_clk_src.freq_tbl = ftbl_cam_cc_cci_0_clk_src_maili;
+		cam_cc_cci_1_clk_src.freq_tbl = ftbl_cam_cc_cci_0_clk_src_maili;
+		cam_cc_ofe_clk_src.freq_tbl = ftbl_cam_cc_ofe_clk_src_maili;
+
+		cam_cc_hawi_clocks[CAM_CC_CCI_2_CLK_SRC] = NULL;
+		cam_cc_hawi_clocks[CAM_CC_CCI_2_CLK] = NULL;
+		cam_cc_hawi_clocks[CAM_CC_CSI5PHYTIMER_CLK_SRC] = NULL;
+		cam_cc_hawi_clocks[CAM_CC_CSI5PHYTIMER_CLK] = NULL;
+		cam_cc_hawi_clocks[CAM_CC_CSIPHY5_CLK] = NULL;
+	}
+
 	return qcom_cc_probe(pdev, &cam_cc_hawi_desc);
 }
 

-- 
2.34.1

