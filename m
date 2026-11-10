Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794291904;
	b=LvwqBpuTR6sK2CtKoG+8VL7QxrDLDJ59DvfSzPZVOYHEA9X9/a4t++RTpPXhoJXYHIQC
	 wihGsyhBi4YfeJQL0/Qg0tFpljCxGLLMKeNl8zIkYzSrX0Z1HPtmn7zqELaX1B59K+z8d
	 5CNzIDhpG537lpBQWj60eSBmD/IxfNOUKHrPBIrlO0XYebUhGTijhsF0f2KmY0SkRoHbw
	 vCiuxx0cmgJF+6tWWGu/a5f6tVF1WgkJKXXOv/QCW9CIpOjj0HaVYTw3XeQpRZeYKntzw
	 ZMe1iDs7/KtBjfVE7/FOnyknKVjKdczlmiJ9+cnLVTI5W/sUQb6MqV5uWJZ9lCL6/3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794291904;
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
	bh=XoC54yuYYw/o5Lza+rAR34QKYs5KVP6XkPfVvPk+eVI=;
	b=aYEGLrgnwVa0CGHRAwestofX2J4vPKywgVxGL6CTTa+DnJM7V25HJJcBCYz2NKATqLwQ
	 z0QsKQex1KgTe7QTJyOMzgLMYJc85F9a2OOp4/aWV+8gd6cr4gzYefmipz3Ex4irNQ6++
	 NK5weGX6eKP/HDPgBW6kZ6F9NAH6vyiNOXGNoTqQciJlj5xAmHAd8IeqFYAVabT3uIW/G
	 s9jsC3boDfAGqRk+fqdx199LaYdHVoKGAOPtcu2Wd3dH2lIzDRNbeHavJCfxHQO8wIbQS
	 etWpW7YtILvosGfdbkH3unjyjeqKDPs9JsGZQkLqU2u8virGF3/YerHtWsFfmB+7lHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OnZ5eLoM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.7
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012007.outbound.protection.outlook.com [52.101.48.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBA3606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDBA3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OnZ5eLoM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKPi2gWbfI+dVxFIZeqeCSoXvq7SQ9oQRjrIhCjuFbyrudb1xScKKr+QhpYlh3MeYIo99v31Cgt0yrZzNwAOimPliUYvN8M6LtwOd/lgZuBVynughoxflRPnztjkKlQX08yuyluz6DGUsufuauSSEKBbuLB45y0sR3ER7lNRt3WEssm+r5KMplgEGfVCjN4SRVkCV9F7etaDDoPrdBKUU7f7JYtDY3pZdWSrFUkQobD/Qyl/NJ2w0mzSStgVntO1SVjbss8U99y5KEb4aAc8keF1nEaIOI1AyT7/WdnXROK+6L4IkHuKK21VKSn2FOUnllaQ0K3aLqijFV/chSCb2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XoC54yuYYw/o5Lza+rAR34QKYs5KVP6XkPfVvPk+eVI=;
 b=yvZw16jzBUuRor58m8B3DUq3zrDywTrHb1YXsYJ9+6/t90SBkhtCYdPZsK8TxReT3tvsHdpKG4IPDHV0qHe4lE1on4ovpr80xcipTc/7Usci70lo5t2QWRLciaUWAoSoKcQrjb4N7ofsV1lsoUo9GUbzX1caDiP2DgwTMVLxV3US+TADZurkWyoWRnyYpTt6OuKL1Ku0VBljh8VavnXsEIBCtM8LqYO0uoH1tL/7bPtLe4Kyi1+krV96Y+O56VZqcZIEzNO7vQQRjh7N6h15cnxQR0eIGgxp9FfGsNcUZSVsoT6llM81mxKKLXuZH3/N9/x17cGDNyCPpdqVvo/m/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoC54yuYYw/o5Lza+rAR34QKYs5KVP6XkPfVvPk+eVI=;
 b=OnZ5eLoMLCC3aFAHeBB5gObJybUqqPyVInwlWgsYhx/KHBBwV+AyDyKCu4zZt/LrnS94pU9D+aqJioAh0BCLMjH2ekDT+8ROR6QEgX0u3VC5mkgCz4uTW69s6wVO46+NgbPoxjPY9kWSt7GUsm/p6X38MtlLpuqE3QwslBvXj+kn/GmW7UvzsMyp/rYxGqObI8GuiJxCoPqShhwgtsoL4FAI7LyBCcS7xNzwkydlUJq7kfdmhbCk+oX4x+epWdC7yibhOqa+YRt/Z0VyL7iF1IJoiwwkqXkXh/y7cdFfuKdMQyRwADCOKS0qXz1f8L0VjAEuT3npRnkqwM5PrnwIWg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by CH3PR12MB9172.namprd12.prod.outlook.com (2603:10b6:610:198::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 06:24:58 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 06:24:58 +0000
Date: Tue, 10 Nov 2026 14:24:50 +0800
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
Subject: Re: [PATCH RFC v3 11/15] arm_mpam: resctrl: Add NUMA node notifier
 for domain online/offline
Message-ID: <avK4Ca4skGNWXwoL@MWDK4CY14F>
References: <20261109212427.1409204-1-fenghuay@nvidia.com>
 <20261109212427.1409204-12-fenghuay@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109212427.1409204-12-fenghuay@nvidia.com>
X-ClientProxiedBy: JH0PR03CA0021.apcprd03.prod.outlook.com
 (2603:1096:990:74::7) To BL0PR12MB2370.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|CH3PR12MB9172:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c44d825-3531-4108-bc17-08df3ef357a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|4143699003|5023799004|11063799006|56012099006|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261026121527099003|10067099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|261009223327099003|261009221227099003|261009221727099003|261009220027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	jJUr9lfyW7hWqUa6cG/j0MrJZLWjoabC05We/uWglkMfUOucRkiAKBwd7AesvT1t9YDqNEMTRM4q+MZ08g+9Byi6kWpsISWSJ98brz/qlmgkYpS3lWgg2VNkuFC0U5koldARbGBSqAf3JBHcaGnaEPqUtkigAMHtcxLErRG7b7ZKTHu8Os854KG9gnsXklt8InU+xbPVBVV//StAO39lyDfo6gCVn3jlelkgcTmY8tSxG+U6u+Qm+uLgL65jYq1NreHFjd5Ha8Zgpb5fW8nMZvTmRvPgRzzEPwAJk8GQrPjItcLlSX9E7e+QZ8VDgUXJH3E9xlfFj3cN5+tj+y1S5RPNRU1y3sPubF+lSN2+JoZdfZ80REw1R7dVK6MHSe/F4cMf8FVlECB68K8hT3cXuHEdUHtlk16uCf+WpVs8Bfc+xRh1xJH1+cY9zynZvq/msXQ9aQ7n7rVTV+QJxoUxr2oYK2mCCTmqItQgMTM+KRznaApcJaRHuo2TpnmwxR1lz0U6Hv2MQqAH84aJ1blzp8+UM2PPPyOii4MBPOVVhNCcJ7t06pqzC1B1n8BTnQuOdHHkDFGHIHCLeseOzJlD6YgFXSszT+I6jmKoSz/H7m9qayD4wxfsQIe3cSOIeY5AugXSXlsOo/HtisvFFyIFhXyLmkM1aRQvNgMk1ZgGkEI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(4143699003)(5023799004)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261026121527099003)(10067099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(261009223327099003)(261009221227099003)(261009221727099003)(261009220027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NdBE+jT9FeiRLTBr8E1nqvP2yYbX1PJ/uN+smn6xAhhRD6FtnZej+7bhY0Ek?=
 =?us-ascii?Q?30prZbwfKePwMFgLSDu4C1wqHQnDrcW+BkJtsICEV/M4/af9bFcc8DcNFl4m?=
 =?us-ascii?Q?q3iMTvgRSKpCQO6qSwCTZJtbiijvx39p9V1rt7J8FCIjuEPQqdK419NhLa2Y?=
 =?us-ascii?Q?Nap1GGU0Gf4gWupCqFVDhLd/X26E1988JJsPZoudcqDytWpNGICY0FZGH+gj?=
 =?us-ascii?Q?1KB6EGi1tfACeZTtw3sm9swPJIRXtnAZyzlA4qHlYfbjEF8+WTyVeGH3T5w5?=
 =?us-ascii?Q?k28DCKhIhG6oEVduMsjn6lrnnrLA5ESLx15XQe9eyCvednnygAUKd+4a4Y1B?=
 =?us-ascii?Q?uhtC2RJ0ORXGkR6FX6nmS5efsPsPBPDpFmMr/4LNpuBPgfx5op7lmVQgQELr?=
 =?us-ascii?Q?FpDAzQeow1uhqrEbJlb7UQiQgZDJQsdabrCtjyhUDLfeKxdJQBRTOfCNHQih?=
 =?us-ascii?Q?fsBTAAejbWdKWbtkok9/F71sjpHOCsfDD/3tgONKmhqMqs0bGaOX17dHfECa?=
 =?us-ascii?Q?6BpOtjXl9n8mNxwhAQiv4ocbFd44RcdwZd/wLTRjYSoGiXx/24/UZg85xQVH?=
 =?us-ascii?Q?n+aloBL/l/M+Eq5VY4YjzMNUJFy3XTJr7WyoBWPAiJUwXs8y566UB5AL9Pa4?=
 =?us-ascii?Q?InQqoRmntcyDio0aNaIjbx0WR4mtwXOmHAlsAbYoIEDL8ADZ5RnDTEAXrrYL?=
 =?us-ascii?Q?EINhPEnKezIhTngkYmDoxaz1fcww/LUHNRFsGIxk1pVS5FSMW2H9BtGIoXrp?=
 =?us-ascii?Q?xiHNcMMZEcYGddI0sgCI/o+oUbxcPR4Dg5Q8zKpMs/SH91nXKK0IN63xaVtr?=
 =?us-ascii?Q?nlkwI0T1vQpc9B7O2gvaGOaeN+zuR9HG74A47HxSucVc6t9bmvCzOZCX+Wzh?=
 =?us-ascii?Q?NcOLiubU27DBZPs91FBhDlV8weyNDXo1wdJ3gTgWx+d8J8DoStkHKwY+RUXM?=
 =?us-ascii?Q?1RmIGO7Bd8a04oIEtIaUI9YWMszWaTbsPaiOPfP6uiy0xbgVUXHiQXryl1kP?=
 =?us-ascii?Q?Dh9BseVvDqGHGsgs6eOIuM9EZrZGv2ankfWWysDHwi9I05GMbdV5qB4VLvXf?=
 =?us-ascii?Q?J8SOrrEdD7jParJyPCTWVLJaKOQcD0xVqEEEX07snCNjzqehCK0ztnE6mtOv?=
 =?us-ascii?Q?SfuV38S6i6DhW12qmQnotGFQzCcGvSdd0Nj1IEfkKzUDdzf2hH/llZxXBJ5a?=
 =?us-ascii?Q?7ZeyX+qdClKEiV9jRy0PEq2imsGJ9OQLF5mvxGtJakJvifu0D9v+Auq0syWc?=
 =?us-ascii?Q?MZooyabqsp+/RsJD3x6i72aO5W+ID+7sVhKpuOeqbOzJ7eqNXhadBtIxCa/7?=
 =?us-ascii?Q?YDIe+6ehpFgwocwjCyEPPH16PwDG/CqOjSQ/ctpuLo+Qh1fFxgcrpVbZsseR?=
 =?us-ascii?Q?BLL+PhYzBjwm/STa/tkNemwTF37s9p+eW2EUQBnKjrmaOENq/zH4/muyjeRV?=
 =?us-ascii?Q?Q14oDBZRuhVGCxMjZ9TnPy2/7O9AyqlfaqQ+Vg5XKrTgchuD1sloHyh8KTfK?=
 =?us-ascii?Q?+I4eBIzwXBTW7iisrOgP8seLKj3NwigpQF81sx6suto/4ZnCxOIMLKrQlcXa?=
 =?us-ascii?Q?yI84r9zviVAqMMVlFsbw1UeDNlEdJe4VpR1G7Al7T+XwVTSpJG4M0oDHhKGg?=
 =?us-ascii?Q?+0TQzosO5pBmKQLRUCPVct4+UoNR+NxU3EwXdFiogimQzVOwfo5PfE5bgVCp?=
 =?us-ascii?Q?6GfFOqItRJO4/8M1G2SjGjUiOqB/SYXmmzOUpHMyOPxztEECghR11gnZKg4x?=
 =?us-ascii?Q?UirwyzYNpQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c44d825-3531-4108-bc17-08df3ef357a3
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 06:24:58.1871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IgoCpWjSQhm1ZjdScEACgRyhAwBMXsfZak52uJP9JV+5jLkruVduiFPTfoEWI2kvFtBN6AnyKseLUxJT2oKGCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9172

On Mon, Nov 09, 2026 at 01:24:23PM +0800, Fenghua Yu wrote:
> From: James Morse <james.morse@arm.com>
> 
> To expose resctrl resources that contain CPU-less NUMA domains, resctrl
> needs to be told when a CPU-less NUMA domain comes online. This can't
> be done with the cpuhp callbacks.
> 
> Add a memory hotplug notifier, and use this to create and destroy
> resctrl domains.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
> ---
>  drivers/resctrl/mpam_resctrl.c | 321 ++++++++++++++++++++++++++++++++-
>  include/linux/memory.h         |   1 +
>  2 files changed, 315 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index ac0c488abe12..8a169676c4ac 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -11,6 +11,8 @@
>  #include <linux/limits.h>
>  #include <linux/list.h>
>  #include <linux/math.h>
> +#include <linux/memory.h>
> +#include <linux/node.h>
>  #include <linux/printk.h>
>  #include <linux/rculist.h>
>  #include <linux/resctrl.h>
> @@ -1681,16 +1683,25 @@ void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
>  	mpam_reset_class_locked(res->class);
>  }
>  
> +static void mpam_resctrl_domain_hdr_init_mask(const struct cpumask *cpus,
> +					      int id_cpu,
> +					      struct mpam_component *comp,
> +					      enum resctrl_res_level rid,
> +					      struct rdt_domain_hdr *hdr)
> +{
> +	INIT_LIST_HEAD(&hdr->list);
> +	hdr->id = mpam_resctrl_pick_domain_id(id_cpu, comp);
> +	hdr->rid = rid;
> +	cpumask_copy(&hdr->cpu_mask, cpus);
> +}
> +
>  static void mpam_resctrl_domain_hdr_init(int cpu, struct mpam_component *comp,
>  					 enum resctrl_res_level rid,
>  					 struct rdt_domain_hdr *hdr)
>  {
>  	lockdep_assert_cpus_held();
>  
> -	INIT_LIST_HEAD(&hdr->list);
> -	hdr->id = mpam_resctrl_pick_domain_id(cpu, comp);
> -	hdr->rid = rid;
> -	cpumask_set_cpu(cpu, &hdr->cpu_mask);
> +	mpam_resctrl_domain_hdr_init_mask(cpumask_of(cpu), cpu, comp, rid, hdr);
>  }
>  
>  static void mpam_resctrl_online_domain_hdr(unsigned int cpu,
> @@ -1711,12 +1722,12 @@ static void mpam_resctrl_online_domain_hdr(unsigned int cpu,
>   * indicating the parent structure can be freed.
>   * If there are other CPUs in the domain, returns false.
>   */
> -static bool mpam_resctrl_offline_domain_hdr(unsigned int cpu,
> -					    struct rdt_domain_hdr *hdr)
> +static bool mpam_resctrl_offline_domain_hdr_mask(const struct cpumask *cpus,
> +						 struct rdt_domain_hdr *hdr)
>  {
>  	lockdep_assert_held(&domain_list_lock);
>  
> -	cpumask_clear_cpu(cpu, &hdr->cpu_mask);
> +	cpumask_andnot(&hdr->cpu_mask, &hdr->cpu_mask, cpus);
>  	if (cpumask_empty(&hdr->cpu_mask)) {
>  		list_del_rcu(&hdr->list);
>  		synchronize_rcu();
> @@ -1726,6 +1737,12 @@ static bool mpam_resctrl_offline_domain_hdr(unsigned int cpu,
>  	return false;
>  }
>  
> +static bool mpam_resctrl_offline_domain_hdr(unsigned int cpu,
> +					    struct rdt_domain_hdr *hdr)
> +{
> +	return mpam_resctrl_offline_domain_hdr_mask(cpumask_of(cpu), hdr);
> +}
> +
>  static void mpam_resctrl_domain_insert(struct list_head *list,
>  				       struct rdt_domain_hdr *new)
>  {
> @@ -1741,6 +1758,23 @@ static void mpam_resctrl_domain_insert(struct list_head *list,
>  	list_add_tail_rcu(&new->list, pos);
>  }
>  
> +static struct mpam_component *find_component_nid(struct mpam_class *class, int nid)
> +{
> +	struct mpam_component *comp;
> +
> +	if (!class || class->type != MPAM_CLASS_MEMORY)
> +		return NULL;
> +
> +	guard(srcu)(&mpam_srcu);
> +	list_for_each_entry_srcu(comp, &class->components, class_list,
> +				 srcu_read_lock_held(&mpam_srcu)) {
> +		if (comp->comp_id == nid)
> +			return comp;
> +	}
> +
> +	return NULL;
> +}
> +
>  static struct mpam_component *find_component(struct mpam_class *class, int cpu)
>  {
>  	struct mpam_component *comp;
> @@ -1925,6 +1959,275 @@ mpam_resctrl_get_ctrl_domain_from_cpu(int cpu, struct mpam_resctrl_res *res,
>  	return NULL;
>  }
>  
> +static bool mpam_mba_uses_memory_nid(void)
> +{
> +	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_MBA];
> +
> +	return res->class && res->class->type == MPAM_CLASS_MEMORY;
> +}
> +
> +static struct mpam_resctrl_dom *
> +mpam_get_ctrl_domain_from_nid(int nid, struct mpam_resctrl_res *res,
> +			      struct resctrl_ctrl *ctrl)
> +{
> +	struct mpam_resctrl_dom *dom;
> +
> +	list_for_each_entry(dom, &ctrl->domains, resctrl_ctrl_dom.hdr.list) {
> +		if (!dom->ctrl_comp || !dom->ctrl_comp->class)
> +			continue;
> +		if (dom->ctrl_comp->class->type != MPAM_CLASS_MEMORY)
> +			continue;
> +		if (dom->ctrl_comp->comp_id == nid)
> +			return dom;
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct mpam_resctrl_dom *
> +mpam_get_mon_domain_from_nid(int nid, struct mpam_resctrl_res *res)
> +{
> +	struct mpam_resctrl_dom *dom;
> +	struct rdt_resource *r = &res->resctrl_res;
> +
> +	if (!r->mon_capable)
> +		return NULL;
> +
> +	list_for_each_entry(dom, &r->mon_domains, resctrl_mon_dom.hdr.list) {
> +		if (!dom->ctrl_comp || !dom->ctrl_comp->class)
> +			continue;
> +		if (dom->ctrl_comp->class->type != MPAM_CLASS_MEMORY)
> +			continue;
> +		if (dom->ctrl_comp->comp_id == nid)
> +			return dom;
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct mpam_resctrl_dom *
> +mpam_resctrl_alloc_ctrl_domain_nid(int nid, struct mpam_resctrl_res *res,
> +				   struct resctrl_ctrl *ctrl,
> +				   struct mpam_component *comp)
> +{
> +	int err;
> +	struct mpam_resctrl_dom *dom;
> +	struct rdt_ctrl_domain *ctrl_d;
> +	struct rdt_resource *r = &res->resctrl_res;
> +	int id_cpu = cpumask_first(cpu_possible_mask);
> +
> +	if (id_cpu >= nr_cpu_ids)
> +		id_cpu = 0;
> +
> +	lockdep_assert_held(&domain_list_lock);
> +
> +	if (!r->alloc_capable)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (WARN_ON_ONCE(!comp))
> +		return ERR_PTR(-EINVAL);
> +
> +	dom = kzalloc_node(sizeof(*dom), GFP_KERNEL, nid);
> +	if (!dom)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dom->ctrl_comp = comp;
> +
> +	ctrl_d = &dom->resctrl_ctrl_dom;
> +	mpam_resctrl_domain_hdr_init_mask(cpu_possible_mask, id_cpu, comp,
> +					  r->rid, &ctrl_d->hdr);
> +	ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
> +	err = resctrl_online_ctrl_domain(r, ctrl, ctrl_d);
> +	if (err)
> +		goto free_domain;
> +
> +	mpam_resctrl_domain_insert(&ctrl->domains, &ctrl_d->hdr);
> +
> +	return dom;
> +
> +free_domain:
> +	kfree(dom);
> +	return ERR_PTR(err);
> +}
> +
> +static struct mpam_resctrl_dom *
> +mpam_resctrl_alloc_mon_domain_nid(int nid, struct mpam_resctrl_res *res,
> +				  struct mpam_component *comp)
> +{
> +	int err;
> +	struct mpam_resctrl_dom *dom;
> +	struct rdt_l3_mon_domain *mon_d;
> +	struct rdt_resource *r = &res->resctrl_res;
> +	struct mpam_component *any_mon_comp = NULL;
> +	struct mpam_resctrl_mon *mon;
> +	enum resctrl_event_id eventid;
> +	int id_cpu = cpumask_first(cpu_possible_mask);
> +
> +	if (id_cpu >= nr_cpu_ids)
> +		id_cpu = 0;
> +
> +	lockdep_assert_held(&domain_list_lock);
> +
> +	if (!r->mon_capable)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (WARN_ON_ONCE(!comp))
> +		return ERR_PTR(-EINVAL);
> +
> +	dom = kzalloc_node(sizeof(*dom), GFP_KERNEL, nid);
> +	if (!dom)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dom->ctrl_comp = comp;
> +
> +	for_each_mpam_resctrl_mon(mon, eventid) {
> +		struct mpam_component *mon_comp;
> +
> +		if (!mon->class)
> +			continue;
> +
> +		mon_comp = find_component_nid(mon->class, nid);
> +		dom->mon_comp[eventid] = mon_comp;
> +		if (mon_comp)
> +			any_mon_comp = mon_comp;
> +	}
> +	if (!any_mon_comp) {
> +		err = -EFAULT;
> +		goto free_domain;
> +	}
> +
> +	mon_d = &dom->resctrl_mon_dom;
> +	mpam_resctrl_domain_hdr_init_mask(cpu_possible_mask, id_cpu, any_mon_comp,
> +					  r->rid, &mon_d->hdr);
> +	mon_d->hdr.type = RESCTRL_MON_DOMAIN;
> +	err = resctrl_online_mon_domain(r, &mon_d->hdr);
> +	if (err)
> +		goto free_domain;
> +
> +	mpam_resctrl_domain_insert(&r->mon_domains, &mon_d->hdr);
> +
> +	return dom;
> +
> +free_domain:
> +	kfree(dom);
> +	return ERR_PTR(err);
> +}
> +
> +static int mpam_resctrl_online_node(unsigned int nid)
> +{
> +	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_MBA];
> +	struct rdt_resource *r = &res->resctrl_res;
> +	struct mpam_component *comp;
> +	struct resctrl_ctrl *ctrl;
> +	struct mpam_resctrl_dom *dom;
> +
> +	if (!res->class)
> +		return 0;
> +
> +	comp = find_component_nid(res->class, nid);
> +	if (!comp)
> +		return 0;
> +
> +	guard(mutex)(&domain_list_lock);
> +
> +	if (r->alloc_capable) {
> +		for_each_resource_ctrl(ctrl, r) {
> +			dom = mpam_get_ctrl_domain_from_nid(nid, res, ctrl);
> +			if (!dom) {
> +				dom = mpam_resctrl_alloc_ctrl_domain_nid(nid, res,
> +									 ctrl, comp);
> +				if (IS_ERR(dom))
> +					return PTR_ERR(dom);
> +			}
> +		}
> +	}
> +
> +	if (r->mon_capable) {
> +		dom = mpam_get_mon_domain_from_nid(nid, res);
> +		if (!dom) {
> +			dom = mpam_resctrl_alloc_mon_domain_nid(nid, res, comp);
> +			if (IS_ERR(dom))
> +				return PTR_ERR(dom);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int mpam_resctrl_offline_node(unsigned int nid)
> +{
> +	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_MBA];
> +	struct rdt_resource *r = &res->resctrl_res;
> +	struct resctrl_ctrl *ctrl;
> +	struct mpam_resctrl_dom *dom;
> +	struct rdt_ctrl_domain *ctrl_d;
> +	struct rdt_l3_mon_domain *mon_d;
> +
> +	if (!res->class)
> +		return 0;
> +
> +	if (!find_component_nid(res->class, nid))
> +		return 0;
> +
> +	guard(mutex)(&domain_list_lock);
> +
> +	if (r->alloc_capable) {
> +		for_each_resource_ctrl(ctrl, r) {
> +			dom = mpam_get_ctrl_domain_from_nid(nid, res, ctrl);
> +			if (WARN_ON_ONCE(!dom))
> +				continue;
> +			ctrl_d = &dom->resctrl_ctrl_dom;
> +			if (mpam_resctrl_offline_domain_hdr_mask(cpu_possible_mask,
> +								 &ctrl_d->hdr)) {
> +				resctrl_offline_ctrl_domain(r, ctrl, ctrl_d);
> +				kfree(dom);
> +			}
> +		}
> +	}
> +
> +	if (r->mon_capable) {
> +		dom = mpam_get_mon_domain_from_nid(nid, res);
> +		if (WARN_ON_ONCE(!dom))
> +			return 0;
> +		mon_d = &dom->resctrl_mon_dom;
> +		if (mpam_resctrl_offline_domain_hdr_mask(cpu_possible_mask, &mon_d->hdr)) {
> +			resctrl_offline_mon_domain(r, &mon_d->hdr);
> +			kfree(dom);
> +		}
> +	}
> +
> +	return 0;
> +}

Hi Fenghua,

In this function you offline monitor domain then free the domain.

NODE monitoring uses RDT_RESOURCE_MBA, but resctrl_offline_mon_domain()
only cancles "mbm_over" for RDT_RESOURCE_L3. This can cause a use-after-free.

Maybe we should add cancel_delayed_work_sync() for MBA monitoring domain
before freeing them?

Best regards,
Richard Cheng.

> +
> +static int mpam_resctrl_node_notifier(struct notifier_block *self,
> +				      unsigned long action, void *arg)
> +{
> +	struct node_notify *nn = arg;
> +
> +	if (nn->nid < 0 || !mpam_mba_uses_memory_nid())
> +		return NOTIFY_OK;
> +
> +	/*
> +	 * Ignore nids that have CPUs. Resctrl needs to see the cpu offline
> +	 * call for each CPU to update the CPUs in control groups.
> +	 */
> +	if (!cpumask_empty(cpumask_of_node(nn->nid)))
> +		return NOTIFY_OK;
> +
> +	switch (action) {
> +	case NODE_ADDED_FIRST_MEMORY:
> +		mpam_resctrl_online_node(nn->nid);
> +		break;
> +	case NODE_REMOVED_LAST_MEMORY:
> +		mpam_resctrl_offline_node(nn->nid);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
>  int mpam_resctrl_online_cpu(unsigned int cpu)
>  {
>  	struct mpam_resctrl_res *res;
> @@ -2088,6 +2391,10 @@ int mpam_resctrl_setup(void)
>  		}
>  	}
>  
> +	if (mpam_mba_uses_memory_nid())
> +		hotplug_node_notifier(mpam_resctrl_node_notifier,
> +				      RESCTRL_CALLBACK_PRI);
> +
>  	cpus_read_unlock();
>  
>  	if (!resctrl_arch_alloc_capable() && !resctrl_arch_mon_capable()) {
> diff --git a/include/linux/memory.h b/include/linux/memory.h
> index 463dc02f6cff..1497d4be38ee 100644
> --- a/include/linux/memory.h
> +++ b/include/linux/memory.h
> @@ -120,6 +120,7 @@ struct mem_section;
>  #define CPUSET_CALLBACK_PRI	10
>  #define MEMTIER_HOTPLUG_PRI	100
>  #define KSM_CALLBACK_PRI	100
> +#define RESCTRL_CALLBACK_PRI	100
>  
>  #ifndef CONFIG_MEMORY_HOTPLUG
>  static inline void memory_dev_init(void)
> -- 
> 2.53.0
> 
