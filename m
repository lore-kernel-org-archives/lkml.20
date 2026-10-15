Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022129.outbound.protection.outlook.com [52.101.66.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F3052FE32
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077087; cv=fail; b=IR+y4GYSwEkMR3fXGkqtojpUUWOeqk51aQursUirixAnxEmh5gKay7MUFwaHjOWptThwPiQ9qpymOcuDBHijFkFvPhtDKeUk8vSInEw96RNfSd38s9xJ93I4MGdPplYDqKgl6NRYL7ufLlXxQrGAj8s8Yw/9kiCmawRvVJTLesw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077087; c=relaxed/simple;
	bh=h5aPQxT8gg5jH/EnWzx/zwxgvTneHwmgr5WxgnWGT2M=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=W7dtBgPiCc7C6eOjSuKtz24clS1iE7x6OXvzrnjj4l+hgelWOx8ZG/vXWHGPk7de3ZYiMiT97GflvgAjqm2eB26eOLxBrGFZZVWWk6ZKtKokTAFzwIotrc71aH43mj9thAupktfvPfYo6rSFbqsNTReApjwABMU08bkV5uJpqkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com; spf=pass smtp.mailfrom=codasip.com; dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b=mneWMZcx; arc=fail smtp.client-ip=52.101.66.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codasip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b="mneWMZcx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rb3qseLyF7uCUUb8MNXrP/BSRxFV+38BqbF4irK+d5idXVAoAc8SdG6y0wvPBW7H/Fl1I1bTTwSYY6PUctSQP0glAF6lAT3qWhyZSjqkTVCAQf7KtogWdD5leH0Mo3SvM+lTJ/xG0Ub2h/NPbbBhxuIF/e7DD9bN2TVOXs5eOO9jSvWFyv8e1yuY56VlOVDAVGq8UDrsOS7YX2zTMbsNLJlgRNAPIAy4hnczFCebzkcEUvhqiqxVq027+ZMS88mFLOA57el+annrML6s3wqJM8fMcQEuvdHDpZuuBY2Kcogd/UZIWcxcHLZlR2jmC0DRnsRbHnhpNOEfIVAmkEnZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjo9t0y7lbrWTb8sNA3gktQUTJVy+qQC73aPWvkE8M8=;
 b=A2zi0KW4Fk4qreExeZm+DaR50QuYk+Kg7iUhrnwWhdoQW1plO2NC9eSQ9fsxmrR0DnfmWxaOpK0sZsgwpZp8oZ+hlKIEt1pidRE/hQnCXY5uHWbmUHUXfvlgna/66k4UKVf68gH6tHh/5DyvC5oNGjj7lZqnuAkF9eGl1Mp03S1d6X5KMeODtPXn4UEFnzftmt35Wvr9n4YhkK5Eoo4lc4KxY1xnWMsDc8auJa52ajvOcszVFwEkAka1K/65/OwYa7Glc3JzHz6l9PBgVyrcbcLZpQeDP8OGkFbvlfeu0lfORLvVkh8xhDQHlEUSyqIOjWYp7AXmzYNmdgT7XX950w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=codasip.com; dmarc=pass action=none header.from=codasip.com;
 dkim=pass header.d=codasip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codasip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjo9t0y7lbrWTb8sNA3gktQUTJVy+qQC73aPWvkE8M8=;
 b=mneWMZcxfp+FxRvUES+Q1dzbbz0Xz1N1bEcZACxin9nn+N+IXJYerxyiGeGTt2gPeythBvYp62KQwzmz+cSDeudIeMPYWY+il+uuh/+ZQPCVsdaQZr9Tlat6MTnXhLOnVpVb23uOXsW4zp/1lLuRp7lKW2vrehc1fYAsJMWUfKHxDAl5mnynpqJdHva9iRBzHp79O38dMmj2cR3Ox4SSfhOAvc/Szp0Z6T7XS/EELXHh65dG/FyR8ZjAg2nhWL/YL76EnEMJuwUElBzFU114NKEbjCuX+L3g4HkWFqm6t8L78no0yaP50szJPCVdfGoaqsDUlGNpbkjSSeJYNUqOKQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=codasip.com;
Received: from AM9P192MB0983.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:1f4::5)
 by DB9P192MB1898.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:39d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 15:11:19 +0000
Received: from AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0e5:8465:302:9a9c]) by AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0e5:8465:302:9a9c%4]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 15:11:19 +0000
From: Florian Schmaus <florian.schmaus@codasip.com>
Date: Thu, 15 Oct 2026 17:11:15 +0200
Subject: [PATCH 1/3] maple_tree: do not descend into metadata in
 mt_free_walk()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-maple-tree-fix-slab-corruption-v1-1-160d97f7304c@codasip.com>
References: <20261015-maple-tree-fix-slab-corruption-v1-0-160d97f7304c@codasip.com>
In-Reply-To: <20261015-maple-tree-fix-slab-corruption-v1-0-160d97f7304c@codasip.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Alice Ryhl <aliceryhl@google.com>, 
 Andrew Ballance <andrewjballance@gmail.com>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Suren Baghdasaryan <surenb@google.com>
Cc: linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org, 
 linux-mm@kvack.org, Florian Schmaus <florian.schmaus@codasip.com>, 
 "Liam R. Howlett" <liam@infradead.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3005;
 i=florian.schmaus@codasip.com; h=from:subject:message-id;
 bh=h5aPQxT8gg5jH/EnWzx/zwxgvTneHwmgr5WxgnWGT2M=;
 b=owGbwMvMwMWoZLn8xddWhSDG02pJDFkX3gr/f94csv9f5GZuXoWjadtqxF39mae9+W6s3dds9
 aTykS1bJ+N6FgZGLoaZYoos00tZ51sp3nmY/eT3OphBrEwgU6RFGhiAgIWBLzcxr9RIx0jPVNtQ
 zxDI0DGKh8jpMWhkFheXphbpphUUOeTllySWZObnFevlF6TmFaQX6KVlppVkZOQXFacCjdDLSy2
 xNDc3NTC1dDN2NDJ0cXY1NHNyNXFzcnQ1MjK2dDR3tXAztTA1MjA1YuDiFIC5xuUqB8O6+SfzHW
 1+VjQETJo7NdDiwLO8bkbLXbdTOOO2qdn/23M4vnRr2/f22A+n9vcx1Jw/8sVvb/aTHh6lWNWv/
 HUH9jyc5Gciz7xjwYOLcR//bt+zpFX+rN6y2O27lti929d1IKpH9G1X/83d++ZViHU1XuA++3FC
 etR1TpPEteqspdFa9nnLCo/YfL5c+3nJhvusNafTrpgFpK86bs+5Y/2GyFbF9j9e6iF+k3feZrW
 9lMFitqTA+It6k9RGCZ91Z349+nfnmx7zrX/MK3m/ZMxeKTfdZmJ8z+9ZBbNtDc6s9nXQ7PF3WP
 bVdL1w9E87xqo7hs8vObNPe3lj+Y0tZs4pqx8ErMz8eSIjfsqSpAtuAA==
X-Developer-Key: i=florian.schmaus@codasip.com; a=openpgp;
 fpr=1357B01865B2503C18453D208CAC2A9678548E35
