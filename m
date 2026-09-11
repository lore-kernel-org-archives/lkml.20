Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013025.outbound.protection.outlook.com [40.93.201.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68034BEE3C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164579; cv=fail; b=qc+U2PnRYhGUPUWHk9pScEHzWe3CrzeTADyv2l5iaMDSli/hbmSVbKmch5rUJhy9ACd++SdTeiHRXFRgrUXJgZBmFH22ABwmvUxlcnaaMUiKLZkGdAnKO6de09MoD0Jc+BfRvmIpNtdgQEZFER3AuPDvy4Y5aZJulQhBJLmASAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164579; c=relaxed/simple;
	bh=NdUEkzdo+5hK4d1tC1I4DrSzZI+FhC0+PP3sX2Oxqyw=;
	h=Content-Type:Date:Message-Id:To:From:Subject:Cc:References:
	 In-Reply-To:MIME-Version; b=Hwcv3C7BVSa5ARJTZ0WBCOl8wXNKQY0Ugu2MtiljTlKJSL4STBDkpdu8Ny2qrKjIylTyWazVR1Hgcg5770Lh6xAZ5V9/f2M+WJSv5+BRzqSyDmNChYcXsXeK3m4ap4iy6GNzwJ5mQnCFEhIrD6Tbd2Yoe2U3tZaNAyszkbS2DsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Pr8AH9Aq; arc=fail smtp.client-ip=40.93.201.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Pr8AH9Aq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXdSGklbzKejKyV6g24Is+B8guUDm1FXAF3Yd+CaCVfO027YEMeLMkhlQpdMwGwa98t7zYOvtm57RE2fUo1fMyVHmNZu+DGQzQ6R2toQG9QjrhhvdYl7p5iUBs+5Gb7cJYfcg+4Cf1rGyYzzHnyNw92uG43lwI28esjQRAFZGtIwIrxC+oeQxMMwg/YwE8dNcXzGqoVOTOXWkfWmDnmeekNrFPjsdIn1vUWuaMcpbAsLPGKHhD+Jyzc9TWHXIYkcQd1pxz4jTcxJ2B0AZbxFJ5MHqCucacm67i3o7VNG+fPNZsHStUlBikwrTwuIRjhy6MMnEICmxyH27uSkNtwvQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8f7vNz2+8bBdcfIWNLatoCfRRoe4xMuSKkLxi5m810=;
 b=By6Zf3uvH+h+BkSXyX1MMOp1rdPvvyzTjtBxpZgxwpLZ73bJvnO5CuydbsikA+1XfU5fvoK+/kF62hnLphAS//g5QLj8EkZLgoNtwXROw8WiiDqAcPb+MoGeRaa/k7Xz5vS3CH5QL7k96B4jgfAQLurvafmza0S09zczSuX0XO71frjdx+QkxjCdsJj7Mhqn+1ii7GEeKVFB/rj8Q3FJMMhJ5xZ9tnB0IBe6XNWEcWvtfsw+sfoTX6Et1A+PZrD/ZjR+ELYLfsS4pCfMmocnOxaSaqOH7nhkUWRmoVTogsRDeV382zDHrl/LpyO3ppvhdzpnve/zMkwcgRdl19/GfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8f7vNz2+8bBdcfIWNLatoCfRRoe4xMuSKkLxi5m810=;
 b=Pr8AH9Aq1X/Iwk7OxeplQd0eVdunUhL5D9FsvpwIfFWhvC77DbOAGmyS8SiFycWhAnv0ClIrKjPV0zPky+MHVnmDwvvdZ5EistX6xFq3EZTZgKBBxZ09z0X6S1ZTXhfnaNjfWwC5NQ72TQXTgFzvKZ/QRnCqjjUivs7Hz41a+42AJ7z7JGsqYoNH50qewHAODFXcGrml7NWs30w1OJKHxC99Ht4dJerejUwoaqxN/RdZsPtM8RSDi6GW6vMF1P8Ih1xrwEWzACr8w5F6S4Nw2G7vhgDE3CSBwvu/Z7ZoI0RYBbcikMDBLWDhwTlm7d+eAAQt7r47wM2SmVa7C2uQCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SJ2PR12MB8063.namprd12.prod.outlook.com (2603:10b6:a03:4d1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 22:09:34 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 22:09:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 18:09:32 -0400
Message-Id: <DLCTWPIN1HRO.2HK4RPZ43F301@nvidia.com>
To: "Kiryl Shutsemau" <kirill@shutemov.name>, "Andrew Morton"
 <akpm@linux-foundation.org>, "David Hildenbrand" <david@kernel.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH v2 09/12] mm/collapse: open-code collapse_single_pmd()
 in its two callers
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <kernel-team@meta.com>, "Liam R . Howlett"
 <liam@infradead.org>, "Nico Pache" <nico.pache@linux.dev>, "Ryan Roberts"
 <ryan.roberts@arm.com>, "Dev Jain" <dev.jain@arm.com>, "Barry Song"
 <baohua@kernel.org>, "Lance Yang" <lance.yang@linux.dev>, "Usama Arif"
 <usama.arif@linux.dev>, "Vlastimil Babka" <vbabka@kernel.org>, "Jann Horn"
 <jannh@google.com>
X-Mailer: aerc 0.22.0
References: <20260910120238.2529819-1-kirill@shutemov.name>
 <20260910120238.2529819-10-kirill@shutemov.name>
In-Reply-To: <20260910120238.2529819-10-kirill@shutemov.name>
X-ClientProxiedBy: YQZPR01CA0177.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::22) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SJ2PR12MB8063:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc56357-62bf-48ce-1389-08df10515c4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|10067099003|6133799003|4143699003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	zZI5vQfzki5o5bYUYwcf8Q11hH9bJ17P2f02WHS+OsWMoTiytW7bD7VYbck8O72aLBuZEGFQGdze+jJOVNgqNIOArexYbfvTHMASl0noELur+cJB0kwik7WCTArDjB7m0YuOY7t8zr3jBUHL/DxkigwWqTE9TBepogQmuv1nCiMzgACe5I6fU80xXivG3v7z/iooRdhvWXFP9CINXqHTBDY2joH9PFHx4YY0P4fWmIBFI6ZIDalvUuD5T2xsFZKkF3cvHz1PxN8T7BOVJxJL8dmaiyk101PCYqwueZ6eFeATtycubVMUzdyjuBrNMOhI6OhYhkRfm2862X2sSjU6+WduHcLwlZi5Q2gTqaWwlltduIj4TNVW+J0qi9ns2uv0gQNC4Bht+3o0qwlABaUPkF/UOar931LskNz0yt1uS/gaBTWWq/TRn+xGdoXXmBcAUP61K0V7ZC2jk07Sh5IAy+sBlXHOchHR90Bn1pmqxX7qqRf8iVLgxeEdKCLFpuHkmuRNvN+aG7PmvJ+trchoKP80kinVt5GUQt0qQLD9IKzMrPNY4Dv3sLTVRz7sf6sT7B3uATVOnCPAXoEPS/I1ie0fFKrF+K25hPq79bMXQpdfwdUqEfcm9l8vy42fewUwf0Pf0UINB2XMg6ayRS80ChWo5fnXDigIga9bOTX1JQ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(10067099003)(6133799003)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE5QNXdNbVE4R1prZmMzbHovSE1Sd0R6TzdGeDBQeHBIaEowOTNVTkFRZDNm?=
 =?utf-8?B?elpEcHZIUytJZ1pqZ296YVdlbDhySWovNEc5YkY0SUJwQXF0UHRUUmtHQXpq?=
 =?utf-8?B?ZzRYNnNxNDNzT0tmZXliQ01XSDEzNlNoRmY0bXBZYzVFR2FsR0xUNHhBNWI0?=
 =?utf-8?B?bWJsOWtNKzFqendtRExoUGR1QWw0MjFiTFZDMDNWZHJodjY0Y1lhcjd5S0li?=
 =?utf-8?B?WU44TjhrM1cwTFpMdWxsMWhHQVJOZTlEUlZxMFRVR3ZnbW5zRFB3WDlhOGhy?=
 =?utf-8?B?MWREZFBnRk8yQ2l0Y2JZSlNVNHVPOTd5emowdExubGJ6enVicG1mdnZJY2d6?=
 =?utf-8?B?YXZTK3ZDYXFabmJtbEtHOXArNjltOXlHS3FWak9tblp0RHlteCtCM3krQWVM?=
 =?utf-8?B?dWNlWlZURXFaT0RIOTJFdmtnT0hXa3M5enJxY29iUkt3cW9QVDJGeEsrOS81?=
 =?utf-8?B?TWh4L2I0d3JZdWNhS2liS3ZLZWJ3TFJ1alRBQklVTjc3dW5JcEFHOGluaWNs?=
 =?utf-8?B?ald5OWZYYVB3N0luVFZEczRHaVZ5d1ZsMERZSXA5U0hVQUUwcG1IbDZOanlm?=
 =?utf-8?B?VTQzMGRrd2t6bm9TQ2JSMGpWcStLQ3RoS2RvMUpnTG82N05vTTAvOG85SHNP?=
 =?utf-8?B?UXpvUGtqbUtwVlh6S1BqRlZ2Y3ZiRUU0Y3o3NUZsV2swZkdjUmNWZEtsMGNI?=
 =?utf-8?B?YlI5MEZmWDV2YUtiOVZJWVZZUEtTNktoN1VQKzltdFpvcXdXOVZDYzloS2lq?=
 =?utf-8?B?d1FlQm96em1MbGJGL21HZWh6TGRpbWJqZ0VXcmliQ3B5eTRkcWFpUmNGeERG?=
 =?utf-8?B?SUd2YWNiS0VDeTBPU1NSWG42alB5Q0ZIM3JuTnRrR29jWDVLZ3QzYXZBd2ZY?=
 =?utf-8?B?RnRKK2hMc0k5ODVuZkVYa2JKdGYyaVVlZjBIclpsbnZQZ0k1MU1GVCtDQ01O?=
 =?utf-8?B?by84amJkazJrMTFRdEM2R3VIcGNWRlhIWkxVYUFtNkN1MGw2V3JWVHdZTkpO?=
 =?utf-8?B?OGpxVkRwTkhVUlkzZDl1Y242SnlUYlMwa0pVVHg1T2ZycEZnUDBHR2FGZGNG?=
 =?utf-8?B?d1Fsc3hxVW95QXAzWTZyVi9lek9ObGRVZGQyT1k2UGlhcnU4S3dzWCszZGcw?=
 =?utf-8?B?OUU0TGNUWmZCWU85d25KeWJ5SDE2aFlmQi9IMEd6MHgxVE5uczlYUi9tRHd1?=
 =?utf-8?B?T3ZlR1plM2twRm9DbXdPYVYrRGRiNUZPVCtwQzQrZHlkdFVrci92c1NkSGxm?=
 =?utf-8?B?amFKa2xWaFpPWWd1TXJ6VHVCR1ErSTRJUDlyMnY1NEROK1ZOWDZYVmNSTTZs?=
 =?utf-8?B?aFhPQnV6c0xSaUM0cTVpTjc0WVpNOFJ0SUNqTlYvM09vbDJ1bSt1THU4VFov?=
 =?utf-8?B?SkVxNFpNN3AzRWtFUEE3NVloczNIMTd5TU9VMnRDSG81VHhGZWh1T0FGNVRH?=
 =?utf-8?B?WkhZQ2xnTlZ2SUdUay9OYURSdDFvN1NvNytHUXBZTHNCaS9WU3R0YXhTMXZE?=
 =?utf-8?B?OVo1TkcvKzRML3BDcWxUd1RBbXUxNDU2YXErL1NDdDdwNmhQSHZEeXFaaUp1?=
 =?utf-8?B?Z3VmaUZvSE1vSzUyTFNiRkFnbEVKQ3M4KzZYWmVZT2NGU2tNb09XbXpLZk9J?=
 =?utf-8?B?TGJETzNlSng1TDZnVmJIMmM4R0Z3SVNWaHl3SXlOWmV2dW15ckVGS2s5U1BJ?=
 =?utf-8?B?KzhtejVRNVJ2Q1lGVzR4cXQ3b0ZvM20vSWRwSmhQelE2bTYxTGdrTFNibHB1?=
 =?utf-8?B?dTkwdDBMSVlDQWlnelpDYkhPWlRPU1Bnd2dWNXZBcy81OUhTdzYxR0NjN0ZK?=
 =?utf-8?B?WWpiUUdDMnJ1MkJSVnlLTXhjTVJVWjhtcURidmFLYnVGZ2NDallOeFNnamZI?=
 =?utf-8?B?L2dWcHJ6SEtReEdKQ2IyNUVIWWdZNDE1NVo2Y0Z3Wk5kcE5kOFBBaWdxOEd3?=
 =?utf-8?B?LzcrREZWRnJHTEhweWJNM1JGb0FORW1lbXhmMGxwM3YyQW9uVk1pSUtSYVM2?=
 =?utf-8?B?YjZTWTBXSEo5T0FOSEN1NWVwMTREQ0FmRUJocnhJNnpTbzl1ZjFva215Tnor?=
 =?utf-8?B?UlFrQkRsMS8xbUdibkV4MGlNejZHSU5SSkJwWXFPNTQwWTBaZmJkVjE1d0Jt?=
 =?utf-8?B?RDZ5eWlEUWFYSklTNTRnYVpTc0hpV3RiUjVtRWVBZnk0dmFWY1Vxa2xoTzRD?=
 =?utf-8?B?cUl6dFpNbW8zSU5tNENwVFdRTlNVVTcveFBMOFRQUE5Ec2kya0JtQmhiRGp2?=
 =?utf-8?B?eE95OU42T3V3RU1YbDhhQi9GTWYzR0crVVZHei9hNTJRR25Ya3lRSGd1OVow?=
 =?utf-8?Q?GzkX/swLQlX77eXW08?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc56357-62bf-48ce-1389-08df10515c4c
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 22:09:33.8776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xEcJXRmflFVW9wkxV8kLtBMoA0ZVX8gGRy9ZKN0GFyi8hK4i42Cmf1nbwmnriZAO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8063

On Thu Sep 10, 2026 at 8:02 AM EDT, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> collapse_scan_pmd() and collapse_run_pmd() each have a clear locking
> contract.  The scan is called with mmap_lock held for reading and returns
> with it still held.  The collapse is called without it.
>
> collapse_single_pmd() kept that boundary inside itself.  It dropped the
> lock on some paths and not others, and reported which by way of a bool it=
s
> callers had to carry along and then act on.
>
> Open-code it in the two callers.  Each scans under the lock it already
> holds and, on SCAN_SUCCEED, gives the lock up before running the collapse=
.
> khugepaged's lock_dropped and madvise_collapse()'s mmap_unlocked both go:
> the code dropping the lock is now the code that wanted to know.
>
> khugepaged's walk carries on to the next table while the scan keeps
> refusing, and ends once a collapse has taken the lock from under it.
> madvise_collapse() re-finds its VMA after a collapse, which it did before=
,
> and now uses a NULL vma to say that it has to.  It still reports the drop
> to its own caller, from the line that does it.
>
> The lock is given up and taken again at the same points as before.  No
> functional change.
>
> Assisted-by: LLM
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  mm/khugepaged.c | 102 +++++++++++++++++++++++-------------------------
>  1 file changed, 49 insertions(+), 53 deletions(-)
>
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index c26907300c23..9bdf12128357 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -2857,28 +2857,6 @@ static enum scan_result collapse_run_pmd(struct mm=
_struct *mm,
>  	return result;
>  }
> =20
> -/*
> - * Try to collapse a single PMD starting at a PMD aligned addr, and retu=
rn
> - * the results.
> - */
> -static enum scan_result collapse_single_pmd(unsigned long addr,
> -		struct vm_area_struct *vma, bool *lock_dropped,
> -		struct collapse_control *cc)
> -{
> -	struct mm_struct *mm =3D vma->vm_mm;
> -	enum scan_result result;
> -
> -	result =3D collapse_scan_pmd(vma, addr, cc);
> -	if (result !=3D SCAN_SUCCEED)
> -		return result;
> -
> -	/* The collapse takes its own locks, so give this up */
> -	mmap_read_unlock(mm);
> -	*lock_dropped =3D true;
> -
> -	return collapse_run_pmd(mm, addr, cc);
> -}
> -

Sorry for walking back on this. I think collapse_single_pmd() can be
kept and still get patch 10 to 12 applied. The reason is that by looking at=
 the
code after patch 11 is applied, the collapse_scan_pmd() +
collapse_run_pmd() patterns in madvise_collapse() and
collapse_scan_mm_slot() look very similar. And it can make
collapse_scan_pmd() and collapse_run_pmd() internal with only
collapse_single_pmd() exported.


--=20
Best Regards,
Yan, Zi

