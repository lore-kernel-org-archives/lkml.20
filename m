Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437134;
	b=kQvyRz3mqgUBtbcoW+aOIaBqvSuCVtjtpoTm1NHV0SApkM2OlbxSx9xSN9ZCzgYaypKO
	 FzrxsGGeRV/b/Udyd2e6u3y20wGa97q3B2J+l/AKZ3JhBWne6r9MSrdoMuJEnyVyGNlZC
	 t9JOvJZRBnr2mwKTU7/KQQdIpfIHYsGvj6IHpD6p3BS0C0yDf5IjD4de9DJOfpuIAmxz3
	 GB2XhmD/ZhVtrFn5DYZI7BM9Xp1lQ98E/9pGSSWEaFD0R6Wl7erE6DtIF9NHvQ60pbdGd
	 FYfPiilDgUPiqmP+PaJewFPxH4Hz51O8h7rJtoW97ZCqmMTTK0n5tZepO3PAS4b2o1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gzfQZI1rm2VZmF1YeeoE1Ewgr47lTIJKShyG8VxE1jA=;
	b=yQXQorqN8iEr1OziKJvRHuhlV4RsjaGBZE8mkCpusymi5i148xJQfjvglc+BsFKIBkLf
	 JsGlxyhssCul/7huh1hddyKyUG9Li7bFHOti6hIldAIZ5lJk0edx7wLJkkTg5X292/bn+
	 hI7eIDeEPUoAY580NzbimpYqB1VKtDIaRgsgpNvZXwuKvMg4eZ9sSwbnp6wbw3mXiGdGv
	 to+j5KbgBy0BLR+frmxDJita4p0BN6SzHRuX9BEE/iZNzafvzINP8Hq4m8rBv7S+6LpXo
	 Lvm6hN+hXgWEMqz85fKMUdlxH3YhOBqq5K7qUBC9Dt6OYoZ5V1LTYs0Hw9xM/IxzmFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SjwIpUaD;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11960606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11960606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SjwIpUaD
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1e2957d7eso15373945e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792437131; x=1793041931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gzfQZI1rm2VZmF1YeeoE1Ewgr47lTIJKShyG8VxE1jA=;
        b=SjwIpUaDG5WIxCUoTVhvxb20fpXwUf8ZyR4eA9Z6gdpLWdK5bMhG7ehfmlpa1MD9vU
         1vEbsObBPiz7lBSUckmGQ+NhkSZqJE8i1iEw1KbdCGVgfNV3Wf63IS5hPB2/xNvAhLAH
         tFkI0uTkVnWwtRHkbmGzRrRjL+nmDhBICPPPXjfSl5f5maEYLiPI4uBMbMVS+6GpVmKE
         3usM8sI/atbXVJ1peTyPNg2ZLOaNzUw/2ZsDXGJmsafVMhAKm0r9rH/7wG8+9+LBB+/9
         L4Oc4z+SscmSiPBEPflhgX9XEYmZSbzqUqpGUn7u9oiVxD2+4YxFWIkP5OdjQoxPISTr
         JQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792437131; x=1793041931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gzfQZI1rm2VZmF1YeeoE1Ewgr47lTIJKShyG8VxE1jA=;
        b=2E54qKHC7qbJTHC2ZSNzZzdsT/AMiaBXgCAFduYcVgdrZs7hZ3RnQgib/MwHE8vkYf
         /VxSwqlHKLwfypgX7dAwAIqulDv6GSXyYVZwi5ZrQRSxq6rDwG28xTdW43AKcRQdI5u2
         0k3mDbiGogysQck9vM07CWA5+OTDJoAeDkS0+85A8MzoutMEmVJ/mDRxpF+dCKAeUn7F
         xmo4xbK2g2bDJaFBkU1hFKsNRyB7dcWE0s2GWjz1HFBf8Vks3Bv4TbC/ytX7vF/NqrXR
         BeNpUW6P/vyVv7czEvznDEbqOeZGGMuDdSGZFG4i1zIV1lb7R3VxELvrPwOfJjckB67u
         3HJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmDaR6LvDeRgVfcalLUqMUJckwxKvcF+ZtOpCuYjB5AT+dRRdyVe1l7kUbgGsv9fg6VjhYceDbLhQ/I54=@vger.kernel.org
X-Gm-Message-State: AFq9FYJu/g6/eC0X2KrMsY8mDsPL63lYv/X1+6k3Fc+MernU0pfNsLzt
	RiQsRhQTwtAOhGlqmvXGEWw5nROaQDD/YewI56eocnE37weB0zR9V2iK
