Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB36A544898
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876104; cv=none; b=mdnv7y2ELkw/CfYoQg7p/bjUmqNMMoM6qlVYyeFchSXdiZTEeSbsSJ5hjK8MIoFkGusZ3ewQuOMurUjdQMH0k5OKWeMkT49fbA6MYaoJf7VjcEUveVZfqsZNGya701V9zJtwP5ngz1C11VTFa/ccsnviaZcdvRjDDac/BXjzDrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876104; c=relaxed/simple;
	bh=98kKZplLgwMnUTmtg7P0Ig8F0r5UfX/eDhjTsqVg8iY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BhIx/gAaMO7FpomdCLRLXp6gf9IK+4iFJxE64q0yoI4FhN/ueJiMFrjGEs/tJi68ZUs2kMH7YXPIFnE8ACjRTEAPBAKQ2WfTQOHUnctnYjMkeX3+PVLnefSpWTBq6DfhW5y7MeEhBCm8uAPM37ofETGS8qr6e6dakDP3r1GkqN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VhgsDzuT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLnN8ZrV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VhgsDzuT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PLnN8ZrV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Cke043033380
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 14:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d3lZWKvsln7GkuyFHmWd0pm2AawtPAqNjvGbEfy/DFM=; b=VhgsDzuTJzAH6w3v
	AqqxqgQYq7FSN9SKqZwrcYxCULSYloZ48sQQPk43e0d5vDlu4BD0V/gaKtmb4QHX
	AYn+Nar5BXHuNH3vv1WKlYD7+UGonP9dCT/adQNLpXYVtapDBvP2UB62RaxECMT3
	7sqhLiVr1P9q9Ct+iqmOABdwVDJAZwqPUFHP/tApXWAHnAMXnB0grQz5HJy8a4q9
	ZRvQoBobbhHE4mYf9bQ5OFD0j4nUmBgd+mPwSVEGq8wNTTwJ5zLhYdoNoWjqN0kc
	tEsAjpmmAfDKszVQXH4zXlrUGExXrk1LYkoPVIHegQbZneoykzbvbdLDez7QDmC7
	2jwMbA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjhkj0kbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:01:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-385d2703b64so5651745a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788876090; x=1789480890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d3lZWKvsln7GkuyFHmWd0pm2AawtPAqNjvGbEfy/DFM=;
        b=PLnN8ZrVX6xEIRflmH9hNYRjhsaJB4BJfzo4tpNvugfnBTxwIYkYUYPLunE+ejjf1O
         iMMDTWz786Bz768DE7z1Cclk21E+B/1812jTQ4xWxxM4EUEyVjPXyIIErPdVeamYRR8N
         ke0z9WC2EszNYc88kERltZyKOcld73eOBeGb9swKyq4lIYvP4weegwNVUJHSAs1NueGD
         hxnP6QJS98/w4p9tZ38kQOOKaCI66siXt2Og3Fb/d5GMjpT893w4TI3gQQ7lPDvuShHB
         +9PGt2AuBL8onuz1JwHG2UYzXNm+rxEepVFAvQnMu3DxpA6EOm9LyTirpEdEAHNDTzqi
         6v3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788876090; x=1789480890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3lZWKvsln7GkuyFHmWd0pm2AawtPAqNjvGbEfy/DFM=;
        b=OWdsHFSQFkgswz/7ca+GcGo1uGtxSP/R8+Nkbh6iEsHXDrbLwCfsBOndfUfPjfjb90
         f4T+XwbLBlVFJPU+DmBMkBAMbm66lue76XbtTcoUIUnepM9fKhbelWQV8SGP7+Lo2clY
         Ecb7JUceBi4ouJF7dxDAN0aOvPb4L8G3vFHZk5Gmou5t08L9YKKjY4t2ATZfXDW58mRj
         imvCsx1/jpP4AdwFHL7apNEbbnj3emOKN5ksFBDGVbjMixZbJkpxCm3ZbPPbXVmFt5pH
         mxuKaUiwl+fc9VWkZiFVmdLPz2g8oI3DPmvZTAxWhhNKkZ2+5UNpQV0URNQZGcXGdFc8
         FtGg==
X-Forwarded-Encrypted: i=1; AKwUvBwovK/GhMT2iXdQfpIxs3uE7yRdVgxc7CyHnTqsjjJbzzp5N9uCZOH6z5q6p7hXVJmMsU84fQ0Ig+WFIw4=@vger.kernel.org
X-Gm-Message-State: AFuF++n/Vfw0M4Xgj466IE7+Evu64ZyQ2em90xI0eXdmLuzMP96I7lxe
	HS5AuDC95zPZdZNo8DYJ89UO9FXyV0VRdO4yST3wwfpMIak7f5AVbR4bcMf7c0YV6Ba5thtSlBn
	vdDUanfMtlbkpLwZgMgcN1HsFpq654v98Y5xwhjlB4QC/K7QTy5RnHoZG6m4Uztw+8ow=
X-Gm-Gg: AYBFou1HoqXaLno6wG4vSSQSuTyqxptT5AR3yeibxVg/LJE0LjdVS0RVZ7L3IxoHgE9
	JyciHWUWcA5YkWImd5HzGzoQYcTMHE1B7bK/EzOnpLkSC468wirWkxoUVy8EenttXl89y/i7CEg
	7QOvD6tlVs63xOF65HrcsSkqoEpm9OXd67UOntPMVN4eBrC4JACOyLVAv88zXS0CPxH9A83EB0+
	+xKKgjNemZ0g8+4PKxrMoFnGHGFv5IUHGNoxFwGwhwLNXm26fIg1DYwdijjnXH5T33TTCzdm6Ts
	mK5rmvnllbQJXI+MnHkHDPLZnAGGY4rYfjZ9W4EER/pWwAEPLVq6StNqO56ii/D1X8ddOFwL+Nh
	H02ulGQ1nPF+ES0cW/ecAcdaulS8=
X-Received: by 2002:a17:90b:280a:b0:398:cb8f:c308 with SMTP id 98e67ed59e1d1-39b076add5fmr38241168a91.0.1788876090097;
        Tue, 08 Sep 2026 07:01:30 -0700 (PDT)
X-Received: by 2002:a17:90b:280a:b0:398:cb8f:c308 with SMTP id 98e67ed59e1d1-39b076add5fmr38241016a91.0.1788876088797;
        Tue, 08 Sep 2026 07:01:28 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm57506667eec.16.2026.09.08.07.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:01:28 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 19:30:56 +0530
Subject: [PATCH v4 3/9] phy: qualcomm: qmp-combo: Update link rate specific
 DP PHY tables
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-glymur-phy-v3-v4-3-ff22e5150538@oss.qualcomm.com>
References: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
In-Reply-To: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788876071; l=8118;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=pwlIkGt/zLJAm72JF+kVbQeDtABbLDGH8n140bk13Es=;
 b=ikd+c8XmARjIbdsr4+XMj4cMOl4IGAxQBdMelshvwARtayPkh/mo5ASdIM6vsUlYgJ6KYvgLH
 NLzRsT9XrIPCakcIFtN15t4UpHDudHuL9lpg6MmDZsLpnQv3U84yb5B
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=VYjH+lp9 c=1 sm=1 tr=0 ts=6aa0153b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pfGozU-De2Ei0FjDxxIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1MCBTYWx0ZWRfXzBpIn9/hvW+x
 pw7u3I6JFERjn3sB6NL3T03zKGuFc6iUVj/35aGPzc7pSxL5Br7bYl8Q7af7E9PUaPMeHi5U8St
 fOkcKLwvo8gymIuvBk84soC6A7zZvQHRm1aj3+qHV76pnXHDbvH0hiNqSKHCqopsnnvMHiIy6FS
 F07qSIXai/VpUR8Fs8o1NYrbFwSUPW4gzNiTWcILuQrnAwm3L53zf+EkXl8Bjlh4vMfg3gOU8p1
 rYQX8LkxQrUDOwURF0Ohfeu9pGxu5y7KchPxmlecyW3UYTP39CjoeL2A5QAj2GHC6auhJusiF/a
 YddbUd7mHzv4qfBnoKFZ94O9jgrE7VakvuUIlPpP0uj9b1fK9XiUVCjr3zf1e1ODMOqwPGyTuc2
 dx8K/4YFPRy283h8dEJIPQ5E6AXC6Q==
