Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794136603;
	b=o0RAQBYMVmWRtn2i2/j86CAqFaqASL9TmlbEOKAGJIJbSDkHzInEpOdRvyGIUj6PMRp9
	 A+7I7s3Jrpnlwkvc1VsST6vJLPYqrKiU49DmchF/I5kqHEhZzMliifC6nh47iybKqKWUK
	 +03Dnq49pAVrKETh59Q6tTqkCipq3HA0kh7LdhBtwHtmmQFOiplcw4NoHuaWr9UzuQLfE
	 WBUUp+Pdou8+aoGbRbvj4ohK1D//qttOs4kadfXc5jrMvj6UmSzcmJ8Kg24zD9rC8kzv7
	 S01I05rYWg+GWOWKCcurR7wW2lIEsjMVFVelFxu8C6XEWUWdyy8aEX1nNxxPK38f5gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794136603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tqN8u8kP7ftmzydZ0UYjojp4J7UTI9IrPrNCjr6MjRw=;
	b=LhKKZnRrDNSiAyV7GEcdfUPemKpq4rYIs1mJ/MS7Bt66pYAOpGCKm6E1eLyXp6E+QPAG
	 kbSbCEpoS1/8tuvkWuDqdMl3gL7vQjoAWwApFfDvCh1WOcJTIgUOjO7nT6ml7gSly4oAe
	 dRYRI99vwR03dkb4DYJD0BfTZmupc0B/FcMa8GuUl7PF26oCoHSnv7JupiuEuOzvmmIrC
	 cclrVXPLxXam9JT+lfL0ag8Cjaj/+J5d3qQ4413IwRL8FjJ19zi8Vui4wydxr3NLSZYKN
	 Z+BY7VGlLAxLtG3Eq/jzLRpL8JEr+2apL3YKrD0Dj1R5OWNyFxdwhaniOK0nMCwoWuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=xTB8m2qD;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0254606A322
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 11:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0254606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=xTB8m2qD
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c49c32650adso5549766b.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 03:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794136601; x=1794741401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tqN8u8kP7ftmzydZ0UYjojp4J7UTI9IrPrNCjr6MjRw=;
        b=xTB8m2qDggbouqPnk5JU0G80s3Ng8xawBrDPvO4hW4/kym6JHh2ZC5S9F80Kcx3uYp
         2GQx5sZo9jimZqa909jaNiaWFCBtiKpRJwasdi37KCDc/15hCdPU/uXLCMvhN1YlQjv4
         pBNO8x4pFR8zlnKitX4OToGQxGCwvPGPE5fQN50bDFMbMjQfsPEsLeLiPhSI8E2TVS23
         SG+QTxgoFf6HfOBmZjzcv+KjaX4uuwtKSuqHo+2sq+eyWPd3u6mbUKLapD546OKJ1bXc
         qsbdaYP8YlsC+Jk+ofln7k95ujFKi6Kjr+0ELgxSlG2Aif0OnPh6PMKIh9MGWpRqJVUR
         YKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794136601; x=1794741401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tqN8u8kP7ftmzydZ0UYjojp4J7UTI9IrPrNCjr6MjRw=;
        b=z3ArRivQo4eRLGq9QAhXv8z9ZUFIV+JW7KXebHEyiUm6K+5Qh0cRu0aUjYEcn9jVg7
         ahFx38deiREVxfiqdjuQJkvAKrjjXf+pPbW8ymBncopjq/3i0cHu3Wa00agOUciWNRBE
         0gJxP0fDz1XPQ5js6wSpBOinxHVMTD/pdfrtDNLNUoXx3K5VVr7ige2vfxttSyMF8zB3
         D34JnzFKZ6x+OkcXtjnqdMLSdXAcOzTR3JintFv5tt6Ik6qXNpyuCu6hKlQzqyECVSBS
         B/Mhd99Sw2AtIq5KzNJvPKXZyFaosRxUPWPsIILECZfp6n6Ms9U85/nmrxICh7AZOdae
         44Kg==
