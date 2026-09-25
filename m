Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011027.outbound.protection.outlook.com [52.101.57.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BD73C3C09;
	Fri, 25 Sep 2026 17:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790357251; cv=fail; b=T/XGPIYDxku28+QpxhxYVkPyhgCHpf097/11ffrnCAquy2Ymyj4Bokro4ZhgrJC7tJVWVOFaimAMzBz5W9/Z15paVeh3qa0it2Qx50xx5+FmCbBbAY1iQYrW2CZPBiMadsAgAfLwPbibyeS9kT9cKhZBjAl9mB+kjGyzgqxoodY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790357251; c=relaxed/simple;
	bh=T3UFlg7M7t0hGv+OEf6pUQHbLqTTn2G1lnL4RAkEyBM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r5EnueixcOOp9mmzn9rmt4hOdnM6WQnosywTsDgzCU6A855DfhlCKbU7kE3jdg81aQGdZvxPFysFMofzPuDKNeIY+go/fgKKEUCYZxpCJmMe8dYrABOn6qNhjFMHcgEBV57NHzQORiiWVzv4t11b7jWTrA5mhtPd+xwXjkvtQqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=A6H0DLBY; arc=fail smtp.client-ip=52.101.57.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="A6H0DLBY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YwDaWOWUztgRgHnKfH+kgG0a+T4GRH5OMccKq/tDbooiSEHGPPpUJ0pFZAaUlfg/hEphP92r3BgdGwWi1yoTN7kfe1Pl84pzgFSW96vnRVnAXbjTLp/BaAmjcBtVTVWXwk44sjWgxYpZv8xpEzxJvRmrInzJDplM2qktRoKvuKqkldhHrA19sklpxt3/eHiv7CrYK3Ef3vOht1YuiX6EUA4GJ8ICfrccqNOiqAaV0w317JKBNrVIvW7clg4AD9giWXPXvSlAypo/Ps/WrweJdXFGkuCVt24VU1YtNkSZg3r0fsXWnmuVcMC8rkOfjlLmMJ5YVc1Dt9+JNQgv3a90tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWPJc4JCOrE5KotHUyZ4lMW8FrPeEdZWWLWfLN54txE=;
 b=EmjaHSsWyz4Xktgzpn5NwroYiH++gJYqk8+HYU5ySF9/Ed0FmJPLYOAJYVfvjgy0p7K9IClYjeoTOQIxxUne8h4zNYqqa2Ws1xgHGgox0yVmOjTkoLWucnBL0ZL7frwpGN+q2wmLUQUoD4w4eBpnWeRoDrq08cf/FYbsQ9LUvpRbQQRkWgNT6Hmm5iVnU8vCDVul3vNDBOR6QDw8CNit6i/RSHHY08jPZC+k9nPBq7yl/I8E8lj8yI/H3JN5LcgJ31ceDl6Ejxlgx5wEzr/AT3iE7k40iRoDGdTiljDXUvS1oR1iyLWcYHb6W/spc+oWqDCSgEJQ0Dxv2EArOP20mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWPJc4JCOrE5KotHUyZ4lMW8FrPeEdZWWLWfLN54txE=;
 b=A6H0DLBYuJq/GL+Akjci+UwB+sX0eh0vsC/y/D0U7KhDxj68jcwvBT+2XU2FuAei/yWIsH3Zf4jDHwKfLAbBFYc0HGdHjjkTPZEttXRANyAoShSgY5b9y3dyw57NuZem4An+k+OrZ2fhfXz7Jyzxb161DCZQWddjX35MimuO27s=
Received: from CP3P284CA0046.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:6d::21)
 by IA1PR12MB7565.namprd12.prod.outlook.com (2603:10b6:208:42f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 17:27:25 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10d6:103:6d:cafe::a6) by CP3P284CA0046.outlook.office365.com
 (2603:10d6:103:6d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 17:27:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 17:27:23 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 12:27:09 -0500
From: Vishal Badole <Vishal.Badole@amd.com>
To: <bp@alien8.de>, <yazen.ghannam@amd.com>, <tony.luck@intel.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Vishal Badole <Vishal.Badole@amd.com>
Subject: [PATCH 2/2] EDAC/amd64: Mask UMC chip select to the four implemented selects
Date: Fri, 25 Sep 2026 22:56:39 +0530
Message-ID: <20260925172639.97063-3-Vishal.Badole@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925172639.97063-1-Vishal.Badole@amd.com>
References: <20260925172639.97063-1-Vishal.Badole@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|IA1PR12MB7565:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ed8c6d0-33df-4f05-2f04-08df1b2a42e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CS8js5FSMWiiHOjmkL/AjhysXw1yEeiKqBg4z71/rYVMeLejAjA1khxui7ZG0EQmRuKH+OtDYvnS1l5VSjZFwmvdUsPvS8lKxSaZ4cP2Ji8vaMdXprV7HRKSctKNRTjVkZPCye1j3Yulwi4gZM20SEcH9oVvT2/bz/86u7UAnXC/CIk8WFSUI1ON/5Air2UQFwIhpoKwogm2qU4xt5GzAKAmL5wm+KP2buqwL/MBNhVxizqlXyenl1P99C74wdeQZ0f69nfItY/k8HGce+OHlh/pNds89HUnVwQ1q8lmzrF+Gr+ryLX9B29epwPW4hotjE6w4h07CTBuahM/6uJR6iHY/w5cb/wfKJjNlSQUwEVIQaxx6cYqnT3j/VCVWtezVkVY7AG5+sZWFmfhKRIN5z2oBOP3Ma9UlSkcSPLrxWz1rtSerPzlfe6kKHO0qEiswLlWLNGGtcTaK7uSnjY7BWP/wZHfT/K6BRaMdQ2SInOuusiS9EP1+00g9kOQk46FW6G2z4n1dq3lOFBa9rKsT05yO2JUmnGbOeo6pL3Tkp20ohXctvc9QQ0n68l/4OkRhh2Lw7gnyO5AfAQT/VkgLgCtmxjc9pXKc7rOP9qcxGfHihlfla/vzGu2Crj0zRNOnBnKt/6oYYqSfYxD4rafLsVzqfJG5OSHruYF/Q8No85uBvyej+wm7f7pAvO9iM0dC5CK/htAPncE1SqBMcOjrw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iaUjkobzyKLW4xQObUkEkMklHnqeHhogNEF3u4U2zSx4c9MdwsyO12NFnFte8MtzGKa8x85Ufglbdnf88QaY52scgWBSuYRK2ibMcHxg5Ak+rLI4ov6HyVG6Bw1M/G8aKSHH7q41V+HLtEGpxEkus5yCZveqUqAPZ425Hd5malCQaVoq/riRpK3QraAZolzg6+28vytY93hrrZ8CYP/r9p5DUbvccAJ8nR/kGI6krIXpd9kvv0yHV5tdlJqENKtdK2Itgunugf4Dmc54oSt/DhVEB+P+k5Ew7mHVxq4Zt8piquATGtPfpXOknu2M3mS2+Bz1a88gAfESLDeqrRdokwf51+QGGp3dtuYerPgvkgZ/8lnpquTCxzdsxCa+J9PvcHFMT89vjYjJ/zpbXFRSXdMBjzQ249y8zKK3n91lYLrC44DzC+VZHBF/+vnMAIcZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 17:27:23.4014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed8c6d0-33df-4f05-2f04-08df1b2a42e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7565

umc_get_err_info() masks the Chip Select from MCA_SYND with 0x7, a
leftover from Zen 1 where the architecture reserved space for up to
eight chip selects. Only four have ever been implemented, and newer
products document this as MCA_SYND_UMC[1:0] = Chip Select.

Since only four csrows are allocated, a syndrome with bit 2 set decodes
to an out-of-range csrow and trips:

  EDAC MC0: INTERNAL ERROR: csrow value is out of range (5 >= 4)

Mask with 0x3 to match the four implemented chip selects.

Suggested-by: Yazen Ghannam <yazen.ghannam@amd.com>
Signed-off-by: Vishal Badole <Vishal.Badole@amd.com>
---
 drivers/edac/amd64_edac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index cab696be4f07..b69c3f51dd37 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -2802,7 +2802,7 @@ static inline void decode_bus_error(int node_id, struct mce *m)
 static void umc_get_err_info(struct mce *m, struct err_info *err)
 {
 	err->channel = (m->ipid & GENMASK(31, 0)) >> 20;
-	err->csrow = m->synd & 0x7;
+	err->csrow = m->synd & 0x3;
 }
 
 static void decode_umc_error(int node_id, struct mce *m)
-- 
2.34.1

