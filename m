Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C482343F4B7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238405; cv=pass; b=J6OIVTbT+uoMLHVnkITbBBMF+9/A9oVu/WvqetzNYxGrQB645dVBQDB3ncwDmBBzVUKNA2YXjA3Kki3i54wTX1koebSsqylUqSe9hx6Hc2x0rtimmnM9hGB+dAFVadMFv+UbNBLUg04cvnaiM2MX+2sW7exTISX8fERvniNkHRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238405; c=relaxed/simple;
	bh=svx/lXpxbyRvC5hg9Mf7leQZBgztlGdMd/1meLurTMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b87Ru1Ws/Wkp7iHulekoNBbc45w6G3Tc6/sOECLVx8E/jgGEOieWiXtqmFKDmp6KmOIQkdu+9EoImUA6oOPVIoRwIHo3EdWzBSiKhM3B7mVu4CZI8u6/H7vW6IhjOnyn+b1yQI5BozuSYSprl/wuHw4CzvGC1rCSfpDzQzSG6j4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GbaUbnw3; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GbaUbnw3"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb767cc71so15441471cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:26:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790238399; cv=none;
        d=google.com; s=arc-20260327;
        b=q9BnS7JbqM9zY73/cd7jTu351jWWGiWaEOg+5qJYQbmiz2Gg3QXvvD7CgX/h7zx4ky
         gYMIkZIGD2C0N7Jfr7CfK6hJ7EJTXLBdoQ1aogmOcXidS5D84qekvieqZ+IdzW3FO7dq
         yeXk+VCxz+U7rHElXb5yQ6g2yIaLj/Rr/t3YFApRzc0V+S/XnV12bvuhSoY6vbCYhtyH
         NtJMuHSKYQfrYAbvO8/PRrYnoNSmBgwgPIfFKCGXmoyNMbAjEK6JZrBkXSGeM8Fq3CCr
         Xg0or2w+WRkaGMttqywAEj4F0F3an3ZHRvpM8BXAg3qRAKuzLMgj1KAPtH6BJA4bZFa5
         0HQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Djx86NYnyz/9RFz/5fi7+M66lo0Fi/FSUEqHr4nGVIo=;
        fh=DZ27ofJJBJzsyp4enC/e6T3Vcjhpi8aXg4++TWCFM9Q=;
        b=n8xUc08YC9IXIYG+NJ++9ovsZOx9VEbyVesSVKry/dzVeCVRSDsRQjHx4wcbQQHufM
         tlCOiehkdf2UmhzflXMQNCSw5EhRF2ciVrt+NM6ReCdryJakC9OnUVQ/i/EwNPJDQsCZ
         YKIP+huLJgzMyrMJE/dtdpt9NxH7BVehpipcptTd9kAaSc0e0J5vAVF2GIFJ66Fyiw0f
         TajxHXIHq/LHlNseTvUQ72tmbCbwsbgCt3kViskhtW/wRa+4pg6It9n1HcmFfY9iHT30
         JBCrMREggCbUWBrDah/0mIGx7LtVXb+YULU1rJ/PreEGW1ld95ademwmj+R33mLrHH4+
         HCBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790238399; x=1790843199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Djx86NYnyz/9RFz/5fi7+M66lo0Fi/FSUEqHr4nGVIo=;
        b=GbaUbnw3MbE4686aB+MUIX/nDidDE5Z3rBo4OINjyQc5X+3lgamt4CS62TDWDKCzf4
         3YX0Zu/YXQveN+I17TTkN6ju8/1eSPhPaSW2cEdqgAfj0cfBPDVIXIwrFy/aY0F0wwgO
         VH27RZJnQx7wBVgFWGlJNReK97nLue5IdRNvUORFBBbNku6xLlOUNAckvX7mxVU/39Bl
         7/BmiqJtr97Sw1pr4pBxWv4fMGQuBDcxVSMncumxC4o/Hpz1jHnJ1aC5asLvz2+FVkxm
         bRLxuEOE1Lz80cbD16xla54/+5FPb3Dwle2zh+7Ncw3lP84bGtx+8pG9M5EyKrvDY9TN
         k4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790238399; x=1790843199;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Djx86NYnyz/9RFz/5fi7+M66lo0Fi/FSUEqHr4nGVIo=;
        b=c6h4eTR9BHp7FqfsAq4wvbZYK7UeKf+VPw3T9Ce2YtE3LDsBM5CuhvDTKT2qzXp9GP
         y9QRnpuAtkJK7VYFdzsJJ8MsppgIBWCKEK0uFd6oplNoMsfz5qZZHdkXnVkWXOwvrxuA
         aZwhmi41wLVUMBQb0xVnHEVcytVhQGLxWc4+SNjw3c+cRscQNUrqjtQDq8wPgPOwEY5R
         qqX/nUx3mz8EIZRP7T5dQ4Chf+viESKAaNpvYg8boepUZYgvD/7xOaZTXqzj5gjZMKcw
         i7w2xe4uvxlIL3MvirdfB+Rd6sBJQlhZHZuK86nTwZJYYQZQ6NAb+pyk+jWhs1oQYSpw
         WYwA==
