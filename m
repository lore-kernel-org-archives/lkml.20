Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1F23ED11F;
	Tue,  6 Oct 2026 13:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791292154; cv=none; b=LIIejnN5VIV6zCgiNrfvBhJAe/3l1+KZtjsXZrpFWvuE62ynr/B9ag455T3jFGIZKOCQ3dm3BpVXJDAj5UrRWqe2TyRaUfAsQ3PdNhH3NKMfRiqLSs2JtHVnSLCFiGGAu8dmo7V8SscgqPvsbQV+bzoTUIZezs++mIZjRG1gnAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791292154; c=relaxed/simple;
	bh=KQFedXUBSor2Vi+BFxKt3Un9w3W0+ppkD0IhmQ6E3m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cV3PmtA/oV3fUckf0LYFqjvaQUHzWHzcqyNDIfk9Yr2jkiTJR4YmSWWygJuq6ktrpznVfKpQDT0cavL28s082OZ2XNa92KoBf8BTG0t43Jl6+W0cOOICX7mK6J3iCO20R8FMPEiTe3VCaAjOuCCPwK5nI72ybQK1oPRB6M5rOW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5sXnRqE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5sXnRqE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1272D1F000FF;
	Tue,  6 Oct 2026 13:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791292153;
	bh=vZztWPtp5ncZiUT/2stEBx8HKJ83ENUFyKg8/WHaRME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m5sXnRqE/1YxDuHFx4MR1iiFEHZLc1dQMugbCERm8+bPXt1WKpbJtwJ1Ue/qxKmr5
	 YH6BMvLStNfzZNwHMCDN5xka4FWYxtpyT+9wa/GfNkP67UrH8UfrEKc19rybYhfsv6
	 IF8yZCDHuOfBNdLvJR2J3oUtZVz02OeCzjzpvurSQa0zTWhe2HawVTG183HlByNFcn
	 08m6JlceV48MoPiPsoVxy0atrqa7no1iM0Xt1dCWpBFJj2LLq3CQJtU9YKXY2dHeRt
	 Eh5/bqZEFcTQ8Eh1NfGjc2C1+/yQk8tzWD3IKi7h489qNPnEXLtm1/07X5fGOylPIF
	 4cdzUhTf6H1Iw==
Date: Tue, 6 Oct 2026 14:09:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Raiden Lumine <2557597107@qq.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	ovidiu.panait.oss@gmail.com, jacobsfeder@gmail.com
Subject: Re: [PATCH 1/2] dt-bindings: misc: add binding for Xilinx AXI-Stream
 FIFO
Message-ID: <asTy8HmiLNfR2RN7@squawk>
References: <tencent_517661DA7DB5CFD22DE073FD269BED407507@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FW4p7Z2079+Juyly"
Content-Disposition: inline
In-Reply-To: <tencent_517661DA7DB5CFD22DE073FD269BED407507@qq.com>

--FW4p7Z2079+Juyly
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2026 at 07:29:54PM +0800, Raiden Lumine wrote:
> The axis-fifo driver's compatible strings were undocumented, flagged
> by checkpatch.pl as UNDOCUMENTED_DT_STRING. Add a devicetree binding
> document for drivers/staging/axis-fifo, derived from the properties
> the driver reads via of_property_read_u32() in axis_fifo_parse_dt().
>=20
> Signed-off-by: Raiden Lumine <2557597107@qq.com>

pw-bot: changes-requested

Please see previously explained (multiple times) rationale for why this
is not a simple conversion:
lore.kernel.org/all/?q=3Ddfn:axis-fifo

Thanks,
Conor.

