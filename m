Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895384;
	b=GX70MKVOQ5khEGQ12L+H/qkeuu2Sbol7oTqE94ohbL09fw3/t9QezMUiyRNLw2uE6cUu
	 9S+ivhSbpi+pOzLB7xY1V2mRFRyW2/5xacUS4k4TiJNckQocbxFZgIiprLxpshPhWUdn6
	 6LbzmJdVX6aJZBaL/vAQ8EeuVnke9MWsNhFNPTk8MlvddVbQCXTJqLz6Tuti/BfYffIpd
	 12JqmtN06Pr5zdedcxbq0wBp+2tjInQefpikI0TaAvvgCeo02Ko+xatBM1utHQCXitQF9
	 kB3geMY7Dsh2YdSmmOCb4GQ9KbCh1OFFSodgFbbd0029XBgMzpxxfYNVIc9uUPXl8VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895384;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=cRr0qqIBfgLLZzf9gUafSZNE5x+BviBuvttjr+z1RdA=;
	b=4NfNCk/Tr9B+GN4kVC9f2oWVhjzJ/0XuDUqLVSpEAiRktZjLKAlFBJ15v7W1ls4p9skS
	 a67dFvqTEuKCgxEjndkiompwq1Bb4wS4+pEyaINyVGZPXp/KUjJXNQbWOlzsxdc2faYPN
	 mGyagmV2ljBL7W4U0vI1Zr2SwV/iKNr/YipeuZGcH+0MLZtoDZSJoRkypo2/bTNjvgaPf
	 NSZjtt/da2qKMH2aTA9VZ+0oS2+PDWJWQbgFV9M/moANNPJEHhCsr1AksyoX1BgDF0kaJ
	 2sT96nrDLVq6lM6o6oDWcqQik8c6RfJFIdUHX3eZTyRA46HJgTF8JK1cHcU63xqJyeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realsil.com.cn;
	spf=pass smtp.mailfrom=realsil.com.cn;
	dkim=pass header.d=realsil.com.cn header.i=@realsil.com.cn header.a=rsa-sha256 header.s=dkim header.b=rFp3RMAG;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AC9606A329;
	Tue, 17 Nov 2026 06:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4AC9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.a=rsa-sha256 header.s=dkim header.b=rFp3RMAG
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH61PvF44166715, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1794895285;
	bh=cRr0qqIBfgLLZzf9gUafSZNE5x+BviBuvttjr+z1RdA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=rFp3RMAGvQP1p/ginvwjrBEeoFq4apu6nTaflr6Pb348RhbpJypIzbrAHUWUTtJNO
	 5IYW9zkFzeRCGf/OeHiPpnuVrGo1C/GFEiW4bkhmvcJLNlBhPRnkORnbP1wB5hlAhC
	 ALquM3Jkjb2N79KEcWoPh1Low388Ngp7QPYz3fzVqBNE/+D3BJfokVHHlCPiPqUXIL
	 1b2QE51CNQPlh8k2Mz1kihmv9r+PpbKuIZlLdgUpVznKztz52xoTEGiLoyLyLOPdNX
	 AUQVPslPveCZm7Z/h8EsLHhqM6UcIzGQz6yTURB4Ryt4gDRKce7yZpYaTYnRCwBPbb
	 U+wgKdvPX9WVA==