X-Forwarded-Encrypted: i=1; AKwUvBzOlJ7/MoraVVxTfi1cJphGPav0DfM8/MmdbyNdTMoF+UXuIR/3vqDSDgTftDH4g5rMz4oKsNn/ZOh02no=@vger.kernel.org
X-Gm-Message-State: AFuF++kGZ+QaW05WrrCJ6TueEISmshVVnguHGd03oS1PVIj2YX1MEcE7
	xoQ1NycfnIneHrUdrCq2rzUrTHN/Vsh934uh3w7Q2e+m6WAzJemX1E6ZvYPezNAFTVHRaNzJJ9K
	IUNMjMsNbjYp4S8PvbkadJyRcY3UhGOgUsGTCl2CU
X-Gm-Gg: AYBFou0WmXahyNch53iwmsEgj7sOuQaSYw9kaFL+A3T5J66n1Vz5vUS4xDAmTkJVVv6
	e+rww5xv2eIJ2mNhD6UfMFMpDjM+yPGi6+EruzCVh2LCpcdAyaejv20TlCzOPU+ERp64Srwkyua
	utv8sT1/ZE/VVZzLweZcdBqOC2x82AJefbp7R3bmH9m+RUr2OQ9jZqkhoaMp/yiWskA9YhmsUUh
	3jVixOnSzpS0n5z3cqxHmnzUa+LruTzAeAAAcuvOtO+C4rIRbxCE9Z6eZKL1xoONBmiLlVHtEzz
	lekyQLhZMUwnTzD0Di0uTZt+6mQFbhMxA8TCtRFzR2dyqniVTe53FVE6rO2LgdjLDmbitITYeVu
	Ew2bHcszqtIHXlKjlHy+0BgAk1CScY27FsQMIHsk8glSa7RBDeRGoaBa6rQ/gbwaccZmG
X-Received: by 2002:a05:622a:4185:b0:532:d0ab:f3cb with SMTP id
 d75a77b69052e-532feb52734mr11578341cf.59.1790238398107; Thu, 24 Sep 2026
 01:26:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924080219.1036588-1-caixinchen1@huawei.com>
In-Reply-To: <20260924080219.1036588-1-caixinchen1@huawei.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 24 Sep 2026 10:26:25 +0200
X-Gm-Features: AclHuK9XSbyZhfSiccnO7XKdYo-g6nGD7WSG7r9j6ZGeEHZyUxcT2PFsdbnfwn4
Message-ID: <CANn89iJVGmYwQerOixGurH6vw-GtvSAQq6u6zSNZoyZrcEx6Jw@mail.gmail.com>
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

