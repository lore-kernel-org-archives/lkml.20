Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFB843CE6D;
	Fri, 28 Aug 2026 14:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929127; cv=none; b=WXZ2uli2sMFIuu90sXadk1EuW0wqPrgpIyAEx/qCUyDulA398MlIQAlwxLGxvoXEwpRFM0Mf1iLWAy8ZyC3adT4hev2rWfPT6WrX90n2WubI7M/PWw6+2/C4zBkfscvDAPRu1CBc5BfhCFJYg/RiCUwCBUPVKZHBXbgUvR/4Rx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929127; c=relaxed/simple;
	bh=hTFP47AvnYEQMlF2SecKaz9yq+IFHH0SegM4sJFxZLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cQOQ3QzGydz+62b2fTxP06sGpHSteSldSr9AjqE8jZEudb+Q4xbiXrstI3YfyC6sChfte0GdxF9EZDD2qE+IVOSY1nfgOw59Pnqdvg/fywXvEzDB8hM/JmZtf7W8zE+6CcwrGaoE18p8Y1Ctlg6QfXFt8Bxv9wfe/IJ35JB9fFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WwPgn4e+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WwPgn4e+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC9A1F000E9;
	Fri, 28 Aug 2026 14:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787929125;
	bh=74Fj7tL96kGwBLO/hArSSyCch8gm1RowcBdTkqeKx+A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WwPgn4e+trs/BZwls4wxpRFxK9REZMof7hb21Ppo2q66+K9DsCie8wCr5rlENlCD3
	 7xRwQdhchci/f4l6nq94TkKZZv+V/5L1PlbCFhselAhfX8di3TkFtTV6xg6LZCzbwF
	 ALr9rMohE0wvyIGL4aFroAr5++8Z9Ud2GZ8Rptvt2ojtPhLUHy22YkbNrsfqpm6yKP
	 VYdYuDQGNp/pA8WE9MpJT5ZRnP0cfhhPA4PFCnyA0KV8EVN0+GzjcjcliNX9o2kuXS
	 0b2/hyly6VBi2wLH5cY2jQKGQFGhFmBD3cVvbWel4UhqVBUGEf9PNJs3QQ4vFWO/3A
	 inhldz1ZwbDEA==
Message-ID: <f91bdb9a-bcfb-4f37-8163-19ce7ebe0d46@kernel.org>
Date: Fri, 28 Aug 2026 09:58:44 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] thunderbolt: Fix tb->lock deadlock during hot-unplug
 on AMD USB4 routers
Content-Language: en-US
To: westeri@kernel.org
Cc: andreas.noever@gmail.com, YehezkelShB@gmail.com,
 Basavaraj.Natikar@amd.com, Sanath.S@amd.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Juan Martinez <juan.martinez@amd.com>
References: <20260827215740.415496-1-juan.martinez@amd.com>
 <20260828051903.485922-1-juan.martinez@amd.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260828051903.485922-1-juan.martinez@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/28/26 00:19, Juan Martinez wrote:
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
>     __tb_domain_reset_interface_locked() and a locking wrapper
> 2. Skipping the reset in tb_domain_disconnect_xdomain_paths() when
>     xd->is_unplugged is true (matching the existing teardown skip logic)
> 3. Calling __tb_domain_reset_interface_locked() from tb_handle_hotplug()
>     after __tb_disconnect_xdomain_paths() where the actual DMA teardown
>     happens and tb->lock is already held
> 
> This preserves the reset behavior for normal shutdown paths while
> avoiding the deadlock during physical cable unplug.
> 
> Fixes: f1de1fc5f632 ("thunderbolt: Add quirk to reset host interface on DMA path teardown for AMD USB4 routers")
> Signed-off-by: Juan Martinez <juan.martinez@amd.com>

Looks good to me now, thanks for iterating.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

Mika,

The quirk this is fixing came in 7.3 cycle.  So this patch should also 
go to -fixes for 7.3 cycle.

> ---
>   drivers/thunderbolt/domain.c | 20 +++++++++++++++++---
>   drivers/thunderbolt/tb.c     |  1 +
>   drivers/thunderbolt/tb.h     |  1 +
>   3 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
> index 12c88509a54f..4cef9f4de523 100644
> --- a/drivers/thunderbolt/domain.c
> +++ b/drivers/thunderbolt/domain.c
> @@ -788,14 +788,22 @@ int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>   			transmit_ring, receive_path, receive_ring);
>   }
>   
> -static void tb_domain_reset_interface(struct tb *tb)
> +/*
> + * __tb_domain_reset_interface_locked - Reset host interface (lock held)
> + *
> + * Caller must hold tb->lock. Used by hotplug path where lock is already held.
> + */
> +void __tb_domain_reset_interface_locked(struct tb *tb)
>   {
>   	struct tb_nhi *nhi = tb->nhi;
>   
> +	lockdep_assert_held(&tb->lock);
> +
>   	if (!nhi->ops->reset_interface)
>   		return;
>   
> -	guard(mutex)(&tb->lock);
> +	if (!(nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN))
> +		return;
>   
>   	/* The reset clears the ring state so stop the control channel */
>   	tb_ctl_stop(tb->ctl);
> @@ -803,6 +811,12 @@ static void tb_domain_reset_interface(struct tb *tb)
>   	tb_ctl_start(tb->ctl);
>   }
>   
> +static void tb_domain_reset_interface(struct tb *tb)
> +{
> +	guard(mutex)(&tb->lock);
> +	__tb_domain_reset_interface_locked(tb);
> +}
> +
>   /**
>    * tb_domain_disconnect_xdomain_paths() - Disable DMA paths for XDomain
>    * @tb: Domain disabling the DMA paths
> @@ -835,7 +849,7 @@ int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>   	if (ret)
>   		return ret;
>   
> -	if (tb->nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN)
> +	if (!xd->is_unplugged)
>   		tb_domain_reset_interface(tb);
>   
>   	return 0;
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index b7cc6894a598..89dfb3381345 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -2489,6 +2489,7 @@ static void tb_handle_hotplug(struct work_struct *work)
>   			tb_xdomain_remove(xd);
>   			port->xdomain = NULL;
>   			__tb_disconnect_xdomain_paths(tb, xd, -1, -1, -1, -1);
> +			__tb_domain_reset_interface_locked(tb);
>   			tb_xdomain_put(xd);
>   			tb_port_unconfigure_xdomain(port);
>   		} else if (tb_port_is_dpout(port) || tb_port_is_dpin(port)) {
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index 4373336d9425..2e6e0920cb1f 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -789,6 +789,7 @@ int tb_domain_disconnect_pcie_paths(struct tb *tb);
>   int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>   				    int transmit_path, int transmit_ring,
>   				    int receive_path, int receive_ring);
> +void __tb_domain_reset_interface_locked(struct tb *tb);
>   int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>   				       int transmit_path, int transmit_ring,
>   				       int receive_path, int receive_ring);

