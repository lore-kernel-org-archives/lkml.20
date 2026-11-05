Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793919922;
	b=nFJYyLtXj4kDFW5kYSV07EGzWB4x3030LZpMGevnYrrI2m8pg8kzm6lwuwsjKCnR9cSn
	 V4Yv2PJFIEALAai3bNu5wi2Qm6PI6XX6YK/3cKhwJf5JyHN0FCyRyZcuIHklVML7X0IoL
	 7w0dy4yV3fz/dzVVPBrNEIK4Xvtz4GWstdj9eKqzjQiw6uVCQhqQNXmGEV+9A0VrQSKag
	 LXF/zYpNBuvz72V8YHzFBjj9TyZD2m4d9uTHZ9m40pOfDfGu1vVJT3rzyyTKJT1jpXd4g
	 8GYXhuyOmmcvW35KO5r33L0wuSNzrfyLYxTDZleoovCa/GkQnc3kSVxBZxyFq6C2oXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793919922;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:Date:From:To:CC:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-NV-OnPremToCloud:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=7fxv+Mgc4jzx/ARU/ADxbdsbHp6BAtARa07JZS/UXRc=;
	b=LoO340XrbyOxIVihqj8BhgNYwfAWSjKKKf/GPGVYkqJF4gmHKK5ILzgaQNPCySstRk/q
	 VhOF1jyYzmvvoPcolXoju4AU+vLot15zVLFl+M86IygAMjntCZjmJftFHSQcTLiejFiwq
	 YoG8KtevAQlXvROywQASryu0aGlAgW0xyNUAlxeHWeuoxrqi9q9qFTyuLFZp+A0FQTqNM
	 bdeOQ5yl4EU6sQ4BE4QgBfTomLwpUsj61mC/tNw85Nte+zTK3Ouu5cGneZdgHfCEdixkS
	 njvpLJzVca1yP4+kgEY4iDyrx+AxFwe+gJJZiQoKu7KJCMmZXhxecfYlMB6kM8abJEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=k8rEVzNX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.59
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011059.outbound.protection.outlook.com [52.101.57.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5926606A33E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5926606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=k8rEVzNX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjKxUpK8/Mj9fIczcbipIPoVdJzCRXdOHR5XUdSMEpXxSFeXu1uMFphE/5dlBY8MmWuhKK+APbZSzQ5tJTy4DM+88bt2v7zWJa682mXXRSv4m8KW0OnCfs9hJ9UKSbIt/Uh7KUNdKulb/0wGJAaXZ2ysW19XJF3qZeNCfqSxeIbxpdXd0F7R7hS1GUAZipxFw4WEKDLadAXwbKJgWyMFmcuGquCog3tXcVxy6x3Vnke+C2Z8HZt7CK+uA8ofu/vA0oBQ/ql4lFBcH6Qg4L5F6uwaG3L02kyR6gxJcE+/ifpbap4OVYRDl39+Bm/yx0K2EE1t321MsVVYtMZ1PunHfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fxv+Mgc4jzx/ARU/ADxbdsbHp6BAtARa07JZS/UXRc=;
 b=CfEaUbICV0NszAGkS5PxqDt4JvcNCFlqWVZsPzUmIDieCKbB+8OmkfHn5Cph6qbTNdjHTDfYhsFl2WpgjyTE0KcGLIZ4wGjSBL47Ym4a3yFOLjQueHO4KZEY11LLpJWtqiZbbpJT9eEsxmF/f+Vzkxa0u7fupSG1dI0vSHIs5hNVDZgrWS78e5vMoyhjStbRXHKBs9/TvfSqXLZxJ5dRZbnNHz+8brptjYi6mdppMO2eKZ3b13H3Iyol3xZ/ihAyo1Vfi0e1cpH5Jmm/+cSuvBcRip8ADq+XhyUTmSySAhGyWTUl5w4MmCnZYN9/CftwalHyqBnghTY7j9CIZCkCVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fxv+Mgc4jzx/ARU/ADxbdsbHp6BAtARa07JZS/UXRc=;
 b=k8rEVzNXtnitzzpEXJttbzPIvJ2/gtHB5U4r/vTpWQJK9zQDDJ9hFDDN87jgqbDGFhfBPwEHUbgEtsw3dREVZ0/i1b3RB/TDjre86yGdU9fo00+lqXU4ZNsztbA8CT2vp5ATIbnuxDqf6NzIXcLojoGOfzJvKI1jQgQq5BJYFjRYysg8ZjPjT5EgmnI9vU3xb8nn6bP5DpLMeQxS1lpS877z+KuGHfOd7dSxbxE6ukmkOVzJHm119XXt1RK8BkLr5x0uJaXzVGDww0JB823bz8jUB5kHDHxe11u0gnCM/0Tjogd6Lev5H4vf4GFA1TxIGyL1e1hgp/z3DV8i77SUyw==
Received: from PH8PR07CA0037.namprd07.prod.outlook.com (2603:10b6:510:2cf::17)
 by LV2PR12MB999096.namprd12.prod.outlook.com (2603:10b6:408:353::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 23:05:17 +0000
Received: from PH5PEPF0000002B.namprd04.prod.outlook.com
 (2603:10b6:510:2cf:cafe::17) by PH8PR07CA0037.outlook.office365.com
 (2603:10b6:510:2cf::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 23:05:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 PH5PEPF0000002B.mail.protection.outlook.com (10.167.243.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 23:05:16 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 15:05:00 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 15:04:59 -0800
Received: from nvidia.com (10.127.8.13) by mail.nvidia.com (10.129.68.8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Thu, 5 Nov 2026 15:04:55 -0800
Date: Thu, 5 Nov 2026 15:04:52 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Mostafa Saleh <smostafa@google.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kvmarm@lists.linux.dev>, <iommu@lists.linux.dev>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <maz@kernel.org>, <oliver.upton@linux.dev>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<joro@8bytes.org>, <jgg@ziepe.ca>, <mark.rutland@arm.com>,
	<qperret@google.com>, <tabba@google.com>, <vdonnefort@google.com>
Subject: Re: [PATCH v9 13/25] iommu/arm-smmu-v3-kvm: Add MMIO emulation
Message-ID: <au0LlPl2xwJvtfCu@nvidia.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-14-smostafa@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261015200903.2735565-14-smostafa@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH5PEPF0000002B:EE_|LV2PR12MB999096:EE_
X-MS-Office365-Filtering-Correlation-Id: 578f56c2-5365-403d-cac9-08df3b9141bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|7416014|1800799024|22082099003|10067099003|18002099003|4143699003|11063799006|56012099006|261009223027099003|261021135927099003;
X-Microsoft-Antispam-Message-Info:
	J3BJQwZXmp3qLORK6ij2/p4udviYzYAFoaCnW0vlNys0Apwa//s1XqDXHyOZdTDb1L+I675T1La1FRwz8B2+pYoo6SsevFRNleKlFFQCGVjmLIXqbHNevQ7SjbLo5uOn7YDjdT7CdsOlpAJ98zUGzqPBSpvbAo9j34GIO0UDZanmN4HSxLfn2/gC0kgMoe8Ewk0TaURqgE/cA/5jwm73TZlZPcFgzMSL9j7/53A60tEQ3nEH419lKmOt4aqeGFKv3mO5U0Ql7RvjNOZrufg7TCQ1Ne6lXIofzCruUj5kLPeY2Sq81talY/119J/YDQJ60/gJhvyVec4ZFlOptAlmo5EFxSM2Ig/TSqJ7UmJegSjxG48deMO/m69j4AK8otz5g/yjCOUVKvILFL5UoJn0BSzhPukfK6JgwUTqFBq28eYVmaW6MBEdfwnV8kmMbGVWOS4TZOfVuNzG+INFRqVRXsAbr3vEQ+xC8C7ELTVm1jvypKL4dwoGMBI0C37jAWHgxUfpcHgqseTpFWFZUcbLa/exxlseJf3KgkxbtBu1CSiK89HUUjmKdKMNJwXvjJjCs0sGqRbMG1VDc4teSAHvFqjNvUlpRNqu1TW/Jo/u+aJDpep0wy6r/Nrx2KZmaOukPdDt4Epg2EngEo8q56FRvKtEta+z7wRcYday17jB/QuwA7s58KxfZuiS4UOm24qyeROhdQxyZeHSL9rTUaSNtg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(7416014)(1800799024)(22082099003)(10067099003)(18002099003)(4143699003)(11063799006)(56012099006)(261009223027099003)(261021135927099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2mJn4icKzoiLt2T4GtEcX0V8ojcj8D2xg8OOYkV6kEVxNk7mk5n1vCChONov3rjYKQ9p6+ZskSwDdX2Z7ddeakJaFQRvDZxuuqhsp80PY1XaIEXN+DOTaPL2c7bl08dva2A0ouavso+Xqy22icQq+oPrheli2lqaej19wEjyUUv8uYLyut29hhHTFTYZHjaOKt4THDLJOsmBnlxE/3QDzbveaEeC5eYGRbuivywQyHasHpxlj0FlCiJMK+qH+Wf8VizmC5aR2sHYuFpmqm/B8gjTqkwbEtucgETuzJCOHYWASDY/pHfnp99San0CrjeMYzpE9ufQo+o6xrOfTsA1y+yai2ofpE6xc5VsPCWwL8hjHIHEZVQn3xewWQFKEdA2ZmZGVWWWRkZIVSBG3f+GVmxp14RAJZhv6C4/CcstpbbfP3ufdTOHotzw4ZxKbckD
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 23:05:16.8059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 578f56c2-5365-403d-cac9-08df3b9141bb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH5PEPF0000002B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB999096

On Thu, Oct 15, 2026 at 08:08:44PM +0000, Mostafa Saleh wrote:
> +static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
> +			     struct user_pt_regs *regs,
> +			     u64 esr, u32 off)
> +{
> +	bool is_write = esr & ESR_ELx_WNR;
> +	unsigned int len = BIT((esr & ESR_ELx_SAS) >> ESR_ELx_SAS_SHIFT);
> +	int rd = (esr & ESR_ELx_SRT_MASK) >> ESR_ELx_SRT_SHIFT;
> +	const u64 read_write = -1ULL;
> +	const u64 no_access = 0;
> +	u64 mask = no_access;
> +	const u64 read_only = is_write ? no_access : read_write;
> +	bool is_xzr = (rd == 31);
> +	u64 val = is_xzr ? 0 : regs->regs[rd];
> +
> +	switch (off) {
> +	case ARM_SMMU_IDR0:
> +		if (len != sizeof(u32))
> +			break;

Maybe add a small helper to list all 64-bit registers:

static unsigned int smmu_reg_width(u32 off)
{
        switch (off) {
        case ARM_SMMU_CMDQ_BASE:
        case ARM_SMMU_STRTAB_BASE:
        case ARM_SMMU_EVTQ_BASE:
        case ARM_SMMU_PRIQ_BASE:
        case ARM_SMMU_EVTQ_IRQ_CFG0:
        case ARM_SMMU_PRIQ_IRQ_CFG0:
        case ARM_SMMU_GERROR_IRQ_CFG0:
                return sizeof(u64);
        default:
                return sizeof(u32);
        }
}

Then it'd be tighter by testing the width once, prior to switch (off)?

> +	/* Allowed RO 32 bit registers. */
> +	case ARM_SMMU_IIDR:
> +	case ARM_SMMU_IDR5:
> +	case ARM_SMMU_IDR3:
> +	case ARM_SMMU_IDR1:
> +	case ARM_SMMU_IRQ_CTRLACK:
> +	case ARM_SMMU_GERROR:
> +		if (len != sizeof(u32))
> +			break;
> +		mask = read_only;
> +		break;
> +	}
> +
> +	if (WARN_ON(!mask))
> +		goto out_ret;

Your cover letter mentions "WARNs are fatal in the hypervisor".

Is this WARN_ON fatal?

Nicolin
