Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239007;
	b=BXnMnFMTSvcptJ8UFAxfwIUdkvjKgapAW/VknUdhc6QHRNW/i9NbmuMqXXlKOFZdiZb8
	 oLuan8VfeKSQAkEpuWGt0pR7oSNxnvmoLfZkdMqPtEcfj2K3sefkqkyKWrMMmHSFv9JsU
	 U4t+s/Q0ErlULomFulv1W6x6v0wCtkhWkl2cc94LotGvz8rxSiz2dmlXtF9HK/kA3CtUV
	 6WPyewKIEIAfzegyJWZzWMly5Vu9JyJCALI3QLYE7owkKt0aMv0l3bmas63Mhv3DyYJkx
	 KhbBQC63mFHLSEo8Op26zwEjLnxRMe/CHGhoVg/TgfQsV6uLZytwzyh1L4Bg80aRoOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239007;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mQ4LVrS7TAycIWuwYP6nLPokX8EbBu04NF8VpAWRnUc=;
	b=pEAdL9IKtpxjZaRr/5Yj5CrWF1xzpaZsa8GpPhZWJLqC4IAor8ucszpL/olVXh8/tYXq
	 T9WQnxA+8Z8j3pLaSu0hb+/xc1IqZ/Syb9n0sqC4AAuSG6L1o0s0+dNzrALV++vyGDkU1
	 Td3ujs/9StHKpqrWL0R/92T+F5vnJ5RdPb/4jTjpvPnl9tB6ALi3KO4cRpM/Od5/5sLfi
	 4LeOEkQkR5ZB7d1pEoh4eQtkKnbDY8l9lV7UuQfDD8ou64LNAUr75Vc+ICJlZEcyQhe0y
	 RrONN6xIhjZ8bIGO+TJl4ytwTESzyVuBycNTzEqVjaZzQ83W8qczps5IS2lFdJqwsfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B628A606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B628A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b354d27917so7771267b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:43:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239006; x=1794843806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQ4LVrS7TAycIWuwYP6nLPokX8EbBu04NF8VpAWRnUc=;
        b=vuF3S0NoNPTt6nSu1ufvQh5mIF7i1NbFJ5du6y7gS8qsn7lVQjsVjY9kaGD1hffRzi
         3TJHM68DR0SfJMVo7EIfhJBPf0g9Ku2u35/yZB1narS76l1xsqRG4MykeCBvpSReQ90n
         0DjTrq1od9lJS7Rn0ayQdSmI5aHoJJhfIU6RwAuso/ZhiumpMcyWz4u0mF6uoG+arMFo
         5ofNHJbxiKzhe3ho7ZUDY6Q0sOfDhixEFhuTyEbk/Ne2Le3mbGcUZSB1LHuVJg/Nmoj1
         8msGzE0EVOG2c78V8UM5/darG59y0hZcouUzfIFhJfzoa4uUcyYqoXOYId8FGG8sUY2B
         Y3qQ==
X-Forwarded-Encrypted: i=1; AL+hErG7nP/CbI9ojpleagzgXoxo7Zpw5ixKbO5SLwkOWGrEf67FdAJx+dCcV/ZCRP58xhwp1GfkfD5S6N1YX/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dLdAXHWTc3TWW+m1ShZOV+5fRQs0qBRMDZPPbIgCM1bYPbmog
	EX2x/ZT0n6KA9IOEpQ5kM9f5u95xGs4D6XkBqyhbRnowYr8zhirm/Am7AuKNNHqn4YE=
