Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BAE3CF05D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442519; cv=pass; b=f6pMCWuo8aZRJ23mFnkb+d50vBFPFhHnBsHEKch6z+76vg3hyI48QJt9S/UGdWXFXhtZnQyjoQhzCfIMJfneygbt7DS3QI/8t5f3/uDU6hPz5/dXBA+1u8Wk6DtqZjmIDJI8Uj60YSwZKbdbeWwCQfZcfjyr0ABqrCOH2XOP5zY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442519; c=relaxed/simple;
	bh=LAU+lAaONCsbyhUKz3NVx/NrIoGX2BWhWJ83XVPrkW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QF1KTZAPMz3m2GpT8p8X7R+n5L0dBNqlikSNGm8WDofGpXaWRSyTccx3m1dGkL/D621PWCwnCYtrFXM0p4AWVfdKkgof6+0w7LjLnhxl0t+z37hLGkNNfp/a5vkUqn4sefL81eC4MxeAeFIqm/9WxSA5mWCJ176ywNkDtQJWr20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JfA82dpf; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JfA82dpf"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so188728a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:55:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791442517; cv=none;
        d=google.com; s=arc-20260327;
        b=cWZPjNS5VJJmNHX4j9zlHO4eksDLeY6zB0lJ1eODjqTANcbJVP31QV3Nlmxo9/ruRX
         DqmA5MliUEEkO18FJM/gCqYjCkBEaEMLClyeB2BzOAUefC31umzhoIp/KQV4ux1UiYiA
         2JGPypgvDXmHNwH64o2f+Lx6wH3LtrdUuiUeDeWxxMBDjbjaTW19dLhlQ5JcCMZmLasn
         E7LwufrnK35OsFlTF0mi7F7xBlHvmsjCVWQLknmitsGQ52877yrPvu1psReE1UVVVdJZ
         f7lLyWHkF0crVMnr26tgNs+RoqU06tUO3JFrwffwIagF0MvfECeDAHsOjzgwdax1+Smn
         2CSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GwVHKedpjNUKuB2nBCCOQbetrG9q4vZVX+BP70vaR40=;
        fh=A5MrFGf5RZ5AFd7U1DvQzI9Kic+MkFAIYkLVMfI88NM=;
        b=jv9AQ9Y/dmPVfQTrHspI4KvybIPqFgd+2owZltTZT7HCJOTw4Z/21NsXItYYqsZnT/
         sSa/8p8dJ5b/CRJnfbnlzi+GUZzLTE+Syv/qs2xs72TZUVMCx26ljtoBMR8lh9IFXEEX
         XRE8ITU9L5zCNj/wE8Ht0mzmthSoEa2/SytQ3bgb87DnY9bMXl2darhpfcN9UbdMbYdD
         wzhhaplKG7uFRM+Nu3oDJcKLOJUdxq+qqREJ3RyIrLFB/C6nsLxSb+b2YxnECX1tst49
         Y5Y3SpMvz33fmkrjKjFgUXI7oEvltT/DDwRVI3ZSkGiGqC45PBLaVEIABm8ogWr3atAB
         C7TA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791442517; x=1792047317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GwVHKedpjNUKuB2nBCCOQbetrG9q4vZVX+BP70vaR40=;
        b=JfA82dpfOuVdgDazmoj+VL39H28VT2HM/BiZqQZJLKkhrONqnBZQI1g2IBB/YAezCp
         6L2ubSBVe7N+kSpJVblp3DxCS3QFHffRp7ePqiVmBSfI1V/vjwFIBlMd1qJ4l4kBQIv4
         Opbe/QAL89fcInWCeq/8guMlRNDWPIlLPp2agXMGzHX3kkQg1o/eTc4BpI804+3EKajh
         I1+qVcp7TiVFxpRrFeQSiHHyhMZgA7R5+Cn4dfaxcaqdNZfUzVEnizuh5hm+2RT5/bQE
         6FHQm5V6Qstlbv1jjfx7+8ntKfjKbTlKdt4MagxOtQ1q7B+zXWjJEO8vL3ZYs4YpJ/lZ
         Dauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442517; x=1792047317;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GwVHKedpjNUKuB2nBCCOQbetrG9q4vZVX+BP70vaR40=;
        b=Bt+DnyMh9dFLcG/meNDxZqPjZN/dHq04Vr1ctdioTSe5VjTLqYgQz7fbIqW2DZAM+Q
         iqMnNmTYXG56MxwxkyKG3N2eWgk02sQMmU41GdNu0jW6DN5bwlwWY5mH03lk+Nbbkd7W
         fnkiOE7TWQKanJOHcPbAlgJY9kRwYBlmyLW9vRC5DmjNcB3FAb89fbLvfhTT+5kKQuC3
         vHlaea4v/tdq9xnruJwQ5o10e9tBorNaelUZkB9gd8f5CXwtW3DkooA8NpgTDvPXSZyu
         6mk7pjyy6FOvsaS+kjK0wYDmXYrgMk/0cLtVJyP7vzPmtpmVo4DZULug9DcUxoCtTbp5
         dH3Q==
