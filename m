Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8604E1C75
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776443; cv=none; b=blEX4Tzjr6niOzS7acDMcIwJ9GvVy+ufKrJpZ3o/gevGAaBk0V6oySCU5RyjQPl/LQ4L2wG2TChVEhdb1E6W6fO13kRvYBb3OZ/5ExvAXFby2Wyq5SoMt4llJptBOD+9YFZmDVeDuHIUvzrAOJw2lp/1rF6vVIrb1pa0tZI1NXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776443; c=relaxed/simple;
	bh=C5kS0UFiBQBxbAO7J0O+tt8viTIzi/t8PoyC1nzYDCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ML8lnjrOFJU08Jojnrrmjiec8hxj8uQh9f7OMOYl8GC6Zafq3kNue5nDA8gwa7jZD11I3sXQkONNqBoeIiC4nwD7b1uk2n3unY7s7baI62w2dRk4atN4EbPEz/f9sYi8rH4yYXgIke3rc0p2Yc+/3/c8JuCM83OXOYX5oo+qkSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z2P1OAEq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CFCpnlpE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z2P1OAEq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CFCpnlpE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDrO3W3050168
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1QVm3uVGzAUWdDjTOzFAit
	RtIDZRQBtfGneOG45+140=; b=Z2P1OAEqGqOxmq0eP1Jk4XhfkEigaTtTC39ZCz
	7BDSJd8tPGBMSSOEpkRDBXyy9/IsM+6gMVcrMNTCj1qn4DY1xQP6vJsmQR5g6FBk
	nUdiOc15vzqWv4Q8QeijR8cJDxnmZl2d6GtfWFrEZ6s7yI3tHrwdGF2rHVfyjQpa
	S0ZcMPonEDVZfGrlzu3IQ9w7baqWcdluNxpY+i2L1vTi/OvXEwTD9Urqi5RMiU4o
	xFyCNHzi2KbGwX3z8YdBJH99hFjptf7nTfaWiktwk71JoyF7cehgernAA+s4RzEH
	ftaLNdYjlyDbmgIm60fJpPvGmBxBfvV3tb2i0e8kAc69KKWQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjju7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:53:51 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf45388253so110352137.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790776430; x=1791381230; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1QVm3uVGzAUWdDjTOzFAitRtIDZRQBtfGneOG45+140=;
        b=CFCpnlpEYpcBS58b1bV5z6kevj9CHkBq1WzT84yGh3TxDxPhEYor44aIMfDbJE1yFo
         OcpcCNvWodlOMbd9QY7QdQBEHIh41GVkBU7tFtvHtJwzRVz1UpLRQqB/g7n+RvMYz5ak
         t4Xxb7mbDHUBx3VkD4IensbIA5LZVGo47QQmoAhKHJOgamu4WpDfDv6ZLMzTUpmt5WQv
         9Hk88n8wgKgjwptQNd4a8mUIRw+Pz4L5gc06s0Q/pgVvNgf9iBsSBiAGz60o5xIOL2V6
         32MAJVpgffEG6zX1bnGPDrs5wDu6n9yjKEv1uM4hU8/D+KcvdLuVwb1wdIEh40ujCeai
         E2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790776430; x=1791381230;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1QVm3uVGzAUWdDjTOzFAitRtIDZRQBtfGneOG45+140=;
        b=VfIiuY87nFe21c6sKmud8Cgc1QTbEgclABGAHQglYzU32EM2xT2EqX2uwD9xfVq6hR
         4E3N5/tkvEIdnqNukJF6rSenozs1HjurEnwuUNsQthQWBxhINPlThNlgvF5+IZXU57+J
         DPhmcsTPsymhelavkpC/z2DvF+tYFvpAMoezrXYTiAYYc8hY8nDEIqvZaQc552JAT0Ke
         9vhpSIzqsHIMBnRKpTpqM5TnuH0+eL8ELxmhBd9R2Xp7l+J8I0UYs6J3fbz1NyEMGL/p
         WEQAq50Pq9mfBADEuekgOlkBHtjWBt5Bv91mutGQAIRC3fvp7iQ8oS8dLaklmaJBnYIk
         8wXw==
X-Forwarded-Encrypted: i=1; AKwUvByEegcFPHie/0xfSgMhqSWx+bxBIP3mSzc1M5SY2KbLV5o4oWfvL+uaGkpVRblgB8fVKek7ZjP+k/IsLVI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+mwPMqpyijMvzd/MrO6vgArtPRFed8kEGErELRXA8FPsEO8jU
	TRNZyawi5yAgRBwkiTMtCr5bB677qc6ISjqYJvrnXylDPc3DrnORJP2iU2tHlvX83YEQhrObU66
	IogQzQXDWwWHwCH90oDWftgjCUjI21eY2Eo6LgfZl2kKjMdwC1OfPh8/L4DdciySxWzsVTl9xaH
	w=
