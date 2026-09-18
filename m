Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0CC3FBED7;
	Fri, 18 Sep 2026 09:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789724620; cv=none; b=DqpRMgFGJeBDeiYmi2XNudvV3QO8jSgzQMpb7hyeFQG5FzUYxDcadLyR+GyEam1ulVGLRqxZonf2/GsyG+3vWvzZ3GKqvH0OXOru/rIQ+ZgIv7AUwvOetZMYkZU6HPyRjgHHOCTUqxX84PeDK2rviARAqAmGCySx3/iFUvZITrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789724620; c=relaxed/simple;
	bh=gB0pvWVNNBNAR6PiWrVieqxhy9SD0es5siuZai20zfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJc2XwmsjB+b3sDbSEBfWVzKuLcw9nGNRvSBvLCUaUQiMTQcR43j5qq3k8wX59Rdj6knksELPP5NfVN+Rlg6Er5obrw1AzBqsRUpR66I9vht+OBcGf3RtlUfKxcBhjjMKuL8XYT4SdlmRQJ51PNrKdU+VlUhBb7KSyDCzZDRWoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0x8GRjf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0x8GRjf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789724618; x=1821260618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gB0pvWVNNBNAR6PiWrVieqxhy9SD0es5siuZai20zfk=;
  b=E0x8GRjfAdNBdY3O1LuEdIrxpNsbm/E9PBDDTl4Z7ZTso2nM+1iTdoEQ
   UTxbJwMhe++vWmTBTfZlRJ+aozX/MPUta4bqC/rqMACwFR9VI4foxnP1v
   wMPliReIrLvV1qBKYC2BJ2Acv9R7iTq8tLiLzUkhMOMtL+j83o30m3T2i
   FMNcW+epyspghDe06xQkhv8Mooyhywc3I9yoATvIDCKAgfxs+Le0enfSf
   AiH3trrvBBz4lR1Xw0jEbTal5GBnl8QexEf/HeHPQ6R3wwQCAxXw1N6rC
   WtlRqdg257DV8RRY/h/GI11S3yIazjpQl0bkEQRTL2YQxM71nbSOTw9dR
   g==;
X-CSE-ConnectionGUID: 3TUvP3ydTrmkUJV0pXyWnQ==
X-CSE-MsgGUID: UoNidvRuSjaqlmEcCEHEJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90085232"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90085232"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 02:43:37 -0700
X-CSE-ConnectionGUID: 5ecfA1ADSvuxCYHphbDAPQ==
X-CSE-MsgGUID: BiLO5MSGRW6fGhBkC9H7Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="268061613"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 18 Sep 2026 02:43:34 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 9982699; Fri, 18 Sep 2026 11:43:29 +0200 (CEST)
Date: Fri, 18 Sep 2026 11:43:29 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] usb: typec: Add onsemi FUSB15201 driver
Message-ID: <aq0HwYYma1iS69zb@black.igk.intel.com>
References: <20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com>
 <20260916135918.1017527-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916135918.1017527-3-shengchao.guo@oss.qualcomm.com>

