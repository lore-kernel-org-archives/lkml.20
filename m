Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D7045C6FD;
	Mon, 14 Sep 2026 12:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388822; cv=none; b=B37n8cBmM0piROKSB42ZAsgUnQ8FiQDJtaWV/IvLf/AJc+ASacfwLMoL/C5qjODWCkGxyTDvxxaNlbfKlpYMW6yuvwyhTBwopB9kgVnqghtsiUHmge+r4mLEagF46jHMk2hZWt6oVcdS2jDo3Ii/5m0nZgoLyYiP4UIML2I57Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388822; c=relaxed/simple;
	bh=v95ZmSPumV8ibyUBT0j9UCF+T9DTnRVBKW2JB3IbtqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZhC2IzMTOLRF8ImLvquL9Mo3Fvu+vsL3i9UvndJmIFTLZvQF3P1JLmZcvBqxNwF21jbLIGRGmpCIpDJ0cjROFqMnm9Ptt3QNUuomlT5oRCYH+ctFDz3v+IzvKE2ii6fvyznGUUbwtRSs6UzqJSirCKwRAiblWFWJCu+hWjQVgnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M3a09khj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M3a09khj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789388820; x=1820924820;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=v95ZmSPumV8ibyUBT0j9UCF+T9DTnRVBKW2JB3IbtqQ=;
  b=M3a09khj2JiOvtsk7/+s74S6VQCBU1ad+Hk58Lhn+2MMIgwFOwyrrvbH
   bg3fR8k/qWaM9EE6mN2/7MEUBAEVuh+J71L8ycg3q/xd8kegvaonGIrkh
   ycdHqZ7Ttbbmlcd0MQzsJ1bqby1lYUoPqHFXG8zTLriZez0kTZyVqLBu4
   oTy1ruymTy4XsMr6xIB3/QPXmMRqRhQwafzUctuAeTAHws1ukSQccDmlY
   O9Jk03wzu2jxFLeFjVCNfagyU3gZ6mam/wX1q4WtNP2bwSIfNn4DE8AgT
   r0dVqxqlc9Lq33cUw0KmKv3i8yKJBfALgDKfWBnCuD/7gqx6LpaHXVKpu
   Q==;
X-CSE-ConnectionGUID: G6/AjCM+QsmBJPrXZdVUdg==
X-CSE-MsgGUID: r5CIG05hQEOGRP6sj53DWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="100399737"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="100399737"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 05:26:59 -0700
X-CSE-ConnectionGUID: 7bTCkECrQAigMLQe4BdiQg==
X-CSE-MsgGUID: Mgpae/WrTn6LlCkj1GzK1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="296122000"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.245.60]) ([10.245.245.60])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 05:26:57 -0700
Message-ID: <852003c6-317c-4004-ba2c-d6c4b0bd31e6@linux.intel.com>
Date: Mon, 14 Sep 2026 15:26:34 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xhci: sideband: check vdev liveness before removing
 endpoints on unregister
To: Michal Pecio <michal.pecio@gmail.com>, =?UTF-8?B?6IOh6L+e5Yuk?=
 <hulianqin@vivo.com>
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
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260914110949.38a46596.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/14/26 12:09, Michal Pecio wrote:
> On Mon, 14 Sep 2026 07:04:17 +0000, 胡连勤 wrote:
>>> It doesn't cover hub_port_reset() called by port_event() for
>>> SuperSpeed devices, not sure what that is and whether it's
>>> dangerous. I noted that the original patch talks about hub_event(),
>>> but maybe it's a mistake?
>>
>> Thanks for the analysis. A clarification on the hub_event() reference
>> in my patch:
>>
>> The crash trace shows hub_event() at the top because that's the actual
>> crash call stack from the failing device. The full sequence is:
>>
>>    hub_event()
>>      -> port_event()                           [hub.c:5966]
>>         -> usb_reset_device(udev)              [hub.c:5875]
>>            -> usb_reset_and_verify_device()    [hub.c:6183]
>>               -> hub_port_init()               [hub.c:6228]
>>                  -> hcd->driver->address_device()  [hub.c:4781]
>>                     -> xhci_setup_device()     <-- COMP_USB_TRANSACTION_ERROR
>>                        -> xhci_disable_and_free_slot()  [xhci.c:4438]
>>                           -> xhci_free_virt_device()   <-- frees vdev here
> 
> So not a mistake and this is indeed a dangerous case. And AFAICT, in
> this path udev's pre_reset() routine isn't called and therefore can't
> be used to fix your issue, unless USB core is patched to call it.
> 
> But xhci_discover_or_reset_device() is called: before hub_port_init()
> calls problematic hub_enable_device() / hub_address_device() functions,
> it calls hub_port_reset(), which calls hcd->driver->reset_device().

To me it looks like both drv->pre_reset and xhci_discover_or_reset_device()
are called in this path.

hub_event()
   port_event()
     usb_reset_device(udev)
       if (config) //and for each interface in this config: , for each interface)
         if (cintf->dev.driver) {
           drv = to_usb_driver(cintf->dev.driver);
           if (drv->pre_reset && drv->post_reset)
           unbind = (drv->pre_reset)(cintf);


Any chance you could trace the whole call path in more details and see exactly which path
is staken before the crash.

port_event() should only call usb_reset_device() for usb3 devices with link stuck in
ss.inactive for longer than ~100ms.  Is this really a usb3 audio device?

Thanks
Mathias