X-Gm-Gg: AYBFou1BnyA6DSHCV1WV4ejrHLvCzuU62RT2kpD1TU+ES7l+j8VwXKlIIiOIO8cfkcO
	98hA1ULDAT94aDGra6p7BlWIeHwSqoZ145dMmCWHcNPXXnuujR2EiRkhMWz8uxlz9PaXFOJERYZ
	spiLV5+thv0JhQNII1fJyjEyDQfD1Lw8O6ceDZQBK98x2qkLA0hGRI366JnqS+k00mrAy22CPCh
	jQJf3OZVqNLHd5UMgH4x2knjFUMAfEArpASo2dqV1LlOArw7M3m9+DRcP22rFs+ECQj5PgN/sUx
	+h2fpuwMZjKzkITA94BUHMBScSYnU7qyhfaXtDXNeSerjseeHiUFIMy/yGlPUrS+5R0GArl0KSs
	3wFAPmsnr6sDkdkF4zcXrERJMFtlRtJ+VsEESIhcObKVWcvcGnHf81X1F7hNjk3HKOM7uuX7Ht2
	8f9jyaRCcnuH6HFXE4eq9D5OrQF8r1zIvV8Autea+etcdRJyy0XQWQEyR97R8Nzz39BD7c4T6SL
	S2ivrRsCyNb/IKBfTq8gwI0b3boMPfs1NilEF2GTGDh+Ow7TXB0O1vRl/Iki9u9YPWcP7E0btoi
	Oy/eFTxtsLbwIei87T8vIV2oHcpxV924pV0pbIZhso/cW/Fe3sENRxI10m4qEZP6ygBWotLcrsM
	YqSpuI9QK/JAdF+SUi+GZkeQSjhsGJQvwOS3SZZHIDorXONQX3co1QIkT8iHrpiO94ht+24QoNy
	jarw==
X-Received: by 2002:a05:690c:e650:10b0:8b1:88ad:1fce with SMTP id 00721157ae682-8b36ca8148fmr18846077b3.42.1794239005703;
        Mon, 09 Nov 2026 07:43:25 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36b298f13sm37867407b3.0.2026.11.09.07.43.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:43:24 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b354d27917so7770917b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:43:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHJss2qe0QXGg46oGlodITgc0xBPgd5jykvmflVqJZ8GfoiBcRG62PZe5qJc37syGqYvDHLluECXB6FTRU=@vger.kernel.org
X-Received: by 2002:a05:690c:e3ce:b0:8b3:56f0:38d1 with SMTP id
 00721157ae682-8b36c854704mr28695777b3.3.1794239004423; Mon, 09 Nov 2026
 07:43:24 -0800 (PST)
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
 <20261105-stoic-cricket-of-tolerance-cb3014@quoll> <35dc1ebf-5194-4ec8-adfb-dcc8ea717750@amlogic.com>
In-Reply-To: <35dc1ebf-5194-4ec8-adfb-dcc8ea717750@amlogic.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Mon, 9 Nov 2026 15:43:13 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+0QqBHGv-4nfmY8N_xr=KQgUFtwPQTVZBxTK1LHV0jGOQ@mail.gmail.com>
X-Gm-Features: AclHuK8i80yCCEWCPsmXh9g28kddZ8mRpDlp24I5tNty5i0jlojD6mTpEXhkklk
Message-ID: <CAJX_Q+0QqBHGv-4nfmY8N_xr=KQgUFtwPQTVZBxTK1LHV0jGOQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, xianwei.zhao@amlogic.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
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