On Wed, Sep 16, 2026 at 09:59:18PM +0800, Shawn Guo wrote:
> The FUSB15201 is a dual-port USB Type-C and Power Delivery controller
> which runs the Type-C state machine and the PD policy engine on an
> integrated microcontroller. The host only observes the resulting state
> and may ask for role swaps, so this is a plain Type-C class driver
> rather than a TCPC driven by the Type-C Port Manager.
> 
> Register a Type-C port for each connector described in firmware, report
> attach and detach, orientation, power and data roles and the PD
> capability of the partner, and drive the USB role switch of the attached
> USB controller so that OTG role switching works. Data and power role
> swaps requested through sysfs are forwarded to the controller, which
> performs them asynchronously and reports the outcome as a port status
> interrupt.
> 
> The controller exposes a per-port VBUS ADC reading, but the Type-C class
> has no VBUS attribute and nothing needs the value, so it is not read.
> PD messages, PDOs and alternate modes are not exposed by the hardware at
> all. The chip-wide MASTER_RESET command would drop both ports at once
> and has no caller, so it is left alone as well.
> 
> Assisted-by: LLM
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/Kconfig     |  17 +
>  drivers/usb/typec/Makefile    |   1 +
>  drivers/usb/typec/fusb15201.c | 580 ++++++++++++++++++++++++++++++++++
>  3 files changed, 598 insertions(+)
>  create mode 100644 drivers/usb/typec/fusb15201.c
> 
> diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> index 2f80c2792dbd..e21854cb89d4 100644
> --- a/drivers/usb/typec/Kconfig
> +++ b/drivers/usb/typec/Kconfig
> @@ -64,6 +64,23 @@ config TYPEC_ANX7411
>  	  If you choose to build this driver as a dynamically linked module, the
>  	  module will be called anx7411.ko.
>  
> +config TYPEC_FUSB15201
> +	tristate "onsemi FUSB15201 Type-C and Power Delivery controller driver"
> +	depends on I2C
> +	depends on USB_ROLE_SWITCH
> +	select REGMAP_I2C
> +	help
> +	  Say Y or M here if your system has an onsemi FUSB15201 dual-port USB
> +	  Type-C and Power Delivery controller.
> +
> +	  The FUSB15201 handles Type-C detection and Power Delivery negotiation
> +	  autonomously. This driver reports the resulting state to the Type-C
> +	  class, drives the USB role switch of the attached USB controller, and
> +	  allows data and power role swaps to be requested.
> +
> +	  If you choose to build this driver as a dynamically linked module, the
> +	  module will be called fusb15201.ko.
> +
>  config TYPEC_RT1719
>  	tristate "Richtek RT1719 Sink Only Type-C controller driver"
>  	depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
> diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
> index 8a6a1c663eb6..9f3a156d9c9f 100644
> --- a/drivers/usb/typec/Makefile
> +++ b/drivers/usb/typec/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
>  obj-$(CONFIG_TYPEC_UCSI)	+= ucsi/
>  obj-$(CONFIG_TYPEC_TPS6598X)	+= tipd/
>  obj-$(CONFIG_TYPEC_ANX7411)	+= anx7411.o
> +obj-$(CONFIG_TYPEC_FUSB15201)	+= fusb15201.o
>  obj-$(CONFIG_TYPEC_HD3SS3220)	+= hd3ss3220.o
>  obj-$(CONFIG_TYPEC_STUSB160X) 	+= stusb160x.o
>  obj-$(CONFIG_TYPEC_RT1719)	+= rt1719.o
> diff --git a/drivers/usb/typec/fusb15201.c b/drivers/usb/typec/fusb15201.c
> new file mode 100644
> index 000000000000..ab3b07368bdf
> --- /dev/null
> +++ b/drivers/usb/typec/fusb15201.c
> @@ -0,0 +1,580 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Driver for the onsemi FUSB15201 dual-port USB Type-C and Power Delivery
> + * controller.
> + *
> + * The FUSB15201 runs the Type-C state machine and the Power Delivery policy
> + * engine on an integrated microcontroller. The host only observes the
> + * resulting state and may ask for role swaps, so this is a plain Type-C class
> + * driver rather than a TCPC on the Type-C Port Manager.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/usb/role.h>
> +#include <linux/usb/typec.h>
> +
> +#define FUSB15201_NUM_PORTS		2
> +
> +#define FUSB15201_REG_VENDID		0x00
> +#define FUSB15201_REG_PRODID		0x01
> +#define FUSB15201_REG_DEVID		0x02
> +#define FUSB15201_REG_HWVER		0x03
> +#define FUSB15201_REG_FWVER		0x04
> +
> +#define FUSB15201_VENDID		0xaa
> +#define FUSB15201_PRODID		0x65
> +#define FUSB15201_DEVID			0x01
> +
> +/* Per-port status block, port A at 0x06 and port B at 0x0c */
> +#define FUSB15201_PORT_BASE(p)		(0x06 + (p) * 0x06)
> +#define FUSB15201_REG_STATUS(p)		(FUSB15201_PORT_BASE(p) + 0x02)
> +#define FUSB15201_REG_RESET_STATUS(p)	(FUSB15201_PORT_BASE(p) + 0x03)
> +#define FUSB15201_REG_FAULT_STATUS(p)	(FUSB15201_PORT_BASE(p) + 0x04)
> +
> +#define FUSB15201_STATUS_ATTACHED	BIT(0)
> +#define FUSB15201_STATUS_USBPD		BIT(1)
> +#define FUSB15201_STATUS_CC2		BIT(2)
> +#define FUSB15201_STATUS_DFP		BIT(3)
> +#define FUSB15201_STATUS_SINK		BIT(4)
> +
> +#define FUSB15201_RESET_ERR_RECOVERY	BIT(2)
> +
> +#define FUSB15201_FAULT_VBUS_OVP	BIT(0)
> +#define FUSB15201_FAULT_OTP		BIT(1)
> +#define FUSB15201_FAULT_CC_OVP		BIT(2)
> +#define FUSB15201_FAULT_VCONN_OCP	BIT(3)
> +
> +/* Per-port command block, port A at 0x11 and port B at 0x13 */
> +#define FUSB15201_REG_COMMANDS(p)	(0x11 + (p) * 0x02)
> +#define FUSB15201_REG_INT_MASK(p)	(0x12 + (p) * 0x02)
> +
> +/*
> + * The swap command bits are named after the role the port is in when the swap
> + * is requested, not the role it ends up in.
> + */
> +#define FUSB15201_CMD_UFP_TO_DFP	BIT(4)
> +#define FUSB15201_CMD_DFP_TO_UFP	BIT(5)
> +#define FUSB15201_CMD_SINK_TO_SOURCE	BIT(6)
> +#define FUSB15201_CMD_SOURCE_TO_SINK	BIT(7)
> +
> +#define FUSB15201_REG_MASTER_CONTROL	0x15
> +#define FUSB15201_MASTER_DRP_DISABLE	BIT(1)
> +
> +/* Per-port interrupt status, write one to clear */
> +#define FUSB15201_REG_INTERRUPT(p)	(0x16 + (p))
> +#define FUSB15201_INT_FAULT		BIT(0)
> +#define FUSB15201_INT_RESET_STATUS	BIT(1)
> +#define FUSB15201_INT_PORT_STATUS	BIT(2)
> +#define FUSB15201_INT_ALL		(FUSB15201_INT_FAULT | \
> +					 FUSB15201_INT_RESET_STATUS | \
> +					 FUSB15201_INT_PORT_STATUS)
> +
> +#define FUSB15201_REG_MAX		FUSB15201_REG_INTERRUPT(1)
> +
> +struct fusb15201;
> +
> +struct fusb15201_port {
> +	struct fusb15201 *chip;
> +	unsigned int index;
> +	struct typec_port *port;
> +	struct typec_partner *partner;
> +	struct usb_role_switch *role_sw;
> +	struct typec_capability cap;
> +	unsigned int status;
> +};
> +
> +struct fusb15201 {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct mutex lock;	/* serialises access to the shared registers */
> +	struct fusb15201_port ports[FUSB15201_NUM_PORTS];
> +};
> +
> +static enum typec_role fusb15201_default_pwr_role(struct fusb15201_port *port)
> +{
> +	switch (port->cap.type) {
> +	case TYPEC_PORT_SRC:
> +		return TYPEC_SOURCE;
> +	case TYPEC_PORT_SNK:
> +		return TYPEC_SINK;
> +	default:
> +		if (is_source(port->cap.prefer_role))
> +			return TYPEC_SOURCE;
> +		return TYPEC_SINK;
> +	}
> +}
> +
> +static void fusb15201_set_roles(struct fusb15201_port *port,
> +				enum typec_role pwr_role,
> +				enum typec_data_role data_role, bool attached)
> +{
> +	typec_set_pwr_role(port->port, pwr_role);
> +	typec_set_vconn_role(port->port, pwr_role);
> +	typec_set_data_role(port->port, data_role);
> +
> +	if (!port->role_sw)
> +		return;
> +
> +	if (!attached)
> +		usb_role_switch_set_role(port->role_sw, USB_ROLE_NONE);
> +	else if (data_role == TYPEC_HOST)
> +		usb_role_switch_set_role(port->role_sw, USB_ROLE_HOST);
> +	else
> +		usb_role_switch_set_role(port->role_sw, USB_ROLE_DEVICE);
> +}
> +
> +static void fusb15201_hw_update(struct fusb15201_port *port)
> +{
> +	struct fusb15201 *chip = port->chip;
> +	enum typec_data_role data_role = TYPEC_DEVICE;
> +	enum typec_role pwr_role;
> +	unsigned int status;
> +	int ret;
> +
> +	ret = regmap_read(chip->regmap, FUSB15201_REG_STATUS(port->index), &status);
> +	if (ret) {
> +		dev_warn(chip->dev, "port%u: failed to read status: %d\n",
> +			 port->index, ret);
> +		return;
> +	}
> +
> +	if (!(status & FUSB15201_STATUS_ATTACHED)) {
> +		if (port->partner) {
> +			typec_unregister_partner(port->partner);
> +			port->partner = NULL;
> +		}
> +
> +		/*
> +		 * None of the remaining status bits are valid while detached,
> +		 * so fall back to what the port is configured to do.
> +		 */
> +		typec_set_orientation(port->port, TYPEC_ORIENTATION_NONE);
> +		typec_set_pwr_opmode(port->port, TYPEC_PWR_MODE_USB);
> +
> +		pwr_role = fusb15201_default_pwr_role(port);
> +		if (is_source(pwr_role))
> +			data_role = TYPEC_HOST;
> +
> +		fusb15201_set_roles(port, pwr_role, data_role, false);
> +
> +		port->status = status;
> +		return;
> +	}
> +
> +	if (!(port->status & FUSB15201_STATUS_ATTACHED)) {
> +		struct typec_partner_desc desc = {
> +			.usb_pd = !!(status & FUSB15201_STATUS_USBPD),
> +		};
> +
> +		port->partner = typec_register_partner(port->port, &desc);
> +		if (IS_ERR(port->partner)) {
> +			dev_err(chip->dev,
> +				"port%u: failed to register partner: %pe\n",
> +				port->index, port->partner);
> +			port->partner = NULL;
> +		}
> +	}
> +
> +	typec_set_orientation(port->port, status & FUSB15201_STATUS_CC2 ?
> +			      TYPEC_ORIENTATION_REVERSE :
> +			      TYPEC_ORIENTATION_NORMAL);
> +
> +	/*
> +	 * The controller only tells us whether the partner is PD capable. The
> +	 * Type-C current advertisement is not reported, so 1.5A and 3.0A
> +	 * operation cannot be distinguished from the default.
> +	 */
> +	typec_set_pwr_opmode(port->port, status & FUSB15201_STATUS_USBPD ?
> +			     TYPEC_PWR_MODE_PD : TYPEC_PWR_MODE_USB);
> +
> +	pwr_role = status & FUSB15201_STATUS_SINK ? TYPEC_SINK : TYPEC_SOURCE;
> +	data_role = status & FUSB15201_STATUS_DFP ? TYPEC_HOST : TYPEC_DEVICE;
> +	fusb15201_set_roles(port, pwr_role, data_role, true);
> +
> +	port->status = status;
> +}
> +
> +static void fusb15201_report_faults(struct fusb15201_port *port)
> +{
> +	struct fusb15201 *chip = port->chip;
> +	unsigned int fault;
> +	int ret;
> +
> +	ret = regmap_read(chip->regmap, FUSB15201_REG_FAULT_STATUS(port->index), &fault);
> +	if (ret)
> +		return;
> +
> +	/*
> +	 * The controller protects itself, so there is nothing to do here
> +	 * beyond making the fault visible.
> +	 */
> +	if (fault & FUSB15201_FAULT_VBUS_OVP)
> +		dev_warn_ratelimited(chip->dev, "port%u: VBUS overvoltage\n",
> +				     port->index);
> +	if (fault & FUSB15201_FAULT_OTP)
> +		dev_warn_ratelimited(chip->dev, "port%u: over temperature\n",
> +				     port->index);
> +	if (fault & FUSB15201_FAULT_CC_OVP)
> +		dev_warn_ratelimited(chip->dev, "port%u: CC overvoltage\n",
> +				     port->index);
> +	if (fault & FUSB15201_FAULT_VCONN_OCP)
> +		dev_warn_ratelimited(chip->dev, "port%u: VCONN overcurrent\n",
> +				     port->index);
> +}
> +
> +static void fusb15201_report_reset(struct fusb15201_port *port)
> +{
> +	struct fusb15201 *chip = port->chip;
> +	unsigned int reset;
> +	int ret;
> +
> +	ret = regmap_read(chip->regmap, FUSB15201_REG_RESET_STATUS(port->index), &reset);
> +	if (ret)
> +		return;
> +
> +	dev_dbg(chip->dev, "port%u: reset status 0x%02x\n", port->index, reset);
> +
> +	if (reset & FUSB15201_RESET_ERR_RECOVERY)
> +		dev_warn_ratelimited(chip->dev,
> +				     "port%u: entered error recovery\n",
> +				     port->index);
> +}
> +
> +static irqreturn_t fusb15201_irq(int irq, void *data)
> +{
> +	struct fusb15201 *chip = data;
> +	irqreturn_t ret = IRQ_NONE;
> +	unsigned int i;
> +
> +	guard(mutex)(&chip->lock);
> +
> +	for (i = 0; i < FUSB15201_NUM_PORTS; i++) {
> +		struct fusb15201_port *port = &chip->ports[i];
> +		unsigned int pending;
> +
> +		if (!port->port)
> +			continue;
> +
> +		if (regmap_read(chip->regmap, FUSB15201_REG_INTERRUPT(i), &pending))
> +			continue;
> +
> +		pending &= FUSB15201_INT_ALL;
> +		if (!pending)
> +			continue;
> +
> +		/* Write one to clear */
> +		regmap_write(chip->regmap, FUSB15201_REG_INTERRUPT(i), pending);
> +
> +		if (pending & FUSB15201_INT_PORT_STATUS)
> +			fusb15201_hw_update(port);
> +		if (pending & FUSB15201_INT_FAULT)
> +			fusb15201_report_faults(port);
> +		if (pending & FUSB15201_INT_RESET_STATUS)
> +			fusb15201_report_reset(port);
> +
> +		ret = IRQ_HANDLED;
> +	}
> +
> +	return ret;
> +}
> +
> +/*
> + * Role swaps are asynchronous: the command only asks the controller to start
> + * the swap, and the outcome arrives later as a port status interrupt.
> + */
> +static int fusb15201_command(struct fusb15201_port *port, unsigned int cmd)
> +{
> +	struct fusb15201 *chip = port->chip;
> +
> +	guard(mutex)(&chip->lock);
> +
> +	if (!(port->status & FUSB15201_STATUS_ATTACHED))
> +		return -ENOTCONN;
> +
> +	return regmap_write(chip->regmap, FUSB15201_REG_COMMANDS(port->index), cmd);
> +}
> +
> +static int fusb15201_dr_set(struct typec_port *p, enum typec_data_role role)
> +{
> +	struct fusb15201_port *port = typec_get_drvdata(p);
> +	unsigned int cmd = FUSB15201_CMD_DFP_TO_UFP;
> +
> +	if (role == TYPEC_HOST)
> +		cmd = FUSB15201_CMD_UFP_TO_DFP;
> +
> +	return fusb15201_command(port, cmd);
> +}
> +
> +static int fusb15201_pr_set(struct typec_port *p, enum typec_role role)
> +{
> +	struct fusb15201_port *port = typec_get_drvdata(p);
> +	unsigned int cmd = FUSB15201_CMD_SOURCE_TO_SINK;
> +
> +	if (is_source(role))
> +		cmd = FUSB15201_CMD_SINK_TO_SOURCE;
> +
> +	return fusb15201_command(port, cmd);
> +}
> +
> +static const struct typec_operations fusb15201_typec_ops = {
> +	.dr_set = fusb15201_dr_set,
> +	.pr_set = fusb15201_pr_set,
> +};
> +
> +/*
> + * Nearly every register is either volatile or write-only, and the interrupt
> + * registers are write-one-to-clear, so the register map is not cached.
> + */
> +static const struct regmap_config fusb15201_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = FUSB15201_REG_MAX,
> +};
> +
> +static void fusb15201_unregister_port(void *data)
> +{
> +	struct fusb15201_port *port = data;
> +
> +	if (port->partner)
> +		typec_unregister_partner(port->partner);
> +	typec_unregister_port(port->port);
> +}
> +
> +static void fusb15201_put_role_sw(void *data)
> +{
> +	usb_role_switch_put(data);
> +}
> +
> +static int fusb15201_check_id(struct fusb15201 *chip)
> +{
> +	static const struct {
> +		unsigned int reg;
> +		unsigned int expected;
> +		const char *name;
> +	} ids[] = {
> +		{ FUSB15201_REG_VENDID, FUSB15201_VENDID, "vendor" },
> +		{ FUSB15201_REG_PRODID, FUSB15201_PRODID, "product" },
> +		{ FUSB15201_REG_DEVID, FUSB15201_DEVID, "device" },
> +	};
> +	unsigned int val, hwver, fwver;
> +	int ret, i;
> +
> +	for (i = 0; i < ARRAY_SIZE(ids); i++) {
> +		ret = regmap_read(chip->regmap, ids[i].reg, &val);
> +		if (ret)
> +			return dev_err_probe(chip->dev, ret,
> +					     "failed to read %s id\n",
> +					     ids[i].name);
> +
> +		if (val != ids[i].expected)
> +			return dev_err_probe(chip->dev, -ENODEV,
> +					     "bad %s id 0x%02x, expected 0x%02x\n",
> +					     ids[i].name, val, ids[i].expected);
> +	}
> +
> +	/*
> +	 * The register semantics are defined by the firmware image, so record
> +	 * the versions to make mismatches easier to spot.
> +	 */
> +	if (!regmap_read(chip->regmap, FUSB15201_REG_HWVER, &hwver) &&
> +	    !regmap_read(chip->regmap, FUSB15201_REG_FWVER, &fwver))
> +		dev_dbg(chip->dev, "hardware version %u, firmware version %u\n",
> +			hwver, fwver);
> +
> +	return 0;
> +}
> +
> +static int fusb15201_register_port(struct fusb15201 *chip,
> +				   struct fwnode_handle *fwnode)
> +{
> +	struct fusb15201_port *port;
> +	unsigned int index;
> +	int ret;
> +
> +	ret = fwnode_property_read_u32(fwnode, "reg", &index);
> +	if (ret)
> +		return dev_err_probe(chip->dev, ret,
> +				     "missing reg property of %pfwP\n", fwnode);
> +
> +	if (index >= FUSB15201_NUM_PORTS)
> +		return dev_err_probe(chip->dev, -EINVAL,
> +				     "invalid connector index %u\n", index);
> +
> +	port = &chip->ports[index];
> +	if (port->port)
> +		return dev_err_probe(chip->dev, -EINVAL,
> +				     "duplicate connector for port %u\n", index);
> +
> +	port->chip = chip;
> +	port->index = index;
> +
> +	ret = typec_get_fw_cap(&port->cap, fwnode);
> +	if (ret)
> +		return dev_err_probe(chip->dev, ret,
> +				     "port%u: failed to get capabilities\n",
> +				     index);
> +
> +	port->cap.revision = USB_TYPEC_REV_2_0;
> +	port->cap.orientation_aware = true;
> +	port->cap.driver_data = port;
> +	port->cap.ops = &fusb15201_typec_ops;
> +
> +	port->port = typec_register_port(chip->dev, &port->cap);
> +	if (IS_ERR(port->port)) {
> +		ret = PTR_ERR(port->port);
> +		port->port = NULL;
> +		return dev_err_probe(chip->dev, ret,
> +				     "port%u: failed to register\n", index);
> +	}
> +
> +	ret = devm_add_action_or_reset(chip->dev, fusb15201_unregister_port, port);
> +	if (ret)
> +		return ret;
> +
> +	port->role_sw = fwnode_usb_role_switch_get(fwnode);
> +	if (IS_ERR(port->role_sw))
> +		return dev_err_probe(chip->dev, PTR_ERR(port->role_sw),
> +				     "port%u: failed to get role switch\n",
> +				     index);
> +
> +	if (port->role_sw) {
> +		ret = devm_add_action_or_reset(chip->dev, fusb15201_put_role_sw,
> +					       port->role_sw);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int fusb15201_hw_init(struct fusb15201 *chip)
> +{
> +	bool source_only = true;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < FUSB15201_NUM_PORTS; i++) {
> +		struct fusb15201_port *port = &chip->ports[i];
> +
> +		if (!port->port) {
> +			/* Nothing describes this port, keep it quiet. */
> +			ret = regmap_write(chip->regmap,
> +					   FUSB15201_REG_INT_MASK(i),
> +					   FUSB15201_INT_ALL);
> +			if (ret)
> +				return ret;
> +
> +			continue;
> +		}
> +
> +		if (port->cap.type != TYPEC_PORT_SRC)
> +			source_only = false;
> +
> +		ret = regmap_write(chip->regmap, FUSB15201_REG_INT_MASK(i), 0);
> +		if (ret)
> +			return ret;
> +
> +		/* Discard anything that happened before we got here */
> +		ret = regmap_write(chip->regmap, FUSB15201_REG_INTERRUPT(i),
> +				   FUSB15201_INT_ALL);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/*
> +	 * Dual role toggling is the only configurable part of the Type-C state
> +	 * machine, and it is chip wide rather than per port, which is why it is
> +	 * set up here instead of from a port_type_set() callback.
> +	 */
> +	ret = regmap_update_bits(chip->regmap, FUSB15201_REG_MASTER_CONTROL,
> +				 FUSB15201_MASTER_DRP_DISABLE,
> +				 source_only ? FUSB15201_MASTER_DRP_DISABLE : 0);
> +	if (ret)
> +		return ret;
> +
> +	/* Seed the Type-C class with the current state before arming the IRQ */
> +	for (i = 0; i < FUSB15201_NUM_PORTS; i++) {
> +		if (chip->ports[i].port)
> +			fusb15201_hw_update(&chip->ports[i]);
> +	}
> +
> +	return 0;
> +}
> +
> +static int fusb15201_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct fusb15201 *chip;
> +	unsigned int nports = 0;
> +	int ret;
> +
> +	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	chip->dev = dev;
> +	i2c_set_clientdata(client, chip);
> +
> +	ret = devm_mutex_init(dev, &chip->lock);
> +	if (ret)
> +		return ret;
> +
> +	chip->regmap = devm_regmap_init_i2c(client, &fusb15201_regmap_config);
> +	if (IS_ERR(chip->regmap))
> +		return dev_err_probe(dev, PTR_ERR(chip->regmap),
> +				     "failed to initialise register map\n");
> +
> +	ret = fusb15201_check_id(chip);
> +	if (ret)
> +		return ret;
> +
> +	device_for_each_child_node_scoped(dev, fwnode) {
> +		ret = fusb15201_register_port(chip, fwnode);
> +		if (ret)
> +			return ret;
> +
> +		nports++;
> +	}
> +
> +	if (!nports)
> +		return dev_err_probe(dev, -ENODEV, "no connector described\n");
> +
> +	ret = fusb15201_hw_init(chip);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to initialise\n");
> +
> +	ret = devm_request_threaded_irq(dev, client->irq, NULL, fusb15201_irq,
> +					IRQF_ONESHOT, dev_name(dev), chip);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to request irq\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id fusb15201_of_match[] = {
> +	{ .compatible = "onnn,fusb15201" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, fusb15201_of_match);
> +
> +static struct i2c_driver fusb15201_driver = {
> +	.driver = {
> +		.name = "fusb15201",
> +		.of_match_table = fusb15201_of_match,
> +	},
> +	.probe = fusb15201_probe,
> +};
> +module_i2c_driver(fusb15201_driver);
> +
> +MODULE_AUTHOR("Shawn Guo <shengchao.guo@oss.qualcomm.com>");
> +MODULE_DESCRIPTION("onsemi FUSB15201 Type-C and Power Delivery controller");
> +MODULE_LICENSE("GPL");
> -- 
> 2.43.0

-- 
heikki
