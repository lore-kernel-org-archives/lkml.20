Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97FB1DF27F
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789778207; cv=none; b=OFuVuFBChckw6iPu8J9Kba4/QAMmtX6KBz3Xoh88FLRadq6NRDwNS1UFtSr1gEHJXzTQB7VSf0FsEInIXhFlMt8StISo6s5N0AHON4USaA+QE73TXAH2jDdtQKmykr+j9r9IGcRTh76j4wkhDZTqZR8CAsP0gECV2udKQGb/1p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789778207; c=relaxed/simple;
	bh=WOR/ls5zxX5sPZGG/HhWRCdfca5hWsTLk1XL54j9bt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNOxA1m0WakzTraHvSBU4CVW5RKzniSgRfzqnxSfULF42BnGWNEv5WNEwrZiAjh9Ja6cMO+lm/QyNKosSiAZ+U25o6qPJb3poJmgJxzxKROdsSQW0HtzF5OauLGZYv71+c0kFZIF4ClQ8x0hIK/zJxRq6Y3dCQiScEPb0FZqDjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=DBO08qOi; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="DBO08qOi"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469d20963so926560b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1789778205; x=1790383005; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=re+BDEbV10G80IR4SJ9J6eVXDiFOVybjLhZAgTxh9Dc=;
        b=DBO08qOioPDhtsIllkkwTP5r8bq7IMfV4a/xlkmwvOh/TYo0NzNyPkp6RLAF1sCw6K
         LaXec8GhlAvWr+74qsmGpVhcA54fvra3Y4FHaB7tSEcajyTnG13O9m0IOfQdcQWzDPQh
         keJtKg60n7n83WXxT5+7uuWRAKH0fTkEScLb87Bkjg5kJjSJDpRt1vgnth+6jp1Dg+3Y
         YCGvtprSw+YNf3fvoD+wD87qTmQ5fEF4LPlmiCiHaNU1PskizszW+0atlcN2vuv4sxBE
         XJ0ji5HxHEhzGSoRcowDpi3ii+z8W5+4MFkyB8QpNe6Vq+5IA2oO67qnKB0J2Akdhl1f
         wkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789778205; x=1790383005;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=re+BDEbV10G80IR4SJ9J6eVXDiFOVybjLhZAgTxh9Dc=;
        b=SnUo5aBWeSq5qlZ1jwBJEFbDFvHan6Wb195KLS7kWfF60EXiEJ7+etCcXVErHvSJY+
         fQUm1VWRlh6B79303TknMnGUyukWFzeQbMeagqvOkoWkN40TQGMDzbO5tL7XD17PPn8J
         Fo/Qqa7XSlVwiEj3oYTs94eg4KebfWm5HOJ/qYsDa3DbLbrdF2Qwqk9CaNtrAHaiZ8wK
         CUgUm7Vz+loe68151btHHb2aDRf6GqNLY2EEbqvuNIcs/RZt5M9zikP6pbCxZkkyoveq
         gUvSd955gsSbTiGm/qIP5ZzR4iKQtsUyCTfyi18HJzyV1r8bgqqo7mJJ2w/mnmR9yrLc
         PTxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxK+iAHn2QAZfRPEvA/t7c+dX+8FjWvQu0sKmTBgWgWEJ4sf1ZbDPfCjfA0hpxWHX8fDB6UjqE2XyP0sAU=@vger.kernel.org
X-Gm-Message-State: AFuF++kfP73NZBObOJFej3XAZ5plWpJDQzEIfttYFWrjK1SaBDmftl/s
	qdjTS87ClUy8L72pNRWnrolDudhP2PTl4rliVvl0lZ2okZf+UwnEs2hwcleh8nVOxXA=
X-Gm-Gg: AYBFou0zfEl2FEHJdzJm624LVqZkP5X9QDoo4lI6COwgVy0PUhIYUOot5AgcubzZbqY
	Bmd+dPTlxyU96n3MQpaM23OB9B0+H8lQzCRmwWsK7BRNFwXrNR9BjRcOXSwUJe0Kqa7jYkI2En6
	1XO+y+PHKE+D9mbEAZSYLmuAqfo7Ickwjv6/lg5cuhNb5qIMbzo/yWNEISRvmJL3RGQVHpq/2jP
	KHwRoxGWvEd/MgyxDIEojOVYYowtmfl1lbmYWbP6Ma0Th+zZXnu9Q2S9TxWcv77QmBb8WPnpKUD
	tdFtmH989Mx86jDhlmh015DJvaaxrDQu+NDPiox4obt2wLvmPdO+UvrNp/iWjuDpei/Bdso5Qu1
	w45khkkIpHCB167MghizY7z7dVV2/ca4Ch27Z+kw+mbkAg7zcT+yZn1jM+9PBriMr20OZY0cQ1w
	89C4XlDe/GJRjJNfc5sBweHSiTyyz4pDsc0Y1eGsgfvAdBG/E7zRgM
