Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115CC4E80B0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554655; cv=none; b=AjdXqJ+oBOsUjWCNRqsVaKuDunvq4gcgXFzvYS2kwabN1jmCNoqRAvckJ1j7QonWTidHUgYL3el2Zj8BT85li+t+faCnVKEMZNuFNDNwddM271uOWUrWbupY4+CXsgEEKXawoN2xRDOjyZVqvCdo/VLgLvHWr6jFm7XcX1ccVWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554655; c=relaxed/simple;
	bh=lfSrimWZThdcUoiBKBc73gKP6/y+jyHpWjqj21yuyYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pMoVKeZE51a5f9QwL+e07osEpHO+HGVC8p1wUC//SSMYI7euAZFnP3NmpunO+c1YnvQpaBqdmcwHeKDN+hzjFt1FY5YtgZ0kWc7nlImiEQM5DJ0UqsAQ8KZEsoi/fRwkGs9bqRp4RIgOJ/eYQ9cPkpFmHBG/rL/uOSMSyaptQIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5Ki0Mzp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kJCP8q3B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5Ki0Mzp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kJCP8q3B"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92v0e1721223
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aV8OrKimcjcHkzC+e+EE71QbF1fQjuljOHzNPxa4Twk=; b=A5Ki0MzpoodGdllX
	U3JchBtdnLx5MePx4+2pAXX82gkuEFDtHl7v4EpblmWeBxR6hiC6PSi9wk9WTYAv
	0L7QoecIxBvJ23rBQegwqiPeO6bs4xH1xuh+ZdfnrDkSRZnVvHuymllcLFGpZS/d
	kOGR88Lh17hN7v2Wudsa0BtwT+9EIBTW8M2npHRLhMNMLmjxNhtMwY7bRMpX0vSy
	QG2933pmn0nwYPcL4zoeCvv49UBiC4pROrlQFGMTlhAUTVfH8ZwE2OjfM5X7F8wP
	h8iTLp8Vlb/37zNGmYffNr5DOxNcsO3a/ZyLOOdI5shGcamYvOn3ZOvUYGZsrj6X
	YB7LbQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqbmnkbya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1de6d5c3so667774485a.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554610; x=1790159410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aV8OrKimcjcHkzC+e+EE71QbF1fQjuljOHzNPxa4Twk=;
        b=kJCP8q3BKtSTJPUMIfPmHpgnJjr48S3Dp5z4SS3+zeIlgX/cJvpug/swJ6wwtJS7nD
         s1xK1Xz4XyVJWbX65qs59Uro54mWuHOLVf6gstRPGCcXqjHTzQUvDynOhH+uXK+Umkp3
         DQNZhOM3REbc22Cbv/Tkd/PaLQcA2zN5s4Lq6gJmuyN3z7iD/S6/q2Dtc476RxTCpAQQ
         pLpjtbLmYTt6OZOCkh1q6ussCpvygYXHEcNklrU5rNkAxELvFJKRdFVBK9/9GeSknKVw
         RsUU+towzer4CY2A48IZ/aMNFAar70qlyDgLjnBuTSkk5NuluBUpptsd2t9fK4urn2/n
         t++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554610; x=1790159410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aV8OrKimcjcHkzC+e+EE71QbF1fQjuljOHzNPxa4Twk=;
        b=fQiDBWkDSSxUP2ft1tCplToqCDJJaTEBA9dYOAUtXNSWBkbSOHn0cm/YOOCouhCvZ/
         sw0+CbFXACXmOllbNXcEZ104n7G1c4iCY0uzORuK4Efm8Tu0p5GKP+dHrMDCdxBBqL0k
         68W96rWfEU/p5hDIHFL1X2PmLd7rpvoiMBI7GxU4+1uWxzlZ9esBMqoFjVf1Gip1kt9J
         f/heFzamTyu+1pLws2Bk7nlBdaGXDydIu0l6FwrQeX0rC4alRHhZXgFrn+q9Uu+lGUV2
         Wxjzdya3Iw5BwcxbgT0zMoky70tuNjOC7azSpOv19iLnvHxaAP/PnngNlM3nxh3Fmqoz
         6xBw==
