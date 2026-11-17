Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917333;
	b=iDoKRSlm3STxyTIC+ZxdPj3iwLjk+cyk8Shv5KpDNd9+oUUsHQeivKGkxMdNtRtCMwvL
	 wuij+4GYW3PzV0bNl0sG9/3amex3tnsAvFDfNrM0px6HpCqi4YIAQHS9C104G8Hzh+ab7
	 U8cnMkoy60gEaCMXn7Q48XZZo80kVzbCgpeZwB1lC6teJtie3N0eWjATipOukZpmE56R8
	 rxy8xuOc2SKsi12KjvOpjE4H1QGW8NTxdZ6Wp3G1BVQVDvjJoEjdbuJvP8qQCf5cMWjui
	 /+YGI4Nvpwslp4mhcRlpzqYRfeqcomTT3+gQ4VRI69Hh09evYakkUQCnTYuyzErOMfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917333;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Received:From:
	 To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=VsV0hUwcvcUwBN3lHnVzG7EPwmFdc4r2rVxk4R2kG/c=;
	b=dWePSllr3lSHqeZXItWe9jrsWWKcwZML1ianqFBvupIJrDhcPEx9jQ3bsOCM1YGC97nI
	 jmNc2lfxI+5GQQHO5R5OF2icuMfsO+RX82DXPXEHbQo2H+KOsr4HmLjY9tLL/HczewhvM
	 YpW/GqhOpOR2vT4saviHdSKzW7zKAq37D0pw/ZQ7NMRYNkyFbHHjH/rHfc4q9t2IzVJRk
	 /upY2THCf0CxGFwNeLoH17zGdQ5szUwoMkv11pdDGVrvPfZkSOjGfrrvnnCKTDVlQFr2w
	 iQfZVUWHy3suW7j8+GmWb8anc1yE6Dv/fbQwcxYU/nLquSGjT+m+gOEYzt4Xn88riTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=aWbsXrfW;
	arc=none smtp.remote-ip=113.46.200.227
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C969606A31C;
	Tue, 17 Nov 2026 12:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C969606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=aWbsXrfW
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VsV0hUwcvcUwBN3lHnVzG7EPwmFdc4r2rVxk4R2kG/c=;
	b=aWbsXrfWNj6AQXRiSFdwUeaRu1iGSYZKdQWWXq9tV7Go+fRMsV+Q9A94lX6Uikm4IMDP+I1pE
	tGi5zqHnmWJuIdEUEaK5Vd0VaVgsU/TG6BaRrOVQ8HS2qZKAE9/oBKIEOU1s36qqfU9VVtXaqLA
	Q5rA+6vQuO5ez7jTaHqsGgU=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jTNlv2NQSznTV6;
	Tue, 17 Nov 2026 20:07:55 +0800 (CST)
Received: from dggpemr500018.china.huawei.com (unknown [7.185.36.199])
	by mail.maildlp.com (Postfix) with ESMTPS id EFB8C40572;
	Tue, 17 Nov 2026 20:08:48 +0800 (CST)
