Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350250;
	b=MlhLUDevj6RATEC3Kbh1p/Q+SaiASEIlJtPgIL02ImRS+KgbIc/bGhqJd4FtSl6R12sE
	 H9MdHIq044aEDFTb7dA3Hy51nfRz4F5Ac3+nCRn5nCqQ9zeq1XnBpUa/h77KgsisneoXi
	 1wXmy55W2lLMaSRCeI1cuU3WIaXdfv0uXxEzk2Y81iIXGINWVLyqXW+TeN2kl+8DDmt0T
	 d8h93++P5PIK07ORSkNeRQRz5ZRqBsI6vKPrL+mOASqD5+lKqrW2qui/MokJIa78r1vi6
	 j8MdMSPT+csg1+jA/XoQxzIy9cO1pbzYVLmyx3+qxXK+kbNbvxJ9aKN+OC0TbzaGogA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350250;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=E5x7B7nXoL/tCjGbGvP/ubF3LppEPd/RfZ8GtFIZbHY=;
	b=Mlk9ylX7HGlGH2H/DUgrdYqxvYv4AWCWIMaaFERy+OczUjNddqqcXMqKGV+RhQbLmcHw
	 GGwMYXs055eUJ5zB+nI0c7vZG6eDek6/8xY+W9WdYOIjQu6dAfJUrJ7w/WfV3Gq2G0hdc
	 qWpSGpYp7vzp/sQQhIQ/dDROrPhzA9xCdJB8TMkbw5gx0G9jD349+ztsNA31eM140tnM/
	 cAgSE/VtpmUZaZK7joNblqKDZ6qK7D/6bcQhAMNloffnc/QXVcny6bxiGsneb7mV1zgwt
	 WDN1pP3bY5RJ0zWLg3dHc8vdO/O+ZQSWuUfax/xbDVVBZ97UwOalf6XfKJ9YYQli20w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bm+7Hx37;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7FC606A31A;
	Fri, 30 Oct 2026 08:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A7FC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bm+7Hx37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793350249; x=1824886249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CmxciEAo57BZeqnclCgFetzlmtsZaVUtk/MM1fxegNU=;
  b=Bm+7Hx37K7JRoZBkxxIzxRGimb139IEEYC6lmfYY8Hw5EJvJwIpGfded
   eEEgGS27furUmhCO7Jpgq+WSydTJN0zb5RYEWtAmmz5mTWalgI+ppm+oi
   S+jy+6GbtS55fZ2HAyJG+CrG6OA2okM+XpmqL1mw0bsLM6guXtZrFGetN
   KNksBDfmOaeduo3FfUcmaLYxRL4Ox5wvMLQYkU4FoPknSx0UFOeLTKXcv
   j47Fygo2ihEj9BQ4QfM/K2TwgzBQO7mtuOU7v5idJWZoETdwbAeqLUdRj
   irbk4CcKtNmYopDEnakk43RZQG7dIcxn4j3bvzlfEjjWIB9+LMNtFKPnX
   w==;
X-CSE-ConnectionGUID: 0bV0CumyQXqTKFeuMqszZA==
X-CSE-MsgGUID: C1/PdzpgSRas3UGT7iOjbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1986455"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="1986455"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 01:50:48 -0700
X-CSE-ConnectionGUID: +Yp8x0cyRcalWLvDsJ5a9g==
X-CSE-MsgGUID: YbAuTS6IQoaj06HuKLRvSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5265042"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 30 Oct 2026 01:50:46 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 57E9C99; Fri, 30 Oct 2026 09:50:45 +0100 (CET)
Date: Fri, 30 Oct 2026 09:50:45 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/4] thunderbolt: improve usb3 adapter link up timeout
 value
Message-ID: <20261030085045.GR158991@black.igk.intel.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-4-chunfeng.yun@mediatek.com>
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
In-Reply-To: <20261030082539.1208733-4-chunfeng.yun@mediatek.com>

On Fri, Oct 30, 2026 at 04:25:38PM +0800, Chunfeng Yun wrote:
> when plug into a usb3 device into usb4 hub's DFP to trigger usb4

USB 3 device into USB4 hub's downstream facing port to ...

> driver wakeup, encounter usb3 link up timeout issue, then cause
> usb3 hub disconnect:
> 
> usb4_hi NVDA8100:00: 0:1: failed to reach state TB_PORT_UP. Ignoring port...
> usb4_hi NVDA8100:00: 0:1: lost during suspend, disconnecting
> usb4_hi NVDA8100:00: 0:4 <-> 1:20 (USB3): deactivating
> usb4_hi NVDA8100:00: deactivating USB3 Down path from 0:4 to 1:20
> usb4_hi NVDA8100:00: deactivating USB3 Up path from 1:20 to 0:4
> ...
> thunderbolt 0-1: device disconnected
> usb 2-1: USB disconnect, device number 10
> 
> Completes link training at ~1.48s and transitions to TB_PORT_UP after
> change the timeout to 2.5s:
> 
> In the USB4 spec, Phase 5 (Link Equalization) alone is allowed up to
> 1000 ms. When add tPhase3 (100 ms), tPhase4 (100 ms), and retimer
> transaction delays (tCmdResponse = 50 ms), the physical link is
> allowed by spec to take 1200 ms to 1500 ms+ to complete initialization.
> 
> here are two retimers in the link, if more retimers add it, need more
> time
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/thunderbolt/switch.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index d22d8db8f890..e7ee9639c54c 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -500,8 +500,9 @@ int tb_port_state(struct tb_port *port)
>   */
>  int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
>  {
> -	int retries = 10;
> +	int retries = 25;
>  	int state;
> +

This is unrelated change.

>  	if (!port->cap_phy) {
>  		tb_port_WARN(port, "does not have PHY\n");
>  		return -EINVAL;
> -- 
> 2.43.0
