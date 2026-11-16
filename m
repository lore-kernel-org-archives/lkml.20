Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798710;
	b=Yom6064A4uPCFMBmpifc/lMKGRz8sK2eWyBqtERsx9OYeCn1BwvalNlXnbPEEnO9kMP1
	 AN2uTdb84y5z8VOkCjfXvdHSgVQAH1lGeRxS4Eah7yxfTgflwshx1DHOfn1kV+M/zHVsq
	 8n4sHnmUxL3QP8RBUyWMZzOiZIYWQqy7nAq2IxwdAxManEZU3YUOX1alz4jhkjapc6q6K
	 GphbS3b1XZheiR+k6y+zhWSIiQfM7VBvLGYG53bmm7ShfQmn48MiupZyo8cOfPLIvVU1L
	 vDJgV1rp3fbGTdZxhPDVCcxZeBRi27IpkuETpbKf5pXRdV+FIqByRC7RWbiF8TY6ogQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798710;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=Wl8mwQigawQABRin60nuEzeu4gQqDCEVRxTbbbbgbIM=;
	b=ynas7ijXXwt1VziAwkgIDROtb9Q9J01rjcZejsm56TiNzzxBpAyQk672cexAp9wF/ex9
	 u811MxO5YHfwLzw9NIyVce40ELkynwqQPqrEnt0fg4xYkn6D+Q+1iZziKcaQqva8k77As
	 7vOzqlErmgOl+E/mJkyAv0CzTLzojl2liLI2VN7hUaGQz/KZy3F+cZi/UlWFZTJ2ri/Tq
	 XXeBs8S8sT9YynUOjqdKr8avHw0WdbDaVd4DkxL88Gc49ejDNFwUmEXg/PolMsKwL0urA
	 JjjY589f8oem7aaSeY1byVpQGI1BKanQg5P48uLeak/xYhpf8LbVdb9MKT0HajOc+4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mucse.com;
	spf=pass smtp.mailfrom=mucse.com;
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E613606A31C;
	Mon, 16 Nov 2026 03:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E613606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: zesmtpgz9t1794798658tabbf4f94
X-QQ-Originating-IP: PT//n29n4f4gWrvL8SRzUDEZmbAf1WNilqhZgD/frt4=
Received: from nic-Precision-5820-Tower.tail7b ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 16 Nov 2026 11:10:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16802275149351022160
EX-QQ-RecipientCnt: 10
From: Dong Yibo <dong100@mucse.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	dong100@mucse.com,
	yaojun@mucse.com
Subject: [PATCH net-next v2 5/5] net: rnpgbe: Add hardware and queue statistics
Date: Mon, 16 Nov 2026 11:10:54 +0800
Message-ID: <65EB247A8B937B64+20261116031055.1330377-1-dong100@mucse.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <BD205A7832D36E7D+20261116030917.1329989-1-dong100@mucse.com>
References: <BD205A7832D36E7D+20261116030917.1329989-1-dong100@mucse.com>
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
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:mucse.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: Nh43UXexc6D5LBgZ4F8PofBq22zRbSiN8Xi1qVYjLF4BEuftuO2LsSvG
	5etk1+R1toEQSvHMRLwPkASYWI71x9WveVx6OPO5MCO2RpgW7fUgD4kP7/Yj4cHEW4AqR4d
	yw6LCJBtWlo5MsX9NuceWvLfPhwendYgeF9174Dwc14DB/mlV93B/9TZGfVn4B2s0swBPM3
	48d++pddW9GW/sbFtVGHmWTdyHXvOrYnBBHcq1AJL2U3LB92nEyDPOUSC6O7+2N17UDczwE
	jOztkj5uoTvFzAJlrE89qzrt71H2UZfZfCD5B0vYUS0CBL4IBZMUZGchESl+L5Zb77BazpV
	du/HPI2kjKeJh6Fbn6P2Ktej2vY2YPYQCsFrCmQyHbeEWTyfSTIQBxe+a6LKBPVWVcdM6Hh
	bGSDBvgpqe3sh+FC4QFD+QdLJJ8+wv7eFxc9YU2pxs0phY+ONq6Q2k/VS2opY0CdBJL7pUe
	+JZYloMChERItfgbEXtPNaNyk3wk9yxRYs5G8wsqiH2HASQZK0+ZAiSoJJ3AeJIds7pHXzX
	F+fALiL/RQvi1luxDV44cFdCrCll6DupitiEvLYkwGcm4VAz4nNk/WBykWf0/DjIwYbSo4X
	XRUb+oZ3FRFFBwvY1vIa0F4LBI8SuU3cnSELRDjr2rFCIBbePDd0QBfHtUNvCiT8FZv+Uup
	A1ghz5i7SXieDdCqL1affVSHfDP7PtXq14P1DGEAT4Rko+O92oFnUmvklp3kgCrDJcPMKdq
	Tae+EY6+yF55t6l17Dv2qMCvI93jBmxhVX6BTKZEk3KN3rVn7eyoA931acLFsK0URALa38K
	7Wt3jhXhcrwE/1VA+AJ1mdyaRq5g/09lZDUDO3W4eNOiWaITJM5k604mjHWNjnWEHn2Yvcs
	m8cdYNYR/qdCt7AusVaZlyRtgdpGqgQtxhLqqpiRDJVYpSTusaEmSPQPlQxCd2g+/wKIpTm
	GAbHELkg7csGbpP4nUi+0awKfpewPP9g+RZsEHCJm2+UhKugdeRdwG+DlacKDegKzYEDrEC
	NEBMVmwLv++hy4GWiMQkxdUaAsxrFf2pH6bMAuCcQSdICNHxwcxxlzlOuXiZKWuHdrJH7S0
	toG+nemPtrWbGCPvWeYmFhF42EhIUkk+bTtskxMyr21
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

