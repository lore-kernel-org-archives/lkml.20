Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792565879;
	b=SEW8VloXv4hZT/pQtbsMMrA8Vg8MJjFlF//NvmUaDbc3C3n0PON1yVg5OhAz0nYifG/y
	 d+nOjH/OgdFTg0nOGWxX7lkebOKvoFHJRb1nOiQS96wZrDSavK6VvkzgcbebVHs2EL6Lq
	 x8TxnDrk/knNnaWyINHjITbjzPUpEy4dpWG/IxCGGaH+6waMKEIeSKcnhYzPDZQeBY0C8
	 IjkVT2lLVGN7umG0862k5MeEIlMFgwnAsZQ3jlt/nhQhkJk2xwuA0uvNjwIkIWfrF93W/
	 oYyfYkNx1HA21pfEkBWCCvxAjjiEaM6YmOh4cVqVprw3neO+8xH70xLtaXjI5MQE13w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e2nqfpyXfJR53yAw3YRwGK6gvdGsh0en4mbKV0oOf+o=;
	b=nANpvm6oSXbLkgvxC89DGXwrlC19JFwQiijh+SQO27GAf49wZv5xIFdhvbZPHNKHZh2Q
	 ZPYMoCFHSqHsbp7t5Q/SSInS/1zxKlY5JrMA03oNh176oseBDiLTnwdK1z+qLEubANQsm
	 jSEs/czhLfsw9ACKbwKno/gMXCQ7tc5VNEUfpQSbii9i8yp9GxnKDY5SVFqwK6UF34mSX
	 iam/iPLNEmivL/Xs0QuJP3bKy1WM62CGHT9YIaDtgvbrr67bogNT21wk6ZGEOvf+FQo8M
	 DklSK7WuGPEutQVgnWAwB0OZBsKwFTkWYebrakIgajNiFSozCg+rUQJ3kVbNK8d3oVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V18Ap8EZ;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF33C606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF33C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V18Ap8EZ
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36681e85e87so768205eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792565878; x=1793170678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e2nqfpyXfJR53yAw3YRwGK6gvdGsh0en4mbKV0oOf+o=;
        b=V18Ap8EZvxLEHfDo9rRyXAXLgI/iH4CAqIguoR9KG2hQNicwlE4xG14qmtAIOOrJk1
         nhSmhm7VcmYVAXA8a330g8j6qsK3LIgKqkDd/dZ++6ag4s0hw9OKffWNGjz4D/S/ng1M
         pZ3GHFmyCeBQIJD0aJNFAjjRHc3yFljclDz5XfmXlNntj+Q/2LuhYZtvUds4PX6oBlMt
         OB8zlbU/bhjemznFVa6bT6zCkQTm2qvR6iM74efiMd/JGOqipHbA6UQRjjEOPE0APH3H
         LDtRsY1Ij8rLIeo1mDqsvSh48LyWi6VU372ar92W3xPh2+1IqgW8BT1drdSDAEKLrX58
         g6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792565878; x=1793170678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e2nqfpyXfJR53yAw3YRwGK6gvdGsh0en4mbKV0oOf+o=;
        b=A6RbbNe3GCLHRsdYcelAI2E32D4v/kS6BGi4HUw07mRBSDGEus6CI+4KbE5nQkSKtI
         GY9dncTx9eJYZj4BLuoS8c3O7SrDfjRurjqesVgrqkmufaKPg+hO/XJ4HTsdZz1KlWkg
         8Ibo42G1ZPnABcQayjz8aUDXbAU1OL7P+XQ07cUMcr9psdUTyGW4yKUZciia0/1LQ/n5
         I/39qZQV7YjptRZMtfvcuSKwm1AdsyCTHuX0HR1y47xRAcmN6Hl8qmYM+OuTOoH3S9Q5
         15q9iBEjZ4JCZEXCbO65EgOIZzVFf7USGYXUnBgapfC7CBuY8Fosna8yD1x2YTsqQJYi
         rdqA==
X-Forwarded-Encrypted: i=1; AKwUvBxC3bXj18xPu6RrbBqHj26lcsSroLpgH8n2gx6yFr+hSv+pBQmDwmOFDByTxu/js/aqh1czApwTNaJcxVc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjZndKQlo+LPV3OcG/NAigKmddQo5en0xfbEvIYRvzQGtibogG
	vXRTIM4oYDmJmFVHktFpQYGdq4gEkvoNjBcmcxopNljr1nuaMue6mNT3snUDwg==