> ---
>  .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 191 ++++++++++++++++++
>  1 file changed, 191 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fifo-=
mm-s.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.ya=
ml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
> new file mode 100644
> index 000000000000..219a7de223cc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
> @@ -0,0 +1,191 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/misc/xlnx,axi-fifo-mm-s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +$defs:
> +  xlnx-uint32-zero:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    const: 0
> +    description: Must be 0, this feature isn't supported.
> +
> +title: Xilinx AXI-Stream FIFO v4.1 IP core
> +
> +maintainers:
> +  - Jacob Feder <jacobsfeder@gmail.com>
> +
> +description: |
> +  This IP core has read and write AXI-Stream FIFOs, the contents of whic=
h can
> +  be accessed from the AXI4 memory-mapped interface. This is useful for
> +  transferring data from a processor into the FPGA fabric. The driver cr=
eates
> +  a character device that can be read/written to with standard
> +  open/read/write/close.
> +
> +  See Xilinx PG080 document for IP details.
> +
> +  Currently supports only store-forward mode with a 32-bit
> +  AXI4-Lite interface. DOES NOT support:
> +    - cut-through mode
> +    - AXI4 (non-lite)
> +
> +properties:
> +  compatible:
> +    enum:
> +      - xlnx,axi-fifo-mm-s-4.1
> +      - xlnx,axi-fifo-mm-s-4.2
> +      - xlnx,axi-fifo-mm-s-4.3
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    const: interrupt
> +
> +  xlnx,axi-str-rxd-tdata-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    const: 32
> +    description: AXI-Stream RX data width, must be 32.
> +
> +  xlnx,axi-str-txd-tdata-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    const: 32
> +    description: AXI-Stream TX data width, must be 32.
> +
> +  xlnx,rx-fifo-depth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Depth of RX FIFO in words.
> +
> +  xlnx,tx-fifo-depth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Depth of TX FIFO in words.
> +
> +  xlnx,use-rx-data:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    description: Set to 1 if RX FIFO is enabled, 0 otherwise.
> +
> +  xlnx,use-tx-data:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    description: Set to 1 if TX FIFO is enabled, 0 otherwise.
> +
> +  xlnx,axi-str-rxd-protocol:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: Ignored by the driver.
> +
> +  xlnx,axi-str-txc-protocol:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: Ignored by the driver.
> +
> +  xlnx,axi-str-txd-protocol:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: Ignored by the driver.
> +
> +  xlnx,axi-str-txc-tdata-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Ignored by the driver.
> +
> +  xlnx,axis-tdest-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Ignored by the driver.
> +
> +  xlnx,axis-tid-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Ignored by the driver.
> +
> +  xlnx,axis-tuser-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Ignored by the driver.
> +
> +  xlnx,data-interface-type:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Ignored by the driver.
> +
> +  xlnx,has-axis-tdest:
> +    $ref: '#/$defs/xlnx-uint32-zero'
> +
> +  xlnx,has-axis-tid:
> +    $ref: '#/$defs/xlnx-uint32-zero'
> +
> +  xlnx,has-axis-tkeep:
> +    $ref: '#/$defs/xlnx-uint32-zero'
> +
> +  xlnx,has-axis-tstrb:
> +    $ref: '#/$defs/xlnx-uint32-zero'
> +
> +  xlnx,has-axis-tuser:
> +    $ref: '#/$defs/xlnx-uint32-zero'
> +
> +  xlnx,rx-fifo-pe-threshold:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Ignored by the driver.
> +
> +  xlnx,rx-fifo-pf-threshold:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Ignored by the driver.
> +
> +  xlnx,s-axi-id-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Ignored by the driver.
> +
> +  xlnx,s-axi4-data-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Ignored by the driver.
> +
> +  xlnx,select-xpm:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Ignored by the driver.
> +
> +  xlnx,tx-fifo-pe-threshold:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Ignored by the driver.
> +
> +  xlnx,tx-fifo-pf-threshold:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Ignored by the driver.
> +
> +  xlnx,use-rx-cut-through:
> +    $ref: '#/$defs/xlnx-uint32-zero'
> +
> +  xlnx,use-tx-ctrl:
> +    $ref: '#/$defs/xlnx-uint32-zero'
> +
> +  xlnx,use-tx-cut-through:
> +    $ref: '#/$defs/xlnx-uint32-zero'
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - xlnx,axi-str-rxd-tdata-width
> +  - xlnx,axi-str-txd-tdata-width
> +  - xlnx,rx-fifo-depth
> +  - xlnx,tx-fifo-depth
> +  - xlnx,use-rx-data
> +  - xlnx,use-tx-data
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    axi_fifo_mm_s_0: axi-fifo-mm-s@43c00000 {
> +        compatible =3D "xlnx,axi-fifo-mm-s-4.1";
> +        interrupt-parent =3D <&intc>;
> +        interrupts =3D <0 29 4>;
> +        reg =3D <0x43c00000 0x10000>;
> +        xlnx,axi-str-rxd-protocol =3D "XIL_AXI_STREAM_ETH_DATA";
> +        xlnx,axi-str-rxd-tdata-width =3D <0x20>;
> +        xlnx,axi-str-txc-protocol =3D "XIL_AXI_STREAM_ETH_CTRL";
> +        xlnx,axi-str-txc-tdata-width =3D <0x20>;
> +        xlnx,axi-str-txd-protocol =3D "XIL_AXI_STREAM_ETH_DATA";
> +        xlnx,axi-str-txd-tdata-width =3D <0x20>;
> +        xlnx,rx-fifo-depth =3D <0x200>;
> +        xlnx,tx-fifo-depth =3D <0x8000>;
> +        xlnx,use-rx-data =3D <0x0>;
> +        xlnx,use-tx-data =3D <0x1>;
> +    };
> +...
> --=20
> 2.55.0
>=20

--FW4p7Z2079+Juyly
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasTy8AAKCRB4tDGHoIJi
0o28AP9kmracDSEVYwhylPFvQLztYB5bEWlk8FMqjJwnDzyuSgEA5kzcxiej2eOo
xnynpx6Md1u3blwI5UiMSGJkMn1ljAI=
=kMW6
-----END PGP SIGNATURE-----

--FW4p7Z2079+Juyly--
