Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556254;
	b=s97JsCXaJqLiw6UP2VOnaGKYuJa92wEgw8TdKECO1CtcWHnu4qm0x29rWR9MfpWPkvFs
	 6lGpoNrSvOh1p/ewKTtgivxSUfOFgjqDECcZTU8oL+hEc+WKPuuQkpG8/v+zej7RwyKKc
	 Jg+MO89h10ZVOI3+tRwabtVLmwQmshuxTgHQTJ7f/S68/djPJEYJhIvx8RGNbV8zifkWe
	 RpEBChuJ6jbr1YSli1ZIPQbouNTlsIBddUMZVqyM0EH6Rzn5T2cPuPMCYA8ZlBqorozr1
	 BSp9sfqhpKBQC4lFAPzWxb0vmgLXuENPbUsz+MMxBrgSW60F9mPz+6Jh+3KV7EQmoJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556254;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=zYVeXsR1ir21scy4DyNCN/5rBK3WcZ5hCPMQJM4J1Ww=;
	b=BotFhqcKxAssiqqDQ4drX6KVo/OQhjxI3TliqfItGZwQTYDLxiHVcB7usJ2QajaG6mhI
	 Wu1V9m/lCQc+omL+MOAq6zwvH+PNqbfVfoJ5HFgamtED/CeHW4Z1TfPOsUCtVC+hCO5X4
	 87txn913Pgx2C0q4y0J+NGS4UiebgUCqnY9WLnR5PAQy0qHu3amX7BTkxMUXG1CRY10wV
	 Fjd7FVA9Vb4AWj5hUZ51LBUbBGYTBp5bWnzQug5HYb01mhUk9i0Qg0TTB8mOCnicX4OCU
	 9Znz9tOQ1Je7333E4M/B9ns/AmIPHsOtj9tdKOGmlWGQNalzTbSoYTavvp/0Im/29AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Uac2+OUR;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD244606A321;
	Fri, 13 Nov 2026 07:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD244606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Uac2+OUR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794556254; x=1826092254;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W8pU/ngqiDjzlAwtc4cFwOEnEyHCCnd58R09xfn5AhE=;
  b=Uac2+OURrgguk09VtFtdBeaUrVrb+qd1pq0YMOqooWYbLa4pvl6C/9g2
   hE44k+kNTmc01EedeyyRVL/TyVMgHE1O/R3xILJqXbPdQKBwOiCHGhqAw
   G2u9sUW/rtnhIOr40eVfhapwPzcdmJMkOfidtvZigUvY3Idag5sLnzmSx
   p0hACsKlOIB6r/0y0NCsTp7ZQoLXxN8v8WwK8Hgenhtp598xdrwSghNoj
   4/2s+zVLDiO4XBQWefLCWdLm2d1JBlqj4DjvApZ1x42B82beYFmesgyb3
   zwTPxk75d2o0FBUwHaCwVM/xlFgUaPm+Mir4yDxqJGEEkzsGOE/jsx27L
   g==;
X-CSE-ConnectionGUID: BEUt3KkTTh+bxK4Ig+sE9Q==
X-CSE-MsgGUID: 1O0Osgy2TCmIYXGqDxNGqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3246523"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3246523"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 23:50:53 -0800
X-CSE-ConnectionGUID: fGnOKAEORdGALJAU4yI2ng==
X-CSE-MsgGUID: Hkn910Y2Sl2NpXS/Mj7jnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8863913"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 12 Nov 2026 23:50:51 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 376A099; Fri, 13 Nov 2026 08:50:50 +0100 (CET)
Date: Fri, 13 Nov 2026 08:50:50 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Duff O'Melia <duff@omelia.org>
Cc: westeri@kernel.org, andreas.noever@gmail.com, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imre.deak@intel.com
Subject: Re: [RFC PATCH] thunderbolt: Tunnel only the first DP OUT of Apple
 Studio Displays
Message-ID: <20261113075050.GN259790@black.igk.intel.com>
References: <20261106154445.517940-1-duff@omelia.org>
 <20261109103039.GK176724@black.igk.intel.com>
 <82a62e13-928a-4973-b88f-ea2642132fc1@app.fastmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <82a62e13-928a-4973-b88f-ea2642132fc1@app.fastmail.com>

Hi,

On Thu, Nov 12, 2026 at 05:38:46PM -0500, Duff O'Melia wrote:
> Hi Mika,
> 
> On Mon, Nov 09, 2026 at 11:30:39AM +0100, Mika Westerberg wrote:
> > Can you provide full dmesg with thunderbolt.dyndbg=+p and drm.debug=0x10e
> > in the kernel command line when you have everything connected and the issue
> > reproduces?
> 
> Sure, it's attached, xz-compressed. It's from a reboot with everything
> connected, on Omarchy's 7.2.15 kernel with its stock Thunderbolt driver
> (my patch not applied). I added log_buf_len=64M so the start of the boot
> isn't lost. I removed MAC addresses, USB serial numbers and some
> firewall log lines, and changed nothing else.
> 
> In short:
> 
> - 0-3 is the 2026 model (0x8025). Both of its DP OUT adapters got
>   tunneled: 0:5 <-> 3:11 and 0:10 <-> 3:12.
> - 1-1 is a 2022 model (0x801f) on the second host router. It got
>   0:6 <-> 1:10.
> - 0-1 is the other 2022 model. It came up last, found no free DP IN
>   adapter ("no suitable DP IN adapter available, not tunneling") and
>   stays dark.
> - In xe, DP-1 (DPTUN 0:1:5) is the 2026 model's first tile, DP-3
>   (DPTUN 0:1:10) its second tile, and DP-2 (DPTUN 1:1:6) the 2022
>   model. DP-1 and DP-2 run at 5120x2880.
> 
> One correction to my patch description: on this boot DP-3 isn't
> disabled. Pipe D is active on it at 2560x2880 with no framebuffer on its
> primary plane, and the compositor doesn't list it as a monitor. So the
> second tile's stream does come up, but it shows nothing.

Thanks! Confirmed:

[    1.099566] thunderbolt 0000:00:0d.2: 0:5: DP IN resource available
[    1.101235] thunderbolt 0000:00:0d.2: 0:10: DP IN resource available

Both DP INs of domain0

[    2.417970] thunderbolt 0000:00:0d.2: 0:5 <-> 3:11 (DP): activating

First DP tunnel

[    2.428951] thunderbolt 0000:00:0d.3: acking hot unplug event on 0:10
[    2.429566] thunderbolt 0000:00:0d.2: 0: allocated DP resource for port 10
[    2.433756] thunderbolt 0000:00:0d.2: 0:10 <-> 3:12 (DP): activating

Secodn DP tunnel. However, the DP resource in 0:10 is shared with domain1
0:10 as well so that leaves only one DP IN for domain1 (0:6).

[    1.169534] thunderbolt 0000:00:0d.3: 0:6: DP IN resource available
[    1.170368] thunderbolt 0000:00:0d.3: 0:10: DP IN resource available
[    2.699961] thunderbolt 0000:00:0d.3: 0:6 <-> 1:10 (DP): activating

And this is that tunnel. Then you run out of DP INs.

It would be good if Imre could take a look from DP perspective if that
second tile in the 2026 model can be used.

I do have an internal patch series where userspace can affect what DP
IN/OUT pairs should be selected via a BPF hook but that's still work in
progress. That would help here.
