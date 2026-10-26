Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016268;
	b=MhJBR/NtjQumb55ZlN/QfE9gdEA+YZaviDGBmCfA4jBpEa3SU534bU6uT6pe+6HJmtxL
	 X3qPmoifXvNq/pykSvQLL2E/f3Fh+r88bUTFdQ2rgro5gIQMRpS/tRM+5MydPsZAUNLFC
	 CZ2fD1h2y1yPdDxFL4OzPzbkJEKPAxyCbLjuKJIEX4uPUezelRZ1b5tYgfp3d9ORAGQqq
	 Zl62bHC4FT5aVKGcmXhDEd0t5cg+gSrJuP3Y8f1FP4IvYXhstMoCMB70pPciyM9SpaAUY
	 DbPeBvOvbJC4v06PsXySHJANre3IG3Gjlz8M5xt1C/pVPgGu7X7ejeGBS5qsmH9j80A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6hhfEnTNSqKM/tyqjy+CS3N1xRody6+azCrBm85/WAM=;
	b=Ugp9sOtysoKpgitOP6H263azekZxyStDeuLGkz/j+Fb7Xa58So6aTGdPkJN+7gQ4Tcby
	 u2duNVLxXJ+xzPDqxOBd0EWyreU7jvrPAT6Lftpgz2t5zabN+moDy71+jiZL7DzTsC3hb
	 q9Xou+wvT+J1man7aTyCvXeBrGbIElehMQONWH7bpA4wPLPK7lDHIx8MMjcqvQmz9j/A9
	 jcfsTrggN1PFd57aVMHL0xZPf0HKiiO614S7uKtsXfbRHvN6M2WR11GIEO7+NVJ+bWa5O
	 s0QsSah0a9BBysM/sudpVKKzlM+Jdmmu8QmakVC3+pg8t6VNK1f6bbrcyQafOCak2zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="AG0R/kg0";
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9688B60A2626
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9688B60A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AG0R/kg0
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so785478a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793016267; x=1793621067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6hhfEnTNSqKM/tyqjy+CS3N1xRody6+azCrBm85/WAM=;
        b=AG0R/kg05eRDg9WE5jHbRGxj+K+GmIpRO9fjrcNXse5wt1WKnHI6lJnkP2vLYXWvdB
         kXSxkZr1oQxs7XsIOp0lSoR9LooIn6YguQHIwelxgRgj+1biXwMOjWi45+ssJ6AAcvxA
         04QBOjO44wFYCKCIKZIF92SvQCy09nKXgFZbfXMeCEB5ZNdvsGtyJz3+FCWD6uGMkkPb
         zjP7TlNUipVwBh2O9UhUtbskzsyUyiB9Tx1FvHkfZjx9d2b2AHDKEjoy3N8c2n6LnsGF
         U8SblTprJhxKLNNelzLhmA06qT7T9ZWxgtlc9ZU0zSFezDSkRKPfGRM+A9sNczkY1oKs
         bbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016267; x=1793621067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6hhfEnTNSqKM/tyqjy+CS3N1xRody6+azCrBm85/WAM=;
        b=zwjy6wKtZJWb4Slz79pqlKjk53uN3MKjl7F/fVmdtn9HwoSKVWdBYMkZxbvR6AdRLC
         3pX3JQrCwa71F7lsngEqHBPcIm0CR4/S23Lvs1Jdf/6NCEsFhfw2P04DAoI5SXNdel1m
         A9xLW5XKVHVb+up2n0mGA34yFoeCwBddDVZ4HZ4cvzXHymdp33o12VPY32cQ8ROOQDMS
         68w27FXLm09HeTo76iM5ZKjC13cKhgDcFb8v67bVdQblPYf1REA1E3npnbMbTB1358Pl
         g/WQDvMN/b2Iz0Z7YfzTaUFSejQkk189VCcMwvbHvY7n3QCTcWEOF6qCgvl1xlrWqhtq
         E/5Q==
X-Forwarded-Encrypted: i=1; AKwUvBz2IYhJIT5UvXvMU+CxA2Q6Fb7gaBEsLYpMY4vQ5btOtxH/4NHuIfqLKZ84P+5jt14gNA6XCVyyg02cQNw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMeQUjFg3tu2WStHME+aDXGeIeJi3ZpxnQMlloeZKwzEuzte4q
	q1qF+ixz7j/5vQz+uXLnIh+4UnOHr7/CxQCnsKU+8SD3cX3t0+pGTcD/JRDQ3hGmezfl7A==
