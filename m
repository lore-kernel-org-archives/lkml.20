Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BE847ECD8;
	Fri, 11 Sep 2026 13:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132213; cv=none; b=OKazKJQbM9o2abwGiuoU+JiZv3Sh7cTqkPo/+Un0vcuI778V2FHtA2ioUFZmCUHXrx6MNRKi5CpD9MI+O6cpdGoo+RUkkKC9TqXF/sXSoqUUxIo5lkwN3p0cpoC2J1NE/N/Bb2AqrVwmV0w/kEy9SELBEh9ET1g/nd1QponuaNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132213; c=relaxed/simple;
	bh=RDsh0/RkU1LRBCdyggweRnW5LdD/lsWbDH9O0Yk+1UI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iRAzKw8hMGG0vWPAkUZSXf2KolwGi4EbewB8mlOJ0G3uhgjYKefABll+AH7C8RNLqRU0HsFPYsOVIUG4Y8KNIrl9IQBmOuvBj+FS4uxII+p5FHHqp+f6H/tuFZheRIPcE9ylTpSxQ+VYiY4W8NhcGZKkfa75AgJq1UvEf99XycY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RC6Z8NlS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RC6Z8NlS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789132212; x=1820668212;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RDsh0/RkU1LRBCdyggweRnW5LdD/lsWbDH9O0Yk+1UI=;
  b=RC6Z8NlSEyz57i53bip88zZEJjyjJnZGWK1apC1d3z7sf9gzHpS1WTd7
   EwKUcXe9geVnCmeg18AeHUyu15Bd3rqYCoe/zp/jpSmpUBPw+ojHOL0jB
   SOeWfoGKFdkzjmZiLep8zahIHVR3Tk8JlGlQYi1nVYPa16M6PyuIFfAt0
   JdswlUZFtP9GDalJGCEqjylMWb/r4LQJWE7y0rGo0tn8F00f8DjjpsTAg
   1Q2lGz0U9GUKihMqkP2ex0SwpCucSot3Ht/9MhCtG7XOEfFkFHcuyJgRE
   kqZtEjH/KFabr83iRQtqGoEW3cctKE1rPx9RtrPeqYmhnp6rzc6e02snk
   w==;
X-CSE-ConnectionGUID: E+fBN89JQum2rbPHB3CBaw==
X-CSE-MsgGUID: yfKDxF/4Sr+eJ+s+FhOGyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89805599"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89805599"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 06:10:11 -0700
X-CSE-ConnectionGUID: cjIHxHfLQRik0mbu7DuvIw==
X-CSE-MsgGUID: LDG+R1U1TWWN0ensOXUbsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="194005"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO [10.245.244.154]) ([10.245.244.154])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 06:10:08 -0700
Message-ID: <191ee5d5-d93d-4fa3-9654-b3735d344118@linux.intel.com>
Date: Fri, 11 Sep 2026 16:10:04 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOetlOWkjTog562U5aSNOiBbUEFUQ0hdIHhoY2k6IHNpZGViYW5k?=
 =?UTF-8?Q?=3A_check_vdev_liveness_before_removing_endpoints_on_unregister?=
To: Selvarasu Ganesan <selvarasu.g@samsung.com>, =?UTF-8?B?6IOh6L+e5Yuk?=
 <hulianqin@vivo.com>, Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
 "broonie@kernel.org" <broonie@kernel.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cpgs@samsung.com" <cpgs@samsung.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "thiagu.r@samsung.com" <thiagu.r@samsung.com>
References: <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <CGME20260910101324epcas5p1faf6f82de85c9468f42f6f9b2f13e99b@epcas5p1.samsung.com>
 <c17e0351-d390-4a40-89c4-51d4be9f0123@linux.intel.com>
 <360067785.01789039502721.JavaMail.epsvc@epcpadp1new>
 <TYUPR06MB62172308C897F81F7DAFF557D2BF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <750468423.101789103583573.JavaMail.epsvc@epcpadp2new>
 <TYUPR06MB6217F0788C14DD89D237C807D2BE2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <937773018.41789116303608.JavaMail.epsvc@epcpadp1new>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <937773018.41789116303608.JavaMail.epsvc@epcpadp1new>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/11/26 11:41, Selvarasu Ganesan wrote:
