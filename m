Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E6A390C85;
	Tue, 29 Sep 2026 07:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790665490; cv=none; b=tzIyVt7Snp46RQZcGmy8A5bTk6o4l+F/hbLu5JssU33eNwd3ZIndoQLCbvUVpL8w4Xf4WkobEmN0W9BXdoX+oCizpxU9gj9x46cFp3TrQUZno7m4v/+aaXti9EUHYpILG3b8X8DUSt2/RqmCzuIohirrX37vJIk1jXzTp15nX5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790665490; c=relaxed/simple;
	bh=LRiNZ0PgF+p4KPYkdFl2kfIl2phZiqixNWOA0NRwLcs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hSXGOGK4ycdSnUGigmP/Eocb1iK56m8gsn4Sbd66MCfTxcfx6gSZxNzusGEYi8NzVquTzWX1xCZH+Vu4+mQBGRRhiZywelqAvu8mfRjFL0KuP3MlVK8CMqNI/EabgOJ6mJY8mEuei9rbP9bryX971LJfmRZBUI2RTatNKMCH6Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XldU8Ln7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XldU8Ln7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4491F000FF;
	Tue, 29 Sep 2026 07:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790665488;
	bh=2qKMY1x1duDIpfMguLIlsKcBdmxwyEv+EI2pLOyWOfE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=XldU8Ln7sNxg5k2xUAxca31wT/mlW1M1NttXvc8BhQeOhrNU9IUlGHWE3H0umACqW
	 E2MoBsf20EzAZyVTkTeIHkOeGSGZrMQ1uJTqgfaxcFKpwEXLM+UakBEwpkavt9rBPt
	 OtCzPOdz1MaDjmc80A1hrawN21HAZ/Ebg3z4floOZ/VDjt08lvWfQRHO1a34z8K7mX
	 H0bee2vbO5bRg1SjpOkRXJD5Z1RFywTmSoBjqfwRa+sNFrYrMGzfrzn/62iOujg9ms
	 BhvXZTjeE8df8UmWTz1InOcVY/NAd0CtW2WQUE/DNMvoGaemjQYnymy8wnV6j49yHv
	 rGeiaKpzbkZvw==
Message-ID: <f34e29d0-f679-4dfc-ab76-6005295a8e98@kernel.org>
Date: Tue, 29 Sep 2026 09:04:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2] media: v4l2-ioctl: zero the ext control built for
 VIDIOC_{G,S}_CTRL
To: Nick Rogers <nick@getfieldwork.ai>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Brian Daniels
 <briandaniels@google.com>, Alexandre Courbot <gnurou@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260925080206.45261-1-nick@getfieldwork.ai>
Content-Language: en-US, nl
In-Reply-To: <20260925080206.45261-1-nick@getfieldwork.ai>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/09/2026 10:02, Nick Rogers wrote:
> When a driver implements the extended control ioctls but has no control
> handler, v4l_g_ctrl() and v4l_s_ctrl() pass VIDIOC_G_CTRL and
> VIDIOC_S_CTRL on as a single struct v4l2_ext_control built on the stack.
> Only its id and value are set, and check_ext_ctrls() clears reserved[0]
> and reserved2[0]; the control's size and the rest of both structures are
> left uninitialized.
> 
> A driver that forwards the controls rather than handling them through
> the control framework sees that stack garbage. The virtio-media driver
> under review takes a nonzero size as a payload to copy from userspace,
> so VIDIOC_G_CTRL and VIDIOC_S_CTRL fail with -EINVAL through it whenever
> the stack is dirty. GStreamer's V4L2 encoders set their profile with
> VIDIOC_S_CTRL, and cannot negotiate against such a device.
> 
> Zero-initialize both structures.
> 
> Assisted-by: LLM
> Signed-off-by: Nick Rogers <nick@getfieldwork.ai>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
> Changes in v2:
> - Assisted-by: LLM, per Documentation/process/coding-assistants.rst
>   (Alexandre)
> - Collected Nicolas's Reviewed-by
> 
> v1: https://lore.kernel.org/all/20260923160936.33445-1-nick@getfieldwork.ai/
> 
> Alexandre asked whether drivers should fill the structure themselves.
> The core builds it and passes it down, and a driver can't tell a
> translated G_CTRL/S_CTRL from a real extended control call, so I think
> it's the core's to zero. He's right that virtio-media will meet kernels
> without this, though, so the driver now guards against it too:
> https://lore.kernel.org/all/20260925080140.44696-1-nick@getfieldwork.ai/
> 
> Found running the virtio-media v9 series [1] in a VMM with a host-side
> stateful encoder: GStreamer's v4l2h264enc fails to negotiate because
> VIDIOC_S_CTRL returns -EINVAL. Tested on 6.18 with that series applied:
> VIDIOC_G_CTRL and VIDIOC_S_CTRL now reach the device intact, and
> v4l2-compliance 1.30.1 reports the same results with and without this
> patch. Build-tested on media.git next (arm64, W=1, no new warnings).

This is the correct patch: these two struct need to be cleared in the
code. In fact, this needs a Fixes tag and a CC to stable. It's just a bug.
Never been caught since there are very few drivers that do not have a
control handler. The only driver without a control handler is uvc, and
that does the equivalent of QUERY_EXT_CTRL to determine if the control id
refers to a compound control (that uses the 'size' field) or not.

I verified that there are no other places in the kernel where v4l2_ext_control(s)
isn't cleared before use.

The virtio-media driver can try the same thing as uvc does: query the
control and check the flags field to see if it has a payload or not
(V4L2_CTRL_FLAG_HAS_PAYLOAD). That will work with any kernel.

In the meantime, this is just a plain bug fix.

Frankly, rather embarrassing. I'm pretty sure I wrote this, and I should have
known better...

Regards,

	Hans

> 
> [1] https://lore.kernel.org/all/20260917171921.2810550-1-briandaniels@google.com/
> 
>  drivers/media/v4l2-core/v4l2-ioctl.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 17ba1ae70..b7d248ab7 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -2357,8 +2357,8 @@ static int v4l_g_ctrl(const struct v4l2_ioctl_ops *ops, struct file *file,
>  	struct video_device *vfd = video_devdata(file);
>  	struct v4l2_control *p = arg;
>  	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
> -	struct v4l2_ext_controls ctrls;
> -	struct v4l2_ext_control ctrl;
> +	struct v4l2_ext_controls ctrls = {};
> +	struct v4l2_ext_control ctrl = {};
>  
>  	if (vfh && vfh->ctrl_handler)
>  		return v4l2_g_ctrl(vfh->ctrl_handler, p);
> @@ -2388,8 +2388,8 @@ static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops, struct file *file,
>  	struct video_device *vfd = video_devdata(file);
>  	struct v4l2_control *p = arg;
>  	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
> -	struct v4l2_ext_controls ctrls;
> -	struct v4l2_ext_control ctrl;
> +	struct v4l2_ext_controls ctrls = {};
> +	struct v4l2_ext_control ctrl = {};
>  	int ret;
>  
>  	if (vfh && vfh->ctrl_handler)

