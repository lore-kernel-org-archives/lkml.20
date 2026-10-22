Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792654604;
	b=Nl51yLo+ww8HcSmApjlKHxen2pRoVmrqYSgxJe8gNExXhaMc6jMQNtur3YieNz7pLNJr
	 wTM1DGgQnK++Gxl8l32cNbv4MnRtAMu2Ji14AigYoGDIEV7NLKJ1xaX0sN4pExCQmN3nS
	 QcHMbDxmcxOjfeAKtp3hdu8e8rYCa0P2n9AeQeAPaIrqsaI79Vn5Fi+GPrNZWHriydoIt
	 dI1kuYa4KkesQ+SuSem7eCElg3QzuF0jV24A+EDvQxNxupUNCXbZNMpUVNJ/9DjGUCCdq
	 wVpinwW2GFU+/3iAmGgq0JRq6SuDEtcl9bKbXy5x3TExRVI46sfnoWG5GObVUWZj4sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792654604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vhZJaErBTvR4/vMLVwCau5Oaj0vnh/Fm4H8k4FT36Fk=;
	b=aCpIAJN+uCQbIuq7o1Rrx2gB6fZrMXv0t30e9llyBcUzBrto5nqUhWJUlvUxaILRJTrY
	 BCYzw94vl/m4n4uuyZlUmyZbWLBAt1uWjU3jW5MzE83TtUjgLE9QJgMlXKsempLXaejL4
	 iEvUo8X8mS76zSji5jfxkjrCS1vNnKHmSu82g4I5Hq11PM5bMy5S7Zmiv02CtUV/ugGZc
	 GhWS2FQsbhAmzwlPU/PnuEuqJ1ocslHfdMcZFIUVETh0WP5K+7GvAm7kUTBKnk5t07vu2
	 DsXrm4/KazwOyOywyNhb3dl1X12sfh+FUVgh/YAq1YzYI/GyjejckafZPf01vKUpVDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dN08mXkf;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931BF606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 931BF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dN08mXkf
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3abe4821449so826358a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792654604; x=1793259404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vhZJaErBTvR4/vMLVwCau5Oaj0vnh/Fm4H8k4FT36Fk=;
        b=dN08mXkf79FFDAxGBHR+VMNEFIyIUS6++BEmKBtNUdHXM63ew7nmjMsMUQn/Wa+QyB
         jwEHtTzMruw8Snt0J9YMI8P+3n2jNtTxLWbROTcI/TFckIX8xdVZ+XekmcVVnn8VoODl
         ikt1YVFz9mh+TT8fv/FA0/qBzXde1lJfmVfwvkjZ0Hax5xYGgrRPoy7vVaEpiFfrWvEq
         S6U7av0tL+2k/pCCeaON5a608/VhzdCJgqIvizv+juQmWcAhhE0nDfaW12Y6L9FvjDCg
         P5riTgwu3V09dwBwrLRd5GBeWmoryrEWaFdCz6OeXX7dCxZZxSxjc4GRo1PygV9GcRbL
         wUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792654604; x=1793259404;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vhZJaErBTvR4/vMLVwCau5Oaj0vnh/Fm4H8k4FT36Fk=;
        b=ASgcvpquVvJYT+W+J7vcLqul1mjmzRHU/Aej5FH+O/syxxy7I6TiEOyhFAWkAC2TdF
         uTEKjp/lkio8WiJyWyfAA0D9H2xBTDQ5yaW4lS9xuRxi0W1vLaMO5P5RSS3AzWVxgNYr
         uU7kLf2yeDJoTEHyFTtZasGSggXVfGcMBj3wlJLKaYdTyQKZT5pymsNPUTYJ5QdlC+An
         0wqhQswkQFOzrhWwq6CrWMmtg/CHKpGrTh+a+dVqjY8gQ6aSmy99P3apaqNig+pLss96
         aEsQi2uO6l9FCY/C0m2iVE9MusXpJoaa4jWNuY6YT+RYTfb/GvhbLxMO19UVLRrGwFy9
         9jRg==
X-Forwarded-Encrypted: i=1; AKwUvBxOdG3iqWaD2Uy1zlh7P372IdElZb3/2aG3iqLVz3hO/QJLtEe155mXBwVan2W3YSnS/Y7Z0FJLxhcOrqc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK86gw+G2Zn/E30XDqs5A0be5l0HwpZo8I+nFP6m/BVOCxGzLzT
	2oZ0zcM68IgQdV/pOJOhJOZ0RZUki9TiUV7Bg5SdD8SEN+AmNsI6w/3m
X-Gm-Gg: AYBFou3RFrQbPA+D3kHY+YgDvHKIXv5RyJS3Wgec5bVPLFP2UbCHsphf3IUkdPcEh/F
	Aci6Zpj4t3ZxR8Le4eqI0/wHRJihVGuzKdpePt99lCTtJdivQ5aNtD87VLQczkUd63BTZkU4sOv
	K+ssc1igAmShAAnsRf7PXnWhU0pIGWGAibp1LPNwlRcNfmVidv3CW1/FpHQVirPlaS8i7j5Ckfx
	N2wdHwoLVG6bDktHE2Lh8wApjSBuZB0sTSn6xVskNdz+DT86ZEPo66jMeFQzZM4K+xYae96ikLN
	pJIThVPz9YyC2CHJhQdAJXJT4H3a6WU74+stzFry4bofroi4mY4MFZXQQine2o8FKU4Wi8Izbmc
	urDhbwiBBPJF+nNngKa09IYIfYbRSJXT/T+wizmS8Klq52TrNwdk9JYCss1A8/2V5u1tl4PK9SE
	MivR26N/MtwUSZOu4j5mt9Eh1vW/f/kLXhe+GHv9HHa01LDOMKsjWyR/q6cFi1EuKJ3N9UdYmrI
	u5wFMzV7RUtDU3MYQyxbaivoLHw9vgIIs/xk3eF4VYnolMcLCo8m1mBbYFEeoQJ7HI17tUibRpl
	fqrSvKg=
