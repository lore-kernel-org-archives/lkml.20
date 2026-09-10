Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B44499F03;
	Thu, 10 Sep 2026 13:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048251; cv=none; b=ijqugs+cElACniRwVtex4C9qNAj36QlIQVsxnnwp9NJqH1sMLQv5s41NePwVXlFCABcpbhrcsBbRqv4UAoyuNqF2ObHlT7mgNLbmOTb0/Kj6A6mSCJRIdnSA+1ZNqq0w/D7uSjSZPKNLUnPFcNzxnontPvjkiOjEoY4wTkpAbZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048251; c=relaxed/simple;
	bh=1FlbYwJxU5XlyEPztCRbizLb7NbDwak+IbnSVF6ZfsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t21JckYXg256qGpsxJo7HSMgB0JTjoJccbviVW1Y/SMXotUw8RC6N0HT7bFhWZEwxxSNWmPU3TE/a5CZjJ0OnoYdaQQ4z4fcFbaDVDdDd71cOP1scFdxxjw2rUkiAAgjiW3bWoRM71ekczHhLbto1iz2NI8QdDGYGn73Y+BBRhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bnx7/qt6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bnx7/qt6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789048249; x=1820584249;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1FlbYwJxU5XlyEPztCRbizLb7NbDwak+IbnSVF6ZfsM=;
  b=bnx7/qt6M1SIIVU7Q9a8/RaILFcdt85XHc5eXKb2lb5Qh+oHXdkVm+sY
   vRcawL0KQiYxZL6LT2vHeU/K9ZnA7oNY+Vm5sCQ5f2AfpmYZou3Sa0mZm
   O4AoB/sEwcCIswR11xB0m2qkyxlY++uesUV42qaLIwFHtwVe7blIOKnXT
   WcMffr5CALZy66qaofrxTKcZyQ5v7g9NDBXqQ+piUVUCRuilZacT0U6zs
   TAylIoaerEmP64CwioCXKulXC1K89sQo9UpLb4qvoDfDfa4YvTj2St9um
   RAa3IcequR1Uk8JEeM3FSSv+43vnG9VQtOVKgPKMTIko6zQqNI2ySqSR+
   g==;
X-CSE-ConnectionGUID: ncpDqar4SsqUocc+6t8Tcw==
X-CSE-MsgGUID: pD1AQVRcRyu8PyaWct61bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="93322972"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="93322972"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 06:50:48 -0700
X-CSE-ConnectionGUID: r52SeD0EQFazRK0idjCO0A==
X-CSE-MsgGUID: Vs2GL8flSOOoKZxpdhBuAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="269074589"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.245.216]) ([10.245.245.216])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 06:50:45 -0700
Message-ID: <617e51c2-202f-45ef-8ec2-3ba101666e4c@linux.intel.com>
Date: Thu, 10 Sep 2026 16:50:42 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW1BBVENIXSB4aGNpOiBzaWRlYmFuZDogY2hlY2sg?=
 =?UTF-8?Q?vdev_liveness_before_removing_endpoints_on_unregister?=
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
 Selvarasu Ganesan <selvarasu.g@samsung.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
 "broonie@kernel.org" <broonie@kernel.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cpgs@samsung.com" <cpgs@samsung.com>
References: <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <CGME20260910101324epcas5p1faf6f82de85c9468f42f6f9b2f13e99b@epcas5p1.samsung.com>
 <c17e0351-d390-4a40-89c4-51d4be9f0123@linux.intel.com>
 <360067785.01789039502721.JavaMail.epsvc@epcpadp1new>
 <TYUPR06MB62172308C897F81F7DAFF557D2BF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <TYUPR06MB62172308C897F81F7DAFF557D2BF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/10/26 15:11, 胡连勤 wrote:
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
>>
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
> 
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

Looks good to me

Thanks
Mathias
