Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7A73BE644;
	Fri, 25 Sep 2026 17:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790356435; cv=none; b=bM5lf0UQ1nlhp9hbKhUHMjS7F4KkYrGP7O9bDPrZC5aOkPLeoavF7XINVy6/G47e6Y6riFTf5S3WqwEFnZZJW2kGYg0Uvhh6r70D12H+5KV/vww6VC9SN5E8Ox310+7JOmQlFqXukv0Bsvlu/WjsIVR5NWDZYaTn02DWS2bODJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790356435; c=relaxed/simple;
	bh=hqE5UZ1mgo2fTWaebliMeYTHtZHYEwh9TxfcxwUYHTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vfkhb8vWem2WgtpHHpl2IY/q0jZJUPaYVCpjp/nuFsGLDtKHb5isnjdQ4lQ97ZiBOAc7d20Litg4hbP/pzXRjrYUYsYj2yqfCEM+xGzti73uFqbO+uXeuQ4VqObPe1z4eIjenKxt9pX1eDASRohXmkLSGqe1STl7q7r+3r6IXdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c+ucTPcn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c+ucTPcn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692311F000FF;
	Fri, 25 Sep 2026 17:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790356422;
	bh=PVAWLSnISj9xuwYOjYW3PY+QSYsA4pB5ogyShW1fSwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c+ucTPcn6oZYtnIk1LcSq5zcFK+u18z9DW4itsYVq+M7If2PDxlOVqY5236LQsvsM
	 Um9nV7B+0qLXmhpdl9rJXOJzwwbqhyq3NR29ZRbNMjYkF04OnvvMZEKHY+sPIvqv6x
	 1YbEPDTeeu3orYPtaqM7kC/OYy9vDr380FMlnsyOz6EXgFZZSbrRVSi3Af78KUpViB
	 WUJwl9ZnAy6SxnL/qKPkuLKWTvWmtYf+vOMSan+lvlM8Qshf4uWZpgHdHsV+fGEnN0
	 SpCJyA71Nyrvc5P9A0+b2y2WLO0PjRk5//0vK3py20udNcmac99ZWkgpUz4yGbb2cb
	 qB4SbseTFMOxA==
Date: Fri, 25 Sep 2026 18:13:38 +0100
From: Conor Dooley <conor@kernel.org>
To: "Farber, Eliav" <farbere@amazon.com>
Cc: Thomas Gleixner <tglx@kernel.org>, "Shenhar, Talel" <talel@amazon.com>,
	Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/6] dt-bindings: interrupt-controller: amazon, al-fic:
 add error/fatal groups
Message-ID: <20260925-emit-activate-672c6e428fcb@spud>
References: <20260924062311.37308-1-farbere@amazon.com>
 <20260924062311.37308-4-farbere@amazon.com>
 <20260924-majority-amazingly-58df3d86190c@spud>
 <BY3PR18MB4722BD55C256787423DB5CE7C6802@BY3PR18MB4722.namprd18.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="urIKkQsF/qSUpMDX"
Content-Disposition: inline
In-Reply-To: <BY3PR18MB4722BD55C256787423DB5CE7C6802@BY3PR18MB4722.namprd18.prod.outlook.com>

--urIKkQsF/qSUpMDX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 10:24:38AM +0000, Farber, Eliav wrote:
> On Thu, Sep 24, 2026 at 06:13:52PM +0100, Conor Dooley wrote:
> > Without any explanation relating to hardware, I find this very hard to
> > understand. Nodes and compatible strings are devicetree concepts, that
> > portion of the commit message should explain hardware detail.
>=20
> Agreed, the message failed to describe the hardware. Here it is, and v2
> will carry it.

Cool. I won't pretend to understand all of what is written here, but it
does assuage my concern that you were coming up with compatibles for
the 0x2c and 0x34 registers. I'm not entirely sure that a compatible
change is the right way to communicate which aspect of the device is
being used - typically things like this get dedicated properties because
AFAICT from the below the hardware is the same, just the output path
differs, something like this incomplete diff:
diff --git a/Documentation/devicetree/bindings/interrupt-controller/amazon,=
al-fic.yaml b/Documentation/devicetree/bindings/interrupt-controller/amazon=
,al-fic.yaml
index 26bc05dee0bc..f1f7b555c48d 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.=
yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.=
yaml
@@ -11,7 +11,11 @@ maintainers:
=20
 properties:
   compatible:
-    const: amazon,al-fic
+    oneOf:
+      - const: amazon,al-fic
+      - items:
+          - amazon,al-fic-v2
+          - amazon,al-fic
=20
   reg:
     maxItems: 1
@@ -24,6 +28,11 @@ properties:
   interrupts:
     maxItems: 1
=20
+  amazon,something:
+    ref: ...string
+    enum: [info, error, fatal]
+    default: info
+
 required:
   - compatible
   - reg
@@ -31,6 +40,16 @@ required:
   - '#interrupt-cells'
   - interrupts
=20
+if:
+  properties:
+    compatible:
+      not:
+        contains:
+          const: amazon,al-fic-v2
+then:
+  properties:
+    amazon,something: false
+
 additionalProperties: false
