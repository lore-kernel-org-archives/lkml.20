Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BFE48F836
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251713; cv=none; b=B2VFJIdStRkB171ct+3G28U0tjeofA9PSyccWaEysbAceeSgQGnNT+XBb0zFCeTRHdD2oLW5BcIatbm+E55v8cSTDATK4Tu42vrr15J8/imDYux8gAYq0M+whrYuHxIIWe2dKhnnC8EOsY2tRGUfCV4PIlRO5PDMgzTa8Zqv/VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251713; c=relaxed/simple;
	bh=CGpOnWkk/ElTZDyGYJM8tH/j3V0H3wY0rAfUpu2dMVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BNnDdEELyRyQ3/tNLtFQDsWZKie/vzXtaVdTdctlc/hVoRznzqYo2YoZsV0BD3/kwsrbVQiYj4cZ4wb3cwKZUhToGIc6d7y0mHEVhbYek9TCMdN8aY9Ep5IMg/Zkn07kzZi//NIz9XZH6TruKwfRiPY46vu7mJhoZ8U0MEoQgV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AWa6LzeV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h0T0U/BS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AWa6LzeV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h0T0U/BS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4tBQ1630793
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2tNQ6jvHLom1PA68jaL5sN5X5omMtKHYp8VZCdztl78=; b=AWa6LzeVHIh+EfDH
	YwTLqnBC7MYo7B5OS7fTBQiRl66nrzwtOTy28KOcvX9VqYxo540nUa7EOQmUB0Xc
	h2h6TM4S5S/2ukeIeZ5AXaxKP39ByKBBaoV9yC3uwcxa3AS19X0H2deEVvY1Re3g
	vTYSirSOMKSMz77lKgylUIIznvxqKMg5+xivDrbXDhaIMU5xbcuoQTJKYc7FUMDu
	rFb32yykPHhRi8TtzKzqUhtV64LT3g9fNppHguhUad9mUWTK3gjE2W6wlfE+c7mP
	mqgiQOLkzinj8MTgmh58orj3NR/sbVk19dcMNmAeV/XzN14MPlgJD1Ur6n/rTB7F
	EQNMCg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90axen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:31 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-790de8f0cecso559627137.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251710; x=1790856510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2tNQ6jvHLom1PA68jaL5sN5X5omMtKHYp8VZCdztl78=;
        b=h0T0U/BSrQ6V+6Rl6Qw1g0iP1T65AyCP4kyOVYkVdzceSW4rd3Tb9s13HYLU0POZly
         BbAdhRsr6WDQGAPVdS8Us4n4/NXERRBpzqu/1O6d8GE+k/j2E/eFMoVKGM+s2do0gMKR
         zDini/ikZ9rZvF2Quw2LhpEDpY5E/EC7WKv9Lf+8yyNTMTGlyXHfsCvOvjQa5KnUjL+I
         PHLCLkydvTs3OO0a6pxK/wvU2rzTEKbWxob6FcQl4mgjKZ1z2Rgcg+3tqBFJcYa0wB/f
         WJxRnwK77FCnXXKvhHKn/RkXNIeS06RzUSB3SC05tfoCjAwnNNDCsJ306FCsnI/WHBFY
         B8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251710; x=1790856510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2tNQ6jvHLom1PA68jaL5sN5X5omMtKHYp8VZCdztl78=;
        b=hpgqHZfn4hZL/l7VaF3eL8BYnT0oSzOAcB2Z2yur8h/udi7rQ0vYjWcteY4aqrXBV9
         kseDpu6dlUGFbMLhjx8fPDyw92RGHw33HpDhwUAy8OmvHyIFfgjUqudTLS54mBlonGiB
         UK/Wyl5Xk5Osk59TTqvNJoVnQ/JTjU9vJXwgjVdVB9mWCzH6t6DaFTFAqQYZnAOgKNzJ
         NUXoxqyUN7VqMvyTg0NRpDAR3Q106E7Q0fpBOKedVwEI6yiks0jTotSG8W9TLkTTuYRB
         ZZuMrCXthtjGPI5KkmyORSgSV/3GmT+/1COBfJW/rSy8MG2GzCnjhCKI5sDAhPS78hg6
         b8PQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvjUNl+jfmTr8nxasW5WEFK1Shsq4RUbL12Dm1J6fXsIA8pITEtzQ98uGm41FwG4OCGshJ1FoujcgL0XQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lhvfh9oeLuPnVwn+5X0GQlJGlONAP3OGmIt+oalxu0T8wf5016
	RtzMQKTjRi9bimziKQRiSq3DEC+0jfammXbBkgeBU7m47SgeJyJJGgfQO3kznrLMPKcnC3NsfoQ
	zo1iSuGRE7yFRLeJiHTKSOcGoiSLxG6vbCWxad/v+XnJNOWnwdxIF3sIImSsRGZGJj9FEJ3kJGR
	s=
