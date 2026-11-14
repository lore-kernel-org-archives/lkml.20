Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672788;
	b=3P54aFZnO/SihJRluPBBqVErOW7uletaNOeDIzgHhkeaFmw+b97Ob3eKYNFmyYMq24bn
	 tHq1Lq+RHU7Baq4nFhUWl4kO3FRD/w/cLyNIPfOrE+0GfXmG1JsoLyOlmAcJG9xu4zerl
	 pumP1VU58d4LYUNxSF/0ONIgjoWcfM7GjEri2UFnDQBEXdz7ovG4u70fZpZfgoS+0eE/D
	 zx99Jvo03REhg135moVmc92NTouvggbjzH1RddBAn6r35EXD4sPhqfDFK7ZR05aiBCp/C
	 WaiYcE7jYGSKbJPUIZkb7D/0qd4EMTDQ4OiIaVvXd37I4jdrZMYbigaBVFdpfOyonjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=L0ZfYfEQN7LuG5FSK1KxSP31QhlyFlSY0e3jHRK4CI8=;
	b=fOjDHO3CDbFzoXrIvkCeswNTUz/s2vp5e8KMuRrYn15r9VybqpLdejsplu2ElnTnTIFK
	 g6PeueHAPFgSBWpQ13oGJx5puxqFCCTSINQxy49TJcETNXDTcG6L4O69LLZcZXnunzxXM
	 2K37BvRR1jzaKD2/vbpJPkYpbZW+VPW6dsLBfnTOIvVWNqyrGuHDlNDgxAfKAWGPUY64F
	 hsARL5s42xup844m79ZpQaBKm26SqT6FEYgIuLx5zaU/KH+n+n0utjX1JJ0qQL04yYtjl
	 yeEvJp3gj0pVvO3C55Qz17lBzyTb/N04JcIeEZpmhwQvIYUS1cXBpwhb2C3Otuji6mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dxqcqV1V;
	arc=none smtp.remote-ip=209.85.217.71
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542A560A262F
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 542A560A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dxqcqV1V
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc3a482af7so1878267137.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794672786; x=1795277586; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L0ZfYfEQN7LuG5FSK1KxSP31QhlyFlSY0e3jHRK4CI8=;
        b=dxqcqV1VDTkVXeYNy/zhY1OZhvplEr6t8AMjITIs+pP7KzMgcfZgl3zIr77ScGTyTd
         gY1snc65kzzSCtjfAgnw2+ABJ2/m59PVBpP9oAKMLM3xvZELmZ2co94oFnwWVqtSYLI2
         ghVi55aHUDyj3lsxT3Kbxr7hgnhxuUkVEwEL0fB+IS3w9T1658pa8ivXLaDbGGyAWQ7s
         I0QJaCx6Ho9vZZBwabKO4wiX/cGDUEVLT2R9lc2muhmKtyfu1jZDVYqOmzWv6dJjDYVw
         7DdbRCqVW1MgiVeD0aef6UnyuymGuLpfLKDipPESYfwuqNtgsbhcY/JDFDKGPFfk3Su8
         rM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672786; x=1795277586;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L0ZfYfEQN7LuG5FSK1KxSP31QhlyFlSY0e3jHRK4CI8=;
        b=mvKd449S8kuNX7Uc8NzHHnFj2vNENqpC+TKvlLHDzf/+D4H0gYPS+1sOaLqcrDXrj5
         0JZT6PQFzc72x8fY/NnggxMgRm2xdgwBIgSMjcdB9hJDzgnhFo5a6kNQSAyH2N1mIrlU
         Kdjkj5W45hG+g9benxVHwdv8XVoOoujvKkreb1jEj0MSaAQxzaLV4H5ptKlsqcg/K2CQ
         u+t03SqRvYIMUbUqvq7ZiTsg7CwngiHnp42v6Y2we/GrSaElCKldiOQ4gB8Ll9IemDgj
         FBkrPqfbMvFDlLZWxGYrALfXYTdyheummWJLLey3BWyMvCYi0EfJwlutUezx1NCtO0VE
         ZZSQ==