X-Gm-Gg: AYBFou39hHRNMw+agfP3bOEnB2/PYALWqdOQczKWQpjfKQobXlL3nneB7xR2pzZzCyA
	jtsoScWVd0GkX4/szWd6GsaKfcrqUr05OQQrXQpSjMemV6x/9BcwkJ1w28UHcpbukoB3ez5ynJI
	TLieuZvo13L0mQ/b2w6JtSkx3DWGFE04LMLVlvaJ1Y9e/12+sFqsrNUGbATdnYFsRQVFdUbft/5
	SRh3ZHw1LxuVVDvarJ4r6cAuAeKD19/YtX4YEn8pRNT2eINxY9yUDBe8MN7N14jTxxhYYjxQLZx
	XN+4jMx3O3hmNLyBIr12vcEXkDdaQ6lkKPPOHCzvUc8dlqYOQIQEsQhdIrnupow9eHcvAs2WtTy
	WXUnAyMtCWhZq2Wl39M5yvJAhwgiltxK7gBIdWEZk9RSf/1kKVSfvXc9wR3C6wvu0W8T9L5RAfO
	UgKIMtMPWorRI3u/oyz5dVPt87pfhZm9FGllzusc8Y4jm9L9r0HzxVtiVXDxyRO11siPvDeRxx5
	ozdmfrC8D3oZg7Pfz+L5MLp2FJXV5u7AutvGDjw+LWebJWO7zYm4sWQrGF+rJKlTWEJ3hH/VVgK
	NgX5qz8HiwMB6nymSgSOT1cdBBueUAGmhTCrE/P4So3qu3IULm1WuZ8TbNiWYsTYhdUQpH5nRlY
	YoxsIJA9oqoTwQD/IsO5XKM58
X-Received: by 2002:a05:693c:60dc:b0:362:fa87:2aa6 with SMTP id 5a478bee46e88-367487699e9mr2317177eec.0.1792565877638;
        Tue, 20 Oct 2026 23:57:57 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411b4145sm5165118eec.15.2026.10.20.23.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:57:57 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net] gtp: Require 'CAP_NET_ADMIN' when joining the gtp multicast group
Date: Wed, 21 Oct 2026 06:57:50 +0000
Message-Id: <20261021065750.2069795-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
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

The gtp generic netlink family sends notifications on its "gtp"
multicast group when a PDP context is added or deleted, and for GTP-U
echo responses. They carry the same attributes as a GETPDP reply: the
MS and peer addresses, and the TEIDs, or the TID and the flow label.

GETPDP requires CAP_NET_ADMIN, but generic netlink lets any user join a
multicast group by default, so an unprivileged user in the network
namespace of the gtp device can read all of this.

Fix by marking the group with GENL_MCAST_CAP_NET_ADMIN, like the psample
"packets" group. Only users with CAP_NET_ADMIN in the user namespace
owning the network namespace can then join it.

Tested by joining the group as root, as root without CAP_NET_ADMIN, and
as an unprivileged user:

Before:
  root: joined
  root without CAP_NET_ADMIN: joined
  nobody: joined

After:
  root: joined
  root without CAP_NET_ADMIN: EPERM
  nobody: EPERM

Fixes: 50aba46c234e ("gtp: add notification mechanism")
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 drivers/net/gtp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/gtp.c b/drivers/net/gtp.c
index 69fe5717846b..e5ff1621ed62 100644
--- a/drivers/net/gtp.c
+++ b/drivers/net/gtp.c
@@ -118,7 +118,8 @@ enum gtp_multicast_groups {
 };
 
 static const struct genl_multicast_group gtp_genl_mcgrps[] = {
-	[GTP_GENL_MCGRP] = { .name = GTP_GENL_MCGRP_NAME },
+	[GTP_GENL_MCGRP] = { .name = GTP_GENL_MCGRP_NAME,
+			     .flags = GENL_MCAST_CAP_NET_ADMIN, },
 };
 
 static void pdp_context_delete(struct pdp_ctx *pctx);
-- 
2.25.1

