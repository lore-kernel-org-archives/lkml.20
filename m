Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD50550DCB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876111; cv=none; b=TPYYD2UZ0fxYUNrzwwd1Xz9jc1c1ZesTn4Esv6BPUqKgUdsZHGYnzqd9Rp5YKW8z6m6UThyQ6x3PfB1FTrxPfYVOmVPD2+bH/lL0ssBffnv0GlcKXqSpk4eS7gGDcJY1iFmepsVGSZ1FuqgSefz9zNi8zFDIY/fTsO0CXL7/Ppo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876111; c=relaxed/simple;
	bh=c727mbtGqmtmQMNx73/W6A2uiQzCoMeEd7VMbbtW76A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JRCRdtWmdJ1V5Gg+n4fVWDX4mbAO1jGiQuetCMO+BD5FW1u5xbil2IlvWe0DbQ5mYpO6v437WRwnG5kfLBMx4wAz3aesel31ECOI85vyL3dvvM2MONJifZ6AJFSkl6zm6rZHTYg1qsdl12wwHWGJeBw8a2Mbe0vXXUIPN9hhzzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HquavSjw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XfXzmi2p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HquavSjw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XfXzmi2p"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688D1m1F2412014
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 14:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/mR5Kpg24q3UNKuC+L1bOVHegCCGwSaQQL7AVGDOXk=; b=HquavSjwbOR+LUgt
	hN1pX2rPn9U/oDYMeprll3+b2tqidLbiVjby1sfAoaXWKIJZrwkLjXDfFzovdLd5
	/uzrkuE5iYXkgh+nulKGO8YUiTqa75TmMRQVpYqvDoJp8fAx8QGt37GmikXOqURF
	cEYuq6gWRUX0A42LNNu3dV102qqni3VXn7E52Fia8hXBdzCvaarrp7cqwDm7Hmql
	cjUnXKDji7rmf8S8lOC89yTS+J7yn0sVxqUyOgSqxZmzO3m1zMnseXUM5cfeSFfY
	0PJPjW3aBoT7jwySnldBS5hhOwPfMX0ZQnOILqozJwfalknE3iff6R6d2qH79D68
	8MYQ/Q==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjjvug8uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:01:34 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e9e0e71e05so8594491a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788876094; x=1789480894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/mR5Kpg24q3UNKuC+L1bOVHegCCGwSaQQL7AVGDOXk=;
        b=XfXzmi2pc+KwNDP5yakq2X0rXEcfRuTeH4Iib1E0cskKDwp5OWRbOnbF/wX0IZ6k6P
         qu9ql+Ng/31BpdZIGBpeL3xraaoWLQb2RafHCMK5hc7/iCMYbeFlOUex3Wlvf56yBRvx
         YGRwbVVMQ9Q85ALYUypsg8Wt9P8h3E2yK156Ax0GuA6t9ElGRlw/SuhJEW9opo7I+cUe
         hrsKiX9x4jgtX9YthyXWjJzA6oaw+DlBIzkcVPYSYYkyFk+Xd5TkmagaLXdabAsNgz9+
         LpNiDIfsxLEdrLnv2dLx/TvuItHkrj2vpErQqv9fclJxQwZQCEB9Do1I5X/rfky+VoUf
         gJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788876094; x=1789480894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/mR5Kpg24q3UNKuC+L1bOVHegCCGwSaQQL7AVGDOXk=;
        b=eAsCS7k8wvnmdLdYtN1k415g51SMUg6Nx7S6G+l4S99rxD5cOp3GR6m8MwLA0qo1G4
         VoQ2f+sGfvgxFWSdHID3ZHY+kMHuAXD6May65qudlIJ0g/ht1Kz+s0uPh05YAGED8y6T
         pEvvvvuY3+zIgLT/SAdtIF9M9R7TjzIRTMHyjFMgtvRJfN1MXHQNQ09RY+1ekymnCp7W
         qZdzfcAqbgVxYWD/MgPxlt88OoJhkS3jCuGPpRSoLQ0Ycl4rQFbGvRPN1RHzvefXYCVk
         UqdFuRLZoYy2dttXKc7kPMR7KuHbceEQNTDDPo8UjKTiWO/+hxbNA6yIswiQNnBF2WRN
         vMVw==
