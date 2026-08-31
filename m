Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C5C4A3D4C;
	Mon, 31 Aug 2026 13:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183765; cv=none; b=Ts0dep+HhFz/Zw5FJbWAfZtk4JKsAvMdi3vqaGoetyxUBUuuekXt+1DksAWdlNKmacbk8fUAFV1o9nLwJGQFfWC96wobKKN+/4sPjSRWsdhGD4afLJnwNBSJF++TPZ3nIFJXTgWE4jHg6RQJYKqwcvYAPkLG4Wo8YLtrsm4pL2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183765; c=relaxed/simple;
	bh=Sg18FhYMU2CY/3cT5So/8ytST2NSR+fV0kOWcdHKXHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svYtxsH8gSIWw38txHMyzj/42e0Lb9vHhSw4p8P7DQPViI2XQe+APjTdqQtWMMlnJgdY5eJ+di+1bg652SqiL4U+Hvvr8UHMPyeTVUatnFfl8Vxgo4Uo5V4FHNfzTMHVQvIO0iN48aTzOftF01OKiOkw/Kmtjm9Gu/twFS7P08g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A1CoaYgn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A1CoaYgn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788183763; x=1819719763;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sg18FhYMU2CY/3cT5So/8ytST2NSR+fV0kOWcdHKXHU=;
  b=A1CoaYgnFer/ioevh1EUOF5Y/9ILn4qTAI9djdizeaiK3qbJeDNcEoeS
   pEixvdTnjvEiNEJXEw8i827KAXwr0Uu9+z+S6DJwIzcmfOjVJTedxa7X5
   7kCGQiRib2Aq6VN1lo5n01a2DLgRfNJaGZvMAS8izXkGIoS3k4y2UhAW7
   cKJG55/n7S03lcA9P5lvwqtFkeagrslC184qQ1LJrd0ah3HZ1SFaNuyE1
   0hAGxqElwR6l6LiQtEpu6Skt5ejzq0SeQHfu+VI9ZZE6HnjEL0kuDYxWD
   K4zxW2J3kBhQVHLSTvFz7m5Qat/ZmY9GblUj5mff8uHz+T+TAB3BvRZal
   A==;
X-CSE-ConnectionGUID: xi/1UfXRS/KHRgFsk+eU0w==
X-CSE-MsgGUID: 6cgMPPUuRraCAURRWhOjyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92400894"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="92400894"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 06:42:42 -0700
X-CSE-ConnectionGUID: YFiWtX2KQz2n86GSSS/+0g==
X-CSE-MsgGUID: u3/H7FJcQIu32PUjLkyqkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="268242995"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 31 Aug 2026 06:42:40 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 9158D99; Mon, 31 Aug 2026 15:42:39 +0200 (CEST)
Date: Mon, 31 Aug 2026 15:42:39 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Amaan Lalani <zlzzm2014@outlook.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Reset downstream port after failed link
 restore
Message-ID: <20260831134239.GM124825@black.igk.intel.com>
References: <DM6PR02MB63772452BC9DE8C5C79BE421A0AB2@DM6PR02MB6377.namprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DM6PR02MB63772452BC9DE8C5C79BE421A0AB2@DM6PR02MB6377.namprd02.prod.outlook.com>

Hi,

On Sat, Aug 29, 2026 at 04:57:05PM -0700, Amaan Lalani wrote:
> A directly connected Thunderbolt device may fail to restore
> its link after a runtime suspend, therefore leaving the connection
> unusable.

How does it show up? Can you share more details, like full dmesg with
thunderbolt.dyndbg=+p in the command line?

> Reset the downstream port when the link restoration fails. This drives
> SBTX low, causing the partner to observe a USB4 disconnect and allowing
> the Type-C/PD firmware to renegotiate the connection. For dual-mode
> devices, this may allow the connection to fall back to native USB3.x.
> 
> Tested on a Microsoft Surface Pro 11 with a UGreen Thunderbolt
> 4 external NVMe enclosure, where the device successfully reconnects as a
> USB3 device when the Thunderbolt 4 link fails to recover.
> 
> Signed-off-by: Amaan Lalani <zlzzm2014@outlook.com>
> ---
>  drivers/thunderbolt/switch.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index 404c0693df50..7b88aa75a07a 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -3600,7 +3600,27 @@ int tb_switch_resume(struct tb_switch *sw, bool runtime)
>  
>  		if (tb_wait_for_port(port, true) <= 0) {
>  			tb_port_warn(port,
> -				     "lost during suspend, disconnecting\n");
> +				    "lost during suspend, disconnecting\n");
> +			/*
> +			 * If a directly connected USB4/thunderbolt device did not restore
> +			 * its link after a runtime suspend, assert a downstream
> +			 * port reset. This drives SBTX low and makes the partner
> +			 * observe a real USB4 disconnect. A dual-mode device and
> +			 * the Type-C/PD firmware will then try to renegotiate
> +			 * the connection in a native USB 3.x mode.
> +			 *
> +			 * Restrict this to the host router's downstream port.
> +			 * Resetting an intermediate router would not cause the Type-C
> +			 * to be renegotiated.
> +			 */
> +			if (runtime && !tb_route(sw) &&
> +			    tb_switch_is_usb4(sw) && port->cap_usb4) {

Yea I'm not entirely sure we want to add hacks like this to the driver to
be honest.

The link should re-negotiate as USB4 so something is wrong there. Have you
checked if you have the latest firmwares on both sides?

> +				err = tb_port_reset(port);
> +				if (err)
> +					tb_port_warn(port,
> +						     "failed to reset port for USB3 fallback: %d\n",
> +						     err);
> +			}
>  			if (tb_port_has_remote(port))
>  				tb_sw_set_unplugged(port->remote->sw);
>  			else if (port->xdomain)
> -- 
> 2.55.0
