Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215F836F438
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812033; cv=none; b=KK29qPGe6zZLpjQ9sQF1O/XmqbB+d1sjgLiEEXATm1ttPu0d+sH+cVit144sI9d18zjrfjxRS2J6sjrpUaHlSfETC3TFDHHWekq9NowczIZGHbZM05KQ+jqjdNVju22YdeCQENuEgAC2B/3CQSmMgCcNWNw4l1d3ZH/Fjpn8xq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812033; c=relaxed/simple;
	bh=qwv0UccWCevSVt+yc33/ivBOzEU7kxYmn2GjzDkqT/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HB4DFv9MSBTvsSSqjPWEOLIZNahzzK3ADHMIteG1p2KPPEvdcX9sIlEl11SsHvxbg/YGxZetN0GVqeYZgnXyy9wLLaUX/SL5miH3PRrsgNHNw+19lwgbR9QVqCwrd1FlPIxWM7DBmkNBcW49W5xBoYylZKqDV1BmrlahmjxoUPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsJKWlen; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VI5ZZWo/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsJKWlen";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VI5ZZWo/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0GG91236410
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8r1kV/MAEEpfQTf+AOryDk8Vy/mH2u41tx3zHMQnDLs=; b=fsJKWlen8cXn9aN3
	x1mqBsH2Gai2+XOlzFBW287kmVwW1OE1Gdi+3o/ZtISt2fFwUpNTYWV6fZONsYGS
	MEOiwLJqf2+jR8CAUgqemkKiywP6L+6+/q+ESiGUMNRJQPREgrbPRo5kfVqYFWW7
	rWO/EH6h9fvw+QARDwDbJTUcSXjerzd7E8wzU9gcotMTXnx9LH0kucBLb7Q/BVVM
	/FILor4ikjsMP0vKUDsKR645Ga6RWpyL8nJao49Do1B9jb/NfL4kBVG+Y1vIdSJM
	PM6OX1hcT3xjRnMxg7EFwKlFu5y6PSBT275u02j9JiXlHPgWc0F9tJYwIw1wWnfI
	xCNn0A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dk6ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:33:50 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a04491c56so1127891eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791812030; x=1792416830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8r1kV/MAEEpfQTf+AOryDk8Vy/mH2u41tx3zHMQnDLs=;
        b=VI5ZZWo/JN3hfMl4ZGwGL9gQ9piKJ4jrFpHS8T0MrOdrdeD7tgEIL9bbTXXD1kFdx1
         ejMAUvxD671kqTvBfaQJZQ4WUvWWXgvr0gtD5bAVCuc3QzHen/qTTS1RR5lS54Z+3MBl
         W1fn2OIhznKRWxcNE1BzdxdTXpjwHvzQUvl6teO0zwiH/f3pD1+BdzCRh9o3UtSlQfSA
         3+G9CuVuwyD4l1kIIsg25f3rqbx0YUWiLka9KodepiGWG9/E9jGJtde0Ag4zhCV52/u9
         +uPhnAeht65BwKDAqqABQlB3h9b3bqyXteOPwDQOgtnIUkSjjU0V3CEG2pMp7rUAotHH
         EWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812030; x=1792416830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8r1kV/MAEEpfQTf+AOryDk8Vy/mH2u41tx3zHMQnDLs=;
        b=XqnLCYdi5IqnvzVw+aRiPBMkhfh6/LoqMf1Nzl1tMvBR3DQVozrkiGzreEJItNDX5L
         /6P3t8fv5mytsdzl9fS1q8gotq9NMNJWkYaEMWOa81nLFeqIWYgACDmNJ+r7l8rnq0KG
         8mflGaRNoSb1fO3WaJDlgxuLrCY9aJpycFt7oJeeUWwLpuKcYE+/vfhrHhw+iwTwtVC5
         0rTIh1f4xEe+EqGXB58BVKm+AGr6tAN2m//ziC01SvqXUtu3FzV5j6VcYrSNNGT4b+df
         AiMPzEweGkP/2ejrJNBjbFRTv5X3IZCEhGeF8wDZA6YrLNMyB3bQ5JGLUiQGYUNUstQl
         vhOg==
X-Forwarded-Encrypted: i=1; AKwUvBw1jGtVZ+Hgmg+qWVnCx0iuJLHAv8VMeYGWt/mzRqmNzZf3S/qq/C6C4IDlSqfAlDHdM24HNYJMPn7/57o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSoOBXZEzh0WqtZdEMwIgIfHb8zw/mwc9feKX4QEF/o451bwEK
	AMfJb2pyjZAWrHD9zQQ/LAjJMrLrXTiBR0YJ+Ux/87/gLjiSRyqH9+L/RQoPCWGWgUT38xe2p+V
	JeQqH38fdOSg7hfZsWHSdUXcu7KTcsil5AzmpolHzQ+Ru6+oUdrx6mTadc3kjx449f3E=
