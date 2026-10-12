Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509FD4D2EDF
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791839466; cv=none; b=TfTaHAToLq5lVSCkVG/x+vR6/o8/6y61zMvThPgGMueE303EoJuTSeVZzcs8S+QCqJeSBmlDQ3VLn6UMCHG0osz/jPTNUS0lux/RR5YhRIIerIsY/1+ewwIGI6anX6esdBZ4bmSH4R+opvJgUvpd2xXhZQdF3WJHU1XjBo+Bj1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791839466; c=relaxed/simple;
	bh=QC8byHY0lICJTqbnAHqGDAlnK8F5vPgoCkJf1d6ylfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dp7rdpdxIGyxdU1Fsh521KO3FgN+mb0TW2xzvg6INk2BgTxtfV7RJLsUb6+MdqGd3QvKpiX+ZcBvwCoR3Fy+KVk2D43468+G5mqHVFaXah16PybDQxK/PR7ZwQ1oNqoFTd73bRarIGdnUEz+ODZynPbW+hiqgXCfhjY30p5lo9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=Yh1Vv/Gb; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="Yh1Vv/Gb"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4f66bb2ab57so944512b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1791839463; x=1792444263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hrLZoFbm7Zih4n5nII8+cuJjtn3XQ32GrgSS6uhCEQ8=;
        b=Yh1Vv/GbXy/07+VkevwP6f+f+kt4U63Imeb7LdWYgh0wT+cT1GpnRdHgaBN0xpnYyx
         XNSi9DWFci+5gVcAuz5MbOxM6ZZT74exBCbVQ2/ravk0tbZDZWV6l89rs1n8UwSjXPyD
         3kELX/CTtq1F6VQbt+LJPNdhDkRET0euTJiRFvaj0j43uHY8wTMRwAjGQRtz142Raal3
         uOhKEEvU/MKie8i3vIzGBnerG7kmEXRk1/UrcdAPiFaz9tjnKfHUe/LbNjThPQ0LvLR+
         EXW23kZQGBvTlaNioIXrh5aNodQbbULCd783JeesGSb6Ee493HmtYmwG24quNwFihgla
         kh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839463; x=1792444263;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hrLZoFbm7Zih4n5nII8+cuJjtn3XQ32GrgSS6uhCEQ8=;
        b=u/0HUX6oqu2pwdMI+WE2DmigA5njDtEIDhJ2y7rTCGEt1s19TzmP5lhLQnwG3+Ubir
         8ZtbmBn2MJiYOYEx1UG+ivFRRRDtNttSwPigUxwmeqEyddAvFMLplvD6m7fb23nQC3DP
         J++9wq2MlmDPASQPDJ3e53sgLqlzO7yEnH9LyJkKvL+f7C4PdccwgKzXlLSm8jfcOmJq
         uMar9K0xqM/nCtFUvDOjksEQH3YXU3+U3h1wwXhLdarMomDnqOXw60fSkCz3xsfXhaEo
         kwWQGh+F43oEy3mPkOmLG0qy1ZB+QI/yZqTPjUEjOoTy2zC9ZN7r9kroIeLhrmisYtwz
         yVnQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7eqBWipzsx30Xzy6p6Gym8EQDOZaJK6ONuv2zmcz+wiXwE2sz6ny4IAjKLzXUAKRJZhFW9DKh5G5ICxM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlhVnXxCdUJ2nYoAUes3nWI2y8Le+19fMl9/qtoceHHQBsnWoi
	Vq8WAleRgSOgSy3NvPjflPsSiQ6TSRBt7X2S0qdoKF8g1jlRSVhN2cUkKRR0vB0m+HQ=
