Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792989988;
	b=eZVE5m5Ctf0ilLdYTvchMpJoCSr9ShVKU0V5cy8Uo/AouzSVDk9fWim75ZIkfc6czKdR
	 lzvvRQBedjJ5UYBubFZiQEUbP4frBmhT+HMlq2/YW8vZDD62c/xNW81HLzRpdaMFEEAsC
	 wCui4wD2PCQaFWkSl/Zc2Ntne/xhAj8YZXRO7njZmRcQfUglLoaqAaiCZBu1pMXsuygVx
	 2r/rTCZkBXnlxmBEYuMoiDrsLxQ4T84o9GNYJW+2VUvWCRjtQlrmD6WM/D8VSI/+R8kwb
	 qBbKyvN0ITS/1DEIMHAvDo8p7VDz3crI9DH1a43extXG1L6enGJUJgitSZlb9YK8rjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989988;
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
	bh=RIP0g1CAbVSJGNYmT256hdS6rLGsO7FfPvk9MOgnDgc=;
	b=23LNo8b0jqF5oR1h8bxgJe3hVmo7V03qBU5xyxPnNlfhKzLnRNzNnVB3/d8uUJlZo2Wd
	 YNeAqtBPknjyfUYYuxKTUA7LEXO1wMSct+eEucpnN7N/0MkGxaHF8kX0nZWyCchqmVAne
	 2gR4IW+79AmG+FE/8CsEBkSDeEDNtoFT2pBwRjZhA5A3ZO+mp1d7dqcpQqlSulOW4f29R
	 xkpntUMFVAKWwHQNvnSmXieV6XzEGtKJyGA+NMdoo/DZgv192VMnyZwSchnD6ZDUXHxRm
	 hekw3ef7fYNynIcaCKJdsKAM20itmb1GHgiQ+ptTKqls7R3cEus5XLPXR46c1CDw/hA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="K/WbhfLg";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.29
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012029.outbound.protection.outlook.com [52.101.43.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA42606A31A;
	Mon, 26 Oct 2026 04:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFA42606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=K/WbhfLg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UAOfmU0tFEoaOONv4OksyU2o6pLOXpria9dcHGkbAtkXj/pwxqncfYDXUaUeKcY8u4uzP1zXI1w31dS/g8DGCAW0rWU2BMPJWwRXJQiVM6wd53NK4XQwPKWP8ergHbDzeLGqOwSB9gOgB3P6fw0CTNvD9hUAOs1+acUOFU5GNVxHRbw45lfYdN9R9nEcfbpbEng2DVv5X4u7L0y+l93yfTGAcY4L8oHCtiyr0cot6UcNAwbDA6X0ZlGv7uHqPkM3rVBhwmi0Gv6yDr3on3Scgo/DHruCJf/7CvLY0NHvc3h+jKzjK9uNhNra07LM/4fqSZt16yYJxrDohu1ZVd/Beg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIP0g1CAbVSJGNYmT256hdS6rLGsO7FfPvk9MOgnDgc=;
 b=IhDUD80hEAOYms0FPhS4ZZA70amWJut5/rmLcWMuvddq2WwOswiGriq91cbSp5CkVXXZhvUVN4BtZszSS7tsEYl9PtOYo+VFX7IBWkxfVL1IWf3MoYE9UcHKdzq38mptsjgCzijBrAZJ5K04MiQezVe7bdNlamN/tAEE5iBlsPrIuKRAJHWi7xVgErZpVXiEnJmFb6znqx6RZ5+iTlOTmnhny9TgHlB4JeL4D8H7uKBkAsBna5aP516Ze/l64YggFqBS0zgzKi2ytMXCCIebX6gCKuA4i33uFpQGiKlV9+GKvBs+q84R2xQjkH3NwXEJdI2i3HMI1zMk/bgRb2Hvzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIP0g1CAbVSJGNYmT256hdS6rLGsO7FfPvk9MOgnDgc=;
 b=K/WbhfLgD6TcPZWexrF6R5apI20pW2q/iqwtDXrk2tH0KgTbSy5XiAuqSp63EjgamMfOlJOE1G06/YerJiBOknOxhSd7nJKVUrPBlrzNpmOGREsqoYOkX8gz7FvRiQvDwBJPZVlCk1v37m97Ue5V+fYWm3f22qFewnPS9eISIo4=
Received: from BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::10)
 by CH3PR12MB8236.namprd12.prod.outlook.com (2603:10b6:610:121::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 04:46:23 +0000
Received: from MWH0EPF000C6190.namprd02.prod.outlook.com
 (2603:10b6:a03:59d:cafe::20) by BY1P220CA0003.outlook.office365.com
 (2603:10b6:a03:59d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 04:46:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6190.mail.protection.outlook.com (10.167.249.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 04:46:22 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:22 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:21 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sun, 25 Oct 2026 23:46:18 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 04/13] soundwire: amd: assert msg_lock is held in amd_sdw_read_ping_status()
Date: Mon, 26 Oct 2026 10:13:35 +0530
Message-ID: <20261026044507.2310694-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
References: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6190:EE_|CH3PR12MB8236:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bd28d77-f5d5-446e-8490-08df331c15a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|11063799006|56012099006|261009223027099003|261022113327099003|261022075727099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qw8SuBqwZNH9cm/WrWGM2kD6+Qor1CmWop3mXcqmuyGrtaoeAP1GNv4KOszTpBzwDUlfosNJipoge2318kt2pJuJDBi2QwdPEwzNI1aGGZJlbIX62+NuclxwWt1IgfW+pjQ+9H+AqMnkTZ//m3HC9d6UCLeC4UrwCzvVCyWAx+lbiY6cG9RjOmcg+RIwfXefSD5CL13QO6Mq5vrARezFubmOUQlSaPBa85xvIDQCH23KIovDovTbaxm8paqsA4ZBhb/VJzEVF0/2Q2khHyMEWBnFi6TOzx4MfuDa+nSkTmdwcQI0b1xdecqYqWztVJzTK1lkKYWz5Z2hCXIPioqtew1ZhzMfOPtyN4hqO2pivGODFTqkhTRSfmvoHuMMLbLzCBcYAXA/sQTYlprkhkZdUvjTpjoo+gdlY8MfNwVA8DQRYqctUGnyd1ES28YL5urlfuJyvW7iCv1hWepjMNFz5rkAORRZsRzunKNAH4fAlk4c8EqVONeI+qfYcHmmROuJ+12nFPHg+i9joXftQ6yW83M9YuodwaC89vHkaXKMMd2lIn+NqEW9GNrzGJoS2iNlcXIn06w8cFxkXfcEOMGq/uuZVInGXTUovKjLdGA3KVQS59wJ9Z6GGVYkr/hL7px3lZol3GWC2/HCQZPFmKQBQOBb9Rh25JLRjVoNbdEFZn8dRfen7IwpsFnH5OMpbWDa5seSfm8Jd/3l/XpCCwyorA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(11063799006)(56012099006)(261009223027099003)(261022113327099003)(261022075727099003)(261021121427099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z4Q3wEnAlDTdHdjSIME1YUACw4fn/atxtWlP/pGWFPOXbPNbKasbd4ydQusJDkzyA/8y3hg102cHWeNKHCRj9oNzSitYNidrp07ckluPCbipEoNp6TKKZRIwFK2Xa3JfPF3F7v535Rgxvu0LgdQVmH7IGvKUk89RrAcOKi4bJXLBzD9r6MFqqGcw7J/ZQxjFztXctag0sczxZOK5S5szlvldIYeo1nBiNYeME/OcckckvUOzQG1BIK3r+Livyvh7nVA/IEAQTVx1jLvN8dEDQHPE9d5vIookyZFVCCQbnIz1jm5bOY3eerIxnmcbcRzD5SfzINa1MFC1l6pHFzksnHNvIT8q5Dwjj7Hp1nJdsh5tCs5vPrpnhaef0HyaiV6FsMPmbwpJ3WOJBkSdvxsCaNm7AWaTElIje2iLUk8kyL4FqRT4fN5c2R8ytL8BizW0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 04:46:22.4251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd28d77-f5d5-446e-8490-08df331c15a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6190.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8236

amd_sdw_read_ping_status() is always called from sdw_show_ping_status()
which holds bus->msg_lock. Add lockdep_assert_held() to document this
locking requirement and catch any future callers that omit the lock.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index b75d0104e28c..5e9d228d09d0 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -464,6 +464,7 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
 	u64 response;
 	u32 slave_stat;
 
+	lockdep_assert_held(&bus->msg_lock);
 	if (amd_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
 		dev_err_ratelimited(amd_manager->dev, "SDW%x ping status timeout\n",
 				    amd_manager->instance);
-- 
2.53.0

