Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794899455;
	b=KuGOCVy5FkE3W5mOtnjksjuhlqLR/u6Oy84T7nv0B3oXATAb2t/YQa2Ux/vRNHbBSScH
	 06HhGiuncY+2JEm1KDtZiGXI7hLyvJsr/Q5jj6xfuNx0Nq/qyFxJsb21OgNobexglr1wd
	 PIL1dsLETGhpHGZRScO1qwDv7I/4XA/yFM5OeZD1O7LUBwfvUMgbPVbQRXd546r6QvMJ+
	 loBmyB3q9NqUyjL9K67qNVk+MIotACa8FdEAH0eWaVFimJ6V4Y9wXX/X12oJGaNyjQ09l
	 97q/A20Dv8Q26WTWraq4cCH/sw+mnjY3Eu6AX2HHx7XEkdJgJ+0mrJ9dxP1JZaP5P8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899455;
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
	bh=+DxTiUk+r404xJF2B2eH9YyqPjPNXh4DuaCT0vkzGhk=;
	b=wZUPOr0D0drxTSRcXoFUQm2ZnG052D6AOBhnU/4x4T1uCDZNIRRTeHshCblZMmK07gco
	 UmMByoSVyoVUrPyuCymBS6hXXFcozGnMM4O1ArsnR35QCVLhMm2wk2vmD9ZiAOiBlxgkM
	 5vSNeB8ms859au51NWsVxdxM2iHNW9gT9EVkTSmwJQHqPlOwI3rk9TIXZ1q5OkyOm/cfp
	 T0fUYmT0onKTU0m87OcRL4m8gE8ottTTgbfP7C0EeOV0d49IjtzdF6rXiSAcLDslThsti
	 x7VM7VEfIbDXmETsEJfZUTAu1lscC4KDisZ/WnRWRdbGQghGOr6sGB1qS+r4CQNu7GA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EL4DZK9H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.4
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010004.outbound.protection.outlook.com [52.101.46.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FDF606A337;
	Tue, 17 Nov 2026 07:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4FDF606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EL4DZK9H
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YO0er/QFe29iVGfXbptMeyfu0fcvzr4ulKmvjWh/xKdvyuiBNSU89q9XmCRyzYVoncBHkXLHdFIsoj3iHf0SG0/x1E5OWTFw/Op7zXWuebjlDrGQpdOp7cvyCbLi9O9tsp2CDqCv/vMAqENGd9EFa6Yc32viWFdmB3B9osAoX2lOCzoXt8ySb02k0YXjbxgWnp7RbsiZlzW1AkWsYpiZs31RtvxFctQB1PKqDMa4n3O3ogDjyjIO+hx+zakCPT/t5NANhTFAMkCtVuLnVb/7bmkHg506NORmRVwsEGH2yud8HtSLk7teDhtP/WTJXueZ8bOknsQvfMrisgIsXwkTaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DxTiUk+r404xJF2B2eH9YyqPjPNXh4DuaCT0vkzGhk=;
 b=Gr4NsjiOZGeHSXztQ9DjtfWyhZmly9XTRz53I+xAkaaI0HCqiZkVsFUqeD9GIlmCd2YIcBjxaqZQVPHT3/NN/2Sc+pcq2SnW/JHqLOdwj5ZziMgwB0+UbEvhMaxygpUUdlq801T7vaXqPu9+YiA3ACRbCtkbFhK9WYDxY7P0oy0zG73MRmQ3fzQb1nYr5wKJ1ZzGc3YjmiOnK44q9ArP1gbHRkEckr0xCTqEMupJKesgrfu8ZPihL4BtTfXW/+q7CaQ26y9F0u6JKFhZB4lqpHD9z2sMUggdxgP7QEw7XZOaCyx4FytmZXG4MI6gVN5vPjLyFopiiDhZJxA+S2v1fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DxTiUk+r404xJF2B2eH9YyqPjPNXh4DuaCT0vkzGhk=;
 b=EL4DZK9HhMHKTe5BCDhY56M8/B5zBfUQbV+LeLHswy+NvIPRuQ7mBqyBR5S2D4Txhcl8iLkQiZDLkNZ/wslSiIXa9C6bZdSKvwoL1s6T7S90dBMh/CCDUcbFq/sOHEFFPPx1hTb3zz4rYD9VyWWLGKu9b0chwiPfG8PVeOJgb+E=
Received: from CH0P221CA0047.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::28)
 by MW3PR12MB4378.namprd12.prod.outlook.com (2603:10b6:303:52::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:10:50 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::81) by CH0P221CA0047.outlook.office365.com
 (2603:10b6:610:11d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Tue,
 17 Nov 2026 07:10:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:10:50 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:10:46 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:10:43 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v6 06/23] soundwire: amd: fix IRQ thread dropping STATUS_0TO7 on simultaneous wake