X-Gm-Gg: AYBFou0FZblhx50Kvbr/+bSW6rG7t9pjDsGg1JUEHsES/BRJ13v4rQyPXB2b4IwRPGH
	o4If9VgYq9hjBCMvXJi8ZYyjIsH4obs7Vr+Q/GrT5ZNIf5+QdB9rS0QuogSuJt6N1hvMepoc3xA
	Q7zsBGAerfRJPY9iQ35jaoflzJa01B63oNP1kciMYmJdd/kcU3xWNxdPMdmtJWEh6Q3MTAT4rBl
	Y7nD0mfWR0e0g8RqmbJk5ObmYkEyKntfWf1VbPR7Ogu3HUxrol86tJYDV7SaSGjn8QqAHiaZ/6N
	AWRz+vlgZRhgMnfoe/1Zbh5ZM7K4+heuLXQyKvWXnJDcpWALbuZHWq7ll7/l2nTrkb1O7WZm/8J
	M3npjOtvbRDd0AjhqqbzKhrFJH8WHNQTySeu7YeoCS/wowQ7gnw803BInv8yLMeForFeIS6LyJA
	gdIL18Um6uBb2O8hKgDaZD1CckDhquokKb3A0SB3VYHah1ibBXRUf2nyhqDAvFyOZRlqEr27+3l
	5DP6MlWO8FBWjoLLsKcWUdeVOl+0oNOha8PavyDH2Vv7mdqFCG1UhnFv0enayiRFuR0r8mAksmm
	nakiG5BMYVvvgMSd0i354b9U65gQQQ==
X-Received: by 2002:a05:6808:4f0a:b0:4ec:7639:2ad with SMTP id 5614622812f47-50c52471170mr8837897b6e.13.1791839462870;
        Mon, 12 Oct 2026 14:11:02 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:69cf:f8b2:f1c7:79dc])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c17d84e77sm12116885b6e.7.2026.10.12.14.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:11:01 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:10:32 -0500
From: Corey Minyard <corey@minyard.net>
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Donald Shannon <donalds@nvidia.com>, linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH 11/11] ipmi: Add NVIDIA LSTP IPMI BMC driver
Message-ID: <as1MyFx8Ih_I9BGX@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
 <20261012-lstp-usb-adapter-v1-11-aambrozewicz@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-lstp-usb-adapter-v1-11-aambrozewicz@nvidia.com>

On Mon, Oct 12, 2026 at 08:36:09PM +0300, Adrian Ambrozewicz wrote:
> Add a BMC-side driver for the IPMI channels of NVIDIA LSTP USB adapters.
> The adapter carries IPMI messages between the host and the BMC; each
> channel is exposed to BMC userspace as an ipmi-lstp<n> character device
> that reads requests from the host and writes the responses back.
> 
> By default each message on the node carries a one-byte message number
> between the length and the payload, and a response echoes the number
> of the request it answers. The number exists only on the node, not in
> the LSTP protocol. With USB_LSTP_IPMI_MSG_NUM disabled the
> node uses the ssif_bmc layout (struct ipmi_ssif_msg) instead, so
> userspace written for ssif_bmc works unchanged.

Can you name the file usb_lstp.c, or something like that, to match
the other BMC side devices?