X-Gm-Gg: AYBFou3AyW0Xy2w+zTbl9QIwSHfXV8RUvMckdwbBARUkwvCEwWcmgs4qs/QrAdrHtF2
	rxavx4oQnl3WCyehm3yC7dbIJqJVlEjIYFDyGbfQ4DPn0ljlGbSCl330IMUAfamO03guMVjIl6+
	ECdEAVMxFMHhk+5c3UzPHULpkQfRUKTJJ27+lwGGTi3mn84adPQ8NbikPFDLi50P04/1yb8xRaO
	iGxs9nnojt1jTkNMc1nVual7ntDqlHIjJMhCpumSSxGg8Pli6Mc5mbNTGIwyevC1KN8Kg/o8b/d
	IN/x9L5o49FXaafM6tUKu3fKqchnTtmhXCKKVpr8+cG103gW2dqDl6ck9vlalavHSPmO48RwsuG
	E84yMCAYH
X-Received: by 2002:a05:6102:418b:b0:7a5:391c:37ac with SMTP id ada2fe7eead31-7be728b59d4mr412297137.10.1790776429801;
        Wed, 30 Sep 2026 06:53:49 -0700 (PDT)
X-Received: by 2002:a05:6102:418b:b0:7a5:391c:37ac with SMTP id ada2fe7eead31-7be728b59d4mr412277137.10.1790776429213;
        Wed, 30 Sep 2026 06:53:49 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01e66b10esm837845e9.14.2026.09.30.06.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:53:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 16:53:44 +0300
Subject: [PATCH v2] clk: qcom: gcc-sm6375: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-clk-qcom-gcc-sm6375-rework-always-on-clocks-v2-1-eaa893a6103e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGcUvWoC/52OTQ6DIBBGr9Kw7hjBINpV79G4AIpK/aEy/tQY7
 160N+hmkpe8fG82gsZbg+R22Yg3s0Xr+gDseiG6ln1lwD4DExazNM5ZCrptYNCug0prwC5NBAd
 vFucbkO0iVwTXB8npBkFxoaVIjOBKkbD49qa0n7P2KH6Mk3oZPR6Jw6gtjs6v5zszPbz/yjMFC
 iwreUalilmW3x1iNEyyDQNdFA4p9n3/Avt4/s3/AAAA
X-Change-ID: 20260926-clk-qcom-gcc-sm6375-rework-always-on-clocks-b57ca73e75bb
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=4521;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=C5kS0UFiBQBxbAO7J0O+tt8viTIzi/t8PoyC1nzYDCs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqvRRq3xLVfKelYT2ztn7DqdXrd7mYNB6kqT/dH
 QmpY+dGFX6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCar0UagAKCRAbX0TJAJUV
 VpDuEADA65QqWu78HRNXJ1a8/8Y3iSvJ+zD9JeiNmGpx2/9ENV6Qcox2Dqzz4qWJlukF/J2L/QE
 WxItPOj3mM1cE4Fa+tyyt+OT5mbQ/oFE7Xq7/vI8Xj4TUu0t4g6iExaAxn483YDt6ZZTM047Kq+
 ECo3NYyeRmqSP0dX92W2eBbjkRS/+qU3Z5UssRD4CP+sJvF03cjZgZLhIoB0emgP7pLPDTdVHnN
 ry/ppVUkqdDF0NhNyefy9SHsCcswLNpVepOa55Uq6oiucetI2Cj68jKzdPZETagwihgRaSxQUbh
 AS8ZxVkZJ779yxZE1GLgLJ3kmpaX5huUNx9LGgDRhQi5JywAN4inUs0VBIEX4MZcOprsml7PyvK
 xdOTCNzYtk7Pi5qUCJ3E4bXMRHZQxr+fQ4kqK/H2mZP8Z8zHWx3Rh6HG8NIcbjVHvza3B9yqLOr
 xDZpDL0mtG42nVbgLiqGrjnC2Ad2nAumP4CauHFOiu6YnS6Tu8tdZ2Jbe8IzFyCQWJAYLQlOnDd
 wqLnV+KDFWP2IJlWVj2X5FJe0Hzo+6c2DA9vAVOBEWe1zAxo7PZ3hP57G4ubtmVqYyRJ/8kL+R5
 XBqmMsLjsFrCq/JZ6ZUxTCaUgnQEhBViX94/mIlZUI8Gq+3mWINpRpABbwZ8OSoSgccodDsjRG2
 xENGkmAoSTSRD7g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NSBTYWx0ZWRfX84fiqZrbOdGz
 HuB25dJuRN9p0oX8n/qjA/0D4m4xij0UI1ZHxNHP3wu+g2VCVtI6kgQPZkf+rKkAWBcxFUCvcD0
 4InY8XJTBE/lDDqVSaJa+nb+0hJAWOY=
