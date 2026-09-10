Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F26A46D56B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041256; cv=none; b=VftizHc49Lurml5z/IWoKpg3ASE6xc4L9pjjdDInU479W+fUE5wdwPR123TIA7SAl+kGYMSgaIA/fTaLRnGS3bOWq7pl3xF2IjgED4+zDwX6UQzuuJ6qE8Chck6rzRksI/V/QzXJiYZ404UbJJZoOUEnh+5imRUQQ+RK92R0ACM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041256; c=relaxed/simple;
	bh=qcwQRHslT7dYc/uyCsNit0LKfjavveQD97aSHPWRXn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=CLcSw57pILYLJqfmOFN+rxXRPogqnadaBhRn0YK8HhJmCry+SdEh2xuDchVoSaiiQpUrvvx01RBxRtlrpKRj8HSAe9ejRVspjymwOHem3ZYxfhAJvYvB/18mPi5UQZgGxdkk/77/VehlNRWMl8Dw9onqxR9qB3XF58OQ7Rv9zXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=QLnMZAIR; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QLnMZAIR"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260910115405epoutp0404054f83c5a1373a3918b4a8f892f25c~T84i7gw7W2517225172epoutp04Z
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:54:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260910115405epoutp0404054f83c5a1373a3918b4a8f892f25c~T84i7gw7W2517225172epoutp04Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789041245;
	bh=KmrEJet2iQTzVyIIhZ8lOGRTMw9Y+etmN+Mrgo9IPzs=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=QLnMZAIRtSiDA8V2FeW44INGhW+Xml3S5SHO/G8VarnWw1XLRAqUG5BVByxwYRpQ5
	 oh4mc8xoYpT75dzyk/hhXHhv5JSTOMj5RVd8dX2NjFQYEMn0G/a1cJGrQVHEylfBpe
	 6Y7Pt3aTgWgzlZuaExq95Fr0KHloXv2+m+GuSLj0=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260910115405epcas5p36206258e4efbdeee0e94a34c86a6c991~T84ijvuQt0381803818epcas5p3k;
	Thu, 10 Sep 2026 11:54:05 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.92]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4hgbgJ1hnlz6B9m6; Thu, 10 Sep
	2026 11:54:04 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260910115403epcas5p172d46324368bf3e405eb305e59d8db0e~T84hUFWlP1108911089epcas5p1g;
	Thu, 10 Sep 2026 11:54:03 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260910115403epsmtip17b4740f5b7eb2bf6cb6b828b930d4893~T84gu-x5N2663626636epsmtip1j;
	Thu, 10 Sep 2026 11:54:03 +0000 (GMT)
Message-ID: <3d5f5887-d708-4e70-a229-62ee34fc8325@samsung.com>
Date: Thu, 10 Sep 2026 17:24:02 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] usb: gadget: composite: Support eUSB2v2 bulk MPS
 update request
To: pawell@cadence.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <20260826-eusb2v2-packet-size-v2-2-950f19f38ef0@cadence.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260910115403epcas5p172d46324368bf3e405eb305e59d8db0e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260826110559epcas5p27b60424eeb9ddb633a8d26ceffabd291
References: <20260826-eusb2v2-packet-size-v2-0-950f19f38ef0@cadence.com>
	<CGME20260826110559epcas5p27b60424eeb9ddb633a8d26ceffabd291@epcas5p2.samsung.com>
	<20260826-eusb2v2-packet-size-v2-2-950f19f38ef0@cadence.com>


