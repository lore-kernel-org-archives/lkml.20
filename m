Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451B33921C1
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369081; cv=none; b=UISxdxRwl1BYY0N1IirJBTKRb9qwNpKgPFISxQ3te2Vc6aNUnO7i+utnY3hkrHFfb2ApBFynIeDSbJ/RH40/WyzVw4YaKv9ZAbWBxpXmFaNmMlCkrKMPvqY/7cnyr6/RSKL42V1r4lhNTtn2csJFj5yiZI+Y1bHT2O9MZ+0zOi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369081; c=relaxed/simple;
	bh=2Oq02Ag73IJI0zUdhs1Jy1pcp6ZoUz6Wdrk6BSI/8cE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g9cPVdG+98Is1u9ugNYz8yjQb3TrrG/TW8Zju0LvXMOdXPjP4EVJfqyIl5R+cWv+r0sGBsOJxlgc+e/9gOdVasb2pPCkF1C3C4s+9runXOzXdsDVW5q1548uaJZV7G+i32Mk4cOPLZl4IUPvQylhJQYb61LjCH79dRuo/Cecdjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KU3OMcRU; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KU3OMcRU"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so10862365e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791369056; x=1791973856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uFa4YN23QMemWPIiuLjcyNrHGM9W5a/ufggnVVFeA1U=;
        b=KU3OMcRUMj4HnX0aStplTGOedoPUkfBiY9FBYyXtRovXwW+oTWguYs5lozWNruP5cx
         DIfpv82WfDlvHMDXmSZa2mVNoqN2oDR+khocbLwErZOqO/7+QICaybNmYojA6pRdRP4C
         cdTqaIV13w/I8t+YX60VzAB07hAy1r2Ikn/nvFpuQ6cmExRXze6T4yo4lOSNAU0/1pQV
         bfNG2GUlquxjaahlvV8vNMAuQp2RMm5Tu1Y4c+NSpAQ7eezR48dLEQ6o07BrhgjZ22/A
         6NKja63gsZfsiq/rTvaJxWRrTJw3uuFUq96WSR8q8eMvP2FyADTSNoMbMRgqTtbdco52
         LtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791369056; x=1791973856;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uFa4YN23QMemWPIiuLjcyNrHGM9W5a/ufggnVVFeA1U=;
        b=CD06uGWi5hbX2+3+GThJGl63Lsi/oFeqD8kmKT95zqY5Qfiz0qguL/wWbppCiYIVlc
         0UF5JK1gfdhQFI8iP3TOGd4BCHl8YwT3slGOTnO3s6AO/3Pe65l+HyEtOks3wIF+AH6B
         KLxGy2W6CoqnlWQC4UbOcfFqp3OMIVT62x9SHLk3wr1IRG5UQmZ0yjMHOcFs4x7raxqV
         WJ4tyxnM1zQcLxFDqDQVQoV4RnR3QoNLtRAXxsc4nStGRR01Zx3FfSYzG2Xsy/FGe4fn
         WC9V/mUegpMEgJjuua+9Bxz9fysDhQYMVFBDczLsx+FBhJy7lI4Nh1EzUJTEFa3PjtrK
         kfhw==
X-Forwarded-Encrypted: i=1; AKwUvBwOM4tqPZiJ4d0mKknwAuXQwEAWdpJO6ZJkGZN8+GB1dNeznoALmyOwhhvREB1jMM3rFjsM4wnCQSrVZJQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kXUTqS69rkL8PcbBu6xaj9CiBMoIC+EIl2dAJk8CXwkYoVYZc4
	1Qhj38nDIKngnIcfBc2bx5Bae3QvaKXsSmGXwjWSYD3AgGvmCs7JCxHn
