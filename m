Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3494B421251
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887174; cv=none; b=QAf8VRGfdst9YRzJC8saHwxbQQopcTAVq3uqeHwWWc/vfcXZ8yRONvFmqdbFn3T6oaEStaHrASYdGe1ffZ9erbOIsO3pnhn5avgQc7HonLWYY+QMI9tLNMwYyqfTzNgQM4uTXVc7m6z5z0cJFBq4Eb3bp5PU4XivrXfy40XQmBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887174; c=relaxed/simple;
	bh=7PWO/rmOMB/INrcy7L02xPLVPSTg5CtiuHCwAe7/WBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZkkGfvCcUAlC6wBqoxPWdHHLLKbqrp1PmGprOhr+75DdMOp8AP18tB0r0eHDIoZIE9OCab1t3eqzkR7d72HmEmu2yU5Aq18fcu/WcWpmNGnzDEZfj2xlgd8ZzfAMkeJbZXIIx6IjUMPG1bMjWtCbrqURf+2Hq2qjBBpAljiJb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GX9DqWwH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V4PaIuo2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GX9DqWwH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V4PaIuo2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CRKI949375
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XFUwTfQDkVnqeA/tF6NFKAol
	awlux0KkzVVWyuMzsqc=; b=GX9DqWwH+E/919mEvs0RhmiLoecGAC768fDrT/sO
	IkRtgNHxo/mWWGvL87dS0gk56l+Xq4Rxq6J+SGFvTUV8UBVRjvsbcXIOOuxU77ZO
	izHpUyd22ulUGhNp1C49mYak2O96vfFV6Rz/7HY96nW+TJgdQsUPpmSLPioSgJ/T
	WVKHuM+zuwr4KWsgoMA4oJEc+kZ85azti/CDznStH+xwI0lBZ4Q1ZdnXf1vHx41+
	D43ObdnskSLTwofeDI/qTKviiJSoWpM/rhJz7Is1mWl7n3bjwpA/qVJRXWBIrWnC
	LEGB/LTdJIdevg1W0enyQwk9D9gBj5hpXwwCJMunxtikWg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f62929e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:26:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caa0ce0cdso307798985a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887171; x=1792491971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XFUwTfQDkVnqeA/tF6NFKAolawlux0KkzVVWyuMzsqc=;
        b=V4PaIuo2zUXwXlpVjSZTnT9OYYPJtVRkhzv2BKrPu75BJkdmGXtcQxTlwypZOpUhe2
         dPrU+sSsRp4UbvHYozN6B3mEvQHxIQ3dsNY8tfDQ9bxkg5tUInNQlxoBq4dP+ynux5cP
         q2OlpbJOy7wARqToSzy5zps7+LoSSIloGKUx2ZF4xZ3kf2wpyU7Vyu7pdJDXcRb2kal3
         y0ghTz4VDyxVIpB7mMwTS4PypE/a/8q4sm2Lozcs5dbd5ckWcDnY+ZCHzti4rDdj14kr
         vtNOj6LiO+IXug08ioiZFf0Z21RFlTE/ZrNG/RwzXZrUPGmDE1tJ1fqwYPb4Yjm2T5+s
         Jrrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887171; x=1792491971;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFUwTfQDkVnqeA/tF6NFKAolawlux0KkzVVWyuMzsqc=;
        b=gTksLOK1ZlR8qPqtXuZSBnm7ZJj5Zo6MfvAUHaL77oeyn7vYf8ZDMvcmvf2waE5RjT
         KJ9W3W7NHqwe5axHaVsb9wOn6upXiSyGWW+H326567qGyuCVLhmnRqnWxskp3amBzETT
         68j7Edi4vQKHe3sZQYxvBLeSaw+3531QjqRFkDi0kj5JmU8SPwyL2mge01vsI38aYN3R
         H1OkhjbWDvCjvaUmqsv2FCY9I/X4LypoCw3jaKBaqVaqUoVIyE+MQ5KqhnNw5woSFbon
         13YeG+jCGF1+iDAB+jceu8IPgTNnOykRin9sxQKjGw+4Zae1dHOsczzJ8aDoZseee19p
         MduQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOp03c8sCJibXOvCWGYL1GqkVdK62jsqS85YTdla9UEzuXi17sBeJyiQiu3PTCh+QhaUFv6xMG1uszN04=@vger.kernel.org
