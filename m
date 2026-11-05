Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893367;
	b=C1LBq7reApiJ/n1DnHy4z//ZuUpaZ8TppEFKCo9LB/tIDl9RcbuJvk4e7KeszwGEYLmu
	 wL+9R3DpMkyKqNO7VNbLGk/cu6RVU7a8JYnYahLDEXZktZK00xVdwh/7VjM3o7WlfKmvo
	 QMQ+YcxYr6eTNblbiRqDDiQGFtFwJhOXV1t02l3x10RPSZMa1e5S5r6FkP8UF36eKA79D
	 i12p4wuGWPIqjDcMIlsmqfgEr1nuVrijiE+5Ds3pYl7dGsK02pajfwqc80HFp7tQp7hn2
	 4DUSES+PZKv1FZgWlKQTI+l1Klb1UptCv+mpDLGj6C0XkBCA79wzmSQS+8pL5TAvxrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CNjjrSNQGLbkLKnHiNf/ABSrRsMuuhd+YnklcW3AyI0=;
	b=g1S5diz2o2ltIoMzcA30GFFQsGC+c53qpVF3XO0sMIB5VDjDhX+tiBTlWr13BffsDP3u
	 VhCIRuYsFOKjPdP+wLi5idavezRqZIgNTgAcMU4JSRvwaH5Mm4T3Xp6toSCNyXLeryCAb
	 7Bm9vz8TYZ1k9fpTVIZbN69sKkrAelUxbdbO7jFDvp3h4JehQt+ayzDEKjaSC5uw5GtE/
	 ZWkW94Y5lvFrifPDsr19ij7HPzmX6+6lsrelnXAXgrcc9dsIzcm6z8vApVXw3FPuQpFvg
	 ODYjUAe0/9lBxuGMnm+fPN8UYGAb5B12L99JTdPiLxCxC+9e+hC0T4gJQ7D3rQzFdEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YkCthRMR;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B03606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9B03606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YkCthRMR
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso21815755e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793893364; x=1794498164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CNjjrSNQGLbkLKnHiNf/ABSrRsMuuhd+YnklcW3AyI0=;
        b=YkCthRMRKMiuRd2Z4NfKndCCeWHe86gUxzUIWiAlNnFY0Wo1vBpt+oxvKGMqtals3p
         Yy/lw3IAFgg0RMoIvldBnLb/vacj+9QQBvMIrXUeIALFxhKov7zmXc8ftWZb+7gMIUq+
         HmsbDWdkKFy7gKBozRej/ca2uHLwvaViwSpEWds9zNdgOcOyG1J/WHV/NpBWVyKweLcH
         9GLmvsc4oyATxsTFBzi0kucJreoY0z8Sr1/TTAg1uOwKj7RsWU1gOzXMaX90EgaDrBjl
         Vd/DWeywNz3MHUifdfjzXdS7rcxlm5SlX2be3DkLNdCFj0IAb+0y9d37iZl+ZjMatgvi
         r+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893364; x=1794498164;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNjjrSNQGLbkLKnHiNf/ABSrRsMuuhd+YnklcW3AyI0=;
        b=a42TwtmXRAukQUz3tHqMfL+VuKqRBXgDnBF94LFcGvgpzOyS9mLp/sn70s8SjbCEwr
         uf426bVwKRBdH20ZX9YR5AIGTJnHMH7Xia/08w/mq51t1WYrDzls0KRhBd+v+NCXa1qP
         X43+84kcKI4C+wjNa1gS0lrR8D6zQcCZB+cgddmKLvj/vS0Ri8S+1HVKgQv8CL8x8rA2
         7IfbTnecdRQKNDQslRPIH7CQbHPkr62bIURswuFiuDz0MDu6tXHNl1a8JTHoufW9P8NH
         YaFjYoneTN7ROIWWs5RHUH/Ox3qe9m+UOwU+37yIXAfVljTp93c0bAHDVVD7yp3yTwnJ
         CR+Q==
X-Forwarded-Encrypted: i=1; AKwUvBz+sAaofygTbvhx2ij+Uw8Nc7ky4PmWfSzChMcqhHQ69b+Erl8prDMM+6GzcRdH1Ygs05HTBMA58Q6od+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kfPBazrDIGzpmWAB94r9YFGQDCHiqO41AHg5VmPfLQIYy50F+
	jZ/re6WbWyI2H/4tLI5zW6UTvLeHCScLAAWEVsVDgc0ZpaZNZZjWCjnTHF3+a6LP0AU=
