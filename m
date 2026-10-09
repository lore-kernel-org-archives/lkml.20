Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010015.outbound.protection.outlook.com [40.93.198.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F77A395D8C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791561603; cv=fail; b=jYLSIzoKey2fJ/atqM007T3NqXuAQA12vrxSONABS/PGA0rxYIW5pql9MS/5+fGnQr7sVc7E5Bw0nMyeD6tOAPDxavOt2pdj+fZVY8szge4kqpAjlK5n62teWr/LJSWekMrp6f2RMWYTQs3R8UN5fjO4YgfdHJWWP6kzRo2rVJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791561603; c=relaxed/simple;
	bh=jhDbuiefNrSu3r+3NuPCHeC88H3bKmdxl+KEeTdMs/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DHRDAqStsupLHmWdRvg7zXAQ3NOpGXgoSgY4G2KeJLpVnYyZ3onYOhwoWMM3j2uAyOWBPpWu5+rNEDNI39rfC0f/PTX67w1rtedADMUAuvdblSZQ9qpdo/zXDf6fsk9+PbYzIx4SNTgmVKbGhpmA7zoFzslyOpMB7Emb7MrMBao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VAhZtlLN; arc=fail smtp.client-ip=40.93.198.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VAhZtlLN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZO5Q9Vq/FfBHhavZoFYOavFrnm2Tjj+qzE7BkLDxjbmRmffgUh+bn/ODUS3vZpR2UhKUA3G/Hk4pbXSSUHGa44RWs0sxcLyu+0ZBPzjPKyS2qs3UzYPk6vGnVnyOSTeOMtRPxMSXbQdy/dSRUT5K30cUU8DaLPXdQFdWmX29YRfmrtqGGeXNZF/PgaXGq72jPtYvilHfi5zsgBCs7Foyo8ly4Y6vbDomsTllyqOgGzdQIn6hG0tQfQCNBvHNVHgMGHtnfErjGO6aJyeKtrx/vWx0dFRaTfHM5T3NWBKInUJRewMiYTtI8z6nJVzSHEiYUHoHhH444KyR5KQBFNXh0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECWA6iXMYwaHBnsvZRZyDvstqer4qfN2f2yCql7O9RQ=;
 b=LRVanpNNE023DjyOvhS204BNWBZ9pw6BQQqpuXHO69eauF9QrfZ0wnZBtBeH5wAu/BrKWO8XY9VGvJLNrTy+WV/CcdBt6PuU12UgqnO+Yt4fk4E+Gg3DOT1PPsIcjS0VrDvHB6O/sQjhEnzw5IA0tXt4XWbFkAqO30gaJWsttRR1nNrb3MYYFv36iqduGL9iJa70shLQslzf5ncUnQYvT2DE9Wb8H9II6E+GRRFrlAcFFBFlxRrEs+L8p6X+oKxurlz0w1dT40z0HGPkV7/Pw1vr2VUBsyMpi03mkAEeTdstyfxohqs/lAC3xZfebes+CZZ+rjHTVHR79wk/7JCZ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECWA6iXMYwaHBnsvZRZyDvstqer4qfN2f2yCql7O9RQ=;
 b=VAhZtlLNXQ7gwsw/EOfDBaF+umEFqib4xtxHUD7Udlm9v8Klz8TIGk6pjJ8WZ0Va1zNB/tfNfybp/KdRG1rQkoJZfuDad4xB7heVVDW1/7rgLjgYpDDQHzPTTQ/oF2a1xLianBr0gJIfJsUOG08YD8ApTSHvjbib5FeP7gxUj80=
Received: from BN9PR03CA0760.namprd03.prod.outlook.com (2603:10b6:408:13a::15)
 by CH2PR12MB4183.namprd12.prod.outlook.com (2603:10b6:610:7a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 15:59:56 +0000
Received: from BN1PEPF00018546.namprd05.prod.outlook.com
 (2603:10b6:408:13a:cafe::4a) by BN9PR03CA0760.outlook.office365.com
 (2603:10b6:408:13a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 15:59:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00018546.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 15:59:56 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 9 Oct
 2026 10:59:51 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 9 Oct
 2026 10:59:51 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 9 Oct 2026 10:59:50 -0500
Message-ID: <694d6976-4b2b-650b-ffe1-77f5f3cdd65d@amd.com>
Date: Fri, 9 Oct 2026 08:59:55 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/amdxdna: Fix Kconfig invalid configuration
Content-Language: en-US
To: "Liam R. Howlett" <liam@infradead.org>, Mario Limonciello
	<superm1@kernel.org>
CC: Min Ma <mamin506@gmail.com>, Oded Gabbay <ogabbay@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20261009011010.3521631-1-liam@infradead.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20261009011010.3521631-1-liam@infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018546:EE_|CH2PR12MB4183:EE_
X-MS-Office365-Filtering-Correlation-Id: 54fcaf28-8b76-4b90-e63b-08df261e5d12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|56012099006|11063799006|22082099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	iwQzBCr9j3SukchOdMiZS6vNsFtgvm8tlIsBOHzvATL4NY0liS/oUNorqfb8vebYKebJ+x1dVS7Job0fUjm6JSGOo0cAiBIKMt0BCKp5krEB8CaZITTwfvvHk9RxCz03YRpRNby5wQlT/UpJ6d9fWEf7V3xqsinXhSfhXQnNdAK+gK5LyGgrL5AnAr9bJTl3xqkbSjKikoTLWY7wVsHlEuR+NMRX7BwrUZr8bTYAnm26CwuRB3AEZitEpIslKOMXNZRy/26iBhDFaZxd/Lyv7OSqZOaZW3/meb7upwsk7+rvBTXfj/dzRQrvvPR2Nq/wKlBqeG25rkLW37hAtMijc5Ad+efEVP04J6oCnO+RJwIkrN+oWmlyNUok+ct+55sDPp+Lwcyr2ciWpRt0RWQGR5lCu52/6bDIosPhy0q2wtsQ4wgNGnus1QraSAYh0yjW0cPFOpSg1BzLePQ9n17cF0OgOzYypokGXBdRfE4DtXZLExXm+rgTNuZbacfhbo//j7nbCZDWYDunKZX4HD/lFa29XGGrwoSeX9ATDXe5iTv8DaCMawDGsMSa0ilmCTEDP5UfY3NWz2MsADbQbK9g1MAHrZrR8JjRlxSYmj4PvJU9gQn74wgzJ2sfT09awGrsius/fXgHWOf4liRYMnNFSni4rZmN3l0s0uilIOxRnQCdoN9K80IZwmUQphSuphcgYBxtu6KmKdDR41/L9fBdQg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(56012099006)(11063799006)(22082099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iYql8LhCwolAoVuxg0Y6+T5hOBnTjYsTBI2xen7uaRdiL+WitWmjtc5kcSvPe3e0j0fFwsIov+ZWpfMBsOeF0Tl5KVaTxRU2MlRH1UyPdiPX8kWjvoRofOuKYJzRYabhluG4YjNqPWX1Vn3Qp/D6uAWycEIvjB6tdZneZURk19kYVZ96g1ec6hiaW1eQszuhHXm/HHz3W4xyjBrEbOcDqKDD6cPBY8kgjMYZgbQXOTtgVERdkAgz0oECUng6xfjKm4eAuVd6KoKmYzdYHyNzQII5N4KSER+kUqWD0jrWbs6Ip1a7wJ/RmcKtsH9R5jItk8PTxGGpAu+s8C12NpmXoSsHFxVJzLdkeO3j5AAZx90AFqHMyT1Y9hbPx96CvJwLndbOca8LELzDqHgxS6tKJvPv6uhcmIJX8XbPbRhC/XEKwd/C3Y4GjJf7EGa1mdjW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 15:59:56.1759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54fcaf28-8b76-4b90-e63b-08df261e5d12
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018546.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4183


On 10/8/26 18:10, Liam R. Howlett wrote:
> The amdxdna has a soft dependency on the amd_pmf module.  It will use an
> exported function if it is available and fall back to another function
> if it is not enabled.
>
> amdxdna and amd_pmf are tridstate modules supporting both built [y] and
> modularized [m] in the .config file.  Since the amdxdna decides to use
> the amd_pmf if it is either a module or built in (see
> drivers/accel/amdxdna/aie2_pci.h), then there is an issue if they are
> not compiled either both as modules or both as built-in.
>
> Adding the optional dependency to Kconfig does not allow the
> configuration from being selected.
>
> Fixes: f66d6cc6891e4 ("accel/amdxdna: Support sensors for column utilization")
> Signed-off-by: Liam R. Howlett <liam@infradead.org>
> ---
>   drivers/accel/amdxdna/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/accel/amdxdna/Kconfig b/drivers/accel/amdxdna/Kconfig
> index f39d7a87296cd..eddff490b4f75 100644
> --- a/drivers/accel/amdxdna/Kconfig
> +++ b/drivers/accel/amdxdna/Kconfig
> @@ -6,6 +6,7 @@ config DRM_ACCEL_AMDXDNA
>   	depends on DRM_ACCEL
>   	depends on PCI && HAS_IOMEM
>   	depends on X86_64
> +	depends on AMD_PMF || !AMD_PMF
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>   	select DRM_SCHED
>   	select DRM_GEM_SHMEM_HELPER
>   	select FW_LOADER
