Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756B93EEAE2;
	Wed, 14 Oct 2026 16:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995619; cv=none; b=BnrefsWd2StCERtcszjvu4SkTv4ze9QooMeIT7Q0284J7rpPYIn82bRcOfJEZgieTUOFuD9KX3dHlL5s1TyUODNNdwwxbVLmUN02RTYTcQ/2tZZaZrJpk39bxkwhjqYbzgkghEMlt9El3viVUdErO75qlJH8XD1X2Y9KQLxdX7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995619; c=relaxed/simple;
	bh=BaS0+qjIvI6Uk3WcpOyYLai8GuB3JQvo8rsHC8OIUug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0575gj1YmDAWB6vEaXOSf1g9NcbLsT2kQKmPflNaojzIPrc6qfadMT8YpNVfDOScQLW+kkE3BmPc2VIrKMoKSzRPhZrWmR2upFp8tq1orelMDTG38plU+T676sWh3kIBs7Zwp+m3zfXwduF/hTb5hsmzLBs+Y+M1iDfRCx8dC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBSFI+GS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBSFI+GS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE07A1F000C4;
	Wed, 14 Oct 2026 16:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791995618;
	bh=hcW6ngQGbiEdWjLMA3uMxUFQ5wn2/yx80RMHMPv3Cnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VBSFI+GSQ9vOqX42H30ft0vMSsO9216xBijfKCOUh0Am5s3XO5xnR3QJ6wDxfEf8y
	 etdgxNnJuvWLKLblPr+M0JCQJKv1EYG18yr1qo+zy/xDRxQt1HROiiKrJCHwRKrEwd
	 leKsk2um9QgK+nLr3gCIqRJ05FRt5gDHRQXIQoYI6TjcRgZd0jxrfjXimNx5Fricx0
	 BnFGT7oQ1W9SA2z5uYIzxpWXZc91ca4KVCdPFYNmEzh07LZ94cv+tuNujRk3/IrOGa
	 23Xd+PsmsKg/X4wRKceJfb+x+4xh2qOBUQjINV89MkXC4B9FkukexkiDaRjtpN0Xjp
	 rM6mLWEQciXwA==
Date: Wed, 14 Oct 2026 17:33:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Cc: "alex@ghiti.fr" <alex@ghiti.fr>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"daniel.lezcano@kernel.org" <daniel.lezcano@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
	"inochiama@outlook.com" <inochiama@outlook.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"radu@rendec.net" <radu@rendec.net>,
	"robh@kernel.org" <robh@kernel.org>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"vladimir.kondratiev@mobileye.com" <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH 3/9] dt-bindings: riscv: Add MIPS Boston board compatible
Message-ID: <20261014-defection-tiny-3e653ce56e60@spud>
References: <20260915-woof-ducktail-5e2f52bc5762@spud>
 <3d13e372-80da-44bb-845c-14f5022e326a@htecgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZuVNUU8McGEtDGb7"
Content-Disposition: inline
In-Reply-To: <3d13e372-80da-44bb-845c-14f5022e326a@htecgroup.com>

--ZuVNUU8McGEtDGb7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 01:16:16PM +0000, Aleksa Paunovic wrote:
> Hi Conor,
> On 9/15/26 19:58, Conor Dooley wrote:
> > On Mon, Sep 14, 2026 at 03:55:51PM +0200, Aleksa Paunovic via B4 Relay =
wrote:
> >> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> >>
> >> Document the MIPS Boston board compatible with a P8700 bitfile.
> >>
> >> Co-developed-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> >> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> >> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> >> ---
> >>  Documentation/devicetree/bindings/riscv/gf.yaml | 27 ++++++++++++++++=
+++++++++
> >>  1 file changed, 27 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/riscv/gf.yaml b/Documen=
tation/devicetree/bindings/riscv/gf.yaml
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..060910c9b04f482aee6f08=
f8f72232acbad118bb
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/riscv/gf.yaml
> >> @@ -0,0 +1,27 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/riscv/gf.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: GlobalFoundries MIPS SoC-based boards
> >> +
> >> +maintainers:
> >> +  - Djordje Todorovic <djordje.todorovic@htecgroup.com>
> >> +  - Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> >> +
> >> +description:
> >> +  GlobalFoundries MIPS SoC-based boards
> >> +
> >> +properties:
> >> +  $nodename:
> >> +    const: '/'
> >> +  compatible:
> >> +    oneOf:
> >> +      - description: Boston FPGA development board with a MIPS P8700 =
bitfile
> > I'm not convinced that this is specific enough at all.
> > I have absolutely no idea from this description if there's even a
> > specific FPGA involved here - this could mean a bitstream used on an Al=
tera
> > platform or a Xilinx one, with totally different contents.
> I'll document this in v2. FWIW it's the identical board as [1], just with=
 a=A0
> different bitstream.=A0
> > I'm only happy with FPGA bitstream content being supported if it is
> > versioned strictly and matches with some clear and obvious releases from
> > the vendor.
> I'll see if I can find one for v2. A version identifier would also work
> as a SoC-specific fallback, since it's the SoC that's bitstream content i=
n our case.
> I'm not sure anything's public though. If not, I'd keep the board compati=
ble=A0
> without a fallback (if possible).=A0

It's worth mentioning that this is the standard that we've discussed for
platforms on riscv, because of the nature of riscv and the ability of
anyone to create bitstreams for custom "SoCs" running on FPGAs.
It doesn't have to be public what a version actually means, but it must
be there.

Thanks,
Conor.

> >  I cannot even find this board by googling it, let alone find
> > clear information about what this could correspond to.
> >
> >> +        items:
> >> +          - const: gf,mips-p8700-boston
> > "items: - const" is the same as just having "const".
> Will fix in v2.
> >  SoC-specific
> > fallback is also missing, although in this case it'll be tricky to have
> > a meaningful one.
>=20
> Links:
> [1] https://github.com/torvalds/linux/blob/master/arch/mips/boot/dts/img/=
boston.dts
>=20
> Best regards,
> Aleksa

--ZuVNUU8McGEtDGb7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas+u3AAKCRB4tDGHoIJi
0pLpAP9N1JZ12C4zPZ9JHCuy9rcliYJRD7OR/fTGBhZGCPVYzQD/eewiEPg8Uct/
aJiVbVje9Air05SwkTur0ax9CQzOeg0=
=Qud7
-----END PGP SIGNATURE-----

--ZuVNUU8McGEtDGb7--