X-Gm-Gg: AYBFou3TXd08HBR8ShcrlhkPjico8prc8azWM2EZem/t3BExcs3Ewe8Uc/R3RgTfssA
	XBpTKPvkyeg85W4ZtdshN5YjKIosPd/AZFOpaO9jeixcjH6TGw2iaG+F13dLTcaped6pLnCq8tp
	nfAwW0CBNjeqno5O5zm7wfu+1WqUPogKTnkISD7jKpgh2yq/0+p08l16W454a94fu6lmyriL1yB
	DkHuNYXSjILbQihCTv9yrkVP0ZCMJ1f1Uu0iCk8nN/Yibcjd6LtZar5YvC4NNrdJXnsVx9Qii37
	ajnA5xMMJbHyIRkZLmMsxnEZ4lfUpX2R7YvEzZaKHXMGWZqss0geY8+2sWm1UP7bdgc937YN5Xw
	RA1B0SooK7yhlM3CD37+gP5vxAD4AZh1QQUMiajwhGKt+ASGytyc/FPKQlqZ+jTkyxkfy9sflFN
	zxTpXO/sRc7rfzSMLg88K1qvg6ZNNlZlAH8x26ITM5md+NmSgf1F70qltHRcvf0nO71pG1DwpDI
	CitoGKWB8Vt5xQ2MD6FY8sOIA5J52yMbzhQI1ESnoV9TjypHb6CkRR93mGfYkh5uHilf3KfhJZE
	6c+GGQK5csBok9ApI6v0Q6tqI+CloD7Vy0QPB/b/gdMPRomYzpRHFqhSEJGwQIhdutLYu0bMx4z
	cWVAvaFb+bnuZ8wi04f/a2fE+dj79zcXrFWbA
X-Received: by 2002:a05:600c:190b:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4b6267adeebmr31331575e9.28.1793893364291;
        Thu, 05 Nov 2026 07:42:44 -0800 (PST)
Received: from localhost (p200300f65f19a9044f222dad4d982d50.dip0.t-ipconnect.de. [2003:f6:5f19:a904:4f22:2dad:4d98:2d50])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48fec8d87b5sm10229911f8f.11.2026.11.05.07.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:42:43 -0800 (PST)
Date: Thu, 5 Nov 2026 16:42:42 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Rodolfo Giometti <giometti@enneenne.com>, 
	Marcelo Schmitt <marcelo.schmitt@analog.com>, Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Angelo Dureghello <adureghello@baylibre.com>, Tobias Sperling <tobias.sperling@softing.com>, 
	Eason Yang <j2anfernee@gmail.com>, Marilene Andrade Garcia <marilene.agarcia@gmail.com>, 
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, duje@dujemihanovic.xyz, herve.codina@bootlin.com, 
	thomas.petazzoni@bootlin.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iio: adc: add driver for Texas Instruments
 TLA2528 adc
Message-ID: <auyjgDddFs3OvnC3@monoceros>
References: <20261030164705.297354-1-maxime.chevallier@bootlin.com>
 <20261030164705.297354-3-maxime.chevallier@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yopseine6onc6aoe"
Content-Disposition: inline
In-Reply-To: <20261030164705.297354-3-maxime.chevallier@bootlin.com>


--yopseine6onc6aoe
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 2/2] iio: adc: add driver for Texas Instruments
 TLA2528 adc
MIME-Version: 1.0

On Fri, Oct 30, 2026 at 05:47:04PM +0100, Maxime Chevallier wrote:
> +#include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>. <linux/i2c.h> already
provides i2c_device_id and of_device_id. <linux/mod_devicetable.h>
provides many more *_device_id and thus introduces a big list of
unnecessary dependencies.

I recommend to just drop <linux/mod_devicetable.h> here. If you insist
on full iwyu, there is <linux/device-id/i2c.h> and
<linux/device-id/of.h>.

Best regards
Uwe

--yopseine6onc6aoe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrso+8ACgkQj4D7WH0S
/k44lAgAo9dVK371hYEKF67NIG+UneFq4MYJzAcDXxvTtOhkbG3bb3pvqR6IBDfT
cuJDoIH2cpFukhzp7daIjeRVZpJ9S2/yuGTPjumt1eFVYZcFvNB8FU87IQ+3R47Z
utePF5ukTS1zmkZe+1b0fRCH64mAjTRZYEsWsVqzRjg1lmt8vrD3NInKYzW7rJSw
j9qrARlJ8XOODrkeq85ZYnLncp9tj1ilDLcOyU4ffM+IWCHDgLt9BJSZx7F9G6j0
OqBCEhqyudx26Gg0Tdb/HE7uBUDFIeqcV0PljqUHkmfaLTBSRPNsVlQsoO65SvfH
9Vyt+P+ogAtsiSJAyxM1OhsbrNR2BA==
=ujJA
-----END PGP SIGNATURE-----

--yopseine6onc6aoe--
