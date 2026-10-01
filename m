Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175AC4D2EFA
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847323; cv=none; b=XzXIwwY8ooyRziZYff8QjrH7yxYZ0NZq76EVXcGDnxWDEjHIpYkxuozCvPerolFlcR+nuaMamyVypflQhziTSQ6jeNh4z6qCslZhEB0zF2E8iU2cb9vwlbLiYoCkhotvKe7uK0omLgkqHeYJCG/oRvSZ6tcMn6+b5JJiaOFO85Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847323; c=relaxed/simple;
	bh=CRcLNa/Cu4cLPoRvzdzxQBYWxw22aDoQmvyGJg/YDnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c7eUTv7NmEdKSDsfN2fQg/aXu+rKs5Ke6VpA3fwvmMGthLeAKuD2lYt3Es+ksow4EJtXSbEMP05gZIRfmyC2TiE2b3QDlNxITGwFxv8u4A4Lhz52d6ufcALBHvM0+JvXzclCq4eigenVmLxU8AqElXUElFet46YuwLGvReerMyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mU+bWQ9D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KhuSyqMR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mU+bWQ9D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KhuSyqMR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xNVu1062189
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 09:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d6bjQ1I/J+lMYzebHvdrZOk3S6dIwxL/iEe5SwfdHAU=; b=mU+bWQ9Dzi1jNbjz
	sehanTHooxWrdtjAhSNp7kdjpG9A9zyXknQUrp32T0fJDtLbVXjqO8FtWYG0jfED
	/6haBKBCdDGFMo/ZaoWOVZw8lDEskgdosXiDkabNziOs7g4QFhsP22TAPn7QrLue
	FFlbquSiL21HjNlpG2zDn/KbuOrGXc2nbVodttyHGIqrp+T3uNgyz8quCwR7Z+ha
	ARtF7wpOb5L0+kS8cUa+B4qtHxZA5AIgzOx8E0k4Y4z5E2PxsQ33ht6WLsrKdMNQ
	CGEz+XeGX9LmAezIz7uV86l7UuD/F1ADVEfY7oe7QZQNDaL7V6U65QG7adtAim27
	wsCJPQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17mvu2m6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:35:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so500624a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790847320; x=1791452120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d6bjQ1I/J+lMYzebHvdrZOk3S6dIwxL/iEe5SwfdHAU=;
        b=KhuSyqMRGeZUTbammtYpHh+1EZHUx1c7nimEhdfAH+wgs1CSWdJIIBX7IK9c90Iccf
         oBJgIXkAkYQbCgORcpwOXasci7zUhuj2MTQZH0dyl6E917e2VIyzXeI58Vz2VdgKmTef
         yYgM8OcQ2MP7tRElTNmBLdiExH5G1Jy9hWQTjsTNZiGQkhkRg43UJ8WN3w5KEdMsXvCr
         V9qdK+hqVmXJ4Zxal8lsmfclOtScaAWbvXrCw3jGkJeqyLJVuDVBoro6Ec9EQx7a74kT
         E+2D5e0AHoG3zThiPzXv/CwJ/eY3NrbIEShVVue0SrURO1T2c9hOMKmxPu//LtL/Pdn/
         5qPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847320; x=1791452120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d6bjQ1I/J+lMYzebHvdrZOk3S6dIwxL/iEe5SwfdHAU=;
        b=r/KDDaK54+5AGITdSACe4IDszqi/y+9g50+y/Ij8+PUbQiM5AcGLE5I3RvE2eFXDdh
         4nyXikCHgh84UN2TZQF8kbcgPZRfUEt1847BYhSrEJeKARAellpqQlK6/3mClzAy0fA5
         rdgS3uKPfjJEHg5OduXQoI9flHFaoH4LmRHhM3X2a85GEl1X285QvLvLB7pHZ+5PmDcl
         OKijYgWaAMZEMfoQ+Cg+DMzLyzZi9cIA39Qf0BoMQcD7Zs3wKY+I/i/v9EuoArr4rJdJ
         k7hkAywLri0R1nTVg3EJMt3q9ZfoB3cPanNHApOD6NmUBLFu0MGqGdmtppbCcNjnAwm4
         xwJg==
