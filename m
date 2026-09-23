Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749F51E32D6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121894; cv=none; b=tV2LKLLU8BTCnXSpLs3MNZv2usk322QJ4kM+NlvDKgC+Dvg31dZlpYBy7ZA9OrlRNh056OpXFy8UXijsqvZXfoVNBOiy3fmAGfFG0J4oxkgfACEbmAFYK5NXhaucUcEVO8PpNh+FOiJ8wRJFghXsCq2OCg5s4QCXvupqAn1wDXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121894; c=relaxed/simple;
	bh=pU4CKl40m2UEFuu7WP4zaSdVKJzbzXCSIogmQHSKiws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EEDYnccl3E6us/YAQ2hTcPlj/Ke3266i6KUmV/bUWTiyAnVNQcTQWb6DBneuO/RzHLlGrZRW1z4pj1DCD8UKZss6KWHMSFChli7Ne3UKyx56bXz+u4G0kmO6Ciqkvs2mbD1INxjQQCwmCIxlf7oeqm5Q8BgDSsaalvD/7y55rj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DWia/S/w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EbDuQlul; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWia/S/w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EbDuQlul"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJBkVi3897620
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OVq5tVWSaGDb3I6gDYM8bMcigKKIv7rHibjvQmrEVEk=; b=DWia/S/wDUnMgfJp
	jkxpO2pNrbFw405gXM4e1m0MLyvJuPgiM8PZ15iL1z1UZbA4uc15WJp92mNxqREy
	S8LtrnKDyTCDFVh068rJ+SVxZxH4syVRC4SfeBHZUeMxNlAHsMFOCAcblQPd7RLw
	JO2Y58QkuFRxYrzocjgf6w7ICrHerNLdecck2ak+5PXZ390ol5Yg7uxzQ18d107+
	IkWhg5UNTx7Xmz6bLbMTvbDa6MgOsqjMCc20oY5T59zcHp7yW4rQNrAnduBwNtHQ
	yAeBClOHgcc1jnWKY4m6REz596TtdT4E+dzvrja8bgaLgFuess3VwXOPUGjSci9d
	1IPhyg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma153g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:04:49 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1437272611eso528744c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790121888; x=1790726688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVq5tVWSaGDb3I6gDYM8bMcigKKIv7rHibjvQmrEVEk=;
        b=EbDuQlulKpXFrC3gc/NROEX/SjIdiRq3ow4Wc/ttCfgYljjRc4dNGsbjI+ZNN2o6G6
         MSUZak7xQSRq2Eu/HjkxyZOAss/CsW9Cly5ztIJnsfAX2gMT0w72/DFlX/HCrZ7YWzVX
         o3j8Mmtp0Has4sET8xE+XSZpMhWB43nC3LflsZvRhx5V39ZN6u8WuR+rD7JSLIfttb0u
         tHH1PFdcF0TAonH7UyWsP9HWxvQWeBmBDHAEklg4nUeVuBj7q0H0RUUAFEf4D4bckthu
         IEpd0j33cwqTQv+PRcsziXcy8cBUHuFLzsV7mmtCtCmtPnIALn/lFNwA4wsv+NXZpIo/
         kcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121888; x=1790726688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OVq5tVWSaGDb3I6gDYM8bMcigKKIv7rHibjvQmrEVEk=;
        b=luyMnl4beopDCPJKhdmvMGnRe3Sy4dHvvtHirVIzr53hXY2041u61cX1Yj8uj0Ex9/
         9DCahEp8KvhCTn7XvQ5elib9Q955XRg2qFMXM+ySzcvu9n3RF1aQEnsUuFQB2mUgbQl9
         +/1uZIVMrwAldHhAeDXc9deWssVrMU0O+N963/A4gn7Wi9vtrROV8OD4KGwIk0wffP0+
         ag/PZ0VWNGLfrQIcDXdo1Hgjzepo6Qf3gK2pF4b8ZJd9qT39EeQEz/6bsAudbbTjEiSb
         qqpIeemLzIlSZac5r1K2agBFt2ioCEbldLqOMIBftPWaxCkgtTCmiAIbZBOJrcaPjXK2
         /IEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLSsaXWqJCDVbujNevoLuBfCmAim4jdTPKwN/iCt0/OYBE/3BPt3QB2GwYToFfKdBQMrM0c1/rzGZN2Dw=@vger.kernel.org
X-Gm-Message-State: AFuF++n8GlUZIoB3u/kL67pYdIsJrdRDKpDZQQXs/Njtum/6NHSZxY4H
	B1UxOn+CLDTaqXL+NyMAI2JD8VQ2X4IM20qwexKbQPqkEaiJ2GToNws2vGdju1kE7sANGEOlSMF
	jMc5cKz6OSyP4Wz1prKyJZ8g6RJS0G5RUAhYmNNnGJPlaJ5oOMyA7Vh1cKKvnCgHSAWc=
