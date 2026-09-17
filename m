Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012068.outbound.protection.outlook.com [40.93.195.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584D64E9C38
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789676938; cv=fail; b=lEo2mcLISBMYpQkihz/7EiYvPjyJAwj0mSvkN2SODwkZ/DoWA1ifqeS77doCZPDsV6PSvJkktdqvPy2BdqjK8pNQ6bTkh8RoZ741bhbC0jf/QtVbyOVuhVPx73C0UgFC5QjVZEWRdG46V0q+Sk51bUMcPi4OLLDO75A1wYp8H+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789676938; c=relaxed/simple;
	bh=jq7lfg2fZXjuMw6CtI/GYtoefxgGkZHyox0tmB5V45Q=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=SAlgNnXJ2vYTBtDTgLNd3x7Zz46QrLY4Zjt0EYoAkPiMi4VEf1MYFMtLuZsdYX+5e9TQq7vyMNi43TTXalCCpV3GCIYh7h9IJaw0t4v2RGRTFQRbgxaQNvaJBOci2L8/5ElQxBBIfdpgw9uhSJTHmZnV8kksNXpRFfijoMY2M7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XWHLOmRz; arc=fail smtp.client-ip=40.93.195.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XWHLOmRz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KO+3tz8qSf5tJgzDpuYgu2PTZDhQUAFaTlzfq+rv5L/WMWWf0Hmd/ELh3W3FvDSxA0c2nFEyT0BkCyYGo8NZwQvbO7Fl1Cggvae6wnlBaVHrJGUTwJseQtEQInDo0EYttNckITTRXrxDNbP1QGHi8+YYtI8DNEw07pjbxLSLVi2wc3gbnbn8meARNstQzxEHRp05ZXyB0Zg3ueB9KP+JbvkKY/SuUp7UNkKUyFbQaX4t45t2bPiFAXaokH2p7p/Gf1Dk2cK9+hauUk0iMS6hNcuhNA1e++hQq4Daf2ibrPwtlZpWSi+BGMt+WhU+3Fh5d2MOuxmFQVFAklf7icuWyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Glz4IuWdiFC6Jnsb6so5PNRJwNoVu2Z+4tKdXnjJ1hs=;
 b=WFGzH0Wdj4uf+Xo0mdb+6Dpp7ghPoVcfrrmoGb+RJh+AE6HF2T6G3WNJRXDNSoqGPjznxNf7SbYIDd5oiPSNnUmvQ0fWT+JgiCQEiGoAF2n5M/J6XLxuWzFkOrKfLD8NslqDCaCFz0l1yFmI+1IbLSc/Xv8FP2oNV1btPwRuA+a8oxV5XMn0/j9ytN5xlaWd1eHgSxyIXskThmHNYaE7+rU92bOl0HMOZm02XpMsufqNQ4mBeBgRorkrhjl3vKc7aytOCRp9Qp4YoPpc3USNFRXdbxA51bNZFsEhyjiNtBGvdUGaSqwHFEVYFDRvHfCDjr/ZC2FsUrRa5dTzzL4hOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Glz4IuWdiFC6Jnsb6so5PNRJwNoVu2Z+4tKdXnjJ1hs=;
 b=XWHLOmRzw5QcO++C0HrUyPXP0RuW6jW+24d7oIpM3sgIjeYHE17SDQVKebYJwQ2yomSu4KayFOXEemsFzFKFvJmH14v7bNe2o2wjmi1aJ4Uu/MRwYc76ZvxFyldT0oDEMi8HzcCTtJ+w2R/VR8o+LGZCCCpEoeX0adV3G6R0+w+x7SUJlovpN/RTIq7Gaa5F7g0ICqV11Ry1wn62jbbjjJVp+vSXU36ryAAVT/CjsR9zeUZj4sJls9gHZp/mLim1gf5edvaGZ2VFR+XZaxJqz4qAX1JKNTWjC4f209Bb1yQkK+yAXq5a5AqXB8kHmDjcgbHtPequkKE/BYqpIEhtKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SJ0PR12MB8114.namprd12.prod.outlook.com (2603:10b6:a03:4e8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Thu, 17 Sep
 2026 20:28:49 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 20:28:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 16:28:42 -0400
Message-Id: <DLHVIS9QJTFJ.3SEIGJWWC9T48@nvidia.com>
Subject: Re: [PATCH v3 1/3] mm/vma: const-ify vma_assert_stabilised() and
 associated functions
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Suren Baghdasaryan" <surenb@google.com>,
 "Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Shakeel Butt" <shakeel.butt@linux.dev>, "David
 Hildenbrand" <david@kernel.org>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Nico Pache" <nico.pache@linux.dev>, "Ryan
 Roberts" <ryan.roberts@arm.com>, "Dev Jain" <dev.jain@arm.com>, "Barry
 Song" <baohua@kernel.org>, "Lance Yang" <lance.yang@linux.dev>, "Usama
 Arif" <usama.arif@linux.dev>, "Kiryl Shutsemau" <kas@kernel.org>, "Mike
 Rapoport" <rppt@kernel.org>, "Michal Hocko" <mhocko@suse.com>, "Xu Xin"
 <xu.xin16@zte.com.cn>, "Chengming Zhou" <chengming.zhou@linux.dev>, "Jann
 Horn" <jannh@google.com>, "Pedro Falcato" <pfalcato@suse.de>, "Rik van
 Riel" <riel@surriel.com>, "Harry Yoo" <harry@kernel.org>, "Chris Li"
 <chrisl@kernel.org>, "Kairui Song" <kasong@tencent.com>, "Kemeng Shi"
 <shikemeng@huaweicloud.com>, "Nhat Pham" <nphamcs@gmail.com>, "Baoquan He"
 <baoquan.he@linux.dev>, "Youngjun Park" <youngjun.park@lge.com>, "Peter Xu"
 <peterx@redhat.com>, "Muchun Song" <muchun.song@linux.dev>, "Oscar
 Salvador" <osalvador@suse.de>, "Matthew Brost" <matthew.brost@intel.com>,
 "Joshua Hahn" <joshua.hahnjy@gmail.com>, "Rakie Kim" <rakie.kim@sk.com>,
 "Byungchul Park" <byungchul@sk.com>, "Gregory Price" <gourry@gourry.net>,
 "Ying Huang" <ying.huang@linux.alibaba.com>, "Alistair Popple"
 <apopple@nvidia.com>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260917-vma-is-faulted-v3-0-5c22314a72e7@kernel.org>
 <20260917-vma-is-faulted-v3-1-5c22314a72e7@kernel.org>
In-Reply-To: <20260917-vma-is-faulted-v3-1-5c22314a72e7@kernel.org>
X-ClientProxiedBy: CY3P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:fb::16) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SJ0PR12MB8114:EE_
X-MS-Office365-Filtering-Correlation-Id: b58445ce-4b2f-494e-37c6-08df14fa47a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|56012099006|10067099003|6133799003|4143699003|11063799006|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	86ykXKQ8+lxc4pVeWBBajW/vVTO0qRmp3DIs91L/Kyydk5uKGcZd50hiXZjFuk8ymGbtTH6u4eiLIY784k88dfInl1QEU6q3inrfEUFufrR7vTc1etT6dzZWbT2IZG0VZappUqh+9Bc0MsMzd+HWqcVg+sQslfviClWDuvajx+L34l/Nz+h7Q+R7t3iM/c8KGblsWZLFh+l1ZqF+qWoARZb1NBQS+et//Sjd6764Asy/ayz7V7j/PQvWH+7DzPra2DOXLFfjDUUG+paLeYWjGfdY7H0yqK+CUrpuJZsXEFl9wLWdFojPmC+zskRQsn3kXuq3Awn6cUDxI2hDXQbDikNxOjo8ZsKjwzi2EHYCrNDpWiV3nqk4tZW9Vfb+BLjzAAFoLeHq196j1/BE6aKdCRA7K0Jf+HMhp+7Bnilhno9xMoWl4x7lkCnmEHYdG3SMPOkhS2QXORSzGdbdXC5PAVbEHE4hJONOvGwlSeYJxypfe8ogTVW25Alt4FL2m5L8ip2edwHoAHXWAhtoyYOqg9RXEoFk9Pj+5iG561ds9tKA9T2/AUKOTzEJ1fT66sfmCTWgsACaweHgpGMD8OMmtxhAphXJQ5yapKSjAGGwwJMrqIyfy1DVbgbys3ktXErXtMqILAtcwZJEB2etOgWqMPTu+S0Xb9/kfPQW+3DevrELggNAzIIGHNbiZ07tPi3r208hyd47OYstpiV34O/I3w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(56012099006)(10067099003)(6133799003)(4143699003)(11063799006)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2dHdzFRcXJNK0trQnBkZ3pVaFE3NkRLWWE1QkppWjlVYW14UHV0T0JiK1d3?=
 =?utf-8?B?NVBlZEhteVEzZlFKZnA4NnlrOVlPUlhvaElnZGNqYlFRZ0pxaTBHMEd5dmZG?=
 =?utf-8?B?RjJHNW5tb0FrcVJVTjZuUDVXSktBVUd4Q3g5Z1pCUzJ1RGg4NlMxcmhYNlcr?=
 =?utf-8?B?bGVGVmZwWjhvcjZHRjJPTUQyMkl0NnpOSFo2WGpHQjVHZXVISWhtUlNpSE1s?=
 =?utf-8?B?TElrS1RCVE1wWGhRckpNUFNYOGF1eG9qQXZTQkU4ZWluRi80YWVPTUVyalZa?=
 =?utf-8?B?NFZnSzVOK3RXdUhCdml0TkliUlNhWGZjS1Z6bGVhYnBiV2h3U281S3BoVGpk?=
 =?utf-8?B?b014bmJBK1NtbjRFS0FkYjg0ZWdVMlQvVVNEbVN0RUkwMHltNGhCOUJaMzMx?=
 =?utf-8?B?Ujl2MGhjNUR5aUNPaFpiUml0SUZoNXlubk4yTDV1QmR1TnNrVGFua0JZY3kx?=
 =?utf-8?B?NEZSRFNNVkpsOThoM01PRDFCaGEvL09MVWtRd0ZVc3V2TW1MZ3R0YjhVd1dz?=
 =?utf-8?B?cTdpanRBY0o5aVBobDhBWlBDNHJXaFdHQXBWUTA0R0kvMTBjUHhPcFZSZlE2?=
 =?utf-8?B?VUtieFFTWjN0K2tVNGU2WVo0TFVOVk9KWEJUUVhXMGlNRDkwU0NxODlVV1BC?=
 =?utf-8?B?aGJ4ZWd0cjlybzB5Mmpjc0VUdmJSa3ZkSHE2dFF4Yy9RRmFETEJYck1VYWRH?=
 =?utf-8?B?a2pXRlFmdnNtY2FhL1VXYU40UmxyZFpKSWNBMThSamJPb1pBbktlTndzT3o3?=
 =?utf-8?B?dmJWR1c2NU43SEptTCtUSFk0dWlwSy9qNVFhVW9mZS96LzBaQjZjdWhEeVpQ?=
 =?utf-8?B?K1dnUUEvQi9VdEZLOTd2R1ZKbVNUY09OMkpIb2VzeGNIU1U1Z0E1czhrYXVG?=
 =?utf-8?B?Tkl4Zko3MGZjRTdJdENaY1RQM3I0Tmo0emFQV0gyQW9VTzYxRHlsQTVtOUJj?=
 =?utf-8?B?aXlWL09Ra2VkK1dFbzhHS1paSjFvUWVUZVFtV2cyU2lkWWU5dk5DK1JEYlgx?=
 =?utf-8?B?L2dIVXY2TTRTY3IvNHRvU0U4UnBXbHByWWEycEhibnBwa1A4UTZTbmxuR0dK?=
 =?utf-8?B?QU9hV3NFeXBwY3NJc1diTXZpN0ppMzU2NDZnTHRsOVhzVThZWXpXK0xOZEtN?=
 =?utf-8?B?VWRyQ3JvczdraDVHcDBod0JqVWIxaTJxbGJmS2xPcmxtUDY3aUpmNGh4dmlT?=
 =?utf-8?B?M1dGN3Zwem5LTUNETVRUSVFiL2hZeFBlTnFGT2tSUHA5dTdhOHd2SGxLcTcw?=
 =?utf-8?B?a3U4R1hqbXBmdWFodzl5eGlLRDViM2RTT2dVdDI4SWh2U1M0N2xNdjFzaHBq?=
 =?utf-8?B?MXgyS2FQZ2hhSGUxZkROb2lUZ3hhNkhRZVFYcHVCdE9LTk5ZSVlsK0s3VklP?=
 =?utf-8?B?c3ZHaWY4NnpMUFpKczZVamREZkFSaVZnM3dqenY3MmQyTTlGSUJNajhGaVZi?=
 =?utf-8?B?N0hINmQzcTFvRHEwRDMzbEhBZDE1Z1FqVDl4aFZlWWNhYU9CbEhDVHZGeVZR?=
 =?utf-8?B?a3B1SDdBYnUvU1hreGRtdm9kbjBmeXN2S1FIQkViQzlYcXV6a1liK2x1T1Ux?=
 =?utf-8?B?Ny9LT0F5bmtrTFhQR0lpRkhFcFd2L08xcFFuN0I4L0dUNDhFbFdjY3FHWGxG?=
 =?utf-8?B?MTU1N25YWDJRSmwzcE41U0F4RVR3alY4cVhQckNScXA3d3c4ZmJuMmoyTTk1?=
 =?utf-8?B?VThyM1pKYThZUDluaUpkcHlBNDQvalFyQjFLOFVoY09BZGJlNzl3OWdqODRN?=
 =?utf-8?B?SnFFUCtiUGw4dWRFOCtBR1Zxc25FRzQzdThPQ1JsTldGVlA3V1NhQjhCdk1u?=
 =?utf-8?B?VnBjd2JGSTNOclc4ZnpsT2RBaWdHRUt0N3hiV281UGxQNUlWMEk5NkJhU0ww?=
 =?utf-8?B?andUSHNYL0hWWHZFVzFHQ0hvTjJRYlp5dktVWjlXeW5OdVZjdUJ0MlAvUHla?=
 =?utf-8?B?dmwwUFJVUHd1c1VnMXRBT1FlNnpvaWJVWEk4NVU4bXpZRjZDdDdVb2JMZnBW?=
 =?utf-8?B?dGRIbER4NU51dEpjTVY3U2ZCTjZ4TkR3a2RaQzRQTkFrVmZPT2F5Z2lsOFlV?=
 =?utf-8?B?Ynl2dkxoYnJ1Q2dHR3Q2a2lVN282WDF3Zk1YL3ZJSFFUWFIzbm55QitIcVFE?=
 =?utf-8?B?STRKWjRJNDJPNWNjeDhFYnV6NW1HVzFTS2QrM0JUdjdvTk9VeFRQYVlKcEhm?=
 =?utf-8?B?V2VyOWxhVk13eG4wdU5NaS9DK0VUdi9CQ0x3U1RSN0VFVnJrbG5oMFRsTWFk?=
 =?utf-8?B?cjU1RUtoNzlNTllkckJ6N3lHOGpKNFVmckV4YzY0akVRdnIrOTBkS2hPYitS?=
 =?utf-8?Q?rqO2iHkvWBlyLVIrGb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b58445ce-4b2f-494e-37c6-08df14fa47a4
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 20:28:48.7962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vCMXhcf8uSywCsG23c6VoQtWmINLrWhaA9eie0T2129j5lZKlVIGmhAbMc/jx6p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8114

On Thu Sep 17, 2026 at 3:47 PM EDT, Lorenzo Stoakes (ARM) wrote:
> The vma pointers are not modified in any of these functions so make it
> official by const-ify them.
>
> Propagate this throughout the call stack.
>
> No functional change intended.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  include/linux/mmap_lock.h       | 12 ++++++------
>  tools/testing/vma/include/dup.h |  2 +-
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>

--=20
Best Regards,
Yan, Zi

