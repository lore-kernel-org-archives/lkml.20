Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E361413D99
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802763; cv=none; b=AicQCycnS0s/4CwnTdwQoZk4E4WxzWd+8AvPlpWWkbocT29D9t9DfxaTp/RJGvEN1iCK6IeP8FwgdIly+b/VSXW6R0lswjYObCz+xhsdn2yN0hbPIT+mQO4uC2CShKfj4g/MVkfbXIsyw2AmZ2NxsVbTAfmzLYSuAFtJh3fzyok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802763; c=relaxed/simple;
	bh=sSsw6zA66lq/cz/yvfdISdQChtg2krHbE9Q+XinaKPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTEZXS2EEldiy4G5tVsZI/S3q3uxfTFEHX47LKDvVFh2KNEQARZk4SBPyt1qsUg5Te/Yl/+oscx7a0kNyMR4ztxNt4cLNjKu3Z4UUwcwJdwKQDEDfgAIshy5bGnbL9vEETcICB/eE/dEHbk+AcFXaFRT2InS73dMXSzfaSIRdLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=j+pOZ8Mo; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="j+pOZ8Mo"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4d870d54so979022f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791802760; x=1792407560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sSsw6zA66lq/cz/yvfdISdQChtg2krHbE9Q+XinaKPg=;
        b=j+pOZ8MoXvYpknHcu6hOJto/ibdqGyXLUobOIKBi2Kq5YV4XtmTtnmgzNQ92K0Tns2
         YDDVTKcnavWEeZDkbv0qpsat/nMrI0dGmChd3tpsUuz51TjHwzVsKRQG6Fovks7ttErx
         nmCXZQIkSYQGlzuAv6RVlEZ2gxQ5KSQRvWxV6LT76ZAz4enLF/FSxynMhV2Qwo1pTovR
         nTb+3McCaS25H2t9XxeB4ZCmawKpIf0Wsj2/xjntT3MwB7C37asYChGRiaj+r8+7d6Wq
         0NqNWdu/mNEfdLWLSUgs4Z7l563iRm6t8NbNdNx9EsI6FXy7boLYVBHlZi64Dl9+STRq
         KISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791802760; x=1792407560;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sSsw6zA66lq/cz/yvfdISdQChtg2krHbE9Q+XinaKPg=;
        b=RLyHyijZZCnwCZebOl9M5uwx+ai5SRy9RBgnsykhXuyDtK0hJAyDcd+PN8wKZrzC2t
         6ipYlBg8Gr5cu8Yh03XR0JBy0psZYgVlXCzERlK3uGblP8/aKUqX3kMs9tB5ig4lw1dM
         ZRQsQoC0QmDDHtFxskOnVdUZpq0xqxwWhVy9nQVRBWL2hgq9BsjDITXQKnRkl75eMW3A
         CI7XX4enIq79pf44VWZKDJXPxIsvZ0aaMiVb/fzlz8Zx0Q3ynguDaRkEVxpEsGdlGI72
         apjPMpDHS9+qkTJ3RLI2EEcAYqaIFSEBszK8QtXpNZ3xNIdFDkAOTelhH9oPWvCFzpc6
         41Wg==
X-Forwarded-Encrypted: i=1; AKwUvByGgYrR7TrirmfDQZJ0DnZhLyze+NXmGJZ1hNcIdIfQRyh2lXk2HV36XpoZqRfJ7OQv06XOpYGxPNsDCNI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKv7LxXXyeTvotAVYVKvn0xLPU0DIAMSWfuUdyTQuce1aeL7KeT
	u0NzvWnljWaxpcs1xXfZCY9UIQeLnfa0mPNbbJEl61sqEefflkSSYal6+K+AE3VPSS8=
X-Gm-Gg: AYBFou35rQ7u5N90OzqF+Yu3LqrHvfjt0c4ndTv3qPstpdJbQ8eEv9k/sdcCC5RTW9D
	sp6Oy4ZJlPiy4MqoaTgx8q3Vh3PqOiUbpnGnIJV1s7fussw8V6A0Lj6txcK9dGBuESJ7TVvUfLU
	j00LQVNmBncLMYNOinSSwfh3wElYTcJv/6FhiJA6zBxAbRRkGwXWNtUX+OYB7mSIlof4eoakgDR
	V+h1SLxxvycIzWiMz9sr5K8NIU0M9fJHBex3r2JHEpeTwE/Qp1Gnh+v20qlenRn1hxkxkudazDH
	DvrkVVArM3DheN9IISveMkFlo5xKul9eCLYJOJsclnWxPrYcyVvWSifEnHOCtASG7QETr/Vol0z
	oYsdcAz4/2I+rFMOjTtzWo21vkZJlyuyiA3ME5QMwG1uAT+wx4jJaT/WthsvXnrBuzHvkSv3daX
	4oaWTGNec0WUgOrtCJVy3qtAjmf7VLDewg56F6bMLOi+A24DNUxd8MZz1Il9By0iinZLs41WIRi
	+fSG4KcfH9WDgaykgDdNeqh3KajqO/Emsuke2NBfMtayyRnY1A4PJWBW6zwWl0Vp0lKqmQL
X-Received: by 2002:adf:e001:0:20b0:48b:efb:4a66 with SMTP id ffacd0b85a97d-48dba7b405bmr11892966f8f.6.1791802760381;
        Mon, 12 Oct 2026 03:59:20 -0700 (PDT)
Received: from localhost (p200300f65f19a904ade4f69ba751c34c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ade4:f69b:a751:c34c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48db9463a9dsm19504613f8f.6.2026.10.12.03.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:59:19 -0700 (PDT)
Date: Mon, 12 Oct 2026 12:59:18 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arnd@arndb.de, linux@armlinux.org.uk, stefandoesinger@gmail.com, 
	robh@kernel.org, krzk@kernel.org
Subject: Re: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
Message-ID: <asy9K6Gqygrl492D@monoceros>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-10-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q2hmm3keht6hv76x"
Content-Disposition: inline
In-Reply-To: <20261010130024.177503-10-ghahramani.navid@gmail.com>


--q2hmm3keht6hv76x
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
MIME-Version: 1.0

Hello,

On Sat, Oct 10, 2026 at 01:59:47PM +0100, Navid Ghahremani wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. That header creates a lot of
useless build dependencies. Either rely on <linux/platform_device.h> to
provide of_device_id (preferred), or use <linux/device-id/of.h> if you
want to go full iwyu.

Best regards
Uwe

--q2hmm3keht6hv76x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMvYQACgkQj4D7WH0S
/k5D5gf8CiIw5ZmHa/4qhjWhI9bOHEYttUfLI5E9sTpo3TR8gSP3wq21tpb9ywRb
nvEYlAntKnE5j1YV7okO47JWOPy2FlFSIYfB+bl+MBanR4v7h5vaVIzlFDQvZI3x
4/s9TDLNdORgidiC3wYjnlvk/BYGYeV3Xcz3Edd10vTvXY1nkcWX047ClGlweYLQ
0KRRSVKza1fIczofidCe4h3TDpDFsG65SOK/OfVjl7Ao2wOK/RPk2P++gNgzstkq
7FBEgasH+SDPqmohBCxOC5y+hbfVkRO9TtxPaTtCyPXjy7bo3RVXFSBI/NrgNEoX
lBI6nUELanucYbUs3YpLmyfwX2p/fA==
=QMtx
-----END PGP SIGNATURE-----

--q2hmm3keht6hv76x--
