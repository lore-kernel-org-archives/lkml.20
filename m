Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793171659;
	b=mZ0d1j7pLcyiHmpXFwxPkKDM6uPxdxYqxS41ZqN3odLYE/jL117BWoMoPfjpLSerwYaJ
	 g2rjsXeKJ71a1L6XegWFrB4nOzMpKlkoiI6OoeG/Go3ihiXmxgoHL65IfwBZ8vaVXXwZV
	 5ulE1kT1pBVF1H39twjrg/EF8jSFe9oUVo2oWfHRGx0z9+4h+skXEFXto15TTiCSE/laz
	 2iY9iUKw8uGJlpsIFWa43MPHm2lyyl3iD5PFyWqh9tHW299oGZWp1MdmtDpVkABubYaky
	 ghKb/CBBVrey/IUwSpkZC+FUqwTWXvRWxvXFX8RTMwCnMBA3GvimQqg9WUx1juq6czg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793171659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BKa12JHLTaIrkAY7wHaBaCVm5O2tQjU5ZN+Qd4lZVHk=;
	b=sGHlNmDD5FillOurBWJUkt7nYaHAR6npDEkXHfpnVpSr4F3bqIPuwLAKTQrbjeUcjj8g
	 JZ9YSBXSnqfjcpborrmFxi8QOVaAp7Sw4Nu9EbT7ns4u1bNtnm2Nvk0vLhMI0ua/3L/BW
	 lfEgqkzCJlXj3DBF9hTUgECRNyQJo3cdqwfe/R7sHVi9zsKo6drbvrIur18MJ8mggZmJK
	 AjjqM8xokh+XH6c9JgKZL2kyVu0/i484UZIJ7BqmdcruYrnQrI+stjdVN2lbiK/ON4um6
	 gSfHK2AJjVcEjdEj1zbiZPG5zJnsp4Fmy9OUnx1A7BhYQBbkgvvu5kR3/BsZOYg2yEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DNo5vidD;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90210606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90210606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DNo5vidD
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b001cd92bso299364f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793171657; x=1793776457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BKa12JHLTaIrkAY7wHaBaCVm5O2tQjU5ZN+Qd4lZVHk=;
        b=DNo5vidDAbaZyqt5DqOmh3lLhzHdSiDXFx9EpEXiGF5MxBHB80PQg6WPFPAu4m+3MQ
         G9uIzH2aNzbQXmQoY4eHF7uBgoZ9PnrPQ0C6WnniZ2JKW26vz195fWYBG0ylIyFc05LQ
         LaaM6Af+PKwaLf64NW/ZRalX92SvnOShO0UE2srbrHovIwi3VCioanRkbRZ3lUDeT61T
         5gFKraEKB1Qgi+bCL1dzaz9USpJW1jqR5rk2zwoPZ15oZpTF5JuPCslVlykXJcSbTkN/
         oCvLJ+lx6L46bR+wJ3TVoudqfgzZaI8xOc7/1tV4J3BiDlcfagt6qyJeB+wICmFIAIO0
         73dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793171657; x=1793776457;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BKa12JHLTaIrkAY7wHaBaCVm5O2tQjU5ZN+Qd4lZVHk=;
        b=eiEOZRi2hdCGzd/7Lmhyi8FLTi/RJKgG6VabQ2/NJKpy5FssNWQlfhkGnKfY8oNOGR
         TNbmP2ePj7h3e8aniGa8IPaZonscgs4vlFp/mnbyM9oApa2fSDoLD1VWp+4VVtarWsKl
         DFAjuLZPDaWUk7v68+owrTVZtnXvESjMVcqn4YOe7UnIbH/JqbkmgzLuuKOpKguN5KAY
         owi/xnNkgKRdvpAhD0JOmpji4xZQQyYDfeZ9yItXjF/bAfSlkNdflhpB8fXBznLjRA/w
         +4Plr9bU+xOJb0GINWvR6thzJZcKh6I8y8TmHzRs0I36ygFa2Ig00VIc6+J2U26XcvCa
         7ZuA==
X-Forwarded-Encrypted: i=1; AKwUvBz7W3CQvSwQM9G85eqZJQzRtcXE05AxePe2hlEI7wBKTiuBRbRyaTUq3V3pyRU8YSG/HGxfNyRJxpU0uAg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyMUB5oGzZwOwiLsbU0eMrZ/sQJ2obVj8jUpxXHe6L4qe9oTXz
	rjDFEzXvlgVDezaywEfvakkPAIPnnZhVcspScycKftEleRbOBBbWRJhntiMNBXoeiWE=
