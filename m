Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793547527;
	b=l/3zuJckxErFoqwBDSFiEi6/Xis9ZMSYWM/ht3JK4j8WX4BZaLLiSGoV0F23V1DTBN4K
	 rOqGVlEzsOqrd1bKC7GrNLRnay9pa0Rh3wcMQa/eJGfIv5nzCraSbnFHdZc3DwtgJHUOP
	 xnjEE0tBd9GVN/asPJpjPaUVrIPJfGvVKM2RUOJWDtw+scX+JCok+kCoQ6t8prChJOF/E
	 f4Ij7mqzP7hCNqYcxPaecVeBlJpMlr/7RyKoCh4JbHj9HbRhPR5AT6IQwD7hXkDhffwRk
	 7o0fRWVMk5DAT3TA/RgJeu57rTgfFJZrdAd59CEvie0wMSuf8Eq5KBObYzJQ3Rb6fuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793547527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=y4TC5oAYHs7m0oof9CZGtZfqTYpKndLI+6fmGJ2s+hM=;
	b=MUZ8yROAqpgZ1Mk+LJBcYN4f1/lyB6Z0kwM/kjjy3Nb8Jp8jet0PPd/kOIoO4V7UvVf9
	 PqSPZ4H5VzwlqAIAc7yNQqKIkd5RX9z7fll+KkBjGXHiwVOQnxC9auBBBmdXz16cg/i/t
	 TtuDW7/5YRDvC1l8+oQEUJNhR14lmbUZQBqEcNIWcr3qdtoVJnvHe2iOssh1EN+2+Ox0G
	 swwS9GTggTSuoXNRjLtj5GJkHdDRrSjSchcP02XuJ6+jjGD8AX3Iy22A3qwvTtDph9fzI
	 wrCx1cR/ViPaubaihU1eZMWd7WFLg4ZjYW+z6PnKANzeDo9P281C2de0WiIjZKsGiWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IXDSYuIt;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434EE606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 434EE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IXDSYuIt
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a086f5d91aso2981373b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793547526; x=1794152326; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4TC5oAYHs7m0oof9CZGtZfqTYpKndLI+6fmGJ2s+hM=;
        b=IXDSYuItLSaxnqoVKukX0g47XLtbVnvRRKeef741LJLA3gTWZekxiQWzrut+TAsEhI
         hnaY320n0OSq8F5KtdsNBqWfI6pkeIuWA9XZuH9j6wlhUKNXAM3ibQXXXF7a+i938pXA
         XfWjw1L+BXduRDlWdKhHhW7MUUfpF76l4/Vvv5HethbpMxIlX9MC0t+8Snn1pv83VhOW
         jCAB0lePRXG9MfCOiq63h+bJo+UzzeCob17be2J86uFN8TyUbJrBZCVdL4fNtqbfxPIZ
         Z87yveRZw24RXbb1jSaXFAtWiZSlDr/S8gy/8WtV6TvrBjYQcHtr5jd6+1nH88Jazsag
         OdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793547526; x=1794152326;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y4TC5oAYHs7m0oof9CZGtZfqTYpKndLI+6fmGJ2s+hM=;
        b=g44h6YNXxuhvEHsFoENtYZWaSNSvhz+YN9unYRw6WgTRrpQeXEhY2x/xm860W443OR
         XP2aK+TiQm2kcymGiXdUQ+tV+73AqW6qip7clFF4rVzoib7CBFVvr117JTN+nRTWBe6N
         DY/46DUy0chSvmgrIw8Pr+hdUHw/QIUEgA5W5aLJYXv/YfAk+d9mqmsV8yDJ+QbSx9hT
         5zp6VV3XyLYgJx5pj6F43yl4vEyqLFn4PwTisxQhvwatNV2g6PRSRG10sdowAOIzbQUR
         6nMHjDO93xAuFcf2RoBjyIjv04SYc2rymj9V6AwP/Y1PMxkHSmGyk1s7g5uIWyfq7eZs
         yWIw==
X-Forwarded-Encrypted: i=1; AKwUvBwy4DyS2weOGV3xk8tsOM7Rpp8r2q9Yg1CvhN7XEOh3Jg0p8hCvhWxA5IoqO79LUSZnOexAuPQL7D9P0QI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqxbNq4EEhFp9KM1XslrTov1GmXgi1Nlew7/TJOL4LsaCbppRW
	jmKkTibI+zGY/zUydMRU4PI6lQ2a9bDmyawb/dK+GrKQ/SzHswwwu3LsrR6YwApqa2RD2cqKFhB
	cSYirBg==
X-Received: from pfnj8.prod.google.com ([2002:aa7:83c8:0:b0:8a6:c8f0:ec6d])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2e8f:b0:8a0:1c79:b442
 with SMTP id d2e1a72fcca58-8a9b69872fbmr7076112b3a.0.1793547526202; Sun, 01
 Nov 2026 07:38:46 -0800 (PST)
Date: Sun, 1 Nov 2026 15:38:45 +0000
In-Reply-To: <0b1a91e7fa0de128c6e2bd3ae2f5c960a5c0f883.1793444262.git.thnkslprpt@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <0b1a91e7fa0de128c6e2bd3ae2f5c960a5c0f883.1793444262.git.thnkslprpt@gmail.com>
Message-ID: <audZ1egS6dmi9ZfE@google.com>
Subject: Re: [PATCH net 1/2] net: check the sendmsg LSM hook for every batched message
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: netdev@vger.kernel.org, edumazet@kernel.org, pabeni@redhat.com, 
	willemb@google.com, davem@davemloft.net, kuba@kernel.org, horms@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sat, 31 Oct 2026 13:08:40 +0200, Avi Weiss wrote:
> sendmmsg() skips security_socket_sendmsg() when two consecutive
> messages have the same explicit destination address. The comparison
> does not account for the message size, so a BPF LSM policy that denies
> large sends can be bypassed by placing an allowed message first.

What is the real use case ?

or is this something just flagged by AI ?


> 
> Use __sock_sendmsg() for the cached-destination case as well, so that
> every message undergoes the LSM check. Keep the remainder of the
> address-caching logic unchanged in this minimal correction.
> 
> Fixes: 228e548e6020 ("net: Add sendmmsg socket system call")

This is net-next material.


> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
>  net/socket.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/socket.c b/net/socket.c
> index 2e3b5737c481..c2a85224ab55 100644
> --- a/net/socket.c
> +++ b/net/socket.c
> @@ -2709,7 +2709,7 @@ static int ____sys_sendmsg(struct socket *sock, struct msghdr *msg_sys,

 	/*
 	 * If this is sendmmsg() and current destination address is same as
 	 * previously succeeded address, omit asking LSM's decision.
 	 * used_address->name_len is initialized to UINT_MAX so that the first
 	 * destination address never matches.
 	 */

The comment here is stale.

 	if (used_address && msg_sys->msg_name &&

>  	    used_address->name_len == msg_sys->msg_namelen &&
>  	    !memcmp(&used_address->name, msg_sys->msg_name,
>  		    used_address->name_len)) {

Also, used_address, etc is no longer needed.


> -		err = sock_sendmsg_nosec(sock, msg_sys);
> +		err = __sock_sendmsg(sock, msg_sys);
>  		goto out_freectl;
>  	}
>  	err = __sock_sendmsg(sock, msg_sys);
> -- 
> 2.43.0
> 
