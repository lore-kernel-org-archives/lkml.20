Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDF83D3D0C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787919175; cv=none; b=F5LY3ZS78z8j1X0n46zV3czP/Gn98PWagC4Um7LJ1qib9ijpPXDc+HyAmtxk7waPu3Sv7GbZ8IKc6vMSEleXDdCITF6kYRzS73Nhuvsl+cUce0HJipthk+6dfTlBWtjbFVjpyaKLTRMv828z8oaYYeOKlRXA6dGtoqSOArpa7fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787919175; c=relaxed/simple;
	bh=0Nc+nhiZ+oV05icK61jd7OMyyn7VUZj12fSH0gzkh8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N1lITCyJ/fi1rkZYpBV9ffwpLmDBj00LSZvUDz/uPi/l4268fUou41wKnjs32IBBdOgvy9awsv1AwEZDS5T0GIu5d4437tDbybsT/bPTPqgzUQSbclQFASzgcTAU/FwX0zQb9zeHmEc9x3GQ/RjHMHxT9Zv4Z1cPdnc5QJ5LfCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZS/U8tJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BtBWOgnT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HZS/U8tJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BtBWOgnT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7cHr2744796
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z3zASg/IOmTyCS64W7qkQMt2E4H1NwFHCv+7aMnXk3I=; b=HZS/U8tJCFVASJ1x
	DkKwgyJhpSiwXTUCihUhDwbCXkPWr3GFPFlARtwOWq3XXiO0RxDcKSXBXV5OgR8K
	HJ/QZkk1QiOxikHvj61zjE2Ex8y46NlV8U8E5/yyJwXJjI67eHS8DCt2FraBUmLZ
	HH+GSbVY6+hk+MPji8XvxrlqPGmiX+zM4BE76b74UPB+VglmOYokn2UY3WDa1HJY
	hsBaSWahjS9pF5ZGXQhBEgSSACxiodU1xPIsoti5yLfoT7V2evoTYY7REJh7Z53I
	+u2Zq7Cg4c9to4F0VL7lhP6SlWd5JeDTJMmbdmfn1KmyV9xY5SGr/uMb9paIU+T7
	6HxrTg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mxsqaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:12:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ea38b1e7eso1689131cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787919159; x=1788523959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z3zASg/IOmTyCS64W7qkQMt2E4H1NwFHCv+7aMnXk3I=;
        b=BtBWOgnTDE631H/qUyjNqSqJhpZael2Wiy1jpv6Aci8ZawEXVflWCeCuZaPMdLBzmE
         H4WX0Tf93oF36h+gkSldB761VzQLc7fssLCUf6/q2BxAq3dxLopVYLqteuglknwLqoKh
         WvEG2DEt6EcLxUNP/i5vn48Va80o2L7VZ6Mqw0wS9gWKy17WPCIrbaDvOFaxvwe5D4ft
         uNipwXcxuQp4wnzFopUGIhiod+4cOKyl1NkcB2sWGnD2p7LykNZYLTKPpsxgaD3wv2OY
         cnoXYzECO64FdCrKnOPPhAT0MZCjemo0H+RmeV0L5GMgb3MzRxXyYGrImOMRj6WlKW09
         KJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787919159; x=1788523959;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z3zASg/IOmTyCS64W7qkQMt2E4H1NwFHCv+7aMnXk3I=;
        b=jTkQeP8k4Oe5XRG8ZuPMJ1ohcZfXbUeS0oNXPcqHi9E3yr9yJgGbNc9Q4eRHeXIPt6
         K4ULwLR0Po9Kd12fo/0vW+CkOSRxH0YMXxN5s1He+bptATjf7R9zbyYE3pMPog6EVwFF
         /N9fH2k3tslW7/4s9YK9YhNaeqObnksrWkUgumCSeLWtixAUHN0qcaVy8Qhk8pENf4Eh
         5qEJlQmLvZ7dCteUNDrWEQsnFkTFTvV09QqYDERogdngtMNm/aIoNLekqvHMJmOuJsJv
         /6jVRfMQizHm/SaiJtj/5MQ474YRREX0dkVZeiaoIUwwEE6l/BZP/wCOXIx3QpaQgonf
         f0QA==
X-Forwarded-Encrypted: i=1; AHgh+RpHAsRG1d99b82+E4jrdtcPjlwp4mLPXUeFDzHdZT/Uxdbj30Th2cGMG9ALdoJjsF3los+ty/kPETj9jP8=@vger.kernel.org
X-Gm-Message-State: AFuF++ki6+MFRnAL6C7/M21JiDCCvCtG2PLhHf7puacFnmMqUcpQUUzO
	eYiY5gXdh4q1xKv55Drct1lF+fiPi/UzeyywsuARuwRlatVmcaY41DCiK+ga1g+dYayzL5VdnBE
	hkvSyXIJTz8s9trS7fg0fi6wrJaovUH6lLaXeuN+ScQFalXDdAHSeQ8SbAkGyFgKGNJQ=
