Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9F64EBAF4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554616; cv=none; b=CxBgOtAdbgQBqcxrPcfBEfxq4hbs0Ma0EHSuo8k71Pqzj90pAtMVzQ1URtbLpUCPhAiv/GrlZetc3FEMJLfoI+VINKSrs/3yYRIh+mH+aeI383XT9fBvqGuIseWBepsktOaVn4d11p2sY7gOxVRtraBdWIpZwbB9WqXSN1wmtj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554616; c=relaxed/simple;
	bh=tBxDKwK5dVUntUU8aUkyZy/853SQKi6jS2YjGz+1Qrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lOJMv9PeYejgEEMIkSc7Ss/RpeamTy1l5kFZpeAB9pWWVpQ6ZrLPotjSYaNVhCfbo9tAHBYMPK+e2+CcKuQihdUAPXv8lM3q6ccCvM5TcwHhtf3zZXJ+yGw+Vlhu1xF7/cIG9H4E7waZGfYew6xAGwq+ZoIUe8/UXPJS1yq2gtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADIlGjXI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R93TQ0+V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADIlGjXI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R93TQ0+V"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92lCa2122049
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LANd+7i+Gj5CJwN8EaR5yUOhoSzKJAAhbRaAV10vXpE=; b=ADIlGjXI1gOPFzKE
	Xr3N8HdkDkdFcJjg+UOgzbtp17ZaDDkTjj4Ca08UmOEkvDhowu59PTcak48tPo+a
	C/bNc03geewiPRM3Ii8288D0pwtU25Emhwt8rD4h3TrFiixjh24X2+LsjvQYtv9t
	jkbJUydXznnfNBWea82kSbI/gEt/ejN5vyojNqoJmuDTszb/Bx9sQqQd+hi9sA7L
	m6BNqa/FXESyFSRXZ6cXkd6N2/w5+SnfwIXz9OplGB1wa4c1BBntUiDDJN6vkRD5
	FlGz7OY83rrvexuChA1NMbMawMw13jRMLS87jLlMx6CSQcK/v1phnfnr09BVbhkF
	pUS0/w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqkv7hhrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939a6937513so845578385a.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554592; x=1790159392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LANd+7i+Gj5CJwN8EaR5yUOhoSzKJAAhbRaAV10vXpE=;
        b=R93TQ0+V2Cph0QIFP8I8DUFb+kUnG4Jk5XrfL66KelO5FVNYcfq7zPWLCu4R8Nr6rX
         Q9u7dzleE2PtwQD6j0T9XyPOtRuJnJfA/zI0k2sqK84JeGhbB3nuoSuJ4ZZAg1xuHXRA
         iWwUEGE/2Bkgq1bCzKeOarGrqP/bUR+Le7eMvM5E0X1cBYQRxHn1U1Hfgtei3FI3UpMt
         7+wu/zvko1l174l6iuaWq+VHnNVD7rnfY5e2LNbpMK9j8A7yT3d2VHF2U0Vc6GbDzrFt
         a9v2w9806JaHlbIUcBhHY5ddJXGsArvlXTfuCNdjX7p5G/XDXoCe4L5dnTNrDavr624+
         zDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554592; x=1790159392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LANd+7i+Gj5CJwN8EaR5yUOhoSzKJAAhbRaAV10vXpE=;
        b=LiXWecaoNR88E3IRZ6+LToFuepQDnX+qX4xwLen0LY5aNJ+BmAXkczCfecvbCenyiO
         xQT6gL2vAq3QSh8NDKuNA+aSGL+by41y+oFfG3H7oLOFzy2ISdK7yUjC2LsnAQ9xkmzF
         ybycbMlt3LSJG1eCtEz+J++gtGEJTUrv1tm0qnWMd1XtJbCsVeA8Mwvi2YVH91/81d8n
         cT6kYBh8kSSBSO9lkqie8yhFjnlC23snovTuIB7b09r+38QNxzjKxFk6N3EEpYiltiNt
         xM7hhp9MkyjUDbH82fw8lkW+2atlmRuZ4i5rweQnnDDadTJR3E92x1z2x+34cVKwnqD5
         FX2g==
