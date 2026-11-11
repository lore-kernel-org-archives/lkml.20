Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387889;
	b=A+VOnboaEskQ1YjuFBQHVlhkqy4GSXq4lwoiGZXsQfl9MpqYxIUS4dv61lGE2N2Rm6QB
	 tXvdODfmN/gzVJm0v2BYKClFRLwY8BF0Q80cB3Mf2STd9p1Hq5lq0vXXqyltor2RdvZgp
	 EeCgdnYRfQqBRymZPH/T/7dQ/AhVta6ANvHWNuNFzb6nWgCHtp/ffy73zTXPdCZs3xEG+
	 FhhFVxlmWUUwRiIWXJv0ay2Rih1j72uJib4zsxWGzQZjuce6O4DSZSx+2xesRxDaj2K/j
	 MjnKvLgEeX9qMKur4hKSrKRF46fnX662S9ztBy22QNemNT4yOKt/czUE2gBMVvEPQXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sP7k6XjcVumCLj2NxGQn6KKl25HOAblRp6pXpTH9GPw=;
	b=SzSbLPdcJJUkZcRaJpJSIxs0JzmPUh9rUjMdI3sWTRGpeweXkJHi5U7CGoOtv+dzY5GT
	 aTO1nSOpikHxoZdaX3qyxdXpemmHwLLxIi/wknv5nuIAOQx0EoTHl5IUUhtI3zZ1WdK9N
	 QdPCyB8+nluWiUYWr6jnu0leonZBIYVnAWG5uu2xGIatE6uWbNhjPYDfUOSEiQl5ylAXC
	 javXkUXc215lGDNZwKA54KlPRdqGWmZiZjJTkr/BYh94LM5JFuthVGWPDq95o6jNoFswY
	 6IGgrYGPLok3trfoW+83fe/yXoJySiSDqMVZxp1DuWNvs/iKoM7ARgQoeOlWOoezJbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=apEb4VFb;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BEC606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31BEC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=apEb4VFb
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so34895295e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794387887; x=1794992687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sP7k6XjcVumCLj2NxGQn6KKl25HOAblRp6pXpTH9GPw=;
        b=apEb4VFb/kykf9goG9b0z6IJffaPwx06CrNXuZL7YC/2FpwlO/27X1htpMAFsEDnMq
         pOrF4e1LFdSx+SsDQmEAaoCBxq5J8SVbasSxQxusVPQUmRK1pkf7lYNuO2cp7pw1cAYs
         +h+oLY0F7xg+hMl1Mj4RNDFm4hpB8BwFvl0bpEt8by/bawtrq0HyMrHnrA3w/m2Xfrf0
         vtw0JmaO9hevClVuGqLDfNE9HzJ3zT9gAiPohjPl0WyQiwU4Q3VI59uJispOlBfgJNi5
         on5YfkhyudSJrv0Yl9/yyYfkLzFnmGF4srsCw4fWilP2M2BmSk4YuK7mpujVS4hFtv9d
         nahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387887; x=1794992687;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sP7k6XjcVumCLj2NxGQn6KKl25HOAblRp6pXpTH9GPw=;
        b=U4tIwgMPysiUYzvITutyOGn/8w7N/1QISlWLd+M9CC/3K7IxMy+xRCg9V9fbnD3XwH
         iqeamGDT535SREPLtWh60mqaBjHxNwOyIO6fIdPMIVgz23bOi/EhWfH9v2i3luHqL2ce
         HhefZomO4kAfgR0Xb9ZlxbRF+r4M4RgklJbzHiirZCTA16xRPN9Z1k7Z/NyihoA2jmHC
         Gc6hZYLTzEJMTt/gcE5EFb/H530P4NHvM/P0YePUBPr0YebOcHheSbDBB9fktMUjKkyf
         K/58bXFmMpInIwYJmya9edOxqXi17fv1tUIBo2AjvdVCMPiF92ZkHhCO70devtdTI7K1
         ocuQ==
X-Forwarded-Encrypted: i=1; AL+hErEQA/u6iLNJbj9B42kxMAIlniSH66H0VmfXiQMp5Kqtgoz9bS0hsB6nnNKEW+MR4y7uMRdw5Y7f5gyXAH4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xJsXJpiKe11YtGSVHaE1rOzO5hRE176DGJxNgyGIMHSrhfELB
	wQqovx6yDiun/nNSPe+LABkWQG9k9bb722Nqvn9DXhrjfbhXA2ipbvTWumFPS/s+lYE=
