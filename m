Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794703205;
	b=cWzuheuMYu23wh4MHxKK8/anvBvAdSzvjznCQqlXqyEw7sqrWRZsZDMSWhhXPmtLQBJb
	 QxCwRNgGjjT9zo1DrwvhlrXJBMAZF+psuQOxm+pFdZh75LUPvR3dE+QiWsTdSZM9f0FdY
	 uNLGFmLjEvyB+FRcwc9I2hfLuvGw8g2wpJv3H+eVLeNyITa7+we7tsHY4+1tT5B+bqIyl
	 h+vY1Gn/df8p1to0SXUIPip/OupfkfmfWvXOF0fUKtExwqLsbmf3T2gy5Co47lVMXzPt0
	 Lednf3ZdH5QfX12tvNpFhmCZdQrebfPTesc5trNsg/yjGw0hlaPA0+QBrWomZFnBoPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794703205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ghyyyMShfprSIjcu4sKZdV7cO51zD2ouEy83EYOaPGc=;
	b=v1hTNRKlO1cB31EqNg/8d1YHvZ103xop6GbXCVZwnxCrIGyG5qH3DqvuJdOqCmIAogLc
	 5PI3BPxRTaG3CCvaUkzNeAvXkZTiBAsWFO5dyHprKB6lD/v4BsnCQUNTbUL1P4C3+7LZq
	 mKWE4euDCCvHkXzQPspRRmdeVlW9euTQFtpGpbycDIXXGFtrqNWIzh2U8xmMDM7PSdrc4
	 Q4lxnErQbbk3HE+bVqgzYbMiKVyFeQf3/IrkWTD5BEuHhq/kUEe3UIXStTiq3hj5ExwFw
	 U7IAvrTD5GY6xINAjyo9kIxHvLXBqpmcrWTMAADsebuLcJDzX3956owYz/xfDe2QSGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MZwvnFYm;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BB4606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25BB4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MZwvnFYm
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so3545107eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794703204; x=1795308004; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ghyyyMShfprSIjcu4sKZdV7cO51zD2ouEy83EYOaPGc=;
        b=MZwvnFYmxpp2tcKd/0nL+1w1Rpi02N0UkeZ8PdILp6gi7OqcpteY7kpG3l6iLpFEz+
         L/4Bb3lHZepII5+VdiXeeMd+0x+6TFyTK1DKFvgG36mwRcGMR89IvAJDXcBX65i+EX3p
         Bsify0hVZW4j4HRPdvfoOC6ZqovC+hJ8j+3cP1t/UYoUCGpoPETHleNkUrpHZBtp5NXF
         10QGbRTD0VKX3YCTdFU3029PAnR/ATC+Tr6/oRcLqOY+QtWg3fh/E6kVt41pLsT1rAVd
         /fvuiJ4B3xxEHjqZQ2ueVxZ3BOVhtWbfVXsEKotrgLK4Dq+rLiQQ6RzuZ444BwEHt0PG
         iUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794703204; x=1795308004;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghyyyMShfprSIjcu4sKZdV7cO51zD2ouEy83EYOaPGc=;
        b=v2qNiVK9x/Y5XIESAS186ygcT6K00EQPizUxIa1s8ofAuazm0w3mqz3pKdm0/SkVZj
         ZZbOhbkH9tfF4lM78sBoHTd+dtDIzWbF1d6s0FABFY+FCrPqGQv9YSFEUSvE5ztolelZ
         rfcs/Vr86w7HLbgrrFvm/41uj+Myj3JGs2STF0HcQdlzuUmkP+LXf7dRcLIcR+djteyu
         tRFDE9kBctXpOMBaMwDnFe83OXgrAzqDoP1TmUybq4KbCblHeTMN0+GMBUm3U7DK8OJf
         DZnlH5LyGAsL4fGBTO5D+JcgVBX7OwmjjHrAzCpOOvwo+SCXJSSQEAdCGnd2QgcKKVDW
         7rPg==
X-Forwarded-Encrypted: i=1; AL+hErG05ogx4u6p0PSRZaI+vvmE40wWfuaR64ur4iHzKMdH/yQ2yx5A96uNrRZexALZNpzpQ2Y4x194AMo2p7M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9v3pvWriIPW//ElD7l8CiWGT8XbBVm8CByKdZXLlW8ulR53i19
	LWGVSxf/O39CyepsNfFkE8W7K89i8iamCllPkx4F/R7RmK3+mbSPci1ADd4iI+NV4NY+gVUlTmk
	aJ2XPTL6Zh5mjavP9/Xx29W7UGQ==
