Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793729266;
	b=l4Dy60x1iNA7WJqviHp9TGj5JyBUSlZcuyPfFekranscyIDt01FBSwgn5nS2yUTNX0pv
	 wWzglemrpx4WwgBn07pJGdiQWy5P8jCz6Xx27/7TxIYYxvk7GkSKePzHgRjuGJ7+i9u4e
	 gnmSioU/PIv3t2L9p8ZijfYK2LhPo2IpI2xlT0KQBCZVmagFer4ExW/zdNJlQl3F3/0c5
	 Ey52H7VHB+9W/4ROkkYSJR+hZ1rpwaP3pGK6FCbdYnJp9gI2dDpip2C3P1BCOH3f+/7Nl
	 bQS9JrGtG22HXRK9F90aEq3g/n0X4LPcgUIEd2f1OK/Hm665JxcxXu58SzAbG3fVvxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729266;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-NV-OnPremToCloud:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=NYP5jbcaEJiux2ypCpi66jxiDzQZVmQ5nEWq1djwVck=;
	b=QXqLAmGqLCo6Gz3W+fcH1O9j/xrnkPJzRghxPJg7BUGanfHKMm3rkL/epUyWyMp4/Nvf
	 w61664cfwvb8YiwZIrgYsk5QwqfdQG4VJR9FeQ7zYhwIiLxVZNV4g23gX0/iiHCb69cIp
	 RPdfvULtoUcveWhIMrNtLFAMjWU59gYrJ7g3wQwz7CAmtPmC0M84XKK0jE5Ij+ihc2/Lk
	 jT27RQ6pjSJFOa72DN/WEpfyi9LiZsRbaCf3KAQL0DH4sT9ZVR10kjFh8SDK65wwfb2L5
	 lB7V/7s7SfaY78dU+OYUTnj1WE1ZciksqYtBmTxI/2+5WUQKFl/s3KSHfW0098xVNnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=othFpncC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.47
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012047.outbound.protection.outlook.com [52.101.48.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44290606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44290606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=othFpncC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhrhuEdvCLUDq2jsQUW9KnFQ7rMn6t7+bnjfa/OvTQ6REYPe65iQ58KiWOqfELy0aNVRgXYtLpH0oPRuBakKtVWVdHwonoM1GrJOQ79jrPew6cyhoj7ZYdPhoO+PhIEDNg97H8r9Gz1o541puoSIZ2wbUHy56t4qyONhdH3KcfX9m/zfGhdvWPV1ExEoPSG7OeeasfrY8MPF1t9BXyD1QjEvSOuNeKMLCBjx53KRWD70dsqllktHkyGz1DzfT85s/aRfAh5f5uJWX/dxHsImqs+ohhsYE2e9JY+vm52DnySm64+s1DRoZP2N6t5x6NNmjIS/kLF6KnI4NfVrHdV5Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYP5jbcaEJiux2ypCpi66jxiDzQZVmQ5nEWq1djwVck=;
 b=JgK/N+d0p4j0FB75EkJXOkzaYVVUn1MNrKJpl13sg81+mY567xqzSN+YI8KohbuFyn51Pm4pml2+ukN5ztHCsFCrCioi/62UgHlPkrHxuO9HpXxqnLzI+lekXiat266o0khDuT15LBG2KkBy/aijXklch4ubKjRCz1qPxuWpmjk8rL/vG16qenW0KsJ6WxX9KhopHrmd3AHZL5tCPqc43sa675gj1AJqclG0nJy8/VC5pqzEwRmhvr819jNbEPwif3nWnXNG35/iyKYYZxHlJnc0J6P20Z6NqVUFXLFtVFyOBvesXZjNzkK/mPzIxXS/6Db66F5T+01ShzV8iE1xXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYP5jbcaEJiux2ypCpi66jxiDzQZVmQ5nEWq1djwVck=;
 b=othFpncCFQkXnDISW67dfjeDGM1L+BjH+ZjuwRCyQziPah8/Ad3rlVDki8Q8CBoK+WEH2CqR7jWrU2SBXXq+LrZpxfbrqKz0WirqawtawAETNTHvOwPoZ5yqm+4m+D9v3wRZnJdcB5Z0arkmvmrRx8xI08rrYa7er88Bt4UnCkGX70SVUd9/Lqe++6nl34RBwvL4OMZn7UXiWTYRkYg7ErmIqPeSfFaTteO0VD1WPe+g7FAKxy5AXwQtlcjWFmO/ytNq6lrYIJbImA6zVC61t1yA9g42ynN2welw5jjuz/WyPlEwYAgSp4KUteTwgXmRf5x2ol0+qCFW4FjGPRd97w==
Received: from SJ0PR05CA0019.namprd05.prod.outlook.com (2603:10b6:a03:33b::24)
 by DM4PR12MB7694.namprd12.prod.outlook.com (2603:10b6:8:102::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 18:07:40 +0000
Received: from CO1PEPF00018868.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::2f) by SJ0PR05CA0019.outlook.office365.com
 (2603:10b6:a03:33b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 18:07:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00018868.mail.protection.outlook.com (10.167.249.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 18:07:39 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 3 Nov
 2026 10:07:12 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 3 Nov
 2026 10:07:12 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Tue, 3 Nov 2026 10:07:11 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <joro@8bytes.org>, Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Jean-Philippe Brucker <jpb@kernel.org>, Yi Liu <yi.l.liu@intel.com>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/5] iommu: Unpublish the attach handle before the PASID detach callback
Date: Tue, 3 Nov 2026 10:07:01 -0800
Message-ID: <30a392ea6085cd948b90f38437cb0afc41010a7e.1793729087.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793729087.git.nicolinc@nvidia.com>
References: <cover.1793729087.git.nicolinc@nvidia.com>
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
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00018868:EE_|DM4PR12MB7694:EE_
X-MS-Office365-Filtering-Correlation-Id: bc25be60-c9c5-465c-4267-08df39d5591f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|260925021911599003|260925022911599003|18002099003|22082099003|260925021311599003|261102123227099003|261102130727099003|56012099006|10067099003|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261021135927099003|11063799006|261026121527099003|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	3STNOrvR9s7Hw6NhSCc4FgyUkrsHeBTqL+QJHMekjZTqn7MlNjXLYSnfXpQ6kTVhnn1Ze1WafJR2QNxigtSbCVB4rPs6/9hMjt88Fhi4GmfCM3uN6PuHT8rxCS13/oG1flg9t3b41THSM7Nb60ah9B8X9kNQThYeDSEuxt6mHLMdYJHJsVfZBVoh6qY8L+flNl+npe5Gail9VLF8iLTG+yZexlDTmvJuF2jxOVAAyxjdwlmdZ4+mydW63JbtNZp8fBvq4lkhzIJUj5jkaYzx4iyEaj5zsE0Wp19wISaPuDCTjBap7RolbgheEQx4Q0cKBgZcV1ofJG9OcVLtzRor3ezAAF995l/KioACrV2m/JtU8bBuCejQ1W7zyggQTAIENz+I4MfB7sqnGEoVCb3rVxjDYmwimadf3kdAkrMAQW/tcu1UWtcNPnQJuOPtJwx7efQTN/eVPTY4B3m1YOaxKpz9ZK62MiJ2c5zNxT4+4hMxp2PDMnTtyLSdcCZBxQut989dj2QZNzkD00iTwIKrcxwzJ0aiJxRvFGZ9PqbT00O8uXMR3aGjmE38NdVgS6CTa+/lYgxsxo+26WFGFPqLqWrzuilKA2FPEW31sYZsbqPkbRmYVdlWmk5L30icZy15fAr4IKkMkRnI15wH8tQzmUpd4CNNEJw6tsN+s6Qy6kwh2nBYQV9cP1UHSflVQ3i1RzTJ41ljuwaZlDy274f/vA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(260925021911599003)(260925022911599003)(18002099003)(22082099003)(260925021311599003)(261102123227099003)(261102130727099003)(56012099006)(10067099003)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261021135927099003)(11063799006)(261026121527099003)(261028144727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bRAGfbfgGgTs8rOkvIqJEUZuM3KDTXXEOgcU+L24bKdM9OI9PoXVDU/8lvToYIWTA5VL4ChIwJucpqjTSxR617QjprnbAvXLRqBFfqmLu0zspY/9N97w140i5s2u9nlKvdIgyicN9ENf65Adr9MNXL08pD7/bkx/Nw9UFizdtit9Y86DwDZ4MzhB8BmS6ERHIse8gazccbcm4IjFtAu6pLEAbcMS4CFeQiA2BDYk/nOHQwW8g/G6HQMsG+TD5si5J1mk90voUdTHU3eKxYciXBQmk4ltC86/zYx/j0FQtxRojiYQ0/rszjIxtBmla8swfP1btAVmUIG98m/0FSwnn7NxpWaA54WKtPJF1UZnSzsYkHsGlSnYJe2qkHbYjzAubXZCFE15fG0ec5BBF9sVuMF1gsLxuYPYnIHiMFHGl2NnauBA0j8MLQ2UHn8iGnRY
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 18:07:39.4531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc25be60-c9c5-465c-4267-08df39d5591f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00018868.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7694

iommu_detach_device_pasid() erases the group->pasid_array entry only once
__iommu_remove_group_pasid() has returned, so the detaching handle stays
visible to iommu_attach_handle_get() for the whole of that callback, and
the caller frees it as soon as the detach returns.

Erase the entry ahead of the callback, for the same reason the group path
does: a fault raised in the meantime must not resolve to a domain that is
on its way out.

Fixes: 16603704559c ("iommu: Add attach/detach_dev_pasid iommu interfaces")
Cc: stable@vger.kernel.org
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Yi Liu <yi.l.liu@intel.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 0f9d49a5c3fa2..aa50a8f6ef6f2 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -3818,8 +3818,12 @@ void iommu_detach_device_pasid(struct iommu_domain *domain, struct device *dev,
 	struct iommu_group *group = dev->iommu_group;
 
 	mutex_lock(&group->mutex);
-	__iommu_remove_group_pasid(group, pasid, domain);
+	/*
+	 * Unpublish the handle first, so it would not resolve to the detaching
+	 * domain once the driver is detaching it.
+	 */
 	xa_erase(&group->pasid_array, pasid);
+	__iommu_remove_group_pasid(group, pasid, domain);
 	mutex_unlock(&group->mutex);
 }
 EXPORT_SYMBOL_GPL(iommu_detach_device_pasid);
-- 
2.43.0

