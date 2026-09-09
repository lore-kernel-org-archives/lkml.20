Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C0D5237AD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952125; cv=none; b=J1pXVTSLlSm0OMXiWGqWiB/ZhPJXxd2J6iYMe4w2SfHe1tFhMS89dW5OnC1MbA0nnvuYnp5YBArg7E/o5F2Oszp7OLAs725byfEHBold82V39AmCa3Bbpyz5ws624QONK5m2hNMpoe+43hBrJhRnXB8paBPZEpoANk8XW50LK9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952125; c=relaxed/simple;
	bh=4g+AZT5uzTfuyN2AMCNQxdKFa1sH6r/b4nmx1xOu32M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MU0+9snZCCUhbT5Bo5zfq5RREZXknCq8nOYX2rKtZSPf4QyqmxyiingM7bC8gRKySUB3har/S/w8a100LAF5n9Bz2tCYpZGCWJGxavQ/oqNvTSpB9Hw6pz/w/rlftUVLPWdSqLkqvZ71ai5meFLNHE70SdaZYklGEeLdH6Nhea0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oc/3Q5OX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oc/3Q5OX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9557A1F00A3A;
	Wed,  9 Sep 2026 11:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788952122;
	bh=XDF6EUNBfqF92NXMVALDMNh+97LM2dme+iORskOBx2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oc/3Q5OXuZzFrpZbMUc9s0AL5QWt1ffnpkl+XPubY0HjwJCMrfrIN7KqwJkF0iGCg
	 7NwA7545HMZQkbDbKhF7rjkuVurGqkCj59UaplbHeJoUYIwsXuXln3uKjK8HaByv76
	 h0NHWbA0f3i2rp64NIhHsGp95bUit01xSHvMBB/0PHh0953navTSoeWFlk9aDsufAq
	 ImDyiIBchNf37mGGrvU1zGxt2gMe9efvuLAb3/Bbqk1bbeKgauqsiLuCXgwW3xLbnA
	 XUxWIKmMq5hMZ5smHAz0RVFQR3g8CWnrIS0EvvVGB2gx4rezUMhgmXUtaNFR1aKKSC
	 wbVQyE4Jsq2cA==
Date: Wed, 9 Sep 2026 12:08:36 +0100
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
Subject: Re: [PATCH v2 4/5] riscv: RISCV_ISA_SV48 and RISCV_ISA_SV57 under
 NONPORTABLE
Message-ID: <aqE-NPNy1qnSJc7o@squawk>
References: <20260907151437.7603-1-jszhang@kernel.org>
 <20260907151437.7603-5-jszhang@kernel.org>
 <20260907-backless-theatrics-f19e489bc63f@spud>
 <ap-FtoTqMCnNACJN@xhacker>
 <20260908-deflector-degree-ceca18036811@spud>
 <aqCe6T8QKtJcLHiM@xhacker>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1+RHUK1obFa6miaX"
Content-Disposition: inline
In-Reply-To: <aqCe6T8QKtJcLHiM@xhacker>

