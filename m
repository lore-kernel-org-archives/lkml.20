Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792683746;
	b=yzx2AMou8HZKF6mpUTYwDX9TXIxjgfqGOpJJgB71002hxnxbRRFSlWwbVUrB6BiRU9y1
	 WFkZdk7d4pV0MC9S13Pz1KOAdS+af50J1Co+YJL+u8jN/WlS/YE1ZmQHY/MpzB+tXDEab
	 UVmBB9AG/WpP6S70MXAgLNfikH7LnFVLQFDfV3xnWCYGhYdemp2nFUtRODGMguGKyiCq5
	 JB61BLguofx3vh/7XleBdgN3ffmkwaxIMEn1a81+eoSUhgQhhupNhioTHz2UBEfogm9FK
	 vTjAwACfcV2PGLZmtLK6bhWeDYZFZcFnX0FSB9ZIfC2R9rMOZv4pCI43LmoMnmboFGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=nOo6raRuVgtjcP13nHvQbmXlg/BZszZZ1L4y9D6+1TQ=;
	b=RJ3Vdrs1OkTFfE7t/lTaRmbPB4aUUOPzYUfBSicplHahHfbpx4CP6ytp3Gtf3klYwaOz
	 yPTr5VraatuengfHFkFLDraT36mc9KLB/WhyR9GfO1ZJBX93HYk7oAN03VYdZBxkTz9L2
	 Hc2xuFz6dXP45iQxgvMNe6y81jFzheg0akBNIDxsScZu7PFaQy2AHJvKeBIF7C5myie4K
	 slOuxGLxkeG4iwCXfSd1mUgoR26TtnMHTtPFmF7pUHeqBGzHanBW+/Pv+5/3K2GjjAkvA
	 z1OwTK5KnoaFn5OgvXerUvZgLZyXKDTiSXbE+8UAg1TWaaTwG1lebIutEfcVptnGSgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=thRbagr0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38DF606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A38DF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=thRbagr0
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-843cf077f10so2183871a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792683744; cv=none;
        d=google.com; s=arc-20260327;
        b=CWJBq2S0H0qexgMIk/BupQLmCUiL+o2oVXlathEQJf4sLJ7q12sSlrqhrKG9b6MxUE
         WPlMCTDjbkUlR+HbnVPnNRkUUqGfE0Aim5xQUKLvVCJ1Avubjh1NrOXW6XJuyEKa0/oR
         GSfu7BWsAqBh3cXTj8ht8l3i/9LS/6K5ARPs3on5IpKpnx3K54XvWaF9nyDXpZZiXQPx
         A139eiYR5rrByFXisKyMd7shLJUrbGJRKt3f5e5K5aLwcQPeBHnJV97Asm68YoWuSEby
         wVLGsnPo49GcQL0j3nEnMkHRiFfARbim4QH9jEFU/Bz7viKbZF3mVeqL6EaIznIlzgXS
         4mfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nOo6raRuVgtjcP13nHvQbmXlg/BZszZZ1L4y9D6+1TQ=;
        fh=SjYuWtvpMjE6+C4vS+JMp4iBjj04jJMaoe1OxBO9ufo=;
        b=KKINI9ynFn7yWI1PRuRdgjuUJry/qZ3CLg9g1saqNgTJjBEKqdTvRgr1KspIlnFtks
         MjIepLbn7dF/W6xyu4LRK+IOw8qV97/LamuEzeW0v3m71l7GWNqW2USjzbTR4nJfp8qT
         ErCyL9gOgT7Ck3NZg01W5nifzs5Uthjobft15c7xWFeWGGRDcGRUxubrOzAU50FRXMh6
         zONX6zGAjvSiozYdJX6vHCOiAw+13k6ifO4RoDwFHdK7SE9PB5eW6O/SoGJo7iP6tKSc
         xD8+VEhbbQZOFHG4zYmoAyNyo4+wkQ2qaXyxnJgJmYeVT/GgG/bXz6XylE6wusiBwqKO
         GRNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792683744; x=1793288544; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOo6raRuVgtjcP13nHvQbmXlg/BZszZZ1L4y9D6+1TQ=;
        b=thRbagr0kS93zT5v8WW8/66BQkWG+fDEO65a7r6VnGj0XreMG07HdhqEgxotRl9whF
         ROisQRGyvFvzSiYM90RRE4aj2uziHCgMBppP00WiFQRX+sLvhW4kH26eK4K5AVegzHC9
         H27JleWBFMx+GQFx8xUlyoUTdYsNET65seYJnv195QDcFCMUORmh/4fJU0iACBUxBXDS
         dz1A6HV4UbspIVbm6K+kYSAdIP6BISTF2YXWTvpGdfj6fM6NEab8xE9bxChDl9dDOvcK
         OCN4Imhs3ILKO47gRXA5P+uqEZvAteBXPZiZ4Nhwb2fEIMP2uLdfkZPYLpYs09VC2TvQ
         tZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792683744; x=1793288544;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nOo6raRuVgtjcP13nHvQbmXlg/BZszZZ1L4y9D6+1TQ=;
        b=xAfKZZewrzrFKWTYplJZaaYUrqGmxO/azPv9W7ROt0MWoQ9jwwf+dp8VYtUbHCuh7a
         ScTzGPKV/on4G/F5Mi1GxQjJgRJYvkLZoDE/1InnlwtmrLYNuoIEjKjUhHvfLdGCaUbG
         1iBDWNj1LNKujWGDz8EAV9M1NnrtYh+DaXVqF1XIlUqenm1nWsp4RgkH+BIv0tEj8QG5
         itwRv5ugPlOtSN+kyOGGgjXZ9Y15TeBZLYzZbrDvoqk/xiggbT6WJvBObHRDwmofZqss
         IwZzAeE+k7FS/ruaqylXSRo5o5/Yqpa7d8vqUNmPRSJJUZM/kJVKwVJ6nHOj0p/P04CP
         M4Bg==
