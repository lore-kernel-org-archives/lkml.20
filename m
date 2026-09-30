Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567D93921CE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790741837; cv=pass; b=hPJc1kQx36eClPT/p5XfoUAgATeKHgzoeGVSJw+g1XwXGQP2d/otuXQmyJp1T4CaM8Qxub7Pmdmpo+ufvBUBTotUdaYf8jV3uMQI5jYrQAiIcsiKTJ6XWVL8hc41HLNe0uyzXJFzbk1JMg3zUnkid2d+K4+XcCcfM0nMvOI+ZkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790741837; c=relaxed/simple;
	bh=1VkkeNuz4jcjZfSZeWd4nIhSpiZfnQd4SMMJ9CcBaJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FWjOWGMeHRuaF1GFcboXzEaEACwR2w8SLls4AMFpu3YZOK5uEI3WvK5LamUSEVbcHNfI7USCcJvd4vXZpgWLhajcLw5WD9BVHoMLAoW8tNsdrTeoyDnt9Ms7k3VWHMUSpkWs4VgkoCh06nWEAmqSlVX4R8xi0erpea7fxdmXyoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X7DQewFa; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X7DQewFa"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4aa8d881so5250980d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:17:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790741834; cv=none;
        d=google.com; s=arc-20260327;
        b=rdmYSIXtZRYg0ovscl2jVu1tf765/5dBnLwizrfijLCEceqlXqhDbTn3yscI9uxPWu
         9o9uzEMJPD7ZP5acOJKafo7sQwgYRSI9bSchyKc5bxbXXvmkvwBuQ8YXm4GWv1/+sB7X
         fw1pQ519FqXfwZE1LEcscs+DimpPkvudDHg+JT+Nt9DKZpmDav//s1dvCSp35+ewpiaE
         JDPKrpMpgbCW3sTofBY8fpioyjAvLG4eGcQkmiLY6j4xSdPy7Z9pmqVJ5c7BNeu+yRas
         +A4RQ/cZAuvsnPjuedd54tSru0RrLQM7c2e2Gb8iKcvtx0I+Eqo9kXF7ZMuhCwJtAe/g
         k0fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9h+eh7L+0RODWZGZ//iHhhQel5hIsdMdvjtB+K+zqkI=;
        fh=HOvYxrzbbLZk5ajPStjMF0fhACRLSoETl4z6tfI0occ=;
        b=DrltJw8JJLyFHTv70ZpTs2nnqOQBRbWAB/ZDsfE4fVSyL7pRtGeU4WV6/yXyu8u81K
         k22ljwdHeP7834/qeMKbUJzHf6FfhSRNio/rTzd6DOzawd7zuBbKKBvHJejboTLUmpUK
         vsPqlBPw1YkvRUuPL1ROtMi+4Z6aDkEqPlz5Elr1I8x55iuqspmGL2ln8s9OnD1gxjdn
         NLKUsvGtT7Ovh3de+6FWK5KLjzqZk4GhguHgqHvFXiv6O3qQ8tGTpvb0MZ+l6t0NSzVr
         vk+x6quS0kCe5xJwwBjM3yaxef4xaJ8ocmateuRCI4wc+MgRYQRQwfg/Ryom5Hy+fVLH
         DaZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790741834; x=1791346634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9h+eh7L+0RODWZGZ//iHhhQel5hIsdMdvjtB+K+zqkI=;
        b=X7DQewFa2OI07fwXWXLtV5s0w90ite3l55wDGjebYBo9SfyZgzT9b1CPWbujo0nkD0
         tCbsDBN1HnlaeZjXp8WAmuE5plgLZW/dG1p+h4pssjkH4XzhDTDCiGaRgHFWInbPEcqm
         4+opCAaEuVVHaTiM7kPp2er1nxbC1PFAd6PG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790741834; x=1791346634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9h+eh7L+0RODWZGZ//iHhhQel5hIsdMdvjtB+K+zqkI=;
        b=afxfRFTNTiXv5mmG5whlbo+Cuu9c5Kg7puCs62ER7KynYKVsZCdKHlEIWtrofl3+Gg
         lR2Dq7/9yiRR+O+riYTmg8WZ+PvhvnSq9tbByUzSnH6YYAB22G3Vi8oB90r6jWchUTLf
         ccseLOv62A+ccw2Fs743KGr6U4SvswkJkUkjtiWQWrXFzc8qj/5YYRhLkqJwgcz3/nEh
         nQKDOgfl9dGDrm7S3EqVRM0EyDFMlstMKfqA2KhqSDvCRdOwquBG0PNfgo1+Fum/9qK2
         wT28Bhji/hdIQrGjeTu/+Hrx7x6Q+fAwFKv8GI7Pc31PAFeiTyyxayprb4F+7iKM1nv0
         8FBA==
X-Forwarded-Encrypted: i=1; AKwUvBzdM+d92zH3D4r5mT30Zd54ySRec4QpUlCZu/d4o0zaLfQ/lq7AFEEj4ABxr0PSkyK1R8AikC1xsaA4VJA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKMfdgmTXEPbdsQ6HofCEdKrMRiCBjf3EPxIqbFv85JruTdbMj
	zo8wwUNB/S7TMbzE0sL6gUqTse4BIxaNDVRN7pxOQCk8T00dz6sNWWHjFHFUDSZquKIweEH6MMc
	Q0UzJNHexT1iEtEDSAbM3dZ/BdJQhwejyKvF0zqPz
