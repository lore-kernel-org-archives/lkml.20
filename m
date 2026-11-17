Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794899484;
	b=vlD2CjtKzjPxTeomsfINvoe7WKYsMbQLtLXV7IuEOciH7De4cCJNXg/Cp/uc3WlafgeE
	 j8/RV2H9j0eqcegdckF3rcX2XgvOZx1QCm/Y5e0Mwf+gug5Sa/kf2oGgXiWwgqeckd7Ag
	 GI2pE6nrxzKSu3iyhPHO0h2fbEOjyix6lf2BWNR3QQDfQ85En7rVqeqm43DIdM0qfgTD9
	 q1GpLU4aFLQgv9ezN5Jxip7/j3QicjHoH+Ljkiw0cF0t+hqAwBkdQKe0oHCRRCxJgh7rK
	 p1VSV0j7KD/s2MOweXMlVlNdoEfX2JAK4AgsKH+2AftTUcnxaGS3/BHt04CAHo6VSsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899484;
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
	bh=zpyHyHQVcfY3tNJDfAzrBXFZw/fhJuDXMPV3QfgDDhg=;
	b=VeHgzpCp/5SAhJfisFPsdtbOIBpiR7JfwMb/ZP+ASxeh1Xcq/NdLPOPZCT8AsjloKkpS
	 c9fHYonsqeH9a/b+mwPzJh7tDid4hLBTgHqDIRy+zXNh7vPBqGUGFjW4XuHetmb4bXKmb
	 7LG7NwLHPfqYtTI00JjXiARpH7OoXzdqOT2W4FeJowe4Ej7eMeDt0O/ykxgo2hcM/Ahkq
	 4YOwuTh56znGjoGh0ZsNM7DrBJmxMRMvu1SCwINcMy8bKvJSctpRW+6LI7kavMWBKgVlL
	 OQWYYaq7hAY8zmcLQTyWGd6dvzDTl+Lxytm5CLzvc7xk0J1LxC5eyglmJ4zQaC9Ioyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=u8CZKvYO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.10
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011010.outbound.protection.outlook.com [52.101.57.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B13E606A32A;
	Tue, 17 Nov 2026 07:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B13E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=u8CZKvYO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxOxtI/XOdHL6LTjlELrA6KtN4SrZ4KCvpPxNHof3tqz5OsAyVZ20TAiwsb9L7IHVoC3waNdEzbuE0oVETw1+0UvOP2U01ifWUUxxgjP07NgsJrBTaHDeQVWypl00DrcEmiatSViM1kbQ16oIaNmSjB2g5C/QhUbUK1nrccvZVTyHPcf0lFQlQbDS7tNm9+lmzl1VdmDe5Jd6m9TVOkwUi6l6zE6RIp535JUbTVA+BRRdfwmz+7zaPbnJlwaSQWUMLugaCtiRE60ofqSHDDRoUzjKtLEtC24hSShlL+kSFGSAK/fFDPNtPjHKqAgd2BZ3N8HIfrc2iOwIO8iBVNy6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpyHyHQVcfY3tNJDfAzrBXFZw/fhJuDXMPV3QfgDDhg=;
 b=ut5wkTB/ZHD/0Tmtn2MoLOJKHSjsobZjCMvq3MB/nxV+MlEk771RLmWfo+0J+C2JDTx1UmTgRfJylkmKbO2lRBkaIHZNicVdMlLLn54Bs+dJaJUX+YL9SVmMKUIJU8TvENcNUqvq5k2PHHS1kgW9GCRuBgqr7ui49bfww3GZU8gzJwPZMWrro97HW6jk2rH5PKbsRKRM5Owq8CSuWAenKp8x4yKoPjCjTf+QqgK8jz3Sp/J7VXiXxx9SpplPNCV06YRzkcQ+zt2oiT++idtebAtbtJ3QV4yUZ47Pe5afFzAE3A2tAR9nGUHrn46wNYgUnddPKTTVL5CglBi41RPZow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpyHyHQVcfY3tNJDfAzrBXFZw/fhJuDXMPV3QfgDDhg=;
 b=u8CZKvYOWJBe2FX9FHq+hrijVqVBJjHeAvBMkpN4ii0vS3c/iJWN9EmmP6Vc6jHwr/gMfFTuD0hggA0WI0NwOy7WmCH/+1g0/X3GqA2ql4pCmCOyNQoXvxhVGHXJ4QuHvbOFPY9vCrAMzA1O3BG7z4XfIwJPUXMM/98ZPfTXl2Y=
Received: from CH0PR03CA0105.namprd03.prod.outlook.com (2603:10b6:610:cd::20)
 by IA0PR12MB8930.namprd12.prod.outlook.com (2603:10b6:208:481::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 07:11:19 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:cd:cafe::16) by CH0PR03CA0105.outlook.office365.com
 (2603:10b6:610:cd::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 07:11:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Tue, 17 Nov 2026 07:11:19 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:11:15 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:11:12 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v6 13/23] soundwire: amd: defer dev_set_drvdata() until after INIT_WORK()
Date: Tue, 17 Nov 2026 12:35:48 +0530
Message-ID: <20261117070906.803139-14-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|IA0PR12MB8930:EE_
X-MS-Office365-Filtering-Correlation-Id: e51ca9a7-3097-495a-eae1-08df4479fa93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|261026121527099003|10067099003|261021123027099003|261102123227099003|261021121427099003|11063799006|261009223027099003|18002099003|13003099007|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	2rYa5bOvPwRzy0r1qIKK9qDL7DBNv2rjZkFPQldQeVEkyWrIAirfn4NRUxmsHz9d9mTatQJtjfhSzFlHegqjx4LvjPzwjpH6W3IYQC8cYSFyU5m7kBxgFjIM6SL0ROO4qiFqlyQrJqNH4v+bEcZbeybhtM5umoAm0mrLtJd1Yo7giC2RBlGt79m7eVcSVFgU0EkfTNlt8GXcdznbaoGVVhE8Rd8Yf8wFBoSbdPMUnXB/FnL+NkaNnzMErSKsERkUtTuXC5Ose6gBNM3x3F0lgD7YtbRg2VMrzkm6WKwxV27ZKGZ0rDMXKmovv/EoFphk9Gxewni7ZlR8XBOiffFTedGroEcogb+HutfHS0V4zESeApHoFheEcX5arYMuuWD5E7NAx4nLzgy5fDS1t42hD6gN1GSnBlBszP0P1JDer6M1rvHLzrAa6Sp+6O107OShD7CZO+6WkQ5s2C5IQfeQZZMNc8LAnge35fVJ7/hIVzeO25c5FQ1YOcDqGIWqgVJtsM+H4Wv4CsSDIZZayvaQw1GVtOqPrdhz7o7Kxw2/COMzddZsRsP+jrAN4ILjlCwUFznEm83BGybVItCrvLWtRhWQ4ygZ38kxduQdwnaWHC8RlHmbsspIXAnu3gfZpPoOqetbfsAFofy198ERXzIYog==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(261026121527099003)(10067099003)(261021123027099003)(261102123227099003)(261021121427099003)(11063799006)(261009223027099003)(18002099003)(13003099007)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Zpx7HKQ7fskMopPtz7t3y3yqugbd1/5VEGSD/xLdC/B2EvCb5YR4qYUrJu9dNFG+mhvfA6TMZIwTFsm+y7Q0QhnhgcamdWQN2wGkjTCCfwGAi/ntiIj1xB0BJlfmq6/Mp1ExxkLMw6bWTCRsbRhu/0sj2EKAVAeTUy9FVvcUlHt4gFpCKqRvIaMBoWM4F9AJxfNbEegfogv5P+L4ATUUeJ8bK+5ONbxX+VJS3ndBIWgAgxOpHGAPb/CcXBHY/G3rnE9D6xzZ73Uw7gC2rWbVJDjMUJLEhlv48vpASFcbqjEY4tAVAhXPLmiD0QTk/MNxs6S+6VVOPojJUm6QBJjwlzXm9NqEtIugQqlMFp+Bp/EY7BB4mHOG5dRANxxTbJWmLk01IvELwq2Fqgux0ijzTJQ2NrcBdYVKN+mOKt/WFxg1VS+lnxUd5M5/+NLhIWK7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:11:19.5084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e51ca9a7-3097-495a-eae1-08df4479fa93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8930

amd_sdw_manager_probe() called dev_set_drvdata() before initialising
the amd_sdw_irq_thread and amd_sdw_work structures with INIT_WORK().
An interrupt arriving in that window could call the IRQ handler which
enqueues amd_sdw_irq_thread before the work struct is initialised,
leading to undefined behaviour.

Move dev_set_drvdata() to after both INIT_WORK() calls to close the
race window.

Fixes: 65f93e4096a0 ("soundwire: amd: add SoundWire manager interrupt handling")
Reported-by: Lee Jones <lee@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-9890e8dc-4b7d-44d3-bfb0-171dc421e28c
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index b1a0e12819de..c412d4ff4606 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1254,9 +1254,9 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 		sdw_bus_master_delete(&amd_manager->bus);
 		return ret;
 	}
-	dev_set_drvdata(dev, amd_manager);
 	INIT_WORK(&amd_manager->amd_sdw_irq_thread, amd_sdw_irq_thread);
 	INIT_WORK(&amd_manager->amd_sdw_work, amd_sdw_update_slave_status_work);
+	dev_set_drvdata(dev, amd_manager);
 	return 0;
 }
 
-- 
2.53.0

