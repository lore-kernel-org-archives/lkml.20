Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1377494827
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251742; cv=none; b=oagx2lR+BLIYCOStOdckLyAuwDSz+WgEj7tlnw+76Ymdu5JgbVMofzehfVAFYPxgxc1fP0w2T4Wy2rhVhbahvrN21R5ns/Lq3SUzg24M1sMGK3ZPAzz7xruJGayvzc1PTFaHOru/5S4IxHF0/fBDsyK9gw8nPjq6J3C9rvCyiRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251742; c=relaxed/simple;
	bh=0KIncYxuhYT/4RBit5pRVcbVgHpMdB0n3bw2oLw0x0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YGdKrTRnt7UUH7tY/bLpJLuSf4y4dzNHb4OIMMIj9mCMwBYvaa2Y4OhekvRFGZyhovKSwY5lssnX2TlMBiZdf/hmV3hmD68J0ibkGdOF/eMvYiN/tykmVJnES82jdiX8Mu+dSOI0YZOE5yYqHq8EYGu2pdC3rwcOAroifPi/Oc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lgjJp9v0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RPqL3C+2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lgjJp9v0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RPqL3C+2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4V3E3282824
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kebIORO5OlEBTHDRjMHE5KpcC0HkkUR4Ubxle5GK7nM=; b=lgjJp9v0imBnQ86A
	7DtxfYp+ftQsAPBBpDVYEaOmEs0Zdl280Fg0fVoqG3Xiweb/RInwSIZk6JekrZhT
	zZoBhRwqoip13OZMkn1MIyELqE53OkUmJVJonhrcXiYo8pQjLt4zP6NyeDixycrA
	6mbGjTgSu+kcjKJ4AUBhgWaq9mU4ZrQFQCa1VbtTLAOoUbqRL8oclSFUsHwE2R+3
	QII1NjBz4QMsL694czvyGKbenCbU+tTqfpi3ZBSR349zKzSQdoMRWrD3Q6PVLHtj
	ocRzWMHDXf6rumkt4FSV3hPQYBGgTxW+n3xAgOJnfrp9tHA6XSbShq4wVgmmzAYa
	JNserw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstujfwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:57 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e99aaaa6fso286507241.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251736; x=1790856536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kebIORO5OlEBTHDRjMHE5KpcC0HkkUR4Ubxle5GK7nM=;
        b=RPqL3C+2kIpIHF7GkSLRum7bGR/CCD9eDtz5Q/kimejlH3DVMbwV8WH7OTIecrSO7O
         u1A2l31xzuhcFcWWwYsMQT4m/cJqSERYsn6pzEX3hr+zJA5Ff6rOiSqsxNo1Fm8EZJZQ
         1CuZrT71mowaNp5e6iosmWnTaDkHPv1ozYY5+DQV9wcp4RcdBx3CGsEktnZ1wHmlnKfc
         uvYFGGbUEjfMzZn50koBDliOVQGqQHM9ZIkLiV/Z2BAGgeSGXp2DQ9xhdQylAS9ozYBN
         5Vwwr7sfFfkp3a5ZHvEdOmWdMumbmMVwKBKNl5eGhRkW6QaZMpoZB66PURyTPFTtf5MA
         P4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251736; x=1790856536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kebIORO5OlEBTHDRjMHE5KpcC0HkkUR4Ubxle5GK7nM=;
        b=BMApbS3PYB+Fl7Ass4f1JCJFfPXj9ilfgR9Bp0hHGfz3oFTAiEogE6R3Z4Ou6v7lnr
         mihaxseOz9SBRwZcNDq5ukiS0nMstnXI/PzFRO/JMWLRohg1woHDqrCUyD2P5W/R8QGu
         xmiI02GOEBzitM46IpgDdFiYSAVOBak9ZJFwcdazG/PF5ccuym9fXqf2y6YpUN4ajGXN
         qr8Qc0EQJOOHv09ySlSlkzcUyxxE2obm8ejMuLF8a9TKMkui/gAZ82QmHp9BoHrQ7stw
         XF7/mxsiC0At/acm2dQO6inoHHgXWy9aNeBpl7kob+Q8aiq+6/ktCXsyRqif3dckv0/j
         4DGw==
X-Forwarded-Encrypted: i=1; AKwUvBxm+5yN9uguQVGCF39oqDh76QfKFQloamXFmBmrALon2/hlbS/4Sitxk5TUGlREwg2i/gzCUlhyygDuu+g=@vger.kernel.org
X-Gm-Message-State: AFuF++ke7OaCPAM+CgjxQPjc8KhwOky4SArCpXO45206Ruk2qHTWL5Uq
	n9ICpbij4sZNZ8II/EKsrSAdO3x3/AMYlK7+P5eQZtjVhZXcO0zo//i/W9s/z3WTn7HnI/TU4OE
	acHiJ/XRkyHPST4XuPOjrC0r+DF7JLGYuVC6+DBX5rQowqXshbBzzhpLkcJWFS4vvdC0=
