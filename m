Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3871D489FC1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251699; cv=none; b=nTQWNXqO9BMTEPsPl8XE7Ql0RAHU1qTc+7eZ/ABjcSbgpA7QBBr6Ng42zTXZw0k9A0z20RJ6sIm6C6GQRDYHHawdMJFruEaGaqJ5058thSsfG/Rbpj31aomnVJ4n4+bhv5UIQnrZXhH8SrxAzKHkCYEl+mF4LSzB3BG1Cvw9hUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251699; c=relaxed/simple;
	bh=GOaZqDXf/TeKArbS7Ev2JBNtwRB7b/J0lUfFhyNF3Ec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N7YP3pzVm1qyX3L23RxnEC0Wg+6J8MQLAkSnPlobxr1Zi4WDJohbxqHfF5XTew50lFXKHKQKBmwOpq79BHTlYVqUmyPP+IuW7m7/Nx2IjcOmDYPRXRmWnPURHVXL55vr2VxELQWWUNxEE6uO3ebZuZpTYvBj6+/dXMElnjd0T0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYv66rtU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iSm5KFbr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYv66rtU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iSm5KFbr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC50rU2002349
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kr63+K8VrovD5vtNEhfp/foiZPBihM8XyyQx+wo7buw=; b=VYv66rtUcydAAvZi
	ld5f7dQIviGTmk5SrEjwqsuZvI0L7WzKJ6+vtYCgb+UtiAnvZZHkT+wWb0smqD+L
	jREWHoJWJNRzKX6bF0c74sdELcPDBEX4BpqZgBdBcxaKFua6JhSAyM4H3l2O5g+c
	X0bhgtCq147CZ09k54tF7ri+oQZ48AaM0lax+AGIHcnFAYJwdvnfddpgwyXLmTNu
	jKxxMAI0OeAUd4rSyfnGGhqJ7c8HKaWmE4/iq7gkuolAdJsCkGhHtugkNSlS7e/S
	HC8kEBfffQFMFvC8R4a+qKzHXWnZDaMWbYWcFIYWJQAzgxaYoZtxzAm2zbwzvsZr
	kYwRCg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrrbedd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:15 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-79285c98038so1729376137.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251695; x=1790856495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kr63+K8VrovD5vtNEhfp/foiZPBihM8XyyQx+wo7buw=;
        b=iSm5KFbrt6p6SZWInapzs3dVEnVvMg/Dub5floOkSDVEI/ZoAZ+x1fWOtOLqcpBKU3
         gZnRKCjJ0NEC3ATMkBltjX0kLx1lnuaAlICHlPVU1jb19bwqn4B3HmYIQVOHZ6RYmo6X
         ogc8An1eAoceFW492U20TRPXsIvKnAY6ZZ82kTVWRsVNIjniyDI9lsJTUW42NENo+SRr
         CAWCewZI/njBZ4jUi8VwTBMntRXRwIEWa+EBUkgY6cvI7lQXlkAFi1B3kiKxQGNJ3e+B
         im58rZ6iFsCv4/LfBj3OaM0wGtPCqrVuvbdOjUUbfaYTee5QI4VID/iVu2DNkfMLOlgb
         9F6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251695; x=1790856495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kr63+K8VrovD5vtNEhfp/foiZPBihM8XyyQx+wo7buw=;
        b=D9MJEaUR+xMmQovdbZdggyEi/9uSjlxqynY6o8CGgnnEZweb6sLEqxBah/mlDuK9jL
         tcplykaF8uitp1+v1yRcueBRXH22WTLp6bunZheyj/7010oYVzumhOr2b91/tcTamMoK
         G4BurE+WGVv/khY9dVw9PXgtxDhCAy0G0K8oXT20U197fEyMVYG3aJ279VEpHe6al0pe
         wQAod2/Aox7zx4WupSTnUyR8189vfyvQ9K30cE/g2Iy9qOGXF5kMsF7KUksp0l3BTxyA
         H6+xhpCupEaLieathHOpLrZwL+lgMVhPgPZqjzy65mwCO2etBWOWtG1pEpq29Mpv5XMv
         jgBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoqvnzIeh6+1srY4Hct+qR7m1EN5rg0uQJS8SrcP4dpizrV2yCApxbcow+IAykh7oDj3N30tUBkpHydYw=@vger.kernel.org
