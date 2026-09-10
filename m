Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F234F3C1F5B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021265; cv=none; b=UH+qZczef5bTqbwETVpLDglcm+5YBp3z1adQnD+o7ut33uCuJjNJBp/R/Q+F6OzEUYjy+CiPXPIe3Bp+30YD3HTxPW/thg97qR1g/woSeb8MN/3uA5JSglNpMyGw32FeoAYcREYXxCKzVPOw4u9tYUt8M9+zswoS3IRPp8aDxdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021265; c=relaxed/simple;
	bh=wwfJZGv/hTuYt9RLOGbzFJnWDVrBzY+HLZdIIf2AZ6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uzge5B+hdvYXSdgzWGSS246LziHVhXn1HTeNM9o0kDVjii+RmqOnVhv8oEwRkGhufY/qf6PkYuwQzZ3IGd+gyYk7KyAXXYQUrnf0EFE7C4s62M08IMvZddhnOGRkg3E306B9KaPxWFz45o470Vwc3aI0nwtnejvu6nr4HnhIqsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DisahsTs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bKmx7INy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DisahsTs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bKmx7INy"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5H2LH4059860
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2cAKJH1jsDQk8uyFatdLABvegUQEk65JuqJ3UMhtbG4=; b=DisahsTs4N8B9T2x
	GgdvXmJAZs7/rbbYikj/sm2o7gMbdy13gM/DjQJWnx9/32htnSoWhUbfixyPWSaJ
	YhmeKHTSZkTztYZ+bXnrtjTfV8KUdfy4NLkkcfuGcKJycGimTEtOYYyikks1Z5mu
	C7E4TSae3x8B6kAi4DKe5my25BcchR90gzjuiGdfbgOe4EjacIve+lVc1i55q4Ht
	1OKqkYhtJYpSBQLvEfxZGmggVqPRWUAakCZZwM3EdoltnRGbwKHPF7o/AWew4sB7
	jTKaJwlZCVqVJbQ8O0WNoBxhptr83w6KTFlpmWb2uyzSTlfleQ6zPRAgTx2PY4ke
	tV0z8g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfte25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:20:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381250979d5so8337151a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789021257; x=1789626057; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2cAKJH1jsDQk8uyFatdLABvegUQEk65JuqJ3UMhtbG4=;
        b=bKmx7INy2FdzWqKYl/zasz15H5VF7HMhyOwCLmZQh8H99OYUoSfqz/lJhHnbTyppHY
         VWAdSl2GXgYoWfBTdz0uyhu8qwQiYvmy8JfktENAL1PS68sJwKo+DOrWzP2uC0V+tQ5+
         KjywOgIy57r49ukRyFNcKJ8LJJh4lI42Xd5v4HCHvR721f5Pxv51RLcVQd9YBs6LV3Ha
         CU1HP0Ab3/rS7XWBwVeLXpFpuSm/zZ/s9y0OGzHoggl6RJcDHHyHN3aHo3mWc4P5SGhk
         58kUPPgT5ieSZV4dvir4HYP/6igqnAkCTTWw0U18H61/tu/uZ0077moJ43Z6DbFxutF9
         Ch5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021257; x=1789626057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2cAKJH1jsDQk8uyFatdLABvegUQEk65JuqJ3UMhtbG4=;
        b=Gq5bNFlVyNf0sYLIqRZvPqOU084suwPGU5MvZ9/nRxYud6VB2l+H2QQvTyu2F+Llb+
         7CZlf02Gad5XEC4yQzGJ7bBAW31ZZ+z8qvXrrePkqVazAPqTbdtvC+iFMAt9rmq5Gqle
         KNKsDGTeehp8Hrudrb5NErJX4vluThSF1MCesY677gN9YSVZCEqKHL0LKCdsmZCXNyQZ
         PqXWUGa66gdFoABfZs0Kcq5nSsUfi94FYzfi41CRiVZAbagj1eapD8FO6+EPgA5tjdEV
         kLELmNXd5mk1kVdpTDwZ5IGCq8FTyC1rlP+hL/zMdFAuKVi9mV98cPRL2ukPx4JqaFAO
         BBHA==
X-Forwarded-Encrypted: i=1; AKwUvByyCTkWNppej4gchonQy6AdnqVKAl2m9mskANGNYlaT8QOnItCF7kLhBGth7ENv17I8RHixypvtMA3xoHo=@vger.kernel.org
X-Gm-Message-State: AFuF++ns1XSNB3mh/PArz+3OakxE4SsD/V0jX9d+36cSfp6S7ImdNj2l
	JRQnoaBpOCxMldnMJoSqbdQRGprCXE37r88M/Gl2QGCB3cLdE372QXpK+5wDIbjKI4mxMS5o5EN
	vZHwjjlPw4tmMsKsoF5xhp9J+TKdtEvNU3R9p4KpyU4F3Q71RXHo3JeWB+Hp4BHrx2+E=
