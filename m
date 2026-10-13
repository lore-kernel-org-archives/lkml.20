Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5073B0AE9
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881235; cv=none; b=tPqVllXAfCvF5QHpHzXpTv0DoVpLzLXJ0se4qjfOTDjEFDEIt84WikgxCm+7e3dJRkMhbXKsn+/pCrjzdxSy5bB3XxHeLMF2pXB4UJuQppx6wrYmfpRlYexAU9v9e4kmED9HYElQ+V0wgAkihcySlpOGmwKAUY03RtKZm1kKTlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881235; c=relaxed/simple;
	bh=CJxZASRkUQZemieJkJUX8KSkCOwxi/weR1JFMTPaUoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zy4L1c3j7GGCAWKAfbKIhyYJgQOLRsrYtRxMdlxrECpnA/IQJ4mZppSZefVxDUi5mGFbf+3gskIn5FJzaAq3op9M20520crTsmFPKsXZhif89JsOUl8TK+UdeYpeYElNV8W73QlOq+vsI4HLYwhu4HUXlhpPmDIWnZEqW/SfhKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEkVwhbk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jEQrtoTY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEkVwhbk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jEQrtoTY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8VsYb3054911
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IxEa8Pb0nd9li3Y0xVvL05fY
	BOkeTK7g0eV66MENLQI=; b=KEkVwhbk0wuOcnJ1TkMKcfb2hCTRrP5E8RJDZFHh
	/bMRgihMcV7Q/HmXwIGZTJRsAQP1C+HWCs57+KLsjhrk/TEAVZjgnPowKqkictTV
	kT2c/HHbe1z5X6G7jNaFLEHSsFzniX65KDDkZzaPmcSfFSkBK9WZTZfS4kDs1Lh4
	kOqQi2ptLoa9s2Yvm8i4D9IHuDILe+nhmqXwkVo4nrIEDUwNdIIGzY6dcl95j14U
	9xd9G0Tt3R/lF+02bVJ+SqVeimUFBqCnZqrE1PtM5ps58F9ErlCrgYTH2z8HwY8t
	p71DX1IR8z56Y5vAOG06LAhcq7niRCW3dX1jVoZjg9i7qA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aeubn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:47:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb6391e89so596924585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881232; x=1792486032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IxEa8Pb0nd9li3Y0xVvL05fYBOkeTK7g0eV66MENLQI=;
        b=jEQrtoTYdPO+XR6Ec32FnJ140QBMM1ciJETxcQ7G99tqtmetKUTgWbDuJTc0tU+pVu
         fPSOsM2eRp9J9+/namHHrAHACYvO/39o00ZRtXZp3UCewLGLPfSie9NCPOrasDFiOgdK
         /IYs4zWBc8msLE9RJ/C0SAIAI5J3BKZOgLbWYAZ4YHLR+HjB2aiDdM7d1HSwi+NxZL4B
         nu0H2Zt9KeWeXE5bYyJRAoYgcsfQvXh+uH07n3VJupLcY6S0hbkCiLnx20Ww9HLLyUsA
         kidAARhqpYSbWI9hxvFvOmZuDYPS9Mrtvu9LOFca94XexsQWjPQDMYMHvH3dbU9edHc1
         sHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881232; x=1792486032;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IxEa8Pb0nd9li3Y0xVvL05fYBOkeTK7g0eV66MENLQI=;
        b=o0ThHe2n/5nYd+Kl6H1r+R6EcCk+iWzCQoDwaAofGCD5pTK9h6G97UqR4YU6j79/kM
         yLqq85Le4SWknZSTIWVRICS3N3eM44Vi4B5XrYO4hb/VUt8o1dLPIsKXtS85pIbwbfav
         Asn8MDwIeZeq1c2X2yT673De8+G2eCJdo4oLODfW9VyGRAcP3QteBk4ipLjUQnBAvnsj
         EjvCTQREdZIn2aAKfFOP+26m/bV+VDGyEP5Miqm4xh2NgDbnpCpRV5aAenAsMH7el2bp
         b/FTegG2B8StJchFg+6aFqXbmqClnvHmLE+SkRQTS5dYb475k88roveOGKLglf2e7OD6
         YJVA==
X-Forwarded-Encrypted: i=1; AKwUvBwZax9vAHErNwgCEA052Ltd+MRBia0sJSzL6ncW6yqB1jEfvyJHliYIBMUF9bPC6f9VspkCV6+V0fC/lF8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLz1Fp0NXR8EMRVfhsEM3W+w68+BY+sC1Duw/1inD5j/9znefDf
	9SulVu2FXOUczs8QrSxFns3casgAk8eumMY2lLtr1Q/fwcOZFl5Opo2tXGHMYAOMO0loUlW8emf
	G1P4QamTGgnyjsCX+M1O19E7ibOfeQNLjqH5MW5Xux6lRFTq+Y+wTnR5+EqBYU1VOdVk=
