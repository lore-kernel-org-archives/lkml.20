Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012067.outbound.protection.outlook.com [40.107.209.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCF84B7A4D;
	Mon, 28 Sep 2026 12:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596865; cv=fail; b=fwA5BKYg5fppoFyhIqEd+pFTsG7d5YNRJ/TCmSkAcmCckZrg2A7/wOo6Tlz54e8DrALVM2+l2SxBC6P937Z4OVfEQ1LYm69SnKfQaCVQk6YCtO11pcpaQDbs3nscsdYtyhGsmyeB4Nuc+98kO7GXHAkR2mejnl1x9PbPiQLfcqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596865; c=relaxed/simple;
	bh=X4lPzGxIwMP8Dk5e8WjbcIrGlu8SxTdzd65gBw4bJI4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VnCIubsqftEqOI9q5Cx0OSJdeyFukJxnvH7vUk0+6tqi3RJbGvUHzvGj8lMjRSMencYTLaUVKyCp6EGjNpRHlh2EJlFxqWwWBeZqNgBtew8YVuXRLEMbFsVhNHWoz6VWUT7hdMQq0ol8Vst29g607/yHPF2xHTeHZ/x1aLGiRFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=08i3HHbd; arc=fail smtp.client-ip=40.107.209.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="08i3HHbd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXsneCjkOn3TxvAS2BE4M3w097sTo4lAldQyxi93A0TvIcUUcrWHiOZOdcK7PJhXX17VWnQUb5nqvngW48mX559OUZ+At5kwyrYBAiLmBquQAYacC0iw2ZWwVWBUrhW8YJ4PtXn7P+5O3EGloA3p5N0OghJV7WUP3fTMBF/oAuO2e43UiVBulqE04LjIf3qZp5dxaBWjWl69hPRNcYs3i54ADQG2rUwaw3JXY0fCHR6i0NMuHMM5LJKKUJnOimhNza/W6gJKuvFXFBlcbYka9a1poti7UtJpJOKRfFQ51jeTTdZbOTubRxk8s1hvrHBy5JvlPJsisEQp+ypO5GDffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozgXvJc9hvZCFDxvzQlXPbPbXJuvrSufWFcJTdTaFZQ=;
 b=XIic5Ln5wALWpcPs17ZaPt02g32k1532lFp4m5MV6P0loKAQBlcfC4UArm4LTL37ZHO3WzG9+7x9vCj4TgrkAlIiHprr8g4tWGfo4ByyzF4xsatrOnB1mLpb5e+MdhRRNVp7hYXQ5P1cqOWF1VxuklqG/CQRzNzlA0Zq8cXJwk5VtN7RIf6EyPnd0iPKOxTuirPsJVPYH4wO+6WAywRiiFXrZSJomTlNx3amf9r4ff+cyK//Uqcnp2gURLF4yfe2v7VgY6L6+g8njNmYYTcEqzcWiz26V/bOGnMa1npXADZJDoApGEzQgeaDr3ywoT6i5LePKiLhd4qfSUpDt3sjXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=synopsys.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozgXvJc9hvZCFDxvzQlXPbPbXJuvrSufWFcJTdTaFZQ=;
 b=08i3HHbdR2hw25+kz8U3Ogh7dZElFbqu1LqHw/2S+gzf9wanfBvWjjOwvwxN/sZ64tnf8KGAKMmdwLcEqOVsegOQXOEAzVNfI/YtUbwAT3Z5XLmAlgFXvbmZiBMekGcwYkDJiZOqVWpCTPR+J3uSaWo8rIn5MelM0q9XsF3sGmw=
Received: from BN9PR03CA0125.namprd03.prod.outlook.com (2603:10b6:408:fe::10)
 by PH7PR12MB5879.namprd12.prod.outlook.com (2603:10b6:510:1d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 12:00:56 +0000
Received: from LV8PEPF00000065.namprd03.prod.outlook.com
 (2603:10b6:408:fe:cafe::10) by BN9PR03CA0125.outlook.office365.com
 (2603:10b6:408:fe::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 12:00:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 LV8PEPF00000065.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 12:00:56 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 07:00:55 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 07:00:55 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 28 Sep 2026 07:00:52 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
	<michal.simek@amd.com>, <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH v3 0/3] usb: dwc3: xilinx: error path and teardown fixes
Date: Mon, 28 Sep 2026 17:30:12 +0530
Message-ID: <20260928120015.3152461-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000065:EE_|PH7PR12MB5879:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b5a6098-9b6c-4042-4909-08df1d582721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|10067099003|56012099006|11063799006|5023799004|6133799003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	Nk+AOtc2d3Cr9DdIWX4lYDwer9FzgxtuFz+f/Cv2on7dmvGyJO0yJ7jdvODaD9Hk47xQPKlpFDZ1MPb4155qRDy4rCpOOjUHMUpqBneU55QevH5rSjDWrys/AF46F60ANUjaljWA3xYtkdlFEGIT2yrsqxU19pGaDI1zW6hqVoVFZSfF6Fmzz1qW6ePp0a5LQKfo6YWAbw6bk10vOjNdBsa2cZAT4g8L/5ZMndXqDmmjfSGrOjeOGwy0ZshZ2GDtTLt+eZ/18XfLzBg1LqnExnq2fLXUi20nMmIUdZb4WidWkMwYeMAjOpvaL1q1fJL6r0+Zr4XsHKQ17lNBBRrhfY42at2D4z06/E5PXdCm8434XuyfLEXs+4yeZ8sgWBnwIFtzliDQrDNat9sB+hXcPnJWKYz194bXSDbnOXKnvYwHmMl1mcEobH9t4qu9Mn1RlIYYe4oPcNv4nyWI+5nZgpuuUsclHoDakfVYK/aEEasJPaq8ESjM3jaX0MtGSrYV7sd8UDLW5vU4i+pTMxDXnZAcukhQa5PoYm31GIq5PYIOosEBYJ7E1VwBhm3SA/6YgDL9gpYED9eua0YOjxUX/1XdjzQqN12TLIiXzZtQzQePhsBa2nL/SazFIlQMtj6fIBwt5Ji2XH+eQuxOPc/Uq82VGsLoeA+C+W3gGHNaBroBlS4L76Kshr92FIbvtXKMCvsUoi6wkLeYgvUgV8Afaw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(10067099003)(56012099006)(11063799006)(5023799004)(6133799003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3OTnOS8KxAA+iZwhawMbd9a1et1D8QvHXehcD349KhsTD48VtskUGEZgeKkSPffvQgbX5TAfZ1w8nxpZ6biXliXnZMzlBnuiL4gFhC7ZTAtMDEKJ5tbtuj5EH6BtM+xSyc6ai8FMFB0CkUueUYbpnopa36+jgHaf361EQoLsgKOeGV/PmMZzGxiimocUYP4z4UIKS7J7DJ2kQq7eM9XomGX7Gkjbuz10JPWaEsTC0kM4UgNhaF9MXlXQr3h8ybgXIbZHd6mQKBgVZItCbD1flU5fOcB0Lzq1n8VzfswO8uRHpGMNCLOxwU+Z2L7/ofnLRRIH3B/PH+mXqKsg8K3XM5GO7h6P4OCIbMSi5i6qSW0X3TafUNnMtAyRTbu0R7Ct2+EvTbya/6uP5XafSERogKtQ1sloaXF941QDdVQ+ibEnY4Q/8C6OC6e2UKfM/IB+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 12:00:56.0290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b5a6098-9b6c-4042-4909-08df1d582721
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF00000065.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5879

dwc3-xilinx does not release what it acquires: system suspend exits the
USB3 PHY without powering it off, the ZynqMP init error paths leave the
core resets deasserted, and neither probe failure nor remove undoes the
reset and PHY state at all.  These three patches fix each in turn.

Changes in v3:
The usb_resets_released flag and the pltfm_exit pointer are gone.  The
teardown is now a devm_add_action_or_reset() action, guarded on usb3-phy
so it only undoes the reset cycle init performed, and invoked explicitly
before the clocks are gated on both the probe error path and remove, so
.shutdown gets it too.

Changes in v2:
Split out of a five patch series so the fixes can be sent and backported
on their own, and reordered ahead of the platform-data cleanups.  Patch
3 was reworked so it no longer depends on that cleanup, and all three
are tagged for stable.

All three are tagged for stable.
Tested on ZCU102: unbind and rebind cycle cleanly with the device
re-enumerating at SuperSpeed, and reboot is clean.

Link to v1:
https://lore.kernel.org/all/20260810174713.2325292-1-radhey.shyam.pandey@amd.com/
Link to v2:
https://lore.kernel.org/all/20260922182125.11067-1-radhey.shyam.pandey@amd.com/

Radhey Shyam Pandey (3):
  usb: dwc3: xilinx: fix system suspend and resume PHY handling
  usb: dwc3: xilinx: re-assert resets on ZynqMP init error paths
  usb: dwc3: xilinx: unwind ZynqMP platform init on probe failure and
    remove

 drivers/usb/dwc3/dwc3-xilinx.c | 123 +++++++++++++++++++++++++++------
 1 file changed, 100 insertions(+), 23 deletions(-)


base-commit: abc36cbda29d8f19cf3a580cd86ca9e865186a41
-- 
2.44.4

