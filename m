Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C86361973
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182245; cv=none; b=Nc9vD46ub/PHRH6LEkVPtJRZ3UYvdOK1aqL/mtpGYyvqFaJGrKH3I+FaMrCY+UqLU7rNbzXddvzAC9qt+HLM06D3JceNvkT76+Qg8M1n4Ejtw9yVlbFE/9GbRvsZW0qFbQv6hfMlPke0qsd6RFFHg5cwnOrEZsEKklj2gB3YRNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182245; c=relaxed/simple;
	bh=7ILArANYD5gi/Ol8mfS5svPlqqomUyThtypHtKuxdS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MUtMF8tAPi6bd6dgZ2m6Woe53kC4CEAOmipqq0SVElivCzhp+9TbywKcvqlxPqvJpqXHRumn/bnjFNrvhKOfEFncz7b90s793o8+hVy6WfyHinKiVGS9h5eVy3KXT0XAkpKWeuN4Q92qK8tGCp0K5mwETte8ipgZLjj7KVbq0EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYF3SM8o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oi8s1oQG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYF3SM8o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oi8s1oQG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510MXH3838751
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 06:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QT+YF61f5o/fn7STVpLg6IhJeyrRCRNijTHEH9W41Es=; b=AYF3SM8o8XaoHJxD
	GDSLptXPxjcOp5BSDk0Vwi/S13PEJdD+dPyP9iALDftTeUF2Znd0BHK2NdmQeB9H
	nGCtBhOLFVhFutPneCQ7H/4rnY6iGScCdtUV3j0umPstNQwkca73phP6E7SqC1RP
	GlxgvppE3zQ9D1M3h11GEiW0b1DY8uZEeT6iBbn93YqwfLQ5Ward1Ze22bd6TIZY
	QAerBq2mrBPuj6/F4n24ketW4Y1llCEkOLt8aPSFGE4X0gRKn9vrwpiwPidkNKwV
	uvkgLGqYP6kEl8ACkKuSTFIq1xtovPXnQQNB+N+p/YADkZjCRtqA63ybfjg33dHL
	pDkDmA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08mmrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:37:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34d49d8dee1so2299383eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 23:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791182242; x=1791787042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QT+YF61f5o/fn7STVpLg6IhJeyrRCRNijTHEH9W41Es=;
        b=Oi8s1oQG+2bYlT1Yf9fk/uYiw6bCGMDLnF/WDW2UE5S1JADAGcBCcgZtiGAvjcA+P+
         6j4Ug6+1QaHUlmgHYKF24mAiDyhvZzY+0qSLCed91Q/bmM3EUJUCUs0azmzXz767ZNPL
         3Eg8obdR6CzSc5FwoufW10yF2xXwwjBRs5mn9IvudCUQPksUCylTnYhWMzuN+FYzRAiS
         wx+truktNByw7U0Hqq9aodzBx1QICRycDpMVnxl6ipcayI8v3ICRFO7lKxDC08LhY6bY
         kYcWIgnPlg1EkzCQHzKvS0smXC+4zjpqXWY4yorA1jNgn4TPkEYlph3WBdD5LeesTZI1
         jspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182242; x=1791787042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QT+YF61f5o/fn7STVpLg6IhJeyrRCRNijTHEH9W41Es=;
        b=NTQcjff5nZOxaGnE/FcrGJBQDKLLRM58otKaykhKX6H+EPxeVU9jJebdADULZrosKR
         8S6xYpQgZebX7XPDRTMYHxUKjONqDXYl2AjY/IJIbqzkfegQCI+7TCyX11zHtaZtpwsf
         MBOx701HbzplAVY6BFdNwpe6RWD8IrdXIO0y2dhKItPjabZvwpNoOubsy3/UsIG+vYH6
         c/OPakUaynzthRAjGMtQ8DMAkBPAOO547L4CDYQh/21xwK/lKROf1BErako5v9UG3Mji
         6P1cpIMoKY+ay+IqtM2nnvgmmbObzkGEYi+xoBevFFLVibZSluibz0f/xa4hDPOVFL/Q
         oFZw==
