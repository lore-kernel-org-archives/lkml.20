Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F7B30C372;
	Wed, 30 Sep 2026 08:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757529; cv=none; b=K4+YVOvgMjBm/T/RXBuGBwWgLcMTAW847hqsvEDdckQIXfD2ka55BJslNY/AiumCbeaHwuulJW01tI+mQv5/oOfhQXGK2FnEh3fhZAHQNZgOm6ybpdtGUO2mhtSb9BDyR7bbCyubx/tToBf+Vj8c9LCnVbdYR93chPQstpeSDEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757529; c=relaxed/simple;
	bh=X6cwC2768R8GYJGuNzoGDEZmYz9zrKHDA/Pb+h+aaRs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PYNPiHWx2peu9BHq9XEcMRt3KtIQBlLWyFyrXurbcNYBTlIO1P1ugnHKHLQcgq7b99mHYOkI/+X9LcdaB4NMClXELVfwoG7oO8f3TA7rMbm9oq7GG/Mf/JjfoSsCgSVxHhXSAwNMSdDoCYrT18rh0uJenR6AtLreaVB5facP6pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7lTXtTt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7lTXtTt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CA51F000FF;
	Wed, 30 Sep 2026 08:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790757528;
	bh=HM0D/IFbXngbw/hJ7nNr3KZZh5bVISdKNKvas5WtV/0=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=F7lTXtTtqQlw3yxli0dz+G4nbnfkygOkq/zwMfdhCEIu2LUgnBSa4bpTPmR9lF0sQ
	 Go+vS/8j6oBp3HuU4Xz6oMWyG7dF3xxvTUQMwmo9YXdOkemO8BcMZAVtxdQ+A6/Hdc
	 9z2lQcetyu1A9XvrXeU2O9LgZRtLtgtRnLUHiq26fbAMvtuJCV//Cq686HQKHLK92O
	 2jjyE53uQnhlLXRqGkuMpK003IZbIeGnP3cHXOWftyPoHAKZDVCuVPuWffkOyBgDNL
	 SyTUbEfKMLIr610WRE38KIWzKv2iV5doD1BO9qUCSDrUtcgP+4hcBEatRn6BZ2nI97
	 /mvTxeD4Z434w==
Message-ID: <e28e00ff-0e66-493a-88fb-71b05b253c44@kernel.org>
Date: Wed, 30 Sep 2026 10:38:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hverkuil+cisco@kernel.org
Subject: Re: [PATCH] media: usbtv: fix use-after-free and lockdep panic on
 unbind
To: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 johan@kernel.org, lgs201920130244@gmail.com, kees@kernel.org,
 fsimonce@redhat.com, lkundrak@v3.sk,
 syzbot+ed3ed4f52d1fb6a7367d@syzkaller.appspotmail.com
References: <20260927180745.2721-1-nsvatoslav515@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260927180745.2721-1-nsvatoslav515@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/09/2026 20:07, Svyatoslav Nikolenko wrote:
> When a usbtv device is unplugged or unbound, a lockdep panic and
> use-after-free occurs in the driver core.
> 
> The sequence of events leading to the crash is:
> 1. device_release_driver_internal() acquires dev->mutex.
> 2. usbtv_disconnect() is called, which in turn calls usbtv_video_free().
> 3. usbtv_video_free() prematurely calls v4l2_device_disconnect() and
>    v4l2_device_put().
> 4. This drops the final reference on the parent USB device (intf->dev),
>    triggering synchronous device deletion while the USB core is still
>    holding dev->mutex.
> 5. When the core attempts to unlock dev->mutex, it operates on freed
>    memory, causing a lockdep panic.
> 
> Furthermore, usbtv_disconnect() continues to access usbtv->udev after
> usbtv_video_free() returns, leading to a direct use-after-free.
> 
> Fix this by removing the manual v4l2_device_disconnect() and
> v4l2_device_put() calls from usbtv_video_free(). This allows
> usbtv_video_free() to safely unregister the video node without destroying
> the underlying structures. The final v4l2_device_put() at the end of
> usbtv_disconnect() will now correctly trigger usbtv_release()
> asynchronously, safely dropping the parent device reference only after all
> system locks are released.
> 
> As a result of this cleanup, the dummy v4l2_device_get() previously used
> to prevent premature deletion in the usbtv_probe() error path is no longer
> needed and has been removed.
> 
> Fixes: a3550ea665ac ("[media] usbtv: split core and video implementation")
> Reported-by: syzbot+ed3ed4f52d1fb6a7367d@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=ed3ed4f52d1fb6a7367d
> Tested-by: syzbot+ed3ed4f52d1fb6a7367d@syzkaller.appspotmail.com
> Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>

Can you rebase on top of https://gitlab.freedesktop.org/linux-media/media-committers, 'next'
branch?

I wonder if the previous patch cb705f75d03e ("media: usbtv: fix null-pointer
dereference on disconnect") didn't already fix this.

Regards,

	Hans

> ---
>  drivers/media/usb/usbtv/usbtv-core.c  | 3 ---
>  drivers/media/usb/usbtv/usbtv-video.c | 3 ---
>  2 files changed, 6 deletions(-)
> 
> diff --git a/drivers/media/usb/usbtv/usbtv-core.c b/drivers/media/usb/usbtv/usbtv-core.c
> index 4f10f6613bc4..8a68bc0aa884 100644
> --- a/drivers/media/usb/usbtv/usbtv-core.c
> +++ b/drivers/media/usb/usbtv/usbtv-core.c
> @@ -112,9 +112,6 @@ static int usbtv_probe(struct usb_interface *intf,
>  	return 0;
>  
>  usbtv_audio_fail:
> -	/* we must not free at this point */
> -	v4l2_device_get(&usbtv->v4l2_dev);
> -	/* this will undo the v4l2_device_get() */
>  	usbtv_video_free(usbtv);
>  
>  usbtv_video_fail:
> diff --git a/drivers/media/usb/usbtv/usbtv-video.c b/drivers/media/usb/usbtv/usbtv-video.c
> index 92bc7a2509c3..9e02038c3ff7 100644
> --- a/drivers/media/usb/usbtv/usbtv-video.c
> +++ b/drivers/media/usb/usbtv/usbtv-video.c
> @@ -964,7 +964,4 @@ int usbtv_video_init(struct usbtv *usbtv)
>  void usbtv_video_free(struct usbtv *usbtv)
>  {
>  	vb2_video_unregister_device(&usbtv->vdev);
> -	v4l2_device_disconnect(&usbtv->v4l2_dev);
> -
> -	v4l2_device_put(&usbtv->v4l2_dev);
>  }