X-Gm-Gg: AYBFou0EUwXBOWQ5gMSYd93toZdfuYi6P4M366Vvmvk4br6TqFEVGupXEw/+am4lsPr
	tS+1jXu2E4S2zo0n+QwVLvd0ZvKnoWjbHgUrTOJ9/K5DHH31+YOFLPx7XYzTM0P8iCILP/WLJPq
	kDqJ0KkXRiJ9dTv2e1iPgyOKg+MfYWoAZlQU09U0qlxDhOoDmwzi55zbf5dJ46EBmuB/vDwcXfk
	zVjLCmkZC7KQYMAd4FDwun/BdYo/VVnxRJ/8ELebJK9k+n8NXL4988V70a28ZXDQDlnA9B71Fp4
	tuvSL2Sz/Rc2+E51Cc7YDXvt9UnUFq2hqCr2vVPgNmyxtk+xXDTpVmZBdCc078m6dLmP5A8utgK
	c3qiLrllD4YN8RXyV0MCZoKhz8MCDh0SvTPJq
X-Received: by 2002:a17:90b:5243:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-39b2614df1emr59401389a91.5.1789021256338;
        Wed, 09 Sep 2026 23:20:56 -0700 (PDT)
X-Received: by 2002:a17:90b:5243:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-39b2614df1emr59401320a91.5.1789021255852;
        Wed, 09 Sep 2026 23:20:55 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm54709946eec.30.2026.09.09.23.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:20:55 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 11:50:15 +0530
Subject: [PATCH v2 2/2] soundwire: qcom: add EE-aware register layout for
 Shikra
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-shikra_soundwire_support-v2-2-f98c9a6ea1e1@oss.qualcomm.com>
References: <20260910-shikra_soundwire_support-v2-0-f98c9a6ea1e1@oss.qualcomm.com>
In-Reply-To: <20260910-shikra_soundwire_support-v2-0-f98c9a6ea1e1@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789021241; l=9035;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=wwfJZGv/hTuYt9RLOGbzFJnWDVrBzY+HLZdIIf2AZ6M=;
 b=aMlR67VMW06hbwjN6slAeqjXYEQNhryp7AflTUs1RvuCoHkb2uu+KN/B1Zfd9JKkBVqcPZWcB
 TxXss/4hK81AVgleSsPP8QFVhlY7n/cXlRL47QO8w5+8zaZg3RUJxBq
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: 0fbOie5qnTg0s8Pu4KufFczxoMhzjeXC
X-Authority-Analysis: v=2.4 cv=GNqdgeNK c=1 sm=1 tr=0 ts=6aa24c49 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=6zcml--_J13hLvNke2oA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 0fbOie5qnTg0s8Pu4KufFczxoMhzjeXC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA2NCBTYWx0ZWRfX2+IWESmmHvMK
 mbAWIlbRa4qFdb94NfjATX+3sYZRkIEdrgIchSZEofV2v/48afgQbqcg5Ayjg/8wBJGWs+9EnRp
 kYM/ifPkxPSJD8DFPFkufWb+gmOJPhnXHlxvDz8H5Y2uvxQXjdl9+Jrx5/+O+F0hBQLrDVlbqOI
 BGOTq8imH5eE0EEChuZV51bh/R5GTZHL+y3SzTjqIOGuh7/4ZwosjH/4SNxwNDlPxGn0UNgaVsb
 a2oCPAUAniIAMoMvD7Q8+WHNDCng55d9SB8bCz7FYY88tLDB45tUe/Nf8GGbg+uMafbG0DY8+w6
 tf3pNI6dfSj55k9cStdYq7T7TTegSyjqCsISJ2pyYO7ddxr9EfTkoOWXFeZ5Fv5ScwcgSL/5o6C
 P/IjX9rmVioOYN7HBB330AvSx617J4ug86tz8JI3hQN4Nl7vXQXcNrZiI9aHt3ewKGPJI9DBFbs
 enjztZmA0ftfsmcUZHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA2NCBTYWx0ZWRfXyiB/XBFZ7YPF
 iDNVFaYXfQpr7jwkQxHk4CQSxf8vMPg0pmbbgMX6L+/84J2E7C2eRQThSBYAc79x1RLGGAu8Mdp
 Q0BgdQapK42DVNHTHwurmuBrZ/wJPmM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100064

On SoundWire v2.0 and later hardware, FIFO, and status
registers are banked per Execution Environment (EE).
The existing driver assumes the SoundWire controller is
assigned to EE1, which is true for all currently supported
Qualcomm SoCs.

Shikra is an exception and assigns the controller to EE0.
As a result, the relevant register windows are located at
different offsets and cannot be accessed using the default
EE1 register layout.

