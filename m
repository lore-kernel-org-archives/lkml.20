Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C073A9850;
	Wed, 26 Aug 2026 11:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787744690; cv=none; b=UNXmEDmZWHoyqf9VR9+QcRC7P650zV+WHW58uBjA5PhtsYYPT2sIgDeQV+yDfBxG3yY8rM8xJ82NbEpVYOR02p40sh4xjKUrjkKEn6XGRrfQff8LttTzkebxjrEDuT/BCopz2hMp6+P9ueAKwbhzTtka/lGjrm58iuXdsLJHFsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787744690; c=relaxed/simple;
	bh=dGTaVK9xEjgjJS5Wbxhq68P8aqLa+iZXLVsxgAjvaIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IP5Nz++HMtgdXCdrLQnqkLK/Y/rAlegxUeBeM/weCY5whM4EVrCWYw8Xw+odQl1MYn3YtmL5glFDb6G1gGtYEMzTJDa/iniQeBZt8QTURpdonUI+y1C1sV3eHdNA0TxeYfMYcsU/LrBs61bFAFdnO/ZnRqu0czRqzLb2xQRHVy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NlkBB474; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NlkBB474"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787744688; x=1819280688;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dGTaVK9xEjgjJS5Wbxhq68P8aqLa+iZXLVsxgAjvaIQ=;
  b=NlkBB474qK0Kxp37xVMaANjzNmQWDljG6Dxr/UcwcAS4EUQohB4KdiPM
   g3nyByB0RyUFPTafCKRCK5g9z7i3VjL3LsSVb12fqarFywl2Eh39RfkXK
   Rbm12CKX9hu8NA55Yk2ZCx5gRDLvM/SxDOOADL1cY0YY0Gf1f7EcDKo1N
   WIQK28Kd1s1egXetdavwEZz+cD1Fvm0XqGZVMzcZ9OlPJB0G7X5zV9O0z
   WswMJ7YQMpsOt8DO5RNYP5uLwCkta5OpHwCz2wuRFhtBWcpbmQCKgfzw5
   dmOHNTs5xvgy19XnhVbS3KSa3y7jYh45XlQV0nwIP9j4OvPm5972Mzr8p
   g==;
X-CSE-ConnectionGUID: w3lAKdt9QRuyk4iYKDdX7g==
X-CSE-MsgGUID: L/7ajcrNTYW2GPy8t8nXMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="98895387"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="98895387"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 04:44:47 -0700
X-CSE-ConnectionGUID: 78rG4yjeTB2LDK/USSAn5A==
X-CSE-MsgGUID: wLlXgNdFSvefERgVid47dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="264957615"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.238]) ([10.245.245.238])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 04:44:45 -0700
Message-ID: <05117737-8793-4db9-9815-f617ac085d82@linux.intel.com>
Date: Wed, 26 Aug 2026 14:44:42 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add larger page size support for USB audio offload
 path
To: Michal Pecio <michal.pecio@gmail.com>,
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com>
 <20260825094327.606072e9.michal.pecio@gmail.com>
 <25ebe180-a620-4170-92f7-fda6c55a4129@oss.qualcomm.com>
 <0bf654f3-51c5-4555-8cdd-dc9d25dd9f78@oss.qualcomm.com>
 <20260826122552.5761dea2.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260826122552.5761dea2.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/26 13:25, Michal Pecio wrote:
> On Wed, 26 Aug 2026 00:50:53 -0700, Wesley Cheng wrote:
>> Thanks for this suggestion.  I think it actually makes the overall
>> design a lot better.  So now that the sideband driver has its own
>> segment pool (per sideband instance), we expect that any page
>> allocations done from this pool is technically owned by the audio
>> DSP.  This allows us to still utilize 4k ring segments, while mapping
>> the entire 16k page, so it helps conserve/optimize the memory
>> allocations.  I will do a bit more testing and review before
>> submitting a new revision w/ these changes.
> 
> The part about memory being "owned by the audio DSP" made me wonder
> if it would be helpful to let offload drivers allocate their own memory
> and then just dma_map() it for the xHC. No new rings would be allocated
> for offloaded endpoints when they are enabled, we would point Endpoint
> Context of the xHC to the sideband ring and leave ep->ring as NULL.
> 
> Offload drivers would have full control over memory allocation - size,
> number of segments (it seems that qc-usb-audio only uses one out of two
> allocated by xhci-hcd), alignment, anything else.
> 
> It would become impossible to offload an endpoint which is already
> enabled, but is this an issue for anyone?
> 
> NULL ep->ring will cause oopses/panics when somebody submits URBs to
> offloaded endpoints, but I think it wouldn't be a problem otherwise.
> 
I have similar thoughts.

One idea would be to basically let sideband allocate the entire ring and set
ep->new_ring early. This would tell xhci_endpoint_init() that a ring exists and
a new one should not be allocated.

xhci ring allocation would need some refactoring to create helpers for sideband
to allocate and initialize all the other parts of the ring.

This is something that VTIO (xhci spec section 4.25) would also need.
There an endpoint can be handed over to a secondary DMA ID (second, new PCI BDF),
that the normal xhci driver can be excluded from  with iommu.

VTIO use case is something like trusted VM accessing a secure usb storage device,
preventing regular OS running the xhci driver in another VM from touching it.

The secure VM needs to allocate and map the ring to this secondary PCI BDF

Thanks
Mathias
