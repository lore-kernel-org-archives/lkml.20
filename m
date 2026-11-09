Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794259485;
	b=ngDOf+SVZtLisDHKnnqZq2ESp9IDIMdwT8kST39LO12Si49zg7CauAseSqv0eX0FuWoO
	 1EykdizCA9ftcMOqhv15MVsqoGmHKlEg3P1e/AcWmHAKW+mTrkAl8zduupu1LyOM5t1Wf
	 TFmac+ToCYLgxIBWK2RtwfPOB563/jUbNaAebU727+wZbXLqsnkTKG7J5eWKU2Vc4WzVe
	 TFF+0+4RXqJeRcB4MAorMIDoWyi1q+MDIUpk/cRgF5bYpSDaBMS0qqdAw/glGKOV17a1v
	 sOlIphcDpycnrt61eXmeMyB2ch9GjzFrbBFH25O5BflO9w5UqavZ6ys3KDNX3QYvxuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259485;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=xgX4u+d3puUBlvhJSRKZII6yCdJh8gUQDH6RJSdXmq4=;
	b=16NdoJWAjFAwQlIrnRFiXpz+Od9N99KgMEnCp6cvEhaNZfjMsWyJx86IQL+pqJ3KTGkA
	 NWzEtUlh8LdbL1hm9DDio2pwtmE//pc+9L6UQIqXeDKRN0QAhP12svKEp+rpmLc79TXPe
	 8DiW121ssKbGLoAZeS1T6ILDSUSOd1E+z5WQLKj8wUC13wXbd4cSHYchwpRuwS5ECp3Oh
	 Ng+g3Bi1iROUQetXFjpEqiANEc1X41UGzz/uGnWpBIuILOzAcqLlLKxdpPQvQtPcsHcus
	 lmyoO2Y2B8eW+GSOqK1Wk02nVd2ch5R1ecwrCWmQ7AKGrMmEehxuqXBO31xeJcH5Cug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CU6LHOMV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.35
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010035.outbound.protection.outlook.com [52.101.201.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A084C60A2601
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A084C60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CU6LHOMV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LrszAxD9kKi8r9Gco9gQByELa92cEhRKgFVhxwoRNJkiV3b0/AdasYJQp3dXy45krANsf6BPpjx6bpjrooNG3ujJuECORFIIz6chpMkiF/Jj9TnRAewTcXvjZ5+OgFFatqiyUlrqeSFQWAEt6cAUg+qz+OhTfEGquGf0MJmaz+HfN5SLpCM54DjVgn2SEC5xsj3XNsMZBHj3sGoWnnXhaczevje2mYrQ4o4U53AlTRCA9JKdTrp7SLg2nIfohIUnxbZTTxZDW1Zbyakl6PWQ98vlvynsHiV0YNBWqAHc1f4w7H2EP+QcUs6Y7OQKvtH3LVTeSGd5vwANXFxRPlncNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgX4u+d3puUBlvhJSRKZII6yCdJh8gUQDH6RJSdXmq4=;
 b=Fug3iyUmO7Qt1+5blucc9cuLmznZFS5tPQ+CotwESuGPLW8lghx7k2nxoj2TxQjQOyO371RKKA1Y3gxcLnqtVoGVJxKR+rm9Map8HwAtgpc5IDkGvAFc3O7oCmD3iC55uUSO3251kzK+Ezdj2aUXKL4lWGWQGTPl1pYnMad2SH6crBKOiC9ykGB7bneh58untTiodDE+FaVXAeLO0y9DYpFszxHDFDD3ThwLGqvWUpcMWydA3UivpQ4uCfSGJmmKGdkuVLiyGJxFQ9F2vzcPIv++1sizkaUQlQdzIyc7wKMMTXQXasu+xjETtgSqm/oHSW6fhYVPQ8FZX13Lousd0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgX4u+d3puUBlvhJSRKZII6yCdJh8gUQDH6RJSdXmq4=;
 b=CU6LHOMVBP0mtLFSs4v6a7k6djsiPyP7JWb2Pdw5gZV4z8DPsLxcKg36jA90lbpkFcs/qYqoG/qDJGp8nh4sofQU9CGWvpL8vw0DQQPqXFzGrcwUGqQnmif3pFT39RDaj25y5/vCM+r6YJ9kt1ujrVCrAthV99bRDQP7x89PnEtUd1RyNrGPolA1OmnOvZDrayk6SQMPTtAp6K+K7qUf9jvx2tyGerynn+ZzVep2ifoADqNBeY6gWiI3uH50P2Ky5DlZa3kkNWJm4ZWNIaMZh9V2xbim/c0R99yPc+OhddGVASUrxHmgaOabdYC7nvyCWSASqOY/G0y6FzF2VQVpdQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by PH7PR12MB8593.namprd12.prod.outlook.com (2603:10b6:510:1b1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Mon, 9 Nov
 2026 21:24:40 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0569.011; Mon, 9 Nov 2026
 21:24:39 +0000
From: Fenghua Yu <fenghuay@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Will Deacon <will@kernel.org>,
	Dave Martin <Dave.Martin@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <fustini@kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Newton Liu <newtonl@nvidia.com>,
	Richard Cheng <icheng@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fenghua Yu <fenghuay@nvidia.com>
Subject: [PATCH RFC v3 05/15] resctrl: Make MBM paths resource-aware
Date: Mon,  9 Nov 2026 13:24:17 -0800
Message-ID: <20261109212427.1409204-6-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109212427.1409204-1-fenghuay@nvidia.com>
References: <20261109212427.1409204-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::18) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|PH7PR12MB8593:EE_
X-MS-Office365-Filtering-Correlation-Id: cf481de9-83dc-429d-2801-08df3ea7dcb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|921020|11063799006|5023799004|261009223027099003|261021123027099003|261021121427099003|56012099006|261022105027099003|261022075727099003|261009221727099003|261009221227099003|261009223327099003|261009220027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	UodLXZAxacmwrdIPmLZyyZFAmRfy1Ex46LdXMA62RcBIL0uP7/XW5QOuvY8H3mjdRHwOEfevbPY9jUSnIcupsxqvUsAvyZc40MeOgvnp0tlUgwoOnCFknZKCXIUT+8BQ1QGlS3A8oja89RhA+dFD8zHW3zY7lwolIwYM2/hZR/SEAAk1lug7kJbYKdlDlMZE07JfbgGIDJteNnbPiBd47tCLHlYMiX3v+9E7ajR6Qu6n3SM5gpaMD+jJpsTflcdauNP6yUi3k+VHM0ma2tlIdrDCRea1u7lfNYOwpR9GV4fVLNr/wjj9oRSCEokavK98BymbYVvyyGMFylIWZGBpJ2nuwrN/K2BnV2aYw5Gwft9zmOEc+8QKFLr3Q1gtvGG2Wejw/0Yy2iWFNaQi/0Lm8WUHM5HQxS/QPjk4zkkp4+JvmSkbOYmCzgTwWkBMPG3Whc4eJsfX3+nJIMKwsYkGI/RNA/qYSdmAeZEZfpeX9IpnZs22TfPp1OE0CD0VQc33/bILPq45Y+hTi1HZaAyspsItPp+MI7wW88MfHl69NoCwz89ltgXUZaGETu2wTKXRNXxpkolqZSmnJbrPpmGQtx6uU/Cku7v4OF5yZ8cNhzmmDS/MctZZu2gCR9HWJK7TGvaipfrZxn/02VXD9h5smV02umUAFwZ9l4oDCZeb68ax0JDMm+BwoN4lQLie5Ozf+ZPEuA8MrPYQAhkmGWx4oA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(921020)(11063799006)(5023799004)(261009223027099003)(261021123027099003)(261021121427099003)(56012099006)(261022105027099003)(261022075727099003)(261009221727099003)(261009221227099003)(261009223327099003)(261009220027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H+prAlIk9fcl66qeKW4NXH3jXFqoHs+D5epBURFRvEuASOH+BIt3JrhDTUZW?=
 =?us-ascii?Q?fmSjIjT/t8cmV9BBdpySWw4dP9Qm/Da/q4c/7CCqWOjohyYudbA/u7oWmuKx?=
 =?us-ascii?Q?RSDIqFdm5jJ5IivIJD1sx7XOa7dhxkL0GZsHH2Tyi3fwpGAoYDIYPLv80esM?=
 =?us-ascii?Q?Gx3+/WYjLPnLzZcDyvuoM9FeJF+jtxedC0YZOTi/k3Wo9fcqekpLXYTL8te8?=
 =?us-ascii?Q?pybLmSKI4Q6s3FUcHDJXx7i1zxPeraJGmZMLlfMwUzfuinbk7koZ2poMr1pI?=
 =?us-ascii?Q?hAaC3xUd2BT2NNQziQqVvT5/kZGO/worgi5yIv3T4VvOGzFxNPBJa9i0HODV?=
 =?us-ascii?Q?6a29RN87tK18ldS5mPFrmSPRjwK33nlQ7gUXrndkt3sSuUrOGauQ7fTPWw4W?=
 =?us-ascii?Q?jeTP3NUvkudum3k/vUro8L0XhvpV+wJzHbDLkN3ZwSXSdoLMdoe9FiJstMjw?=
 =?us-ascii?Q?JR66MTyNYd8Fho6VTYzAbHnjQo1uZG7q/KhWtvvG+7foc5N46+ccizmhUzdk?=
 =?us-ascii?Q?kJa8nDjBcef4/fUhxWYUvpzyE+RsMKxZdJ4ZBP8oHIjLuXZQYGv0j8Fld07l?=
 =?us-ascii?Q?cUz6/9vSqcCEeJEDKgbCepg0z47fAQzXe8gZ3ClnLJ5EWG7FiJ2GETeFTUHl?=
 =?us-ascii?Q?yc5gf/U3fQMga2Rqx3dJcwMQskdEei+p56ngQ8kvUfo5dn+d5wxhjEa8cPkU?=
 =?us-ascii?Q?ALyeQT3p3W7FDngAt0ILHt3G+OJAa4x3IWVHhL8hzg/xNl2Y9+u8Y5RdShL+?=
 =?us-ascii?Q?q8aGBKK0N9W6gLK0SWBI/j4tbwxmPNMzV5Dz7dgnun/JzKMjNLG0kvWy5Kh2?=
 =?us-ascii?Q?FF4m/zzM43ab5hh4YW24QjgWEGLXOr39sFAanccWZRQy/OhIuyCNH3McfLnF?=
 =?us-ascii?Q?iXB6kVhrsjDYkr8FUvfIVefzICqNBzPjSAVKk1r4BbzAjrfe/iNgayoSqf8x?=
 =?us-ascii?Q?ZyDqrLR896CHorx4TkkkkHRQrAzHz7mvsK3ImLeUG9k7wmTAiFXRlNi6Fzqf?=
 =?us-ascii?Q?qHkJ30To+ND0gC+ENZlKqPWDFmWJnQBB4D/BXpHCBps4tBURoWYITsHzjI4M?=
 =?us-ascii?Q?ja7NTI3jJQI8YWdIdsJvN+7MtCU48hlRgSgUA/fkw+G+k9kxwAExcqqbL6PC?=
 =?us-ascii?Q?1VnLvrKIkR5dCPS8zVXFyw5LQ8yZAU0QbEOD/o7WtGQOBCpIsDb+TFtL/1PA?=
 =?us-ascii?Q?2qN5g0M30buN8nkLc26dsAvfXFB6rX9JlAvNKOZ64af1iwAn/m2gPhdJqL+d?=
 =?us-ascii?Q?jbdwkmigZ8w/MsCyW6bhiIusLOnx2CmNpMgJmMffNmwBvcDYC+frCY0B0fr+?=
 =?us-ascii?Q?YE7h4SgENEii8PGVsU1L+DuP1NNbycA3KYUuEcjXW3DTYGsVwfYHtTzYIckd?=
 =?us-ascii?Q?J7MupgqJgAaBCWuTfX0xqPDVB28CcUoDA1HwX3Ke6UKCafeM7ISpAuc1GxJm?=
 =?us-ascii?Q?Cjtm9uv0j5L9/NXfxRu84A9XXoIfRjloss9Bhm1NJkDi2kpDieq8xlDXz0tO?=
 =?us-ascii?Q?N5p+E0b3hV9RWbKGJipW8t2cJX9D+YnzsWKK9kDh2C/KW+E99Gs66cd6P1ry?=
 =?us-ascii?Q?Uznp2a68I7vt1uF1OPDSNJGdYd2Io+WZQn5oqqBxrgLvUoWXHqN+i/0D9RWM?=
 =?us-ascii?Q?zefZwoGYfr0Sx1Dlra4oFaUtKcszx6WzPoaP4ju1kVDiVwXYzAtsxgaE4QWU?=
 =?us-ascii?Q?8SvYBdrLVPRK3HfrPODWSTWpsM9yiJm4g9m/vZ1316RvrQmk7FCByaedb5Oc?=
 =?us-ascii?Q?NVIs84sHJw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf481de9-83dc-429d-2801-08df3ea7dcb1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 21:24:39.4040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pu6zj2xhX0XGOVpjFML3zRHqqYSKF0/iMfBw2op9mTGFn6mbzP0Nc5SpXmMnH9vxGq8h4zjmV1qrBzWMkq9bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8593

The MBM overflow, counter-assignment and event-configuration paths
hard-coded RDT_RESOURCE_L3 and the individual L3 MBM event ids. That
cannot express the node-scoped MBM total event, which is backed by the
MBA resource.

Iterate mon_event_all[] and act on every enabled MBM event whose owning
resource matches, instead of naming the L3 events explicitly. Derive the
resource of an overflow work item from the domain's rid, only run mba_sc
bandwidth feedback for the L3 resource, and initialise event
configuration for whichever MBM events a resource actually exposes. No
functional change on L3-only systems.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/ctrlmondata.c |   5 +-
 fs/resctrl/monitor.c     | 105 ++++++++++++++++++++++++---------------
 fs/resctrl/rdtgroup.c    |  64 ++++++++++++++----------
 3 files changed, 109 insertions(+), 65 deletions(-)

diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 675531009136..4bc7090ad0c7 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -700,7 +700,9 @@ ssize_t rdtgroup_mba_mbps_event_write(struct kernfs_open_file *of,
 		else
 			ret = -EINVAL;
 	} else if (!strcmp(buf, "mbm_total_bytes")) {
-		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
+		if (resctrl_is_mon_event_enabled(QOS_NODE_MBM_TOTAL_EVENT_ID))
+			rdtgrp->mba_mbps_event = QOS_NODE_MBM_TOTAL_EVENT_ID;
+		else if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
 			rdtgrp->mba_mbps_event = QOS_L3_MBM_TOTAL_EVENT_ID;
 		else
 			ret = -EINVAL;
@@ -731,6 +733,7 @@ int rdtgroup_mba_mbps_event_show(struct kernfs_open_file *of,
 			seq_puts(s, "mbm_local_bytes\n");
 			break;
 		case QOS_L3_MBM_TOTAL_EVENT_ID:
+		case QOS_NODE_MBM_TOTAL_EVENT_ID:
 			seq_puts(s, "mbm_total_bytes\n");
 			break;
 		default:
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index ea9d92b6b581..d555f2d19164 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -809,11 +809,15 @@ static void mbm_update(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
 	 * This is protected from concurrent reads from user as both
 	 * the user and overflow handler hold the global mutex.
 	 */
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-		mbm_update_one_event(r, d, rdtgrp, QOS_L3_MBM_TOTAL_EVENT_ID);
+	struct mon_evt *mevt;
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-		mbm_update_one_event(r, d, rdtgrp, QOS_L3_MBM_LOCAL_EVENT_ID);
+	for_each_mon_event(mevt) {
+		if (mevt->rid != r->rid || !mevt->enabled ||
+		    !resctrl_is_mbm_event(mevt->evtid))
+			continue;
+
+		mbm_update_one_event(r, d, rdtgrp, mevt->evtid);
+	}
 }
 
 /*
@@ -910,8 +914,8 @@ void mbm_handle_overflow(struct work_struct *work)
 	if (!is_percpu_thread())
 		goto out_unlock;
 
-	r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	d = container_of(work, struct rdt_l3_mon_domain, mbm_over.work);
+	r = resctrl_arch_get_resource(d->hdr.rid);
 
 	/* Domain is going offline */
 	if (cpumask_empty(&d->hdr.cpu_mask))
@@ -924,7 +928,7 @@ void mbm_handle_overflow(struct work_struct *work)
 		list_for_each_entry(crgrp, head, mon.crdtgrp_list)
 			mbm_update(r, d, crgrp);
 
-		if (is_mba_sc(NULL, NULL))
+		if (is_mba_sc(NULL, NULL) && r->rid == RDT_RESOURCE_L3)
 			update_mba_bw(prgrp, d);
 	}
 
@@ -1321,19 +1325,20 @@ static int rdtgroup_assign_cntr_event(struct rdt_l3_mon_domain *d, struct rdtgro
  */
 void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	struct rdt_resource *r;
+	struct mon_evt *mevt;
 
-	if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r) ||
-	    !r->mon.mbm_assign_on_mkdir)
-		return;
+	for_each_mon_event(mevt) {
+		if (!mevt->enabled || !resctrl_is_mbm_event(mevt->evtid))
+			continue;
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-		rdtgroup_assign_cntr_event(NULL, rdtgrp,
-					   &mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID]);
+		r = resctrl_arch_get_resource(mevt->rid);
+		if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r) ||
+		    !r->mon.mbm_assign_on_mkdir)
+			continue;
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-		rdtgroup_assign_cntr_event(NULL, rdtgrp,
-					   &mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID]);
+		rdtgroup_assign_cntr_event(NULL, rdtgrp, mevt);
+	}
 }
 
 /*
@@ -1380,18 +1385,19 @@ static void rdtgroup_unassign_cntr_event(struct rdt_l3_mon_domain *d, struct rdt
  */
 void rdtgroup_unassign_cntrs(struct rdtgroup *rdtgrp)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	struct rdt_resource *r;
