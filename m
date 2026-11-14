Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794690462;
	b=I+58dTUs88jlpL9Jjh/hHrcdjjaEyY8U7tMknK/J39d/YNUR4PQdQtFhlRnKGK+siOZH
	 ztmF7isvCiXNQOPb7mEZ8H4ihmAI24UIGj3MHgg7rv7XtDQ/a4NP/uhborqi8fpagKe9o
	 NYgIRU2SWUMjp8VQpornpBRuagJF/5Kl+qlZ+g/hlwzcrKhzg/+SgmWjN+3xxU13RL/M1
	 r+gMlTIl68D847xkTQQJX4CF9OMyCzu58KsEsKJLoQDxbD0OubUZXc0Qnfkwc+FEU9/H5
	 neyikkDZJ/2xNoVQJfDj53kzgjXOqJW8CfJdzvPLyCjjl7dwb2+NsUyLCuuJWXNPnCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794690462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=J1RiYWC1Gtgqr6IRbxXgwNcNyxzKGHZt3TuIm+iR5m8=;
	b=MDAlbx/86LoGkmq9MHjhbF5ScTep+esICdnIOOQkQeCFncrXzhVW8l16Yknuw2Cwl3Kk
	 rK1MGRyzs9Ur1aB09I+CgCJYxRGkVcNwNzYGs8v/Ek7DZW1t1alZ8HUOw7dWox7eH/cyK
	 pyEs6SMwCTGinKgHl+u++SLbJ0VopJ2ChkiIrHkVchIYq/VEEf5jQLFzTEL2CReKX9qws
	 REi9qKRDGc2gG6QpZ+rpsdW6Pl29wPUqVzz84nhVXNr7TCJXQqQl3sQOtU2HAdmrPZqlX
	 8gXYIvIf2CPB1wGgSosC/D3m+ujOXHyzvRWuCzK5Bt+vFRIXVu6hshA8gjtTz1M4Oww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=iMNdG1Up;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6F2606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 21:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE6F2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=iMNdG1Up
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5495d549924so32289671cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794690461; x=1795295261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J1RiYWC1Gtgqr6IRbxXgwNcNyxzKGHZt3TuIm+iR5m8=;
        b=iMNdG1Upsv6oTAO9gm7mCjljk8M/S+CvvgXtywU4RoQitKBxzrUwMVxEXtXMrhl89s
         IL9fbJPyWOuUe9dyy8KuuXfXR7r0aTEaLzPW9cRIuvj5kw5qxhEtCO/GNbrtedgYBjMy
         lpmE5SdWxfQ4Ooq8xF9kVPfHpuRltpH/CBf1n3igYsLyFX+kGHOksDfPDl/Y8qiXiv/5
         kPtbIgjOT2b7mt2aTNP8ErVerzFkljic3mTl7g/4YOhvfTme2OA7o79eq2iY8UJIrREU
         p21zAMkqsrlpOqf2V0DAPKGMEmxxezhOhETHNlxxcyW7f++U7k4X2um3DogPr0sWujBn
         /QJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794690461; x=1795295261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J1RiYWC1Gtgqr6IRbxXgwNcNyxzKGHZt3TuIm+iR5m8=;
        b=DuM2rOdkVqhs9gLjA1NzhrKVc9Oku+uAwNZJzahIFcc1bDl65yJ4bX42kAn/5jsW+z
         38ymkNmvaNwuqxQRGk2bvcbnwBwCrD0+M7yOrPODuPheuhICPGXdYlmHAxND7wrIx5wt
         q13DI8aLTkkTrljrHg25I5rQz2rAY3/671aL29CsT7r0evcrKNoqXpasx16TWIxq/TIi
         0mkIEU/pY3n8B069PApZN/lZTqkSsrKu2rtr70yiMep2TjPjV8gjWlGgIMdKnpPNKIlS
         limnxQGlred3k0x7dxNIuioiE2HFMn0jcQmr/VvAll9efX6Qkcpnkt1D6ywCAgWA6JAX
         syAg==
X-Forwarded-Encrypted: i=1; AL+hErFj0cXNBHiUlUPQk/X3MT1Hjv06BsJG+deskxIDdp1/Wqen1po8Njq1Rt/nVVdxS2nPlKP+E5FdZGGHNdc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dROLN8bvIYDw4H1mvhja4CX8bOzV77cM3XvPWIvX/xLNvmK6A
	9/CO1hGQ0sIcvxXn2GF1MDe1qtQz5/Zzn0WxHjxlGvf+KcMcy94ApXocpRM3aoswFA==
