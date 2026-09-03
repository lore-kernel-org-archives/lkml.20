Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710F14052A7;
	Thu,  3 Sep 2026 09:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429224; cv=none; b=H5SmDgyxj6K5D0CUMEhzmuGmpUK2OTtFZkiEbnO5U8DuaObqqEN5R+YWBv00HKKhDQ4Z1RnjE6La34B2HE8YfjyQ4exGzC4bPmzj3iyma+eXFj4x4XfDvQ3NObrIVcWgVgdfvxUjsMD9Wyl34SzKg0Hx0h9ZLbekOREZ9Jqoezk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429224; c=relaxed/simple;
	bh=Wc5TdIv8uRrn38ASAmyF99oVNglEKJfgoFK11okp56U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXKPbU4dI8q6diyerY4euvyRKgqx9sHVjFl7j3rxxiDCzk+SHD5kbY2kzew1ahVXtWsoGZCv6CFKK/wv1uVoq3yrzCpqI5e6NFdFsP1yOkPlgeqaDTF4nQ3jZi2BVfv68JWNhuyzU1uCJkjIoOKu3Vhz3WaY70LZWlsRBab6xtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdZkLTdy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kdZkLTdy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE7D1F00A3A;
	Thu,  3 Sep 2026 09:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788429222;
	bh=HnQbaAtYhKE0E+XADRG2xsLeZ3cDcrLqIfeiOr9AQNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kdZkLTdy16EejRFRwT7hzGjpS7HgGJt0LuxCmYZNhOxPtfmvkMN+qgVVZliHUJIN4
	 FV9X/JU6GYuVAnwRzJQrgtMZMVFEr20qeaBJRZUTwRpHDOgP+FWwZHBD7rId3LIIDp
	 TBHe6OAjWzmzSmMDV6wT0r8SlRKjF0PFBWyCjTAHobiuEOne0HoyjfmLBRy1lTRfxM
	 mlyNJU0hkR6Otj1I1NgRRh1Uw08vnZImCOWCGTXtOzmfkyplKQ4LNhoIWH4mtFreeW
	 p2WdeIDAoTotb3qJhEeZdmgvND0tcZxh6o9HvfvSA9FXo1DKPRWNvZqRRhwpRiTjvC
	 GTT0LUANE4AzA==
Date: Thu, 3 Sep 2026 10:53:38 +0100
From: Lee Jones <lee@kernel.org>
To: a0282524688@gmail.com
Cc: Ming Yu <tmyu0@nuvoton.com>, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH v7 02/10] mfd: nct6694: Refactor USB-specific data into
 nct6694_usb_data
Message-ID: <20260903095338.GK2133376@google.com>
References: <20260821033505.4017901-1-a0282524688@gmail.com>
 <20260821033505.4017901-3-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821033505.4017901-3-a0282524688@gmail.com>

On Fri, 21 Aug 2026, a0282524688@gmail.com wrote:

> From: Ming Yu <a0282524688@gmail.com>
> 
> Separate USB transport-specific fields from the core nct6694 structure
> into a new nct6694_usb_data structure. This decouples the shared MFD
> core from the USB transport layer, preparing the driver for potential
> support of alternative transport backends in the future.
> 
> The following fields are moved into nct6694_usb_data:
>   - access_lock
>   - int_in_urb
>   - udev
>   - usb_msg
>   - int_buffer
> 
> The core nct6694 structure now holds a void *priv pointer to reference

priv is a terrible name.  Please improve it.

Even 'transport_data' is better, but I'm sure you can improve on it still.

