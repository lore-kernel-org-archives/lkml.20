Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225FE42A7B0;
	Thu,  3 Sep 2026 11:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433799; cv=none; b=Ufe0tDxoOTqwVFVT7M7i+60oOznE/TFTtvHO3qHc0GLQpOvmDjDC1+fM0T5zxh17JzFQLWWdr/iP0v0jYS2U541VHMyEyGPl9NptOUKRAiExP4vTJJSJkIFUpvd8Q5TKOmNgKmf1dMVQtkD20Z2ArOpbEwIhci+3AF0K0UM6MUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433799; c=relaxed/simple;
	bh=zz6QXhoYLDxoaJnySh/J4JdYG1t99zE40OYgYztYqaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVQRbZsxkCm12yIK5+ZehRMdikyOn0L2FcgAmAdwmUPNOPASbpZdz7bX8MzcuFlLVSCjlnolDLEBVw7zzORMnGtRu1XyEgr7b6fPjw1fF5F4HvMBj0jL+vlQRVXllLI6WYUiOvJ6wrbI/4luPwcp9IMbQ6CnGf3nbY5Gb3qarxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NJUJoKoU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NJUJoKoU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E2B41F000E9;
	Thu,  3 Sep 2026 11:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788433797;
	bh=9WsPeX+9i7BIEGoNIXrXtSENLy92xPQVSWemISJNim4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NJUJoKoUnqYXS7Ucmqb+efo8Oq2Imr0f8QNBh4+/Kba8TSIyQwKhFfIi3MrGcl0Ju
	 4ZsAIb/z0D6O79MoFDHHB8OjKkYgdOBUEEVwbw7IZJdvL7jLKH46r9cJf/dAMSRQY9
	 WtW1OU8VXP/dEUOeULZM3vNNMERZZNI8v6koIQAvmGFPLOnWC/j376ktg4ZP0BEn+c
	 jBcsEvLvowesdxyXiBqZK8QNHD4q+T1mRJmVgwTK3ab9+TMEMKI1Tb3hn/uMJzF+A2
	 uWSL08IsZpJKRW5XvwzKg4FvH4gcmhe1URk+fE7qPo4HJDN18dmN46RmgJwYdjPDaY
	 B8zdlRh7B0iZQ==
Date: Thu, 3 Sep 2026 12:09:53 +0100
From: Lee Jones <lee@kernel.org>
To: a0282524688@gmail.com
Cc: Ming Yu <tmyu0@nuvoton.com>, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH v7 06/10] mfd: nct6694: Transfer command payloads via a
 dedicated DMA buffer
Message-ID: <20260903110953.GN2133376@google.com>
References: <20260821033505.4017901-1-a0282524688@gmail.com>
 <20260821033505.4017901-7-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821033505.4017901-7-a0282524688@gmail.com>

On Fri, 21 Aug 2026, a0282524688@gmail.com wrote:

