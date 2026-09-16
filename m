Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889554D0CFA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583499; cv=none; b=YyH0mnTHe7U5lc+PljVtDnpywKOCyZrLUwSeP/XuUtThoVoNp3jZo6N3mKdsIhS1gWaxu0SBhas4DHQ2WfGBSzUvQtOe8N0ec4FcOiUYJ4XxvgJOOaNvgCFMqCrMfyFdsCVRHZm3D9fZNewJh2FbMLVgzh7d7/HA09R24hmgAF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583499; c=relaxed/simple;
	bh=aEHAQHfBVivuua/vFIx06acVPmCqKszNmBVF///mHO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K1VAKAK3gxJiHUpu0uKuMDJcb1P0ngeh7NS9NOI6gi+GI29xsc6ADUN6m7cP8pZSgbERPhQZSDw/MozdDkQ6UTE23XUDXBuxGPoXxHYx+mfy2cKYt6V7FFlhvv3Be9FSXPhFSGnbBrF3ePstu6wlrTjsS+DUFna1kMyc5QCWXp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UieW6IA9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R9TwpD4q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UieW6IA9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R9TwpD4q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFf6ge1855975
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NO7b42YBwSn1pgx8rjlpajz93VqzR7OjhoiLHTqdiDI=; b=UieW6IA9653WC2f5
	VUWRAfJCYzXWz1NEXsSBpmDoz2iqz9/oH8VGUgeUxhGxFJ3TFO7XML4GbJ+t1BUG
	BR/0stofY60MzU3c5+hUgtRl5hrhVoLTARZXCFnIk4bLHiG+G8/zXgurzxQ2Ohdt
	+17PdWwpnS2Pg11vEOIu0XSJawd6TZXmQzpFwPCMnwxhKc7bAOt4q7NIVTMIeua7
	dStJHuzdmg/Zc3Lc1NG+r38cXZqTbbe9M4dWizsO5Y1Vay6z5KcFNRVVygOJfQMO
	j5M2HaWZGNBwUGojRSALeph7goCvMmwHSSkG1YAoPdAXsLjwEJjqrAMYpEHXccVs
	oNkpYw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3tkeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:31:29 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-80668533f9fso3051a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789583489; x=1790188289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NO7b42YBwSn1pgx8rjlpajz93VqzR7OjhoiLHTqdiDI=;
        b=R9TwpD4qJeXbRMMbuFo46XnCnOHhjLFT+J0p0inRO9as8pIqgqKgh1EiDlj/+ZCnuU
         QJY0ggkWC/yr1wtiD2tmbGR9Rd99vbakB1noaLGL2sXLZwAYmPf79lpC+hBsP5TpWhy6
         s4d/mltwM0AVtWXZIi7PB8+Gc5f/jSjGBHWMIsYIdpFBCPYmKrblAzf7/zShhXHDpefB
         EyFIOQcoMjQ/0qLW9hsc5JOxnCgqxqxqOPK0jeUFMWg8WZLIGlGs3rWPqLC+Bw4KqO9I
         7ooR+RYNcMBqNmPsKcgvdRl0Z+DyQy2/g8koSBZZq7KP+82DuZ9mz03T5mOpLLGQvkBn
         7zKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789583489; x=1790188289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NO7b42YBwSn1pgx8rjlpajz93VqzR7OjhoiLHTqdiDI=;
        b=Ulbrt6dwaMJMGiPph0kihqemTwjh3o/pNVTZkyfYZcpjm+uW43WJqP1w6unUIqIvKf
         DrRXXXBxFo9NNWbdffWf39tZbFPDN+8Cf1U8oNLV1zTntU6B+YZUMOVtU3M4IFnXJcr5
         LaYiIL/fNSUN/7kDYpNT9k3iOD5wiEzPf9EmFopJSJhkwz1nykkzCnFrJ2ocvKxl1Wbe
         ZfYg5jgnV+uwrgldQZcGa98l1ppxkzpcf4usRUTVLBW1J/J2UTTnn+GfxqHgNAnnjNPN
         RLxTMIa8fzPcF/1blb06qlasxeOSGZG6Xoc3qlBIiFZ8xzrlgEt0XIzd02NsHE9vJRtT
         6ggA==
