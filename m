Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321661;
	b=4qKxC6v/Dwkzq8tej72xtvURXRC2st6gEqN1vNbTnqR94BlwZX/JeIFkP3Mpooo8bEYN
	 AaZQGHh/mh+rGzYdN4bQK/wJl/opKPVe/0sfOCYdlsQ/FHZdDQQhWksiz39dXd90PTgmU
	 /KJTB67eX1VNaiXPzEm5zap2VIVXi+KPgOT5R+bmt/rkw2Kb1GRwFVQVwH3+VbhgCVeoC
	 iLKBsVu6KWq4yLJjXnjikie0ElGp1xD3Rx5A7AKXjt8uTinccM56oIeEaVSqnaxtJUazw
	 zlIy5ldzOyg0GbzKQ881HrbHj/G6mhplU+oiMrzCBfr98zgRUytJVsmedrJU3AKjrNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321661;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=QEilx6ClIxukouIYpCxZMMGhxt3BPIVjJ/jaO2GXxUs=;
	b=tQSfJ1tAejOuxk5VNCcmM/PbyD228eQumJt0DEjq/ErXr/IzInTyB0LY7meVCWmls7lA
	 vvfEMpmBLcwDObykoArmk0fuxCZk3+ShQnu9Q4phKPLi3vOUlNMGe5yfrnm88BU0o9IMg
	 I/0mk8pX4we5lMO9Zpa+XNDTIUqS4Suz3cLtIkqrx5B1QJqHpAWwKT3Jf7g4+I+epoy2g
	 lWR8l+kCNxUyDQ7aS5QR+BGY/ETUichKq8adcKF3B1ATYYUotrQpWrOzCZNr/PFNjON4L
	 10g4nX1E5HpQTN01xyz0BBId72oU3ZCb/Hotpf/FHvbm9wMNUgMuDfnrY0qil3TSkmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AEVtHNND;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AEF606A330;
	Tue, 10 Nov 2026 14:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55AEF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AEVtHNND
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794321660; x=1825857660;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3beWCTD/ZW0ya5XumXXSuW4w/qLCbXbTicr7vKWt6Is=;
  b=AEVtHNNDb0iucR8uastwNiGtVakQ/N0QIFGX4NNJFFZMAOJVUEMj+jdb
   hJ+q84iiJc/y5fKpxP9aC7vH5NEu6QStHPFQZ8dunbe6gqpCi97w3XZ1P
   pcUx7UnNdEW5/7lEa9cZ8Bnl9egOskSWOoJIOBmvmnrSz1IkWS3KbJReG
   zo56XBI4F8LJsU3vDjd5vpyGWJ6ZxJVLiSd3ozOCuU9zCLADDMVRqQnxn
   y2agzUYk2ZVWgI48YWZ05STGbmMYITTbyKwKpEsRxoHNDJbZ2hy9FksnL
   hJ6MczKCtcu/EgyfVdb8S1kggGOkh08O6uLiVx7BU1uL7MCVM7sdnRC7E
   g==;
X-CSE-ConnectionGUID: K5o8m7WSTj6ghuXElfkwTQ==
X-CSE-MsgGUID: JIL1lMH4TZ+MZ9OBqDJ1Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2957101"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2957101"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 06:41:00 -0800
X-CSE-ConnectionGUID: gpo7fP8uTBCwKYwmCtWJlw==
X-CSE-MsgGUID: FJkc3b9eTUeNUMqsYlZm7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8500198"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 10 Nov 2026 06:40:57 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 095A699; Tue, 10 Nov 2026 15:40:56 +0100 (CET)
Date: Tue, 10 Nov 2026 15:40:56 +0100
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
Subject: Re: [PATCH v2 6/7] thunderbolt: decouple the waiting time of
 TB_PORT_UNPLUGGED and TB_PORT_UP
Message-ID: <20261110144056.GE259790@black.igk.intel.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-7-chunfeng.yun@mediatek.com>
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
In-Reply-To: <20261110114925.722014-7-chunfeng.yun@mediatek.com>

On Tue, Nov 10, 2026 at 07:48:54PM +0800, Chunfeng Yun wrote:
> When usb4 is woke up by device disconnect, no need wait for 2s,
> usually the phase2~4 takes at most about 200ms, and enters to
> TB_PORT_CONNECTING, if it is still in TB_PORT_UNPLUGGED after 400ms,
> treat it as disconnected.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> new changes
> ---
>  drivers/thunderbolt/switch.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index 7daee83c7ed8..e12546bfb869 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -489,8 +489,9 @@ int tb_port_state(struct tb_port *port)
>   * Wait up to 2 seconds for a port to reach state TB_PORT_UP. If
>   * wait_if_unplugged is set then we also wait if the port is in state
>   * TB_PORT_UNPLUGGED (it takes a while for the device to be registered after
> - * switch resume). Otherwise we only wait if a device is registered but the link
> - * has not yet been established.
> + * switch resume, Wait at most 400 ms for link to start connecting,

router

> + * if timeout, means the device is disconnected). Otherwise we only wait
> + * if a device is registered but the link has not yet been established.
>   *
>   * Return:
>   * * %0 - If the port is not connected or failed to reach
> @@ -501,6 +502,7 @@ int tb_port_state(struct tb_port *port)
>  int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
>  {
>  	int retries = 20;
> +	int unplugged_retries = 4;

Reverse-christmas tree

>  	int state;
>  	if (!port->cap_phy) {
>  		tb_port_WARN(port, "does not have PHY\n");
> @@ -519,7 +521,7 @@ int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
>  			return 0;
>  
>  		case TB_PORT_UNPLUGGED:
> -			if (wait_if_unplugged) {
> +			if (wait_if_unplugged && unplugged_retries--) {
>  				/* used during resume */
>  				tb_port_dbg(port,
>  					    "is unplugged (state: 7), retrying...\n");
> -- 
> 2.45.2
