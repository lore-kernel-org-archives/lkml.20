Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2871624DF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413207; cv=none; b=GpEbRnrK0qC0m6P4ZgBbIaPa4u7iuM3QeFWBW4Oz3WXt6PgM3KTAo32+ZJUQB3beI7qVHzwuHWokeeiWPpmLPTJ14ovRFlvBHt3h00jt7mZ4uzdxtSlj7zVCTVJ9fhJHaYtijGeGEmEBpE17YF+Uv0m/uBhmr0x4Za8nyDSpl4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413207; c=relaxed/simple;
	bh=WJi1Fbnve3yugH3orHFZtkb055nSBDhgYplZIXNMO5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IUx1SE/XI0wDGeX7jQ5eHm0KArcf41R1627D1ZWsEKJ2w0A4BnB4CwJ+2PdMQ2U0YnCMaAtJjCO3gGR5O/IX7pyuq1nDeUPxSDxKOR4jQ4sFvezlGwAzxqmkCObkd1cHzqpCLeFJFffISLeR9RaawQLeMCL7U0xu7qP7IHeVN54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tmw87YjO; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tmw87YjO"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c29667ed561so463250866b.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789413197; x=1790017997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hqdej+RgMgSucidUjrOgf3yS2QAbJ9JvkIgHYv7TT9U=;
        b=tmw87YjOcH4ugM9bMYFi6Pt3839GSjL8wXiETO7jGVYMz42Ab9Vu9scFHBbGPGILgU
         Z7/M5jOuZ/2XtjL7Gab7eAD5h/nJ6qQhoyS3eSqpapLXl94I33T/qZ4VxO4U4L2AghQ9
         lI7BYGhL4GrkipI9KcRwn2IyYqzCoi5paPQpPUxQtMjLgpl8BYvBIbZhrNbdxQpuJzOZ
         87Ztw6vsqZuGlFYwkYsc7Si9ejS+g5ENRSVo6oyLexyfJDsvB2KgohmJVVNl+DBehusB
         cGwOMFxUy9WtsO6AbtB5XiyBzrWPcrs+Pn2aKV7Iho/7fKtqrLIsiqyxiwhxgea/+UOX
         y4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789413197; x=1790017997;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hqdej+RgMgSucidUjrOgf3yS2QAbJ9JvkIgHYv7TT9U=;
        b=qUtZ1nL8EbhAFRBY+zaQTYxIWadfeyPtxnH1HwWe5bFK68XGTfPsmyBOAomivymY0M
         c5tZsZ9mvwmc/t7MslgYjjxLeryb9qItMnO/a9ATD9ll72jkW5EYP6wNlAY2xiHGsY/z
         YBaxECy86GbCMCBzc8WeAaAuS+Ln6i/k0E/sToFOAdYxUyghLhdWnqWptkad6yixVjk9
         WNvs7Ojk6XCaUhIT6ab1eNWdphIwxLutKE9qMRRunWFCfLC+SX1oQRbbJ9dE96LjgBlc
         iRGL7f65RWoGACc7T2B6O/6FB1SIiiI9KOPU1XZCFGM4qnO39FPgpwMP/rZ0ccE4DboR
         ti9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzAgZUCOYFd9EcxYasRNTjHNNiIfgzI9BF3uxE2Qw0v184L9UstIWs29ZlMjm6zDKDeKuUvHgvWelDTec8=@vger.kernel.org
X-Gm-Message-State: AFuF++mGIwZ7m0C1+a4w4zyZPj/18RRWONMP3GzbdeRTtVoAixW0dZb+
	FcAf+ws0i8kAqAB3W/Xo3zEKZ0nrg4adRyG2Lq9MFrcMRQ4eZjG8YXuGSv4rDljSPu4=
