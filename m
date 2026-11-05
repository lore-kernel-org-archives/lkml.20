Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793899592;
	b=F1QmZoKj1HjhflE04ai37RT8VZA1pA3GhlN6a62nxTsxJUbOzReuQHvuAI/RbpTuT9iA
	 VdFHhTMdPOoMH4s2JiaJSk8IvtUzbYCdyadfSDkL7haooSA5WXTa7xGfrmipYDyAumfeV
	 it/nrHAeHnb+ppywkqA4BlGTHErV9qRIkMv/L5QnwUW5TsA9QA2dNBpPuHHoeu8ItV24V
	 +yGDx58tAp57/f4KK7pVWFZTH2+cV9KmZtCZC7p3FQtScMtgbWmZjjvvFlsEI8IMnwYk0
	 7P9NI5tnPLfxmZQBst1V5wPoZZbaerxFeADahkADCq11JXQbae/YmUMDYYMgoHbfeng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=Mu84mZSij/3CB+1sN5Dy04N9VPY/s4lXydtYOJyIYgY=;
	b=J/0T/TwEWI3C9G5QvHOCvyowUHQPjC42tzD8uj8FIdKrQQ/RIRo1wkLFdkteeyKD/yN9
	 np1tkb0+Xg7Cy2tMJAYQVUNgShnIFOxqlrj6duG/BFqoNn46DD+lwiz3qEOqL3XprYyO2
	 tomxH6ogqRu3GZ9zt9UMsJMV/KmkGjEFdkMStLBxZ+FEMm0hjLdWvJ79ZZK/nZ4Z/chvr
	 QY7wFEgaeTU4Z3E975XLPad4N4Wz+QaXBW9/tHUes78IGRkvDc6zjmEV0tD9/zfETQIpB
	 3tmXfhoWjFViqYu95gtzb15xAEISunujPDyV7tuuxa6XFhu83JjJeyR+FfUO+sgb2jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oREn7172;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40070606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40070606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oREn7172
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1496079f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793899590; x=1794504390; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Mu84mZSij/3CB+1sN5Dy04N9VPY/s4lXydtYOJyIYgY=;
        b=oREn7172GxcGEutQiNpXYLOitC2IQcE2PoOF23DNwPzKpJMsaC2X+ATWyfB39FqGHa
         hf1yPhOoHQYY7OTC51m/V6j/Okfk/+rY+/4XfRQV0JAuTLXjC74EwI9mHYfLltxbjrjW
         nwx7OISdiDwwlJokTvyFgKyJyXN33630MmOGS64vJoenXFLp6aHJ9cXndj8IrZcdyKgg
         eBOqhzz85vqVsd8AIZG1fExOpY4EfZk9bfLAvYZhSX4ZZoAtZXcqMrhYK/1BOmhg44mq
         bzfPdNrwpBRPGgRizrJXtPLwkqxqbuWaVwFJ8At6uaYZMWArqJD7LIGgDFBQHCKiXvgm
         TVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793899590; x=1794504390;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mu84mZSij/3CB+1sN5Dy04N9VPY/s4lXydtYOJyIYgY=;
        b=e/qxQAQSzyrXy2k+e2GCJvwZ89ScCO9oCkUGTzNCPT+UAJv3o/ay7CiBN0GCjyuAG9
         84LA0naVL0J5w+KO+UR2jnJ5mxwoCykgXiIneaTIOr/yDjsO/Mmw9421U9vHFcMONx09
         q4JtEBY+3xJLzdJ1H+vkO1jKOVkMhHxhVLCJvMcDKT6YINPJI2t/c6oGuvBl/zlSzI58
         LXJRzRjMpuzMzlo1o6Pn5lB0DKwTVgdInT9Et8TzQ6zKbkWAN7W+ZZIsFMP7x/3BlLjl
         de9qOSFI4yw5Xp2918fUqYajhVGdavwml8VlS/jNB0MZXEjOTUoe/R2zgnOUArdGzaQa
         0cAw==
X-Forwarded-Encrypted: i=1; AKwUvBzQnRPsrCB1z/7ooGY6HemveqWyH1Z42nwHo6/hBQOyIKjt5lQOWvoTlkAISChcOiw1vGE8484Zbgk98zU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nM83opW4zek/EAdjAusCzwM1o6RIQJpMgPjczaqTKOc6HYAST
	24lCIKTzpbdloc+H/DiAYG8h0g+AsLvmG9lIdPd0Cm+jCdPZHr/EIEYsKjq6jy6ezhY=
