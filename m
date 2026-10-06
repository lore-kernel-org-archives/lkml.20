Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67C92EA749;
	Tue,  6 Oct 2026 19:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791313688; cv=none; b=nxNqQLNAp53KOzGP6VVqWS0ISALzSf4PTB1gQgn7BWZRnDmRH0kZoK8lZF3/wYASWisDpXOpl+4iqtnOD/wWnEU8aF7HasKbxPWO1tXptDduPcUXpNUlKmwlIQLjc6nJYBAKQyiKWN0QKFq6VQMjZn0cy4ZGUWtdirllI02cmkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791313688; c=relaxed/simple;
	bh=Qvc+MTySK9lhv1ZK8YpGQ0Dg77ekyeYCQDX3Osgx+3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vu3+ujdrE+rumLKX75Y4Bcq3W0+rhCx3kAP0UA2kkr7oUkoRM6Obz2BVkM8iGgytYnpBHxHWodNsnBgm2vdhgcw7XqgYxkk9novhr9xzxhDtfBrM2BvHEElX4WS2bvoe+n9Fb3o6I9iPYYoGl5+Qv8MqR9Y2eIQBr0pcEpCoT/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XvJUHyJe; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XvJUHyJe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791313687; x=1822849687;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Qvc+MTySK9lhv1ZK8YpGQ0Dg77ekyeYCQDX3Osgx+3s=;
  b=XvJUHyJeMQrHDUvnDeBnOEM+8iG7uZ6KWnDuWtUem5Z/Gfd0FwCm+2u3
   LAk7cBsYHIO3uy4ZPDCdPHi70+J8LDhcQLsxg4wKPyBiSbnY5eu+LLweO
   PJODN/Ej52MOEaZE7l0ekZHvQUtR5iDvPr0Mlm2NrQgS4NqgCEmetHkLJ
   zqgCLcyRC0iSRqpeKDyVvCzMxtVj/dotn6rF0do328drEbOuwY8TNhhV+
   HKE6Twc0zwd4jivOD1CmdLm6SPDPCuBqjc+gUYIOdcSpVAizXCwU8ObhG
   2MyeL87K3FMswZLO58O9QwghE0i2HdRPXm4PG2TnuCmlDsFxHM9KiUAvm
   A==;
X-CSE-ConnectionGUID: bwcETPIQTBeAIdbhek9Byw==
X-CSE-MsgGUID: Js5lExVWSc67yfi5U3/n0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="71541"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="71541"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 12:08:07 -0700
X-CSE-ConnectionGUID: twKBgsV+T5eU4I2BeRq40g==
X-CSE-MsgGUID: RW/8McfeSBCo4fCs+iG6JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="285151764"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.244.140]) ([10.245.244.140])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 12:08:03 -0700
Message-ID: <5a9d577d-12c3-45dc-ba7d-6a4dd6326673@linux.intel.com>
Date: Tue, 6 Oct 2026 22:07:54 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOetlOWkjTog562U5aSNOiBbUEFUQ0hdIHhoY2k6IHNpZGViYW5k?=
 =?UTF-8?Q?=3A_check_vdev_liveness_before_removing_endpoints_on_unregister?=
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
 Michal Pecio <michal.pecio@gmail.com>
Cc: Selvarasu Ganesan <selvarasu.g@samsung.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cpgs@samsung.com" <cpgs@samsung.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "thiagu.r@samsung.com" <thiagu.r@samsung.com>,
 Niklas Neronin <niklas.neronin@linux.intel.com>
References: <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <360067785.01789039502721.JavaMail.epsvc@epcpadp1new>
 <TYUPR06MB62172308C897F81F7DAFF557D2BF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <750468423.101789103583573.JavaMail.epsvc@epcpadp2new>
 <TYUPR06MB6217F0788C14DD89D237C807D2BE2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <937773018.41789116303608.JavaMail.epsvc@epcpadp1new>
 <191ee5d5-d93d-4fa3-9654-b3735d344118@linux.intel.com>
 <20260912141837.06b2f3cf.michal.pecio@gmail.com>
 <TYUPR06MB62174110FB101AD6B7B069EBD2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20260914110949.38a46596.michal.pecio@gmail.com>
 <TYUPR06MB62170DB4AB23F7A79E8DA466D2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <c6c9890f-46d8-42f1-a7e7-8a5d551fa22c@linux.intel.com>
 <TYUPR06MB621785D1597D55101A3D3767D2BA2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <TYUPR06MB6217188F67BFDD41E4917856D2892@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <TYUPR06MB6217188F67BFDD41E4917856D2892@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/2/26 13:12, 胡连勤 wrote:
