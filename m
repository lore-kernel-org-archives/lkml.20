Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB68A494824
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251742; cv=none; b=nBCQD6UO9eDzG5V9MGVAumGZWnho56KPKX1KKOPh3Da1zCJSL4PYbzS7jRMdQj36kBrmIDFfHF6v6rnZrjGdWMfjZb6lfJ7ULv0uidNjNEYhqVuE1XYco81GbKvdVeLg9g54GubSJTNq2c4TKS8yO8ylWa2dfAVgG6P7Y/pC8Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251742; c=relaxed/simple;
	bh=p0KMuyrUwigTxHa9cMX6RyQh2s4AdzkmM6lxAmU2A8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FhemELkCtinWzTIJfwdQ2+OnQlY3GFUbofhpmHTn7xketTJdzs+VvkKehlY5hEDDwue/xsXrfkUi6//+AParyvhDKx/fVOf+UrHT6h/Hn2Ny/BV2iZKA7LAkX+ZGwqcZXZqHkViwA4cfkSFnyr63u+8Ypl0JB5ZWdMyIr0pbnGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q3KElv0F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FKRngbYh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q3KElv0F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FKRngbYh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4vfh1630822
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	js8buhZeDJ4iEw/5I1GqGOYmeIOXmn4DsTz9MpDTgdk=; b=Q3KElv0FBQynwPR3
	ebNKtQmCnw0g8wYe4AWjP5V3McmOLtm6mJTrD1wSc/Ig04KVCNCZ8n1bvNaUCJ3e
	n8q6W4wsJLo3UYv+WLyAZynvz+oG1vGaA0y3yae7HHPGLSmi6CMcgfaO1hpA6RrW
	t7/uZyEldn0W8qRhS79fuRWdT6Yf50OR3+jOwFnjBzSSwJ005jKQi1V5mteUbgG+
	1RhhPHrPcARauUCAdXYm5xMElPQ5TEaYxjVvd7pQHU6AC+o1snTFIQuJEdkbwc6r
	B2VdflFgkQjFoGhJQm3jWbPtEuOolIvd9tiwKBejKZQ+WOv9qg74ym6shTsovV3q
	J+qcAQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90axhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:59 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c683ca769dso783229e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251738; x=1790856538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=js8buhZeDJ4iEw/5I1GqGOYmeIOXmn4DsTz9MpDTgdk=;
        b=FKRngbYh1ju+Gv49Sdd0vqlTiy/wNGCbN5TDTeVeWaVARadpxrJVq3sq8WBDZJPRzg
         ERMc6p/5bLdsKh6NiXq9yoXoFMwiqlB7R+wm7YA7P9R1QNTb/ZeOx23T+kxe9ZTFcizo
         JorgS11MGEan65NEXAkXRQph3N9CLa8C8HugMJH4nKUJ1leR0vhg5Afx6cqvCf0VM1ts
         kXQBm0cXzuMZtfhNaZTrmakpDGthpgsuXUjPURbceUtMige5IMA8H4K6cNbRowSXDs+/
         GemR4z53wtoc8LVU1Lx5uUXNKucBW+GJN8AbPt6jI1QGFDaBuqS74ONCesdX7WxA+DaH
         h8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251738; x=1790856538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=js8buhZeDJ4iEw/5I1GqGOYmeIOXmn4DsTz9MpDTgdk=;
        b=nVICts3kSk8fcSpqT/UrGr45y3dinsxpy5toeuO+FLxG5cDuUKqaeBcz0Y2HuG2xcI
         vc7qE1sUEXsMMpqcNX7a5A8yQefpkx/R9YMWVykKJ36Y3fy5gp9E6IjyI0FyHZMJ/EQ3
         HaXQ0IJ5Jyu/GfmkC8CHw5RuAXYRC+/ISTakCJaokwLVID2CC3Wa4du69xNtUem8w6Ma
         IiuRl5pXH3Ldw+tIeDuKVoUl1Jc+WNTw3NYbDFKVG/iuWj+f6Sd3MnoYca389X3sGzcj
         WkSjamVe2SMa6CWzUKhBd8anfpVEHDj+Fea4rsjlh3eJtgnun5UukieLhcRXW3FiF61C
         YklA==
