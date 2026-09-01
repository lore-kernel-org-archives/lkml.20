Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6AF47DFB0;
	Tue,  1 Sep 2026 22:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788300971; cv=none; b=WlshM+9SXuGaB0Ym5CrSIgK69QKVR2ALUaXio9xlBodSuisyFXqaeHUzm/1EkYR5+E3T0wgeO81/O1cCr7FM9tamKXlIFUxAICOIQo1N3W5s9zhRAwscgEKlQgtQf1qqHy8xHBOfYxIRIjysJqtcv39RJnCOGOIV4c1mxWBogqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788300971; c=relaxed/simple;
	bh=JFy9DO0xJRxWNa+JSNF3y/N4ZPSyr9PqTPXfEp0Oldc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=shX79Jg+Av8oXstkQB6EXIaHm62am19bv3TOSddL8j0Okdg/7m3sf7XRtdN/8VKb0XPr+PbjPNRPRAYyXCjd7z6E9XHDG72lOw/g6heAp+dvi2JDAhmtu3X3wYuOhfQ/zVU8UazkYzaBOYSg5fZU0qiiU19FcnMabN3V/c6xU6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QtuCMv7r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QtuCMv7r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8691F00A3A;
	Tue,  1 Sep 2026 22:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788300965;
	bh=Yf4rNeY/DBAye9ETFhqy6GSnF8DGTPgKweUO7gsr6g4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=QtuCMv7rnPGkDF8hU4xZJ1S/A3zg21A465suazTct6Ni+Pw854lAnPkZlM4u2cyOT
	 blqllvmZXcbaODr5vFuxnH8dn/dN3xGJRTK3TT/SE/yChJEnKRouBulYDvbVSW1LFH
	 N2AAXjPMDwcSircPR1YZqiyZVClOJ99iaOH3vf1fmaRw55GzgCoYCf9XJoFrOiESSE
	 ehQAqOHsGSIO364FBwdwEN+iqh4xG7tZykDZe24O51BdKvkq3/+N2hUpMtnL4i8lLM
	 bJy1YCS1+0hlgv6bwiWPqoayOZjUI2Ff+LqW4eTWh+RPZCR/xOY4mok23/tZTAvfKO
	 ygacr/kMeQ6mA==
Message-ID: <ae19d381-0fcd-45fb-9e53-033c7d664d73@kernel.org>
Date: Tue, 1 Sep 2026 17:16:03 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] thunderbolt: Fix tb->lock deadlock during hot-unplug
 on AMD USB4 routers
Content-Language: en-US
To: juan.martinez@amd.com, mika.westerberg@linux.intel.com
Cc: westeri@kernel.org, andreas.noever@gmail.com, YehezkelShB@gmail.com,
 Basavaraj.Natikar@amd.com, Sanath.S@amd.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260831130638.GK124825@black.igk.intel.com>
 <20260831161610.1322731-1-juan.martinez@amd.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260831161610.1322731-1-juan.martinez@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/31/26 11:16, juan.martinez@amd.com wrote:
> From: Juan Martinez <juan.martinez@amd.com>
> 
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
> skips the DMA teardown because the hotplug handler tears down the DMA
> tunnels itself. However, the reset was still being called
> unconditionally.
> 
> Fix this by splitting tb_domain_reset_interface() into a locked inner
> function and a locking wrapper. Skip the reset from
> tb_domain_disconnect_xdomain_paths() when xd->is_unplugged is true, and
> instead reset the interface after the hotplug handler tears down the DMA
> tunnel while already holding tb->lock.
> 
> Handle both unplug topologies: reset after the direct XDomain teardown,
> and after invalid DMA tunnels are removed when an upstream router and its
> downstream XDomain are unplugged together.
> 
> This preserves the reset behavior for normal shutdown paths while
> avoiding the deadlock during physical cable unplug.
> 
> Fixes: f1de1fc5f632 ("thunderbolt: Add quirk to reset host interface on DMA path teardown for AMD USB4 routers")
> Signed-off-by: Juan Martinez <juan.martinez@amd.com>

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

BTW -

I did take a look through the Sashiko feedback and the first point 
doesn't matter because no pre-USB4 hosts take this quirk.

The second point is a side effect of this reset and accepted behavior.

> ---
> 
> Notes (v5):
>      Changes in v5:
>      - Rebase on the current thunderbolt/next branch.
>      - Reset the host interface after invalid DMA tunnels are removed, covering
>        XDomains below an unplugged router.
> 
>   drivers/thunderbolt/domain.c | 20 +++++++++++++++++---
>   drivers/thunderbolt/tb.c     | 10 +++++++++-
>   drivers/thunderbolt/tb.h     |  1 +
>   3 files changed, 27 insertions(+), 4 deletions(-)
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
> index 47753a5c0f2e..9300cdae10b1 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -1776,12 +1776,19 @@ static void tb_free_invalid_tunnels(struct tb *tb)
>   {
>   	struct tb_cm *tcm = tb_priv(tb);
>   	struct tb_tunnel *tunnel;
> +	bool reset = false;
>   	struct tb_tunnel *n;
>   
>   	list_for_each_entry_safe(tunnel, n, &tcm->tunnel_list, list) {
> -		if (tb_tunnel_is_invalid(tunnel))
> +		if (tb_tunnel_is_invalid(tunnel)) {
> +			if (tb_tunnel_is_dma(tunnel))
> +				reset = true;
>   			tb_deactivate_and_free_tunnel(tunnel);
> +		}
>   	}
> +
> +	if (reset)
> +		__tb_domain_reset_interface_locked(tb);
>   }
>   
>   /*
> @@ -2489,6 +2496,7 @@ static void tb_handle_hotplug(struct work_struct *work)
>   			tb_xdomain_remove(xd);
>   			port->xdomain = NULL;
>   			__tb_disconnect_xdomain_paths(tb, xd, -1, -1, -1, -1);
> +			__tb_domain_reset_interface_locked(tb);
>   			tb_xdomain_put(xd);
>   			tb_port_unconfigure_xdomain(port);
>   		} else if (tb_port_is_dpout(port) || tb_port_is_dpin(port)) {
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index c112954ce3fd..5bb448a71407 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -792,6 +792,7 @@ int tb_domain_disconnect_pcie_paths(struct tb *tb);
>   int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>   				    int transmit_path, int transmit_ring,
>   				    int receive_path, int receive_ring);
> +void __tb_domain_reset_interface_locked(struct tb *tb);
>   int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>   				       int transmit_path, int transmit_ring,
>   				       int receive_path, int receive_ring);
> 
> base-commit: 48e989e33b715611438ce4b8d6ff712d4becd84f

