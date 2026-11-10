Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303215;
	b=PpebxanSVRlxnJDz+wSIPxSHTbFiF24gtn21+9jyZoj0ThM2XmhPczsBuOLzxiSby/1f
	 1NvlihCEOThxh5uJ3a+B9RoJxozZOxPX5jz9//IztvB8XKpZNpSmAbtDhwnfI/6wvZr9t
	 tFrb5PEblpoRFgoxD5woD2QRDbn/D6JEmczOo6BDX+7ktjuu5nhC60UAmN0NE+Fdk/SK4
	 A0P2MM/whJ6Cu+AOSPfC2/aLMyv//sz4qqh4/56ZLMCWyek1T8Ccddm4jWg7i7rOo/M+M
	 0VhaC+06EHWJFN4AB3vx3GxGbGhMCf2tnUoQSiqRb6G35Abmk7PfN+2BOCZpeLN1x5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=OnnixAIxZIZv6mk8rahpY7T2w/Mn62deh/bRZ7Lw29c=;
	b=1IO318w2StQo4OHwHF38olKj38YYpn6hemLV6lj/jH+3O+BUtRORv53BoF6ZESTTnOEj
	 GCrW0qtRJAalhCKa5v4FhXcgcUcEVrkDrZKtorqozEVzbSc1AmDN0RovgJDDuw8NIlDZ9
	 oeHNncoLT7M4nZ12rZ1MJyFlbDrrSRFniAPtWaFS4Q04cJp6mD04iugtIpwrfDFFy2Fwy
	 hyNqI/xeViosKBywSKUCHEQF6PB7AIa7AxV5POTtY4X2xL6Y36kcOAdoLkGq+M6HhbokZ
	 jar0uWmqGwGeH/XN0KVHj6U/HZdTOrMCSoYQHnQNMQgOMnCJKnWLPk9cnKGYHZViaVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TQAMLCmQ;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D306606C65F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D306606C65F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TQAMLCmQ
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-491971ac844so1723518f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794303212; x=1794908012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OnnixAIxZIZv6mk8rahpY7T2w/Mn62deh/bRZ7Lw29c=;
        b=TQAMLCmQnAyqtVkUvyOGkMHleLtEMxGWACVdur77SR2TSHOyRxHgw/pHwrpzXlN/r+
         tgLhG0UY+7pYPfFxg5RnkUoT2ZHkFvRo6XQfD6KnmT+Cho35vIDHBAJ0ziyN8YnNUfhW
         yvb1s8aG1tzaVuuErBSj37ePTDfD5RH9giaZ1NQoKxDQuQphDNzDrEuH4PUo5s1bomi5
         U1lMz5NLCU7FIoVBdR8+IGh8Wcwe1yIwf0SUYN1vb8DCblpX+GNcQN4NCz+/5I6s+RuJ
         bME4ahQ4NwBL0q9Ewn9pgAuzKK9jfH6nrBYK6Z5nQqDYKFLjN/ToX+9kv7Zp4CvqE7gd
         iYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303212; x=1794908012;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OnnixAIxZIZv6mk8rahpY7T2w/Mn62deh/bRZ7Lw29c=;
        b=zqdCB3xiAw2YaI2YMEpZYGd1hvdbrInxiAA20PWvB8dB2+8zS2+kd3xSpFYGza72dU
         Is0SQyx8+qf2kj7hUrqvAOxQBVv54esawTsn8r+nvWPVHQvdfRO8s7Twan2Vk0Fun8eZ
         rRCKqkmql29Evz1MdXW8ZUh6wqIMbQuw8JFt87Z6lkGrKGTU8rNMMcps+htx3yTLOzT8
         ocWvtYCAGxbi6PAETa2TWFiUR6y+gmB3jv9YwcBjLmZ2KE/Wbb9OnVcV4j44EudQKfob
         2Tnc2DiKr9xmSANGIgjSFM6dAZz1VkEqVS7OpirNL/pY1ocBUp0svlnAphg09uZE1i7E
         yNMw==
