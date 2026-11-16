Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794847805;
	b=nYVd2z2Npylp5eJuEyqsVumTQTR6c3dzK5wR6D1+leDUkbdUSUd/2Q4KUUw3EGmssEtm
	 PLM/u+pHnKoV08B6E61CMTaL9PiTCQXZLP2VjTD8zMACxV45l5ZW8Iz1ePo447/1b8Zk6
	 E92IGAN21tYr2nJVpVj7pMRF8QOmCx4F5qfWYTXBdz4XNab5mB8csRaWSPT7gjFYpHC5l
	 EtLnGbbJvKANr2n1kYZDfom3BJqFEiZ5eRNX7+PTgJHB1Db4XSGTISHVnu0gl43GP+/jL
	 2wkW/YAtHmOxiKrgsuzg7Xl8xcddhqEfWnIHChu7ShzBB7fKq2GCm8g9jcExvzYMeYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847805;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:X-Mailer:Message-ID:In-Reply-To:References:Content-Type:
	 X-MS-Reactions:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=v9ikCO6i2e+I+cF9pVcl3zDzxQUnxzZXdQisWorEuf4=;
	b=dM+elFZihP1CduFZehjdGWWC/Wz73UKrDWg8jtBR1HhuY/Wc8c6yROahZCVyBHPVwBnl
	 fQgv/o0RlWwEdhAO/bh4NS+WybjQQCytkzhpnLkQ9G3iL9Gs1pQdoHf6hpck4jvgobQr/
	 /5DX5da2bt3H76UiFvFia1sEHkmwHp+rwWIs1RK+FrrsEERLZHDDY508ogRkFGckPtNb8
	 W6UWogkNQcenq9TVzDn2/tUnjRMV+z9TZr2nYUL/XOk4QC3Iieu+NKUJjmV/zuQ3mjTbS
	 xJMfeYMfbNkMUTAT2FnAt22piMowIvqy7DoLD8iuIP3V3re2BNR/TaMJv3kPZBR3jrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fjnurTtP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.15
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010015.outbound.protection.outlook.com [52.101.56.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DE1606A323;
	Mon, 16 Nov 2026 16:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48DE1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fjnurTtP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2e77Ij8iyM+IrX/QlfiiGfF2YJ1I+aXwOcuGCmh13hmS9IUpGzRSKJsCgWYJKF6rBJpvoZU2cIoVbwfcwRqqLAU+PliukYZw60C787dirCzEKm+FJeQU4xuhibUEut6N2ueQf7x+vawI0HVTYv3HsT32V7AFf9qB2qnwkaVXfhjOUEKmKcCZe/ZrWzNbfu88QpIUrN1DeeeMeR0lk2uWcMpy7Y5zW2zQWsgYm32eofbmbO7T7Cq52vyu2fbU2Xq2zR4JsK5W1n9k+jfnmhC4LtPcsO33YvDR0CRoRUm5fD2UZNmu0cleSlNjT6KCC2Wmw4v+ytSZw1a1uIbXxGpJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9ikCO6i2e+I+cF9pVcl3zDzxQUnxzZXdQisWorEuf4=;
 b=QLKhLa9KurafV8LRcEAwE9s7zQ5dJ1zkimufkDAm+Vlx+bWYWsQV8EGv5SnkHpyKFMSivpUigs9V2VSKXeBAT+Y+9vHynRsxNmmvnCILCFChCugxzZ7rHOLeggdN4U+aSjJV7ofkrsv5Nk1nHRYnnsrpSTf69yNP9V1+rHLkLr6arTBzMPBHumNq1o4D6U2pu1pV/cxL5dgH3kqdXB4g89kDiDJ+xIfqJPnzhiV1UQOMO74WRBQaAMq5A3F9KHjNkxqmq78LXaeOWSOgClyNapLbovtIvxteQ0mqGu0w9hYOqkOndfkiH91noVqkp/epM7qo+gZbTb/Rr1wHMc0SQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9ikCO6i2e+I+cF9pVcl3zDzxQUnxzZXdQisWorEuf4=;
 b=fjnurTtP4ydMRwaZ3DFb/NDw0vSxq4wuV3TAgS7t5vJSJVIZIQOLTt2Oo01QZEETb0kA4qma3RZix7YNEEhateJmavA9UwW1aegHoiHkwrplSvWKfQjG8wGsFT9ATSnFFS/NJKdBjR0UPJRvNpSj/H5/kAVTizR95tRBeBxRqa+XXbCf5YhhwjfigzAwz3ajrTq3fabM6VBfcSN9esZJYK8SYnO5+reUA3E1ktmKewhKRvWLhiqgZBMgSSi1J2XVPYAKUC6JTNWks3HvLYm0c4wNnU+0O2KRlk3Oz3Lvoc5Qy9e3WzX4+VjYpr4XDy/sxil29paW5iLrQNtmI+/bOw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by PH8PR12MB999298.namprd12.prod.outlook.com (2603:10b6:510:40b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 16:50:00 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0615.009; Mon, 16 Nov 2026
 16:50:00 +0000
From: Zi Yan <ziy@nvidia.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Gregory Price <gourry@gourry.net>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Ying Huang <ying.huang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] mm/mempolicy: merge adjacent shared policy ranges
Date: Mon, 16 Nov 2026 11:49:57 -0500
X-Mailer: MailMate (3.0r7038)
Message-ID: <A43DE178-DC38-456C-BCE7-3846A01AFA60@nvidia.com>
In-Reply-To: <20261113-mempolicy_limit-v1-1-16688b2644dc@kernel.org>
References: <20261113-mempolicy_limit-v1-0-16688b2644dc@kernel.org>
 <20261113-mempolicy_limit-v1-1-16688b2644dc@kernel.org>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: MN0P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::12) To IA0PR12MB8374.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|PH8PR12MB999298:EE_
