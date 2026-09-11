Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1034915A2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141177; cv=none; b=LD4XTwI1tWfGL1rANpIl5qo3hoYkOIU9nXN+x4/iJJldf4OwB/aqvrxo/dXGMVQuXlrXeJWVMN/Udo22++sBjhslGL6Y+dwAejsw8j15VcbqKyQtxmFVNOYi1vnMr/yEBbBm43XT+96t+mJmIB75C/1Sd/c2uszJfgQEg336Bys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141177; c=relaxed/simple;
	bh=hBAp1dVu5M6vm8WuSFnCHF/KDmeJiDE4MkZMq/vkO0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V4+mlHyciadfdA4Q+Zhgp13/hOPy/szwlnfjhWi7eGNfhkWI6c9hCZQ30xQzohIngwJqYrscZ00TMvm/fXLqdahnsW3aHt8H81W+XZ3LbM7IugiHUBK/g9ZIE4Sqtr5L5ypK/PjihQc++m+m2+4eS4rudPP+zZvjRnNbxjtbKR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+EEQtfa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P5ST1Vj+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+EEQtfa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P5ST1Vj+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm8J7443092
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gsOL6A/XqlNEcKVc6fhAS5j/vIAUWo9Ol5uSSyj0hsA=; b=H+EEQtfarwqUIvmS
	Vy7Qi9Oeyq1ghH/qfUBnTvbZ/YgZiRSHfnyUNLpzAYuebisbueA2OTDIkfRfO7Wc
	OYPv2BYVpt7SPEEYoxgCiQwHEHTDsGZ+dQb2f7ohn655GiKLfhWo9tByi8fLWvKp
	fjBqFxvO1EexVxrYvW1BI3zUOzsf9I6ZQJyB81FLGj6sh9BncLCCUW4ZZWk/5En9
	H/1QLCPjBUQB8hPHSIHwwYHB9pFveTyUIWzla1rBHL7gUTh+IqCzOVZQQSyx5nmB
	4cg+DJF5OLCJrFhW4WWmrpHl5Iy/jRSS7pIgx5Miuk68c/e172oJ0W2eXyw8W+vG
	IPPEiQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg2nyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:39:26 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-47d81384b4bso961744fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141166; x=1789745966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsOL6A/XqlNEcKVc6fhAS5j/vIAUWo9Ol5uSSyj0hsA=;
        b=P5ST1Vj+Wql3txLAmkoV7ISU575xe1vJiK162aaLonYSKvOVY/jm9HExpQ83Lcj7v4
         shXQcm22U3qslxWzC1czUJwV2O+7kYWKyOf4IbK8wjjEJdsmzU0cwNhSNmgwim0z6Vic
         8MnOY1K+DJMggEt1nCHO3CROKvHlvLDbianpPe+pLv8tMRFgPQdBMa1SBHBD404QuHq3
         jkpHSgx2KQHzksCcDCc8oy0yjrrrVp+peeou7RPK/zaaaZ0r2tDrIVlPGOFGpfz4SSLj
         TIDXj1QJ34GHWk62rAs4sl64ZpeyuUkO552axB8ENvlRV4VoYSbzVaB9ldzW+QtYMCTT
         U1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141166; x=1789745966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsOL6A/XqlNEcKVc6fhAS5j/vIAUWo9Ol5uSSyj0hsA=;
        b=p7HzPV0TewzqLKZufBC//XyvcWNDRVXKS2c/+r/lfC2tSx8I2CbeLfnUXvD/JAiPhn
         EwwTVggCKj5xK9C7YyPMvlJm6123LHtuLA1MddYx8u6RXwdY+GQDz+GaSsNru0pUw8wd
         M2XGOsGV3FO7+LidoWKwP4yfTl1Mjg7BgPaErPQSBrbyINyQ/bYHvl/5BVSBiL0ohite
         49GIYwbGmv3xBADzMUXJ8UEboVRx8kyHpcAXuI+u4dAyRm79up3qSMzAAXbMvQ4m9/gc
         /PzqNTQrCBukIA7HFf4U9TsGwIg9C4YgOkvmgVRmgb/4p2VIW2Gv2XcZTgeK+6HcQY9E
         IvJw==
X-Forwarded-Encrypted: i=1; AKwUvBzCW7/G88TDfddEyZtDHiHwdEF3LAHQRw9Q6Yx1pgXyuPNK2vSHJvwcxJ6ms3u7DOMSC6fZPAsCtSdAv7A=@vger.kernel.org
X-Gm-Message-State: AFuF++mbwpG1m1Ms/m5T/diPyEDjGgApFkgp/7ujfup1wZOLTn70hZfK
	FIj6pjiDgeqW3g2d1ngfvKGqGrSckB6lWOmzhEQ608xciPi13PUNQ5YCIrfSCwbznUQkTMPDcb6
	8S6CnGsm5oPoQsqNbTiVE4Qi3VDm1Dl4O9ucigvCHq96ws59aH5GeRatAzR1xr24hVHE=
X-Gm-Gg: AYBFou1WynDcLMgfpjG7vgM76ADiZS/4tmVz7WzdCQGkaa+MDNQnb09naintS+YWnuJ
	eKFjMw7UVY4hfAJ4mmhHRhrbatJQwoOFxWrklUkkkHhEosw8N2sNuftKbxax/7qUEjcDRdXrwU8
	6l7pyULoBsoZVzQqw81vsqnsTV5lTt42k+5l7wPjnUxbL3zycblANbPqvweVu6jsRzUgIu1PZtB
	wnqCSeZiTED2PQJhNFh91b7aL3tQJbVa+W9P2GfpGzZ5wetZJBIC3cQCzmQDZXq8zOIwSoHbO/l
	reFHE/sOOSQTbD/SYjrKo0/+enDEgeeouS3o2g9tjFT2ySCAIlC4W5xmtM935z0PD5hn2OjIfjY
	sLYlDcf5NLbWp6nz9wa1rAHv7PKo=
