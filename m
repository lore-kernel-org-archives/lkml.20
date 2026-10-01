Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67794A7C9B;
	Thu,  1 Oct 2026 09:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790846899; cv=none; b=QtM8rW0+WCtoBtWxHHIH7gWL2WPk3bniI+s0pu/lH0bxdoHmkQyJm6S0hKdOTNp6V5SOy2Fv7xnegw1Ki/vitdT5esVov5sx+zPdGnpWknMcEain7KLyDu/jR9t5nCzQ1jVIvtaZoCDAvC8XHp9NJlfEbUIRP60S7GdZHfuKqWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790846899; c=relaxed/simple;
	bh=AnURxHfhsJVzQNUxgO/7dXS3RztEqGpRqrT07miIn+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XppxC1eKjumJaEcpvjhXDaxtSacBI5+gwAAK5w7hMdvZbiXe9O6NeZpGSUnzBoMkkhkyKbo5G8WhdqZdCcasdyZfX+Exns4U2SSs/Ai7RQ6apfiEWy1WhKP2JPDOzSJjF4xHkX2AlBfIj+HUjM4eA5OlTu200GYiamNouSj8WyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0NzAUWiL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0NzAUWiL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02AD51F000FF;
	Thu,  1 Oct 2026 09:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790846887;
	bh=M1+gxPnqihf3sYvjqc9uWAg2uM4ocva618sTuonTi14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=0NzAUWiLeK+ldX+a8inqWM5x4XaOWHOx6mTHiZNvl98ZOciikLTLDVomc1JTFPGgR
	 HxGo2I90gBhkLjFbmphohjfHkN8KJysLtXS4RgfpMI/tN5TDOmD2iU1ZTiGI7L0E+M
	 aulgoMhfgcX/RUqUNjED3ueLbq6C1yGUnj8hOnKA=
Date: Thu, 1 Oct 2026 11:28:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: make rtl8723_dequeue_writeport()
 return bool
Message-ID: <2026100145-unbitten-playmaker-8ac5@gregkh>
References: <20260926105827.3760-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926105827.3760-1-dennylin0707@gmail.com>

On Sat, Sep 26, 2026 at 10:58:27AM +0000, Hungyu Lin wrote:
> rtl8723_dequeue_writeport() returns boolean state and its caller uses the
> return value as a boolean.
> 
> Change the return type to bool and replace _FAIL with false. Also use bool
> for the caller's queue_empty variable.
> 
> No functional change.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> index 0441e84ea87d..482dd1baf3ca 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> @@ -33,7 +33,7 @@ static u8 rtw_sdio_wait_enough_TxOQT_space(struct adapter *padapter, u8 agg_num)
>  	return true;
>  }
>  
> -static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
> +static bool rtl8723_dequeue_writeport(struct adapter *padapter)

Please change the variable that is assigned to the output of this
function as well.

thanks,

greg k-h
