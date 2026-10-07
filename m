Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E823BBFC4
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791395095; cv=none; b=IdTx3Y+2FcFaKIcNTqPYI2SlVEakmCJUCE+rizz4Xj0CjHAE4mzFe2cYL97bCVwEiTH+/DWHDvGSzPLpw6ZQsHHrgGCjEd724gWusqbSBWG26mBajOAgAPk5+LB+RYJk0GtyCEKsxVPDGhsZqH/DbxNX79gNwvxk+BJwlpzKsEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791395095; c=relaxed/simple;
	bh=pc5Ae4XMXNmBx9H8gciWl+eQULBxlouB7GIIhqnjQaA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UnmWZfpY7i4OTUFRbi6ZYtAB3pddrfcxor3oT4lEvze5EiY36yHFvbi9yo2BBSORVUeT1fzxlGQYRubdZ1wLBcawLnuwxDRxEYXgYSZD2CMbqtFVIC/kfsl3ZuzfoabH5ggiwWJ7cUD1JH8EMe31zNPe2bydhxM94VNv05+ecqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S513z8oi; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S513z8oi"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-868b3248b2cso1586689b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791395091; x=1791999891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=COSK+hA3alzfROvx4Il2tMQOlgkjSw8oub0vSseZINs=;
        b=S513z8oiF2o5pcmDawwYyCx3FxgWVvHO4Ffb1cIZW9gWIvlfD+vxz3gb0Qz0pt8Oqz
         tzBle3cSABOg8LWyvVkDSXuhHG3p1WNq5mvk3u6Pen9b8LY6aecY1IwR3xWcE2NBZyqF
         Fhl+knrfqqvB8tR5GXCFterV7T4NDrE0KotpXs/LmZoppJkCWZOux8Q2PXrfhKOY83CJ
         YPHfSbvTsq0yi+I19ST9sryTQy7Efgdqxgatl1456ndtTLsb5Z2i0KTUsF3KBNQ07Int
         UlFjQEgvfBwC4/27TIn6HXfqCIdg9yUtkNrZyaJJOfntSBy5eZ1c5/eApDlsWlL5J1Hu
         gk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791395091; x=1791999891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=COSK+hA3alzfROvx4Il2tMQOlgkjSw8oub0vSseZINs=;
        b=BexR9N0y60tLCz8+igRPnZs5xJ+6H/0fZ0UYm3LMGqZIZXFAm5+dSYr0ssd7fYgYAM
         BVxlPkuaoq8bOE1uzRnUm0AJBp2KDsumfKUV414ILx16h9pL3NTHr2zL7vWuH+KQKy2m
         gSlR1f7C1btCxP3U7hUit1ZOOuGBUdPHJ3z+Qr0PA8BgaB0mgZP2nLwg9VN9xWfSXojP
         /Bdij6tZOYbikiyMdITx6srEjD9qXUG1bmLdMkSXTdMbdRqHmRzXeEOvYNbeWN+gVU5F
         jr/i678sYMZKtU3QENVo1MD38kwK8TBDQdogZU7TB1NK4s5RCLQUA+cyy83IwStBPFZe
         1T6w==
X-Forwarded-Encrypted: i=1; AKwUvBw1IXk9+WKtZqDQYZyneT4m69BOG9veom6PH+ACoMwnyKL67fvGNxaeDgI0fmvwlKWFf3GYPRH9hHYoqwE=@vger.kernel.org
X-Gm-Message-State: AFuF++lDB6I/CRm08Qu+1GoUO98ErLeHfXrNpkY8sP4inaVe1cztv2su
	G80pl2Ev2OQQk5czS7w34dLoVGAwxsYrN0pXvaCkBcPksAyy8aPLzCbXwJprbtcg
X-Gm-Gg: AYBFou1cISKHJHORf7OVbnlOvZ8Ls8R6jg0QE8AEeLfHv2E8SB7fYfTd9wslB+0rozF
	bIrR+HYn7dw55+dwuD4Bd1gkUz+YIvd0iOO3doR4y2fPnxcsdok+puqtcv1uUkKx3qGPmFptUhE
	O9MmPEzuSkIJhPNtbMbcSq3SEYE4nA6qdTJGzObco140EeXPbDU3k47V78wXwxeJ5YnzLQ0h8VV
	DcV1bosN6Ujn0SdAdTf7V3V5xxw1iiOYsGFtrFWJAFMiF+H7ZKVNTiUWDiLQJNMIXh/h6tPYdTF
	rErqPblZ6jImrXHOd5tVsDFO+7KWrVPYnLyE5PJ4MGem8rF0G1TiFgseSBBBsyX069N49nQFMhL
	S/JihHhK9ZZ7cJar7tD0FgDz99alvXOkzAgw+RCRkJ7Av9YPURBBZTXauTT0T5zKQzjhzYVBR3s
	0RQX7CDNVsCImqzBBwMADIDVFrknB/uTx3L+JlAqJN09urJDFh2+qyLqd9L3ueF+8f6+jhPxSZ3
	cvIDgCfuz7KLEuZ7STMj6XswCjrb2BebSBKmq11R2Ls3rWOPI4SP95I5GssdX240p5O/raQ3Ah4
	y0Hp7Ph85YYnclFZdO4TZUi/e84MUxWQAW6eGaRNVyiCq+8YN3ZJiK1C8YI=
X-Received: by 2002:a05:6a00:2995:b0:88d:501e:eeb9 with SMTP id d2e1a72fcca58-891b0f8ffa8mr2420530b3a.7.1791395091464;
        Wed, 07 Oct 2026 10:44:51 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892bbf7df7esm616653b3a.57.2026.10.07.10.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 10:44:50 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Chris Snook <chris.snook@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next] net: ag71xx: align the IP header behind DSA tags
Date: Wed,  7 Oct 2026 10:44:49 -0700
Message-ID: <20261007174449.671416-1-rosenp@gmail.com>
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
---
 drivers/net/ethernet/atheros/ag71xx.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/atheros/ag71xx.c b/drivers/net/ethernet/atheros/ag71xx.c
index 8a3c689f6825..414d26118d15 100644
--- a/drivers/net/ethernet/atheros/ag71xx.c
+++ b/drivers/net/ethernet/atheros/ag71xx.c
@@ -38,6 +38,7 @@
 #include <linux/reset.h>
 #include <linux/clk.h>
 #include <linux/io.h>
+#include <net/dsa.h>
 #include <net/selftests.h>
 
 #define AG71XX_OOM_REFILL	(1 + HZ / 10)
@@ -1396,6 +1397,24 @@ static void ag71xx_hw_disable(struct ag71xx *ag)
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
@@ -1410,6 +1429,7 @@ static int ag71xx_open(struct net_device *ndev)
 	}
 
 	max_frame_len = ag71xx_max_frame_len(ndev->mtu);
+	ag->rx_buf_offset = ag71xx_rx_offset(ag);
 	ag->rx_buf_size =
 		SKB_DATA_ALIGN(max_frame_len + NET_SKB_PAD + NET_IP_ALIGN);
 
@@ -1874,10 +1894,6 @@ static int ag71xx_probe(struct platform_device *pdev)
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

