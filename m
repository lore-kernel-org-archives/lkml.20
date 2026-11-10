Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289979;
	b=P83UmaIRhU60DkIy+hs4H0ou0YMP8t6KzvqqAFJxiw/D1hW7cZGp1ZTZODsiDqLvWRJn
	 8dymelEqsuhJQ8bIxdohKEzIMQHUNC/IXnVob6nH9ITansLCUoIjqgNV1Ct3XxTHBUMYN
	 3z6Wz3B8mAUQi+i1ZSWk3Fj+jCxT8KU50gX3a0T6VV+TEI08MuhnMOe9cyrv6IhsrqFcY
	 gKD0q/BGFtrX2ahfSjyGvrKH57sSw4Ehh0RScOMeoV97rB61G1QYxUfFnnVpdZBeAA1E9
	 E+mM0Pn2693Qmy7Fz/rbcR4EdckbtTGLOWg6s+P44qGH7FQkbBXxeb4Bbp8Lj4qwzdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=W/ybTFMlizm6vgELuodGneY9jKwk3Dl6mMLfT2fPBOI=;
	b=WZ94ByQXmWyekwYyAviv1i6cZ2rw5kxW0JNMLYGxxqlZVV2o3QfjREqfAhvWKtZgGTZG
	 CR08aMbhq6hYVj1IXaVqyho5CstlEuzZktJ0WLIpPBuQvANl8TsSjSLWn6O5JC2uZUSNq
	 Z5ewGfkNeT5ou7yvKTO4bIA1SC/NGlY0YMP0n2Gi2Up/P++ueRi4eRgAdyWLOryF6NIxe
	 9l6e+YiZKFr1pyc8xyifPo63q1Le2fazchOM1p52Bf7jvHFzzG09U3iWQJ/7d0hCUpgqu
	 VMHvBR/SIV4MWzkCf9mglqP7ev/ZIHUS+mgXmE0pVp864XNmSSJig4uglztX/oGQkDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b="Op/3BlOO";
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65537606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65537606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=Op/3BlOO
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-702dedeb70dso823739eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1794289977; x=1794894777; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/ybTFMlizm6vgELuodGneY9jKwk3Dl6mMLfT2fPBOI=;
        b=Op/3BlOO5z1BVXx8CV6wx6CDJnKOg71o7r9Ke1h29kA1yqLRpjpZIXFPRnuO00WP8m
         rO8XX15QY5OYnH8FbvQDa/mqNMu4E6+EeltmIYz6bzcs84SrLmoKdwtED7BEmR8/Csk3
         Og3onNDQBSABbkmLIijS/epBsfnzk+3nMnRPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289977; x=1794894777;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W/ybTFMlizm6vgELuodGneY9jKwk3Dl6mMLfT2fPBOI=;
        b=b3xKStwVYMjIe2I39DBaj9ChaG2y9mMggCb7o46jAO7zdXtZd2bMpbCGjlbEfg6w9a
         xhZX5Lb0bk7/Th/lPPoBhauCo/2xsMsFLAShbinf6Z03sQ5a3o6Fgbrhz6EtJ2saT/r+
         nFVfORYD9yn4n2kQqFh9ZNc+mN2E9dccmwX3m9BTkUcjJGLSkpECpy4zyDa1EbdPp7h+
         BEaVmwfndMgaKyJm8NAYIvOSpOfjtTDiFYms0h79D2deRTfLDhKLyrLSjqfMvJ7j/Wqo
         L+rDKkMQRjN+12ZpoXYLLGXHPE8luieAWDOQ3o7A2t87p8vlQSNfiF+PSEwEWz/g0BOS
         30CA==
X-Forwarded-Encrypted: i=1; AL+hErEQ0dItl/0nhzwYd8Nef7nZnaz9jSAt20KnngLkykPrjThOVn6kEaBF4kzmmhqBVU/Twhes0Rb47NV+5Tg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dzC5RSv5bpl3x//CkCNjEiuTU+NuV7FH9yCPMJUGAZVivOuiN
	XsgZ3gLrxk/5uONRCXn0cN4lXGnhpAJ/sp3VVFMZXGsGNMgYrJ+Ab8+oN/S3ECljPWI=
