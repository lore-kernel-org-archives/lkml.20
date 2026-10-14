Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F6154145D;
	Wed, 14 Oct 2026 14:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987984; cv=none; b=bndssp+TSznOurXRgcGsGOuLIRNCg21khMuKq1+EiiZ/yFX9Vo4n9y1M/7sw/5hYkBqPn9U3+LFFuVAxe2S9UOT2NF4aXa5oOkzVySmA2zzqVF2EXdW/u6Cf7GYUL2LXzAmJ0efRjq5P6kUSzT3UPC2q9321n8OK2arkpYEIPpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987984; c=relaxed/simple;
	bh=CMit829FdlsuZxyCandGgteUJYJNOWEowwLmB/nPbGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+Px07HnDZp/twFjrqTVJ5Zx0TtY7/E5lcc36s4L4GQmUoNTiSdDSHuSCtjnZiAkq4hP7+ONzhwgjBgapHvNvMgAv2dGbKoUHDxOkieLU1rKqHkx7ZpbLv3qjm1+uQOQ9C6WmBYElmEYYacg/fDhFEhPVzYwgGA0gW9xas9bFLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XmLz8zJ6; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XmLz8zJ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791987983; x=1823523983;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CMit829FdlsuZxyCandGgteUJYJNOWEowwLmB/nPbGo=;
  b=XmLz8zJ6IFS5q7wyofYoloiJSuv0HCBW0EGLysnV3b5Hx9pTVlAr8beX
   0A644AIg9Wx/FvbL3XumLRANr9cyRdhb+GXW4T6v3u7jU4VEn4Cv9P6Mm
   qAsOVq4pUgwBHiZYlHQ/e1ZxxqQKWjeh5iBg7JE2Cz8WGrgEzIIzZx6X2
   Ia2haHtdiPdaDv1PoZPIJfMlE0saV6C97hfRWEXoYsOBLEBEBxHfS9Ilm
   IzzWzt4dqDlOLur9c756OauWS6Q5OfsJ9ZqphXH5DZk+yoqY5bZf0+8c9
   nnACUc3nCejr4IxhtB0n++RNM6hYgJ4pUVw6pL8Ltby048jX2alczVhQT
   g==;
X-CSE-ConnectionGUID: Ixz4CaaZRSuZSMawJJ9VfA==
X-CSE-MsgGUID: Dmz1e17hSzmet+g8qyKxeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="722893"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="722893"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 07:26:22 -0700
X-CSE-ConnectionGUID: WxRB+wAGSUitgg/qdY4mGw==
X-CSE-MsgGUID: 7tFm1eICRyituzDcAdSZuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1807186"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.225]) ([10.245.245.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 07:26:20 -0700
Message-ID: <73096f91-146a-4754-a685-f3b22f1ac3d5@linux.intel.com>
Date: Wed, 14 Oct 2026 17:26:12 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] usb: xhci: sideband: allocate sideband ring
 segments from a dedicated pool
To: Michal Pecio <michal.pecio@gmail.com>,
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
 <20260909-16k_offload_v1_b4-v4-3-f24a86617597@oss.qualcomm.com>
 <68b34f04-f7e2-4468-8a18-ac97decb987d@linux.intel.com>
 <82e0b9c7-3b3f-4dce-a72e-64989b08ef98@oss.qualcomm.com>
 <20261013111110.423dd0ff.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20261013111110.423dd0ff.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 12:11, Michal Pecio wrote:
> On Mon, 12 Oct 2026 18:01:50 -0700, Wesley Cheng wrote:
>> On 10/5/2026 4:03 AM, Mathias Nyman wrote:
>>> xhci is the one allocating the ring when adding an endpoint, and
>>> telling xHC hardware to write to that ring. It seems more
>>> approriate that xhci should be the one freeing the ring after it
>>> told xHC hardware to drop the endpoint, and there no longer is a
>>> risk on hardware accessing it.
>>
>> Hi Mathias,
>>
>> Sorry for the late response.  Was out last week.
>>
>> Specifically in the disconnect path (while audio offload is active),
>> when we utilize the usb_set_interface() path, it'll return early due
>> to the iface->unregistering check.  This would lead to the
>> drop_endpoint not to be called, and rely on the xhci_free_dev() to
>> handle the transfer ring cleanup.  This wouldn't work in the offload
>> situation, because qc_audio_offload is the only entity managing the
>> DMA pool, and that would be freed during the .disconnect callback,
>> which happens BEFORE xhci_free_dev().

You are right, audio class driver .disconnect is called, driver unbound
and interface device gone before xhci_free_dev() is called.

If sideband is unregistered as part of .disconnect callback it also means
ring/pool would be destroyed before xHC has dropped the endpoint/disabled
the slot. Would be better to free the ring after we know xHC controller
won't access it.

>>
>> Would you be more inclined to prefer a solution where we can defer
>> the DMA pool free'ing to the xHCI core during xhci_free_dev, or maybe
>> adding another sideband notifier (sb->notify_client) enum to tell the
>> client driver that it can release the pool?

sb->notify_client callback has the risk that this sideband entity is
unregistered and gone by the time we want to call it

Deferring freeing the DMA poolby some kind of reference counting again adds
complexity, and maybe not a suitable solution for this issue.
(taking a reference at sideband register and every dma_pool_zalloc(), putting
when freeing or sideband unregister, finally freeing pool when reaching zero.)

I'm trying to figure out a simpler solution.

How about skipping dma pools completely for endpoints in these cases?
(page size over 4k with offloaded endpoints)

Instead of sideband client creating a custom dma pool it could just set a
'no dma pool' flag for the endpoint. xhci driver would allocate the
ring segments using dma_alloc_coherent() instead of dma_pool_zalloc() for
these, possibly even allocate a full page for each segment?
Freeing would be done similarly.

Would this be a viable simple solution?

> 
> I'm not Mathias but my opinion is the same as always: none of these
> problems would exist if the sideband client allocated and freed all
> transfer/event ring memory, and xhci-sideband only owned a mapping.
> 
> The mapping would be freed by xhci_sideband_unregister() or similar
> calls, which should ensure that the xHC stops using the rings, and
> memory would only be freed by the client driver after unregistering
> the sideband and stopping the coprocessor. Nothing is ever UAF or
> leaked, and ensuring this is *easy*. And if xhci-hcd randomly wants
> to get rid of some endpoint, it simply stops using the mapping and
> lets the sideband client clean it up two milliseconds later.
> 
> One thing I'm not entirely sure about is how we could create this
> mapping. Using bare iommu_map() creates a hard dependency on IOMMU.
> Documentation/core-api/dma-attributes.rst mentions possibility of
> using generic dma_map_() helpers on multiple devices, so maybe this
> can work, but I haven't seen existing examples of such use.
> 
Could be an option, but maybe not for this specific issue.
It's a larger, complex change without any real need (yet).

I'm hoping vendors would move away from this sideband implementation
instead of evolving it, adapting the 'xHCI Audio Sideband Capability'
defined in xHCI  specification section 7.9 instead.

Thanks
Mathias

