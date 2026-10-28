Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793195943;
	b=PPVptqNha+EYuZgb63WfXKliSEbRDlw+jI4WhxVXdw075cbOWsHvwvDlM0za6DKTEFa7
	 MNj4kP75X3wrtbe8G/9yiY+2dksb/c4/q0lSu2Q2ekYSps1t6OmYO8bICtYapMdCQOz2s
	 dTdzt4BIYbBRNNbioxLMFpKMngvK+FUyOedCB1y/hioVRlCxE28apdg3bBztc2Z4xk5gP
	 CI5eAtTUoOfYmLLNqmrDDuQlWze86atAOijv1YzUmDTlHS45EG70zbu2QONcBR/iSKiNo
	 p+qI83SNNjN5zuctuzmoEzpHesHiHJsH679KVuJvNCL/GKPjlPl+srATp8DL7ZgWocQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195943;
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
	bh=b1ZsR0wZ6c1yl47fPPokbR/eZIGWlB+iwI67J2vdw0k=;
	b=ube80upwUKdqXeWR65T06ogKvHZxDw9OemVhA9Iqw28YngyQpwhjV/frMtu9iNWAUIRM
	 zo3rWYKAAeRkd9ba/BriGTSiCSEAFIdcSIJRJ8JBLO7xR2ByvRBd0nF7zycTimOxr5qBz
	 0PJitXL0g5GJSUjlfrjcH/3rUtZ5lHeEKFugs/fuYFAx+X26sGdx3pt/xmamYh0Xi50zC
	 WzTyxIvQ26Uu2dvq1OMc3GJ+4VISKJmHgLQ/6vS9LUrBwhKFguMb6CwlsG/TJ+XrC3EUJ
	 pERs3LlZbmpZr6FX7DeLyNozJX94cew6OTtAm8FKm5nku7BWVKOEqqMb3TCiJJnPG4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=philips.com;
	spf=pass smtp.mailfrom=bbl.ms.philips.com;
	dkim=pass header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=za9ly2F6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.24
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010024.outbound.protection.outlook.com [52.101.69.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8A1606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D8A1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=philips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bbl.ms.philips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=za9ly2F6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZvsrI06qSHaQBBc7qfzVrN9M0wxNTLj0PYu6YEM/wBauTaS1fk3lisQUl2N8UV9LnLWgClsJjoOlBMvkYdIFj+RlYrbL5OFIRky5+Q7bJmjQ+oIZ1gb+VF7UsxohZ+eUgby7VCE4SKhvk/4QLhpnSCIj0hLpU/oztB46gnfgf2AHHmsh6wKA7jHzypbmUOFasGxkuEXOaYrQNNVE4d/3Jn5balsI2ZkUb7lWEny90R25REdAFCStl21cUUKGV8fC2x+F6n+ZGmaRzI8nATzagihfjtdfvH3OkiXmE/7CDRf26B6HgmWLTlgvHzqFDvNsVGUb5viCdV0S7dOJwcQZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1ZsR0wZ6c1yl47fPPokbR/eZIGWlB+iwI67J2vdw0k=;
 b=HFK/4RkdNXn6xsiE+xNlv7FoRknmriwGVn3Zm2XOXI7P/LydaGt6Jw3Sgs+i/BW/oz7MYOGOVJRKH3+AldVSz5RpbDtp36PPpkQfbyH8Hm/fbgbaQQAU3Mb7DPlVBaeMsLF4zmKAUuFokTLdVuFIKeEX0ARLN4k7bn2zGHOXENXLxoBfxznNsssO+TAzSFpF0ybqXrsyMrsIA3iuu3Dt2/05HYhO2O+5JftLKQE4sGeLv+V/iU8pCvkOH7UaXBCflhq4cAG0kR5NwZC0BaytIyBlFvYPRy9gPVvLe1IG6/tdtjeygAO7gmKXlIehJKgi80tRFEmdxi92w36QRwA6yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 3.248.88.141) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=philips.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=philips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1ZsR0wZ6c1yl47fPPokbR/eZIGWlB+iwI67J2vdw0k=;
 b=za9ly2F6Fj9s3KQn2AxgNyFITXqQvUPWTZvhN/5sW1KrQoksdlZeI9kHvP2N4asyEFxM/0U/NLrj/7A4XYiHDUOZ/SfASIRmFUfAabfsrCGVUUgTBv1yf+VwTpy3HSBQytXrPasLcaxMhe5PifwXBMqVwWAhTqsL/0W8WNSDCQM=
