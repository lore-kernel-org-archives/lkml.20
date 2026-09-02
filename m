Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013008.outbound.protection.outlook.com [40.93.201.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9B4386C0A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788374932; cv=fail; b=ir5a60nyw8x45vfImKZY6XLgK3BZ/XngUTJVnLiFnMKwLfI1/x2l6AI7pI4oFnr+zaQNJx2hhmDEvAqV7BnsJWOJOqcBDtg/VDZNy6Otwy4nlPvRpSWkk6y55+kIZ77I3Rzc+dIaEWPhBo1ChoqpJMHrFBPajqBy3BKVEx6vvD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788374932; c=relaxed/simple;
	bh=a3H0PGdgXul2lLqsvBorhePIh9LAm+3KeDQmk3r2UMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RF5PjSAv7Lg+fKgXoNVtQ2lySQld0qev29A2vk5FntbL28MiL9MkrrYCpDu8e2ZmUqRnTFFRSJb/SMQzSPP82LRAliMLy+4k/LNnxGwnifak/HgN0S6Qs+MWIqP3tJDQt9E+DciAhAiXoIASn4a0WAH59FK7SAhtJ0dIm1SxfLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kbD2Ojj8; arc=fail smtp.client-ip=40.93.201.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kbD2Ojj8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mn34NBgvRVmbA5ZwaYTStpy0DIYyEuhvW/Vz6t86wYPa7DvvAsh8+EVRZoPi16TqhRWa2mG7JreiDaED1M20p5t7864v523WdyC0T1kIEKM/VPAYkCW6ux4ipdBfLB60xGWQn14oku3Kzq1mdZHa/1S6gBqk8tG1mfmODQMWcSREekBBsTd7DsLAtSiDyd2FSaoF7WDpPiajZu/3q3Cg/Kd3G+YBDEiBEzUpNwNFET+4UmOJcF4TfZ1eN/JsKkRGROHAP57pFJIpZlLwYrWRCXQf4knxEdQT12GMPlerSSzj6QYAkB6RpH6Y1BCa93RrHoio5i0qLQ8aJRjeFi8QWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=826hHmb600icKHZgtQurBB5kdBuQtJeN9ntTVYP7SGA=;
 b=Wa0p4rGYyhiiVZclzsdwxIvbJbnSZFPoolr3T1ifz+edi8/+SY+oe297m2gLBaPulPNkVN31EJycTnvIFTQQowVah00KrZus21mr7D7Xt7gj0YS3j6puPJLW8mChd75C9LaL1gHOR46TEoT99tOZAp39zv/iBJSnkl+lAT1sGn6AS8TxFdKaghnPPOKfc8lQJ3tH9dODJs1hUfXj4RKvTW5bD/6SaT8cf6SxTCtuctM1odawstu3/EoMhlFNx7W4hw0CMJI5vdgEWtLQhVj7p7MXIztGBjn2ZKve+kJ4fnxG4e+lKKLvw+b6a82PnbWlHyDrmLzfq3qip+/21t4B3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=826hHmb600icKHZgtQurBB5kdBuQtJeN9ntTVYP7SGA=;
 b=kbD2Ojj8jiF3f/SnYE0KesIHGHxKuXXFcZ5NLYE3NBUefn/F02vumOO9XA7ADauJxYxhjHaYI2DGUuDo0jWoTinVBKd9Nkz+2wOWVxn6JkRA2IUZMAmIBe1cRN6hBSVgak385P25d9BlPb2n1X3U5jBdi2YgS505rgCqXJe4whg=
Received: from SA9PR03CA0019.namprd03.prod.outlook.com (2603:10b6:806:20::24)
 by DSWPR12MB999151.namprd12.prod.outlook.com (2603:10b6:8:36b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 18:48:45 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:20:cafe::19) by SA9PR03CA0019.outlook.office365.com
 (2603:10b6:806:20::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 18:48:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 18:48:44 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 13:48:44 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 13:48:44 -0500
Received: from [172.19.68.62] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 2 Sep 2026 13:48:43 -0500
Message-ID: <8a526163-0762-4be4-a827-b2c11fef5959@amd.com>
Date: Wed, 2 Sep 2026 11:48:43 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/2] accel/amdxdna: Disable BO import via flink
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
	<quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
	<mario.limonciello@amd.com>, <karol.wachowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <sonal.santan@amd.com>
References: <20260902180955.3999242-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Max Zhen <max.zhen@amd.com>
In-Reply-To: <20260902180955.3999242-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|DSWPR12MB999151:EE_
X-MS-Office365-Filtering-Correlation-Id: c74f26b4-4cb4-41ba-b7e6-08df0922d0f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZdT0vBKnUAgxrZ7kRpt5HxMAM2H+X7bNMrxKIPRVrgK2vRzRY17LiTn/se6RNvUuSKvt2MUQaUhIGZuD8LXbACNkvdz1yO6u+PAX4O+M7ZeLICwAUHAmururUsYnLJJ5lk612jFGFmdZCA55gUUgi/XFOs/c0mIryCrHX+WKXC8m8VV7kVwGkO9poM4c5JaQEOEzYphOT+FDyOq9lYS7TMdz/Amk8CDiN4+TwAc690SomESkRDPy91KsOFpMtHUr+p0SOdMHPXTMz5O4B1kSqkkqgVdw7zE4nF5Iiup/teDnq5r5+wAHDd5406RknJwk+efX7e+ntbXa4C8NnbCyiZco4JqM+kVDLxojqfHxGCTReg5KNqfQOMpAEGP/VZUwrARq3hUfscdODGUaBCIfQwcsaxX1QiMjcHxvHwiecxO3Eh6Jh4s/upJRwSrozq1qCGCwcp+wvqNtgqAgJc28pEfs7qL7jlALPF+bt+zJ2v6puplHbifSJdfydw5ia/4wyjTBq2CAeg1u0oeUL/HThddWgFMb4zW6Xdv4Rogg4tbsHTgeeN1r2tskis/NFC8sxnA96DIq8MNpy3vxdhNTAF1vfpMb49tsvzGdGyA7tQ3bLN/U9BXHRE2ZJOy2gV7XtByeRZ5a3C56D3ReF5oD9g9zPrwPT0lJKy16MSnT3N1Vvx4zC9hjt5t4CipsYJml1FeSzJXmvcqUnDr7iDnmpQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jnHbT5TfEX4Q2H1R0w9EHn93nfSTuRHmf5M3Op91quI5ZG0zrEHacRy2HlrJAlTu4kRRRCzH6J3agBtvu+bfes4HBM/teVrtQJRlLdeCD9UNEyPOuvItM9w8TEk23uaPlHhwcEDdQ9pkby0Zapu8G4qBHYM0gignxYsa4yXNUhm4uHDqPAYTAO3IOHpWKuFCdlM2BOF9euGSFc4SludPxkebDheupKRJTUC6HQEiFTn+AHKP9MIifhATbUrh3Utn9sFdlwQVodwHXT1pR6IFwdu+FbIYhFfCmODLjW5YSg4uFJ89MdoadVDyD4qsUQb45Kn1XmUH182ZCICdJlAfH3eNIPvPO5W4l0Rc+5F0MwRWLONBWqrCKqIypGptKZgWaGTScTOORxxYPgKNVexOQLbdrTKasDT1dy4nXLgLjnCf8LAgJeuguPj6qgmxZU3T
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 18:48:44.8602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c74f26b4-4cb4-41ba-b7e6-08df0922d0f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR12MB999151



On 9/2/2026 Wed 11:09, Lizhi Hou wrote:
> Accessing abo->client in amdxdna_gem_del_bo_usage() may result in a
> use-after-free when the BO is imported via flink.
> 
> Disable flink import by verifing that filp->driver_priv matches the client
> stored in abo->client before accessing the client.
> 
> Fixes: 3cc5d7a59519 ("accel/amdxdna: Add carveout memory support for non-IOMMU systems")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Max Zhen <max.zhen@amd.com>
> ---
>   drivers/accel/amdxdna/amdxdna_gem.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
> index 476649685e5a..1353393194e2 100644
> --- a/drivers/accel/amdxdna/amdxdna_gem.c
> +++ b/drivers/accel/amdxdna/amdxdna_gem.c
> @@ -697,6 +697,8 @@ static int amdxdna_gem_obj_open(struct drm_gem_object *gobj, struct drm_file *fi
>   	int ret;
>   
>   	guard(mutex)(&abo->lock);
> +	if (abo->open_ref > 0 && filp->driver_priv != abo->client)
> +		return -EPERM;
>   	abo->open_ref++;
>   	if (abo->open_ref > 1)
>   		return 0;

