Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2F4476044
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256299; cv=none; b=fv6+/th+rbhfMu71Y9oLMfWXoox/FVha6PfADaOxnl4dEMRup1lfEfeUA2PzkAwiYEm5NbMEObWKbvVHUyfv45hRsi06Rb+j+rleKNTnLITR12pkHtgxKh1NE0urIbwyBp2HaWzLSoJWZqKiHlpVh54w3cG0dmbFjFZ1Le/1qrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256299; c=relaxed/simple;
	bh=FRyzFnCKLZV7uOX2SGmWXhJWdsHY+YHiqDC57ZAdtsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D/rNKeLk/2y1+vkF8B+1qG+8SY1kfro/bS9AC2G/xvqDCjjiQLDSP378hGXqpmdYsVOf7B5lo5LShC+inpJJ/3QqMsdfpLwEprL4WHhhjjtREkczyDcb2nLV5ZmBUe9fKQBaQB1uXb03PGaINxM6l6onWlBj7n4XqthJFBYbF68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R0M1kHQn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GxYrbHyi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R0M1kHQn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GxYrbHyi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179G6P2561947
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 09:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yvIqketjobH
	8ByjLpcovcPUoBcVyIstp1NfXActfSbI=; b=R0M1kHQnejg3sgvxtM1gei7Y2dC
	cwzIfcuVmwpkkG9bSXAnMwzCLg9QYi/5g18T7WzWuCUOePSWeofyp6wrOrXtfxze
	08Lm+M0jO7M8POx9sI5lnF3kfGlY8v9TyK6wuYqxW9mBMylar5hS1+y1nj06UFyu
	jfKEn0c4HZT3GaeAlcbKUOpbsatnGdpUCcekYcki+0P0iQKE9XOna8fkpLA1Da8f
	R7KdXV5Vz16YMG9hT8kBQkyZ97dKPuqcB9K2xEw0c6/XNsOZHhuMDiA77EI6IrUS
	2+R/hmH34/DboNbTG4AvP9+/+JEsbXBay/pCjwXHTlwxY4bWBKyaxS/sgxA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdeg3bqc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:51:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-395543dc382so6524646a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788256296; x=1788861096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yvIqketjobH8ByjLpcovcPUoBcVyIstp1NfXActfSbI=;
        b=GxYrbHyiH20Rvrj0N8Ssbo0mLYA08THDH6O4tHkZchtDhRqysAIx5ymDg2u/p8v7Nt
         5JeQK+fvj98tDt/VSObeaBquDZz5lD4EEY8Jgv/Ibd6AGWn4zheGjcJnob2OljVD8ZbZ
         Fe71bCxXaUN5soDfrr4VGioAm/rYHDKuIiogMVQ9AcD/fur/GdrXgAmqpM7rpBI9mGdd
         EXdyotdqokYUh0pNEj5lajkbhT2l0bSUXuTHZ9wsvfqzTC82toMz6ojqWPUq7HUfC9FY
         iTU02gQJsBp8dJZT+VC7LvMlbx2E6HA/zr/0dMdNwXzA76u/lg3kiQO2cetfQRFtdTgZ
         Kt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256296; x=1788861096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yvIqketjobH8ByjLpcovcPUoBcVyIstp1NfXActfSbI=;
        b=G1d1AZwlAr2ydpzEzdbMxKumbFWA6RnioFswrMopkSVL+u7sPW9wTS6uCMXylCPz7Z
         9hVp/4aJQQZonM7rkhU5e7MfEMPrt3bhiK320eZMytqBhET9PYNDsm9t9HyuZgBl0Mt4
         1N+GBJkhNXQ3VFoZj117JOIdDSNqc90UbYx/73lXo9jCqO8x2Kbgd8tZzx7GmLy6mp23
         k96Or1WkeHaPGLlIf4dKt9sYPzjmXHAyAU50bQRqQupNZvYdebOLbGKWcZUEFtpLzj9y
         DHXKhE1blNKTZPpGDj+huCW2uCdyfezRmE5WZQy41+yynPgD74QaQ+EzaGzUqqCqxQ28
         WdsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUmyt1n5n8usbzMn88jtq1mAS+iZzVTyshNtr1RehF0KSCF8nyjEZ8lac/62NT2CeW5rOYu+ACXa0yh5s=@vger.kernel.org