> the transport-specific data. USB-only definitions (vendor/product IDs,
> endpoint addresses, URB timeout, and the USB message union) are also
> moved from the shared header into the USB driver source file.
> 
> Signed-off-by: Ming Yu <a0282524688@gmail.com>
> ---
> Changes in v7:
> 
> Changes in v6:
> 
> Changes in v5:
> - Split from the monolithic v4 patch to follow the single logical change
>   principle.
> 
>  drivers/mfd/nct6694.c       | 76 ++++++++++++++++++++++++++-----------
>  include/linux/mfd/nct6694.h | 27 ++++---------
>  2 files changed, 62 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
> index 308b2fda3055..58c1cbcbe3f2 100644
> --- a/drivers/mfd/nct6694.c
> +++ b/drivers/mfd/nct6694.c
> @@ -10,8 +10,8 @@
>   */
>  
>  #include <linux/bits.h>
> -#include <linux/interrupt.h>
>  #include <linux/idr.h>
> +#include <linux/interrupt.h>
>  #include <linux/irq.h>
>  #include <linux/irqdomain.h>
>  #include <linux/kernel.h>
> @@ -22,6 +22,27 @@
>  #include <linux/spinlock.h>
>  #include <linux/usb.h>
>  
> +#define NCT6694_VENDOR_ID	0x0416
> +#define NCT6694_PRODUCT_ID	0x200B
> +#define NCT6694_INT_IN_EP	0x81
> +#define NCT6694_BULK_IN_EP	0x02
> +#define NCT6694_BULK_OUT_EP	0x03
> +
> +#define NCT6694_URB_TIMEOUT	1000
> +
> +union __packed nct6694_usb_msg {
> +	struct nct6694_cmd_header cmd_header;
> +	struct nct6694_response_header response_header;
> +};
> +
> +struct nct6694_usb_data {
> +	struct mutex access_lock;
> +	struct urb *int_in_urb;
> +	struct usb_device *udev;

'udev' is ambiguous in Linux IMHO.  Can you use 'usb_dev' instead?

> +	union nct6694_usb_msg *usb_msg;
> +	__le32 *int_buffer;
> +};
> +
>  static const struct mfd_cell nct6694_devs[] = {
>  	MFD_CELL_NAME("nct6694-gpio"),
>  	MFD_CELL_NAME("nct6694-gpio"),
> @@ -96,11 +117,12 @@ static int nct6694_response_err_handling(struct nct6694 *nct6694, unsigned char
>   */
>  int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf)
>  {
> -	union nct6694_usb_msg *msg = nct6694->usb_msg;
> -	struct usb_device *udev = nct6694->udev;
> +	struct nct6694_usb_data *udata = nct6694->priv;

No one knows what udata is.  Be explicit, 'usb_data'?

Then we have; usb_dev, usb_msg and usb_data - which makes my OCD happy!

> +	union nct6694_usb_msg *msg = udata->usb_msg;
> +	struct usb_device *udev = udata->udev;
>  	int tx_len, rx_len, ret;
>  
> -	guard(mutex)(&nct6694->access_lock);
> +	guard(mutex)(&udata->access_lock);
>  
>  	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
>  	msg->cmd_header.hctrl = NCT6694_HCTRL_GET;
> @@ -146,11 +168,12 @@ EXPORT_SYMBOL_GPL(nct6694_read_msg);
>   */
>  int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf)
>  {
> -	union nct6694_usb_msg *msg = nct6694->usb_msg;
> -	struct usb_device *udev = nct6694->udev;
> +	struct nct6694_usb_data *udata = nct6694->priv;
> +	union nct6694_usb_msg *msg = udata->usb_msg;
> +	struct usb_device *udev = udata->udev;
>  	int tx_len, rx_len, ret;
>  
> -	guard(mutex)(&nct6694->access_lock);
> +	guard(mutex)(&udata->access_lock);
>  
>  	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
>  	msg->cmd_header.hctrl = NCT6694_HCTRL_SET;
> @@ -277,6 +300,7 @@ static int nct6694_usb_probe(struct usb_interface *iface,
>  	struct usb_endpoint_descriptor *int_endpoint;
>  	struct usb_host_interface *interface;
>  	struct device *dev = &iface->dev;
> +	struct nct6694_usb_data *udata;
>  	struct nct6694 *nct6694;
>  	int ret;
>  
> @@ -284,18 +308,26 @@ static int nct6694_usb_probe(struct usb_interface *iface,
>  	if (!nct6694)
>  		return -ENOMEM;
>  
> -	nct6694->usb_msg = devm_kzalloc(dev, sizeof(union nct6694_usb_msg), GFP_KERNEL);
> -	if (!nct6694->usb_msg)
> +	udata = devm_kzalloc(dev, sizeof(*udata), GFP_KERNEL);
> +	if (!udata)
> +		return -ENOMEM;
> +
> +	udata->usb_msg = devm_kzalloc(dev, sizeof(*udata->usb_msg), GFP_KERNEL);
> +	if (!udata->usb_msg)
>  		return -ENOMEM;
>  
> -	nct6694->int_buffer = devm_kzalloc(dev, sizeof(*nct6694->int_buffer), GFP_KERNEL);
> -	if (!nct6694->int_buffer)
> +	udata->int_buffer = devm_kzalloc(dev, sizeof(*udata->int_buffer), GFP_KERNEL);
> +	if (!udata->int_buffer)
>  		return -ENOMEM;
>  
> -	nct6694->int_in_urb = usb_alloc_urb(0, GFP_KERNEL);
> -	if (!nct6694->int_in_urb)
> +	udata->int_in_urb = usb_alloc_urb(0, GFP_KERNEL);
> +	if (!udata->int_in_urb)
>  		return -ENOMEM;
>  
> +	udata->udev = udev;
> +
> +	nct6694->priv = udata;
> +
>  	nct6694->domain = irq_domain_create_simple(NULL, NCT6694_NR_IRQS, 0,
>  						   &nct6694_irq_domain_ops,
>  						   nct6694);
> @@ -305,7 +337,6 @@ static int nct6694_usb_probe(struct usb_interface *iface,
>  	}
>  
>  	nct6694->dev = dev;
> -	nct6694->udev = udev;
>  
>  	ida_init(&nct6694->gpio_ida);
>  	ida_init(&nct6694->i2c_ida);
> @@ -314,7 +345,7 @@ static int nct6694_usb_probe(struct usb_interface *iface,
>  
>  	spin_lock_init(&nct6694->irq_lock);
>  
> -	ret = devm_mutex_init(dev, &nct6694->access_lock);
> +	ret = devm_mutex_init(dev, &udata->access_lock);
>  	if (ret)
>  		goto err_ida;
>  
> @@ -326,11 +357,11 @@ static int nct6694_usb_probe(struct usb_interface *iface,
>  		goto err_ida;
>  	}
>  
> -	usb_fill_int_urb(nct6694->int_in_urb, udev, usb_rcvintpipe(udev, NCT6694_INT_IN_EP),
> -			 nct6694->int_buffer, sizeof(*nct6694->int_buffer), usb_int_callback,
> +	usb_fill_int_urb(udata->int_in_urb, udev, usb_rcvintpipe(udev, NCT6694_INT_IN_EP),
> +			 udata->int_buffer, sizeof(*udata->int_buffer), usb_int_callback,
>  			 nct6694, int_endpoint->bInterval);
>  
> -	ret = usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
> +	ret = usb_submit_urb(udata->int_in_urb, GFP_KERNEL);
>  	if (ret)
>  		goto err_ida;
>  
> @@ -343,7 +374,7 @@ static int nct6694_usb_probe(struct usb_interface *iface,
>  	return 0;
>  
>  err_mfd:
> -	usb_kill_urb(nct6694->int_in_urb);
> +	usb_kill_urb(udata->int_in_urb);
>  err_ida:
>  	ida_destroy(&nct6694->wdt_ida);
>  	ida_destroy(&nct6694->canfd_ida);
> @@ -351,22 +382,23 @@ static int nct6694_usb_probe(struct usb_interface *iface,
>  	ida_destroy(&nct6694->gpio_ida);
>  	irq_domain_remove(nct6694->domain);
>  err_urb:
> -	usb_free_urb(nct6694->int_in_urb);
> +	usb_free_urb(udata->int_in_urb);
>  	return ret;
>  }
>  
>  static void nct6694_usb_disconnect(struct usb_interface *iface)
>  {
>  	struct nct6694 *nct6694 = usb_get_intfdata(iface);
> +	struct nct6694_usb_data *udata = nct6694->priv;
>  
>  	mfd_remove_devices(nct6694->dev);
> -	usb_kill_urb(nct6694->int_in_urb);
> +	usb_kill_urb(udata->int_in_urb);
>  	ida_destroy(&nct6694->wdt_ida);
>  	ida_destroy(&nct6694->canfd_ida);
>  	ida_destroy(&nct6694->i2c_ida);
>  	ida_destroy(&nct6694->gpio_ida);
>  	irq_domain_remove(nct6694->domain);
> -	usb_free_urb(nct6694->int_in_urb);
> +	usb_free_urb(udata->int_in_urb);
>  }
>  
>  static const struct usb_device_id nct6694_ids[] = {
> diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
> index 3c683e317aa3..3f5dd53f38de 100644
> --- a/include/linux/mfd/nct6694.h
> +++ b/include/linux/mfd/nct6694.h
> @@ -2,12 +2,18 @@
>  /*
>   * Copyright (C) 2025 Nuvoton Technology Corp.
>   *
> - * Nuvoton NCT6694 USB transaction and data structure.
> + * Nuvoton NCT6694 core definitions shared by all transport drivers
> + * and sub-device drivers.
>   */
>  
>  #ifndef __MFD_NCT6694_H
>  #define __MFD_NCT6694_H
>  
> +#include <linux/idr.h>
> +#include <linux/mutex.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +
>  #define NCT6694_HWMON_MOD	0x00
>  #define NCT6694_PWM_MOD		0x01
>  #define NCT6694_I2C_MOD		0x03
> @@ -17,17 +23,9 @@
>  #define NCT6694_RPT_MOD		0xFF
>  #define NCT6694_GPIO_MOD	NCT6694_RPT_MOD
>  
> -#define NCT6694_VENDOR_ID	0x0416
> -#define NCT6694_PRODUCT_ID	0x200B
> -#define NCT6694_INT_IN_EP	0x81
> -#define NCT6694_BULK_IN_EP	0x02
> -#define NCT6694_BULK_OUT_EP	0x03
> -
>  #define NCT6694_HCTRL_SET	0x40
>  #define NCT6694_HCTRL_GET	0x80
>  
> -#define NCT6694_URB_TIMEOUT	1000
> -
>  enum nct6694_irq_id {
>  	NCT6694_IRQ_GPIO0 = 0,
>  	NCT6694_IRQ_GPIO1,
> @@ -84,11 +82,6 @@ struct __packed nct6694_response_header {
>  	__le16 len;
>  };
>  
> -union __packed nct6694_usb_msg {
> -	struct nct6694_cmd_header cmd_header;
> -	struct nct6694_response_header response_header;
> -};
> -
>  struct nct6694 {
>  	struct device *dev;
>  	struct ida gpio_ida;
> @@ -96,13 +89,9 @@ struct nct6694 {
>  	struct ida canfd_ida;
>  	struct ida wdt_ida;
>  	struct irq_domain *domain;
> -	struct mutex access_lock;
>  	spinlock_t irq_lock;
> -	struct urb *int_in_urb;
> -	struct usb_device *udev;
> -	union nct6694_usb_msg *usb_msg;
> -	__le32 *int_buffer;
>  	unsigned int irq_enable;
> +	void *priv;
>  };
>  
>  int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf);
> -- 
> 2.34.1
> 

-- 
Lee Jones
