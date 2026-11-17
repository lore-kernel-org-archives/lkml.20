Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794902678;
	b=VQQ3xpaP4CQoed4pwf8C90rWWR7gc7+X/hY0of/kfntEDM79fBfimWnaKQHNKj9wlpTH
	 AmBspyZCYUTUAFVZJ83WFgoQmbinEqYlZdW+uRbNXX4neXPXUvbjStF+dKpMNMQ0kTZnx
	 NqW9ax2RNxg2kXAOQvuVIeFuGITxs/cQmupkD/Rt+bVcMwOl2GUSRIdtVUF5V47GvJ++f
	 WWc8HH1/bQ/dBfedBBx1KuMnoursalQZYN8rP3PHTnbUb8JxbKNwU5UQxuetvomSwKt50
	 2+QQVlSpmVoR0Gzub8FV3cKeirSCtQi1Hbq8DHy17tp2w6vGYiGap6djVr3eZ+Eh0pA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902678;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=axO6uJEyfoN/wpFiS1dW4TBc5SCgHMz+SoGyyHXh8g4=;
	b=bQxzPhczJ+QfZvC4gblP51fPbW74rcR1gyD/GJkJy24DmJrRVxqzSxSA25jxLE2noVkk
	 nJ7YdwJkpghiari5NaW5miJFeWCbgsQPsS3tVeS/cELKBqFLx/wST8JIb2+0p4wDWugWE
	 vqX1VOoyx2vEhpMk0BGUlwndW0BY8QgKAxosg351NaRDJT8oCQyfHuIa0aiMw5SZXHIlK
	 XG21kxhbs6CDlFTlZ7x/JTimJuApRnhwdVenQNw5jHWKB5xlrxpkEZXhrWe+TQeXqfyHV
	 LFq56W5hJyGA9Yl3Gnm9DA3m9zzUq8oVhT6T25AbdNLgVbc7fNnFOWq2nE1UjriysCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pG84dAqR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.63
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010063.outbound.protection.outlook.com [52.101.56.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB0F606A885;
	Tue, 17 Nov 2026 08:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEB0F606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pG84dAqR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gq3OEsCYc6PMUfFoY8la1uKUJvCChniQ/3GdaVN0HheI8SJ0jWa2ttZG8if94dIReWEEtlB+wNd5R1P6+PexOKo2c5uu4V/T1XMeoR0ulz9uDnya2PY7xCGJN/rg6i955sLltrw/JwJs8d4VNvX37E4DOyMgyCg5+gOQy2ElkezNRaqDCkbwQHNgneyQTI99i4Ay1F/zoxyFnvKQk+/Zd+q6nNN6I9etQEENn1fzRHcy57ew+WRIVECceWQ8QW1Imj9R0fYXobDaGpUbzbwbkCB+399zZfMbSkdtPHS+pojgAMRsgLDyLiitlVPeZInBlL+6S+XcGYzd/7aTpEk19Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axO6uJEyfoN/wpFiS1dW4TBc5SCgHMz+SoGyyHXh8g4=;
 b=jInxXxhEJLnYP9dtF+AeQXW0bfByRjMzfhu1veZqWWK8CYM1jEkl8ur7WdEnQpxfpPpqGYhlcGmr7XQaTXs1u/0qTblY0z8RxwZHHiPo1jQsVEPBiSW0Lno91UVyugKsHJfiZVOYUyo9hrjo2DuWs3TsuBAuxwcdWCEK5iaLbL35FWqhWkpYnpkQIGJgvw3QuUP17oJv4HFXSih8D7cxymcTtJItJz+pBnWaGFn1/BSgLE84yFK5jqzUAXukKU0n03XqojJL+3/kxW+9iSDiy28/JIW/BwSMmodqCM8zUOAKrvtWsfDNjoM2wS8xDbjjS5iblE6MdROKmE3V8awk0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axO6uJEyfoN/wpFiS1dW4TBc5SCgHMz+SoGyyHXh8g4=;
 b=pG84dAqRVY9SdbM5UCV/yQbPa/RaHmX+lDo1Q6C/AVJsioLTV6vPtwhvg7Nq4njdVGcj3+uFHMv58Wp3tX/WrLLyV2YDLqK413KlerKj5Fd/xOKUNtiQKPoSubj5yHoaknTBemadzkQzJQokx4AQPBWs2lTGk04bBu8lNC8cOJk=
Received: from BN0PR07CA0005.namprd07.prod.outlook.com (2603:10b6:408:141::20)
 by BY5PR12MB4115.namprd12.prod.outlook.com (2603:10b6:a03:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 08:04:33 +0000
Received: from BN2PEPF0000A98E.namprd04.prod.outlook.com
 (2603:10b6:408:141:cafe::21) by BN0PR07CA0005.outlook.office365.com
 (2603:10b6:408:141::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 08:04:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000A98E.mail.protection.outlook.com (10.167.248.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 08:04:33 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 02:04:31 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 02:04:27 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v2 08/11] soundwire: generic_bandwidth_allocation: fix hwidth for skipped block offset
Date: Tue, 17 Nov 2026 13:31:47 +0530
Message-ID: <20261117080239.918428-9-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117080239.918428-1-Vijendar.Mukunda@amd.com>
References: <20261117080239.918428-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A98E:EE_|BY5PR12MB4115:EE_
X-MS-Office365-Filtering-Correlation-Id: e4e61287-23b3-4ce7-6c2b-08df44816a51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|56012099006|11063799006|261022075727099003|261026121527099003|10067099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	xzmVDmIeOBCXivEtBrc7H9CySGSbv760TOdpgemE1DXyc5WOQtHYn1OyHrZPKatRqr/9Yo2Bm+tjg6N2xYM2hZ287hJ5lNaqNH2KkK4+uvuVrN/ksZS4G1aWbj/ozy2bVw/CBJSEXS6MRGNodxefJ++uY+ZQVLKC284DpHj6SyDLtBHh512pLqkiZhs61lBtBdmkVu70DL12OeaNuG+63MFtx8825gIdEWwgF4FkMoyo+u3uvM0IMStt01xfPp28CnyZuQwkPLzYnTK4Ek2XSVpBV/Yz5rP0OvINGzW5ZBeC1fLHz9nGlSgSYAr7rjQf0pu7TbyBxFEFwhz95IHLinmc5Z+DboITFHqH12qUdbsJfOGeRzEZEdqlpPyZ+YOYuieDkn0GBTDZepbVJwtmvlJlrInx2Ltd5SXZ5ND3p0SdfjdYD9FxLLtEmH05YA/rO16INhM4oXc5lVVqfuCD9PQ/hiVE8TllR6/QZLI9PvN9kR/hoIncAFbONKu6LE/8u/qUOQk4U0WXqTw9ZxrQlXw8jaSVSzVCFiYwL/Q+L6t7Mh/20vkUeEz/jMnKvm0pg3C9eg/eHH0byh6yI+56MIsBjV/Opz4trz4MPE4FDVK9BFxjfWwF8GHj1n+fhVisop+LZScsUKirFvoc2j+dvhxTlvjawoQS+An0Nj5oyrTuAqc+xOCvjYFYSp1LxZG609qt2Szghm9rHwbjLV5ONQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(56012099006)(11063799006)(261022075727099003)(261026121527099003)(10067099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4LeyS7SQBX2zwi94Q+SIVNlK8jftjU8mszIF+eBWtn8gTpYpaRoLX9rEOa1L3qPSgPiIxCYUJHd/WSTOzSi9gT9eGLUcGERB2ciahch22N9AZlD+SYHo9En4Wy8UwOUhED9bPaI+SbdpF/COVqi+9XwQmwBdIg5M+OuFLUdIV3M+Py2tRpN1D0jdo505gpjybxf2zm35ZWRdR67eI8+oifw9mjmCbamGcSRnlEA8ed3MFmj7lVaQaFsdlE68fwTsJPPh23t3zVebWX0NIJOH8wIXXAg1IMRbkMuhBeXLVRmdxT+GvdgWptMxVgicrF1i6CGZqClggK/37xdLQlWN3nhskmSSzdl9/+dM12iz6RKG/Pf+WXxye8ewCcvB/NwXRM3Jorw2JiBbFyJN76Rr8T3D9iWQ0QlrGOWG/Rm2e1PUVktwHZBj8/ZVx+P62bF3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:04:33.4694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4e61287-23b3-4ce7-6c2b-08df44816a51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A98E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4115

The hwidth computation in sdw_compute_group_params() used bare
payload_bw when calculating the horizontal columns required for a
stream group. The generic transport programming starts payload block
offsets from block_offset 1, so offset 0 is skipped. Without
accounting for that skipped offset, some frame configurations can
program an hstart/hstop payload window that is too narrow.

Introduce sdw_compute_hwidth() which adds 1 to payload_bw before
the ceiling division to account for the skipped slot. Also skip
groups with zero payload_bw before calling sdw_compute_hwidth(),
and skip groups with a resulting hwidth of 0 to avoid emitting
an invalid hstart/hstop range.

Fixes: 9026118f20e2 ("soundwire: Add generic bandwidth allocation algorithm")
Signed-off-by: Poojitha N <Poojitha.N@amd.com>
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 .../soundwire/generic_bandwidth_allocation.c    | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index 30a495abe19e..1dd3b2e5420c 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -15,6 +15,12 @@
 
 #define SDW_STRM_RATE_GROUPING		1
 
+static int sdw_compute_hwidth(int col, int payload_bw, int full_bw)
+{
+	/* Account for the initial skipped payload bit at block offset 0. */
+	return (col * (payload_bw + 1) + full_bw - 1) / full_bw;
+}
+
 struct sdw_group_params {
 	unsigned int rate;
 	unsigned int lane;
@@ -203,6 +209,9 @@ static void _sdw_compute_port_params(struct sdw_bus *bus,
 		for (i = 0; i < count; i++) {
 			if (params[i].lane != l)
 				continue;
+			/* Skip inactive groups to avoid an invalid hstart/hstop range. */
+			if (!params[i].hwidth)
+				continue;
 			port_bo = 1;
 
 			list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
@@ -274,9 +283,13 @@ static int sdw_compute_group_params(struct sdw_bus *bus,
 		for (i = 0; i < group->count; i++) {
 			if (params[i].lane != l)
 				continue;
+			/* Inactive groups must not enter the hwidth calculation. */
+			if (!params[i].payload_bw)
+				continue;
 
-			params[i].hwidth = (sel_col * params[i].payload_bw +
-					    params[i].full_bw - 1) / params[i].full_bw;
+			params[i].hwidth =
+				sdw_compute_hwidth(sel_col, params[i].payload_bw,
+						   params[i].full_bw);
 
 			column_needed += params[i].hwidth;
 			/* There is no control column for lane 1 and above */
-- 
2.53.0

