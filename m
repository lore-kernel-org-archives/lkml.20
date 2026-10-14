Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87DC30DECB;
	Wed, 14 Oct 2026 04:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791953803; cv=none; b=AJAjd2KcGNnWNeaEy0F+clThWO8bfgreNeGJcUAOtSXu6gWTycuEB1cpFwHgunXtrZxhrIZylrgUIh7LQnP27SP1JC0wdOKpNF6unADDL1MJfAPoqnetLUBTBbnNhksp+GIN16Mfa7uJpQpDzShS80eEOaxuJQuibZWZCt1SRrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791953803; c=relaxed/simple;
	bh=PK9pDS/Uzm5xtfb9bKjtSO9O99Sfjv+FVdgVfeeVMMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mgA38jpaQJSoQSpspRk/4OQzKNIODXOAa4LfKf5eMYUhJW1EFYY5+kCgiR50nxAzyVVi/FrFYLqcBf7wCPNwfGQhmBS4nTf5tOvj9rjW+7CR+SoVTkdwA/Qm1xVGbH6c2OcEVCuWskNwhQToJZVMq2hAUCDNpTTJcWoZcEyYnGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QrdXqmmp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QrdXqmmp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F201B1F000FF;
	Wed, 14 Oct 2026 04:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791953802;
	bh=BSwxDfEz4BGnCfkuj2a9H4hjaljk7e/k5fwA+R+v4lw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QrdXqmmp0l4FnYOS5gBbo+Nnc9z16HaPjojTN180b72ZIJU5LSzA1zNgiyfhKjkDK
	 jMoyzKOXdov0F4VRq6OCchk7A4N65PgkZsJJr+YEB3THqKxFxD0SYDFGAQIf9SlNCt
	 FlBjltUpm7iFN17tD1xJ0UDDHjwC/Vw2u44EBXnI=
Date: Wed, 14 Oct 2026 06:56:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Timo Joannin <timo.joannin@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	error27@gmail.com, guojy.bj@gmail.com
Subject: Re: [PATCH v5 2/2] staging: rtl8723bs: unwind cast mess and remove
 phy_stat struct
Message-ID: <2026101434-deplored-unfocused-1be0@gregkh>
References: <20261013191503.152056-1-timo.joannin@gmail.com>
 <20261013191503.152056-3-timo.joannin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013191503.152056-3-timo.joannin@gmail.com>

On Tue, Oct 13, 2026 at 09:15:03PM +0200, Timo Joannin wrote:
> Propagate the real struct type all the way through
> the call chain to remove redundant casts to and from u8 *.
> 
> Remove redundant phy_stat struct, along with the dead function
> prototype rtl8723b_query_rx_phy_status() which referenced it.
> 
> Signed-off-by: Timo Joannin <timo.joannin@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/odm_HWConfig.c   |  5 +++++
>  .../staging/rtl8723bs/include/rtl8192c_recv.h  | 18 ------------------
>  .../staging/rtl8723bs/include/rtl8723b_recv.h  |  1 -
>  3 files changed, 5 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> index fb3a19da5de3..c0a079003e73 100644
> --- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> +++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> @@ -432,8 +432,13 @@ static void odm_Process_RSSIForDM(struct dm_odm_t *pDM_Odm,
>  }
>  
>  /*  Endianness before calling this API */
> +<<<<<<< HEAD
>  void odm_phy_status_query(struct dm_odm_t *dm_odm,
>  			  struct odm_phy_info *phy_info,
> +=======
> +void odm_phy_status_query(struct dm_odm_t *dm_odm,
> +			  struct odm_phy_info *phy_info,
> +>>>>>>> f52adf8 (staging: rtl8723bs: unwind cast mess and remove phy_stat struct)
>  			  struct rtl8723bs_phy_status_rpt *phy_status,
>  			  struct odm_packet_info *pkt_info)
>  {

I do not think you compiled this submission :(

