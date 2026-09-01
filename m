Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71CF4749E9;
	Tue,  1 Sep 2026 10:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257545; cv=none; b=YQZ1E1akqp9ekOplDglQyi87f7i5C/fzu1pj7Ujx+7C/hRt9xR7EwOJwHSTF0z1wqg8HttByvKt0xnwk2dXjoCXtVVvZyYaiAp6hDnzFAXY7o30yiZkfQBJqq3JowGAxEO5xOHwgFa8BHkn4E/Hho4fiil6dYUVzTNuOApvh76I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257545; c=relaxed/simple;
	bh=3kWzb6XpeMS1qfp2L9E8YIkxSPtEam/WpQ8iFf+w1Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGuO88JHNRI1sOoy2dZXU/JJfPTAW/gTKW6bDdgHJOh/9gtQDqaugNIxH79cniNMg6Hrb+Do4AJNzd4dxLkPXU2KjLBvr/YJjXz6jNa9bVs2mYh8aMyoCpKAUjlt2rknO7+5eB9Wu3M4x7x7skC/wF/6ejqiam5KKxwVRpTqzUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lK43yXZI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lK43yXZI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F18BC1F000E9;
	Tue,  1 Sep 2026 10:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788257542;
	bh=gvhrS3UEtB8hmGHL7ZQkcK6748LNRLycToVX0QTx4DE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lK43yXZI5EbmXKfcAhtIWXDQ1/XQMBwkcypg9HFblD5lkbsBjOZwguIs0not99TcM
	 qPdW/cI6JzLffB/WZmGQpOcWcZQLTxfiJ3RThgInddAJeerQMjaFbZ8INy5WDjCeVH
	 7x0+tmMBpBZuO67c85FXdxwXZg3em0+DZbiz5m6o=
Date: Tue, 1 Sep 2026 12:12:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Remove unnecessary braces
Message-ID: <2026090107-sadly-exterior-e456@gregkh>
References: <20260825123037.11779-1-nsvatoslav515@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825123037.11779-1-nsvatoslav515@gmail.com>

On Tue, Aug 25, 2026 at 03:30:37PM +0300, Svyatoslav Nikolenko wrote:
> Fix a checkpatch.pl warning by removing unnecessary braces around a single
> statement block in the rtw_set_oper_ch() function.
> 
> Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
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
> 2.47.3
> 
> 

Someone sent the same change before you, sorry.

greg k-h
