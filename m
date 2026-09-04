Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012049.outbound.protection.outlook.com [52.101.48.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FAF4F6473
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537539; cv=fail; b=gIkfigBqesreHEojq3dx1j5WVps/t790BLJCU/S98SVsQGqbETKNDlsHepYUbywl0F6K6WPUT5wXOPpGkVBHKFh9SLfZQoPx+8Xp1WFKVrVzQB2sDtWvDMT00pE8XayRiYHNAclNKdIcnkbjuGKStqVm6CvibfW5c41HXFnpswA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537539; c=relaxed/simple;
	bh=v2OCcVEbQjeH4O8dYnkxt2lh3Pn+kCdB/QqeIAZrCQ4=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=GfnYzIBScn8+EGOLhn2QNIOMq8/0Sq3lzb4Ur2fAFgmSNOcKXdXbSfo6XzJ2fTVqFYumR8X/A2rE56pTSSXV3yHI8rxCYa8HTh+fRl9ECXzIwshL00dXVI4/bKdzPqOtHrmB0+DKfW6d0u5GgMiUtKebOYauJnvwiMk9+AOnThI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Oqs6ZUY1; arc=fail smtp.client-ip=52.101.48.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Oqs6ZUY1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P02oAO/qYTjkJTQ70a1egOyvhYTPNSTC06J3NqgQSVMQ4L6r84nb3PrFNIaOBgJ4tu9AT4cjc1foLlTkcs04tQhRrsOoVM34y/LhwuLgc36m6QggrogMC34OX5m96MMe1nA52JtasJBkuE3q9vaX6t9JSMvJzhcB7DujLQDcgK3b/GIO5K0tuHVT1hPUWDPfic9DQiFrLzAFKJdXr62edPrf9CcLx+y9Y6/inHoLBQ3t7BUqneagaMEqoVOTqZ/oFRj0OdokMnk3SnVbeOqNhEALGfalMHPPbrf+ipTcVuP9HATyErc7OOXk6aFv3bx6lWUA7JzMkN9D8ea7Zt03dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0G9oA4dSwDDgbGhVpUTyytMRStqnzukBr/vG2X9H1Yk=;
 b=dgmgOk9s45lVSv1fdldLszpGVFbq3uB+qKoclmNc6qkY9mT8lmo9+SYELjsns/f8uoQtlNGP6NkGQA2nzbcJbqOEgAQW6Gw9zhjgAinhlclmG70MDjfad1GoHWtRgL+1KKtTM+KyiGrLpt8uY8EFUXgNJmCuPdb1Ep6iT+E2iP+rFZHNWSkBz79xP+4KWPvIodMp4vT1eE3ojhTZQkuLYJ9RegaQbx8XCC/Vtg9B/wOecx3+ZWYdb7AmcG/3II9UqD1iDkq3xaOlF4pijxKpJOCiY9znlFw/Nn9gtP/rxjsXsnsE45R995kHIVuopd7th4fxehaqbk/DCofqo4Qn8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0G9oA4dSwDDgbGhVpUTyytMRStqnzukBr/vG2X9H1Yk=;
 b=Oqs6ZUY1XcuQjfLir1VTbEgtxRG8udXJnW4l6d2ls09M/9ESLS0fpsd2fta3jL/WIRD1ObTWkxnZpMRd+nO5Nt7HPjFNZSJ9yrhY8kD4W/JqDhHV52Zq2TWPtqG2pdWMhPi6qseMZl/PXKWrxh2uGwFhKPOBumUfzn69PiePuj1CBsZjxH4fnB9twpoP6dRs0esR+lWTH107JA2d92X8/s92oZzJ3b5sqMEW+4fEeKojIHK10WlnaC/8sfK3C9nOU6DA0pirLNkSUp2qMP24fhfWtZJdlvXFE97GmLO7a8tsSKdqMHvkXUdUjRGM5o5okyvCHx5A4YeepaytUWJ+iQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CYXPR12MB9319.namprd12.prod.outlook.com (2603:10b6:930:e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 15:58:53 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 15:58:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 11:58:51 -0400
Message-Id: <DL6NN34XP6YZ.2NCIXIJSS7U6L@nvidia.com>
Subject: Re: [PATCH 01/12] mm/khugepaged: drop redundant mm_struct pin in
 madvise_collapse()
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <kernel-team@meta.com>, "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <liam@infradead.org>, "Nico Pache"
 <nico.pache@linux.dev>, "Ryan Roberts" <ryan.roberts@arm.com>, "Dev Jain"
 <dev.jain@arm.com>, "Barry Song" <baohua@kernel.org>, "Lance Yang"
 <lance.yang@linux.dev>, "Usama Arif" <usama.arif@linux.dev>, "Vlastimil
 Babka" <vbabka@kernel.org>, "Jann Horn" <jannh@google.com>, "Kiryl
 Shutsemau (Meta)" <kas@kernel.org>
To: "Kiryl Shutsemau" <kirill@shutemov.name>, "Andrew Morton"
 <akpm@linux-foundation.org>, "David Hildenbrand" <david@kernel.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <cover.1788533997.git.kas@kernel.org>
 <1ff754df1d57154e01356f35d72b1cb06c0f8664.1788533997.git.kas@kernel.org>
In-Reply-To: <1ff754df1d57154e01356f35d72b1cb06c0f8664.1788533997.git.kas@kernel.org>
X-ClientProxiedBy: BN9PR03CA0581.namprd03.prod.outlook.com
 (2603:10b6:408:10d::16) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CYXPR12MB9319:EE_
X-MS-Office365-Filtering-Correlation-Id: 3051563e-7f94-481b-26fa-08df0a9d6b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|4143699003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	g26mfjE+eIXnLnyytjvfhcNDO+/JW5fbdOD27Soic3XJRuYgJj6FIMjQG7cUXo9BDmS2sKh2X4y/bMP+pUjJZPtrdapfEGZw/Roqc6tC64zLbqaPzl2ThdTB9yCEmv469p0AMtqfDpKc/ILWcxWtYnd/Qmv75QIyFf0ur0r55Y2USn0+G/0zcYEp2MWzcF1VchtL4gBGFqNpmEq6p4etFX+76ULpJnpwoskDNI54AceHfHVAv3md1fcD6ZVcCOmQWJC/yeIGJemGymmFbbPAA3MJ9I1f5raxS1PsQSXTMYcCk0kpiGdC3po+yTNy0Hbvu6tbUe3XaWjQoq/LppP1sdEIP4dvAhyi7BOrcexgQH0jNBhNXYXZv5bpXFebwno8HP2C6Zki6fzDmnya6lnk2NMgvgxKV7R/i4vKniwHxwFtsCySckjWvBIa/luyZLIwM/cFpVnBWNJeJLDDVPz3LXVzTT3hFETKFVGygnBkvIhpmPKtZJw82k91m0/JZMC54UxqwfoNlTZV1xdToZGAjiwC878bOKLFuwi5RTycQZiy2KqKiEnnUcNl0gODIqLRDh4NwUAuq8AC7Y0DRp+2uHG7YqEKBTOoClflx8JfV19JtZNvx7oxjJygI1ayi5qm3E3jDQkMW7RdQPEb4JUN7bxyq675iUJrh2oDzmLhOTw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(4143699003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vm9HNUZDSGo2SUkyaW82QlVKRmkyWWt0ci80VG0xclplTDlyejZGUU14ZkRI?=
 =?utf-8?B?dmhjMk1Nc2Z4YWkrSXVxTzZ4UHhDcGxMdlpxaUNQMW5ScmR2NllVWFpUcnVT?=
 =?utf-8?B?THh2eFUybGRtNHNOWWNXWU1EM0JvUU5DUDFmTlN0ckNQdXNaWW1vRU1kSVR6?=
 =?utf-8?B?dUREaU1BQmNYWlRXMVEvZE5aMGZ1L2o2QXRjQ3BoL1lRWWVQaWZ5cEJwUFJq?=
 =?utf-8?B?bkp5UERWaERlMVNvdytHWkN4NDQva0FRV0F6aEhkMUNJUy95UGVnSHpDT2NE?=
 =?utf-8?B?Q3hIeHFNN0VDNjA5blVBdWtJSmhPYWI2UFNkM0hiby84TFlzeklZTWl0L0Rj?=
 =?utf-8?B?ZExBa0pIYlpqbTBCa1ZOZEVqcG5ySUErZjdLSTQ5UDF6eGVXWmlyYjZFeVV0?=
 =?utf-8?B?b1dWUUVhUkpScUFpWGVzMTJ0YzFoWHRBd09uT2dIYUhsTUtncytzS0Z4Qnd5?=
 =?utf-8?B?SjBKSGQ0blBaQlYvR0VicG9nSTJpS0hOOTMyZy9LM21aK2ordnVyeTdxUG1j?=
 =?utf-8?B?c1FlQjdrSTVEdWlBZTgzSlkzTjlIc2txeGFHNzhxaWt6STB0RUd6V0VzdnRM?=
 =?utf-8?B?L0RxYmQ5dmo5ZE44Ny84ZjZlbXpMWmRZYS9LejlHR0dvZTcrNmw0eHJpOGxB?=
 =?utf-8?B?WDZvWXJ5NjgyRFJqNjhJNE1tYzVtcFEvUnRnMlUwRE82TEs5SmF0eDFLVHFO?=
 =?utf-8?B?OHk0dEp1WnBZeGtHcDBMemc5ZWN2bXBUSEJSRXZUazZUMzJCNDlpN0FuOEdR?=
 =?utf-8?B?QUo5R1hKOVVMdFU4QmU5cUdnc3VrRlBiM0pwN0RPOUlERm9INDJ4UkZXMElY?=
 =?utf-8?B?dmd2NWdDbTJrbFFWWG80aWtsa05mMStWcjJLQUFCUzR0ZVlrcGtMcU1mY2Fv?=
 =?utf-8?B?dnVVc1ZVd1Fyd2l4NlFYY0VCRjI3SFJ4UjRLQmpLdzJFbnFUWkpzaVhkWUtC?=
 =?utf-8?B?dzRvMVdlY0VjeFp1Z0NyK252b2YzK1NvVllPK29pOVFHZEY2enlWdlpqSldL?=
 =?utf-8?B?S3VPcTJ3MFAvbnVRZ3dJR28vdmprdlB6ODNnUUtIRllaTEhQYzJIZHRzM2hY?=
 =?utf-8?B?c08wVFY2QTZIQ2M3bGxpakYvVW93aUFtalZtK1czaFU2Y0draVNPSzR3V0h0?=
 =?utf-8?B?dWhhY3hMbEtHaExvVWRNVkRjREtGOVg3WmVkS2l1aW9aaWQ4M1dXQjBCRWF3?=
 =?utf-8?B?OEFGV1o2VEpMSWJTa2JMWHlNc2xqei9jUGVTMGhCTk5SMUNidGljdWM5L1E4?=
 =?utf-8?B?RGhndFNOUmp2UXptaTlsaHNLVUREMStDVlNrTGszS1I4dXR0TVYzdVc0eDQx?=
 =?utf-8?B?L3h5bmtUOGxFeng3VGtjcDBzZXhkK2p3dW9QbGl0K05BTjdvNTBrT1JMQmoz?=
 =?utf-8?B?RSsxQjkvTFN5VnUxblVsdkZMY3ZsakJ3emRJK2xBMkxZS0VZOFZldzIzNFNP?=
 =?utf-8?B?ZWk5c1I0NG90NjhpdVB6Z0QrOHRieXlJYVJEMzhHejZFR0t2SnN0WUVNSFcw?=
 =?utf-8?B?WTVaclRhc09GbDFWb1hrZFlZeHpuV0duWWxZa1lzYnJWOU0ycUtGT0l0QS9S?=
 =?utf-8?B?Rk1xTE1GQitnQ1o2cDRwcm5NZzBwNDdoSG5ZSFVsRTZJM2hhQlBSSFZxVTB1?=
 =?utf-8?B?L05SSW9aSkpJSmxvWjUwNDVQcWZaQTNkWDNBT0tpWXJuMGgzdXRqczdhQ0pi?=
 =?utf-8?B?b0xrOE51VnBHbVkvUkhPQW9jUkVLcDZkeVAwdTlSeDlqUURJRjkyRUwwanBx?=
 =?utf-8?B?MWN0ODIyRnZrc3Axd0g1SjZwaS9GK1VWYjB4bnFaWWZGQUE5dUgwMmFUaTJX?=
 =?utf-8?B?R0xxZ0ttZ3dIMDN6K09ERkxzWDZ6VjZlWXJldUx2OW9WZUswSmlOb2NFdVQr?=
 =?utf-8?B?ZXU4NnA4dFVyWUxnOHMzSjQ1V0dkNFhtZ3FXZ29wcXVaWHI2U3F5SWZBWi9h?=
 =?utf-8?B?clFsZHkzYXpzR1BvNTBWNGxxMmNtRzhqZndmQjRYUUZvL3k2azd0SDRZQ2NR?=
 =?utf-8?B?cHlEWGlGV00rNzdNOFFNQ0NZcXFLeFJabmErNHZiSFBNWWhkb05nLzVsdUcz?=
 =?utf-8?B?YmZpT1N5WHgvbnJEOVpzN25WamZTRjhSeit5c1ZpbjA4QXl2Nk9KU200TW9a?=
 =?utf-8?B?ZlJmZW5Qd0E0TWdFaVBXN21YdGc1SlVTanhFL21rNlZOUENsTGc3Q050a3B1?=
 =?utf-8?B?eG5EM3UvcmFzODlQTU9ydHAvTy9WM1ByRVNBeVBxTzN5d1JIb1M5N0JldmZD?=
 =?utf-8?B?ZlFaN3RDeGRzSlUyZThQd0JUNzBYL1dySFIwb3A0NjJHOU9DZUsyOHlWSzA2?=
 =?utf-8?Q?Zg3/gKIB6083qwFRQa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3051563e-7f94-481b-26fa-08df0a9d6b04
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 15:58:53.3417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjBXeEy6QlmONbKAC9vGv55+1ODe6CuW8QEIZFs5PkD45hK0MxveggHYQFtdpIcE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9319

On Fri Sep 4, 2026 at 11:10 AM EDT, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> madvise_collapse() holds an mmgrab() reference across its work. It is
> redundant. Every caller already holds mm_users:
>
>  - madvise(2) works on current->mm, which lives as long as the task is in
>    the syscall;
>  - process_madvise(2) reaches a remote mm through mm_access(), which take=
s
>    an mm_users reference and holds it until the syscall returns;
>  - io_uring passes current->mm;
>  - DAMON takes one with get_task_mm() and drops it after the call.
>
> Drop the mmgrab()/mmdrop() pair.
>
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  mm/khugepaged.c | 2 --
>  1 file changed, 2 deletions(-)
>

Makes sense.

Reviewed-by: Zi Yan <ziy@nvidia.com>


--=20
Best Regards,
Yan, Zi