X-Forwarded-Encrypted: i=1; AKwUvByQRqFx9q72GZrVueu6l0RTQpipXBz4MYQGdJER6K+mHKmTaiw6JRxAvo8syYypqMaDzJiCv/fO1vWBv60=@vger.kernel.org
X-Gm-Message-State: AFuF++lPPG1QN2JxQ0GVfZbcXBEpS24F39z8G+QGFb/x6xV+GPWaAKI+
	tHm3N8R1JSS9OoUXhOiEvSsGq/zl5M7FC+NxR2tljberwC0pCfmpEk1daa9Ss9A8nJVt0V+aPFW
	Ym6o/wzc8tre4R7PEYi0n7X8mTuRpd4YSzhdKcinLBTIh5fWVSMvU7tlu/nJpidDfal2DJEQN8I
	U=
X-Gm-Gg: AYBFou2SSqAfucg9Rpt/uYG4N2gY7XZCVrc1oTrusLBzd+jXztzIO0kdJv5shdT9S9d
	04BiIC5qtV/nuQNSBxi3b3LbCYOYzUsq2HE/rd/9FVplqHfzM0LkRlI6VjypT5EddzXmN7/A4yW
	/myEWv4Zxc4hL5hdwgoWz/A/LzoqZu3u/d1X49/Pm1tFV4U8DG1GJQ5KBNSGIjbBii73Mh6dobU
	7qOeMJMNOrh//wK34S/y0CaixJiux48kyLMa4AcdwNdpcKWuxVu3RB6zoIvk6OkbzoICb/YZlZI
	lQQCljlbOvWsAlnE4vSMMZbTLPvSWfH4zSSz5z53O5af88cPI0ZeUQzWIiGfVQ5Ipk4F2egmjto
	tjgq00VB/PHa338ru+SCOZ7VwLig=
X-Received: by 2002:a05:6830:638b:b0:80a:2bd7:83de with SMTP id 46e09a7af769-80b2f7d0cfbmr4268203a34.27.1789583489077;
        Wed, 16 Sep 2026 11:31:29 -0700 (PDT)
X-Received: by 2002:a05:6122:3c42:b0:5c9:a60b:e5be with SMTP id 71dfb90a1353d-5c9a60be881mr407924e0c.14.1789583477604;
        Wed, 16 Sep 2026 11:31:17 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf2797csm8625416f8f.16.2026.09.16.11.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 11:31:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 20:30:53 +0200
Subject: [PATCH v2 3/3] phy: qcom: qmp-combo: Add USB3+DP PHY support for
 Nord
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-nord-usb-phy-v2-3-2c8461bb30e6@oss.qualcomm.com>
References: <20260916-nord-usb-phy-v2-0-2c8461bb30e6@oss.qualcomm.com>
In-Reply-To: <20260916-nord-usb-phy-v2-0-2c8461bb30e6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5341;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=aEHAQHfBVivuua/vFIx06acVPmCqKszNmBVF///mHO0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqquBpbyie065QQ6xUUU1da4CM8Qm9YBTRuxl9q
 1Fi8t21hNeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqrgaQAKCRAFnS7L/zaE
 w/qiD/4mcX8AE7ot7L0NMUT829zd+LzbU+Emq9E2J3XKvbENIsbDHIcHMYdIxWA23AugQNO/Q2B
 Jd78I+8S8CFfxcUdpdx7PK47fxIWrOy1VvOAgfl1Kt6uHVWrDA7zsNjpmSQxeAlWLJbLqFIRidq
 oVGDFIGjSxLVW4LqjZbVtlY4v1jvH4utiOh0RllC+ec7XdEXyexuVSrqnwlqK7F82Ywkn7sD1qo
 clNao6tJfmvAy17qR0MIRQ3tnCA+xxvs2TiI98GqsRhgh6QTHJ0V/+7uuzJfX7bZEs9KY88Gx1N
 JAa6o33GdOb2ts7SOSIC/NCkLQ8fs8gM4Xe6Ra7GvPMNYPTZ1M3jjLIHncVRHQG1cEazJhRccCT
 NMgg7twwmzuA13UF7mY2LnZ6mGFXbvc356xtQBwAt8S4pzRCPgzkPobYr781whj+WH5ElpR9ax2
 CIe1GIll7Xyad27eQezHJZGY7LULPz+3PomENXPUgDf3qFWPbPIfXQdOLv53Xx9vP6TTWJ//jYs
 HoXhqM6LijPfNt+yolCZ14QtA4uyilweDBFwAenvak9qeWcl7DkvbXsGk28SiIX4Mxgc0HO6xoK
 lXxBCF0xuWixGoKagURq8O1XJ/WphI+0TrCs74saB5G0eFM51wohkp8zgCVb8hftKcHbRnA+FIv
 JIrGG5gUjIcLA4g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI1NSBTYWx0ZWRfXy5wVj6BD0En0
 RzaDyQwR4EYbDO87TykN/5yIvHx5BrUBxE3/t+S1/D1ehJLTGyEiB9KeNvtGOPX+3Tg6Q+tXK4I
 32k73OZR8ZBt66Jrq3GZX4g7p176ORRPeD3pM+IU+KBcquzJO7zkORmlWO0QPyp4V9ioj3//BNQ
 InoBrUWm8ronFFYQFK3zFCWgQYstRQymmhcKTwiAaj+o4n5ff8i845JIN7VWqEp6CMhXZ26+mdZ
 lAwm3bV6lp06W+0zqc7SnNWK2+DqKNjSA6D5cCCLnthFA62p0fPCzxu5IDLYNxHAfFsujNlXo9G
 DCyo859lD/kOdvzT7fptu5nghsxNDt3C8bumrLzZAbJsm/m1wRTxem6tSFfNE6p3RTxaWarI00q
 D9P4A+U9kJEviInrH3Kx/5AAEbhFsirAWl8V7bY8E9T4y164/Xy6WRT3YhhJ+PrsBDHz/th76Cm
 rU59mUiWUPu0smE90kg==
