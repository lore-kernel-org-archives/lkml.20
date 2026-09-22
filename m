Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8966A559CA3;
	Tue, 22 Sep 2026 15:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790090735; cv=none; b=cp/VBRhhnGtbhz8QejlAuPBW0nL4gIIKiQbrvnFQXG/uFf0xxZztFoVpZ7NY1zQSIzY1saB0MSnOW9uxA4VC6IPCfvZEPQq2iMIRWjtVlxWUx36pr3d7+H/O7Z35CfQi0/bOeD97YaP+mNW9KO9itJLBOB5zvdDXa4T8P0e5n7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790090735; c=relaxed/simple;
	bh=eXwvSrn947RaZhU1ef5JaSq5I291UhojbgSspUVbEX8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RE2zDUwAmCfPqlaOQA//VJTZDuV5xU7VOQIGDVL5mh7WqtWEUiJINDi60LTufdAZzCAjp/2uP7iduaMzclxOA4UJcLly+wB3Z3WHLPgujssDdLTyzq3XSycGFfAfF5Q66NQJzu9Jqu4whqzRHQxUWEWFLA7rVSIP5kfhGiOpQJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CuTpb89x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CuTpb89x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7651F000FF;
	Tue, 22 Sep 2026 15:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790090734;
	bh=KSJ683uGfNg+FWeVxe5zMe2yBPzCa7cxhBOyuob1v0w=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=CuTpb89xP6BBMtYj1FHbTy/UkyOKn5q9To79fhDa1qWRwejmqgja3K0IAyELiaHiD
	 2FOH17gGvmhc6RbIK4AflZo/c8tTSTcMlMMdJBi//vMQFZz6F8yBAn2vldvzMPm6vC
	 De5pe1rEyQq73d+pdmmqVog8XvlafhPM+JNRw/JR8ifa9OvLbY5BSfLeB+29DLxQgJ
	 qteHrNQI46fpiF94VWEB7gl+nUznF4rKHlQBwjrX6K+L/INzVRjWnxvK6jXGnsfUIR
	 c49GsVY4EeRSRflBdSxajHB2r9HVR8rsDZGfcgWAv5hvgOHfEAehSpseB8EuRHfayb
	 VSDXtACawOQPA==
Message-ID: <09d2bb84-7077-4471-ab24-eaea2cb7a2ab@kernel.org>
Date: Tue, 22 Sep 2026 17:25:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2] media: cobalt: bound the dv timings to the descriptor
 buffers
To: Guo Zihao <guozh23@xiaopeng.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Liu Chao <liuc63@xiaopeng.com>
References: <20260920015924.750499-1-guozh23@xiaopeng.com>
Content-Language: en-US, nl
In-Reply-To: <20260920015924.750499-1-guozh23@xiaopeng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/09/2026 03:59, Guo Zihao wrote:
> The DMA descriptor buffers are sized from the maximum frame the driver
> supports:
> 
>         const size_t max_pages_per_line =
>                 (COBALT_MAX_WIDTH * COBALT_MAX_BPP) / PAGE_SIZE + 2;
>         const size_t bytes =
>                 COBALT_MAX_HEIGHT * max_pages_per_line * 0x20;
> 
> With COBALT_MAX_WIDTH 1920, COBALT_MAX_HEIGHT 1200 and COBALT_MAX_BPP 3
> that is 115200 bytes, or 3600 descriptors of 0x20 bytes each.
> 
> cobalt_s_dv_timings() however records whatever the subdevice accepts
> without checking it against those maxima:
> 
>         err = v4l2_subdev_call(s->sd, pad, s_dv_timings, 0, timings);
>         if (!err) {
>                 s->timings = *timings;
>                 s->width = timings->bt.width;
>                 s->height = timings->bt.height;
>                 s->stride = timings->bt.width * s->bpp;
>         }
> 
> descriptor_list_create() in cobalt-omnitek.c then walks the whole frame
> and writes one descriptor per scatterlist segment, with no upper bound of
> its own. An HDMI source at 4096x2160 with bpp 3 gives stride 12288 and
> size 26542080, which needs far more than the 3600 descriptors the buffer
> holds, so d[] walks off the end of the coherent allocation.
> 
> cobalt_try_fmt_vid_cap() and cobalt_try_fmt_vid_out() already cap width
> and height at 1920x1080, and this patch adds the same bound for the
> timings path plus a stride limit on the pixelformat path.
> 
> No Fixes tag. The descriptor sizing and s_dv_timings() both come from the
> initial driver, 85756a069c55 ("[media] cobalt: add new driver").
> 
> Reviewed-by: Liu Chao <liuc63@xiaopeng.com>
> Signed-off-by: Guo Zihao <guozh23@xiaopeng.com>

Rejected-by: Hans Verkuil <hverkuil+cisco@kernel.org>

The dv timings are checked in the subdevices code, so there is no
need to add the check here.

And bytesperline can definitely be larger than the width of the captured
video: in that case it will be composed into the larger buffer.

Regards,

	Hans

> ---
> v2: declare the local struct cobalt pointer in cobalt_s_dv_timings().
>     The cobalt_info() macro expands to v4l2_info(&cobalt->v4l2_dev, ...),
>     so the function needs a variable of that name, which the previous
>     version was missing. Found by the kernel test robot.
> 
>  drivers/media/pci/cobalt/cobalt-v4l2.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/media/pci/cobalt/cobalt-v4l2.c b/drivers/media/pci/cobalt/cobalt-v4l2.c
> index 51fd9576c..8ffee8ed6 100644
> --- a/drivers/media/pci/cobalt/cobalt-v4l2.c
> +++ b/drivers/media/pci/cobalt/cobalt-v4l2.c
> @@ -617,6 +617,7 @@ static int cobalt_s_dv_timings(struct file *file, void *priv,
>  				    struct v4l2_dv_timings *timings)
>  {
>  	struct cobalt_stream *s = video_drvdata(file);
> +	struct cobalt *cobalt = s->cobalt;
>  	int err;
>  
>  	if (s->input == 1) {
> @@ -630,6 +631,13 @@ static int cobalt_s_dv_timings(struct file *file, void *priv,
>  	if (vb2_is_busy(&s->q))
>  		return -EBUSY;
>  
> +	if (timings->bt.width > COBALT_MAX_WIDTH ||
> +	    timings->bt.height > COBALT_MAX_HEIGHT) {
> +		cobalt_info("timings %ux%u out of range\n",
> +			    timings->bt.width, timings->bt.height);
> +		return -EINVAL;
> +	}
> +
>  	err = v4l2_subdev_call(s->sd,
>  			pad, s_dv_timings, 0, timings);
>  	if (!err) {
> @@ -781,6 +789,14 @@ static int cobalt_try_fmt_vid_cap(struct file *file, void *priv,
>  		break;
>  	}
>  
> +	/*
> +	 * The DMA descriptor buffers are sized for at most
> +	 * COBALT_MAX_WIDTH x COBALT_MAX_HEIGHT, so limit the line stride
> +	 * accordingly.
> +	 */
> +	if (pix->bytesperline > COBALT_MAX_WIDTH * COBALT_MAX_BPP)
> +		pix->bytesperline = COBALT_MAX_WIDTH * COBALT_MAX_BPP;
> +
>  	pix->sizeimage = pix->bytesperline * pix->height;
>  	pix->field = V4L2_FIELD_NONE;
>  

