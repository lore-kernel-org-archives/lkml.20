Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E92A3ACA6F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103589; cv=none; b=eo8CfMUT4UCOl4m2rBiWxbZr4K83ia+XZUEqdd13LdoD/B02z4MjLAPP6mNIpE9/L4xw7smIzEH/H34JHZ+4FMfMCcSDW3ObTh8fXFZHaHxqybXrv+5tETGWTLYclpFIyt93Iuh4rDCo3dcq7QQstnJajgGF3ueEEHyHmK4hm+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103589; c=relaxed/simple;
	bh=8Abnj6azgbs91xRPF2cXeQoqVw8kD7bJ9Ve9k+m/Ib0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=XMBnSN/95OyjC3cWIeo4qAyunzOWH3bpgEGWE+xQWtKXFYyWHxN6W3pDr0auXU+I48ftFrA7op8QPhpT48+gWsHZbBC2TaDOPYhgpaX1cJ4gc25J8UEHi86faz7eKWJYJsqyfFVYSGaLT9iO1015VmgwGV6dv9tJOaBOupLRwNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=EY17css3; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="EY17css3"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260911051303epoutp04b4b1c92bf4741a7e34b8487a79645592~ULDsDYVZ51834418344epoutp04U
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:13:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260911051303epoutp04b4b1c92bf4741a7e34b8487a79645592~ULDsDYVZ51834418344epoutp04U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789103583;
	bh=fZBWhodU4eaMIS3/+hE9SWO7koD5cEYRpcFIiPmsQhU=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=EY17css3hWuXdMDtVnRbpL6sNFVRra5JDUYF8lqgTurC7ILdqnHLWh4soPQTJjmsZ
	 0+NRnB2MH5X5O1Ys+hTF1J0mPlLuCluuOEV/IKYbDFIgPP5IaCr0T5TkU2LE2tgXm8
	 c5iTSAVYWQpEWp80l2atlXv6S2niQ91XGLfeoKq0=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260911051303epcas5p21ff248c21f1639327165bcf6de64f1c1~ULDrv8NDW1918819188epcas5p2B;
	Fri, 11 Sep 2026 05:13:03 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4hh2k748c5z6B9mF; Fri, 11 Sep
	2026 05:13:03 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260911051055epcas5p1763981159c931b76a4f627f14910b339~ULB0fTJkk2083520835epcas5p1f;
	Fri, 11 Sep 2026 05:10:55 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260911051054epsmtip21a540febf9788b634a2aa3fb7569fc70~ULBzGQ-2y2028620286epsmtip2Z;
	Fri, 11 Sep 2026 05:10:53 +0000 (GMT)
Message-ID: <750468423.101789103583573.JavaMail.epsvc@epcpadp2new>
Date: Fri, 11 Sep 2026 10:40:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW1BBVENIXSB4aGNpOiBzaWRlYmFuZDogY2hlY2sg?=
 =?UTF-8?Q?vdev_liveness_before_removing_endpoints_on_unregister?=
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>, Mathias Nyman
	<mathias.nyman@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "quic_wcheng@quicinc.com"
	<quic_wcheng@quicinc.com>, "broonie@kernel.org" <broonie@kernel.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"cpgs@samsung.com" <cpgs@samsung.com>, "alim.akhtar@samsung.com"
	<alim.akhtar@samsung.com>, "thiagu.r@samsung.com" <thiagu.r@samsung.com>
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <TYUPR06MB62172308C897F81F7DAFF557D2BF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260911051055epcas5p1763981159c931b76a4f627f14910b339
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20260910101324epcas5p1faf6f82de85c9468f42f6f9b2f13e99b
References: <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<CGME20260910101324epcas5p1faf6f82de85c9468f42f6f9b2f13e99b@epcas5p1.samsung.com>
	<c17e0351-d390-4a40-89c4-51d4be9f0123@linux.intel.com>
	<360067785.01789039502721.JavaMail.epsvc@epcpadp1new>
	<TYUPR06MB62172308C897F81F7DAFF557D2BF2@TYUPR06MB6217.apcprd06.prod.outlook.com>


