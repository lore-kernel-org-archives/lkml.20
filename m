Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8B5476CF0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358904; cv=none; b=O4TE0MB8bM9J/AWlQ+5o8MuooRN4wD214bUNuafQNP8/DAIQ6sice0sRbi26TZwaXH7RWryzOaWNhCNxsygFQzzDl0JzjMz95wz10jSiPyTxL4d2sTQNPtxAqhv6ke3Cz9eLKoXwmjRO+168OjFxJUx8nsMnM3UAtSfdOxcGNXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358904; c=relaxed/simple;
	bh=3iYJBxh76ksrHroBjxLWDni+wZz5yO+8mFWg+dS++j0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nPNrGlXa5WggyjslQu3d9i+DEyeaIEkwiEAvYDXw2m+Kx23XnhZ9Fm0DQFmGACZYyoaz5eCzSRnOmSnSwYQ4f1VC846fVkMk6Iz3rUyWbH3409YL/ORqYDzDlAoWovsROIwMvm0az8X1LAegxT9IKw6gKTsXRQgtPX0uluoRl60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c652293bcdso1194985e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788358901; x=1788963701;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=evP2uDnq5KuHvliZWqlHGeP115Ejr4LNw5LNG8+8bBg=;
        b=JTzHUE4PAKNRD0+x8Fu1hTlPj+UAuITVfHmzs7ji8fzTNdyWBX+27p7C6Z1fTx/bfL
         ZylPvVx2BaNwXv+17UXxBdpwd6mY4QOfY3XTaK3j2az9UQbmjDhU65nMqH/Sf/e4L6YO
         G9yl+aoF1EyBtqHBz+KUPEa7vSpZ3s9dLYGq4O67PLaAdWQRvaLl7iFvHJHZHtwNlbdW
         9YKbw1EeaQyqXApXu7+yyPkdOsMmFBs4SnjfY+YAeCHRf2gDP04N+wE3ckyi3T9QFzIa
         eidaVPpJj8Y46LYHSybxXz37Nv3xF7OWUKdW8USJ1DnuH1gDRX9G2DV3gxUBcAKZC1Vq
         iV/g==
X-Forwarded-Encrypted: i=1; AKwUvByXril8ohxLO7GDjfe8Bn+L5aq1o1wDw/XeXnAlDA++tm6j7yJmV+VtLEJHetkYAghm2ZVdld3T0CBV9Q8=@vger.kernel.org
X-Gm-Message-State: AFuF++m8Xo9xhHw6vnQ0T5HUR6kvICPeZHmWdMjfAT6zrwy2oBp99Cww
	0q5V09OI0a64jwI0re+QjqHW7zk1znJuAEUMk3wL9x0WscvV3DLY3QtN+7O8901Q
X-Gm-Gg: AYBFou3p8lxLKmnmaexoKScPEkriEBA6eAHZyCwl582W1hIRZxNUk+ZOCGG+D3hpT/x
	ZiQNxCKSL5Cam77ZtWkLBuuWmXfX2Gm4Pl+XMHDgKb+pYzOFv4m4ekOG3D/KmnQ23TB50kb/gLg
	eeEAEdWfzYY6vON6vuEiEak/ddd5fR8VPbmHDcLqrNLAXiW+EI8Ek9BVpsgAE6Vee4fED8e7IZQ
	l4BG/vYDn0POXTDcTjwTRKUX741a4f9tPE3CMkob8yaBMyAe1zgAqNyuQJwbh9mr+nEge6qxNcT
	L5mAYe5/10T2gFlzO1jKIIYuliGujiVRjT0ofPqvL9qgQtm3K9X6IaZX0OqHIW5GuciqD87cJxo
	E8JoJQfyX7/VoRI0EXcAl0oJ69xGnrp2cQd0B2J7TIcVKy+YsDS2Jp3lqaNXfXI0A0drCwCkm3k
	fng1DRYbstQWwp/2od+cAtYFtvt0ReBJJF6swxjVj+2M4VRitNiT0W+qcZGUTxMOEGq2QrnsC04
	aD+HkJTBU51y7mNQbLy+/SOtJk80Ft+0isf2cx+