X-Gm-Gg: AYBFou3WvoUQvQfx3TfWq1vYSjG0pfhEZFRNHNjZGCbuXTUqXNG4W57ezPKiXyP93Vg
	mkGrHtjDP3Z3zN//x7zsioMPzHAuVUvt348/hKKPlWev3Rk1yaAlerLJDZ/fT4nPmApy+2/vOKa
	jOsMGSPC6LokbJO0jNOaDYgBGh1F1+5s4cm+cjbk+/5lYUE7b6hROnqZopXRTVcKv9T1mgRcI3E
	Wm0pEYl2aPKuGdkkiZYkrty514W3JxNe0zS3kOzlc2lDs0GzSCQdGBsxBSHx6ddR5dtkP3U+WaK
	TDtDr+NPb5x3sRI9DuVEMmpqVQZ2uxtopuYvxTQx43PIFzYoX+hw4yRS39zLD1xwSTrIvvZpitH
	cQO2wNtZir+yOrTLcp47w1Mkces0toC6Rl+1h8WuggUzYmyol7HKQOFaurV2kvTYZpF7Ug3gH2l
	NAuRPuVEugSa4xhGG9mCNNhv8I+xOyrXFv4tJOUMZIukR053q7I5gF1gUw1cehNzeQ7DpzxFQZS
	izce/v9jSyrJvXbo5qXsg==
X-Received: by 2002:a17:907:9624:b0:c27:d84e:ebd6 with SMTP id a640c23a62f3a-c29b87062damr276666366b.25.1789413197401;
        Mon, 14 Sep 2026 12:13:17 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.248.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966063a2asm469742666b.27.2026.09.14.12.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 12:13:16 -0700 (PDT)
Message-ID: <f9c2a736-d7db-4d7f-9fb3-d8cd77d45c0a@linaro.org>
Date: Mon, 14 Sep 2026 20:13:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] media: qcom: camss: refcount streaming on the shared
 CSIPHY and CSID
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20260914133416.1030231-1-hitesh@ebytelogic.com>
 <20260914133416.1030231-7-hitesh@ebytelogic.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260914133416.1030231-7-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/09/2026 14:34, Hitesh Patel wrote:
> video_start_streaming() walks the pipeline from the video node
> upstream and calls video.s_stream on every subdev it finds;
> video_stop_streaming() does the same to stop. The core allows one
> transition per subdev: call_s_stream() keeps a single
> sd->s_stream_enabled flag and warns about, and drops, a start of a
> subdev that is already started or a stop of one already stopped.
> 
> That is correct for a subdev with a single user, but the CSIPHY and
> the CSID are shared when a CSI-2 transmitter aggregates several
> cameras onto one port. A MAX9296A GMSL deserializer sends two
> cameras on one CSI-2 output as two virtual channels; the CSID
> demultiplexes them to RDI0 and RDI1, each of which is its own VFE
> line, video node and thus pipeline, and both pipelines traverse the
> same CSIPHY and CSID. Starting the second camera hits the core check:
> the CSIPHY and CSID s_stream(1) are dropped with a WARN, and while
> the hardware happens to be already running, stopping the first
> camera then calls s_stream(0) on both and tears the CSIPHY and CSID
> down underneath the second camera, which stops receiving frames.
> 
> Count the pipelines streaming through each CSIPHY and CSID and only
> forward the first start and the last stop to the subdev. The count
> is updated under the media graph mutex, which serialises the two
> pipelines' start/stop against each other. All other subdevs of the
> pipeline are driven exactly as before, so the ordinary one camera
> per port case does not change.
> 
> csid_set_stream() programs every virtual channel of the en_vc mask
> in one go, so a single start already covers all demultiplexed RDIs;
> nothing needs to change on the CSID or CSIPHY side.
> 
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
> ---
>   .../media/platform/qcom/camss/camss-csid.h    |  2 +
>   .../media/platform/qcom/camss/camss-csiphy.h  |  2 +
>   .../media/platform/qcom/camss/camss-video.c   | 48 +++++++++++++++++--
>   drivers/media/platform/qcom/camss/camss.c     | 28 +++++++----
>   drivers/media/platform/qcom/camss/camss.h     |  2 +
>   5 files changed, 71 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index 5296b10f6..9e612ae99 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -167,6 +167,8 @@ struct csid_device {
>   	struct v4l2_ctrl_handler ctrls;
>   	struct v4l2_ctrl *testgen_mode;
>   	const struct csid_subdev_resources *res;
> +	/* Number of pipelines streaming through this CSID */
> +	unsigned int stream_users;
>   };
>   
>   struct camss_subdev_resources;
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index 9d9657b82..b920fe670 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -114,6 +114,8 @@ struct csiphy_device {
>   	struct v4l2_mbus_framefmt fmt[MSM_CSIPHY_PADS_NUM];
>   	const struct csiphy_subdev_resources *res;
>   	struct csiphy_device_regs *regs;
> +	/* Number of pipelines streaming through this CSIPHY */
> +	unsigned int stream_users;
>   };
>   
>   struct camss_subdev_resources;
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 0852eb6f1..16c5f3748 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -249,6 +249,49 @@ static int video_prepare_streaming(struct vb2_queue *q)
>   	return ret;
>   }
>   
> +/*
> + * video_subdev_set_stream - Start or stop a subdev of the pipeline
> + * @video: CAMSS video device
> + * @subdev: Subdevice to start or stop
> + * @enable: Start when true, stop when false
> + *
> + * CSIPHY and CSID are shared between pipelines when a transmitter aggregates
> + * several cameras onto one CSI-2 port. The core allows a single s_stream
> + * transition per subdev, so only forward the first start and the last stop
> + * to them. Every other subdev is driven unconditionally as before.
> + */
> +static int video_subdev_set_stream(struct camss_video *video,
> +				   struct v4l2_subdev *subdev, bool enable)
> +{
> +	struct media_device *mdev = &video->camss->media_dev;
> +	unsigned int *users;
> +	bool forward;
> +	int ret;
> +
> +	users = camss_subdev_stream_users(video->camss, subdev);
> +	if (!users)
> +		return v4l2_subdev_call(subdev, video, s_stream, enable);

This logic is mad and genuinely hurts my head a bit to read.

> +	mutex_lock(&mdev->graph_mutex);
> +	if (enable)
> +		forward = (*users)++ == 0;
> +	else
> +		forward = !WARN_ON(!*users) && --(*users) == 0;
> +	mutex_unlock(&mdev->graph_mutex);

You can radically simplify the logic here to

if (enable) {
	forward = *users == 0;
	*users++;
} else {
	forward = *users == 1;
	*users--;
}

I checked ;)

