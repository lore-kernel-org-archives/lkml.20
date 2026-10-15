Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DFB396D25
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792033015; cv=none; b=NZY2fjX86WClIoT6k7zqHNwlq+DRZNjw00ijB7/aAEUJcQEVDp4C8eR45AlXA+K9yc/zgYAp2wPQHZsCnQILcMJdOZPsLc0hTX0g17jmvZWLk/GT0qSCCMq5sKt9qOJ3hwuJ709ZCZpgDZ2pfL9rwwsgf1ydcghdvRyQHqPo8Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792033015; c=relaxed/simple;
	bh=Ik3XO3cvIHw8bldp6m6yNBXukW/O+5KtzSL7EbNcoyY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=rZ3b/zN5t5Ajy9D7lHox+Y7z/dp3lzgVo+SnRa5k8t7DeMdxwnJxRBIi55kXXVdSCXXnB3AMm/9wrYI5Jfh+ieeZzZxILpRCeXLLCE3A/nZ1sxVa95zjsiBGBrtTx0AnIxyrvIqQ6p46sEb8+ePGhk4t/Np9krX89wN+xN5QPxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8KLspHI; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8KLspHI"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7bf5f3736d2so623785137.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792033012; x=1792637812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TNTxQfUgCJOsnMTQyE07oReChsZlTt8qxDE8Jve+7bo=;
        b=h8KLspHItMLT1Ts0hdrDVycYy9gSI1JtuQyniz71hkHseexIH9uLoyvLEK+tJlPeSy
         jazmb2XFviCJCPme+In4kTDP5AJEtLxNU2PRwcAdXJOA7ofSUeX3+hF5R3N5gRU82+k4
         g1GVgi0HWsvOwHCYUkgOVrOn0SjKTCZaXmH3YRbaz1qkZTpMU1d3z4RsyUfYF4D8alTt
         fon97SYhVVkdw3GjgLxZPsTp2I8BtIxePE6BsQed76aXeZL7S14wWz2MrAmDceBQgPhS
         G1oneyMRPB0QDvzcufeCjnbLtqW8hKzjenp8uZ3BN779KN2QGWnZxcZLgZaxMt1VvciD
         428g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792033012; x=1792637812;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TNTxQfUgCJOsnMTQyE07oReChsZlTt8qxDE8Jve+7bo=;
        b=dYq/csYh+1ZpRGuTzuZnZWAYMVUAfWsOw02EHDggXRt68FPY6LiPwKiHxx+U2Kl9t+
         FWpsArUphm3uOo8UFvjq6AdqC+fI8/IV+OvgqkFFN88Sr25+ehuln/1lmNFHUSQo3rHF
         cVs/n/Oe4UuttCYRn07EC8JNRCskD4/2sygjOPJtdfWRVD2rmnWVwwcqNO9B238RommE
         +FU71JVDHEVuALSWE+6UqJmtDsGNBdWAp+SOvhh6LnN5PLNe5pQmj6TGaw/JgdBYtpYi
         ZKtXHEnUdpo9qFJQfwchmHr56OToezoHhv6Owv34PSgNK8R0Sv3YsBQpdTHhh960uQrn
         uh9w==
X-Gm-Message-State: AFq9FYLdQnJQxuKBTqLhAiyGuf9zp1Wnb+6aimKlVxq40YL17yRZwxpm
	PzqcfeKtxvdX/s8vO5tLsEHgp/MJyUr/9mxsMCnrd3zEAZiX5bpeKJ5QEIABvg==
X-Gm-Gg: AYBFou1U41vaK5swV/C4TWNeZoYAwn0xilI574LQGO+MJurZKXBc0W3r6IJreS5YQvW
	aQ3SvAfnTuAv4u9fJevbkMHA4v2tbvioTlsmL2SmR8XcPRDEmscidyF6oMkpLWpkIWM39cqcIxz
	IgJS+v5a7LTy46XkJUTW8oKHFhH8CRFHOEUlqXMXNjaZFREuM7VLbeebx7WPqaUYb+xi6O88TjT
	KCmBnlh2rE45diKaYthZ0AZsXHvMOSm98wJcPlSDErYtj+r54sMomDK5iLjRlbUEPJ6tTueRrCi
	yDIAXHa5uWnCEirocucmniKDnu+8RUIyhzctgOGmWXZugj6qd8McgbXrepI0bugwZ5iCNF5aqHh
	jKhX+++GreKpE73tZ1SBYK0lkmXbMll1CpoAV/EGSw3Et0wB4gZtpN/C0CwQ5igbhfEkdwe4Psd
	aiLvXbbZ8oN2FOdvGJV8yqMkjr5yoYdwWKF+h5DL3b6ENdjlSB3RDPKPwgcB0ozuhsL57R86Bbd
	4XhWREAIdLj3e+k4g7puFW1dVL67iYaWPOcmSa6aXQ+ImN0LizTw34Vrul3xTCwGKeucR7h4+rK
	L7idEP98jxABgppz6ClJGj6b9tRbwRK8UHNRVqi9RDN9G1hN