Received: from whupemq100015.china.huawei.com (7.152.185.230) by
 dggpemr500018.china.huawei.com (7.185.36.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 17 Nov 2026 20:08:48 +0800
Received: from DESKTOP-62GVMTR.china.huawei.com (10.174.220.94) by
 whupemq100015.china.huawei.com (7.152.185.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 17 Nov 2026 20:08:46 +0800
From: Fan Gong <gongfan1@huawei.com>
To: Fan Gong <gongfan1@huawei.com>, Wu Di <wudi234@huawei.com>, Teng Peisen
	<tengpeisen@huawei.com>, <netdev@vger.kernel.org>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Ioana Ciornei
	<ioana.ciornei@nxp.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Mohsin Bashir <mohsin.bashr@gmail.com>, Dimitri Daskalakis
	<dimitri.daskalakis1@gmail.com>, Harshitha Ramamurthy
	<hramamurthy@google.com>, Larysa Zaremba <larysa.zaremba@intel.com>, "Vadim
 Fedorenko" <vadim.fedorenko@linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Zhou Shuai
	<zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>
Subject: [PATCH net-next v04 2/4] hinic3: Read the queue counters once per u64_stats retry loop
Date: Tue, 17 Nov 2026 20:08:32 +0800
Message-ID: <d0c87d67dc2de5807569077514ba578cd34ed4c2.1794917917.git.gongfan1@huawei.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <cover.1794917917.git.gongfan1@huawei.com>
References: <cover.1794917917.git.gongfan1@huawei.com>
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 whupemq100015.china.huawei.com (7.152.185.230)

hinic3_get_stats64() accumulates the per-queue counters with += inside the
u64_stats_fetch_begin()/u64_stats_fetch_retry() sequence.  A retry repeats
the body, so the values read by an aborted pass would be counted twice.
Read the snapshot of one queue into the locals instead, and add it to the
rtnl_link_stats64 fields after the loop.

This cannot trigger today: the driver depends on 64BIT, where
u64_stats_fetch_retry() always returns false, and the only writers of
these counters are the clean_stats() helpers, which run before the queues
are used.  The change is a prerequisite for the per-queue statistics that
will populate them, so it carries no Fixes: tag and reports the same
values as before.

While at it, drop the dead stores into the locals before the loops: every
iteration overwrites them before they are read.

Also drop the nic_dev->txqs and nic_dev->rxqs NULL checks.  Both arrays
are allocated by hinic3_sw_init() before register_netdev() and freed by
hinic3_sw_uninit() after unregister_netdev(), and the loops are bounded by
nic_dev->max_qps, the number of entries they were allocated with.

rx_errors keeps reporting csum_errors + other_errors.  Neither counter is
populated yet, and the checksum error accounting together with its
"csum_bad" queue statistic belongs to the queue-stats work that adds the
writer.

Co-developed-by: Wu Di <wudi234@huawei.com>
Signed-off-by: Wu Di <wudi234@huawei.com>
Co-developed-by: Teng Peisen <tengpeisen@huawei.com>
Signed-off-by: Teng Peisen <tengpeisen@huawei.com>
Signed-off-by: Fan Gong <gongfan1@huawei.com>
---
 .../huawei/hinic3/hinic3_netdev_ops.c         | 43 +++++++------------
 1 file changed, 15 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c b/drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c
index da73811641a9..6007e0e58478 100644
--- a/drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c
+++ b/drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c
@@ -791,49 +791,36 @@ static void hinic3_get_stats64(struct net_device *netdev,
 	unsigned int start;
 	int i;
 
-	bytes = 0;
-	packets = 0;
-	dropped = 0;
 	for (i = 0; i < nic_dev->max_qps; i++) {
-		if (!nic_dev->txqs)
-			break;
-
 		txq = &nic_dev->txqs[i];
 		txq_stats = &txq->txq_stats;
 		do {
 			start = u64_stats_fetch_begin(&txq_stats->syncp);
-			bytes += txq_stats->bytes;
-			packets += txq_stats->packets;
-			dropped += txq_stats->dropped;
+			bytes = txq_stats->bytes;
+			packets = txq_stats->packets;
+			dropped = txq_stats->dropped;
 		} while (u64_stats_fetch_retry(&txq_stats->syncp, start));
+		stats->tx_packets += packets;
+		stats->tx_bytes   += bytes;
+		stats->tx_dropped += dropped;
 	}
-	stats->tx_packets = packets;
-	stats->tx_bytes   = bytes;
-	stats->tx_dropped = dropped;
 
-	bytes = 0;
-	packets = 0;
-	errors = 0;
-	dropped = 0;
 	for (i = 0; i < nic_dev->max_qps; i++) {
-		if (!nic_dev->rxqs)
-			break;
-
 		rxq = &nic_dev->rxqs[i];
 		rxq_stats = &rxq->rxq_stats;
 		do {
 			start = u64_stats_fetch_begin(&rxq_stats->syncp);
-			bytes += rxq_stats->bytes;
-			packets += rxq_stats->packets;
-			errors += rxq_stats->csum_errors +
-				rxq_stats->other_errors;
-			dropped += rxq_stats->dropped;
+			bytes = rxq_stats->bytes;
+			packets = rxq_stats->packets;
+			errors = rxq_stats->csum_errors +
+				 rxq_stats->other_errors;
+			dropped = rxq_stats->dropped;
 		} while (u64_stats_fetch_retry(&rxq_stats->syncp, start));
+		stats->rx_packets += packets;
+		stats->rx_bytes   += bytes;
+		stats->rx_errors  += errors;
+		stats->rx_dropped += dropped;
 	}
-	stats->rx_packets = packets;
-	stats->rx_bytes   = bytes;
-	stats->rx_errors  = errors;
-	stats->rx_dropped = dropped;
 }
 
 static void hinic3_nic_set_rx_mode(struct net_device *netdev)
-- 
2.43.0

