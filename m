Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091CF3BA241
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788814220; cv=pass; b=O4lyZuyFRd8BBy/+efD8gcSSuiGqyNh4JDw6RiTiFEb/E8yA33NsNVNbNSitS6ejeXWT8SrrwJk+CiMwbD8+DmSX3nPqH2JaDyjcfRBQqm+T7zMfGN7M4GaApPVODvVsk1N3nIEIsuzEA0ywp1F8TDARufNOVjyd1HFuGn8MvtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788814220; c=relaxed/simple;
	bh=t5lkYks03f0lapLNTPD7Yf2VD9f3/ex/p6KhGLTnYWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TG2E7hNdBjajiZ4yFUNvV1P7NeZQYtYOUzNSrQxsp3o4PTVQ+EFCxfySOU2K9kKpnloPHVnowaLzzPiEzvQxWEeQRg/ki9OIrB3hIXN2WdPH35M7yia7aXBmmTAcr2hnD8UUO0KYwRzw/SbF3PB9S6Uu/5j2htsBdJYxusTyTHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sxZZV71k; arc=pass smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sxZZV71k"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-98089686ee7so2426070241.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:50:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788814217; cv=none;
        d=google.com; s=arc-20260327;
        b=GqUXSpalIXBADXpgALrt718Ie0X65khIKnqyj9M1VEHVu9FH49+w58NvZ2EKGYHHY2
         IvBEY4j5zdkBXDV7wGA9TjfEgF9PJ7zVmSAl2/KnEIcjZvLEqsOnUAv2dglTqoWc1bxt
         cwa26uKJcjpr52Z64VfC5NHQ4y9RDDFru9jdsB3ad9adNprZALhbLiLNRE0IZEoQuO3L
         bkbjtMhMg7/ohez66m9AT4kJWKQyOfaCuMIfSOxwntegrvESlGgHv/mra5zK9b55YfIA
         EW/LmH/YDclemQzGOGfd+q24d5/mt5hu4ZrmJPDRFj4a47cCpPy0b5F87Gv9/rV4w4nZ
         sAiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mjfnZqizjVN7NjFTQ1u5HltmdduRJe/9atcwnkcBqCg=;
        fh=y+iTzJgmax/DjxPUF1/rxN9OyDwauZ+82Ts9E1b+Ues=;
        b=YaYS/ctEQruikTD82eNqwQw0bP5qC59YIdgWWanf1RRnUZ2ozs2oQmSo4gIqx38h88
         Br48zkAT1n51AaxZHxth019NSxwjyV2Lgc/2NUmcwfyAjgOVoKTC6wAq7Mxf3tIxGRu8
         SqiI2Rw/HCf42RihqRB/F7MMy6auuWEZbBWECgVCS2dxAzeQvs6ifxQCE3z6Eu/28X28
         YXNnZn6R9/yTr6ctaeKYE8+oTVWw6As9LsvKL5atzBT6zjXPJ+2JezGHSUwr06nj7NUd
         PkcCY9nwNpyKeEfDN5aC7pLwpFcyhDDS/adyyz4pN0Hv0p24S+h1sa3kJJxdyjdxBE1r
         7ifA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788814217; x=1789419017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mjfnZqizjVN7NjFTQ1u5HltmdduRJe/9atcwnkcBqCg=;
        b=sxZZV71kN545bZ4TLBNFukN5HQl1zOm3RweTbEmJnfWd1FwiYWxaQ8Kti7neUI6BKM
         CYgVjsgRdrRfPKQU45JhASXTEQFpdTnk5aoAm3G+XZ2hvBrvNF6Tj3qxGE+2fH9TRnLp
         3PMtnP/NT36KQWEYipv/M5Ysc79EgjK/+JVslWRY2Z8VUllLZWLe+7YEDWYTxxfi5Mym
         DAlKaC75bXiUPCGMh0jHXvh53yD054872sTAEKL1Z4l5o7vQz9ZeMLIkydW0aQAP80XS
         Ulou72OflodUTp3KhU+/H+1jE8AqZ8CyKgUL9fzfyTHrlSISoBMeeeHWrG+ax45gpELB
         uowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788814217; x=1789419017;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mjfnZqizjVN7NjFTQ1u5HltmdduRJe/9atcwnkcBqCg=;
        b=P8cHp7uX6tkyWZZep/2w4NBi4ZfnMFvL0MzekRdEbn2GOpylt3vfCvgTsEmS6k86yx
         mhmCVYwDHkugMY5x5ijQjPEQOVcaIwe5BEhBySN2bTBKKs2XPWc72AW2vzEJZ5ztSIHq
         MuJwe18x3jtXmpXXOABC6Dzb6N+N+m110gnt0nOkvVBfPLAxcZDGobTtdLjEriaA87i3
         PgUtGAxBinyyAFMGuPjV+dV/qNnwcGPIfw5XpmxDSnEuDc90JmfReDMvmQgP+r/Ow+QI
         JY6HhDjMDzvf62UQU7rp/RWPVN8wEcA8YQWBFV3KutUw0aXPv9sn37XjIztd7h0nEoNN
         gPAQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6vHg8oRI72wh4MrA0v8baaoMDQW1LO4ew+fRWAWOr1Bxl2+s/gAljt9dCeyH7Apxc4fypvSM7QO3tPLg=@vger.kernel.org
