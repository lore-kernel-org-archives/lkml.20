Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684563B6366;
	Fri, 11 Sep 2026 05:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789105840; cv=none; b=iDn9u8XUyl5Ntimcv4SwSP+Iejyvb4ULoOgPLuE1UbtNgT4n5XOYSvUp+rHaw3XZM1MnI/guuCm2+Is+CByefevR7Y6IS0YAK9DJnsk+4k+SQPJEhpbLTY/2UYRtC513lUaAG6Do59Am9QITdhKGJsRt4L7QlGerrNE1pi7yTXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789105840; c=relaxed/simple;
	bh=O9kWqJNPsgyDmYAvSkyDd9Y50aUJRkIgy9T3M6Zsx7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cApxrCnzM3wFbD5XLtCd2KBuVUH52FqpIzAg68HDFk/jikAz+8KO+1mFhR/ZvF6Qwet5p49Ic8fB3fpX1SrgKThA2SZmeQz2wbbg+YtzASnAYQARGHIfkFzEpG6LbkNoAeZr3jlNJ5XZau/XcbX88celabMZhMb9vrZLTR3qH/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LD/DCiSW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LD/DCiSW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789105839; x=1820641839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O9kWqJNPsgyDmYAvSkyDd9Y50aUJRkIgy9T3M6Zsx7A=;
  b=LD/DCiSWxEETeJJigIYRA2peqvNgd0R/nrCeYPejOFSJGvWh6As+s2zH
   BvVk4k+QX2CMMv1prXenikQ73HOv3MOeC6dqnX62bi7/yXubS3OQW6WDi
   lDPvgUGP9z1zfE87nPggDG2l8uvZoBbwPcQB9phlE+uwMvSXXM2FHuLkc
   WDVQTmpPgPV3vLGg7pGgv699wMjfej/UL4pq9w9XgO48x1TBYgrz9MOy2
   5wZh9W7ROEHDyDAoVHe1ivibMBTkSTVDTkRDclGMQofUHQ7zmlttkRAUG
   q+oIqeUXG4vRWrR60s9TSc6+lJwcCKSja09FFf4TgRmOWCh++yHpaY/V1
   w==;
X-CSE-ConnectionGUID: wpnaxcxIQ8+dW9lTSqPjVg==
X-CSE-MsgGUID: K8cy59G2SEC3+C7d8xmbGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="115107022"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="115107022"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 22:50:38 -0700
X-CSE-ConnectionGUID: 72hGfLFvSRCgzuZMJ24Jqw==
X-CSE-MsgGUID: Hvvsb4ifR3Godb3eymNPbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="275603443"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 10 Sep 2026 22:50:37 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id DB42A99; Fri, 11 Sep 2026 07:50:34 +0200 (CEST)
Date: Fri, 11 Sep 2026 07:50:34 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] thunderbolt: Validate DP bandwidth notification port
Message-ID: <20260911055034.GY106095@black.igk.intel.com>
References: <20260910141158.2466812-1-4ncienth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260910141158.2466812-1-4ncienth@gmail.com>

Hi,

On Thu, Sep 10, 2026 at 11:11:58PM +0900, Daehyeon Ko wrote:
> The port number in a DP bandwidth notification is six bits wide and
> comes from the router. A router whose maximum port number is smaller can
> therefore make tb_handle_dp_bandwidth_request() index beyond the
> max_port_number + 1 entries allocated for sw->ports. The first
> tb_port_is_dpin() check then reads the out-of-bounds object.
> 
> Add a common helper that warns and rejects out-of-range port numbers,
> and use it before dereferencing the notification port.
> 
> Fixes: 6ce3563520be ("thunderbolt: Add support for DisplayPort bandwidth allocation mode")
> Cc: stable@vger.kernel.org

Instead of fixes I think this one should be going in as improvement. At the
moment there are no known device routers with DP IN so it's only hosts and
we trust them.

> Assisted-by: LLM
> Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
> ---
> Changes in v2:
> - Add tb_switch_port() and use it for both tb_port_at() and the DP
>   bandwidth notification lookup, as requested by Mika.
> - Submit the DP bandwidth fix alone; the path-discovery change is not
>   included.
> 
>  drivers/thunderbolt/tb.c |  4 +++-
>  drivers/thunderbolt/tb.h | 11 ++++++++---
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 47753a5c0f2e..4854735514af 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -2756,7 +2756,9 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
>  		goto unlock;
>  	}
>  
> -	in = &sw->ports[ev->port];
> +	in = tb_switch_port(sw, ev->port);
> +	if (!in)
> +		goto put_sw;

Can you also replace the code in tb_handle_hotplug() with this?

>  	if (!tb_port_is_dpin(in)) {
>  		tb_port_warn(in, "bandwidth request to non-DP IN adapter\n");
>  		goto put_sw;
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index 4373336d9425..48dc57250e45 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -585,14 +585,19 @@ static inline u64 tb_route(const struct tb_switch *sw)
>  	return ((u64) sw->config.route_hi) << 32 | sw->config.route_lo;
>  }
>  
> +static inline struct tb_port *tb_switch_port(struct tb_switch *sw, u8 port)
> +{
> +	if (WARN_ON(port > sw->config.max_port_number))

Make this tb_sw_warn() instead.

> +		return NULL;
> +	return &sw->ports[port];
> +}
> +
>  static inline struct tb_port *tb_port_at(u64 route, struct tb_switch *sw)
>  {
>  	u8 port;
>  
>  	port = route >> (sw->config.depth * 8);
> -	if (WARN_ON(port > sw->config.max_port_number))
> -		return NULL;
> -	return &sw->ports[port];
> +	return tb_switch_port(sw, port);
>  }
>  
>  static inline const char *tb_width_name(enum tb_link_width width)
> 
> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
> -- 
> 2.55.0
