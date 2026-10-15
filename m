Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478FA3438A1
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102014; cv=none; b=pMQfPo5os5A7NdUNL0wU9EaznosgeFTqlaA06CKQl1TOjTjQooBwCdQkWhSk4I7LFGes2h/mrru8WwWEkLdqSVBAQfy7tRgr1f4X3/E2Xi2nVqRlI/dXhRRp20JBCpEu+JYL6yszeuyU5Bbvqm5vwUoejisgRCKvNIE7TXBflwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102014; c=relaxed/simple;
	bh=qQRNTwC1sH59jj2rLO5uPdIkI0r2Rw9NSK6n3QX0Zxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rrsPsjiXNkh5GEjReY2NGZa9a4AYSLIHo6a+hSbeKV0L6IaD3Wx9EP9qTSieGvTGVvXeFudxm8B5cuFs6uqWJuqW0u8NsMeUBs2VVAYAw07LqWrVAzRC/wpn5rbPyNGLzbLG9iGm17C6DGw+1Y6BKyE8HZ5BsiC/dJjjNK9JnT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=Q32kCPD4; arc=none smtp.client-ip=74.125.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="Q32kCPD4"
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-3537f63c9e6so1283211eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1792102012; x=1792706812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TNgp/c86/ZKLgnujG+HEseMTgr1ylCvyZ0rmiKzxDa4=;
        b=Q32kCPD42OVoexI8oeKnQGYGw6KgPgGYu3CuOY/X8TToHErZth0mVIdd1fPB6skHGJ
         ExmaUZ7csVqYcbeHKRibyAZCYkGkxtm1RH/QF8kA5/YGKeZxBqFoxJIvSmRcvjmskSum
         O/q4cfxXRRDJknrR5Bpl7FStyFCT+nOmoAbQr1CcozeT2wk3orOHqaphx31YJ/fOUumb
         dBv5yIpryV+VxhgjF3ApMBStUuRkx7+qaOkVHevsluhFu8yf308GJRW89tv5ImCMVlh0
         JQ7qzkyF0nMMzzJYsYbqou+8trZVzJeE2+1XbHaZLXTZeFbqrL1Hl4EtXw7YYL1IfeB9
         2Q7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792102012; x=1792706812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNgp/c86/ZKLgnujG+HEseMTgr1ylCvyZ0rmiKzxDa4=;
        b=qKrPyeaI4rcEBlMZChauEmsmOfwfmpM/+iEQOSJmUGYx4aA58lCbGrs2iLEBQKKc3t
         xe3ZPn20d0aXxQGUkZOirZkbxk8RE0A2FHPu7OATEZ9QIgYrNq+7fToLjaTYBH5RIEKh
         REx2ClgCUNF9MUjEpV4XbSnCWzBwz/34JVSYJ98jYaGoNZPZ/1HY/y7Q++k3vnn42ZMI
         We5pP8VYJjNTljBL08Sy6iNaknBWUM3DCoXAZ2oIvl+nhpy4LOL7MdWdrpYcJQFqpZWw
         m2ZRQ8GHg7Kw/ThfZYpE5kp/0MiAYqJhZ/MP3f51k6q+JdZ1KiqTC864DSFCu2/CaWrV
         Wlzg==
X-Forwarded-Encrypted: i=1; AKwUvBzcMY2bWQcam0DJFEfwxxW+Sj0Ncvux/uxAZEQHQmAlSwU9b/m00PLVVRb8EnIb84wT0w+JezXowMyi0Ms=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsJh53oHIe1CGXK4az95/xJ7PjsHm+zhVC/PbfT95NVQcLGD2L
	27XIN+5nflkI0Ek3ZlMNHXyYnMcDqTHwOlCL3XUp4mUHc3N3pXVYWFLOPENSvcdVI1g=
