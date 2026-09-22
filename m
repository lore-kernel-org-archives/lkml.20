Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407174432F2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068521; cv=none; b=N48VR5AxfV7mqZclVN5ehU1kpaV6P8r0UQkLVXdLAV3GU/ZDrajX17HYPld7ae1XqvyZcAKEqmph2xky99+75mm70mWdZc4vmhZaGbwLKQwMLepVP+vjZOdxrvhZxpOFeEbrXh2bfshHKy9QpSGBWNQeDXGri/P/GzfETZPrj0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068521; c=relaxed/simple;
	bh=goARlQ5eMbETkLPIVLkckxN2ilona/6uuNsdFwXTvGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=GO35R1zzf1CoNw6fsuZMn7xKdNe9ZAx+guSBKIk5o5yR+3BJodFHp6PK3ki+KbhDNEQV/bMWUPpLB/l9dHS3MLxWbR8KiW3B9WW6SZpP7W98pxlBgZxxXPLB0FRC8Vw4nzn8XDngH5gaLnuHCF1Yg5ZP+tCRRmPY0wVvh3HWSx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=csUfp+o2; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="csUfp+o2"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260922091509epoutp01774b6556022c8c814cf6f24383c73f39~XmdNBb_3O0094300943epoutp01Z
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:15:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260922091509epoutp01774b6556022c8c814cf6f24383c73f39~XmdNBb_3O0094300943epoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790068509;
	bh=lyll2nRiRWj4x+RtNyLONb2DLwpJqy3FS2CgeRfDMog=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=csUfp+o2NPKbqxCJwr0k+9CwoagS2MphiS1JYwzxIFQE+Q2prvzBXO5VOPsiw4ZhP
	 FQUT4x6RuJ7fcxYE0gSPBaJFpyFRkJ5wApt2zXgZr9T6PEF54wHQlD8a0FMrm7Gzrr
	 fjidK7QtzmCQEdpzcxoMGjEI0KrVTokRPmQq9iR4=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260922091509epcas5p48c68f9d1dd501d96b7562372f62a2373~XmdMoqmwp0552005520epcas5p4e;
	Tue, 22 Sep 2026 09:15:09 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.94]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4hpvZN12t8z6B9m6; Tue, 22 Sep
	2026 09:15:08 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260922091507epcas5p2e87ca2f3934485ce324d4043753fc8fb~XmdLZxSEh1620916209epcas5p2w;
	Tue, 22 Sep 2026 09:15:07 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260922091507epsmtip2725628ca50575bf4e77273522f5210f0~XmdKxqYMv0033900339epsmtip24;
	Tue, 22 Sep 2026 09:15:06 +0000 (GMT)
Message-ID: <1adbc290-0800-433d-a3d9-f7bc60dec465@samsung.com>
Date: Tue, 22 Sep 2026 14:45:04 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] usb: gadget: composite: Support eUSB2v2 bulk MPS
 update request
To: Pawel Laszczak <pawell@cadence.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <LV5PR07MB1135491923A16D92A6ADBDBF3DD832@LV5PR07MB11354.namprd07.prod.outlook.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260922091507epcas5p2e87ca2f3934485ce324d4043753fc8fb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260826110559epcas5p27b60424eeb9ddb633a8d26ceffabd291
References: <20260826-eusb2v2-packet-size-v2-0-950f19f38ef0@cadence.com>
	<CGME20260826110559epcas5p27b60424eeb9ddb633a8d26ceffabd291@epcas5p2.samsung.com>
	<20260826-eusb2v2-packet-size-v2-2-950f19f38ef0@cadence.com>
	<3d5f5887-d708-4e70-a229-62ee34fc8325@samsung.com>
	<LV5PR07MB1135491923A16D92A6ADBDBF3DD832@LV5PR07MB11354.namprd07.prod.outlook.com>


