Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794304862;
	b=qQrM+MgTrWoVk32KIXjHytFpX6Rqh/63AfBsKzIvOzBwSAG3DmD7l50LDTXuxdNUipfw
	 BNSSgDh5z+Tm4KF+LLBYw8WKJ3dfAl5QilpBhc3Sc8FzBwRp1UgzJrL1DMtZyykkrzxMs
	 eOXWU/eyu7UNYdujZkQLbG0HVeM9ilhSZUve2BKuUYyxEYCDXuA2nNy4vpqAH4+ulyWF4
	 i8BDU6jLeVyXPsP36B844qik3d3DmA05w3DSoDsmaQCXUGXjgsgeQBzqaWJbNyFNkxwji
	 9A9pS1BX70PCikQZ2YI7atMQTf/wFQPgRq2OVOdsCpKwHn9SxMP6fnX0h93fP0IeX0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304862;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Cc:Subject:To:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=ApQY+rvwxNNsWoZ6feCYer0DIPLTuIFvHJFEsF/6bfI=;
	b=3XaKj4TuNWq3RsPij/zLG8sPoxbewT0Rg9la6svj3L8wuptv+zZrwBrwINEf9QU5ndkL
	 xAHaRZBV1BiHOAqWHf9PUx9PqHCiePD9ZgTtPFjQllO64A2KuYL3A9DG4u49mow4QhOVY
	 vSOyBeEwcp6QoaaELj/q05Zof/OJhvtJIGZ8n1LL6qdvmj/0n5yt5eG3/6JiTFQJDsnu1
	 fYLQ3JQivDo56OZJ098ozPetqAqRCO+Va4YOxCyVZ9GQUVonnJ3RrfKz/iy6JKbH7fhZ1
	 U8t8G0I6bA+yoZU0z23qIfI9sVAEV6CENWY4lm4CZBRajpHY3UyF8rEEoYfKZ+GdyIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=citrix.com;
	spf=pass smtp.mailfrom=citrix.com;
	dkim=pass header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=OM8KmlSa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.31
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010031.outbound.protection.outlook.com [52.101.61.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F29606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00F29606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citrix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=OM8KmlSa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/9jVqC35Vh94RZtA50zXUyrGR9vsB1QKqxtnTI/vMJNywUrX18t3GKf2Ll6o2VyBfujN+NqmyzVqYebUWE2yWE04ffnJ1KZNhAd3tiTHeQMtrc/uRCcTgPj7P0r5rtLJrxtzZVdaH4HNITT4d9pa/cppRiaQZxXTB8dPjOHGTrFRqQ5wMCWMfA84WMrZRpJBldzWHqQNm5sPRdDNz64BEKMY4UoDCdQd2xs5ZEHpzldC3rSIspao83/BCgLPx6PFEdKbJj3XB/bp+tyfxxtf2SeZY7PFvOWN81afsyw4NY9terXaBvxMQM02Jd1AuSCnUYTXqXCRsvSUFANNZyh7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApQY+rvwxNNsWoZ6feCYer0DIPLTuIFvHJFEsF/6bfI=;
 b=MT2Yta0I99Wtljw/ARfB42k66ok7cPhYznbJcKQAJ/gLj8cSxVkgI204lEwE8Q5yQPL8Nl/XxwBA1Oj7B6jsSyS7ydmHR8hkpD3mhmDkk5BAeyCbqXVh3M2Qo7+IvKvFe4VnvfcyZNxkd4xp+xbB3xXcD9hUBgWnwgb5Z6UZR7qj3E42lQMBeHHvm2ndkjV4erDEWYh4MLXATZpWHsbrlowAh6nIlsRoMut+kF9ATKdtlGMKyeZtFaD/iRpsc/zFtVTXqoOdRgKogkaSwxzuVkxE4Gxm1Ub6m1Id8reiToc+e+3pQ/eksAb4Eo4eOFgEdKx/TTd+GMZ+0pFCbhlukQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApQY+rvwxNNsWoZ6feCYer0DIPLTuIFvHJFEsF/6bfI=;
 b=OM8KmlSa7r40QsNV1mR9Tg+yEO+3QmX+Al5Mn0LE/NhldAbvsE3pDfIOxBZgQFC3R7ThV1nmZwxLlLVEdw0kAvZi1+tfIVYH3W/uoM62Ug9ACC7Cm0vmnd/b+zyjDT7o1fpDFbXnLp+f07QbU77OkPb6w6k6jpmULhBuzxbbZdc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY5PR03MB5348.namprd03.prod.outlook.com (2603:10b6:a03:21b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 09:59:58 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 09:59:58 +0000
Message-ID: <b17bbf33-1b4a-4491-b9dd-4ca1bad1876f@citrix.com>
Date: Tue, 10 Nov 2026 09:59:53 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/2] xen: don't allow gnttab_dma_[alloc|free]_pages()
 in PV guest
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org
References: <20261110095605.369848-1-jgross@suse.com>
 <20261110095605.369848-2-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261110095605.369848-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAZP264CA0090.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fa::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
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
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY5PR03MB5348:EE_
X-MS-Office365-Filtering-Correlation-Id: ae85bf77-b04b-4f3f-4e13-08df3f1160c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|6133799003|10067099003|11063799006|56012099006|4143699003|261102123227099003|261026121527099003|261021121427099003|261022075727099003|261022105027099003|261028144727099003|261021123027099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	MZEuwYUfej0h3I705vq305U4QRsgW+GdDaRFewwuJar4U3Xy0N278gE7ns0UgWRrTU5+EKnPn/Um4GRgYCrapbQOX/e67Jz0c0SJV7jD5iEPPW1P9ewQI0ja7H2MDNC9XwJlWjLorUb0towE2jutsUb0gQbPP+7qb6qoXVEfLgrb24xtKrCm+Rs0CD2+2D9KXr0f2sc4EwABEBGyXZFeOedcsf8ZR3Jf5BEDnnxlOsTYSbGyzHNkh9n0+H6UZxSBhx4j9nzwnIEmwoJFK5+VrIQJLLkjLnjAzMV+zNcwMTjhIz7/izOKDvFmuG+1PLxJIG+TutB3Rh5HZJw2BzwXjvwpq/djBVYoeJ2LmYeFkcbetE1KwtatOnhFTSUhT1Nj20LLWGHRQNHEW6fcvD+Rwd4clKM7eS2T0VLrcOgZr3RDSeUslg6cX7sufGMLzZ7DABHh8WvgDZaVxuuibFBDr4K8h52y+pb7PlNxarrSYlLovP4x33ETv7mHJ0NaTtte37++B4Ck1jiOf721FeXNmOuDw67BsoUbUv0HiWigEzCJiXSFaxJ775MwLLQcBN5j0Kr5SHx1BGijpTHB4gimv+CbV6CHwGNN8Fm9Hi+4kPD1rlHty9lDG6L9N8riBzlq5vxxb/DVU7c0X/K4vGf8w9SVovbmH2LZLtYVwJmy3+o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(6133799003)(10067099003)(11063799006)(56012099006)(4143699003)(261102123227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021123027099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZU01eTVwUWxOZ0xDNUhiZWl3OVkvelhQMjBteTRuQlhZdHdkcGRRR28yTGI4?=
 =?utf-8?B?NkFoMDBtNXZ6VFYzK3J6TFU2ZFFnV0I4M0FWdEVYR1o1RmRUNy9tYmd6bDM1?=
 =?utf-8?B?WTVIR0oxOVdtejdkY000aEM1L0xnTHFsUnFpbStuWi9VYnI4ZTk0b0ZBQTJN?=
 =?utf-8?B?dnNmRHkzTjJ0Zy8vWGdoNjk3Qkd0SU9nWFN6SEoxWXc3NXhkajNhRDlLTFVI?=
 =?utf-8?B?TUFjR09GSXcxd1BlcVFnY3YvcVRJOVV4MkJNTW9xR0dLaXBPcjExZGhJN0pq?=
 =?utf-8?B?dDNTVGZkQUpYb1k0dWVyTFdaNHM4anhrNFAyazI3RXIraFJlRlBaWnBxbGQ5?=
 =?utf-8?B?R3BCZzg4VHp6Vm1FcmFtTytpMVlKdmg2ZnhXbkxDclppMUFNVjE4ZWdrRTEr?=
 =?utf-8?B?VnRjTnhnekh0Yk5XdlVqVjNmLzV4T0YvTzMxbUo2N1ovTzNtaFZ6TjdNUlI5?=
 =?utf-8?B?M1VOMCtZazFDUWNwNkRlOXdKR1p0Y3ZKQURDYkZaczdLUFpPVTJMVWVQYXdC?=
 =?utf-8?B?djZGUCt4dE1JWWpoaVMxZDZhMDYzZ0NNZEMrb25UenVUK3ZGMHNPSEFnbExu?=
 =?utf-8?B?RjduL3VnS3BtUWhZYnpaVGdLamR4VHAzRHJGUHE5Mmg0dzEvclpyQVlickxD?=
 =?utf-8?B?dVZ1eWhMcCtlM1M0OTBGSktxSEVtRFMvTDlwdlpCbnlCQ09yY2YzakM3OXRC?=
 =?utf-8?B?d3lNRzBaTUNDcWhaOW9tTi9sUTZ4UHRKTU1YckMrcTJZbENkbFdOMmZSL2NF?=
 =?utf-8?B?Vml1Nm9BUWdXMi9pOFhFUG5GOUVQMkNhM3JCZCtQN0k5RE8vMUxFTHVmZjVP?=
 =?utf-8?B?NXZ4QWd3YkRiT3JBVjdHOHZxVTFXSjNxY09aN1lHbTAxY0E3amNUZ09YMzJz?=
 =?utf-8?B?Um9PLzFhT01QSXhJNDhLV01pVmo5SUZHYTZwVVhQa2RzbWc0citlUktFRGY5?=
 =?utf-8?B?L3JhNUZyY3BuSXhLMGxvQVVvSFpPVWR6c2IvVXZHN1FabXp3aHBZajQ3d2pK?=
 =?utf-8?B?VncyNCtLRkV0cVl4MkMxSEkwaUhacDVpYVhRNkM0bTJRRlZhdGM1eSt4TzFq?=
 =?utf-8?B?VS9TMWZqMTc2d2NZK3pLQWpyYW5kMW4yTTNOVWw4K1Q1MHY0aVJMclBkNyt1?=
 =?utf-8?B?NDYzZWJaWlFsWDBHa0k0TGlPZG1aUTlkRlBuUk5ucTBQZjlXTVpYelpIdFpJ?=
 =?utf-8?B?aGhyaHdycEFvbTBzOWQ4by8vWDN5VVBIdmZJR1pFZ0tGWkcxNm9UUXRoOXBP?=
 =?utf-8?B?VnhRWFZFY0Y1Ylg1Nzgzd0FjRjlDNStJeDM5YWxYbGJDckZZb0J2MGRJbTFu?=
 =?utf-8?B?SmhIbWNURkVYSldOR3RBSCtuSHM1RXoyeDRQczdwaGNQVlozVDRXQnNBbU1t?=
 =?utf-8?B?K2lpbDFXSjR4U1ZEdHAyVy9JK3I4VWdQYy93ODhPY2dJcE9rVzVRNEZxQUU2?=
 =?utf-8?B?Z1FqR05NMVgwanNnMXd3R2IrYzNPRkRmVVN3OG9XUENnRDFsMkFHNnNzalRH?=
 =?utf-8?B?eGtwQ2tzT2xOU3dHWUZ1SXFhMjFVZFpLRm9KcDY4MlMzNjdaSDlDSzRLaTJS?=
 =?utf-8?B?dUI3YU9UbERjSlZJWlpqQXN1M1NmRmtqUEtwNGN1ZGtndlFFTXNZUiszQW1U?=
 =?utf-8?B?d1dkZkU0aStEQ2RaRjIvdk0zeDF6OUxsQVNKRXhNRUh2c3dVUExYbDhHdVNl?=
 =?utf-8?B?eVBsUGVJMkorWVc1MXh6WDVTdnpXdnlDcXJVMzUwaEwrZ3JXQTNIdDhCRmFm?=
 =?utf-8?B?L2s5cTQvT2Q4amQ3UENPcFQ2T3FJK1ppRS8rOXNXQ0lkQ0Q5YlhJeTBuMDN4?=
 =?utf-8?B?emMxZEdhTjBCelZrRzVmWXVxRkFiMjg0WkZQbTVPNk5PcUFtVjJkLzBLQjVL?=
 =?utf-8?B?YU1QNEZRQmtxaUJ0cGtSc1FYNDJ5VlJUL0NqOVEyQVF4TGFVWnpBRW5jZjIr?=
 =?utf-8?B?a2hyWklJQWdnQnVVZUkvYktzTWhWdXB4ZnB3V2dndGx1UmxLRERGUFM0SC9a?=
 =?utf-8?B?aXlpeTNoVHI0ZDlxVXZreXE4U2dIb0EwQ3JVN1RrMml1amtFV3l2cm5PL3lJ?=
 =?utf-8?B?YmhROE1EcUp3Z1ExVVJENEp0M3ZZK3ZvTVBhUlRiZXpnZmsrblYrUVBkZXZY?=
 =?utf-8?B?K0w1YlNKUHZVOGE0anpPc3JORUtIOUlRWFNnakF5TVYzem14dkdLaml3a2Vz?=
 =?utf-8?B?K3BSV2J3QklaM1NNQm9vVUVvQmVOOGltcHdDUnY3ZFFaQ2dyekFmVFFDOHZ3?=
 =?utf-8?B?VzJKQnVwZks3azJlVWRXS0NIbjFma1lXOURtUS8xTkxucTdZUG9OcXBGMmd0?=
 =?utf-8?B?VWZHRWhJRlNEYnE1UUxwZGNMTU8zalpqdEJ6NnR6SXowNE0wN3VNUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae85bf77-b04b-4f3f-4e13-08df3f1160c2
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 09:59:58.1715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DWbFE1w0xrfuEX8/4yHcs0fv7TJbuja9UYSvKTEeUawGXH3IsfyxIPJZZizHlSrUIdwHCzNCzAQfh12Ipb3jx3H1tbbatAXfioBmL9bvcEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5348

On 10/11/2026 9:56 am, Juergen Gross wrote:
> Today gnttab_dma_alloc_pages() or gnttab_dma_free_pages are never
> called when running as a PV guest, but this holds for in-tree callers
> only.
>
> Bail out early when being called in PV mode in order to ensure no out
> of tree module or future use cases are violating this assumption.
>
> This enables to safely remove PV-only code from both functions.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  drivers/xen/grant-table.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
> index 604c4eea5930..56a497987942 100644
> --- a/drivers/xen/grant-table.c
> +++ b/drivers/xen/grant-table.c
> @@ -1063,6 +1063,9 @@ int gnttab_dma_alloc_pages(struct gnttab_dma_alloc_args *args)
>  	size_t size;
>  	int i, ret;
>  
> +	if (WARN_ON(xen_pv_domain()))
> +		return -EINVAL;

This will get very spammy if hit.  WARN_ON_ONCE() ?

~Andrew