On 8/26/2026 4:54 PM, Pawel Laszczak via B4 Relay wrote:
> From: Pawel Laszczak <pawell@cadence.com>
>
> Add support for eUSB2v2 1024-byte Bulk MPS negotiation to the Gadget
> Composite framework.
>
> If 'gadget->is_eusb2v2' is set, force bcdUSB to 0x0230 and bMaxPacketSize0
> to 64 bytes. Handle the USB_DEVICE_BULK_MAX_PACKET_UPDATE feature request
> by introducing eusb2_update_mps_bulk(), which dynamically updates the
> wMaxPacketSize of all HS Bulk endpoint descriptors to 1024 bytes before
> the device is configured.
>
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> ---
> Changes in v2:
> - composite.c: CLEAR_FEATURE(BULK_MAX_PACKET_UPDATE) is not defined in the
>    eUSB2v2 spec; stall it instead of incorrectly setting 1024-byte mode.
> - restore MPS in __composite_disconnect
> ---
>   drivers/usb/gadget/composite.c | 68 ++++++++++++++++++++++++++++++++++++++----
>   include/linux/usb/gadget.h     |  2 ++
>   2 files changed, 64 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
> index dc3664374596..f0246e25f2b5 100644
> --- a/drivers/usb/gadget/composite.c
> +++ b/drivers/usb/gadget/composite.c
> @@ -924,6 +924,48 @@ static void device_qual(struct usb_composite_dev *cdev)
>   }
>   
>   /*-------------------------------------------------------------------------*/
> +static void eusb2_update_ep_mps(struct usb_descriptor_header *header, __le16 mps)
> +{
> +	struct usb_endpoint_descriptor *epd;
> +
> +	if (header->bDescriptorType != USB_DT_ENDPOINT)
> +		return;
> +
> +	epd = (void *)header;
> +	if (usb_endpoint_xfer_bulk(epd))
> +		epd->wMaxPacketSize = mps;
> +}
> +
> +static int eusb2_update_mps_bulk(struct usb_composite_dev *cdev, bool set)
> +{
> +	__le16 mps = cpu_to_le16(set ? 1024 : 512);
> +	struct usb_gadget *gadget = cdev->gadget;
> +	struct usb_configuration *config;
> +	struct usb_function *f;
> +
> +	if (!gadget->is_eusb2v2)
> +		return -EINVAL;
> +
> +	if (set && gadget->state >= USB_STATE_CONFIGURED)
> +		return -EINVAL;
> +
> +	list_for_each_entry(config, &cdev->configs, list) {
> +		if (!config->highspeed)
> +			continue;
> +
> +		list_for_each_entry(f, &config->functions, list) {
> +			struct usb_descriptor_header **desc = f->hs_descriptors;
> +
> +			if (!desc)
> +				continue;
> +
> +			for (; *desc; desc++)
> +				eusb2_update_ep_mps(*desc, mps);
> +		}
> +	}
> +
> +	return 0;
> +}
>   
>   static void reset_config(struct usb_composite_dev *cdev)
>   {
> @@ -971,8 +1013,10 @@ static int set_config(struct usb_composite_dev *cdev,
>   		if (result < 0)
>   			goto done;
>   	} else { /* Zero configuration value - need to reset the config */
> -		if (cdev->config)
> +		if (cdev->config) {
>   			reset_config(cdev);
> +			eusb2_update_mps_bulk(cdev, false);
> +		}
>   		result = 0;
>   	}
>   
> @@ -1807,7 +1851,11 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
>   				count_configs(cdev, USB_DT_DEVICE);
>   			cdev->desc.bMaxPacketSize0 =
>   				cdev->gadget->ep0->maxpacket;
> -			if (gadget_is_superspeed(gadget)) {
> +
> +			if (gadget->is_eusb2v2) {
> +				cdev->desc.bcdUSB = cpu_to_le16(0x0230);
> +				cdev->desc.bMaxPacketSize0 = 64;
> +			} else if (gadget_is_superspeed(gadget)) {
>   				if (gadget->speed >= USB_SPEED_SUPER) {
>   					cdev->desc.bcdUSB = cpu_to_le16(0x0320);
>   					cdev->desc.bMaxPacketSize0 = 9;
> @@ -2005,12 +2053,19 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
>   	 */
>   	case USB_REQ_CLEAR_FEATURE:
>   	case USB_REQ_SET_FEATURE:
> -		if (!gadget_is_superspeed(gadget))
> -			goto unknown;
> -		if (ctrl->bRequestType != (USB_DIR_OUT | USB_RECIP_INTERFACE))
> -			goto unknown;
>   		switch (w_value) {
> +		case USB_DEVICE_BULK_MAX_PACKET_UPDATE:
> +			if (ctrl->bRequestType != (USB_DIR_OUT | USB_RECIP_DEVICE))
> +				goto unknown;
> +			if (ctrl->bRequest != USB_REQ_SET_FEATURE)
> +				goto unknown;
> +			value = eusb2_update_mps_bulk(cdev, true);
Here both USB_REQ_CLEAR_FEATURE and USB_REQ_SET_FEATURE fall through to 
the same switch, and USB_DEVICE_BULK_MAX_PACKET_UPDATE unconditionally 
calls eusb2_update_mps_bulk(cdev, true) regardless of which request type 
was received.

The CLEAR_FEATURE may request should revert the MPS back to the default 
by calling eusb2_update_mps_bulk(cdev, false), but instead it performs 
the same action as SET_FEATURE.

Is this required distinguished using ctrl->bRequest to check whether 
this is a SET or CLEAR operation?


Thanks,
Selva
> +			break;
>   		case USB_INTRF_FUNC_SUSPEND:
> +			if (!gadget_is_superspeed(gadget))
> +				goto unknown;
> +			if (ctrl->bRequestType != (USB_DIR_OUT | USB_RECIP_INTERFACE))
> +				goto unknown;
>   			if (!cdev->config || intf >= MAX_CONFIG_INTERFACES)
>   				break;
>   			f = cdev->config->interface[intf];
> @@ -2293,6 +2348,7 @@ static void __composite_disconnect(struct usb_gadget *gadget)
>   	 * disconnect callbacks?
>   	 */
>   	spin_lock_irqsave(&cdev->lock, flags);
> +	eusb2_update_mps_bulk(cdev, false);
>   	cdev->suspended = 0;
>   	if (cdev->config)
>   		reset_config(cdev);
> diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
> index 8285b19a25e0..3c554fe95f87 100644
> --- a/include/linux/usb/gadget.h
> +++ b/include/linux/usb/gadget.h
> @@ -420,6 +420,7 @@ struct usb_gadget_ops {
>    * @wakeup_armed: True if gadget is armed by the host for remote wakeup.
>    * @irq: the interrupt number for device controller.
>    * @id_number: a unique ID number for ensuring that gadget names are distinct
> + * @is_eusb2v2: True if controller is Embedded usb2.
>    *
>    * Gadgets have a mostly-portable "gadget driver" implementing device
>    * functions, handling all usb configurations and interfaces.  Gadget
> @@ -483,6 +484,7 @@ struct usb_gadget {
>   	unsigned			lpm_capable:1;
>   	unsigned			wakeup_capable:1;
>   	unsigned			wakeup_armed:1;
> +	unsigned			is_eusb2v2:1;
>   	int				irq;
>   	int				id_number;
>   };
>
