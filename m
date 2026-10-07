Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B44F48380C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369820; cv=none; b=ONKGAm64VfS8PChp9SDjFGjse/78A2BSRx2HOjvklP0sNIp0x4MO0JnLKaxGjCVm09B5fRqYlLX7ncPHZCp5+J9z116HOXwmC5RnZ8k4VtUsbp4pPnndPj4z+9Rgey33Y4fYTLal4COEWuI2VeCJeMC133Dx6IKEa+fPltD/LvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369820; c=relaxed/simple;
	bh=VfWUNXmqwxTTUICoAFmFvG8CY3df8em8roJTzWczRys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R5LmnRaz/DF33/5xFwk74ScaBxlhloaH5zsF7GzKDXgNHJZZiTWP89YaC7Su+b2E7355LMTWZjbV8AaNBzQUU/i8OgzXyQdpI91Jr92txykGW89jSEtQjqKCmKXEVwVTy6suJycTsVxdaZ4kFrkUas663V96zNWIQx0gwGerCMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6d7e06dbcccso1101736eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791369792; x=1791974592;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WbqPTpVsUSqxzGbhEjJKYLBCr4VtJGNv2jZWAZtG8M=;
        b=uqRcUzmxRwQMfqlIMfq/mpYBGUMYBCvNNw0kvjbQgznUo927lWE/ayR9KPgRiKP064
         Tp8DRHchjavC6iy/G4FPYR6653L5wcwHrqL8Y2wGJMI20dAtjtxNXIPm3/GqYFYo73uF
         diqE5vmWlyd0T29TFjNIKm94INlvU7T9b9f+BDxn4EaRWETI1RnLesZd2EB62vRXD5Wd
         YKoz7R1/CfNotcVs30VWHu0zrs4IpSD0ueoTldXSrxo1ljMvP95cPF4OdVfY3RjTc+EN
         8kEccEeBtTreCs0iYn5qvY+3ZPUTJQx3FSA7p9f8S6p5nIPSog5qJhkunELGPBi4uIgf
         hMrw==
X-Forwarded-Encrypted: i=1; AKwUvByNQYvg14niFCHjQERVS1b486DFYWi0KPWOK0gnB14BG4cj3KLDD+LIaYeh2EPt+ev5jFlqHxCkeg4XPPs=@vger.kernel.org
X-Gm-Message-State: AFuF++nDfMaXLsOsGSW8Ll0f2UmpHG94h3RCSNnYr9zZ0oGUYjXtgqsc
	Oghk9SWzvNVrlzXwnYEw2IuIjVe5ojM7D/yHGq6XF4Zkt/Ju+kDiAoU3/7X3QkVUUxfPcw==
X-Gm-Gg: AYBFou2qWuFBSAsmDXyPW7Wh56IY0lA18hMupGgwAovmCZ7qsgHt+87fYjyc44sy1JT
	9qVFLqxvfBO7G2ib4wNDiPBLupGiZN4JC8oO0DDZwbI9HgJIpBySHXbIg9X5YdQorY8BDsafIlT
	hQ3w7iCrhyQqDw+v41H4YxuoJ+d38RNX4a7rnpTfQ88FvFomHqrRSQCRQCL+IAKjr0KFhqucmsR
	OQH9Pe+IktuH/xyLv8qqvRw63NsJyRaD8LyHMu2gMNyee6BOm52W7LAsnFfeSuGC1+a1m9uK6la
	K4r9WA+otMEvK4cGMZS2uviz6SRG0DpM1luSkYaDTNB3NWLR7U3PSzbBHLJ3254O4jtfw62vKh0
	jfSKdjkuTmpPSzW7l4/PeJtqdvAgzyPTdaJzk1FwvjAlhu2uv5dPac3ocuFTaqtvc8jyK04eZF5
	dytSslXbmlJ//RtuEYwEqfNyi6Hk+uV7P1aJWVQruVfaRMUr7+I9PlGHf9NOy3iGuEjeiHqiQRz
	8MIwMmjBVcPSVy0coYntqpeJObRQBhyl+fG5cGB94q21E+2pUyIwouR0N8kMwDxquiOJCfhPA==
