Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E782E395ADA
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910212; cv=none; b=mQuCDrOdrCrnFUhJ/fIwDRN5VYXiOE2j+RTOPI2IxgXMpHpHh2RpVy32GUVBzOSW+zJabv+Vjx4NFzIyRwpHQmXaGGrj5Fb2OApdsMVXwBSQ2L/jSxzfDeCBNF4mfgThIbGlMhAGHUB+mqz17cFkzn8EpR3c5RHSQ3UbCk/gsp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910212; c=relaxed/simple;
	bh=ucJc3nW/i87dT+xdDkMa1ze6p3xJaqVP7bSjiVj2z6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u1KzQjc0Qja8eMlPbmAzvGJV/D7BAS2qPszepSVzcUJYUv/OlKlhCTCSXVkGTuemVh3yEEJU3MV1eoorMsqZ0LIG84kYw1svCCnz1RXmSjHhoGf0hS4y0VyBUMnMnUUcJkwBPwXvpyHrlK76r2zGtRkyZ+dy5W6IZZEg2OWm6m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ExleYb/M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H011b07Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ExleYb/M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H011b07Q"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66jal2045916
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/qRlFcmSygKgPY14wysfKaVSc27D8NeNUpgGaEDe8BE=; b=ExleYb/MbLDVEBHd
	WBAq+KZgDyhLu1OJ3zS12TWdaCVgOOVnVv9mw+lgIOBv5LSMqyYdQeh1Qe+fsD3K
	B1GeiYG23GlZZK3YdoJDgoCFbYt4jERAacS61ow+QCvkB7OK2hOAJ3It/FiKiqMR
	lkqsXhdHZObKyiIkSQwOQm/dXqF7Yjs9FUZbSL0+TGclGpZhtZysZmOArQEOXE8C
	nhnewWr3qWFUuELIy9lV0jgLu6izHfjJjPRM3go+W41gvJDQrxIFsZ28wnK9Lzr3
	mef++YY1O6PG2iAr3ouuDABwWWXLPQkLMyjNxRVp+dxaHd6XqPJoyWZN238kIzmu
	SWpiLw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb1v39j4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:43:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso1373201a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787910209; x=1788515009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qRlFcmSygKgPY14wysfKaVSc27D8NeNUpgGaEDe8BE=;
        b=H011b07Q/Ns8xdkoS738fXU+sFNekAz9IDGazl81rhaALKjXIjS/e0rk+U5xok4TgC
         yUPrZStYtAKIhcIBneqjUctRSNhFLEXkeVejywH5KEdUWkUHnB1CueyoargLsMAgFU5x
         cTcmMWVzBaOFBVChSXzn9cCj8VCpy/uVPzaqJsWu7f+NviRHKF88tFlB9pIkT+QUpCT8
         vxf+Uea5QRbSZwKtmmlAXVKqb+noG3gJv015y9r327U2mIPp2V/DxgUfKMXW2IyHIhXv
         swRg8dS229szx+OmH/ZF0SXrFTh3emM+lLVRYEEgSTlA0HwwBPFKq7FKNuDpyk2sAV0m
         mOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787910209; x=1788515009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qRlFcmSygKgPY14wysfKaVSc27D8NeNUpgGaEDe8BE=;
        b=Ea+eJ122H/jZPRYMR8bfWYRuucpeUVBGWjPUW1YV0F1T5Q70obLS80zO3ZGu2BIi2j
         wFu3QreTU949VcriQvnp3s/wuW977GfyDR+k/pBdLF6mabZQ1grqapVJ4hH+nuCHVlQD
         whCclFSuOKyijngMWVEhdyJZq8MNg2KMNuTOVQm/HIb7gykCU4cgywj3w18cJRt9+nzH
         6CFmZ0+4UeQ7tu98iXmzWeI8deKm6XukURQdWg2lYuNvw0TkqDvDvFjjgNDUxHMV63tP
         gtbu079wcj1npoVlbwipQw04fOArz+ug+nibA/rTSrgr6e2D58UXY03cDIYdMFBaPQ12
         124w==
X-Forwarded-Encrypted: i=1; AHgh+RqvzLGA4/nQ5hEepkgmG/lM7dcN5iJrmq58J9OyKco6uAwW7L8bjBO/h4nhH4tq08k3KsjYjMIu4SObg+U=@vger.kernel.org
X-Gm-Message-State: AFuF++k57fscPiD+Qf/iwQoRLkV1SgUdvvt2E4APO7dKCiIsS+4cORKI
	xGDu7Ri3ybCaXj9+RLRSyp50y3yM5ZGJA2eEilxPi84qJ3SWED9Ks6UPQr3xZa1fRET1QqXzxt7
	CclLTVHYp+8nlQ1IWvQvw3Vd9d4PapK6IMfC+xxTXaGw+XPt6agYWWJcA00sf3uo0+aY=
X-Gm-Gg: AR+sD11pzb+ztP9quvZ4we6/sIBa5BnUFZy23dP9LFslv18oUIE8mvvaVHT51JP8rpy
	sfiktmYfg/O9BHNp0hGQQPkMAmB/Ciz2FROwG/wfk6trs/VRYz8Rpzwovy1x26/zuYjGG6MczFr
	J4nK0J5Xj3U3BgCsCrBQ/US6JcuUVQ5WuchbXdr/w3MiNrVUBvcmorRIPqZHWI3E51767qchlAO
	CICN3wfzROyEyIAU3p6WzlAZMe1jLMK7ZySSgMSZ3g8kZ1Ay/Ftt+sbPER/y/EFaXXpkf1WFnUh
	7FdzoEi+9lAG7p4V1JOl/DqDlRLuieO2+HfCfVaHzwT2TUJm7oMoIk/meq+miGiHCvTOqZ9ci6F
	qstQZy4CeEbHq9CvfDCOIAhYIXTY=
