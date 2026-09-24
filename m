Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA2D386C21
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243781; cv=pass; b=YSQj/c+79YJKk4RR5BIvUsRYxXbS3tdHf9uwxVi1ZabAQTupjpArmmwstaxXTCKg45K4YFIM+uI6OZlCzxZxSX55Uv1oLfe4T2ZLKuGmJTqhPAEK9KxoyRsDqLV+8TPz9cRZHHQOsDSm0HdtDZwiDoaRyTnyaJhGvwVB9zRx3Ts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243781; c=relaxed/simple;
	bh=LBZZcNSVeHHRIpD1xuzWESX6CCgFGvOZ+4ZFnY2ewKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MBckpy8lzVA8lyWisj8Pk+iTqjRIJf+niqj4KxoH265Jaqz4wC4uR5CT6OwRksHJTwEkMdiNbP8JJ3UTK7RI7GvLHj8QqUZMjShrLD2O6EhT3Lu8ScCS5TzHFN4M9ySaOB0GsQgngy8F+b9WfITWaH9ARbM3Wnx32/6ponSQNo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JODW4//u; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JODW4//u"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-5309a20a55bso16794281cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:56:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790243763; cv=none;
        d=google.com; s=arc-20260327;
        b=itnkCBiW4iWkkDt55ILN9IrKUx024w6flJF/V7S8gUqe0QYXfpG7q3HzvJScZj27wi
         WeJKnZo5ZZAIfgt71/y2y86jSQZhY80WoAFyxEKE/eftHd2QOm8+vLXXlbBaO02jm1bE
         zTIclXfA5kKwuNhPBsn9HqPRdywM8xFdkp7RRC/VRuoRMG5eWQS93uAjdWYM2DL5xhzv
         dO/bDKxGhjUrSTvpv0NcAD4B71sHvfHB0DREGa+9GZskWzAhC2/EuQOAxQlyQHS+NnCg
         rbHqQ6T6Razdk7wSKhM5wjI/gXnoMK6YmIVkL133PfvY5eWvpgf8ApQMNhaEjMgcBeSY
         iTaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rM8Pnb3OaTJqlPgDl5Nu230H8PB3TRPyBVd+A2AcpH4=;
        fh=uixnlbY5VajkxdOM4a2i/zq+pjrdgsVVThMdaMA1vw8=;
        b=Y9m6c7whJ2VjMtiUQWxtyOcVSEGXu2IoSw1nQJfdIZiBoO3XGCzR14r2yPQpx0gau9
         6oPTnw5G2X/pZWAx0q1xwgCU4D+qSnLMiqw2JKS9XSfkalkae5D3goLwwmUAwBiR0wHD
         P17VXYUcbiJ1Vvd1SYrL9Q9f7NfM/wmlqBbXXcfJ//AHNsQe/vS3b+QcUdzsl04BcmEI
         o+tN/lwqvxjR3iOa6jpraJ1qihIaxcZcp5xmvIoVv3TDZ0cukB1Su5CHC90lI/mRJrBf
         jl8TWetU5+Kimw4Vnm0RJQXUtaF+O57h+6mEqJL9SGX3jlcdAgd8tx0vD95uFhz9cEkx
         EYiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790243763; x=1790848563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rM8Pnb3OaTJqlPgDl5Nu230H8PB3TRPyBVd+A2AcpH4=;
        b=JODW4//u3KjtFnoafHckYjbn/WXha6Zo9QUiqtgARpc7DjBG0mhE0WWH+hSp6QxsNm
         RfYVeBrlMNaoigggDW6bLYZkB/uWJilNXDFvbdrL36dL+fm5HmpCEUZ60jPpRQYZCPAw
         C/PM4Ypr9TRp0aRT/iAXkY+ck9MM5VKEqtGOKkZwp7Pe0cuc2nCPFuoFVFFfi7IGy3Kt
         k5Fv+L7nfpY1z6MkPu1vtql9PBXlqQ8A130evougp8/k8OVH0GzSToEOXITzEzSv0+0O
         hCpLEC4ltGH4PCVCEyb0S5OvP3NAzgIqZsERBJifrjKchVfuLn2YBZKdazPT5ztVnquF
         CRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790243763; x=1790848563;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rM8Pnb3OaTJqlPgDl5Nu230H8PB3TRPyBVd+A2AcpH4=;
        b=ISc4ClCFJOXRmxiZN/a/RgSI20GmKsL9xzk6OBEBoTTLagY/XwM/4+lKT27gMsXOOU
         MewVe2qwSwy/usqgifvNBNbQ0xB7qgXh0iYzgBDa84BFjmTfeE7eEqaDWBv3gTXgx8eA
         U6qSE/297uheNJfgtgzsPr6x7w+DqteLlgs1JixlfruZRjFTDWXvxUfO+ABPXUjr0oED
         TAr/vSF0IHXVNN9sHVJS/Icu66UX47YDu1zTVeznMJAg3R4j9Lh6Ql00Tvz8R3CEnhxW
         m2l6dU+kOeNUCEIWKVYXelcfLd2s2K14dRGPtwPcD59UquaRbaRhpUCqnLl9KRdkzStg
         tE5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwbbz7YocDCnPYx5dBsgGCbRve5YB/Ngf8STFbV/OkSIyZuUTusqpYM+1hUPPl6c/SMlaIBQf/jNlm/ez4=@vger.kernel.org