> Hi Mathias,
> 
>>> Sounds good, call xhci_sideband_remove_endpoint() for every offloaded endpoint.
>>> If possible then maybe even unregister sideband for this device completely here.
>>>
>>>
>>>> 2. Add a sideband callback in xhci_free_virt_device() for defense
>>>>       in depth.
>>>
>>> Selvarasu Ganesan pointed out that xhci 'core' in fact doesn't include
>>> xhci-sideband.h yet. If possible I'd like to keep it that way.
>>>
>>> Setting xhci->sideband->vdev to NULL, or calling a callback here changes this
>>> and is the first time we then intertwine xhci core with sideband.
>>>
>>> Long term solution is to not reallocate vdev just because we try to disable and
>>> re-enable the slot to recover from a failed address device command.
>>> Usb core doesn't free and reallocate udev during device reset either.
>>>
>>> Niklas just started looking at decoupling vdev allocation and initalization.
>>> Meanwhile we could try a bandaid like:
>>>
>>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
>>> index a9e47e178c28..0b5152a1a301 100644
>>> --- a/drivers/usb/host/xhci.c
>>> +++ b/drivers/usb/host/xhci.c
>>> @@ -4435,11 +4435,15 @@ static int xhci_setup_device(struct usb_hcd *hcd, struct usb_device *udev,
>>>    		dev_warn(&udev->dev, "Device not responding to setup %s.\n", act);
>>>
>>>    		mutex_unlock(&xhci->mutex);
>>> -		ret = xhci_disable_and_free_slot(xhci, udev->slot_id);
>>> -		if (!ret) {
>>> -			if (xhci_alloc_dev(hcd, udev) == 1)
>>> -				xhci_setup_addressable_virt_dev(xhci, udev);
>>> +
>>> +		if (!virt_dev->sideband) {
>>> +			ret = xhci_disable_and_free_slot(xhci, udev->slot_id);
>>> +			if (!ret) {
>>> +				if (xhci_alloc_dev(hcd, udev) == 1)
>>> +					xhci_setup_addressable_virt_dev(xhci, udev);
>>> +			}
>>>    		}
>>> +
>>>    		kfree(command->completion);
>>>    		kfree(command);
>>>    		return -EPROTO;
>>>
>>> Does this work in your case?
>>> Can you see any negative side-effects with this solution like never re-enumerating and
>>> recovering after a failed address device command?
>>>
>>
>> Thanks for the bandaid. Based on my analysis of the crash path, it
>> should work — skipping xhci_disable_and_free_slot() when sideband
>> is set keeps vdev valid, so the subsequent
>> xhci_sideband_unregister() in the disconnect path won't
>> dereference freed memory. The eventual xhci_free_dev() →
>> xhci_free_virt_device() still cleans up correctly since vdev
>> remains intact.
>>
>> I don't see obvious negative side-effects. The slot stays enabled
>> for retries, but xhci_setup_device() handles the re-address case
>> at xhci.c:4391. For truly broken devices, re_enumerate →
>> disconnect still works since vdev is valid.
>>
>> I'll apply your patch and test it with the crash scenario. Will
>> report back with the results.
>>
> Thank you for the bandaid patch. I tested it and confirmed it resolves
> the crash. The use-after-free no longer occurs when sideband is set.
> 
> While discussing this with Wesley Cheng (Qualcomm), he noticed that
> there's another path that could potentially hit the same issue. The
> key difference is how pre_reset() gets invoked:
> 
> - usb_reset_device() calls usb_pre_reset(), which invokes the interface
>    driver's pre_reset() callback. If pre_reset() returns 1, the
>    interface is force-unbound, which triggers the class driver's
>    disconnect handler (e.g., uaudio_disconnect() ->
>    xhci_sideband_unregister()). This unregisters the sideband and
>    releases its references to vdev/out_ctx BEFORE xhci_setup_device()
>    is called. So when COMP_USB_TRANSACTION_ERROR later frees
>    vdev/out_ctx, there are no stale sideband references -- no crash.
> 
> - finish_port_resume() calls usb_reset_and_verify_device(), which does
>    NOT call usb_pre_reset(). The interface remains bound and the
>    sideband is still registered, still holding references to
>    vdev/out_ctx. If xhci_setup_device() then hits
>    COMP_USB_TRANSACTION_ERROR and frees vdev/out_ctx, the subsequent
>    usb_disconnect() -> uaudio_disconnect() ->
>    xhci_sideband_unregister() -> xhci_stop_endpoint_sync() ->
>    xhci_get_ep_ctx() tries to dereference the already-freed out_ctx --
>    crash.
> 
> Wesley suggested an alternative condition that would cover both paths:
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index a9e47e178c28..ff7c29b798fd 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -4435,10 +4435,12 @@ static int xhci_setup_device(struct usb_hcd *hcd, struct usb_device *udev,
>                  dev_warn(&udev->dev, "Device not responding to setup %s.\n", act);
>   
>                  mutex_unlock(&xhci->mutex);
> -               ret = xhci_disable_and_free_slot(xhci, udev->slot_id);
> -               if (!ret) {
> -                       if (xhci_alloc_dev(hcd, udev) == 1)
> -                               xhci_setup_addressable_virt_dev(xhci, udev);
> +               if (!udev->reset_resume && !udev->reset_in_progress) {
> +                       ret = xhci_disable_and_free_slot(xhci, udev->slot_id);
> +                       if (!ret) {
> +                               if (xhci_alloc_dev(hcd, udev) == 1)
> +                                       xhci_setup_addressable_virt_dev(xhci, udev);
> +                       }
>                  }
>                  kfree(command->completion);
>                  kfree(command);
> 
> Instead of checking !virt_dev->sideband, this checks
> !udev->reset_resume && !udev->reset_in_progress, which covers both
> usb_reset_device() and finish_port_resume() paths for all devices.
> 
> Both approaches work in our testing. We'd appreciate your guidance on
> which approach to take as the final fix.

I'd probably still go with !virt_dev->sideband

!udev->reset_resume && !udev->reset_in_progress will prevent recovery of 'address
device' failure of ordinary, non-sideband usb devices that need to be reset at resume.

Thanks
Mathias

