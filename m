Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FF64D4882;
	Thu,  1 Oct 2026 09:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790846988; cv=none; b=CYrYgrepHrJG8N2WQ2/Bnyusvg8c599ttsxLfNObwOlCFaBq0M8BMEMJcm6CluHuljtB8IGWR713OFSXVQ0hIUuOhfp3XzBFQjotkILtsqYRSxCAQiY80pVA+sc0EarHY9PrNUXq+8zSo4Lpt0krHG7d9hXn8ugXFjxoE9Dj45g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790846988; c=relaxed/simple;
	bh=t/FRGhrqgQAOhkutZ2HIcjirUgjtyqV8JphA/SoHTgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C44ydA6yq7vWsDQmp1zbrTLkziclWMia9nYnbBb9QIx8l/MS+WWO++UoMjthjxJdkUm/7iIm2N3lSM/HHskIpvxxywAnKQZj2DhZGwDp6nChmgINjIQvqrlxAfxFd1kCCXCEuTadsECz5kYsMf3eHPCoCyx8SQBcSIN06VgGyQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BPDvimf5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BPDvimf5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93ADD1F000FF;
	Thu,  1 Oct 2026 09:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790846986;
	bh=IHdCB7UXS+RjN6aYKAYsbpA0C9+cu8S0I234OeLJvaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BPDvimf5e1+t9uXhg0qpt22uzk5cSA0w836eEpPdkePA2vHndtFRSA7tXfcT1qwOc
	 jVrmOQSjlptmgWgwvm6DtIXLtAc4lZ0N2o9Sl8I+2Eeh/mIE7PJn+LrzD7ZVM1N5nc
	 Vv14TXGY25dCyRBNfw+HcQa/Ad1TAwvt0QDzH6DI=
Date: Thu, 1 Oct 2026 11:29:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: make rtw_register_tx_alive() return
 bool
Message-ID: <2026100113-donation-filling-5562@gregkh>
References: <20260926111125.5036-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926111125.5036-1-dennylin0707@gmail.com>

On Sat, Sep 26, 2026 at 11:11:25AM +0000, Hungyu Lin wrote:
> rtw_register_tx_alive() only reports whether the transmit path can
> continue, and its only caller treats the return value as a boolean.
> 
> Change the return type to bool and replace _SUCCESS and _FAIL with true
> and false. Update the caller accordingly.
> 
> No functional change.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c    | 12 ++++++------
>  drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c  |  4 +---
>  drivers/staging/rtl8723bs/include/rtw_pwrctrl.h |  2 +-
>  3 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> index 448611ad8237..007ead477a51 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> @@ -771,13 +771,13 @@ void rtw_unregister_task_alive(struct adapter *padapter, u32 task)
>   * _SUCCESS	rtw_xmit_thread can write fifo/txcmd afterwards.
>   * _FAIL		rtw_xmit_thread can not do anything.
>   */
> -s32 rtw_register_tx_alive(struct adapter *padapter)
> +bool rtw_register_tx_alive(struct adapter *padapter)

This is kind of the wrong way to do this as the caller of this function:

> -	ret = rtw_register_tx_alive(padapter);
> -	if (ret != _SUCCESS) {
> +	if (!rtw_register_tx_alive(padapter))
>  		return _SUCCESS;

Is now in the "opposite" format for kernel functions, right?

Why not fall back to the normal 0 and -ERROR instead?

thanks,

greg k-h
