Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794875812;
	b=uXLIFw1p9dbRKJAQPjCXUWkdk/xqL3Yu6t0j6dvgmIoNRqAXfnuX16fwME0wvyfJLKjv
	 NqmR8E99Xv8LNRWdYBiaicbAEOTol9wkCC2KGy2cZ8R5D0tmH4LVACx19oobTtSVPLRZW
	 DYTO1zeZN2Nx6QVJqZ8hjU3GD7o7kF8IUJY96rZtZQNf1N6dMU/SOArbCmfCDhORDC3wn
	 5sBBnsjLaQnJMi+nSMJu0bOV4/yWS7e1xYhtsCkoxdISwI10ekB5rPFicqtI4JEM3qftm
	 vz4j8x47sruC2zxVsaqtk8b6mlzPIBkGTjsfr/cVULA1EEo1jKLDKrS83mnN4Ejl83g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794875812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=dAow6FO08z+1bWF25pqpQ0WTRgtCceyYYLVadskSQE4=;
	b=A5LnD+wkqFcIzug+qKnO1lWj5rZlZ6aM1LDdWzP6BTC2oO1DxE/9J20sa8qa/3ZrYb92
	 JzkUz2m8MAqW7200g2wyHVOMd5De8JF4zEMWKrEGpwyoWeC9qMKPQKTmgKQpBzD4hsCCI
	 a7eunYVpNlkp857TdssFSYR/VRbMzBGbmNVk0M10VBBlhytTGKkkwpHcKo8T9NWE3JhL0
	 QqCIUDmuE9qtIW9/wDJ95ECoHtfw1F7bSyVZV9CEy9TbQo+wgyLYwbAeYUpQR8A6LM+hO
	 Wc8vkBTSQb0urqB9jRysZrkva/WIFgggR5glOMAbrP3g2bws+5ZO8DnuQXX5GQGoNyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nJ0EdzKt;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20D1606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D20D1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nJ0EdzKt
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b1755b2f26so3701768a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794875811; x=1795480611; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dAow6FO08z+1bWF25pqpQ0WTRgtCceyYYLVadskSQE4=;
        b=nJ0EdzKt1UhkpJvoDfcFKh3Nrq1meN/EOZZImoJu6BJbg1B3a8eZyGs00/6lKPnKfZ
         QUESClCcGgEbggY3lH8oij0+71nRujevTy+ccMw1HtdljG20ltvVe5G7th3/eg5oRpWh
         CDI8f3Cdg5dv3aqWLHvnZKxyU81V5rDP4+/Ss5iqOeYzdwWJ2yXK6MxIORpWlXc3HEF0
         N65u8ToCJbNSl/JFkiJst0q3Xw7w8N93S9i+BxHBEKBk40O0tXFyANOIU+PRK9Wg+6FB
         KBZ01UfeGGdA3hWwgztqsL7bHUG41sJo88IhtOc+HI2PU+HTzsXsggqxchSFBu55GFY1
         Hdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794875811; x=1795480611;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dAow6FO08z+1bWF25pqpQ0WTRgtCceyYYLVadskSQE4=;
        b=XfsV2n6lw4jI8gWUvmyhsoZazpGvPCVY0p605Y1aScMX4wDDRFjpvvEs3awPDzu5CF
         CjYCzGuJhFyLNKkEptRJXD9r2IYsV0gnJSW6MxDKa1OTDxZmdMYxVopfhUG+0iUUA59i
         fCH+rBaBodfdq81sseD1NF7/O4sH6csCL+/8WtpfmUvyEHqfPUR8QY5Y6Cj7/EQ++o99
         WuiLM4H9CTusw5gilKi33jmiRraYa5xtMcbWPv158DMxH1iEdIurDdFVHVBZGazPxWjF
         A/OdWejiUxSf93boturPbXZ2KsLhqpxrCHFAeIPBj7Z5PyU3osWKI/P2CsA7e7AXnGsr
         IlGg==
X-Forwarded-Encrypted: i=1; AL+hErFYlt9Z9WCRmDC1+HgBLY9t59zU52a1EdJdyr8t4pmEhHFs5U3KRE4bu/NHiL2oOxguE4DQR7FvcSEF4jM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8l7Rk3rcrW21fIEv1REZHfy6Aaf5u1Zvvw/hxrBN8YB5Rmthre
	sTPQEXhlVyfDpBdUhKoy4mSZpWckNEGPRLEfgzofl7wAurOCvpM1Oa2jNtf43NA/RNOPWJTjCJF
	Cn3udjA==