On Fri, Nov 6, 2026 at 3:16=E2=80=AFAM Chuan Liu <chuan.liu@amlogic.com> wr=
ote:
>
> Hi Krzysztof, Lucas,
>
> On 11/5/2026 7:57 PM, Krzysztof Kozlowski wrote:
> > [ EXTERNAL EMAIL ]
> >
> > On Tue, Nov 03, 2026 at 04:37:10PM +0000, Lucas Tanure wrote:
> >>
> >> Assisted-by: LLM
> >
> > Drop this one.
> >
> >> Signed-off-by: Lucas Tanure <tanure@linux.com>
> >> ---
> >>   .../bindings/net/amlogic,meson-dwmac.yaml     | 59 +++++++++++++++++=
++
> >>   1 file changed, 59 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac=
.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> >> index e769c9bb70d8..6de013e3e8f6 100644
> >> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> >> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> >> @@ -23,6 +23,7 @@ select:
> >>             - amlogic,meson-gxbb-dwmac
> >>             - amlogic,meson-axg-dwmac
> >>             - amlogic,meson-g12a-dwmac
> >> +          - amlogic,t7-dwmac
> >>     required:
> >>       - compatible
> >>
> >> @@ -57,6 +58,59 @@ allOf:
> >>               - const: clkin1
> >>               - const: timing-adjustment
> >>
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            const: amlogic,t7-dwmac
> >> +    then:
> >> +      properties:
> >> +        clocks:
> >> +          items:
> >> +            - description: GMAC main clock
> >> +            - description: First parent clock of the internal mux
> >> +            - description: Second parent clock of the internal mux
> >> +            - description:
> >> +                clock of the pipeline stage inserted in the bus path =
between
> >> +                the controller and the DRAM. Without it, the controll=
er cannot
> >> +                complete DMA transfers.
> >> +            - description:
> >> +                clock of the register block holding PRG_ETH0 and PRG_=
ETH1.
> >> +                Without it, the block reads as zero and ignores write=
s.
> >
> > This sounds like you take clock from other block. That's wrong, that
> > device should take its own clock.
>
> I see that the clock in the dts patch corresponds to <&clkc_periphs
> CLKID_SYS_ETHPHY>. This clock provides the working clock for the APB Bus
> of the ETH PHY controller, and this clock will affect the register
> reading and writing of the ETH PHY (including the ETH_PLL). See section
> 15.3.4.2 RegisterDescription in A311D2 Datasheet for details.

Thanks. That section is the PHY block at 0xfe028000, the region of the
mdio multiplexer node. The registers in this description are PRG_ETH0
and PRG_ETH1 in eth_top at 0xfe024000. On the VIM4 the same gate feeds
them too: with it off they read as zero and ignore writes. My datasheet
revisions do not say which clock feeds eth_top. Can you confirm it is
this one?

Thanks,
Lucas

>
> >
> >
> >> +
> >> +        clock-names:
> >> +          items:
> >> +            - const: stmmaceth
> >> +            - const: clkin0
> >> +            - const: clkin1
> >> +            - const: pipeline
> >> +            - const: pclk
> >> +
> >> +        # The PHY adds the 2ns RGMII delays, see ethernet-controller.=
yaml.
> >> +        # The RX delay line of this glue is fine tuning in 200ps step=
s,
> >> +        # added on top of what phy-mode describes. The TX side has no=
 fine
> >> +        # tuning: its only step is a quarter of the clock period, the=
 full
> >> +        # 2ns at 1Gbit/s, so the TX property is not accepted.
> >> +        tx-internal-delay-ps: false
> >> +
> >> +        # Deprecated: new SoCs use the standard *-internal-delay-ps
> >> +        # properties instead.
> >> +        amlogic,tx-delay-ns: false
> >> +        amlogic,rx-delay-ns: false
> >> +
> >> +  # Delay definitions for Meson8b and newer
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            enum:
> >> +              - amlogic,meson8b-dwmac
> >> +              - amlogic,meson8m2-dwmac
> >> +              - amlogic,meson-gxbb-dwmac
> >> +              - amlogic,meson-axg-dwmac
> >> +              - amlogic,meson-g12a-dwmac
> >> +    then:
> >> +      properties:
> >>           amlogic,tx-delay-ns:
> >>             enum: [0, 2, 4, 6]
> >>             default: 2
> >> @@ -106,6 +160,7 @@ allOf:
> >>             contains:
> >>               enum:
> >>                 - amlogic,meson-g12a-dwmac
> >> +              - amlogic,t7-dwmac
> >>       then:
> >>         properties:
> >>           rx-internal-delay-ps:
> >> @@ -142,6 +197,10 @@ properties:
> >>         - items:
> >>             - const: amlogic,meson6-dwmac
> >>             - const: snps,dwmac
> >> +      - items:
> >> +          - const: amlogic,t7-dwmac
> >> +          - const: snps,dwmac-5.10a
> >> +          - const: snps,dwmac
> >
> > I see no such hunk in the code, so not sure how to review this.
> >
> > Best regards,
> > Krzysztof
> >
> >
> > _______________________________________________
> > linux-amlogic mailing list
> > linux-amlogic@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-amlogic
>
> --
> Best regards,
> Chuan
>
