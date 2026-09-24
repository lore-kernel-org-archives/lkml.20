Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CB8481FA0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251662; cv=none; b=XVfSrJtTOPk+Uv8sPeuGcTu/xDuve2etiAq64A33WqVHuCQQk+Dqn2dVcesEJ4wfVcVWJliZOakldIU69GplwXyHioDQrNLNN7d/tUD/MdwvnJx/T+N8UJQv2aF4LU327aI3IDFHPE3HxIFgaGPKtPIxYH0adbvHY9N8wV3dfJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251662; c=relaxed/simple;
	bh=UdtBhyBneBr/MOKYYLbb8D1/sWQ60iekzTd+9v7FbFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k+rdGrOGzHpaYHQFiLzF4hzitanzD3+r0IOg3iXfiu+5Tu+lNkKdXaya8cryxyXRB3fpXDOUGFToLLi3XH7daxcVgCTOmIjo8XOgGKJmia3W2JmF0GPoHmQstp+obAnqOviqOGwE8G0Fnv62D43nrAubtCFiKiP1+7UMmfVPrgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5Wm2Bse; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eLdiaArn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5Wm2Bse";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eLdiaArn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4blN2133914
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h40ZxiQTUvyvswbhdN5FpRTz11Cxy0kBEZ+g/P7iQCI=; b=m5Wm2BseN3jQA8Ws
	lt9+Zart7R3L6zYx2MH4NJguFYqCEcl7xNNsyovi3kto8W96HUmPn/cRDWAx6wcN
	eP5STNcIcOTG7p74MdWSuPR4lTzOxA56v0Q+mwNBpPrftCo91WKXgJJKddgS9fJ8
	66QcL3Qnx0O8qbYsace89hxZX9bDzuYy4/BZUdmDP1TqHxNO+zJRjbJFifPfwIUK
	Qh84hC6omvTDcErowB0VUtE5PrkFhaNn+WYtlOFvIcK/X6j4ArltXKW71nbIR4Qf
	+vgXQEL3xMVHOi2YNp9hyqAIg+VbcMUQcPLqpsLPJlnVYXmGxi2hZhP7NA8riU0/
	UWpaJQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvhsb4btk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:36 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7866c4ed349so1636364137.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251656; x=1790856456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h40ZxiQTUvyvswbhdN5FpRTz11Cxy0kBEZ+g/P7iQCI=;
        b=eLdiaArn54RZ7/lhtcSqGSxxX9EciAUjPnmZKTgGqq/noNKg4YFgtWSqEBIE1PfYcz
         EJ9pIfeZl60MEpFjQOp9UHFAs8Vxy//RUOYR6WK3DVEVKBE3aBeor60+7Mes2Bl8+id+
         6JdCa7jvLa2HSdzCy62vnWP6QuUu/pBTF7wOi34s2FhvFoUQkmRcYQtmuhV32hUJgpnx
         XAVWr+LR00I/FCYunAPpyManKAuhsZ+G8Mj2vnrs5xl5ho/xHd2i1Wf0Tx25YTdpxP1I
         q13aybt/asQT+x7Whb2Ve7yWoLM7kWZRqWqE0UJXduDB/0tuHGy+sM2R0P3NrBJnIzyv
         PQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251656; x=1790856456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h40ZxiQTUvyvswbhdN5FpRTz11Cxy0kBEZ+g/P7iQCI=;
        b=BwugcHz9GClD0bJw1O6IO5JxfoydBBSZi4fX92bmd8Styqy6ktB7KTEfwO5O6Rg6d0
         DksjiQm5At84JDfDyiARy+cgwMGNPW3CHkfDJQiPE6+cw7RoGcCjDqmG1Gu0La4rVMDB
         4QOzQYS/A5NqVhg1y24SQeL6nEVWavSmvpKgCxQ4opP4yczmQ843mOxbC8BLuCIgMG7W
         Cr5yxbylHpETV+H6ohOM0eijC88BQnssH55JJcPG/FmbzqS262ep4NfVC7orMZ/BwVsT
         gsfZUfG5CjZZVTjU7JvUjITPAxbUEBFe/6R/Ewl2snTpLiffBg9MFRBKyOwnzFLfB7jO
         uQzg==
X-Forwarded-Encrypted: i=1; AKwUvBzks+JhY7pKA6QI9oKpVgv8nvLnaWERBvwkoN3wffIvjp8ODN8DqaIxdKnem34Z4UKjIzX34aqUY3nXM9M=@vger.kernel.org
X-Gm-Message-State: AFuF++nk/GzFKMcJSKJ2TvJyyiuIe3KkPRReLj52OVdIYqp/wDeeY552
	+SYlsa0WHA2Yrk/zjVjVKqiZaeKsVU2qOWYrDQO3OGO2OaSc+LNGWKpqxW+0L028n7Jz4RGyyl7
	OXAke8clcH40XTpSrCOVEvIf2HsCzFZ+fJwpv+rhnn8nfS6j1buLBskKX3ATX0MKO2YE=
X-Gm-Gg: AYBFou2POVYAzT0qLcf+e46RMXyZprEoeP55j1vT1UeIBiU6L31MdYITjOxGebBvudr
	HZdBNY52WWhaGJ94ecAsDDFpb6iMOZ/301zcAnnoK4KSyPHheE9xLGozbRS2PHUzyB5XHVIucEf
	TKZQ8L5StOegGTfoNMolTXxgkVOYQvyjrixplONylZfNGaoSH2xT3IK3Mk8mICla7g8q0yo7Uxq
	lnBopnr7IzgtpKqP7Y9WbA6UNmEJyFpBJeZse5SsKIH+KRs68VLSsibpdsW4TlRJNk8uopPZbvl
	WfG39XsuilEKBEJY/yehW/7l9vYfC80izh8MyKpRPiuOm4Uh20ermHwoCPKmRxq0HseevhY/rnm
	2n/68T3C4
