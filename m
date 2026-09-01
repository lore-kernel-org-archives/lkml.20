Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064D3286D56
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256526; cv=none; b=cKeaM+Bh31qIw08jORShytcM+m8lvPZR8p67HiPlDDUveglHMsaxgv8/GRI7M6lfP0szKs10Wi+lxj9ceSccbWzo8iOSmsVSIDzw5fmrUGlr5qofLQTllX2Mbtnbe2yR39yglQ4HOR3mWE7bLoMLJ7Y6uzvshu3vxslia4sPmJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256526; c=relaxed/simple;
	bh=VKK2FKU6ga5dMkaUkFpuPEJ4LQvPAltaxJYOizCcDWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9AM5oX+Pu/oPue7BlP59D4HP67eYxElWcDx0ubpGdr2wkasBrxwLTs81v11e/Co34L3X4GFnd9FGdWwHcAYO+CRkEJ37olgHzKQxiQvUschM+GK9wx2oYnef9bZhEqaLpvtApIUlrnBTkkfbP2my3euiGqgV24lVO2zNCbR5Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEjvUnVj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEjvUnVj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC7A1F000E9;
	Tue,  1 Sep 2026 09:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788256524;
	bh=VKK2FKU6ga5dMkaUkFpuPEJ4LQvPAltaxJYOizCcDWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JEjvUnVjlrC1+x//uhaFrgAkPGR7RagUCMde9lL/pt4tOL5YRVgkMvFnuaogJqRkR
	 uO2DpAm6+8ipbSsRa0ZEWC2+nXghTH9IPkwlTiyR42iOrONr+BlRH9k+neerbVdDNH
	 yHx8k27aarKUgJr2fMPeWJTJeLjPI6pwHrg10iNav99OQmXOewgQKzXUdeILGFuM1J
	 W8Z/PJ1B/yxPWfwYIUgnDnQtJBSu4JUqUZDtGm+EcGtiIYPWMV/gnGhny/SP2/txv4
	 fIllJ8UP5Mg1U9SN0raE7R6eaGOJVWeuLbd4trRIoHVVumXtJHSJPwmLAzmQCJ7cnm
	 VnH7zTybw/oDw==
Date: Tue, 1 Sep 2026 10:55:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: introduce cap framework and use it to
 optimize pgtable_l4|l5_enabled
Message-ID: <20260901-mountable-engraved-f47c899ed194@spud>
References: <20260830170414.4505-1-jszhang@kernel.org>
 <20260830170414.4505-4-jszhang@kernel.org>
 <20260831-falsify-arrogance-6917870b8596@spud>
 <apYafAJvKqz_hRzR@xhacker>
 <apZa3EnjGjpaydGm@xhacker>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m86E7V2/eBf8L2Q6"
Content-Disposition: inline
In-Reply-To: <apZa3EnjGjpaydGm@xhacker>

--m86E7V2/eBf8L2Q6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2026 at 12:55:56PM +0800, Jisheng Zhang wrote:
> On Tue, Sep 01, 2026 at 08:21:16AM +0800, Jisheng Zhang wrote:
> > On Mon, Aug 31, 2026 at 11:04:12PM +0100, Conor Dooley wrote:
> > > On Mon, Aug 31, 2026 at 01:04:01AM +0800, Jisheng Zhang wrote:
> > > > The pgtable_l4|[l5]_enabled check sits at hot code path, performance
> > > > is impacted a lot. Since pgtable_l4|[l5]_enabled isn't changed after
> > > > boot, we can use alternative mechanism to optimize them.
> > > >=20
> > > > So the question is whether we can add RISCV_ISA_EXT_SV48/SV5 and use
> > > > riscv_has_extension_*() or not. Although, per [1] and [2], SV48 and
> > > > SV57 are ISA exensions too, RISCV_ISA_EXT_SV48/SV57 are to describe=
 hw
