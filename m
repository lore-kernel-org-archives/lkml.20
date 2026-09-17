Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B633FBEBB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789624405; cv=none; b=Xo+Sp3K4qvzf0dG7Bh7SH/QXXJJJA7VOHGsmrjOba9biVe9bpQa5Vdxw6K39ihtuIHQjCZS+56TH2wVSLbgQvq/dlQpaI7p3h24r3UEmv42LO4jtQSwsKRlwVlTYWhoAq2VZhDfDyX4Q2soWf43l6oVOLiX5VkZiaoJIkRA3eEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789624405; c=relaxed/simple;
	bh=eu9VvAWL8c0CVMyrD/Xjn/6IGx8pRK+MMjh1QQNDFvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HEvPmv4mXJJx32MXY14hJ7fQnsxsgXXHGUT+2xpW8Tx7jZFo5BpuYoysz2BAhNffDz6MklVjPknaXzZ8e4UebFGanKyV0cgTPvwzULEF2+iJRFNqurJy6gbiRO2FrOP6ncU0fty2HQrDQFOe7NcU4E9GBgF+cKn3wHdNvkXGFWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lS/0ijBu; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="lS/0ijBu"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so2435465e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789624400; x=1790229200; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v7VMBV2ocTSSZ91doHV+9Jk99FMhih4t2wlbITjifDc=;
        b=lS/0ijBumKYdvLM5hVLHu5hjZn6x4b36JUmPGyL1pFQ+vmiikFRfz8kC0834R3nS61
         w38J/R7Q0XXkxxkaXFs5W0P5NyuAoOM8UGAqGx7Gy0CpgjpiBzXEnjphD9dK58PvkpsV
         Z4k38sVF4S81aEfH0u97LKjyVIh+6+AXM6TQo0twhIfgjw01A/JyFF4OdFWEjAo9wLGA
         GHecBgxdhLjmsHvqd7/tpZE6sQKVjVULVsnwJhqHKAcili8fXZiNj3HrHg/Mn+oU/v/o
         yYQhNqa/2oJH1cAgXGotDfTtqROr7kEZ1/k39AmXnpfrFCnM1Ain9dVjTFNnvTM6JLeU
         aR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789624400; x=1790229200;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7VMBV2ocTSSZ91doHV+9Jk99FMhih4t2wlbITjifDc=;
        b=QLjctRtHnTYMlkjGWjyxvTzjfRpieiHku3fkULM+UAxJQe4d57X2GlPSCot6Ui6twW
         99XC9+nC57MMkFv9Lax63Dkbrggi3Qmlx9Em1DjaHGSfTHWq/HE37ldQG930U/p4ahy1
         EspM6DX48VX8R49x3kJGb6yhlZkHOKT7dYKYRrSLyVAwVrdGs9EropHCCQjhc9jHRbNr
         nzk61JmXKNikQpzADo0W+bK0v24m+Xsgme15uNMWIdRTjvCcDuMaS2748hH+wdzvDgpN
         0yiYgfh093o70VhBpymn9q3xo+2Eecoo+kX67VN/jtEFRHcw/ZqLLt4Lykd2tnp5TT99
         cBEA==
X-Forwarded-Encrypted: i=1; AKwUvByXm3w9ITLKqS4QNRqMohqqlEH4iAJcUg/8bKgnoJumDyDr8f6enJ2XKqSZcM2mVAH5n0As/3msHfHg66Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kJoiP0geHgPyEh9UKVmigdq7KHNL1Y96T8r6qpa05KTebVheTr
	1dqTkNtNre0xg3Lg8K1LyyB/1Zonolat8Zt10N9Tt/Q43o1qsr7ifKu9wBtfmoSq2iI=
X-Gm-Gg: AYBFou1LjUf2eOeffIABmEB+DUHgyhYtLvQLkL08YVWmyYMsd+nWfNwRvafMm/wUGL2
	jxT0lIZMaRh3oxhl88IcrXVKtLQRIy0b6ZTC9c0thpBFQiuz8XhkMsZ3w5Cyy04/7yvNI9eoi5P
	fX7BeO0LLcAnwyaQQgswbj9FKTNbimE7KS8lFS9Y19irQY9Zhh6yW+Z12LASahlNIHk/5hY2x91
	4hHw3vfHnXyIJY5sEVfUvhiTP1wO8sBkOeB9WLP7vQbHliPcasgZiTR2WxqxOh2Pj8ODt7qehM/
	nG3hrgCGL/fzHgxFesBGuCjMavC4DSdZrM/BFIEl7BDhnsufiHH+Hh+zH7e/z9eXfKM1hf4thil
	xinvtUrTuPk3M1t+rm3jGSok0UXZCCpYoMI/ye/4uOog1VPGs2L5/VpegC3mOLToES4WN8W2fZ7
	OnGXMgO13HhNN/UHOtwrzYy9XSerfVhY1wbYaLOZ8PMvGyX68Q9FiXX1bchbjsBu19NLW4DvUAG
	rM5lblJgAg3big=
X-Received: by 2002:a05:600c:3b0c:b0:49f:bc28:e8b1 with SMTP id 5b1f17b1804b1-49fbc28e978mr74636685e9.14.1789624399375;
        Wed, 16 Sep 2026 22:53:19 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fbf515cfdsm29444615e9.11.2026.09.16.22.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:53:18 -0700 (PDT)
Date: Thu, 17 Sep 2026 07:53:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Li Jun <lijun01@kylinos.cn>, Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tpm: remove extraneous #ifdef
Message-ID: <aquADl_vIvmCcFpP@monoceros>
References: <20260915201305.3529682-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ssrlnq7k6thlujsw"
Content-Disposition: inline
In-Reply-To: <20260915201305.3529682-1-arnd@kernel.org>


--ssrlnq7k6thlujsw
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] tpm: remove extraneous #ifdef
MIME-Version: 1.0

On Tue, Sep 15, 2026 at 10:12:58PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Changing to DEFINE_SIMPLE_DEV_PM_OPS() broke here because the
> tpm_inf_resume() function is hidden in an #ifdef:
>=20
> drivers/char/tpm/tpm_infineon.c:615:61: error: 'tpm_inf_resume' undeclare=
d here (not in a function); did you mean 'tpm_pm_resume'?
>   615 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_inf_pm, tpm_pm_suspend, tpm_i=
nf_resume);
>       |                                                             ^~~~~=
~~~~~~~~~
>=20
> Remove the #ifdef check.
>=20
> Fixes: 2249200ee420 ("tpm: use DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr(=
)")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I hit the same issue during my build tests. Thanks for your patch.

Tested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--ssrlnq7k6thlujsw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqrgEcACgkQj4D7WH0S
/k56EAf/SC8iK7FtbpqIrX5WeL5TWPiBRaRsqDhqp2bCUyrpyo05byDWyEHWbVSE
jNE9waEYf2/y/6JTZEOh7k4+9eFrgbd4TlPvakH4MBCORynmWMxNkXknv9IwHeQ3
CuC4/qqtxWPGQvwq1IEOSVdniz1SKjoZcVz0gt5qHeT5q7OmbeQSxLzYfqax35iz
9hkCFqg9AxRUvZDLCxrPSIlZNZyy673mWFmIrah7cMoaTvrRUvsGaFpQFmiAA5ID
nzafNZVdfW8c7l8S1aadYhfaqhcPjXvlpz1NtMvJYKlyHa3yW1uTCEDgngH9c6in
GAZPFUtt8tplOLUVnIQ1tr+58xRl4w==
=o/nl
-----END PGP SIGNATURE-----

--ssrlnq7k6thlujsw--
