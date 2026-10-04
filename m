Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBA9470436
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 17:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791134202; cv=none; b=tJNMfqi4gx9EZ4uELw6BRkTHNqL6CYg8KFYPQnLlQ1i6QDw/NLnFmO+a4s+TUHJqeECgW8vutRyY8qXEw/5HLn77JY2CIlM47aPo+CQWGUsYTgGUY0SB5gr63IiE8Nlk2ulibeYsWUjmlTfBJ7a1CGVI9B4tdo8gfL5EL0abm2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791134202; c=relaxed/simple;
	bh=bmE6DJq5mQYt8ACvF1ZIyWP9iLVRBzWtezcMwXt3IsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EgFhWaV/2kh8waet7L2pKJhlBPB8oGWIusbmjXM5wWuZ8m2WjXWh9L7IFNbOc/6i+PCFHdZO9Bpx+eTT1Q54otmeSwffagjsDstzrhmixz95Shg00I8P54BBEo/xQ0GrZ7xjYfonNpMSdx84FF6dK2hU/JmRJjwAGkwsi7TX1jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=zxAXwcy0; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="zxAXwcy0"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so1277772a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 10:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791134199; x=1791738999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TlaQzqtT4L/X0UVb7t9+uS9vqwfYnLXqmrlooszQDxo=;
        b=zxAXwcy08QW2QkJf7VIp31UHdQhVL68lgB0JEDGWR8QA7h8+7jE3REcLYMDKnYl6Q+
         RAutXssSpHHCf9kvoNGCMCvnGfeX4WsvnrLV/anvM1CSC5Qc9CVP+2208Also9XwOdr1
         tHFWcKmmNenZE+Owe3aFaSC6WFqdlZDRo3E5gCH3kxbsu5bEJ7qsrLCPML6IvXUvNi41
         mZMpcX595P5a2+Fg0bv6qEiNhmXK4TxfqlYdg4lI4epAgMOZ6Y80KzuNAVUFvLkrlbbz
         nIzZmJQQFaokpafRbamYcVTwNJA/CFHVjQTyl6HA9zLYAL2VVQnWXHMvlHDy0NDXDiz1
         +KTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134199; x=1791738999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TlaQzqtT4L/X0UVb7t9+uS9vqwfYnLXqmrlooszQDxo=;
        b=zkdqO14xyfd7f4E3ZqHMRfGiEMvcWMb7+pTcR9xRU+5ZSAhwF/WqKMmiSTOKjreLoC
         1TpsITYgxmBetqmqZXTVoYVt9mRd47yu6KhO6ocFLZ7UseIyzo4FSTPYXJeGv51bYX1J
         UOxoY+INouV8L8o0X5mNk61nJvwWfLvJrAUaJ3pVCJYpB3LChU5gxSq1tRTELtv8GsA0
         Lh060/n4g4PWLUIF43D+CCrF5m8sNZSW6ELY/Hi92/Ut92HE9RYT9FNpaeqzoS17YsoN
         oeGcGD3T4mB+OOLquccg0YIadi4nCXpkT1qqgxEXgX3hwhzedyd2QqBgplZyuRckgErm
         yLkg==
X-Forwarded-Encrypted: i=1; AKwUvBwDUwY03k8C4kZ4J4q4HMJrHl6P+fD7ZaMTYHMKlMcNuAPFSZ04WYGhgN9hClLksvIMZWY1nBqa138AM5c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYvuFdLbnv4T+h9sqVlZQKiCqdYRMz59Yinu/9kqi2AADoiLBE
	I8tvSpvtX8NTWg83gZ5V0+7IREPjOykJYIvtD4uxgj2ZJGn7hwNasTBtOhUGBzDZDQ==
X-Gm-Gg: AYBFou2C28daLEv6tTRhnmbhm2R7aci88E0mnNxstDdvycEX1ViLrJmJKpS3jmQeK8g
	hOAdRp/gHWmHm56mlSO7svF5vXgzhiSl3ASyTp0KL7mGjfNWxR0mlXQgl2ONXVNzMmStQ97W2Lx
	L/eqbtYhwA9IrlWQWWCXbTB7eRtplsk+UskFMAHZESMRl0XZn3IJ5GZC+GO3PMNWuyjDHaxJnH1
	8Wk/nkNOis96aoRT4VCwiHOg/tv47KVkQG76+Z4/Jbd5+aAtIy4bsgfAqOF6dNcIwfV23HsrP5P
	ONdBO+592ZXCbhvAOmkK6U44bwvgcAUPyYOR2T11x3VxEeuN5yKRoqqrdSLH9BxmZ/hKIVxRkIA
	xYfo+Nzq0Cex8Qi29Hrur36M+UEwlMbSJb/a9ndWgpRAkTH8M61DcEZzty7kVYZTksIDmX01Eio
	ACFABo36kirvGqsf3gL8eeJm9O035ylzNzGleybRCxHw0kqi8e6aDqykG5oISWARyaI5aTagE90
	U5cSHgAvZ7KkCSpaQp+dXVPJ1x/n0P6zLcODHdj+lIqdbCpD4Lk7SIrkcp9iEH7LszHqjR8gp69
	jukRsgBm9uYQ7cdA8CQ5bRd2O9+x7UeN6m3P/s+yVRzyStTD7lwt7WiE+jNBtH7M9UBnYw8a9+v
	2Xa2FuXBsP+w8HcPuA9DQis8x1QMQp4YlY3zsH5mFenGdhNVpLCiPhZWVcNs6KM1ZkB8LRXLrlC
	Jusk55shmnT0RZgPztGjDcPAM=
