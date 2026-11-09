Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238945;
	b=5hFcQcXSvJZB3RFxgmvJRfr7IiWh76X5I3jb/ZexD1jhgKj4/muujluPSmRSdOgJsiNF
	 +rYyY92FDLB/TuKGg0V1ys/LUOrewrTZfIb/a0GOMfo2S9jFpuF08BR4Kz3XqKrrX/hcR
	 7LEBi4Wemvae7MrKJljYqrehJ6O44PYVbyzL+kjgaRanx07dfUS9L/F/USa3YdSXZqc1s
	 WyowCVi7aH5Vtg8VdNOOqwyClA+/GIKoYUYC5aQYGj6Wux03H+5zdMUKyTP4HNA2qzkF5
	 X3rCQhlfmP+H0aTGmgMaegwia5BAVDoQwDk7Dzhg5pgnRVNzOQm9nLuNs0gPQcEd3Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238945;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xG4pMlSywf90fG++ZmuGwd6o+rUWkZppXqxcs9JhM2Y=;
	b=4DAaTqiNOGzMI3WPhxGNvTARhEt1C5noIeEUcdrGCnLsvyuq9I76z6JX51vVGxF5pL6J
	 Tf+X08JYvrr3I/oYhdf9ON5ngGwnk8s0wNXZFHVKVIVn/M9oM0IeVxN0L/HL54mS5VRH9
	 AhqpgZ2yb1axTy+eRcJYBpMK0yehDEi3J64UO3LxyHkr2xELvQcvhXE3GBN2rzssRReVC
	 TLSeDxcW3wKL39RfRNemzH93sKc5Phr7zmPARa88+Vuv5Xf5Tui6lc6soYECrF3ql1dES
	 VbHo2S2eEN7G0lhDsKtjBRUTkKE75hh66xrtV6Y7vgZCRVw9zguLwbsTeA6Qjec+0SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F194606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F194606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b305d38bafso7064977b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:42:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238944; x=1794843744;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xG4pMlSywf90fG++ZmuGwd6o+rUWkZppXqxcs9JhM2Y=;
        b=Jjg048ujhPFTjR3GtWhCeMWwT22MWGyPRFv+dmzENrw3AL3Psi2mGpqHNpqyQoWi97
         OQxteHr1WCrlLeiZqNI2ZpjIw8VH94HsjlEILutFDniI/qIly4DiGDAGnfgIv2n7TYEN
         m8f/StYu5/yVfxVA8FStxQ3IIFLmdPkzPEHSKC2en3XAZrIuKO2ogrHuiSRykfCwzAXX
         /0liyCXSuv0xSO8MJ+mgeo8bnvCqQ8ma+CbmxyV5S6BTlZwHAKB4gPa4lKMPhM15Jkou
         1BYEoeDi/97+8DKDV1c5ERKyebRCbCV5RAkZ7eKKSF9SdBOc+strf/CU2YYsL/+sGl9o
         l4RQ==
X-Forwarded-Encrypted: i=1; AL+hErFHsEFU5SKU6Q6Fk+qCgzQsV3Ib2s3kyK5bec4A5SllM+8QeGmWu2utrLtxrYxb8HLiILQ+KeKn+9R5tDE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mV2fS1XTNUu0NpngyBegWHj6+7+rcbe409fyV5Ic2/s9WVsjf
	FCDAFxwPXnhUfHr+zFiSLAjqPfD4C3zpwLeTxeomFDh3upURvjeqRBJ5+0ZCrV+p/5A=
X-Gm-Gg: AYBFou31AD9Cfg7Updf3g6Gt58i05pUplwuaANPJyPluRCa6ScXwsq0hJak4r6YVegK
	d0WqtndQpSxy1CAYGE56tQ1G+pTqj3RQkLWk9LCIV9ssQZEFZe8D/n+aJNFyPHOUESXqtaSEEoI
	tuzzR5lw2ckumeBJb7D+CfYde7UXzQV830uyXiqDZTz2UCv47uTUJ8RAVu3Y3wsjYedudfkcn6o
	mdJW8Lt9bojU/WT/JTFyQ50fdv0hwFeFeVskNurMPRqOnLWpEWbY8KGn+ea6026sq1JSU9yj+X7
	YSb3d0lOEghKcytPg+N92K7aLkmDhDJ3pENqqOYWqxIyS9bikl+3qYLqhzOFNqQZN1Sxe+no+26
	IRiv5+q1duiTl92kXua/HlTvTRukxBEQy4obO9OtvqZNYgH5l19gVNdPzJAy+IpWvHJOfbvViLr
	3TIXV3zHC2F5KaoIA+MBLiP9h4cfYSuutku8u3ZMVRp3INJ/ENoJ4ePCYlWIQI3JWgM0JULI2jj
	kt6byO5iNX58HxIJ5Qh17tF5RybaTusvnEASWf8xZJaxXdahxqacBamFrTe1GVk5KdvjNxGOCl0
	031POGk7nG1FZD0UgvoFjeFz4tU1WHhjUC6atwXVhg2L2SKqKIUnIQa7JiO4xMtvh5CWGmoazcS
	lcS7xVeFqWaWmUVruzl7lEddQqHGy0+e7mUCpgWn4i/ujbdltQsRLYZHX
