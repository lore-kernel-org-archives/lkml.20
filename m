Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACE248CD7B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251706; cv=none; b=a/csPBxaULSKUa1yeFB8cPB8b9ZBn2+QSfkoTrSjssE8EpjjruDdcuxOSDXS3mIC6PGkLMlrhE7Dz0J0Dkw3OYrl7QfQrEQ+S77EU0HA1OkG1TzviLvG2JaTmJK/UZujVKXC+H2mXjwjBG4HRbnRDc4FTY2iLQ/eQ2ShvVN4H9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251706; c=relaxed/simple;
	bh=pMEAhmjQ8SoU5+CjnX88Vune5TxLlw3Sq9qAxDVyltM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QbdfnPxCAeHEEgG9NZMW7+St7x8G5NhtrPpbpCqHrH2jdz6X0Z/g3aPhFZusTJXNNqw4EAyPCVGJ9Ol9f3qOWdOQEHfDaafOn0jruURCW3pjODYqnQbrseYRRZNriINtGRinnJQDqYjp7DhEWar8yVVjltOOgsboRXCXbp5wl6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P6tpfxaV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SNWOs/VC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P6tpfxaV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SNWOs/VC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4ukS803936
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HrRr+mDCkAGXrueKNpJnB0kvZSeCwJItxGhTTWWe0F8=; b=P6tpfxaVvhyxrmCE
	/aDu4wAQglwygP/+IiVul2CFdMvEK4MmcCzBigtN9rTSIH48qkg8LTJ72NLN30Bz
	3ZRTXlmQaQht62v3zHxIjagzdDTQYkPYDOUTCW3YvTueAUe4rCF6AKjtVZ7swbhu
	fMye0mV8VCMHrzvdoru2r5tVqTUz6JU4jf+aIgQHN1/BBkIEkQmzgrn9+5j0pmxk
	5ch0u8Rq60D4RFSfWbgPm2Pv76HXqXN8b28Ba6kGg8W661YavIeW2W1bNzkWDBk1
	fMn+gsk7d9EquL2+ze55V6sAf2DqehtbHfoGf/lbbdhgUHwG21p4IPrly9pT0QCD
	poKz3w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc8f57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:24 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-785827e6073so554028137.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251703; x=1790856503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HrRr+mDCkAGXrueKNpJnB0kvZSeCwJItxGhTTWWe0F8=;
        b=SNWOs/VC66eNKxeWjAod4P6w1uHCyr7UlMvDXsAfv2GyvErg5vaHt1WyFFalPkyUXe
         n0r0/fgYJaNYNTnDUhekwku0xItw/LFmPTFVGiCXQVyVPpa7FpaW9V4i2/i/kRb7OHpP
         crVwpYIP1dBXZxsHTRxykMReVx9VW52OsKrojxNUEqRWHqTKjteW+mmAEbl/yj3PFg4B
         FI/sApZeTnncIW06V9FkDgjLpInMLXLa+03zmZ96P7tApoFyDVGf21fnJCgPKdyAaHqw
         H1abvhEm+nZVAsa4e2VVDFnSetlMaYWeZqNx0xgQ5wN0LQIE1eCpFNzU9CoezDdFNZWM
         Lm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251703; x=1790856503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HrRr+mDCkAGXrueKNpJnB0kvZSeCwJItxGhTTWWe0F8=;
        b=deVBZlsdOeqePzb49SrhDiV8MWhEYbXQ2blYYfvQf05ohQhTAIG+xXClgmscrn0Zcu
         cZ/fTJ4znI9Gqxn9YitOmmdXIfBqeuvEcwTB4MNb7gJ3KYKyMzcVLZYelLUzz3pomRCg
         sbS1KgW/2NfGmmcGlpJHzl7CJ5MiSTc4iuoKY+G/J259fVz6eoJuIm32Zy1x3NlaH5hu
         De2GiFD1D7etn09L+8yy4FIXHjidQXuXD49Qtiwpw2mlEMfHyPz2PLpH6JufmAznbLrv
         SLRU8uXo9K2IUS0yMB6xfX0lFjQKtc859DH92yLhv5mU5Cwi7ajEjlU1S2nRmEzHS9jQ
         zGQA==
