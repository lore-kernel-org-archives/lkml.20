Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8984A3659EB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788242705; cv=none; b=OuKor+Det1YnEW+mRdD/Oydcuw8um8TcMqOKAPD66ymVqVWrbis/LOy34BLtOk1p9/gOg9PnBzMS0UGPZeU4hr9Ovac6UoMvIJM/IuxMfj/5YFkByRBhlKcrjXRMUmtRbYDMRV3gG0RRJ3gBD/LB6xQJsWzkASGNAyAgcQNakwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788242705; c=relaxed/simple;
	bh=7ILArANYD5gi/Ol8mfS5svPlqqomUyThtypHtKuxdS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fej3o6kinFNK9sqmnjz1O3xDQbRvK8thc7A3Wp4zCdmClq1nO/3OOvxQq0WUV52r3mgfVb4omv0qwGJSD5qfPJae82NXGRgn8B29ef4WAgxifogyzU6No4bxQjVwJf1zwxt/2Z3A7/ipCQZmfbRFvVBB5ZFWHQvGShJYEzpe/c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nsbEAiqq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FOxDZWx8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nsbEAiqq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FOxDZWx8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68143Pnl1646261
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 06:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QT+YF61f5o/fn7STVpLg6IhJeyrRCRNijTHEH9W41Es=; b=nsbEAiqqVXuzBAny
	oIS1jSrUNGCeFMtFfiEULZpt8FCIXgz5DmcwZAh4/aer9FzeHsSBPsHYnPYUmZIB
	HZDfZQls74P1yiGR2ITujH3kQCFh7IeKHr8ckZ136IYp6SIgRmSOmEVTS/IMd6Ed
	fci3p5eNjk8KrsnUyAXL1LvfwR28b4G/aZW8THVOqQGyj9Lxy+C8TvLlCAnvhrjb
	tOHGx9rZughwVt6Pbv86YwJcoG9IuoYBHA2Eds+bS6G3gvnWHXwmaWS4eJbJ5BgU
	2fUjqoF55zWN6OuZn8U8UWztelyPb6eOByUA0A6NCIsTwqKeEsw8suav8kc1Tmzj
	fP9Raw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh0cxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:05:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d55d8cd938so74475945ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788242701; x=1788847501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QT+YF61f5o/fn7STVpLg6IhJeyrRCRNijTHEH9W41Es=;
        b=FOxDZWx8Zirg6HAfa1/ViZxF1F1EqZr+G0zbya2ImUfCxO1S/PQnS7fhBKIPA05cJO
         1G7ldm/sg3Ajf4cPidJFJsGFIuoYvtx46SpVJGlvvH0nkXM3SB2awVbWbyzCh0Gj8k/T
         EN0sETPVGTVQ0a2GnCrqXu6KasB0Ml7+Df0Lh97kEp9BHmdrfDb2nplAHNz/bUPLJTPB
         M3bj6UucNjEVzds8NF2Eg5nKwC0E4nzm9w4SdHu2vUm9DRIxeuz/WDjpg08NXbkg3ctl
         2ziiuipbeHWHIZvU0Sq/y2913teaIUgYHAsYOvv3+S0qqa1mlu8BEqZ+l+7l3+BLABM/
         1vdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788242701; x=1788847501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QT+YF61f5o/fn7STVpLg6IhJeyrRCRNijTHEH9W41Es=;
        b=QcF2+ffDQk4/qmbpoiuFbx5FvkuD9A2foC9tuoAO8NeWMhQje4kyzMhrw3nU20WvaZ
         1KjtcUbetb4kC4V/+BzN6NFeusXGQk4EyFYfJTk0WJgHXqtO+ZkTZN8vp2DGaAf0nTHI
         2SspI+0zmR9rjyrqyO7rpqE0VIRStZfChJQ5cH76Ibm/AFHqPWyzc0+pb3gViEnq710F
         YRkLQzQPdcI8pPnZSmTYpQDQMrph1KEhOd9BJDyEhDPDfh5hYyF8w2DesywyMXTSeFM6
         TcM6bfkNtQy/GECPtIDwHAaNi3Gi4ByyIBa1g0W4U0fYRsBr5y+GPGnuQrNaZp2LgMLV
         a76Q==
X-Forwarded-Encrypted: i=1; AHgh+RpD/JgN+EYBRmvKZbiVgZcozvJzcLt+P9iic6O9qIl1RysVJupscwTDegTYbr6QCEec0zYd3XCvbSYMWY4=@vger.kernel.org
X-Gm-Message-State: AFuF++mNFidiJHSjCJRfjfM0WAwn8rjMhHqPmyPkaAATQNm8WlbRXCsO
	21Jl4xUibQKgmJqP8W6h1qLTs3mcM1S+GyT42H+WjNQgFr5znQN2gcVziou0lgij0Um3aK5G0Kr
	daLTBYIISVqxajymuhUiNFNp6biqpuQrQKJnMFatstGbuyY4MT8F4U+4cEGxHS0WAouY=
