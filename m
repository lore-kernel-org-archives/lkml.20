Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321578;
	b=d6lXPrhtKxBMrAowUIkp08pf8hOO3bG8qaAQVZ+awQuctrguXHwEPYJAu8zqlD0NRfub
	 nIhbFJsMMakW4YBz3POXYwxQB3Xcch4ztOz0JPsGcYDPcyRS+1DRvcNQGpYTArjVxnfTO
	 hYHlA+gKiDvWq6oR9yrnPS+ERFIc1tPJTwL0kUHOF4bz1bgvU4H2g7TtWgQvpTeysEkks
	 T8ZpNDSOL51FsRnxpXvD9SH2azHX1SCVLAe/djs3KyFIGiZYWE7lACmhbrC3ZxMlMM+Xb
	 zwPtfs2q7BnnFFC8ulllpYeeSIArhBomde7TwRhQ/XAb3MS4162xkx5rFHzgSw/A1Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321578;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=FkEnySU1GDLF2VUiw91mJ6AFRwT7hgrNJUSJL3fFwu4=;
	b=Hq0yq0kcLI//1rivOZYLxkYv4UtGKxnFRtIKEX2+H/W+EkTFcLkMszmIdVkBlL8eRzDz
	 vkBDcjI/sCrNJbL03vTXgXnj1VHufZb5XNVGSvs0uT2Nqo28JUqhR2M/p5PtKCncsxUwV
	 7alGCtmVjLNiF9Kb4kQ8lPJVlSPAWKogAQ2bvFoxv9I6fZXjdUlo0EtTfwg4MQaQ6o5/J
	 s0Gw02vUtIk5gCtmSmFYix2mdqzlEJilK/L1nghkCDsqThfQxzLR14p5kAl1T8Z5mpcGz
	 cQ+az9839wE1GQyHL6/j2nLdb5pIyrKH3ntloOhKSlb8n6mDTzZ+xNM0Vvvcm3mQ5hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZPa7zZde;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19814606A325;
	Tue, 10 Nov 2026 14:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19814606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZPa7zZde
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794321578; x=1825857578;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ot1QM6EDzvkgegBaqjLJg+T6pk0P7EVN8USsv3osalw=;
  b=ZPa7zZdebCtOVBpJ+ogaRq+XKtmI+GyZdLXAikqiWghd5J9PoxaucTcm
   +L6xGK3sUezL1wfKB6sgKa5FfCV6guhkfRDAXDgBr3YG7usadQpySGYFR
   yFRxwkWMnRHanaNss4Q7kQV462fRm+nC/qEDuxZWCzZHCCLRQb72asU44
   446EP7N6vM1BliT23GxXkU8lypM0sZwgnaXHLK49myyTiSZQeaL+OA1b4
   ef0etbfRaQ0aQ+YvGY4nfVv94BrAAziW1/g+Pgd90tiVw9yWhij9MI3p5
   O4O/zpWpDENvajrdLeTB2Xd4ZQZoHwpTQuQnwrUFAxXi0HhzAbEkEd68+
   g==;
X-CSE-ConnectionGUID: yG7kfa/pQ5uo4XMGSmZCsw==
X-CSE-MsgGUID: xVidUhtkRCC8dN07xIYq6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2938974"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2938974"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 06:39:38 -0800
X-CSE-ConnectionGUID: 6bdY2a/HS+u9RtvpN64X+w==
X-CSE-MsgGUID: uW/XdyleQiyAJOLGavE2wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8459367"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 10 Nov 2026 06:39:35 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C606F99; Tue, 10 Nov 2026 15:39:33 +0100 (CET)
Date: Tue, 10 Nov 2026 15:39:33 +0100
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
Subject: Re: [PATCH v2 5/7] thunderbolt: increase the lane adapter link-up
 timeout value
Message-ID: <20261110143933.GD259790@black.igk.intel.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-6-chunfeng.yun@mediatek.com>
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
In-Reply-To: <20261110114925.722014-6-chunfeng.yun@mediatek.com>

On Tue, Nov 10, 2026 at 07:48:53PM +0800, Chunfeng Yun wrote:
> when plug into a USB3 device into USB4 hub's downstream facing port
> to trigger usb4 driver wakeup, encounter the lane link up timeout

USB4

> issue, then cause usb3 hub disconnect:

USB3

Everywhere.

> 
> usb4_hi NVDA8100:00: 0:1: failed to reach state TB_PORT_UP. Ignoring port...

What's usb4_hi?

> usb4_hi NVDA8100:00: 0:1: lost during suspend, disconnecting
> usb4_hi NVDA8100:00: 0:4 <-> 1:20 (USB3): deactivating
> usb4_hi NVDA8100:00: deactivating USB3 Down path from 0:4 to 1:20
> usb4_hi NVDA8100:00: deactivating USB3 Up path from 1:20 to 0:4
> ...
> thunderbolt 0-1: device disconnected
> usb 2-1: USB disconnect, device number 10
> 
> Completes link training at ~1.48s (with two retimer) and transitions
> to TB_PORT_UP after change the timeout to 2s;
> 
> In the USB4 spec, Phase 5 (Link Equalization) alone is allowed up to
> 1000 ms. When add tPhase2~4 (200 ms), and retimer transaction delays
> (tCmdResponse = 50 ms), the physical link is allowed by spec to take
> 1200 ms to 1500 ms+ to complete initialization.

Okay that makes sense.

> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: change timeout from 2.5s to 2s
> ---
>  drivers/thunderbolt/switch.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index 7ff3da79da76..7daee83c7ed8 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -486,7 +486,7 @@ int tb_port_state(struct tb_port *port)
>   * @port: Port to wait
>   * @wait_if_unplugged: Wait also when port is unplugged
>   *
> - * Wait up to 1 second for a port to reach state TB_PORT_UP. If
> + * Wait up to 2 seconds for a port to reach state TB_PORT_UP. If
>   * wait_if_unplugged is set then we also wait if the port is in state
>   * TB_PORT_UNPLUGGED (it takes a while for the device to be registered after
>   * switch resume). Otherwise we only wait if a device is registered but the link
> @@ -500,7 +500,7 @@ int tb_port_state(struct tb_port *port)
>   */
>  int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
>  {
> -	int retries = 10;
> +	int retries = 20;
>  	int state;
>  	if (!port->cap_phy) {
>  		tb_port_WARN(port, "does not have PHY\n");
> -- 
> 2.45.2
