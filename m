Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5C54A2619
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792328341; cv=none; b=ZM47zRVCI4S0mF6qzoA767ErVQ685lX96qx3rEYDmJzbAIjK/CLekesmqtUbOYU8+IEJiSgZq8wmAnzRsNzstfq4w5U1oZLGKzlDIgi9VpLpnbbsbcPzrHlZPQDOhyACbuBbuCMv7Cc0z7OqyXF9Ua9lL9faMXGGlNVdwqsAbbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792328341; c=relaxed/simple;
	bh=xR65rD1XXzW6LmRvypgHiWyhHotpLQ5vIgfCN94vsew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oKlZS6fjM0vggHkkEz54trvMBmH6j2YP1uX5uEDgjmI776mqpvOsNaJv4PQpb745AF0B2NsCWltvJYrgqYkB2K4iKyu7cWthUTFbjHpBgaP3ehpLgEzzB2FiXHZ5emXgNAMbKcsQ+eAU9vgf78Y0xaPa3NE3QEqZNai0ZWtqOhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=vQCCbnHT; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="vQCCbnHT"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2acc1e170cso175699266b.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792328338; x=1792933138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tf5pIJAHsqDzocywUo8t05Tt3tw5TbcwP/1+3UACORs=;
        b=vQCCbnHTUXI3f7hT3Bw4mFfwwbEkMQnu6B5i0LmJDtD0h2j16IZJmqVSS02Gt/fmyS
         xnSpTBZvQS62bqTzKDMXrKV+fGc7FBUI+xxZbNENHeuCfFnKvvDBWmJMgKc/Vj49bIAP
         jGkyWYEbXMVuBcszJ+rc2ZjYAnGAO1l6sah647hnzOD10brJWIw2mkBk/d9XJpuWdvYR
         FW3CGRWkQ+mcK82Vxypjhub3yZx4SKsj4qBwCx7aew9NzybR4Pv5lyCyw+zxhf7auG6e
         BljpXwLr5Sigx5/GMUtzqcStHD1XbFRkSgf2EpSjp5QlDeSoY9qDgt0O5hcfIsfId8mz
         AQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792328338; x=1792933138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tf5pIJAHsqDzocywUo8t05Tt3tw5TbcwP/1+3UACORs=;
        b=1//nG4NDWqkv2ZVpWC8/eyfKz9i3qDh+8pRPZ0whXtKeHNFmlR676B6CztoF7W6z61
         ZS3KeH76NsxnDbJ95bFewFUK/qmr3/mwxzOAcMTF1SKMSOg0CMvt07Pw4HJVE8OOj9WI
         F0c3WA+WUrCzvN/OkcpltDAEcpykjujl4RU92ZybaE6rNdvTaLgOHZiMzEH0RAK+3yJD
         YkY8qGO27syixvvthVhACPdtzoBg9JaAw+QiWUp6HHgar88vFnVaYq/O/M8nWzrYfyOq
         pQGZu/UOWvzZrtVZ1aWeCuGMJBf+iIBjL2s0W6gPnV2XUUY/4P7DmZtvt/OU+f+aTVhk
         OBEg==
X-Forwarded-Encrypted: i=1; AKwUvBzHtmv0jx6K5tB44BVQwxo5HExBD+fM28dmP+VY8wWfzx5M9BNoSdH7FXFnOpfIaajw0k1YUc1HlTRGxgw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjWvT89BHVTf/e26OT3Hf3wKMjimquuuIlebklN1i+/ookgNVW
	KUZ+so3nraVruo0v4bXifu4w+Bfc8+whVZ+u/azPAqLJNImaQmqyJUxXD1SCmSUouQ==
X-Gm-Gg: AYBFou15DezyJQuPhWdFi3+19obBg3t6b2xEWMdrg9NWgJLaA1A0QyiFdi9bL8C9vIw
	rRwwfXYmrROHXnbiJPD7TUR9OyLjArczUFYQ/TQQLlnrf1elWfdChtm8ENByl38aFMHYipBl4tQ
	/kV0q2uaRDur11cSVg1hxNpZTOYiUqiDuiAVDC9gJ5BgEt1skY7NkGUWxjOhHHMuzqdjbMM3QQL
	GrQrpl1ORxbWlyryMidbr23S3a58HlkyjhVv2TeS5L3Y7bEBXJi1Qm2cs5WWrGGv02RgrXuZp6v
	fbxiHM9bg0IDTiJBITJK0RBt1h9kIG53WXCxm77Yp3x3Ih6PD1mWQNr+uiSAkLQ8pe5V43AfP8T
	FZroAgv1EQFqqTlQwuCDqBciwc87oyZVfzSe7rxzXbrCVzMuUK3oryG8mqtNZQpObnPvz5Razl5
	4utWLQxBnOlYVHyml6Xf/YSATSsg+gnAe/f98Uz05ugk+zevoGzKi9jKnnRVrH65l6I37YoWtO6
	8YDUQFVuhwMloQwm5h9ciUZUr9+QERof7VuH16Y9JW9bKL8IGPjxYfIYzxsMJU2zcaXP37oOHH/
	ulfg0826AKSOS6lYEcugTT9zTvr+Q+ezwFhgvtPy3YSJszaWkCNVZPhiBRvLh26CXT9cJLmdpnI
	EXzMGNod4+ZoMzzMKRbNS3mz7ChAsKekvDPTiwzgbYtZQvjRS/TtkirXnVgSOVEViovTMPAIEyc
	YDeQA45kj0
