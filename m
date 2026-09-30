Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164724E9C32
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780100; cv=none; b=aVsRwO0IrKko3lGPbqxv3Hbv0Q3a4Bc6OGW+y7eMVACCvPiLM/tQN1S/2eUFIue65yomEgRsZ+sMCPGp4/HaYPG8EX9WO/sh/o/TSz1oGFmZ/Ywz2teUwU6DcGgj7fb6alKq2D4nnkt/PxkexOh+TOAiwA4ofwdGISskt28DN30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780100; c=relaxed/simple;
	bh=wD3NZssZMW68AQJrY2P8J4DOvVjSGsMzgeQD9NT7T6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KskSvkJEte6m3CthZr4bdug9l7MgKNiUDTNfwjXPqqKpBSIGoTPqMSI5ajBCtEkYqsSAh4har5VbrCv+hZLH5sL14um7Gy9pp3IYI07PKTvPFdfEztVxw4oqM6Pl4VNqQ0DYgZwWZGJoZLiyeugspaXolO+yhjoI6DoS1nyXaG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WiE/dC+P; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WiE/dC+P"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so30567565e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790780089; x=1791384889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fX+GMtVZvZFwpjXU+kCF5PX/DfKN7b04TfWCfb65nWU=;
        b=WiE/dC+P1u6L1CgCGkblchR3yrMX0NqAzRZBCzQW5V78MPzOFdb1bsbsutjKINcbxD
         gbkU2Nf9Tl+ktDF5KPPmRrMXrpzB5QgfJDn2OAqPk8rnTbf2CZ3j+9eRh/UVebVWwuUx
         ZJytVWsb1VNXr8Hcy2lvzUYUbgpAyu7/49E5XW35CNFX+deuYLXncyQQH0Z+Kf6Zu57W
         ZV17UXPhq3LtKj0t+Gh7Iyvjq99lxtOTJd02qFNF12/oDURewlD/c4rYufodIcZH0r0m
         xZwuAB7jCVZBoSEK6tqpU38AxcOdELhPJujTdws/7VIU/rTJ4vM8IG+MVMQfnntF3jMs
         t8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790780089; x=1791384889;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fX+GMtVZvZFwpjXU+kCF5PX/DfKN7b04TfWCfb65nWU=;
        b=EPZPaUN5N+Yp2/sNVlHQMXAkhRAioll2IFbC2mIANAzl1LHUMVPghF5/CAmZtsJSTr
         HeNEUHZ4/Hxzu385mv/B0aKBqvVDIRS6Pv6E+bOt9pqnhAgefrQW51B98cfu4b5yCK1N
         w33Uk6BEqjJUmf/MU4N6B/jBS9N0zlgh+zFMuTUAu2X4F4is92/vIKmvNJE2J/LGKThz
         W2DoLfWmtljDAS5mlIbrTIc5qlGiii7rKP/LS2liGJ74sIAFDbHrbaOOXlHllqwb+WWS
         rnNNNROfzvQEo/JQQCBJQxPP4tTlUxAWxsbIXuuCmudFMR9IHVZYGBltDAdRjURoH048
         hfFw==
X-Forwarded-Encrypted: i=1; AKwUvBwx/UxvgJMsReSjGtVEcTTEmoQA02ohRaOOjkEhav/Rr+jY3KKxYs7UsTyZFiKiKe0j90t/FPUMkO/kzFU=@vger.kernel.org
X-Gm-Message-State: AFuF++nunHp0WJyJs4m5Ixt4DWtzl9cHqBEyoOqx4cBYk84S52F0wXEZ
	ZmTTG5jtNoIuvJT8nGQR4JjrLEKEG5fWqaP71ULXoh9FonTtPdZikW08
