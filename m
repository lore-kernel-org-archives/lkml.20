Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012044.outbound.protection.outlook.com [52.101.48.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4C938422E;
	Thu, 24 Sep 2026 14:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259120; cv=fail; b=cCKkhFBnPU34/yhMy47mGwQdXP+kpAZcX8hDjrQdywP+pJsx8Y0XdImnog9kvLCjfBc1cXVxz73zO4ML7Lw42ISleRO0j4gVjrOVy4ZAJFTg3pyE73VLmsFgGby6NHQNLB7hpqyUN8PQBUhjMeRhpSQwjpg3to51Fr3FQn7CmCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259120; c=relaxed/simple;
	bh=uKf3pmarI5LlWOyEfsHtXcuUCqy+P3hTbrHjUJb59+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PSYvB0uXYEMeSxGpLqCIeS8VSaEFf9ywRFEdZU17oKVe1c0QtcBDU98/m73vzYovy3mz2blLi6aHkGHSPyoOrFgqPUIIZgk70IqTkGSKvpmat7Mo14uT034P/aXUz19twQoN0S+b6+x32IXsl6CZtVgwO85Te1LVVKHAB1D6MYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rqSMFZY2; arc=fail smtp.client-ip=52.101.48.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rqSMFZY2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lBFd9/oltkUwbgU5HqxithFNJer2M+l8/9tj5iYfC+L4EIyX7CPjq5PY8rGWfHZvZqduYaqfCepKOeuB0UfGT84B/eREmk9wg7U1AfWxr5XcaFPYsoMplD6vsOC5TiaAw1KtBgzQ2Sm4esuNWSw3lXLI8EXGmEsb4CPxwkZc4VmYofPEjEa8sDcTLUptaRxumuJpF/0wqUFKpgf6AVbo0Y1gEAH/Hf6OfYhZkU0X2BZnuOYTLicESnDNDRB31aWxDv96p9cKInh1XtKcFsJuHJwB3quvl5rjo9GE+l0RjBBCTnE2sRBDm61BiNudgfdgYt5xokLgxWlRkjVcVSRbBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQxpqBjOoiTGhzV28vyJGE7u7Z5RO9TKG1z/6FOHAFA=;
 b=neM6mworXpAgsq1F0dHuqbFT2ktoUk8JoaPqUp8tCwQQumO+JYvrMc/20r/w+NJ76wLKvgx0yzbnp62dd8hvbT5fssPs6iuUq41xfN+0ogNrLZLrhxwTsTdnzLz8m9jLYMbjnQuGwcUPuy6l5ZsVyGkx4EtzKJUcyiiRoITbDaMEufUhabVsaZdm04dmx/k20nJUnxKijMqsUzCu05fyDIyYLHIueSmIjyBXZO0X+GvAFmj1SgTzfMHd3LVaQlDuw4J79bQdTHJG//1Vb4hGLxm2TWk5oY3lTQnjKR5VOMMf9AF4M6IVchnwdphFyV1kqv+Fjg5HMhSqJ5ueSFHahg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQxpqBjOoiTGhzV28vyJGE7u7Z5RO9TKG1z/6FOHAFA=;
 b=rqSMFZY299UaVIEB41dRqs177Vbwu6Jz4hzEmPW+GT3azPqWiSgaUAvbUevORAyfIiYMZrcAzoTkWDFwcnF0lK+hZ//66HuIdee1xCUo4E1I/CtHhkC0H8r+mh0m1RDKbz4NPO3LCULs2mWDkdYewIXZ9eapU0a7QMo36rXPp4Y=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 BY5PR12MB4081.namprd12.prod.outlook.com (2603:10b6:a03:20e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 14:11:55 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 14:11:55 +0000
Date: Thu, 24 Sep 2026 10:11:46 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Vishal Badole <Vishal.Badole@amd.com>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH Intenal 1/2] EDAC/amd64: Add support for AMD family 1Ah
 models 80h-8Fh
Message-ID: <20260924141146.GD1080284@yaz-khff2.amd.com>
References: <20260923112003.3677719-1-Vishal.Badole@amd.com>
 <20260923112003.3677719-2-Vishal.Badole@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923112003.3677719-2-Vishal.Badole@amd.com>
