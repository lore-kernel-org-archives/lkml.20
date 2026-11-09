Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794256484;
	b=iDGNp8cDBRBnshWDapep/2V0Q/Mk5ZknCjLxT4faDXMkzwiP+fVftvbhrV9inmw2szF8
	 cTvNtlv1+XYZKUSHhM7fM+RiSeO93TxYH03+2MpkiKwW59R4BVvUTJ+a7MY80xvEeVLmQ
	 f4XZ3CGZM7bSyjjaNGTtOCMO/MknQ31A7fo8EfteJ45W98rjBLGrGXzsXtOv6fFWIg9qB
	 cTq3xqkYJIkifTPNhGHBXr/1jHZ1MVy+VH47USB9cotOa055j3z/QG7qpPoU+oeSZ08Y7
	 npxjEFxvyRbntYo0lEfVVI634Mjhe5uI0w2d3AOvHukosT12Flrlh0Hun/cwzKb/K8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794256484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=IBxWV0bMHBiaBYABre4CeRklD+VEvSYRbNLDT7mR5OE=;
	b=ElwGfaSwhVJt1VSlpvlhZF9Ec8Be1e1hyYwmZQOhepfk0BNO4YaYrtUlGp/p1Aj24v6s
	 NZctR/JulRa7hk3el8sMx6l6wPeSnlAZupSt50mXPN+3vif8KZDjMrqW1ve0ZA01H61fR
	 01HIfeo6b/Q7KBsa64MnaKtJ/TAxBLkLzIUnbi+7RxLapQv8e6bbPr52NVFGeqr9PEg+L
	 VAaT0DdQwMEeSiRNSNQ3WoTLisbaykPkifmPj/VJ4BKlrMBh22DCmzMm//PsuxJdl6wLd
	 bjPD5K/JIdXZ6Rfgg9J3qMiT8SXOmhO9U0PjFa1b95lL3OI9rBM9EgHHsMthdXkrQjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c9TmK+9W;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB31606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DB31606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c9TmK+9W
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso896047f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794256483; x=1794861283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IBxWV0bMHBiaBYABre4CeRklD+VEvSYRbNLDT7mR5OE=;
        b=c9TmK+9WzrGyvd+dKsPN5CRanNi3KrAxYt7LKAN24BULUbEELTKz9a3REq0gnaF1eU
         96dkvLHUhT+Dey24BA803kWLvqWppZfKGlgK/KTSDJWb8BEvoi7SQKLyu0+qFBBTQre6
         c3ApfaIZXvk4P+K3nfi3o4lJT5hPfKjNev4vephwJOukoaCVqawno6zNEU4T8EiQ2QXW
         9yEl7K8t58m72puXrbI19fiGd0WImOk5Oiyyr49pOh9OIc3MUl6WSRXs2+54rV0TOQsK
         Ia7OO0PJANNhk8znn9Z2t/YF+YVTLM0vpswHDvvA4LmBeyZ/HMzX3fo3LpnpsBPzg7u7
         xlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794256483; x=1794861283;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IBxWV0bMHBiaBYABre4CeRklD+VEvSYRbNLDT7mR5OE=;
        b=gTpTdU6lo81TXeZ49MOXjGXYu5EZ9y1o3OyD5BQQMl32BJOLFq9ey3VQ0OREmH2apC
         Y08uESupeWtbkLnvcQl6T/2s/WhTgSjMSXSf6e2V3WtlpY47JzT0nXsfVbaB3wcMhCSd
         9C711PmUnVoFVeccgzijE7V+xhXa2amUxhFUW+95hnvGvgSLqLSuhGw39klTlaE4SNBR
         51BC4JNn3Briw1hGX674bBwRGAhsAc02y0MiJe6B/V1EkYPEqiRN3iSgj3u9lJHMwMa7
         K4EvjMhSAodiL3+cTySCCC1P4Hz2osey4boijsOnk3QjHXteM9sqcyBUiD+TsZMvqQmq
         kWjQ==
X-Forwarded-Encrypted: i=1; AL+hErGK6Si1TxE9a+3Filb1RfmYFDO6nj7TRiKrHBrYdNij1xHTZWvoPzuhONSHigbCC+LmkGPTJigUtlm2mb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1YaAC2AGetkCzo2Aksj0b77YW4Kxu4j17wVEAB+9bc8c02Qcw
	CUjHv6k0cg/aPfaCtFh7FXRZR+kkEccI9tCATAeL2MwXrsxQm8dWWgYF
X-Gm-Gg: AYBFou0GVAfJjyribZQ3YJLijRi6sxwjmOsmQIpm6MJTiyQmFP4iObA2VjpDGWCbUT3
	+qHPudQI/dthCiyiudkXENxwNJJDOIyfvFljrHLBnDCT9FbfAxOqrt9ADrNbyxXsf/ecrfoZuX/
	f+aiL35sun2oMHf8t9Ibg0+cxZwYONLs0q4LQnMQhtZ3dgDAHXp6EL5Nvme0gzS4rHoSOwq9V6X
	9eOishpqzvBW2xXlbNvGbWGhpDhLjBX3iHB24pEwZMY0szBOLbYl5lzPkeHhFx/eNcl5n0QdsDx
	xHYLSvPRIiNICCuKcmSsXtxdE0+4GTMnl/C251/VbiXmmR3qv0MW0BhcmywdEwOmfJ2sA48IJje
	0Fo2YYVNeC6k62ORl/vK5k1EYCx8a7rPx1gN+0CVTk6yvMC2X4cHjQaeWYxYnRkTCYEU3fC4qiW
	cRpw154taBfvbuTqB6M+4lU/nkrHt2JUtUT0aKztt+ihw6MHoD2BJqz1Oc3OYXaAD2C9+MIMvpa
	hL7pg7fvjq46+zoDHE8dJThRsTINqO3nA/pT3Uhsj0AbgZaFQ4OSbt1iIZSnyMaTSU5kkW/sgcq
	XceMPi34xKtaiWUJXKGBQQU5EDcjtF/f8zJJ0/QIaqJUOBk2/jmr4uAeAlA=