X-Gm-Message-State: AFq9FYImnAU+TSFNZzflCMnXYEL4moVk6Fle4phm8hMNatYh2DGfTiFl
	ZySNufvJ+Vm1RO4M8MXK+AliZIOC1Js/dXPWqOi3u8UBnW7Bbf7ZSCkJM4tEqWd+Rh9S3qTKIHr
	YmvXbXuteMV8jsyhrI0goMd97I593q3H8ZhbtJrpMTCoXrY+O1sOqVWcyyDbpDi7MFxU=
X-Gm-Gg: AYBFou3zYfcYNxRbe7CZPGaJtjET4pdzeh+ov5b1Huo4G1AYJRqZfu6pso7Y9h4xVYG
	AZ+6KMT7cjhiMKyP6PO8YM8Hjza7s92DsPmDzQgqZUNXCnqD0FuK5pRwR6PhytmjtA79OPV14LW
	3i0vVWO0lme4W1/4cKUgcCFGpz4jDt87NA2fF2g5ww6a0ynloSQF5DcbhsUlL2HQDqPXgKMjqw0
	L3siIz8waL9mSwRipi0J/ikIDH1+kFOZu+5PJzsTuC+9v2Hmw+l36WOx4xm8Z+U7ITEPutBDqgP
	G0vwaxTk3SrM4SXrgATaA8XsvkKq3nNvcrHI8wwHVwI29DPdXBFHxllz16bce/evE+F7xh98zdS
	SDIexX6RzJUd1vrJIziahdC7jyhADhm0MSYmjed70y9CqvECTvYMrgDSKrjF2ulMYv689pb6OwN
	LqXPW3VnAtDDUW
X-Received: by 2002:a05:620a:2b8b:b0:93e:bbda:dd06 with SMTP id af79cd13be357-93ebcc0f86emr1896452685a.0.1791887171113;
        Tue, 13 Oct 2026 03:26:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8b:b0:93e:bbda:dd06 with SMTP id af79cd13be357-93ebcc0f86emr1896447685a.0.1791887170357;
        Tue, 13 Oct 2026 03:26:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddea81c7sm3490792e87.49.2026.10.13.03.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:26:09 -0700 (PDT)
Date: Tue, 13 Oct 2026 13:26:07 +0300
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2 08/13] phy: qcom: edp: Generalize power-on path for
 per-SoC overrides
Message-ID: <y5yofnl3x5jg7yxwzlpl543yir6uos3c3tj45u4ocjvy7u6sgz@2c5u5szohx2i>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-8-a2ab9af954d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-nord-drv-dt-v2-8-a2ab9af954d2@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace0744 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=x5eWZYghlK0YOYNvIKQA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX9fE9PzdEPBHt
 Wr6ZYp2hq25EhNaBad7UXhi6Izuuf1QG+UaHDc/ublT4sDYQP3Nqx9mhjYUAEmELEU29V0MyjKa
 uMEGJDlWAtuUaIHJAhiw3KWkX6mVt2E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX0BdxS4ZynxB/
 RoU4yXcSZSUpNc0h0numW+LzPjDSq1GGo7xjD8axV9Z7CfFIls1xxgQbTBQqaYilMHGczFWnrS/
 lgXuD6OP9X+NqFria/+ObjDeYg+ihnZ4/WuHQDu9UKue/UuvTajcwQPw/4534zXTtxzzEw8a7Rp
 SVCJM5djsRNApsnlrS3YAbhmH5lUp6N7/jy3g8iOyvf8krS0NrPYjKdc6bvPhEkspdEfX8BnGjZ
 Kq2rzQdJxfShLGs8MBe7hdH1VnFt4C5PYtBrkajZqAC2EuLUWFMtNLchvDtwCzuYjEvDJSLORJO
 B3hbJ9VEcCNaBhZe2Y6SJiI6uDqX9ln0o03K581NnkgOxHfs65+wy1RCdPhYctmhPGpSU6TmT/B
 iot61C+iNHGw/PUwi4TDpDXawqAKebP3ui7YpkNScKTJ+1WwFUxbdxthDeVsEA+ppiwVMtJZuAm
 vLI2PVSXHp/nnBL3ncw==
