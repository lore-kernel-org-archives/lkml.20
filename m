Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792608894;
	b=ahVAkZ4Dc0Xzd0Kxr8BHvrFpk9oP5MwcDXiBI317AXtWXQBSOPHXfYxlPnuY7aXfkTHA
	 /wjyMtHzzBwoBBHISrSNIUI44N0kuW6FHQespIqB7AX7LfE0gKKINX07EOjVQWR+HV6Yx
	 faCULHuFvy5q+keFGRfwl4gJ6AofCw3wSMFboKVkRVe1EIVEMVVCao/YdhjukIlbZky1N
	 t3sQl8PDe+jHvDCGohWiC+hPP3d+jVNNtOG+K2IveX4HgMuqGeubAlfv0ORpXpHNLccQX
	 Ec1D1JNDSsrAiBhfgbbaqmhvdLioxvj5UxZ6UyC2MkOwJygF9Vvw4EXzLr4aj83d4fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792608894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=FAatMgI47RcpdmhEQp6ZyvK4uPwUgdd9UV442LX/ajU=;
	b=CtuCi4DLmAJSJYpl9KzJKpV03Ho/rt67HCPh1OpeLxIWreMckKTZ/HQ1NMTP62dqcobM
	 YN8kNNXWlS+QnNUQoW4Rbe5f+6Ne0HfNWJ+E8/gNrgw2Z2GEuJqABNFr2rIZa7U5x79B8
	 Z8bOoTM3YWMbMV+ErseoR503Wg4Xzt+FyLelw0dURgMo7AleNWn6conTDb5Woic1Fbok0
	 dLuLbRcqIjOc/Vi8ZdaJX0DAAAxSJE/Tlb2b2R2pgAozMAVAy5MsyQuULoOJbEidQ64Uk
	 W2UVm0rcKX6z8Ahxfhv7nBQqumvEQ63JwuqrB76rn+e/kxqJ0l7tVw6FgULWQ4v7hpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tavip.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=LGcU870u;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257FE606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 257FE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tavip.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=LGcU870u
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac77c3ff6aso1481103a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792608893; x=1793213693; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FAatMgI47RcpdmhEQp6ZyvK4uPwUgdd9UV442LX/ajU=;
        b=LGcU870u5Z845mAssJrD7t5PpI+IB6Wy6jwaEFdphwrPGGvwvHLgQqIVzPq6UMMwcD
         wFaDsRLlcG5EDUIGwpDdIxqspNzPL9Mu1QFlLq12D9LLsWFHQa0UmdbU0cppmQF6Qlso
         Q32cO3TA0mneVQ4GBnJ2ek25jDWZY4UV4Z3LgECUAYtbID22Hydp0DFeS8UCkex+dzja
         7Le6Bnwo5J8qx3kh7Qe+gWJ+FEPo9Kbl86ZJHQBbTm4HIXgyqGjNgsCDUwGSeH0h7q+Z
         vs6YTrZyd0UqT8y2oKb7wtZgLOPlJAN1w919sPjR69jKuCWlh3EikcX91v17rErzDN3R
         gJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792608893; x=1793213693;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FAatMgI47RcpdmhEQp6ZyvK4uPwUgdd9UV442LX/ajU=;
        b=QLevhS4KVk4jqaJx4y1lu9HA5EB+fdD+DAasIPPzZSh7e+W6gswaG/+zJ+RnzI1Y9C
         TQxzod5eNPpK7WxMLfdija/jgtW5uJpGM0UDSfN00oes3KA+v12g4YuKZ00H0QlEMjkL
         z72Slok8jDH9lnDCo41OhG8i3vr3K8NNoXfKB6eQONsSgDexSIK1slZgaEwoDux1t38U
         wyq5ztfcefVIQuo+V4ndW3aO2CXwnMcJh69mSEy5ffpWGE3QBpWgAb0inw46av+SSPBI
         mc7fj/5If0Hh8XJFj9QHxlfiG6V9woTpUP9VKXPxvNSNsd9dp0nCobcZnRLpwb572jWH
         7Myw==
X-Forwarded-Encrypted: i=1; AKwUvBzwByR1+3311F5SUtpXmh7qfSeiNxFqSU3uhlBbXdy3pSP4wKXsxdGnPPVgAWR+aMbsg91WfjV1kKomk8Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfw1WetlBiMh3atno6UVZm7/aXFLjBBxj9edAwRSoWf+FMGEX/
	srQNeZ3SUs1Tha+2YlUhjMCxoz9LJIt/aVEZqPEqK279KHAoWaj4emHvitOBbB2skF66DFgpTzk
	L2Q==
X-Received: from pjne1.prod.google.com ([2002:a17:90a:8181:b0:3ab:2711:625])
 (user=tavip job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3846:b0:3ac:85be:cd52
 with SMTP id 98e67ed59e1d1-3ad86f7388cmr2885901a91.59.1792608893355; Wed, 21
 Oct 2026 11:54:53 -0700 (PDT)
Date: Wed, 21 Oct 2026 18:54:46 +0000
In-Reply-To: <20261021185447.2914274-1-tavip@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021185447.2914274-1-tavip@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261021185447.2914274-2-tavip@google.com>
Subject: [PATCH v3 1/2] tcp: clamp return value of tcp_wmem_schedule() to non-negative
From: Octavian Purdila <tavip@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Wei Wang <weiwan@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Octavian Purdila <tavip@google.com>
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
Signed-off-by: Octavian Purdila <tavip@google.com>
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
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
2.56.0.307.g5fe7bd680c-goog