X-Gm-Gg: AYBFou3dQFbFNfSaMKTCxFOX6pcCKtr9VLO8WKWqAUosxU1u9Gqs86gkrvTprQrWTQy
	hJhMeYNte2mlZQoJ2u+P6kCBLAppimYKlHqfWA7/EZ6YlxyiLcmVKCxz5ORn0fVisxJEofMbRKb
	edklpGXbIH6EUuIoqgk4x3NEdnVLjFiGzMgAmr+MSGl+v0jtnAj9girmHaUidM5BV7PWW6TN/ho
	jaXYX8fxGEMgrgACEuqaqD6b2oAoQPGmTw5yferbhcwlR4vCslTmSdL4et62miixhs90v4xBJMG
	YoSHb3XQpeciu64nsazUbISoFP/j20mIZHlZvqVyOPH6YfUGoSPIhRYMh04jlJfJ5v3B5icU7z2
	o8Pad+9a5
X-Received: by 2002:a05:6102:dc9:b0:7a7:195a:1b28 with SMTP id ada2fe7eead31-7af1f619ef9mr1137361137.34.1790251736353;
        Thu, 24 Sep 2026 05:08:56 -0700 (PDT)
X-Received: by 2002:a05:6102:dc9:b0:7a7:195a:1b28 with SMTP id ada2fe7eead31-7af1f619ef9mr1137337137.34.1790251735731;
        Thu, 24 Sep 2026 05:08:55 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:54 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:46 +0300
Subject: [PATCH v2 34/48] clk: qcom: gcc-sm8750: Use common clock
 controller probe data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-34-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3981;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=0KIncYxuhYT/4RBit5pRVcbVgHpMdB0n3bw2oLw0x0w=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJislxYoaNfzy8Pdh3NQ34TEvPXIalg1ec81
 G5CMms9LFSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSYgAKCRAbX0TJAJUV
 VvfCD/9uGtXfYltYMeSAsO4aF7mm3HPFUQlikD3AqOFZ+e4VmP6fCCkdScgysL+RI44Z5BSz0mP
 73sVAWT7TUOygdpeAlJ25xJi1Ra1upSDHYs6mmmag9COLTBBgmaSCtEzytpmz9M1mK2/XABE4hg
 V6Y6CQexnZR8xuNwtSLLIt6rhe78Wb5E15a6N1zsu5/EchYMJ4+Vezr3Gx9dgUV4sNVz9UaMYLt
 OrBX06rFCgQ63WIz+bA6h1N/nztaMNoRo2cIexpjH75CLabY6akSC1EM+7Zl7bmhWlCNIAWp2H2
 FikRidoveW7x5LBWisdqJP7Cucn1lHInvVqxQ8xavEdqtUOVxHN+fecHOtFnd62EIJb+JVExp9w
 5v1/qQGo6WGT8gawMZnpe7CtPUen0kFd4wA+prTN646Zg0UKppdPXxa3ticzttTGezOovWBf26K
 HMyueVJr77vz8bA3VOicfAm19m8RCV61usT5EYr8qLFe+uyowGtG9ndnmI8y4TID7wWPdogSIjw
 6cND4hnWnruWk9svtm80IOpG5g2/41azSjB9AOipa1KVYQv8SwDAhcI1vE0LuRInMpOU2nkiqD6
 Mv+2lbKUcClyUW3/M3i0T8nKrIwJPxrwdKM1bzE2vrYgApjo9oD4a06CkRGHTFTqcu9/piD29eP
 dfVom2diPr/We9w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXyg45R5rqNMpa
 NVwAoGelpOH37ddavPsxlKeZq9ynW2C0LeejRIDTZQF1q3iobERColtoPV+2he1Bx9Dw7CQssOt
 tpDUyazdU+wmP/ith+Dj16SvKlVexiI=
