Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDAD491583
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251724; cv=none; b=W/1ZfyLLtRjfE0PHoQNHwjkWq7lZhEM5UNCsKfDD+FmBKR6WzMwdROHbQW9HTPVe23lrO8/p8Q5iG5i/Wi7RFz4SGl2RLE+4T+MYDs29AT/MHMe6tSzxtapmW/7oI+lUZIearLJPrpL/x2w2HgJx8+k4p9OPBz5rjQelfmb6HsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251724; c=relaxed/simple;
	bh=84OKeBrl3IKjvgDlfAkMLCAYo5otzVQbeGYjLU1sscI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R7LMwbqWzrF7csgjbPem1YlGFvbOIH0zv/nZldZjNFetyQ/+B3puYhP4Q/6B+pE34MV3ljmIw9GTcEGpaq+9wzfims0J+ymXCZiwBzGVP6oBjvT3Ar58DLSRmjI+uNj7XQGfpYtT9fNypMyT18n37MMOPwnoGEHobqKM3gFY0OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVfu6Va0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jRsNCQxa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVfu6Va0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jRsNCQxa"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4Xgx2285456
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qWFUUAsjl5pE8emDfliUkXbUsV2Ad/7MODHAHrTzKFA=; b=UVfu6Va0qsfxiTRZ
	k65zqf9wk7JX9BlL45pe3+pcFWxTg0ML7qV5+Om1LP8zIcT5TaUnwh+t85gkFd9u
	kHfbkspw9MoORmzXR4ejI2mVJDEi5/GQxn1KF39hlF18/ftcxwfwUTlmxYMogfki
	soIIUfMH7Oih+dEXqMX36T86CWoeDynIBGvSYRhV07QksaKN5qQyZGP/cB0DcXR3
	hndLxJI8rqrfdDa2ZOO2/KuCvQlqBbd+GzVm+6iK+3uBptpwdFKKxhb093L4LZr6
	3IQvhoag78h7qrV/3GPgmXzs788QEISYnQu+47F+A5osswHPdrnO326/0wRzhUJ/
	rVHQrQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ahgst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:41 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9806756ea40so1527251241.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251721; x=1790856521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qWFUUAsjl5pE8emDfliUkXbUsV2Ad/7MODHAHrTzKFA=;
        b=jRsNCQxadKq//hZvBwGjOgwGpx6P3PAhlTnWiRB72mvKiU4nB8Z+04+XIQ2nLVwgGv
         k0OLSSBisAQDgCoGrnx+qW6EyBlZEpMyBLLA9CcImcQc36MPHIJMXCAJtGgay0p67uxm
         u2+rhdcMT5wf8vAELFNJR/FmwZTLOZang8G0RdgpEuDDA4tj3mI/OnVaqQO2wg9LN/jW
         uKfrqJ+dZWgWo3j1Fa16hNlhXjDJSeDPqKX1S5ztS6gjImxxS1cHWAjuWnkYClhVNbQc
         jb8x5AVoiR7FpFYOX/vnLukVcMdREI83wMhxMTCYmQkhnl+kv0kUvtKF8vwh1DpTNmdk
         mKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251721; x=1790856521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qWFUUAsjl5pE8emDfliUkXbUsV2Ad/7MODHAHrTzKFA=;
        b=t42unZ+JXXwz9bUyxCLu7GHEgOlVbXtqIdRC0OvL/HkjJ9pTOKzFf4lsaqpjH1zP7Q
         C5bu76brooAAEraljUs7DocWACuitIu/RGoR77GpRZAZtGlRTCCwHLQs29yJGBHPpUaS
         syPLgAbJk5bn01lPC/uLwGvKaeVv0pHDI5Tccxhwyq9jOt7mP5pnwXWn9D2goAwPdd94
         gjQL5tWDwzPMStszEgPPwD6udK5Y9ORPy2j/ZY5rDyYZatZb9eaGvVCfW0/O109cb4Tr
         eS0J15vQxNaeHGkJvy13CQxReEumKwRLIMnsN6jruoHKoML1opsT2T0e4AsQ5pkd+iWH
         S3Ug==