X-ClientProxiedBy: FR2P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::23) To AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:1f4::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB0983:EE_|DB9P192MB1898:EE_
X-MS-Office365-Filtering-Correlation-Id: d8536e30-efad-47a2-b7b1-08df2ace90ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|23010399003|56012099006|261009221227099003|261009223027099003|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XErLfRhWMSSbCU9JCdRpywU3Y2LDj7joxqT/NlMwlbnr7KFLubQhNd5UjW93V00pzfcmTSqfqOWznUzORNEjbwVjhSVsK3+nxwaSO02hc8qF2VOj5VQIwvIVqGCXyHM9dFuqJcF1KKG/tNybbflcL39yMvIu5VAxopQxV1i8prIyjq/OKWNqN5LVoPxox0wabAzzM8HHakKrT32HkXcJRhhRc35xyFwPilUq+KgOpWp7kjZb0t2OYCpwuTnFmjnt/QxRMxnR3eZ5kAlqWc5eWV44OuHPFcggOezQmjYjzEzyRp/ibp948ile/FukDQ5LbKlSzGnA5v/zInB1lmv0fXLuHW/YdxS0HQcGOrSw2gQGKz0HowQEFvkNY/+e9jNxPfeV6PqSXog9/Ho74F6DrCz0/uOaCs1PzsY+/dIsBbm+yotW9dJKsdTNLRck+633MRqf44yoU3/93gRq0EB7vYa0IquS4uDBf5Dt5ImDRPVOps7DMaSvcaZ9iXtUeYPXgxgYo3nS+JNj045nNT6iPoVz/kMR5QYZ2eI2AZW2bVfkex8aQ7aIHhYQCBqS0/zXuj8YGSz/WVWS7usheEmm7J2QTt622jOs+oI5SAs58Fn0VnBlBRoul10WC53mpSs+Z5JFKveNyCnnXcZO+Gs3WtcMMBsAUzkoRsKKde4fdNs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB0983.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(23010399003)(56012099006)(261009221227099003)(261009223027099003)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGZIaFcvaWRWU3FmNzJNbUhCbWJTSHphMjVVWVpFTi9xZDVJK3BnT1RzZ28r?=
 =?utf-8?B?THVYL3pZbkxmNGV3bk9LajdUcFVmWUFFYTNISVFqMHV0VGpUaS90bjNUL216?=
 =?utf-8?B?L0ozeFpIZ1lwSzk0R1FjYUt5M2Z3eVYwUVZ5ZE16cXNiaks0dVp3ek5ERWpp?=
 =?utf-8?B?MFRqcEJia3h1RmFFYkE5ZUhCM0VyZ0JnYVFyZW02dVpRY2xycHU4ZGp1NVJQ?=
 =?utf-8?B?cHN6M1VhUXVMK3pDTGlCc2pkR01nNzdkclMvTmd1dDZ2cFpZVkV5STBlQlB6?=
 =?utf-8?B?THUrREZXSTM1UG9rK1JMdlM4a2RlSkdaUUYzUmVsbkp6bHUzTHFBbzR0MlBq?=
 =?utf-8?B?QlMva1h1RE1iSFkwUnpZcGNnbktJSXRPck5kQjk5UkJGbGsyQ3BjWVo3Qk9o?=
 =?utf-8?B?dXJXTEpoalBqVGVOYWU0SnpnRDZ0WU80QWdYVXRLMER1VVREdUFSRWlvVm04?=
 =?utf-8?B?djdacEo3TFM5UWxNTmQwR25LM0I2Y0h3bkpDbEJ5TTBhemlCaWdXRkZ3QjUr?=
 =?utf-8?B?WVphSmhRcmc0Y3VJVVVmckswYkx1MlcxTGlBWGxrdHNEV0daT25nTFpqUjhw?=
 =?utf-8?B?Y1IrZFRYTjZFZEYrbHZsUVVWaUNWTjNHaWJmNUlOaHhVblMvL0RuRmk1aHp4?=
 =?utf-8?B?OVpyOVVLQ09Ma0JpV2JYaWlTdVdnOU45MnJyd0d1TzZETFNHMFQxYkJXeFBB?=
 =?utf-8?B?bWVWM2FCazBBMXNGWHZqTk41TDRSTDBGVVlkNkpmeldoVXE1aVJQZkhQTVl1?=
 =?utf-8?B?U1ppWmZjY1dSbzZaSzQ5Ynp3ZE1NZGVTUk1wclhzSXZReXNEUHFWb0pLaDd0?=
 =?utf-8?B?QllSRGN5M1ZVQThRSDJhalY4ZTIyeklrMlVPRTk2WjNnUDdqWUNSMjUrL2Qv?=
 =?utf-8?B?VVhWNjBZL2tLN0E4R0hnY1FaRUUyaTFBTXZWZmFpNk81YjdlWnl0VDloaldP?=
 =?utf-8?B?RVIyNmpCeHFiaEYveVFaLzVRU1dPbFNzaXREM2xEWkw1ZGtXU2Z5U2dWS05k?=
 =?utf-8?B?am5HbUlFYnJOL0VUZnN6OUdTK0RSZGcwRG0rU0IyMEptL1BUbEVlKzBQd2dB?=
 =?utf-8?B?R0ZReGtsQUszaHZRMDg3ZVVCVytTZU9WUExFWklDbUxDVFVvYXZhSDdrQllw?=
 =?utf-8?B?blpZWStUNkdhRGsrUXdaT0hkMGlHZjc5SEsrZjZzcDhtUDVxSHVNZ3M0T0xL?=
 =?utf-8?B?MzBOUzBneDA2ZzZhU0lYK0t6Snc1MlFIdW54REpROWRqaFhFL1B1cDFZYjRS?=
 =?utf-8?B?ek5yQ3YvMWdGMUo1TDRiZjh5RW5kR1NSTzMrZmVWKzZjK0ZPT1I0TGMrYVU1?=
 =?utf-8?B?TXF6RkVaWW1NYm9XWDBRMUVwRWRyWmxhUHhtTU5iT1Z2ZW1LS0NlY2ZxaW8y?=
 =?utf-8?B?ZENjYkpEdUdUSW95bFhxUTZzd0lZdGVSaWJBcTRlNGlaN2JJUThuMytlRkdz?=
 =?utf-8?B?NmliWm5UZ1VEYW50UGxWU3NuVm92dWdFV1lOUzdSSTVETmFWWmJOb3c5Wk03?=
 =?utf-8?B?ZktCaHBHci9sQkhDK0FJeWFNK3VDaHpMM1Q3SXlsZXN4RnR0OVJOMVJjcEth?=
 =?utf-8?B?RElzY0pqUGE3UE12K241UVNxUjdDaU5wakkwMzdXMC9uR0NkTGRVME00MDVa?=
 =?utf-8?B?cXRVMldObVBTYnUrdkptUERwR1hFSVVQWWc5RXBhQW1aeWNINytzRHlkTDlB?=
 =?utf-8?B?eGJZTUxQQ1N6cXVuTzJ2cWo3d3E4YXQwQVJudUFWUmNPU0RnNHZyR0NGMm5p?=
 =?utf-8?B?cmJTZ1pIanFoN3ZRb2ZKdUZxUDV6TGo3clpyLzIwWmJDOGNFTkFCdXN3THU3?=
 =?utf-8?B?a1BWVCtwNkpUZkRJWDFlY1pYSTJxUWd5d1YzZ2RUTHVCcG9CbitnMXg2Nk44?=
 =?utf-8?B?aisxbFI4dnVIUWJaUXlncTVmUlJ0UkpGL0xxYk8wQzEvSFFsSWxxZnhNRUdk?=
 =?utf-8?B?UzVsT0dJY3loc0h6TFZ4RElhbDVKUkRXSlB1c1dudW5sdUFUUFFaZ3RYV2ls?=
 =?utf-8?B?b0dMQlNHbDBGdVVpZlV4K052R0QxaVV1VlhWTDdSTXpNVzdhTzJTR1ZwOGhn?=
 =?utf-8?B?cSsvOGI2RDZvTHhDTkFDMkZzZ1FaMGNqcVNHSXNxNE5zdjdLY2tZOFZkR0dP?=
 =?utf-8?B?dVhNaE1HcjB6U3JOTHhFK1pDc1Y3bjZsYmhDamt2TmpqNDhkajdpT3FRc000?=
 =?utf-8?B?NzluaVZtS2VhSjBiRUJETDRrMnZHZGpPZkk3TmowMC81NUV2Um5lam1ScDNX?=
 =?utf-8?B?YnZNRjlYcU5LSFNvb1BrTVF3SlpQWDdKd2NkampCaDNIS3grQjhMSU5zZDNr?=
 =?utf-8?B?Y0MxU3FzWTBZRURad1BDT0QzbkZSM1hZQ3BGSzdVQmJNQm9ETURyaEs1QmpE?=
 =?utf-8?Q?mqmEKPPM3/ogV1Dixkp7jPmr0SID+/rqpf4FJl36on7n/?=
