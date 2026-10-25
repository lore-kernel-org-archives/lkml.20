Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792933303;
	b=3fgho4LLA/asV8KnuX3AhLkb+rkWVrLCao57o6lAr+asUbx5GIckJ3ebvHhBBH1OmTJT
	 VhER5IgccRaNV0/5rhxPCksZKO3yaD7kZmJTYA0aJbfhxJUHKosWZ4HThAT4pvssyhttS
	 EGgivsSooQX1SxPuN5nBZat0TvAXTt6alhBFmdT4tEk7TZO8iDBK/NcWso/9MeIECBmkf
	 DB3+mHydoa1+DVWATEXI7NNFWw+P0/LVmpC7zmwJ0PYK0xm16puyiI6kv9/1hFgl2jOPW
	 L3M79e1VSx9cOt0pah5/3ARNks/wgvRwqzc0bR/tzluweRu9a/WQNSDghcn3jQncGUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792933303;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WkUsZJXlaMLbhP4mLDHkT3W0LsOojMM5ad3kaWkpguw=;
	b=eujczOAvNouJwtmS26C3NOc6roHcSkK4RScLmWGqTQopMNdNcpS6tcWwx2xQbZaSY7BD
	 7py6NcyWyhScP9gkyel/2pwPILcN9xYhfj9W9Yd2lmbwhOA0gi2VC4hD5DEMPN3qzuD6U
	 exq/sG5EG3u59dP1LaGL05eAGVa3vqPgOqucip8FZ3FcybqtxmMHZAwOnoAHxZ+ZavkoW
	 XiKnbyW1tFmJOrgHVDFQXiH2CgY40pR28EycIUpQFI2os9ifzTEquuqbhzlrwbPCXG58X
	 qD0eTxhF+/jU35dUQq2mRjnOtBDFGputVYmuAyd5ZmZlPir6AJ/q/jvIFXdDUmb86TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="d2cDsi/v";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852CA606A31A;
	Sun, 25 Oct 2026 13:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=d2cDsi/v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B16E1F01825;
	Sun, 25 Oct 2026 13:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792933303;
	bh=WkUsZJXlaMLbhP4mLDHkT3W0LsOojMM5ad3kaWkpguw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d2cDsi/v4FUWVnk7eMGr00SXOGV2DDtgRd7d74m/sCZsBIsCgFTr418nVN4GAHLsc
	 igFcgQ0MMOGyzjeLhCvyhqjV4rXIDAgGJLwvAiOdBAwA4TxnMFvNs7VpSDsEv+WVJy
	 +vJs10VIblh2JEMKBL2wqLeTbi+iPfFWRVjeAgrw=
Date: Sun, 25 Oct 2026 14:01:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Haasham Khan <haasham93@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary goto
Message-ID: <2026102523-marbles-essence-3887@gregkh>
References: <20261025122504.8404-1-haasham93@gmail.com>
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
In-Reply-To: <20261025122504.8404-1-haasham93@gmail.com>

On Sun, Oct 25, 2026 at 12:25:04PM +0000, Haasham Khan wrote:
> The goto exit statement jumps to the next statement, so it has no
> effect. Remove it and the now-unnecessary label, and simplify the
> conditional block.
> 
> Signed-off-by: Haasham Khan <haasham93@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index 6f4bdad00f60..c2d0cd314b81 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -2005,12 +2005,9 @@ static int recv_func_prehandle(struct adapter *padapter, union recv_frame *rfram
>  
>  	/* check the frame crtl field and decache */
>  	ret = validate_recv_frame(padapter, rframe);
> -	if (ret != _SUCCESS) {
> +	if (ret != _SUCCESS)
>  		rtw_free_recvframe(rframe, pfree_recv_queue);/* free this recv_frame */
> -		goto exit;
> -	}
>  
> -exit:
>  	return ret;
>  }
>  
> -- 
> 2.53.0
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

- Your patch did not apply to any known trees that Greg is in control
  of.  Possibly this is because you made it against Linus's tree, not
  the linux-next tree, which is where all of the development for the
  next version of the kernel is at.  Please refresh your patch against
  the linux-next tree, or even better yet, the development tree
  specified in the MAINTAINERS file for the subsystem you are submitting
  a patch for, and resend it.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
