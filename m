Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792430071;
	b=BC2RLhrSSw8lBxydjSJ7OdwgFXxmmeMzcj6DFf43CzT/EiSneUiCB5z1XjcJ7R/dLztO
	 ZxJVALKNzpbnTV4+Sly1nG3acUBqvL3uNpzEWJCtZygg9antjyo0FYF4dFbDxpzuue7pE
	 SpzZ7dhji+3rWJOoA2uA3+mh9gV5Mz2foEGKAIw8HuX/LDg2YHPa/9uQ0WEwD3i6pXTUz
	 ePcRsz6V4MBJRqJRIEhzto9jpw2EEF+RrZL4APwgW7lEmeTqzCyscizlAhgeccGz4SXt8
	 UoXDZoS3SjjygKOO3YE4V4L98rSY55+znMsOweDrtM2qIm8NXHZ4Sr3zAXLr1EUFWfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792430071;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=u3ommDCL7KSppLkLUZySIYaoIUEPjNA6oi141WGTX2g=;
	b=Eb2mkivHkma18sO4pIKUoUsEFBdyDgdiatwbp28mxDo7adjq4jqkht47AvrA/L6f45iL
	 sFfxMGecVDaAu8sHxo1YPLjnxE1R8pgCPpxyFHnDViTw5QMuSGKgC2Z6RPwK0b3iCtWOQ
	 p9Pqs6oivGHozb3XhcQ6KkGHExX9xeH/x0d5D6TrXNY/rrKDtk1Sg+L1Wsx8NbTTox56z
	 x3eIKSdK51Uwbhqj6LanIrVJryJyOpdPuYe5RLWgvLGHv/Wjs2/aoikzC0zN01/n3dto2
	 MI/d3oB6fKhouPRBQjZmJAmISK+6YuJWGuBn/nUtLOxiIu5KgQk5U0V5Iu3tjptzpEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2IXd7Fr6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.60
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011060.outbound.protection.outlook.com [40.107.208.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1799F606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1799F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2IXd7Fr6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrWh8BeMIit0gtoef9pJMXflIGyCjM7xReXaYzekNecBNBMQAswRoWaBy14xUbKzKkHK/8e3uRuYX+wibhq+DMquLnY3ocUPuHjUxZX2f1fP3lYhNvWGczhY/uvKDEIQE3qc/am220J2kLWT1ZPtEl1fPN2PLC23whtiu0ES628IECcufYCc61GpNfKZHaD5B1ruNqpEqriADeXGCuT1L0a8bQHBKe8OslaM09dFgYc1vgMxT5ZTjYBZ0GjW7KDMOJ6+2EwoEWZ5tXIRN/CbVhcuJZ+tdxCo338IVlkixtb6YHgdpa3oB0jzzS1lAYC629iI0NB5yL7YxkxotYZa7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3ommDCL7KSppLkLUZySIYaoIUEPjNA6oi141WGTX2g=;
 b=UTQSkamCpQNf992PQSPgdsiClNaHm8YgipvRljfHrm+s/IyLMybiE6y2f4s/sMvg8ilH1Gf1spUqx6IodppsKHOs1qLsdkghrdgmcNe3MNFl/dLnq4+blgxjMqcycjiJJIuLij3ZqYuOEzQPXTW1mabFXqx3mwlKk56KM8HWfIgNXLZa537dScF/NGGL/sYS+JidxxFBZ8WFV79h1wIc+P2tFulhf8w26GrbvIB1ZMDEpHzUGEchO3rFI5BPxJ3GLsm0T3YMIaWPNCci91EWSDpDiaru7SQQFC9NdppojLNkcqjn/SD/TopHpnlKMGrXpb56bgjEm+4cAo2QW54IdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3ommDCL7KSppLkLUZySIYaoIUEPjNA6oi141WGTX2g=;
 b=2IXd7Fr6iAPmYpnQ1vuDl0YMQWIqBd0GgbMIg40FB3in9ikwbKnNp+c5erkUC5c5flnp7RDwUGSshHxLcXxlo2MMO5rjF23OKm+Wa+DLO0YCdrAN4BsThv9JBpuWDH6fA130cPKaRP6GoL5NunRJDFJ+V+A+GIExK3nXbCJow3M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL4PR12MB9505.namprd12.prod.outlook.com (2603:10b6:208:591::16)
 by CH0PR12MB8530.namprd12.prod.outlook.com (2603:10b6:610:188::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Mon, 19 Oct
 2026 17:14:27 +0000
Received: from BL4PR12MB9505.namprd12.prod.outlook.com
 ([fe80::73aa:eb8c:a86b:5a83]) by BL4PR12MB9505.namprd12.prod.outlook.com
 ([fe80::73aa:eb8c:a86b:5a83%5]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 17:14:27 +0000
Message-ID: <9eb8ccad-3919-4676-a3f7-6f7b2479d2ea@amd.com>
Date: Mon, 19 Oct 2026 22:44:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/24] iommu/amd: Pass iommu to device_flush_dte()
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, joro@8bytes.org,
 jgg@nvidia.com
Cc: yi.l.liu@intel.com, kevin.tian@intel.com, nicolinc@nvidia.com,
 jon.grimm@amd.com, santosh.shukla@amd.com, Sairaj.K@amd.com,
 jay.chen@amd.com, Ming.Shu@amd.com, SooJin.Tan@amd.com, chrisl@kernel.org,
 wvw@google.com, wnliu@google.com, dantuluris@google.com, kpsingh@google.com,
 alejandro.j.jimenez@oracle.com, joao.m.martins@oracle.com,
 guanghuifeng@linux.alibaba.com
References: <20260930092344.5616-1-suravee.suthikulpanit@amd.com>
 <20260930092344.5616-11-suravee.suthikulpanit@amd.com>
Content-Language: en-US
From: Vasant Hegde <vasant.hegde@amd.com>
In-Reply-To: <20260930092344.5616-11-suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0310.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::9) To BL4PR12MB9505.namprd12.prod.outlook.com
 (2603:10b6:208:591::16)
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
X-MS-TrafficTypeDiagnostic: BL4PR12MB9505:EE_|CH0PR12MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: 345da1ed-8b71-41ed-8b61-08df2e046e0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|56012099006|11063799006|4143699003|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nHLG8+e3oL2DRuo7hmDmBJieXpbcs72i8WhiwcASpTEE4iIFvQTp7xqu8NdxjyALgOA6gDwoaFEWysHsxkkl7oTre2MnU0mWyDhqHeP5ME3oJnOTYNT9J5o37DH7NQl8HF3EXzx1sbT3OR4wjMFAFM5im6LsCYCkD6n61i+j9+zBQxdeFmh84uSvIiLto7eeE9Bz1IvJvP5PO52SQZdrUPYis4OyhmgUdMrFHC3SP58W7DJJg0kTIgrSKozcQD8QQq6iGjXtvYoUo+u6KLpGDFI2tCItzLdXcQhdadF6IlGEJcZ+I+6ntdOUvzUSbDiQI26wS9Wb4cgIxaEPKWOK9xz0PYAHJSrY1q54a8621pYYRMTxjMCPOM9+MM3qkSoXTAn352U6WH+xW1BmDXJ9hTKlQZSvXe6xx3kYdn/y9gfpz5LfrDUQ12AfoIFLYipUUZrKj7Q/NDKcl36mNwYKV+9q5ed4G+PltCSkp46QWu/w4pl4HSi/k9ePJ0+rrysluFrqh0u2IiTRA//S77A75krZsyRiurn2mqqJ/yKc5MfQB8PJR6U4ptzV4DQ0x/ARyk8D7A0PQ8bpZiM/sLMpGnj0OeKcUrD+FcaJQh2Zke5xfmpVN2pIOwbQI8R2wzzWStKTDXsCz0QHCzWr4vVNve8wcQoCa+JmaZxxrQJFRWE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR12MB9505.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTNRY2I2VlY1N0NOUlF3SnF5RGNsV1AwVlJxZER2T05pbEcrVyt3VkZ4eFhG?=
 =?utf-8?B?dUxjMkZ2dEgvcGUySjRNemp4VUZLYURTeEpYVUlSNzBvK3hUUjlDQ0hoSXdL?=
 =?utf-8?B?KzQ4MmxzM2hjT291UVVscldpdWIxOVU4YUU4VXpqQWV0WGFXNmlpeTcyMGVV?=
 =?utf-8?B?VlJXamZCNEFBRU9TejN3ZjFHQXpoSDBlKzJjNWN6RjZURWwzMmc4WUFyL0lC?=
 =?utf-8?B?N1haK0xibkhCQjlEUTZSRndnTW9wWjJGWDgyam02QmxwK3ptTDNqSUVHR2pZ?=
 =?utf-8?B?SE5YNFcwNFgzZXM5eE5HeWFsMk1YVXppYmNqZ0xialA3bENmWDNaZTNSRkVH?=
 =?utf-8?B?eThPa0ZiTmVPekpyMzh0Z1VmU1Z3bjduM2RHejYwMXRvemVZaVFZazlPbjJN?=
 =?utf-8?B?T2FoN0RIc3hISzIxTmxTcnFHbmE2VFFLQmdSQXV4TEZtQUpjZUh1eTFtekZV?=
 =?utf-8?B?WnNJb3lvek90TkM5d3ZxMHZmSVhQNThiTUxMSU8wRzFLQ2gwa2dELy9kTC83?=
 =?utf-8?B?ZUNkUitvS2NONkZ0SWYrK09haStaa3VhN242SWgzaGdYOXJEdVZ0WUx4QnNh?=
 =?utf-8?B?T05xQzlPWW0yZTdrR2ROUlNkMDd3bEVZU0ZlcWRHdmxWbFI3c053MEk4c3gz?=
 =?utf-8?B?NGlFZG8vczVwZjVYU0krNHRsTGs0U0FhTW1iSkMrVndvMm9ZNDBJODZjZWJU?=
 =?utf-8?B?RlNxUUJaY1A3VWNlVERiZm56VWpuR2dpbERWcVM3L29KMS9iNGd5bHNjTDc4?=
 =?utf-8?B?Sm5LV21NWDVqRVIvR0hBVllJcFFvZnlCMTBrQUtwNCtFTEFWTVFFZE15QUll?=
 =?utf-8?B?TFFXV0s0dWQrRlYzUjRva2dKYjluRjVISFh6NE8xWFJ1cE40Wnl4RFJDQzdw?=
 =?utf-8?B?K2xpS0R6MG80Z1l1UFdmRUhVRkpYOVEwbk5FNU1yVVpCKytueTFZcHdpbVZN?=
 =?utf-8?B?VyticFlmSkFHaDl3amlDUHNpczAvN0hIMkQxK01BQmFleUg2SXpVckRRa2Z0?=
 =?utf-8?B?T3ljRjZrbVVydmlkczVWM1lPcnFPTk05REdMQ0VLTHFXWGFmTVRMMlBlMVJ1?=
 =?utf-8?B?T1dUZktReUZ6dGkwaTNrU0pKK0lyUy9qZ1ZPMXBZbDc5NElzeTJOcDBRc0hn?=
 =?utf-8?B?ZmJXVXp2c2NEOVBjTmZTZGlNN0FkYlpLdE5mMFJxWXRNYlpwVnNlUnlXYUI0?=
 =?utf-8?B?WGVDUlhTQjgvNnFJWWNuSytsNGNFU29JeExVcm5CRmlQVVJQd0E3Y1h2aE9H?=
 =?utf-8?B?RzJjbDd0bkJnSFVCSSs4b1lxemtxUU04R3lUKzVwOUZ5c1VwYTBvSFZpS2VQ?=
 =?utf-8?B?K1FLWlZ6ajUrUVRjeXV0Nzhoc2htWmhMU2Q5ZXRQN21JRjFXOEI5S3lXZFRT?=
 =?utf-8?B?V2pRQ0MzL3drd0NCdEs3OWZ1RitOaGtKV1VIYnRsQUdLN0RwcmdGWE53Ulpu?=
 =?utf-8?B?aVZzS0w0cWpjRU9PYWVkVmFOL3ZqYzJ1OEU4K2FPYzFZallkV04xRks4a2pt?=
 =?utf-8?B?Um5ZUTgwS0hHQ1NwbnJLdnkxS3g0NGw5bDVkMUdKekhCY2w2WVA5VGd0NVg1?=
 =?utf-8?B?dHJiWE9yWTl5Y2h4Z0s3azN6RkwwMkRaeVYzUjg4M1RiL2o4OGVYOUs0RzMr?=
 =?utf-8?B?WlB1WmJZdUd1ZEQ4eEpoOVRxV3JFR083RDhLNUFUVXpYRjNjQjQ4Z1QzOXl6?=
 =?utf-8?B?ZmxIbUxlcEhBNGRLY3NmMkxvM3JiM0xQbSs1MFlNV0xhUDlqSVZkckFSclBs?=
 =?utf-8?B?TkNvOXJUbWlTdTlnQldIcElEekM0Q0d2czhuN2xWWHdxOS8rNjUra3ZCNG9s?=
 =?utf-8?B?MDdwQXhMeEdDQVV4WUtDZzNhT0VOODVTWGpMbS9ScnphWlhIc3ZyWEFTS2Ny?=
 =?utf-8?B?a253ZFNKQWNEQmhCc0pIQkk1U1B1c2NZcVM3eVArVk5TUFRseFFtaWRlMnJs?=
 =?utf-8?B?UFpYam8xU05Mem90aTVnZU8wdXdoVVpXbFprL0lnK1NFVSsxK1JOUUR4Tloz?=
 =?utf-8?B?bERkdWFmTS85akFyK1owc2o5MGVKZTlMWWMyTkdDbE1CaHdINGl4R3B4emVO?=
 =?utf-8?B?WmxETThJVXlWaGNzMExUN1pWUEVKWkwrSUZkeWx5UXV4aXl4VzNNejlydkpW?=
 =?utf-8?B?VVhxZEtmUmFEZndNV0dNUStXU21FUm9SallZRFNsVHRRcHEwbDZFVnVMenFH?=
 =?utf-8?B?bzJpQi9sTmxuK2U5Y2ZvR0E0UzJYajUvVlNhdldXbkowcGVPaWRlanJHN0Jm?=
 =?utf-8?B?WHk5c3NxY2h0VFNpa1p3N2xIS1MrS2tKWGFLREVJR0hUNkFtOTVHNmxITWxx?=
 =?utf-8?B?Y3FWQ0I4WEZERExUcXpQRmpqS1ZGem5wVXh3SWY5UTdnbklsdG83dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 345da1ed-8b71-41ed-8b61-08df2e046e0a
X-MS-Exchange-CrossTenant-AuthSource: BL4PR12MB9505.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 17:14:27.3149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qKq+L2tNi9vO2wn+LWSdAfbZY16DfRaIeEAbMGcdMDEWmddUcLfi3sZqyzdecfofEgANsIuyoDvy4DeCZhBMVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8530



On 9/30/2026 2:53 PM, Suravee Suthikulpanit wrote:
> Take struct amd_iommu explicitly so DTE invalidation is issued on the
> same IOMMU instance used to program the DTE. Also, flush each device in
> amd_iommu_change_top() immediately after updating its DTE.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
> ---
>  drivers/iommu/amd/iommu.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
> index dfb9268f3c4e..a45044e1d423 100644
> --- a/drivers/iommu/amd/iommu.c
> +++ b/drivers/iommu/amd/iommu.c
> @@ -76,7 +76,7 @@ static void set_dte_entry(struct amd_iommu *iommu,
>  			  struct iommu_dev_data *dev_data,
>  			  phys_addr_t top_paddr, unsigned int top_level);
>  
> -static int device_flush_dte(struct iommu_dev_data *dev_data);
> +static int device_flush_dte(struct amd_iommu *iommu, struct iommu_dev_data *dev_data);
>  
>  static void amd_iommu_change_top(struct pt_iommu *iommu_table,
>  				 phys_addr_t top_paddr, unsigned int top_level);
> @@ -218,7 +218,7 @@ void amd_iommu_update_dte(struct amd_iommu *iommu,
>  {
>  	update_dte256(iommu, dev_data, new);
>  	clone_aliases(iommu, dev_data->dev);
> -	device_flush_dte(dev_data);
> +	device_flush_dte(iommu, dev_data);
>  	iommu_completion_wait(iommu);
>  }
>  
> @@ -1824,9 +1824,8 @@ static int device_flush_dte_alias(struct pci_dev *pdev, u16 alias, void *data)
>  /*
>   * Command send function for invalidating a device table entry
>   */
> -static int device_flush_dte(struct iommu_dev_data *dev_data)
> +static int device_flush_dte(struct amd_iommu *iommu, struct iommu_dev_data *dev_data)
>  {
> -	struct amd_iommu *iommu = get_amd_iommu_from_dev_data(dev_data);
>  	struct pci_dev *pdev = NULL;
>  	struct amd_iommu_pci_seg *pci_seg;
>  	u16 alias;
> @@ -2795,11 +2794,9 @@ static void amd_iommu_change_top(struct pt_iommu *iommu_table,
>  		/* Update the HW references with the new level and top ptr */
>  		set_dte_entry(iommu, dev_data, top_paddr, top_level);
>  		clone_aliases(iommu, dev_data->dev);
> +		device_flush_dte(iommu, dev_data);

May be an existing issue.

set_dte_entry -> amd_iommu_update_dte() already handles clone_aliases and dte_flush.

-Vasant