X-Gm-Message-State: AFuF++nMSrU5XrGqW/KS3u5c6+8J0NhEyN5eeedwpvJrc7t98VzaH3e0
	Wjka7UvWsfijIaM7TKOyxH2aIlpJ4qwZ2Rr0gO0y+2YXbyghkAIWqnNuODAQEsdc+L0J84heNkZ
	+QUmIOWTPJAoo1N3sIwIcujmECAJldubaGJuEAbwBzj3CY7ve45w33MJJVz/YmlACiEs=
X-Gm-Gg: AYBFou1TpltXykllbs7ZzTw/QbmV7cFSyfVdIdGfJ0MicU55NoK+T3AHYVk/wxwvKpT
	mZdFEpOhnYexEeDgRKpFpPqXiw+CpLaaRPHr71XlaemL9jY/UYFBvpSghlC+vEXYbMGLxk3Rz8h
	yQXtGPabW4XaBUq7ihu5dmvi7GgxYOynoTHag/XVqw50FWB/vjfJ+mykwlV/hIt0GC4f8CPXIdb
	oENu3Wrs70FVM8bxtYYHW5OFjWxKjk/HWKc0itM3CP0YXCN2kZtSkTKXYgWtT0IHiPivGcOuBDU
	u1eGkojSGg50exPH/RE1q1PGxLCNZtobym/dXRj8GVibd4zw+4eWzvjjTvP8NLcJh3e/zbcf2mr
	YdzTQS8A8
X-Received: by 2002:a05:6102:3ec5:b0:7a7:198a:c2bd with SMTP id ada2fe7eead31-7af1e2f54d4mr1225043137.37.1790251695185;
        Thu, 24 Sep 2026 05:08:15 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec5:b0:7a7:198a:c2bd with SMTP id ada2fe7eead31-7af1e2f54d4mr1225022137.37.1790251694593;
        Thu, 24 Sep 2026 05:08:14 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:13 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:32 +0300
Subject: [PATCH v2 20/48] clk: qcom: gcc-sc7180: Use common clock
 controller probe data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-20-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3531;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=GOaZqDXf/TeKArbS7Ev2JBNtwRB7b/J0lUfFhyNF3Ec=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJUUdyjGnFQpfA6iZ43+BEF8rmPE5h4MvWxL
 mkn834xcKiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSVAAKCRAbX0TJAJUV
 VoQlEAC1sCM5lZCA1uVHwvl5eKGgbjWzRcu4ggcowtDS8UZyOlLimEPEYxFqwA9q+Ny47xnCC09
 OZq8ZRXxRkA6Mad6outUjJX5mcr3LXrSiSJEy6zQRzjGi/2nSn2v3SZLJRwatKkeKzY5j360YxE
 MVOZrtDCKaPgVRmGf78UQuLUIBKFTv5W7snqxsPHXc9+OgUfVIM2WWBLVTw+RE3EwN+LF984t4x
 Rc2bwWubL0Apt1TMaSItNh5suQJDRQF5VChK0Ozx6A+4JRSBx/zIj3UMKsfYM1NZufs1TXeLrhM
 Wy8o2lKd2wiMYMIO/xyIi6Jss6/TbEeWLeU11HWfV3j3aBJkjQG7JfuePfX5hv54NjCeocSxgFG
 h3QGjH4Q/1Vri+6/203lkeSWsd6GUlme0+Yl731f4LSGcB1V3BJ7X3vb8xzRRRZqt7uDX49Gmwq
 xti18SKgpirZCpwIVRTyg+rwAQLErhDsfsKiN+NbYl9k7k6lpPyLsfKZS/1HmcW7kWP3uB/ELuC
 AR/Ekt0lrfoaOUsR9Bj8A2EGmK6Msnf0j9hLM3TOq4vV1+kklNlVp4b3OYpj2Kvp3d9bTvAmCWA
 Bt2DXHkoNHq4QeMuyStijgJGqrAJa6/o7bgOts9gedFKLF37+nx6hRXYdTPtJ45gxszm5oMiggl
 xlBWHpkc906/53w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX/BS/oNx5NS18
 ypyZK0YzWu+FhNmKHBi3wAovtOe5oXU4Z+n4cz4SvNNQhUlFdfv6cmffrxCNN2oWAzdiXafjBtm
 Y+lgIBxaNcfZaEgzyrdy87y9sWWWk3bmwQq3b3M2N3Kx/p6l1YOFViFBkARl1WpwWt6RS/ip1Ea
 FTTkPnCqttHxWq9kRHnmeDb5BfczrfWu7oShmV3G5xRdGPOv27qDQnBwXB0f5LKrUocySViX+r6
 XhK/BnXwnK/jp5fKiAJpBNHiVBAh3eb23b+J6VgnQDV5mD3wigP07efJT3+J1rzLsbmKCTQghpZ
 ExHxcjdXef5KHBFrV1+Ge9lyfu74rzq5/ibtAgx2OoflW8j/Yse+/FWO8qIS1OpMMd8tDsTQVUD
 CkClk1kahmL9/OZdxQk7E9KTzjRtv8668Cwpkxtxvt3GLMlE87+TkDV34WjYvkEx/a+EvIjTick
 2KKYjDJFOaDzjB8chZw==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab512af cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=3W-9O9G7v02zwTbmxhoA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX91E0BVRgWPNh
 YSvem6AAzx4F21cHiDB0ilsFu6mCVJP2zB5aSSXg/vqbGoLp2czNLe2bo8yE2MCeO4rXIBB4MmA
 XiJ/+fIyFDlqQ3nFhlY4+x6wtHMCkMk=