X-Proofpoint-ORIG-GUID: UoYJjibE9N83dUr-chrluekntiTmNsL5
X-Proofpoint-GUID: UoYJjibE9N83dUr-chrluekntiTmNsL5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX9rPIvOBL19sD
 GZZR3wg+8dmg8KnCY/ZTvm8Ny68Hq7BCqWwWhJ/9Yo80eIdeEh7vmJlph47CLlAomoDOPz53hnF
 TFr2vsRU4+BeTpJ5pWL7RgG9gh0VU8GRywu1pvhVZix77DAXecwzUThxYTh4aUkPqYstTvEwHHv
 rSBqKjuBYcHt2+TZOhue6wT1rNUhn7/RQTZ16MVqUApUsfslwW4tps8e9czgOsJD+aDX981rSya
 D5nVs+JjbMIhchgdr7Hf2h7jMG1bsb/3OmsvGOlUGxFu4xnyEmMqYblWdUyzdBDcizc0YqIzMvb
 X3gwbvDkDmbSM/Kn65N1kCmcpRbBEpDJrZTxnPIdZ9rU1mHKf1ITpImcyWfNtaSU5WJSzOh5Exu
 6FhE2h0GjXK0wYbGV3dYldBwroVsgUMhTID46+Typ+jzqRHKVxVid7rLWevSLpcbSEIU+0QTePe
 ySxtnACV5awRAi5bm/g==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab512d9 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=xSywTFWZ64xYcUwTHGYA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
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
 drivers/clk/qcom/gcc-sm8750.c | 76 +++++++++++++++++++------------------------
 1 file changed, 33 insertions(+), 43 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
index c08130218efe..a3c7431ef4f7 100644
--- a/drivers/clk/qcom/gcc-sm8750.c
+++ b/drivers/clk/qcom/gcc-sm8750.c
@@ -3188,7 +3188,39 @@ static const struct regmap_config gcc_sm8750_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sm8750_critical_cbcrs[] = {
+	0xa0004, /* GCC_CAM_BIST_MCLK_AHB_CLK */
+	0x26004, /* GCC_CAMERA_AHB_CLK */
+	0x26034, /* GCC_CAMERA_XO_CLK */
+	0x27004, /* GCC_DISP_AHB_CLK */
+	0x9f004, /* GCC_EVA_AHB_CLK */
+	0x9f01c, /* GCC_EVA_XO_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+	0x32004, /* GCC_VIDEO_AHB_CLK */
+	0x32038, /* GCC_VIDEO_XO_CLK */
+};
+
+static void gcc_sm8750_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Keep GCC_PCIE_RSCC_CFG_AHB_CLK and GCC_PCIE_RSCC_XO_CLK enabled. */
+	regmap_update_bits(regmap, 0x52010, BIT(20), BIT(20));
+	regmap_update_bits(regmap, 0x52010, BIT(21), BIT(21));
+
+	/* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks */
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
+}
+
+static const struct qcom_cc_driver_data gcc_sm8750_driver_data = {
+	.clk_cbcrs = gcc_sm8750_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm8750_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sm8750_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sm8750_desc = {
+	.driver_data = &gcc_sm8750_driver_data,
 	.config = &gcc_sm8750_regmap_config,
 	.clks = gcc_sm8750_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sm8750_clocks),
@@ -3206,49 +3238,7 @@ MODULE_DEVICE_TABLE(of, gcc_sm8750_match_table);
 
 static int gcc_sm8750_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sm8750_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	/*
-	 * Keep clocks always enabled:
-	 *	gcc_cam_bist_mclk_ahb_clk
-	 *	gcc_camera_ahb_clk
-	 *	gcc_camera_xo_clk
-	 *	gcc_disp_ahb_clk
-	 *	gcc_eva_ahb_clk
-	 *	gcc_eva_xo_clk
-	 *	gcc_gpu_cfg_ahb_clk
-	 *	gcc_video_ahb_clk
-	 *	gcc_video_xo_clk
-	 *	gcc_pcie_rscc_cfg_ahb_clk
-	 *	gcc_pcie_rscc_xo_clk
-	 */
-	qcom_branch_set_clk_en(regmap, 0xa0004);
-	qcom_branch_set_clk_en(regmap, 0x26004);
-	qcom_branch_set_clk_en(regmap, 0x26034);
-	qcom_branch_set_clk_en(regmap, 0x27004);
-	qcom_branch_set_clk_en(regmap, 0x9f004);
-	qcom_branch_set_clk_en(regmap, 0x9f01c);
-	qcom_branch_set_clk_en(regmap, 0x71004);
-	qcom_branch_set_clk_en(regmap, 0x32004);
-	qcom_branch_set_clk_en(regmap, 0x32038);
-	regmap_update_bits(regmap, 0x52010, BIT(20), BIT(20));
-	regmap_update_bits(regmap, 0x52010, BIT(21), BIT(21));
-
-	/* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks  */
-	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
-	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sm8750_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sm8750_desc);
 }
 
 static struct platform_driver gcc_sm8750_driver = {

-- 
2.54.0

