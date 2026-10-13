Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED39253340;
	Tue, 13 Oct 2026 09:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883535; cv=none; b=WbTaf3sBKp+0iOpVmJY1JNuoTDZZhDhHow6GOQPJxd0+8JnnfmlAdMqr7oLJa5O2eDAwYOaLQG9VhDopwrTz6PjAAY58QAE0cZZ7ou+8fArnVNcFSzCUoxU83cGyatMtOG5Ntx6KXXap2l2U/0Xd9k2P++nas+bjm9zrfeEhGFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883535; c=relaxed/simple;
	bh=rxZJBJDsxmsHlF2qv0o2cdL+vdHCQvUBc9m5c7w/snE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IwPv2mozMnvEMbMGj5nVwx+a8G6zyMbYh+KVhsMNIT/xRa8REWgnvIecRT+qwAeB/Gb1Ncvv76Ft/jm8ptRffSK/B2mwwD+HXOQHQIT/7ECVcKDP6io0lscUqVaaMwDaukHOa7p5ufQ7a2Q/5pRhDZ8Df9/Ti3yl0COURt+lwKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ItHLRmvf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ItHLRmvf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BFA01F000FF;
	Tue, 13 Oct 2026 09:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791883533;
	bh=PkpYyMfOzUplew1Dtf8zFVGUOzNuIj8FG4Krh+zYlds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ItHLRmvf3AD0w/a32vrzPuQduwe8iXhSUNJCZLqBPKubEQIjUwVt6JRovVxBoia8B
	 w3MAxTWqK8s2++Gp9K0C+WqY5zO2LN6bo/tz2qfEoEsZwBnZWGu41eIaSbnLX9OaRT
	 DCDCQ1CwKPM35BE7huLaH1pbG9VayiJdeB5ik6rIE5LvwFRtS6wyF1eC0Jyw70zSyf
	 PC+n963wiaTBl6DCTxsiQnfCQUHkjMxZyPI1lQ7RI194e+WuQEKvgJJo+nRQ57FXg5
	 QmeV3zxY2NNhw9/63B49LW8s3Ae3E9fit+m0Vs6ycAfahUmHYlXZlcUbRTNZDCR2Dy
	 hKa8vWgcAkqrg==
Date: Tue, 13 Oct 2026 11:25:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, p.zabel@pengutronix.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Daniel Thompson <daniel@riscstar.com>
Subject: Re: [PATCH 1/2] dt-bindings: reset: introduce
 toshiba,tc9564-reset.yaml
Message-ID: <20261013-avocet-of-original-renovation-a8db59@quoll>
References: <20261012164354.3872326-1-elder@riscstar.com>
 <20261012164354.3872326-2-elder@riscstar.com>
 <20261012-shale-rosy-805c49f6c404@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012-shale-rosy-805c49f6c404@spud>

On Mon, Oct 12, 2026 at 07:51:18PM +0100, Conor Dooley wrote:
> On Mon, Oct 12, 2026 at 11:43:52AM -0500, Alex Elder wrote:
> > Define the binding for the reset controller functionality present in
> > the Toshiba TC9564 SoC.
> > 
> > Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> > Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> > Signed-off-by: Alex Elder <elder@riscstar.com>
> > ---
> >  .../bindings/reset/toshiba,tc9564-reset.yaml  | 56 +++++++++++++++++++
> >  MAINTAINERS                                   |  7 +++
> >  include/dt-bindings/reset/toshiba,tc9564.h    | 26 +++++++++
> >  3 files changed, 89 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
> >  create mode 100644 include/dt-bindings/reset/toshiba,tc9564.h
> > 
> > diff --git a/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml b/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
> > new file mode 100644
> > index 0000000000000..1908e9539abac
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
> > @@ -0,0 +1,56 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/reset/toshiba,tc9564-reset.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Toshiba TC9564 Reset Controller
> > +
> > +maintainers:
> > +  - Alex Elder <elder@riscstar.com>
> > +  - Daniel Thompson <daniel@riscstar.com>
> > +
> > +description:
> > +  The Toshiba TC9564 is an SoC accessed by a host system through the
> > +  upstream PCIe port on the PCIe switch it implements.  The switch
> > +  includes an embedded PCIe endpoint that provides access to various
> > +  SoC peripherals (including a reset controller) via its BARs.
> > +
> > +  A total of 13 resets are implemented, though two of these are not
> > +  controllable.  Access to the reset controller relies on PCIe being
> > +  functional, so the PCIe reset is assumed to be deasserted.  Similarly,
> > +  the PCIe controller relies on I2C, so the I2C reset is also assumed
> > +  to be deasserted.
> > +
> > +  Reset ids are defined in <dt-bindings/reset/toshiba,tc9564.h>.
> > +
> > +  The reset controller uses registers within the same page as a
> > +  clock controller, so both devices are defined as children of a
> > +  "config" syscon.
> > +
> > +properties:
> > +  compatible:
> > +    const: toshiba,tc9564-reset
> 
> Why does this need to exist as a standalone device, rather than be
> rolled up into the parent syscon node? It doesn't have any resources, so
> it should be doable.

I am asking to fold into the parent for multiple revisions now.

> 
> This kind of thing for a syscon is always difficult to review when only
> one element is present - where is the rest of the syscon's
> functionality?
> 
> Thanks,
> Conor.
> 
> > +
> > +  "#reset-cells":
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - "#reset-cells"
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/reset/toshiba,tc9564.h>
> > +
> > +    syscon@0 {
> > +        compatible = "syscon", "simple-mfd";

Such combination is not allowed. Bindings produce a warning, probably.
Anyway, node is pointless here.

Best regards,
Krzysztof