X-Gm-Gg: AYBFou2XhWOnSGrMeASktsY5+rSHMuNjm37XEUYRO6dEcKg4N4CdQ5YNn1ThiYXuNA1
	lgAETXs+VxQi9ZsBnBonHwjwoAen+9B0hKiuPT/1D0gCfsrmyn1IiiGyEY3gRD6e1ERklWFgid/
	ZxQw5mGXxRzHyiDVgH0i9auvJ4X1EbaK9bdC72Id6QDSM+3yNV9oh4tOoZRkl4PCZ30pcjYWl+W
	VowSBhPRbeein9d+DNoX1mQyFVx/jEpO1CAseUp6Zns2UxwM0foEfZ0uuHikLiS8ysKR4SRHUst
	lMx+02zocQPFmU6Dgmlba2S0gz48EVZXdYoJtca9K/jjMzIPyfi1Yw9YTNzMlepZy0RzMGv9ApK
	j99ef2tyOCTlzhxVa1gEs4GBoEwkJqaaZej/e7oVV+e4uKzg2aJnDyL/PKV+cq4tFFFLny38Wkw
	syRWzlY6Nc0IIjlf0O+GKu/GtHMQ3KD5ygD2uiXm/uZ8iRk87QHTJtVPE7igSWUX6MmE/pJFGYu
	5l2i6H5zKpzD/DNKl25T6pKouHQzFvWjHmPepDk/DV75bKogdt8adsuqnJFt5rt/JyB2GHBDwlM
	Vv7wX1jKZUgPXe2uauGFBZf0FSElJRX42XLFTzaQWgckIPjskkAkRKYx/Dslf38gt3GEOMCSEXI
	QzD2OMUo=
X-Received: by 2002:a05:6820:a702:10b0:713:da3b:8fdc with SMTP id 006d021491bc7-718a55719d0mr535752eaf.32.1794289977231;
        Mon, 09 Nov 2026 21:52:57 -0800 (PST)
Received: from com-75606 ([199.47.143.1])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a40b8a9fsm1038285eaf.0.2026.11.09.21.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:52:57 -0800 (PST)
Date: Mon, 9 Nov 2026 21:52:53 -0800
From: Kyle Zeng <kylebot@openai.com>
To: netdev-bot+sashiko@kernel.org
Cc: dev@openvswitch.org, netdev@vger.kernel.org, aconole@redhat.com,
	echaudro@redhat.com, i.maximets@ovn.org, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: openvswitch: make transport checksums
 writable
Message-ID: <avKxNfqPgY6roDJy@com-75606>
References: <20261107040238.27606-1-kylebot@openai.com>
 <179411065171.994134.7555620955521911858@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179411065171.994134.7555620955521911858@kernel.org>

