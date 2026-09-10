Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF48391846;
	Thu, 10 Sep 2026 09:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032855; cv=none; b=hMCogrjlFH7tWngzCIRMYO2ZL6kuY44rMmvYL62wVeeBUtAocy7rNIiGM/m8LZRwW9h2TDulKoGxN9GjWE99jhxxA7l3tTIAVaX66IZcec67yMyoqd/RmaD5KjvTVmTZIIM3knrsKIINY51pDNMXsmXGawIUF7rNCV+fRYNCZII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032855; c=relaxed/simple;
	bh=KWIqtCsgFy3CMIbB0nDeszb6lj7Mdoybp0t1DOWIgg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=swJwBRW3G4ME64P2ar6lF8xYJRPFf03coAv8fayqhvSymRxaKHSCXjqLZjGcwMwJLz4P0rqY0Xix3IQ/mT7nquzOp+mIAHCZSh6iK5b183HzawNIUTLWTiRG1esvTzgIQmBNhOxZMjr6TD98WKTNu9qFwWycNdB1BHhseb3Qb3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AzNN1uQk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AzNN1uQk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789032853; x=1820568853;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KWIqtCsgFy3CMIbB0nDeszb6lj7Mdoybp0t1DOWIgg8=;
  b=AzNN1uQklffATvvr638Mv0kgeCD6WUJs+8Tb3c0ied/6hiU7igifIfRo
   HtHUY/yNhw91WzRAjPAugQxhQYrhw/eX95YEC/6RUCNi/11kOoV6DURwg
   0nKq4K/QK+C6hPAkatg3hZTezIhB9BiFNeY2I0J1TgyH1dYtVi8Ugo5s6
   ZtaCVBUMptoOENSFi/KKizcdy1eYIg6tIRzxIt3hiTOMy6ELHzX8my0F3
   NPo5W+kLhYBEcEAxr/aZTg21PODX3d8Tig9OCOgZwJXx45TXV4Radlt+K
   kOUl26gzriamJWhwpK16ZDpGnq9GFCkaiKIWT0VbKqU+y22q9mxh+BByL
   A==;
X-CSE-ConnectionGUID: 0J+nBdFQSmSEHKa+Y1SSyg==
X-CSE-MsgGUID: d4JZyBhfRwKTtkc7wX1qSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89601511"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89601511"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 02:34:12 -0700
X-CSE-ConnectionGUID: I3CdQm0pTVyez/256/13dA==
X-CSE-MsgGUID: hRs1CcGuSgSNJSyivTGacg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="268308887"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.245.216]) ([10.245.245.216])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 02:34:10 -0700
Message-ID: <c17e0351-d390-4a40-89c4-51d4be9f0123@linux.intel.com>
Date: Thu, 10 Sep 2026 12:34:07 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xhci: sideband: check vdev liveness before removing
 endpoints on unregister
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
 "broonie@kernel.org" <broonie@kernel.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/7/26 15:24, 胡连勤 wrote:
> xhci_sideband_unregister() assumes the virtual device (vdev) is still
> alive when iterating sideband endpoints and issuing stop endpoint
> commands. However, xhci_disable_and_free_slot() may have already freed
> vdev and its out_ctx before xhci_sideband_unregister() is invoked.
> 
> This happens when xhci_setup_device() gets COMP_USB_TRANSACTION_ERROR
> (e.g. device not responding to setup address during bus reset recovery),
> causing vdev to be freed before xhci_sideband_unregister() is called:
> 
>    hub_event()
>      xhci_setup_device()                  <-- COMP_USB_TRANSACTION_ERROR
>      xhci_disable_and_free_slot()
>        xhci_free_virt_device()
>          kfree(out_ctx), kfree(vdev)
>          xhci->devs[slot_id] = NULL
>      ...
>      usb_disconnect()
>        uaudio_disconnect()
>          xhci_sideband_unregister()
>            xhci_stop_endpoint_sync()
>              xhci_get_ep_ctx()            <-- CRASH (deref freed out_ctx)
> 
> Unable to handle kernel paging request at virtual address dead000000000122
> Call trace:
>   xhci_get_ep_ctx+0x0/0x38
>   xhci_sideband_unregister+0x68/0xf0
>   uaudio_disconnect+0x70/0x144
>   usb_audio_disconnect+0x7c/0x268
>   usb_unbind_interface+0x13c/0x340
>   device_release_driver_internal+0x1c4/0x2bc
>   device_release_driver+0x18/0x28
>   bus_remove_device+0x158/0x170
>   device_del+0x1c8/0x320
>   usb_disable_device+0x84/0x190
>   usb_disconnect+0xe8/0x338
>   hub_event+0xbd8/0x19ac
>   process_scheduled_works+0x200/0x9d8
>   worker_thread+0x154/0x3b0
>   kthread+0x11c/0x1a0
> 
> Fix this by caching the slot_id in the sideband structure at
> registration time, then checking under xhci->lock whether
> xhci->devs[slot_id] still matches sb->vdev before issuing stop
> endpoint commands. If vdev has been freed, skip endpoint cleanup
> entirely - the xHCI has already disabled the slot.
> The interrupter is still removed as it does not depend on vdev.
> 
> The slot_id is cached in sb->slot_id rather than read from vdev at
> unregister time because vdev may already be freed, making
> sb->vdev->slot_id a dangling dereference.
> 
> Fixes: de66754e9f80 ("xhci: sideband: add initial api to register a secondary interrupter entity")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>

Thanks, nice catch and layout of the problem.

I think we need to address this issue a lot earlier than in xhci_sideband_unregister()

xhci_free_virt_device() shouldn't leave any dangling pointers, if vdev->sideband
is still set at this point then something is wrong, and should as a final resort be
fixed here. Print a debug message and set  vdev->sideband->vdev = NULL before freeing vdev.

Another issue is the transaction error recovery during address device.
xHCI specs say we should disable and re-enable the slot.
xhci driver additionally frees and reallocates the vdev.
We could probably avoid this and just re-initialize the contexts without
reallocating vdev.  This being said I think it would be even better to not
try to 'usb persist' sideband over a usb device reset.

Might be best to unregister sideband in qualcomm usb audio driver completely in
the drv->pre_reset, and re-register it back in drv->post_reset

But to avoid this specific issue we should also set vdev->sideband->vdev to NULL
in xhci_free_virt_device()

Thanks
Mathias
