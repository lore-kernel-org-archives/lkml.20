Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792563461;
	b=D6vck7Qr0a+fMi+DALuuc8NQLNZicAWfYKKBhwJVkNjx8KXs/hD68xvWR/p8UBlcXVqn
	 4GkEerGLgcr8dzajAs5sQXRymYnYyFDsN3/syzRYWAa4RM1mj7xwTvxi1J9q6cLt1cN/H
	 q9CvJ7IVYDdC1RuPS3X28WY/u75GDHQAsaZW9pjnibD5luofrUBj8Qd82hQd9Z2c4X1+b
	 58x5PVfPyyol4tHGs8Mg9HRGrnpJ/e1KPUx6WsseLbRGnXnvzTLO+SETDRgw0XGnYguIn
	 3RE5CAaijZtMph466zv6k3/QBUXHTtp7drlBTPjn6aPk5wuiVPwFzTKTeTYOIp1IFHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792563461;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jIzS21RviZF9D+g6xi3HQyZzWhxx+ciqv+ffWW6njQQ=;
	b=fVESemAz3MZ36JFTvRrxjAHAfgATcG91XKqQSsCIwIV0i0r7okYDee7/bo6rQy/fTEGB
	 XtjhpQlDIILNG4U6v8rflzm2Nk5lg7ABcc2F0/EGjPhjugCEGwD52TCJNHIu3VenhyhhZ
	 /FRtCG+lpRO26Poizi3lqU6k/aAbn3vncrThPIhnqORsu161USrEF6F0h9UXOAdZT12As
	 DA5lxpRXefYd9Rn7eqlEYytPP7RQmF2pGedbSbviTwrHKo58f10Lz/VlwE+oZH10OvHHy
	 l2J9updgxLmlGuukucaM0lVlLhj58e9pGyPD+SJdsygWZ1+o8veP7vg8YJaMgdqlV7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=z9o4LCBY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DD7606A331;
	Wed, 21 Oct 2026 06:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=z9o4LCBY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 285331F000CB;
	Wed, 21 Oct 2026 06:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792563460;
	bh=jIzS21RviZF9D+g6xi3HQyZzWhxx+ciqv+ffWW6njQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=z9o4LCBYCBHx2wjIEjWST9yNxvWMCmV4tODd3dPy+xAsspPysTIzxeUL7oAb1KtWZ
	 zCTBYPp2yM9UeiYMyjCYj4OWg1lAYZYIIYIAe0pTCk4Fkz6HP+mDG+DN6ryD735A0M
	 jRM6cikJx9bAwkz0wW6+5wljVdxCRU/dcAq1ZbK8=
Date: Wed, 21 Oct 2026 08:17:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Haasham Khan <haasham93@gmail.com>
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: greybus: remove unnecessary goto
Message-ID: <2026102127-support-dangling-2fb3@gregkh>
References: <20261020163636.7629-1-haasham93@gmail.com>
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
In-Reply-To: <20261020163636.7629-1-haasham93@gmail.com>

On Tue, Oct 20, 2026 at 04:36:36PM +0000, Haasham Khan wrote:
> Remove the conditional jump to gb_error, as both success and error
> paths proceed to free the request and return the result.
> 
> This simplifies the control flow without changing the function's
> behavior.
> 
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
