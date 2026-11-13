Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572140;
	b=jIAPAr+XLDOZ+iPyfhT6iq9s4D1KqWHnmH/h5C9J1tJTq7rxNACIbR0pKUsWHcqYuyPY
	 QVInOcqTUki74w66wYmGK8I19Gn5cWAZB4ZZlyn7o59fRY0gN/yv/yqvy6rggIWXiGR1Q
	 sk0Ns4AtjN3x9RaNazrul4OdV7xZkzg8qfewUQxkCjWDiA5t8gbfIY37zHI7P0czJtQ4k
	 jHIWQY4ZkwHtc2OtDRHAZGohcW2F72wSzldTCl6ZRdFmsMA8HXdoivgLRDmL2oxWfC9X8
	 QBSO4IDapP2b6QNyA5ZUA5BvJJuHun8I6XVVW5dA4Cxy5MUgOR6nwzTJfo4kO+T87JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572140;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Akznn5x8/2l1e49bpMLHpotxCwIi2QP3ICBwS80oL8w=;
	b=lunX3oKD/g2X2bEJfqXkNcNrVT2DFO5LdkRib29LK8zG9RsWWKoDeKd3OsjiRARl/YPg
	 aitDuCsTlmNaxhp3ChJ5wbOHQ4LZKu1sKXoWsy2EMkLNCUHlLFXlWZazJLsCwDrpxLiGz
	 oDM0ZgMuR0HA7FyjcbfsxJBS/BmUgBWEHoogHQsHNtK2nEDQUEn24ZNHI6oDOzS5EbjZ/
	 sH3OyIVY83HbQZWFNX1giLxbBm0K4XR6yCxmEVSdumD8R5Mdwp2vO4TdkfKmYB8jmZqyD
	 TMzTKsfFfMRvToHF7vKIV/SGnXiF3Ii+K81An/mMAN3efusnaDNoVMxYKe4GJKk3Zjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D916A606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D916A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91ccfb88e4dso22496776d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:15:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572139; x=1795176939;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Akznn5x8/2l1e49bpMLHpotxCwIi2QP3ICBwS80oL8w=;
        b=RNe/2dupmK9P7bpyoUeVmKmJDnWbqKN5uH8cnxRV6DVa10GCOQ4GENmWdcWdE7FsW8
         dJ9pI3GbUvqWTpcHLf89UaxDBgMKQTqmyvqBlMyi78uI7gj7pIGomAkDVcHewXPQ590X
         72yn/pSVlQ8CgIbsxva40gWk9AVHSbyt95Lzhg01EVuJ3LCBYi+m1XdU0cetrMYOJ0RS
         BIkJiH6KuCI0gUUTIdAVf05paFmklBa3PuJAEzoS85MqSlm1TsMrcwg+wt+eA9N6F8x1
         VGX1g9aK0RIZr3wNsPyGFDpvwKx1GbbGkna56vZH8puXHpiBJBf2oMUOeSvW3biOJ0ZV
         p9WQ==
X-Forwarded-Encrypted: i=1; AL+hErEWSTd/dZHVmE7qUtkGu/ddD/bdDoGwpOEEsN58tSIIDnj9aNwNZ+smgYHqWFyi6aBJHyBpG69/f2Yg6YI=@vger.kernel.org
X-Gm-Message-State: APuU4Z86UVvbdaTK9zMIekdu71f8NVNheonPx6YBrHzoz9m6b6SE4D/U
	dcC53g/Bgc9WobsLR/oBmNZR26ntLiOqkbJXIHs+7IyqJTYKNHsda8Uu8/NvgSd6Q7A=
