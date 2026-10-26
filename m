Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016291;
	b=TAqt3NRSE9U29dvqiHNdw90JUKzVtozXr4GDXqYir+3vD0idg3Q/iM0bzqLcT/HkKANM
	 BtEY/q2eBIhzkj6dliw5w4wlth8j2CqEjl85tC9kGd4aVDck4IIooyKatdB0Vq/C2XR80
	 BjmtWY9/4W+LIh9Zp4ibqDTXUP75FqiO4TuH7Ql7D5n92Mytqt723eAuAegRxxuEngA90
	 xWNgrEWi1elSLmbp/24cr2Fc7QHb2nun5aliPp/xp/sOzIsi7+l/4R+g+jHbnYMMaa5ym
	 KB1pctkDf3Tye0Tcz/H829+hgNBG+vetMVFFudUxZXifNQHYTL4y2RqW51IJceB2N0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nbUjjjXf6KuwRIcdvlGUS77lfDsF4Q5SkMSxK7RcU9Q=;
	b=DHqGsUGm2tUTCdl9UG5n0+iLbAbgbADvmPgttO1OGlen2Rzdz5dTfERtQirUL4sImMxI
	 b7/qD2HOQBDGbOgTw4veX8uTcF6YkYmF9pS0Dv6IDyMl7w7fhY85NlSnrKdPr1irVYH08
	 HLaRhaqkh+/c2iFdHFI1oHyzrn5iLkHBaC8lELoLTl4Bo+CoL76VN3jzQoy44HnAX70ah
	 taawUPeXrPMRQ2uWMBAfcAwpa92o6N8HQnU83Fvx5bjdI+HAKWDeu3YzM5BItozZIBcO2
	 GHRHpDGl1zm/1xsE1dlQX834aTx5Oz/Lpv7cyBrg40i7nt41/CQyXKIIDFxl5cSmK6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iAphjCSL;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F761606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F761606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iAphjCSL
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso1566857a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793016291; x=1793621091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nbUjjjXf6KuwRIcdvlGUS77lfDsF4Q5SkMSxK7RcU9Q=;
        b=iAphjCSL/pk4/K4FeZR6vXvhfYz86c16XRDQxiJVTPMSJFyzYtQP5SizqACQYL+bAX
         xQDaGeVP836lPRDTJC0jEUwaraaTWhqjJmEx4EljE5rPorK4O4g9+7M9oWSEXcYCHrxb
         8ewydmBOuMiBWSQrzL2cwuk8Q3mMU/+7hB/HpGneOWkmDNfe8L8Llt9L6lMF/RYrw6/L
         7/agQThAin0wIEE8INLRkdPR80sV79DmYUhLML2nzj7TVXZaEgljmLQ9K0qVl8vnosC0
         mml4M4rp92ut0ju3mYSw0VqjuO4wWPf5S6v/T/ouWIxcAIHbtiPPQ/Nc8zlIM9mGwEm2
         qyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016291; x=1793621091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nbUjjjXf6KuwRIcdvlGUS77lfDsF4Q5SkMSxK7RcU9Q=;
        b=dRCR3PoXtSXQly2cWPQfRjSKqIlYS64T5VQjaA4s/xvz0cTNNs/Jdh/2c8386PiewS
         FMgbuYQobDWfnH7zg1USeJ0GHG+mpXJobpeCkNxsLk/SYJT4D5oGQgOzWAjKb6dJY8E0
         Tv6tuZVS8e6SDTJM4bBrq170KO/BmmyMibnxdJascvaRskOj8JSRH4VpCXHH8hzkyRHA
         z6aefBLYy98Q5k0/yzVE0BqMJwOrsuSlnbyCPZp4ZjxRe1IIFTt5QeG12fY+y6kVzSn+
         WoTpUEhn8Ht/s31eBJJqWQgzZP3etXcRcKl7laISKeZC+xGajcPvXQbdt8qkcNoQHyaS
         9TFw==
