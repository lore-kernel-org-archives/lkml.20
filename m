Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E5D313543;
	Tue,  1 Sep 2026 10:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257352; cv=none; b=NXZq01F1/8RevLEBKYbisyD6kJr17cZ5b/pCmCKA9Ogz2flX7pJOGvDRRCb9iDxvoMGPXXYsGsEB21fk+M2WATJTh+1bXovKIDjUmBJ0dSjxRutaPTprNjM1qQaHwnS/PaHsRAVwgzElc+SG5SAkjn5O559Okw6/YWTIVwvEHIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257352; c=relaxed/simple;
	bh=lBvRvUx38NoGosjNGpx7o+KN31KUtj0kc3nvz84NAvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U2KlFr9ORQRVISBUF5nHKy5dkljQ4HZaIaIu8O9zx3SZXwSayLTPy3J3gHj2iBUoe9uL64XtAQ9MpHh6r7B3I1zE8xoGKFIIT6PKFBWC3B/u8QiP6ayFlwL8IpKRUdJ/gUU9M4k6ClsKv7dMBPbQc7vVajNjdZV6WLPtpGWJVA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GWhLLNZq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GWhLLNZq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BC281F000E9;
	Tue,  1 Sep 2026 10:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788257351;
	bh=XOh5n9kE//yjlx3OBC2EABNkxL//DPBNHqP9vmJhGPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GWhLLNZqcGW0PApwuFD+EGiPFHBroMH2lju7n8Gg0T6dBL2GvA/0iGPeZhT5nB2PF
	 R5/JToWnqzXkOjv0/4JbyXiMfkU2L8uYGBNZG6QU4lN329qlmDxTQiS52BQPML+vHQ
	 PGJBygO3bJuVWr2AZ4xW5fbUk21rXWH5cZpwbNR4=
Date: Tue, 1 Sep 2026 12:09:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: use strscpy() for ifname copy
Message-ID: <2026090141-revenue-crawfish-0f8d@gregkh>
References: <20260826143418.5713-1-nsvatoslav515@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826143418.5713-1-nsvatoslav515@gmail.com>

On Wed, Aug 26, 2026 at 05:34:18PM +0300, Svyatoslav Nikolenko wrote:
> Replace snprintf() with strscpy() when copying ifname into registry_par
> to avoid unnecessary format specifier parsing.
> 
> Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> index f31196f54b3e..dd0c5fc813c8 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -256,7 +256,7 @@ static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
>  
>  	registry_par->enable80211d = (u8)rtw_80211d;
>  
> -	snprintf(registry_par->ifname, 16, "%s", ifname);
> +	strscpy(registry_par->ifname, ifname, sizeof(registry_par->ifname));
>  
>  	registry_par->notch_filter = (u8)rtw_notch_filter;

the ifname module option, and field, should just be removed from this
driver entirely.  Can you do that instead?

thanks,

greg k-h
