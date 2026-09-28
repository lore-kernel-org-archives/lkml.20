Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B7E3546FE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617549; cv=none; b=tpC8e7+KS9BVvyyEDeAba2jWwcsA2W+vTmBwmfqMCCARKEb6CfdT0RxM/u2a95AA8ufoVvTCjj8pr4w6g4tyskcSLAtUdQjQxQCP0ZjMwEeOqUoBDMbk4yUN2v0zBmjjHN0ReAXe+o3puFYMqdI8349D3Yre4+r+Co1yKXE5aIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617549; c=relaxed/simple;
	bh=RsVbnR0UtECwZn1WfCNNpKAP7w5m36r3ODk/PEWCa4I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X5er4pfv37AVIhnmImduCiosWql1reCVSoM15K+N6LZkqzDXAp7IccvhJFcAxEBmRlI8fcPvexjf8mXH58Aww3EizHAOdjNdUBtiTwifGzJIN2xSOvMX7SO4EHP0utaMwJzotKtxANxdKPBTVVPakzDRK5mA/IVugx5ceaRRCEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s8t4jzFA; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s8t4jzFA"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso92067a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617547; x=1791222347; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WI+uqjCP32lvx9Hh4Cxb0Uvk0Dah2pSWZwhm+yPsGk=;
        b=s8t4jzFAYIORKUOMxQbGy3KmgwGz0kKxP6tOgKmDIlHmUQ9oy7gMeTm7qFfDPdaPNm
         oV5D5FsStlp1M5kSnXP3lp8iRgvZQ7ATxAD6d8UPhzCthJKC5zwfbBz4RvoT+NC0VkUW
         rIGRMKh7mJukjTQuV6uVoh6eBH9mNPFZkFJGfwFQCNvhjLyleGLnVV7SPwEDnEy/dqnY
         5s8lZ7nIZcHTF+vm2mFGtFvmSm2CrwOlBHDB4WL8Mjl2vrviVshBT2zu8gRp9FVLqgg4
         ev1doXpkVBv0yuBDPRF/+538ec/lZ0Hp6kcGg0yNwKW3yFAlV0x68vel/dMwlX5cjSDS
         berw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617547; x=1791222347;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WI+uqjCP32lvx9Hh4Cxb0Uvk0Dah2pSWZwhm+yPsGk=;
        b=YhOOnkqYi/RSRabClan+lBm203Kfk8RwMScJsuyhFOtXICFdf/7rkZ3WfSlOy8Pto2
         5QzAswDJu+4CV+T5K/fdv/YU+Xj3Dif4oAxSg7rRKqbCHyXBYFz2XBkuYLBNGoYIAdrq
         Ms3x8cAJnGwRG4gAjxSq/Gy78hsv0FHI4XdHi5Xaeij/RShSh43O1p3Vdqk5Zux1+4o7
         aUET4AZKjJOA1vpHkQD4zaP9DmtpEJmR4L+SPi3DGAW9/yD7HX1J/nFNIt4Pj+1WjFvr
         Uf9EzOHnJplW7VF3UolmHfFSH2ivRctpx3WVrn1Z3G6oElW6PfjG4gh87urFmaSSeNR3
         guew==
X-Forwarded-Encrypted: i=1; AKwUvByBiBDjF43sUXVO+ggW5/nz1RRypCt8MIwJwoWDKNX3Zo0eB5W3xJmCKfjiKXeyGfQLh0ok5ixhXyIFA3c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRUMpsI4eRlQbDTq7uGyi29wZGUhO1LdooU0PfM79tX1aAE+YL
	4P4yo5We399uvAz3fl/y5cMOnlAzQs/1sQizBQp5rJEDkL8ijUH9vJmD92QXELXdWCrZ7TGOWCr
	s6TI9sQ==
X-Received: from pjbhs10.prod.google.com ([2002:a17:90b:200a:b0:3a0:e233:a080])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:37cf:b0:3a0:cca0:4a8c
 with SMTP id 98e67ed59e1d1-3a49ab4ecd1mr69880a91.7.1790617546538; Mon, 28 Sep
 2026 10:45:46 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:45:04 +0000
In-Reply-To: <6E4F8645-9453-45F1-B068-52E1B14E8B0C@doyensec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <6E4F8645-9453-45F1-B068-52E1B14E8B0C@doyensec.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174546.4022833-1-kuniyu@google.com>
Subject: Re: [PATCH net] soreuseport: Fix use-after-free when a socket is
 added to socks[] twice