X-Gm-Gg: AR+sD10zDAE7A1rFThCjSljXnUCF212HRJZsPmxmABI3Ye00woGH2uP2hYOhgUkFz4Z
	HITP0KxYVBGbKKMFJ4CjvH2Hc5Q0apT9XhfW3kB9n50q40u/qhebRV9U/ifIV6U8n6YXUzhJQAE
	YIEocAfdGvbHYv+hp0QnnYoRlxNJyG6v4KcHZG4UBFWPDqWVWHYn5rL9k6p2CYVSVWdMyQ4dH2g
	I3AAPFErGd0JaKzoJ8hdNOL58gGq9rw9vy8aQqXHjy1WTZz3iSK6kED2QGjFSEqWhQ0aEPL633s
	lOhSsEj+xwXAdho6HUbRcGO6u9HVfpZMUFryu/j04QbwcEbdvXkBV3gtXZcXiXV5RMVBVmisWUj
	WR4an0lV9nU2oTCj0k8GdiVo=
X-Received: by 2002:ac8:7f4f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52fb95f4e1amr48204281cf.3.1787919159259;
        Fri, 28 Aug 2026 05:12:39 -0700 (PDT)
X-Received: by 2002:ac8:7f4f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52fb95f4e1amr48203571cf.3.1787919158639;
        Fri, 28 Aug 2026 05:12:38 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee288afsm73982566b.23.2026.08.28.05.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 05:12:37 -0700 (PDT)
Message-ID: <4afd317a-24be-44c1-959e-9cdd220273f8@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 14:12:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] phy: qualcomm: qmp-combo: Rework DP PHY runtime
 configuration
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
 <20260828-glymur-phy-v3-v3-4-8e73ce7c4636@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-glymur-phy-v3-v3-4-8e73ce7c4636@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwNSBTYWx0ZWRfX8tus4hw3idB8
 6rC7z853O+CYZEM3qn+i0RxWyG+k9IFIJ1itufbAtF3S3dv/htclk163tPvVyxgtB82Mbx0Zl5c
 X4Z9N7clGdj3V/+ZN3aWQueHvlUNi+zMJyminfv1aoYG4TP+9ovFGBu1eu9AR/x/M+jnB41reti
 r0s7t1B91eCg9UfupZETBzOEElrmse/Sn363sQ9T16Y/V3ymRYMkz7MAqUjzdtLYryATUZF4ihn
 nZOpp4su+TXhGVlPO2iV+h8RIOG2cUt3ij4HLEp6B5ZDNPPTdSby9a2mrRvVzNUe+mD9EFhyQYv
 YW7y294VoJeocUlskRoSZLmmw/U3X0u5151DVXDG9wxT98AK2pkBmgXMRB+TcH402zKDQ4+WwhM
 moPWGXZQ4tuBPNObsonfiDkrUgn9tBxV+moZcR41mPU2kO+Ytj7jK8gYqaNC+//6NWaaImLzHGr
 w2pB3O5mRfMfqkdqUSA==
X-Authority-Analysis: v=2.4 cv=MONQXsZl c=1 sm=1 tr=0 ts=6a917b37 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=X346SdmPfOZ6fRuWxNEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwNSBTYWx0ZWRfX1YmkKCJ+W1w/
 xwkHnthIAMYs5erfemT41kq30Ynrbt6Sd2AR+H9UG1cFjCEhW9kreBvo/IQ0+BrWfIAr9h+7sjk
 dHm5ySQ3PkJbxWSFnWbObeBduVhdB6o=
X-Proofpoint-ORIG-GUID: ytrBi9qj7OFpx5lEp3_7YRrVP1IUZb7t
X-Proofpoint-GUID: ytrBi9qj7OFpx5lEp3_7YRrVP1IUZb7t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280105

On 8/28/26 11:43 AM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

[...]


