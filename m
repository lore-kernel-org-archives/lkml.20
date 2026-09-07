Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0418F4457BC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771649; cv=none; b=sUod9TVWdmpyzYvl4cIzdn5oH4OElqnw2q5EdvEGX3cngM76cJXjEL2z+z4sNXzzrBf1kHu2LVlGJXSxYtk9mbCAmaVCLDpuwQWDNxO9ms3qb/ei6DK9Nv9fuXvcJd8ZDWl82ySfjxvTwJ0WjAM4SqWaYKxJP2IaViRcfRZ0pic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771649; c=relaxed/simple;
	bh=qjss7lUF3Y/rjAuBg4W/OXETaJBt4OSrrAlxAxeAmRM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PeIAfEF4jCuYV0ckCUfH0es1mGroC5y2Ic4pWwCGwVkEwX5Hq/SdUCt93znAcyV2D2rHfD03r5y5JeyHGngGIYwvmzcF2GX/kSMhFLPrDDxB2rdBYVgq39Ual+edev0ga066QknHonso0dmviw1DyZw/W6eM2TSe+op3SQoibs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=orNrfk0D; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="orNrfk0D"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso3786119a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788771646; x=1789376446; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xy+IN57SJ+erwNKooouJ4W3oQbU76/YCXs2psoMgnps=;
        b=orNrfk0DLL/SslqOLptfIovxTS3FAeTif3FOeRmEyh/z42QMFnlx3bBcPFh5WcXfeJ
         D8LnFPPxZnQ5OMefWFCAZgJWTRXHk5v4KS7Run5GpNgxPF3NmrVeNt9+HRExuabIexfZ
         a5p6I3LX9/vH21vj1Nqyjw0jBFCBLs2xRu6hsiWjZZ4y+9iZfLm4IJGOitDEZ4rm+S2A
         hNNzefbB5+DTYTtNXevMa8MCoGiKewCqtn5hKa+/9dIR0OPBSzYFIYhQXgja54lj7+nr
         Gq8G8ezzNMGotwyBloL7PKU7cBV/bUhpRH/p/13v6YIQ+OEi2jMhKwIggQ3vAk2QdWYO
         cDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771646; x=1789376446;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xy+IN57SJ+erwNKooouJ4W3oQbU76/YCXs2psoMgnps=;
        b=L9HWGNQRlhUDyEpWpWZ/aoAOGbEht/EvKhlBvPHYleY39mULSbW/JvXL6Fr5VsYAWC
         Gb/0IDCiosAWbvna5RkStrI0cYAP8VaplzVW0beLRHXx0p/O1Sqnf6KvPCcU/OTWXQOy
         pmVLgpGbOPE6QvzuLrgYlVC0ORDmMIYNvQ/7QfbSPq14gej3k7IPgf5PD4PNcqV4iGT2
         x6JSto5EckzjoSqhrAS5FkmwuT3onR72EjM9u4P9GQ+wb6lptV4n44yva7cMDUXG9Dz4
         Ecnpf6al26p6EXjMnnwxW7/YyqvABY73FYRZkPLubI+uZWkdMrmkP9/Ka9WCqKifKR3h
         LRRw==
X-Forwarded-Encrypted: i=1; AKwUvBwviIgQstogj4YZ5cjnQjmFUjn2GmQ1v1V9stuSx0UNTfU7ANdma8LMsZ7cIB4yDTzLjS3FW6CwTKuaIFg=@vger.kernel.org
X-Gm-Message-State: AFuF++kBaxxx1Ao4i7Dn0tl15LaHu32GwQ7WMd5ZsUzX4ebjPUxyvKh8
	UH94rXi4CIVe8PRGvqnl/5QtCXZFlNTNx0mBTVOdT/GZ+yeVh/zoYjjj
X-Gm-Gg: AYBFou1inkE2NY4GT/OOdOmRbhEe+I37lN10AtJLYR2YseXOoAbbzUd2p260uOsmhZR
	uYUGLsMa8WM2DCsiQrYygeG+AmF61/Y6LBILqRzXqfJenctVNPMmpYqdJPRRxIazXVT4GkmifHT
	4JkChfB493GKS1XRyH9812CiQUmJ4tECFHN67MtEZuJLZaqxXVj3F4W5+4ceXrbM0Qvk92RHGcV
	1wgIJkFdKGQLOvjPDvryGUbfHer2FY1J1zlM61yuLpZNzWesILkZgLDrPlWO9FpyyziVg04EQRu
	8oMWmcCZVcxkt6wlxJkk0kI2Xf4GyUZrI6FlVuIF1Pr5unYbf6WaA/DQ1e5slqX9KsA5B9gC6Qh
	F+Zpmi1NzujYPAWNMLltiNlg8Hjgxdx2hXiX7/+V9wa6+1x7+zBWEo/Yk+W+oe+wPGE9hiO8h6l
	KatBvIcWf/8aTUv4zVZ5TbNcXHCKfvntwymsswoyU2uh2q5qvRd39m306OZFXxPuB+z9ywjHgd/
	UAa1/A/Zw5vMCBTxjqh+TMsNM2sv2qhGGI=