X-Gm-Gg: AYBFou1ILDVtc/C/BXowR3aCpXt6sPHxq9wCK+sFA3N7U+6Ghxa2tznI7/3Nzc0h2Nx
	IkTsFju8u9S7R2bPjMxWfSxEs5KcEZVQ7VdFK5q5hOLcpZwEqR+b85zWDSSBMDWdAZJmCf9c4IG
	/AixuG8SzWRCooO/fxXAfJcc0oATGc+HSv6qUMxHz2VCY8QKEtyICd/Do4aXEWOPVFw33EIpdZj
	4bAIR+XZdS2EQ4rzV2Va0aoTkdOTlyqBgqXaRoWEua3rVw3iZMj49lDaRYdwETXnu/emxw+Bxj6
	cceAlHPozXEdM7a7Ddy69pbVSHaPfDbOlbsFNFrvpeCgdtqLpgvsirVBCebWfQBP6YAROw6j0nQ
	bmg0SC5p1bqW8N6Tqjy/uaziKYwRM
X-Received: by 2002:a05:701b:4185:10b0:143:298e:459f with SMTP id a92af1059eb24-144f916a927mr1166973c88.42.1790121888118;
        Tue, 22 Sep 2026 17:04:48 -0700 (PDT)
X-Received: by 2002:a05:701b:4185:10b0:143:298e:459f with SMTP id a92af1059eb24-144f916a927mr1166934c88.42.1790121887543;
        Tue, 22 Sep 2026 17:04:47 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fd955sm1688347eec.1.2026.09.22.17.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 17:04:47 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 05:34:18 +0530
Subject: [PATCH 2/3] phy: qcom: sgmii-eth: prepare for additional PHY modes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-nord_ethernet_serdes-v1-2-f8ac1c487882@oss.qualcomm.com>
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
In-Reply-To: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790121872; l=5141;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=pU4CKl40m2UEFuu7WP4zaSdVKJzbzXCSIogmQHSKiws=;
 b=e5w/ijuhu5rOqf/c++BwgYR9xCb2yyNNxSaZPVchajLFjhCQ8DQ5HPhC9HUijKp1AERqEKOwU
 kN3+ZKtTJqeD4ZLOP6MPw2a+XS3zUc3lTrYhgUpa8yEK3uY7g6SpKAs
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: F6OPmQue9hi_WTQSi8HUbufZ-0bnb67d
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwMCBTYWx0ZWRfX3OZM+qS4403A
 kJtmCzD4KLRB+6cksn0FF7eZLbK4hWIFmPRLf27wvAAOyfyAXsuLGmcgimGlJ5znaAsL7qcLMeI
 0HxmII8U9YR3RiZM+oMkaYF/WHOoWgQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwMCBTYWx0ZWRfXzvqMS9PJLIlz
 jqJIGnfF9pMK09qEHK6K8dzdzEDdlbLMu4tMZpvwLFUkWS9AP5GPa5hAjcNEGLA/fsiq/j84agE
 koFCmsjCk/Wuf8kWKW7xKgAOksAISq9c8h2B0mYL1aJeBaO12Gd/0lwX1rY1/4F3CmyyAcG8kde
 Ic6iuld8mYJF7J+zLaKD14a2aR9SYk/89879FhQkiWmZD51eDS3RmUq5NnKc0zm7Ey4pjhmiB7N
 p0eRBKUqDRC6pwmvHsU5080zjUdZEcwCjdtFhu93IB1cfhu6bQqdjJ0RIYqLOuw2DwFkpbemPxb
 M/fZPvPIhKjD6OkfqeqvgmLAITTdVf3bboRVupCJJEoTb/58YjX8Uj6xVH6npuVzM6DP0gkJJt3
 WsFZ7unuYeTAz8kYgjbe74AYc2n68Wb9KWPwTW2Z1uOYfC7T/y9RhOohI61OVa895AG03eWTM6i
 3O4T62QyvL31SdFlhTQ==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab317a1 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jlbHTTSnYauNfDin9pkA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: F6OPmQue9hi_WTQSi8HUbufZ-0bnb67d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230000

Prepare the SGMII Ethernet PHY driver for PHY modes that require a
different SerDes programming sequence. Move the SGMII readiness checks
into a helper so additional modes can provide their own status checks,
and select the initial interface mode through per-compatible match data
rather than hardcoding SGMII during probe.

This does not change existing SA8775P behavior.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c | 70 ++++++++++++++++++++-----------
 1 file changed, 46 insertions(+), 24 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
index 7137200c3f310a4d2642bb9bdbe3adb7589b2241..029dafacee7853648ef24afd0d9c4b83a549badf 100644
--- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
@@ -41,6 +41,10 @@ struct qcom_dwmac_sgmii_phy_data {
 	phy_interface_t interface;
 };
 
