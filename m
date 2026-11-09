Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794243850;
	b=EzNESHAK9DORyS4EGNywfT71dcKS++///KkQNFLHAw6JiZi3gsZ10SkTjyEpAT9fsFz+
	 QlZcmDBVcw3ILjjdL2TLjmtrQdAXy/SdNxtTmqGMyjxUbcpfJVdn/j8jGQUi2xp+RhGYv
	 0qFkaUZFnXx4yAop/LBHxIizQ35y/AK01vD2/SCO/tHgc5CaAFq96xSv3oPZcH/Zx4wXV
	 x3C5sVwF6ek9ZIwd8FJmRmQmR66dG1NRP3/rRbeRYxZ2IiQ4KcTRxjpxInWjrHpDTvaa1
	 TBKWm67qmXws6ORnLq1MY5c2SSKtcrjdB9KobcqpxXPnVxbYIA+wlCUfNRwro7ciZtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243850;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:X-CLAM-Verdict:X-CLAM-Score:X-CLAM-Description:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
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
	bh=0OSVyRMwkTFhe/VYzUqR8sfmJ7deCG6+6TxSKqSqZKE=;
	b=5ovYl3UkAeWGKN6rYjm1BtafvNZMcDuv+dky7ZIwUOihNlL5N82ggT/9aOAHyJvKu8yS
	 5KiyVJlnZw90wKABLaIZaISilwpJ/WVcylQfkKiGARmP5DaanFn12yl2pJ7t52r4bziyn
	 ar9Po4b7d2ICzsR/vCdvMCrXF4DqP7hwLYgYV/uGYzVT+Yvqpvqiysv2GJnXZwhytaDAz
	 1CxPgcP18s2zL9VEoXvdTdPxZ3jNSphzXE4wi8MoDugN7GmD+CaWY/6MUwsYyr/QdMoK+
	 KlBERqlZZnKHqaxLJcEySOGqwZsYMo9wZEPu39mqKETl67kUqv1H+UMNZ5d2zooUFcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=philips.com;
	spf=pass smtp.mailfrom=bbl.ms.philips.com;
	dkim=pass header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=W+8uT3Wm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.9
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013009.outbound.protection.outlook.com [40.107.162.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119E2606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 119E2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=philips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bbl.ms.philips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=W+8uT3Wm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wFa7r9WA7UiuP4ChzFOZrInrZYiP6U1frM/uKkvVsky/KaIr6+71B0lEtsMMy1PMlZW9aJKJiJA3dsIgn/BFThdlRoA1k1t5CLcvoi2La33y9KJM1KLY0A6/vzjMqyYQBnou3XytYEHJ+bGoeVF10CGrjT+hkayTLZYVwGLONGBEFwOF7Jg/sVEN6LZHu9zLS3viv6YEqrxPmZM+vnpa79hPRHH5G4CQqDLJhEwx/Yyl+YHyOhVfby9s6jjjDRNiMw/h7lUiHoTTu1dAEfc3xCk3D6A3thzAV+2lcEg6sOMDOMn+QG0jIDenBuflOfadyK5Qst2izZdo2NXS9OuaCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OSVyRMwkTFhe/VYzUqR8sfmJ7deCG6+6TxSKqSqZKE=;
 b=F/joZDJQgTTr5NzDRc0rfwqtnwRl/TGGu5T1gGNjts8WUzqr0pxp7FrMBNqubX3mfzV3J9QjZUIvAtILGSe10VvkyElXf3b9G5YCzqkDN+O/Pjczk0MGsAvLq+ztkS6iBZOPDRoyvML/2BilM+yt/giG26lqpJw/t+N9IqaJhljgK4c/em1FWkNtQaKzskXcBtMSs+wawePXenA8rFAOL99bpeJ4BIFAlquTJh93o8nMPS2YrDPSutbJh3VKILEMMWC8crMHoWxQq17WEb9Ilrl2SpTTjZt4KCPZ5nVgck0R+WtycSI50sYg7Wp/H9S9bOuKlpcsz9AJCt13rpyUWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 3.248.88.141) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=philips.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=philips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OSVyRMwkTFhe/VYzUqR8sfmJ7deCG6+6TxSKqSqZKE=;
 b=W+8uT3WmK+FwB4wct+hU3ar1x5kEzsXt5yapqTzoJrEJMesq6POwotguYgFLRTHCBhKjpq2DzggkyI7vrFu0ZoEPnUZoaxYByBkysEG8bouE+8mr3BaYm9taVXO/whpD4dZo3xjRNBsItDpkt6foAE0KUP0DA7bVuYjbOPQJJR4=