X-Gm-Message-State: AFuF++kaz2CZUZpyB4MyA74pUVUO+ksEYX1n9RK72p33gMm/RMKAtPvE
	eM2XtX+RvfxM1v4tGykB3zGrEZc8fqaKyHqEMF2opEIUHR8oTAW2m7kF4TzjCdRxWDbW+iHYQ7L
	i6jOB8CpEqBld8YI5i+sLlxaHPEMuvFK5t2gq9Z87X8uSL5dJ3dmHFVZx+WEHjmCcvmQ=
X-Gm-Gg: AYBFou0ESRC2vaVWVSmAuSLRTXOYSnplCU8HlH78uOQYQ3L9xbfKND444dkgfZEaQaq
	wW/pl8rGmTcIzIxxjZcKD8uCXK3zyAWTzYjrOebZnsk9kiXbxDq1qvxhQchzAa2+ajmMIm2jlAC
	IsyXjpWxw+GIbBKagw/YH/KiruOfWesHW/ZXSQqOdZjGmaDon1yVo0q8P5oqVuduxVY72ZtxR4Y
	BKUZ8rvyBuh6foBDhqcG8TWe+mjxAA3C19KhSscOzGYddyUeo/pDamdUcioQEg9mYmlsZPiKOYC
	JqfvrfrtWiObR4zmpSyV8Lb3ULXnxpD5/LxeoMOOA7Vus9mVsQOWf4XCAysadKSkG5NizQkLtm7
	jcK5pIzLj7oEtzi23dcWMODHhEfpwXPIGrW+wrRD3J+zJanRAPvS9b4Yque7B
X-Received: by 2002:a17:90b:48d1:b0:398:9be6:f996 with SMTP id 98e67ed59e1d1-39907e07947mr10536668a91.21.1788256296355;
        Tue, 01 Sep 2026 02:51:36 -0700 (PDT)
X-Received: by 2002:a17:90b:48d1:b0:398:9be6:f996 with SMTP id 98e67ed59e1d1-39907e07947mr10536599a91.21.1788256295859;
        Tue, 01 Sep 2026 02:51:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa37fa5sm40641466eec.29.2026.09.01.02.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:51:35 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 4/4] phy: qcom: qmp-combo: Add USB3+DP PHY support for Nord
Date: Tue,  1 Sep 2026 17:50:55 +0800
Message-ID: <20260901095055.42229-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
References: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NiBTYWx0ZWRfXwneBXNKMPCVM
 Ak95oVcTYCHilSJ4ageTHb5mm6MFiL0jH48ZgPIuYCtLTPp6gst4oaKkoewVp7fm82laUo4c1K6
 nbZ82Xd/944cefGh7MgHSZGKuFKBv/zf0ZzoRWRYz6sL1CJ9tZVvujjLbnpCa9OpRzKaTDLj71P
 RbWgnRadpd2KpLavvxJvuW5Nx7HownH1pNp4lOYdHVbJfzi3LqsttBtgCOV/ivFL6jUQ2R0bBSt
 m/qGRMuRCb46AcZDLm3cDtX0AXlMorDmZlXGAAeU8N3Az//egxtC3pVktnjnhyL00Gt2dHII6A4
 X3EArXG/WQGvAZna1jLpHOQXMw2yhP8qpjU6Lrx5ONUpUVQ0kCl17UPiqdhr3azVbWOuMx4ezNV
 bhQnLBcpzDFCo2agD8sPUkcLfsGHBduQbccK66V2YRYSBG0f1SHVQ+BCGeTv8eKu+WJgtdPeMmd
 X6yG/m74amc8rWYLxfA==
X-Proofpoint-GUID: NCdI075DmkPglbzvXEjOmKxX-GXg6Km_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NiBTYWx0ZWRfX3nmmtufeap7x
 dc8NAPqy5seG0ZqzrAlJGbHGUrsB42+jmVSvgveyi6F0uL11FziQdK5pYhEhJiqNJl0Peg9l4VO
 0x3SOvn5Zvja7wxZrH+jkC0RL2YZ8w8=
X-Authority-Analysis: v=2.4 cv=NZnWEWD4 c=1 sm=1 tr=0 ts=6a96a029 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=FLXYr6s3pwBVFqJ0MywA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: NCdI075DmkPglbzvXEjOmKxX-GXg6Km_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010086

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Nord SoC provides two USB3+DP combo PHYs. Their initialisation sequences
are identical to sm8550, but the sub-blocks are not laid out the same way:
Nord adds a dedicated USB3_PCS_AON region at offset 0x1e00 and leaves
everything else where sm8550 has it. None of the existing offsets tables
describe that, so add a v6 table which is the v3 layout plus usb3_pcs_aon.

