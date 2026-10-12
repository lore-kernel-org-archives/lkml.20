Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3F13750D5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812078; cv=none; b=Lg+xJuW7r8+R3C6WfCTP05C349jdl1BO4K0iqy/YDrytGf7uRtnU/RDLsJ+GspiL1kkSOnU8owcGHV+iXtxQjA7BAEQ9eEvy2O/BpxzNeAdGBEJ0KW8dZfIzCfiZll6v+rJK54Jikt2fyyWIdWhqzS0vwcc0DR8DakanHSWALHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812078; c=relaxed/simple;
	bh=4wBfSL/vgt9Nv77W7dodUjwfp6/m3fUKGozL49BmHz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z1blJbTREh/Oq4bU5eXxMRaqXUEeTxqkHKbzrkgHJms3Mj9t2IXWXsDi9DacTix+ycXB0AEKRpWEXCyYiw8ormjKt0B9PODgZ2PxzpwkS24VRqzaXIqA2MJClZyU03cBVaaOP/WGM3LDSZDZuG9I9RZ3uZ/hX/2pUBDfzD2KyXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kecer+CP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Phu0Zx0p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kecer+CP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Phu0Zx0p"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0BjA1686419
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MH8WUhN/uk47zXTtBziw108eq20eC3q5Tm23CfZZvYk=; b=Kecer+CPGi5EW48l
	CUbVCVIAcHqQf9LzC1kzPQyKKOtTBOBRgoEzU7SnsI8tZBXTxBOL6BgZoyo7Ybwo
	Bszi8xFwdosh69R2Apl1BjozI7fAkKSqeqsfLxv05A9yZuABl1rpiOoh3XYcSLys
	1TSB/+RaiN00/lqPtZs5Fgp3plGv7g/cGCgqotqXOl0oU2dnahcF6bRynNUx0R0a
	iAb2E0+LbZXVUNruoIJfp36gLJ5w7sZuqZRuNzq/jDlhB5hlVsnFXzZOqlfBCtau
	+8bQ+qdsx/3EtTMWJfG2+Ur1GojvDkYKoS/yMYJIt/KeHO2VtN+rfk2P1c/a34/e
	TE4RlQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc0yre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:34:36 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35a0c25def6so2283731eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791812076; x=1792416876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MH8WUhN/uk47zXTtBziw108eq20eC3q5Tm23CfZZvYk=;
        b=Phu0Zx0p80UgPPOesGcep6mWtZ2Wua7VoUrmgwJ1U4UT9qrsZ0z7YZlvuUN/i/Fx/a
         TgQUtNp2oRwFhjKBNOkidvInJkS6YGMnQd5AY+FxlyH/eI8C0wlKhT5hey5dJUGwRiuu
         y2Z28ZG9d1EFAdvRuqeD/58zPOGgO+rWcVG8mCG7PWaTkxnzvAUT7ApParJP9wSu38cC
         slxeQu4uOKPdEw7qWI37Afzbw1QLrJvUR6Arbk8hsBMxzLshj3I5uiaqiBM4JxoJgklg
         LAdMoLBitiy69TiPB4wqyxDgGJLKXp0V/MO7RInf80K6n6nitTMg9q/AOzNcm0YTr3RM
         ZOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812076; x=1792416876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MH8WUhN/uk47zXTtBziw108eq20eC3q5Tm23CfZZvYk=;
        b=WenOCfamFm6JUw0l73e/9KP+atXl1KUCTK/OCyGXbC+Wokt/tyV3ET84L0ao8ExZeP
         7m5mrf3XkvdyREuGAibWZSkzq/EwzKHdoOXYvIzzXhwuGeZvl8hoc2HpDWDD1VP017mR
         YzbMcBEOQfyEsVrHLosy0Nwt2z2Q/KzRlGCCIhS5N+FgQn+/KJYlWXzh3KnvYrhmgzaf
         qzLsAzkH9bSHn3GIJvWwXSnli4mMZRHQRzPFvEToNUry2YUO+CIpla19xWnN8i6uM1Kz
         AFzWWGLoJuvPQY7R0wcom0ChUWf+m+cKfPjDjtOpGiyIpfwTD1SK4AUNURbluFz1OIC/
         M2aQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiIXe4THj9Jhs/UjiBuqYd6MgjzSfnmltj8+6rBEsLk50KK9hTvtC2dpNSBgenJJvDIs5roq4TdasDLyQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPL3CuBUhy/xRJXkpoqPDuctI/J6I93N+2uFFB1geomxEtAF9R
	J0iim7oCxJA/m2Iidi03d/wHcphkKYJOabuqFhKr6tuEyAvIxSXDIrH2s2V7TDPLHZBzQwHyWFB
	4oEMSQ5DdCAlRoUQU36NoD2bEkGBb5gQa1U9bKr1lcKNQgL5ZknXwcTNto3d6v4ATXS0=