X-Gm-Gg: AYBFou3rmjgsLhcBG1mVlQEDbD1qNOuNKcOrAwXt7CND4zGOCLY2SO/UJUYvKvW8spO
	vX87QDHM7nh/8/0Sfp2tH7Dd5qRzbOuHekYXKJqyL1pjshhvbFUwh/HGHmN9xpb0SVI1FjfAuuf
	RFfEb4z/p82vHdnOq28sRPQbXpkhQ9mi3y3rElSbGEbMuB+nVU9nB7vTU28JuiD29Qz1lAcEasn
	MjnQRzNww3R2QfRFVFbJXKSOID/oTJdPBqKQFpGUQvNJYqgXb0L8MonKlB90K1hdVzSbDyPWAMK
	ZUQC96MyYiEleExEv7oLD/1gcxtZpFIcrdatN3LzU2Ecbp4A0m6XDVHRWMHglAUpz3sDWVGbhmh
	p9Nfus6zMjyldBUW9SWtwRKxhcceR1+Ay4IAd0SWotfg+c3W/gp9lWL3Q5asxPR0YTOawgzdRtT
	+3An6eM2kqy84bFby5RZYipfo4Z+OUTG41ssF98iwVkCpfV90q/ym83szwIVAXzPllhaGqjcwtQ
	b1BB89zcOXETT9i7T5YWMnvHL1XDGD2q7AHLzI68rNbzFTwBz1kqRzn2ES/0uSkSOzoedAePpzW
	IONnXaOaZ2nMs/4SBgEES/mfPn18xOhSzQ==
X-Received: by 2002:a05:6000:260b:b0:48e:6f76:dea2 with SMTP id ffacd0b85a97d-49277d9c77cmr519333f8f.38.1793899590581;
        Thu, 05 Nov 2026 09:26:30 -0800 (PST)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed5538basm10657579f8f.44.2026.11.05.09.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:26:30 -0800 (PST)
Message-ID: <5f5613d5e9679307c992d613823b0325ed958234.camel@linaro.org>
Subject: Re: [PATCH 05/10] regulator: core: Hold supply device reference
 until constraints are resolved in regulator_resolve_supply()
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown	 <broonie@kernel.org>, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Date: Thu, 05 Nov 2026 17:28:55 +0000
In-Reply-To: <20261104182148.1176116-6-lee@kernel.org>
References: <20261104182148.1176116-1-lee@kernel.org>
	 <20261104182148.1176116-6-lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9+build1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Lee,

Overall looks good, thanks for catching this. A few small comments
below:

On Wed, 2026-11-04 at 18:20 +0000, Lee Jones wrote:
> In regulator_resolve_supply(), set_supply() previously consumed the
> caller's lookup reference on &r->dev without taking its own reference
> for rdev->supply, while the concurrent path (when rdev->supply was
> already set) dropped put_device(&r->dev) immediately after unlocking
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

I think
"called put_device(&r->dev) immediately" or
"dropped its reference immediately" reads a little bit better.


> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
> index 935fee27f126..6d522731e4d9 100644
> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
[...]
> @@ -2290,22 +2291,20 @@ static int regulator_resolve_supply(struct regula=
tor_dev *rdev)
> =C2=A0		supply =3D rdev->supply;
> =C2=A0
> =C2=A0		regulator_unlock_two(rdev, r, &ww_ctx);
> -		put_device(&r->dev);
> =C2=A0
> =C2=A0		/*
> =C2=A0		 * Supply resolved by concurrent task, and constraints set as
> =C2=A0		 * well (or not required): fast path.
> =C2=A0		 */
> =C2=A0		if (done)
> -			goto out;
> +			goto out_put;
> =C2=A0
> =C2=A0		do_final_setup =3D false;
> =C2=A0	} else {
> =C2=A0		ret =3D set_supply(rdev, r);
> =C2=A0		if (ret < 0) {
> =C2=A0			regulator_unlock_two(rdev, r, &ww_ctx);
> -			put_device(&r->dev);
> -			goto out;
> +			goto out_put;
> =C2=A0		}

There are three locations in this file that still do
'put_device(&r->dev); goto out;' in this function and could be updated
as well:

* the '!device_is_bound(r->dev.parent) exit' around line 2264
* the exit after regulator_resolve_supply(r) fails around line 2275
* the 'if (r =3D=3D rdev) {' branch around line 2242 (with a little massagi=
ng)

Then there'd be just one place that releases the lookup reference.

Cheers,
Andre'
