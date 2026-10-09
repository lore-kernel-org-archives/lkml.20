Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB1F3BB100
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 04:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791521426; cv=none; b=uJc1O17o3ioC8TleH6szPYdL6HbUwixmoJBCtjexuxirafR/0rHOfRejD02biJ09jm0/iEJSo4eMshxIbmrlnjrKH+Z9EXcOxP9Sg7OqkWHVPVmXiHUjPUDPyERcLJkgqPN2dS/s58IJeUKFp/ltoitRlvGQnLsAv82eKmCFQJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791521426; c=relaxed/simple;
	bh=92VTVmAvn8Sh2d75pZt6uBGpbDl9iktIEZpbxFFjG80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X7UzFqIofcJuu1d6QyLGYqGOFextlWakut4mifg83H6dEdRgLXIye/Lw1BGT68/0gNM44Ekw44CDUhv5t/o3Fl+qyYDmVSoig4IY4UMRsyw3ewKzLi8sH3XENg2r7gEukGnd8dyE2IM+m9ajB86OyeE8PPmU2/dA7/GklNrvpIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oooiH0Qx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HOhku67G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oooiH0Qx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HOhku67G"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HHbX3768846
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 04:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODm3ReSMTjl5zs5x3r6cW6xoGkQHodrD37gUV4aLrvc=; b=oooiH0QxKJZtiK0C
	AGEsEK4pdCbyUiLhkA3p579fFTbVS15vE6Uac49vdC0k12/dn+hnv9odJCn+9NL2
	A248km72dw/SB++Khz0M10W2QovFnMB72L1l1ZEmu1MNlINjNTgrTehhIOgn1wvq
	hWUQ2UFm79TOq5CJZa751zig9K+OX8hOjUponhjxX2wS4gzfpeJY4iBW5AB3F3Lw
	Zx56UP9G+Zu3JUSZhYYmlTmkmLpGHlpBjP9ThOAPBlGUOAc+UpiWw5F2Z4C+Stlb
	18PUgdcKhEv45OaGmz7uMlXkqf12jSL0r0JACMqhDEQDQ3Bb7YZdBy49+3Ln9/0n
	s2ralg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu1wn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:50:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so11465187eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 21:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791521423; x=1792126223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ODm3ReSMTjl5zs5x3r6cW6xoGkQHodrD37gUV4aLrvc=;
        b=HOhku67GdqZq+9sKutcLMtlvtAgl+H5oxAoFo6rUqsrkN5dNzMm+2YCXXNbXdu8yC7
         i8hw4bItxM4iuQBZxO0OcG1pYDptPX2Ob+K4/Yhge3R2b/Tp8c0M7/Nr9a2mxZrMc3q1
         EF4YSOWbCCHvQfvyHl8NlDqLQ5J1NSYyWf95f9FxVPPc/N4LKstaJuKTe6EkTjdvuxWG
         vppJPNFW6Ml1HPANfVvbn/odwTgQM2uF12BG21IwPD21zAt3dEvJC5htJS/6ghlzpESx
         b+FUWvyrIqszR0nPttwU/RAsW23pUn3gttXt6u/6z5ZRD49a/JrBuHVwZ+dLOAmUCE8x
         gJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791521423; x=1792126223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ODm3ReSMTjl5zs5x3r6cW6xoGkQHodrD37gUV4aLrvc=;
        b=DhvMgu9ydakgLezaRNwXL1E4ccjm/+N0t90zUfZszzTsn0NHziGZNWX/e97kTzOONu
         a/h05t03/FdmBy04gQ2KAhtGozExqlqxMkBnotRC87fHoJFkAXCVgmRBcydgq/LIcgNf
         YIeH+g3gWHzacSjIQKmkZW/XJ/o1vdu1zk60Eqbzvw+k7TkhuRyAhyBqMmqldqrsRBOL
         lJ0TX8hY+BYMQ6w2JQY73ELvnK7Xdk3Ob4VRUB/hjBYaKPQohc2OL2w+PLLXefIOXLEn
         YfBzPcbfWhd9gT8pRbmaXIXfIMmKr66ObRTv0gR8Yi4dHWnKIwPA0jk2SS84ohiz1cXH
         T3og==
