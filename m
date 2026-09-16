Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2F24F55B9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554678; cv=none; b=e4p2IujuvAv8CF85rgj5gb2OC0juqoG+5Ozs6JMXfB8SjZoI1GpV7dFCMK38DuGIErr9YWMXXxffBSaOLhVG1cOIPLxpoqpStbT2EeNSiuIEGMDz0PnCR/cvkUUfNvEwButG2fKz2z7C6m6P7xpL2qSuZsevBQDrfpWWtyKFvdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554678; c=relaxed/simple;
	bh=iz3ufEAKkkYlJRxzb+jInn8jCy6Z8EJIEctOZKqgVTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o3u+/oDvhULnKRq7pvwreQll1fuCJw1CfiuM4kxtWZuMnLTnSbzRWTIz6cC69gSW2Qv0FGKBbSDvqgLBrdifc1ACbA6Bu55kBfyE81KxgENP+cZgVFhyOqx4DLktWEhVW5iVgqnVhKiz3xzqxrGt660i7ZoErZrqyI0dfQfai+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IkUz9txc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bfbDXT0v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IkUz9txc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bfbDXT0v"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92g3G2348128
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aNZ7T/K1K/h3C/amGLynz6dtFRmOnZ0U+RH3dZePgE8=; b=IkUz9txc+4g7/Z2V
	cXzCxvVZOIDkj5pPQvUVOVjia6pJZODID4H3Vw1vriFiwW2SKEIubvMmX02jIm+p
	sMBy1zhRH3IINJR+VZfI742XvWvibFlVn2uDVZ9P3Mp8kGywT3szAWIX2EtwxkzO
	W/qHWSTsa776RssS46FH1Y83SkAzABjcUXmE2xJESP8mL8vyg3lvuN1i9FmAHM2t
	j9qOzhUBQNKK2F5apCHgCdcvcw+xTAj8CJXEPdDlySXYcynaQ4iGzB9hDAFP44Lt
	IES3tA4MjKn5jjrP4tltzrqOSO6kU0anoWn9H7eerDpZIIBvD3P1TiFtKVqlpv6K
	AbSe4w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdywas96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93903622880so379584385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554654; x=1790159454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNZ7T/K1K/h3C/amGLynz6dtFRmOnZ0U+RH3dZePgE8=;
        b=bfbDXT0vjeTBSGZiay8XgvCYtINYzjEdnt6+XSO/ycUZLzRrwUk8BevzNLAOIjrBy2
         tQ1HTIvlxsjQ9WhUw56igJvwp/9PZ7XUhDYTx/OaASUAqgbV2nPveSslS92lBKT5pl9a
         sRdHn67EcmYmF4sJwPBEcRYBzyUGId7YCZCG2BteVpgGf44xDk9M9R0MbDp9nbY9xCb2
         XVwTLaDxAcXIY/gWPccdLQnbT14ar3W+jPulVrSz+thMzxILv89/3+g3jL1IKmUxnDIK
         kFcGWXKRN3PXi6nj222tlWpFibGGyoj8uCkk36CnRL8DggypHGnt2kLVSahjzijuHiry
         fciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554654; x=1790159454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aNZ7T/K1K/h3C/amGLynz6dtFRmOnZ0U+RH3dZePgE8=;
        b=CszL3V1LJpsxWpRgZeL+eukdmMyfAPZawIQ9EYLW2Zh5kNwp+QO1yzyyg2AFl7QxjR
         FXVM3p09KwbOCtvPggFmJ2EoDEyJUQU5k2SdJRt2/TLfdp+pr+ywa7rjEs+Nf7i+lRIV
         tSaiGf8ARt8SdwdU7gN825juX3FV9v6u28iatBMeNdt3S0snauKbjYLgE07sRiDNa8yR
         ItFgqBRpOwYBzfnM1sa4EEGRIcTkv3K6PRzXSX/cgzIr9HiDINtngpH2yYBkWri3qZBG
         7LLep5vFA9KQtZdJzSVwYCrX/PnqenYalM5EoRSojex29vuVQggXN/+EL/0HbP1yd+JI
         4YDQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2HtbMQGiCc5kZBPB3w2aXEI3ufdm8YGQd7wwf+hEXWVIHLCTtdWNzAiIkTX4ZEo6p6Z5bAZGCk/gKHQo=@vger.kernel.org
X-Gm-Message-State: AFuF++maRGKaDi+vnclbGrKAjJtBYoTTPIFsopvXL2zF+dk6L1J8Ch+6
	bV78e6m8mRO7vn8tBw/HTFeulizuYtkoNs8vUxAM0DZmMlVMK+pKlm++rbJQVfEmptutnbNPf7B
	nz/dYH8z9XHQ5PeyrfYOlq58BKpQuYqTjdcBq7RGxzOTTeDQupefFkLpwH9zauTX67ro=
X-Gm-Gg: AYBFou2ZC2EOw2m1IedvVD4xnof3x+trXuaj52LiWfTTB41FIMDp9dL8CcO+oHXojGC
	yY5AppaoSrRUiO+KRed21dPHjI85MYdFTfmqR9nqYH0gl8X3YsusRpK4hrmLuDoc2AGyhQVhdVq
	eyTREXpgb1x0TavebJgXfLki9YFosOerX1elLUKTS5yITcYUmCiPlxWYEYxWFdhAl33Hhmh6l+4
	GAXtRX1cgyofd0p7gWU1hWIO1+O9lbuodgh8zW3Tsjcz3dxL5Ji0QP+JBaKcX5lKcTnLPgrRwk1
	3USPeWiRiVBDkNo49vojEEqMR5d+6S7z1Wtl5GMtLYVZKf8CHT1FWw+xi8oDnnqy1+Br8MD+g/T
	2UmRq+YM=
