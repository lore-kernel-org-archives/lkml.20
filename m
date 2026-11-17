Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794899617;
	b=Relzl3TJLx+Rhcq+MyjAV26pTpEPKpyoEnfpO2MLMsH2ubb+3YZGSN8BSCecsjH8ez5z
	 vC4F/iQ1MiqqNLXWaXWPmVGMSfTK63SiO5zL7DBvoSqF70gC5pcEUwOK/jQ4+jbNPqluO
	 DHbRQ6ja91/x0q91ropwzqzdBSlazZI8rwqRL1li7brOIkc+83PdNRjQzAxo+tau3NU9a
	 kc11Q/Sl+6xUEYSIH3zB751Qz4NCia2Y6d7SGaBVcW5nUcpY/PEnXuujfKMYpD5Zzzo3p
	 IFd9W0HH33fXlZ+4ncmkr/LqG69AIHAJRus/Vvvnn6va9QBtfs8+6E4zp3oeCWOFyUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899617;
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
	bh=ZAmZXCd9DoCl5xp2oEHX2i/xye6tohsrBn7Em9VkZz8=;
	b=qYVt+mID8IssglnxF4L581V8mEi9ryY7+W5me4mXEuhujg+QxF0kX/3BsPdavtiRsGBr
	 u89wJRAfxljcrqWIjPGxth2qTK5cYJw/V6kc0hV84RMg+2nR2ZLxAlI73qYrlCg3Hxbka
	 D3d30bYpqWyI0ykQKTYAp0Ey+Z8SOw0wW6IIBkGd4t1L6y+Zz8X7TZJu8h2A4ktB6IG5v
	 5RGieUv3W9/wcyy4z2NG8QbjAeZW6Iai+i16ojH5UEOUVSjUM7afIZHxuWEIJw8FYFX/t
	 az93gaMup2lzRfVFUUgWkJgdEQIjYUXDBRKdXmhYMzsA4tZ1LvAnovur0WeIQnETNsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NdV4Mk0R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.29
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011029.outbound.protection.outlook.com [40.107.208.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3EA606A31C;
	Tue, 17 Nov 2026 07:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A3EA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NdV4Mk0R
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3anuhJSgsGy9Riu5gK9t4+0K5LED3h4yCKX7dhBHHkc7uSPXY84vRoJ/xR5RpTSQslC1vkW4YCwqlNBjU6tapw6fsMd/Z55ptkySMfg6wFxwgNnTsvhnhJQge3k+tEGD8HHpwYqyrPMlCpEnS5eWj3G2L2l7VYUhy3j1cuUNdIgWa/o1OjE3qvSuovvGNvfLSNeGMlJZaGYJxGoGSJNltnejwbVKbtsSGT0QgCJSHvfUj+UWLYHEvSmS4uGlx6VZ3ScYUW1glbt88TddYlNYtZA4z0ZM0gxLZb2XMDx6Cvo+S5tWk7hr9UuLCEg6h2KX9DpQMDq+RKWfNHKX+4M0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAmZXCd9DoCl5xp2oEHX2i/xye6tohsrBn7Em9VkZz8=;
 b=CgJFB42Ws4e8RDa3V5PW44dIdGSk7xsSLTB8g4+wsQAGKVgRAxXvTDjh0OnDMNVBEUsCUf+pC/Hm2qAbzbybNwg0i1RbncuKyff0XWz1Yg2GahDkLOEvHc9bU1cilLhxnpZr/1Tf0mJ2hA/ScAqKG4xyWj4cskCoWyC1r0CPX4ZsGHxbQpxbOLqgK8r8YQNL+cNo66Qu53v/aQzvJEywCs6NA1U84c842TmGEpOTmK8wL5hLu7c9kKi0fPIwxb5Rw9BHAPfT/ooL8xINxBjNL9xwNUHF9YCwjOlO2m6b7QZhg43CMxBU+LS1+Z4vx68scF801Tbd8jCi9dGWY2dcOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAmZXCd9DoCl5xp2oEHX2i/xye6tohsrBn7Em9VkZz8=;
 b=NdV4Mk0RECc2xqFMX8vZpxHRaZRd1aBmQRhJ/OzUcimBgQp/sGt1OnfI3EJzGg1eLN7Rr8j5BiHMbTS7NThbkKEflrIpbNcqHkGV8L2Yxbo8UKQOYkL48hOP3Gk1+IJ2VLyFI/QRyyegAt2etn7R1Eq+KJjZLk8P361HfudwVms=
Received: from CH2PR17CA0013.namprd17.prod.outlook.com (2603:10b6:610:53::23)
 by PH8PR12MB6796.namprd12.prod.outlook.com (2603:10b6:510:1c7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:11:30 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:53:cafe::64) by CH2PR17CA0013.outlook.office365.com
 (2603:10b6:610:53::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Tue, 17
 Nov 2026 07:11:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:11:29 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:11:28 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:11:24 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v6 16/23] soundwire: amd: delay *sdw_ctx publication until after startup succeeds
Date: Tue, 17 Nov 2026 12:35:51 +0530
Message-ID: <20261117070906.803139-17-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
References: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|PH8PR12MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e6d9ea6-35e2-4666-5052-08df447a00ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|10067099003|11063799006|56012099006|261026140227099003|261021121427099003|261026121527099003|261021123027099003|261022105027099003|261102130727099003|261102123227099003|261028144727099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xFSMOLmpOK1kh5skyPAkzMJA8J7ZJYIM35jwqbb6xW8TtjqHIRv5XuozKIGeu37hppDuENyCBf9rlkj7FRc4uoZGOFNVky9uOGKcn1NXnHYj2Vwvb2dF42G8OlUOzJvD6WvxdE2boWHVRtsQw5ykJ83pN75GHY1LmWosfRK9pwYisH7b6p3lGo+ujXyxcawU7JaaBHBbLBgKcY+hHcj93d2pPdTTqOQRg8fVUk/Qz3WiFmGu19r0xpiNd98UzTuGqUguuKWn1xPTB5+h2RWrJnxNYdM9K7PvQmaIqNiZLRFXlAdTPZ/WYBdBACGIJot1wOXq5ZyA/JJW/44ZBUuQIN4KJ4trhids/EWrzD6ypRKba4xdSWnV0B3Oatnfpy5l6Hsj8c9p/XJ7MRVJhyvbDqVk2HFUSLxE55JiRcCz7j5uzxrWm6AlBrQJVGRW1cYuE/3hn5nb6EmisPtcRL7Qx3aoCLRdxTVftlBWS6BggLMv1YCm9A2+cbb4SmX3/ODxGOBOO4MvUmunBKafrGTKIj1ZK1yS8zwWlAj5dfdem5dSpa/InXI0MgTk8ODVggafwTYtJl9oyj1HDMboW+C6iCWRPKGctY32n0ux1LgXD4mLwDgHCrwZRuRv2IcG3NVbE4e0d329K8Kz9GIfMWeFxXogidYeLV1c0IsHYwtE+G6REMrF22BfvU9NesxMG62L+rw7eU8NIZpekHQ6nh3aBA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(10067099003)(11063799006)(56012099006)(261026140227099003)(261021121427099003)(261026121527099003)(261021123027099003)(261022105027099003)(261102130727099003)(261102123227099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WMAPqfmXF9cdsHXa+h9M/1w69K00EXAWSSMnkUbq0wl5oE6Byy7WiltmL2ApuGw15dSAaGFoXCb+OTFVyN5B/lNXJS5nwOnDUXVn1fTtiUfybyJjwBz2N74/DP50Ux96HlTmM3pclV8ZzhYBkbD5JTG6jcB0IjDGn9lDtPezNco5RCNhAJ5IvWsYSYmDhKHjY4WY/KH/CVnRZU/WaC2etX5oEIDXrL/okn9K3ikYJ3oTi7ccZvrB4hW4QZ5aXvsHAZ/pDFv5GjAIWRACAEhMtpiDfnb/al57a/CU3tGdig19eJ0Ra7nvWdafCMT23xblx1WCjHtivLf2Q0vPx0PQNLowNmDTRIPcGnI/v1hTp9AMegybusy+RzsqMqykcnCOqSyFYTvoAP/vUyHSYANL7B7q0tiBI+qaQim0KUTUPm+iBhCMtuF9eykve5X98l7x
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:11:29.8256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6d9ea6-35e2-4666-5052-08df447a00ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6796

sdw_amd_probe() published *sdw_ctx immediately after
sdw_amd_probe_controller() returned, before sdw_amd_startup() ran.
If sdw_amd_startup() failed, the error was returned directly, leaving
*sdw_ctx pointing to an allocated context whose platform devices were
already registered. The caller has no way to distinguish this from a
genuine probe success, so the context and devices leak.

Fix this by using a local variable for the context, running
sdw_amd_startup() against it, and only writing *sdw_ctx after startup
succeeds. On failure sdw_amd_exit() is called on the local pointer and
the function returns without touching *sdw_ctx, so callers never observe
a partially-initialised or freed context.

Fixes: ed5e8741b8db ("soundwire: amd: refactor amd soundwire manager device node creation")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index 8019a4faeae5..74d6c0f37104 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -182,11 +182,20 @@ static int sdw_amd_startup(struct sdw_amd_ctx *ctx)
 
 int sdw_amd_probe(struct sdw_amd_res *res, struct sdw_amd_ctx **sdw_ctx)
 {
-	*sdw_ctx = sdw_amd_probe_controller(res);
-	if (!*sdw_ctx)
+	struct sdw_amd_ctx *ctx;
+	int ret;
+
+	ctx = sdw_amd_probe_controller(res);
+	if (!ctx)
 		return -ENODEV;
 
-	return sdw_amd_startup(*sdw_ctx);
+	ret = sdw_amd_startup(ctx);
+	if (ret) {
+		sdw_amd_exit(ctx);
+		return ret;
+	}
+	*sdw_ctx = ctx;
+	return 0;
 }
 EXPORT_SYMBOL_NS(sdw_amd_probe, "SOUNDWIRE_AMD_INIT");
 
-- 
2.53.0

