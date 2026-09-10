Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013000.outbound.protection.outlook.com [40.107.201.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0B3568FA7;
	Thu, 10 Sep 2026 19:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789067133; cv=fail; b=TMtbth2jYntKtqt7waTmRfXJFZnSp8bzaVTYCoo4Msv+vfWZQyT4jmdTLJgsW0vrPbXtylrXSSnFwY0z9E4CncrD891ShH+93nImFZshd7FgMjAfiW7J5v5inWBTzzi3FbfvyYruALbVLSayIG26Vewogn3l2wGK8WgkYjol3vA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789067133; c=relaxed/simple;
	bh=j6ZWkAhaWpl5Wvfvw5PdFy42tR2wYIrAkGaqLbpAZlg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W7FClOsh2Degvgn7+JmaNkABKC64CRF15zF9RZr+uCI2xOH+cPBR3U9jdNQ+/ioayjF0xWiTd/vj4LCLuk8Z3BXD1a4mUGLimWct/7FcSRx2wHb0rPTJyxFhyOiIzdbfIbcXZ1yKH3nmLh4GZ6n3wp4Io0J2nWOBWBI2DDI2zoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dYd1Xm+s; arc=fail smtp.client-ip=40.107.201.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dYd1Xm+s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bEBjM8duFpSRX3x/HtI5GqLbKvF9v+wzufJyAA7QIfcOj1wU5FVY/kMidaHY/IemiaAuUv7QCTNVKRkingFq9sm6kdpNLL882+5NxtKG74KrDin0g+GyqS1uzol7u5055kZQHzt1q755Zdjb4J3GdIxy04qZIMMUg6xDqK5P+6+7F3d483KuUPwCIl8ySmyD5+LU6yHz24maUfNRf3SUdHxq/wEOslSJhvmug8IIeFTA8fguJb0PXOWOEAqEm/M0ffRCKfOj2zqtVWxtc3KybfRcPIyjHSfv/N3pBjJaz9vIkhDpol2RNK5feMScP+v0CXgVc6M44GseZv7P90uPeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXcEEB/rWlVlM/YCXOy7QLZ2sjE2sbD1MRfMg9Ll+uk=;
 b=L9lcad2MWrca5Lf5kjroaSDBTsxyOJSa0sesz1fuQeq1cXG6kKmBY9Y6YXJ4HFJGf4ovkZaeTm2x4+FmqyUz4ID9PMtfRgNT8A0vsRp0yBM4mNwliC1TJQ6cXSarY049zd2KMPVLDFHy/aBEEBuKVXv4U/dA4n8UaJbGDn342RDiUimCOE2H1fuzzEnu07Q2rU8GEka5/VcqYn+aVPYhHky23DM2L+M9/0De6U66u8cX0ybvahM6EIbX0HjJZZaRrsKqeavkcU9hHhFhk23l8PLLMrGPQLOoHcZmgsPXEgfDg21S9Oa0cnKwTQa77KAvNaArWQE9Y3Cl7yvsnKsIKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXcEEB/rWlVlM/YCXOy7QLZ2sjE2sbD1MRfMg9Ll+uk=;
 b=dYd1Xm+sr/ZLO+MLgtoyZN9fKcQIi9D4tBtkrsLVVpcCNnwlg2qzO6I7Out9BxfjXD5BQIVbrdJMhFThHuRg+8+5m/Wvs/DxgSbLweTUvGsQOvymU4PnkhnFjWDA3OrGpc1XSD+JUMox3lo9vuhBF1b74Lndh7GR4I878hXyPTo=
Received: from SJ0PR13CA0073.namprd13.prod.outlook.com (2603:10b6:a03:2c4::18)
 by BL1PR12MB5707.namprd12.prod.outlook.com (2603:10b6:208:386::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 19:04:02 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::91) by SJ0PR13CA0073.outlook.office365.com
 (2603:10b6:a03:2c4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.5 via Frontend Transport; Thu, 10
 Sep 2026 19:04:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 19:04:01 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 14:04:01 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 14:04:00 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46
 via Frontend Transport; Thu, 10 Sep 2026 14:03:57 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 4/8] soundwire: amd: fix ctx leak when sdw_amd_startup() fails
Date: Fri, 11 Sep 2026 00:30:52 +0530
Message-ID: <20260910190240.1604447-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260910190240.1604447-1-Vijendar.Mukunda@amd.com>
References: <20260910190240.1604447-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|BL1PR12MB5707:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb5a959-9413-4df3-1080-08df0f6e46ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	T5H2Kg324QtNxE2abAa3TGSR1loczZ4jobloIehwazBe3Fn3mZ76JQNhLO9wDtMS30G/f07leinFmDP0BoqebPE6Q2RbgKS8kyzIrpi1WdJwrAwTnIZ8/kphsk4GSwkeHG8xDiIWUFlFskdKbPhMsIwAX9UrNQcgJRG+TZSBZazTzLd4Y+q4Lq8euc6FEhDvduxQpWpkRcZfcSyMqScvswEluTR2A+mfjXoq8qbGSjVze2zJEOkQdhmttp4QtUwTwFOPQG+WfF6xjEr1ts1ox5hHwpr6el7XBKzNDfdOKxKxaVKGd4S0vh+R2HhV8VbB1iIy9DQPM+RMxyged+dZYIrXtetMwRXVUka3qA4hGwoxViptQe/ttJUmkndDA83CbGzT+IOD4XkwZev80e9blUyPXxVEywS35y1TQdWj44aZ4x8O6OUbDJ0Z4eQPKUYn/1mX0UVFeFKY0MFIO4NvAOmrs0T6EKJqNdywNRfD2wK7rapgdukuzlqWeI0PTqLpxvm2ZVlB600DI62ymWZUSaBe3Dv5HFJgAGyS/iGqbnBElMMAbuyZnsePVn2EpI5bkubis9LHBMfmZFvmmgrCTPSkFn25ydHklNNbQFUsQrZh2CnLc7zE1FT+Gls1Rf9Xss7qpiFTEHcB/hltaq4yEMP3/cqhCTHE+UCWajxcxFgdnI3BUm5xzato1DkFI8obqGkPvuiFsd4L5Ik50CeZOw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	isYvkZCOZpCKBzEce8/dwfySXvy7tuMbflTfh4p/PFgQfiNEMUAuCOuOnTcItCJI/8Om6Q4QmQBmf5DkGUQqNHJNVp2t7nlAD3RaTF0EFBRwlSaoLydSIuvZNaqFs6baEnQUqMDwpwZqfwq9VcAeMwO+rlnnlnBRMlfUJRv3WWssL3KVqmXwnGay+5fd5JVYyy87bQVAlHTAuPAh1DHxT+sfL7Yd0Bl7mXiC5Yn2/3K85wFT3w3uairh9ZdXidKfK9D3JiorYi7eQjHJJEAztQDP3Ukhx6kXozdUN/NI0TRCMovluubc2ObqySUSuwGNqb30xqGehQap9hvYkT0nyEPCDl+TKfQv7IZ8zPm5MZbjhrj+FZ3yojFqcKXr2zFbghCqHA1zP/piROX+8geDj+ZETcHxRHtPtWFPESHktO/uvHvpllOaYznFPNZwEZJW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 19:04:01.6675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb5a959-9413-4df3-1080-08df0f6e46ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5707

sdw_amd_probe() allocates a context and registers platform devices via
sdw_amd_probe_controller(), then calls sdw_amd_startup() to start each
manager. If sdw_amd_startup() fails, the error was returned directly,
leaving *sdw_ctx non-NULL with the allocated context and its registered
platform devices leaked.

Call sdw_amd_exit() on the failure path to unregister the platform
devices and free ctx, then clear *sdw_ctx so callers observe a
consistent NULL on error.

Fixes: ed5e8741b8db ("soundwire: amd: refactor amd soundwire manager device node creation")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index 8e419ddfa516..88004d59322e 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -166,11 +166,18 @@ static int sdw_amd_startup(struct sdw_amd_ctx *ctx)
 
 int sdw_amd_probe(struct sdw_amd_res *res, struct sdw_amd_ctx **sdw_ctx)
 {
+	int ret;
+
 	*sdw_ctx = sdw_amd_probe_controller(res);
 	if (!*sdw_ctx)
 		return -ENODEV;
 
-	return sdw_amd_startup(*sdw_ctx);
+	ret = sdw_amd_startup(*sdw_ctx);
+	if (ret) {
+		sdw_amd_exit(*sdw_ctx);
+		*sdw_ctx = NULL;
+	}
+	return ret;
 }
 EXPORT_SYMBOL_NS(sdw_amd_probe, "SOUNDWIRE_AMD_INIT");
 
-- 
2.48.1