Add hardware receive CRC-error and multicast counters to
ndo_get_stats64. Accumulate the non-clearing 32-bit counters from the
service task while the interface is open, take a final sample on close
and retain totals across interface down/up cycles.

Skip hardware sampling while the PCI channel is offline. Check the DMA
version register before accepting all-ones counter values, and retain
the previous snapshots and totals when sampling fails. Reject unreadable
initial snapshots during probe.

Report per-queue RX and TX packet and byte counters through netdev queue
statistics. RX queue counters cover packets delivered to the networking
stack, while interface RX totals also include good packets dropped by
the driver. Combine RX page and skb allocation failures in
rx-alloc-fail, and include inactive queues in device totals.

Expose per-queue TX DMA mapping failures through ethtool statistics.

Signed-off-by: Dong Yibo <dong100@mucse.com>
---
 drivers/net/ethernet/mucse/rnpgbe/Makefile    |   1 +
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h    |   7 +
 .../ethernet/mucse/rnpgbe/rnpgbe_ethtool.c    |   3 +
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_hw.h |   3 +
 .../net/ethernet/mucse/rnpgbe/rnpgbe_lib.c    |  28 +-
 .../net/ethernet/mucse/rnpgbe/rnpgbe_main.c   |   9 +
 .../net/ethernet/mucse/rnpgbe/rnpgbe_stats.c  | 241 ++++++++++++++++++
 .../net/ethernet/mucse/rnpgbe/rnpgbe_stats.h  |  37 +++
 8 files changed, 325 insertions(+), 4 deletions(-)
 create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_stats.c
 create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_stats.h

diff --git a/drivers/net/ethernet/mucse/rnpgbe/Makefile b/drivers/net/ethernet/mucse/rnpgbe/Makefile
index 4d768324a82c..2b498a3f297a 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/Makefile
+++ b/drivers/net/ethernet/mucse/rnpgbe/Makefile
@@ -10,4 +10,5 @@ rnpgbe-objs := rnpgbe_main.o\
 	       rnpgbe_mbx.o\
 	       rnpgbe_mbx_fw.o\
 	       rnpgbe_ethtool.o\
+	       rnpgbe_stats.o\
 	       rnpgbe_lib.o
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
index 8574377e3a22..da2d5d1db9b5 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
@@ -13,6 +13,7 @@
 #include <linux/workqueue.h>
 
 #include "rnpgbe_hw.h"
