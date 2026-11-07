Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794063868;
	b=fSPilRJQZW/W28LbSXfmu2paibbqVPKaymbCFzcbU8cCSYgZGm8yaLtPXWhJZ3dIdu8Q
	 AVbqlV969R12WIaQ43nC5G07aadT3M9ZCKk63JWtFtRgRPHeO6KCfLyOoqpYUt/nWQMB0
	 N3NuQCnFmi6tSVN6vMoAmv8LjwcJOp0/GZ0JMRQarnXvxo2TkS1k7RikTo3TfN8A83syM
	 Q3CQtiqp7oAhPcC/+XTlf6/IOxwER2oUSQ5BaM6/Hea0LDu3hqOtHL+wH3/di8NPkagaj
	 Btkf7vxDJCqBh1JwUlsZUagDl4kzC27E51kacEbeFzUq55P+jzCJuEcQUXDmzoMRzdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794063868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=vy7ktIeClbyEEG+6rCnQhDLjTI8DqaLU7Mkwveq768Y=;
	b=wzcNs1HhnluQERXj/m6ay+d67Jj0Wds11MznvoNZeplfkPQWAq8vEjo1krJ6AlAJ4d26
	 l14DFb5DeOUtM4ROjsW6rqaAqmForqevYw2R3w0D240WOWBm7GlqkkPpA1j1yR+cFjHEC
	 0CoWHVJI6BCSUV1gmz+srS5w3wV2LAcW6SYaCXyC52bHAYFpSlYGI6dg8onRy0JDa9gws
	 PXJoeJUPUPBcIoq2V3hJ3227U/W3Mm96J+9ExDm3afXX3PXlqPUB9CMh4idPjs2EguYHD
	 51mMhX9J2p6iZ/s5lutU4ChKVf6Q6ks4aUQa3pMn2B6gh2EdvocPRwGhdfbwYOvGmQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OadxouFz;
	arc=none smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C95606CE7C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2C95606CE7C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OadxouFz
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eac01ff101so567620e0c.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794063867; x=1794668667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vy7ktIeClbyEEG+6rCnQhDLjTI8DqaLU7Mkwveq768Y=;
        b=OadxouFzWDNRkM1dCLKi2MyKKY+rORoE2qjdptO5MHzNpvA8wdUE1aj1PzJc/k7xcK
         jsFQA6DDLEsJCjYqtvUpEcGmP3Ytokk9ByqGicDSvATDZ9IniPUc+ogA6+8Bci0dzCQ+
         iVsPAMY48OUYFBxaef01OBVqjqwf7gFj0ZgfH//zMf9wjCz70HTJFNjODCs2SrA/aqsR
         lrLClXacUbzoaBis5qSeRBMOQXIgISur2KPcP2egB1xROOnOIaRk9Msi9I6v+2QZLTsI
         mQNnlC2JL4gGYPpBFdyTt1cmZC4ok8fGX7rgbrSwxp5+sx7KkncRky0arvgIoY5RJzte
         16Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794063867; x=1794668667;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vy7ktIeClbyEEG+6rCnQhDLjTI8DqaLU7Mkwveq768Y=;
        b=zOJl/e7YC0EmpwcQIxlNB6wi73Ojm4Fivi7WfIjNC5nUryOO8iJQUlEP7JMbbVsTTK
         QVKbbNKVUZzd4GMIjcc64W/Fnwjup5tr9ayWyrUj7uhyn7Sl/B1Cd/mgiufdvcdpxzCV
         Xj4F1tYLmfZcZpYuBTXJJr2GFFjfNQCNT4ALlKqvHzfvEJOJNIyKOS2U0SQyGd+7KQ/w
         H/3j80JUF46y8OmDhzbZ3vSe1U5mLM2ZHqC1b3IcFkY8LkFpdVIJrIZFU25W/BR9O82B
         361LqzONTKit6oZ1FLx+1Zct7GErh12zWKJ9zKgTEY3zMUkve3vxGtu8Sy9MKU4WsYYk
         viGw==
X-Forwarded-Encrypted: i=1; AL+hErFFmkwhuW8hETgDDTjszpBpShWlqANXWApoutWuwo52OPrNJtjCp6oBAGCnm8ThC2WwG/waKqlof0GSH4E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9a+w5yfJGg81IvMkFywDHmO3SALONBGeMNqajpRnuu/wqrA0fD
	bhRQQNW6AQtkZAOpeZGna1LUaRfzhFapw3bJ+UAd+Aft1BU0JOoNJn38
X-Gm-Gg: AYBFou3GZhI2LR5yOoRV/XbUUAXLEf8KgbHM/VDQxuV0mUxkb0kFGK9YWb3sUxN3Z1H
	5la0p66jEIokk0tCyog9rFmJ3X6qWqtX1Y4itjBSzTBQPfzB3jGOqTTzbbjo2tfHzHzNhkbiAwr
	EhZI7YExnQ2OOvqPwI+G49X9FXl251SvQ6BiC982v7Hzg3ZU4aZemD9GpQKYWz/nVIBuXS87pwI
	/dHWjYyguYcxqb5cUA71r3gqNFWvdDc7VdeezGIsshlUz+WXd2bdFiZq/RzJ6ztNxjtKgK9j91Q
	Q+4vbdKwJEg+YIFQU8/l4DIYe2qfRr2vCqk90CaSC2euvIdvnNykXCrfBQVXZLkz7wR8fLq3ujE
	Y8Dt2BlNSx0sfHk/pYKJTRi4LM6a8A0k4crmYzrintqVbQYmF7urO5QljSLyUbiYdxvBiZ3Swnd
	qpBaDCqaEeAHExdyIQlE6GfICUHbLygsdYP1tLI8osu2jreT676p5zCkoo3DXMCQntjqIdYcddf
	iiXt1iG7zM0rjzNyj+8Vct+0zFyY7fwNVXSUDgVvBicMAPUlW5igV9jy58MKmjf8Ft18DRzOfUW
	C3nuo/ovflcdqxQYxaOvLCiwRlhM3gHLdht4OgrDlXGufBqJk+oVLtew3QhxiTCm5plqaun+Lb+
	QKxTLP4Eo1b2JKpgvTVAQz8dDT8/pBStHn2jDGJ1mp1W9dj9RE47gr2YCTLQFmENrRqSvIP4=
