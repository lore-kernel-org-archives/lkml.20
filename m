Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150811;
	b=OZyRm6SZwjFGqCIU1Yc2pUY4g5U22WroiiIdwvmj/V6VitUAEdgrXmNDcwosMChJtCrg
	 5cyDDyrwU4SWrCSYCcTWC1YURohzt0cOE2oAfHj0lp0DfwZhrWFld6SBcwuYblhLFQmcC
	 7R4rmhVy67pKAk/d9D8SpLihucMQxJ7TgGqT08X8aCo5clo7ftQc3MX7nDprZiLo4Nhg9
	 7i568pbAsIn5Y1uihpvcy4BDi2WrK8/ziP0Yz6Dwdl39exQuviQ2rWMPgzepEy1a2p7Gh
	 wVQqw0LYUdxIRjxmuHJe3MhX9QLqkyL1dKCsAG3qCIqPfL1gjrKVhsGlYXj/5FgoINw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150811;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=owc1kl59fRsLMXs8CdiyeFMD40mCiUsX7mDx+bmxT2Q=;
	b=bVmVE/Pcy+RKVU26Xue8sqXNLAzVZt7nWcyDisIMmn9RSHmdGWgQrAjDU2BIdYMPu7iO
	 Db9YIxRS1hlXWgHVWUph+7lejJBMV1u480qSV45Y/nfm8+QwD3GJBlnqtLhy8MbjS5tKi
	 M7B+e/ElHJN3Lei5eLt7FNkmsd8z7WmobdSEfplV/yKW1P46W67dn/VzMkLibWL7uDl5s
	 7qgtJMGxk0X0xoyHkjlEoKORECQ5hRTu9uBSKZHlGdFMX19VgNCeTfB4NMg7io9j/mGA+
	 W86aJQ8FTcmplPh/aX1/qGujM3DE3UCu2d9eYfB5PExuLlk7iCSl6AprqcLBs9YsZCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hJxHrG6g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3E8606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 15:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hJxHrG6g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FEFD1F0089F;
	Sun,  8 Nov 2026 15:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794150810;
	bh=owc1kl59fRsLMXs8CdiyeFMD40mCiUsX7mDx+bmxT2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hJxHrG6gadAASHWzhhRcQeMizkCVbNhu5QrVm4z14XBwmyQynyqWhmIVsTb0wAywq
	 HrFsM8sUPdqYnWxzVgpf0wPz49ARaij5lTw+DA7gysNX5ylQFWL/LHZeuRKtXsk4aq
	 QEqvllsGcb6Abs/c+dW0an0l5vlnrg0OKtkx/yJ+3U1R/WOK7y4054CEJ3VCdefpxb
	 Ogv7wuVs6zW0q9iHRgFgJmrX1kMhbW4afN0vcYJmuQvO22twaKeASMJ4LbBexzaZCu
	 ENKVO6ek84aW4Tu3vpFneDHQYet0eyjy4L+/wth+2vtevjdCtKa1+t6ZD+Y7tSk+zD
	 7s5/YUdaiLbPA==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 94E612CCC9AC; Sun, 08 Nov 2026 15:13:27 +0000 (GMT)
Date: Sun, 8 Nov 2026 15:13:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/2] regulator: pwm-regulator: Revert "Add validity
 checks in continuous .get_voltage"
Message-ID: <6c74f007-5a18-4a4c-90b8-df2f3cc3b36a@sirena.org.uk>
References: <20261106130010.340950-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.6954786b-65e0-4206-a0c4-60cd251dbec9@emailsignatures365.codetwo.com>
 <20261106130010.340950-2-mike.looijmans@topic.nl>
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
	protocol="application/pgp-signature"; boundary="akU8xEcfF4xSW4+N"
Content-Disposition: inline
In-Reply-To: <20261106130010.340950-2-mike.looijmans@topic.nl>
X-Cookie: Whoever dies with the most toys wins.


--akU8xEcfF4xSW4+N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 06, 2026 at 01:59:56PM +0100, Mike Looijmans wrote:
> This reverts commit c92688cac239 ("regulator: pwm-regulator: Add validity
> checks in continuous .get_voltage").

> The core, and in particular the machine_constraints_voltage() method,
> expects the regulator to report what the current setting is, even if that
> is outside the allowed range. The core will then bring the voltage into
> that range. It cannot do that if the regulator refuses to return its
> setting, and causes probe() to fail for a pwm-regulator when it has
> restrictions to the PWM range with messages like:
>   dsp7-pwm: failed to get the current voltage: -ENOTRECOVERABLE
>   pwm-regulator dsp7-supply-pwm: error -ENOTRECOVERABLE: Failed to register
>     regulator pwm-regulator
>   pwm-regulator dsp7-supply-pwm: probe with driver pwm-regulator failed
>     with error -131

Are you sure?  We have specific handling for -ENOTRECOVERABLE which just
blindly writes in the range specified in the constraints if the current
voltage is unreadable.  If that mechanism isn't working we should fix it
rather than changing drivers.

> Besides that, regulator_get_voltage() is not supposed to return any
> state information, as is mentioned in the API documentation.

>  	voltage = pwm_get_relative_duty_cycle(&pstate, duty_unit);
> -	if (voltage < min(max_uV_duty, min_uV_duty) ||
> -	    voltage > max(max_uV_duty, min_uV_duty))
> -		return -ENOTRECOVERABLE;

The rest of the function relies on this to avoid having to deal with
wrapping when things are out of range.

--akU8xEcfF4xSW4+N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavCRlwAKCRAv73Ows9A4
iTV7APsGnN6GpTtoYfXfdOjpfCdgSlqZ904y7whHTmat6xC2aAEA1cwEHj+OhvyG
JlJxJjHbULaFfSXPFoMxARI8Sx174wA=
=za1F
-----END PGP SIGNATURE-----

--akU8xEcfF4xSW4+N--