X-Gm-Gg: AYBFou2HID1WidQmOJtFVosqfBlAkcVvFQrT/iHkj8ugQNoPrDx1d8kXrtPZFOz+2NW
	SJyIFYn6ugsZqXAuNDl3ZGVqcKRcpHSsV7qhRlnuJmkKqkZy+YPI/7TvvTSGcdgDohuPVVOcHyg
	je1roRI28VKghTfgX8VPkGUKAGMpk8pNj7tWzlyTBnVklu+nJbO0Clf7hYW+pK2UTVYEpihjrPJ
	gXOf9dyJZGTg7F03KTQzA/CYCWzvuNgvBBzk8iAxTvLnz6+A0qonsOnp2OuGntjFEyBhjag0Qux
	3lQ9uD5mpedAU3aY5wj2X68BlSiIns5yYsOEtg+ll6XYlmYOPUWG/kC1Is34iZHJkzoCeAP1VF/
	XKa9XBjHVNfv4D88+IYGLdN0z+r4=
X-Received: by 2002:a05:7301:dd95:b0:353:58b7:b5fa with SMTP id 5a478bee46e88-3535f48136amr13942075eec.1.1791812029553;
        Mon, 12 Oct 2026 06:33:49 -0700 (PDT)
X-Received: by 2002:a05:7301:dd95:b0:353:58b7:b5fa with SMTP id 5a478bee46e88-3535f48136amr13942024eec.1.1791812028880;
        Mon, 12 Oct 2026 06:33:48 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm44740397eec.9.2026.10.12.06.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:33:48 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 19:02:18 +0530
Subject: [PATCH v2 08/13] phy: qcom: edp: Generalize power-on path for
 per-SoC overrides
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-nord-drv-dt-v2-8-a2ab9af954d2@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
In-Reply-To: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791811948; l=8737;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=eF1Jpyt1qNMVw5DgVtoI8D/ioyJheTfzXdIRzkvKdK4=;
 b=fwlb3gaIOBYoqJ9GsBeBjI590rDx6+zP7ejlXPPM6qNRoGsR12CAKqd2bP3WQXqQYVdKa0I6F
 DMDo8LsAbNsDT3zv7KjfMBDrwDRiZ0NDTsfZHhc9TWVm254LK2/+pPv
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX+JyT2A8DgN6V
 xj9Fnd6q3JR1ou2ghRoSssgRt3vlTgtgM63BqyhB+UxtD6MCl59kijB99Mr+pya6gaL98UnqhcX
 jJVFZtmLq5udXwjIoVV0kbJB3DzBlrwjF/uvkIZ8WxKPu6BMqQXERfD9kmDS0BUnxbSiEKkYFTv
 Vs3aBbw71ELpuAS65j8QfO+vq1wpoQFPf3xeuwLMAVCzayPsg7bKsJE7bTaNJfoOYl8+En8Sbgv
 eELvQVy0ISAoRE6Yuil2NYE/hXlmOBBwdaQwejF/upoeWGAN5pFdpaTpAQ6c1/upUPNFj6zpcHg
 iX3ayJkJTkPke0CfQgPAXQbzVRQqabPlebPs+Dm30JoeG+o4Tbd1KQLMT54MPIJWIi+o0vik7e7
 xv/lPR0o+bNdZD8pclUJm7vowa16aTFT4kCjbjnJKCQ1499vtx6UtzXcd+FKBR1hAcFYuStfC6Q
 GpRs1zec0qrLOMTh9fA==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6acce1be cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-OCD7epTopYbqN3EProA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: nfZJmk0Vs3ovBjVxFd7EslM87M2AXuIf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX1YynlNXC27ig
 iO/H00sqH+C0+rN6Cx+sqljfXT9G7FJ/Qbu1Mf3arDpAGt8jfjSldU6gaBJ7eox9QU6JIhK1ExD
 oICo8ZHbivemGxY5edbuKtpMJlX0rgk=
X-Proofpoint-ORIG-GUID: nfZJmk0Vs3ovBjVxFd7EslM87M2AXuIf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120053

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Nord has a different register layout that the existing hard-coded
power-on path cannot accommodate.  Introduce qcom_edp_tx_res_entry
and replace open-coded TX resistor writes with a data-driven loop
that also handles base=2 (PHY/edp base) for Nord.  Add
phy_status_reg, bias1_en_2lane, tx2_tx3_lane_ctl, tx_res_cfg,
cmn_status_reg and c_ready_status_reg to qcom_edp_phy_cfg, and
make com_clk_fwd_cfg optional.  No functional change for existing
SoCs.