X-Received: by 2002:a17:907:6c16:b0:c29:f5d8:9c72 with SMTP id a640c23a62f3a-c419ef2bf4bmr331985466b.33.1792328337569;
        Sun, 18 Oct 2026 05:58:57 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce05csm259032066b.33.2026.10.18.05.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:58:57 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	steffen.klassert@secunet.com,
	willemb@google.com,
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 0/4] ipmr: forward GSO multicast packets
Date: Sun, 18 Oct 2026 14:58:50 +0200
Message-ID: <cover.1792293419.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With fraglist GRO or UDP GRO forwarding on, a routed IPv4 multicast
stream arrives as GSO packets. ipmr_prepare_xmit() drops every DF
aggregate larger than the MTU, and ip_encap() sets no tunnel GSO state,
so a GSO packet sent to a VIFF_TUNNEL vif is dropped during
segmentation. With that state set, a fraglist aggregate reaches
skb_segment_list() with tunnel headers, which can write before the head
of a frag_list member, and a TCP GRO packet keeps its fixed-ID flag on
what is now the outer header. Both also happen today when such a packet
is routed into a tunnel device.

Patch 1 makes room for the tunnel headers in skb_segment_list().
Patch 2 moves the TCP fixed-ID flag to the inner header on encapsulation.
Patch 3 sets up IPXIP4 GSO state and outer IP IDs in ip_encap().
Patch 4 lets DF GSO packets pass when their segments fit the MTU.

Tested in QEMU on veth, n=3 per arm: an MFC entry to a plain vif and a
tunnel vif, 4000 1316-byte datagrams per run, fraglist GRO, UDP GRO
forwarding and UDP_SEGMENT, DF set and clear, software segmentation on
egress; a fraglist stream routed into VXLAN over IPv4 and IPv6; and a
TCP stream with fixed IP IDs, merged by GRO and routed into an ipip
device with DF clear.
- net (7ec48f396a1d): DF aggregates dropped on both vifs (FragFails),
  non-DF aggregates dropped on the tunnel vif (tx_dropped); VXLAN:
  KASAN slab-out-of-bounds write in skb_segment_list() in 6 of 6
  runs, then a panic.
- v2: outer IP IDs repeat on the tunnel vif in 18 of 18 runs.
- without patch 2: TCP over ipip repeats outer IP IDs (831 unique of
  14666) and increments the fixed inner IDs, 3 of 3 runs.
- this series: every segment sent on both vifs, FragFails 0, no tx
  drops, outer IP IDs unique in 18 of 18 runs; VXLAN: no KASAN report
  in 6 of 6 runs; TCP over ipip: outer IDs unique, inner IDs kept, 3 of
  3 runs.

Changes in v3:
- Patch 1: name the VXLAN out-of-bounds write (Sashiko).
- Add patch 2 (Sashiko).
- Patch 3: reserve one outer IP ID per segment (Sashiko).
- v2: https://lore.kernel.org/netdev/20261011162957.1328474-1-julius@bairaktaris.de/

Changes in v2:
- Add patches 1 and 3; v1 let DF GSO packets reach ip_encap() on tunnel
  vifs, where they were dropped during segmentation (Sashiko).
- Keep the additive MTU comparison and check mtu > encap before
  subtracting, so a route MTU below 20 cannot wrap (Sashiko).
- v1: https://lore.kernel.org/netdev/20261010131842.2157365-1-julius@bairaktaris.de/

Julius Bairaktaris (4):
  net: make room for the tunnel header in skb_segment_list()
  ip_tunnel: move the TCP fixed-ID flag to the inner header
  ipmr: set up GSO state for tunnel vifs
  ipmr: do not drop GSO packets that fit the MTU after segmentation

 net/core/skbuff.c         |  4 ++++
 net/ipv4/ip_tunnel_core.c | 13 ++++++++++++-
 net/ipv4/ipmr.c           | 23 +++++++++++++++++------
 3 files changed, 33 insertions(+), 7 deletions(-)


base-commit: 7ec48f396a1d89532c0537bc38b408b8c31ee37f
-- 
2.53.0