X-Proofpoint-GUID: 5FjBwSpGA1UcqJ2-ulkfAxWKpSpnlEwk
X-Proofpoint-ORIG-GUID: 5FjBwSpGA1UcqJ2-ulkfAxWKpSpnlEwk
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abd146f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pmZXttZGwwey1UF-Os8A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NSBTYWx0ZWRfX4Ps/bfEnpnOf
 9Iz1gfVDKk6AoBsGJGkQH9srHkUqHEd9TddkV7zi2AelOVdJOLTnnVg9q3MxS5KmZHNHdSaj+Ws
 v3Cxs3c7S2vGVdAODjUFnFH7hxl6eK1FiGxFBSoTSC/uwc0RFH6if0V9yjgcu22bHi5Y3+KbrcD
 uTgUh3w9D/QXunJp3ei3LfbzsH9qo4SuLQa+r99iQa9ygLeeK1rnce0mDkB5594iV7EO00gPUJH
 4EEAvZI2TaI0Cf87dQNPKqRGTRk61jlURdy7f0B60UFXb6103UluzvCtNt0MfUDa57ahDSO4LKR
 bNbww7jvAMoGNHqwlNJNzAGXi49OztxDC6t5AGiRU8YbVptPn1ZxHuBWuOHYIofHcS5XR/SXjYO
 01m9Fe1DfogWi29mo598vabO/qtjUGQEe6lzpmW+1jyz3hm9H27o35dQzCOpCz3w4xxMN3hHNhn
 UI3dDkuYXzq3Nmxj9aQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300055

Move the always-on branch register offsets into a critical_cbcrs array
and describe the DFS RCGs through qcom_cc_driver_data.

Associate GPLL10, GPLL11, GPLL8 and GPLL9 with their existing configuration
data and list them in alpha_plls. The common PLL helper selects the Lucid
and Zonda configuration routines from their register layouts. This uses
the common initialization order, configuring the PLLs before enabling
the always-on branches, instead of the previous CBCR-before-PLL order.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebase on next-20260929.
- Configure GPLL10, GPLL11, GPLL8 and GPLL9 through alpha_plls.
- Drop the clk_regs_configure callback.
- Document the common PLL-before-CBCR initialization order.
- Link to v1: https://patch.msgid.link/20260926-clk-qcom-gcc-sm6375-rework-always-on-clocks-v1-1-28f581ab0289@oss.qualcomm.com
---
 drivers/clk/qcom/gcc-sm6375.c | 50 ++++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm6375.c b/drivers/clk/qcom/gcc-sm6375.c
index 9c2acf8dc4b7..2c7a6a4e2a2d 100644
--- a/drivers/clk/qcom/gcc-sm6375.c
+++ b/drivers/clk/qcom/gcc-sm6375.c
@@ -149,6 +149,7 @@ static const struct alpha_pll_config gpll10_config = {
 };
 
 static struct clk_alpha_pll gpll10 = {
+	.config = &gpll10_config,
 	.offset = 0xa000,
 	.vco_table = lucid_vco,
 	.num_vco = ARRAY_SIZE(lucid_vco),
@@ -181,6 +182,7 @@ static const struct alpha_pll_config gpll11_config = {
 };
 
 static struct clk_alpha_pll gpll11 = {
+	.config = &gpll11_config,
 	.offset = 0xb000,
 	.vco_table = lucid_vco,
 	.num_vco = ARRAY_SIZE(lucid_vco),
@@ -342,6 +344,7 @@ static const struct alpha_pll_config gpll8_config = {
 };
 
 static struct clk_alpha_pll gpll8 = {
+	.config = &gpll8_config,
 	.offset = 0x8000,
 	.vco_table = lucid_vco,
 	.num_vco = ARRAY_SIZE(lucid_vco),
@@ -395,6 +398,7 @@ static const struct alpha_pll_config gpll9_config = {
 };
 
 static struct clk_alpha_pll gpll9 = {
+	.config = &gpll9_config,
 	.offset = 0x9000,
 	.vco_table = zonda_vco,
 	.num_vco = ARRAY_SIZE(zonda_vco),
@@ -3853,7 +3857,30 @@ static const struct regmap_config gcc_sm6375_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sm6375_critical_cbcrs[] = {
+	0x17028, /* GCC_CAMERA_XO_CLK */
+	0x2b004, /* GCC_CPUSS_GNOC_CLK */
+	0x1702c, /* GCC_DISP_XO_CLK */
+};
+
+static struct clk_alpha_pll *gcc_sm6375_plls[] = {
+	&gpll10,
+	&gpll11,
+	&gpll8,
+	&gpll9,
+};
+
+static const struct qcom_cc_driver_data gcc_sm6375_driver_data = {
+	.alpha_plls = gcc_sm6375_plls,
+	.num_alpha_plls = ARRAY_SIZE(gcc_sm6375_plls),
+	.clk_cbcrs = gcc_sm6375_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm6375_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+};
+
 static const struct qcom_cc_desc gcc_sm6375_desc = {
+	.driver_data = &gcc_sm6375_driver_data,
 	.config = &gcc_sm6375_regmap_config,
 	.clks = gcc_sm6375_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sm6375_clocks),
@@ -3871,28 +3898,7 @@ MODULE_DEVICE_TABLE(of, gcc_sm6375_match_table);
 
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

---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20260926-clk-qcom-gcc-sm6375-rework-always-on-clocks-b57ca73e75bb

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

