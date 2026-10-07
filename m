Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EFB3BFAE8;
	Wed,  7 Oct 2026 13:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791378569; cv=fail; b=UOq99fK1X/dls1DQQ7/n3vZJU8vrQH2bMgIBMGNT82KEETMKOSSjsCX/rMG+OqGJDu/LRwInqeLnfBuLeEm9LchvvY/yO4TkWJnLejhGMJINCbhX6Lm33tdX8QmWiptfJNTk0eko9Q6kpXXwjRxl9B5avSe4NOJB/3rzkulNI8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791378569; c=relaxed/simple;
	bh=jZo25VDHvZSeHAthILctIvBz39thaIIJtQHfQctVzCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m0+S4yEfjA6OYeymE9RmRm5TCf965dG2YxUOflhwA58LkZfHblDF7Gbqdtx7+4cZORlzdUA3y9+4rx933mKVXONjWJqjnH+CVVjVFm/VY7101GuckJMvooW4KgL9CvYROH6KCapKtchgaHor7aZOHqEqqJzk5js+Ch+oIbrx/xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QyFyBouU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=IuL7Keus; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QyFyBouU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="IuL7Keus"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697Cp7wX2398834;
	Wed, 7 Oct 2026 08:09:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=/TnFKPfPVvF3M3zs
	cilE4gsBkZgMqCVvsgXhFMJ76iQ=; b=QyFyBouUKnLvYz9xWC2F/2Qh3pE+aub9
	ZUmZn/QjqJhq8FOju8pWGoybBRelU3vGht0czEuOXwOR8wqq5Ho4ObgdzD3VuZn4
	c1wWinsPRTDKV83HkFO4BoTbRfxOdJXW7NOBIvLDhVx5yMrhE58VfzPPhLlNUhj5
	EWWkbKnQ7Z1qQg8fGELejwjEjFHl7XzXv9XYqY7ol9YPt3vxbLJMfk9p9czhKMfP
	RXcU8x4/FlWAnM+ku4FzwRIYfHCTxEpblMWQtE4wRGJKYUReOKOIdRmjxwmsZ0Vr
	OUZWXRw1RA1CDvvjbc0WPnmGzEcGtSW81sFVTC+PDZtytvWeLPKnlA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020089.outbound.protection.outlook.com [52.101.56.89])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4h2x4hd7vn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 08:09:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2/RkIMLTc6J3RaE2by4dk5/+XDOfJgHUV3u4vAVx/WsyG+b3Ee8blu3SGgLPnzE0+R82DmSSUkc4/wPLTomSasJ/WmGqgw4zhiRg3y80t9nlRl9z8Yh+7zrQ+yrvvo5O9qDnGvohLYyKWNR7Hj/zGlxDZUqEWXwtfnO5LX9vw5CYCrQRheDsE0lobukhdTicLuQaM4pQ6RoqdWFuvuvCQbyuz2BYIUpgiXRbGcV+zCMyhSNuRxccsFu88A9LVSKKo2c1MwYmUkeUux5ou5NJVxayYGHd7HbO5hJp6/u7XM4ncG81eMtwvawbPoH/8M1T40+C5i5tNNZe3NKlWKqEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TnFKPfPVvF3M3zscilE4gsBkZgMqCVvsgXhFMJ76iQ=;
 b=RvlUDxUPw/FWOsX36qc9swNl5QQVJl60rj87d6/zXPraJCSNt04Am51vnZqO5HpuMmnV0c9XwKv/BZPkJ5fMjbEDdEGQLrjf0sAmzKkAS2cLx6D3RKbMkOrZ2opda/T+BZtxFtoyaHqeS+a5s5VWXHhftQagBCCPOJZZACjuIvdIqWAgOtRWqvomLRC2Y7WnIUJTfHq3fY6ROktWSWN9cx3bLExpURdV0X/CvaTZ2nIIDBeoSKHLt81wxmyGRpZRz6vtdLPZm9fIaWAGRvvT7SJ086WZ1YZmv4AU48+3Jta9Mr8jpbbIAU/aPuWvJXAveUdJbycglGd2AFVI6nuWzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=amd.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TnFKPfPVvF3M3zscilE4gsBkZgMqCVvsgXhFMJ76iQ=;
 b=IuL7Keus6yzpbZfi1FC8itScmMDwRgzSd47N/jZLUPwqb6QVQewW631SQPRmrGTPk4iv0quH3h5QPfyHQIGpf5zsVnhtBMr/Axt65r2iA521zvR4bvSdOI6IjhmK3t3XqlBsgspYExJ6/V0xrDWo0eSX3Z3uA30qVcatfzWrCVg=
