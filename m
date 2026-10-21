Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603018;
	b=p9SEuY9iG04AOEchIuFbtKZ+3v0ttNEhqhDWBkRTlLwbs5r/o3IRfHPCJb/a5+DxRT8p
	 HL8dhP5zxZ+1lJMZiasy5ymIrMbmgigKI8oRCSQ1QANRLLdQcQ5BSSmefkkmuEVUZ0y5x
	 5jlRc6KNqMaputT//2BjYN3mcemT3Zz0G7M7HiLZDpChj40vZWqGKcpuG9WFf3BH9O9S1
	 3b/03fZAhA+5r48H2S1uLDm3XEZ6QZoLg/5Iaf0M3DwT1Hhu0Xyr7HlaYN3oOanVSBTeG
	 BvNUirIFM2JIWYY5DMDtkd2vU8j+9VCagRNUjWYuP3WViBoIAIPi/9PqrGMh7guIMxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0uGVdqw1cUG+jYneBUBB2quro9jHiY9dYgBcdfEkjcA=;
	b=Gd0nzj9HxZEGozoh0gjChW8fBVHe/PFb/If6fY/FwDW1UI2jqYxF2rVMBarqPqOMOIcb
	 bOrAUVZoOxdF8pEIAHeCTozpwiJ3SdckqlINixANBg2b3hSFKwb4SQSVP/YZns0s+iQgZ
	 RsviAYp2RWX6s31MVO3e555B1wLzRmzoauhouIjmTa+1/Ab/FEifDrUbCrgHnYMw9jlwl
	 syqNjN2Z5dL8ig5fvYdWSOuXYvNbliYS7l939jfBRcVCkTAvmzlckrliK/+RX8scSzF0P
	 rERStI+4WXNCS5aJccLK7RCkDtv1LCzbM0EWbg56oabLnq8USgJ6wkaV83FgJ7qmq/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VqghTt76;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76205606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76205606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VqghTt76
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3550c917fd3so1256058eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792603018; x=1793207818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0uGVdqw1cUG+jYneBUBB2quro9jHiY9dYgBcdfEkjcA=;
        b=VqghTt76eLCzZfFRs5YNUaWU0L5lTwxAo46eI6Pcn74RJ4HgqlH69DnhvW4FmZPy0G
         4wwK5gFOYgQ5uGSkmou4UM5hp4NJ9gLjsRZ08qUXnl6enMzjB53lD6Fh53+IVWG2brPk
         OS8qF7DybBDwxXj3RSvWYFF/Q3Syk8wimdEaqQsa79j4iswWbDCADR+irlcPTTJj741q
         TVaOiZL5i+vK5mBAhOdFuEc6QxwXZ5ReTdrPSIgggtt20B/fLXL9cGEI/JkSawRFyW2W
         SmwA6WdG02pewUKBMtQk/G5qK6i2z0M7gEIlp0inHn0H93KLvXpwur74t98nBkNU5WP9
         GTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792603018; x=1793207818;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0uGVdqw1cUG+jYneBUBB2quro9jHiY9dYgBcdfEkjcA=;
        b=Z3kYDgC8mbfVr0NL5BZqs4M2gQOFKFyHCEN9h+SBmuTVFejMxRZ9RHHShb5bB0SHIi
         d8VNF6FXQKFBGTNy754YynwtfEAZalOY6/TyiC5g/otTYXmbyDpw/OPKf4zr4ERWY1QX
         ZLx3W/3YzGokbZBeKRsaMXKfg6ftdqdcEIT3d7/DWwL+qS5A7GL6qRXICLFci/6hoYBt
         UQItpoqiEv7fhbTPevvbLg6mNv3NUo33zm4+e9WNjlgs8pCx1oJBPNlRaBeu45DK07jB
         +bwM33AkAOzSdiepSvPQKScbM7PtGpbjIZGyocFfFlWZwLLjgEIRyCTLAweU4BreIKnj
         pH9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxlDEIy9Pb4LikuJSovmKcIZXAh6439RWBl0pMcDnm0ASDbQMg5tADrXJC+QxT8Pq03S9PYprrb4Zt7zmQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7qOAqCcLZlCB76wiVMKw/7Db9hw1qsWNJgKhwBLRLz0fIaDW7
	iu22UYHFrCFSDZ2Qj61toeOYz7itVEVncWK4S60YOC+wkGprcKM6FflD