X-Forwarded-Encrypted: i=1; AKwUvBy41GRjA6Rfjti67X3iyk6+RT6y3eD+GIF9x3MpYJM6VxvzBZ/KFI/A954WnJqY19PUR3IFuNaTiu+f8oQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lVUIjCrOv8ls7LtexhLlCdTI5XmxvS7ko0ZIV14DPkWvulMAxV
	0/rNHKdVN9Z/AP/J22cToDkfXC4kRfwkiTUFfq/cMM6uhUFIbEX4WZEnWQYIgBSYzYAwfjq9KyL
	oYZ0vQnLAmLCqpUl1BupgSEtYf+BeHDC9tRVtDmMnUZVeWzIAd3sd099w9W40Zooinvo=
X-Gm-Gg: AYBFou1XRokUwGIFZYKO5PUO3ukvDk/TZjhTBZTgZc3D/yUoJ3Ik//j45hd0w/zl8UB
	VLoRKdlbAivA89shV6Ad5/v/w5ZdUUoTks3fUYdyW4YO5wNbbCxsMWqeUkNrtsB4KZrZ6Be0gwa
	+XPYzFAeRYbwwreMr8v5/hP369GwRJwBcP0gqm6QEFCOTpTv9fzHxSELCyJQSfgHE6DAG3f6j2A
	Uh/tepRt+FP3mq8BowlehPH+6fc6DqKsK7mNXllpFL5tDCWo86g1STj0w2kLbOG7Gs0toF7Wwif
	U1CF/KqICTeNdTSTz4d9KnFkUnwHfTxao3yFx2pXhYqcHrd5msgwC4tQEJQAjz11RZhmgYCQEqi
	ky20y8bYAePfMWPjkI1kgb1e1sxcE5lVZBztoSU8vrXzPaLX0tv3yyQKAMNJnX2nbGESAK9oqZe
	bPeHaydu0aCX6BnRD89iuLhp9jk3zQ
X-Received: by 2002:a05:701b:2086:10b0:144:e38d:8e52 with SMTP id a92af1059eb24-14f5c5e89femr12368007c88.37.1791182242051;
        Sun, 04 Oct 2026 23:37:22 -0700 (PDT)
X-Received: by 2002:a05:701b:2086:10b0:144:e38d:8e52 with SMTP id a92af1059eb24-14f5c5e89femr12367977c88.37.1791182241537;
        Sun, 04 Oct 2026 23:37:21 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512718d9edsm11185821eec.19.2026.10.04.23.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:37:21 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 12:06:31 +0530
Subject: [PATCH v4 6/6] phy: qcom: snps-femto-v2: Add IPQ9650 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-phy-v4-6-b04c4123ecb3@oss.qualcomm.com>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
In-Reply-To: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: gtCOdeFzh7nu60RRfJ7EOsY3GOwpQMsY
X-Proofpoint-GUID: gtCOdeFzh7nu60RRfJ7EOsY3GOwpQMsY
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac345a2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Q9t0gmS3rCGuRMBXcNQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX8A3CoACDDw1C
 k0C6Aj8AHinV3SKQ6WQ3ss+sPRctBCma/wXzkDZHD79H8nt2FLHKAK51/GDl6MEe4U+tn2NUATr
 UyMt4s5FQlbziIRy/I6CRMceJWsvaRY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX8uJZFpr9jZlJ
 e+/butp5sZepHUBirO1QDE31UyVmJFtH6hQn/oK6BLiHtEJGRkRqBGCAhxZgpAoi0RQxNNVGon5
 RiFC6IcbhngasnGROJG+4e3PudLO+1D4SqETnon634csEw2l66wYbz+4+RmMKh4WbxYqu1fC225
 B3KVu1DxXDwpwtsW17A8hjBV0bHbAQUBRFO+7nHrIlqyq4Arw0A5lJKe67mMSWbceHufnxHiKvK
 AiQHi942NLnkVjSqkQqYW+nqQq/QldtUVzuZwt2HhglePe9Ng0T+CwUflxi3uXQYE89NyPnnzR6
 +2YiDtwx+RldVT+KlzNGv+UDWc9VKzDRIW8XrSBUMejQvQDrann7TqZ+T8236croyi22IrmmGM/
 DSt7yMD81bdf5uyFp84OyquU1KBzXk6QA0ZqGmaCY3CTa/xo4f1vijArZIj1d6cGCBh2AWu6gSB
 Cohy9CCoV3BQTJ3GiRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050026

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

