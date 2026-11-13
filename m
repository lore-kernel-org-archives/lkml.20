Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551673;
	b=wdEK+yMjgWCzSGhfAduzn6MjTGuWCyZB3LUq2p/ZRiX88fKNrjVz6NKz35UXwtkyMLxZ
	 oU6Iwem/ftXliY9Rc1YQP8U55ljNxBBVCvPPinhrwE0m1gehtH3tqhz0CiJQ4INKTcrWC
	 DHMZGVXlgiiONzZNzfpTuTya3fgo9f5Onf8YdXvm5nI7e7JkZ7TsOAm56vMLQDwKBZq/L
	 46qR4F+i8dhlB3Isfr1l/6sSChcsYc3gJJX0zhldHLq8x+zMNhHF7w8DeZ4H+JTt4UOaf
	 IKNRlOx/j9uoiVl0tXjHB9nndoM/NlekQhgQ42t6yBW3YRTTpj+JSYjsAgdr41vgk3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mdanL4lnjhf1tDXUSVl0wHa7iY+CsmDBpWWdd3/y5b0=;
	b=Xr9nvBFZ5nMcYCsazc/PFL/dk3a8j82eQnc3MDoby0NaeOwx/tDQ+XDJbooZVKbREPwE
	 wQ3ypNgxl0m53nTV1rY9bWIMYGi3Y2XAQvu82JGuGM0Sf/AHH2h5C4HY4mYhzs1VE9/pg
	 OnvihwYIyYs/XhLfB8RKeDzqBpoyVXgDsaLTeMNdqGsTBrYXenAsTds+s/L5IiCiYkKzf
	 Rl2xfNban+Q5Oxw0S89ewZ1y6bsg73YmwBLjzZy+pVUtj2BxwUZwZBKZY5iQv8xy4MSPv
	 SSsvABXPgsFC3UqibdB0ieYrHkL2d4AsCYSLSce9lqz0y6NN3gNjYR5bDiMGibx4UpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=I6aemvBJ;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255CB606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 255CB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=I6aemvBJ
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so8783295e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794551670; x=1795156470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mdanL4lnjhf1tDXUSVl0wHa7iY+CsmDBpWWdd3/y5b0=;
        b=I6aemvBJHmam6cbe/j4xacPPokmaOo/01fnqrJkf6jHqoIkkA6Oiru/Yu0qvs58vHV
         R/crfoNsxXMT/QzFJPThJV/Yx6I77XkeKVYmi2lcyO6YplQfI0/ZjjWSZfzKqTHWNDPb
         NZR5EvGyQkTPah9S8IbxLyAASDDhZwpgbnHIR3IWkgSSJlv4dbMb3Dg7WzxLkAiNTibI
         C8JMRIBMwid+wNtDLRINIOg8Tr1MHNqmabdR1Dw4O35ztbgC67SgZW1F+H3PBnJb5V3f
         wO6xTFbWvgnhQvigre2rFM4ZpPx+b34UwH8N2Qlw4yp6jY9dkgMO775CT25rjV0W7lGJ
         RlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551670; x=1795156470;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdanL4lnjhf1tDXUSVl0wHa7iY+CsmDBpWWdd3/y5b0=;
        b=fUyc5v/EdBGoA1mqqt7xzVHUCYu252YMefdQdaZbaRLAn32wkZYnuRgWlTVmuiHqFx
         ILsuVE2Ny/71kR/x1JcUddj/NIEMgYkJ6/6zhhqWw+XEW8UmZaaHmHsfboE2X8HbEWcI
         WB9eyTZxpnp5/QXh25/zG+fWcKugqqUbRnj6Qcb4eFYvrVTbU807PxQLHFqC+uYLkYGb
         X6KzSe3rQyYwoRg1JjOzLwfehdnDtS0B0FNLDeP2HDxT/6zYPPapXRVEk0CGwSuSAunf
         T3VVktU+o4fru52cwSqBSjYoIQzwBkWIWNRFUQXpgpKr6ARNGmT0Ttl7+Tquprq0ry/P
         GeRg==
X-Forwarded-Encrypted: i=1; AL+hErHTcX5JqcRi9tXtsUslKHX2pA6+8GXMIjy9aZ0+vYWiJ+NVBr6GzvyZo5S77DppCg+sFkQnnfZDf9uMlR4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/s7nQySOlm0KQ9Pyty1SLDVxafZ4JOZZfQzK9eVhzV5EsZwAXz
	rwjgogviZGdJb19vxGmD3hjCf3RCnnaMy17IOh7U/N/CVho0nUQe7JI9LAo4lX73pfU=