X-Forwarded-Encrypted: i=1; AKwUvBy9j11AyW0X2YqNibltJMOI6oY0fhIjzfVKxxmsWhkg4Z6sYKcGjMKE8j3S8HYMfk5UuncSHgsI+bo3B2w=@vger.kernel.org
X-Gm-Message-State: AFuF++nU2uzF7owY33CWCRun7ELzv3oK2Yj11jcAQswrzpO99CVx3Dvw
	1CM03o34vo+sdMil87HWzdZBR6hfynhkpLV2Zu/L1PeyMTImRVG2cTQ56AXHGMvvoEcHSej0qA9
	LxSosAB/0MmlXRB99FkPotc9hegffjbi+P5sNqLAQoUA0G4+JFZgDsayX3DXsu7Y2wHY9vVRxYk
	k=
X-Gm-Gg: AYBFou3PQgVTuExKH9N6PzZql5YIbskYCGwwY1zP+fN02olI/t57iQ38RPefm77LnGm
	15BCWMj57/ofmC02kg5+lXrrNUKFVZ3/ky4t81b09RQbXWB1YtF0P0XaOWaITxB+7UQxRFTs1ao
	4yPbnQrXN+CMPxDNcQ8kYBk8G5xF4gs78Sxtvd8LnkiLUjL2Bqrn5866S+7jmCpchs2Fm7in6ky
	ijHrEHD8D5MPAMo64oe9AaAB/nLUlOwtLRI86ci8sS+FAysTVVxoNH4Q2TIioxjzNl9VzviDJHv
	cc10Awb0L8hHivaVoWtOvZW4bMugCGBuJJyGlpZWhcYMktmua5odpQc5QX2kzgtvddGqW7ZCBQI
	YxqrO0ZUU
X-Received: by 2002:a05:6102:6a91:b0:7a1:f951:664b with SMTP id ada2fe7eead31-7af1e4f29c8mr1102719137.18.1790251720403;
        Thu, 24 Sep 2026 05:08:40 -0700 (PDT)
X-Received: by 2002:a05:6102:6a91:b0:7a1:f951:664b with SMTP id ada2fe7eead31-7af1e4f29c8mr1102707137.18.1790251719853;
        Thu, 24 Sep 2026 05:08:39 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:41 +0300
Subject: [PATCH v2 29/48] clk: qcom: gcc-sm8250: Use common clock
 controller probe data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-29-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3702;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=84OKeBrl3IKjvgDlfAkMLCAYo5otzVQbeGYjLU1sscI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJdiZ4JZw6hkus9b6St/w9UqB8+37EHfB0mK
 RGhP0IriTCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSXQAKCRAbX0TJAJUV
 Vt5gD/0Thh+OvJ2xvWin7MMA3ulAj61Ey+b32ZlHNq7DmO5Gc3+8M2z3O5utFjZ7s8mh0xxs7/g
 czhvKyuihdoeWWvv+aJ70VH6KTUMZ3DeZYk+bkrYPOkkRlwbK2BhF2F7lzaa+2+DKpKXvlFjZTJ
 L3A6D1icu7xnPbKYxPylP4absR3L+YvD3hhM7CUpp3opgRP3RslGQNGCw1pyHkAzXBYlaipG4U7
 qpxMNyO+dAmkwhQO+9uJ0pAgQMVU+Q0D81k5Cel1dUm20qjk/so2goaL/Z3/KD34s7rRN5UWrdi
 EGmJAnqBT3cQsnVEQLGZuUmzMst5uV2p5AEv00a1aec5sPKFBNvkrfCgHkGF/qWsliY8crJVSNI
 s+9MRjMAcmxryIJ/2C2IuAwShOOYnCahAGwNfCBBhMJxkFNqTsMOnNgxpKakDo0GxuljkA58Tne
 pUX1YSmatFNDZ+Ih6QwAK+CEmREz5flR76Z5VgGrErzhOHYYTleDbsgO9OqSOvjKJeRtjoUavKY
 FPGYD9spUV/cNJXlkaEIwEfJOYXuhooo154kKHExd/kXdIyhm5uiDXczVdc64EVVqWMNWEHb8Jx
 h49RDFzgycyrRrk/JLtRJMGOgi6nGfqyBv22UqdFDHahWJI0Bg+kIErJYTV5QqI3Ugwy9pnd/fZ
 EDiM/Rc4p9D+kLw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX8J1G8J8/Jwin
 mVieZfv+bISMGTqpi43rR6xY9AFmwlDZvxXSJvLbez0y1gCOJ56An8sXquCitMIQzpVRK+9v916
 Zdk8jnBy1xLpa3+zBivlkMTlol1f6Cg=
