Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911020;
	b=3Rinn/uwcTPmko5KGbAAm/e65UPFA4jKIKA+rnzIdldVRmZCsB3hGN5ugBuDaNA8PL0M
	 QU+6B+a6LasZbvcXfaNQZPj1aflrbjxvCuwxWFwNyX1tSmO4XZYzHysyI8AML0nVkfCMi
	 dkHcEHD0DgR0RJoY76eLtSS9UsHiH394Hw4Duu5ovzaba7QKYUPA/rTkqlrff/gocRaUv
	 CDZdUOLihWj2QKiFzu557h0bAUwFQreJr97auopyt6skhOriyWADIHL5aT/w1qvf8FMh9
	 ON9kKTSzeFm7hLZWCIx5iqXuL66REPc5voahXzhm0SWXk5rDS4+xTTuWw8puUNs3Z9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PFVwgOT0aaLDOnm5OSGliikQrCnjG+mZrD4LikZIekA=;
	b=R9YYhC0HiPuGgFjkLCK4a7+829Snt/zGi0Q8yqKJmdCsVAMHE91EZTsG0Ohafoe94Xrq
	 Ml4jga/HqnXv/B6/Qwq+rif8uQEWTRyP/zD8u0/0g1Shu6AFutgpiyJ8+nqDJmGhjntqS
	 fT8CnPDfnauODTok8VrepcnF+H/q9bTBPCihaMvnYodf71TvsFfD3O0G77QXyXXf8PVPs
	 sQVIkhCY5Kn6waenUkf7cADqOTWXg2knkdK3XxgLuXzasLeDQV8NNDR/ifUM2FBi8Io6k
	 jyg9vfODSZano9O1JdUUcVx/2pcOe+fdzL+Ryea9o6l35UclYgg1z0U4B/2DTlzv9CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=KmzNHtuU;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94E66082BFC
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B94E66082BFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=KmzNHtuU
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91befbcad6dso27320096d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793911019; x=1794515819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PFVwgOT0aaLDOnm5OSGliikQrCnjG+mZrD4LikZIekA=;
        b=KmzNHtuUX8Ya2RZyRfBrsMJNEt7z3jGi4SdMZMBxLWz2jq6lix7tObxwB0c1r6q8RG
         9mq6s/0r+LL3f5T18APQI9pk2QXhd118SbxDM45YfPUbmU4k97Ng4XHOv4CHvqKGWBCf
         2nOpLV1VKyKrFDpUgSaUz1V93hunTlAIvjn4cwKB1OKrXqCpJXlvZkTfC4BYcw2JCZ14
         MaE9ug0YTPlUDpL5xXhkR/Ec0oMIDZWIoXitM/P8VENwCUGXcXxAZVUaVQ9cSwzZ+R5R
         J0MlFUW8HhRdEScTFgsflZCkops+tNVhEyaviEEMMkVrYcaymEi9zZkpNnozn9UAQm68
         rj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911019; x=1794515819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PFVwgOT0aaLDOnm5OSGliikQrCnjG+mZrD4LikZIekA=;
        b=OmVAPLBH32K5oauspPyzKK5U1NEJyq9l7IuIQYHEVnMdw5ORq2gstmCwZ14sGHUbo8
         6p/myGJVgVb296GWN5p/Qbxsxo8HIdP3RuNqCrW1mb8Ba7SQesrRB+/4S9ZaRuDuxsx4
         NW4jr08HGkpi05u6q/JdIhrTkl63hBAww5t/ZEfux8dEZclwjQUaXRk8PTHXeb5ZmpRc
         eV1yMIzGUxNosRnJp2upzOFYuwmdShCW6qCyXTuFRQkN4b+QADE6eAx9t3y9Bj8zLM+h
         WZ/D+Wg/fF9zhOBn1AtgksoFv2UH3ZzR4lGLhDGwLa+AroCzFgV3CwD2nQJ9XOXTFLpT
         eolQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIDfG2kQWGnvnZLCoWH6LLpPOQ30RL69U8jE1kxGTXeHbFIcWlNc607zkBb8gwLG8NY5+vVDTH3Twk5Ow=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ByNNthLwZcp9B0zbYUCrNXvbj3ddiHJFpnobJYaZM0NrilT+N
	p1AcibVLg1MerRIJUzxQgw+NswOHnPBZD1n7Ph/XrLs8wnr0ERo/SHBIc168wjs5xw==
