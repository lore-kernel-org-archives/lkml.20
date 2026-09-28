Received: from sender5-op-o12.zoho.com (sender5-op-o12.zoho.com [165.173.182.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3F54D9554;
	Mon, 28 Sep 2026 14:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605435; cv=pass; b=prEgnX5aR3fUOMQb6dxol6gdfKT5lqSPE3eby2E+F+k5ZLV5oqLVdWZ4FbcoilF5Fgvn2B2sP97MO7hvMq8il4NyzL3wbBeuRaFygM4in7Wy03aiZ81V+1Gx6rBSDz6vA6MJjfinwXxnxomE2BqPVKUnTWVuOs+uIA/Ia2KjdNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605435; c=relaxed/simple;
	bh=ibiYVn/L7S4UmODqYLiJxWqoAGlqGRh7pFqd64OpuQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZIeDSE5UDYZDIZFNb9xlvxTQNOohHiBokECeN3pu7xoBHBfoGEw7qWRCc9Hfbv8K8VoN7mhEsVdp5FtW1j3uZGiWdHCHjZQx66HMJP3SNwjbi6qlJS6USwL7rMpPQkf79+qW5fFxTHcDaJhW9jjCk7iGa0YHEDgLWptNwe2IHOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=Cvxwoycg; arc=pass smtp.client-ip=165.173.182.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Cvxwoycg"
ARC-Seal: i=1; a=rsa-sha256; t=1790605423; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=N7EuKB4qC+wbWaB8+OBJ30DwmiBmECQlNVVZZkCVrnZ0uL6rpyxN3XdRq2OOYgM1iER5evCF5iqI3BBqeimD/xbVxQ/hbaMcBlRoqV5E6UnWI/JlVIyAHdkZ1Gh1R/S8VIAltskG8b8MUYcxz665hWvh888H/HYQgFwjkHxqhZg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790605423; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7uBb2+okI+xjvWkYL3wu85s0nnzBvHShpKmWBmYT4fY=; 
	b=RrmHYbxN7WwlYKjtR3hkldpR1HF/kPO0h1R5fvBOX448VR2ncYo3VO9WCWubZcDMUashgQ2p0+qi3fx383zCsJj7uiFkvdMvKAXei99W5TUhM42/vxfxGnZ67ynWscrynrHeKIFdeSZxo8sg1O5/+YTi6kkEI+G/4YndyoeQyWo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790605423;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=7uBb2+okI+xjvWkYL3wu85s0nnzBvHShpKmWBmYT4fY=;
	b=CvxwoycgFQ4nS7oKnDU13WL+iHmxT+HJMd4TlUwMDa0jHGGnEUo9PuBIcylaPBBZ
	7iJpiuj1t1YAXihmIG3Ww6ZOYYZju87arXk9APC1yHM36UrUmtWJOmdyxBxn8sWQA+X
	d7iLaWm2A6bXgYPgS0Zmt004w1QDDfPlUKQSOB8A=
Received: by smtp.zohomail.com with SMTPS id 1790605420969388.6811490029762;
	Mon, 28 Sep 2026 07:23:40 -0700 (PDT)
Message-ID: <627d7085-a6bd-4696-81a7-fc14869f7a4b@collabora.com>
Date: Mon, 28 Sep 2026 17:23:37 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: synopsys: hdmirx: report DMA error interrupts
To: Thomas Weustenfeld <tw@tvlabs.ai>
Cc: linux-media@vger.kernel.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org
References: <20260923023846.21166-1-tw@tvlabs.ai>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20260923023846.21166-1-tw@tvlabs.ai>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

23.09.2026 05:38, Thomas Weustenfeld пишет:
> hdmirx_start_streaming() enables FIFO_OVERFLOW_INT_EN,
> FIFO_UNDERFLOW_INT_EN, HDMIRX_AXI_ERROR_INT_EN and
> LAST_FRAME_AXI_UNFINISH_INT_EN in DMA_CONFIG4, but
> hdmirx_dma_irq_handler() only decodes HDMIRX_DMA_IDLE_INT and
> LINE_FLAG_INT_EN. Any of the four error interrupts therefore falls
> through the handler with handled still false and is discarded: no
> counter, no message at default verbosity, and nothing reported to
> userspace. The only trace is a v4l2_dbg level 3 line saying the irq was
> not handled, printing the raw status word.
> 
> The practical effect is that a capture FIFO overflow -- the DMA failing
> to drain incoming pixels to memory, which loses whole runs of lines from
> the frame -- is completely silent. Frame cadence, DMA idle interrupts and
> buffer delivery all continue to look healthy while the delivered buffers
> contain unwritten lines. On affected boards this reads as unexplained
> video corruption with every normal indicator nominal.
> 
> Measured on RK3588 with a 900 frame capture: a board writing a
> semi-planar format reported 907 DMA idle and 907 line flag interrupts as
> expected, plus 702 FIFO overflow interrupts, all of them dropped. An
> otherwise identical capture on a board writing a packed format at the
> same data rate reported none.
> 
> Decode the four error bits, count them per stream, warn once per stream
> on the first occurrence of each, and log the totals when streaming stops.
> No functional change to the capture path.
> 
> Signed-off-by: Thomas Weustenfeld <tw@tvlabs.ai>
> ---
>  .../platform/synopsys/hdmirx/snps_hdmirx.c    | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index 25f8ca0d6d94..d7ff7aa4ebde 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -117,6 +117,10 @@ struct hdmirx_stream {
>  	u32 sequence;
>  	u32 line_flag_int_cnt;
>  	u32 irq_stat;
> +	u32 fifo_overflow_cnt;
> +	u32 fifo_underflow_cnt;
> +	u32 axi_error_cnt;
> +	u32 last_frame_unfinish_cnt;
>  };
>  
>  struct snps_hdmirx_dev {
> @@ -1567,6 +1571,15 @@ static void hdmirx_stop_streaming(struct vb2_queue *queue)
>  	hdmirx_update_bits(hdmirx_dev, DMA_CONFIG6, HDMIRX_DMA_EN, 0);
>  	return_all_buffers(stream, VB2_BUF_STATE_ERROR);
>  	mutex_unlock(&hdmirx_dev->stream_lock);
> +
> +	if (stream->fifo_overflow_cnt || stream->fifo_underflow_cnt ||
> +	    stream->axi_error_cnt || stream->last_frame_unfinish_cnt)
> +		v4l2_warn(v4l2_dev,
> +			  "dma errors over %u frames: fifo_overflow:%u fifo_underflow:%u axi_error:%u last_frame_unfinish:%u\n",
> +			  stream->sequence, stream->fifo_overflow_cnt,
> +			  stream->fifo_underflow_cnt, stream->axi_error_cnt,
> +			  stream->last_frame_unfinish_cnt);
> +
>  	v4l2_dbg(1, debug, v4l2_dev, "stream stopping finished\n");
>  }
>  
> @@ -1583,6 +1596,10 @@ static int hdmirx_start_streaming(struct vb2_queue *queue, unsigned int count)
>  	mutex_lock(&hdmirx_dev->stream_lock);
>  	stream->sequence = 0;
>  	stream->line_flag_int_cnt = 0;
> +	stream->fifo_overflow_cnt = 0;
> +	stream->fifo_underflow_cnt = 0;
> +	stream->axi_error_cnt = 0;
> +	stream->last_frame_unfinish_cnt = 0;
>  	stream->curr_buf = NULL;
>  	stream->next_buf = NULL;
>  	stream->irq_stat = 0;
> @@ -2080,6 +2097,31 @@ static void line_flag_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
>  	*handled = true;
>  }
>  
> +static void dma_error_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
> +				  u32 dma_stat1, bool *handled)
> +{
> +	struct hdmirx_stream *stream = &hdmirx_dev->stream;
> +	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
> +
> +	if ((dma_stat1 & FIFO_OVERFLOW_INT_EN) && !stream->fifo_overflow_cnt++)
> +		v4l2_warn(v4l2_dev,
> +			  "dma fifo overflow, captured lines are being dropped\n");
> +
> +	if ((dma_stat1 & FIFO_UNDERFLOW_INT_EN) &&
> +	    !stream->fifo_underflow_cnt++)
> +		v4l2_warn(v4l2_dev, "dma fifo underflow\n");
> +
> +	if ((dma_stat1 & HDMIRX_AXI_ERROR_INT_EN) && !stream->axi_error_cnt++)
> +		v4l2_err(v4l2_dev, "dma axi error\n");
> +
> +	if ((dma_stat1 & LAST_FRAME_AXI_UNFINISH_INT_EN) &&
> +	    !stream->last_frame_unfinish_cnt++)
> +		v4l2_warn(v4l2_dev,
> +			  "dma did not finish writing the last frame\n");
Can this result in a message storm? If yes, a generic rate-limited dev
print variants will be more preferable.

-- 
Best regards,
Dmitry