> +static int qmp_combo_configure_dp_phy_common(struct qmp_combo *qmp)
> +{
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	u32 status;
> +	int ret;
> +
> +	if (!cfg->dp_aux_cfg2) {
> +		dev_err(qmp->dev, "DP AUX CFG2 value not configured\n");
> +		return -EINVAL;
> +	}
> +
> +	writel(0x0f, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG_1);
> +
> +	qmp_combo_configure_dp_mode(qmp);
> +
> +	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
> +	writel(cfg->dp_aux_cfg2, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
> +
> +	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX0_TX1_LANE_CTL);
> +	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX2_TX3_LANE_CTL);
> +
> +	ret = qmp->cfg->configure_dp_clocks(qmp);
> +	if (ret)
> +		return ret;
> +
> +	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x05, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +
> +	writel(0x20, qmp->dp_serdes + cfg->regs[QPHY_COM_RESETSM_CNTRL]);
> +
> +	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_C_READY_STATUS],
> +			status,
> +			((status & BIT(0)) > 0),
> +			500,
> +			10000))
> +		return -ETIMEDOUT;
> +
> +	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
> +			status,
> +			((status & BIT(0)) > 0),
> +			500,
> +			10000))
> +		return -ETIMEDOUT;
> +
> +	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
> +			status,
> +			((status & BIT(1)) > 0),
> +			500,
> +			10000))
> +		return -ETIMEDOUT;
> +
> +	return 0;
> +}
> +
>  static void qmp_v8_dp_aux_init(struct qmp_combo *qmp)
>  {
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  
> -	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_PSR_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> -	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> -	       qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
> +	writel(0x3f, qmp->dp_serdes + QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1);
> +
> +	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> +			DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
> +			DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
> +			qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
>  
>  	/* Turn on BIAS current for PHY/PLL */
> -	writel(0x1c, qmp->dp_serdes + cfg->regs[QPHY_COM_BIAS_EN_CLKBUFLR_EN]);
> +	writel(0x17, qmp->dp_serdes + cfg->regs[QPHY_COM_BIAS_EN_CLKBUFLR_EN]);
>  
>  	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG0);
>  	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
> @@ -3729,8 +3807,8 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
>  	writel(0x27, qmp->dp_tx + cfg->regs[QPHY_TX_TX_DRV_LVL]);
>  	writel(0x27, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_DRV_LVL]);
>  
> -	writel(0x20, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
> -	writel(0x20, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
> +	writel(0x2b, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
> +	writel(0x2b, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
>  
>  	qmp_combo_configure_dp_swing(qmp);
>  }
> @@ -3738,48 +3816,41 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
>  static int qmp_v8_configure_dp_clocks(struct qmp_combo *qmp)
>  {
>  	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
> -	u32 phy_vco_div;
>  	unsigned long pixel_freq;
> -	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  
>  	switch (dp_opts->link_rate) {
>  	case 1620:
> -		phy_vco_div = 0x4;
>  		pixel_freq = 1620000000UL / 2;
>  		break;
>  	case 2700:
> -		phy_vco_div = 0x2;
>  		pixel_freq = 2700000000UL / 2;
>  		break;
>  	case 5400:
> -		phy_vco_div = 0x4;
>  		pixel_freq = 5400000000UL / 4;
>  		break;
>  	case 8100:
> -		phy_vco_div = 0x3;
>  		pixel_freq = 8100000000UL / 6;
>  		break;
>  	default:
>  		/* Other link rates aren't supported */
>  		return -EINVAL;
>  	}
> -	writel(phy_vco_div, qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_VCO_DIV]);
>  
>  	/* disable core reset tsync */
>  	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>  
> -	writel(0x04, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SETUP_CYC);
> -	writel(0x08, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SILENCE_CYC);
> +	writel(0x09, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SETUP_CYC);
> +	writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SILENCE_CYC);
>  	writel(0x08, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_CYC);
> -	writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
> +	writel(0x33, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);

These 3 altered writes depend on the rate

>  
>  	writel(0x3e, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
>  	writel(0x05, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TX2_TX3_LANE_CTL);
>  	writel(0x05, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TX0_TX1_LANE_CTL);
>  	writel(0x01, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_CFG1);
> -	writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
> +	writel(0x33, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);

This is duplicated, it seems

>  	writel(0x1f, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN0_DRV_LVL);
> -	writel(0x1f, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN1_DRV_LVL);
> +	writel(0x02, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN1_DRV_LVL);

This depends on swing/preem levels

[...]

> @@ -3938,13 +3971,13 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
>  	} else if (dp_opts->lanes == 2) {
>  		bias0_en = reverse ? 0x3f : 0x15;
>  		bias1_en = reverse ? 0x15 : 0x3f;
> -		drvr0_en = 0x10;
> -		drvr1_en = 0x10;
> +		drvr0_en = 0x30;
> +		drvr1_en = 0x30;
>  	} else {
>  		bias0_en = 0x3f;
>  		bias1_en = 0x3f;
> -		drvr0_en = 0x34;
> -		drvr1_en = 0x34;
> +		drvr0_en = 0x30;
> +		drvr1_en = 0x30;

2ln settings should also depend on the reverse state


>  	}
>  
>  	writel(drvr0_en, qmp->dp_tx + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
> @@ -3952,6 +3985,15 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
>  	writel(drvr1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
>  	writel(bias1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
>  

This should also be preceded by LANE_CLKBUF_EN, I think

> +	writel(0x03, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
> +	writel(0x23, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
> +	writel(0x22, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
> +
> +	writel(0x0a, qmp->dp_tx + QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL);
> +	writel(0x0a, qmp->dp_tx2 + QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL);
> +
> +	writel(0x3e, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);

Konrad
