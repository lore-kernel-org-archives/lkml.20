Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039849;
	b=VP6VSWYl505h+sSjA1FSXT3BA5/CzjASWiA5pGCBHHaQ/CwAgCH9htPJ+GuCkaKuk4/f
	 Ka9HDmO3yBy9dJPXhq288HYlqlJ1D0+Q/4yy+fYFQ6Umh3gAb46Mcb9ewp5s0TFnzKNOq
	 LKZ4+B5S8mVTgBfOya8gpstY6R/opedziDnQGnAcuvmOxSqp11Ry25RQe0/AKdTyPgtjs
	 XLwDOM2JUbcFEDC8lCObeb+QZiSkTZwFzW46FsLxNdz0BI93IGAemW9s3gn6LgaxK21dW
	 bBjwJo/6X7UNs/WynuP+T9hE/gwfs2Q4SrcROAgB+hB0awbnvxL8UShNmF4rXrDp4GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jz6PhmHAqHAHeg3j44XUyEwE6Xd1Y8uRjpXGP04iFfo=;
	b=rhyK7ha1M7LJQntyPWgNHTnalPij1kHTbNIOcDqPqhIldAzmgQi7cNdBFdRZi3GxYz+5
	 aL6nMF2vQOUvTEirmTmF29t2OrwsG/nD9A4gwWdMtqWyGnwGsTPGxbu2kome+0VCCv95K
	 12W9zrYcD/XHokNdMD7cNPbIQi05wqtXx2hded+EwbN4IuxV9arSpz24VRAOLdi5xNk6t
	 7lCCNA13gPkSAZmYTKL5vUSk3/7wpwBt/vHi8ho6rcP/ZIUyewFP9gMalKtCHh1cJ+o5l
	 4juOMK7fxW9w749IXQDbBTtSnQml7JZVgZy9iIqSFDuQGZfhV/bR8O02z1ftBNKrQSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cVO0Vd4B;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4F9606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C4F9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cVO0Vd4B
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1659482f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793039848; x=1793644648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jz6PhmHAqHAHeg3j44XUyEwE6Xd1Y8uRjpXGP04iFfo=;
        b=cVO0Vd4BaAgLdWISFKSYTIzQtS1MXDzRDVaSVak7zkkNZEW5+3DDGPQvwc1ImtkYYv
         yINVsVjI2CegnkPDhWXYOUuK0LVB/YZkXr5B3/P3IPiOiJZJIigJ27grxIEVt/3yyQut
         ZSJET+gCiv1LI3fM9mA4LNQq2TpU1GcRnP2vBl0rVylFXi3tAN/d3tIzMVHBIDHwvLAB
         uKPpT+lxdnIlLVIDYzFiCi/RRIv5zkhBM5wKxZASjWoNLOQFYg6qGn3iPixYOhg9ky09
         qkkbmrA/P20ZQVk6g0ePZUg4pvAZxwDZNeS4oZAVcU7P0L8lHKDyCIb++tsiW4QABTip
         fXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039848; x=1793644648;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jz6PhmHAqHAHeg3j44XUyEwE6Xd1Y8uRjpXGP04iFfo=;
        b=fLQJn+j3z8DzoDl6U5740//2XctnrKfouq1a9peuJRg4Fn9NT72ONXABhGpNKBHEgh
         lI92enw3ek6SdHGPMt88KoD2boxX3NuLa3ps1vQH6h+BeKl1MVIwRXedP3Bz1ZIl+ea7
         OpRBqrNruW986kVnmqQQMSyUqimAa79qhB3x6JyLKmr1XyiSGGiPj3ml80QvkCC14giT
         RaQlnZBPv5o828038oOgblgenz5HQ+3oG6+AROwgIpe0k/5pNo/Pjx7+CP4gIylXZnw+
         8tCNtcIBszna6p+MV+1N9991EaUMk1NqPE06ZxQwxCmhTLak27hViEKdvgXiBHAaPU3e
         /Nyg==
X-Forwarded-Encrypted: i=1; AKwUvBxGmFT10DfAs5OWg75l6n+l3o9bEYINsfJ9ozrHCoAMALk9fFD0RSMqqkGVKViTP2tZES9PdukkIonDc3M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxB1bbN2ZZXEdFTHNyLpsCe1uxwa4u+pCBLwjvF+boX+Qc3ukD
	tJEGFkS/XkvQhpqMXHGwh8f6BFIAwZdGl+HTmTaRz8RlTC2B6bTkgKVJ
