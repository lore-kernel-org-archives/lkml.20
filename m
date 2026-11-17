Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919647;
	b=UA18c/YgHO9eMKzu6JR6LtNNuSGzu2s5aVCHWz9WldjSa2FlRIN/r0oCIBxsyVKIXuEW
	 Zbmj+udOXgwQ8DWn6YmLbdph1OmpL16qCxO4VA3S5jt1cqodqhnDenGv6fuG8v18FIMCh
	 ObjwPR+LT71+3TLzqvcR+opX1JY+zUIcCUPy1ZBUKcJuEeTYlS0ZCVqv9pHseJItXO519
	 70W0JAG1DI4DC0UOUi/3yES+O4qqHEqNe/G3YJOU0GUJ/V3+uKQ6zCtWtlk0MQm4X6mCm
	 z2FKM1PRCzxPzitxlxcMWZb7jDEaJK/yf72DK7KMiUer9K6nNyy049T4hQ/XPW/r3fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=cn6UENZGdLiJytyF84lr/H5zLWzIbtUmLBUEsnq8LiA=;
	b=OIk5H3Q/0d+emXOXfWr3B3oZZlCxq0yTRePYHo+QNtlXlPCXv8A6YOPGUrf7qgF1xXkP
	 pvYAJa0hM1at0HoMYC/Ga7p3a2bVCUxb8IfyldTwnOyHmT1dTM+k+CU0b9O4gTuBRv37K
	 SLhZPjhcG+XTuPx7Qn5Ru+cF6P0Rsjqii+ygo4WtummuwVouknz5hefTkbTXkQP86V5dX
	 9fEkbelnFFSbQnXCvX18eA55n/BvV4x5jxg4t1g2Np0qj0lrupi/hyK2YxTTuWmOC9o0E
	 HhEuilqV6w0vnJqtdCnqD7k0p/N9KZuDK4DK1iIl3NjzPDjWa8xO4cSateRBrnDTg2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qMJe0xgB;
	arc=none smtp.remote-ip=209.85.222.70
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641AB606A334
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 641AB606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qMJe0xgB
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99062be02ddso751683241.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794919646; x=1795524446; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cn6UENZGdLiJytyF84lr/H5zLWzIbtUmLBUEsnq8LiA=;
        b=qMJe0xgBt/Ma2L16LJ/0vSNlg+wqa8kiePgu4qJKUzAoL3knHgHnYYnINqFWVt6MLs
         nrulCpYHqeulZaf1X65zquVjyGMhT98I3De7CXkn9jfWsC4tmYtmYCIJh2xLzyUCing+
         Pv+GNeWNjfi4xjDE5QqHzkeT5nKndOlNtNzANQ79DdgayyjYOQ1JMjYGJ/6tyexuLtVs
         TOPNntSvrFL47tcVhwq8aHzhov9RI3u5U4MC9BPrwXyL7bpxlHWdVKx/pq+EDaceeqEL
         p++h2haY5izvn9cVly/uKRDzMnracQlzePDFxvrmDyYMvzCg+hga3UL0OudUGM06e/L2
         1uvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919646; x=1795524446;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cn6UENZGdLiJytyF84lr/H5zLWzIbtUmLBUEsnq8LiA=;
        b=Q+QDago0TLyH41S6cPNPk6ErFfGMc1kQn4IG5W9xDFsB8e44IzDIHBMoJQ18GaUw4a
         6osUm2V8jUfga0OAoil4546/PT02TA6mIvKxlFY67S9dfOkEHgxIxH+G90hnptNkkOP7
         6T+kg/FfdSq4CsG1Su0YqArPcwgR+bTaS4Rv7W9zYHQHS0Zr17mkuzQ04Oo93UH7SJCf
         +jR5abipl+GzSFLYYCHIWoHYV1rqHNHoUZCc4v17hkiFqmCiY4rE/wXcAaz7946cOOsW
         hcDPPVfuyTXZO+VFN4QfDvNKz2C0lW7Bncq17LIlKF63FPkhS33f5s2mslq2vj1Zrv9U
         Bnog==
X-Forwarded-Encrypted: i=1; AL+hErFBbstyRtV2IdFCPNfS9Jq4nsyoOcXytqw7NsY1VLJrqkfkVqKKG2Mudlw9ttmi4X61bBPx/4mOjt/Wxok=@vger.kernel.org
X-Gm-Message-State: APuU4Z+V6s7pVNoGDa7dKka0HYX2QKQVFsCK3lXMZTT2FQwaQp+AUB05
	t/kovL9bfyQGs6lgSSRzoC+l9uS1qveS+3oIyumYZ/2uv+tz3gePImRgm9b5KyspvQmS2ejXLpV
	+INHT2BlyXReB/JyoRwcUOZ08Ow==
X-Received: from uakn9.prod.google.com ([2002:ab0:1e49:0:b0:99e:e0e:e2af])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:6cf:b0:7cc:2946:7f69 with SMTP id ada2fe7eead31-7d64d6d70eamr3852994137.8.1794919646079;
 Tue, 17 Nov 2026 04:47:26 -0800 (PST)
Date: Tue, 17 Nov 2026 12:47:10 +0000
In-Reply-To: <20261117124710.1338951-1-thaisonphan@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117124710.1338951-1-thaisonphan@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117124710.1338951-3-thaisonphan@google.com>
Subject: [PATCH net v3 2/2] tcp: accecn: initialize AccECN fields in syncookie path
From: Thaison Phan <thaisonphan@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, "=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ij@kernel.org>, 
	Olivier Tilmans <olivier.tilmans@nokia.com>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, Stan Iliev <stani@google.com>, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thaison Phan <thaisonphan@google.com>
Content-Type: text/plain; charset="UTF-8"

cookie_tcp_reqsk_alloc() and bpf_sk_assign_tcp_reqsk() allocate struct
request_sock without __GFP_ZERO, leaving saw_accecn_opt,
accecn_fail_mode, syn_ect_rcv, and syn_ect_snt uninitialized. When
accecn_ok is negotiated in cookie_{v4,v6}_check(),
tcp_ecn_openreq_child() reads all four fields to initialize the child
socket's AccECN state.

In addition, because the temporary request_sock used to send a cookie
SYN-ACK is immediately freed, treq->syn_ect_snt is lost. For AccECN
connections where the listener marks ECT on the SYN-ACK, leaving
syn_ect_snt as 0 causes tcp_accecn_third_ack() to see a mismatch between
the expected Not-ECT and the peer's reflected ECT in the ACE field,
erroneously flagging TCP_ACCECN_ACE_FAIL_RECV in accecn_fail_mode. Refer
to Table 4 of RFC 9768 for more details.

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
v3:
  - clarify syn_ect_snt / tcp_accecn_third_ack() description for
    AccECN connections and reference RFC 9768 Table 4 (Chia-Yu Chang)
v2: https://lore.kernel.org/netdev/20261116023709.132684-3-thaisonphan@google.com/
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
2.56.1.703.gf848ed807c-goog

