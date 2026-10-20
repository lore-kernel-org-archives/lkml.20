Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792470492;
	b=nat7FCrB3kWs/PaZT0dppqPcL6uUi+p1cVNFmcpyUlRO/WmTHlzPl4fRTzh9qUf1L4Wy
	 OmPEVReKt5FN/iK+x6bgOAQmQfHNjqqtnKsG3E1Tc0uorxAuasPZwHIZjG9CGaPuyUEvr
	 A7CGzaK0GeyKxm5n23LR3lf0J5LA4pnYrvAWSJiRYYHais/DvzBh+tnOoi4gNA/0a/OwR
	 a6ADD3JKVLsYr4vaLhTpOWwilFZacZfZdC6TLYxFp3kKscns2AR/0aRp4oUXJ7L/b18tj
	 iXXyBb8aVSc3i4QYyx2Z83rXyrKHaL2PjawZBZVDbpuQUTV262P+UcMgnpb889XNqGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792470492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=bmehFgwVRnUa6nikz4hkDREK8DqOmKWW9Zk/XGD2B3A=;
	b=KmqD2ntSxlzzWOA54qVk87yS+lN7f8OGjJaKmfy2YjjXJfutSFwACyWRGMkh2jW6wI83
	 19P34f5tRwr2I+jcTgmlOYg9PzJAAsOLY6OmnnylD/6139CNzLsy6c4oxuK7CV0UMyzfj
	 R0hyXNsP1rkApNnTes3mXQ4S5N49oYX//IbE+NeNaa+fi4ZV0LQJeiW+s7UHK8SODSjF/
	 uA+pW+UQPxEUD3ivbLd3ryAc2/X6+jlTFldgB9J+JQ4WnkryikDz6A6qU4GYudZy/tJ9k
	 pVDfgEARf5WMfojsC6sdO8aDHyP543IrhYWWqpIt1/8uu8QeDddagmfdrY5nV0MtypQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="d4WUqqT/";
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F299606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F299606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=d4WUqqT/
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88629a452e0so1702397b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792470491; x=1793075291; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bmehFgwVRnUa6nikz4hkDREK8DqOmKWW9Zk/XGD2B3A=;
        b=d4WUqqT/ugdSV/vev8VVX+KiV9oN5rngtzS06jooCvYrn+rIgo1DA7lYkBfuKBLrcz
         4PQv/HHNZLQ74SAy3RBoE2SmV+7YEoWl05DTBtA8mQLGto0RJNaKPyGnuBHz+K27vkCN
         inzUrmNuz3kTBxzxTndkItq7X2qxPerm7viy8phPjyO10KT5cXXsrWIS4HE9awU8Mga1
         bIFyv/6jW5b9oe/ugmL6JQsQfkrhMTpPOTpsujNaCL2i7w8mcB/cRCgHlJIQm65c4q2P
         +gv24xa4VsVqcS3DsPzZYZ4sOAJ7GJqOURySWfpVfCHegtD+eA5uU0MnYuRxgDfU1fwd
         Yjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792470491; x=1793075291;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bmehFgwVRnUa6nikz4hkDREK8DqOmKWW9Zk/XGD2B3A=;
        b=bJlQetSF7u5veunRJUv4KCSlxksHWBqgXpdtcocMVopIEI5dwOn6mcEgONrPqymSAT
         uvOPdQGlfJTQDlCM4/mIUhoZtKj+M0Jf3Z2E4t76U+nkOfk3uwGhAOan8CfB8pijGvac
         hszgCJE74ZFKTT3bTE2ShQXQYAyXDoxYF00S3jSJvvssjIVGlRR/mYmINhlBcfgFOdy/
         FNXEo+psQE3JM1DnC7ZXxjYNquTCt9VN0rpd7M56sW4NkAIZfOzuc40uTv9Z0Pv2aYLA
         EWzzacJuWu6PKsWsUvNupi0esXMD1tmSCNr46h//mOjLnV0KW4iaiTlHm1QDuAg5L1Vu
         QRKw==
