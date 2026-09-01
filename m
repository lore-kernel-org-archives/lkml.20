Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BAF47A0B5;
	Tue,  1 Sep 2026 10:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257153; cv=none; b=a2BFcbZ6K6B4wvXW/ZgS4OMc4/y+dbzGKsJaRJJa6K4lXu1Qj9LvZZnSxChOLwIhbexDuy8IjTKOWbfsywnQncOzh37ir6CR7SuBAnghkfetc0HPCMOcEgcFSuO1WrTvcvvduEHEjfjnrr/R7AHTrELLrZlY7A8b9D/DuiPDaNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257153; c=relaxed/simple;
	bh=l8OwivwiprVwwZWkmd3SDFzNiAnLNf8AzdgFwBcwQBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iL89BnXOEzAdrQ/e7o9ZGB3X+mcTWOlard1/BA9IPGDJKK9TnEk3U6vye4oMBNFzNrs8j2TZcY1PG7GOZs4p4wJ0gityk6CLmVI/5iFRYIlToscmhgrGazQlCtaAprhnD3ra0LfiGqT90s4qipQmqEMYIF5UloE0cj523hvovPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VzWhgKev; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VzWhgKev"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF541F00A3E;
	Tue,  1 Sep 2026 10:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788257152;
	bh=Svk6hP5veRrECYj44NtuHy8dmOCbayoJJx1K+oDLuhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VzWhgKevYOLpNc+FxY5dSEcyMGkkmmp0sunD5Gh6v9QhffcpSYt2cIZ6boj0bEhPh
	 +N0nJfx+oQrPuEPoPJ4Cbsbg3CCT4sdLDTcNBusChRzqOjMeCkrcpxncFBsjD8xJMv
	 0N1WAgWZvB1ZyHt8J3pIVhbMDO5NFOwi6cd+CEIY=
Date: Tue, 1 Sep 2026 12:05:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: use sysfs_emit instead of sprintf in
 gbphy.c
Message-ID: <2026090135-subplot-robbing-8da8@gregkh>
References: <20260818-greybus-gbphy-sysfs-emit-v1-1-cfc81322e727.ref@yahoo.pl>
 <20260818-greybus-gbphy-sysfs-emit-v1-1-cfc81322e727@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818-greybus-gbphy-sysfs-emit-v1-1-cfc81322e727@yahoo.pl>

On Tue, Aug 18, 2026 at 07:35:54PM +0200, Tomasz Unger wrote:
> Per Documentation/filesystems/sysfs.rst, new implementations of
> show() methods should only use sysfs_emit() or sysfs_emit_at()
> when formatting the value to be returned to user space, since it
> is aware of the sysfs PAGE_SIZE buffer and includes sanity checks
> that sprintf() lacks.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Verified with checkpatch.pl - no errors or warnings.
> Compiled the gb-gbphy module successfully with CONFIG_GREYBUS=m
> and CONFIG_GREYBUS_BRIDGED_PHY=m (both previously disabled).
> Both greybus.ko and gb-gbphy.ko load without errors in a QEMU
> environment (verified via insmod and lsmod). This confirms the
> modules load cleanly but does not exercise the changed sysfs
> show() code path, which would require an actual Greybus device
> (or a userspace simulator such as gbsim) bound to the driver.
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
> 
> ---
> base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
> change-id: 20260818-greybus-gbphy-sysfs-emit-69739912458e
> 
> Best regards,
> --  
> Tomasz Unger <tomasz.unger@yahoo.pl>
> 
> 

Please see the archives for why this patch has been rejected in the
past.

thanks,

greg k-h