X-Gm-Gg: AYBFou3tctRmda65sPH0xWnEg2K5a4R7zVsa9YCuqSAmIcg+qbRkS41/jI9GPm/dK0l
	MvWOcFz3ZrrXX9Qwlud2IYT9wtvpaoekfPZLOsP76WMD2TQMpbzj+UiaTNRqz8IFpMuDVHs/Ddp
	LpZNEFOhgiL2GrUmPZ2aZHaWL0vHaCbowRsIYLngzPXUYZGrxXU9fxbAWkpmQ6W+Z1icWKcbyHh
	MXhfEJML0bf5OZtk9wy7GwFb41eCSMPMO/k8LLfH6T4XwgolOlbs5e8wXMhAXGXvaI1Qg/lKeyt
	ytLuvG7HQSTO7fXpem77/hiemDm5VByd0oCCXOVszmk5Jq2DvJDFvttNdOyd3k0I6bixoD3HKXf
	EFnPNo3Mp705kySSqItnpb6QBalLLA1kBdzpii0GYFLunjUetTILiBi6NaCI3+ks/re1XDF1pB6
	uLt6Tk+yGKgUj14Z3gICBLQAEec2GZZfoIP0HbXJgpRURmxyWizu6X0UcAXv86phyhGrbsqSDLB
	IcaSuZAWGEaxP4rn7GE
X-Received: by 2002:a05:600c:19c6:b0:4a1:e01e:1927 with SMTP id 5b1f17b1804b1-4a1e01e1f69mr131227305e9.5.1792437131087;
        Mon, 19 Oct 2026 12:12:11 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan ([2a00:f44:cd2:abb8:fed9:8342:c367:f022])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818c89sm804977f8f.32.2026.10.19.12.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:12:10 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 2/2] net: dsa: qca8k: report port statistics from the MIB
Date: Mon, 19 Oct 2026 21:11:37 +0200
Message-ID: <20261019191137.307514-3-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019191137.307514-1-kuncy7@gmail.com>
References: <20261019191137.307514-1-kuncy7@gmail.com>
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

qca8k has no .get_stats64, so a user port's netdev counts only the
frames that cross the CPU port, through the DSA user netdev's own
tstats. Whatever the switch forwards between its own ports in a
hardware-offloaded bridge never reaches the CPU and never shows up in
the counters of either port. The same goes for a conduit that forwards
in hardware past the host: on a GL.iNet GL-B3000 (IPQ5018 with a
QCA8337 on SGMII) with the conduit offloaded, a 482 MB upload over the
WAN port moved the wan netdev's TX bytes by 0.74 MB, while the switch's
own TxByte counter for that port grew by 503 MB.

The switch counts every frame in its per-port MIB. .get_stats64 may be
called in atomic context, so a delayed work reads the MIB every 3 s and
.get_stats64 hands out the cached result, as ar9331 and rtl8365mb do.

With the Ethernet management path up, one autocast request returns the
MIB of every port: the autocast handler gets a mode that keeps one row
per port instead of only the port that was asked for. Otherwise the
work falls back to register reads, with the loop split out of
qca8k_get_ethtool_stats(), only for the ports that have link, and with
the high word of a 64-bit counter read around the low one.

The counters keep their value across reads (QCA8K_MIB_CPU_KEEP); only
the difference since the previous read is added, so a 32-bit counter
wrapping between two reads does not corrupt the total, and a 64-bit
sample below the previous one is dropped as a bad read. The byte
counters include the FCS, as the size buckets do, so ETH_FCS_LEN per
frame comes off. If the MIB failed to come up, the user port keeps its
own tstats. The work stops on teardown, shutdown and suspend.

