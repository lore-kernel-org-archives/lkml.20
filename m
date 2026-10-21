Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574004;
	b=5L4bIHETPv57GSfZletnfMkm1VaVbiKl6SxROf9RYTrGF3nLIWZ8G0z/gWNgI+Lp3UKS
	 3E48dt/1ZRAB8nGT8mNNzi7xklh/ZWnYSGszdkvbvNgtMgEr8giwWf2aPlGTDXD2ZKK14
	 HjftuvPTZglxgzNbd4WXXVghf8mHWa1a1Evp7ahG2QQtvSb8HMsvVZOvL9W3dVfNKG4aR
	 1p0oOt2+aV78+rjMERkkXlcscSWrqRZFFAfiAiprGWMY0S0ywQ/LE/xsYDd4jJ4ke57WW
	 J6De6io+N82o9vYu9U/MRLYZtUUr8UP7/IoBL9RHVaT6MsJKE+EEYl70fRzYlNNqQAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574004;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ibFHvFi24VZLXp5k+/QO09VG0su+4GpbQN0fTL3vDus=;
	b=ZDPuBXogqcjJHfRsSYJXVfmvd7PiyN1RTSTxnNJjWtxQwCmPoALX1ETtVRl68bHkpkij
	 OYwf7D7Mnvj1b6jvd/Oglw0zBnZ4QBNpEQuAM8c7SyiVSXp4DESUW94xyHioMS9NacNOc
	 S2Yn5gf+yTOjoiLOVFAPzJt6VLymkBJm8AbmRL9O/2Qs1h7cqArDIOk81A0rnV5hBige4
	 Y68ummKRlTTOX1OmTpulCVHte8EAM3YOjA7wGrnvKQ+LBVtD05JypC7Btr1Y9cuDXsx9b
	 huzLa2cj9IpiJrEYI90CcP5kJO+f8qWF36nim7Ug4z3PRzccSo5cFmGIGal3qBXMb3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ghQjnlW2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE719606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ghQjnlW2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED5E1F000C9;
	Wed, 21 Oct 2026 09:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792574003;
	bh=ibFHvFi24VZLXp5k+/QO09VG0su+4GpbQN0fTL3vDus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ghQjnlW23UzTWYDPndfk/wQJ4pfFwQWR4rRQGvZcBiXidQ2FOKXQhHaSRpFXwM7uh
	 aDxdjifvMQENW4gy3TYaxyNjacBoQBRg/iN2xUD4A1knzFCIqt0l3iFS21nieXsf/N
	 xYeTWyem1b+bw3hNX4rbDUyxXLQ27vwacuikYLtAf8HjJMGzq948/zAiLFOj5Pkxml
	 vnep2VtePEe87EsWHGTHX2r09ox+pyzgun2IhuYKye/2GBMsGVfb/JpuyzHK7DdZej
	 miF5vvCwyTHSgFi1xS7Q9XjDHEQPrx5VaOIIX6VlEBqrYb8aeadtAAE8EfmCSQ8mOh
	 bBlJH+xi2ZiPg==
Date: Wed, 21 Oct 2026 10:13:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: sudeep.holla@kernel.org, alex@ghiti.fr, aou@eecs.berkeley.edu,
	atishp@rivosinc.com, conor.dooley@microchip.com, guoren@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org
Subject: Re: [PATCH] riscv: Populate boot CPU topology on UP kernels
Message-ID: <20261021-dilute-arrive-f7633eed8556@spud>
References: <20261012131034.1026-1-cp0613@linux.alibaba.com>
 <20261020-unsent-commuting-91739a882031@spud>
 <20261020-frisky-jovial-echidna-2d003c@sudeepholla>
 <20261020142630.1680-1-cp0613@linux.alibaba.com>
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
	protocol="application/pgp-signature"; boundary="uIe2oQA0ozxBslji"
Content-Disposition: inline
In-Reply-To: <20261020142630.1680-1-cp0613@linux.alibaba.com>

--uIe2oQA0ozxBslji
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 10:26:26PM +0800, Chen Pei wrote:
> On Tue, Oct 20, 2026 at 01:24:00PM +0100, Sudeep Holla wrote:
> > Commit 4b3dc9679cf7 ("arm64: force CONFIG_SMP=3Dy and remove redundant =
#ifdefs")
> > removed UP support and made SMP default enabled.

Ah yes, I forgot about this..

> Thanks. RISC-V still allows UP: CONFIG_SMP is a plain bool with no
> default, yet arch/riscv/Kconfig selects GENERIC_ARCH_TOPOLOGY
> unconditionally while the only callers of init_cpu_topology() and
> store_cpu_topology() sit in smpboot.c, which is built only for
> CONFIG_SMP. That mismatch is what this patch closes.
>=20
> Gating that select on SMP instead does not work. UP would then fall back
> to the cpumask_of(cpu) defaults in include/linux/topology.h and report
> the same sysfs, but vmlinux no longer links: arch_freq_scale,
> capacity_freq_ref, topology_scale_freq_tick and topology_set_freq_scale
> all become undefined references.
>=20
> arch/riscv/include/asm/topology.h binds the arch_scale_freq_* and
> arch_set_freq_scale hooks to symbols that only drivers/base/arch_topology=
=2Ec
> provides, and those defines suppress the generic fallbacks in
> kernel/sched/sched.h and include/linux/sched/topology.h. Making the
> gating work needs extra conditionals at several Kconfig and Makefile
> gates, and gives up freq and capacity invariance on UP, which is a much
> larger change than the twelve lines here.
>=20
> Conor, and RISC-V maintainers: would you rather force CONFIG_SMP=3Dy on
> RISC-V as well and drop UP altogether, or keep UP buildable and take
> this fix? I would keep the current approach unless you prefer the
> former.

I think we probably should drop CONFIG_SMP=3DN, but this patch would be
needed as a fix regardless since making SMP mandatory would be for 7.5
or later whereas fixing this is 7.4-rc content and should probably be
backported to stable.

FWIW, the patch looks reasonable to me, I was just wondering why arm64
didn't need it.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--uIe2oQA0ozxBslji
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatiCLgAKCRB4tDGHoIJi
0vBBAQCHzwMkQlJ8bBWTCZpOlZkwVgGCC1bBopmcuYSd1KwgdQD/VjIT/ComB9c3
A4RchBLZWXhBIjHQ092F3Ox/Pd9ERAM=
=jKs+
-----END PGP SIGNATURE-----

--uIe2oQA0ozxBslji--
