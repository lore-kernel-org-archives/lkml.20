Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011059.outbound.protection.outlook.com [52.101.52.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AF43D9027
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790704486; cv=fail; b=ET2G3ZIyKjPOXwaDVmIiq2O5wbFrbFNsupYH1/iqcY8ARemYKHot86oxy3HBnpY2Yu0HyKo174WhnQoN/mCYIMqUAbibU1I5+7UZXLD1pLhQi1Xb10NBnb7ge0Kb248UbRU1in9BSVteWAJPeOnprr8/3tlIbiKjGvWhwl0RFMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790704486; c=relaxed/simple;
	bh=uudSQ0ZycAuJUwzZ9DfJ8BGeVGY9UD2cFhZZWy79Lss=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DD0OjRGe4taYx6S7LzyCHj2ShjmIGNgGKal82Cl4eiJxzjvOoJAPuz/4T/5+c5otd53y0FrGVJqkopgQdRyct8F09q+v0+t5iPuTiIaQ+PJw7onIZ175lz7axcPw0/N12pxibXIYzj5C30nXkwCtZm0GomLhOlGElGpWEcKQiyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bXD6btEU; arc=fail smtp.client-ip=52.101.52.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bXD6btEU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gmy2JSahyvQLlu4gIl7YHKas1yVlMWcNp5QL//9CkvFVnYycufTfC/RguZvPL1hl7DKVqS8ifzZd8Dfuf8XHxQc5D6PS6PyL9+psFqSXU3EMmuKIO291nfDmg5PGB5CnNJ77XVmgdYg4K8ytIx4SldrDBfVTFr5yeEbbb3m10/XBWk88a/4Q7mkHpiJNAi0yqcl1nV6o+6Ob7D9mNoeMjqdpWs5h1RQNX0GBqsfNxXrqZZ5H6a6A0K9gz/NdHQKIO1vCu6QEkMMfZMLnWZPjQwLYf3wW0K8sXEX6QUeAl/QWOVw9kPWlaHE2EEyrnDOOPOJPsHu7oOQYqeUOaztw4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzKKXqzCbecwqs5Q1Mi2+2SNdFCR5OT5XfCdooXCGQU=;
 b=sE6WlqCSkxnHyUyABSDuXKMkl1O9OkUDHocxiqpXS6nodTJ3G9lVA6/SRyGLuM9w009bmQc0iYDgpvMnuCvSrlno+0t85VpEllDgWR9KifUbQj6cBRnlzYrqLvP9TFUY2jRB9sSx90bAMVaAgLzqGiL0IrzYsAabMSJWE7kCV8v21TvUfk3aNLJy4o7ybLDCK06cpo5VLUyYqrcyJJVSzt5NqDkZK8hdqI21tYcFcjRFQTv1uPCv2PdjUkfBjWcpLNLGK0z6hzfHkeTCKkSv+7qKmWHMrzB0qiCZTcC27XyzM2FY5iE+R/XQU6N/LCBOTBX+rpTRfeRr9UMlJ35nNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzKKXqzCbecwqs5Q1Mi2+2SNdFCR5OT5XfCdooXCGQU=;
 b=bXD6btEUSVNxoNze+MbpMbE0PdoO3Hrx4KaoZN5AtxdyJBKanQ/VkoWJF9Yy/pLWnnX4HOEiEfzimTF/LfYo4bowN8SyqHC4MJxOdLnvr+eLQVHUJ/0Uh7WjslKpwydkDvO6i63St3Qby+0pCmDtioPc+t1QLhH4PifyE7UgDwY=
Received: from SJ0PR03CA0116.namprd03.prod.outlook.com (2603:10b6:a03:333::31)
 by DS4PR12MB9609.namprd12.prod.outlook.com (2603:10b6:8:278::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 29 Sep
 2026 17:54:33 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::93) by SJ0PR03CA0116.outlook.office365.com
 (2603:10b6:a03:333::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 29
 Sep 2026 17:54:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 17:54:33 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 12:54:33 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 29 Sep 2026 12:54:32 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
	<dri-devel@lists.freedesktop.org>, <mario.limonciello@amd.com>,
	<karol.wachowski@linux.intel.com>, <max.zhen@amd.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
	<sonal.santan@amd.com>
Subject: [PATCH V1] accel/amdxdna: Add support for AIE2 revision 9
Date: Tue, 29 Sep 2026 10:54:28 -0700
Message-ID: <20260929175428.925657-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|DS4PR12MB9609:EE_
X-MS-Office365-Filtering-Correlation-Id: fbd42375-a069-4541-d794-08df1e52b844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	CoOoEHAwoviub/ONtV2dwigOAHKFBHCYOjmnlZ4SIFLEugCjhmZMEjiXi9/3HoR7Fjyix4vmRzCAry7XVE1RofDQ9BeDPZ6PfCUfeLAWYdIaJO6jlGdaCzlj96YzVZ4ctng8blVqycyrSo8OUCUS0WwANcJVqFq0HaOGIvHMWzAUkHddvjaEQXFbR5Y1CVybo58TyHkcSCDigNY0rISAko0gbobikBtsTi8oaEyvQ/G1YDNnjaXjhg9/GbCysXepK4DDcVyVZmp9QZYq0DpDydj8JW3DOPhqO2SdxKtJAA+IzicjA2gdr290CFT5dp72/SrkeC1qwrhOySgKqYc+1Wi3un+nj5dg/LQlbmbPcRVpFqNH4w5Ewfu1bzIwaeQR+IRag63wd9odQ3eGQ34j1HwTowd/gRsHOeNL+Omy2iSQpOuust041LRX0DeYMQPTmNT6jG45G56L1U1OihAZl7Vvvp4G7rQ6bYzizcRM/BSyw6wE2iZxzdRvLkBvKFR6cgnOgVSgoZgJ36l0oYOdXKMkjxFl2f0Z7cJc3IrHwdJAGcxkNDH1C6x0eN9wZZehQgKtWz+mMu2JVCDdoudWymBcKUoHnvzniTnc8/FOsAn5upQ4b6gKvtzoz0gPdtvLcCYesrI6u3CWHLIg7xpyQf21l/YSqDlXTR/tO7yBRwSAtHw4suCG9rhHiJWbmVnXTTxKMjkVY/HH7kxJI97p2Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jxwc3HzClq88G+lghyZufQgmrM92XIrRjwhhaKe5YfmNcV0laGITG8pjcj4x9vLg8MZiLuSR3IlulntYbWHj/Co9ExHxtzMM7W4e26xiRJndSnGJXWNBWIufWv4CrrXOfwvfz0Syczzb3D1yJJaA5LwN+LrepxP7XDPST0Mpy81cixBmkd4of0F4raEroJO0HeMGPCXO0uUNDVn4OwWMqbi2bHxJNQc5Iaw5E/IhypYqk5eJc63wGDXK7BT6mK6zqs5ZlIrHFPqdD2fGRpZIceVsVs9kSGrbP9iBqxVgu+IkuhhqhD6xbS+Qc/oJSKOeAThkVJ1eSB3MBRDgihe84Mkw4yvcaPbryS8432HKx5qA76DALs4YDHsJww+6iHfXBaKGD9mAVFd4axaGpEcK4Gp/ThoIPPjQ3h2XM+ivpQF855gH6PagptYCwIP+4mG5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 17:54:33.6522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd42375-a069-4541-d794-08df1e52b844
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9609

aie2_get_dev_revision() fails to recognize AIE2 revision 9 hardware.
Add AIE2_DEV_REVISION_GRGH to the list of supported AIE2 revisions.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_msg_priv.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h b/drivers/accel/amdxdna/aie2_msg_priv.h
index fd65a4236d49..8ed2b5701dcc 100644
--- a/drivers/accel/amdxdna/aie2_msg_priv.h
+++ b/drivers/accel/amdxdna/aie2_msg_priv.h
@@ -530,6 +530,7 @@ enum aie2_dev_revision {
 	AIE2_DEV_REVISION_GPT1,
 	AIE2_DEV_REVISION_GPT2,
 	AIE2_DEV_REVISION_GPT3,
+	AIE2_DEV_REVISION_GRGH,
 	AIE2_DEV_REVISION_UNKN,
 };
 
-- 
2.34.1

