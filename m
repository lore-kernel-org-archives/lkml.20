Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F38144CF29
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544236; cv=pass; b=Zz55qaUxsxci14ELqCxUBy1JaHcuSEjAhK0Q9dzTab4MYnqqrsGqMm+kspfa0dJGmMHXklcvDOdqJKnqnuYB7eVCrzRUyhOtVQpm9rZFKhdhT58xtOxdrUQUkrPx0+9WeoFyQJfqbOv/TuGmIk7b13tz1rueLSAiTwUsX0aCiNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544236; c=relaxed/simple;
	bh=cJJs34fb2h99W/KbF5DWHeZGBBI0ty2ys0AP2AMX3NA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qaR1c6+X51Ig/uJrhsEppsmgCOlrm5HntVHOdwaEZn90ETMEJdGwOFAVa/XhDP2HvLQfwpaducm2Rf/jj38nUCw6DELMCgAGCEgfdDMlJ9q0ptJ7o6Hcs5lmWfKdHyieGuzGHnVkF69ve1eCBzCu/26dj47ein/9PrIEPCXoKUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sa4wcHW8; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sa4wcHW8"
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-791a9878aa9so179612137.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:36:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789544205; cv=none;
        d=google.com; s=arc-20260327;
        b=kbIpN8vG2T1x+/2HSj1p3LfA3+vIb0snzY1YbTbs0gu79/3pAymdxqQQUDeow09t01
         AlaWGFSnl02Kw5ExbwUK/KbdMpDExKQAnO+z4mLRh1KduBOt3akD8Ml8mNjuqa6p7shE
         9ICaPbB9YUW+IhV7qFB1i+mpDzEwfyalukjklprE7TCPMjO/3/GTn9hIQ4akEQOqrJxl
         vi1GJf0aN1ERu7MaeKFPWRNGH7fh//K1ugMm/RFEYZyOYDD2f/Rfy5Nf5I+gR/HeXgTi
         cfBO0jYYR1Sz2QF8crifXfnW+5EXd8fLVv6eOjEblZHiydaG+5+QGhY8een7/+2YyQmd
         EORg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dFdl8Va7Swxkjw5uQRSJKt+eRYekF3RPnToHL1YscsE=;
        fh=VdmOFEFFF6eLEJhFaZh2eNH25wYKWIdnHgimampNXu8=;
        b=jmffECLLY7wCqrvKj95LXLDvSmTCoehPC7ANT0UB1BEkCuSBuQ2wx18PTd+XebcP09
         jPhE4ZgvUtFHPIyea4aQT3rzbtDzjpGIoESe775RbNdfid57qQhG4qhRzWnyJCRp8T1l
         1DdM72GiAoJD3oesvWdvYtRLbVrgB6ZbeZZWmxDsCDI3ESsk5s4D0m82a0tKtwa8TwMe
         mSMOGKlpvFQZXRdAy8Bqo+GLP4kPYUGLBSi0cpKq/Ad1k9RvvwE/9GuCiFRBHdvp/q12
         ZZzURnuLuegXSqoGlKMKn4BTzC+F+Mpu81B1/SK2Nz349VBYnElkVbyMeWCxxIkoj4e+
         yKDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789544205; x=1790149005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dFdl8Va7Swxkjw5uQRSJKt+eRYekF3RPnToHL1YscsE=;
        b=Sa4wcHW8Ujg/+h7/w82w3fECg5FqooFAgohduku4IsAGiXjmM8365hyh0E0X9e986u
         cu9h49eFoKjB7jTcls3mqrXanekPLEi1miKYfbqiQZKKWDF/PaB9WtSpbBQDXTDvK/2Y
         HQ4K3ebtXEs40F6Z5a26MvqqIPuCM+9HsY3Aq4xmQrtSJpoZUwrzE+dcg4alotEd7fkv
         88DYGFqXIwZn+BKmaLmy81jAqOsKLRuOmk2sK4GysH6Lth75hJL6v1xZ8qsR3ghAFSCk
         qqrAcVJbF81jNnLY9qJSv4iGVZnpbgZWmHW918nB5tYHiQNkSd+4K+1HurNqi0IHoBzV
         i7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789544205; x=1790149005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dFdl8Va7Swxkjw5uQRSJKt+eRYekF3RPnToHL1YscsE=;
        b=fzW/Le2Xua7+feWYMfZDTvxF5KVhoIaHy0jrwlam4sBjQifkWvI8C2DMYcAqyXUJ8l
         9pCL08e++HUkwr+F5pprUvcX318sbbgpIvd8lWN7kMKb68oJAajI2X6vqpr9lQUuUxR/
         VufvB0btg4uLG4NjK92xBvI3nQgpEq/lwuhTTdgM6yahyPY76y0J23TcMEwn3KJMBBCA
         Mti69ltiDCYk6YgJnz8vtp4jiXwqXezMcy/aB6RNscN9sOkBKNWv2Au1bC5LG17elsKv
         BlMXKma+Uht49aQa85zhIQvyOx/HR6sBvjvfkaUTgDj7In2xIDkSJ4n6eJxypQj4msrH
         k1aw==
X-Forwarded-Encrypted: i=1; AKwUvByGcyTXTIlWbXjJYVWQ6eHr4Z+EZ6U2WNXipoLMD9XiBcfP/yGrXgJHG5I+Zjrpa/pbsk9xzmIwYNt64AI=@vger.kernel.org
X-Gm-Message-State: AFuF++nXSE9IsLUND/9mAv1KiihAX1mOFTFvzOzJ5UOfoTmFZO+SpKaT
	n4AeiDH/w9BGV9+g1NYnHPzvCW9v1T6x5BUmBnrRCg5j7k2My9m4v+S8Nbh8PXRwbAA65+mHEau
	AQPVMnL6v9f+cEvMWmquP+oLBUpW1U3M=