X-Gm-Gg: AYBFou35Oh1zZ0bISjSsv+Fvc0Ketp4czP4yfidN5WCqdA9hVIHd12thxoh9lpB3pSt
	ffvT53Wa0iksgDNLsdJH70JS/FNTfbkh7aLFvOSkwDuGbqYllnP6g7WhJyjb4bUebgNd9n7PsPu
	uuYL0xB8upED2188s6JoZtIqtZg9u9HAlZEdN724F5mEIDv8zibK3iipcfnrKcGsi81iAaripiK
	0xwQhhV9rgAy9AicG0swbla1poewYPSi+V3VRZUlyzJlQdLKfiCxnV4ZYUjDYMBQtWJMbAvVo1S
	Zx4AUKsVGEDVZnOoFiRK2hSadUu8PanN798fPkyDSb+No4QyjRj2GUJOdngjEIk/Z5YSmzAoZf8
	dEV3K9J0P5Z0hL/WYip/WZZuk0YiuXthpZv6H4W8GCACran15o0j64G5i8/kEYksIUfpsRLv1l7
	9USZGm5bCNWVvsbmrPubTn2aZO090Wbm3BWsCzvUL9S2uhPxidcyJ5unP0/7HvGAp0leSp1Pruk
	k1QEmaz64yLVQ+muYygzZH0xY818YTrz1C6z9b9IWjHnLtQ0ks/o34fHtBcv6ZB8unnux2G5PHd
	qStKqVQQ68l5iXiN/It+pN4sU5bF
X-Received: by 2002:ad4:5e88:0:b0:91e:7eed:7ce3 with SMTP id 6a1803df08f44-91ea965c4d4mr2244596d6.21.1793911018363;
        Thu, 05 Nov 2026 12:36:58 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acebb0sm3887666d6.45.2026.11.05.12.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:36:57 -0800 (PST)
Date: Thu, 5 Nov 2026 15:36:55 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Tang Bin <tangbin@cmss.chinamobile.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: ohci-spear: check clk_prepare_enable in probe
Message-ID: <e46b0f2d-8b9c-449f-90f3-03231bb96c9c@rowland.harvard.edu>
References: <20261026134019.3020-1-tangbin@cmss.chinamobile.com>
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
In-Reply-To: <20261026134019.3020-1-tangbin@cmss.chinamobile.com>

On Mon, Oct 26, 2026 at 09:40:19PM +0800, Tang Bin wrote:
> spear_ohci_hcd_drv_probe() ignored the return of
> clk_prepare_enable(sohci_p->clk). On failure usb_add_hcd() runs unclocked
> and the error path clk_disable_unprepare() would unbalance the count. Check
> the return and bail to err_put_hcd on failure.
> 
> Fixes: 1cc6ac59ffaa ("USB: OHCI: make ohci-spear a separate driver")
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ohci-spear.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ohci-spear.c b/drivers/usb/host/ohci-spear.c
> index 5aeabb051..9d93b3f86 100644
> --- a/drivers/usb/host/ohci-spear.c
> +++ b/drivers/usb/host/ohci-spear.c
> @@ -80,7 +80,9 @@ static int spear_ohci_hcd_drv_probe(struct platform_device *pdev)
>  	sohci_p = to_spear_ohci(hcd);
>  	sohci_p->clk = usbh_clk;
>  
> -	clk_prepare_enable(sohci_p->clk);
> +	retval = clk_prepare_enable(sohci_p->clk);
> +	if (retval)
> +		goto err_put_hcd;
>  
>  	retval = usb_add_hcd(hcd, irq, 0);
>  	if (retval == 0) {
> -- 
> 2.52.0.windows.1
> 
> 
> 