X-Proofpoint-ORIG-GUID: Cb1MkGindMrZubyYC907-B6MeY_-DJ98
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX7DxyFWXOFwDa
 wCMnyL8UwPnUlTs7lJH9pH4Qmzs7Qx6ixv69VovGxUa7rMhf2S9R1naK/PO0tBFY3IyGHwxYYaR
 qIN4nQteihhub7jIw7X+300vLGgfRUV1k9cP/dzYc405CPfTnhXeug8RDTyu+0FlwSOHqwS2cL+
 jhJ7rq72PVVl8ItqFOwCc24PwYHePoacryQTGcdTjjFgFPuFLL2TPHI4tPu5Nb9Pr3zQ4vnzLml
 U3ZTP0lGW0k/Xfwc76mrvrUnine4nKlxGCejBUK/cT9S24pjG6qRkvYZdaohG+cwJNfBly6qFc+
 uPY4Vb02zO4/vqbUBvHMuXTjHD42BrXGK3zAX4ysALgM8w+McJ0V6ddf5RwyM+jouukQ+zdXgUn
 lGjCKvAVZLGUMQPDZoqmB7x5WJ6C2tjwtW73OJZyQCVN8TsVod2+i0Xhnu5+O84NCzwiOznhlJH
 IfXwdbvJ1PpX/JuI/HA==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab512c9 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3W-9O9G7v02zwTbmxhoA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: Cb1MkGindMrZubyYC907-B6MeY_-DJ98
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Move the always-on branch register offsets into a critical_cbcrs array,
describe the DFS RCGs through qcom_cc_driver_data and move the register
programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8250.c | 57 ++++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index 93c1beacee01..7ed7876577d1 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -3603,6 +3603,15 @@ static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
 	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s5_clk_src),
 };
 
+static const u32 gcc_sm8250_critical_cbcrs[] = {
+	0x0b004, /* GCC_VIDEO_AHB_CLK */
+	0x0b008, /* GCC_CAMERA_AHB_CLK */
+	0x0b00c, /* GCC_DISP_AHB_CLK */
+	0x4818c, /* GCC_CPUSS_DVM_BUS_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+	0x52000, /* GCC_SYS_NOC_CPUSS_AHB_CLK */
+};
+
 static const struct regmap_config gcc_sm8250_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -3611,6 +3620,24 @@ static const struct regmap_config gcc_sm8250_regmap_config = {
 	.fast_io = true,
 };
 
+static void gcc_sm8250_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/*
+	 * Disable the GPLL0 active input to NPU and GPU
+	 * via MISC registers.
+	 */
+	regmap_set_bits(regmap, 0x4d110, 0x3);
+	regmap_set_bits(regmap, 0x71028, 0x3);
+}
+
+static const struct qcom_cc_driver_data gcc_sm8250_driver_data = {
+	.clk_cbcrs = gcc_sm8250_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm8250_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sm8250_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sm8250_desc = {
 	.config = &gcc_sm8250_regmap_config,
 	.clks = gcc_sm8250_clocks,
@@ -3619,6 +3646,7 @@ static const struct qcom_cc_desc gcc_sm8250_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8250_resets),
 	.gdscs = gcc_sm8250_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8250_gdscs),
+	.driver_data = &gcc_sm8250_driver_data,
 };
 
 static const struct of_device_id gcc_sm8250_match_table[] = {
@@ -3629,34 +3657,7 @@ MODULE_DEVICE_TABLE(of, gcc_sm8250_match_table);
 
 static int gcc_sm8250_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sm8250_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	/*
-	 * Disable the GPLL0 active input to NPU and GPU
-	 * via MISC registers.
-	 */
-	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
-	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x0b004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b008); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b00c); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x4818c); /* GCC_CPUSS_DVM_BUS_CLK */
-	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x52000); /* GCC_SYS_NOC_CPUSS_AHB_CLK */
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sm8250_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sm8250_desc);
 }
 
 static struct platform_driver gcc_sm8250_driver = {

-- 
2.54.0

