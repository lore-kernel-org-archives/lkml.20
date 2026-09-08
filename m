Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4A3318EC4;
	Tue,  8 Sep 2026 03:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788838147; cv=fail; b=LYAhwzkIvTk/S8ZMRTd9HP5rFCPA7/dvDHYPgtyhEV7IaofOILaBTu84rHaMB2amGhZ9eWnc6MLEXKPKNFy7m/gFtYGUbcRT90A+owM9QncAkF91XVha6vRaZL8ZXlTuGKE1637vqBBbSv2zZtUa3bNdAGL4uqt6a9DqtOUmbgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788838147; c=relaxed/simple;
	bh=1VyvZbtqXeH7+rz9jAgc8CsQvKq6uY8PF0uS+PM+ou4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t8Ee6geAaxg/Mjx8Oi3ZpOHuibQq/pUFqIa/tlfYsqJOcGpcN6+0Asv/X1aNq4VEKEL3M9USB1JZqc9+XTgKXWMuGDWfp8XsSBOjTpJWsOzdpS+oKktmKnYgG3IliV3WhN38GpGf9CqLwKU//WB0MVp+7QwBulBNFXXEc124E+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=MNkvWPCX; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RZtNZp74; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="MNkvWPCX";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RZtNZp74"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 687NnuMY2680116;
	Mon, 7 Sep 2026 22:28:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=VGNXc35pRF0PaPRv855KooOnbw3oOBK8dzp8/zBbS
	FY=; b=MNkvWPCXnEkeQ3NDhKQW3mjtRiu1R/WhtcUMg63kSnhEjYmbBGwv3weqQ
	/lCLXzVS4EtUHbbzIc51GF6yIfd4qowXqgAJvco31uOIRiHOsLBaMU3TFxz6cDMJ
	Ia5es+ahTpt3g9vX6q8TKr9cQf+r7fzfaiB1RpJ788Oq/9FZPen5BFN+ImZ6JI5R
	uRvfZTuMH8lAhWtGpfeA82cste7/2NY16glDkwhc5s0I7+uzOxumDeJyNwvy8ezd
	yAqSSUX/w2Mr/sWCrhtg3BEgIwiAu6Z4G9j7hf318GQK3f3xaVyfAM4C3EHVhjOG
	NfszlC3amekeDHy+5Ie0h8YjyZzxw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012066.outbound.protection.outlook.com [40.107.209.66])
	by m0384305.ppops.net (PPS) with ESMTPS id 4ght65n0nr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 22:28:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cb/OY0JV9EMyoIbyi6P/EW6gny1RTPg3sDnw/XnKY629UdhgFeVEZRaJKvxPL47037rdk373ZGzAVHfoIuA6gjfMcGTH0UKs/Qobsop+PKZS1jBa2Twr2O35RwSOkIF8IMHp7zVxecN9Rqi1QAKOfLv0tzgk5f72S28p2nrKRXrL3c8ytfz6bK/+9rP6qskerB0CqThS/z9Y64bNVkrl88zUs8Qvd7oTMaMEK11KbsTZCwysHPMey9ZQMQHStp1dohkP1RdSzAt9bV0rqg64M2yCgygpp2e0YJaLeoTcENAMLhQ2znm8qeVPW/x6yTonlRwKSgim0ubzpPNm2FubKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGNXc35pRF0PaPRv855KooOnbw3oOBK8dzp8/zBbSFY=;
 b=Ued2Sya2MOLTExDXI/dQxGMVgmkmEHEgNZYXl33NXBzcBauWKivD8DShjSS6CWh2JCnBcMFV3vlHVxyXlcYefBPQZzBHpelqcI6fzi/fSVbOFuinzBZ3r3mNXJ0WfyOolgKv0MRtnQdlLqkN2LW9H8Z+YsCLrsShc5i6r8VfXQVh8gjanxIjdx/1A78t5ebnz/P6dE+F2wIrAumFSY4YLdJSsVnS5EStd87KXa9Gzlx4t0jgCQdR//kD3wkQfEBbB+bSl+hfyqcPgcYr5vt1O9jgSZh7FciA6axjJYS6WLk383Fr4u+Dv5C2EmLYKHhsfIau5y4KdbANec7ZsHeqaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGNXc35pRF0PaPRv855KooOnbw3oOBK8dzp8/zBbSFY=;
 b=RZtNZp74kdNKnS1J+nTjW2Eh6UQgFd2fOEyL7nnoXw11E6ZTxRe08vWeZRHOpZ3tOj5Z2Z4AsPkkHXSUE6hbXGlbstZ1VCIrHEUfmLkEnHRm5fo3yyMXNfoGyuJaeIAFJzOlIGCkV+w85umRJRGcB37tTQnbMsysjoOilSKBkho=