X-Gm-Gg: AYBFou2ii9WNJlXNZp5OoymeBV8wrimaZIP2BTLhHeXbYuyh0sa/dmnqvl8cH8uA0E5
	RE7C3nQ5yeB/pcqE/A/aoEx2ykiBhx8IeuSb1mXQfa8mC6yXKXOeGGrBfvxtLEzXbPBQnmE5YN8
	bVPcu1ZfON4LbAH8IAZk+cBjpY2n/kj/A1X9e3jdWahTdFl/l72/Te0LHD3wjrSwYKxs7nSBjrK
	xqD7qi5ujWB7omZzeEJ9P2T9xlZhA0fF0VWnDZ43kZCipF4ThAdulISYQrEthN3Ytm7b+suo2xz
	G1OK8KMIJtyjRHmHbVPCktcf8EDNlAi26CZQpSQVG/WJciTMshUxEM3U/UT4g44/BJ/MQUJ5vLx
	TaH7EEc/Kf1b4JSRptzq8+8UPMpwTPObm/gp467ZD/wpVcXW2CaDy9YtD/Hzyzdq2YM7yE6mEVM
	P4keVNFFlnho2+MXPeC6I8P9X99bjAPbayx/1spDCGBwUznwow+xJnCCY8RKdcoU1mBEF5PzJkl
	0kjyOJt4AF+QXo1NPrGmjv4LAXM9QKlOM/RawiAoRaatOodOnU=
X-Received: by 2002:a17:90b:4a44:b0:3ad:818f:3da2 with SMTP id 98e67ed59e1d1-3adeb195cfbmr4778178a91.63.1793016266667;
        Mon, 26 Oct 2026 05:04:26 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb0639bsm8298309a91.12.2026.10.26.05.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:04:26 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: matttbe@kernel.org,
	martineau@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: geliang@kernel.org,
	horms@kernel.org,
	netdev@vger.kernel.org,
	mptcp@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH net 2/2] mptcp: release the parent socket reference with the subflow context
Date: Mon, 26 Oct 2026 20:04:09 +0800
Message-Id: <pm-mptcp-objects-candidate-0010-v3-14c229ea28a7d31f60a0-2@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-mptcp-objects-candidate-0010-v3-14c229ea28a7d31f60a0-0@gmail.com>
References: <pm-mptcp-objects-candidate-0010-v3-14c229ea28a7d31f60a0-0@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The subflow context owns a reference on its MPTCP parent socket through
ctx->conn, and subflow_ulp_release() drops it when the TCP protocol
state of the subflow is destroyed. Two users of the TCP subflow socket
can outlive that point and still follow the pointer.

bpf_skc_to_mptcp_sock() returns ctx->conn for any TCP socket that has
is_mptcp set. An SK_SKB program can look up a connected subflow with
bpf_sk_lookup_tcp() and hold the TCP child without holding the MPTCP
socket. A concurrent zero-linger close destroys the TCP protocol state
and releases the ULP despite that reference, and once the remaining
MPTCP references drain the program reads the freed MPTCP socket:

  SK_SKB reader                    MPTCP close
  rcu_read_lock()
  bpf_sk_lookup_tcp() -> ssk
  bpf_skc_to_mptcp_sock(ssk) -> msk
                                   mptcp_close()
                                     __mptcp_destroy_sock()
                                       __mptcp_close_ssk()
                                         __tcp_close()
                                           subflow_ulp_release()
                                             sock_put(ctx->conn)
                                     final sock_put(msk)
  read msk->token

A delegated action pins the TCP subflow socket, but
mptcp_subflow_process_delegated() locks and updates ctx->conn. A peer
reset followed by the application closing the MPTCP socket releases
the parent before mptcp_napi_poll() takes its data lock:

  Delegation / NAPI                 Peer reset / application close
  queue SEND or SNDBUF
    sock_hold(ssk)
                                    subflow_ulp_release(ssk)
                                      sock_put(parent)
                                    mptcp_close(parent)
                                      last sock_put(parent)
  mptcp_napi_poll()
    mptcp_subflow_process_delegated()
      mptcp_data_lock(parent)

Now that a retired context stays attached to its socket until
sk_destruct, release the parent reference from the context destructor
instead of from the ULP release. Every reference on the subflow socket
then also keeps the parent alive, and delegated actions need no
reference of their own. The final parent sock_put() may now run from
the subflow destructor in softirq or RCU callback context; the parent
is already closed and its protocol destroy callback has run by then, so
only the generic socket release is left. This depends on the previous
commit, which keeps the context alive until the subflow socket is
destroyed.

The hold around tcp_done() in mptcp_subflow_reset() stays, with its
comment updated: that call can destroy the subflow socket and thereby
release the parent reference.

Both reports below were taken with KASAN poisoning forced for the
SLAB_TYPESAFE_BY_RCU MPTCP socket cache. The first one is the BPF
reader, the second one the delegated action.

BUG: KASAN: slab-use-after-free in ___bpf_prog_run+0x2507/0xbcf0
Read of size 4 at addr ffff888119920930 by task mptcp_skb_looku/492

