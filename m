Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA65490BEB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141181; cv=none; b=ubdW/j359owQ7BsqVsxcSoj+U3E8s+xP9l+Vjev2ZuXuCfE7GpgaOOFLdF4G7JnVLD9kMgaR/4EA9PiqKYyEJ4bYn532IsmLaKu7Pem8pCZrTjkB1mz6bbOpsm8DcHWuqHcC+A7ABg02X6xNnxNg0RXwd+tdKipCIwXMM2C46cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141181; c=relaxed/simple;
	bh=RyzijeQOzFCR4BUqwVap4hBjD3WwtYW4cP4P/BfFqns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SN2/EUuVvPVNeMaOYjaRxi7BEJJXgBqZY391/p02oWVRzLjdqMoXxTJUQw2oMFIRvgeEty5ctSEQf5IrRluQvvhCe/E5GvCN1W8E3bu8WSxh0SpIGFat9qYrp+/U2nVz0OnlH1lZGghIjXHq5z0RPdlx8yjgfk2btZzj+kbNRhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KUfMlGKD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SktGTB1M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KUfMlGKD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SktGTB1M"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmAWp222587
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TYKeXTa8aTR0bTBB6X/4VXQLUl7NXF2imUYHRSL6L6Y=; b=KUfMlGKDCYJUkNK9
	krs5AoW76Ydwk168/8HaKacxnVBbJwBkxOnwJbZLFnOqGLRigS/emZ85a9bHCdMj
	k0fuvdHDWf2T6JDb67KoF58rpj/dm9q6rsGX9WwcRmSUeBJ5mPvFFmGfFcwq/Z5l
	lNCitP0sZucMOzBzOlZyeIkbHK4iedThKhW8Dcb03G6n15biYDgVnDX6ZV5fRpPp
	e2mY8MowwTmW4yjJ5XX+yMUt/xDMX95c7YtmnigDMUn8uciuinlr1AOpzYsWrmkj
	4Bw5MaZ75BX+keYvX83+ZcKSyaWrVJGd8QTRLrVrtkF2IaZ4/o7cqW/RGqFeVNvq
	DFWZ8g==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdraged-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:39:35 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-455cf15f8b5so1717081fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141175; x=1789745975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TYKeXTa8aTR0bTBB6X/4VXQLUl7NXF2imUYHRSL6L6Y=;
        b=SktGTB1MA8iTyDA7Ww+2L1xlWqbmn8BlN5ahRGJPrjkhW4lQsEOcyBmg1fDxW7tt5/
         4xWc9c14t6xxrNR6z0ydPA12wya2OK+qggT7Hcuy0EG6b3E17xn2/seYYVzu2g9Mrom2
         FCv1UsrWzCu0Yt5wgIFeyaiXibtRv5Fdre6mDZK8tCrJrAbTWXFkIWxiPwmEEVXCPo0C
         L3AJ+SP7hnK4M0KrBzHMjWfjvIoCz6vgvV5xQBOPnr0QVYpaUAxctp6iKh3qftjgFs05
         rpUx2GsOX7wzKQhreF4coExbPGPcTuEh9+W4rME6bc2N+/wO5R1PlkMfr+gGwDZGb93O
         zszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141175; x=1789745975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TYKeXTa8aTR0bTBB6X/4VXQLUl7NXF2imUYHRSL6L6Y=;
        b=WpYoTNaxpfc+5a9arEydo8pIPeN/246GbWvCWkZACEeHFldofZvP3U4oXPAJ0cY1Wv
         6ZonBYc57fbKH5K7t1xsqdS/KV99CNo0ZpkTlM401I1pjzNNeQSJo6vyX1PoAcfliao/
         oGoIMbQaVdIAkOgKIaX6eCqlOUMwlKAXeP4VpDVySEcAdoEzQUqaUN8OsXK4kb/45v72
         2t2tEsNpnr9MXesj6K8ldbWMITmQzFYnhG9vB33yqL4aIBRcbOWryN9eQFr/PA6cn/Dj
         cPrVEvuYdBIzzlPHvImM0iZPr3hGpmEig5TmaCWJVUTJmKdq61BFIGLz7ix5FhNvxcld
         jaBQ==
X-Forwarded-Encrypted: i=1; AKwUvByamr9wOYn3PIUL6LiF/5gWbS+AEpMUry2W4UWou7060zegD9ex/3wTs7srfSVcnkW0Mxi/ab4OpA1jHEw=@vger.kernel.org
X-Gm-Message-State: AFuF++l8QsZcvvFAaSOV3axd53x95o39agY7F6Vqvu7chE34B6wwMQpr
	NcCr9Av332bBSJWatCJwTQX74gvLp23NE6QE955aULaKhzmmeOG6vfBev9L57QNUGnzeLJczEcE
	1c3GBPCfM/Sarmcw1iyBbiopGk3tHqYLjZhJES4tsWT85r3eBE3GcTuHlQfqDPbg6D2E=
