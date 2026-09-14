Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85E3F9C0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789344058; cv=none; b=BPozlIj3bIJuhccgAqOuww+Qg/r+kuV/ET8BFhlZXNSaaYEKelD5L4QfS4gp6bKObc6Otg5xSiHDfUOseG8evZ7+9P5P4Cx0iLGRQIP5YQfhb7SAP326x7QCSKkTYqXOns886t/cYXgZtgzTMdyrUJCpJkgAZFaEcxm/1j63kyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789344058; c=relaxed/simple;
	bh=X5HXwLu9t1UwOwcHmCYNUZYuQjycJISbv868z5ah7Bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYLnjmMkjr6w6axNR0VB/8UnoQlFuti7I2gC26a2X+sJcyxelGtsmRBl8nBl9tWLVDR8Yq83kE9gc1fjoQIaFy8qAhJUQgYVGPzNUK8Ia+kcx6KcPqFtr//DJ0i7fSp7T3gcJNTGifC+smUaToxDl7uhyNerDcFa+WM2iEFIHxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=csTbHLDm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IIReZ4UZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="csTbHLDm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IIReZ4UZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DNZGtw2598448
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fU+lghccay3l1YWQR2/TeQBg
	Cl7YEhDXjCfG/4VrNcI=; b=csTbHLDmRcWjzPz7H2hA8nEsq5UI96VBpJnRgJnf
	nXjIfexOeAwW5G86SoKx5p8ESVoAHQJHy96cbGQ7DEO2+hschSsiyZpnd4aZ0WB5
	Dg5L5fTjbVWBWynlhDMnrRpE9wZfqncsCl4mG57V1qN3P1WoS6YJYyLFrPy1HYTv
	M19EjO44YwpE8y7D0+fiIiR200LT/TlTj+9llC6dBHK7Zzt95HzuLhCsbXbL325r
	JkYkyWAyX9YrNUv0yMlGlZoq/SBAd0jP57NVZC+tETczp9JQ8XSQnlely7cFT3Qx
	oD+iYJTBJC0AJ+hAtGiaxO2z5+1MT2IXWihruGGVhDjPaw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd4dqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:00:54 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c96449cbb2so346394e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789344054; x=1789948854; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fU+lghccay3l1YWQR2/TeQBgCl7YEhDXjCfG/4VrNcI=;
        b=IIReZ4UZrPx4PGn8b12/Jp5LJpbEzi6vX7SH3qcPkYK+ODRT7TvhPtFnQBM6+V7Zrm
         rNnQ1Biy+HZBVXMv5JjwsRPv2Z990EQU9+ajSR6cccmwHxe5vhDphMYD2ssp5qAXzSek
         eKhrZ8hnL6q8VOfGuQuO43QtqcvXT2WdEIm7qCkWnQO/yJ7HvaSLE7x8Ri3BXBfTj8HC
         mYKNyOOmD4XRkYa+4rAq/cP9dso+Gwcm1ob2c/NwNbYi1s3Gu7GI2vB/dWGzrYhMVOrY
         zkK2gAca0NNUWzBUOZ4q/VG8y5gxcwg/90rtBgtIWzO9eSvkKfvLJRlHPBgsq8lr2EzA
         cw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789344054; x=1789948854;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fU+lghccay3l1YWQR2/TeQBgCl7YEhDXjCfG/4VrNcI=;
        b=Ep3QCxm5HH+D61avyrVmknUMh2El52wuXyddoBESBdlKCkOjmlrSE7KcNvJWVGTfp1
         9U/KD6LZfmHRYBc3Wwvu5bqBASrvVP2bDVw600E5RmFMGL/TrnsWmBY70zCVUy8ga8Ic
         dQ9ttOBKH7cN32C/+mEr5JqDp1PGoiXaeKIAZnkhef8pYB4X+qE6CgCsbFV1f3KqkajJ
         cy+ygh/JtbfsmUWqhSJ689rKgIltRMUQ4srIeAsWHrpT6hkt4qqzzMnCNaVvLtZrSA5h
         SQW2EvRPdKNTKLJqgvIS6JcHKW8kXTs952l+Bzy8THg3b0P7YAcFd22rSm6hqv/QUykA
         7/Cw==
X-Forwarded-Encrypted: i=1; AKwUvBxqs0SaPeieu7NEwXm/SGVDTWz8K55dpWZQr/CGni7NvnM+os3DfpineoB8Btiu73JeGlga2aaTC2ht+hQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l1/u7Wb2gedlMY+vUh1ZXVI/dR8HjE5e02g88Vhkdtseu2Bo2S
	VdCu6QTlIe5jumcljOxkP1tCwpLFyA7Ns0Fhc3ZM957UUzAJRsNuwM5m6+0rXyDNrN+7ZqWjzVt
	1lEutH0ji53OpBxVZ+562CRDfb5XbTz6h7WHDg6C4v/bg4yhov7UK3EZtJ8fb68/Xrc8=
