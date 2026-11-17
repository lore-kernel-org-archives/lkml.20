Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794900072;
	b=uy84QYVWdisvEXbN9CLfSQPJz7N8sUBwcqu6eVztmZq+HbSu4dRb5nYhOTkmG/Fe2c8J
	 CrBueJyf1KMnzJvYqrN0cZzFSYMYPB4T/Uc3VEBiixTuQx/CaK2pyzXy5XjrUfOCJ+85i
	 mt1CNiJPsy35/4btLCdoqiL9VTuJGNlbQ3XQUmPZbWEdK88yZlT4vEfDbBbsNT3tOb0sZ
	 1Zh6ynUkL5TJzoW7YapD4XisOftfuQWT1HHJ3paRz3Xi3ePfFvOPk02JHV/cXdvINYeZZ
	 9n7hLcHtiSAO9D+IwPa1yBLSwYQU5awYIuZ4tsyFrX/1o2i4Ac90SWiODtn6nkRAYeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900072;
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
	bh=WxLUuisoX3hFTiGx/gufl6raXKCSUDQLVfAc3keretU=;
	b=WSGDMAZrYXKo5VAQI0yCtHWHej+jssfOrjPGv8HSwlKLAlA3kho5avxSyoAUkoPAZi6s
	 t+qNv/Ltq/DJtByYeJjgFNXHqGXgGihTfe3NKOGBFWqFf4WZSXc7yQwTsDVOf9rTqhZZK
	 SkMXWNWYuz0m4jyeG5j/Eii4JNZEgIqQbukYOwxt0P2Bnq7fRvZHCIPf8F8HhoeWQ1Q3N
	 B4uyQVhUeKcmPuwRLWpWR9pxAGAZOmFuDyYCORzSSf+kowm54r+uRqns1OFOaeTX3Hvef
	 TIx4C4QJhrjEZxwiVi5ykUKConhQlivlvR9HxfaVcaNTS1cnDTvaG1RJ5yhPmnS84TQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Xu9G+JPF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.7
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012007.outbound.protection.outlook.com [52.101.53.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6B4606A332;
	Tue, 17 Nov 2026 07:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB6B4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Xu9G+JPF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jT0nB/QJXuKYXmqPaigrQwJPXbJ9JVfnJid9IVAm2dtE/J/dnCGYxJ61kTA6Ay9EyVRFdKx+kjfi6kox6KNypbjyMGcEeYNcbduJ7Q+nhu+YA6APgOs6gT4DSoYbpK2VDUbT8Kkb+M8gp5ed/bRWsOkXWpovuzZhFOcvIiu1GXEK/Dc0mBS5lIFKLE5bUWD4C4BEpJOY+7kA+Un7OWkcArWiwShbKA3wJglwQLu39fLhaLqi8ZqwDV5/WVYbkdmHZDEHashZ5mnIMH/2NL4QUtfh+OeTyO1SkuDFL9sSvJjxbgIevZHzUENJdJx5/0iDzHmF5A+VtKzZ7qlVvuiALA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxLUuisoX3hFTiGx/gufl6raXKCSUDQLVfAc3keretU=;
 b=gVUgUxUa8C1qQ24PRIl5c8pYEQMmdSe7ms0SJvyZjEPIXA0c7wEouV2xKsQdUEXWJGjjIfGh6FtdI37AdDH2nheCVGYQeQArSn2VbRzn3rRhG3srppPpIOxW/tHu8uU3FGpYdFOF1TvkS387Z+Hn+bz+cmApMYlvm4wi1yFSSLxmNT97oNzkiTFB77UNx5ECb48Dmn3KJQ5PIShgL7oWoLCrluV1riRVjSJeewF4flPLKjYNx7rrM1Is5/JSEbDIzriizJpax4AHxZMeRMZ6XuqGH0MzfF/jP7d/gOP6ntMlYhmMO6/im4q17YwZhHWConXUnIN90hgqyMrcN6Ec1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxLUuisoX3hFTiGx/gufl6raXKCSUDQLVfAc3keretU=;
 b=Xu9G+JPFGhwLQNe8tq+XcUcPBbyl31JfJ+50G+z6+HYU0I6O3LUU03jY64GmIYmepn/VGGkdKZCI8RQ92rYGe3LiAY4C8JklV4f9PrQKl8CFgQKkztXZte1B3J3jXljJOdsPcuOHQ0xJikAXxcDWqSo+4By8P4NT4V0usRhxdqs=
Received: from MN0PR02CA0019.namprd02.prod.outlook.com (2603:10b6:208:530::34)
 by DS0PR12MB999313.namprd12.prod.outlook.com (2603:10b6:8:42c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:21:08 +0000
Received: from IA0PEPF0000003F.namprd04.prod.outlook.com
 (2603:10b6:208:530:cafe::28) by MN0PR02CA0019.outlook.office365.com
 (2603:10b6:208:530::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 07:21:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 IA0PEPF0000003F.mail.protection.outlook.com (10.167.249.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:21:08 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:21:08 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:21:07 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:21:04 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 05/11] soundwire: amd: remove unused AMD_SDW_MAX_FREQ_NUM define
Date: Tue, 17 Nov 2026 12:48:14 +0530
Message-ID: <20261117071927.830373-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117071927.830373-1-Vijendar.Mukunda@amd.com>
References: <20261117071927.830373-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: IA0PEPF0000003F:EE_|DS0PR12MB999313:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fed9e8f-6abc-4093-0e72-08df447b59bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|11063799006|56012099006|261026140227099003|261028144727099003|10067099003|261021123027099003|261022105027099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hwvN1N4YVBZ/LHtoM2j90jVnND0BsFE36VubVs2Yzo5pBIusY2GoI3GRl9J5M2bbUd0qgFd+mWTxcz192lYWHrdI5LRZ1dn5RqlQNR7pOaSgL5HHfGCCC4eNxsyVqs7ZLpyeXOccQFZ2aqFHvLo8w24nJuxuccOUvO9kXxqVAqZAllTukkxzIWwHcxuaRNWTy6ptUXjlyOpPFIYLZFeX84PFKReozujD9I66m6n+zv4EAImTFWtSGlUZ/DviOdcmuiDld7kyBdjN40mJTqmyB7/sY8up1Rc+94BpTyxCrcAjKftM9tEQNULdTfYMZtmbY3Uw9fAo40uP6ycQWaNK+pIJMzA+IQaAqNOjCT7UxkWgk7Hj4HjJg5UkLWp6m40lhTJSNf5dAeN9XLu/UTvTg26r8Rq4cNUNthAjYwQoLVzN8XKfnmpLdCrKwv8lQYcBkgaXQB9U8ojBbDb4gulDmiuUy/H4l5HeSNbLrrVCIQYt04KLAlp4l5KOlWatkLRRVt6do2gmwnwtyGC2/NFDqRP/KiDvvS8KAgBazomHFvxJo347WXP/LYYYgE42VaZZqA3xx/Vo+2lsKyDn9Z4zcTs+CurI5vY6lURH7IAwvyoZ2W35yZH4+dyn5bko2SsKbinY63Fw6e1duEIBMYMWGmzqQSooK+z3zGiADQE1ppvfjocVRKTZxkTgh2+A3Qya9C+7cEkYjTKADla9K+Bfgw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(10067099003)(261021123027099003)(261022105027099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Mjl3+LuICsRO25dODpXBcPhO8mwYXuyPHDOqC5DaanAwwsPYxS7wtPipknGbjZEQ6lo0CUtTL1lwjLwCiRsnrSTx0G3Iit8VXs4taUQ5DQcx6OuURkKbCYWK5KPk2GVwfa6vXIblBZkwn18L+CZycpfTGJIKUn44AvmpSLhSes7mEftuBZ6rDDv75ZknCHKLjFcRM4CCo6L+ULkkO0KKHomy+7IpuV1SmoFrfBIjuwoAEeEBOLjO2nkPJoUAvHVe28KYVMbdP1Cmi96+7ElRaXS5I56y576SXnjlDbZx4PL6+/16dU78F4NL1AnIsj1MrL1jyyVkIfA8h7GbMxIQNlRmSer9znsTJWZPgNYSw1LQKb12ug7h4wSDnCStFBZwjSIRhb0O5m7nsG+9K7miyomYH4xC4pmnEIJQasAv2585A606wVq+bjd/dlRDPwXD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:21:08.6800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fed9e8f-6abc-4093-0e72-08df447b59bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	IA0PEPF0000003F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999313

The AMD_SDW_MAX_FREQ_NUM macro has no users anywhere in the driver.
Remove it as a straightforward cleanup with no functional change.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index 79372e93ad2a..f3cb62398fb5 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -159,7 +159,6 @@
 #define AMD_SDW_IRQ_MASK_0TO7		0x77777777
 #define AMD_SDW_IRQ_MASK_8TO11		0x000c7777
 #define AMD_SDW_IRQ_ERROR_MASK		0xff
-#define AMD_SDW_MAX_FREQ_NUM		1
 #define AMD_ACP63_SDW0_MAX_TX_PORTS		3
 #define AMD_ACP63_SDW0_MAX_RX_PORTS		3
 #define AMD_ACP63_SDW1_MAX_TX_PORTS		1
-- 
2.53.0

