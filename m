Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899686;
	b=tXJ7GUWojGkT7iPms2jv8yRUV6qTM5h3zitP6ru8IDV1ZQu1LDpdMdszZJSpR9aPVK//
	 wixb90WyCMfF63NEgHXJoz6ScgstR3Z3EwXK9TWIpVUO9OuKQpa3X+fjttf0wTfbQ8vsD
	 Jz/calqADFlBrmNy5Bwtaqi1LP3l+nbGX+FLLJQm5T331UqTWTaNMu/81eJACALUfc3/v
	 knf/4UxOkmCHJopgdwRWJu77kcaTpxl0tPnmBRcdMZpFjjeXNNZyasVnr1UrjEt+XzAbo
	 6sCD45/LX9kblh9+uqxOw4+e4u/IV2sxgEobsmf4hl5ZLlUsAhfnEPtj/la3gZsVmBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899686;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=wvWGb0nlFITZI2PDNMPy58T/hNYeeGHJZcywmvOHuXU=;
	b=ZQiiv3Wcyqvx1izd2s/e7s0U2BlgaUKGPWjSro+P0tcOheSQdzVlVUPQ79RI0qaOpCsk
	 dgGBhJesMVFy5j3xK4dFFnUpNlCpsB54JXVDqA6U2AEt3oVxZyRA1XQWWLtiswjBdwqxv
	 Ly8uX/BcenNffj6l4B10IeNDHy7l/rqI8X97DZVlwy2LOw+c1zEoVLxghLWllSLlXMt8w
	 fJfMhUgK/VoGxSlXOoQiykj6M7do566oOKiBaN86CtCNIrFC62gSI6uOCJyTfs/p8RMjF
	 z/ejNMu4SJQRng05Goj/UfAM2E5DQgtrMGW5d7AHB6eUlymcqxe/6FXy7Dc999zmprw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=McQtsodz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ED2606A323;
	Tue, 17 Nov 2026 07:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=McQtsodz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4091F000C4;
	Tue, 17 Nov 2026 07:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794899686;
	bh=wvWGb0nlFITZI2PDNMPy58T/hNYeeGHJZcywmvOHuXU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=McQtsodzuHg5aBEbJlzCaAMucmgaAE3EHhLw7xs6yC6tgscoUF25N52FPjxadDAuu
	 45HzRmI69P1OyKFkYqTJK6VyYbl7Hd28JYWlEqbHGZK+4G8SzZess7+RfqZbeB3Jaa
	 x4T8p6FoJQ/qP11rs1G+HaaX3TP3Wn8+Pi3pMZuEp1FquK4zXxDQ6bjZq9aWw/66Zr
	 mqGM+NYTa/Zah2j00bzTEMABEBybgrX2MF8Pf48RhN/dKsYYF0YYiI1TN1o6VA9rl+
	 QxS5JWUwl3TVtVulkzFdNjM3+LJaOLHXvyBRBmiPpvTCtUE/zG/bpYuizKq/lWWkmX
	 YVLggW+9zVMTA==
Subject: Re: [PATCH net-next v3] ip6_gre: fix changelink conflict checks for
 L2 tunnels
From: netdev-bot+sashiko@kernel.org
To: yanxia@cmss.chinamobile.com
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, linux-kernel@vger.kernel.org, kuniyu@google.com,
 xeb@mail.ru, yana06070@163.com, netdev-bot+sashiko@kernel.org
Date: Tue, 17 Nov 2026 07:14:44 +0000
Message-ID: <179489968486.3136.18372818760197436344@kernel.org>
In-Reply-To: <179455350258.84965.17518172977020586093.ip6gre-v3@cmss.chinamobile.com>
References: <179455350258.84965.17518172977020586093.ip6gre-v3@cmss.chinamobile.com>
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

- [Medium] In ip6gre_changelink_common() (net/ipv6/ip6_gre.c), the new
  `if (!nt->parms.collect_md)` guard (line 2051) skips the duplicate…
- [Medium] After this patch, ip6gre_changelink_common() treats any
  ip6gre_tunnel_find(net, p_p, dev->type) hit on another device as…
- [Low] The patch fixes a user-visible bug in ip6gre_changelink_common()
  (net/ipv6/ip6_gre.c).

--

ip6_gre: fix changelink conflict checks for L2 tunnels

This patch changes ip6gre_changelink_common(). Ordinary devices are now
checked with ip6gre_tunnel_find() using dev->type, replacing
ip6gre_tunnel_locate(), which only searched ARPHRD_IP6GRE devices.
Metadata devices skip the duplicate search entirely. The encapsulation
setup now runs after the conflict and unregistering checks.

> Signed-off-by: Xia Yan <yanxia@cmss.chinamobile.com>

