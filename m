Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDD8409279;
	Wed, 23 Sep 2026 09:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790155940; cv=none; b=UztywskAc8Tz5KgyvsHN9i1CxxpUb/4WEVjc6bgE7rEI0h4kE/MiLgMrSSbwcIDHuBsKP7Ci51xt56mLkBGX9BR6+58HkOPwe4CUa1Ps7QOfBOK052mnrBsF+1u7OrQrMMEvIzOhNN+HyI7DRuNTWgj1Yfpm8CvftCiQoxNtKrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790155940; c=relaxed/simple;
	bh=KmaNzgSIR4QI3fWniZdT0zZvXHn9vmhy0jCVgLdPT0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lzTb6Wey82yl/j6yd1EWSF3EXqh6TaZIk90G7ovG4pASDf5VyVJ/AuJWZTuNiWpXvnbZwpYISdYMnvns13aGj1G1lTBXo2Nwb9Bw4k8htO2eClQexOsxpBaSS7KLt6ggzft1nUccRnwfRmld+Id7xAlCJlbaP7sZzc2FmaREHkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOQtySZu; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOQtySZu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790155938; x=1821691938;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KmaNzgSIR4QI3fWniZdT0zZvXHn9vmhy0jCVgLdPT0U=;
  b=gOQtySZuoR9ibWs0o8Xa8bnw26I+YGB1pTZVgb+gFdMlkPEELKcq4XkZ
   CfAyu2taZajY6EmWFxueFgblvZ4NGkB2UC+1nAKznvJrBOiYPgkptIDlB
   KO0x1rbd2uYyrrAEvGTfU0/BfIVaJBye9iXAOfcw5KDNrxncR8lqro+xd
   /EHW+VlDrUBa08RaJTP6cLXcOY28A7YuAW3Wzd6EV4FfJcu+H7IzyZL0L
   JoGdOhb8aDpnz8qHL+9oeApiZ9DjtqSEJ5AIBR/2GyyxM6KE1xkFN+dhn
   hf/L1SZrVVp78cMQROpbAPmieu7MqF4haio1SzSuaSgTO8qC//695dfig
   g==;
X-CSE-ConnectionGUID: CX4XQ6GXSx2jqr91ZKUMQg==
X-CSE-MsgGUID: Mtw2JqFMQj2+CXX01aTxEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1348187"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1348187"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 02:32:17 -0700
X-CSE-ConnectionGUID: UxuDsoLcTdOqQF+vDVwEZw==
X-CSE-MsgGUID: fsBo+/7GTNyPxW2eJeE5Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="278269194"
Received: from abityuts-desk1.ger.corp.intel.com (HELO [10.245.244.3]) ([10.245.244.3])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 02:32:15 -0700
Message-ID: <bd8ffb4b-220a-41e6-9eef-7c9fdce20700@linux.intel.com>
Date: Wed, 23 Sep 2026 12:32:09 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] usb: xhci: Add support for eUSB2v2 1024-byte bulk
 packet size
To: pawell@cadence.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260826-eusb2v2-packet-size-v2-0-950f19f38ef0@cadence.com>
 <20260826-eusb2v2-packet-size-v2-1-950f19f38ef0@cadence.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260826-eusb2v2-packet-size-v2-1-950f19f38ef0@cadence.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

Thanks for working on the eUSB2v2 bulk support.

