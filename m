Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.108
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794839883;
	b=vHqr8SdPG8WiKI+0CsrXkUfEl2eRWVZs7iBQ4R7sMT4g4UxAyD6tA1IEjsutW3N521wc
	 fUY+uBdntIHWFXJ3J+p+NJhmtLEx4Okp9O+G53j0eyfPu87gLiTTwMI0pudA7kGSUfDO7
	 Sv1MMrUp5HzTs03w8a3wlfXpPCVygOXSsyadpGQcfFOYOIMZmSANWUAQYBQEVUyF67STQ
	 AB9MhRRao6Q3zdWA5CLKwOb+W/ykKV/wzTU46fOwlWuYWpA2lnR/6mjgVq05OfjzCBLdk
	 8lejKOeNY1tV4Jw/tC7bfWYNM+CAUwJ10qSyD+Cucy8Gup9OI0B+/vuRfsYL++2oryQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839883;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=J5EY/cK5DkKRpcBAVpA3YUu6pKgJgrPde/BB7+Xa78k=;
	b=3xtjWqpq3qsV/50RVYtSqKTR7YOderkU0EBuXw9K8N/sLWFGW0YxLRQutXJJ8fAGTNNr
	 CJar+CreiyfUE+JHjUIdA5nPjsTP8OxbdO4o83HT5m2hGXyFucqsZyS52TgFGFQiOoC+i
	 jr64gPZ4LWZ+cDNuEbw75PrM+fGAgU30hui/WFrYfCd/7Dh/wQU6N6K8ed/B9LiT3gl6H
	 ndV3CO5MYHqyyJzHpEfsPLRj3MypF5K9J/Wkt8SS8Fpn13sEYsM64QknPNrYUvF9/FO4g
	 gZmJGrWo+gCAzypSNds8Qf074uSaxgXPA0LKTNAamyWhxP8B0ImmwBZPctvzlSeXKbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=telcobridges.com;
	spf=pass smtp.mailfrom=telcobridges.com;
	dkim=pass header.d=telcobridges.com header.i=@telcobridges.com header.a=rsa-sha256 header.s=selector2 header.b=MrfwYNpR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.108
Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022108.outbound.protection.outlook.com [40.107.193.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21960606A333;
	Mon, 16 Nov 2026 14:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21960606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=telcobridges.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=telcobridges.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=telcobridges.com header.i=@telcobridges.com header.a=rsa-sha256 header.s=selector2 header.b=MrfwYNpR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QOPbHlZxNnnDmsuNXoDvbU4b52d3ZjgT8/aj32faoWimmmjFPFk+nlOMPCWdbajX1bcGxL+abPzbIkJlbUPGW/aWlJunzb2RBOAKh6jX2I+DNzaS41zbGXmUq5d/PAchdszzkJp3N5bcFoc3E2jsSPYyynQ2c/CyY7C21FWbC6I7B4NC1ONnhV2clCE+kpVtHH8Gv4X2Axl7WUBqmqB2pZPfquBYkZFzGW5GBrF2JzgqynaKGGjKrQMnR7MIqUWrK7Wh/j9QXxjgZvNqJSH7DRz10cFjipsIdBIw6IgXr7pklt15opGP2Uohz/0m/f7D8113ovPrq32zsOTmxeiRBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5EY/cK5DkKRpcBAVpA3YUu6pKgJgrPde/BB7+Xa78k=;
 b=fYsEVP0f11nMSIPmfJDDKc41aw4Pu9OYsNdDqCnTICK2hL+Gk6+VILbcwcto6C1I+B9wHMciW4P9MR91X9WtonB+TktFHc/ZPVrPKY1Hwn7wabVyJCP57XYoDsVSWsuxgz8tANxl3T0FfFd2jkAhrAEeBf9R6tMr0SCPZQ7ItwbL8cwI9WTWwXLSoCdk5rEUFiGmBczUT9SI3pPjouJL1+cA1oGDO8+iSnc8li668h7NsksskKJO/p+tINhR1d9AUmf1UrRiz6So6Gh1kSBGqSsI9FZdStiSDAdmwY90L4b4Mj8K1t7QQkYYKIJCwZ4jhbsDPQmD1NwV65SFcH3elA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 142.180.224.216) smtp.rcpttodomain=davemloft.net
 smtp.mailfrom=telcobridges.com; dmarc=pass (p=quarantine sp=quarantine
 pct=100) action=none header.from=telcobridges.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telcobridges.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5EY/cK5DkKRpcBAVpA3YUu6pKgJgrPde/BB7+Xa78k=;
 b=MrfwYNpRx095Sis+QMdPYQjo+NAwx+cmrgjoS/0OHJHReQRixxXQAib9zuxKvVtPC8ykzwtREay0rK6LqSGcHE1FxKeBtIzKHD6mPqSrMFa6q7dVVX3wHKTGQELXrPqsbQ+BIbfKEkqg6lGpijRzMElvS7TNnmEZFF7JLWDQ0EU=