Add an ee field to the SoC match data and introduce a
dedicated qcom,shikra-soundwire compatible with ee = 0.
The driver uses this information at probe time to select
the correct register layout, while all existing platforms
continue to use the default EE1 configuration.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 85 ++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 71 insertions(+), 14 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 35ffffd54..6e0c5fb10 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -25,7 +25,9 @@
 #define SWRM_COMP_SW_RESET					0x008
 #define SWRM_COMP_STATUS					0x014
 #define SWRM_LINK_MANAGER_EE					0x018
-#define SWRM_EE_CPU						1
+#define SWRM_EE_CPU0						0
+#define SWRM_EE_CPU1						1
+#define SWRM_EE_CPU						SWRM_EE_CPU1
 #define SWRM_FRM_GEN_ENABLED					BIT(0)
 #define SWRM_VERSION_1_3_0					0x01030000
 #define SWRM_VERSION_1_5_1					0x01050001
@@ -118,6 +120,7 @@
 #define SWRM_V2_0_CLK_CTRL					0x5060
 #define SWRM_V2_0_CLK_CTRL_CLK_START				BIT(0)
 #define SWRM_V2_0_LINK_STATUS					0x5064
+#define SWRM_V2_REG_EE_STRIDE					0x1000
 
 #define SWRM_DP_PORT_CTRL_EN_CHAN_SHFT				0x18
 #define SWRM_DP_PORT_CTRL_OFFSET2_SHFT				0x10
@@ -201,6 +204,7 @@ struct qcom_swrm_ctrl {
 	struct mutex port_lock;
 	struct clk *hclk;
 	int irq;
+	u32 ee;
 	unsigned int version;
 	int wake_irq;
 	int num_din_ports;
@@ -224,6 +228,7 @@ struct qcom_swrm_ctrl {
 	/* Per-Slave SCP_ADDRPAGE1/2 shadow; -1 = unknown. */
 	s16 page1_cache[SDW_MAX_DEVICES + 1];
 	s16 page2_cache[SDW_MAX_DEVICES + 1];
+	unsigned int reg_layout_local[SWRM_OFFSET_DP_SAMPLECTRL2_BANK + 1];
 };
 
 struct qcom_swrm_data {
@@ -232,6 +237,7 @@ struct qcom_swrm_data {
 	bool sw_clk_gate_required;
 	u32 max_reg;
 	const unsigned int *reg_layout;
+	u32 ee;
 };
 
 static const unsigned int swrm_v1_3_reg_layout[] = {
@@ -258,6 +264,7 @@ static const struct qcom_swrm_data swrm_v1_3_data = {
 	.default_cols = 16,
 	.max_reg = SWR_V1_3_MSTR_MAX_REG_ADDR,
 	.reg_layout = swrm_v1_3_reg_layout,
+	.ee = SWRM_EE_CPU,
 };
 
 static const struct qcom_swrm_data swrm_v1_5_data = {
@@ -265,6 +272,7 @@ static const struct qcom_swrm_data swrm_v1_5_data = {
 	.default_cols = 16,
 	.max_reg = SWR_V1_3_MSTR_MAX_REG_ADDR,
 	.reg_layout = swrm_v1_3_reg_layout,
+	.ee = SWRM_EE_CPU,
 };
 
 static const struct qcom_swrm_data swrm_v1_6_data = {
@@ -273,6 +281,7 @@ static const struct qcom_swrm_data swrm_v1_6_data = {
 	.sw_clk_gate_required = true,
 	.max_reg = SWR_V1_3_MSTR_MAX_REG_ADDR,
 	.reg_layout = swrm_v1_3_reg_layout,
+	.ee = SWRM_EE_CPU,
 };
 
 static const unsigned int swrm_v2_0_reg_layout[] = {
@@ -300,6 +309,7 @@ static const struct qcom_swrm_data swrm_v2_0_data = {
 	.sw_clk_gate_required = true,
 	.max_reg = SWR_V2_0_MSTR_MAX_REG_ADDR,
 	.reg_layout = swrm_v2_0_reg_layout,
+	.ee = SWRM_EE_CPU,
 };
 
 static const unsigned int swrm_v3_0_reg_layout[] = {
@@ -327,9 +337,51 @@ static const struct qcom_swrm_data swrm_v3_0_data = {
 	.sw_clk_gate_required = true,
 	.max_reg = SWR_V2_0_MSTR_MAX_REG_ADDR,
 	.reg_layout = swrm_v3_0_reg_layout,
+	.ee = SWRM_EE_CPU,
+};
+
+static const struct qcom_swrm_data swrm_shikra_data = {
+	.default_rows = 50,
+	.default_cols = 16,
+	.sw_clk_gate_required = true,
+	.max_reg = SWR_V2_0_MSTR_MAX_REG_ADDR,
+	.reg_layout = swrm_v3_0_reg_layout,
+	.ee = SWRM_EE_CPU0,
 };
 #define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
 
+static void qcom_swrm_set_ee_register_layout(struct qcom_swrm_ctrl *ctrl,
+					     const struct qcom_swrm_data *data)
+{
+	int ee_offset;
+
+	memcpy(ctrl->reg_layout_local, data->reg_layout,
+	       sizeof(ctrl->reg_layout_local));
+	ctrl->reg_layout = ctrl->reg_layout_local;
+
+	if (ctrl->version < SWRM_VERSION_2_0_0)
+		return;
+
+	/*
+	 * The register layout constants are defined for EE1 (the default for
+	 * most Qualcomm SoCs). For SoCs where the SoundWire master is assigned
+	 * to EE0, the interrupt, FIFO and status register windows are shifted
+	 * by one EE stride (0x1000) relative to the EE1 base addresses.
+	 */
+	ee_offset = ((int)ctrl->ee - SWRM_EE_CPU) * SWRM_V2_REG_EE_STRIDE;
+	if (!ee_offset)
+		return;
+
+	ctrl->reg_layout_local[SWRM_REG_FRAME_GEN_ENABLED] += ee_offset;
+	ctrl->reg_layout_local[SWRM_REG_INTERRUPT_STATUS] += ee_offset;
+	ctrl->reg_layout_local[SWRM_REG_INTERRUPT_CLEAR] += ee_offset;
+	ctrl->reg_layout_local[SWRM_REG_INTERRUPT_CPU_EN] += ee_offset;
+	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_WR_CMD] += ee_offset;
+	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_RD_CMD] += ee_offset;
+	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_STATUS] += ee_offset;
+	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_RD_FIFO_ADDR] += ee_offset;
+}
+
 static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
 				  u32 *val)
 {
@@ -910,12 +962,13 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
 
 	if (ctrl->version == SWRM_VERSION_1_7_0) {
-		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
+		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
 		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
-				SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
+				SWRM_MCP_BUS_CLK_START << ctrl->ee);
 	} else if (ctrl->version >= SWRM_VERSION_2_0_0) {
-		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
-		ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL,
+		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
+		ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL +
+				((int)ctrl->ee - SWRM_EE_CPU) * SWRM_V2_REG_EE_STRIDE,
 				SWRM_V2_0_CLK_CTRL_CLK_START);
 	} else {
 		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
@@ -941,11 +994,9 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
 			0xFFFFFFFF);
 
-	/* enable CPU IRQs */
-	if (ctrl->mmio) {
-		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
-				SWRM_INTERRUPT_STATUS_RMSK);
-	}
+	/* enable CPU IRQs for the selected EE window */
+	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
+			SWRM_INTERRUPT_STATUS_RMSK);
 
 	/* Set IRQ to PULSE */
 	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