--1+RHUK1obFa6miaX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2026 at 07:48:57AM +0800, Jisheng Zhang wrote:
> On Tue, Sep 08, 2026 at 02:07:27PM +0100, Conor Dooley wrote:
> > On Tue, Sep 08, 2026 at 11:49:10AM +0800, Jisheng Zhang wrote:
> > > On Mon, Sep 07, 2026 at 05:21:11PM +0100, Conor Dooley wrote:
> > > > On Mon, Sep 07, 2026 at 11:14:36PM +0800, Jisheng Zhang wrote:
> > > > > In last commit, we have optimized the pgtable_l4|l5_enabled with =
isa
> > > > > extension alternative mechanism, thus a typical access_ok(addr, 1=
);
> > > > > is compiled as:
> > > > >=20
> > > > > ffffffff8001dd30:	1141                	addi	sp,sp,-16
> > > > > ffffffff8001dd32:	e022                	sd	s0,0(sp)
> > > > > ffffffff8001dd34:	e406                	sd	ra,8(sp)
> > > > > ffffffff8001dd36:	0800                	addi	s0,sp,16
> > > > > ffffffff8001dd38:	00000013          	nop
> > > > > ffffffff8001dd3c:	02a0006f          	j	ffffffff8001dd66 <foo+0x3e>
> > > > > ffffffff8001dd40:	60a2                	ld	ra,8(sp)
> > > > > ffffffff8001dd42:	6402                	ld	s0,0(sp)
> > > > > ffffffff8001dd44:	57fd                	li	a5,-1
> > > > > ffffffff8001dd46:	83a1                	srli	a5,a5,0x8
> > > > > ffffffff8001dd48:	00a7b533          	sltu	a0,a5,a0
> > > > > ffffffff8001dd4c:	00154513          	xori	a0,a0,1
> > > > > ffffffff8001dd50:	0141                	addi	sp,sp,16
> > > > > ffffffff8001dd52:	8082                	ret
> > > > > ...
> > > > > ffffffff8001dd64:	bfe1                	j	ffffffff8001dd3c <foo+0x=
14>
> > > > > ffffffff8001dd66:	0180006f          	j	ffffffff8001dd7e <foo+0x56>
> > > > > ffffffff8001dd6a:	60a2                	ld	ra,8(sp)
> > > > > ffffffff8001dd6c:	6402                	ld	s0,0(sp)
> > > > > ffffffff8001dd6e:	57fd                	li	a5,-1
> > > > > ffffffff8001dd70:	83c5                	srli	a5,a5,0x11
> > > > > ffffffff8001dd72:	00a7b533          	sltu	a0,a5,a0
> > > > > ffffffff8001dd76:	00154513          	xori	a0,a0,1
> > > > > ffffffff8001dd7a:	0141                	addi	sp,sp,16
> > > > > ffffffff8001dd7c:	8082                	ret
> > > > > ffffffff8001dd7e:	60a2                	ld	ra,8(sp)
> > > > > ffffffff8001dd80:	6402                	ld	s0,0(sp)
> > > > > ffffffff8001dd82:	57fd                	li	a5,-1
> > > > > ffffffff8001dd84:	83e9                	srli	a5,a5,0x1a
> > > > > ffffffff8001dd86:	00a7b533          	sltu	a0,a5,a0
> > > > > ffffffff8001dd8a:	00154513          	xori	a0,a0,1
> > > > > ffffffff8001dd8e:	0141                	addi	sp,sp,16
> > > > > ffffffff8001dd90:	8082                	ret
> > > > >=20
> > > > > As can be seen, different branches for SV39/SV48/SV57 are still t=
here,
> > > > > since access_ok() sits at hot code path, why not reduce the code =
size
> > > > > to optimize to make the instruction cache happy?
> > > > >=20
> > > > > Introduce RISCV_ISA_SV48 and RISCV_ISA_SV57 under NONPORTABLE, so=
 that