X-Received: by 2002:a05:6870:a788:b0:457:b657:b084 with SMTP id 586e51a60fabf-47dea52533emr6576571fac.18.1789141166285;
        Fri, 11 Sep 2026 08:39:26 -0700 (PDT)
X-Received: by 2002:a05:6870:a788:b0:457:b657:b084 with SMTP id 586e51a60fabf-47dea52533emr6576494fac.18.1789141165861;
        Fri, 11 Sep 2026 08:39:25 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:39:25 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:46 +0530
Subject: [PATCH 15/17] phy: qcom: edp: Add Nord LDO, TX lane and TX
 resistor calibration callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-15-e25c073cf1b6@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
In-Reply-To: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=2541;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=Xy/VEWguip0tUXARr40NV4wwp5carfCh+h9B3ClOARc=;
 b=fCVipWrCI9H3CCZKDDD14z5Es5pRMhlle8YcU1NBrHBqtRPMssWUK43GOknyyVMcKJWene/D+
 tVmDRWKwXQyB5+I7VXQ5EnFrpSRBAEc5kM069eafOWLHDQgUEcpXd5X
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: dJYdQjYvVZsna8HX1GCnq5gqZ0BJdMuN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX/QPh+YWg801a
 81xHvGI0AjBnLhS3bE8Ixi+fqoTF43nJP/m9imJg+rE6jI5XkTBhsjqHzQsESLBGVbuUizjkN36
 hfHbaCqFgDy+7D0FQhztPYh1jGi9wUg=
X-Proofpoint-GUID: dJYdQjYvVZsna8HX1GCnq5gqZ0BJdMuN
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa420ae cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Ap641EtHlGqqo4O5a_8A:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX74kcgSyPPY1n
 mX6TiSOyQFCcUOrrSnx/Tmhm72pghiEjQgh14mdvA+/c7CWaHATmv3bVhjOZ7pQtS6uw2pOnJiB
 pPLq2H2hNVrvBaUr/TUMMumexJciprhgg/B+oDVKH+VGvYAuZ+C+3+dYvlPem/HZN1sUrOcIcD5
 4sphtB2fGSks8R3n79s6CIn5c8QT+VRAuS1Mr9QWiPjw2q1bJOzYYpzHClXILX578B5s4LnFs2U
 dYuB4SK9TVE4akRXGC8IiNcr2//tnTa1gOGrtnK916Vwbw8g9p3zTqobRMrhv8taOuT7gum+uP+
 pYyGoTFUnXPSEdrGx+QM0aVKFK0HDYzLYqxGVbuio4kZtQGCLHS9sm5a/S5+5zCCsBK0bOMbNC2
 C3k0M0A7SvsXo28wz8LaFYWUgvLrWnJOkLIpQkdprn5QE/L4M6I1lnqZUc8M9p07DULWAVKmQ55
 2wkf1u2HJSo9KFQ2xlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Nord requires different LDO levels, TX lane control offsets and TX
resistor calibration codes compared to existing SoCs.  Add
qcom_edp_ldo_config_nord(), qcom_edp_phy_tx_lane_cfg_nord() and
qcom_edp_phy_tx_res_cfg_nord() with values per HPG Table 2-1-d.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 47 +++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 4d1b2c81d956..361f4e467351 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -1800,6 +1800,53 @@ static int qcom_edp_com_configure_pll_nord(const struct qcom_edp *edp)
 }
 
 
+/*
+ * nord LDO configuration.
+ * From HPG Table 2-1-d: LDO Configuration section.
+ * eDP mode: 0xD1 for rates <= 8.1 Gbps, 0x00 for UHBR (>8.1 Gbps).
+ * DP mode: always 0x00.
+ * Also programs EDP2_DP_PHY_LDO_CFG: 0x03 for eDP rates <= 8.1G, 0x00 otherwise.
+ */
+static int qcom_edp_ldo_config_nord(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+	u32 ldo_config;
+	u32 phy_ldo_cfg;
+
+	ldo_config = 0xd0;
+	phy_ldo_cfg = 0x03;
+
+	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
+	writel(dp_opts->lanes > 2 ? ldo_config : 0x00, edp->tx1 + TXn_LDO_CONFIG);
+	writel(phy_ldo_cfg, edp->edp + DP_PHY_LDO_CFG);
+
+	return 0;
+}
+
+static int qcom_edp_phy_tx_lane_cfg_nord(const struct qcom_edp *edp)
+{
+	writel(0x05, edp->edp + DP_PHY_TX2_TX3_LANE_CTL_NORD);
+	writel(0x12, edp->edp + DP_PHY_TX_LN0_DRV_LVL_NORD);
+	writel(0x12, edp->edp + DP_PHY_TX_LN1_DRV_LVL_NORD);
+	writel(0x05, edp->tx0 + TXn_TX_BAND_NORD);
+	writel(0x05, edp->tx1 + TXn_TX_BAND_NORD);
+
+	return 0;
+}
+
+static int qcom_edp_phy_tx_res_cfg_nord(const struct qcom_edp *edp)
+{
+	writel(0x06, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX0);
+	writel(0x06, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX1);
+	writel(0x06, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX0);
+	writel(0x06, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX1);
+	writel(0x06, edp->tx0 + TXn_TX_EMP_POST1_LVL);
+	writel(0x06, edp->tx1 + TXn_TX_EMP_POST1_LVL);
+
+	return 0;
+}
+
+
 static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },

-- 
2.34.1