X-Proofpoint-GUID: 7XgOqgtbXt_Tf1nJYb9OoIJinyEpAq0y
X-Proofpoint-ORIG-GUID: 7XgOqgtbXt_Tf1nJYb9OoIJinyEpAq0y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
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
 drivers/clk/qcom/gcc-sc7180.c | 60 +++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
index 4a49ad7a9e5b..6d9ee31044a5 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -2408,7 +2408,35 @@ static const struct regmap_config gcc_sc7180_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sc7180_critical_cbcrs[] = {
+	0x48004, /* GCC_CPUSS_GNOC_CLK */
+	0x0b004, /* GCC_VIDEO_AHB_CLK */
+	0x0b008, /* GCC_CAMERA_AHB_CLK */
+	0x0b00c, /* GCC_DISP_AHB_CLK */
+	0x0b02c, /* GCC_CAMERA_XO_CLK */
+	0x0b028, /* GCC_VIDEO_XO_CLK */
+	0x0b030, /* GCC_DISP_XO_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+};
+
+static void gcc_sc7180_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Disable the GPLL0 active input to MM blocks, NPU and GPU via MISC registers. */
+	regmap_update_bits(regmap, 0x09ffc, 0x3, 0x3);
+	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
+	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
+}
+
+static const struct qcom_cc_driver_data gcc_sc7180_driver_data = {
+	.clk_cbcrs = gcc_sc7180_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sc7180_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sc7180_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sc7180_desc = {
+	.driver_data = &gcc_sc7180_driver_data,
 	.config = &gcc_sc7180_regmap_config,
 	.clk_hws = gcc_sc7180_hws,
 	.num_clk_hws = ARRAY_SIZE(gcc_sc7180_hws),
@@ -2428,37 +2456,7 @@ MODULE_DEVICE_TABLE(of, gcc_sc7180_match_table);
 
 static int gcc_sc7180_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sc7180_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	/*
-	 * Disable the GPLL0 active input to MM blocks, NPU
-	 * and GPU via MISC registers.
-	 */
-	regmap_update_bits(regmap, 0x09ffc, 0x3, 0x3);
-	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
-	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x48004); /* GCC_CPUSS_GNOC_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b008); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b00c); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b02c); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b028); /* GCC_VIDEO_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b030); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-					ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sc7180_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sc7180_desc);
 }
 
 static struct platform_driver gcc_sc7180_driver = {

-- 
2.54.0