X-Received: from pjbgv4.prod.google.com ([2002:a17:90b:11c4:b0:3ae:983f:696f])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:56cb:b0:3b0:a9de:9880
 with SMTP id 98e67ed59e1d1-3b1b0a3c5e9mr10996961a91.33.1794875810799; Mon, 16
 Nov 2026 16:36:50 -0800 (PST)
Date: Tue, 17 Nov 2026 00:36:50 +0000
In-Reply-To: <20261112064624.15245-1-juanagusnicco@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112064624.15245-1-juanagusnicco@gmail.com>
Message-ID: <avuhR7Epvtgu--iT@google.com>
Subject: Re: [PATCH net] tcp_metrics: hash the destination address with SipHash
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Juan Agustin Niccolini <juanagusnicco@gmail.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, 12 Nov 2026 01:46:24 -0500, Juan Agustin Niccolini wrote:
> The tcp_metrics bucket is derived from a fold of the peer address.
> For IPv4 the fold is ipv4_addr_hash(), which returns the address
> unchanged. For IPv6 it is ipv6_addr_hash(), which XORs the four
> 32-bit words of the address. net_hash_mix() is only XORed in after
> that fold, so two addresses of either family with the same fold share
> a bucket in every netns.
> 
> A host owning an IPv6 /64 can thus compute, without knowing
> net_hash_mix(), addresses that collide with a chosen IPv4 or IPv6 peer:
> 
>   w3 = w2 ^ p0 ^ p1 ^ target    /* p0, p1: prefix, w2: free */
> 
> A bucket holds six entries and the seventh insert replaces the oldest.
> An off-path host can fill a peer's bucket with its own entries and
> later tell whether one was evicted, because tcp_init_metrics() seeds
> the initial RTO from the cached RTT. This reveals whether that peer,
> or another address in the same bucket, connected in the meantime.
> XOR and multiply is not a PRF, so net_hash_mix() can be recovered the
> same way, after which evictions leak about 14 bits of any client's
> address, depending on the number of buckets.
> 
> Hash the address with SipHash and a random key instead, as commit
> 2ee66e948717 ("inetpeer: randomize RB-tree node comparison using SipHash")
> did for inet_peer. net_hash_mix() and hash_32() are kept, to separate
> namespaces and to reduce the result to the table size.
> 
> Fixes: 51c5d0c4b169 ("tcp: Maintain dynamic metrics in local cache.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
> ---
> This can be exploited remotely to recover a client's IPv4 address.
> A single host narrows the address to about 262 thousand candidates,
> and because each netns keys the hash differently, intersecting buckets
> extracted from multiple hosts converges quickly into one candidate;
> 3-5 are enough. The net_hash_mix() value only needs to be extracted
> once per boot per host.
> 
> Many common cases facilitate this. For instance, a browser loading
> one page connects to several hosts within the same second. That
> supplies the buckets needed to converge, and the shared timing shows
> they belong to the same client.
> 
> I reproduced the bug on a QEMU guest running mainline (2a500a04d6f9) and
> against Ubuntu 24.04 over the internet. With the patch applied, the
> reproducer no longer finds addresses that share a bucket. The
> reproducer is available on request.
> 
> For stable: 5.10 and 5.15 lack siphash_aligned_key_t;
> "static siphash_key_t tcpm_hash_key __read_mostly __aligned(16);" can
> be used there.
> 
> This bug was discovered during an LLM-based code review.
> 
>  net/ipv4/tcp_metrics.c | 32 +++++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 7 deletions(-)
> 
> --- a/net/ipv4/tcp_metrics.c
> +++ b/net/ipv4/tcp_metrics.c
> @@ -8,6 +8,7 @@
>  #include <linux/init.h>
>  #include <linux/tcp.h>
>  #include <linux/hash.h>
> +#include <linux/siphash.h>
>  #include <linux/tcp_metrics.h>
>  #include <linux/vmalloc.h>
>  
> @@ -94,6 +95,23 @@
>  
>  static DEFINE_SPINLOCK(tcp_metrics_lock);
>  static DEFINE_SEQLOCK(fastopen_seqlock);
> +
> +static siphash_aligned_key_t tcpm_hash_key __read_mostly;
> +
> +static u32 tcpm_addr_hash(const struct inetpeer_addr *a)
> +{
> +	net_get_random_once(&tcpm_hash_key, sizeof(tcpm_hash_key));
> +
> +	if (a->family == AF_INET)
> +		return siphash_2u32((__force u32)a->a4.addr, a->a4.vif,

Isn't a->a4.vif always zero ?



> +				    &tcpm_hash_key);
> +
> +	return siphash_4u32((__force u32)a->a6.s6_addr32[0],
> +			    (__force u32)a->a6.s6_addr32[1],
> +			    (__force u32)a->a6.s6_addr32[2],
> +			    (__force u32)a->a6.s6_addr32[3],
> +			    &tcpm_hash_key);
> +}
>  
>  static void tcpm_suck_dst(struct tcp_metrics_block *tm,
>  			  const struct dst_entry *dst,
> @@ -270,13 +288,13 @@
>  	case AF_INET:
>  		inetpeer_set_addr_v4(&saddr, inet_rsk(req)->ir_loc_addr);
>  		inetpeer_set_addr_v4(&daddr, inet_rsk(req)->ir_rmt_addr);
> -		hash = ipv4_addr_hash(inet_rsk(req)->ir_rmt_addr);
> +		hash = tcpm_addr_hash(&daddr);
>  		break;
>  #if IS_ENABLED(CONFIG_IPV6)
>  	case AF_INET6:
>  		inetpeer_set_addr_v6(&saddr, &inet_rsk(req)->ir_v6_loc_addr);
>  		inetpeer_set_addr_v6(&daddr, &inet_rsk(req)->ir_v6_rmt_addr);
> -		hash = ipv6_addr_hash(&inet_rsk(req)->ir_v6_rmt_addr);
> +		hash = tcpm_addr_hash(&daddr);
>  		break;
>  #endif
>  	default:
> @@ -310,18 +328,18 @@
>  	if (sk->sk_family == AF_INET) {
>  		inetpeer_set_addr_v4(&saddr, inet_sk(sk)->inet_saddr);
>  		inetpeer_set_addr_v4(&daddr, inet_sk(sk)->inet_daddr);
> -		hash = ipv4_addr_hash(inet_sk(sk)->inet_daddr);
> +		hash = tcpm_addr_hash(&daddr);
>  	}
>  #if IS_ENABLED(CONFIG_IPV6)
>  	else if (sk->sk_family == AF_INET6) {
>  		if (ipv6_addr_v4mapped(&sk->sk_v6_daddr)) {
>  			inetpeer_set_addr_v4(&saddr, inet_sk(sk)->inet_saddr);
>  			inetpeer_set_addr_v4(&daddr, inet_sk(sk)->inet_daddr);
> -			hash = ipv4_addr_hash(inet_sk(sk)->inet_daddr);
> +			hash = tcpm_addr_hash(&daddr);
>  		} else {
>  			inetpeer_set_addr_v6(&saddr, &sk->sk_v6_rcv_saddr);
>  			inetpeer_set_addr_v6(&daddr, &sk->sk_v6_daddr);
> -			hash = ipv6_addr_hash(&sk->sk_v6_daddr);
> +			hash = tcpm_addr_hash(&daddr);
>  		}
>  	}
>  #endif
> @@ -818,7 +836,7 @@
>  	if (a) {
>  		inetpeer_set_addr_v4(addr, nla_get_in_addr(a));
>  		if (hash)
> -			*hash = ipv4_addr_hash(inetpeer_get_addr_v4(addr));
> +			*hash = tcpm_addr_hash(addr);
>  		return 0;
>  	}
>  	a = info->attrs[v6];
> @@ -828,7 +846,7 @@
>  		in6 = nla_get_in6_addr(a);
>  		inetpeer_set_addr_v6(addr, &in6);
>  		if (hash)
> -			*hash = ipv6_addr_hash(inetpeer_get_addr_v6(addr));
> +			*hash = tcpm_addr_hash(addr);
>  		return 0;
>  	}
>  	return optional ? 1 : -EAFNOSUPPORT;