Received: from YT2PR01CA0013.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::18)
 by YT6PR01MB522346.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:1ba::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 14:37:57 +0000
Received: from QB1PEPF00004E0D.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38:cafe::32) by YT2PR01CA0013.outlook.office365.com
 (2603:10b6:b01:38::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Mon,
 16 Nov 2026 14:37:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 142.180.224.216) smtp.mailfrom=telcobridges.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=telcobridges.com;
Received-SPF: Pass (protection.outlook.com: domain of telcobridges.com
 designates 142.180.224.216 as permitted sender)
 receiver=protection.outlook.com; client-ip=142.180.224.216;
 helo=srv-code1.telcobridges.lan; pr=C
Received: from srv-code1.telcobridges.lan (142.180.224.216) by
 QB1PEPF00004E0D.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server id 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 14:37:56
 +0000
Received: from srv-vmware-cmcburney-tbos10.telcobridges.lan (unknown [10.0.0.68])
	by srv-code1.telcobridges.lan (Postfix) with ESMTP id 9B1529653;
	Mon, 16 Nov 2026 09:37:56 -0500 (EST)
From: Curtis McBurney <cmcburney@telcobridges.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	willemb@google.com,
	toke@redhat.com,
	linux-kernel@vger.kernel.org,
	Curtis McBurney <cmcburney@telcobridges.com>
Subject: [PATCH net 2/2] net: net_test: add tests for netif_tx_stop_queue() trans_start
Date: Mon, 16 Nov 2026 09:37:16 -0500
Message-ID: <20261116143716.367451-3-cmcburney@telcobridges.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261116143716.367451-1-cmcburney@telcobridges.com>
References: <20261116143716.367451-1-cmcburney@telcobridges.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: QB1PEPF00004E0D:EE_|YT6PR01MB522346:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fd08a6f9-ed40-4f1f-7ac0-08df43ef34a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|82310400026|36860700016|10067099003|56012099006|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Kfq+e9xCUyGvY67yso+aNGhiQ/XtCDX0GI0cgSFDHqi5ik8GQnwhANw1SBTaaxJ2mYwdGf7fUwX6qbqxvd9Kqxi9hosQqbgt7fhSMu5Jr43n1wmWRLuTE3Bcryd8pjh4XZcvI26K0ABFSsfeYr7OgDYI8+Nw9K5XrHUnuJFWCKcbZxMpjHa2Ab684qQ52yZ073V5HMxrt67Op4D0kgFk9IKpPBQIQHmKl8InbnEUV2kwDOxv1qenKE/itJwwx3X3YbksNUzb6LdgXWEVDAkJqtxKmlmKM0+l1QJHXtINDeNkbD7v8X1F8JRqAr6Vqr0x3Phd+WfIbaL46+lybWnjMDnzwlCPfr5BqTMJZsDqW8CfkzivZBhp2rHk0jCH2lDzpebI6+WTIyArNJuYae7BGc2alnTX+IjAK9L0AMSYoPq0cygXGHX2itEdh4eVbGVqNOcMrITdA/U9NjTXbBLwL/GpeNLBAUNGENfdRDm3pfj7eSHsNkmUobBlJCz5abjl3qWdHxtjppLCHV4UO2dbklX0I06JM2RMfMHosxwnthAZEjE4HeQ980wwT4bRi7AaDUYxPjnMaZkgvTvMroiaJwSgqykukqVpK2osWXmkjdBSsFOECDTsacXc/mw9vlL560G9zjrpDKDUZfwJ0WmfMQw44NhMz4O9sIAobBWyILbL9eKFnovHzoin5QRe68l3bz2hnaIUPnM+mixvp8UU9Q==
X-Forefront-Antispam-Report:
	CIP:142.180.224.216;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:srv-code1.telcobridges.lan;PTR:ipagstaticip-a30715f8-af06-ab92-2e59-6516aeac2c90.sdsl.bell.ca;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(82310400026)(36860700016)(10067099003)(56012099006)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5hDx/pcLOue98aBhygaYojodVUpr53w0BUr93CAym/9+ZhpFKYblMPAk0OO5zyJa4qMlmQubIy18OqngmdG+1V1oKOVNgIV51Jjwoj2C/M7pcRuxACFb2rpS2v/aLqvJvWBEMJIlI6hgIPBeSioYFsp+DxBfTDFZiJeUwoFSXFkdXCi++IG0QcU7NGHlpYxRSvK9YGh1ecT9YLt1qnMsUuaDfegAXYl2YjNFTojLVV6F4DAIN7LhJR2ZoqcO45KYIFb/fXjlQKonviSqZBu9jFxzAHa34zCtB0Ma0RqNEmF6ufcbrvP1LcN5Y2bCGEQDWxIqtZ5hGXarqwgpX3dF29hlvB7Wt4u0LxejDl3S0XCQ8IV1+Axdu+xcWtMi4ziMCa2l03O/Srx72x/mGyExGVNeB9FjxXI0fNuWr7qG64juggb60LlKDJU8Gag/YqvN