X-Forwarded-Encrypted: i=1; AKwUvBxfNzOo7lQvbiYzSGCJmFKRXrropiAmTZMrzOV+q1Grp8gn+mlyC+c21Tuc5kVBv1en3sna75IQ9RQkQDY=@vger.kernel.org
X-Gm-Message-State: AFuF++ntGMMSiVNlKoExUM4FUV3OlVZ1lIW7iZ4frPCk6Wh6PS3mRaJo
	i0c/vO1PAsPqCfisCv34sZFBdooFP26y0lJ2JcYNAtwq4NAXIZJZPdFQpxeTKQetWihxm1GN6Pa
	EwBZj4SMPMmY5/QcMrEJT8D5wi+4ummWWq7nbGBGzYYVYmTxAXypuV91MLsbIoFmXM70=
X-Gm-Gg: AYBFou2A1CTuXQ3x3f/aIZu4/Tcc9AKH/bNPEONtqrojA1YdSUVeb2EmR/fUsBllkQx
	HJdaWLEj5Wab5oduMaCPGd91p7FAEZ+2g1fwu1SjPCwdFpIoaeIAGVxO9trx+PQyOjoaKg/kLaF
	l4/IjVBH9/Vy2rmqDgVwlr77fGUASvL2PjmRbM6HS7/7tVle6zNWeGTD2Wxo/j+SoqohncFO6sf
	aFXtADrxZ3i/5Wps1sE/ZiMQKTSv7O+M/tsjlgMD6CjCl0m1yTbE1C8S8EwwARduaH363mimfUN
	QFB1xzGD5FBB0ItTq8rVvTDVxtpHnAEAyBwJ3+wyJ9+RUrU6DKVjaw7mgI2lbUTZ+qohuzsiS3b
	c4U2OaFmh
X-Received: by 2002:a05:6102:2922:b0:7a1:f951:f2fe with SMTP id ada2fe7eead31-7af1e4e7dcemr933577137.17.1790251738103;
        Thu, 24 Sep 2026 05:08:58 -0700 (PDT)
X-Received: by 2002:a05:6102:2922:b0:7a1:f951:f2fe with SMTP id ada2fe7eead31-7af1e4e7dcemr933566137.17.1790251737572;
        Thu, 24 Sep 2026 05:08:57 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:47 +0300
Subject: [PATCH v2 35/48] clk: qcom: gcc-x1e80100: Use common clock
 controller probe data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-35-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3818;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=p0KMuyrUwigTxHa9cMX6RyQh2s4AdzkmM6lxAmU2A8c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJj6+19VSPQkZK4osz8RRRQCs39vusRXNKkB
 pph4yX1XjiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSYwAKCRAbX0TJAJUV
 VnpAD/9W1Efb/h9LiAPHHp7od6ImqPk7hCL6CTe5JhZYiY3CydCRo3+qAgc6v8rs4P+IYTQrs3j
 fOFem17gav8zFuj8voKBynq2pcItc0LO2faW3aBYsfr5FK/l6SrePGCImwVL2NC2rWwpKuIKK8T
 wwZV++zcGhgAn5NEh5mKhac4UgclDqb85T9r3zpEIH3P0KC+HCGEkDUVeUfNVD/V3RQLa6TIg+m
 vGRE//JhfDNcEfT2iH06Wet+5NfGJkE139WrNBG1DyDFt/3iw0WRdguAhGZMkpdSeX8yVr7Omgl
 DVnih3LHz3fhSYC04BR8uIe3W6OPjjNNIa7AMRSZzbJpeRXRh1sT0BwrKvZdoIDcqM3ufIGmTMd
 GelUW8DGOY4WmG3IhhBNVHKEL8GWZYF36eoHcbkdb1pSlPxBylQsZs3dEdWCjyXcZNj3JAxjKmn
 Z6XZuFWh1UAiiyoR3Q6h16zuQZUKHRpYp0W69ROkct3C98Gy24bTJ26au3B+WGI77ZYozkEfXlc
 6GEGbzRDhnX2yOM+7ZCYPYIyGJiLXH2e7TrxQdC37O9kXwiaU1qMocaXoFePqXlkzzk7WEbetC2
 xORD9Hx2GdNVh+EAp/76RZ89sfqSfu4UytjD4lI2IFRgUQPqiDrwF6ulI+0MGuWREICpTvtyZCh
 6WMU8Rwv/MUyKUQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX3hHDLYyM3CO1
 0ecnvb8p4L/jzT7KTJwTCLIYsy0pAU/ohmkgfgxdl2ftUG52y0C7D/RKictDcan5PFRUTlqIF8m
 v2iVsN9VETfI3B2zTUqVnTy+gdB12xc=
