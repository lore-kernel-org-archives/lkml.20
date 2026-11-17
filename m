Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794899501;
	b=Cz80ZWbPd6AkSO1kLeNAXL183O+g7xtNHeZJMyulwChVlc4dCxNiD3KaVeiFpLjhUUqm
	 K0xyZgElkg90XFunPjCrdqbI887FkewMjc+KeNlHu67PZ6QUmRfoV0Q4jDOK409Wc+5tF
	 Epg7/DZs5GTPYfPQq26NSmU54XAp0S884S0T0mclGOmYsIpDSPo0gi/d/S7hcsbbPGMs2
	 1HHhcHKe3wcP5L2AaUNxkUxC5AX8oDXxtCjdItcOOrWnWEQxSt+wPlwiiig4KXs5C0L/w
	 a41jbTbobJM+C/uCMPNiuw+Wp8T8i7koLOLkqzLAFnlOn6mfzzqP/l3+IqidcYrRdcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899501;
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
	bh=XG0yPFSSt6cvDdmxWhUYyIBEyI7ztazvAOPu7hfT4hc=;
	b=t0SDdkSuEL2q86MdiNhkm5ykPPnT/R2ikua7KpcmQOsyPo3LyVvBccvb33eDeY+w3OFZ
	 lBEixRPNbOxKOoEMuIKBbcfUNH+XPHGY01LA8hRq3jUITi+ayzZq1resm+DnZ69lgBHD6
	 bt3O757iOasz303XhVMdknlDAZqWp2VjZhmvoDq9h7Pqg3H4OiLwpPdeeTMBXLz/dZcHZ
	 1vhe08zMBxloQbF6C1SNs+lXoGRYhQ+AoUce7qI1dwunD+2ZKoz4MX7+zAOglxtnTlMPU
	 XXBVwANxGVY4jRobo6YZfQ+ikAd031xxj+moOx1wPnnV24ysZ3QiZkLbUkPVDmNNVmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=i4Qd+O1J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.37
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013037.outbound.protection.outlook.com [40.93.196.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1776606A330;
	Tue, 17 Nov 2026 07:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1776606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=i4Qd+O1J
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4X2Xi5RPOiqdZhU5oUVVW/FQr7YQ6ejkoAZktFCttWPedf1elcVKH1mE3ZIfZ8rvYJ1SwY4bizm7EPW6P/7O8xT6uONGcuMRUCCgl82ZTvM/EkuZ36gQ5wdxeGtlYoYBMuM9AQlXku8gpuOvAIvREIbT6YyNw11xEBhq2FchQ+lkXczIOuaAzHG9iBAwZKlTbqld77T18FmJE1j4I5+OzHNTGTQ0go4CAc2K1ZhqRIdc/2HQgwEUS9JHdTkPVSlrfdnFS3FFd0IO7nXb0dnjHylzaGa99mgdJIlENoZrokbf2L+ddk4DBjnJJZDWeCXDm6gnxQvFStuD9EP5nSz1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XG0yPFSSt6cvDdmxWhUYyIBEyI7ztazvAOPu7hfT4hc=;
 b=jaL5yktvMz+Ew7vwgCRjj/YVG14qxYJAEKDEzBwPiaEF++EJcYD4Do3h7ZkmBvI7oZvlYa9RlB3iz+hE3Cv74Bdhx+KOW+Hp/o87kXxmXFJakyQhaXng3JtcSdNC7og93eGGIdasdVt+WMINskljhMenKEBYMyy/Imj8kk6UVJlM5p/gLcKn3OmIeqGUjXPi0slwM4PeQvp1iOjsNTXVDrTnlOWwmfegD7NkwfI/v2fkBlhui51lr0ll+Cwx3wLtpiR6Z8KSX6Eaf+JMHo9JZsqStrqLQAruFuTbQlREWW1V/JBL/7lcTvy5UJCAsxjJyxOsCiKTBF7mbdFCcp+b2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XG0yPFSSt6cvDdmxWhUYyIBEyI7ztazvAOPu7hfT4hc=;
 b=i4Qd+O1JdgjUS0/wNZGwAfrIYESFnLmHEaAyvwBnVBSTdLnYzDJK5d0kgNHNUH0LRjZSMPn7Fk5e4r014qoQy9Uzg/ZCezBy8J++7NV4en+9EzFjnEj+8JiE0sbQFqnJa5vi9iVKqHVr3AOaqnFgV5nRHn6gkhzfw5PDhoWneqI=
Received: from CH2PR04CA0026.namprd04.prod.outlook.com (2603:10b6:610:52::36)
 by DS0PR12MB9322.namprd12.prod.outlook.com (2603:10b6:8:1bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:11:37 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:52:cafe::18) by CH2PR04CA0026.outlook.office365.com
 (2603:10b6:610:52::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 07:11:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:11:36 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:11:36 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:11:32 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v6 18/23] soundwire: amd: drop amd_deinit_sdw_manager() in POWER_OFF suspend
Date: Tue, 17 Nov 2026 12:35:53 +0530
Message-ID: <20261117070906.803139-19-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|DS0PR12MB9322:EE_
X-MS-Office365-Filtering-Correlation-Id: c60d3c6b-fa78-416c-3ee3-08df447a04f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|22082099003|18002099003|6133799003|261009223027099003|56012099006|11063799006|261102123227099003|261021123027099003|261021121427099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	7KYMQCUZGsyFtXoeV6NghiR9+SQc2cX6K9wiA9wgEAIp+wx8OeFbjkiaIMZ/zMq/FYq4Z2zU/Taa2oVAhTahR+zg4uKPLb45rSElFkB5USoX9lSolM2HyCGQf6rnltV9hVGCeCL3mD31yLQXHyDUUGNN0HmaJ6PleExOSnpQz3DxaFi3SHu/poqka/MgWL4A2SWxUIzVpxpwI4VQNBH5WuRnIkkERAZWg4JE3C1aTfP9fL7bzHKtkgjhSt9i23kz44XHKpxdz9KK82UrpxXxnIw422O7mFR8lXZu0Pa5pP5ca9i+92cXR4PEe7SF/NZBzTj5R5C5gUGLUDxnWXEUCoEqVH4TvfGei+XmIxjvFnVsd4vva2jttM15f9pG8xEYtjGHvc5Li9G5jyZX6pwoemECzWai3gyWY6cuhPQ/bmRtYQJD3OBIvOjQsmn9v1IVv14yaJkjlh49t0Iwj5OES8oCzCFQXGRD81o4vX4Ga6nerWKMMnrCmXpwZwd2lvn6/PqfOkVn377DIIMITxpUnhkJgwKFMqspzbEf/tVBqH2fAZ8ktWURfYunf8IUIZV2WenVcsatZk7RGH2tdt0clbyA8hU5RyihDnFCf462ibq/O/Tz3gmv0VvIKYsq4SmWG/v6xbWOvslOSAF/viebLWFv5j0RP72vfGnNYLfl+NqEJAqIZyNqvyyq62Xh98ZgFI62jZIPEDcOc8ubdvmAkg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(22082099003)(18002099003)(6133799003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261021123027099003)(261021121427099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gAiwD4n0qn12EVh8fyYdmEg6Awm+5HQ9qcn7fesaDPLGJqekzKcHBMdtVUcmiz47Wvr8B3RjvGGqS477GUJG2+L91wm1ZelXNgqwyHaoRvgD6y3fpnLuQeWJ8lkpEmK+aMMU7YRSSHo0GEnVvusLGKqSOn7D4zHIVxiiyYVQ9mezqhHJycId3SJOa7Ijt2krTcclshu13sP9LrAmW3oKIwZyptBjiTEMq8xgS6VoOqu2S+MCIK0zmRKdM9olMvdjIOn0i5zlVB31PUf5URMPFBuYQ1gvahsvMYFtUdCbZPnH5SusVzzh0JUm56od3pc/rLjLSGqBglXYUm/qbgFRU62Wq/vJ2zrJ+bOzGVEFf2GQNI58lyQ/ojqq8NFCwfjZrfCMO11zwX3TbAL0cFcmbtbG8Euwe6LDJCLOIOHAhguSQI2eQyxArh05qom9OIgE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:11:36.9367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c60d3c6b-fa78-416c-3ee3-08df447a04f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9322

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
index 934a8f0f3298..3c5a9c7c6c4c 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -159,12 +159,6 @@ static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
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
@@ -1445,7 +1439,8 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		ret = amd_deinit_sdw_manager(amd_manager);
+		amd_disable_sdw_interrupts(amd_manager);
+		ret = amd_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
 		/* System suspend: tear down all pads */
@@ -1488,7 +1483,8 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
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

