Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794899497;
	b=jtiVDzm/YkN5f5ICl4AgLxQaKXysN1SJlq+j8aX2puGIgVkHenoIMiwMOgbjICtDN8Rh
	 cBwQY2qSXf5ZCf6rjlnijNalXvfLsmujBDl07vB8ZtDJXhem5mtqJcP8FCef84BaO/34f
	 SGlhnhDzCuEYpseXT8DFGr5/EE04Rf5EGS388ReVufqKcMhCy6FkKH34uR6BuI4KnBSAT
	 DOs/SO5MJL5WxbqEpHwx2x4PDBtfr2AqDsb/H2ugDeANF8BPuC4WHwAM/tw0sYf110DJ6
	 lLCCJu9E9zRlFgxW1IBUl28KltXwl1A/FMYBaNQvD2STfeOeyXgpSHH+F8t/4C/4YPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899497;
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
	bh=mom1yHCINSb5p3sykc2XVN0qgIMnn3q/LEvMdi9yOTo=;
	b=r7Bk23xmaBcok5IL8dv/pcOj6laaS2Msup5eogdJIJis+UuOHKzDZkIc2sEggt1AL8jS
	 iXN0zfTWRkz8uz4zgjF6OeBhQEyUUPWWG++pLMEkhLF9l26/TEZVqxQIKp/+vgA5mSLnB
	 GS8CiMI3OKirLIzRlNHNuN38E/M/Oi/qOxOitvTfS42Lt1TIDZUN5aQKpI82AInAWC945
	 SUz1uan5Z3upR/99T6U6xAsQmNefeE3jF7WYBHQIuTKI6dVxiYtH8QZ+q50sFutQcQ/9m
	 CfCWok+b02j7i0/UR1PGs5ieEve6fa9O8/C8ytMnzjCciIJCTQGJm1hgLiMybV1mlUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="B7m/XKOc";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.24
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010024.outbound.protection.outlook.com [52.101.85.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55404606A33D;
	Tue, 17 Nov 2026 07:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55404606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=B7m/XKOc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQNm9t8vqof/sfNw+NuSN0YNiFEtnu/h7N/Z4AREPGK+ZS/DjysD7Ts7+fNRrmFE76KCJdpQ6Av4s/UxVtbRpnKN/FbwfX7ZqHSi/NXqpagTfZNVSd3NzXGXm1q0gwfHoDR98FaCq/AlpfKXeU0bjtbE6//q1MTM9QZ82ICQV8egpU0y02S7S4mjzQD/bFYlxs8+MBbMGiBg5tVBLMR4Dt0PP0INByFvOBzd0KFajBV4l8/KYvC6Lx6Uw9YMloFwJ2q394E/lvJMoP2ycVh0+Vu22gcK5aA2xetOmA+y3BMuFUVVIENKZTp2/g8SNc9IQfo2nyhb3tezw1zVSmZZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mom1yHCINSb5p3sykc2XVN0qgIMnn3q/LEvMdi9yOTo=;
 b=wYu52SGy4RK+S85kwbKy3R/O1mqnIFLXfoNCdlGLOG3WjvkgE0GU/g8DaQ27oB71WI78nQN298ko7t+ZZPab3A4r4+FwOE4yiXkSHfUf71Jweqa0KpDdy9v87T96Jyu222kI/KBW1yBPXHnFDVX8CrXc1AXYzei3MCbigfeTQM4eqmpqtX1gIHu7qB84eCi63aE7jlFTZpbef9ZtHtabg2RncDLTRTQ3Mkn4wRQVd1WzKX+XCxwrFy9VjoFvqpe/BZSXqK7+ezTLm0bgfZFTf+bEiHo6wj0iNNPlU5+9SkvMbMI3TbjHAEw4i8BZMuZmkWjYkJg1GTy/a1W9kOKdow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mom1yHCINSb5p3sykc2XVN0qgIMnn3q/LEvMdi9yOTo=;
 b=B7m/XKOc/OV1hRObWqXI91NyoYjTCFNNaFGKTmBadreVZXIcaFdkmkVMqVopeU2cBd5qXK8h8WTULFZmUfhkQ7VbrgJb+wcnwf/qC+cg+ohI6ZBYfp/vFdG+jm+5pmLPjVABi5SBfQskfh1B0oK+RHXKS/km0xp3q0P54uDZBOE=
Received: from CH0PR03CA0253.namprd03.prod.outlook.com (2603:10b6:610:e5::18)
 by IA1PR12MB8222.namprd12.prod.outlook.com (2603:10b6:208:3f2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:11:33 +0000
Received: from CH3PEPF0002457D.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::61) by CH0PR03CA0253.outlook.office365.com
 (2603:10b6:610:e5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 07:11:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0002457D.mail.protection.outlook.com (10.167.252.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:11:32 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:11:32 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:11:28 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v6 17/23] soundwire: amd: propagate amd_init_sdw_manager() error on resume
Date: Tue, 17 Nov 2026 12:35:52 +0530
Message-ID: <20261117070906.803139-18-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0002457D:EE_|IA1PR12MB8222:EE_
X-MS-Office365-Filtering-Correlation-Id: cbe45829-12ff-4bec-d131-08df447a0283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|261028144727099003|261026121527099003|261026140227099003|261102123227099003|261021121427099003|261021123027099003|261022105027099003|10067099003|56012099006|11063799006|18002099003|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	40bcUpZIuDeeEqgNJxHXySgrBMhOFFJtAFFVmc9FkU+W6EjW3lVat6wtHPGhbqIbbxlIYwjneVGKV+CfyLP4+gAMF2OvJFviGtJRXB0xDqMlSwPyQo0+ersmcjMuu6ojhl/SbiMrV3n7UIKF2wpE2LrgR9tYCxVFM5D5eUV7ZEx2H9KWiE9ucmNoYHmi9VQ6mM5Bzzjjas+W5CpchBOe6buu2E6lUKirtUDM4l0PdX/7is6Y/Xl6vC2xHJrifIoaHOFLuBMCdQ/R4QeWnP01KYjLL/y7Qg4EhgKEcb7eIdc1SXS8ikphrUbF28iG3xM16UZELQw0TTNl+UN3sHlhFk95cwehH+emUcOqYQoD6sWImQNoUNcS3cM9AG6FbyFxkh9oFbbcsUH7SOWIKm4ITlh7KS5NLaly8+2j9yWnMZMK56uEhczntxz2as7ijQSs8WqkbIqPZfP4xE3ObEFIbAL8u+YgAx0jZa2osDTOPAtTAzbG4VuPH3uinR3KCvMb4HXW6Ybb/cyymYiYcXFOpY9g6a9i7oLhEZJAX22XckziZkYOytaXoasCBII4gCFTdqkdj4l22tVLGZQTTdqdElPrxeRwdVeGPAMeoHjIklb6kl6EQ3ap5VdNh9V2j7yM7fXWE+eRb2Y3GqW0VaIMnL5jAV+RWUUX4AFsWcunPN2uM2fm+SJlK537Zr7Yeyv85Ppjh6y3h88BJEl5+fpGVQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(261028144727099003)(261026121527099003)(261026140227099003)(261102123227099003)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TuPlKqePOh9FJlAEU29pf6dYnOKgQ/GlXoZ8TyJCZoB4jVdyr3pUHG+HspvfeZmPKpCt2WfmZjdjxpSbnEW9JOGRw4/4+P/ggt7D3on2/WH3PwsVYwk9vdrV/i1fSZxXymYsM5yh1KUODuywAaqbU1w2/LGIAVXbsRF4VoF/AMdCXtwBpFRhoqu5uQ/1YETxOKnLnBlfX8XV6PtaXUyGfVX99IMS6wWIlzoFG/mjs7OUFmZr2k/sdbZyYMWnHD/hTOWBL8+rpz16Uoh5T2gV+d7R98jZU/1AJGu1hQLq9i5Epndm1ECyw7LCtCRsBsj6CxOmi2zT/8uyvpKVNJAlcy7Q+g+F4Ls/55VX26GoGbRJYW83cljvGFyJw2zjTWqIriBqkhFIH7+IA6WnckBm0il5Brhd/bEbAUDMIbwpX7Nj5skG0XVbJvwEb1A7+ijF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:11:32.8240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe45829-12ff-4bec-d131-08df447a0283
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0002457D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8222

In amd_resume_runtime() POWER_OFF_MODE, amd_init_sdw_manager() was
called without capturing its return value. The function performs
hardware bus resets using readl_poll_timeout() and can return
-ETIMEDOUT if the hardware does not respond. When that happens,
execution fell through to amd_enable_sdw_interrupts() and
amd_enable_sdw_manager() on hardware that may still be in a broken
reset state.

Fix by capturing the return value and returning early on failure.

Fixes: 81ff58ff71ad ("soundwire: amd: add runtime pm ops for AMD SoundWire manager driver")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 1a3d3af4e0a4..934a8f0f3298 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1591,7 +1591,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 		ret = amd_sdw_clk_init_ctrl(amd_manager);
 		if (ret)
 			return ret;
-		amd_init_sdw_manager(amd_manager);
+		ret = amd_init_sdw_manager(amd_manager);
+		if (ret)
+			return ret;
 		amd_enable_sdw_interrupts(amd_manager);
 		ret = amd_enable_sdw_manager(amd_manager);
 		if (ret)
-- 
2.53.0