X-Forwarded-Encrypted: i=1; AKwUvBymfg0DKqbDFHwfoIuWYpKXxcI45X3UWtIZyovfVbIK3p4YCMdycct9UzuDB3+lK7rzoJofOtpDC7okRMA=@vger.kernel.org
X-Gm-Message-State: AFuF++k5It0gcWB/SSi2Rum8M3uxMiJ2q/aaT7xCZKsQXnrmHymTDMm6
	+cFmE8PiAwQEnmonxkye7S3NuH5mOopS7TqP9bZsKpFbSM8sH5bIwC2hcOEfYKr8YsPr4XohEYo
	kVL/l6pcO0Y46yzjLC5Y/uqQJHT02bOV3Rff+JbHIe6odH5Rmg2NsnkSFZAIeNlFeNZM=
X-Gm-Gg: AYBFou2n7WwK+9S7Mm09xf0VgmlLxQ4b5nSodBsUm1CV5jXKfyEiZ3jEX1hZZs+3JJd
	J8rtuwv1qmilyGoXrK/lZXn2GuCkMLfQg4DgDgrmtDazvGWZ4J04/HKP+TEVoMbkM/oZXfIxEDT
	a95gWm7XcoEVISe1w+tK/HObQoQyqit7aNuyoJPG36kpQlBmgvvxuyjulPh3wON3beWBlcjIR/e
	dnx5J9T7fQ5MSigroOCaGZeMsM+oVFZeILlEDJAp5FiBJ6B/biImnsucmku1u0OqPImB0+VFf6X
	VkSs0XI4ym3JyI8QewtH9CTshIu0PuBqEgFh264KW2atu4EYK4Yo85Ij0keF9d6qNjjpzCXAYJ5
	7WgoZBeBidNLZNx8RGmmvleqBdbE=
X-Received: by 2002:a05:6820:1c9d:b0:6b1:c6df:868e with SMTP id 006d021491bc7-6b6fa3ddfd4mr17217606eaf.13.1788876093641;
        Tue, 08 Sep 2026 07:01:33 -0700 (PDT)
X-Received: by 2002:a05:6820:1c9d:b0:6b1:c6df:868e with SMTP id 006d021491bc7-6b6fa3ddfd4mr17217527eaf.13.1788876093064;
        Tue, 08 Sep 2026 07:01:33 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm57506667eec.16.2026.09.08.07.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:01:32 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 19:30:57 +0530
Subject: [PATCH v4 4/9] phy: qualcomm: qmp-combo: Add hardware-specific DP
 PHY config fields
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-glymur-phy-v3-v4-4-ff22e5150538@oss.qualcomm.com>
References: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
In-Reply-To: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788876071; l=7393;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=s0NCoMqwgDTMHYa34sPnu4vrchO1ye5QcjKsdOKSeu8=;
 b=Ve9IPWcBWSyGHkN15hx2BYH/mmkCPVk8W/Osy0cyG33guvbaC+qh/d9P84Esqxkjs6Br8MOSH
 P6n/iMl4W2tAGV2FyQBSWwYsy/Hn1btUh/v9mcuHevbNRz71Hg1WaL2
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: -Z5Me0tCjxnCu3RMp9olJnhqgh0sT9FL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1MCBTYWx0ZWRfXy2vmpHNcoJFE
 kKojP9ayMorJ2k0seeMy0HJiQ3BAj9NetLA5dvXx+FOW2K8Tp6zFPu2ezikEucrMs75DiXNcPwW
 vqUEP8J7GAaaRqTT/+4ztle1EV3JtVpV2MQno6JLkUxAwgQNxmdpXQhfoNskadRqYwsBKF+kgpt
 smaYaHeMVhGmfuK9RtAaJ5trRwcoCodpewVYa2HgFamuVuBZjyaGwtZ6xzqMYR1wQOfhzh+TnuN
 a/GPHaC15F1ohAHNc73OYkbkis5n5r0baecJBquFFO/ImSixdvIyowJqYPzkPBLaAR7lqoq4lx5
 TY5YnuLWJwOAPhDwDkGxi93rRr2SXniC9C8c0CokxXLNAM4bfAWD7B6MTUXrIVXjiH6ztlHALeE
 r7CfsY7fDBN0xFUNWLaHtQ8n70JWmsI3tXhX2BJmQgH/2PKYOL/ZBCQLyHI8LP2nC9gjwKFSvTr
 oDX82HsNUeJqM9BubFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1MCBTYWx0ZWRfXxA0s3TYK/A5M
 8kFtU7lBJnfc6QWA8qIUhhnt6fbjWT35ULLiGbGAo0dfkswzizUTuMPThymdbXukw8cLFZ+2OL7
 KVgn3culyQsdOdgvfkCLZUodIRInNEo=
