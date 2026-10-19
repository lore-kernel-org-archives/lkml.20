Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792447300;
	b=l024r08jDk8Q6vUlSxn4ZqrYrICDsaTVPYMrGdGk7SvQJPyNrh9U4DyHilvtS0+4SnA8
	 se9Aii8ctCmcki8I3EBsS+uRcHeG7LNO7x+bRdXjkZ+vL+5QO3Eoqg5K2BYZRTCfwkq69
	 7mB6CCT2Brl345YYKErOgwyjtvX7AVlPFEmKlCfX0i/6rv1OrktfWITYZeHcTtcxTVQ67
	 /a4PRtnfcYkzZ3Y+ZJasp65wAsGWyddmXOcq9YIpOqIFPX2QCsh+15BzU7qUFokIvZD3r
	 fx4B+Uq4kbWZpNzGwkex/pOrFdCKWTH3pCTMaLmbpZ8ogPl7LM77uXjdGMd62O3fv9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447300;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=AWJhnEGj4T5w1sdmz82kxt5blTS0qkMiSy1O4lqtOrs=;
	b=pMyrtoJfqrZgm6TqjQ+5V/RsrAGeako9ukCYzMt1OzKJ5Kh78pfbEQxZ6p8qVqWvcvrt
	 ouru9o/viVaWDQg9XExTArtIn9HeY03di1jZrA0+QIOMwobUUPAJJYxLemdeKkfj66X2g
	 AUA+XWcU8NI7GEr0jVOOmVK+QKfXdzD3GO6vAU0mFCZ2SGGqecPINvfRPFhnOIZTxqBXP
	 /2xbFPeA5/h0WhTRrmPeeXARiivYK4MybYmZ82XkGXbPcYdldt3io3NLW4YAh5M5dx2VP
	 fYMJ6CmMrgJ42IMiHVhQ7wOQ+huI0YWAqJmBk6WNfDjWyc/eLxpQWKW2Ry/ePhDzkkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="OR/0dXhi";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ORZWuZVT;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB52D606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB52D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OR/0dXhi;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ORZWuZVT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792447298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AWJhnEGj4T5w1sdmz82kxt5blTS0qkMiSy1O4lqtOrs=;
	b=OR/0dXhiY2058uENvA+Ya+ZH8RB2VkcvgTtAJNfY3p8tBddfEkb+ApmQIYtEYOrmV6Y6qt
	fb6/BvErU1LQ/OzJmzrFYfnGd+bYh6ES+eIL0KiDRIxEKxuXYEuY8faSRbKXMj3Om/xj5B
	GOZgSZvk+xDgu0Ni+hh/xnp++FmEk4w=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-ulzeei08PE2bUXHGt_ACIQ-1; Mon, 19 Oct 2026 18:01:37 -0400
X-MC-Unique: ulzeei08PE2bUXHGt_ACIQ-1
X-Mimecast-MFC-AGG-ID: ulzeei08PE2bUXHGt_ACIQ_1792447297
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91bcd0247edso48516356d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792447296; x=1793052096; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AWJhnEGj4T5w1sdmz82kxt5blTS0qkMiSy1O4lqtOrs=;
        b=ORZWuZVTtANmn+OtHJ3hKZ/auiJpW2h5hg1FVFxfAmLXhW0vOETs+raljIoR0IWtn5
         qbv3IIuT+Ncm1Q82UfvjDSuWUUtICZvJ+g+xnb33lxCTlPsy5jJh+4DZFcmU86N6sdmD
         x7iDf+OSLbSUSpeZbgddV9TzohkX6CQEeqLJl5/9tWnxE3jJIP50xDOvNB57XSSKN5My
         xuKKtevlwY812o/A24U2Z3T0kJJG4UZGrfQr+VyNbPmVvfsnr/+jtqYx6eeCZNg43l2O
         wPkqy0pzZjxtlsunU2tVXuczuDTNwwMxlTiD/h4CKXs7ZdqCTvJIXEO/c3iZEkrloTEw
         d+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792447296; x=1793052096;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AWJhnEGj4T5w1sdmz82kxt5blTS0qkMiSy1O4lqtOrs=;
        b=iUipRpgnlRI6DXIe12zvO5rrw9PGunCxW2nbH52NwCFRXFa8pA5SlCDZ+DWEKarvxF
         Ckfq3SEkokwCfM5nrKS4aZIDHj3cwU99vs+uokl13rHhskABmwC5m5kb66kLutWcWiVa
         Io8iigg8QQsxhAnpPAb8KGemtVULqE87xW6WRTUemrRnx02f7kge97Z4z0oSQqd1sb2k
         FOxjgP/mHz64ZORoxjbBdjdqhFpbwlzvJFquIyjLsOsDRCDhwm10mJhgl6AupWw6tQlj
         J1k3N3HzyhMin5eThldEFT4KI1hWiqnaAVBdBZGQF1uxlJjl8x9IkIVuVRFDpwBNgLFC
         nQrg==
