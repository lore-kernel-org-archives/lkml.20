Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796658;
	b=cP2sUPukeIZjMhcxs1wtiq9LlZrEzdEo92jUSeVu15ZC7mT7ba7OhmyJlvNXaydzE5/8
	 7usnojUps4GdKLAN+lxe+T4goYh5n0zecE14ljIwgN/t/UVXuaw/XVTWaIhDop3xLoFGl
	 ckp7OHLtXpvcdQiIaCvudZ6iLWF+msvvxuccvsd0LXQVjquHV8F4VNap61BTI6hqnWlaU
	 rCxaFZwGCp/7/xB1e6Zaf0bZjwatxqtyaV0CEiqoif5U2gJH/3wiDoCUDJKtxRrhzUwcz
	 09qaOSkyuxpfmBKvJBB4mh9lx4eaPNQBx7/Q0F5QiRm2VxuEIYXa/wLK5m9KvwJYB+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=1DE1zx2VFa9qUd9Uu0O8FBnLLNz1IzGMo61cjsDi4Ak=;
	b=vvpPexSKobO8ZIYPwvJIJDjmUwEPY5KLW1m05Wd47Bk8KBhnHg9xIXqkGVfWQuxhDHaR
	 LW5acQqVVSnCkMuU6YM2ptTeBn+VSFViRGgVim3jane9YXIXOj0rhRSrWFJqnTQphIs7H
	 fVMQGKkxPGZq4NRIMe2+W3U8hZIg0H73+LvUox/H6GLr0k/dcAbWVLjDr1rSBBxVRmzZO
	 oupFi2G1MJU1yGhBgtMEpRpGdwemQDkHYUD/93Z4IubdOkhdtrUMmnAu9KI5dKionqEI0
	 klGEDjyyb35tfS47/O49Fesgr/7b8e4+C5HEE/wXmLtUf0L++ribnjaRdflKxM+uh8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CopQe4R8;
	arc=none smtp.remote-ip=209.85.217.72
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BAE606A335
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6BAE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CopQe4R8
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2d5cc693fso352218137.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794796657; x=1795401457; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1DE1zx2VFa9qUd9Uu0O8FBnLLNz1IzGMo61cjsDi4Ak=;
        b=CopQe4R8yNIYcFAOCuocpcLGRTybJxLmbZljpji/v8rU3tpkbXhVXZgfclaKE7mPb+
         zvOJSiBTZX3G6/m82v914mXwDTC91a7QxArzfGhQjp6WlDdjyS2HGCS5RGZmK9VjcwuO
         s8JMX73Y/M/cuWrR7MKSvUfCBYgMNYCj4OxayHKRusdl80+L6utnXrpQCfgNVBZAvOcC
         mWOh1EW2qV8kpZSwunqhQVr4CHg/c/R52rd1GoDRJ0te0+8xwxCZJIyfijXsHaUfrGNz
         /GaX8JzHF/lbQBRTA0azp152J/WpJvu8/qEJq/cFXtNp7jwL2ooPNE+iaW4l2tiICYrN
         FK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796657; x=1795401457;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DE1zx2VFa9qUd9Uu0O8FBnLLNz1IzGMo61cjsDi4Ak=;
        b=Mrrp2TBbJxSzQR40npMAxdMCECLgh+1hDbp7+qCuhxMAYpg0Siyc/vOr+wO7blBAwa
         kCYx8B5BRMj3JA03eT3wyPIigMcZQStMCeyTXgbzEmjfVCxnMQWINlduz4NcW8HdZayF
         2tQ2+EFqeDufTF+S7o3pVyzhE1NXkUThWvVKLVULJTZIXKUMwHql+emE1v82FkJkeF1D
         sPzmLySLFjgAouFJBRF3Ya8DU0TkpakefWpdxLap1zYMD+iKQ4pR4Ub/Cb2aIcvgn9P0
         7H9Dkh4/NbAh11XGEzzEx/KiiZdC/7VsWBlm1328w9EkKAmyuDvsmQvOt0n+3eReJccG
         Ff4w==
X-Forwarded-Encrypted: i=1; AL+hErGVhuDBaTTCiClVdKXq3RTtzC9nmv2JAtJcRMvj9WbsEJfuN3KHNrjwQ+UvtaL6k6l8FqInWmqjy9A/f6s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gCC+1tjrTBaCUmtubJDJ5EdxUIMTlSYgeRiq/qmN3BmK6he8q
	VJTF96Sg3di0mcmmfI3HMVY5jpfOlyM1qNuMaWEr9pAOrUktduD2Ok8v65FxksCj4zg9AyQ/mXT
	SyoYPRVPltmfEbGiRb3N6q9xJ3A==
X-Received: from vscc8-n1.prod.google.com ([2002:a05:6102:6308:10b0:7d6:46f2:b6a0])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:a4b:b0:7cc:1192:563c with SMTP id ada2fe7eead31-7d64d770298mr2307128137.25.1794796656540;
 Sun, 15 Nov 2026 18:37:36 -0800 (PST)
