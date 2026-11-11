Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418431;
	b=sTUldPJdqk5CkUmojNNmNafDysaK1F3IgwByC686Ooz90SlxGZjknVgF36E+Y3wP40G+
	 bdQ2jwCoYBqA5Sf+LUcn6ZDKpHA2EY96o4gmpGmuWH+5seS5kY63HqkutvwRP/8tPVYd4
	 kA9no9ec5A7qtyShk+LgLvAllLpISHDI5npeBTIrH6XTtq9bB4q2hGSSkQyQ4VVMEHGEU
	 PTBdJ78J4yONR0CbSoPJkukQ6Efi0luiwpFnQcwRYUjrvhNIfZU16l5DQmtD3PB9KcNkM
	 jscl/VyBn+H4+HY36MY2KTYQSjN7E9taStC8kJRayPcIybpN8BramW35zAu7gnxQNUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YvexIMYqiMiz1q4JNqaiQjkR3iTnjNBJbrIGwBNzjEU=;
	b=C8aQeQfRhnfsb/rFp8you2ATSehz2b95kcf0PEorpuC1IsSYj+6QjhFV3ETDyqwOWUH/
	 K7gpiFitLrwJm9K4kYWmNiaYNJ0MkyJQEoa9YVz4n1vNzsiiq8kkb5N6Pb5mn9kcvhBdl
	 K8t7aoeK2F2oK+1yC2/Q2cYanmhvzX8cNqZfS1gIv42AWXbHcjtsOp7sJ2Jw5+I3OQ3u3
	 5/xS+qWS3vo9fJTy4L53F1hMJwXMVHqPpa/AmfbSKUW2uFWAgZyH6z2r1XDTLW0VfewS/
	 XvlOcVd3eilz84E9Vjd9+BMONOmu4+FnnylYru9y1CuMGpa2uIM8ItujPRQ6er6aT/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=inicpcHI;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F36606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41F36606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=inicpcHI
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso29875535e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794418429; x=1795023229; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YvexIMYqiMiz1q4JNqaiQjkR3iTnjNBJbrIGwBNzjEU=;
        b=inicpcHIZnCmcEzzbQ3MmS+YvAq5Scx+eJ9EP0DS5vSfJefOX+7im3R61WEtmbEGl+
         dQYNLm4/6io+doNd9QANIQ6WylX4hduah5G4JDStbFnEWoV7P84iUQF85tuo0xJNCzNw
         aN3V9JTnWA60LAX3s+/huqc4XN5Ns1yt4BpdYMf8A0yraHLiQTVM47EhyXSISbGtnFBD
         yHlXYVmCDGP3L3un4HqqS8xbEzkjU/Iq6t3mMA2sgks6KILzghfpJ9AblOFId4RbNlm9
         uAlIC0j7fn+700Zw+nQvMXzWSW9GLuHq2IuV6bR8sm70AUw5ZcaB+j09j1imryd9SPzk
         gPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418429; x=1795023229;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YvexIMYqiMiz1q4JNqaiQjkR3iTnjNBJbrIGwBNzjEU=;
        b=uLk8ocb4Jl7A3XCmloYm6kMiXtFJ1UE6kUkNWHqwppz1IxpLhLjPSiFxchk/zZ1AKU
         PlW0c/v5tMXTYcbST/18vqf6Mz0ql11lBsxDgjKqTxOl0dwtacLH6C5eBQWSKkkFoWAE
         TlhBCPEopORqAqmal5wPqLG63F+hutEUEOtmttjCrdpSCTn20XdXcZYbAzF6yKhYyWJJ
         bgumHD2p1zCqt3BtSORtac/Bn+bppWlgOY6meMlz+6iwjeqhE+p+7fZbje8oCQt37+Dq
         Rk9ZW6xMRR6VyY1CTdX7FrK1t5xHRTp87gpb12Y9nKjggdHKCX1/BlSuGeoHEiyF/8yx
         FVJA==
X-Forwarded-Encrypted: i=1; AL+hErHbjy17sNOO6YyvJePIcSraCOUOi6slQ8VPD/05JsJm3u8S37R32EG+rSygixJPGNqw7QoWy0pF+K0lMNQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9v8yTSITVz7NauHgBLi+TwrHRw0MqRt9WED6C8yxG9TyMKOtxd
	hHFWQDXWg8h87fUZIuoXCfPuiKxlzSp6kuTQUPG55C+4Biu/jdX8z8YDbWfPwK3Gq/w=
