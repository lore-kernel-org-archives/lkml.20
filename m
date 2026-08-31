Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC71A26B2CE;
	Mon, 31 Aug 2026 11:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788174694; cv=none; b=uOcZ9DIKCLDaw501SUV7EHITvNkniLAwbQzhd4SuxVNwu4wplhh6iKgBnP7r+5Dw5ZB4mNItjckFSzwvAcPnsAVOpNHa3Hcv/h6/sDb4GulYiC3ZuBXOYcx8DrLI1n5X3Cpf4ygVlBa9ihmu/DPiatyKW0vL1HS4Kz3OIJ0RK9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788174694; c=relaxed/simple;
	bh=kym/LrhV/aYD7QLsJyv8b/49ADHeyC0z+mmkTMQEI0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLFJ1JkfediljAza+IMVTXn2ondMr9sWJuYvG1Nx7NsfB56ni5vKASNEwuavMUCk/rNTA7ZOrnAFaNlfFRK+2z29d2uNh8oG7l3XwwhW30T2Wj5rb3dZEEsuffuyw2qFQvs5ZSvU3x58JJl09+sVj+e3bSx0JJMYP4DRZitychU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AIU1nWyV; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AIU1nWyV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788174692; x=1819710692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kym/LrhV/aYD7QLsJyv8b/49ADHeyC0z+mmkTMQEI0I=;
  b=AIU1nWyVuhoyvKyjIOeqUSa0iesXEjeKVq6wHWgm3CvQerRWKMfw+HMc
   dpbMRM2ZjmHmbUvISu5sbj0+chZE5ODJObSEJe3IwtH8i7JdEeSjn17IF
   HKysUPMpTsvXw1fGrcgSX3VrOJc4HkYqPOeIEAwuv4Oh3DNUCB/V9mXGz
   J7LmKdZUO6CLhVnL4kCBQAxH+YSz+YNZeYRfAm0Hu/WyWA7ZTHhDEE92w
   f2eBlU0JevQIgMhmyJq2bcHFsBqPqlafo/c1nx4C2EW8yvE7gGeWTKlsO
   POvZ+n/HJxI4wqprfZsUvtMpGQ0cNKe1537MoLlxbgJs15oh51BSUs3tM
   Q==;
X-CSE-ConnectionGUID: +LGk/kcTQlaIezbOZoDMCQ==
X-CSE-MsgGUID: /LZ5wrI3QUOvpJAQbyBq5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88432200"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88432200"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 04:11:32 -0700
X-CSE-ConnectionGUID: SvHFtj21RH6jp6nsfUkA7w==
X-CSE-MsgGUID: 5gDXYUL3SrCjlWveFNTg6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="265528315"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 31 Aug 2026 04:11:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id E3A0199; Mon, 31 Aug 2026 13:11:28 +0200 (CEST)
Date: Mon, 31 Aug 2026 13:11:28 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Juan Martinez <juan.martinez@amd.com>
Cc: westeri@kernel.org, mario.limonciello@amd.com, andreas.noever@gmail.com,
	YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com, Sanath.S@amd.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] thunderbolt: Fix tb->lock deadlock during hot-unplug
 on AMD USB4 routers
Message-ID: <20260831111128.GH124825@black.igk.intel.com>
References: <20260827215740.415496-1-juan.martinez@amd.com>
 <20260828051903.485922-1-juan.martinez@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260828051903.485922-1-juan.martinez@amd.com>

Hi,

