Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2855B38E5C4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789538175; cv=none; b=sksvLHJ9+P6Kf/LVdFXVNXFMG350ch4XlXhUhTj7h7FhsLcJajTBH0UXOAV2TiHdLFVThFeBvvT+LGEf6r9Mbh6D1MKkyhPRQRSGxeOr1MnYRWyaDkzclssTXxnmhJ9Q+K5PF2oYgMD56I0tCqfno7vHacEw2p3smc9rrXYaFk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789538175; c=relaxed/simple;
	bh=YDrlUDvMNBzeedt1bGsJpvHp9s59040KbEWQ3eLNusE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2pYKfSeS+/1qXqyQ+krU/uK0yg0yUuwsUx+aKQuTTRAn79vYnrUq1KXuaOSm6FWwmHVFm1Zs5urmy60cwXIHIYUpNrivyscpJCrO5sXPOcNeE9hGba2Ksf7z+KrkR1VZr7WgM7VMAvArEza6vEeU7vWFafzLQFeaVLqB1mpqZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OCSH1hfJ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OCSH1hfJ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350faaso195664f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789538170; x=1790142970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YDrlUDvMNBzeedt1bGsJpvHp9s59040KbEWQ3eLNusE=;
        b=OCSH1hfJGFyvYEKTsBVcb1zuwPFUfMUlm0Qeb293vFfhrPt9xrLcmy3ta0VxUhr8lD
         gh1iAMBQbz41oQ0XOxyZwe+/rc6QbmRpe4Qp+AjXOr6sECjEledfvKq+B/NECWkYcab2
         KyAR0ZJafplj7ftl+noIbr52MhpNTeI3Yd7gD70fxjR+IrbajEu5/e2301wKAGJoX9V2
         OFD4lGY8scfWFzAMqOEioQdFNI9yD1eQaNcrQhkicIxEX+d2yFbKDgNAYo3Y9uVSgUkL
         sGl9XIKeMW1di6jvqCJ16EMDOL6Le33ksd8g1IkJkIOmX5l3zjgpblqQGz3jyzlo1Gl3
         vEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538170; x=1790142970;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YDrlUDvMNBzeedt1bGsJpvHp9s59040KbEWQ3eLNusE=;
        b=Lg8ReHmRTKQiMYB9ZWrVWIHOCEquzzXcwvhijQgsYnpEzaOcGBZMMK0meA6quYVVt8
         +8dRx8OwgpGpO35uDZGKoFwXqvDKbCLR/yChPklKxyvi0GZD1v92mcKLY4pvm7x505qt
         uOP50e4wZ43Rgv1MyTkFTtOYeFi/KTRCvbQ/CVKl9HnGpYeA59L5nwMnM7l6wQIMWR3F
         HqxvyBcvOPep+8oSzKmAVSKsaptf1rR4jEsR4SedPyX6Vx8SVWp8BF2BhMTXpJAwhF5v
         lH2eojhdO4v1NE8kIsEI6qXz/3EYC3p6Yi9qxi3qEiuIpK2krmFLkk0YNXQWk7v5i3Yl
         5MjA==
X-Forwarded-Encrypted: i=1; AKwUvBzraVWn2PHrX5Hv3oerfpvrACg9gypMETslzCx7gnWmYvNeGyenlneF/3psabu03lX8DlBUBGbtq8Dv6DY=@vger.kernel.org
X-Gm-Message-State: AFuF++lsVpCBQ0n4vsyToz52HQQNHGS11k2YeGFC0Q3zfyi/XWIiRc4r
	vP1c1GngX+nzvMic3i5VzJIhsZjc3JDKSTQJrfqoZLlKvkQo98USAg2JtAIV7eMWPdA=