> > > > > the embedded platforms can choose the best option themselves, whi=
le
> > > > > still keep the feature of unified one kernel Image for all SV39, =
SV48
> > > > > and SV57.
> > > > >=20
> > > > > Before the patch, vmlinux built with pure RISCV64 defconfig
> > > > >    text    data     bss     dec     hex filename
> > > > > 13439437   6790446  483221 20713104 13c0e90 /tmp/old/vmlinux
> > > > >=20
> > > > > After the patch, vmlinux built with pure RISCV64 defconfig:
> > > > >    text    data     bss     dec     hex filename
> > > > > 13314445   6787934  466837 20569216 139dc80 /tmp/new/vmlinux
> > > > >=20
> > > > > .text section is reduced by 122KB!
> > > > >=20
> > > > > And after the patch, typical access_ok(addr, 1) is compiled as:
> > > > > ffffffff8001809a:	1141                	addi	sp,sp,-16
> > > > > ffffffff8001809c:	e022                	sd	s0,0(sp)
> > > > > ffffffff8001809e:	e406                	sd	ra,8(sp)
> > > > > ffffffff800180a0:	0800                	addi	s0,sp,16
> > > > > ffffffff800180a2:	00000013          	nop
> > > > > ffffffff800180a6:	60a2                	ld	ra,8(sp)
> > > > > ffffffff800180a8:	6402                	ld	s0,0(sp)
> > > > > ffffffff800180aa:	4785                	li	a5,1
> > > > > ffffffff800180ac:	179a                	slli	a5,a5,0x26
> > > > > ffffffff800180ae:	00f53533          	sltu	a0,a0,a5
> > > > > ffffffff800180b2:	0141                	addi	sp,sp,16
> > > > > ffffffff800180b4:	8082                	ret
> > > > >=20
> > > > > only 12 instruction!! For refernece, before the patch, the access=
(addr,
> > > > > 1) needs 32 instructions.
> > > > >=20
> > > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > > > ---
> > > > >  arch/riscv/Kconfig                  | 24 ++++++++++++++++++++++++
> > > > >  arch/riscv/include/asm/pgtable-64.h | 12 ++++++++++++
> > > > >  arch/riscv/mm/init.c                | 10 ++++++++++
> > > > >  3 files changed, 46 insertions(+)
> > > > >=20
> > > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > > index e9476b8cbeb0..4cdb1e3f34be 100644
> > > > > --- a/arch/riscv/Kconfig
> > > > > +++ b/arch/riscv/Kconfig
> > > > > @@ -602,6 +602,30 @@ config RISCV_ISA_SSQOSID
> > > > >  	  cache partitioning scheme and use the MCID to track how much
> > > > >  	  cache a process, or a group of processes, is using.
> > > > > =20
> > > > > +config RISCV_ISA_SV48
> > > > > +	bool "Page-Based 48-bit Virtual-Memory System"
> > > > > +	depends on 64BIT && NONPORTABLE
> > > > > +	default y
> > > >=20
> > > > I don't understand how you've got this set up here.
> > > > If this is genuinely non-portable, then you should not set the defa=
ult to
> > > > enabled. However, I'm not really sure that this is actually non-por=
table
> > > > at all....
> > > >=20
> > > > > +	help
> > > > > +	  Add support for the Page-Based 48-bit Virtual-Memory System.
> > > > > +
> > > > > +	  Enable this option for systems for which a 39-bit virtual add=
ress
> > > > > +	  space is insufficient. But if 39-bit is enough, disabling this
> > > > > +	  option will result in smaller kernel size and slighly better
> > > > > +	  performance.
> > > > > +
> > > > > +config RISCV_ISA_SV57
> > > > > +	bool "Page-Based 57-bit Virtual-Memory System"
> > > > > +	depends on 64BIT && NONPORTABLE
> > > > > +	default y
> > > > > +	help
> > > > > +	  Add support for the Page-Based 57-bit Virtual-Memory System.
> > > > > +
> > > > > +	  Enable this option for systems for which a 48-bit virtual add=
ress
> > > > > +	  space is insufficient. But if 48-bit is enough, disabling this
> > > > > +	  option will result in smaller kernel size and slighly better
> > > > > +	  performance.
> > > > > +
> > > > >  config RISCV_ISA_SVPBMT
> > > > >  	bool "Svpbmt extension support for supervisor mode page-based m=
emory types"
> > > > >  	depends on 64BIT && MMU
> > > > > diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/inc=
lude/asm/pgtable-64.h
> > > > > index 7e30ec0e9f6c..f2d29da93eea 100644
> > > > > --- a/arch/riscv/include/asm/pgtable-64.h
> > > > > +++ b/arch/riscv/include/asm/pgtable-64.h
> > > > > @@ -16,21 +16,33 @@ extern bool _pgtable_l5_enabled;
> > > > >  #ifdef USE_EARLY_PGTABLE_LEVELS
> > > > >  static __always_inline bool pgtable_l5_enabled(void)
> > > > >  {
> > > > > +	if (IS_ENABLED(CONFIG_NONPORTABLE) && !IS_ENABLED(CONFIG_RISCV_=
ISA_SV57))
> > > > > +		return false;
> > > > > +
> > > > >  	return _pgtable_l5_enabled;
> > > > >  }
> > > > > =20
> > > > >  static __always_inline bool pgtable_l4_enabled(void)
> > > > >  {
> > > > > +	if (IS_ENABLED(CONFIG_NONPORTABLE) && !IS_ENABLED(CONFIG_RISCV_=
ISA_SV48))
> > > > > +		return false;
> > > > > +
> > > > >  	return _pgtable_l4_enabled;
> > > > >  }
> > > > >  #else
> > > > >  static __always_inline bool pgtable_l4_enabled(void)
> > > > >  {
> > > > > +	if (IS_ENABLED(CONFIG_NONPORTABLE) && !IS_ENABLED(CONFIG_RISCV_=
ISA_SV48))
> > > > > +		return false;
> > > > > +
> > > > >  	return riscv_has_extension_likely(RISCV_ISA_EXT_SV48);
> > > > >  }
> > > > > =20
> > > > >  static __always_inline bool pgtable_l5_enabled(void)
> > > > >  {
> > > > > +	if (IS_ENABLED(CONFIG_NONPORTABLE) && !IS_ENABLED(CONFIG_RISCV_=
ISA_SV57))
> > > > > +		return false;
> > > > > +
> > > > >  	return riscv_has_extension_likely(RISCV_ISA_EXT_SV57);
> > > > >  }
> > > > >  #endif
> > > >=20
> > > > ...because the code here won't enable sv57 etc if not supported...
> > > >=20
> > > > > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > > > > index 2a2402d79bc4..90bb85c5f167 100644
> > > > > --- a/arch/riscv/mm/init.c
> > > > > +++ b/arch/riscv/mm/init.c
> > > > > @@ -844,6 +844,16 @@ static __init void set_satp_mode(uintptr_t d=
tb_pa)
> > > > > =20
> > > > >  	kernel_map.page_offset =3D PAGE_OFFSET_L5;
> > > > > =20
> > > > > +	/* Fall back to Sv48 if Sv57 is unsupported on non-portable sys=
tems */
> > > > > +	if (IS_ENABLED(CONFIG_NONPORTABLE) && !IS_ENABLED(CONFIG_RISCV_=
ISA_SV57) &&
> > > > > +			satp_mode_limit =3D=3D 0)
> > > > > +		satp_mode_limit =3D SATP_MODE_48;
> > > >=20
> > > > ...and neither does the code here.
> > > >=20
> > > > > Introduce RISCV_ISA_SV48 and RISCV_ISA_SV57 under NONPORTABLE, so=
 that
