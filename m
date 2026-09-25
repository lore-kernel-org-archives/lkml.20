Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC244B1CFE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790347419; cv=none; b=UTo6a64uH2BcXdSUK7BO4XZg3a77Gw/vzNwmVUhDc707dMgFyxFfbSZHrh6sV0XT2dVgk2Pwykr35/hjXk+BgNPoWwyorjAuN3XzU1FqMmvSlebHkJoTU7FHIqBG8qIphbK6DApXGxGN5pX9VqH5Nk3W8p7CAglOGxnG7vqN4rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790347419; c=relaxed/simple;
	bh=KofIWNtmb1qqto6MD7r3iF7UB8pI1v98Fhmikrkkvg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JL5G9fyGXobrvyS+WAF/08uOOLpHAPr8mK/KtUfYO13Vhqq1HlalngbrFidKi7IUAVvfoTedOSt42NFcb1pGKShyfrhgKy9RF1avAKZ7c9VO1DX8SbJMOPzil6e48tWwZJD+QlEldk6K4dcKIwaXSqyT86b6LWFS/LRYfs3AXSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/U0ajwL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/U0ajwL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F2B1F000FF;
	Fri, 25 Sep 2026 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790347409;
	bh=KofIWNtmb1qqto6MD7r3iF7UB8pI1v98Fhmikrkkvg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O/U0ajwLlpZ/h1E1akRYotuBuQaJkoDl0ELsOkYJCq5emoBn+vIEY7I6WD6BT7NVV
	 sUgL3HcblTcP8ht/VRQCE7MFxy7V3MBGqyF2L9XCDxkqUt46gD7hAeuBvq943pVNIq
	 10Wxt5CXV3cnf3tsS4gm0lACbps7dtVJiB20W/7zGhFFpsqiD0IKVYuAZGHCzv2dgP
	 9Q2cmtjfjdCFgl/es6OG0uB6KDjYRGJsZFKMmBU9hyfvLhejkR1Wg/SsjtSFuIiB7n
	 ACaEvwMsItmrNgqgCHDZQNXVQzMW+/0fhs8zJjnajV0KFYYkyLUoOvmhXzB9B8HaMN
	 yq2+Hrgr9O5Sg==
Date: Fri, 25 Sep 2026 15:43:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH v3 4/5] riscv: introduce RISCV_ISA_SV48 and RISCV_ISA_SV57
Message-ID: <20260925-stuffing-lunar-5a44380ebaf1@spud>
References: <20260909150158.9313-1-jszhang@kernel.org>
 <20260909150158.9313-5-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CtrRTUfPvVMhZ05e"
Content-Disposition: inline
In-Reply-To: <20260909150158.9313-5-jszhang@kernel.org>

--CtrRTUfPvVMhZ05e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--CtrRTUfPvVMhZ05e
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaraIjAAKCRB4tDGHoIJi
0kZXAQCdCUMwLH3cbqAlvwFTrxqdTCWLDqfHAlQdXZaU/uiqlwEAle9ieF89bnnI
R4C1qhlh+i9RWd5TzD2+WmJQ99vfngs=
=uahc
-----END PGP SIGNATURE-----

--CtrRTUfPvVMhZ05e--