X-Gm-Gg: AYBFou3O88ZXcwApgFZYBPtAzXsyJkYdn9UGV6PjQDStIa6BWKewGWNPWJNfDey1DBo
	TLpqUVUHFrNJPB2lgLlP5VKidUPbeVisdKZpBA0DZZBql1U/HFbH+O53ZSlj/xfmDbGO0Wn5wxC
	mA/FnlFUIrYOYjZBIkeKiezBtzxBDlb+4gU30Tt8GJ8tE87tKKUSPCQt//I9pywvIRdOr8zfN7R
	z0EmHRBI9Ja4ZqZSUJKROrGoVpdBXHnySbBT+CKcrVg5OmLj9s9aLnCyIOYjFf6vr4nFYLH3VQ7
	5t1TB3xRy8NZsiicTMyGPDeyd5j8uqIO2gi5lh2zsDNSvei0NPn6UoBMz8DHoWoyTlNSzLRTGFk
	k/T/N8d2UamaNIh1nH4UfDmWCoibux5B5EIEu7yt+HLAUY2RRLSKclFgXxwpyncdXoEODm2W3DQ
	Gk/ENyNB3jB366wiAhRYIgz/sfu6fRcGYSC5ihkwM91nxWn/I77L6OWcKRWHCm33YQViX2yVxDH
	vq/HNGd8N8=
X-Received: by 2002:a05:600c:1d23:b0:49f:fe7e:dc61 with SMTP id 5b1f17b1804b1-4a18008560fmr28212025e9.0.1791369055537;
        Wed, 07 Oct 2026 03:30:55 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm91946455e9.2.2026.10.07.03.30.54
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 07 Oct 2026 03:30:55 -0700 (PDT)
Date: Wed, 7 Oct 2026 12:30:47 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>
Cc: pawell@cadence.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] usb: xhci: Add support for eUSB2v2 1024-byte
 bulk packet size
Message-ID: <20261007123047.697f6b5a.michal.pecio@gmail.com>
In-Reply-To: <20261005-eusb2v2-packet-size-v3-1-fde610a3c47a@cadence.com>
References: <20261005-eusb2v2-packet-size-v3-0-fde610a3c47a@cadence.com>
	<20261005-eusb2v2-packet-size-v3-1-fde610a3c47a@cadence.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 05 Oct 2026 10:18:24 +0200, Pawel Laszczak via B4 Relay wrote:
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
> Changes in v3:
> - Add check for bulk endpoint existence before sending
>   BULK_MAX_PACKET_UPDATE. This avoids sending the request to devices that
>   only use isochronous endpoints, as they do not support it.
> - Do not overwrite ep->desc.wMaxPacketSize to 1024. According to eUSB2v2
>   spec section 5.2, the endpoint descriptor must always report 512 bytes
>   regardless of the current operating mode.
> - Rely on the eusb2v2_mps_active flag in xhci_usb_endpoint_maxp() and
>   xhci-mem.c to dynamically return 1024 for HS bulk endpoints when the 1KB
>   mode is active.
> 
> Changes in v2:
> - Removed change in config.c: per eUSB2v2 spec section 5.2, conformant
>   devices always report wMaxPacketSize=512 in their descriptor regardless
>   of operating mode, so the warning suppression was unnecessary.
> - xhci-mem.c: simplified HS bulk clamp
> - xhci.c: moved is_eusb2v2 assignment into xhci_hcd_init_usb2_data()
> - eusb_update_max_packet(): changed from void to int; returns error on
>   SET_FEATURE failure.
> - Added eusb2v2_mps_active flag to struct usb_device to track whether
>   SET_FEATURE(BULK_MAX_PACKET_UPDATE) succeeded.
> - Added hub.c: usb_reset_and_verify_device() now re-issues SET_FEATURE
>   after bus reset to restore 1KB mode. Failure triggers re-enumeration
>   to prevent a driver from operating with inconsistent MPS state.
> ---
>  drivers/usb/core/hub.c      | 16 ++++++++++
>  drivers/usb/core/message.c  | 74 +++++++++++++++++++++++++++++++++++++++++++++
>  drivers/usb/core/usb.h      |  2 ++
>  drivers/usb/host/xhci-mem.c | 15 +++++++--
>  drivers/usb/host/xhci.c     | 10 ++++++
>  include/linux/usb.h         |  7 +++++
>  6 files changed, 121 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 24960ba9caa9..34cfc44c5df8 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -6252,6 +6252,22 @@ static int usb_reset_and_verify_device(struct usb_device *udev)
>  		mutex_unlock(hcd->bandwidth_mutex);
>  		goto re_enumerate;
>  	}
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

This seems redundant because the function already logs errors.
Or maybe the function shouldn't log them, if we want different
messages for different call sites?

