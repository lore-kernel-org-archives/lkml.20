Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794598234;
	b=GfKZCLPZsFL11hQKCxA2O68QE92eTR1i5+op41/VbUyTpcwvM7svJ1UgrtD2JXYvvrEr
	 e/gNnMuwKNqf8jeooi2KTHUTHGwq8N5D1UWT7KP6Win8zwk15hGMiXxqW9XP+v96pm1fn
	 nGPkbdiZ5WHMjyPyv2QxOH4BkbyqAAurUOJZ7nJD9Jnm2jn6wtrdROnJWKqQwhvfV4538
	 2gOLGPnXB15Tlx1eKtIzo3Yn/aDSL1I80LJ5gG753DwdRMoe+z9k2Qv7l46KVUPwqCNpM
	 LBV6QhtkuRHnKrSS6kFtY1LXDWK5w4siPCWxM4vzmFtSYLQCep4fOC4jZmt3s0xDfnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794598234;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=5RUUEU4Zs98a2BCCEhrllG9CzAbnewWKsXy+kzkBWDs=;
	b=ka9ufPran0nyTPb35OtAezKW+lLv1rwLqJDSTP5BJiwsTqDHZ5s2dbX+l5J5Thh2Eczc
	 YtAwLry+uISTEXEAvrpcxvBrOVud+JHLvz8nrFpk0nPO6rjcEp1n21fd6VaHrzJWb2+f+
	 /owCtZ8m63nv2YBEQRgkudUpw+554Wn53/NChXjEI84Pg0iPvsISIzRrcC3grAc9FWP7N
	 Tc7ZeoTLh2DDTvAgvqsBtTmNvsUukebUvJ5fKMAYmCOX4fQa+wumBaXeLhWq36kuwL0Jj
	 9C9sEyJ7Y1vRlusuzgazspfXquG4wel7ubZToDvtYYqAtHcWqYiBa9PSIIkrnaIhmrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b="UHDE/nC6";
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAF0606A334;
	Fri, 13 Nov 2026 19:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AAF0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=UHDE/nC6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=5RUUEU4Zs98a2BCCEhrllG9CzAbnewWKsXy+kzkBWDs=; b=UHDE/nC64QzET9Ce0UvDM2RQ6T
	cdqX2AjGf9mjFgYKSyF/IpJrgzvFq7ghx5upx7ykxnyq9Vnbk4tr9LGV2nEvlDglE89JkK+xz7yxs
	LT+GX0Tc+pASWuEmdN2DysSE81m1uNwSGZ26dd/B+peLkUZuZL8/LDNWstvwlTFecdIsan1O+lU+h
	demp951nfGj7dQ0EKBFr0z+GCGf8EcVziv6YERLuguZ1A5PrP2ygFXhNnbAwp7d97lOYmOJYv8Sve
	BatOCE1AUsLmV4Qv47RO7XUBKoyiDRIdmO7WRGLmzj8uCQzAXuRfoAFMb8X5qyXfPVv3X6VUlI4k5
	Q/hscLoA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Lee Jones <lee@kernel.org>, Yaozhong Li <yaozhonguwl@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chris Zhong <zyw@rock-chips.com>,
 Zhang Qing <zhangqing@rock-chips.com>, Joseph Chen <chenjh@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Yaozhong Li <yaozhonguwl@gmail.com>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v6 2/3] mfd: rk8xx: Release the power hold GPIOs before powering
 off
Date: Fri, 13 Nov 2026 20:30:17 +0100
Message-ID: <R_CRTELbTC-4nNJy2OQEFg@sntech.de>
In-Reply-To: <20261101154053.3874-3-yaozhonguwl@gmail.com>
References:
 <20261101154053.3874-1-yaozhonguwl@gmail.com>
 <20261101154053.3874-3-yaozhonguwl@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Sonntag, 1. November 2026, 16:40:51 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Yaozhong Li:
> rk808_power_off() writes the PMIC's shutdown bit directly. On boards where
> lines driven by the SoC gate the PMIC's power-off path, a shutdown
> performed this way does not stick: the rails drop and immediately come
> back up, so the board restarts instead of staying off. U-Boot reports the
> result as a power-on reset.
>=20
> Take those lines as an optional GPIO array, hold them asserted while the
> system runs and release them - waiting power-hold-delay-ms - before
> writing the shutdown bit. Device trees without the property retain the
> existing behaviour.
>=20
> The array is claimed before any child device is registered, so that a
> -EPROBE_DEFER from the GPIO provider does not tear down the regulators,
> RTC and clocks that devm_mfd_add_devices() has already registered.
>=20
> On a Firefly-RK3399 the shutdown stuck when such a line went from high to
> low before the shutdown bit was written, and did not when the line was
> never driven.
>=20
> Assisted-by: LLM
> Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
> ---
>  drivers/mfd/rk8xx-core.c  | 49 +++++++++++++++++++++++++++++++++++++--
>  include/linux/mfd/rk808.h |  3 +++
>  2 files changed, 50 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
> index 3dcf6ab..137ab20 100644
> --- a/drivers/mfd/rk8xx-core.c
> +++ b/drivers/mfd/rk8xx-core.c
> @@ -11,6 +11,8 @@
>   */
> =20
>  #include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/interrupt.h>
>  #include <linux/mfd/rk808.h>
>  #include <linux/mfd/core.h>
> @@ -703,6 +705,22 @@ static int rk808_power_off(struct sys_off_data *data)
>  	default:
>  		return NOTIFY_DONE;
>  	}
> +
> +	/*
> +	 * Some boards route "power hold" lines from the SoC into the board's
> +	 * power circuitry. They have to be held asserted while the system is
> +	 * running and released before the PMIC shutdown request is written,
> +	 * otherwise the rails can drop and come back up instead of staying
> +	 * off. Releasing them here rather than from a separate handler keeps
> +	 * the ordering against the I2C write explicit.

this will be called from both the I2C and SPI variants of the controller.
Also please shorten that comment block.

> +	 */
> +	if (rk808->power_hold_gpios) {

unsigned int line; here not in for() ... could also just be "i", as it's
simply counting

> +		for (unsigned int line =3D 0; line < rk808->power_hold_gpios->ndescs; =
line++)
> +			gpiod_set_value_cansleep(rk808->power_hold_gpios->desc[line], 0);

This code is (now again and more correctly) running when irqs have
already been turned off, so nothing is allowed to sleep here

When you enable
CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
you should get nice warning splat about that.


Heiko


