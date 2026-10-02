Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8BC443C03;
	Fri,  2 Oct 2026 10:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790937440; cv=none; b=INWmYr8SKV+Ym+ELNu0+Fj705a7npqhYmx00JrjvIC5R91BDlCEGMjw3jhrQkdKfDTa/WHD0X9TjPrzZi+EKozmwmqOvskJ6Vcw24if7GOqyQwKwTEfbUYJxmoqVhcTHO6w2iu+yDfuHlzVvpYARepTrtGXJzX8nKJJLq3G9Z6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790937440; c=relaxed/simple;
	bh=jH0zJKhJDpGeUx0aj/4GWlL2wulR23VoVr1DzwHc7JM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cIF3YLq9ioa1fqdQyQ84BjO/PjLfEKWXpqHqcmzQTFn7rhny6hRbJQUa1VFBSkivht15AJy3ZKJXBDjBfw7+9SN7On485gX/dJHeF/7iiRU3Ql/7MDgw4DAhFdmxYXOj3OlXjpkavbp4Qs7ThrluoUuH1fhUvjJOuyXwoA9uCCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=etbYxNpd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etbYxNpd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790937439; x=1822473439;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jH0zJKhJDpGeUx0aj/4GWlL2wulR23VoVr1DzwHc7JM=;
  b=etbYxNpd9gAlfMAa3fZKDkkW5Cf6lFNy3iMIeqyR/g93x/9HhIfgubuQ
   9UwxtV4jkfb/93KJ+boswdwZWBFPoB6jS2bRlFoTIaRmutYsQStc0ovh9
   HN2piWljFOoKsH2Ev1gEpKh2YLPleYR7qW2U4VuT7pS6NjNiWeoosXZ3z
   vXH5kmG4q3B76MjMwsz/Elw8nptXKU0HPO+VQFTKbVm2Hm5lRF8SIlJsl
   tFjRtoZgBWzb+EoKqrjIL+BPeg+csmfQRATBhiND1YEQRoAbOZg9xUP8r
   tznsV0wDPP0VvAx/0b7bUwqCRLm+fDoNQqcrMWn3LGZLpyC/Yl4t2N55w
   Q==;
X-CSE-ConnectionGUID: RaQPauXVTiuJ17DHS2KW6Q==
X-CSE-MsgGUID: tt2zw4uQRCeM3oisuurbxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90603503"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90603503"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 03:37:18 -0700
X-CSE-ConnectionGUID: 7YpK8SfsQG2N7oeJE1U7vQ==
X-CSE-MsgGUID: bHgGHFg4S1eZMgZU164BVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="284286585"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.235]) ([10.245.244.235])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 03:37:15 -0700
Message-ID: <8707533e-8cbc-4046-92af-90b55031383d@linux.intel.com>
Date: Fri, 2 Oct 2026 13:37:13 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Unlock for command abort polling
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pedro Fonseca <pedro@fonseca.com.pt>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260824095944.1c8335fa.michal.pecio@gmail.com>
 <20261002113302.3fe23d24.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20261002113302.3fe23d24.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/26 12:33, Michal Pecio wrote:
> On Mon, 24 Aug 2026 09:59:44 +0200, Michal Pecio wrote:
>> xhci_abort_cmd_ring() requests abort, waits for the CRR bit to clear,
>> drops xhci->lock and waits for the Command Ring Stopped event.
>>
>> The CRR wait timeout is 5 seconds as suggested by xHCI 4.6.1.2, which
>> means that if the xHC fails to complete the operation at all, we poll
>> with the lock held and IRQs disabled for several seconds. If any other
>> CPU tries to acquire the lock, it will spin likewise. IRQs get delays,
>> drivers log errors, tasks freeze, it's a mess.
>>
>> So drop the lock earlier, before waiting for the CRR bit. It should be
>> safe - the sole caller sets cmd_ring_state to CMD_RING_STATE_ABORTED
>> before calling us, which will prevent others from ringing the command
>> doorbell and interfering with the abort. Queuing new commands during
>> this time poses no danger, and if the command we try to abort actually
>> completes concurrently, existing code already needs to deal with this.
>> And in my testing it does - it's trivial to trigger this on ASM1042,
>> where Address Device can't be aborted, but it completes as soon as the
>> offending device is unplugged, including during abort attempt.
>>
>> Note that the lock still covers reinit_completion(), so it won't race
>> with complete() being called by the event handler. And works are not
>> reentrant, so another timeout can't expire while the lock is dropped.
>> We will configure timeout anew when restarting the ring.
>>
>> One other difference is that now we also drop the lock if abort fails.
>> This too should be harmless. Commands queued during this time will be
>> released like any other pending commands. If the aborted command does
>> complete before we regain the lock, it's a waste, but not regression.
>>
>> Reported-by: Pedro Fonseca <pedro@fonseca.com.pt>
>> Link: https://lore.kernel.org/linux-usb/16f65081-5a3c-4c30-9811-9017796a3373@fonseca.com.pt/
>> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
>> ---
>>
>> This has been annoying me and various others for years, only the latest
>> incident is listed above.
>>
>> I expected a nightmare of race conditions, but after finally taking a
>> serious look I think it really is quite simple. It helps that the lock
>> was already being dropped and existing code seems to handle it fine.
> 
> Hi Mathias,
> 
> Any thoughts about this one? Seems we haven't got any response from
> Pedro, but the patch worked for me (and it solves an annoying bug).

Just added this and a couple of others of your patches for my for-usb-next branch

Thanks
Mathias
