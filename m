Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925023;
	b=xHjVwIkvQaQN5mcbljSIawhLRQU10+JAAJ5JIvAy8QsrTnQjTh61Jyn2xW3eAPRIpr+W
	 aturUj8eFbQ5/pbYh7IxXLNt3Ap1D2PFMcT25SyNl7D04oiXEuwg9EBkAErL9w6hgj7ph
	 7yPuFyxicleelWAVxqB/lk5tPnc9NEz1BjeFPsqrrBwIkf6toPDtsbp1NQPOSveo1HVFl
	 DgNhXwQBeURtDvCQuPH+1trDFRhYu3zUuVd68QVt4+cZnuuvfjodD5iwNV+NpQ+uB7MMm
	 c5lovqjTB4ng3hgawk8iSnhzHLAxnRjB+JTtFXiugKMrWlaxVqXxWb131hBi506rXYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=x9JO29Zxu9psPYe2B227ZLOS3zhz79wNDV9hTXqot3o=;
	b=JgEKiN3gGEYZOQMmRF3pJzez0GWuMX7sA32MZQ0l7i3R0VPJ3wsROmOlPXkBGK7A7nLN
	 mA9X354GKqa1zAh7Xy148bPsZI2Xk1rZt/RB8FIL+tgiK/jCtIROK5q8hiKXwwkX82Lvz
	 E8Mq/ZMb7Y4l68yumGB3xJ3FWIPwJ30OZp1KRVqE19QA+ss2urJAImdeZmK531Utd03JR
	 L5BZj+tTf5rThj4Lltl3Y7rtZ9aU9kh0NYvNjgJlyfsMHQR5kuQ6HSfvn4voIUotH98yX
	 zpSG4gQ3j0YO2pAkrXWcVeMlYStKmDzafRdaYNCdUTypzD5khbACK3h8oxYTnsNCz6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RhiufrUh;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48331606A8A3
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48331606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RhiufrUh
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so22703695e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794925021; x=1795529821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x9JO29Zxu9psPYe2B227ZLOS3zhz79wNDV9hTXqot3o=;
        b=RhiufrUhYJjBG6JUCzddjd2k82NGjiJeZaYoGiaT58Y7S+fVxjIS54WriGq1omtvWM
         PA7cZQqfLrVWs1Gh+LycF2b4oeoWhq7JnbPNlOoPWzNjhgEH0AF7+PLDOu6BDrVBNuc6
         LSiAkOFjys13B/uRMy8s4B2tsTv59JmsOtzAsfz/dL08Zojbw+It48Y/TplltTPIAPhQ
         85vJmubk0JRqhSYOSfPbeax/RRYgzGEzSJ0uo5K6T2gXNxtxuWO0t9rhEmE2mXAGQTvk
         j42MgJvjz2VicHJxqMnFubHTuOCspZLJpyxvpwwjGa0BmsNKWEvdS31u0G0iwXW3orlT
         LtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925021; x=1795529821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9JO29Zxu9psPYe2B227ZLOS3zhz79wNDV9hTXqot3o=;
        b=WZVgCi39Hbif5DsVhQxHayGz6fM8lp0TyGOGH3AEj+eFCXe+WS8Qe8TW2JdCY9lupr
         gklMzzp2/Q927YZaAkOQGIk8/4u12p0ju7pIEg0IXQbcVOs8JmmHT1ibGm1slIkK01WR
         vEz5JTOPUYOqa5/G0c+V+KEzW34xWo71tubR1oVt+1A+x1jHjevoW5rv99ANIqepiFnb
         nBv51PqMWMk0C/Bz8YGVkQzPCHwYtsDQjxiVjH5h91mR2bJQSU78CAYB0i1uQtHossVn
         VM28mHS8gQi2brN1LY7KFi7opdRALtdSnoN2FXOvtZahCXNGVHZwdxYRWjESrqloLDD0
         KRRw==
X-Forwarded-Encrypted: i=1; AL+hErFAQKyvrS4awGfNPBtqTjPijx5i62iz9xDIMd2wrwF2DZBlyyZQgffJ+XnyHIOX2xKQfwYYFy7S1fSaWbk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sytJZ85VNSRicBCFG0NWCMR238eB4VzeE/uxmPD5mJefZ8O0J
	T2E7aW3ra2rHGT1wiuOadgvoMWVq6XOf11lElc8r0+Zubefb6mffrlJLQq20bssnvnc=