X-Forwarded-Encrypted: i=1; AKwUvByuR3RUUAHhBRo0RIvaw3IrqkSppQfrhjwc96Jesihonj8KcIqJ/QQ0EkpQ70fhNFRwskI1Xt/0fHwLwOg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8QcgKIDPMsx12MmyyporfCGFohr0aNXea4B4A9e4ax8ebHtVw
	w3tpPpiobicKu1SnkyxLIUdMfFb9IV3L3yn3MB0q0Jvdkrcp9MFeLgYG
X-Gm-Gg: AYBFou14e2koOSBpkbhZVPnpWJk+bj8Yy5L0fEp15l+K/VVr6bxKIFHrVq+l5/MBMZw
	2ctXwHBoK2XuDu4TNmrT1HCZB7K20Nb8hK8FnY+IsJapHmM5McO10o4yftWDK3JtaPWVAF37K4R
	tjFiJf8vq98hv2oiU2MLarDJUkFq9zLRE+edL2+SrSzockDgphEvjjYH/Pt+XFxD2b6AHr2FxDh
	tQIKu2miGcHrBuupir7FG68+5imjK3SEOs0rFyW46hYzb14S25O9DhAHocARG4xxoZY9vneFmVd
	q0TJgafpiVkbUH/+ygvGBmtAkpmgflpiOyOkcU1EH/dErEsqSOXOpcV3fsuwSLaF2hH/u2OU3b7
	yurI8l2g+R2ZXfbELesUnWX4KlDBv0MBbf5tHYUKCEg75ZQ/0+t5ySQr9zfSWrMAomf3nbyiH7V
	t684jiKi+NOa4rw+CDUxHWD368AbwJQOYsWqFnaq3nOSfFUXkZ3lJDzFRV6hL3c/4C6y4F7kRYX
	2Zyooz98Ew4kVPb/EQvKINcgjjEBIliNJJ4r7ADpOvbjltQUR8=
X-Received: by 2002:a17:90b:4b82:b0:3ac:8af9:4a73 with SMTP id 98e67ed59e1d1-3adead249d4mr5244688a91.28.1793016290637;
        Mon, 26 Oct 2026 05:04:50 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb27a1bsm8251579a91.15.2026.10.26.05.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:04:50 -0700 (PDT)
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
Subject: [PATCH net] mptcp: protect listener backlog reads in diagnostics
Date: Mon, 26 Oct 2026 20:04:42 +0800
Message-Id: <pm-mptcp-objects-candidate-0066-v3-73df72b7a543d4cada0e@gmail.com>
X-Mailer: git-send-email 2.34.1
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

mptcp_diag_get_info() reports the accept queue of a listening MPTCP
socket by reading msk->first. The token based dump and the exact token
query only hold a reference on the MPTCP socket, which pins neither the
first subflow nor the listener hash bucket, and __mptcp_close_ssk()
drops the last reference on the first subflow before clearing
msk->first.

An application can disconnect a connected MPTCP socket with AF_UNSPEC,
which removes the token but retains the first subflow, listen on it
again and close it. A dump that obtained the MPTCP socket before the
disconnect then reads the backlog of a freed TCP listener:

  Token diagnostic                 Application
  mptcp_token_iter_next()
    retain MPTCP socket
                                   connect(AF_UNSPEC)
                                     remove token, retain first
                                   listen()
                                     reuse first
  mptcp_diag_get_info()
    observe TCP_LISTEN
    lsk = msk->first
                                   close()
                                     mptcp_destroy()
                                       __mptcp_close_ssk()
                                         release first
    read lsk->sk_ack_backlog

Take the MPTCP data lock around the listener state check and the
backlog reads, and only follow msk->first while no process owns the
socket. Every path that disposes of the first subflow runs with the
socket owned, and lock_sock() has to take the same spinlock to become
the owner, so the reads cannot overlap with the release. Waiting for
the owner is not an option: mptcp_diag_dump_listeners() calls this
function with the listener hash bucket lock held, which the owner needs
to unhash that very listener. While a process owns the socket, the dump
reports the MPTCP socket's own queue values instead.

BUG: KASAN: slab-use-after-free in mptcp_diag_get_info+0x415/0x490
Read of size 4 at addr ffff888111763818 by task python3/499

