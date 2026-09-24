Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6373C13EE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790222647; cv=none; b=igD80I2+8M+BR3RVi3jJCD7nNCriugp1yiAG00GNrjFdmVPJIpIGmO4dWi5urmhi6+M0hxS0onGFL/mb+EwiJMOPqx3gxZCYnF48XRshk7EO0WmBm/3M9+TUoJxFxofK/KOD40i1r0NZjVYfMrYnHDy9k6ZnFgTdu7R9kpWqDRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790222647; c=relaxed/simple;
	bh=8GrHNaH3UU6tDPCZUYMa03D4McTC8KMAgnFcmHoTHyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdMA0g621oEhMIgwcncpzpcs6LPNWMdND9t+3skgyBoftO/GogdeNiyrq14WSZB40LsuOhPG6GdMTEo4PwEWU6VgtX9vADcJPLj7BgkxqLCnQiv0rrLHRHWdSyKEP2sBnEQZnoGgX6uOeJmfjDvLR7R0trSNf1Ng7daZYlI88lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iNwH5XSZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ia+YDqTv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNwH5XSZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ia+YDqTv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O36jKl3823039
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Gs355wJs7yuoPs7Ve/S/Bniq
	wQWS8mKiXLMYMNNYV+c=; b=iNwH5XSZzssTFN6Vb9kni/Fvq0FkHyPljy0oJPd+
	NaxGftlHyG3j/5Xhylil/BYCy6Rd+djEmyv0KQbvNN7hLaCmpvgidcti5vgsZKBc
	xmD/axRXnfGmMLAlCjOale34Hhd4pt+/sKJ3zf5stLLKdU04lqup+jF0IfCkf/wJ
	1fKyHFa9W8zfcZJsV+VIo15h+dQj8+fqjNMXLu7/+ZvXeIdcTOJMmeSxp6jaxZnE
	ecm+IV3Nb/+IVIhUFYaM5ZHHRVxP6UKwI1IaMuyjmlhrMNpcjE6SnlSb0Kr2mgSx
	e6vuhDNacHMpMNiajZE033YLVjMa4Jqt1GzbF/9lzdeEAw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv35jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:04:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33baaba6371so1054475eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790222645; x=1790827445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gs355wJs7yuoPs7Ve/S/BniqwQWS8mKiXLMYMNNYV+c=;
        b=ia+YDqTv6/lz7qLjP0TB3665OxJiCQaphKAnj5takBI2d8frxknldk71IVy8KtnDT6
         DPp9ZVxU1H91S9xdx10KyyhYPWaTRufojQRKt8ROwgv+TkDI8k5TGJCJ3sr9Z+cw7D2y
         wn1uejtvJMpgmetVGTSi7UJsChPFSnLGx/5x+nM+q6zM1CkespKdnld8oxOPk3Q2Yaw7
         0eeNfV6U42HyJzj3O3nzgAv0WLJEpxH3HEtFGcu4yKpeLhgnEnA9lriZ+cY6RobaC0ch
         aqW0LSFfuxUEKYDVyCwmySuNyDUBJDUm0gfYpwtLQN/jCQcoSY1AVEDknZeW5d7Kdyne
         k4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790222645; x=1790827445;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gs355wJs7yuoPs7Ve/S/BniqwQWS8mKiXLMYMNNYV+c=;
        b=SMPeu+prIvisH8JH5wdBvk0LAvETG13mLuv80RRiTm2P+sJsgsUcbkE9/zmfGV1E/h
         LR7B0QKxbb5IcLDzWjCM85+ah64aKh5rne/va1ubA/MimVvc97n13Sx+4tdIHezvejXH
         O8Oyvkj4EbDax1cYY2KifGQgUCu+iVikfsJQKqZDSXWjUGWUxL0DnFEz62bKr0BJPb/A
         FRULqi+RKcwXdKHRhH7V+VSQiVosYVuW24gcqe83ANq/ikHRCJ8G6P++X5aul3toGsm6
         f/NFvE8BnzfcJmKO1gZxl9Rk8YM5QRPoJb6g3g3YoIGonURKuSqhpesOhMBTgK+dHnDa
         r3Ig==
X-Forwarded-Encrypted: i=1; AKwUvBx5ZxD2u3p9viP1ih0IXAuhDG+MtRegaedO/hH4IOtBd/tf0/BYJWFL4wQ/aP0N+pO9Hb0N40KLdo4ouOo=@vger.kernel.org
X-Gm-Message-State: AFuF++mJvgoxP+qe2Oqd0D0FATvt17gKhAtf3pplbC9PQjWlsIvorBeE
	00uQgYxe9rDETClfa7yNwyRmZiiX6iuECvXwkFhoToKTCMN+eWVRqgznBAjxQADetIyb6F67DLo
	WRM+LDB8r0bkzRHTVLFj4wJVuDBTZlFcTGqdJbUdY6XmB+2y29JtrhGs0CV71f36IeV4=
