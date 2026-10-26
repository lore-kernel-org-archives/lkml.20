Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792990017;
	b=RjY81rlq/Kjw/BRz/30XhQTZMlY89/EzzvHa8Ekw0HhhIBb9yhvX2C+msn1bUfR6n04D
	 MANYDAS60H/vPNPSaMHgvhOaal+LydplS+tUvXuqqioiJVNUom2GlKjLT/cJj3sh7gsiH
	 ArXgupkN93Byw0WPdNVteKLjYLzaqy5/FOPg/k52e6jn3okEesUsA4aUb9EFWh2KfH7cx
	 hYacfGd1ZykWnC2sde9TrLXG0AmawjoaetS2VWFccZ5Z5X0lodkwBoS6AUQxc0OgklLvk
	 zR2gtFBMwVnFGyqDdSp/ld+V+twARhvd0NNV5JFRubPqQ65EI9nr1K2mlt9gCo9ZqDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792990017;
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
	bh=JXRkQ8h0UpRUJOjDB+QQ7NwRZqm8Lt4jMLjAxlO8Cf0=;
	b=jte8ofzfzWPf++1bmRwlZVxNnlpakzBY054Ce02u5pLa8oxA4SfIYLdQ/MIk4IreWxNf
	 SNAYCcqTgl1gVEQiPuFdb4Ss8Vq63Jo/sCVwP4kVhger7iADuZ06pN3JeflRF/vvrWxv6
	 4GtzxhtPnObf2hsfh5xqWPQQoJvfN+u20YFQJgpUnSPZFXBUuVsiKbCqMXkPEml7O4oIa
	 ZO801IZEaOpiH7OIV4CiuUgy34TKQRlq0E6Qd+agq0OOpJYldBusyKe3sxqVbUBsIZNTt
	 q/sYHdpDooGk8a+9i6p1zb7TydePe0vsG6kMPtuRpZw/jsD2r8OGYRtKeJOG5PMVSIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Bj1DQ89z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.52
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012052.outbound.protection.outlook.com [40.93.195.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95846606A330;
	Mon, 26 Oct 2026 04:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95846606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Bj1DQ89z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YM2VzNhKm/PxbJ1LOS5Nwgc7+yF17QP8A+hlmxhQSNZEmpy8507YBzFzhvVJeAxlsAe1RvuFFfMgR+h/ASpR618YkvDBzCln68a8WTrt5Dmd1WaTftGhW3o7NAMpgiI4Udv/pGGvqwcRtzbye2Y7sOW7Bg97QSSXb3tNRIdCNfDK8od6o4FIF7/2oMX7CYH0jmmK6uu/JL3u2UDowxsz90E2C9/Irh6ZdNJFtATsYMfBqh9YtgpZq/zL5jy1dov2k4bs4T8DL+cQ7tvXGQG0lq9s87ay0GJt0VML6Ho6uxsEABIMBGrNJVfb5R7g95qK+n8fL8qqobeN2Q3gYA7Xig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXRkQ8h0UpRUJOjDB+QQ7NwRZqm8Lt4jMLjAxlO8Cf0=;
 b=G7/RnTKOZI3I2/DbkSnxYWNx1Uj4Emu5DhnTfCo38+9M2ftObZtC1A/bW47qCqpL4YCuW37YB3x93O5RiIVr8IqsVUcI/FBE7Bzj+3ZpY1neQwNNysA1/AthbyWJ+DSVIRQS7pr9FXwagWUTavzDPGf6wrcxk7kttySKdURk9qfxhdQOet22znf9K6H3JhAtvk5mf/X6+rA1QgQnzynzQOJCfoq/colGDhB9QynUjEpmH7gv9sH9Vtl7fDc/xOAwEcLfRTGOwPLAXR3eQhA+uR+b9vd8+6e+AH2nF5pU7DtMSqfkl3V9zm+UlcoEdBE+T+HyP0tcte8ZeKbIqQOVGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXRkQ8h0UpRUJOjDB+QQ7NwRZqm8Lt4jMLjAxlO8Cf0=;
 b=Bj1DQ89zVdvhWkDFSI3VHrbwOOflfFjs8uJLfMTw0zU2cmHtHaAwC+HgAQGpxe4jlapyBRLQ30SmIT3AmxU7NfW6/S0miYoYs44oImX7v4fUmmmXl+XyC9ZnADVbZakoEWhblrg5qV3oj7EUCnmyt2hhRGJlTgLT4prJpz+vpmQ=
Received: from BN9PR03CA0101.namprd03.prod.outlook.com (2603:10b6:408:fd::16)
 by DS0PR12MB8293.namprd12.prod.outlook.com (2603:10b6:8:f3::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.22; Mon, 26 Oct 2026 04:46:53 +0000
Received: from LV8PEPF0000005A.namprd02.prod.outlook.com
 (2603:10b6:408:fd:cafe::b) by BN9PR03CA0101.outlook.office365.com
 (2603:10b6:408:fd::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Mon,
 26 Oct 2026 04:46:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 LV8PEPF0000005A.mail.protection.outlook.com (10.167.245.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 04:46:53 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:53 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:52 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sun, 25 Oct 2026 23:46:49 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 12/13] soundwire: amd: fix IRQ thread dropping STATUS_0TO7 on simultaneous wake
Date: Mon, 26 Oct 2026 10:13:43 +0530
Message-ID: <20261026044507.2310694-13-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005A:EE_|DS0PR12MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dc9188d-6f7f-4130-b88f-08df331c2818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|11063799006|56012099006|261009223027099003|261022105027099003|261021121427099003|261021123027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	o3uFP9yexwD5Ehhn35Mp0lclLOdrCl2hYyNBlF2YGS/7ScW3zD+3mjf/1Twt5+jpAUCh9/K5iFDiVq+EZ2pLlYZeiBNKuaNDbAZ1bBQtdyp3mKLj6Cx5Hx0OVG60JkYiPTItucS0K7HFSaMWXpkz8qE91RVTOzfIYQxsC3SerhpdnGked6E6S0TPP4gjW6oYEGfvgYSdOjSshYKu7mdXdk+8aZvtuFxNnnRG8H8B7Qh+HmkuM6pw5xbxbwT58FiwWtvoNkXE1Cviz4jwTDev4WGhEILKA8cia/mT8LgqBdl+00rcrP8xELqauqMwtLT9hIo069G/l+KuZaicOf2tckFR7E3NxnJOVVf7kV45fQzA0JlrHDF33HoY1CG/nHEkq+X6yPnWb/QsEV/I7nR0RTV+IwqcDAUE9xuVT21xOcUSPP5kMVoJx+r9oEZZKGnlIcSaDXLY9J8MeFTBlJKHW/3xDCkQloWsxwz7RtiwuCgHlDG9QOwlYDAtqestYGaHsyjqO9OHQ7QdCT0zJ0D9zJlHoY7W5jkJGPzK0D7y0aBhh/eU+7NZ/Yk6Zhm+OidFMe3TlaE3Pxn3WkIgCWF9WGG52DKfh0uVR2RDy0j0Y4i6l/3+KbR9Q6ewTybO/9vDs2wIgnDW6K/ZsC3symddo62prFjAwfN1uLAuA7vJSO6iN8QzUNsP3gA5HEWiKH/fkwcr8LGXMI+TkJrgaL5yhQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rSD5D8Rsn6hsT7LxNCiMN1In6OOf/ABESm0q+y4Jb+wnDxLHQaApuGw10PJbUeLH0w/qSAd86tynleJ4/x/Hq0ppHVv3gQrqLayZVcwD5rJ66iVQUwCod2fakEHCnxdumYPwiQLzUbETEYYtVOt1iaf6sYZxrb5aMkKV4k3kCxLte1C5Y5l6wr/bUl10brBbMNSjFa3Lncy0DyhwGlSKOdcoJVr2KJwZTpjj0Cs1aRv0PQ8O9PZzax0OxjIx/BV0ra7JVg5fUWMWIJK3HoyqB22EH3VRdCtG+8OymWmOeagFY6QZTnpdhRTcQCG6tMkm7OBPpQEFIdz5BZWRit7sY2iv1Ap2kw1YCQEDv50wOsr6sGao3RmCx5xZFxUN8pkoPV2jJ8O4J4t8yT2EeCFmDQ6Tze+E4gzDw8OqhZX++eEXS6CAvcK2eE9464yMxRaj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 04:46:53.4296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc9188d-6f7f-4130-b88f-08df331c2818
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8293

When a wake interrupt and a device-state change arrive simultaneously,
the IRQ thread used an early return after detecting the wake bit,
silently discarding STATUS_0TO7.

When the manager is already at D0, pm_request_resume() is a no-op and
amd_resume_runtime() is never called, so the dropped ATTACHED event
cannot be recovered and jack detection stops working.

Remove the early return: call amd_sdw_process_wake_event() inside a
conditional block and fall through to the normal slave-status processing
path. Mask AMD_SDW_WAKE_STAT_MASK out of the local status_change_8to11
copy after handling the wake event so the remaining interrupt bits are
processed without re-entering the wake path.

Fixes: 66c878838f37 ("soundwire: amd: handle SoundWire wake enable interrupt")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index d7289b840513..16dd17f7a343 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1019,8 +1019,11 @@ static void amd_sdw_irq_thread(struct work_struct *work)
 
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