X-Gm-Message-State: AFuF++lpvvxrENaOq7kK9tVxx8mLQl3VN41QAEMm5V8g8qQD+otGkrWR
	n4TllZfUumi3+JJi7UfMQSsPqQpFPPrLMbyez7nnSNquXrMEblRX+SPlhyF2tXf8n9kwodx+41T
	3BlV1AinKZ9EzZJtZK1AjHzjhHX3OlmY=
X-Gm-Gg: AYBFou3LWoCYoFqUnleNe1ouV/fWW5cAZHp110t+6P4E5gTER/yV+nTu+elDbvmSvHI
	HbD/XSBXyQijamDqTNXDTQqMqPFqxZyo9KNf5Bhaar0tK3Pj/ZOgo/y/NbV9qmF3F85tTpQsoVQ
	YDCcVHl5CXHFXLPqPxl52J6X11O3ZR/zwmRl3ctcuf+V66nSHSZ1LN/1f5w39Un8WRtj8KlaKCN
	NliB+uAl0ihPfPN0v3ZCSZsVYWPdtzlTam2vxphEHJiylsh/Y4mWdzrzcVzFdlIvQgGacRqZ/Cc
	OHU0+uAYcpFq4twofy1d2BrT5C4D7nTING5cwLkszRE+V8wY3sKsuG4cTM8n9koHx45d0JqSq12
	Jcx2c4xxpFxBham4nx4pxVmguTUs5wcQb5Jp7c6yRDpU5F6quvwhYgQ6ZlzyqtKM3ijkyrJ2PGq
	JEsvCjhfblr5a5sOaQQPyve/BWEBMXhTmrFsrGaNgcv/T4SR0V
X-Received: by 2002:a05:6102:570f:b0:785:e444:15de with SMTP id
 ada2fe7eead31-78a4a8b86c6mr10812036137.6.1788814215815; Mon, 07 Sep 2026
 13:50:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com>
 <20260903-submit-ac200-mfd-v9-3-6b7ed278989c@gmail.com> <20260904-overpass-clumsy-8ccdd5d4ca0e@spud>
 <CADvTj4qKxyPZMLBZgpNMMxkFn09MUCNEc9nLva-j=24C_Zg-nw@mail.gmail.com> <20260907-tipping-clique-47e2a3385336@spud>
In-Reply-To: <20260907-tipping-clique-47e2a3385336@spud>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 7 Sep 2026 14:50:04 -0600
X-Gm-Features: AcwNN1VORbNFDqsrr8Pk6MK9PbURMNQUa7VsBhGkuPMzBQJH4dNmUMVklO_r7rU
Message-ID: <CADvTj4qLQ+3ckFK=HEsCEM=4R_Dej-1e3Z1UTFMbH3YTz=GfWw@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] dt-bindings: mfd: x-powers: Describe AC200 functions
To: Conor Dooley <conor@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	"Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, Andre Przywara <andre.przywara@arm.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
	mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 12:28=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Fri, Sep 04, 2026 at 01:06:08PM -0400, James Hilliard wrote:
