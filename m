Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737230;
	b=xtpHVfVNvF9z3mM0y/eaF20aURzY2tNwrgXUhIa9B6Tsc6nHqxXPrNN90ilb6N4eetlG
	 7UguI3YXw/HCtNCeF3XhUIF0DkjhGTnBXH0brFP4bCHmPAlhJZGnQ7KIHkdd1DWgkeH4y
	 oljDGgWoT+iS36xX09knIKIU639dC7Os+3nwwZepxNVdz6io6isbailHW3fBjPngtgx4/
	 cjokTffAqshUnV/m4yQvyB19LhETudsg+gMZZe++KLLAqqfo0c0+LslSrlvltS6g6/Y+Z
	 7cJ9P/RC9ljkFlA0OHFcYWRQ6yBh+iQsvbGVP8lshgAmPU323nykbaf5sLJntRb7TSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737230;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=V+In7gmI1ji2UpEbRCQj7fypfCz9nawcGkzoWv2rtF8=;
	b=5tnIy0llqXVBQOjA6sYlyeleO5TlWAx35+cNWnFy8epTACZMLlpLM9G+D+4lUZsE/7l2
	 LPd65xAQw2SlaCGo9qaMndkXRrR+dmYsMGi5XjjN0NzPg3CGwuoG8HpORJQnHN3oNWER6
	 Xbqtgpa8VlWQi6ho72x+MT9mxTUqcEH1bAfwZpAk5xARZb18LZW4A+z/NMFgXbP8z+InL
	 5jZPwGq7fl5JA9Z503id8ZPk6Xsy+tEQGQGCJ6Bompl8Asn1zk13Qk7c3SCy9HfpgylC3
	 JTywUmO9HCIEmPHnm0l/7R6rwZDXsLmU4TxSNTKTw8QTJ32hJr9YLKtfrnnJH4cRsGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E6gpLYH2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88493606A323;
	Sun, 15 Nov 2026 10:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E6gpLYH2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4161F000C4;
	Sun, 15 Nov 2026 10:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794737230;
	bh=V+In7gmI1ji2UpEbRCQj7fypfCz9nawcGkzoWv2rtF8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=E6gpLYH22JqHqUtS0+M85cVkQUWnVMYFKhX5LXSQrPKGPnKqk22IDRt4g7++MK4uu
	 gDow/8FUMChYi3NHEoa8cKGe/s5AcDCXOA7E88fyhpuDuoL9GKj0+Yo+xDXBHNDRvx
	 j8DKTa9aZZ9mIjCjKCd5VDHRtWeplFHMdhIM8mPe2umqQz0x9EQ5Jx+f1LRdR0BMMw
	 3utFErsPXqjSwasZwuWbOefnyHHGRYdp+XHLuu3X1739NiBj3Kn6M6T2bXL6vNX4/K
	 1VevWBEWtKvzjxwgw5aRi3k3uxY7DcIBd/ZPv9wbsT2RvM0ls2JKlpwJPXwXloSjhc
	 /aUjXnjkdR28g==
Subject: Re: [PATCH net-next] ipv6: check mc_forwarding before calling
 ip6mr_get_route()
From: netdev-bot+sashiko@kernel.org
To: sunwenbo@cmss.chinamobile.com
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 1342116488@qq.com
Date: Sun, 15 Nov 2026 10:07:09 +0000
Message-ID: <179473722928.2199510.16768078668045707324@kernel.org>
In-Reply-To: <20261111094528.425826-1-sunwenbo@cmss.chinamobile.com>
References: <20261111094528.425826-1-sunwenbo@cmss.chinamobile.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The fix only works when no multicast routing daemon is
  running.
- [Medium] The patch says it aligns rt6_fill_node() with IPv4's
  rt_fill_info(), but it copies only half of the IPv4 condition.