X-MS-Exchange-AntiSpam-MessageData-1: aEpd6RS/QLTQyQOcE2OqMnB/jE2UPQnZ4xI=
X-OriginatorOrg: codasip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8536e30-efad-47a2-b7b1-08df2ace90ad
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 15:11:19.3043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d91ffef-bb81-4cbd-b9b8-552583685f20
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MqOFgvYnX8eFAaGXKToz+kucQcrwh2r4Inc0V6Ueyl8lgmWs2soV9JncLRr+KTuClgBzp8hWObzM+edds3QZec3Wb90zHYAOjGUGS8m0aGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P192MB1898

mt_free_walk() frees the nodes of a dead RCU-mode tree from an RCU
callback. After freeing the children of a node, it continues with the
next slot of the parent if that slot is non-NULL. A maple_range_64 node
with fewer children than slots keeps its metadata in the last slot. If
the parent has exactly MAPLE_RANGE64_SLOTS - 1 children, the walk takes
the metadata (end = 14, i.e. 0xe) for a node and dereferences it.

mt_destroy_walk() already skips such slots by checking for a node pointer,
and mt_clear_meta() clears the metadata of the start node only. The bug is
therefore hit by the walk over a parent other than the start node, which
needs a tree of height 4 or more. Storing 2768 disjoint ranges into an
MT_FLAGS_USE_RCU tree and then calling mtree_destroy() and rcu_barrier()
in the userspace test harness gives:

  lib/maple_tree.c:4755:27: runtime error: member access within
  misaligned address 0x00000000000e for type 'struct maple_node'

