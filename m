Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011015.outbound.protection.outlook.com [40.93.194.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839C93546EE
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789957735; cv=fail; b=WtyF8j+XL4STzY17yvzRdIWNEYcEZ242fEZGGYoFoYgN0DcTiqDVmJKLvPrNCONfoC6Mx04j3xX7kdBDf96BOeRjI17KYrMmeqPRHmmQEUUSGSdXiBg4gCN9vcI8n2BswPz94PDvN50NWdzrP7Ikpv6whg6Cj/lao+xMqEtZptE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789957735; c=relaxed/simple;
	bh=6/zBxdVAIbW7qEPFy67GOECm4YJbcWO9haEWCetgdgE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jRu7sj34znLU0hwyGqYbjqXoKwOS8j8EpNifMvzpI3eC3nE3X/zEbCr2DIg3Ojw3GnQfLrpcbCuzecNTyz0L24I4KsNlWB+VrrRPcDjrKFH+3ILPqJ2Ro7lK6NBRmdtAxboI2jL4/7ySfPca0oLiXObuu2DBEy1EodVn4x900EA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Kn1AIeH5; arc=fail smtp.client-ip=40.93.194.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Kn1AIeH5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8A0LP7rrxEr4foktBaQOQcyW4b4jCdj0VH8HFnMMy9CJNvAiDgtjFFqZzpArjpYKxq0ypTV2W9YCwHFxLNDhcOCm3jPHASonomWHRKfy0i2r00s+Z1VMrZCQGQteKrQ09Q/4GbzhF3t8r7rHvxc96p9WIWgUuqQ97R715V4wPhgGZARHJccq6TMrQPiUO5NcjG6L6d9DoM78ji+zjVNv+VsdgUwhk53RO8eYJwZ/d2KCFuLBrYRm55jtb90FoFsjqWgF/r3p9eHki21vcriwjQ6C+X+VapP0guiuqgakAZ+7z/dYBaD19WsnHH29EnQ6X3be/3LZTN8bpkSF/XCrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01Xi6R1KA9yPUANeZFsRKhpXHuMdsjB8C9yKA7zgBeI=;
 b=rYHgTYvTur95cjEe6M/SmL309OGBMw0yFu8WBNtoG0WeUJZphI9vuseHXqcaR1WGRW3I7hKVfDLv4+nZo+Muu2NO6PPMBg86u8SY9TD9x2QruAj8ojKL2uK6evoJvLXIpIaLe1vt0nb02Ucxxg52h9vaEbJLD0+EzG6yMSHlF79V60Cas9bebCGDtSfGesaBH5yoWvUEAj5xVjuDEpS8EuBmIpZVM1yChG6w/Cq4PvWpK1bF6rbD/yGebMBtqAEmXtoOHmC/o1O7UXDdk+37BL7NmcconU/dhdev582y6uP4QM751ymMwvKoTeL6wCOhRjpA7DF2WGy3Mb7X50QCpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01Xi6R1KA9yPUANeZFsRKhpXHuMdsjB8C9yKA7zgBeI=;
 b=Kn1AIeH5OhP66rgsk3J9NRWcWRknQu2h17z0xF9LwpPKYhhw9zL1eL5hP7xCWZzWuHfPS2nYeKcYrUsVlM/8xc8gg7oyciRImCywiGCexm5bJdSPkVF0yDI0ml9vzR6pw+ZVJuk2lludvSZTS/wF+6IHLZYdZF3Y7ApyEHmAtPMqiltfjwFuwfcvK6UyA5GU50pQlvDacr547qMAWFiGa6PYx0vxCFxzvRNEo3Izx8733eQ0p+tleb5TSbDav1aPiKBQYngKwfId0OACelHXtwp9mQwl6Z86SeteeHJX51b0e7vf6SJ+7A6UVhz2eJH/WzWTstiJ4xQCU0TKmxCS/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DM4PR12MB7719.namprd12.prod.outlook.com (2603:10b6:8:101::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 02:28:40 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 02:28:40 +0000
From: Zi Yan <ziy@nvidia.com>
Date: Sun, 20 Sep 2026 22:28:10 -0400
Subject: [PATCH v5 14/17] md: Use folio APIs in free_page()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-remove-pg_private-v5-14-bb68b6a21869@nvidia.com>
References: <20260920-remove-pg_private-v5-0-bb68b6a21869@nvidia.com>
In-Reply-To: <20260920-remove-pg_private-v5-0-bb68b6a21869@nvidia.com>
To: David Hildenbrand <david@kernel.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Zi Yan <ziy@nvidia.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: YQBPR0101CA0288.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::8) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DM4PR12MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: e75a13a0-1881-4c5b-07ea-08df17880c90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|921020|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FwvStbiV/U2aMo7YPDHnpXxWTKiAbUXepLmyyynHSGVygupOh33yyOOEZL4YNp4/kE/UQ4QusDnkfzRNM4XLtVu8c4msR7r11dFh3OYonFYoL4/XJLwX+6hInomZEZzxelCpiIMQ451jDU3v3tQP2aKGUam45JGe8PV3jrYvKsgkkyAofvMvGCLoZ1nyJ1JTbCuA2b+ZJau8YjmGpIYUWvqKHFhEOGr/xLOTpbtPVAWlH41xMf4xB/qWY+6zF3NrDStTdq0YjgPO/wRDchz8tTUA/+MxMZrn2+3XdMevxehAVvkSKuI9VZIDbOytMQJe2NlY8PbrMCMiBiP535ZI/1Xy+YrBLf489tC/K+cZIsnDSbVZCMYlp8Sl45tUzspXD67ePEHX8gpkFCwffKV3zuOONNykQHvSGaCJYHaPB2B1F5IXYrNpuYrv4i4LX1obvAxSch2vhEPcUSdQgWrRdk0xWxmEV3m9q8HEVVMBwJ7nH+9m6SMJLS/LCen2qq+UC9dcJ9zsT5hsFTHQ4z27G2Fsm6hLoMPwtUQMLclnnM5+6eYdjalvW9j3oOV3lnofEspEsKnD9EMW6ASw5/7f0Jhwwked/2Fhb+VrOBp0r7xzlG2kbwXXgPOESMC4lEaQJJQdJoMxHfUA98ACCLjOx6mvM9lPElwr6V5D5ikk0TBswnO/k43S6d5CkNu4XF8RL59KOo+G9nc8/0SIhiXrdw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(921020)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkdLc2I0bXlnTFF5MmdwbFlEcnhXQWw4YzdUYlZJTzZEcGpIdGpOVFNzM3BR?=
 =?utf-8?B?RmxTVXUrWjRIQk94ZGVLQ056U09XRXFtN2grb2hYWGVxRE9IU1BIYkhFczg4?=
 =?utf-8?B?clg5MmFiMTVITDN1VVZYdTh3NXpZdEY3ZmF1VHZxZ0FrZmRMU2JGTWVnbVlX?=
 =?utf-8?B?WjNGL2pXRnBOdC9aZm02ZENKc2VxSTNQQUVYWG1CWmtKVklyR3BVTmlwRjAv?=
 =?utf-8?B?ZjRUa1o1SVpFY0cxMU1Bak5DdzJUSFVhMjZQZzB1NXlQRGlGQ1NoSkVlKzdP?=
 =?utf-8?B?SWhzU1I3Ny80WG9BL0RHRWcydzRjMTZGRG9UZmdCS1ZBakpNczJQS0p0aUVL?=
 =?utf-8?B?VUVxTE9SRXJRQVgyay9lbjZsRnBJYnJzbFJ3MmRTeEoxZUVlZWpWaUlXbm5B?=
 =?utf-8?B?R1hjYUtIcGpkZHhXaVhiQ0lGL1IwZUhheC9tYzhKTjM3OWR3ajNNN2VFWFgr?=
 =?utf-8?B?aHB6SHNnZUNBREc5c3Jud2drTGFRY0xiOVp6NTZ3bFVIOXBScVZIOGFXalNG?=
 =?utf-8?B?QSt3TkZwNDRxV2hWejhvVHY1MTQwRXlyQktRNGNRODFrSERiSDdwU0FJRTkr?=
 =?utf-8?B?WWxkcUthZUVXQTB3SWxFUEFuQ0FKbXVya3hxWnB5eGwrT2p4c1V2Q3RkOW04?=
 =?utf-8?B?UTB2N1lQZHo2R2J4M2JGRzdrZVBoYTZZRCtLT0F0a3owZktVRGFSVmdvQXRE?=
 =?utf-8?B?cEZJTktLdENxaU1GTy9VNGlaSkVqOHljVzE0ZEJtZVNkdUErbEl5QW8yczQv?=
 =?utf-8?B?MnUrUVZOOC8yWEJZTXYwMjNJMEM3bWp6UHNobEdWQ3F3Q1F1S0dpeFpHN204?=
 =?utf-8?B?c3I2ZW9STCtiUWVDN09uKzdRNHUrSmRpemhDK3RPVEpNN1Y4MzZhOEFSY0xn?=
 =?utf-8?B?YTJGZ05qME0zRTNGcjVvaTN4Y09wWENyYnU2QnRKcmZtcWNGRGxCQ1h1Qm5w?=
 =?utf-8?B?OWxaeXptK054NFRlaEp5OW5pU0p5aVhpdnEyQi9iZzNQTHYraUdzR3E4SzAw?=
 =?utf-8?B?cmc3a2haSm1hMGpmdmxQMXlTdGY5Szl3dkpHVDdGbDJZTzQ0b0RhcUJOeVZE?=
 =?utf-8?B?M0hyZ1lsTHEzVEtXNG1NNXI0OFRzc1NKNUNuMlhXZUZlcWNVSXF2c1N6N3px?=
 =?utf-8?B?V2tNeG5xOElBU1dQSTk5ZTcrRGtDOVhJLzJ6c0J4dHJsL0pVMUNabjAxYmZ4?=
 =?utf-8?B?SVlvK25aUnRLRUlsQ25kSTgwQ2hEVmxaNXFuWU9pWk43QXVxeHpXZ1VxREYr?=
 =?utf-8?B?dkhWUHRlSEJEYzB1MUxVYzBvVTF3S3AwNWc2TFFESHVLdGFxNnIzaDdyU3hl?=
 =?utf-8?B?SytOWll1K010YnM2S2oyVFlVSFQzVStCVmxTeSt1VHdzSXpDcmVCZHdRQk1n?=
 =?utf-8?B?QnY1d0FOUWRVSG1DRCt5ZlBFVWlYWGZFTjYzYy80Z1NycXhqVzZKR3hFOHpt?=
 =?utf-8?B?VXhURnZqOTBLUlFtckkxSGhsakF1K0xTWmlKb2UrZHhLZHVTWTJFa0VrNDVE?=
 =?utf-8?B?OHIyVHNlRUZiSVdKeEhBc1V4UThQYlFmb0dmeCs5UEZWQ1hPTmR6aENoSnl5?=
 =?utf-8?B?UTlQc2gyQUcya0hxZ2I3OUVVRmtIWDZOQ3l0YmUxUjU0b3NMT2xtOURvbzg3?=
 =?utf-8?B?NGxkc01aUFEvZUFGMWE3OHo2QTg0M1NYVWVvbU41MzI3b2JtVFBha0hNR0cv?=
 =?utf-8?B?TWlWUXFLelJsWGtnNjBXdTY3QUg5M2h1ajljOC9sMUg4SC9wSlphbjZqdlR5?=
 =?utf-8?B?bVpBVVJOQ1EwVHVkSWxrcWJyTTlzeUhoTWZXVGYydEVDOElhZWZzMnhGWk5E?=
 =?utf-8?B?bjVsbUJlV0ZOYUszZ2RrdmwvQ0RzWEM2d09KTHBVRjJPcXp1K0Z2Ujh4ekZX?=
 =?utf-8?B?NXg3d2Joamhwa2ZxRWJwWklpUnVwelFLRXZFRGwxOU1OTUF2WEFCYUptWGtG?=
 =?utf-8?B?ZHNRU2ZGS3VZZmJIMm1sVW5GdnJLMXFpUE9YeUZnclM0VUduQkswV0lxNTZ3?=
 =?utf-8?B?TGd4bENsa0NORldqelk4Zk5kYlhqQkZVVm5SeVU4RG81MFczTFNBMitGclJm?=
 =?utf-8?B?NERmNVlaYkVjZ2FvK3BoeW1ucEozeTV3VmxmdzhZbVNDTFJXU09STW9pSmdh?=
 =?utf-8?B?ZlhKcmVnb2xhMm5IZkJndWlSbjRKUWdXZ3JEZUk0VVBWZTZqdm9heUJmcUNk?=
 =?utf-8?B?SytvZ1pzeXVIQk1ZVU9CaHFGNGZMdXYxT0hleC84dW4wMTh5K3NLZ3YvRll6?=
 =?utf-8?B?QytsUDhWMktZbWk5ZGtobnB4OWZlTFJ5dGRlK09maXhpazJNc2VVL3pXWEY2?=
 =?utf-8?Q?R0lxJDVr/rVto5uZ2M?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e75a13a0-1881-4c5b-07ea-08df17880c90
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 02:28:40.5010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Ky81xWnsm5OveEAKDZBGjGucM8Z0yLGDW39y0uqCnHnqWrS4R75Hgfu1imK4OuR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7719

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Convert the page to a folio.  This removes some of the last uses of a
few page APIs (detach_page_private(), page_buffers()).  Replaces two
calls to compound_head() with one.

Remove the early return in free_buffers() to avoid memory leak and
uninitialized file bitmap pages.[1][2]

Link: https://sashiko.dev/#/patchset/20260913-remove-pg_private-v4-0-848550f7574e%40nvidia.com?part=2 [1]
Link: https://lore.kernel.org/all/aqgfA0QFi98gXYG2@casper.infradead.org/ [2]
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
[dropped the early return]
Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 drivers/md/md-bitmap.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/md/md-bitmap.c b/drivers/md/md-bitmap.c
index 5f1637f974c15..02a126968ad40 100644
--- a/drivers/md/md-bitmap.c
+++ b/drivers/md/md-bitmap.c
@@ -533,19 +533,15 @@ static void write_file_page(struct bitmap *bitmap, struct page *page, int wait)
 
 static void free_buffers(struct page *page)
 {
-	struct buffer_head *bh;
-
-	if (!PagePrivate(page))
-		return;
+	struct folio *folio = page_folio(page);
+	struct buffer_head *bh = folio_detach_private(folio);
 
-	bh = page_buffers(page);
 	while (bh) {
 		struct buffer_head *next = bh->b_this_page;
 		free_buffer_head(bh);
 		bh = next;
 	}
-	detach_page_private(page);
-	put_page(page);
+	folio_put(folio);
 }
 
 /* read a page from a file.

-- 
2.53.0

