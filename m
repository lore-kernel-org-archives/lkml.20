Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794696807;
	b=c+zd48l2NZ/lXoZmn3D5drksMrSuEUKcRSI2krW8wjl3KQITEBpB/J6LKk2H+hxpnzdY
	 zlYyBZZSmx60J9T5pxHzPJf0tIoGuvJJGs+MmZzMbizBHr76rF8WhdPhWqJk7zq2N8EWd
	 H76m2Aau9Jg+vMJrcuTDzyyW9B12ONxZK/2Y/5D0OUbpyvNcHg24n4EkW0Ugmydf3AJI3
	 rSrk/WtUVfbMSdjYoEMDUw3T4utLr+2/ixWZBMIasYnkUg04wt2VolfBFF2WsVl80ICm+
	 WotE6yHRC/l54HFJF9DNgMre5c0yPd/UOs/TdyuyI3jCcsU7T2HeJUl4v75Ic++ln8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794696807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=exfZeVrV52B6ZZlYVkb/BqLRDCQ7cm2Mxf5PCJH5I9g=;
	b=aptlQ1lW8PgeUGxHOI9tl5CQk+nRG48PRYN1qXlWkPL+CxLLqnJ2QrhynrCEh+pMW68e
	 tpYdA4v2jxXtPrY7tmgkpx+SvjjntDjuJ1Lwkh9RA4ok2uRb2TwyiunfbhjnO9oVGiAKD
	 ex8oSUzBz72Bkwi8ywynIu6qbokKlaQ4tdBx5JiUvaSo+l4v1JteD0tUX3PQUlLwrAnDN
	 EkvZWA7jEjjJ3X+cv2XlOV7zLIgTcOUzMKvbg7JFCaY+LNhUChb5kCN+2msnIJB7cVbGy
	 nKjLc+KM5k0LFfPUjmce/ggZcnzCrZDMnfoZeYQBSVQxqg5gnqSbRwMYIrKIYL7kOdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Eh5KB4AR;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28361606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28361606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Eh5KB4AR
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c50604721c8so409025966b.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794696805; x=1795301605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=exfZeVrV52B6ZZlYVkb/BqLRDCQ7cm2Mxf5PCJH5I9g=;
        b=Eh5KB4ARc8qeBkD7BOXdjwrkPu2L1sA7mf/Bje0VfBWw2qvmN41mQbWMyjcv4DB8VE
         qzb06aagwqtLrBIge1bjo4aiTkMVYOYMbijiNisUBchZU345XSZ5DKuUScdww/P7mS04
         c2+4qI98D8jBOvePZuVOnW4EEPd27GFmPotLaJFAGjMzCx0Few0X6t9Dpfc5CgspnKUK
         ZRUb2FqpUDf34IqgYBBEkkfx8fzf42xkQT4Qsp+dgHoBo0hXwtxIvKcYeGNbGLdyGhbJ
         +Q697xUYJc4+yKXCaEucJXOwMjLDQljO8534Np3mTfznx01WlqWUUlGwOGGI+bVYj4Nb
         q4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794696805; x=1795301605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=exfZeVrV52B6ZZlYVkb/BqLRDCQ7cm2Mxf5PCJH5I9g=;
        b=gBxHKJz9sqqAy3Kff8cdPIOFE3ObruYtBcxG7rY2pkzN6bn9zHuZVF/FzqwVy/vqg7
         VPpUtD9eN0jYagZpyDsF1aEQlM1XU1Yk6gTzl7If5+88sM280+d7/ZLFSVpFzKhjZX5A
         VavTRx/ZRtz8vjANkagVFjsiDeAZJX3pEgY/q1o/fGwdoDxCKj1lp0/wn8bAV9AWaic5
         XIvoR+vcqoDY5Bx/LxhOwldVxKMWEFhIW49B7FfzVTHp93lOUVzNiELiriU8sGyPq5zz
         dsOCYvrp72wEPr3itK4DHyUVq7X3oy4Fnh4LZiQm6U+hiIaF+7nanzllX/kWWufbiGe0
         nv4A==
