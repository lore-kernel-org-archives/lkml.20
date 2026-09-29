Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013069.outbound.protection.outlook.com [40.93.196.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0680550B8AA;
	Tue, 29 Sep 2026 12:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683814; cv=fail; b=F9IkPhW/KCM7RprSZyATnWbWhTQiUmGzkA6U/pitUEdbAzFWaWoA0pbbdzrkweeOAWk2kDfGcVRgzyJ1ZMcHI8SBhCH8GvTYL3wIekpng8meZaKWR6o81cU+U8NDesWYb+KAZXl0qN+FrnAo6gtdGAUSLq9nRTYWqLXTkt/OIfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683814; c=relaxed/simple;
	bh=CFpk1st5txgs0rfvNYeOI8SR9v2YZdquU+MuatvxPAs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ETPD37zS4oszftPwRvztjj9iK6nXJxZga+rO63IzCamxbAQW337dN0wjMExsePuoKuqR9Tku2SFktcSbM2LFJx0Cz7IdxZrcVtuZz2m2OB0pfMhs5xl+Y/IXGTnZ196Bk/tiEV6GZ9UNOI6xSxXQ8LuzcFi3+933UPIwCE409dM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PdcJp7gu; arc=fail smtp.client-ip=40.93.196.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PdcJp7gu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3XodYaU7UsSpxOmg+/SysKljPIQHCSX5Dmj4N/T6WRRXETfz6y27Z3cFviG2wyYLst9N3xq+awpASd/p/+Cv0cH6A9HvZUVcGzZKkSuSaYOc0jg46OrFVhgyv501s5F9fV3p+ffwrnuYYYNlcv0ql7defYbXeF+1GJUlk1CG3g8gJiEdvxLcxYSMWibTE2IgfPMYtXOWR8zoOgNVrxP5NIb5I+g5s4Gopo5B21XkpYinhDL5fyfydGxn1bbHm1eUKmlJCzcbdybXWQt0tCX6HAdxlhmb4b0JiZBH3jA4gkvmH9Fl4OocnbmA509ueTaiMWeDJ+cAXK6YelPAa5qgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTeJzgoKcKpnAoR+ovaIag2ZsYJ7oqriIjFIi1jnfoo=;
 b=MKjB8LydujgIYA2d6t7vp1WF0a/dtOuPHDhkBYFQjdk7G9jzlaV+rQFvuHkaxRtupUYyvFJLAOm+AdMrjEhL21dxVERWNSapIH1utczdlTcf8HZa/1SOTMcjNIxvzAS4ZiH01FIDh09gDOEuO8FMZQxhLkMIvwxj2hJka6LY4POJZrSWuOHtY7NGjOMqdpWfBiPAzE+eDVBjJmQ9tQbjXGZ5kac9KJQT0T1iQ1FwU4CWAPe+WXP/Goy5IkuHx6ryKI2SFW4qyCaspHrpk5/hE0tCLMvhl55XCaaeV9aUld0ztsLfinHabZq+F3MJYp3HPqpYiSkgcL2AyP6mgBooMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTeJzgoKcKpnAoR+ovaIag2ZsYJ7oqriIjFIi1jnfoo=;
 b=PdcJp7gudeFeEjXLn8ft74KaZF6y3oPx9vtdXhRNlTz/YVFieBxRMSVH6NL3scveKHGs3CdDESvYygIOoZ8uLwWwYFXLKC/GLRu0iCMy/Ca3hq0XFMxabIE6lrKvF2+RKNKZA5F1XM3tmtYMpNAKYfAJP3fZzD3AOaqcVoqoszg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB8068.namprd12.prod.outlook.com (2603:10b6:930:75::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 12:10:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%3]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 12:10:07 +0000
Message-ID: <44427eff-9d95-42f5-8c67-55dfd319d562@amd.com>
Date: Tue, 29 Sep 2026 14:10:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] udmabuf: respect the device's maximum segment size
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Jason Gunthorpe <jgg@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20260929054835.94118-1-kmehltretter@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260929054835.94118-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d425f78-e5a9-4889-9d1b-08df1e2299e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|6133799003|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nc9n+LFzSPEECnof1GG6MWvvL7p0Y+5k2D0jW3MTi3X2TmPCjG1iKNL/1YwvoafZT5Y9GCXFVvEy7W43m23fX5aadW3G7upx+/T8y7cUdMJEnt+CZZaF0ocDyntxTKGGUWy7IC7PdEonhsZlsroPex8OVugd+cOMa0hkJi4uPlEtSbUy248OXg3+RaWHOMNQlXVSrt5JAJD75RTJ4c8zpEjabRM9QnGNfsDg6aBEtrFtgwXurBWFViSg4a5R+W2+QbC7W48m+XSvA/+NavSru3x8sqcpeenSlDfWbEnIqZsIzPjut2hRmxqxNFlh/yFjZMI3FXwGu0D497MWUiJBG8P9s8eeUCbDo7LolL7sPkFBsAOBKa63Ll3cgMFwe+SYcK78FewNwuMLtoN8MKq5JracAR6CSiG5az7HkfXc2FWgV71syfKhANHJcqfTySNbqNtaDmVz492IDIcWyFTD+sylGZnRJGKtnpnvtdgWtCzprhvAfumafGP5D9+9GufnAgD2pFiIA4I7cTjc5JjR+LdpjHQWNsccIS3G+K7/AvRe8kMjDfVxngG6U0FBiVSlN2sW4IFakFz556H7BbCAcmUMhteZMLocUbscArBogxtC4xY20Ezsqm5Df5CwsCRqI2Meke2Hfrd/DL7PKg2BgJUV+TGkH66f9RyMm3aomxs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(6133799003)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjVYWjlGekEydHNWb0xkVGREV0xTbzRYd215d2ZBQXZEWEZPcWd3Y0VOTytO?=
 =?utf-8?B?djBWQnQ3dXpvcjlTL3hQM1pPWXVSNHRjUjVlajF4Q1U3bHJGdGZhUjhQWEFw?=
 =?utf-8?B?U0RGMCtwUzNnSjB2SFZqRisrNFZpZFRoVTBJdG95RWQ4RnZQcUE0S1JqRURN?=
 =?utf-8?B?N1VCMmx0emxORnBQL0toaDNNbi9reVVWZHAxWC85MjZMVEpqTEZvWTZGZDhC?=
 =?utf-8?B?Wm5sR25aaXZ1UkM1VlpkNkl6U0VSQjhZTkpQZjdYWHFqTE9PYnFMeEQ0L2tD?=
 =?utf-8?B?WklLd3A3Ly9uc3g1NnhBdTNmb1NaME8wUGdWbml6dmdDT0NCSG1EVjB5aUpL?=
 =?utf-8?B?VVpqTHVJelZSUnlvbG1qTnVzMHRZN0hIV0xsTUJsY0ZPUGV4SU4rWjRBdFhN?=
 =?utf-8?B?dkRVZ0tOVEFsSWw5OTNEZWdoSXRWV2NqR3FVaVo2YVo2V0oxRGUvTHNtTlhV?=
 =?utf-8?B?RDQ3TCtWNmJmTVdKSUdMRGhGOTFZY2haWjF5cVJBRVZlTUwyMFBrV3UrV2Vw?=
 =?utf-8?B?U0diRzVGK3lBL1c1VXZ0UGcvS2p3NFhZQU4vSUlKREFEVHNJMXFjcnBzTHh1?=
 =?utf-8?B?T1ZWMEFGQ1pDU3pTTzlhZFlUL2dHRUhaZmV5V28wcEEwN0RPM1ltNnBsNW5r?=
 =?utf-8?B?OXlBYnBuWTE1VjZ1R1RRczZGMUxjeUwyUGMwL1Y3R3lXR21EOWN2cFp5bkt6?=
 =?utf-8?B?NTlOMGI0YWQzZU9NSEg2UmZmZHUzczRGU09Jc3VKR3g2c1VPRGZrOHhWQjF0?=
 =?utf-8?B?dTlzUjc3WmxLQXUrRFpPeG1LNHJDWG13RDRGWnM1R3JGZkNhQmx4MVJjcGdF?=
 =?utf-8?B?ckY5dU9hWHAvLzNLR21pMWVoMC81TFlIVDZpY08xVThMS01ZY0J3V1RjdjJ2?=
 =?utf-8?B?bkcwUGE1M1RzS1FuMThyNkhJdTRVQnYwbHY4dWw2ZE91NGxKVHpZclRna29N?=
 =?utf-8?B?eGlENmY2bEJ6a0dXNHdQdGU5clg4aG5KVG9XUEpZQ25pYmkwelFYTURoWnRX?=
 =?utf-8?B?c2pkS2xqUW5UYTJ6d2duMTV1SHYrYTgwMktzYnd2ajRGNWlxZ202Vy90OVZM?=
 =?utf-8?B?S1JpMjE5YnZEUzBIcGdzeTFjSU1reHpDM0trcXp3akttQ0xsdWduZ0R3RjVM?=
 =?utf-8?B?eWNTbUg3dE9LRS82U2NXM0dVSkRxTHdwbkNjWUxpU3lobGViL3JMYklvMnlh?=
 =?utf-8?B?UUtjY0djTnl0MmU5VlVic2JZQWZ6RHlKUlRTdmZGdk1JOEtUdmZyakp1Tmgr?=
 =?utf-8?B?VEZUSXR3N1BjUUFqMzh6TVczdmRsYkZYMDVNM1NDcVdZM01WaG5WWkRBZWsx?=
 =?utf-8?B?MURrV05qTkkwQWlMeDRiRVhycWtveklpU1lwTmlvWncrZWU4THNkOWlmMjF0?=
 =?utf-8?B?TkZ4aS90MVh6OHlQS2dBMm5IWmJvcVVyVG5aRmZheUxqR1oxc0pXaklTbGJm?=
 =?utf-8?B?aEVsTFdLODNnVHZvSktpdCt4cDBYSng1Q2hNaUJXUlFpSHFiV1BybmoySEhm?=
 =?utf-8?B?UzUvL0doUW5rdWxFV2NBY05HOFIzcU5UM3ZwQ2RKZ2N4Nm8vek80aDdDM0FG?=
 =?utf-8?B?VWg0ZEVySWRQMldNWUVHcEM2clduMFE1eEVUTkNaeVJVbW1XOVdlcHhKTXBG?=
 =?utf-8?B?K2tleCszcnJrTWU2cTJmNHkzQjErVzFZRGpnbzRqTG1XcjZjWVVtaDJ6WTdM?=
 =?utf-8?B?amxLcTkzd0dEajdDaUkyeUR6VVpLdGYwVVZFNFJhYXhreTJwVkFwN016amd5?=
 =?utf-8?B?b0ZXWEc1c0ZsbWp3R3Fhd3VhNUV2THRKeGcwRnh3RnZ5TWUrVHpFV01mcGQ1?=
 =?utf-8?B?RnYrTDY5ZTAzejMxSVVRL2FWalh2T2JLeEtQWVcxWExKMUVGU1R5VFpFN0s0?=
 =?utf-8?B?c0FlTzhuNFBHayt3cERDdTRlU1VjZTRoTUxjQWRyYmJUYlNMOG5yMXhCMzF5?=
 =?utf-8?B?SDE4N3RhZzRZZ0F2ZWhpbFUwZFRIVDJhTE1La1Mxb0o0eGpGUXRNdUFXZjBk?=
 =?utf-8?B?UERzWEQyRVZ0UnpUc1JuYnFOeXhPZkhJekwyYklMZFlvTzBmRW11bms3M2lW?=
 =?utf-8?B?UGppRkxVeXZqUy95Wm1Fc0drRHkzYnZ4bzRiTmlYTGwrdUhPZVNNeXhIdE9B?=
 =?utf-8?B?QWtmekJad0lyelQvUkRDMHdydEFWQmw1V3JEUUdhYTlNZW9KQnJWVGk3UTlO?=
 =?utf-8?B?bGJXdUxKUktMOWVETGpIcTdvcDEvdmFiT3ZFODZwU2xsSDRrbHJiZ1ZTZFRw?=
 =?utf-8?B?RFA4UnZMajU1Ymd3aFVpUEFETGtBemsvVkp1OWIrZkg2ai83dzYwWlltdmZX?=
 =?utf-8?Q?qNouUEzIqp/xSLwSPD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d425f78-e5a9-4889-9d1b-08df1e2299e7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 12:10:07.2588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WVTqLnuPtNUXfEX9Egy+4OdLLL4ICV6mTGFSOqSLwdz+XCv28G/JfybVdybbNNnH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8068

