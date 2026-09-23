Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506B65349AB
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172235; cv=none; b=A4BY0aKoqGN1nnQi8S40Glt7uyIf4kqjkjzFeZD+FQ7gfR9JPfGzjH1w0D0FT7y/gr5LYt9irEnvihdnWo6Y5fbmGvdZUmpAM8zkY3EtAJSnKqDJNY9YtxJEYymXph/JLIgvK0Lwet98GmQmLiARrYtRrejJmB6NV6tbKWxORrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172235; c=relaxed/simple;
	bh=9q391VKyrgHT6qszCFMUgGDC47v5hjd4HT9m5JS3rPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBeK3MT6y41ecUOrovBvToLr4C5RUx+uPDZn3LTzdEE2wtLRYlyAQl10EPJaUBN8s4gMPPUnu11IpzlkMQYSbn0YsM1SjacnZIFYKrSvfcSypW16NR4rRGwFOj36242M9MV8Fs7A28GT4kEC6XVXQ/JXOzxUE4bcyu7feAR1iYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=smgCyaGI; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="smgCyaGI"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab201ecso907766d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1790172233; x=1790777033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O8GDqeaFB8Q+FfdtS26+rNDrl8uoHCxOndehazUS46g=;
        b=smgCyaGIdhX4OEbYwYAJxVyog57VjX7c67tiE8kNWEwxgXRV7bA958tmCX0wufbaHv
         zPncSL/E0YloNfTAMN/Y96wRvz+EkCPtwuoXlu7Djti6ds/H4FlY1EfmLjtqkiJg9bUb
         nS/8vFIF4GtlZUbF+El1WDh55LbFk4fMjqZ0AYKVwx3opRBkKkljb3EBRkkxClbuOR+M
         beDFIlkWIxMI25bjwuJxYba4ioppe2CWZOgOpKCkgc7h8nU7g/P5OhUPwowMb3zqjiLb
         1K24ROXFW+f2ySFMmsrw9Y3mT3DdMKsF946EizNDn2fO7ov8LagCwDUe+Cfwk8mk+oR0
         Ckzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790172233; x=1790777033;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O8GDqeaFB8Q+FfdtS26+rNDrl8uoHCxOndehazUS46g=;
        b=x9YQru6c/VDaZ8FOsa+ze983c9Ml5d+ndhZuFfm3lRmcArrWl1EX3R/gNL71ZIVwOL
         xim4HdbC5UlM08tb3ARLNiBpI4Vas1sjGQpFWhEH4NkrJ35EYaBIsY7Xg3ADUaWi0rkp
         //+nCcd6kcWnR+kgSTmZ/9pr+otOJdsSwQLeeWSD4LG+zSh5MLe4Nyrq5Y1Z9mw4PeD+
         6Z1Ojd3j6Omiln6u4W3MgW88ZmZynWsK3uoJ5PBwCem2IKEThnrG/a62OrfT293FbU92
         8WxSxVQmJY2iQranOsC7w8fZF2/rJr7uSDHo0iX3envEQT2jEsZ6hzKjIlGMD3thMFFb
         T2NQ==
X-Forwarded-Encrypted: i=1; AKwUvBzor3EwqBu+L3DbisvyzdeYSMXRtswGmnFIgaWdA+NcQnQiNepKnVC9MK0OVdY0ylP3hluib5CbrZZmr/w=@vger.kernel.org
X-Gm-Message-State: AFuF++lbzShD4D/zepyzxqRVZH8ySdvoObmXTzYWDiL80zPUeJfd5ish
	QVC6u6ogHpPxYFike/fc6K2eH0flC6UPHllFi9mnNrRORNjh02CyP1dMCGwIA8+/6nCbQwEL5x+
	wJ5NGpw==
X-Gm-Gg: AYBFou2RU5Wo5gxfpBArW+FPl/z9qbOkG6u2+shgWKfBPhmbc/XFu+uM6pGygl6mwrU
	Cp/H9ifKJZlozks/Cg87CWf65EYbbz62yPYlTmHKUvyaKk8bzt/nVTzKn+C7OTf4gm34edVjJTA
	VdL1GWCHm0vBGgleW7Ond3yVoe9CBUDN8h+zjYcxivmNP85b1mgZBtXYsiAb9j04bmiiDwvucGw
	R5j9oNDEEaKKksshO6VGyz67tyRMDdi2r6ZQe4h9oTU23wJnts/I4aigOtgT+3yrWVBsnTquRi9
	UB/cuCRnp7faa0bG/scgNefNjN64O+czOyTVlDlwMjfJpglWAAAlkR3RLYx50BtL2w51XK14D+Y
	4YdQpjW35S6/vVb3Jrly1fFU59l6IlJfp9OIucwsinxRHSHWrfANzl2NtLY3TocloxCfbzlGVDB
	fAKnoXOWxXoE2TNYPgje53OCWl7G1jQvdtidMjHbsHyzNFQMNhwDAzRtw/rD2Vg4YlYN/Jij8hT
	ZN0TfSfx9JNAsKOD7+0rpE2vmA=
X-Received: by 2002:a05:690e:454a:10b0:672:d1ab:ff7f with SMTP id 956f58d0204a3-672d58eaf8amr850998d50.103.1790172232955;
        Wed, 23 Sep 2026 07:03:52 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140c448ec5sm20737976d6.33.2026.09.23.07.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:03:52 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:03:50 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Ginger Li <ginger.jzllee@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: core: Fix unlocked hcd->status_urb access in
 usb_hcd_poll_rh_status()
Message-ID: <56dbfcfe-1945-4335-b46c-bb2388e4dbb1@rowland.harvard.edu>
References: <20260923083828.64925-1-ginger.jzllee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923083828.64925-1-ginger.jzllee@gmail.com>

On Wed, Sep 23, 2026 at 04:38:28PM +0800, Ginger Li wrote:
> usb_hcd_poll_rh_status() tests hcd->status_urb without holding
> hcd_root_hub_lock, while rh_queue_status() and the completion path inside
> usb_hcd_poll_rh_status() itself update that field under the lock.
> 
> Take hcd_root_hub_lock around the early bail-out check so that the read is
> serialized with the writers.

Why does the read need to be serialized with the writers?  What problems 
does lack of serialization cause?

Alan Stern

> Fixes: d5926ae7a827 ("[PATCH] usbcore support for root-hub IRQ instead of polling")
> Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
> ---
>  drivers/usb/core/hcd.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -727,8 +727,13 @@ void usb_hcd_poll_rh_status(struct usb_hcd *hcd)
>  
>  	if (unlikely(!hcd->rh_pollable))
>  		return;
> -	if (!hcd->uses_new_polling && !hcd->status_urb)
> +
> +	spin_lock_irqsave(&hcd_root_hub_lock, flags);
> +	if (!hcd->uses_new_polling && !hcd->status_urb) {
> +		spin_unlock_irqrestore(&hcd_root_hub_lock, flags);
>  		return;
> +	}
> +	spin_unlock_irqrestore(&hcd_root_hub_lock, flags);
>  
>  	length = hcd->driver->hub_status_data(hcd, buffer);
>  	if (length > 0) {
> -- 
> 2.43.0
> 
> 
