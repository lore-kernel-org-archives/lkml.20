Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC733B19C6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790770331; cv=none; b=Xw6HuHdlYFbGjhflx6z6V83XaweRSE1wrVNDs8i+EIiuFpWerA//gnqvRQad2LtHY4IjgBnKNNTnlsGV6EELDl98Tjm5xM3Nb/TItxxHn/eK0Owpv5HSzJeMM7BijQxxjMs/J7U/FQeupHli5C2S+xEztZEfsHUemlUbUjz8l5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790770331; c=relaxed/simple;
	bh=1Ud4xzGqcr1aXqgg3blxBT8OmlKDXmH72QXq8TrjxLc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=fup52JYkcPbwSOCAsL0U8fM5yFZ74Xc5vvsnNEycphdJ3ODl0qao56b9Fehaoyx8mm0Jur+QpQdrD68W/Ob+fpTBqDtDwiV07XjwHHK3Jb/OJ+8hETYeOqIW/QodxEG0JN+uj72jyH74qhFhjVzV7O6nka3A90fLxgQHW2KEk/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fuPxU8oR; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fuPxU8oR"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so8813185e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790770325; x=1791375125; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N5vGs1seEK3Ka9iEwzeFSJM/oyAsmGiZsBgaewDEAKI=;
        b=fuPxU8oRcYVBcXesYe5XgpmdO6qEOclRtBm0q4BE3Fs19XT1Qyaz0td8ldCId4Ru2j
         FNekoWjWHzNYXxt+OQz2c9IOLPgiSEp/a3n6y30IGcAzKpmga+vd7KjaBfDArlexjaeX
         59Da2yZFBaGA6ky+eAkLnSixL8AqSL/vdHagPufyFAP/WcUIY2tWFhyKi3rUpEn//Fdv
         JonwDIh8jJEkDbmb88eMxFKj595XLoGPTMKSE0Fgo4QviXFnNpCbcAOEgOzaaP91J3rQ
         8h3n27WWsmkykokqVDwaf/XYFYIGgMzYAQVEsQvlwnyi2FYNBK4tXfsu9++yQV1w6fTV
         s8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790770325; x=1791375125;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N5vGs1seEK3Ka9iEwzeFSJM/oyAsmGiZsBgaewDEAKI=;
        b=pRD9owdX5UCEoXSPJEEJi+HrrjBtfXXrtzbxKVddkuJt7+ml6JaKZxV6P/fX6SDoIN
         SxMSCBf++4eid7y1EJSvhaxfWJBapONL8HnhKEiBOm+9mU6qxULgPXpmpC9Zq+cE2Zv4
         Hkmg+G+s6gFxEh6DE+fDy1pUxtyhkWVxUJbQQuFgyZBQ/6jNjCZ0BNaUrHVYpgX+VLzH
         jgShWcsGfTWyDBGHH/Q+OTPFEI91P+VP/6+jkEK2AcSBGBOf7oS+QBh0VbpbLDm/2+pi
         pXIsvLvx3CkKKv8HWfSydn4wiemR07sf2EzM2WdlpLbf6SYd8Sgerc5UbWsQF7sD4q9s
         N1PA==
X-Forwarded-Encrypted: i=1; AKwUvBwjFByL5JJvXS8jgyed9kxDGH08GAlVJo7h3NmJ/fLlAOEcnLwiZz7M9bBbLUbXznpK13KVe/AuSH2/4Xk=@vger.kernel.org
X-Gm-Message-State: AFuF++mczitIq9DfAujknwngW+droJoQUKg9Jywx+Jw1goPw/7eC6xMx
	ZirACGN5Jw9Nl3UfB5wHEQNPM55dznjQVsC2NUuCYWWgx8iNXC8iftc4SBRaekm8yT8=
X-Gm-Gg: AYBFou2lVCqJwlsIcamvaSs+acGTREeU0Ube0ReQee/Mjt2VyNknQkQZlSrdxrIVYVR
	br0FplSqltMwW6CGlCxRrfr0Xy5rtEaySSY7lmvSmWkh85cVjWSg1letWUDwJj1HbFDZxBiARrZ
	LLfQMNbxG8lXeS8O6TedO90c/yvlN/YdVz90KiprlnmlGaO8gZo5kP72/xaoTXpbu1TQr8KEid5
	pjCa1dFAFhkadqx5xGkqmr2djOuqw8p0p30W64PQ2EQkxsa6oOuAaElIKygnsWz7ZHP/MPRfKcM
	PcgjfsbPFyaGlhvlRjGfg4LiLk312XI/edFkPRuBGglqHSmFnpLSI/xpqMEQlcJLYzaJiE+hSUk
	biEguUn4nubPGs3aYyzhHyZV/GeHYPnwUZcmCuEawMvo+g+27lsIiUpFOrciyelIYQZmhobRdXF
	pbDybieJc0g/sUPiY/IStSX9HAnpAbQUdtckpNmmTN17BcyP/IghWr8hu4ffdEFzzBq2nUxlFDE
	ld/
X-Received: by 2002:a05:600c:4691:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-4a01b188fafmr17252615e9.3.1790770325183;
        Wed, 30 Sep 2026 05:12:05 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:c4e6:4d28:61c:74bb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a017468b10sm67033075e9.0.2026.09.30.05.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:12:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=556a792abffd9ae695a05a5a547bd46464fba304192a1e2f92c220c5229c;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 30 Sep 2026 14:11:55 +0200