X-Forwarded-Encrypted: i=1; AKwUvBwORgqSPbCul6/u3NQpTqgsClQuUFKGcu0NkMiBd+BU5hCXvk/TXtxp7tHFPZL9G2kIFZ+o1f1I5/o0kB4=@vger.kernel.org
X-Gm-Message-State: AFuF++kWrDRIXMLXzKOh/iCPPMWbU1L1PnWmvrjNWdMpKS80uuPtumXm
	QtXlWYHfAZSVAXN/mR7+sWE1QBF+UQt/YOrONTHuozooAXVhS6c9iolh9W1y1ISAk/XxgTd/Vqa
	M6N/nQYSyCEJSbfbLXXK9LWmiA4Ia+6kbecspQ8vQ+fkFi1EouuLadWMkg2ATKOFGlzM=
X-Gm-Gg: AYBFou0qhUG1LPdGBPLcYvjSfQcA1PTECZiKxAwJyiMoLDc2YjpQKFLt2hH+8dpXONE
	6XXFgqY85LkkeHOGiGAtLthTJZIgPIr78E8phJ322V506JociN4n/z7i7PuhqrDIrBgkWqzbJlu
	gJBDu03Xf8kBAZyLhKGNcU4suyztoR4VCT3sN9bRVAh0KbcVV7XO1Mh8D2xu2lPRhv+2alXlu1/
	AGhYduRcm90qehC0Z0pevg/gM8EmpmFSoRcuisBnSohWod6mt0v89g5BcJYHbMDuQXpvee3jPAg
	9SbSSrImwkurcDmNqVQqZyk0ZIhLbraOrNNw6K7SAle36R1l5jAey2uRQJouHaV5Tb0utFJc7mg
	rdsKAQJI=
X-Received: by 2002:a05:620a:4381:b0:93a:2d2b:a5db with SMTP id af79cd13be357-93bb793c4a0mr289530785a.45.1789554591447;
        Wed, 16 Sep 2026 03:29:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4381:b0:93a:2d2b:a5db with SMTP id af79cd13be357-93bb793c4a0mr289527385a.45.1789554590916;
        Wed, 16 Sep 2026 03:29:50 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:50 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:34 +0300
Subject: [PATCH 18/48] clk: qcom: gcc-sa8775p: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-18-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3370;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=tBxDKwK5dVUntUU8aUkyZy/853SQKi6jS2YjGz+1Qrc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9caxSwSKBXPyws7qZIgUQLuMy8Zrhob5t+e
 AxSkZ2dnViJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvXAAKCRAbX0TJAJUV
 Vld2EACkkm4XLqwVyXNVpzoTPm0m6ZiKYDSxjV7tSCoQ89n+EkcfL7rSndNzp2maK5C+9nq8aVy
 KSfbkYNabrh9LGjD7YOjPbDHXewEqCRdOOsIHQFdsRsXynUkcll+eOyKa64vliMSldan7eyysbN
 9Qm3o2+gnH9p93Qp+NIeIW9EDbW9hbhBjQYMmZVofNEli8bSfG89ewAQPiKLTx5JJZe5TLJet2b
 GfZ/LZeOPPk1uBviQ35jrv/g2ipSMepQwPkp5B6VdY+4/Hs+8T20rPlWxzj3oVGDWmo1XDIL3CD
 fUbGrcHBcrCSTChyLV5TXPUw9CNXAtmOZ1iekFtfGeZQAGxYkQ4hXIA7GdHxaLuPdr03ETVOPof
 JWTEvBlMyRCrh/AQ+mRBi1bJTdZYDGsomAM9wrZwbk1I+BrdYEqlgF09JnczjJ/xJ8F9lOHVJeF
 1lMImJdMzsqRpnewNBODwc90hPrcA1nsU1g9ZuiWKkBKN2CLQCTN1DUUDfRerMEq4KHdmQIdhdK
 9o8j2w1ydDW6hB2GRxSFt1rEdI8bNBKCJUubvpk7pJuWTXjJlMz3JXsfxtEcM9j2ZrzTWuRpF+K
 mS5dMW9ud52ZcmDBW0Yvakla8BRYNjiRDAqUmfjXskq7Pd9rYsS+3k4xgyjn0OSsPN+E9vmgkDi
 7kRgYxIqtFzuIaw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: NFDW8PKOEfRiLzU2zuhX00AA_sgMCJb4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX9pLIe88WXhOK
 7EMRjwyEWl9Nq4y5jB42336Y4rcf3kz2lUg2/B/2sKlb1nGDWnlM+OyemgAcQijaf18c/stOLv+
 jJcV0FmJ15+EYkXnnUgTPfwiY+n9qYb5nVcfrND+ghCQLnVuiNgraUi0weF0B1A2Qh1ywzBoU8k
 HqZAkV8Kj0ywQDXyGBTutImJyawCg2Oq6vkmOhhJOGSUGZT8XykinY3YtDHdHwxTNxiUVstjUsj
 MVXlJ5UmPM/D0rXfp0nr70sHyFTotLXYeOyq43K1YC0p+nRmUw6WIbcdrG9Cq+oGgzXcBdnshp5
 taERPlL4PUjijkxXRQ5h99ZQ9q6JCocr9/aiVhS7vQShGsxstzogt5+HqWhSzg0SmjGdOcWlnS/
 cqDkjxClzwAX4c+GNWZOYGJJqteR5k3pz4oCDVY5zEZUPIa4Y6epGTpmdz4RORxVTkK7L7+m7Lq
 K906wJulaE94XzAfb1Q==
