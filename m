Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DB2289E13;
	Wed,  2 Sep 2026 05:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788328770; cv=none; b=u/1Q9oIqKuJESqnBjIkokDKVBqzLe2JkrSsUjGV6Iw1ntRqc7FwmWVdZCKD3/JOvP3IvOIjygwZybKDr2Q/z5ZQaULyMBu19CHRhqCEcRCFQIbGRUaFMdJ98zrb0h7g3j0ooidzDbwRy6ylTIEGCRjNWkCFVQKlMXVzayEorUFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788328770; c=relaxed/simple;
	bh=hSjycETpEiezuq0wa0gvS2HTUFVX+3lHEhW9MiCtjLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUHEWX6s153vLZjnuSWeDRgeMW94+u0rR/Q535xIW47BNCrzknuDhFDkKRKoS/JpYvlPP/XHzYYnPOxvTM/zUUJmIgQSGU5BzMxgyBMpWJXMkNtbKnvqmbZk/F/tWI9T120hnqoTParCi9fAuSvnyQ86SqPw/sMB1u7gyaVfdSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fhRK9iLr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fhRK9iLr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B823D1F000E9;
	Wed,  2 Sep 2026 05:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788328769;
	bh=ZLTKGxKqjORoVfFcIWPp93qqPnlO5CxQ3JUm52loQDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fhRK9iLrg30je3lLiobyJZ21pid2xsJqBCFBkTxktHm1bvLmIpR1Vl51ZjevCJd5E
	 HV5lm4xEwy5o9R4u2vJ+M6aNj40N0chS5L0wjsZ9NTSNMCUZ+44AOqLpxG+IERPzxC
	 +HLYxSpRLkzLegk/YGAoU6DOXrjvC4b0/XwfqaN0=
Date: Wed, 2 Sep 2026 07:59:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: Remove manual ifname allocation
Message-ID: <2026090206-cadillac-jolt-f182@gregkh>
References: <20260901173923.4810-1-nsvatoslav515@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901173923.4810-1-nsvatoslav515@gmail.com>

On Tue, Sep 01, 2026 at 08:39:22PM +0300, Svyatoslav Nikolenko wrote:
> The manual ifname allocation via dev_alloc_name() is redundant because
> the networking core handles interface naming automatically during
> register_netdev().
> 
> Remove the ifname module parameter, the corresponding field from
> struct registry_priv, and the rtw_init_netdev_name() callpath.
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/drv_types.h |  2 --
>  .../staging/rtl8723bs/include/osdep_intf.h    |  1 -
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 27 +++----------------
>  3 files changed, 3 insertions(+), 27 deletions(-)
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
> diff --git a/drivers/staging/rtl8723bs/include/osdep_intf.h b/drivers/staging/rtl8723bs/include/osdep_intf.h
> index 83a25598e962..f1e7a303a286 100644
> --- a/drivers/staging/rtl8723bs/include/osdep_intf.h
> +++ b/drivers/staging/rtl8723bs/include/osdep_intf.h
> @@ -20,7 +20,6 @@ u32 rtw_start_drv_threads(struct adapter *padapter);
>  void rtw_stop_drv_threads(struct adapter *padapter);
>  void rtw_cancel_all_timer(struct adapter *padapter);
>  
> -int rtw_init_netdev_name(struct net_device *pnetdev, const char *ifname);
>  struct net_device *rtw_init_netdev(struct adapter *padapter);
>  void rtw_unregister_netdevs(struct dvobj_priv *dvobj);
>  
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> index dd0c5fc813c8..5659d67a32f4 100644
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
> @@ -405,18 +399,6 @@ static const struct net_device_ops rtw_netdev_ops = {
>  	.ndo_get_stats = rtw_net_get_stats,
>  };
>  
> -int rtw_init_netdev_name(struct net_device *pnetdev, const char *ifname)
> -{
> -	if (dev_alloc_name(pnetdev, ifname) < 0) {
> -		pr_err("dev_alloc_name, fail for %s\n", ifname);
> -		return 1;
> -	}
> -	netif_carrier_off(pnetdev);
> -	/* rtw_netif_stop_queue(pnetdev); */
> -
> -	return 0;
> -}
> -
>  struct net_device *rtw_init_netdev(struct adapter *old_padapter)
>  {
>  	struct adapter *padapter;
> @@ -752,14 +734,12 @@ u8 rtw_free_drv_sw(struct adapter *padapter)
>  	return _SUCCESS;
>  }
>  
> -static int _rtw_drv_register_netdev(struct adapter *padapter, char *name)
> +static int _rtw_drv_register_netdev(struct adapter *padapter)
>  {
>  	int ret = _SUCCESS;
>  	struct net_device *pnetdev = padapter->pnetdev;
>  
> -	/* alloc netdev name */
> -	if (rtw_init_netdev_name(pnetdev, name))
> -		return _FAIL;
> +	netif_carrier_off(pnetdev);
>  
>  	eth_hw_addr_set(pnetdev, padapter->eeprompriv.mac_addr);
>  
> @@ -784,9 +764,8 @@ int rtw_drv_register_netdev(struct adapter *if1)
>  {
>  	struct dvobj_priv *dvobj = if1->dvobj;
>  	struct adapter *padapter = dvobj->padapters;
> -	char *name = if1->registrypriv.ifname;
>  
> -	return _rtw_drv_register_netdev(padapter, name);
> +	return _rtw_drv_register_netdev(padapter);
>  }
>  
>  static int _netdev_open(struct net_device *pnetdev)
> -- 
> 2.47.3
> 
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
