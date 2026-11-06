Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984257;
	b=M4wprg2QP0S1Iuq4QmAcIsCrJpFX6sxii79xlnGDZf4rk6F9mN0U6ts+hkcyrACHBj3n
	 8LkST5KqZ/I36X7tD+tgZJ2jm/nDliLAADnkKtjgKSyhs2XFh9/TAsm7TAo4/Ui7zX0Ql
	 Ask4KWmm41J+5osWG8R1M1vhpO8WcCjP1uJ4eQVUecce8pN0lafOz3bih592VSs04AnJe
	 +GgkfNcLggF0pakKV8rh24WhiyEcOIxRWx5GKnt9dDKfZgUYynPD0EsQocTXMfuEYL2N5
	 7RyOi7R8gSXzo1MLNVF5RGU6xSupwHX8NEqRhpT5qoLMT+wwwRl+bPoo0elAg9g/EUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Dui2HnVpfjzkzxu9M35L+PlJD8C9n4WzI7XNWWzwiiw=;
	b=Ucb2YeNGqW19ACZJENo5C7O340NU/B1tLAWZXx+HyB0AlszpG30Lyqv0qlo2ZsRmvamj
	 sGUpqzzazHQIQwril3lKBIPik+fMYt2kzXRo4OzIOHaaJF9K+Kc0o7PeS78h/9ZB4q/jH
	 ai1MJxxquk5vdbYdSN3PyUcqnA2hCJnmkKbD+h1n7wwb+5IxQ6bXQc4FFDrxwYwve03BL
	 q8RMaTYOznSU3/8BCuXVdAqcRjKrm711jdO8JwvG8c49qVaffwxSW5MWN+90LaYWSNAXO
	 Yy5Lt0RyJxQ7K9BIDKC2m8KyXueNFz+E4s2skTgkJ/Sn0V5CLSaclCQZJFI8xw2ly6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JOFE8Euv;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872A6606A33B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 872A6606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JOFE8Euv
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a215e64962so10015145e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793984255; x=1794589055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dui2HnVpfjzkzxu9M35L+PlJD8C9n4WzI7XNWWzwiiw=;
        b=JOFE8EuvP/aiaExAz3zhbWKSmdofbIo2gyAi15JmBQowqrHdneLciitNKgOd/Rc1MY
         TqlwQ0qZ6+zprLi8oRzpeZdfT9rm4Gk/2vmpzUyY+WYVrFq/4VnGWu0F92eSYknQ9eca
         irv+2yYK4tyLv49lJoGUX8YQNNFvczC/QXgxtd5OBkAnr7myUkbuqiIoV2K3p4F1obdH
         Hit0fyb+jSGiSyYi6k7b2PCp0Nplky8lQRcW62b9a1jHv9+1r6ph2IuIoqmuX0KV/xai
         49KfI4QeYxnwjMZnTkPOQWP+BsrShNRyaJdZxDrxjQM18awoxYdnpxd7/h6wjQeogqtO
         LtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984255; x=1794589055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dui2HnVpfjzkzxu9M35L+PlJD8C9n4WzI7XNWWzwiiw=;
        b=Lz3PcI+1TWI8ZfLSpX2QFWolpYa2pUscK6iN5gWdVJooWuISejJ52DNVVfoinIxeWl
         oFdipVsMdzIC+ow4hi2HJNDWW74JsQ5u0ScBvmxpT9d6EdKY6sS9DfHJ5iyB8hC6B979
         BPXPRI6PCUMJBst7BINzUr7PMDaB3k10/e8EgkuwH9OBWbCzl9t3GFz9GLjMM6kV4d/I
         zN9/p1Fb5VN5+zx3dudwpgm/m+0y5vNvQMTdj7u3TpBHw+9zRfQAhALT1wopOWIvoE0t
         TWz9rL5OsJWTLlV+haVCcR67Dz/QuWPqe2zH/P2FIEmOljWLHIiLTXgDP0GJK97Dn7GP
         YnQg==