On 8/26/26 14:24, Pawel Laszczak via B4 Relay wrote:
> From: Pawel Laszczak <pawell@cadence.com>
> 
> The eUSB2 v2 specification (bcdUSB 0x0230) introduces support for
> 1024-byte maximum packet sizes for Bulk endpoints in High-Speed mode.
> However, an eUSB2v2 peripheral will revert its internal maximum packet
> size back to 512 bytes after events like a bus reset, disconnect, or
> deconfiguration.
> 
> To support 1024-byte bulk transfers on capable hosts, add a new
> is_eusb2v2 flag to the usb_bus structure, populated via the HCCPARAMS2
> E2V2C capability bit in the xHCI driver.
> 
> When an eUSB2v2 host configures an eUSB2v2 device, issue a specific
> SET_FEATURE (USB_DEVICE_BULK_MAX_PACKET_UPDATE) request during device
> configuration to switch the peripheral to 1024-byte packet mode, and
> allow the xHCI endpoint initialization to accept up to 1024 bytes for
> HS bulk endpoints.
> 
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> ---
> Changes in v2:
> - Removed change in config.c: per eUSB2v2 spec section 5.2, conformant
>    devices always report wMaxPacketSize=512 in their descriptor regardless
>    of operating mode, so the warning suppression was unnecessary.
> - xhci-mem.c: simplified HS bulk clamp
> - xhci.c: moved is_eusb2v2 assignment into xhci_hcd_init_usb2_data()
> - eusb_update_max_packet(): changed from void to int; returns error on
>    SET_FEATURE failure.
> - Added eusb2v2_mps_active flag to struct usb_device to track whether
>    SET_FEATURE(BULK_MAX_PACKET_UPDATE) succeeded.
> - Added hub.c: usb_reset_and_verify_device() now re-issues SET_FEATURE
>    after bus reset to restore 1KB mode. Failure triggers re-enumeration
>    to prevent a driver from operating with inconsistent MPS state.
> ---
>   drivers/usb/core/hub.c      | 16 ++++++++++
>   drivers/usb/core/message.c  | 74 ++++++++++++++++++++++++++++++++++++++++++++-
>   drivers/usb/core/usb.h      |  2 ++
>   drivers/usb/host/xhci-mem.c | 18 +++++++++--
>   drivers/usb/host/xhci.c     |  4 +++
>   include/linux/usb.h         |  7 +++++
>   6 files changed, 117 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 24960ba9caa9..34cfc44c5df8 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -6252,6 +6252,22 @@ static int usb_reset_and_verify_device(struct usb_device *udev)
>   		mutex_unlock(hcd->bandwidth_mutex);
>   		goto re_enumerate;
>   	}
> +
> +	/*
> +	 * Restore eUSB2v2 1KB bulk mode after reset (device reverts to 512
> +	 * after any bus reset per eUSB2v2 spec section 5.2).
> +	 * Only retry if the initial SET_FEATURE had succeeded.
> +	 */
> +	if (udev->eusb2v2_mps_active) {
> +		ret = eusb_update_max_packet(udev, udev->actconfig);
> +		if (ret < 0) {
> +			dev_err(&udev->dev,
> +				"eUSB2v2: failed to restore 1KB mode after reset (%d)\n", ret);
> +			mutex_unlock(hcd->bandwidth_mutex);
> +			goto re_enumerate;
> +		}
> +	}
> +
>   	ret = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
>   			USB_REQ_SET_CONFIGURATION, 0,
>   			udev->actconfig->desc.bConfigurationValue, 0,
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 75e2bfd744a9..18bedc7f91a3 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -2007,6 +2007,67 @@ int usb_set_wireless_status(struct usb_interface *iface,
>   }
>   EXPORT_SYMBOL_GPL(usb_set_wireless_status);
>   
> +/*
> + * eusb_update_max_packet - set or restore max packet size
> + * @udev: target device
> + * @cp: if NULL restore MPS to 512 else set 1024
> + *
> + * This request is specific to eUSB2v2.
> + * An eUSB2v2 peripheral will revert the maximum packet size to 512
> + * for bulk endpoints after bus reset, disconnect and deconfiguration.
> + * This function allows updating the max packet size for BULK endpoints
> + * to 1024 after above events.
> + */
> +int eusb_update_max_packet(struct usb_device *udev, struct usb_host_config *cp)
> +{
> +	struct usb_host_config *config = cp ? cp : udev->actconfig;
> +	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
> +	struct usb_interface_cache *intfc;
> +	struct usb_host_interface *alt;
> +	struct usb_host_endpoint *ep;
> +	u16 mps = 512;
> +	int i, j, a;
> +	int ret;
> +
> +	if (le16_to_cpu(udev->descriptor.bcdUSB) != 0x0230 ||
> +	    !hcd->self.is_eusb2v2)
> +		return 0;
> +
> +	if (cp) {
> +		ret = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
> +				      USB_REQ_SET_FEATURE, USB_RECIP_DEVICE,
> +				      USB_DEVICE_BULK_MAX_PACKET_UPDATE, 0, NULL, 0,
> +				      USB_CTRL_SET_TIMEOUT);
> +		if (ret < 0) {
> +			dev_warn(&udev->dev, "eUSB2v2 1KB update failed: %d\n", ret);
> +			return ret;
> +		}
> +
> +		mps = 1024;
> +	} else if (!udev->actconfig)
> +		return 0;
> +
> +	for (i = 0; i < config->desc.bNumInterfaces; i++) {
> +		intfc = config->intf_cache[i];
> +
> +		if (!intfc)
> +			continue;
> +
> +		for (a = 0; a < intfc->num_altsetting; a++) {
> +			alt = &intfc->altsetting[a];
> +
> +			for (j = 0; j < alt->desc.bNumEndpoints; j++) {
> +				ep = &alt->endpoint[j];
> +
> +				if (usb_endpoint_xfer_bulk(&ep->desc))
> +					ep->desc.wMaxPacketSize = cpu_to_le16(mps);


I think we should avoid altering the stored, valid endpoint descriptor
wMaxPacketSize that was read from the device.
Both HS usb2 and eUSB2v2 specs state that MPS value in bulk endpoint descriptor
is 512.

Better to convey the usage of 1024 MPS to host and class driver some other way.

Userspace drivers or tools that get the MaxPacketSize directly from a device with
a get descriptor request will still see MaxPacketSize as 512 (like lsusb -v), while
host controllers and class drivers that use altered cached values from struct usb_device
see 1024.

Any comparison between old and new endpoint descriptor will also fail.


> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   /*
>    * usb_set_configuration - Makes a particular device setting be current
>    * @dev: the device whose configuration is being updated
> @@ -2120,8 +2181,19 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
>   	/* if it's already configured, clear out old state first.
>   	 * getting rid of old interfaces means unbinding their drivers.
>   	 */
> -	if (dev->state != USB_STATE_ADDRESS)
> +	if (dev->state != USB_STATE_ADDRESS) {
> +		eusb_update_max_packet(dev, NULL);
>   		usb_disable_device(dev, 1);	/* Skip ep0 */
> +	}
> +
> +	ret = eusb_update_max_packet(dev, cp);

Only eUSB2v2 devices with bulk endpoints support the new BULK_MAX_PACKET_UPDATE
request. Avoid sending it to eUSB2v2 cameras that only use isoc transfers

> +	if (ret < 0)
> +		dev->eusb2v2_mps_active = 0;
> +	else if (le16_to_cpu(dev->descriptor.bcdUSB) == 0x0230 &&
> +		 hcd->self.is_eusb2v2)
> +		dev->eusb2v2_mps_active = 1;
> +	else
> +		dev->eusb2v2_mps_active = 0;
>   
>   	/* Get rid of pending async Set-Config requests for this device */
>   	cancel_async_set_config(dev);
> diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
> index a9b37aeb515b..c36fe2a2acea 100644
> --- a/drivers/usb/core/usb.h
> +++ b/drivers/usb/core/usb.h
> @@ -89,6 +89,8 @@ extern int usb_major_init(void);
>   extern void usb_major_cleanup(void);
>   extern int usb_device_supports_lpm(struct usb_device *udev);
>   extern int usb_port_disable(struct usb_device *udev);
> +extern int eusb_update_max_packet(struct usb_device *udev,
> +				  struct usb_host_config *cp);
>   
>   #ifdef	CONFIG_PM
>   
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 997fe90f54e5..8ccbfaf57612 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1479,10 +1479,22 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
>   	/* Allow 3 retries for everything but isoc, set CErr = 3 */
>   	if (!usb_endpoint_xfer_isoc(&ep->desc))
>   		err_count = 3;
> -	/* HS bulk max packet should be 512, FS bulk supports 8, 16, 32 or 64 */
> +
> +	/*
> +	 * HS bulk max packet should be 512 (or 1024 for eUSB2v2),
> +	 * FS bulk supports 8, 16, 32 or 64.
> +	 */
>   	if (usb_endpoint_xfer_bulk(&ep->desc)) {
> -		if (udev->speed == USB_SPEED_HIGH)
> -			max_packet = 512;
> +		if (udev->speed == USB_SPEED_HIGH) {
> +			if (le16_to_cpu(udev->descriptor.bcdUSB) == 0x0230 &&
> +			    xhci->hcc_params2 & HCC2_E2V2C) {
> +				if (max_packet != 1024)
> +					max_packet = 512;


I would let xhci_usb_endpoint_maxp() return 1024 if this is a HS eUSB2v2 bulk endpoint
with udev->eusb2v2_mps_active set.


> +			} else {
> +				max_packet = 512;
> +			}
> +		}
> +
>   		if (udev->speed == USB_SPEED_FULL) {
>   			max_packet = rounddown_pow_of_two(max_packet);
>   			max_packet = clamp_val(max_packet, 8, 64);
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index a54f5b57f205..ba3cdc5c732d 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -5371,6 +5371,10 @@ static void xhci_hcd_init_usb2_data(struct xhci_hcd *xhci, struct usb_hcd *hcd)
>   	xhci->usb2_rhub.hcd = hcd;
>   	hcd->speed = HCD_USB2;
>   	hcd->self.root_hub->speed = USB_SPEED_HIGH;
> +
> +	if (xhci->hcc_params2 & HCC2_E2V2C)
> +		hcd->self.is_eusb2v2 = 1;
> +
>   	/*
>   	 * USB 2.0 roothub under xHCI has an integrated TT,
>   	 * (rate matching hub) as opposed to having an OHCI/UHCI
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 25a203ac7a7e..57fb4c552740 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -464,6 +464,10 @@ struct usb_bus {
>   					 * the ep queue on a short transfer
>   					 * with the URB_SHORT_NOT_OK flag set.
>   					 */
> +	unsigned is_eusb2v2:1;		/*
> +					 * true when HC controller supports
> +					 * eusb2v2

I wonder if we really need this flag. I understand why it's there, but is it really possible
that an embedded harwdwired eUSB2v2 device would be hardwired to host that doesn't
support it?

Thanks
Mathias