Call Trace:
 <IRQ>
 ___bpf_prog_run+0x2507/0xbcf0
 __bpf_prog_run32+0xda/0x120
 bpf_prog_run_pin_on_cpu+0x136/0x3d0
 sk_psock_verdict_recv+0x319/0x12c0
 tcp_read_skb+0x349/0x500
 sk_psock_verdict_data_ready+0x164/0x6f0
 tcp_data_ready+0xfe/0x3c0
 tcp_data_queue+0x181b/0x48e0
 tcp_rcv_established+0x9c5/0x3480
 tcp_v4_do_rcv+0x5bf/0xc60
 tcp_v4_rcv+0x29cb/0x3da0
 ip_protocol_deliver_rcu+0xad/0x430
 ip_local_deliver_finish+0x383/0x610
 ip_local_deliver+0x16a/0x1c0
 ip_rcv+0x2d1/0x380
 __netif_receive_skb_one_core+0x19c/0x1f0
 __netif_receive_skb+0x22/0x150
 process_backlog+0x43c/0x1260
 __napi_poll.constprop.0+0xab/0x670
 net_rx_action+0x4df/0xe60
 handle_softirqs+0x201/0x930
 do_softirq+0x47/0xa0
 </IRQ>

Allocated by task 492:
 kmem_cache_alloc_noprof+0x20b/0x5f0
 sk_prot_alloc+0x65/0x260
 sk_alloc+0x37/0xb40
 inet_create+0x33a/0xf40
 __sock_create+0x2c4/0x730
 __sys_socket+0x141/0x210
 __x64_sys_socket+0x77/0xc0
 do_syscall_64+0x115/0x6a0
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 496:
 kmem_cache_free+0x293/0x670
 __sk_destruct+0x4dd/0x8f0
 sk_destruct+0xb3/0xd0
 __sk_free+0xdd/0x370
 sk_free+0x51/0x80
 mptcp_close+0x7d/0x100
 inet_release+0x11f/0x250
 __sock_release+0xb8/0x270
 sock_close+0x21/0x30
 __fput+0x39f/0xa60
 fput_close_sync+0xff/0x200
 __x64_sys_close+0x8c/0xf0
 do_syscall_64+0x115/0x6a0
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: KASAN: slab-use-after-free in _raw_spin_lock_bh+0x38/0x50
Read of size 1 at addr ffff88810acf25d8 by task ksoftirqd/2/29

Call Trace:
 <TASK>
 lock_acquire+0x113/0x2f0
 _raw_spin_lock_bh+0x38/0x50
 mptcp_subflow_process_delegated+0xa6/0x9a0
 mptcp_napi_poll+0x50d/0x12f0
 __napi_poll.constprop.0+0xab/0x670
 net_rx_action+0x4df/0xe60
 handle_softirqs+0x201/0x930
 run_ksoftirqd+0x33/0x60
 smpboot_thread_fn+0x3bd/0x9a0
 kthread+0x34f/0x460
 ret_from_fork+0x659/0x940
 ret_from_fork_asm+0x1a/0x30
 </TASK>

Allocated by task 586:
 kmem_cache_alloc_noprof+0x20b/0x5f0
 sk_prot_alloc+0x65/0x260
 sk_alloc+0x37/0xb40
 inet_create+0x33a/0xf40
 __sock_create+0x2c4/0x730
 __sys_socket+0x141/0x210
 __x64_sys_socket+0x77/0xc0
 do_syscall_64+0x115/0x6a0
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 586:
 kmem_cache_free+0x259/0x5a0
 __sk_destruct+0x4a0/0x790
 sk_destruct+0xb3/0xd0
 __sk_free+0xdd/0x370
 sk_free+0x51/0x80
 mptcp_close+0x150/0x530
 inet_release+0x11f/0x250
 __sock_release+0xb8/0x270
 sock_close+0x21/0x30
 __fput+0x39f/0xa60
 fput_close_sync+0xff/0x200
 __x64_sys_close+0x8c/0xf0
 do_syscall_64+0x115/0x6a0
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Fixes: 3bc253c2e652 ("bpf: Add bpf_skc_to_mptcp_sock_proto")
Fixes: b19bc2945b40 ("mptcp: implement delegated actions")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
Assisted-by: LLM
---
 net/mptcp/subflow.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/mptcp/subflow.c b/net/mptcp/subflow.c
index 8dc0677dc551..ebcface15661 100644
--- a/net/mptcp/subflow.c
+++ b/net/mptcp/subflow.c
@@ -471,7 +471,9 @@ void mptcp_subflow_reset(struct sock *ssk)
 	if (ssk->sk_state == TCP_CLOSE)
 		return;
 
-	/* must hold: tcp_done() could drop last reference on parent */
+	/* must hold: the parent reference owned by the subflow context is
+	 * released together with ssk, which tcp_done() can destroy
+	 */
 	sock_hold(sk);
 
 	subflow->resetting = 1;
@@ -820,6 +822,8 @@ static void subflow_ctx_destruct(struct sock *ssk)
 
 	rcu_assign_pointer(inet_csk(ssk)->icsk_ulp_data, NULL);
 	ctx->tcp_sock_destruct(ssk);
+	if (ctx->conn)
+		sock_put(ctx->conn);
 	kfree_rcu(ctx, rcu);
 }
 
@@ -2120,7 +2124,6 @@ static void subflow_ulp_release(struct sock *ssk)
 		if (!release && !test_and_set_bit(MPTCP_WORK_CLOSE_SUBFLOW,
 						  &mptcp_sk(sk)->flags))
 			mptcp_schedule_work(sk);
-		sock_put(sk);
 	}
 
 	mptcp_subflow_ops_undo_override(ssk);