X-Received: by 2002:a05:690c:920b:b0:8b3:90db:a864 with SMTP id 00721157ae682-8b390dbcf43mr998147b3.11.1794238944031;
        Mon, 09 Nov 2026 07:42:24 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bc2c768sm38427057b3.30.2026.11.09.07.42.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:42:23 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b308fca7c3so8630257b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:42:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFw2AAJSBPEyu0R3pVgux4CdBJQ9zMjbkgpe0/yT8tOcX9CJUdRY1nbSUfZLZ9ExVX0jp1eoYXRljOLZzk=@vger.kernel.org
X-Received: by 2002:a05:690c:c4e6:b0:8ae:8d28:77be with SMTP id
 00721157ae682-8b36c8542c6mr28200577b3.1.1794238943160; Mon, 09 Nov 2026
 07:42:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103163715.385394-1-tanure@linux.com> <20261103163715.385394-3-tanure@linux.com>
 <20261105-stoic-cricket-of-tolerance-cb3014@quoll>
In-Reply-To: <20261105-stoic-cricket-of-tolerance-cb3014@quoll>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Mon, 9 Nov 2026 15:42:11 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+1OMHo_VWD2+0RUfF6EUNbLLNZafDuHxCBzU_qALBa2hQ@mail.gmail.com>
X-Gm-Features: AclHuK81wJVzU4rFeRI7sUHF0-2FEAkn5jMEtF1UQ-EscSMzMfyyODCM_UAkaVg
Message-ID: <CAJX_Q+1OMHo_VWD2+0RUfF6EUNbLLNZafDuHxCBzU_qALBa2hQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 11:57=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Nov 03, 2026 at 04:37:10PM +0000, Lucas Tanure wrote:
> >
> > Assisted-by: LLM
>
> Drop this one.
>
> > Signed-off-by: Lucas Tanure <tanure@linux.com>
> > ---
> >  .../bindings/net/amlogic,meson-dwmac.yaml     | 59 +++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.=
yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > index e769c9bb70d8..6de013e3e8f6 100644
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
> > @@ -57,6 +58,59 @@ allOf:
> >              - const: clkin1
> >              - const: timing-adjustment
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
>
> This sounds like you take clock from other block. That's wrong, that
> device should take its own clock.

It is this device's clock, the description is misleading. PRG_ETH0 and
PRG_ETH1 are the glue registers of this controller, the second reg
entry of the node. The gate is named after the PHY block at
0xfe028000, which the mdio multiplexer node lists too, but it also
feeds these registers: with it off they read as zero and ignore
writes, and no other gate brings them back. The stmmac core enables
"pclk" before touching them. v7 will say:

            - description:
                APB clock of the glue registers PRG_ETH0 and PRG_ETH1.
                Without it, they read as zero and ignore writes.

Thanks,
Lucas

>
>
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
> > +        # added on top of what phy-mode describes. The TX side has no =
fine
> > +        # tuning: its only step is a quarter of the clock period, the =
full
> > +        # 2ns at 1Gbit/s, so the TX property is not accepted.
> > +        tx-internal-delay-ps: false
> > +
> > +        # Deprecated: new SoCs use the standard *-internal-delay-ps
> > +        # properties instead.
> > +        amlogic,tx-delay-ns: false
> > +        amlogic,rx-delay-ns: false
> > +
> > +  # Delay definitions for Meson8b and newer
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - amlogic,meson8b-dwmac
> > +              - amlogic,meson8m2-dwmac
> > +              - amlogic,meson-gxbb-dwmac
> > +              - amlogic,meson-axg-dwmac
> > +              - amlogic,meson-g12a-dwmac
> > +    then:
> > +      properties:
> >          amlogic,tx-delay-ns:
> >            enum: [0, 2, 4, 6]
> >            default: 2
> > @@ -106,6 +160,7 @@ allOf:
> >            contains:
> >              enum:
> >                - amlogic,meson-g12a-dwmac
> > +              - amlogic,t7-dwmac
> >      then:
> >        properties:
> >          rx-internal-delay-ps:
> > @@ -142,6 +197,10 @@ properties:
> >        - items:
> >            - const: amlogic,meson6-dwmac
> >            - const: snps,dwmac
> > +      - items:
> > +          - const: amlogic,t7-dwmac
> > +          - const: snps,dwmac-5.10a
> > +          - const: snps,dwmac
>
> I see no such hunk in the code, so not sure how to review this.
>
> Best regards,
> Krzysztof
>
