Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793156564;
	b=YlNNXXp6zZNfb9+LGrnQxa52VTlwErIJDAsu2b7QwsJuTolqWnTIqv7N2z+qIrCmnckZ
	 bBjZJPgchVUMfuCSRiT5EG0dSIHVMPtiG0ilFh5Mq/uUCeO3M4bdv8yZQ15CnR1lg0wze
	 8ZyVBZV/OSSXg1u2T67E/s0acAxX4enGmx57N+7CN+EKmWIQGCi2kCA9SKrY8Z7fTHcDk
	 Zypg4WAAuMMnT+JmgEJwvWSyv8ogsnXynDD7fBDvy9ijZAJDt8QZzpiJ4aQdnN+/gJVqo
	 rgShzYW2tzRGGFjzalCqBvPrLwJ65IXSt54v87LJ0dxKB6U4CMC/if5UIEJJE6PntsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6gwoAmnbvIGLb369aZhQcsWZKGDZfmCyKvu6i1SBTsw=;
	b=Ak+otIZTQtUD2xV9exxPikJBww6kT811M3etGbsp5n6CYHA1GF/Opo67BUZc35cpgWbk
	 w/vmC/DZcCpmA3VqiOmIvtEaFuLC6zW+3kOjgMirTsnCPs6IFVoL72dA+S813vYWQlHOL
	 dTNP3k1IGFJmOO7y2vGsqazNkfi//2Q8fAD8awzErqDQHTd4RhoLNq35yYWDaji19LExH
	 r8zMGNb7Uf/89+BYPAkcpbmNL20Rt2WkZ6D+ZdWYX7NyB160g4iUqlm1ZFy3rp6O3K5WF
	 Urgl4rq+mAGs6U4NuJTRZD7I7AES35TepTilPB+xQcfYCoOmxXpQ1Ewp75QGBKaFB/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0nVVHtD2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95A8606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E95A8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0nVVHtD2
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8ac4806e210so4283577b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793156563; cv=none;
        d=google.com; s=arc-20260327;
        b=VUDseDUzkxS5mXWho7pMELpzIO2yC/x4hnc8JCJ5LML5N4iOpnLi6HgE067EK38EsQ
         lO7EcVHYAgCPcS9Rcosx+Xm7RyARpPQO9xyYUf/MzhpcDMd8O95dLtYhxQLL1+sO90Zz
         s0IPyggxhQjziW4nkOGyKTpIo4Fl/0FNUuqM43kknzD6pTV2wQ990YVt4hw9T9++VC5U
         MIEFaPcmas01dmxJYUPMtJ2z8By63+iZJV8teGQBC2q2FG0pl+2zD6X+cMrtUjnHr2Xs
         AjMdx/zYUW70mNDOgWZgnuQI3s44rj38QGhXd9f8hjgURU9YgCEV2Gf510L1WJ6rgYHN
         /TBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6gwoAmnbvIGLb369aZhQcsWZKGDZfmCyKvu6i1SBTsw=;
        fh=IHH7f9kgwTd/LvzCVW2sOY1ar+EdL8hqKnhAq+tRE3k=;
        b=AFYqHJDC/erxmRNXCObGYd9gRtGLzp+q2Kr7FCGbWnDaIhcXb4A7A9+GZeIV8fn0KU
         WbknJtt3T2/L3tvcepFDAmTctdRVDBJpiD4qmfObWn798OutJmJ0NbhWC1jYMk/sKux6
         SR7iV1NTnquhY4dInbiZsUF/9S7RH+IfS8OO56B++/k0bjYZcbpSGaiaolqyXcQ9sGll
         SwnyXIVhovn69Z+byvpPlIG1ns5137i1Cew+/7X6JPILrpLg5owdD/cTFyZN/i+6a0CE
         c8DwgWhOxS5ojh+Af6nPIXT7V+sz3/R8s1WR6icAuBySPRNRSfEfX7Nq/YJNH0b2KA9C
         6IwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156563; x=1793761363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6gwoAmnbvIGLb369aZhQcsWZKGDZfmCyKvu6i1SBTsw=;
        b=0nVVHtD2AAGzgrZYLxigr0+/wRPFGgQR7F00ymwm+NwBgrsa+2b2Mg1brebNzmE5ky
         FPxL157nk/iUm5/tmgPhLpklyytZh1vCrkzDuMqSrQ/rCgyTrs93Sznf14FIz1ubtTII
         JfyR4R8F7IR3VOupDJ25aJbsUt66vtnlS9KD1KJBdxCOVXtUdpzjJ4ywsCahwIdnkMif
         lT1jYR/hmDsAledHFsHycCCYvIGjaBF2KqKv5XRsFYqXhgjJdrYkAbbr6DFZ+IXsmZEV
         TBNSfvhpwbYe/4qNBNc5jewF0II1zYgp0F/6mKw4BBSKVNImw2gCEgDqTHL8E9U0Y4nq
         cKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156563; x=1793761363;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6gwoAmnbvIGLb369aZhQcsWZKGDZfmCyKvu6i1SBTsw=;
        b=nqt6PWQrCjT6r2JHCpC47lA6DdACAkcW8mIXUQqjpXDgA58W8F5zqDGJaYTR4kGpL8
         OflAf+2KqiT/vtCX2i1sPweTjVfQ+vEncPLpazagc6DApHSbFy7ykjtlgNL0rL2WT6LE
         N3CXFgJ5Uj59yXZZd1sNER28o3GechL8bZ6PwJcOUEspqEAq45QoQIj8Z+yJa4w4sO71
         Hqnl/DpIr4Isbgy7+XzJTNPPsEzPKlsU31/n1vZvLqyihzZOhF2zXgcEiXUGInD315gs
         4G4MFfinNcjD80FMbuMf06gRtJnyJKlBSCed+QSV+l/ZCdh2Y4J7xSGLK7IDCW8JdX+B
         GVwA==
