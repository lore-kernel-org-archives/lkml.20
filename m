Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792682232;
	b=TDnRwlRQoYJkjaJtHXwlf1Uskslmu1IP6b6SB50EPS5sMPJHEmTpDnSSkp/ACZEXpFpj
	 4z/kT+tYHRYm9pCwlgsGwHiT4GMvhshgIvUHlrLwi/SZoVTqSXcYrkS87TCH61J1owGID
	 XzzDAn/q8FIU9tHZ+K7vVGGP3n5SeLcUyMfra+isx544evWgMSu2w1TcCVJFSFGozWvDb
	 yWmZjp+VKmgYhADAPa7IndjT3TbzXfQucs98jWRXu8I8VhyAzwmVnzZlXBLk2xGt62REh
	 Eu4Z/H+CbXCW0fFwMbq665F7u4uC+aanaQACHx7pIjsaTFEujRMMc3ab4xYvUbsbicw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682232;
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
	bh=hFyjH5udDsCFMVA9B2u0GU1pNv6rtr2KfKuliDBI+1w=;
	b=5GRcjulCXbKHqrlXG2BrHV6OO4PRiesnaqCcypfvqQ2TAZZcLeOTGUVaElV1qUugXZp9
	 gC1459X9t5ggv2//bGWR2elsCJP/+lOX2BK+/W9zznWFGB0+rRusywgNuwcyiVhENK6bf
	 M/FfL8JIXcN3F1Jrl958pgNKm3XV9xINU8dSMXmbxRykanw+YiB5i+LpYdV8V7PukxxSB
	 o1Q4n3nqtmUGF0/OJZoKkZLc5+e+ROzii3UWBdK9swDZUkaPEgZC3r/iwqgw02ys7Ciwb
	 sFGdpqfd6ukTxRShDXfK8UC/p6tGhgdpsUMu4gcdDemgdEx1TgN9ay4cblUUxlPi7xg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hF9TVGhW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.27
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012027.outbound.protection.outlook.com [52.101.43.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98862606BE53
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98862606BE53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hF9TVGhW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOp3SIDueNLjVHkBypOpiR9k67DC0RfeSH2UwgKspSrxMg6kSYD2EILIE0aadsBPG8qreO/cU4cqzwThYQuXtcO+39JZxEas8P6Zfs455CRSNRVzD53XlUPqJ1uk1H6QmlZ7C3l1a/L7YrA/UwRsNCaMnNVaZ6oAJ6gjZ4EzwJQnSqXRZfiSbXSpHQgdUmrzQSYhcrpVNgmLplczKKpS9gXFSECN4QbaXjPJ+1kFPQ1dydA4dvVLs4maoRerW42YJ43fBGekSokOg0oBzh3WdoNxDOGm0PiI7SItQYmsRMx1rVwXvZfophGZZNQA3MIOPVWqobPzTG8p0klwW04c/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFyjH5udDsCFMVA9B2u0GU1pNv6rtr2KfKuliDBI+1w=;
 b=M+ZB/TJ5zdPzG+3nUoOthbL8d5kpCcJVDdhzy/oLK7V3lX+t683DSG+zS93MwfWqBGZWvDbFcaib5y3GkTDiThFrxOPE75b+wsUUhvvtub8mQyWGsduVXPYF7KwPn91ndy3yJ6GKNzJpH9Y4q5jokfcEDfYVPOZePJ0RifdEytSFW5nDoXN1kYJwMfR+/RRfJnbp/V4nNVCvltj8atXsMsgqLJVFnmJeONCp/ZMvjYm9ed25CSkcs0qTKqZhPvA6lrKyJBMCAM+ddWiZIwO0e0ujCmI5mum2s3lmRhvJdXPH8b1ILNNZ2oFcJWX8E6Tll/QgPYp13QKfFezJfLQA2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFyjH5udDsCFMVA9B2u0GU1pNv6rtr2KfKuliDBI+1w=;
 b=hF9TVGhWJuzKSoDxq0+R2XZViVtxOBzCMUjN5yUDKutv1SuY+kAbmynoOT7vQ35g34fHnsqrjDdbe27xPmxBxhRAmeeIOy8VPrcBRqnMPDxnR0eiGUEapLKOxfIhbXw5xRoB9E+3QDxfT5p89SBQ2tfuWRIGKXokFAOUzxFuDtbdBozx0DCXu8gU1aqbRwj12R8FH9BJpWgqKpqRLCprK7aR72G9EiFSIacUXr8M6faUMV3lPm1gkCLLZ1ss/pdMj8v9PWvva2spricIcjjQUW+wVD9E3kFqOw+wLZIkPUTJC+2om38qRQPEssJ/kkHJ3xk+Cdh+wbEZe8lLOqlmrA==
Received: from CY5PR19CA0132.namprd19.prod.outlook.com (2603:10b6:930:64::29)
 by CYYPR12MB8924.namprd12.prod.outlook.com (2603:10b6:930:bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 15:16:54 +0000
Received: from CY8PEPF00000054.namprd05.prod.outlook.com
 (2603:10b6:930:64:cafe::b) by CY5PR19CA0132.outlook.office365.com
 (2603:10b6:930:64::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.17 via Frontend Transport; Thu,
 22 Oct 2026 15:16:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.233) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY8PEPF00000054.mail.protection.outlook.com (10.167.247.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 15:16:53 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 22 Oct
 2026 08:16:34 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 22 Oct 2026 08:16:34 -0700
Received: from nvidia.com (10.127.8.13) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Thu, 22 Oct 2026 08:16:33 -0700
Date: Thu, 22 Oct 2026 08:16:31 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: John Garry <john.garry@arm.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@nvidia.com>, <praan@google.com>, <kevin.tian@intel.com>,
	<smostafa@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>, <jamien@nvidia.com>,
	<kas@kernel.org>, Cristian Prundeanu <cpru@amazon.com>, Breno Leitao
	<leitao@kernel.org>
Subject: Re: [PATCH v11 06/11] iommu/arm-smmu-v3: Add
 ARM_SMMU_OPT_KDUMP_ADOPT for kdump kernel
Message-ID: <atooz/RMwQk7DA8w@nvidia.com>
References: <cover.1791226953.git.nicolinc@nvidia.com>
 <ee4257b62324aa75d7140f1f4a49aa0f78586fff.1791226953.git.nicolinc@nvidia.com>
 <9f500b81-792f-47b9-a8a9-1415ff11b699@arm.com>
 <atj7XTdjC0CIVDQY@nvidia.com>
 <ab304d36-c655-4a3b-b1ab-e4b7292bfd24@arm.com>
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
In-Reply-To: <ab304d36-c655-4a3b-b1ab-e4b7292bfd24@arm.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF00000054:EE_|CYYPR12MB8924:EE_
X-MS-Office365-Filtering-Correlation-Id: b3c048e6-f1b0-4ba3-1ef6-08df304f80fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|7416014|1800799024|376014|82310400026|261009223027099003|10067099003|56012099006|261021121427099003|6133799003|261021135927099003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	W02mNymj5Et1qgAaObTBkyl4PvmwqTDzY3GoRg/dZjqekZkw/tB6xh+IUA595pmZgkCd3F5xz0QI5gTd7mdJ6RHKzn93gdarut7SntlQIhLNgXTKYn6y9HRRmfMIcgQM2vqmPLu4VXtfXuLPHNnRN2PKo7Gi6uIm/qtN4cpnQb7dYUNewAriVxGZsEjaDMezxwTayFtgfyqWO/nNmUS/897OZLoS/H0EYCSX5f0SYeXcjs/o7IBCchmGlJKNhgEeu7wvZ/HZGoiwvyW20WH3hlngU54SuLCrPhFsCnOQlHLgnKoGUs2sEL0MqLjnYdzsH4Gj8jUpEtmTtkaYZ/XjPwpS87ru4A9hjlVL5GrgVfvwXxHcmNBG2FmJkCHFbWwqYXm1X9ltoDSxGNf54oz9NRwQfnS9J3Idziew5YiSYwMVp6LaV96yXgPz+UcwmvMDrgdNFofEc0XfRFb7Rg8Wbl7fXUU/ZeSxVyAsdGt5a7o4nFjgYv15RX8N6U0Mvl38/CWo3bH2XAKS3xfRXhxiF+G7oUJaxe5x+TANeQfe1vzesi/DIxjJ5qTcpcnh6ccLFevvdMePe3mAREemLiA+UMvublsEorFrhpy4XG6AL7ygpXrbIJg9V3Fxp/OiCCyktPXynlJlnMTw6KvRd8EpfCHgkQBm0WEtZPc+/9k3LBLaA0J+k04gApmY8GXte/Sk3csDkmQwOWlqFWog338EVg==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(1800799024)(376014)(82310400026)(261009223027099003)(10067099003)(56012099006)(261021121427099003)(6133799003)(261021135927099003)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	16+wD5SuW9fxKk3U9FvJ3N8dg5/rQHEkJq+pYvWiz7DA2SpQ0jLXHXcorNFpFkXAPWPi3EXMErnjEcZDehYRxUzmrJjYOI6R98k0bG8PhSnXI97oRsxJRNhCdFJYmgcn4Vyn+qjOm8+RTIUWJ4D53y1f9WAItajJv91/xT+ebz4G9J2Wc/QH+5WC+E4fhosi/OrHDf48zzR+ejW9lCOkoSPcTkUAAMuaggeppzY9mv4y75aWMOMEAfhb2Vloyv4EF/j+gfUWeInjFmsFd/iacWftVb1IvcAio5IDxd1QMyy6wmDcWHi1B/lyoe+m2MiZ4g6p5XkbZCl/vLg/BLprHcHfdviPL1damIwodpjSfJtlheNJhxD91BMOJgYJ6YLWIqseuW+g3I2UV/kn0vPy+q+pbEzSryCDb3NFh3W9SBGXuXVOExL0Tkv7Kz2BFnzW
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 15:16:53.2668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c048e6-f1b0-4ba3-1ef6-08df304f80fe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF00000054.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8924

On Thu, Oct 22, 2026 at 09:41:18AM +0100, John Garry wrote:
> BTW, on another point, nobody checks the specific error code returned value
> from arm_smmu_kdump_adopt_strtab(), so you can consider making it return a
> bool.

No.

Following Documentation/process/coding-style.rst,

16) Function return values and names

	If the name of a function is an action or an imperative command,
	the function should return an error-code integer.  If the name
	is a predicate, the function should return a "succeeded" boolean.

Thanks
Nicolin