X-Received: by 2002:a05:6122:e443:b0:5c9:a60b:e5bd with SMTP id 71dfb90a1353d-5ecc43f9985mr2270855e0c.13.1794063866745;
        Sat, 07 Nov 2026 07:04:26 -0800 (PST)
Received: from gmail.com (223.230.150.34.bc.googleusercontent.com. [34.150.230.223])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ecc64e8c5dsm3974947e0c.11.2026.11.07.07.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 07:04:25 -0800 (PST)
Date: Sat, 07 Nov 2026 10:04:25 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: shao.mingyin@zte.com.cn, 
 davem@davemloft.net, 
 edumazet@kernel.org, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 netdev@vger.kernel.org, 
 josef@toxicpanda.com
Cc: horms@kernel.org, 
 josef@toxicpanda.com, 
 willemb@google.com, 
 almasrymina@google.com, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.703e96022339@gmail.com>
In-Reply-To: <20261107215051120CrLjo_cGXWfdJxXk4ae8s@zte.com.cn>
References: <20261107215051120CrLjo_cGXWfdJxXk4ae8s@zte.com.cn>
Subject: Re: [PATCH] net: skbuff: don't BUG() when skb_copy_bits() fails in
 __pskb_pull_tail
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

shao.mingyin@ wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> __pskb_pull_tail() BUG()s if skb_copy_bits() returns an error.
> skb_copy_bits() fails when the lengths do not add up, or when a
> frag_list child carries unreadable frags (devmem net_iov, commit
> 65249feb6b3d ("net: add support for skbs with unreadable frags")).  The
> top-level check above does not cover frag_list children, and
> skb_gro_receive() links them without propagating skb->unreadable, so a
> mixed skb trips the BUG().
> 
> Nothing has been committed at that point, so return NULL the way the
> rest of the function already handles failures, with a
> DEBUG_NET_WARN_ON_ONCE() for debug kernels.  skb_condense(), the one
> net/core caller that ignores the return, now checks it and keeps the
> original truesize when the pull fails, as the frags are still there.
> 
> The other direct callers that ignore the return do not build a
> frag_list child: xen-netfront drops the skb when the failed pull leaves
> nr_frags at MAX_SKB_FRAGS, and niu, mlx5 and ftmac100 pull at most what
> their own skb holds.  A length mismatch there is a driver bug, which
> the debug warning reports.
> 
> This is the separate change that commit 279877d86c82 ("net: skbuff:
> don't BUG() when skb_copy_bits() fails in copy helpers") left for the
> callers; the audit is above.  No Fixes: tag and no stable marking: the
> mixed skb is an invariant violation, not a regression, and this is a
> net-next hardening in the BUG_ON() removal series.

In the series, Josef reported

  Two BUG_ON()s are left on purpose.  __pskb_pull_tail() and
  skb_pull_rcsum() have callers that can't otherwise fail, so they don't
  check the return.  Some of them would carry on and BUG() somewhere
  else, or push back a pull that never happened.  Those need their
  callers fixed first and will come as separate series.

> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
>  net/core/skbuff.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> Tested on 7.3.0-next-20261030 (QEMU/TCG guest).  QEMU has no devmem
> (net_iov) backend, so a TEST-ONLY hook (applied to both kernels, not
> part of this patch) fabricates an skb whose frag_list child carries an
> unreadable frag, then calls the real __pskb_pull_tail() on it at
> late_initcall time: skb_copy_bits() recurses into the child, sees the
> unreadable frag and fails.  The hook then calls skb_condense() on the
> same skb, so the failed pull must not shrink truesize.
> 
>   unpatched                             patched
>   kernel BUG at                         __pskb_pull_tail() returns NULL,
>   net/core/skbuff.c:2903                skb_condense() keeps truesize 960,
>                                         boot continues, no BUG
> 
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index 48f676411724..8a200252ef93 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -2900,8 +2900,11 @@ void *__pskb_pull_tail(struct sk_buff *skb, int delta)
>  			return NULL;
>  	}
>  
> -	BUG_ON(skb_copy_bits(skb, skb_headlen(skb),
> -			     skb_tail_pointer(skb), delta));
> +	if (unlikely(skb_copy_bits(skb, skb_headlen(skb),
> +				   skb_tail_pointer(skb), delta))) {
> +		DEBUG_NET_WARN_ON_ONCE(1);
> +		return NULL;
> +	}
>  
>  	/* Optimization: no fragments, no reasons to preestimate
>  	 * size of pulled pages. Superb.
> @@ -7218,7 +7221,8 @@ void skb_condense(struct sk_buff *skb)
>  			return;
>  
>  		/* Nice, we can free page frag(s) right now */
> -		__pskb_pull_tail(skb, skb->data_len);
> +		if (!__pskb_pull_tail(skb, skb->data_len))
> +			return;	/* frags are still there, keep truesize */
>  	}
>  	/* At this point, skb->truesize might be over estimated,
>  	 * because skb had a fragment, and fragments do not tell
> --