[Severity: Low]
This fixes a user-visible bug: received frames go to the wrong tunnel.
Could it carry a Fixes: tag?

The L2 changelink path has used ip6gre_tunnel_locate(net, &p, 0) since
the ip6gretap kind was added. That function hardcodes ARPHRD_IP6GRE:

	t = ip6gre_tunnel_find(net, parms, ARPHRD_IP6GRE);

That looks like it would be:

Fixes: c12b395a4664 ("gre: Support GRE over IPv6")

The notes say this was tested on net-next. Whether it should go through
net instead is for the maintainers to decide, since the fix also makes
some previously accepted configurations fail.

> diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
> index b5d6ed8f0c369..0a113bc8def95 100644
> --- a/net/ipv6/ip6_gre.c
> +++ b/net/ipv6/ip6_gre.c
> @@ -2046,28 +2046,25 @@ ip6gre_changelink_common(struct net_device *dev, struct nlattr *tb[],
>  	if (dev == ign->fb_tunnel_dev)
>  		return ERR_PTR(-EINVAL);
>  

[ ... ]

>  	ip6gre_netlink_parms(data, p_p);
>  
> -	t = ip6gre_tunnel_locate(net, p_p, 0);
> -
> -	if (t) {
> -		if (t->dev != dev)
> +	if (!nt->parms.collect_md) {

[Severity: Medium]
Does this guard also remove the existing duplicate check for L3 ip6gre
metadata devices?

Before this patch, every changelink went through
ip6gre_tunnel_locate(net, p_p, 0), which searched ARPHRD_IP6GRE devices.
So an ip6gre external device could not be moved onto the parameters of
an existing ip6gre tunnel:

  ip link add g1 type ip6gre local A remote B key 5
  ip link add md0 type ip6gre external
  ip link set md0 type ip6gre external local A remote B key 5

The last command used to fail with EEXIST. With this guard the search is
skipped and the command succeeds. ip6gre_changelink() then does:

	ip6gre_tnl_change(t, &p, !tb[IFLA_MTU]);
	ip6gre_tunnel_link_md(ign, t);
	ip6gre_tunnel_link(ign, t);

ip6gre_tunnel_link() puts md0 at the head of g1's bucket with
hlist_add_head_rcu(). ip6gre_tunnel_lookup() ignores collect_md and
returns the first score-0 match.

Would md0 then receive the traffic meant for g1?

The commit message gives "A duplicate can receive traffic intended for
the original tunnel" as the reason for the fix. The subject only
mentions L2 tunnels. The message does say metadata devices skip the
search "as newlink does", but it doesn't say this relaxes a check that
L3 ip6gre already had.

Was that intended? If so, could the commit message say so?

The same applies to L2: an ip6gretap or ip6erspan metadata device can
still be changed into a duplicate of an ordinary tunnel of the same type
and take its traffic. So changelink can still create duplicates; the
check only covers ordinary devices.

> +		t = ip6gre_tunnel_find(net, p_p, dev->type);
> +		if (t && t->dev != dev)
>  			return ERR_PTR(-EEXIST);

[Severity: Medium]
Can this reject an update to an ordinary L2 tunnel that doesn't change
its hash parameters, when a metadata device with the same parameters
exists?

For metadata devices, ip6gre_newlink() and ip6erspan_newlink() never
call ip6gre_tunnel_find():

	if (nt->parms.collect_md) {
		if (rtnl_dereference(ign->collect_md_tun))
			err = -EEXIST;
	} else {
		if (ip6gre_tunnel_find(net, &nt->parms, dev->type))
			err = -EEXIST;
	}

So a metadata device can be linked at the head of the same bucket as an
existing ordinary device with identical parms. For example:

  ip link add tap0 type ip6gretap
  ip link add tapmd type ip6gretap external
  ip link set tap0 type ip6gretap ttl 10

In the last command, ip6gre_netlink_parms() zeroes p_p, so laddr, raddr,
key and link all match tapmd. ip6gre_tunnel_find(net, p_p, ARPHRD_ETHER)
stops at the first match in the bucket, which is tapmd. So t->dev != dev
and this returns -EEXIST, even though tap0's hash parameters are
unchanged.

Before the patch the search used ARPHRD_IP6GRE. tapmd didn't match, and
the update succeeded.

The commit message says a match on a metadata device remains a
conflict. Is that meant to cover this case too, where the result
depends on bucket insertion order?

Returning the first match works for newlink, because the new device is
never in the table yet. Changelink needs "any match other than dev"
instead.

> -	} else {
> -		t = nt;
>  	}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/179455350258.84965.17518172977020586093.ip6gre-v3%40cmss.chinamobile.com
