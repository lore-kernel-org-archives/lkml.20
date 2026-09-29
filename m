Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010055.outbound.protection.outlook.com [52.101.85.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B433D3008
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790647423; cv=fail; b=CzeHX7CVf4anCvQhgofbyq8AmGfO4r5gt8yKNRJzoDoScRAOiY7W2cJtZsoEWOD7VMw5KoCvJ7RrVk69HIubO9YSWwPS8hF/eTpgvROv4sunsFyedEIL0/m99C5tHzocWuO+VuYeTYvehyVrm1JdwDxzPuD3iQJFs5L8tJF4uX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790647423; c=relaxed/simple;
	bh=IShhnjLObawD11fQXeSXkg1aE2Nnq39qslW1wPaqYQ8=;
	h=Content-Type:Date:Message-Id:To:From:Subject:Cc:References:
	 In-Reply-To:MIME-Version; b=Twd2+piv/ZiTdpfzMp4wfFryKZPhfliAr77Sfb1mwNw8ARXdtBsh0tdTAhSaH2Z+YSvU5JI3qk5yjcouM5dl4d9HTjoXhEIMYAFyUYvFbufcWlNPMU1lnmVkKv2EJABoNdGNhMBDL+0jxzJI98TyShkm/4XmjTpL+EwT5Emw/bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P8lNMnnF; arc=fail smtp.client-ip=52.101.85.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P8lNMnnF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZbeMs1y6/CU1F5XhVwnHt4qeB82T1yVPsV503rgc8MyVTZEfxiYhjfi6e/1m9lIX8fMf7qZPmFdy3ssWO2DlBvPw0UIIoEFfuQ7dnis7WZ1FgOhkg7e68qAxXbdZTUePKul70KNdcw5WxEc1TExSBdHkQZ/PQvZqCWfuVAfWVIBYJhsYH+OlOfga+cI9wGHnn950Ii3rKjR31RXS26sh2kPTuYHXD5FWhmBrB6v4vGskiuCJhL7tYg224dN3V0GX6YeoSDKAZjyztxGF3Vy68jQl2Mzh0pIAQmp3HqYp8pISrqUWOblDnfP0xPMgOS1/mLteJzWU4Cfgyo3k00q3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yuy10aM4GSOTGy1Z6xdpkZLUPEhC3r6b93RwD5RQ5UI=;
 b=EBDEczF7uqMn/85Q/iejg654f4+HMAepW/d+D32w+6H0E/Lb32EGQi4HyxgM8O6ZczHLlDlJZvAH1xK4OzZ4IeoVR7g7DcwdX/TN5vTKNxjAzbEiwY+5X5dCYlQsxKYl7u9Hj4aQYwPY5y6xQwmIHP4oWFVL2MPSXda/XNX6QQzIrEW4umfx1NeEL+udBaMRdQinWkS/RrWAfDD1G636JavgHI7JALmKlQQZq/eSCWCHlk4bjtrYJEetPKV1k/RoQeC5m7lwFnUlP++tF17ytVSxSKx3UV2j2ZtJpXLJelV/DUSPfqIKPAR/msUmejDoVQSZ4noluuP+6zNivZy1RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yuy10aM4GSOTGy1Z6xdpkZLUPEhC3r6b93RwD5RQ5UI=;
 b=P8lNMnnFcth6/rLKdSUj48btwAHGTkbLPPOXys/k1rT2f8r8GiZF0TXVhM4DxD5LdKmLJOJN7sxp/JMQxPPuc6/UeEJKRFmH4rXw+Zz4HgXEj4e6daBEcPRKlKi38SapYzxRPy0FuqIbWRO+A1MjXyz7K/WT6ypsV65OOIi/4zcHtMVmJdFZ5jvOECmacY0M8jNFCvQuOfUpNKk3arWTGy3u54V+nf0TKldgS+SX7sPG8Ac2S73GQOdjoFLQ4xzQ3svgW8tllGKBCkZ8LKNNxww4RXTXtWbtv0YjoidknmEKEsYwUihYwf4BocEbEIP3fsiKqXddnkJKyr7OxGLOEQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CH3PR12MB9313.namprd12.prod.outlook.com (2603:10b6:610:1ca::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 02:03:37 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 02:03:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 22:03:35 -0400
Message-Id: <DLRFJ6D5ZT76.QPMYJO63HQFW@nvidia.com>
To: "Kiryl Shutsemau" <kirill@shutemov.name>, "Andrew Morton"
 <akpm@linux-foundation.org>, "David Hildenbrand" <david@kernel.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH v4 13/13] mm/collapse: implement MADV_COLLAPSE in
 madvise.c
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <kernel-team@meta.com>, "Liam R. Howlett"
 <liam@infradead.org>, "Nico Pache" <nico.pache@linux.dev>, "Ryan Roberts"
 <ryan.roberts@arm.com>, "Dev Jain" <dev.jain@arm.com>, "Barry Song"
 <baohua@kernel.org>, "Lance Yang" <lance.yang@linux.dev>, "Usama Arif"
 <usama.arif@linux.dev>, "Vlastimil Babka" <vbabka@kernel.org>, "Jann Horn"
 <jannh@google.com>
X-Mailer: aerc 0.22.0
References: <20260928100630.21870-1-kirill@shutemov.name>
 <20260928100630.21870-14-kirill@shutemov.name>
In-Reply-To: <20260928100630.21870-14-kirill@shutemov.name>
X-ClientProxiedBy: YQBPR0101CA0145.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::18) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CH3PR12MB9313:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bb0015b-d0c3-41ba-5140-08df1dcddfd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|10067099003|5023799004|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DyjhYrb2CMqGjIRkRA9SG9wEu79U/n89o3MdWTS9Kds+AhcTAWsjcc8jJ3GulsYtbkZbO3YlOAeU93cIGfCbg53ls8kWXiRLLo8WVbJQeK8TUTLapPBogeSJr/czmm+jTozntTryP64ZyXwm8mByHhrZvMzFu/jDIg4pPD2asX9yfLOJ3ZNuAM8GB7AcfP/5vw0TP2kDudCvIVLx4tckN/J4CJBLPN88ZUHTOojdQzhf90qVXy8/qUJvjHKmwTqGn8fbaX6O7nxzuLTsYyzYBDE21k5QR1Reb+zuUcqJ6/Y7bXKNYmU/XKkPm+uFgb4/gxTWe2dSxM7ki413OzkLdkm8drnSidfKnVVcI/uY3qmnuPzTSiwS+1oKgtvZN/pjcXqmqAbFTRgkDIgyV22ch/sywQxEHIjYn1D/xpYC9oUQbHmQmEk0f059M48d3KEA2b4DHf21kvZezyZvcgp4v1mJuvyr89rQL96Mb2QyZ5eAaecsNuFtH3UE3vq64CCtCqa3HAKP2sG5JGrEaM7/ezNYK4/PVMarepZ4aklkozvYB25frsTVWmBFylwytQxmf3BAE31Ct77djah/4CF4UKTZkbpQHY9fu9qxfkGDJ2ZpVgO/rbGnWqy1fDC2VTq9rxljoxmR3VfrveB6nMQI2lrVNyTLP2YRP0ckGh2jD5A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(10067099003)(5023799004)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REkwdGdhQlVUYk5nOTVoSExZbFIvMTlxc0N5THZnMEp0aHljQVRkWXpHa0Iz?=
 =?utf-8?B?d2YyekhHWWhwRWNWNUUzdENzaFlrSDgrUjFWaW11dkExYVQrZEVVZGczMUxF?=
 =?utf-8?B?Sm1Nck5yUDJzWTNSdXpKcnhuMGhCakpBdWwwK1ZsOXVnQkJvU0R5OEI2d3hi?=
 =?utf-8?B?WVZLYUQvN2ZFYjJMeit1NVF6OW5VajkwdVBjMXBNQ0VMMzErSXpCNCt6eFVO?=
 =?utf-8?B?YnFkbzgwSXhjcjk3anBGc3owWld0R3Q4cmRnVzVEeHdqUHB1aG1xWHBEV3dy?=
 =?utf-8?B?UG9WR0VNZzc0aUNxc3ExY2pXbEd4TzFiZjFQdDF0UHo2UUwrMml1bFlGc3BY?=
 =?utf-8?B?cXhUczJNQ1M3YVNrNHZ1UzJCa1ZvNVFPbE5pSjBhUHRVT3l6OTBRYXF2RnVt?=
 =?utf-8?B?MkxtWUFxV2tJUXE3QXVVNlV4TjFJOTZOVFlSRW05SXJNZW9xdWxLb3hKSE1k?=
 =?utf-8?B?RzhXNCs1QUpKNGViSWQ0Z0NCdElaY1VCNjZidE4zRERaeU5POU1WK282cTJC?=
 =?utf-8?B?dWlPS2Q1ZkRGRzVCV1dadzNBS0FabU9vWEt5K1U2Ymo1OFFlNC9CN1FQTXdC?=
 =?utf-8?B?dW50djR4Vjl6cldZL2JQZ3BRMlNtSXVmWWM4L09zNnFJOXZOYVhzRmhpSS83?=
 =?utf-8?B?ZXNKUzVIUVZRdVhSUmFhZUNDbGhMWEwrQjJTRmlCTVp1YVRYdHlOYlhaQStx?=
 =?utf-8?B?eHN3d3JUS1JCbU93emR4WlFNUjB6NmFPbnNjUWpzMFNLQXlZK3dvTlFtSExa?=
 =?utf-8?B?b1F3ZXQ4a0Z6YkJLcUNqVkgyTGtjL3ZOTmVyczhrZXNGSllONCtSZ3czSmU5?=
 =?utf-8?B?MVBTbjcxSEQ5NmliZGpSeGY3TXQ4LzdYdi9YbDJROVozeDVMSkVYdEhPUkp2?=
 =?utf-8?B?TlNTNWw4SjkvcFVCQU9penFHcFVmYVlaYVpSWXhSZjZIQnFrQks4S2ZkeGtq?=
 =?utf-8?B?RGI4ZzlGUngrYktpZUwxRVpUZm9lY0RJNi9XbkdDejhnNy9HVEcya0tFaEZx?=
 =?utf-8?B?NFlLOGVLOFF5MXdUQ0hsRWpYSGdleVpIeFA3K1NpWmpZcWo5N2sxYzFFY3kv?=
 =?utf-8?B?dFVVV0pNQXpYVVp6UDhvSzNQZ3ByWGphN1EyYkFHRURUNERscWRLU0ZXL25F?=
 =?utf-8?B?Ty83Z0d0c1lGSzVOMTJ5Nmg0OExJdEtSWjJMTFlzZXdlSUNxWnFweVlxWk5p?=
 =?utf-8?B?byt2SXdiSkMwRDZYYVNFM21vVmg1Z2VqdWppWndkVlJ0ek5DNXhPbHAzQjhO?=
 =?utf-8?B?d0U4Q29tV0tPbEJCMlljNHIwWEJsclZNallhVzhNY0FKdjJRVHZYOWJVcE8z?=
 =?utf-8?B?V2xMVDVQMUwxdHFqSUt4djVNWWdLV3J1bWhZZjJBU3YrTmNIaWdrMkJYUmZU?=
 =?utf-8?B?ODB1RkhCK0p6L3pQZXkvVitvQkZEcVZ2eFNHWW5wbDZJdlJWMlFtbEE1TlNq?=
 =?utf-8?B?OVlOVkpac200UURKNUFzcGJ4T0J6TWZ6VlhVTThIbHd4am9WTXl0OXh5MjZP?=
 =?utf-8?B?dFNjVVNZa2JTR0xFb2hNVC9HMS9mZ3M3RTcyNURJdURIOVBkWHVOQVYvdFd3?=
 =?utf-8?B?Q0FpU0VMT01uTWNSN2pHZjBlQ0E1UHJoRDFRZ3hENUlTRUl3U0p1SHRhU1RO?=
 =?utf-8?B?QkVHRkI5WUpaU0h3ay9zYmVHb0hkTzJTaTU2QUVoYlRSa2NCN0x6cWxTdnVq?=
 =?utf-8?B?THltMzlqRy91aWNJaVYzVnZyQXRFb1c5MDlTdDVhMExGdVZVR3dsS05wbDdw?=
 =?utf-8?B?RWJJak8vZzdDZ2dqK1l1dWRZY24waUNNNXFSbkhHZmFrNHdyM1lJa3N5TEph?=
 =?utf-8?B?RHlrb2s5RWZycDROVFlldzV4VDdFbGpYaWhkYTkxU3NJQ04zOXJZUlV4Y1pl?=
 =?utf-8?B?YW1VZzIxeTNkVC9IMFVKZHVrdTk5THcwMVdrREJuV0lUNmdaRmNPdTRhb1Z0?=
 =?utf-8?B?V2FEdTZXdnNCT1NUNUg0TCtrMlFiTVRGbmFOdlRlczZxc3dySmg2TER2Y0wr?=
 =?utf-8?B?TEtlNDdTSEllQWRYeUpyVUx3czNWZGZzWTEyU1V3WkpFcmJDeVY2RlowOGV4?=
 =?utf-8?B?Y3NLcHI2SytpZ3E3OGE5NUJqcUhTY2RvenY0UmZkY1JOUHdEa1pzQ3dVbDhz?=
 =?utf-8?B?d1hMMlZoSzhhMkM1NlJZb25pMm5WR1FzeTF0VDNjdy9RdEFWdEFZaUtnSEhm?=
 =?utf-8?B?V2xRYlBGNDFId0N6YTFqMmNCdjRXTnd0ZWJtNVVsb1I3YWxiVWtmaDRFd2x2?=
 =?utf-8?B?Zi9qWG1TaWxERG1sUTJMbTErMitrbnJiUnBpREQrQmxxRVNNSHNWWlJBUENC?=
 =?utf-8?Q?doL3MoYIaPTR3AhdcZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb0015b-d0c3-41ba-5140-08df1dcddfd8
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 02:03:37.2032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gu0TIctfRPrMg9NWuV9NQw05vxXFZPnvBTY5YDZNnQM7s6YDRrAqfpN5q80YD3CQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9313

On Mon Sep 28, 2026 at 6:06 AM EDT, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> MADV_COLLAPSE is a madvise operation, but its implementation sat in
> khugepaged.c.  The daemon's file therefore also held a syscall's worth of
> code that has nothing to do with the daemon: the walk over the user's
> range, the per-PMD loop, and the errno translation.
>
> Move it to madvise.c, among the operations it belongs with, along with th=
e
> errno map and the policy it states for itself.  It takes a struct
> madvise_behavior like every one of those operations, which is where the
> range, the VMA and the lock-dropped flag it used to be handed separately
> already live.
>
> It stays a caller of the interface khugepaged uses, so nothing about the
> collapse changes.
>
> The !CONFIG_TRANSPARENT_HUGEPAGE stub moves in with it.
>
> Assisted-by: LLM
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  include/linux/huge_mm.h |   9 ---
>  mm/khugepaged.c         | 159 +------------------------------------
>  mm/madvise.c            | 170 +++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 170 insertions(+), 168 deletions(-)
>

LGTM.

Acked-by: Zi Yan <ziy@nvidia.com>


--=20
Best Regards,
Yan, Zi