X-Received: by 2002:a05:6a00:44cc:b0:874:708d:b634 with SMTP id d2e1a72fcca58-874df300c71mr8701591b3a.32.1789778204975;
        Fri, 18 Sep 2026 17:36:44 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:73::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a6ae7d71sm403389b3a.2.2026.09.18.17.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 17:36:44 -0700 (PDT)
Date: Fri, 18 Sep 2026 17:36:43 -0700
From: Joe Damato <joe@dama.to>
To: Koichiro Den <den@valinux.co.jp>
Cc: Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	ntb@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 01/10] NTB: ntb_transport: Order RX
 descriptor reads after completion
Message-ID: <aq3ZG222WqEDp1Je@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Koichiro Den <den@valinux.co.jp>, Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	ntb@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20260914084838.2158249-1-den@valinux.co.jp>
 <20260914084838.2158249-2-den@valinux.co.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914084838.2158249-2-den@valinux.co.jp>

On Mon, Sep 14, 2026 at 05:48:29PM +0900, Koichiro Den wrote:
> The peer writes payloads and descriptors into a DMA-coherent memory
> window. ntb_process_rxc() checks DESC_DONE_FLAG before consuming the
> descriptor and payload, but coherent memory alone does not order those
> reads on weakly ordered CPUs.
> 
> Read the completion word once and issue dma_rmb() after DONE is observed.
> Use the saved word for subsequent transport flag checks.
> 
> Fixes: fce8a7bb5b4b ("PCI-Express Non-Transparent Bridge Support")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/r/20260815032932.151F11F000E9@smtp.kernel.org/
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes in v4:
>   - No changes.
> 
>  drivers/ntb/ntb_transport.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/ntb/ntb_transport.c b/drivers/ntb/ntb_transport.c
> index f9caa1a653c5..74f4f8c1c7be 100644
> --- a/drivers/ntb/ntb_transport.c
> +++ b/drivers/ntb/ntb_transport.c
> @@ -1609,21 +1609,25 @@ static int ntb_process_rxc(struct ntb_transport_qp *qp)
>  {
>  	struct ntb_payload_header *hdr;
>  	struct ntb_queue_entry *entry;
> +	unsigned int flags;
>  	void *offset;
>  
>  	offset = qp->rx_buff + qp->rx_max_frame * qp->rx_index;
>  	hdr = offset + qp->rx_max_frame - sizeof(struct ntb_payload_header);
>  
> -	dev_dbg(&qp->ndev->pdev->dev, "qp %d: RX ver %u len %d flags %x\n",
> -		qp->qp_num, hdr->ver, hdr->len, hdr->flags);
> -
> -	if (!(hdr->flags & DESC_DONE_FLAG)) {
> +	flags = READ_ONCE(hdr->flags);
> +	if (!(flags & DESC_DONE_FLAG)) {
>  		dev_dbg(&qp->ndev->pdev->dev, "done flag not set\n");

I get why the dev_dbg line above was moved down, but i feel like if this case
is hit, you lose some of the debugability that the debug line intended?

idk maybe this dev_dbg should be something like

dev_dbg(blah->dev, "qp %d: done flag not set, flags %x\n", qp->qp_num, flags)

so that some of the debuggability is still preserved when this case is hit ?

>  		qp->rx_ring_empty++;
>  		return -EAGAIN;
>  	}
>  
> -	if (hdr->flags & LINK_DOWN_FLAG) {
> +	dma_rmb();
> +
> +	dev_dbg(&qp->ndev->pdev->dev, "qp %d: RX ver %u len %d flags %x\n",
> +		qp->qp_num, hdr->ver, hdr->len, flags);

I guess the above is a nit, so 

Reviewed-by: Joe Damato <joe@dama.to>