On 9/29/26 07:48, Karl Mehltretter wrote:
> get_sg_table() merges physically contiguous pages without accounting
> for the mapping device's maximum segment size. This affects both
> importer mappings and the udmabuf misc device mapping used for CPU
> access.
> 
> With DMA_API_DEBUG enabled, DMA_BUF_IOCTL_SYNC on a 64 MiB udmabuf
> reports:
> 
>   DMA-API: misc udmabuf: mapping sg segment longer than device claims to
>   support [len=65884160] [max=65536]
> 
> Use sg_alloc_table_from_pages_segment() with the mapping device's
> maximum segment size. Return -EINVAL if the limit is smaller than
> PAGE_SIZE because the page-based allocator cannot honor it.
> 
> Before commit 5bf888673e0d ("udmabuf: Do not create malformed
> scatterlists"), each entry covered one page.
> 
> Fixes: 5bf888673e0d ("udmabuf: Do not create malformed scatterlists")
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> 
> Notes:
>     Changes in v2:
>     - Return -EINVAL when the maximum segment size reported by the device is
>       smaller than PAGE_SIZE instead of clamping it. (Christian)
>     - Add Jason Gunthorpe's Reviewed-by tag.
>     
>     Tested on v7.3-rc4-70-gfe2ec83746e5 in QEMU (x86_64, TCG) with
>     DMA_API_DEBUG (all_errors=1) and DMABUF_DEBUG, A/B against the same
>     base:
>     
>                                             before        after
>       DMA_BUF_IOCTL_SYNC, 64 MiB udmabuf    1 report      0
>       vivid import, 4 MiB udmabuf           2 reports     0
>       vivid import, 2 MiB hugetlb udmabuf   2 reports     0
>         frames captured                     5/5           5/5
>     
>     vb2-dma-contig rejected the non-contiguous import in both runs.
>     
>     For v2, a focused importer advertising PAGE_SIZE / 2 returned
>     -EINVAL under KASAN and DMA_API_DEBUG. No warning, BUG, or DMA-API
>     report was emitted.
> 
>  drivers/dma-buf/udmabuf.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index df6dd00462423..018937435356e 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -133,15 +133,22 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
>  {
>  	struct udmabuf *ubuf = buf->priv;
>  	struct sg_table *sg;
> +	unsigned int max_segment;
>  	int ret;
>  
> +	max_segment = dma_get_max_seg_size(dev);
> +	/* The SG allocator requires a segment limit of at least PAGE_SIZE. */
> +	if (max_segment < PAGE_SIZE)
> +		return ERR_PTR(-EINVAL);
> +
>  	sg = kzalloc_obj(*sg);
>  	if (!sg)
>  		return ERR_PTR(-ENOMEM);
>  
> -	ret = sg_alloc_table_from_pages(sg, ubuf->pages, ubuf->pagecount, 0,
> -					ubuf->pagecount << PAGE_SHIFT,
> -					GFP_KERNEL);
> +	ret = sg_alloc_table_from_pages_segment(sg, ubuf->pages, ubuf->pagecount,
> +						0, ubuf->pagecount << PAGE_SHIFT,
> +						max_segment,
> +						GFP_KERNEL);
>  	if (ret < 0)
>  		goto err_alloc;
>  
> 
> base-commit: fe2ec83746e501645709761605c2464a44fd2929

