Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917A32931CD;
	Tue,  1 Sep 2026 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256588; cv=none; b=g7Hkam2b9NBdozVp67uSv/3tmoRpnCVrvY6uhy2V8IKV3R1s7LnrIxtUEJFVcw++5LgUeNddlUC+JFIbtwmrk3NkSkEykxOy3MVExyPsGEzQmciQI3rmKFYpanlD8M6gefg7JcHNQsIvHg5qChhWVx5rfRBHB2/cfdCdWiM360U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256588; c=relaxed/simple;
	bh=dNfb9UrttliFxHa5oETh4VaPDz6jqJdzhulR7uaTMlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PhEO5r7BuCkwDpk6ZBidkOAiaY6wSv4c+Rd8g8t6d4xMX+kIAd8HXB9LdJA0+B6io0F7KjzWBKvdWo3TGq6d1Pmg7adGNWqS5H3QE0M5Y7oIcgLuExkCQpvflZ8Fupy2Vid4JzxEsiEZCBO1ntP75leQdHlA9J7vq9NeMlMA5HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jngjwwVf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jngjwwVf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B121F000E9;
	Tue,  1 Sep 2026 09:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788256587;
	bh=fqSkE4SRU0q1W9qdvl+aZQN2oFtrEpYH+i5pAP8zeTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jngjwwVfh3jhMOr47wA5es6zEsjPirt7Jn5Um9Eg9el0ygK3ytKaRMMlpEAPJjMqs
	 D426ggM4HmbximcqYNjDgqaQLtJHza+frWkV9OOo/xVOve+HtrWkSLAvO+xcHXdiRu
	 sevHPlokq+mSXbN3E+jK7pc9lw9/RKnhOoi+PGo4=
Date: Tue, 1 Sep 2026 11:56:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Raushan Kumar <mitramaurya80@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary braces in
 rtw_set_oper_ch()
Message-ID: <2026090103-sprout-oxymoron-f088@gregkh>
References: <20260809144236.127828-1-mitramaurya80@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809144236.127828-1-mitramaurya80@gmail.com>

On Sun, Aug 09, 2026 at 08:12:36PM +0530, Raushan Kumar wrote:
> Remove unnecessary curly braces around single statement if block,
> as flagged by checkpatch.pl.
> 
> Signed-off-by: Raushan Kumar <mitramaurya80@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> index c614c0b4c792..d900b946908e 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> @@ -256,9 +256,8 @@ inline void rtw_set_oper_ch(struct adapter *adapter, u8 ch)
>  {
>  	struct dvobj_priv *dvobj = adapter_to_dvobj(adapter);
>  
> -	if (dvobj->oper_channel != ch) {
> +	if (dvobj->oper_channel != ch)
>  		dvobj->on_oper_ch_time = jiffies;
> -	}
>  
>  	dvobj->oper_channel = ch;
>  }
> -- 
> 2.55.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You sent multiple patches, yet no indication of which ones should be
  applied in which order.  Greg could just guess, but if you are
  receiving this email, he guessed wrong and the patches didn't apply.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for a
  description of how to do this so that Greg has a chance to apply these
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