X-Gm-Gg: AYBFou0jTyTk9O8Uk5aQkPK+MQIR26EJBZYgoyIuLwJvvI06djPnaqzv0NfA0TkeBi8
	CZ0aPKwZ1QghSoO+8or4KhwjJtpHX05stdjtypXRMegOLJb8UYCBAnTPfXm2iLlDANl+UC+smXU
	oGK2pLsj1qm1WsjH/WBsZgpgu1SIUuPVCoeiINiTthG5eLHwj82Dlh61THkxDpdaImR8PjrPXrJ
	3YdxJiv9y90Wjo/tJ7YL+vS36cNVisX5XdqI3GfuibeqWEgI+Z2YddU7Z/XfnY74W/TAe1Pm4NC
	a3isvaNdbBE7+OUaYzv0HiczCsMxJZq/wzn9ZkpEsA96WmLrtEtufxW4KU6D5UofhyggD8NtQwL
	6X5Uwh82BOgSKPVDGlaZvL7ecvpSjQHWWizbJC2QlAA==
X-Received: by 2002:a05:7300:5624:b0:33e:538c:c3f1 with SMTP id 5a478bee46e88-34002edee4fmr963871eec.25.1790222644408;
        Wed, 23 Sep 2026 21:04:04 -0700 (PDT)
X-Received: by 2002:a05:7300:5624:b0:33e:538c:c3f1 with SMTP id 5a478bee46e88-34002edee4fmr963851eec.25.1790222643728;
        Wed, 23 Sep 2026 21:04:03 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7bf6bsm9457507eec.8.2026.09.23.21.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:04:03 -0700 (PDT)
Date: Thu, 24 Sep 2026 12:03:58 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: qcom: spmi-gpio: make direction changes
 exclusive
Message-ID: <arShLkiDKQvrBLLV@QCOM-aGQu4IUr3Y>
References: <20260924032314.948638-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924032314.948638-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAxOCBTYWx0ZWRfX0twvV7bN5mTR
 cIRIY4LeLc2frdif4YZjGcir19nPbs76X8vKTlyre/6W99QfIkp04O8w//dpuWmOXOc/qiX+NNs
 S6an7Iz0Y1rQzkXbW7/tg7D3FPwYHPXPSt58siz3/I5L6vA9gsbL2vi1bden5iGrCJV6VSCLcS0
 aGQk+kWZWPq1e4rsGR7PzrZzQkDEpCQsA98TLCISoaw8TsXniIanaXf+bqoakkIOOPJLF2CoxrO
 XJHT2wQiNdUAUzj+FJzJ3QD0ZmBZCH50oqswC7qubj0eqoa5G22nSJcct8N96OSqhm213JrjNRy
 ZqDVtlxBy1w1OT3s6cAIhoC0gc3oTjAwsf9qhVzMejIRlDrM0VSiAVpKff1VHwFHm4uP4aiWNx9
 DnHNiEOYK3H2FT4Su6mvnbq8x5dPyQSMoy5ys4CqGpcBeXVIJKEnKJ1T3NBvKhUb4BJQcyPB6NK
 bMdvfY5G3A4vpWlSZwQ==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab4a135 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sRq9MN_325cdMohnSFwA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: ItXw_aroPflarfKKq9f5dg4m9_MX7aCi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAxOCBTYWx0ZWRfX3CNjm3S3vQxr
 7CJVlmPkS4gPHWXj7iDPSFIllgqOXXFx/OJ0PW9H1lFQAx/X5sS6m1hVCqd/55CgDcswkzSmvwx
 PzcwJNcys9Zo5AozOtbqT1/YKvSc8KI=
X-Proofpoint-ORIG-GUID: ItXw_aroPflarfKKq9f5dg4m9_MX7aCi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240018

