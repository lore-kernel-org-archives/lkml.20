Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F3D37F339;
	Wed, 23 Sep 2026 15:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175852; cv=none; b=tfs+jWteRPEeYP+VrDCN9JzDAUln16zJIettYxW7Z43zi7n2aeHs9q8KH07xhnR0JNJM2RB9O6McvRhVOCmdwp/F9aOOVTmVq/LOcm4Gr3erzeFOgezRHSO24nF0uNmFTGxpk0Vz2D2P4nqPHXHtftb0mmgH5KGgLZIs7Q4D8gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175852; c=relaxed/simple;
	bh=uTJqJYri0QvmQvrYQ0xJpsho88RYe5rDGLL9uGp0kgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDhKoaYH+bBmXIFddruaA+ns5XSAEuyL3wI502QFpldh31CbpA6SGE/aKLNTXoYhIBcuJ0p92tkK4V3q22yDybX6mcZaX/yeHooXNde9IPRdWz5qC2YVNgNRCnZ3fWBhPB+F134aynu00rVj9QjT8NuwN7vC04Pe4VQ35+rVJqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NCTa9NLG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NCTa9NLG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DCBE1F000FF;
	Wed, 23 Sep 2026 15:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790175850;
	bh=EBwjIZDKfun2zrL9E4dNc/T4J4zF9FUO6dKyh0B3FjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NCTa9NLGFZRIWCIe1CzcwAWNx7b/8EYkY9lKFagdQvCwYIz1XSrjFaGXEfivEPSLU
	 gBd3eFL9t7JZe4K0Yl4ZIcd+TjgH2//fXhi6us4SKoiZCm47DsxM7KsADJHMjGaYzr
	 pT2eWqe4Eqi7+uRBsFkAb1Urxra6w+zsdncC94Z5QsPIUZHUxpZ9lU6Pmenn+DGn8H
	 bDrww/sOyZMwE8vYh5YMlskX8zEYJC7v6N//s7ec/rH8uAVa6HSZ1bgafifYO/nHG0
	 hXXoUItPc2Q/ofoWzq2WPhauKOz3DpRUV3Av+ltK877NQzYa/aGbX6TwBcHtJVHeg4
	 G5KXF3IlLDSHQ==
Date: Wed, 23 Sep 2026 10:04:09 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Wei Xu <xuwei5@hisilicon.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: hisilicon: Add HIP05 CPLD
Message-ID: <20260923150409.GD27237-robh@kernel.org>
References: <20260921232540.3128596-1-robh@kernel.org>
 <20260922-cheer-reference-c31fc6fb946d@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-cheer-reference-c31fc6fb946d@spud>

On Tue, Sep 22, 2026 at 07:06:02PM +0100, Conor Dooley wrote:
> On Mon, Sep 21, 2026 at 06:25:39PM -0500, Rob Herring (Arm) wrote:
> > Add schema for the hisilicon,hip05-cpld node on the HIP05 D02 board. The
> > node only contains the compatible string and one register window on the
> > local bus.
> > 
> > Assisted-by: LLM
> 
> Guidance to the LLM should probably include including the reason that
> this is being added to the commit message.

Not sure what you are looking for... I told it to convert all the .txt 
bindings to schema. Then I told it fix all the errors. Then I fixed some 
things throughout the 900 commit branch upstreaming things bit by bit.  
Then it mostly sat for a year and I told a new model to review them and 
fix these common problems a, b and c. Then I said fix all the 
dtbs_checks warnings on arm64. Then I said there's still warnings, do it 
again. Repeated that ~10 times. Now I'm going thru to weed out all the 
wrong and sometimes unnecessary changes.

So LLM did all the easy parts and I did everything that requires any 
judgement. The hardest part is typically just figuring out the 
correct maintainers...

> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  .../soc/hisilicon/hisilicon,hip05-cpld.yaml   | 35 +++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml b/Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml
> > new file mode 100644
> > index 000000000000..f9d48b871a4b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml
> > @@ -0,0 +1,35 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/hisilicon/hisilicon,hip05-cpld.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: HiSilicon HIP05 CPLD registers
> > +
> > +maintainers:
> > +  - Wei Xu <xuwei5@hisilicon.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: hisilicon,hip05-cpld
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    local-bus {
> > +        #address-cells = <2>;
> > +        #size-cells = <1>;
> > +
> > +        cpld@100000000 {
> > +            compatible = "hisilicon,hip05-cpld";
> > +            reg = <1 0x0 0x100>;
> 
> Also what's with this example? 1 0x0 0x100 should be 0x1 0x0 0x100?

Shrug. Sure. Honestly, I think the example can just be dropped.

I'm converting all the crap no one cares enough about to convert. That's 
pretty much all of the HiSilicon stuff. Mediatek needs some renewed 
public shaming too. I only care about getting arm64 down to no warnings.

Rob
