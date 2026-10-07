Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB71C414408
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373017; cv=none; b=KS6MfvBXPuQtIbFsZgwVXSuT9vOU2P8oeCGMayuWb/uDEPwrtTfK6nHKYzkut7vQFEd0Csbfm8e7xjoA/3QERSxpDQ2+Ruy5iJ17szCcw7AqXJgAL+q1JwDBoWBg8G1AzA80iRX5AoFMtuj9Ee+hKHjZVzsRdV03qKQ91chmqkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373017; c=relaxed/simple;
	bh=UouOyB31u+YCD6bXtjnrmd79G+/di/ocMA4oK0CI8fc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VSh6Qt4Twl/sTsVcC/sUASBEamt+ftpsSDBjkkQw5wbepQ7cvybgYzNQu24pL5KrVHVry7CvZc4t+L8Uc8tTR7ibL+ZTNngyBa/dI6dVQDefmnRJBY5nIb5xatd0P58GbCkltmaWhVTk3ppdBUqIAfa1FWg7Vi9ybmWLs5jy240=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnCEF4SX; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnCEF4SX"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so2580130c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791372986; x=1791977786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pya6QWeI8MqbdoWQJqlFWpCO6VkvcNLuddJu0ww+N9E=;
        b=hnCEF4SXK+Cs30L5LdsuHkkjB80/ZJZzGtyuQ71nT138kOGNplaDIJ2vHxv8/nty0B
         6O/1cJt4szTvWaK5JUFYcoeQmI4bk+ozRJtfVuDCd3h6r0RLuhtC2MT1h5UtrcNVcyb9
         8r7xyhvgkD9RuX8L1PskYeuM0pcWrQwlnw/wo+P/Z5QvBLfreZOX6DjfAQ5fuz8sk9dU
         lOtygkfzxd7gEfXKHgZHZ/VUTL0PMGriesIbW++NOtDXhxDo5hIs3VBdue6XIXce/hER
         A4YcWapbAjrP4PzInf1u8BCivw2A5dVSdUiD2yIbwNRH8vMtPsFcU9I96WDz1RkAO1vN
         DrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372986; x=1791977786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pya6QWeI8MqbdoWQJqlFWpCO6VkvcNLuddJu0ww+N9E=;
        b=yBCk6mDkg+rXAuN3VO8MkB0qKP7rNPkkZnIqFFUuH95SP0hKCNFG5KTmEArIZ/vtdd
         7daWgkpoetECOmt+oHmfE56yrdw8tVdj5qXReyfvPsNLGUY7IABjKZDSnvYDBjE4Wkq7
         iqwITHuF+lUNL9wWN+iRrvDMIoOHg5JHJV33KY+h5RqBn/aLsI4/j1WmTUyiNLgGTejE
         rMFG3rmKSyF+ioTi5c4Q1gX1eqeRz6jLzB8ohKj+d5S+zGS9GRcOZrccDU6RCYK1zySX
         X161KfjZ8rq6zeYNiHkykAxpfdo6mwv2+Jzy4G2RbwtiS072Ymao7GGmPPndYKEIjIrT
         u58A==
X-Forwarded-Encrypted: i=1; AKwUvBxRAmkva+tuA0O1EsXcCku559+f7iNjhPwbVNSodPMKplYYBD2F4zWnndE88ef0gDFGYFTaPwvRtsg1wmI=@vger.kernel.org
X-Gm-Message-State: AFuF++ltO/oqMO3KO3kRLteOHRw6oSvMOsH1QFfo3l+fpxpGKAsCOE5u
	BbnpSeC232/ErvJSqjg5w5c3TIIE5OLsp/ienc/gsbRVscK1BxhT4fjo
X-Gm-Gg: AYBFou3LRqbVPbiNhpYI5YUN+Dw1X08TwozPShVGR+IvT4WdILHy3mItjMS7NSNGThZ
	wt3W8lk4TysYhFLT6THBnb0bVtPKiAmTmQZ1rbms6xYUW5/GGah8y8Hbyh5kU5AwzxI0C/z1jJ0
	jJ0o8mjk0db4Vkz9eBp5l1dAXPWtbAoIIU/y6apfI35CumSkCiX9ki1djD4GJQcSoiu+yiiIqkx
	RK3MMUVx+onn9HW7pnGiPQxadu3KFFnmxX6vhxvAucLv8aDBBySvjnCCmV0VYOrMOFaEGVBHXGA
	j5JK7gLpb3GS7D1ymHYSvr2fSMvuIz34V+fCbT8Z+x0a2i2r1ZGHqZxPYodgJmPfSRZqd51LD/e
	kJFeSosAiyTIjfGhlXxKhxPqKNNGx7zoPz0EIaeoQsq0jMcigHacK4Y9Z+PRdfwhosVtUpLm9SG
	pgjoA0Jz0dxnVeb/dH9g1Xbtju/Fer7m+khUJBq0kggJNdi3OAacRUVdjigEDC1WfYeIPSNiA31
	zLu11XCLFhHc4+0SwsKWA==
