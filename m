Received: from sender5-op-o12.zoho.com (sender5-op-o12.zoho.com [165.173.182.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A8A544D55;
	Tue, 22 Sep 2026 12:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081654; cv=pass; b=pbTWvd8tCpemRX9KPCIeTuDDMZodJMjHzG9Rj4xivnQV65Bt90xY/3nntcMO184e53Wwjrz0gnrDO4c0N+Qb9En3e5YqWJibg6MOoDqsy+v767m/qwBXO+9njd04MaBcdFaDZs+J/bV/PDfQFcGFdXoYcaADB1oCAe6f2HoOLbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081654; c=relaxed/simple;
	bh=YOXZg+SwPd/f1O0MhTAgtPPz+wMhQKYLPHMFDh5lflg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QXF5FysRtpK/cGf6u5YtwMS6S0i8NdemmKDADrburTXXmHya6bI0cs/w+vG/YUdG60kgzOMmuOMKP6QWM8Fj8mDQUzFFRQV/h45uzV1RzqfOxwKxbbw/A5qeG447tly4ChtGSgS2VKP4YvCj+h8kTcZr5MFaRbdS5ftj0Rthewc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=NP6zulu9; arc=pass smtp.client-ip=165.173.182.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="NP6zulu9"
ARC-Seal: i=1; a=rsa-sha256; t=1790081625; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hlsHbH5wUsB2LvW/TIQ3d27NK9hS9SktXxOjbse16cKJaVSSnFJFThbdCW02Ql1FOrYFZ9HYLzSOf5//Whptwltk1BJjQJT1ic0tCQxtafmeLlVu0LRruDKdvs201GW+jv7yXjhpn9YwFKRHkin6xTJtAiBD7Cu+KDzzu/gOM78=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790081625; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hpVDMwfhgJUPfjsF+whIREOUyIQYs5sG2N54ZLJ3X/A=; 
	b=ZC+RPbeMkgTM8RlHTPgiRAHxLOOQ/Jnq46ZQCjxy7LXxhgPAV8bO/xvhMiXsYL7vbZUmaPLZsFP+e0Os1oFC+awYmRjamkbZL+jkO0VTwr5lL2bVOAwgx1fZKqwo06zO0uqC1RMovbYH1SZ94bqGgIuw38wjmJ0zO5+vwGNv93o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790081625;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=hpVDMwfhgJUPfjsF+whIREOUyIQYs5sG2N54ZLJ3X/A=;
	b=NP6zulu98qlVDcoNLznRmtv1qDTCy2YSlU+er83JeK6GQPZEigN/XCBVGMkLBrvO
	gmCI0tSlTohDYNRLWBE6DdRPz4hwWMPFm9OsEQ4XuQWpLGbE0dtY2r+hnwZGEWvjhga
	0GEuQ/TkwFX+3bVFYnwuImZnhfxnNHvaP+r1aDBM=
Received: by smtp.zohomail.com with SMTPS id 1790081623938646.5385671784251;
	Tue, 22 Sep 2026 05:53:43 -0700 (PDT)
Message-ID: <da4d2d76-fb8c-4687-b977-b136a2c57f45@collabora.com>
Date: Tue, 22 Sep 2026 15:53:40 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: synopsys: hdmirx: add input status reporting
 to VIDIOC_ENUMINPUT
To: Sascha Hauer <s.hauer@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>, Dingxian Wen <shawn.wen@rock-chips.com>
Cc: linux-media@vger.kernel.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, Gerald Loacker <gerald.loacker@wolfvision.net>
References: <20260921-hdmirx-fixes-v1-0-495be0beaf93@pengutronix.de>
 <20260921-hdmirx-fixes-v1-2-495be0beaf93@pengutronix.de>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20260921-hdmirx-fixes-v1-2-495be0beaf93@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 9/21/26 10:15, Sascha Hauer wrote:
> From: Gerald Loacker <gerald.loacker@wolfvision.net>
> 
> Userspace currently has to learn the cable and lock state from the error
> VIDIOC_QUERY_DV_TIMINGS returns, -ENOLINK or -ENOLCK. Both of those paths
> log at v4l2_err level, so waiting for a cable fills the kernel log.
> 
> Report it where it belongs instead: V4L2_IN_ST_NO_POWER while the source
> is not driving the connector's +5V line, V4L2_IN_ST_NO_SIGNAL while the
> receiver has not locked. Both come from the helpers
> hdmirx_query_dv_timings() already uses, so the two cannot disagree.
> adv76xx_g_input_status() and adv7842_g_input_status() report the same two
> flags the same way.
> 
> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index 24ec6138a1fb6..75576a9366fd0 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -1199,6 +1199,9 @@ static void hdmirx_submodule_init(struct snps_hdmirx_dev *hdmirx_dev)
>  static int hdmirx_enum_input(struct file *file, void *priv,
>  			     struct v4l2_input *input)
>  {
> +	struct hdmirx_stream *stream = video_drvdata(file);
> +	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
> +
>  	if (input->index > 0)
>  		return -EINVAL;
>  
> @@ -1207,6 +1210,12 @@ static int hdmirx_enum_input(struct file *file, void *priv,
>  	strscpy(input->name, "HDMI IN", sizeof(input->name));
>  	input->capabilities = V4L2_IN_CAP_DV_TIMINGS;
>  
> +	input->status = 0;
> +	if (port_no_link(hdmirx_dev))
> +		input->status |= V4L2_IN_ST_NO_POWER;
> +	if (signal_not_lock(hdmirx_dev))
> +		input->status |= V4L2_IN_ST_NO_SIGNAL;
> +
>  	return 0;
>  }
>  
> 

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
