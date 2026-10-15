Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46812476CF1
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049871; cv=none; b=DWEBGF38OUg3zGJDqy/5hlydAh71UFgh9PexO/WJCPC5XA2Atw8cXVtuoPoR0HyreqKevtn3lVmeoXq8Dajc0pbBapdAkgbMTb2aBD7SVGtqwlxi+jb1V/76ixolHcThY4TWyyUWyCwOHg7oYizOzmfdSndpsIBoNJR/atPbzso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049871; c=relaxed/simple;
	bh=7VhssldhEn1SH6TcBBPIWkuyOXVfHEC4iqR4M4KlGbE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=kxgib368E77+8gntPErQzbv9HSmV7HcbZviet6J+VvwoHPV1VyXJDCgJ+LVcDd8EYxJuvVAEODEkiF9RVf5ZsPtK2+aeINEj8LKC7pugmXs+dAVnAR6TsZ+TulNKOUHUSm5tHwXNyxLC5uBIvEW4VD7Kr0vSujB/oLwJDBRo5I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tavip.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HIuT8OL+; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tavip.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HIuT8OL+"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so1368412a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792049868; x=1792654668; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Be8sy8Bdn5ONmnvgzJDmAuJ13byc/JKsc3e6N06ewxs=;
        b=HIuT8OL+zlvsAVEP5a7KvTMGIuqRZMYp7NN8I1G4aob5sWO9vtEDJ7xYwgj7xiDnBb
         GO7fMoU3autulH4rm6wBsqHIujBunYX5QLwxdiuM41ZhXgQl7ey5nf13HaynkmNRXWba
         LoGKXkAl+lcjiuEy1/CBFV3v6Wv7YnsswELs8uDCKpErmp95R/oJH/YeSejAOaioG2oY
         jv9MhpN59RCK0U8uWFbCeGdsNf7rJXlGER81CZNgtk3s+OIEOyg01iv3FsWQGlFMYFx2
         b2F+JqisSxi40Zc9ofnrkqR6yMk/0dHbrJF/ZJxuipzYO7nzcOuRwU69noQGdOkG4VjQ
         2gtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792049868; x=1792654668;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Be8sy8Bdn5ONmnvgzJDmAuJ13byc/JKsc3e6N06ewxs=;
        b=NctvJlqJNuV/5uhw81C49i1WMKF4DMMdPhWoeRdmYzlUi2SM+bitfPnXiB3M5Qf/5s
         ZMirmw7PY8uLU3fPtnmqhUJV5Z/m6hgMpdNwFN+wSffhppFs3dizxeckVuzC+QijaAe7
         Sa/AuGnlXcZJnA8/NKzsSIIsovUpzkx8WXmAIq+1Y8ec7PNyGVybFwMCTE3kdI0QBmUE
         3PGtQg07/LJ0hH8zO17QaaINPbz8ogeZe+LHW5zKCgID5VTS7jc2OCv/GuRIuAUvEk7z
         Nq2VFNl/jdF8z7JCCJ7Z2FFcyR/7JR4Emuu8HKIvFvSkw2JdrYqIe6P7U7IpdbzUckWU
         sW6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzg/wJu9KpArg1E/WRDOGJfLvoW+axFJAG7YKJlMTTV2AHTuNlYqN0bVuYM0qnxOxKDN/6nVbJJ48AbvDs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKLZFXjKaQqmvpuB9s1S4zOT1rJXNq84GeBKLdyTiyurTFX6QX
	vfpOEC8OKLwgLLfqlmabAQlTPNjOkpjUzyT8/FYXHLzhP+OZIH5WrqGia74HHlIRym3Zt1Ovt7f
	7gQ==
X-Received: from pjbil8.prod.google.com ([2002:a17:90b:1648:b0:3a8:28d0:2510])
 (user=tavip job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b:b0:3ab:2c2b:1030
 with SMTP id 98e67ed59e1d1-3ab3a747cfcmr14208135a91.22.1792049867875; Thu, 15
 Oct 2026 00:37:47 -0700 (PDT)
Date: Thu, 15 Oct 2026 07:37:34 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015073736.2944215-1-tavip@google.com>
Subject: [PATCH net 0/2] tcp: clamp return value of tcp_wmem_schedule() to non-negative
From: Octavian Purdila <tavip@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Soheil Hassas Yeganeh <soheil@google.com>, Wei Wang <weiwan@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Octavian Purdila <tavip@google.com>
Content-Type: text/plain; charset="UTF-8"

This series fixes a bug in tcp_wmem_schedule() where a negative
sk->sk_forward_alloc under TCP memory pressure causes tcp_wmem_schedule()
to return a negative copy length when sk->sk_wmem_queued already reaches
or exceeds sysctl_tcp_wmem[0].

sk->sk_forward_alloc can transiently become negative when tcp_collapse()
re-packs partially read or high payload-to-truesize SKBs in the receive
queue and charges newly allocated SKBs via sk_mem_charge() before
freeing the original SKBs. When a subsequent send hits memory pressure
in sk_wmem_schedule() with sk->sk_wmem_queued >= sysctl_tcp_wmem[0],
tcp_wmem_schedule() returns min(copy, sk->sk_forward_alloc) < 0.
Callers such as tcp_sendmsg_locked() then pass that negative copy length
to skb_copy_to_page_nocache() -> copy_from_iter_full() ->
check_copy_size(), triggering WARN_ON_ONCE(bytes > INT_MAX) and
returning -EFAULT instead of waiting for memory or returning -EAGAIN.

Patch 1 clamps the return value of tcp_wmem_schedule() to [0, copy] so
a negative sk->sk_forward_alloc is treated as 0 available bytes.
Patch 2 adds a packetdrill selftest that reproduces the negative
sk->sk_forward_alloc condition via tcp_collapse() under memory pressure
and verifies that a non-blocking write fails with EAGAIN rather than
EFAULT.

Octavian Purdila (2):
  tcp: clamp return value of tcp_wmem_schedule() to non-negative
  selftests: net: packetdrill: add test for negative sk_forward_alloc in
    tcp_wmem_schedule()

 net/ipv4/tcp.c                                |   2 +-
 .../testing/selftests/net/packetdrill/config  |   1 +
 .../tcp_wmem_schedule_negative_fwd_alloc.pkt  | 116 ++++++++++++++++++
 3 files changed, 118 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt

-- 
2.56.0.176.g3575e65682-goog