X-Forwarded-Encrypted: i=1; AKwUvByR+pf6dOFA7YMaG8JIVPk1Y1kW96kh+EIzSx/191F5kUjowifsyUmSQiJh3IK+IEfQWuQBxNthWWlIM+c=@vger.kernel.org
X-Gm-Message-State: AFuF++mbnevQgwyxu5BycnuboVcFg/kERLoGBvo/FImqHRBfcX76S/Y2
	lepLK6E6upWsIA+Lg/kYVyvbWwQiYCO2MexWO8/+ZmFu8cTvgNAj6aA34ArdV3qTh4pqOnZDHC5
	zZ8ZY29BvEm87kOa29/JTwgVOzAiVfrEtBSx2SwAVfN/dtMzGnv34CY08znMzf7oZVko=
X-Gm-Gg: AYBFou1aFryCYikn70QbIy9vbxDs1f64EAN+i0tnPSRR+xFTuxuGSV1En35VaYev/F0
	UwUjBol7xVmmZWDr5feDMJ627GlMBZhC4SBQ+yRXNJPBc95lqc+grBe8mf490NQj7DIxbH7ezjQ
	/tnR/CoqLj8IuTLoj4YLDh7zhjckp1VEnFpBv0J7Xu+USaB1a9oFrquyeiZLx56YX/kVWFaKkKk
	i4doHtF5xuWKutwS9jPQmtEZ8wJWBH9qKRrUYa+G4q0BWwCEpPTBIkeSzlKlTL6qLZ+7DQi4bvQ
	mSkVWhKIq0RJMUBIknG4UhPrM0huyURo8yRhfISocIhPjSxJg44DE2L/Z5BofS/IyYzAddZRCOh
	ZXdp2HfnK
X-Received: by 2002:a05:6102:5707:b0:7a4:85a8:fbc5 with SMTP id ada2fe7eead31-7af1d1bb461mr1067210137.16.1790251703371;
        Thu, 24 Sep 2026 05:08:23 -0700 (PDT)
X-Received: by 2002:a05:6102:5707:b0:7a4:85a8:fbc5 with SMTP id ada2fe7eead31-7af1d1bb461mr1067197137.16.1790251702747;
        Thu, 24 Sep 2026 05:08:22 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:35 +0300
Subject: [PATCH v2 23/48] clk: qcom: gcc-sdx55: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-23-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2392;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=pMEAhmjQ8SoU5+CjnX88Vune5TxLlw3Sq9qAxDVyltM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJX9KDo56OXYKsoACbcEGEJgfuiq4uumpAga
 JbdJ9u4RI2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSVwAKCRAbX0TJAJUV
 Vo9ZD/9biE3OVF4NZysl1yMmWTeNjHPSIe+Yoi4s7XaDxS3+FR1UFas/DV3tC0CW++tCneoy1BG
 UwbLrDocTnXRJJjZS/Vds2E0K4mu/JiWSm02gyiIqJHJs+plcua+KFuUPT3mnqgDifS3BmsfppP
 81waVbGOJEFdSuD8WHgjAvJugKmhp6wEHI0S1X56CVzd+r2dBoeR6hsdLoSXyxnIGI0LTEuKZzc
 u4MWBeyr6p0V3JaASQoJgdpjSRoJxZ+Zm6g/zOwcO3kKbYEz2ZY1R4NJpOACR+KSOCVrGOg76p+
 /X2bRa3hDdD/vcAgvpwFbW4JrHZvlzWjVI4zQRkiNItoH2peUYOgDWbFTDNIhxVhS2y/ma9vhOD
 IcEn9xbHN7LwI1nZ+t0L/vHrsXu/a65yWp91rieYcO0eBqmDJVmHQMTu20SPJSpS634qHnia2Va
 EGgm3dy/TwMzkZ/NI3TFTMG26qEjxJURMRJlBdNOMEAYYkiE4X9Ug5m8qM/uT4CmPeoILOvt4mP
 J5l3J0V7fcTm5pawdzHyEChLSYT0/FM6rbJXwxYh6OeHPKLoBFXxYHX6k1BSuqj/5FiQTMEvod1
 yLUhXjy8yjIMaD4z9ehGGYtQCuUebJuNgpMT0iR3TMGEpjF8L4COTzIeJDXaAq8eqeEyUl/s7h8
 Qp0PZ+7B1pAeljw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: QPWL2sTzkSnOSJCz64m0RVgrvWwI4QRf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX1GwAIKZDM3/q
 8h9s9e4VXh1ECId855x8ZhrMr+RGjGoQ8+oNmunqCiq9N+zeZmIiLt+ekRBfBF0rU9ChTxNZpmW
 zkjdj1qC0EjVJcTwzEAYrbATtzM7k6SDTNeAMNJxBvfdfRe7W/Y1H9ITVJj8zjndRfw6nSp0C2s
 Ja15h7bAZu9cdpAuMxY5DC4b8yzYB6gN/hV8B3sH/qhOAC/SrsAt6IIR0ai5ouC0FHenUH9htVs
 wQkFVE/xe2YBtTfY5zB0hqNcAn2DQzSMFLuXkOMnRRF3trYW4Xhz/oO+3JPzEC2OiZlROvZXu4j
 VH6ov1+OPDvH/do+l95WnOf6XWmMUiEnarUpCIVbgWWI0FAWgDtbXPTXpSLXU+4Ey+t0lGLXBA5
 yoaSBwhZDGuBHpZsDlPlk1qctW1tl3Mv0euVfT3X99C/RDwBrZHS6TzyqMF67hXXOufTRFyp9aW
 HVTsQhqb2EUIepWsInQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX0nb/SmaGYlwf
 douC5VPkSh47WC7ipF/87YnHl9afANXJD19lVyMWLwKRNn8Q5FO9cqZwm64+pN8TiYW7hNYmNBX
 zbWbLAxhkq+8MOhwWnVD60MZV3etHBg=
