Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066576;
	b=o6zpmyPy9VHkl1X5PUGjcBc3T23XU4upaXw+UDjabv7QfgMCuZbZVHC7lKMrLZUYziG9
	 l8d8gYEo+GcgVcfGSHhQAt9hnyguJY8AQfOLZb6LSn6yo/1zMK/DGLMAYiqZCZP9rZt29
	 YCJKxOiVs0uLDm7EzhA5j+SiYSCqeAt4nWJNN37kQlnmGfXpM7LQBn0dXnMa5qi5/foIW
	 gFZIL5hBZSMWxu4VGfaV+vfV4lrhFyk0id4B3NEDcVcqAJVLa3kwXcT2lMTcBieGuFkrS
	 Vn81bXah+zUR2uLCu//1tTldISA0CbJHQk2Wfjm97PjutFRztlMbyZZZXxiJclfHd/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066576;
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
	bh=3KtyyuDty15uYZs42IUUlOqU/QgMZIZW51IzAAlh/A4=;
	b=hJOISQ3EWiPwedqpMQhN8gABkoT/7UNu66uQPj9intXnpOds1Tyx67BVRF4Z9EIwpAJP
	 2/qPmUnir9fV8oeshM4UB8pyaPNYBwGG/bIdYbU3lXEbjAZkiZLUp2pUgaKqzv7IY2Kyq
	 esmVqAyJuKVq2NfxATs3mS9RoM6MzeMaqjsKEgSHgKsNpQeWhXzW17pIcwoB4eLfaVE1o
	 DYf7h0cfenwx7gmc5zaHLcRxKM9UCMLObMZGuuTMHyuaUrF71NcPds6fSEUcSFPs+i4z/
	 mErm1tOi53O9b+yJRBFHM3TJBx/t3Vr1mIhobKHq5r0sC3unj5cP0bZz3X16WsbUGfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=eW4gsOuA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.16
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010016.outbound.protection.outlook.com [40.93.198.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505C460A6F74;
	Sat,  7 Nov 2026 15:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 505C460A6F74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=eW4gsOuA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4i7o6fTufMTT3aIFCiV2L5hNUs4vwVwehlESTXwkGMEYRM9OA3jEk2sQwveoDKuox/EFJGgjykr4/K7crIecxH5Ek4gRnh+VO+ghLrWqdC4vQC6L+fChrXgj36KLDzuplyjmumKEAebQBIsOLeXTOONkpibt9ey0hKbhAr+LELdBWZO9uZKvOglIeLHEedPYGux/frKDZqivs8alHkhl1MijE9o8+h6njTnFiNY79hG7y2Z/sTYXO9BqcScKZTwT/18RqLHHk4a0KVmC5oC8S72p2QI5d8g/qRvhWyJSeMfji+h1xQMnC8jFhSe3tIBhIx0KhU1EJO4U2NMfqQW0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KtyyuDty15uYZs42IUUlOqU/QgMZIZW51IzAAlh/A4=;
 b=rMx2Cb+IVbIL8u8mU2EVm0VJopiblfbx/kuPh/+U1/pNIEd+NjSoHkMKY9g01Sbu/5ng51RLR84o2xpDTA1sCgUL/bcWZdqVwrpJlRC3Bo7vZxtRp5arGEdT7O0PaYoho3ibYdRoVO8Z39i6fAF7rZvxy6G5pwgOAQEaJhyBMpQNlkArpHfJYxaduO2toXP96LLflqZ84rqCbT40fpG5Mxj6/Jb7bFagPpCN0uhnmdSD5RMKKucbMEoGvUZPdXlS6puetMqjUp+uMWrQsPbmokJPut9g6nrwW1t+E6OoWacG6xNu+M55z0TzMlhlt1t6Lb+vbLmQhLZjFOvNbq4UEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KtyyuDty15uYZs42IUUlOqU/QgMZIZW51IzAAlh/A4=;
 b=eW4gsOuARE9z2kdL8/CDImt+ZsApjzi3sMbMPsNxlobARVxk8D7V7nMz56R1bNpNzBX7ENeMRQ40usECtjuhXNst0RDutLE52/LRXsKMq1jJq6N9CUW2iAbPD8pWeT7MVu2sXHp45QoniX1ibgITFPbGFAjsOkr5CCQmNv+fALI=
Received: from SJ0PR03CA0205.namprd03.prod.outlook.com (2603:10b6:a03:2ef::30)
 by SA1PR12MB9548.namprd12.prod.outlook.com (2603:10b6:806:458::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 15:49:32 +0000
Received: from BY1PEPF0002696A.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::94) by SJ0PR03CA0205.outlook.office365.com
 (2603:10b6:a03:2ef::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Sat, 7
 Nov 2026 15:49:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0002696A.mail.protection.outlook.com (10.167.244.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 15:49:31 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:49:31 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:49:30 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 09:49:26 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <lee@kernel.org>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v5 20/25] soundwire: amd: drop amd_deinit_sdw_manager() in POWER_OFF suspend
Date: Sat, 7 Nov 2026 21:15:29 +0530
Message-ID: <20261107154659.3358223-21-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
References: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0002696A:EE_|SA1PR12MB9548:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a4b1a69-a134-4610-5af0-08df3ce6b6d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261026121527099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	rZDgFZyJYNVbq5ellFUKjLCm4Dl9CcNiJU0sHX2gYvujiAB/uHx0pRlbHTNNEESnXqlz6xqJbG/bS3dRwVUao5PpkQJ6+mGCxRT7VjpigmitvYxwlWfIQli6XhBMC7CW3NEzy2Y8FiY7j0yrDLgt2O0tYJLXd41G7qe8UaswTAQxW7duZ0ANHlFayGEVP4AiGQqrV0S6Ek/hWp/nici/b05PiLmQ66sfesxJP7SwADLgX+3qsaukNvM4JO049UrRoRw7yrXqnIlm0xKyHjWouZTXvA+2NV1pMcKZZA9EAVDLcRPgmQ/zt0OdqmsUmbcQSznkO8400WyV82Qn9u9Nczy2s8WveppYNffyyasP+/j3gw55xlT3BsLR3MWNsVnK44h6273Uu1LWOH8q/ZBY6HYReVN1KZriKNv8Cd6AJWsXemfSyI8YzCYCRkf4azAElSrKVH+KCZcdYwB8H2jfIme0vjz/aQgyOy2NIFAtDVZH7iKGrDz1K//0diLV3zRz7de8p8chFFU59oqzvMQGoQi41dHsd3GJpelXr1je50u7bERCV17JKtK4/PHvPVCDJS91f91h7dB2xdiOvCLKzwsY4hNpKxk2CeAJ1DbCVtBeUxPn14UhNM10dZIjlaHeHbtz3nouaaH4VpjmZaoNWq7nwpAg1pgBmZmzAP1PIkJb+l4BeF8r9xTuPYCgTon1+FXSQsjLR5tv0qHIdaYwUg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ErIp8Ep7X5rSrtOOxu6kHeMW8lEzq5SxL43LJFkB28ClF6HOKqnH04VNwHttErzSRpRyL+A/jiotn9fWujxDMB4eYGw2WR0io6U4fJ04zg94G4KuPsSFFskjyOOW/N9jGfXqaoLgKMIfx9n3EAOa5efpUaCPeBC67Vw99MCZNnMdcC5Nc9UJFY5lYeI61JwjXbYr3mAcxbNRK0sv7TqfgdIo4xIa+NysWEWJFlCvbUmqdSZiIG2bbE8xSiHS/IZFiriE+2srw+xkyyZkd6AxiXVWOgTO9XJH5iP4RLCp8/oiVzCCCZdbqGt7bMBDddzhhuxe7g9vpKgxMAtGgnMAWYrUl90g1l36A/kYknGt+oX7Eg1tiXnbqT4+EV//Z7h4ZlgMTN8XwvLgUpb7dEoMoGVr4elsKNRxBPAt8QlYJpn01RGq9WOt3Ad91D9ZauFA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:49:31.6028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a4b1a69-a134-4610-5af0-08df3ce6b6d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002696A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9548

amd_deinit_sdw_manager() was a small helper that bundled
amd_disable_sdw_interrupts() and amd_disable_sdw_manager() together.
Expand the two POWER_OFF_MODE call sites in amd_suspend() and
amd_suspend_runtime() to call those two functions directly, then remove
the helper. No functional change.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 71280745df8d..b6aa05f5f6c0 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -156,12 +156,6 @@ static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 	writel(0x00, amd_manager->mmio + ACP_SW_ERROR_INTR_MASK);
 }
 
-static int amd_deinit_sdw_manager(struct amd_sdw_manager *amd_manager)
-{
-	amd_disable_sdw_interrupts(amd_manager);
-	return amd_disable_sdw_manager(amd_manager);
-}
-
 static void __amd_sdw_oe_update(struct amd_sdw_manager *amd_manager,
 				u32 mask, bool enable)
 {
@@ -1451,7 +1445,8 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		ret = amd_deinit_sdw_manager(amd_manager);
+		amd_disable_sdw_interrupts(amd_manager);
+		ret = amd_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
 		/* System suspend: tear down all pads */
@@ -1494,7 +1489,8 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		ret = amd_deinit_sdw_manager(amd_manager);
+		amd_disable_sdw_interrupts(amd_manager);
+		ret = amd_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
 		amd_sdw_wake_enable(amd_manager, true);
-- 
2.53.0

