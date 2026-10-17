Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010000.outbound.protection.outlook.com [52.101.61.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F18B3403EB;
	Sat, 17 Oct 2026 15:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792250458; cv=fail; b=SLErSQvXQyHrdbH8xmWYwhNtJq4vo0Ef+vPT2jv4VfdSU815G6VpZrazOIV5fu3iLLtEio5ohv11NYgpx3r+D92JCs21mtAwDIGs8wIFGX1ZTpW2cVOyOl27r4+A6bt1kjEn5WW4RnAng33Hbz+IJRXb43SOUyv6QhGl5RdfBeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792250458; c=relaxed/simple;
	bh=c1XG37/ITn1hMecvUxSh/W8WaaNsZ+VJxUhKM2g8kCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kM3ryhV01hULV4AUEVfVV5qKz1f8SsaK2ivx5UdbkCV+nSzNZdmWihbJ+NvS/cFThqYHktrIKrjwif+WAJ9ht9Abz04EUBKPKWyzH8aDzAxbwRjuLuTYRv/b+mEdU9pLfKwVeS65BxX+++AW9IFa6r9zuT50IFviZmxjTI+VvJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Bu6UsHBx; arc=fail smtp.client-ip=52.101.61.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Bu6UsHBx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dej37OM4KovVIkSYnEOV5XIorjM5eRmyySvIme3WUPyHP7i9s5dkjBc3devXwH9nb3w51d7HfWR9322GJcJeMrfGz+3tzFoONH4vNUvQWYF3OrP/ekI7L9LZLW5xmD0/YM0PQn5V05JTtafgLDRXofdC3QXyBnsqq3eZS/B+h2b2qOYewtXZP6DF1I7a4C8a+bUHfCsVtxhV+xiinfUUjbwzfIu0lNOs5t0QDkmfxyrm1LoBl0BGxEz5ijjGUHmUx14uSN5KlHU7htZKW+pH24OnYaKrB7i3+qmhjdqSeI5H9KlvLRRAkxhMItXf0284kiOTXIP46igJeENZdkWlQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AS9bght3JN/V3fDGDLsPtzFs4HVVrBq5rpkifz4ztcM=;
 b=GeMqrT9Yx6sLnBNJ80NhkzdJOPvBy8ZPRIoU1wXzkbmd3lB5lhFVihBCMAt3lbMt/6EbuDEXwJ158H62IxwmjgRkj+dC5dfeAW6bHo5147kQ4HtXl3LswufHX55dGgdE7y+OeVcs7gyHL6W4HqD73aEpEhyJXoVbz2zD8t1/wYXMvRuVC7St79/RZsQr7som4c9ouN3UXmbdg3Jjt/dP66HEDz3LTNAQtRRKzzPWMr+qHJBmLUbUnsQStx86MofiDeOQa16+aIpDxptAIcgw5LZwdmQjtk7BaRyQk9QRDv04KIGrqznEzsvrTLdPZs56n+hFflNpEe5sxgErpjkhsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AS9bght3JN/V3fDGDLsPtzFs4HVVrBq5rpkifz4ztcM=;
 b=Bu6UsHBxJAWQOtjnRz+C24UzNzEExwqd9y22b51Nqx+Ox48gvMa8lXKTirydPm7ve5pqHbCDEZgE+iqQnST7L+gfgmazYzfw7M0fFf4gqHxg59xvuXXexo+Ceu0dNtPqO+ynCLtacAyqIrsSMRpHPkWo9RPMInMLwof1GRPXEhw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 IA1PR12MB8078.namprd12.prod.outlook.com (2603:10b6:208:3f1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Sat, 17 Oct
 2026 15:20:46 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0522.016; Sat, 17 Oct 2026
 15:20:46 +0000
Date: Sat, 17 Oct 2026 11:20:40 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Lin Wang <wanglin@open-hieco.net>
Cc: Borislav Petkov <bp@alien8.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Pu Wen <puwen@hygon.cn>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Tony Luck <tony.luck@intel.com>,
	x86@kernel.org, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/7] RAS/AMD/ATL: Match AMD CPUs only
Message-ID: <20261017152040.GD359037@yaz-khff2.amd.com>
References: <20261009090111.151878-1-wanglin@open-hieco.net>
 <20261009090111.151878-5-wanglin@open-hieco.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009090111.151878-5-wanglin@open-hieco.net>
X-ClientProxiedBy: BN0PR08CA0016.namprd08.prod.outlook.com
 (2603:10b6:408:142::35) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|IA1PR12MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: 50174707-10ec-4f7b-6c99-08df2c6237ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|56012099006|4143699003|11063799006|261009223027099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	nWMUnkq1XD8UsvtDG012KCEkG2qmuQr+a0Bro98kglq0Pzr1U3/BdokhPesjUOLyZWRo3ahgRFiAN0sJqSB2AexLRv33uV8yeGyLkkf/p2o71CVW9X/2GAzB42QqqFAtci+IFiUWFa7yl/QJS/5R4la+oDxSKSzVLSOGo4lMgz9wIolatzFSoIFagPpB2HldsUV26XyM/S/4MrjUtlsvNX2ERAUn8CtH6BZH6/WqaiihgePHXwmhU/5l9Ue/XASzfbTluTaha1TKBYWp65jTsmS5g5rqN3Y6jSGjvCUzNcni9ncurCVQA3mObVMnTfXqlBs1qm6uy2WchiZwNRwLosq9xAIc5FZ1gZ+hsEDxnJTaq8PLoMwbOLON/VWTfE11GfeNA63EUMA02kDeNQAPSgxBCrQgcrDQDau1kkS1xH0FgEvTSmqy6KmV+pgaPaNSgJwhrW67gIcSVfigwcgYQZBTXL61gD4gF77PBx3+Auu1htu1/TXMo2kbbQm1fYVXgMKuSWeu4uzxOdKs80kUi7eIkLmwoELeJS5M7sYZEJC1unJADiAmBoUcbvDp7zAG7uHQ5IOptW+H8DlyM0QDc8+/TkY5H6Hf0zRehNsTxuYP78JMfAs8PUiGn4Is0PHsjmI7NetBHjSkHvhHhzCH84xnqumeMTfILMuNx1u98hc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(56012099006)(4143699003)(11063799006)(261009223027099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xvOXOdw+mNyMqpZscaY+bRDzcjvWk6ZPqoYpT9qiPm3y+LRQ94rh7t3RAqjD?=
 =?us-ascii?Q?uVBIxXctqvsQibd0iNh7tei1PkdbDuhFawoBC49FuhjIMh4BB4DW5a5rch9D?=
 =?us-ascii?Q?0vNkNoRNT+Qe1ro8VaT8ye9gDhrqcDkcEwPGvfB7N0I6RploRDLjeYucmETp?=
 =?us-ascii?Q?HmtZ8q22a1zy7rAVdVWW9h6DjOEIQf+fbGD4Jt5XyTwqQPD1Yv6aLecoNo+W?=
 =?us-ascii?Q?QkhNDftn6aszs+bIJ48kMpxo9aTojWltfegJa0QnrNVM2aXCTCL73Ukw7Yu2?=
 =?us-ascii?Q?lkQYtxIyUM1epQXougpdroh0Lb0Y4kEEKuC2SJVIM+4Tu7YblAfWpzo2oQmn?=
 =?us-ascii?Q?yfI+1JFt+qaZGd/I6eW50LDM9BgeZpQbcmHkx08tUG3pk8zkCCcmJXpx0Xkq?=
 =?us-ascii?Q?9NuL3Rx0dimW/2RpRwgZixJalEgCDcw4LWY4WyDBNxzQcb3mJUsoj0GWXXm+?=
 =?us-ascii?Q?jHoogZSX04nWSJiDitRqp4Pf6HVz+r8YWWhIcHFGvGphJ1YF7+RZ4xvfvyAz?=
 =?us-ascii?Q?6yUfAaHyR9QpUWFSOj28eVqERNXbZXrNwjfTrVyfSA+B0/oU2hPIJNG0COgg?=
 =?us-ascii?Q?Qaceidry9EvBFFqlfegUNJE7WUT3u+pjxWO/MraOenOB1BpOZr1s5a6kxWdz?=
 =?us-ascii?Q?A0wUGHPPgEkozR+i3QB6+X1IHhjuEXpyFW8v5hHadoxps03gVTNphbTDo8fZ?=
 =?us-ascii?Q?f1T8f42rsg3g/04fY7A8rWqVRJBQBkzUORYFnoGs4FmF6KFCsEbjbPPoPr42?=
 =?us-ascii?Q?4QBvqXAY+7w2Qp2770AP8rJoU1G536fr6NwqMhV6dhP98M6ZyJ0uC3Pet+hN?=
 =?us-ascii?Q?J7EhR3rFnGU1BPSOQfpn45jQHyrpzaZbzHsUXVPM2LV1vhoojYq/pmGX2lm7?=
 =?us-ascii?Q?tanD9qC+AaVgkU5+61EvQ+NF9BwITkjL/LiXbMeV6w1fdP5VDiSDQlMz+9YM?=
 =?us-ascii?Q?qFR4UPJOVVGZHJ+xhlHcymz7ACWlbiw6bXE8tAxlv4XAsO1mYa4Pp5GzxDQ0?=
 =?us-ascii?Q?1eYeGUH60LUBkYpt++DhMiq0NiMoasziThCx82r+lHigtovYiuXSlCeK035z?=
 =?us-ascii?Q?ObDHBo0LY0XtWxD1uyGcD//mojJSbU2trEW+0FjS2jLexKPa2/jPOkSeL0qQ?=
 =?us-ascii?Q?A8u3+NOIPiyNhjH3qRhpTTwMBA/QFtDJiO8u+N/rE8qVzlLWVsBXcgs134n9?=
 =?us-ascii?Q?y37fsEA/x8BiPq8groE1SCnelMQgKNm46Cma9WsGw54plE7RqnlFI+zQcHTD?=
 =?us-ascii?Q?GFSFpW+1vyfYWGWVk2bTeXFtnIqRNVcj3rE6FUXm4wMxsMZ8sRCHf3miinQi?=
 =?us-ascii?Q?yYiSU+sdwCc+uAZtdxswaCuwB5vubPC0Nn6gY0ih87IJ7pL17a7DeeLdIqbm?=
 =?us-ascii?Q?mo4nysCFfLH8xA7MJ2l0UwdnhHZjgBAJYXVRK2Ccw2by4VPAubTDectLosVY?=
 =?us-ascii?Q?+yJoda2fa3MeDw+NGq2CzoB7gVhIhrJN0tnP9ZRgVugArj4Me076nunp3ShO?=
 =?us-ascii?Q?+L1kUj7la7fWE0kU4ZLgnwVR/RPp9jyYOIujg+J5tmv3O6niyBcvL9ZHVv7A?=
 =?us-ascii?Q?qyHenuMgUGLm0AH0O0HZNdgSm7E2kXKMax7mxn1R4xesIRl74ox+BjT6TMU7?=
 =?us-ascii?Q?x3qGSovlQuQfLrWsmQX074PFk2JSeAWFqigRNtS2e/G0nngL9JEYXIc5/jo7?=
 =?us-ascii?Q?/HXvGip2LHKSJHdWAw+uyoFKzsjjXr/vj/ELXuIlDau4g5K5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50174707-10ec-4f7b-6c99-08df2c6237ca
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 15:20:46.5847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 07yhTotq4yckOAPy+bLcndFAI+wcKAism+3x1RLvZiZbVLEtDNI6ZmJZBep6dja5Fyl+lIHsqwGz+4l0Xpd/8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8078

On Fri, Oct 09, 2026 at 05:01:08PM +0800, Lin Wang wrote:
> ATL matches Hygon through X86_FEATURE_SMCA and X86_FEATURE_ZEN, but
> relies on the AMD northbridge cache for its node count and F4 devices.
> The cache uses fixed PCI slots that do not represent the Hygon topology.
> 
> The cache is therefore discarded before ATL can register its decoder,
> so excluding Hygon from these feature matches does not disable a
> working address translation path.
> 
> Qualify both feature matches with the AMD vendor. Hygon address
> translation will use the Hygon node interfaces in a separate series.
> 
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>
> ---
>  drivers/ras/amd/atl/core.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/ras/amd/atl/core.c b/drivers/ras/amd/atl/core.c
> index d77dacdd4f56..fe84fc52c657 100644
> --- a/drivers/ras/amd/atl/core.c
> +++ b/drivers/ras/amd/atl/core.c
> @@ -176,18 +176,17 @@ static void check_for_legacy_df_access(void)
>  }
>  
>  /*
> - * This library provides functionality for AMD-based systems with a Data Fabric.
> + * This library provides functionality for AMD systems with a Data Fabric.
>   * The set of systems with a Data Fabric is equivalent to the set of Zen-based systems
>   * and the set of systems with the Scalable MCA feature at this time. However, these
>   * are technically independent things.
>   *
>   * It's possible to match on the PCI IDs of the Data Fabric devices, but this will be
> - * an ever expanding list. Instead, match on the SMCA and Zen features to cover all
> - * relevant systems.
> + * an ever expanding list. Instead, match AMD CPUs with the SMCA and Zen features.
>   */
>  static const struct x86_cpu_id amd_atl_cpuids[] = {
> -	X86_MATCH_FEATURE(X86_FEATURE_SMCA, NULL),
> -	X86_MATCH_FEATURE(X86_FEATURE_ZEN, NULL),
> +	X86_MATCH_VENDOR_FEATURE(AMD, X86_FEATURE_SMCA, NULL),
> +	X86_MATCH_VENDOR_FEATURE(AMD, X86_FEATURE_ZEN, NULL),
>  	{ }
>  };
>  
> -- 

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen
