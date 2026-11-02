Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793603134;
	b=GqxTNpvopaIlEnfWPCjFG9xDrTP0EPBXlgOej4+imGpMn5E3j02KKYTUh+TBb5sLmkcp
	 H/pjTKcHL8iOtuMyESmvd2Y+c0C5dp8rHVULSfHoV7O7TtkU4GFS1bwmG4yxpXq6eGssb
	 ZazBReJUwM4KnHBd53g3cFss/r1vswwcipyLj9IZTnTMrHWDIpfeeHJtSj3WgjBudGlti
	 zjYpBnHs7r6B0cb75CVzoFiJ3apqjdDpxdmagC4ZbvnrzlBHIlULJFz34tna8gVl3cKRd
	 mGYZYDpEofiVkPq6b+tpV2CWNcV9LsTRX3OSdufpwEFGnsq2STt8DpF1EdGrL+p9WeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603134;
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
	bh=tQUDmAAVkCzv1DHHgg1SqdVv9hBI2RXfXkKI00T/p2M=;
	b=viY1xsMSh+qULYMo04lxk13hXw9Ym8Apm/G/LiokAuc1P3CTc7jD9SnHJ2bMG4hozjfW
	 nyLWeZl6cF4lViK6Pa24L7UlMiZcv1N9cg60vAKB5oSyRfour5cSE1euoSQC9fdiXXgAf
	 TLC2QUdEU/s1MIK8UnAUe/wHXmqmsmURK3tHlE3mC72hVrGHRTkETdIw/vM5sWu7twbmH
	 7bJMatCw6snUe93U+r0c3Lfi7dH45bwsZYHGOhlv20hIBqbBOq2o6q6aeti4FfpNSEl3S
	 71/A+hPmTyg8sAER53CWxI3wLQsQmfspCrqetXJGS01J6iNARRf3lywubcyrfra2y9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QZpHV1DB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.28
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012028.outbound.protection.outlook.com [40.107.200.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF19606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EF19606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QZpHV1DB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVGqXcRchghia1doFu0y5VHmeraqsuCQ79NFoI4bG5yQzGDWcPnYYM8/i620hZzjtGBjnF261nPncIEcYBFif9vD8iDbNvuOrh2m6cQXkHiFinnaWPlETqevzcoQZjuBng+3XvVGnTNQunncRxOO9zPMXm7jnT5XYPWD6KeZDs5GaQNIgbzsPvDoRclVhpsnNL1S0oSAhMQHQSIkDqn3IK1CQkYkr95ISSSU+74dW93XgYvZVad15YGs3G4sZ2RIeyJfdtptRqLOaJk1SD6KJ3FOxHsBo7WkyXNfZkwxzgebWy3xc/Owf4hQh/NANjOkelTeFZzrafbBO2hQGacybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQUDmAAVkCzv1DHHgg1SqdVv9hBI2RXfXkKI00T/p2M=;
 b=rJzc3/aJ/6YZmV1CF9OlapRZR6QwJ5IzL7SdG0H7E63mXKRov7Al+K3NWGZb+MDm2qDYfFjz6Wv5H5SeakLkSlxODaCYDNG8W4b1FYzdnu45KAuK1VymdJF8jWk9E4Vm7X+U0ehz7suTvWM2ZI6U8b507y8WbkoKSMbko2khGbqeiAoFhLnie+Y6HdgIIWc++RC0ORklss2/Q5wfMBOPN8Fyxd5lWRMdjgwMha8N5yuwY0EzuO5vjqTJti1bnRC6w9iTEGY5VYt4gr9y0kUZNaDoumCC2RPd3tbZJ7RlVlFm+YLjEUjjb+bfKlFtSZ7ygTv6/0LtJZ4+OBCRcCe7+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQUDmAAVkCzv1DHHgg1SqdVv9hBI2RXfXkKI00T/p2M=;
 b=QZpHV1DBQJdPZRjDrUMVQ8n9JdKCnUC+qHNl9DpuSFTRoqDK2VC7S5TXw1rMeppYmlZO5+MreS4thPJNT/+xA+ASz+l5ZMeidfwNXEov5Zo/AMD/3JQysohB6VbByUZH34Jp/wPtfoYZbv5hzY81QRTkXMTnR71IXZxDadSkPVFQMM/O4guIfJ9zbr+S2SovLZonWZBVHe/XedMMjOpe80ZsR9AJi+xBAEwU6mQJIfkC12oVUfs6Xygwt2CWT3Y/qeRD9rfg6A2n3zacK8MdghcbN/0BSBiQT/yKFnbSgGfQLonEhozzrhdDJkdMgwzJj/s6k75kobsG9Q2gBENVlQ==
Received: from DS1P223CA0027.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:44e::18) by
 DS2PR12MB464888.namprd12.prod.outlook.com (2603:10b6:8:359::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.12; Mon, 2 Nov 2026 07:05:29 +0000
Received: from DS1PEPF00053450.namprd04.prod.outlook.com
 (2603:10b6:8:44e:cafe::1d) by DS1P223CA0027.outlook.office365.com
 (2603:10b6:8:44e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 07:05:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.232) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS1PEPF00053450.mail.protection.outlook.com (10.167.23.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:05:28 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sun, 1 Nov
 2026 23:05:16 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 1 Nov 2026 23:05:15 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Sun, 1 Nov 2026 23:05:15 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <joro@8bytes.org>, Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Jean-Philippe Brucker <jpb@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 5/5] iommu: Reject a same-domain replace in the attach handle APIs
Date: Sun, 1 Nov 2026 23:04:39 -0800
Message-ID: <b7dd43ba78b7342a2e0356870502746a8b7f34aa.1793602084.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793602084.git.nicolinc@nvidia.com>
References: <cover.1793602084.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00053450:EE_|DS2PR12MB464888:EE_
X-MS-Office365-Filtering-Correlation-Id: 9146b1d4-956b-4793-6c0a-08df38afad7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|6133799003|10067099003|22082099003|18002099003|56012099006|5023799004|11063799006|261021121427099003|261021123027099003|261021130227099003|261026121527099003|261026130827099003|261022105027099003|261022115727099003|261022113327099003|261026140227099003|261022075727099003|261009223027099003|261028144727099003|261021135927099003;
X-Microsoft-Antispam-Message-Info:
	gJK2Q+ij0vpZiO6NO6FAR7a72JZ6ZzgvSo8jzCpRSaTp7O6c9L/1IFJy02Y8F6sA07fjfZWUp5QVHTLwxfOBoAgo8V5h0hpK2TFQ4rawlG/Tx7jxSQle4PZIq+w5UQGlNk0xKSuba4sgwdPCnCWw4M1Wf5z8uEEZjys4YwJRuFEp97Tsjev8BvyYN5OCK7KgYjEu/4/mcAhw4xWEQtHHGMfhWJ66kqFuZUbfrsr9ZvCSkxpTfpUaxaKqz7wavo3zHysWkZqmx+feZqUvUS1e9kye1mdu0Q+WPUYrudbGXs3IiGzwIXlUl0NkouCtF3XSurNPH1GAOqM+/T0D/0YlKkT51OSvwWQ2qUhTYwvEFo0AyS3gz5q8LKqweGs+1a+z/GoEQHV5BKKgppl+mUvx7aQxbueOJVR9h0NRz1ncr+hRJNjoe/8YXAqS/A3Gy44xu5jcciMD5geiirA2p4zlxPPIK7iNgKYIl9DZJLzwRmv/dj0L9zmn2nTj6xLgENuy97fdTq4Sk3bvoPS1LRhR7MElbDonwe565t3XYsYYIfHhaCDje99K5/C4zKhjiVjVLIFFcmStokn82/oGU3jvB8x8XrtHGmZAvcEXiAfoQE9oCLxE8ry+ujk2uJz7yIyiKUA0qboEd6S52klnv7fR1DLkqzD8TXVCHow7Lh80ouSr+nVfxgYy0C8mP2hG0gyquADvsslWA188WsK50ztQ9A==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(261021121427099003)(261021123027099003)(261021130227099003)(261026121527099003)(261026130827099003)(261022105027099003)(261022115727099003)(261022113327099003)(261026140227099003)(261022075727099003)(261009223027099003)(261028144727099003)(261021135927099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kxnhHIe9bftjnRz6sBItGyTD5DcJeYXFK4OBW+tB04LtsO1ydDgSBbF01g6KR1jJBn4JXGANWEh6I79W8V0Mg5yImRACkoLJydyC7dEsmG+hvtvppPAZ0ub7bGoSXz5qnMtl/Vg8BKNwa9Pz+QHfsw7MEVEzgPTz8Se766AVan+E1542vax8ruiS9h8bk6o9apzDxZn8CDgb/jNXWLfA88cOKuQ1kbSMrQirjDbAWnadwnhKKWG2JFLKKA/JQEesplAC+9cpdQjivNLdLWvpOQJ/0plPtO9eZDJJw8gkY2oObfipiuIla8aWE9cRInPG9jJNP+jQflY+v4q4L5jv5zQHGDcXRdR2PLjqQGC8LksvsCYufM4yoO5/nefZkgOq0zshiwKa5jmpBZkyjgYar1CHDPS9kXgpQHXlxwwIIGl3QpgxJsZ5nuHlf2/8z5wC
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:05:28.9521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9146b1d4-956b-4793-6c0a-08df38afad7c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00053450.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB464888

Both iommu_replace_group_handle() and iommu_replace_device_pasid() skip the
driver callback when the new domain is the one currently attached. In that
case, nothing flushes the pending faults that may still be holding the old
handle. Then, the caller frees the old handle once the replace returns, so
such a fault would hit a use-after-free.

No caller does this today, since iommufd_device_do_replace() returns early
when the new hwpt is the old one. However, it is only a caller convention,
which neither API enforces.

Reject a same-domain replace in both APIs with a WARN_ON, and document it
in their kernel-docs.

Suggested-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommu.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 3fea48d3538ad..a9bc4ca5dbb4e 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -3716,6 +3716,10 @@ EXPORT_SYMBOL_GPL(iommu_attach_device_pasid);
  * Caller should always provide a new handle to avoid race with the paths
  * that have lockless reference to handle if it intends to pass a valid handle.
  *
+ * The @domain must not be the domain currently attached to the @pasid. Such a
+ * same-domain replace would skip the driver callback flushing pending faults.
+ * Then, those faults could use the old handle after the caller frees it.
+ *
  * Return 0 on success, or an error.
  */
 int iommu_replace_device_pasid(struct iommu_domain *domain,
@@ -3785,15 +3789,17 @@ int iommu_replace_device_pasid(struct iommu_domain *domain,
 	}
 
 	curr_domain = pasid_array_entry_to_domain(curr);
-	ret = 0;
-
-	if (curr_domain != domain) {
-		ret = __iommu_set_group_pasid(domain, group,
-					      pasid, curr_domain);
-		if (ret)
-			entry = curr; /* restore the old handle */
+	/* Same as iommu_replace_group_handle(), reject a same-domain replace */
+	if (WARN_ON(curr_domain == domain)) {
+		entry = curr; /* restore the old handle */
+		ret = -EINVAL;
+		goto out_store;
 	}
 
+	ret = __iommu_set_group_pasid(domain, group, pasid, curr_domain);
+	if (ret)
+		entry = curr; /* restore the old handle */
+
 out_store:
 	/*
 	 * The xa_store() above reserved the memory, and the group->mutex
@@ -3985,6 +3991,10 @@ EXPORT_SYMBOL_NS_GPL(iommu_detach_group_handle, "IOMMUFD_INTERNAL");
  *
  * Caller should always provide a new handle to avoid race with the paths
  * that have lockless reference to handle.
+ *
+ * The @new_domain must not be the domain currently attached to the group. Such
+ * a same-domain replace would skip the driver callback flushing pending faults.
+ * Then, those faults could use the old handle after the caller frees it.
  */
 int iommu_replace_group_handle(struct iommu_group *group,
 			       struct iommu_domain *new_domain,
@@ -3997,6 +4007,16 @@ int iommu_replace_group_handle(struct iommu_group *group,
 		return -EINVAL;
 
 	mutex_lock(&group->mutex);
+	/*
+	 * A same-domain replace would skip the driver callback flushing pending
+	 * faults. Then, those faults could use the old handle after the caller
+	 * frees it.
+	 */
+	if (WARN_ON(group->domain == new_domain)) {
+		ret = -EINVAL;
+		goto err_unlock;
+	}
+
 	entry = iommu_make_pasid_array_entry(new_domain, handle);
 	/*
 	 * iommu_attach_handle_get() runs without the group mutex, so unpublish
-- 
2.43.0

