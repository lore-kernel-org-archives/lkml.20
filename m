Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357B04BB299
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781188; cv=none; b=fxJcknr6JwkLh99sngSvyxgJI1uWmVLtNcq2vCKb8jfTO7CYa7LC4HtfCse7bKkRcOCqEZGnizhfl1vHdtmBsHbjklGQdnVvTQGO6x6TOy85ZxCMcUSt144yYsvBguwbAjt2a1NFBVcI+LlaLWuKoJ2BbrDwS7v2piILMbJJoA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781188; c=relaxed/simple;
	bh=bzhjqFJC+dCljMazr6CkCDYXx5Eq/Z4c0o1B0NivLB4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t8nobKP1Xh14UgU1unxb/E27z2KxFvk7VD49I0FWtdkqEGwRHqF5e0KvWLWD4R6MD73HqRDaMyffiYbjcvt2T7iTx2iLtm9T4V1/tPR8PjoDyk9aHEL4jNKqXoYktiOgU5uerleytJ2Zff4bL0CJCcS9wR3BB2l7wuVKMkWeAOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n1LdssA9; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n1LdssA9"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so9768095e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790781170; x=1791385970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OSdmhz6QeIhKCNCrOk2rawQmJp3h2Ms8iDYvSFt+tko=;
        b=n1LdssA9Hvxn9tCFeD9w4b9S3YyPdr5WR+zH6wd7G2hcLSmdOVK+Ojpae19Zq7RNCl
         UZanfsokIdf1crmGwjSDa2W/bWULVuaUN6PetfktoiwTFG5SnHg+8qccxjshPAEJIKTH
         jADp30/tiSIFDGuKp9AkzASyjT0bXz3vA6WYSc7oK0HzdfxWwT7kYSs0vh75W4vlo8UX
         yn8Yp/CkM+WTwD0zOFvRmc03gDLlrYhNerJj2BQZDy2XZMNAGNgwdArsk0DGYzsroY2Z
         HjZr+LMEM4F5eR2fznNskmrJkrRS1iIqggr4nkjwJ9lran9VfbRWXdFpo0HhayuqCcOw
         OdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790781170; x=1791385970;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSdmhz6QeIhKCNCrOk2rawQmJp3h2Ms8iDYvSFt+tko=;
        b=PS0M+4rqQo8mQhdxQzvjZ/vntocMJRj0KKIxSALRZZCbnKcBivjwDoQnHKZ0OiJUlO
         2f1PRELPBiAi+EIQ/R3Zgoe7YkGRKgch2/eE5py8GZ22kW7EFnFV4C/FIYSJmPBnOM5t
         vFxm6EXecjA8/FlxqrdR3e87Jb19DsHSy9Q3mcUv65UW+0VGsn2/Ie8wAdQyt64iZnhB
         UDoMGCDMERq9lqL/FW3CFPbnLteOJt+jQQlSS44sYGUIb59pPjLuBWMeWEd9Fi7c0lPX
         MV/3VRkkFsuIZSth3hsRDp6OoWk1PGlhoIMOgHN4rvDzuwKthdnYp66oB331veLVOeu6
         XfzA==
X-Forwarded-Encrypted: i=1; AKwUvByFiKh0zKlOPrrCknVTNDSPxCgJgGG/s9Oze7nQGOfOV0wIwhYM4I+mh/7iTJwjzCq2Q3tzwyElYKP13BU=@vger.kernel.org
X-Gm-Message-State: AFuF++kz7KICIB5akvjagaVo/mgYr7/rKW58OMWRHJtr+zjQjOjdeSl1
	KJhS60Nw2v0oJhPQToFAT25DKEaKZ5Q6oAt/d291MuS9BfB+xaZ3OrOj
X-Gm-Gg: AYBFou3NK/gnApV4l1ms6QU907jw82Cfj8l0N6x1qJLfZBCANdEC8yYtn3/odNWLZaR
	yZiZPph5JqjIkEOPLk9x+MYqHK6eEUs6bS+T5dXNSZLmmpocLgHHTZuyeVSin0ifs9Nq5+Jnaex
	VzNJVySDCuD1aA3ByW1/zS1B4wSfLNSROiBUQFIlo1csRkZm9r8SBYzp01XAsnUKqEnhO8mvH9V
	/2I1T9Cwxx11bOKeNrOWTDWWCNaEsQ4AgreVB9fk7q75+hcFNR87sqROpWEvMtwuLMHJhbPAaDe
	+pxZ4uO4UkTR2R2bB9V3XYz5QN9Anz7PSHx147IzzjbNrpkQLTB72xfsvB7ZiuAWku1UWJQYKgv
	ymXHaU04JAIyLMtRWEx8EBnPWoast5lKbdJH+dgupPvxo6ifByAPDmi2jzoScU8IFNEFb/UlhPn
	bekQrxGPiUDqNFy/EeMKcwZ5NeERgXSX2Tts/8yQN6iRVIMHDh/q/b/c4NIpwrRd9E1fOXUvR+B
	gnpYREP7PvGl5Z/OMgqmdybQqyn3ER968XCyBu55XFLOAqzJ6S70+pUdG6s41KnzLrRmz5skaXK
	RyNkK/IqxDzm0uSEjdU2tiYXrUJWvsHi2L5FuREa1ixZBIh6W7M+/U2mhlaTH7QdxIHVhgoEv4K
	0ZPNc0OqePq1I3wLdGeBSHn6V0bbGyX2TqTOLbuxB5gHq4Rl0ewG80y5bTPf2+Xst6iuP79qeSx
	UxEmDQ
