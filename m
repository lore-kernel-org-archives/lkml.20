Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798697;
	b=TEmnV5GNmfYuvI/uQM64spFgXbHWBS3s/g9BZrgGyzCMfeLh+yF82GOiwze+BbTpBeJw
	 tuOrIucg6OWM4eRXb6RtyznG9GhbFByBGJ2cLMjFkHqQIEh4UUIkje0GhpZZSv9K+Vt0o
	 3RfgGgZ8Dj/q6NxSwOEM8lqEmdlaZbPpPUYNQgEs1xzHxvNi56fVfREDxV/TBD1dLZeUx
	 QxQMAhFu+SO6r8Da3/5qtmfeyVuYph7ut7A3Q+dBBTIU/QFhDfKQKTwT5Spn3LHe7AOE4
	 QbsGw4W1lnAbHi+/aHXHvup9HSdESNkHzqG8n9K5OAO2AFx4fRSN3Z+FwDIdKCriJpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798697;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=aHDGvFyOFOjlryEFtwwUmBfYJuoDmCS44D7VU3VcUEQ=;
	b=qsldIy2Dl50d5V/XKdNWsUXaHMn0GiBCwDVXkaXK+Dh8iab+mJJ+JXMX4lUrIoc9+zQz
	 J+k1NA/MTeisFRYuXCnLZI/lMXWvuzqHkQO+KMdXroZgpXeafUnmC0uQe3I/W+bagpW6q
	 s2JV2E/JgW09RjkH/WwxHrhdvQI3GydrvxNtDfZ4kdOo40HQc9JjaoALSFUmWx1uTY1bm
	 cZZ53vaWO9EdArjcTCQj2brB7CdLEsYVpauB3DyUTXPNPItP1TtSxtFE77pcOQmig5TQe
	 Zz+sWFCEx3OUvWgdN+KLW8XAysot2Yhcd3E+QSnnLRrlXoAuSE43MFVXfBC27gMW84A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mucse.com;
	spf=pass smtp.mailfrom=mucse.com;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFB2606A321;
	Mon, 16 Nov 2026 03:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EFB2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: zesmtpgz6t1794798647t0dec48f5
X-QQ-Originating-IP: tKj3qL7kOXtUcZcDijFJ9EcxlUGCOWfAF2gIlkD5rjg=
Received: from nic-Precision-5820-Tower.tail7b ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 16 Nov 2026 11:10:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11674134289201909850
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
Subject: [PATCH net-next v2 4/5] net: rnpgbe: Allow changing the primary MAC address
Date: Mon, 16 Nov 2026 11:10:43 +0800
Message-ID: <99BAB5054BCA5D1D+20261116031043.1330324-1-dong100@mucse.com>
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
X-QQ-XMAILINFO: OGZxhFXqN7PJiSzDwXzr9p2SwLn+cUPCwj/PltTQ63npymBQZPq5xQ3t
	P3fRn2y/WDInOc6ln7BJgjo1P+ylIt7YEj3HGYMqLiOxkkdfen7ndlW/o3NcWXtCgPgE05W
	hLaOCEeBI18j0X4DQa577j6bILqcXjrlocvy+qZ31YgaBGN9xE7bvIuKhNvYHgl/dODUXLB
	6bRlsI2RMPQtPCMiuBMAsDUftSidlwhQvCg5W1tGfVGks2LQyfWhrKcVwzJhGUsOwx2Ti8b
	gLSSsXps6n4qxipWeAvxCMQy7vNPM+QLFiWtSunH4JVgwYBXdv/Xl+P6XRc1PPWAJdM7Xsn
	gPhz93oMjxnHA7PLpv5J67dCvE0Da8bhzZqc3bvfDp0yWBPc4bdoMffNqcMJzn/oeUjD/eh
	s2WBmVXVQy0g1iiuOajp/V4wdUHZ8qVwL2QPaQcsF2OPsKTTZfFPBdUiQBzLkHgokn7Ion7
	uuRs45d6FulRQAqWSjR+nJ/0Ien8XRd7Tj7jY8U3+VxU+MG7yFoBKg5q8FNOY4+FpNWZVol
	OBWYrr3nbFZUhsvB14ltYT3fzw9xKfykFGmFNc7lz6IKHifJz9q9RKUrSJGht/R0JKBS8DJ
	ZXSe6rs1/5XfB0xoZIldKTG9G1XRXoXPwVHlfOxuXdxyG9H2sUJjxpYeYTL6AGLaj7AeiE/
	+CX02SVMfeuy03YLwSeiY0oaEsz1Y1ywbfUXvRbtJmihXMNOmEQPoSVO61o/WIXv1IniI9E
	LBOEMhBMa74Nq3JwCMR+WLYdPk0wBjAYdQAASUK7wkkD+h1u2QSQx4iTkEM0hAVvmVR9sqO
	gZYSKsUmYR1fNHWLJOOcy5xthjhKYygRERpHUng8qyZ8YKzJESeLvNFoXvblEVAdOq6Qq5Q
	/xC0PotB5LXKP4vDfohNu+4mJ7B1y2+kLtrj5Hr1qWs6U1e8my9owpdlNImmDeMMUemB30I
	/FaYtcMjhD0HuKbjWLvXJplbJ3DaLU/nC05W6Fxe0bOzACic1/q0S3N83U6QCZukLlldTGP
	dxdfaTWBOpXnhNSLxYU5hESMfYzdtV8Po00xr3rY5jL0aHj3tIxnRkjiu4IMMaTipCSZveI
	A==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

