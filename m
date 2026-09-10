Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE622931C1;
	Thu, 10 Sep 2026 08:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789027561; cv=none; b=aVXekgf8sgUKV4QfmuXnROlkIl6FgXgl3kz/EfqEDPQfq4BJY7LSEdloc0lojZdJ4USZG6zsuq9t6d/3xerlJzq8N9bZou1Mj+3hogtlr+SyUNHLlKJ4GZDAd9tDuybE1OAniTBjrIXi3kk0AfXWOF+IMPTBvYjceAiRH15uP7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789027561; c=relaxed/simple;
	bh=0JEHB1CVXrdFnN3LPuRcWzkTlUzphNBBF5h7ooLy6hA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAMyTv5CVK3sNlf8Z+h0g/vjLVJNnxg7oPLe3tXIQV1qzuSr3H2ZJ6ntrZshkJcsS1j9PA3CIGoFZcDaKGCVI7kmbQqCBAwx7aiFRpAKlF3n8KgvuOYIBaWogsQZA+rGwhfVDOmCgML2NoD5FZ5qovMK9wDgse7JiC0FKqDKiPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=frgBGjzA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="frgBGjzA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789027560; x=1820563560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0JEHB1CVXrdFnN3LPuRcWzkTlUzphNBBF5h7ooLy6hA=;
  b=frgBGjzAeghkMhHmWfIUnIXB8OKM7ncVrt35sw29nH/y1igJ/8V1ejs3
   pNZcXxBIi0usV4bVgPU8R2YrKb14Iew8Obr42sd6ZQavu2W/2mCu4xA5A
   0mTjsdaRkxf/DRvCKLgzT95KX1j6/3DpgT3rkRAQ6Tv8hK1cA/ZZx+gtq
   KorODw8qOPs5Dx6aIXoJwlz4CGMZSW+9upGzixQo6B43FEM57qoEOlAFk
   CzipnEByQNbN+DQ7rty8zTdP/Xnk95ReLo7UNQ52hfzRafLm/dJcaQh20
   NZ17KAz+Igx0BcRLMW+s99aN6sW+aWNQcxrh5F0N7MTrENkiIosVModEf
   A==;
X-CSE-ConnectionGUID: +QNR488KRAKDs5e0b8+c1Q==
X-CSE-MsgGUID: zOBHB4MnS0aSjvrvznNUkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93160113"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="93160113"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 01:05:56 -0700
X-CSE-ConnectionGUID: HRWvFi9XROqN2tiFRG/vnA==
X-CSE-MsgGUID: FGOjymXsSxCSUdTmPbdkpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,271,1787036400"; 
   d="scan'208";a="267870063"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 10 Sep 2026 01:05:43 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 810E799; Thu, 10 Sep 2026 10:05:42 +0200 (CEST)
Date: Thu, 10 Sep 2026 10:05:42 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] thunderbolt: Validate DP bandwidth notification port
Message-ID: <20260910080542.GQ106095@black.igk.intel.com>
References: <20260909035040.2929285-1-4ncienth@gmail.com>
 <20260909035040.2929285-2-4ncienth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909035040.2929285-2-4ncienth@gmail.com>

Hi,

On Wed, Sep 09, 2026 at 12:50:39PM +0900, Daehyeon Ko wrote:
> The port number in a DP bandwidth notification is six bits wide and
> comes from the router. A router whose maximum port number is smaller can
> therefore make tb_handle_dp_bandwidth_request() index beyond the
> max_port_number + 1 entries allocated for sw->ports. The first
> tb_port_is_dpin() check then reads the out-of-bounds object.
> 
> Reject notifications that refer to a non-existent adapter before
> dereferencing the port.
> 
> Fixes: 6ce3563520be ("thunderbolt: Add support for DisplayPort bandwidth allocation mode")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
> ---
>  drivers/thunderbolt/tb.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 47753a5c0f2eb..8551dafe98c8e 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -2756,6 +2756,11 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
>  		goto unlock;
>  	}
>  
> +	if (ev->port > sw->config.max_port_number) {
> +		tb_sw_warn(sw, "bandwidth request from non-existent port %u\n",
> +			   ev->port);
> +		goto put_sw;

For this can you make a helper function tb_switch_port(sw, ev->port) that
issues a warning and then replace the direct access sw->ports[] with that?

> +	}
>  	in = &sw->ports[ev->port];
>  	if (!tb_port_is_dpin(in)) {
>  		tb_port_warn(in, "bandwidth request to non-DP IN adapter\n");
> -- 
> 2.55.0