X-Received: by 2002:a05:6102:5707:b0:7a1:f951:664f with SMTP id ada2fe7eead31-7af1e4f2ae5mr1178714137.22.1790251656324;
        Thu, 24 Sep 2026 05:07:36 -0700 (PDT)
X-Received: by 2002:a05:6102:5707:b0:7a1:f951:664f with SMTP id ada2fe7eead31-7af1e4f2ae5mr1178695137.22.1790251655724;
        Thu, 24 Sep 2026 05:07:35 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:29 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:20 +0300
Subject: [PATCH v2 08/48] clk: qcom: dispcc-sm6115: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-8-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1735;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=UdtBhyBneBr/MOKYYLbb8D1/sWQ60iekzTd+9v7FbFA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJJh5F+5q555tffDippoLKfeTD9qcLFZEQBV
 746V028rSSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSSQAKCRAbX0TJAJUV
 VqmZD/9VhYoR+igOJ7LL/cJEuGJeftMry8xdDa/wQxZLYX/D1QsJ8zz7c32e/Osos7f8Sod7w1/
 lGWcotpdQf6qF0ktMzhlvFnbb0sofPuduoewJham3zoYooWnWpsjC3MgRcmwIaLfUGSyldgaK/2
 HBdsukCMIXGBqmc6fNMYJnEEBiUxCRCxGSJQXli0fEvrbVjP1CIqHxY4rtqLC+L0zFcdGsq/FJ3
 DwiAKiIngJdevIhdXUyHPg6zgbRFYSaP0xDn+Pow0JgGFroGd4xWZ2JPzvzhIZ57obau5YGAXUn
 Uq7HygoIRjeD/MGJHFesu1OcXbMJBS/o3Hqfu+0xqpeq0xnu9zC4hNyQZlF+UX4Bs8mpaLiqeyY
 1tvFc6nIbWYG4+yI7Hp7MC3ha6AoUhBYdve/x2foMr4t/Zombb7zdL0ncBlPfBYr//Uk5B+ADuB
 PsmXYk/Cdyu/FBFTFJZP52Dnoy3hfiUt4rkH9ebSvS57QzB4t9CyDnPwEGvPili9ar6TXzu/xuH
 DOajoxxbF9uQbx2MCVYrLoDSrYdK8AY8EqyyRQKc0pc1Z4h9ag/VUSidtJIjuDYyCkoC5T4OvmJ
 rll0MfD9SI9DAN+fWTWD4VKm+lSK1gD+f9vOX67rv1VsJFrOQ2oPEycNNZAo/Ih1yjL8TSRvZNd
 46x26+p0tkMukCw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: sTjHay7VQzxgW_gOEOzDs6720z9j_XkR
X-Proofpoint-ORIG-GUID: sTjHay7VQzxgW_gOEOzDs6720z9j_XkR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX2TMRjkZNL8li
 f/7ZUj2qradrYoSZnU8X3oC3wLNiJM05eZZTkIUxyVcmKYKnsOiyBao96eV1jEr92VzKCQ+83a0
 QTd44ntzm53zuBlloNFeIZwiKPCin/p2oUZjPHqv6JXZnJbqFG52kREMwmgo/JCZtMclGuy9O0z
 V+5eU4snzPZLW2ponSrlE4kCxurouPKV4FGfMk/91lYU+lCpr3xC52cdwkn/fPgR0y4k4SwGPF+
 e8uaOXuFKWRqvVuv+FxZ/ZkNU3nq6PLAtVXH6yRgH2I6POaEtu36kg46m/riIPO3PY9Dg2SEygw
 2hOC3+r3oiBsbNL9E3mXSHNRs0qUmWmPV2a4e3p2PzR3n27Eop/dEG0CO3HZJRaxYbMdFDsMYEk
 oGYJFkYPz12xkVfl+H2fIMhi0OUgMPYoTkdurzG08mlBibOycUYmqBHPRAmOhhtn5djceZ6w4PD
 O/4d2FLazclWpZnL+Jg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX4gAKOh6JzuH/
 TmFeBSaxUCjoRrsQB3AJYzhczEug+s45TQTELfBRrvppRaxp1MgC3FuyVwqCoeBph6M3X8NTJLd
 aRHwSRpj3UljTQe+LXelkXiZcplTiOU=
X-Authority-Analysis: v=2.4 cv=f7vdl+yM c=1 sm=1 tr=0 ts=6ab51289 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zyovT9EyBzSEY6lazxoA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sm6115.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm6115.c b/drivers/clk/qcom/dispcc-sm6115.c
index 9a7b8ad646ed..f6f5edf07f03 100644
--- a/drivers/clk/qcom/dispcc-sm6115.c
+++ b/drivers/clk/qcom/dispcc-sm6115.c
@@ -561,7 +561,17 @@ static const struct regmap_config disp_cc_sm6115_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_sm6115_critical_cbcrs[] = {
+	0x604c, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sm6115_driver_data = {
+	.clk_cbcrs = disp_cc_sm6115_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sm6115_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_sm6115_desc = {
+	.driver_data = &disp_cc_sm6115_driver_data,
 	.config = &disp_cc_sm6115_regmap_config,
 	.clks = disp_cc_sm6115_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sm6115_clocks),
@@ -588,9 +598,6 @@ static int disp_cc_sm6115_probe(struct platform_device *pdev)
 
 	clk_alpha_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x604c); /* DISP_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_sm6115_desc, regmap);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register DISP CC clocks\n");

-- 
2.54.0