X-ClientProxiedBy: BN0PR08CA0030.namprd08.prod.outlook.com
 (2603:10b6:408:142::9) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|BY5PR12MB4081:EE_
X-MS-Office365-Filtering-Correlation-Id: 198ed91e-8ed3-47cd-1289-08df1a45c9a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|56012099006|11063799006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	tBjAG5Ttzsaw42TFP6sqkMA2fRu+ZRuetnKwKymbEv/bKjQBCk2jR1tjTUnJfEAikdgnWaUGTuKwZTvTPR1sAzZYUoge4kjRfvYhzjlalzhIwtERKyUcg0w8gimzEtznvcaKKMvBJKDgcEchYvwctlwVrNnGeH9zbHSrrYXu7PKZOatLTBFgZLy1Q2Q3vCJ1fMVxPPGOLoSxbODPWhvFLidXXUQi7Mq11eloXPpwgy2Y5/PRJKYrFi4UxissIz9pXqzNwDg9j9ZNT3tb1G8vb1hWfpC7MTUYPtuvcODWCswlmCZGFsZiJ5RugUoVOianCy7Hp3+UcsDSJkF9RiR9O6w5Tx+n0eS2fr/m7VEoDYQOZbTncrqdE4AMqdskozeLTdgK2dFm47e9vexMbU7OvWhl9/0H4PisoYcUQC+0+J83u0ocivI/0/Yp9SuoKC11ZCFqgtA30hGVF5ENkGxu5SmFfI0Q5+NygWuwVS//5Fh4iADTrGptto5YCS6pyUh+VEg4WC7UnzXX7KgBinR4SZGWT8kKGg7VL/nTzX79oPv59pofuyTTOuvemZZX2xEXZrrpXAgXLfzf/4YleHznk79dRUdVosav973bOq+bGfT5J2RKSDV29evbnE5EnK3CzFM20nI7j0YaTLr3gfkClencVusanZpp+Tl6O0KZ4oY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0hhcaLYRzKmAIdiFQeEVZ7PKe7NiIKTVM2povzzDxDrPUXmNERudSBfIj/8k?=
 =?us-ascii?Q?5D1W/I7BPuI5+C/V+CeYu1JBvFM7+PvevK1xP1vul9+vaphWPyo9wE7O2jfV?=
 =?us-ascii?Q?p9k77uwjEO3dx/wvaWwHQ4ChC2FI1XA6BJQOR2PsS9TuzjafQ75hfEuqVU3a?=
 =?us-ascii?Q?4bmArwfpBGegcjXsgRZlhIvBP9awpt5QhFqaz1V6Hpj1+HkophNO1AEP27Gu?=
 =?us-ascii?Q?f86ZazErCrGiO5xRDjP7g+4ZO79wVzGcZ6zhPVzyU1ultxbBS8TL3TzZnAoC?=
 =?us-ascii?Q?Sm3m/5nlVSOc8cPR2qU8cq811r1nkf9oLgVOJTJvqLkM9QZF+uytpwyoM5zm?=
 =?us-ascii?Q?u/vC1gILxltMrmTENPihiy462pCT1B6bAddIJMHni1DfVlyac56S17abGMNY?=
 =?us-ascii?Q?bpHXhMJWSFpUjCEuSbG/zE0QrQzoYP+4GK1HzDIXUIM656K64uQuxm7zjRYS?=
 =?us-ascii?Q?CRY0ZD5/wbd8hbxXxHsPxrioYSX+kCmlVWdnhq0owV9ewe46MvH1Ll/9VbyG?=
 =?us-ascii?Q?rUkRyuUerzlLxVW1If6qLcSpIz50YSCUVdDW/aNBE3myHe0YzT+wtnJOrmgk?=
 =?us-ascii?Q?Uq0TFqbqtLmmWwlvO0oHu+DPSwjWu81FskhkIbN6wJ4Icmfq5pWmzj1vOPTd?=
 =?us-ascii?Q?I66mxS5wxTB3EFQ36cEgMVMb3Zma5IS21fr/YV9+zSc3/3arukdg5b+6hezg?=
 =?us-ascii?Q?/xXn8NQzd7z979aVkQilSiSPtwMtTch9v3MlBlORDVPxlQuT08TyYvuC7awI?=
 =?us-ascii?Q?22lo2X+ZwmVc0kE1lGo1kNzh9nph6bd6bglsykYvEBbMYXy/JA5aVHw1yKkW?=
 =?us-ascii?Q?XEThEu5vlwN64I2YdOV2Dvk/0pv/2lWrUEpVDRT/qhH9/rFn48qQM5g4kTXl?=
 =?us-ascii?Q?0yA/Tvlu4iKZr9IHiuwZ5POKoqlg3z3JbIcjW/0gsBCqRcmrWJ8Au1lggTJv?=
 =?us-ascii?Q?3dm4Z8Q3gUrBAPXV5WOhff+dNsxYEjPgG2cetfGjuuVtSLgwYFzJfnfjDdih?=
 =?us-ascii?Q?6emb1UNtm+cFTUljFRJnPskwXv2HbEvoNdLshgVIfTpoG4pWPlxWEt4Whe/R?=
 =?us-ascii?Q?RGEw/YSKYfqJkLwniriTQPrcxRd6q5I/WqPYxmYXzT0nMV5Zs4bnERfRpun3?=
 =?us-ascii?Q?AIQtKdJb1EHBxmPkryVt/Lfn0w24cAxDXJYpNzTPzIvrpwX7K+V9wNWfZXZq?=
 =?us-ascii?Q?AUP47YIGV4ISRyvTrMVagT/HGckAbE3kJFtMziHkRfj4pKnV4/+mkwFq5Dcg?=
 =?us-ascii?Q?izpRkhi72YIRmFp8dCbII955E6k7EdO0PCQz1gKIQm3Cutx0drteM6X3Gbj1?=
 =?us-ascii?Q?iJuqw4jursjSr+AUqjJk0r29N1QD+cqfNlZHgfR8QVb971YcN+0mop/JSjQB?=
 =?us-ascii?Q?v0F2oEs7K2wLeeOwuvhv8gMgcsW14QxuLlfwyykpqSr5e1Xm2nzndsrkRySb?=
 =?us-ascii?Q?NnGsIUNYkwW5XUllTeGqSZbLCWjVvHIWjz5VZlS8m91fPD2rWa/uqU0T62Dw?=
 =?us-ascii?Q?4pJLFZ+6VDHwGTF9zZSI1Bx8Rj6t1vjys9c6QeXXUtVt4WyhocZVLUjlZ1G8?=
 =?us-ascii?Q?0sHOZJUK+hLnwmlYQBK5GYbJt5p93NEhisP++hO89hreDXcugk4MIwHj+lIA?=
 =?us-ascii?Q?pMq3uukDfbETdM4jaQjBjwpy4DAaYBM6xv3ztvG1Ph+UHARWVbRvTakrYHT7?=
 =?us-ascii?Q?kwRrN/wO/krZYfD+FQSLHjl8IxmTwc58HKNC20vJQQd/Ox/N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 198ed91e-8ed3-47cd-1289-08df1a45c9a1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 14:11:54.9381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLb/BxqAbrDBLBgvOM6EV5kBRDuR5SJLnanIMdYwRwAjXw/nWm5dWoxemBEsZ4sGB+NjTw5fpq22U1wOjT3AeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4081

On Wed, Sep 23, 2026 at 04:50:02PM +0530, Vishal Badole wrote:
> Add support for family 1Ah-based models 80h-8Fh.
> 
> Signed-off-by: Vishal Badole <Vishal.Badole@amd.com>
> ---
>  drivers/edac/amd64_edac.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
> index c6aa69dbd9fb..ff0ebc8e15f6 100644
> --- a/drivers/edac/amd64_edac.c
> +++ b/drivers/edac/amd64_edac.c
> @@ -3900,6 +3900,10 @@ static int per_family_init(struct amd64_pvt *pvt)
>  			pvt->max_mcs            = 16;
>  			pvt->flags.zn_regs_v2   = 1;
>  			break;
> +		case 0x80 ... 0x8f:
> +			pvt->max_mcs            = 2;

Should this be '4'?

In documentation, I see 4 UMC MCA banks, and the UMC register
definitions list UMC0-UMC3 instances.

Thanks,
Yazen
