Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE6F346E7A;
	Mon, 14 Sep 2026 13:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393226; cv=none; b=iV7jmJlYJz5UJa2XPNhpsqMNT1jI9Bg+evEvOIns9GkFEr2XOJiLEyEdyRcZFflv82rw7ss+Ovc1WmqXs3e8aG1mPMQ2hwVQ9i2tM4FOuijrO3FcB8eqsHVr95rDz/5S0cihFdgLjUDT29En2tgKSd6qPgwWe7qp8aAIGzKQBXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393226; c=relaxed/simple;
	bh=E+KhKIAMyC05iY0875PAPrHvVHXcbIbEQ3ivoNjQCfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lcckvMzneXIePcyvc1GP9jTrdUXnX5isOxoSaNFEPGEopt1fm0NRaAiD5n1DMBrtQUaDo4HGUGhcWCbBgD1BY+XUIFy1BSeI1Jrda2poCNPSTALyy9pb1SSamZYcp9fsO2g5FqzS4wJkuMG4d8/crec3A44Z5P0PfGpgtZq0/SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TTq7QOm8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TTq7QOm8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789393224; x=1820929224;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=E+KhKIAMyC05iY0875PAPrHvVHXcbIbEQ3ivoNjQCfs=;
  b=TTq7QOm8bsereU0mJV5KCIKOOjInpO7BWWWv8mmZ3f4ovla0S2HWpzmH
   RGa/Itnwq1jEJBFBQV8AerkEPMjMNPhAyVk7Y34083yNvf54DvmntE8rP
   Dw0B8DkAWmCx4uSRpOeJdhjnEETABKKqxSkFc8kRfpcwnKN54niT4JHsK
   EZMyNcx0frsrV6AO3/oNTz3y4BrlF6xoi8mkxDSm782I7haU1sCTozdqL
   jN9ZGRJX/IC9xvxEwohLJBOzAdDhiJWWb3esVMbKlmJrAW1qIB/52wPP3
   sxglXijd9LX+bE0WxSWu0SaRzz4ce0GWXLwsfqSJgd07KrqvTCm0zEP4B
   A==;
X-CSE-ConnectionGUID: khEEoOn0SMSXAlqV/3YbeA==
X-CSE-MsgGUID: +1y4YdnQRJaPVVjVqo3Wzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89785986"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89785986"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 06:40:24 -0700
X-CSE-ConnectionGUID: 2vNB/G2ZQnmYc7Mal76E7Q==
X-CSE-MsgGUID: p6flLJEAQQK1Y41Ti1HSBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="310916764"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.245.60]) ([10.245.245.60])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 06:40:21 -0700
Message-ID: <6e2c9b03-4694-4f6b-8fc0-552c069de65f@linux.intel.com>
Date: Mon, 14 Sep 2026 16:40:18 +0300
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
 "thiagu.r@samsung.com" <thiagu.r@samsung.com>
References: <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <CGME20260910101324epcas5p1faf6f82de85c9468f42f6f9b2f13e99b@epcas5p1.samsung.com>
 <c17e0351-d390-4a40-89c4-51d4be9f0123@linux.intel.com>
 <360067785.01789039502721.JavaMail.epsvc@epcpadp1new>
 <TYUPR06MB62172308C897F81F7DAFF557D2BF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <750468423.101789103583573.JavaMail.epsvc@epcpadp2new>
 <TYUPR06MB6217F0788C14DD89D237C807D2BE2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <937773018.41789116303608.JavaMail.epsvc@epcpadp1new>
 <191ee5d5-d93d-4fa3-9654-b3735d344118@linux.intel.com>
 <20260912141837.06b2f3cf.michal.pecio@gmail.com>
 <TYUPR06MB62174110FB101AD6B7B069EBD2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20260914110949.38a46596.michal.pecio@gmail.com>
 <852003c6-317c-4004-ba2c-d6c4b0bd31e6@linux.intel.com>
 <TYUPR06MB621791B56D232A2219614493D2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <TYUPR06MB621791B56D232A2219614493D2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/14/26 16:00, 胡连勤 wrote:
> Hi Mathias,
> 
>>>
>>> But xhci_discover_or_reset_device() is called: before hub_port_init()
>>> calls problematic hub_enable_device() / hub_address_device() functions,
>>> it calls hub_port_reset(), which calls hcd->driver->reset_device().
>>
>> To me it looks like both drv->pre_reset and xhci_discover_or_reset_device()
>> are called in this path.
>>
> Your code tracing is correct. drv->pre_reset() IS called at
> hub.c:6412 before usb_reset_and_verify_device(), and
> xhci_discover_or_reset_device() IS called via hub_port_reset() →
> hcd->driver->reset_device() inside hub_port_init().
> 
> However, this path is not the actual crash path. I apologize —
> my earlier call chain referencing usb_reset_device() was an
> assumption, not from the actual crash dump.
> 
> 
>> hub_event()
>>     port_event()
>>       usb_reset_device(udev)
>>         if (config) //and for each interface in this config: , for each interface)
>>           if (cintf->dev.driver) {
>>             drv = to_usb_driver(cintf->dev.driver);
>>             if (drv->pre_reset && drv->post_reset)
>>             unbind = (drv->pre_reset)(cintf);
>>
>>
>> Any chance you could trace the whole call path in more details and see exactly which path
>> is staken before the crash.
>>
>> port_event() should only call usb_reset_device() for usb3 devices with link stuck in
>> ss.inactive for longer than ~100ms.  Is this really a usb3 audio device?
>>
> No, it is not. The device is a full-speed Apple EarPods
> (USB 1.1):
> 
>    usb 1-1: new full-speed USB device number 2 using xhci-hcd
>    usb 1-1: Product: EarPods
>    usb 1-1: New USB device found, idVendor=05ac, idProduct=110b
> 
> So the port_event() → usb_reset_device() warm-reset path for
> SS.Inactive does not apply here.
> The actual crash path is through usb_disconnect(), not
> usb_reset_device(). The full sequence from dmesg + crash trace:

Thanks for clarifying, the crash part is now clear.

What is still unclear is the parts before this.
How do we end up in a situation where we are resetting and addressing
a device with sideband still registered.

What codepath ends up calling the futile

hub_port_init()
   ->hub_address_device()

that ends up freeing and reallocating the xhci vdev?

Is there a way (like drv->pre_reset call) among that path to
inform audio driver to unregister sideband?

Thanks
Mathias


