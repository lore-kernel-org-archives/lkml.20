Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737599;
	b=x4UqVonXhGzlTDkBdMPzmsRYLr7fzFF8Lhw5WKEsRYoLVfx9mKTTF24n29r4dnz6AOS3
	 jyi4Lj8Zzh3OV4flZNDUieK847OrLM9RLeaF487gJTnQGdi6xp+Zz23EdUd26kg3LmAmq
	 Pbl5+msHHzz+xY3uQ+nCVnUeh1isHyTRsf0tKx1QddRvvpdk7fgRdSv9smwmb++IWtnVk
	 JskwqJ48tDG1NTw37XUVHwiCtUoff0TSv3TJ/bkAxSq5OomZPsg24B34pBmA8hlGUiLNj
	 9iD65JftkAqRHLSs4gZrp6kUEU91sh5898Dm59i0Avv0iVRPz4j7h7VU2netp+p1/8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737599;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=JClN30scvuHZt0OL4jRt3GcrPedNL0m1PyfS3mv6mhw=;
	b=XUUAkrRLCiB05OvTd/eLr8dQpEHCVbbCyy5O4cE4h3b+zDePVfnAUL140K0y3r5vXyaM
	 XcFaOHp90iwApiowwtpDdJh5zK8yuKMTOXED+QI3v0piTpGqTMImIvy939ADmsJXpclGq
	 YSU2IKUPDybO+JNiQjeIEUQu4d3tF7OY1j9O4SOArLFhwZhGoCgCOQb2SXajijZrpEl2r
	 5V/hNz1Xqt2qPJiW525bZhiqjr7KEgkpZtjANnUwGwL4BnmL6fU2LcHVZdYsFFPLy1g3V
	 wcUFHtGdno0si3F39DVTVjnExs9ytjz+v8I6ziz0D6sHaYLG2fzYUj9FDjkHLSRUyEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z5ORWFPb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32550606A31A;
	Sun, 15 Nov 2026 10:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z5ORWFPb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AFE81F000C4;
	Sun, 15 Nov 2026 10:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794737598;
	bh=JClN30scvuHZt0OL4jRt3GcrPedNL0m1PyfS3mv6mhw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Z5ORWFPb0g44qbff4L5kUgDBKrImV6JzRT0MlsNUsDyrR9y7sb0kZwHhw3zi9NpAl
	 A6GjF3jYv8Pb5QevAg9apCsbesBeTJixpaaTIoFJ0HFRHrW0onD9P+xXTaGTsQdjXc
	 LrtGXjxIJKJZzd/y3OlTPHrUuaSycoGRl5EeoZCJJDcEYKTCBYhx7KoFeYjF2EbBM1
	 CAMkqUO498DQB4e976ZqC6q9VlAnilgGhuJ39bTGVu1Wc1IFZm047GKiW+GbyMWRUm
	 atD+BJWee6+0ItTSuLYgzl2NcgtgSjGwoKXOrpiez/JKU/uKJgMqAkBWxN2Z+En6Ig
	 Ze3+80XlZi3KA==
Subject:
 Re: [PATCH] xfrm: avoid stale tunnel pointers in deferred input callbacks
From: netdev-bot+sashiko@kernel.org
To: yaojun8558363@gmail.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 steffen.klassert@secunet.com, herbert@gondor.apana.org.au, dsahern@kernel.org,
 idosch@nvidia.com
Date: Sun, 15 Nov 2026 10:13:17 +0000
Message-ID: <179473759755.2199510.14851805425930865959@kernel.org>
In-Reply-To: <20261111094629.230568-1-yaojun8558363@gmail.com>
References: <20261111094629.230568-1-yaojun8558363@gmail.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 9 potential
issue(s) to consider.

Critical: 0 · High: 2 · Medium: 1 · Low: 6

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The VTI callbacks look up the tunnel device in the wrong network
  namespace.
- [High] The underlay net_device pointer still dangles across the IP-TFS
  deferral, and the new lookup depends on it.
- [Medium] The new skb extension ID SKB_EXT_XFRM_TUNNEL takes the last
  available slot and makes every skb extension object bigger, and the…
- [Low] The build fails whenever CONFIG_XFRM=n.
- [Low] IP-TFS inner packets in freshly allocated skbs now get VTI
  processing, which is a behaviour change the commit message does not…