- [Low] The commit fixes a user-visible netlink failure ('RTNETLINK
  answers: Message too long' from RTM_GETROUTE for an IPv6 multicast…

--

ipv6: check mc_forwarding before calling ip6mr_get_route()

With this patch, rt6_fill_node() calls ip6mr_get_route() only when
mc_forwarding is non-zero. A route get for a multicast destination with an
input interface then no longer fails with -EMSGSIZE when no multicast
routing daemon is running. The commit message says this aligns IPv6 with
the IPv4 rt_fill_info() behavior.

> Signed-off-by: Wenbo Sun <sunwenbo@cmss.chinamobile.com>

[Severity: Low]
Should this have a Fixes: tag, and possibly a Cc to stable?

The patch fixes a user-visible "RTNETLINK answers: Message too long" error
from RTM_GETROUTE. git blame shows that the ungated ip6mr_get_route() call
in rt6_fill_node() was added by:

commit 7bc570c8b4f7 ("[IPV6] MROUTE: Support multicast forwarding.")

The current err < 0 to nla_put_failure mapping came later, from
fd61c6ba313d ("net: ipv6: remove nowait arg to rt6_fill_node").
inet6_rtm_getroute() has never set skb->dev on the reply skb, so the
failure has been reachable since then.

Without a Fixes: tag, the stable tooling will not pick this up.

> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 04098cf32eabe..cb8cfd8b5c8b7 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -5862,7 +5862,8 @@ static int rt6_fill_node(struct net *net, struct sk_buff *skb,
>  #endif
>  	if (iif) {
>  #ifdef CONFIG_IPV6_MROUTE
> -		if (ipv6_addr_is_multicast(&rt6_dst->addr)) {
> +		if (ipv6_addr_is_multicast(&rt6_dst->addr) &&
> +		    atomic_read(&net->ipv6.devconf_all->mc_forwarding)) {

[Severity: Medium]
Doesn't this still return -EMSGSIZE whenever a multicast routing daemon is
running?

The commit message links "skb->dev is NULL" to multicast routing being
inactive. However, inet6_rtm_getroute() never sets skb->dev on the reply
skb, whatever the value of mc_forwarding:

net/ipv6/route.c:inet6_rtm_getroute() {
    ...
	skb = alloc_skb(NLMSG_GOODSIZE, GFP_KERNEL);
    ...
	skb_dst_set(skb, &rt->dst);
    ...
}

The iif device is resolved earlier with dev_get_by_index_rcu(), but it is
only used for ip6_route_input_lookup().

Because skb->dev is NULL, ip6mr_get_route() skips the (*,G) fallback, and
every cache miss ends up here:

net/ipv6/ip6mr.c:ip6mr_get_route() {
    ...
	cache = ip6mr_cache_find(mrt, &rt->rt6i_src.addr, &rt->rt6i_dst.addr);
	if (!cache && skb->dev) {
    ...
		dev = skb->dev;
		if (!dev || (vif = ip6mr_find_vif(mrt, dev)) < 0) {
			rcu_read_unlock();
			return -ENODEV;
		}
    ...
}

A cache hit also looks unlikely. The lookup uses rt6i_src and rt6i_dst of
the pcpu route. ip6_rt_copy_init() copies those from the FIB prefix (for
example ff00::/8), not from the queried S,G:

	rt->rt6i_dst = f6i->fib6_dst;

So when mc_forwarding != 0, the path is still:

inet6_rtm_getroute()
  rt6_fill_node()
    ip6mr_get_route()      -> -ENODEV
    goto nla_put_failure  -> -EMSGSIZE

The IPv4 code that the commit says it aligns with sets skb->dev in
inet_rtm_getroute():

	fl4.flowi4_iif = iif; /* for rt_fill_info */
	skb->dev	= dev;

For output lookups it uses net->loopback_dev. rt_fill_info() also passes
fl4->saddr and fl4->daddr to ipmr_get_route().

Would it make sense to also set skb->dev in inet6_rtm_getroute(), look up
the queried S,G, or stop mapping ip6mr_get_route() errors to -EMSGSIZE?
Any of these would also cover the case where a daemon is running.

[Severity: Medium]
Should this also exclude link-local and node-local multicast, as the IPv4
condition does?

rt_fill_info() in net/ipv4/route.c uses:

			if (ipv4_is_multicast(dst) &&
			    !ipv4_is_local_multicast(dst) &&
			    IPV4_DEVCONF_ALL_RO(net, MC_FORWARDING)) {

On IPv6, ip6_mc_input() never forwards loopback-scope or link-local
groups:

	if (atomic_read(&dev_net_rcu(skb->dev)->ipv6.devconf_all->mc_forwarding) &&
	    !(ipv6_addr_type(&hdr->daddr) &
	      (IPV6_ADDR_LOOPBACK|IPV6_ADDR_LINKLOCAL)) &&

This means no MFC state can ever exist for those groups.

With this patch, a query such as "ip -6 route get ff02::1 from fe80::1 iif
eth0" still reaches ip6mr_get_route() whenever mc_forwarding != 0. It gets
-ENODEV there and returns -EMSGSIZE. For the same kind of query, IPv4
returns RTA_IIF and a normal local route.

Also, rt6_dst->addr is the route prefix (typically ff00::/8 from
addrconf), not the queried group. Would a scope check need to test dest
instead in order to work?

>  			int err = ip6mr_get_route(net, skb, rtm, portid);
>  
>  			if (err == 0)

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111094528.425826-1-sunwenbo%40cmss.chinamobile.com
