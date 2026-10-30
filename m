Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353740;
	b=dzsPPFI5ENk/37nqUEcoS8nv0g4HFC6n9myq/m/HCsdPJ+xgOPtfr1x32C3ObTpW7Jrz
	 ZZXbzxsjX3wfGb+y3YwCFBYMlszh2w5fvLgg63v42s6Bvj8Va2ISIIJaCVctk26dbsMsW
	 onOipxsSd/TkpGJVPo/ViJgDRsjOJAInN+v8yECMsjJ7qmZlkLBgi9A+bYxWI5QkxhIoH
	 Iai+NMx6CrqkQOA5oPMatBO7SHLzd2ZfC4A8JBqbc+pOO6Hv0ZmmQLCumzL4NZerh9V3+
	 L+j/ERL9WJpKec2xdwQcf7o2fDJAe5bTd/nqAZDuOBO7/XC6iKKQE5OM+O3o4CpdWKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353740;
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
	bh=TO2Wm6MaVk6MF/o8mEQO5Kl7TkCretTVmO8rqO3D2Pk=;
	b=z6b64I5MgHalWwEkTijllPYj+IMcXkCotKK1+lLPt4W7Jflenb991mW+IpDHBBKIPJxq
	 GsCk66VndMY0sTTLHfylzbpXqpKcTkK8/UMfZ1avcJqZZPnPoRPI21P4EZj8xLwfN3NK5
	 pil07fbxWxXNwX6uWFF9GdpwgsJHzO+JtB/KFjme/tb9dMPM9XBjXv3sTQenksBA/2uJf
	 fngbNAUr+TRCxMhHGHukUl4VkhdYt3S2mAqTU/kFVkHrZS7KvlrrVDks+/xq8o38ljGrb
	 jVjuTwLCw6VoKjcagUri9Wde39hTiRc/7mjOEgql40UEKrmFoYkOSK8LfB8jiPFAZzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=vmpX1rt+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.19
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010019.outbound.protection.outlook.com [52.101.61.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9281D606A326;
	Fri, 30 Oct 2026 09:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9281D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=vmpX1rt+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E7Dx8cYV31yP1QimvK+Bq23M4F1iW4xT8whh3yFza4BpGDi4lwQmBhxX/lz9yvtRoeWyj9J2qdyADET2y1BnXrdeJS3+6cNvBbQVIXloxXVXGpZ4kwRk4MYo2nMAgo/z4t/nugwMnigdy75ci5wxzU52gXHiWBLFq102yJ0mh4Hq49JGRMuIPxKOZez/Z7c74wut9hDx5RQzdO8kfsMsv7sdDaIYxpk8yHEuQVpk8UsQibMdVDyAdp8IpQ3ZEuaXLwKWs3sL3oHUTM5ZGSqeVdQ63sHCi10RDv+BJ7KFX4fMBY6ySDhg0ydpWStF5/+rF1RAnuKMiDYdb3ScuZOw1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TO2Wm6MaVk6MF/o8mEQO5Kl7TkCretTVmO8rqO3D2Pk=;
 b=Xj8neuacMBJEK4rGHg9FWvXDDA7TfgBNz4DKIv722swNH+2O/YAlvWA84orZhnJuYf/Q4yYSm6FYQNX8ledOXoUinu9tzJTVF602RDfh93EDtruMUB5JuYMfICIuPBWq2lniSel6jKzdS9ZWBzG3jkO4WJalfL8OTdbU4K5IhHR/mX5evWr0cX28MeVr+Vj761+Wq1c42CAbSMxxCr/9xca96wOoe6tk6tjwiXLrtHseFNesWywoHdy/m/5DJqwPF+9xkLmmLu/jiAG2eONeUpcYCH2ACyq5n6QsdHXAzJTviDMdK/qDKW08URQty6s2gIa4t2J2AdvLyZQEB2KtbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TO2Wm6MaVk6MF/o8mEQO5Kl7TkCretTVmO8rqO3D2Pk=;
 b=vmpX1rt+HF08mDHY099f2s7x+u824Ax1qDf5cryD9Zr3c/TkVnVc7s1udVuPieG6VjI2JLOAEzgzVFtK7fVoOyyPIK50wDLKT2ij4XD1f1/ZoGYut3cAWF3/YKAADd9xsvggDwqisGwwXw70UECKa8nYCLK5XHxVvdedDn4H6Bk=
Received: from BY3PR05CA0031.namprd05.prod.outlook.com (2603:10b6:a03:39b::6)
 by SJ0PR12MB6992.namprd12.prod.outlook.com (2603:10b6:a03:483::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Fri, 30 Oct
 2026 09:48:37 +0000
Received: from SJ1PEPF000037B4.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::4) by BY3PR05CA0031.outlook.office365.com
 (2603:10b6:a03:39b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5 via Frontend Transport; Fri, 30
 Oct 2026 09:48:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037B4.mail.protection.outlook.com (10.167.244.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 09:48:37 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:48:36 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:48:36 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 30 Oct 2026 04:48:31 -0500
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
Subject: [PATCH v4 03/16] ASoC: amd: sdw: remove unused ACP63_SDW_MAX_CPU_DAIS define
Date: Fri, 30 Oct 2026 15:15:18 +0530
Message-ID: <20261030094714.1123396-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
References: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B4:EE_|SJ0PR12MB6992:EE_
X-MS-Office365-Filtering-Correlation-Id: 423b4069-70c8-45bc-0fe2-08df366af88e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|36860700016|82310400026|23010399003|376014|22082099003|18002099003|10067099003|11063799006|261021123027099003|261028144727099003|261022105027099003|261009223027099003|56012099006|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	+CDhb/bAkiKUg7Oj5OTxIAF2E2DyU2OUp259aVsOHygxIhASOpwKMMuHZkmr+a55e/DWfbkNEdel5zYAQuCZWZ6V5vGa5nhhbFH+UlhFXbSdDDiDGaNL5m2pz5Tsc0+MRigCLc4Hn5VI2l2q+PcHAD0ATA32fDlZTYfugwpgttZ8itGYjaNMx5+JkFU6v3fz6huB6nEgtv3MUII1NIoG9FtygjQZcqu3yaiPObuiPEBKYfReW7d9dFLgQvZezZr/fbirtuER8ODxoTGaDQOWCprj5i9tGIZASEdwICieXhYtPfP1BjsrbwhWSZ0e9rADt/QMrq9/cpa9fZQdyClfseg9EWgXlfHASSJwLMsHT24vZYByd1VxmQJLPMhGPuQZUSUVm+yx5iK4PfZDoOhXI3RkA8PJI2PVl3PbFdGguFx7H6prp+SRU3petheCb8olNExYMXOV0UpZIfa+fkrXeBH6F/KHaT3vccN/REPK0t99BcMhrct7bdZuta526pMCxttsqj14hAcba1W6rs9C2U5jJ09VwdkX8TsnpigXFvVGjV632SzwK4TNq5FzfxWqiFeEjhIqLzqKRB4oNL23IOJsxlLlgycEQUpR6tOnwLRDEd0By7JANAbxllGO+TyWQ/DwMuDshn3De1UNj199JJ8Q143sio4Dxkb8IpfBJpZt45p5IcgjnPY/72CkaLyE/cwA8fAlVFjwwfmTxg2MIw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(11063799006)(261021123027099003)(261028144727099003)(261022105027099003)(261009223027099003)(56012099006)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ecZCrAogS892RTz93zafBLzlsCggtr3b3JCwRr7rDY/vExbuyBhl7eB62qPr2M6p2Yu+jMh6oBGDBOoOQNH3U3IRqwygtuUdfNyGq3ae4Tp+Lx/8zgdc/yQxxB4mf10D5XTxRSJeepARdtOshf+m2OwEuocgYLORmI68qjQbfojXwc66RZ5s1zcmmtmaY7SbwiQcQkS/ZZqnk1RLo8OuYu8INBBmdPaaqVRIGM7ks9jcCocXgOQnBAuw04F69fNd5nYHUIGP8HkdzZmNbofMb3LWa7gINMvhXsnxhHkkDeHJjOXvmz0wJA+2PDk9m7PCpKMS/fzb+DiLZMRlWvBE54HrGSZcn0m3pgZDGYKpWF8UrPBeUdjanqoMaKaNgRp1xwvbEk1s6TGdsC3YURMwER9tJXcKFMOlAoAZicGaw71d4HVKxv9PfD5MzPFuYTW7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:48:37.3062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 423b4069-70c8-45bc-0fe2-08df366af88e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6992

ACP63_SDW_MAX_CPU_DAIS is defined but never referenced anywhere
in the tree. Remove it.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/soc_amd_sdw_common.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/amd/acp/soc_amd_sdw_common.h b/sound/soc/amd/acp/soc_amd_sdw_common.h
index 034c9ab6e4ea..0ae85165573d 100644
--- a/sound/soc/amd/acp/soc_amd_sdw_common.h
+++ b/sound/soc/amd/acp/soc_amd_sdw_common.h
@@ -15,7 +15,6 @@
 #include <sound/soc_sdw_utils.h>
 #include "acp-mach-common.h"
 
-#define ACP63_SDW_MAX_CPU_DAIS		8
 #define ACP63_SDW_MAX_LINKS		2
 
 #define AMD_SDW_MAX_GROUPS		9
-- 
2.53.0