X-Received: by 2002:a05:620a:44ca:b0:939:db29:4c11 with SMTP id af79cd13be357-93a3477c99fmr1003072085a.46.1789554654157;
        Wed, 16 Sep 2026 03:30:54 -0700 (PDT)
X-Received: by 2002:a05:620a:44ca:b0:939:db29:4c11 with SMTP id af79cd13be357-93a3477c99fmr1003064685a.46.1789554653617;
        Wed, 16 Sep 2026 03:30:53 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:52 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:29:02 +0300
Subject: [PATCH 46/48] clk: qcom: videocc-sm7150: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-46-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1607;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=iz3ufEAKkkYlJRxzb+jInn8jCy6Z8EJIEctOZKqgVTs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm93T8BN4//sQDc+JC+1958KF0tw9CeD0HByz
 2SnsgYqwGaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvdwAKCRAbX0TJAJUV
 VspbD/9IGQ0GrBZx7Fd6zDEFrSrBT5WoGqwAhzcN18I0Vo1A81GsCEf57KuKITJZGhZgyeXym5/
 GlhyHz1w4IoWWoMmt8D7e1edaBsmwb3zeq4pyb9wWneldHvPlF5+nMPgCSTJUUhvF7rilNp5olL
 f33af+VdEmro7Z94w83y6tZAy/y1mH/pZgNMbIbHDi++BRJSlcRAxLi0a+OpK8495dBc80immXa
 L3S75uebT8oX+O4E54P3KOwWS4cHu8adqVxzTzw0Duayeg2fQ+bDFIjMpOUNyviSm6EmoUzGC2u
 OLElPWo4vGq9hY/76OTIzxTCVURWTNebgVZdHunoUZR8S9Wkitfaxl7qGTqokszwTwESUKlQtKa
 /eHe8ByGbfCxTYULj2SqF2INz9tV1hrFnEaD/c1eCvUWPzO1AjXZ1SbGFag/Re/4526raTRyyLU
 9lD0GrYfUmWQWCmthqW0dG1u1u870KiWWMTjj0sQu/UAsUtCTPIvMUR/59pGYYnJkWwEldBHsBw
 cChh/SHxF6Ud95ajWI31I0ypbb8MISIlRikfMvLWJ8L9Ta8Z8iN9hKuOmMJX18Ykvp9yqrEsEJU
 MNB3IZplnJiJpEaE9sVQxK275wzE7alh9YMYCu7fS+ocBgjlB9XuE+itG5QMxsb/v6HGJKSCaFs
 rxTZK3dxQuH0Dcw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: nDjTX0ABO1qhAfbbjboIpO6r32-uKldN
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaa6fdf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=sYFbF2zXfO1Ub-DH1h4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXxtyMKF/YJRkV
 cruiGqbsKWUWSGiHXFsSchCcOzO0qnp5x599aS7GXvqlYvl7JqZlV10SmHuoEJauffYEQuugc28
 fh1ynsMNPxa1Tc++F2lUqpbpKYvWsxJoGeJu/DrgP6x5UQMhtZ/MxbddnNL8kuQv9BygSaP6kfD
 Eewmc4rsfOiPdwmkbXf23OoC1YJgUuBnqs3aDrgU1mgxJn8uZsa73/UWWSqq3uiAdDErMO00Umk
 yAiMEI2G8UDPX5ZGPTU17OAWGck1AH10tKIbkWn2TykBqyvOoP71AWb97CkivpK1/73eRIGwE+u
 dlFf+jSgSPVqvbttHUKLPwP3v7WvyxfazSZezAfn2QvLGTXpIysB6h1YDIpH2sVql5/JbiitLa3
 ODrdx4lLNt2XyUj+iXvZc6LUKwz/JffgNOLiKdWXjGUxuUf/3LnxeoRNEPTxFDjGziFzgrWBj4S
 bQ3HG7pD+21ANinqnww==
X-Proofpoint-ORIG-GUID: nDjTX0ABO1qhAfbbjboIpO6r32-uKldN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX1QyTC8wOjXue
 ZUzIatXUmGSo1eyAd/ualzh6jfo++6eGccxDfFlRGbdWa9uJFWAv6z8QbwSbB3MKV5ZP6tY14Ci
 RT4y+51KCCou/4e9BrxehDVrQf9GwaU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/videocc-sm7150.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm7150.c b/drivers/clk/qcom/videocc-sm7150.c
index 8d2e00799f96..32bad5e09056 100644
--- a/drivers/clk/qcom/videocc-sm7150.c
+++ b/drivers/clk/qcom/videocc-sm7150.c
@@ -313,7 +313,17 @@ static const struct regmap_config videocc_sm7150_regmap_config = {
 	.fast_io	= true,
 };
 
+static const u32 videocc_sm7150_critical_cbcrs[] = {
+	0x984, /* VIDEOCC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data videocc_sm7150_driver_data = {
+	.clk_cbcrs = videocc_sm7150_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(videocc_sm7150_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc videocc_sm7150_desc = {
+	.driver_data = &videocc_sm7150_driver_data,
 	.config = &videocc_sm7150_regmap_config,
 	.clks = videocc_sm7150_clocks,
 	.num_clks = ARRAY_SIZE(videocc_sm7150_clocks),
@@ -337,9 +347,6 @@ static int videocc_sm7150_probe(struct platform_device *pdev)
 
 	clk_fabia_pll_configure(&videocc_pll0, regmap, &videocc_pll0_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x984); /* VIDEOCC_XO_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &videocc_sm7150_desc, regmap);
 }
 

-- 
2.54.0

