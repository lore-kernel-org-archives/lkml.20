Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327A049364F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396313; cv=none; b=Td9jYcMU7gl+lb7d8N2yfvnOlv00VAt38IFFfMipbAesD2VdQso9ZRg1DmKevRyJIwMZamYOXe4/Evi8GM1J38f8ebujJdT557Vr5KC9tFWS6TJoubMbe/QRqJpUjpILBGP/RGP/QlPwBnzFfeuzz/nkqBdhSzqEvEum2ZqjAh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396313; c=relaxed/simple;
	bh=gmF5iz6Glgg36+UeRbaGY5yHQ6NvqJW35XDnkD5cMXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJ1MnsIJUzOTg0W0U5v6S4nOBeObEsdszEI1mGww9Nj6KRqjbeMotXa1L47CjaVp+bzKgFrGQKUX9zF2Lm/l6JhADjmxOrwHtB3WpungLx5qf+zwZAczKDs79pQX2jBc4uiLylnMJnMAdps7XxMYErlbfWynGsjvUphS7vr4RaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=elM7+RUo; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="elM7+RUo"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso15397195e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792396304; x=1793001104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gmF5iz6Glgg36+UeRbaGY5yHQ6NvqJW35XDnkD5cMXA=;
        b=elM7+RUoitnS2/OkT/qO7k/+0frzoTQFqnSbfzzA2EsEEZ72jWN3hOHtCdX8HTCDU0
         nXhLT5bQ8QCdfQdDA06e1U2WRZChH2U9bLOCpuDbPYZUBWVPOkwGvrkpcGheNCo7DYn3
         +scny64JRXCO+ZGSxa7PzVkSkBVGLXAW04k2q218ep2zTnRYCwWXdlzsGnO6Srb4naeq
         Yk9mkXDCPoD1xfi96A5wTXRd6bg14w2VJFsL4HUIEyxsTNWqXJ/gHJvDDP/j/KR/8Vb+
         FWD2A3e+n9li/8P8LUzGt+mBCSmLe6AGqsY08Z2ElcqN0JThoej1j6nDPYbkKh3O/qb8
         5KJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396304; x=1793001104;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gmF5iz6Glgg36+UeRbaGY5yHQ6NvqJW35XDnkD5cMXA=;
        b=2Up7sFyk0w5Z2ss0D7wZD2Q2yAj9JHPP/CX2NpFblJUzd/zz+EYznBStREm9v985SK
         dz0atfViLNCJMPim18zcogLDSqHetsCS5hs9hmsRLS1eSqLimoSo/JxACjOGAWVA9q2t
         oQCdOApRxoexIW7vFkFHpulKS8FqQ2b01HpEjNG9kUIgzl29Qu5nxN+jpZvpMZOI3zZR
         p4inqTS8lcOdto/j/Pr/bdWjmDq5yIKCxND2B6WZmTL3cUF8MYFfJVNR9M6owQkZI51J
         5/Ap8d795pbW5HW3/C8z7CQxjrTP7n9L4nOMwEGi6SrmfaTom5U2a5J5MGqh81LfrB9b
         b7FQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmGz1+EWj57lePmOS0wcTOJZ5/ZP+iMX3I0glMGX8xXXjjFb3htEGOnfk4mb/VSekLY/p5XO22Ezo1yx8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLz8sNG7jC5bCuiBGSCKLYnl+grf+LDZ+XlTyueaH9rc/89e1/B
	Mh2xOZO2M2Xx0zLtIdPc0MVGbPdt8gIXZ+d9hNYsUIA1VNq2/iutAFPGNUZuJSe7W3E=