> > > > > the embedded platforms can choose the best option themselves, whi=
le
> > > > > still keep the feature of unified one kernel Image for all SV39, =
SV48
> > > > > and SV57.
> > > >=20
> > > > NONPORTABLE is what you're meant to depend on when the kernel that =
gets
> > > > built cannot run on platforms without the feature.
> > >=20
> > > The reason I put these two Kconfig options under NONPORTABLE is: all
> > > distributions won't enable NONPORTABLE for their defconfig, and I gue=
ss
> > > the distributions want to kept unified one kernel Image for all SV39,
> > > SV48 and SV57.
> > >=20
> > > I have no preference whether move them out of NONPORTABLE or not.
> >=20
> > Oh right I think I made a mistake in my understanding of what's going on
> > here.
> >=20
> > If you turn on NONPORTABLE (but not these new options) then you only get
> > sv39 support. I think what you should do to make the behaviour of these
> > options clearer is invert them.
>=20
> hmm, other ISA ext Kconfig options are not inverted, so I prefer moving
> SV48|57 out of NONPORTABLE and make them y by default.

Sure, that works for me.

--1+RHUK1obFa6miaX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqE+NAAKCRB4tDGHoIJi
0pygAP94MA882BBSMKWMgXUcJwenSA75SIeqIoXo+xpl9NsSJQD8CTBp0ycVz6e9
v6FSwwqinix5gIm+sHYi0ktbxFPUIgE=
=RTlc
-----END PGP SIGNATURE-----

--1+RHUK1obFa6miaX--
