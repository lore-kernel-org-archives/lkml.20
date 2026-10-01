Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53951492E3C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856486; cv=none; b=qsSDY+HdYN9gkVYNDaVLMkIsH+O0qT1wBx1EwXdLZc2X/HV5lvo+cJ/x05UsrhOjm9Od212To5AsEjAi7H8dc/ayK+drVZPieFXEHvuf/syDlVkhvQwc0+TMo3JFwBJucZYgcpkKQZRLV/yIicqopOkqw4e1NywhtfeTmu7YPuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856486; c=relaxed/simple;
	bh=sT7VGhc+RSEWQRGAkMrlBYAcTj5gBNYTccAx1/mraxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PltE97p4kUX9vPdKF2cTP1Kmt50uQODAArwy72oywY9InQD6DDgXcdRu+Ybr9EkC2UivV8h9VFJoXhOkexSrlFvKErxp3uri62zkh0DmPfhLFpL3hQ09IZdIb8UGWNSYN0ROTj6qRej0H37ogYcLja+xFzXYkqlIwg71kAmg+4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1fj50fCn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1fj50fCn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47A231F0089A;
	Thu,  1 Oct 2026 12:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790856477;
	bh=BOpRc4Gujf+vgaFDNdrz84+SoAyHVrXrvNXn8Cv7QJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=1fj50fCn7or84UD2Xbr+W5dU2/TOMPogJDz3uoKkqEIw6S+f04FgqM1dqisKQGDdn
	 fNnnzFsmXRS50Sp/HEXqzTmG3jtvLk7GZ9TDatazIG3JUUrJpbo/pmnzR6pSqatfSz
	 ENXzmG3bpFx5jevTyNIQe2LYnXaq7jUgahumb5xs=
Date: Thu, 1 Oct 2026 13:46:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hongyan Xu <getshell@seu.edu.cn>
Cc: mahesh@linux.ibm.com, andrew+kernel@donnellan.id.au, arnd@arndb.de,
	kees@kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn
Subject: Re: [PATCH] misc: ocxl: cancel XSL fault work before freeing SPA
Message-ID: <2026100102-clerical-underrate-cc5d@gregkh>
References: <20260928134110.227-1-getshell@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928134110.227-1-getshell@seu.edu.cn>

On Mon, Sep 28, 2026 at 09:41:10PM +0800, Hongyan Xu wrote:
> The XSL fault interrupt takes an mm reference and queues fault_work
> embedded in the SPA. free_irq() stops new interrupt handlers but does
> not drain an already queued worker, allowing free_spa() to release its
> container first.
> 
> Cancel the work after freeing the interrupt. When cancellation removes a
> pending instance, also drop the mm reference that the worker would have
> released.
> 
> Fixes: 5ef3166e8a32 ("ocxl: Driver code for 'generic' opencapi devices")
> Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
> ---
>  drivers/misc/ocxl/link.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
> index 7749dcd16117..8146e98e77e7 100644
> --- a/drivers/misc/ocxl/link.c
> +++ b/drivers/misc/ocxl/link.c
> @@ -335,6 +335,8 @@ static void release_xsl_irq(struct ocxl_link *link)
>  
>  	if (spa->virq) {
>  		free_irq(spa->virq, link);
> +		if (cancel_work_sync(&spa->xsl_fault.fault_work))
> +			mmput(spa->xsl_fault.pe_data.mm);
>  		irq_dispose_mapping(spa->virq);
>  	}
>  	kfree(spa->irq_name);
> -- 
> 2.50.1.windows.1
> 

How was this found and tested?

thanks,

greg k-h