X-Gm-Message-State: APuU4Z/m58+bwm+tRX3Tsm3OFMxfUjjQubbAUmyHsPNCBc5rfd+HY2ab
	7cfDZz92Zb9w46ziZzygA2MHDmabVjPN1ehQkbvUZPNzPmu7HdDSL9BjTA2FFngrs6g=
X-Gm-Gg: AYBFou28Vc9gHqf3Sb1iizmSB2cY0/cf0hL6CjrsiVXM3AmXdXyFLIk5aoIl3oplfIL
	lpYjT+GYwHuVmxCBvwXNLh05efYSHTNnxswyQQ4Ruq8f7iziP3lHLIJ7U5kizdi3+ry7a+oWS0A
	JBLn1WhFj8tUWR3KIfoiZfJgoswYtr3MI4eOyYPdPM3fTUxm4HTR/YWMaF5ec0WTYDEL2xK+/Kz
	jO69k7h84vC58+xpuyoxOGsoICS9H0KW+TEXwnhe5I6jGQ+lMQseWeyDjq3E0pB5Yk23+NyjKf+
	Rpx/NYLOQ+L227ode1tZFXsfE06Og42LlCw6wL9uqEVoGEn5+Nzrp1rD9UgHl7M6yysPREFgmsd
	cTgKOJB1xq2tfTJKbUIVTuaOQ5o/FmlGHqrndRHMAz2wnpdeFTOPtHfvxKfAyylvrGqjxpF0e/u
	kqQaPSr0Z48aKrrO3t7cO1B+EMeYVfJIucGaBVrOAw6rUA2vNmw3N4TM1niP0NA78ykRlBLNPEg
	zsjaaq8zRnbo66aNCVz4r55OGkg9mvVZhvEHrqx0V9hb7CsM8Me/R84O+KNXFSHrJdB9xalANv5
	KCtrIJsBz4SJd355sHcys5U2PFn6YKa1rTk=
X-Received: by 2002:a05:600c:3d05:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4ba0230519amr32614725e9.4.1794303212147;
        Tue, 10 Nov 2026 01:33:32 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba01fba476sm61250675e9.2.2026.11.10.01.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:33:31 -0800 (PST)
Date: Tue, 10 Nov 2026 10:33:29 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/2] regulator: pwm-regulator: Revert "Calculate the
 output voltage for disabled PWMs"
Message-ID: <avLd2Ps5imiqK_OR@monoceros>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.44efb263-5265-4fae-9cff-e8eaefbc0afd@emailsignatures365.codetwo.com>
 <20261106130010.340950-1-mike.looijmans@topic.nl>
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
	protocol="application/pgp-signature"; boundary="wicfgf4wsnnzqikt"
Content-Disposition: inline
In-Reply-To: <20261106130010.340950-1-mike.looijmans@topic.nl>


--wicfgf4wsnnzqikt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] regulator: pwm-regulator: Revert "Calculate the
 output voltage for disabled PWMs"
MIME-Version: 1.0

Hello,

thanks to Martin for looping me in.