X-Gm-Gg: AYBFou2T83aSj5/2/4QQwNT2JZ7XbJ3+jyQXjMjQgKnpHu+I1hzD0VN3+26ttTYoIWY
	xJ4MYpvS+Iq8ItqkASz+iGiLXFh4Jzh3v6Z2HKp9VYlIoTwBvsWkDm+DLHoIxRU2Ph2tXZr/RG3
	rQWDq7BrTgP8vsP5mh/9wd5p0xHE/3IfX8jwJUhFHWL2r7DTdI1IXz5is6OkupMiql2lKEXwNSd
	EDh2lVNzdrmBSa0m8Lrl5uoK6I4HcJoi2J/QvPD9LW55gkwLSfbynM3YDwCDgN9q/FsmzAp8VxG
	6Np/pYd+sm3XR9rFgwg7xfVeUeDctrXHMv7rBWvkkc2I9+myjhKr5B9DcN8JqZ3Avu6/eN63FAm
	bBF5tz2WCukQ66nuJX2CvTGQ5ZQaFOQiUX6SibmYa1PvtGK3kqy27p+ouSuFfDyNhOLI2RYozb8
	EcrrslcMuzD1QWsRzSdmPn1brLmDnZsTjxbx419wu/mI3DvpKORtEJI5OwlPMhBb2Kb0O2UAit1
	bfhUN7AY+6QZ8mGbXr7MAYJpYccmaflI86t7Axa/TW1+iQvzZTkgHm3bQ2SFXkSjI3h+rCUG5f1
	oF5ujhmAJaAnYdvA3lEC4VWDPge0lIDFyXg4884Xjg4i8eve8GNgcE5ywg9DBvPBg+YWZltB4xN
	7MySgw4gFDMWBjXzEtedRFIbfoMS3ScprKdXr
X-Received: by 2002:a5d:5d0c:0:b0:48e:4300:c70e with SMTP id ffacd0b85a97d-48e5d5ae171mr3363614f8f.46.1793171656743;
        Wed, 28 Oct 2026 00:14:16 -0700 (PDT)
Received: from localhost (p200300f65f19a904c16506b94501b867.dip0.t-ipconnect.de. [2003:f6:5f19:a904:c165:6b9:4501:b867])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebcb958sm26969844f8f.21.2026.10.28.00.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:14:15 -0700 (PDT)
Date: Wed, 28 Oct 2026 08:14:14 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Aniket Limaye <a-limaye@ti.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lianfeng.ouyang@starfivetech.com
Subject: Re: [PATCH v4 2/2] i2c: Add Synopsys Advanced I2C (DWC_i2c) driver
Message-ID: <auGgVBEHvowseCt0@monoceros>
References: <20261027-tda54-upstream-i2c-v4-0-ebeeaf87d181@ti.com>
 <20261027-tda54-upstream-i2c-v4-2-ebeeaf87d181@ti.com>
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
	protocol="application/pgp-signature"; boundary="nb47bxu4r7dlod4p"
Content-Disposition: inline
In-Reply-To: <20261027-tda54-upstream-i2c-v4-2-ebeeaf87d181@ti.com>


--nb47bxu4r7dlod4p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 2/2] i2c: Add Synopsys Advanced I2C (DWC_i2c) driver
MIME-Version: 1.0

Hello,

On Tue, Oct 27, 2026 at 05:00:36PM +0530, Aniket Limaye wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h>.
<linux/platform_device.h> already gives you everything you'd expect from
<linux/mod_devicetable.h> without introducing a bunch of unneeded build
dependencies.

Best regards
Uwe

--nb47bxu4r7dlod4p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrhoMIACgkQj4D7WH0S
/k7H8wgAnGAwJoL+e+Le96yU8hRX+LS1mxggdmfwSPFllT2XuqUDX0fD2CksmHRN
8v/0LTJOU6dCoaLDgXojtyhjWD6aQ9eIBohBG9Ednr/skIStvCz9/G5CZOvayK5p
Bz4o9cdfMzCYj7hMfRMEhckEaE7stpZsqAI6PyOLDlPN2VEsTTO2eNWqQQOST685
hoxWdnS1aI3LOPzUubb0vITD+l10XFzqGI5Bbq0KmjyRy7i/AOYXUCw5GVPiDQPm
Dwqtw53FNFvSZP0fhpGHmzAU7GydBWg1NbRITN6AqYzvI6ONc0k2u9fA8GEUqWf7
R51YEtnYj75xSueedmapu+p+CeOHHQ==
=1P7c
-----END PGP SIGNATURE-----

--nb47bxu4r7dlod4p--