X-Gm-Gg: AYBFou2YIujU2Cf19UbsoDM6ZEHA6YQ7qqSub1d8Vk5Ur9HSMa90w/URDf9H4yie9Oq
	UTVSnHAVujRIQ1KeQ3B8fJWvfjsr/TdeQblGw/VtbJF617wLt6jU/j9L1xTLxZfvnlUgInlTTkI
	gshhKHJ5uOp9SydUxyvJ/WRD2T9OS48KjbSMMqUhNo92O5KVX/0LDM5dnJBsvrWiB5iPF6Tp+XW
	ZAH3kt66yZ323+h4TPwidfXaCaqBm3lQ4UofeY/FL8ZZ3DY0dR9Ov7Sr7Svx4WhpeA2TgDEf6Gj
	Yqr+SrOA0p0Mb5Wqc7ANNeJhzwHqbMN6FIAuf+ZxHsqruOuHZGyzNou20Lv9hBgjruaeXysNRNx
	pOQ8hICyYMawK7OdI9e6DP3E3mHvfR7edkRdekvgYN0r687/gaNOX3x4wDLYNdto/wiL09qji3c
	1qCP8fq23oM76HS5f20uFKXji0tnCATejdCNQqRLr39yFsX+8LmKEJmoPMWQlh41SlVX8Xa2dFa
	NnHd0VVGe0hyFhc0NcFKfP3TkoRZr/fVUzRUDZLJYZ8zd3wa9Ow6cwuYjSjeP0y3IS8dqpEHUGG
	dGNdx4q9pnIgZ7qx18Km6kj68I7bhvDfMmuK9YOMr7UYKjNEjzHGQfeWPHQuefHSvehs5JcIzAG
	xJ1LilsAMHq4iL4SdfTg7Rld/qoFYZABh9b0/aYfM7iKEZ3eE71RigP3OPUsYnSfIGCbj5P779M
	urEKW9
X-Received: by 2002:a05:600c:a00b:b0:4a0:1c69:f607 with SMTP id 5b1f17b1804b1-4a01c69f64dmr14101255e9.29.1790780088847;
        Wed, 30 Sep 2026 07:54:48 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01e6622e1sm4236005e9.3.2026.09.30.07.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:54:48 -0700 (PDT)
Date: Wed, 30 Sep 2026 16:54:47 +0200
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
 Olivier Moysan <olivier.moysan@foss.st.com>
Subject: Re: [PATCH v3 04/15] iio: adc: stm32-adc: manage characterization
 voltage diversity
Message-ID: <20260930165447.000046e4@gmail.com>
In-Reply-To: <20260930-adc-stm32mp25-v1-v3-4-406834430d72@foss.st.com>
References: <20260930-adc-stm32mp25-v1-v3-0-406834430d72@foss.st.com>
	<20260930-adc-stm32mp25-v1-v3-4-406834430d72@foss.st.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 30 Sep 2026 16:18:25 +0200
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> From: Olivier Moysan <olivier.moysan@foss.st.com>
> 
> The characterization voltage used to calibrate vrefint depends
> on SoC family. Add vref_charac_mv field in stm32_adc_cfg structure
> to store the characterization voltage for each SoC, and use it
> in Vref computation formula.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Changes in v2:
> - Andy's review comments: rename variable to vref_charac_mv (unit suffix).
>   Drop the const attribute.
> ---
>  drivers/iio/adc/stm32-adc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index 600f975f1d7b..fa46803d54be 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -43,7 +43,6 @@
>  #define STM32_ADC_TIMEOUT_US		100000
>  #define STM32_ADC_TIMEOUT	(msecs_to_jiffies(STM32_ADC_TIMEOUT_US / 1000))
>  #define STM32_ADC_HW_STOP_DELAY_MS	100
> -#define STM32_ADC_VREFINT_VOLTAGE	3300
>  
>  #define STM32_DMA_BUFFER_SIZE		PAGE_SIZE
>  
> @@ -211,6 +210,7 @@ struct stm32_adc;
>   * @set_ovs:		routine to set oversampling configuration
>   * @smp_cycles:		programmable sampling time (ADC clock cycles)
>   * @ts_int_ch:		pointer to array of internal channels minimum sampling time in ns
> + * @vref_charac_mv:	Vref characterization voltage used to measure vrefint calibration value
>   */
>  struct stm32_adc_cfg {
>  	const struct stm32_adc_regspec	*regs;
> @@ -230,6 +230,7 @@ struct stm32_adc_cfg {
>  	void (*set_ovs)(struct iio_dev *indio_dev, u32 ovs_idx);
>  	const unsigned int *smp_cycles;
>  	const unsigned int *ts_int_ch;
> +	int vref_charac_mv;

Case-sensitive units if it's SI is preferred in IIO, therefore *_mV.
(checkpatch warns against this, but just ignore it).

-- 
Kind regards,
Joshua Crofts
