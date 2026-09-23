Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010061.outbound.protection.outlook.com [52.101.56.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B058B449ED6;
	Wed, 23 Sep 2026 11:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162433; cv=fail; b=OglzqaEPd314uR60hpumpiLfI/5XH3w7913jXHbEMPVvHb9TV1tftrdjx3qYF3nnHzU3fa6kh/+N9/Wn+IAcjiGXeltK2/jtKaochZQ3kWwmz2MW2HynPYZPIDLg2gIK6U9Aswah80Gnxf2KMGNn2D3r90nt9kdKQjLmdIIveL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162433; c=relaxed/simple;
	bh=H6xzcoYbfIL6X5LrqWJ2oZvqbXl4RFtntcTCHh5bFBs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uAzDaIuA3LbLe7mcI+yO9w91IQvl3eXSc7xWJlKyzspOuy6L78slg845tQT86+fP7nzChsuIdkMo83pS0MFDZMFXspGc/UJH2ivv24zNguq2ayy2s11XBj18knm+mKwJvstHl5iUyHD8VOe3rRa3qYjSuDUWfM0jat1lNswfyxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BsuHFxDR; arc=fail smtp.client-ip=52.101.56.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BsuHFxDR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzZwrcjpoF/Hn96KYnWg6OkK7y02VOwL4xXHXjnOtgAzQ+jdY264AU0531RMqCAI/EeiQ0RrAouvJuTG+LXHdtp4kUzpDGP19Gd2+L6iQZCSaj7o0KljZ3Oj3cn4H4fuaEsSeaGT0F/D+txC7WXLEelWnojY7gcm0uXjFq4k27+nZn3qO6pzgD38fRX3CZ3lgYQUrXKy5eM4jqFzHoiSGaWh5UTNVcGvnW3o6p8KIFmXeMtqYBwmpg1i2a/6pLrWkHYNqiyC8LaVpDL7t2z3lDAOGFkHcMZb5az5Hb+Exomc+EecyMB5YaDdBTiB0UO93sJTmnkjubvIV0Q4eGoehA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6enbWSkhgXZ7JP4RO+kyuvVz/QWsfPC+QLqvfkCd5A=;
 b=IgjFBD4BaKa0ubps9nvBEKyCOb9U5MqiCuGFblKMZp+7x/hR91fQbN6D+l/FJDsxr0LkBYwUPjWMlbcc2IJkDNmODlppkYPpIYzKSTJgaiZZ4I538KykhsaZto3a8TM1kNU8th+bQAkTLGP96lfPyrldoFPmgUJ9omk8RXdY2FlRaVM+G9EPUWDUzuZfM/mDARX4SfIk3MvCC0Km7uQBmpkWCvSDAo7vEHLnABlN128cFM6PYAs5DtRmLgm+1lZV/ekzwAlmH6PIrDcy0CoqGhENPjau+0xbb1kpVvbRUYQz7BEw6B0Hy98haPBszFBq/2SGGxngFPACz/YEQQxLYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6enbWSkhgXZ7JP4RO+kyuvVz/QWsfPC+QLqvfkCd5A=;
 b=BsuHFxDR8Af05HCSHUt3VB9hnbozCJg9dkXQtXOvZBWhORRExHW4RHQgn7TikgwVh6TOlJ5vSgoYJ3PmXEoLFhbFZ0nsGS+FzKNTQbrsWCBNEjyM110xcHw7UKRAVIvRUaTtTeRNLYc2TvKgNABvKsvCByxDJYNDxtaoOeVxWSI=
Received: from BN0PR04CA0096.namprd04.prod.outlook.com (2603:10b6:408:ec::11)
 by DM6PR12MB4451.namprd12.prod.outlook.com (2603:10b6:5:2ab::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 11:20:26 +0000
Received: from BN6PEPF00000073.namprd03.prod.outlook.com
 (2603:10b6:408:ec:cafe::38) by BN0PR04CA0096.outlook.office365.com
 (2603:10b6:408:ec::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 11:20:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN6PEPF00000073.mail.protection.outlook.com (10.167.248.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 11:20:26 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 23 Sep
 2026 06:20:23 -0500
From: Vishal Badole <Vishal.Badole@amd.com>
To: <bp@alien8.de>, <yazen.ghannam@amd.com>, <tony.luck@intel.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Vishal Badole <Vishal.Badole@amd.com>
Subject: [PATCH Intenal 1/2] EDAC/amd64: Add support for AMD family 1Ah models 80h-8Fh
Date: Wed, 23 Sep 2026 16:50:02 +0530
Message-ID: <20260923112003.3677719-2-Vishal.Badole@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923112003.3677719-1-Vishal.Badole@amd.com>
References: <20260923112003.3677719-1-Vishal.Badole@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000073:EE_|DM6PR12MB4451:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c10d04-7a17-4ae4-7602-08df1964ab23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|23010399003|22082099003|18002099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	HyZHXyq5fwIVtCD1sENxIv99ta3BdKWiio7usK6wpCi66tDuV5fubEo9F0fDdBOhXZes0UfCmV5/5UmyfVv0rNFJaBFeJvkfsLww/AWYGBkIjZWLIjS+jnUNJNULhbDkKS02xaXA5AUr1JaSg3+UhSY1ix8pwwqJwGQ/efEj01aaMw+0srtrqqUstyVaxYu87k5EednT8ylzWYAxmOY2cza4ZTdXjeTI5APOTISEQxe87O5zkfb+qTzQa7oDha4VaY3h083ZeiGrT8EcOoAYZfb+UUL9tuFYce2Xg/63OGIIs/xhsGxQS/7qHZ69idSMTSxshAYOlalhKfUz8QqSSojd8hiLcByZ9igMMf4UWwXcLXn2M3bfjX6oUxuGe70NPhxBQGg0VLxdcJUSRF9Jy/Cg9rXNC7pM2U77z46ARhp/e4ucxkATe3vyXF0N7RFIPbBoLfA6s0TXW6DUbDA+hRC0rvrrQLRtLEOr1qjwlo+KRYVOOvsMEnbTtXBRS0OzNwwP54rh2jx3QDy3AlUbsqZOLM5F+m5SA2ZSayzqPFZux4bDhacJOgRjH952AV/Q+KwGKGWjm1uSOZuRGXELyJ+hTbPzFdnAV5QYRpUY80mWJu94afzLfj1Vw4R1Nbc/3XtZjD9kOoRYRd0e8oYSgfwUc28Lgb1k0Jj6ChZLGNCaiZxXM1yxJIksPaqV8+zm7+Q4QUZKg4nzx4+IpwTTNA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LLojzfaxakvcvVpdOrMvVBIAkarjdNWya9ZHmbyXmU+p1MZPBSW6ocOyRDAcau/BlDIQVWHTz6zA2HX2Jw6aNKQqDywv+ruH0dCMJlzQ5sAW39XtRiuoOiJeodElF37atbT/3TZNqjnNPbBKSvke6ZRu17GkqErkFLiLxhlRRrIYFelWmsba+Zw7wjpyqgt0oB7EYQxo5UPE1dJ0/goFbLwL9bO31qztCOOPB1uq6e9BaeJOK+Db3g3K0jh45fY8A2RXFzZt1/u6Ulf0X+9uYF2RKe8cO2O5Ya7tCcNwYIkQQ3qhs+vPeWgDEuqXCQmpx63mDgZ5UGPiSsOY9ukxl3FIRBZhzPXV3S1fuiiMev9Rpvj5ibE5FWNubtq5faok6p63sEyo49kvsiuI6tWXsgcf3yjht7tyUVeX8DAAN6v+zPQfnsOt1ryLIidiMNSD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 11:20:26.8124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c10d04-7a17-4ae4-7602-08df1964ab23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000073.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4451

Add support for family 1Ah-based models 80h-8Fh.

Signed-off-by: Vishal Badole <Vishal.Badole@amd.com>
---
 drivers/edac/amd64_edac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index c6aa69dbd9fb..ff0ebc8e15f6 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -3900,6 +3900,10 @@ static int per_family_init(struct amd64_pvt *pvt)
 			pvt->max_mcs            = 16;
 			pvt->flags.zn_regs_v2   = 1;
 			break;
+		case 0x80 ... 0x8f:
+			pvt->max_mcs            = 2;
+			pvt->flags.zn_regs_v2   = 1;
+			break;
 		case 0x90 ... 0x9f:
 		case 0xa0 ... 0xaf:
 			pvt->max_mcs            = 8;
-- 
2.34.1