X-Received: by 2002:a05:6122:e44a:b0:5c6:6189:c756 with SMTP id 71dfb90a1353d-5c7d2489826mr2304366e0c.2.1788358877898;
        Wed, 02 Sep 2026 07:21:17 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd94646csm2252670e0c.18.2026.09.02.07.21.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 07:21:16 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c652293bcdso1194320e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:21:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByuqHzNgkrSfXDWPFlWC53CprVcnbPTpc3hL8L1kXvyWsCo7sy3ZAUpdQVrG5wwhKglX/kSwt6lgEnu4CY=@vger.kernel.org
X-Received: by 2002:a05:6122:3701:b0:5c6:731e:3c8a with SMTP id
 71dfb90a1353d-5c7d2489256mr2442213e0c.1.1788358863528; Wed, 02 Sep 2026
 07:21:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828122113.1426778-1-tommaso.merciai.xr@bp.renesas.com>
 <20260828122113.1426778-2-tommaso.merciai.xr@bp.renesas.com>
 <20260902-heavenly-ambrosial-trogon-b7ab03@quoll> <apgsOubuGuvw_0rf@tom-desktop>
In-Reply-To: <apgsOubuGuvw_0rf@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 16:20:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU0y5Dg9tW7fAM3QQHKpAw_+vmjj7v-XeZmrushQgQFAA@mail.gmail.com>
X-Gm-Features: AcwNN1X9A4V0FkbVpKVtvPWiA_DTIG3JNljzBRxP5oY3Ch7smDLgUzau8FWVpIQ
Message-ID: <CAMuHMdU0y5Dg9tW7fAM3QQHKpAw_+vmjj7v-XeZmrushQgQFAA@mail.gmail.com>
Subject: Re: [PATCH v8 1/9] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G3E SoC
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

On Wed, 2 Sept 2026 at 16:03, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Wed, Sep 02, 2026 at 08:37:06AM +0200, Krzysztof Kozlowski wrote:
> > On Fri, Aug 28, 2026 at 02:21:04PM +0200, Tommaso Merciai wrote:
> > > The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
> > > Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
> > > Processor (VSPD), and Display Unit (DU).
> > >
> > >  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> > >  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> > >
> > > Add new SoC-specific compatible string 'renesas,r9a09g047-du'.
> > >
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> > > --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > @@ -21,6 +21,7 @@ properties:
> > >            - renesas,r9a07g043u-du # RZ/G2UL
> > >            - renesas,r9a07g044-du # RZ/G2{L,LC}
> > >            - renesas,r9a08g046-du # RZ/G3L
> > > +          - renesas,r9a09g047-du # RZ/G3E
> > >            - renesas,r9a09g057-du # RZ/V2H(P)
> > >            - renesas,r9a09g077-du # RZ/T2H
> > >        - items:
> > > @@ -35,25 +36,51 @@ properties:
> > >            - const: renesas,r9a09g077-du # RZ/T2H fallback
> > >
> > >    reg:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: du.0
> > > +      - const: du.1
> >
> > du is the name of the device, thus calling items "0" and "1" is pretty
> > pointless - indices already define that. Please drop the reg-names.
>
> Will drop this in v8.
>
> > >    interrupts:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +
> > > +  interrupt-names:
> > > +    items:
> > > +      - const: du.0
> > > +      - const: du.1
> >
> > Same here
>
> Same, thanks.
>
> >
> > >
> > >    clocks:
> > > +    minItems: 3
> > >      items:
> > >        - description: Main clock
> > >        - description: Register access clock
> > >        - description: Video clock
> > > +      - description: Main clock for DU1
> > > +      - description: Register access clock for DU1
> > > +      - description: Video clock for DU1
> > >
> > >    clock-names:
> > > +    minItems: 3
> > >      items:
> > >        - const: aclk
> > >        - const: pclk
> > >        - const: vclk
> > > +      - const: aclk1
> > > +      - const: pclk1
> > > +      - const: vclk1
> > >
> > >    resets:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +
> > > +  reset-names:
> > > +    items:
> > > +      - const: resetn
> > > +      - const: resetn1
> >
> > Drop reset-names
>
> For reset-names, I got the the following comment from Philipp in v7 [1].
>
> Dropping reset-names would force the driver back to an index-based
> lookup, which is what that comment explicitly asked me to avoid.
>
> [1] https://lore.kernel.org/all/8382e2b9fd07fb1132c26e228b3899336fc1fdd4.camel@pengutronix.de/
>
> Philipp, Krzysztof, could you agree on which way you'd prefer?
> I'll follow whatever you decide.

Until we get a variant with a third interrupt (or reset or reg),
which is not related to the number of channels...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