Call Trace:
 <TASK>
 mptcp_diag_get_info+0x415/0x490
 inet_sk_diag_fill+0xee3/0x1ec0
 mptcp_diag_dump+0x2eb/0x1140
 __inet_diag_dump+0x18c/0x2d0
 netlink_dump+0x4c6/0x11f0
 __netlink_dump_start+0x69a/0x920
 inet_diag_handler_cmd+0x254/0x2b0
 sock_diag_rcv_msg+0x3c9/0x730
 netlink_rcv_skb+0x133/0x390
 netlink_unicast+0x504/0x840
 netlink_sendmsg+0x7f7/0xcf0
 __sys_sendto+0x425/0x470
 __x64_sys_sendto+0xe5/0x1c0
 do_syscall_64+0x115/0x6a0
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
 </TASK>

Allocated by task 497:
 kmem_cache_alloc_noprof+0x20b/0x5f0
 sk_prot_alloc+0x65/0x260
 sk_alloc+0x37/0xb40
 inet_create+0x33a/0xf40
 __sock_create+0x2c4/0x730
 mptcp_subflow_create_socket+0xf1/0x9a0
 __mptcp_nmpc_sk.part.0+0x114/0x750
 __mptcp_nmpc_sk+0x5c/0x80
 mptcp_setsockopt+0x5d8/0x2d60
 do_sock_setsockopt+0x1fb/0x430
 __sys_setsockopt+0x106/0x180
 __x64_sys_setsockopt+0xc2/0x160
 do_syscall_64+0x115/0x6a0
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 0:
 slab_free_after_rcu_debug+0x111/0x290
 rcu_core+0x661/0x1d10
 handle_softirqs+0x201/0x930
 __irq_exit_rcu+0x110/0x1e0
 irq_exit_rcu+0xe/0x20
 sysvec_apic_timer_interrupt+0x6c/0x80
 asm_sysvec_apic_timer_interrupt+0x1a/0x20

Second to last potentially related work creation:
 __call_rcu_common.constprop.0+0x76/0xbd0
 sk_destruct+0x8e/0xd0
 __sk_free+0xdd/0x370
 sk_free+0x51/0x80
 __mptcp_close_ssk+0x903/0x1580
 mptcp_destroy_common+0x16b/0x3c0
 mptcp_destroy+0x4b/0xc0
 __mptcp_destroy_sock+0x10e/0x2f0
 __mptcp_close+0x5df/0xa50
 mptcp_close+0x34/0x100
 inet_release+0x11f/0x250
 __sock_release+0xb8/0x270
 sock_close+0x21/0x30
 __fput+0x39f/0xa60
 fput_close_sync+0xff/0x200
 __x64_sys_close+0x8c/0xf0
 do_syscall_64+0x115/0x6a0
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Fixes: 4fa39b701ce9 ("mptcp: listen diag dump support")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
Assisted-by: LLM
---
 net/mptcp/mptcp_diag.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/mptcp/mptcp_diag.c b/net/mptcp/mptcp_diag.c
index 136c2d05c0ee..a71bcaee15c8 100644
--- a/net/mptcp/mptcp_diag.c
+++ b/net/mptcp/mptcp_diag.c
@@ -199,7 +199,12 @@ static void mptcp_diag_get_info(struct sock *sk, struct inet_diag_msg *r,
 			  READ_ONCE(mptcp_sk(sk)->backlog_len);
 	r->idiag_wqueue = sk_wmem_alloc_get(sk);
 
-	if (inet_sk_state_load(sk) == TCP_LISTEN) {
+	/* The listener walk holds the listen hash lock: do not wait for a
+	 * socket owner that could be unhashing the first subflow.
+	 */
+	mptcp_data_lock(sk);
+	if (!sock_owned_by_user(sk) &&
+	    inet_sk_state_load(sk) == TCP_LISTEN) {
 		struct sock *lsk = READ_ONCE(msk->first);
 
 		if (lsk) {
@@ -210,6 +215,7 @@ static void mptcp_diag_get_info(struct sock *sk, struct inet_diag_msg *r,
 			r->idiag_wqueue = READ_ONCE(lsk->sk_max_ack_backlog);
 		}
 	}
+	mptcp_data_unlock(sk);
 
 	if (!info)
 		return;
