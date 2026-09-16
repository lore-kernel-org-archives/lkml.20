Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DBD4AF665
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554634; cv=none; b=sm7zJo5Q5XFzxQ/2OPn1efcxY6eqrL2cdSwBoaFXpWmGmI8dKElDr9fjIb/264lqaWpwMGiVEEX4DnGu5tfQH91/eWrNy1sz3Xu0FuI26Aycl32inJzIEG5SvzHZ/41VYqzf+9BVKs3Fw+IP0kuCxVCVkEgjLpywBACsyuoKxaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554634; c=relaxed/simple;
	bh=ddwGgK1AMwuuaPXS1Js+aJ7kjNcNYNkRp12TPyDDed8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OFOFpNn2Txl9sTT8mXlrxhAS7pyIAwRO84seuJFKcXIX4lBoqrg/pbXUJ7oY4mUwR8RhC9G4nUC1umO91ihMUiUC9tLbpcJZUbrgpZkoVny+rotKnutrhVK1jEKZEaW8jBAGYJmGOJGoqp6GxyJN8AgCdcQ2GaPSL9hHefaL2kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KqyqjPhZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eW9fyqFu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KqyqjPhZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eW9fyqFu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G932TM1587174
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dupVxO3Ux2B86utZCu4T9d1OT1Nghpc2qj/E1glcAGg=; b=KqyqjPhZZjh0mlbb
	bADULDENYTZgu6euVC2jspX0xt2E32wEKfoWP4TeQv8Sv4D7DYdM50fKGislg07o
	K4orAheEJAD3AW10vZE5YIHepdeFYAFw744sNW9xRy13y9NBcHtnza/Y0/OHllXa
	4hkEJBz3Mi9kjsZghDZfVJrygFDeJAR1TAjRQHLObvCWQT5Q/+MfaJeeybf4sZ1p
	0QmS037GYXWG9VkBe9P6EVBBErvuYDx0jAjUeOFr9Lmle6pXRZhApcH4bF++nZti
	s5qZ8hY5C32u6dHst+nMPmM77ANrdZM2hYoPPl0npJQhpRnxPY1mXQVFjFbLSXre
	ZOWSYA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqagekscr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0050a554so1095114585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554588; x=1790159388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dupVxO3Ux2B86utZCu4T9d1OT1Nghpc2qj/E1glcAGg=;
        b=eW9fyqFuICzrRVYdmJZwyHLOs6HswWz+uik+FyU+3iLcUVkx5R+2cz7Jxy601Mj8h6
         QEFS/0YWFcO7+BpdZTMjGoI16EpqMoemIWDhO6ajyplf/fNb5yZI4VTwExkr0ohLlxv5
         qnhZwsUnXZfficKURjT9+Wq26eR7W3e4S/FYvTeWIFWLd9c/q4Wi0LDMv1blsbBAlL9Y
         w2K6ap/A/OIfoBcPdJt9ybAGAi0XUHb28pgPFpRmq3xg6UK1lijIqaIy1cZaIKwRXk5z
         K3DkcWmOZFKUsv6z6jdtX2rIgdhm3l6jYicBKaQyMy6nyZeWlM03xCR/LvcESzwBSb4x
         QJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554588; x=1790159388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dupVxO3Ux2B86utZCu4T9d1OT1Nghpc2qj/E1glcAGg=;
        b=detavIoN+7JUt/PG+u3Ij7wDXV6O5m5MQcpK9WcgL06QMznqoDIO+pwsU6WvpYeTJJ
         Ky6RuGxTe6fYlNe0IR70kGM3rfM8QFblPNUz+NmLT0qAqux1Qh9OpGR1WlZyoZH1urDD
         ZpbCv1FnYaWSll5nzo4MSEtKdqieAv/Ko1DYlN0IVCA5Q66m0ICPhG8eFB74Fs9LiEVy
         09Wo2ZoXohnN7GIMV21liyTz0BvcxbmCerS34Fc8fCUiDvDJoXyTHssy4IFnDlCY/S+z
         barb7+9R7oF9F/rOjvwONpAegv54IFtwBIbEORDU5UfxO+oe+rOFQ/tbq21K0X7fr/SY
         y95w==