X-Forwarded-Encrypted: i=1; AKwUvBw1vBNJt7hZkCVZzdeMfsy+CCOT/th93siIWq0HjsW500bgf4tPW7aYNL4Zi9zl0mTrviBBevYUSIe1ZnM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6txc+cQhe48heeF/jDpEZQq7m2ytFcrqr3jbFM0A6KZ0rD6JJ
	JWyBeVKpgjHHoTkE/CJf7aK0u1YeFCKpZeQroojOx7o/PpX8Fjc2Hg9kFSmNEtFnN/bbYDlGiZk
	07RKyT8di1MHTrQ/Q45Kxk0AKhDMK6NQ=
X-Gm-Gg: AYBFou3IuRJx3+JYxHG1YYNLpD1yX6tvl1k1kKE1/OnKSr3fNEqiHUchzNPe0ypqR6S
	BFMaAmY/jyFqbvbWjR2uLav4MbpoBf3i2rQvoFcUKEXWTrcCvrqcoxUbQNV5u9dSETW8JySXFCK
	jQQllx+qXcYDhYmCsQofF8FuVaaXG7avnkTzW8QxUcpH1TbwDZMpiRKaLV/R9Wy7Yn9ZrR+XMYm
	4XSALemPULQsZP6APQMDfrCXS+w6H0o3xiZt+cdCXH8i5dYSXl9Cgly9G8EHB9E0eMlhMWNEZL+
	JfNCIj4ReLkpcfKoH/BPWCmGiJSlZ9IlYqZm0Qh+UApnQEgcMRp0ipV+pZjWFaAAmL5Z9qHCT0q
	JArUUVdFIhS8BQbSqJkWup3TPH5W9X3bekCbQ
X-Received: by 2002:a05:690c:930c:20b0:8b0:893d:ccbd with SMTP id
 00721157ae682-8b1b5c7066bmr6133407b3.12.1793156562747; Tue, 27 Oct 2026
 20:02:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
 <20261027034911.99482-2-prasanth.padarthi10@gmail.com> <20261027-savvy-powerful-seahorse-cc1079@quoll>
In-Reply-To: <20261027-savvy-powerful-seahorse-cc1079@quoll>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Wed, 28 Oct 2026 08:32:31 +0530
X-Gm-Features: AclHuK9lp_o8SK5eEXhK6dRTkFSMinl_ZrlydL6PeVvJqMGdIxhaqqqLV4JoCCc
Message-ID: <CAMFFDGhdzegMGoajgjfX8FRTBNF1p5VJ9CCcm9pPEVCA0xibQQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, andrew@lunn.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thank you for reviewing. I omitted the earlier revision history and
discussion links, and placed the compatible incorrectly.

I will reconstruct the changelog, include links to the previous
versions and reviews, and correct the alphabetical ordering in the
next revision.

The intended changes since v8 were enabling both ADC engines and
adding the IIO-to-hwmon bridge. I retained Andrew Lunn's Reviewed-by
tag with its original scope limited to the MAC0 and MDIO nodes.

Regards,
Prasanth

On Tue, Oct 27, 2026 at 3:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Oct 27, 2026 at 09:19:10AM +0530, Prasanth Kumar Padarthi wrote:
> > Document the ASRock Rack B650D4U BMC, which uses an ASPEED AST2600.
> >
> > Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b=
/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > index b7e70868e..3e6133e2b 100644
> > --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > @@ -79,6 +79,7 @@ properties:
> >            - enum:
> >                - ampere,mtjefferson-bmc
> >                - ampere,mtmitchell-bmc
> > +              - asrock,b650d4u-bmc
>
> That's v9, so where is the changelog? I see in cover letter only v8, no
> links to lore disucssions, either.
>
> What happened here with previous versions and reviews? And why is this
> placed in non-alphabetical order?
>
> >                - aspeed,ast2600-evb
>
> Best regards,
> Krzysztof
>