X-Gm-Gg: AR+sD11IslZVy4G5TlBmfKcWEaOACPEFC9B9LqeNgUpykkv35ETYDE6PiIWRXnUYnN6
	fDJV4HVsvjkYL73MQTV5wibXzb6FuCtWdQlQudffGIESHCwADRv41+cxziiH6z3ZTywpHh4b3Wg
	B7siYCJBHe3FmdD0utyxyi2O1W77TXurWX04qq1hCveOnRKBlrlr1MFiyk7nvku7aTfayS6tztS
	GA75oiiDjWXtwcRH7cwshhefNLGpQPFiTRNCp/dNnmzxTGk26ZbNR0DkgT8QuzIrghkulkj76Mq
	C49uGvb2YMCWmyIiN0pcyNN99qYDtYb4jqmyD7dNBuLQLPMJ0QfU4Mf2pVC5+93z6Kvm+oZ6JIW
	gYA8S8nVEZcqT0Cx5lLSvl7WZAWa3NtC+SI+FrCX+qcWIUPb4nJ06hqaliBmiKBi30009MLhi3l
	mTtks/oB/Ljt31/uXWNqQbENLglF6Vig==
X-Received: by 2002:a17:903:390d:b0:2d8:d4ce:7e3c with SMTP id d9443c01a7336-2d8d4ce8391mr331992265ad.17.1788242700909;
        Mon, 31 Aug 2026 23:05:00 -0700 (PDT)
X-Received: by 2002:a17:903:390d:b0:2d8:d4ce:7e3c with SMTP id d9443c01a7336-2d8d4ce8391mr331991055ad.17.1788242700145;
        Mon, 31 Aug 2026 23:05:00 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa20e2fsm35855800eec.28.2026.08.31.23.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:04:59 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:34:23 +0530
Subject: [PATCH v2 5/5] phy: qcom: snps-femto-v2: Add IPQ9650 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-phy-v2-5-cc93d2f3b1bf@oss.qualcomm.com>
References: <20260901-phy-v2-0-cc93d2f3b1bf@oss.qualcomm.com>
In-Reply-To: <20260901-phy-v2-0-cc93d2f3b1bf@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA1MiBTYWx0ZWRfX43icLiyW9S9x
 IfPEHqNQBfNPdDAgw0REf6bV0OabBstIEQx8hmDUeo8u0ORwh6vKQmZmct+o+uy+4WX0T1JpM76
 tfCtHRJ2YfXXqXSdzJeTYPWnj2zsh30=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a966b0e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Q9t0gmS3rCGuRMBXcNQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: lnpbDYmRe2lZffQUKuDnea-Nb7iAER3Q
X-Proofpoint-ORIG-GUID: lnpbDYmRe2lZffQUKuDnea-Nb7iAER3Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA1MiBTYWx0ZWRfX4HGYKTXjj+uD
 NtiDSYVauL0whdl/pyRWxSKIcgLbCgscHGJ6Nusn/WOXaA2gKDvdKcw2UDIDLXy85x1kKasNv27
 f00pt4JbQT7aPv3mVU8RVGqkJUY3+GG7no4++0O4+Ul469Wa8qE1HzhHIjC5/meSJ9sIfDwBWdX
 ylD9Zto5N1PK5O5hAYuavpB1n0B9s2jshWbxvutmnQFDnp1pZv1JKgPqerazJpwtMG59G5FWwjZ
 mErjk+CRSm+ZcVFQVzgSKqw7hCP/UF9Zz/0YBppSpFic3xOTIZT1gcn1JeNpRX13iAL0WBHw6qp
 mseufMNsp+jRpp1tKdY/hHNB7HeK9HquvE7KGdoGvXBSDXPlGXX4TyplRfWNsOoGCFnfYH4mUNK
 xF82EZFbnCBdBbFt2fNJ9cD/S3tpHMpHpYBvQumIKr1qxb00v/rtNnDFmPDXjUGlpSRHk0PgKc9
 Cy9IhIsS5G3VBR+Nn8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010052

Add the 6 nm SNPS femto USB2 PHY configuration needed by IPQ9650. The PHYs
on this SoC require a dedicated init sequence and override parameters
before they can be enabled.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 62 +++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index b6bbf2b570c7..8957f208bc51 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -29,12 +29,15 @@
 
 #define USB2_PHY_USB_PHY_UTMI_CTRL5		(0x50)
 #define POR					BIT(1)
+#define ATERESET				BIT(0)
 
 #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
 #define SIDDQ					BIT(2)
 #define RETENABLEN				BIT(3)
 #define FSEL_MASK				GENMASK(6, 4)
 #define FSEL_DEFAULT				(0x3 << 4)
