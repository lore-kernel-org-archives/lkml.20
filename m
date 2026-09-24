Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D06346D550;
	Thu, 24 Sep 2026 16:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268754; cv=none; b=dW2NEhUPOkYu4Ln8PWNwQWbvPdAB3SdgmZ+PCxPgKALv7K2ka/fcCR5xDrUrEiTEykil3sK1zQnz1iaIEYrqbIRdAJL4LWwkmQG9piyY8IRTx9mn9d2UtoOJQtk2MFkQanOK/o7JOfIgWugQEvorCFoq28jyEmix38yzXGwxCUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268754; c=relaxed/simple;
	bh=v7HnoaQ2DJqHoRhT5g5xnT7NWzslyzwb5b65hkO+JjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHLspzs/d1RXIdQsIQOZaXDjQZatJe+D7kklwA5Di+yyItRRZVK8uU3si3GQ2+rcLg42FDh6pI8isME2T3iHBDyGMsJKEmKhpnKixFB0h8JJckJj6wtfjeqnZnVVEAWEPAwAFHy57FMkiTJTqpa3SK/fEgO67U9ZJjYX4zJcpHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZTjgZFl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZTjgZFl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86FD21F000FF;
	Thu, 24 Sep 2026 16:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790268753;
	bh=Axs9vTENUlVv/iuxcZQdrtB/H2nIyFzT7gnpJTwPjJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DZTjgZFlsU+im82UnhXuuzQN89Hi0nE2oRTk68fOAYqfYI22II0Ux6SuihWg9V4cw
	 sSB8YoaIwNQOYQ+UQyqJoDsKgnZ9xEg7ix0HDDGNUA1Td3QrD1EbVPXcqnA8VjZT9v
	 WSfLB4x2B2flkaU32mzMzCJEqwXzc2EFLjS/WJpY2zovsknmzUEUoetszlcSdvA90x
	 wCmyEhGnPG5SrKuahasZquIYNzrfZdEdBCay/dHZBGIuXjeI7knmMzPLJ6d4/bK06i
	 TkkZVuN/LGMC00pKPAPtyOvqoVy6V/L9NNHWJKipC3TsJuIy9Kqb0pH5oVOYwL3gu1
	 bWMPlgHIlPh2w==
Date: Thu, 24 Sep 2026 17:52:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Tushar Nimkar <tunimkar@amd.com>
Cc: Tushar Nimkar <tushar.nimkar@amd.com>,
	Anirudha Sarangi <anirudha.sarangi@amd.com>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>, git@amd.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: interrupt-controller: Add Xilinx
 Versal NET SMMU CSR
Message-ID: <20260924-multitask-rewrite-b82222a968c7@spud>
References: <20260923-smmu-changes-v2-v3-0-87bd09ba9605@amd.com>
 <20260923-smmu-changes-v2-v3-1-87bd09ba9605@amd.com>
 <20260923-grafted-undergrad-9356739dd2b5@spud>
 <359fecbc-0f0a-4498-84ec-b0ddac5987d0@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Az4FDzzBdrdVw0zR"
Content-Disposition: inline
In-Reply-To: <359fecbc-0f0a-4498-84ec-b0ddac5987d0@amd.com>

--Az4FDzzBdrdVw0zR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 01:13:13PM +0530, Tushar Nimkar wrote:
> Hi Conor,
>=20
> Thanks for review.
>=20
> On 9/23/2026 10:11 PM, Conor Dooley wrote:
> > On Wed, Sep 23, 2026 at 12:46:31PM +0530, Tushar Nimkar wrote:
> > > From: Anirudha Sarangi <anirudha.sarangi@amd.com>
> > >=20
> > > Add a device tree binding schema for the Xilinx Versal NET SMMU CSR
> > > (Control and Status Register) interrupt controller.
> > This sounds like a very odd name for an interrupt controller.
> > What else does this block do?
> >=20
> > You've actually got a 0x1000 carve out in the example, starting at a
> > round number, so I suspect this is "fine" and if there's other features
> > required later you've not painted yourself into a corner by defining a
> > device for one register. The driver having a starting offset of 0x24 is
> > another point in your favour.
>=20
> The SMMU_CSR is a Xilinx-specific integration block for the ARM SMMUv3. It
> provides interrupt enable, status, and clear registers for SMMU interrupt
> sources before forwarding them to the parent GIC. The binding models the =
CSR
> block as a whole, allowing future integration-specific functionality to be
> added if needed.
>=20
> >=20
> > I'm inclined to ack this, I just want to see an answer first.
>=20
> thanks=A0 a much !!

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