On Thu, Sep 24, 2026 at 9:36=E2=80=AFAM Cai Xinchen <caixinchen1@huawei.com=
> wrote:
>
> The memcg socket accounting currently charges pages to the memory
> cgroup per grant (__sk_mem_schedule() publishing forward allocation)
> and refunds them later from skb destructors.  The refund side folds
> per-skb "was this charged" snapshots back into the socket balance
> under concurrent lockless RMW, and races there can drive the memcg
> socket balance negative, ending with:
>
>     page_counter underflow
>     WARNING: ... mm/page_counter.c ... page_counter_cancel()
>
> This series flips the model: a socket is charged its whole memory
> budget (sk_sndbuf + sk_rcvbuf + sk_reserved_mem) to its memcg when the
> budget is established or grows, and refunded when the budget shrinks
> or the socket dies.  Grants and per-skb charge/uncharge stop touching
> the memcg entirely, so the racy refund pairing has no code left to go
> wrong: refunds can never exceed charges and the balance cannot
> underflow by construction.
>
> Tested: full arm64 build with 0 warnings; each intermediate state
> compiles (bisectable); tools/testing/selftests/cgroup builds clean.
> Runtime validation on the workload that used to trigger the underflow
> is pending.
>


Charging sk_sndbuf + sk_rcvbuf upfront to memory.current is not
viable, especially for servers handling large numbers of connections
(e.g. 1 million TCP sockets):

We specifically went in the exact opposite direction in commit
4890b686f408 ("net: keep sk->sk_forward_alloc as small as possible")
to make sure idle sockets hold zero forward-allocated memory and
non-idle sockets hold less than one page (4 KB) in sk_forward_alloc.


1. Massive phantom memory charges and false OOMs:
   With default sysctl_tcp_wmem[1] (16 KB) and sysctl_tcp_rmem[1]
   (128 KB), 1 million completely idle TCP sockets immediately charge
   144 GB to the cgroup's memory.current while holding 0 bytes of
   actual packet buffers.
   Worse, once TCP autotuning grows sk_rcvbuf / sk_sndbuf during a
   short burst (up to tcp_rmem[2] =3D 6 MB and tcp_wmem[2] =3D 4 MB by
   default), TCP does not shrink sk_rcvbuf or sk_sndbuf when the queues
   drain and the connection becomes idle again. 1 million long-lived,
   mostly-idle connections would permanently pin hundreds of GBs (up to
   several TBs) of non-existent memory in memory.current, forcing the
   memcg into constant reclaim thrashing of real page cache/anon pages
   and triggering premature memcg OOM kills.

2. Overcommitted caps vs. physical reservations:
   sk_sndbuf and sk_rcvbuf are per-socket upper bounds that are heavily
   overcommitted across sockets, not reservations (unlike SO_RESERVE_MEM).
   Comparing this to vm_committed_as is flawed: vm_committed_as tracks
   virtual address space overcommit globally and is never charged to
   memcg's memory.current for the exact same reason.

3. Broken memcg limit enforcement (memory.max bypass):
   __sk_mem_raise_allocated() drops mem_cgroup_sk_charge() completely,
   while sk_memcg_budget_sync() ignores charge failures ("the new budget
   is used uncharged"). When a cgroup reaches memory.max,
   sk_memcg_budget_sync() fails in sock_init_data_uid(), tcp_init_sock(),
   setsockopt(SO_SNDBUF/SO_RCVBUF), or autotuning, yet sk_sndbuf and
   sk_rcvbuf are still raised. Subsequent skb allocations in
   __sk_mem_schedule() will then allocate real physical memory without
   charging the memcg at all.

4. Unnecessary struct sock bloat and hot-path overhead:
   - Adds 8 bytes (sk_memcg_budget + sk_memcg_budget_lock) to struct sock
     (even when !CONFIG_MEMCG).
   - Acquires spin_lock_bh(&sk->sk_memcg_budget_lock) inside
     sk_mem_reclaim().
   - Every TCP socket creation charges rmem_default + wmem_default
     (416 KB) in sock_init_data_uid() and immediately uncharges 272 KB
     in tcp_init_sock().

If you are hitting a page_counter underflow race in socket memcg
accounting, please share the exact race / stack trace and fix the
underlying accounting bug rather than charging uncommitted buffer limits.
