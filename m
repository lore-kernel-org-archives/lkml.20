Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794189756;
	b=i9ALgPu0Nrv5L8qC12X9Lkxs5+VVNJAt13Yqz32t3wzfQRXkc3Bf2cTV8sXidUFS+5+N
	 n0AaB8GCyTfD7uZzZ4dHy+leOygSL0r92mZLYztmTB7sQGz+L5/K1qXayUiNT0DTlAVtr
	 EsV+Qp1L2cUqElRhlxYNsE4Ede2II0vo9gbGm3w83lj5ZdqaZw/kxy/JpDVtks7xxrUka
	 FzI8oT2PJAX6ounSAOPHMoAqpn4KWNGSchT0n2kP7psj8uTTbutIReVqTkZpPL1qfImKM
	 mWGv9fFOXPBl+kikBWHTEaAUU42usCyZcumqcndRtPVqsHQRVoa/JcieOJdqESevTEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794189756;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FCY5yPy879EivQeygPsO+icoEH2zfLSwy7J7X4i8ETA=;
	b=gjYPtbgjijL23a6zTsfzdicOOKO0Y1X/5zJ57cZcsThwBsVet49YVNN6qMkkCT12Qqbt
	 F9JFPPtjIr0yM8yYhcwyFjUy2lrigHDggtIVOogWcyq3ISPsgdgDBfjs7vIisUbhP2GXf
	 50vMEdJHMqURJsKBrKscsX9lCldJOWY7Fo9T56WaIpB0NRjXixJMRHwG1Z3/kTGUdOdHH
	 pX4IkWQQvAfmYEPE5yYYHyHgswEvwp/vB6rGYNaFGF15WHUfxNkJ/L1QAQKyHGFS1Bkzc
	 4EpBOyLFkTuo3k62u6uwKrQSwfX8jXnXczH0GImBSwB0yoIQQ52cy1SV8io4cPV5JWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.116
Received: from mta1.migadu.com (out-116.mta1.migadu.com [95.215.58.116])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E00606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72E00606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GfGHTZ8GhZ/dheS3M4yY8zDNF5VgOSFkCOtjDoC13jo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794189752; v=1; x=1794794552;
 b=n35zYBd2zT5DCe4XqZgcKuz+bYL9BqLGHFI/uKBZqD5H+Mqqz2Vzf1MJ2EKZSYAEhJO8HJ6P
 H9XpVYO+KGZMQJucqGiYgvYx2FgS1el23vaG5fifbXeIQxhIRhNUD59lnfLEljw0eCXiTSr+r6x
 QDvEkKZ8Rk0vOg0WsKhVAY1k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 2413584100e8a086;
	Mon, 09 Nov 2026 02:02:32 +0000
X-Mizu-Trace-ID: 2413584100e8a086
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 10:02:25 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Yingjie Wang <1075151112@qq.com>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, linux-kernel@vger.kernel.org,
	ast@kernel.org
Subject: Re: [PATCH net v2] ipv6: reject routes without an inet6_dev
Message-ID: <avEpsZOaaT4qU5q5@fedora>
References: <tencent_3049FF6D9F23419F56589E244420973D2708@qq.com>
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
In-Reply-To: <tencent_3049FF6D9F23419F56589E244420973D2708@qq.com>

