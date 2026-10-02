Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE25446BEA
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930742; cv=none; b=I5au1fqasqUbLKxSs4rux2c/E+5Wmhuc3fKHzp1U7D1g5W4YEDToP4V3QCGwzf+kYxeY2/QAOF0l7eIuzjwUfPLSI5jcwHO24lct0oFCU02p8pgQ5xIPw7zfu6Wb1UJ6cGFRRXFFClZ5CqL8DLwyJHdMOMIahf4NPqMT2DSSz8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930742; c=relaxed/simple;
	bh=Q6PnvKn1BRiwuAqzPSQ8eJcrVGsr3TqLvA/X02jBtrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Go+V2fzym88LdBPmfywRnaXe1F8ezu6LFas1NATlLp0SZd/dY9XFcx44fvJeEPwflMqzW2i/+KjaUn0Uu8H+dM0ddxgtKAc50UjolzrR0sO5Q7BbQzZHpDBArZDti38pRUXyN85nEyANNBdoY9ga6vxFwEdD4SLrQiQ+1zeEkYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GWo/s4tX; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GWo/s4tX"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b9d8056d2so277578f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790930733; x=1791535533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RiMp/HQ4MZJXXJm9zw0L5IH3yUyg4yANpEUs/YvjE0Y=;
        b=GWo/s4tXdXPSS7PtUc0dFqLrEeaA7oSSBVyWfIB+DXPReynLGsiDONp1YSLW2vwK8i
         wfBqlkiEfYl7TrVQvA8vlfJIDysUvGwWpsLqA244iTW1rp3bppS2RChnLRw2uLCO62Ra
         NLRluzhlp1rDqA7z/WHW+IWStz0gDhVVHMu9mtDSGQNJgF0hl6XlwUGWROTi5SDt07Q/
         zbgsYbsKvjQgY+edXxvsEDFJzItuo05TtykBtxb8zQjCbFMV2YxYc1VMZSIIkCVsbn8j
         PPxSMInmAFTH1vRBTb6KmUtYLuhiImCXbVBhvT/UEoqKboKyUnu3tDwYgXxz6SnZIEx/
         A0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790930733; x=1791535533;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RiMp/HQ4MZJXXJm9zw0L5IH3yUyg4yANpEUs/YvjE0Y=;
        b=Rr7NjI7jyXj/3bAQM6SQJDAVU0d6cF3HMMeOEQNKlSVYRrr6+ZoDtPa1wLfURa8CNS
         JPQKFba9IvoMMQretS3lUC5xNA/k9XnK/zXQsrBsxZDETPGjqHg2xrovV5O65HoB86ty
         tXu1AAp7v/gIhzXYrLSflsChmchFnEPTNXJvFsGEskyPRv3+nUQ9EQ3Sp8ZaQH+8IKDn
         3OU0qXLi/+9MN91RvOATfHXgWWrstGuxQqtb5cKYXgd+9C3PqOvJSXskHRZPWfvWM94p
         0Ecdxdvw8kHy0luF10CHJIwmldroRnBXjp78TNMDPwlM9eH4+wf0BNiAUa9Glje8lZl8
         fdSg==
X-Forwarded-Encrypted: i=1; AKwUvBzJ0uC1ZbHxK7soZ9cQiwe03RsL6VKh8IZRVUVWM4IYtyypTcJ2AsGz/OlbV1eEHpZhxX57oiyWQ3sZAcY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiE2Jg5+6pLxrNQNBC41tmLzAKmIarxnUZn+9slWc2mrEAs8xz
	i0JqrfiXc7o+byK6NSxk3VqJ/6LFUmUL7HxJrN1NEcd8zAKQ2tOzi/hxSmr2WBGi884=
X-Gm-Gg: AYBFou2uw6N8JrnyJot6+9I5v2aCzAqMnCiqr3YkCtLprvrVEeCOpd/5wnuotuTMbHD
	LProK1Mephjnth2eQlmlEcIVM2Ukh0UEvwRdpVWA5Y4ONnDJg8ZiabEkVUvGrhZcedyzX1Fg/bA
	ctZwxefb0JDvXU82rSF3jeY4+DJadXLqeGNZiGlFkvPP4IwjFTHYcNSEQh49OJeBs+vPMh0ekJl
	TZreqPH5HjU9LK1Mo6KW4GIPdGSQvyDFGzYf0643npb261QOHlQhZLn9Ob6NDE12QIc9dWMwqbF
	R8gWL0ty5puHjxjFDWevbtwR2fzC1sjjbf+8z/JXhHlYlskE4JyqdAtcE/Kns00Rt0fb0yyB9q3
	YU6JpAAR26x7fQtJJLjpZsyFQdWBb4gFsjsMmrPt78LWiq31MQXfSXhwvtXpXa/7pG/dHNYFLVr
	tDIIIuYcRqRCu2xX6c//7MNXSR+rmNZWBFE7LGHgpP8508EYQKRUDCEi6bpWARkFwpTEkmdH4=