Message-Id: <DLSN3HSWU044.10UYU9AQX2MV4@baylibre.com>
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Kendall Willis" <k-willis@ti.com>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
Cc: <msp@baylibre.com>, <s-kochidanadu@ti.com>, <a-kaur@ti.com>,
 <s-tripathi1@ti.com>, <vishalm@ti.com>, <linux-input@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] Input: gpio-keys - support wakeup pinctrl state
 on suspend
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260925-upstream-gpio-wakeup-v2-0-6c5533356246@ti.com>
 <20260925-upstream-gpio-wakeup-v2-2-6c5533356246@ti.com>
In-Reply-To: <20260925-upstream-gpio-wakeup-v2-2-6c5533356246@ti.com>

--556a792abffd9ae695a05a5a547bd46464fba304192a1e2f92c220c5229c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 25, 2026 at 11:52 PM CEST, Kendall Willis wrote:
> GPIO can be used as a wakeup source for TI K3 AM62 devices during
> suspend to RAM states. The GPIO controller is powered off in these
> states, so a wakeup enable flag must be set on the GPIO pin in the
> pinctrl in order to allow wakeup.
>
> If the device is wakeup enabled, select the wakeup pinctrl state on
> suspend and restore the default pinctrl state on resume.
>
> Signed-off-by: Kendall Willis <k-willis@ti.com>
> ---
>  drivers/input/keyboard/gpio_keys.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/=
gpio_keys.c
> index 129fc4212a5ed126496b331ce626682d441c53bf..d3fbc9776ac8cbdc7349a28df=
990ee609edf9e59 100644
> --- a/drivers/input/keyboard/gpio_keys.c
> +++ b/drivers/input/keyboard/gpio_keys.c
> @@ -28,6 +28,7 @@
>  #include <linux/of.h>
>  #include <linux/of_irq.h>
>  #include <linux/spinlock.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <dt-bindings/input/gpio-keys.h>
> =20
>  struct gpio_button_data {
> @@ -60,6 +61,8 @@ struct gpio_keys_drvdata {
>  	struct input_dev *input;
>  	struct mutex disable_lock;
>  	unsigned short *keymap;
> +	struct pinctrl *pinctrl;
> +	struct pinctrl_state *pinctrl_wakeup;
>  	struct gpio_button_data data[];
>  };
> =20
> @@ -884,6 +887,10 @@ static int gpio_keys_probe(struct platform_device *p=
dev)
>  	platform_set_drvdata(pdev, ddata);
>  	input_set_drvdata(input, ddata);
> =20
> +	ddata->pinctrl =3D devm_pinctrl_get(dev);
> +	if (!IS_ERR_OR_NULL(ddata->pinctrl))

Should this check for -EPROBE_DEFER and error out in that case?

Otherwise looks good to me.

Best
Markus

> +		ddata->pinctrl_wakeup =3D pinctrl_lookup_state(ddata->pinctrl, "wakeup=
");
> +
>  	input->name =3D pdata->name ? : pdev->name;
>  	input->phys =3D "gpio-keys/input0";
>  	input->dev.parent =3D dev;
> @@ -1010,6 +1017,12 @@ gpio_keys_enable_wakeup(struct gpio_keys_drvdata *=
ddata)
>  	int error;
>  	int i;
> =20
> +	if (!IS_ERR_OR_NULL(ddata->pinctrl_wakeup)) {
> +		error =3D pinctrl_select_state(ddata->pinctrl, ddata->pinctrl_wakeup);
> +		if (error)
> +			return error;
> +	}
> +
>  	for (i =3D 0; i < ddata->pdata->nbuttons; i++) {
>  		bdata =3D &ddata->data[i];
>  		if (bdata->button->wakeup) {
> @@ -1023,6 +1036,9 @@ gpio_keys_enable_wakeup(struct gpio_keys_drvdata *d=
data)
>  	return 0;
> =20
>  err_out:
> +	if (!IS_ERR_OR_NULL(ddata->pinctrl_wakeup))
> +		pinctrl_pm_select_default_state(ddata->input->dev.parent);
> +
>  	while (i--) {
>  		bdata =3D &ddata->data[i];
>  		if (bdata->button->wakeup)
> @@ -1039,6 +1055,9 @@ gpio_keys_disable_wakeup(struct gpio_keys_drvdata *=
ddata)
>  	struct gpio_button_data *bdata;
>  	int i;
> =20
> +	if (!IS_ERR_OR_NULL(ddata->pinctrl_wakeup))
> +		pinctrl_pm_select_default_state(ddata->input->dev.parent);
> +
>  	for (i =3D 0; i < ddata->pdata->nbuttons; i++) {
>  		bdata =3D &ddata->data[i];
>  		bdata->suspended =3D false;



--556a792abffd9ae695a05a5a547bd46464fba304192a1e2f92c220c5229c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCarz8ixsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlPB
rgD/RvPG9MIG+abj3sGJsRRPXb05u6y2oKt7iWyCnIJnPmcA/i4fICzTuQuY1jiO
YEW6EdYtDK17cq0rhe1HPUWOOa8J
=HyDX
-----END PGP SIGNATURE-----

--556a792abffd9ae695a05a5a547bd46464fba304192a1e2f92c220c5229c--