> 
> Signed-off-by: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
> ---
>  MAINTAINERS                   |   1 +
>  drivers/char/ipmi/Kconfig     |  32 +++
>  drivers/char/ipmi/Makefile    |   1 +
>  drivers/char/ipmi/ipmi-lstp.c | 464 ++++++++++++++++++++++++++++++++++
>  4 files changed, 498 insertions(+)
>  create mode 100644 drivers/char/ipmi/ipmi-lstp.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8e58895b7d5a..96667b3baa7a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19577,6 +19577,7 @@ F:	Documentation/devicetree/bindings/spi/nvidia,lstp-spi.yaml
>  F:	Documentation/devicetree/bindings/usb/nvidia,lstp.yaml
>  F:	Documentation/driver-api/usb/lstp.rst
>  F:	Documentation/firmware-guide/acpi/lstp.rst
> +F:	drivers/char/ipmi/ipmi-lstp.c
>  F:	drivers/gpio/gpio-lstp.c
>  F:	drivers/i2c/busses/i2c-lstp.c
>  F:	drivers/leds/leds-lstp.c
> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> index 538a7d3c65bf..eb51a2d56fc9 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
> @@ -119,6 +119,38 @@ config IPMI_POWEROFF
>  
>  endif # IPMI_HANDLER
>  
> +config LSTP_IPMI_BMC
> +	tristate "NVIDIA LSTP IPMI BMC support"
> +	depends on USB_LSTP
> +	default USB_LSTP
> +	help
> +	  Say Y or M here to support the IPMI channels of NVIDIA LSTP USB
> +	  adapters on a BMC. Each channel is exposed as an ipmi-lstp<n>
> +	  character device through which BMC userspace receives requests
> +	  from the host and sends the responses back.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called ipmi-lstp.
> +
> +config USB_LSTP_IPMI_MSG_NUM
> +	bool "Message-number header on LSTP IPMI nodes"
> +	depends on LSTP_IPMI_BMC
> +	default y
> +	help
> +	  Messages read from and written to an LSTP IPMI device node carry a
> +	  one-byte message number between the length and the payload, and a
> +	  response must echo the number of the request it answers. The number
> +	  exists only on the device node, not in the LSTP protocol, and no
> +	  other BMC-side IPMI driver has it.
> +
> +	  Disable this option to drop it. The node then uses the layout of
> +	  struct ipmi_ssif_msg from the ssif_bmc driver, a length followed by
> +	  the payload, so that userspace written for ssif_bmc works unchanged.
> +	  A response answers the request read last, and is dropped once a newer
> +	  request has arrived.
> +
> +	  Say Y if userspace parses the message number.
> +
>  config IPMI_KCS_BMC
>  	tristate
>  
> diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
> index 4ea450a82242..2e320ce2c901 100644
> --- a/drivers/char/ipmi/Makefile
> +++ b/drivers/char/ipmi/Makefile
> @@ -29,3 +29,4 @@ obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
>  obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
>  obj-$(CONFIG_IPMB_DEVICE_INTERFACE) += ipmb_dev_int.o
>  obj-$(CONFIG_SSIF_IPMI_BMC) += ssif_bmc.o
> +obj-$(CONFIG_LSTP_IPMI_BMC) += ipmi-lstp.o
> diff --git a/drivers/char/ipmi/ipmi-lstp.c b/drivers/char/ipmi/ipmi-lstp.c
> new file mode 100644
> index 000000000000..787d633d4ada
> --- /dev/null
> +++ b/drivers/char/ipmi/ipmi-lstp.c
> @@ -0,0 +1,464 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * IPMI driver for LSTP USB interface.
> + *
> + * Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES.  All rights reserved.
> + */
> +
> +#include <linux/build_bug.h>
> +#include <linux/err.h>
> +#include <linux/idr.h>
> +#include <linux/ipmi_ssif_bmc.h>
> +#include <linux/kfifo.h>
> +#include <linux/kref.h>
> +#include <linux/miscdevice.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/poll.h>
> +#include <linux/property.h>
> +#include <linux/slab.h>
> +
> +#include <linux/usb/lstp.h>
> +
> +/* ~1 s of queued requests at OpenBMC rates; past that the host has retried. */
> +#define BUFFER_SIZE 4096
> +
> +static DEFINE_IDA(lstp_ipmi_ida);

Wouldn't you want to assign the numbers in the device tree so they
always have the same number?