X-Received: by 2002:a05:6402:2709:b0:6af:a64f:bd44 with SMTP id 4fb4d7f45d1cf-6afada35853mr4633290a12.45.1791134198617;
        Sun, 04 Oct 2026 10:16:38 -0700 (PDT)
Received: from Desktop (pd9513667.dip0.t-ipconnect.de. [217.81.54.103])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb014784bsm2256819a12.3.2026.10.04.10.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:16:37 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org,
	fw@strlen.de
Cc: phil@nwl.cc,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf-next v3 0/3] netfilter: flowtable: carry a priority into the offload
Date: Sun,  4 Oct 2026 19:16:33 +0200
Message-ID: <20261004171636.3545085-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Packets forwarded by the flowtable skip the ruleset, so a priority set
with "meta priority set" before "flow add" is lost after the first
packets. Patch 2 stores skb->priority in the flow, applies it in the
software fast path and passes it to drivers as FLOW_ACTION_PRIORITY.
Patch 1 makes mlx5 ignore that action on flowtable flows, so flows it
offloads today stay offloaded. Patch 3 adds a selftest.

v2 review asked whether this should be a flowtable attribute instead.
A per-flow priority covers both one class per flowtable and a class
chosen per connection, with existing syntax:

  meta priority set 1:3 flow add @ft
  udp dport 5060 meta priority set 1:3 flow add @ft

An attribute needs one flowtable per class. nft rejects a device in
two flowtables of the same table with -EEXIST, so it also needs one
table per class. Pablo, is the per-flow approach fine with you?

mlx5 maintainers: patch 1 is needed before patch 2 and is meant to go
through nf-next; an Acked-by would allow that.

The selftest passes with the series, and its priority checks fail with
only patch 3 applied (QEMU, three runs). The mlx5, airoha and mtk
changes are compile-tested only; Lorenzo, a Tested-by on airoha would
be welcome. struct flow_offload grows by 8 bytes.

Changes in v3:
- new patch 1 for mlx5
- airoha uses the priority for its QoS queue (Lorenzo Bianconi)
- describe the tc flower effect and the TOS-derived priority
- rebased onto nf-next

v2: https://lore.kernel.org/netfilter-devel/20260902155136.4963-1-julius@bairaktaris.de/
v1: https://lore.kernel.org/netfilter-devel/20260901092632.369248-1-julius@bairaktaris.de/

Julius Bairaktaris (3):
  net/mlx5e: Ignore FLOW_ACTION_PRIORITY on flowtable offload
  netfilter: flowtable: carry a priority into the offload
  selftests: netfilter: nft_flowtable.sh: check the priority a flow
    carries

 Documentation/networking/nf_flowtable.rst     |   4 +-
 drivers/net/ethernet/airoha/airoha_ppe.c      |   3 +
 .../net/ethernet/mediatek/mtk_ppe_offload.c   |   1 +
 .../net/ethernet/mellanox/mlx5/core/Makefile  |   2 +-
 .../mellanox/mlx5/core/en/tc/act/act.c        |   1 +
 .../mellanox/mlx5/core/en/tc/act/act.h        |   1 +
 .../mellanox/mlx5/core/en/tc/act/prio.c       |  22 ++++
 include/net/netfilter/nf_flow_table.h         |   1 +
 net/netfilter/nf_flow_table_ip.c              |   6 +
 net/netfilter/nf_flow_table_offload.c         |  11 ++
 net/netfilter/nft_flow_offload.c              |   2 +
 .../selftests/net/netfilter/nft_flowtable.sh  | 110 ++++++++++++++++++
 12 files changed, 162 insertions(+), 2 deletions(-)
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/prio.c


base-commit: 87b80c2f6b05cad9f0ff9136709c62a0f59923e3
-- 
2.53.0

