Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4E457F747
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963767; cv=none; b=hjJdPDqHO3Vb8WjXlDbjOwhQYloCEtXTD1OdlDRA+VT6Rej3u+1UjlSaq136aR7/VtD0uNTX291CEV5+12u9BNFy9m/5/GjzqawIPh9xAXAFJ+f0FMtjaEeFsmfnJFGzFxvn9G08VmyM+khs/ymLuKzYE6QDhF3uTZvpUbnAsnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963767; c=relaxed/simple;
	bh=K/agZdMyKcKM4PBRai2GAcUit0gR2B7Tc9oCBirO3wU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jp5Kg2RHY48D86TF/Naq6sJBUhZCfqVRF/G54nP/dI/Gu8mgMzMoVhtzl4/57uE2L7u3gFKAxLG2Wbfi3V1LyT3sGhN845EBF6Ocm8gImVnWLGLLzQfHNeZrI7fUdeoGHju2psHeH8sjYqmclG1a7n24enaV0S0ElRp0EulSit8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WU7D9nDr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WU7D9nDr"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso58010215e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788963764; x=1789568564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K/agZdMyKcKM4PBRai2GAcUit0gR2B7Tc9oCBirO3wU=;
        b=WU7D9nDrxKuTsbXYAUUknV73kY+b1IhFbveawnYzuEKD0ST+sLNDpnewOqXUOwIVov
         Snr+09H9KC7RqGtTKdThdyerzg4bnmSazazChVt38HmVNxUwV1iV4PQ0kMRCGwdNIYVW
         cCsGucOHD9CQ1zRyyTefkiCbbO25/3Av16aQr/MLO7qXgN/FydjHcxr/nVTiWjnl8I78
         UvbyfFtskq6s/aUCeoDPVDPq1reCi6EpVkvR0cCNjXn9tLSv+ZTixM8440lSw9OTd+JA
         MY5OK5YnaHrr4IaMFaiZWtgPGLJ70EvbHvGTXKmVtASt4YKElLejvAUJrXZGGjClYPU0
         Xk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963764; x=1789568564;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/agZdMyKcKM4PBRai2GAcUit0gR2B7Tc9oCBirO3wU=;
        b=Tr5Pvw57tHAaBy/Hf8ABxCU7IIySN6rUhvkwO5Zfn90tV8fyd/3/rXfhC9cZNo4TM3
         12KxoDhVnc3LqbOePu5AY2oBa3zVd38aUnkPCH2rI+XmIYRxxI4M01+52q+cRukW8opH
         B9SG8NRrLrEoVl+M0Uj7+tu4JqGQy21SIJhvrr6X3viACYQdw3voidjTB89JqDiyrdyp
         Zvlrfku3EmHygTXdlpDDxPsSHeg4b/5+/zuVBA5sgmp/wvl5X6yv4xYgydv783zIZ8hn
         ni9jsT0wZI8CXyn+GANCRNOJVceLsT6MS4uRgDHJ994/BoySZinMcX/x4BQ2xeTkFMux
         3v8A==
X-Forwarded-Encrypted: i=1; AKwUvBwU66p5iXX4XGxgzfqK7XHmaR2xpAqZ34VoEJVj53NLJ57UlFz9NJYZH4gbCSTWVndkmqp+RPKSKYay3YA=@vger.kernel.org
X-Gm-Message-State: AFuF++nV6TkxMS77SyJssNORkeWBLjVwQ4HZX1GMqsUtfc3p+1k9PQON
	Eh1U7oVR7/QFbsJ2OJ0FnT0Gv3y4w+3e6h/WCGOey93jp3YEHsN6D371WHr6fkqE1U0=
