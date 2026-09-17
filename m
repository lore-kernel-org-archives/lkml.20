Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9DF404BE3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633174; cv=none; b=lnNSwttGjPqnfv1CcnVPz8CF6Chmosy5yL3RNT1xR5/aiWMfR+rhkw1MyhTw2fHWbm5aUZXM8MKLHi8mdPpkGBEiEZhcAdiM/KbikI3p2OxFaKiJtESbdHHRSvfUWAKDB4Oe+DrgsPV7ipZYHeU15TNJuUp9lXXoG+9KHH0ziUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633174; c=relaxed/simple;
	bh=vihXrLriQOvLlnrPibh11AIJDiMSfGA+uFFnwcE7e8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6Xr1ScNGwxpC0+svXzYNVIfw53gRcfP0El3KJqcys7Im+CT2zhijWxTntLKD06GvicLipMh1WLgKY36sBKWfsplc+wFKIuShxV2D7D59qUW5id14QKlj95q58atG0Z28hCroaSRGfOAWGTIq5+OxkcbFqnrKN9EMncwC7Cr3yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=N13n9903; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="N13n9903"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso1232545e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789633167; x=1790237967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vihXrLriQOvLlnrPibh11AIJDiMSfGA+uFFnwcE7e8Y=;
        b=N13n9903cRYavQDJcy/ICxyQN69MxpRL7oCeGY1RwpPRjh1rAoalWiClS8jEy2iEWO
         pGQEQ1HxNPW78/d/1vYVNx/n/ny2tNTS6/JwKw4EcLrboBBnQXGH0w46ZU5Ac0ZdqbXk
         TMRQSXCmdV0zSUcdYqrUF60VvbvJmCCa6Ghqu/x7+UcXMBnaSIUdvLoZ7JBO8vhWFQfg
         UbY8BeztmRObBM7+0wflVma4PJXicoq92s2C7LZxaJOLZe3qgzIog87xnLOduqS/q5yR
         c7uRo+3uvrqpf5n47aaoz352hF5zOHDctWhSmgBoUn8lXwN37eI1txW5pa1bdBwAhrd+
         sxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633167; x=1790237967;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vihXrLriQOvLlnrPibh11AIJDiMSfGA+uFFnwcE7e8Y=;
        b=2Z6v5l2H6amgw/SJnc/zpoh9j4z6jO2lrqOfk3dVi6j9jprlLfLG7KCa0xutoN3veL
         AvAN3YACpRG6gMGMlu1gp3DiL6vtMsZQg3SGpr50d2fJFg8czd/aJtakEU+lk85pNyTA
         CjLZRfmvmhWhK7lM4FxqPmV1PgCcfPhzPQBfvNBmUZXxKMzUDUJoguyIfmzmW4FVarq/
         HA5m2Nstjddi/fmUlCzVRnmyRNl2D+ePLih2gZZi/K3xSOloI7lodK8qUgMg+HzQyVT+
         6wfPs2gpBZnmaW3cP/t8RD8QhLaDlgMTa2BrGBUv9mDeBKgxif2MNpSJHrtklVrhbRm3
         U/2Q==
X-Forwarded-Encrypted: i=1; AKwUvBy813O3gfRBKR+sT2w3YSKDtDSiukE3EwiSTHarhLeNjDttonftBQdBhL8J93rT3y+ur7McRBiWCkML/aI=@vger.kernel.org
X-Gm-Message-State: AFuF++nxcRdyg40rHCEPv+1t8wFzX5UXRGpoMcZTyQ9tZ+a9LJ0xtwJ3
	jvUAEpyaUKWF0bmd0AIUxcXQRLr7oONIjaH3OW+ZGpjX3rUW2nhqsknPk1Mmo9n6TwU=
