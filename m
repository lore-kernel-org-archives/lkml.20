Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882C44BE449
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554594; cv=none; b=pqjNkQwK4YoqpQz/hH2/aEewdfb82ddj2ayq+zxFxlgkqWhX3n4b2JnvZ5ioLbyZf5jIdJb79cTFQ33Z1/5uZpxxmjCzSgoyUYS99VmeMpzXmDB8jShMn7OtANVOtHINwFU9HFilcaAiljf9GVnLopyOsmCL1dz/H1dJM6Z4G70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554594; c=relaxed/simple;
	bh=NEcyM91aSl6BFMYhR9y9z9Qnf62ZfDA4T0e9hLBaXio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hUG1rsnl2GJqqmmstG9ZFsj1qFHFSpUpZdCnl5SQaEiLbjj7fYwZIGDs/+9+5yuKxH2LOKY48WEka/bCbVADDuQYbQnGjkxjMh7ts+h6GxMn58i2ckZy1x9sPkEARezxya9MKULujFQSlqbbqIhEr8X1yVBmy9MVc2TbVsdBIa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Of0R35aU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DApK4BKO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Of0R35aU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DApK4BKO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G935Yv2226633
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wn+EokI8YmyHqDNQRq31MkrfGIsBHcrZ0BrDK7mrilc=; b=Of0R35aUkQxxQPqi
	TgLhC0j/0u1Hd2Ll4fzopU7INhYBVIu/LWxc4KN2yGhsTfCaxAIC1yefZozJkQ2o
	LvLwy3BdWY7Po3H2NJNR5OKSz4MnmLrvL1z8/GZGVlrgV112Q98It4Y93YnmM7Tb
	9gsOhwwOEJ+SAGV2NQP220G9Wt+2ju8+Q6unWGRjQ9d95mHgaFNn9FUsKQTG4OMu
	hYge2u6vloDyDIhOX0m+K49nBZWyjgjQTc3Cx7taPoReuuDpYwNm47bD+Kq0l1yt
	6slPYSKmyyqEpCBGCsKzznD3HjRtKcWpzZ0Egy09OlMNTA43Avj/TRWC4t7tMen+
	WwjPGw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9usy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91214e93c2cso76681566d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554570; x=1790159370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wn+EokI8YmyHqDNQRq31MkrfGIsBHcrZ0BrDK7mrilc=;
        b=DApK4BKOa6X1KBmWB0P44Pow6M0ddb7oUyOMR8AxFzk9TnT7TxW65YZS70t4FIx1AJ
         w3DfpzASaaH0uRVAZL+mIAqDDiiDW7D9cgttqcqsRQq5dz3KY3l2mTgEOFZ+inbBvJ7m
         abubPw0kyLxxyBFN13BBRF1+wfNUctyix9k+Z5SkDmfzUoXwnIoCZk3o88Amn1hRWLl6
         Q8A/zhBvYsXh/FiIRwko3MLhrg8TIaN4G26m4j5pzwrMWrySDgULFSPKFLPsOAgDOyKx
         /a4K5FTdMP8x4iAMIKimO3gBbm1g4lWix8zEq8b+n/KYdviQGo7zyF/InNKO1GH70FU3
         iGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554570; x=1790159370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wn+EokI8YmyHqDNQRq31MkrfGIsBHcrZ0BrDK7mrilc=;
        b=A2D1Bow1/Jn7b6oJDnscodA9kIEmKIRZhQetpBjmPbC8CsnGjpGASA/dlfTNrk0WFM
         6zvTWR+kEl0o7EIhTVgA2YGNtJmXwz7uVCOu580HbCs+SGa2ZYcO8w/GP29GXJ7cl9uN
         EDACRSRfpC/s1jhRJKFV5C6IKHlkPpqLlHTiqw4W6idjZEVQrSZ6Dinu+fYy9/gaxEXJ
         z7V5QLeC741t6MhsQydUyLLwF+yCmUPzUuGJ66JptzYrgwfsxmRsw5tm4RHaEFUPWnnS
         i21GwTed5byr41CgUL29z2yn1uru2Iz7elZvSNZ+qb1G5vqRaOWI21lrLmCjHnyDLbPl
         R23g==
X-Forwarded-Encrypted: i=1; AKwUvBymFO35RN8ST+bjndHWBMi9EacvC+lwvtV0sUwkKQtn4O17b39qRMSbPXdjAu87tDnVVDPGCKwVlJAbJ00=@vger.kernel.org
X-Gm-Message-State: AFuF++lOvgmNaxSaS/5/Thx4BHoHYXdv9krHujbS6ABP+784FUgoobV+
	GgZqL08ekfg25L2i+z7tgPgWlPl+inFAuBhmZyLPGc6vPy0ggfafJGbKqPI8Dr37OV0YTxuqawi
	pFq+bVaoF9kGY7xg9rDHnushXhZIP0zS2xtkR9S88qsVP5OAOqDyEJZIdaP4wGwFPe9o=
X-Gm-Gg: AYBFou1YEfSAYPiTDIVy9Jb56hw969N7H94x6GIOeKYO8HV6tcPf/X7zwhjNI/IgE7r
	qDQExVOmLbm5QytY1h1bCqM63BOoq0U4Y7sU5NitsEDox115qV0LBpd4+RB0Df/XGl4YX4DvZkX
	AtJzXWQczJuHwgbVrVowBk3P/v8xRuUmRySFaOAElom7sdXD0eJXouamk5Wr0t7VwvNKCYVADEE
	j4MU80aJ6+j1ZbanFqW9dKquOTAlIRFKeMNKy+299hyPYcV5fObXpvC4rCTiBOoT9qjiWdOqoLq
	Gq61M+1PQ2htrON+wuXdzMmlItqDMkgHJpJCfD8X1s1czXCPkHmMdwFBIv7g/Dw6QCaD0eAIiHI
	v/yImK4I=
