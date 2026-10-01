Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D5437E5EE;
	Thu,  1 Oct 2026 09:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790846703; cv=none; b=WPgMx+muqMzqaMJiG6yfkuuh7TBrpBSpD+7jJbVEBTKMEN/j4+R+H9RCSX2FyHBxUe5jXwkZIToXAI65sx0aecYryb+/TpZOcAq8WNAOABmRlIoxeCxrdSClYNkz0KXx5a5jUYJ9qOY4pfQWyJ9PZcC/83gE6zAO72S0xgpZfVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790846703; c=relaxed/simple;
	bh=yx6CJyXybz6rJnD/TJliBiXn60KFxLz4G8mFhbq9Okg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FlRK5dlqk9oQAf/mhCCnJyO3l7G3h0qDk7M5OoyrSBQaPb0JviJvJnFY6KgRRxyjlBFEAqj8w5b8+JtbMl6hA2neLf5RCyOjdW2XJsxomvRducKDDI5Fi7tn8HTLnqjFbxbb1Sw2wy5FcKQmwI4vHDPVEdd8jdcrogLlEELqvso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Wjfht9x2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Wjfht9x2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675201F000FF;
	Thu,  1 Oct 2026 09:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790846701;
	bh=A3mQyACB5gX4FUyQfI61OqCZ1jmjSyUK0CivRzxVPBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wjfht9x26yJl4qjWskKyfTEZGXTsEKMLICxVCoKtmquk4GWw/iVXJxDzZKiLH2FU9
	 XrM49WTyaHi8BxTM7pQy1uMkHkctlvvzg0mHYXAXsS2M5w7XjZ4oEAWe602k62RqEI
	 ID8KLrRuFpqpbZZBVom38ZxUf6Nkh/Wb3QtPTYd4=
Date: Thu, 1 Oct 2026 11:24:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Eduard Zateev <hackerowskiy@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unused variable 'phal'
Message-ID: <2026100151-winking-boss-9194@gregkh>
References: <20260923010423.6352-1-hackerowskiy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923010423.6352-1-hackerowskiy@gmail.com>

On Wed, Sep 23, 2026 at 03:04:23AM +0200, Eduard Zateev wrote:
> phal is assigned but never used in rtl8723bs_init_xmit_priv(),
> which triggers a -Wunused-but-set-variable warning with W=1.
> Remove the unused variable and its assignment.
> 
> Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
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
> 

Does not apply to the tree :(
