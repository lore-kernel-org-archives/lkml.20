Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564598;
	b=PYhdI5gggTBGIhYZnM4UmpA85SqqjAst6QqKFyhBOOSxUQOusMC3JYX4ZHJwWQcUY41u
	 a/ZG0B6KLo35loaH5TIMAcF3lKGWxXtXIBDWHTdC0UhvfjVCYjjEH8rwCiZlWT0Cp6/Ce
	 K+GbyHxI3um44OXa9/CbU7DhFCv31e58RIfrpi5FnGBqAaa2NyLtEwtx4G9YHlnZqhhv1
	 T8xuv1msCDcE2VKxRV2PjVxkN0gr9ZmABZnMZbgVzU+zBuRxSJr3Hh6reeg2b5e+djiOa
	 wv4fFZwplaD1YwU2tZWM+3TIZWBhF7mIUOLbCvz6hS5FuX1cs5fIeOYeCQXIOwpExng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=DI86z/0Iql/9v/K5OtJPg8rVycvTnslIkr8t7coMOfc=;
	b=v+15j0BeCXqE6yXIR+dv4/Uu7+HErWPtzCDowrVSsdgM4Zl5JBWkF8ZuVwRDm3UcIDqL
	 gdVe/zGstqZ9r9MXNcRwYQTjDHe5pVb+2lODAvmJxEZNbsicqC31GlLIxnxT9rdcjvl7p
	 1NLif7khlpgbbFkcn1CYUpJ+OFMTQa6KudI90b9giANHERI3iAaR26rBsWN5WOz+HggbZ
	 iflPEyg3sw3Dc1Gop650HpKXr5YhBu9IhpJ4IzJaX4eiAMvet8CGdlH+1zFZeSQi34O/T
	 YiACOzycACEC2ocZQ6e3oaJzpAovksBGX9QyNmZQD64uMpc78bL5KTXX3MwvQnXLdiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=p6TyeFko;
	arc=none smtp.remote-ip=74.125.228.131