From: Kuniyuki Iwashima <kuniyu@google.com>
To: norbert@doyensec.com
Cc: daniel@iogearbox.net, davem@davemloft.net, edumazet@kernel.org, 
	horms@kernel.org, kuba@kernel.org, kuniyu@google.com, 
	linux-kernel@vger.kernel.org, martin.lau@linux.dev, netdev@vger.kernel.org, 
	pabeni@redhat.com, willemb@google.com
Content-Type: text/plain; charset="UTF-8"

From: Norbert Szetei <norbert@doyensec.com>
Date: Mon, 28 Sep 2026 19:22:38 +0200
> reuseport_stop_listen_sock() moves a shutdown()ed listener from the
> listening section of reuse->socks[] to the closed section: it removes the
> socket with __reuseport_detach_sock() and adds it back with
> __reuseport_add_closed_sock(). The return value of the removal is
> discarded and the add runs unconditionally.
> 
> The socket need not be in the listening section. inet_unhash() calls
> reuseport_stop_listen_sock() for a listener whenever sk->sk_reuseport_cb
> is set, but inet_hash() enters the reuseport path only when
> sk->sk_reuseport is set, and SO_REUSEPORT can be cleared in any state.

This has long been a known problem, and I think it's time
to fix it instead of working around it:

diff --git a/net/core/sock.c b/net/core/sock.c
index 2948dffcc3e1..a33cdf99368d 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -1324,6 +1324,8 @@ int sk_setsockopt(struct sock *sk, int level, int optname,
 	case SO_REUSEPORT:
 		if (valbool && !sk_is_inet(sk))
 			ret = -EOPNOTSUPP;
+		else if (!valbool && rcu_access_pointer(sk->sk_reuseport_cb))
+			ret = -EBUSY;
 		else
 			sk->sk_reuseport = valbool;
 		break;


> Clearing it between shutdown() and listen() makes that listen() skip
> reuseport_add_sock(), and with it reuseport_resurrect(), so the socket is
> hashed as a listener while it is still in the closed section. On the next
> shutdown() __reuseport_detach_sock() does not find it in the listening
> section, returns false, and __reuseport_add_closed_sock() adds a second
> copy of it to socks[].
> 
> sk_destruct() calls reuseport_detach_sock(), which removes one of the two
> entries. reuseport_grow() then dereferences the other one, because its
> loop runs over every slot up to reuse->max_socks:
> 
>   BUG: KASAN: slab-use-after-free in reuseport_grow (net/core/sock_reuseport.c:291)
>   Write of size 8 at addr ffff888132359988 by task poc/621
> 
>    reuseport_grow (net/core/sock_reuseport.c:291)
>    reuseport_add_sock (net/core/sock_reuseport.c:350)
>    inet_hash (net/ipv4/inet_hashtables.c:810)
>    inet_csk_listen_start (net/ipv4/inet_connection_sock.c:1359)
>    __inet_listen_sk (net/ipv4/af_inet.c:225)
>    inet_listen (net/ipv4/af_inet.c:247)
>    __sys_listen (net/socket.c:2014)
> 
>   Allocated by task 621:
>    sk_prot_alloc (net/core/sock.c:2246)
>    sk_alloc (net/core/sock.c:2308)
>    inet_create (net/ipv4/af_inet.c:333)
> 
>   Freed by task 0:
>    slab_free_after_rcu_debug (mm/slub.c:6570)
>    rcu_core (kernel/rcu/tree.c:2919)
> 
>   The buggy address is located 904 bytes inside of
>    freed 2624-byte region [ffff888132359600, ffff88813235a040)
> 
> Only move the socket to the closed section when __reuseport_detach_sock()
> reports that it was removed from the listening section.
> 
> Fixes: 333bb73f620e ("tcp: Keep TCP_CLOSE sockets in the reuseport group.")
> Assisted-by: LLM
> Signed-off-by: Norbert Szetei <norbert@doyensec.com>
> ---
>  net/core/sock_reuseport.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/net/core/sock_reuseport.c b/net/core/sock_reuseport.c
> index 29948cb44b7d..031b641be317 100644
> --- a/net/core/sock_reuseport.c
> +++ b/net/core/sock_reuseport.c
> @@ -479,8 +479,8 @@ void reuseport_stop_listen_sock(struct sock *sk)
>  			 */
>  			bpf_sk_reuseport_detach(sk);
>  
> -			__reuseport_detach_sock(sk, reuse);
> -			__reuseport_add_closed_sock(sk, reuse);
> +			if (__reuseport_detach_sock(sk, reuse))
> +				__reuseport_add_closed_sock(sk, reuse);
>  
>  			spin_unlock_bh(&reuseport_lock);
>  			return;
> -- 
> 2.55.0
> 
