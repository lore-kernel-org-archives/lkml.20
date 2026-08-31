Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011032.outbound.protection.outlook.com [52.101.52.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D34377A82
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788204369; cv=fail; b=MF0rH35VtZ9Y8U0uhVJRynp8Ok6Tbj3ZBxHZ7Dcgq4QQtdSfsVKBiQ9Qy96CcDx9ZlFnvkdAYSDxjHMScR1ASBhl7ix1VoZoEePSQvFF6U3nFeUeVJ9+rE06fat4s+LC3IWGLu8ldppBpxWdYwZrxSprm0B/c0IiU2SDebQ8sh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788204369; c=relaxed/simple;
	bh=w9Ohb5mo1+AyflUcAN7LYLdvevdRNQaZsGebZJ5kAlk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TIOPFhozKTiTwSob7eraW9rwMUG6cYKJIBlFysP27LTTfP63piE/C+ow84SaPPuSEe/Eoy5FGJE0snlSEdl11dYcG3Z1Y0aRyteexmUMkYoZHdgPkcCg2xgv8IZAuPFJDAN5lenBsrc39PH3EnWch7GxGKlVi8xAISxeUaBsM6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=j1ymtVBr; arc=fail smtp.client-ip=52.101.52.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="j1ymtVBr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ddbMxkwfQ4sBexT5Wtffmk2NaD8EcxHuURhMU8etJvSFf1tIvdeRQj7+d0Lf2x/OlgU0EIkOFc0u1lvI0DutAC8+kHgXWApf8p55WyRsK+5xuYYoX5SR6PITRg+PBbfcgEveht7ueduv/+d1kkVeHbq9s1n1KmsH8WWNK5kVYSzQSuLds+4LQ59cvFoYkOpb2+oa+oa6zlEE3TiwvwzvGEVqbOXHYBHGejSezjxKR5pkS3E1WHWbK5qlIMg2cTXDa9u/cJUVtpGhtCN+CKSTkiszAcyzw4VHQ5mcpXrwNHhMJbhmb79FSbbspGmrDb2crbdoZsNDhizpEQc0DTGAiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPJDDJcKa9lvexi7Wypu3m0WvDuY+EowhGLAL4uORvw=;
 b=AdXMfwAYaQIl6uTt/PkVsIeF1mRd+Dy3VBRxkXdRv0vR4hgMuekizA3zucp8tk6nHqCsI1I/WVH8bObrrSx6h07CTp2p3yef2eDt+j/tcX760f45a2jb0dnG7TEyQzC9i0CABT/zjclVCamI10gRpeEsGwj7vbp2bpUmDutzOJyzMbTJDWW3P6oLOU9ZeGXK66UvQWV2GZoiaRlSTuzPC33d3v11RAp9lOW0RO4Ud/2v87opz2KbXmUUA3oBV6VkB0agFNl92svE9KEGmwXepNrb1xKemhPH5ucj0pXOrfgEo5zqemzSUP5AzhQRJ131HTw+QSbNMyE9x5RIt9dCUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPJDDJcKa9lvexi7Wypu3m0WvDuY+EowhGLAL4uORvw=;
 b=j1ymtVBrZKTRb5u7ro5RNr0iGxETNsm2rTaR2VYFnzOuRuh2/ZX9LD7d7AMj+ZylYyK+KFxWKZAB0yh0ivcV75HmWjl55A7nzCHWozvc2hpYqZU275EKpcxhYvRMP0LT9z1O/aV8yxPyqkmEYeM5L85WPMYnRMHELGPPRW0tmeCpghzc+QhZ5RxvC4SNX77KyoycF/yMo8oti/F+U2Io1ixfnxMDeGpK4m1P1u8JFHZa+WJzwhNVMecjfvIKnl68IaTcLktbEQfwl6MQIF9iCrIx/Fg3vsPyNhjH9M7iIg6It1BLHpju5oWGNXeaPxNsAyVNVDSuYH3/RNhzOHQwrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SA1PR12MB8742.namprd12.prod.outlook.com (2603:10b6:806:373::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Mon, 31 Aug
 2026 19:25:50 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 19:25:50 +0000
From: Zi Yan <ziy@nvidia.com>
Date: Mon, 31 Aug 2026 15:25:29 -0400
Subject: [PATCH v2 06/14] f2fs: stop using PG_private
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-remove-pg_private-v2-6-3668159cd9e8@nvidia.com>
References: <20260831-remove-pg_private-v2-0-3668159cd9e8@nvidia.com>
In-Reply-To: <20260831-remove-pg_private-v2-0-3668159cd9e8@nvidia.com>
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
X-Mailer: b4 0.15.2
X-ClientProxiedBy: YQBPR01CA0152.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::11) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SA1PR12MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e44d3d6-7e27-46da-673d-08df0795a8e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|56012099006|10067099003|11063799006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	yrYgEWOvIqv0iriZ5z8SvtfyHNzNWThtT8NrOO7iVBrtNSoh9xV/wuHllwTxcK7ShETe5GiC1YWUmPrOfmcaE/mfKN1SbLmg4HHHs9uuEWBftm2HBNrFv3wjQ6mrLnHRv5VnRyuYFS+DUTwl7IrRCbJJaN0kDRVOxqKGMkGShRujTFV+9yZY59OYslZ31RfdzbqouJjneDIcWbF8VUP4aIgyvggB4PkYBVyVqBNNxy9Cn9MyxGAIF77gcph+969EuKiSE+sPoKR2I7T+dORub9+Khr3FNFYRXwlYzkjEdpE6CCz+UHwoWZrZh4yx9oWpqjATW3tQrPhlapbqGczGBRfm5arjz2nDqTLILXFF2Q6UA0OJ5nC+ZQO6FyyxmWtZZp6MW2c+KDq4101y9atBpYBD3r0KqPO08DR7wb+GfpHkwv/hgmUeqfWkY77P7QS7mYtt+QQzNOfL5WKUsJvHndN3g2YLRg93nbRwqyjeDAWbARtLBaF7eDc5gjGmJKOO9MJQFwPac75rrfDrpwzU1U48WDse1H9MryaR9sEdL18qc/IUZwqVCw3xa67WVAlcPj/OcKDAZ3B4bivn1CSY1w63v4l8xllLfZyOHBOXcWtj24w02WJfsRzdOSXIjAvSZ0bo6ZrY7x4sCsShV9RWqjzAskVt1jjtLBSX/1RPefvv8sluJcjgTwAbGs5sWDE9jreN2rfQdKx7vdjdXMQ7fg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWFaUWRLdUlDZ25CamxJcCs1bFNWbGRRdm5OZVFoZUNhR29KeUo3ZmNxeWFE?=
 =?utf-8?B?bXVqQ2JLSk9jQk1pRW1UYXQyTllPcFlrbG13N1dneWgvSGtJbHBlM1ZGMTZj?=
 =?utf-8?B?cGhkVUY4K0ZITTVlTDNUWDFLV1ppTE1SNEFuYktyblUrUVFhRXdmejVwWlJr?=
 =?utf-8?B?dmh0clQxN3J6RXpVSWlNVjFGdkQrcTZiUldBZmxzZDZkTkdNeUlPdFhwd3lm?=
 =?utf-8?B?QzFhTGVsdzhUWDNrMEtaMVcybmFFMHM3YTFpa2JheHJoWTlIZ1hOQjU3NFZw?=
 =?utf-8?B?Mm9yeU9rbStwVnpTWEloTU9TditDM1FjM1E5dmgzVkFSeERIYWg4UWhtNklu?=
 =?utf-8?B?VGFEU3RsRU1lVlJhWjM1anB2YUY1ZE53RkZaNHhrM29KQlk5ay9GbUpNcDZ0?=
 =?utf-8?B?MDBwcGV3UGFyZnhXaXczK2xldmhRYVJNcXJBM0VRUzBZUVJmVGVtazE5QnpC?=
 =?utf-8?B?bGdRWmpiQ1pTbXBtSEI4RGNsSFlJdXM5UUc4VWJaeGs2TGxRd2Rmbm5rb2lx?=
 =?utf-8?B?TjhnblRON1Z4dHdkSlBGK2dnWDVrUEpzS0xZcGxWVGlsQzJhUUkxMlYwM1ll?=
 =?utf-8?B?My9oQzlKcG5kQzRHa1NyVjlWcHZVMTgzS0xWK2NWd2EwY0E1WFZhbVZsSlhx?=
 =?utf-8?B?SWY1aGN1YitFTlh2MERHUDBWUkVrTTY4MXlZdGE1SFg4MVp6SlFCYWt4dFN3?=
 =?utf-8?B?Q0pjYnpSS2FFQnNveVB2cjQ4TktINzlqZVV4L3pNY3FNNHJURWFTL3pDemt6?=
 =?utf-8?B?ZUFJYUNZd0pUMVd0TnJDck5UQzJHYVRQaVBROXFoTTdOUnJNNDZ4U1l3b09N?=
 =?utf-8?B?ZWh1d0t6YVdnZnVvWDM0YzJLMENaTFdBNGUzSjRTcXlYSEp1Vy9IejFvenZj?=
 =?utf-8?B?MDNxWWpnTWhENmNTWnJMRVFueFJRS2Z6OS80UmhoZ3VlRmcvREJXb2dVMHQr?=
 =?utf-8?B?M3JDNzMwM2hBemFYMjNMUGZXa2hQcnZZV2dNcDVna2JHcktNcnVHMXM0MExB?=
 =?utf-8?B?b3BBMm13OW0zSmN5cXhTOGdybzR1OWc0Zit5cTl0V3E0SE9lUXdFbG8wa0Z5?=
 =?utf-8?B?ZWJUcHRQWjNJY1FwQ1FVQTBlUnlaVzk1Zzc3TjFqYWxuM0tHQkVIVUlDUzV4?=
 =?utf-8?B?T0NhbktsdGcxRUxKdjRNS0NucXI1anhNRUE3L21pWEhSWHdlVzZIME5mdEE3?=
 =?utf-8?B?L0FLclZTcDNVRTJJVlF1eW5WWU5oRkFaYmtzR1QrV0xrTGJISzIxcU16cTRs?=
 =?utf-8?B?SHYxWlIraVhWQy90UGhnMWpXaUxra1R0a1c5Vml3NG84dkUyZnlwQkRFUzFT?=
 =?utf-8?B?NVZsNENUMXlmc0Nia0pjZi82WTBCMDcyQnRDbS9GNTdVejVCZUhlUGxUWkQw?=
 =?utf-8?B?N1Nwc3NaNXJPL3FJSWtjVmllcDZORURMQ3drb2NWWUxYS2VnVjNyTDhaUHp5?=
 =?utf-8?B?OFY0dVN4N25Tek5vVHNFT292Yng2bE11OEJNcUpHb01pby95b1dzckE0NlJi?=
 =?utf-8?B?K1lzOGl5QTJsZWNvdHBOOWhhajBRVEUvQk5sc045cGl0RUxaeGJyd041LzFI?=
 =?utf-8?B?dnNYbU1OTHdXenVISjdyL2VSUnplbTVZMEFBcUppNGlZMjhqaHd3T2k4WkRL?=
 =?utf-8?B?aC9SRHpIeTRlL3U3VHk3OFJSUWJSV3BBeFNHdTl5c1VNUFNSd3FQUzZTRnNJ?=
 =?utf-8?B?NG9wL0VZVm1Ndldjb2FrYVRiM3R3WmluVmRYN1VMK29QNEFiV3d4Z09zKzU1?=
 =?utf-8?B?T28zcFdIUGxYRktta1U1U2szZnY4bU9IcjZjL1VONzVvbnFIOHVZQWk5SHhX?=
 =?utf-8?B?dEM1aEhwTExzcFVvNVRPT3FpNTJKK2xBV2xzSzRTRnkvS3p4OGVuMzZ6VjVL?=
 =?utf-8?B?cUw3bnY4VkdvcVpiY1JLNWNDaEJrbzEzcWxXakZMb0RRMFdiWDNFeHlJTm1W?=
 =?utf-8?B?a2FseW5GTFY5SVIyc2VGT0lTMVErUlhGclo0MTVSdTZabnM1cHBzTEYxZERX?=
 =?utf-8?B?dGtUUlVSTTFyb3M2blJUQzdTMVpDMXlLU3kzN0c5M0VjNm9CeXRrcm9makxh?=
 =?utf-8?B?UU1GRTNtVm05SzB4Ni9lNHM5dUdVYWYwckRLNG50aHFPcmZNRE9XYW8yWDhw?=
 =?utf-8?B?TG5NeFpmeUtEYUtTYU9xTC9JVVM0cUh6OXk4cDNTWW1BdDdSbjRkTlRNNktQ?=
 =?utf-8?B?am51dUhTSWRHQ0ZuSlBKUWF2TGkvOVlxb1NtMmNkc1FOM3dHd05tUWR1S0Rs?=
 =?utf-8?B?dUZCM1RDU3RmOVpsekhkQ0p5VUVFbHV6TFJwTnp4SEZLMGRQVE15cFM1eDBL?=
 =?utf-8?Q?K2rt57nUk1369xtLxL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e44d3d6-7e27-46da-673d-08df0795a8e8
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 19:25:47.6611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fK0nlask0fl3Llr8ZeIpXxLcy3oOfUwyXTcL55SHI6Moup45u3qsqZIz9d4/vQkm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8742

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

Assisted-by: Claude:claude-opus-4-8
Assisted-by: Codex:gpt-5
To: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Acked-by: Usama Arif <usama.arif@linux.dev>
Acked-by: Chao Yu <chao@kernel.org>
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