X-Gm-Gg: AYBFou0RdZTrQ5+S2lRip9CtSN3P7DDsmIaK/LbXRBW2ImNfX3eu9DytZhoI6fv+5J0
	gAJCiI/jnbpqidZSJx878gCctKILWGlDqjL88/yy++WEF4rABpnQ/cO0oAz2172Gb5EwCwtADZC
	wc5A6j0xH9IlXtjPtoYspuvzff2OzKM+iyDxGmU4Soxq56vGp60LWXbmF57MRWef2Crpmo4pMZI
	SlICR/o9B1a1Vls1fuQ7MIELna2q8J16ZFQatVpDaWsOTQr4V/++SskA+uAUPnwigJXayqyFY2p
	X0WilR4rT26PCXvbUoKKBS8dT6uYvSzYKm1Xckh2kHRaPDR9mZvISOYTKYePVqEl9Evbes548Y7
	gjNdh5Cgc2L3hzEbeocXhKtS6BntMR346IJWhivr5bk74zLkWzxIirQwxGPxfxiM79dc6LyNmkZ
	99+u56Ei6sjjdTRUKJyQBXmRUSy8TZDmRqMeZ+tyzpZZqVBOgVW9NdjaY77ARUCjB1d2KusN1+J
	eB+IJrljJi26R6VmwkPf98OQHO1UGn1oocShAGxY10WNw/xNiK7k49y6l8hInBXVaTvfA7QOuZA
	f0PEOrcXFQ1XG3O+0lhs3B3Y6ZKnQNU=
X-Received: by 2002:a05:622a:5a16:b0:55d:10f7:8c72 with SMTP id d75a77b69052e-55d10f78ddamr26486191cf.18.1794690460564;
        Sat, 14 Nov 2026 13:07:40 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23c9b30asm50035736d6.2.2026.11.14.13.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 13:07:40 -0800 (PST)
Date: Sat, 14 Nov 2026 16:07:38 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Alexey Charkov <alchark@flipper.net>
Cc: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xu Yang <xu.yang_2@nxp.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v2 2/4] usb: gadget: udc: Forget a deactivation when the
 gadget driver unbinds
Message-ID: <cb1a0c88-0288-4296-bc0b-e3a7f2186593@rowland.harvard.edu>
References: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
 <20261113-udc-connect-v2-2-f51b11f07eb8@flipper.net>
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
In-Reply-To: <20261113-udc-connect-v2-2-f51b11f07eb8@flipper.net>

On Fri, Nov 13, 2026 at 01:28:17PM +0400, Alexey Charkov wrote:
> A gadget driver deactivates the gadget through usb_gadget_deactivate()
> until its functions are ready, so the deactivation means nothing to the
> next driver. Yet the UDC core keeps gadget->deactivated set across
> unbind. Only configfs resets it, from its own unbind callback and
> without connect_lock, so a legacy gadget driver that unbinds while
> deactivated leaves the next driver unable to connect.
> 
> Clear the flag under connect_lock once the driver has unbound, including
> when the bind fails after the driver has deactivated the gadget.
> 
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  drivers/usb/gadget/udc/core.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index 577bc15f61a1..84dc0820c2cb 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1647,6 +1647,13 @@ static int gadget_match_driver(struct device *dev, const struct device_driver *d
>  	return 1;
>  }
>  
> +/* Forget the state that a gadget driver left behind, so the next starts afresh */
> +static void usb_udc_forget_driver_locked(struct usb_udc *udc)
> +	__must_hold(&udc->connect_lock)
> +{
> +	udc->gadget->deactivated = false;
> +}

Is there any reason for making this a separate subroutine?  Just do 
the assignment inline in the two places where it occurs.

> +
>  static int gadget_bind_driver(struct device *dev)
>  {
>  	struct usb_gadget *gadget = dev_to_usb_gadget(dev);
> @@ -1705,6 +1712,11 @@ static int gadget_bind_driver(struct device *dev)
>  		dev_err(&udc->dev, "failed to start %s: %d\n",
>  			driver->function, ret);
>  
> +	/* The driver may have deactivated the gadget before failing */
> +	mutex_lock(&udc->connect_lock);
> +	usb_udc_forget_driver_locked(udc);
> +	mutex_unlock(&udc->connect_lock);
> +
>  	mutex_lock(&udc_lock);
>  	udc->driver = NULL;
>  	driver->is_bound = false;
> @@ -1734,6 +1746,7 @@ static void gadget_unbind_driver(struct device *dev)
>  
>  	mutex_lock(&udc->connect_lock);
>  	usb_gadget_udc_stop_locked(udc);
> +	usb_udc_forget_driver_locked(udc);
>  	mutex_unlock(&udc->connect_lock);
>  
>  	mutex_lock(&udc_lock);

Also, you may as well merge the 3/4 patch with this one.  After all, 
they are both concerned with the same thing.

Alan Stern

PS: I'll review the 4/4 patch later.
