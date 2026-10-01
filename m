Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F284D5988
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847329; cv=none; b=MfMTw3uNos5D7kditdqh/VlsIBSeuiHwfI3dKo9nwQXQKborK/8us3o28cjj3ILqBBh2L99yMtK9Ro75+MmZTZTT3siRMztlNY1KoHPjJFxWDNBToWdNEenVYeGgb+wqgPcxI37j1ukI9iNEx/LWyK7zxRVq5ZAh6g0+pGr5nBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847329; c=relaxed/simple;
	bh=8Ik94UIXl/0M09cF/7j5V+Ih2YnaL7Tn1bH6XQgZ8pQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GqivqhdwkmgGjXMKx8paDTeSj+cOmVbEQoFkEeg+DGBJYF0CW5AsmH446+RNaZuFKrXgEB2QJmvUqBr5ozcpwjLlXrNrzRU0WG73GM3CzibFOX7DVUCD7m8NaDu1CLWCqTaiSgGDdM3HUiiYM2rQllz/9T2iSWOWbMZQzW7yepQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YF2oXfSs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hwu8kVel; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YF2oXfSs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hwu8kVel"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xd4K2337306
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 09:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JwSHg4raT3Dkw6LFbknjcwqxCfchq/p2PlFzorw7TjI=; b=YF2oXfSst4P5Jc7I
	luC3QWq00PAmcFpGW6oGgIPg7BX/4z32AGVOGKTWeHiOwsSUmwKcfS1bzak0x9cb
	XtpUiX+65fV1xBwu2rFJkBce4etJandAEHvLG2tdleU8j2eK5RAMqwJoEtpOo5ly
	CBhKUmBRLDBrGPDT7jYyByx7pjGiHvZWQnT0G1xZHyLuXKTys/TWjIO+rygbF8XZ
	zSTYVJKtUpHGmquGh8ZQBN0CMk+phNHanzZS2vFtRH0cZI1/ToRF+CVhC3wynwnC
	DtvjtmJwrKXBD/TruKGbax2zD16q299b/KPMFkjvqwtaVOKfwroZmlVTw8N9QwA8
	0kwZZA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h14n243bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:35:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso4247621a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790847325; x=1791452125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JwSHg4raT3Dkw6LFbknjcwqxCfchq/p2PlFzorw7TjI=;
        b=Hwu8kVel062f9354NK4X0WcVUNyg2TQVAHFpL6ysLME9AueR439CSxRyDZ5K6+TjGW
         FspSr1+YWhWWI7Kqs8bVgxBX5mnW9bCjvClo+RB0VT4zwfCi3GIJj/+bvpM8jAS/uMzu
         cJb034fqj3efjGNzOX4BQQAjWDs75erP9OWv3jrwd4f1vc1J1BuFFHqTmyH4v9mTJ8/I
         WgoPaEyotMyZVrOJrj76TGRkBFhJB90jpX/XleSOPBee7rP6pjD6uOvgVRKZT9PBOfv2
         gpTHGE0QbYpypYuSOvKaCILQtql7tJYysxEWLtVVtZkzyjAD9vVWoWa1+EgvjxBowpWA
         YdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847325; x=1791452125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JwSHg4raT3Dkw6LFbknjcwqxCfchq/p2PlFzorw7TjI=;
        b=FCBpQ9YYLSkgoVyGwpW/s04A32cf5JooE5sjHoFOERkyBDMOWIVv4/yXvb93QXJ6T8
         fEZSSPW6xHbCfN8aXJCZIhiXgfKobnqD6G0EIFFS+LpGfgMK4fTFj2XZjxcTz5KyfVe4
         CmToZ48hxkiVNVR++/ePPvLuvMCBl6gn6VN0lcf4CctMmwRG8P1wX8VbH9Df0hZ3kA3e
         1d7FmZCwvC1XQXdexHhg/b8IB9q2h4GrZi7TIAFtRwpHtaAaiL6K9LyG/2NesPjv060q
         ljf6LfyG4eGJP7pJglst7luOe0AV2//5hl1VRQxMmRJgVIzZvqkv4a+5Msq2o/wK8Exd
         cbfw==
X-Forwarded-Encrypted: i=1; AKwUvBz5APrpjYYourmgJJRGfpHvOCwvY2mdvbFRJgbiYgcO10dVpKTv4RVmSPkWf2nOtWxZwbji52aMM4TC5fU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAG7f1PSlw1DsorfEoY1/XUtWfB0no7Ov18W8q/WoIE3/y9/Nq
	v1lPZxtpYPWpQvSE5Be1sW1BbnvEXi6nUPDwVB4vp8rXgd/DsZIKTyC6zgV/Hfcm1L/NWpBiGzW
	xoB+V2QJOcrrmi3XhCmG6J6VKn7DeFv72olMYKfjwnHSEtlBLRXQ0A2X7gnIDY/nQmbM=
