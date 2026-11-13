Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551339;
	b=olCcK0BJO/SFd/aPsO8LALCykb8iakqSbotjWKsYeV7XXHG+g9STFi2zh5I7kg60slfx
	 aNuQ3ZyQuiRsJEqrjSD8jaHYIBBr/R/uAsu8MUW5Ba4wke6z39DXI6QC/UgeypVbG2xV6
	 fpBnS7E6vNZ2mJJz4lf2PbfAI0xz3nVALBNmmoE6tL5Ck8qGqqIoeTe383lx1JD9bIpAP
	 TA55VXu1eNsnJI957oEQvHclH7Q2EXPLX5Gb9vhlAwjfXsI1pOD0rCHGEPuhr+2ka6BVb
	 Nc/ZRYpcP7Fjop0DMit6iFHLcIiG8CJNtb/rfkuJjeWNSEf7PV7hBKwExciUdUaJFrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=eMtI/QvyBu7WYuIQjEeNFc1ytajl1TcdksT1CryvP7Q=;
	b=WaMxG49+SzVMOguYyGSR76t98LHwzgKI6U4cFLwM29X3dN8d4dky8QyMF+cbh7DhrXvV
	 aPFakIAd03pZlqjpJhKIRFbQOnJ1KJIBucGFXKVGJtOH7hrQM/ti3vtRNk7ocQ3tZhBGz
	 YfnSaY2FHQB5rYUBO9nPtnxMF+zbQ6tGErLHK0UmgLxnSwCa+QPNCXg3mg1yc9oU03+Gt
	 3ynlwlhPAEkxQ2+FNcahrX8AGwXQaspIxFJqOcqNq0CbWfeyThusD3MkW0qJJBUpkh062
	 WzVl+JkAZMYGaOxwC5YOLyXdsNGtUkedXJ10Ra4Nx3Mp6c39oYkHmocxNwLQVEL9EQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cz+kn4Du;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CCB606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5CCB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cz+kn4Du
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491846221ffso537289f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794551337; x=1795156137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eMtI/QvyBu7WYuIQjEeNFc1ytajl1TcdksT1CryvP7Q=;
        b=cz+kn4DuwLvFxEnT1RdO8AR1F0oXhLYwqMLGi15pJafOa2ZLuQePGzmS7ybyfi+k4R
         WYiiGoHG3sb31cMtl1+ZxQbkXtMAi4UZF4EvnXICafNJ5fWBMHe5WQVzeeJICIx8nvsH
         LiOi25YLkt3ocFE/UzCKppsR+wA1Ug5dI7ymde9WPwJ/rIZEJ2Alei2RTLNgGDOgUOOA
         /k9+0wb46DDy97V5Idh86mkwudDy+7/Mqg42ecANFcVbDlMlQ3gtFoeW9H2Dr8MOqVv8
         XMiA3LXF49UOzeEfJnuFw3IdEUPHKbg0Jps4yu6DcRThZHDg5FpWnNmI7Efa2m/LQQuN
         h+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551337; x=1795156137;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMtI/QvyBu7WYuIQjEeNFc1ytajl1TcdksT1CryvP7Q=;
        b=c+Ycu90AmxS/amo8W5PKuQnYF78qy3zowcJ5Wlw7Xr6IUmZgfiKQrSDxyS4+4SvSPQ
         Zd0IWRGQ46pzZbTuUnoyWwD6a2+kgFVXgnmB5zYDmYeZAa1bFjpxYID7+umSm6IxZAYZ
         l2fl0X41o09CDhTh++ysQP5Lb8SkJ3rXP2dUr12ukxnYdgtzV5wLcnbP7MAgcMM+O83k
         sZGnsgeIjMcMU2+phniREpe/HYQXyqfmmMapvTeH6Eu5ffh6mpQUs3gWOklAa+aY9Vt/
         P3cWZGCQcqEXQeY4pLDT5cmUcI7yq2I98QpHuDhJGPW5HWwJ+PZhDEpQeHC6cvHVs9W5
         DyOA==
X-Forwarded-Encrypted: i=1; AL+hErEa8PG48qAhX8vUlY/duesQr2i4/lSCGs6i1OLC+E/6QHSkT2kEE3P9hYM8ywmADZTx77MjeNB7zu4R1mQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2PmQzl46Ulu0BLiehYjJVhg2olFRMNqwMgkkgT4q88YmcS4ul
	2fNfZIukdJkfcQNc2rGPac8fmNl7UiR3sfMi5r9xiLvm2L3lmn8ZeI9n24/lOljwlPo=
