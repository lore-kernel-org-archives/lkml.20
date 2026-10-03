Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F453537E5;
	Sat,  3 Oct 2026 15:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791040434; cv=none; b=bVtvnKpPT24Q7OVfy3a2KQLzvrLs62aN3aGNoBqjSEMhpHlvF3zLMQBHoPzYoeHNaJXfKl3VRDGoMseHqz3vGj4C4gdM5w8UY+57sMqL7L8RewlayKqurkhY5yCr3QXfNR5/zLZVPaSjgcdcrfe5iNf90wJ+YEaDYacBYaW43ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791040434; c=relaxed/simple;
	bh=T4c0f2Aipfl7sX7wzYNclnQN3TPbfQMxswmBwf5ak8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXGBOU7Xtk5yC6ZyZ9ge7E4bFYrkr+QVg/3vz6wGgNDX+yDO5XoAUwTYWDQTbHMjSgNJLPK45cnPGNXNvBgl8sLha5sv8lKe+mW6Z08e+ifiw/YeutMHaLk/DW1ga0Fi25f0RGC74kdwgc9uW7jHzRKTbpNB3W0YCE81XPqIHXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=otJ1qha+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="otJ1qha+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C3A1F0089B;
	Sat,  3 Oct 2026 15:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791040433;
	bh=S3eqM3iYPPLtATK1bqUv+2f1WGtjWo/CKk/4dtlGBnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=otJ1qha+e/xT6DaP9TdNjO3Omut/RmOylvJ3AdZtqvh81W6u+qcwtDU6ic2ncsHmb
	 UI8qLMYLYbzIRpBLjqqSITgLSrOPYXGwjCBqdNunlNgmB3uc9peJ5LM0/IiGXd1aiu
	 wMxnIbTNO0jwuqQvQPdmVvf/gM9iicW7f1f9kf54=
Date: Sat, 3 Oct 2026 17:13:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Serhat Kumral <serhatkumral1@gmail.com>
Cc: israel.a.cepeda.lopez@intel.com, hansg@kernel.org,
	sakari.ailus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: misc: usbio: Handle negative error code from
 usb_control_msg()
Message-ID: <2026100327-doornail-jaws-c582@gregkh>
References: <20261003142838.19019-1-serhatkumral1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003142838.19019-1-serhatkumral1@gmail.com>

On Sat, Oct 03, 2026 at 05:28:38PM +0300, Serhat Kumral wrote:
> The sizeof(*cpkt) is unsigned, so comparing "ret < sizeof(*cpkt)" promotes
> "ret" to unsigned and negative error codes from usb_control_msg() are
> not caught. Cast the sizeof to int so the error handling works.
> 
> Fixes: 121a0f839dbb ("usb: misc: Add Intel USBIO bridge driver")
> Assisted-by: LLM
> Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
> ---
> found by smatch:
> - drivers/usb/misc/usbio.c:187 usbio_ctrl_msg() warn: error code type promoted to positive: 'ret'
> 
>  drivers/usb/misc/usbio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/usbio.c b/drivers/usb/misc/usbio.c
> index fe093e7760d5..3f73f7c3d68a 100644
> --- a/drivers/usb/misc/usbio.c
> +++ b/drivers/usb/misc/usbio.c
> @@ -184,7 +184,7 @@ static int usbio_ctrl_msg(struct usbio_device *usbio, u8 type, u8 cmd,
>  	dev_dbg(usbio->dev, "control in %d hdr %*phN data %*phN\n", ret,
>  		(int)sizeof(*cpkt), cpkt, (int)cpkt->len, cpkt->data);
>  
> -	if (ret < sizeof(*cpkt)) {
> +	if (ret < (int)sizeof(*cpkt)) {

Ick, really?  There's no compiler check for this type of thing?

This whole function needs to be rewritten to use the "modern" control
message functions.  I gave it a go once, but it quickly got messy as
this is an abused function and it really should be massivly cleaned up.

Do you have the hardware for this to test changes?

thanks,

greg k-h