X-Proofpoint-ORIG-GUID: -Z5Me0tCjxnCu3RMp9olJnhqgh0sT9FL
X-Authority-Analysis: v=2.4 cv=X8hi7mTe c=1 sm=1 tr=0 ts=6aa0153e cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ewTIzfVZd68T06PS6vkA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080150

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add dp_aux_cfg2, dp_phy_cfg1, and dp_mode_ignore_reverse fields to
qmp_phy_cfg to allow hardware-specific DP PHY register values to be
specified per-platform rather than hardcoded in the configure functions.

Define named constants QSERDES_DP_PHY_AUX_CFG2_V456/V8 and
QSERDES_DP_PHY_CFG1_V456/V8 for better readability and maintainability.

Populate the new fields in all existing DP PHY cfg structures:
- V456-based platforms (sar2130p, sc8180x, sc8280xp, x1e80100, sm8250,
  sm8350, sm8475, sm8550, sm8650, sm8750) use V456 constants
- Glymur (V8) uses V8 constants and sets dp_mode_ignore_reverse = true

Update qmp_combo_configure_dp_mode() to honor dp_mode_ignore_reverse,
so Glymur can bypass TypeC orientation-based lane reversal.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 44 ++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 16ccabd945f7..53fc1d1e8494 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2478,6 +2478,14 @@ static const struct qmp_combo_lane_mapping dp_data_lanes[] = {
 
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
@@ -2541,6 +2549,15 @@ struct qmp_phy_cfg {
 	int (*calibrate_dp_phy)(struct qmp_combo *qmp);
 	void (*dp_aux_init)(struct qmp_combo *qmp);
 
+	/* DP PHY AUX_CFG2 register value (hardware-specific) */
+	unsigned int dp_aux_cfg2;
+
+	/* DP PHY CFG_1 register value (hardware-specific) */
+	unsigned int dp_phy_cfg1;
+
+	/* Set if DP mode configuration should ignore TypeC orientation */
+	bool dp_mode_ignore_reverse;
+
 	/* resets to be requested */
 	const char * const *reset_list;
 	int num_resets;
@@ -2780,6 +2797,8 @@ static const struct qmp_phy_cfg sar2130p_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -2916,6 +2935,8 @@ static const struct qmp_phy_cfg sc8180x_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -2962,6 +2983,8 @@ static const struct qmp_phy_cfg sc8280xp_usb43dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -3007,6 +3030,8 @@ static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -3116,6 +3141,8 @@ static const struct qmp_phy_cfg sm8250_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -3164,6 +3191,8 @@ static const struct qmp_phy_cfg sm8350_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -3211,6 +3240,8 @@ static const struct qmp_phy_cfg sm8475_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -3256,6 +3287,8 @@ static const struct qmp_phy_cfg sm8550_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -3301,6 +3334,8 @@ static const struct qmp_phy_cfg sm8650_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -3346,6 +3381,8 @@ static const struct qmp_phy_cfg sm8750_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v8_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -3391,6 +3428,9 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v8_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v8_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V8,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V8,
+	.dp_mode_ignore_reverse	= true,
 
 	.regs			= qmp_v8_n3_usb43dpphy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -3539,7 +3579,9 @@ static void qmp_v3_configure_dp_tx(struct qmp_combo *qmp)
 
 static bool qmp_combo_configure_dp_mode(struct qmp_combo *qmp)
 {
-	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE) &&
+		       !cfg->dp_mode_ignore_reverse;
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 	u32 val;
 

-- 
2.34.1