X-OriginatorOrg: telcobridges.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 14:37:56.8954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd08a6f9-ed40-4f1f-7ac0-08df43ef34a9
X-MS-Exchange-CrossTenant-Id: 5dc833ed-bd96-4d5b-aaa0-0d8be83ae4e5
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5dc833ed-bd96-4d5b-aaa0-0d8be83ae4e5;Ip=[142.180.224.216];Helo=[srv-code1.telcobridges.lan]
X-MS-Exchange-CrossTenant-AuthSource:
	QB1PEPF00004E0D.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT6PR01MB522346

Add KUnit tests for the txq->trans_start handling of
netif_tx_stop_queue(), which dev_watchdog() uses to detect a stuck
queue:

  - a stop on a running queue writes trans_start
  - a stop on a queue already stopped by the driver keeps trans_start
  - a stop after netif_tx_start_queue() writes trans_start again
  - a stop on a queue stopped only by BQL (__QUEUE_STATE_STACK_XOFF)
    writes trans_start

txq_stop_keeps_stamp_stopped_queue fails without the previous patch.

Tested on UML with CONFIG_KUNIT, CONFIG_NET and CONFIG_NET_TEST:

  tools/testing/kunit/kunit.py run --kunitconfig=<cfg> 'net_core.txq_*'

Claude Code (Anthropic) wrote these tests and this changelog.

Signed-off-by: Curtis McBurney <cmcburney@telcobridges.com>
---
 net/core/net_test.c | 112 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/net/core/net_test.c b/net/core/net_test.c
index 2b5080c22663..c69d34d0e230 100644
--- a/net/core/net_test.c
+++ b/net/core/net_test.c
@@ -1721,6 +1721,114 @@ static void netmem_ref_test_tcp_devmem_recv(struct kunit *test)
 #endif
 #endif
 