Assisted-by: LLM
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 82 +++++++++++++++++++++++++++++--------
 1 file changed, 66 insertions(+), 16 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index d5c6835b6c70..c5df1086607f 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -81,6 +81,15 @@ struct qcom_edp_swing_pre_emph_cfg {
 
 struct qcom_edp;
 
+struct qcom_edp_tx_res_entry {
+	u8  base;
+	u32 offset;
+	u32 val;
+};
+
+#define QCOM_EDP_TX_RES_ENTRY_END { .offset = 0, .val = 0, .base = 0xff }
+#define qcom_edp_tx_res_entry_is_end(e) ((e)->base == 0xff)
+
 struct phy_ver_ops {
 	int (*com_power_on)(const struct qcom_edp *edp);
 	int (*com_resetsm_cntrl)(const struct qcom_edp *edp);
@@ -98,6 +107,12 @@ struct qcom_edp_phy_cfg {
 	const struct qcom_edp_swing_pre_emph_cfg *dp_swing_pre_emph_cfg;
 	const struct qcom_edp_swing_pre_emph_cfg *edp_swing_pre_emph_cfg;
 	const struct phy_ver_ops *ver_ops;
+	u32 phy_status_reg;
+	u8 bias1_en_2lane;
+	u32 tx2_tx3_lane_ctl;
+	const struct qcom_edp_tx_res_entry *tx_res_cfg;
+	u32 cmn_status_reg;
+	u32 c_ready_status_reg;
 };
 
 struct qcom_edp {
@@ -313,9 +328,11 @@ static int qcom_edp_phy_init(struct phy *phy)
 
 	memcpy(aux_cfg, edp->cfg->aux_cfg, sizeof(aux_cfg));
 
-	ret = edp->cfg->ver_ops->com_clk_fwd_cfg(edp);
-	if (ret)
-		return ret;
+	if (edp->cfg->ver_ops->com_clk_fwd_cfg) {
+		ret = edp->cfg->ver_ops->com_clk_fwd_cfg(edp);
+		if (ret)
+			return ret;
+	}
 
 	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
 	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
@@ -672,6 +689,16 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
 	.com_ldo_config		= qcom_edp_ldo_config_v4,
 };
 
+static const struct qcom_edp_tx_res_entry tx_res_cfg_default[] = {
+	{ 0, TXn_RES_CODE_LANE_OFFSET_TX0, 0x11 },
+	{ 0, TXn_RES_CODE_LANE_OFFSET_TX1, 0x11 },
+	{ 1, TXn_RES_CODE_LANE_OFFSET_TX0, 0x11 },
+	{ 1, TXn_RES_CODE_LANE_OFFSET_TX1, 0x11 },
+	{ 0, TXn_TX_EMP_POST1_LVL,         0x10 },
+	{ 1, TXn_TX_EMP_POST1_LVL,         0x10 },
+	QCOM_EDP_TX_RES_ENTRY_END,
+};
+
 static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
 	.is_edp = false,
 	.aux_cfg = edp_phy_aux_cfg_v5,
@@ -679,6 +706,9 @@ static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
 	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
 	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v4,
+	.phy_status_reg = DP_PHY_STATUS,
+	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
+	.tx_res_cfg = tx_res_cfg_default,
 };
 
 static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
@@ -687,6 +717,9 @@ static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
 	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
 	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v3,
 	.ver_ops = &qcom_edp_phy_ops_v3,
+	.phy_status_reg = DP_PHY_STATUS,
+	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
+	.tx_res_cfg = tx_res_cfg_default,
 };
 
 static const struct qcom_edp_phy_cfg sc8180x_dp_phy_cfg = {
@@ -695,6 +728,9 @@ static const struct qcom_edp_phy_cfg sc8180x_dp_phy_cfg = {
 	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg_v2,
 	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v2,
 	.ver_ops = &qcom_edp_phy_ops_v3,
+	.phy_status_reg = DP_PHY_STATUS,
+	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
+	.tx_res_cfg = tx_res_cfg_default,
 };
 
 static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
@@ -703,6 +739,9 @@ static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
 	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
 	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v4,
+	.phy_status_reg = DP_PHY_STATUS,
+	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
+	.tx_res_cfg = tx_res_cfg_default,
 };
 
 static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
@@ -712,6 +751,9 @@ static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
 	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
 	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v4,
+	.phy_status_reg = DP_PHY_STATUS,
+	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
+	.tx_res_cfg = tx_res_cfg_default,
 };
 
 static int qcom_edp_phy_power_on_v6(const struct qcom_edp *edp)
@@ -913,6 +955,9 @@ static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
 	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
 	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v6,