X-Proofpoint-GUID: oU6pjp7svetLRRyuzI7iL3EhvyPJ82Jv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI1NSBTYWx0ZWRfX4Gf5LBFMnlAP
 zYHxc7gAtWIaDmHvToAibaFxqehNmHfzlO3upUpcWlFX3DdBWKFbf1Z51sTk8GhbbFObruvKLHy
 SnocCqwJwaXp7jzMx7FLMI7i2lOzwqs=
X-Proofpoint-ORIG-GUID: oU6pjp7svetLRRyuzI7iL3EhvyPJ82Jv
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaae081 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mRaulJff6YCFnxtsk_cA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160255

Nord SoC provides two USB3+DP combo PHYs. Their initialisation sequences
are identical to sm8550, but the sub-blocks are not laid out the same way:
Nord adds a dedicated USB3_PCS_AON region at offset 0x1e00 and leaves
everything else where sm8550 has it. None of the existing offsets tables
describe that, so add a v6 table which is the v3 layout plus usb3_pcs_aon.

Populating usb3_pcs_aon changes where the driver drives the I/O clamp when
entering and leaving autonomous mode: it now uses the real AON region
rather than falling back to PCS_MISC, which is what platforms with no AON
region do.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Assisted-by: LLM
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 80 +++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index a4f130fc33e3990e4101a710803bb4d0a0ed077b..c4e88b0384cb557f88f5af233f0568c7a93ab9cd 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2356,6 +2356,20 @@ static const struct qmp_phy_init_tbl hawi_usb3_pcs_usb_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V10_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
 };
 
+static const struct qmp_phy_init_tbl nord_usb3_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_TX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_RX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_OFFSET_TX, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_OFFSET_RX, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_1, 0xf5),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_3, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_4, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_5, 0x5f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RCV_DETECT_LVL_2, 0x14),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_TX_PI_QEC_CTRL, 0x21, 1),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_TX_PI_QEC_CTRL, 0x05, 2),
+};
+
 /* list of regulators */
 static struct regulator_bulk_data qmp_phy_vreg_l[] = {
 	{ .supply = "vdda-phy", .init_load_uA = 21800, },
@@ -2720,6 +2734,23 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v5 = {
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
@@ -3424,6 +3455,51 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_refgen),
 };
 
+static const struct qmp_phy_cfg nord_usb3dpphy_cfg = {
+	.offsets		= &qmp_combo_offsets_v6,
+
+	.serdes_tbl		= sm8550_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sm8550_usb3_serdes_tbl),
+	.tx_tbl			= nord_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(nord_usb3_tx_tbl),
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
@@ -5621,6 +5697,10 @@ static const struct of_device_id qmp_combo_of_match_table[] = {
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
2.47.3

