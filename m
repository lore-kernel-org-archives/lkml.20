Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793928402;
	b=CwLfQwVxXv+6A8DxB2CTwEwMZwCFOJ0k9OPSpxTHGdj8GyVPMSh5l9dMBQNZiyks9iqV
	 lwwbiXhkOQVgGHx09DnGfC9aX7BCkXeSuD5f2AGXKC8dkahoHK9CXxbsH50qA/sZC9bgx
	 R3J1dcfBLIVYNUaSauMCU6tLD6DXCPGUJr5RWAEg2+rtqDZded8cfO1npYgdaSillpY4y
	 SOIfhCpHeTVofqg5KSS0wHS7pRoYyykIVfh8Cc6IPXvuyASQN0CddoyLc5I/7wixT8rK2
	 POnt1FmpNsJLxJmsX6AKpbkbA+RlzZbGIR8ehRG5a2f+0YFItpV5yvP+pMZuCUtzdDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928402;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=ShYnw1snAPCERRKyOilcELuoaXALfq+VzsCjR16QH5Y=;
	b=ZfD4VvfFGiw+EYv4lNlcGOm5sq+r33JMPQHOhHEbW75VCDVcXDwUHarHwqEUR+7lU7rz
	 /OxzknTm6/qcAeFzbYEDGTKWwWPjGdLMDyvRzG/rcnGC5FpLXyQM5mbRA/jHeF/07cOuX
	 B8nbRD5vX2qeb6jHshWgHwZVjnuaRso9YKLHSo0HnAZ4oBDpZBlfcd+9ridfyFjfXR+D8
	 3UrMqyaQ6YtIbDo9kSLbVEKjMdWZw3JQsukwqfneaCeD2oRDzf4KaX/Bp+25IsmZCvGkg
	 HK4tYugK5+vgyfLTHT5IXXPqPekrzldDRzIUdnUi4EEAYCBmm6EMegI1hoKZ+4O6MrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="owJpA/Oj";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.13
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010013.outbound.protection.outlook.com [52.101.56.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D847606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D847606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=owJpA/Oj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ux2ajp1VnncT18CyyOXCKTOSEf/EoiH+do75lmlKlUemRWZru/nQ15HQkHkB1bueYt+jbJTdMmMxvVzC4eYNx9bmZftrNJcxyLUn7qlChdzfe4F/yP/9Sph9BNUzoaVb3vINP5rLtLg22RHK0W93w9+oAlBbZV64oTfMo9O7UIVGByXz3K1dI/deNZAezH3B1p2a8sIh6MI2qpFex4t9L2sDRR5HusIBmlxcSwOYjbljuqXZav/upft8hHYLNrkTRFlPfqmWzebyEFuD5siW8c1oCfmJZoaHT9A182UkoH1tRTh/g1bqAGMbXo31uWARMJ+w20S6Z1+zS0Vy0iE2Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShYnw1snAPCERRKyOilcELuoaXALfq+VzsCjR16QH5Y=;
 b=pVNvWYjcVesdi1Bp/l38Bn7YXIqdJYFxNufH6o4rVEXYyomN6u7dWSo4OMJZ/XxEfc7xu3hhuj8W0L1by+JK7t9uHqv4T/NSY/0bR9YQSFQQM9NySj02J206BebpluG3hxB7y96Wr8+g1HQe8wncBGMvNXVRgJgJRS9vXJjLNfOOg/cGC94iCqQ3zUY5NcF6nBA5L+w4ma//uyIWWmOYhYpAR9FjAZLOUPM6S37IeIjElm+VXkEPGTjIEKZrSDvQ1v/A5avB3abiHZkm9PcecLoBsMeEiVdlhCPLZWfa4R164Izs/SEt4yr4UKKWPfnaKdugLa29TkNAhai3Kc0Bzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShYnw1snAPCERRKyOilcELuoaXALfq+VzsCjR16QH5Y=;
 b=owJpA/OjIPDBNLXWoIZ67K0c7RzLrDYMbRI8bnQw7bglhZ7hrYWuriqbeZ4h4o5omqrTs3wdW6j85yk/wjNxPNQIk86FOTHZOPxUXtD1DOHrYxfG7njyfumthPvbhIi0qUBKEnlWwzGvYPampxpGxFl7WML4wa1hvjucAPMngx0=
Received: from BN9PR03CA0383.namprd03.prod.outlook.com (2603:10b6:408:f7::28)
 by IA0PR12MB7602.namprd12.prod.outlook.com (2603:10b6:208:43a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Fri, 6 Nov 2026
 01:26:36 +0000
Received: from MN1PEPF00079400.namprd05.prod.outlook.com
 (2603:10b6:408:f7:cafe::6) by BN9PR03CA0383.outlook.office365.com
 (2603:10b6:408:f7::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Fri, 6
 Nov 2026 01:26:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF00079400.mail.protection.outlook.com (10.167.249.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 01:26:36 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 19:26:33 -0600
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v6 4/7] x86/sev: Add a function to contain all SEV-specific setup operations
Date: Fri, 6 Nov 2026 01:25:30 +0000
Message-ID: <e90ae109626fb7271e597fbe4b930f238eecaf36.1793926736.git.huibo.wang@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793926736.git.huibo.wang@amd.com>
References: <cover.1793926736.git.huibo.wang@amd.com>
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
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF00079400:EE_|IA0PR12MB7602:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f016f6d-83f1-4d27-232c-08df3ba4ffd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|261028144727099003|261022105027099003|261026140227099003|261009223027099003|261021123027099003|11063799006|56012099006|261102123227099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8t31WX25C+6gmLB9ZupFV9gq3qBPjXWmLpRiWSCRY1x6ep8JygttcVxgqcdi7GrRsAXiOdbp6KYnTu4Al9Pc5aIAHGQ68OB978NJp0E2V74FR4cV767onBlNEpTShmTP9I5QWFztIYO7ItM+mYpMGIp+qlol9yqxtV6V61e2cAazUc1Zj2IrV/IJsiDuLl+sUzuuAZgI3kSJxjQkfWlhguhufCA0p4LnSBWC6JBYPR30AAeHLKHwiF2n66RyBG7JMD30djLiXU5YcfChZtmg/T/ieLDE1vBpyyvutGwsUqGUHgh6jSh4u/0RNrPWQLvTYoBMan3HqtxnCrUzCi6l+orpSKxST4vXPAmjHHRgGK/gXXKHq1fi6/j+KCMAnNFUsUCXbUEp6u2CicmrCnTWK56+ZcerxZoh/VrCbD7Ee5qyyJJN+6TZI//BkMwXr2GFstkT2RFowpSQAYTCq2KS26GQqmijzvrn+i9IoWp7rGYJkd1g90/EYea/ro5b3P/deD1xWerTgWXkkDIlZWt/CWwS2Jb7VrJbNVYR9+Qdrzg2gD1R7aEzpGMu7y9SYuyJ61hTsotJiMtKN8L5RTNEnrDhp59z1VH8Arm5h+iIux6Cbc+X21zEXxYnwpaQQptFympezuw3O5zH2O/bYNsqXxPAgHcuGv8XzHQegaWPua8VvN1q1kSLxMh5sVdpMSs71cLlB/ryCko/NMU7DakAbw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(261028144727099003)(261022105027099003)(261026140227099003)(261009223027099003)(261021123027099003)(11063799006)(56012099006)(261102123227099003)(261021121427099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iEd4pNYcpOlTD67iy5QO+8QeIdlP3KTcjOS4hLasnNVWM3p2KcXdkclsj6MbfaqyoT4rpKOnZyeAGNCvjy72mvcJfYinK8paUkUC5cAXIp6n42JZjF8YQZzy7TKzrU9MxyJKSNkGIISia4aS6M7g6/HYgA7Ii3Zyb6DHmb5NAxNwTKF4VRFF+XEnQWe5BWPRa8GrQ+iHv9yi24u4/QcbSTItFpY5EaSzgMXe4LoJt5Du8mHDBIxqesWYNTPN95VwaE5K+XPBD1wm9w4uuGZPtcP4RPovc2NhNHwS3bycrrpUCesVruOrna5iwRPbyLVFEHJehBEfsGGddToUF4Y3UZDPf9iL+gIUgZiSn2LyNzbqcjRRhuMdsrE46o1QU3O/iNcwen6pDWOFBRmrd/6H20o1j8WR4moxZqMP004gz2WbkKaBMmX7p+xbBw2cq9K8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 01:26:36.2288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f016f6d-83f1-4d27-232c-08df3ba4ffd5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF00079400.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7602

To make the code clean in the boot phase, add a sev_prepare() wrapper
which contains early SEV-specific checks in order to have all that code
in a single place.

No functional changes.

Signed-off-by: Melody Wang <huibo.wang@amd.com>
---
 drivers/firmware/efi/libstub/x86-stub.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
index 253dd3ba8fab..a2f193da9bde 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -786,7 +786,7 @@ static efi_status_t exit_boot(struct boot_params *boot_params, void *handle)
 	return EFI_SUCCESS;
 }
 
-static bool have_unsupported_snp_features(void)
+static bool sev_prepare(void)
 {
 	u64 unsupported;
 
@@ -794,9 +794,9 @@ static bool have_unsupported_snp_features(void)
 	if (unsupported) {
 		efi_err("Unsupported SEV-SNP features detected: 0x%llx\n",
 			unsupported);
-		return true;
+		return false;
 	}
-	return false;
+	return true;
 }
 
 static void efi_get_seed(void *seed, int size)
@@ -937,7 +937,7 @@ void __noreturn efi_stub_entry(efi_handle_t handle,
 
 	hdr = &boot_params->hdr;
 
-	if (have_unsupported_snp_features())
+	if (!sev_prepare())
 		efi_exit(handle, EFI_UNSUPPORTED);
 
 	if (IS_ENABLED(CONFIG_EFI_DXE_MEM_ATTRIBUTES)) {
-- 
2.43.0