Date: Mon, 16 Nov 2026 02:37:09 +0000
In-Reply-To: <20261116023709.132684-1-thaisonphan@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116023709.132684-1-thaisonphan@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116023709.132684-3-thaisonphan@google.com>
Subject: [PATCH net v2 2/2] tcp: accecn: initialize AccECN fields in syncookie path
From: Thaison Phan <thaisonphan@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, "=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ij@kernel.org>, 
	Olivier Tilmans <olivier.tilmans@nokia.com>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, Stan Iliev <stani@google.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thaison Phan <thaisonphan@google.com>
Content-Type: text/plain; charset="UTF-8"

cookie_tcp_reqsk_alloc() and bpf_sk_assign_tcp_reqsk() allocate struct
request_sock without __GFP_ZERO, leaving saw_accecn_opt,
accecn_fail_mode, syn_ect_rcv, and syn_ect_snt uninitialized. When
accecn_ok is negotiated in cookie_{v4,v6}_check(),
tcp_ecn_openreq_child() reads all four fields to initialize the child
socket's AccECN state.

In addition, because the temporary request_sock used to send a cookie
SYN-ACK is immediately freed, treq->syn_ect_snt is lost. If the listener
marks ECT (e.g. DCTCP), failing to record syn_ect_snt causes
tcp_accecn_third_ack() to flag TCP_ACCECN_ACE_FAIL_RECV when the peer
reflects ECT, disabling ECT for the rest of the connection.

Initialize saw_accecn_opt, accecn_fail_mode, and syn_ect_rcv in
cookie_tcp_reqsk_init() to match tcp_openreq_init(), and set syn_ect_snt
from the listener's TOS/tclass in cookie_{v4,v6}_check() to match
tcp_{v4,v6}_send_synack().

Found by AI-assisted code inspection comparing tcp_openreq_init() and
cookie_tcp_reqsk_init() while investigating the cookie_v6_check()
LOOPBACK4_IPV6 bug. Reproduced in a QEMU VM with tcp_syncookies=2,
tcp_ecn=3, SLUB_RCU_DEBUG=y, and slub_debug=P, observing bogus
tcpi_accecn_fail_mode and tcpi_accecn_opt_seen values in TCP_INFO on the
accepted child socket (and tcpi_accecn_fail_mode=0x2 on ECT(0)
listeners), and tested with packetdrill AccECN and syncookie selftests.

Fixes: 3cae34274c79 ("tcp: accecn: AccECN negotiation")
Fixes: b40671b5ee58 ("tcp: accecn: AccECN option failure handling")
Signed-off-by: Thaison Phan <thaisonphan@google.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
---
v2:
  - drop redundant treq->syn_ect_snt = 0 in cookie_tcp_reqsk_init()
    (Eric Dumazet)
  - clarify how the bug was discovered and observed via TCP_INFO
    (Eric Dumazet)
  - add Reviewed-by tag from Eric Dumazet
v1: https://lore.kernel.org/netdev/20261114161248.3428695-3-thaisonphan@google.com/

 net/ipv4/syncookies.c | 4 ++++
 net/ipv6/syncookies.c | 1 +
 2 files changed, 5 insertions(+)

diff --git a/net/ipv4/syncookies.c b/net/ipv4/syncookies.c
index 4e0ff3b82062..1a837ed6efa0 100644
--- a/net/ipv4/syncookies.c
+++ b/net/ipv4/syncookies.c
@@ -290,6 +290,9 @@ static int cookie_tcp_reqsk_init(struct sock *sk, struct sk_buff *skb,
 	 */
 	treq->txhash = treq->snt_isn;
 	treq->syn_tos = TCP_SKB_CB(skb)->ip_dsfield;
+	treq->saw_accecn_opt = TCP_ACCECN_OPT_NOT_SEEN;
+	treq->accecn_fail_mode = 0;
+	treq->syn_ect_rcv = 0;
 
 #if IS_ENABLED(CONFIG_MPTCP)
 	treq->is_mptcp = sk_is_mptcp(sk);
@@ -502,6 +505,7 @@ struct sock *cookie_v4_check(struct sock *sk, struct sk_buff *skb)
 		ireq->rcv_wscale = rcv_wscale;
 	ireq->ecn_ok &= cookie_ecn_ok(net, &rt->dst);
 	treq->accecn_ok = ireq->ecn_ok && cookie_accecn_ok(th);
+	treq->syn_ect_snt = READ_ONCE(inet_sk(sk)->tos) & INET_ECN_MASK;
 
 	ret = tcp_get_cookie_sock(sk, skb, req, &rt->dst);
 	/* ip_queue_xmit() depends on our flow being setup
diff --git a/net/ipv6/syncookies.c b/net/ipv6/syncookies.c
index b33011b71fff..7435ebcc366c 100644
--- a/net/ipv6/syncookies.c
+++ b/net/ipv6/syncookies.c
@@ -276,6 +276,7 @@ struct sock *cookie_v6_check(struct sock *sk, struct sk_buff *skb)
 		ireq->rcv_wscale = rcv_wscale;
 	ireq->ecn_ok &= cookie_ecn_ok(net, dst);
 	tcp_rsk(req)->accecn_ok = ireq->ecn_ok && cookie_accecn_ok(th);
+	tcp_rsk(req)->syn_ect_snt = READ_ONCE(np->tclass) & INET_ECN_MASK;
 
 	ret = tcp_get_cookie_sock(sk, skb, req, dst);
 	if (!ret) {
-- 
2.56.0.611.g1030f0b940-goog

