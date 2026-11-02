Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661510;
	b=ZgVDToqXgt7m09mZqn0OchMi+5exw6Zzp6AWLgqK5I38xKd2+7tMbUJMxfBZhw5S1fAo
	 ruFF/IFJfetfnC4vb2GZ0lbstAFX/1O/yIkyrnXSN7p7DUPjSpgCtigiSYBgYFZVLurnR
	 72rHTnc4msvL2+LWaX4rU5Eg6kLvC5hJMr9Bgtt9v0BkjybWRfCB9zyzkw1oxAFugIYxg
	 kCJscpywvJDgJYMV57cFkLKvcUzq8aJSNOaPpP7FvnccEjZvc3njLo7BQ4V1fnpggSPyV
	 05xyCC5/cLRKywX3esjxDPJ/yPYtgOzZuUxmCF8bt+CFum9EBlxd3wYC6/jKpZQGaPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=LFVGfhguVIcON2Iuwy9nGTiu+m3FyzEBTJ2yKEsx2aE=;
	b=hUNfuoaBoCYwSLRk/SUpNAcK9c6ttVFoslnV39LdEsccG8dn3wlLO6stueWHUMqz/2Nd
	 mC5ji69UE/2iW/tyqsQUdoy7t+XJtQkUhfujHoHeKI4xQEhhKTNtppr7w3mwUN5Lrr10A
	 SKXkbPSCKB58wc6cD5md5kc6Xo1Aa4PW71V1yhCrEsmazL4FCAxGInD2znWywY+w+zxWP
	 bTULzYmGP+OW9XTMuu3TnJ3b8dxZ5OrM9Y6ZkQnj4M4BOPQD8mg0Ku6Avk5yT+VBoifcA
	 zvFw/FOWWYBH2j4yx8ouHBEj4RyjzOOOx/8Bx38RcZbq7fk2ghbGdqFRdjoWUaKpzwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DXKmJT3l;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B96606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46B96606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DXKmJT3l
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so8114704eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793661508; x=1794266308; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LFVGfhguVIcON2Iuwy9nGTiu+m3FyzEBTJ2yKEsx2aE=;
        b=DXKmJT3lCkMlwCskfFOjbDWelDzwwlLNmhIHmHwNsNRnJ0svZpkUW69UETFPWwY3lK
         VbjijYoIQ+s6KQ6vinBnRUseiXI8/sJS7Hxg16aspX82rL5MyMeTo9Z/QadHkhURUSH8
         dVaVizVG2yFsiHv1WgpDG93FWlvstODhE4+v736QFowJi+hlqkDYQ1pb5NXg6wPrAhOM
         /96ioVQgdMiT71YgQdw1R//aButs+8NhfzTiVBxk/ZNVxFsfS9weKCD8YKIaWtcg9X6i
         NRhZLsHrF2KP6WtMwRMnsPQ02d3hwOMWLhMGg7FbnvcXRCUNSAS1Q16lULwwO7tx+fJ8
         uTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661508; x=1794266308;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LFVGfhguVIcON2Iuwy9nGTiu+m3FyzEBTJ2yKEsx2aE=;
        b=hIwvknvcxWN3Xt4qg0uJVUVV5qpSL9b6VWATNS9OGfn8E/v2IsxGDdwxNzIhGOfgU3
         XDQpqEruDf8zO3d0RoMbBPCVLTzo/2xoPUATOJB4DhpPpGkNF+bFuPO+TrJY2sOzEjbH
         v0xmocKsHPbflOCStKRarVOQCBt1Or94aJC5x7sVKCUNOyus6PNmirhpCC/YMY49XiYd
         b+wrPF3TUHPSGDfYb0J5gahyP4/p0QmuC22aN70wkpM80Cvp7GNzm/phmuQ3BBAz/jqP
         67aZDJ6HBR9IoqAwnDjtMrc4q93AAwielwmqyd7Ayk1xE7n9glbHAL7HjlY9Ozn6WM4z
         vYnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLpbXMl5toz8FTOPSEPNRlt7xVQfsY/30FWZuSe2HSex1o9GveU7i4PYXT6t0fHfEYvunVL2qoDfMHvUI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Udt/uCUUel3Cdp0yEAZAT9EFXIVMvTlJGDsGECwddDMK4wnhJ
	wy3Sf9tnOGmXCOcrbiDHyngj2iUe88gPrgaFqou6eD8YG542xiFxrylgm0FmzPGslwysHrahBv/
	RwV47vkCTaCIfOu4KDpaNu78+IA==
X-Received: from dylq31.prod.google.com ([2002:a05:7300:599f:b0:369:dee2:2b2b])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:1886:b0:35e:6eae:c01a with SMTP id 5a478bee46e88-36a4237d9d5mr17726681eec.19.1793661507989;
 Mon, 02 Nov 2026 15:18:27 -0800 (PST)
Date: Mon,  2 Nov 2026 23:18:23 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102231827.4088254-1-almasrymina@google.com>
Subject: [PATCH net-next v2 0/4] net: prevent mixing incompatible memory
 providers in skbs
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Willem de Bruijn <willemb@google.com>, Eric Dumazet <edumazet@kernel.org>, 
	Mina Almasry <almasrymina@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>, io-uring@vger.kernel.org, 
	Stanislav Fomichev <sdf@fomichev.me>, Paolo Abeni <pabeni@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Enforce that all fragments in a nonlinear skb come from compatible
memory providers (and for devmem, the exact same binding).

Patch 1 fixes skb->unreadable propagation in skb_split() and skb_shift().
Patch 2 stores mp_priv directly inside struct net_iov.
Patch 3 adds skb_has_net_iovs(), skb_mem_provider_compat(), and
skb_frags_can_coalesce().
Patch 4 enforces provider/binding compatibility across TX, TCP, GRO,
IP defrag, skb_shift(), and skb_try_coalesce().

v1 -> v2:
- Generalize the check across TX, TCP collapse, GRO, IP defrag,
  skb_shift(), and skb_try_coalesce() by storing mp_priv directly in
  struct net_iov and introducing skb_frags_can_coalesce().
- Fix skb->unreadable propagation in skb_split() and skb_shift().
- Add KUnit coverage for cross-provider and cross-binding rejection.
- v1: https://lore.kernel.org/netdev/20261008034027.1403188-1-almasrymina@google.com/


Mina Almasry (4):
  net: fix skb->unreadable propagation in skb_split() and skb_shift()
  netmem: store memory provider private pointer directly in struct
    net_iov
  net: add skb_frags_can_coalesce() helper
  net: prevent mixing frags from different memory providers or bindings

 include/linux/skbuff.h   | 58 ++++++++++++++++++++++++++++++++++++++++
 include/net/netmem.h     | 15 +++++++++--
 include/net/tcp.h        |  5 ++--
 io_uring/zcrx.c          |  2 +-
 net/core/datagram.c      |  4 +--
 net/core/dev.c           | 14 +++-------
 net/core/devmem.c        |  3 ++-
 net/core/devmem.h        | 25 +++++++++++++++--
 net/core/gro.c           | 16 +++++------
 net/core/net_test.c      | 34 +++++++++++++++++------
 net/core/skbuff.c        | 34 ++++++++++++-----------
 net/ipv4/inet_fragment.c |  3 +++
 net/ipv4/tcp.c           |  2 +-
 net/ipv4/tcp_output.c    |  3 +++
 14 files changed, 163 insertions(+), 55 deletions(-)


base-commit: 4dd16e31135ea8437a720222df34e8745f385d6d
-- 
2.56.0.385.gac671c819a-goog