X-Gm-Gg: AYBFou1adwYRhKhPX3W7y1I6gXql3ccWy/2bePXwrCymBuFCPTDqG8A/KSw1G79Tfw9
	jyTCAGs/FAGY7894THyEhpuGJ6HUs2C7IiGeP7JB4BGgzgeQcfIUx9vt6Hnhy7jyo+ZiS2kmiRO
	COBtaCCOmUMx44XSdNxWxoL0DxbRATkgBy2JcyXpn2ceS3ZLgi3P1MRzrUG2K25N6xOWghDX2Yl
	HvlTtoyo0ALWQt1C1tbV+DoNzUkJEk9+dNiwe+qNzk9u1kGmKHMBM4TBQoXnu96qTA0AyFCFLSn
	TqqnDFNfPCwIaPOOZ+J3H4CSgEbNlAfjkM0YYUP9EqnG4hyPIiMAkUdkhPiYQ/As1R5xpZUx0JM
	K+czy0JVe71Cc1EmlN+8CDrNL44sOkKm4Fha2e4vQANednS+sX3u0W2EoQYepEh5J172qNC8Ru+
	zQUMCqQS1xdps7Foiy8y9Q+S9hRgzZlFFjEm/y+UQDq18E4ZiW/Z/qEMFykKoO10YzWE6sGsXih
	dwJyPYUoNyCA5uN5wreeoVEkAAmXoZctb6+5SJ467OjlN/DcVgsXuSYFams69yuV6sovF2mcQsb
	fo1XGKZtz5zS7QFHq/pqjBVjGu7skIg1ww==
X-Received: by 2002:a05:600c:3f08:b0:4ad:5e09:ae43 with SMTP id 5b1f17b1804b1-4bb55a8d2d6mr27281365e9.29.1794551670522;
        Thu, 12 Nov 2026 22:34:30 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49c5d22394esm3528090f8f.3.2026.11.12.22.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:34:29 -0800 (PST)
Date: Fri, 13 Nov 2026 07:34:28 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v9 05/12] nvmem: Add the Raspberry Pi OTP driver
Message-ID: <avauNsYkHqIAshCe@monoceros>
References: <20261111-rpi-otp-driver-v9-0-0a7292a7a5b4@linutronix.de>
 <20261111-rpi-otp-driver-v9-5-0a7292a7a5b4@linutronix.de>
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
	protocol="application/pgp-signature"; boundary="dzmqcqzq6stkx3nh"
Content-Disposition: inline
In-Reply-To: <20261111-rpi-otp-driver-v9-5-0a7292a7a5b4@linutronix.de>


--dzmqcqzq6stkx3nh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v9 05/12] nvmem: Add the Raspberry Pi OTP driver
MIME-Version: 1.0

Hello

[dropped Ray Jui and Scott Branden from Cc: as their addresses don't
seem to exist any more]

On Wed, Nov 11, 2026 at 08:23:27AM +0100, Gregor Herburger wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Don't include <linux/mod_devicetable.h> as that introduces a lot of
unneeded build dependencies. <linux/platform_device.h> is sufficient to
get of_device_id, so you can just drop <linux/mod_devicetable.h>.

> [...]
> +static struct platform_driver raspberrypi_otp_driver = {
> +	.probe	= rpi_otp_probe,
> +	.driver = {
> +		.name	= "raspberrypi-otp",
> +	},
> +	.id_table = raspberrypi_otp_id,
> +};

Inconsistent use of spacing before =. If you ask me everything other than
a single space gets inconsistent over time, so I recommend sticking to
that.

Best regards
Uwe

--dzmqcqzq6stkx3nh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr2r3EACgkQj4D7WH0S
/k6+Ygf/S3+kTetCLEiK3rGw/ROThFP+vKHVE0yIu2nZcj3dbawf3ySgY4wtvMJa
0PbVsBeV9OgRc4ZEsTQF1kcAR823yZXDtiTzGnr2rvlyz6rrl1wvHyPiphHI+w75
XxDCFxj38njwrnwhcUJTxHeH5bpa43eYpLZHCGQeNs/1CalWV1lxeonWMC5+kbzr
TUgmCnXFg059Zu9KpxeAPpAd5uQ3rihwl+7n11njUahK4aBuIhKibFiC/Mur9HJ6
y6s4h4Rk4A4KiA/z4puB/W/FSQLIej2b75CbvUkvGqBX5jOIbgbqza34HyRALj9L
XBcLUzxAKLY5ZvkPb2DgHx5xPh9+sw==
=ExxM
-----END PGP SIGNATURE-----

--dzmqcqzq6stkx3nh--