Received: from BY5PR04CA0014.namprd04.prod.outlook.com (2603:10b6:a03:1d0::24)
 by DS4PR19MB983986.namprd19.prod.outlook.com (2603:10b6:8:504::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 13:09:03 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::71) by BY5PR04CA0014.outlook.office365.com
 (2603:10b6:a03:1d0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 13:09:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.14
 via Frontend Transport; Wed, 7 Oct 2026 13:09:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 816BE406544;
	Wed,  7 Oct 2026 13:09:00 +0000 (UTC)
Received: from lonswws01.ad.cirrus.com (lonswws01.ad.cirrus.com [198.90.190.226])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5456782024C;
	Wed,  7 Oct 2026 13:09:00 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, Vijendar.Mukunda@amd.com,
        Simon Trimmer <simont@opensource.cirrus.com>
Subject: [PATCH 1/1] ASoC: amd: acp: Add more ACP7.0 match entries for Cirrus Logic parts
Date: Wed,  7 Oct 2026 13:08:57 +0000
Message-ID: <20261007130857.102432-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|DS4PR19MB983986:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ba101b10-e697-4e75-12cf-08df247428d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|61400799027|6133799003|18002099003|16102099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	xYEQzd8dv+7pMsRBNgyZ+p1/FIecC/mu0F5kOSFx20dIX8Ecot5JMAHL29iMituT62mo97pryg3iWE3D0Oh+Q+fbyjjLQw1oZdZEEQE261UvB0YXxFWbVZfttGKbDxkrv8cULv50j1gwvElaRd4Gq/TWEzyyNXMG5xswbhkPXaAJLOoRdf69Khv8eVwywyzgiJRJxDXBqqE6pwjZJjuqEFs3FkPjU8+89hJNQWp/HjFBwPlib45IoJyPy6r/lA3AQbMkN66zW7E0ee82DtQdvgRqCyTQcGOYUvtYsyK9HW/ZLVzKdVi19uRLJLo+yZgOGzD50lDsOrfiftRsEKO/dZr8iHLl+BaM7azAB1sYs1CWHAkpRvJULbVHWqsDs4gn+z3rhZdt+0gFeKZruclon1ylo3SjRwD3/LeGlG1PTHpeG85cm7KJcfvrVibyyS2Z1yyy9f+NfvvuhWczatakC4bCXQiMAeKSRXVhBN0mkhZOefDRQMWzcv0FEm1Pg/ndaU5tFertW9HPQkm90iHLhZpz5XIW2Zswb0ZD3iQ86WjHH6e2DlbH6dbr0DaEKHXGH8DwJBt07lfFzoo44YJSfg7HyQWQUEvwlg5c9RUh3O23mV7kFbHTpNuhqJIxuCeXsL47N+/3zIeDP2TmB3adk+t1mDebVH4Ht9K0vWW35uNbFj7auKCfogKFr0Dz5iI2mBF7JemjNMlhuxIMMpbFtg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(61400799027)(6133799003)(18002099003)(16102099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	51+ZaplgqmXRf/9mXtrLiX+vGJG+qaQEThXvBy41I6qp0xTLDz1UnjjLFkOP9RMqvtwfu5pnYcwLM1L2Yf75TQ79wLrggPPSgHUrk3UwvT8Odq3lN7+IAkKgJu2RKMa6Y7JSQY6F9p2WTWp9iTowDzq2IWyMdZ3jeb1rcmZkOuDakSkeK61WgUCm77dz+QGxp/MuveCC/k4DrejJ/UDj9bOCdkOB7oeAvDNNDvKosyS/ci+LWI9d2BNvfgY9f7YUEjvX056sv+mu/8CYpymcg3Ij50nPfocjgKtqDzUmP58Se40MA7/5PXYSxOd/2vQfYLgmpeeSux3Z2VJ++D0KF37tp68rfN+9ZtlXdO6SPJPWQ2xUKNXKxrM4dQiZ0ZT+Pgploq7uMt1qKcHM6OyNed465Bp+WDz6fM1FeOoqqJE62X7nbCleB9bXGVovZla0
X-Exchange-RoutingPolicyChecked:
	MEk0+pPc9eDepuj4pDtAYCK+rtZ7LV0lt79dR0AVqCoDcsnU9S+N+yQMB68T+y5UpfWN+ZtS1bAMc8SRgPiCzQ798SUw/kVHM9J20u6AXDM6dmfh/UJOmdWAiNi8fz19c+8a83XRE9gtE8W+Fw/m/IaGLTrGhfP/wARieY8Jh6jaKeT003Br4u5z22Kp4PRfRp+46yqe0Yk19+i+52oyANwm7kJVSPNc/Lj8yjgtWMLut+kK65+jtNz41BID5nOczk09hw+f19HVhVYIDwRLC1ps0FNlZRqBFMUxeefUnI9UfqmOiDQBijcB4GWr4oQQ7ejdT8636Go0vUtffTC5PQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 13:09:02.6225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba101b10-e697-4e75-12cf-08df247428d7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR19MB983986
X-Authority-Analysis: v=2.4 cv=DuLDa2/+ c=1 sm=1 tr=0 ts=6ac64474 cx=c_pps
 a=BKqWZN8aUWREUN+CsN3l9A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=qKTPGvb-W42HBqNtdGMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1MiBTYWx0ZWRfX2ybkIZwjq5wx
 palVtIsFRX61D1CuEABtpeKmRFfAm0snOPzJnBNH81U6VYvND1kC3Z/k4rYL7JWJeGVSjju0co5
 hE4arBTouVUa/JHY3CpmWC74iECf0soAc8p8mrHJlfMcPmqhNp0NGJcsK4gtFYI1GsgDyl5PPkh
 h918w4jPKNBxQpickFNm0DmsxY9BejHXAYsPKupX3hWdPPoPUveSNZb+2vsOPD9VDaviZ3pgdr4
 eriiVz+Cg2EXGtQcg0pNMDa1vIKgB3t6/3GekTNWre31cGdxf7bgtvAz1IhpU/c+K90prue/dIO
 MQLObMfVjejjEpn8oL7gdUS8m9oR/Fou7CZ/2zcZFyyQTyryrAgtd8rr09bIbF1NAUWCDABNV0D
 ZmdA6s4lvD0pKKr07ARS7OsaGba07VsENM2OjZ2SMlsABHxmHD0dwCFLpVnOH6BVqYewMr40nZR
 vPQcUGr401MfwD8OOYQ==
X-Proofpoint-ORIG-GUID: sJkwYevHZAdarurQsBiIv4pKghm75O5S
X-Proofpoint-GUID: sJkwYevHZAdarurQsBiIv4pKghm75O5S
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1MiBTYWx0ZWRfXyrUmWOOpC0eo
 lGDtL4j6PAxslFjeqML+XwWommK5sH876oRtZyoR22E3xfMePKogpCJBwMxkLBgjfPCXxOgLKJz
 +vVtLXEKSUsGD2BClND7RctVYaU9CaI=
X-Proofpoint-Spam-Reason: safe

This adds the following SoundWire configuration:

    cs42l43b link 0 UID 1
    cs35l57 link 0 UID 0
    cs35l57 link 0 UID 1

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 35 ++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/amd-acp70-acpi-match.c
index 2a9da6de7bbca..c2f0479301ebd 100644
--- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
@@ -335,6 +335,27 @@ static const struct snd_soc_acpi_adr_device cs42l43b_l0u1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device cs42l43b_l0u1_cs35l57x2_l0u01_adr[] = {
+	{
+		.adr = 0x00003101FA2A3B01ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l43"
+	},
+	{
+		.adr = 0x00003001FA355701ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00003101FA355701ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP2"
+	},
+};
+
 static const struct snd_soc_acpi_adr_device cs42l43_l1u0_cs35l56x4_l1u0123_adr[] = {
 	{
 		.adr = 0x00013001FA424301ull,
@@ -438,6 +459,15 @@ static const struct snd_soc_acpi_link_adr acp70_cs42l43_l0u0_cs35l56x4_l1u3210[]
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr acp70_cs42l43b_l0u1_cs35l57x2_l0u01[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43b_l0u1_cs35l57x2_l0u01_adr),
+		.adr_d = cs42l43b_l0u1_cs35l57x2_l0u01_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr acp70_cs42l43_l1u0_cs35l56x4_l1u0123[] = {
 	{
 		.mask = BIT(1),
@@ -820,6 +850,11 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
 		.links = acp70_cs42l45_l1u0_cs35l63x2_l0u01,
 		.drv_name = "amd_sdw",
 	},
+	{
+		.link_mask = BIT(0),
+		.links = acp70_cs42l43b_l0u1_cs35l57x2_l0u01,
+		.drv_name = "amd_sdw",
+	},
 	{
 		.link_mask = BIT(1),
 		.links = acp70_cs42l43_l1u0_cs35l56x4_l1u0123,
-- 
2.43.0