X-Proofpoint-GUID: IxURyw6UT4beb1HXBoiM3Y9jaNZC4nYw
X-Proofpoint-ORIG-GUID: IxURyw6UT4beb1HXBoiM3Y9jaNZC4nYw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130041

On Mon, Oct 12, 2026 at 07:02:18PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord has a different register layout that the existing hard-coded
> power-on path cannot accommodate.  Introduce qcom_edp_tx_res_entry
> and replace open-coded TX resistor writes with a data-driven loop
> that also handles base=2 (PHY/edp base) for Nord.  Add
> phy_status_reg, bias1_en_2lane, tx2_tx3_lane_ctl, tx_res_cfg,
> cmn_status_reg and c_ready_status_reg to qcom_edp_phy_cfg, and
> make com_clk_fwd_cfg optional.  No functional change for existing
> SoCs.

This becomes too much table-driven, while the edp driver preferred the
code-driven approach.

> 
> Assisted-by: LLM
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 82 +++++++++++++++++++++++++++++--------
>  1 file changed, 66 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index d5c6835b6c70..c5df1086607f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -81,6 +81,15 @@ struct qcom_edp_swing_pre_emph_cfg {
>  
>  struct qcom_edp;
>  
> +struct qcom_edp_tx_res_entry {
> +	u8  base;
> +	u32 offset;
> +	u32 val;
> +};
> +
> +#define QCOM_EDP_TX_RES_ENTRY_END { .offset = 0, .val = 0, .base = 0xff }
> +#define qcom_edp_tx_res_entry_is_end(e) ((e)->base == 0xff)
> +
>  struct phy_ver_ops {
>  	int (*com_power_on)(const struct qcom_edp *edp);
>  	int (*com_resetsm_cntrl)(const struct qcom_edp *edp);
> @@ -98,6 +107,12 @@ struct qcom_edp_phy_cfg {
>  	const struct qcom_edp_swing_pre_emph_cfg *dp_swing_pre_emph_cfg;
>  	const struct qcom_edp_swing_pre_emph_cfg *edp_swing_pre_emph_cfg;
>  	const struct phy_ver_ops *ver_ops;
> +	u32 phy_status_reg;
> +	u8 bias1_en_2lane;
> +	u32 tx2_tx3_lane_ctl;
> +	const struct qcom_edp_tx_res_entry *tx_res_cfg;
> +	u32 cmn_status_reg;
> +	u32 c_ready_status_reg;

If anything, it should become a part of the ver_ops. But, I think, it's
better if you add callbacks to ver_ops instead of just describing regs.

>  };
>  
>  struct qcom_edp {
> @@ -313,9 +328,11 @@ static int qcom_edp_phy_init(struct phy *phy)
>  
>  	memcpy(aux_cfg, edp->cfg->aux_cfg, sizeof(aux_cfg));
>  
> -	ret = edp->cfg->ver_ops->com_clk_fwd_cfg(edp);
> -	if (ret)
> -		return ret;
> +	if (edp->cfg->ver_ops->com_clk_fwd_cfg) {
> +		ret = edp->cfg->ver_ops->com_clk_fwd_cfg(edp);
> +		if (ret)
> +			return ret;
> +	}

This is fine, but why?

>  
>  	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
>  	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> @@ -672,6 +689,16 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
>  	.com_ldo_config		= qcom_edp_ldo_config_v4,
>  };
>  
> +static const struct qcom_edp_tx_res_entry tx_res_cfg_default[] = {
> +	{ 0, TXn_RES_CODE_LANE_OFFSET_TX0, 0x11 },
> +	{ 0, TXn_RES_CODE_LANE_OFFSET_TX1, 0x11 },
> +	{ 1, TXn_RES_CODE_LANE_OFFSET_TX0, 0x11 },
> +	{ 1, TXn_RES_CODE_LANE_OFFSET_TX1, 0x11 },
> +	{ 0, TXn_TX_EMP_POST1_LVL,         0x10 },
> +	{ 1, TXn_TX_EMP_POST1_LVL,         0x10 },
> +	QCOM_EDP_TX_RES_ENTRY_END,
> +};

This becomes hard to manage. Please use ops instead.

> +
>  static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
>  	.is_edp = false,
>  	.aux_cfg = edp_phy_aux_cfg_v5,
> @@ -679,6 +706,9 @@ static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
>  	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>  	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>  	.ver_ops = &qcom_edp_phy_ops_v4,
> +	.phy_status_reg = DP_PHY_STATUS,
> +	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
> +	.tx_res_cfg = tx_res_cfg_default,
>  };
>  
>  static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
> @@ -687,6 +717,9 @@ static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
>  	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>  	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v3,
>  	.ver_ops = &qcom_edp_phy_ops_v3,
> +	.phy_status_reg = DP_PHY_STATUS,
> +	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
> +	.tx_res_cfg = tx_res_cfg_default,
>  };
>  
>  static const struct qcom_edp_phy_cfg sc8180x_dp_phy_cfg = {
> @@ -695,6 +728,9 @@ static const struct qcom_edp_phy_cfg sc8180x_dp_phy_cfg = {
>  	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg_v2,
>  	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v2,
>  	.ver_ops = &qcom_edp_phy_ops_v3,
> +	.phy_status_reg = DP_PHY_STATUS,
> +	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
> +	.tx_res_cfg = tx_res_cfg_default,
>  };
>  
>  static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
> @@ -703,6 +739,9 @@ static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
>  	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>  	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>  	.ver_ops = &qcom_edp_phy_ops_v4,
> +	.phy_status_reg = DP_PHY_STATUS,
> +	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
> +	.tx_res_cfg = tx_res_cfg_default,
>  };
>  
>  static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
> @@ -712,6 +751,9 @@ static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
>  	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>  	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>  	.ver_ops = &qcom_edp_phy_ops_v4,
> +	.phy_status_reg = DP_PHY_STATUS,
> +	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
> +	.tx_res_cfg = tx_res_cfg_default,
>  };
>  
>  static int qcom_edp_phy_power_on_v6(const struct qcom_edp *edp)
> @@ -913,6 +955,9 @@ static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
>  	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>  	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>  	.ver_ops = &qcom_edp_phy_ops_v6,
> +	.phy_status_reg = DP_PHY_STATUS,
> +	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
> +	.tx_res_cfg = tx_res_cfg_default,
>  };
>  
>  static int qcom_edp_com_configure_ssc_v8(const struct qcom_edp *edp)
> @@ -1045,8 +1090,8 @@ static int qcom_edp_phy_com_resetsm_cntrl_v8(const struct qcom_edp *edp)
>  
>  	writel(0x20, edp->pll + DP_QSERDES_V8_COM_RESETSM_CNTRL);
>  
> -	return readl_poll_timeout(edp->pll + DP_QSERDES_V8_COM_C_READY_STATUS,
> -				     val, val & BIT(0), 500, 10000);
> +	return readl_poll_timeout(edp->pll + edp->cfg->c_ready_status_reg,
> +				  val, val & BIT(0), 500, 10000);