Received: from DB9PR02CA0022.eurprd02.prod.outlook.com (2603:10a6:10:1d9::27)
 by AS4PR10MB6109.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:581::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.4; Wed, 28 Oct
 2026 13:58:41 +0000
Received: from MAD0EPF000008B3.eurprd04.prod.outlook.com
 (2603:10a6:10:1d9:cafe::c) by DB9PR02CA0022.outlook.office365.com
 (2603:10a6:10:1d9::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 13:58:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 3.248.88.141) smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=philips.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 3.248.88.141 as permitted sender) receiver=protection.outlook.com;
 client-ip=3.248.88.141; helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (3.248.88.141) by
 MAD0EPF000008B3.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 13:58:22 +0000
Received: from smtprelay-eur1.philips.com ([130.138.84.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTPS
	id LvJaxnhmAtKtZM4AYxIh0E; Wed, 28 Oct 2026 14:58:22 +0100
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id M4AXxaQijL551M4AXxy56J; Wed, 28 Oct 2026 14:58:22 +0100
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
Received: from bbl2xvg1.bbl.ms.philips.com (bbl2xvg1.bbl.ms.philips.com [130.143.220.100])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id C050F180394;
	Wed, 28 Oct 2026 14:58:21 +0100 (CET)
Received: by bbl2xvg1.bbl.ms.philips.com (Postfix, from userid 2884)
	id BA35CFE0237; Wed, 28 Oct 2026 14:58:21 +0100 (CET)
From: Vishal Gupta <vishal.gupta_1@philips.com>
To: briannorris@chromium.org
Cc: francesco@dolcini.it,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vishal Gupta <vishal.gupta_1@philips.com>
Subject: [PATCH 1/1] wifi: mwifiex: synchronize scan cancellation state
Date: Wed, 28 Oct 2026 14:58:18 +0100
Message-ID: <20261028135818.4166538-1-vishal.gupta_1@philips.com>
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
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B3:EE_|AS4PR10MB6109:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c965ab9e-e8f5-4ad1-c93d-08df34fb875c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|261021121427099003|11063799006|56012099006|261021123027099003|261009223027099003|261026121527099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	N91CGk5YEZqRgB1vL65yICMRli44Zww/oATvIHXjVXg4eql5lHXZde+7Y25jRagnP9YJi/2Hn8ayRih7d0gni3XATF6h3Xg8sbwezzrODiQzFEj2aypfZEkJIg14HUjdoINnEHoomHAtFkZ2dGP7l0q9HckMSApGn9MsXScUy4q5k/smbLSlUet92RfSLXbSTOSY3IGgC+eZ+erHuOSmhe24pVl/qHBNIIyosGgYKSUKVrGExCkSmt42Ha97yJwuGvVRqzj/9GcBOYe+KJavKsmKLdjYYFGgaoTl1Y57FM6xFwuDhugy//Iuxf/1N2ymG28AdlWFrcY/aX67I0La/Se6Q1TV4Qwv/bWgG1wFKIoRNXWmAd/4VdLSjVU+qdDPeRXv5WwYO0gy/2lV81IrwNAXy0uQKaizRnyaNwkh1YS0dl6gZgAyPrpuiToaCxC9GSoXFud9zUnjRuKEbabZzpReUVTEh2MZ3WZm6l43zKrD0aZ9SoxCm39Fo3jKfFo7QIL3kN0rYWBRCf8q13Y8Z+zjC74toHvP91DPFc5IwKEJAg28II2SzSDXWBe4z/2YzjMrPyy098nrgRMSeZlrJOtjzbv9JIcTQhmvTyFAt0fiKD3BBZOiEUnxfSv+3gJi5EFW8q3w4rtlYlIlcH9GO4AhZSgB/TRU3x7U/Z5BXb6BXrgObpokU7NqbuYX0R8+GD2VnsESsl02qSXofI0ZKQ==
X-Forefront-Antispam-Report:
	CIP:3.248.88.141;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(261021121427099003)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(261026121527099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1TWS/s0WtOzr+AGTLcFUo2J4cVCURuKqSm589EFKsoOkukM/Xs2rMio9vIaXxG8cbo1kWh3XdXbBkuQqTqeaQqBFdhV6a/ULQUm8moUIi4W8a8k/h6jrOakg+TN77meDyu0z28ho4zb1HXD94EP/rzj02HigMUCeS1zZJbWXYXa6y8UjH9xMNO5WxLblTYuk3/bijPmtTFQn6Gd7CKce+It0vlIdTEs8xz9QFiqJF77ka2o19c2F3vSzYcoVorLyc+7EbVA7CMGqjcPF67kt69fZ1mEzSI67acxZ8OlUE3gUHok8Bf9VIVAmIByAybrXGKOuwjFkbGZPXP1TQtkwXqwxUSH28Hf+yEguQa/TH8KY0BgLGqNrZI7MrPmDiAyncu0Qfl5yw1b+UHHXNAPcJc3FkJXZdGnpKkAvF6pDfu1uwXYOIQ9sX7Bcnn6pBBfh
X-OriginatorOrg: philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 13:58:22.1380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c965ab9e-e8f5-4ad1-c93d-08df34fb875c
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[3.248.88.141];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008B3.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6109

Read and update scan_processing under mwifiex_cmd_lock so cancellation
cannot race with scan state changes. Skip scan completion when no scan
was active.

Signed-off-by: Vishal Gupta <vishal.gupta_1@philips.com>
---
 drivers/net/wireless/marvell/mwifiex/scan.c | 34 ++++++++++++---------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/scan.c b/drivers/net/wireless/marvell/mwifiex/scan.c
index bdd4b8465863b..c2c5738d8a3fa 100644
--- a/drivers/net/wireless/marvell/mwifiex/scan.c
+++ b/drivers/net/wireless/marvell/mwifiex/scan.c
@@ -2059,26 +2059,32 @@ void mwifiex_cancel_scan(struct mwifiex_adapter *adapter)
 {
 	struct mwifiex_private *priv;
 	int i;
+	bool cancel = false;
 
 	mwifiex_cancel_pending_scan_cmd(adapter);
 
+	spin_lock_bh(&adapter->mwifiex_cmd_lock);
 	if (adapter->scan_processing) {
-		spin_lock_bh(&adapter->mwifiex_cmd_lock);
 		adapter->scan_processing = false;
-		spin_unlock_bh(&adapter->mwifiex_cmd_lock);
-		for (i = 0; i < adapter->priv_num; i++) {
-			priv = adapter->priv[i];
-			if (priv->scan_request) {
-				struct cfg80211_scan_info info = {
-					.aborted = true,
-				};
+		cancel = true;
+	}
+	spin_unlock_bh(&adapter->mwifiex_cmd_lock);
 
-				mwifiex_dbg(adapter, INFO,
-					    "info: aborting scan\n");
-				cfg80211_scan_done(priv->scan_request, &info);
-				priv->scan_request = NULL;
-				priv->scan_aborting = false;
-			}
+	if (!cancel)
+		return;
+
+	for (i = 0; i < adapter->priv_num; i++) {
+		priv = adapter->priv[i];
+		if (priv->scan_request) {
+			struct cfg80211_scan_info info = {
+				.aborted = true,
+			};
+
+			mwifiex_dbg(adapter, INFO,
+				    "info: aborting scan\n");
+			cfg80211_scan_done(priv->scan_request, &info);
+			priv->scan_request = NULL;
+			priv->scan_aborting = false;
 		}
 	}
 }
-- 
2.43.0

