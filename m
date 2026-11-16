Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837276;
	b=BshcXA58z/Jl9JSNiIkDhWbdvPiUN5UIWMfH/ZNkOD/NnnZjV9gBJPLimikJVBXSSDAX
	 JXTM3yo6ZtsJuiPQHbbuGIlcnYwJ0OA7WiYjRYSAIX4veiBi2Y+pAno2nSKUQ+XBbnRxm
	 YTd4AAqRrHIyMutk7Fuq2S5TdkfWmdFZEh4e9yW6bUv9wiKzZHwOLFhXXdzkabW+T5OD0
	 +dccYTMFN6HLx3GSUKm5WIKePZ8LeJN7boo3wfBXBebvy3Y2jNV7W4kTAbR1otdImZaAI
	 XrkJ2y3mcpXMEguFqu+bDlfkQZiO5pLJ77rrJqLS1oUzmk//0StpWGUr1iFoMWWwMbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837276;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=t0vCWWTPkvwu94AAgs5iNxQ9S0DD+Z0UfxoWRg06VN0=;
	b=ObvaeKNyTQqikuY7ISLbKTKBxNYjeWjmc5zICzy6xRAWZ8B/vy0wB+UtK15SI8xeHS5E
	 UfUktZZojZAHTUi6pupUmnuhW7UFvmi28XM5k6kGozx1mPoMjWrKL1PSRjbfxUuRUinIM
	 dKWkb3tJdS8g1Qinl4oTCMklF+XkGnX3NiAdZHoLzMlVECpX2SfKrdIBBhpUCOsbWF4Ie
	 UF0xPYH2VhAV3w2pqJsT8teRRkF+Z5G+Y/iwBtT/6hXWKXMtvU7K54MemW8WxFNzJ+BQb
	 exE814elEsvip+I8Y9vf6gHK17M8/bFbEx2BoW7yTLZ2vKsRInyvJQbF09R9R2T+s1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GpDGO6sM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDB9606A881;
	Mon, 16 Nov 2026 13:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GpDGO6sM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22AE51F000C8;
	Mon, 16 Nov 2026 13:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837275;
	bh=t0vCWWTPkvwu94AAgs5iNxQ9S0DD+Z0UfxoWRg06VN0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GpDGO6sMlQBreQYCRJmJ/0bWNM80eG7deRFvxuXsexyqexCstLJbY3yeAurWnim+K
	 Onh6hgf0wZPsdhdKisWOHp2WLDoF0bSqzyT5SWU4XIIq50sF0AQFq8iAsv2zi91bdA
	 0FT0mvVjLxZdIhe863MwVK/j0wHEE5iVd8rzyXdbjsrvMUsoSTAvCnhHB7xfOZRe1z
	 +2yHIcAhx6n8gx/nAYvMF7rAB2dePai0CpnQtoMqH1kB9rLIZYb3S8MCKYiGKnxGV1
	 cGTSE1ss1HQcIcTx5FPMf6MCQyVVoz9oVveMO5d2h5DL73jeDqV0Vv0fqNjpoDscSL
	 JoSGwjdh+yi2Q==
Subject: Re: [PATCH net-next v2 1/2] ipv6: check mc_forwarding before calling
 ip6mr_get_route()
From: netdev-bot+sashiko@kernel.org
To: sunwenbo@cmss.chinamobile.com
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 hangbin.liu@linux.dev, liuhangbin@kylinos.cn, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, 1342116488@qq.com
Date: Mon, 16 Nov 2026 13:54:34 +0000
Message-ID: <179483727465.3136.6148701646538562238@kernel.org>
In-Reply-To: <20261112094630.197244-2-sunwenbo@cmss.chinamobile.com>
References: <20261112094630.197244-2-sunwenbo@cmss.chinamobile.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The fix only works when multicast forwarding is off.
- [Low] The commit fixes a reproducible, user-visible failure: on
  CONFIG_IPV6_MROUTE kernels with mc_forwarding at 0, `ip -6 route get…

--

ipv6: check mc_forwarding before calling ip6mr_get_route()

This commit makes the ip6mr_get_route() call in rt6_fill_node() depend
on devconf_all->mc_forwarding. With multicast forwarding disabled,
multicast route get queries with an iif then emit RTA_IIF and the normal
route attributes. The goal is to match IPv4 rt_fill_info() behavior.

> Signed-off-by: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
> Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>

[Severity: Low]
This fixes a user-visible "RTNETLINK answers: Message too long" from
ip -6 route get, but the commit has no Fixes: tag.

git blame traces the multicast ip6mr_get_route() branch in
rt6_fill_node(), which had no mc_forwarding check, back to:

commit 7bc570c8b4f7 ("[IPV6] MROUTE: Support multicast forwarding.")

Later commits changed that branch: fd61c6ba313d ("net: ipv6: remove
nowait arg to rt6_fill_node") reworked the error handling, and
22d0bd82cc7c ("ipv6: use rt6_info members when dst is set in
rt6_fill_node") changed the condition.

Could a Fixes: tag be added so stable backporters can tell which
releases need this?

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
>  			int err = ip6mr_get_route(net, skb, rtm, portid);
>  
>  			if (err == 0)

[Severity: Medium]
Does this cover only the forwarding-disabled case? The commit message
says the -ENODEV comes from skb->dev being NULL in the reply skb that
inet6_rtm_getroute() allocates. After this patch, skb->dev is still
never set.

In the iif branch of inet6_rtm_getroute(), dev is resolved and passed
to the lookup, but the reply skb only gets a dst:

net/ipv6/route.c:inet6_rtm_getroute() {
    ...
		dst = ip6_route_input_lookup(net, dev, &fl6, NULL, flags);
    ...
	skb = alloc_skb(NLMSG_GOODSIZE, GFP_KERNEL);
    ...
	skb_dst_set(skb, &rt->dst);
    ...
}

When a multicast routing daemon opens an mroute socket, ip6mr_sk_init()
does:

		atomic_inc(&net->ipv6.devconf_all->mc_forwarding);

After that the new check passes, and ip6mr_get_route() is still called
with a NULL skb->dev. On a cache miss, the (*,G) lookup guarded by
"if (!cache && skb->dev)" is skipped, and then:

net/ipv6/ip6mr.c:ip6mr_get_route() {
    ...
		dev = skb->dev;
		if (!dev || (vif = ip6mr_find_vif(mrt, dev)) < 0) {
			rcu_read_unlock();
			return -ENODEV;
		}
    ...
}

This happens even when the iif is a configured MIF.

In that setup, would "ip -6 route get <mcast> from <src> iif <dev>"
still return -EMSGSIZE? With the follow-up "ipv6: preserve
ip6mr_get_route() error in rt6_fill_node()" applied, it would return
-ENODEV instead, but the query would still fail.

For comparison, IPv4's inet_rtm_getroute() sets the device on the reply
skb:

		fl4.flowi4_iif = iif; /* for rt_fill_info */
		skb->dev	= dev;

This lets ipmr_get_route() find the VIF, then either queue an
unresolved entry or return the mroute data.

Should inet6_rtm_getroute() also set skb->dev = dev in its iif branch,
so that the "matching IPv4 behavior" claim also holds with
mc_forwarding enabled?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112094630.197244-1-sunwenbo%40cmss.chinamobile.com