X-Forwarded-Encrypted: i=1; AKwUvBxmoOSnt8c/Ii84sa+fLjyY0ys3AqYmEev2peel/1Dxp6KV/XTfHFgR3ngYFs7VdJSgEh37fECAsV4wlCo=@vger.kernel.org
X-Gm-Message-State: AFuF++lrRDfC57NWbAEh6FYsMVsDVomOKip5eaSEZ1Fn7z69E/nzmGiU
	PW3sbEU36mAGURBdmyeCqChZDsWqtTbTbfevdr83p/YNcFF3aeZItJ6UODX2UfcRGbYrCLF1Rqp
	1WHDRav3+QXvgrDnVwIriZCr6vaW0N3nDYXXSA/Olhkn06RZHwptIDGgYAokD2fWq0Iw=
X-Gm-Gg: AYBFou1qlcHgBLWAmoO9+y7yfrvBFWzvU8Bpmq2ap28VOYvxWQ4U5WY/fU9+xzouHIw
	wNVojMw++sbBZbHurnstx9CyDxiPyoqCDmCT5keJCTkbI6eXlz/KwYdJo0sEW+LFCfOwQb21G/Z
	bweZMOXYU4LnfGo1T87FjAUCvRLLtfHS3naHJkMw9FvQTRabQJnOkNOW0zAXbJMuByVW/4nPlRS
	0tH98o6xRUHNOhPDWuvxiVvQNY3FQNiqKbGlVRB5zDMMuoAt+g5Fb6Nja36VdM6DoMYgDpsICGh
	08Wm5AI7/Ui8fXhfttS0B76oMo8vO+98WOu4GO772Iiw4t3eeXHZpIn37fQHhJiwIoMuL/X+DmF
	uf0NCqxPReDweKC2szAuIuugWw6A=
X-Received: by 2002:a05:6a20:2450:b0:3de:7f6c:b878 with SMTP id adf61e73a8af0-3deacbf03efmr1805432637.16.1790847320343;
        Thu, 01 Oct 2026 02:35:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:2450:b0:3de:7f6c:b878 with SMTP id adf61e73a8af0-3deacbf03efmr1805397637.16.1790847319734;
        Thu, 01 Oct 2026 02:35:19 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e54bf4c4sm1152944a12.29.2026.10.01.02.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:35:19 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 15:04:22 +0530
Subject: [PATCH v5 05/11] phy: qualcomm: qmp-combo: Add hardware-specific
 dp_aux_cfg2 and dp_phy_cfg1 fields
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-glymur-phy-v3-v5-5-3848c2615d5a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790847286; l=6615;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=ePNqq/ojbPoWMk86wIgOBwLMbYMMdGFda3d/uJWLqsE=;
 b=wFGY7rXOr+HIX0f1cW8qnVT3uUsAe2DCqjkUVGIcegZzmQciG+cFNvAS0eVFGRcTeq2P1BkHo
 u6aed9cxQebCIaMQthuNwEB+513geN7ruF6OSUNiCSFc5aVzwvKkmCs
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: -Lr7-upepwXkfx1jjGB5uMM6Hdm-J1JC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfXy1ho8lYYleNU
 pnLGV6oCkXNbitPk4Cm/tHcgwFeD+9dyUJEpL3neNPBtsJFGH6ysd4aSfWJcSIqfn+nCvyE+Wnn
 1DOznfdASTPZcjRmkAPYs2tFw6eWbHZ+hy97F9iPkSaz+flHayDnOxl3Zuzjn3HoqWFc3KgEHIG
 MXo2Cl39QSn946q19eNAzjULBYAqWRBMrwKlh0JGS6c1Yum2Ju0BKkiZtdUWgQ3oyo336iv9EW8
 PWh9MtPl4QsmL2O7SiFUPj2SrQi6CWfHDdWvpe61czV/3P+Ih3VmtDYUftfeBxRZQuoqgDJGN1d
 WKTDRmcfJDUie0rnJVMP6U4Xb+OqJX5aNdQuFVtP3c1GLj2UYM9veFz3OpFb47Gh3qPsIM6qhfZ
 UJPhOfDAIlLaFu5zH3lEnwPa0BstFxdGAs8S0nqRpCDrMTm6q4zNB2W2nx7eaIn5ZRwvnN0depJ
 7CL8lPqRoCwtCW+mPGA==