On Sun, Nov 08, 2026 at 04:04:11AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 � High: 0 � Medium: 1 � Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The patch handles every skb_ensure_writable() failure in
>   update_ip_l4_checksum() and update_ipv6_checksum()...
> 
> --
> 
> net: openvswitch: make transport checksums writable
> 
> This patch changes the IPv4 and IPv6 address rewrite helpers in Open
> vSwitch. Each L4 checksum update now calls skb_ensure_writable() first,
> instead of checking skb->len. A failure stays nonfatal, and packet
> pointers are reloaded afterwards because the skb head may have moved.
> 
> Link: https://lore.kernel.org/r/20261030042304.74291-1-kylebot@openai.com
> 
> > diff --git a/net/openvswitch/actions.c b/net/openvswitch/actions.c
> > index 12e339cbf7912..fe472e950cb1a 100644
> > --- a/net/openvswitch/actions.c
> > +++ b/net/openvswitch/actions.c
> > @@ -319,20 +319,22 @@ static int pop_nsh(struct sk_buff *skb, struct sw_flow_key *key)
> >  	return 0;
> >  }
> >  
> > -static void update_ip_l4_checksum(struct sk_buff *skb, struct iphdr *nh,
> > -				  __be32 addr, __be32 new_addr)
> > +static void update_ip_l4_checksum(struct sk_buff *skb, __be32 addr,
> > +				  __be32 new_addr)
> >  {
> > -	int transport_len = skb->len - skb_transport_offset(skb);
> > +	struct iphdr *nh = ip_hdr(skb);
> >  
> >  	if (nh->frag_off & htons(IP_OFFSET))
> >  		return;
> >  
> >  	if (nh->protocol == IPPROTO_TCP) {
> > -		if (likely(transport_len >= sizeof(struct tcphdr)))
> > +		if (likely(!skb_ensure_writable(skb, skb_transport_offset(skb) +
> > +					       sizeof(struct tcphdr))))
> >  			inet_proto_csum_replace4(&tcp_hdr(skb)->check, skb,
> >  						 addr, new_addr, true);
> 
> [Severity: Medium]
> Is it intended that every skb_ensure_writable() failure here is handled
> the same way as a truncated transport header?
> 
> skb_ensure_writable() can fail even when the full TCP header is in the
> packet. pskb_may_pull()->__pskb_pull_tail() returns NULL in three cases:
> pskb_expand_head(GFP_ATOMIC) fails, a frag_list skb_clone() fails, or the
> frags are unreadable:
> 
> net/core/skbuff.c:__pskb_pull_tail() {
>     ...
> 	if (!skb_frags_readable(skb))
> 		return NULL;
> 
> 	if (eat > 0 || skb_cloned(skb)) {
> 		if (pskb_expand_head(skb, 0, eat > 0 ? eat + 128 : 0,
> 				     GFP_ATOMIC))
> 			return NULL;
> 	}
>     ...
> }
> 
> pskb_expand_head(GFP_ATOMIC) can also fail later for a cloned skb.
> 
> In those cases the L4 checksum update is skipped. set_ip_addr() still
> updates the IP header checksum and writes the new address:
> 
> 	update_ip_l4_checksum(skb, old_addr, new_addr);
> 	addr = (__be32 *)(skb_network_header(skb) + addr_offset);
> 	csum_replace4(&ip_hdr(skb)->check, old_addr, new_addr);
> 	...
> 	*addr = new_addr;
> 
> set_ipv6_addr() does the same with memcpy(addr, new_addr, ...). Then
> set_ipv4() or set_ipv6() returns 0.
> 
> Would the packet then be forwarded with a rewritten pseudo-header and a
> stale TCP/UDP/ICMPv6 checksum?
> 
> With CHECKSUM_NONE or CHECKSUM_COMPLETE the checksum on the wire would be
> wrong. With CHECKSUM_PARTIAL (including GSO), the stale seed in th->check
> or uh->check would give a wrong final checksum for every segment.
> 
> The commit message says the reproducer relies on "natural allocation
> pressure". That is the same condition that would make this new
> skb_ensure_writable() call fail.
> 
> Other writers in the same file treat this failure as fatal. For example,
> set_tcp():
> 
> 	err = skb_ensure_writable(skb, skb_transport_offset(skb) +
> 				  sizeof(struct tcphdr));
> 	if (unlikely(err))
> 		return err;
> 
> set_udp() and set_sctp() do the same, so do_execute_actions() drops the
> skb with OVS_DROP_ACTION_ERROR.
> 
> Could the update be skipped only when skb->len - skb_transport_offset(skb)
> is smaller than the header size, with the skb_ensure_writable() error
> returned in all other cases? That would need set_ip_addr() and
> set_ipv6_addr() to return int.
> 
> The same pattern applies to the UDP branch here, and to the TCP, UDP and
> ICMPv6 branches in update_ipv6_checksum().
> 
> [ ... ]
> 
> -- 
> Sashiko AI review � https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261107040238.27606-1-kylebot%40openai.com

The full-header case is valid: if skb_ensure_writable() fails, the address rewrite can leave the transport checksum or CHECKSUM_PARTIAL seed stale.

But v2 intentionally keeps this failure nonfatal following the earlier review discussion:
https://lore.kernel.org/r/20261030042304.74291-1-kylebot@openai.com

Best,
Kyle