X-Gm-Gg: AYBFou1UWsy8tami/fN/FwqJODrY9bU7dtn6SGsMu8IEy34Dm0qJLWUb6CzW0msw2Hj
	34I3Lt0fYxMa8u21eUoJjMADISH4fZCG/6y5KbFLkO2R9IzETxnjuJLXhPgfDvxEevzARjvuwEj
	5fNJ4ja586I3INT4QWetop2BnCmVQOgVxdybg2G8LxHAY06E6P0Zpv0rRDGGbGj438MCUmnhfeZ
	ie6lBrE80V0nd3SjnBmeTI58wcizCkeg7yz5P6THQdsi/e8K+7AzAu5KKvwcZCb/K2J4f/D39dD
	EOgBuq06UMA45/2qm/NcZXMnyqYMmm2Qpeo2BPYbFDeAq0EPmrQ3kPnE4NMghTOJVlaGRg7mXpb
	8lhPM6hw/fWJ6ZpeMSmJrSktYreCnqLrYLn8fCai1fPeMaZfZXXYVIHQahzBH8VIDkcKDGb4Rfc
	1NvU8hPJiVLiZuK48LNvdJjmwM28lo4fp2x/sciGgxyVB7e0IndPe2E+9CN3s8SVpRJca2QThfp
	KGl22yNXwz76RzWKUXaHWB9fW+KyZ1SDT8B8yx/l74vE0btWhT/9qT0a1mK2C+ZXLWMgf1sUC3A
	WVRu/eZIR/Amv7fLaD+HKDVCpOKuvbEVGPrpC0oQlLSXoKbpJ7coBvdxBwGjY5DLgwNFIk+Cr5b
	2pnFcwa/tXcdIUOk=
X-Received: by 2002:a05:600d:2:b0:4b0:a307:46f8 with SMTP id 5b1f17b1804b1-4bb55a57c2cmr223922505e9.10.1794925021592;
        Tue, 17 Nov 2026 06:17:01 -0800 (PST)
Received: from localhost (p200300f65f19a904a5ac91f50e61369e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:a5ac:91f5:e61:369e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb5f350d51sm125990395e9.4.2026.11.17.06.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:16:59 -0800 (PST)
Date: Tue, 17 Nov 2026 15:16:57 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Zi-Yu Chen <zychennvt@gmail.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, ychuang3@nuvoton.com, 
	schung@nuvoton.com, p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] thermal/drivers/ma35d1: Add Nuvoton MA35D1 thermal
 sensor driver
Message-ID: <avxhlPnmjDhZlUmt@monoceros>
References: <20261117060501.2611071-1-zychennvt@gmail.com>
 <20261117060501.2611071-4-zychennvt@gmail.com>
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
	protocol="application/pgp-signature"; boundary="qlzj55hqn4bynrzq"
Content-Disposition: inline
In-Reply-To: <20261117060501.2611071-4-zychennvt@gmail.com>


--qlzj55hqn4bynrzq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 3/4] thermal/drivers/ma35d1: Add Nuvoton MA35D1 thermal
 sensor driver
MIME-Version: 1.0

On Tue, Nov 17, 2026 at 02:05:00PM +0800, Zi-Yu Chen wrote:
> +#include <linux/auxiliary_bus.h>
> [...]
> +#include <linux/mod_devicetable.h>

<linux/auxiliary_bus.h> already provides auxiliary_device_id, so please
drop <linux/mod_devicetable.h>.

Best regards
Uwe

--qlzj55hqn4bynrzq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr8YdUACgkQj4D7WH0S
/k65jggAtbkfrltbaO6eNfAgtd7yBmZsvKQs9ZqNLrv/4BbdaUEN9BpWSES8c8TU
8A28wC5BGe+pBDAUyMn8DquMXd9blMhvyFP+4MFFbx88o6fVpv9av+03ek1XBeSb
s75G4PhGBqkTX887zZAsGLJlbHctBxujR/+IjNM496gRWStwZ6dqjd+ar6GcTdDC
I+QeQmgJl08pRBwC03L/nY9R0n77kzF2oj3u1zOO3OOnyzkdGER1z4P2EDYpsI3f
LU58xgiNfDdY74WhBJPcEY0ZzD8o6CU5N8xms4Z1ry3OCh7/QN+QiuFyf7ZYUj7c
wc2kMsQbp4G56o8VwLMzjqTwTjKdNg==
=gJWw
-----END PGP SIGNATURE-----

--qlzj55hqn4bynrzq--
