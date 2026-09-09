Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBB15476D7;
	Wed,  9 Sep 2026 12:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956520; cv=none; b=h/31L9eAB8LWiE8aFVscvPPmiLw4dxqBJwbspKkUQa89lS21/LWe7BYJLeqC2bDviQP7Crw2dVE+NuAjd49hMfYfXwnYIbDR2zOKWExdkc3beE9oBCYVwjH83BU9oF42RbnT+6HRcVoO1G14OLIkwqIV/jasL5yRl/12APL3CEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956520; c=relaxed/simple;
	bh=j5lY9JXTSe8oVe5CEQaUyb0rcl/kv2YLcmYFWqaW05U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOn8Ax5dr50jOkOvRqOxg9bEwbzYJgKDdzfLzSUHGZS4WAjUf8CN3cmoVfS8GYuylOHOv3CvPslDqr0NfWYR3OBVZ+MEe+NsIiVHz1292HlYFhqgNSpCYOZWPa1GWr1GQGwkhrD0tjyrW4xjdeYj4DitLPvldzJcgq4qSMIi/CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PnppqEXy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PnppqEXy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788956518; x=1820492518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j5lY9JXTSe8oVe5CEQaUyb0rcl/kv2YLcmYFWqaW05U=;
  b=PnppqEXyKyhh1YYY3+7IhcsoE4FvhkUQ061u81V6rHN/0K/Jcp3iwvYQ
   iGVMVW+/nqUn7ZUTqEtAciNP+qF1nl9TOuzgNEOsss+GcbCjcfmVzQ+wb
   8YaGnECgbK39Wo5F31HyT2xMo99vxf8lxGTUECzbDvGMOSRCjBgu7/PVI
   LQbVV6XMLtDubWaNEQcSDve3pZPovOt36XBzNdRfIDymqlXCK72Lo5GIm
   vSOmuarMl9i4SuTJ9ax23cBzejIU9VNYCqv2jc9FbYN2h0WCW6ZV0bnZ4
   yrh3zPYn0pIJeMrR/Qhay7MbdFPuI7PvP4IhBA2fik+Vsa17N51RjEOFx
   w==;
X-CSE-ConnectionGUID: QDhSQqlITHWROrjTPKUiPw==
X-CSE-MsgGUID: xyXuko54QM+RdNDoB9+6bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89398595"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89398595"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 05:21:57 -0700
X-CSE-ConnectionGUID: vMW+wi3RRUG2Qva+nXk6ow==
X-CSE-MsgGUID: NFVqkCGASXWkLrU3d8qA7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="267022125"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 09 Sep 2026 05:21:55 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id CA9E299; Wed, 09 Sep 2026 14:21:54 +0200 (CEST)
Date: Wed, 9 Sep 2026 14:21:54 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] thunderbolt: Validate output ports while discovering
 paths
Message-ID: <20260909122154.GM106095@black.igk.intel.com>
References: <20260909035040.2929285-1-4ncienth@gmail.com>
 <20260909035040.2929285-3-4ncienth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909035040.2929285-3-4ncienth@gmail.com>

Hi,

On Wed, Sep 09, 2026 at 12:50:40PM +0900, Daehyeon Ko wrote:
> Path discovery reads the six-bit output port number from router HOPS
> configuration space and uses it to index sw->ports at three sites. A
> router can return a number larger than max_port_number and make the
> connection manager read an out-of-bounds tb_port, retain the invalid
> pointer in a path, or pass its embedded HopID allocator to IDA.
> 
> Resolve each output port through a bounded helper. In the construction
> pass, validate the output port before allocating the input HopID so a
> rejected entry needs no additional unwind.

If a router deliberately provides wrong information it can do much worse
things than just mess up with the CM. We should outright deny that thing
from even connecting not trying to fix every possible place where things
can go wrong.

Second thing is that this is path discovery which is now pretty much
debugging tool rather than the default so a regular user never hits this
anyway.

> Fixes: 0414bec5f39a ("thunderbolt: Discover preboot PCIe paths the boot firmware established")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
> ---
>  drivers/thunderbolt/path.c | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
> index b2c322e76b8ad..ea72153690dd3 100644
> --- a/drivers/thunderbolt/path.c
> +++ b/drivers/thunderbolt/path.c
> @@ -31,6 +31,17 @@ static void tb_dump_hop(const struct tb_path_hop *hop, const struct tb_regs_hop
>  		    regs->unknown1, regs->unknown2, regs->unknown3);
>  }
>  
> +static struct tb_port *tb_path_hop_out_port(struct tb_switch *sw,
> +					    const struct tb_regs_hop *hop)
> +{
> +	if (hop->out_port > sw->config.max_port_number) {
> +		tb_sw_warn(sw, "hop refers to non-existent port %u\n",
> +			   hop->out_port);
> +		return NULL;
> +	}
> +	return &sw->ports[hop->out_port];
> +}
> +
>  static struct tb_port *tb_path_find_dst_port(struct tb_port *src, int src_hopid,
>  					     int dst_hopid)
>  {
> @@ -54,7 +65,9 @@ static struct tb_port *tb_path_find_dst_port(struct tb_port *src, int src_hopid,
>  		if (!hop.enable)
>  			return NULL;
>  
> -		out_port = &sw->ports[hop.out_port];
> +		out_port = tb_path_hop_out_port(sw, &hop);
> +		if (!out_port)
> +			return NULL;
>  		hopid = hop.next_hop;
>  		port = out_port->remote;
>  	}
> @@ -141,7 +154,9 @@ struct tb_path *tb_path_discover(struct tb_port *src, int src_hopid,
>  		if (!hop.enable)
>  			break;
>  
> -		out_port = &sw->ports[hop.out_port];
> +		out_port = tb_path_hop_out_port(sw, &hop);
> +		if (!out_port)
> +			return NULL;
>  		if (last)
>  			*last = out_port;
>  
> @@ -178,12 +193,14 @@ struct tb_path *tb_path_discover(struct tb_port *src, int src_hopid,
>  			goto err;
>  		}
>  
> -		if (alloc_hopid && tb_port_alloc_in_hopid(p, h, h) < 0)
> +		out_port = tb_path_hop_out_port(sw, &hop);
> +		if (!out_port)
>  			goto err;
> -
> -		out_port = &sw->ports[hop.out_port];
>  		next_hop = hop.next_hop;
>  
> +		if (alloc_hopid && tb_port_alloc_in_hopid(p, h, h) < 0)
> +			goto err;
> +
>  		if (alloc_hopid &&
>  		    tb_port_alloc_out_hopid(out_port, next_hop, next_hop) < 0) {
>  			tb_port_release_in_hopid(p, h);
> -- 
> 2.55.0