> > On Fri, Sep 4, 2026 at 9:50=E2=80=AFAM Conor Dooley <conor@kernel.org> =
wrote:
> > >
> > > On Thu, Sep 03, 2026 at 02:09:42PM -0600, James Hilliard wrote:
> > > > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > >
> > > > Describe the AC200 audio codec and TV encoder as child nodes of the
> > > > shared I2C register provider. Keep their analog supplies on the fun=
ction
> > > > consumers and describe the TV encoder display graph and optional ba=
ndgap
> > > > calibration cell.
> > > >
> > > > Add the shared interrupt-controller properties and interrupt number=
s needed
> > > > by the TV encoder. The Ethernet PHY remains represented on its prim=
ary MDIO
> > > > bus and is therefore not an MFD child.
> > > >
> > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > > ---
> > > >  .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 136 +++++++++=
++++++++++++
> > > >  MAINTAINERS                                        |   1 +
> > > >  include/dt-bindings/mfd/x-powers,ac200.h           |  13 ++
> > > >  3 files changed, 150 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.y=
aml b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > > > index ca7a910b2c73..935dc07138cb 100644
> > > > --- a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > > > +++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > > > @@ -28,15 +28,114 @@ properties:
> > > >        be 24 or 27 MHz, matching the rates encoded by the documente=
d EPHY clock
> > > >        selector.
> > > >
> > > > +  interrupts:
> > > > +    maxItems: 1
> > > > +    description:
> > > > +      The shared open-drain INTB output for the TV encoder, Ethern=
et PHY and
> > > > +      RTC interrupts.
> > > > +
> > > > +  interrupt-controller: true
> > > > +
> > > > +  '#interrupt-cells':
> > > > +    const: 1
> > > > +    description:
> > > > +      The interrupt number, as defined in
> > > > +      include/dt-bindings/mfd/x-powers,ac200.h.
> > > > +
> > > > +  codec:
> > > > +    type: object
> > > > +    $ref: /schemas/sound/dai-common.yaml#
> > > > +    unevaluatedProperties: false
> > > > +
> > > > +    properties:
> > > > +      compatible:
> > > > +        const: x-powers,ac200-codec
> > > > +
> > > > +      '#sound-dai-cells':
> > > > +        const: 0
> > > > +
> > > > +      ac-ldoin-supply:
> > > > +        description: The 3.3 V supply for the audio codec LDO inpu=
t.
> > > > +
> > > > +    required:
> > > > +      - compatible
> > > > +      - '#sound-dai-cells'
> > > > +      - ac-ldoin-supply
> > > > +
> > > > +  tv-encoder:
> > > > +    type: object
> > > > +    additionalProperties: false
> > > > +
> > > > +    properties:
> > > > +      compatible:
> > > > +        const: x-powers,ac200-tve
> > > > +
> > > > +      interrupts:
> > > > +        maxItems: 1
> > > > +        description: Cable detection interrupt.
> > >
> > > Given the example, this looks like a hack.
> > > Is this mfd actually an interrupt controller, or is that just part of
> > > this hack too?
> >
> > The AC200 has separate TV encoder, Ethernet PHY and RTC status and
> > enable bits which are multiplexed onto its shared INTB output, so the
> > intent was to represent that demultiplexer as an interrupt controller.
> >
> > I notice that the example's tv-encoder interrupts property inherits
> > interrupt-parent =3D <&pio> rather than explicitly referencing the AC20=
0
> > interrupt domain. Is that incorrect interrupt relationship what looks
> > like a hack here, or do you also object to representing the AC200
>
> No, I noticed the lack of an explicit parent but attributed it to a
> mistake. The define used in the child node, and the interrupt properties
> in the parent are why I considered it a hack - the device looked like it
> was pointing to itself as it's own interrupt parent. How would this work
> for the rtc, since that is implemented without a child node?

There isn't an RTC driver in this series; only its interrupt source was
described. A future RTC MFD cell could receive the shared parent IRQ
without requiring a separate DT node.

