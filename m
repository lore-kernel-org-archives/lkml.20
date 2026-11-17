Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794902666;
	b=DaOqy31UwAoAXVY802eBX35DIN2Efpkbb/8+JOIvhh6O4OsAH+iVMBZOCyaknjnjUYsu
	 mhoA3j853b2x7mwY09XspcQi3J9JrxukKRG+OmyKOUcqssxnruKZKBQr5OuxtOgrJSyob
	 qrkiPxhhHw2ipTgwNSyaoCYdp81eytRZr703QJIEpYCNNA8yi1tgjilRtrlGNm8JQuLiB
	 xT9OiJoSdxtXt7n2dsMa6R5FursD+8xlOmu6IK2CtAMf1ryNFyhlgsgA53n2vy/FOE+M2
	 D83bD4UZohJic/XqqXXeYLFWYDtB7D7ma2QZ2liLOw5XULABgucBx5VTlhegiC2ClMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902666;
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
	bh=ntog7JuFNcGJENRm7gC8I4naNEJ9p8oHRGVBpFI2t1g=;
	b=iYCdYn634vDCh43CJY9DCC89/+dZbIA1QDt982OqqqIW8PmKIx4e47PU5dooW4IsiTT7
	 CBLh9/byyM6C+uOLHpMbWcjKnrPrfBw/+NETrgWTQSm/agyp0uuumMkwvNmoezDJ8CIxX
	 QC0RZw8IoOy2Hk2ejo3xUnUOENXSApj2aUoaJfaO/FNIGH+B9BfIwF0EJFdk0kji6K4Wk
	 CI3/E5kwWab1t0BES8NzYdIt72zwKrGzNNPiG1LzK8JNzEc2inwjnFzX0/Wvy4L1tjrba
	 MEP5AUOrhZMpIUekr4nNzZ+GpB+QXAP3jCJay+OJUbcQAzz6vI9RQnMDunJZ0nL6qKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uiNjBofO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.62
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011062.outbound.protection.outlook.com [52.101.57.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629FC606A332;
	Tue, 17 Nov 2026 08:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 629FC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uiNjBofO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dE1b7Zt5Z1tFXPdDrHFxZFKfDPIpOOBAlZnkglbDAfw3cmjKkqsxURTK7KiLsb64pHtE2qD4Jah5ltV4TL4SZ2/mlW3m0i0cdfR5FTMe22BQKvjxjRdk79NSzx4C0BXTRGZ++c9Uvyg2a15htFcCJOfMOz9nzVpoM84JIq25111K9ZCUZYVO5JPIuFd1Zi3NalyKLp142Uqg2+UtAJXd10/gNyD407Kmas8CLh9L1wq7DTYRaSl4SDuP6CDv5pnZZlM74CQ2MEiBiDaKf7iDeGVR+VfMn8JJ1On9OBqtHENK7SjrSUgTKZkzP0kKRsv1yiXwf14bAorZuPw51ti63w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntog7JuFNcGJENRm7gC8I4naNEJ9p8oHRGVBpFI2t1g=;
 b=j2onsbhIov4YRAsDxypA2KPzI0KxNC704qY8EelwBJ3AMU/sJcFWSJ7094kiO11+jmBwMIF4FQoXNYxltR6ksNNppOOqAWLmio93mcgg/8IEXB/OG4mJuhibi4TkDhkbjklMNmR4e7RooP6oiK9PJTl3fCZiVYWn2f5GZCZlBzTW9ATqYu8iJgDDXwiDQpgf+INKhXPlf8wJQxYh2pn6HxUVkYBzjlJWk5uUG0buDLuNhyO+iHHg4a9+EeN/xulk22TIK68KDKnJX/mStBv8N1j/qR2m5ueQU0BjYYnMQDDJoQsxO2GvzfqhapRneRXFLJA9VYREARuBcE3kyUEVJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntog7JuFNcGJENRm7gC8I4naNEJ9p8oHRGVBpFI2t1g=;
 b=uiNjBofObgjKb4ZBFH4nus91LL1f1gLxLsXF5qktrbLBE+IQ3vkCXHMDNguhGDxGBk3/tV5jGLyNdzdl3pdYRJUVYoa4pfupMRrp04q7xLqONVmB9nBGLWWKSWJg+oz+FZjXCOHVqIoDccH76sZl5+2mFSC7kbLaAd78guuMMU0=
Received: from BN9PR03CA0306.namprd03.prod.outlook.com (2603:10b6:408:112::11)
 by LV0PR12MB008041.namprd12.prod.outlook.com (2603:10b6:408:3f0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 08:04:23 +0000
Received: from BN2PEPF0000A98F.namprd04.prod.outlook.com
 (2603:10b6:408:112:cafe::38) by BN9PR03CA0306.outlook.office365.com
 (2603:10b6:408:112::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Tue,
 17 Nov 2026 08:04:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000A98F.mail.protection.outlook.com (10.167.248.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 08:04:23 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 02:04:23 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 02:04:19 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v2 06/11] soundwire: amd: add ACP7B/7E/7F clock-stop support
Date: Tue, 17 Nov 2026 13:31:45 +0530
Message-ID: <20261117080239.918428-7-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117080239.918428-1-Vijendar.Mukunda@amd.com>
References: <20261117080239.918428-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A98F:EE_|LV0PR12MB008041:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ea6514e-3926-4ba3-71cb-08df4481646d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|82310400026|10067099003|11063799006|56012099006|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FOyfcODqDwa+oFe4lJPq6Ss/vmO8n1/4u8t5v8FUX2sAw6yDlFahHWasrrDCTZZlnfJ1U2JvxKYpbGjj2OtE5FBR9LTn4sL5GYck2cRqPjoSZ2jDIIkYv3XISj/3s/su+nWT8joj4eZ7NPjo1VqVOETUl419aFgECAadXDDqX/rn4tMHhy2WGECy2t44HOsGxUVDxTQTBdByZb650cv7vfL7G5eeJOi2JfmBFPJtLJQcijHLPbrVEO3uhNaX8PNJxWL045rLYEk9z6Qz8wGVex5Q14XFLucWXe4kEon4zfp87LuJ5bhCcrYKBLpVcnasGrxAw/Y8ePTK5+JFJ30Tm8SrrCxrIMdgtZ5LhqD6m7/symb15uwC+PT/eGbOJR3Io7pIEdgidzYZTflVCRp/07ylzdi4vouGyTYjFS2z0VuFY+3PbHyCIR72thDih+Sq1aSkFCHcv9AlKAaOZDLnYruHrZA6YOSxl+l7xir9d1e40wvdPnYWWYndtPWEsBEBgg/7JWGvFVvnvjcNDtTnPyK5O5YauqxIxlisOrdUHcNLecwJJ+sPVTlQZo7qQnuU/41FuSOmc2C0vd7hchl9Q64NaXlczGjk24X6VmcNRyxGwRo9y7i1mZyGzzwtZmPAZHAueof0NZDAU/oGluRh+wDrW9MFcpJwRWJNKpN9kFmoac4Degytn0KpQAwydQkpanik0J2ykvrqkSx5qF5how==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(10067099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EsNvvOMaLsVhqYN1KpqOy4R8ThRHJ3ZvWCB1k7C4D58P1o5WuAYyDhsTs/UFe8OsHAkwpyZzMD9LKT+rzLejfdH1MzKWA1cJaX5FUbkCHURJu8Lecbxg0Gpxe4mmKAh9NVNxGUHAQt/P8J3nuvZEPVwxyq818t+cXaI9DUhnHHVnUck7ZP07B/yXDD5XfpmDMTuuNRNzIzZznlHja5hOR/yO53N8UfsHBMuIfX14yXw78jNmOKmedJuyQ8RyjNKJTSoTSln3kmICkWzRQX/u3yUi0NIVmo/kbInIIMyOAqaulkHLcVEpdEXsGwDuaFkEsUnrq6VhnYcVlqP+jBLlS3roioqz0BTaew+I3/9PnnfNzD9Cutl3XDT7olDup92W/Fsbf3e2/bqJVm1zlXL8ySATuTqrPyVhLxC6NJM4cxcF1Lbcu4YGsluWlfU3KhfV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:04:23.5871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea6514e-3926-4ba3-71cb-08df4481646d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A98F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB008041

Extend amd_sdw_clock_stop() to handle ACP7B/7E/7F revisions.

Set clk_resume_ctrl to ACP7X_SW_CLK_RESUME_CTRL for the ACP7x
clock-stop sequence. For wake enable, ACP7B/7E/7F use a single
shared ACP7X_SW_WAKE_EN register with one bit per manager instance,
unlike older revisions which have dedicated per-instance registers.
Perform a read-modify-write under acp_sdw_lock to safely set the
instance bit without racing against other manager instances.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager_common.c | 32 +++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/amd_manager_common.c b/drivers/soundwire/amd_manager_common.c
index 65eb17669d54..3589c4c33d4a 100644
--- a/drivers/soundwire/amd_manager_common.c
+++ b/drivers/soundwire/amd_manager_common.c
@@ -552,7 +552,7 @@ int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
  */
 int amd_sdw_clock_stop(struct amd_sdw_manager *amd_manager)
 {
-	u32 clk_resume_ctrl, val;
+	u32 clk_resume_ctrl, val, wake_en;
 	int ret;
 
 	ret = sdw_bus_prep_clk_stop(&amd_manager->bus);
@@ -573,6 +573,11 @@ int amd_sdw_clock_stop(struct amd_sdw_manager *amd_manager)
 	case ACP72_PCI_REV_ID:
 		clk_resume_ctrl = ACP_SW_CLK_RESUME_CTRL;
 		break;
+	case ACP7B_PCI_REV_ID:
+	case ACP7E_PCI_REV_ID:
+	case ACP7F_PCI_REV_ID:
+		clk_resume_ctrl = ACP7X_SW_CLK_RESUME_CTRL;
+		break;
 	default:
 		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
 		return -EINVAL;
@@ -587,8 +592,29 @@ int amd_sdw_clock_stop(struct amd_sdw_manager *amd_manager)
 	}
 
 	amd_manager->clk_stopped = true;
-	if (amd_manager->wake_en_mask)
-		writel(0x01, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
+	if (amd_manager->wake_en_mask) {
+		switch (amd_manager->acp_rev) {
+		case ACP63_PCI_REV_ID:
+		case ACP70_PCI_REV_ID:
+		case ACP71_PCI_REV_ID:
+		case ACP72_PCI_REV_ID:
+			writel(0x01, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
+			break;
+		case ACP7B_PCI_REV_ID:
+		case ACP7E_PCI_REV_ID:
+		case ACP7F_PCI_REV_ID:
+			mutex_lock(amd_manager->acp_sdw_lock);
+			wake_en = readl(amd_manager->acp_mmio + ACP7X_SW_WAKE_EN);
+			wake_en |= BIT(amd_manager->instance);
+			writel(wake_en, amd_manager->acp_mmio + ACP7X_SW_WAKE_EN);
+			mutex_unlock(amd_manager->acp_sdw_lock);
+			break;
+		default:
+			dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n",
+				amd_manager->acp_rev);
+			return -EINVAL;
+		}
+	}
 
 	dev_dbg(amd_manager->dev, "SDW%x clock stop successful\n", amd_manager->instance);
 	return 0;
-- 
2.53.0