X-Gm-Gg: AYBFou2Czi/GDkEIXP/xASzBk7cdViSnqeDhPQDEpfXdH9mK53QWog9732CZp0HJc6k
	MFkcuqYXelTnGX90QnIU4lYoBgQsKIgAzJWZDKLooGEaYs/OiO+eJY8s5oE//FEbBnS0wbxRbWh
	Aj9d8PHMXphm6MIinD590DrBCrMkAGafYVpRRAGuAdSwR/4Q7J6r789J3csMmabq1Hd+F216yqY
	fRkDQytqHcFPJKrWX9Gal2MW/kmJo9TyhIenK/BVzF1EcU+owb9nvSXuPA2/8/YQ3GXNh2KmEM4
	bnuKUjRhuW34a8wRxI4+K7bKO68gbhWS+Mdsxf9C6fee6rw22esWZpnIbqAvHCFSLJ9l8ajKKUX
	Epj/GZUGLWMN2Ti+cdKI7b4T47vdMvfl48dgDrBATFCD3yIjodvyL3jSojvk0O5F6ZUbvefL6cD
	ZXJU4JHpWUyArP/L9WGGDYo+X+B8JbSBoxrCqXa70BcUK4hTddPuq7BbgBomWSeiRXGVzs/17qS
	ZV2wyQAzsmSV+HEbMPIzELi7+0azZVQtuiMlAg+LlG8v5HAGnEeVraLMdNyCNvpZX12scvFkBBq
	06El/bDjZjae4nFS
X-Received: by 2002:a05:600c:3e8c:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4a35acab6cdmr122544295e9.28.1793039847593;
        Mon, 26 Oct 2026 11:37:27 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5698f1sm211231605e9.8.2026.10.26.11.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:37:27 -0700 (PDT)
Date: Mon, 26 Oct 2026 18:37:26 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Dmitry Antipov <dmantipov@yandex.ru>,
 Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 14/21] leds: flash: Avoid divide-by-zero in
 led_clamp_align()
Message-ID: <20261026183726.30238d39@pumpkin>
In-Reply-To: <20261026173129.GF2195460@google.com>
References: <20261021123406.3163547-1-lee@kernel.org>
	<20261021123406.3163547-15-lee@kernel.org>
	<20261022220006.6e066670@pumpkin>
	<20261026173129.GF2195460@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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

On Mon, 26 Oct 2026 17:31:29 +0000
Lee Jones <lee@kernel.org> wrote:

> On Thu, 22 Oct 2026, David Laight wrote:
> 
> > On Wed, 21 Oct 2026 12:32:23 +0000
> > Lee Jones <lee@kernel.org> wrote:
> >   
> > > If a flash LED driver leaves a setting's step size as zero, writing to
> > > the corresponding sysfs attribute invokes led_clamp_align() and triggers
> > > an integer division by zero when aligning the offset to s->step.
> > > 
> > > Clamp s->val to [s->min, s->max] and return early when s->step is zero.
> > > 
> > > Fixes: 7aea8389a77a ("leds: Add LED Flash class extension to the LED subsystem")
> > > Closes: https://sashiko.dev/#/bug/linux-9d06d7fe-310b-4aee-8b16-0fb49550c287
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Lee Jones <lee@kernel.org>
> > > ---
> > >  drivers/leds/led-class-flash.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
> > > index 181dfd49c6ad..16b3b6b9365b 100644
> > > --- a/drivers/leds/led-class-flash.c
> > > +++ b/drivers/leds/led-class-flash.c
> > > @@ -375,6 +375,11 @@ static void led_clamp_align(struct led_flash_setting *s)
> > >  {
> > >  	u32 v, offset;
> > >  
> > > +	if (!s->step) {
> > > +		s->val = clamp(s->val, s->min, s->max);
> > > +		return;
> > > +	}  
> > 
> > Why not just:
> > 	u32 step = s->step ?: 1;
> > and then use step instead of s->step.  
> 
> I can see where you're coming from, but I don't think this is better.
> 
> With `step = 1`, the reader has to mentally trace `1 / 2 == 0` and `1 *
> (offset / 1) == offset` to see that it reduces to a plain clamp and the
> CPU still executes a redundant integer division.

That happens with a step of one anyway.
All my suggestion does is treat the unexpected 0 as being the same as 1
instead of optimising for it being zero.

David

> 
> IMHO, simple, easy-to-read, maintainable code wins out over clever code.
> 
> > > +
> > >  	v = s->val + s->step / 2;
> > >  	v = clamp(v, s->min, s->max);
> > >  	offset = v - s->min;  
> >   
> 

