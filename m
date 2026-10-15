Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB30C3DB630;
	Thu, 15 Oct 2026 08:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051720; cv=none; b=MpB8VFJHRNpwXnj+ZVlND72sh8tIjV4DobaM0HaaPa+K/eBb2KwHY0jsmyPuOQZyNuxCMVVrOwpycIxK548Vp/HwzzVlRLgvi1/P9Atjrh09LAxeJLGg5km1bZwt85tLBulpvafioLeAiqmk54eW35cvDXZdyzCxeKt6WGxu1lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051720; c=relaxed/simple;
	bh=bgbZxIcVkmv0C0YrU14gcGzeLaQ2QtER/owUOauL+Kk=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:Mime-Version:
	 References:In-Reply-To; b=GZetQbBhsbGby5KEzBUL3M/Y+SQQA09pCuFTre42nsMXORBkb2YPi5Ajkhdq+o0CUDwOcPubQA7rkLIG8dm6/cnMyuDDUwVWr+UmxYYPllTY7xvBEZ0k66i3hXzesSd84V5cwl1biE5LVuHm4O0d16B9Uyg8Ly1M6jfJK13NEp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EeVx7iOz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EeVx7iOz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3351F000C4;
	Thu, 15 Oct 2026 08:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792051719;
	bh=JAM6YcMDl0OW1joozjFNhkAtYZOpOhcmdyy2jB71aPM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=EeVx7iOz+gjpAnePRHBXg+JYSBR8gpviWTo7baNLQFQMHm03GAGMWr+RJBPsSnDLw
	 vYEd+oSVo6lIa88pWpT+XO4bYhXW9J6jK1WQDvx3Hu0JXSJC/YPfbCvS04hngmRZ/8
	 Ti8V3JjET0pQbSvHAwDSU7wE3KKk95wR0ASJyyFAltEHco9hW24JaLPqG6Klj1Wdzj
	 7sFI2ir/wNWjvMFr8b6cPdu+QybCY4dPS4TPK2AazjY7wM4cD+1v8alX9XRGIbJRBr
	 8KLfW+kx9bMWPwXTKVP0ecNjPR6+ZBC2yTjB03Z+WQkCJ/RHSvFnYdM7zcUV98Sch0
	 /+eUeNqZk+mLQ==
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 10:08:36 +0200
Message-Id: <DM59BD7BDUHZ.2BON4KMXDR086@kernel.org>
Subject: Re: [PATCH] USB: core: document purpose of interface parent
 reference
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Alan Stern"
 <stern@rowland.harvard.edu>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Johan Hovold" <johan@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261015074831.1418677-1-johan@kernel.org>
In-Reply-To: <20261015074831.1418677-1-johan@kernel.org>

On Thu Oct 15, 2026 at 9:48 AM CEST, Johan Hovold wrote:
> USB interfaces hold a reference to their parent USB device to make sure
> they do not outlive the parent.
>
> Add a comment explaining that this reference is specifically needed for
> asynchronous device resets and the device type need_parent_lock feature
> (to allow driver core to lock the parent when only holding a reference
> to the interface).
>
> See commits:
>
>   524134d42231 ("USB: don't cancel queued resets when unbinding drivers")
>   af61396a992b ("driver core: fix parent lock use-after-free on USB disco=
nnect")
>
> for further details.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

NIT: Maybe add that the reference count must be held until release().

In any case,

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

> ---
>  drivers/usb/core/message.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 276768f47558..a738d03c23ea 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -2209,6 +2209,11 @@ int usb_set_configuration(struct usb_device *dev, =
int configuration)
>  		pm_runtime_no_callbacks(&intf->dev);
>  		dev_set_name(&intf->dev, "%d-%s:%d.%d", dev->bus->busnum,
>  				dev->devpath, configuration, ifnum);
> +		/*
> +		 * Make sure the interface does not outlive its parent (e.g.
> +		 * as needed for usb_queue_reset_device() and
> +		 * usb_if_device_type->need_parent_lock).
> +		 */
>  		usb_get_dev(dev);
>  	}
>  	kfree(new_interfaces);
> --=20
> 2.55.0