On Fri, Aug 28, 2026 at 12:19:03AM -0500, Juan Martinez wrote:
> Commit f1de1fc5f632 ("thunderbolt: Add quirk to reset host interface on
> DMA path teardown for AMD USB4 routers") introduced a deadlock when
> physically unplugging a Thunderbolt cable on AMD systems.
> 
> The problem occurs because tb_handle_hotplug() holds tb->lock while
> processing the unplug event. When it removes the XDomain services,
> tbnet_remove() calls tb_xdomain_disable_paths() which eventually calls
> tb_domain_reset_interface(). That function tries to acquire tb->lock
> via guard(mutex), but the hotplug worker already holds it, causing a
> self-deadlock.
> 
> The deadlock manifests as a complete network hang because
> tb_handle_hotplug() holds RTNL while waiting on its own mutex, blocking
> all network operations system-wide.
> 
> The existing code already handles this scenario partially: when
> xd->is_unplugged is true, tb_disconnect_xdomain_paths() intentionally
> skips the DMA teardown because the hotplug handler will do it later
> via __tb_disconnect_xdomain_paths(). However, the reset was still
> being called unconditionally.
> 
> Fix this by:
> 1. Splitting tb_domain_reset_interface() into a locked inner function
>    __tb_domain_reset_interface_locked() and a locking wrapper
> 2. Skipping the reset in tb_domain_disconnect_xdomain_paths() when
>    xd->is_unplugged is true (matching the existing teardown skip logic)
> 3. Calling __tb_domain_reset_interface_locked() from tb_handle_hotplug()
>    after __tb_disconnect_xdomain_paths() where the actual DMA teardown
>    happens and tb->lock is already held
> 
> This preserves the reset behavior for normal shutdown paths while
> avoiding the deadlock during physical cable unplug.
> 
> Fixes: f1de1fc5f632 ("thunderbolt: Add quirk to reset host interface on DMA path teardown for AMD USB4 routers")
> Signed-off-by: Juan Martinez <juan.martinez@amd.com>
> ---
>  drivers/thunderbolt/domain.c | 20 +++++++++++++++++---
>  drivers/thunderbolt/tb.c     |  1 +
>  drivers/thunderbolt/tb.h     |  1 +
>  3 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
> index 12c88509a54f..4cef9f4de523 100644
> --- a/drivers/thunderbolt/domain.c
> +++ b/drivers/thunderbolt/domain.c
> @@ -788,14 +788,22 @@ int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>  			transmit_ring, receive_path, receive_ring);
>  }
>  
> -static void tb_domain_reset_interface(struct tb *tb)
> +/*
> + * __tb_domain_reset_interface_locked - Reset host interface (lock held)
> + *
> + * Caller must hold tb->lock. Used by hotplug path where lock is already held.
> + */
> +void __tb_domain_reset_interface_locked(struct tb *tb)
>  {
>  	struct tb_nhi *nhi = tb->nhi;
>  
> +	lockdep_assert_held(&tb->lock);
> +
>  	if (!nhi->ops->reset_interface)
>  		return;
>  
> -	guard(mutex)(&tb->lock);
> +	if (!(nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN))
> +		return;
>  
>  	/* The reset clears the ring state so stop the control channel */
>  	tb_ctl_stop(tb->ctl);
> @@ -803,6 +811,12 @@ static void tb_domain_reset_interface(struct tb *tb)
>  	tb_ctl_start(tb->ctl);
>  }
>  
> +static void tb_domain_reset_interface(struct tb *tb)
> +{
> +	guard(mutex)(&tb->lock);
> +	__tb_domain_reset_interface_locked(tb);
> +}
> +
>  /**
>   * tb_domain_disconnect_xdomain_paths() - Disable DMA paths for XDomain
>   * @tb: Domain disabling the DMA paths
> @@ -835,7 +849,7 @@ int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>  	if (ret)
>  		return ret;
>  
> -	if (tb->nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN)
> +	if (!xd->is_unplugged)

If I read this right, if you unplug a tree (say a router and then after
that router there is inter-domain link) with this check the reset does not
happen and AMD system still hangs?

>  		tb_domain_reset_interface(tb);
>  
>  	return 0;
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index b7cc6894a598..89dfb3381345 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -2489,6 +2489,7 @@ static void tb_handle_hotplug(struct work_struct *work)
>  			tb_xdomain_remove(xd);
>  			port->xdomain = NULL;
>  			__tb_disconnect_xdomain_paths(tb, xd, -1, -1, -1, -1);
> +			__tb_domain_reset_interface_locked(tb);
>  			tb_xdomain_put(xd);
>  			tb_port_unconfigure_xdomain(port);
>  		} else if (tb_port_is_dpout(port) || tb_port_is_dpin(port)) {
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index 4373336d9425..2e6e0920cb1f 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -789,6 +789,7 @@ int tb_domain_disconnect_pcie_paths(struct tb *tb);
>  int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>  				    int transmit_path, int transmit_ring,
>  				    int receive_path, int receive_ring);
> +void __tb_domain_reset_interface_locked(struct tb *tb);
>  int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>  				       int transmit_path, int transmit_ring,
>  				       int receive_path, int receive_ring);
> -- 
> 2.43.0