X-MS-Office365-Filtering-Correlation-Id: aa5f87a2-d194-47f4-bea6-08df4401a6bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|22082099003|18002099003|6133799003|4143699003|11063799006|56012099006|261102123227099003|261028144727099003|261026140227099003|261022105027099003|261021121427099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	L+8L7bTRIpMrwtwm7XvPLVdtOYbV8fFWQUl+oycgbC2zHh3EZ+quy+XQIg17qCCW58xsrk10lQ3cgigtWwc1eVSISJmsZ+9RDbtWaOUPlTtidc18zvaqAp+ivQhX6tNrnzs4QGA5ndfL1zWXp6hMPqiroeP86dylSN2rDCW8Rz5cCbE/ecP588ycOoMsodBiht47va6gGeQAP9e0g/vh66b5xGOtwKgNXRw+zCI2ExfZMVk7GiWvKpVCU6F/AVLJri+Ump528MZBzHSgI+1iMGVemOMEocVGiSGMJJDLxJsM2TeZioMKp8OPjh+k9ioWteczCUQDJI8LFgB0lrhHxe+b6gW6XGyvL9WBqStdJVUrSSmw9CrKcz23bjOmhKI7rNuDlTGRE7XI5Xt35U7FLtVPkdoxA5qedFPxa5l7oVMHtnr1ugo6BL2+YnE41LlqPGJB5HLiqUFZyLbtvfVFKL7CSAdsRrgDuFXBv7GkJMe/SZGjDpTTMDJ8SXbV8PEQlj4dSFtU1/B53XGKgcTNtnIs/r2QGvf9FuOugp8AKTE2mH76k8ZY4Qx10N0Aj5hkWeJCf3OAM5vSvjforkIpm3nOUFJyGKpOeK0YBDHhA42OGpTp5nMizJZ3dPMHBipwCsR6HH1TaLQIgzMItJxEWfqaOFVeBMXsRBwutorhLNc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(22082099003)(18002099003)(6133799003)(4143699003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021121427099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qj4/9AR1ZCJo++VtgyhmJ/7dwHdaSFVADCftuySzz9e2foYNOp00ouDCW0QO?=
 =?us-ascii?Q?ka8JtOkAM3gj66K2Kh5QFr/pMf7l5M5ejE9BbDkr+VVBCTIv8bZnQeDP+b83?=
 =?us-ascii?Q?zwut8xFR55xLnI8jcXnfeoxNL8F4lRkoefz71z0QPXaM3e/eFZgHMeoXPKjx?=
 =?us-ascii?Q?GEFhIecy9dlUdt/+1dY8QzHe8pbYehj9hNIqskr5FdfbHtC1DIDC2kOwOR+x?=
 =?us-ascii?Q?XFoNVtrhzP3WJqddXCYCilVqwlObWWsVHfL6affWfDMo9ch9mY/0cI4fFTFa?=
 =?us-ascii?Q?DRDhjTb2nlOM/jrp2V6sGvHKyvJ2ao3B3bLRPj7bakag6QjQbxZm5zZj1TXe?=
 =?us-ascii?Q?AUq3IOsar/j8ykRW3rjr+TmBFHEltA9rxlu3eDJwligPVMxYSi3RE9eP9eQm?=
 =?us-ascii?Q?slhRWaF1th3HppQkQenuycQXnjXKnGOupXkc64Cqgs2xKLR/HayhsPRcqIGs?=
 =?us-ascii?Q?SPB06u8X9wq/WEyR1OKcpsk/Kir1Xc0FE3D1Su+4YI0sS2Zs/vzBOzhXwoq3?=
 =?us-ascii?Q?OQl0H1pf7V5ukXeuJ475AuKPDR/hLlYBxkUwS0zll+upEt2z4pVS7FyM6Su1?=
 =?us-ascii?Q?k6nqHiD5acApGA63xFULTrdqeC4okKx6+d2Wj0kcI6YZ6Lxc77hUeE6sJ/ei?=
 =?us-ascii?Q?15kZVUU+eNxlQ5yCQTtbXeXMaW2ctofFmquuwgMV8U8aYSYTlBaPDz5P5nIx?=
 =?us-ascii?Q?8cFR1YjgZt34SiK+I9RqkM1ZPA6lsJJtrIbydhqWVmnWOD2Weo9tmL05RiRl?=
 =?us-ascii?Q?faoPG7/IH3aiBzWFHdAUr+aiJoacVui5JdG7YD3B9UKeDCkvjvfUDeYu+Ojh?=
 =?us-ascii?Q?mgMpXKq1gpIz+BC5OLZ4dZecVBRzH1bFRuo2xIVKQ69Dg44BxPHXm8K9Ls5i?=
 =?us-ascii?Q?AaNw62DAbVzeUEW9XGvNOy6gC53BmEf0xfBzcOonMXaB+wDKUL99biTWhfJ8?=
 =?us-ascii?Q?Hfp8gB67uw1JG8KHy/N4A04X3dZdOMmL2o3BorjqJibRpS5V9QjwgEv6+F7n?=
 =?us-ascii?Q?5WaYAAyjvzS1c9miTbEMx2yehURhgtJRlmZm55vG9smPDsC0VLNjlYfAWPeb?=
 =?us-ascii?Q?x5XqrmabpP6oB4/L2bcNRsMtjTnpGM4d5oDrs3YxEUOLVj3koFSuJ+VJHBMK?=
 =?us-ascii?Q?fNmTxsANOeguDVimhK9Vwd7JGvBmgXXehmf/DQbaS4Pu6Xjy9LNYrf2c+51g?=
 =?us-ascii?Q?vlU4qPRN+3Ea7WFfFczyRA+uJKLBL31mI5NbrDLYnKm0B9L2U40gZfDMvX64?=
 =?us-ascii?Q?v8Nm5BB24p6LMUNQAmkeqWz1g830RI0fOdR3W6pkdCrsDySZx4Ad+n7wjT5E?=
 =?us-ascii?Q?a4xauGpSbdF1lS/QagCJ8CfjJCUfM91S2KMdnedhKTKhrIxL9oIJmebHvOB1?=
 =?us-ascii?Q?EwDVvnmn8NmDUSMEeON9MXlolqRfJ9d7EqNDbiCfaWiZ2mT25Nzf6zttcmyr?=
 =?us-ascii?Q?mzIhQ1yVID40/uiIgEqPs7SOI6MenApcO9s9fciqv7uw4vJ3QDSa/6TGye+w?=
 =?us-ascii?Q?j4agWwg80bcqgAj9sW3Atxpg6pWcy/Yg3dpwGfqa5XOVxygiXd2+QI95iamQ?=
 =?us-ascii?Q?6x/Htdb40qdi8S2LMbv7AazI/rznLTtU13Rj2+8auIdf+emqEPpZC/8kQny8?=
 =?us-ascii?Q?CBpw76hEw/Zjme3Hhwm5eRwMRb7flbvbBVthhGW7wTbbM368U3ev31cA0OSJ?=
 =?us-ascii?Q?Q73iPWEmPvUKk/YTElUsjLc24M04oGKFpOybuckrsyt/uwR/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5f87a2-d194-47f4-bea6-08df4401a6bf
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 16:49:59.4283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xpRCaTuPlB46Dgr4/0x/2fqODlqA3Y66sdxZqTsjpyegTlsluHc1chqiiN2Acrn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB999298

On 13 Nov 2026, at 16:36, David Hildenbrand (Arm) wrote:

> Shared policies can retain separate tree nodes for adjacent ranges with
> identical policies. This can create unnecessary policy ranges especially
> when individual VMAs cover individual file ranges, and user space sets
> the policy on these VMAs independently.
>
> Extend the existing replacement handling to merge ranges with equal policy
> at either boundary. The existing replacement loop will then remove the old
> nodes and installs a single node for the combined range. This also avoids
> splitting an existing node when setting the same policy on a subrange.
>
> Extending either boundary rules out splitting an existing node, so the
> allocation retry can only occur with the originally requested range.
>
> This change will make it easier to cap the number of shared policy
> ranges per inode.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  mm/mempolicy.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
Makes sense to me.

Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