Add ndo_set_mac_address support to change the primary MAC address
while the interface is up or down. Validate the new address with the
standard Ethernet helpers, then update the primary receive address
filter and the netdev address.

Also validate the Ethernet address before opening the interface using
eth_validate_addr.

Signed-off-by: Dong Yibo <dong100@mucse.com>
---
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h    |  1 +
 .../net/ethernet/mucse/rnpgbe/rnpgbe_chip.c   | 23 +++++++++++++++++++
 .../net/ethernet/mucse/rnpgbe/rnpgbe_main.c   |  4 +++-
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
index 83267d475257..8574377e3a22 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
@@ -269,6 +269,7 @@ int rnpgbe_init_hw(struct mucse_hw *hw, int board_type);
 int rnpgbe_set_rx_mode(struct net_device *netdev,
 		       struct netdev_hw_addr_list *uc,
 		       struct netdev_hw_addr_list *mc);
+int rnpgbe_set_mac_address(struct net_device *netdev, void *addr);
 void rnpgbe_set_link(struct mucse_hw *hw, bool linkup);
 
 extern const struct ethtool_ops rnpgbe_ethtool_ops;
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
index a6ab94bd1578..7505c9f6c79d 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
@@ -232,6 +232,29 @@ static void rnpgbe_clear_rar(struct mucse_hw *hw, u32 index)
 	mucse_hw_wr32(hw, RNPGBE_RX_RAR_LOW(index), 0);
 }
 
+/**
+ * rnpgbe_set_mac_address - Change the interface's primary MAC address
+ * @netdev: network interface
+ * @addr: socket address containing the new MAC address
+ *
+ * Return: 0 on success, negative errno for an invalid address
+ */
+int rnpgbe_set_mac_address(struct net_device *netdev, void *addr)
+{
+	struct mucse *mucse = netdev_priv(netdev);
+	struct sockaddr *sa = addr;
+	int err;
+
+	err = eth_prepare_mac_addr_change(netdev, addr);
+	if (err)
+		return err;
+
+	rnpgbe_set_rar(&mucse->hw, 0, sa->sa_data);
+	eth_commit_mac_addr_change(netdev, addr);
+
+	return 0;
+}
+
 int rnpgbe_set_rx_mode(struct net_device *netdev,
 		       struct netdev_hw_addr_list *uc,
 		       struct netdev_hw_addr_list *mc)
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
index 31871b244882..09d499dc10ee 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
@@ -160,6 +160,8 @@ static const struct net_device_ops rnpgbe_netdev_ops = {
 	.ndo_stop		 = rnpgbe_close,
 	.ndo_start_xmit		 = rnpgbe_xmit_frame,
 	.ndo_set_rx_mode_async = rnpgbe_set_rx_mode,
+	.ndo_set_mac_address	 = rnpgbe_set_mac_address,
+	.ndo_validate_addr	 = eth_validate_addr,
 	.ndo_get_stats64	 = rnpgbe_get_stats64,
 };
 
@@ -253,7 +255,7 @@ static int rnpgbe_add_adapter(struct pci_dev *pdev,
 
 	netdev->netdev_ops = &rnpgbe_netdev_ops;
 	netdev->ethtool_ops = &rnpgbe_ethtool_ops;
-	netdev->priv_flags |= IFF_UNICAST_FLT;
+	netdev->priv_flags |= IFF_UNICAST_FLT | IFF_LIVE_ADDR_CHANGE;
 	rnpgbe_sw_init(mucse);
 	err = rnpgbe_reset_hw(hw);
 	if (err) {
-- 
2.50.1