X-Proofpoint-GUID: -Lr7-upepwXkfx1jjGB5uMM6Hdm-J1JC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX7ftdBgg1mzvM
 MBSnQkXajMgIJ/mVFvtGRDEEIM0ighqvDxbkY+wu+tdI2+JegNebk+M3CG3pdtWvjjrA82fvI/d
 dGhucJgSrSWZ0E0rmq5xqSiEu45B1kc=
X-Authority-Analysis: v=2.4 cv=KuvYSmWN c=1 sm=1 tr=0 ts=6abe2959 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=AZ7O3MIRyL_cLquugRgA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010038

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add dp_aux_cfg2 and dp_phy_cfg1 fields to qmp_phy_cfg to allow
hardware-specific DP PHY register values to be specified per-platform
rather than hardcoded in the configure functions.

Define named constants QSERDES_DP_PHY_AUX_CFG2_V456/V8 and
QSERDES_DP_PHY_CFG1_V456/V8 for better readability and maintainability.

Populate the new fields in all existing DP PHY cfg structures:
- V456-based platforms (sar2130p, sc8180x, sc8280xp, x1e80100, sm8250,
  sm8350, sm8475, sm8550, sm8650, sm8750) use V456 constants
- Glymur (V8) uses V8 constants

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 37 ++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 646e97a52886..ebe2e6136f7a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2486,6 +2486,14 @@ static const struct qmp_combo_lane_mapping dp_data_lanes[] = {
 
 struct qmp_combo;
 
+/* DP PHY AUX_CFG2 register values for different hardware versions */
+#define QSERDES_DP_PHY_AUX_CFG2_V456		0xa4
+#define QSERDES_DP_PHY_AUX_CFG2_V8		0x06
+
+/* DP PHY CFG_1 register values for different hardware versions */
+#define QSERDES_DP_PHY_CFG1_V456		0x0f
+#define QSERDES_DP_PHY_CFG1_V8			0x2f
+
 struct qmp_combo_offsets {
 	u16 com;
 	u16 txa;
@@ -2551,6 +2559,12 @@ struct qmp_phy_cfg {
 	int (*calibrate_dp_phy)(struct qmp_combo *qmp);
 	void (*dp_aux_init)(struct qmp_combo *qmp);
 
+	/* DP PHY AUX_CFG2 register value (hardware-specific) */
+	unsigned int dp_aux_cfg2;
+
+	/* DP PHY CFG_1 register value (hardware-specific) */
+	unsigned int dp_phy_cfg1;
+
 	/* Set if DP mode configuration should ignore TypeC orientation */
 	bool dp_mode_ignore_reverse;
 
@@ -2813,6 +2827,8 @@ static const struct qmp_phy_cfg sar2130p_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -2949,6 +2965,8 @@ static const struct qmp_phy_cfg sc8180x_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -2995,6 +3013,8 @@ static const struct qmp_phy_cfg sc8280xp_usb43dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -3040,6 +3060,8 @@ static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -3149,6 +3171,8 @@ static const struct qmp_phy_cfg sm8250_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -3197,6 +3221,8 @@ static const struct qmp_phy_cfg sm8350_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -3244,6 +3270,8 @@ static const struct qmp_phy_cfg sm8475_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -3289,6 +3317,8 @@ static const struct qmp_phy_cfg sm8550_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -3334,6 +3364,8 @@ static const struct qmp_phy_cfg sm8650_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -3379,6 +3411,8 @@ static const struct qmp_phy_cfg sm8750_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v8_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -3424,7 +3458,8 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v8_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v8_configure_dp_phy,
-
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V8,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V8,
 	.dp_mode_ignore_reverse	= true,
 
 	.regs			= qmp_v8_n3_usb43dpphy_regs_layout,

-- 
2.34.1

