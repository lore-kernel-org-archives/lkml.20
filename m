Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792649378;
	b=n/hQPlZhs8yo/0ktyxNKZZdw/VkLmmK73tO0VxJf4eZmou/slGLoPviOF2vK13er9RQJ
	 +XqaCgzeQ0psdIE7jJta3WHffQLa61er60HfULb3+TcbrAGCeSZicgIwkXkV+j3hr+maE
	 umKAPz8887sQIRtS8zjL4ks57oFlCihTOkjc3ja+UlD1PfaJbKfqoKfPyXZ+1L7KxliaP
	 FaDRKafnU6sUcnV4IE5mf0H7AFbqnGsUudZb3cADptOjGFBjwPk+cMcTLD8qpAp4uxAxW
	 ga6mZ8N4I4vzccXyvPPJzi2UMlqknguKcYUCpTMdIMNKpLCbMQ7Isq1GRRLSEibESZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792649378;
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
	bh=zH1uRb+l1AIJT6CmD9xE9IBQN0woLjaEwYLlBeubJXU=;
	b=kV68DjnjGIGy3f+32bYG/nwNNNIfVWYXLEVN3rJzY7AbHYTcY1rCJIQNsInBoFM/mgYk
	 LTYG64+oAlJask9/zPAOqy2v4Puihrvnx/ijwogmfFWuNYiuRicZgCsisvAkBMCDgtYvs
	 x+KDBBlj2vKldxPglEle/mtIas6+DCgDa/N/UeniXIKoUtqZbkEossy0TyQAZyoBhcPCr
	 K+WcfppU4TMJMQl/qoR7owPN8NMEEQ8UOYMVgmDaU+ZAKg7hFUDm5SHyB1RkqpnLKHqSa
	 FSt8ZGONe5IlIYzXEuxZw9LCxNDG6mZc7u3/FxtjwYkr3yCRhmdqyAeqraAvA1Oe8VA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=a7vojyHt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.26
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011026.outbound.protection.outlook.com [40.93.194.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0813606A31A;
	Thu, 22 Oct 2026 06:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0813606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=a7vojyHt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d7mIR8B9bwL1czIi7lgt2bSeb1WdWE2fazMpM5o5aMKJr6NQwEcJShuFKvVmhY6RGyAEglv6Rw1MkrsCjpxAXx4Ls+Wnb5r8z9G4f69JrXAa6/AoDK5/BXBpYyaayHjGIRRd36fP2eIEViij8E/cIOWDklN0hy95o7/Manxm3nvpaQ5GiDR6P1EWQUEJO6PMPPbWoe1MWy4zvd4m9dsCU2mOVGpX+KkA99nLevHlNlGrymMDAPP7KYxh0ME8d2I4dge3wbd/bG0AKllWt1ljo5GLncYzUh61hsrOnMGyGjVS8nSkxiACOuGUHupInNH1/3bG27L7qoxKDqLOPbJyuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zH1uRb+l1AIJT6CmD9xE9IBQN0woLjaEwYLlBeubJXU=;
 b=hcq2Kn/huNoHgy4LaY54KQaE8K6pdgpfnt273mlChIBpIepinRuyY9vq93zVLW6QlUPeAOXOyAJqPLer1aveLgqP8EdoAFkbpgB//K2SSdJjpq3nNyOh9dUc0rDHuhMfFZxfZXGSCA4GtXbKOO6LwSzmvDaJ6+BCRlIZGL28nF3U7VdD1Eb0zBQ+vY/bhMGY49X4D+7iIp+hJKxds65ytcFRBoDv7XD1f3nKX0/HeE6bXMUktbqEfqbVjQpx5iGhLseH1rgTbS1WBO1lXyDY/xrHbtUex0hZR3Fmw6otdbJzRjVB+lEHKAMEcTh/ZMvn3kmAiYnlG4MWUg6wGF0KGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zH1uRb+l1AIJT6CmD9xE9IBQN0woLjaEwYLlBeubJXU=;
 b=a7vojyHtzx7AV7Z4iHmQTFaXhYsZwXBFdxHC+fEtFrWyf3YwVhvsCv2P3O1dqMsUBNtYQ2SeiuvLN6Gn3g0udIbw3oiVdNmlb7gXqURqK6+tYIpvbXu7+oETGwFcJMx0EOe/mmH0caU4SiUy3McPWNBMdjOL+ee8SxTP0Z+Kf3E=
Received: from CH0PR03CA0306.namprd03.prod.outlook.com (2603:10b6:610:118::35)
 by SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.22; Thu, 22 Oct
 2026 06:09:33 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:118:cafe::6) by CH0PR03CA0306.outlook.office365.com
 (2603:10b6:610:118::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.17 via Frontend Transport; Thu,
 22 Oct 2026 06:09:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 06:09:32 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 01:09:29 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Thu, 22 Oct 2026 01:09:25 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <pierre-louis.bossart@linux.dev>,
	<yung-chuan.liao@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <Vijendar.Mukunda@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>
Subject: [PATCH V2 09/13] ASoC: amd: acp: fix MODULE_AUTHOR missing closing angle bracket
Date: Thu, 22 Oct 2026 11:32:19 +0530
Message-ID: <20261022060724.1814741-10-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261022060724.1814741-1-Vijendar.Mukunda@amd.com>
References: <20261022060724.1814741-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|SJ1PR12MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: 14172a43-2a85-4ba2-52a8-08df30030a8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|82310400026|36860700016|56012099006|11063799006|261021123027099003|261021121427099003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gPOhMYQAZKh+pR+g9qtXNRi0Cec+1ff7zp1s6RMZifTkCYzuRsXpZCZmQwrNwwRyK7T0KDi0qvdROuZ0qGpXq0YT2DhG9KgPcLHGLnDslmHx1KQBSnoZAkHuFvRQ8JqP16LE+oLkmlG/NfbbsSbjhHCTyIfekX6uH7eYI0VT6VkF7ADSTshPzeR4/K0oNJK7EbppFoYwTxuBDTH8VpMkkHL2vfsSMdlFCs6Iv6OK0DHtk69zJv8HJQbRMg7VkrPFvQYOKMAh+rHtqxguHm04NY9XTGZk0oNl5yWA5JIgKEt3AB9ggxSBmLsYFN7JXtUw7rA/UT3UVbXRpgy3O7O3D0Y5kCNkv6M5zcwuYiFLRGot7qGgOi7S/5ALK6tInYZqe9S4OLdPdsqkhL2wRV4Wl2KJQ24ENa/Lq0jYbrp1JLmBQF4Xcamfx8aWAEAPOMZqttuPHwwk3qla+1CQgVng063xzU13ipQdE3xrT5yoMKUfb8K+p6pP6cYzXD5pWp0rWayh9GeBNqDKjMZ/mvaAketnu9GCibHwHy6T8cg/yTBWMqzhgwBmFG0l4pHrcrHVQE9ociLmWP5A9HpWojUX1eFI+A8Rf4VjAw+qQyachY4U+NXzSWrkvtVMP6L5bXnwHB3smUI0M8xZWaP8fvEGghONDoXMFukUkUR2W12YiKxADtsfpxzF2JFo+fwjbpRRhK7LJIfxqR0sSuEZ15CtYA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(82310400026)(36860700016)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BuZv6EP4DOwed+Rmu74gzL/CMUFTbGq8zvbrWT8cPCctwRJxJy3LTqGhGL2Pl7sJWWc/5OAxg3u0VgXibOxigPdpKNkQwI27SXLOOtKwUNBmpjp//MFoK1yz5+GSZq7wu5ph4m4eJD1dM4JVrK4/5Nzc+iEwUiBDYiHE2x/C2KRnHy6aVPgHNtLrR1QiFXR2/+MDjjYsn1y5mF/RCZ+q243XHsWmUybZC2cCzuNwAoTdSwcZkXgfjyFk27zvvicFlAN4o+uU2XpF/lhY3JB0hmcbv2uEwGDUNBM4oZ5lfy0KQlwBMCYgLIMayT/fna5TF7KFPSlO/j8JU4X5rhOIAaAz6qBUY3uBNl/iDzUs6+UOZ05Oa1JKeMfFgbxs2Dl+GC9bLP8otpyVgoILvo9ypJOhpig2UL/6hTBr3TUpC0JTwKwI7jVYQmWj7EVZYebn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 06:09:32.9447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14172a43-2a85-4ba2-52a8-08df30030a8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6124

The MODULE_AUTHOR macro call was missing the closing '>' for the
email address angle bracket notation.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index 6ad4588e69061..df89521fdbc13 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -544,7 +544,7 @@ static struct platform_driver sof_sdw_driver = {
 module_platform_driver(sof_sdw_driver);
 
 MODULE_DESCRIPTION("ASoC AMD SoundWire Generic Machine driver");
-MODULE_AUTHOR("Vijendar Mukunda <Vijendar.Mukunda@amd.com");
+MODULE_AUTHOR("Vijendar Mukunda <Vijendar.Mukunda@amd.com>");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("SND_SOC_SDW_UTILS");
 MODULE_IMPORT_NS("SND_SOC_AMD_SDW_MACH");
-- 
2.48.1

