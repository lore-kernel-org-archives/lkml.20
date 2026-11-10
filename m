Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322210;
	b=vZXP+sq98Lh1Jn6ufNiKawgjNMUeeRnsL/BWu58ptsuJhwA5/mGSevRJojUEm6nrwG9F
	 0v8PmPoMEpaHrqgktrkKhDpqQIVdDa+rlfkQ1OppIJpBvq7W+e6bFc1XkV1JOf6WvjNjG
	 3J0Po/sL/JDMcra4BnAOPeHKfPbjQRnwhfU4W7zXb8vbcBISN3+r32kvIyhkGID2zDHQW
	 SZ/NXvkqSfDnEYoANwSSlcNOuE5xvvpbcsBvdnBnya8aBUzS6maXeWlSe1neVuv/bNCmL
	 RzIYPbrwrXkU1uUem6GiGmLw7Mi+u1bQ/oJK7FvABm3xfxDGz3we9rOL302hJFvrwOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322210;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=T2slujxCqhiL/TtLbPV2Q/sOsPxDWPy8sLnJEd7macQ=;
	b=ueYC0LDQi/F6pkyGnUsftkWXDaAlOBpuXjhAiTM5zQPRRnnxfyOOVeztTJVV27cWYHQa
	 FGHO3wXEuPMtLra5XfsxwLRq5mzBqM81PeiPaX0rjwgeLSM2gJwkJi4b9D2ZVEAXBYmf6
	 Ba6FpwAOkGHCb8+DBw2t6bm7WnacaE3ZOr43bQ7e3SVFEFGTk7D/QEBBMHrksEVH9l65j
	 IYCtwyme8yC9m+Dj7GWHOt9INzZ3UQX3SjVs/g80bJoFiMcIz8fJ+G6Vy6FBo1Hw5bcWl
	 dshdQRktKIe7GeTAW/S/45usl4e6xzbWMWUca+mpWPAQ9JGny2TczSJOyb4KaC1LH7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A05tbcK0;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60689606A320;
	Tue, 10 Nov 2026 14:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60689606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A05tbcK0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794322210; x=1825858210;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uVB2hb/dzQMegqJR/q5Ve1qnf38fN2lGeR/LzyMybZ0=;
  b=A05tbcK0dDgvMF6YtwBIhRkIijKgF4LtIemuAVTExsTwFNSOy/icmljF
   G/VrPAGYbUp8Ed4HJL2xmoPYK61WX4n/ziAungFzCdqu6U5AGw1P9TtB5
   +CDVxvnYovXkC+XSvY+BXxABBZOdcZgbqDSSwoaI+kO8FHjobnkPd3yUa
   1yQIvfO/yHhnemNcNGhYwsXKOIbNUiuFt6qvP80Ydd1KC04AbC1vtW89k
   Kj0X5RXqaIUcsuPbyvxHZzvKwyMrD72Kf6Kpa6t+5IEVMFz8yaSTiGDz3
   eeu/hghYxHYwjIfRytOuSkIEd7nQkRqMK8w5SnbLp9FIkTreoK3K154NX
   w==;
X-CSE-ConnectionGUID: 2iPW7Ek+QQyaPrLNfu3K8g==
X-CSE-MsgGUID: NGhiC/uJQLqhVHiAg5xHlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3102777"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3102777"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 06:50:09 -0800
X-CSE-ConnectionGUID: 6PJl7mS2QpqaIYmHcAXf/A==
X-CSE-MsgGUID: SrOSSITAQHGAwt5w0e5rPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8037500"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 10 Nov 2026 06:50:06 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A69E499; Tue, 10 Nov 2026 15:50:04 +0100 (CET)
Date: Tue, 10 Nov 2026 15:50:04 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Sven Peter <sven@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 7/7] thunderbolt: prevent pcie tunnel
 activation/teardown warnings
Message-ID: <20261110145004.GF259790@black.igk.intel.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-8-chunfeng.yun@mediatek.com>
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
In-Reply-To: <20261110114925.722014-8-chunfeng.yun@mediatek.com>

On Tue, Nov 10, 2026 at 07:48:55PM +0800, Chunfeng Yun wrote:
> When usb4 enter sleep mode, echo 1 to authorized of sysfile,
> will wakeup usb4 driver, but fail to create pcie tunnel, cause
> the warning due to a race condition between router disconnect
> during resume and user authorization

This is hard to understand.

Also PCIe, USB4 and so on.