X-Received: by 2002:a05:6102:5487:b0:7a8:46fb:eb3e with SMTP id ada2fe7eead31-7cb373e517amr5965316137.36.1792033011887;
        Wed, 14 Oct 2026 19:56:51 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91cab4a97sm12938054e0c.6.2026.10.14.19.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:56:51 -0700 (PDT)
Date: Wed, 14 Oct 2026 22:56:50 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Eva Kurchatova <eva.kurchatova@virtuozzo.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Willem de Bruijn <willemb@google.com>, 
 Alexander Lobakin <alobakin@pm.me>
Cc: linux-kernel@vger.kernel.org, 
 Eva Kurchatova <eva.kurchatova@virtuozzo.com>, 
 netdev@vger.kernel.org
Message-ID: <willemdebruijn.kernel.2f0d78527930f@gmail.com>
In-Reply-To: <20261008163817.2983484-1-eva.kurchatova@virtuozzo.com>
References: <20261008163817.2983484-1-eva.kurchatova@virtuozzo.com>
Subject: Re: [PATCH] udp: let rx-udp-gro-forwarding aggregate under
 encapsulation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Eva Kurchatova wrote:
> The rx-udp-gro-forwarding checks of the veth kselftest fail with "got
> 10 packets, expected 1" on a host where something uses UDP
> encapsulation, a vxlan say, and pass on a host where nothing does.

Uses encapsulation in the same network namespace as where the test
runs? If different namespaces, the socket lookup should fail and
thus the behavior be the same as on a host without a tunnel.

In general, I think the fix here, if any, is to address the flakiness
of the test, not to change the lookup behavior, which is as is
intentionally.

> Since commit f2e9de210d50 ("udp: gro behind static key") the receiving
> socket is looked up only once a tunnel socket exists, and commit
> 36707061d6ba ("udp: allow forwarding of plain (non-fraglisted) UDP GRO
> packets") takes "no socket found" for "forwarded" and aggregates only
> then. So the device setting works on a host without a tunnel and stops
> working with one.

These heuristics were chosen for a reason:

to avoid expensive coalescing + resegmenting if packets are likely to
hit a normal (i.e., without UDP_GRO) local UDP socket.

> Aggregate whenever the device asks, socket found or not. That is what
> every host without a tunnel has done all along: a local socket without

without a tunnel, or with a tunnel?

> UDP_GRO gets the packets resegmented on delivery, and a tunnel socket
> keeps its own receive path.
> 
> Fixes: 36707061d6ba ("udp: allow forwarding of plain (non-fraglisted) UDP GRO packets")
> Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
> ---
>  net/ipv4/udp_offload.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/ipv4/udp_offload.c b/net/ipv4/udp_offload.c
> index cf07c3c6611a..d4e0e6bb9959 100644
> --- a/net/ipv4/udp_offload.c
> +++ b/net/ipv4/udp_offload.c
> @@ -804,7 +804,7 @@ struct sk_buff *udp_gro_receive(struct list_head *head, struct sk_buff *skb,
>  		if (skb->dev->features & NETIF_F_GRO_FRAGLIST)
>  			NAPI_GRO_CB(skb)->is_flist = sk ? !udp_test_bit(GRO_ENABLED, sk) : 1;
>  
> -		if ((!sk && (skb->dev->features & NETIF_F_GRO_UDP_FWD)) ||
> +		if ((skb->dev->features & NETIF_F_GRO_UDP_FWD) ||
>  		    (sk && udp_test_bit(GRO_ENABLED, sk)) || NAPI_GRO_CB(skb)->is_flist)
>  			return call_gro_receive(udp_gro_receive_segment, head, skb);
>  
> -- 
> 2.56.0
> 


