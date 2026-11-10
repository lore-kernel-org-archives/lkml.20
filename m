Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334564;
	b=Hz9YuLHCq3glUdHUGcjCRDjTiT80KVEqa/dA/3UXAB+MUcgSfcBLM1EdYUHN4YJZqAtF
	 iBWY3BkIugOpkEJT/j4z9q9U18YcZ7JMsTgXZuzTArSShuR151YO6A/qJJfc5Mifbq/uB
	 4Z/Wudf4F9ds+1mvOoqdYVa+o9T/Rvazu56jbC8R2kgb0PFQS7q0w11ueYvtx8xUNnJk/
	 XFZwZYrCHjQJXidhj3a8a+1Mu25Zm/SH2Ssv1jZrOVljFg5E1au/GaontX1XEjz1+gU75
	 Xy4iJocGhgViWUtVubV1d10n9mBwh7Pg/EzGjQWMd5NLu4Le5uhxFHC/z/fZGG1fBog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=z6U6FpbzzvS5LI+ERYtO7UsBLjjGtPf25ssraLozBHE=;
	b=gCpkPW4JABCBdNnZaHK02KEqu/bvijhsgpSubbpNoU0T7cqIWnSHXb6Nsd27n4xy0e+7
	 OiWj4AdxkmndvLjTlrxvPQicfCQpj5boXcFxZxYXaVFSyW24dGcHyqxy2xyNI5UnZjiI+
	 aIYd/eaPmhV0bOnvqPR044C0/pigELzmTyH4u7I6+NpO83lA8FaPrzdHqbog4Jeq4fwyl
	 9l6cucLVxSJ417rgohV5zGtEhbkvzFibZbfOdJ2Y0iGnV9f0AYHrV1M0q8/ITEX4rGn0q
	 sGspdP0XyefFw4Uo0vGGR70kRzmeITBiUk2GJmGeFC9Aj/c4sUNndF+7vH/dBgfzYyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=c5gwBwoi;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030EB606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 030EB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=c5gwBwoi
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso17218285e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794334561; x=1794939361; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z6U6FpbzzvS5LI+ERYtO7UsBLjjGtPf25ssraLozBHE=;
        b=c5gwBwoiaIx3CpU67FKoHnOJIzU3r0uBZMy++pMDIzkuP109BnHEHut81orpv25eXa
         aOPaV8UOHApiDKGNAbwoRqkZqKWEn75rOpAFsAHBhF5EiAIE/wdvvP/pYroCPK2Y4F1W
         phGJlfM1wjqWNZL/XRyrkrp296FTW3WNA2W8se6fC1F6m2/RsTAHkIdgbGB8A9aqEa+o
         7qpZNg0d2hAOXhmfo4nkyePHxYjFO4ai0POK1U3PkvQ9JP6K3LjJVSip9Yu9nJrA1Y5L
         3a71Qhv9I3HqYq3Ud8R5jo84pkniAw2fY7u/5Yhduunrwb2bnKKsZy9ldlKsQ1ORNoBt
         PtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794334561; x=1794939361;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z6U6FpbzzvS5LI+ERYtO7UsBLjjGtPf25ssraLozBHE=;
        b=GwAInPvpoSs3tYSGp6pxTwZQ4IAe1S33iVVAAhX1UtFC4tQoAo8A3Go0vAXBmxXUP2
         3NuFMMaFTCY/KF9Ymplh0u9YjYNaRVr3VC1fwmdD7VBYAebxo3+eL+m7uK/Jwpz3Kdp2
         IG8K4Ga1qGps9VvafHzYGI4B33L3XjsmlGWvveSeWbCy1xz8e9XZN6jdPDJiAy2t4U/6
         P0STHPxT9mMVe94F2vxCRH5Shx+gFT9KN29zpeT2gpXzso0SYarkKa2QiHMbEVNKtBF1
         yqIUdzwiaSQVJQ9tF/Fa6yVlSBVlHHbNQMDnFI8esHzew9sNBcvIfDoBRThVgWepCBud
         FGIA==
X-Forwarded-Encrypted: i=1; AL+hErF/dCBzGQ9GpLf8S6bMK/1uy0dGXxSCRr3MzTvZ+r6vHiM886UZ2Ln/GyAzjqOaNhoHEZMViDxZ1clgfYY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RyPwuozEy4X93IlVLygJIpn23dzmHECn94N4r7OF4KoQmfQHW
	OP8q5wWWS3lRJDuATV6sjGK2ygOh9wtnrH50qefURxeIlgZGbLIaLnT700nD8Yy331Q=
