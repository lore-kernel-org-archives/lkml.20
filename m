Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379F42765E2
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 01:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791424170; cv=none; b=PR0/+ApFfHG4BdjUNUIg6uamSSPkaJn0rpmE9JhLT9mc6YV3aYgEjeKi1SkvPe5FCeIIE4sJlHqwbyhtO6vdJn4wMpAD2YJ8RN04OBA67wXv2jFmm1l4ZF3Uke4vWcg1RlFLsiJ0S9leoBWfMmMZBTsaT1wKd8Vq0Yvy0N7YjrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791424170; c=relaxed/simple;
	bh=Y2bgZt5MD5Lp/ECTRNG1YjhY6IZxQDBoeB1q2mOYy8w=;
	h=Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References; b=FwdDNp9PLIUeFqoajPz6OizRr3j/a173P2gvNBha062zYMZ7yrjw9NXkqGa259y9EDF8cfh0DLdmRAKZeJJf/a7ubRjJIYKrydZaVqlMVhU22ZHl5Czyd2PxlA6ZaU0w/esSoGlQiMyoa9+wydyfer5QF9DMB8ZlIEInEkbSJPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YknF3CuC; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YknF3CuC"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3a4dda53724so122825a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 18:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791424168; x=1792028968; darn=vger.kernel.org;
        h=references:in-reply-to:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Y2bgZt5MD5Lp/ECTRNG1YjhY6IZxQDBoeB1q2mOYy8w=;
        b=YknF3CuCTQYdv2hN8R95ee33506VfWwkVnyGghFttOSZgh//E3s0U3DtGlI8ygIDG1
         TAXErALGvubb5ZP/Hxtec+NOxOLIH2U1nLTN0VNgyGLFmj1lFxsfEMbMDT0psno3Ws7R
         vWVy8l1hCD9wVfv0kHEnQdGGuHHAUs1gSLCHo22VRn2+regKTpfi11Ub7zP7YrPglgDs
         MPtXqqkaEEnDLpeXSXssa++HiNEEUM2u0NOaYjRxyl4xi8jCwzzQobdBmnymDqhk4IO6
         NE+GjORzBd34Xjl5JCouhxABy0ivnWjxDjOKsa9aD5VoEsHN6IrAt4NaRrs9VsfI7fJn
         UBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791424168; x=1792028968;
        h=references:in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y2bgZt5MD5Lp/ECTRNG1YjhY6IZxQDBoeB1q2mOYy8w=;
        b=Jfk4OPLWzF3n8MXTNw/16poUgKdx2cp2deVX++h16nmiCYQ8IxwcCAtbcbfQRBqHIx
         2Zy1S2ikJnl/UZrvZM+WsGRyEeVaR047nnRlXu3mZuxgQbY9NM5iKZbK/iPR1gs78Q7v
         36r8YFqAOFcC+JERLOs1jLtx/IUHGjCe/gotWjt9cVFkqeXmfSwfnUf5tOy9SV2qEmiH
         ZV7npb3c//Q4Zz2QGfzq31OL7+H+6hooBa4wfbGCRbeUacRnHhJsIrjY27XXygvvU00b
         h2x3sghq14tfG3YjUAfP2vmUB7O0Bvb+DpThYUv6lTcVeRu9RYoKSnGx3Szcx0ODG3bk
         +kiA==
X-Forwarded-Encrypted: i=1; AKwUvByhxbSLq7B1Q1GGAk9lMj/wBFsgHu5W7zRCoTaFlsBgnJshFdSIDgs22m48dMUf4VOXXH8SQsSno2NTz6E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZdxNCouBPb+atByQOLYupnPOoAhG3TIpxCi9Q221CemebuF+/
	0SoLlYHkjW0jmknO6UiP1A3B5e17zObJFI8HXfiz0AEMSNphnnrVogpE
X-Gm-Gg: AYBFou08j3D74SuFACAWWsUqFKOvhmUXvUG9F3FrLxm7tKgwqGBpMc/PkPtoenwbwLo
	8eL2W9Cz7dlwi8voU1JXt0zWCW7FkfkXRDCK/p7qQye/Kj7T4b84FQxH/1fgyBN8plHDXXTGNgS
	+Xsoyl2wMBrVN7q857ebV91/7Cwj2nacoajrSOZfwPHhC9MKj1O3ms7OlAWM5D5EeZdFrB3zw0I
	8YD/9DnnwV3mXV/a5y8g8HuYSW3ZqZ6oL58JN3oWPf86tDBIGPLKDlDBr2J0FK3qKxAeQ5eJhE8
	R6Ca0wUOp20adSeavCITageRw3JgSTjNWekQJMwqgjbIsXRgVsHSLdEmWqqp/QGaPB1Mmc1LlOm
	IAbSJF0SCw3u80RjZfMHrh2a6/X9zdE3CA5F8KTuAKf5o+IE6h7LJUh86xIIDV+D5aL9cRdTLC9
	4/FBb4ndbMAsCb00LshsGs/NfSuZKXD8WpRKtqN9lEr8JUqn5Wsx1DyxGjCQQvG5MBHwP5rIhzl
	Pqf1NgWFYKRlp4PkvirveAPsRhDg1T4D+M+pKuh
X-Received: by 2002:a17:90b:4b85:b0:3a0:8001:7d11 with SMTP id 98e67ed59e1d1-3aaab2e5f20mr1457182a91.6.1791424168414;
        Wed, 07 Oct 2026 18:49:28 -0700 (PDT)
Received: from msg ([188.253.120.76])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff5b3b06sm1854424a91.15.2026.10.07.18.49.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 18:49:27 -0700 (PDT)
Message-ID: <1791424156.460.8ed76b88c7@gmail.com>
Date: Thu, 08 Oct 2026 01:49:16 +0000
From: Qihang <q.h.hack.winter@gmail.com>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
    Ido Schimmel <idosch@nvidia.com>,
    Steffen Klassert <steffen.klassert@secunet.com>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    "David S. Miller" <davem@davemloft.net>,
    Eric Dumazet <edumazet@google.com>,
    Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/2] vti: fix tunnel device use-after-free across async crypto resumption
In-Reply-To: <179110850671.434549.2584497019282941556@kernel.org>
References: <20260930090813.73901-1-q.h.hack.winter@gmail.com> <20260930090813.73901-2-q.h.hack.winter@gmail.com> <179110850671.434549.2584497019282941556@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

All real, and vti6 has the same problems.

The dev_hold()/dev_put() idea assumed the callback runs exactly once
per skb, which xfrm_input() doesn't guarantee. IPTFS frees the outer
skb on its own without any callback. The early drop when the SA is no
longer valid happens while family is still AF_UNSPEC, so xfrm_rcv_cb()
can't find the afinfo and never calls us. And on the success path I'd
drop the last reference before gro_cells_receive() is done with
skb->dev.

So I'll drop this. Two options I can see for the respin:

Re-lookup the tunnel in the callback like xfrmi does. The only key I
have there is the outer addresses of the state, which won't reproduce
the original lookup for wildcard-source SAs, and during teardown it
can pick up the fallback device instead. The RCU section also ends at
gro_cells_receive(): the skb queued to the gro cell is processed by
NAPI afterwards with skb->dev still pointing at the tunnel device and
nothing holding a reference.

Keep a reference from vti_input() but release it when the skb is freed
instead of in the callback, so the paths where the callback never runs
can't leak. That looks like it needs xfrm core support, so I'd rather
not pick it unilaterally.

Which way do you want this to go?

pw-bot: cr