X-Gm-Gg: AYBFou03sMrZuY2Nct81cV11j+MVRc0PT0rmpo3iKy1xwKPb+6cDMEGWJwZtI7z90Uq
	pW6lM/n1+KhHjWNsqkC6WChHrrktqYAjCHmGTbmgp6gMTnmXotpN6qNs+oIO8AOO412U/GymY7M
	cBHVL0UyZWnBbBfeDfDouMjFw0cHZ3pwWnoTY8aF9e2Zbq2CLbHvxSVNMkHmdeipNzZQiikop7b
	UwO5tvcS9enx7Xyc/Nk/H6ipTx6JyrOKPhblrf5TprrrKXjKXoMRxM00DiqD3S7JiPACyGHvpVE
	CJS2beyYT9aRxOjD3KiFEF5l9NL6lCs9TxfAYUz0ANgJHu1i+qR0O9oGvzLEe30WX1Hla827rh7
	xeDKVR/AelFxMP80bGD+W8O6ApKacnUB7an7c2p/3P3Qcnc6o3iosvaJOb1kWT85xzux+I0Ec32
	iQRVm5b6+AqGdbERGlAHTADdQJHijoD/xp4p/J4Qetvy+tX2JeAU9bxQhuku/d31k1CyjmK6s/9
	bVVWdZamZzNQcjMF/lScZiUqJ4/1U6r2X6RNg3U1yFySOmd/Y0xUfbrHah1rZRgCK/vSYz0EjxO
	vwXKC1k/oRd96nKhpFUDqDTuDHkDwCy0jPFJc8qsBNqvQxvYjHs5Kmi8uVrU5a74mQjoNONhbfA
	SdBuI8WcpPfuMoT+bL+aO1u9vpUVvMa2+pmLWSwzTMQzQZ1HCD3vWakt1AA==
X-Received: by 2002:a05:6214:2e47:b0:91c:6d30:7c2c with SMTP id 6a1803df08f44-91f24234905mr27331316d6.52.1794572137467;
        Fri, 13 Nov 2026 04:15:37 -0800 (PST)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7b607sm18963616d6.26.2026.11.13.04.15.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 04:15:36 -0800 (PST)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93f2049ea7aso112770385a.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:15:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG8CET756jEamlsmgnKQDJFpBOHema8QZcrNovHWbfae9QZZd1drfPguJ5sFYYX+nzpKF5GqvWmAPkfEfc=@vger.kernel.org
X-Received: by 2002:a05:690c:9413:b0:8b3:b06d:68de with SMTP id
 00721157ae682-8b4aa3b2d79mr10574347b3.106.1794571686768; Fri, 13 Nov 2026
 04:08:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105100322.37816-1-tanure@linux.com> <20261105100322.37816-3-tanure@linux.com>
 <20261110175451.GA833369-robh@kernel.org>
In-Reply-To: <20261110175451.GA833369-robh@kernel.org>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 13 Nov 2026 12:07:55 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+2WoawiGT9zF2W+LCUhVn2QV3F9rUDBHiGtR6pddKAkNA@mail.gmail.com>
X-Gm-Features: AclHuK8ofQ5KQ8mwVSBPN6RHiYMAZFp4eZUj5gb-QcBMy0mlvdZGEaaXPcOEhAQ
Message-ID: <CAJX_Q+2WoawiGT9zF2W+LCUhVn2QV3F9rUDBHiGtR6pddKAkNA@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Rob Herring <robh@kernel.org>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 5:54=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Thu, Nov 05, 2026 at 10:03:17AM +0000, Lucas Tanure wrote:
> > The T7 has the same ethernet glue as the G12A but needs two clocks of
> > its own. The controller reaches memory through a pipeline stage with
> > its own gate; nothing else claims it, so it is switched off as unused
> > and transfers never finish. The glue registers sit in a block clocked
> > together with the MDIO multiplexer, which probes after the controller
> > has programmed them: the writes are lost and the port keeps the
> > bootloader's delays.
> >
> > So the T7 gets its own clock list, without the timing adjustment clock
> > it never uses. Its delays follow ethernet-controller.yaml: the PHY adds
> > the 2ns, and only the receive delay line offers fine tuning, so only
> > rx-internal-delay-ps is valid here.
> >
> > Assisted-by: LLM
> > Signed-off-by: Lucas Tanure <tanure@linux.com>
> > ---
> >  .../bindings/net/amlogic,meson-dwmac.yaml     | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
>
> I tend to agree with the sashiko comment, but am fine either way. Once
> the if/then schemas are longer than the main schema, it's a sign to
> split.