X-Gm-Gg: AYBFou0KX/pX3ohiKO8xjZ4b4iUL9WQTxLqxaFa5VhuZ/lwN2Ot0R8kZkgBqxM6r5Gj
	DUbj/bNPrsmLWuWf5E0xyZLr948P08VBbtE0mLIqZYhLzRSGkstoa8fifYem2DFBUVxG2QlUn+6
	OqBp3JXTHEwCHBdQACaIvNOBHTFF/aqB/0j5gRHGw6pJBP7w2A+eWVh+sJqvro3WnTjrQOVvxy5
	w0z3mcFt5UsPWjsDQHXBWkTySaB2UlEOwX/AnVlLX+DIJQgvdYapftaJRgSZCpZ+75Jz4dlVQRa
	bUP4fIUKa6KIbqJSiAZIjmmtOSNfWXwFj32VBS2oGQPopqSTtE+kxG9DaSzue4MW2l9aDiBxpdc
	z4UyPkoWwiqIL9uOqKE3xlUeoEsP0OOLwECmK5Is/k0QrIpv/XPYMCzDgoOWrn3gfYraQGP9Hn3
	t/t6yI7TXKUxC6ggbiqloRWdJmuH18nZxWBljf+ZRPtZYHB9bG2LrFQ9mkxWDxnoaXajXQ2GS3o
	rU2QfbiDYwMArsIDefeWHkG+8gXvPv49Rfs1gJalVR2tDfDG2U7Tgrj+ayAfeSSiLWNm9XvrNHU
	6pFIjRX/ovqpi23+Xder90CQgxbDAzQIttdkQGVNFg4=
X-Received: by 2002:a05:693c:8345:b0:367:68c:860d with SMTP id 5a478bee46e88-3674d65d2e0mr3958768eec.29.1792603017470;
        Wed, 21 Oct 2026 10:16:57 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:92d1:8038:c4e7:1f0c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cca3d8sm8748248eec.14.2026.10.21.10.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:16:56 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:16:53 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-input@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH 3/3] Input: soc_button_array - convert to software nodes
Message-ID: <atjzUS_zdVf_2KzV@google.com>
References: <20261021015004.1537738-1-dmitry.torokhov@gmail.com>
 <20261021015004.1537738-3-dmitry.torokhov@gmail.com>
 <CAMRc=MfZg36BULXh3n-ce_x_4B_xOn3Jp4Jgo5BN1LsB2FqaTw@mail.gmail.com>
 <atjuDNi0_SXs4y2d@google.com>
 <9496ea3b-563f-4517-86d6-e20694e2ec9b@app.fastmail.com>
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
In-Reply-To: <9496ea3b-563f-4517-86d6-e20694e2ec9b@app.fastmail.com>

On Wed, Oct 21, 2026 at 07:02:32PM +0200, Arnd Bergmann wrote:
> On Wed, Oct 21, 2026, at 18:56, Dmitry Torokhov wrote:
> > On Wed, Oct 21, 2026 at 05:11:32AM -0500, Bartosz Golaszewski wrote:
> >> >
> >> > -	*gpio_ret = desc_to_gpio(desc);
> >> > +	gdev = gpiod_to_gpio_device(desc);
> >> > +	fwnode = dev_fwnode(gpio_device_to_device(gdev));
> >> > +	if (!fwnode) {
> >> > +		gpiod_put(desc);
> >> > +		return -ENODEV;
> >> > +	}
> >> > +
> >> > +	*gpio_ref = SOFTWARE_NODE_REFERENCE(fwnode, gpiod_hwgpio(desc),
> >> > +					    active_low ? GPIO_ACTIVE_LOW :
> >> > +							 GPIO_ACTIVE_HIGH);
> >> 
> >> Sigh... I hate it and it looks hacky but I also don't have a better idea. :(
> >
> > Thanks, that is quite common reaction to the code I write ;)
> 
> When I looked at this one in the past, the only other idea I had was to
> completely separate it from the regular gpio_keys driver and just make
> it a separate input driver. I think that would make this driver a bit
> cleaner, but it would also require a bit of code duplication and I
> can't tell if that is worth it.

Yes, I had the same idea and tried doing this. And pretty much ended
duplicating gpio-keys in soc-button-array...

Thanks.

-- 
Dmitry