On 9/22/2026 1:46 PM, Pawel Laszczak wrote:
>> On 8/26/2026 4:54 PM, Pawel Laszczak via B4 Relay wrote:
>>> From: Pawel Laszczak <pawell@cadence.com>
>>>
>>> Add support for eUSB2v2 1024-byte Bulk MPS negotiation to the Gadget
>>> Composite framework.
>>>
>>> If 'gadget->is_eusb2v2' is set, force bcdUSB to 0x0230 and bMaxPacketSize0
>>> to 64 bytes. Handle the USB_DEVICE_BULK_MAX_PACKET_UPDATE feature
>> request
>>> by introducing eusb2_update_mps_bulk(), which dynamically updates the
>>> wMaxPacketSize of all HS Bulk endpoint descriptors to 1024 bytes before
>>> the device is configured.
>>>
>>> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
>>> ---
>>> Changes in v2:
>>> - composite.c: CLEAR_FEATURE(BULK_MAX_PACKET_UPDATE) is not defined in
>> the
>>>     eUSB2v2 spec; stall it instead of incorrectly setting 1024-byte mode.
>>> - restore MPS in __composite_disconnect
>>> ---
>>>    drivers/usb/gadget/composite.c | 68
>> ++++++++++++++++++++++++++++++++++++++----
>>>    include/linux/usb/gadget.h     |  2 ++
>>>    2 files changed, 64 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
>>> index dc3664374596..f0246e25f2b5 100644
>>> --- a/drivers/usb/gadget/composite.c
>>> +++ b/drivers/usb/gadget/composite.c
>>> @@ -924,6 +924,48 @@ static void device_qual(struct usb_composite_dev
>> *cdev)
>>>    }
>>>
>>>    /*-------------------------------------------------------------------------*/
>>> +static void eusb2_update_ep_mps(struct usb_descriptor_header *header,
>> __le16 mps)
>>> +{
>>> +	struct usb_endpoint_descriptor *epd;
>>> +
>>> +	if (header->bDescriptorType != USB_DT_ENDPOINT)
>>> +		return;
>>> +
>>> +	epd = (void *)header;
>>> +	if (usb_endpoint_xfer_bulk(epd))
>>> +		epd->wMaxPacketSize = mps;
>>> +}
>>> +
>>> +static int eusb2_update_mps_bulk(struct usb_composite_dev *cdev, bool
>> set)
>>> +{
>>> +	__le16 mps = cpu_to_le16(set ? 1024 : 512);
>>> +	struct usb_gadget *gadget = cdev->gadget;
>>> +	struct usb_configuration *config;
>>> +	struct usb_function *f;
>>> +
>>> +	if (!gadget->is_eusb2v2)
>>> +		return -EINVAL;
>>> +
>>> +	if (set && gadget->state >= USB_STATE_CONFIGURED)
>>> +		return -EINVAL;
>>> +
>>> +	list_for_each_entry(config, &cdev->configs, list) {
>>> +		if (!config->highspeed)
>>> +			continue;
>>> +
>>> +		list_for_each_entry(f, &config->functions, list) {
>>> +			struct usb_descriptor_header **desc = f-
>>> hs_descriptors;
>>> +
>>> +			if (!desc)
>>> +				continue;
>>> +
>>> +			for (; *desc; desc++)
>>> +				eusb2_update_ep_mps(*desc, mps);
>>> +		}
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>>
>>>    static void reset_config(struct usb_composite_dev *cdev)
>>>    {
>>> @@ -971,8 +1013,10 @@ static int set_config(struct usb_composite_dev
>> *cdev,
>>>    		if (result < 0)
>>>    			goto done;
>>>    	} else { /* Zero configuration value - need to reset the config */
>>> -		if (cdev->config)
>>> +		if (cdev->config) {
>>>    			reset_config(cdev);
>>> +			eusb2_update_mps_bulk(cdev, false);
>>> +		}
>>>    		result = 0;
>>>    	}
>>>
>>> @@ -1807,7 +1851,11 @@ composite_setup(struct usb_gadget *gadget,
>> const struct usb_ctrlrequest *ctrl)
>>>    				count_configs(cdev, USB_DT_DEVICE);
>>>    			cdev->desc.bMaxPacketSize0 =
>>>    				cdev->gadget->ep0->maxpacket;
>>> -			if (gadget_is_superspeed(gadget)) {
>>> +
>>> +			if (gadget->is_eusb2v2) {
>>> +				cdev->desc.bcdUSB = cpu_to_le16(0x0230);
>>> +				cdev->desc.bMaxPacketSize0 = 64;
>>> +			} else if (gadget_is_superspeed(gadget)) {
>>>    				if (gadget->speed >= USB_SPEED_SUPER) {
>>>    					cdev->desc.bcdUSB =
>> cpu_to_le16(0x0320);
>>>    					cdev->desc.bMaxPacketSize0 = 9;
>>> @@ -2005,12 +2053,19 @@ composite_setup(struct usb_gadget *gadget,
>> const struct usb_ctrlrequest *ctrl)
>>>    	 */
>>>    	case USB_REQ_CLEAR_FEATURE:
>>>    	case USB_REQ_SET_FEATURE:
>>> -		if (!gadget_is_superspeed(gadget))
>>> -			goto unknown;
>>> -		if (ctrl->bRequestType != (USB_DIR_OUT |
>> USB_RECIP_INTERFACE))
>>> -			goto unknown;
>>>    		switch (w_value) {
>>> +		case USB_DEVICE_BULK_MAX_PACKET_UPDATE:
>>> +			if (ctrl->bRequestType != (USB_DIR_OUT |
>> USB_RECIP_DEVICE))
>>> +				goto unknown;
>>> +			if (ctrl->bRequest != USB_REQ_SET_FEATURE)
>>> +				goto unknown;
>>> +			value = eusb2_update_mps_bulk(cdev, true);
>> Here both USB_REQ_CLEAR_FEATURE and USB_REQ_SET_FEATURE fall through
>> to
>> the same switch, and USB_DEVICE_BULK_MAX_PACKET_UPDATE unconditionally
>> calls eusb2_update_mps_bulk(cdev, true) regardless of which request type
>> was received.
>>
>> The CLEAR_FEATURE may request should revert the MPS back to the default
>> by calling eusb2_update_mps_bulk(cdev, false), but instead it performs
>> the same action as SET_FEATURE.
>>
>> Is this required distinguished using ctrl->bRequest to check whether
>> this is a SET or CLEAR operation?
> Hi Selva,
>
> Thank you for the review.
>
> The eUSB2v2 specification does not define CLEAR_FEATURE for the
> BULK_MAX_PACKET_UPDATE feature selector, so the device is expected to
> respond with a STALL in that case.
>
> The check on line:
>
> if (ctrl->bRequest != USB_REQ_SET_FEATURE)
>          goto unknown;
>
> already handles this: when CLEAR_FEATURE falls through to the
> USB_DEVICE_BULK_MAX_PACKET_UPDATE case, it hits this condition and
> jumps to 'unknown', which results in a STALL being returned to the
> host. So eusb2_update_mps_bulk(cdev, true) is never called for
> CLEAR_FEATURE.


Hi Pawel,

Thanks for the explanation. Its looks good to me.

It would be nice to have a brief mention of the CLEAR_FEATURE behavior 
and MPS restoration in the commit message just for future reference, but 
I'll leave it up to you if you think it's necessary.

Thanks,
Selva
>
> MPS restoration to 512 bytes is handled separately on disconnect and
> deconfiguration events (__composite_disconnect and set_config).
>
> Thanks,
> Pawel
>>
>> Thanks,
>> Selva
>>> +			break;
>>>    		case USB_INTRF_FUNC_SUSPEND:
>>> +			if (!gadget_is_superspeed(gadget))
>>> +				goto unknown;
>>> +			if (ctrl->bRequestType != (USB_DIR_OUT |
>> USB_RECIP_INTERFACE))
>>> +				goto unknown;
>>>    			if (!cdev->config || intf >= MAX_CONFIG_INTERFACES)
>>>    				break;
>>>    			f = cdev->config->interface[intf];
>>> @@ -2293,6 +2348,7 @@ static void __composite_disconnect(struct
>> usb_gadget *gadget)
>>>    	 * disconnect callbacks?
>>>    	 */
>>>    	spin_lock_irqsave(&cdev->lock, flags);
>>> +	eusb2_update_mps_bulk(cdev, false);
>>>    	cdev->suspended = 0;
>>>    	if (cdev->config)
>>>    		reset_config(cdev);
>>> diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
>>> index 8285b19a25e0..3c554fe95f87 100644
>>> --- a/include/linux/usb/gadget.h
>>> +++ b/include/linux/usb/gadget.h
>>> @@ -420,6 +420,7 @@ struct usb_gadget_ops {
>>>     * @wakeup_armed: True if gadget is armed by the host for remote wakeup.
>>>     * @irq: the interrupt number for device controller.
>>>     * @id_number: a unique ID number for ensuring that gadget names are
>> distinct
>>> + * @is_eusb2v2: True if controller is Embedded usb2.
>>>     *
>>>     * Gadgets have a mostly-portable "gadget driver" implementing device
>>>     * functions, handling all usb configurations and interfaces.  Gadget
>>> @@ -483,6 +484,7 @@ struct usb_gadget {
>>>    	unsigned			lpm_capable:1;
>>>    	unsigned			wakeup_capable:1;
>>>    	unsigned			wakeup_armed:1;
>>> +	unsigned			is_eusb2v2:1;
>>>    	int				irq;
>>>    	int				id_number;
>>>    };
>>>