Date: Tue, 17 Nov 2026 12:35:41 +0530
Message-ID: <20261117070906.803139-7-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|MW3PR12MB4378:EE_
X-MS-Office365-Filtering-Correlation-Id: 580851c2-c675-4bc1-9e5e-08df4479e91b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|10067099003|11063799006|56012099006|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EpR6EmuKf70FOj2n5IsAQOyg3BVUFMc1zHZu3KizHaDheJm4wHosZ2qQXKV7vRbFQUU07Qy0KiUrgywsuAJ4WclU9TokDy7KjYzIWsXLtwFndoKh8JdBo2ATlgKu9IialNdHDDwj61qteHICxfcztXcmhLVPjUypNydyQ1+0RIsECztvpMt+Au0Cv2WTW+IdE2RmwNp3apCsau42B6AHTfgCyd4NK2sYirX4DvMSL9L1oBpxgAcnc6PPFJXpWqik6OAbMZ3gkKOOqCedyGnrhncpcg4wL7e90HglAKwZLYq43X9PwAYFmr8wG8jpzn+0Tx/KTJs2b5sq+w+7lJPhS4lVXdYEsRhbeEARAqzNdXEJyPEvOTsXq3ZY2/oIcHBdzkLBlLfX9uo6ltOtzGdVZYglEGzct5cGAGdtxi8cIvx2NY2XJeTgfG91y2vNus85ZjijvOPdPcKZjtyHUk3WfKm41qiEm0TAXBLjWb++qo0/WbBUpDkY6/CTGcXawWICI0LTmSzVfLZIlITWA+LcNdgZijtQVChAiYXWTYVfIEM0AS8RyTY1m4Fk0zVVNcQa0CgXC5U8IWHZBzI7WRYBl9yyci/HXdNXfZcIA20Qv21iw86MU+fOLB0oZveq8o83IZwvrpzRipnL/wupgDWAoLbYZZPaf9AMGufQTTHRcd+ZetiIBRZcIGNucT2SxkH9bKelc98DiPFd1hV/T6TzVQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BgUDm81/ViwtGV/otXdkEd/L+9TBN0Y7gmJ5Fo56PdhMSmjYAah8Gkkxxa4zZlid0aG2+IOnKs88iFN5XMWUI6/ZmqQahcX05l860Omsw5P9e9dPQB8dAJySH7ADNK1G8PGlmN6HiBHko15hgyQXNfIN5FNRbYB9ct6cbUKyAs0Kf5eWvS0Njtov5Xi17zuSP0S8usn65+P4IbIm8WDRQ0aD60SrTxAdqYjzGm+K2EHHHlBYgPqPJ5jr5ktotfcnOqM/mgCp2ZWLmahHuT6eiaFwXUaRSTpEq/4eD0k8voio0CQHUfSdm1h/yITKQHufRvVEBPHbpvSuUsWO8al+SxE7nbyL5KAqTo8RFt9Q5gycPeRnkrbGgmeXgJHxJATLJk4/7C25GP2Fcy8R8akAKE2DxrSlBY+Dk72uBVvEwvuIKvqPx6Nfh9aMW6Thz84X
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:10:50.1975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 580851c2-c675-4bc1-9e5e-08df4479e91b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4378

When a wake interrupt and a device-state change arrived simultaneously,
amd_sdw_irq_thread() returned early after the wake path, silently
discarding the STATUS_0TO7 bits.

Remove the early return and fall through to the normal slave-status
processing path. Clear the wake bit from the local status_change_8to11
copy before proceeding so the remaining status checks are not confused
by the wake bit.

Fixes: 66c878838f37 ("soundwire: amd: handle SoundWire wake enable interrupt")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 3d60bea82792..65626ca590c9 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1110,8 +1110,11 @@ static void amd_sdw_irq_thread(struct work_struct *work)
 
 	dev_dbg(amd_manager->dev, "[SDW%d] SDW INT: 0to7=0x%x, 8to11=0x%x\n",
 		amd_manager->instance, status_change_0to7, status_change_8to11);
-	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK)
-		return amd_sdw_process_wake_event(amd_manager);
+
+	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK) {
+		amd_sdw_process_wake_event(amd_manager);
+		status_change_8to11 &= ~AMD_SDW_WAKE_STAT_MASK;
+	}
 
 	if (status_change_8to11 & AMD_SDW_PREQ_INTR_STAT) {
 		amd_sdw_read_and_process_ping_status(amd_manager);
-- 
2.53.0