On Sun, Nov 08, 2026 at 03:09:36PM +0800, Yingjie Wang wrote:
> ip6_route_output() and ip6_route_lookup() can return an error-free route
> whose rt6i_idev is NULL.  Lowering an external nexthop device's MTU below
> IPV6_MIN_MTU tears down its inet6_dev, while fib6_ifdown() leaves routes
> using nexthop objects in the FIB.
> 
> An unprivileged user with CAP_NET_ADMIN in a private user and network
> namespace can construct this state.  Consumers which treat a route without
> an error as usable can then dereference the NULL rt6i_idev.  This was
> reproduced as a KASAN NULL pointer dereference in ip6_tnl_xmit().
> 
> A similar missing inet6_dev check was fixed in commit 1b9b5323725e
> ("netfilter: ip6t_rpfilter: reject routes without inet6_dev").  However,
> the route construction path still marks routes without an inet6_dev as
> successful, leaving every consumer responsible for the same check.
> 
> Acquire the inet6_dev reference before initializing the destination.  If a
> non-reject route has no inet6_dev, initialize it as RTN_UNREACHABLE instead
> of a successful route.  Explicit reject routes keep their original type and
> error.  This establishes that ordinary error-free IPv6 routes have an
> inet6_dev while retaining the existing defensive checks at callers.
> 
> The modified route object builds cleanly with W=1.  A full x86_64 KASAN
> bzImage build completes; it reports two pre-existing kernel-doc warnings
> outside this change.
> 
> Tests:
>   - `make W=1 net/ipv6/route.o`
>   - full x86_64 KASAN `bzImage` build with `W=1`
>   - KASAN QEMU with an unprivileged user and network namespace: after
>     lowering the MTU, the stale route returned `No route to host`, a normal
>     route still resolved, and the collect_md trigger completed without
>     KASAN, oops, or panic
>   - `tools/testing/selftests/net/ip6_tunnel.sh` in the same KASAN QEMU
> 
> Fixes: 5b98324ebe29 ("ipv6: Allow routes to use nexthop objects")
> Closes: https://lore.kernel.org/netdev/tencent_CB9E1044AC97882719FF3A9F5B410A562408@qq.com/
> Link: https://lore.kernel.org/netdev/DMP4WRIOGMBX.3VW2KNLBGDZ0K@gmail.com/

I think it should be

Closes: https://lore.kernel.org/netdev/DMP4WRIOGMBX.3VW2KNLBGDZ0K@gmail.com/

The Link tag usually added by the bot when maintainer apply your patch.

> Suggested-by: Alexei Starovoitov <ast@kernel.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Yingjie Wang <1075151112@qq.com>
> ---
> Changes since v1:
>   - Move the invariant into IPv6 route construction following Alexei
>     Starovoitov's review.
>   - Acquire `rt6i_idev` before destination initialization and preserve the
>     existing handling of explicit reject routes.
>   - Update `Fixes:` to the nexthop-object route support commit.
> 
> v1: https://lore.kernel.org/netdev/tencent_CB9E1044AC97882719FF3A9F5B410A562408@qq.com/
> 
>  net/ipv6/route.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 2eb884558c24..a4c792fc55e3 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -1165,6 +1165,12 @@ static void ip6_rt_init_dst(struct rt6_info *rt, const struct fib6_result *res)
>  		return;
>  	}
>  
> +	/* addrconf_ifdown() removed inet6_dev. The device can't do IPv6. */
> +	if (!rt->rt6i_idev) {
> +		ip6_rt_init_dst_reject(rt, RTN_UNREACHABLE);
> +		return;
> +	}
> +
>  	rt->dst.error = 0;
>  	rt->dst.output = ip6_output;
>  
> @@ -1200,10 +1206,10 @@ static void ip6_rt_copy_init(struct rt6_info *rt, const struct fib6_result *res)
>  	const struct net_device *dev = nh->fib_nh_dev;
>  	struct fib6_info *f6i = res->f6i;
>  
> +	rt->rt6i_idev = dev ? in6_dev_get(dev) : NULL;
>  	ip6_rt_init_dst(rt, res);
>  
>  	rt->rt6i_dst = f6i->fib6_dst;
> -	rt->rt6i_idev = dev ? in6_dev_get(dev) : NULL;
>  	rt->rt6i_flags = res->fib6_flags;
>  	if (nh->fib_nh_gw_family) {
>  		rt->rt6i_gateway = nh->fib_nh_gw6;
> 
> base-commit: 30c71476d842b094651bd7712f6c8ee8716147d0
> -- 
> 2.43.0
> 

The change looks good to me.

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