X-Received: by 2002:a05:6938:a084:20b0:c26:3107:71dd with SMTP id a640c23a62f3a-c2631077920mr261082266b.13.1788771644348;
        Mon, 07 Sep 2026 02:00:44 -0700 (PDT)
Received: from Ansuel-XPS. (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5bb9a9sm420312466b.55.2026.09.07.02.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:00:43 -0700 (PDT)
Message-ID: <6a9e7d3b.0f5dc47b.330412.df04@mx.google.com>
X-Google-Original-Message-ID: <ap59OSq9XsFz44OY@Ansuel-XPS.>
Date: Mon, 7 Sep 2026 11:00:41 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: airoha: Document support for
 AN7583 USB PHY
References: <20260901123933.15388-1-ansuelsmth@gmail.com>
 <20260901123933.15388-2-ansuelsmth@gmail.com>
 <20260907-auspicious-liberal-raccoon-bd7a81@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-auspicious-liberal-raccoon-bd7a81@quoll>

On Mon, Sep 07, 2026 at 08:35:56AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Sep 01, 2026 at 02:39:31PM +0200, Christian Marangi wrote:
> > Add documentation for Airoha AN7583 USB PHY that describe the USB PHY
> > for the USB controller.
> > 
> > Airoha AN7583 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> > always supported. The USB 3.0 mode is optional and depends on the Serdes
> > mode currently configured on the system for the relevant USB port.
> > 
> > To correctly calibrate, the USB 2.0 port require correct value in
> > "airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
> > selecting one of the 4 monitor clock for calibration (internal clock not
> > exposed to the system) but each port have only one of the 4 actually
> > connected in HW hence the correct value needs to be specified in DT
> > based on board and the physical port. Normally it's monitor clock 1 for
> > USB1 and monitor clock 2 for USB2.
> > 
> > To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
> > property is required with the phandle pointing to the correct Serdes port
> > provided by the SCU node. Providing the phys property is optional if USB
> > 3.0 is not used.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../bindings/phy/airoha,an7583-usb-phy.yaml   | 133 ++++++++++++++++++
> >  1 file changed, 133 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
> > new file mode 100644
> > index 000000000000..f1a5d83e8968
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
> > @@ -0,0 +1,133 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/airoha,an7583-usb-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha AN7583 SoC USB PHY
> > +
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com>
> > +
> > +description: >
> > +  The Airoha AN7583 SoC USB PHY describes the USB PHY for the USB controller..
> > +
> > +  Airoha AN7583 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> > +  always supported. The USB 3.0 mode is optional and depends on the Serdes
> > +  mode currently configured on the system for the relevant USB port.
> > +
> > +  On Airoha AN7583 there is an unified PHY implementation where a single
> > +  PHY provide support for both the 2 USB 2.0 port and
> > +  optionally one 3.0 USB.
> > +
> > +properties:
> > +  compatible:
> > +    const: airoha,an7583-usb-phy
> > +
> > +  reg:
> > +    items:
> > +      - description: phy register
> > +      - description: ana register
> > +      - description: pma register
> > +      - description: dig register
> 
> "registers"
> 
> > +
> > +  reg-names:
> > +    items:
> > +      - const: phy
> > +      - const: ana
> > +      - const: pma
> > +      - const: dig
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  usb3-phy:
> > +    type: object
> > +
> > +    properties:
> > +      phys:
> > +        items:
> > +          - description: phandle to Serdes PHY
> > +
> > +      '#phy-cells':
> > +        description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
> > +          as defined in dt-bindings/phy/phy.h.
> > +        const: 1
> > +
> > +    required:
> > +      - phys
> > +      - '#phy-cells'
> > +
> > +    additionalProperties: false
> > +
> > +patternProperties:
> > +  '^usb2-phy@[0-9a-f]+$':
> 
> You should not mix MMIO and non-MMIO children. Either children have
> distinctive addressing, or not. Not both.
> 
> The other problem is that your children have no resources, so are not
> really distinctive children and should be folded in to the parent.
> 
> I already asked that at v2, so let's finish with asking: drop the
> children.
>

I misunderstood the request and tought it was only related to the PCIe
part.

I'm not really sure how to drop the child without complicating the node
structure a lot (also I feel dropping the child would make the description
of the HW less clear and I would like to prevent that)

The register for the usb2 node 0x0 and 0x1000 are offset of the register
declared in the parent node 0x1fac0000. For usb2 1 the phy registers are at 
0x1fac0000 - 0x1fac0200, for usb2 2 the phy register are at
0x1fac1000 - 0x1fac1200.

The driver read this offset and apply it to every register access for the
related phy.

The usb2 child are needed for the specific airoha,usb2-monitor-clk-sel
property since it's specific for the usb 2.0 phy.

Also would like to stress that these PHY are all part of the same register
block.

One solution might be to just classify the usb2 node as 0x0 and 0x1 and
handle internally the register mapping with the driver. But again the
problematic thing is map the monitor-clk-sel with the relevant USB 2.0 phy.

Any hint on this? Is it ok to keep the child node and use 0x0 and 0x1?

-- 
	Ansuel