> Personally I would just implement these devices using IRQF_SHARED.

I've implemented that approach in my local v11 tree. The binding now
describes the optional INTB connection without interrupt-controller
properties or internal interrupt numbers.

The MFD driver passes the physical IRQ to the TV encoder cell when
connected. Without INTB connected, the cell has no IRQ resource.

Function drivers remain separate work. They will need to request
IRQF_SHARED | IRQF_ONESHOT handlers before enabling their own source,
check and clear their own status in the threaded handler, and mask their
source before freeing the IRQ. The parent initially masks all sources
before enabling INTB.

> > interrupt demultiplexer as an interrupt controller?
> >
> > > Quite frankly, I am not really sure why either the tv-encoder or code=
c
> > > have dedicated child nodes, they don't appear to have conflicting
> > > properties.
> >
> > Do you mean that the DT properties for both functions should be folded
> > into the AC200 parent node, while the MFD driver still creates separate
> > codec and TV encoder platform devices?
> >
> > Lee requested at least two MFD children in this series, so I want to
> > distinguish the Linux MFD cells from whether those cells need dedicated
> > firmware child nodes.
>
> I don't see Lee requesting that they be in the devicetree though, just
> that there are two mfd children. mfd_cell would (IMO) qualify for that.
>
> I don't see anything here that'd be problematic in terms of folding the
> codec and encodering into the parent mfd device and using mfd_cell, given
> the phy is not represented here.

I've moved the audio DAI properties, supplies, bandgap calibration cell
and display ports into the AC200 parent node. The codec and TV encoder
remain separate Linux devices described by static MFD cells, without
separate DT nodes. Their supply lookups use MFD parent-supply aliases.
The PHY remains on MDIO.

> >
> > > Additionally, why is this not part of patch 1? Add the binding in a
> > > complete state from the get-go. On that basis, at least,
> > > pw-bot: changes-requested
> >
> > Do you want patches 1 and 3 combined into one complete binding patch,
> > while retaining separate implementation commits for the base provider
> > and the MFD cells?
>
> Correct.
>
> > > > +
> > > > +      tv-vcc-supply:
> > > > +        description: The 3.3 V supply for the composite-video DAC.
>
> Are these genuinely different 3.3 V supplies btw? Or are you just
> representing them as two different ones because of different device
> nodes using them?

They correspond to distinct physical supply inputs: TV_VCC is pin 1 and
AC_LDOIN is pin 2, both nominally 3.3 V. The AC200 datasheet lists these
separately:

https://linux-sunxi.org/images/0/0f/AC200_Datasheet_V1.1.pdf

They do not require separate external regulators; the example connects
both to reg_aldo2. The revised parent-node descriptions now explicitly
state that these inputs may share a regulator.



> Cheers,
> Conor.
>
> > > > +
> > > > +      nvmem-cells:
> > > > +        maxItems: 1
> > > > +
> > > > +      nvmem-cell-names:
> > > > +        items:
> > > > +          - const: bandgap
> > > > +
> > > > +      ports:
> > > > +        $ref: /schemas/graph.yaml#/properties/ports
> > > > +
> > > > +        properties:
> > > > +          port@0:
> > > > +            $ref: /schemas/graph.yaml#/properties/port
> > > > +            description: Input from the display pipeline, carrying=
 CCIR656.
