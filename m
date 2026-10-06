Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2180D386554
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 05:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791264600; cv=none; b=aFHn5I8qpznNI963j/xS9ZBGR8quxqxrNRt31qEET5hD+qPjfIoVu/nU/w1IqdPzOa0s81PhrfEd/0NCmJUZXlO91r9dM8pdr/4a17DwhsohjH1CxmPX0gej79LcJhGDH7SR8iwC2mH22o8BUI8XfN7EQE7X05drRc8dTiaXmqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791264600; c=relaxed/simple;
	bh=0isudInIi1fTTIkSrOpgHN/K9rwZUnEvOl4ztUj+pIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bF0G4LdJxi0GIJBwhSSPno1CRpz3LSyg6TSwf/77Ezuw/cpIdGxjDMHKa54qAAs7xM+96SQE6IEgM3GJus28JDAl4dVm2edOYqbQPXZEcmL1n+AzhXdwN8bYQ7XG35anQjcMXbesNLxiyu+qS34SbhDbwyIi7p/eJUwW9FO6iZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RB/Uhs10; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LK1Do8jG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RB/Uhs10";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LK1Do8jG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6963A9Gl628317
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 05:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oakCOR/MxK4aTqsivjCflg3sV5s4Rn3d77hnwCyKCyw=; b=RB/Uhs10d/phO1ST
	r+mY5a0EpMn09n9gILY08KRxJulaC48u8zxBDzePka8sdRcNqpkxT8a2yCL4kDJc
	0eF8hqvf+ZHFaFm+iHLYAu1DttCcibd2b180af07DiY+kDA0MnRU8HPIGiF7Fp0a
	AWPTOFhGeVPbP/DC1vwdZCAqCjYHIOJqIoFgind+ar5xVvvDaVpmCJ0CAbszEal+
	IB8xOCpKtoLIJQCEdDKTglUHHDmqhIc+WSa43mEgSXullkEI9DpVU4bLzIqFecE7
	IVdOiqN5R81ulaySwHVl/0L8LxhlpMELBqu9IsfXZYlsjfDxvC+r4Ap3f0cL/Wcp
	jPUenw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4cuu35mv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 05:29:58 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso4687977c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 22:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791264598; x=1791869398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oakCOR/MxK4aTqsivjCflg3sV5s4Rn3d77hnwCyKCyw=;
        b=LK1Do8jG/vFyAjc67AdSpiH8rSeVwRvuddzXgRMnrGDSAoevTCL3qDVrjRvYGjoXyS
         ZmSLPSkLlKlICvT8Z0GD+P6ZCP8S9jfsTv+5YmsZrOTmJR41FvQHZPvJca3SX5sxWncD
         hXjojTdKavrAASZyiNXRL0A4WvTY9aYvFftWmbsRG9e2X4LyLvRIDydHuflZLUMF/Czs
         vuzMzxCtebElmeT4W4JUhRFqPYtvZmAwOWZxDegNkzE7H8+ucClV9QAJcOpFDhTIHHs1
         5nhos0Y63zb5911LXrn38BW0pkoBT+2SIRNaiX49uVO0dumGoLVSNbvL94NPiFQmssdI
         fakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791264598; x=1791869398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oakCOR/MxK4aTqsivjCflg3sV5s4Rn3d77hnwCyKCyw=;
        b=yfG+d07vx4YgMxYdJTe4dAT9V72l5lT+mfOCTe3zBRdhNExdZM8gU4YoUgGXlTfWMK
         v8qUBf7YuE0RfAI5t/nJ3so4AgPY/1JlVQ6sMwuDCUBDBjJFL4kSBnTNI4DNp1ijwog8
         g0b7xloUkbvMjCOa4TecnLpK5SjL1og4b7lYgEaKYLsLUWiKGGjcdFrFzznd6fqcPl3V
         VY/cfR2Z3kVqTxP91xAQPRWAep5FMNE9p8hPhOZk3Q3Y1+wRijiX4indf5v41BPN5egL
         x8SOrvr9CB6S17FCErtF7kXeaMXcBniF8vyt9VRiRq9+bQAmBEA2uOHcc+VCWPCwQ/Rf
         9fNA==
X-Forwarded-Encrypted: i=1; AKwUvBxCur6EKz0NDkTacL0DrcRxSr4FGtiqHoSKebxn0wbnlrtf6eVSEhHRjk33HJArmYlfLbUdlY3zIZkACBc=@vger.kernel.org
X-Gm-Message-State: AFuF++lsXH5sVFbi0ADM9snWli8a6ysRfoOsfh1b1rFf8u1wSKVt6BZ2
	dk3z/QmtRicIF5Q8iXcQ3fwLo5sa+iR06JEBG4q8fUXA/2a7h8jHOAlsvagxqsgO6ZvL+zJzjao
	/TC3tv+nGlFb7t8XkSvAS0cMhrsC7yGqtAhvLRX8abVd5T+ADcWiOMxKNVOlT7HV0tJM=