+#define FSEL_24MHZ				(0x2 << 4)
+#define VATESTENB_MASK				GENMASK(1, 0)
 
 #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1	(0x58)
 #define VBUSVLDEXTSEL0				BIT(4)
@@ -57,6 +60,13 @@
 #define USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X3		(0x78)
 #define PARAM_OVRD_MASK				0xFF
 
+#define USB2_PHY_USB_PHY_HS_PHY_TEST0		0x80
+#define TESTDATAIN_MASK				GENMASK(7, 0)
+
+#define USB2_PHY_USB_PHY_HS_PHY_TEST1		0x84
+#define TESTDATAOUTSEL				BIT(4)
+#define TESTCLK					BIT(6)
+
 #define USB2_PHY_USB_PHY_CFG0			(0x94)
 #define UTMI_PHY_DATAPATH_CTRL_OVERRIDE_EN	BIT(0)
 #define UTMI_PHY_CMN_CTRL_OVERRIDE_EN		BIT(1)
@@ -78,6 +88,9 @@
 
 #define LS_FS_OUTPUT_IMPEDANCE_MASK		GENMASK(3, 0)
 
+#define USB2_PHY_USB_PHY_FSEL_SEL		0xb8
+#define FSEL_SEL				BIT(0)
+
 static const char * const qcom_snps_hsphy_vreg_names[] = {
 	"vdda-pll", "vdda33", "vdda18",
 };
@@ -330,6 +343,17 @@ static const struct override_param ls_fs_output_impedance_sc7280[] = {
 	{ 1310, 0 },
 };
 
+static const struct override_param_map ipq9650_snps_6nm_phy[] = {
+	{
+		"qcom,pre-emphasis-amplitude-bp",
+		preemphasis_amplitude_sc7280,
+		ARRAY_SIZE(preemphasis_amplitude_sc7280),
+		USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X1,
+		PREEMPHASIS_AMPLITUDE_MASK,
+	},
+	{},
+};
+
 static const struct override_param_map sc7280_snps_7nm_phy[] = {
 	{
 		"qcom,hs-disconnect-bp",
@@ -418,6 +442,32 @@ static const struct phy_reg_config hs_5nm_phy_post_tuning[] = {
 	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0 },
 };
 
+static const struct phy_reg_config hs_6nm_phy_pre_tuning[] = {
+	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, UTMI_PHY_CMN_CTRL_OVERRIDE_EN },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL5, POR, POR },
+	{ USB2_PHY_USB_PHY_FSEL_SEL, FSEL_SEL, FSEL_SEL },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, FSEL_MASK, FSEL_24MHZ },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1, PLLBTUNE, PLLBTUNE },
+	{ USB2_PHY_USB_PHY_REFCLK_CTRL, REFCLK_SEL_MASK, REFCLK_SEL_DEFAULT },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1, VBUSVLDEXTSEL0, VBUSVLDEXTSEL0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL1, VBUSVLDEXT0, VBUSVLDEXT0 },
+};
+
+static const struct phy_reg_config hs_6nm_phy_post_tuning[] = {
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON2, VREGBYPASS, VREGBYPASS },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL5, ATERESET, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_TEST1, TESTDATAOUTSEL, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_TEST1, TESTCLK, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, VATESTENB_MASK, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_TEST0, TESTDATAIN_MASK, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL | USB2_SUSPEND_N,
+					 USB2_SUSPEND_N_SEL | USB2_SUSPEND_N },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL0, SLEEPM, SLEEPM },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL5, POR, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL, 0 },
+	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0 },
+};
+
 static int qcom_snps_hsphy_init(struct phy *phy)
 {
 	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
@@ -507,6 +557,14 @@ static const struct phy_config_data hs_5nm_phy = {
 	.num_post_tuning = ARRAY_SIZE(hs_5nm_phy_post_tuning),
 };
 
+static const struct phy_config_data hs_6nm_phy = {
+	.pre_tuning = hs_6nm_phy_pre_tuning,
+	.num_pre_tuning = ARRAY_SIZE(hs_6nm_phy_pre_tuning),
+	.override = ipq9650_snps_6nm_phy,
+	.post_tuning = hs_6nm_phy_post_tuning,
+	.num_post_tuning = ARRAY_SIZE(hs_6nm_phy_post_tuning),
+};
+
 static const struct phy_config_data hs_7nm_phy = {
 	.pre_tuning = hs_5nm_phy_pre_tuning,
 	.num_pre_tuning = ARRAY_SIZE(hs_5nm_phy_pre_tuning),
@@ -524,6 +582,10 @@ static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
 		.compatible	= "qcom,usb-snps-hs-5nm-phy",
 		.data		= &hs_5nm_phy,
 	},
+	{
+		.compatible	= "qcom,ipq9650-usb-hs-phy",
+		.data		= &hs_6nm_phy,
+	},
 	{
 		.compatible	= "qcom,usb-snps-hs-7nm-phy",
 		.data		= &hs_7nm_phy,

-- 
2.34.1

