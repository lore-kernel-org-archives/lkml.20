Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794504112;
	b=geCcaspIgTOJl5Fgh/A88Cni01V00ydGrCMjGhfka/kfH3j5BoW9WRiWeKRi5235sdYJ
	 MkeELkMYk/3vcYrJaNQWojh2DDO6FFMsy5LQFMi95D2BF2UxoaZo9dver8mp9/k292caw
	 gGdSwiI/mujnAHVp3ORvHXE+5n/wZYr4qH/5CaoG/fUO2NRRNUvwldWIxj2mBV5/epJ3G
	 ze9QJo/GLYa0SRVBgYPYXwUf9lI4hGaUkdMbG5YttqzE1OPTH9Iug0aVMVUjIZ4pbCzJ/
	 rhp6HF997HJNd0DiwQlRwNa9XuyWrNln3gUTEAWeJbzVmSAP3rIyYad2J8zBkc/tS4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504112;
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
	b=ftkwXxYd1VASd85x/AD/9nKjpHgVXhc574J7ltMetbcHls8gy/Rn2FGky2vwSGJyvame
	 fVICduwfWfGpOYGDopAlnIsHa6XVpAEdR1rBc+FgIl5+B8O6x+uw1gjh4VCvy9Ib6earr
	 ZN4fNwNvsgb/rxGOXo4QTZLgzGKAaByG2uZTi3s4AFiMy/RdaQ/DcgDkS6KAAJ6Nt2fCx
	 B8C+7o4ydPD55YrAue6rZ1K3m+i2tS0JIXXmac+jof+LD5dPpwYBIzmnzcZhigfRN5BtK
	 DB63HIni8QLDy/nSs6JJnOGjMX54QNIGh6iHWhkaJQcZBasgizkTOoRYcsf1yhebKUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=philips.com;
	spf=pass smtp.mailfrom=bbl.ms.philips.com;
	dkim=pass header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=jJOiJ8Ag;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.60
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013060.outbound.protection.outlook.com [40.107.162.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B84606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B84606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=philips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bbl.ms.philips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=jJOiJ8Ag
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1cUnVMt3auCmOfEPE3bijjLvjLiV8DnHR3OcAGNXlTu6dPDroutLGdegfrqfTgdA5f3ONwmgVB17fbgIGWD/Tw+nh1MlyFIrQUJcEZ8DACYcJM/eKCblw2l8RxrUFseSYCrLVh+GAW+mQGmd6keSZ1bGWpY50JI34/S7TKcGzZAdhQyn/XehRwY7SIy4ErC+S9QMIid3pMohn9gyzHlktMXB1yL3yMeCtmpR0ojiT6qX7j7bytzql2ZOg4hI/juiFUuT+r5YNLDKi0ndBA7sraaEtQqAtbfMewortUfPMenL1Gv7PpeS19/7YbzLkM8gKyCe+biVOWH23qatAROcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OSVyRMwkTFhe/VYzUqR8sfmJ7deCG6+6TxSKqSqZKE=;
 b=magYukDgoo5EamzEeEfh6KjCgjjsPdhNAyVKE9jZbs5sAaDLuBji3XidILpcQgJITb10MBE6e8Zu99IzxImoMyBUxP7XaAeXTN8EtyM2lLPYP/rnxLsx1QnK/GtvlTUbqMSe4bFVaVgU9lQ8OKX565Nj9Wscyf4+MP9rNaA8OuTcSkW7cV40xAedNdhrU6ssE54CnYVVqTousAqy+4bsmgZHfbszVKnn83f1ksIieSgxFTn6ucFN/kqUVRwNvidQCbgZepUs99NmtjGLWOA1agNT2kz09SDwos+4E3BumiqTqpAfgwwFkcLzwZAva8D3gRL11zZ6LF8M2hUmsW3Rjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 3.248.88.141) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=philips.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=philips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OSVyRMwkTFhe/VYzUqR8sfmJ7deCG6+6TxSKqSqZKE=;
 b=jJOiJ8AgeCxuvXg3IoWmsk0sHc0hTLDZK4/gaypUIH0AjZWs4QpKg8uFGZ9m31hP6GC6BRqToMTd0dM3poT8g+deK9VVUfML3e/SMNE9ZzzDBrUcZHdT8RwwTwHRxiOdFwA/dGPrByx0JxH/itWA9ZO8yhZdU0SwO6aa5nemeVY=
Received: from AM0P190CA0018.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::28)
 by AS2PR10MB7300.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:604::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.0; Thu, 12 Nov
 2026 17:21:47 +0000
