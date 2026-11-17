Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924655;
	b=h4fny3Wl+Q38ppJwhDcaWwfXXzszN/3iOZQ6spu3gWdvsaE4KTBvAxg/2GZYQWEfisZ8
	 vAu1t9JDa+m9nKIi/P3JPCcVOcJzEwWYeXrnJdgFsuna+8iBVBSxbs8cyywzdIY3cLLyz
	 2ogiRD3YzPfqmm/trF/a9ZxikTyNmwCr//LvS4ofw8gZipaz5OCpwj2JES397SASDHdk8
	 mLn8XYB960Wn6h6Ga1bRvgVa7LwHlgF/CIuDVmHjuk2k+x9LrxFWVfZWvSgB5bqEu++VR
	 mPyFG0co6+p4rqWNMoHV6ebP6ryviKBIgWK3lnnPWJklSgFeq7Vq+LvE8dUTEP1bbKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=whjZuJx803OECGZ5BXNalc3GEiTKyKTsH0cL456539g=;
	b=qsdKTqU9r9pRNPaXKQrPUsZLH+8ZXfLnRPZtVliW5kKT8BY2W3NiSkKeuDVWAz3JY1Mp
	 yxkzLMBvRR4ydiXU4HjSVCeNvesbI6xtI4gI+N2+HT1GVAmApmpi1MqPylB1kBN8w3Ywb
	 yMSniffk9GforxMd78856EDkzBYvGpbgsfSfvNMOWvwFMCFm/strG9xGTSn5sWG5JzCzr
	 x8aLV8GrY4mNKWdoleFFTWEhz+C0iJyaBJGX5WnXSK9BmJvMd1TW4fcnL3s2AINUbfWOO
	 pbUCQG1bZy6HjJoBst2XszHKHbXTrViX7+PAajjLpFNIFwxWyrzk3I86x1nt4b9lFvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=d4Hvoy7p;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFE2606A889
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AFE2606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=d4Hvoy7p
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso31620495e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794924652; x=1795529452; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=whjZuJx803OECGZ5BXNalc3GEiTKyKTsH0cL456539g=;
        b=d4Hvoy7pxpb1GN8453dYuj2x9rXEaWYlKEof1StTGBlLww33R9Lw6xoqKlcLrvYHEg
         YcA7WzHjoCBNwPefRW6wiWxxjZg3WmvXAVQ/y2CBvz/23FocTudxaF+7f3ww/6QDESZu
         MIWrhq6uVpRNeTJkq6Mf8mk8Flvjcq+dLp9jS5cXdjT+UGfOcdK6p5l8SGancjifHb4u
         +3MpGfW93IOtOsvzaQaIUIlUWOY8BM+V/MZdWKyoxOkFkn4wG4hazAfMG9pMzlgxN5tQ
         omoZTKXXn+yvRhWDzhmpSGiKLyGnkXMRCjkj2bq8cVcNbS5a2xYBqpyUUlW6h2KpiPmv
         t8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924652; x=1795529452;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=whjZuJx803OECGZ5BXNalc3GEiTKyKTsH0cL456539g=;
        b=SP0ejHHnle29Q1BORVkruq68vaBK73rnZnXygHKp4jFaVPnE4j1cu4E78jLn9gQaCp
         ftCuh8mrbr7OPotnag3KqDUzLzmIZ0PC+sy27OIJnarMt2jgFPqsjwztfJc49CXj5CLC
         NpduL1YxNPivlQ2BNMmvCnfLNxEINYQCKx+GW735aSGJ5urT+kF/8H/KkBHjxbzvc565
         pweoM6LF9/zF2Bt9geOzl9a//F5uoBkiLkMHY6GPaRwxYS5L2ZUNA+umm2emcNQb6SMH
         /GfGXQ7LN/OCNl2qfY/3Yy/DDi54tDpU+uMQiIOnYGXpzuwIQSlXrenG/AIM1IlOSzw6
         kWrQ==
X-Forwarded-Encrypted: i=1; AL+hErENLHey2kHOmuYDiBOf0f5IE6bPXT+/HtFNxBKtEOq7UTL4zZOLWerl1spB/1UdPKYZSUzMJQOE2fa/W+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mkQpUfREcTg0Ht/N9QV+kSs9xCq64SoFpeIXTHUVJWSErh2pT
	SUSNfTvz0N3Gu/eHz/vHP06vlq6C+mLu3I7A8vwgtBQUR/vOp1nP0XegTNjvjknCy8vZG/XHd7T
	m7+s6