X-Forwarded-Encrypted: i=1; AKwUvBxh9sGhT2NzUEhnczNi7JYd0bSc0C2DjjgWFVSpiSGfn4/Hyeh5PG2/xI2JD1vYAgGGtxW74CGHtqjPhNM=@vger.kernel.org
X-Gm-Message-State: AFuF++mr1WvXhjCdIXLozWJWSfo7tJGgLgKzvF3i5RDcwDXxSsBRh+5e
	/isZ+pd7qV4P+EGBL1cLoD3UJnUyXY3rkzF6RGnsWV6nJZuv/N4X6427GiLXZAtW4X02mzMnWRq
	ujsGoPS6n8d4IQ9HsMznSe8qPROuDD3+Vu2EVRlrPezSAIQy0un0sJLpMBHkFUfE0qyI=
X-Gm-Gg: AYBFou3zZeA1bFEaPFmd/SKRUOVtZgsCySk03xC4E3tovRic/AXyjYAFzWwBmwwggLX
	g80Uavr3SLYDtU9KPmUb6cPSrMYb98CRI3KcVi8NYqsIltE45cPPWYQ2QIXkVBiLXhyPXtvSrGz
	e+UCMjoiyXzdyo9wldMbBeKGZXh5q/JDimmF1RXskDBb2if9ZcD5eWrXYIQpRXyRK6dE4fftMuH
	R9XGIUxD6s+7ZV5fXsxEFniCd2dmcI6p0qPjV5ODByE46Xm1Tq253Cq9d3Lu+AYqyO/HRkSpW2m
	SAmSNc6nMnXgVeE6cLqDcF/X9lzDIoUOpm30pij90OKTsS6cuOkPvaFoCXTP14d5AqcH5T8YZJU
	PcFwar+4=
X-Received: by 2002:a05:620a:6889:b0:939:aa01:99fe with SMTP id af79cd13be357-93bb78d5a7emr323636285a.51.1789554609817;
        Wed, 16 Sep 2026 03:30:09 -0700 (PDT)
X-Received: by 2002:a05:620a:6889:b0:939:aa01:99fe with SMTP id af79cd13be357-93bb78d5a7emr323629085a.51.1789554609332;
        Wed, 16 Sep 2026 03:30:09 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:08 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:43 +0300
Subject: [PATCH 27/48] clk: qcom: gcc-sm6375: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-27-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3185;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=lfSrimWZThdcUoiBKBc73gKP6/y+jyHpWjqj21yuyYs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9l6HFWpAPHkes9ACaOzpzl++9pwX+YBsceb
 tFOb75yboKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvZQAKCRAbX0TJAJUV
 Vrm9D/9DnV4vBZ/oj7sp7jHCORWOIsaiKza+HEkKyGMwSqP9G9YEeqJflyn7Z8WXpVvB7LO9n2v
 Ptvmjm7M6cqsdRCFZDcBAvEsQ4dimlB7lt3WZM82djoqhne71bVqsswgVyb8smL09D6P9awaoLe
 gc0X9QpKD00O6iKbTtePPkQjdZ4qMuFB28LiTe5D7v5C37sFMYQXRmjtQE2AoBVcpgJMQtL+Ny+
 gUDERQ7jNx6GDaOGPiONsgX4QlO+CXscFC+7pm//Qg8UNs61RvrPlAy04tXhR6vpoquiVokala1
 Szt0EiJGSnfNPcH07d5HLxLXTlg9Jy54Y8a0LwLbwoxPGIjnui45RhYYOJI14WlCpt9kUhGKHe5
 0jZKP9Y3xYDy/bwdspKsD1mV/cfNWGBU5YT+oi576r43YeM7uCCy/TsTOrn3cGVeQf2UZpTUZD2
 7PXWW52rvtP8lRqIpkiEA6WoyKucr3L26akLdDHzpdVQPisq2dUGkcudRHXWPch6zGahbiQV/BA
 V4kdwcimwAbYoe9pDG7fiiCjoSoO/BY2sEfjknrjk2V3ZCDKQn8NTmTYafQ+WIbmcWcExCEevbh
 yuyK+hd0gj8r08S709kwRgeMDVr0BVD0539AkyU3oTRlp8f4P4QxKFNE5R8Hu0DmLzNz58yXsBX
 6oWZP2EaceaNacA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=POyaavqC c=1 sm=1 tr=0 ts=6aaa6fb2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=wnEm36D4OOU7-cSD6GIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX9dnrx7rzKmiI
 17nx5BeU42bIvD9ndBvz9NMp66f70lKyr3L1h8w/dkXe3pTGp3Yqpm6ArSX/3bAhbNK1T1PaRj2
 4nOUo0GQ7Qt4UqaVCcZJc91jR76h3L7UIXTltkfimldVBWPmtULi9+tpRGQ4aqZfew9JzRy633G
 jyxqzpFRhTp0CDv9vM1w4VRK/hkDVhmVTw5zBF9Y9KU7URnjptOkZDdKGLLfQJghjzl/1jGxNnI
 cKkldb+yRjkpk/5eHFcIBPVAPdLCvHtbzB6Iz6r48aeVLsS83mgqRrkYXekVlJN0jNG6iJynK49
 Z6Ztgf+ws9XmG/DMbjGXKUYSTQxChQUFuikFtf99Ks/Y4+V0JQ3RuEdzryQDZKyZc+IIYt5rEf3
 6IHCTM/r0IQmZ+aFvoEl6xrrVo0e8iQakuX8AmCwfWFaNln3CDQcnR64bVX3w8rgU0SzyqYIH2X
 wWGR2c7C+MvZzhfvXOg==