Populating usb3_pcs_aon changes where the driver drives the I/O clamp when
entering and leaving autonomous mode: it now uses the real AON region
rather than falling back to PCS_MISC, which is what platforms with no AON
region do.

The offsets were confirmed against the Nord register map for both PHY
instances, USB3_DP_PHY_0 at 0x088e1000 and USB3_DP_PHY_1 at 0x088e4000.
USB3_PCS_AON_CLAMP_ENABLE sits at offset 0x00 of the AON region with a
single CLAMP_EN_B bit, matching QPHY_V6_PCS_AON_CLAMP_ENABLE and CLAMP_EN.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 66 +++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index c39ced168d03..de82c7107c92 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2690,6 +2690,23 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v5 = {
 	.dp_dp_phy	= 0x2200,
 };
 
+static const struct qmp_combo_offsets qmp_combo_offsets_v6 = {
+	.com		= 0x0000,
+	.txa		= 0x1200,
+	.rxa		= 0x1400,
+	.txb		= 0x1600,
+	.rxb		= 0x1800,
+	.usb3_serdes	= 0x1000,
+	.usb3_pcs_misc	= 0x1a00,
+	.usb3_pcs	= 0x1c00,
+	.usb3_pcs_aon	= 0x1e00,
+	.usb3_pcs_usb	= 0x1f00,
+	.dp_serdes	= 0x2000,
+	.dp_txa		= 0x2200,
+	.dp_txb		= 0x2600,
+	.dp_dp_phy	= 0x2a00,
+};
+
 static const struct qmp_combo_offsets qmp_combo_offsets_v8 = {
 	.com		= 0x0000,
 	.txa		= 0x1400,
@@ -3394,6 +3411,51 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_refgen),
 };
 
+static const struct qmp_phy_cfg nord_usb3dpphy_cfg = {
+	.offsets		= &qmp_combo_offsets_v6,
+
+	.serdes_tbl		= sm8550_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sm8550_usb3_serdes_tbl),
+	.tx_tbl			= sm8550_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(sm8550_usb3_tx_tbl),
+	.rx_tbl			= sm8550_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(sm8550_usb3_rx_tbl),
+	.pcs_tbl		= sm8550_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sm8550_usb3_pcs_tbl),
+	.pcs_usb_tbl		= sm8550_usb3_pcs_usb_tbl,
+	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8550_usb3_pcs_usb_tbl),
+
+	.dp_serdes_tbl		= qmp_v6_dp_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl),
+	.dp_tx_tbl		= qmp_v6_dp_tx_tbl,
+	.dp_tx_tbl_num		= ARRAY_SIZE(qmp_v6_dp_tx_tbl),
+
+	.serdes_tbl_rbr		= qmp_v6_dp_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qmp_v6_dp_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qmp_v6_dp_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr2),
+	.serdes_tbl_hbr3	= qmp_v6_dp_serdes_tbl_hbr3,
+	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr3),
+
+	.swing_hbr_rbr		= &qmp_dp_v5_voltage_swing_hbr_rbr,
+	.pre_emphasis_hbr_rbr	= &qmp_dp_v6_pre_emphasis_hbr_rbr,
+	.swing_hbr3_hbr2	= &qmp_dp_v5_voltage_swing_hbr3_hbr2,
+	.pre_emphasis_hbr3_hbr2	= &qmp_dp_v5_pre_emphasis_hbr3_hbr2,
+
+	.dp_aux_init		= qmp_v4_dp_aux_init,
+	.configure_dp_tx	= qmp_v4_configure_dp_tx,
+	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
+	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+
+	.regs			= qmp_v6_usb3phy_regs_layout,
+	.reset_list		= msm8996_usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+};
+
 static int qmp_combo_dp_serdes_init(struct qmp_combo *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -5359,6 +5421,10 @@ static const struct of_device_id qmp_combo_of_match_table[] = {
 		.compatible = "qcom,hawi-qmp-usb3-dp-phy",
 		.data = &hawi_usb3dpphy_cfg,
 	},
+	{
+		.compatible = "qcom,nord-qmp-usb3-dp-phy",
+		.data = &nord_usb3dpphy_cfg,
+	},
 	{
 		.compatible = "qcom,sar2130p-qmp-usb3-dp-phy",
 		.data = &sar2130p_usb3dpphy_cfg,
-- 
2.43.0

