Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350592;
	b=U1wm0aQ0kIHrT83C4sWuRVmWGaLPJEpRxOis3BzAOXXnLTp1Cg83By9UjNJqVozifqan
	 WFqb1BiOVBXjUrz44w59ZPQ8kVG3xtprX9BPOZgfCHUiC3irrcSIPwUlUbRdi8DgfVY5p
	 001wW2LIdvIyXITsViMXckoj0pwZPE1uI4N1HO1xZU3cK1IrX2XbadHco7AEXXuRGqr0u
	 NyagIc4I2lxrpjtUN9m9CJPzXXHzUOAGtPY9ubj/4SWnMRIycCPPlRmrO9cMmuzuTiv3q
	 Ivz1bBqS6oad3n0URDFTB7hx0r5nZ9Ayro2g/z1tGGG4hLKGU7jUTtz/0MtRPZ5AuMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350592;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=XSZrLjIOCIaJWI2dP/MU2eJsRzU/MSEVDusl8tm3SOI=;
	b=EJgSR5XplLtuDoljDqBUvXXcDHma6yxAK8RllEvanaCKF4k/acics0pNiYJmAiSzOxUt
	 fd1rseQi98rZc7kAFFFo8m3tbmSlqeSGWnsemSCM/eItcDchZl3MO6BYLKfwGM+Ex2omU
	 qMzEHIHUAHRvV3MWnVEOZL4jAR7Sfak9nRcGcWlO+rmvGEB+Z3zphGTWCK+Zk7AMkkk85
	 NPmej1TxNaOYUMHA5OCxyKqwgzFWhO8kiKCAFJjueSMfohWpxQRpU9WvW19ignfeNeG+V
	 woXKTkp19BHC11823wGNkYtXI53kkSqclnUK6c1dr9HjCQOdlZsoQE+vfbbCmrULmEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YOCR9uDd;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE86606A31C;
	Fri, 30 Oct 2026 08:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BE86606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YOCR9uDd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793350593; x=1824886593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FP6/5SIFaxNK34j+ZZ9Fi/I2y95wM15zKgP2cMbaunk=;
  b=YOCR9uDdW9LOyfRyfjrL0h38I1CPnU1mKt6HtkZmMxmtuoE9JDhAXr5J
   R+sEqPyWBUjAF/LsoluOeWPPYf0GY800CSR4IwOqh+xbX2L1QPoc8WZEA
   +yDqNV+zDHqx/VOFFkWyRrG1FI2Yux8kAGlMnBKe16qzv61RjSBGqay2A
   hO0Dd1/0rLpO8PNlF8ZOlJrC/0FAADZFVbWelvo7IoMxaOsfdkMwHM0Bo
   kjN5aqDRS6t2w7cIm3zPouTixHJcC59mIdjYmpTr763Z/6NJgtcoo+fGn
   GWpq57PBYHhfPsq+nLMJmyYKZ4jzaJK1q0a9wVwEYyENJTzVo+cU0amju
   A==;
X-CSE-ConnectionGUID: x1/Mp5GBQF6zkOas/64nFQ==
X-CSE-MsgGUID: aTHSfQCjQe6kqa77haUmHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2140738"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2140738"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 01:56:32 -0700
X-CSE-ConnectionGUID: XjaLmNqORemTGdjJXTr0pw==
X-CSE-MsgGUID: 3/s1TLRJTL6Ok8OGjXuIIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5918307"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 30 Oct 2026 01:56:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 6A95F99; Fri, 30 Oct 2026 09:56:28 +0100 (CET)
Date: Fri, 30 Oct 2026 09:56:28 +0100
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
Subject: Re: [PATCH 4/4] thunderbolt: prevent pcie tunnel activation/teardown
 warnings
Message-ID: <20261030085628.GS158991@black.igk.intel.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-5-chunfeng.yun@mediatek.com>
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
In-Reply-To: <20261030082539.1208733-5-chunfeng.yun@mediatek.com>

On Fri, Oct 30, 2026 at 04:25:39PM +0800, Chunfeng Yun wrote:
> When usb4 enter sleep mode, echo 1 to authorized of sysfile,
> will wakeup usb4 driver, but fail to create pcie tunnel, cause
> the warning due to a race condition between switch disconnect

It's router

> during resume and user authorization

> 
> When usb4 enter sleep mode, echo 0 to authorized of sysfile,
> will wakeup usb4 driver, but fail to disconnect pcie due to
> the PCIe tunnel had already been torn down and freed if the port
> is fail to resume:

So this is runtime resume when there is no PCIe tunnel yet, the device is
unplugged and the userspace is at the same time writing to the "authorized"
attribute? 

Then the PCIe tunnel creation fails as expected.

What warning you are trying to silence?

> 
> The check prevents a redundant lookup and eliminates the warning
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/thunderbolt/switch.c | 5 +++++
>  drivers/thunderbolt/tb.c     | 7 +++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index e7ee9639c54c..7902172f4e99 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -1849,6 +1849,11 @@ static int tb_switch_set_authorized(struct tb_switch *sw, unsigned int val)
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
> +	if (sw->is_unplugged)
> +		return 0;
> +
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
> 2.43.0