X-Forwarded-Encrypted: i=1; AL+hErFE/d+CKB8zaCN19W4MRCvRqf3UzsAtDYTmXMOCSc2qcZa0Ne9MObrH0jPrSs5Hze2gnymADm5Nt6jneOg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LCz6dbf1o8yv8pIVBN6WSbUIcDVqxFhx29eZoV1X2KH7ti04d
	xzlbEDj/5CoB8/DJBIhV1Em52PS5Ty/BEnOLpdtqPDPYANnoBL0ewb1pcnJ+SW1K9g==
X-Gm-Gg: AYBFou3l4f3xw+pA71l4DL0rnAe4HxdMDaP0GhQOK3Ub/QSIS2/ncpw5J+B/j+xu/y6
	8Wfyke+J7T6Js7hcD3IDVBooJdQmIV0HPqItUbjCDqt1trNoIPXrR+bK8FPRnThWqVEKFj+UwJw
	AFHNXkLQaQ96biPqMDc3J2PrAoK1WrjN8x0cVEOXa6IorLey4d4wXJPi3RsbS+q9BcciFIhDTtV
	d+uHJXrQHVMkSVe23Vp/MqshvQiKKEQwzCFeQ7CsNZG+HbI/MU6GQOp3dPmxlECyEuADgki1GtB
	/v7xeARBC4MCnzNdLm/XO1CXNOZ2SxCq4UtPtmOZ0dj0j0X2sz2HCfjOxvcRq5WV3H3hPUm5xwi
	j/r/jrvpjQABP2Q/wgV1Kt5k4Qup/Thkf+pViSfl/cSJiB5PFSCDYhAQt35zwUU+rNwQROdQRNl
	13xm6CMiHknU6niIwVQ3qv9D8BBPVlJWau9r8GJB5T+J6VuYh7Qb4becyXeneStyUuyXtaInV6T
	nc1aLbsOUDnSnY7SiQhyfsYDmxMbwFOFnMHMwQjQf5USTZNKJJUEnQxlyLi84wFuu6CtI2PTL1L
	1qgLZ00xQlSI5HIbGfz0HmNV18XuAD1AfdfDaaqy7J/o3qcwsUWKwpWUtns7/k05R/I+f2Sewba
	RjEYjK88x77fJD+iwX5uqVyu4KSY1zsIr7LZdwrrEyePnezEt8EwxSd+h7vZXNu8dCoyeEk8H93
	KmQhAX6jedsTL7tgbWJb0Kb/tIa4OGD53y6ADl+2+mTR5TGOUTOMHuh4wrJkQwXMl4rVQHwXLrj
	nDrGWxOrlcRUQAotgj27bVufdFuFQe2802V6FK089Jjmu7EZ7pCcjxnnbJ4IeurQm99rsFal+u9
	MWNcDCMbdi8GgPPKiOh5y9/EyZaSA+nt/eoDafJlOGDi+qNV/qkixMYhsixeKSxE
X-Received: by 2002:a17:907:968d:b0:c3e:34fa:611d with SMTP id a640c23a62f3a-c50963daabamr462013466b.35.1794696804711;
        Sat, 14 Nov 2026 14:53:24 -0800 (PST)