X-Gm-Gg: AYBFou1/vI8J+4JahAiI4XJ8lK+2Ui+3D1swGJ0dowcQ+HqWi+GyqQD9hp1qXPs0pe1
	0RWdeFMjtZ6Dr5nw90T8hvX+52LwYVOZCKXAgv2f2Z1plJEiUd/6/DGFxfkPG13hBccYa0qHsvN
	mEh7UBA2/6ATAdf9aNY68pNqf9Kfr1prCQnyr48OjhY5G2oHNhjKwdo8p0peaTGGkSw4zJhDdDK
	Dp6YF1XDabUSXgCELIPUTtk0i/I5iKIxqzrR+0ByfAi8QhFJPEmUUINFTxiPtyWE8n8uI+oAl4p
	Pb+eecuE3cZMKulkySzpFslvzxXcklwcJY7HDEV+X/QfFbWh9T5oOGyr1T7HzUTW3ADvaT7Aj9V
	uZQOXOyJKkozUezzazMLUZnrWerXAQ5XS1/bVTX9NXmTNuyrHp208ewe5gTK2MWW8hhYaz4Mllh
	+qD6LJ249d8GClMHf4+usO90r2nLWHDiChiUE/DAe/RTnu4YllFVZS8QL6WEvyYYhR1g7d49I6U
	nKn00wYud2GMMr5Q4s9iOMwBGUDklwUMTOwKw/AtDcYMEbdVSJEqq31IMnyHb4ngk5SiwDfdx3C
	lDIFkRNQj3t+2GWR4QshxSHqiGrktse1zIgcjIG6cLCqm4ZFLrzTF64P9m1r8lJhZQUOeBlD7Vi
	G3eK9u/tgPyeL43eR5olLY6+5OeXqPZbjih9ucg==
X-Received: by 2002:a05:600c:81c5:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4ba09376cc2mr50842555e9.18.1794418428621;
        Wed, 11 Nov 2026 09:33:48 -0800 (PST)
Received: from localhost (p200300f65f19a9045674a4e2f3db58c3.dip0.t-ipconnect.de. [2003:f6:5f19:a904:5674:a4e2:f3db:58c3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba0951bf2asm51567095e9.4.2026.11.11.09.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:33:47 -0800 (PST)
Date: Wed, 11 Nov 2026 18:33:46 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
	linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net] can: flexcan: Fix probing for m68k/coldfire
Message-ID: <avSmq-LRKgRWDfxH@monoceros>
References: <20260618140147.142489-2-u.kleine-koenig@baylibre.com>
 <akfoYuyHMAxIfalD@monoceros>
 <al4lxVud4_6NTZQG@monoceros>
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
	protocol="application/pgp-signature"; boundary="4hfc67dntoyzrou5"
Content-Disposition: inline
In-Reply-To: <al4lxVud4_6NTZQG@monoceros>


--4hfc67dntoyzrou5
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net] can: flexcan: Fix probing for m68k/coldfire
MIME-Version: 1.0

Hello,

On Mon, Jul 20, 2026 at 03:43:09PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> On Fri, Jul 03, 2026 at 06:53:16PM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > On Thu, Jun 18, 2026 at 04:01:47PM +0200, Uwe Kleine-K=F6nig (The Capab=
le Hub) wrote:
> > > When determining the device details was reworked in commit 5e6c3454b4=
05
> > > ("net: can: Use device_get_match_data()") there was no replacement for
> > > the previous handling of non-of instantiated devices via the device's
> > > id_entry which then results in a NULL pointer exception. The only
> > > in-tree provider of such a device is arch/m68k/coldfire/device.c.
> > >=20
> > > Given the id_table only contains a single entry just hardcode the res=
ult
> > > of `platform_get_device_id(pdev)->driver_data` and drop the unused
> > > assignment to .driver_data from the table.
> > >=20
> > > While touching the id table, drop the unusual comma after the termina=
tor
> > > entry.
> > >=20
> > > Fixes: 5e6c3454b405 ("net: can: Use device_get_match_data()")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@=
baylibre.com>
> >=20
> > Given this fixes a crash (NULL pointer exception), it would be great to
> > get this applied. The issue is already old (Sept 2023, v6.8-rc1), so
> > there is probably no urge to get this in before 7.2, but getting it into
> > next and then 7.3-rc1 would be good.
>=20
> This still stands. Marc, do you have this patch still on your radar?

For a fix it takes quite some time to get applied. The patch now missed
7.4-rc1 ...

Is someone reading this ping?

Best regards
Uwe

--4hfc67dntoyzrou5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr0pvYACgkQj4D7WH0S
/k4bNwgAsQchSshsvcSs/c8msQEUeFLmy38NQ5NvYG9rkvtJ5DGZBJZCWbiMnvQN
UxxEUyz189PGDh41YHwkGDS1NMvdFvrl9uptRZGvbI/iB6fJP38y+ves8Dp1BBUQ
CiGoYQ2oqm2R2WnYwsUzdVL3E9R7zMvkueC0YW5h6BerQroVMVDLtclvQ8iXMMou
Ko+Dpwg76ba2xYTAHwNhyrNxQraVOp+o6+IlCIcKCK8hCwV7AFS6VU9zwEgLsUms
X3yeTFHRNc3aZGjulbY35I7d0ujF5iRrEFLzI8MIUcCUiIXqCkFSGGV9450s+uz9
RcNFp/Rrj1+U4tKfnch8QGtgmLvSRw==
=5KoS
-----END PGP SIGNATURE-----

--4hfc67dntoyzrou5--
