Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F034ABBAA;
	Mon, 12 Oct 2026 16:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822176; cv=none; b=hF2PUvFT3GJ+FuSYTB3pMryabPP/KX05CSnVljQdAe3UOTUgGSnwOcn6QaUwCkdQga6NK21ykrd5yK+SwepEsjFMiLIn5DkWy9UR9gQQ93kW/l4PHHEJLMGGPmu/JeYkp+8JZ2TYMj+9f/HH6sgVHc39sHOgFXbTGYvO0ekyQEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822176; c=relaxed/simple;
	bh=a+GdRKCJNUdk1Pm5s1s/ddLTDk26UmJyJju2Bv9BQU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tin3HNs0yUIBzdSqEcS0KsNULwjK0Rh2bVIVMACLxN8/DSD5uvNq0LSCc7ECxmsfEjNQH6bF/BOn8XRB6wUDKC39EC3BkIkHNSYtwkKd7I8NOj2w8V1CVh4yDPzOGDlnd4weO56mX57sW5Y56nCtxDCeAQ/ESkOdgpRY+UtzBH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jDEMf/lo; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jDEMf/lo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791822174; x=1823358174;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=a+GdRKCJNUdk1Pm5s1s/ddLTDk26UmJyJju2Bv9BQU0=;
  b=jDEMf/loTDMxmtbNppH8o8UkauTm8gcfEvxuRjJULZvPT65ZYlAsS1Hf
   ZcqNxmTareFYl9999HGLFruJ2F8/VaEvWirebA7AJKRVnOqD56dYJHFeD
   LyqeSTuz6kTiGtodIVNzVUPMOM1scS6LxHaE7JIJDo3V1aMBmd2hdJEVJ
   hMUWGEISnBM5as9q77SspxAt1nkvvLHAwN05+k0lj4kRkGslJoJ9Ea4Q2
   D8qTXaaqipjv5PwUso4P1LfYoiQbUx0ul5EIURLDlXUQuNR0PbffIQ53J
   pPIKtfaMhPxIbccKCotZG03WEnNyuFLNZxELqwmc0Zm3xGXBfoRix1DvU
   Q==;
X-CSE-ConnectionGUID: suFfMHHMReqnVL19b4Wq/g==
X-CSE-MsgGUID: 07iKQYD3RXWnxjckNlkSZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="431902"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="431902"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 09:22:52 -0700
X-CSE-ConnectionGUID: i5bXEqmsQEaEVLaNwZ5F/A==
X-CSE-MsgGUID: D6tVc3BrRpipFAkGovPPSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="873469"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.244.193]) ([10.245.244.193])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 09:22:49 -0700
Message-ID: <330c34fd-1d1c-44e8-b949-ad2f5fb51f00@linux.intel.com>
Date: Mon, 12 Oct 2026 19:22:47 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xhci: give back halted TD when skipping endpoint reset
 after disconnect
To: Michal Pecio <michal.pecio@gmail.com>, Yiyu Zhou <yiyu@yiyuzhou.io>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261010064407.11030-1-yiyu@yiyuzhou.io>
 <20261012104122.0af52938.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20261012104122.0af52938.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/26 11:41, Michal Pecio wrote:
> On Fri,  9 Oct 2026 23:42:19 -0700, Yiyu Zhou wrote:
>> Commit 042aad8d0db6 ("xhci: prevent endpoint recovery after roothub
>> disconnect") makes xhci_handle_halted_endpoint() return early when the
>> root port is disconnected, and commit 7e0ef4332ed9 ("xhci: avoid xHC
>> endpoint changes after disconnect or link error.") also sets
>> EP_DROP_PENDING there, which keeps the doorbell from being rung until
>> the device is reset.
>>
>> The callers rely on xhci_handle_halted_endpoint() to take over the
>> halted TD.  For example, finish_td() returns right after calling it,
>> expecting the TD to be given back once the Reset Endpoint command
>> completes.  With the early return, nobody gives the TD back.  Its URB
>> stays pending until the submitter times out and unlinks it.  Every URB
>> queued on the endpoint afterwards never starts, because the doorbell
>> is blocked, and also has to time out.
> 
> Before 7.3 there was a similar device flag VDEV_PORT_ERROR which stuck
> until the device is reset or deleted. It only applied to USB3 devices.
> URBs were left hanging, but nobody cared, because disconnect() handler
> of the class driver would unlink them.
>   
>> Devices that disconnect and reconnect themselves during enumeration hit
>> this.  A PFU HHKB Professional HYBRID Type-S keyboard (04fe:0021) drops
>> off the bus about 300 ms after its first enumeration, while usbhid is
>> still probing its third interface.  The probe runs in hub_wq, so the
>> disconnect is not handled until the probe returns.
> 
> But probe breaks this scheme, it seems we do have no choice but to stop
> being lazy and give back the URB right there.
> 
> Regression occurred when the mechanism has been generalized to USB2 by
> also looking at the PORTSC.CCS bit, even though the problems it tries
> to solve have been unique to USB3 so far.
> 
> But this change seems sensible, because a USB3 port may autonomously
> exit the Error state to Disconnected on receiver termination loss, see
> xHCI 4.19.1.2.6, and PLS changes to RxDetect. It may even reach Enabled
> before software intervention; seems we should look at PORTSC.CSC too.
> 
> (On a USB2 port, like this keyboard uses, such race doesn't exist).
> 
> And since xhci_irq() clears these per-port flags when USB3 link comes
> back, there is no guarantee that the permanent EP_DROP_PENDING state
> will be latched on the lost device. Whether the HW bugs caused by link
> loss will still be happening on the "new" link is unclear; I only know
> about Renesas: it doesn't mind and actually recovers on reconnection.
> But the device is reset, which may or may not catch some xHC off guard.
> 
> Not sure if going back to a sticky per-device bit wouldn't be better.
> One downside is that we need to flag all affected devices, which means
> a loop in IRQ. Not great, but there is never more than 255 devices, so
> maybe a few microseconds at worst. Likely not enough latency to break
> anything, and it saves some repetitive checks in other places.
> 
> I could cook up a patch like that, I think it would make things easier,
> as there is no need for those very similar checks in urb_enqueue() for
> example, as seen below. But let's see what Mathias thinks.
> 

The solution in this patch seems reasonable to me.
It's simple enough and should solve this, and similar cases.

We should probably give back all TDs of the halted endpoint,
not just the one we halted on.

Agree with the minor changes you suggested to this patch.

-Mathias