>=20
> -Tushar
>=20
> >=20
> > Cheers,
> > Conor.
> > > The SMMU CSR block acts as a vendor-specific interrupt controller
> > > in front of the ARM SMMUv3, providing registers to enable and clear
> > > standard SMMU interrupts such as EVENTQ, CMDQ_SYNC, GERROR and PRIQ.
> > > Interrupts must be acknowledged in this block before being forwarded
> > > to the parent interrupt controller (e.g. GIC).
> > >=20
> > > Signed-off-by: Anirudha Sarangi <anirudha.sarangi@amd.com>
> > > Co-developed-by: Tushar Nimkar <tushar.nimkar@amd.com>
> > > Signed-off-by: Tushar Nimkar <tushar.nimkar@amd.com>
> > > ---
> > >   .../xlnx,versal-net-smmu-csr.yaml                  | 75 +++++++++++=
+++++++++++
> > >   1 file changed, 75 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/x=
lnx,versal-net-smmu-csr.yaml b/Documentation/devicetree/bindings/interrupt-=
controller/xlnx,versal-net-smmu-csr.yaml
> > > new file mode 100644
> > > index 000000000000..38b63e51b732
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/interrupt-controller/xlnx,ver=
sal-net-smmu-csr.yaml
> > > @@ -0,0 +1,75 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/interrupt-controller/xlnx,versal-=
net-smmu-csr.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Xilinx Versal NET SMMU CSR Interrupt Controller
> > > +
> > > +maintainers:
> > > +  - Anirudha Sarangi <anirudha.sarangi@amd.com>
> > > +  - Tushar Nimkar <tushar.nimkar@amd.com>
> > > +
> > > +description: |
> > > +  The Versal NET platform includes a Xilinx-specific SMMU CSR (Contr=
ol and
> > > +  Status Register) block that acts as an intermediate interrupt cont=
roller
> > > +  for ARM SMMUv3.
> > > +
> > > +  The block provides registers to enable, disable and clear the
> > > +  standard SMMUv3 interrupt sources (EVENTQ, CMDQ_SYNC, GERROR and P=
RIQ)
> > > +  before forwarding them to the parent interrupt controller,
> > > +  typically a GIC.
> > > +
> > > +  The controller receives one parent interrupt and demultiplexes CSR
> > > +  status bits into the following child interrupt identifiers
> > > +    0 - EVENTQ
> > > +    1 - CMDQ_SYNC
> > > +    2 - GERROR (GLOBAL)
> > > +    3 - PRIQ
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/interrupt-controller.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: xlnx,versal-net-smmu-csr
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupt-controller: true
> > > +
> > > +  "#interrupt-cells":
> > > +    const: 1
> > > +    description: |
> > > +     Single cell containing the child interrupt identifier
> > > +      0 - EVENTQ
> > > +      1 - CMDQ_SYNC
> > > +      2 - GERROR (GLOBAL)
> > > +      3 - PRIQ
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupt-controller
> > > +  - "#interrupt-cells"
> > > +  - interrupts
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +
> > > +    interrupt-controller@eca10000 {
> > > +        compatible =3D "xlnx,versal-net-smmu-csr";
> > > +        reg =3D <0xeca10000 0x1000>;
> > > +        interrupt-controller;
> > > +        #interrupt-cells =3D <1>;
> > > +        interrupt-parent =3D <&gic>;
> > > +        interrupts =3D <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
> > > +    };
> > >=20
> > > --=20
> > > 2.34.1
> > >=20

--Az4FDzzBdrdVw0zR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarVVTAAKCRB4tDGHoIJi
0nPWAP9Cke6a/OoNCAde0ixyXe+N8DEoOlv6T/D6BrL3FERNtgD+Nzd5iN40XBlk
l//YqLqEr1ClzW+HDY9QYIgtH4me0w0=
=B5s0
-----END PGP SIGNATURE-----

--Az4FDzzBdrdVw0zR--