X-Received: by 2002:a17:90b:4a42:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-396d0e7c071mr10409577a91.4.1787910208678;
        Fri, 28 Aug 2026 02:43:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4a42:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-396d0e7c071mr10409518a91.4.1787910208235;
        Fri, 28 Aug 2026 02:43:28 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f995e60sm4166331eec.22.2026.08.28.02.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:43:27 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:13:14 +0530
Subject: [PATCH v3 2/4] phy: qualcomm: qmp-combo: Update DP PHY common init
 tables
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-glymur-phy-v3-v3-2-8e73ce7c4636@oss.qualcomm.com>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
In-Reply-To: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787910197; l=4620;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=XbPxVSk6L0oRrRG/BJlHisKaCA2cnH0nHYc6kchbpjY=;
 b=8jSBWj2dYaoHn5RI78oFoNzv8mWQ7E3LX2u/i4n1o8f3HFxtFhNJ0rzsbMAt64Rteg2pSS8zo
 +ObiUws6aCwBv8205IXxYV097d0obQBghGbL0EKaSuPSr2U3Aa+hrF9
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4MiBTYWx0ZWRfX9J0DoAdhGUx1
 dpFItIZih+A4neiQEHA7hEsFZXh8dl2uFiz/VbOo4hBTlpiDFMIg7e/1wZ3rQphDbUXgF/j6Lia
 nBqaYuJaRx7QgwckfNtikfFF5fX8COTZvTYx/uWWBqilIqcYlqPzkjAK4rVNxZVXgtI8XOwwujl
 /clDbKQp8YSJe3PD4q9WT/1RZBxouUSgS5ncm32tUh2LQzWhz0hW2BQff4/CnuZqZeq78I+KqQn
 egWYWBMTN8LuzI7TAXLB1G5ccmvRIvWUql0QioC/CXIIae44sY8qR131jn7j99hDS0dJtx4lQWd
 LiK5J6Hv/AIUwkgDTTMxITAgPS2zvREUUViVvhBlw+L94IS9s+wN8Bf+bHKaaTxXzLNStPWHiV0
 qVOl+n76M6cybXKv8QTVGD0HFDWMv4wyGJ+AcfxwACpBsOIYD6IYkeBb3u/zFFRHT6q4KuCUuGT
 JXEC/DqiPJmViuvYnJA==
X-Proofpoint-ORIG-GUID: ZMufanv9jCdj32cUojIFrUKHrDdcnOkA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4MiBTYWx0ZWRfX28FZk0IXvkVf
 zYBIDglJrZpv0niKn1NKKI5kHWTvuccBjWK5FIEgNi7Xp8ZHk4WttmjTNX/aF45ftgf3LLL7unO
 YyXyNee8HFHmNKL7yjJbrLPNlocnIw8=
X-Authority-Analysis: v=2.4 cv=faedDUQF c=1 sm=1 tr=0 ts=6a915841 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hi1czDCzuCcYxUEklLsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: ZMufanv9jCdj32cUojIFrUKHrDdcnOkA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280082

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Update common DP PHY serdes and TX initialization tables with
corrected PLL control values (MODE0 instead of MODE1), updated
SSC step size, reset control, and various TX lane configuration
parameters including emphasis levels and driver enable settings.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 4d31637f1dce..b2ffc20e8f6a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1494,10 +1494,10 @@ static const struct qmp_phy_init_tbl qmp_v6_n4_dp_serdes_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x02),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CP_CTRL_MODE0, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_RCTRL_MODE1, 0x10),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE0, 0x36),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORECLK_DIV_MODE0, 0x0a),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START1_MODE0, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
@@ -1512,12 +1512,13 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_BUF_ENABLE, 0x06),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_IVCO, 0x07),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_RESETSM_CNTRL, 0x20),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP_EN, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_CTRL, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_MAP, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_SELECT, 0x30),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORE_CLK_EN, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_CONFIG_1, 0x56),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_CONFIG_1, 0x16),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SVS_MODE_CLK_SEL, 0x15),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MODE_CONTD1, 0x24),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DCC_CAL_1, 0x40),
@@ -1553,26 +1554,26 @@ static const struct qmp_phy_init_tbl qmp_v6_n4_dp_tx_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl qmp_v8_n3p_dp_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TRANSMITTER_EN_CTRL, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TRANSMITTER_EN_CTRL, 0x1a),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_VMODE_CTRL1, 0x40),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_ANA_INTERFACE_SELECT1, 0x07),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_ANA_INTERFACE_SELECT2, 0x18),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_PCS_INTERFACE_SELECT1, 0x50),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_1, 0x0d),
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CLKBUF_ENABLE, 0x07),
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CLKBUF_ENABLE, 0x87),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL, 0x0f),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX_LVL_UPDATE_CTRL, 0x0f),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TRAN_DRVR_EMP_EN, 0x5f),
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_EMP_POST1_LVL, 0x20),
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_EMP_POST1_LVL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_EMP_POST1_LVL, 0x2b),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_EMP_POST1_LVL, 0x2b),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_PRE1_EMPH, 0x20),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_PRE1_EMPH, 0x20),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_DRV_LVL, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_DRV_LVL, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_HIGHZ_DRVR_EN, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_HIGHZ_DRVR_EN, 0x3f),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_2, 0x50),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_3, 0x51),
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX_DCC_ANA_CTRL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX_DCC_ANA_CTRL2, 0x0c),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_RESTRIM_CAL_CTRL, 0x20),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_RESTRIM_CAL_CTRL, 0x02),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_RESTRIM_POST_CAL_OFFSET, 0x10),

-- 
2.34.1

