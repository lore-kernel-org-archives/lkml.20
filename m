Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984550;
	b=w0ygoe9TEnXH00Qs/y+ijrsq+ic6YqXWsIaPEuwkdSAH0btZ1pVOH8fYosCfVMsWnsES
	 tJf1nPpUVY3tFDaa9Ic7ZgmO61kepnRSJreQFKOjF8fMlGtgtfz3ESMZUbfaPRba4/2OK
	 aYu3OIn94dty0QuthxuMj+mo5tksqI//Y5fjAodHRBSycZf7nwpDx31M4a3TSaWYz1fai
	 bbMvYb+4doucIrDXB29un5RgQyAJHe8Wf6oWSR4UCeXXdSCZ9u+FGsqilkexYlnrwmwRP
	 lllYRE2wugWkTje2LK9TRf8ozIxLTyZO+N5mijkOvd/HUsjf38uDRRhO8pIfkCl2rCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/qZTKeMtYLlan9SFU3DlCAiu7yexd3IDtiotPT8o4LQ=;
	b=1LIqoPGWwecs9So6KDpQX/sY9Gag2kNnCinvUMzSKgIzMok21Iq+UeUtwad64G190QwB
	 vQ4i4aoqg3dGIpNe0rVdGCVuO2SVewqOsjUzfuBY1js5oTqecgL4YW/5MBqTQdR3YwJw2
	 MdilSnQHmy5jnNnCJAm3dbnpsdn7NaEP+L7oSCYlafFuCqbunYOAgWFf4j2qTszTN7v4i
	 Fn20CNR0xfjgjJFR/BOCVUrm5dlXOqGLLRdcJMa6qNk10FQAUwNTvlqnm4eKYkYdMl5kV
	 oOo3ZqOoA1YY3MekxiaTVeoa9zJ1QXAFN3E4zxV9JI3PoIi36opV1lSNz3nUGQJI7AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=la2KYYkN;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329CA606A338
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 329CA606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=la2KYYkN
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91eb53957cbso4923286d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793984549; x=1794589349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/qZTKeMtYLlan9SFU3DlCAiu7yexd3IDtiotPT8o4LQ=;
        b=la2KYYkNdIoMoc6wEeIb+LbDPl6uyQUQpIfVl89pwSwtrSGbFTunXRL/lFB0HHbGhI
         X376hmYEScQTcKJwZUtZ+vdZ6Pgc1ld83KsGwkwClcMPZDjj0fvJqCldasPof/eBi7Bm
         uwEP/FyxQb4B/rn/PbVrDW4ujFfjzM0lVu8BohuxO92lUqF2l2AE4LyG+ZlcCEmUCNZx
         3K99FJipn354A0jE7JlMSh7Cyn7axTGVKg1/J1Y9kw3oHDr+IWgH//MoxGF2e8ZscCod
         nk37zD8oIoHkQV1sCfMDQSOolbvj6V20gRh0gyETflKTVOMZWIbzQqGB565HVcjZ/fyR
         z1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984549; x=1794589349;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qZTKeMtYLlan9SFU3DlCAiu7yexd3IDtiotPT8o4LQ=;
        b=ulwqhRiXPfeqyEVQ3jKx23/+nFBxpbgr++A+vq0FSZHE2sQFeHOjnUCn3OQfiMcXJ+
         9SXw+GZD229pvzwk3ftRB5QVxUABbo/LP9hSRH3lKHDmiKou74h52U9T9C7T+g6h0JqQ
         sTzU0c0sdcTCRKxON25hqxfuJGaSh0wpRfj4sssLmMFmtB+SFKOsR+noFY2pzCWNfJeo
         PgzD5ruJJRvBHs9CDVaLvCAmqy4yTsnf7hEsR2R26pYW3zipfdH6keNiweAV3NxDiRCV
         PuPsuKhTi2DAnpi/mJ30F6O53DnldXPQZpNLiLFQT99KDM9YtYRS2t50g+abRWtB8G7X
         SOFg==
