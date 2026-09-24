Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C6D4825A1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251732; cv=none; b=nicxyumvF1n+XXVsdQwvMcgkoidADZXX2D0eqpckJcuX6EIsmSsuGfgn/qGa7qY63WQkj5gyAQruF8F4NICdjt6pEbwa0hPq9UURYy2ToPypNbRX3NyiL5SSTuUAuzcZqLyNPmO5Sh/Slf4DyDj7lDnjb6hw+zX/57bWHHlhf3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251732; c=relaxed/simple;
	bh=itpF59inKHzgDkBngB80YimFpGhVlE9Sl453Da21Iys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s8J68r6CjVPFhYdXC9rgM0ZX7tZkDm6Q8ReuH/vfda4XqA5bwfwu6cqU7Nrf7V1tRI7GdnosD0rtAg5ldpnjDJaOQCDn09z59Z9tucQI57lCAFKr+2R6MHZzT36QGFJe5NEcvC9ZdMYxnFV6APncjEFuFE488TP4NtNbZAYNJQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BOphyTaQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KJtQTRA/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BOphyTaQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KJtQTRA/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4t3b803928
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v/AmL1qeks157TSZFSYxIg5YHYwxhYYKw9JDPqI+Llk=; b=BOphyTaQ5W0DdV2G
	AmNgmaT9Q14y7p2kLPynbZN69+XIXgltdpIJUX5MNh2+bDQYISHsagD9OPwYswKh
	1hxOwkemt91ipL7dnggrxtKng3hkoGgAOdpoujk4LIDStibAbl8s/TpEVT37gNr6
	KCAiCnMsK0eiujoEsVJdvVuef8adbJYhygLEO1gsAUxMHh9rAsBePVwqftlFm71n
	LziavCRV+bxB2Tv6/4ohFdto9P0NAp1PxTMmuTUP4XfrJBU7sWLX50s56VpV/RrF
	BRdgARMaQJwkRc5/GrJ/Y0PaV/FWHcbqfC+x+2q/cEr0ARXcjDEmO/k1vOtr0iXg
	bKstZg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc8f7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:49 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-79cdabf7d89so1827889137.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251728; x=1790856528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/AmL1qeks157TSZFSYxIg5YHYwxhYYKw9JDPqI+Llk=;
        b=KJtQTRA/hd/euyYOLDIWf6akkdM4OqkP1Yqb3UEQFfJ5ZHoZFjuTMBNjTWe7RvEV8S
         fd0sIMEqxBno0CzJ7aay0GNY8P0L0sSABQgtwdV5eQoiME+lEQ0Yf0qJrJvDlrDUbhG/
         U3DV7W4ZjSgjKrCmNNT/uG2ap1Wg1TdYPLHomR4G+tBVE3FzhtmAobz+H1EizU2KSk4W
         aN4X0EYfkymaZ5MmpQGzRM293+M7fHarz5wNAT6u7IkaBWQHNIxBmyVfDL0eQ+wuPLua
         C6VLv9HsVUFB6HBShfWl2Jzl9HIB/1qfMngYOhDott1FEFwTFLGXp57s2atoPGse6vAG
         Ek4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251728; x=1790856528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v/AmL1qeks157TSZFSYxIg5YHYwxhYYKw9JDPqI+Llk=;
        b=HsEYFsgESvIAUiD36rBq0mgyuoAOJ+ucIj8Rk+uHRDFqrwy3yh3aqEmxmzJyKi6NLI
         9gv0TeGYpqpvfy0NJlQoyle63H1TfHR2C1PFQ89FxmZCiKeKeEobsLjZFW5YwJGBZiOj
         tdcc2ifppDrGsSLVCf3zMqCSY+Xg86j5JoTDDQuWODSeTCxoC3xyFrVEMjMCBVSVhrCX
         A/5kMrxfaR5KRTEKMFTwlux537gDFba0rAYXbY1VCHrgo/9SeT6V1w1zZ92Dq+xU2m8l
         XgcjWB5n15rYZ7mYHiJX8tEy0uyYFt/hXJIRsnpQ5pm5j2/t21VlpzzW6xTE9Vq8eAV1
         8N2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwl/a1/TX38Uz3Zn6BxdTrPxkDFVzNqzPSC8vQF7n0wE5qXiHJiaNjaKORC9iTbnLFgJzQlzxrzzKti098=@vger.kernel.org
