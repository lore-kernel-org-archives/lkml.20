Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966D44EBAFB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554655; cv=none; b=abIhO8gjl5XaX93drSlGpjxuAiLe9Rgr5qcTeofC6mpFfMdKrVgn52/cG7XgLVu1XOX/M0Ebf4uHXHWDNuZw6lZJGIe96WeRq9yptO9tHiAITAB87PkP6SRfBNf6gtY3QEcEoUDoO3ptktQMkdpxEH26ad4FtXYREJ6za46XaVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554655; c=relaxed/simple;
	bh=1xxZF/x+vvknFqcI4/E7SyLdAmvk7uNfuS5qhEWDuak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u7UAmvLQF3Q87RB4+e+jsjOmNV2FBe4wgS4+JODFQv7nfbMq/anJzAeu/fhRhhoOphmW/c6RCeDHWz5kT8DycY3aOIAK9CNl9gNF8icOsDC/Mxkgl5fjxTesDyjsz9XbgL1NNizJL8jNaF2C5fFdv9XrMBE6ZRdCw2YCOFPl0Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EFKXqX6M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BxgPiE5m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EFKXqX6M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BxgPiE5m"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92qEm978385
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tGPRPUC+vD5SbbGdAAxZ6wkgGEtlllFZCy8xvEPLSNk=; b=EFKXqX6Mzbka4fyj
	+SZr0lRDQRLLBqDkV8rhc4QOmJw9Rr/EhWagmK8/b1QQmKyXDZa8tttOLk+fcABs
	gW4AiloV2BtHjUSUlH4WKaTUUC5QiFjDoUVZgac8AwSjL3Ebi27O5YoHMuvaGw+k
	XZkGxfD4A0FmWDBn79MqUII0LMvAyMf31lJbcyytFApvRFK8rx8rkx5mwqasbUSx
	NNWkiX04IwujJv0gB5Wp/T1bJcLpmBu5f6Fj60KeX3hB+Wy04HM06WNc6JoOv8UB
	5MZZ4QJD475Bc+S2GvMO8pN1N9fIQjKLJrk+aIUn77BkxVFA6OgQ5A2tQtAm0BF8
	LSgvqg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3rfur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f3426a7cso988845985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554614; x=1790159414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGPRPUC+vD5SbbGdAAxZ6wkgGEtlllFZCy8xvEPLSNk=;
        b=BxgPiE5mA7N4gCRA+Tr1u+bLWrKPFJBS8/mqfn0+OAww0l5gOBEO2ttdLHAdOmy1Eo
         S3prZen2P2Qy0biELuDo/5IK+xfuFr3SNfMvxtgp+vTcc7Jyo+IyyBRMLV7L0Hz1AXai
         wPPtLZiqophratAKqT2gzm/6K4v+VaE1SX5wPP9ZUsTv4PoJzvJAIKuEXsnlIbAh9FJ6
         ZAitLDb7dO3q77rIuGs0aPpKv1qyYNnPq9xrIMvcrCj+AQqOGgISgyp1HuQQNpaRktEi
         chZdAetiO/DUXLpAjc4oRCkjj+evQGLpUtf+3jZhybsyAXNUYTkkjDMFtKDQW/KYe2AN
         GOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554614; x=1790159414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGPRPUC+vD5SbbGdAAxZ6wkgGEtlllFZCy8xvEPLSNk=;
        b=TalLdVQmZz5u3wFkHrH6/iIrLCrEmORZcIsN7DZs3zIZAmf8ioTCjv4pIF8tiXKeQj
         QX+osNsiHmBzlL4yXoDc83YQK3B0UE8mep67gFbwGFu4dWYGs9Qy3vjuLIncp/7IyY3N
         /UUlMe2zaum5oP8YUPzoOQpErXz1+rfJtpBz29TvkoN6c8KgF0v0DCAGTZMJ79wC0iQJ
         4NjcOWPfqcmI8KbZw5qi0TWnAtW3ER+hofuTuQKcDf2HAxesHAIUmUEbs1U8G+y5BAS/
         ErzLCNSt50pfHa4bGVN4czPBYZgM0FNmeFP8vzsgn/DbaiGYjuAOhbLkOexol/P3B/Vw
         Xo4w==