Received: from DUZPR01CA0068.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::18) by AM9PR10MB4040.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1f1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Mon, 9 Nov 2026
 17:04:04 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::56) by DUZPR01CA0068.outlook.office365.com
 (2603:10a6:10:3c2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 17:04:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 3.248.88.141) smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=philips.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 3.248.88.141 as permitted sender) receiver=protection.outlook.com;
 client-ip=3.248.88.141; helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (3.248.88.141) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 17:04:04 +0000
Received: from smtprelay-eur1.philips.com ([130.138.84.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTPS
	id QGMzxcYXGf0UDQSmqxPFHJ; Mon, 09 Nov 2026 18:04:04 +0100
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id QSmqxGYbKbtn9QSmqxKnzw; Mon, 09 Nov 2026 18:04:04 +0100
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
Received: from bbl2xvg1.bbl.ms.philips.com (bbl2xvg1.bbl.ms.philips.com [130.143.220.100])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id 2C5BB18015C;
	Mon,  9 Nov 2026 18:04:04 +0100 (CET)
Received: by bbl2xvg1.bbl.ms.philips.com (Postfix, from userid 2884)
	id 23A00FE023B; Mon,  9 Nov 2026 18:04:04 +0100 (CET)
From: Vishal Gupta <vishal.gupta_1@philips.com>
To: linux-wireless@vger.kernel.org
Cc: jeff.chen_1@nxp.com,
	francesco@dolcini.it,
	johannes@sipsolutions.net,
	lilinmao@kylinos.cn,
	kees+treewide@kernel.org,
	elb12345@hotmail.co.uk,
	linux-kernel@vger.kernel.org,
	Vishal Gupta <vishal.gupta_1@philips.com>
Subject: [PATCH 1/1] wifi: nxpwifi: fix race on scan_processing in nxpwifi_scan_networks()
Date: Mon,  9 Nov 2026 18:04:00 +0100
Message-ID: <20261109170400.1316239-1-vishal.gupta_1@philips.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|AM9PR10MB4040:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f4107a19-1463-4ae1-fd58-08df3e8375b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|11063799006|5023799004|56012099006|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261028144727099003|261026140227099003|261026121527099003|261102123227099003|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	PJiqTjfZbKiC3noVccBnzdOaGjgZ+TgDaQmEh+X3YJj6nHcurF+qFqTA+4WNP2l/SikJlnMH1JeMqm1thy1zrG7dT05fyYCVFFwQunum91+2kuWIE1jfuwiG1OqzHDMucuoVLTMUh4iEXEIx+YhTjCSKD2DMVzXhgQWhfqWeWO6Foqyge0hH+WHMXkB7U+oJ9TLA5gzp8XV0Fo+kHWGeOXWhAx1sGwwve1fn8kYdC/xbQDcYx4/PC05PmIpdUMtNzEdxnXuIreDUMAlaVQriGcfNnL5v9ldbDdR5i7pb9kF71WaQlP2plAVr+ixF2MuPVWy9U7i28YfUmh/xiPOVLd96ffs3B6Io2+ndXo2AKi35CUCsUhDmckcwuDLDq7r0yidafpBkRC2CxAXVIfO5SOjIA6BmdW1umkOeD+uuLeqg7tZAbwGv3tdgRGKfLuSnl+PPDvv+hbxJNS4m4UAD9mqlA013ZQzjI2hd3iHuSvG7NbRVguhZcgHByl22muFCxS3EOAe5D8OjesblCY3ibnFoKJAee8Vg972XXFB0zAFknJQXNUqhyvqlTwmk4DB/h/n8coJlWf9aqTxH+9VGc+D7JnsgBIPHkWPS87q3ueFx4dv3ZZEJImIrVFy5iLo24MP3i7T+RESirayoq1KkaVC+XqhYj3Y2SiCVo3Zfeyhsmr+9MvxtekN8csrsUmP3rP2Kqzzqd0C7jgn51CeDyQ==
X-Forefront-Antispam-Report:
	CIP:3.248.88.141;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(11063799006)(5023799004)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261028144727099003)(261026140227099003)(261026121527099003)(261102123227099003)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HvusEctPrCACbod+e1TSbdzi3w8CAh0B8NsON9eIk4VVGRgUXWrKu6T787OWTbCllUkDdebYv+AsDXzwvT89uSnNU+UpYmTttBq7jtvnYgRBmymEWtNUW+IzufiQxc/E+FNNmpmtYJs5+HZXW+ii/O0+zFnabod+T7H5tV1zQWTGFshMuCBoUAnWdDt7cjbTmkOBDuzCGgXCeEnbL0LOCfrrRmgscxx70lQ2Sk9TBqzavven4v6p6k1PQH91t9uTSca+UfWkczKB49Fra0q97evTT/HO5ZB4RIkWChr/s+KzsbZL+LmMPNwarIN8M7jCEtxwotiJAqb/Aj7imlvO2AkUwCwo7n+iVE5GUr6xsmqKvpm/572SRNCFP5v20gfFWHq+Ap9e127Xa2wmqBFFfD/wSgjIgKS+Q8XfWg9X2BiME6FbcMpGa4jdw7DshWO7
X-OriginatorOrg: philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 17:04:04.6478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4107a19-1463-4ae1-fd58-08df3e8375b7
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[3.248.88.141];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4040

nxpwifi_scan_networks() tests adapter->scan_processing without holding
any lock and only sets it later under nxpwifi_cmd_lock. The test and the
set are not atomic, so two callers can both observe the flag clear and
both start a scan.

This is reachable because the function has two callers in different
contexts: nxpwifi_cfg80211_scan() runs under the wiphy mutex, while
nxpwifi_active_scan_req_for_passive_chan() runs from the driver's main
work via nxpwifi_check_next_scan_command(), which is not serialized
against cfg80211 ops.

After the last scan command completes, nxpwifi_check_next_scan_command()
clears scan_processing and then starts the follow-up hidden SSID scan;
a scan request from user space arriving in that window passes the unlocked
check as well. Both scans then queue commands on scan_pending_q and share
priv->scan_request, so one can clear scan_processing or call
cfg80211_scan_done() while the other is still running.

Move the scan_processing check under nxpwifi_cmd_lock, in the same
critical section that sets it, so that test and set are atomic.

Signed-off-by: Vishal Gupta <vishal.gupta_1@philips.com>
---
 drivers/net/wireless/nxp/nxpwifi/scan.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/scan.c b/drivers/net/wireless/nxp/nxpwifi/scan.c
index f3becafb9c23c..548c257a2e3c3 100644
--- a/drivers/net/wireless/nxp/nxpwifi/scan.c
+++ b/drivers/net/wireless/nxp/nxpwifi/scan.c
@@ -1336,12 +1336,6 @@ int nxpwifi_scan_networks(struct nxpwifi_private *priv,
 	u8 scan_current_chan_only;
 	u8 max_chan_per_scan;
 
-	if (adapter->scan_processing) {
-		nxpwifi_dbg(adapter, WARN,
-			    "cmd: Scan already in process...\n");
-		return -EBUSY;
-	}
-
 	if (priv->scan_block) {
 		nxpwifi_dbg(adapter, WARN,
 			    "cmd: Scan is blocked during association...\n");
@@ -1356,6 +1350,12 @@ int nxpwifi_scan_networks(struct nxpwifi_private *priv,
 	}
 
 	spin_lock_bh(&adapter->nxpwifi_cmd_lock);
+	if (adapter->scan_processing) {
+		spin_unlock_bh(&adapter->nxpwifi_cmd_lock);
+		nxpwifi_dbg(adapter, WARN,
+			    "cmd: Scan already in process...\n");
+		return -EBUSY;
+	}
 	adapter->scan_processing = true;
 	spin_unlock_bh(&adapter->nxpwifi_cmd_lock);
 
-- 
2.43.0