On 9/10/2026 5:41 PM, 胡连勤 wrote:
> Hi Mathias, Selva,
>
>>> I think we need to address this issue a lot earlier than in
>>> xhci_sideband_unregister()
>>>
>>> xhci_free_virt_device() shouldn't leave any dangling pointers, if
>>> vdev->sideband
>>> is still set at this point then something is wrong, and should as a
>>> final resort be
>>> fixed here. Print a debug message and set vdev->sideband->vdev = NULL
>>> before freeing vdev.
>>>
>>> Another issue is the transaction error recovery during address device.
>>> xHCI specs say we should disable and re-enable the slot.
>>> xhci driver additionally frees and reallocates the vdev.
>>> We could probably avoid this and just re-initialize the contexts without
>>> reallocating vdev.  This being said I think it would be even better to
>>> not
>>> try to 'usb persist' sideband over a usb device reset.
>>>
>>> Might be best to unregister sideband in qualcomm usb audio driver
>>> completely in
>>> the drv->pre_reset, and re-register it back in drv->post_reset
>>>
>>> But to avoid this specific issue we should also set
>>> vdev->sideband->vdev to NULL
>>> in xhci_free_virt_device()
>> Regarding the suggestion to set vdev->sideband->vdev = NULL within
>> xhci_free_virt_device() to avoid dangling pointers, I agree that this
>> effectively prevents the use after free during unregistration.
>>
>> But, I would like to highlight a critical point regarding the
>> interrupter lifecycle. Even if sb->vdev is set to NULL ,
>> __xhci_sideband_remove_interrupter() must still be invoked during the
>> unregistration sequence.
>>
>> If the interrupter removal is skipped because vdev=NULL , the secondary
>> interrupter resource is leaked. In our observations, this leads to a
>> failure during the subsequent device connection and registration
>> attempt, resulting in the error: "Failed to add secondary interrupter,
>> max interrupters".
>>
>> So it is essential that the cleanup path ensures the interrupter is
>> released regardless of whether the vdev is still alive.
>>
> Thanks for the review and the detailed suggestions.
>
> You're right, xhci_free_virt_device() is the right place to ensure
> no dangling pointers are left. I've updated the patch accordingly:
>
> 1. In xhci_free_virt_device(), if vdev->sideband is still set at free
>     time, print a debug message and set vdev->sideband->vdev = NULL
>     before kfree(dev). This breaks the dangling pointer at the source.
>
> 2. In xhci_sideband_unregister(), check sb->vdev before issuing stop
>     endpoint commands. If already NULL (cleared by
>     xhci_free_virt_device), skip endpoint cleanup but still remove the
>     interrupter and free the sideband instance. The interrupter and
>     sideband struct are host-level resources independent of vdev's
>     lifecycle, so they must be released unconditionally to avoid
>     leaks.
>
> Regarding Selva's point on the interrupter lifecycle: I entirely
> agree. If the interrupter removal is skipped when vdev is NULL,
> the secondary interrupter leaks and causes "Failed to add secondary
> interrupter, max interrupters" on subsequent device connections.
> This is exactly why the updated patch ensures
> __xhci_sideband_remove_interrupter() is called regardless of whether
> vdev is still alive.
>
> Regarding the USB device reset path: I agree that unregistering
> sideband in drv->pre_reset and re-registering in drv->post_reset
> would be the cleaner approach. I'll look into implementing this as
> a follow-up change in the qualcomm usb audio offload driver.
>
> Regarding the vdev free+realloc during address device error recovery:
> while re-initializing contexts without reallocating vdev could reduce
> the risk of dangling pointers, this is a separate concern from the
> immediate fix and would require a thorough analysis of the slot
> lifecycle. I plan to investigate this as a separate effort.
>
> Proposed changes below for review:
>
>   drivers/usb/host/xhci-mem.c      |  8 ++++++++
>   drivers/usb/host/xhci-sideband.c | 25 ++++++++++++++++++-------
>   2 files changed, 26 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index af8d4b74c4ba..afdcfb38b35f 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -922,6 +922,14 @@ void xhci_free_virt_device(struct xhci_hcd *xhci, struct xhci_virt_device *dev,
>   		dev->rhub_port->slot_id = 0;
>   	if (xhci->devs[slot_id] == dev)
>   		xhci->devs[slot_id] = NULL;
> +
> +	if (dev->sideband) {
> +		xhci_dbg(xhci, "vdev for slot %d has sideband still set at free, clearing dangling pointer\n",
> +			  slot_id);
> +		dev->sideband->vdev = NULL;

Thanks for your updated patch.

Dont forget to add #include <linux/usb/xhci-sideband.h> in this 
xhci-mem.c file otherwise getting below error,

drivers/usb/host/xhci-mem.c:928:30: error: invalid use of undefined type 
‘struct xhci_sideband’
     928 |                 dev->sideband->vdev = NULL;


> +		dev->sideband = NULL;
> +	}
> +
>   	kfree(dev);
>   }
>   
> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
> index a5deeee4d5dc..6312c9e3af65 100644
> --- a/drivers/usb/host/xhci-sideband.c
> +++ b/drivers/usb/host/xhci-sideband.c
> @@ -472,12 +472,22 @@ xhci_sideband_unregister(struct xhci_sideband *sb)
>   
>   	scoped_guard(mutex, &sb->mutex) {
>   		vdev = sb->vdev;
> -		if (!vdev)
> -			return;
> -
> -		for (i = 0; i < EP_CTX_PER_DEV; i++)
> -			if (sb->eps[i])
> -				__xhci_sideband_remove_endpoint(sb, sb->eps[i]);
> +		/*
> +		 * If vdev is NULL, xhci_free_virt_device() has already
> +		 * cleared sb->vdev and freed vdev (e.g. on
> +		 * COMP_USB_TRANSACTION_ERROR during address device
> +		 * recovery). Skip endpoint cleanup as the xHC has already
> +		 * disabled the slot.
> +		 *
> +		 * The interrupter and sideband instance are host-level
> +		 * resources independent of vdev, so still remove and free
> +		 * them to avoid leaks.
> +		 */
> +		if (vdev) {
> +			for (i = 0; i < EP_CTX_PER_DEV; i++)
> +				if (sb->eps[i])
> +					__xhci_sideband_remove_endpoint(sb, sb->eps[i]);

I have one query on  skip endpoint cleanup due to  vdev is NULL, in this 
case the pointers in sb->eps are not cleared. Since these pointers point 
into the virtual device eps, any subsequent call to sideband API 
functions like xhci_sideband_get_endpoint_buffer() that dereference 
sb->eps could result in a use after free if the virtual device has been 
freed. Is it possible?


Thanks,

Selva

> +		}
>   
>   		__xhci_sideband_remove_interrupter(sb);
>   
> @@ -486,7 +496,8 @@ xhci_sideband_unregister(struct xhci_sideband *sb)
>   
>   	spin_lock_irq(&xhci->lock);
>   	sb->xhci = NULL;
> -	vdev->sideband = NULL;
> +	if (vdev)
> +		vdev->sideband = NULL;
>   	spin_unlock_irq(&xhci->lock);
>   
>   	kfree(sb);
>
> Does this approach look good to you? If so I'll send a formal v2 patch.
>
> Thanks
> Lianqin