X-Gm-Gg: AYBFou1sxP5yci59QGqw9SdzpJhdBcopPXLP2fNmJIfhy4/M5T+6QR7gcLt8algAz4f
	Tq7VT8+x0sDlO2YkZkjUJVlrnR0lfU3l6GN078477Ohb6FiJQ0dIZ+DSLx8n1JYfCM1kydhblVE
	7Xyza0RaSW0kOMh0J2ev54KOMPvbhnOxpLft26mW2oUQFxpggYVdA6w59eONJkuuWIEFdQQgaL0
	91aVSiUnWROAuyW4s5QqTd/HWLob6CsYmcGs9tkAF5JY12wfVpuVF1XxPIN87rA51duo4dXcxFW
	DEZk0sF2KI8S75KIxznPvBqMSrkbzRXrcZxWfGJwH11bQnraODMfMMEtAFLRmO9Piiw4OuFm74X
	MNTBYYr1NKX+6xL98YtLMpOdErqk=
X-Received: by 2002:a05:7301:1a04:b0:359:3460:bc1c with SMTP id 5a478bee46e88-3593460bce0mr7259959eec.12.1791812075423;
        Mon, 12 Oct 2026 06:34:35 -0700 (PDT)
X-Received: by 2002:a05:7301:1a04:b0:359:3460:bc1c with SMTP id 5a478bee46e88-3593460bce0mr7259889eec.12.1791812074536;
        Mon, 12 Oct 2026 06:34:34 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm44740397eec.9.2026.10.12.06.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:34:33 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 19:02:23 +0530
Subject: [PATCH v2 13/13] phy: qcom: edp: Add Nord phy_cfg, ops and OF
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-nord-drv-dt-v2-13-a2ab9af954d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791811948; l=2577;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=WRyL8CMWIhLtCVdKv+p4xo6VqSv7gN1Tojlh5IqU2kM=;
 b=0iT/5hPFnYhWK4aFKy2lRGhmL8bjiXZ0Y13HRMcmL7Zsnt9guI5XnKjtZJfIfkIcxaZhw0kw3
 a2RCqqMd8QbBy5CU5aVOPVbdlRqdGrY/tTvGdFnNF6qXVkIU6L6jCwu
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NCBTYWx0ZWRfX9UijBkmXeoQO
 ux0TgGAqsUL9wuD6Lq1ljQ43QJwbHB2l+6FD/5H06Ge9nuxVVfSkz2bK76xYypOLcaQ8T7Sf5V8
 Z8aAvPzzEqn3cDOMcV+XwiodP0OdsoQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NCBTYWx0ZWRfX+yhya9rsmLqd
 2WzYpnz5Eom3BXa0Ha4B9J2ReTQOnVU8DH79+jqlgzcVbmA1fl4V5NMwiM7C0XAAexK4edYgmpm
 mOqHIFn0kYFyhMjkQR4VjymuBmAAViEbPiTRHMNk1j9AvZqR5aXpsDXdXWQ2sjVrlFydJVshVWR
 khikSazWZD1016cgPOci8U+ZMKUClbQ+ixSaNH+aza9na3P1/y29cT1Xj7zgjdKLgGnz9yj20F1
 oyVDef38TJLIKmRA0nmes7UZOxu1F1gBT+a/90XFihtELO3+/2GO/2ujm0OhLb2ofufXmCKhSGJ
 vktJ3cpXeYk8IVaNjT7oWD6SNBpWkkgDi1hq1uxl4d9f6mrcnLso3eCcSzaP/v5TeT8W46Ae9t0
 I2ZtI4mBOvByRQrubFiX/TahLTDboc5tVNefs5GTMkXE26dDkBiJ/Qle2enqFeYfpARC2sY/Qdo
 wd3bgelOlTo84Z0dIdw==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6acce1ec cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=EQFMWDaH4iPFUakZLHgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: AZNeOCK0W2zU8HV4J4XrBLT-0X58OUVC
