Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794899485;
	b=IPQqbK4GLdhg9X8e+ib5gh+fOnhlac6SQGTaZvw0cnqKTeGSE5yIM3J8489VUJiSDluC
	 y7YhxasXZjkiwoMUDawzf2U+ea/lKDGbX/ijiIqPN1ggCRUP1+7qyzC6FAj1OP4dC3neq
	 Ia0ibkWWqoDC9RBOTVzgLroFyVtrJ012qUKyoeYmoZXmJFU0eQ2AmQTH7/xO0dZon5vmO
	 1rvrjUJlsxdkcQJkcpau4wuA3NfarMUc1rO7zEZ//cdJPNikW6s60b47Y38ZLBN4RE9Iv
	 FuydXltzVj08q2qImI+yzlmS5mbXhldp2dVf+D9+LS4p3wMxu3rYxQpuEnSGSO1FMvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899485;
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
	bh=fBfLulQDBsViWKJquVogu5YvdACWq70IES3d00VorWI=;
	b=YnSTfkqbma91QlaIx/ANCz6hXnmjOKdK0pjxbldiNWiBocyvfxrYjgIsBmGxHl6a5q2G
	 +aHQPyP1VU/pHwHzGDpEbxGZJa6aySKmYfcjSPEIr7OHV6uyJncIKS+tzs7ThgWOR6PWV
	 txa6TNHmw6zrKKje4QtnRvR0cY07hxNw1u1IodGlX3zataFpkvCsEj7GHyuM55jYUjH4a
	 BBCnQWpGk4TE1L1eLAGbzQd1KQdTbU99nOIXuaM1H302hTyVQCjRLomJ9SpfdXS3y9s8x
	 YpgFQT6fUfVxhxUeduIa/7TDWfeCXIO6ck1Pud1AYRO/kq9ZspSGTqRvd7nMKKwcf3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Z0lh51DA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.30
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011030.outbound.protection.outlook.com [40.93.194.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E422C606A8B3;
	Tue, 17 Nov 2026 07:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E422C606A8B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Z0lh51DA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbOZExqfqEYxlxd2T+NNttr76mP5nsAG48T5BfMNhF5+y9LuiPzcfDhKnhDOwTzA3eOF55PMZh/YWHIQfGJQobVGxUwqq5bhYujVxft5HK2TUAv7vPZyz8vK07xdP6E2IjCYCu2ZRVeE1Gzuq0vP6i0hRYJHShgcAJwbIdZ1XGUN2nhPn8Wns/mJnLN164Ln0l/f6xPLiHpa/P8BY5CXGoA/+YXvSjCKU9ZjLYmMWF4oB1GBOY9dN9uJdZuqnzS+gHXFCla3RY6IbPC7FRIk8EurYkjutQte7l2vyXzRW6PBlMSzeUbcjeeRd0uP7lhvwYVau5Z8YTMDKlricdruKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBfLulQDBsViWKJquVogu5YvdACWq70IES3d00VorWI=;
 b=FOqBZN/ayY+j7z3oWuIyTi+h+ePLGb5J4c9qbShrHoSym4T+uUl/gaiDgNAwpR0017hutYkMgKbdg/Bu1YaY47vfhmWg5WnOBfnE09t98jmFMrgYP7pmUnzczZuQ28dk9zBRDg5QhhgWxU8oYSZUAbZQr8mIitKKrABGgx8DeOUy/s/ga2i9jN1A7/tJtlyGzUfeEeWxYEvcZKRQxQMK1maZGZhHrWu4TXJvHy34M9QDNvWXm8/9RMVy0/rMwfDwDMdu1Ro0wWDSxdm8y56PvvSBaZPtUWxvgpVmTdk7uMXw6vNJy2/QvKYdOrJ807TNv3TBQM1dJZh1KKkqV/aY9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBfLulQDBsViWKJquVogu5YvdACWq70IES3d00VorWI=;
 b=Z0lh51DAPQqiiIBeA0UDbkkq7ogtEta1Gsc/5PtgNH3aKLqqj4MahCJ29yz60RQu2jbJZoFIo+Ib2PFBBal6xtg5zewvf+upOl1FARzuzPA6r7AWu3vcHZnpjQvWtG9H73tgsv/KBVQsWT+vPkoNme3txSBuGmpuNzW1V0B0axs=
Received: from CH0PR03CA0097.namprd03.prod.outlook.com (2603:10b6:610:cd::12)
 by DS0PR12MB7770.namprd12.prod.outlook.com (2603:10b6:8:138::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:11:20 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:cd:cafe::43) by CH0PR03CA0097.outlook.office365.com
 (2603:10b6:610:cd::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 07:11:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Tue, 17 Nov 2026 07:11:20 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:11:19 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:11:16 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v6 14/23] soundwire: amd: pm_runtime guard in remove path
Date: Tue, 17 Nov 2026 12:35:49 +0530
Message-ID: <20261117070906.803139-15-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|DS0PR12MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ee88e76-7a2f-417a-922f-08df4479fb56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|261022105027099003|11063799006|56012099006|261021123027099003|261009223027099003|261021121427099003|10067099003|261102123227099003|261026140227099003|261028144727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	wRWoIiDOp39F4XiabpQiiZsxX7gmNOuybWbSwIQuH1TT5Lpfht0KjrjauiQ6vv4l+dywBDJpLCKRsKK8CVUs7G6qxhNA81g/e8eJ8RhEEcknvbgW9d9HhhjlhJ1j/p+BWg7Ej9+PEwCI/rpxNFXbg+OOeUZAAo2P28RIkGjZcDtsafzcPRq9dk0zqh8VXTnp0iBaglMCN9kBR4F1XmY2Q/U5ZT6Z9IQSBcnAY8+Bqf2NS5WlKWGOAfkBHx004pZlEo5FAk0F5xI8pfLLjJ3/6jrzQrkWXe1fVvuKH5MfEWvaBNWC/OEucZG+wIx04bsePSBwIZ9HGyO2fQ/jp8xm2KJfJaoQOXa9VR0DElDx6vJRbWuKLvUFsUapzLpiv0PcrLvsTE3I+INUV44i2gfBzxrhyO4oiFoT3h4D/6quIOmBYQbmnj5pzR5aaKpMNTLIeGYhp347Wj042DeXKN06XRDbunNiQt3WFv16rldEC6xTyLdEky8zHA8wF44roQ9jZWnXUHbIttc35uXP2snkU9NDEKeye3OIiLFneuCDHUExk1PS1wNbyzQVC4Aw5w3Y7q4rJSFalmMRt4IJ0+1UJsPkBxQX1DnSF20Viisq7hx3NtTOaFITrSzvLENeglJ85UnGcabtjfpabxf3/19TrQ7cyNq/edvMIBv3AxjPlzSL+2lkQoehIqJbEBXKqwscqJ5eiha6dPhqVKd1Hq1yKw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(261022105027099003)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(261021121427099003)(10067099003)(261102123227099003)(261026140227099003)(261028144727099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	shNQyCTB017chqrEcpifjAxEQKkNesfowKy0mN+JT514SXUCTwgy2QHPBqp+TSf1j+yEMkAgOnwk8rulfvspI+7bzSTvnW1sJjt+4NfObW/GDoUf96O1Qb4JBhTPIb1Ehc0x4nkUZTLVUuMJ+YM1ilaZC06QKvzENGBiyXT8GIMHIvE2y9EemaPDJwbxi/LPi5fzlQhMrutCOG/RNZc+r7A6SpIiiJtPSfyNvo2d4jvAqBnhYvtTVwV5dZbwSTweQf6N4ehYlduu4QrUQI6tu38Jlfe6gvJe4nJclyZFBOtXq126By+oVVhsZBJm2CRJSPwuE1xnTa5aMzRBjSP+7wYZ/wyr1barJbHpd/xqpcjgrW+rIqTRLUnORjJft2d2AVjJ8LC69OxEfNjptJ34Z1zAn2Ors0LB7lbh/YrrSmF7z7deO30HKNoChE1xezZn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:11:20.7850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee88e76-7a2f-417a-922f-08df4479fb56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7770

Guard pm_runtime_disable() so it is only called when runtime PM
was actually enabled. amd_sdw_manager_start() calls pm_runtime_enable()
only at the very end, after several fallible hardware init steps. If
sdw_amd_startup() fails mid-loop (one manager started, the next fails
before pm_runtime_enable()), sdw_amd_exit() triggers
platform_device_unregister() for all managers. Calling
pm_runtime_disable() on the partially-started manager finds
disable_depth already at its initial value of 1, silently increments it
to 2 and returns without a warning, so a later pm_runtime_enable() would
only bring it back to 1 and leave runtime PM disabled. Use
pm_runtime_enabled() to skip the call when it was never paired with an
enable.

Fixes: ed5e8741b8db ("soundwire: amd: refactor amd soundwire manager device node creation")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index c412d4ff4606..93c96613b5d8 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1265,7 +1265,8 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
 	struct amd_sdw_manager *amd_manager = dev_get_drvdata(&pdev->dev);
 	int ret;
 
-	pm_runtime_disable(&pdev->dev);
+	if (pm_runtime_enabled(&pdev->dev))
+		pm_runtime_disable(&pdev->dev);
 	amd_disable_sdw_interrupts(amd_manager);
 	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 	cancel_work_sync(&amd_manager->amd_sdw_work);
-- 
2.53.0

