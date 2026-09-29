Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EE83403EE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673371; cv=none; b=XRg2aZveAFZstNvJ/x+zAXDGGsfyw3DOZKA0SAZUzBBURS1R7jqkqnis6X6UxvQWPXMVWjTaxigAl0DKrfTuu7UvJSibrXstKf+E+O3/XI8SG8MGG6x342tzCB++NQrCMyFLtMARIXEj9/n5gsYuh5DbbynRid7WeSfXCatBL+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673371; c=relaxed/simple;
	bh=54EiX3+UdtxYRud7qzJ9Xdl7ocd3pBdmAA4FFSUhnKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=liRDFcKTvUOnVpVB6/o2xtk1d6crRkmtjQxuop2rWtDbVZo4gk9WFC6Ak9vVsL+GtFoFWRE7aLmRTSkR2jmL2NFRGrMnSZeQs1GMblh6sUfoFMfMU/vYdUU3Xbr10/94iRbQctAqhqCrkOfQx7hrr6qXLj+Z3CnbMhhHvDNr098=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPOrXwuL; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPOrXwuL"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-5309a20a55bso40612731cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790673363; x=1791278163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qauo8Xd0HQhFlQMJlGhHF2NW2UaNdyZCQsI5gccJOpE=;
        b=bPOrXwuLGnV1AP6FxwXwSIjgpFx7PhRAuFJTwjndEc7oDg1H8mpx/u30oYzYNOuVTC
         iFDPe4rEaAZTW9vBmSy1SJBAsv+4d2GFIm4wINvu3kxCUcv1Vzh92qYBWAeii0HjBUB+
         O262xS0UlAGnf1d4W6C6xGVyPbRDKOvBZRHLqwNarf/q2yHpSrQPuPPTTWjRYBqFhfXR
         uCLAlTOSgmurSeK00/Qr5Q/rou2MkjbJWtQ0F/3kjd3nNfdiarKfPyQXS3qGmsR2Xbvd
         d2JwjE1AtoFfHidXc5mO9bS3n3cQEOu+czwwzsQRg9+MwfaQduKlET9PwKMoG9f2TPS2
         ec0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790673363; x=1791278163;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qauo8Xd0HQhFlQMJlGhHF2NW2UaNdyZCQsI5gccJOpE=;
        b=pF4KiS5hU4KvpyL9UQ3zbZjQssqFQlCidiMFypPGx2RPJIgPJpCdurk6B3XqoQYDad
         fczzCxVoCacRgY0v6BCab/0YHwdb8llhAIB9QVTbH8PrDIrCjwSOerUaDNNTJBnGvMnz
         biot/8ACRxyLDc/70K1AXnEtl4Uz8h3PlUDOgMAMyuNZGY7X/X2RTgy7WcYoI9UFfyuu
         lfMT5NyzBOVCk2akZ0fYqiohAaBPD/6frAiS9ifnijGmhzLAkcsYXkv7TWw1P/GS3BQq
         Xz6C1AnDe0+r2NmN2ja7kYvlpAyZF08OUezT/Sc5v5R7wElDjRRwQgqqSXl6XU5Sk+QZ
         IpBQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8jGapbvp92UsCJy+Urb0GhH3F4yuwz7uD4nYFE/EtOEKjMMIFkj25+66Dn+uBuaQ5AAJXj3xBEJ36hOg=@vger.kernel.org
X-Gm-Message-State: AFuF++ldWfjY4KR957/qD2YNrvVpnmu6oxz8DA9520blSmmIHA2CMNJm
	DXGwEbSVfG2tspw2YTKmxSF5tsIEQZoCxL6NcXMYR1Ljf1PXUGkeTB9j
