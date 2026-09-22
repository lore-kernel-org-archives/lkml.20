Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B34943CE6A;
	Tue, 22 Sep 2026 14:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088223; cv=none; b=rNrCar0U7xT+UCt+hbaZHMKTqR+mBX3V2TAWHAUSqg3JCl16gdBIaq+rARkg0EOb6B2Y1B5aDWBO3v8vfXlajv24MPKYNxbDZsYr6Xy/vhYFTfVwQJvBB3Unwiar4a4hqQ1Vl0ZT5X8RZawCBSi37m+5udaXhwFbuOQXOuUhFHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088223; c=relaxed/simple;
	bh=ZZ5YsoO0wKmG0qkJVNK9P4BfowsWg71DnQ4B4AgeaRk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AbZgH0mgEYkcpNA9D4sWu6EZD4HdbLFxWWdVbJ3CoHiPd2TJ5WJfqx4yBK3RwEkZ6pyz3sriygwpYW3xspZ6BwKZ+II1kuSGQw3hteepAsJBLvxw+zmIkVMN4sosvWwFvU/2Pgm4IUMOR+3inGykZr197R/vWp47HObKbehtBWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lVF02zhP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lVF02zhP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12EDE1F000FF;
	Tue, 22 Sep 2026 14:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790088222;
	bh=gHzF75XdTs6MbHKqbGV35txxoFyBMCdBJn6+0UC0TT8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=lVF02zhPBMqZgnO9M3tcjWZfKX0YV+vZl0ehkRJAfGJMQvEYy9NDis2KBc2Cin3re
	 Xhs5q0PrbyXf2wTzIzzpreY/kBkVofsRYOqNMkyJ0MAkiFP2SWvTmtm66MCCwIwRQV
	 h0lkJyYWltSyCTJLmP6I8p+Ez3d08s1qZJPl8XQQ8HL2g7sEeHD5cNo/0agpHWklBK
	 XC+h6zZtYXdczeTYKkoJ/WFr2EUv9VljYMdLDd1QJdbFk96RzFxcOrZQCCsl3uN+6G
	 6pNa0dR79BJ/ZkfxAfAqpSkwEGXm7Tvd0cQ52bQpI3k4b2FfcQjsCDspruyPtqRB0/
	 OpL7ETBexiWuQ==
Message-ID: <da233f60-1109-487a-8e40-2dc34187bb44@kernel.org>
Date: Tue, 22 Sep 2026 16:43:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: cx231xx: don't free the media device on err_analog
To: Farhad Alemi <farhad.alemi@berkeley.edu>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CA+0ovChNv1=1dfdKxSXnBN0KVC6eO6kZqTFTsozOoJYCvT8T4g@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CA+0ovChNv1=1dfdKxSXnBN0KVC6eO6kZqTFTsozOoJYCvT8T4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/09/2026 07:48, Farhad Alemi wrote:
> When cx231xx_register_analog_devices() fails, cx231xx_init_dev() jumps to
> err_analog and calls cx231xx_unregister_media_device(), which frees
> dev->media_dev while dev->v4l2_dev.mdev still aliases it. The next line,
> cx231xx_release_analog_resources(), releases the video device, so
> v4l2_device_release() takes the freed media device's graph_mutex in
> media_devnode_remove(). Remove that free from err_analog and leave it to
> cx231xx_usb_probe(), which frees the media device at err_v4l2, after
> cx231xx_release_analog_resources() has released the video devices and
> v4l2_device_unregister() has dropped the subdevs.
> 
> Signed-off-by: Farhad Alemi <farhad.alemi@berkeley.edu>
> ---
> The device was emulated.
> 

This patch doesn't apply, you're missing a
---

line here.

> --- a/drivers/media/usb/cx231xx/cx231xx-cards.c
> +++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
> @@ -1505,7 +1505,7 @@ static int cx231xx_init_dev(struct cx231xx *dev,
> struct usb_device *udev,

And this is mangled.

You need to get your mail settings sorted first so it doesn't mess up
patches.

Regards,

	Hans

> 
>  	return 0;
>  err_analog:
> -	cx231xx_unregister_media_device(dev);
> +	/* dev->v4l2_dev.mdev aliases media_dev until probe's err_v4l2 frees it. */
>  	cx231xx_release_analog_resources(dev);
>  	cx231xx_remove_from_devlist(dev);
>  err_dev_init:
> 