X-Gm-Gg: AYBFou156D+5YnGVkc5lmQb9NnLaeFccZgZanHz3awo4p5G5C3aB3bcyrc3M6T72VC4
	7L2MCU6C8oPLVauRqphzyc9r3YWrylXUYqr5s0EzOY4Qe1qJpcnCI8kwTCKfKBpJEmgOyIpcSFl
	+mOgkPsKhpU0zpXWZ6+E5ixzVQD/2vvoHBv2g0yFA0/Nu6HEZCKH7WuZ1tJM/rqXCiOkGKTC09T
	oxPEgB7zceP7SpP7ht3DefkwKzDmf3Y5Bo154dNuff5GkGRAPY2XXZFtQVATR2gggCDOSHuvcDP
	aKlEE1WIN3JiD6jV2P+B8EbUQI1cplhP765Ke7NOu+nOpXQ76OBT6mPOq6bCw1UHTy/tpvJEn+Q
	hN2HlOlDMTfb+n1NM+Vzzg3WvjJvRuxnt8lnZ8XcMoaswWHImvJSHbjDfY+UV5Gzp2uylKQeEQS
	MyUaI9lbS0m/njpIsI7ZBM0ZckyGub
X-Received: by 2002:a05:7022:3a8a:b0:143:2984:6517 with SMTP id a92af1059eb24-151c4640297mr12927471c88.38.1791264597649;
        Mon, 05 Oct 2026 22:29:57 -0700 (PDT)
X-Received: by 2002:a05:7022:3a8a:b0:143:2984:6517 with SMTP id a92af1059eb24-151c4640297mr12927440c88.38.1791264597070;
        Mon, 05 Oct 2026 22:29:57 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d85781d49sm4017403c88.16.2026.10.05.22.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 22:29:56 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 10:59:20 +0530
Subject: [PATCH v5 6/6] phy: qcom: snps-femto-v2: Add IPQ9650 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-phy-v5-6-cbe9330a6449@oss.qualcomm.com>
References: <20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com>
In-Reply-To: <20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfX6GZ0kBSla3u9
 etJh+uBIWSfj7p6922j/xuxYc9C/n3nMJXIm1BxwhFtRHxVE2l1NrTe0kjsaUm5I4nhxGwdg5RO
 PJ8WSU5H9lm1r5HjsXk1renchALZU0M=
X-Authority-Analysis: v=2.4 cv=aKRlOr9m c=1 sm=1 tr=0 ts=6ac48756 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Q9t0gmS3rCGuRMBXcNQA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 1CIqp1BK-H8J_L2Bd6CFNlkW8Tu1VOld
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfXx03tfLECAaZ1
 afcCGbEhi2wxVcxJVxKlXNSN2Ie/AjlvYvUpcqEsFc4sdUAH6iiAkAdRk4iHr5uprYBESdhJa3w
 BzeGOI9n7giIOjJXhVougpdW4Tpsci8Agyasei7r5z7rtsEgfKDMQH9nVdFeGGbgj2mLLvbYDxi
 RMk8rvFFbcq3ns5k/BYt4+z4+9NjM+hNiA5siItkeU9D5tviPpUcZEwRM31E21yMU6b4EtVtjuz
 mPC5SrhSTqyh2EXCCT0HRtAbTgxw3q2gn8DSBW/lH242mRrUMR//Q++quj2em/SVxbBG9acLSZA
 wQ+elzCRw4zBhmd+G6ZLuCMtIk2qkhJuLgjU+T5JrDXAAiHSmP1I7VHjZ3tTI9R3eDKhkH4If9v
 OLGgO/hlkq53VTvG1M6WYmkhO88PHdbSPbYXKW0PVHZO7HcCvrp0U+OO49uzK1ZB0/YY72lJh0J
 U6po+FOkkiTIXAC8Cdg==
X-Proofpoint-GUID: 1CIqp1BK-H8J_L2Bd6CFNlkW8Tu1VOld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_01,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060021

Add the 6 nm SNPS femto USB2 PHY configuration needed by IPQ9650. The PHYs
on this SoC require a dedicated init sequence and override parameters
before they can be enabled.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 62 +++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 2e37b39dabba..3ed4292fc8c3 100644
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
+#define FSEL_24MHZ				FIELD_PREP_CONST(FSEL_MASK, 2)
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
@@ -512,6 +562,14 @@ static const struct phy_config_data hs_5nm_phy = {
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
@@ -529,6 +587,10 @@ static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
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