+/* netif_tx_stop_queue() and txq->trans_start */
+
+#include <linux/etherdevice.h>
+#include <linux/jiffies.h>
+#include <linux/netdevice.h>
+
+/* dev_watchdog() reports a timeout when a queue stays stopped for longer
+ * than watchdog_timeo after txq->trans_start. A trans_start value this far
+ * in the past is distinguishable from a fresh one.
+ */
+#define TXQ_TEST_OLD_DELTA	(10 * HZ)
+
+KUNIT_DEFINE_ACTION_WRAPPER(txq_test_free_netdev, free_netdev,
+			    struct net_device *);
+
+static struct netdev_queue *txq_test_alloc(struct kunit *test)
+{
+	struct net_device *dev;
+
+	dev = alloc_etherdev(0);
+	KUNIT_ASSERT_NOT_NULL(test, dev);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, txq_test_free_netdev,
+						  dev));
+
+	return netdev_get_tx_queue(dev, 0);
+}
+
+static void txq_test_expect_fresh(struct kunit *test,
+				  struct netdev_queue *txq,
+				  unsigned long before)
+{
+	unsigned long stamp = READ_ONCE(txq->trans_start);
+
+	KUNIT_EXPECT_TRUE_MSG(test, time_in_range(stamp, before, jiffies),
+			      "trans_start=%lu not in [%lu, %lu]",
+			      stamp, before, jiffies);
+}
+
+/* A stop on a running queue records the stop time in trans_start */
+static void txq_stop_stamps_running_queue(struct kunit *test)
+{
+	struct netdev_queue *txq = txq_test_alloc(test);
+	unsigned long before;
+
+	WRITE_ONCE(txq->trans_start, jiffies - TXQ_TEST_OLD_DELTA);
+	before = jiffies;
+	netif_tx_stop_queue(txq);
+
+	KUNIT_EXPECT_TRUE(test, netif_tx_queue_stopped(txq));
+	txq_test_expect_fresh(test, txq, before);
+}
+
+/* A stop on a queue that is already stopped keeps the first stop time, so
+ * repeated stops from a driver hang check do not postpone dev_watchdog()
+ */
+static void txq_stop_keeps_stamp_stopped_queue(struct kunit *test)
+{
+	struct netdev_queue *txq = txq_test_alloc(test);
+	unsigned long old, stamp;
+
+	netif_tx_stop_queue(txq);
+	old = jiffies - TXQ_TEST_OLD_DELTA;
+	WRITE_ONCE(txq->trans_start, old);
+	netif_tx_stop_queue(txq);
+	stamp = READ_ONCE(txq->trans_start);
+
+	KUNIT_EXPECT_TRUE(test, netif_tx_queue_stopped(txq));
+	KUNIT_EXPECT_EQ_MSG(test, stamp, old,
+			    "second stop moved trans_start forward by %lu jiffies",
+			    stamp - old);
+}
+
+/* A stop after a restart records a new stop time */
+static void txq_stop_stamps_restarted_queue(struct kunit *test)
+{
+	struct netdev_queue *txq = txq_test_alloc(test);
+	unsigned long before;
+
+	netif_tx_stop_queue(txq);
+	netif_tx_start_queue(txq);
+	KUNIT_EXPECT_FALSE(test, netif_tx_queue_stopped(txq));
+
+	WRITE_ONCE(txq->trans_start, jiffies - TXQ_TEST_OLD_DELTA);
+	before = jiffies;
+	netif_tx_stop_queue(txq);
+
+	KUNIT_EXPECT_TRUE(test, netif_tx_queue_stopped(txq));
+	txq_test_expect_fresh(test, txq, before);
+}
+
+/* Only the driver XOFF bit decides whether the stop is a transition. A queue
+ * stopped by BQL (stack XOFF) gets a new stop time when the driver stops it.
+ */
+static void txq_stop_stamps_stack_stopped_queue(struct kunit *test)
+{
+	struct netdev_queue *txq = txq_test_alloc(test);
+	unsigned long before;
+
+	set_bit(__QUEUE_STATE_STACK_XOFF, &txq->state);
+	WRITE_ONCE(txq->trans_start, jiffies - TXQ_TEST_OLD_DELTA);
+	before = jiffies;
+	netif_tx_stop_queue(txq);
+
+	KUNIT_EXPECT_TRUE(test, netif_tx_queue_stopped(txq));
+	txq_test_expect_fresh(test, txq, before);
+}
+
 static struct kunit_case net_test_cases[] = {
 	KUNIT_CASE_PARAM(gso_test_func, gso_test_gen_params),
 	KUNIT_CASE_PARAM(ip_tunnel_flags_test_run,
@@ -1738,6 +1846,10 @@ static struct kunit_case net_test_cases[] = {
 	KUNIT_CASE(netmem_ref_test_tcp_devmem_recv),
 #endif
 #endif
+	KUNIT_CASE(txq_stop_stamps_running_queue),
+	KUNIT_CASE(txq_stop_keeps_stamp_stopped_queue),
+	KUNIT_CASE(txq_stop_stamps_restarted_queue),
+	KUNIT_CASE(txq_stop_stamps_stack_stopped_queue),
 	{ },
 };
 
-- 
2.52.0