In V7 I will split as I think it will be easier to review.

>
> >
> > diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.=
yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > index e769c9bb70d8..ff5e50f65114 100644
> > --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > @@ -23,6 +23,7 @@ select:
> >            - amlogic,meson-gxbb-dwmac
> >            - amlogic,meson-axg-dwmac
> >            - amlogic,meson-g12a-dwmac
> > +          - amlogic,t7-dwmac
> >    required:
> >      - compatible
> >
> > @@ -84,6 +85,49 @@ allOf:
> >          rx-internal-delay-ps:
> >            default: 0
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: amlogic,t7-dwmac
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: GMAC main clock
> > +            - description: First parent clock of the internal mux
> > +            - description: Second parent clock of the internal mux
> > +            - description:
> > +                clock of the pipeline stage inserted in the bus path b=
etween
> > +                the controller and the DRAM. Without it, the controlle=
r cannot
> > +                complete DMA transfers.
> > +            - description:
> > +                clock of the register block holding PRG_ETH0 and PRG_E=
TH1.
> > +                Without it, the block reads as zero and ignores writes=
.
> > +
> > +        clock-names:
> > +          items:
> > +            - const: stmmaceth
> > +            - const: clkin0
> > +            - const: clkin1
> > +            - const: pipeline
> > +            - const: pclk
> > +
> > +        # The PHY adds the 2ns RGMII delays, see ethernet-controller.y=
aml.
> > +        # The RX delay line of this glue is fine tuning in 200ps steps=
,
>
> Sounds like constraints:
>
> maximum: 2000
> multipleOf: 200

Yes, with maximum: 3000: the field is four bits, 0 to 15 steps of
200ps.
>
> > +        # added on top of what phy-mode describes. The TX side has no =
fine
> > +        # tuning: its only step is a quarter of the clock period, the =
full
> > +        # 2ns at 1Gbit/s, so the TX property is not accepted.
>
> Move this to tx-internal-delay-ps. You can (kind of ackwardly) do:
>
> tx-internal-delay-ps:
>   description: ...
>   not: {}

dt_binding_check does not accept "not" on a property under
properties: or in an allOf entry: cell.yaml allows only description,
deprecated, const, enum, minimum, maximum, multipleOf, default, $ref
and oneOf there. It passes only inside if/then, and the new file has
no if/then. So the property stays false, with the explanation as a
comment above it.

>
> (or "not: true")
>
> > +        rx-internal-delay-ps:
> > +          default: 0
> > +
> > +        tx-internal-delay-ps: false
> > +
> > +        # Deprecated: new SoCs use the standard *-internal-delay-ps
> > +        # properties instead.
> > +        amlogic,tx-delay-ns: false
> > +        amlogic,rx-delay-ns: false
> > +
> >    - if:
> >        properties:
> >          compatible:
> > @@ -106,6 +150,7 @@ allOf:
> >            contains:
> >              enum:
> >                - amlogic,meson-g12a-dwmac
> > +              - amlogic,t7-dwmac
> >      then:
> >        properties:
> >          rx-internal-delay-ps:
> > @@ -142,6 +187,10 @@ properties:
> >        - items:
> >            - const: amlogic,meson6-dwmac
> >            - const: snps,dwmac
> > +      - items:
> > +          - const: amlogic,t7-dwmac
> > +          - const: snps,dwmac-5.10a
> > +          - const: snps,dwmac
>
> I would drop either both or at least 'snps,dwmac'. They provide no value
> because there is nothing to use them. IOW, there's not s/w that works
> which only understands the last 2 and not amlogic,t7-dwmac. Correct me
> if I'm wrong. Maybe a bootloader with simple needs.
>
> Rob

Right, nothing uses them: the generic driver cannot enable the
pipeline clock, and no bootloader drives this port from the device
tree. v7 keeps "snps,dwmac-5.10a" for the core version and drops
"snps,dwmac".

Thanks,
Lucas