X-Gm-Gg: AYBFou3hOXPfYoA6Bp6Vc505V2jZUPVfGi7JznkDCSFXsqb8XSyaIk/ubXLHMk9pOjN
	N9ds5N91F7z2r/YoFSEEo/xXnkwYqpGjwNuXQkliPq13vVgjkVEFHxMD88bNdBvkJU/JSWfzO14
	q7xef1iMlR3ADkx1K5K6UcK3p8AX8PaVdGkiqT6OOZVcKUxhmqol0VMpsoWcKu/jbkhXicjHlh/
	OptLsUwActtkoonJcGACT7M5tTHGKzxiMxcm/Gi3miR8k3YNIXiZ8xgnEhCwNoEfuEsd4d/gprJ
	rqS39T4ZYWtU82dxf5apKm+6/dI6rlt/TKivA6Wk4NnCFFtwvRoR5cOvzk/sccjlrjJOd7TNDzT
	lC9+2XTZvAO+D4nc=
X-Received: by 2002:a05:620a:4689:b0:93c:70da:e45e with SMTP id af79cd13be357-93ebd223c74mr2039231085a.36.1791881232289;
        Tue, 13 Oct 2026 01:47:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4689:b0:93c:70da:e45e with SMTP id af79cd13be357-93ebd223c74mr2039224385a.36.1791881231577;
        Tue, 13 Oct 2026 01:47:11 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18d12fe04sm215536315e9.4.2026.10.13.01.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:47:10 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:47:08 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
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
Subject: Re: [PATCH v2 10/13] phy: qcom: edp: Add Nord spread-spectrum
 clocking configuration callback
Message-ID: <7cojksxbq3mznhkn7g6rxxxl2kmgd4hpkup35oj4qdbcqnqjsi@c63o5bgxps3y>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-10-a2ab9af954d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-nord-drv-dt-v2-10-a2ab9af954d2@oss.qualcomm.com>
X-Proofpoint-GUID: AqpEF-B0KbZ97YY3HcH16jDzWQ_51Xju
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6acdf011 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2vP-gcZVKESdWMdgu4kA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX7A51b3UPlY5k
 2RcGAeKsrb9kteD6t7MCOcm/1UptLKlLCXX3eq2vGsxWUweW72ve4mFkkvqFDThWFHMI4zEfh8q
 4Q2wTqVmuVXEHC2rJSTvR2/y1UrSwpU=
X-Proofpoint-ORIG-GUID: AqpEF-B0KbZ97YY3HcH16jDzWQ_51Xju
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX2b+qkaoXBGXU
 Qx/jTtC1M7vRJQGBd5WN/FHXKY2I5fRfLSVuZ/VDV7cwh+ry8r9VVGXkgOfOd0etCgGCceP67+z
 mzpENmOJN9onZ2Rd61P015HEYzmJwbn2kd0yqPvzWa7/0ug5arEYqCJLF/Ym/+SScH2Reww8LC6
 3LwBgVw3Mx771tWcOxD00pZhwRkYT3hd7yZ6CQILmw+zB+vOPreoNjF/qeDiXsFk855xAHZZSCp
 wVj8MXfzV1zcsYmxkpzdyJfLUKsiX64BKJS4oESs8ETzEFru5ntz26W12inZqX8RFlcTdHqwZd0
 ytaZk3DBXx9R9UiaAFBBqdg4YxFH0XHyUmiU1zgavYzxP4yKExzt02jpmVzGNg62UzpXwFA33oy
 Evlhw2g9EVCiEai4Q3spyUyyenkhsAcBFd8yDqiGLXcDXlMBLZNPxU2plZEolyRYxyIFt1IzBrL
 P5NlLpfMF2vrvfcGCuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130034

On 26-10-12 19:02:20, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord requires different SSC register values compared to existing SoCs.
> Add qcom_edp_com_configure_ssc_nord() which programs SSC_PER1/2 with
> fixed values and link-rate-dependent SSC_STEP_SIZE1/2 for RBR, HBR,
> HBR2 and HBR3, per HPG Table 2-9.
> 
> Assisted-by: LLM
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index c63f721702b1..66c31684c48e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -1601,6 +1601,42 @@ static const struct qcom_edp_swing_pre_emph_cfg nord_dp_swing_pre_emph_cfg = {
>  	.pre_emphasis_hbr3_hbr2	= &nord_dp_pre_emp_hbr2_hbr3,
>  };
>  
> +static int qcom_edp_com_configure_ssc_nord(const struct qcom_edp *edp)
> +{
> +	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
> +	u32 step1;
> +	u32 step2;
> +
> +	switch (dp_opts->link_rate) {
> +	case 1620:
> +		step1 = 0x83;
> +		step2 = 0x02;
> +		break;
> +
> +	case 2700:
> +	case 5400:
> +		step1 = 0x18;
> +		step2 = 0x02;
> +		break;
> +
> +	case 8100:
> +		step1 = 0x5b;
> +		step2 = 0x02;
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	writel(0x01, edp->pll + DP_QSERDES_V8_COM_SSC_EN_CENTER);
> +	writel(0x00, edp->pll + DP_QSERDES_V8_COM_SSC_ADJ_PER1);
> +	writel(0x6b, edp->pll + DP_QSERDES_V8_COM_SSC_PER1);
> +	writel(0x02, edp->pll + DP_QSERDES_V8_COM_SSC_PER2);
> +	writel(step1, edp->pll + DP_QSERDES_V8_COM_SSC_STEP_SIZE1_MODE0);
> +	writel(step2, edp->pll + DP_QSERDES_V8_COM_SSC_STEP_SIZE2_MODE0);
> +
> +	return 0;
> +}

Why is this a separate patch?

I think you can squash patches 10 to 13 in a single patch.