X-Forwarded-Encrypted: i=1; AKwUvBy0vaKExPeOYjt0DElQmYYMkI0AjQjOxcK0vLj2dTw1PcSGGZCafadPIYGBkZimN0n8jpkoAFG3tMPE5Z8=@vger.kernel.org
X-Gm-Message-State: AFuF++llSp4g1ABaGuaadlg5BOoQpUiq0QebbWPUN8iCh6eZy6WfBZWf
	XdeLrN7eXmonrLbFv2GAPZwRvBMllLbAXU/tb4iopyZg2br5BtIk4q2WCcn7z4TbPeVWVJPlFFV
	mUVcaC9Ggiin8QOT7/FGBuIxzlZQyTLw=
X-Gm-Gg: AYBFou1vHktqVFae33HMiBJ9PlR9l+6LlP/uSN90VbKwx2iqQDMf++JohRHGDaTSCAN
	TPi0FJNzUQw9Axp5s8WckQf/EL1fAhrCsMSEqH+ZMdrG151Lrd558MiJ8eay04qgeViu7fNLHof
	Y19Svktvl+vGDATQRq3s1ryuiyH7qDaBRzhpZW8NvpT6g4DTkNHy2u2UkKQFls2iScqjk1zYd/3
	d7UWeIWO0pacIJmmFJCeLO7h5vFkjpmVM7LlvWnna+5MgHJHMou1PvwRTlScVSkrvFdn7E7cfus
	iwsc665Tqd1U8Wae6+RUFikicJhr4V6VjDeDPaPtVDLjoDqlPI8ivdBv2WwpTGuCZ3oeoNo=
X-Received: by 2002:a05:6a21:3e09:b0:3de:3bfb:dc65 with SMTP id
 adf61e73a8af0-3e14c5a1255mr1132038637.34.1791442517344; Wed, 07 Oct 2026
 23:55:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005202731.153971-1-pmazzini@gmail.com> <20261005202731.153971-4-pmazzini@gmail.com>
 <20261007211626.GA338242-robh@kernel.org>
In-Reply-To: <20261007211626.GA338242-robh@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Thu, 8 Oct 2026 07:54:59 +0100
X-Gm-Features: AclHuK9HNWmbYmgrwOCN8Dj1r6Aaf0O489JwabVju8_e_8zgAdvV8DQG3O2TPc8
Message-ID: <CAAxh=jsoFDfNGEtcWvxe5VNH-knf8LZg9aVh800LF9t-7m1qbA@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
To: Rob Herring <robh@kernel.org>, andre.przywara@arm.com
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

The B288 uses the same scheme as the A523, and the A733 queued for
7.4, which the shared pinctrl-sunxi-dt helper parses, so I'd rather
stay consistent with them.
Andre, what do you think?

Thanks,
Pablo

On Wed, Oct 7, 2026 at 10:16=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Oct 05, 2026 at 09:27:23PM +0100, Pablo Mazzini wrote:
> > The B288 driver takes its mux values from the DT, so allwinner,pinmux
> > becomes an allowed property here, required for this compatible only.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-=
a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4=
i-a10-pinctrl.yaml
> > index 45b7a0b6c626..b1f093d218f5 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pin=
ctrl.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pin=
ctrl.yaml
> > @@ -39,6 +39,7 @@ properties:
> >        - allwinner,sun8i-a33-pinctrl
> >        - allwinner,sun8i-a83t-pinctrl
> >        - allwinner,sun8i-a83t-r-pinctrl
> > +      - allwinner,sun8i-b288-pinctrl
> >        - allwinner,sun8i-h3-pinctrl
> >        - allwinner,sun8i-h3-r-pinctrl
> >        - allwinner,sun8i-r40-pinctrl
> > @@ -120,6 +121,15 @@ patternProperties:
> >          $ref: /schemas/types.yaml#/definitions/uint32
> >          enum: [10, 20, 30, 40]
> >
> > +      allwinner,pinmux:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        description:
> > +          Pinmux selector value, for each pin. Only used by SoCs whose
> > +          driver takes the mux values from the DT instead of an in-dri=
ver
> > +          table. Almost every time this value is the same for all pins=
, so
> > +          any array shorter than the number of pins will repeat the la=
st
> > +          value, to allow just specifying a single cell, for all cells=
.
>
> Perhaps new platforms should move to the common 'pinmux' property?
>
> Rob