> 
> [  278.831186] usb4_hi NVDA8100:00: 0:1: is unplugged (state: 7), retrying...
> [  278.943031] usb4_hi NVDA8100:00: 0:1: failed to reach state TB_PORT_UP. Ignoring port...
> [  278.951125] usb4_hi NVDA8100:00: 0:1: lost during suspend, disconnecting
> ...
> [  279.013763] usb4_hi NVDA8100:00: 0:7 <-> 1:9 (PCI): activating
> [  279.019587] usb4_hi NVDA8100:00: activating PCIe Down path from 0:7 to 1:9
> [  279.026468] usb4_hi NVDA8100:00: 1:1: Writing hop 1
> [  279.031335] usb4_hi NVDA8100:00: 1:1:  In HopID: 8 => Out port: 9 Out HopID: 8
> [  279.038546] usb4_hi NVDA8100:00: 1:1:   Weight: 1 Priority: 3 Credits: 32 Drop: 0 PM: 0
> [  279.046536] usb4_hi NVDA8100:00: 1:1:    Counter enabled: 0 Counter index: 2047
> [  279.053834] usb4_hi NVDA8100:00: 1:1:   Flow Control (In/Eg): 1/0 Shared Buffer (In/Eg): 0/0
> [  279.062259] usb4_hi NVDA8100:00: 1:1:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
> [  279.069730] ------------[ cut here ]------------
> [  279.074335] usb4_hi NVDA8100:00: PCIe Down path activation failed
> [  279.080426] WARNING: CPU: 5 PID: 2433 at drivers/thunderbolt/path.c:587 tb_path_activate+0x1a4/0x5b0
> ...
> [  279.220285] Call trace:
> [  279.222722]  tb_path_activate+0x1a4/0x5b0 (P)
> [  279.227068]  tb_tunnel_activate+0x140/0x498
> [  279.231241]  tb_tunnel_pci+0x180/0x490
> [  279.234980]  tb_domain_approve_switch+0x74/0xb0
> [  279.239500]  authorized_store+0x214/0x270
> [  279.243498]  dev_attr_store+0x20/0x70
> ...
> [  279.288888] ---[ end trace 0000000000000000 ]---
> [  279.293497] usb4_hi NVDA8100:00: 0:7 <-> 1:9 (PCI): activation failed
> 
> When usb4 enter sleep mode, echo 0 to authorized of sysfile,
> will wakeup usb4 driver, but fail to disconnect pcie due to
> the PCIe tunnel had already been torn down and freed if the port
> is fail to resume,

Please put the steps like:

1) Boot the system, nothing connected.
2) Once booted up, connected device.
3) Authorize PCIe tunnel via echo 1 > ..
...

So that we can see what are the steps you reproduce this. The above is
really hard to follow at least to me.

> 
> [  545.887822] usb4_hi NVDA8100:00: 0:1: is unplugged (state: 7), retrying...
> [  545.998689] usb4_hi NVDA8100:00: 0:1: failed to reach state TB_PORT_UP. Ignoring port...
> [  546.006778] usb4_hi NVDA8100:00: 0:1: lost during suspend, disconnecting
> [  546.013474] usb4_hi NVDA8100:00: 0:4 <-> 1:16 (USB3): deactivating
> [  546.020449] usb4_hi NVDA8100:00: deactivating USB3 Down path from 0:4 to 1:16
> [  546.027959] usb4_hi NVDA8100:00: deactivating USB3 Up path from 1:16 to 0:4
> [  546.035649] usb4_hi NVDA8100:00: 0:7 <-> 1:9 (PCI): deactivating
> [  546.042463] usb4_hi NVDA8100:00: deactivating PCIe Down path from 0:7 to 1:9
> [  546.050320] usb4_hi NVDA8100:00: deactivating PCIe Up path from 1:9 to 0:7
> [  546.057790] usb4_hi NVDA8100:00: 0: TMU: mode change off -> bi-directional, HiFi requested
> [  546.067910] usb4_hi NVDA8100:00: 0: TMU: mode set to: bi-directional, HiFi
> [  546.076120] usb4_hi NVDA8100:00: 0:1: total credits changed 66 -> 66
> [  546.082844] usb4_hi NVDA8100:00: 1: link width set to symmetric, dual lanes
> [  546.089815] ------------[ cut here ]------------
> [  546.094420] WARNING: CPU: 7 PID: 2433 at drivers/thunderbolt/tb.c:2245 tb_disconnect_pci+0x108/0x120
> ...
> [  546.238810] Call trace:
> [  546.241246]  tb_disconnect_pci+0x108/0x120 (P)
> [  546.245680]  tb_domain_disapprove_switch+0x24/0x60
> [  546.250464]  disapprove_switch+0xbc/0xe8
> [  546.254378]  authorized_store+0x19c/0x270
> [  546.258378]  dev_attr_store+0x20/0x70
> ...
> [  546.303767] ---[ end trace 0000000000000000 ]---
> 
> The check prevents a redundant lookup and eliminates the warning
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: no changes
> ---
>  drivers/thunderbolt/switch.c | 5 +++++
>  drivers/thunderbolt/tb.c     | 7 +++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index e12546bfb869..6e9f439ebf3f 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -1850,6 +1850,11 @@ static int tb_switch_set_authorized(struct tb_switch *sw, unsigned int val)
>  	if (!!sw->authorized == !!val)
>  		goto unlock;
>  
> +	if (sw->is_unplugged) {
> +		ret = -ENODEV;
> +		goto unlock;
> +	}
> +
>  	switch (val) {
>  	/* Disapprove switch */
>  	case 0:
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 57c11ba13459..69310622d786 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -2266,6 +2266,10 @@ static int tb_disconnect_pci(struct tb *tb, struct tb_switch *sw)
>  	struct tb_tunnel *tunnel;
>  	struct tb_port *up;
>  
> +	/* If the switch has already been unplugged, tunnels are already freed */

router

everywhere

> +	if (sw->is_unplugged)
> +		return 0;
> +

Actually I'm thinking that we can just get rid of the WARN_ON()s instead.
If the router is gone we cannot find the upstream port nor the tunnel and
that's fine so just return error instead.

>  	up = tb_switch_find_port(sw, TB_TYPE_PCIE_UP);
>  	if (WARN_ON(!up))
>  		return -ENODEV;
> @@ -2288,6 +2292,9 @@ static int tb_tunnel_pci(struct tb *tb, struct tb_switch *sw)
>  	struct tb_cm *tcm = tb_priv(tb);
>  	struct tb_tunnel *tunnel;
>  
> +	if (sw->is_unplugged)
> +		return -ENODEV;
> +
>  	up = tb_switch_find_port(sw, TB_TYPE_PCIE_UP);
>  	if (!up)
>  		return 0;
> -- 
> 2.45.2
