Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B645499F16;
	Wed, 23 Sep 2026 12:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165576; cv=none; b=E30+MFVWPoLonCVBPjfbgcvbk5hyG9Z53HeS5EgBk4A+Wk6BgLwg3GpclaJCjJKYQeOw3l5CuZ/uV87EmsBOKI8D9vDUIeTydKVSvvaq6ZUbl2268NemLfi9Kvsah9CzwYb8ddBOEUvetPwlgzTgVYGCKgbeVWpotdMSIugA/Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165576; c=relaxed/simple;
	bh=yfhrC6SZkS1atb7RObq3qpfv+1+NTFBL39/vslHFaFs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=SfN05v+cvqmNH49GWTGQ+G/l6ZD91TDCexNEhlR05+3D0I62o2CDqqHuzGuvF9ccdTpBDBclJRJ1hfX7XXazwJVgu0ccO0bThFnYukJM5qhKdW8+VS9mW325XP6+Kr6vb1kBW+m4zAtUNazkRkQYKv7FwcyljlNvwDJtvX+Rqtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UN5mZW7e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UN5mZW7e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3301F000FF;
	Wed, 23 Sep 2026 12:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790165574;
	bh=dPW+/Yc46Pw7BA6P8sCwUIJ/WB8/jAfgXaJteSxBBD4=;
	h=Date:From:Subject:To:References:In-Reply-To;
	b=UN5mZW7emENRKKQTzMXql3OEKB2Q7577wEVIdD4U76XjeciaolyqrUJbn7a1/KSOU
	 OaBvM7I49DwF0liX4DEgRi2Nviy6MSnDqv/QRUt1a33YBhSFk4laVfmGx0NqCLYnGS
	 62nV/DC64Maf055QphL1WL5XrpCs+RISb9y/ZpsOUVRBxaHnBe0KYfbpbkA58wc7zk
	 8TTFfBoMJ7JSSgcSqwWsjVd2NuCLze8qfdndd7KM+to/5Jm3jGH9vV+tkfT1BmYbYS
	 5+DtGanNeLz/6Z4cZpCTUqGDEpMNZqEMAXTugGuHP4MrMPPzN3qrHmJo6FiYqZ2Rsd
	 Gc8nyUmcYM1jQ==
Message-ID: <32a27d02-a6fc-4006-8fb0-78061afa0f3d@kernel.org>
Date: Wed, 23 Sep 2026 14:12:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: em28xx: use video_unregister_device for radio_dev
To: Rohinthan P <rokinthanp03@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+f26bc23e42eeb548dee1@syzkaller.appspotmail.com
References: <20260923072050.24427-1-rokinthanp03@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260923072050.24427-1-rokinthanp03@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/09/2026 09:20, Rohinthan P wrote:
> Commit 7c8bf63b7937 ("media: em28xx: use vb2_video_unregister_device")
> converted device unregistrations in em28xx to use
> vb2_video_unregister_device() instead of video_unregister_device().
> 
> However, radio devices do not have an associated videobuf2 queue
> (v4l2->radio_dev.queue is NULL). Calling vb2_video_unregister_device()
> on a radio device triggers a WARNING in vb2_video_unregister_device():
> 
>     !vdev->queue
>     WARNING: drivers/media/common/videobuf2/videobuf2-v4l2.c:1264 at vb2_video_unregister_device+0x1f8/0x200
>     Call Trace:
>      em28xx_v4l2_init+0x1c39/0x3150 drivers/media/usb/em28xx/em28xx-video.c:3085
> 
> As documented in vb2_video_unregister_device(), video_unregister_device()
> should be used instead when vdev->queue is NULL.
> 
> Revert to calling video_unregister_device() for v4l2->radio_dev in both
> em28xx_v4l2_fini() and the em28xx_v4l2_init() error unwind path.

Good catch!

This is actually a fix for the 7.3-rcX mainline.

I'll handle this.

Regards,

	Hans

> 
> Fixes: 7c8bf63b7937 ("media: em28xx: use vb2_video_unregister_device")
> Reported-by: syzbot+f26bc23e42eeb548dee1@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=f26bc23e42eeb548dee1
> Signed-off-by: Rohinthan P <rokinthanp03@gmail.com>
> ---
>  drivers/media/usb/em28xx/em28xx-video.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
> index c418add..79af154 100644
> --- a/drivers/media/usb/em28xx/em28xx-video.c
> +++ b/drivers/media/usb/em28xx/em28xx-video.c
> @@ -2416,7 +2416,7 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
>  	if (video_is_registered(&v4l2->radio_dev)) {
>  		dev_info(&dev->intf->dev, "V4L2 device %s deregistered\n",
>  			 video_device_node_name(&v4l2->radio_dev));
> -		vb2_video_unregister_device(&v4l2->radio_dev);
> +		video_unregister_device(&v4l2->radio_dev);
>  	}
>  	if (video_is_registered(&v4l2->vbi_dev)) {
>  		dev_info(&dev->intf->dev, "V4L2 device %s deregistered\n",
> @@ -3082,7 +3082,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  		dev_info(&dev->intf->dev,
>  			 "V4L2 device %s deregistered\n",
>  			 video_device_node_name(&v4l2->radio_dev));
> -		vb2_video_unregister_device(&v4l2->radio_dev);
> +		video_unregister_device(&v4l2->radio_dev);
>  	}
>  	if (video_is_registered(&v4l2->vbi_dev)) {
>  		dev_info(&dev->intf->dev,

