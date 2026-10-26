Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792984941;
	b=3MZIbvAHs51xqYRCt9lnGX5JOWSapbFcLuRAVOohNRpbbiXLOTYLyzhley42siel2/y9
	 UqZVL9VlbSWzH8OHJk1IflQIwpSXDphzWliJUCNk+qE6v2wQzt9uMYHVdUKUIVfcGscXZ
	 xqcZEzUizIRhI/dzFZZsDOYvY3qpau12xcm9I+ucBvO/47wQNivBPoVNMi+5htYG5BXkP
	 R7sXHrijC6oa+r+9FtjeihwUgDd3dNVek8jbVxljt6dOh5c8LWMCRyZBnWheaqN0M61Z/
	 2SQ9WlsjRDhzQJfzb0StZ/G5bJ9GusBnIaM5eYKtyFKES6LnqBKXOtEs8fQTbdEr6Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792984941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=uJyYymouqBQHX6BWujXvWQ1rvhU5zBX4eBfxY6iRb/I=;
	b=Lyj6qkXlgEKa/x93lOXE4fAkjS/2XGxznTHMjFU1yxArkuXo7L1Q8JIGt4VzLE8Uf/Bf
	 3s1hK3NoNMrNYBMOyCA4+Za8grG3Dtew9drXiSwXvYj+/4iOvz/hvkgFoeBuJTl2ckk8s
	 DSz0n6RAKVkLZAmL0AYTKqlWrmMTV5TQ7Jy/qbMZrPmtwXvDuwOvamSUQJSHWyE33+vuu
	 WoVIvBtJ4ERwSk9dy7Ft4bzYD15xvFsTzAXnzg/bfbwb/V6ZoaY1vc1krmBuzmWdC65s5
	 b0zbZsHjsNymITTxo0IzP2OysbwVNj1DYYsVSdwlyWmVWvqhEjV6jlTKRLXetbsZitg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tavip.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ERs79FtN;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FCD606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0FCD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tavip.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ERs79FtN
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eaae8d29e0so8825235ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792984940; x=1793589740; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJyYymouqBQHX6BWujXvWQ1rvhU5zBX4eBfxY6iRb/I=;
        b=ERs79FtNO9thnP1VqmFeDHRIDl9UWzwYvyzAuD/2OStrEBGF4w/JdXfASRhKW4kJLF
         OMk9tIq9NT9OxTB4iBe9Z2Wu2rL/t8uKLjurVf0IoUc5iINwLcRiXFC1TBO7vvRytsPm
         MHN3OgLyhI7EHz6mndJTFXYZFTPhD5LoVgSKbmq4HBaHdFIvmo4rZObBy6tKm/PLPc7N
         nY32zo7vkfa5s5qGZtbOzyh6pDwUioLwAH7RpJJuL2bJQr7j/OwWw17hQF5vTMuvFiYQ
         1/qqep5uuwJQEy3DhrO2T5oaByHxLDgRYCyDl1EvUarCjVpNQsfgUoLgr3d1yD4WBjo4
         Hx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792984940; x=1793589740;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJyYymouqBQHX6BWujXvWQ1rvhU5zBX4eBfxY6iRb/I=;
        b=sfwHv8emFuiTLyZvufPmszzEb6oO5lPXtTk9v5EUDoAQZq9Vol4jiOq7r8F4VwHNXH
         1+iXoONhF7OmXPbfQWXp5GEZbmQdwmuK7aao1+VCY1yVvxk8DEkGYujg88cvna5fKW5e
         cVdkTiHSOHxDLPTNOmNEo9Jj1TyJKdt2NO7aTsNkUA/uuSiEGRLLQLGw09kWrDKPup3E
         Oza41tR+Bw8/3HG3F8JLTxd9cldNsh+X7wSVLp5rx7WlU6jsZBtNqcYTvWeWl0l6+xFZ
         Qj5NLAzNbJo86TkknyJYvSpfKnK2x/brjLW9OEtl1r6TQYHFGPoI7RtqbWxUDTp7VI/G
         +xFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzsMAFVKNhNeb55Ol/DJFnsvwY8XKbsGhverNZXD1brbiZMrR+BOFQJeyefoaTE/Bi4y2Q7LK25yiaaF8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeqnleW0dMg/xxgi7ydhINev3bIswG6bQKqcWakNtBqL4KzBRo
	Oxm68JWsRXPf2T9/F0dLNeCnxMNr69X+0iAIJ16nDxVL6U4DVbGUmFkVKaxvX29w2b8K9PYomv0
	vbA==
X-Received: from plbbi9.prod.google.com ([2002:a17:902:bf09:b0:2e8:43aa:1e5e])
 (user=tavip job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1968:b0:2e9:95c0:7c50
 with SMTP id d9443c01a7336-2ea9c95ba36mr40443685ad.71.1792984940101; Sun, 25
 Oct 2026 20:22:20 -0700 (PDT)
Date: Mon, 26 Oct 2026 03:22:15 +0000
In-Reply-To: <20261026032216.1145201-1-tavip@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026032216.1145201-1-tavip@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261026032216.1145201-2-tavip@google.com>
Subject: [PATCH net v4 1/2] tcp: clamp return value of tcp_wmem_schedule() to non-negative
From: Octavian Purdila <tavip@google.com>
To: Eric Dumazet <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Octavian Purdila <tavip@google.com>, Eric Dumazet <edumazet@kernel.org>
Content-Type: text/plain; charset="UTF-8"

When sk_wmem_schedule(sk, copy) fails under TCP memory pressure and
sk->sk_wmem_queued already reaches or exceeds sysctl_tcp_wmem[0],
tcp_wmem_schedule() returns min(copy, sk->sk_forward_alloc).

However, sk->sk_forward_alloc is a signed int that can transiently
become negative when tcp_collapse() re-packs partially read or high
payload-to-truesize SKBs in the receive queue and charges newly
allocated SKBs via sk_mem_charge() before freeing the original SKB.

If tcp_wmem_schedule() returns a negative value, tcp_sendmsg_locked()
passes that negative copy length to skb_copy_to_page_nocache() ->
copy_from_iter_full() -> check_copy_size(), where it is converted to an
unsigned size_t > INT_MAX, triggering a WARN_ON_ONCE(bytes > INT_MAX)
in production and returning -EFAULT instead of waiting for memory or
returning -EAGAIN:

  WARNING: CPU: 1 PID: 939331 at include/linux/thread_info.h:249 tcp_sendmsg+0x10c1/0x1530
  Call Trace:
   <TASK>
   __sys_sendmsg+0x292/0x490
   do_syscall_64+0x88/0x340
   entry_SYSCALL_64_after_hwframe+0x76/0x7e

Clamp the return value of tcp_wmem_schedule() to [0, copy] so callers
treat negative sk_forward_alloc as 0 available bytes.

Fixes: 849b425cd091 ("tcp: fix possible freeze in tx path under memory pressure")
Assisted-by: LLM
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Octavian Purdila <tavip@google.com>
---
 net/ipv4/tcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 87ef6d5cbfeba..0e062fcd94a6c 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -1037,7 +1037,7 @@ int tcp_wmem_schedule(struct sock *sk, int copy)
 	left = READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_wmem[0]) - sk->sk_wmem_queued;
 	if (left > 0)
 		sk_forced_mem_schedule(sk, min(left, copy));
-	return min(copy, sk->sk_forward_alloc);
+	return clamp(sk->sk_forward_alloc, 0, copy);
 }
 
 void tcp_free_fastopen_req(struct tcp_sock *tp)
-- 
2.56.0.257.gf7497c7d27-goog

