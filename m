Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837277;
	b=C1OyW+MxolrF2HTPcn3qLdfW5ITK1AS0k9RGNzJwPkHaPQd0qwZ9oWmNo6IKyMLjxV+i
	 C5cFbQcxt3/WllfRw5DSTNAHqWbiIQ0e7yr4gbTaK8hH5tmQcS3FdyuARd6NbxQfD2PNz
	 BDNyek6PqHLoB9ipYPwuEOX8F68QnJeR2+etrVo6XQTzzaeDr66slz+1QderoMZL3JMw2
	 FWW0xBFGxV1SQsPYgwHzUuSKhx/jMjf6JFPgSTrj+Tt98sSAhCqxl8afeAcNyrtwH0bRO
	 q1u9KV/c7s6qbE99IcmQvVqQYnDYd2aRwZr2u/mKMGZ13x+ndGkCkHnsR+/GA53O0Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837277;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=JggSB6ekhFS9ZRgWZdXNb2Vb+145I6VBPjU4N4yalQY=;
	b=qU+60I5MDr3JIz5aqvkfhTpjnLDAEhm74d6LY2o2rsBqzHqKp03N2fWs5g1QAc9aUTgX
	 7dgpRwzp3ybYP0hFCnAFv4iJScyeuZAArlXUinCsDsQzNl8Tk+i1k/wi+H2n0LioZljH+
	 CGw2lhPVtkzdC/TUSW3p+DotKH5nqSgOvTLUlLXmfwMNua1TWsoVWaNvUyW02R60OdodB
	 IclZkBRIaEKQZ14xdqjF75HLujUgT2Zd5Yc7pEIyE9dse2E3YXNkEW0wsS68T+ZIDA9s4
	 ozVx4fvRIH9QoW9MQX+BLc12LGVg0x/hbSX1yWF91JLwKWtLO16CQr7kphtVMpihc+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KIRJnmC3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E9B606A896;
	Mon, 16 Nov 2026 13:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KIRJnmC3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F711F000C5;
	Mon, 16 Nov 2026 13:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837277;
	bh=JggSB6ekhFS9ZRgWZdXNb2Vb+145I6VBPjU4N4yalQY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KIRJnmC34sHnJy/vcVkOHMeemqVfTteiBWlkkJxQnLG7FBlgywxXHEblXp4b76HwZ
	 dV9SP50obR9XVWSPZJkvLPC75HaFMAz23GZwiknSp9HDOZqWIOdSXj2xlBByWLc9PY
	 foovWYZKD/+uYG6n0dAK1gPduziA11P9lmXfJAF2i6f98A6A0sGpTRGsWgPI8Gi+i8
	 owTxX5mdVDDtzfG/8bfg4RHy6C41q0oTqrhmtJeq/gD9UAI5WWwAz8+I0dH/ZC6hVD
	 pwYQhvJbu1aqnKAd/AtdJKr3qRTR7+GQw35nNAfI6/n1T1HQIPqvysKpxVT7PsS8Oo
	 TpP/+Owp77CQQ==
Subject: Re: [PATCH net-next v2 2/2] ipv6: preserve ip6mr_get_route() error in
 rt6_fill_node()
From: netdev-bot+sashiko@kernel.org
To: sunwenbo@cmss.chinamobile.com
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 hangbin.liu@linux.dev, liuhangbin@kylinos.cn, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, 1342116488@qq.com
Date: Mon, 16 Nov 2026 13:54:36 +0000
Message-ID: <179483727608.3136.10892831786069181339@kernel.org>
In-Reply-To: <20261112094630.197244-3-sunwenbo@cmss.chinamobile.com>
References: <20261112094630.197244-3-sunwenbo@cmss.chinamobile.com>
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

- [Medium] The patch does not deliver the 'actual failure reason' its
  commit message promises.
