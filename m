Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90D13F20FA;
	Fri,  4 Sep 2026 15:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534807; cv=none; b=Gyq2kqUI3kF0z0kY0dnrFG7YHpN8c+ig7r7C4yH8UBGKfHHGs1WG1Ulcvjy1h+kpbqRaHSYpERnPFSFfdYK3KTn6cegzCNk2QqCF/Ommrl34DxQVb2mAG0S3Vm0lKfJ0koV7hfTptWPhI7g7Tj0fDFumdB8lg2jWaY813xhpgBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534807; c=relaxed/simple;
	bh=9UGSVSWEsvgVrMeDVlKr7Xq7H8N1d1FB/lW5GVXJEwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPq3JiNHdA7StZ7KSmXahaMV7lJlZVy77FlJoutBuZGByMXI4pZUrcpM8jmHQApGdVLoRy3NrgsCH0p8KeAnlM8IsF6/KBqhtq32QfsaqR29yguGx45nlNm7iDRbgFOyGMJpQArddpokDBWVjrnCGVQxFVzyxhhvW6pNAVLQ2TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4Zwt+Vs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4Zwt+Vs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA60D1F00AC4;
	Fri,  4 Sep 2026 15:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788534805;
	bh=N4iGKOoDlN94x19GjcNK/TDFb68ODJwUEU94wGmW6Xc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J4Zwt+VsF3Fa7VjPxXfaqNMO485jFoUsqtKI6wJ5Pld+nF0h5Jur3zGsVTICL2OgI
	 o5kZSi1JNMqPj+vi4lENGk/6D3vjZo/3omUibDmD0m8FTIuf9a3Mcmu43d6VLfdhGQ
	 m4X3q5xag1CMV8m+cmFQyufZ+oCJaadmJntSqr4jdYBQ+azrGNuPse/3nM4+qJVtWb
	 adQ+uUJ3pePDTzcdG4mRy00aYBb51j4Qz61c33pNF/NCebzm1IGMnFhjmzUrKPM0On
	 gyMWQ29uD1jyHaqIShKVz1EVvpeua6Kc00JDuXsMDdAMc90pBKvUF/N1c8qkfEkJOm
	 8FsRCHMkydDLA==
Date: Fri, 4 Sep 2026 16:13:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Philippe Baetens <philippebaetens@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add Mira016 image sensor
Message-ID: <20260904-unstylish-diffused-0cc26d303461@spud>
References: <20260904-mira016-v2-0-1dcf7b3a807e@ideasonboard.com>
 <20260904-mira016-v2-1-1dcf7b3a807e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hfNr6R+a9JSWQcDh"
Content-Disposition: inline
In-Reply-To: <20260904-mira016-v2-1-1dcf7b3a807e@ideasonboard.com>

--hfNr6R+a9JSWQcDh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 04, 2026 at 12:43:40PM +0200, Jacopo Mondi wrote:

> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        mira016: camera-sensor@36 {

Drop the two unused labels here if there's a v3,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

pw-bot: not-applicable

Thanks,
Conor.

> +            compatible = "ams,mira016";
> +            reg = <0x36>;
> +            clocks = <&cam1_clk>;
> +            vdd28-supply = <&cam1_reg>;
> +            vdd11-supply = <&cam_dummy_reg>;
> +            port {
> +                mira016_ep: endpoint {
> +                    data-lanes = <1>;
> +                    link-frequencies = /bits/ 64 <750000000>;
> +                };
> +            };
> +        };
> +    };
> +...

--hfNr6R+a9JSWQcDh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaprgEAAKCRB4tDGHoIJi
0oCpAPsFFV5Sr7q7x49BJ97p5g2yNPk3aZCQVvAhh1ILaHZ3rwEAkRlr5q2V2dnv
p3ATl4abnVoYcvAYWWowELUJJcYmOAk=
=GIbP
-----END PGP SIGNATURE-----

--hfNr6R+a9JSWQcDh--
