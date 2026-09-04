Received: from mta0.migadu.com (out-159.mta0.migadu.com [91.218.175.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B3F3EA973
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510976; cv=none; b=EZCP672psfGFH0DTlv8h8fwAZz5PJs/eCLXgx04ie2IeiZuCd+f0VHipSBem+rgv9XpAG8zTiAGUtTeu9Zo0k0yzV3GOu9LaXmDaxsW1kY15lvhvuUN/PRcuBPBWLPYo1fchQjV287oIG92Pbt1Ook54yRLJZI5J+jyM8jN8SCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510976; c=relaxed/simple;
	bh=U1x/bNRs0Mwb1PxVQ65+8iKdITUD0P0R70d5PxDMTt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lHSvXtWHpwD0mVdTw02leQuJ63KhV7ji22YOXI6bjfVffj2KRsZszY9zvHiukgmTFvrI+SUmZPo7b08NbPtO6AWdK5EMYcZLpB7n8OrR9RKyBJF3YD/3E6heisoh/9c97cafB6OLss03TTzfXilLIyZcq9tQ2c3wwffRXTYWwTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=U4sDbw/D; arc=none smtp.client-ip=91.218.175.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="U4sDbw/D"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=U1x/bNRs0Mwb1PxVQ65+8iKdITUD0P0R70d5PxDMTt8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788510972; v=1; x=1789115772;
 b=U4sDbw/DZJoZT1fbeYjtNwoqPSv6ZKOxV/9G/B1jNhJr0WJoi1S9I7oUYcvNsmrcvjKAD/V9
 caD+k3wntYsUtCuJYBj8x8m4B9+gvdmokOze1yLuAOSZ6ywyAM88aJN3xqyi8y9RudgQla3gcvs
 zwvTzvTQ9XFqTLrz25yqEWn4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 502bfefaf8f21b1e;
	Fri, 04 Sep 2026 08:36:12 +0000
X-Mizu-Trace-ID: 502bfefaf8f21b1e
X-Migadu-Flow: FLOW_OUT
Message-ID: <b749adb5-b3c5-4e30-89b4-9e6849bfd08c@linux.dev>
Date: Fri, 4 Sep 2026 09:20:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add SoundWire detach helper
To: Charles Keepax <ckeepax@opensource.cirrus.com>, lee@kernel.org,
 vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260831140157.1736905-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260831140157.1736905-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/31/26 16:01, Charles Keepax wrote:
> Currently, if a SoundWire driver takes an action that causes the device
> to detach from the bus it needs to be careful. There will be a period of
> time until the detach is recognised by the core, if the driver
> immediately
> calls sdw_slave_wait_for_init() it is possible for that to complete
> before the detach has been recognised. Leaving the driver with a device
> that is potentially not ready for what follows.
> 
> To avoid this race add a new helper that drivers can use to inform the
> core the device will detach. This clears the enumeration completions
> ensuring that sdw_slave_wait_for_init() can't complete until the device
> re-attaches.
> 
> This is the third part of a longer series of moving these slave
> attach/deatach operations into the core:
> 
> https://lore.kernel.org/linux-sound/20260512103022.1154645-1-ckeepax@opensource.cirrus.com/
> https://lore.kernel.org/linux-sound/20260608102714.2503120-1-ckeepax@opensource.cirrus.com/
> 
> I have based this series off Vinod's soundwire tree as that probably
> makes sense for which tree to take it through.
> 
> Thanks,
> Charles
> 
> Changes since v1:
>  - Correct kerneldoc
> 
> Charles Keepax (2):
>   soundwire: Add a helper function to indicate a device will detach
>   mfd: cs42l43: Move to core detach helper
> 
>  drivers/mfd/cs42l43-sdw.c     |  2 --
>  drivers/mfd/cs42l43.c         | 15 +--------------
>  drivers/soundwire/bus.h       |  6 ------
>  include/linux/mfd/cs42l43.h   |  1 -
>  include/linux/soundwire/sdw.h | 26 ++++++++++++++++++++++++++
>  5 files changed, 27 insertions(+), 23 deletions(-)

LGTM, for the series

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>


