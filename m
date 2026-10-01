Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCE638DC62;
	Thu,  1 Oct 2026 12:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857625; cv=none; b=cegLsvZ4GCyYPg34nsqVvGaxHFWXi1aS4kOCk5OBR3ZCVaDACuWu2srauVPmvkjMFuIKmKAUz6DbIeklc72+PMA9kwKG153q8idRtNdNqXM3VXDx74583ufPrVAe/jaPM/Kp9jmRUigV9XJ51sprz85Hey++9gC7UZWEz2IHivQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857625; c=relaxed/simple;
	bh=CispzldoetnvLa8M6XB1V/uiqHkZ0um1GBQTaNPG/ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sc9esnDeUWdhMPceCDR6jrrr5EZqGrucj3tI15RQ4NQMHmm6opJDatN80uEX2XA3ut8yP4uO0iVAO4CbJxragmOvZ+Xu/e8eWBOL1dPq1aCulN6UIN4bIxzQGnfBbxshUZhW/6zXSgK6zMKxoGnkzjIDQ0DIayE1Y7NFl9WxNCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ECv3xFLH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ECv3xFLH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEFD31F000FF;
	Thu,  1 Oct 2026 12:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790857624;
	bh=A1GlyA95RuwpgDZTidpTzGiVDdLSXw/xWP+W9swCYz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ECv3xFLHwUYwTPYNoI9LE3XeFQKoe0rp1cLeLu335/iUKcP0A+cEVgJ9pqYyIusN0
	 Ut9N0wQc+AQq6G2Zodv991OaY6AcMXf7Uy1gGDBrvjbg2hMa1tPRhXBFLJtfcwzWZR
	 9bRrjq2T8nnd8CCmRrGwUidYUQGXdcWtDfqflqNI=
Date: Thu, 1 Oct 2026 14:26:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Timo Joannin <timo.joannin@gmail.com>
Cc: Jennifer Guo <guojy.bj@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Michael =?iso-8859-1?Q?Steinm=F6tzger?= <m.steinmoetzger@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Atharv Margur <atharvmargur@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: rename phy_status_rpt_8192cd_t to
 rtl8723bs_phy_status_rpt.
Message-ID: <2026100112-impotent-undiluted-d9de@gregkh>
References: <20261001121700.143861-1-timo.joannin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001121700.143861-1-timo.joannin@gmail.com>

On Thu, Oct 01, 2026 at 02:17:00PM +0200, Timo Joannin wrote:
> The struct identifier references the 8192CD chip while being in a
> rtl8723bs codebase. Additionally, the identifier uses the _t suffix,
> while being generally reserved for typedef identifiers.
> 
> Rename the struct to rtl8723bs_phy_status_rpt
> across the rtl8723bs driver to accurately
> reflect the codebase and clean up the naming.
> 
> Signed-off-by: Timo Joannin <timo.joannin@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/odm_HWConfig.c | 3 ++-
>  drivers/staging/rtl8723bs/hal/odm_HWConfig.h | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> index 34b0369a7936..bf2479c01873 100644
> --- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> +++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> @@ -105,7 +105,8 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
>  	bool is_cck_rate = false;
>  	u8 rf_rx_num = 0;
>  	u8 lna_idx, vga_idx;
> -	struct phy_status_rpt_8192cd_t *phy_sta_rpt = (struct phy_status_rpt_8192cd_t *)phy_status;
> +	struct rtl8723bs_phy_status_rpt *phy_sta_rpt =
> +		(struct rtl8723bs_phy_status_rpt *)phy_status;

Why is this pointer being cast from a structure type, to a u8 *, and now
back to the real structure again?  That's a mess, please propagate the
real structure type all the way through the call chain so that there is
no more casts needed.

thanks,

greg k-h
