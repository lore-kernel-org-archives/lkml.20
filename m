Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D421C3DAAAF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 22:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791585030; cv=none; b=lzZ2aT0u4BXEbH5L/oNnXEQl9H/A6MbVayTV09th9i3KfNMayM7/aOqCez0v96rv7rEXZJgKPgDkGB5eRGPEkpZeP4nIcSSK/u3WKm6+kXZJR9rX3D4TFcmtIkx6v38ojyGgv3wXtOtNW5brsN1bWyiTc352bRly8rDaWFW94TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791585030; c=relaxed/simple;
	bh=WfFHfFYokkPeJf+HzqG7nznoZOAqYkqtJ9P+2TeW7I8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q137Aekmngp6A4ZJXiHvGKeQiQdnEZ+jCNus+d+XMuk+ppHfgr/TvRvVW9QJdJD5HqQdEHfDQaNPFUZ/qgWQARIieBtgW4HOcxi4bYaiW4mmBEbsi70Qli25UltLjftFJMvGvuXxEK5AJi61UjD+GzjYJZ2tyN9wk+b+sroxVqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aF/8Zto2; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aF/8Zto2"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-88c72646f03so75206b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 15:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791585027; x=1792189827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AdUD3bR52lZyeHl5yLgNlcni+itA1UGw8wbwa05XB4w=;
        b=aF/8Zto2vsttKxcG7OTsFmHOILbxEVDMOrYUJZTBWumBdO7YHvg8WdY0ZNLfWJ8Iyb
         xb//wJsd8xz1Q0XHoTPPWXRKi10RuEXq71tcoWr1rq7/DoPDceOrsvOCgVTUkxKcRRis
         4HyjMGoYe/F+ohBHqFLVvhnq++jPpvRTQG4eO5VW+48GcrkFwJIw6fxmJhFnxrSIqQG0
         5z5x9XBQXZumZvFyhvVDlPejLXj6mJP2zvIP6lP7PUJQTjIhpUi5gF+UzASxzwJNc1jH
         n5uLLqn3l47eBbkQfG3eoQtnmqpQZBjeyXSn6vEWwI4mqvkRqMFthFr1ZVf8pT9AJiXT
         nRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791585027; x=1792189827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AdUD3bR52lZyeHl5yLgNlcni+itA1UGw8wbwa05XB4w=;
        b=NveRMcRlgk0a66Gy0fZiCIrrT3rXd/2DYt5P4ZsmQthHaSygbOV51nh1odcMwaEAX2
         cL7NLehmfoH+BD+ROHH+qdICS0+Xum2E8SDm03BuO97skqZ2ChMfk3xn7PvNlMhieUbT
         U7sCb/hjHW+++C+o8BKhxu8CMPy1WCjJn5kna+lWQsbMg1KcV8Wexh7hBjZz0Ysfm91a
         AO3/pM2l8Mi59xC4p/ZRvdr1ikLJvGlB+tZHtQnN2wl4/c48kbyubxnb1yn55F986hCZ
         dsm2WFIAl+FrMBdzva4SHpMRemdaxTfgYaIKTGBMQzKI93oNnrEM+tiEhNEv5wmhvxzE
         9f5A==
X-Forwarded-Encrypted: i=1; AKwUvByWlfMkMT7mzqw3I4xXI4dOeloQBpJ4WMUtbSCsUcnMgYNOEr+fCmBNEgIroiFvsn/yesgK+pqWBdT25eY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKK0jxHK9Ytbk5giStbGd9o1DHcQuiZstJt3vsvUjSQXs6pNTzS
	yIeP+cf471GW7xSX9326aSDUCHLHuhvcS+CAFcKX1zQki+jZWc85iwc8
X-Gm-Gg: AYBFou32nSTjhtlced43XE9Hphz10pm0kdvUIFa4NQw7riMrNxK6C9/GPrjqkRxq41L
	7jHDlbQPbGDO5cNSNrNwkK/a/9k2k2KuYYewJ6RXFR/Q4ISrIJAtiAbQCzFWvWiAdL3VFdQCQU/
	YYNcNdxLOVHIOxMrU8Ex59YHISOfZK1MQotkChP5XUhPUxFXWTNii3Ea+YnBGe5GMkKCjjc7m0I
	++gx63bukgPBn1Tme2cZJXPJmz8NtyTWY5ZLQ+DMyDF6BYm5LZV9NXn353ZRbIrNRfDpgV4tI66
	oxh/o07C1VwNPrtVONWvQGEYoLAC30aky9lMLH/LSz8beHO6GRGp6T6tXeRsRM6TfQhNuAFnr05
	oH06qC5a2+th08Lifs/hWNd3XzfKvXC7C7m4LN11sYiS2p6S+DIdmKfT6kf8UKmsXRQkCEwGZID
	8TzQBKv+Mj0aMaS+QMDb6X2T92OkfYaop+S55c7zUjo0s3bCqjj5MU3fkWKAdjectL45yeimWiD
	zRsuuMYViPdByhtiSLHa+BQ2AcJjvfLLQqpJ/2T/6qBr+KhQwA82NeNoX2YgkmcycfGRQjjyeR1
	eJGFy4z5vgw7kKyhRazUavsNgX4nEBdeUOMOcsa8LYX1XE6t