X-Gm-Gg: AYBFou19GCTRldzY1c4g2yy8WMRm3SpPBDLl4dyVU05ofu6pxzmXn6mUqnZFh6DYLO7
	1WtRwvK/vrkOeoBYlhMY588eOTxSIoxScc+efTr+TajWTmmynFm3z5P2RG/85cj4fAvs22y/zMZ
	c40NJwggu/5ggTiQBJ+UB6ayxsRVn1VoFP3A68plTYzzxfsHSXkdFj4ymVylj/eozTg+Dhc+qmV
	ohWRcnBto7ASltDwRYt9CxGCkKtOMvN4Mhtr7jv8TZFxeSH0whs+trspK+0q7x0q2gOG9U2bkUp
	Yjfk9OQRhIOvWYMVMou9uC28Gwzm7iio6BMZ3RbR1m5wiTyeFuydckLWYzOUQTtezVQWc5lzTEl
	Q9tj32vfea+XCzqtZRTu9ungsX9IKHUdygP8e1SK56wn+0BczuskAaoxpJCat0g0ZfvXeblKxq+
	TyywQ7rxCr0YNo
X-Received: by 2002:a05:6102:f13:b0:79a:21f6:20fc with SMTP id ada2fe7eead31-79b5abbb41fmr37345137.10.1789344053617;
        Sun, 13 Sep 2026 17:00:53 -0700 (PDT)
X-Received: by 2002:a05:6102:f13:b0:79a:21f6:20fc with SMTP id ada2fe7eead31-79b5abbb41fmr37319137.10.1789344053173;
        Sun, 13 Sep 2026 17:00:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0464430sm2051683e87.42.2026.09.13.17.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:00:50 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:00:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 08/17] phy: qcom: edp: Generalize power-on path to
 support per-SoC overrides
Message-ID: <mpkoztwm2ts4pb3m4t6347wfes4yeua5a5uxrn66dgmn6b6gpq@syu2fxzfmvp7>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-8-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-8-e25c073cf1b6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa73936 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=tuu3QHpEyBHuk3RROvYA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDM0NCBTYWx0ZWRfX1el1kbB5sqoe
 m6Y9TGzysNV+b5TXwbvkEuu/f2s5O4fFjDIi1kAMO2I0cEY7OSVSxhQLTJ6S+lXT/3Mztd4xFpw
 0aHB3CvwtZ2lvEqfMYK+R+8Gtyo349Qxm4SF6xuRtA+RzlAzJFPaqQm5rLifCbQ0c4482RcOkbD
 GDKV0rejDHHZcoUokYceGSmbUNeQ1MhpENhuCjwg4RUtYHKDLBqVkrORwFf2HxDlwm1Ni2jWXve
 XlgR3G/YMoKq5+uQZjn0TisPdEoX4n0NlUk7h+I9ej89EMZa45plrPzcSocI0H++9Ca1PZWL5PK
 7grrU3SZIhmSH+OnhhyTWejHTHSqNxpAaPozD+MlNB1SxhPuOKV1M9chSJupfx+usjpwT4bzUK2
 lq7kKZ0pRGsk1yrrJTHu4MR1P/xW9dV9nCDdB6lzUtr+aB2bzCny65xn3GaG2uhKbLf4uxJejil
 MEYxW835i4qPS9G/FFQ==
X-Proofpoint-ORIG-GUID: SIoLs5BFv9WsYy-d38MAIXqAEbSE2jma
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDM0NCBTYWx0ZWRfX3gcyQtTxTviH
 N5NAn9kZ5gqoMDHYoRU+5T1TpzM2H2jZ4rkete/BxrNj3+05VhNdA2vnTS71+1qjPTlDp+mlKBM
 J722+51B4/CHF0n5hehMZcKKItqoz2Y=
X-Proofpoint-GUID: SIoLs5BFv9WsYy-d38MAIXqAEbSE2jma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130344

On Fri, Sep 11, 2026 at 09:06:39PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord has a different register layout and power-on sequence that the
> existing hard-coded paths cannot accommodate.  Make com_clk_fwd_cfg
> optional,

Why?