- [Low] The patch fixes a user-visible wrong errno (RTM_GETROUTE returns
  EMSGSIZE, 'Message too long', instead of the underlying…

--

ipv6: preserve ip6mr_get_route() error in rt6_fill_node()

With this patch, rt6_fill_node() returns the negative error from
ip6mr_get_route() to the caller. Before, it always returned -EMSGSIZE.
Attribute put failures still return -EMSGSIZE.

> Suggested-by: Hangbin Liu <liuhangbin@kylinos.cn>
> Signed-off-by: Wenbo Sun <sunwenbo@cmss.chinamobile.com>

[Severity: Low]
This fixes an errno that userspace can see, but there is no Fixes: tag.
It also isn't clear whether the patch is aimed at net or net-next.

The -EMSGSIZE that hides ip6mr_get_route() failures goes back to
commit 7bc570c8b4f75d ("[IPV6] MROUTE: Support multicast forwarding.").
Commit fd61c6ba313de6 ("net: ipv6: remove nowait arg to rt6_fill_node")
simplified that branch and kept it.

If this is meant for net, should it carry a Fixes: tag? If it is meant
as a net-next change to an errno visible to userspace, could the commit
message say so?

> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index cb8cfd8b5c8b7..fc4f4c1cda583 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c

[ ... ]

> @@ -5864,12 +5865,14 @@ static int rt6_fill_node(struct net *net, struct sk_buff *skb,
>  #ifdef CONFIG_IPV6_MROUTE
>  		if (ipv6_addr_is_multicast(&rt6_dst->addr) &&
>  		    atomic_read(&net->ipv6.devconf_all->mc_forwarding)) {
> -			int err = ip6mr_get_route(net, skb, rtm, portid);
> +			int ret = ip6mr_get_route(net, skb, rtm, portid);
>  
> -			if (err == 0)
> +			if (ret == 0)
>  				return 0;
> -			if (err < 0)
> +			if (ret < 0) {
> +				err = ret;
>  				goto nla_put_failure;
> +			}

[Severity: Medium]
Does this actually give userspace the real failure reason?

inet6_rtm_getroute() is the only caller that passes a non-zero iif. It
builds the reply skb without ever setting skb->dev:

net/ipv6/route.c:inet6_rtm_getroute() {
    ...
	skb = alloc_skb(NLMSG_GOODSIZE, GFP_KERNEL);
    ...
	skb_dst_set(skb, &rt->dst);
    ...
}

With skb->dev NULL, ip6mr_get_route() skips the (*,G) lookup. It then
returns -ENODEV every time there is no (S,G) cache entry:

net/ipv6/ip6mr.c:ip6mr_get_route() {
    ...
	cache = ip6mr_cache_find(mrt, &rt->rt6i_src.addr, &rt->rt6i_dst.addr);
	if (!cache && skb->dev) {
    ...
	if (!cache) {
    ...
		dev = skb->dev;
		if (!dev || (vif = ip6mr_find_vif(mrt, dev)) < 0) {
			rcu_read_unlock();
			return -ENODEV;
		}
    ...
}

So when mc_forwarding is enabled, RTM_GETROUTE for any multicast (S,G)
with no MFC entry now fails with "No such device". This happens whether
or not the iif is a registered MIF. It also happens even though
inet6_rtm_getroute() has just found the device with
dev_get_by_index_rcu().

The "ip -6 route get ff0e::1 from 2001:db8::3 iif d0" test in the
commit message seems to show this case: the device d0 exists, but the
reply is still "No such device".

inet6_rtm_getroute() already returns the same errno when the iif
ifindex doesn't exist:

	dev = dev_get_by_index_rcu(net, iif);
	if (!dev) {
		rcu_read_unlock();
		err = -ENODEV;
		goto errout;
	}

Because of that, userspace can't tell a missing interface from a
missing multicast cache entry.

The commit message says:

  "(for example -ENODEV, -ENOENT, -ENOMEM, or -ENOBUFS)"

-ENOMEM and -ENOBUFS only come from the alloc_skb() and
ip6mr_cache_unresolved() branch, and that branch needs a non-NULL
skb->dev. Can any caller reach them?

In practice the values that can occur look like:

  -ENODEV
  -ENOENT (no table, or mr_fill_mroute() on an unresolved entry)
  -EMSGSIZE
  -EINVAL (from the mr_fill_mroute() stub)

For comparison, inet_rtm_getroute() in net/ipv4/route.c does set the
device:

		skb->dev	= dev;

That lets ipmr_get_route() handle the (*,G) lookup and the unresolved
queue.

Should inet6_rtm_getroute() set skb->dev the same way? That would also
mean handling the async unresolved-queue path. Otherwise, should the
commit message be corrected, possibly with an extack message added?

>  		} else
>  #endif
>  			if (nla_put_u32(skb, RTA_IIF, iif))

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112094630.197244-1-sunwenbo%40cmss.chinamobile.com