An index enum for ar8327_mib[] lets the stats code name the counters it
uses.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c   | 186 +++++++++++++++++++++++++++--
 drivers/net/dsa/qca/qca8k-common.c | 137 ++++++++++++---------
 drivers/net/dsa/qca/qca8k.h        |  72 ++++++++++-
 3 files changed, 327 insertions(+), 68 deletions(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 9a8b9e34a..c95df2989 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -1450,6 +1450,7 @@ qca8k_phylink_mac_link_down(struct phylink_config *config, unsigned int mode,
 	struct dsa_port *dp = dsa_phylink_to_port(config);
 	struct qca8k_priv *priv = dp->ds->priv;
 
+	clear_bit(dp->index, &priv->mib_stats.link_map);
 	qca8k_port_set_status(priv, dp->index, 0);
 }
 
@@ -1495,6 +1496,7 @@ qca8k_phylink_mac_link_up(struct phylink_config *config,
 	reg |= QCA8K_PORT_STATUS_TXMAC | QCA8K_PORT_STATUS_RXMAC;
 
 	qca8k_write(priv, QCA8K_REG_PORT_STATUS(port), reg);
+	set_bit(port, &priv->mib_stats.link_map);
 }
 
 static struct qca8k_pcs *pcs_to_qca8k_pcs(struct phylink_pcs *pcs)
@@ -1669,17 +1671,23 @@ static void qca8k_mib_autocast_handler(struct dsa_switch *ds, struct sk_buff *sk
 	const struct qca8k_mib_desc *mib;
 	struct mib_ethhdr *mib_ethhdr;
 	__le32 *data2;
+	u64 *data;
 	u8 port;
 	int i;
 
 	mib_ethhdr = (struct mib_ethhdr *)skb_mac_header(skb);
 	mib_eth_data = &priv->mib_eth_data;
 
-	/* The switch autocast every port. Ignore other packet and
-	 * parse only the requested one.
+	/* The switch autocast every port. Parse only the requested one, or
+	 * every port into its own row for QCA8K_MIB_ALL_PORTS.
 	 */
 	port = FIELD_GET(QCA_HDR_RECV_SOURCE_PORT, ntohs(mib_ethhdr->hdr));
-	if (port != mib_eth_data->req_port)
+	if (mib_eth_data->req_port == QCA8K_MIB_ALL_PORTS &&
+	    port < QCA8K_NUM_PORTS)
+		data = mib_eth_data->data + port * QCA8K_QCA833X_MIB_COUNT;
+	else if (port == mib_eth_data->req_port)
+		data = mib_eth_data->data;
+	else
 		goto exit;
 
 	data2 = (__le32 *)skb->data;
@@ -1689,15 +1697,15 @@ static void qca8k_mib_autocast_handler(struct dsa_switch *ds, struct sk_buff *sk
 
 		/* First 3 mib are present in the skb head */
 		if (i < 3) {
-			mib_eth_data->data[i] = get_unaligned_le32(mib_ethhdr->data + i);
+			data[i] = get_unaligned_le32(mib_ethhdr->data + i);
 			continue;
 		}
 
 		/* Some mib are 64 bit wide */
 		if (mib->size == 2)
-			mib_eth_data->data[i] = get_unaligned_le64((__le64 *)data2);
+			data[i] = get_unaligned_le64((__le64 *)data2);
 		else
-			mib_eth_data->data[i] = get_unaligned_le32(data2);
+			data[i] = get_unaligned_le32(data2);
 
 		data2 += mib->size;
 	}
@@ -1708,12 +1716,9 @@ static void qca8k_mib_autocast_handler(struct dsa_switch *ds, struct sk_buff *sk
 		complete(&mib_eth_data->rw_done);
 }
 
-static int
-qca8k_get_ethtool_stats_eth(struct dsa_switch *ds, int port, u64 *data)
+static int qca8k_mib_autocast(struct qca8k_priv *priv, u8 req_port, u64 *data)
 {
-	struct dsa_port *dp = dsa_to_port(ds, port);
 	struct qca8k_mib_eth_data *mib_eth_data;
-	struct qca8k_priv *priv = ds->priv;
 	int ret;
 
 	mib_eth_data = &priv->mib_eth_data;
@@ -1722,7 +1727,7 @@ qca8k_get_ethtool_stats_eth(struct dsa_switch *ds, int port, u64 *data)
 
 	reinit_completion(&mib_eth_data->rw_done);
 
-	mib_eth_data->req_port = dp->index;
+	mib_eth_data->req_port = req_port;
 	mib_eth_data->data = data;
 	refcount_set(&mib_eth_data->port_parsed, QCA8K_NUM_PORTS);
 
@@ -1747,6 +1752,14 @@ qca8k_get_ethtool_stats_eth(struct dsa_switch *ds, int port, u64 *data)
 	return ret;
 }
 
+static int
+qca8k_get_ethtool_stats_eth(struct dsa_switch *ds, int port, u64 *data)
+{
+	struct dsa_port *dp = dsa_to_port(ds, port);
+
+	return qca8k_mib_autocast(ds->priv, dp->index, data);
+}
+
 static u32 qca8k_get_phy_flags(struct dsa_switch *ds, int port)
 {
 	struct qca8k_priv *priv = ds->priv;
@@ -1853,6 +1866,141 @@ static void qca8k_setup_hol_fixup(struct qca8k_priv *priv, int port)
 			   mask);
 }
 
+static u64 qca8k_mib_delta(struct qca8k_priv *priv, int port, int i)
+{
+	struct qca8k_mib_stats *ms = &priv->mib_stats;
+	u64 now = ms->raw[port][i];
+	u64 last = ms->last[port][i];
+
+	/* A 32-bit counter may wrap between two reads. A 64-bit one does
+	 * not, and nothing flushes the MIB after setup: a sample below the
+	 * previous one is a bad read, keep the previous one.
+	 */
+	if (ar8327_mib[i].size == 2 && now < last)
+		return 0;
+
+	ms->last[port][i] = now;
+
+	if (ar8327_mib[i].size == 1)
+		return (u32)(now - last);
+
+	return now - last;
+}
+
+/* The byte counters include the FCS, as the size buckets do */
+static u64 qca8k_mib_bytes(u64 bytes, u64 packets)
+{
+	u64 fcs = packets * ETH_FCS_LEN;
+
+	/* bytes is 0 when its sample was dropped as a bad read */
+	return bytes > fcs ? bytes - fcs : 0;
+}
+
+static void qca8k_mib_stats_update(struct qca8k_priv *priv, int port)
+{
+	struct qca8k_mib_stats *ms = &priv->mib_stats;
+	struct rtnl_link_stats64 *s = &ms->stats[port];
+	u64 d[QCA8K_QCA833X_MIB_COUNT];
+	u64 rx_packets, tx_packets;
+	int i;
+
+	for (i = 0; i < priv->info->mib_count; i++)
+		d[i] = qca8k_mib_delta(priv, port, i);
+
+	rx_packets = d[QCA8K_MIB_RX_64] + d[QCA8K_MIB_RX_128] +
+		     d[QCA8K_MIB_RX_256] + d[QCA8K_MIB_RX_512] +
+		     d[QCA8K_MIB_RX_1024] + d[QCA8K_MIB_RX_1518] +
+		     d[QCA8K_MIB_RX_MAX];
+	tx_packets = d[QCA8K_MIB_TX_64] + d[QCA8K_MIB_TX_128] +
+		     d[QCA8K_MIB_TX_256] + d[QCA8K_MIB_TX_512] +
+		     d[QCA8K_MIB_TX_1024] + d[QCA8K_MIB_TX_1518] +
+		     d[QCA8K_MIB_TX_MAX];
+
+	spin_lock_bh(&ms->lock);
+
+	s->rx_bytes += qca8k_mib_bytes(d[QCA8K_MIB_RX_GOOD_BYTE], rx_packets);
+	s->tx_bytes += qca8k_mib_bytes(d[QCA8K_MIB_TX_BYTE], tx_packets);
+	s->rx_packets += rx_packets;
+	s->tx_packets += tx_packets;
+	s->multicast += d[QCA8K_MIB_RX_MULTI];
+	s->rx_length_errors += d[QCA8K_MIB_RX_RUNT] +
+			       d[QCA8K_MIB_RX_FRAGMENT] +
+			       d[QCA8K_MIB_RX_TOO_LONG];
+	s->rx_crc_errors += d[QCA8K_MIB_RX_FCS_ERR];
+	s->rx_frame_errors += d[QCA8K_MIB_RX_ALIGN_ERR];
+	s->rx_missed_errors += d[QCA8K_MIB_RX_OVERFLOW];
+	s->rx_dropped += d[QCA8K_MIB_FILTERED];
+	s->rx_errors += d[QCA8K_MIB_RX_FCS_ERR] + d[QCA8K_MIB_RX_ALIGN_ERR] +
+			d[QCA8K_MIB_RX_RUNT] + d[QCA8K_MIB_RX_FRAGMENT] +
+			d[QCA8K_MIB_RX_OVERFLOW] + d[QCA8K_MIB_RX_TOO_LONG];
+	s->tx_fifo_errors += d[QCA8K_MIB_TX_UNDERRUN];
+	s->tx_aborted_errors += d[QCA8K_MIB_TX_ABORT_COL];
+	s->tx_window_errors += d[QCA8K_MIB_TX_LATE_COL];
+	s->tx_errors += d[QCA8K_MIB_TX_OVERSIZE] + d[QCA8K_MIB_TX_ABORT_COL] +
+			d[QCA8K_MIB_TX_UNDERRUN] + d[QCA8K_MIB_TX_LATE_COL];
+	s->collisions += d[QCA8K_MIB_TX_COLLISION];
+
+	spin_unlock_bh(&ms->lock);
+}
+
+static void qca8k_mib_stats_poll(struct work_struct *work)
+{
+	struct qca8k_priv *priv = container_of(work, struct qca8k_priv,
+					       mib_stats.work.work);
+	struct qca8k_mib_stats *ms = &priv->mib_stats;
+	bool autocast = false;
+	struct dsa_port *dp;
+	int port;
+
+	/* One autocast request returns the MIB of every port */
+	if (priv->mgmt_conduit)
+		autocast = qca8k_mib_autocast(priv, QCA8K_MIB_ALL_PORTS,
+					      &ms->raw[0][0]) > 0;
+
+	dsa_switch_for_each_user_port(dp, priv->ds) {
+		port = dp->index;
+
+		if (!autocast) {
+			/* Register reads are slow, skip ports without link.
+			 * Their counters keep their value, so the next read
+			 * still adds everything since the previous one.
+			 */
+			if (!test_bit(port, &ms->link_map))
+				continue;
+			if (qca8k_mib_read(priv, port, ms->raw[port]))
+				continue;
+		}
+
+		qca8k_mib_stats_update(priv, port);
+	}
+
+	schedule_delayed_work(&ms->work, QCA8K_MIB_STATS_INTERVAL);
+}
+
+static void qca8k_get_stats64(struct dsa_switch *ds, int port,
+			      struct rtnl_link_stats64 *s)
+{
+	struct qca8k_priv *priv = ds->priv;
+	struct qca8k_mib_stats *ms = &priv->mib_stats;
+
+	/* Without the MIB keep what the user port counts itself */
+	if (!ms->enabled) {
+		dev_get_tstats64(dsa_to_port(ds, port)->user, s);
+		return;
+	}
+
+	spin_lock_bh(&ms->lock);
+	*s = ms->stats[port];
+	spin_unlock_bh(&ms->lock);
+}
+
+static void qca8k_teardown(struct dsa_switch *ds)
+{
+	struct qca8k_priv *priv = ds->priv;
+
+	cancel_delayed_work_sync(&priv->mib_stats.work);
+}
+
 static int
 qca8k_setup(struct dsa_switch *ds)
 {
@@ -1911,6 +2059,7 @@ qca8k_setup(struct dsa_switch *ds)
 	ret = qca8k_mib_init(priv);
 	if (ret)
 		dev_warn(priv->dev, "mib init failed");
+	priv->mib_stats.enabled = !ret;
 
 	/* Initial setup of all ports */
 	dsa_switch_for_each_port(dp, ds) {
@@ -2022,6 +2171,10 @@ qca8k_setup(struct dsa_switch *ds)
 	/* Set max number of LAGs supported */
 	ds->num_lag_ids = QCA8K_NUM_LAGS;
 
+	if (priv->mib_stats.enabled)
+		schedule_delayed_work(&priv->mib_stats.work,
+				      QCA8K_MIB_STATS_INTERVAL);
+
 	return 0;
 }
 
@@ -2035,9 +2188,11 @@ static const struct phylink_mac_ops qca8k_phylink_mac_ops = {
 static const struct dsa_switch_ops qca8k_switch_ops = {
 	.get_tag_protocol	= qca8k_get_tag_protocol,
 	.setup			= qca8k_setup,
+	.teardown		= qca8k_teardown,
 	.get_strings		= qca8k_get_strings,
 	.get_ethtool_stats	= qca8k_get_ethtool_stats,
 	.get_sset_count		= qca8k_get_sset_count,
+	.get_stats64		= qca8k_get_stats64,
 	.set_ageing_time	= qca8k_set_ageing_time,
 	.support_eee		= dsa_supports_eee,
 	.set_mac_eee		= qca8k_set_mac_eee,
@@ -2124,6 +2279,9 @@ qca8k_sw_probe(struct mdio_device *mdiodev)
 	mutex_init(&priv->mib_eth_data.mutex);
 	init_completion(&priv->mib_eth_data.rw_done);
 
+	spin_lock_init(&priv->mib_stats.lock);
+	INIT_DELAYED_WORK(&priv->mib_stats.work, qca8k_mib_stats_poll);
+
 	priv->ds->dev = &mdiodev->dev;
 	priv->ds->num_ports = QCA8K_NUM_PORTS;
 	priv->ds->priv = priv;
@@ -2157,6 +2315,8 @@ static void qca8k_sw_shutdown(struct mdio_device *mdiodev)
 	if (!priv)
 		return;
 
+	/* .teardown does not run on this path */
+	cancel_delayed_work_sync(&priv->mib_stats.work);
 	dsa_switch_shutdown(priv->ds);
 
 	dev_set_drvdata(&mdiodev->dev, NULL);
@@ -2183,6 +2343,7 @@ static int qca8k_suspend(struct device *dev)
 {
 	struct qca8k_priv *priv = dev_get_drvdata(dev);
 
+	cancel_delayed_work_sync(&priv->mib_stats.work);
 	qca8k_set_pm(priv, 0);
 
 	return dsa_switch_suspend(priv->ds);
@@ -2193,6 +2354,9 @@ static int qca8k_resume(struct device *dev)
 	struct qca8k_priv *priv = dev_get_drvdata(dev);
 
 	qca8k_set_pm(priv, 1);
+	if (priv->mib_stats.enabled)
+		schedule_delayed_work(&priv->mib_stats.work,
+				      QCA8K_MIB_STATS_INTERVAL);
 
 	return dsa_switch_resume(priv->ds);
 }
diff --git a/drivers/net/dsa/qca/qca8k-common.c b/drivers/net/dsa/qca/qca8k-common.c
index ab978cc83..232367892 100644
--- a/drivers/net/dsa/qca/qca8k-common.c
+++ b/drivers/net/dsa/qca/qca8k-common.c
@@ -20,49 +20,51 @@
 	}
 
 const struct qca8k_mib_desc ar8327_mib[] = {
-	MIB_DESC(1, 0x00, "RxBroad"),
-	MIB_DESC(1, 0x04, "RxPause"),
-	MIB_DESC(1, 0x08, "RxMulti"),
-	MIB_DESC(1, 0x0c, "RxFcsErr"),
-	MIB_DESC(1, 0x10, "RxAlignErr"),
-	MIB_DESC(1, 0x14, "RxRunt"),
-	MIB_DESC(1, 0x18, "RxFragment"),
-	MIB_DESC(1, 0x1c, "Rx64Byte"),
-	MIB_DESC(1, 0x20, "Rx128Byte"),
-	MIB_DESC(1, 0x24, "Rx256Byte"),
-	MIB_DESC(1, 0x28, "Rx512Byte"),
-	MIB_DESC(1, 0x2c, "Rx1024Byte"),
-	MIB_DESC(1, 0x30, "Rx1518Byte"),
-	MIB_DESC(1, 0x34, "RxMaxByte"),
-	MIB_DESC(1, 0x38, "RxTooLong"),
-	MIB_DESC(2, 0x3c, "RxGoodByte"),
-	MIB_DESC(2, 0x44, "RxBadByte"),
-	MIB_DESC(1, 0x4c, "RxOverFlow"),
-	MIB_DESC(1, 0x50, "Filtered"),
-	MIB_DESC(1, 0x54, "TxBroad"),
-	MIB_DESC(1, 0x58, "TxPause"),
-	MIB_DESC(1, 0x5c, "TxMulti"),
-	MIB_DESC(1, 0x60, "TxUnderRun"),
-	MIB_DESC(1, 0x64, "Tx64Byte"),
-	MIB_DESC(1, 0x68, "Tx128Byte"),
-	MIB_DESC(1, 0x6c, "Tx256Byte"),
-	MIB_DESC(1, 0x70, "Tx512Byte"),
-	MIB_DESC(1, 0x74, "Tx1024Byte"),
-	MIB_DESC(1, 0x78, "Tx1518Byte"),
-	MIB_DESC(1, 0x7c, "TxMaxByte"),
-	MIB_DESC(1, 0x80, "TxOverSize"),
-	MIB_DESC(2, 0x84, "TxByte"),
-	MIB_DESC(1, 0x8c, "TxCollision"),
-	MIB_DESC(1, 0x90, "TxAbortCol"),
-	MIB_DESC(1, 0x94, "TxMultiCol"),
-	MIB_DESC(1, 0x98, "TxSingleCol"),
-	MIB_DESC(1, 0x9c, "TxExcDefer"),
-	MIB_DESC(1, 0xa0, "TxDefer"),
-	MIB_DESC(1, 0xa4, "TxLateCol"),
-	MIB_DESC(1, 0xa8, "RXUnicast"),
-	MIB_DESC(1, 0xac, "TXUnicast"),
+	[QCA8K_MIB_RX_BROAD]		= MIB_DESC(1, 0x00, "RxBroad"),
+	[QCA8K_MIB_RX_PAUSE]		= MIB_DESC(1, 0x04, "RxPause"),
+	[QCA8K_MIB_RX_MULTI]		= MIB_DESC(1, 0x08, "RxMulti"),
+	[QCA8K_MIB_RX_FCS_ERR]		= MIB_DESC(1, 0x0c, "RxFcsErr"),
+	[QCA8K_MIB_RX_ALIGN_ERR]	= MIB_DESC(1, 0x10, "RxAlignErr"),
+	[QCA8K_MIB_RX_RUNT]		= MIB_DESC(1, 0x14, "RxRunt"),
+	[QCA8K_MIB_RX_FRAGMENT]		= MIB_DESC(1, 0x18, "RxFragment"),
+	[QCA8K_MIB_RX_64]		= MIB_DESC(1, 0x1c, "Rx64Byte"),
+	[QCA8K_MIB_RX_128]		= MIB_DESC(1, 0x20, "Rx128Byte"),
+	[QCA8K_MIB_RX_256]		= MIB_DESC(1, 0x24, "Rx256Byte"),
+	[QCA8K_MIB_RX_512]		= MIB_DESC(1, 0x28, "Rx512Byte"),
+	[QCA8K_MIB_RX_1024]		= MIB_DESC(1, 0x2c, "Rx1024Byte"),
+	[QCA8K_MIB_RX_1518]		= MIB_DESC(1, 0x30, "Rx1518Byte"),
+	[QCA8K_MIB_RX_MAX]		= MIB_DESC(1, 0x34, "RxMaxByte"),
+	[QCA8K_MIB_RX_TOO_LONG]		= MIB_DESC(1, 0x38, "RxTooLong"),
+	[QCA8K_MIB_RX_GOOD_BYTE]	= MIB_DESC(2, 0x3c, "RxGoodByte"),
+	[QCA8K_MIB_RX_BAD_BYTE]		= MIB_DESC(2, 0x44, "RxBadByte"),
+	[QCA8K_MIB_RX_OVERFLOW]		= MIB_DESC(1, 0x4c, "RxOverFlow"),
+	[QCA8K_MIB_FILTERED]		= MIB_DESC(1, 0x50, "Filtered"),
+	[QCA8K_MIB_TX_BROAD]		= MIB_DESC(1, 0x54, "TxBroad"),
+	[QCA8K_MIB_TX_PAUSE]		= MIB_DESC(1, 0x58, "TxPause"),
+	[QCA8K_MIB_TX_MULTI]		= MIB_DESC(1, 0x5c, "TxMulti"),
+	[QCA8K_MIB_TX_UNDERRUN]		= MIB_DESC(1, 0x60, "TxUnderRun"),
+	[QCA8K_MIB_TX_64]		= MIB_DESC(1, 0x64, "Tx64Byte"),
+	[QCA8K_MIB_TX_128]		= MIB_DESC(1, 0x68, "Tx128Byte"),
+	[QCA8K_MIB_TX_256]		= MIB_DESC(1, 0x6c, "Tx256Byte"),
+	[QCA8K_MIB_TX_512]		= MIB_DESC(1, 0x70, "Tx512Byte"),
+	[QCA8K_MIB_TX_1024]		= MIB_DESC(1, 0x74, "Tx1024Byte"),
+	[QCA8K_MIB_TX_1518]		= MIB_DESC(1, 0x78, "Tx1518Byte"),
+	[QCA8K_MIB_TX_MAX]		= MIB_DESC(1, 0x7c, "TxMaxByte"),
+	[QCA8K_MIB_TX_OVERSIZE]		= MIB_DESC(1, 0x80, "TxOverSize"),
+	[QCA8K_MIB_TX_BYTE]		= MIB_DESC(2, 0x84, "TxByte"),
+	[QCA8K_MIB_TX_COLLISION]	= MIB_DESC(1, 0x8c, "TxCollision"),
+	[QCA8K_MIB_TX_ABORT_COL]	= MIB_DESC(1, 0x90, "TxAbortCol"),
+	[QCA8K_MIB_TX_MULTI_COL]	= MIB_DESC(1, 0x94, "TxMultiCol"),
+	[QCA8K_MIB_TX_SINGLE_COL]	= MIB_DESC(1, 0x98, "TxSingleCol"),
+	[QCA8K_MIB_TX_EXC_DEFER]	= MIB_DESC(1, 0x9c, "TxExcDefer"),
+	[QCA8K_MIB_TX_DEFER]		= MIB_DESC(1, 0xa0, "TxDefer"),
+	[QCA8K_MIB_TX_LATE_COL]		= MIB_DESC(1, 0xa4, "TxLateCol"),
+	[QCA8K_MIB_RX_UNICAST]		= MIB_DESC(1, 0xa8, "RXUnicast"),
+	[QCA8K_MIB_TX_UNICAST]		= MIB_DESC(1, 0xac, "TXUnicast"),
 };
 
+static_assert(ARRAY_SIZE(ar8327_mib) == QCA8K_QCA833X_MIB_COUNT);
+
 int qca8k_read(struct qca8k_priv *priv, u32 reg, u32 *val)
 {
 	return regmap_read(priv->regmap, reg, val);
@@ -487,37 +489,62 @@ void qca8k_get_strings(struct dsa_switch *ds, int port, u32 stringset,
 		ethtool_puts(&data, ar8327_mib[i].name);
 }
 
-void qca8k_get_ethtool_stats(struct dsa_switch *ds, int port,
-			     uint64_t *data)
+/* Read the MIB of one port with register reads, one value per ar8327_mib[]
+ * entry. A counter that cannot be read keeps its old value in data[]; the
+ * last error is returned.
+ */
+int qca8k_mib_read(struct qca8k_priv *priv, int port, u64 *data)
 {
-	struct qca8k_priv *priv = ds->priv;
 	const struct qca8k_mib_desc *mib;
-	u32 reg, i, val;
+	u32 reg, i, val, hi2;
+	int err = 0;
 	u32 hi = 0;
 	int ret;
 
-	if (priv->mgmt_conduit && priv->info->ops->autocast_mib &&
-	    priv->info->ops->autocast_mib(ds, port, data) > 0)
-		return;
-
 	for (i = 0; i < priv->info->mib_count; i++) {
 		mib = &ar8327_mib[i];
 		reg = QCA8K_PORT_MIB_COUNTER(port) + mib->offset;
 
-		ret = qca8k_read(priv, reg, &val);
-		if (ret < 0)
-			continue;
-
+		/* The two halves of a 64-bit counter are separate reads: read
+		 * the high word around the low one and take the low word
+		 * again if a carry got in between.
+		 */
 		if (mib->size == 2) {
 			ret = qca8k_read(priv, reg + 4, &hi);
-			if (ret < 0)
-				continue;
+			if (!ret)
+				ret = qca8k_read(priv, reg, &val);
+			if (!ret)
+				ret = qca8k_read(priv, reg + 4, &hi2);
+			if (!ret && hi2 != hi) {
+				hi = hi2;
+				ret = qca8k_read(priv, reg, &val);
+			}
+		} else {
+			ret = qca8k_read(priv, reg, &val);
+		}
+		if (ret < 0) {
+			err = ret;
+			continue;
 		}
 
 		data[i] = val;
 		if (mib->size == 2)
 			data[i] |= (u64)hi << 32;
 	}
+
+	return err;
+}
+
+void qca8k_get_ethtool_stats(struct dsa_switch *ds, int port,
+			     uint64_t *data)
+{
+	struct qca8k_priv *priv = ds->priv;
+
+	if (priv->mgmt_conduit && priv->info->ops->autocast_mib &&
+	    priv->info->ops->autocast_mib(ds, port, data) > 0)
+		return;
+
+	qca8k_mib_read(priv, port, data);
 }
 
 int qca8k_get_sset_count(struct dsa_switch *ds, int port, int sset)
diff --git a/drivers/net/dsa/qca/qca8k.h b/drivers/net/dsa/qca/qca8k.h
index 956338893..5912117fc 100644
--- a/drivers/net/dsa/qca/qca8k.h
+++ b/drivers/net/dsa/qca/qca8k.h
@@ -31,6 +31,9 @@
 
 #define QCA8K_QCA832X_MIB_COUNT				39
 #define QCA8K_QCA833X_MIB_COUNT				41
+#define QCA8K_MIB_STATS_INTERVAL			(3 * HZ)
+/* qca8k_mib_autocast() request for every port at once */
+#define QCA8K_MIB_ALL_PORTS				0xff
 
 #define QCA8K_BUSY_WAIT_TIMEOUT				2000
 
@@ -373,6 +376,52 @@ enum qca8k_mid_cmd {
 	QCA8K_MIB_CAST = 3,
 };
 
+/* Index of each counter in ar8327_mib[] */
+enum qca8k_mib_idx {
+	QCA8K_MIB_RX_BROAD,
+	QCA8K_MIB_RX_PAUSE,
+	QCA8K_MIB_RX_MULTI,
+	QCA8K_MIB_RX_FCS_ERR,
+	QCA8K_MIB_RX_ALIGN_ERR,
+	QCA8K_MIB_RX_RUNT,
+	QCA8K_MIB_RX_FRAGMENT,
+	QCA8K_MIB_RX_64,
+	QCA8K_MIB_RX_128,
+	QCA8K_MIB_RX_256,
+	QCA8K_MIB_RX_512,
+	QCA8K_MIB_RX_1024,
+	QCA8K_MIB_RX_1518,
+	QCA8K_MIB_RX_MAX,
+	QCA8K_MIB_RX_TOO_LONG,
+	QCA8K_MIB_RX_GOOD_BYTE,
+	QCA8K_MIB_RX_BAD_BYTE,
+	QCA8K_MIB_RX_OVERFLOW,
+	QCA8K_MIB_FILTERED,
+	QCA8K_MIB_TX_BROAD,
+	QCA8K_MIB_TX_PAUSE,
+	QCA8K_MIB_TX_MULTI,
+	QCA8K_MIB_TX_UNDERRUN,
+	QCA8K_MIB_TX_64,
+	QCA8K_MIB_TX_128,
+	QCA8K_MIB_TX_256,
+	QCA8K_MIB_TX_512,
+	QCA8K_MIB_TX_1024,
+	QCA8K_MIB_TX_1518,
+	QCA8K_MIB_TX_MAX,
+	QCA8K_MIB_TX_OVERSIZE,
+	QCA8K_MIB_TX_BYTE,
+	QCA8K_MIB_TX_COLLISION,
+	QCA8K_MIB_TX_ABORT_COL,
+	QCA8K_MIB_TX_MULTI_COL,
+	QCA8K_MIB_TX_SINGLE_COL,
+	QCA8K_MIB_TX_EXC_DEFER,
+	QCA8K_MIB_TX_DEFER,
+	QCA8K_MIB_TX_LATE_COL,
+	/* QCA833x only */
+	QCA8K_MIB_RX_UNICAST,
+	QCA8K_MIB_TX_UNICAST,
+};
+
 struct qca8k_priv;
 
 struct qca8k_info_ops {
@@ -403,8 +452,25 @@ struct qca8k_mib_eth_data {
 	struct completion rw_done;
 	struct mutex mutex; /* Process one command at time */
 	refcount_t port_parsed; /* Counter to track parsed port */
-	u8 req_port;
-	u64 *data; /* pointer to ethtool data */
+	u8 req_port; /* or QCA8K_MIB_ALL_PORTS */
+	/* ethtool data, or one QCA8K_QCA833X_MIB_COUNT row per port */
+	u64 *data;
+};
+
+/* .get_stats64 is called in atomic context and the MIB sits behind MDIO or
+ * the Ethernet management frames, so a delayed work reads it and keeps the
+ * result. The MIB counters keep their value across reads; last[] holds the
+ * previous raw values so only the difference is added, and a 32-bit counter
+ * may wrap between two reads.
+ */
+struct qca8k_mib_stats {
+	struct delayed_work work;
+	spinlock_t lock; /* protects stats[] against the work */
+	bool enabled; /* the MIB came up, the work runs */
+	unsigned long link_map; /* ports with link up */
+	struct rtnl_link_stats64 stats[QCA8K_NUM_PORTS];
+	u64 last[QCA8K_NUM_PORTS][QCA8K_QCA833X_MIB_COUNT];
+	u64 raw[QCA8K_NUM_PORTS][QCA8K_QCA833X_MIB_COUNT];
 };
 
 struct qca8k_ports_config {
@@ -469,6 +535,7 @@ struct qca8k_priv {
 	struct qca8k_pcs pcs_port_6;
 	const struct qca8k_match_data *info;
 	struct qca8k_led ports_led[QCA8K_LED_COUNT];
+	struct qca8k_mib_stats mib_stats;
 };
 
 struct qca8k_mib_desc {
@@ -514,6 +581,7 @@ int qca8k_rmw(struct qca8k_priv *priv, u32 reg, u32 mask, u32 write_val);
 void qca8k_fdb_flush(struct qca8k_priv *priv);
 
 /* Common ethtool stats function */
+int qca8k_mib_read(struct qca8k_priv *priv, int port, u64 *data);
 void qca8k_get_strings(struct dsa_switch *ds, int port, u32 stringset, uint8_t *data);
 void qca8k_get_ethtool_stats(struct dsa_switch *ds, int port,
 			     uint64_t *data);
-- 
2.43.0