This is already a version-specific callback. Can't you just add one for
Nord?

>  }
>  
>  static int qcom_edp_com_clk_fwd_cfg_v8(const struct qcom_edp *edp)
> @@ -1074,8 +1119,8 @@ static int qcom_edp_phy_power_on_v8(const struct qcom_edp *edp)
>  	       edp->edp + DP_PHY_PD_CTL);
>  	writel(0xfc, edp->edp + DP_PHY_MODE);
>  
> -	return readl_poll_timeout(edp->pll + DP_QSERDES_V8_COM_CMN_STATUS,
> -				     val, val & BIT(7), 5, 200);
> +	return readl_poll_timeout(edp->pll + edp->cfg->cmn_status_reg,
> +				  val, val & BIT(7), 5, 200);

The same.

>  }
>  
>  static const struct phy_ver_ops qcom_edp_phy_ops_v8 = {
> @@ -1094,6 +1139,11 @@ static struct qcom_edp_phy_cfg glymur_phy_cfg = {
>  	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg_v8,
>  	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>  	.ver_ops = &qcom_edp_phy_ops_v8,
> +	.phy_status_reg = DP_PHY_STATUS,
> +	.tx2_tx3_lane_ctl = DP_PHY_TX2_TX3_LANE_CTL,
> +	.tx_res_cfg = tx_res_cfg_default,
> +	.cmn_status_reg = DP_QSERDES_V8_COM_CMN_STATUS,
> +	.c_ready_status_reg = DP_QSERDES_V8_COM_C_READY_STATUS,
>  };
>  
>  static int qcom_edp_phy_power_on(struct phy *phy)
> @@ -1128,7 +1178,7 @@ static int qcom_edp_phy_power_on(struct phy *phy)
>  
>  	/* TX Lane configuration */
>  	writel(0x05, edp->edp + DP_PHY_TX0_TX1_LANE_CTL);
> -	writel(0x05, edp->edp + DP_PHY_TX2_TX3_LANE_CTL);
> +	writel(0x05, edp->edp + edp->cfg->tx2_tx3_lane_ctl);

This one is almost fine.

>  
>  	/* TX-0 register configuration */
>  	writel(0x03, edp->tx0 + TXn_TRANSCEIVER_BIAS_EN);
> @@ -1166,13 +1216,13 @@ static int qcom_edp_phy_power_on(struct phy *phy)
>  	writel(0x00, edp->tx1 + TXn_TX_POL_INV);
>  	writel(0x10, edp->tx0 + TXn_TX_DRV_LVL_OFFSET);
>  	writel(0x10, edp->tx1 + TXn_TX_DRV_LVL_OFFSET);
> -	writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX0);
> -	writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX1);
> -	writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX0);
> -	writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX1);
> +	for (const struct qcom_edp_tx_res_entry *e = edp->cfg->tx_res_cfg;
> +	     !qcom_edp_tx_res_entry_is_end(e); e++) {
> +		void __iomem *base = e->base == 2 ? edp->edp :
> +				    e->base ? edp->tx1 : edp->tx0;
>  
> -	writel(0x10, edp->tx0 + TXn_TX_EMP_POST1_LVL);
> -	writel(0x10, edp->tx1 + TXn_TX_EMP_POST1_LVL);
> +		writel(e->val, base + e->offset);
> +	}

Unreadable. Once we move on, these regs can be used to write anything.
If it's a really one-off for Nord, just check for the compatible string
or do something similar. I'll check the other patch.

>  	writel(0x1f, edp->tx0 + TXn_TX_DRV_LVL);
>  	writel(0x1f, edp->tx1 + TXn_TX_DRV_LVL);
>  
> @@ -1184,7 +1234,7 @@ static int qcom_edp_phy_power_on(struct phy *phy)
>  		cfg1 = 0x1;
>  	} else if (edp->dp_opts.lanes == 2) {
>  		bias0_en = 0x03;
> -		bias1_en = 0x00;
> +		bias1_en = edp->cfg->bias1_en_2lane;
>  		drvr0_en = 0x04;
>  		drvr1_en = 0x07;
>  		cfg1 = 0x3;
> @@ -1207,7 +1257,7 @@ static int qcom_edp_phy_power_on(struct phy *phy)
>  
>  	writel(0x19, edp->edp + DP_PHY_CFG);
>  
> -	ret = readl_poll_timeout(edp->edp + DP_PHY_STATUS,
> +	ret = readl_poll_timeout(edp->edp + edp->cfg->phy_status_reg,
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