X-Gm-Gg: AYBFou02a69nZdbOxaIAHGUgGJ3rHwFqz47/eNuhzdjE6AquSPMW+diNgZpcb/Wo7ox
	0ydtClZ/DWvjHhZd61XwUhFrnQWE6EFNaUOq7HLtvJcmsunMZsuz/yesXnEiAu6X9vTBL0QU9bR
	v4bwmJ68RRc9BdeskuRCUrxUb5aHJHQvU1qN43l8JBBqzxg9Yr9+OeZkFCumE03pHfTRr0L8Ctc
	fGzaoCOZTVNUjtpD9jEN0iUg7JV1t7vutqqHlpjunyMh6OvgU1n/84H28DBlbFtFk4n9Y01o7x2
	kqBYTZxr51ZxHfRMMpm4siVww9uo0zU1pTZmL5gfm6HG5a5auk7f3U7q/gi0db3vItRgqMVVQ+O
	/8Y8qHOtPLK/w8B9nPsbkxmX3wzI6z7ZnFh1hXbhZZ6TnxfGNHesE47x6sZ39e4T7xiCQ4gXrDx
	HPDpEq2ZV/0lLFnLh4/DVZbUtQwBORTKlZ9mSF+leW1EGXhym5QzXJb9mEf7lM7qarWL3XaEM1k
	9OY9eU9bPaR/5e2NJrjG4vv9bKJNgCeNThuo1lis+qb/RNDd47Sov1Ro53609PIoz+UhKhtz5+z
	lvgJ7rj50fYQcz18HLtd1kgq2sXR6S1zoieEL+EVv45gXxt+Vk2xDSSZmrKnEMCGk0LZBOXEiii
	7lbUOUH//BQuFFGmqXmC+2CCVDsjo49F0dfk=
X-Received: by 2002:a05:600c:4e87:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4ba0938ae31mr28591735e9.32.1794387887546;
        Wed, 11 Nov 2026 01:04:47 -0800 (PST)
Received: from localhost (p200300f65f19a90460510dd506fc51af.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6051:dd5:6fc:51af])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba09509c74sm24119845e9.2.2026.11.11.01.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:04:46 -0800 (PST)
Date: Wed, 11 Nov 2026 10:04:44 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Alex Deucher <alexander.deucher@amd.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH] drm/radeon: Consistently define pci_device_ids using
 named initializers
Message-ID: <avQvaiaEyWDUQsZz@monoceros>
References: <20260430102958.136859-2-u.kleine-koenig@baylibre.com>
 <aimXCmtgcejwInNg@monoceros>
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
	protocol="application/pgp-signature"; boundary="pma5azs7fhrm2bnu"
Content-Disposition: inline
In-Reply-To: <aimXCmtgcejwInNg@monoceros>


--pma5azs7fhrm2bnu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/radeon: Consistently define pci_device_ids using
 named initializers
MIME-Version: 1.0

On Wed, Jun 10, 2026 at 06:56:35PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> Hello,
>=20
> On Thu, Apr 30, 2026 at 12:29:57PM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > ... and PCI device helpers.
> >=20
> > The struct pci_device_id array of supported device was initialized
> > by list expressions. This isn't easily readable if you're not into PCI.
> >=20
> > Use PCI_DEVICE* helper macros and named initializers which is more
> > explicit and thus easier to parse. Also skip explicit assignments of 0
> > (which the compiler then takes care of).
> >=20
> > The secret plan is to make struct pci_device_id::driver_data an
> > anonymous union (similar to
> > https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@baylib=
re.com/)
> > and that requires named initializers. But it's also a nice cleanup on
> > its own.
> >=20
> > This change doesn't introduce changes to the compiled pci_device_id
> > array. Tested on x86 and arm64.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@ba=
ylibre.com>
>=20
> Similar to the amdgpu driver patch I just pinged, this patch would also
> be great if it made it in for 7.2-rc1. Please?

That didn't work and it failed to go into 7.4-rc1 either :-\ It still
applies to next-20261110, is it still on your radar?

Best regards
Uwe

--pma5azs7fhrm2bnu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr0L6kACgkQj4D7WH0S
/k4KfAf/f5q3Vl7EnPVZaB/M3tX4n0SFtnKOCJkLtj4107/VpJ+jLb3mrCXFulXy
Z1rgfK86pXvaFuknlwOCHRZ6mpoZCgbp7YQYcc1+hWncLfLYFcnGvQKoZLKP8RK6
yHLzpWaGzaZvH7Q6DBQurfqIwGwTNRrFyZzi4ILzOS2nIhFGSsDwCxKAlkX1OrEp
d1wJQgg7dLK5dcHAoejIUCKED5kOVs+Sh81KFrkkgvyDB6FunShTz3T3Q0BhTALD
c1MP6XcJaHm5IpB4yWysfiiuKeYcO45KZSSKa0XoBjpmhXooicsJk6ggWaQbxElk
MUXB5eCUZ9TeWy82BMLT7UZrHZzvRA==
=gtpi
-----END PGP SIGNATURE-----

--pma5azs7fhrm2bnu--