> +			mutex_unlock(hcd->bandwidth_mutex);
> +			goto re_enumerate;
> +		}
> +	}
> +
>  	ret = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
>  			USB_REQ_SET_CONFIGURATION, 0,
>  			udev->actconfig->desc.bConfigurationValue, 0,
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 75e2bfd744a9..c8540d738a3e 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -2007,6 +2007,71 @@ int usb_set_wireless_status(struct usb_interface *iface,
>  }
>  EXPORT_SYMBOL_GPL(usb_set_wireless_status);
>  
> +/*
> + * eusb_update_max_packet - enable 1024-byte bulk mode for eUSB2v2 device
> + * @udev: target device
> + * @cp: configuration to be checked and enabled
> + *
> + * Per eUSB2v2 spec section 5.2, an eUSB2v2 peripheral will revert the
> + * maximum packet size to 512 for bulk endpoints after bus reset, disconnect,
> + * or deconfiguration.
> + * This function sends the BULK_MAX_PACKET_UPDATE request to restore the
> + * 1024-byte mode. It is valid only if the configuration has bulk endpoints.
> + */
> +int eusb_update_max_packet(struct usb_device *udev, struct usb_host_config *cp)
> +{
> +	struct usb_host_config *config = cp ? cp : udev->actconfig;
> +	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
> +	struct usb_interface_cache *intfc;
> +	struct usb_host_interface *alt;
> +	struct usb_host_endpoint *ep;
> +	bool has_bulk = false;
> +	int i, j, a;
> +	int ret;
> +
> +	if (le16_to_cpu(udev->descriptor.bcdUSB) != 0x0230 ||
> +	    !hcd->self.is_eusb2v2)
> +		return 0;
> +
> +	if (!config)
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
> +				if (usb_endpoint_xfer_bulk(&ep->desc)) {
> +					has_bulk = true;
> +					goto found_bulk;
> +				}
> +			}
> +		}
> +	}
> +
> +	if (!has_bulk)
> +		return 0;

Control flow ensures that has_bulk is false here and true below.
The variable is redundant.