X-Gm-Gg: AYBFou2O4D2+365CzhJTh+bEKCrkNSjkRYXGc5RFgaPHjr2il/vs5XZn3ZNCOBO/GRz
	kIL99yp8wqx8oT5tRF22gpDhsOHVhaOnoGWCq8ulNM87WbpzE1Ti7XxTXRwGo8CmAzF29RaTnjr
	mfU9vZvdJynC3BAzltI1TvhGkUVkOhBXDsmkBtyVd76THokZvQ5GtjCFSuRq4cacyx6t07AhmW0
	J1qONaAb5QoHdV64eXJRjBZw1kqTknv/I3fBel6VLrjYuEgIDTQRrGpr/OcHmzU0/7fGfwZUgY+
	HdBdeyal9oU/txo+rBInAUh2guU1MgkysOdKhlmQUJsIiD6tsY8JoEeG9zK+U6fr5273+741LlU
	vEztuaOVHiyM=
X-Received: by 2002:a05:690e:dc2:b0:674:1d59:a129 with SMTP id
 956f58d0204a3-6768358def5mr127636d50.93.1790741834361; Tue, 29 Sep 2026
 21:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922080541.1986179-1-wenst@chromium.org> <abf721b5-c848-4b58-9c0c-a8298d03f803@rowland.harvard.edu>
In-Reply-To: <abf721b5-c848-4b58-9c0c-a8298d03f803@rowland.harvard.edu>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 30 Sep 2026 12:17:03 +0800
X-Gm-Features: AclHuK-3QHG3VIobT9dxgVfGFiE_LcjHKXhqHudxJDFddQpCSiak8yQvrqImMag
Message-ID: <CAGXv+5Gzj66Zhg-C1zq-QysjeB7KusUyfDdtMrELTEsZngM00Q@mail.gmail.com>
Subject: Re: [PATCH v2] usb: hub: Set proper message when usb_hub_create_port_device()
 fails
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 10:21=E2=80=AFPM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Tue, Sep 22, 2026 at 04:05:41PM +0800, Chen-Yu Tsai wrote:
> > Right now when usb_hub_create_port_device() fails, it prints a separate
> > error message to say which port failed, but otherwise leaves 'message'
> > set to the default "out of memory", which is somewhat misleading.
> >
> > Allocate some memory to put the custom formatted error message in and
> > use it as the error message. If the allocation fails, use a generic
> > version of the error message. The allocation is explicitly freed after
> > the error message is printed.
> >
> > Variants of __free() were not used as it ends up mixing usage of __free=
()
> > and goto. Also, kfree_const() won't work as it uses is_kernel_rodata(),
> > which only returns true if the symbol or address is in the kernel image=
's
> > .rodata section; it doesn't work for module .rodata. And the USB
> > subsystem can be built as a module.
> >
> > Assisted-by: LLM # local reviews
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v1:
> > - Explicitly track and free the allocated custom error message instead
> >   of using devm_kasprintf()
> > - Link to v1:
> >   https://lore.kernel.org/all/20260728100005.413868-1-wenst@chromium.or=
g/
> >
> > Sorry Andy, I ended up not using your __free(kfree_const) patch. My LLM
> > was telling me that it won't work correctly if CONFIG_USB=3Dm.
> > ---
> >  drivers/usb/core/hub.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 0e929a4c9fa1..398ae53cd8d7 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -1480,6 +1480,8 @@ static int hub_configure(struct usb_hub *hub,
> >       unsigned int pipe;
> >       int maxp, ret, i;
> >       char *message =3D "out of memory";
> > +     /* Used to hold and clean up kasprintf()-ed failure message */
>
> Comment is unnecessary.  People will see what the variable is used for
> by reading the code; it's not complicated.

OK.

> > +     char *msg_alloc =3D NULL;
> >       unsigned unit_load;
> >       unsigned full_load;
> >       unsigned maxchild;
> > @@ -1756,8 +1758,11 @@ static int hub_configure(struct usb_hub *hub,
> >       for (i =3D 0; i < maxchild; i++) {
> >               ret =3D usb_hub_create_port_device(hub, i + 1);
> >               if (ret < 0) {
> > -                     dev_err(hub->intfdev,
> > -                             "couldn't create port%d device.\n", i + 1=
);
> > +                     msg_alloc =3D kasprintf(GFP_KERNEL, "couldn't cre=
ate port%d device", i + 1);
>
> Why not use a fixed-size 64-byte buffer on the stack instead of
> allocating extra memory?

I was avoiding bloating the stack usage. That said, 64 bytes isn't too
much, and it could even go down to 32.

I'll put it on the stack. Makes things simpler.


Thanks
ChenYu

> Alan Stern
>
> > +                     if (msg_alloc)
> > +                             message =3D msg_alloc;
> > +                     else
> > +                             message =3D "couldn't create port device"=
;
> >                       break;
> >               }
> >       }
> > @@ -1792,6 +1797,7 @@ static int hub_configure(struct usb_hub *hub,
> >  fail:
> >       dev_err(hub_dev, "config failed, %s (err %d)\n",
> >                       message, ret);
> > +     kfree(msg_alloc);
> >       /* hub_disconnect() frees urb and descriptor */
> >       return ret;
> >  }
> > --
> > 2.55.0.1082.g2b9226bbc0-goog
> >
> >