X-Gm-Gg: AYBFou0tNGmcnJkYTlsBpBzEpXmOklK4bEJBXfBVEliaBFhuZbMz95Lm5635T3VF0xU
	k1PlkHy789JUGNykpuNABwRF3OI/7Ousc8pyd4JR0IUkTRbydLkT8PLPoeY7KP5N+NfFqsSrhez
	ftoOopu/z958muj5Rca1szLCjD8/UtBR79Dph7+Irh/HMuUSome8mQxXndFomOnO+5okejCEBpj
	+kLjxnD4j0xCPLGcy1IqvOGYGsIc3CA6SGnu6qetJHPoTd0j9t1QsiM/WICd1zqQovabpbeM/rQ
	ncQwjJit4Kn0B/Iz0vnmGl6egig7Vjs+A9SAD5rV53IFPuCIzdmxXAb+nkbF6n7RIIxmMnljB14
	M2yicXMPdYd1tP5MgKw3z7xkzvzdzipecqLIZADFSft5Z9Mt2q54XrsjW7fn3X6WzhjZBfq7iO+
	kkhH9+49LrE0LNoQ4/w1BpQeJwutKmSNbFP5ya9MT4bwvV9OhU7ByIU2RI47x58p3GKtGqCayN7
	DxOuh/Mwxo4/wD6BVks5yAQTacAJLmr/DsdyD35oSQblrwjL7qq0D/8m9tlQrqPN60S3lEeugkS
	G6ekQqcCcNmJbLY7Xm6oqTkw/tDNx6mKoCg=
X-Received: by 2002:a05:600c:46d0:b0:4a3:59c9:a744 with SMTP id 5b1f17b1804b1-4ba0233f8famr60939385e9.7.1794334561387;
        Tue, 10 Nov 2026 10:16:01 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-498366c2793sm6345472f8f.45.2026.11.10.10.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:16:00 -0800 (PST)
Date: Tue, 10 Nov 2026 19:15:58 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: slave-eeprom: Add an OF match table for module
 autoload
Message-ID: <avNe7fvRYxzM8DBe@monoceros>
References: <20261110-i2c-slave-eeprom-of-match-v1-1-8f762bf06205@gmail.com>
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
	protocol="application/pgp-signature"; boundary="tsphglliahufncpv"
Content-Disposition: inline
In-Reply-To: <20261110-i2c-slave-eeprom-of-match-v1-1-8f762bf06205@gmail.com>


--tsphglliahufncpv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] i2c: slave-eeprom: Add an OF match table for module
 autoload
MIME-Version: 1.0

Hello,

On Tue, Nov 10, 2026 at 05:34:54AM +0000, Arun Iyengar wrote:
> diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eeprom.c
> index 226d722af662..a08abd895412 100644
> --- a/drivers/i2c/i2c-slave-eeprom.c
> +++ b/drivers/i2c/i2c-slave-eeprom.c
> @@ -20,6 +20,7 @@
>  #include <linux/firmware.h>
>  #include <linux/i2c.h>
>  #include <linux/init.h>
> +#include <linux/mod_devicetable.h>

Please don't add that include. <linux/i2c.h> already provides
of_device_id without introducing useless build dependencies.

>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/slab.h>

Best regards
Uwe

--tsphglliahufncpv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrzX1MACgkQj4D7WH0S
/k4ZuAf6AzDGV+OZfRfecYYUtgK18qNGOGiz9fMIIWQHSs/c4iTYZygLtkO3jI0g
FkqXbzipF6s/RQKiWM5GStlNT2ne6Acg6LAyrRwwn6vMrlbgi1ii8YZNN7bfu9bT
xp2cLTukHThMhNX4kei/zPFfy9lezFZ+kZk3RQ2kI3A9FagFSglpX0aMl/JQv58m
yUQsCTeNO1z2yqVa6Pu+ne9Nukax5qUSAZJczgLct346YJwFKC0MU+hNHtjMX/St
QzyL/80P88O2GfI2IWxEYlSEcNC1Fy00xIiiJ/4C/gcUdePKGJKN3pHO3WGTrYjM
CW9v84TBaNLQo/5iIv0ltA4Kicvxbw==
=ie5Y
-----END PGP SIGNATURE-----

--tsphglliahufncpv--
