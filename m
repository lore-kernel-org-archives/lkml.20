Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD88377553;
	Tue,  1 Sep 2026 09:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256144; cv=none; b=D66Tbk4KtJ89XQC3JCnpzVl9IjFlMYUw6VI6V9JfwcH8vuPKdYTEwpmzaT6R2Rh0V5tCr1jHimYqv3QF3atJFULbqfzNCwMEiNsh7Kmvwq5KJ28YxnzPMphy4JCYT2bOZxc+J+8E6QLpz+SMGwYMTpsurcmZIwX9pjvcYa1wyk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256144; c=relaxed/simple;
	bh=UVX0KBf3ApwxZY8p4rqs4udY2EoQtenM+JvnVDrDsCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Joks+6MhTmeXtxleTa8eEdKpnI5SuYNNHUCCBq8qDcAt7kP/z9BWVakWo31vTLL8o5rTaK2FNK4sUnbgF14GOQqgTKVOM9bUrrSxAEOI/L2jhtd2DV8xVpqQffLsoRks6/45kojCLvE9v+aUDPte9vDR3nrettUAAY2DkCSiDxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lQbVlc2x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lQbVlc2x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E971F000E9;
	Tue,  1 Sep 2026 09:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788256141;
	bh=eioGlH9qaWUGFtsGS+cAvYgq1xcxQUWu/p70MSWtF/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lQbVlc2xn9DMO+662HZBNSCAHlFvhZpsxIU7PpI+P/xc0yVShKQP/UuYyvcyfscIZ
	 Gj6iCr7Y+c1UykgRZHI6lTBMbXvDpPc8v/vD1eegExL4obpOqA3oLHcEVjYG+Nolox
	 HqZyVb5N5DkhV8bU/zBYVOaeHE32BUZ/t2WiPZcM=
Date: Tue, 1 Sep 2026 11:48:57 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mohit Mishra <mishraloopmohit@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: gbphy: use sysfs_emit() instead of
 sprintf()
Message-ID: <2026090144-showplace-strum-df62@gregkh>
References: <20260808171302.72231-1-mishraloopmohit@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808171302.72231-1-mishraloopmohit@gmail.com>

On Sat, Aug 08, 2026 at 10:43:02PM +0530, Mohit Mishra wrote:
> protocol_id_show() uses sprintf() to format sysfs output into the page
> buffer. Convert it to sysfs_emit(), which is the preferred helper for
> sysfs show() callbacks as it enforces page boundary checks.
> 
> Similar conversions have already been made elsewhere in this subsystem
> (e.g. loopback.c, arche-platform.c).
> 
> Signed-off-by: Mohit Mishra <mishraloopmohit@gmail.com>
> ---
>  drivers/staging/greybus/gbphy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
> index bdb0f5164a6f..bb9a5b538e6e 100644
> --- a/drivers/staging/greybus/gbphy.c
> +++ b/drivers/staging/greybus/gbphy.c
> @@ -31,7 +31,7 @@ static ssize_t protocol_id_show(struct device *dev,
>  {
>  	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
>  
> -	return sprintf(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
> +	return sysfs_emit(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
>  }
>  static DEVICE_ATTR_RO(protocol_id);
>  
> -- 
> 2.43.0
> 

Please see the mailing list archives for why this type of patch keeps
getting rejected.

sorry,

greg k-h