> From: Ming Yu <a0282524688@gmail.com>
> 
> The transport hands the caller's payload buffer straight to
> usb_bulk_msg(). Sub-device drivers embed those buffers in their private
> data structures, so they are neither cacheline aligned nor exclusively
> owned by the transfer. On non-coherent architectures, mapping such a
> buffer for DMA can corrupt the unrelated fields sharing its cachelines.
> 
> Transfer the payload through a buffer owned by the transport instead,
> and reject commands exceeding the maximum firmware packet size.
> 
> Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
> Signed-off-by: Ming Yu <a0282524688@gmail.com>
> ---
> Changes in v7:
> - New patch. Fixes the DMA-unsafe use of caller-owned payload buffers
>   reported on v6 patch 6/7.
> 
>  drivers/mfd/nct6694-usb.c   | 38 +++++++++++++++++++++++++++----------
>  include/linux/mfd/nct6694.h |  3 +++
>  2 files changed, 31 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mfd/nct6694-usb.c b/drivers/mfd/nct6694-usb.c
> index 2289ebfde7fa..793ce54c02aa 100644
> --- 'a/drivers/mfd/nct6694-usb.c'
> +++ 'b/drivers/mfd/nct6694-usb.c'
> @@ -38,6 +38,7 @@ struct nct6694_usb_data {
>  	struct urb *int_in_urb;
>  	struct usb_device *udev;
>  	union nct6694_usb_msg *usb_msg;
> +	void *xfer_buf;
>  	__le32 *int_buffer;

There are a bunch of buffers used in this file and I'm losing track of
which one is which.  Please consolidate on the nomenclature for them
all.

Ins, outs, payloads, xfers, etc.  Make a decision and stick to it throughout.

>  };
>  
> @@ -120,8 +121,12 @@ int nct6694_usb_read_msg(struct nct6694 *nct6694,
>  	struct nct6694_usb_data *udata = nct6694->priv;
>  	union nct6694_usb_msg *msg = udata->usb_msg;
>  	struct usb_device *udev = udata->udev;
> +	u16 len = le16_to_cpu(cmd_hd->len);
>  	int tx_len, rx_len, ret;
>  
> +	if (len > NCT6694_MAX_PACKET_SIZE)
> +		return -EINVAL;
> +
>  	guard(mutex)(&udata->access_lock);
>  
>  	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
> @@ -140,17 +145,19 @@ int nct6694_usb_read_msg(struct nct6694 *nct6694,
>  		return ret;
>  
>  	/* Receive data packet from USB device */
> -	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), buf,
> -			   le16_to_cpu(cmd_hd->len), &rx_len, NCT6694_URB_TIMEOUT);
> +	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), udata->xfer_buf,
> +			   len, &rx_len, NCT6694_URB_TIMEOUT);
>  	if (ret)
>  		return ret;
>  
> -	if (rx_len != le16_to_cpu(cmd_hd->len)) {
> +	if (rx_len != len) {
>  		dev_err(nct6694->dev, "Expected received length %d, but got %d\n",
> -			le16_to_cpu(cmd_hd->len), rx_len);
> +			len, rx_len);
>  		return -EIO;
>  	}
>  
> +	memcpy(buf, udata->xfer_buf, len);
> +
>  	return nct6694_usb_err_handling(nct6694, msg->response_header.sts);
>  }
>  EXPORT_SYMBOL_GPL(nct6694_usb_read_msg);
> @@ -173,12 +180,17 @@ int nct6694_usb_write_msg(struct nct6694 *nct6694,
>  	struct nct6694_usb_data *udata = nct6694->priv;
>  	union nct6694_usb_msg *msg = udata->usb_msg;
>  	struct usb_device *udev = udata->udev;
> +	u16 len = le16_to_cpu(cmd_hd->len);
>  	int tx_len, rx_len, ret;
>  
> +	if (len > NCT6694_MAX_PACKET_SIZE)
> +		return -EINVAL;
> +
>  	guard(mutex)(&udata->access_lock);
>  
>  	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
>  	msg->cmd_header.hctrl = NCT6694_HCTRL_SET;
> +	memcpy(udata->xfer_buf, buf, len);
>  
>  	/* Send command packet to USB device */
>  	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), &msg->cmd_header,
> @@ -187,8 +199,8 @@ int nct6694_usb_write_msg(struct nct6694 *nct6694,
>  		return ret;
>  
>  	/* Send data packet to USB device */
> -	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), buf,
> -			   le16_to_cpu(cmd_hd->len), &tx_len, NCT6694_URB_TIMEOUT);
> +	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), udata->xfer_buf,
> +			   len, &tx_len, NCT6694_URB_TIMEOUT);
>  	if (ret)
>  		return ret;
>  
> @@ -199,17 +211,19 @@ int nct6694_usb_write_msg(struct nct6694 *nct6694,
>  		return ret;
>  
>  	/* Receive data packet from USB device */
> -	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), buf,
> -			   le16_to_cpu(cmd_hd->len), &rx_len, NCT6694_URB_TIMEOUT);
> +	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), udata->xfer_buf,
> +			   len, &rx_len, NCT6694_URB_TIMEOUT);
>  	if (ret)
>  		return ret;
>  
> -	if (rx_len != le16_to_cpu(cmd_hd->len)) {
> +	if (rx_len != len) {
>  		dev_err(nct6694->dev, "Expected transmitted length %d, but got %d\n",
> -			le16_to_cpu(cmd_hd->len), rx_len);
> +			len, rx_len);
>  		return -EIO;
>  	}
>  
> +	memcpy(buf, udata->xfer_buf, len);
> +
>  	return nct6694_usb_err_handling(nct6694, msg->response_header.sts);
>  }
>  EXPORT_SYMBOL_GPL(nct6694_usb_write_msg);
> @@ -270,6 +284,10 @@ static int nct6694_usb_probe(struct usb_interface *iface,
>  	if (!udata->usb_msg)
>  		return -ENOMEM;
>  
> +	udata->xfer_buf = devm_kzalloc(dev, NCT6694_MAX_PACKET_SIZE, GFP_KERNEL);
> +	if (!udata->xfer_buf)
> +		return -ENOMEM;
> +
>  	udata->int_buffer = devm_kzalloc(dev, sizeof(*udata->int_buffer), GFP_KERNEL);
>  	if (!udata->int_buffer)
>  		return -ENOMEM;
> diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
> index 853b1530755d..cb311e58a437 100644
> --- a/include/linux/mfd/nct6694.h
> +++ b/include/linux/mfd/nct6694.h
> @@ -29,6 +29,9 @@ struct mfd_cell;
>  #define NCT6694_HCTRL_SET	0x40
>  #define NCT6694_HCTRL_GET	0x80
>  
> +/* Maximum payload length the firmware accepts in a single command */
> +#define NCT6694_MAX_PACKET_SIZE	0x3F0
> +
>  enum nct6694_irq_id {
>  	NCT6694_IRQ_GPIO0 = 0,
>  	NCT6694_IRQ_GPIO1,
> -- 
> 2.34.1
> 

-- 
Lee Jones
