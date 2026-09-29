Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877024FD78A;
	Tue, 29 Sep 2026 16:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697926; cv=none; b=i/N5Ou5dmXZNhl3YmltM/1eBW+SgnUuWJ7nqxPETnqSAAzoQSwRI2kphYyo7IiU8r0+TZZA7ZXhXVmFX8LDUEFTCV8sqpbMpg87wQPM9ijX9Qad+1c14h56/Rpzxd/H/GKR3lt1HQb0lyisUr/PvmtispudOXc61/4ectSWbeeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697926; c=relaxed/simple;
	bh=McJ8z5XBo11cViQ+wyvp109B22XdP5gvjWylc4F7Rs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKtQcub0/XzXjZU7ErKsf8vpfCRsDoNLy/rT0MlvvpbpbVQTQSNAj138OZi1jHFnmpO7kdsqmDDTtFqjymKm+dpkfMVxU4C7lS/Cqgvnv1ri89YVAntMtNWlYsIN+GBd3B7TqBxyALylIJIiDptWcNuho7LJXaY387MDWoAOwzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RlPW8VJ1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RlPW8VJ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEFF81F0089A;
	Tue, 29 Sep 2026 16:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790697916;
	bh=OGn63YaPShNrl1yPLo3koVX6LHPw+HKS2Nou9lHW8Ws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RlPW8VJ1sQqjB4hTsawkcrr/6s9j9Q/udhKoST5cGFnCscKfwCGZA0vMV182To5mc
	 J6/Ij+mI4EkzAGPP//9vUUL7ENIepc6f9vpzUALAXODu/gTaA8EKiIyBQdTIV6GVVs
	 ra1T6fGe6Mv05Jb1LH4q/mn8q3ojJ/G9FrqRdzY0=
Date: Tue, 29 Sep 2026 18:05:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Amirhossein Hajimohammadi <info@hajimohammadi.net>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: stop overreading monitor
 interface name
Message-ID: <2026092915-luxury-shush-6b29@gregkh>
References: <3B4B0B72-4DCE-4E40-9E87-732DCBAA4EAF@hajimohammadi.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3B4B0B72-4DCE-4E40-9E87-732DCBAA4EAF@hajimohammadi.net>

On Tue, Sep 29, 2026 at 07:18:11PM +0330, Amirhossein Hajimohammadi wrote:
> From: AmirHossein HajiMohammadi <info@hajimohammadi.net>
> 
> cfg80211 passes a NUL-terminated interface name. memcpy() always reads
> IFNAMSIZ + 1 bytes, even when the caller supplied a shorter string.
> 
> Use strscpy() to stop at the terminator and bound the write to the
> destination buffer.
> 
> Signed-off-by: AmirHossein HajiMohammadi <info@hajimohammadi.net>
> ---
> Changes in v3:
> - Add an explicit From header matching the Signed-off-by identity.
> 
> Changes in v2:
> - Send the patch inline instead of as a MIME attachment.
> 
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 4416d0ec1..8f5032844 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -2158,7 +2158,7 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str
>  		goto out;
>  
>  	*ndev = pwdev_priv->pmon_ndev = mon_ndev;
> -	memcpy(pwdev_priv->ifname_mon, name, IFNAMSIZ + 1);
> +	strscpy(pwdev_priv->ifname_mon, name);

But we are replacing str*() calls in the kernel with memcpy() calls
where it can happen, so why go backwards here?

What caused you to notice this change is needed?  Have you measured a
speed up in throughput with this change applied?  How was it tested?

thanks,

greg k-h