X-Gm-Gg: AYBFou3wB9XwT+6TwZvvT8rKOrO3zncLOLCWltZp4p/hwjbGuA2SOwhdXaQGgLf+xum
	s2A6sTYNYdo/K1yRDxCa6U9ADlOolWLxttnC7squFuAnSWySrIqv946pHJ3wKprX0601lvFrR1o
	efMZEX/u3XC7BTf0rKwOBroiS9lVEVvT/55b/8yRKu6yUdt5MQjcRyj12fOjD6rbmeFilLrPXK0
	W1xb/EuAw8mFEfL5+YtCoAOQm3c6iAKmPv3TL9/ayKBdHN/gQub9nlCF9cvBhBRaA0suoL361cq
	7Xm8j0X6RFx+rAl8ZFOLz9bFWPRXgha/VWioJOsME6t1uAt4SIfKZIm1/jne65lyxVlYwWzWSYa
	LvKmzBS1fmmVY6So2hCuwMSe+6v9H7uU75zjmYR+L1F62l+uZSxO8+MnDH/YMd9kFKiq2CCiajY
	vjUK1yrI+IzVDwrks3SkpX1mgVFGInMnHCwBER+iLNVf4G/upPsW5VU1rdwS1b4msoCMjMvqkw4
	3nCcH1BuvZ6oXFe1wlmpsR0h9VuLelSnajiANpG7wH6E0SYoFPRO2FCL+Iqsw==
X-Received: by 2002:a05:600c:1d25:b0:49d:1916:2133 with SMTP id 5b1f17b1804b1-49fbd1ccc32mr42772625e9.8.1789633166769;
        Thu, 17 Sep 2026 01:19:26 -0700 (PDT)
Received: from localhost (p200300f65f19a904ca0f7403c08a2e26.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ca0f:7403:c08a:2e26])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fbd24a6basm59658185e9.12.2026.09.17.01.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:19:25 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:19:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dominik Brodowski <linux@dominikbrodowski.net>, 
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: pcmcia: Update location of PCMCIA_DEV_ID_MATCH_*
 constants
Message-ID: <aquiM-BdSq43WaTa@monoceros>
References: <20260917062537.112663-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qhq3bq62uv4wtksa"
Content-Disposition: inline
In-Reply-To: <20260917062537.112663-2-u.kleine-koenig@baylibre.com>


--qhq3bq62uv4wtksa
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] docs: pcmcia: Update location of PCMCIA_DEV_ID_MATCH_*
 constants
MIME-Version: 1.0

Hello,

On Thu, Sep 17, 2026 at 08:25:36AM +0200, Uwe Kleine-K=F6nig wrote:
> Recently <linux/mod_devicetable.h> was split into per-bus headers in
> commit ad428f5811bd ("mod_devicetable.h: Split into per subsystem
> headers"). Update the pcmcia documentation to refer to the new location
> of the mentioned #defines.

oops, I had the wrong branch checked out when I diagnosed this patch was
necessary.

https://lore.kernel.org/all/20260908070031.32833-1-kmehltretter@gmail.com/
is the better patch, please drop this one.

Best regards
Uwe

--qhq3bq62uv4wtksa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqrooEACgkQj4D7WH0S
/k76rggAoIgk2UF9wJTH0A/TXgFvN0TUsEzPMnlib5Npxev2fWawKm6NMPWTJTvr
dEvXyoTHoNKXeR+8XDHhk25hdrAAAGWjKu6i0US8aOXhwe+QTyuzzxPhutN9jfWu
8E1dBU9Q+abLzsaji2/0QIVHbWc5jNRCkKmkzXGZNdNZ9E4SOUz/fYc//LUJKaaJ
eTPSnuUwPt3UjOHtxtvskdO4UVvdy1zuHupqgQBXGdKuhnlg/k/1ys+AIvb14+pg
Tck8mVfkOutyVaxijF9PYS20R23rLGXwK3IcRubw3/oM9XVbMbSQbPNMGv5cLJgr
kJaUF6/0my/vE3jz6WgAp5LGgsPWpA==
=ZUpQ
-----END PGP SIGNATURE-----

--qhq3bq62uv4wtksa--