X-Forwarded-Encrypted: i=1; AL+hErHvrDu4+ePBSFQFtVARmuq7lZWH7EnTdG46JWro2Yb4lBWZki0j14gobCV7Zi4x5w731f3Wj4P6VUtNobA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9R1sjDfZWMP4oJWamq4P9aW6p1WLO59jQq9teSo5TEJTFiDJpp
	0UuubqpqaPd2K1/Btkj8ABakdaVqhYVxbo6mxaHZR1IN8XohPxtyV4tEnMVNB1JErCxt2J7rfL0
	jGIsKRJ6yfBr4pTD1g2+cCzI7Yw==
X-Received: from uatx2.prod.google.com ([2002:ab0:35c2:0:b0:99e:e0e:e2af])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:508e:b0:7cc:26a8:e726 with SMTP id ada2fe7eead31-7d64d7a45camr2156391137.26.1794672785979;
 Sat, 14 Nov 2026 08:13:05 -0800 (PST)
Date: Sat, 14 Nov 2026 16:12:47 +0000
In-Reply-To: <20261114161248.3428695-1-thaisonphan@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261114161248.3428695-1-thaisonphan@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261114161248.3428695-2-thaisonphan@google.com>
Subject: [PATCH net 1/2] tcp: initialize ir_rmt_addr and ir_loc_addr in cookie_v6_check()
From: Thaison Phan <thaisonphan@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ij@kernel.org>, Olivier Tilmans <olivier.tilmans@nokia.com>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Cc: Simon Horman <horms@kernel.org>, Stan Iliev <stani@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thaison Phan <thaisonphan@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit a3a128f611a9 ("inet: consolidate inet_csk_clone_lock()") moved
the LOOPBACK4_IPV6 initialization for passive IPv6 TCP sockets from
tcp_v6_syn_recv_sock() to tcp_v6_init_req().

IPv6 SYN cookie connections allocate a fresh request_sock without
__GFP_ZERO and call tcp_v6_syn_recv_sock() without tcp_v6_init_req(),
leaving ireq->ir_rmt_addr and ireq->ir_loc_addr uninitialized in
cookie_v6_check(). inet_csk_clone_lock() then copies uninitialized slab
bytes into sk_daddr, sk_rcv_saddr, and inet_saddr, exposing them to
tracepoints and bpf_sock and causing inet_daddr != LOOPBACK4_IPV6 checks
(such as IP_OPTIONS in do_ip_setsockopt()) to misclassify native IPv6
child sockets as IPv4-mapped.

Initialize ireq->ir_rmt_addr and ireq->ir_loc_addr to LOOPBACK4_IPV6 in
cookie_v6_check() to match tcp_v6_init_req().

Found in CI testing on a KASAN kernel; reproduced without kernel
modifications in a KASAN VM (tcp_syncookies=2) and tested against the
reproducer and packetdrill syncookie selftests.

Fixes: a3a128f611a9 ("inet: consolidate inet_csk_clone_lock()")
Signed-off-by: Thaison Phan <thaisonphan@google.com>
---
 net/ipv6/syncookies.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/ipv6/syncookies.c b/net/ipv6/syncookies.c
index b581cb1ee2e8..b33011b71fff 100644
--- a/net/ipv6/syncookies.c
+++ b/net/ipv6/syncookies.c
@@ -17,6 +17,7 @@
 #include <net/ipv6.h>
 #include <net/tcp.h>
 #include <net/tcp_ecn.h>
+#include <net/transp_v6.h>
 
 #define COOKIEBITS 24	/* Upper bits store count */
 #define COOKIEMASK (((__u32)1 << COOKIEBITS) - 1)
@@ -205,6 +206,8 @@ struct sock *cookie_v6_check(struct sock *sk, struct sk_buff *skb)
 
 	ireq->ir_v6_rmt_addr = ipv6_hdr(skb)->saddr;
 	ireq->ir_v6_loc_addr = ipv6_hdr(skb)->daddr;
+	ireq->ir_rmt_addr = LOOPBACK4_IPV6;
+	ireq->ir_loc_addr = LOOPBACK4_IPV6;
 
 	if (security_inet_conn_request(sk, skb, req)) {
 		SKB_DR_SET(reason, SECURITY_HOOK);
-- 
2.56.0.611.g1030f0b940-goog

