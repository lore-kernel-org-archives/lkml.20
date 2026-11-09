Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236281;
	b=jE1OleJsWcyGPPXX04+hkFD+jWYzV3KUAxAR3XnLUSJ+PFs52i8Peg2fIIvujCDGTHc6
	 6Qq7Rma/+5svt5Yb6d32hdiEIa55KIbhN9zWjKSatW6qlhpUyXGuuKU1RQ0GyNZqd+Wx1
	 7+QISCC92agneohV98KPoypbWhvvGxjvicpW5rjFYRsOX1zK6zEl2hbbmcaGrXt3HbbJZ
	 Kt8rQJ11pXWK01ikx4zIQ2ejgNdzIJHFnrxV8DuojeqzIehPGXMKvBCLsYESmoJlcM0Uk
	 Yv+76slZWGvh5sClcVHemnW/OX7e9bgUdZ/KfH/KO55i9mVuekCb8gVqVMFzYsJtFTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236281;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=J8TdwCwvCvl3U1clbUZZxY4YPMA/lxOXSqbPxRrF14s=;
	b=INwJdDsS1u9c0c0fnDXnDBUSTDo/IZdixixoHDEvUXD8sMLEjmot5+7sSeItvb50uBZ4
	 ElyWH/+dsalAF2ijtE10KqrlfFk43NjepeDXtskmIdkOUsvSckedx6zd6d2lAWdOWnauL
	 23jU3u45dAZko+xW1F8b4oFzPExES+AqfewBuXpuydlIeHg5eAkn6uMkoOtfv1uKUhq6V
	 /sVKJl4RwwZYfnH6K7nZ+PRYMAY/KyyEhVTzt+klkCZVfjDdSUJ2Jj7HT/eXPEoWCJXVi
	 u0G7VQndPGDwOlhftKr8xCZ13WAdlyWBy+GO11I9Rx4VkzLPChaqhomlaQaQS/wvrag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="mzG/NRh/";
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534DB606A322;
	Mon,  9 Nov 2026 14:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 534DB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mzG/NRh/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794236281; x=1825772281;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=C1lBcy77mccRVOxE4RAzzfdefczirFWkulLGZZ61VPc=;
  b=mzG/NRh/mibNygOuk9ZLiCmn5zRpff8poCxyPanD8MxWYraR+h2nRBtZ
   He0cd5UnaNTU6aJ2lPtawyADHlI5gYkc+mFC+vfbg94Asd1TPnS9Tw7nH
   Qws665Q41wLEIKcWU6PPChIGm19HWjYs4ojT7yttEO0MoHw1KoKjqydHp
   aqLHNwOqKWMNiVAJMXZLTQ/JGgxJAuPs1MkU5gjmUXNbB/bDpEuhXo0km
   1tg88Rb2avktoLvhSSRGE8sEywzi7maluQboA491W+mefKYqdV808B2BG
   2y137/We1mYJEu+Fa0u+TXt6wtgyhipJ+Uu3V338TqO5TxxkRsq+kdz8k
   g==;
X-CSE-ConnectionGUID: KmMlAAa6SKmTrFZL0ET/qA==
X-CSE-MsgGUID: GXKS3K0uQl2M52DWwG8JEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3047623"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3047623"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 06:58:01 -0800
X-CSE-ConnectionGUID: dUhQzqgORsCXYx8kMI/mbw==
X-CSE-MsgGUID: dnuqgtIYStqr/L1BtvAHdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7753825"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.94]) ([10.245.244.94])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 06:57:59 -0800
Message-ID: <70031d2d-e9c4-4efd-a4f8-9e60e9b66a52@linux.intel.com>
Date: Mon, 9 Nov 2026 16:57:56 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Fix ep0 maxpacket update on enabled slots
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109112846.04bfeb0f.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20261109112846.04bfeb0f.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/9/26 12:28, Michal Pecio wrote:
> A slot in Enabled state has uninitialized output contexts;
> it doesn't need and cannot accept Evaluate Context command.
> Attempting the command only results in a (harmless) warning,
> observed when core uses "old scheme" on a full-speed device:
> 
>    WARN: invalid context state for evaluate context command.
> 
> This problem doesn't seem to have existed before ep0 update
> was moved from urb_enqueue() to endpoint_reset(). USB core
> doesn't use URBs before enable_device() or address_device(),
> but it may call endpoint_reset() on ep0.
> 
> A more serious bug has been identified by Sashiko review bot.
> Transaction Error of Address Device may cause the slot to be
> reallocated and left in Enabled state, but the input context
> is (needlessly) regenerated before actually being needed by
> the next Address Device. xhci_check_ep0_maxpacket() corrupts
> this context by copying uninitialized ep0 output context.
> 
> This matters when core resets a device and doesn't reallocate
> udev after address_device() errors. Some HCs reject the next
> Address Device with Parameter Error, some break. ASMedia HCs
> write a Setup Stage TRB to the event ring and stop working:
> 
>    ERROR unknown event type 2
>    INFO: task usbreset:4071 blocked for more than 122 seconds.
> 
> This exact case is a relatively recent regression, but even
> if xhci_setup_device() didn't regenerate the input context
> on Transaction Error, next iteration could regenerate it and
> keep it there when command timeout leaves the slot Enabled.
> 
> We can kill both bugs with one stone by checking slot state.
> If it's Enabled, do nothing and let next xhci_setup_device()
> configure ep0 later. It will actually ignore the packet size
> requested by core, but its defaults match core expectations
> at the time of address_device() and enable_device() calls.
> 
> Fixes: e34900f46cd6 ("xhci: Reconfigure endpoint 0 max packet size only during endpoint reset")
> Fixes: af8e119f52e9 ("xhci: Fix Panther point NULL pointer deref at full-speed re-enumeration")
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>

Added to queue

Thanks
Mathias