Received: from Desktop.fritz.box (p200300f24709e8006da21e9e53ecde1c.dip0.t-ipconnect.de. [2003:f2:4709:e800:6da2:1e9e:53ec:de1c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b56df7sm262479666b.47.2026.11.14.14.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:53:24 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org,
	bridge@lists.linux.dev,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/2] net: dsa: fix host fdb refcount when an entry roams
Date: Sat, 14 Nov 2026 23:53:21 +0100
Message-ID: <cover.1794696608.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

When a bridge FDB entry roams between ports, br_fdb_update() notifies
switchdev of the deletion and the addition without a lock. With two
CPUs learning one address on different ports, DSA counts the host
address on its CPU port more or fewer times than the bridge has it,
which ends in "failed to delete ... from fdb: -2" or an address left on
the CPU port.

The earlier attempt took hash_lock in br_fdb_update(); Nikolay rejected
it because it slows down learning and roaming. This series leaves
br_fdb_update() and the rest of the bridge's learning path unchanged
and fixes DSA instead: each user port records the host addresses it
holds and, on every event, checks where the bridge has the entry now.
Patch 1 is the only bridge change: an RCU lookup that DSA calls from
its workqueue. Patch 2 replaces the counting.

The counting has been exposed to the race since commit 90dc8fd36078
("net: bridge: notify switchdev of disappearance of old FDB entry upon
migration"). The change redesigns how DSA tracks host addresses, so it
goes to net-next without a Fixes: tag.

Tested in QEMU with dsa_loop given FDB operations and assisted
learning, PROVE_LOCKING, PROVE_RCU and DEBUG_ATOMIC_SLEEP enabled, one
source address sent from two veth ports on two CPUs for 5 s, 5 boots
per kernel: net-next logs the -2 error and leaves the address on the
CPU port in 4 of 5 boots, this series in none, and it removes the
address when the user ports leave the bridge. A "bridge fdb replace" of
the address onto a user port leaves it on the CPU port in 5 of 5 boots
on net-next and removes it in 5 of 5 with this series. In a second
test the N-th allocation of "ip link set lan1 master br0" fails for
N = 1 to 150 while the bridge has 40 FDB entries to replay: v1 oopses
in dsa_user_switchdev_event_work() in 2 of 2 boots, this version in
none of 5 boots, and no address stays on the CPU port. The kernel log
of every boot has no lockdep, RCU or atomic sleep reports.

Changes in v2 (Sashiko's review of v1):
- An addition on a user port releases the address on every user port
  of the bridge, also of another tree, and before the entry is
  installed: the release no longer walks one tree, and no longer erases
  the entry on switches that keep one entry per address.
- Local entries use the same lookup, so a "bridge fdb replace" between
  a local and a foreign entry leaves no address behind.
- The lookup applies assisted_learning_on_cpu_port, and reports whether
  the entry was added by the user.
- The release is scheduled before the lag_fdb_add check, and only for
  ports that hold an address for a foreign entry when a learned entry
  moved.
- An entry is not reported as offloaded when its host address could
  not be added; the conduit's unicast reference is undone when the
  switch add fails, and a failed delete drops its record instead of
  repeating the conduit delete.
- Queued events no longer dereference dp->bridge after a failed join:
  they read it once and drop themselves, the FDB helpers take the
  bridge from the caller, and dp->bridge is accessed with
  READ_ONCE()/WRITE_ONCE().
- Patch 1: kernel-doc and message state what the lookup returns for
  local, locked, "master dynamic" and driver-learned entries, and name
  the DSA caller.

Changes since the hash_lock patch:
- Leave br_fdb_update() unchanged (Nikolay).
- Sashiko's finding on that patch, a deletion that races the locked
  roam, has no counterpart here: DSA looks the entry up when it handles
  each event and treats a deleted entry as gone.
- Of the three findings it lists as pre-existing, the MAB and
  BR_FDB_LOCAL ones are in the bridge, which this series does not
  change; the peer-site one, a "bridge fdb replace" onto a DSA user port
  that notifies no deletion, is handled in patch 2.

Link: https://lore.kernel.org/netdev/20261004124254.3525496-1-julius@bairaktaris.de/
Link: https://lore.kernel.org/netdev/cover.1794134495.git.julius@bairaktaris.de/

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (2):
  net: bridge: switchdev: add br_switchdev_fdb_find_port()
  net: dsa: fix host fdb refcount when a bridge fdb entry roams

 include/linux/if_bridge.h |  14 ++
 include/net/dsa.h         |   4 +-
 net/bridge/br_switchdev.c |  72 +++++++-
 net/dsa/port.c            |  50 ++++--
 net/dsa/port.h            |  26 +--
 net/dsa/user.c            | 353 +++++++++++++++++++++++++++++++++++---
 net/dsa/user.h            |  22 +++
 7 files changed, 473 insertions(+), 68 deletions(-)


base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649
-- 
2.53.0

