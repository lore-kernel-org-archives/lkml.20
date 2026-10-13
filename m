Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FA14B95BD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887630; cv=none; b=t0U2i2+NaRx4Qx8/285oz0oa2rUrLVXuiJtx46ZmcLQdMnGcwJ0KJqN4jW5GGK+KgQdbUx46dI82E2K9eW11Xy+hY7xTevn0aTwDfZJmSn82pvGaXliZGwBdPtKR1Xh04EinqvGrDHrQUqXQLsfPVjyKtfZw0RJwP3Quop3A75k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887630; c=relaxed/simple;
	bh=VVyZjNphYVGJM/rWxbCNdFFmqMiC03mYNzpp8hWUnNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0urRK/X08chMe8YPRGz2H/IRM36uhDRDqnCjwTJEN2JJyZwu6yEE0vPYH8LqHe0BJ0LARwvY9Tkg1r7t74NPiWpekG+7+5A0JH2wHbmw27ksNfSem2TSM0h4nB9XI3ezOcJ9Q9tIQL7ftVvPln2uG1UU6TXD4kX1RPWd21Z16I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJ3Zlk3I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OSV9TqEd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJ3Zlk3I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OSV9TqEd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6Z3rP3209360
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0vSG8Ljr5b10pBXucNpPOPKZ
	f1BmJbl53I6Oq9DgsGI=; b=KJ3Zlk3IhP6BXtSNbZ3XO1PwV4ShC1Vu0zAijAWN
	uWx7u6lZ/QqL7cv59e4KMrQqi5s4pg3RrgzndC7budPfwi6PpOunYbCnaKNP4bHN
	JltrgL0OmfmnXf4r47z5caLBtQc+GejYfFPLw9ZEQBHYQ3aWEPa6aij+UYnRYzYx
	X0TBBilKy44rq7kPfkGV6UIJXQpJvwK6FcmI52es5Glj5EIBOy7xYTwY5IOeDMNz
	3PVrOnJaAGSEqG5/TC0JedcxuXgBe7fqMSYRrjshyuNFIXw8AlHH6r3y+L4J/m4j
	kmnOkMIIdLlenO/2ovmsx6xF/3Nbpu8QiIO3YuUQHqMhtQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjh05t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:33:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dd3c3badbso629488285a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887627; x=1792492427; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0vSG8Ljr5b10pBXucNpPOPKZf1BmJbl53I6Oq9DgsGI=;
        b=OSV9TqEdNIERNxerqk+HhyxuXJei4U7qIcMjW2iXYQtcSQvFi3OQjA6YWejQf5gLeh
         UXh0+ZdUKBVKU+mq3wrxiOyhQm5lhgMD6DfAbfUOVLGuE67MVHXdT6FjkmRpEmHk9/ib
         xHUY9NcbhdsrbTCKc3xReMjy5VKNPkAn0OL737huq7X+eUe2JcG1C9Di+z65Q1UmZOgj
         y4bk+vjz93xLhx0D6Kcy7QnynIJDdi/HkFFe/vgDXbG1S0sxQjizE4/+uxTM2X+NWD9k
         5JKWJ8RUvCFGFZa5MV3kjDitaqLAVdQDj9XPPDe9M2vjmtsc04AYvM1me8Qf7kZ/z25D
         tPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887627; x=1792492427;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0vSG8Ljr5b10pBXucNpPOPKZf1BmJbl53I6Oq9DgsGI=;
        b=AcAzV05hCFDYk/WH81C000MEkSCfHEM8imCSQ5Jt8RJB5cK6QviV6rVpl6Tn5APDX4
         kROtHSTobnzjVe8j2YoevCuhB4vkLBFxc74s6i/QoCnPrqYCYAD4wTXNYYtziqvTdr8t
         jP0lGASxQAfDkj7Q+QGW3UiFY//MIfl5L8Eg8r32ay0LhsYgsa3bWEMXMowj/MFVVg8n
         IdA1Mn36A9J2VJzmz9sIuG0X+KrDJRG1ckSO6nQ35cPudvJnYwJOIKSPgde5ezwh/WbU
         BJgJoMTIwdOWQjl1Efi3rKZ5qTYEjLTzeCEvcrno92J6rLJOb4J5f5B6Ar4uaODKuCqP
         JuAw==
