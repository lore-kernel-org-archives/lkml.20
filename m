Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013046.outbound.protection.outlook.com [40.107.159.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451424B1CE0;
	Mon, 19 Oct 2026 09:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403700; cv=fail; b=BPHOWUvuIc/8tXXAZt+gk8NQKN95mHfOuaZT6EiNMGWROQ5p8CADVXcWmUB1IeurFEmeOtehyzD2YAbRb0yll/O0uzTv6yaxwUkDu5aSNSW7KLzFFDi5kPYrUBJzgoZUOgDrWS/93OCmbPoM7/wzTvUe/ji79mWwVA/pFJnsGSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403700; c=relaxed/simple;
	bh=iXVRMJheGvvP8hGbVeIl2TIrajVMQJGgCSQ+qkZbLjY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LwRKjY2BGUPuY5V7iLV5xUZilG8ollrr5bWij4SWhVP5xdc3+729UynyyIopieSUArRzu/vpgEYyr6EAei6cx/fgrl1ooE6M5IU9sXjjLJUeVXvrzryIx9ii6pN7yhBx8H/1D5eUEDJ0s+U7PqK+LTH+bBWtMhYBDTen4QZP5Uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hSnWZFTY; arc=fail smtp.client-ip=40.107.159.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hSnWZFTY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJteu7339wXBphm9p6+UshGgOY6muR/ZtbZwdmuMkfkSjWEq8FiwzeHjr/S6lH36VdGC5eUBCYrIMbq+a7G0WxjluyNQNA9o2TnmY1IXmSY8+wwKHUzTI/c+2YiDys111V1k2taQOj9UwlINbUj5ygU+CyqGfsN7opprfwadqq4dfTYrt+O2WMMTMcUy44QU7dqaO2O66mswh0MnuYvZTZftSlXaVNbNFW1m/ksozOXK7KMJ2WOSDdh3TweVJjdLbje9zPoDerhxgwztdf6aMQJbbLptXiLCol24G40FHEbfMn+/rdWR9RFtW0IaDU1QiK0z48W8vqNHWxM1Ac4/cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rPCSCvcCGAu49FuaHTDjTF8Qb0AWinX0gnXKKcD3/8=;
 b=DUumW9+c9gsDbn40Tsyee9v94Z2bQhrlv3/QukCpGOUUVaJXmLGSGOQ/QUlmNMUznUSs/k67Z1WN54cmK0uVsn9O/FimN8Cmc5HZAX7gBvp8q6uPT6L8EvmxVicTzr2epi/RnjmHguNLLVN/Y/NRNpaiUHZVhxT78cft4ht5JrRiuD0LAg5u77UheWHMetCskYX1hOZUhdHEXJBf0CCEuVR0M72BEJFmXF1Y9IojBFFIgg8fqvc0s6o1g6wG2PfRTKxUZT3tKGvGlfOEJMx03nCmdVBziFLMxpD8T8V4cjRl5D7/sV735JUkkwP37NnA8ir6mln9oWIk7y3H0ZMVqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2rPCSCvcCGAu49FuaHTDjTF8Qb0AWinX0gnXKKcD3/8=;
 b=hSnWZFTYUztmMimyyYZC1YEevZ4GogZD+HpAB6HgOABvfdnoimS75Z976l1r0Q5jI8iYHybEkNoZwtt7ASvevOI/q8VKPlxer1L5lnRCi9doK2buc3ux3v+2JWB6IPJd6hzrtNWkv7kI74dtR/97id4I0SmKXLc1hdk7n14JzNYa62l1Q3H3/IdxByaz7/yXuUCYW+bsiKACLnpmJvxeEtT/BHIFkW+thHcpWQLS3QrIb6L+qfOcl9LTBGMlRSwIJ08ZQWXxl3ynJduT3jRJtvQsqwo51b0sX2AMA/DQE40RB996p2m1n1pswJC7/kWsAj+BS/F8iyovUYvPMCo5hw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB9791.eurprd04.prod.outlook.com (2603:10a6:10:4ce::9)
 by AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 09:54:51 +0000
Received: from DB9PR04MB9791.eurprd04.prod.outlook.com
 ([fe80::806a:199b:49ec:b4f3]) by DB9PR04MB9791.eurprd04.prod.outlook.com
 ([fe80::806a:199b:49ec:b4f3%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 09:54:50 +0000
Message-ID: <7b3e3de6-ed2c-417d-b26e-efc582be0ddf@oss.nxp.com>
Date: Mon, 19 Oct 2026 17:54:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: amphion: handle core runtime resume failures
To: Jiale Yao <yaojiale02@163.com>, Ming Qian <ming.qian@nxp.com>,
 Zhou Peng <eagle.zhou@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019082754.1806443-1-yaojiale02@163.com>
 <20261019082754.1806443-2-yaojiale02@163.com>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <20261019082754.1806443-2-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::9)
 To DB9PR04MB9791.eurprd04.prod.outlook.com (2603:10a6:10:4ce::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9791:EE_|AS8PR04MB8676:EE_
X-MS-Office365-Filtering-Correlation-Id: a1cd1da0-e593-4efe-9bd5-08df2dc703d2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|1800799024|376014|11063799006|4143699003|56012099006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	etXu+cPpxj0tsRQzz6BVtNbJhU1NB8GVzeXXSindQnem4cd8ttVt7takcc9POt8vFclHPbqHSwMbyN3IsnGyz2PUcm1PLrDkyJjQQsYwQCgyOEMlKB0/wtYv94HrOHq420qPB9d331njzqh2rBipEYon/nFk9s4v3Qa3uuYTYyy9mHtaHMHyQOuIIOnzRy6Irw3Ig0yOeChFG8j9kuPcin8BQ5iBScta7vdMayEC+UhIcpAByIG2QEwjeFCA/ZG49Opg5n889dmTNOW1c1Yrd/YWB2UO7W/9YDuDZbuSQRuHQl3wFmasEJvopwWkfcDQX3vr9rS8WP27Bv526jblta3bRUkrh1rHJj5uFcf3fYUVRuh+Y2ltv/fMXsUSW2BUIbVNx+VESDJsrLdiXbIN6qng1+hLqjv0TJAlv715CfRxYSazbMBwdvAR8u5qRUTOtaWaw2hwOaoFu6zNA5LChrzS88F8HSOiPhUmRLFKauMl0pQ8c/Ziv8pOkeAdyk6bLAftu61sorgXiNa2eGYtqd7KiqbVIQP0RJHY56yKoGksdvOkcYHwBVzA2AYr536J2rvsAGznfYWaL9vr9SZZu6IOPcIlemUukbX0AMgUIb3Ihlagz0YNFE0iYRtt8KZiLdo73QFyXyjkfMFXh2eGjawYIi8U4TQrOaN44QDzzi0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(1800799024)(376014)(11063799006)(4143699003)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S21DcFlqZWE0MWZva3RiZ3ZBWjVZMGE2cUc2bjY0QSttdVNRellXYlQrbkg0?=
 =?utf-8?B?K0tlRDZCeEtNUjN1eHVTQkFHNlFiR1ZkNS9RUGRtYStKUzdmS2pUbzZMSUQv?=
 =?utf-8?B?UWNDRWh4NEwxU0xPY0NYcjFtR1pzdnM2NkFua3FwYWNqc1dpTG1zQjRVM1FQ?=
 =?utf-8?B?aDgzZW1pQTBIYkMyYTJWU2tEcEUrWUFodnNGRm13M29FSWpkdG9Sa05WbWJa?=
 =?utf-8?B?cjB0M0dScXQvcUtOWi90a29nR1A0MGVrc1RubUg1bHU0a3NHUWpTQ3lRSk9k?=
 =?utf-8?B?aW80Ri82Tm9uZU83TzlOQTBpbTc0VkV4bWxGVVR0cFM2TnF5cVpZcEgrMzZY?=
 =?utf-8?B?U3BNUXNrb2h2aE0yeFRBZWhKczFpYVFETUw5WU1UNUhzVHpKUU5acEFRa3R0?=
 =?utf-8?B?T3BtT0M5UnpDV1laK2ZVaENIYVRrT29BMGV5ZGdIVnJSUy9YSGdNOXhpRjFZ?=
 =?utf-8?B?WWFIMFIzNGl2TUlYamtOQ20rL2RKWjlMc01GRzVGYS94VWlVbDB5dmkrMkpu?=
 =?utf-8?B?d3BPNUw3cGtTL2FBRHM0NFlmMEp1WFJPODJZT3VESDd1Z0ZCZ3MvSk8xYm15?=
 =?utf-8?B?MzVwSnR6R0dTSGlFRTRaa1puOTZONnVYMUpQOFQzZEFNc2g2MytoMG9jaU9B?=
 =?utf-8?B?eHpUZ0RnbmlMT0lXQlpjMUloT0gxUjA4alFoV1czVEx2RitMMDNxUDZkU25Z?=
 =?utf-8?B?NG9aR29YL2lFcDIxV3RtbDlaa0l5dWthMStjeEZCeTNyaXNGa1M1SG5zOXJk?=
 =?utf-8?B?UDdnY3Z5WlI2SXJtRHBqZ2l5bk5Sd3lPdjVuQ25Qd0pSbklsaGIzNGZhVlNN?=
 =?utf-8?B?Y0JINFNNVEc0Vk5GYyt5WGQ0QXI1OFV3aFdqR3NNcVJMVjRTTWtaMmhCR1c4?=
 =?utf-8?B?V1d4R3UxYW9KTEZSN1A3WEhGY3J4Vm9qWm5STGV5L0FON1N3ZmZ0dW4rL3Vm?=
 =?utf-8?B?MXY5S3BwcWdJb0lpTUpxNVYrWEQvekRUbHdBRlZSSk5kbUV0Vmkvczk4bE5M?=
 =?utf-8?B?TExTNFBicnAwWGtEV0VUUEJuTC9NSk5LQWw4MkNnYThlYklveU5oQllRL1F0?=
 =?utf-8?B?alVMY1pycWh6YnFPRzFYekpreTZNcGEzOEh1U3dHZlZMRVk3UG0yaU9pcnZ3?=
 =?utf-8?B?SkwxWGlIUmx6NnlsOWsvUTRGYUZ0NlgwTkJxaGJFZ0xiaG9LQlZ2Z1lDU2RI?=
 =?utf-8?B?eUxibDAyTG1vanZNY0l6N1c2TUhPMFNQTUxXN3F5bm5HUFRJdTAwbUlPVEhi?=
 =?utf-8?B?Zng3R05KQ3lRb1BSWGtLdUtLT01RelJIZHhKVjY4M0UyZ0Nob3VMUGlKOUhG?=
 =?utf-8?B?SnpiUE5lVnYyRVZ6UVlVWWxzcDVCdmZQL3ZiaVN0OU5jbVhiNFpKbGI2YTlh?=
 =?utf-8?B?VlllVGtpTVFwWHdla1hocUlqMVhFSmZWWW03blN6Nk04bEZzYm5RNFNqK3Zi?=
 =?utf-8?B?cXNJZS84R3hWNUlwREl1ZmN4TjRZR2JoaUczU0duQ0JtazR2cElTOElrNElY?=
 =?utf-8?B?UlpMQi9HOHRZdGlCZ3VtbEVxK2hBZFVBeDR0NFJWQW5xK1hXdUJ2NE94MERK?=
 =?utf-8?B?NmRVaW4zaGxDVDFkWmluRXJKdlJEYmlyTWs0dTFHUWpvWmphb2IzYXBudGRF?=
 =?utf-8?B?OS9ZUmlKVjU5TnBwTGREL3VIZ1poZUtXZ2hMK3Z5RHRxcGdWdkc1cFRMdjdQ?=
 =?utf-8?B?WW1HVGhieEp4L3pyQndUSXFHVmpBVWJnQjJHNFY2UXZNMlQ5cFdrRHlQZXY3?=
 =?utf-8?B?UDZsa1J2eUsxcHZqZ1FaNHM2YW5YMzRrWTdhKzdUaFZsKzNReTM1ekMvUTBw?=
 =?utf-8?B?VXdKQUVNVnZRQVIwSzBZQVd0SEJYZWErTVNJYXZ1Znc0SzhXaHhuTzA3Q3Jq?=
 =?utf-8?B?SVJ4NE4vMHJrYStGYUUvYnZsOTJ1TjJwZHJCMVhuQ1c0YzM1QzhYOGVBL1NV?=
 =?utf-8?B?RElNYlRyN3JCNXNuY210VXpqV0hoSjlIZTRRMGlMbDN4Yk9IZlJkMXVkQ2RK?=
 =?utf-8?B?a2ZjN2M3MlhnbGdVTithVmYwSm9uVithTEhIUVgydDZET1dZNnk4TTFHdDJF?=
 =?utf-8?B?UE5PMkg4bXU1VVBQNGx3TW9xMkZwMjRJMHZNZ2xReVBWZVRyOG5KcnNwdmo3?=
 =?utf-8?B?M1BYUWpKOEtxeFRKa1FLTWJTOXMyR2srZFErTjJKWHRkQmpqYk5kYWhtQ29P?=
 =?utf-8?B?TTJQZkdVczFxWk40V1NtcWIwTGFnN2pEOWtkblg4K0p2WEdEMUNqVFdnVWZv?=
 =?utf-8?B?UE9sT2FpdGJQbWlMbUFnV0pmUVhjaWU3SFNrSmNUOHYvdWU4eW9kZjBBUHdt?=
 =?utf-8?B?c0NlVzgraEphRURxTDkyV2Z5QWRNZ1V6VXlWNjlVRkpIN2psbDlxZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1cd1da0-e593-4efe-9bd5-08df2dc703d2
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 09:54:49.9644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1J1jJ+OolSxOqyCPt1fIg/LTy0LtdA7RrPYhc0EChN6mHV7ZSo76Udfx4+ex4zV072geyVuxxRbu0dhxEQMRhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8676



On 10/19/2026 4:27 PM, Jiale Yao wrote:
> The core request and resume paths continue with VPU state and hardware
> access after pm_runtime_resume_and_get() fails. A failed runtime resume
> leaves the device unavailable, so those accesses can fail and the later
> runtime PM put does not match an acquired reference.
> 
> Check the runtime resume result before accessing the VPU. Release the
> core lock and return without touching the hardware when resume fails.
> 
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Reviewed-by: Ming Qian <ming.qian@oss.nxp.com>

> ---
>   drivers/media/platform/amphion/vpu_core.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/platform/amphion/vpu_core.c
> index ad54f014d8..3d71442807 100644
> --- a/drivers/media/platform/amphion/vpu_core.c
> +++ b/drivers/media/platform/amphion/vpu_core.c
> @@ -372,7 +372,12 @@ struct vpu_core *vpu_request_core(struct vpu_dev *vpu, enum vpu_core_type type)
>   		goto exit;
>   
>   	mutex_lock(&core->lock);
> -	pm_runtime_resume_and_get(core->dev);
> +	ret = pm_runtime_resume_and_get(core->dev);
> +	if (ret < 0) {
> +		mutex_unlock(&core->lock);
> +		core = NULL;
> +		goto exit;
> +	}
>   
>   	if (core->state == VPU_CORE_DEINIT) {
>   		if (vpu_iface_get_power_state(core))
> @@ -760,7 +765,11 @@ static int __maybe_unused vpu_core_resume(struct device *dev)
>   	int ret = 0;
>   
>   	mutex_lock(&core->lock);
> -	pm_runtime_resume_and_get(dev);
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret < 0) {
> +		mutex_unlock(&core->lock);
> +		return ret;
> +	}
>   	vpu_core_get_vpu(core);
>   
>   	if (core->request_count) {

