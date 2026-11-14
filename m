Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794641316;
	b=TgWy0/AyHbc5cwo+eZGM5Pq+MRojoIxrDWQdvS5UW7gzpu3n019W7Fi7BbfvjIVRSCL+
	 bS4IAW3C2GOjEspblx1E22wf2StbJWSPC+TnaPRzeJ1LcrMyzAftaa57IsIbG5dHTNCE1
	 ESeYrayaPcbTM0PfROO+huPLQ9rCYZ0e/Xj3IPQtaf8/kDTwRuI6mXVwI7Z/pU1L1yqbA
	 aZSSYlpeBbhgjWtfJdDbDyp7u7ORE+pYmiihVnlKbfwzLVPYNPZXXEYdpr2SKVS8d2j//
	 9l5GiL0CyCZA3JW+CNynVtWB/WjzO6wxgtpx1DVSoCWMf8LtsLADyGgywqaC3XY10oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794641316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ZUmq/AHkNakT7HaOv5RMPiqqshA3T3BUppFdjgJH3H8=;
	b=diURG7fU9iOqnE4rhFdW9HwmUdP2U9cxa/bg7mcSyslnixoYlfyywl1cTJP/2InUyaXX
	 Wb4VZfno9N9J0kwKOIBtovhH8FK64ChA/gB+XN1mwus1bt/rfQyOlTweN2+4TXaABxsfx
	 4DZdreu8C1rTwXSxr4A0xG4SvosUS1eusNv70VSy60uZykThAegHRThhQ6vcj2pGoiIqN
	 nwWcp+KCIvjRR1iOO2g/n8Vnv0uNfvJZNI/r2LbalZfW7scaiVtTblXmAwSSo7WYuft7C
	 g22dGRppAMMepV824gmktXfjT4fcx5kdNHYkBZebBbOPYmEmrv24YAi1MU1WagQBPog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JphWNBTa;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4EC606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A4EC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JphWNBTa
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0afbf532eso1490138a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794641315; x=1795246115; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZUmq/AHkNakT7HaOv5RMPiqqshA3T3BUppFdjgJH3H8=;
        b=JphWNBTa0MysOtfljwluIzxQpgBb4srmXPAiYuHn+LD9l6dGRPGc4Ir5+ckJVNh4v0
         Vj8vRMyPfD+lrJexHDsG9k11M2w+pz7t6ONU3FgC0Ry58L2Oen1OsVKDt0x0QSN43PQs
         i01ig1PN0a6kNaUNhXV6plrJumm5YXmwmXbkW/7Hx0b2bVEG5cgU50QF0m3KMJ4FMExd
         A8SVuSw/6TEDNm9OpLnyH4GRHbEv3p51UNqesePVDGs5wYWzPZxQjuLKB0wHj4kQ0NwH
         jRzb0HwYWNzM8e2aQzHBiAF4koJHzT7scHHKBYsP/5lWAdQOeJ+bFqKkx91yyyKzIyO0
         CBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794641315; x=1795246115;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZUmq/AHkNakT7HaOv5RMPiqqshA3T3BUppFdjgJH3H8=;
        b=dCYSEu/74vkCvnIEgT1etgVJ7t5ncBXr8vGPyho1M4zuNAMfRTRm3eRXUB3wdhME7d
         nThvg2Lc6GMcqtTLBiz5DxDTJWyA8F/CA/B5jaybSM557PfVqwb6k5QZ1HJAfj2+1tOC
         4U6oPe9U7/Llc8c+ab4hxwxSQkqp2Ba9TFSsOk1uQXD6cneZ7KdH6dlhNwdASFGwBldk
         IM67j+P50WjNj/XlfR0902117cgheiQ1jWX/bYiRoxH328rLtHc3fa0kvOIMnOUsT/zx
         nz7fTWiVf1hNzscvLxN+MZCdlMyMKFoKM9onpcQbqntOiC3mpZVteVUslIeozNPCsSVY
         jIIg==
X-Forwarded-Encrypted: i=1; AL+hErGuCYcZ645mD/T3h4Ss3a9zKTtDFQAJM1KqKFL0rBrZVoyYJiRfgbG0eArJ3k6BMbFWdDX4GacMbogZ6y4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8QyxnQkhQx+h/bI+vEZ2RY/ekHnj0NNTlbE3S2fdD7w7meCUp
	yaJpK5XUMvbZ48sA8SIOu78p+hsem2KobWN+kl/vHlHjFk1wGFvku+Wznk6E1fVmqh1F3cQzt8h
	93Iw9XQ==
X-Received: from pjbbu21.prod.google.com ([2002:a17:90a:ee55:b0:3a7:d1df:7b34])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:35c6:b0:3b0:e2a9:345a
 with SMTP id 98e67ed59e1d1-3b1b0b9b782mr4266092a91.64.1794641314735; Fri, 13
 Nov 2026 23:28:34 -0800 (PST)
Date: Sat, 14 Nov 2026 07:28:34 +0000
In-Reply-To: <20261111174704.24312-2-juanagusnicco@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111174704.24312-1-juanagusnicco@gmail.com> <20261111174704.24312-2-juanagusnicco@gmail.com>
Message-ID: <avgNl96dmc23KOrW@google.com>
Subject: Re: [PATCH net v2 1/2] tcp: Fix the SO_REUSEPORT bind cache admitting
 a conflicting socket
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Juan Agustin Niccolini <juanagusnicco@gmail.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, ncardwell@google.com, 
	josef@toxicpanda.com, jbacik@fb.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, 11 Nov 2026 12:47:03 -0500, Juan Agustin Niccolini wrote:
> When the port is in the FASTREUSEPORT_STRICT state, inet_csk_get_port()
> skips the bind conflict check if sk_reuseport_match() finds the new
> socket's address covered by the socket cached in tb->fast_*.
> 
> This is only safe if both sockets match on everything
> inet_bind_conflict() reads. The cache misses some of it:
> 
> - It does not record sk_bound_dev_if or sk_reuse.
> - It records the family and IPV6_V6ONLY but never compares them with
>   the new socket, so a cached v6only [::] (or 0.0.0.0) socket covers
>   a dual-stack [::] socket.
> 
> As a result, an unprivileged user can bind and listen on a port that
> another user is listening on, for example a dual-stack [::] socket on
> top of a 0.0.0.0 listener:
> 
>   victim:   bind(0.0.0.0:P), listen()
>   attacker: SO_REUSEPORT + IPV6_V6ONLY, bind([::]:P)   /* fills cache */
>   attacker: SO_REUSEPORT, bind([::]:P), listen()       /* should fail */
> 
> Only take the fast path when the new socket matches the cached one in
> family, IPV6_V6ONLY, bound device and SO_REUSEADDR. Identical
> SO_REUSEPORT listeners, the workload this cache was added for, still
> skip the scan (binding 16384 of them: 9.80 ms before, 9.86 ms after,
> 5874 ms with the full check every time).
> 
> Fixes: 637bc8bbe6c0 ("inet: reset tb->fastreuseport when adding a reuseport sk")
> Cc: stable@vger.kernel.org
> Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