X-Received: by 2002:a05:701b:204b:10b0:14c:d8d9:9502 with SMTP id a92af1059eb24-16205513f0emr2008938c88.14.1791372985597;
        Wed, 07 Oct 2026 04:36:25 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.133.64])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16168f586f8sm8680304c88.13.2026.10.07.04.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:36:24 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>
Cc: linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	syzbot+937a3a1fbfbc99d6fcaf@syzkaller.appspotmail.com
Subject: [PATCH] can: vcan: use per-CPU device stats
Date: Wed,  7 Oct 2026 17:06:11 +0530
Message-ID: <20261007113611.2082-1-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vcan_tx() and vcan_rx() update dev->stats with plain increments and
rely on the tx queue lock to serialise them.  That only holds for a
single tx queue.  vcan does not implement get_num_tx_queues(), so
rtnl_create_link() honours IFLA_NUM_TX_QUEUES and a vcan device can be
created with several queues, each with its own xmit lock.  Two CPUs
transmitting on different queues then update the same counters
concurrently and lose increments:

  BUG: KCSAN: data-race in vcan_tx / vcan_tx
  read-write to 0xffff88811aad8228 of 8 bytes by interrupt on cpu 1:
   vcan_tx+0x325/0x5d0 drivers/net/can/vcan.c:110
   dev_hard_start_xmit+0x10c/0x380 net/core/dev.c:3969
   __dev_queue_xmit+0xbfd/0x1ec0 net/core/dev.c:4958
   can_send+0x584/0x720 net/can/af_can.c:279
   bcm_can_tx+0x3ba/0x5b0 net/can/bcm.c:367
  read-write to 0xffff88811aad8228 of 8 bytes by interrupt on cpu 0:
   vcan_tx+0x325/0x5d0 drivers/net/can/vcan.c:110
  value changed: 0x00000000000025ef -> 0x00000000000025f0

Switch the packet and byte counters to the core's per-CPU dstats.
The core allocates them for NETDEV_PCPU_STAT_DSTATS and folds them
together with dev->stats in dev_get_stats(), so tx_dropped from
can_dropped_invalid_skb() is still reported.

Reported-by: syzbot+937a3a1fbfbc99d6fcaf@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=937a3a1fbfbc99d6fcaf
Assisted-by: LLM
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
 drivers/net/can/vcan.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/net/can/vcan.c b/drivers/net/can/vcan.c
index 76e6b7b5c6a1..2ff90cb7eee9 100644
--- a/drivers/net/can/vcan.c
+++ b/drivers/net/can/vcan.c
@@ -71,10 +71,7 @@ MODULE_PARM_DESC(echo, "Echo sent frames (for testing). Default: 0 (Off)");
 
 static void vcan_rx(struct sk_buff *skb, struct net_device *dev)
 {
-	struct net_device_stats *stats = &dev->stats;
-
-	stats->rx_packets++;
-	stats->rx_bytes += can_skb_get_data_len(skb);
+	dev_dstats_rx_add(dev, can_skb_get_data_len(skb));
 
 	skb->pkt_type  = PACKET_BROADCAST;
 	skb->dev       = dev;
@@ -85,7 +82,6 @@ static void vcan_rx(struct sk_buff *skb, struct net_device *dev)
 
 static netdev_tx_t vcan_tx(struct sk_buff *skb, struct net_device *dev)
 {
-	struct net_device_stats *stats = &dev->stats;
 	unsigned int len;
 	int loop;
 
@@ -93,8 +89,7 @@ static netdev_tx_t vcan_tx(struct sk_buff *skb, struct net_device *dev)
 		return NETDEV_TX_OK;
 
 	len = can_skb_get_data_len(skb);
-	stats->tx_packets++;
-	stats->tx_bytes += len;
+	dev_dstats_tx_add(dev, len);
 
 	/* set flag whether this packet has to be looped back */
 	loop = skb->pkt_type == PACKET_LOOPBACK;
@@ -107,8 +102,7 @@ static netdev_tx_t vcan_tx(struct sk_buff *skb, struct net_device *dev)
 			/* only count the packets here, because the
 			 * CAN core already did the echo for us
 			 */
-			stats->rx_packets++;
-			stats->rx_bytes += len;
+			dev_dstats_rx_add(dev, len);
 		}
 		consume_skb(skb);
 		return NETDEV_TX_OK;
@@ -185,6 +179,7 @@ static void vcan_setup(struct net_device *dev)
 	dev->netdev_ops		= &vcan_netdev_ops;
 	dev->ethtool_ops	= &vcan_ethtool_ops;
 	dev->needs_free_netdev	= true;
+	dev->pcpu_stat_type	= NETDEV_PCPU_STAT_DSTATS;
 }
 
 static struct rtnl_link_ops vcan_link_ops __read_mostly = {
-- 
2.55.0.windows.5