X-Received: from dyp9.prod.google.com ([2002:a05:693c:65c9:b0:366:233a:49c7])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:1285:b0:376:6aea:ab with SMTP id 5a478bee46e88-3796337238amr8971605eec.3.1794703203810;
 Sat, 14 Nov 2026 16:40:03 -0800 (PST)
Date: Sun, 15 Nov 2026 00:40:00 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115004003.3695475-1-almasrymina@google.com>
Subject: [PATCH net-next v5 0/3] net: prevent mixing incompatible memory
 providers in skbs
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Eric Dumazet <edumazet@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Willem de Bruijn <willemb@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Pavel Begunkov <asml.silence@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"

Enforce that all fragments in a nonlinear skb come from compatible
memory providers (and for devmem, the exact same binding).

Patch 1 fixes skb->unreadable propagation in skb_split() and skb_shift().
Patch 2 adds skb_net_iov_provider(), skb_mem_provider_compat(), and
skb_frags_can_coalesce(), and enforces provider/binding compatibility
across TX, TCP, GRO, skb_shift(), and skb_try_coalesce().
Patch 3 propagates the skb_zcopy() uarg to the probe skb in
tcp_mtu_probe() / tcp_clone_payload() and rejects coalescing across
different uargs.

v4 -> v5:
- Drop skb_has_net_iovs() and check skb_frags_readable() and
  skb_shinfo(skb)->nr_frags directly in skb_net_iov_provider() and
  net_devmem_skb_binding().
- Add patch 3 to propagate the skb_zcopy() uarg in tcp_mtu_probe() /
  tcp_clone_payload().
- v4: https://lore.kernel.org/netdev/20261108013838.1454450-1-almasrymina@google.com/

v3 -> v4:
- Fold skb_shinfo(skb)->nr_frags into skb_has_net_iovs() and drop
  redundant nr_frags checks in skb_net_iov_provider() and
  net_devmem_skb_binding() (Stanislav Fomichev).
- Remove the empty-skb check and redundant !skb_has_net_iovs(skb1)
  branch from skb_mem_provider_compat(), and add a comment on the
  early skb_has_net_iovs() check (Stanislav Fomichev).
- Propagate skb->unreadable and compare skb_frag_netmem() directly in
  tcp_clone_payload() instead of rejecting unreadable skbs in
  tcp_can_coalesce_send_queue_head().
- v3: https://lore.kernel.org/netdev/20261104042521.3979880-1-almasrymina@google.com/

v2 -> v3:
- Drop patch 2 ('netmem: store memory provider private pointer directly
  in struct net_iov') and compare net_iov_owner(niov) (for devmem) /
  niov->desc.pp (for other net_iov providers) directly in
  skb_mem_provider_compat() (Stanislav Fomichev).
- Squash the skb_frags_can_coalesce() helper patch into its caller patch
  (Stanislav Fomichev).
- v2: https://lore.kernel.org/netdev/20261102231827.4088254-1-almasrymina@google.com/

v1 -> v2:
- Generalize the check across TX, TCP collapse, GRO, IP defrag,
  skb_shift(), and skb_try_coalesce() by storing mp_priv directly in
  struct net_iov and introducing skb_frags_can_coalesce().
- Fix skb->unreadable propagation in skb_split() and skb_shift().
- Add KUnit coverage for cross-provider and cross-binding rejection.
- v1: https://lore.kernel.org/netdev/20261008034027.1403188-1-almasrymina@google.com/

Mina Almasry (3):
  net: fix skb->unreadable propagation in skb_split() and skb_shift()
  net: prevent mixing frags from different memory providers or bindings
  tcp: propagate skb_zcopy() uarg in tcp_mtu_probe()

 include/linux/skbuff.h | 55 ++++++++++++++++++++++++++++++++++++++++++
 include/net/tcp.h      |  5 ++--
 net/core/datagram.c    |  4 +--
 net/core/dev.c         | 14 ++++-------
 net/core/devmem.h      | 22 +++++++++++++++++
 net/core/gro.c         | 16 ++++--------
 net/core/net_test.c    | 42 +++++++++++++++++++++++++++-----
 net/core/skbuff.c      | 32 ++++++++++++------------
 net/ipv4/tcp.c         |  3 ++-
 net/ipv4/tcp_output.c  |  9 +++++--
 10 files changed, 153 insertions(+), 49 deletions(-)


base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649
-- 
2.56.0.611.g1030f0b940-goog