X-Forwarded-Encrypted: i=1; AKwUvByLxeUv2M0Hr43x8HStlsf8UYSS+3eb3my0xzL98Dwj1DS7dTgvzxpzbzs9m4j3QwBlrci79KRkHdZfZvM=@vger.kernel.org
X-Gm-Message-State: AFuF++m+0FvFe19PVspe2CXbiiVxiJG4ouPnrQd/+7DFE3qGONNlGFgN
	ODONIPau0Hb21qkizvxlvmpNtrkfRW+DNNux5VfkWm3mOQRYVpF531yawCHhlqHGRRyABvw2CWi
	FVFKz/N/PNRVbP4+tBjcfJfR3Tc1EdIeg1oBwKenEzoD6g6sHkMkeniA5UsQvW7Daf/c=
X-Gm-Gg: AYBFou29V0M43pPinXbQQfzZYEZwlLLFI+2p9ACGtuyxBnEdMdx7Dt9M//xTz9hdOs/
	GKIoSe1qQX2KlsE7VRoqhe6/dXeD/AHIlAPOEnbskidgmMT5Cx7WaYXFkXm6QXhpRaTMUKif+LK
	4HU4Z0vSq/c5+ZAGHMHeRApkWypitL7MQGIl6ref2dZVhku0nkJCWIRQBpavAVYpY7ERGMHQO9M
	QYeRjPAL3d+KBdp96T5VhhryB3kdCSLK/ulGaiejPQaecOKTRLkYc6wOUnq3cBT7LZN79Kyx6MK
	16rabeSnb+6tsNjIuas6UJ39LW3iNcyZu8XeOXvGraacnf/5T2vI/qp3hfTxEjYYRb/w9qs5Tla
	uQpH743M=
X-Received: by 2002:a05:620a:4454:b0:915:9e84:85d1 with SMTP id af79cd13be357-93bb77923aemr312952185a.23.1789554587721;
        Wed, 16 Sep 2026 03:29:47 -0700 (PDT)
X-Received: by 2002:a05:620a:4454:b0:915:9e84:85d1 with SMTP id af79cd13be357-93bb77923aemr312948485a.23.1789554587157;
        Wed, 16 Sep 2026 03:29:47 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:46 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:32 +0300
Subject: [PATCH 16/48] clk: qcom: gcc-qcs615: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-16-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3380;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ddwGgK1AMwuuaPXS1Js+aJ7kjNcNYNkRp12TPyDDed8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9aKhONHX31O23uGGxdRRlQf91bz16l/KO4V
 ZmrcgTtu+KJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvWgAKCRAbX0TJAJUV
 VvAAD/sFTyYpgugbf8SNNzY4b9ebMV0GNcmbX54SIK+ZzrV2NyigBIdDqk5tWo61SHqdqxvEn/a
 CtnXT1FFuMLENE0Efz3U3fDinTpLSUrFt9N6zmOXe/95cFA8gnlIVls0hajnYZAWuWzv90WvHQ4
 UMs/u12MLQZ/9Sz256zjHOJgwdQsHQXbgaF4Pa0LM1KNJuPFmzqNQTPqukzYvpcrNFRnJB4l8DE
 RhI2bjzl9cHP4zERsQ130jFO8wrpVknxKnWd5UxQdiNYH6DHUVHE3n1f0nz4CU09/hfTzSh/pHU
 GQYAxtFEzFUxwCgp33CAXj+YMRKD3DfI1omyUTZnO3BPTu9GEe14HStLrhYNlEjSMW8rjepE9Ur
 Gqltc8o4cgVNxTD3zDFFQZBzyUw9rdoCdjEyA+do4lMDrUTIoppNbdIAjrSGyeYrtaLOwFFWP2o
 pGkpTTwTplRClA40cDIFKeG0nAMGnJ7vphQA9JgLB4f7RXp1ilw3NDG5rCZAfogdXO8mqj5SZhU
 /9Yu/gLWeIWW1Xig9KBboZm955/2W+8UZKn7RCLy0CA6X/aSK6T3ox50JwThYlKAsOeUXUszXWI
 HEAx71pZqBtzvEniqR/SVO3hmtL+pAiLJXxUT5Gb5mNM/BpLUR3EUp9Mh1s0WQePktGIhrOe6aI
 Hg+PhqfSwannLKQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX0n3u7kinTaUr
 Qd/2iH17QAOdMJwI3fWKedw/vvxZ8kO9/Pw9ho5LxFAPN5mFmRkEUmRVPubGLZ0/UkuZUfTRy82
 W/DI42l1bAMa8EoUkcrkkjQvcUC7+Bs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX3xlHPIrMHtpR
 BMrHXAfYIzBVFaMhbuvMfendS5R2JkbazAoyNQyUH0A8iZGn7o/gBIVsLy1qX8sMCYIlnhrHAmV
 vPWrtWYImFLCk5AlKCA76GnnwWmVJHiGN7zuzcZTLTfhewuY1RRZilossVfZavY4duWHmWdAXdK
 2xd9m6fpdh2fXfnbh/3iuxPEajNgUc2hi/P8OkIJMRyCgF/uCm8RwHdo/lhTQd/ORo1BSkh76Su
 CIHR9J4RzoD01OIZkQIV0y7Ljf2iMkOBTrGpZhjxykjPuqKT6f12pgMYSSZCpJgN9/MrlV4Sd+i
 MYTiFkf4fOuo8XfjIXqEsumbn+ZjH/C5UKk40kG7Uu6B1pld3bjiq60LFWb7/ptvHmeM9cEhR6t
 YAcZnwqKhMcvvo8VeV5UnxKGzrfusrZujJiWA0OLomv82Qv3ElNw0u4uteG2BuR0r0U9r2gMS/V
 aJv5eApzBG3OgdpXLDw==