X-Forwarded-Encrypted: i=1; AKwUvBwSpE2WxjQBRX/fP+GsUhnrYkgMnEXFjWDMqZmu5HRxRXB0S+OUFrZu7EbkkBQ1W84IaZ05t6uAKjT9GP8=@vger.kernel.org
X-Gm-Message-State: AFuF++mjVkKxELTWC1sS+Vk9vFDnDzngCHELx3JoL30a607btT05KsyK
	oipM7TrAajI5YV9v3NftX07PrVUdPf9WiNvMEC4SezM1usy0so5dySNovUYMWH+tD7VvSE3sHZZ
	IggKNsNfo2z8+t4EZyUK4uXAI6KXFkKTLzfwHyTJPYt+tLbQWPBB2rxxtD6YMZlbOYRs=
X-Gm-Gg: AYBFou3qQr4mVbcT0Xwt9v1QAub8uSAMCcDz86ca5IRoT2lM7lAZBpq2SY7mnSpO8JW
	nQzemdm1D6SgS2nsPUb6Vs4Z887knfVlJsoDqdFNaeOkrTeHeZTjcv0G/5coLrpxPfr1PVVS3ak
	8nMJDQPzIb6q9+JSGIa+cn76vob+JjIPCjLbCB+GtjRegIpVwYdVGAz7dsn4QgoGwVcFnbR8xC/
	1P9oacaNUHChAkWr/lZJw8IT1q8jTBM8OugUHWTQQ3fOWutu1Jxas9qzBDbmIEU023Z53rD13ko
	7VkA2WppyEqeeM+H191z1HJbtNqpLSFyCzfllvODuu6ycdstQsVYB4WiSMUjQ41cXso762qHMFh
	gkRW4MxItdNAUFvAuxe42ElAs3zPFYwld2EgC0bSTxSzjTOwpICevKK3al4LEORDphw1tp5CaAI
	PfLpNQ0nH5V4cUC4GmTXopnIfFh1If9w==
X-Received: by 2002:a05:7022:b0d4:b0:14c:1f57:3ea9 with SMTP id a92af1059eb24-16a5f8bc13bmr1067272c88.26.1791521423104;
        Thu, 08 Oct 2026 21:50:23 -0700 (PDT)
X-Received: by 2002:a05:7022:b0d4:b0:14c:1f57:3ea9 with SMTP id a92af1059eb24-16a5f8bc13bmr1067233c88.26.1791521422492;
        Thu, 08 Oct 2026 21:50:22 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm4151609c88.16.2026.10.08.21.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 21:50:22 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 10:19:57 +0530
Subject: [PATCH v6 3/6] phy: qcom: qmp-usb: Add IPQ9650 USB3 PHY
 configuration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-phy-v6-3-50408e45bcc1@oss.qualcomm.com>
References: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
In-Reply-To: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfX6Qlt8LlIv57O
 MVUeNCuPdwz9C8ido4JHQPK2F4hGgRtS8bAm/yetDcbSbghHWPlJZ+aeF8K2tTKr+ilbABtohSz
 tAywPWe08DTwJ1ggjw6z61nN7xYI3505Sm7r6+5IwJyO6Lys0JdM8B/AeiH0zZGsoqDPQdmd1xA
 NYXkEhoH6xbnA9MMkab1K9h4yMnX+Mk5yBYy5kHSKzUJ5c89F1IOuhbeGh/unEXqHpquDn5ZMx1
 BdTXowI4NV/JoMKhzw8U3/cIpw0a4f0uA+bMvxDpSj87ZI6dHJ0Y4ADgnI+2r32XJ6g7Indnojk
 3TKbVXPOa/XX/Ut8SUh6GMScLSdzWohYxMicbG1hbduUMRwnVLdM1Ltg3/4g9XA1GDgPV3XIciO
 NUHBrmOwvvHEbg6GKu1n9mSkOIooIlWfhKDtJQYZbZBMeGQ5CpTT7KnwScyNeSHA3CBeFNBWs9l
 QDpcsEykK/fCS/12z4A==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac87290 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1pfUWIqQpZhN5ooAS-4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: MyjzjYXyIefgjxfBbOgkl7IyAhsh34HR