Received: from AMS1EPF0000009A.eurprd02.prod.outlook.com
 (2603:10a6:208:190:cafe::38) by AM0P190CA0018.outlook.office365.com
 (2603:10a6:208:190::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Thu, 12
 Nov 2026 17:21:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 3.248.88.141) smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=philips.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 3.248.88.141 as permitted sender) receiver=protection.outlook.com;
 client-ip=3.248.88.141; helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (3.248.88.141) by
 AMS1EPF0000009A.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 17:21:46 +0000
Received: from smtprelay-eur1.philips.com ([130.138.84.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTPS
	id RSAFxg00hf0UDRYUcxcAyI; Thu, 12 Nov 2026 18:21:46 +0100
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id RYUcxKA00btn9RYUcxVmEd; Thu, 12 Nov 2026 18:21:46 +0100
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
Received: from bbl2xvg1.bbl.ms.philips.com (bbl2xvg1.bbl.ms.philips.com [130.143.220.100])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id 87F1B180398;
	Thu, 12 Nov 2026 18:21:46 +0100 (CET)
Received: by bbl2xvg1.bbl.ms.philips.com (Postfix, from userid 2884)
	id 82697FE023B; Thu, 12 Nov 2026 18:21:46 +0100 (CET)
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
Date: Thu, 12 Nov 2026 18:21:44 +0100
Message-ID: <20261112172144.360189-1-vishal.gupta_1@philips.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF0000009A:EE_|AS2PR10MB7300:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 53d89a60-1eee-4d9c-f184-08df40e16e2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|5023799004|11063799006|261021121427099003|261026121527099003|10067099003|261021123027099003|261022075727099003|261026140227099003|261028144727099003|261102123227099003|261022105027099003|56012099006|261009223027099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	+Hba/Z0OAXhKX/UCfD8pyvilnzeGbo+fEeudzQ4HCFlkbJWGF8CkBczaX5mtqcnxdOl/FHr1y45U2MYLIYx0fbL6gb3tHi5gPRwvYXyZHPUcKVYcHpWOSnZ6YbEmWxtwjFAxtngUu1wx4ZNVqYszFYuW/EW5K+D53p8VATlMAdzCKHh9wFYBw9YeNVv3y21wB8djnCLPReH4Lr5VtXQOw9G1kodwQ1HoebFgfGQIpOfCQZTBjEbWqdqO2MtjBMQKqzirnHt5KL1/ZUO1TVcrEXF7hvxSc+lQe0/CyNK11Q+yGzGEraiAF+4c83yZ0yl05QXzuyowQZ3myjsjfdsUBX3AyUsLEd8LCqfy8VTuXbTPGttDdL+jw4bvoVnwoCGqfOaf+3ewSNWRokW3++yHlf6VqXny1FTLnH3gTiOv7tSMrKJEKk8e8YsykVjVZFas5WhHXQvpqQ6VP04Ya5CD6Y1IDszxl6Wy8nZRYPfihQPRF5JkdAsUi3cIXXRVueI0HFxX21k29iBBy6iH5d5FnMcsCPoNO3cctQcZ6wxWVV6qSzMYip6lBpL3KwYknXXed/96467sYySz+B740yaPb82Wzv66c1ck0Mu1v/a0c74G8AJ2cPpRGwgFPbUQwMJ37RhUFUCHLYsy/dc16QACbZJPZ6IrB7qOCNgCYBn9dWRJ9Cb6/SiqbuyipFxfCDZwIhB1NkdePtoF0IsvcCGkVQ==
X-Forefront-Antispam-Report:
	CIP:3.248.88.141;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(5023799004)(11063799006)(261021121427099003)(261026121527099003)(10067099003)(261021123027099003)(261022075727099003)(261026140227099003)(261028144727099003)(261102123227099003)(261022105027099003)(56012099006)(261009223027099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	18zO8H3TaYhVGFiEqiF0zXqYOlDAtLdVoIZYeerSYjFenmLClqWsvDy5abUbb7vOEaF4r/TmOHsYxYxj93yuDwXOk8fWXKq7EsVvti0jc09Boersc+zYKokche8XGTYYN9/4Guo45zCs7udxLyiWP6kez0WqeXH3SKYkUERS/ZV9JhA+/XUwc5SBwTPB4WyQAY4NQC+vqn5a/Tt1CdeqS9zvSn8sVxSuNRQN7YARyS3yMuvdB5/EFPKy5+waYUI5fbcOC8enNQhVbROFzpd732NW2qvFxaiuh9l5zRU9sxE3/M/np1fZ1Q0ONh4cLnf+X08P0cehjfDDt+NEsXM8E7WQYk9Ekmd1DVHVMAv5Maa11YXm/8PyHFtonVoG5M9pv5O7iY72cJq4DANBweiWa5AqindkAzBGCuZRRXsUgNTiup/QK4/c6m7ikqtmgNlo
X-OriginatorOrg: philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 17:21:46.9897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d89a60-1eee-4d9c-f184-08df40e16e2f
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[3.248.88.141];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000009A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7300

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