X-Forwarded-Encrypted: i=1; AKwUvBwhMLgRJ+PeT/C49Yxr+CKBgv1D84hj6Ly0Z8sW3UBe0+LPCffJSMTOyf2mzcc63Yt7Cst/G5bC0cUaCwc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSqX9vcVfa62Pi8nkuG39VzM6cCv7neeePQjOm5HycFds10yVp
	kn2OJy7wASFyCDbpRAaXT+i+wBQdUtBqYJOkIVWw3rLfnZZ6LMxOoGcsMXHiU1eoA0Jog4G007e
	7M9CaWw==
X-Received: from pfgu40.prod.google.com ([2002:a05:6a00:9a8:b0:887:5ba8:7334])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a8d:b0:899:53a9:1dd9
 with SMTP id d2e1a72fcca58-8a04d34d8b6mr7973176b3a.57.1792470490721; Mon, 19
 Oct 2026 21:28:10 -0700 (PDT)
Date: Tue, 20 Oct 2026 04:28:10 +0000
In-Reply-To: <20261019230758.2960779-1-joshdon@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019230758.2960779-1-joshdon@google.com>
Message-ID: <atbsxDZecXYSDBqH@google.com>
Subject: Re: [PATCH] udp: Add noinline_for_tracing annotation for udp{,_v6}_send_skb()
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Josh Don <joshdon@google.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, 19 Oct 2026 23:07:58 +0000, Josh Don wrote:
> We hook udp_send_skb() and udp_v6_send_skb() using BPF fentry programs
> to monitor UDP transmits. Both functions are static and have two
> callers: udp{,v6}_sendmsg() and udp{,_v6}_push_pending_frames().
> 
> After an FDO profile update, udp_v6_send_skb() is now inlined into
> udpv6_sendmsg(), while an out-of-line copy remains for
> udp_v6_push_pending_frames(). The fentry program still attaches
> successfully, but it is silently bypassed for all uncorked sends.
> 
> To address this, make both functions noinline explicitly for tracing,
> as was done for tcp_drop_reason() in commit dbd5e2e79ed8 ("net: tcp:
> Add noinline_for_tracing annotation for tcp_drop_reason()").

Unlike tcp_drop_reason(), udp_send_skb() is a hot function as
inlined by FDO.

Did you see how this change affects to udp_rr performance ?

Also, net-next is closed.
https://lore.kernel.org/netdev/7a0446eb-8539-4300-ae0b-a3d66a692cbc@redhat.com/


> 
> Assisted-by: LLM
> Signed-off-by: Josh Don <joshdon@google.com>
> ---
>  net/ipv4/udp.c | 4 ++--
>  net/ipv6/udp.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
> index b090bd1f59e86..487c8cc8ab206 100644
> --- a/net/ipv4/udp.c
> +++ b/net/ipv4/udp.c
> @@ -1110,8 +1110,8 @@ void udp_set_csum(bool nocheck, struct sk_buff *skb,
>  }
>  EXPORT_SYMBOL(udp_set_csum);
>  
> -static int udp_send_skb(struct sk_buff *skb, struct flowi4 *fl4,
> -			struct inet_cork *cork)
> +noinline_for_tracing static int
> +udp_send_skb(struct sk_buff *skb, struct flowi4 *fl4, struct inet_cork *cork)
>  {
>  	struct sock *sk = skb->sk;
>  	int offset, len, datalen;
> diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
> index 93478d1ad5769..fe92538835176 100644
> --- a/net/ipv6/udp.c
> +++ b/net/ipv6/udp.c
> @@ -1366,8 +1366,8 @@ static void udp6_hwcsum_outgoing(struct sock *sk, struct sk_buff *skb,
>   *	Sending
>   */
>  
> -static int udp_v6_send_skb(struct sk_buff *skb, struct flowi6 *fl6,
> -			   struct inet_cork *cork)
> +noinline_for_tracing static int
> +udp_v6_send_skb(struct sk_buff *skb, struct flowi6 *fl6, struct inet_cork *cork)
>  {
>  	struct sock *sk = skb->sk;
>  	int offset, len, datalen;
> -- 
> 2.56.0.212.g129ede20d9-goog
> 