X-Gm-Gg: AYBFou12Ro/AUZuEs6NxfCNfPnkSmu/95z8orqknbhx8p2KbgvteQiRdLUCFbtrA1Dm
	hEaq8ITLKH5SYp5KbefpYg4ZQE1U7D0haxrieOC9CaTR5WA26/wKZE15eeAx5y2p3Pqhgb8JXma
	m2IgxAwSSTaT8nHFPPUMeE9UeclODJgZ3oXRBpKU7Px7+CZIrEccyWCdmKAN8oLf775zFhJ5VAu
	HeSxlpIIXwSfFk2e6R9pDjotDDETw36yXeqM6HmtADLBOVxDGvS52haFrUOGEdo+Vyo9dwozGkk
	8EuoW9xvmOpm0LrjRjak4zbZh9N9tKaYx7H9kGKclb4AeTqr16tp/BQreRaapCxie37SCkK56lq
	3LSjN8zRDUbLxC9eIhXHM5soQbQ8/NmwREOZs7pIK2Xi4tALej5haT4vZLJKp+JQlN9+q6WJM/s
	MuuGwazAVCMFqaqCSGMzpqRd0BnrW+TwE+nWrAV2BQVfJtOIvdN1rq16RObzKpXue4I1xmt2UiY
	eVo
X-Received: by 2002:a05:600c:630e:b0:49d:2536:402e with SMTP id 5b1f17b1804b1-49eb733b329mr10380455e9.30.1789538170112;
        Tue, 15 Sep 2026 22:56:10 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49e83a8d6e2sm53229655e9.1.2026.09.15.22.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:56:09 -0700 (PDT)
Date: Wed, 16 Sep 2026 07:56:08 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, 
	Martin Roukala =?utf-8?B?KG7DqSBQZXJlcyk=?= <martin.roukala@mupuf.org>, Lukas Wunner <lukas@wunner.de>, 
	Magne Bruno <magne.bruno@addi-data.com>, Crescent Hsieh <crescentcy.hsieh@moxa.com>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH] serial: 8250_pci: Catch up on new pci_device_id entry
 without named initializer
Message-ID: <aqovRVuGLvfSLLPr@monoceros>
References: <20260814095931.1871387-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="je5whjz4kcfst2xv"
Content-Disposition: inline
In-Reply-To: <20260814095931.1871387-2-u.kleine-koenig@baylibre.com>


--je5whjz4kcfst2xv
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] serial: 8250_pci: Catch up on new pci_device_id entry
 without named initializer
MIME-Version: 1.0

Helo Greg,

On Fri, Aug 14, 2026 at 11:59:31AM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> When the patch that became 0481a041e956 ("serial: 8250: split Moxa PCIe
> serial board support out of 8250_pci") was created, commit 44e55f1f3088
> ("serial: 8250_pci: Consistently define pci_device_ids using named
> initializers") wasn't applied yet and thus added an assignment to
> .driver_data without using a named initializer. Adapt the assignment to
> make the array consistent again and re-prepare the driver for the planned
> change to struct pci_device_id.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---
> Hello,
>=20
> if you prefer it, feel free to squash this change into 0481a041e956.
> Otherwise I don't think this change justifies a Fixes: trailer, but
> still it would be nice to get this in during the upcoming merge window.

Is this patch still on your radar?

Best regards
Uwe

--je5whjz4kcfst2xv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqqL3YACgkQj4D7WH0S
/k71ywf/YbVPFH60lpZrTvuIli8KNRD6F+vVu4BYnWGkmnfvdZvvIaQrC+5+Wwjp
85RlVti4PJMPF+a8ulsoCzatwyy6WtklAsousWKOy8ZgttjwSNrrSC5QeH//zYWk
DDP8lySTnxx2BESkGQ7maK9IQimUm7XCAX/XX4N6g5+/5+1YPyNEpZad+bD1MNPU
CGZoqdW8bWOwmIA79H5LVBtBEgwaIl7qkN2Kxq/NkLHPq+M2XUlcQ+l6lVeEvcRG
PkZjk1rD42CSwJflKvJCSpR2shs2bjFrQoiPAqoqB03A8wRAorsR49IZjQcQNMjv
exbz/IBzk9ZITpT5Fvv7pbo4JJfQ8g==
=m5L+
-----END PGP SIGNATURE-----

--je5whjz4kcfst2xv--
