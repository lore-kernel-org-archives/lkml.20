Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366AE47ACF6;
	Tue,  1 Sep 2026 09:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255609; cv=none; b=HFP6UptaybCnJHmL+Hl7IIa30VthsJn3FwAaKAg2axdcqm2FUC0FPzVnjpW3Zm0obxzAfUYTyqPTCu+LvoDrsBRnvNNsYzlRv8N1VYuuL6AjwACxkGYVn9Km9O3yTwo31CixH6bbgflEdxA4pXeowLL/DwmQ15P4GhtJ/KWNfjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255609; c=relaxed/simple;
	bh=KxLSjk8nuRq9NbSSBPKumrBwh6eKOXupiqciXJnzsYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5cQ4XQMKuG1tagmzdssJBjoPuSYyT9wUg0ZFJMfpTMSP+g2qB55uWKRwuiiza9K0AqjV/a3hMgAQAl9rcDMUXfuIFmnDXU9rE7PnW7+Wrkhd2krZYDWLyIkZo5PxzQ8WqxJSc/iEUsyCUEutSTZ5H0cdQThJWiCeSYmpVF/qbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Z0Jb7bDD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Z0Jb7bDD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048951F000E9;
	Tue,  1 Sep 2026 09:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788255593;
	bh=faSXU83nqH9nz63CSSROc3R7ZFslIO2RojyNAT/JIug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z0Jb7bDDQfOVXF0G4NHKt4xwTUVGTcoyMR8mhXknTE4M+u/GA0nv2xuZjALBhga4V
	 4E9Dso0ql0mubyFUigYkIg0aeYAuyMJGvfWcE1jqzy00P8mSqM2mkPzc8QbWM4fnRH
	 oypI/xzBpaoVWVKHmrFSeBMiqD53pL5kF3fSmsPU=
Date: Tue, 1 Sep 2026 11:39:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Lucas Jeffrey <luquijeffrey@gmail.com>
Cc: johannes.berg@intel.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: handle key setup failures
Message-ID: <2026090132-armoire-musket-14d7@gregkh>
References: <20260803004919.901586-1-luquijeffrey@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803004919.901586-1-luquijeffrey@gmail.com>

On Sun, Aug 02, 2026 at 09:49:19PM -0300, Lucas Jeffrey wrote:
> The return values from key setup helpers were ignored in
> rtw_cfg80211_ap_set_encryption().
> 
> Propagate failures from rtw_ap_set_wep_key(),
> rtw_ap_set_group_key(), and rtw_ap_set_pairwise_key() back to
> cfg80211 instead of continuing after an unsuccessful key setup.
> 
> This avoids silently reporting success when the key setup command
> could not be queued or helper functions fail to allocate memory.
> 
> Signed-off-by: Lucas Jeffrey <luquijeffrey@gmail.com>
> ---
>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 967cd1b34aed..8e5aa036d5eb 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -563,7 +563,9 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
>  
>  		psecuritypriv->dot11DefKeylen[wep_key_idx] = wep_key_len;
>  
> -		rtw_ap_set_wep_key(padapter, param->u.crypt.key, wep_key_len, wep_key_idx, 1);
> +		if (rtw_ap_set_wep_key(padapter, param->u.crypt.key, wep_key_len, wep_key_idx, 1) == _FAIL)
> +			ret = -EIO;
> +

Why the extra blank line?

thanks,

greg k-h