X-Gm-Gg: AYBFou0t34nTP6i6nCXEazNcUvPAhpc/vNjL6NyP/0mFmKtmRV7sPa/eg2HZwcStZNy
	kg8Hvvrd84i0o3bdUUHoGIgV+v+3KcVx5prks18HNirMRVcmHRonqbAzIDrRAOtjgoC7PYrpNZ/
	3iow7ituyQBGTBwnMuySgMMduk/V5lfYIoJkXECqrEscBdnieYiMYWUoFQtTV2Z6iwD5icYvOGa
	5nfFXxDFxxFZBdq7yltCZ/PcaVd5wXVlV7pUU7CwOj1NyPP+ILM7816ZGUVEThTGdih985N9A5x
	Iafr4YfC3feCgPB8hlGK0wbjSSMJWCyqamCpINZ8G7L8X4agDi6KSHF95JWpibxMSfYwT8M3xzZ
	nGy9MJ1xvF8yJFSSsW2llE9NqG9J82H1Jm+nTS7P13GgGsp1z+iILpaqZIKxlLCV39R1aRkF/Mg
	TV9aDXDPfIVBgeBWDLG8ywBf+HwxDDocsV/VwM9up71IJaA9FMdg/zh+PchilUKoxDfyraxI3jJ
	iYoWG/B0UzSf7oDjk+hQfBLJozPnNHjv+FZmk4Hpk5gkXWeg0qMLeYgzWtyLA==
X-Received: by 2002:a05:600c:3b13:b0:4a0:2150:55fb with SMTP id 5b1f17b1804b1-4a1d75ad08amr173850595e9.4.1792396304053;
        Mon, 19 Oct 2026 00:51:44 -0700 (PDT)
Received: from localhost (p200300f65f19a9041674bacf58593a35.dip0.t-ipconnect.de. [2003:f6:5f19:a904:1674:bacf:5859:3a35])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a1cc642573sm209959665e9.2.2026.10.19.00.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:51:42 -0700 (PDT)
Date: Mon, 19 Oct 2026 09:51:40 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] tty: serial: remove hub6 multiport support
Message-ID: <atXLd6SdHNr0UcjI@monoceros>
References: <20261016130328.1037616-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u5tdsywsd4xqnlzl"
Content-Disposition: inline
In-Reply-To: <20261016130328.1037616-1-arnd@kernel.org>


--u5tdsywsd4xqnlzl
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] tty: serial: remove hub6 multiport support
MIME-Version: 1.0

On Fri, Oct 16, 2026 at 02:59:47PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> hub6 support was added in linux-0.99 and the hardware was already old at
> the time, being discontinued in 1990. The code for it has always been a
> mess since it adds another dimension to the I/O addressing in the driver
> that has leaked into many individual files.
>=20
> Hugo and Uwe have attempted several times this year alone to isolate
> the hub6 handling into the 8250_hub6.c file, but I feel that none of
> this has been a real improvement over the original standalone loadable
> module support.
>=20
> Any machine that would have used this ISA card in practice is likely
> 30 to 40 years old, and with i486 support now removed, it is clearly
> safe to just kill this all off. The only bit that has to remain
> is the ioctl interface, to ensure the serial_struct field is always
> zero.
>=20
> Link: https://mirrors.nycbug.org/pub/The_Unix_Archive/Unix_Usenet/comp.un=
ix.sysv386/1990-December/007174.html
> Fixes: a300273c458c ("serial: 8250: hub6: Add cleanup code")
> Fixes: c526404a4a92 ("serial: 8250: Fix corner case for port matching")
> Fixes: 7ab80d1e7243 ("serial: 8250: fix compile error with hub6_match_por=
t() when compiled as a module")
> Fixes: da7b5fd4e17f ("serial: 8250_hub6: add missing include for hub6_mat=
ch_port()")
> Fixes: 3d406299d882 ("serial: 8250_hub6: add hub6_match_port()")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Fine for me. I wonder about the amount of Fixes: lines, but don't care
enough to check.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--u5tdsywsd4xqnlzl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrVzAoACgkQj4D7WH0S
/k4iJQf/V9G3FkSyYROePlk1XfrPSUEEaa8TTie3oEy+xPCSy0gTbErCq+RHUo4D
GxHAkavC95XGxxdZLoXmp7zZUrmdWASZLB+8Zx/zQ4uY474FnrmRb9wWmxzzt7s/
nYDE6veRDWeoi4Lcszow8rDX0uFISAaAjrBfAd/JE1t+QpkcNrYBC/PoT2BBUz6M
q1WbGxPxjSTmmYnqV3IT1Xp83J6CnJVVBme8YP4cqXBmMC0t7JZ2TEYeu42aTSFb
40v0k3I8d5pHzBl0W5c/DRH23ygvmgBFxaqFv+7uJovkvfnGmqATfNGCKzXM0lLy
P5TeqJWAB+sq7IQV0tkv0LpgWGVN6A==
=VH96
-----END PGP SIGNATURE-----

--u5tdsywsd4xqnlzl--
