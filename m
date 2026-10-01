Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317D137D11A;
	Thu,  1 Oct 2026 09:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790846732; cv=none; b=iqZreqrd3UMwXZm0RrPzNC0lT/kKamqZ19in3pX/gMa3esteyNPFANJW/QTWjaV+Tw7Y3mCRdLZwIOrLiT7fTJI+llDNjBlhMnbYZhBuX/N3KJfk2PCsv//aMGJMrJnKx/sXwKolU57VkayRfBIXRaErbKenbPb4S1mvDlr6B4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790846732; c=relaxed/simple;
	bh=Fg8OpMA7JBByml0BEGqkCgfi8QTrfUWjBu4lkitH+IM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pFGlFpGiLg73xJZhLTY8C/MK+KxhPK6ypvQ91MpQn6mS8+xMvJG3id4iR9HAksMyl7+ELaAXfMar16ZQFtZeM6qaoGRYp7k/hHP8FjWYNa90PWJH8iIvUgShdwcz2g6UupVci1u19rxI+zGyN7GCr4+UrdvTk3fIqdeZfq7nwDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=afPTLdfN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="afPTLdfN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A24F1F000FF;
	Thu,  1 Oct 2026 09:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790846730;
	bh=SvKzRfH+1i3yDLy5G6gZmoxfGnVJDQ9JG+2fsvzDMgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=afPTLdfNK0ryW7okB3yQYSgAcQ+J+5XLXYKG9NcKLRHBUlZDdyRtE2rJThVdRCEeR
	 pK+P0G/i1kHuz9NoZ/RuP2u8iRcnENyn16D2KOMIrcZpRweS5wpm0Dd8vwXs6x+IoR
	 RLl2HFjPL71sHd7ckqgXCl7CBpw6Knv7X3oOXrgY=
Date: Thu, 1 Oct 2026 11:25:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: George Karagounis <taterraster@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	mail@taterr.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unused variable 'phal'
Message-ID: <2026100158-timing-valiant-6d16@gregkh>
References: <20260924185350.42180-1-mail@taterr.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924185350.42180-1-mail@taterr.org>

On Thu, Sep 24, 2026 at 09:53:49PM +0300, George Karagounis wrote:
> In rtl8723bs_init_xmit_priv() the variable 'phal' is assigned via
> GET_HAL_DATA() but never actually read.
> 
> This triggers a -Wunused-but-set-variable compiler warning when
> building the driver with W=1. I removed the unused variable and its
> assignment to clean up the code and silence the warning.
> 
> Signed-off-by: George Karagounis <mail@taterr.org>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> index 7f55448d544e..0441e84ea87d 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> @@ -525,9 +525,6 @@ s32	rtl8723bs_hal_xmitframe_enqueue(
>  s32 rtl8723bs_init_xmit_priv(struct adapter *padapter)
>  {
>  	struct xmit_priv *xmitpriv = &padapter->xmitpriv;
> -	struct hal_com_data *phal;
> -
> -	phal = GET_HAL_DATA(padapter);
>  
>  	init_completion(&xmitpriv->SdioXmitStart);
>  	init_completion(&xmitpriv->SdioXmitTerminate);
> -- 
> 2.55.0
> 

Does not apply to the tree as it's been sent many times in the past and
already applied.

Did everyone just go through some tutorial and decide to send the same
change?

thanks,

greg k-h