> +found_bulk:
> +	ret = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
> +			      USB_REQ_SET_FEATURE, USB_RECIP_DEVICE,
> +			      USB_DEVICE_BULK_MAX_PACKET_UPDATE, 0, NULL, 0,
> +			      USB_CTRL_SET_TIMEOUT);
> +	if (ret < 0) {
> +		dev_warn(&udev->dev, "eUSB2v2 1KB update failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  /*
>   * usb_set_configuration - Makes a particular device setting be current
>   * @dev: the device whose configuration is being updated
> @@ -2123,6 +2188,15 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
>  	if (dev->state != USB_STATE_ADDRESS)
>  		usb_disable_device(dev, 1);	/* Skip ep0 */
>  
> +	ret = eusb_update_max_packet(dev, cp);
> +	if (ret < 0)
> +		dev->eusb2v2_mps_active = 0;
> +	else if (cp && le16_to_cpu(dev->descriptor.bcdUSB) == 0x0230 &&
> +		 hcd->self.is_eusb2v2)

Hmm, this code could be simpler if the function returned errors on
unsupported devices or host controllers. Would that cause problems
with anything?

> +		dev->eusb2v2_mps_active = 1;
> +	else
> +		dev->eusb2v2_mps_active = 0;
> +
>  	/* Get rid of pending async Set-Config requests for this device */
>  	cancel_async_set_config(dev);
>  
> diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
> index a9b37aeb515b..c51e4261085c 100644
> --- a/drivers/usb/core/usb.h
> +++ b/drivers/usb/core/usb.h
> @@ -89,6 +89,8 @@ extern int usb_major_init(void);
>  extern void usb_major_cleanup(void);
>  extern int usb_device_supports_lpm(struct usb_device *udev);
>  extern int usb_port_disable(struct usb_device *udev);
> +int eusb_update_max_packet(struct usb_device *udev,
> +			   struct usb_host_config *cp);
>  
>  #ifdef	CONFIG_PM
>  
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 997fe90f54e5..37a5f9e9bd6d 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1479,10 +1479,19 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
>  	/* Allow 3 retries for everything but isoc, set CErr = 3 */
>  	if (!usb_endpoint_xfer_isoc(&ep->desc))
>  		err_count = 3;
> -	/* HS bulk max packet should be 512, FS bulk supports 8, 16, 32 or 64 */
> +
> +	/*
> +	 * HS bulk max packet should be 512 (or 1024 for eUSB2v2),
> +	 * FS bulk supports 8, 16, 32 or 64.
> +	 */
>  	if (usb_endpoint_xfer_bulk(&ep->desc)) {
> -		if (udev->speed == USB_SPEED_HIGH)
> -			max_packet = 512;
> +		if (udev->speed == USB_SPEED_HIGH) {
> +			if (udev->eusb2v2_mps_active)
> +				max_packet = 1024;
> +			else
> +				max_packet = 512;
> +		}
> +
>  		if (udev->speed == USB_SPEED_FULL) {
>  			max_packet = rounddown_pow_of_two(max_packet);
>  			max_packet = clamp_val(max_packet, 8, 64);
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index a54f5b57f205..b4a3bdf88fb4 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -2951,6 +2951,12 @@ int xhci_usb_endpoint_maxp(struct usb_device *udev,
>  {
>  	if (usb_endpoint_is_hs_isoc_double(udev, host_ep))
>  		return le16_to_cpu(host_ep->eusb2_isoc_ep_comp.wMaxPacketSize);
> +
> +	if (udev->eusb2v2_mps_active &&
> +	    udev->speed == USB_SPEED_HIGH &&
> +	    usb_endpoint_xfer_bulk(&host_ep->desc))
> +		return 1024;

Is the check for USB_SPEED_HIGH necessary?
Is eusb2v2_mps_active supposed to be set at other speeds?

One tricky edge case is a high-speed device failing to restore
high-speed signaling after reset, but at a quick glance this seems
to result in hub_port_init() error and abort of the reset flow.

> +
>  	return usb_endpoint_maxp(&host_ep->desc);
>  }
>  
> @@ -5371,6 +5377,10 @@ static void xhci_hcd_init_usb2_data(struct xhci_hcd *xhci, struct usb_hcd *hcd)
>  	xhci->usb2_rhub.hcd = hcd;
>  	hcd->speed = HCD_USB2;
>  	hcd->self.root_hub->speed = USB_SPEED_HIGH;
> +
> +	if (xhci->hcc_params2 & HCC2_E2V2C)
> +		hcd->self.is_eusb2v2 = 1;
> +
>  	/*
>  	 * USB 2.0 roothub under xHCI has an integrated TT,
>  	 * (rate matching hub) as opposed to having an OHCI/UHCI
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 25a203ac7a7e..57fb4c552740 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -464,6 +464,10 @@ struct usb_bus {
>  					 * the ep queue on a short transfer
>  					 * with the URB_SHORT_NOT_OK flag set.
>  					 */
> +	unsigned is_eusb2v2:1;		/*
> +					 * true when HC controller supports
> +					 * eusb2v2
> +					 */
>  	unsigned no_sg_constraint:1;	/* no sg constraint */
>  	unsigned sg_tablesize;		/* 0 or largest number of sg list entries */
>  
> @@ -625,6 +629,8 @@ struct usb3_lpm_parameters {
>   * @usb2_hw_lpm_allowed: Userspace allows USB 2.0 LPM to be enabled
>   * @usb3_lpm_u1_enabled: USB3 hardware U1 LPM enabled
>   * @usb3_lpm_u2_enabled: USB3 hardware U2 LPM enabled
> + * @eusb2v2_mps_active: 1024-byte bulk mode is active and must be restored
> + *	 after bus reset.
>   * @string_langid: language ID for strings
>   * @product: iProduct string, if present (static)
>   * @manufacturer: iManufacturer string, if present (static)
> @@ -708,6 +714,7 @@ struct usb_device {
>  	unsigned usb2_hw_lpm_allowed:1;
>  	unsigned usb3_lpm_u1_enabled:1;
>  	unsigned usb3_lpm_u2_enabled:1;
> +	unsigned eusb2v2_mps_active:1;
>  	int string_langid;
>  
>  	/* static strings from the device */
> 
> -- 
> 2.43.0
> 
> 