X-Forwarded-Encrypted: i=1; AL+hErEZTxVoI9WKVLB0MQpi8eiYtOz4IUvYU6OM+S93sVavOyjUz4MayVxZyq0PbuO6KQ2/dO03WAcjOMEN8MM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8t1t800P6JM+qq8UudTTKWsTuz8s1RXqT2l3SoxfFlxtpAWKfb
	yBOixfa8gUSuxEWjJ65gzfHhPFLaFwMQreHbuK8THz13vLYYQpxA8XujNP0RcewxMQ==
X-Gm-Gg: AYBFou1T5vp9zjdSs/p3fC6peHpcIwliXgBNldEE+mQLj7FVMIhRwFCYyHPwX587Ayh
	T4U185Hy+nKJWQIiINq+IQVKkteqfCQ6iMU6//u+JcDgZigmmjjeN6OG73b1UwFw5FVnsEF860Y
	YdKxzE3sfj+PPNSsvyUVTEoHBs/d4MuVrJjODtGsaEPIw+F4mcO5n//3YgUp6RuN+8V9F2vwtBP
	kXHOGXpSTWeJQJZLqFCCjyDk0D6aww/HG4vahKbPNyPYBzWyuo61QEHQ7mh+S/60+CrMDv7QtBX
	kWIAYjDdVp/eliEdEDmQq8oEMltx/8ZRz/xhcOTB8qQdfrxQ3uGasnx/qnfBJ6vfd7TnJZfqt1z
	6Di7ma8KZxuLqPLOBVUHQCJcCQ1YGNHxayRPxCH2IrucoAr8tLK+oP4Yd9OI4bSPVzKL0XpSTkR
	GX3t/4LgdkcmzBoEqbWpi6EzeU28uc8YgGKCWpeBSOSOjLkSeFHTZBBRR25rof5cE+JVALNqvAR
	YGw502yosNc0JaxxHcar+1t6T44PsCNRM0C0AyTIEf+T7jIDxechzS4OeEToqCQEGZxskgOGzfC
	PBtEBoM7GNms+hkMVPv4aI6zxy5b
X-Received: by 2002:ad4:5dc8:0:b0:91e:9463:7194 with SMTP id 6a1803df08f44-91ea96643b4mr48110016d6.24.1793984548922;
        Fri, 06 Nov 2026 09:02:28 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6aa7a97sm24230156d6.35.2026.11.06.09.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:02:28 -0800 (PST)
Date: Fri, 6 Nov 2026 12:02:25 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: James Clark <jjc@jclark.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v4 1/2] usb: core: export the generic device driver's
 operations
Message-ID: <c267f8af-78eb-43b5-b6f8-98af6749db22@rowland.harvard.edu>
References: <cover.1793941292.git.jjc@jclark.com>
 <c1fdf2ed4c508b08734c7a9de002336f60d3b865.1793941292.git.jjc@jclark.com>
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
In-Reply-To: <c1fdf2ed4c508b08734c7a9de002336f60d3b865.1793941292.git.jjc@jclark.com>

On Fri, Nov 06, 2026 at 01:12:50PM +0700, James Clark wrote:
> Export usb_generic_driver_probe(), usb_generic_driver_disconnect(),
> usb_generic_driver_suspend() and usb_generic_driver_resume(), and move
> their declarations to include/linux/usb.h. This lets a driver whose
> probe may return -EPROBE_DEFER leave generic_subclass unset and call
> them itself, so that it can defer before the device is configured.
> 
> Say in the generic_subclass kerneldoc not to set it in that case.
> 
> Signed-off-by: James Clark <jjc@jclark.com>
> ---

It's ironic that the generic_subclass thing was added to support 
onboard_usb_dev, after some debate about whether it would be better just 
to export the generic callbacks.  Now you're going to implement the 
alternative solution for onboard_usb_dev, while other drivers continue 
to use generic_subclass.

Oh well, I guess there's nothing wrong with having two ways to do it.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