X-Forwarded-Encrypted: i=1; AKwUvBwffbsHawvN7Nl2Exo+PFc7D2xOUmZUxk6pMcfEoTkQWrok/EF6vTtBA2EMWPKjlyZoGDa8jIxUaqooyts=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4QUHThuHbqHuwjiZws3immhEKFNqRpQLiWHCIryVOqEfS1Bqx
	UE8koSNqxV5NmxlfSRaSBmQrgzfYbjehadrfcqa2QOiTjK2yBqTTS56/j4JXmtWd4sZpmHPBwtv
	l9U1Tz+IWe/bT+yUczaPPIbEzJPl8Qb5weJXYBe5qcrmdHh8hFyac2YlodXctXwSpqSA=
X-Gm-Gg: AYBFou2lqK3cDVz4zQhyjDG02clZfac18O247Ym9DPDIrCg3THjI19SaQ2Vr55fOucD
	h6wr/eiDnjZC8Jwos0vH9T/EDlbpTb9Okai/Pz11+Y6FQp4CaWpk3gLK8iOzLAsVdzWY5kymMV4
	Mh3yl9Z48Tz6QvTwPhyb0MkNJBZstjQbpYkDcfp2lLeViRl1aTWvrvafhDvDda3d8QVcBGEk31f
	1cMR5RvAT691GjD5UP3kDRodbx1FHeG87oWS3FW59dLzr09IiiwFK1Gmk7uPOZbpRjiQ84BVqBM
	WasmTONg0N+b2YdmGuAccs89C3oRucEV36+t3jcvN3BafNmjaqm7a5aqw5jtn9n+dVnMXgnAaeV
	NFI75S60y6Ct/cnlrnpuVrTr+m5HBB3i/SBPROfGdhmIJr84URg8aalqPppDiA7TjoivAViq9Zb
	4uREU4+SZB7kaN
X-Received: by 2002:a05:620a:2a10:b0:93e:c12c:9b71 with SMTP id af79cd13be357-93ec12c9ef0mr1880577185a.76.1791887627110;
        Tue, 13 Oct 2026 03:33:47 -0700 (PDT)
X-Received: by 2002:a05:620a:2a10:b0:93e:c12c:9b71 with SMTP id af79cd13be357-93ec12c9ef0mr1880571485a.76.1791887626526;
        Tue, 13 Oct 2026 03:33:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde3667csm3574962e87.5.2026.10.13.03.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:33:45 -0700 (PDT)
Date: Tue, 13 Oct 2026 13:33:43 +0300
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
Subject: Re: [PATCH v2 12/13] phy: qcom: edp: Add Nord PHY configuration data
 tables
Message-ID: <qqfucmyebsvemdr5px33wabsxxq4owozwmxcqu62sprs5k32bo@kb5pjx2m4ucq>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-12-a2ab9af954d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-nord-drv-dt-v2-12-a2ab9af954d2@oss.qualcomm.com>
X-Proofpoint-GUID: Up0iMr8j-xxpdk3TurgwH44s1eofKMio
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX72kcNZRwZewS
 cIgiFp7NJ5KJH3/Mb1DZGcThfybs5PDI0qtdkwntG0Y355RwiTJWKiaYunCeCZ/WIh20kAPfkAv
 RteulT2GZ9ihl90Und681UmP0pi/NYMPjKfkj90CO0T5uI+g+nl8aoEsPpNFofnTOIWAm//I3B8
 WAr4jCro3mSe720V6CHyJBHPkhqyzAA2Qc3VPfG8HDlm+kZnUW1Rh39G3NS5YHhbeYwjRXPy+7Y
 i2Zfw5iLoigYbCROoWEt4tS/NTmplE7aUTa5s1mqK0edkSUtciHLC1BqtA8PKfn3w8BWwviY9rA
 t8xgR1ZzQ+PfiH1tjVBBpvspfl82Bq86zOBWGnZFjJVHVzBhJiaT/9CQkNH9FE11LjFOY/YpxyD
 xtwYJz2LnlwWoYNpEsOMBOV9wbymLdjEYAbyY66fgcaDfzv8ATb/2wgjl+/9bwvqQdz3Sy5pXZo
 I3kC6rZ3g6kIvLJb6wg==