X-Gm-Gg: AYBFou0YTY62SILoZOWDhWi6l9A89nHXz2I2XwMQQKxdisPqx7dx4SydPlpyq8+oZ1y
	4EmI4cpYROSB9rEsRepqxLOVI4yq8J18ZT+Atkusgu74rgs0afqpKadiADm14Rx80C7HAj2UkuO
	3Pgy9qe6Pyamt6i97uvOOidyUns7crvDAd8if2uRHm19vemxkH+hJHzWYRMi5PY30CgOVD+9n+D
	SvzI3vgErruHZabRhSzkJ838rCGp02mU6vTiMthUC94IsStrNrq87KcpZj1htTTlQ90wQJcHJEn
	xykgxMDr+4emAnVh1lQlgKm3ksH0aAaOvXrC8SfGyLwrJieye05BG2Ngopg0bD8qd+JalhIzdv6
	S0AuO54EU
X-Received: by 2002:a05:6102:5792:b0:7a7:195a:1b2b with SMTP id ada2fe7eead31-7af1f815d47mr918228137.37.1790251709990;
        Thu, 24 Sep 2026 05:08:29 -0700 (PDT)
X-Received: by 2002:a05:6102:5792:b0:7a7:195a:1b2b with SMTP id ada2fe7eead31-7af1f815d47mr918205137.37.1790251709278;
        Thu, 24 Sep 2026 05:08:29 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:28 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:38 +0300
Subject: [PATCH v2 26/48] clk: qcom: gcc-sm4450: Use common clock
 controller probe data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-26-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=4313;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=CGpOnWkk/ElTZDyGYJM8tH/j3V0H3wY0rAfUpu2dMVY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJaD+o6idrGxWBaeESL9UJPdkdbJh20krdgA
 CWQr/k4a46JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSWgAKCRAbX0TJAJUV
 VqBJD/4vTuzWAzVDAJBJV3cA0yCM+19hdzQfR6oqDyy/jXRakYvJWO0xYLMJ9NmHsJcVXkZUIhv
 oiWN06sn2bCzzf4/IIcuSn4orALpe6CGKhwvWith4LLl517M8DBs5ge45HKgo0SiWCZ++BVNejk
 NsmNYdgr5t34ienPEGac/u5YwtPboIeGcn5BxrZLR35GQbOt43vpBQkoMS6uu1s5eAf4Q2Eby2V
 CuMwIJHNge2/xpy5/yQSLz1J2ZSkyHoXMFAM5JM5s7nfQBNZPvwUhF3GhEc48+olFFOklFGAeQG
 S01HLGPJuY6IJsiR4A2umucuM6TvMrNf45GnbsHhIbeAjdMPHpHzcr0V85rmOmTB/mqtvWcnvDm
 7iCuZT/rfJAZhJwUbX/8DLjIz1tey3T8a55HT3tuSwVpfzK8nDXZjYkicqBF4jWhoOWXnxcPJCr
 +C4VFLn/ksh4qsi7JR8glAWi1MLuD5qt2gSUYZZeKbZ5iiMiFLgS+va5irHZEgnkvsIAhIIIZHJ
 QBTY3ElSYvHaJk92+dxrQ3ci2JKOxv3BmfuA3tqDzeqNaohhvPU8C02RYrdWlMXluCyTQHjYTFX
 5tEFyFUm6FBamL08HwDcCelmYa53zIXPb+CFUqvDmWWzW1mkqELlsRfiF3vdl9Rs0RI2aUxs662
 kDgyIhyypbnUAYg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX0hfWGW51+0DC
 t8HrB5RCYJMNjfhAvhSgsYxkCr7KlPO9jgPpXl9J9lnaG6APH7UBKrRcBBvA84JxjiaaxPXuGvf
 6Jk+zBdIaVq4jZWPSiizKqsPSychj+c=