X-Proofpoint-GUID: 0T50gHkHxIrV1RGKax2YWKpy565bkKMM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX3x1LjX246k6+
 wbeRHvSUZvn9HQeQKUnjMGvhjVGjGg+yyzAgUuDcsk3ByEE1VQdf/59J+2Pt2Z0OG4dwpcdUr/p
 J2mXc8KScxgjm6X/yj7xPQqH1c6aDio=
X-Proofpoint-ORIG-GUID: 0T50gHkHxIrV1RGKax2YWKpy565bkKMM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Move the always-on branch register offsets into a critical_cbcrs array
and describe the DFS RCGs through qcom_cc_driver_data.

Move the configuration of GPLL10, GPLL11, GPLL8 and GPLL9 into the
clk_regs_configure callback. This preserves the existing ordering of
enabling the always-on branches before configuring these four PLLs.
Using the alpha_plls array instead would configure the PLLs before the
CBCR enables in the common probe path.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm6375.c | 46 ++++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm6375.c b/drivers/clk/qcom/gcc-sm6375.c
index f47dc2808095..d125243ac6cb 100644
--- a/drivers/clk/qcom/gcc-sm6375.c
+++ b/drivers/clk/qcom/gcc-sm6375.c
@@ -3853,7 +3853,30 @@ static const struct regmap_config gcc_sm6375_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sm6375_critical_cbcrs[] = {
+	0x17028, /* GCC_CAMERA_XO_CLK */
+	0x2b004, /* GCC_CPUSS_GNOC_CLK */
+	0x1702c, /* GCC_DISP_XO_CLK */
+};
+
+static void gcc_sm6375_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	clk_lucid_pll_configure(&gpll10, regmap, &gpll10_config);
+	clk_lucid_pll_configure(&gpll11, regmap, &gpll11_config);
+	clk_lucid_pll_configure(&gpll8, regmap, &gpll8_config);
+	clk_zonda_pll_configure(&gpll9, regmap, &gpll9_config);
+}
+
+static const struct qcom_cc_driver_data gcc_sm6375_driver_data = {
+	.clk_cbcrs = gcc_sm6375_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm6375_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sm6375_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sm6375_desc = {
+	.driver_data = &gcc_sm6375_driver_data,
 	.config = &gcc_sm6375_regmap_config,
 	.clks = gcc_sm6375_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sm6375_clocks),
@@ -3871,28 +3894,7 @@ MODULE_DEVICE_TABLE(of, gcc_sm6375_match_table);
 
 static int gcc_sm6375_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sm6375_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks, ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x17028); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x2b004); /* GCC_CPUSS_GNOC_CLK */
-	qcom_branch_set_clk_en(regmap, 0x1702c); /* GCC_DISP_XO_CLK */
-
-	clk_lucid_pll_configure(&gpll10, regmap, &gpll10_config);
-	clk_lucid_pll_configure(&gpll11, regmap, &gpll11_config);
-	clk_lucid_pll_configure(&gpll8, regmap, &gpll8_config);
-	clk_zonda_pll_configure(&gpll9, regmap, &gpll9_config);
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sm6375_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sm6375_desc);
 }
 
 static struct platform_driver gcc_sm6375_driver = {

-- 
2.54.0