X-Forwarded-Encrypted: i=1; AKwUvBwWYovCLnUj7ic0FI3ZpZa2inZo1HZ2PkZ9o7336b+TRpkt9jAH2sYnE8mGVRMF7EDBh5KqaSyruM99n0w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZFYtdr1h7L/hPVY+12ZlYY7DVXe86FUy8uBeAthc2E/NW6FdA
	p8ivvEm/i/fJC3UbG51fH5SB5YEai9QZyMKUVLzLN6l6nXvIaNaVb3BGK1HoiVSV4usot5ZTuEV
	bhquVNNPb7kOVUjmqsuhnlgOcuODcE0Z+opTZYe1nCuq7mzS3I1QZeOegky29/tbqwg==
X-Gm-Gg: AYBFou3WBhL0euPxSrPHzrjB4OKIHmyhb8XFcoUbSBT+T2IERoK/RXVK1g6Yi/yGWxH
	b6KhzsDfTj/8fxSUy7ZmgXF2QP6ndql+9Aw74+RNlzJB67Kz+IlH5jP2P7AyVnfoeDOfaa5GHuf
	Zjjc890MmkrP833/c9ZfdaQe2/bmNsC+aZMQ8+QVOmVeQEYNUL7Er3Nt0x5hlrERyZ+lfXBfoP/
	rGiiYoQW5VitEY7q/UMTrthug9B8TI4BGS67kTUHfO7JiV2Yu5+A6Va4b3E+KIVopBObo2KSLj6
	XTc8EJg5rKHksfpuIIR/fNhDVHgv5FYB4UKJwGOH6GOFtp89ETutIzYe0k8IyqbC2OQqR/4Jrq7
	5STmln5uqClksltigckyE/H0lEGA=
X-Received: by 2002:a05:6214:62d0:20b0:91b:ec1d:173b with SMTP id 6a1803df08f44-91bec1d17f8mr77943506d6.43.1792447296594;
        Mon, 19 Oct 2026 15:01:36 -0700 (PDT)
X-Received: by 2002:a05:6214:62d0:20b0:91b:ec1d:173b with SMTP id 6a1803df08f44-91bec1d17f8mr77943046d6.43.1792447296057;
        Mon, 19 Oct 2026 15:01:36 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c040da11bsm7375906d6.35.2026.10.19.15.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 15:01:35 -0700 (PDT)
Date: Mon, 19 Oct 2026 18:01:34 -0400
From: Brian Masney <bmasney@redhat.com>
To: Xincheng Ji <jixincheng@ultrarisc.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>
Subject: Re: [PATCH v2] clk: ultrarisc: Register DP1000 clock provider earlier
Message-ID: <ataTPiXwPV9n7PAx@redhat.com>
References: <20261014-ultrarisc-clock-fix-v2-1-bd126723a42c@ultrarisc.com>
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
In-Reply-To: <20261014-ultrarisc-clock-fix-v2-1-bd126723a42c@ultrarisc.com>
User-Agent: Mutt/2.4.2 (2026-08-30)

On Wed, Oct 14, 2026 at 11:20:12AM +0800, Xincheng Ji wrote:
> From: Jia Wang <wangjia@ultrarisc.com>
> 
> The DP1000 PCIe and clock drivers both register at the device initcall
> level. Since the PCIe driver is linked first, its probe runs before the
> clock provider is available and defers.
> 
> sysfb_init() runs at the same initcall level before deferred probes are
> retried. It claims the firmware framebuffer aperture, so the later PCIe
> host probe cannot allocate the overlapping prefetchable window and the
> GPU is not enumerated.
> 
> Use subsys_platform_driver() to register the clock provider at the
> subsys_initcall level when built in so PCIe host probing completes before
> sysfb_init(). The helper keeps the normal module init and exit paths when
> the driver is built as a module.
> 
> Fixes: 3948a36be42b ("clk: ultrarisc: Add DP1000 clock driver")
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> Signed-off-by: Xincheng Ji <jixincheng@ultrarisc.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

So we are going to hold off on sending this in for v7.4, and I'll merge 
this into clk-next once rc1 comes out in a few weeks. My series for
subsys_platform_driver() was merged through the qcom clk tree, which is
in the clk-qcom branch. With the way we do branching the clk tree won't
stay bisectable if I merge this through clk-pile.

This shouldn't cause any issues other than a slower boot. If it's
causing other issues, then that's a separate issue that also needs to be
fixed.

Brian

