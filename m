Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011016.outbound.protection.outlook.com [40.93.194.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0483EC2E3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134146; cv=fail; b=i4ctYeQrBoKzLAgQLI1V+nesZEVsxAuYonG9/sySfEhWeoY9kT15p6MdYF4ZhExYSEdWBpXAycqZnUHcorFkYnst4UezD2ebEvNEHfL3R8EwI2lSylOUN9c4qHXNz0B3bWZrfj1AuQUhN/IGFJwsbMglRsPEwCAjYKqtHg6Q6EY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134146; c=relaxed/simple;
	bh=zcohdgCwN+pELBQwUdNsK9a6Hxi5Y60y35eHrTZswYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Wy3i5YQLGTjlr2VTSGcZtB5rFFW+AwG/aLHjrcvsyhVOj8NI2mn5YlmsL2FS6EvYGioGBc33FKhGBjshvPPo8UW8ir9jpxVF7CmyTwvqYr5ItJg5Jg846VfBTtqei8jkXvzo+pyYDNOlEWHTrt/SYgcHtrBUVXuIxyMTHsssbgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QidJTSJt; arc=fail smtp.client-ip=40.93.194.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QidJTSJt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRIGKa6C5ZNrv/CzJ4isUtKj1aKqep75smLIvaVx2vI0Q80ZOmf0BGXnMU9u+tylSKpM/f+WVhWUMLoogLIKbrCYZ3Sur8tYplwwx0/FZsz28gZSuXk4YTdvGOWM+0FBySt/HryvWauH9lQowZKIHrOmhAMJHj6s7jEFwsKz15QFgIJwn9vP72mcfzTGKPfKyF2ODj4IONsuZKpRSw1XUqhxyRG12+zFZEvX4ipbx3pcFndLhkvV+HO6KU2DMQHR8MDIdaPGhnRmA/Or/gtfsEc8B7zlnI7BQPKy33gxp1RTuN49KC+ucnB+hcFAG86nHN8B/Hm31BXOejyP1LFHEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMAI+SbYDx6ovxIjWeKokhwtii2FEZCj0WbJDczSE2g=;
 b=vDaPLzsXdJNnTDh/DcCSRDApNtoBOHkSFPoo5wdMjl6jT73dZ6ePyv0fdwJaJ++/MX23zT4GeJpW10nqcs21GLpYxKdCURErTh7QeaYeGfQkr+4wwpz7Rk1mKi3PlG1oKjBpCwRpfeSvSU++YtLhBp+SnM/4XRr6dzfyti2dM89Gio9AueZr51g8Qfcp9u6m1DdMb6cYS55HajyyOaM3AtniSGchE5T41gnEQ4szosR4kP1+OV5pNHWtnFELy/6xVJGn3Qzifso4bQM00A8BeWPVo6w6pCX6Tr4UYtu7jE8zp+oG89KVKjuhNS0SKqFUltpH1oHvWs3VSiQDftXbNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMAI+SbYDx6ovxIjWeKokhwtii2FEZCj0WbJDczSE2g=;
 b=QidJTSJtCiAG/weQJB9kqbh/m+agpjA5cRsOERow/hqDp99mEwsR+byJ/bA41q9uGEKINv8c0i8AsquMtaFrppA7JJJmhvcg4SqpF20ozgS/UH1aNUDHiFXiJSTwWzElJbCmPiE30NxzvyeYtJP0JgIMOGO35gdeF+qEsROtqdk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 MW4PR12MB6849.namprd12.prod.outlook.com (2603:10b6:303:20d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.10; Fri, 11 Sep 2026 13:42:17 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 13:42:17 +0000
Date: Fri, 11 Sep 2026 09:42:09 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: "Serge Hallyn (AMD)" <sergeh@kernel.org>, x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86/amd_node: Fix PCI device reference counting in
 amd_smn_init()
Message-ID: <20260911134209.GA2018031@yaz-khff2.amd.com>
References: <20260903154325.74343-1-yazen.ghannam@amd.com>
 <apnMZINAYLpwkcS2@shallyn-amd>
 <20260911030303.GCaqNvZ3QRcCLSmzja@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911030303.GCaqNvZ3QRcCLSmzja@fat_crate.local>
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|MW4PR12MB6849:EE_
X-MS-Office365-Filtering-Correlation-Id: cbaf8d7e-2ac4-45e0-c594-08df100a7eba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|4143699003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	yyazC7T712XwOQBm6t9XViLAhmpR73lqi9MaZrMIMVGrfyqYF/2IeI+x1HgHEypYTXkvaPcVACkJrbMugKgzUs2N8vUMuwQq9BTciGPGr4CVkBAirv2U6kOaR4t4PLtSkwsYdsRk+gwrR/uy+clTggcOdBDt1BFrkKeHtuRbX6btSHlDGGiaYVDDbZVPWVjCrYXyKR1dkIdXa/HP5dAGZPrBI+Ii01DHP7/uahziz1dCBautqvS87MQoiq5Z4ybaxieXmm2z6vmF0mUUZIRGqza7/uKzUMP45YRCSbJXqbuMMxKIE/nYR1WqyFN4rIIWzKa5F7da8J4/BoQOXBdcTHIb49KTamu7DZEYmqoF72QQ8cxOrDHvgsqpHTiehhqVYWU0RsKODltj8Fy6nOqwumZUnnYr3lfESNgGYN+Ghd0oE3SinXL9Q5EreEs9XEqc+HGm3CG6DvMRHSMw3T36MezTl2M0cMF58KX5fBUY6Zk1TVOFy4rdNlmICV3XCXAEmxvORmVrMdsUZnlRmqMM/26Wtv222ZXdH7SQFD0qbTwSiZqWEElyf4+LdpNIjz/WxlIjZ1CvX1jEYr0U+yazafxvqN5xavmmJmH8PJsSrew=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(4143699003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o+Bcl0kGgipqe5IgOvGIpQqDVpMDJoKW7bDJJ5d4qK3FXZG+cujTEJ6gDOc1?=
 =?us-ascii?Q?W64Rh2O5pYyfiosTAg/6lMk+0BtaG4qm9PfvoE6bAa5l/gpgtq18TOB35wqR?=
 =?us-ascii?Q?TdhEpVF2UbZz20kd4Xpa1ApARP6MiXfIk7ptdrCq+K20KXNxzpZ+7KPzo+6+?=
 =?us-ascii?Q?5QgkBJV6JI35512eNsjAOUrsDeXGicE+dj15IJN36vNhvTLI0SwOtjhlh4uL?=
 =?us-ascii?Q?VaSRebpDa3EdvXA6Q3Le2MJwaPYanUdx9FI/r3pOr5ZH/mXwyz44+7B4rv/h?=
 =?us-ascii?Q?7Sm/nx1QTwxpIFh96ej6V33il2T4y5RMbTw0iT8Frng5yHrUu7l7MP1qXctZ?=
 =?us-ascii?Q?BTZxMgQOFvlUy+Y3crswPZ0czGuTV2ZWIQLDMJUO28tI7u4/yDdOfl0JwPjd?=
 =?us-ascii?Q?U3mmObScBuO+WgBh0SxVV5p/YJ9lFzEKOLf2aWrlkNuQEGdkN+Y3V0E25+Yy?=
 =?us-ascii?Q?1Hr36btkr3FjKzj9rQISgwyAA76mbsIrtQTIBcnHbydQ5+YtAqWnKDA/fQP7?=
 =?us-ascii?Q?iLezzp8m1dqX9JDH7cRd8/5vxLhObDGkrjxyQUB/U/ZrgX9AUaUQLVsmHgRG?=
 =?us-ascii?Q?LeA2X+jiDTuD0x+c7/ygVqXYQftyGYw5k2ptI0aZFH0KXXxbtMY4y1vCs5wH?=
 =?us-ascii?Q?g5yIL6rDgpXSklgalUpPG6k8CV39OACgJ1QjpNS5ip4PrQTqXzpMHb0nucNL?=
 =?us-ascii?Q?sGcFvZijisCZ46DqYPiB2dTYyibaKrr4OlM5p9KXGhAxbPIzIedp0FgmvdRq?=
 =?us-ascii?Q?u0jLnOF4j5AX4Z9H3YxxqhvGzig6cf6TfbnxCI/dJAvme0GPxeFFOx8HIbMS?=
 =?us-ascii?Q?4zsNJ7AOrHnTqrupSqWUgwCo/+Z2DbCoA+HCMJH8kJI5Est3eknq3raLJswJ?=
 =?us-ascii?Q?a/xLjJWiwk0FiYdWlL15e0l//1OWvdRqfeycpCr+kiRgJpj5sMb2s9+23ZRV?=
 =?us-ascii?Q?UgEpD25ea8FH4uv8cx2ACNgMkwepSc1Qz7SOUh6jQSLBPXoAYJHjS4PW20VO?=
 =?us-ascii?Q?O3H+9Shl5G1v+YQZPy6xYMdVk9uvEdzh8PDQ3jJfQ6bx6JeVzq1mXH4dW+cF?=
 =?us-ascii?Q?lnrDo8LetpZnocfO8UsndLvZ9gzFsFN0BA69UYuqPWrQq9URw/b+VqmRwsmn?=
 =?us-ascii?Q?txJW5+vos5s3gOtOnqn/5CMaIWd4rbPj7c5Z30GgH3YouT8FsvMOqwKoNd/3?=
 =?us-ascii?Q?wmoR1D3RAgzxGLMt9BZO9azSxUtbVNHB/32jKO32i5ipOqWEWeZZouKQQCK0?=
 =?us-ascii?Q?Vf9kc16D6AcH1InsT4zbmjq9CDUGShAZWROlvsgWNe+w1b54sWiu06sjzAVf?=
 =?us-ascii?Q?lT1n+zhb/UqSMm99wPVtjRUPpQMwQfuAocWwHPQeYdA11TulGXgL8oyVqoU1?=
 =?us-ascii?Q?EF5W0xcKG9TIeoAzhkwoD/aqK9xqF1P1BEh+u48G9RSoRdHPufQVeuYaDLBX?=
 =?us-ascii?Q?X2fX5eVNxvGNQ6SnaYyPavZIXZPtQJsJ7Gw2+b7Fnn3xEJ+uP2knoEWL9sJZ?=
 =?us-ascii?Q?2TJvSYph5WEyU92GwERNdhg1i2qGCnK4BCjLQBz8JeD339kideWD75z6+Mny?=
 =?us-ascii?Q?08OTXdqIJCT+IDEV/205yh6N7xTDGeKGBbTcdebzhqFHYFIlTqglJioYMgtM?=
 =?us-ascii?Q?+gee9cCsH1dwfYOsQKEiNrUc9ONN0I9aDfooD+PLBkH/vwaLIGCKPuJOVh5V?=
 =?us-ascii?Q?7sKrqz3EmMCtYSOStRHBDG50W4z18Tr9voVOKTPoK1X609yb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbaf8d7e-2ac4-45e0-c594-08df100a7eba
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 13:42:17.3260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JCzjzvirBsbM7Sat6RbzW4QsQFEi359vnRA9F6DNtJM/qWcPVmkbmAOyINwW9Osw7S289sKgs3qcmpYXeiAC2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6849

On Thu, Sep 10, 2026 at 08:03:03PM -0700, Borislav Petkov wrote:
> On Thu, Sep 03, 2026 at 02:37:08PM -0500, Serge Hallyn (AMD) wrote:
> > On Thu, Sep 03, 2026 at 10:43:25AM -0500, Yazen Ghannam wrote:
> > > The local "root" pointer is a temporary variable used during the device
> > > search. Therefore, refcount related to the search iterators should be
> > > cleaned up after the search is complete.
> 
> Ontop of this:
> 
> From: "Borislav Petkov (AMD)" <bp@alien8.de>
> Date: Thu, 10 Sep 2026 18:43:33 -0700
> Subject: [PATCH] x86/topo: Initialize AMD nodes per package
> 
> Sashiko reports that
> 
>   If amd_num_nodes() evaluates to 0, kzalloc_objs(*amd_roots, 0) returns the
>   truthy ZERO_SIZE_PTR (typically (void *)16).
> 
>   Because ZERO_SIZE_PTR is not NULL, the subsequent check for !amd_roots will
>   fail to catch it, resulting in a divide-by-zero kernel panic on the very
>   next line during the __init boot phase.
> 
> Make sure topology_amd_nodes_per_pkg() doesn't return 0 - the AMD nodes per
> package count can be trivially 1 if detection fails just like the rest
> of the max* and num* packages topology attributes.
> 
> Closes: https://sashiko.dev/#/patchset/20260903154325.74343-1-yazen.ghannam%40amd.com
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
> ---
>  arch/x86/kernel/cpu/topology_common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/cpu/topology_common.c b/arch/x86/kernel/cpu/topology_common.c
> index 6845e3c63fbb..7a7442981594 100644
> --- a/arch/x86/kernel/cpu/topology_common.c
> +++ b/arch/x86/kernel/cpu/topology_common.c
> @@ -14,7 +14,7 @@
>  struct x86_topology_system x86_topo_system __ro_after_init;
>  EXPORT_SYMBOL_GPL(x86_topo_system);
>  
> -unsigned int __amd_nodes_per_pkg __ro_after_init;
> +unsigned int __amd_nodes_per_pkg __ro_after_init = 1;
>  EXPORT_SYMBOL_GPL(__amd_nodes_per_pkg);
>  
>  /* CPUs which are the primary SMT threads */
> -- 

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen
