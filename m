Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5644E0B89
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847348; cv=none; b=K+JuSSq1rp2vovhyxmZfj5B5ja94W6qYbbXvmTC16WzKy9JUpTHy8CTuhin9n+So8Jj1xfWS/YNCK//ahAfDQ0JBOw2llY0baBrcSeOKjy18jwWOGVXBuAm8XRtjf+DbI7PZpEWFNTXMuVgztfZHfNHEvpfxck3UAv9eZFIVhWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847348; c=relaxed/simple;
	bh=+xqOEQ9foYAvA8sQ9iS7dzYziFssfG2kdesQM5H5i8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mqJMQVkmRYP2oQP3tPgCXdy2syTQCtvAKJpkwtm8f3M9nrR3KtNRY4LjqmtyyGFbr8kAIKGhswvi4pYcY8uWsCyishMW5mTukYSXPLssORS7vmeEOkvFrBsCfwQiwWpc+1PefEOhiSSV8hqYOxLrTuL5wP3LW43nVEXbIGRsJvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EGbTSRny; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cOZhh5fW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EGbTSRny";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cOZhh5fW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xMxV1932322
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 09:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wyMNhz/1GK3TS0U7yd/IUSi8hDU2xudF2XWXP2QxBZg=; b=EGbTSRny7AM2TzWm
	mg825CpKA/N2WsmSZzpKvrjMJrAB5gsdce9Mu2U1oRlzcnw/9ipcga17Xfnk6IP3
	ifd3zl/1lRQ2MJbnWu1aP4qtUwBVndYCCzqsU+ZZ6rlfFjaOKLAwrU0R549d3LP5
	u5U32WL2tNcGyFS35hEhW1a8Ga41Z5f+Pbo+vOA/rbLF0NihgeewTEX/yvQn/eEi
	9TPdwo3QmMNR3RMjsI8jRLZKJSL+iRsmJZFpGuIwZgO4wQyJFmw2MoNg0p1X0B2+
	wsMXoRWcGhFUpqUUMsRPJ4RRLoqJQObwdorS2g9HIZR6hkg4QnOeEgKPteJ6uLGv
	2Suv1w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5a58m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:35:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7ce00b8c6so2058479a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790847345; x=1791452145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wyMNhz/1GK3TS0U7yd/IUSi8hDU2xudF2XWXP2QxBZg=;
        b=cOZhh5fW5knqnMDX56LYOX2MK+eS5/ikVDmRz/SnMnaPcJgSLihfScKN7dW/OD9Qh2
         c7oQ9HQidpXL4QVprnbRP8TJc+lx//+/EEDH3ijurT5Q/QL5LD8tbPplMSJCVw7xjrIB
         JNeai3Weaoagg/W/SzxklPque2LVZ6YFn280VkV0gQLNCKW7FSEAopATK3ZP5UykGiXH
         sTydlvcuj1S1Tw2KkvgdOIHjYmaxrG6ScmQYVo/teKh0anGszv4U9Hfx72dzsa8HhCtL
         Vx++SY0ouzcLVBDs9i9Axo3G7PvobJbLssWp24Jzvd92vWeQ1Y49XqY4wfsO6w+WZaGX
         ZxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847345; x=1791452145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wyMNhz/1GK3TS0U7yd/IUSi8hDU2xudF2XWXP2QxBZg=;
        b=E6RdqVq35z+mR1KMlrMKJNbC214wklUC3eQsdvsSt+8QDym3SKKauQl7LHNJudWvDE
         C7d78Qt801FF38xZVADl5tCy/T3M7XFyfVPC9GynIXlwEOygny/5VocpvCNmXAwEM/il
         xwy/PSC2ogzTsNo/vx55Ki1ajUzTmLCzVk1+V208aL4Du2eJRzUI8g9P5iZGWEkWbnlo
         jFMfin/dOVQdxTJw+VCeAl6hnshBMyJshV0ClHbrSOKUgTpxV0kYCf81f5Q6YWOFLM83
         nevvP4BjS1o15Zb7+X30dllRnslnG7qS5OS702RZp5e4JD0QF6cJAkMkGky4Rq2pefSu
         bCbQ==
X-Forwarded-Encrypted: i=1; AKwUvBysmuXtFko6/35rGY/A4iajQ7nyorrp9jEeglj10oMLNowEmjyj0Ini1zA+SsyaGrA8YgkNjMBnATb9K3I=@vger.kernel.org
X-Gm-Message-State: AFuF++k6kprbSaqAxJMP6tCy8aMxmypWvdEAV07WJg7i2Tl5zGsLfOCu
	IjgxQ9+Hw9ukC5ymAhAzHZxePY59YFWxhupjMG5U/IO6aR7MsacWzQ1hQhYTZo1Pv6hSjKngLEL
	i6E4cLnGU0mH+fbp/AQQfox3aoGNz8fnqe0Wb34ebRNkOTa08Vw98qZonBj0b6m4QRlY=
X-Gm-Gg: AYBFou2c/w7V6WZOJncgNmljWI3t3f8/ktLYPUUBpwpxwUi/ubkPPFvwFirU4v47bYp
	RnIzOUEP6iJ3V3NnoLP72zudoc9hyg09M7jrEK/qVXwLh9QACNGe1F77p5JHEL8qyc4DrSfoMLM
	qoHN9IO/aafBM89I3E8Rmhd881MEnHtvxG/Or4vxDN3GlOlN/K8Sb07/SzWcaQXHBx8S03RnZ6i
	L7S8EKtWe2eGVh6jdV4VZ1X01YUcKmedUN7ty6GxCC16IVXxQXBMLdKvD0QlJ4ADkPBuf7fIdC+
	P6uLxqyAvjWM1TWHiuc97V7A9Jh3WkhAjIQIME6uGZ3Pzhf2LWBYx4edHuzmToqooJvNB0h6CGm
	q8MeuiRQjpxIcafyBFoiPRxBJRAs=
X-Received: by 2002:a05:6300:670b:b0:3de:46cc:b637 with SMTP id adf61e73a8af0-3de9e851a4bmr4502228637.64.1790847344984;
        Thu, 01 Oct 2026 02:35:44 -0700 (PDT)
X-Received: by 2002:a05:6300:670b:b0:3de:46cc:b637 with SMTP id adf61e73a8af0-3de9e851a4bmr4502203637.64.1790847344515;
        Thu, 01 Oct 2026 02:35:44 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e54bf4c4sm1152944a12.29.2026.10.01.02.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:35:44 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 15:04:27 +0530
Subject: [PATCH v5 10/11] phy: qualcomm: qmp-combo: Fix Glymur v8 DP PHY
 init and configure sequences
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-glymur-phy-v3-v5-10-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
In-Reply-To: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790847286; l=6089;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=NiCUJS1q+OAhCUfWyUVgKtc9YSGbF+jFYOHfmFgoBvE=;
 b=xQv/YVM3mxlLsKrbin/7FrrGVtCIooqan1EJERZfJLh17wUeV3YhOEEA/elA9dew9Eg15GNdB
 FtxowpLXItxDCF7+MxExRieAd47PVt5cKg+UavGE8BE+NduG6R8wOMF
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: k3GfavnttyFBCBNXNE25IUKDfb4BwATU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX6EYP0omlZAYZ
 JYmFpt0DJWv9fKg5V2CsD/7UXzvs3ge9rk4xl1o6SawORVCeztYyoJrhwTeuhOhNB4fBRAYr76L
 M4YLSRbcdnvTGPae8x2+ejQpRKpTjmM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX5XLb5UIgUvG1
 s5Q/1eeuJ5gGRw8J8YRfC8E4IMmdRonbHxjK+iqIkNdn5nr7i1hre5NIBsBBqlHaxHqvGv/fCSu
 bM2WGB/Ucp7/86jdKPwZyZaJxS+TviuUlwljLmohyLKA/KRr/p84c7qYiqS209OlSIR6W3gZoQq
 UbbjLLDX3Ow1ynJKLAp0+Etr+JovPo9RlyjL7sX4XOlJsV3SzbB4wmRE4fUYLmr/il5WRjKD+T9
 AqmMKvbIzD0S4YjyMKe0wUFjX5TNiNGNU7bYiAtze4c2u1FHU+pTI1vk5VX8Wa4vsIquiQnDiuu
 zWtI1eYevFA/8dQecsu4OHwpWv/0YnKOVx1jU5lyJUR+TC6l9Vb5qn2aeLBq69yh+OPR0cwBunD
 0HL+xWcCiyciHxIpWfrGxkKXo66bSjzX9LR2Yu/TBwYjSpuslbFns9Nc21lmWltrh+MlrF/sSVp
 4f1iu4i/8rdlT2JCJ4A==
X-Authority-Analysis: v=2.4 cv=NuxE4MdJ c=1 sm=1 tr=0 ts=6abe2971 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ShocUR_Qg8epsXyAbykA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: k3GfavnttyFBCBNXNE25IUKDfb4BwATU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010038

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Update qmp_v8_dp_aux_init():
- Add CLK_FWD_CONFIG_1 initialization (0x3f) before power-down control
- Replace PSR_PWRDN with LANE_0_1_PWRDN and LANE_2_3_PWRDN in PD_CTL
  to correctly power down the data lanes
- Correct BIAS_EN_CLKBUFLR_EN value from 0x1c to 0x17

Update qmp_v4_configure_dp_tx():
- Correct default TX_EMP_POST1_LVL value from 0x20 to 0x2b

Update qmp_v8_configure_dp_phy():
- Correct 2-lane and 4-lane driver enable values to 0x30 (was 0x10/0x34)
- Add CLKBUF_ENABLE (0x87) programming for both TX lanes before driver
  enable writes
- Add TSYNC_OVRD sequence (0x03 -> 0x23 -> 0x22 -> 0x3e) and
  LALB_RESET_TSYNC_EN_CTRL (0x0a) programming for proper TSYNC handling
- Fix QPHY_DP_PHY_STATUS poll to check BIT(0) instead of BIT(1)
- Replace post-lock TX_DRV_LVL/TX_EMP writes with two COM_CMN_STATUS
  polls (BIT(0) and BIT(1)) to properly verify PLL lock completion

without this fixes following can occur:
- Link training failures or instability at higher rates (HBR2/HBR3)
- Incorrect LFPS signaling timing, potentially breaking USB3+DP combo
mode entry/exit

[   34.109482] [drm:msm_dp_ctrl_link_train_1_2 [msm]] *ERROR* link training #2 on phy 1 failed. ret=-110
[   34.111460] [drm:msm_dp_ctrl_setup_main_link [msm]] *ERROR* link training of LTTPR(s) failed. ret=-110
[   34.118118] [drm:msm_dp_display_atomic_enable [msm]] *ERROR* Failed link training (rc=-104)
[   34.118156] [drm:msm_dp_aux_isr [msm]] *ERROR* Unexpected DP AUX IRQ 0x01000000 when not busy

Fixes: d10736db98d25 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 62 +++++++++++++++++++++----------
 1 file changed, 43 insertions(+), 19 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index fcbd7b974be0..5bbb2b5f8c74 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3856,12 +3856,15 @@ static void qmp_v8_dp_aux_init(struct qmp_combo *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
-	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_PSR_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
-	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
-	       qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
+	writel(0x3f, qmp->dp_serdes + QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1);
+
+	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+			DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
+			DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
+			qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
 
 	/* Turn on BIAS current for PHY/PLL */
-	writel(0x1c, qmp->dp_serdes + cfg->regs[QPHY_COM_BIAS_EN_CLKBUFLR_EN]);
+	writel(0x17, qmp->dp_serdes + cfg->regs[QPHY_COM_BIAS_EN_CLKBUFLR_EN]);
 
 	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG0);
 	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
@@ -3888,8 +3891,8 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
 	writel(0x27, qmp->dp_tx + cfg->regs[QPHY_TX_TX_DRV_LVL]);
 	writel(0x27, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_DRV_LVL]);
 
-	writel(0x20, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
-	writel(0x20, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
+	writel(0x2b, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
+	writel(0x2b, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
 
 	qmp_combo_configure_dp_swing(qmp);
 }
@@ -4078,39 +4081,60 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
 	} else if (dp_opts->lanes == 2) {
 		bias0_en = reverse ? 0x3f : 0x15;
 		bias1_en = reverse ? 0x15 : 0x3f;
-		drvr0_en = 0x10;
-		drvr1_en = 0x10;
+		drvr0_en = reverse ? 0x30 : 0x10;
+		drvr1_en = reverse ? 0x10 : 0x30;
 	} else {
 		bias0_en = 0x3f;
 		bias1_en = 0x3f;
-		drvr0_en = 0x34;
-		drvr1_en = 0x34;
+		drvr0_en = 0x30;
+		drvr1_en = 0x30;
 	}
 
+	writel(0x87, qmp->dp_tx + QSERDES_V8_LALB_CLKBUF_ENABLE);
+	writel(0x87, qmp->dp_tx2 + QSERDES_V8_LALB_CLKBUF_ENABLE);
 	writel(drvr0_en, qmp->dp_tx + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
 	writel(bias0_en, qmp->dp_tx + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
 	writel(drvr1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
 	writel(bias1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
 
+	writel(0x03, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
+	writel(0x23, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
+	writel(0x22, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
+
+	writel(0x0a, qmp->dp_tx + QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL);
+	writel(0x0a, qmp->dp_tx2 + QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL);
+
+	writel(0x3e, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
+
 	writel(0x08, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 	udelay(100);
 	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 	udelay(500);
 
-	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
+	ret = readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
 			status,
-			((status & BIT(1)) > 0),
+			((status & BIT(0)) > 0),
 			500,
-			10000))
-		return -ETIMEDOUT;
+			10000);
+	if (ret)
+		return ret;
 
-	writel(0x00, qmp->dp_tx + cfg->regs[QPHY_TX_TX_DRV_LVL]);
-	writel(0x00, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_DRV_LVL]);
 
-	writel(0x2b, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
-	writel(0x2b, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
+	ret = readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
+			status,
+			((status & BIT(0)) > 0),
+			500,
+			10000);
+	if (ret)
+		return ret;
 
-	return 0;
+	ret = readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
+			status,
+			((status & BIT(1)) > 0),
+			500,
+			10000);
+
+	return ret;
 }
 
 static int qmp_combo_dp_configure(struct phy *phy, union phy_configure_opts *opts)

-- 
2.34.1