X-Received: by 2002:a17:90b:5109:b0:3a8:80f4:98a7 with SMTP id 98e67ed59e1d1-3ab3a79df4dmr2984498a91.24.1791585026881;
        Fri, 09 Oct 2026 15:30:26 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm5472645a91.0.2026.10.09.15.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 15:30:26 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Chris Snook <chris.snook@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next v2] net: ag71xx: align the IP header behind DSA tags
Date: Fri,  9 Oct 2026 15:30:24 -0700
Message-ID: <20261009223024.545607-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The receive buffer offset includes NET_IP_ALIGN to get the IP header
aligned behind a 14 byte Ethernet header. Most ag71xx devices use DSA
switches whose tag sits in front of the EtherType, which moves the IP
header by another 2 bytes. Every access to the IP and TCP headers then
traps and gets emulated by the unaligned access handler, around 6 times
per forwarded frame.

Take the headroom needed by the DSA tagger into account when choosing
the offset.

TP-Link Archer C7 v2 (qca8k), median of 3 runs, Mbit/s:

                       before   after
  routed up               743     855
  routed down             660     749
  local receive           554     572

The unaligned instruction counter no longer moves while forwarding.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 v2: rebase and ass Reviewed-by.
 drivers/net/ethernet/atheros/ag71xx.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/atheros/ag71xx.c b/drivers/net/ethernet/atheros/ag71xx.c
index 4e4794c4dfdc..ff30ebce448d 100644
--- a/drivers/net/ethernet/atheros/ag71xx.c
+++ b/drivers/net/ethernet/atheros/ag71xx.c
@@ -38,6 +38,7 @@
 #include <linux/reset.h>
 #include <linux/clk.h>
 #include <linux/io.h>
+#include <net/dsa.h>
 #include <net/selftests.h>
 
 /* For our NAPI weight bigger does *NOT* mean better - it means more
@@ -1401,6 +1402,24 @@ static void ag71xx_hw_disable(struct ag71xx *ag)
 	ag71xx_rings_cleanup(ag);
 }
 
+static unsigned int ag71xx_rx_offset(struct ag71xx *ag)
+{
+	unsigned int align = NET_IP_ALIGN;
+
+	if (ag71xx_is(ag, AR7100) || ag71xx_is(ag, AR9130))
+		return NET_SKB_PAD;
+
+#if IS_ENABLED(CONFIG_NET_DSA)
+	/* A tag inserted in front of the EtherType shifts the IP header,
+	 * compensate for it to avoid unaligned accesses in the stack.
+	 */
+	if (netdev_uses_dsa(ag->ndev))
+		align = (align - ag->ndev->dsa_ptr->tag_ops->needed_headroom) & 3;
+#endif
+
+	return NET_SKB_PAD + align;
+}
+
 static int ag71xx_open(struct net_device *ndev)
 {
 	struct ag71xx *ag = netdev_priv(ndev);
@@ -1415,6 +1434,7 @@ static int ag71xx_open(struct net_device *ndev)
 	}
 
 	max_frame_len = ag71xx_max_frame_len(ndev->mtu);
+	ag->rx_buf_offset = ag71xx_rx_offset(ag);
 	ag->rx_buf_size =
 		SKB_DATA_ALIGN(max_frame_len + NET_SKB_PAD + NET_IP_ALIGN);
 
@@ -1879,10 +1899,6 @@ static int ag71xx_probe(struct platform_device *pdev)
 	ndev->min_mtu = 68;
 	ndev->max_mtu = dcfg->max_frame_len - ag71xx_max_frame_len(0);
 
-	ag->rx_buf_offset = NET_SKB_PAD;
-	if (!ag71xx_is(ag, AR7100) && !ag71xx_is(ag, AR9130))
-		ag->rx_buf_offset += NET_IP_ALIGN;
-
 	if (ag71xx_is(ag, AR7100)) {
 		ag->tx_ring.desc_split = AG71XX_TX_RING_SPLIT;
 		tx_size *= AG71XX_TX_RING_DS_PER_PKT;
-- 
2.56.0