X-Received: by 2002:a05:6000:108d:b0:487:27f6:a4d3 with SMTP id ffacd0b85a97d-48b1274ec77mr2519619f8f.35.1790930731992;
        Fri, 02 Oct 2026 01:45:31 -0700 (PDT)
Received: from localhost ([194.213.108.11])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48b380f04e2sm3692890f8f.15.2026.10.02.01.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:45:31 -0700 (PDT)
Date: Fri, 2 Oct 2026 10:45:28 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-pwm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] pwm: tegra: Make use of dev_err_probe()
Message-ID: <ar9uJyYyTh5bfM4i@monoceros>
References: <cover.1789741839.git.u.kleine-koenig@baylibre.com>
 <641219a7d76bbcd8fe98b5955f2355ed45f55986.1789741839.git.u.kleine-koenig@baylibre.com>
 <arD6ILv1sd8YBUXj@orome>
 <arEiVZG7UqxpqAPZ@monoceros>
 <arFVjZ7bE2-lgnqm@orome>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="agfmvsvuk6z7tqez"
Content-Disposition: inline
In-Reply-To: <arFVjZ7bE2-lgnqm@orome>


--agfmvsvuk6z7tqez
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] pwm: tegra: Make use of dev_err_probe()
MIME-Version: 1.0

Hello Thierry,

On Mon, Sep 21, 2026 at 06:14:31PM +0200, Thierry Reding wrote:
> On Mon, Sep 21, 2026 at 02:46:03PM +0200, Uwe Kleine-K=F6nig wrote:
> > [1] last instance was just today, where on a bananapi USB didn't work
> >     and /sys/kernel/debug/devices_deferred ended up containing:
> >=20
> > 	1c13000.usb     platform: supplier 1c13400.phy not ready
> > 	1c1c000.usb     platform: supplier 1c13400.phy not ready
> > 	1c14400.usb     platform: supplier 1c13400.phy not ready
> > 	1c13400.phy     platform: supplier axp20x-usb-power-supply not ready
> > 	1c14000.usb     platform: supplier 1c13400.phy not ready
> > 	1c1c400.usb     platform: supplier 1c13400.phy not ready
> > 	axp20x-usb-power-supply
> >=20
> >     It would be so easy[2] to add a useful debugging hint here
> >=20
> > [2] https://lore.kernel.org/all/b699f8251afed736af454a981630926e45eb7da=
7.1789983244.git.ukleinek@debian.org/
>=20
> I see. Yeah, I find it increasingly difficult to remember all the
> context of a function call, whether it is that it prints an error
> message or needs some lock to be held, sleeps or not. Sashiko has
> been really good about pointing some of those things out.

I guess a comment in the function docs would also already help me. And
an upside is that (I hope) Sashiko would understand such a comment, too.

Best regards
Uwe

--agfmvsvuk6z7tqez
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmq/byYACgkQj4D7WH0S
/k59hQf+OU1W9ZhedzdfcGj2U3UJ1x+P1RejoQ2RuQVfrUgHvC3MSMFk7JXsrDNc
LTbCJVjT8VU/Nob7KA4r+5v/UF17IVLwokxHP/bn7d8Btes8lHsvoPag6kfkWz8L
I5dGcmyYxf8HrpoB03TIu49HauvAcTcm45e1Y/7+FnUpZIJlfwGUlQWCaO6JAWNn
cH9sdSJQ9T7Sa40ARrWOP8j/O1KkVB7e5oQ+m6A9oCHaENvoHXbJqg1+NekVzb/E
nxHUjAeKvse/DRePf+hAuBmHHO3t+jsZQgfdGSzKfGRdiITlnAU6Plldbt/Ao/MI
aQpnnF06H0F/MWxjqxrMExhYMLOHiA==
=Wsri
-----END PGP SIGNATURE-----

--agfmvsvuk6z7tqez--
