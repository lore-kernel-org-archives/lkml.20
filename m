Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011002.outbound.protection.outlook.com [40.93.194.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5050947F76B;
	Wed, 14 Oct 2026 20:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792010106; cv=fail; b=hAsCHzxNsuZ08WbccXxagARR1oSBKF1tE5tuISeLaSasCTZPqfzLNOZTBxEpCifJXKtqAenf6bkN0efepP2fevpD3OA/XhCncpET2xnP8Be7lKmk+/DlggAWxH7OhomNO7GdB9uLGRiXyLNGDmEmB0jAc/qior4TsIDzh8KhWOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792010106; c=relaxed/simple;
	bh=PmDpNcZdj9SKU60kZuF3boRlMFtkRKteB+tOM8z5iD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uWss3spL7Nz7G7mH0ufk1YIYL4GJvq6DQ12Y1PlXOGWwrR6W85U8pvyfB0nI6C/0GxPOYS6KLK0fv3GzBXCvg6LQeT4xY/dJLsdVhscbPtnXEgUFoEOMsJBqlz5ffSr/EGaanCWM3f009EesF38iMndTS0EXkVD7UoFcdKneBf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gWVNQILF; arc=fail smtp.client-ip=40.93.194.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gWVNQILF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJHyw1o6hflM9mk1wkEYOuk849gERaw4Re/yyuq5JGJYrTyx3RI4xRPtyjzs4upyPzx0H2bT1Evq4x8dOOom4Xq9KtYOJhlGeZuWudzyeSWMbhKd9fmyisQ9XT+Y/SHWnvOBCNVTGalTlplYsSqgA+NEv9pjFhVqQPLSTaOqK8WSFulD2x+maBeTjfoFrzJii7FMtyFGsnoAh/i6E//W5h51lETj2AUiLaBFp8yH7/JdsP9pHmyGQJBMjt/30b8Jon8Yv/WTTkcLdWh5zwHVThy72QBSIkharWZXt0B3hEmMvVmLgzo+7o11QGusGV5oebhg6/ohnF/lba47PF0GDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Fn+T4t70U3+FTaJEoLizrkBkKjb2GSDSp4wQ8au4Yk=;
 b=inl0xAEXINRz17hFQbnvTXr5x97R0eIYjzWPDMQRJtg9CKQY/lCwa3MIyb2BOsFHJ1/7NS5E2VK+agipE/PzV0Sf/1gChHrO5FwrvMW3b8uGnm0H8NxhTckKXT/qdSF23krvXtQViULpbUAPfQ8cssxx/HF02yAUQsDZdy0HAr7He0/O1LnVJ18bQRBjs1mxBJbmqeLa8zQ4M+vxgGrg2fYvlx2cok+QQLrMgr15bMpGlFYEuEjohfXdzp6846g4/9e4HIOWL2I/Ra7+cqdpIHIkpc3O/DdjuM8M6u1Ja4fpJy0qEiWPsgqNfjRMykmFzWbhhma+wsJmNTu4GL08qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Fn+T4t70U3+FTaJEoLizrkBkKjb2GSDSp4wQ8au4Yk=;
 b=gWVNQILFLVdxoA5YnkpyoE/qxYknOGdzBnzyvT42mSxfIniROdFYUrI9i3sQecqlyE8+4RLz3dfcAuSzcLha031vmk5lcotRKH95yLiE49qPzYr8lkxo9M8SEIMDWRE9YMkE8F7qyIgIJ7gQ4jA1zbVmxdatjyzrvMnNvbaokxtKVwKdIAvN6ix5QnITtAkikzFpzerpQQtddcMKSNYoIQ4PFWjiOauTy0Io2AJqjY11acNqI3bp9x4FmOZzLvL+a9+5tDKv38NvGSt9dNOaNVfyjK2YFt19kvwYHfmF1LbKNDSq4gcY70IndGSKRnFZFKEZpA5h6JrdsK+pnCB5WQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by BL4PR12MB9723.namprd12.prod.outlook.com (2603:10b6:208:4ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 14 Oct
 2026 20:35:01 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0472.016; Wed, 14 Oct 2026
 20:35:01 +0000
From: Zi Yan <ziy@nvidia.com>
To: Nimrod Oren <noren@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>,
 David Laight <david.laight.linux@gmail.com>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: stop recalculating min_free_kbytes once set by
 userspace
Date: Wed, 14 Oct 2026 16:34:56 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <DA36D13E-4E84-4F1F-A44B-B78A440BD80F@nvidia.com>
In-Reply-To: <20261014140859.1006967-1-noren@nvidia.com>
References: <20261014140859.1006967-1-noren@nvidia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-MS-Reactions: disallow
X-ClientProxiedBy: SA0PR11CA0039.namprd11.prod.outlook.com
 (2603:10b6:806:d0::14) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|BL4PR12MB9723:EE_
X-MS-Office365-Filtering-Correlation-Id: d0742dfe-0f42-4149-0d3e-08df2a329eb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|6133799003|10067099003|18002099003|22082099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	G7YnuYiQwVfOunu6MVFEkrvIeWZTD3/OR5sLuaMggvjD01EYX2ZKOawjSZNWzqH00d2pSTkhrHjL1khmhCdzdd7DmwpfaAOZaj2qsF6PPwgWqKZBdbs6HDMn1xeAF72J6nFYbu2vilKJDZwFZjUVu6ykbuhCE4u2vSWf9NA4X+SSFJnx7oTzzRTm2fJC+XMieSrllHL3jcnmycDKzvfofTmbLh+oC6ZJ8cl85pXtsbRAteeQrMEbkD2fCCQpDehdI/YLcX78IZ5HMMJHZvizpmyRerXy1eMyu76yMynvOqhd/K7qj81tSMARO6LcHcMLvJGgyKUZHgus/pXOG1ijhh0s+eGj35y03XulZlrK7sF3+SJA1mA4iNXZWtBUJkZ3Tcw8gsQ2+AZhZmWfEpf8bbfHFlXgjS5yT8x909Ntb5PumGdypSxEjXmO80MZFCURyG/6Ivgkglc8CpAZ1J3AuEyeJTmreX++3cKZxepqCgKe4UrOdbBg4s0XLWdxOpKw3uyzjDHZTaGoqN8DRG2eJu9OmQ7rBIIS0n3wtD+JEwFkPvvyV+izRkcpKLHYG89DB6fAes4yc390XVPWk+4lXLwytc16BB0KhvulcOmwyXzptseMSK956nZjscB9t/LBJ2XVqmCqaCEgnTB2lqvVlnL9g/sZFaoSPVF2NL5VYKs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(6133799003)(10067099003)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LHiRH8xTWSKMYBvCc/oKtgmeBYKXHBJPnBd2oBv1vkRHNZJOe3ybIdnBXzi6?=
 =?us-ascii?Q?7vNcLfKIoic7SjvY2bKMuXEktG+y7TuSIqVfKvNB0K9duPx2xPJ1LLkab7uB?=
 =?us-ascii?Q?Iqby07QfSY59ObhGICKoTWPogSWLSzVAKi9icUkdzifa0BXjSluuecgXl+fv?=
 =?us-ascii?Q?vMZ55lTzAivOM+UUhqUKGChZB9K3NVxEmI/ji+O+AFQoPU0W49eCuukphiFT?=
 =?us-ascii?Q?xyCSfkyjHvTRrHqYTWnzyVUbUlrbMaGWPo4m1nENhNOn63OKc82c3TEok1Ue?=
 =?us-ascii?Q?fPTjGpouxsqKPATRc3J6JdQikMbEKPw4QjNUo1hIhEyTwq4f6LQHMVmIrjUw?=
 =?us-ascii?Q?jvrrFwEqqd3vmQGNXuhxMN/8toLgGLXFxrKNFUlNYRLab9bkJw4cH2RBsh3g?=
 =?us-ascii?Q?qhBMjCkBwQaM1e3KV3Rxj4V+6KgGjcLAsgCYoxHmHDjxeBtzNSCDtBvRIETd?=
 =?us-ascii?Q?5gyrrMXCDkQiQQBfcGDCG93SxwevwH/AopOa5uYmsgpdK/18m8JrMqQZjtjK?=
 =?us-ascii?Q?pcpm0EZ+3sgNHEvEos2kSzcUZZiJqAlG2uOpyJh63nFjEEKvvCEj7H9q99Kn?=
 =?us-ascii?Q?I3VjMALOR1gXR7xwUZF0qHqmoRpD9nRFndYE3wLaJW6+Be8ihiVM3+jpjVGV?=
 =?us-ascii?Q?8n1Yqg/pweOQhrDbZeECQyIZ22Vp6YI3oRcF96uIyUGyF3WLTS4feRYyDSes?=
 =?us-ascii?Q?iYYGtLv4oFH3WjBbnMaaLANArtti3uQ8p7dogQ83/pKJw8bRno5C8qWEdaD+?=
 =?us-ascii?Q?kHgQqhefL9qL64+heZTDUvYb7kJOSmQP3LlNoQJhBlLwXE1ND+zGpwwEfKql?=
 =?us-ascii?Q?WlFP6qDGOnOEp6d7E49iRQVUv61uy+aSVMmFMG2GPAb5p9l/WSXkUpIR908H?=
 =?us-ascii?Q?P3uIVxcyDjxzBKqV7ZZIkhMwti/m5A+RGYDWFfVnHigNm3t8oGBT/FbwViix?=
 =?us-ascii?Q?EE/mtllfxc5kpNZyLX3qOpNFEjwVNwr9+wr8hv8WV/IAfjyaMGAg7Us0+Yvw?=
 =?us-ascii?Q?lmR4nzJuyHgPWyq6p5+ypJatbz2kNA07XEjC7T14rFzz9mb3dqAaHcNKmHAT?=
 =?us-ascii?Q?R/zM822kJlGtEB13aVjPYR+wo7qwa5MGnReHCEzQcfqEM1xZ6AopVKCOi3vL?=
 =?us-ascii?Q?USsHwaiiQGwWfKUi/o+i0NPMcxDaIJvcs0zZ6rfXbxpBhPDiHX+fJ+n0hv7D?=
 =?us-ascii?Q?fjacxeYBKpvLG+rMgjLFh/riA4wexoLmsYwXV5jNv9Bm2mEc7nyYXhW4xWIZ?=
 =?us-ascii?Q?JVtm/ujE2iKNJCuef+hZqTFZ3PWUn7ZIZaR/KPcTF9JYg1PnJMw6oRS1DOjr?=
 =?us-ascii?Q?u5/ubcEYQTKXFlUxOigiPCIsDfFyS7Sfu4Lt665D68TnPX5buzXFMdgMpzuh?=
 =?us-ascii?Q?NDyvI9rrBzdyXwTm4r/Ft+Gbx5EVPm2ddkn/mPHpLye3HmbMUslAR2wDnEdP?=
 =?us-ascii?Q?5d0PTK4tEUMka2CB7KfK5Au3lQtVtJyX1a6Pewj/lrXk2nT9MiBucm2DOqWz?=
 =?us-ascii?Q?KtQDBPhZL01kC9Mfby+36yNCoa0yWYGlPmR9FW3UXeAHJp7KqL9fMImOpI8Z?=
 =?us-ascii?Q?Lr0JSQyU7GWBsWgG0WytT/LfyFBzlFOFBDGueEaEi/43INZk1QilMCWcccKo?=
 =?us-ascii?Q?S03ZafZ/PBL0XBKc/o8Ws90meJeXKjcmOSGHX1e3P0VoqB/p1kZ+nbbU2Ul3?=
 =?us-ascii?Q?+TN0FfNxKmZU0MIudDab0ycVvmJHHtuoQFtI1zeykDZro4wi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0742dfe-0f42-4149-0d3e-08df2a329eb7
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 20:35:01.1801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Il0gHHonPeYwwooKpwhFu5og4uduNTvIs6IOyn19cbRWrOcrXqFB8UyfUNs7yIEf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9723

On 14 Oct 2026, at 10:08, Nimrod Oren wrote:

> min_free_kbytes is recalculated on memory hotplug and on THP sysfs
> writes. The new value comes from calculate_min_free_kbytes() or, while
> THP is enabled, from set_recommended_min_free_kbytes(). A value written=

> to the vm.min_free_kbytes sysctl is replaced whenever the new value is
> higher, so a lower value does not stick. This matters most when THP is
> enabled on configurations with large pageblocks, where the new value
> can be excessive [1].
>
> Stop recalculating min_free_kbytes once a value has been written to the=

> sysctl. Systems where the sysctl is never written keep the current
> behavior.
>
> Link: https://lore.kernel.org/r/20260716173504.760369-1-noren@nvidia.co=
m/ [1]
> Suggested-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> Link: https://lore.kernel.org/r/d202dcc3-d7d7-4e98-a9a5-3137cfbfd041@ke=
rnel.org/
> Signed-off-by: Nimrod Oren <noren@nvidia.com>
> ---
>  Documentation/admin-guide/sysctl/vm.rst | 7 +++++++
>  mm/khugepaged.c                         | 7 +------
>  mm/page_alloc.c                         | 6 +-----
>  3 files changed, 9 insertions(+), 11 deletions(-)
>

Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
