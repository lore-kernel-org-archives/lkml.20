Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794790050;
	b=4doY5/CC6fvaT4AiDzXWwEBo345+GRcJjy9R/GPfqyyI5XqCg92w0Qytr2fAVfwjXDPn
	 TvNOsvaDX1yNRk8GhYSrIHyzolUB/CQox4fzGlPrdEsg6FEZNqZceBf3hUKrjwkGeUz8C
	 b6oeVGDL0yC6IEJRfZIL1XZUrgElD3iH5416NwsOuxLL79h195jDS9PngTpvuc7Qvw5Td
	 t45fWoGoBhcb+5m5TAnr/KhDwwjB66aUqZH9x7MbLL+Mz4NPia3ccR7lm3o1IWCf5Ge3y
	 +chJ5+bjDNoF/FK7ytVmaSSbY8Ktv2H+Ulo9eNfiuspa7j6TFLA410U6/guiZ6daSxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794790050;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=7kg4a3TEnZkxRSVDGnX2wLyGiqAZjqROKr48Wn6zfyw=;
	b=NPmlNeFQ8tbbBdic32DgT5lzj+XLDglYT2SM9HKibPi3cHZRfdGpOmMKhtAM3eC4OU5X
	 Gzyav/HtdCtJBpgtgzBZOJEdHD53TW4Fuce3QUIVHSGkDc/GXy7FR9heSN710skRnVHj9
	 CjLHwcMui04OI5dCZ+1YKaOSK/V3vyqyg8Bsaa4w9KL+JGhFx+jVzdhVoTMez+raGDxS7
	 0AKmEXGHT+C7m354P9M1mskizLWsvuqjAv4AGVMjpJ4k99FiZGTk9r+giXtZ9TV+snPft
	 L2fSTd2lgikH1WBM/QTWQwQ2aQwZVyySX3v9gNsWEGI2imPUKvDx7p82Rks2uxHYWVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G4CatkWg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B0D606A32F;
	Mon, 16 Nov 2026 00:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G4CatkWg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 628571F000C4;
	Mon, 16 Nov 2026 00:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794790050;
	bh=7kg4a3TEnZkxRSVDGnX2wLyGiqAZjqROKr48Wn6zfyw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=G4CatkWg/0ZzjXnKFPFquPsTV1UAdG+TiPtuE3sawb6i3LcbEfNHykTsJXFM4jqqu
	 Qx76BV3JddRMniNcvOT5LaR9oZn1LMjfTA8j2Kbl3vd0itrbez19PhB30bQEmZASLT
	 LShdzv9F4Fp3M/bRxsFnGP6QpQsq8oSXpPOL8PqeD8w/o3ClU3tO39BoCtEvOwAHoP
	 F8LAXIA4afavZTVj1RT5MSnOGyvKjIsEaPJz6gghxZs+E2XKc57IpOMLskkZL4ROG7
	 OvcKAv2WasiRrptIoSmS6VEmUnNIB6Zm4BDDfcqcGFhgufgPOhnyKTaEK7zw1pKy93
	 J7uy0NE6jr4PA==
Subject: Re: [PATCH net v5 2/4] net: gso: count the inner UDP header of
 encapsulated UDP GSO packets
From: netdev-bot+sashiko@kernel.org
To: julius@bairaktaris.de
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, dsahern@kernel.org,
 idosch@nvidia.com, willemb@google.com, steffen.klassert@secunet.com,
 jiayuan.chen@linux.dev, mfleming@cloudflare.com, almasrymina@google.com,
 bigeasy@linutronix.de, richardbgobert@gmail.com, ecree.xilinx@gmail.com,
 bsdhenrymartin@gmail.com, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 00:47:28 +0000
Message-ID: <179479004897.3136.15562972698220894623@kernel.org>
In-Reply-To: <e2348827189e5c00ec1bab50aa5e8fe5b8bc3b2a.1794151759.git.julius@bairaktaris.de>
References: <e2348827189e5c00ec1bab50aa5e8fe5b8bc3b2a.1794151759.git.julius@bairaktaris.de>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new encapsulated SKB_GSO_UDP_L4 case in
  skb_gso_transport_seglen() (net/core/gso.c) adds sizeof(struct udphdr)…

