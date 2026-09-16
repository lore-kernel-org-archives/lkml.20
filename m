Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522C936A02F;
	Wed, 16 Sep 2026 12:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561129; cv=none; b=oa3ciDX/+a3//WuZR5ojWNPAVpvPdn2NJXupEJvzYsM0gB3adVQvOq2Vfsoa1ua4CdB2+3mzu2wHH7XmMSfMDXffI6BsnfH8Ca7X7jZ4ZQbQ4UyUVOcO57cuCrneMA2S9RMQPzTtKtodIeWoi0aB1NXd3vfTeKHkrF0AjIfB3QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561129; c=relaxed/simple;
	bh=GVmLFp3Ttr2aE+td+7HkXye1bMoaXdrGS05HZLNidMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aXWgByqRrxRvLr/uEgl/a2U6UqHXqe0u91+Vlbw0lBlMp+AcotkY5d5vtBYIDrZ0BeZdvrga6SQ09OV5mG+Eb07s6+hE2nIXxzR7kGCoxqsUOS6JHDeARf3hHjNFD1fhuUYerVyWjsO8ib7d+I/xUZCizkhiexVswMU4ZeJp0m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UIJly/VP; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UIJly/VP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789561127; x=1821097127;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GVmLFp3Ttr2aE+td+7HkXye1bMoaXdrGS05HZLNidMg=;
  b=UIJly/VPe1Tt980zKSdMagNKxv1TCBN3fuxOESRDTltY69hRwCPzJ1rD
   DS94p76rUGv7tSfB4PXYMEYQH4LdPsyPj0nSTx+mKFOeRS/5WzFPSQG+J
   PbRqnBDWzil77zRssjWPp3O9ZDBVA77t+evYEwktKAQEh1IIlKI5UsuDF
   n58JuwQ9ruZ/sXejcHhiThxGzHLLtZfofkr6+q0TtKLbiDDrD2Ub3MbNX
   CQFpSHbN/xlK8AP29NkD9C5zL/751uE9wMYBzrS4uQGOWlXL9N8c/18E1
   ETDBE9LElU1BYgPjyMskFB2Ed6JTf2uzaTLO1SlfG7/BxzTBpQ3oBdalE
   A==;
X-CSE-ConnectionGUID: xqg5uFyFTnmY05Oe8t3upg==
X-CSE-MsgGUID: XJLQpTbnSyuSEWL9GI80Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100601110"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100601110"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:18:46 -0700
X-CSE-ConnectionGUID: C3ME8GskQJSKQCAIPw1Ggg==
X-CSE-MsgGUID: r+YdQcQjQSiIiUWRY5t5Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270041403"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.188]) ([10.245.244.188])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:18:44 -0700
Message-ID: <0e4c85e8-77e6-4eb9-aca1-048199f2f0e0@linux.intel.com>
Date: Wed, 16 Sep 2026 15:18:42 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xhci: Fix HIK camera control timeout on Etron hosts
To: Kuangyi Chiang <ki.chiang65@gmail.com>,
 Michal Pecio <michal.pecio@gmail.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260914013033.3938-1-ki.chiang65@gmail.com>
 <20260914130907.749cd8e7.michal.pecio@gmail.com>
 <CAHN5xi0NSJO=V0=eVd4_MGp2Lg5NrwB3D+hsF87ehTSmaeeSbQ@mail.gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CAHN5xi0NSJO=V0=eVd4_MGp2Lg5NrwB3D+hsF87ehTSmaeeSbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/16/26 04:33, Kuangyi Chiang wrote:
> Hi,
> 
> Thanks for the review.
> 
> Michal Pecio <michal.pecio@gmail.com> 於 2026年9月14日週一 下午7:09寫道：
>>
>> On Mon, 14 Sep 2026 09:30:33 +0800, Kuangyi Chiang wrote:
>>> Control transfers to the HIK 1080P Camera (2bdf:0280) can time out when
>>> the device is connected through an Etron xHCI host:
>>>
>>> [   48.363671] uvcvideo: Found UVC 1.00 device HIK 1080P Camera (2bdf:0280)
>>> [   53.465662] uvcvideo: Failed to set UVC probe control : -110 (exp. 26).
>>> [   58.585653] uvcvideo: Failed to query (129) UVC probe control : -110 (exp. 26).
>>> [   58.592967] uvcvideo: Failed to initialize the device (-5).
>>>
>>> Testing shows that at least 125 us between control transfers is required
>>> to avoid the timeout. Limit the workaround to the affected Etron host and
>>> USB device combination to avoid changing control-transfer timing for other
>>> devices.
>>
>> Any idea why it happens or why the delay helps?
> 
> We don't know the root cause yet, but we did some more testing.
> 
> We tested delays of 50us, 125us, and 200us. The issue was still
> reproducible with 50us, while 125us and 200us passed our test.
> 
> Our pass criterion is 30 successful plug/unplug cycles on each port.
> So 125us is the minimum delay we tested that consistently works.
> 

Are there issues with the control transfers already during enumeration
of the device, when reading descriptors etc, or are these issues only
visible after uvc driver is controlling the device?


> We also tried USB_QUIRK_DELAY_CTRL_MSG, but its 200ms delay is too
> long and causes UVC initialization to fail.
> 

Does it help if you as a hack set udev->quirks |= USB_QUIRK_DELAY_CTRL_MSG
_after_ enumeration and uvc initialization?

>> How many other HCs did you test this camera with?
> 
> The camera works with the EHCI host we tested without any delay.
> We can also reproduce a similar issue with an ASMedia ASM1142 xHCI
> host (1b21:1242). This patch, however, is limited to the Etron/HIK
> combination.

I think we should avoid usb device specific quirks in the xhci driver,
especially now that we know it's not really tied to a specific xHC vendor.

If this is only an issue with the control transfers sent by uvc driver
then I think this device specific quirk should be in there.

Thanks
Mathias


