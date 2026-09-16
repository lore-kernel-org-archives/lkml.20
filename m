Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6084D0A1C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554655; cv=none; b=VvwsERS0ZuI7OE/aEV0+CGOuLRktdp38FKFwKaSa8wNXbvatZMmNnbnb5hlBObGEot0hNLabE5fGy8LyGp+YlvNr2B7l8mp6m0lsiE9VSwwFP9zJ45DCdHt5wPWggDsCzTpXZKVXsOfOnbb3ohLq+Ykp18EOUzCsnph9W6ZX1RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554655; c=relaxed/simple;
	bh=dOWcPm4PMu7C26gubY+szdZhIzmbdhBFQ2hjzKZc9HM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WcFLX5XTvZl4eyoPZgWeZRLvyBWfJfa8VvECu4kbPZzbgbp0ylrM88A1Gvi0as6MEZgVtvlZLmXOflO/dfI0OHevxNdKpCVUDaPg8uRQK3uvOKBrmIgArzc5AsohMTwc/PykGKMounFG6mPAxNrWzaQMBqeFb3yGAqP22CDNFRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mf2F+YXC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EKgnSija; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mf2F+YXC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EKgnSija"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G934tB2226492
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zIifXueKGL64mhkXpHFF3L9lYKQ6XACTTZUiT4her98=; b=mf2F+YXCefj2IZti
	tMCfeS2NvMn1OGI8KVY2lEpZBlXAsyHjayvD9xgnjX8Gn88+qBwMLIsLeWgcYQnc
	FcRHsm0ZEMFQ/gc17Io6Iem7+1LhxNF+73+iXy6KH52+6+gDzCtvzrU2SEn4ReXx
	9tazXtPqA8ldTYO65hGZGLzrQSgcDTXnePV6Aicm0rGgqkDEVRNV9VUeC7sqx1md
	K2aphoBBBwMFn/uXH5G2EwqZIOna3mzyECbtQ15lzTNDq580wP8Idw38dJhg18jP
	Hd6fNseUkfVdTd+G8a4EOEfhl3E5acc2D0iWy6pOMs8+D1VHhSCVGN3jMEHeVew6
	OvnY4w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9ut3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so1117340385a.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554624; x=1790159424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIifXueKGL64mhkXpHFF3L9lYKQ6XACTTZUiT4her98=;
        b=EKgnSijaF6bR8PQWLlvE/wUXGjrjYdowUuF51yGoEjs938kfAa2Yhy+bzWRUS7+BbA
         iQmziLufvlql2ZWt9IkLMcyPKoqmYu+NlGUjb/I4CEPTX2bN+hrjiQoXzIbXJPNUTuZy
         PYIfDFAREK3nIkzBMMvHcH7aq3qp4zhboRfuO6P13CohU3lGY/keJM5Izc/Ua9jIqKyc
         nwXfztLASFSmwQ/shdirjSwhPGXq5DZ3zToMeDS1wU3I3ulrdZYnSAc4v3Y5WHUnWEEJ
         5xzuyfqFajDF4jf0SBLzG6u/xBVEapljsB2yuhhvw1jJJV0MUBznUvc70wjlrCsWemDm
         aIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554624; x=1790159424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zIifXueKGL64mhkXpHFF3L9lYKQ6XACTTZUiT4her98=;
        b=vJGcqVF9oLoiVjDBimScx0LShaH8k2MWHq3M4pSuzYHyn24k5nvuInxfrdA0vm47IZ
         z1VTpWXWV/Lh7N+hNGpqJJWT90ZdW4Bu1yzHKaSjHKGpqll4y9ChnJpzTCd5VWi2zDWv
         BhAcreK/w7C5G9y+rtr4k18eYXFLakNxo/xcPffwbe7lQCiTNv+dkvlu/5kHKrpNGD06
         p73BPbTANpVNLR7wmr0RSvj0mNuGyhQXWb80bLp6dUG3rkKLMqAkBIuBSANSBpqOmq6G
         Squn3PGTVL8UkWXkjfI18drSd/A+RRorOYkSvv014kGqRSXoYJN9vWW3IeZ2X8jCGPxm
         T6XA==