X-Received: by 2002:a05:620a:800e:b0:939:993e:bffb with SMTP id af79cd13be357-93bb76fe856mr274693285a.22.1789554570215;
        Wed, 16 Sep 2026 03:29:30 -0700 (PDT)
X-Received: by 2002:a05:620a:800e:b0:939:993e:bffb with SMTP id af79cd13be357-93bb76fe856mr274689585a.22.1789554569663;
        Wed, 16 Sep 2026 03:29:29 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:28 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:23 +0300
Subject: [PATCH 07/48] clk: qcom: dispcc-sm4450: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-7-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1792;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=NEcyM91aSl6BFMYhR9y9z9Qnf62ZfDA4T0e9hLBaXio=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9R79Wm5q30jug0+rTLSP17OAV31T+NhkDtd
 RUktM1VI+WJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvUQAKCRAbX0TJAJUV
 Vv9kD/4l5uxc0MkkntUSrqgCdg2bGsXBI/IyOAgqXRYZ1104elJFfZaqFel0H7IPp7BV8J7QFC4
 veTkrazPG83YTUp1Lxa0bHse7+LfN9aM8K4f8l4tAe3/pTKfQ5C+c1AxtmAkE6h0sxxxQvQ5SGu
 HqdtAjRz5rey6pPxvXT8rJrMfzxbamn2owsMGjfw2krphbEqrmnde/G6FD1KSo3sbf23jBsPsI9
 27YEzSoxBED/gaWZTgR6TSvDjCqQdjHBb1+Ycfiyv/gCtsi10MpklN6wdu1VGYl3UpVz6fGO2U3
 NeBZ2Wz6hZt1qiCcO8HChIUC9aiX5qiRNF59y0/bJjMIptW2bH5A/zA73iGEHEadjCoXcLJ71fr
 Naovtf+4hM5PNT3ihtzQZweRMj9z3C5MJt1H2Lung3JKobMXCmWmNGvyeJEIuRe+UsOkZciEbnt
 rdztF4rN3kRRygtoj+5mFoYMFVkvYODV210zgZb0izuMdprbkk6XX4S55l0JYktvxdGJSNPxvlu
 WYr3tB+ON8O5YLtLBKhgAMlSWFq7kjCbLIEX7CPbekNn42aK4dmcahJI152LWP2qPQvO41ISJcy
 SDBZGJkTsX14ta/7ocyMnhePBy9PMl6kM31h0hnkORyq59UHEeq2a2qNgIDtfYwSuDnVJ5Ddh/G
 VAaDU2CZ2rYRIjA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aaa6f8a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Mkos_PfpLiWYs3bmBbQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: vZrT43pi56_BN2k5dEXkwQqmkT39Qs4p
X-Proofpoint-GUID: vZrT43pi56_BN2k5dEXkwQqmkT39Qs4p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX+B66x6wyDFVS
 XzX0gN4bfYRVs9jwaq/VNefycmaQpVqxLDtSCPEDr6sZxS7/eB8bC/wjPsWsXKodqtU0zQz4SoJ
 jwIdwWQbM8/+D2VOw2oneEkpQ8Q7IHF471ebN8nD8fqE9U4BVnd/B5x4ZZlXZ6LxYe6gevrk3Lk
 OIFMW0DhaLCCyRCkfQQenHXBPCO/clFj+a7NkzxE6hWkcWbBagSCtmZecjUKshaj9stPv3RQDXE
 ULmv4h+o+qWVYpE8UygBfJMa1zYtIm3R/KSnGFHIYazTERNeOhtKL+uOf3qHAQAx7u6CBC0Ry80
 +XYw7UFAMKjJWRH7utQNzTb3G1rwrVajEhwTZ8OkigjoOEhI3itKkS2N11ww0ZQcCWE6kup4QZm
 oZ2NRuK6IAY/6WWwpEuGXlpxA8nRNOFbx+nsdXOuSre76fwUpUWYaTXMic0uuEFr+8nZLRj6dol
 qiS+iIzIzF563mAk6jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX58+nJt8KUuUo
 AkDNrZ+MNiNTSQa9z/sDjun8VhM5zi8QwDQ4sCvreHAF1EdQx2WAa1KNQX5FAnH5FVc8QCS7S86
 GvZDQ/gVTdTM0D0tRebECXhWrZJ76yw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sm4450.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm4450.c b/drivers/clk/qcom/dispcc-sm4450.c
index 4a4811db55dd..f39afa067cc6 100644
--- a/drivers/clk/qcom/dispcc-sm4450.c
+++ b/drivers/clk/qcom/dispcc-sm4450.c
@@ -719,7 +719,18 @@ static const struct regmap_config disp_cc_sm4450_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_sm4450_critical_cbcrs[] = {
+	0xe070, /* DISP_CC_SLEEP_CLK */
+	0xe054, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sm4450_driver_data = {
+	.clk_cbcrs = disp_cc_sm4450_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sm4450_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_sm4450_desc = {
+	.driver_data = &disp_cc_sm4450_driver_data,
 	.config = &disp_cc_sm4450_regmap_config,
 	.clks = disp_cc_sm4450_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sm4450_clocks),
@@ -746,10 +757,6 @@ static int disp_cc_sm4450_probe(struct platform_device *pdev)
 	clk_lucid_evo_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll0_config);
 
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0xe070); /* DISP_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0xe054); /* DISP_CC_XO_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &disp_cc_sm4450_desc, regmap);
 }
 

-- 
2.54.0