X-Received: by 2002:a05:6000:4b10:b0:48e:678d:396e with SMTP id ffacd0b85a97d-4982e362a4emr1059772f8f.9.1794256482703;
        Mon, 09 Nov 2026 12:34:42 -0800 (PST)
Received: from foxbook (bfj76.neoplus.adsl.tpnet.pl. [83.28.47.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365cbfc6sm917789f8f.41.2026.11.09.12.34.41
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 09 Nov 2026 12:34:42 -0800 (PST)
Date: Mon, 9 Nov 2026 21:34:37 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Pengfei Lv <lvpengfei20@huawei.com>, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, xuhaiyang5@hisilicon.com, xuetao09@huawei.com,
 caiyadong@huawei.com, suzhuangluan@hisilicon.com
Subject: Re: [PATCH v3] usb: core: hub: Re-guess ep0 maxpacket size after
 reset
Message-ID: <20261109213437.5c693895.michal.pecio@gmail.com>
In-Reply-To: <3daf18d4-4936-4ed7-8846-b67f1664be13@rowland.harvard.edu>
References: <20261106031625.1824732-1-lvpengfei20@huawei.com>
	<20261109093935.2634235-1-lvpengfei20@huawei.com>
	<3daf18d4-4936-4ed7-8846-b67f1664be13@rowland.harvard.edu>
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

On Mon, 9 Nov 2026 11:05:30 -0500, Alan Stern wrote:
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 199d3f535a89..d86bbba1457c 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -4969,31 +4969,29 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
> >  	}
> >  	oldspeed = udev->speed;
> >  
> > -	if (initial) {
> > -		/* USB 2.0 section 5.5.3 talks about ep0 maxpacket ...
> > -		 * it's fixed size except for full speed devices.
> > +	/* USB 2.0 section 5.5.3 talks about ep0 maxpacket ...
> > +	 * it's fixed size except for full speed devices.
> > +	 */
> > +	switch (udev->speed) {
> > +	case USB_SPEED_SUPER_PLUS:
> > +	case USB_SPEED_SUPER:
> > +		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(512);
> > +		break;
> > +	case USB_SPEED_HIGH:		/* fixed at 64 */
> > +		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(64);
> > +		break;
> > +	case USB_SPEED_FULL:		/* 8, 16, 32, or 64 */
> > +		/* to determine the ep0 maxpacket size, try to read
> > +		 * the device descriptor to get bMaxPacketSize0 and
> > +		 * then correct our initial guess.
> >  		 */
> > -		switch (udev->speed) {
> > -		case USB_SPEED_SUPER_PLUS:
> > -		case USB_SPEED_SUPER:
> > -			udev->ep0.desc.wMaxPacketSize = cpu_to_le16(512);
> > -			break;
> > -		case USB_SPEED_HIGH:		/* fixed at 64 */
> > -			udev->ep0.desc.wMaxPacketSize = cpu_to_le16(64);
> > -			break;
> > -		case USB_SPEED_FULL:		/* 8, 16, 32, or 64 */
> > -			/* to determine the ep0 maxpacket size, try to read
> > -			 * the device descriptor to get bMaxPacketSize0 and
> > -			 * then correct our initial guess.
> > -			 */
> > -			udev->ep0.desc.wMaxPacketSize = cpu_to_le16(64);
> > -			break;
> > -		case USB_SPEED_LOW:		/* fixed at 8 */
> > -			udev->ep0.desc.wMaxPacketSize = cpu_to_le16(8);
> > -			break;
> > -		default:
> > -			goto fail;
> > -		}
> > +		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(64);
> > +		break;
> > +	case USB_SPEED_LOW:		/* fixed at 8 */
> > +		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(8);
> > +		break;
> > +	default:
> > +		goto fail;
> >  	}  
> 
> The usb_ep0_reinit() call belongs here, right after 
> udev->ep0.desc.wMaxPacketSize is set.
> 
> >  
> >  	speed = usb_speed_string(udev->speed);
> > @@ -5062,6 +5060,9 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
> >  				goto fail;
> >  			}
> >  
> > +			/* Sync the guessed ep0 maxpacket size to hardware if needed */
> > +			usb_ep0_reinit(udev);  
> 
> Not here.  And not inside the retry loop -- ep0_reinit should be
> called only once since the maxpacket value is changed only once.

Sashiko pointed out that xhci-hcd may not perform ep0_reinit() properly
until address_device() or enable_device() is called.

So it's either this kludge, or dependency on an xhci-hcd patch which
didn't exist until today:

https://lore.kernel.org/linux-usb/20261109112846.04bfeb0f.michal.pecio@gmail.com/

Regards,
Michal