X-Forwarded-Encrypted: i=1; AKwUvBw12suBT01N5j/1BFo6KyzchOLFOP0+knNOfl9iVY5XVcsHcqqwtRThcrpnow+dXHPNLgmsbt6qUpkrGIc=@vger.kernel.org
X-Gm-Message-State: AFuF++nISKt9f3dFU9cRnQyqvSsIznivjUIECvfxiScT0/VGXE2/U7SN
	4/MmHQuzPdYUymHE7vL1PDjcr/DIF1jFBgWHvePv7uCOVezjnIIZdcSnkIT/ZnxZfrTrK+nLInS
	EYhNgEAfb0fvXmLFiERHqJAPkJ4FU55F210cL3wl7k9FLwOIJqqZqXoCyUEC+H/uCOr0=
X-Gm-Gg: AYBFou3Y4+Z5rO4Z6uEd9A42A+JdArPMFR1g9dc0qSN6bU+uHeDPNJ4pLz9S6jEBtQb
	gxaWpmq5jAoJNX9Dj8T+p2qQTW5W/S8S7pG0XM7ctDtJfRIUGiQhvi6IcOLE9yNKKHqGPlMdMCW
	23aQl3USWuATTEMzjbG/ZP5rAzixeSKNLu2HoYQQPCYn73pYVPJ9utqBxEw8ylXpXfpzse6eHUV
	UJM+PrP0UUpHOjYbGoaTXXqAsFI7mrjUljgEKMyqO1TtLDQSnoiPYzaAD5x0nRozsmdSekb0+3s
	VkneedMtGiJVGjwMt9fGVUCvrgvOnt4VM6q1wb98GVbPy2/7SBAUN57jBFyYu7FwWKpv83uBO7H
	V1kxi1nM=
X-Received: by 2002:a05:620a:450c:b0:939:6dfa:48fc with SMTP id af79cd13be357-93bb796a4c8mr310222785a.50.1789554613946;
        Wed, 16 Sep 2026 03:30:13 -0700 (PDT)
X-Received: by 2002:a05:620a:450c:b0:939:6dfa:48fc with SMTP id af79cd13be357-93bb796a4c8mr310212385a.50.1789554613258;
        Wed, 16 Sep 2026 03:30:13 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:11 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:44 +0300
Subject: [PATCH 28/48] clk: qcom: gcc-sm7150: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-28-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3490;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=1xxZF/x+vvknFqcI4/E7SyLdAmvk7uNfuS5qhEWDuak=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9mDcszbdyEA9dPE6tA+RBxqrLA8reSxhRaW
 Ta3PR27F1KJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvZgAKCRAbX0TJAJUV
 VqkHD/4mx+8LFptJEyEJnKWMn9ppytOGfIX2OeFlzGUJl1YsZC0fy9Er9cjR1iPN4z+6hrq1d/Y
 EcdsCkhK6mBnX2Uu5U35QwILKklKfbI3FVQAFVbTpPq34vVxkYYeqAgkoG30rtH7tkcTW6U+blm
 RGR6lHoAhbE9+nhFyF1y5OYyWoWlhib9TUSLBjRX4jZggdYUqUJ9UArzgfXtm6gwC3jhKrARDJM
 lstQeKKPETiEsUubkGBlgphVDt8aLYjuKs5LWpys72KAlms061W25JoJ7+uyD83WBsCudYykLdF
 dTljINDH1srzQP6nU8+IKqrGgj/or1x0Z6rtjxeWGFq39aNMRoMVW+gD61jXB5VQjpQPACLioUR
 ddR2inyvl+fhndPjIPfhmOhgWsAYpoft5nlsnZmuX4wBeCzHOhz3WRjhDQ0CD+BJqCz4X2TNoOF
 PzjUwTxqsYnfGpSJhc4/hkzguM7daCvlpJkmk7V7TLCjxmGp5yeLXVo7oBABXePQjHyf7T6ccnt
 CGLV7AxV3W44qW98dEvB6KcuU/KrHlpohdbvpfygAsPFIz5SyfS4FLXINFFZjHK3pgrSQ9BpKWO
 HyJZ/ZaLVLWbtgkmPsK1Pg9kBj427nHbE/YGZDim0xHtxFCy7TzOWlp+uO9agwAfJfCCPk+PpQd
 mezpu3PDDv4pqtA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX9JYcOvuI9zXl
 gZjCSm/KdIVKGh6XJMLlYnDQC+Pwdx9iCt+Fdls79c5slXNL1P+V/awoA+kdNnTIqYE14zPNyG7
 bWUAVVkDstpC848qkTk6OByQeex0hi4f0Z/7h2LcxQs6yifj/iGW2Wnd30WbXQpngaoHI9uBuQ2
 K34xvJSMJv/Pv2Bz8LZmzT92vIKk4+sYFrgGwPFMAF/uz7JDfIubQrVqj0tp58ZS0IDWQi706LE
 8U3McZlk53tOQwjvjIHhseaTq1WUbaw5WqEPm5GEwu24nRudvTTPKp/pnmF/R/FxFPp2jX1ZZfO
 fcJC2J85bC8lXUufoaJe7DwCtFSk6lx2X4lmixkSu8ZJoezYbUSxvq0cnCmWJAJWgG60hyJTpIl
 Qiupsp1FEZg+8DRY86xynJKTyMBZ0Xoo59V80cte3F8WV6r/qNONDygFjDGNrPQ/frqjmWieJxZ
 Y8qcYu3iBRKJub5IbBQ==
