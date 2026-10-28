Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199059;
	b=OEJA17bCHurl5GpsxYeyHwiSySWf9plSHZBYb1Gr6Nt5p0KGh2LF7duVYyHNPzTMwcG5
	 NjkkKoz1s4vIfNy9Zvcfwf8ekEucoSAVZoD7CPsonbH6df6eyCA7ncU3D8B3jN35wMdby
	 0nlbSPUbCHbOtkV5ytXKvmEUce0VYaxBYpg7/6YeyMKy31JloKhKUHCsA1/Dc0cCqYQQQ
	 o12PR1hCx3O4AJA/WO+Lkgz1gZJ4hlwfBaq3XfPB0CWiRQSjg4I4jgQeG49xj0xt5oyE2
	 xLg15lZlKbp4Fjl0E+wgY+sFyzZDWfK4DUeeGWMaRye9hgqI9ioCpasVHndbqL0kdMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8g9t7ALU7n+7VW9gQDZGowaF3x6SIEajb/2Mc6wiGZg=;
	b=GhEHhCLLgr4AlmcVoqJaa1M91ZdJSfIcOKOnQkpYy8hShhj1FgZANOpirK1VAvu5SeAP
	 S79M88ar5r5xs/9/QpDNNqyJBANvA6gZI9rf4w+PMohZxWMwrDoJ034LQPUZDvJCRpC0b
	 G6+EV+Gj6gTO9c19IcLIHMQqH+PRuu71PwUAUeAECYV7UuO29JsS85C6JgseykNQayEG9
	 zsnKs27uAjgXT3XiE8rUVs5n7xdPb/jVqg/MkTeTkfCt/70/cJkESxcskxcJ6Vm4VzafL
	 a5f7yU35xJ4nr2ruIodrcjl0WJdcDDWlLdVpCjjZ45dRs8UIcwmSrlrx7FpwHIlhg4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175E7606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 175E7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso9685155e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793199047; x=1793803847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8g9t7ALU7n+7VW9gQDZGowaF3x6SIEajb/2Mc6wiGZg=;
        b=ZHI+PnMYUO4N11z48C45pvIZIJWpMQLYtqa/tXxi4VJPtckafE2C8vZsmMqf8WSay0
         WkP8vzXw7KUTk+v36CyGXajDZqG5by6+RXck/9D3EACNfx4yeyKYYQCGbZWVuUnG8rUY
         5qLQe1LGWxfOMYFobc3VGIHrV+AV15yetvd7tYKfqNhVaNLNUnVgOeygrUQUPRbwHDiW
         lcID/IWXFCzR53WbNv/a/lMfGMt8NtxMv4qhxOQ+gXhSRnRitG8FLFKqq0+vRsgTDT10
         G8Oqf0Udam7YRK2gHQ+5l/UpMXkarOzmpwiZriOVr29JvpcbNa84+vP5mTUlSdzwCT8R
         2qnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199047; x=1793803847;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8g9t7ALU7n+7VW9gQDZGowaF3x6SIEajb/2Mc6wiGZg=;
        b=UXyQG5tUlmLf/Yk+oVdbcUKgpkw9OG3tbT97QYJYFSnYdGzyR+DGO5K2dcoJgg86Ef
         Ue5GQF+sm5htMykY+B+LVDyMN5Vzb/26W8oPWH8TYoY5sEbP4uNYsiuIvYUcBobisJ/z
         bokWiapVYqLzjnd72FbDB1SKOk2duJSLIzYy5Fky0QzWsNRjOI2EuCbVIVRqTUIxICDS
         j26YyU+TTPGHTYAh7xpgarUtvpBP4JEcJxkxhZlyBZfNFLnBkenLNlghy+ctfe2DmOeE
         4pYM9iCWXEv5QcebF9LslX52/vpRkpV6lhJF3C8BuTYYmltsjr1gLCO2G8deHu/GzlhH
         IdQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaHZTZq3G6wfEQf/2djxtJZtapD8LsQhHWfGr3nLlCMDWD5xT4hNqo1tiDX4yeShn2PIk1pKNgQWj0pVU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2oYfmRElWtLVd3hHgx8v4oQek+RdUZKPTW8yfctVaYwHcx04y
	ZNmg4AUzOFNf0GMevE0v5RDkvNwUQKWI/v6NCCFThNn6b4sg7uL8Pcfilnnqg2bZ+Hc=