> > > > +
> > > > +          port@1:
> > > > +            $ref: /schemas/graph.yaml#/properties/port
> > > > +            description: Output to the composite-video connector.
> > > > +
> > > > +        required:
> > > > +          - port@0
> > > > +          - port@1
> > > > +
> > > > +    required:
> > > > +      - compatible
> > > > +      - interrupts
> > > > +      - tv-vcc-supply
> > > > +      - ports
> > > > +
> > > > +    dependencies:
> > > > +      nvmem-cells: [ nvmem-cell-names ]
> > > > +      nvmem-cell-names: [ nvmem-cells ]
> > > > +
> > > >  required:
> > > >    - compatible
> > > >    - reg
> > > >    - clocks
> > > >
> > > > +allOf:
> > > > +  - if:
> > > > +      required:
> > > > +        - tv-encoder
> > > > +    then:
> > > > +      required:
> > > > +        - interrupts
> > > > +        - interrupt-controller
> > > > +        - '#interrupt-cells'
> > > > +
> > > > +dependencies:
> > > > +  interrupt-controller: [ '#interrupt-cells', interrupts ]
> > > > +  '#interrupt-cells': [ interrupt-controller ]
> > > > +
> > > >  additionalProperties: false
> > > >
> > > >  examples:
> > > >    - |
> > > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > > +    #include <dt-bindings/mfd/x-powers,ac200.h>
> > > > +
> > > >      i2c {
> > > >          #address-cells =3D <1>;
> > > >          #size-cells =3D <0>;
> > > > @@ -45,6 +144,43 @@ examples:
> > > >              compatible =3D "x-powers,ac200";
> > > >              reg =3D <0x10>;
> > > >              clocks =3D <&pwm 5>;
> > > > +            interrupt-parent =3D <&pio>;
> > > > +            interrupts =3D <1 20 IRQ_TYPE_LEVEL_LOW>;
> > > > +            interrupt-controller;
> > > > +            #interrupt-cells =3D <1>;
> > > > +
> > > > +            codec {
> > > > +                compatible =3D "x-powers,ac200-codec";
> > > > +                #sound-dai-cells =3D <0>;
> > > > +                ac-ldoin-supply =3D <&reg_aldo2>;
> > > > +            };
> > > > +
> > > > +            tv-encoder {
> > > > +                compatible =3D "x-powers,ac200-tve";
> > > > +                interrupts =3D <AC200_IRQ_TVE>;
> > > > +                tv-vcc-supply =3D <&reg_aldo2>;
> > > > +
> > > > +                ports {
> > > > +                    #address-cells =3D <1>;
> > > > +                    #size-cells =3D <0>;
> > > > +
> > > > +                    port@0 {
> > > > +                        reg =3D <0>;
> > > > +
> > > > +                        tve_in: endpoint {
> > > > +                            remote-endpoint =3D <&tcon_out_tve>;
> > > > +                        };
> > > > +                    };
> > > > +
> > > > +                    port@1 {
> > > > +                        reg =3D <1>;
> > > > +
> > > > +                        tve_out: endpoint {
> > > > +                            remote-endpoint =3D <&composite_in>;
> > > > +                        };
> > > > +                    };
> > > > +                };
> > > > +            };
> > > >          };
> > > >      };
> > > >  ...
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 1d03b0060bda..8a48f6a1e593 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -29511,6 +29511,7 @@ L:    linux-sunxi@lists.linux.dev
> > > >  S:   Maintained
> > > >  F:   Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > > >  F:   drivers/mfd/ac200.c
> > > > +F:   include/dt-bindings/mfd/x-powers,ac200.h
> > > >
> > > >  X-POWERS AXP288 PMIC DRIVERS
> > > >  M:   Hans de Goede <hansg@kernel.org>
> > > > diff --git a/include/dt-bindings/mfd/x-powers,ac200.h b/include/dt-=
bindings/mfd/x-powers,ac200.h
> > > > new file mode 100644
> > > > index 000000000000..cc59e2ab4912
> > > > --- /dev/null
> > > > +++ b/include/dt-bindings/mfd/x-powers,ac200.h
> > > > @@ -0,0 +1,13 @@
> > > > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > > > +/*
> > > > + * Interrupt numbers of the X-Powers AC200 interrupt controller.
> > > > + */
> > > > +
> > > > +#ifndef _DT_BINDINGS_MFD_X_POWERS_AC200_H
> > > > +#define _DT_BINDINGS_MFD_X_POWERS_AC200_H
> > > > +
> > > > +#define AC200_IRQ_TVE                        0
> > > > +#define AC200_IRQ_EPHY                       1
> > > > +#define AC200_IRQ_RTC                        2
> > > > +
> > > > +#endif /* _DT_BINDINGS_MFD_X_POWERS_AC200_H */
> > > >
> > > > --
> > > > 2.53.0
> > > >
