Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339D1473C60;
	Thu,  1 Oct 2026 11:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790853445; cv=none; b=tHRhazNk8ZzwkkeNCjFg+tu+jkSKBcddgZaHYAhVH57l4iItrtpLLE1/pg9ctsmPOrBUfGCpcioZRC3x7CxungeALhEWJ8homAs3Y51z99MO09I4U8mOTwrx1n6x9S1hb53NT2vRnwzNgxvRj8VhRx0o1DJC7YGWQ1uLwSStFZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790853445; c=relaxed/simple;
	bh=dntRGDgfElhE4KGddVKW9Gs9foUpSjej/bS/Hyc/bOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lgYDs1xlqkqLT7sVNC0PrRKyrROSbB8jneuwkcM3i40FK9YAbnjm+vqjtlbj7JrDjJphzSzqv8yru4DZSCY+3WGjxHdJfd3t2G85oYaB2/j2gTlXXjpqucmafd1oMBfMO7js5xduAFcBTld3SxY0G6EuU6DDE5VV4seIDteDYAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FOVCoTUw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FOVCoTUw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283621F000FF;
	Thu,  1 Oct 2026 11:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790853439;
	bh=tXGNC3Fdjh0XzMdf/efSRuFHZP4mN9FYmRJN+4br47c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FOVCoTUwxv4mssDRkXkZSvnWAEfGi1qMjqMmBEOTfP4gYMH95vVLffpaL9IJ1GUM2
	 GwMb/xL8lFEi+9ZhpPd/sCuBDf8qnmD1IbXAhkVB6guQxngdE4ZirvNrkrmz31J5bY
	 NlcIe6Zs0qOMLlHy4UsXxWAShNq4yMElmO6M6v84=
Date: Thu, 1 Oct 2026 13:17:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: use errno in
 rtw_register_tx_alive()
Message-ID: <2026100153-barber-financial-29f4@gregkh>
References: <20261001100319.6228-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001100319.6228-1-dennylin0707@gmail.com>

On Thu, Oct 01, 2026 at 10:03:19AM +0000, Hungyu Lin wrote:
> rtw_register_tx_alive() uses the driver-specific _SUCCESS and _FAIL
> values to report whether the transmit path can continue.
> 
> Use the usual kernel convention of returning 0 on success and -EAGAIN
> when the transmit path cannot proceed yet. Update the caller
> accordingly.
> 
> No functional change.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
> Changes in v2:
> - Use the standard 0/-errno return convention instead of bool, as
>   suggested by Greg.
> - Return -EAGAIN when the transmit path cannot proceed yet.
> 
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c    | 13 ++++++-------
>  drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c  |  3 +--
>  drivers/staging/rtl8723bs/include/rtw_pwrctrl.h |  2 +-
>  3 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> index 448611ad8237..00d64b2ff89e 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> @@ -771,13 +771,12 @@ void rtw_unregister_task_alive(struct adapter *padapter, u32 task)
>   * _SUCCESS	rtw_xmit_thread can write fifo/txcmd afterwards.
>   * _FAIL		rtw_xmit_thread can not do anything.
>   */
> -s32 rtw_register_tx_alive(struct adapter *padapter)
> +int rtw_register_tx_alive(struct adapter *padapter)
>  {
> -	s32 res;
> +	int ret = 0;
>  	struct pwrctrl_priv *pwrctrl;
>  	u8 pslv;
>  
> -	res = _SUCCESS;
>  	pwrctrl = adapter_to_pwrctl(padapter);
>  	pslv = PS_STATE_S2;
>  
> @@ -788,7 +787,7 @@ s32 rtw_register_tx_alive(struct adapter *padapter)
>  	if (pwrctrl->fw_current_in_ps_mode) {
>  		if (pwrctrl->cpwm < pslv) {
>  			if (pwrctrl->cpwm < PS_STATE_S2)
> -				res = _FAIL;
> +				ret = -EAGAIN;
>  			if (pwrctrl->rpwm < pslv)
>  				rtw_set_rpwm(padapter, pslv);
>  		}
> @@ -796,11 +795,11 @@ s32 rtw_register_tx_alive(struct adapter *padapter)
>  
>  	mutex_unlock(&pwrctrl->lock);
>  
> -	if (res == _FAIL)
> +	if (ret)
>  		if (pwrctrl->cpwm >= PS_STATE_S2)
> -			res = _SUCCESS;
> +			ret = 0;
>  
> -	return res;
> +	return ret;
>  }
>  
>  /*
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> index 0441e84ea87d..77e5adc8731e 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> @@ -140,9 +140,8 @@ s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
>  		return _SUCCESS;
>  
>  	ret = rtw_register_tx_alive(padapter);
> -	if (ret != _SUCCESS) {
> +	if (ret)
>  		return _SUCCESS;
> -	}

Why are we returning success if there is an error?

thanks,

greg k-h
