Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239825;
	b=ePp5akdtW21upD4buQONBoG8H4hPgp6fvDFTdjZMdXcByhqXS1668OQpWUjbFE4hSZsD
	 SIcRAQfX2dYw146CM7qhQGDxD2+t2j9ABONIWVbD99uXH1h1cmpGHDMCddL8+T20Og5zt
	 CZ9SeQ9fn4cpeK7sofubFeC62JpOxARdZqVoHORmEsea5yDg8cEZMhg6Ae7wDaH0QnQBu
	 gEeSUaTX6z/99L5tKklM6F+ZMoUeWHk+LoQFYDrHjuj6YGDReKVfciids+s0Vpfeq4iew
	 VdwoVBvKX6+ACoYJ8ZwLnVhA+fMJjZWf2F/dZvNaNNB7EbFGpsBG7z1vI526mxRlelQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pmUFbIi5ELXaVKVermTkfc30pmQFDxvmo4N0D8U5m1Y=;
	b=Nj8rt2feeW2uv9QKw4zMW1NxDLOoZEjNVh5ubGqnnBtK6SMj1+Zf49/d43++QUBTtvrR
	 gN/di22bbEisDLIA4gtOuFk/r+Ff/wa1dMInzAenmgVmrU5khKz8QE0JAj7HU7OvcDliu
	 lc1aeX5nFhSa3+BZILh4XkZc/sMTzi8K7jVJCsWFUpxphoR5/rRU3AaiwAFBNxqR7oUnw
	 7mLKNBGio3Ol4h3+vRJt0TBMRTCVVjugdVTC5M/AJ5GlkDdC6Ad/YZNA4VilACte0Jjl3
	 24g3oxX7PwgsokmHvJZsj+ShlV+7yR3aodzXicxCi+FLavujWLTuQRidSwe0xvfpq8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UDLqnf7m;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92B4606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D92B4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UDLqnf7m
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49318428d98so564118f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794239823; x=1794844623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pmUFbIi5ELXaVKVermTkfc30pmQFDxvmo4N0D8U5m1Y=;
        b=UDLqnf7m6MP9XOON1P2yBuMNdHBpOeVN/b/jwE+XxoD9ltNnxMyJaaDEvydhmAeuc7
         Ew3AxhkfHo16dffHcSjkn7Ewb7ud3PaWGROInw6JmvcvzTv404/kLL4aT3eMRB/CEhFh
         zFK9sb6aegQMNog2cSasODE4i2b0HMVvrGn6Bu10dAB4GmcXzFoX4eurOH7im3Ke97rI
         BGiPujPpPJNP7Pu8wSH4XtKW63VLENynHyaT1XsAF1lazfNaj6LvXquLCjsX5RbnI0Xd
         ZAk9lrnPVigkCW9DjLcDJr3ntOwx3VRNrvu0eltOAeWUU8RGJfk7aqjaEm3hcHNeJJZb
         nMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239823; x=1794844623;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmUFbIi5ELXaVKVermTkfc30pmQFDxvmo4N0D8U5m1Y=;
        b=Zh2eI/EIRkNgjDJYrXoC6cJiN14DDaTos/7YTaBeVuUqoWAGiX5bEH8ksf7bpcyP8J
         LCWk68wG6VjLs3PFg1HZdW08FtfCZ3bbLseBOzFgyctD23L73qlmdNdaHnpVAl3G6d7d
         MgmpV71OUs4ZfFViCaoYZzQec14gz6W3UHp0Ed88szKJsuU7kqR41MQUnLF23nS2LyT2
         hprcz09A+PVjv9slPvU31rR1CWRgdpaCzyuyAf4dBVPnLkEDQKvUXBPSDvd4F8F2VJUo
         M7haSVPn5E/XjMWPwRZCHEIzatiy6XO6M+ypLJbvO8oMKQEz2KZI1TYuOIRlWGfGzQJx
         jw7g==
X-Forwarded-Encrypted: i=1; AL+hErFQNtg4M6TIJpJgzpUsO2BjH31ty9Noe5Qh8eQqLppa7dRhC0R3Lbhx0aHWJZ7HaKiAHrBNJ7Lc6ZtYdDY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HHxaHN003UNik4eFdubEIY0nvm/WtOBp0+IkSAdh1QGQmnDIi
	cP7W3e2+o7kk4Mp9pl+lKFtn8pbU5Hp3Thwdd+03IuTj46scUO1cMlH2NgQrjO1KSzA=
