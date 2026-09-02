Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1273D3EF672;
	Wed,  2 Sep 2026 08:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338654; cv=none; b=LLfBNW63I+Xtso/UC8t+CfGYHX1s7167fxB5rqa8jlPHQE9MYPlGDTHaesijuSe0W9NDIuyvW1oNpmKliQZALh7zxMbcliDnsHQjYgZI65RSly0XjrFEH/xFiluncxhz5xThAWPYeF3Gy3uQ/rEa1v1QQlUCkg7F2f0KjBdqT5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338654; c=relaxed/simple;
	bh=lCoBEMlff5Auz57YxDh9JBNOSydIaKH8TZ4hRCNSuP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAE2kvqeJkReqtWPPXzSYGjt2tOPoh4a4Zb11+YvhlZ4jUGSxfoDqEmDyQefxxb2myUJmuKNQJ/4XI3EhWMZ70wCBobJF5opaiFP+KkVNZ2vxp7D3CVsw6wvoeQN99ckDgrVGvIjR0J/I+SWn2omlxLxs/tIEA72xCQGnAv7+YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rY9vv3wq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rY9vv3wq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868FA1F00A3A;
	Wed,  2 Sep 2026 08:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788338651;
	bh=cytWB5Fly1ChXea/TTHmc4JiYhsXUIjy8yqAYje2/8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=rY9vv3wqH55REvzMZPR42QWVATOlj/GDHIuth+YZGRpwCUS8bH7Ij8A9tvQAF6bsx
	 whth2fHQODsqybUAMEj2mGtD7EoCu+OhrBmiRJxPLj+pNOBXmOc0J3Ov6W4gal8az1
	 XJNFwdCFLmX56sOup9UrfwtifmWF5xsTYgY82TBo=
Date: Wed, 2 Sep 2026 10:42:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: longlong yan <yanlonglong@kylinos.cn>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org,
	skhan@linuxfoundation.org, i@zenithal.me, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: usbip: add NULL check after calloc()
Message-ID: <2026090249-poking-monorail-0d2d@gregkh>
References: <20260902070932.1440-1-yanlonglong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902070932.1440-1-yanlonglong@kylinos.cn>

On Wed, Sep 02, 2026 at 03:09:31PM +0800, longlong yan wrote:
> Two calloc() calls in the usbip driver lack NULL return checks, leading
> to potential NULL pointer dereferences on allocation failure:

This is in userspace, not in the "driver".

And how do you get a failure for calloc() in userspace?

> 1. usbipd.c do_standalone_mode(): the allocated `fds` array is
>    immediately dereferenced in the following for-loop via fds[i].fd
>    without checking for NULL.
> 
> 2. usbip_host_common.c usbip_exported_device_new(): the allocated
>    `edev` is immediately dereferenced via edev->sudev without checking
>    for NULL.
> 
> Add NULL checks after each calloc(), returning -1 in do_standalone_mode()
> and using the existing goto err path in usbip_exported_device_new(),
> consistent with the error handling already present in both functions.
> 
> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
> ---
>  tools/usb/usbip/libsrc/usbip_host_common.c | 2 ++
>  tools/usb/usbip/src/usbipd.c               | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/tools/usb/usbip/libsrc/usbip_host_common.c b/tools/usb/usbip/libsrc/usbip_host_common.c
> index 01599cb2fa7b..8ad367e09e78 100644
> --- a/tools/usb/usbip/libsrc/usbip_host_common.c
> +++ b/tools/usb/usbip/libsrc/usbip_host_common.c
> @@ -71,6 +71,8 @@ struct usbip_exported_device *usbip_exported_device_new(
>  	int i;
>  
>  	edev = calloc(1, sizeof(struct usbip_exported_device));
> +	if (!edev)
> +		goto err;
>  
>  	edev->sudev =
>  		udev_device_new_from_syspath(udev_context, sdevpath);
> diff --git a/tools/usb/usbip/src/usbipd.c b/tools/usb/usbip/src/usbipd.c
> index 3e22b651c754..cc707dea2882 100644
> --- a/tools/usb/usbip/src/usbipd.c
> +++ b/tools/usb/usbip/src/usbipd.c
> @@ -544,6 +544,10 @@ static int do_standalone_mode(int daemonize, int ipv4, int ipv6)
>  	dbg("listening on %d address%s", nsockfd, (nsockfd == 1) ? "" : "es");
>  
>  	fds = calloc(nsockfd, sizeof(struct pollfd));
> +	if (!fds) {
> +		err("calloc for fds");
> +		return -1;

I don't think you tested this :(

You leak stuff here, right?

thanks,

greg k-h