+	.phy_status_reg = DP_PHY_STATUS,
+	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
+	.tx_res_cfg = tx_res_cfg_default,
 };
 
 static int qcom_edp_com_configure_ssc_v8(const struct qcom_edp *edp)
@@ -1045,8 +1090,8 @@ static int qcom_edp_phy_com_resetsm_cntrl_v8(const struct qcom_edp *edp)
 
 	writel(0x20, edp->pll + DP_QSERDES_V8_COM_RESETSM_CNTRL);
 
-	return readl_poll_timeout(edp->pll + DP_QSERDES_V8_COM_C_READY_STATUS,
-				     val, val & BIT(0), 500, 10000);
+	return readl_poll_timeout(edp->pll + edp->cfg->c_ready_status_reg,
+				  val, val & BIT(0), 500, 10000);
 }
 
 static int qcom_edp_com_clk_fwd_cfg_v8(const struct qcom_edp *edp)
@@ -1074,8 +1119,8 @@ static int qcom_edp_phy_power_on_v8(const struct qcom_edp *edp)
 	       edp->edp + DP_PHY_PD_CTL);
 	writel(0xfc, edp->edp + DP_PHY_MODE);
 
-	return readl_poll_timeout(edp->pll + DP_QSERDES_V8_COM_CMN_STATUS,
-				     val, val & BIT(7), 5, 200);
+	return readl_poll_timeout(edp->pll + edp->cfg->cmn_status_reg,
+				  val, val & BIT(7), 5, 200);
 }
 
 static const struct phy_ver_ops qcom_edp_phy_ops_v8 = {
@@ -1094,6 +1139,11 @@ static struct qcom_edp_phy_cfg glymur_phy_cfg = {
 	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg_v8,
 	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v8,
+	.phy_status_reg = DP_PHY_STATUS,
+	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
+	.tx_res_cfg = tx_res_cfg_default,
+	.cmn_status_reg = DP_QSERDES_V8_COM_CMN_STATUS,
+	.c_ready_status_reg = DP_QSERDES_V8_COM_C_READY_STATUS,
 };
 
 static int qcom_edp_phy_power_on(struct phy *phy)
@@ -1128,7 +1178,7 @@ static int qcom_edp_phy_power_on(struct phy *phy)
 
 	/* TX Lane configuration */
 	writel(0x05, edp->edp + DP_PHY_TX0_TX1_LANE_CTL);
-	writel(0x05, edp->edp + DP_PHY_TX2_TX3_LANE_CTL);
+	writel(0x05, edp->edp + edp->cfg->tx2_tx3_lane_ctl);
 
 	/* TX-0 register configuration */
 	writel(0x03, edp->tx0 + TXn_TRANSCEIVER_BIAS_EN);
@@ -1166,13 +1216,13 @@ static int qcom_edp_phy_power_on(struct phy *phy)
 	writel(0x00, edp->tx1 + TXn_TX_POL_INV);
 	writel(0x10, edp->tx0 + TXn_TX_DRV_LVL_OFFSET);
 	writel(0x10, edp->tx1 + TXn_TX_DRV_LVL_OFFSET);
-	writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX0);
-	writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX1);
-	writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX0);
-	writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX1);
+	for (const struct qcom_edp_tx_res_entry *e = edp->cfg->tx_res_cfg;
+	     !qcom_edp_tx_res_entry_is_end(e); e++) {
+		void __iomem *base = e->base == 2 ? edp->edp :
+				    e->base ? edp->tx1 : edp->tx0;
 
-	writel(0x10, edp->tx0 + TXn_TX_EMP_POST1_LVL);
-	writel(0x10, edp->tx1 + TXn_TX_EMP_POST1_LVL);
+		writel(e->val, base + e->offset);
+	}
 	writel(0x1f, edp->tx0 + TXn_TX_DRV_LVL);
 	writel(0x1f, edp->tx1 + TXn_TX_DRV_LVL);
 
@@ -1184,7 +1234,7 @@ static int qcom_edp_phy_power_on(struct phy *phy)
 		cfg1 = 0x1;
 	} else if (edp->dp_opts.lanes == 2) {
 		bias0_en = 0x03;
-		bias1_en = 0x00;
+		bias1_en = edp->cfg->bias1_en_2lane;
 		drvr0_en = 0x04;
 		drvr1_en = 0x07;
 		cfg1 = 0x3;
@@ -1207,7 +1257,7 @@ static int qcom_edp_phy_power_on(struct phy *phy)
 
 	writel(0x19, edp->edp + DP_PHY_CFG);
 
-	ret = readl_poll_timeout(edp->edp + DP_PHY_STATUS,
+	ret = readl_poll_timeout(edp->edp + edp->cfg->phy_status_reg,
 				 val, val & BIT(1), 500, 10000);
 	if (ret)
 		return ret;

-- 
2.34.1

