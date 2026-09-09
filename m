Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011065.outbound.protection.outlook.com [52.101.57.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A03344D92
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948005; cv=fail; b=W9c/HE4sRtYA8kLRV0/55e1lxt9mA1D7KsEY+ciWsictiDhskmMZ/BzWnLOZ2X2Ljgu7RvApyYim9jNWwUXAnz2HelvBvzBus3waubxiOnGgjN6+ZCXz0BfduQOq5wTVik+2OH1Cyp9mIj5vc47OW1lbNXnYlGMcYwN+8tWu+DQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948005; c=relaxed/simple;
	bh=rj/8hIvNtgqTp7rbFB4UgmNiOACJL2c2hDAiMH5oCSk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cQ1OcYT6Af9yhPbHjUlByBs8d2fY8N5oQLu2FU6uZWxqR9Nn9JAuaRo2c6IoV3kdoxHfJtpmT4aAjgYvPkdGcye54D/RJsufvR891omopUrHHgq5HwhmSVNC2b+huJsi3FvNXrP/ITYNdhpJycF4E2VPWYKIkRkEUUVPUG7dwUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fGGcSd72; arc=fail smtp.client-ip=52.101.57.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fGGcSd72"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNb7prscUv0SB1974X2uRRn92T1U7X6L9jkQR4BXIWlsrsLbkk9tOZGUEJjiX0svBr0PDvL2ySbTIHoc4uFJxIZSw4GT2ARhXqlRux2+g84f/c8tGuorea5UnAT3QXQIV9h3V71z+bMspxQeixpU8oDcltTU24ZkkRce13/bevGbzQ9mejyCEF2slvtRxJyH+3R8OykoZEQZD0ZtWN8nxOzsp4hp4Fjqjg7R8H+dLE6c2vsgbuKdejjBsd0Fh+lxjbCgt9K3X7+X85/XGJLBTyEDX32EsUMJS4t3M7ZpOF9K6nWQX6z1CoWsJK0CSpirWmAF68UtcWiP2pBX72YDRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SyNYFSmzaG3Fk5BQaWiMbkKJ4hE948d9BWn9KQTap1E=;
 b=xq8VwBav2a8QXkajLTCGSCjW/K2U+wGMqQ6iE+80aHgqYK8A8qtFhWBtPVqGvAJJtzYHqIQ6hvHGJGOJ6gn7FYZUP4tBpLlVw3v3sFFdrVuzV2GjKsrywUS69wFdxH0JIPRvofUhLzItou1kZdS20jBNfhMnwdn8dZz+yueeEdW/h49Bmdu6PM6LDEcXDFZYFYnNAXl8AeQ/MD/A+tiHEb7yVe+FkRoqSMg8SCUHMX+dZk0Gjjtmhb4pbEf8EQioewSGy75z3WyphxCA/eIUhgBeRCFgGCC7nMHemHCa3w34jx8qeKQEMagRRE/bCtt/htr4OPBYfEtxB4Vps0bZRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SyNYFSmzaG3Fk5BQaWiMbkKJ4hE948d9BWn9KQTap1E=;
 b=fGGcSd72gv7sGh41AWCnwchhWRFaawpNARs3zw3QiKKATXXBsLkmmEWTRcQsh9fDifKNjH1oAQXkM3KdOCT09Aoy9eie+PIrcSueIT612hpUkZinb3qJ5HvJG+t3xWquTIi0FMbJ3m5eMfmMqzHEBGk/bs9BKQTecrysZirxGaE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5855.namprd12.prod.outlook.com (2603:10b6:510:1d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 09:59:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%3]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 09:59:53 +0000
Message-ID: <37e9400e-47e7-49bf-9d75-0cfe9ae210ab@amd.com>
Date: Wed, 9 Sep 2026 11:59:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: remove redundant NULL check in
 amdgpu_cs_vm_handling
To: Jiangshan Yi <yijiangshan@kylinos.cn>, alexander.deucher@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: tvrtko.ursulin@igalia.com, sunil.khatri@amd.com, vitaly.prosyak@amd.com,
 pierre-eric.pelloux-prayer@amd.com, moonafterrain@outlook.com,
 candice.li@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 13667453960@163.com
References: <20260909093728.642473-1-yijiangshan@kylinos.cn>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260909093728.642473-1-yijiangshan@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:208:32b::24) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5855:EE_
X-MS-Office365-Filtering-Correlation-Id: 7881f562-4f00-415d-850b-08df0e591857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2QuAQPBZGHmhI9PqsCwR6asuF6PVndJbGOKfoBxLOoiYZLNrdIxiDqskjqYyUndJnlvZ04iwl4xPOh+3LJ3ArBbI1OGQtzUdU2o/xNPhKFy1gjAJZz+/IplXKlxJufa5CedQo9FpRkqfDNQdTeYkmTWmYk8VTp9V3hWh3pSpzJdMJYp2AEpJFrYTCFThIR38lZkVeIMMcx4Wi9oHeiao0UGGT0hFEiQ69c4SolTcvsm83KtD3sf7qO1BuWcaJnWoEutOVTUBeaBPaJj4JvDEW/DZvoEdlkil4iizB2Oo24Xdv9VLy0ofgOp1gU5a7md4L8SmI5IFINYowDdJk0qeY6dRRUnYWBxCrSGR1lRyu0kVK/KicsvvrHoiZfHgn8MoLK+vhhB4wAAyAekhHGuUB2uBPKI2XjgA6aW2tFp+CAzOHjwRJdS52ZzmB1DOqsNcsTdYENeXe4j/04Jog9vdv/KO9WU/f4tPf1vSFL3weqT6w3JeUdeXQR465QlE2V4ZQ8MkvR9ytBi9b9OH+7UX1jPGfzafQO5k6ckNXs70zOAoWY645XwfVxqgvWg94YWNuxIU9/K8gPAkDih1oI7/TEwmndBgd/6RpA88czSpfi9wyQVAEypKNdwhYA3teukglmPCSs6yGblIkDhIrB6BG8GJO7CB/u3dubHvcKndwu4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzVpYlFpZUlGeDJWZWxsWTIzZHU3YlNqRm45MW40RisrUUJZdkJkT3VveGpC?=
 =?utf-8?B?ZmMzRlZzclY0bnFaa2lTTmZDbldMQ0JQRHVXaDh4dy9UTFhtVy9CWGsxcjRh?=
 =?utf-8?B?bFE5Q1Bpa3ZrdWFObCtCNmhNeUV0dmRSWGZFMkRrN0hmTVNueEtaditDaE9X?=
 =?utf-8?B?VzZOTVcwTkpmSkNBSjF2Z2tEWDZLcmlrZmFCSFJuUERLNWcrMVZTQTc5LzNl?=
 =?utf-8?B?OGtzdFRwcDUzTllYWjhGRFFDYUY3OU13RXYzZk1CenJlL2JKT0cvb29QNm1p?=
 =?utf-8?B?cXI4N2dBaWJ1MlUybzlJSVlkaWtPV2wzaEllR3FYV3Z4N0hUemFXcVNHV2JF?=
 =?utf-8?B?S2k2cEdqUUkxUFNKYVpRblBSVWRLRzJkMFRLdDM0RHhUUW5NekIrNGM2c05l?=
 =?utf-8?B?U1doK0Y5Y3VlRlNMOFB1clZlQWVoNEFUenVzVG54WGdFLzFYVXdnNSs5dWpp?=
 =?utf-8?B?RTROMlZPcU9oU1JOUG1zWVVZYmo3TTVLek8vZ2VrdW15MGFINWpWdXVISUVt?=
 =?utf-8?B?VWxyZXFrTEtMeVpRVG1tQVNDQitUc0xyYVBlWlAvem1jOFlXd2MyZTZ4NFFF?=
 =?utf-8?B?c2x5aVMyRW9IR3FUdGlqRXlDNUhQMEhuaURORENlVUVXUlVDMUdnNTB2aUpv?=
 =?utf-8?B?Q2lQV2kzVnVNN2ZwVHlxbmxYTXdGWVg2ZTI0STBjdWFiVDZRWHBuMUhvMWZI?=
 =?utf-8?B?cnl0TDZRd3NVZU93Y2JtTFNKWk5XVU9lM21jWFhNdGkrUGY5WlFGcGxLeDhz?=
 =?utf-8?B?OHk4RGpKWEFJT1cxQ2NERXIvcnRDamI0QjF4MDZISjZhUXVzaUJXS3VVQVZh?=
 =?utf-8?B?T0xiUUtuRk1YTEkyT1VJZTFKUHBPblJpQkRJdzdWc0NRZWFNM00rSnVDa0s0?=
 =?utf-8?B?dTFmYkQzMnZrQTg3YlV5K2FyaVE5L0JCOHVkUGgrYWRIN1JrT2hnWXJTNjBz?=
 =?utf-8?B?cnQ3blVpR0RrdG5DRmZObjZXcnFyb3piK3grS0RVaEhVTVc3SXh3cHRTUFY5?=
 =?utf-8?B?dHRDNllyYlpDdlBuQmNWSjFRUlY2aExWN3JkNTJkeUxFdmw1NU1obXNOZzkv?=
 =?utf-8?B?MnNJUVU4RGh3R0NaYjFvK2w1dXRoUlhNQ2UvNVNBMytQSnNGRWpNV1ovOEZI?=
 =?utf-8?B?YUk1Z2ZSd3NXaDRpVkhuZWlEVzFldXduR0lPd1l3RitTZi9CSVkraXZNdVFp?=
 =?utf-8?B?OHVKUjJncWllRGs2K0FTUktidGpIUW93bGpWb3RJTGFmRkdrcElsYWMxcjVq?=
 =?utf-8?B?MUhzNUVvWjlKWnFMUGV6QjV6SW9WZEQzSzNFaTY4REdUY1kxajY2T0R2dEhq?=
 =?utf-8?B?WnJyTXB1QlVTa1J3T0IxVUpKSGRCSVl3ampza3MwZ0xmRHQrMUNlajd5clFS?=
 =?utf-8?B?ZXZBNkd0YzAwR0FYc1VhM1dCK3U3NXVSRVJnTXBxUWJDc3M3VzRHekVsYkZ0?=
 =?utf-8?B?SnpWT1pMaDA1NjY0UFpOMTMvdEMzTW5qRnBQdWVFdHJkSVZvV0d3d2FaYlBn?=
 =?utf-8?B?N05Ib2F1c0NocmZaYWhSeW5zY3BzMzNMYkU5SzdkZGNzWkNzZVRmNUhPaXZN?=
 =?utf-8?B?WTRrWGUyQ3lBSEp2c1p4VmJjQkZvY003QjhzcU1ueFRoQ0xidVMycGdhajJQ?=
 =?utf-8?B?UjlNWGZXQzdNcGJ1NkYxUmZwSkkwck5RdHBxMEhUYzIyT2p0SHgxU2p0MTZi?=
 =?utf-8?B?WWszNHl6RTg2MnJHd3AvRitQamhhb1RrNFhrakpoVkh5UDhYdVRZVllEbDM2?=
 =?utf-8?B?MXQ1NCtPSEtVbjNaK1l3VGdHMXlmYlAwNTZmczB1QzVrckV2cWZPVjBrYmNP?=
 =?utf-8?B?SHpSTi9FU3pzZXl5dGVhK2ZLcWowYmZkTC85V0ZaWTJqQ0Y5OW90U1AvZ2Vk?=
 =?utf-8?B?eHJjaGpjOWtxN2FIS3EwdEVPUUZ4eUhkQ29qU0FYM0kycDB6djFNMmE2VEtN?=
 =?utf-8?B?Y1FwWFdGWFcycTNiWTFjQ1JDckZJb0lKWUJIQ2RGeVQySzlEU0lQaS9xRUVH?=
 =?utf-8?B?WVNWTDVKQ0lLWmpXcm0wL3R3QUhuOTJsc2FGSkM2bkVUUWhyWjNRc2hNdisw?=
 =?utf-8?B?U1hCOWZhSkt0NDNQMUwvVmV1ZUY3LythakdxeVRjUU4rN3NYeVgzVExtRkxS?=
 =?utf-8?B?WG1jeDlGSzhSOHZpbmgyeTY3Z3BtSDd5OWhibGQyZGRBWFRTeXA4QktETDMz?=
 =?utf-8?B?cTcvUlM4OGwxTGRrdkxNR1hGRjg2MnlSVU5tdU95Q1laTVNmYVZMQW5wQTFa?=
 =?utf-8?B?Q0l6RXM5anlTeGhjYzlna3FRNGg0Y3FnczM1QUF1WmF3ZVY3WGFUVGdrTVpT?=
 =?utf-8?Q?/z4fNTL86cD4z6DbeM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7881f562-4f00-415d-850b-08df0e591857
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 09:59:53.4862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oGs75/higBeBzAAV8K1F9AexlNCrH/eaS+pM72dtL07j+TorQLhfj3vqdIt1Dty5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5855

On 9/9/26 11:37, Jiangshan Yi wrote:
> bo_va is assigned from fpriv->csa_va, which is already verified to be
> non-NULL by the surrounding if statement. The inner NULL check can
> therefore never trigger and is dead code, so remove it.
> 
> Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 03b41f803520..c978f042ae1f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1146,8 +1146,6 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
> 
>         if (fpriv->csa_va) {
>                 bo_va = fpriv->csa_va;
> -               if (!bo_va)
> -                       return -ENOMEM;
>                 r = amdgpu_vm_bo_update(adev, bo_va, false);
>                 if (r)
>                         return r;
> --
> 2.25.1
> 