On Thu, Sep 24, 2026 at 11:23:14AM +0800, Shawn Guo wrote:
> pmic_gpio_populate() seeds pad->input_enabled and pad->output_enabled from
> the hardware MODE_CTL register, so a pad left in DIGITAL_INPUT or
> DIGITAL_INPUT_OUTPUT mode by the bootloader starts out with the input
> buffer enabled.  Neither direction callback clears the opposite buffer:
> .direction_output() only packs PIN_CONFIG_LEVEL, which sets
> output_enabled, and .direction_input() only packs PIN_CONFIG_INPUT_ENABLE,
> which sets input_enabled.  Requesting either direction on such a pad
> therefore programs MODE_DIGITAL_INPUT_OUTPUT rather than the requested
> direction.
> 
> That silently breaks both directions.  After gpiod_direction_input() the
> pad keeps driving the line.  And after gpiod_direction_output()
> pmic_gpio_get_direction() still reports GPIO_LINE_DIRECTION_IN, because it
> cannot tell plain input from input+output, which makes gpiolib consider
> the line an input while the driver is driving it.  On a board where
> several regulator-fixed nodes share one PMIC GPIO the shared GPIO proxy
> reads that direction back and rejects every consumer after the first:
> 
>   reg-fixed-voltage regulator-wcn-core-vm-1p35: setup of GPIO (default) failed: -1
>   reg-fixed-voltage regulator-wcn-core-vm-1p35: error -EPERM: can't get GPIO
> 
> Pack the opposite buffer's PIN_CONFIG_*_ENABLE along with the requested
> direction so that the resulting MODE_CTL is DIGITAL_INPUT or
> DIGITAL_OUTPUT, never both.  pmic_gpio_config_set() programs the registers
> once after walking all configs, so this stays a single register write.
> 
> Open-drain and open-source outputs are the exception: such a pad only ever
> drives one rail, so DIGITAL_INPUT_OUTPUT is physically correct for it, and
> pmic_gpio_get() needs the input buffer to sample the line rather than
> return the value last written.  Keep it enabled for those pads, and key
> pmic_gpio_get_direction() off output_enabled so they still read back as
> outputs.  gpiolib applies PIN_CONFIG_DRIVE_OPEN_DRAIN before calling
> .direction_output(), so pad->buffer_type is up to date there.
> 
> An input must not drive the line whatever the buffer type, so
> .direction_input() clears output_enabled unconditionally.
> 
> Pads that are genuinely bidirectional can still be described that way
> through pinconf, which is the interface that has always been able to
> express it; the gpiolib direction callbacks now mean what gpiolib says
> they mean.
> 
> Fixes: 263447532463 ("pinctrl: qcom: spmi-gpio: implement .get_direction()")
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes for v3:
> - .direction_output() clears PIN_CONFIG_INPUT_ENABLE only for
>   PMIC_GPIO_OUT_BUF_CMOS pads; open-drain/open-source keep the input
>   buffer so pmic_gpio_get() samples the wire.
> - pmic_gpio_get_direction() now keys on output_enabled instead of
>   input_enabled - required, or an open-drain output reports IN again and
>   the -EPERM regression returns.
> - Link to v2: https://lore.kernel.org/all/20260922065908.477523-1-shengchao.guo@oss.qualcomm.com/
> 
> Changes for v2:
> - Drop GPIO shared-proxy patch
> - Update Fixes tag (Thanks Neil!)
> - Link to v1: https://lore.kernel.org/all/20260915014447.282121-1-shengchao.guo@oss.qualcomm.com/
> 
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 35 ++++++++++++++++++------
>  1 file changed, 27 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index f6dc43e27b38..dd9c212da6ee 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -734,29 +734,48 @@ static int pmic_gpio_get_direction(struct gpio_chip *chip, unsigned pin)
>  	    (!pad->input_enabled && !pad->output_enabled))
>  		return -EINVAL;
>  
> -	/* Make sure the state is aligned on what pmic_gpio_get() returns */
> -	return pad->input_enabled ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
> +	/*
> +	 * An open-drain or open-source pad keeps its input buffer enabled while
> +	 * driving, so the output buffer is what tells the direction.
> +	 */
> +	return pad->output_enabled ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
>  }
>  
>  static int pmic_gpio_direction_input(struct gpio_chip *chip, unsigned pin)
>  {
>  	struct pmic_gpio_state *state = gpiochip_get_data(chip);
> -	unsigned long config;
> +	unsigned long configs[2];
>  
> -	config = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
> +	configs[0] = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
> +	configs[1] = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
>  
> -	return pmic_gpio_config_set(state->ctrl, pin, &config, 1);
> +	return pmic_gpio_config_set(state->ctrl, pin, configs,
> +				    ARRAY_SIZE(configs));
>  }
>  
>  static int pmic_gpio_direction_output(struct gpio_chip *chip,
>  				      unsigned pin, int val)
>  {
>  	struct pmic_gpio_state *state = gpiochip_get_data(chip);
> -	unsigned long config;
> +	struct pmic_gpio_pad *pad = state->ctrl->desc->pins[pin].drv_data;
> +	unsigned long configs[2];
> +	unsigned int nconfigs = 0;
>  
> -	config = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
> +	/*
> +	 * An open-drain or open-source pad only ever drives one rail, so the
> +	 * line can still be sampled while the pad is an output.  Leave the
> +	 * input buffer enabled for those, so that pmic_gpio_get() reports what
> +	 * is on the wire rather than the value last written.  gpiolib applies
> +	 * PIN_CONFIG_DRIVE_OPEN_DRAIN before calling this, so buffer_type is
> +	 * already up to date here.
> +	 */
> +	if (pad->buffer_type == PMIC_GPIO_OUT_BUF_CMOS)
> +		configs[nconfigs++] =
> +			pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 0);
>  
> -	return pmic_gpio_config_set(state->ctrl, pin, &config, 1);
> +	configs[nconfigs++] = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);

Sashiko has a valid comment on this (again, damn). I will send v4.

Shawn

> +
> +	return pmic_gpio_config_set(state->ctrl, pin, configs, nconfigs);
>  }
>  
>  static int pmic_gpio_get(struct gpio_chip *chip, unsigned pin)
> -- 
> 2.43.0
> 
