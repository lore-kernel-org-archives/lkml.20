Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6FD451997;
	Thu,  3 Sep 2026 10:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432179; cv=none; b=FR68mu/0pQl+U9PXV5oSRxNJQ64rlfDSqAP+XzEnHDkk6jt7kDVtFz+N3qWr9jKGb/TSD2O0LTAxgoeVAWgWmi2cIJoQrqnxJZBh7WAtf029n53V0ui+C+fgXOsW8nyX9VCeRAY7Pm2n8o4eHMWoBUvSgtb1pFLa96ePQSSTwg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432179; c=relaxed/simple;
	bh=gs88Hmq4jcgellzfayjZ1vc2/9UeiYEvVrYiIF8EmNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iF02dbsD/SFBwr9NeCTYSxWVDSuEZnyAnZOEqKz4TmqQh8KNpDFhK8tRVQ5/KrCcNVYCNtgQeBQR1hd6H4dA0tX3CuSRwrWqa+2+Fz8NFw5aCtGKyAKzp/IwEJyoW5aPz5A6std2Vec0OF6o2X8iEX9S7AKo9rcfoVpUnxzCgHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PxL45h+n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PxL45h+n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D057D1F000E9;
	Thu,  3 Sep 2026 10:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788432176;
	bh=yHr2PAZ53abmK/CyHbM2lL4kYKOCpr4nXWcSBZfUT44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PxL45h+nQFFZLxjowt2CIQhRtWDOR/eY5vfraH5yVrmWWEJr0EUNvHtZT3rsQbjcX
	 M8DgmNzaIiI23KL+loplOHIRfOeweDmh+psYov53Xcjm3PJuKwzEd6UW4Dffk9Ljao
	 /dB4J8c03q7Y01lTvG5Y6Z1tkNLWnBMoGzWAu+p3T+BgPzif1Zn5MRnVuIqTLUSoG2
	 BT024jNrhTF1cpr4uenhLz1ORRApjsDte5Mt4xAUEcYPlBmqMogvcDnyqrOkSRryl5
	 ML/f0cQTUWFmXjmk5X0JkujWzSsI0pUccIXbxjYC+Gh7JdJ/j6rZebamdFED4FPra+
	 GTP6B1LZAe/tg==
Date: Thu, 3 Sep 2026 11:42:53 +0100
From: Lee Jones <lee@kernel.org>
To: a0282524688@gmail.com
Cc: Ming Yu <tmyu0@nuvoton.com>, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH v7 05/10] mfd: nct6694: Extract core device management
 into a separate module
Message-ID: <20260903104253.GM2133376@google.com>
References: <20260821033505.4017901-1-a0282524688@gmail.com>
 <20260821033505.4017901-6-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821033505.4017901-6-a0282524688@gmail.com>

On Fri, 21 Aug 2026, a0282524688@gmail.com wrote:

