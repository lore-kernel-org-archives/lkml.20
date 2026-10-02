Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22862D0C92;
	Fri,  2 Oct 2026 14:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952788; cv=none; b=FkuYtUF1WDpeIy08NNUBuY2R9XxNQ8OAGsngPiCRh8vNF4LBpSpBJRyisCkJv1HIduxTgBlwMxYFLR8XRs9nmsHKYW9snZVhNU5WLDvuJ97U/yfCarbvZ+z7WMgjbBBG6R2QZX5X7gIWarv6mJNPsRGfNxsOY6H43uOyNrbwjBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952788; c=relaxed/simple;
	bh=GZxRYK1w4snKNC2Ijd053YYTdJJ312g/wKMewJKo/ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bErwNGGyg8PuNIZimV4GiW/445Ldcu8RVbwGiN7GWlj6mqHCRA84WbhxlsQ2bM4rvOtafBwAH/jHgfZaxCYAFM3hfmf4OLu8kuN7xX4gzz/luxdrveKu3vzftBxiI94kAMReX5RpAPH/pA+gNQcoZ3S0UppukYJyyFAv8v9+F1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X8QQqt24; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X8QQqt24"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1BCD1F000FF;
	Fri,  2 Oct 2026 14:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790952786;
	bh=/P3LRF5JXFyBnEM5H7R7UPRrjiyCLLXP7y3LOSoBZ3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X8QQqt24tfxSc01J8QrXafL/qhMHuz4v4dNU4ZH6QivQZ0pfn8UVD0Ayi3BHU5gTj
	 acbBdl5SwLoyInD8PDtvEIubVowu7K9nCEOQTFkiF5eXyBYdrKSr8bVJxpojg5fben
	 ucO0QVKSJVRJQb+o6p9cloaAQST/NbUrLt+fm+xs=
Date: Fri, 2 Oct 2026 16:52:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Adi Prasan <itsadi2409@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	error27@gmail.com
Subject: Re: [PATCH v3] staging: rtl8723bs: fix ie_length bound check in
 rtw_cfg80211_inform_bss
Message-ID: <2026100246-underpaid-hardener-cfab@gregkh>
References: <20260920142849.294162-1-itsadi2409@gmail.com>
 <20261002140450.3209-1-itsadi2409@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002140450.3209-1-itsadi2409@gmail.com>

On Fri, Oct 02, 2026 at 02:04:50PM +0000, Adi Prasan wrote:
> The buffer bound check in rtw_cfg80211_inform_bss() checked bssinf_len
> (ie_length + header size) against MAX_BSSINFO_LEN (1000 bytes), but
> network.ies[] is only MAX_IE_SZ (768) bytes. This allowed ie_length
> values up to ~976 bytes to pass the check while a subsequent memcpy()
> from network.ies still only has 768 valid bytes, and other paths that
> write to network.ies consistently cap ie_length to MAX_IE_SZ.
> 
> Check ie_length against MAX_IE_SZ directly, which is the actual size
> of network.ies, and drop the now-unused bssinf_len/MAX_BSSINFO_LEN
> comparison.
> 
> Signed-off-by: Adi Prasan <itsadi2409@gmail.com>
> Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
> ---
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 27e7b8442d7b..7e964b15ae6d 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -210,7 +210,7 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
>  	u64 notify_timestamp;
>  	s32 notify_signal;
>  	u8 *buf = NULL, *pbuf;
> -	size_t len, bssinf_len = 0;
> +	size_t len;
>  	struct ieee80211_hdr *pwlanhdr;
>  	__le16 *fctrl;
>  
> @@ -218,8 +218,7 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
>  	struct wiphy *wiphy = wdev->wiphy;
>  	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
>  
> -	bssinf_len = pnetwork->network.ie_length + sizeof(struct ieee80211_hdr_3addr);
> -	if (bssinf_len > MAX_BSSINFO_LEN || pnetwork->network.ie_length > MAX_IE_SZ)
> +	if (pnetwork->network.ie_length > MAX_IE_SZ)
>  		goto exit;
>  
>  	{
> -- 
> 2.43.0
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

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