Fix this by only descending into the slots that hold children.
mt_destroy_walk() has already stored the number of children of each dead
node in slot_len, so compare the offset against the slot_len of the
parent. The slot value itself cannot tell a child from metadata here:
mte_dead_leaves() has replaced the children with plain node pointers,
whose low byte is zero, and on big-endian the metadata is stored in the
high bytes of the slot, so its low byte is zero as well.

As the check no longer loads the slot, the rcu_dereference_protected()
with lock_is_held(&rcu_callback_map) is no longer needed there. slot_len
is a plain field that mt_destroy_walk() sets before call_rcu(), and
mt_free_walk() already reads it without annotation elsewhere. When the
walk descends, mte_dead_walk() still loads the slot with
rcu_dereference_protected().

Allocation trees, such as mm_mt, are not affected because their
maple_arange_64 nodes keep the metadata in a separate field.

Fixes: 54a611b60590 ("Maple Tree: add new data structure")
Signed-off-by: Florian Schmaus <florian.schmaus@codasip.com>
---
 lib/maple_tree.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 1aba6cced713..e5c0eeda0bd7 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -4789,9 +4789,12 @@ static void mt_free_walk(struct rcu_head *head)
 
 		type = mte_node_type(enode);
 		slots = ma_slots(mte_to_node(enode), type);
-		if ((offset < mt_slots[type]) &&
-		    rcu_dereference_protected(slots[offset],
-					      lock_is_held(&rcu_callback_map)))
+		/*
+		 * Only the first slot_len slots of the parent hold children.
+		 * A maple_range_64 node with fewer children keeps its metadata
+		 * in the last slot, which must not be taken for a node.
+		 */
+		if (offset < mte_to_node(enode)->slot_len)
 			slots = mte_dead_walk(&enode, offset);
 		node = mte_to_node(enode);
 	} while ((node != start) || (node->slot_len < offset));

-- 
2.55.0

