Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792989994;
	b=L6UoKNyXJLymSin/GLnhpHl6qeEHUKzVDwSwLv0IAZcCt8DIpAGvjg6wf/GrMY/JEjsw
	 7YMZKPcV9Lv+VVFQD4m71AoYYN71elha/Z5oxjqQGrb7FlUTkRNmAHGlSSVVkJjp84af7
	 g7kDf8TCUx9eignRR7A8gCqsQckwcTUqxWaAh7hG07VGs5SZohbOUjBJGSy5X1sK0sQtm
	 bGvUF7YM6w/6Yrag+jeO22Dc62nbpxO/oyb3zh6p86mc2+Wcn22LWhH6BBbNdzklhlLk/
	 +XHYIJHL0iM6Hahtqztac99zJ9BbgG73k9jgx2G8MDcD0tgiB9hJiRa+AEsI2J9/uFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989994;
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
	bh=SpmudWUOMGqmoK0HNVeatKfRhau78qPZS6XPtOC0Jfw=;
	b=tLg9vD3JhzUt5G8dQku7/3eoMwQj/VTAhr0inowpFE7OarFlAI+VTquUOyTyugX4R2Sr
	 wdJqCSQqPHnUYpgYrWIan6F4ks5/UtZdQiEAvqHrBUNk1wx8k7sXQ/yZpfMY0AEnAEAvT
	 y/fYcIFIOUO+KmLilUaspZbiHMDNjhLy294FDjww+AK5u2w2y1vh0nxUFVdGwa7Q6LroB
	 KbFZWGwO31S5Qf+w0yuTeNAOQbv62H4z0ei678ZzuSFeCnWL0I5kUoNvPIhSqlE2wX0dm
	 B0jvsRJST3G0PoNJ479i6HBK3I/sISJVb/MjbkyoTCeT7o+iu4x1WdFqO7VTOI5VW9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wh6llyhe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.51
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012051.outbound.protection.outlook.com [52.101.43.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F17E606A326;
	Mon, 26 Oct 2026 04:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F17E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wh6llyhe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7CFtv+JNtAmn02aT206+xuIV8pDOlsn3A5pSy5BUaZjdXpuVqDTvSr11q1sQS41pgA7VyJfgrm8O2kCxs1smGBDqBJNPL6ijOjG0mk9kIx/d7hUbh93L/6TF4gtKxCTvcIHbAqQAKWi/3Cqrlsr8sDFx3dsPWeWLmEpJjw/esM1nUH6wMKA6B3dvDLKQuYGDxe5gh67txMRi3Pj+023j+qqdXoHk1lbStZEGd70aBQXm6vu9Q2t1rYZV3yqEH9OGLgLZqaPpE7yCErn4CVvkvVXAd1wWEafsZks3yE2zPQh7G6ZInBL3Gheky/IzQtILaqBd45nigzO86fBsxKB4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpmudWUOMGqmoK0HNVeatKfRhau78qPZS6XPtOC0Jfw=;
 b=zB4J5OIRVkUzTtFdhCU0MdjssnbZc4WPbEV4h7zflYt4Vk+/4XNVtGvR7U6RnGJa2Rfwtzk2cCDfDGqGHztFyDiHZmVtCwbLdth8HWI8Au/bX1W4p7ZCAbVjN/Jp6WcjTbbIpJtvjz37hBlys+HwZCyn/Bm0uv8jlat9dlngjkKZqTvbU47UFNlS4XSQ/STP7U2bA+iChbAxFVNz8icJjWHELiLZXsZFcXaH3YPiMQq4Q3y5VgdwgwZX7RCZWuNe+Z6tuuT1cBOBfRcsQ9yzuZoSqISo6rT/HFeRgTAm7VcMXXXduevzbikYi5FPaU7mM6x/vtZzgq0HkFHMeZfcTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpmudWUOMGqmoK0HNVeatKfRhau78qPZS6XPtOC0Jfw=;
 b=wh6llyhehoEOfWGAWYrQBtPbjjy6JLL7brN1GL/T7lBdrHCRoy6StSF5DY9/OpbqOP47ITDj/8FwBPd0sl4m4nax/LYniEUegJWZ4KlMeiSKfOu1we/F9CPdGHga7DMq3xJQYqYjFMSRfkiI2/wpYqHn8nF8L07kZ0HXj3v2UDQ=
Received: from BN9PR03CA0572.namprd03.prod.outlook.com (2603:10b6:408:10d::7)
 by DM4PR12MB6037.namprd12.prod.outlook.com (2603:10b6:8:b0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 04:46:26 +0000
Received: from LV8PEPF0000005C.namprd02.prod.outlook.com
 (2603:10b6:408:10d:cafe::7) by BN9PR03CA0572.outlook.office365.com
 (2603:10b6:408:10d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 04:46:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 LV8PEPF0000005C.mail.protection.outlook.com (10.167.245.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 04:46:26 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:25 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:25 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sun, 25 Oct 2026 23:46:22 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 05/13] soundwire: amd: fix work drain ordering in remove path
Date: Mon, 26 Oct 2026 10:13:36 +0530
Message-ID: <20261026044507.2310694-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
References: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005C:EE_|DM4PR12MB6037:EE_
X-MS-Office365-Filtering-Correlation-Id: fd25c9bc-acf6-4b58-49c6-08df331c17e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|56012099006|11063799006|261009223027099003|261022075727099003|261022105027099003|261021121427099003|10067099003|261021123027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QQD2UM4NJPMfNDcpcmc9pR9WBG2nGv5MIz5NvpjC2EfbtMEhkR2QVwpErbMbt0KqvFH2U01JMlh+YeKU46MjVYoMrsbVX9igRbLy67rEOYooKO6TsWFYOFsuNWBbD8lGXn9DkmXPMGFuCcghucN8Ar6Mb4ew9IQ/qjxp/p72RfTLdilrIgCkNWsgg15T6H6CdP7d4q8lhK2wToaCGBkitDnTM6MLt91+kxYaKsjICeKTDk6vTuA8mJxh0Gu/D63txDQQ7VOd1voMO+8nAy5vA4epxdSNd3VxIPKYBbqYpINWgr6QdBKEca29CmkMke87J88BHgMReFxc61Fm9C0nDZ6P69Px6udheGFwZJPyr9aMsKGU2xNRKKr3YP4YlVtaEj3efPVk0ZYBq7Z2V2rHxV3wm1ScfSJCGM0URL4KXl2er7V5qUkkft2tmpawSWtnyM523B8IxETvpOtvBU/2lDTWX1quV9ZzutoCMNziRZMDohhEZVOFllZ06ea9CKVRc6VvF2MCE6hZ5am6yIu1wnOMLW25ph7oJru3vmHcf9rkddMpJPiddznhWG+RiPecnC0/9IiwYzp5n+yw+hH9IO/h9hu6nJtIapU9gaGYhbit/+okXjRKJM64EfYfQiK+LXwAUG6NKH++4FdqrcOAhNKiXFuCCCZmJpCh5ufHZr6Q5CiNMy+tmkix/w56NqFNM26qjbBdZ5j+aETuZm65Yw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(56012099006)(11063799006)(261009223027099003)(261022075727099003)(261022105027099003)(261021121427099003)(10067099003)(261021123027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q6Ms/1LMeB48uMO5N+f2lsylTgpCfx2SkW1ACp475ScsgX70hzfHYDSI+cWXShOk3NkxGQUxfARsVzp9mfGSLEE374/aQuRWW0BeGrB4eiM9wIbAqwE5xZSN/4ob3LphoGuvi+9v3J8iRQcsB6BKBrw76DIr+rmX6is0n9wtPQBvh9hfRq0DVNY/iHIYa9ukHjfCuT8iZiHJwBfVZ6wdwg+FzHxSjpwGaSyVoSvSWNCeRSclETqWu0WS9lwn96b9h5QszVW3hmHR4StNpJp3cGNC9lEJs5mIYMHcOIIVu1exj9rqnfVmeeFMjxyIIIeKd6fuAHTKEfdOItuPwA9+I2uFm/7Zc9sNhJD5gHxH85onq6/EmMYtZn+jFnsFIqwH9W4z7W4JwB/oCcDnN5fDqZaSN2PFc5Facz/GIwDVhSClc8GhuMIhYn4jOM42qrM/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 04:46:26.2208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd25c9bc-acf6-4b58-49c6-08df331c17e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6037

amd_sdw_manager_remove() cancelled amd_sdw_work but not
amd_sdw_irq_thread. Since amd_sdw_irq_thread() calls
schedule_work(&amd_sdw_work), an in-flight irq_thread item can
re-queue amd_sdw_work after its cancel returns, defeating the
cancellation.

Fix by calling amd_disable_sdw_interrupts() first to quiesce the
hardware IRQ source, then cancel_work_sync() for amd_sdw_irq_thread,
then cancel_work_sync() for amd_sdw_work. The existing
cancel_work_sync(amd_sdw_work) is also moved to after
amd_disable_sdw_interrupts() so that any work item queued between the
old cancel position and the interrupt disable cannot escape draining.

synchronize_irq() is deliberately not used before the
cancel_work_sync() calls. Once SoundWire interrupts are masked, no new
IRQ deliveries can occur. An IRQ handler already in flight may still
queue amd_sdw_irq_thread, so cancel_work_sync() is used to drain both
amd_sdw_irq_thread and any amd_sdw_work items it may have scheduled.
This fully quiesces the driver workqueues, making synchronize_irq()
unnecessary.

Fixes: f93b697ed98e ("soundwire: amd: cancel pending slave status handling workqueue during remove sequence")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 5e9d228d09d0..a82714cc2f6c 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1169,8 +1169,9 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
 	int ret;
 
 	pm_runtime_disable(&pdev->dev);
-	cancel_work_sync(&amd_manager->amd_sdw_work);
 	amd_disable_sdw_interrupts(amd_manager);
+	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
+	cancel_work_sync(&amd_manager->amd_sdw_work);
 	sdw_bus_master_delete(&amd_manager->bus);
 	ret = amd_disable_sdw_manager(amd_manager);
 	if (ret)
-- 
2.53.0

