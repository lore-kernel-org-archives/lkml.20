Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DF44825C6
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847308; cv=none; b=nB6cXtovk7ibKQJBSpls6fHmWb/Qs0fcSYvICKQYNjRrmKZI7oUvNGpTXpBv0LqZQcfAKEYkubP32sQf4JqJY0B++bnSre1Q6Rd+kZ0pzA/LFLRZVjgwkW4m5l9fl8RrzYjfJvAgSX8mkUmK+8Xmq/1INnEasmZekXn+2vQPMOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847308; c=relaxed/simple;
	bh=h/+sJfDiBYg5OvAZvhoNhwy+BfP03TAeIGiQHhSSG+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lzXTEyBPfOu/pUrfXPz6s8kbjKx4t+U3Ub+mwBSTVEEobiKtTdqvm5wCqFak51xuqm0HNeXL7jb+EpQhm4P1texye4xGbDKPt4Hk8bhJkd1PS/3XMRsifFbdjdWdIaI2QpDyFFHz6JJw/Bx0D+FmSskXmXnrR/U4lyszCGd9PEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jIYqJG8a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jhCjnArU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jIYqJG8a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jhCjnArU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xgtb2337560
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 09:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UUiTCbGa4/o7uTuYtC8HM1UaA+Bob73fzlka+64F/24=; b=jIYqJG8aN86BS/4H
	2z7TFy2kIWe85K35HFO5izQXlOeN2AALfzag9CKZD/gMCVRD5tH8GUjR6EIKfgLz
	mmaOd5w81bfxVOfE3GcGALcF0XIBD42by6b8iOLnm0ZlsZX6tLn6/oIomsuirYbo
	eKfJKzgEY5ehf84JYeRaF6YgnULCcgfTXjATyjIg715pTWVwwRiZslveadbAkNex
	94TSK/AXnkUqRvcXYfILMWA/dOtdSxnePytbO9n3VuiOPk0krA5MArRBEd+Qy4ws
	PQ8z9b0IUH+UiSx+lBg5iamZFQW3beWxVwtVcHQ60vb/LqyNlNHv7P3j07s7Zn97
	9yyXDw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h14n2439x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:35:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so4579029a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790847305; x=1791452105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUiTCbGa4/o7uTuYtC8HM1UaA+Bob73fzlka+64F/24=;
        b=jhCjnArUkfH/yZjHNT5ZxixjNuMFi3YBe4p3n4m8jieFE/Z1A+89vAmwfXpNsLA5Tu
         mFx3Ur8YkNbjuHnpn21PQGR+O6dm8xf4YDZ4aWh5LwmLrjwV8cYRA6pRRpzeBRVYpd9R
         DX/VDo4RMJfi5caSNtoZBnwNuUExYdahTx/XAxUrQD0QU2a280iA8W8yl8abP9vhzWqF
         za1KU8+0EJGWrJapETFF2ucPYbTHwS1x9ZteBpp+YTVQ+N5mnyunCsBv47uvtChMC8lb
         rAFc56utkVlBVTAJWbpxOiObzw166d7nowJk0UC8kJKyvZdx33pD+SdI6/v/A/cRFw6k
         Cp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847305; x=1791452105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUiTCbGa4/o7uTuYtC8HM1UaA+Bob73fzlka+64F/24=;
        b=qc1iROXZOLPFtFryoqan+0C+l01FsxN1AVDFgjUlUjejXwt/1BywsYPwq7cyrWlNB2
         rrrExqZF714GRDXtg5x5fEtyDVRfPKvwu41nvlckiEfhhsLcErY3NfYl2e4mnPb52HW0
         nNyx/fNO9HEXcVpZw8HAyFPt3nGKaWBtVgm4bY3SeLMdh1DA6u2E3EJolCKx9YjB1wB1
         U4F9bvOUilGjYKW3Z7B2TcMUErOlsDsNJ7tU6bZX4m+zJGNZG4I9ILEwvfEP58D+f6nb
         KlfyDVdY5tuVk3Yv/cOvE2ItJbfmWaS8HrOgSjR3iDlWfzhfEI7xUlLsOKj+0a6fJMyg
         T1TA==
X-Forwarded-Encrypted: i=1; AKwUvBxLf9uei7GUxoDKSpK5pCa8eKqlZ8thbqennj8LuEQRlyKtpm9g56Vg8CFWwfAv1UgEWwmoAvKNoERJLi8=@vger.kernel.org
X-Gm-Message-State: AFuF++kw3fdObOYX0DAYSRPcH2ZnUkwquzazSexiVuz/1VeeIlsUeXRV
	jvyrAtsPX654Pht32zMB1MzVW4jYGTKATIxqzCvPqJiWRpxbKW41RTnj11EdxdRse0UyP7hYlid
	un/X501sPHns/6UZ5Xl/5htDbaeGNXAIRdYpEz80SDnvAfOndrna2gpVvMCwFAwhEBec=
