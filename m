Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D53B44E67D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792393275; cv=none; b=V/UJGhmUbFKGkWDsyidjnDYDhY3i714gvKzUWMPY/k+7TpmFLApZ+nATdXqCsUiPde3oXGMk15y+bqZljEi2+vZXv5Hib7eh7VndT+igu7rL6eSNCOm+GseTHn2/q1RRPF74Cme/gZBps3wksU1xh4yENUfpzjD2QJ+fDct9sBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792393275; c=relaxed/simple;
	bh=oZ0gokOtvvho1vQAI82v7ekdmMpczVsPguujZbX7mtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1XeoYBiQNTnJWA6POTuayci+P7r9mRWUYEGx6uEFjYNpfXKxV4m65g7mfbCJhca6PnFS7kj678H4k4Aa65DVdthl7mYcaLWCgke06cz1HozBsPsq9hObEAFWi267mCy7lUnFQnM+LhyZN8tl3Z5sTJgPFxXXeks06pacJXQ0Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=URF+tZkg; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="URF+tZkg"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so2515585a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792393273; x=1792998073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oZ0gokOtvvho1vQAI82v7ekdmMpczVsPguujZbX7mtk=;
        b=URF+tZkgNtXdBCrtJ2GRt7XWSDM3mDfelThksR08lo0wWDta29yD2veH5iuE00RJrS
         ew4rtpOhrHP3duCpQ6rXIHuvlC6E1a174WZil3CnsTRmSBfliqCsRphrYxlBziNN8ndz
         yqsiY8D+vJH//ONdul5uQsI10Pp6jbd+1Omr1vzLz20H468OJuYx3oHBRVjoH4It7SXC
         wAUnupHQAMJZjlL3uqMSaVsWjyJJ6694wxV0mrNYuOoB/JZVy7EqVz2w6G12zlhqg0yV
         ASxh4+427usDmhqWg+obPW6IcaKD9VnJz2JjkbdZHEAHr3CS1ChFhd6cacY6p8Y0oPkI
         fcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792393273; x=1792998073;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oZ0gokOtvvho1vQAI82v7ekdmMpczVsPguujZbX7mtk=;
        b=zjhtPFupKfzEibSDnxj6SAh/8wyW/vnS38kCNyZWgb9kvk+ytiO9eVzhOEyupNuR6k
         LX6U4vCACZcQ2NJuDI8vZ2zbvmVvqNZfYeFPVBnnNheFawicmtfus2aYeJKqhgOmnhGl
         iAF+Z95RbA5hxBIDKxJLlnp9wgQ3AOmnH1mDOWi+GjanIQPbC9YKxx53coxGhT/euyGH
         FBfHoGHVfbMRrIhRF7+8u2ttcRK0jd9OlWZ1e25KANL8ySzBEHk/PT3mCVhKkXaVical
         oELH4ppK1NQGWsBGKAvF04vIM/QgdeGwpu8xZZGePZjb3j6MD8cZj1zLdKQRrHx1entB
         mcQQ==
X-Forwarded-Encrypted: i=1; AKwUvByl3k62+7YW8rXgoDjJvbUL/7jXxafd20raya5XuAay8j/pp/l0oAY81LgXVL3ok5VYr4qBlEPxYR6tXJM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/u4frZOQ58y6pYFuhE7WjwcX1jmmDGfr0yKnk6TS0zzJtBqvZ
	cDcWxLc0CZJMg5jjaAznoI2rns9ENwfO4/sQ746hwUljeZx6RNQx4N+cQ0ufltGjaTQ=
X-Gm-Gg: AYBFou0Uu0+aXc+Xxx0HwarGFKY7bkQnFXVexGdln7l2wofPx1cIZSkvSFfIeiKkKV1
	VUl+lFWQkUVpXO3h2z/n8l+UabuX761JXIyWKsBGzFkY8er0FPAJLdsPfGoTrBgps7YrDh81yAm
	vCFUpUXfLBIvbje1XgdmjU54vzih949jv+h1xcD6rR7hzW4mwEF4CWO13jygJETpNlJ+rcRhWUC
	+YGI718DcTy1AUECMJNpkPi3VU0bKEeSjK8x3X9RL3yWgUnx8j+6dEwnBj6MJZ+h5FK0N43ZZ1c
	fnkrWdoAhKxAFwfOS+u9AX936eUkJSu9V6rSFmsEB0TU+DZ/NykEcyKSlpkHlRpe5nTC4YcXs1F
	sjQBWuejGo0Vtm3XtvomWWTGaa6tCPB8lelxGGGBbzm73UNVNV9EzkGaYspD6L7h8b7HHj58utA
	qU2+P9IwqxXWt6SvIqhrMrKy0byw+QHwvk4EhgXI63BRAW7EQN13z9z6dAMCnRhsBR8hgn+qr5j
	1Q+tjfgTwE2wDjHsfxnP4Mws1C7rWBHKgc4R6g+ehskNJIMi9eptuQ8Vlf88g==
X-Received: by 2002:a05:6402:325c:b0:6ac:6fd3:1e97 with SMTP id 4fb4d7f45d1cf-6b3a8198b00mr3033569a12.35.1792393271655;
        Mon, 19 Oct 2026 00:01:11 -0700 (PDT)
Received: from localhost (p200300f65f19a9041674bacf58593a35.dip0.t-ipconnect.de. [2003:f6:5f19:a904:1674:bacf:5859:3a35])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48dfd4e7ff1sm22693440f8f.25.2026.10.19.00.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:01:10 -0700 (PDT)
Date: Mon, 19 Oct 2026 09:01:09 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ross Cawston <ross@r-sc.ca>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, chris.packham@alliedtelesis.co.nz, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] leds: add Realtek RTL9300 port LED driver
Message-ID: <atW_3bhMg0vsHtNe@monoceros>
References: <20261018194339.132-1-ross@r-sc.ca>
 <20261018194339.132-4-ross@r-sc.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nxjchq4abhvsnp6i"
Content-Disposition: inline
In-Reply-To: <20261018194339.132-4-ross@r-sc.ca>


--nxjchq4abhvsnp6i
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 3/3] leds: add Realtek RTL9300 port LED driver
MIME-Version: 1.0

Hello Ross,

On Sun, Oct 18, 2026 at 12:43:38PM -0700, Ross Cawston wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h> which pulls in a big
bunch of dependencies on subsystems not used in your driver.
<linux/platform_device.h> already provides of_device_id so you can just
drop the former.

Best regards
Uwe

--nxjchq4abhvsnp6i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrVwDIACgkQj4D7WH0S
/k4jrAf/da4fouhkXJC88m375WuCC2zmp7feudZpUHTGrjpPVuXOGtGEQGIvfq0q
pCd5kfrkD6R2nAVU02XiHIf6z9KbVLfbNaXojWbu0NdKBpCvyUMEJ3C+QZtXSXZX
qG+en94XPUEproDiPCzMnTCEjwPK9ZGBVPezOSTj2EiG83ehP6Y91UVRf9X4z/qb
qHVHfNszS2ZHEOYgkDU9vi4ouTTg7XybRC8+ikJXmYJIkqMG3WP6HXRHADnr6mVO
CaTbrr7SvLdlO5lEfKp2E6GEpfgwDCwMR/GeIHXL2qj7KO85kycsjOk20ZcuMzUw
3qudAVQ2eBldeyhG8SHT4ndWZyFrJg==
=+WSr
-----END PGP SIGNATURE-----

--nxjchq4abhvsnp6i--