- [Low] The commit fixes a user-triggerable use-after-free but has no
  Fixes: tag (and no Cc: stable).
- [Low] The XFRM_TUNNEL_INFO_IP6 branch added to xfrm6_rcv_spi() is dead
  code, and its payload is never read.
- [Low] The new identity checks in vti_rcv_cb() and vti6_rcv_cb() read
  tunnel->parms fields (i_key, link, iph.saddr/daddr; or link, proto,…
- [Low] xfrm: vti_rcv_cb() and vti6_rcv_cb() return 1 on error when dev
  is gone

--

xfrm: avoid stale tunnel pointers in deferred input callbacks

This patch removes the ip_tunnel/ip6_tnl pointer that VTI stored in
skb->cb. In its place, scalar tunnel metadata goes into a new
SKB_EXT_XFRM_TUNNEL skb extension. The VTI receive callbacks then look up
the tunnel device by ifindex under RCU and recheck its parameters. If the
tunnel no longer matches, the packet is dropped.

> IP-TFS input can be deferred while its reordering queue waits for a missing
> sequence number. The VTI receive callback stores a pointer to the tunnel in
> skb->cb, and the device can be removed and freed before the callback runs.

[ ... ]

> Signed-off-by: Jun Yao <yaojun8558363@gmail.com>

[Severity: Low]
This fixes a use-after-free that users can trigger, but there is no Fixes:
tag or Cc: stable. Could one be added so stable maintainers know which
trees need the backport?

The problem being fixed does exist. In __input_process_payload(), the
"Reuse the received skb" path keeps the original skb->cb while the skb
sits in w_saved or waits for the drop_timer. That cb includes the raw
tunnel pointer stored by vti_input()/vti6_input_proto().

Nothing holds a reference on the VTI device during that wait, and
vti_rcv_cb() dereferences the pointer later. Async crypto completion
opens a similar window.

> diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> index 6787fcf6ac3e4..f97412b95c093 100644
> --- a/include/linux/skbuff.h
> +++ b/include/linux/skbuff.h
> @@ -5044,6 +5044,7 @@ enum skb_ext_id {
>  #endif
>  #ifdef CONFIG_XFRM
>  	SKB_EXT_SEC_PATH,
> +	SKB_EXT_XFRM_TUNNEL,
>  #endif
>  #if IS_ENABLED(CONFIG_NET_TC_SKB_EXT)
>  	TC_SKB_EXT,

[Severity: Medium]
Does this use up the last skb extension ID? With BRIDGE_NETFILTER, XFRM,
NET_TC_SKB_EXT, MPTCP, MCTP_FLOWS, INET_PSP and CAN all enabled, enum
skb_ext_id now has 8 entries. That is the limit checked in
skb_extensions_init():

	BUILD_BUG_ON(SKB_EXT_NUM > 8);

No further extension can be added without widening active_extensions.

There is also a size cost. skbuff_ext_cache objects are sized as
SKB_EXT_ALIGN_VALUE * skb_ext_total_length(), which is the sum over all
types. struct xfrm_tunnel_info is 52 bytes, which rounds up to 56. So the
new skb_ext_type_len[] entry makes every extension allocation in the
system 56 bytes larger, including sec_path, MPTCP, TC and CAN extensions.

The VTI and xfrm6 tunnel input paths also change from a plain cb store to
a GFP_ATOMIC skb_ext_add() or COW, with a new drop path when it fails.

Would a narrower fix avoid this system-wide cost, for example holding a
tracked netdev reference across the deferral? The commit message does not
mention any of these tradeoffs.

> diff --git a/include/net/xfrm.h b/include/net/xfrm.h
> index 445223a8dc6f1..defdd4088c552 100644
> --- a/include/net/xfrm.h
> +++ b/include/net/xfrm.h

[ ... ]

> @@ -740,14 +741,52 @@ struct xfrm_tunnel_skb_cb {

[ ... ]

> -#define XFRM_TUNNEL_SKB_CB(__skb) ((struct xfrm_tunnel_skb_cb *)&((__skb)->cb[0]))
> +static inline struct xfrm_tunnel_info *
> +xfrm_tunnel_info_add(struct sk_buff *skb)
> +{
> +	return skb_ext_add(skb, SKB_EXT_XFRM_TUNNEL);
> +}
> +
> +static inline const struct xfrm_tunnel_info *
> +xfrm_tunnel_info(const struct sk_buff *skb)
> +{
> +	return skb_ext_find(skb, SKB_EXT_XFRM_TUNNEL);
> +}
> +
> +static inline void xfrm_tunnel_info_clear(struct sk_buff *skb)
> +{
> +	skb_ext_del(skb, SKB_EXT_XFRM_TUNNEL);
> +}

[Severity: Low]
Does this build with CONFIG_XFRM=n? These inlines are not under any config
guard. SKB_EXT_XFRM_TUNNEL only exists under CONFIG_SKB_EXTENSIONS plus
CONFIG_XFRM. Also, skb_ext_add() and skb_ext_find() have no stubs in the
!CONFIG_SKB_EXTENSIONS branch of skbuff.h.

xfrm4_rcv_spi() and xfrm_tunnel_check() are always compiled and call
these helpers. Files like net/ipv4/ip_input.c, route.c, tcp_ipv4.c and
udp.c include <net/xfrm.h> unconditionally. CONFIG_XFRM is a hidden bool
that is only selected, so INET=y with XFRM=n is a valid config.

skb_sec_path() handles this with an #ifdef CONFIG_XFRM / return NULL
fallback. Could the new helpers do the same?

[ ... ]

> diff --git a/net/ipv4/ip_vti.c b/net/ipv4/ip_vti.c
> index c4f14d42df248..3594254df9de9 100644
> --- a/net/ipv4/ip_vti.c
> +++ b/net/ipv4/ip_vti.c
> @@ -58,10 +58,25 @@ static int vti_input(struct sk_buff *skb, int nexthdr, __be32 spi,

[ ... ]

> +		*info = (struct xfrm_tunnel_info) {
> +			.ifindex = tunnel->dev->ifindex,
> +			.i_key = tunnel->parms.i_key,
> +			.type = XFRM_TUNNEL_INFO_VTI4,
> +			.ip4 = {
> +				.link = tunnel->parms.link,
> +				.saddr = tunnel->parms.iph.saddr,
> +				.daddr = tunnel->parms.iph.daddr,
> +			},
> +		};
>
>  		if (update_skb_dev)
>  			skb->dev = tunnel->dev;

[ ... ]

> @@ -96,18 +111,28 @@ static int vti_rcv_proto(struct sk_buff *skb)
>
>  static int vti_rcv_cb(struct sk_buff *skb, int err)
>  {
> +	const struct xfrm_tunnel_info *info = xfrm_tunnel_info(skb);
>  	unsigned short family;
>  	struct net_device *dev;
>  	struct xfrm_state *x;
>  	const struct xfrm_mode *inner_mode;
> -	struct ip_tunnel *tunnel = XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip4;
> +	struct ip_tunnel *tunnel;
>  	u32 orig_mark = skb->mark;
>  	int ret;
>
> -	if (!tunnel)
> +	if (!info || info->type != XFRM_TUNNEL_INFO_VTI4)
>  		return 1;

[Severity: Low]
Is it intended that this changes which IP-TFS inner packets get VTI
processing? The commit message does not mention it.

iptfs_alloc_skb() allocates inner skbs with a zeroed cb. From the outer
skb it copies only dev and the extensions:

net/xfrm/xfrm_iptfs.c:iptfs_alloc_skb() {
    ...
		skb->dev = tpl->dev;
		__skb_ext_copy(skb, tpl);
    ...
}

Before this patch the cb tunnel pointer was NULL for those skbs, so
vti_rcv_cb()/vti6_rcv_cb() returned 1. They skipped the VTI policy check,
the switch of skb->dev to the VTI device, and the VTI stats. Only the
reused outer skb kept the pointer.

Now every inner skb gets the tunnel info through the shared extension.
They all go through xfrm_policy_check() with the i_key mark, then
skb_scrub_packet() and skb->dev = dev. As a result they can fail with
-EPERM, or appear on a different netdev than before.

Deferred packets are also now dropped when the VTI's i_key, link or
addresses change, not only when the VTI disappears as the commit message
says.

The new behaviour may be more consistent. Should the commit message
describe it?

>
> -	dev = tunnel->dev;
> +	dev = dev_get_by_index_rcu(dev_net(skb->dev), info->ifindex);
> +	if (!dev || dev->rtnl_link_ops != &vti_link_ops)
> +		return err ? 1 : -ENODEV;

[Severity: Low]
If the VTI device is gone or its parameters no longer match, should
the error call return 1 here?

When info->type is XFRM_TUNNEL_INFO_VTI4, vti_input() has already
claimed this packet. The cb_handler dispatchers in xfrm4_rcv_cb() and
tunnel4_rcv_cb() call the handlers in priority order and stop at the
first one that returns <= 0. A positive return means "not mine, keep
going".

Here is the sequence when the device disappears before the callback
runs:

xfrm_input()
  xfrm_rcv_cb(skb, family, xfrm_proto, 0)
    vti_rcv_cb(skb, 0)     -> lookup fails, returns -ENODEV
  goto drop
  xfrm_rcv_cb(skb, family, xfrm_proto, -1)
    vti_rcv_cb(skb, -1)    -> lookup fails again, returns 1
    xfrmi_rcv_cb(skb, -1)  -> next handler is consulted

The extension is still attached at that point, because
xfrm_tunnel_info_clear() only runs after a successful callback. An
earlier transform failure that jumps straight to the drop label ends
the same way.

The return value of 1 sends the dispatcher on to lower-priority
handlers such as xfrmi_rcv_cb(). If an xfrmi device matches by if_id
or collect_md, its rx_errors and rx_dropped get incremented for a
packet that belonged to the VTI. Before this patch, a non-NULL tunnel
pointer meant the error path always returned 0.

vti6_rcv_cb() has the same pattern with xfrm6_rcv_cb() and
tunnel6_rcv_cb().

Would it be better to return 0 whenever err is set and the extension
says VTI4/VTI6, and simply skip the stats update when the device can
no longer be found?

[Severity: High]
Is this lookup done in the right network namespace?

info->ifindex comes from tunnel->dev->ifindex, so it is an index in
dev_net(tunnel->dev). Here skb->dev is still the underlay device, for two
reasons. Every vti_input() caller passes update_skb_dev as false. On the
IP-TFS path, iptfs_alloc_skb() copies tpl->dev. So dev_net(skb->dev) is
the tunnel's link netns, not the netns the VTI netdevice lives in.

Cross-netns VTI is a supported setup:

net/ipv4/ip_vti.c:vti_newlink() {
    ...
	return ip_tunnel_newlink(params->link_net ? : dev_net(dev), dev, tb,
				 &parms, fwmark);
}

vti6_newlink() also sets nt->net = params->link_net ? : dev_net(dev).
Only the fallback devices are netns_immutable. A vti/vti6 device can be
created with a link netns, or moved with "ip link set vtiX netns B".

In that setup the lookup returns NULL and the callback returns -ENODEV.
xfrm_input() then drops the packet:

	err = xfrm_rcv_cb(skb, family, xfrm_proto, 0);
	if (err) {
		rcu_read_unlock();
		goto drop;
	}

That means every decapsulated packet on such a tunnel is thrown away,
including on the normal synchronous path. Before this patch these packets
were delivered through tunnel->dev. The remaining check still expects the
two namespaces to be able to differ:

	skb_scrub_packet(skb, !net_eq(tunnel->net, dev_net(skb->dev)));

The underlay netns could also hold a different vti device with the same
ifindex, for example one moved in from a third netns. Its tunnel is in a
different itn, so the -EEXIST duplicate check does not cover it. If its
i_key, link and addresses match, could the packet be attributed to that
device and injected into the wrong namespace?

vti6_rcv_cb() does the same lookup with dev_net(skb->dev), so it seems to
have the same problem.

[Severity: High]
On the deferred path, is skb->dev itself still safe to dereference here?

On the IP-TFS path the commit message describes, skb->dev is the underlay
device and nothing holds a reference on it. Packets wait in
xtfs->w_saved[] or ra_newskb until the drop_timer or a later in-order
packet drains them.

xfrm_iptfs.c has no dev_hold() or netdev_hold(), and xfrm_input() drops
its dev_hold() once x->type->input() returns -EINPROGRESS.
xfrm_dev_unregister() only flushes states offloaded to that device.
Software IP-TFS states and their queued skbs therefore survive
unregistration.

Suppose the underlay is deleted while packets are queued, for example
with "ip link del veth0". The drain path then reads freed memory:

iptfs_drop_timer() / iptfs_input_ordered()
  ...
    __input_process_payload()
      xfrm_input(skb, 0, 0, -2)
        net = dev_net(skb->dev)
        ...
        xfrm_rcv_cb()
          vti_rcv_cb()
            dev_get_by_index_rcu(dev_net(skb->dev), ...)

gro_cells_receive() uses skb->dev as well.

The dereference at xfrm_input() entry was there before this patch.
However, the patch is meant to fix "the device can be removed and freed
before the callback runs" on this exact path. The new lookup depends on
the same unreferenced pointer.

For the fix to be complete, does the device or the netns need to be
pinned across the deferral? That could be netdev_hold()/netdev_put(), or
storing a netns identity.

> +
> +	tunnel = netdev_priv(dev);
> +	if (tunnel->parms.i_key != info->i_key ||
> +	    tunnel->parms.link != info->ip4.link ||
> +	    tunnel->parms.iph.saddr != info->ip4.saddr ||
> +	    tunnel->parms.iph.daddr != info->ip4.daddr)
> +		return err ? 1 : -ENODEV;

[Severity: Low]
Can these reads race with tunnel reconfiguration? They are plain loads
under RCU only. Meanwhile ip_tunnel_update() rewrites saddr, daddr and
i_key in place under RTNL, and updates link with:

	WRITE_ONCE(t->parms.link, p->link);

Lockless readers such as ip_tunnel_lookup() use READ_ONCE(t->parms.link).
The new reads of parms.link here and in vti_input() do not, which KCSAN
would report.

vti6_tnl_change() also rewrites the 16-byte laddr/raddr with plain struct
stores, and vti6_rcv_cb() does not wait out the synchronize_net() in
vti6_update(). If the callback sees a half-updated parms set, packets in
flight (deferred or not) could be dropped with -ENODEV during
reconfiguration.

[ ... ]

> diff --git a/net/ipv6/xfrm6_input.c b/net/ipv6/xfrm6_input.c
> index 07edef2589844..9aed0b21d3b02 100644
> --- a/net/ipv6/xfrm6_input.c
> +++ b/net/ipv6/xfrm6_input.c

[ ... ]

> @@ -22,7 +23,28 @@
>  int xfrm6_rcv_spi(struct sk_buff *skb, int nexthdr, __be32 spi,
>  		  struct ip6_tnl *t)
>  {
> -	XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip6 = t;
> +	struct xfrm_tunnel_info *info;
> +
> +	xfrm_tunnel_info_clear(skb);
> +	if (t) {
> +		info = xfrm_tunnel_info_add(skb);
> +		if (!info) {
> +			kfree_skb(skb);
> +			return 0;
> +		}
> +
> +		*info = (struct xfrm_tunnel_info) {
> +			.ifindex = t->dev->ifindex,
> +			.i_key = t->parms.i_key,
> +			.type = XFRM_TUNNEL_INFO_IP6,
> +			.ip6 = {
> +				.link = t->parms.link,
> +				.proto = t->parms.proto,
> +				.laddr = t->parms.laddr,
> +				.raddr = t->parms.raddr,
> +			},
> +		};
> +	}

[Severity: Low]
This isn't a bug, but can the if (t) branch be reached? Every in-tree
caller passes NULL. xfrm6_rcv() calls xfrm6_rcv_tnl(skb, NULL), and
xfrm6_tunnel.c and xfrm_interface_core.c pass NULL to xfrm6_rcv_spi().
That makes the branch, its kfree_skb() error path, and the new
<net/ip6_tunnel.h> include dead code.

Even if the branch were reached, xfrm_tunnel_check() and xfrm_input()
only read type and i_key for XFRM_TUNNEL_INFO_IP6. vti6_rcv_cb() only
accepts XFRM_TUNNEL_INFO_VTI6. The ifindex, link, proto, laddr and raddr
fields written here are never checked or used.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111094629.230568-1-yaojun8558363%40gmail.com