[] ~ gcc -o zed zed.c
[] ~ ./zed
Enable users 0 = 1
Enable users simple 0 = 1
Disable users 0 = 0
Disable users simple 0 = 0
Enable users 1 = 0
Enable users simple 1 = 0
Disable users 1 = 1
Disable users simple 1 = 1
Enable users 2 = 0
Enable users simple 2 = 0
Disable users 2 = 0
Disable users simple 2 = 0
Enable users 3 = 0
Enable users simple 3 = 0
Disable users 3 = 0
Disable users simple 3 = 0
[] ~ cat zed.c
#include <stdio.h>

bool fw(unsigned int users, bool enable)
{
	bool forward;

	if (enable)
		forward = (users)++ == 0;
	else
		forward = !(!users) && --(users) == 0;

	return forward;
}

bool simple_fw(unsigned int users, bool enable)
{
	if (enable)
		return users == 0;
	else
		return users == 1;
}

int main(int argc, char *argv[])
{
	unsigned int users[] = {0, 1, 2, 3};
	int i;

	for (i = 0; i < sizeof(users)/sizeof(unsigned int); i++) {
		printf("Enable users %d = %d\n", users[i], fw(users[i], true));
		printf("Enable users simple %d = %d\n", users[i], simple_fw(users[i], 
true));
		printf("Disable users %d = %d\n", users[i], fw(users[i], false));
		printf("Disable users simple %d = %d\n", users[i], simple_fw(users[i], 
false));
	}

	return 0;
}

In other words please make the code less cryptographic and more human 
readable.

> +
> +	if (!forward)
> +		return 0;
> +
> +	ret = v4l2_subdev_call(subdev, video, s_stream, enable);
> +	if (enable && ret < 0 && ret != -ENOIOCTLCMD) {
> +		mutex_lock(&mdev->graph_mutex);
> +		(*users)--;
> +		mutex_unlock(&mdev->graph_mutex);
> +	}

So taking the graph_mutex here is to stop re-entrancy of two parallel 
streams and only in this function too.

I have to say I distrust locking like this and its racy.

