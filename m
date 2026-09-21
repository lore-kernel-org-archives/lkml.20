Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011015.outbound.protection.outlook.com [40.93.194.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1287231F991
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789957719; cv=fail; b=GJ42RyV8iZEuBsDjBF66pfcGge17KzIjKimHeFhfkWA4Q656ZkIJmDPYWG9Btj7n0lmzUJfdftPr/BMg7iGNzW3GlfN1qiAf9DT1X6wBJ/g+6OESK9F6/sksfrtzOXgP4Pfb6NaXSZmKCkW9NMTC6wnFHgzG7OhF8dJlayKPZ0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789957719; c=relaxed/simple;
	bh=+rT7/KtC3fAnUvvVUrlRiWkAk2T+Z9Vx+4Kk/n7oazI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rUndM1Uh+W6MDqH6CqWIUWgO/QEHsPsr4gAT4m7EaakZBTwyz0jYbxbJWrDbZ0SGL217kudbps8BDPrVqYIVe7ZxOZsJpbWQfOnmHwpvVUFEpM+v2ee3F6ye3CEVG7oApWy7p+1qnSWQUtyCgKIjIfUXc/IfzG4758LPMgRk7u0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=g+d7GYk8; arc=fail smtp.client-ip=40.93.194.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="g+d7GYk8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K2a/E8/aT78Hd831bXVCei9ORV14o9PHuxHxGYVzC/c/R1Nj/rh3YSjl2613AgC6FvgUUUvfrXoUiFmNlnQrlI6vnJcye+7XVFRV80iK9eY1nPy3V095wjP+oJzqsjuoKDgvYfDUdnjnhaXetmTnv4vrZoc1Kbq3Ow7joRP33XE7eYbJrMqUzUvecikhl5iZXIKJnhBobioaXjJnmiwSs3ztrwNcc1XJc/qPwmcn1c25VQ6OQOMh3bisu9PPXKq/F3dPP5JRUSQfOsMURPKfso9SYhROcBM0bAO87TiKBFZGg7ZImCHTtMZiBSxCihwvMYlhLvjHMVOtrAXXcr0PrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFPdvSUP7nFS+Sg4e7iNiBmqdaTXK/HCklUfC4M3bUU=;
 b=FcePS0wvEp1bPZFHvymvjcXMCKxi3AJrT2DDKnlegQ3ZhkGpNLxOYCSwscrYNoo6BFW6/B8t7uj7JMFPukSUqsNEEol4f6wDdhLuucPEStHabk782knyO6A7y5aZt3+JA+MB81w2xs8D/N5wRLtNrU4pJwKlENPO1mRHvyg9p/4oJ/VkGF7v3nOjTpv3O9A3Uo5gmLoRgzicJFtSKWL6JYq6N5Yg4DK1n+JcvRTwDZloZw2+wcSjCoA/1KEBSbrTJVI2fpXC3KlEO6fV/mui7btm1RhbVSdqbRE2/awT5xZqi5+zxEY0l09EvJ0l6LvEVDlnfX7PqehhT4T6i/FkJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFPdvSUP7nFS+Sg4e7iNiBmqdaTXK/HCklUfC4M3bUU=;
 b=g+d7GYk84BgXRKvp6uuzWjSdGSHOyh8/JZw5LfywNU3z9tgMlAGsgppyNSo+Rq3SsHUocKufu0H14FRk49Mg1SZr46ZPaepR01iELV/EbIGnE1CO95nXQkDC+q0YlHZtJ4s1Zh2Ci2nkQcD3SquCnn5vyHw1JKphzhidA3j4PpT8MeHfcR+oLlhQg7HXR+kser7msTO15obEX3nLb2g5GKVMMBd30uhT4J7lgDz/N4wtJyIwT38y41+nSj5OZeLNEJKkpmcOOb6rQFigoVpv6Z8OTsuyB6lmVtJXPZZx9kM6piBSLqCLZpsWN5PnQjenH0CRVUoimvOWzNMyevlCjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DM4PR12MB7719.namprd12.prod.outlook.com (2603:10b6:8:101::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 02:28:27 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 02:28:27 +0000
From: Zi Yan <ziy@nvidia.com>
Date: Sun, 20 Sep 2026 22:28:02 -0400
Subject: [PATCH v5 06/17] f2fs: stop using PG_private
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-remove-pg_private-v5-6-bb68b6a21869@nvidia.com>
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
 Zi Yan <ziy@nvidia.com>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
X-Mailer: b4 0.16.0
X-ClientProxiedBy: YQZPR01CA0143.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::29) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DM4PR12MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: cd715e63-6b5e-4cd3-761d-08df178804b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|921020|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rJAWPKE4kF+t5waFgrgvxEyDpeaATlwwFdQCm2pcY68pQrSw9yJMJFPPMHTlYWoVH8i2GKG9lbCuTS/sSG6Vaw38Ppr22wBudOGwHyhWBxdz58ZVBf63tQNEeNzNzjSMXOmodLyv4Wq3xOq2JHNG4hbGJmzh9Om3U5eSYTGjM4293/iQgItDCBHbo0jcgkRhx/kEa7ZwmzM8N1QtXfamSCiO4+EVSka1DrH7J54r/v8wTgClLo//Hs2fbK8xKldSimmGMcTYDAEMzCmeOLE8fpvu80jbI0Z0HvfdusM3jw7WXn6D4CIfKdw6/uJBs6MxYjtyT0etrIlLyTxpU1m+JVXee6NCeyHDoqhetOYRcCPqhH1zNgNa52nuvs7Rr923XHTEjBb3disLKRWstvKRjvcaFSnFmeS4ZE44PSeBy182/pM+Yo6zsdYqZWjhh002ob4dpIf/4I1CenrPZega6TKrFR5yZpkDI/jX2XbafFaYD1Lq/4Vzxa4kEyjEI/UxYnBdKeAeG4TUB+ZKbXGSB1ZoA+vWk24ypLfCN7PTB6GhFWPNsaAe40k29Ahj8fcvR79nkvGjoUDVkQUIL9l+jd7HHsHtpC42NjgDSoFD2nOzaNzHiozar9patYGxmHPR1iuTBb+CdahjxrEifLwo79vjjx1wgbICAfXW2VXk90WVZnKSGSpHqDO902pTh8e//hgemlMF+uxDYTFhTMS48A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(921020)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0gzMTUyZDNlVEUrQXRyT1Qxby9hSzRsZlIvYXMzby9DS1RUVTNtSStXSUVx?=
 =?utf-8?B?UWszNHBlanRjNGZweFNRcHJ3QnN4TThpNHVDdUFOa3R6VzdsU3ZGZ2JWK0dH?=
 =?utf-8?B?Y2lJK1ZOdXQzRkRaRHhLTDUvQnFaNDd5MjhXbDRESjBWeWpEK0FXd3ZWdGRo?=
 =?utf-8?B?OUsrNXFNak9hV1k4Sk1CeUhCNW5oVFVBWEVaK1M0azhna2ZsQzFmUDhIblEx?=
 =?utf-8?B?bDZqYmFTRktCZ1piemd4b0pYRU5KeHIvZU5RWk5aRlhxQ3ZnYTVvcjM3R0dV?=
 =?utf-8?B?N2U1aE1qWFo5RlJNNzNHRFM2ZDJzZ2s0VkpvQkx5NkFDdzR0U1pPQW5teTBR?=
 =?utf-8?B?M1FNbE1DZXp4dGRpQmllZmtZRllwckFoMCsrRDJjSUFqM2FvMGJQeFFLSGJi?=
 =?utf-8?B?cU5pTTRzQU5sYk9TM0JKd041UEVoK0ZVcE5NQk95NGhwUmJjMkFGRkpSd2Fm?=
 =?utf-8?B?blBBTUlCRWVhb3VXanJaczdzWGx6MTV2SC9QZk5xSXNFLzIrd3A0ZzViY3kw?=
 =?utf-8?B?NEtiYkFUY1RRMnFDRFdxMHJrcWlNeFAwNVpBdzQ3VEdhZ3ppRjJJQTZMY3Ju?=
 =?utf-8?B?OGJhQVNuNVRSRWtWNUVSckJnRVpaLytGWWppMnVvTDNsWWNmektCWCtRc3hu?=
 =?utf-8?B?L21qNUZrdjhZQUpxMnBLZklPUVJnSnd6Z3VZY1dHVjBHWUZBa3RqTlFUNVBH?=
 =?utf-8?B?dHJxNDNlYkVtOW9oRnllUmtGbnJQbFVjL0pSZTVCcS9aUFBia0FMMTI3eTRD?=
 =?utf-8?B?ZXBSZnJubldsc0xTZHM3OHVYN1ZIOGFBSHhwWjhmUHRwbjRxNW5IMy9aOWJP?=
 =?utf-8?B?VFdYMVQ5S0t3bEJPcjZ2dFhacWVUUmpJdEdBRVlGNG11R3ZIWlg1VEZWalJK?=
 =?utf-8?B?VUxZN2ZnL0E5VGFPNjh6bjQyMm5CN2hLNE5RNFZRaDcrVEtIMWJmdld0dVRy?=
 =?utf-8?B?L0NDaGhtRXVKMHplbHl0d0hITWRNdWo1QzhtdUdiY2N4ZkxRaUxSNnZ5Zmdh?=
 =?utf-8?B?d3djS0t4RFdJTmxHK0gzTC9DWjF5cFkyVUhjdFFhM3JCU0VQdVNHNGVjRVpr?=
 =?utf-8?B?VGNKZ1M1SFlneFhRZWVybFNhSVVtc2k5SGw5VTRnYzRLQ1UvK0dtSHNxZGtW?=
 =?utf-8?B?cmFNSHdMN3dZeDQ5bzNSbUNRTU9XMkNCVTdOcU1xdEk1d1hYUTNySzU1NDk5?=
 =?utf-8?B?WXlkRkVSVFcxa1hPaUJvaGdJQnkwK0lvYW1seS9Mb2hmaVVtOTNYdDVvMjFt?=
 =?utf-8?B?aE5oYjg5dzNnTmp6emtBV2R6WC9ZRDhHaVVrbWRVRjZOeFN4bUlPR0xnbUVC?=
 =?utf-8?B?NWNJdUsxQTN1ek1peHZ4VFNxTm5SZGgwdWd3M2IxTVBjdnpuMzNnWkQwNXNo?=
 =?utf-8?B?YWh6UDVSMjZDOE9ra3BzUDFibTBONS9aT0FPblZWZXpQMHdzT2RuQ05CZTdk?=
 =?utf-8?B?U3FxcGswRUJNejhFR1IzWnVRZFIrMWI5TjZZdlN4VUdaOSs4SzZINHB4clFQ?=
 =?utf-8?B?MXREb0pEcHMvZnhsT3czMHhFbGYyMUkrV3E0SkVOM0hDYWNndExlZnJiemdy?=
 =?utf-8?B?ZEwwZ29GVHZjRHFrOWRGZHY3bjN3ZzcyMy9ZZk81Z0hWbGhRT2M0QzlJbUhZ?=
 =?utf-8?B?Zlh1WU5kTUZybzltZTROU3hobEQrZUEvTm1pT0d6c2lQUHl5UXZVMWh6bzFt?=
 =?utf-8?B?Zno4ZStRNnhtaksySWlpRksvNGlhdzJsS01jeXk1WDBkN2pMb01YTEVEZEQ3?=
 =?utf-8?B?NkorQm53N1FIdFl2ZTAveGRnNkpiTHdML0NoK1BrRWMrK204YjBpUDlFWEg3?=
 =?utf-8?B?ZkhHenk4TXRxNmhGL1UvUTdldGNuNUVLcU0wU3E5emVON0tCNFJEME1HZDE3?=
 =?utf-8?B?RDBCTmQ4enYzaE1rZTg5LzVLWDM0a3V4VFZJeFIwaExyakFGazJKcFNoTEFL?=
 =?utf-8?B?d3lmdzdWNWhJb3g5TGszM21rUDVuWHpTMFJtS0NEL09pRzY5dVJUWmIvbkw3?=
 =?utf-8?B?dlZHSWZOeVVhcDJPaHdCZUxUNUhCWE5xcE9LMkNDZDBuK2JnMGlFZFR5RU5B?=
 =?utf-8?B?QmQxbHBFZE9zeGdNcEVSY0NNT2VPR1pjOUhVZHp1dUNlMWx4VGhNNlJEMk9m?=
 =?utf-8?B?d2ZidzRaa3NiOGlwRkdJaFdrLysrWG10Zkl6TEdTUzVHbXBMQ05LcnA4Q0cr?=
 =?utf-8?B?U3dwOGFaU1BKMGozVlU1eWFvRmkyQ3RWQzJ3QzZnUnpBWW1lYzYyNERiRnMy?=
 =?utf-8?B?WjlnVk85VllmeFlOTHYrL3NtOGtNVXFRWGFKQUZySThUdzNzbDREbGJSbHNt?=
 =?utf-8?Q?DOGEd2TkU9hwn8Dk5Y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd715e63-6b5e-4cd3-761d-08df178804b2
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 02:28:27.2918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WD/9sMQINiceqU6AGxsN/CVwvD8RC/8liVN0eEb13GQM3G3CBh9MuAf7rEcrA89S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7719

f2fs sets its PAGE_PRIVATE_* flags in page->private and checking
page->private != NULL is equivalent to checking PG_private. Change
PagePrivate() to page_private(). Meanwhile, in set_page_private_##name(),
page->private is first set to 0/NULL before an PAGE_PRIVATE_* flag is set,
but it can cause confusion when PG_private is removed and
page->private != NULL is used instead. Change it to initialize
page->private to PAGE_PRIVATE_NOT_POINTER instead and retain the original
semantics.

It prepares for a future commit that removes PG_private.

No functional change intended.

Assisted-by: LLM
To: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Acked-by: Usama Arif <usama.arif@linux.dev>
Acked-by: Chao Yu <chao@kernel.org>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 fs/f2fs/f2fs.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9940a6cecf1a2..2f7ab5888b078 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2691,7 +2691,7 @@ static inline bool folio_test_f2fs_##name(const struct folio *folio)	\
 }									\
 static inline bool page_private_##name(struct page *page) \
 { \
-	return PagePrivate(page) && \
+	return page_private(page) && \
 		test_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)) && \
 		test_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
 }
@@ -2710,9 +2710,9 @@ static inline void folio_set_f2fs_##name(struct folio *folio)		\
 }									\
 static inline void set_page_private_##name(struct page *page) \
 { \
-	if (!PagePrivate(page)) \
-		attach_page_private(page, (void *)0); \
-	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)); \
+	if (!page_private(page)) \
+		attach_page_private(page, \
+				(void *)BIT(PAGE_PRIVATE_NOT_POINTER)); \
 	set_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
 }
 

-- 
2.53.0