X-Gm-Gg: AYBFou1WrXysk05moKo7MNVelt6OboGudhjwhpxO2WzTVfci6WAQF5Hdkk1znFgRgPB
	XOoIFfrYuy3J7cfvm0BEV1xi14Qy1fidcWp45pxoArFVzBM4dqMfUKaL6+YJmEahfNV51kX9Zvh
	kSBb+OV9uk/AUzbP7C9zEbCeQ0KE6GKniia5vl0Xl0BRPukXUjlbGTm1U1BIu+PErs8xb8cLQYN
	FftvVYf8fKGYmsT/ecjETmB+dULekoyr4hoyH+5R2VQmLD0IAT5dtWaeCYHnsaIMbeUg2Cza/4K
	MZ0DHOmMBOinlD3xt4RhYsaNoL8/WcWl8ZQlHREIABKYcffl3Izvk89RIEk4G8Ww1jONiJVndFy
	DYIQ9MoXXO7WvwU79vmF3BZpOiOs=
X-Received: by 2002:a17:90a:149:b0:3a4:fa1a:2b1d with SMTP id 98e67ed59e1d1-3a4fa1a35f4mr708515a91.62.1790847325271;
        Thu, 01 Oct 2026 02:35:25 -0700 (PDT)
X-Received: by 2002:a17:90a:149:b0:3a4:fa1a:2b1d with SMTP id 98e67ed59e1d1-3a4fa1a35f4mr708485a91.62.1790847324645;
        Thu, 01 Oct 2026 02:35:24 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e54bf4c4sm1152944a12.29.2026.10.01.02.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:35:24 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 15:04:23 +0530
Subject: [PATCH v5 06/11] phy: qualcomm: qmp-combo: Add v8 PCS-level drive
 level tables for Glymur
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-glymur-phy-v3-v5-6-3848c2615d5a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790847286; l=3546;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=Bg7So6W6SSHdhH1ngRtobHeH5BfbMCRmb6ie8ZY7Cpg=;
 b=YQFHPKiMusQDKsQMs5eONpuz4yVhuTl80MO3aHSH0g5cb8eQe3ZGMSR48rYRSYePieanVJDx2
 Ctr41tL6pE7AOkjpDL4Rc2lyUpMR/KzMVtRlI8dmUmtNLjZwrb3c3kB
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6abe295e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pJ9Jp-POzqCVGtXzzgwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX5VRHC9+k305L
 73YLfX1+w+YBh3tw8KuTkZ7++4To3Ft8EBMq2KLfCMcjE+ssgnligSCfLlLIcZSjMxF62RwB8hX
 67uIkhM6IIV00N/vvLgJm78vHsfbv6w=
X-Proofpoint-GUID: fWYJfMpHpbRWQixKYNlO8In5xHOgdFRW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX7XeKm0zQ50j/
 oxzsix/psNfK+cQia/364uG/MSvbXc7GdpMsNPJuQKnydYoG8IKAXrIvCAv9WFDahKEQzGOymhR
 jhVxbbI7rCO3rmJYxoEodzwL80Qr+pBgT4m7+iZxAOi0xzYTUHLQfWNJfCTAjJZO+cFHAQsxXXX
 o24sGHDFg4q8M0ss3EZJLbGsUOSF7spOLY7tS4VaSRyFu17VagshFLih4OMa0CVsOIWqueq3TNE
 Fj/yFINoCgSf+QGgvJTqHasUAVGU1wgD6v7Z24b02xaNmxiiCK3KbNIoTSfzUET2f5mYdlGr0nw
 RhK7AxVo0a72MMLOVT3CqBOJaui+EdNMmlE5hBBS64IicUKfuHNXZ5f9nQRFuFFuKMhK8zXqkOv
 AANhTt7Sc9tbHGlKYDRK6zEDK50Cs8roTaofYuiZaYAYiHr4Gk+pOBh7A0UiR85pYZBNg1KokhG
 NnOM6rKk7y+5zvVXU3g==
