Received: from mail.lysator.liu.se (mail.lysator.liu.se [130.236.254.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA772E040D;
	Sat, 19 Sep 2026 06:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.236.254.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789798399; cv=none; b=I1L3ql4ZGorurz1ssHqkmOCn2FXELpwogSuunHRjeSRho3JwZcngUAbGl5H8NrMuMyvNq5QJNPuDd+4z9RyPvnAXhV0oKpDrGbUk4bzPdpBZKUQGJIScIDphst5iSFPNN5HTmyp9xV9E5wGJ95PScLyQZEF7gAwje28L5sgublw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789798399; c=relaxed/simple;
	bh=r0rIJEbTCjPraoleaNid+5e/bfwSclqT21BbxtXocGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKiAozHn3neVnfbyL3/tye1YaXUvfsIGfJjAXb+TI2hlKbKNitX6PBET7YhrDUKpfZHG0tluI662zwTDqa9vG3hjV7xIRQdsFtP0fFQQmfdj1M/Qyx+zuSUKN6HxOhcVZmrp5mWwia5+tyIzGAzI4dnSfBvSIjrfWKYmv2cJ4bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lysator.liu.se; spf=pass smtp.mailfrom=lysator.liu.se; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=Ojlk2QbJ; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=BowDxEo1; arc=none smtp.client-ip=130.236.254.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lysator.liu.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lysator.liu.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b="Ojlk2QbJ";
	dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b="BowDxEo1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1789797884;
	bh=r0rIJEbTCjPraoleaNid+5e/bfwSclqT21BbxtXocGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ojlk2QbJS0JUarWklSMSJ78+j5a71qmswe8chR1dJdN+aTR5/sSk29crtQq5602SV
	 SCv+TTGO2K1wyLOO7hQUDTI0wxnn8xbaefYYBIvi2oSq5iOFN9lS7mcpqDpmfGwkgD
	 gAHAWS7BMDl5leryc5LAVPDkajfwlvr5Gbv7nVJMtOGO1kkXMZ3QC/e4F46vkuNmoi
	 BSiHtT467Tm+Mmkii3sjrTQnN3sJEp5ggqGBB/OnaqaXQmOlGRkZ3kJS0im67f0lQx
	 VTPi5trNSnLglycJuHr2BI92wP0SE0Wms11Sp0UJiVWSYTkwUpKbMwQz99iuvH7+cZ
	 rsZZ4+ZiBLv4w==
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
	by mail.lysator.liu.se (Postfix) with ESMTP id 05DCD1E1B4;
	Sat, 19 Sep 2026 08:04:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1789797883;
	bh=r0rIJEbTCjPraoleaNid+5e/bfwSclqT21BbxtXocGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BowDxEo1IYdb6rY/WL1w01+BTaocQ0docKjrTzMsulIOGKgEg7Md2IQCVLhDuu514
	 LD+gxsW5mJIh6HpP/gSHkspFypatATxpjJHTbKMB716oAaWtsi9sOIGZthZwLN91/O
	 s7RVjmUyAIpLVnK7OxcE+XxOUuiOtk5HCPcMcQmt/9pG6C3UGhKCoyAm7Fr81ZlSmx
	 Th2uxUZcEhuHCDS3bPZAfCUZsuD9XIeiEgd481tJQdz2u5NffhfI4Y8Aah4pFGYZTs
	 b8xhVIe1Gw8Ggeexq4Y/99B66pmWhmEr5JnqPdOPKCt3Qqvcrh5M+p/xP3tKYVVtwH
	 A1fgzZ7txQRdQ==
Received: from gryt (81-225-28-11-no2391.tbcn.telia.com [81.225.28.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.lysator.liu.se (Postfix) with ESMTPSA id 54E541E212;
	Sat, 19 Sep 2026 08:04:43 +0200 (CEST)
Date: Sat, 19 Sep 2026 08:04:41 +0200
From: Peter Rosin <peda@lysator.liu.se>
To: rahul sharma <r-sharma3@ti.com>
Cc: Conor <mail@conchuod.ie>, Conor Dooley <conor@kernel.org>,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	vigneshr@ti.com
Subject: Re: Re: Re: Re: [PATCH 1/2] dt-bindings: mux-controller: ti: add
 binding for event mux router
Message-ID: <aq4l-dCW_dqvisj_@gryt>
References: <20260828100615.1700223-1-r-sharma3@ti.com>
 <20260828100615.1700223-2-r-sharma3@ti.com>
 <20260828-goes-scrawny-a5cf40c9514d@spud>
 <bacf61ea-91b1-454c-97aa-8c6e4ca07b16@ti.com>
 <20260915-shredder-liver-219bbc18dd18@spud>
 <62194a7f-5b7e-419a-8235-9eb46f2f2e7d@ti.com>
 <8724E360-7B38-48E2-8A5D-9BBAA69EAD06@conchuod.ie>
 <1cd03e37-a9bb-4c21-b8f6-557a1fcacc5b@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1cd03e37-a9bb-4c21-b8f6-557a1fcacc5b@ti.com>
X-Virus-Scanned: ClamAV using ClamSMTP

Den Fri, Sep 18, 2026 at 11:35:28PM +0530, skrev rahul sharma:
> Hi Conor,
> 
> On 18/09/26 03:40, Conor wrote:
> > On 17 September 2026 17: 44: 21 GMT+02: 00, rahul sharma <r-sharma3@ ti. com>
> > wrote: >Hi Conor, > >On 15/09/26 19: 19, Conor Dooley wrote: >> On Tue, Sep 15,
> > 2026 at 06: 10: 45PM +0530, rahul sharma wrote: >>> Hi Conor,
> > 
> > 
> > 
> > On 17 September 2026 17:44:21 GMT+02:00, rahul sharma <r-sharma3@ti.com> wrote:
> > > Hi Conor,
> > > 
> > > On 15/09/26 19:19, Conor Dooley wrote:
> > > > On Tue, Sep 15, 2026 at 06:10:45PM +0530, rahul sharma wrote:
> > > > > Hi Conor,
> > > > > 
> > > > > Thanks for reviewing.
> > > > > Apologies for the delay in responding.
> > > > > 
> > > > > On 28/08/26 21:57, Conor Dooley wrote:
> > > > > > On Fri, Aug 28, 2026 at 03:36:14PM +0530, Rahul Sharma wrote:
> > > > > > > Add binding for the event mux router of TI's K3 based SoC AM62L.
> > > > > > > 
> > > > > > > The TI K3 mux routers which route the GPIO input events or Time-Sync
> > > > > > > events b/w peripherals instead of routing to a CPU.
> > > > > > > 
> > > > > > > Refer Section 10.2 and 10.2.1 of
> > > > > > > https://www.ti.com/lit/pdf/sprujb4
> > > > > > > 
> > > > > > > Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
> > > > > > > ---
> > > > > > >    .../mux/ti,am62l-event-mux-router.yaml        | 79 +++++++++++++++++++
> > > > > > >    1 file changed, 79 insertions(+)
> > > > > > >    create mode 100644 Documentation/devicetree/bindings/mux/ti,am62l-event-mux-router.yaml
> > > > > > > 
> > > > > > > diff --git a/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-router.yaml b/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-router.yaml
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..a5ba7f78a156
> > > > > > > --- /dev/null
> > > > > > > +++ b/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-router.yaml
> > > > > > > @@ -0,0 +1,79 @@
> > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > +%YAML 1.2
> > > > > > > +---
> > > > > > > +$id: https://urldefense.com/v3/__http://devicetree.org/schemas/mux/ti,am62l-event-
> > mux-router.yaml*__;Iw!!G3vK!VJUh5A8cDCko1ZAGtTQ8V-
> > LL1vTj1BNr5NNBonzfy5GnFCQkP4Oc-0Kkq4xVdCcEA5bQcDckFu6UyA$ <https://urldefense.com/v3/__http://devicetree.org/schemas/mux/ti,am62l-event-mux-router.yaml*__;Iw!!G3vK!VJUh5A8cDCko1ZAGtTQ8V-LL1vTj1BNr5NNBonzfy5GnFCQkP4Oc-0Kkq4xVdCcEA5bQcDckFu6UyA$>
> > > > > > > +$schema: https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!
> > G3vK!VJUh5A8cDCko1ZAGtTQ8V-LL1vTj1BNr5NNBonzfy5GnFCQkP4Oc-0Kkq4xVdCcEA5bQcDdyRJuLcg$ <https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!G3vK!VJUh5A8cDCko1ZAGtTQ8V-LL1vTj1BNr5NNBonzfy5GnFCQkP4Oc-0Kkq4xVdCcEA5bQcDdyRJuLcg$>
> > > > > > > +
> > > > > > > +title: TI Event Multiplexer on K3 SoCs
> > > > > > > +
> > > > > > > +maintainers:
> > > > > > > +  - Rahul Sharma <r-sharma3@ti.com>
> > > > > > > +
> > > > > > > +description:
> > > > > > > +  The TI K3 mux routers routes the GPIO input events or Time
> > > > > > > +  Sync events between peripherals instead of routing to a CPU.
> > > > > > > +
> > > > > > > +allOf:
> > > > > > > +  - $ref: mux-controller.yaml#
> > > > > > > +
> > > > > > > +properties:
> > > > > > > +  compatible:
> > > > > > > +    const: ti,am62l-event-mux-router
> > > > > > > +
> > > > > > > +  reg:
> > > > > > > +    description: Register base address and size.
> > > > > > > +    maxItems: 1
> > > > > > > +
> > > > > > > +  '#mux-control-cells':
> > > > > > > +    const: 1
> > > > > > > +    description:
> > > > > > > +      Number of cells in a mux control specifier. This should be 1.
> > > > > > > +      The cell specifies which mux control to use (0-based index).
> > > > > > > +
> > > > > > > +  ti,reg-mask-val:
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > > > > > > +    items:
> > > > > > > +      items:
> > > > > > > +        - description: Register offset (relative to reg base)
> > > > > > > +        - description: Bit mask for the mux control bits
> > > > > > > +        - description: Value to write when mux is active (state 1)
> > > > > > > +    minItems: 1
> > > > > > > +    description: |
> > > > > > > +      Array of triplets specifying register offset, mask, and value for each
> > > > > > > +      mux control. Each triplet contains:
> > > > > > > +      - register offset (relative to reg base)
> > > > > > > +      - bit mask for the mux control bits
> > > > > > > +      - value to write when mux is active (state 1)
> > > > > > 
> > > > > > You have a device-specific compatible, why do you need this? If the
> > > > > > active setting depends on the device or w/e, why can that not come from
> > > > > > a mux-control-cell?
> > > > > 
> > > > > This is a boot-time/board-fixed routing decision, not a runtime-selectable
> > > > > mux that any driver ever calls mux_control_select() on.
> > > > 
> > > > 2/3 of this property appears to describe the register layout of the
> > > > device, that's not affected by the board or some boot time decision.
> > > > 
> > > 
> > > You are right about the mask element; I will move the mask into the driver since it is constant across all entries. However, the reg-offset must remain in the DT, as it is specific to each BCDMA channel's trigger line configuration. This allows the DT to define the unique routing offsets required for the hardware.
> > 
> > The reason you cite here for needing reg offset is exactly what using mux-controls from a consumer node provides.
> 
> I will refactor this to use mux-control-cells. I will drop ti,reg-mask-val
> from the bindings and instead source the reg-offset and value from the
> consumer node.

Since you have this ti,reg-mask-val in the binding I assume you have 
different setups needing different values. But, since it is obviously OK 
to handle the variation in the mux-controller DT node, it should also be 
possible to simply enumerate the different setups as different 
compatibles. Then all needed compatibles could be handled by this driver 
which would use the compatible to look up the needed values in a table.

The relevant tqble can surely not be all that large?

I prefer that over passing values in the cells, whixh seems a bit 
convoluted to me.

Cheers,
Peter