X-Gm-Gg: AYBFou39vLbBRjg3dRLJPzf+F0VtHxiljpv0gCSXLGQ0z3uBVTn2AHkDmi8oSMJ813+
	zG3sObCHzNtquOzQl+5Iv2LMO9B4yRVqaPSMqseUo+JOFhQUMWLYcrNEDfD33t780wvjqkeXLEx
	Qc7x8+BOrW5w2+7loqMkxS6z/hYz4hRngla0kRVtmFWC69bAY3QifNhi8X+wP3jbPKNLJ1IYmTO
	1NSlQeTw+0F8PZ6dkqiIe851X6QOphvtyWqHuHxS3Ug/3kNkCpZLO22qMXq7equbU21h30WmxHd
	SWjFkv5owuh4imPTEnzvONJJRrnyC2W7HUh1oPlpmmdziNlIJEs3eM6Q/SF11VlVDe94phiGXom
	+87jrB+PGJz2T63yX9QRJOG+ZoDnfQwqs70iT4yDg+r/zD6SoavEfNupuOneCW89e1UvaOW6ZbH
	PykpQKgOMH680BJmyWebqxzohu+Wdpz7rkI8reEyijaOPZoOAeA6ztdMLyseUF0EiRIPZFHw3Ky
	ik3ikEFoW/S+cSeOf09FTAsYjeAWTUqiPhZCKTs50H5ZNddytV7sh4XXy9qx1M3GPHuh99AMPCr
	YT46YcLUv8rBUG5E4Spne64n7Z9HmG/EqgiGDJ+aa5LmZJ1+jyrBCk4i0d4+ZPZyicLH53I03A=
	=
X-Received: by 2002:a05:6000:2586:b0:48e:2f7e:bdbb with SMTP id ffacd0b85a97d-49c72c9c8b4mr3464138f8f.50.1794551337038;
        Thu, 12 Nov 2026 22:28:57 -0800 (PST)
Received: from localhost (ip-091-089-005-024.um28.pools.vodafone-ip.de. [91.89.5.24])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49c5fe373casm3174771f8f.30.2026.11.12.22.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:28:56 -0800 (PST)
Date: Fri, 13 Nov 2026 07:28:55 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-input@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] Input: keyboard: Add Nuvoton MA35D1 keypad driver
Message-ID: <avatz4Q8JbrAJNn_@monoceros>
References: <20261110111419.89535-1-fyhsueh4linux@gmail.com>
 <20261110111419.89535-3-fyhsueh4linux@gmail.com>
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
	protocol="application/pgp-signature"; boundary="a2ifqpif6owwxnga"
Content-Disposition: inline
In-Reply-To: <20261110111419.89535-3-fyhsueh4linux@gmail.com>


--a2ifqpif6owwxnga
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v1 2/2] Input: keyboard: Add Nuvoton MA35D1 keypad driver
MIME-Version: 1.0

On Tue, Nov 10, 2026 at 07:14:19PM +0800, Feng-Yi Hsueh wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h> as it introduces a bunch
of unneeded build dependencies. <linux/platform_device.h> is sufficient
to get of_device_id.

Best regards
Uwe

--a2ifqpif6owwxnga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr2riMACgkQj4D7WH0S
/k6KPAf9EQ0HGivhdceUuk66CUKDwtvjh/7/jjrthGgkb+pdJryDbkedlXcCKjK9
b+TSwyp0Ij45TIIFMN/ZFfLea+1FM3nTPndVlZsIIDgJctKr0b9642hqhFrvkbPy
57e6YCZlJnH+P0baX7Z7JCgbPo34/RX6nn3dmY96cVDPx9nlO82bZlUKT0+O81nc
6nAdhy73QjVG7hEQYipP7SJUFRNOCOBxqjT4iIelWp8tvmFrMUdux3Yi2kmSL405
R0HXdDse9VWP/awUS/rl6ACGhds1ZJbh03SA5seeuZxX/6xVqbyap9pvvDIndv21
UM+9r6MVkXax2D6HXkYWSiATc2X9cQ==
=FoqO
-----END PGP SIGNATURE-----

--a2ifqpif6owwxnga--
