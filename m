Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793093998;
	b=1m5RuNXuZGlCL5ZHyleCv8WXASK/4z8ti2Wp4jxZoUBS0ns6hBkXxHjVPjLHDAgpKvqC
	 9ySVsKWQKIezDHR8AEpyfOfFvpxqNWv78BHODOB4s1qN8vH6o9b6S1lfR4LGh4SONDXKp
	 3AlLDvmcX/JZ9IYlCin3BdSsiuU67OirCsfyvwFNe1K1gKhdKx+mLQU9FxFj2OznER8vN
	 2Xd4+wObhneEFoikgfZ23x3p2zNcKT8+QYCpb8Z19JQ+ZY2GPC6l0dhso06qHAQoIxHAj
	 xWaPylcSOtaJOSeMNLgCom9GJP3KSjz4Tdm8diqyiPOzC//giLW7GXvky5pgH8pSRUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4X+P1B6aE29va33Y1nOTBGckjA6+hBF4dxDZ8irecEY=;
	b=PxSifGEdUzY6T/i9hzVCMGZcylxX7NAWjd6kgo6/s6lWLRVjiphwWV+9jYB1IZ0kL6Me
	 vw1bT2jnL9UfmqEiWJ2cN4sEoYQeIGYHnHcPQIekMMk6cO7b/m0aRnckCeRmr/rWQVkYp
	 8CJw1FVniJiQCUXwn0KOiHTXUeic6XUv0AaMBZ6kQG4xl8fWXVtKPr4Nr3nv8yV5gHSte
	 k+aNQt8/HUCiJYxiRKP62GikS8zkntoGvm3huwq1rvSkbAbrEe+IFkh3wKVysXfMkq49Q
	 3V2S7TlNIncw7wAqGLtzl9Pr5VkeWiY7qLpvFHlclsHgMx09xLqPXqOTwEpeLaXp4KA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jbgipqXk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFFB606A327
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CFFB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jbgipqXk
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7ccae9f1a9eso2283595137.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:39:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793093997; cv=none;
        d=google.com; s=arc-20260327;
        b=sWyufgL3xn5vAkNw+Z6BzwjiAUAOsi2R83aQCgbVIVGDyaakJ6QQM3cFYofpQyQG84
         /E44TzzbXvLWueADesBesFJ/WuT9JCB65oTgrH5jve7MsZSaDp2W2g0K0j2yvPJtsD4J
         VIuGVYwpDC1wpHXnmCuf0RafCN2WpHYwgx5vOyqPLZJpGkhDgaMuaj+NmWviiAaVe6MU
         mPIpwfYbMut+KXdsxgCWAUxaSiWKKfGRvcsaV/mZ57CH9aALgRWngcQlLGMuuQhQ0Cg0
         5USrsCy52NOtrrsU3NbIihZ3eNEXj69ysW56UtkHIx6E1FFOP9meWS52kGag/gx2c+OU
         vALg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4X+P1B6aE29va33Y1nOTBGckjA6+hBF4dxDZ8irecEY=;
        fh=Jh5lQkkw64uYxC0uyuUGquB1vZTAh+LAAPPClKCKOBs=;
        b=sZbbc2L4XhUhzMOmjCg/5lM0fPuS5PJ/B5528SdMHPYy6RXI/XnkzMMcXXZ3QJ3EMN
         UCYf3Mwl/66IVTNeBWrqJ4vK4BAA3KMiaADgmP7D1O/NwBqY5QdyeF6rwGXipB77NAmi
         BXvaWXRMi2HChJ/XT+BNZ+RF8XAQGL+ZEPaoa3RqRER4B0KeJHK5304/JIJdtR8pPbcg
         mnbcRC7wGggB3/8X7OAPIjJYEWq0vuxdM7b13dOpdKpmDIuruFEeRXwdkqbbKQucoPCG
         9GQNwViug2XM+gcLss8rhEcHQk7cfP46H8KEQjhRTXWGPBytcMeEE5BWt55MpHEIcnRi
         skyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793093997; x=1793698797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4X+P1B6aE29va33Y1nOTBGckjA6+hBF4dxDZ8irecEY=;
        b=jbgipqXk/6TNxEbvLlNc6gdZFS7gSzHiaIXUNfVVdN3q94F07nj9GzMabdiRQsRP+F
         o/XOGFypEw+wijhGjN7sQwjWm4BFklcLI3EBtfWyHhpoHYyUZDxdDMQdWr4JXihw3R58
         aHsrl0M0NfG9pSxGqRcD/Nj5Z+tc0m1rfTN0Y2sd+xO8Kck0FHRfCAXgRO8+J2Q0vNrS
         2iExoS6IytX97KV5mB7bJwKQm8JXIZn1GzCAUfz82AMiashJtm976jYvCEHFiaX2Zinr
         8VHyvlk4eUGocaj55+e67vOmZIT54wKJpIJJmqyE8/3zevjyHZDXFpv8mqRRBPiZ/LsY
         +WKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093997; x=1793698797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4X+P1B6aE29va33Y1nOTBGckjA6+hBF4dxDZ8irecEY=;
        b=xyzBN13/d0XVQPIrTfqfEXtKeHAZbdoz4PswQKAmQ8rbK79knPCMl6CcZjOGBmEjh+
         LUV5Bfha0WG4gB9RQBSI0o2/U0LY446ljFAfWewzi7vshC+pVpWe/GaY04+U6Z3OnxDE
         vddGt6ljFXp98KiUwqg/gyq8DAw4OkSCkSRp983p2YyW2/Oy1tvfv/TsshrTh3QuQUJZ
         cVeiMwV8/MWZy4gfmq2tx5QQ7PXQwqjUzuAYS+6kkXztLVVeHEQEgEFG0m9pke2dwRju
         +oOYrwyZTGZDn/vkeqDkq+H32jlusdCkqFXTtFd1q5ckT2vV/Q3cSrkImdk9XrSBQEEk
         XZbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZVDyL2XLR0nzwYknKzZSxNbkLW+v8YIAeNrvL06YLbDV26T5F12+IY/7SdaTSq9S9jmnOGmFKfzFwy1Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1x67t7fTZMFsKrFCyYldbPkp244dSaWIZP2nDKsG1PBznw4S9
	Cj0NjcR11ZXecGmd9EzJejOEXGPQzW7um6gHzc5CinRNJ63LDqnY/t3fJSwAoaHkyivtaxhSE7V
	UD8oVZrKkAco4wetl/gn3/4rlgqXRqYA=