X-Gm-Message-State: AFuF++nWV/YqRAufCPSAbpfmodsPI9otliIn8JchhnZ9iZBs+AHA9j/k
	ESDBxSuFIaB89GmpaBJctJagG2KHwlQW4jjaUxGaF4FviF98qocTHHgbpZSSiTN/n7YJV1wS+SN
	GrNsQCxosSb23A+8m+ihwSI6JbYt430LiuCGOnsYhfTCX3Ul1AtudSn++Cz/BVomnu68=
X-Gm-Gg: AYBFou2VFhp1m+pfq5VvWD/CwTEDocljJEOktw9x9ChvOJHHhVxChOfxbzf9q51tfut
	sQKa2x7a6poIMelJJAPMq9NKObPTTKxKLkfEomStC2euSsL7CHzIm+XAdvLBrvMX+C+xfcIChXO
	U1ih3BNKPthAMXzMKNPCbFrRfRPT7dDbZThbEd4FbwRE7ntfXWIo6Z41wHBa87SsswQw9dwDi8Z
	+eJiSMYw60bBM0GSDT/K4k9U/ePZuwW687f5ERf+Ojgq+2rj+oOspGQYPM2oNhN+kmTDj6XYO5T
	81uFD6SZRQHxZR96IIe8rX1IjUX189LDktjkVK6wVJt4kjVUyeP2u7QN1uYFozPsL8WEqmcmliR
	0dDsNP+t6
X-Received: by 2002:a05:6102:e0f:b0:7a6:ef60:dac with SMTP id ada2fe7eead31-7af1f2087eamr1287428137.34.1790251728211;
        Thu, 24 Sep 2026 05:08:48 -0700 (PDT)
X-Received: by 2002:a05:6102:e0f:b0:7a6:ef60:dac with SMTP id ada2fe7eead31-7af1f2087eamr1287410137.34.1790251727615;
        Thu, 24 Sep 2026 05:08:47 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:43 +0300
Subject: [PATCH v2 31/48] clk: qcom: gcc-sm8450: Use common clock
 controller probe data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-31-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3882;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=itpF59inKHzgDkBngB80YimFpGhVlE9Sl453Da21Iys=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJfnIn0DOkqZ9hx2Rt9yTHQ/K9fEAgisnZ5a
 ZvW7QjigaCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSXwAKCRAbX0TJAJUV
 VnZDD/9+jEKTLVylVIGgW17UG08W4DTKq0yzJXk6KnuJPDg1gBLjKij3OXAHsrn73cCy0P+dpYB
 8cLnNpbTbt4xJTeajzmhEMKaHeBDUFaV3QKwagT/Lxyf7iKhc4bm8gQ9++TTg8bAWovi7/l9IbE
 zrtMcj+ZAMzAA8BI6T12tDrF7uUxfAu3P3Lg2r8FPTNJM2Uds7TD+xgXRTGgxPdHlLRzC21jRKT
 1ceYknCYSKhsAzIQaqByvUXljFABHWPT2EPPjBAMawfNTSwv4QnEoK8aiP3Y+YgKZEJHehE/vEf
 M/B01f0343UBudAHwSvYwwD03+FSPLRd85gsaKqBZ0rkLrhVTXHwZhRcf9hejb0UbggUJw2WQQZ
 rB5f3c6UNrFngXwZ2+C4vY8cMNW4oF9gmz69x6Y7oPtfIF+w40CbbhEuvMrWeyo8+2xHcqozIzO
 hdO9T/bENWIWjs4Kub+IgmGtThi2inP4q/OjQLXwmg+5+TTVzqJu2aw0MzTRIrSuz9aEmftcBt6
 +5RbzTOsFT3L7HjVuBQM1xTAszD50dvh4FKrH3KT+JrI4GwNl7kM2WucH6Tl241AgTNDXoLJ0gX
 fKCShvQ2lsnWfSkQqgy18ngdpKyF792ItjsVwA8jFhsJ65gmQ5pw6UWDrNN7PkGD18rJNGyH8JJ
 8ThYLCNZzZ99LUg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: EbOYIHW0IMijzPwgSN8fQ3p1f7MTScnF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX63PVZpR1Z9WM
 PoIJtT+v1rhmlVPLJAIpOejnhMUokRnZ6qMHCEnTYQDnc8bU9ZW5/dF+3A8K9ajVxYlEPyMAtZi
 1HFmunxWkt5+h/QVC537+GkVB/6OjPOxG7uzh6/XWyBttF9kboeVDRbr6NYdUjVeF78+gWLoWuE
 WVtxdhjUFOLiWiZUB4LbyvP9YjIVfB9niltTrKeofS7zX1uvWXLK3RDcZ/Z4jk5FF7K/4JSoh8J
 Kfk9J9Q/cTlo2zOSd18+Nmr0+gnW0vCXmf5MJ2nXLQDf47wxlGmCtPRFRvA3cZnK5xYJbMIkDtC
 Nn627CTv6CBbmR0o/4qbZd+MMyzCzPbKa0u1iDi0vwzhstcHSer8+1MRRmwWxlac2rzGnQH33fD
 fVdlbWNDJ6EsGEN2qpOS+19sdFtwPzn54fKwPzygSbMe5DeTSxHMgmMP6kfsrd4T2VYKgyk9xti
 Pi4K48AwdZhW8G47UPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXzQzAriY8ymMS
 d4D70c+mYf+hNuBbFnRXEQPY5GMsEv9j5iTGxEIdWNikHmHv82PGJJ5PKJ3bzlicWBy0sYKciSJ
 KiZlNoGPa/D2XHHLLkhxKdZIUTAdhr8=