X-Forwarded-Encrypted: i=1; AKwUvBz1nZGsnris9CqMsUl4hs6TnltA+BwEMfu+1Z6lvI4N7ydiw2njRaR4308vMLNZ8GgiuSzsAVKQIgrfJ68=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ux9thQyF10fi+FPWY3e1mUTRDwq73K7Mziu4XPXePkoqrIxCi
	dXbkfYu1rTzmEgU9zyrhu7UXf68xHT4aTs8x26gZeP4L72IkigjhktF6UYEz0s2nujU=
X-Gm-Gg: AYBFou0wPs+dV94xiI8b5xuxRwzLERv30IjWkJ3Ywe0ymoQRSoFMKWDF621xvIJ67l3
	EqPm95ujiAzDyiC4eA6zdl35xOKjif953VMRZKcFCB5fDxX7JNSkqK6KKChimp4uPs38hjr/qY7
	3G0ITvbnOqK6rlFVhZoyt+wqW1LSufjfBSndYMfZj4rrlzkMYVIldFE/rp1KXSQi/z7OulOiNqx
	J45a+XzBv9hnMWHMBNmvw4hL64xfAZD6tI9AXqcwxHTXDaGTpJVrL6SJluKxxHRdB9re7ZgmAWn
	Tjp52FNbBfLci1Xl1BKrpADLSPb03GDDzXWPNJzpCCr6O5qIs/zPK63lULZnQQX7AePSknGiVvY
	U4LOQ9Q6RsUuscMwDU2k9148ptLgJxAODoU32kJnXjmCjMGWcgO3nmrXa8j8UvCTAPJxffP/4PC
	X9cbHaJdmtcu62jxJ30I/roXRR0DagJ7SmYa8tQuXxK9z7NYRwrDsGY//q43p1vnK3ly+KFnK3X
	aUmCksg3TqWUTFoKzO1RxHKGTR/2LK/+cSIhvCpQCOo/gDcIYftwCymB4AAjP+cxLjZPR3sKGbU
	vl7AYBGI142rZOQMiMeENUvO0/cGsAJS
X-Received: by 2002:a05:600c:a013:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4b6df5eabebmr51738615e9.19.1793984254955;
        Fri, 06 Nov 2026 08:57:34 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b571f46538sm144730095e9.5.2026.11.06.08.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:57:34 -0800 (PST)
Date: Fri, 6 Nov 2026 17:57:32 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Shan-Chun Hung <shanchun1218@gmail.com>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, vkoul@kernel.org, 
	Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	kees@kernel.org, gustavoars@kernel.org, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 2/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
Message-ID: <au4GkvPTXmcvReoj@monoceros>
References: <20261103022202.2139674-1-shanchun1218@gmail.com>
 <20261103022202.2139674-3-shanchun1218@gmail.com>
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
	protocol="application/pgp-signature"; boundary="xgc4symavcbtq745"
Content-Disposition: inline
In-Reply-To: <20261103022202.2139674-3-shanchun1218@gmail.com>


--xgc4symavcbtq745
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
MIME-Version: 1.0

Hello,

On Tue, Nov 03, 2026 at 10:22:02AM +0800, Shan-Chun Hung wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
good enough to provide of_device_id already. If you insist on full iwyu,
please use <linux/device-id/of.h> instead.

Best regards
Uwe

--xgc4symavcbtq745
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmruBvIACgkQj4D7WH0S
/k7itAf+LYAMF4hi693tZ3vEcl9qdHQIjdqKde20tlG9djgG8wsFu0VZ/opYIUir
Ba2Ft+nXyZ+omHvukP/oarePmgmCz7dlRmpi6tKOAV+werJYpdagvT2ZHxjF2/eU
SRq3hKVqHZVh/RS7hfRwxcPjy41xhU8PPT9ijH9syFoVtOUYbKKLjzdGTFdq0VNm
TeXK1teYk1wcOc1zWnVsLIdMk2DtMOGpFMisNxIvSXPHr8CPqfQh3ZhDwVLC6WpK
Jo3OwmvckiCe8ewY1FX7j/uIvM0c69sIBKKFnHgagXSTXFfhUgxYs4I/UgegsndF
7ViQI0kKjp36E6n5RxerITZ5eDHGng==
=zoc2
-----END PGP SIGNATURE-----

--xgc4symavcbtq745--