X-Authority-Analysis: v=2.4 cv=eKmGH3p1 c=1 sm=1 tr=0 ts=6aaa6fa0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RW22A4phRzxp-fsVvwcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX7GIxLm89wSEB
 mDCMo5pRzI4CE9svG1oV7cT4xYiL+d06r0ILYWx2pmUfgsQGiwjPa0gOnhawwfP+9nwhzJAMA7m
 06uyRS8vtfidQPj6/ei6B7ZB4i2sEwc=
X-Proofpoint-GUID: NFDW8PKOEfRiLzU2zuhX00AA_sgMCJb4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
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
 drivers/clk/qcom/gcc-sa8775p.c | 55 +++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index dca316decd0e..fa31710ef557 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -4644,7 +4644,34 @@ static const struct regmap_config gcc_sa8775p_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sa8775p_critical_cbcrs[] = {
+	0x32004, /* GCC_CAMERA_AHB_CLK */
+	0x32020, /* GCC_CAMERA_XO_CLK */
+	0xc7004, /* GCC_DISP1_AHB_CLK */
+	0xc7018, /* GCC_DISP1_XO_CLK */
+	0x33004, /* GCC_DISP_AHB_CLK */
+	0x33018, /* GCC_DISP_XO_CLK */
+	0x7d004, /* GCC_GPU_CFG_AHB_CLK */
+	0x34004, /* GCC_VIDEO_AHB_CLK */
+	0x34024, /* GCC_VIDEO_XO_CLK */
+};
+
+static void gcc_sa8775p_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+}
+
+static const struct qcom_cc_driver_data gcc_sa8775p_driver_data = {
+	.clk_cbcrs = gcc_sa8775p_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sa8775p_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sa8775p_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sa8775p_desc = {
+	.driver_data = &gcc_sa8775p_driver_data,
 	.config = &gcc_sa8775p_regmap_config,
 	.clks = gcc_sa8775p_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sa8775p_clocks),
@@ -4662,33 +4689,7 @@ MODULE_DEVICE_TABLE(of, gcc_sa8775p_match_table);
 
 static int gcc_sa8775p_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sa8775p_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x32020); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0xc7004); /* GCC_DISP1_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0xc7018); /* GCC_DISP1_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x33004); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x33018); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x7d004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x34004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x34024); /* GCC_VIDEO_XO_CLK */
-
-	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
-	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sa8775p_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sa8775p_desc);
 }
 
 static struct platform_driver gcc_sa8775p_driver = {

-- 
2.54.0