> 
> On 9/11/2026 12:59 PM, 胡连勤 wrote:
>> Hi Selva,
>>
>>>>     drivers/usb/host/xhci-mem.c      |  8 ++++++++
>>>>     drivers/usb/host/xhci-sideband.c | 25 ++++++++++++++++++-------
>>>>     2 files changed, 26 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
>>>> index af8d4b74c4ba..afdcfb38b35f 100644
>>>> --- a/drivers/usb/host/xhci-mem.c
>>>> +++ b/drivers/usb/host/xhci-mem.c
>>>> @@ -922,6 +922,14 @@ void xhci_free_virt_device(struct xhci_hcd *xhci, struct xhci_virt_device *dev,
>>>>     		dev->rhub_port->slot_id = 0;
>>>>     	if (xhci->devs[slot_id] == dev)
>>>>     		xhci->devs[slot_id] = NULL;
>>>> +
>>>> +	if (dev->sideband) {
>>>> +		xhci_dbg(xhci, "vdev for slot %d has sideband still set at free, clearing dangling pointer\n",
>>>> +			  slot_id);
>>>> +		dev->sideband->vdev = NULL;
>>> Thanks for your updated patch.
>>>
>>> Dont forget to add #include <linux/usb/xhci-sideband.h> in this
>>> xhci-mem.c file otherwise getting below error,
>>>
>>> drivers/usb/host/xhci-mem.c:928:30: error: invalid use of undefined type
>>> ‘struct xhci_sideband’
>>>        928 |                 dev->sideband->vdev = NULL;
>>>
>> Include the corresponding header file
>> #include <linux/dmapool.h>
>>    #include <linux/dma-mapping.h>
>>    #include <linux/bitfield.h>
>> +#include <linux/usb/xhci-sideband.h>
>>    
>>
>>>> +		dev->sideband = NULL;
>>>> +	}
>>>> +
>>>>     	kfree(dev);
>>>>     }
>>>>
>>>> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
>>>> index a5deeee4d5dc..6312c9e3af65 100644
>>>> --- a/drivers/usb/host/xhci-sideband.c
>>>> +++ b/drivers/usb/host/xhci-sideband.c
>>>> @@ -472,12 +472,22 @@ xhci_sideband_unregister(struct xhci_sideband *sb)
>>>>
>>>>     	scoped_guard(mutex, &sb->mutex) {
>>>>     		vdev = sb->vdev;
>>>> -		if (!vdev)
>>>> -			return;
>>>> -
>>>> -		for (i = 0; i < EP_CTX_PER_DEV; i++)
>>>> -			if (sb->eps[i])
>>>> -				__xhci_sideband_remove_endpoint(sb, sb->eps[i]);
>>>> +		/*
>>>> +		 * If vdev is NULL, xhci_free_virt_device() has already
>>>> +		 * cleared sb->vdev and freed vdev (e.g. on
>>>> +		 * COMP_USB_TRANSACTION_ERROR during address device
>>>> +		 * recovery). Skip endpoint cleanup as the xHC has already
>>>> +		 * disabled the slot.
>>>> +		 *
>>>> +		 * The interrupter and sideband instance are host-level
>>>> +		 * resources independent of vdev, so still remove and free
>>>> +		 * them to avoid leaks.
>>>> +		 */
>>>> +		if (vdev) {
>>>> +			for (i = 0; i < EP_CTX_PER_DEV; i++)
>>>> +				if (sb->eps[i])
>>>> +					__xhci_sideband_remove_endpoint(sb, sb->eps[i]);
>>> I have one query on  skip endpoint cleanup due to  vdev is NULL, in this
>>> case the pointers in sb->eps are not cleared. Since these pointers point
>>> into the virtual device eps, any subsequent call to sideband API
>>> functions like xhci_sideband_get_endpoint_buffer() that dereference
>>> sb->eps could result in a use after free if the virtual device has been
>>> freed. Is it possible?

Good point, endpoint use after free is a much bigger and earlier issue here.

The endpoint rings that audio driver is accessing via sideband are freed and
reallocated much earlier. Audio driver is unaware of this reset, and may still
try to access the freed ring buffers.
This is an issue long before xhci_sideband_unregister() is called.

usb_reset_and_verify_device()
   hub_port_init()  // resets port
   usb_hcd_alloc_bandwidth(udev, udev->actconfig, NULL, NULL);
     hcd->driver->drop_endpoint()  // for all endpoints, xhci tags ep to be dropped
     hcd->driver->add_endpoint()   // for active endpoints. xhci allocs new ring for ep
     hcd->driver->check_bandwidth(hcd, udev) // xhci frees old ring and takes new ring into use
     
So turns out setting vdev->sideband->vdev to NULL in xhci_free_virt_dev(), and
reacting to it in xhci_sideband_unregister() is too little too late.

I think wee need to look at using drv->pre_reset and drv->post_reset
to unregister and re-register sideband, or optionally to unbind and rebind
the whole interface.

Thanks
Mathias