X-Gm-Gg: AYBFou0d0shG+qishgNwbbpSsh8zwluqA9hp9OU+LKcqeSs9piyyqevzQ+rrmXgRc/f
	2z4O20lTZUrsH8jwkhat4bSyAQHIMjqmvmTzAd2WU2TBD7vJ/BXauIbWnVt1IiXpbY2L/mxBVP4
	U6ybZuImcHXOve7rb6Q3/7GnJduNsTWa8phAl3o2sOf0fgqn38mixY5F6siPwWUrpFRvvcX9ySf
	NO5XSBqE07d1BtyLVMJ+2k0jL+R2XWveojxlYHxRbA8HwVaeauj4TlcwxAzV6n3aGC0zxIb+hfr
	FQJcafnnV5E6im6nHhxuxsY3h4H3DsuM6IEgkwbqpFQNW5t5Eiu2mInnmWlnLslv5zGni+u97Zs
	MyPAiGA9cclb/tYEsJ8lbLvO+21hxGtGQk2m7NPj8WPfxwGDDkheozgSaI4G4LH79Kcl7xW/Wu3
	a7XOWQBZs9udTusN2YEvWI+WfrLY3q0ezAsSx1Wr7DOsIiUWjmIReXDQkT8VTM3vPum3ZtlpZsm
	yl904M2Bk58yOsiWXGdko3WOs7nfXnIyYwuFlSSyV6W3fiZVKnzj2MYkaUnRHP6NGI5Zmwt3cRg
	hTw=
X-Received: by 2002:ac8:5945:0:b0:530:cc3c:c62d with SMTP id d75a77b69052e-5330b6cab33mr273215601cf.44.1790673363100;
        Tue, 29 Sep 2026 02:16:03 -0700 (PDT)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5332238c585sm83979351cf.20.2026.09.29.02.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:16:02 -0700 (PDT)
Date: Tue, 29 Sep 2026 04:15:56 -0500
From: Ming Lei <tom.leiming@gmail.com>
To: lirongqing <lirongqing@baidu.com>
Cc: Jens Axboe <axboe@kernel.dk>, Andreas Hindborg <a.hindborg@kernel.org>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ublk: use global index for reported zones
Message-ID: <aruBzOsvpYoWAO51@fedora-laptop>
References: <20260929070012.2325-1-lirongqing@baidu.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929070012.2325-1-lirongqing@baidu.com>

On Tue, Sep 29, 2026 at 03:00:12PM +0800, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
> 
> ublk_report_zones() may split a zone report into multiple requests when
> the number of zones exceeds the temporary buffer capacity. The index
> passed to disk_report_zone() must refer to the zone position in the
> whole report, rather than the position within the current request.
> 
> Currently, the per-request loop index is used as the callback index,
> causing each chunk after the first one to restart from zero. This can
> make userspace callbacks receive duplicate zone indices and may result
> in blk_revalidate_disk_zones() updating incorrect entries in its zone
> state array.
> 
> Use the number of zones already reported as the base index for each
> request so that zone indices remain continuous across all chunks.
> 
> Fixes: 29802d7ca33b ("ublk: enable zoned storage support")
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> ---
>  drivers/block/ublk_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
> index 66eb55e..007e703 100644
> --- a/drivers/block/ublk_drv.c
> +++ b/drivers/block/ublk_drv.c
> @@ -649,6 +649,7 @@ static int ublk_report_zones(struct gendisk *disk, sector_t sector,
>  		unsigned int remaining_zones = nr_zones - done_zones;
>  		unsigned int zones_in_request =
>  			min_t(unsigned int, remaining_zones, max_zones_per_request);
> +		unsigned int batch_start = done_zones;
>  		struct request *req;
>  		struct ublk_zoned_report_desc desc;
>  		blk_status_t status;
> @@ -687,7 +688,7 @@ static int ublk_report_zones(struct gendisk *disk, sector_t sector,
>  			if (!zone->len)
>  				break;
>  
> -			ret = disk_report_zone(disk, zone, i, args);
> +			ret = disk_report_zone(disk, zone, batch_start + i, args);

`done_zones` can be passed directly, then we can save one local variable,
otherwise, this patch looks fine:

Reviewed-by: Ming Lei <tom.leiming@gmail.com>


Thanks,
Ming
