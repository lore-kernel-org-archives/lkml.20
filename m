Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F634AF9D1;
	Wed, 14 Oct 2026 10:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972911; cv=none; b=jdGbrCUk/+cI28yNVrmsJ2KyrI8Qv1QMWaRBXO4ZaBycEekVEuIJX0RFIahOdO+F2GimLUrlO7h0uIf7NqiwDzpmmv7cw7TsWtT3ezibmeT3j1RTbsIDQ6i1XuOfRMQBwUZXnyTlayEfgtG5dscoHO1zBc0cpuzioAXlagihfc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972911; c=relaxed/simple;
	bh=IyiMC/7L8ddTzbXi/DosSBYcQkMAzmGnr3QGHCm0w10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9eRCYWd8Uz7fr+0AlE6rsIxFg1LRzRd3mRvOxyBAY3jQ3wvdoJsr/KpD5sTYZFMWVt5iWL8SKA5cA/+YaaohcTYLwdQYUrhLr50aFAjhHyxK6wyG7Ejo0I7Va9t3mqMVP+LPTYchh9EKpcwdsx+GKD93TRM2wxTFL5KK5W2AEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mfFbkIog; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mfFbkIog"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787F01F000FF;
	Wed, 14 Oct 2026 10:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791972908;
	bh=8s63Is0mg1yN3zimSvvyykqUxqabDFR91jb6goIGD9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mfFbkIogQkETTigAoePS3PK3PlBTgxWtqEoja6BEqmmNqSIElVKo/htX8vYKBy5uO
	 t0PDK09B1c3ZwNevj3wKwGZgep2uAyzeDa1r6TDT+DolcWX3DQ7KcSUUKC3G0rIcTJ
	 LXESbnR9tstzW+HE2de6v+MQED1PGiaj8J6kxGTtgYtVOphkd36wVamcPJmulVMHT+
	 8POlPwVF867EECdD6cgiTzLDoCtlU3xwWEai33RrH7xaoTnjAQ+m1Q+BNY38gNKE38
	 NIExkrjRKqFtO8rWXt5PYdUL3IuRNqQpcZvBm9sloTNg17i47w1DdfEB8wVLCfQovB
	 nP4bRBfdxwmHQ==
Date: Wed, 14 Oct 2026 12:15:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, tglx@kernel.org, radu@rendec.net, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Daniel Thompson <daniel@riscstar.com>
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: introduce
 toshiba,tc9564-msigen.yaml
Message-ID: <20261014-eminent-normal-lynx-3ebba3@quoll>
References: <20261012190245.3988619-1-elder@riscstar.com>
 <20261012190245.3988619-2-elder@riscstar.com>
 <20261013-coexist-sixtyfold-cc6614086d3a@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261013-coexist-sixtyfold-cc6614086d3a@spud>

On Tue, Oct 13, 2026 at 06:54:11PM +0100, Conor Dooley wrote:
> On Mon, Oct 12, 2026 at 02:02:43PM -0500, Alex Elder wrote:
> > Define the binding for the MSIGEN interrupt controller present in the
> > Toshiba TC9564 SoC.
> > 
> > Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> > Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> > Signed-off-by: Alex Elder <elder@riscstar.com>
> > ---
> >  .../toshiba,tc9564-msigen.yaml                | 70 +++++++++++++++++++
> >  MAINTAINERS                                   |  6 ++
> >  2 files changed, 76 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564-msigen.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564-msigen.yaml b/Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564-msigen.yaml
> > new file mode 100644
> > index 0000000000000..39dc63964bd52
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564-msigen.yaml
> > @@ -0,0 +1,70 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/toshiba,tc9564-msigen.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Toshiba TC9564 MSIGEN Interrupt Controller
> > +
> > +maintainers:
> > +  - Daniel Thompson <daniel@riscstar.com>
> > +  - Alex Elder <elder@riscstar.com>
> > +
> > +description: |
> > +  The Toshiba TC9564 is an SoC accessed by a host system through the
> > +  upstream PCIe port on the PCIe switch it implements.  The switch
> > +  includes an embedded PCIe endpoint that provides access to various
> > +  SoC peripherals (including an interrupt controller) via its BARs.
> > +
> > +  The TC9564 MSIGEN (MSI Generator) provides an interrupt controller
> > +  with 25 hardware interrupt lines.  It aggregates internal interrupts
> > +  and generates a single PCIe MSI to the host.  Each PCIe function
> > +  implements an MSIGEN instance.
> > +
> > +  Each MSIGEN uses a gated clock and reset line.  These are provided
> > +  by the clock and reset controllers internal to the TC9564.
> > +
> > +allOf:
> > +  - $ref: /schemas/interrupt-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: toshiba,tc9564-msigen
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupt-controller: true
> > +
> > +  '#interrupt-cells':
> > +    const: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description: Gate clock from the TC9564 clock controller
> 
> I'm surprised that the clock is not mandatory.. Realistically the reset
> is also mandatory, there's probably one instance of this on the device,
> where both clock and reset are connected. I'd add both to the required
> list.
> 
> Otherwise this looks
> fine to me. I know you mentioned this device in the other series that
> we were discussing but I don't see how it is related and is perfectly
> fine to implement as a standalone device as you have done here.

I still do not understand why do we need to describe the inner wirings
of the tc9564 device. So far I found no posting of DTS showing proper
usage of it on the host. Without proper usage, what is the point exactly
to describe the inner specifics of tc9564?

Best regards,
Krzysztof