> +
> +#define IPMI_LSTP_PAYLOAD_MAX 254
> +#define IPMI_MIN_MSG_LEN 2 /* netfn/lun + cmd */
> +
> +/*
> + * read(2) and write(2) layout with CONFIG_USB_LSTP_IPMI_MSG_NUM. Deployed
> + * userspace parses these bytes, so the field widths and offsets are fixed;
> + * native byte order, as both ends are the same host. @msg_num exists only on
> + * this interface, never on the wire.
> + */
> +struct ipmi_lstp_msg_header {
> +	__u32 len;
> +	__u8 msg_num;
> +} __packed;
> +
> +struct ipmi_lstp_msg {
> +	struct ipmi_lstp_msg_header header;
> +	__u8 payload[IPMI_LSTP_PAYLOAD_MAX];
> +};
> +
> +static_assert(sizeof(struct ipmi_lstp_msg_header) == 5, "IPMI read(2) header layout is ABI");
> +static_assert(offsetof(struct ipmi_lstp_msg_header, msg_num) == 4,
> +	      "IPMI read(2) header layout is ABI");
> +
> +/*
> + * The layout without CONFIG_USB_LSTP_IPMI_MSG_NUM is the ssif_bmc driver's:
> + * the same len and payload, no @msg_num.
> + */
> +static_assert(offsetof(struct ipmi_ssif_msg, payload) ==
> +		      sizeof_field(struct ipmi_lstp_msg_header, len),
> +	      "Untagged layout must be the LSTP header without msg_num");
> +static_assert(IPMI_SSIF_PAYLOAD_MAX == IPMI_LSTP_PAYLOAD_MAX,
> +	      "Untagged layout must carry the LSTP payload");
> +
> +#define LSTP_IPMI_MSG_NUM IS_ENABLED(CONFIG_USB_LSTP_IPMI_MSG_NUM)
> +
> +/* The leading bytes of struct ipmi_lstp_msg_header that userspace sees. */
> +#define LSTP_IPMI_UAPI_HDR_LEN                                     \
> +	(LSTP_IPMI_MSG_NUM ? sizeof(struct ipmi_lstp_msg_header) : \
> +			     sizeof_field(struct ipmi_lstp_msg_header, len))
> +#define LSTP_IPMI_UAPI_MSG_MAX \
> +	(LSTP_IPMI_MSG_NUM ? sizeof(struct ipmi_lstp_msg) : sizeof(struct ipmi_ssif_msg))
> +
> +/* One per bind; the bind and each open fd hold @ref. */
> +struct lstp_ipmi_ctx {
> +	struct kref ref;
> +	struct lstp_channel *ch; /* pinned for the life of @ctx */
> +	struct miscdevice miscdev;
> +	int ida_id; /* -1 until allocated */
> +	bool running; /* exclusive-open flag */
> +	spinlock_t lock; /* protects @running, @msg_count, @read_tag, @fifo */
> +	struct mutex tx_lock; /* held across write()'s gone test and send; teardown waits on it */
> +	wait_queue_head_t req_wq;
> +	struct kfifo_rec_ptr_2 fifo; /* pending requests, oldest dropped to fit */
> +	u8 msg_count; /* tag of the outstanding request; write() echoes it */
> +	u8 read_tag; /* untagged ABI: tag of the request read() handed out last, 0 for none */
> +	bool stopped; /* node torn down; see lstp_ipmi_gone() */
> +};
> +
> +enum lstp_ipmi_cmd {
> +	LSTP_IPMI_CMD_MESSAGE = 0x00,
> +};
> +
> +/* @stopped is per bind and never cleared; see Documentation/driver-api/usb/lstp.rst. */
> +static inline bool lstp_ipmi_gone(struct lstp_ipmi_ctx *ctx)
> +{
> +	return READ_ONCE(ctx->stopped) || lstp_channel_disconnected(ctx->ch);
> +}
> +
> +static inline bool lstp_ipmi_readable(struct lstp_ipmi_ctx *ctx)
> +{
> +	return !kfifo_is_empty(&ctx->fifo) || lstp_ipmi_gone(ctx);
> +}
> +
> +/* Partial-init safe: a failed lstp_ipmi_init() unwinds through it as well. */
> +static void lstp_ipmi_ctx_release(struct kref *ref)
> +{
> +	struct lstp_ipmi_ctx *ctx = container_of(ref, struct lstp_ipmi_ctx, ref);
> +	struct lstp_channel *ch = ctx->ch;
> +
> +	kfifo_free(&ctx->fifo);
> +	if (ctx->ida_id >= 0)
> +		ida_free(&lstp_ipmi_ida, ctx->ida_id);
> +	kfree(ctx->miscdev.name);
> +	mutex_destroy(&ctx->tx_lock);
> +	kfree(ctx);
> +	lstp_channel_put(ch);
> +}
> +
> +/* Devres action for the bind's reference, booked ahead of the node's own. */
> +static void lstp_ipmi_ctx_put(void *data)
> +{
> +	struct lstp_ipmi_ctx *ctx = data;
> +
> +	kref_put(&ctx->ref, lstp_ipmi_ctx_release);
> +}
> +
> +static inline struct lstp_ipmi_ctx *to_ctx(struct file *file)
> +{
> +	return container_of(file->private_data, struct lstp_ipmi_ctx, miscdev);
> +}
> +
> +static int lstp_ipmi_open(struct inode *inode, struct file *file)
> +{
> +	struct lstp_ipmi_ctx *ctx = to_ctx(file);
> +	int ret = 0;
> +
> +	spin_lock_irq(&ctx->lock);
> +	if (lstp_ipmi_gone(ctx))
> +		ret = -ENODEV;
> +	else if (ctx->running)
> +		ret = -EBUSY;
> +	else
> +		ctx->running = true;
> +	spin_unlock_irq(&ctx->lock);
> +
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * misc_mtx spans this ->open and misc_deregister(), which the bind's
> +	 * @ref outlasts, so @ctx is live here and this cannot race the final put.
> +	 */
> +	kref_get(&ctx->ref);
> +	return 0;
> +}
> +
> +/* Read one queued request: the userspace header, then the payload. */
> +static ssize_t lstp_ipmi_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> +{
> +	struct lstp_ipmi_ctx *ctx = to_ctx(file);
> +	struct ipmi_lstp_msg msg;
> +	unsigned long flags;
> +	unsigned int len = 0;
> +	size_t ulen = 0;
> +
> +	/*
> +	 * copy_to_user() may sleep, so drain to @msg under @ctx->lock first.
> +	 * Loop: two readers on one fd can both wake, only one wins the record.
> +	 */
> +	while (!len) {
> +		/* Before the queue: a request queued when the bind went cannot be answered. */
> +		if (lstp_ipmi_gone(ctx))
> +			return -ENODEV;
> +		if (kfifo_is_empty(&ctx->fifo)) {
> +			if (file->f_flags & O_NONBLOCK)
> +				return -EAGAIN;
> +			int ret = wait_event_interruptible(ctx->req_wq, lstp_ipmi_readable(ctx));
> +
> +			if (ret)
> +				return ret;
> +		}
> +
> +		spin_lock_irqsave(&ctx->lock, flags);
> +		/*
> +		 * Peek before consuming: kfifo_out() drops whatever of the
> +		 * record does not fit, so a short @count would retire a
> +		 * request the caller never saw. Leave it queued and let the
> +		 * caller come back with room for it.
> +		 */
> +		len = kfifo_out_peek(&ctx->fifo, &msg, sizeof(msg));
> +		ulen = len ? LSTP_IPMI_UAPI_HDR_LEN + msg.header.len : 0;
> +		if (len && ulen <= count) {
> +			kfifo_skip(&ctx->fifo);
> +			WRITE_ONCE(ctx->read_tag, msg.header.msg_num);
> +		}
> +		spin_unlock_irqrestore(&ctx->lock, flags);
> +
> +		if (ulen > count)
> +			return -EINVAL;
> +	}
> +
> +	if (copy_to_user(buf, &msg.header, LSTP_IPMI_UAPI_HDR_LEN) ||
> +	    copy_to_user(buf + LSTP_IPMI_UAPI_HDR_LEN, msg.payload, msg.header.len))
> +		return -EFAULT;
> +	return ulen;
> +}
> +
> +/*
> + * Forward a response. A write whose @msg_num misses the outstanding tag is
> + * dropped and reported as consumed, so userspace need not track the race
> + * against a request that arrived meanwhile. Without the tag in the ABI, a
> + * response answers the request read() handed out last.
> + */
> +static ssize_t lstp_ipmi_write(struct file *file, const char __user *buf, size_t count,
> +			       loff_t *ppos)
> +{
> +	struct lstp_ipmi_ctx *ctx = to_ctx(file);
> +	struct lstp_channel *ch = ctx->ch;
> +	struct ipmi_lstp_msg msg;
> +	ssize_t ret;
> +
> +	if (count < LSTP_IPMI_UAPI_HDR_LEN || count > LSTP_IPMI_UAPI_MSG_MAX)
> +		return -EINVAL;
> +
> +	/* The untagged bound admits struct padding past the payload; drop it. */
> +	if (copy_from_user(&msg.header, buf, LSTP_IPMI_UAPI_HDR_LEN) ||
> +	    copy_from_user(msg.payload, buf + LSTP_IPMI_UAPI_HDR_LEN,
> +			   min(count - LSTP_IPMI_UAPI_HDR_LEN, sizeof(msg.payload))))
> +		return -EFAULT;
> +
> +	/* Held through the send; see lstp_ipmi_stop_and_deregister(). */
> +	guard(mutex)(&ctx->tx_lock);
> +	if (lstp_ipmi_gone(ctx))
> +		return -ENODEV;
> +
> +	if (!LSTP_IPMI_MSG_NUM)
> +		msg.header.msg_num = READ_ONCE(ctx->read_tag);
> +
> +	/*
> +	 * 0 tags no request; it is only @msg_count's value before the first.
> +	 * Stale tag read is fine; pairs with WRITE_ONCE in the IRQ producer.
> +	 */
> +	if (!msg.header.msg_num || msg.header.msg_num != READ_ONCE(ctx->msg_count))
> +		return count;
> +
> +	if (!msg.header.len || msg.header.len > IPMI_LSTP_PAYLOAD_MAX ||
> +	    count < LSTP_IPMI_UAPI_HDR_LEN + msg.header.len)
> +		return -EINVAL;
> +
> +	ret = lstp_send(ch, LSTP_IPMI_CMD_MESSAGE, msg.payload, msg.header.len);
> +	if (ret && ret != -ENODEV)
> +		dev_err_ratelimited(ch->dev, "%s: ch_%d: Could not forward response (%pe)\n",
> +				    __func__, ch->ch_id, ERR_PTR(ret));
> +
> +	return (ret < 0) ? ret : count;
> +}
> +
> +static int lstp_ipmi_release(struct inode *inode, struct file *file)
> +{
> +	struct lstp_ipmi_ctx *ctx = to_ctx(file);
> +
> +	spin_lock_irq(&ctx->lock);
> +	ctx->running = false;
> +	spin_unlock_irq(&ctx->lock);
> +
> +	kref_put(&ctx->ref, lstp_ipmi_ctx_release);
> +
> +	return 0;
> +}
> +
> +static __poll_t lstp_ipmi_poll(struct file *file, poll_table *wait)
> +{
> +	struct lstp_ipmi_ctx *ctx = to_ctx(file);
> +
> +	poll_wait(file, &ctx->req_wq, wait);
> +	if (lstp_ipmi_gone(ctx))
> +		return EPOLLHUP;
> +	if (!kfifo_is_empty(&ctx->fifo))
> +		return EPOLLIN | EPOLLRDNORM;
> +
> +	return 0;
> +}
> +
> +static const struct file_operations lstp_ipmi_fops = {
> +	.owner = THIS_MODULE,
> +	.open = lstp_ipmi_open,
> +	.read = lstp_ipmi_read,
> +	.write = lstp_ipmi_write,
> +	.release = lstp_ipmi_release,
> +	.poll = lstp_ipmi_poll,
> +};
> +
> +/*
> + * @stopped before the wake: this runs ahead of the framework's fence action, so
> + * a reader woken without it would find nothing changed and sleep again. The
> + * empty @tx_lock section then waits out a write() that tested @stopped before
> + * it went up, so no response is sent once the unwind moves on; a send is
> + * bounded by the USB timeout.
> + */
> +static void lstp_ipmi_stop_and_deregister(void *data)
> +{
> +	struct lstp_ipmi_ctx *ctx = data;
> +
> +	misc_deregister(&ctx->miscdev);
> +	WRITE_ONCE(ctx->stopped, true);
> +	wake_up_all(&ctx->req_wq);
> +	scoped_guard(mutex, &ctx->tx_lock) {
> +	}
> +}
> +
> +/*
> + * ops->irq_packet. Requests are never NACKed, so drop-oldest is the whole
> + * flow-control policy.
> + */
> +static void lstp_ipmi_irq_callback(struct lstp_channel *ch, struct lstp_packet *pkt)
> +{
> +	struct lstp_ipmi_ctx *ctx = ch->priv;
> +	u16 rx_len = le16_to_cpu(pkt->hdr.length);
> +	struct ipmi_lstp_msg msg;
> +	unsigned long flags;
> +	unsigned int dropped = 0;
> +
> +	if (rx_len < IPMI_MIN_MSG_LEN || rx_len > IPMI_LSTP_PAYLOAD_MAX) {
> +		dev_warn_ratelimited(ch->dev, "%s: ch_%d: Invalid IPMI request length %u\n",
> +				     __func__, ch->ch_id, rx_len);
> +		return;
> +	}
> +
> +	unsigned int msg_size = sizeof(msg.header) + rx_len;
> +
> +	msg.header.len = rx_len;
> +	memcpy(msg.payload, pkt->payload, rx_len);
> +
> +	spin_lock_irqsave(&ctx->lock, flags);
> +	/*
> +	 * Skip 0 on wrap: it is the initial value, meaning nothing outstanding,
> +	 * so no request may carry it. Pairs with the READ_ONCE in write().
> +	 */
> +	u8 tag = ctx->msg_count + 1;
> +
> +	msg.header.msg_num = tag ?: 1;
> +	WRITE_ONCE(ctx->msg_count, msg.header.msg_num);
> +	while (kfifo_avail(&ctx->fifo) < msg_size) {
> +		kfifo_skip(&ctx->fifo);
> +		dropped++;
> +	}
> +	kfifo_in(&ctx->fifo, &msg, msg_size);
> +	spin_unlock_irqrestore(&ctx->lock, flags);
> +
> +	if (dropped)
> +		dev_warn_ratelimited(ch->dev, "%s: ch_%d: FIFO full, dropped %u stale request(s)\n",
> +				     __func__, ch->ch_id, dropped);
> +
> +	wake_up_all(&ctx->req_wq);
> +}
> +
> +/*
> + * Build this bind's context and its "ipmi-lstpN" node name. An fd held across
> + * the unbind keeps the context, and with it the number, until it closes; the
> + * next bind takes the lowest number free.
> + */
> +static int lstp_ipmi_init(struct lstp_channel *ch, const struct lstp_channel_init_info *info)
> +{
> +	struct lstp_ipmi_ctx *ctx = kzalloc_obj(*ctx);
> +
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	kref_init(&ctx->ref);
> +	ctx->ida_id = -1;
> +	ctx->ch = lstp_channel_get(ch);
> +	spin_lock_init(&ctx->lock);
> +	mutex_init(&ctx->tx_lock);
> +	init_waitqueue_head(&ctx->req_wq);
> +
> +	int ret = kfifo_alloc(&ctx->fifo, BUFFER_SIZE, GFP_KERNEL);
> +
> +	if (ret)
> +		goto err_put;
> +
> +	ret = ida_alloc(&lstp_ipmi_ida, GFP_KERNEL);
> +	if (ret < 0)
> +		goto err_put;
> +	ctx->ida_id = ret;
> +	ctx->miscdev.name = kasprintf(GFP_KERNEL, "ipmi-lstp%d", ctx->ida_id);
> +	if (!ctx->miscdev.name) {
> +		ret = -ENOMEM;
> +		goto err_put;
> +	}
> +
> +	if (fwnode_property_present(ch->fwnode, "label"))
> +		dev_notice_once(ch->dev,
> +				"%s: ch_%d: Firmware \"label\" no longer names the node, which is %s; use a udev symlink for a stable name\n",
> +				__func__, ch->ch_id, ctx->miscdev.name);
> +
> +	ctx->miscdev.minor = MISC_DYNAMIC_MINOR;
> +	ctx->miscdev.fops = &lstp_ipmi_fops;
> +	ctx->miscdev.parent = ch->dev;

It seems a little strange to set this up here and then register it in
the next section.  Why not set it up right before the register?

The breakup of the probe function seems a little unnatural.  Not a
bit deal, but it makes the code a little harder to follow.

I didn't see anything else in a first review here.

-corey

> +
> +	ch->priv = ctx;
> +	dev_dbg(ch->dev, "%s: ch_%d: Initialized as %s\n", __func__, ch->ch_id, ch->display_name);
> +	return 0;
> +
> +err_put:
> +	kref_put(&ctx->ref, lstp_ipmi_ctx_release);
> +	return ret;
> +}
> +
> +static int lstp_ipmi_start(struct lstp_channel *ch, struct lstp_ipmi_ctx *ctx)
> +{
> +	int ret = misc_register(&ctx->miscdev);
> +
> +	if (ret) {
> +		dev_err(ch->dev, "%s: ch_%d: Could not register miscdevice (%pe)\n", __func__,
> +			ch->ch_id, ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	ret = devm_add_action_or_reset(ch->dev, lstp_ipmi_stop_and_deregister, ctx);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(ch->dev, "%s: ch_%d: Started as %s\n", __func__, ch->ch_id, ch->display_name);
> +	return 0;
> +}
> +
> +static int lstp_ipmi_probe(struct auxiliary_device *auxdev, const struct auxiliary_device_id *id)
> +{
> +	struct lstp_channel *ch = lstp_channel_from_auxdev(auxdev);
> +	const struct lstp_channel_init_info *info = dev_get_platdata(&auxdev->dev);
> +
> +	if (!info)
> +		return -ENODEV;
> +
> +	int ret = lstp_ipmi_init(ch, info);
> +
> +	if (ret)
> +		return ret;
> +
> +	/* Booked first, so it unwinds after the node's deregister action. */
> +	ret = devm_add_action_or_reset(ch->dev, lstp_ipmi_ctx_put, ch->priv);
> +	if (ret)
> +		return ret;
> +
> +	return lstp_ipmi_start(ch, ch->priv);
> +}
> +
> +static const struct lstp_ops lstp_ipmi_ops = {
> +	.irq_packet = lstp_ipmi_irq_callback,
> +};
> +
> +static const struct auxiliary_device_id lstp_ipmi_id_table[] = { { .name = "lstp.ipmi" }, {} };
> +MODULE_DEVICE_TABLE(auxiliary, lstp_ipmi_id_table);
> +
> +static struct lstp_auxiliary_driver lstp_ipmi_drv = {
> +	.adrv = {
> +		.name = "ipmi",
> +		.probe = lstp_ipmi_probe,
> +		.id_table = lstp_ipmi_id_table,
> +	},
> +	.ops = &lstp_ipmi_ops,
> +};
> +module_lstp_auxiliary_driver(lstp_ipmi_drv);
> +
> +MODULE_IMPORT_NS("LSTP");
> +MODULE_DESCRIPTION("LSTP BMC-side IPMI driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.43.0
> 