X-Received: by 2002:a17:90b:39ac:b0:3ad:85fd:711c with SMTP id 98e67ed59e1d1-3ad86ce82a7mr3886173a91.28.1792654603953;
        Thu, 22 Oct 2026 00:36:43 -0700 (PDT)
Received: from J4f-Laptop.localdomain ([183.36.237.113])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48876ebsm2951117a91.1.2026.10.22.00.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:36:43 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:36:39 +0800
From: Shihuang Liu <shlomojune6@gmail.com>
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: linux-input@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ville Syrjala <syrjala@sci.fi>, Henk Vergonet <Henk.Vergonet@gmail.com>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] Input: joystick - use usb_make_subpath()
Message-ID: <5wdnvsf6bepzpxzfizt4fs3325denwzeeksg3b3hpmzu3257tk@ms7kh4fcgz2k>
Mail-Followup-To: Alejandro Colomar <alx+linux-hardening@kernel.org>, 
	linux-input@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ville Syrjala <syrjala@sci.fi>, Henk Vergonet <Henk.Vergonet@gmail.com>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-kernel@vger.kernel.org
References: <20261021123146.17202-1-shlomojune6@gmail.com>
 <20261021123146.17202-3-shlomojune6@gmail.com>
 <ati7yINv0_Z3yPMg@debian>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ati7yINv0_Z3yPMg@debian>

On Wed, Oct 21, 2026 at 03:21:28PM +0200, Alejandro Colomar wrote:
> Hi Shihuang,
> 
> > Date: 2026-10-21 20:31:42+0800
> > From: Shihuang Liu <shlomojune6@gmail.com>
> >
> > The pxrc and xpad drivers build their input device physical paths
> > by appending "/input0" with strlcat() after usb_make_path().
> > 
> > In preparation for removing the deprecated strlcat() API [1],
> > replace each pair of calls with usb_make_subpath(). The helper
> > formats the USB path and the "input0" subpath in one call,
> > avoiding a separate buffer scan and append operation.
> > 
> > Link: https://github.com/KSPP/linux/issues/370 [1]
> > Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
> > ---
> >  drivers/input/joystick/pxrc.c | 3 +--
> >  drivers/input/joystick/xpad.c | 3 +--
> >  2 files changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/input/joystick/pxrc.c b/drivers/input/joystick/pxrc.c
> > index 52d9eab667b7a..1a11e73d7cd04 100644
> > --- a/drivers/input/joystick/pxrc.c
> > +++ b/drivers/input/joystick/pxrc.c
> > @@ -169,8 +169,7 @@ static int pxrc_probe(struct usb_interface *intf,
> >  
> >  	pxrc->input->name = "PXRC Flight Controller Adapter";
> >  
> > -	usb_make_path(udev, pxrc->phys, sizeof(pxrc->phys));
> > -	strlcat(pxrc->phys, "/input0", sizeof(pxrc->phys));
> > +	usb_make_subpath(udev, pxrc->phys, sizeof(pxrc->phys), "input0");
> 
> To be honest, I think the composed approach is more readable.  You don't
> need to learn a new _subpath function with all the details it has.
> 
> Everyone knows what a str*cat() (or str*cpy, FWIW) function does.
> 
> I'd rather improve this by adding strscat().  The reason for removing
> strlcat(3) is that it is vulnerable to DoS, and that it is inefficient,
> but it is good at producing readable code, and a replacement should not
> degrade that.
> 
> 
> Have a lovely day!
> Alex
> 
Besides that, strscat() has other issues:

- The `sizeof(buf) - len` arithmetic is a classic source of
off-by-one bugs.
- any future change means re-deriving the offsets all over again.

I'd prefer to avoid strscat() here.

Thanks
Shihuang
> >  	pxrc->input->phys = pxrc->phys;
> >  
> >  	usb_to_input_id(udev, &pxrc->input->id);
> > diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> > index feb8f368f834e..0f7ca5adaeee7 100644
> > --- a/drivers/input/joystick/xpad.c
> > +++ b/drivers/input/joystick/xpad.c
> > @@ -2059,8 +2059,7 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
> >  	if (!xpad)
> >  		return -ENOMEM;
> >  
> > -	usb_make_path(udev, xpad->phys, sizeof(xpad->phys));
> > -	strlcat(xpad->phys, "/input0", sizeof(xpad->phys));
> > +	usb_make_subpath(udev, xpad->phys, sizeof(xpad->phys), "input0");
> >  
> >  	xpad->idata = usb_alloc_coherent(udev, XPAD_PKT_LEN,
> >  					 GFP_KERNEL, &xpad->idata_dma);
> > -- 
> > 2.43.0
> > 
> > 
> 
> -- 
> <https://www.alejandro-colomar.es>
