Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010047.outbound.protection.outlook.com [52.101.56.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B41136165E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 19:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788810402; cv=fail; b=WgSAPu8YPEGioB9EW6VwjztVqLPx09ZG/HTqccrJ9DjxZ7oYRHGPUmZAdndCCqxA2HLdKe9FE7ocIuY153m9L485FdFJ/dQ+Qv+DcOlbn7MIgeKjKIM/AMGMhghyI3nTZVoFIVriaNAzshTLWrhWpmxEeGMT7hTJp6tu8NlAJK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788810402; c=relaxed/simple;
	bh=ftWJgR8iho81CZZImRF/F56lzkwNG310+IQ2fbs84X8=;
	h=Content-Type:Date:Message-Id:To:From:Subject:Cc:References:
	 In-Reply-To:MIME-Version; b=h5qVrGwuaPpGCqHsbjj+S1AGJbHBO0Sx7+FRt38zctTA6S3J0ReRJby/CCLGWr4TU7fI9ByAbFL8t7IU6Pr85V3j6tYgRZEA8zZaBzPMnTuTb2mfExu5oolTUelqtvQAYJbLBocpIThRFESYe41DyJEghvNvjrp2HJMkIOHo1LM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X5nemLm3; arc=fail smtp.client-ip=52.101.56.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X5nemLm3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1x+nElI+NmygFykIXS/9KCqIcsaTFLXc8eDuZmvea52x0o3AVxTsKD9Ry08NhxesyJPwScTkYmrvGTj26rZ0DT7hC3u59V4dYGM/RkSKkF+6/hdeF0c99gdlUjO6He0C0HgMsXEj+vh9Y+JknpTxEu/NJ/H2Sebx1o8YC3dSqjmT8cIE2z/mWCy7xtp1olosFJN3Xn1aj96HXKIn/19avri0gZ4mPbscfkNamQpwELzS1h408BHPUNFM1upxStIXDG3AbTUxpVOmcxXSQlayyH5wyHh9hLnxcUf6lSBgK2RMRRG6fUkAD1oxtlOAcHOEokHcGxgk9yADZ8la8E7zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWMIkOs66aH3wA6ldDsEtGv8A2YYl4TtebMgmNLp9lo=;
 b=EkgPzKMKvvflIY4CxqwG988JH2tCkAzT/Vkd49KNGZwVPaNHQhqWCDOnTo50F0siwzi5Wjg1zNfU4Hgz+KZ89nEwVjOyGTY2fuT4cTuqzGcwbOtWb6u0rOc2jryUL2jPdq7IslzkFsaV4iHftzKAq9owkF9PlAcH01Aj+zbp6KaxhH8abpoOoD4u0TaTJTMNUKcTD+tXI0kZ7hnV8GOl28dMnj/JuDgPlFJL4OGWY07QkAxK0S8ChyhhG3u+GiRRAbzkYpVbQAqphAH088d3P/jIXvVpvaLhHzooC4jpDOe6avfWzcxUq/f7lUfJ+jrH1JthZ/7EoE04v+0smAACDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWMIkOs66aH3wA6ldDsEtGv8A2YYl4TtebMgmNLp9lo=;
 b=X5nemLm3msP2kZs4pNGOPz8L35Q1p/xsFWES6TzYIfiMeDFeWMw6ooLrpDxPoeDgpYbS/F5CwOKRQsmzKzQ8zlaUUBZYBOniQ+i5A7aPWcj/c2EvlCuPMidJGhHuOEnz7qYI3IixBbrefUO6brisvAOZ8v85t8HVFu1OBzGyg2ODQUYAGMXLAiIgOkx+Qn/JU47BVFC+bAgWauZdymxJGy9+M4yMO3slAm4yvEvMMAjcYaHPcxXMUoZwHBNmW3XFhiEK+YQe5O+szUc7O3A5cZiQ4sSO/OT2oUM2m01iNQ1XJVt5B+LyI+rkeSRLm947EUJpQDVrUJdRBre0YqRsMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CY5PR12MB9056.namprd12.prod.outlook.com (2603:10b6:930:34::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Mon, 7 Sep
 2026 19:46:35 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 19:46:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 15:46:33 -0400
Message-Id: <DL9CD1Z14Y2T.1NPM9ONGAXVJA@nvidia.com>
To: "Kiryl Shutsemau" <kirill@shutemov.name>, <akpm@linux-foundation.org>,
 <david@kernel.org>, <hannes@cmpxchg.org>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH] mm/huge_memory: add folio_reset_partially_mapped()
Cc: <ljs@kernel.org>, <usama.arif@linux.dev>, <lance.yang@linux.dev>,
 <baolin.wang@linux.alibaba.com>, <liam@infradead.org>,
 <nico.pache@linux.dev>, <ryan.roberts@arm.com>, <dev.jain@arm.com>,
 <baohua@kernel.org>, <kasong@tencent.com>, <hughd@google.com>,
 <balbirs@nvidia.com>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <kernel-team@meta.com>, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
X-Mailer: aerc 0.22.0
References: <20260907183340.1446132-1-kirill@shutemov.name>
In-Reply-To: <20260907183340.1446132-1-kirill@shutemov.name>
X-ClientProxiedBy: YQBP288CA0016.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::15) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CY5PR12MB9056:EE_
X-MS-Office365-Filtering-Correlation-Id: bab0c4c3-accc-4974-0f1d-08df0d18b93a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	xgZU/zmW3IeMt7lZTnMWlODsE37caLfAU0tN5urkihp5xrATyojxOY7GgBAmmmbvWLTyve3VPqSejSes9QgJ/3utq4j6bdDNlGUDmBI+ungI08kFr+Ld/w7ABk1cW3foLqrHXbRXV5EAIUI/lwssPhhTCxGcwg0Dg3ObxmS0V0BTA7SGhdRu/mBoIYKebinuW1QVr69RnzI2lRbsTJO8WAjjDZlcFp6hGchnV9SCP2w8yPUf1eS5ou8CgnWQPI9F8xlRZI+EbcJN7iKz5VqRT80EUqiXq+0iegx8aS/gzGd2xEg4uytUhHaJLwrPPFBlE+0HMgvY8aZz1haD8CtdmLmB0D+xHb1iI3GCc2spGtQjA4dnCc0oNFQcZBzTxeVPAjpfSgOvoHP/Hlu7lHuoC2YoUJROWh+yyCVTmKTdVZAx3Ujuv4JA40Ig8+omviW4bCknsFa21JypPoRggwwnHmdAHWf2gOpLfvxNrZyiDaHggpBzQtFkor+j86LSPaJ5nahzkGTMveISjLNafpNysvBpWNDmThRKYskmxZqZsj290EsLVUwoQDD/m8wMxyGyitjLaHfJ8nVqidXevBzbIXJ2nXlnDdcLBIQ9HDm39hQN7CigpVQstPqO1T0uruwc0eSO7hPl6taDiSEWI5DlUfXVvBJYvIm57mUv2ZyHxy4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXlUL2tITDJYOTdCTzNtY28xWUJKaW1TVjM4RWVrZGZYUVlOMEhiUGJPV0xq?=
 =?utf-8?B?ODd0Q3NVQUFpMkQxVjZLTjFlRXZhS2pOMTc1Zyt0V2paYXUrSTRmTUlWL3lp?=
 =?utf-8?B?SmFDVkladmN5d3RQOGw1WkFxVUFxL3dyYXgxOHNtaUdNOFRsZFl0VWNRS1RF?=
 =?utf-8?B?Y05na2FXd3A3YjRocHU2L3ZPeEdBNWtzdmlKNjBwY2NjSkNRV0F1WGs1bmJJ?=
 =?utf-8?B?R3NuOTIxVkhyOGE2SlV5UlNMSHRrWUV5U0lxeXJuWWxaU1MwRDhpZTBpZy8v?=
 =?utf-8?B?dWdOVXVzQ3pDUExXRGRvVjdyS3drWlROdm9Gd1RWelVtanJCWXJqMzNTNU5Y?=
 =?utf-8?B?aWhHZ3IwNC92ZENHMUFmT1FINnVhajhqbmR2Y1VieXFoaGwwMmxYbkQySkI3?=
 =?utf-8?B?NWRTZ3ZnejhCUHYrMTJhUXdCSVBJNDlqb2xHNFBxeC9iOHA0ZFB3ZDhFcW5v?=
 =?utf-8?B?MENZR3o1QXpGTHEyS2poU0FWUG9NUGdJNGJaT2pDK0FPT0JQUnF1MVlRQmFQ?=
 =?utf-8?B?d29kM3QvUkRveEdyZTFkT3ZyL0l5K3BFRUxwUThEL0dLSGlkeUpKOEFqQnMw?=
 =?utf-8?B?TVE3V0ZqeXZIdXp5cVpzYWpnOTNIelV1UTdqK0Q2S0VIaFp0cUJVZnoxS1Qz?=
 =?utf-8?B?c1ZrcXJvd1NaWXZrQjdRZGlQeTRROUtaUXpYQU10dmlleDRmVWM5ckV4b2x0?=
 =?utf-8?B?ZHhqMFFEc3NKbTEzdDBzUjUxZjZLcGFKZmlMQXN2L3NZY1ljdWtLZkNod25P?=
 =?utf-8?B?TERqbHNsS2tVVUtSWmZLa3kreDVTNTBDRWZhNDN3SzUraU9oMlE3RnBLb3lW?=
 =?utf-8?B?MU9ZQ1pCY0VaWk80UEhkd2ZCbW5zVDFKaG92L0k3YjNWd3ZIaEwvN2xRWmVH?=
 =?utf-8?B?MjJaSXRFZEYrTE9yV0J2SW4ycmduQjkwa3drb0twdWVBdU9ReXFtR3FxejRD?=
 =?utf-8?B?TTZBQTN1UUk2T0xtdEQxbHQ5ZHZ6UGJjTDkrdFZjOHh0OHV6djJOVUlUNGdM?=
 =?utf-8?B?N3UySWRBQ0xpdldQSE8xaGYxSGZJSHNwdG1BTkJTQ0lXMCtsczdxV1hEZ1pP?=
 =?utf-8?B?bUhaZnZrSXBSVVZhbmwzR29HSVljb01XbnVYRUlWbkhqMHF3NGR0dU1mNk5l?=
 =?utf-8?B?aUNiS3VYU1hPd3htUXhaTFNJSFNZSm5WelV6VzZLeWtzcW80bGpoRTdVYWZr?=
 =?utf-8?B?OXdMUXFEK2lPWnF3blh5OWxTTHFLOER3bjJ5d2dWbTEyTFZuM3BhaUJ0a3Z1?=
 =?utf-8?B?SjFSNFFaYkRXNXFzbWlyc0NWbTZrVFd1QlZ2cDQ1dEg5YWxySk5oOEJudVpY?=
 =?utf-8?B?MWZtNTdxUDJHMDBBTW42UmhqbFNmRC9XTUNnY0kwclFwOUxZZldENUVrVTQ3?=
 =?utf-8?B?dUV0ZWM5K0Y1RjNCdTFiNDJmaERwUElYN1VFN1hUeUtZNGpRc0JQamlaV1pQ?=
 =?utf-8?B?ZDRvcHgxZHpuRDNzaHdwZ2RYdU51WU1rR0RhWmtCVHFjYzdvTG5kQUdQYzgw?=
 =?utf-8?B?TE8wWjA3NlJITVRKbXJ2dlVOUWZCVUxVQmpGUFEzVWdHb2IvbGRzU3VFbzZq?=
 =?utf-8?B?TUlLdEIxOGo2aUFaS1dKeVZlVHdqSzNidUVVclU3ekFuNDhoblZ5b3NvbmRI?=
 =?utf-8?B?ZUFXUC9USGdZUm1QYTcwdkdnR0lBb1ZZbnJCWnR4L1YyQVhmaDBYNXRsalhH?=
 =?utf-8?B?ZTVONHpqWlorTlBHeTZIOUFOazF2WWJRQnJpa3V0NlBhNUQxTmQwVWNPNjIw?=
 =?utf-8?B?eHhJTFBFYlIzZFl5M3FWYU1QdUFHTmVMT1ZWRi9jQVdGS3M2OVJiSUl0NDNz?=
 =?utf-8?B?N2xPZjdwMW5tYkw5akRKTk1jeFk2YXpwZGRuNGFQL2VQQnc2dVFYaW52cmZJ?=
 =?utf-8?B?Vk9yRXZHbGRoYWhjRkdnZkpjRlhQS2pBT0NGcS80VGNFUDFhWW0zSmRLUmVR?=
 =?utf-8?B?S3hBZmhXY0x6YXpWUW5rWmJmMGNyQ1FQT3VmMGlkcmZyRHFIS0hlV29WUzBI?=
 =?utf-8?B?S29tKzNZTEV0YlBUOGE5cEhqS1FIVXNVdTZzOWNmUUZLbEpKcDh6NVQ2Y3hJ?=
 =?utf-8?B?b2VWTVNSU1RTQ3lISVV0Vy9kN1F0ZkV3QnNCYVZqQm1qMmVMMjdnUmhkb3Bw?=
 =?utf-8?B?VlFUdzRjaHBVYnZzcElUc1dTZUxLdjhkVitWc29ZSnEwVXIwWWpoSnhKQUJD?=
 =?utf-8?B?OVBTdE9jazE4bUd1TCtoeitYbmJqTHRIY3VUdXlCZ2dNVG9SdVJ2b1EzeU1y?=
 =?utf-8?B?ZlRoTDMzYVVscjk2NWcxQlVTUk5KRzFBY2dKcnJha3p4blVUVHZHOUtNanR3?=
 =?utf-8?Q?Q602AHigU3idwz7yQc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bab0c4c3-accc-4974-0f1d-08df0d18b93a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 19:46:34.8927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iGcc/Oy/16FogydtawPWAAo7g5C4jISA7wXqiQMYye+jY8fI2hvgpp7ui1TzgiBO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9056

On Mon Sep 7, 2026 at 2:33 PM EDT, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> __folio_unqueue_deferred_split() and __folio_freeze_and_split_unmapped()
> both clear PG_partially_mapped and take the folio out of
> MTHP_STAT_NR_ANON_PARTIALLY_MAPPED with the same five lines.
>
> Move the block into folio_reset_partially_mapped() and call it from both
> places.
>
> The helper asserts what both callers rely on: the folio is frozen, so
> deferred_split_folio() cannot set the flag again under it, and the folio
> is already off the deferred split queue. The list check sits behind the
> flag test because order-1 folios have no _deferred_list.
>
> folio_order() is safe to use at this point in the split process: it
> still shows the pre-split order.
>
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Assisted-by: Claude-Code:claude-fable-5-1
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  mm/huge_memory.c | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)
>
LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>

--=20
Best Regards,
Yan, Zi

