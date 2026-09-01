Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC67A37C0F6;
	Tue,  1 Sep 2026 15:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277525; cv=none; b=CTGmjCOcDibN+n4jBbjfh1hoYpzcx3ESmqzSocIvBDJYL9qP0uoDiKidQ/qG+xiYSiZp3WhVuvBg6XYEYPIAPXqsdcuy2WlsUELgP/+9kR0Z1SFRnvP/kroKTQRiqU650bIaFIanOVyFIUQvVoMG05G8RgPSS/DAa1FXDGr0FHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277525; c=relaxed/simple;
	bh=dvQNXwiMDod+2uflvpcP24b3/EVxbgjaLostWO5JtjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j95LXb8rMMKhol+fQwzTTXNAuR8Cy7lNb+8itlMtU4M6cvwa2Q7VVI3Zacnr23c3d+lRAykaJkOaHu+j4sWo4ndS+Fb52dwC7hyatdC8pkZe0oXSPJbUE/JBN69L//OF9FRlEw1CmStuI49N+e2EG5Cmlf+aC/JqswW9+J2U0Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=H6wD8Hfr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H6wD8Hfr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93F51F000E9;
	Tue,  1 Sep 2026 15:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788277523;
	bh=KCmEnY3oXWIPqW/sQ32DOzf6z9w5WFFW23E323fyx8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H6wD8Hfr4i0YD1PE3EB45wlQa54vx45Jac6ZFhZvqeEMG+C6IBKRlbkAU34qYCv+g
	 em3QO1K4sDEe1VgopX+g8VYeqK1yhB8/hAjRgNcudlX7mSGNjl/vTzcYyZQragm6xE
	 dbNOO+l4sfqNgOExREUkLo/zn0hlvFt/0BrGnmyI=
Date: Tue, 1 Sep 2026 17:45:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Remove unused ifname module parameter
Message-ID: <2026090126-riverboat-unfocused-e368@gregkh>
References: <20260901152144.5978-1-nsvatoslav515@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901152144.5978-1-nsvatoslav515@gmail.com>

On Tue, Sep 01, 2026 at 06:21:44PM +0300, Svyatoslav Nikolenko wrote:
> Remove the ifname module parameter and the corresponding ifname field in
> struct registry_priv. Hardcode the default "wlan%d" interface name format
> string directly in rtw_drv_register_netdev().
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/drv_types.h | 2 --
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 9 +--------
>  2 files changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
> index 552d0c5fa47f..5837c51ac2f5 100644
> --- a/drivers/staging/rtl8723bs/include/drv_types.h
> +++ b/drivers/staging/rtl8723bs/include/drv_types.h
> @@ -151,8 +151,6 @@ struct registry_priv {
>  
>  	u8 enable80211d;
>  
> -	u8 ifname[16];
> -
>  	u8 notch_filter;
>  
>  	/* define for tx power adjust */
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> index dd0c5fc813c8..ade4576ea033 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -109,10 +109,6 @@ static int rtw_80211d;
>  static int rtw_qos_opt_enable;/* 0: disable, 1:enable */
>  module_param(rtw_qos_opt_enable, int, 0644);
>  
> -static char *ifname = "wlan%d";
> -module_param(ifname, charp, 0644);
> -MODULE_PARM_DESC(ifname, "The default name to allocate for first interface");
> -
>  char *rtw_initmac;  /*  temp mac address if users want to use instead of the mac address in Efuse */
>  
>  module_param(rtw_initmac, charp, 0644);
> @@ -256,8 +252,6 @@ static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
>  
>  	registry_par->enable80211d = (u8)rtw_80211d;
>  
> -	strscpy(registry_par->ifname, ifname, sizeof(registry_par->ifname));
> -
>  	registry_par->notch_filter = (u8)rtw_notch_filter;
>  
>  	registry_par->reg_enable_tx_power_limit = (u8)rtw_tx_pwr_lmt_enable;
> @@ -784,9 +778,8 @@ int rtw_drv_register_netdev(struct adapter *if1)
>  {
>  	struct dvobj_priv *dvobj = if1->dvobj;
>  	struct adapter *padapter = dvobj->padapters;
> -	char *name = if1->registrypriv.ifname;
>  
> -	return _rtw_drv_register_netdev(padapter, name);
> +	return _rtw_drv_register_netdev(padapter, "wlan%d");
>  }
>  
>  static int _netdev_open(struct net_device *pnetdev)
> -- 
> 2.47.3

Close, but really, why are we saying "wlan" at all?  Why not use the
default wifi network naming like it is supposed to be using?  The whole
callpath here that sets the device name can probably be removed as the
networking core should handle that for us, right?

thanks,

greg k-h
