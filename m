Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794790052;
	b=WixwU07uCZiak6KHTFSJvBaDguKPBOP0XxEKTdtE4fNm6Vd9V5TItl0ASN6HSzI0vUxK
	 +2A0jOKyWYy8dWee8ZiNO46ZRtZ3lfS8VVBmGBPHbjTezPm2i40J62WhPAw28V2Z3KSbj
	 OAsHzbb3bgohCLsXf/VlnOTs4qymQVh4PYQbwl8UXAreuKsJRzSOAqmpxLwe+n9N7FmjK
	 1sheKDhntOEMR6AjIc6cWJZvsEyXp2lZn+g9ITQ8mVxvjVQc50xL70pjqJoPeGKHfyHCI
	 p4ii1i/xgcedXAC0Vq4z2pEVLZA36DfCitaOAEXJo2LjI2PstZv54Hm5Mf5HIawXbZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794790052;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=tXBNJhV2JVPO7xRWdzrt7Q5c46ZVzXaj/J1TQj/HRCc=;
	b=kIvw/cIPlSAhY/4lkKgEkjy3hvF7f43bALYSRnOO8bwPElyHyWCYqwFnl1cVe/O5g4qI
	 PLuKxAT9FaDfu1QuTSlxl36wmZ7Iul2hGb6vWBu9jnK613k/zn1S5IjXaSqQIYIZHqo3o
	 hCNvmCHHEbOf7G3EXt7ZOAsxP3R6A48GDeCiwdIe3a+hWrD9xR4C3eOMH9yo10OOaXCIG
	 D7/9AnFx6eSkHDHyQ9+wS/GeV0pu+cyO1cwZZe22TFowp8f3+6kq6HbuaUzRbascZdr6Q
	 d2LwP2J8j8d3MiRr8SXLXpfr26TQ1gsLEzl/XrxJH6L3nEGTazqBOVKQRTuzjx/9f0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cOpaTUZK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8FE606A332;
	Mon, 16 Nov 2026 00:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cOpaTUZK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D421F000C4;
	Mon, 16 Nov 2026 00:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794790052;
	bh=tXBNJhV2JVPO7xRWdzrt7Q5c46ZVzXaj/J1TQj/HRCc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cOpaTUZK0LvCsbtnUUynkZGp/Qhg3EGlxbpSj+Mwcln+jkVCJQS2ZUGZF329M85dU
	 NCYwVMc8Pjb9MWv3KGma3eOpD7ut0tqQvhFk9YAMIU1y9ykrgvKnetgfNZTIOZe/qF
	 XEYTw2LIg7x4N5DOA9MV6azo6dPpm/OxeMT8w0TNQkvNwkeq7BcP6MDfEMxRavWQeJ
	 edhHEejpZ7Kc+CuRcyWzNYc/q98XcTswjIOLZ8axdRJJsyyN8AmMcTYp4d25AzPtYF
	 IOERaaF5LGSCjelgnvlGXJweal9eDbngDtrpKAPOerj+eD1dvQnMr+GcMu5oV19DcI
	 KuvPJeCkdLmaQ==
Subject: Re: [PATCH net v5 3/4] ipmr: set up GSO state for tunnel vifs
From: netdev-bot+sashiko@kernel.org
To: julius@bairaktaris.de
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, dsahern@kernel.org,
 idosch@nvidia.com, willemb@google.com, steffen.klassert@secunet.com,
 jiayuan.chen@linux.dev, mfleming@cloudflare.com, almasrymina@google.com,
 bigeasy@linutronix.de, richardbgobert@gmail.com, ecree.xilinx@gmail.com,
 bsdhenrymartin@gmail.com, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 00:47:30 +0000
Message-ID: <179479005048.3136.13054780886372350388@kernel.org>
In-Reply-To: <cbd032be365b09f1108faed42ca165531d5dd99d.1794151759.git.julius@bairaktaris.de>
References: <cbd032be365b09f1108faed42ca165531d5dd99d.1794151759.git.julius@bairaktaris.de>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new early drop in the VIFF_TUNNEL branch of
  ipmr_prepare_xmit() (net/ipv4/ipmr.c:1959-1960, `if (skb_is_gso(skb)…

--

ipmr: set up GSO state for tunnel vifs

This commit sets up the GSO state in ip_encap() for VIFF_TUNNEL vifs. It
calls iptunnel_handle_offloads() and skb_set_inner_ipproto(), reserves one
outer IP ID per segment, and sets the outer length with iph_set_totlen().
It also drops GSO packets that are already marked as encapsulated before
they reach a tunnel vif.

> diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
> index 836f3f95b20c4..09d6b0ff1ffb7 100644
> --- a/net/ipv4/ipmr.c
> +++ b/net/ipv4/ipmr.c

[ ... ]

> @@ -1951,6 +1955,9 @@ static int ipmr_prepare_xmit(struct net *net, struct mr_table *mrt,
>  	}
>  
>  	if (vif->flags & VIFF_TUNNEL) {
> +		/* The inner headers can describe one tunnel only */
> +		if (skb_is_gso(skb) && skb->encapsulation)
> +			return -1;

[Severity: Medium]
Does this check also drop IPIP and SIT GRO aggregates that used to be
forwarded correctly?

ipip_gro_complete() in net/ipv4/af_inet.c and sit_gro_complete() in
net/ipv6/ip6_offload.c both set the encapsulation bit and the IPXIP4 GSO
type:

    skb->encapsulation = 1;
    skb_shinfo(skb)->gso_type |= SKB_GSO_IPXIP4;

ipip_gso_segment() and sit_gso_segment() only reject packets that lack
SKB_GSO_IPXIP4:

    if (!(skb_shinfo(skb)->gso_type & SKB_GSO_IPXIP4))
        return ERR_PTR(-EINVAL);

    return inet_gso_segment(skb, features);

Before this patch, an IPIP-in-IPIP or SIT-in-IPIP aggregate passed this
check. inet_gso_segment() then recursed through each IP layer and fixed
tot_len, id and the checksum at every level. The MTU check in
ip_finish_output_gso() also looked right, because
skb_gso_transport_seglen() counts the inner headers when encapsulation is
set.

With this patch, these packets return -1 before the route lookup. The
callers then free them with no MIB counter bumped:

ip_mr_forward()->ipmr_queue_fwd_xmit()
    if (ipmr_prepare_xmit(net, mrt, skb, vifi))
        goto out_free;
    ...
out_free:
    kfree_skb(skb);

ipmr_queue_output_xmit() behaves the same way.

The commit message says these packets are dropped "as segmentation
dropped it before". Is that only true for GRE and UDP tunnel GSO types
that do not carry SKB_GSO_IPXIP4?

This check is unchanged at the end of the series, so the later commit
"ipmr: do not drop GSO packets that fit the MTU after segmentation" does
not fix it. That later commit would otherwise let DF-set aggregates of
this kind through the MTU check, but this drop stops them first.

Would a narrower condition keep the previous behaviour for these
packets? For example, the drop could be skipped when gso_type already
contains SKB_GSO_IPXIP4.

>  		rt = ip_route_output_ports(net, &fl4, NULL,
>  					   vif->remote, vif->local,
>  					   0, 0,

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1794151759.git.julius%40bairaktaris.de