X-Proofpoint-ORIG-GUID: fWYJfMpHpbRWQixKYNlO8In5xHOgdFRW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010038

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add PCS-level drive level tables for the Glymur (V8) DP PHY:
- qmp_dp_v8_ln_drv_lvl_hbr3_hbr2: LN0/LN1_DRV_LVL settings for HBR3/HBR2
- qmp_dp_v8_ln_drv_lvl_hbr_rbr: LN0/LN1_DRV_LVL settings for HBR/RBR
- qmp_dp_v8_pre_emphasis_hbr_rbr: updated TX_EMP_POST1_LVL values for
 HBR/RBR

Add ln_drv_lvl_hbr_rbr and ln_drv_lvl_hbr3_hbr2 pointer fields to
qmp_phy_cfg to allow per-platform PCS drive level table selection.

Wire the new tables into glymur_usb3dpphy_cfg, replacing the previously
used qmp_dp_v6_pre_emphasis_hbr_rbr with the corrected v8 table.

without the correct v8 table following issue can occur:
- Link training failures or instability at higher rates (HBR2/HBR3)
- Incorrect LFPS signaling timing, potentially breaking USB3+DP combo
mode entry/exit

Fixes: d10736db98d25 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 33 ++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index ebe2e6136f7a..5446b8333a1e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2464,6 +2464,30 @@ static const u8 qmp_dp_v6_pre_emphasis_hbr_rbr[4][4] = {
 	{ 0x22, 0xff, 0xff, 0xff }
 };
 
+/* HBR3 & HBR2: DP2_LN0/LN1_DRV_LVL swing settings (PCS level) */
+static const u8 qmp_dp_v8_ln_drv_lvl_hbr3_hbr2[4][4] = {
+	{ 0x02, 0x12, 0x16, 0x1a },
+	{ 0x09, 0x19, 0x1f, 0xff },
+	{ 0x10, 0x1f, 0xff, 0xff },
+	{ 0x1f, 0xff, 0xff, 0xff }
+};
+
+/* HBR & RBR: DP2_LN0/LN1_DRV_LVL swing settings (PCS level) */
+static const u8 qmp_dp_v8_ln_drv_lvl_hbr_rbr[4][4] = {
+	{ 0x07, 0x0f, 0x16, 0x1f },
+	{ 0x11, 0x1e, 0x1f, 0xff },
+	{ 0x16, 0x1f, 0xff, 0xff },
+	{ 0x1f, 0xff, 0xff, 0xff }
+};
+
+/* HBR & RBR: TX_EMP_POST1_LVL emphasis settings */
+static const u8 qmp_dp_v8_pre_emphasis_hbr_rbr[4][4] = {
+	{ 0x20, 0x2d, 0x34, 0x3b },
+	{ 0x20, 0x2e, 0x35, 0xff },
+	{ 0x20, 0x2e, 0xff, 0xff },
+	{ 0x22, 0xff, 0xff, 0xff }
+};
+
 struct qmp_combo_lane_mapping {
 	unsigned int lanes_count;
 	enum typec_orientation orientation;
@@ -2552,6 +2576,10 @@ struct qmp_phy_cfg {
 	const u8 (*pre_emphasis_hbr_rbr)[4][4];
 	const u8 (*pre_emphasis_hbr3_hbr2)[4][4];
 
+	/* PCS-level drive level tables (v8 / Glymur) */
+	const u8 (*ln_drv_lvl_hbr_rbr)[4][4];
+	const u8 (*ln_drv_lvl_hbr3_hbr2)[4][4];
+
 	/* DP PHY callbacks */
 	int (*configure_dp_clocks)(struct qmp_combo *qmp);
 	int (*configure_dp_phy)(struct qmp_combo *qmp);
@@ -3450,10 +3478,13 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
 	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v8_dp_serdes_tbl_hbr3),
 
 	.swing_hbr_rbr		= &qmp_dp_v6_voltage_swing_hbr_rbr,
-	.pre_emphasis_hbr_rbr	= &qmp_dp_v6_pre_emphasis_hbr_rbr,
+	.pre_emphasis_hbr_rbr	= &qmp_dp_v8_pre_emphasis_hbr_rbr,
 	.swing_hbr3_hbr2	= &qmp_dp_v5_voltage_swing_hbr3_hbr2,
 	.pre_emphasis_hbr3_hbr2	= &qmp_dp_v5_pre_emphasis_hbr3_hbr2,
 
+	.ln_drv_lvl_hbr_rbr	= &qmp_dp_v8_ln_drv_lvl_hbr_rbr,
+	.ln_drv_lvl_hbr3_hbr2	= &qmp_dp_v8_ln_drv_lvl_hbr3_hbr2,
+
 	.dp_aux_init		= qmp_v8_dp_aux_init,
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v8_configure_dp_clocks,

-- 
2.34.1