> From: Ming Yu <a0282524688@gmail.com>
> 
> Extract the transport-agnostic core logic, including IRQ domain setup,
> IDA initialization, and MFD sub-device registration, from the USB driver
> into a new nct6694-core.c module.
> 
> The core routines are exported as nct6694_core_probe() and
> nct6694_core_remove() to be consumed by the transport drivers. The USB
> driver is updated to pass its specific MFD cells to the core probe
> routine.
> 
> This completes the transport abstraction, ensuring that the shared
> device management logic is cleanly separated from the underlying I/O
> implementation, and is fully ready for new transport backends
> (e.g., HIF).
> 
> Signed-off-by: Ming Yu <a0282524688@gmail.com>
> ---
> Changes in v7:
> 
> Changes in v6:
> - Reordered to sit before the transport-abstraction patch; no functional
>   change.
> 
> Changes in v5:
> - Split from the monolithic v4 patch to follow the single logical change
>   principle.
> 
>  MAINTAINERS                 |   2 +-
>  drivers/mfd/Makefile        |   1 +
>  drivers/mfd/nct6694-core.c  | 136 ++++++++++++++++++++++++++++++++++++
>  drivers/mfd/nct6694-usb.c   |  91 ++----------------------
>  include/linux/mfd/nct6694.h |   9 ++-
>  5 files changed, 153 insertions(+), 86 deletions(-)
>  create mode 100644 drivers/mfd/nct6694-core.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 89d7339f3613..f1894e88ba62 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19356,7 +19356,7 @@ S:	Supported
>  F:	drivers/gpio/gpio-nct6694.c
>  F:	drivers/hwmon/nct6694-hwmon.c
>  F:	drivers/i2c/busses/i2c-nct6694.c
> -F:	drivers/mfd/nct6694-usb.c
> +F:	drivers/mfd/nct6694-*.c
>  F:	drivers/net/can/usb/nct6694_canfd.c
>  F:	drivers/rtc/rtc-nct6694.c
>  F:	drivers/watchdog/nct6694_wdt.c
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 48caac64f3d8..10c19a19541e 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -124,6 +124,7 @@ obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
>  
>  obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
>  
> +obj-$(CONFIG_MFD_NCT6694)	+= nct6694-core.o
>  obj-$(CONFIG_MFD_NCT6694_USB)	+= nct6694-usb.o
>  
>  obj-$(CONFIG_MFD_CORE)		+= mfd-core.o
> diff --git a/drivers/mfd/nct6694-core.c b/drivers/mfd/nct6694-core.c
> new file mode 100644
> index 000000000000..36dfaa2e327f
> --- /dev/null
> +++ b/drivers/mfd/nct6694-core.c
> @@ -0,0 +1,136 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026 Nuvoton Technology Corp.
> + *
> + * Nuvoton NCT6694 MFD core driver.
> + *
> + * This provides common registration for IRQ domain, IDA pools,
> + * and MFD sub-devices shared by all transport drivers.
> + */
> +
> +#include <linux/idr.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/nct6694.h>
> +#include <linux/module.h>
> +#include <linux/spinlock.h>
> +
> +static void nct6694_irq_enable(struct irq_data *data)
> +{
> +	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
> +	irq_hw_number_t hwirq = irqd_to_hwirq(data);
> +
> +	guard(spinlock_irqsave)(&nct6694->irq_lock);
> +
> +	nct6694->irq_enable |= BIT(hwirq);
> +}
> +
> +static void nct6694_irq_disable(struct irq_data *data)
> +{
> +	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
> +
> +	guard(spinlock_irqsave)(&nct6694->irq_lock);
> +
> +	nct6694->irq_enable &= ~BIT(hwirq);
> +}
> +
> +static const struct irq_chip nct6694_irq_chip = {
> +	.name = "nct6694-irq",
> +	.flags = IRQCHIP_SKIP_SET_WAKE,
> +	.irq_enable = nct6694_irq_enable,
> +	.irq_disable = nct6694_irq_disable,
> +};
> +
> +static int nct6694_irq_domain_map(struct irq_domain *d, unsigned int irq,
> +				  irq_hw_number_t hw)
> +{
> +	struct nct6694 *nct6694 = d->host_data;
> +
> +	irq_set_chip_data(irq, nct6694);
> +	irq_set_chip_and_handler(irq, &nct6694_irq_chip, handle_simple_irq);
> +
> +	return 0;
> +}
> +
> +static void nct6694_irq_domain_unmap(struct irq_domain *d, unsigned int irq)
> +{
> +	irq_set_chip_and_handler(irq, NULL, NULL);
> +	irq_set_chip_data(irq, NULL);
> +}
> +
> +static const struct irq_domain_ops nct6694_irq_domain_ops = {
> +	.map	= nct6694_irq_domain_map,
> +	.unmap	= nct6694_irq_domain_unmap,
> +};
> +
> +/**
> + * nct6694_core_probe() - Register IRQ domain, IDAs, and MFD sub-devices
> + * @dev: parent device (USB interface or platform device)
> + * @nct6694: initialized nct6694 structure with its transport regmap set
> + *
> + * This function completes the common probe steps shared by all transport
> + * drivers: IRQ domain creation, IDA initialization, and MFD cell registration.
> + *
> + * The caller must have already set nct6694->dev, nct6694->priv, and
> + * nct6694->regmap before calling this.
> + *
> + * Return: 0 on success or negative errno on failure.
> + */
> +int nct6694_core_probe(struct device *dev, struct nct6694 *nct6694,

You can put nct6694 into the device's private struct attribute which
means that you no longer have to pass it around.

I'm not particularly keen on passing mfd_cells around.  Why not call
mfd_add_*() from the transport's probe?

> +		       const struct mfd_cell *cells, int n_cells)
> +{
> +	int ret;
> +
> +	spin_lock_init(&nct6694->irq_lock);
> +
> +	ida_init(&nct6694->gpio_ida);
> +	ida_init(&nct6694->i2c_ida);
> +	ida_init(&nct6694->canfd_ida);
> +	ida_init(&nct6694->wdt_ida);
> +
> +	nct6694->domain = irq_domain_create_simple(NULL, NCT6694_NR_IRQS, 0,
> +						   &nct6694_irq_domain_ops,
> +						   nct6694);
> +	if (!nct6694->domain) {
> +		ret = -ENODEV;

Should we return '-ENOMEM' here instead of '-ENODEV', as this represents
a resource allocation failure?

> +		goto err_ida;
> +	}
> +
> +	ret = mfd_add_hotplug_devices(dev, cells, n_cells);
> +	if (ret)
> +		goto err_domain;
> +
> +	return 0;
> +
> +err_domain:
> +	irq_domain_remove(nct6694->domain);
> +err_ida:
> +	ida_destroy(&nct6694->wdt_ida);
> +	ida_destroy(&nct6694->canfd_ida);
> +	ida_destroy(&nct6694->i2c_ida);
> +	ida_destroy(&nct6694->gpio_ida);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(nct6694_core_probe);
> +
> +/**
> + * nct6694_core_remove() - Unregister MFD sub-devices and free core resources
> + * @nct6694: nct6694 structure previously passed to nct6694_core_probe()
> + */
> +void nct6694_core_remove(struct nct6694 *nct6694)

Should we also rename 'nct6694' to 'ddata' here?

> +{
> +	mfd_remove_devices(nct6694->dev);
> +	irq_domain_remove(nct6694->domain);
> +	ida_destroy(&nct6694->wdt_ida);
> +	ida_destroy(&nct6694->canfd_ida);
> +	ida_destroy(&nct6694->i2c_ida);
> +	ida_destroy(&nct6694->gpio_ida);
> +}
> +EXPORT_SYMBOL_GPL(nct6694_core_remove);
> +
> +MODULE_DESCRIPTION("Nuvoton NCT6694 MFD core driver");
> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/mfd/nct6694-usb.c b/drivers/mfd/nct6694-usb.c
> index 7c6b986db7f7..2289ebfde7fa 100644
> --- a/drivers/mfd/nct6694-usb.c
> +++ b/drivers/mfd/nct6694-usb.c
> @@ -10,7 +10,6 @@
>   */
>  
>  #include <linux/bits.h>
> -#include <linux/idr.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
>  #include <linux/irqdomain.h>
> @@ -19,7 +18,6 @@
>  #include <linux/mfd/nct6694.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> -#include <linux/spinlock.h>
>  #include <linux/usb.h>
>  
>  #define NCT6694_VENDOR_ID	0x0416
> @@ -246,57 +244,9 @@ static void nct6694_usb_int_callback(struct urb *urb)
>  resubmit:
>  	ret = usb_submit_urb(urb, GFP_ATOMIC);
>  	if (ret)
> -		dev_warn(nct6694->dev, "Failed to resubmit urb, status %pe",  ERR_PTR(ret));
> +		dev_warn(nct6694->dev, "Failed to resubmit urb, status %pe", ERR_PTR(ret));
>  }
>  
> -static void nct6694_irq_enable(struct irq_data *data)
> -{
> -	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
> -	irq_hw_number_t hwirq = irqd_to_hwirq(data);
> -
> -	guard(spinlock_irqsave)(&nct6694->irq_lock);
> -
> -	nct6694->irq_enable |= BIT(hwirq);
> -}
> -
> -static void nct6694_irq_disable(struct irq_data *data)
> -{
> -	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
> -	irq_hw_number_t hwirq = irqd_to_hwirq(data);
> -
> -	guard(spinlock_irqsave)(&nct6694->irq_lock);
> -
> -	nct6694->irq_enable &= ~BIT(hwirq);
> -}
> -
> -static const struct irq_chip nct6694_irq_chip = {
> -	.name = "nct6694-irq",
> -	.flags = IRQCHIP_SKIP_SET_WAKE,
> -	.irq_enable = nct6694_irq_enable,
> -	.irq_disable = nct6694_irq_disable,
> -};
> -
> -static int nct6694_irq_domain_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
> -{
> -	struct nct6694 *nct6694 = d->host_data;
> -
> -	irq_set_chip_data(irq, nct6694);
> -	irq_set_chip_and_handler(irq, &nct6694_irq_chip, handle_simple_irq);
> -
> -	return 0;
> -}
> -
> -static void nct6694_irq_domain_unmap(struct irq_domain *d, unsigned int irq)
> -{
> -	irq_set_chip_and_handler(irq, NULL, NULL);
> -	irq_set_chip_data(irq, NULL);
> -}
> -
> -static const struct irq_domain_ops nct6694_irq_domain_ops = {
> -	.map	= nct6694_irq_domain_map,
> -	.unmap	= nct6694_irq_domain_unmap,
> -};
> -
>  static int nct6694_usb_probe(struct usb_interface *iface,
>  			     const struct usb_device_id *id)
>  {
> @@ -330,35 +280,19 @@ static int nct6694_usb_probe(struct usb_interface *iface,
>  
>  	udata->udev = udev;
>  
> -	nct6694->priv = udata;
> -
> -	nct6694->domain = irq_domain_create_simple(NULL, NCT6694_NR_IRQS, 0,
> -						   &nct6694_irq_domain_ops,
> -						   nct6694);
> -	if (!nct6694->domain) {
> -		ret = -ENODEV;
> -		goto err_urb;
> -	}
> -
>  	nct6694->dev = dev;
> -
> -	ida_init(&nct6694->gpio_ida);
> -	ida_init(&nct6694->i2c_ida);
> -	ida_init(&nct6694->canfd_ida);
> -	ida_init(&nct6694->wdt_ida);
> -
> -	spin_lock_init(&nct6694->irq_lock);
> +	nct6694->priv = udata;
>  
>  	ret = devm_mutex_init(dev, &udata->access_lock);
>  	if (ret)
> -		goto err_ida;
> +		goto err_urb;
>  
>  	interface = iface->cur_altsetting;
>  
>  	int_endpoint = &interface->endpoint[0].desc;
>  	if (!usb_endpoint_is_int_in(int_endpoint)) {
>  		ret = -ENODEV;
> -		goto err_ida;
> +		goto err_urb;
>  	}
>  
>  	usb_fill_int_urb(udata->int_in_urb, udev, usb_rcvintpipe(udev, NCT6694_INT_IN_EP),
> @@ -367,11 +301,11 @@ static int nct6694_usb_probe(struct usb_interface *iface,
>  
>  	ret = usb_submit_urb(udata->int_in_urb, GFP_KERNEL);
>  	if (ret)
> -		goto err_ida;
> +		goto err_urb;
>  
>  	usb_set_intfdata(iface, nct6694);
>  
> -	ret = mfd_add_hotplug_devices(dev, nct6694_usb_devs, ARRAY_SIZE(nct6694_usb_devs));
> +	ret = nct6694_core_probe(dev, nct6694, nct6694_usb_devs, ARRAY_SIZE(nct6694_usb_devs));
>  	if (ret)
>  		goto err_mfd;
>  
> @@ -379,12 +313,6 @@ static int nct6694_usb_probe(struct usb_interface *iface,
>  
>  err_mfd:
>  	usb_kill_urb(udata->int_in_urb);
> -err_ida:
> -	ida_destroy(&nct6694->wdt_ida);
> -	ida_destroy(&nct6694->canfd_ida);
> -	ida_destroy(&nct6694->i2c_ida);
> -	ida_destroy(&nct6694->gpio_ida);
> -	irq_domain_remove(nct6694->domain);
>  err_urb:
>  	usb_free_urb(udata->int_in_urb);
>  	return ret;
> @@ -395,13 +323,8 @@ static void nct6694_usb_disconnect(struct usb_interface *iface)
>  	struct nct6694 *nct6694 = usb_get_intfdata(iface);
>  	struct nct6694_usb_data *udata = nct6694->priv;
>  
> -	mfd_remove_devices(nct6694->dev);
> +	nct6694_core_remove(nct6694);
>  	usb_kill_urb(udata->int_in_urb);
> -	ida_destroy(&nct6694->wdt_ida);
> -	ida_destroy(&nct6694->canfd_ida);
> -	ida_destroy(&nct6694->i2c_ida);
> -	ida_destroy(&nct6694->gpio_ida);
> -	irq_domain_remove(nct6694->domain);
>  	usb_free_urb(udata->int_in_urb);
>  }
>  
> diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
> index 43b51f243e8e..853b1530755d 100644
> --- a/include/linux/mfd/nct6694.h
> +++ b/include/linux/mfd/nct6694.h
> @@ -10,10 +10,13 @@
>  #define __MFD_NCT6694_H
>  
>  #include <linux/idr.h>
> -#include <linux/mutex.h>
>  #include <linux/spinlock.h>
>  #include <linux/types.h>
>  
> +struct device;
> +struct irq_domain;
> +struct mfd_cell;
> +
>  #define NCT6694_HWMON_MOD	0x00
>  #define NCT6694_PWM_MOD		0x01
>  #define NCT6694_I2C_MOD		0x03
> @@ -94,6 +97,10 @@ struct nct6694 {
>  	void *priv;
>  };
>  
> +int nct6694_core_probe(struct device *dev, struct nct6694 *nct6694,
> +		       const struct mfd_cell *cells, int n_cells);
> +void nct6694_core_remove(struct nct6694 *nct6694);
> +
>  int nct6694_usb_read_msg(struct nct6694 *nct6694,
>  			 const struct nct6694_cmd_header *cmd_hd,
>  			 void *buf);
> -- 
> 2.34.1
> 

-- 
Lee Jones