X-Proofpoint-ORIG-GUID: Up0iMr8j-xxpdk3TurgwH44s1eofKMio
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace090c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=XaE-5AV0Kcntrrlu8H4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX/1+f3svXUoHG
 2V/okutnXj6fuZxzEeXvubAZwYCftB5AT1nvpnkSNxk4PMQm65ECQ8D63Jd+goFXUZn99o5qtq8
 ZnbSzOURSUW6+EOQCVekD1tJbb9lweU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130041

On Mon, Oct 12, 2026 at 07:02:22PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Add Nord-specific AUX channel, VCO divider, LDO and TX resistor
> calibration data: edp_phy_aux_cfg_nord[], edp_phy_vco_div_cfg_nord[],
> qcom_edp_ldo_config_nord() and tx_res_cfg_nord[], sourced from HPG
> Tables 2-1-a, 2-1-b and 2-1-d.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index 3e857d105668..cb5f6e0ae607 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -1741,6 +1741,39 @@ static int qcom_edp_com_configure_pll_nord(const struct qcom_edp *edp)
>  	return 0;
>  }
>  
> +static const u8 edp_phy_aux_cfg_nord[DP_AUX_CFG_SIZE] = {
> +	0x00, 0x13, 0xa4, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03, 0x02, 0x02, 0x04,
> +};
> +
> +static const u8 edp_phy_vco_div_cfg_nord[4] = {
> +	0x00, 0x00, 0x02, 0x01,
> +};
> +
> +static int qcom_edp_ldo_config_nord(const struct qcom_edp *edp)
> +{
> +	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
> +
> +	writel(0xd0, edp->tx0 + TXn_LDO_CONFIG);
> +	writel(dp_opts->lanes > 2 ? 0xd0 : 0x00, edp->tx1 + TXn_LDO_CONFIG);
> +	writel(0x03, edp->edp + DP_PHY_LDO_CFG_NORD);
> +
> +	return 0;
> +}
> +
> +static const struct qcom_edp_tx_res_entry tx_res_cfg_nord[] = {
> +	{ 0, TXn_RES_CODE_LANE_OFFSET_TX0, 0x06 },
> +	{ 0, TXn_RES_CODE_LANE_OFFSET_TX1, 0x06 },
> +	{ 1, TXn_RES_CODE_LANE_OFFSET_TX0, 0x06 },
> +	{ 1, TXn_RES_CODE_LANE_OFFSET_TX1, 0x06 },
> +	{ 0, TXn_TX_EMP_POST1_LVL,         0x06 },
> +	{ 1, TXn_TX_EMP_POST1_LVL,         0x06 },
> +	{ 0, TXn_TX_BAND_NORD,             0x05 },
> +	{ 1, TXn_TX_BAND_NORD,             0x05 },
> +	{ 2, DP_PHY_TX_LN0_DRV_LVL_NORD,  0x12 },
> +	{ 2, DP_PHY_TX_LN1_DRV_LVL_NORD,  0x12 },
> +	QCOM_EDP_TX_RES_ENTRY_END,

As I was fearing, this table does more than its non-NORD counterpard.
No, please don't do it.

> +};
> +
>  static const struct of_device_id qcom_edp_phy_match_table[] = {
>  	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
>  	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