Received: from RS-EX-MBS1.realsil.com.cn ([172.29.17.101])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH61PvF44166715
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 14:01:25 +0800
Received: from RS-EX-MBS1.realsil.com.cn (172.29.17.101) by
 RS-EX-MBS1.realsil.com.cn (172.29.17.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 14:01:24 +0800
Received: from 172.29.37.154 (172.29.37.152) by RS-EX-MBS1.realsil.com.cn
 (172.29.17.101) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Tue, 17 Nov 2026 14:01:24 +0800
From: javen <javen_xu@realsil.com.cn>
To: <andrew@lunn.ch>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <nb@tipi-net.de>, <maxime.chevallier@bootlin.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<daniel@makrotopia.org>, <vladimir.oltean@nxp.com>, Javen Xu
	<javen_xu@realsil.com.cn>
Subject: [PATCH net-next v3 3/3] net: phy: realtek: add hardware timestamping for RTL8127a
Date: Tue, 17 Nov 2026 14:01:20 +0800
Message-ID: <20261117060120.1175-4-javen_xu@realsil.com.cn>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261117060120.1175-1-javen_xu@realsil.com.cn>
References: <20261117060120.1175-1-javen_xu@realsil.com.cn>
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

From: Javen Xu <javen_xu@realsil.com.cn>

The PTP block of the RTL8127a internal PHY also timestamps PTPv2 event
messages over UDP in both directions. Register a mii_timestamper for it,
so the PHY can provide hardware timestamps without any support from the
MAC driver.

The timestamps are read out over MDIO, which may sleep, so this is done
from the PTP aux worker. Received packets are queued until their
timestamp has been read, transmitted packets are completed once the
hardware reports their timestamp.

The hardware only keeps the most recent timestamp per message type and
direction and does not record the sequenceId. Hence only one TX
timestamp can be pending at a time, it is dropped if nothing arrives
within 15 seconds, and an RX timestamp may be overwritten by a later
message of the same type before it has been read.

Signed-off-by: Javen Xu <javen_xu@realsil.com.cn>
---
Changes in v3:
   - Only take TX skbs which requested a hardware timestamp and only
     PTPv2 event messages
   - Latch the TX timestamp of the recorded message type, fail on timeout
     instead of falling back to Sync
   - Bound the RX queue, ignore PTPv1
   - Only update the cached config after programming the hardware, only
     reprogram the hardware on an on/off change
   - Drop a pending TX skb when TX timestamping is turned off
   - Back off in the aux worker instead of busy polling
   - Restore timestamping in config_init()
   - Document the per message type limitation
   - Move the NETWORK_PHY_TIMESTAMPING dependency to patch 1
   - Only support PTPv2 over UDP, drop the L2 and any other layer filters
---
 drivers/net/phy/realtek/Kconfig       |   8 +-
 drivers/net/phy/realtek/realtek_ptp.c | 391 +++++++++++++++++++++++++-
 2 files changed, 390 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/realtek/Kconfig b/drivers/net/phy/realtek/Kconfig
index feb9a7fd1582..8a928de89287 100644
--- a/drivers/net/phy/realtek/Kconfig
+++ b/drivers/net/phy/realtek/Kconfig
@@ -19,9 +19,9 @@ config REALTEK_PHY_PTP
 	depends on PTP_1588_CLOCK && NETWORK_PHY_TIMESTAMPING
 	depends on !(REALTEK_PHY=y && PTP_1588_CLOCK=m)
 	help
-	  Optional PTP hardware clock support for the internal PHY of
-	  RTL8127A. The clock is provided by the PHY itself and can be
-	  read and adjusted through the PTP clock device, no support from
-	  the MAC driver is needed.
+	  Optional PTP hardware clock and hardware timestamping support
+	  for the internal PHY of RTL8127A. The PHY registers a PTP clock
+	  and timestamps PTPv2 event messages over UDP on behalf of the
+	  MAC, so no support from the MAC driver is needed.
 
 endif # REALTEK_PHY
diff --git a/drivers/net/phy/realtek/realtek_ptp.c b/drivers/net/phy/realtek/realtek_ptp.c
index 9622571249f4..6caa7d112584 100644
--- a/drivers/net/phy/realtek/realtek_ptp.c
+++ b/drivers/net/phy/realtek/realtek_ptp.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * PTP hardware clock support for the internal PHY of RTL8127A
+ * PTP hardware clock and timestamping support for the internal PHY of
+ * RTL8127A
  */
 
 #include <linux/bitfield.h>
@@ -9,7 +10,9 @@
 #include <linux/math64.h>
 #include <linux/netdevice.h>
 #include <linux/phy.h>
+#include <linux/ptp_classify.h>
 #include <linux/ptp_clock_kernel.h>
+#include <linux/skbuff.h>
 #include <linux/timekeeping.h>
 
 #include "realtek.h"
@@ -31,8 +34,18 @@
 #define RTL8127A_PTP_RESET_SEC		10
 #define RTL8127A_PHY_RST_CTL		0xa640
 #define RTL8127A_PHY_RST		BIT(15)
-/* Time registers */
+#define RTL8127A_PTP_TRX_TS_STA		0xe430
+#define	RTL8127A_PTP_TRX_TS_RD		BIT(0)
+#define	RTL8127A_PTP_TRX_TS_SEL_RX	BIT(1)
+#define	RTL8127A_PTP_TRX_TS_MSGTYPE	GENMASK(3, 2)
+#define	RTL8127A_PTP_TRX_TS_EXEC	BIT(4)
+#define	RTL8127A_PTP_TX_PDLYRSP_RDY	BIT(12)
+#define	RTL8127A_PTP_TX_PDLYREQ_RDY	BIT(13)
+#define	RTL8127A_PTP_TX_DLYREQ_RDY	BIT(14)
+#define	RTL8127A_PTP_TX_SYNC_RDY	BIT(15)
+/* Time registers, CFG_TIME for the clock, TRX_TS_TIME for packets */
 #define RTL8127A_PTP_CFG_TIME		0xe412
+#define RTL8127A_PTP_TRX_TS_TIME	0xe446
 #define	RTL8127A_PTP_NS_LO		0x0
 #define	RTL8127A_PTP_NS_HI		0x2
 #define	RTL8127A_PTP_S_LO		0x4
@@ -44,6 +57,9 @@
 #define	RTL8127A_PTP_RATE_HI_MASK	GENMASK(21, 16)
 
 #define RTL8127A_PTP_MAX_ADJ		488281
+#define RTL8127A_PTP_TX_TIMEOUT		(15 * HZ)
+#define RTL8127A_PTP_TX_POLL_FAST	msecs_to_jiffies(2)
+#define RTL8127A_PTP_RX_QUEUE_MAX	64
 
 /* RTL8127A_PTP_CLK_CFG clock adjust modes */
 enum rtl8127a_ptp_clkadj_mode {
@@ -54,11 +70,33 @@ enum rtl8127a_ptp_clkadj_mode {
 	RTL8127A_PTP_RATE_WRITE		= 14,
 };
 
+/* ptp->state bits */
+enum rtl8127a_ptp_state {
+	RTL8127A_PTP_TX_IN_PROGRESS,
+};
+
+struct rtl8127a_ptp_skb_cb {
+	u8 msgtype;
+};
+
+#define RTL8127A_PTP_SKB_CB(skb) \
+	((struct rtl8127a_ptp_skb_cb *)(skb)->cb)
+
 struct rtl8127a_ptp {
 	struct phy_device *phydev;
+	struct mii_timestamper mii_ts;
 	struct ptp_clock_info info;
 	struct ptp_clock *clock;
 	struct mutex lock;	/* serializes PTP register access sequences */
+	enum hwtstamp_tx_types tx_type;
+	enum hwtstamp_rx_filters rx_filter;
+	bool rx_enabled;
+	bool hw_enabled;
+	struct sk_buff_head rx_queue;
+	struct sk_buff *tx_skb;
+	unsigned long tx_start;
+	u8 tx_msgtype;
+	unsigned long state;
 };
 
 static int rtl8127a_ptp_read(struct rtl8127a_ptp *ptp, u16 reg)
@@ -189,6 +227,53 @@ static int rtl8127a_ptp_write_time(struct rtl8127a_ptp *ptp,
 	return 0;
 }
 
+/* Latch the RX or TX timestamp of the given message type into the
+ * RTL8127A_PTP_TRX_TS_TIME registers.
+ */
+static int rtl8127a_ptp_trx_ts_cmd(struct rtl8127a_ptp *ptp, u16 cmd)
+{
+	int ret;
+
+	ret = rtl8127a_ptp_modify(ptp, RTL8127A_PTP_TRX_TS_STA,
+				  RTL8127A_PTP_TRX_TS_SEL_RX |
+				  RTL8127A_PTP_TRX_TS_MSGTYPE,
+				  RTL8127A_PTP_TRX_TS_RD | cmd);
+	if (ret)
+		return ret;
+
+	ret = rtl8127a_ptp_poll(ptp, RTL8127A_PTP_TRX_TS_STA,
+				RTL8127A_PTP_TRX_TS_RD, false);
+
+	return ret < 0 ? ret : 0;
+}
+
+static const u16 rtl8127a_ptp_tx_rdy[] = {
+	[PTP_MSGTYPE_SYNC]		= RTL8127A_PTP_TX_SYNC_RDY,
+	[PTP_MSGTYPE_DELAY_REQ]		= RTL8127A_PTP_TX_DLYREQ_RDY,
+	[PTP_MSGTYPE_PDELAY_REQ]	= RTL8127A_PTP_TX_PDLYREQ_RDY,
+	[PTP_MSGTYPE_PDELAY_RESP]	= RTL8127A_PTP_TX_PDLYRSP_RDY,
+};
+
+static int rtl8127a_ptp_egress_time(struct rtl8127a_ptp *ptp, u8 msgtype,
+				    struct timespec64 *ts)
+{
+	int ret;
+
+	ret = rtl8127a_ptp_poll(ptp, RTL8127A_PTP_TRX_TS_STA,
+				rtl8127a_ptp_tx_rdy[msgtype], true);
+	if (ret < 0)
+		return ret;
+
+	ret = rtl8127a_ptp_trx_ts_cmd(ptp,
+				      FIELD_PREP(RTL8127A_PTP_TRX_TS_MSGTYPE,
+						 msgtype) |
+				      RTL8127A_PTP_TRX_TS_EXEC);
+	if (ret)
+		return ret;
+
+	return rtl8127a_ptp_read_time(ptp, RTL8127A_PTP_TRX_TS_TIME, ts);
+}
+
 static int rtl8127a_ptp_hwtstamp_enable(struct rtl8127a_ptp *ptp, bool enable)
 {
 	int ret;
@@ -323,6 +408,107 @@ static int rtl8127a_ptp_settime64(struct ptp_clock_info *info,
 	return rtl8127a_ptp_settime(ptp, ts);
 }
 
+static void rtl8127a_ptp_tx_complete(struct rtl8127a_ptp *ptp,
+				     struct skb_shared_hwtstamps *hwts)
+{
+	struct sk_buff *skb = ptp->tx_skb;
+
+	ptp->tx_skb = NULL;
+	clear_bit_unlock(RTL8127A_PTP_TX_IN_PROGRESS, &ptp->state);
+
+	if (hwts)
+		skb_complete_tx_timestamp(skb, hwts);
+	else
+		kfree_skb(skb);
+}
+
+/* Returns true if no TX timestamp is pending anymore */
+static bool rtl8127a_ptp_tx_tstamp(struct rtl8127a_ptp *ptp)
+{
+	struct skb_shared_hwtstamps hwts = {};
+	struct timespec64 ts;
+	int ret;
+
+	/* Pairs with smp_store_release() in rtl8127a_ptp_txtstamp() */
+	if (!smp_load_acquire(&ptp->tx_skb))
+		return true;
+
+	mutex_lock(&ptp->lock);
+
+	/* Give up if TX timestamping was turned off or nothing arrived */
+	if (READ_ONCE(ptp->tx_type) != HWTSTAMP_TX_ON ||
+	    time_is_before_jiffies(ptp->tx_start + RTL8127A_PTP_TX_TIMEOUT)) {
+		rtl8127a_ptp_write(ptp, RTL8127A_PTP_INSR,
+				   RTL8127A_PTP_INT_TX_TS);
+		mutex_unlock(&ptp->lock);
+
+		rtl8127a_ptp_tx_complete(ptp, NULL);
+		return true;
+	}
+
+	ret = rtl8127a_ptp_read(ptp, RTL8127A_PTP_INSR);
+	if (ret < 0 || !(ret & RTL8127A_PTP_INT_TX_TS)) {
+		mutex_unlock(&ptp->lock);
+		return false;
+	}
+
+	ret = rtl8127a_ptp_write(ptp, RTL8127A_PTP_INSR,
+				 RTL8127A_PTP_INT_TX_TS);
+	if (!ret)
+		ret = rtl8127a_ptp_egress_time(ptp, ptp->tx_msgtype, &ts);
+
+	mutex_unlock(&ptp->lock);
+
+	if (ret) {
+		rtl8127a_ptp_tx_complete(ptp, NULL);
+		return true;
+	}
+
+	hwts.hwtstamp = timespec64_to_ktime(ts);
+	rtl8127a_ptp_tx_complete(ptp, &hwts);
+
+	return true;
+}
+
+static void rtl8127a_ptp_rx_tstamp(struct rtl8127a_ptp *ptp,
+				   struct sk_buff *skb)
+{
+	u8 msgtype = RTL8127A_PTP_SKB_CB(skb)->msgtype;
+	struct timespec64 ts;
+	int ret;
+
+	mutex_lock(&ptp->lock);
+	ret = rtl8127a_ptp_trx_ts_cmd(ptp, RTL8127A_PTP_TRX_TS_SEL_RX |
+					   FIELD_PREP(RTL8127A_PTP_TRX_TS_MSGTYPE,
+						      msgtype) |
+					   RTL8127A_PTP_TRX_TS_EXEC);
+	if (!ret)
+		ret = rtl8127a_ptp_read_time(ptp, RTL8127A_PTP_TRX_TS_TIME,
+					     &ts);
+	mutex_unlock(&ptp->lock);
+
+	if (!ret)
+		skb_hwtstamps(skb)->hwtstamp = timespec64_to_ktime(ts);
+
+	netif_rx(skb);
+}
+
+static long rtl8127a_ptp_do_aux_work(struct ptp_clock_info *info)
+{
+	struct rtl8127a_ptp *ptp = container_of(info, struct rtl8127a_ptp, info);
+	struct sk_buff *skb;
+
+	while ((skb = skb_dequeue(&ptp->rx_queue)))
+		rtl8127a_ptp_rx_tstamp(ptp, skb);
+
+	if (rtl8127a_ptp_tx_tstamp(ptp))
+		return -1;
+
+	/* The TX timestamp is normally ready right away, back off after that */
+	return time_before(jiffies, ptp->tx_start + RTL8127A_PTP_TX_POLL_FAST) ?
+	       0 : 1;
+}
+
 static const struct ptp_clock_info rtl8127a_ptp_info = {
 	.owner		= THIS_MODULE,
 	.name		= "RTL8127A PHC",
@@ -331,8 +517,172 @@ static const struct ptp_clock_info rtl8127a_ptp_info = {
 	.adjtime	= rtl8127a_ptp_adjtime,
 	.gettimex64	= rtl8127a_ptp_gettimex64,
 	.settime64	= rtl8127a_ptp_settime64,
+	.do_aux_work	= rtl8127a_ptp_do_aux_work,
 };
 
+static void rtl8127a_ptp_txtstamp(struct mii_timestamper *mii_ts,
+				  struct sk_buff *skb, int type)
+{
+	struct rtl8127a_ptp *ptp = container_of(mii_ts, struct rtl8127a_ptp,
+						mii_ts);
+	struct ptp_header *hdr;
+	u8 msgtype;
+
+	if (READ_ONCE(ptp->tx_type) != HWTSTAMP_TX_ON ||
+	    !(skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) ||
+	    (type & PTP_CLASS_VMASK) != PTP_CLASS_V2 ||
+	    (type & PTP_CLASS_PMASK) == PTP_CLASS_L2)
+		goto drop;
+
+	hdr = ptp_parse_header(skb, type);
+	if (!hdr)
+		goto drop;
+
+	/* Only event messages are timestamped by the hardware */
+	msgtype = ptp_get_msgtype(hdr, type);
+	if (msgtype > PTP_MSGTYPE_PDELAY_RESP)
+		goto drop;
+
+	/* Only one TX timestamp can be pending at a time */
+	if (test_and_set_bit_lock(RTL8127A_PTP_TX_IN_PROGRESS, &ptp->state))
+		goto drop;
+
+	skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
+	ptp->tx_msgtype = msgtype;
+	ptp->tx_start = jiffies;
+	/* Publish tx_msgtype and tx_start before tx_skb to the aux worker */
+	smp_store_release(&ptp->tx_skb, skb);
+	ptp_schedule_worker(ptp->clock, 0);
+	return;
+
+drop:
+	kfree_skb(skb);
+}
+
+static bool rtl8127a_ptp_rxtstamp(struct mii_timestamper *mii_ts,
+				  struct sk_buff *skb, int type)
+{
+	struct rtl8127a_ptp *ptp = container_of(mii_ts, struct rtl8127a_ptp,
+						mii_ts);
+	struct ptp_header *hdr;
+	u8 msgtype;
+
+	if (!READ_ONCE(ptp->rx_enabled) ||
+	    (type & PTP_CLASS_VMASK) != PTP_CLASS_V2 ||
+	    (type & PTP_CLASS_PMASK) == PTP_CLASS_L2 ||
+	    skb_queue_len_lockless(&ptp->rx_queue) >= RTL8127A_PTP_RX_QUEUE_MAX)
+		return false;
+
+	hdr = ptp_parse_header(skb, type);
+	if (!hdr)
+		return false;
+
+	/* Only event messages are timestamped by the hardware */
+	msgtype = ptp_get_msgtype(hdr, type);
+	if (msgtype > PTP_MSGTYPE_PDELAY_RESP)
+		return false;
+
+	RTL8127A_PTP_SKB_CB(skb)->msgtype = msgtype;
+	skb_queue_tail(&ptp->rx_queue, skb);
+	ptp_schedule_worker(ptp->clock, 0);
+
+	return true;
+}
+
+static int rtl8127a_ptp_hwtstamp_get(struct mii_timestamper *mii_ts,
+				     struct kernel_hwtstamp_config *config)
+{
+	struct rtl8127a_ptp *ptp = container_of(mii_ts, struct rtl8127a_ptp,
+						mii_ts);
+
+	config->tx_type = ptp->tx_type;
+	config->rx_filter = ptp->rx_filter;
+
+	return 0;
+}
+
+static int rtl8127a_ptp_hwtstamp_set(struct mii_timestamper *mii_ts,
+				     struct kernel_hwtstamp_config *config,
+				     struct netlink_ext_ack *extack)
+{
+	struct rtl8127a_ptp *ptp = container_of(mii_ts, struct rtl8127a_ptp,
+						mii_ts);
+	bool enable = false;
+	bool rx_enabled;
+	int ret;
+
+	if (config->flags)
+		return -EINVAL;
+
+	switch (config->tx_type) {
+	case HWTSTAMP_TX_ON:
+		enable = true;
+		break;
+	case HWTSTAMP_TX_OFF:
+		break;
+	default:
+		return -ERANGE;
+	}
+
+	switch (config->rx_filter) {
+	case HWTSTAMP_FILTER_NONE:
+		rx_enabled = false;
+		break;
+	case HWTSTAMP_FILTER_PTP_V2_L4_EVENT:
+	case HWTSTAMP_FILTER_PTP_V2_L4_SYNC:
+	case HWTSTAMP_FILTER_PTP_V2_L4_DELAY_REQ:
+		config->rx_filter = HWTSTAMP_FILTER_PTP_V2_L4_EVENT;
+		rx_enabled = true;
+		enable = true;
+		break;
+	default:
+		return -ERANGE;
+	}
+
+	/* The hardware is either on or off, only reprogram it on a change */
+	if (enable != ptp->hw_enabled) {
+		/* Stop timestamping before turning the hardware off */
+		if (!enable) {
+			WRITE_ONCE(ptp->tx_type, HWTSTAMP_TX_OFF);
+			WRITE_ONCE(ptp->rx_enabled, false);
+		}
+
+		ret = rtl8127a_ptp_hwtstamp_enable(ptp, enable);
+		if (ret)
+			return ret;
+
+		ptp->hw_enabled = enable;
+	}
+
+	ptp->rx_filter = config->rx_filter;
+	WRITE_ONCE(ptp->rx_enabled, rx_enabled);
+	WRITE_ONCE(ptp->tx_type, config->tx_type);
+	/* Let the aux worker drop a TX timestamp that is no longer wanted */
+	ptp_schedule_worker(ptp->clock, 0);
+
+	return 0;
+}
+
+static int rtl8127a_ptp_ts_info(struct mii_timestamper *mii_ts,
+				struct kernel_ethtool_ts_info *info)
+{
+	struct rtl8127a_ptp *ptp = container_of(mii_ts, struct rtl8127a_ptp,
+						mii_ts);
+
+	info->so_timestamping = SOF_TIMESTAMPING_TX_SOFTWARE |
+				SOF_TIMESTAMPING_TX_HARDWARE |
+				SOF_TIMESTAMPING_RX_HARDWARE |
+				SOF_TIMESTAMPING_RAW_HARDWARE;
+	info->phc_index = ptp_clock_index(ptp->clock);
+	info->tx_types = BIT(HWTSTAMP_TX_OFF) | BIT(HWTSTAMP_TX_ON);
+	info->rx_filters = BIT(HWTSTAMP_FILTER_NONE) |
+			   BIT(HWTSTAMP_FILTER_PTP_V2_L4_EVENT) |
+			   BIT(HWTSTAMP_FILTER_PTP_V2_L4_SYNC) |
+			   BIT(HWTSTAMP_FILTER_PTP_V2_L4_DELAY_REQ);
+
+	return 0;
+}
+
 int rtl8127a_ptp_config_init(struct phy_device *phydev)
 {
 	struct rtl8127a_ptp *ptp = phydev->priv;
@@ -350,12 +700,24 @@ int rtl8127a_ptp_config_init(struct phy_device *phydev)
 	if (ret)
 		return ret;
 
-	if (ts.tv_sec >= RTL8127A_PTP_RESET_SEC)
+	if (ts.tv_sec < RTL8127A_PTP_RESET_SEC) {
+		ktime_get_real_ts64(&ts);
+		ret = rtl8127a_ptp_settime(ptp, &ts);
+		if (ret)
+			return ret;
+	}
+
+	/* Restore timestamping in case the PTP block was reset */
+	if (!ptp->hw_enabled)
 		return 0;
 
-	ktime_get_real_ts64(&ts);
+	ret = rtl8127a_ptp_read(ptp, RTL8127A_PTP_CTL);
+	if (ret < 0)
+		return ret;
+	if (!(ret & RTL8127A_PTP_CTL_EN))
+		return rtl8127a_ptp_hwtstamp_enable(ptp, true);
 
-	return rtl8127a_ptp_settime(ptp, &ts);
+	return 0;
 }
 
 int rtl8127a_ptp_probe(struct phy_device *phydev)
@@ -374,6 +736,9 @@ int rtl8127a_ptp_probe(struct phy_device *phydev)
 
 	ptp->phydev = phydev;
 	ptp->info = rtl8127a_ptp_info;
+	ptp->tx_type = HWTSTAMP_TX_OFF;
+	ptp->rx_filter = HWTSTAMP_FILTER_NONE;
+	skb_queue_head_init(&ptp->rx_queue);
 
 	ret = rtl8127a_ptp_hwtstamp_enable(ptp, false);
 	if (ret)
@@ -383,7 +748,15 @@ int rtl8127a_ptp_probe(struct phy_device *phydev)
 	if (IS_ERR(ptp->clock))
 		return PTR_ERR(ptp->clock);
 
+	ptp->mii_ts.rxtstamp = rtl8127a_ptp_rxtstamp;
+	ptp->mii_ts.txtstamp = rtl8127a_ptp_txtstamp;
+	ptp->mii_ts.hwtstamp_set = rtl8127a_ptp_hwtstamp_set;
+	ptp->mii_ts.hwtstamp_get = rtl8127a_ptp_hwtstamp_get;
+	ptp->mii_ts.ts_info = rtl8127a_ptp_ts_info;
+
 	phydev->priv = ptp;
+	phydev->mii_ts = &ptp->mii_ts;
+	phydev->default_timestamp = true;
 
 	return 0;
 }
@@ -395,7 +768,15 @@ void rtl8127a_ptp_remove(struct phy_device *phydev)
 	if (!ptp)
 		return;
 
+	phydev->mii_ts = NULL;
+	phydev->default_timestamp = false;
+
 	rtl8127a_ptp_hwtstamp_enable(ptp, false);
+	/* Also stops the aux worker */
 	ptp_clock_unregister(ptp->clock);
+
+	if (ptp->tx_skb)
+		rtl8127a_ptp_tx_complete(ptp, NULL);
+	skb_queue_purge(&ptp->rx_queue);
 	phydev->priv = NULL;
 }
-- 
2.43.0

