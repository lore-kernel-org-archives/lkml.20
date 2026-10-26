Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792990023;
	b=Wn1EhMIKfFtGuVCBtrAkfvpfd5tIGbq/48jVLuCkDZmlJtZ3kUYn5TThVnHb+UJYlajL
	 5/jnyQGhDgBZFnqTgoDlL+JMlapMnaPzHIi+YT4wGtoHJ/rMkp9+FuyUKjhheKsIriUj6
	 4r6DTHA1BqewHSxL4+2gb9zlgK1obDVJfGifT0VU0gbJVnphDy0SVM3OOmCWfYuhnhjiL
	 xFnwwi7eaq933RD5zB+aERiwPZzFLxSbluD7AYF4Q/0oSXUpPNdRO9U8lJjFqZutMqM3z
	 qcrwB50XVRF7ZMzi4WBF+1R6/tmaZdWdHakZyH/oQAlOEHebF9XhCN+jgw7+/W+I5DA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792990023;
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
	bh=SmhgmJ6gMRyrgAE1T660jTMZOQI8rd7ueHt7lYgzwMU=;
	b=kOsgBTZogh1Q6vrEvZ+sX/1OZrUqc/CInxPl0Ip5lDJSvvoCgdcIjqHaGFw8Pq09WRwK
	 0Ht8NzVuvTr7r8HsFFatf9nRIHmbWF8v3frvfJ+iEl+Ax7NcTheciDs2XS6cyZsH3nYVa
	 MhaZ/BRJaXrYZVlT2K2bg7Zq4zKyWgSxSBDr88DLR6EPOc4XghBWQwTvLkQiWYtPlx8dn
	 2Z1axcNxKM1JjLktZ9QJuWZ7YAGlBN0PR5zLe3gL3HmE6oV0C2S5Nn21wT33D2/nkXbrO
	 2YoKDNOSVll53dosncBkoY6k9N7tH1jFEsDN9fh8JGqrK4nXCd9jc045d2UaMFdvGNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3HVoiwl5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.10
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010010.outbound.protection.outlook.com [52.101.201.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA33606A31E;
	Mon, 26 Oct 2026 04:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FA33606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3HVoiwl5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQt0yYBqaNtn5pf2PCVVIvUmgyPf+J9W+KtBBxR011emy3jD8lHbq8DA8cdg7gEAqdyJfxkFX8SbBnQfJI0CJHUDdRgy6OEuMDxfGwnboulZ5PFlxQ8EEEUifh3mKZz8/e4zcgKKjHoAVioOPxNzxk4clzAnln8V1Ex3ARQ2cH9V3dZc2yZhGpnlU3GoaE9uJhTuGrzGM0KbTzNPDL+u/HC0snY8zfK/5d6zZLHvTlgpFRzfjCpS8T0LyhHHwCkCv3EcYyNT/+fmRgMHtD+NBsPmUta4ezL1/eD1Na5FUp+ajix4UVkVJD3+ltCcNDroQ5QGQ2cXH1eavmpN+Dox8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmhgmJ6gMRyrgAE1T660jTMZOQI8rd7ueHt7lYgzwMU=;
 b=OJKRN4cd8ujZUJaHnA/LZRdkybV5teSKBOGW+5m+9xR0CI6NuVxlS0tLPMfWsZAb5FVo7Vaw3vE0GK/YS+96kiwnLqoKnxhEtWYFQJRNlraRH8CzA2MuCYSh/OiNllxF5WY/FLWKX7XTk53UQXTeLs1i9IjC1WeogCrqo1g1N4XkASzRXDwSTN2maxfoT9FTk3u2aoX+fT7Vj5oYTOJBhh5R7a1uMcejUoQVeCsLQZSM6GV9zKL/8+n+SPzw2tnH5eFJX3CT6iA+L3Y6l+puftkotCBcpHcu+lpJXHYhMZDVHFvmzI54ZAJrLowJ95cWz8A6cUOxK/y2VrL+O01I0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmhgmJ6gMRyrgAE1T660jTMZOQI8rd7ueHt7lYgzwMU=;
 b=3HVoiwl5R1uarelo4StYOZZ82Gsh+TDBjFypTOZDAK9YHAXRpj6c5CgXVBJW2g0j9vDvZIhBvxT/RX2rKqpB/YDqUdY2uTkDi/qUhQ0EWe3zk2wTeedmdDorKotJzlPWOgRia1QC2DjRIozJqZku2jrCkrE+zpkJKPQ37HMwcq8=
Received: from MW4PR02CA0014.namprd02.prod.outlook.com (2603:10b6:303:16d::29)
 by PH7PR12MB7137.namprd12.prod.outlook.com (2603:10b6:510:1ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 04:46:58 +0000
Received: from MWH0EPF000C6192.namprd02.prod.outlook.com
 (2603:10b6:303:16d:cafe::d) by MW4PR02CA0014.outlook.office365.com
 (2603:10b6:303:16d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 04:46:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6192.mail.protection.outlook.com (10.167.249.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 04:46:57 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:57 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:56 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sun, 25 Oct 2026 23:46:53 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 13/13] soundwire: amd: fix STATUS_8TO11 double-clear race in wake handler
Date: Mon, 26 Oct 2026 10:13:44 +0530
Message-ID: <20261026044507.2310694-14-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6192:EE_|PH7PR12MB7137:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ed1e885-0c90-4432-9855-08df331c2ab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|11063799006|56012099006|261009223027099003|261022105027099003|261021123027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CUc9Zqriurz7vCHjD8mAwtXThoUGiupvEQdJviTM3fpTZddxZpzqemVs+Rwx4BMup2FC5jqzzVwMWg3eHTNT0rkPgd0j3IMuhYQXcknRxVkzY8v6u9k3Yq/JrXBA6AocYwO2clEFGG10IM8kASGrf1eORcALYFF0I7vRjUWWesLgKIPIp3tryHExuD4uxkVazvsGjXgcVApzbtmwHeiGVZhzJFQ07h2llTE3IBn7ab9nkJ5EpxhCp62sJtDKb9lxMWVksj2E9xOD4Dw8oKWyq4mhPHoGhM2JvCtri9iyiefk2WAGIs8yrXkL2Rhom4QT1LI2qekGvXNJ4DHA2d63bn94B/rNZJEFEqD+E5YGjHIJU/81GvJ3hVmPqlEasWd79lfY/uGVOcCzVyM/veeN6R7/V9MioxzxXhVbvaRns7pz+nnptdpNVrzR4LFYwYdLlsnyjoqAjI6sLgc+mQKOulQR8iJoyTdnL7kKg0uBSgEsR+tUcyf/JWbJfRtC/DX23k5AMcZkFw1Jq1c6BbKvQ5DLkFmXXk6MtrHxP4rT/wttzaWo0H37dMjIoq0+3h5Pv4tJdJxCQMgJAdgVz2QiQ4eKdVHmYHhoh8ql+wAtBRnB+/sv2+b9NdN3hUjv86J1RncsmMZdNuvc/IZwop4O1XP3u5UWD0tZjhuY2X3t2jzyMzaiDY3xnhadXEfRKNcgici4l8hw8gqcw+cNRI3LWw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021123027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E253w8AawhjXhfsrke9YBrySL/Gw9t5D7VSMiIkM8J1Vjba/rt6YVqjEXltG8d+5mvT2dv7U2pSzVLxYnwqQVkGdWuCzo54CKxSjvHqysCWyyA24UBcg9CTMNiTDhTYExH+j3tee2ZAMYRBBzb5pxKhyYrlFR9+9iKc7Apsn6mdVMxQN9fs7+7GfyvRHXTaKmoWmokf0vyXFYe3TlCqF3eE4KlELjFS9CxuWXGlTfwSlNSkdI0uVv75/RuM37c1Kn0SCIHX+CZQLNlDOnlTuzp6jotMUNnWiRP5YLo/IrURFA3AHYCyUOxIF3wi3osgralneA77tY8sO+vXgymIn8TidQ37FNm+VaUzm8PTzIyaI81ZFroAwI7Jz9aH7OX9fPN1m+lJtdLC+jeso02ArxoQqQieeCBOGOXrh7b7rs/CmRNKl0KafNHqXsnrhPqwt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 04:46:57.6945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed1e885-0c90-4432-9855-08df331c2ab1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6192.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7137

amd_sdw_process_wake_event() cleared ACP_SW_STATE_CHANGE_STATUS_8TO11,
and amd_sdw_irq_thread() cleared it again at the tail. A new interrupt
arriving between the two clears would be wiped before being read,
causing an event to be silently lost.

Remove the ACP_SW_STATE_CHANGE_STATUS_8TO11 clear from
amd_sdw_process_wake_event(), leaving the single tail clear in
amd_sdw_irq_thread() as the only write to that register per invocation.

Fixes: 66c878838f37 ("soundwire: amd: handle SoundWire wake enable interrupt")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 16dd17f7a343..38a9aa1af59a 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1002,7 +1002,6 @@ static void amd_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
 	dev_dbg(amd_manager->dev, "SoundWire Wake event reported\n");
 	pm_request_resume(amd_manager->dev);
 	writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
-	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
 }
 
 static void amd_sdw_irq_thread(struct work_struct *work)
-- 
2.53.0