X-Forwarded-Encrypted: i=1; AKwUvBzuODIgBOj9IdNGUoGXyHLZo0PhJNi4H6Bts+YFuJxCe8WALUHo2yQzFDuMdyfQ4uWDCbVsrye9BmAhC4Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mislX0n6/hb0tqSA1FKYkJF9vC7zBBa3m2LmsgGqmxz+kiUCCr
	5jZVHkgYL3oaAGek6DD9qZA8qBn7wDNvHwcrw1mXJ73urf7Ds6Qf/JpTdQQsIIhOEj8aELFJIWP
	IiFyQP7s8nDUecDXcUYL737fqOZKYC88zHxgnp+5HebM1Tml12f1gBMVyUMAbf8MDWaU=
X-Gm-Gg: AYBFou3W9vueOJXb874UocLlqW7ULNy2NPlEgCCXivB6ojLWO5tDsYKZXWHHJ8SO+jf
	YHFpNqKj3HDQ0DOpBjAQd6o4KUk4pamsPEdpmmh7KSDLBhKLwpx9XXCTp/K9QwRGBwvg1hkmMz/
	NMiokbRuigbH3V2crZg9HoNxZXNYM36nfgaFfcXLDFM1c8ESP/9yzJamptVrOp3SBSytdBbRrMI
	FFDxi09t2D81s3Ce8Ixm6/V1eAt5bB9O/wb7D/xHCusJkUJGaNdahTovECkr+vpLFqgNTw2HpMc
	ucjey918M8EcD0daqal87D7KYSM1yA8oQoSs8TLuh/A2ABp6rifgj+cUbETQq8VgUsYFnDP43vu
	tGZRNEL4=
X-Received: by 2002:a05:620a:3726:b0:939:6d2a:6e38 with SMTP id af79cd13be357-93bb789cf2cmr317102985a.33.1789554624306;
        Wed, 16 Sep 2026 03:30:24 -0700 (PDT)
X-Received: by 2002:a05:620a:3726:b0:939:6d2a:6e38 with SMTP id af79cd13be357-93bb789cf2cmr317095185a.33.1789554623755;
        Wed, 16 Sep 2026 03:30:23 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:49 +0300
Subject: [PATCH 33/48] clk: qcom: gcc-sm8650: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-33-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3563;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=dOWcPm4PMu7C26gubY+szdZhIzmbdhBFQ2hjzKZc9HM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9q/YvA/KNqUjhxVtrP76Ct6z5wHw4avj/Zu
 EH7oKxgW+2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvagAKCRAbX0TJAJUV
 ViwBD/9eMxOPyBo6cKX2DupZuINkkHUElVULOP3PT24lBJrXBxZ7cBGZvX0pygZTw+CpWzNXTh/
 5OeXPiWOjpXeiEWHilTE+iBOvORY+QaIxgJNlkCZ+zqUWdNoLngNGJPl2s5J4H94ysJ34sfDaCg
 PA9cpUv/LQjOzJJgjnuL5Mmdh9P1iREfVM+z5cnOkQcLoSliOSC/ZJg9mnK4QtVRaWN6eQMBfje
 phgU96utaPhqIPA04KJ+6ULw98W9Ks21mtg4BjvewvhjLEK4ha3qaHw27Dc1SttdtPMUCpsVe37
 tm5vPri6dVqI8wgfSU8eA/DpwWYCZah50eUPIH6di+kEj4QmrA/iLatAbOzO9jYFoVJrcSEMj80
 RFKEZgoXLCs0ihTSoSxpDaQyKjGFWLCSQ87/V0jR2WjQXc4Obf6vYAujrxCOBg462TR6nXZ09d4
 mWyk5AYe+gRB/WxxdZgVQqrQbn/FnAYYXOwEMnbyARZsRKBls/EfSKdRaKPowobpDYt1TDFVhL4
 MhKmPxaNyKMblI0QAW/l2ibWIh6uj10mpO7ZGFx3djZbmbcixguKiDp6E6ccYokoD/tCSa+72WL
 14K+j+ufndXMzvMlc9ccv6eSsAfhfGVnU6W4dOr+STHrnOrPwHqiTxfFq90A/eJimP49/19xPwX
 wTt0aDtb8eslb+w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aaa6fc1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zVTGKPmrq-ksKY0k6ekA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: TCldjZU2XITYkDINbGQwvFcUTRJTvgmk