Received: from mail-ej2-f3.google.com (mail-ej2-f3.google.com [74.125.228.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C820606A880
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C820606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=p6TyeFko
Received: by mail-ej2-f3.google.com with SMTP id a640c23a62f3a-c50485c0cb8so44586366b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794564595; x=1795169395; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DI86z/0Iql/9v/K5OtJPg8rVycvTnslIkr8t7coMOfc=;
        b=p6TyeFkoVOUeZsZn+YShv7EPwTXNl4nm5v+8cd6w4mNijv/76ZHOonPgnttdyGWHSZ
         uIdexMvZ9JRZBPffyXh2pUxZFR4jWSuGrFipiIfD+EG+eg5YTLuoEOXo9FEdqpooZBMC
         rGdSQVMdhAxOa9pGZzVjc3efrhntuBZexoEB+v1b8dbGr+vzSeRSe7zFJnaKeTpnx2Nt
         B590OHIZSOAFKWdHE3H1S5NCMDILzqfTkV77AkZBPtflgccLep9cwQb5FK6Zf+L4F30k
         ry/j3H8g59MVDo+3QQxIWzqBneHeP5D97A/+Jo1ZnDLPRw3bPwE4QoZEeO2FeUb+zx5l
         PJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564595; x=1795169395;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DI86z/0Iql/9v/K5OtJPg8rVycvTnslIkr8t7coMOfc=;
        b=fmti878hKDxjFglBkU0adWCpcygq/ocB4Y2bXa499Ge7NIup0ydiDeMrPaIBlx5aC7
         JS4JPn9L9CDPsLwnomreX6BPkFH0TRX/TCbcDXFK2/6+I0HEqw5paRDOWAbatseqXLiS
         EAsjOepqT0bRnN1XvVAxRFdwR2g0lA1a6c758MFSokVAKWNYbrn1p0SveYI+ONFTIy0Q
         FixGNN0DgpqYb7r+sxNawU7UZujlDSy9VN+lMKML4s2SImTXjjgBy72N09kbT2+P5TEb
         i4FG4HwUgl6OiihXAj70HU4vlUeKHfAK5k4yQBbb8Fh04nbKCKR5eJzjmgWVWKzdtfI5
         BMhw==
X-Forwarded-Encrypted: i=1; AL+hErFUvqCCm0pKURO6eRKzEcAHLrRyNNQz1LlgZqUd+tHR+rYdTogQmiRn93vSPm9cUvsHPFFdcwc4cucIMU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kWKzMmUy/UzAijS9YjUIzBf2SrgiyQguSDMCHtPDZPHzCy9Vg
	/S7Gw8uEopjrZdO14ecvLT138ldqCHyMVEgM5zLbnQSXJcyPcucG2At1ZML0Agm/eck=
X-Gm-Gg: AYBFou28Jfaoh3vIA8DXbay6qM4lozdtiF2ACMhJoi39joEuszObSqZAGBOgKpjNAEK
	d3JTm6mmjPIbuDQYgECkOEuZIkaELFbdU7K0wUSH3PS+d5T/97crhr7vtX1nEVr3hY5y2b6NxMk
	/TEqcTYmg79bR12Vqv7a+1ruHvqwhfgnFDp91bxEfJ1EL1Ce7pHwbfh36GIX2o4c1gCaEtfxx3V
	nsZRe7LtFFmOp2Yf1okuvEzMW1swmii7UXnRbScjYF5LwHwRDXwBX6TZKJQ/ZxcQZV2xaR/m5OA
	okdyE8YkGhIxoAR24swGp9eEp11zFP+BFRIgPcwTQNf3PunOqwD3cpuzU4fH7bWvjiCtgZsYDXG
	bKBYe1cfMAuJxSgsCdOE6Uvxs7+CNWi/umjXR8BZUk89MH4SIQzygxrZw1kDO5BWXFg1nCRNsQk
	8vPCptEirvi+HI9oXAxB9Fhwcyn4ClHQvTmDDEwRd4e57NDjDO/OmI3MpFk55PDCBuawLskkSzR
	xHjq88OF+x7A09lRnohZpx9BkRcBLhJWyJcEuUAvLX3BREJtRV6BVjuyE3WVC76qildbZKV4phU
	uE1YbATY/N6fbqmwAoeAyXuoVdOPA+1Y5BhPC+c/DORkm+L0JhNSYwOwIj4GGFm/3GRd2Ux31w=
	=
X-Received: by 2002:a17:907:d40d:b0:c25:504a:1e25 with SMTP id a640c23a62f3a-c5096372189mr164295066b.13.1794564594691;
        Fri, 13 Nov 2026 02:09:54 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5b93csm75758766b.5.2026.11.13.02.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 02:09:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Nov 2026 11:09:53 +0100
Message-Id: <DMU0219YWEL8.35KQSMY192RH4@fairphone.com>
Cc: "Marc Lainez" <marc.lainez@gmail.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>, "Danila Tikhonov" <danila@jiaxyga.com>,
 "Sebastian Reichel" <sre@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "Abel Vesa" <abelvesa@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <phone-devel@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/5] iio: adc: qcom-spmi-adc5: Add
 ADC5_BAT_THERM_100K_PU
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Val Packett" <val@packett.cool>, "Jonathan Cameron" <jic23@kernel.org>,
 "David Lechner" <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261112170841.2189322-1-val@packett.cool>
 <20261112170841.2189322-4-val@packett.cool>
In-Reply-To: <20261112170841.2189322-4-val@packett.cool>

Hi Val,

On Thu Nov 12, 2026 at 6:07 PM CET, Val Packett wrote:
> Even though it existed in bindings for the longest time,
> ADC5_BAT_THERM_100K_PU was never assigned in the driver. Do so.
>
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/iio/adc/qcom-spmi-adc5.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/iio/adc/qcom-spmi-adc5.c b/drivers/iio/adc/qcom-spmi=
-adc5.c
> index d57ba8526e0c..c27ff89429f5 100644
> --- a/drivers/iio/adc/qcom-spmi-adc5.c
> +++ b/drivers/iio/adc/qcom-spmi-adc5.c
> @@ -542,6 +542,8 @@ static const struct adc5_channels adc5_chans_pmic[ADC=
5_MAX_CHANNEL] =3D {
>  					SCALE_HW_CALIB_DEFAULT)
>  	[ADC5_XO_THERM_100K_PU]	=3D ADC5_CHAN_TEMP("xo_therm", 0,
>  					SCALE_HW_CALIB_XOTHERM)
> +	[ADC5_BAT_THERM_100K_PU]	=3D ADC5_CHAN_TEMP("bat_therm", 0,
> +					SCALE_HW_CALIB_THERM_100K_PULLUP)

While this will work fine for some devices, unfortunately this won't
work for quite some other devices that don't use a 30K, 100K or 400K
NTC in the battery - or when the NTC beta (B) is differing to the
hardcoded lookup table.

For example on Fairphone 4 (pm7250b fwiw), the battery has a 10k=CE=A9 NTC,
so using the ADC5_BAT_THERM_30K_PU with the hard-coded lookup tables
would result in very wrong temperature values. Even ignoring the whole
NTC beta topic.

You can see my proposed patch series at
https://lore.kernel.org/linux-arm-msm/20260220-bat-temp-adc-v2-0-fe34ed4ea8=
51@fairphone.com/

Unfortunately it's from February and I haven't spent more time on this
topic since then, mostly because fuel gauge anyways was downstream, so
pushing just this upstream wouldn't make much difference.

Now it does, so I should get back to it... Let me know your thoughts!

(Fairphone 3 with SDM632/PMI632 would actually be fine-ish as-is because
the battery has a 100k=CE=A9 NTC and the beta probably is close enough to
what's in adcmap_100k_104ef_104fb_1875_vref)

Regards
Luca

>  	[ADC5_BAT_ID_100K_PU]	=3D ADC5_CHAN_TEMP("bat_id", 0,
>  					SCALE_HW_CALIB_DEFAULT)
>  	[ADC5_AMUX_THM1_100K_PU] =3D ADC5_CHAN_TEMP("amux_thm1_100k_pu", 0,