X-Proofpoint-ORIG-GUID: QPWL2sTzkSnOSJCz64m0RVgrvWwI4QRf
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab512b8 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=8L-1-Gifo5kdOXCWqOUA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Move the always-on branch register offsets into a critical_cbcrs array
and move the register programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sdx55.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdx55.c b/drivers/clk/qcom/gcc-sdx55.c
index 13d6c9e8183b..8d8547c12b19 100644
--- a/drivers/clk/qcom/gcc-sdx55.c
+++ b/drivers/clk/qcom/gcc-sdx55.c
@@ -1587,7 +1587,25 @@ static const struct regmap_config gcc_sdx55_regmap_config = {
 	.fast_io	= true,
 };
 
+static const u32 gcc_sdx55_critical_cbcrs[] = {
+	0x6d008, /* GCC_SYS_NOC_CPUSS_AHB_CLK */
+};
+
+static void gcc_sdx55_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Keep some clocks always-on */
+	regmap_update_bits(regmap, 0x6d008, BIT(21), BIT(21)); /* GCC_CPUSS_AHB_CLK */
+	regmap_update_bits(regmap, 0x6d008, BIT(22), BIT(22)); /* GCC_CPUSS_GNOC_CLK */
+}
+
+static const struct qcom_cc_driver_data gcc_sdx55_driver_data = {
+	.clk_cbcrs = gcc_sdx55_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sdx55_critical_cbcrs),
+	.clk_regs_configure = gcc_sdx55_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sdx55_desc = {
+	.driver_data = &gcc_sdx55_driver_data,
 	.config = &gcc_sdx55_regmap_config,
 	.clks = gcc_sdx55_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sdx55_clocks),
@@ -1605,18 +1623,7 @@ MODULE_DEVICE_TABLE(of, gcc_sdx55_match_table);
 
 static int gcc_sdx55_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-
-	regmap = qcom_cc_map(pdev, &gcc_sdx55_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x6d008); /* GCC_SYS_NOC_CPUSS_AHB_CLK */
-	regmap_update_bits(regmap, 0x6d008, BIT(21), BIT(21)); /* GCC_CPUSS_AHB_CLK */
-	regmap_update_bits(regmap, 0x6d008, BIT(22), BIT(22)); /* GCC_CPUSS_GNOC_CLK */
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sdx55_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sdx55_desc);
 }
 
 static struct platform_driver gcc_sdx55_driver = {

-- 
2.54.0