X-Proofpoint-GUID: AZNeOCK0W2zU8HV4J4XrBLT-0X58OUVC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120054

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Wire up Nord-specific callbacks into qcom_edp_phy_ops_nord and
assemble nord_edp_phy_cfg with all Nord-specific values: AUX/VCO
tables, swing/pre-emphasis tables, relocated status register offsets
and TX lane control.  Register "qcom,nord-dp-phy" in the OF match
table so the driver binds to Nord DP PHY device-tree nodes.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index cb5f6e0ae607..87400d61323a 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -1774,6 +1774,30 @@ static const struct qcom_edp_tx_res_entry tx_res_cfg_nord[] = {
 	QCOM_EDP_TX_RES_ENTRY_END,
 };
 
+static const struct phy_ver_ops qcom_edp_phy_ops_nord = {
+	.com_power_on		= qcom_edp_phy_power_on_v8,
+	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_v8,
+	.com_bias_en_clkbuflr	= qcom_edp_com_bias_en_clkbuflr_v8,
+	.com_configure_pll	= qcom_edp_com_configure_pll_nord,
+	.com_configure_ssc	= qcom_edp_com_configure_ssc_nord,
+	.com_ldo_config		= qcom_edp_ldo_config_nord,
+};
+
+static const struct qcom_edp_phy_cfg nord_edp_phy_cfg = {
+	.is_edp			= false,
+	.aux_cfg		= edp_phy_aux_cfg_nord,
+	.vco_div_cfg		= edp_phy_vco_div_cfg_nord,
+	.dp_swing_pre_emph_cfg	= &nord_dp_swing_pre_emph_cfg,
+	.edp_swing_pre_emph_cfg	= &nord_edp_swing_pre_emph_cfg,
+	.ver_ops		= &qcom_edp_phy_ops_nord,
+	.phy_status_reg		= DP_PHY_STATUS_NORD,
+	.bias1_en_2lane		= 0x03,
+	.tx2_tx3_lane_ctl	= DP_PHY_TX2_TX3_LANE_CTL_NORD,
+	.tx_res_cfg		= tx_res_cfg_nord,
+	.cmn_status_reg		= DP_QSERDES_V8_COM_CMN_STATUS_NORD,
+	.c_ready_status_reg	= DP_QSERDES_V8_COM_C_READY_STATUS_NORD,
+};
+
 static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },
@@ -1782,6 +1806,7 @@ static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,sc8280xp-dp-phy", .data = &sc8280xp_dp_phy_cfg, },
 	{ .compatible = "qcom,sc8280xp-edp-phy", .data = &sc8280xp_edp_phy_cfg, },
 	{ .compatible = "qcom,x1e80100-dp-phy", .data = &x1e80100_phy_cfg, },
+	{ .compatible = "qcom,nord-dp-phy", .data = &nord_edp_phy_cfg, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_edp_phy_match_table);

-- 
2.34.1