X-Proofpoint-GUID: rVeCC8uSJRGBzV6wh_RGwnYNBcec1GMJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXxvtb1VlWWlk/
 kUAL2geDU1G9bP8ImX+XcoIUbAx2PthBSyLSyMtdpWIA8mkQWN5gvaLhM8dEPYgumTW0RjwpXyj
 P9EDFv5u5e1Vhc9xoEkKaZOanKBW2cjRmrd2JynNhNsgzjV18rMFv3iItE/e7xRd8gWuC7Xymgy
 58tz7s+1JaiLVqWyQD73yIAKu3kezFEDcR+L8fIdi9T07xANTRtwm/W0T7Rngrmwm1xZ0UM3tYS
 M34usyVnXSDgMkC1m8BvW+XTDJ66b+tu0gstNFJwqvUyOdd6MDQADiRxe49QFhLfo3MkRSS+jmG
 IuZEz4cqTtVlBJ8hifOHRnjfNcxXTicWXtytj63nwglXrp8rkXzZ9RRE5OzSUVtRm+FnxplWP+Z
 HIjlcdtNZcME72YhK3+/gRK+ti09/yJADr08j0cxExsGdbnfS9VAL+Y8JYAQU8MNJwcExk5zsCp
 ULirKqDjn3hsgRO6dzQ==
X-Proofpoint-ORIG-GUID: rVeCC8uSJRGBzV6wh_RGwnYNBcec1GMJ
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab512db cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3W-9O9G7v02zwTbmxhoA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Move the always-on branch register offsets into a critical_cbcrs array,
describe the DFS RCGs through qcom_cc_driver_data and move the register
programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-x1e80100.c | 61 +++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 9402fd7fddb8..41a66b0ce529 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -7441,7 +7441,37 @@ static const struct regmap_config gcc_x1e80100_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_x1e80100_critical_cbcrs[] = {
+	0x26004, /* GCC_CAMERA_AHB_CLK */
+	0x26028, /* GCC_CAMERA_XO_CLK */
+	0x27004, /* GCC_DISP_AHB_CLK */
+	0x27018, /* GCC_DISP_XO_CLK */
+	0x32004, /* GCC_VIDEO_AHB_CLK */
+	0x32030, /* GCC_VIDEO_XO_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+	0x7d01c, /* GCC_HLOS1_VOTE_AGGRE_NOC_MMU_USB_QTB_CLK */
+};
+
+static void gcc_x1e80100_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
+	regmap_write(regmap, 0x52224, 0x0);
+
+	/* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks */
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
+}
+
+static const struct qcom_cc_driver_data gcc_x1e80100_driver_data = {
+	.clk_cbcrs = gcc_x1e80100_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_x1e80100_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_x1e80100_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_x1e80100_desc = {
+	.driver_data = &gcc_x1e80100_driver_data,
 	.config = &gcc_x1e80100_regmap_config,
 	.clks = gcc_x1e80100_clocks,
 	.num_clks = ARRAY_SIZE(gcc_x1e80100_clocks),
@@ -7459,36 +7489,7 @@ MODULE_DEVICE_TABLE(of, gcc_x1e80100_match_table);
 
 static int gcc_x1e80100_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_x1e80100_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x26004); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x26028); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x27004); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x27018); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x32030); /* GCC_VIDEO_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x7d01c); /* GCC_HLOS1_VOTE_AGGRE_NOC_MMU_USB_QTB_CLK */
-
-	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
-	regmap_write(regmap, 0x52224, 0x0);
-
-	/* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks  */
-	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
-	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_x1e80100_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_x1e80100_desc);
 }
 
 static struct platform_driver gcc_x1e80100_driver = {

-- 
2.54.0