X-Proofpoint-ORIG-GUID: MyjzjYXyIefgjxfBbOgkl7IyAhsh34HR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfX8eOY8YmZhsDy
 dxjzAlnBl0JEHsmffn4Hs726FmxqF2k7G+Nw2MN4f6hCClGFN8K/2uLNx1cOzS/nNc8coBYdGFY
 mk+V6oK+wbG6RlIXdC5NE9aHHBhZeNk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090019

Add the USB3 QMP PHY configuration for IPQ9650, including the SoC-specific
init tables and compatible data.

IPQ9650 uses settings that do not match any existing supported SoC, so add
a dedicated configuration to allow the driver to support it.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 118 ++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 6a9faa0ce3bb..85f7ccdddcc9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -400,6 +400,101 @@ static const struct qmp_phy_init_tbl ipq8074_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V0, 0x0f),
 };
 
+static const struct qmp_phy_init_tbl ipq9650_usb3_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER1, 0x7d),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER2, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE1_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE2_MODE0, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_BUF_ENABLE, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CMN_IPTRIM, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BG_TIMER, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0xd4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x68),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE0, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE1_MODE0, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xa2),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_HSCLK_SEL, 0x01),
+};
+
+static const struct qmp_phy_init_tbl ipq9650_usb3_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0xb5),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PI_QEC_CTRL, 0x00),
+};
+
+static const struct qmp_phy_init_tbl ipq9650_usb3_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FO_GAIN, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN1, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN2, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL1, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL2, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_GM_CAL, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x47),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0xe4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0x64),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0xf6),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x89),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0x35),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_EN_TIMER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DCC_CTRL1, 0x0c),
+};
+
+static const struct qmp_phy_init_tbl ipq9650_usb3_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RATE_SLEW_CNTRL1, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG1, 0xd0),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG2, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG3, 0x20),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG6, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x21),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xaa),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCS_TX_RX_CONFIG, 0x0c),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_FLL_CNTRL2, 0x83),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_FLL_CNTRL1, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_FLL_CNT_VAL_L, 0x09),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_FLL_CNT_VAL_H_TOL, 0xa2),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_FLL_MAN_CODE, 0x40),
+};
+
+static const struct qmp_phy_init_tbl ipq9650_usb3_pcs_usb_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
+};
+
 static const struct qmp_phy_init_tbl msm8996_usb3_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SYSCLK_EN_SEL, 0x14),
 	QMP_PHY_INIT_CFG(QSERDES_V2_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
@@ -1572,6 +1667,26 @@ static const struct qmp_phy_cfg ipq9574_usb3phy_cfg = {
 	.regs			= qmp_v3_usb3phy_regs_layout,
 };
 
+static const struct qmp_phy_cfg ipq9650_usb3phy_cfg = {
+	.offsets		= &qmp_usb_offsets_v4,
+
+	.serdes_tbl		= ipq9650_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(ipq9650_usb3_serdes_tbl),
+	.tx_tbl			= ipq9650_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(ipq9650_usb3_tx_tbl),
+	.rx_tbl			= ipq9650_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(ipq9650_usb3_rx_tbl),
+	.pcs_tbl		= ipq9650_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(ipq9650_usb3_pcs_tbl),
+	.pcs_usb_tbl		= ipq9650_usb3_pcs_usb_tbl,
+	.pcs_usb_tbl_num	= ARRAY_SIZE(ipq9650_usb3_pcs_usb_tbl),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= qmp_v4_usb3phy_regs_layout,
+
+	.has_pwrdn_delay	= true,
+};
+
 static const struct qmp_phy_cfg msm8996_usb3phy_cfg = {
 	.offsets		= &qmp_usb_offsets_v3_msm8996,
 
@@ -2459,6 +2574,9 @@ static const struct of_device_id qmp_usb_of_match_table[] = {
 	}, {
 		.compatible = "qcom,ipq9574-qmp-usb3-phy",
 		.data = &ipq9574_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,ipq9650-qmp-usb3-phy",
+		.data = &ipq9650_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,msm8996-qmp-usb3-phy",
 		.data = &msm8996_usb3phy_cfg,

-- 
2.34.1

