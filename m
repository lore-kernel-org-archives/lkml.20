Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762766;
	b=v9HYfSwkge8LeiczT5dkKhqO8VImcw0PKmgOtYQyNCx6GVo0xTB0XsspRUBHQnpsBT7Q
	 gMWmIpWqx2szP3szY6RunzJyITJglaUEO8CJyzLeUIsN+V9Y/DzxsJ7b6SJjYMTrkcRy2
	 wdoQJDhw1SsfWB2YT1KVTOCJyS9Pu61O4zkKoG38wnCmZmU9ig3dHE2KznDY1Ku8ZvLkT
	 BqRa0IVcirxfZSKnCkur3I84pRM4hz3eHrnrB6c/ZhwA7XazbnOSLA768d3qAlQMcfBh6
	 t2hv9zAYLol2a09NZqJ8bdjjYBHIXEbNuR80mxd2qP/Cccgm0qEp6QFTy1Tpr5NXQVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762766;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=OMvMgSarJalS/dnNNgLfRrzbKrygmABuyVhylEY9KzU=;
	b=oGJIrIfQ3qHoRt9m2yqW1sHF5o8EDWElYYDCUi9dTwPshdVDtW6S3u4UYMRSRgMntlRH
	 SlWURd91MMOq0BA3J+z4/KBZ/sG6h1OSUvIri5Rrqi0YzCcG1X8QsFN6JjFBoLEqyKUVI
	 vF9HX76vtOcaxNlMWSvJCWzZYtHGfo6Lfhj69iBwKW4Nw1XrEB6xeVlKtVsYcFFNOeXRz
	 1U+9/jYRfQOsnSionz1kjTNMiFIaCMrP203/Hn2N8TJEjx6/G8FHV+swgBPVee6VbGSGH
	 RFucY8igs2XlfNXIhW+hsWPbZHdyDOJ0iRXZ4sIbB6zDOOqMxbiAeNeC5UMRTmYhvbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=pXfPuUcm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAAD606A32C;
	Fri, 23 Oct 2026 13:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=pXfPuUcm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F2C1F01829;
	Fri, 23 Oct 2026 13:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792762765;
	bh=OMvMgSarJalS/dnNNgLfRrzbKrygmABuyVhylEY9KzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=pXfPuUcmBdkkrmWZjtDZWQg8OfJcvpxIL8f4bfQj/wSmXNO27dzh1Brm2vF/dGs1a
	 EY867D0xuLpDYNHqesFPNhcq4rWIE1DPI0fXjp39tLm+5qOg+y5mg5pEIj2g2av/Pk
	 1+PXZepD++u63d5rfTIxvUbEv5l3sQUNTwqkClck=
Date: Fri, 23 Oct 2026 15:31:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Breno Rodrigues Alves <breno3011alves@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: axis-fifo: remove unused r_mem local variable
Message-ID: <2026102319-qualifier-closable-a65b@gregkh>
References: <2026102337-headroom-shun-9d45@gregkh>
 <20261023103943.20995-1-breno3011alves@gmail.com>
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
In-Reply-To: <20261023103943.20995-1-breno3011alves@gmail.com>

On Fri, Oct 23, 2026 at 07:39:43AM -0300, Breno Rodrigues Alves wrote:
> Remove 'struct resource *r_mem' from axis_fifo_probe().  It is filled
> in by devm_platform_get_and_ioremap_resource() but never read; pass
> NULL instead.
> 
> This is v2 of a three-change series.  The debugfs_create_dir() check
> was dropped because debugfs has handled ERR_PTR parents gracefully
> since 2019 (thanks Greg and Dan for the correction).  The
> -EINVAL -> -ENOBUFS change was dropped as well, after Dan Carpenter
> noted that -EINVAL is the common errno for this path and that he
> would leave the choice to the author.
> 
> Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 3d358f919..464368e04 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -428,7 +428,6 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
>  
>  static int axis_fifo_probe(struct platform_device *pdev)
>  {
> -	struct resource *r_mem;
>  	struct device *dev = &pdev->dev;
>  	struct axis_fifo *fifo = NULL;
>  	int rc = 0; /* error return value */
> @@ -447,7 +446,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
>  	mutex_init(&fifo->read_lock);
>  	mutex_init(&fifo->write_lock);
>  
> -	fifo->base_addr = devm_platform_get_and_ioremap_resource(pdev, 0, &r_mem);
> +	fifo->base_addr = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);

This doesn't make sense, if r_mem is really not needed, then call the
proper function instead (exercise left to the reader to determine what
that is...)

And how was this found?

How was this tested?

thanks,

greg k-h