@@ -1580,6 +1631,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	memset(ctrl->page2_cache, 0xff, sizeof(ctrl->page2_cache));
 
 	data = of_device_get_match_data(dev);
+	ctrl->ee = data->ee;
 	ctrl->max_reg = data->max_reg;
 	ctrl->reg_layout = data->reg_layout;
 	ctrl->rows_index = sdw_find_row_index(data->default_rows);
@@ -1659,6 +1711,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	prop->default_row = data->default_rows;
 
 	ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION, &ctrl->version);
+	qcom_swrm_set_ee_register_layout(ctrl, data);
 
 	ret = devm_request_threaded_irq(dev, ctrl->irq, NULL,
 					qcom_swrm_irq_handler,
@@ -1769,16 +1822,19 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 		reset_control_reset(ctrl->audio_cgcr);
 
 		if (ctrl->version == SWRM_VERSION_1_7_0) {
-			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
+			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
 			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
-					SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
+					SWRM_MCP_BUS_CLK_START << ctrl->ee);
 		} else if (ctrl->version >= SWRM_VERSION_2_0_0) {
-			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
-			ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL,
+			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
+			ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL +
+					((int)ctrl->ee - SWRM_EE_CPU) *
+					SWRM_V2_REG_EE_STRIDE,
 					SWRM_V2_0_CLK_CTRL_CLK_START);
 		} else {
 			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
 		}
+
 		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
 			SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET);
 
@@ -1854,6 +1910,7 @@ static const struct of_device_id qcom_swrm_of_match[] = {
 	{ .compatible = "qcom,soundwire-v1.7.0", .data = &swrm_v1_5_data },
 	{ .compatible = "qcom,soundwire-v2.0.0", .data = &swrm_v2_0_data },
 	{ .compatible = "qcom,soundwire-v3.1.0", .data = &swrm_v3_0_data },
+	{ .compatible = "qcom,shikra-soundwire", .data = &swrm_shikra_data },
 	{/* sentinel */},
 };
 

-- 
2.34.1