X-Gm-Gg: AYBFou05sFe6IND7OTO/2RQnCUIO/WVg66p39e6CS+4Aav+XWmJFgISM3Kfvegf1ZQK
	ERCR2Z7q3IgkXitlR9cgpV+vrf/oyQ+bchvd3lqpKnmz2claqdLP2tGy0eZZi//UKFdzsABRyIr
	jmnKrmKCYWDaAG0+kA0o2OYEVjwYv8jfnufWdbaSRkxXtOV/qj+YMO9TdtDAboQywREaKQX3i3w
	LZquU56XzBgaFpaHfNiF8f6kpBwjzVjE47AvOYg8lIrumd80jCBPt1mMe7J9NSvK4AudWeJToz0
	pRKp/JSJs40C/DNse0kC61wKuzBdfoDmWbeSp9VULbeH6ovjwd0AEVbRlJYURvVS+ZKLq0zM4r/
	lnr2BjyxDvOUnq72h97KnNHGzYcc=
X-Received: by 2002:a05:6a21:1f8d:b0:3dd:a196:9076 with SMTP id adf61e73a8af0-3de9e870be8mr4590620637.64.1790847304717;
        Thu, 01 Oct 2026 02:35:04 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f8d:b0:3dd:a196:9076 with SMTP id adf61e73a8af0-3de9e870be8mr4590593637.64.1790847304166;
        Thu, 01 Oct 2026 02:35:04 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e54bf4c4sm1152944a12.29.2026.10.01.02.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:35:03 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 15:04:19 +0530
Subject: [PATCH v5 02/11] phy: qualcomm: qmp-combo: Update DP PHY common
 init tables
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-glymur-phy-v3-v5-2-3848c2615d5a@oss.qualcomm.com>
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
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790847286; l=4909;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=YlcdYvbpQO/rrkRq9CEqoTuD4BXSpKJcWXMyS8GFMlQ=;
 b=yVHbDaiVaBkBOM9VAzuVym5lu5pkSH+p08plNEHSXeE2kxCdwCZMpJlFLiubmy7DLM2fS7N8e
 0XNR0I7WBcGBe/VTQasbgmrAlZTTwDp5klr2RLmd9IDCSljzn6Nmg3h
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6abe2949 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Whk6PM20rIcDluf30OkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX2GNiZCbHA9Qk
 48vEKejyz7NGapldovXesS8Cbklndr8hl0DJ9/T2/cGoySIWJFqcygvhabEt25OXQHzO7Kba9yL
 58MuvVP1Gbz5H6uKQT+nO6zSeih6K7M=
X-Proofpoint-GUID: srHAXGnLW_Ix_l4LXY0bC8EeciGN2fX3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX+icX6VMunZr3
 aYGOEZ3E/5kDkhy5MjImCchTF6hpJtmRxB6QUPWktJVV6FTtXCIpGYQGPGIF73al/ulQdeF/sjm
 XV400EbHrKrSTIu5FkdEmgZkf1qx2S79WM1qBrfXcTCXYzVAHGyOWPK6yTr5gikEUpnpFu6JVrG
 9KBz21+WolFwd9epZ4JaeJXQxiUQkzqkP15wgDWNwTdIBXjyzL+qAox+QVz2b7rJ6RsMU5ru0T4
 aUr8DxvX5sCALx/LKMgIfHRLrXn2fbyIm0cgbXTVb/H1V26sLkaOyvuHRjOMEeBYzKxKmdqDswz
 u28HTxpSLpBp3JEteRAJ6wYNqQe216NLYsADWEgLV/ZKt/OQP/6+83q/tbV7AyQ6CJMmK+LkIGv
 OnTiXBVsSYDzVEGjCK83C6khtFrzwYNDEeKaU25crCB61v/dEeMqx1MG97f+HglVNuRAeKhWE9F
 55yxEDFu2DhnJBDTyMQ==
X-Proofpoint-ORIG-GUID: srHAXGnLW_Ix_l4LXY0bC8EeciGN2fX3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010038

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Update common DP PHY serdes and TX initialization tables with
corrected PLL control values (MODE0 instead of MODE1), updated
SSC step size, reset control, and various TX lane configuration
parameters including emphasis levels and driver enable settings.

Fixes: d10736db98d25 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index dc9c30737ac9..8ae8b4e531bc 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1502,10 +1502,10 @@ static const struct qmp_phy_init_tbl qmp_v6_n4_dp_serdes_tbl[] = {
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
@@ -1520,12 +1520,13 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl[] = {
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
@@ -1561,26 +1562,26 @@ static const struct qmp_phy_init_tbl qmp_v6_n4_dp_tx_tbl[] = {
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