X-Gm-Gg: AYBFou0Xm9XW0PEPs5VA2oAN3FAe53U+tAy/wY7ICXoZVBIxaRk6QlA3XLWmJzYTfUG
	NEF0P6OSVj+P+qRY07k/qRtEwXbmCcRfV26SkPPOzOX7nR7nz1FvZ+OqHUorNrFtYDpHivIS26z
	8mCrr1UXZaQtliybe7mFk6qxSqBYlYieF0LZZPuoXjBepbX1cYlPG+flMUTpWRZXdCIP+hMejBi
	On7puprwPtEVSU4S9seTDsdZvg0/aEppAVyjNYarEauupJC2KYQ+PqMk3U3gdRlpNPcb7bGlRXe
	MyfY9NcqTjSNa3Ty38u1QGWcXjrJ8JnJW0CSG1UrdkMb+SvwaEij4H7Ks3xkalPTNq8TtSGuj5N
	82PdPbq97HF8HHGQNasMZhwIZ9vRbAa7LKNaD9v/4O1augmh5lOfXrutMk4dfThO0pK6lbcQlWq
	hfzUndKwBPuColZWKV6toGVJj+E+shv5eue33Ygcafox+O2fq4TuPPV+Z7uI5SkNGfJ1pbTHRJ2
	FRAZM8uFR0dM0sWoiT5FQV283ys9t9YjCC+c1qTWt5THdzA/UsBEMYkcd4Few==
X-Received: by 2002:a05:600c:3115:b0:49c:e1b5:b2bf with SMTP id 5b1f17b1804b1-49cf7f48645mr357100075e9.0.1788963764200;
        Wed, 09 Sep 2026 07:22:44 -0700 (PDT)
Received: from localhost (p200300f65f19a9042846e5e8b4b91e99.dip0.t-ipconnect.de. [2003:f6:5f19:a904:2846:e5e8:b4b9:1e99])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49cfd3f8192sm433887725e9.3.2026.09.09.07.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:22:41 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:22:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ariana Lazar <ariana.lazar@microchip.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iio: adc: add support for PAC1711
Message-ID: <aqFrNywuzlbCPXAv@monoceros>
References: <20260909-pac1711-v3-0-dff81003b82f@microchip.com>
 <20260909-pac1711-v3-2-dff81003b82f@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nda6bilsfrnoksc7"
Content-Disposition: inline
In-Reply-To: <20260909-pac1711-v3-2-dff81003b82f@microchip.com>


--nda6bilsfrnoksc7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 2/2] iio: adc: add support for PAC1711
MIME-Version: 1.0

Hello,

On Wed, Sep 09, 2026 at 03:23:35PM +0300, Ariana Lazar wrote:
> +#include <linux/i2c.h>
> [...]
> +#include <linux/mod_devicetable.h>

Please don't add new usages of <linux/mod_devicetable.h> as I'm working
on getting rid of that header. Either rely on <linux/i2c.h> to provide
i2c_device_id and of_device_id, or use the headers
<linux/device-id/of.h> and <linux/device-id/i2c.h> explicitly if you
want full iwyu.

Best regards
Uwe

--nda6bilsfrnoksc7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqha6wACgkQj4D7WH0S
/k4pBwf9HMHE6+LiElw59mvh7B50esffyJs+75+O47two8cqCFL5pIZ75C1Bhf2L
5Avi0u8+4M9eEOSxBdZhYORLo1a0yP9gfK2nRcrcj47KYngZg7Ss7jGKIn1MNt82
s6UFapgx5vTvRirJ1S2bFYFvIVrXlXnl1Zz8xMSrOeYTy6XwB2re8g9L02PWILWV
67hTqAqiN8951ovK1Do14dG3FzisY5x4qVyJyo+HdI1UiVaBs3eLAlcHILGS71tE
OrXNyW1CLi2aNUC7ozo83ZvMY29ifc1WKfiUA4rl+/HgmHV34/xw6jORCsP+17f2
1lKL9L9TnI3HGjMzkyRepYIWqMlV1g==
=K5yF
-----END PGP SIGNATURE-----

--nda6bilsfrnoksc7--