X-Proofpoint-ORIG-GUID: EbOYIHW0IMijzPwgSN8fQ3p1f7MTScnF
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab512d1 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=39i0T9gdeGRrow2g5OEA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
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
and describe the DFS RCGs through qcom_cc_driver_data.

Move the UFS PHY ICE core FORCE_MEM_CORE_ON setting into the
clk_regs_configure callback. This moves the UFS setting after the
always-on branch enables. Those branches serve the camera, display, GPU
and video blocks, not the UFS PHY ICE core clock. The UFS setting is
still applied before GDSC and CCF clock registration.

Keep the SM8475-specific PLL and RCG adjustments in the driver's probe
before calling qcom_cc_probe(), which now handles register mapping and
the common initialization sequence.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8450.c | 51 ++++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index d473a95bef92..739e567462da 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -3392,7 +3392,32 @@ static const struct regmap_config gcc_sm8450_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sm8450_critical_cbcrs[] = {
+	0x36004, /* GCC_CAMERA_AHB_CLK */
+	0x36020, /* GCC_CAMERA_XO_CLK */
+	0x37004, /* GCC_DISP_AHB_CLK */
+	0x3701c, /* GCC_DISP_XO_CLK */
+	0x81004, /* GCC_GPU_CFG_AHB_CLK */
+	0x42004, /* GCC_VIDEO_AHB_CLK */
+	0x42028, /* GCC_VIDEO_XO_CLK */
+};
+
+static void gcc_sm8450_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
+	regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT(14), BIT(14));
+}
+
+static const struct qcom_cc_driver_data gcc_sm8450_driver_data = {
+	.clk_cbcrs = gcc_sm8450_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm8450_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sm8450_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sm8450_desc = {
+	.driver_data = &gcc_sm8450_driver_data,
 	.config = &gcc_sm8450_regmap_config,
 	.clks = gcc_sm8450_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sm8450_clocks),
@@ -3411,18 +3436,6 @@ MODULE_DEVICE_TABLE(of, gcc_sm8450_match_table);
 
 static int gcc_sm8450_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sm8450_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
 	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8475-gcc")) {
 		/* Update GCC PLL0 */
 		gcc_gpll0.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
@@ -3456,19 +3469,7 @@ static int gcc_sm8450_probe(struct platform_device *pdev)
 		gcc_sm8450_desc.clks[SM8475_GCC_GPLL3] = &sm8475_gcc_gpll3.clkr;
 	}
 
-	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
-	regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT(14), BIT(14));
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x36004); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x36020); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x37004); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x3701c); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x81004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x42004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x42028); /* GCC_VIDEO_XO_CLK */
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sm8450_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sm8450_desc);
 }
 
 static struct platform_driver gcc_sm8450_driver = {

-- 
2.54.0