X-Proofpoint-GUID: kBeUzWnRPNjZi7URVKCo71P0oeR3num9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX0sqW7y4qAPew
 +V2ey4yjv1yUZesohFGRs0e1mlgNTZBIG9k+azGdFCcoWqelyflRkYQjILct+wgnfrFaWjf8RXQ
 xYvcMw6LYJ8oCToBKcM2PZvMgxl7lmojKB2NEg5CGcdODGY4a9kBCmAdlJ/84Rh1+aXJQnAnAVd
 kHdmh2fnSTsi9wWU3zphT6EOuHvNKQouG8HfeOYKymX+xxzFtF4rc6QNljylm6YcGRkG9vOoWYZ
 pwOHXUIxGArnPatKDXSU2A87dsngLS6d3FsoD7EqAcoHST2mv/XhZoP0wrIuaDka8VK7swm72hG
 iCWtk3mLCXwVlG/4RKEY6kZN4DzHtEfBeToOhXMrdA89tz4a3pgPLsVwHLF/Tfoiany+wqbvTXh
 B8xlVmfVha+Ywx8Q3ge+ZFDWJom86HcJE5MjaEtwfu2BuREAgiMt3lEqvYn8UvPqn1FNDx15Xwk
 bgDkl0huJUJn+CfqRhQ==
X-Proofpoint-ORIG-GUID: kBeUzWnRPNjZi7URVKCo71P0oeR3num9
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab512bf cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rMBTewrK3YKLiG1KudIA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Describe the always-on branches, DFS RCGs and GPLL3 through
qcom_cc_driver_data. Associate GPLL3 with its existing configuration so
the common PLL setup invokes the Lucid EVO configuration helper.

Move the UFS PHY ICE core FORCE_MEM_CORE_ON setting and the video branch
register update into the clk_regs_configure callback. This moves the UFS
setting after the always-on branch enables. Those branches serve the
camera, display, GPU and video blocks, not the UFS PHY ICE core clock.
The UFS setting is still applied before GDSC and CCF clock registration,
while GPLL3 configuration still precedes the branch enables.

Use qcom_cc_probe() for the resulting common initialization sequence
instead of open-coding it in gcc_sm4450_probe().

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm4450.c | 64 ++++++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm4450.c b/drivers/clk/qcom/gcc-sm4450.c
index 4fb4d43e8582..7a5274687890 100644
--- a/drivers/clk/qcom/gcc-sm4450.c
+++ b/drivers/clk/qcom/gcc-sm4450.c
@@ -140,6 +140,7 @@ static const struct alpha_pll_config gcc_gpll3_config = {
 };
 
 static struct clk_alpha_pll gcc_gpll3 = {
+	.config = &gcc_gpll3_config,
 	.offset = 0x3000,
 	.vco_table = lucid_evo_vco,
 	.num_vco = ARRAY_SIZE(lucid_evo_vco),
@@ -2815,7 +2816,41 @@ static const struct regmap_config gcc_sm4450_regmap_config = {
 	.fast_io = true,
 };
 
+static struct clk_alpha_pll *gcc_sm4450_plls[] = {
+	&gcc_gpll3,
+};
+
+static const u32 gcc_sm4450_critical_cbcrs[] = {
+	0x36004, /* GCC_CAMERA_AHB_CLK */
+	0x36018, /* GCC_CAMERA_SLEEP_CLK */
+	0x3601c, /* GCC_CAMERA_XO_CLK */
+	0x37004, /* GCC_DISP_AHB_CLK */
+	0x37014, /* GCC_DISP_XO_CLK */
+	0x81004, /* GCC_GPU_CFG_AHB_CLK */
+	0x42004, /* GCC_VIDEO_AHB_CLK */
+	0x42018, /* GCC_VIDEO_XO_CLK */
+};
+
+static void gcc_sm4450_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* FORCE_MEM_CORE_ON for the UFS PHY ICE core clock */
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+
+	regmap_update_bits(regmap, 0x4201c, BIT(21), BIT(21));
+}
+
+static const struct qcom_cc_driver_data gcc_sm4450_driver_data = {
+	.alpha_plls = gcc_sm4450_plls,
+	.num_alpha_plls = ARRAY_SIZE(gcc_sm4450_plls),
+	.clk_cbcrs = gcc_sm4450_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm4450_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sm4450_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sm4450_desc = {
+	.driver_data = &gcc_sm4450_driver_data,
 	.config = &gcc_sm4450_regmap_config,
 	.clks = gcc_sm4450_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sm4450_clocks),
@@ -2833,34 +2868,7 @@ MODULE_DEVICE_TABLE(of, gcc_sm4450_match_table);
 
 static int gcc_sm4450_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sm4450_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	clk_lucid_evo_pll_configure(&gcc_gpll3, regmap, &gcc_gpll3_config);
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x36004); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x36018); /* GCC_CAMERA_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0x3601c); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x37004); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x37014); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x81004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x42004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x42018); /* GCC_VIDEO_XO_CLK */
-
-	regmap_update_bits(regmap, 0x4201c, BIT(21), BIT(21));
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sm4450_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sm4450_desc);
 }
 
 static struct platform_driver gcc_sm4450_driver = {

-- 
2.54.0

