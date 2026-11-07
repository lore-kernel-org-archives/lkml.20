Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794089448;
	b=4d1cYOAWv6/OyfDyDbOVs7VVtBngmYpH95ibm9GSETMN96Ph96RqOj4Um5Rm2MH7kijR
	 7nh4M2Ao8ZxjFt3RNT5Mx8JnyUJZc/boJfHv9holMUy+/bFgLEBAKD88sV7jjfjJvoGHL
	 g2jcHz/XGiAgOWH3L4u0CgNbs7nhBBvmN0dwHjl+TbTs+H94+oeJ3Arj3m0i6+dpG2v//
	 Fq8gaFJYxcB2GXmDYpcj01OSbB1LN9fPa/5ouZmJ4cz1IYIv9kjfVRW2XMjOGJYJPgDnv
	 HDd3XJlTy2VdvdyFNpFhBfhVIhzdaPkOUGGmFeZSALZeJwCHYSXzNkfYtjqOHt/ZroA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794089448;
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
	bh=Zh42KvkWDrqIAJ8C80zqvT+9sgGFUxhf/E1WPKGMTJ8=;
	b=1s+o2HWorzb/d1j6pDkNr9elvWFfEGCmXUnZmMIHVRdheXugBfMG9t+E358035CHzMJQ
	 zRe5wkYE1Ru5PIBZpvTMglcX8w1jPIA9XPGH75fRPHvsOU0PUmvd2/0MqGaC2JS9kf+qX
	 C3jMoeTPCX7WtCZNHqkZs+4D8X1KUReS/BjslF1H3jnXbOKvgIkZl5lHF9uLKY+jnCH93
	 EDjYls7N5sLOYOvwCEjhE92qAkPEUOJGQnl0YWED1J9O608fcCPEWBz+ebRZL8SriZ09I
	 QsXXxz4F1fXRVVQSLQKHAyj29rhcBFoGVDwkAbPqq/q7rbOPnJEwUOQF8X6YDOZhhsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ctPnTxTO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.71
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010071.outbound.protection.outlook.com [52.101.85.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AC1606A336;
	Sat,  7 Nov 2026 22:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1AC1606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ctPnTxTO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nPuIQHZB/6it0JyjB8OenvyvfXysPkIwlzEUM5MyhFzG6O7o+YRzJ+aLddz0zCcFoHfE+R43awFeX2sT19pQNmIO57nFhfnydLBfh/ggA19eMkrag0S9zPqM/eRh+4J1NLjv5QLV96Z7+8mbi9wlnnc6LJ42LRaBm7UyD/EQbZToguMWIDT2Iy4BHdlgX69uix9bOpQjEyDbrLb661DIbTe7NfEbcoESe1yktcOTnkaoUDbKtzNSHeBn2LMX3uAFQQY2W7wwOCzzJ+7PSefICUIjp+OOg1RRi+2k9A19QvNcVh3836znf4N4PVDdO1f4ycd3crpr4nZhi5Ri4rXaSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zh42KvkWDrqIAJ8C80zqvT+9sgGFUxhf/E1WPKGMTJ8=;
 b=qnnYZoyO8k6+rA4C41jsx/yIv+VieqxgdpRGx177C3UzSKtH7XeSATplQGniuTeewo6NG+iv/2Y6gY2mItdBIeYITP9N+HnKFUa9psKl88I9/50u0dDHsyjyU5PgtKd0OdxPW2UJ/rZkHqz+pDoU3kzDzCZjpo9LQAB5qAW8vnCaB8Kpsd+yOzrtSVmnZJd/ri1s9yr4QBja4EMz6TVt2rH5u0foh7LZCV+f8HYjxmwEmY0SD79ZxuahGldYOxeT3J6DTXvAblxdfI+7YOQUGxQriINq6MuIq2BLmdJP6PTJjcD5NjAl+C2hwo2uaCLqQgdNF9C1Nxt1qvhezOkpyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zh42KvkWDrqIAJ8C80zqvT+9sgGFUxhf/E1WPKGMTJ8=;
 b=ctPnTxTOveMre/mHOwEKyAkm+hk1U8wHbAL/dDBDS4vfM6M+ETre2X6uQ8WQyXguTJFGktpi4vhGs8bgJuFi9ihesmjCTdfyrNRULOPQTGg2V5KcLhrWENbKNU5rCJUOrH+YUpYHgdaP5zSVskpAc9bNrL6jPfZN1AUjGG9JtQM=
Received: from BN9PR03CA0708.namprd03.prod.outlook.com (2603:10b6:408:ef::23)
 by CH1PPFC596BECF8.namprd12.prod.outlook.com (2603:10b6:61f:fc00::621) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 22:10:41 +0000
Received: from BN3PEPF00022BCB.namprd03.prod.outlook.com
 (2603:10b6:408:ef:cafe::81) by BN9PR03CA0708.outlook.office365.com
 (2603:10b6:408:ef::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 22:10:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BCB.mail.protection.outlook.com (10.167.248.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 22:10:41 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 16:10:41 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 16:10:37 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>, <Poojitha.N@amd.com>,
	<sravisar@amd.com>, <Richard.Gong@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 04/11] soundwire: amd: add ACP7B/7E/7F DAI PCM capabilities in register_dais()
Date: Sun, 8 Nov 2026 03:37:59 +0530
Message-ID: <20261107220913.4058072-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107220913.4058072-1-Vijendar.Mukunda@amd.com>
References: <20261107220913.4058072-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCB:EE_|CH1PPFC596BECF8:EE_
X-MS-Office365-Filtering-Correlation-Id: f058b13d-d0e1-40d5-fc3f-08df3d1bf663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|18002099003|22082099003|10067099003|261026140227099003|11063799006|261028144727099003|261102123227099003|261021121427099003|261009223027099003|261022105027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	CIlxSYP+I/LwlmmA4iNkNfAMiqhBiRJ6USR2bpkAd56cyFIKF8qZXUu4dMd5GNrlMeIUW9NY0WW0F95kcuazZjIS5oFg3SNb+MOTKRieCJSRfamjf2K80FPq7jKL5P575oxVe0o/jGGRMaX0nAzX4MXPH812Imt1gcXQQAhlV+7EnhB38TDfJpfxlZcm+SgjrQuzDfDDGZPXtCO0kUVaFaYrDgD1oCkDh0/kBkdAH43mBBNK1UJXcd0DE9w29yJl4WtlpeROEVdilY4giAxj6v82vHDMkenLrC68uorlRnmlCG58sjMwtX3Cv/bN5IXisxR486ByHTRnUZ9xnLImKxUvUdcx3NvBMjZdI7U/wwMsbDtE2fM6lbjD9XFXk9Eip5SDXMhoCiWr7Hq/EkDMFCLqBUEtluWCau4FkMhB+cjAIO+JHz30sMX2U/eT6EVRt6ooyjFAiJ/Eqwz5OgsoB8BTySE40iNCht+suSMnK/hWr6H29HwH+q/ou73amAREZT2qiCSZy5V7aEYiTSbtXtV3QuqateT+uJ7PLSeZQjH6b0Kzs7W8rJzH8Ks8NH9DQU99gVzC6aOC+OEKwjtlBVVklCzoswpP7MD23gh6Fbn4+i28V+4DxfFalBOqkH04U/Hsoq9WBG6Ts1hN8O7jZuqjclRxqRUyeoVGLRJHGlhJFGlh2IBgLTVUQgpY1P2q756ngDOoD6sHwW6QNGQBpA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(10067099003)(261026140227099003)(11063799006)(261028144727099003)(261102123227099003)(261021121427099003)(261009223027099003)(261022105027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z7UjCREkGerW0lVdaDDgfb7YhaidRMTJis4V7llMJ5/Nbz8q2SqDiGWtm4J5h3aN5oWLph1gEtNiMA90r89FEC33afxsVmQGJs7fAvhAARz/s8nE16KdQ14BdrBaopB08Jf2p6QoUQJ1mLh5c3QsH9U1IZkxr2mLp5YtvasVUuMfhFDWhjROnRV1WAW50PGsgEEyTEl77BKBfTBG6+DCdroef2S/s8WBKGOMIFQrNcVuwHE3mePa90oioRzL55WGh+6bLW6daXgCwfbGT4NZl46I155X4dLk+Nf17xuJRMOUga3nlBWU3jP9rnCGrDXQRx8dYy03ma7H/iFNCNe0hlCX10bE/bmqcpSFucbTGqmD9y352BC1ArWzJZBw7lFOqyyDGz6Tl8XV/N4Aml2UxXFrA6tKRCflLzpxjaKAascTSSV2f5UjLpE5i+7ANsfq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 22:10:41.6633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f058b13d-d0e1-40d5-fc3f-08df3d1bf663
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BCB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFC596BECF8

ACP7B/7E/7F SoundWire hardware supports higher sample rates and
additional sample formats beyond those of ACP6.3/7.0/7.1/7.2.

Extend the acp_rev switch/case in amd_sdw_register_dais() to set
48 kHz / 96 kHz / 192 kHz rates and S16/S24/S32 formats for
ACP7B/7E/7F DAI streams.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager_common.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soundwire/amd_manager_common.c b/drivers/soundwire/amd_manager_common.c
index 0234ffec71f9..b16fd5b032ec 100644
--- a/drivers/soundwire/amd_manager_common.c
+++ b/drivers/soundwire/amd_manager_common.c
@@ -425,6 +425,14 @@ static int amd_sdw_register_dais(struct amd_sdw_manager *amd_manager)
 			stream->rates = SNDRV_PCM_RATE_48000;
 			stream->formats = SNDRV_PCM_FMTBIT_S16_LE;
 			break;
+		case ACP7B_PCI_REV_ID:
+		case ACP7E_PCI_REV_ID:
+		case ACP7F_PCI_REV_ID:
+			stream->rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 |
+					SNDRV_PCM_RATE_192000;
+			stream->formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
+					  SNDRV_PCM_FMTBIT_S32_LE;
+			break;
 		default:
 			dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n",
 				amd_manager->acp_rev);
-- 
2.53.0