X-Gm-Gg: AYBFou0MC6rsJIlRkzOyYu8oyhojIJ5KPiKVIFJM8RbB5H21kU0JVaSec0cHxXSK4eT
	i5ohzfukLOUahyRZNu3tyo6InMlAtyCKj410zP0MaiWsOfZZXUVwEge6qBV5trDV5N4SA1BVOoS
	lOeBKKZVe8ovlkwOa0bjK4y0CD1eTI3DGvFEnQSP8MUmanvfHxiCXscu05KqSgUKgR/jDadm6X3
	jEm1ovu1TJ/Dl99eAQbaxjNEksk8frs4oHYdL26ynVYBiROPLoLScG0eF55KCMubMwLtckEQEJG
	SEcAm5Szl/kC2tZEUjBzge78jxMaJJ5KTqZ8h1FLvwU1VmVaV4lyHOEMpoXyPN343hmzUYzR6HD
	ACYRkq4EeNdyXG8f8jBDvMEqDXmw5edJpCdIVjvo1e4DKU7kcqIY5M2X2dBIPn762TC4eENlzAx
	pxnZGqlLb6rMZae+dtogAihKWUfP41CPDUIz3lWBN3Gc4wdEVpr8urbenIPBPM0uK6zYY08XXdf
	JEL0Ga0T4RDAu7cjj6Ny67k74t0YhSn4oADTw2J
X-Received: by 2002:a05:7300:881a:b0:351:29c8:643 with SMTP id 5a478bee46e88-3537dfb8649mr33208157eec.18.1792102012004;
        Thu, 15 Oct 2026 15:06:52 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm1016445eec.3.2026.10.15.15.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 15:06:50 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net v4 0/5] amt: relay tunnel lifetime, validation and request-path hardening
Date: Thu, 15 Oct 2026 22:06:43 +0000
Message-ID: <20261015220648.1545576-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series hardens AMT relay tunnel lifetime, validates gateway input, and
keeps unauthenticated Requests from consuming relay state. The fixes were
found while reviewing the AMT IPv6 outer transport work; that work is not
included here.

The first patch closes the gc_wq re-arm use-after-free and makes device-stop
teardown safe for RCU readers and concurrent delayed work. The second rejects
Queries and Data from 0.0.0.0 before relay discovery. The third requires
exactly four bytes for IPv4 netlink address attributes. The fourth makes
pre-Query drops visible, avoids counting successful reports as drops, and uses
concurrent-safe TX statistics. The fifth keeps Requests stateless, authenticates
Membership Updates before allocation, keys state by address and port, bounds
per-source admission, and closes group-worker and post-stop teardown races.

v4 changes:
- Add dead-state checks and RCU protection for group and source timer workers;
  retain exactly-once device-reference release on group timer exits.
- Revalidate deferred gateway Queries against the current relay address.
- Use DEV_STATS_INC() for all AMT TX error and drop counters.
- Fold endpoint keying into authenticated allocation and keep four secret
  generations, with silent refusal at global or per-source limits.
- Document the Request-only timer lifetime in the intermediate patch and wrap
  the new comments for the netdev linter.

Validation: GCC W=1 object builds with IPv6 enabled and disabled, Clang W=1
object build, and a KASAN + lockdep + PROVE_RCU AMT selftest soak. The KASAN
guest passed discovery, IPv4/IPv6 forwarding, query egress, and completed the
IPv4 torture run; the IPv6 torture run was still active when the session was
interrupted.

v3: https://lore.kernel.org/netdev/20261012125943.558629-1-omar@blockcast.net/
v2: https://lore.kernel.org/netdev/20261009201455.1904698-1-omar@blockcast.net/
v1: https://lore.kernel.org/netdev/20261008003606.3666617-1-omar@blockcast.net/

Assisted-by: LLM

Omar Ramadan (5):
  amt: fix use-after-free when a Membership Update re-arms a freed
    tunnel
  amt: reject a gateway Query or Data from 0.0.0.0 before a relay is
    learned
  amt: require an exact IPv4-sized IFLA_AMT_{LOCAL,DISCOVERY}_IP
  amt: make pre-query report drops visible
  amt: harden relay authentication and teardown

 drivers/net/amt.c | 477 ++++++++++++++++++++++++++++++++++------------
 include/net/amt.h |  28 ++-
 2 files changed, 376 insertions(+), 129 deletions(-)

-- 
2.43.0