--

net: gso: count the inner UDP header of encapsulated UDP GSO packets

This commit changes skb_gso_transport_seglen() so that it adds
sizeof(struct udphdr) for encapsulated SKB_GSO_UDP_L4 packets, the same
way the unencapsulated branch does. Without it, each segment of a
tunnelled UDP GSO packet is counted 8 bytes short. As a result,
ip_forward() and ip_finish_output_gso() let DF segments that are slightly
too large leave without being fragmented.

> diff --git a/net/core/gso.c b/net/core/gso.c
> index b5bd269e56e4e..eb95c9d2819b1 100644
> --- a/net/core/gso.c
> +++ b/net/core/gso.c
> @@ -156,6 +156,8 @@ static unsigned int skb_gso_transport_seglen(const struct sk_buff *skb)
>  
>  		if (likely(shinfo->gso_type & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6)))
>  			thlen += inner_tcp_hdrlen(skb);
> +		else if (shinfo->gso_type & SKB_GSO_UDP_L4)
> +			thlen += sizeof(struct udphdr);

[Severity: High]
Does this cover encapsulated UDP GSO skbs that fraglist GRO builds?

The encapsulated branch computes its base as:

	thlen = skb_inner_transport_header(skb) -
		skb_transport_header(skb);

That only works if inner_transport_header has been set. On the UDP GRO
side, the only code that sets it is udp_gro_complete_segment():

net/ipv4/udp_offload.c:udp_gro_complete_segment() {
    ...
	if (skb->encapsulation)
		skb->inner_transport_header = skb->transport_header;
    ...
}

Take a receive device with NETIF_F_GRO_FRAGLIST and a UDP tunnel socket
such as VXLAN. The inner flow usually finds no socket in
udp_gro_receive(), so it is marked for fraglist:

	if (skb->dev->features & NETIF_F_GRO_FRAGLIST)
		NAPI_GRO_CB(skb)->is_flist = sk ? !udp_test_bit(GRO_ENABLED, sk) : 1;

On completion, the outer udp_gro_complete() clears encap_mark, sets
skb->encapsulation = 1 and calls the tunnel's gro_complete. The inner
udp4_gro_complete() then takes the fraglist branch and returns early:

	if (NAPI_GRO_CB(skb)->is_flist && !NAPI_GRO_CB(skb)->encap_mark) {
		udp_set_len(uh, skb->len - nhoff);

		skb_shinfo(skb)->gso_type |= (SKB_GSO_FRAGLIST|SKB_GSO_UDP_L4);
		skb_shinfo(skb)->gso_segs = NAPI_GRO_CB(skb)->count;
		...
		return 0;
	}

udp6_gro_complete() has the same branch. Neither of them reaches
udp_gro_complete_segment(). inet_gro_complete() and eth_gro_complete()
only set the inner network and mac offsets.

The resulting skb has encapsulation set, and its gso_type is
SKB_GSO_UDP_TUNNEL[_CSUM] | SKB_GSO_FRAGLIST | SKB_GSO_UDP_L4. Its
inner_transport_header is still 0, and transport_header points at the
outer UDP header.

Doesn't the subtraction above then wrap to (unsigned)(-T), where T is the
offset of the outer UDP header from skb->head?

With a normal gso_size, the network seglen would come out more than 100
bytes below the real value. ip_exceeds_mtu() in ip_forward() and
ip_finish_output_gso() would then still pass oversized DF segments.

If gso_size is smaller than T - 28, the value wraps to nearly 4G instead.
Valid packets would then get ICMP frag-needed or be dropped.

The commit message says segments "built by UDP GRO behind a tunnel
socket" are miscounted. The fraglist variant of that same setup still
gets the wrong length, so the added 8 bytes make no difference there. No
later patch in the series seems to touch net/core/gso.c or the udp
offload files.

Would it make sense to also set inner_transport_header in the fraglist
branches of udp4_gro_complete() and udp6_gro_complete() when
skb->encapsulation is set? At that point skb->transport_header should
point at the inner UDP header.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1794151759.git.julius%40bairaktaris.de