X-Proofpoint-ORIG-GUID: V07t9rznWt7UWkK20bb7r2G1WD9bnfoS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1MCBTYWx0ZWRfX5+1xBETb0Ivh
 VnGW1Q3Nf6UgRI3q1qV9Es4TgfyElom85jNCGrU+NQslQ4WKmg16onfGOMnAD6BUCfoYwNA5KgG
 o8WKG1PLiiqfZXG04exXAWYMyTzKG2o=
X-Proofpoint-GUID: V07t9rznWt7UWkK20bb7r2G1WD9bnfoS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080150

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Update DP PHY initialization tables for all link rates (RBR, HBR,
HBR2, HBR3) with corrected VCO calibration codes, lock compare
values, SSC step sizes, clock forward config, and bias enable
settings for proper PLL programming across different data rates.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Fixes: d10736db98d2 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 43 +++++++++++++++++--------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index b2ffc20e8f6a..16ccabd945f7 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1746,11 +1746,12 @@ static const struct qmp_phy_init_tbl qmp_v6_n4_dp_serdes_tbl_hbr3[] = {
 
 static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_rbr[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_HSCLK_SEL_1, 0x05),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x7a),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x8d),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x27),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0, 0x83),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x37),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP2_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP2_MODE0, 0x02),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DEC_START_MODE0, 0x54),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START2_MODE0, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START3_MODE0, 0x06),
@@ -1758,16 +1759,17 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_rbr[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE2_MODE0, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_HSCLK_SEL_1, 0x05),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MODE_CONTD3, 0x07),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1, 0x30),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL, 0xa4),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL, 0xa7),
 };
 
 static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_HSCLK_SEL_1, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x21),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xf6),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x20),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0, 0x18),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x08),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP2_MODE0, 0x07),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DEC_START_MODE0, 0x46),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START2_MODE0, 0x00),
@@ -1784,7 +1786,8 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr2[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_HSCLK_SEL_1, 0x03),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xf6),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x20),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0, 0x0),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x02),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_RCTRL_MODE0, 0x16),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE0, 0x36),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x10),
@@ -1794,9 +1797,9 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr2[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START3_MODE0, 0x05),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE1_MODE0, 0xae),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE2_MODE0, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_HSCLK_SEL_1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL, 0xbf),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIAS_EN_CLKBUFLR_EN, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_HSCLK_SEL_1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIAS_EN_CLKBUFLR_EN, 0x17),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_RESETSM_CNTRL, 0x20),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MODE_CONTD3, 0x03),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1, 0x3f),
@@ -1804,8 +1807,8 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr2[] = {
 
 static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr3[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_HSCLK_SEL_1, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x63),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x25),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0, 0x5b),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x02),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CP_CTRL_MODE0, 0x06),
@@ -1813,7 +1816,7 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr3[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE0, 0x36),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORECLK_DIV_MODE0, 0x0a),
 
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x17),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x18),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP2_MODE0, 0x15),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DEC_START_MODE0, 0x4f),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START1_MODE0, 0x00),
@@ -1832,19 +1835,19 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr3[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYS_CLK_CTRL, 0x02),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_BUF_ENABLE, 0x06),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_IVCO, 0x07),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x3b),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_CTRL, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_MAP, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_SELECT, 0x30),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORE_CLK_EN, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_CONFIG_1, 0x16),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SVS_MODE_CLK_SEL, 0x15),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1, 0x30),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIAS_EN_CLKBUFLR_EN, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIAS_EN_CLKBUFLR_EN, 0x17),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MODE_CONTD3, 0x05),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MODE_CONTD1, 0x24),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_HSCLK_SEL_1, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL, 0x84),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL, 0x87),
 };
 
 static const struct qmp_phy_init_tbl sc8280xp_usb43dp_serdes_tbl[] = {

-- 
2.34.1

