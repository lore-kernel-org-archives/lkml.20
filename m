Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066598;
	b=tEnRnWwprfVM20WX0I/zbLbB3SdZpuSiMiTCRGgdNXAGEkvjPCOqZBvfTpO9nkHHzYXD
	 9F6gUVpiS5/auB3RlNTHmnB8HpdmAKmFTdtiWupGTxhAVBloil+XKwPvrCw7dV7p1mjKw
	 qk+iV2HHVPxmop/1bEfJPGNn3bq5MNUAdSSLi/3/RqkNiN3lTmz+CORwA/BmCcLSl3AeM
	 WtEgv2v4pOuoPsCJkBdzsiG/2j2U/zv3vRRWgkhGPhtfCpDuDrMLOxall4urTp7vmJIUS
	 9jazCGv/wSCWv4J9Mwsh6XOexn9aZwk+5/OxTLZLHKlnsIrXMkwB7R2y34/BfXusRTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066598;
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
	bh=6aArm3XjfORDX3stYLhuiK9qWqkQt1HdQmYNB2gM/2Y=;
	b=IkJQXgIxA4FvQkjdWb80hRW9BsMZi+aYzJ4RuQxCKxZlutL9Gt268X7nCz4KV4eA2tIE
	 Nr364RypM9+/ouu2/FTdgQRpZ0fT6Oo608Lpba0hg2ycsg2fn7YzejvNjTnZY33EbxQ9z
	 Ni7+GbKDJxBVKZHS528t2CH4qDQFUf+C/q8yqiIRgphTGPb7JKEDbfVuzf75yNCMwYzEI
	 FXxa8o79bMeObVzL/E7RK4D3ibg04TTDXVLG+EGzA0n5Fwo5rgLDf0lnH6UkOwWQlBoE8
	 eOk/XreG1wwQcgUOgAM/nGkKiMbu4KeGN5uK/B5RJr+OYZGCsZEL1kRX+A/xtDZvsqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="fQZm15K/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.4
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011004.outbound.protection.outlook.com [52.101.57.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B575606A958;
	Sat,  7 Nov 2026 15:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B575606A958
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fQZm15K/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cg+pE278cDdiM6CakAlrfjgZExnixBbcMKQZHbmL1ro09EYlkfnzrFYH717Aaq0jliiYiYnxwgaGUx7SPphg/2C0e/FPdU2XkVdRC6xdQ8lZNBUsNxgG8WKlS2p7sIu53jf4QlPTl+vvW7Y0Fc05PVGzhtttD7hHTiLnYpaa+mFvSJ1kTYwwF5UMeBLosNmCF6SgSp+NNyQo/DL2p84YwDc1YYl3zIdaYslMWCfu9JPmpcdN/vpNJktUU2TvmGRMIy7KK3trwsZ+JDEuGSItRIBwBn1yPLE9/Aq8pr1qZKsTk7CEOLsrjj2mPTGvAo165mlhV84EgzJrtjq1LG/NCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aArm3XjfORDX3stYLhuiK9qWqkQt1HdQmYNB2gM/2Y=;
 b=sNMpGTMx+bBDnGjYdjcORIjo4u1HG/l5gzYJzIaDXGzOCw7R2+5neg+/V4wPw6UWDcgR0VK1ebY8ca0WRS/dFC6e+nDam8upDIlJ68la+ity0DlsSko+vjOZrYYB3Ec58anY1Xvbpa6TwqxBUd2Kogd+HMBPhfYbtFtBZNRlgqzJ8H50h+xlI1Wjqrga67xWkpM8t3Cl8mQ8I8LmfV3s/Kw6Ezf4kbhKJeqfS2bvOplxTowMekuapcGcvnu2ZUEWSVEMbCca2VpgPTjPMMztQZF08l5yrgWmWVl8kw2a8Wa0gRmfwNn8zizcxoABN6I0VdvDyOo9Dx49gogkHdJmnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aArm3XjfORDX3stYLhuiK9qWqkQt1HdQmYNB2gM/2Y=;
 b=fQZm15K/toacwmgVUL4QiRyW6H4e5NgwkrSNBJ4f/aI71+QsfLPFscX2GR6MiJ8UpMhFh9PaoQLU5CuZjaIxMHXEXEwDKjhNCGXuTabqlhL6vECRxi5vgXBSwUiozsyYx+xymDZq0pNKEjxek4X6SjEW6X+XBUKhg6srL9eE6iU=
Received: from BN0PR03CA0027.namprd03.prod.outlook.com (2603:10b6:408:e6::32)
 by IA1PR12MB9032.namprd12.prod.outlook.com (2603:10b6:208:3f3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 15:49:54 +0000
Received: from BN6PEPF00000076.namprd03.prod.outlook.com
 (2603:10b6:408:e6:cafe::7) by BN0PR03CA0027.outlook.office365.com
 (2603:10b6:408:e6::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 15:49:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN6PEPF00000076.mail.protection.outlook.com (10.167.248.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 15:49:53 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:49:53 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:49:52 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 09:49:49 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <lee@kernel.org>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v5 25/25] soundwire: amd: fix shared-register RMW race in amd_sdw_host_wake_enable()
Date: Sat, 7 Nov 2026 21:15:34 +0530
Message-ID: <20261107154659.3358223-26-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN6PEPF00000076:EE_|IA1PR12MB9032:EE_
X-MS-Office365-Filtering-Correlation-Id: ad0d0c87-4f10-4d74-d597-08df3ce6c3dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|11063799006|261009223027099003|56012099006|261021121427099003|261102123227099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	OPahV3pnhjdPi3xn17nLaxBn4X8mEY6R7zsgBf+zA2PL8t6j+waH7VbJm4vGVlDU4eSC4E1qSjES28ZvEtWX3zGvplxMT3fgkB2tvC420GWfULj71ZsvxkpTotSpURusYxS0hR2OvLi9uuI/iHMiDt+rzxWNstXKVpOiHGdVOZHEhEkyhNGZy/mPMfemND32iiv5NyxwjF8MnOPiJLF7RvLGUTOxdMn3o9m1R89bnFqcz8wpvy/tcfB8iJOhL9F7EwR8+T6SHmZrAhDHTxTcsDZ6KA0ByGzjlT40UhjWsy4X58TXK1VPRjPlxmjQeObGUe1tGjJmu4i7uBXEm7XI8g2Gitehz/rgF8VpA5eGaVLuwj9ZE1r6VPF5Pdh3FGKrqBHu76RIE7FE49QmVO+nPD2fCa0RgLgK44WxkFM7x1LTq7iVt74J+Tsmucc68V5bE8omFBMiUBjvHnhk+xxSZBZhLtMoUEEEzz2Itan/S023II1ILCpyE11y7DxV5fPBYuOm7P0K26KOKAwXwVY3V5g7PviA4n83z/1MzdDtjUKExfW3tiE+uraTVtprbxatpOK8c6aqs+AD84UQoK23DpR+1fZBual9zDAsfd664P+v4Ps6zLXdwN4odBVXvu727KCDHs9Wf5BMIrQ6GwBOL2gwcCvCPcsF8sRlUmFc/3gci3PGqJfMTyHlDOM+yF+ID7qo7cIa5FjvKwOhwdl+Vg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(11063799006)(261009223027099003)(56012099006)(261021121427099003)(261102123227099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zci5gUlK0SCQ0BvQBaz1QiYURjX23RrKUY7ATI5ahlNantVerN7arCL5UvkLqrw0+2KGUzwviosNLBJdqY+2P8/GtGQdxI/IK6GtucTuN4Dro53UHEPtbCH+ows1ssg3cQcHoC8ib3u2C+lKAlxibdiAgYNj9AjRfbe8nlT076SOpZxA4v3RHFAFEvIbfwiJjheSr4wARSVm5eSE9phwjFEKI4SK5U2FtYDRlJOQ50vA8m0iljRpazXl+znAdKwDAsRfC+C6cJOkFa96qzcSKjgv9jLnB7l5nfIVQHQIotZle4LiYY2cbDziFeMXEGHj4wirmTsqaJvHW1wcKfbZz2Z6/MsRKmLZO1W2k/OGsX7C3ptcDS5hMtYX0RfLoHv2BKWzKrUPphuqZx/LH8z6VXyFRPoC0cPBG3/fmF/pcsAuT0p7zXt+uMy1Im1Btc2a
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:49:53.5710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0d0c87-4f10-4d74-d597-08df3ce6c3dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000076.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9032

ACP_EXTERNAL_INTR_CNTL(ACP_SDW1) holds host-wake interrupt bits for
both instances (BIT(22) for SDW0, BIT(23) for SDW1).
amd_sdw_host_wake_enable() performed a read-modify-write sequence on
this shared register without holding acp_sdw_lock, leaving it open to
a lost-update race when SDW0 and SDW1 execute concurrent PM transitions.

Acquire acp_sdw_lock around the read-modify-write sequence.

Fixes: 3df75289ddc2 ("soundwire: amd: add soundwire host wake interrupt enable/disable sequence")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 495f0607bb0b..2c52fd181e3c 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -320,12 +320,14 @@ static int amd_sdw_host_wake_enable(struct amd_sdw_manager *amd_manager, bool en
 		return -EINVAL;
 	}
 
+	mutex_lock(amd_manager->acp_sdw_lock);
 	intr_cntl1 = readl(amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(ACP_SDW1));
 	if (enable)
 		intr_cntl1 |= sdw_host_wake_irq_mask;
 	else
 		intr_cntl1 &= ~sdw_host_wake_irq_mask;
 	writel(intr_cntl1, amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(ACP_SDW1));
+	mutex_unlock(amd_manager->acp_sdw_lock);
 	return 0;
 }
 
-- 
2.53.0