+struct qcom_dwmac_sgmii_phy_match_data {
+	phy_interface_t default_interface;
+};
+
 static void qcom_dwmac_sgmii_phy_init_1g(struct regmap *regmap)
 {
 	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SW_RESET, 0x01);
@@ -227,47 +231,31 @@ qcom_dwmac_sgmii_phy_poll_status(struct regmap *regmap, unsigned int reg,
 					val & bit, 1500, 750000);
 }
 
-static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
+static int qcom_dwmac_sgmii_phy_poll_sgmii_ready(struct device *dev,
+						  struct regmap *regmap)
 {
-	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
-	struct device *dev = phy->dev.parent;
-
-	switch (data->interface) {
-	case PHY_INTERFACE_MODE_SGMII:
-	case PHY_INTERFACE_MODE_1000BASEX:
-		/* 1.25Gbps mode */
-		qcom_dwmac_sgmii_phy_init_1g(data->regmap);
-		break;
-	case PHY_INTERFACE_MODE_2500BASEX:
-		/* 3.125Gbps mode */
-		qcom_dwmac_sgmii_phy_init_2p5g(data->regmap);
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	if (qcom_dwmac_sgmii_phy_poll_status(data->regmap,
+	if (qcom_dwmac_sgmii_phy_poll_status(regmap,
 					     QSERDES_QMP_PLL + QSERDES_V5_COM_C_READY_STATUS,
 					     QSERDES_COM_C_READY)) {
 		dev_err(dev, "QSERDES_COM_C_READY_STATUS timed-out");
 		return -ETIMEDOUT;
 	}
 
-	if (qcom_dwmac_sgmii_phy_poll_status(data->regmap,
+	if (qcom_dwmac_sgmii_phy_poll_status(regmap,
 					     QSERDES_PCS + QPHY_PCS_PCS_READY_STATUS,
 					     QSERDES_PCS_READY)) {
 		dev_err(dev, "PCS_READY timed-out");
 		return -ETIMEDOUT;
 	}
 
-	if (qcom_dwmac_sgmii_phy_poll_status(data->regmap,
+	if (qcom_dwmac_sgmii_phy_poll_status(regmap,
 					     QSERDES_PCS + QPHY_PCS_PCS_READY_STATUS,
 					     QSERDES_PCS_SGMIIPHY_READY)) {
 		dev_err(dev, "SGMIIPHY_READY timed-out");
 		return -ETIMEDOUT;
 	}
 
-	if (qcom_dwmac_sgmii_phy_poll_status(data->regmap,
+	if (qcom_dwmac_sgmii_phy_poll_status(regmap,
 					     QSERDES_QMP_PLL + QSERDES_V5_COM_CMN_STATUS,
 					     QSERDES_COM_C_PLL_LOCKED)) {
 		dev_err(dev, "PLL Lock Status timed-out");
@@ -277,6 +265,28 @@ static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
 	return 0;
 }
 
+static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
+{
+	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
+	struct device *dev = phy->dev.parent;
+
+	switch (data->interface) {
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_1000BASEX:
+		/* 1.25Gbps mode */
+		qcom_dwmac_sgmii_phy_init_1g(data->regmap);
+		break;
+	case PHY_INTERFACE_MODE_2500BASEX:
+		/* 3.125Gbps mode */
+		qcom_dwmac_sgmii_phy_init_2p5g(data->regmap);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return qcom_dwmac_sgmii_phy_poll_sgmii_ready(dev, data->regmap);
+}
+
 static int qcom_dwmac_sgmii_phy_power_on(struct phy *phy)
 {
 	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
@@ -374,6 +384,7 @@ static const struct regmap_config qcom_dwmac_sgmii_phy_regmap_cfg = {
 
 static int qcom_dwmac_sgmii_phy_probe(struct platform_device *pdev)
 {
+	const struct qcom_dwmac_sgmii_phy_match_data *match_data;
 	struct qcom_dwmac_sgmii_phy_data *data;
 	struct device *dev = &pdev->dev;
 	struct phy_provider *provider;
@@ -385,7 +396,11 @@ static int qcom_dwmac_sgmii_phy_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
-	data->interface = PHY_INTERFACE_MODE_SGMII;
+	match_data = device_get_match_data(dev);
+	if (!match_data)
+		return -EINVAL;
+
+	data->interface = match_data->default_interface;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -419,8 +434,15 @@ static int qcom_dwmac_sgmii_phy_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct qcom_dwmac_sgmii_phy_match_data sa8775p_match_data = {
+	.default_interface = PHY_INTERFACE_MODE_SGMII,
+};
+
 static const struct of_device_id qcom_dwmac_sgmii_phy_of_match[] = {
-	{ .compatible = "qcom,sa8775p-dwmac-sgmii-phy" },
+	{
+		.compatible = "qcom,sa8775p-dwmac-sgmii-phy",
+		.data = &sa8775p_match_data,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, qcom_dwmac_sgmii_phy_of_match);

-- 
2.34.1