X-Proofpoint-GUID: TCldjZU2XITYkDINbGQwvFcUTRJTvgmk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX6pFoudnQlsh+
 oKSzDkGYxzpGAZah1+btJkyvg6q3ohQsfAR9ApAo3JSoZjgquIwLQMA9gsryoMx+OXjymyz1Rxs
 vIXdhKqCp0w6zGHOkrI0EtQoHN4szsH5oftLbV9yDrz8/KDekp+szSXdPbd4Z9vfVZdk/N3C2J6
 KnB9bY5G2bpdtDsgbBAygw4oKKu5uj45Wo/9NJnrBazfCpAcHDDfaVXv8+ImqsvjGT3i09/FJ/W
 ET9AdMCORR0tmYCYRwCqBIBUnSBkzpZv4k9CNH8t1Y4FE6me1j3iCqmyBZQ85DtDFmIV/QQCt+v
 +II46mor9eugM7rZWYL6y4tifw9D9e5Rn1nz0ahaZrRAmCeJOXVYn8DE3auwmDO9qoV5pm54SVt
 VTZ46ECdQ/FoEXuWouZA8McIAa2PSOin84tQtmI9OcF8I+YcUjk78AFhs087FPFZuQJ3LcI0/tK
 Y9FPCTsSeaNSOJtnK+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX88JaGsKZc5gn
 a8p1ipAJuq2uaI/2oZk5Vh0DoED2D297K3ZWboyh1Vh+YDzYhy24HZCRRfJxNrgNaY+ctbb0C/1
 hsZDkrCK3gUfuGfyuQ4mCLyN/SvP5Pg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Move the always-on branch register offsets into a critical_cbcrs array,
describe the DFS RCGs through qcom_cc_driver_data and move the register
programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8650.c | 59 ++++++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
index f7e2d7ec60c9..b9f9657e9d4a 100644
--- a/drivers/clk/qcom/gcc-sm8650.c
+++ b/drivers/clk/qcom/gcc-sm8650.c
@@ -3777,7 +3777,36 @@ static const struct regmap_config gcc_sm8650_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sm8650_critical_cbcrs[] = {
+	0x26004, /* GCC_CAMERA_AHB_CLK */
+	0x26028, /* GCC_CAMERA_XO_CLK */
+	0x27004, /* GCC_DISP_AHB_CLK */
+	0x27018, /* GCC_DISP_XO_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+	0x32004, /* GCC_VIDEO_AHB_CLK */
+	0x32030, /* GCC_VIDEO_XO_CLK */
+};
+
+static void gcc_sm8650_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks */
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
+
+	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
+	regmap_write(regmap, 0x52150, 0x0);
+}
+
+static const struct qcom_cc_driver_data gcc_sm8650_driver_data = {
+	.clk_cbcrs = gcc_sm8650_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm8650_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sm8650_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sm8650_desc = {
+	.driver_data = &gcc_sm8650_driver_data,
 	.config = &gcc_sm8650_regmap_config,
 	.clks = gcc_sm8650_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sm8650_clocks),
@@ -3795,35 +3824,7 @@ MODULE_DEVICE_TABLE(of, gcc_sm8650_match_table);
 
 static int gcc_sm8650_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sm8650_desc);
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
-	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x32030); /* GCC_VIDEO_XO_CLK */
-
-	/* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks  */
-	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
-	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
-
-	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
-	regmap_write(regmap, 0x52150, 0x0);
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sm8650_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sm8650_desc);
 }
 
 static struct platform_driver gcc_sm8650_driver = {

-- 
2.54.0