> > > > supported extensions, while this doesn't mean the pgtable_l4|l5 is
> > > > enabled, for example, we may pass no5lvl/no4lvl kernel boot args or
> > > > explicitly ask for SV39 by setting dt mmu-type property as
> > > > "riscv,sv39". If we clear RISCV_ISA_EXT_SV48|SV57, then internal
> > > > extension queries and potentially userspace reporting can no longer
> > > > distinguish =E2=80=9Cunsupported=E2=80=9D from =E2=80=9Csupported b=
ut disabled.=E2=80=9D
> > >=20
> > > That's the case for all extensions that the kernel does not support,
> > > like if the fpu is disabled because the kernel doesn't have the
> > > configuration option set. In fact, I think the CFI extensions are very
> >=20
> > To be honest, before introduce the cap framework, I did think about FPU,
> > ZACAS, ZABHA etc. ISA extensions' cases. Finally I came to a conclusion
> > that the SV48/57 is a different case: Let me take FPU for an example.
> > FPU once probed, the ISA support is never disabled, IOW, the
> > riscv_has_extension_likely(FPU) is always true no matter the CONFIG_FPU
> > is enabled or not. There's "no supported but disabled" case for FPU.
> > But for SV48 case, that's different. The underlying HW may support SV48
> > or SV57, but the "no5lvl and no4lvl" may explicitly force SV39, thus
> > if we go with exisiting riscv_has_extension_*() API, we need to
> > explicitly disable it by clear the isa bitmap. IOW, riscv_has_extension=
_likely(SV48)
> > is false even the underlying HW supports SV48, thus the user can't
> > distinguish between =E2=80=9Cunsupported=E2=80=9D from =E2=80=9Csupport=
ed but disabled.=E2=80=9D
> > What do you think?

(moving things around a little bit)

> and change its meaning a
> bit from "the underlying HW supports the feature" to "the underlying HW
> enables the feature".
>=20
> or keep it only for ISA extensions only.
>=20
> X86's X86_FEATURE_* take the first path, I.E it only means the feature
> is enabled or disabled on current platform, but doesn't mean the current
> platform HW supports the feature or not.
>=20
> Any comments is appreciated.

On this particular point, this is already how it works.
riscv_has_extension_[un]likely() and other related functions report
whether the extension is supported and enabled on the platform, not just
whether the underlying hardware can support it. As I mentioned
yesterday, the F and D extensions depend on CONFIG_FPU being enabled. If
CONFIG_FPU is disabled, but F and D appear in the DT or ACPI, we clear
the relevant bits in the bitmap. In turn, if there are extensions that
depend on F and D being enabled, they'll get turned off too.

>=20
> Other thoughts:
>=20
> performance PoV: usually, an ISA extension improves the performance, so
> there's no case where we clear the ISA bit map. But SV48/SV57 is
> different, e.g on a board w/ only 4GB DDR but the cpu supports SV57,
> there's no reason to enable SV57 which impacts performance a bit. This
> is the reason why no4lvl/no5lvl are introduced, AIUI.

Again, I think this applies to CFI, I don't think what's being done here
is fundamentally different to that.

> > > similar here, because they also have riscv_nousercfi command line
> >=20
> > This is another story, neither CPU ISA extension nor CPU capbility.

They are extensions though, riscv_nousercfi disables the cfilp and cfiss
extensions. You can see that in cpufeature.c. Maybe there's some
semantic argument about whether they're /CPU/ extensions, but there's
other stuff that aren't really CPU extensions and we treat them all the
same. I guess the difference for sv48/sv57 is that we'd just be setting
the bitmap bits rather than parsing it from DT/ACPI - but there's prior art
for that already.

> >=20
> > > options that can disable them.
> > > If that's the reason for making a new-but-similar mechanism, I think =
you
> > > should just introduce RISCV_ISA_EXT_SV{48,57} and use that.

> other cap usage PoV: the cap can be used to replace various static
> branch usage in arch/riscv, for example the fast_unaligned_access_speed_k=
ey
> As is known, the static branch has some drawbacks.
>=20
> So no matter which direction this series goes to, we need similar cap
> framework. The key question is whether we can extend the
> riscv_has_extension_*() to cover cpu/HW cap,

It'd be nice to see if we could reuse the functions, if we don't
want to invent a bunch of XLINUXFOO for them. The vendor extension stuff
that Charlie added reuses it, but since there's no Linux Foundation
JEDEC ID (AFAIK anyway) perhaps there's just no easy way to do it and
duplicating the functions with a different name is required.

This particular case is an extension, so I think we should try to make
it work using that framework though.

--m86E7V2/eBf8L2Q6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapahCAAKCRB4tDGHoIJi
0qnHAP90+sOs6LO8ojMJfAhCXNMGFc8ojLDBve6pxw5OBElYagEAgj/2EkQMe9ls
QBsNhEVXYz6xhSecB0B/IsCh2SNbHgY=
=Fvnc
-----END PGP SIGNATURE-----

--m86E7V2/eBf8L2Q6--
