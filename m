Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969505;
	b=xYsFfF+3ZUyM2BOYtT5x0J9kl19RSQsnBwBBi0OqPT96mqOZ9N/rKVxziQsrRcwej9VH
	 0KGiiacJOb9CeT6hjCvQ9UExKPBZDHm18UMx35P424J3X4uOIGT3LjHK5eQik7dUEJms8
	 PAJO5eqT2UvLDtEuWr7uFd/89/Jg7Qbf9VWZqqqBiiNqtzl0v/1ELjKnEsKY/2fypU5GU
	 6zsl+n1GAx/jlZNezjVDdT0zxFx0KuwOez/GEYd7yoHXSeI7ZZJyRzuq/C7CUMogQ3sdk
	 pOZelDyped0QmD9ca5R9TXpFjF/jKLxzXNWeQp4fJpnGrpZ5bviH+279rUlwRWHBl0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969505;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=SMITvXeCGg2NhyTEYPr6Wclw7Mu61Ayq4mgrnrkvM8g=;
	b=bRcPUmHHzRoAFfcw9Q4HFRD68cJgRfyZFwhCuuJVc0Km67L2xbjzGXXl0t8guz2xnhFs
	 CC4bp5ln/Ln1PWGf7NzNm6xi4iY7ZPgi4CaU84TgXz8J92UAFUIq88rMlsGsDjFSCJVYQ
	 xWZQ6IhpnXkPxBeSiljUVZFGXcmRIWOQ3vpAnJU3Bh2PYWihuBeaXgnM0Icja1ngBRZUS
	 Gzx84O7eIoC9nY+6kPmRjW+utRa2iba6DJ+cCusBtSmX2MxQVTUL8aswpwsdTHvaGN0M1
	 PrF1RxEqWK3dV3deREy28LSMDxNsB1Unlb16azOHUZgVt4sXHJnCG1C2Z0LjJ7inHVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qlrrj7+h;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB9F606A326;
	Fri,  6 Nov 2026 12:51:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EB9F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qlrrj7+h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793969505; x=1825505505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pVdmj061icvoOsF4OGlb+u8lnLy9pz83nG+aeK5dlGc=;
  b=Qlrrj7+hc/J/kG1o8essCjfg1p15VeJ4Kj5jcufCkByh0Agi/xGT0mSZ
   ZoFhVS3rKhwaeKu++bP+XujyVBusfrkI6f18QF9T8b5bI4Y5OHq+knFZv
   b5DvRjQo9GaBem/xHeCfmn9vh5DZs8No1i41lEX5vaKpJcb/KpOd6nZ2F
   eiF0H+n8kuW2kRrY6rHfpNbCH5JZSSKnnmIlvULX1NVmMoUnEdFKCbDmK
   BlRGdJI1eSLRQYupQ1TeSQgwJkiERBMtFysYFR0NiPS4azq7FGAHBdmIF
   wpFHB3zpVl99yWZxMi5uzgYCcfOXebI3KquqIXMFiIqVL9GK7QTuf34m3
   A==;
X-CSE-ConnectionGUID: D5xXrEHCToqVwXjAVOfVdA==
X-CSE-MsgGUID: 102rJU96TKmxqse+XcA03Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2659075"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2659075"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 04:51:45 -0800
X-CSE-ConnectionGUID: K8RWNCsKRY+BhC61f6spQw==
X-CSE-MsgGUID: gdJR9vQ6TTSpLmADeqE46Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7609113"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 06 Nov 2026 04:51:43 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 2362699; Fri, 06 Nov 2026 13:51:41 +0100 (CET)
Date: Fri, 6 Nov 2026 13:51:41 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
	linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	stable <stable@kernel.org>, Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH 13/19] usb: typec: anx7411: zero on-stack alt mode
 descriptors
Message-ID: <au3NXU0h3cV3b8qm@black.igk.intel.com>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-13-b9751ddb9c7c@linuxfoundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-llm-usb-v1-13-b9751ddb9c7c@linuxfoundation.org>

On Tue, Oct 27, 2026 at 03:57:53PM +0100, Greg Kroah-Hartman wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> typec_port_register_altmodes() and anx7411_typec_register_altmode() fill a
> struct typec_altmode_desc on the stack member by member: svid, vdo, mode.
> typec_register_altmode() reads three more members:
> 
>  - inactive: a port alternate mode is registered with active = !inactive.
>    If the byte of stack garbage is not 0, the mode starts disabled and
>    typec_altmode_enter() refuses it with -EPERM until somebody writes to
>    the "active" attribute of the port;
>  - mode_selection: the DisplayPort and Thunderbolt drivers enter the mode
>    on their own only if it is false. For the partner alternate modes of
>    anx7411, garbage there means that the mode is never entered;
>  - roles: decides what supported_roles of the port alternate mode shows.
> 
> typec_port_register_altmodes() is what tcpm and anx7411 register the
> alternate modes of their ports with.
> CONFIG_INIT_STACK_ALL_ZERO=y hides the problem.
> 
> Fixes: 183b194d8fb6 ("usb: typec: Make active on port altmode writable")
> Fixes: be727d400066 ("usb: typec: Introduce mode_selection bit")
> Fixes: 7b458a4c5d73 ("usb: typec: Add typec_port_register_altmodes()")
> Cc: stable <stable@kernel.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Benson Leung <bleung@chromium.org>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/anx7411.c | 2 +-
>  drivers/usb/typec/class.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
> index 06c25af094b3..ac122ab3175a 100644
> --- a/drivers/usb/typec/anx7411.c
> +++ b/drivers/usb/typec/anx7411.c
> @@ -552,7 +552,7 @@ static int anx7411_typec_register_altmode(struct anx7411_data *ctx,
>  					  int svid, int vdo)
>  {
>  	struct device *dev = &ctx->spi_client->dev;
> -	struct typec_altmode_desc desc;
> +	struct typec_altmode_desc desc = {};
>  	int err;
>  	int i;
>  
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 54c7810b563b..9d9703c70820 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -2684,7 +2684,7 @@ void typec_port_register_altmodes(struct typec_port *port,
>  	struct typec_altmode **altmodes, size_t n)
>  {
>  	struct fwnode_handle *child;
> -	struct typec_altmode_desc desc;
> +	struct typec_altmode_desc desc = {};
>  	struct typec_altmode *alt;
>  	size_t index = 0;
>  	u16 svid;
> 
> -- 
> 2.56.0

-- 
heikki
