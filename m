Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E37F48BD51
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585457; cv=none; b=P+jZb6f478xQAIkxPgCmSYZKAhKn/Q84S9OVdOYIsQsStNnFtjF2TZusMs3WlegtxC20CYKEc1DHqF7OreOZC7w5aAt3adjRoAja5jEeLI5/fKZi1av5E4gtDh5mfOZN+LyvlSmvZ8jPDdOvfOa2DQDwvrMnmgiV/L9506NukIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585457; c=relaxed/simple;
	bh=ksMx5jUd01eto0BA4SnkhzEOtLlkbUgiTZg+BUNu+Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IEw2SxueGpoS+jy2ytw6OpIRr9D9PAFaGOSkv80b2GjdOj/3Jz4jD0Vt+eX7bxkaNwdCLzkOe+ZYXb/dzof1unbZcR3J5M6xszXrYAH+bkyfgo994ovX0cYkxQH24B18pcnWqsoYVoTnJf2jQRi2NcyvuLewefl92qfjclwZ0r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FGv9l0YP; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FGv9l0YP"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so16701495e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790585452; x=1791190252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pNftRw2tWysHYpxWpyBTAFrax0w98I7jfRta/SXIr50=;
        b=FGv9l0YPV6swPbT+QAEDl7I3K1FQK6/wYasCUr4UQkISPjzdDIKjMNXxsPVsuQVhuj
         djZr8xBzAkrbCd+23MruqKpz2ecP3j1SoYXoryYQd4NpAVYfI7jox5wii8XUSo+S4tvn
         IP5sjOjr3nMRtrobRP0X0l4pQCXrFcmy88/T2gBwioVVrcAyOQsR2xOxIerwf/quV/bJ
         1SUA96wgg6wf7ReYcfQcwQ9F8RywgZmOscylHoLC7jsxLuTEg8YV5H9MVHffKlwqbtpL
         cyoELp81v+v1putb/EB1cStM464D69WnxcW3fvaDgMfnrHiAoL5BakMGjXNc17do6M92
         Uwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790585452; x=1791190252;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pNftRw2tWysHYpxWpyBTAFrax0w98I7jfRta/SXIr50=;
        b=u/ksFdHvRNF0lDkVZZ7eqHB73CwfGF2YIg/S/sYjVcowhnphmcFzCddlcIMgkOBByy
         rsTPS20bKu3JC0Q4db5s7MwOpCq6Em1OhQ8Xmw/NQwxap+2DCYbSpwCY3S5nn3ksi9Gz
         oC6fK3ZIL94ADd7GRRqV7BXCb0L12UcrlXNeeri/f9mTfs5NIwb9avbih+y3QvNvAwpE
         cxvFB/k1mA9jvUfaWVEHsTuzrTQHHWUpZAgKkxgh0RFbst5wjzRwvAVlMN7WhmJTaUSE
         PdIPznDno7IppQEUHpN2OuvUN6z978kHIeDSUjjWEdKR5TM/TLw0yyyvU1er76szI1I2
         3RTw==
X-Forwarded-Encrypted: i=1; AKwUvBxbTTuhCg71FgqBv6fWM96O1gEVUwmcfUg0BG1B/fZ6tUfXHSHvmIdwitkuVYHXhoqLsVJul3CArb21HZk=@vger.kernel.org
X-Gm-Message-State: AFuF++lz/V3LzB97CF+vcZe1hYP2Azb2oeygarB8dTXi1NbLMaNGhorm
	ECoRVsL7vXZJPNYr6e49gpIUuedP198TJwTV7B83vHGPc7MxAWahh3ncFDjLPxZldD0=
X-Gm-Gg: AYBFou0aYpULfOS+szeuc+Lz7FjcNwv4ghvCyhPjknLMYpGaGSOuTORRQGKAKZLawfM
	fbaLMilKBF6iCLYvDvG77pZTupXgUbsCY1vBLje5qzRuU9uEAZt4I69S8fpg8pCXgdEEjmQMYxu
	vHOAmGCDYh8tK5qsOuW6ZUddnJko6cZz91M8c4rUxFbbcix6ZVL4GKRP1YFu7lkR6Dg+2nzoG8B
	du3XDuSsxms1+zSXTXJAHTpo8PGDA9MXdPVzJcRPrh7sJOAcpC8uSA883kdNxfzSnvsMiny86Jt
	a1aVm5jJP9KC+h3bOntKkH+iD9oG3Iyin1lecS9jg6bTR6Umdy9aNCDe4aWWbRZ36gWlANDzrBi
	S3KemnPUNlvbvKpADWZlT/TuXI5QuXQrI7QivV5Wijkj23bV00EXVBygXxjbZ2MYSjiV1psEQFa
	0aBP0TkI/mIeOA2bmxEKcDDmaWz4QUSNZCjIDyaX4s0ARaBHxslqb74cJdD8wrf53Tqud5lQUdG
	OiAbEOGRfEw91PAJu4lCAhUVS2M9eSKV9rxzMR4nZ9ERJ//AnGP78OxOuDUJOo=
X-Received: by 2002:a05:600c:6085:b0:49c:eb04:1c49 with SMTP id 5b1f17b1804b1-49fe66cccd4mr219278595e9.13.1790585452000;
        Mon, 28 Sep 2026 01:50:52 -0700 (PDT)