X-Gm-Gg: AYBFou1BFOD6/o9wMToIKpBlCry4dtuA5uduKRA+6phvJ8tK6DXOn2hslyDhAunBgFl
	5ATY0sMgMRedAP8deGFj8hvDoWOT/ctj45Szdnkf01cvQIKh8mvlFtZmV0srFCUFiSKuPWHhK8F
	7HiSZvhSNlq9+kUADZbEjG9ieX8j3B9ISXkinyRxaAmrfqaX1nKMWipyX/HsQ/Ro1ZumrC1wWd7
	4Fk5cydzhlfWg8yN7qGItPyFuUrKVXYZeJ7rBj1p+6nG/KnJuzoG0H8sPI7owyFA2KhHZOQelHd
	qZCKorfuQkhuY0bwszM/rz24wLqRNu1toHEi29qoKrx7Ljb0LWAK0a5HqfjHzaIPTYuL7pg7T9x
	989etRWsHi66T+G48WpYhQEFQ3nFA/HaA+O5rAZdzoPK3H/6jPm5M2IXa2vOSAvE/mFZEdSLkae
	aE3fpY5qa6JCrbrmPmn13Xp+SsWfi+05+TZZFo9aLPqAKkIgd26XJT4bscUji7VlMzoSpBpSys4
	WN0tFB4qAOhptfGzePA8Nh86nypVzWgCSEV64RU1HPBazRsTpTqmLJKj/bNeaEOmUPEdMf0u2Tc
	ux41dVlJY9WgrJEy2Ltp1XS/S0J8M65Dj33keGx8PZ4tKGCiKz1gxPzs4aCiWN7W83rUm36/dCs
	pzvRVLItCW+amHyM=
X-Received: by 2002:a05:600c:6097:b0:4bb:6626:5a25 with SMTP id 5b1f17b1804b1-4bb66265d0bmr196643105e9.20.1794924652481;
        Tue, 17 Nov 2026 06:10:52 -0800 (PST)
Received: from localhost (p200300f65f19a904a5ac91f50e61369e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:a5ac:91f5:e61:369e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb78386902sm78143685e9.1.2026.11.17.06.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:10:51 -0800 (PST)
Date: Tue, 17 Nov 2026 15:10:50 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: CL Wang <cl634@andestech.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tim609@andestech.com
Subject: Re: [PATCH 2/3] gpio: atcgpio100: Add ATCGPIO100 GPIO driver
Message-ID: <avxgGQL91z0ezLFH@monoceros>
References: <20261116040914.368298-1-cl634@andestech.com>
 <20261116040914.368298-3-cl634@andestech.com>
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
	protocol="application/pgp-signature"; boundary="cyuwbzqgdey2ihm5"
Content-Disposition: inline
In-Reply-To: <20261116040914.368298-3-cl634@andestech.com>


--cyuwbzqgdey2ihm5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] gpio: atcgpio100: Add ATCGPIO100 GPIO driver
MIME-Version: 1.0

On Mon, Nov 16, 2026 at 12:09:13PM +0800, CL Wang wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides of_device_id and
<linux/mod_devicetable.h> adds a lot of unneeded build dependencies. So
please drop <linux/mod_devicetable.h>.

Best regards
Uwe

--cyuwbzqgdey2ihm5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr8YGUACgkQj4D7WH0S
/k6Nbgf+OnbjIDFyQv3zYIqcwE/Un//NPGHrFQ9idxBn0sOWRA4bwsWkktGVG/ci
m4eZ7fh6kVNQ/S75Ab8pg4+r2nges3azKBvLpjUB0w8W7GocXMcVhVGgtnEs7NhX
x/C6fVqVxbFKcc515ipiVvs5MMQ/WyFf+AXuRea4KgAhVBdsSznpQ9MSYx5S5pNf
LOXxIrMnnkzVHODUtFQqnUBvRheMhndwVSTKSO27i3jV5Ru2mjYMx9U1alrty93N
LEhseOe4f6Ug+BRa8c0+x51EuARRVFxGNSf6b+uuy7zgz+hR3My9bhyu9JFieWmA
lDkM4htuy3LfAAWTUW8eTCDBChFi7w==
=Nh9T
-----END PGP SIGNATURE-----

--cyuwbzqgdey2ihm5--