On Fri, Nov 06, 2026 at 01:59:55PM +0100, Mike Looijmans wrote:
> This reverts commit 6a7d11efd691 ("regulator: pwm-regulator: Calculate the
> output voltage for disabled PWMs")
>=20
> A disabled PWM is not the same as "set to 0%". If the PWM is disabled,
> this could also mean that its output pin is tristated for example.

or even active.

> If the PWM range is limited to something else than 0..100% this causes the
> probe function to fail with messages like:
>  dsp7-pwm: failed to get the current voltage: -ENOTRECOVERABLE
>  pwm-regulator dsp7-supply-pwm: error -ENOTRECOVERABLE: Failed to registe=
r regulator pwm-regulator
>  pwm-regulator dsp7-supply-pwm: probe with driver pwm-regulator failed wi=
th error -131
>=20
> The reason is that regulator_register() calls get_voltage(). The PWM is
> disabled at this point, and then the validity check triggers.
>=20
> Anything that calls get_voltage() while the PWM is disabled would get an
> -ENOTRECOVERABLE return value for a pwm-regulator that doesn't allow 0%.
>=20
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>=20
>  drivers/regulator/pwm-regulator.c | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-re=
gulator.c
> index 7434b6b22d325..f50530c77d92f 100644
> --- a/drivers/regulator/pwm-regulator.c
> +++ b/drivers/regulator/pwm-regulator.c
> @@ -157,13 +157,6 @@ static int pwm_regulator_get_voltage(struct regulato=
r_dev *rdev)
> =20
>  	pwm_get_state(drvdata->pwm, &pstate);
> =20
> -	if (!pstate.enabled) {
> -		if (pstate.polarity =3D=3D PWM_POLARITY_INVERSED)
> -			pstate.duty_cycle =3D pstate.period;
> -		else
> -			pstate.duty_cycle =3D 0;
> -	}
> -

The status quo (ie. with the if removed in this patch) relies on
undefined behaviour because (as noted in the commit log) the output of a
disabled PWM is unknown. It might be high, or low, or tristate, or
active, or inactive or it might even still toggling. So without further
information about the involved hardware, you cannot say what the PWM
(and so the regulator) does.

However removing that block makes the driver ignore if the PWM is
enabled or not and diagnoses something invented. With a driver
implementing the waveform API (instead of the legacy .apply() and
=2Eget_state()) you get

pstate =3D { .period =3D 0, .duty_cycle =3D 0, polarity =3D PWM_POLARITY_NO=
RMAL,
=2Eenabled =3D false, .usage_power =3D false }

For a driver with .get_state() you might get

pstate =3D { .period =3D 100000, .duty_cycle =3D 100000, polarity =3D PWM_P=
OLARITY_NORMAL,
=2Eenabled =3D false, .usage_power =3D false }

>  	voltage =3D pwm_get_relative_duty_cycle(&pstate, duty_unit);

=2E.. which is interpreted as fully off and fully on respectively.

I think assuming a disabled regulator when the PWM is disabled is a sane
choice here, but IMHO definitively needs a comment and explict handling.
Something like:

	if (!pstate.enabled)
		/*
		 * We don't know what the PWM does here, it might just
		 * have stopped toggling at the active state. Let's
		 * assume the regulator is off instead of erroring out.
		 */
		return 0;

Technically more correct would be to say "I don't know", but that
probably involves some hassles.

Also note that pwm_get_state() returns the last requested state and not
the actually emitted waveform. (So if pwm_apply*() was called with
state->duty_cycle =3D 300 ns and the hardware rounds that down to 0
because the smallest duty_cycle the hardware can do it 400 ns,
pwm_get_state() still gives you .duty_cycle =3D 300.) Also pwm_get_state()
just reports "disabled" for drivers without a .get_state() callback if
pwm_apply*() wasn't called yet. You might want to switch that to
pwm_get_state_hw().

Best regards
Uwe

--wicfgf4wsnnzqikt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmry5OcACgkQj4D7WH0S
/k54zggAimrFkxM3itX2afvL5X2auJAGz6hDsH8e0IiBEItupsGeeIzUT2/DaSUO
6F/ZpZQ+coUIKV8UPKAyPHTIw/zyEQvrzlLDYKhUz4lMd+eT8vSJ4itmUbpha1j3
Epr6/xMxCokiJVj1966Nae+SGo1CcGFBPzgx1evA2F53kNlGtR2ryj4oJPi8m8v7
dAFPuHYIp+hH6lVJrhHL1TPL1Jy16c3BoXDaMybzv++mPUfXXNxWd9k0RNxHc2hU
93ystbVWKdvBlZbaTQnq3vzHwKPSMTd7x7dgh+AdoITk9ZLffV/WXiWjm9pnFVrl
HOZBYgA6qBtMYTDPKOEE9eUMzep/lw==
=UXDD
-----END PGP SIGNATURE-----

--wicfgf4wsnnzqikt--