X-Gm-Gg: AYBFou2c90YQmhA/TNlib9OnjB0XDG0lK+QnDR7NP070nmLQylPC4i8/aSTbi7E3ZXs
	ffImZBE/vY1lafzgBm9DToFGrvqCuHfJN1+ljpLG1R/4RL/dmqCmlwaStSsiOWOaPYFeLTobIlZ
	Vorx31CzAYzCkp/TxQc508CmZ0ncTE/URy3PLnNIgp09LZLaFWQg67K7SHDfJkvRqU51GwtzHR+
	1lpRPkQoBgQa7XFGQEN2ryFkw8rLtsOAj3bhapFa05hxJMWw+SkHLt02sKsc1Jzcc7s9SpdyzJ5
	A4dFpc+GBC4+GpNfbLtt6fV8mAZc7oRzO8paMCN8bs/iJUEnRNK2J9tXcb6D/sKTsWVK93hDcUF
	oh942EUeyf83KHAtFoY3zLLvilZU=
X-Received: by 2002:a05:6870:180b:b0:42f:f3b2:e2c9 with SMTP id 586e51a60fabf-47dcdbbb17emr2893608fac.0.1789141175306;
        Fri, 11 Sep 2026 08:39:35 -0700 (PDT)
X-Received: by 2002:a05:6870:180b:b0:42f:f3b2:e2c9 with SMTP id 586e51a60fabf-47dcdbbb17emr2893597fac.0.1789141174947;
        Fri, 11 Sep 2026 08:39:34 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:39:34 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:47 +0530
Subject: [PATCH 16/17] phy: qcom: edp: Introduce Nord phy_ver_ops and
 phy_cfg descriptor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-16-e25c073cf1b6@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
In-Reply-To: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=1972;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=94rmdeySxa5fJHfAGld0di57h9zUDb4Ov4YG7k/0YKI=;
 b=6FCW2hLlHDUGqMX0JBT6HvN4i3iC42y74fuKbeKZlV000G80lciwX8BRZBP8TXys2iqxrET60
 2aPAk+8qpgFBX7hOiipgM7AllTxJBIHmy2S9y05wfDnVnAl+d3FZOnR
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: 71b2DQgmPkQbmz-X5qtQSSxD42wCrCX7
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa420b7 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hnKCH8YYcLMkF2FFhooA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-ORIG-GUID: 71b2DQgmPkQbmz-X5qtQSSxD42wCrCX7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX7xTwLcmlekKa
 hjeFCYu3xBPqphePVYCZTJEnj2jKlkZRTm3Jz/WdyqZd5s0w0Tf7Og1Mn+93rtk1rgYzsM97nXm
 IVadnMChBtAX2qO0lfqRmPqcDD8ZmOw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfXy+QxlBYiC0h1
 HfdS0OEBYEfmEalTv7F/Kq8GImGzROKrsGEkrnrfT7HHj/WaxFWoibAppcdVeoRl9voMlKWdzKX
 2cVfTLsfJItsk6SdD0t1UW+6RWgu1LV+Z6ukeyp7Ec06l9IsaqyogIFmLXMfi7lF9sMAjSdKFgB
 zL4WoESb5yUJUEZ5l4jH4hERZclLM44oskLi83Duq6aHpp2PumSouRTpEXpphgvpLgbeu2ZBBz6
 v9T/f2hRtSTJ7qTcAU63VPW/xoQSUbACCNv6wtUoh0iJJxBOjjJ6NzW2I0RdnDaO8zF3SnQKxWf
 Ye+zuHu0goGv2XMxrXj9DHakVWTslw3MkarHpFqdg/dB1di4qRSNXkq/PVM6U1yAJ933BBsz/fC
 ZTZVLc5Bp+iV7JC5sSMnIqT5xZmP2/Q4UXHVZ/B/8tKwtR10gVCYAVOEYmPljD3qp6DxKsigNcQ
 4+Pm6VZNu8B1dpG0v5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110218

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add qcom_edp_phy_ops_nord wiring all eight Nord-specific callbacks and
nord_edp_phy_cfg collecting the Nord AUX, VCO divider, swing/pre-emphasis
tables and ver_ops, with phy_status_reg overridden to DP_PHY_STATUS_NORD
(0x0110) and bias1_en_2lane set to 0x03 for correct 2-lane operation.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 361f4e467351..338f28cb404f 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -1847,6 +1847,29 @@ static int qcom_edp_phy_tx_res_cfg_nord(const struct qcom_edp *edp)
 }
 
 
+static const struct phy_ver_ops qcom_edp_phy_ops_nord = {
+	.com_power_on		= qcom_edp_phy_power_on_nord,
+	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_nord,
+	.com_bias_en_clkbuflr	= qcom_edp_com_bias_en_clkbuflr_nord,
+	.com_configure_pll	= qcom_edp_com_configure_pll_nord,
+	.com_configure_ssc	= qcom_edp_com_configure_ssc_nord,
+	.com_ldo_config		= qcom_edp_ldo_config_nord,
+	.phy_tx_lane_cfg	= qcom_edp_phy_tx_lane_cfg_nord,
+	.phy_tx_res_cfg		= qcom_edp_phy_tx_res_cfg_nord,
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
+};
+
+
 static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },

-- 
2.34.1