=20
 examples:

The fallback does worry me a little though, since it'd operate the
instances intended to be fatal or error as info, which would probably
cause problems? Unless each has different output ports, and it's not
controlling a mux to a single port, and the worst outcome then would be
that nothing would ever be reported.

Conor.

>=20
> The block that this driver calls a FIC is the generic Annapurna
> interrupt controller. It is built from groups of up to 32 triggers. The
> number of groups differs from one controller to another. Each group has
> its own 0x40 register block.
>=20
> Note the granularity, because it decides the shape of this binding: a
> node here describes ONE GROUP, not a whole controller. reg points at
> that group's 0x40 block, and the 32 hwirqs of the domain are that
> group's 32 triggers. A controller with several groups appears as several
> nodes, and controllers cascade when a tree needs more triggers than one
> controller has.
>=20
> The group registers:
>=20
>   0x00  cause
>   0x10  mask           gates the INFO output
>   0x28  group control  revision in bits 29-28
>   0x2c  error mask     gates the ERROR output
>   0x34  fatal mask     gates the FATAL output
>=20
> A group has one cause register. The mask registers decide which output a
> set cause bit drives. The classic revision has neither the error nor the
> fatal mask, and neither output; the revision that added both reports 1 in
> the control register, and every group reports it in its own.
>=20
> The SoC carries INFO, ERROR and FATAL as three separate aggregation
> trees, and a unit is required to keep them separate: mapping one event
> to more than one severity is forbidden by the interrupt methodology, so
> a group belongs to exactly one tree. A group in the error tree has the
> controller's ERROR output wired towards its parent and its INFO output
> unused. The error tree terminates in one dedicated GIC SPI, the fatal
> tree in another. The two trees differ in trigger type as well, error
> being level high and fatal edge rising.
>=20
> > What this sounds like from your commit message is that you have a new
> > revision of this block, and instead of adding an al-fic-v2 compatible,
> > you're using two new compatibles to describe the new features and using
> > the old compatible to describe the common featureset.
>=20
> Not quite, on both halves.
>=20
> There is a new revision, and no string encodes it, because of the
> granularity above. The node describes a group, and the group reports the
> revision itself, in its own control register. An amazon,al-fic-v2 would
> put a controller-level version number into a node that describes one
> group of that controller, and would duplicate a register that same group
> already exposes. 4/6 reads the register instead. v3 reports 2 there, and
> differs from v2 only by an erratum in the two new mask registers, which
> is why 5/6 is four lines.
>=20
> The strings name which output of the controller is the one connected, and
> so which of the three mask registers the driver must program for this
> group. Nothing in the block reports that. Cause, control, revision and
> the 32-trigger domain are identical in all three cases, and the choice is
> fixed when the SoC is wired.
>=20
> > Without a dts, I cannot say for sure.
>=20
> Fair, and there is nothing in tree to look at. The driver and binding
> landed in 2019 without a devicetree. Here is the topology, which v2 will
> add to the binding as an example:
>=20
>     /* group A and group B of one controller in the error tree. The
>      * controller has a single ERROR output, so both groups reach the
>      * parent through the same line.
>      */
>     err_fic_a: interrupt-controller@fd8a8500 {
>         compatible =3D "amazon,al-fic-error";
>         reg =3D <0xfd8a8500 0x40>;
>         interrupt-controller;
>         #interrupt-cells =3D <2>;
>         interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
>     };
>=20
>     err_fic_b: interrupt-controller@fd8a8540 {
>         compatible =3D "amazon,al-fic-error";
>         reg =3D <0xfd8a8540 0x40>;
>         interrupt-controller;
>         #interrupt-cells =3D <2>;
>         interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
>     };
>=20
>     /* a peripheral's own error group, cascaded into bit 6 of group A */
>     interrupt-controller@fd8a8580 {
>         compatible =3D "amazon,al-fic-error";
>         reg =3D <0xfd8a8580 0x40>;
>         interrupt-controller;
>         #interrupt-cells =3D <2>;
>         interrupt-parent =3D <&err_fic_a>;
>         interrupts =3D <6 IRQ_TYPE_LEVEL_HIGH>;
>     };
>=20
> The first two nodes are what patch 2/6 is for. The groups of one
> controller share that controller's outputs, so a real devicetree has
> nodes on one parent line, and a chained handler can only be installed
> once per parent. Cascading adds more of the same, since an aggregating
> group collects many peripherals onto the line above it. I will say that
> in 2/6 instead of "on some platforms".
>=20
> Thanks,
> Eliav

--urIKkQsF/qSUpMDX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCararwgAKCRB4tDGHoIJi
0u2/AP42rAdC4WpVkCJsHXmlfo077VIeozQGD4d6ak9nQC+5VQD/QIL6aarCAAWv
G7Mj2klJqKYv1A4fg0tTZAKnD/5o8gY=
=2Vb1
-----END PGP SIGNATURE-----

--urIKkQsF/qSUpMDX--
