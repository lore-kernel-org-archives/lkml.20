Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792537027;
	b=3Ac2oQi5kqofH+PcZSvpKiaXyic5Ssb5qjlAz8ZU1QyxC1aEWQdpOLNaCbm3e2R/jG2d
	 klmqVq9Dyu7pL+Oifnp0L9scmHhKXuTbxdFT+jVAK7MPDEdACpZfBXPDtNDY+618p6wb1
	 njzu3Jntk6aJF8c4xR3Uf0IAyJoYEzT4LIHcP+6mp3rmZYAn5UVog8xWxM26ynz2cv9ta
	 R0Rnx6uO/EjN92+exewEo1GnG2HwHNVN7ikpqeb6b2USYyKe27uGe9tX9m56fJjebE1f3
	 EaQ00I/LYN/ytaTu1jry5b094+k0bH55u5V6IQGDMhNp8brp0Sj9jH9Sn3jtmoGpGyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792537027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bVH1fJHf5vkXaa9LWZIGqzT2wgp2XysB6VORD+LQhvw=;
	b=MdghhXiBnQXU1A5rSwtWWkLuuRnt7zwWLPQf4Kx6U6HSEInXw/eXXwTJ+XGBk10Lpq2B
	 i6kqaEfybGBnwKFl8+npCgWOLtiTBX7ekj5flmbw1MaseFoqDHBmv5c74iemmfQ3GakAh
	 JaRMYRCMeA/X+D2zkRnWB4mG4t5nHcqgRELAoFL59KrEVl/faJgf9BiEDYrkn3yM1E50M
	 HGil64Pg43dG3nVAYuc1BfyH+Qp20110g6LVegiT0YnMuU/yPAi0ZRFLb0o+4pgJez9IF
	 1IqZLcvPUYAaoAk9pWnGhKe0UOJ9TaZOnt+t8YqtmP8nc0MlLkXy4omdsfnK+jXMsNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DdozBHqU;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB20606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACB20606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DdozBHqU
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso109250f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792537025; x=1793141825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bVH1fJHf5vkXaa9LWZIGqzT2wgp2XysB6VORD+LQhvw=;
        b=DdozBHqUDBzjiHMLGZcAE0TBmdgteIvD+UXOVDOyF1dw4jIK/arG4W0oHYIMrMoJqA
         Gj4Utzf9gPeDDLGJAg3KQ0LWQMYSGGwLbYpxHB2k+Y7XWEI34dToIDek4EGPC4Vts2jV
         MPz+UPjpN/jMsa0RZXRSf5+7urqLXi4RSmKaTRJqH0ZzRfIakCdmeSfObivYbm9JjuSc
         yue4IBxEKidcnuMtUoTNa07vUHjQg78ALTk6P9+u3ZJ+z0zaeEK8UQ/K/7/5GpOcNbFi
         HGzCzZqejRAcSdiWmu61KG7ect6sezy6/7BGcRWWD88tlg6oSiAquiv+NMBB2q5sen42
         iD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792537025; x=1793141825;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bVH1fJHf5vkXaa9LWZIGqzT2wgp2XysB6VORD+LQhvw=;
        b=0BwGwo8cnThBaqUdGZ6b1IHN34QbjOULK8Hhd8/Q1r1HTzt/kj//SmM7nden8GQkRq
         0uK4IwuWk0LlTACeM2nSeixazsdFj2oEUDEf1frEOaa0cJOYVIDrY8FrFby6qSunrSnk
         JGuQiZ+QKmYZr+uviVxDheNp83cxJEbyU0GA/ByF9RkKNsUGZBH1Pesi6P7H7okEx4f9
         v19GmRtSdS2XJNZ5dLS9DueSM4O/Wx0lDFgEPItPo/Lv6DOnyxGfMFO+y4hDg/u3hQjo
         M29QMXz1FGtokcDtbq+3lrAtddfCUe9VIbc2UETiHOeo/wpsEyN+QK1t0QVWTskjSa1/
         e08A==
X-Forwarded-Encrypted: i=1; AKwUvBzJFXBCGHJl9m1dRWk69sRWVEtDLD/hAPa+fPOghMyhUZjL2Z1UvTp+jT2RqKrlBeTrbFX4UvJjukp/kSg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCYYYJsPVO1cJ/oSen9u/jq2FYn/Gceyf0dZ4fmerQ8T3Rxk4Z
	p4X1nq4n6gzEaYiefa8PeQ2LKWdmoBILmpjA0Xrd56QF/vNqsN+Ou0QW
X-Gm-Gg: AYBFou1rNgmuYqt0q0fdB5CwfI9LQRLlumXEnWFrFZ51FawudobvrMF4R1XhCKT4rGi
	kCvcJkMyda86/R9bYI0XV+BF74CFrRAMhmyt51fWqDNEPP85z0ooTe+i3J5KUhwGxiuxiDk84zo
	xFBO/lbAIlVaIX8KynpRwuBa5B5Fge0I9zGFXzkFvijt1SdlyPgj4ACQKKqdAMlq6MQUG2bTlaM
	Aztmx3C2zOZ/xnRqcZeOI+gPCyjuibbRr8YJSjEgM1a5dICkL7vSaT6FvnDTpexpf/bjJCty2+s
	poh5HG5jjvORR6uQzKuI8osNCsd1Y5nyjrILT6Es3kZEseFJgKoH85l7a4ClZ42KYFwjwGoLEw7
	R4QkwUeqG371CJeQvsdR5TmCZh7e5Ca+E9/izxBxo49kFNluEHw4GoHZn4y6tMWHCwVYYx6jEML
	Z4USuGThE/XvjWWfD9zRA1W2NlQzUFQ/7yx/0Sm5TosriJEToJ2+FNJv+0fmU1NDHXvxGkAszwV
	eHAgUBeHA==
