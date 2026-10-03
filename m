Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4F72744F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 19:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791055867; cv=none; b=Ku9uEutSpUsTuLYCxiIA8Ey9YluqMy+OFtnNU6LmJIHGfs/NuGzV4s8+8H/QjITECjOb84Uu7hbNdk1etR7nGJW7+bxPataKyEOef7fJDnp0xuK4GJHIFda9idc6xyHLCb9fYLw3KxunK0YqtA88OS866FHFbZRC0HtIlo2kTs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791055867; c=relaxed/simple;
	bh=ZElFYlTJytLPOtLoz2WTBpG5AcBBbeL5LukqcdZwsis=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OJ8WMlBFobB8eeatlK/4HxpRTW1KO67Okp0L1O7aEix/7fw0B7oM5Bq7K6aMcXcgzzWp3CDCoQpwnlsTePQBGkMuv6a+WrgMBPHnzPzOIRvX1EdmTZ7oD7mW7NV2HeLABogFfwk4FbH3vPbOjMuJtlZ5Vxx/piPXA13YmsYrDGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hp9oONDJ; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hp9oONDJ"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso589890a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 12:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791055864; x=1791660664; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1b1NAIb66+4gL0f+Lg3mVBb3spaxgJDZmnksBLtDWY=;
        b=Hp9oONDJwwQrGUs9SJVdZqXc2wWVdoI/1YH91UhXDyHufyuH0gitkibgBBLZkV4BNW
         oZBlBNJp8vw7iKTwd9yptL2leC1Kld7oH6nf0pNWvitlQqwGatElvH5CIuSBXq1SR6PY
         bnYFWuXNSWiLjNftCQZe7U0a/q+G17+FDyrE0Lu06TmSqvOTTT2ESElEkLJXUK95yQXr
         HqAyOuzW14wjhdG+XVD1ifHNjeK9bJ7RBTnvwcyQgbtMGn5Br7gMlrjL+2NLf0kEm7S4
         e4g+VxGa/1QRs2BPSqK+vETF7D/T43s8HZbwc13WWEx0f1Zt5eXtlZNFiEhPyYQtWkD7
         EL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791055864; x=1791660664;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1b1NAIb66+4gL0f+Lg3mVBb3spaxgJDZmnksBLtDWY=;
        b=CUhi35eY6AQjBNp/r3wTeGu8hF0ykYimOPj3GZO2XnItwddRHngF1CgAWSPeOsqyWK
         JYP+/HgcVIWxDylmdD3IdMngdLAJF+XchU3rtByfrR0+yiJXNZKm51mO5u3qPA2hK0GQ
         bs2JepMsM4u5bmaDkVS84lCrTENlxaZjuQM4dMQ4qYEK+YKpGCaIcqsTCrawThKnG9Jz
         47lgEQjQYGrl4bfX659JwIgGQwNNCHbIfCJ/IGubfqvqFTFpUDI5vfg98FNkO24hFJUD
         jK5SLL9haYij5uof7hQwTFlT0pCNb9I+MWiYZmtGtYZOqqdKvY8Gsx4lDqpPxqEL/3hC
         qbwQ==
X-Forwarded-Encrypted: i=1; AKwUvByxeciP6Z5t8tGPIhAY3HUsh3O8o8jAVQet09N7fm2mx9bm/Rb6nO0u9puVAwCYZmOKX9GLR3DVJl3CboI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8rwl9HY7u3pgRMAL4NPAlG9gBar3bhb5nc/9HkSGjplMvLKpW
	7qkZ2N+Q3Q6vwPodZkL0HDVTJfy9tNus8wfP6M9hfWWmMizW9AiExC+S7R/T27gj5NUouCQVuij
	FA6UxpQ==
X-Received: from pgag1.prod.google.com ([2002:a05:6a02:2f01:b0:cc7:cf2c:7b6c])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:33cc:b0:3a2:aec0:6bc2
 with SMTP id 98e67ed59e1d1-3a6ced50989mr5631016a91.53.1791055863553; Sat, 03
 Oct 2026 12:31:03 -0700 (PDT)