X-Gm-Message-State: AFuF++lGRPO/AWy4tsh7NnxqFKeCgoTt1HLAxQc1vAB/0BwwZUUt4nny
	fEeGFkWQaSEg16s83ny+mM1phJvSErlI5EVzxgIOccHYBYnU4qKHSKG73ItyVJ/k3s87Rr3Ni3n
	4XiDRHrOLkQrLM9QN6leIxet6zQy+x68aIrtR6Ygt
X-Gm-Gg: AYBFou0fGsOZKpJ9YnNrATcLqqlTMHkR29kiubhgM9qfVrujyzSUTIcZgRKmHLAnKZK
	zozE5IRbKJVyscbwgyLGLvIoMiY8Ptg0ZlwZEY/yvtvLNFMlDmKFmelAMc5tXE0qpTFj2G5p9+O
	h1RhblMtuAMmV+um6hrjHjRAgjsxjH93oUYw0KY6H/S0mByw410Rv6OyKI3h1A+dCwT6Ixxh64B
	Njz7Uisx93iLP4PghFX3MrTHr3xVGUOSYTRpw9alL2dYe8NLKpTqWG5w1O1MMU20Zox/Larnyy+
	c0I+iyIVyqgoe4IyCaRkKcnLRBPaX3l7g9DtE0N+24dRLjHjPBN/yS0QXWpLUW/lXG/5XxNec+4
	ODgAAKFxR+cnk3pgTpu3skyFUI49xp+JHDqYIOSufr2itVHwSDMvoJyizscTEY9G54bGk
X-Received: by 2002:a05:622a:5a0f:b0:532:8f15:2744 with SMTP id
 d75a77b69052e-532fea4d150mr14339051cf.20.1790243762050; Thu, 24 Sep 2026
 02:56:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924080219.1036588-1-caixinchen1@huawei.com>
 <CANn89iJVGmYwQerOixGurH6vw-GtvSAQq6u6zSNZoyZrcEx6Jw@mail.gmail.com> <d8c12b4e-4ff2-4c62-a40d-d67bb4680a0d@huawei.com>
In-Reply-To: <d8c12b4e-4ff2-4c62-a40d-d67bb4680a0d@huawei.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 24 Sep 2026 11:55:50 +0200
X-Gm-Features: AclHuK_LOWvzBhJczhAfbtW30YiVgV1gD1vN5_bi3qPOiAKB6UaaHqyDAfOb9kg
Message-ID: <CANn89iLA55e6evpx__7AUQF45uYAbUHxRtz4rVT=vsKpqBRWkA@mail.gmail.com>
Subject: Re: [PATCH RFC -next 0/5] net: charge socket memory budget to memcg upfront
To: Cai Xinchen <caixinchen1@huawei.com>
Cc: tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, kuniyu@google.com, 
	pabeni@redhat.com, willemb@google.com, davem@davemloft.net, kuba@kernel.org, 
	horms@kernel.org, ncardwell@google.com, matttbe@kernel.org, 
	martineau@kernel.org, geliang@kernel.org, mhocko@kernel.org, 
	roman.gushchin@linux.dev, shakeel.butt@linux.dev, muchun.song@linux.dev, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, mptcp@lists.linux.dev, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, lujialin4@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 11:25=E2=80=AFAM Cai Xinchen <caixinchen1@huawei.co=