X-Forwarded-Encrypted: i=1; AKwUvBz7tXTcZnY1Iwlmp7k+g2OdgxJxu6S4IPXY66NLvx8b24C0SIDdv048q3HRpTtrbjrM6mkRJSHrZ+f6rlM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9/UBsGKO+E4ywoxyU/JybqHVeJoRNLzOzPhPeHn4e3KnYZm+v
	abZtZNzZmXd+XWlEOGeRZy6uf1shz2J0eue2xJKYwDDwvZZGEdeBiJeNrDAi+DDVoOHmuCmWHp6
	nsS5myXKOIejPC5MlUtHs+hg6YkpUNKZi7NBkEaL9vQvhNXL0weWu8XbC
X-Gm-Gg: AYBFou3+LuW1/WtxmIwqtkA19GF+p9SlC0Lidmwfv8CQWwBnGBgLS+fOCx3FPOOTtja
	oJgfIef1LmX6hWCIHI8zd7481Gyy5VGhE+qNel2XxgqPNj6I0xlSN+fq5m5PxBdpXF3QCppcxAd
	o/cQSTKz3yubopeuC4wwkqMjTDPKZiSW++6Z0ypfemU56m1iifwD+VUnMvLfOo7pi9P/q1peVYy
	0W2w7m0QGSBgVpMHIhmVBhur+soilXb0JhFpwRQjasoJ1HMWyD+6vgOf7cWeUep/ctXZEcJGXl2
	JPw3SjHyRFRwZ5/pKJL8hGSA4GHb6eVXmqeIuFTa8TH2JbOHH+HFEjhsdoASrO7XY4kaxmiJcVt
	uNG95OF3tMe1hOe+Wfo5qR3Ohg293h/LHw9by4naAZElRd+z7scqDNlxWTZcP/7JcKY3gN9lIbB
	HuA+cPH5vpC9qBoDGAtLSyeO5H3w==
X-Received: by 2002:a05:6830:2992:b0:844:ec25:c7f3 with SMTP id
 46e09a7af769-84d08505b79mr4053552a34.18.1792683744082; Thu, 22 Oct 2026
 08:42:24 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019135701.2767078-1-sonalipradhan@google.com> <87a4o8ivv2.wl-tiwai@suse.de>
In-Reply-To: <87a4o8ivv2.wl-tiwai@suse.de>
From: Sonali Pradhan <sonalipradhan@google.com>
Date: Thu, 22 Oct 2026 21:12:11 +0530
X-Gm-Features: AclHuK_cY5MAxLFcDxNvPeTguvtEQpkDq1J7THEXa10GvkWtPofM-JBCJrLXn_A
Message-ID: <CALeehfmiOoJS4cwPCzHcAgi5dGpCiS0sTd9FQZo6VWXwVth-dw@mail.gmail.com>
Subject: Re: [PATCH RESEND] usb: gadget: f_midi: fix UAF race during IN
 request handling
To: Takashi Iwai <tiwai@suse.de>, Sonali Pradhan <sonalipradhan@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neill Kapron <nkapron@google.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Fan Wu <fanwu01@zju.edu.cn>, 
	Victor Krawiec <victor.krawiec@arturia.com>, Felipe Balbi <balbi@ti.com>, 
	"Felipe F. Tonello" <eu@felipetonello.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2026 11:06:57 +0200,
Takashi Iwai wrote:
>
> On Mon, 19 Oct 2026 15:57:01 +0200,
> Sonali Pradhan wrote:
> >
> > diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
> > index 63fb6ee70a3d..c26d04eb9209 100644
> > --- a/drivers/usb/gadget/function/f_midi.c
> > +++ b/drivers/usb/gadget/function/f_midi.c
> > @@ -280,9 +280,18 @@ f_midi_complete(struct usb_ep *ep, struct usb_request *req)
> >                     /* We received stuff. req is queued again, below */
> >                     f_midi_handle_out_data(ep, req);
> >             } else if (ep == midi->in_ep) {
> > +                   unsigned long flags;
> > +
> >                     /* Our transmit completed. See if there's more to go.
> >                      * f_midi_transmit eats req, don't queue it again. */
> > +                   spin_lock_irqsave(&midi->transmit_lock, flags);
> > +                   if (!ep->enabled) {
> > +                           spin_unlock_irqrestore(&midi->transmit_lock, flags);
> > +                           return;
> > +                   }
> >                     req->length = 0;
> > +                   spin_unlock_irqrestore(&midi->transmit_lock, flags);
> > +
>
> Does this transmit_lock help here?  As far as I see, the ep
> enable/disable itself is done outside the lock.
>
> > @@ -678,10 +690,11 @@ static void f_midi_transmit(struct f_midi *midi)
> >     unsigned long flags;
> >
> >     /* We only care about USB requests if IN endpoint is enabled */
> > -   if (!ep || !ep->enabled)
> > -           goto drop_out;
> > -
> >     spin_lock_irqsave(&midi->transmit_lock, flags);
> > +   if (!ep || !ep->enabled) {
> > +           spin_unlock_irqrestore(&midi->transmit_lock, flags);
> > +           goto drop_out;
> > +   }
>
> Ditto.

You are right about this. I'll rework the patch along with the issues
noted in Sashiko's review and send a v2.

Thanks,
Sonali
