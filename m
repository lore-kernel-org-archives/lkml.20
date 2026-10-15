Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012039.outbound.protection.outlook.com [40.107.209.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6204F392811
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792088036; cv=fail; b=ZRqYX4DyykyFqClf3MZr2cMn0rpTJ7AkoLun34lyqF04e0wsJkmT0jiiR2yiBKlBgJyMdGc/TTgxRs0BEEmhP+CG6apz0M3ZbynWxc7mj3szdBFZ1aanJF7VqZwG9hobj9EyudAiyVEDzwMh+rwTu1H/6EEKne2FddgPtwhM/vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792088036; c=relaxed/simple;
	bh=YT8Z8lGL8hgshpnA/RFDKIvOgpc82FciVQfWXf2YioI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=EQgk2A3MMsAAm8NSnb6WL9LQNqFe3AvXKRQgyGsDZ1envSAYNuCDj1SA164diFEMUSdcC+4sx3s6a3ySOg1g7oU4czlZYhHby9h/sA+isLSfOso9QL6jAAeozQSz0n9VjgokCxkU/faTV+LNFOf5e0SPOUm5AdWtB1nN4+Vq/r4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NkKxiZuX; arc=fail smtp.client-ip=40.107.209.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NkKxiZuX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0Ku00z3j1C2W5o74dW7UKyZNGsbooQw2p63HM35hLWQhzHIdPR29NUTQ8AcNXxAcspbK5g2fVOKkyduJgGTJ4zH7s1rGu8lYCEd3QRnjz45vLu+6LhE/0JbstaVPmJNgfSZFWsFipqtdOlBKlH0INFC7CdGEadpAKsQtFH36gQV4rQxSeXlPaphhltyvTASOnrxvJT6S7rhhP/AxWDagdvB0YLnFxgibQEDpykZFjA6xSmQ6JByZt5pscSAhgZLrCOLevoXjvua+I9rNIjJNOb0FSgcaLgZb1ouSL05ijnH7xIDW1VW2z5BpC2vkThNuS3sdzEYkG6WCr9CQaLZvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEqsCkqaYkWu5OZuS9wQQNLA6Vv19xX/x+/7IITAQPk=;
 b=Auv2l6XUhAbejkks/u7Z4Vd5USVqhZ4tCWl+WjBCa/69Lg+iJPsSNE0AELEUEvJIB9piwEYqKdtchQLHhkmh3O0LTojs289NGxPqXG9MOi7rsv00zZkWYJK9V8RGm5k8QC3zeYS7c2IbU1TmIqlm7cBDJS0eF+OqiMMm4WR1hbzPEx9Hg6pAmQjpNYtD2UlhDL4mSar8CKpsgTNfOwKpchbQtFUI04FOnw3+cx3nSqmCjbplfSqNex1Hkzk1199ZCqwkWoNZx9n1v6Pqx9Z/sEv9S17XA231Tf/9QpelsUMn/Q3x6Ge8BLdsGYJG1x9smuyOlU9FGkOi1C9nPKHInA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEqsCkqaYkWu5OZuS9wQQNLA6Vv19xX/x+/7IITAQPk=;
 b=NkKxiZuXAjfNGOS/tupvhltvFizyBgB6HDuA42mRN85ZjEJLulWMGbvGIfoRa9lFMLGPK/Ige3WvhrDWG8dxiwqRu76BPheHChpIDyudUfwjwLyMFmkSkC9THJZoCUHGClgh4zTdDw0zl0Zl8/8PZghFGzXE+iDwWJ6Y3SqUQdzlwyBhx+5ZlsjQccrAhGikOGe6JVrs0XJurOmvWdJlzfaiKWSPs1ZGZJ7T7DuMB8uRzF6pow3TkZW4nwYUxv1Zdo7KMq/ne/qjjxWlM/fM582vUf1/NLQ2MXUtb1d5rhz19LkdJnDDbnh18BcmGMJiPDTNUTT50+pwB6GmKYAf5w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DS0PR12MB9058.namprd12.prod.outlook.com (2603:10b6:8:c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 18:13:23 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0472.016; Thu, 15 Oct 2026
 18:13:23 +0000
From: Zi Yan <ziy@nvidia.com>
Date: Thu, 15 Oct 2026 14:13:07 -0400
Subject: [PATCH for 7.4-rc2+ 7/7] mm/rmap: re-enable discarding lazyfree
 THPs at PMD level
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-anon_vma_uaf_fix-v1-7-7b977303b42b@nvidia.com>
References: <20261015-anon_vma_uaf_fix-v1-0-7b977303b42b@nvidia.com>
In-Reply-To: <20261015-anon_vma_uaf_fix-v1-0-7b977303b42b@nvidia.com>
To: David Hildenbrand <david@kernel.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Rik van Riel <riel@surriel.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
 Jann Horn <jannh@google.com>, Kyle Zeng <kylebot@openai.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Zi Yan <ziy@nvidia.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: YQBPR0101CA0244.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::16) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DS0PR12MB9058:EE_
X-MS-Office365-Filtering-Correlation-Id: e6512b67-dcdc-4f82-a816-08df2ae80042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|921020|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RJtm44WJdxe/1BraaYiooPrEjOMo/25ZNYPw3+/7bgDu6YiOe25xXWoOPi9KrtZ9PH1J0EZpVGHwHd2+qbJy4LOLXKICyxjBTS6Te6QhrW4zRzROr0SYhSWDWBKYOclEHbV8SaxKRWt1FVawJQez7XIM21AZOQ2Gh9eby6y5/FKYXHPdgrEQutFaNIPMprwJRioY98BwGN83jkH2GtFd06JTgmw0BSQwP2dQuHisgErNSBa9SDRVCLynkEz8Xp0RCXN2A1qdaQCtcHD00zZ8JXVlNVCas2SBjz284Em+TMojcI9LbcChpnJzVPWu1Nuo1Ura6mkIobQp18KZuwpLf9o6awm4ZhzXvE46Kt0e9l66mS6Y1zwxr3autxnRZpamOeCk4sPhp5/dVbMNA9n62tZIqZd6qFhvWaBQ1OeomJ2NXaQu5BnD9Nq23Fo+Sv8u/Vxrw45wToBowZOqYtXz7C/HUMvWm3789e1k/P5UwXryrqxiPPeZGpESgmZ2JPuUhCrv2xssi9gYBRiQOU08WNi/9L3rUEEHnSN+CLX/CmD96iBjDb1931m04pgGTbJqmHtaAKQodJQS/6+qophpuEYzyau75mk+zz4X1ytqSvyd0DYc38vcX/gx3xaSUAIno8p47Y3u4IEEzNCP4XWg024R0epSNipVuQH0scZJpR2qpgyoTLRu6E93feUPXmauMdGND8dwzh7B9zcyG6Qnfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(921020)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzNTeEVYYUR6ODdlcmdVanErZnZHRG4wWFlLb1lUNkphMkRaZlFYemsyTkVZ?=
 =?utf-8?B?Z1NhNWlCdXJPM1ZzZ2t3RUlyd3BxQWQ5a0V0MzZrUjBPRWNsU0x6VDRJTzF3?=
 =?utf-8?B?QmxPK29MK0wzdUZOWDlaTFZlMFlrNDl4TXF3cXh1bU5TR3lwa3JlbFhVV0NE?=
 =?utf-8?B?WndrTTNWYVA4NURnbFNPUy9udVhTRkM2Y2VUWG5MaDlDdTFlWlI5SCtaRVNz?=
 =?utf-8?B?d0oyU2tjeE5pVUkrSWVkZGllS2FXTlJQVHMzanV3UEpJUUtkOFpWVmRTY05t?=
 =?utf-8?B?ZDdRODhjRVZpdm1vdm9Bd3IwaDVQbVI4MUtmSHBSUDFCZkNLZk5GeitnZlRw?=
 =?utf-8?B?Z0JOMW45SjUwZ0hJWEJHL0dnYjJrckdQajhVL0w0M09XSVRGdnlWSGlrd3gx?=
 =?utf-8?B?TEF2Z2srNWhaRDJTcnI1WmtqYmkyUHZjdzlBd0xTeWlLTGVMUWlEUWNjMXhW?=
 =?utf-8?B?aDduVzdleFBSVVF6cXFlQXFqemREaGM3WGRoek9iNTI4cXRDZGY0dXFLN3hz?=
 =?utf-8?B?TWt5WTJpQ3U5a2RLNDZFSjhUQlFLSWdQNHpkOUs4NGVwbjkzdi82aUVFMnRm?=
 =?utf-8?B?aldFZFZTT3R5VGRncWZTUFZjbXZhYUlubUN0L2oxdk5RdWtRV2Z2RGF3NlFJ?=
 =?utf-8?B?YUNZY2tUNUpEY2pNcTZYYXdkMVJJeFNiZWFsT1dNTjZCSjM3TmFDSW5UR3ll?=
 =?utf-8?B?RDBaV21PSHI4cFB0RUVNOGZZMHJKVzRpTXlKM0U2Y2tIWGZqd1pTWVgrZG95?=
 =?utf-8?B?akRMY1ppMnlyLzF5c0wxMVhkNXVINU9lWHlFZ2RXQ0FBWXZwMzZiRGl1UUVG?=
 =?utf-8?B?MEIrQVI4NzhMNUo5TkFCRTBDem1rOEJjR01wYnFFdlhBc2Z6VitxbjM1bXc1?=
 =?utf-8?B?a0dvamtheFU1Qmo1Vk9Cd2pXbjRlUnowQmJYSFQzUUI5UzRZeCs5eGpzS00w?=
 =?utf-8?B?U2NUMzZlajJEVEUrdGpIZTk3TDNnNTJBOXVlZkNxaHNEUE5Yd0dyY1RQKzdL?=
 =?utf-8?B?U0lpSGRUY0N3RVM2UmZpd0Z1YUJPSTlBZ2VYaXM5Zk1FVkxjelgxRmduem00?=
 =?utf-8?B?cUxQWWlDb2xtQlM5OVRwMjZFdGNMMXd0VEhBN3UzOEM1clRoeU16OVkvdWd4?=
 =?utf-8?B?dGNIMlJ3Q0Y1M2h3d3FsVjhZQ290YVo0T2RZQkdodG9uc0d6RmQydzRzbnR6?=
 =?utf-8?B?eUc3MlMvUXY3bG0rL2RBaFZyYjdjaFZiVDFRMS9FaExDek5CVzNCM3hOeERO?=
 =?utf-8?B?a2pRTkkxc3dxK2x3blV1ZmtqMDNWTS9mYkZLcTMrb1BBWDFqZjZ1b1N3Y0ND?=
 =?utf-8?B?bWJjc1BlK0J6Rncvdi9ibHZnSWE1Ky84d1ZpQXRrbFkvRHlSa2VjVXh3dDR1?=
 =?utf-8?B?TXFlNjNmL3M4ZjIxZldyYml0akFPRm00cldnQWJRWkVDMTJ1ODVZMFh5Y3lZ?=
 =?utf-8?B?eXpmZHh5b3FKeG0rZzEvVXhkZmxBSlR3QzlCeSszc015Zm1kcGRjSno3YjJP?=
 =?utf-8?B?VnJmVkMwT0pRSmhKVFhvaGJyZEpKOUlWcUVsU3JtQlNuR2J1cFEvMmtLVDdV?=
 =?utf-8?B?ZDh2VWNNM241dnFjU1lpTlkrYVprV3Z3Q1B3TFNrV2NoZmRJSFh6aFE3Vyta?=
 =?utf-8?B?TUdUcnFuMG96QnJtOXEvajUraFlsU2wydWtvRjdKbXF4WExlZmtOZlRIY1Fz?=
 =?utf-8?B?UmhDVFlFUkRtR3pHejJ2WlJHQVFmR2NxWUxRUitWQ2RrZnFDb2JQL09XbU5J?=
 =?utf-8?B?RUhKWHZMbFVta2g0bkgzemprc3prRWUraEFhZ1E4S1NsNTdTTU41c1lKOElv?=
 =?utf-8?B?cFJ3OXFnNU9PZXU4L25sdllueEE4dVBpRngxOUZ1bDF3bE9vUUk3bDlOTFp1?=
 =?utf-8?B?dFA3anEvM01oMXQxcXBOU3Vpck5xQjVVclR5Y203NFlPR3lGMk10TWZZYnFH?=
 =?utf-8?B?akxPRHB1MlMwOGxUaDh0NThKTE4zbmpFdVlad0dkSmFLekdaU2hsanNBYnE0?=
 =?utf-8?B?R21IaGpVb1FmczFPVlV4L2tBN3YyU3k4alJ1dWhZZDc3L0lUbXBMN3RWaFZM?=
 =?utf-8?B?T2Y0bThKYWgwc2pZcytYTitldFQ5U0tUMUc5UzNEYkxud3AyQ05VMU5HRE5j?=
 =?utf-8?B?Z05hK0dLejF6aWNhbkluem84d3V5cG0zbVRqNTB2UEJtak5NNHlONkJGTHFX?=
 =?utf-8?B?SENkV1NJUGtpMFh6K0JVSS9QZXgvRVBZZGppVHZGUnV0TElXTDNaY2t0UWZI?=
 =?utf-8?B?MWV1QytVQXY4SnVvdDcxRDBhZjNUQ0VWZ2ZrOTRTMjk0RDF4ZkdhOEJjTkpS?=
 =?utf-8?Q?mwF6vHv/d6KV61kqLa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6512b67-dcdc-4f82-a816-08df2ae80042
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 18:13:23.5769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: USHBwXWftIUg4ADgyi1wV7ktmQza4PVGmp83ibFY2qJJ219mERAtil4XemalrZHU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9058

The patch "mm/rmap: don't discard lazyfree THPs at PMD level" disabled
the PMD-level discard, because it cleared the PMD before checking whether
the folio could be discarded, and munmap() or mremap() could skip that
transiently none PMD.

__discard_anon_folio_pmd_locked() now keeps the PMD invalidated, not
cleared, until the discard is committed, GUP-fast no longer follows an
invalidated PMD on any architecture, powerpc page table check no longer
counts an invalidated PMD as mapped, and sparc64 keeps thp_pte_count
balanced when an invalidated PMD is set again or cleared. Discard lazyfree
THPs at PMD level again.

Assisted-by: LLM
Signed-off-by: Zi Yan <ziy@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@kernel.org>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Rik van Riel <riel@surriel.com>
Cc: "Liam R. Howlett" <liam@infradead.org>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Harry Yoo <harry@kernel.org>
Cc: Jann Horn <jannh@google.com>
Cc: Lance Yang <lance.yang@linux.dev>
Cc: Kyle Zeng <kylebot@openai.com>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
---
 mm/rmap.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/mm/rmap.c b/mm/rmap.c
index 1131b76bbbc28..805db93fe0428 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2275,6 +2275,17 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 		}
 
 		if (!pvmw.pte) {
+			if (folio_test_lazyfree(folio)) {
+				if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw.pmd, folio))
+					goto walk_done;
+				/*
+				 * unmap_huge_pmd_locked has either already marked
+				 * the folio as swap-backed or decided to retain it
+				 * due to GUP or speculative references.
+				 */
+				goto walk_abort;
+			}
+
 			if (flags & TTU_SPLIT_HUGE_PMD) {
 				/*
 				 * We temporarily have to drop the PTL and

-- 
2.53.0

