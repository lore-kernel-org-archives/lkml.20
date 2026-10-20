Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502432;
	b=ZpSiihQaMczzjp8RlghhQb6VenViXqC507l+NRv3DwlnN4doszf2iz0Z2tK0upP+ljkA
	 7NWaWC359/GU2wV4UiPRm8bjyC8LufLMLrdqIf8jVS3cZENdOj/Pmovr5zEdnEh3Rk5lN
	 oNcAHsjPW44AT/CosDtBRT+qKWlhUoD3aJmL6+hVZ9+xc3NhePuFwoEKpv8aES2d11yan
	 AD0hsHcivaQBdg4W2cplxuV1o+pKmsEfgWb9gzC3ftFlyvgQn58SvtxuEXurOgVqd+Pmi
	 YFlHsAx1nzzWzWxaYJ5c0ZAx0VEDVHTt7AFEqjn2RDxqIgPfffaiY0xEIcVb+TADPGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502432;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HT30sp3tP45KqVAVlJk+Ve9kV8F+vAkrhPjIisPzUrM=;
	b=moB5URsyHXYKcc6nBoYRcYs0kyZg5KLMjiXL/5ecAf7VOKcHphJ3hgvQPmJWP40y4bbM
	 K3Bs7rZLA3PMxwCFcYLwvwwW+obZo0RyPp+6bNayrranHwojENQDQamcT0yQmPI17Vf98
	 kM0JgTXWJf9j442m2GEgOjhezvUbXhW6zmFvxXB4u4a7ftZUXF/ez8iaS+QAHT2FN78oM
	 HxYrR5Eh4VWTTZ/nD1iueyW2ZjFAyxutFvAPDVsUT0e+IPmHG4eK3gPi3UIB0Xz6RLzo4
	 xeJa53mwkzLRAr9PdLx4Htp1ULiWG2WwUodPgh02dU6ViaaGDepux14hejXR30v957Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=EjUqhy51;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4CB606A328;
	Tue, 20 Oct 2026 13:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=EjUqhy51
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF501F000C4;
	Tue, 20 Oct 2026 13:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792502431;
	bh=HT30sp3tP45KqVAVlJk+Ve9kV8F+vAkrhPjIisPzUrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EjUqhy51xNeABJf1R7U9Ac48krDJHEDy/+YAaTlyqAb3xuauQmOyi79CT7piSP31D
	 WTQD5d2k/0tJXxAk8rZEKgkhdldoZmQe6S2y7eI3gr1XoVO/RtInpxHPDBjwV79ZGQ
	 /NJm50cCY7sB96mIZrVXkTBbgmsJAuNK1rp8uL9U=
Date: Tue, 20 Oct 2026 15:20:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Haasham Khan <haasham93@gmail.com>
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] staging: greybus: remove unnecessary goto
Message-ID: <2026102011-snap-unequal-51b0@gregkh>
References: <20261020123310.5625-1-haasham93@gmail.com>
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
In-Reply-To: <20261020123310.5625-1-haasham93@gmail.com>

On Tue, Oct 20, 2026 at 12:33:10PM +0000, Haasham Khan wrote:
> Signed-off-by: Haasham Khan <haasham93@gmail.com>
> ---
>  drivers/staging/greybus/loopback.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index efc69c10cffe..284935fded12 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -609,10 +609,6 @@ static int gb_loopback_async_transfer(struct gb_loopback *gb, u32 len)
>  					     request, len + sizeof(*request),
>  					     len + response_len,
>  					     gb_loopback_async_transfer_complete);
> -	if (retval)
> -		goto gb_error;
> -
> -gb_error:
>  	kfree(request);
>  	return retval;
>  }
> -- 
> 2.53.0
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