thread0:              thread1:
mutex_lock();
*users = 1
forward = 1;
mutex_unlock();
sleep
                       mutex_lock();
                       *users == 1;
                       forward = 0;
                       mutex_unlock();

                       if (!forward)
                           return 0;

/* sometime later */
v4l2_subdev_call();

Thread1 has returned from set_stream in a non-error state but nothing 
has been set to stream.

The set_stream() call associated with thread0 is reporting a truthful 
state, the set_stream() call from thread1 is not.

Since this is the only ? place you want to modify *users you can add a 
new mutex for that and hold it for the duration of the critical section.

> +
> +	return ret;
> +}
> +
>   static int video_start_streaming(struct vb2_queue *q, unsigned int count)
>   {
>   	struct camss_video *video = vb2_get_drv_priv(q);
> @@ -281,7 +324,7 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
>   		entity = pad->entity;
>   		subdev = media_entity_to_v4l2_subdev(entity);
>   
> -		ret = v4l2_subdev_call(subdev, video, s_stream, 1);
> +		ret = video_subdev_set_stream(video, subdev, true);
>   		if (ret < 0 && ret != -ENOIOCTLCMD)
>   			goto error;
>   	}
> @@ -319,8 +362,7 @@ static void video_stop_streaming(struct vb2_queue *q)
>   		entity = pad->entity;
>   		subdev = media_entity_to_v4l2_subdev(entity);
>   
> -		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
> -
> +		ret = video_subdev_set_stream(video, subdev, false);
>   		if (ret) {
>   			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
>   			return;
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 4cf736d80..ca8101c2d 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4620,27 +4620,39 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
>   }
>   
>   /*
> - * camss_is_receiver_subdev - Test whether a subdev is a CAMSS CSI-2 receiver
> + * camss_subdev_stream_users - Streaming user count of a CAMSS receiver subdev
>    * @camss: CAMSS device
>    * @sd: Subdevice to test
>    *
> - * Return true for a CSIPHY or CSID belonging to @camss, false for anything
> - * else, in particular for the external subdev transmitting to them.
> + * CSIPHY and CSID are traversed by several pipelines at once when a CSI-2
> + * transmitter aggregates several cameras onto one port: every virtual channel
> + * is demultiplexed to its own RDI and forms its own pipeline. The hardware
> + * must only be started by the first of them and stopped by the last.
> + *
> + * Return a pointer to the user count of @sd if it is a CSIPHY or CSID of
> + * @camss, NULL for any other subdev, in particular for the external subdev
> + * transmitting to them.
>    */
> -static bool camss_is_receiver_subdev(struct camss *camss,
> -				     struct v4l2_subdev *sd)
> +unsigned int *camss_subdev_stream_users(struct camss *camss,
> +					struct v4l2_subdev *sd)

I'm all for progressive changes but I wonder if you could have dispensed 
with introducing camss_is_receiver_subdev() given you only added it ~ 2 
patches ago.

>   {
>   	unsigned int i;

You need to assert lockdep held for the new mutex here.
>   	for (i = 0; i < camss->res->csiphy_num; i++)
>   		if (sd == &camss->csiphy[i].subdev)
> -			return true;
> +			return &camss->csiphy[i].stream_users;
>   
>   	for (i = 0; i < camss->res->csid_num; i++)
>   		if (sd == &camss->csid[i].subdev)
> -			return true;
> +			return &camss->csid[i].stream_users;
>   
> -	return false;
> +	return NULL;
> +}
> +
> +static bool camss_is_receiver_subdev(struct camss *camss,
> +				     struct v4l2_subdev *sd)
> +{
> +	return camss_subdev_stream_users(camss, sd);
>   }
>   
>   /*
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 39ea33e61..00b8d5304 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -167,6 +167,8 @@ void camss_add_clock_margin(u64 *rate);
>   int camss_enable_clocks(int nclocks, struct camss_clock *clock,
>   			struct device *dev);
>   void camss_disable_clocks(int nclocks, struct camss_clock *clock);
> +unsigned int *camss_subdev_stream_users(struct camss *camss,
> +					struct v4l2_subdev *sd);
>   struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
>   s64 camss_get_link_freq(struct camss *camss, struct media_entity *entity,
>   			unsigned int bpp, unsigned int lanes);