X-Forwarded-Encrypted: i=1; AKwUvByIeTsYpxJjHBPbJw2O4+AdBPk6Z5Bjbi5RbJ/+uh9RXKJQkML2T0PWKr7I7/+Wj8S9DCEbdvJNu9r1RLM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W2Yz68wmoog9hU6oUctD+ZY3FsZJDcni3ZLwf7B9Gfdsp6BCF
	rzHQHVDKw/bhiEGklm/bIUQGl9chBmNvl9+UTbpRmeRA3E9X0rANr0XDJ03Igk1AWQ==
X-Gm-Gg: AYBFou1BajcrYI1x2v+lOkacEk/dTqDX5av+4tWGIP9o/PrYYjGHmfthpz5XKil5qAE
	P6E8G8p3LUG36dvriRImOsD7xd8TwVdW2jpe8/qfHkCQVSYnusPQt23+Ncg1Ywt6I1NxC5uIux3
	OTtm0xbQ3fXyzgM9rR+DzARqHLC+BgxGNwGrTslg7v14bLBJsbWB3IOJIbi8T4sY5yraopEktCi
	EdaIQoLiToYwiPRvvLHd/+ioQgOIHT4Yw37bzUnPey8lMzesD3e6uUbviqaPgimSSdQfU4YYYVQ
	bW/knjzVwfks0JXve028gYL4mFovS9bkMTyljA87wOmRX45yR8WIXx7ACWWhElC4/NXb3tO54hG
	abyD2YkBrO71nCznU9eG3cAaqanGiTiN4hAVMcqwpnzF5086O5cQjl+oCaKUrEctjQXFFbN1TzN
	osfYr1VcqSKcVnX/iq+nX0isLS7P5Vblk2GSocBIokh1G4lJYjy/NV92jEbaLn7Bzz42NyxTt9f
	tG6cTcNBX3UGCFftU4l6Bf3yudWWSEY6f6IamAXp72M2MDeI5RFLjAR7rSkyiZ3MYnjohM2sn5M
	sH4nuEC/gmnBmVllTl+CkvcWYfqPNF/YbHvQlDmK19lbBD3Cqu6Ub5W2RD6SMbUUlrG4+R8MXav
	PYexBuH2aMP5cWdDOIOt/2Cximq0kIdoXXjD9JeJXfmtgurckgAAJkr0Y6nNYySkt3ufBjaLNho
	UfV+DoqGDGpIlBzBtBRmkuEERL6k6Qy4WVqzPokN5n3Mmc2R9mz15i/rmGlBSUn0UY4HnceLIFx
	ltKXoSkgP5iDx6r4rXmnb6A65tUjOeW5GWsU1KcQ4+qnRNWP38HZYXzBq5qecsGXwrO1Q1+tok2
	4GpG2s0XxkHMUnrT/GqfaoFmBWfnQ5VzvI0eW5U=
X-Received: by 2002:a17:907:960a:b0:c3f:153a:8663 with SMTP id a640c23a62f3a-c4d6d4ec448mr99416466b.23.1794136600876;
        Sun, 08 Nov 2026 03:16:40 -0800 (PST)
Received: from Desktop (p54afff19.dip0.t-ipconnect.de. [84.175.255.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a99320bsm54261166b.67.2026.11.08.03.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:16:40 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org,
	bridge@lists.linux.dev,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/2] net: dsa: fix host fdb refcount when an entry roams
Date: Sun,  8 Nov 2026 12:16:37 +0100
Message-ID: <cover.1794134495.git.julius@bairaktaris.de>
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
on net-next and removes it in 5 of 5 with this series. The kernel log
of every boot has no lockdep, RCU or atomic sleep reports.

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

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (2):
  net: bridge: switchdev: add br_switchdev_fdb_find_port()
  net: dsa: fix host fdb refcount when a bridge fdb entry roams

 include/linux/if_bridge.h |  13 +++
 net/bridge/br_switchdev.c |  63 +++++++++--
 net/dsa/port.c            |  36 +++++--
 net/dsa/port.h            |   6 ++
 net/dsa/user.c            | 216 +++++++++++++++++++++++++++++++++++---
 net/dsa/user.h            |   8 ++
 6 files changed, 309 insertions(+), 33 deletions(-)


base-commit: fa5196392691051963726787944db872420dfa75
-- 
2.53.0