X-Gm-Gg: AYBFou0f3frbNRPFTMDbtEQyEYEt8XfTQb4KpV018Cq5aUbSkWcmK721ILA5l2fVvKe
	gKM7ywNvvYVWh8xK5DjnscdaV6I9WAbq0vK8KRi8Ido9ZCRFuxWPi6BEVzlC5bBoVNuKuI94ErC
	iE+CQSSCX++DjZc5Z8MR4zqgH7lEEyIzlRZbMqwdqShp/IQV6xtvnVhfBJIlK09ul1t7q1P1XqW
	oeKu93hoHbjbenX+tC7KTlPTyCTPKrbaIP+M+s3JoHaidqNqtvEmMb7jZ+RMYCra6yv9MZsT2Ui
	lgyICr8utJzcLH/7HQ7ZY/40SyqdsnHTRocOgWA7qRjfu9DkRWlfnWV/LEBmT2gAwjkHdcghjGQ
	CW9y0+yGyh/UkZlpHmA5J10eV/S4XIwjsB/LJuTk4wvsV1g5djelRe7yJHO8/FHZLiZXQqJhZ+c
	tN53jA4hkRgn80mXVCDavHv2NcWv5cwsQ+KoRsaN63Ii80pUykUZfR5dOR0t2YxIa1aqJ8MBeDM
	g702GSP3dsxWkTyd1p0DiydBqSVKQqIoE0ENrqmZpTgyo8GL809nYKTQOMZ60KMdGKgianfQN3Q
	p50AQ/YzJ4af5NAelY+dzZtifq1oAQpq0kdK3SHlEMIlbuqZtExMtmzJjQWRdpCLSteucZsXZ+C
	mBLbWRbHW/40v5Q==
X-Received: by 2002:a05:6000:2913:b0:48f:bc05:76fc with SMTP id ffacd0b85a97d-4958871da7cmr8465559f8f.11.1794239823132;
        Mon, 09 Nov 2026 07:57:03 -0800 (PST)
Received: from localhost (p200300f65f19a90407b2ef73b14b6bb2.dip0.t-ipconnect.de. [2003:f6:5f19:a904:7b2:ef73:b14b:6bb2])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-496150c6e90sm9293515f8f.2.2026.11.09.07.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:57:02 -0800 (PST)
Date: Mon, 9 Nov 2026 16:57:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Harald Freudenberger <freude@linux.ibm.com>, Holger Dengler <dengler@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-kbuild@vger.kernel.org, linux-s390@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"kernelci.org bot" <bot@kernelci.org>
Subject: Re: [PATCH 2/2] devicetable-offsets: Get struct cpu_feature from a
 device-id header
Message-ID: <avHrnT-rUMynqyeh@monoceros>
References: <cover.1792144769.git.u.kleine-koenig@baylibre.com>
 <179416565740.60865.16102443399828949110.b4-review@b4>
 <66e4ee9c7f9b4bc48fcee92a94b6bb6d92fe1ad2.1794233316.git.sashal@kernel.org>
 <f610c07f39df15f3e7ebdc63bfcd759ca7a687a8.1794233316.git.sashal@kernel.org>
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
	protocol="application/pgp-signature"; boundary="2fgrweo6pewwby7y"
Content-Disposition: inline
In-Reply-To: <f610c07f39df15f3e7ebdc63bfcd759ca7a687a8.1794233316.git.sashal@kernel.org>


--2fgrweo6pewwby7y
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] devicetable-offsets: Get struct cpu_feature from a
 device-id header
MIME-Version: 1.0

On Mon, Nov 09, 2026 at 09:14:41AM -0500, Sasha Levin wrote:
> Since commit cdfdbc11552b ("Move struct cpu_feature to
> <linux/cpufeature.h>"), devicetable-offsets.c includes
> <linux/cpufeature.h>, which includes <asm/cpufeature.h> on architectures
> that select GENERIC_CPU_AUTOPROBE. On loongarch and mips that header
> pulls in <asm/elf.h>, and from there <linux/fs.h> and <linux/mmzone.h>,
> which need <generated/bounds.h>. devicetable-offsets.c is built before
> that header is generated, so even defconfig fails on both:
>=20
>   include/linux/page-flags-layout.h:6:10: fatal error: generated/bounds.h=
: No such file or directory
>=20
> Move struct cpu_feature to <linux/device-id/cpu_feature.h>, next to the
> other device id types, and include that from <linux/cpufeature.h>,
> devicetable-offsets.c and file2alias.c.

I didn't do that before because I didn't have the impression that struct
cpu_feature is a device id type. Seems a bit like a misuse to me, but
=F0=9F=A4=B7.

Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--2fgrweo6pewwby7y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrx7UsACgkQj4D7WH0S
/k61Rwf+LVoPzWsK/woGLLlyviU+6CbjuXgKqChzk+2WLkEBD+PwtIXB8AH9dbPn
M6002PBuVjZim21ciWzb4KrFg+A7r8v7VwgqC0guYCC0fmT5saCufWs+mD3K0UNm
v99+XG+Beb0pbOot1KBVbwhXV+bC3Me9emG+M/tnXXHJCQKspmNpEZveIk7dSlWF
YkDj52lX/LcDMa7bDOfNfbEbMOZOoyzvXhBdLN5vonShXeWbBTvbIHDhIBXYUiXe
TPKI4T+X/rK0qjc0N33xYdbPFPxC6JtA0bY19P+H9qXRHfDET9c4m1tBDYI/f4GF
TRJz+4C8sNz42lbj0xNszq4D4wu9LA==
=wmA7
-----END PGP SIGNATURE-----

--2fgrweo6pewwby7y--