> add phy_tx_lane_cfg and phy_tx_res_cfg callbacks to
> phy_ver_ops, and add phy_status_reg and bias1_en_2lane fields to
> qcom_edp_phy_cfg so each SoC can override the defaults.  No
> functional change for existing SoCs; new fields default to zero/NULL.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 43 ++++++++++++++++++++++++++-----------
>  1 file changed, 30 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index bf8a17336c7e..373f13b3d6d5 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -92,6 +92,8 @@ struct phy_ver_ops {
>  	int (*com_configure_pll)(const struct qcom_edp *edp);
>  	int (*com_configure_ssc)(const struct qcom_edp *edp);
>  	int (*com_ldo_config)(const struct qcom_edp *edp);
> +	int (*phy_tx_lane_cfg)(const struct qcom_edp *edp);
> +	int (*phy_tx_res_cfg)(const struct qcom_edp *edp);
>  };
>  
>  struct qcom_edp_phy_cfg {
> @@ -101,6 +103,8 @@ struct qcom_edp_phy_cfg {
>  	const struct qcom_edp_swing_pre_emph_cfg *dp_swing_pre_emph_cfg;
>  	const struct qcom_edp_swing_pre_emph_cfg *edp_swing_pre_emph_cfg;
>  	const struct phy_ver_ops *ver_ops;
> +	u32 phy_status_reg;
> +	u8 bias1_en_2lane;
>  };
>  
>  struct qcom_edp {
> @@ -316,9 +320,11 @@ static int qcom_edp_phy_init(struct phy *phy)
>  
>  	memcpy(aux_cfg, edp->cfg->aux_cfg, sizeof(aux_cfg));
>  
> -	ret = edp->cfg->ver_ops->com_clk_fwd_cfg(edp);
> -	if (ret)
> -		return ret;
> +	if (edp->cfg->ver_ops->com_clk_fwd_cfg) {

Why?

> +		ret = edp->cfg->ver_ops->com_clk_fwd_cfg(edp);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
>  	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> @@ -1131,7 +1137,13 @@ static int qcom_edp_phy_power_on(struct phy *phy)
>  
>  	/* TX Lane configuration */
>  	writel(0x05, edp->edp + DP_PHY_TX0_TX1_LANE_CTL);
> -	writel(0x05, edp->edp + DP_PHY_TX2_TX3_LANE_CTL);
> +	if (edp->cfg->ver_ops->phy_tx_lane_cfg) {
> +		ret = edp->cfg->ver_ops->phy_tx_lane_cfg(edp);
> +		if (ret)
> +			return ret;
> +	} else {
> +		writel(0x05, edp->edp + DP_PHY_TX2_TX3_LANE_CTL);

if it's about a single register, add a register to the map instead.

> +	}
>  
>  	/* TX-0 register configuration */
>  	writel(0x03, edp->tx0 + TXn_TRANSCEIVER_BIAS_EN);
> @@ -1169,13 +1181,18 @@ static int qcom_edp_phy_power_on(struct phy *phy)
>  	writel(0x00, edp->tx1 + TXn_TX_POL_INV);
>  	writel(0x10, edp->tx0 + TXn_TX_DRV_LVL_OFFSET);
>  	writel(0x10, edp->tx1 + TXn_TX_DRV_LVL_OFFSET);
> -	writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX0);
> -	writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX1);
> -	writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX0);
> -	writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX1);
> -
> -	writel(0x10, edp->tx0 + TXn_TX_EMP_POST1_LVL);
> -	writel(0x10, edp->tx1 + TXn_TX_EMP_POST1_LVL);
> +	if (edp->cfg->ver_ops->phy_tx_res_cfg) {
> +		ret = edp->cfg->ver_ops->phy_tx_res_cfg(edp);
> +		if (ret)
> +			return ret;
> +	} else {
> +		writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX0);
> +		writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX1);
> +		writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX0);
> +		writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX1);
> +		writel(0x10, edp->tx0 + TXn_TX_EMP_POST1_LVL);
> +		writel(0x10, edp->tx1 + TXn_TX_EMP_POST1_LVL);

Either use a register map or move defaults to the callback too. My
preference is towards the former option.

> +	}
>  	writel(0x1f, edp->tx0 + TXn_TX_DRV_LVL);
>  	writel(0x1f, edp->tx1 + TXn_TX_DRV_LVL);
>  
> @@ -1187,7 +1204,7 @@ static int qcom_edp_phy_power_on(struct phy *phy)
>  		cfg1 = 0x1;
>  	} else if (edp->dp_opts.lanes == 2) {
>  		bias0_en = 0x03;
> -		bias1_en = 0x00;
> +		bias1_en = edp->cfg->bias1_en_2lane;
>  		drvr0_en = 0x04;
>  		drvr1_en = 0x07;
>  		cfg1 = 0x3;
> @@ -1210,7 +1227,7 @@ static int qcom_edp_phy_power_on(struct phy *phy)
>  
>  	writel(0x19, edp->edp + DP_PHY_CFG);
>  
> -	ret = readl_poll_timeout(edp->edp + DP_PHY_STATUS,
> +	ret = readl_poll_timeout(edp->edp + (edp->cfg->phy_status_reg ?: DP_PHY_STATUS),

No hidden defaults, thank you.

>  				 val, val & BIT(1), 500, 10000);
>  	if (ret)
>  		return ret;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