+#include "rnpgbe_stats.h"
 
 enum rnpgbe_boards {
 	board_n500,
@@ -119,8 +120,13 @@ struct mucse_tx_buffer {
 struct mucse_queue_stats {
 	u64 packets;
 	u64 bytes;
+	u64 delivered_packets;
+	u64 delivered_bytes;
 	u64 length_errors;
 	atomic64_t dropped;
+	atomic64_t page_alloc_failures;
+	atomic64_t skb_alloc_failures;
+	atomic64_t dma_map_failures;
 	struct u64_stats_sync syncp;
 } ____cacheline_aligned_in_smp;
 
@@ -231,6 +237,7 @@ struct mucse {
 	struct net_device *netdev;
 	struct pci_dev *pdev;
 	struct mucse_hw hw;
+	struct mucse_hw_stats hw_stats;
 	struct mucse_ring *tx_ring[RNPGBE_MAX_QUEUES]
 		____cacheline_aligned_in_smp;
 	struct mucse_ring *rx_ring[RNPGBE_MAX_QUEUES]
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c
index d856b970e5a5..41921dbe4d33 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c
@@ -249,4 +249,7 @@ const struct ethtool_ops rnpgbe_ethtool_ops = {
 	.get_link = ethtool_op_get_link,
 	.get_link_ksettings = rnpgbe_get_link_ksettings,
 	.set_link_ksettings = rnpgbe_set_link_ksettings,
+	.get_sset_count = rnpgbe_get_sset_count,
+	.get_strings = rnpgbe_get_strings,
+	.get_ethtool_stats = rnpgbe_get_ethtool_stats,
 };
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_hw.h b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_hw.h
index 674d4d23c4b0..f48a25761e69 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_hw.h
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_hw.h
@@ -17,6 +17,7 @@
 #define MUCSE_N210_RING_MSIX_BASE      0x29000
 #define M_DEFAULT_N210_MHZ             62
 
+#define RNPGBE_DMA_VERSION             0x0000
 #define RNPGBE_DMA_STATUS              0x0008
 #define TX_AXI_RW_EN                   0xc
 /* DMA_STATUS_REG[23:20]: tx_wr, tx_rd, rx_wr, rx_rd done status. */
@@ -36,8 +37,10 @@
 #define RNPGBE_LINK_ST                 0x000c
 #define RNPGBE_DMA_AXI_EN              0x0010
 #define RNPGBE_TX_MIN_PKT_LEN          33
+#define RNPGBE_DMA_RX_MULTICAST(_n)    (0x4018 + 0x100 * (_n))
 
 #define MUCSE_ETH_OFF(_n)              (0x10000 + (_n))
+#define RNPGBE_ETH_RX_FCS_ERRORS       MUCSE_ETH_OFF(0x8954)
 #define RNPGBE_RX_RAR_LOW(_n)          MUCSE_ETH_OFF(0xa000 + 4 * (_n))
 #define RNPGBE_RX_RAR_HIGH(_n)         MUCSE_ETH_OFF(0xa400 + 4 * (_n))
 #define RNPGBE_RX_MCAST_HASH(_n)       MUCSE_ETH_OFF(0xac00 + 4 * (_n))
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c
index b7b0c45a0f66..fe320c4f389b 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c
@@ -4,6 +4,7 @@
 #include <linux/pci.h>
 #include <linux/netdevice.h>
 #include <linux/iopoll.h>
+#include <linux/jiffies.h>
 #include <linux/etherdevice.h>
 #include <linux/vmalloc.h>
 #include <net/netdev_queues.h>
@@ -201,8 +202,10 @@ static bool mucse_alloc_mapped_page(struct mucse_ring *rx_ring,
 	}
 
 	page = page_pool_dev_alloc_pages(rx_ring->page_pool);
-	if (unlikely(!page))
+	if (unlikely(!page)) {
+		atomic64_inc(&rx_ring->stats->page_alloc_failures);
 		return false;
+	}
 	dma = page_pool_get_dma_addr(page);
 
 	bi->dma = dma;
@@ -468,6 +471,7 @@ static int rnpgbe_clean_rx_irq(struct mucse_q_vector *q_vector,
 			       struct mucse_ring *rx_ring,
 			       int budget)
 {
+	unsigned int delivered_bytes = 0, delivered_packets = 0;
 	unsigned int total_rx_bytes = 0, total_rx_packets = 0;
 	u16 cleaned_count = mucse_desc_unused_rx(rx_ring);
 	unsigned int total_rx_length_errors = 0;
@@ -571,6 +575,7 @@ static int rnpgbe_clean_rx_irq(struct mucse_q_vector *q_vector,
 			skb = rnpgbe_build_skb(rx_buffer, size);
 
 		if (!skb) {
+			atomic64_inc(&rx_ring->stats->skb_alloc_failures);
 			cleaned_count++;
 
 			/* drop until eop if multiple descriptors */
@@ -615,6 +620,8 @@ static int rnpgbe_clean_rx_irq(struct mucse_q_vector *q_vector,
 
 		/* probably a little skewed due to removing CRC */
 		total_rx_bytes += skb->len;
+		delivered_bytes += skb->len;
+		delivered_packets++;
 		rnpgbe_process_skb_fields(rx_ring, skb);
 		rx_desc->wb.cmd = 0;
 		napi_gro_receive(&q_vector->napi, skb);
@@ -626,6 +633,8 @@ static int rnpgbe_clean_rx_irq(struct mucse_q_vector *q_vector,
 	u64_stats_update_begin(&rx_ring->stats->syncp);
 	rx_ring->stats->packets += total_rx_packets;
 	rx_ring->stats->bytes += total_rx_bytes;
+	rx_ring->stats->delivered_packets += delivered_packets;
+	rx_ring->stats->delivered_bytes += delivered_bytes;
 	rx_ring->stats->length_errors += total_rx_length_errors;
 	atomic64_add(total_rx_dropped, &rx_ring->stats->dropped);
 	u64_stats_update_end(&rx_ring->stats->syncp);
@@ -1456,7 +1465,7 @@ void rnpgbe_down(struct mucse *mucse)
 	int err;
 
 	spin_lock_irqsave(&mucse->link_lock, flags);
-	mucse->link_event_ready = false;
+	WRITE_ONCE(mucse->link_event_ready, false);
 	mucse->link_pending = false;
 	hw->link = false;
 	hw->speed = 0;
@@ -1491,6 +1500,7 @@ void rnpgbe_down(struct mucse *mucse)
 			 err);
 		dev_warn(&hw->pdev->dev, "Port is not truly down\n");
 	}
+	rnpgbe_update_stats(mucse);
 	rnpgbe_clean_all_rx_rings(mucse);
 }
 
@@ -1527,7 +1537,7 @@ int rnpgbe_up_complete(struct mucse *mucse)
 	hw->speed = 0;
 	hw->duplex = 0;
 	mucse_hw_wr32(hw, RNPGBE_LINK_ST, M_DEFAULT_ST);
-	mucse->link_event_ready = true;
+	WRITE_ONCE(mucse->link_event_ready, true);
 	spin_unlock_irqrestore(&mucse->link_lock, flags);
 	/* Firmware checks RNPGBE_LINK_ST (driver's last-received link state)
 	 * and only asserts LINK_CHANGE_EVT when it differs from the actual link
@@ -1541,6 +1551,7 @@ int rnpgbe_up_complete(struct mucse *mucse)
 		return err;
 	}
 
+	schedule_delayed_work(&mucse->serv_task, HZ);
 	return 0;
 }
 
@@ -1760,8 +1771,10 @@ static int rnpgbe_tx_map(struct mucse_ring *tx_ring,
 	dma_unmap_addr_set(tx_buffer, dma, 0);
 
 	for (;; frag_idx++) {
-		if (dma_mapping_error(tx_ring->dev, dma))
+		if (dma_mapping_error(tx_ring->dev, dma)) {
+			atomic64_inc(&tx_ring->stats->dma_map_failures);
 			goto err_unmap;
+		}
 
 		/* record length, and DMA address */
 		dma_unmap_len_set(tx_buffer, len, size);
@@ -1961,6 +1974,8 @@ void rnpgbe_get_stats64(struct net_device *netdev,
 		stats->rx_errors += length_errors;
 		stats->rx_length_errors += length_errors;
 	}
+
+	rnpgbe_get_hw_stats(mucse, stats);
 }
 
 static int mucse_alloc_page_pool(struct mucse_ring *rx_ring)
@@ -2259,4 +2274,9 @@ void rnpgbe_service_task(struct work_struct *work)
 	struct mucse *mucse = container_of(work, struct mucse, serv_task.work);
 
 	rnpgbe_process_link_subtask(mucse);
+	rnpgbe_update_stats(mucse);
+
+	/* Leave an immediate invocation queued by a link event unchanged. */
+	if (READ_ONCE(mucse->link_event_ready))
+		schedule_delayed_work(&mucse->serv_task, HZ);
 }
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
index 09d499dc10ee..6acc6b2df4fe 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
@@ -177,8 +177,11 @@ static void rnpgbe_sw_init(struct mucse *mucse)
 	for (i = 0; i < RNPGBE_MAX_QUEUES; i++) {
 		u64_stats_init(&mucse->tx_stats[i].syncp);
 		atomic64_set(&mucse->tx_stats[i].dropped, 0);
+		atomic64_set(&mucse->tx_stats[i].dma_map_failures, 0);
 		u64_stats_init(&mucse->rx_stats[i].syncp);
 		atomic64_set(&mucse->rx_stats[i].dropped, 0);
+		atomic64_set(&mucse->rx_stats[i].page_alloc_failures, 0);
+		atomic64_set(&mucse->rx_stats[i].skb_alloc_failures, 0);
 	}
 }
 
@@ -255,6 +258,7 @@ static int rnpgbe_add_adapter(struct pci_dev *pdev,
 
 	netdev->netdev_ops = &rnpgbe_netdev_ops;
 	netdev->ethtool_ops = &rnpgbe_ethtool_ops;
+	netdev->stat_ops = &rnpgbe_stat_ops;
 	netdev->priv_flags |= IFF_UNICAST_FLT | IFF_LIVE_ADDR_CHANGE;
 	rnpgbe_sw_init(mucse);
 	err = rnpgbe_reset_hw(hw);
@@ -314,6 +318,11 @@ static int rnpgbe_add_adapter(struct pci_dev *pdev,
 	}
 
 	netif_carrier_off(netdev);
+	err = rnpgbe_init_stats(mucse);
+	if (err) {
+		dev_err(&pdev->dev, "Read hardware counters failed %d\n", err);
+		goto err_remove_mbx;
+	}
 	err = register_netdev(netdev);
 	if (err)
 		goto err_remove_mbx;
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_stats.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_stats.c
new file mode 100644
index 000000000000..efd2284fd93a
--- /dev/null
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_stats.c
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright(c) 2022 - 2026 Mucse Corporation. */
+
+#include <linux/ethtool.h>
+#include <linux/pci.h>
+#include <net/netdev_queues.h>
+
+#include "rnpgbe.h"
+#include "rnpgbe_stats.h"
+
+struct rnpgbe_queue_stat {
+	char name[ETH_GSTRING_LEN];
+	unsigned int offset;
+};
+
+#define RNPGBE_QUEUE_STAT(_field) \
+	{ #_field, offsetof(struct mucse_queue_stats, _field) }
+
+static const struct rnpgbe_queue_stat rnpgbe_tx_queue_stats[] = {
+	RNPGBE_QUEUE_STAT(dma_map_failures),
+};
+
+static void rnpgbe_get_queue_stats_rx(struct net_device *netdev, int idx,
+				      struct netdev_queue_stats_rx *stats)
+{
+	struct mucse *mucse = netdev_priv(netdev);
+	const struct mucse_queue_stats *queue;
+	unsigned int start;
+
+	queue = &mucse->rx_stats[idx];
+	do {
+		start = u64_stats_fetch_begin(&queue->syncp);
+		stats->packets = queue->delivered_packets;
+		stats->bytes = queue->delivered_bytes;
+	} while (u64_stats_fetch_retry(&queue->syncp, start));
+	stats->alloc_fail = atomic64_read(&queue->page_alloc_failures) +
+			    atomic64_read(&queue->skb_alloc_failures);
+}
+
+static void rnpgbe_get_queue_stats_tx(struct net_device *netdev, int idx,
+				      struct netdev_queue_stats_tx *stats)
+{
+	struct mucse *mucse = netdev_priv(netdev);
+	const struct mucse_queue_stats *queue;
+	unsigned int start;
+
+	queue = &mucse->tx_stats[idx];
+	do {
+		start = u64_stats_fetch_begin(&queue->syncp);
+		stats->packets = queue->packets;
+		stats->bytes = queue->bytes;
+	} while (u64_stats_fetch_retry(&queue->syncp, start));
+}
+
+static void rnpgbe_get_base_stats(struct net_device *netdev,
+				  struct netdev_queue_stats_rx *rx,
+				  struct netdev_queue_stats_tx *tx)
+{
+	rx->packets = 0;
+	rx->bytes = 0;
+	rx->alloc_fail = 0;
+	tx->packets = 0;
+	tx->bytes = 0;
+
+	/* Queue counters persist across interface down/up. Include any queues
+	 * outside the active range when reporting device totals.
+	 */
+	netdev_stat_queue_sum(netdev, netdev->real_num_rx_queues,
+			      netdev->num_rx_queues, rx,
+			      netdev->real_num_tx_queues,
+			      netdev->num_tx_queues, tx);
+}
+
+const struct netdev_stat_ops rnpgbe_stat_ops = {
+	.get_queue_stats_rx = rnpgbe_get_queue_stats_rx,
+	.get_queue_stats_tx = rnpgbe_get_queue_stats_tx,
+	.get_base_stats = rnpgbe_get_base_stats,
+};
+
+static bool rnpgbe_read_counter(struct mucse_hw *hw, u32 reg, u32 *value)
+{
+	*value = mucse_hw_rd32(hw, reg);
+	/* A counter may legitimately be all ones. Check MMIO access using
+	 * the DMA version register before accepting such a value.
+	 */
+	return *value != U32_MAX ||
+	       mucse_hw_rd32(hw, RNPGBE_DMA_VERSION) != U32_MAX;
+}
+
+static int rnpgbe_read_stats(struct mucse *mucse, u32 *crc_errors,
+			     u32 *multicast)
+{
+	struct mucse_hw *hw = &mucse->hw;
+	int i;
+
+	if (pci_channel_offline(hw->pdev))
+		return -EIO;
+	if (!rnpgbe_read_counter(hw, RNPGBE_ETH_RX_FCS_ERRORS, crc_errors))
+		return -EIO;
+
+	for (i = 0; i < mucse->num_rx_queues; i++) {
+		u32 index = mucse->rx_ring[i]->rnpgbe_queue_idx;
+
+		if (!rnpgbe_read_counter(hw, RNPGBE_DMA_RX_MULTICAST(index),
+					 &multicast[i]))
+			return -EIO;
+	}
+
+	return 0;
+}
+
+/**
+ * rnpgbe_update_stats - Accumulate the hardware counters
+ * @mucse: device private structure
+ */
+void rnpgbe_update_stats(struct mucse *mucse)
+{
+	struct mucse_hw_stats *stats = &mucse->hw_stats;
+	u32 multicast[RNPGBE_MAX_QUEUES];
+	u32 crc_errors;
+	int i;
+
+	spin_lock_bh(&stats->lock);
+	if (rnpgbe_read_stats(mucse, &crc_errors, multicast))
+		goto unlock;
+
+	/* These counters do not clear on read or FLR. Unsigned differences
+	 * extend them across wraparound; RESET_HW clears them during probe.
+	 */
+	stats->rx_crc_errors += (u32)(crc_errors - stats->rx_crc_errors_prev);
+	stats->rx_crc_errors_prev = crc_errors;
+	for (i = 0; i < mucse->num_rx_queues; i++) {
+		stats->multicast += (u32)(multicast[i] -
+					stats->multicast_prev[i]);
+		stats->multicast_prev[i] = multicast[i];
+	}
+
+unlock:
+	spin_unlock_bh(&stats->lock);
+}
+
+/**
+ * rnpgbe_init_stats - Initialize counter snapshots after the probe reset
+ * @mucse: device private structure
+ *
+ * Return: 0 on success, -EIO if hardware counters cannot be read
+ */
+int rnpgbe_init_stats(struct mucse *mucse)
+{
+	struct mucse_hw_stats *stats = &mucse->hw_stats;
+
+	spin_lock_init(&stats->lock);
+
+	return rnpgbe_read_stats(mucse, &stats->rx_crc_errors_prev,
+				 stats->multicast_prev);
+}
+
+/**
+ * rnpgbe_get_hw_stats - Add cached counters to the interface statistics
+ * @mucse: device private structure
+ * @stats: interface statistics to update
+ */
+void rnpgbe_get_hw_stats(struct mucse *mucse, struct rtnl_link_stats64 *stats)
+{
+	spin_lock_bh(&mucse->hw_stats.lock);
+	stats->rx_crc_errors += mucse->hw_stats.rx_crc_errors;
+	stats->rx_errors += mucse->hw_stats.rx_crc_errors;
+	stats->multicast += mucse->hw_stats.multicast;
+	spin_unlock_bh(&mucse->hw_stats.lock);
+}
+
+/**
+ * rnpgbe_get_sset_count - Return the number of queue counters
+ * @netdev: network interface
+ * @sset: requested string set
+ *
+ * Return: counter count, or -EOPNOTSUPP for other string sets
+ */
+int rnpgbe_get_sset_count(struct net_device *netdev, int sset)
+{
+	struct mucse *mucse = netdev_priv(netdev);
+
+	if (sset != ETH_SS_STATS)
+		return -EOPNOTSUPP;
+
+	return mucse->num_tx_queues * ARRAY_SIZE(rnpgbe_tx_queue_stats);
+}
+
+/**
+ * rnpgbe_get_strings - Report the queue counter names
+ * @netdev: network interface
+ * @sset: requested string set
+ * @data: buffer for fixed-width counter names
+ */
+void rnpgbe_get_strings(struct net_device *netdev, u32 sset, u8 *data)
+{
+	struct mucse *mucse = netdev_priv(netdev);
+	int i, j;
+
+	if (sset != ETH_SS_STATS)
+		return;
+
+	for (i = 0; i < mucse->num_tx_queues; i++)
+		for (j = 0; j < ARRAY_SIZE(rnpgbe_tx_queue_stats); j++)
+			ethtool_sprintf(&data, "tx_queue_%d_%s", i,
+					rnpgbe_tx_queue_stats[j].name);
+}
+
+static void rnpgbe_get_queue_stats(const struct mucse_queue_stats *queue,
+				   const struct rnpgbe_queue_stat *table,
+				   unsigned int count, u64 *data)
+{
+	int i;
+
+	for (i = 0; i < count; i++) {
+		const void *counter;
+
+		counter = (const u8 *)queue + table[i].offset;
+		data[i] = atomic64_read(counter);
+	}
+}
+
+/**
+ * rnpgbe_get_ethtool_stats - Report the queue counter values
+ * @netdev: network interface
+ * @stats: ethtool statistics request
+ * @data: buffer for values in the order returned by rnpgbe_get_strings()
+ */
+void rnpgbe_get_ethtool_stats(struct net_device *netdev,
+			      struct ethtool_stats *stats, u64 *data)
+{
+	struct mucse *mucse = netdev_priv(netdev);
+	int i;
+
+	for (i = 0; i < mucse->num_tx_queues; i++) {
+		rnpgbe_get_queue_stats(&mucse->tx_stats[i],
+				       rnpgbe_tx_queue_stats,
+				       ARRAY_SIZE(rnpgbe_tx_queue_stats), data);
+		data += ARRAY_SIZE(rnpgbe_tx_queue_stats);
+	}
+}
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_stats.h b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_stats.h
new file mode 100644
index 000000000000..da43cc46e5d4
--- /dev/null
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_stats.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright(c) 2022 - 2026 Mucse Corporation. */
+
+#ifndef _RNPGBE_STATS_H
+#define _RNPGBE_STATS_H
+
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#include "rnpgbe_hw.h"
+
+struct ethtool_stats;
+struct net_device;
+struct netdev_stat_ops;
+struct rtnl_link_stats64;
+struct mucse;
+
+struct mucse_hw_stats {
+	/* Protects the hardware snapshots and software totals. */
+	spinlock_t lock;
+	u64 rx_crc_errors;
+	u64 multicast;
+	u32 rx_crc_errors_prev;
+	u32 multicast_prev[RNPGBE_MAX_QUEUES];
+};
+
+extern const struct netdev_stat_ops rnpgbe_stat_ops;
+
+int rnpgbe_init_stats(struct mucse *mucse);
+void rnpgbe_update_stats(struct mucse *mucse);
+void rnpgbe_get_hw_stats(struct mucse *mucse, struct rtnl_link_stats64 *stats);
+int rnpgbe_get_sset_count(struct net_device *netdev, int sset);
+void rnpgbe_get_strings(struct net_device *netdev, u32 sset, u8 *data);
+void rnpgbe_get_ethtool_stats(struct net_device *netdev,
+			      struct ethtool_stats *stats, u64 *data);
+
+#endif /* _RNPGBE_STATS_H */
-- 
2.50.1

