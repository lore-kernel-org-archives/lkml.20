Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794681019;
	b=ELAU/9In+9DSjFkMsqEtxJPRQzc3lfXN2CarKYBHbb0gb8XSdqB8XUZ8CCsRPwvE2bsZ
	 Ct/tjQymMpVAUi6TAu72x0rBIm4gFdgMAbw+5A8szd8AcdczwOd3/BT8GkEha2+1yALnN
	 hYYv/7ypbi8UV5jFsYibZF1nowAVALO1CU9mVschig3lqs/Kg52iqh/l3Ac/1uagyYyuZ
	 oDXS9M+l1/oSM9Y2zXlfNF6bxOkzTB5XwSRGC9Lyx7bjgWKt013usRTWiUzD23d0qmqvL
	 B4El/0gd4HQ4jEY9Pers2TYGQ0kJKmzSGRE3CkjkOaFTPaghjJZpLoJHnP6UBqPqw8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794681019;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ilRL7cK2LBDopcFZAPiZRvg+gkOiER3QXsBGOMEZnl0=;
	b=K/1eUw42IB74zQ7/dptbiscibkthfQFP3Y3nIXw7poIj86zXoRvOqq5eXVd74zax3Mf7
	 vIPzoI3MEXet03sVwFjH+FevWB6dHluGYe83jNf+sMu36SmBjmaNhzzWjO2M9sfnMrYjV
	 ovCYpV9xw9pWR8Lo7DDOeVY0Hh1N0wEwuwa9qBAzpSG2p1FNbFOCLWeoCLFItkp6qYFzQ
	 ocAG8VrmL5PbSpRF/PDeWw2ajB47LrdEi8/7tgJfp3tPEh2PKZH6FpPYvwAoE75QFF15r
	 pvwMmwGpiSdvMEcORBFw7bi+2zghuJexndu/HbWLO9//d2PXkV/vuPiBXwgO7wrq/Mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="V/rasCM1";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.53
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010053.outbound.protection.outlook.com [52.101.85.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD616606A334;
	Sat, 14 Nov 2026 18:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD616606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=V/rasCM1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9BX5Mm5ytge/pGsDBdLh9UKBaUixoa8GObiCUqswAnQvGN03VeQEkZKdrt30WSV4es0fq1pvh1P5QUJeigqs2IcAbWoHvQ/4qxQmpTtHRq1uHW2Fyykcii+/7nYy1B2jtcxmWqkp2fuooIN+9zsI0cdvjXUeORU24EFwaMkQxp6Byit6HDcjDdQUeqv1lYJVkAYMTyCmyhoGevLDlViYiDIdR4AxEYIiwycMAaiUuDvuU4QEq4aTaea00kB7tiSOAcw9X1UkCP49MFca0Z0VR3sApC8WHXE80xKAaDVFKwLU62m/WZH69S23z6a8QHOaAWi6hu3U+NyCaAxGB6alg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilRL7cK2LBDopcFZAPiZRvg+gkOiER3QXsBGOMEZnl0=;
 b=mIZhtzJqA4uGVSzYUvXa3M9Nq98KMa7RnCzOk0GjG7H9YHvFuphoiKsrq1BXkumbH0Q6+E+Qaaa1vo3zd63qNxDiblt6ahplKgU/abXbXiIm583ykCmM9WVYzdm5CD02DoLLgHQPzKTQAOSu677UsP5LYrMHJfBGkLv958q8gZNjqufRk0eERoHK13f8hRrBl7KxDl3cm7frpP7MVcI+OXj6bq2Py3o5MGYmIaHYrwIAH/0NeU9NQCRwTbi/ON7eK5ujJSioutdX/ZpAd4hvwYyPaJutcm6WOTDJ8vET+IIUwQd6TzE48qqFBGSbFHkCz2CCSVFxrgSAXZ6nXC4FZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilRL7cK2LBDopcFZAPiZRvg+gkOiER3QXsBGOMEZnl0=;
 b=V/rasCM1mUpii3EMtzm6J8R7F1iCU9lphT1CaQ9ZJrNUSEJ929FhMukwDFOeptyAUs0o1kVnYcqWcKJKg6SBn0jB4ucStldfTDC1/NgqTn4iZGOYC/9hkXn2tWUZBn4yiHkc610idKNf9rFDa9Fb6RSc8OvyVoJ8tAQ4nEtsE2E=
Received: from BN9PR03CA0239.namprd03.prod.outlook.com (2603:10b6:408:f8::34)
 by SA1PR12MB6798.namprd12.prod.outlook.com (2603:10b6:806:25a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Sat, 14 Nov
 2026 18:30:14 +0000
Received: from BN7PEPF00000092.namprd03.prod.outlook.com
 (2603:10b6:408:f8:cafe::6e) by BN9PR03CA0239.outlook.office365.com
 (2603:10b6:408:f8::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Sat, 14
 Nov 2026 18:30:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF00000092.mail.protection.outlook.com (10.167.245.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 14 Nov 2026 18:30:13 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 14 Nov
 2026 12:30:11 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 14 Nov
 2026 12:30:10 -0600
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sat, 14 Nov 2026 12:30:06 -0600
From: Suraj Gupta <suraj.gupta2@amd.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Michal Simek <michal.simek@amd.com>, Russell King <linux@armlinux.org.uk>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH net-next v5 3/6] net: xilinx: axienet: Propagate device reset failure from ndo_open
Date: Sat, 14 Nov 2026 23:59:44 +0530
Message-ID: <20261114182947.2908628-4-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261114182947.2908628-1-suraj.gupta2@amd.com>
References: <20261114182947.2908628-1-suraj.gupta2@amd.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000092:EE_|SA1PR12MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: e4512d1f-20d6-4286-f33b-08df427d52f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|36860700016|1800799024|23010399003|376014|11063799006|56012099006|18002099003|22082099003|261009223027099003|10067099003|261026140227099003|261021123027099003|261021121427099003|261022075727099003|261022105027099003|261102123227099003|261028144727099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	UIpsePTO/ZhD1nV848s4o53I28pL8R6nQfn/d35e2oKAwcROKTueLFz3RMMFwGh83yRHkOP9dWg/Zw3vZZAMC00bwxERQV0JiA4svDl07IID58qUKNIysCsePw0se67kyvfHj/Ei+jtuy6iHq+5qitF2XMgrB1dDKC+WAv99aCXMjiEzB+iJqu+9GXBSYQeAYG7QiIohXYG4kD6j7RZdnPkMvJs81cCfYB6R6TR7YNy8HdKLDJOOu/LpMKiz8NhUwTS/0/ECNgY7LQ/KCuCLmp0VAiEQJ1wX4bStDMDwVfvsRC1p2/2ALXTfJs0H4m44CsMENErf/L5Nwlvek88pdYMmZSMumhytbvhDjsgnmufI3q/Kiy29rtA7+zcujF+6m8bcuYSwWBiSMAUUE2CjauInLyTEu2QtKBGFWg5TsT5t7FB4t+6mFGZvwvrLuQ4ZnfDdGtNfGcMthNFszw81AZhXstMBCrjjAaCoyrzt7fFEGPVVJHyqfZvPIFL7saRxyDT+CBNqax4CIvjXNBLPHZTNE72t1QiTxC8KbZ8+29n1y03JUyKUTqQZrB5CrdU4l6SvGeZdLXjw37u4iHIf+nW2+KWX/O3FvEUWc4aMHpVvv7NF+lhCRs63PAfoaoFUmk7qb7vC6sAllYQarLOZNJUom5exvpi/t9DtK7/POFLEBRt8aV/hgGYNvxya41h0+MSk+L7vnruzf2jdItWinA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(18002099003)(22082099003)(261009223027099003)(10067099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261102123227099003)(261028144727099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YtCTNklKVxacNLAr2vPHxMPPMdDSIxxwhcTTdZ3XTo/X1DezcqU/dlPiTNTgEL2E6Kec0D5Ax4oelgDW/fzG9KOqU3IuDjWWcF2FkZ1p8yq8sqaHfmQP+Gs9xewVcF4yN57BQD8dnifzk+R+5jL2nei2LnWCH3p1aiMPMQx7UIcHeGJjf0I8fvlWrqXSHDnZZRtTrjBftEH+2l8oVzp0ki5UDq9QiOdF0tpq6TlvK/dqAveleUha3kKgE3g3VmrdSFTVb5LwDmHr2+F1csXe65K2X6PSS7wIv0hm+RZ9OzWZxt2Ddn3uEW+Jmh924A92eO/N197kU7WHnPcZvnzLAkPWIYqv2NkErrDljYfPPHEAgZEikprjKP7nKTIGGZ1RiFNVPeoZBfV9veIrW7TiM0N25+sbyuz1Lf3IMSVZKwsE8WFrhcLnvpHj1gR+UP7p
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 18:30:13.9964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4512d1f-20d6-4286-f33b-08df427d52f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF00000092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6798

axienet_open() overwrites the axienet_device_reset() return value with the
phylink_fwnode_phy_connect() one before it is ever checked, so a failed
reset brings the device up anyway. Check and propagate it.

That makes a failed ndo_open reachable, which matters for axienet_resume():
it calls ndo_open directly, so unlike the netdev core it leaves the device
running when open fails. A later ndo_stop then tears down resources that
open had already unwound and never re-created. For the dmaengine flow that
is a double free of the skb rings and a second dma_release_channel(); for
the non-dmaengine flow it is napi_disable() on an already disabled NAPI,
which never returns, and free_irq() on interrupts that were never
requested.

Track whether ndo_open completed and make axienet_stop() a no-op otherwise.

axienet_resume() now propagates the error, but it still has to undo the
netif_device_detach() that axienet_suspend() did. Leaving the device
detached while it is still IFF_UP wedges the interface: ndo_stop is a
no-op, so bringing it down appears to work, while bringing it up again
fails with -ENODEV because the device is not present. Drop IFF_UP with
netif_close() before reattaching, so the interface can be brought up again
once the cause of the failure is resolved, and so the stack cannot
transmit on the datapath open has already torn down.

Clearing the error path of __axienet_device_reset() goes with this: it
jumps over the block that clears lp->reset_in_progress, and the statistics
work that used to clear it on the next run is no longer scheduled once the
reset error is propagated. Without this, axienet_stat() would keep
returning the frozen base after a reset timeout.

Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet.h  |  2 +
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 44 +++++++++++++++++--
 2 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
index a87cfa079502..140383749996 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
@@ -526,6 +526,7 @@ struct skbuf_dma_descriptor {
  * @stopping:   Set when we are about to stop the device: makes @dma_err_task
  *              a no-op (legacy DMA path) and fences RX descriptor
  *              resubmission in axienet_dma_rx_cb() (dmaengine path).
+ * @datapath_up: Set while the resources allocated by ndo_open are live.
  * @tx_irq:	Axidma TX IRQ number
  * @rx_irq:	Axidma RX IRQ number
  * @eth_irq:	Ethernet core IRQ number
@@ -608,6 +609,7 @@ struct axienet_local {
 
 	struct work_struct dma_err_task;
 	bool stopping;
+	bool datapath_up;
 
 	int tx_irq;
 	int rx_irq;
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 83f35effbf37..f338029cf870 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -702,6 +702,17 @@ static int __axienet_device_reset(struct axienet_local *lp)
 	}
 
 out:
+	/* On failure the block above is skipped, so clear the flag here.
+	 * axienet_open() now returns on a reset error without scheduling the
+	 * statistics work that used to clear it, which would otherwise leave
+	 * axienet_stat() returning the frozen base until a reset succeeds.
+	 */
+	if (ret && (lp->features & XAE_FEATURE_STATS)) {
+		write_seqcount_begin(&lp->hw_stats_seqcount);
+		lp->reset_in_progress = false;
+		write_seqcount_end(&lp->hw_stats_seqcount);
+	}
+
 	mutex_unlock(&lp->stats_lock);
 	return ret;
 }
@@ -1772,6 +1783,10 @@ static int axienet_open(struct net_device *ndev)
 	axienet_lock_mii(lp);
 	ret = axienet_device_reset(ndev);
 	axienet_unlock_mii(lp);
+	if (ret) {
+		dev_err(lp->dev, "axienet_device_reset() failed: %d\n", ret);
+		return ret;
+	}
 
 	ret = phylink_fwnode_phy_connect(lp->phylink, dev_fwnode(lp->dev), 0);
 	if (ret) {
@@ -1802,6 +1817,8 @@ static int axienet_open(struct net_device *ndev)
 			goto err_phy;
 	}
 
+	lp->datapath_up = true;
+
 	return 0;
 
 err_free_eth_irq:
@@ -1830,6 +1847,16 @@ static int axienet_stop(struct net_device *ndev)
 	struct axienet_local *lp = netdev_priv(ndev);
 	int i;
 
+	/* axienet_resume() calls ndo_open directly, so unlike the netdev core
+	 * it can leave the device running after a failed open. Tearing down
+	 * below would then stop a phylink that open already stopped and
+	 * disconnected, and free interrupts it never requested.
+	 */
+	if (!lp->datapath_up)
+		return 0;
+
+	lp->datapath_up = false;
+
 	if (!lp->use_dmaengine) {
 		WRITE_ONCE(lp->stopping, true);
 		flush_work(&lp->dma_err_task);
@@ -3415,17 +3442,26 @@ static int axienet_suspend(struct device *dev)
 static int axienet_resume(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
+	int ret;
 
 	if (!netif_running(ndev))
 		return 0;
 
 	rtnl_lock();
-	axienet_open(ndev);
-	rtnl_unlock();
-
+	ret = axienet_open(ndev);
+	if (ret) {
+		netdev_err(ndev, "failed to reopen device on resume: %d\n", ret);
+		/* Drop IFF_UP before reattaching, so that the interface can be
+		 * brought up again once whatever made open fail is resolved.
+		 * Reattaching while still up would also let the stack transmit
+		 * on the datapath open has already torn down.
+		 */
+		netif_close(ndev);
+	}
 	netif_device_attach(ndev);
+	rtnl_unlock();
 
-	return 0;
+	return ret;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(axienet_pm_ops,
-- 
2.25.1

