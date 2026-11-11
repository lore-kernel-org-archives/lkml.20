Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794387581;
	b=ubKnhfExyRrio/67/Be9ar0RvMJPxAKxGKiZjAtN+qFnLTRCZ3WaKYWVEZu8CXwN1kep
	 +K6aCkasBF8Fcsfgz+ZALs0ZYnNM5xsDPd2sNAPyIDvoYdTZudGbKDwkvfwxRsMTA5WV5
	 zwkSUuTtPj3I91kDGvQhTamJybSAFNkN//NKRsn+EBw47WlU1g8to7Kk80YDN1Nw8hYA7
	 RqgoSXmjDh6hUtNFjKzW8mt44e2Qo/N1SGLoJzwgWefOJaS5yyZy35Z3r48eMaO4jbzUJ
	 aB+E11bfGOoK/OoDzJV/jCwzLTVyswj7FcjHJvkxJD014mVRXQR2U9O5x8r3ToI6N1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387581;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=6T25cNEpUI51OzMFxywpfZVo2NNKpifhl6FBUy5C3mM=;
	b=W2megjl+j6hfT+2jzlEPD/apPUGEf29nKNce+QI1aKKYJ9Fw7G25ecNAlGfXstypF3JH
	 dt4V0IlYpjC43atwaM6IkAFmWg1wZ5OADoRaF7E0XMPP4epPLhRXoDSv6yUdAEeS0r/JB
	 dlrChTkhW6qlwvcxXP5RKs4Ce6BKoKWrimdqPTS5gMkAn+5U4gj0RBIuMBSpnFpLIEFqh
	 7dAOgXaOqceboXlBfNFEUqQp/89nvuwjIveVDsTERsq1yKu4m3SDs3XWU389ZNZTzH0KT
	 ecWGsl2Fvblbm+VrqUWV0sWrh+YGGM8gi6FuUeOqzZAwiTpqDgtsKiQAxSa+u9ZGCWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IX401tPg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.65
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012065.outbound.protection.outlook.com [52.101.48.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAC7606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FAC7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IX401tPg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgt9b//xl2hipxsYszdh/9XKMTnM6A/6ajpPI48BqkAMUQeP6zVm5YZOjMPIwDAEF1bk7ruIUZ39ZaZi/aiE6nSkHpDUfpxOohPDASZnUuncfxat4Ty9lnZxxM0UNDuFwCARzJtrshIr5jtuVoV5AKpN/k/iaMubdHJJGWESgXAzxmz0myToqtMGyGqBarrr7OkPpNkM4kA/ktgtbafJahWQ3t/XEP7AmQ2u/NxiKWrp/4HEsoqQu09+yr7sbq3LrotXhID4Sxn+3Jy1Of7EUe/6t7FDhJ4YwhiuYvkRELFTPSuGPtv8FaK2kAtc6OuBiHsZU+rHdwMkWbPHx82MqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6T25cNEpUI51OzMFxywpfZVo2NNKpifhl6FBUy5C3mM=;
 b=ogVdqB06Pcdp/3vt6fB3ssrulg6UUwUukMrW0aMZCb7smjn+DzcR3MON7oXkMMHoajKyXdaurrFfy0eIyFcP+NpIxyvfUq4EWP5bAkBfO2Mty8jgCLUsX1rY/01Y8VlHyoSKffItiDD2w8+zXd1cc2dRXfEZOJzR63KRMVYYzbM1VsiGdaWNjTYvHN//m38NiibXdltW+r6mHHY1qiA0Nh+TFxcZJYkFnp8c/OSwxheg9RNsm81N9k5gqJ/TlINg7aDTv5dnN0WCp4Bc/tH6//YeQBoaVmLFFuXI1/dFmuPzMm4bzYAwypolo5W+ZQ4P5FhkM/UWGTLQONe19xrNjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6T25cNEpUI51OzMFxywpfZVo2NNKpifhl6FBUy5C3mM=;
 b=IX401tPgIaWtpdiDVH0/OQ1p07EM849ikQQkvkkWsPWEKm2zm0x735WrxbA9a+UUmHkIrPlGrA1Vv+Scsdp3NCZ345rPqyeK3N0qe7c19J9h2bJz1BlixqSfhGb/+rmsI9OBx4Q3/5WzXI07/yUlU0mYDuA1y5XZ6aXGmqV4p1UM7QuLRTGFeMDPssUHUeOaXJdYJOpDXq1ljtH9sz+T2f3oE0+Vyx7ewmd0Awfl6IpXDJJmAJF/EJeb+g2LweK/aNVdaSmYh/M787MFPeVmvfvAN+kKqvJBn4zoy2fi91857AeUCcQXpyaYyevRMA7TVy3y7SzwoH84RONaCBPo6g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SN7PR12MB6669.namprd12.prod.outlook.com (2603:10b6:806:26f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 08:59:35 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 08:59:34 +0000
Date: Wed, 11 Nov 2026 16:59:28 +0800
From: Richard Cheng <icheng@nvidia.com>
To: Fenghua Yu <fenghuay@nvidia.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>, 
	Tony Luck <tony.luck@intel.com>, Ben Horgan <ben.horgan@arm.com>, 
	James Morse <james.morse@arm.com>, Will Deacon <will@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Shaopeng Tan <tan.shaopeng@fujitsu.com>, 
	Chen Yu <yu.c.chen@intel.com>, Babu Moger <babu.moger@amd.com>, 
	Drew Fustini <fustini@kernel.org>, Vikram Sethi <vsethi@nvidia.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Newton Liu <newtonl@nvidia.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v1 2/6] arm_mpam: resctrl: probe MPAMF_MBW_IDR
 MAX_LIM and hardlim_rw
Message-ID: <avQmqLUWT6VoYmnq@MWDK4CY14F>
References: <20261109212937.1409570-1-fenghuay@nvidia.com>
 <20261109212937.1409570-3-fenghuay@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109212937.1409570-3-fenghuay@nvidia.com>
X-ClientProxiedBy: JH0PR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:990:4::7) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
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
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SN7PR12MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 9905e6ab-5dcc-4ce2-587e-08df3fd21b50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|22082099003|18002099003|6133799003|11063799006|4143699003|56012099006|261028144727099003|261009223027099003|261026140227099003|261102123227099003|261022105027099003|261021121427099003|261022075727099003|261021123027099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Vt1NhN48eLeR5q+ckkS97/ljow9VBOh8B6mDUaaj/grllllqc0ZE7eCNi60xC4Wy3TajChe+y7I4qItq9NoWW2nyIPc9+7FBGFytiYIiAB3AAMM7DfrI/fBoi699mfPCDSMGy/iuH4hgRlGUp+bm6c8AhlWJEDZFgUFk+fvS5c2O1SR0I8pE/f38qbu9nOe1BjumN7m5hkBSN4T6ToQIM1Gc8p6oEaQfa/2Dd1H1U8xaQgwox2+hdmTCEEU1AtERmNcWz5wUdTUsjyi4m8q6fWOgDkbIikMOB4gWiFJ4y6Fl4vl5SGTNMiobQrhNPD6ngzVCUGBZDnsoHcIGiG7ErYVxzQkfipPpEtZxohxl9p7ONaAPONSfk3gsZEEhvpZLn7k55NTZJi86P3ygmUPogHY0IfNzRJbXtInYCS4O8gYBTaslGZV29dif1JVqaXTcoM5xlhf1HpFliKQMe9USi5GlwVqzgvtDjm8rb8QSdyS7uujhnrt2jXZvsNFJ8IYiaEqGO3hq8Je8UO/L/DeMJWBdxpqHMC1nvX7gW+oMPJmEqsLQhFmlzv25QTlVq6KdOm1c4s6QTmaHYl/ifTnTkk2yX/n272eA8Je/sj+Zow7z4xldMc6JxgyNFKzY3mFXELLKJO3Dotj0C5chaWU82TKvj/78Vmc/8+nr5qJi2ys=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(11063799006)(4143699003)(56012099006)(261028144727099003)(261009223027099003)(261026140227099003)(261102123227099003)(261022105027099003)(261021121427099003)(261022075727099003)(261021123027099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AJvC92FuTcZXgcmv7GRG0d/ZOW+gXA+ZPOvPCrjZifbH2LzoGKDx/4IPzJ4X?=
 =?us-ascii?Q?0NmEujb08CyLQ6kZ5CtNJlJ69IXC6w4WKrWJEHb8P5edGR4V6v1Xfu0+GRw8?=
 =?us-ascii?Q?zCDW0W52Ak9EVrdhOX90EhmUMYkp0nte6p7IlETKlE+WxKgNnDzYkKp6w3qY?=
 =?us-ascii?Q?diyvkk5X2nRKRRwnX+UDkiUF8BVp1css49VThyfpHhrYba9itp+vyqkHiGij?=
 =?us-ascii?Q?1xdllzRIKVVvJDUo54NXln4Vl+IhuthJRq9qmXNaItntN5yWFpadEfzSTjOS?=
 =?us-ascii?Q?KidP6qbps9xD896yVKjD7XtCvoc6wgbrDJvPLhIbEcO5xoz0Odo7UEfFLkSi?=
 =?us-ascii?Q?stIV31yyHgP923MsVm/AZ51iDda+f2MZPbzzibVN4EgGm76oBP5/IQup+fEu?=
 =?us-ascii?Q?h8fsmdEHD28GKnPkJx3rkiw4SohLCv9BSSf83I4cyqnlGHivKTedyHD3Gj82?=
 =?us-ascii?Q?lAkzac/1/fdO0ZERPSUYArPZEjN9mNni3SgNoc2T/h7aLphB7bNv3jav2ktb?=
 =?us-ascii?Q?25vZCO/nM+5hBwqKgMaDPjUVyHVuu3vKpkKlYRG55/ZxZShCFyUXwubiJgz/?=
 =?us-ascii?Q?0A0ImsxPn9Y6A24lPClfgHJyPZQSb9lpI0NJTD2ct3BAJ73tofNCEd+fRJzk?=
 =?us-ascii?Q?vzKOvbJ+0hmR2e+hfTpIZKdHbbO0+8IPKGEwZJgwAXP8XCIn5gAb/7uudM1x?=
 =?us-ascii?Q?FfrOIrvjfcLwVAPe6TB50PDD8RKt0MX+oftvXYKNp9o0RQszw6YsQlwAaOjy?=
 =?us-ascii?Q?Ck2twS9xyqJT8sCPcLfBvmV7zYCoskF567xHDZEPseiYopE64xeUcJ8wh5DZ?=
 =?us-ascii?Q?hzlXzsLB3dvZGbtV+Muabj4e1LzPE2ygWK/ipbVrO08l4CJ5db3F8VZm7v7l?=
 =?us-ascii?Q?CtblFhnuLcccvUaAXTee9AcxSmj9SSVyIguj4anU+wNVd53t225V5ANbrPBC?=
 =?us-ascii?Q?4xVRMffiPBzAh0gctBysCxsJhyp+7W6i1nurk73p0iW157QbNS9U34+yWakK?=
 =?us-ascii?Q?mWNH/pLPAddBuvsV8crETRkOFF0GrUIm/N2SNOjsM66HZ7SmTYaBJ1EnOJ4u?=
 =?us-ascii?Q?lJXALCAnsRlymOY96EVo1uLkMLDTXJZLx9ZGGnwh1pIqnDAyKiwHojVIBanL?=
 =?us-ascii?Q?2O3Sd9a8wVScQX33AVKeJl/QbSUH1cwqQWloRfLfAvcxWjjgtPlz+GuJoWPT?=
 =?us-ascii?Q?SnhoSzIs2w+KFToBJL3P4Cav/M5v7HQvU7bx8soQNyBS+RSCWxeb/VhDU9/L?=
 =?us-ascii?Q?73Rg/lkQmWKjt4QLVWC2VKGp0KsStxCxsRr/vf9TePfX2DrlHDg6eZ9XCPsB?=
 =?us-ascii?Q?lYyP4z1ah5UeW9fyLMqDecUUJ5O8h0IWwPzB1+ekC6HmvX4jTxF7KvRwpWD8?=
 =?us-ascii?Q?r/xgdCXebKR3yyRxy4iqYGhno99o+hxm8tfpaukPk7LX1XmhA+/FsMpnLkDq?=
 =?us-ascii?Q?hpuEZ4Pe14Xa2zrEBuVGiGQTTqvjPX63GDYtbKahC+qVmx+IdTOeC7FD3jLa?=
 =?us-ascii?Q?Fa0gxrciYNXru7m23UgCy3YnrmQJ6qup69luUDORcU4WxdnH7uPwCQ1AVAM9?=
 =?us-ascii?Q?R/FuMsi8Tqpj8AXQuoUcni6eqOgesvvENMsMTxOt4wPXyXiTuAfJsO9nQAOp?=
 =?us-ascii?Q?dkYtudsec5u40cg5N5IjGcyZrAjIItlhNKeYcOkBDS7mHp0uVC9/7dcykhR8?=
 =?us-ascii?Q?L57tpXNRtOrjVPpHR2XfVfw8Q6xBmdgzhxGKomvzPidLNlMRMqelbq9WqEkT?=
 =?us-ascii?Q?UXhU72z4pw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9905e6ab-5dcc-4ce2-587e-08df3fd21b50
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 08:59:34.7915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pg8boKifozyYlLiZMUf7rqMYGk25lGNNoj5Wa57db6vfEjCzg96lxdrpRAk93+2pFhFCRtrB5DhrhkYzoSaQlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6669

On Mon, Nov 09, 2026 at 01:29:33PM +0800, Fenghua Yu wrote:
> Before resctrl can expose MB_MAXHLM, the driver must discover
> whether the platform supports HARDLIM read/write and what
> MPAMF_MBW_IDR.MAX_LIM reports. MSCs on the same system may differ;
> inconsistent merge would expose controls on hardware that cannot honour
> them.
> 
> Read mbw_max_lim from MPAMF_MBW_IDR when MBW_MAX is present, derive
> mpam_feat_mbw_max_hardlim_rw when soft and hard limiting are both
> supported, merge capability across MSCs, and keep the merged view in
> sync via mpam_props_sync_mbw_max_hardlim_rw().
> 
> Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
> ---
>  drivers/resctrl/mpam_devices.c  | 40 ++++++++++++++++++++++++++++++++-
>  drivers/resctrl/mpam_internal.h |  7 ++++++
>  2 files changed, 46 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index cb6096e9d2cf..1e56e8f3858e 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -830,6 +830,19 @@ static bool mpam_ris_hw_probe_csu_nrdy(struct mpam_msc_ris *ris)
>  	return (!can_set || !can_clear);
>  }
>  
> +/* Align mpam_feat_mbw_max_hardlim_rw with MPAMF_MBW_IDR.MAX_LIM and mbw_max. */
> +static void mpam_props_sync_mbw_max_hardlim_rw(struct mpam_props *props)
> +{
> +	if (!mpam_has_feature(mpam_feat_mbw_max, props)) {
> +		mpam_clear_feature(mpam_feat_mbw_max_hardlim_rw, props);
> +		return;
> +	}
> +	if (props->mbw_max_lim == 0)
> +		mpam_set_feature(mpam_feat_mbw_max_hardlim_rw, props);
> +	else
> +		mpam_clear_feature(mpam_feat_mbw_max_hardlim_rw, props);
> +}
> +
>  static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
>  {
>  	int err;
> @@ -877,6 +890,8 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
>  	if (FIELD_GET(MPAMF_IDR_HAS_MBW_PART, ris->idr)) {
>  		u32 mbw_features = mpam_read_partsel_reg(msc, MBW_IDR);
>  
> +		props->mbw_max_lim = 0;
> +
>  		/* portion bitmap resolution */
>  		props->mbw_pbm_bits = FIELD_GET(MPAMF_MBW_IDR_BWPBM_WD, mbw_features);
>  		if (props->mbw_pbm_bits &&
> @@ -891,14 +906,18 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
>  		 */
>  		props->bwa_wd = min(props->bwa_wd, 16);
>  
> -		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MAX, mbw_features))
> +		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MAX, mbw_features)) {
>  			mpam_set_feature(mpam_feat_mbw_max, props);
> +			props->mbw_max_lim = FIELD_GET(MPAMF_MBW_IDR_MAX_LIM, mbw_features);
> +		}
>  
>  		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MIN, mbw_features))
>  			mpam_set_feature(mpam_feat_mbw_min, props);
>  
>  		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_PROP, mbw_features))
>  			mpam_set_feature(mpam_feat_mbw_prop, props);
> +
> +		mpam_props_sync_mbw_max_hardlim_rw(props);
>  	}
>  
>  	/* Priority partitioning */
> @@ -2252,12 +2271,31 @@ static void __props_mismatch(struct mpam_props *parent,
>  	if (alias && !mpam_has_bwa_wd_feature(parent) &&
>  	    mpam_has_bwa_wd_feature(child)) {
>  		parent->bwa_wd = child->bwa_wd;
> +		parent->mbw_max_lim = child->mbw_max_lim;
> +		if (mpam_has_feature(mpam_feat_mbw_max_hardlim_rw, child))
> +			mpam_set_feature(mpam_feat_mbw_max_hardlim_rw, parent);
> +		else
> +			mpam_clear_feature(mpam_feat_mbw_max_hardlim_rw, parent);
>  	} else if (MISMATCHED_HELPER(parent, child, mpam_has_bwa_wd_feature,
>  				     bwa_wd, alias)) {
>  		pr_debug("took the min bwa_wd\n");
>  		parent->bwa_wd = min(parent->bwa_wd, child->bwa_wd);
>  	}
>  
> +	if (CAN_MERGE_FEAT(parent, child, mpam_feat_mbw_max, alias)) {
> +		parent->mbw_max_lim = child->mbw_max_lim;
> +		if (mpam_has_feature(mpam_feat_mbw_max_hardlim_rw, child))
> +			mpam_set_feature(mpam_feat_mbw_max_hardlim_rw, parent);
> +		else
> +			mpam_clear_feature(mpam_feat_mbw_max_hardlim_rw, parent);
> +	} else if (MISMATCHED_FEAT(parent, child, mpam_feat_mbw_max,
> +				   mbw_max_lim, alias)) {
> +		pr_debug("%s mbw_max_lim mismatch, clearing mbw_max\n", __func__);
> +		mpam_clear_feature(mpam_feat_mbw_max, parent);
> +		parent->mbw_max_lim = 0;
> +		mpam_props_sync_mbw_max_hardlim_rw(parent);

Hi Fenghua,

For alias=True, the existing bitmap_or() at the end of __props_mismatch() appears
to undo this rejection by copying the child's feature bits back into parent.

With both inputs advertising MBW_MAX and having matching bwa_wd, a small harness
using the actual merge functions produced:

  parent.MAX_LIM  child.MAX_LIM  resulting mbw_max  hardlim_rw
         0              1                1             0
         1              0                1             1

The resulting mbw_max_lim is 0 in both cases, thus the same pair of capabilities produces
different writable-HARDLIM support depending on merge order, and MBW_MAX remains enabled
despite the mismatch.

Rerunning mpam_props_sync_mbw_max_hardlim_rw() after the OR would not preserve the
rejection, mbw_max has been restored and mbw_max_lim was reset to 0, which means soft+hard
support.

Best regards,
Richard Cheng.

> +	}
> +
>  	if (alias && !mpam_has_cmax_wd_feature(parent) && mpam_has_cmax_wd_feature(child)) {
>  		parent->cmax_wd = child->cmax_wd;
>  	} else if (MISMATCHED_HELPER(parent, child, mpam_has_cmax_wd_feature,
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 1c9e0e8b78a9..6be32b2cb0ab 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -172,6 +172,7 @@ enum mpam_device_features {
>  	mpam_feat_mbw_part,
>  	mpam_feat_mbw_min,
>  	mpam_feat_mbw_max,
> +	mpam_feat_mbw_max_hardlim_rw,
>  	mpam_feat_mbw_prop,
>  	mpam_feat_intpri_part,
>  	mpam_feat_intpri_part_0_low,
> @@ -203,6 +204,11 @@ struct mpam_props {
>  	u16			dspri_wd;
>  	u16			num_csu_mon;
>  	u16			num_mbwu_mon;
> +	/*
> +	 * MPAMF_MBW_IDR.MAX_LIM [1:0] when mpam_feat_mbw_max; else 0.
> +	 * 0 = soft+hard, 1 = soft only, 2 = hard only, 3 = reserved.
> +	 */
> +	u8			mbw_max_lim;
>  
>  /*
>   * Kunit tests use memset() to set up feature combinations that should be
> @@ -585,6 +591,7 @@ static inline void mpam_resctrl_teardown_class(struct mpam_class *class) { }
>  
>  /* MPAMF_MBW_IDR - MPAM features memory bandwidth partitioning ID register */
>  #define MPAMF_MBW_IDR_BWA_WD		GENMASK(5, 0)
> +#define MPAMF_MBW_IDR_MAX_LIM		GENMASK(9, 8)
>  #define MPAMF_MBW_IDR_HAS_MIN		BIT(10)
>  #define MPAMF_MBW_IDR_HAS_MAX		BIT(11)
>  #define MPAMF_MBW_IDR_HAS_PBM		BIT(12)
> -- 
> 2.53.0
> 