X-Received: by 2002:a05:6000:992:b0:48c:4a62:9af7 with SMTP id ffacd0b85a97d-48e264c01e8mr221660f8f.28.1792537024962;
        Tue, 20 Oct 2026 15:57:04 -0700 (PDT)
Received: from foxbook (bfd231.neoplus.adsl.tpnet.pl. [83.28.41.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583ffa8sm1292244f8f.51.2026.10.20.15.57.03
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 20 Oct 2026 15:57:04 -0700 (PDT)
Date: Wed, 21 Oct 2026 00:56:54 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Steve Bayless
 <steve_bayless@keysight.com>, Guido Kiener <guido@kiener-muenchen.de>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH 0/4] usb: usbtmc: fix undersized high-speed bulk packets
 on xHCI
Message-ID: <20261021005654.23517441.michal.pecio@gmail.com>
In-Reply-To: <a642dbc2e4ba0efc381c69e26821762a@tipi-net.de>
References: <20261020-fix-usbtmc-short-packets-v1-0-903f4d029193@tipi-net.de>
	<20261020184244.69b78d5e.michal.pecio@gmail.com>
	<a642dbc2e4ba0efc381c69e26821762a@tipi-net.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 20:33:17 +0200, Nicolai Buchwitz wrote:
> On 20.10.2026 18:42, Michal Pecio wrote:
> > But SDM4065A is apparently pretty modern (2025) gear marketed for
> > "automatic production lines", so it's odd that it has such issues.
> > Has anyone looked if the same out-of-spec descriptor shows up on
> > Windows or (don't laught at my optimism) consulted vendor support?  
> 
> Not yet, but I'll check on Windows. The vendor(s) don't really seem to
> care about the bug (surprise!). It is known for quite a while and even
> not fixed with the latest 2026 firmware for the siglent. This makes me
> assume that either most of the professional users a) use Windows or b)
> use the lan interface (which we do for most of the stations).

It's worth trying, because sporadically we see devices which enumerate
differently on Windows and on Linux for some stupid reason. Although I
have a feeling that this won't be one of those times.

> > Maybe Windows xHCI driver tries to enable out-of-spec maxpacket?
> > We could do that too, though IIRC not all controllers are happy,
> > so a SW workaround may be unavoidable.  
> 
> Did some quick tests and it looks good so far. If the usb maintainers
> can agree on making it less restrictive (/ compliant) it would save
> lots of efforts and the quirk would be down to the ZLP patch. In my
> tests all three devices worked with
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 8a8636279e844..c4306482874eb 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1505,7 +1505,9 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
>                  err_count = 3;
>          /* HS bulk max packet should be 512, FS bulk supports 8, 16, 32 or 64 */
>          if (usb_endpoint_xfer_bulk(&ep->desc)) {
> -               if (udev->speed == USB_SPEED_HIGH)
> +               if (udev->speed == USB_SPEED_HIGH && max_packet != 512)
> +                       xhci_warn(xhci, "EXPERIMENT: keeping HS bulk maxp %u\n", max_packet);
> +               else if (udev->speed == USB_SPEED_HIGH)
>                          max_packet = 512;
>                  if (udev->speed == USB_SPEED_FULL) {
>                          max_packet = rounddown_pow_of_two(max_packet);
> 
> So this looks like the better fix. How would we want it gated, a USB
> core quirk flag per device, or per controller?

[Cc Mathias]

Good question. Do you need this fixed in stable?

Depending on regression risk maybe we could get away with no quirk
flag at all. That's what ehci and dwc2 seem to do, which means that
hopefully no device specifies illegal packet size while using 512.

Other possible risk is some device doesn't truly care (no transfer
is ever large enough to matter) and works with 512, but setting its
requested packet size (needlessly) breaks some xHCI controller.

Such devices seem not very likely to exist, though more likely than
the former kind, so I will try to test whether such xHCI breakage is
possible. Preliminary results are encouraging: although several of
my HCs reject packet size of 1024 or corrupt data, 64 is accepted by
all but one. I haven't checked for corruption yet.

I will also see if I can figure out what Windows does in such case,
because doing the same thing as Windows may be the safest bet.

> >> The Rigols still have one issue I can't work around. They split
> >> replies over 500 bytes into several transfers, and a follow-on
> >> transfer that ends exactly on a packet boundary never arrives. Raw
> >> libusb shows the same, so I guess it's another firmware bug. Should
> >> be fine for most use cases though.  
> > 
> > What exactly is the sequence of URBs you see vs would want to see?  
> 
> The Rigols split anything over 500 bytes into two transfers:
> 
>    REQUEST_DEV_DEP_MSG_IN #1
>    IN: 8 x 64 bytes (12 byte header + 500 data), then a ZLP
>    REQUEST_DEV_DEP_MSG_IN #2
>    IN: header + the rest
> 
> That works fine, unless the second transfer happens to end exactly on
> a 64 byte boundary (e.g. 640 bytes). Then the device just never
> answers request #2 and the first IN times out. I also tried leaving
> the ZLP from #1 pending until after request #2. That fixes the
> boundary case, but then the device randomly ignores request #2
> instead (roughly 1 in 5). Raw libusb behaves the same, also with
> maxpacket 64 in xHCI, so I'm pretty sure it's just another firmware
> bug. What I'd want to see is simply the second transfer arriving :)

Doesn't look like any obvious xHCI problem to me. Did it also happen
with those USB2 controllers that you used previously?

Regards,
Michal