Received: from BY1P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::13)
 by BN0PR10MB4888.namprd10.prod.outlook.com (2603:10b6:408:115::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Tue, 8 Sep 2026
 03:28:48 +0000
Received: from BY1PEPF00026968.namprd05.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::ae) by BY1P220CA0016.outlook.office365.com
 (2603:10b6:a03:5c3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 03:28:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF00026968.mail.protection.outlook.com (10.167.244.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 03:28:47 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 22:28:46 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 22:28:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 7 Sep 2026 22:28:46 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6883SPTJ2661269;
	Mon, 7 Sep 2026 22:28:42 -0500
From: Niranjan Holalu Yogendra <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
        <ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
        <baojun.xu@ti.com>, <shenghao-ding@ti.com>, <sandeepk@ti.com>,
        <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v1 2/2] ASoC: sdw_utils: add tac5272 support
Date: Tue, 8 Sep 2026 08:57:57 +0530
Message-ID: <20260908032757.389-2-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260908032757.389-1-niranjan.hy@ti.com>
References: <20260908032757.389-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026968:EE_|BN0PR10MB4888:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bf36c47-cdd0-4fa2-6d58-08df0d594b10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|82310400026|36860700016|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	agimvR1flLZdQumibno9TPlBkx9ijjGrOwNUwLm5ICa+ncD/kedt29geAXnIoX451FZ9Tjm2mrDQqKvGNz7Novr7y6cv0O0UFnZ0WJ26bkRsRqqodQsXqje3vqUiYF3WBGzp8fFVSajt9s2Hfa1/eDpJRM1lFyhTu0BIwgEUK75EwrU8vMevPlUTif4r5B71aTTZlLlxAAUiAkMXGLRuWqL77jttv5o/ouCNLzeF5G3dHnolJEMTqU0lDnLqExUDcw4BT9eP1Bfs1UUxsSx8kxW6YPY38U9RFvXxLlS/R0+VNaEOZoyzDuClhRAhLV0UUDKN5o4S5cLuQKLs+Y3NeOcNCWxeKbU1UaQyzgcwHh1+Xl4sh+5a69iJj8EB+7zx5HT7A5m/q7FP6vYHcLNFeWpJPW8UepkQGCzEk/bY/aF6BQuns60FP3meDglYUpUHk1bzjRwT4/93Pz7ES690BnhZp/ikYXrJrpcpLiGW/QE+Z/fwUUTAnfoTbCRqmeqSTHp8EFkrGO7uT8BE2IBDtLiGt1NZKiRClc6+pAs+bYVN0ErZYDj50oEvWqOGE9/stZjzqlh0qrVyjcZtqOEbN9sJJB0utTEDlhkQpRjYnZJ/h6MPoThhfIIYBCLZhsPE9SlCynFYnaRVjr14gneeXEtRwYZtzO+YYdyj+iJrC/9TrlZC+OCsSFP+4Knll85ghoTo2i13gZxgGoJwlB1bIw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(82310400026)(36860700016)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ofc/jCiYs2J6kvHL/17fPs9Ygua/4uiagg6QfGc+X7aS/FKKiK7UqxOI9mFhl33FW1qBt/aXjoeJv2c/pXTPX8o1lPIIEr6zF0ggs6tstxHUehXWnsbxNqkXSgzZcne2TfEPMel75YPIsuUPN3aSvKLnOHWMeeydoAKFGv5wXwLL7DULp5kIfsyFYEXp3lO55oYYYuA9/lIB8JHFGVSoYdW7bAG0Q7jRtVSORErStHqSRT8WCOkUt9CGgdHMx2DjtmrqQ9F2NZhP0LSnx0S8xTO+6bD+D5jZvGT/ensQoXdCWHVjZi7H8dMY8DQ5kdFP5VcMjtpcvtwQBFDESZGOzb5g2jrZzQvkwPeQloFK7QlSweI4fFxrqxiQ8FjEMYlxK2cJYksc1qfePx9kFkbVQe3LfibtrIHoPrDbDJqoccHiWbW1fG+5sjRpdbmXNbD9
X-Exchange-RoutingPolicyChecked:
	NfZKEKCValEhHLrI/m1dLN5r1A+4SWgVJ6F6McoO42vVpUaqOwxf6+AKgy7Gtv/dna4Kon7Y3zqoPGpWnkzjxxH4G1LCI9wHFi1a0KgpHModkXYJ8S81jdQv866OvwswyvKeb57EYqxwzIv578oh6IgMu/00p3BCh3DWo3xK0GmQCGsxUxHfv/8Ah6QGD0LVlDd00/bD121uVeY6H5SJRQ0P8S/Sa4Z00IzcbXEUwHzyMeDp4EOl8KU56exO386f6CrhgvUFawjrxT5rPgXsM8WzOJ+tU8V8gYY7iq7pPqoD4jdDbRBz1nM8A+8zENbPRfeAc0PATbjJvHU6mdcGCg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 03:28:47.1225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf36c47-cdd0-4fa2-6d58-08df0d594b10
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026968.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4888
X-Proofpoint-GUID: BRk9LNCFVwz58V0IJxuYrWknHRnrGCV5
X-Authority-Analysis: v=2.4 cv=I95Vgtgg c=1 sm=1 tr=0 ts=6a9f80f2 cx=c_pps
 a=TLqzh4Vj95vWg92rYJ0Jsw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=QyXUC8HyAAAA:8
 a=V80UKwMsD-nZ57Tu3V0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDAzNCBTYWx0ZWRfX3fxnduSuE/RS
 vBMWM8jCoFHpQSg4ilcqKn7M848sR+paEG3NKGAct/pCom5ulxd2r0qIk1zclTg2/jrqpyVie1N
 B2FETIKYenlLeQmNKh1l9G5H4lIUTLPhri66YLVP8Q+Wq0p8Cz86Sn5g/OW8VqSAdLqhET7g8H3
 yJE7jybILeL4zUDG6oCF7ZHHtD/ryTKVixY3SISoTaC9VnyH6Za4v67SAIrtdXXqUU1+MEwBZt9
 twgXgzUFkRSWPmBdb+snDij/jEbIMNJDT5x3dq5B6sOpseS1Qg4QpcUeVkas2zK3CUiPJ7q3ES2
 SYEpQ0LkQf05qw7l8/iQuN4e6ypkwGI/Is15YzyyxfgjjzrWfNSHe2ONqTtbzcf032R1VpnUuwM
 edhf631nyznRhId9QHSx2NtwELVWh8Bphjye50/oTNrp42kw5dMAsvO0rOVDmZU9/5hW0UYN/2B
 iEAmmXLA5z1dMi8vjsw==
X-Proofpoint-ORIG-GUID: BRk9LNCFVwz58V0IJxuYrWknHRnrGCV5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDAzNCBTYWx0ZWRfX5AYcDsU82iUH
 djINYoJKBbwLXMnvW32BgrrPmNw5k+nY8iKW/7RBvzK0X2osXleSKAl7bAVzKQejOPAmWAf1dwY
 EHsUR5ESYLV45ZvXVKBYK9lZbXfZ5uA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_07,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080034

From: Niranjan H Y <niranjan.hy@ti.com>

 Update soundiwre utils to support tac5272 which is
UAJ only variant.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 88031238c..ab0132031 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -81,6 +81,27 @@ static const struct snd_kcontrol_new rt700_controls[] = {
 };
 
 struct asoc_sdw_codec_info codec_info_list[] = {
+	{
+		.vendor_id = 0x0102,
+		.part_id = 0x5272,
+		.name_prefix = "tac5272",
+		.dais = {
+			{
+				/* UAJ only - no speaker or DMIC */
+				.direction = {true, true},
+				.dai_name = "tac5xx2-aif3",
+				.component_name = "tac5272",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+				.rtd_init = asoc_sdw_ti_sdca_jack_rtd_init,
+			},
+		},
+		.dai_num = 1,
+	},
 	{
 		.vendor_id = 0x0102,
 		.part_id = 0x5572,
-- 
2.34.1

