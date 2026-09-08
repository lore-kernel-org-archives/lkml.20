Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1109F4B0483;
	Tue,  8 Sep 2026 09:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859870; cv=none; b=LTXx8NjbHkqUMPtAW2iSnoR6g+Tg1j2UoYQNT7heHW5ZypkyiPeWpp3QxXmCrFU2QlY3gs3OYqJGG2fj86akO9db3S3tXR+wKIUkQsFH6rGKdK7XnRQWcLfu0GCS3it0HOpTSuKAglQhmaQjwn/wVs4CMni1PKy/0J0VvplVlbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859870; c=relaxed/simple;
	bh=yOnLX36j/4ujdnyB14nUwTr0732mHAZEvF160LAhKLU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DEBqWj+MgvvZT9Z99TAQCNBwb7N0/nl4poNZgKTpimTO0OfVhyg1RRHOhRgOm1YBD2XXTYTyt0FQ+yUcQWhc4mleQrLBFEAOvVbrZiDn03vxQWColmUQMEWbxU//4QjUlO0RAmO5tJXN8m5oK9Ob41mn3I8BjnYNOF5VpRFROpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZXxtyPs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kZXxtyPs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF2E1F00A3A;
	Tue,  8 Sep 2026 09:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788859868;
	bh=LCbLMopeLLvtsdhshVDPfehS1p0XE7nBbHFPDawvmek=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=kZXxtyPsaBwMNrjMJAEvbkTU0YwEqVWZJyMQ8Nxv8XBJ5/Wq1N5H7+6+0PgWpkD2q
	 JbJ70ctLkqjV/KCywYpcjAGERY1Zis3dmfmZDLF5gtz4NwqLYOiIn3Updee6Xbd2Lh
	 XZQRM3a7iLa6JXu5a55jbar1Cb5538Pu1Vzg2EtEOBgj/q1AXOqT1qDQoM+c3eS1F7
	 1jRpN+Zp6ces/n+uxwA8yP9UEBYpSSo+dbmhvc56St80cakB58y6WZVZZBZEr+2jdN
	 jT/RGSzDTgHyJ5YYi8AgskmNxszX1XyPy3+xZ9U4DHqjX2kIwcz10qBnlnPCkmXxtn
	 Id5yeRmA8pFvw==
Message-ID: <99dfefbd-4a9f-41c1-9b69-cc98019a5227@kernel.org>
Date: Tue, 8 Sep 2026 11:31:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: gspca: don't call stopN/stop0 after device
 disconnect
To: Deepanshu Kartikey <kartikey406@gmail.com>, hverkuil@kernel.org,
 mchehab@kernel.org
Cc: enelsonmoore@gmail.com, sakari.ailus@linux.intel.com, johan@kernel.org,
 hansg@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+537b5eb78cebbff5ea70@syzkaller.appspotmail.com
References: <20260830092712.19452-1-kartikey406@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260830092712.19452-1-kartikey406@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/08/2026 11:27, Deepanshu Kartikey wrote:
> gspca_stream_off() calls the sub-driver's stopN() and stop0()
> callbacks unconditionally. These issue USB requests using
> gspca_dev->dev, which becomes a dangling pointer once the USB device
> has been disconnected and freed, causing a use-after-free when the
> video device fd is closed after disconnect.
> 
> Add a gspca_dev->present check before calling stopN() and stop0(),
> matching the existing check already used for gspca_input_create_urb()
> in the same function.
> 
> Fixes: 1f5965c4dfd7 ("media: gspca: convert to vb2")
> Reported-by: syzbot+537b5eb78cebbff5ea70@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=537b5eb78cebbff5ea70
> Tested-by: syzbot+537b5eb78cebbff5ea70@syzkaller.appspotmail.com
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>

This is superseded by:

https://patchwork.linuxtv.org/project/linux-media/patch/20260813031235.2468144-1-shuangpeng.kernel@gmail.com/

That's the correct fix since it forces streaming off before freeing anything.

Regards,

	Hans

> ---
>  drivers/media/usb/gspca/gspca.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
> index 594d73e50b9f..5c33cf397f3d 100644
> --- a/drivers/media/usb/gspca/gspca.c
> +++ b/drivers/media/usb/gspca/gspca.c
> @@ -733,14 +733,14 @@ static void gspca_stream_off(struct gspca_dev *gspca_dev)
>  {
>  	gspca_dev->streaming = false;
>  	gspca_dev->usb_err = 0;
> -	if (gspca_dev->sd_desc->stopN)
> +	if (gspca_dev->present && gspca_dev->sd_desc->stopN)
>  		gspca_dev->sd_desc->stopN(gspca_dev);
>  	destroy_urbs(gspca_dev);
>  	gspca_input_destroy_urb(gspca_dev);
>  	gspca_set_alt0(gspca_dev);
>  	if (gspca_dev->present)
>  		gspca_input_create_urb(gspca_dev);
> -	if (gspca_dev->sd_desc->stop0)
> +	if (gspca_dev->present && gspca_dev->sd_desc->stop0)
>  		gspca_dev->sd_desc->stop0(gspca_dev);
>  	gspca_dbg(gspca_dev, D_STREAM, "stream off OK\n");
>  }