X-Gm-Gg: AYBFou2HDKNwJKRq/qUwWuZcN5cRJxzq0e5ifQCkCoBiNKD2cipIb5djwbnaWF/ncbW
	q4k6e/Xb1htLhRqZXy2Nuo45jhAG+gSUm2mvp/T7nERPoVhsj6NdTRKjMQGF1SmYQmhlYsvnOtW
	jj+xMTQWAzvmUqQC4XluTscH5St9JYw1WkunQCMbdYfSPFCNDki3fwZUsVqc669slUwi+H6PhHN
	UdXPrVAhTjdclrh1zWIupnENQaP/6JOHAFy7kCsvRvho+p+yHONdirTfSeRi2Yf69tEjhnyfihh
	OLY/sCn86YcmHYoB2tEpT5w28ST2U7b+1vb/M2JjJKz5x5PXLNGEzHVnDzbLelnm9U4DCIjIeAA
	Ydneb684mNRho000FGueTmoZeEqPpnwa3xf6avIDiDFrJJcqJ6RrJ7fGJ4HFlQDNuogLjC8RPit
	UxYoKhraljMl8XUU9EdyUbXP1HNJwYOhqNcJcyTqVEA1WZbqpfN9Xw+jG6
X-Received: by 2002:a05:6102:4bc2:b0:79d:c493:f1d3 with SMTP id
 ada2fe7eead31-7a026c4142dmr757332137.7.1789544205003; Wed, 16 Sep 2026
 00:36:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-submit-h616-emac1-v1-v2-0-322b32e40eb9@gmail.com>
 <20260915-submit-h616-emac1-v1-v2-1-322b32e40eb9@gmail.com> <14e61e7a-29ad-4cc6-8993-dea7a8d7c846@arm.com>
In-Reply-To: <14e61e7a-29ad-4cc6-8993-dea7a8d7c846@arm.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 16 Sep 2026 01:36:34 -0600
X-Gm-Features: AcwNN1WscQQGHuBz-gQadqFD8U_llvHSSS-ajPx5e079eC1kBH6r8x1MbCO5ieo
Message-ID: <CADvTj4qtuV_JEW5Byix86eQZJBsc_dmPR75ypVWn4xjem9rpAw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: allwinner: add H616 EMAC1
To: Andre Przywara <andre.przywara@arm.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 1:26=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Hi,
>
> On 9/16/26 05:07, James Hilliard wrote:
> > The H616 secondary EMAC uses a separate system-control clock register
> > and supports only RMII at 10/100 Mbps. Add its distinct compatible
> > without an older fallback, since using the primary EMAC clock register
> > would not work.
> >
> > Constrain the PHY interface mode to RMII, matching the hardware.
> >
> > Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>
> Where does this come from? If Richard is the author, then please reflect
> this in the patch (git commit --amend --author ...), so a From: line
> appears in the body of the email.
> If not, it's unclear why this line is here.

This was loosely based off of a patch he wrote I guess, although it has
diverged a good bit so maybe should just drop it, idk.

>
> The actual patch looks good to me:
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>
> Cheers,
> Andre
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml  | 13 ++++=
+++++++++
> >   Documentation/devicetree/bindings/net/snps,dwmac.yaml       |  2 ++
> >   2 files changed, 15 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t=
-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-ema=
c.yaml
> > index 323a669fa982..2cae0133b3cd 100644
> > --- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.y=
aml
> > +++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.y=
aml
> > @@ -21,6 +21,7 @@ select:
> >             - allwinner,sun8i-r40-gmac
> >             - allwinner,sun8i-v3s-emac
> >             - allwinner,sun50i-a64-emac
> > +          - allwinner,sun50i-h616-emac1
> >             - allwinner,sun55i-a523-gmac200
> >     required:
> >       - compatible
> > @@ -33,6 +34,7 @@ properties:
> >         - const: allwinner,sun8i-r40-gmac
> >         - const: allwinner,sun8i-v3s-emac
> >         - const: allwinner,sun50i-a64-emac
> > +      - const: allwinner,sun50i-h616-emac1
> >         - items:
> >             - enum:
> >                 - allwinner,sun20i-d1-emac
> > @@ -91,6 +93,17 @@ required:
> >
> >   allOf:
> >     - $ref: snps,dwmac.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: allwinner,sun50i-h616-emac1
> > +
> > +    then:
> > +      properties:
> > +        phy-mode:
> > +          const: rmii
> > +
> >     - if:
> >         properties:
> >           compatible:
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Do=
cumentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 2ed4564ae99d..b20149c3e850 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -57,6 +57,7 @@ properties:
> >           - allwinner,sun8i-r40-gmac
> >           - allwinner,sun8i-v3s-emac
> >           - allwinner,sun50i-a64-emac
> > +        - allwinner,sun50i-h616-emac1
> >           - amlogic,meson6-dwmac
> >           - amlogic,meson8b-dwmac
> >           - amlogic,meson8m2-dwmac
> > @@ -623,6 +624,7 @@ allOf:
> >                   - allwinner,sun8i-r40-gmac
> >                   - allwinner,sun8i-v3s-emac
> >                   - allwinner,sun50i-a64-emac
> > +                - allwinner,sun50i-h616-emac1
> >                   - loongson,ls2k-dwmac
> >                   - loongson,ls7a-dwmac
> >                   - ingenic,jz4775-mac
> >
>