+	struct mon_evt *mevt;
 
-	if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r))
-		return;
+	for_each_mon_event(mevt) {
+		if (!mevt->enabled || !resctrl_is_mbm_event(mevt->evtid))
+			continue;
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-		rdtgroup_unassign_cntr_event(NULL, rdtgrp,
-					     &mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID]);
+		r = resctrl_arch_get_resource(mevt->rid);
+		if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r))
+			continue;
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-		rdtgroup_unassign_cntr_event(NULL, rdtgrp,
-					     &mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID]);
+		rdtgroup_unassign_cntr_event(NULL, rdtgrp, mevt);
+	}
 }
 
 static int resctrl_parse_mem_transactions(char *tok, u32 *val)
@@ -1551,6 +1557,7 @@ ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of, char *buf,
 {
 	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
 	struct rdt_l3_mon_domain *d;
+	struct mon_evt *mevt;
 	int ret = 0;
 	bool enable;
 
@@ -1602,13 +1609,19 @@ ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of, char *buf,
 		 * Initialize the default memory transaction values for
 		 * total and local events.
 		 */
-		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-			mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask;
-		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-			mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask &
-									   (READS_TO_LOCAL_MEM |
-									    READS_TO_LOCAL_S_MEM |
-									    NON_TEMP_WRITE_TO_LOCAL_MEM);
+		for_each_mon_event(mevt) {
+			if (mevt->rid != r->rid || !mevt->enabled ||
+			    !resctrl_is_mbm_event(mevt->evtid))
+				continue;
+
+			if (mevt->evtid == QOS_L3_MBM_LOCAL_EVENT_ID)
+				mevt->evt_cfg = r->mon.mbm_cfg_mask &
+						(READS_TO_LOCAL_MEM |
+						 READS_TO_LOCAL_S_MEM |
+						 NON_TEMP_WRITE_TO_LOCAL_MEM);
+			else
+				mevt->evt_cfg = r->mon.mbm_cfg_mask;
+		}
 		/* Enable auto assignment when switching to "mbm_event" mode */
 		if (enable)
 			r->mon.mbm_assign_on_mkdir = true;
@@ -1947,6 +1960,7 @@ static void closid_num_dirty_rmid_free(void)
 
 static void resctrl_mon_resource_init(struct rdt_resource *r)
 {
+	struct mon_evt *mevt;
 	unsigned long fflags;
 
 	fflags = (r->rid == RDT_RESOURCE_MBA) ? RFTYPE_RES_MB : RFTYPE_RES_CACHE;
@@ -1956,6 +1970,11 @@ static void resctrl_mon_resource_init(struct rdt_resource *r)
 		resctrl_file_fflags_init("mbm_total_bytes_config",
 					 RFTYPE_MON_INFO | fflags);
 	}
+	if (resctrl_arch_is_evt_configurable(QOS_NODE_MBM_TOTAL_EVENT_ID)) {
+		mon_event_all[QOS_NODE_MBM_TOTAL_EVENT_ID].configurable = true;
+		resctrl_file_fflags_init("mbm_total_bytes_config",
+					 RFTYPE_MON_INFO | fflags);
+	}
 	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_LOCAL_EVENT_ID)) {
 		mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID].configurable = true;
 		resctrl_file_fflags_init("mbm_local_bytes_config",
@@ -1964,17 +1983,25 @@ static void resctrl_mon_resource_init(struct rdt_resource *r)
 
 	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
 		mba_mbps_default_event = QOS_L3_MBM_LOCAL_EVENT_ID;
+	else if (resctrl_is_mon_event_enabled(QOS_NODE_MBM_TOTAL_EVENT_ID))
+		mba_mbps_default_event = QOS_NODE_MBM_TOTAL_EVENT_ID;
 	else if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
 		mba_mbps_default_event = QOS_L3_MBM_TOTAL_EVENT_ID;
 
 	if (r->mon.mbm_cntr_assignable) {
-		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-			mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask;
-		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-			mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask &
-									   (READS_TO_LOCAL_MEM |
-									    READS_TO_LOCAL_S_MEM |
-									    NON_TEMP_WRITE_TO_LOCAL_MEM);
+		for_each_mon_event(mevt) {
+			if (mevt->rid != r->rid || !mevt->enabled ||
+			    !resctrl_is_mbm_event(mevt->evtid))
+				continue;
+
+			if (mevt->evtid == QOS_L3_MBM_LOCAL_EVENT_ID)
+				mevt->evt_cfg = r->mon.mbm_cfg_mask &
+						(READS_TO_LOCAL_MEM |
+						 READS_TO_LOCAL_S_MEM |
+						 NON_TEMP_WRITE_TO_LOCAL_MEM);
+			else
+				mevt->evt_cfg = r->mon.mbm_cfg_mask;
+		}
 		r->mon.mbm_assign_on_mkdir = true;
 		resctrl_file_fflags_init("num_mbm_cntrs",
 					 RFTYPE_MON_INFO | fflags);
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 264666e54852..d60868f7d5e7 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -134,7 +134,8 @@ void rdt_staged_configs_clear(void)
 static bool resctrl_is_mbm_enabled(void)
 {
 	return (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID) ||
-		resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID));
+		resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID) ||
+		resctrl_is_mon_event_enabled(QOS_NODE_MBM_TOTAL_EVENT_ID));
 }
 
 /*
@@ -1929,7 +1930,7 @@ static int mbm_total_bytes_config_show(struct kernfs_open_file *of,
 	if (!info_kn_lock(of->kn))
 		return -ENOENT;
 
-	mbm_config_show(seq, r, QOS_L3_MBM_TOTAL_EVENT_ID);
+	mbm_config_show(seq, r, resctrl_mbm_total_event_id());
 
 	info_kn_unlock(of->kn);
 	return 0;
@@ -2053,7 +2054,7 @@ static ssize_t mbm_total_bytes_config_write(struct kernfs_open_file *of,
 
 	buf[nbytes - 1] = '\0';
 
-	ret = mon_config_write(r, buf, QOS_L3_MBM_TOTAL_EVENT_ID);
+	ret = mon_config_write(r, buf, resctrl_mbm_total_event_id());
 
 out_unlock:
 	info_kn_unlock(of->kn);
@@ -5317,10 +5318,39 @@ static struct rdt_l3_mon_domain *get_mon_domain_from_cpu(int cpu,
 	return NULL;
 }
 
-void resctrl_offline_cpu(unsigned int cpu)
+/* rdtgroup_mutex must be held when this helper is called. */
+static void resctrl_migrate_mon_domain_workers(unsigned int cpu,
+					       struct rdt_resource *r)
 {
-	struct rdt_resource *l3 = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	struct rdt_l3_mon_domain *d;
+
+	lockdep_assert_held(&rdtgroup_mutex);
+
+	if (!r->mon_capable)
+		return;
+
+	d = get_mon_domain_from_cpu(cpu, r);
+	if (!d)
+		return;
+
+	if (resctrl_is_mbm_enabled() && cpu == d->mbm_work_cpu) {
+		mutex_unlock(&rdtgroup_mutex);
+		cancel_delayed_work_sync(&d->mbm_over);
+		mutex_lock(&rdtgroup_mutex);
+		mbm_setup_overflow_handler(d, 0, cpu);
+	}
+	if (r->rid == RDT_RESOURCE_L3 &&
+	    resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID) &&
+	    cpu == d->cqm_work_cpu && has_busy_rmid(d)) {
+		mutex_unlock(&rdtgroup_mutex);
+		cancel_delayed_work_sync(&d->cqm_limbo);
+		mutex_lock(&rdtgroup_mutex);
+		cqm_setup_limbo_handler(d, 0, cpu);
+	}
+}
+
+void resctrl_offline_cpu(unsigned int cpu)
+{
 	struct rdtgroup *rdtgrp;
 
 	mutex_lock(&rdtgroup_mutex);
@@ -5331,27 +5361,11 @@ void resctrl_offline_cpu(unsigned int cpu)
 		}
 	}
 
-	if (!l3->mon_capable)
-		goto out_unlock;
+	resctrl_migrate_mon_domain_workers(cpu,
+					   resctrl_arch_get_resource(RDT_RESOURCE_L3));
+	resctrl_migrate_mon_domain_workers(cpu,
+					   resctrl_arch_get_resource(RDT_RESOURCE_MBA));
 
-	d = get_mon_domain_from_cpu(cpu, l3);
-	if (d) {
-		if (resctrl_is_mbm_enabled() && cpu == d->mbm_work_cpu) {
-			mutex_unlock(&rdtgroup_mutex);
-			cancel_delayed_work_sync(&d->mbm_over);
-			mutex_lock(&rdtgroup_mutex);
-			mbm_setup_overflow_handler(d, 0, cpu);
-		}
-		if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID) &&
-		    cpu == d->cqm_work_cpu && has_busy_rmid(d)) {
-			mutex_unlock(&rdtgroup_mutex);
-			cancel_delayed_work_sync(&d->cqm_limbo);
-			mutex_lock(&rdtgroup_mutex);
-			cqm_setup_limbo_handler(d, 0, cpu);
-		}
-	}
-
-out_unlock:
 	mutex_unlock(&rdtgroup_mutex);
 }
 
-- 
2.53.0