X-Proofpoint-GUID: vB26BHAtzsmHXrkssbRcyPNf6XEvz8IE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX/IjMzDdK9PjS
 r2upgQ22saAeWZkJAAV74zT5HpFE4ZrEFVq+X9DgI15qPacBebh5N3ZvJNzWYNUVw8+9yjwN1UP
 dgr8gjo6Ilnby8azXuncoeUSGK7qnHs=
X-Proofpoint-ORIG-GUID: vB26BHAtzsmHXrkssbRcyPNf6XEvz8IE
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaa6fb7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RW22A4phRzxp-fsVvwcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
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
 drivers/clk/qcom/gcc-sm7150.c | 60 +++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm7150.c b/drivers/clk/qcom/gcc-sm7150.c
index dcb5d82a1a31..9fec45a4837c 100644
--- a/drivers/clk/qcom/gcc-sm7150.c
+++ b/drivers/clk/qcom/gcc-sm7150.c
@@ -2966,7 +2966,35 @@ static const struct regmap_config gcc_sm7150_regmap_config = {
 	.fast_io	= true,
 };
 
+static const u32 gcc_sm7150_critical_cbcrs[] = {
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
+static void gcc_sm7150_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Disable the GPLL0 active input to MM blocks, NPU and GPU via MISC registers. */
+	regmap_update_bits(regmap, 0x09ffc, 0x3, 0x3);
+	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
+	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
+}
+
+static const struct qcom_cc_driver_data gcc_sm7150_driver_data = {
+	.clk_cbcrs = gcc_sm7150_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm7150_critical_cbcrs),
+	.dfs_rcgs = gcc_sm7150_dfs_desc,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_sm7150_dfs_desc),
+	.clk_regs_configure = gcc_sm7150_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sm7150_desc = {
+	.driver_data = &gcc_sm7150_driver_data,
 	.config = &gcc_sm7150_regmap_config,
 	.clk_hws = gcc_sm7150_hws,
 	.num_clk_hws = ARRAY_SIZE(gcc_sm7150_hws),
@@ -2986,37 +3014,7 @@ MODULE_DEVICE_TABLE(of, gcc_sm7150_match_table);
 
 static int gcc_sm7150_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sm7150_desc);
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
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_sm7150_dfs_desc,
-					ARRAY_SIZE(gcc_sm7150_dfs_desc));
-	if (ret)
-		return ret;
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sm7150_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sm7150_desc);
 }
 
 static struct platform_driver gcc_sm7150_driver = {

-- 
2.54.0