Date: Sat,  3 Oct 2026 19:30:58 +0000
In-Reply-To: <20261001182136.33-1-andrea.mayer@uniroma2.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001182136.33-1-andrea.mayer@uniroma2.it>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003193103.1178658-1-kuniyu@google.com>
Subject: Re: [PATCH net] ipv6: rpl: unclone the skb before modifying the packet
From: Kuniyuki Iwashima <kuniyu@google.com>
To: andrea.mayer@uniroma2.it
Cc: benquike@gmail.com, davem@davemloft.net, dsahern@kernel.org, 
	edumazet@kernel.org, horms@kernel.org, idosch@nvidia.com, kuba@kernel.org, 
	kuniyu@google.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, sashiko-bot@kernel.org, stefano.salsano@uniroma2.it
Content-Type: text/plain; charset="UTF-8"

From: Andrea Mayer <andrea.mayer@uniroma2.it>
Date: Thu,  1 Oct 2026 20:21:36 +0200
> ipv6_rpl_srh_rcv() modifies the packet data, such as Segments Left and
> the destination address, without checking whether the skb is cloned.
> The skb may be cloned, for example by an AF_PACKET socket receiving on
> the ingress device. ipv6_rpl_srh_rcv() then writes into the packet data
> shared with the clone. A read from that socket can return the modified
> packet instead of the received one.
> 
> The only pskb_expand_head() in the function runs after Segments Left and
> the destination address are written, and only when Segments Left reaches
> 0 or there is not enough headroom.
> 
> Call pskb_expand_head() on a cloned skb before the packet is modified
> (i.e., before Segments Left is decremented), as ipv6_srh_rcv() does.
> On failure, drop the packet with SKB_DROP_REASON_NOMEM.
> 
> Fixes: a2f4c143d76b ("ipv6: rpl: Fix Route of Death.")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260925133807.32-1-andrea.mayer%40uniroma2.it
> Signed-off-by: Andrea Mayer <andrea.mayer@uniroma2.it>
> ---
>  net/ipv6/exthdrs.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/net/ipv6/exthdrs.c b/net/ipv6/exthdrs.c
> index 09a4552f7f08..8fcf18e6114d 100644
> --- a/net/ipv6/exthdrs.c
> +++ b/net/ipv6/exthdrs.c
> @@ -548,6 +548,17 @@ static int ipv6_rpl_srh_rcv(struct sk_buff *skb, struct inet6_dev *idev)
>  		return -1;
>  	}
>  
> +	if (skb_cloned(skb)) {
> +		if (pskb_expand_head(skb, 0, 0, GFP_ATOMIC)) {

ipv6_rpl_srh_rcv() already has pskb_expand_head() call later
and I think this can be merged there.


> +			__IP6_INC_STATS(net, ip6_dst_idev(skb_dst(skb)),
> +					IPSTATS_MIB_OUTDISCARDS);
> +			kfree_skb_reason(skb, SKB_DROP_REASON_NOMEM);
> +			return -1;
> +		}
> +
> +		hdr = (struct ipv6_rpl_sr_hdr *)skb_transport_header(skb);
> +	}
> +
>  	hdr->segments_left--;
>  	i = n - hdr->segments_left;

This and the later swap(ipv6_hdr(skb)->daddr, ohdr->rpl_segaddr[i])
only modify the header before the existing pskb_expand_head().

Also this seems wrong because skb_postpull_rcsum() is applied to
the modified header, which should corrupt checksum.

I think we can merge the clone check and pskb_expand_head() with
skb_cow() and tmp IPv6 buffer like this.

compiled only:

---8<---
diff --git a/net/ipv6/exthdrs.c b/net/ipv6/exthdrs.c
index 09a4552f7f08..af285edd4d16 100644
--- a/net/ipv6/exthdrs.c
+++ b/net/ipv6/exthdrs.c
@@ -485,6 +485,7 @@ static int ipv6_rpl_srh_rcv(struct sk_buff *skb, struct inet6_dev *idev)
 	struct net *net = dev_net(skb->dev);
 	struct ipv6hdr *oldhdr;
 	unsigned int chdr_len;