X-Gm-Gg: AYBFou3EI15HOguNv6ixHpValfIEByEpvZY6kIuX5jYjFYVRG6IkZ/28xowm8MtRWD8
	Z86PL30kMXeThF7k4MUzyfw4KnkB5gEori+paY59qrE+6s6fySqwiYJTwxZLdYQaC+1domBrzUu
	2hX/e3/TtPUteCPvAiov/NNaveJL1x6oUjaXCUYV41bzUE4u1tx0NL9jgVgkav8urMyQZlgGJao
	TatMf//qpJMVsO/ypSOVBxAOX5MkmzulSZMl/2tv5FYmWV2Dd+WudUi7TemByoMZelbQEJmzhZu
	LNWQ0yTM3g1FYrzuhPOHvqI51mF39/WNidqJHB80XCVuuG0SQGH3bmQUrZmmmDcJ296ylGyHfSn
	mqHWQg4kAY9a/kJOxnHj4jnD3GS6OqaGBXTR5EWISYcLr+YEheoceX/gxD+DgId8n4PwBtnl32e
	mbH+O3i4kkSR7nZaPq+yDRjn2SKqNAcfVOavPSLe8PRntOy8OY9D9/GUS54Y5QF/m+lO9H8iVyz
	w1TId1zAvreyQrDFr3bin+n8hFoAA==
X-Received: by 2002:a05:6102:c8f:b0:7c0:4d52:8cc9 with SMTP id
 ada2fe7eead31-7ce5cc8d55dmr2986698137.14.1793093997186; Tue, 27 Oct 2026
 02:39:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
 <20261024-submit-h616-uart-fifo-v1-v3-2-286fc1b8c3c1@gmail.com> <20261027-nifty-reliable-octopus-6cbac5@quoll>
In-Reply-To: <20261027-nifty-reliable-octopus-6cbac5@quoll>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 03:39:45 -0600
X-Gm-Features: AclHuK-P2vZ9SIQ1kD5xtHOmSa1lugBkFh7TQdGZgeHlLBc3Sp6mnxkEd0joV1c
Message-ID: <CADvTj4qrBYSyT39=xK3_oGgHdFoSH=oyDvTtLCSzW=F9KAgi3Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 2:02=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sat, Oct 24, 2026 at 02:22:24PM -0600, James Hilliard wrote:
> > The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWa=
re
> > component parameter register does not report the FIFO depth. Its option=
al
> > register layout also differs from the generic DesignWare integration.
> >
> > Add a specific compatible for the integration and allow the standard
> > fifo-size property to describe the capacity. Require the documented
> > 256-byte size for H616, retaining snps,dw-apb-uart as a fallback.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  .../devicetree/bindings/serial/snps-dw-apb-uart.yaml    | 17 +++++++++=
++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.=
yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > index e2ca126d58ba..0f8fd0485879 100644
> > --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > @@ -13,6 +13,18 @@ allOf:
> >    - $ref: serial.yaml#
> >    - $ref: rs485.yaml#
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: allwinner,sun50i-h616-uart
> > +    then:
> > +      properties:
> > +        fifo-size:
> > +          const: 256
> > +      required:
> > +        - fifo-size
>
> Why do you require fifo-size if is const? It is implied by the
> compatible.

H616 has a fixed depth, but other sunxi integrations have different
depths between UART instances. For example, D1 has 64-byte FIFOs on
UART0 and 256-byte FIFOs on UART1=E2=80=935.

Should I keep this explicit for consistency for all sunxi uarts?

>
> > +
> >    - if:
> >        properties:
> >          compatible:
> > @@ -60,6 +72,7 @@ properties:
> >            - const: renesas,rzn1-uart
> >        - items:
> >            - enum:
> > +              - allwinner,sun50i-h616-uart
> >                - anlogic,dr1v90-uart
> >                - brcm,bcm11351-dw-apb-uart
> >                - brcm,bcm21664-dw-apb-uart
> > @@ -120,6 +133,10 @@ properties:
> >        - const: tx
> >        - const: rx
> >
> > +  fifo-size:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Transmit and receive FIFO capacity in bytes.
>
> Drop property, not used by any of the devices here.
>
> Best regards,
> Krzysztof
>