X-Proofpoint-GUID: JjLxVE-6sEIzJdaaNQ_mOoZ6e5s-BCqV
X-Proofpoint-ORIG-GUID: JjLxVE-6sEIzJdaaNQ_mOoZ6e5s-BCqV
X-Authority-Analysis: v=2.4 cv=PcZqFShd c=1 sm=1 tr=0 ts=6aaa6f9c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RW22A4phRzxp-fsVvwcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
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
 drivers/clk/qcom/gcc-qcs615.c | 57 +++++++++++++++++++++----------------------
 1 file changed, 28 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index 1a6a1e74e805..eda699883cf9 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -2958,7 +2958,34 @@ static const struct regmap_config gcc_qcs615_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_qcs615_critical_cbcrs[] = {
+	0xb008, /* GCC_CAMERA_AHB_CLK */
+	0xb044, /* GCC_CAMERA_XO_CLK */
+	0xb00c, /* GCC_DISP_AHB_CLK */
+	0xb048, /* GCC_DISP_XO_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+	0xb004, /* GCC_VIDEO_AHB_CLK */
+	0xb040, /* GCC_VIDEO_XO_CLK */
+	0x48004, /* GCC_CPUSS_GNOC_CLK */
+};
+
+static void gcc_qcs615_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Disable the GPLL0 active input to MM blocks and GPU via MISC registers. */
+	regmap_update_bits(regmap, 0x0b084, BIT(0), BIT(0));
+	regmap_update_bits(regmap, 0x9b000, BIT(0), BIT(0));
+}
+
+static const struct qcom_cc_driver_data gcc_qcs615_driver_data = {
+	.clk_cbcrs = gcc_qcs615_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_qcs615_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_qcs615_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_qcs615_desc = {
+	.driver_data = &gcc_qcs615_driver_data,
 	.config = &gcc_qcs615_regmap_config,
 	.clk_hws = gcc_qcs615_hws,
 	.num_clk_hws = ARRAY_SIZE(gcc_qcs615_hws),
@@ -2978,35 +3005,7 @@ MODULE_DEVICE_TABLE(of, gcc_qcs615_match_table);
 
 static int gcc_qcs615_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_qcs615_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-	/*
-	 * Disable the GPLL0 active input to MM blocks and GPU
-	 * via MISC registers.
-	 */
-	regmap_update_bits(regmap, 0x0b084, BIT(0), BIT(0));
-	regmap_update_bits(regmap, 0x9b000, BIT(0), BIT(0));
-
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0xb008); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0xb044); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0xb00c); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0xb048); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0xb004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0xb040); /* GCC_VIDEO_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x48004); /* GCC_CPUSS_GNOC_CLK */
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_qcs615_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_qcs615_desc);
 }
 
 static struct platform_driver gcc_qcs615_driver = {

-- 
2.54.0