m> wrote:
>
> Hi,
>
> Thank you for the review.
>
> We found that sk_forward_alloc is a plain int updated by a non-atomic
> RMW (sk_forward_alloc_add(), where even the read side is not
> READ_ONCE), and its writers span three unrelated lock domains:
>
>    - socket lock, process context: SO_RESERVE_MEM and TX grants
>       (__sk_mem_schedule(), sk_forced_mem_schedule());
>
>    - receive-queue lock, softirq: UDP RX charges and the
>       udp_rmem_release() fold;
>
>    - no lock at all: sk_mem_charge()/sk_mem_uncharge() from
>       skb_set_owner_r() and skb destructors, and the sk_mem_reclaim()
>       fold itself.
>
> Any cross-domain pair loses an update.  A lost charge is still
> returned in full by the matching skb free, so it resurfaces as a
> phantom surplus in sk_forward_alloc, and the next fold hands it back
> to the memcg via __sk_mem_reduce_allocated() ->
> mem_cgroup_sk_uncharge() - an uncharge with no matching charge.
>
> We first tried to fix it with locks, and hit three walls:
>
>    - the socket lock cannot be used: its holders free skbs (e.g.
>       tcp_recvmsg()), and the destructor's sk_mem_uncharge() would
>       need to re-acquire it - recursion.  That is why these helpers
>       are lockless in the first place;
>
>    - a new per-socket spinlock serializes the RMWs but not the bug:
>       __sk_mem_schedule() publishes the grant before the memcg charge,
>       and the charge may sleep (GFP_KERNEL, memcg reclaim/OOM), so no
>       spinlock can cover both steps; a fold in that window can still
>       refund pages whose charge afterwards fails;
>
>    - such a lock would also sit on the per-packet charge/uncharge
>       paths, exactly the hot path the cacheline layout around
>       sk_forward_alloc was tuned to keep cheap.
>
> Are there any good solutions to solve this problem?

Perfect, you now gave us what we need.

UDP is broken, it should be easy to fix without breaking TCP.

I am surprised your LLM went to a completelly broken path.

sk_forward_alloc is never supposed to be updated locklessly across
multiple lock domains:

- For TCP, sk_forward_alloc is strictly serialized by the socket lock
  (lock_sock / bh_lock_sock). TCP does not use sock_rfree() as an skb
  destructor (sk_mem_uncharge() is called under the socket lock in
  tcp_eat_recv_skb() and sk_wmem_free_skb(), while TX destructors
  sock_wfree() / tcp_wfree() only touch sk_wmem_alloc).

- For UDP, sk_forward_alloc is serialized by sk->sk_receive_queue.lock
  (in __udp_enqueue_schedule_skb() and udp_rmem_release()).

Your reproducer and analysis point to two specific places that violate
these locking rules:

1. SO_RESERVE_MEM on UDP sockets:
   SO_RESERVE_MEM (commit 2bb2f5fb21b0, "net: add new socket option
   SO_RESERVE_MEM") was designed for TCP, where sk_forward_alloc is
   protected by lock_sock(sk) and sk_mem_reclaim() checks
   sk_unused_reserved_mem(sk).

   However, sock_reserve_memory() only checks sk_has_account(sk), which
   also matches UDP. UDP does not support SO_RESERVE_MEM:
   udp_rmem_release() does not check sk_unused_reserved_mem(sk) (so the
   first recv() reclaims the reserved pages from sk_forward_alloc), and
   setsockopt(SO_RESERVE_MEM) only holds lock_sock(sk) instead of
   sk->sk_receive_queue.lock, racing with __udp_enqueue_schedule_skb()
   and udp_rmem_release().

   We can fix this directly in sock_reserve_memory():
diff --git a/net/core/sock.c b/net/core/sock.c
index 1d5927cd49a1..763c2017d9ef 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -1034,7 +1034,7 @@ static int sock_reserve_memory(struct sock *sk, int b=
ytes)
  bool charged;
  int pages;

- if (!mem_cgroup_sk_enabled(sk) || !sk_has_account(sk))
+ if (!mem_cgroup_sk_enabled(sk) || !sk_is_tcp(sk))
  return -EOPNOTSUPP;

2. BPF sockmap (net/core/skmsg.c):
   As you noted in the reproducer comments, sk_psock_skb_ingress() and
   sk_psock_skb_ingress_self() call sk_rmem_schedule() and
   skb_set_owner_r() (which installs sock_rfree() as skb->destructor)
   from sk_psock_backlog() or after dropping sk_receive_queue.lock in
   udp_read_skb(). Calling skb_set_owner_r() / sock_rfree() without the
   socket lock (or sk_receive_queue.lock for UDP) on protocols with
   sk_has_account(sk) is a bug in net/core/skmsg.c and should be fixed
   there.
