Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793284308;
	b=CnJcsiQYVAtT6qBm6F9CyYRyoVme/UwQ0N4ZLVQejpa4gs9tlEeRzWY0YyaP7H2q3YyU
	 eoH6rlhcek0PIMZjum6wJdblJCDwQya2EdbLNsf5Ct/fZUqXD7v0RqbAtj+grcdzvSmW4
	 CMW5MSTlhHCbJaL3OWf+MYIftnRkbJV0IJqW43IND64QCLklY4OmY79DT0Kd9ZhoCK8LI
	 HnToD8xFPP4w1mEXViSdRxJ7QyE7Xxh7bmZqH29itRUG1c8IxLswsYC6eF97gy4Vd28v4
	 7ibSY7UIzcUdp9xWGYOen2cYDw1k4e8Sac8+b+BeiK7KurKky6Pp4HWnF3lpoq25gjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284308;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=D8KZZlwNepy2jbldMI5J+HWT5ILqbsvPccqCR4cXmtA=;
	b=0AucD4mSBINRXIafsVmLD229LzBxyOXdnItNaqXcXCrIdsuO+KQGPP1A/nkpsED4BqL2
	 X6+qoxLz9hlaWvZbgpqkZ/1AyC6vmhh7zuYs/vluQGuA2hjIz4YjO8izwN1DxURAEYNAK
	 JBmryFNs0YLYJHsbo2CyU4iKMfutEuI/yjO6Iu2HYjZ8G9MfptF+qn5kRJintfjC4zMik
	 OORYanzkglw+Sw9Nwzgg/u2k7dS5ucDqJVJB/f7m+j4cv6CxLpeAmXXkyDD2gObV5MZ3q
	 5lmR7fPBNJB4kYdyz+K1zlkxprPPa7HB8gNhM/rEQHInucKXWMkoNaDcDo5QVCjbaXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VW4xuQaX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.45
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012045.outbound.protection.outlook.com [52.101.53.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157D7606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 157D7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VW4xuQaX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BWvk+VUpUc6caWHjT7H6k79QdjfxGUWjj/fU8mjX+XResZtltjQD7pKy8l9XXNgILuKt8GoR9PS3EjQo0dcXZc2wDZdRx0WyBkGEaeIK9y7RYEWh1a2gp+eJuHIQd164pzz8aUcfJYPJAn3wx6kaQwB4jvS7tHXs9pfC+ZZ0T7R3VtOWlqQR5oNVCK0ZzxToiL2Y7ne1AHeXfewlwlMUXitvh+wwk1vTlL7ziI1sy/J5K1qnaCSuDDIKfRcKmXJ7mso22TYjTgkR3H+99f2kRL5pD+9gMdGStaxJUQtpu6c9XVLKnf8bUnQUsp+96D9GYf39gYO5SLBjy5Ktp6I01w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8KZZlwNepy2jbldMI5J+HWT5ILqbsvPccqCR4cXmtA=;
 b=i8c3ip5K2ad6bnuktmjg+IT0p3ugCa6JD+DlZxD/qBazVtIz6GSsPlIOV9VHGlIRBdGW1+Oe2yO36NiSczJWO5aOA9XJUS0MkXS+fJ4vsOtl5rab5G+LU2ME4oM94UlfHDP7y5mmX0W7nyIoWhuhIUr9Tmv5N7bYQlIwy6u7lrfpygfxhMDx5W0PPiq6oDQvKvsvuWmm5bQ9p2R75BzV8xkvuvAtBNapnrs+CJTQ9tcMZ6vdhzO0j7gXXfU27hDKUOdYfMHVzj3doXAqLyeilZTSsTaxjm6/OqIuqlO+qYTV9euozDz1b7gTQTSA78oMJ7OI+KpYN10aojzcnuqKRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8KZZlwNepy2jbldMI5J+HWT5ILqbsvPccqCR4cXmtA=;
 b=VW4xuQaX31ChKivzX76OvZ1kszxZYjKJ/Njh7pYfLa/Y/oDxSRaErzCJnD1XGnI3c7Ta7U8MamXX91cOwDGSGDttfBD1OPpHT9qcGTFJsAZiy6ZNbDheb30LBLZPfb9AnRZpOSAKAvY9ggywv4dCNyNsWdFSpchtDOG/R5vcS74zwCB0+AEazdIjIqve5vRA4ZBRZylsPrCUqM+PYLrlggQkS49bXacXk4CydLVm2CZ4tnsUEvz71ydRwMQF12T5fqEsx/Y1U0LrMXwqg7Sm2S7qylLMZbH+dOc/UwFu3jgjHPjUrK7bPMUxcpT5T2CSAbFD/6UNYUyQ71IZUZsm1A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by MW5PR12MB5683.namprd12.prod.outlook.com (2603:10b6:303:1a0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 14:31:44 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 14:31:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Oct 2026 10:31:42 -0400
Message-Id: <DMHE8BEEER1H.2BIY52NXATPIA@nvidia.com>
Subject: Re: [PATCH] mm/huge_memory: use READ_ONCE() when cloning folio
 flags during split
Cc: "Andrew Morton" <akpm@linux-foundation.org>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>,
 "Nico Pache" <nico.pache@linux.dev>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Dev Jain" <dev.jain@arm.com>, "Lance Yang" <lance.yang@linux.dev>, "Usama
 Arif" <usama.arif@linux.dev>, "Kiryl Shutsemau" <kas@kernel.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, "Ye Liu"
 <liuye@kylinos.cn>
To: "David Hildenbrand (Arm)" <david@kernel.org>, "Barry Song"
 <baohua@kernel.org>, "Ye Liu" <ye.liu@linux.dev>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20261029-data_race_huge_mem-v1-1-112e331291c1@linux.dev>
 <CAGsJ_4wndM+uFwhX+7wdkm2Q8AkgVcw_4wgpObfw0DAZ1w+sVQ@mail.gmail.com>
 <b5dccfe1-3209-471a-a34e-f77fffdee797@kernel.org>
In-Reply-To: <b5dccfe1-3209-471a-a34e-f77fffdee797@kernel.org>
X-ClientProxiedBy: YQBPR0101CA0251.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::15) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
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
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|MW5PR12MB5683:EE_
X-MS-Office365-Filtering-Correlation-Id: 42d17b8b-0e5c-4363-8b82-08df35c95ac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|22082099003|18002099003|261028144727099003|261026140227099003|10067099003|261026121527099003|11063799006|261009223027099003|4143699003|261022105027099003|261021121427099003|261022075727099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	CpAqQLx2HDAd2qwoGNJMJXvyVt4jIindOuqQozh0qjK0Q0tiVxzYIDlwt9l7VitOuMBkevEtBVfOdSxb8yp2mkAXIjNbFMyJsbXRjkJartJ9b11ykBuG2qus68SkQks+6vY7uIFeiUTLXp31nOajCHQQNXf3sRf0r7U6MgJm/OPJxVAA0uQGBedcXPxpvUiRXzgv50uQPVEH90cK8WX5/VG/bbjKI7QYbXtzQMJoRI3wp5v0pDmlrzsArD0IpggoPsk0O3XILX07o+F9hFNhUst6JD8DZiXREOXt7w8Vs2V3dznqPn8kDJxXLE9/plkBVEamE03KMixMjniGYltY6+wSqFrQ+S1BG560Xb6wT14EiqJ+Z6TQ+O1UFNwowvDTrwF765tXgiJafxAcLMxwUJjlGqF7X1gULKChucVCQze7yJu44bxw+zN5fum3n07WG7OPUTQWJlx9H0bFqateKKb2+U0OFSxVEKKEjyGwn3T+4p6Dw/rX/ak2rmZNnEL6NYkW6zsFY1PtZWDccBp7kB7z4OaDkNHpQvhkm2PKRvFYJw9Z08f79akZ38ZX/FOQr5aVMk4dAtNvIRe+XiEaAQVSNmLkXNVudoSlyOwTZmR0T6rAPksHUT+7RXBh92qfz9HFcjcbGSUoN1DxnHanxGHfxnLiYmHjFiioAUPPa6Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(261028144727099003)(261026140227099003)(10067099003)(261026121527099003)(11063799006)(261009223027099003)(4143699003)(261022105027099003)(261021121427099003)(261022075727099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djc2SlVWeW44TjNTVTZzZVFVdGFYU28zV0hjaitrS1RQMWwwTk9paWpoS0tE?=
 =?utf-8?B?YXhUNkV0TGRKSk9sUU5GLytnbFVvU1VGSmJFaVJzOHBwVmxmcE5nYUxTM3lw?=
 =?utf-8?B?TXpqdHZ1WUk1dTd5UUZZOC9vSDI1T2EveXAvT2ZSbHpGZnBWZTBDUHdFVVM1?=
 =?utf-8?B?Y3NJQ1RTWFBRN09keGRsaE9XaTRVN0FkZEpianNMK0h1Y0NyMnFiNGZkSWtp?=
 =?utf-8?B?ZURUaklyYVF2Ulc5TWw4WTRyMXhkR043SzU3QWxuNkh5U0VVV2N6c2JuQzNp?=
 =?utf-8?B?Mlg5ZUl4TDBhQ0haTXRwbncwSDV4bWpnQWJ5UDkwMHN6Wk9obFk3RUxEMnh2?=
 =?utf-8?B?QzVCTzdrN0dreldPcW9pL1dYTytGVWJ5NndNbXZrSDBVdFZCcTJSTi85L3Zo?=
 =?utf-8?B?RzJlZVhON3JmYzF2N3FNVFAyN3JMMnZ5LzBnWlcxdnU2QVNlNmV3Z1hpVW9w?=
 =?utf-8?B?M1hIQ29zMnI5NDVyZFpJQ3p6RHA5azF1M204d0gxV3NCV29xRUZtT0FXNkJC?=
 =?utf-8?B?K1VEbU1sbUJpL1lZYXlibDNlQXZpOGlLTGpwdHBvZU5aS0Fqb3o2NEllbWF1?=
 =?utf-8?B?NTg0SjZ0YTVOU2svWm5wODBUc1RRT2hMQm8raGxqVVlGZzBydVJPMlkvckdm?=
 =?utf-8?B?eWNoaFhWL1FZdEM2Rk1oTS9sYjRxWGJORHdLcHRkV3NCeTZwSWlwSkFEcS83?=
 =?utf-8?B?dUNBaGtFUHo4bC81Ni9NakN0UnJPRVdnNFNtTlhyckowNzhmU3JVNkx1TWpQ?=
 =?utf-8?B?TGdsNUZza1hjcmxrNnlHQng1TlZEZnQ5SVlPTWs1QWlCNUFnZDdNZDFoRGRX?=
 =?utf-8?B?WWplWFcyUUZIajVzUGtWRGloZG5QT0VzTm5BZ3cwbkN1Rm1DR1plYkdHZVJN?=
 =?utf-8?B?VUlBNTV5RkVIU3hMZFZHejRUNHVMVDE5YXRPRG54aldFMk93ekU2aWs3WnJQ?=
 =?utf-8?B?OU0zVUdhYUlnWWgwS3dXZ0RFZUhiMGg0dzNrWGNxZGRrenlSZ1JGQlJvRmxT?=
 =?utf-8?B?MmtzZFJ6eHhNaUtySWVkbFFrbHAyL05PSzF2d0JjdG5rQlZ0cFBMQlNJMUE4?=
 =?utf-8?B?b3VQRUJLSDRQNEFtRnZNNWlCdGRtbTlWbDZCZTY2cjJLbm8rNW11cldtdGVK?=
 =?utf-8?B?WlIrQUZ0djVEeWs1aExrY2NUNXROaDc5Q25BVXNRWk1ibmVWc0pKeE5BSGN6?=
 =?utf-8?B?TWFCWnAyU2lNNmpkQWZ4VnZuVUorNDVBS2x4dmtlZmRCcm5LNkd4VG1mLy9j?=
 =?utf-8?B?RkVjeThUcUVmK3pjbTNpUVN2SDV6Zm13U3hRaFI3V05wK0FxZkpwaFlOamQ2?=
 =?utf-8?B?Nk4wUFArSFRCY3g1UkRXd1Fnbmx5S0RESWFsTndjTDQ4MmRUcFVwRU5xWmRM?=
 =?utf-8?B?M0c2VVVBOE5TNndDOWN2S29BRWVxY0M4NVZ1NFFmZ2JzQWkxSFQxUGJ3UHIz?=
 =?utf-8?B?MnFjRnRmQ1J3WVlwNDVxUVdxUkpJdHJBbytaSE9uN0RCb1VtQS93bmdoYytx?=
 =?utf-8?B?cUlXVXEybWlWNk1Bblk3dlB6aUdkOXZISVdUZzNPaHA4WW9RVmduQjdNUWh0?=
 =?utf-8?B?TnFkMDl2Q1g0alpiblFQci8rNEFnWEVlbXNKMFBaL0krTlRzb0FOVGUyMXFk?=
 =?utf-8?B?QW9xRDhrbmxUckZHT3VWRld4S20zZnZRWndkL1dTU1BlL0Npc2orT3E0SzVv?=
 =?utf-8?B?SVZSd2wwOU44YkpWV09JWXVpM09WRXBiMEpGQXlmTmUvT0xsWFNKQXJFeDRv?=
 =?utf-8?B?UjdWVVZJTlZuYzRUcE54RGNHTHpDbXpyaE5xK2U3VEtnK09pMVlJMnJvaTdT?=
 =?utf-8?B?cVVjQ0hZK1JQaW1uUU0vdklUSkd5MkxzSEwwbzFXQ3VsOVpmaThDTHFsRDNB?=
 =?utf-8?B?WlFRbnVlcjdWSGZMeXY5YTMvV3hORXdkZ091OWcveEFEUkMwWElReWQrMEJt?=
 =?utf-8?B?V1ZJNGwwbnUyVThVRUZiY2J5T1BkTnFPKzJrN1crZlZXTDNSeUZjZGhSTk0x?=
 =?utf-8?B?ZXpEc3BvdU94enJaeEV3TUxjeGRuMTRSY0o4cTg4SHg4SlIyUmYwZ3lyQkF5?=
 =?utf-8?B?cDZaMnRHMHN1bmpYOENxV3VFZHREZjFVWVBIVjIvVTV3WGNjRmVPdWZTY3J0?=
 =?utf-8?B?OWNGUUtjZCtYT2loRjJ2bVRWeVVQbkR6RFNQeUZLdGE5OGcyZUNBK0pOZ1Mr?=
 =?utf-8?B?VzVsRWZIekVEZ1dwY2JMbnJmSDBSL0JZbDZMNXVBYlkxbFJ2dDZlSWdNSG0v?=
 =?utf-8?B?bEs3VE5zamZyWjRIWWNYdjBza2lMVjhaVmQvM1FjQzMyaUs0akowbGo1S1F5?=
 =?utf-8?Q?/20mYcQQAVOnLNMQHe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d17b8b-0e5c-4363-8b82-08df35c95ac5
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 14:31:43.9756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ICwgHuW4RNLDUoxG3FxYMtMCzdJmDJ7Cc3iEj301PyVjpo3Iseh5F0fUjq1Nj+VK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5683

On Thu Oct 29, 2026 at 6:47 AM EDT, David Hildenbrand (Arm) wrote:
> On 10/29/26 10:08, Barry Song wrote:
>> On Thu, Oct 29, 2026 at 3:41=E2=80=AFPM Ye Liu <ye.liu@linux.dev> wrote:
>>>
>>> From: Ye Liu <liuye@kylinos.cn>
>>>
>>> The head folio's flags are read as a whole word to clone specific bits
>>> into tail folios during a THP split.  This plain read can race with
>>> concurrent atomic flag modifications such as folio_set_waiters()
>>> (PG_waiters), as reported by KCSAN:
>>>
>>>   BUG: KCSAN: data-race in __split_huge_page_tail / migration_entry_wai=
t_on_locked
>>>
>>> Signed-off-by: Ye Liu <liuye@kylinos.cn>
>>> ---
>>=20
>> I assume the race is harmless, but silencing KCSAN is still worthwhile.

data_race() would work too.

>
> Isn't there a way we could lose the PG_waiters flag?

The PG_waiters on the original folio/the original head page is not lost,
but there is a chance PG_waiters is lost in the new head, because
prep_compound_page() uses __SetPageHead() and can ignore the atomic set
of PG_waiters.

Any one reaches softleaf_entry_wait_on_locked() via a PTE migration
entry using migration_entry_wait() can cause the PG_waiters loss,
because softleaf_to_folio() in softleaf_entry_wait_on_locked() uses
page_folio() and clear_compound_head() in the split code makes
page_folio() to return the new head. Then PG_waiters is atomically
writtne to the new head's flag but prep_compound_page()'s __SetPageHead()
can miss overwrite the PG_waiters.

Code interleaving is shown below:



=E2=97=8F CPU0: __split_folio_to_order()                 CPU1: do_swap_page=
()
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  1. clear_compound_head(new_head)
     new_head->compound_info =3D 0
     (page_folio(new_head) =3D=3D new_head now)

                                                 2. migration_entry_wait()
                                                      softleaf_to_folio(ent=
ry)
                                                        page_folio(new_head=
) -> new_head
                                                        (not the old head a=
ny more)

  3. prep_compound_page(new_head, new_order)
       __SetPageHead(new_head)
         tmp =3D new_head->flags.f          <-- load; PG_waiters =3D=3D 0 i=
n tmp

                                                 4. folio_set_waiters(new_h=
ead)
                                                      set_bit(PG_waiters, &=
new_head->flags.f)
                                                      enqueue on waitqueue,=
 sleep

  5.     new_head->flags.f =3D tmp | PG_head <-- store; overwrites step 4,
                                               PG_waiters =3D=3D 0 again

  Later, folio_unlock(new_folio) sees no PG_waiters, skips folio_wake_bit()=
, CPU1 never wakes.


In addition to do_swap_page(), hmm_vma_handle_pte() and move_pages_pte()
also uses migration_entry_wait() and have the same PG_waiters loss
issue.

Solutions can be:

1. Use atomic SetPageHead() in prep_compound_page().
2. Do __SetPageHead() before clear_compound_head() and some additional
   memory barrier complication LLM tells me to do.

3. (Not good) Set PG_waiters for all after-split folios to mask the issue
4. (Worse) softleaf_entry_wait_on_locked() needs to grab a refcount on
   the folio.
5. (Worst) softleaf_to_folio() should wait until the folio is unfrozen.


--=20
Best Regards,
Yan, Zi

