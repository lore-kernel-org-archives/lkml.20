Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CE62BEFEB;
	Tue, 29 Sep 2026 14:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691530; cv=none; b=N92CSQavZGFiB9ChTIKs9eUflV/vVE6p1w8xCHMsOxUJTYz8VX8ZH/jHDFaJJ6MYYLJCBp6co1lZfXyVn84PVcyhNCnNryoy9mh4ycY5r5KM+JJUrYF+zoySQ4zmBTV6aSnIKvw9hVaqjs4e2/4DxWex1ECi99IyasUUjMLTb4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691530; c=relaxed/simple;
	bh=vV3dpOhH7E5KTP+X1/3hXr4cJ3NNA1N87N4qlOCmZK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ofv1PNkHkZJgxOxyUqxvFKKSaMGTizwXInOzoKl3vOU5rSb7Gv+LV1Wot2SV66S7w1Jk8iXcWtBwvjONCKRk+NCUBrnEN8siLmsye/NKw0aBkHU3AouBuBXtCnrzO5b53du8LGH9wxKNULl+Q51QatWWDS9ylvvYd7sRs865IGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HauA4Wbd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HauA4Wbd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48481F000FF;
	Tue, 29 Sep 2026 14:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790691529;
	bh=WHZHSX8cRu/7/N33fTuRJpkBnX/fMb/1SxVzpaZbqe4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HauA4Wbd8IIVvjR+dnKtbWAgqLHFacHuGPzIt5RXkCF+osvlaHzhm9z2uVXgihdKW
	 EsbdtoTz9gAoFqqu3Qr4/N4duOqPNk3555qRUoABxdQUPeOESsjP6l+lHa6AjViFAg
	 UqY5s/f/rWZpRrW83q2ZXHoHXTxF5sdVy+T+lfXADKhfqzRPMpeEGeyMKlVSeAsSCg
	 BfgHBqR1yotzMSyA8EwTKD2sSezHd+/h0Jm59aalB5xraXb13K9pWUar/gjrI37Vgv
	 RZGFtWv80Gnsbc+5DYk5GZEmN4XZZCKn2un8eRH1+HRi/1MiK0tZvlmQBTeC7sCZ30
	 pRHLzGt9sTMzw==
Message-ID: <a385d1e2-cca9-446e-b855-818fa61fb64a@kernel.org>
Date: Tue, 29 Sep 2026 16:18:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: Remove unused active field
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260630-uvc-remove-active-v1-1-ed1421b99429@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260630-uvc-remove-active-v1-1-ed1421b99429@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 30-Jun-26 12:28, Ricardo Ribalda wrote:
> The active field in struct uvc_streaming is not used anymore, drop it.
> 
> Reported-by: Hans de Goede <hansg@kernel.org>
> Closes: https://lore.kernel.org/linux-media/20260629-uvc-racemeta-v2-0-10e91d2afba0@chromium.org/T/#m3078f0d5fd71435b5cfacaa5c99f23a446db581f
> Fixes: c93d73c9c2cf ("media: uvcvideo: Use vb2 ioctl and fop helpers")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thank you for your patch.

I have merged this into:

https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/for-next/

Regards,

Hans


> ---
>  drivers/media/usb/uvc/uvc_video.c | 2 --
>  drivers/media/usb/uvc/uvcvideo.h  | 1 -
>  2 files changed, 3 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index fc3536a4399f..0167f0f8e846 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -2229,8 +2229,6 @@ int uvc_video_init(struct uvc_streaming *stream)
>  		return -EINVAL;
>  	}
>  
> -	atomic_set(&stream->active, 0);
> -
>  	/*
>  	 * Alternate setting 0 should be the default, yet the XBox Live Vision
>  	 * Cam (and possibly other devices) crash or otherwise misbehave if
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index b6bcee4a222f..021fd9af78b5 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -456,7 +456,6 @@ struct uvc_streaming {
>  	struct list_head list;
>  	struct uvc_device *dev;
>  	struct uvc_video_chain *chain;
> -	atomic_t active;
>  
>  	struct usb_interface *intf;
>  	int intfnum;
> 
> ---
> base-commit: 253355887a1ab0ac8f33b356c7c1140eee554d18
> change-id: 20260630-uvc-remove-active-8843181bcbb4
> 
> Best regards,