X-Received: by 2002:a05:6820:2d06:b0:6c9:80d8:a206 with SMTP id 006d021491bc7-6e7a8ee4db6mr1889535eaf.67.1791369791855;
        Wed, 07 Oct 2026 03:43:11 -0700 (PDT)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com. [209.85.161.41])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82adcd070ccsm2256599a34.24.2026.10.07.03.43.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 03:43:11 -0700 (PDT)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6de1ca1b05aso1102840eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:43:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxL6DM9ESCzLJ/mizyr5gVndnd4FsnbqOgcbAgfCZfqD6Rt9SA46G2waCJnryCQawlZ/QlZGrysaKXx8zw=@vger.kernel.org
X-Received: by 2002:a05:690c:c748:b0:8ae:c60c:57ec with SMTP id
 00721157ae682-8b05b04e271mr11794257b3.61.1791369305826; Wed, 07 Oct 2026
 03:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007082627.63807-1-tanure@linux.com> <20261007082627.63807-4-tanure@linux.com>
 <asYWEwjFO8g50o1i@squawk>
In-Reply-To: <asYWEwjFO8g50o1i@squawk>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Wed, 7 Oct 2026 11:34:54 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+3nHRH--pJHxv6PqwpVYTdFAqG1bQdB5=DT6jgLsFKO=Q@mail.gmail.com>
X-Gm-Features: AclHuK_YBbfO7x4D_vDdU1kkRmRoPOMNGgSI5fmJQcVUylonsGY7I5HRmHvp2sU
Message-ID: <CAJX_Q+3nHRH--pJHxv6PqwpVYTdFAqG1bQdB5=DT6jgLsFKO=Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Conor Dooley <conor@kernel.org>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
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

On Wed, Oct 7, 2026 at 10:51=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Wed, Oct 07, 2026 at 09:26:23AM +0100, Lucas Tanure wrote:
> > The T7 has the same ethernet glue as the G12A, but the controller
> > reaches memory through a pipeline stage that this SoC inserts in the
> > bus path. That stage has a gate of its own, which no other member of
> > the family has, and nothing else in Linux claims it. It is therefore
> > switched off as unused, and the port can then no longer finish a
> > transfer.
> >
> > Describing it needs a fourth clock, and the fourth clock of the
> > existing list drives the timing adjustment logic, which the T7 never
> > uses. So the T7 gets a list of its own with the gate in that place,
> > under the name the SD and eMMC controllers already use.
> >
> > Assisted-by: LLM
> > Signed-off-by: Lucas Tanure <tanure@linux.com>
>
> Didn't I ack the previous version?
Sorry, I didn't receive one.
>
> What changed?
Nothing.
>
> Thanks,
> Conor.
>
> > ---
> >  .../bindings/net/amlogic,meson-dwmac.yaml     | 47 +++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.=
yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > index 90ef79161ab1..96118b4d1560 100644
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
> > @@ -57,6 +58,47 @@ allOf:
> >              - const: clkin1
> >              - const: timing-adjustment
> >
> > +  # The T7 applies the RGMII RX delay through PRG_ETH1 and never enabl=
es the
> > +  # timing adjustment logic, so it has no timing-adjustment clock. Wha=
t it does
> > +  # need is the gate of the pipeline stage the controller reaches DRAM=
 through.
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
> > +
> > +        clock-names:
> > +          items:
> > +            - const: stmmaceth
> > +            - const: clkin0
> > +            - const: clkin1
> > +            - const: pipeline
> > +
> > +  # Delay definitions for Meson8b and newer (including T7)
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
> > +              - amlogic,t7-dwmac
> > +    then:
> > +      properties:
> >          amlogic,tx-delay-ns:
> >            enum: [0, 2, 4, 6]
> >            default: 2
> > @@ -106,6 +148,7 @@ allOf:
> >            contains:
> >              enum:
> >                - amlogic,meson-g12a-dwmac
> > +              - amlogic,t7-dwmac
> >      then:
> >        properties:
> >          rx-internal-delay-ps:
> > @@ -143,6 +186,10 @@ properties:
> >                - amlogic,meson6-dwmac
> >                - amlogic,meson8m2-dwmac
> >            - const: snps,dwmac
> > +      - items:
> > +          - const: amlogic,t7-dwmac
> > +          - const: snps,dwmac-5.10a
> > +          - const: snps,dwmac
> >
> >    reg:
> >      items:
> > --
> > 2.56.0
> >