Received: from localhost (p200300f65f19a904b8075b4cf431dac8.dip0.t-ipconnect.de. [2003:f6:5f19:a904:b807:5b4c:f431:dac8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a001778312sm295599625e9.8.2026.09.28.01.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:50:51 -0700 (PDT)
Date: Mon, 28 Sep 2026 10:50:50 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Johan Hovold <johan@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>, 
	Bradley Morgan <brads@mainlining.org>, Thierry Reding <thierry.reding@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Armin Wolf <W_Armin@gmx.de>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] Add TAINT_DRIVER_OVERRIDE for usage of
 driver_override
Message-ID: <aromsiCXLfGRRTFC@monoceros>
References: <cover.1790495516.git.u.kleine-koenig@baylibre.com>
 <01d7a085e56b860e83b65c96ff3dd86c4498804b.1790495516.git.u.kleine-koenig@baylibre.com>
 <DLQ0BIYP96RN.Z0L5I17RQMRQ@kernel.org>
 <DLQ0HUM8AV99.3DNY5MRA2AZSO@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="akr7ood6yiztdqxp"
Content-Disposition: inline
In-Reply-To: <DLQ0HUM8AV99.3DNY5MRA2AZSO@kernel.org>


--akr7ood6yiztdqxp
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] Add TAINT_DRIVER_OVERRIDE for usage of
 driver_override
MIME-Version: 1.0

On Sun, Sep 27, 2026 at 12:03:54PM +0200, Danilo Krummrich wrote:
> On Sun Sep 27, 2026 at 11:55 AM CEST, Danilo Krummrich wrote:
> > On Sun Sep 27, 2026 at 10:03 AM CEST, Uwe Kleine-K=F6nig wrote:
> >> Commit fcbfaffee51a ("driver core: add TAINT_FORCED_BIND for when
> >> userspace manually messes with devices and drivers") introduced a taint
> >> for usage of bind/unbind sysfs files that manually trigger driver probe
> >> and remove respectively.
> >>
> >> For drivers that do their resource management correctly (which is also
> >> needed for module unloading) bind and unbind for matching devices are
> >> not critical operations. The thing that makes bind and unbind unsafe is
> >> that drivers can be forced on devices that originally don't match using
> >> driver_override. The result is that e.g. of_device_get_match_data()
> >> returns NULL despite all .of_match_table entries having a non-NULL
> >> .driver_data member which yields a NULL pointer exception for several
> >> drivers. And given that after setting a driver_override a manual bind =
is
> >> only one way a driver can be bound to an unexpected device, a separate
> >> taint for such an override is justified.
> >>
> >> Reviewed-by: Bradley Morgan <brads@mainlining.org>
> >> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> >> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> >
> > Suggested-by: Danilo Krummrich <dakr@kernel.org>
> > Link: https://lore.kernel.org/driver-core/DLIL9H50MALI.3JROXYEEUM3KU@ke=
rnel.org/

I came up with the idea on my own, but ok, will add that reference.

> >> diff --git a/drivers/base/bus.c b/drivers/base/bus.c
> >> index c51ad96d4de4..7d5dc016a457 100644
> >> --- a/drivers/base/bus.c
> >> +++ b/drivers/base/bus.c
> >> @@ -513,6 +513,7 @@ static ssize_t driver_override_store(struct device=
 *dev,
> >>  {
> >>  	int ret;
> >> =20
> >> +	add_taint_module(NULL, TAINT_DRIVER_OVERRIDE, LOCKDEP_STILL_OK);
> >>  	ret =3D __device_set_driver_override(dev, buf, count);
> >
> > There are buses (such as SPI) which unfortunately have to call
> > __device_set_driver_override() directly.
> >
> > I think it would be better to move the taint into __device_set_driver_o=
verride()
> > and properly document the purpose of __device_set_driver_override().
>=20
> Of course I meant to say to create a new forwarding function for this pur=
pose,
> such that we do not taint for device_set_driver_override().

What is the rationale to exclude device_set_driver_override()?

For the dynamic spi device creation I like it to trigger the taint. For
sound/soc/samsung/i2s.c it looks as if device_set_driver_override() is
just the lazy way to make the created device bind and there is no reason
to stick to normal binding. And why does it call device_attach()?
Shouldn't that trigger automatically after platform_device_add()?
Also in drivers/slimbus/qcom-ngd-ctrl.c the call to
device_set_driver_override() seems redundant.

> Maybe device_store_driver_override() or device_set_driver_override_store(=
)?
>=20
> > It only exists as SPI and AP are a bit special; both print "\n" when
> > driver_override is not set, whereas all other buses (and thus the drive=
r-core)
> > produce "(null)\n" in this case. I.e. it should never get any new users.

I guess it's API and thus hardly changable, but I like "\n" better, and
if it's only because "(null)" might be a driver name and there is no way
to distinguish the situation after

	echo '(null)' > driver_override

=66rom the normal state.

Best regards
Uwe

--akr7ood6yiztdqxp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmq6KmcACgkQj4D7WH0S
/k4tNggAkYtGcQAPyu8XTaClLG0gxNYnKAAmDN9QKId+ihiRZzuPUBAUg2aq5JFd
atIgGOszQ7cAqkGYZwudUgNJSpcRAPViCFkD55CdU+Sos6yQPplGBBnfj8fBcvF5
MH+9+rtZwxxQOxpldtK2QdvIO7Wp4Zb2Hflf19aH/97OjqqUC+7psxDrf8q0Iulx
M6pa+FHu60G4Pecn2C1pTAsoMCB2T+5H/8TFVDgi0IHqT3RgGd5Zde3YdKiQ6eQ/
g4qTol5GLxjr07cyPhaKsCAVaH+QYVNN4aEfskOs2cDSKFyt9eiNgP3Ftc2OgaUs
fEqVVNKz567R3lt3Dj2QXxwWi+aLhQ==
=LCur
-----END PGP SIGNATURE-----

--akr7ood6yiztdqxp--