X-Gm-Gg: AYBFou14EVh9Ogj6K7FbiEEW+awknrfHGu1oRAwTt1HjUxpVR54sn+SPIsUwQLMBl6H
	XyV8wqVCwRqUeZvVWxEfmfb2WRTllIaO/C5z3gHwN08V0utOdAwyZMuchoUCgPjCVB2JZhXUe7t
	EljcIKwKrRPoczCVh9uPSBZpqXTDkX6bhOAkbY4iOFPe1VtYI8CrOjiKOp6gnBKj5hf+YdjxHco
	wvvDZgIRfXuhDMYoRG0ddLKbesjnZxHnLkIvgcr8ojudIKVn7qzbSmT5Uu03m8I2idWERxNUJv3
	bDYop75h4pfxa3BxUR/Y1R3IiP91Jma9CHjvH8f98fWRwNuMucsktJwRJMnqijbzmvcN2bdMTvn
	fgI9YvtyE+8e7sRdpbAI7fepXja1KzAP84jUzy2TiI/fYNTHJzgP6GEk3Oeq5zh8+IkEBaR6157
	Q4mgirt3Zv9fDqrlp7fpesC/dMQd7eLo8Azyv/zM+Lr5Hxey9BoYcORAoRJWBKYjkLprtpvVN/L
	O1hT7xQTFR733GQY6IsMxAw6nQdCHideti/rxAtaS2umk8Ur4JFiboOmNvI1b/1PGxFOiUnO3ph
	QAy0JGQXsiTL/PCZQlcNLQuN/9KL/fGkZxw=
X-Received: by 2002:a05:600c:3510:b0:4a4:7a8d:c436 with SMTP id 5b1f17b1804b1-4a96667dd75mr52332595e9.11.1793199047357;
        Wed, 28 Oct 2026 07:50:47 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a97cebf858sm57250745e9.12.2026.10.28.07.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:50:46 -0700 (PDT)
Date: Wed, 28 Oct 2026 15:50:44 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Alex Williamson <alex@shazbot.org>, 
	Armin Wolf <W_Armin@gmx.de>, David Lechner <dlechner@baylibre.com>, 
	Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Bradley Morgan <brads@mainlining.org>, 
	Aleksandr Nogikh <nogikh@google.com>, linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-trace-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Thierry Reding <thierry.reding@kernel.org>
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <auILBqh9Ccv7ztid@monoceros>
References: <defb3953-7516-437e-b70b-d57de55b91bf@baylibre.com>
 <9bd3a34b-5e98-4038-80d6-da2c3b1948dd@gmx.de>
 <2026092321-province-yearly-44aa@gregkh>
 <arOfHEsGGglNse7T@monoceros>
 <2026092348-victory-erased-0e5a@gregkh>
 <20261023181326.0dc2f7ed@shazbot.org>
 <2026102437-vista-unsoiled-b089@gregkh>
 <at34UOuYv3NtX36R@monoceros>
 <20261026225950.GD1685504@ziepe.ca>
 <2026102849-turkey-series-ac07@gregkh>
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
	protocol="application/pgp-signature"; boundary="dvdgfsb6jpiy7bdt"
Content-Disposition: inline
In-Reply-To: <2026102849-turkey-series-ac07@gregkh>


--dvdgfsb6jpiy7bdt
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
MIME-Version: 1.0

On Wed, Oct 28, 2026 at 02:45:18PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Oct 26, 2026 at 07:59:50PM -0300, Jason Gunthorpe wrote:
> > On Sun, Oct 25, 2026 at 01:48:04PM +0100, Uwe Kleine-K=F6nig wrote:
> >=20
> > > The more I think about this taint, the more I believe the commit shou=
ld
> > > be reverted and replaced by a some stop gaps for driver_override. (Be=
 it
> > > a taint or better yet
> > > https://lore.kernel.org/all/0f7446324f6a0c8f0153d6532d92a6eeecd6a308.=
1790612298.git.u.kleine-koenig@baylibre.com/
> > > .)
> >=20
> > I also think this patch is way too broad and should be reverted until
> > something better is designed.
>=20
> Fair enough, I've sent a revert for now, will get it merged before -rc1
> is out.

\o/, thanks

> I'll rework this for a later release, thanks.

Please look at the series behind the link above before investing time
here. I think most of the ideas are already implemented there. If you
voice your preferences there, I can rework accordingly and rebase on top
of your revert.

Best regards
Uwe

--dvdgfsb6jpiy7bdt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmriC7gACgkQj4D7WH0S
/k7RWwf/cwXDsUHX0jhgjipjJFi1+cjW14UhDdlEnrd0BnzhDhCcWYdtX4Jokju7
CvB5Oiyfrbzutn6NGqwDb2r6lwabIE+FUkSwqOYBh0v9DeYZc09PyetAJUrJc1P+
ykWQcL5z1tPk5gkQDnk/OMUtvZXVwgH9T+CJaYjJ1zX5KQEqpM1iA0orv6blUtcV
QoHhDAdbFR9S/jZ/4rdCfk08awpvM3VqeV4VW0n2VR/QwFLZ7NS45TRo8EZdRHiI
enU/kyx10Vep14yRZmuVr3Xw5rdSN+ylwbNFFKzSLcL/Vz00iyhlIOgvlsS2wy69
vU6dhHVeUJVTb8Y8hxbTBePHR0MSsQ==
=kVFg
-----END PGP SIGNATURE-----

--dvdgfsb6jpiy7bdt--
