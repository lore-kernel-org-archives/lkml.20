Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C30312AAF1
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792335576; cv=none; b=EUOFD0PC/yS6ZPqMLsWs8kbX83g91OCgyX4/xTkviI5zMWxUezNXVBs9cAgIjNdapJxsuu8QnDmRzBYuem5/9qNwBLFGay/uyGH6tenCZFcusrQl7KDpqnoNLv2Pb7XT/EF1pHMrO/gyuecqx6rP+SQV6UB/dK3uGmDCztJdr7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792335576; c=relaxed/simple;
	bh=eAePSMguL6EqnK6uLPXhTD4oc8nXCafCbmC72gKkFhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WEt9Jwm9sqJjCMlZaBX3ETnpTgnq+KdWTkI7S268PJWO1xxNgAIDwi18+/JDyXFEL29SjEyIjDDqJw7LtpXm949li21cTUoRAXx/SqjeBloJOCRHJO9COx5yF+pvvyPbhfd7ghpAFxsUihSGrg+T0Nb3J5M2cKAeZdUMLP02tMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbwm2+Rc; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbwm2+Rc"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so379839a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792335575; x=1792940375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f6pyy7nH+NFSMHTDEazkO6g8qtUhCZCbtKhuHMJcuO4=;
        b=bbwm2+RcdVwwfpw5dk22GVPjbO9YwRSW0Q8XpSzJaTW7Sn/Vbh6llKlDy+wQgvkjMb
         ltrJUITxZ4QPvyY+UssiE3m8npL0xLPfgu+oqom3l4jvTA7e4YCQyURTxHaJ3IQCYdwq
         //26yCN3fEgwWmkD3UX7STc4XEA1p59zjSp7jZqAN+tHiPYO84A2SEum55ib8bZVcCy9
         8mnVhUQsbun54h/qLr58d+Jbl83BYwk3oik+393m4QZL5LoC1IftWoKPTXMgZORV/Gcc
         +VWanwWB5gyEvQUwQ8fOFqhnBiG5gSfozdps/0xsP2t1b3vg1bw9mUXTwCceGsSG+ltU
         hjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792335575; x=1792940375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6pyy7nH+NFSMHTDEazkO6g8qtUhCZCbtKhuHMJcuO4=;
        b=Q1Qq62NDbQUtYJj1455xgWZy581hQqBKyrvLnOCsuLfPV4m68Xv/yMuwTJKRfIZ9/2
         ZWWfWLaaaT132F2+I8/Hkf5Ylg+l1W6ZgLtt0im8spuQzREMEkBkGykhJSiFv7fspjTL
         Lhqgpb7KtYdgr6NFHSJNfuntSqCXvbti9xiHGGN2V05H5O42IZRjRK+y6vO/pb1gHmK5
         yJy3WD50OXdRHKPM1nD6xWYjNow9cyB6ezyIyFLgHo7VHU9rFXg8FJ8x5nLIPqgc0Y4M
         beEWMs4ldxOLPb/Rzy7oU5Sd8xyoom0vHTnVfyZdzU17bCv67ZTqOvtaLtBx+ak03oBY
         qoSg==
X-Forwarded-Encrypted: i=1; AKwUvBzim1MKq7u2/cA+ZUJFs1JPj8iL3tbpbF7QUVda5NnJFk7SyfgwE6cr/IwAunLITPzUuQKXYdSlQ3HRlnY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqNunvGq7vfxOsioDqIWNWeG2doSoHuWxw2VVoKPr8KQ3MsuEq
	JnlxnJW1g91QnLdxcODSC8zCsdw0xXkOkZis7GpfV9tPfWKcWgD2HrlU
X-Gm-Gg: AYBFou02yrj7pODo/A+ykIgkM+lFG3XtVuHW+fHpeUqtjkBLrkxpQVFTFu+XvU1j73U
	l/ZGaXzZq/KkAYl4B+WHDIs3DuCSg9FHhxTsCVfOJZgY5aACO8QRg1GVHP2VQiCprd3e0/6x0Jn
	N4b9umVKZmvCbcMcoqdkKXSzwpCX7dzxXOyXTV1pJovdcExrAkKzsP67I4kLCrTpiqZyhtLYEnC
	86IEVptQqhLlo8wkhl2461+dP15edSuNs6THyBkNyYKwOa3M8g/SeD21aNBxg8Ah8+2iKIaF/yK
	b6NCYXU3w+6VX+GjdmKpUv45Q+oovq55J7ffh2WKXNRtilv8F3Gm867hj4ilXkP1rCilAclLIX4
	VgjQJPB1nskr76f5+iq6EcJ+0WA72VYoGPg3PpQsfv3+efAsFWzA+KyId6/iAY8RfqASy+hxl30
	E99mO/d6p71krI7GRebhiJ0joRDer+WAdK1qoN1ygXdplZ7svvVzumPbtH6zhJlOYKD27Hz5O/a
	ubG8EL/
X-Received: by 2002:a17:90a:d00f:b0:3ab:b39f:41cd with SMTP id 98e67ed59e1d1-3acef543057mr4181119a91.60.1792335574786;
        Sun, 18 Oct 2026 07:59:34 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac1:7aa0:50::245:a2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc487cccdsm12001698a91.8.2026.10.18.07.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:59:34 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: jmaloy@redhat.com,
	tung.quang.nguyen@est.tech,
	netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+0017742620a9d06f06ef@syzkaller.appspotmail.com
Subject: [PATCH] tipc: unshare skb in tipc_l2_rcv_msg() before decrypting
Date: Sun, 18 Oct 2026 21:59:28 +0700
Message-ID: <20261018145928.58317-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Packet taps such as AF_PACKET sockets bound to ETH_P_TIPC take an extra
reference on the skb before handing it to the TIPC packet handler.
tipc_l2_rcv_msg() passes it on as is, and for an encrypted message
tipc_aead_decrypt() calls skb_cow_data(), which may end up in
pskb_expand_head() and hit BUG_ON(skb_shared(skb)):

  kernel BUG at net/core/skbuff.c:2308!
  pskb_expand_head
  __pskb_pull_tail
  skb_cow_data
  tipc_aead_decrypt
  tipc_crypto_rcv
  tipc_rcv
  tipc_l2_rcv_msg
  __netif_receive_skb_core

A packet_type handler must not modify a shared skb. Use
skb_share_check() on entry, which clones a shared skb and frees the
original reference.

Reported-by: syzbot+0017742620a9d06f06ef@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0017742620a9d06f06ef
Fixes: fc1b6d6de220 ("tipc: introduce TIPC encryption & authentication")
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 net/tipc/bearer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/tipc/bearer.c b/net/tipc/bearer.c
index 05dcd2f9e887..5e7e220fa7f5 100644
--- a/net/tipc/bearer.c
+++ b/net/tipc/bearer.c
@@ -659,6 +659,10 @@ static int tipc_l2_rcv_msg(struct sk_buff *skb, struct net_device *dev,
 {
 	struct tipc_bearer *b;
 
+	skb = skb_share_check(skb, GFP_ATOMIC);
+	if (!skb)
+		return NET_RX_DROP;
+
 	rcu_read_lock();
 	b = rcu_dereference(dev->tipc_ptr) ?:
 		rcu_dereference(orig_dev->tipc_ptr);
-- 
2.43.0