+	struct in6_addr addr;
 	unsigned char *buf;
 	int accept_rpl_seg;
 	int i, err;
@@ -548,9 +549,6 @@ static int ipv6_rpl_srh_rcv(struct sk_buff *skb, struct inet6_dev *idev)
 		return -1;
 	}
 
-	hdr->segments_left--;
-	i = n - hdr->segments_left;
-
 	buf = kcalloc(struct_size(hdr, segments.addr, n + 2), 2, GFP_ATOMIC);
 	if (unlikely(!buf)) {
 		kfree_skb(skb);
@@ -559,6 +557,8 @@ static int ipv6_rpl_srh_rcv(struct sk_buff *skb, struct inet6_dev *idev)
 
 	ohdr = (struct ipv6_rpl_sr_hdr *)buf;
 	ipv6_rpl_srh_decompress(ohdr, hdr, &ipv6_hdr(skb)->daddr, n);
+	ohdr->segments_left--;
+	i = n - ohdr->segments_left;
 	chdr = (struct ipv6_rpl_sr_hdr *)(buf + ((ohdr->hdrlen + 1) << 3));
 
 	if (ipv6_addr_is_multicast(&ohdr->rpl_segaddr[i])) {
@@ -575,28 +575,24 @@ static int ipv6_rpl_srh_rcv(struct sk_buff *skb, struct inet6_dev *idev)
 		return -1;
 	}
 
-	swap(ipv6_hdr(skb)->daddr, ohdr->rpl_segaddr[i]);
+	addr = ohdr->rpl_segaddr[i];
+	ohdr->rpl_segaddr[i] = ipv6_hdr(skb)->daddr;
 
-	ipv6_rpl_srh_compress(chdr, ohdr, &ipv6_hdr(skb)->daddr, n);
-
-	oldhdr = ipv6_hdr(skb);
+	ipv6_rpl_srh_compress(chdr, ohdr, &addr, n);
 
 	skb_pull(skb, ((hdr->hdrlen + 1) << 3));
-	skb_postpull_rcsum(skb, oldhdr,
+	skb_postpull_rcsum(skb, ipv6_hdr(skb),
 			   sizeof(struct ipv6hdr) + ((hdr->hdrlen + 1) << 3));
 	chdr_len = sizeof(struct ipv6hdr) + ((chdr->hdrlen + 1) << 3);
-	if (unlikely(!hdr->segments_left ||
-		     skb_headroom(skb) < chdr_len + skb->mac_len)) {
-		if (pskb_expand_head(skb, chdr_len + skb->mac_len, 0,
-				     GFP_ATOMIC)) {
-			__IP6_INC_STATS(net, ip6_dst_idev(skb_dst(skb)), IPSTATS_MIB_OUTDISCARDS);
-			kfree_skb(skb);
-			kfree(buf);
-			return -1;
-		}
-
-		oldhdr = ipv6_hdr(skb);
+	if (unlikely(skb_cow(skb, chdr_len + skb->mac_len))) {
+		__IP6_INC_STATS(net, ip6_dst_idev(skb_dst(skb)), IPSTATS_MIB_OUTDISCARDS);
+		kfree_skb_reason(skb, SKB_DROP_REASON_NOMEM);
+		kfree(buf);
+		return -1;
 	}
+
+	oldhdr = ipv6_hdr(skb);
+
 	skb_push(skb, chdr_len);
 	skb_reset_network_header(skb);
 	skb_mac_header_rebuild(skb);
@@ -605,6 +601,7 @@ static int ipv6_rpl_srh_rcv(struct sk_buff *skb, struct inet6_dev *idev)
 	memmove(ipv6_hdr(skb), oldhdr, sizeof(struct ipv6hdr));
 	memcpy(skb_transport_header(skb), chdr, (chdr->hdrlen + 1) << 3);
 
+	ipv6_hdr(skb)->daddr = addr;
 	ipv6_hdr(skb)->payload_len = htons(skb->len - sizeof(struct ipv6hdr));
 	skb_postpush_rcsum(skb, ipv6_hdr(skb),
 			   sizeof(struct ipv6hdr) + ((chdr->hdrlen + 1) << 3));
---8<---