X-Received: by 2002:a05:600c:5391:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a01b1ba781mr26714605e9.14.1790781169765;
        Wed, 30 Sep 2026 08:12:49 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01ccd1566sm18147705e9.2.2026.09.30.08.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:12:49 -0700 (PDT)
Date: Wed, 30 Sep 2026 17:12:48 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Marek Vasut
 <marex@nabladev.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Cheick Traore <cheick.traore-ext@st.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>
Subject: Re: [PATCH v3 09/15] iio: adc: stm32-adc: add support for stm32mp23
Message-ID: <20260930171248.00004562@gmail.com>
In-Reply-To: <20260930-adc-stm32mp25-v1-v3-9-406834430d72@foss.st.com>
References: <20260930-adc-stm32mp25-v1-v3-0-406834430d72@foss.st.com>
	<20260930-adc-stm32mp25-v1-v3-9-406834430d72@foss.st.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 30 Sep 2026 16:18:30 +0200
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> Add support for ADC on STM32MP23 SoC. It has 3 ADCs, split into two blocks:
> - ADC1 & ADC2 are tightly coupled.
> - ADC3 is managed independently.
> 
> It is quite similar to STM32MP25 ADC, except for the trigger list. TIM20
> triggers have been removed. So, handle the differences with a dedicated
> compatible and compatible data.
> 
> Co-developed-by: Cheick Traore <cheick.traore-ext@st.com>
> Signed-off-by: Cheick Traore <cheick.traore-ext@st.com>
> Co-developed-by: Olivier Moysan <olivier.moysan@foss.st.com>
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Changes in v3:
> - Style: Wrap core ID table to 100 chars.
> 
> Changes in v2:
> - New patch, split as advised by Andy: one patch for this new SoC
> ---
>  drivers/iio/adc/stm32-adc-core.c |   1 +
>  drivers/iio/adc/stm32-adc.c      | 112 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 113 insertions(+)
> 
> diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> index bb8b53f52914..f94cc6fe4c02 100644
> --- a/drivers/iio/adc/stm32-adc-core.c
> +++ b/drivers/iio/adc/stm32-adc-core.c
> @@ -936,6 +936,7 @@ static const struct of_device_id stm32_adc_of_match[] = {
>  	{ .compatible = "st,stm32h7-adc-core", .data = (void *)&stm32h7_adc_priv_cfg },
>  	{ .compatible = "st,stm32mp1-adc-core",	.data = (void *)&stm32mp1_adc_priv_cfg },
>  	{ .compatible = "st,stm32mp13-adc-core", .data = (void *)&stm32mp13_adc_priv_cfg },
> +	{ .compatible = "st,stm32mp23-adc-core", .data = (void *)&stm32mp25_adc_priv_cfg },
>  	{ .compatible = "st,stm32mp25-adc-core", .data = (void *)&stm32mp25_adc_priv_cfg },
>  	{ }
>  };
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index 33e41505b2e9..210b76b21d13 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -563,6 +563,64 @@ static const struct stm32_adc_regspec stm32h7_adc_regspec = {
>  	.smp_bits = stm32h7_smp_bits,
>  };
>  
> +/* STM32MP23 external trigger sources for ADC1 and ADC2 */
> +static struct stm32_adc_trig_info stm32mp23_adc1_adc2_trigs[] = {

This should be const, the trigs field is marked const in stm32_adc_cfg.

> +	{ TIM1_TRGO, STM32_EXT0 },
> +	{ TIM1_TRGO2, STM32_EXT1 },
> +	{ TIM8_TRGO, STM32_EXT2 },
> +	{ TIM8_TRGO2, STM32_EXT3 },
> +	{ TIM2_TRGO, STM32_EXT6 },
> +	{ TIM3_TRGO, STM32_EXT7 },
> +	{ TIM4_TRGO, STM32_EXT8 },
> +	{ TIM5_TRGO, STM32_EXT9 },
> +	{ TIM6_TRGO, STM32_EXT10 },
> +	{ TIM15_TRGO, STM32_EXT11 },
> +	{ TIM1_CH1, STM32_EXT12 },
> +	{ TIM1_CH2, STM32_EXT13 },
> +	{ TIM1_CH3, STM32_EXT14 },
> +	{ TIM2_CH2, STM32_EXT18 },
> +	{ TIM3_CH4, STM32_EXT19 },
> +	{ TIM4_CH4, STM32_EXT20 },
> +	{ TIM5_CH1, STM32_EXT21 },
> +	{ TIM12_CH1, STM32_EXT22 },
> +	{ LPTIM1_CH1, STM32_EXT24 },
> +	{ LPTIM2_CH1, STM32_EXT25 },
> +	{ LPTIM3_CH1, STM32_EXT26 },
> +	{ LPTIM4_CH1, STM32_EXT27 },
> +	{ LPTIM5_OUT, STM32_EXT28 },
> +	{ }
> +};
> +
> +/* STM32MP23 external trigger sources for ADC3 */
> +static struct stm32_adc_trig_info stm32mp23_adc3_trigs[] = {

Same here.

-- 
Kind regards,
Joshua Crofts
