Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011069.outbound.protection.outlook.com [52.101.65.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730053A5E6F;
	Tue, 29 Sep 2026 07:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790667188; cv=fail; b=ISs1upU/7Htsp0DebVupKTAy1AGVUVnIDjmTPzzhhZJrKbCMUM71W0keuKI4sx3qjlby1muWtD8Xdjz69+PzY1uhLjajNjw1hWQpJzRuRzIhL9tvh20siTHrHQwmhncAqkLKYyskau3DztkVSVYnaQ4hepPW3ZSfVR0PLSMzlA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790667188; c=relaxed/simple;
	bh=xrMRJuj4A6RqTkfhMLE1X4XgVwsRf0z0p9hUO94KjD0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T2N/Daed26smsBXP7tdoOplNNRV+wtgU6S2EKDHJnWYTPzwrxWdhnZ/qf2ite9qdX1AxJQZos57Uq7zVu0/pj5AyBZMTZ/tfK5ASnpT7AOlwZBy0Tz0xPVTJm4H0Ik84v5blosRnL8yiKQL1K+Fny3HTPjVU8ONnBH8RonvVs/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JMaSMBM3; arc=fail smtp.client-ip=52.101.65.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JMaSMBM3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRneS6mdO7ilDqy3ylMRqYr+RHQfbZifGPRG8iGXtodYmMPbTIKKtOmTXSzdS+pSyUJiqZsQv/a60GeKgsHSpIgNTaqvRfYtkNqv+49O6IWKDrhncNX0d+6kC7HT0J259YAEms1RJLMHMT4MnUpscrGRItbAG60FPROD0SU/iWz1LnNNBKGz/0fD6daqKtphWT0wiUqnqSNNnEuAFw+S1JSgq5hYU9vqgIeZ3RIW9GC3LYx4Msfe02aioKqF/hPCBH+wXiv2wxLsbJf7l0AlbMssilRc2Is+s8I+wmIb7m+YmXuYmfKeL1QwjU+jInfF2soQ6Fxu2vjhkO3DGMJ9yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuawTHsM1yGRclrLR+dHsVlCGNH/+LURpBu7yJNoMl4=;
 b=ZC7FDUKe9NwMvnC55y/pwoPbqReZhtegfLDwizJA3Efa4aEArcggu94AfapIY6sAGdnm6HHLbdGw2Zh1sUEG57gcswDAMUCeWvcx/NpM78hQEnkyflUDQaWe2JHFF24tHNvfzVzviHRFYUSt3AXm4g1jrp8cbeXuyV/4khfG4VTcx7Z1/QOn7vDsdsFmgB4KxpjMA6tb4wDmKD3Hlt6cL06FIq1ypiiS4EoyU5xpH1EZfPIMw/3zdavL0M2ug8bRPzD5ZSuzK2psiHFCApE1rg3JEVGRyhY6LWoTU08/yiE5+dRCj6Doi7Gtl6XN9qKcgQRfITViPoJzoGVdtl/mAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuawTHsM1yGRclrLR+dHsVlCGNH/+LURpBu7yJNoMl4=;
 b=JMaSMBM3rP+cvuXB1FolRA2PGjFPj9RcCtyibuh+g1z6CUm9BHWtfcJhVVY4mxrfnB1B9Ixd2NeHlOuUuInmtZI5Pm+LRxBHP/pdO+wV12izsioDYc9VoiGqkcjKNa7i71fUMepocpoquiH4sFJ0+gjlgWcvD9YsYjNKL4YGFOlafKISMYBCnEL7v8vmnLTzuAgGAajpRUJ6jbo79SD//H6EE6bGvf8KwnEK2QhHe8+NvyJuTADQRJxqlPsjs8NEJW5cU6Iqa5Py3XhNmkt+a5GnhvvAQ9r5OY+ZLPUYvniQ3TkHcFkQakK4ZrvXFnUGEUNKl4lgpsYbdKnYQwIaqA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB9809.eurprd04.prod.outlook.com (2603:10a6:800:1dc::15)
 by MMZPR04MB606764.eurprd04.prod.outlook.com (2603:10a6:190:50::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 07:33:02 +0000
Received: from VI1PR04MB9809.eurprd04.prod.outlook.com
 ([fe80::32dc:96e4:da45:6bb3]) by VI1PR04MB9809.eurprd04.prod.outlook.com
 ([fe80::32dc:96e4:da45:6bb3%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 07:33:02 +0000
Message-ID: <a5584929-43a6-4074-8d9b-d3b9612e2ebd@oss.nxp.com>
Date: Tue, 29 Sep 2026 15:32:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] media: amphion: Add V4L2_FMT_FLAG_DYN_RESOLUTION
 for VC1L
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: Zhou Peng <eagle.zhou@nxp.com>, Elliot Chen <elliot.chen@nxp.com>,
 Frank Li <Frank.Li@nxp.com>, linux-imx@nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260608-flag-dyn-resolution-v1-0-44dc65516148@oss.nxp.com>
 <20260608-flag-dyn-resolution-v1-2-44dc65516148@oss.nxp.com>
 <54bdf44f368e90bce879dab51475230726a630e0.camel@collabora.com>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <54bdf44f368e90bce879dab51475230726a630e0.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0011.APCP153.PROD.OUTLOOK.COM (2603:1096::21) To
 VI1PR04MB9809.eurprd04.prod.outlook.com (2603:10a6:800:1dc::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB9809:EE_|MMZPR04MB606764:EE_
X-MS-Office365-Filtering-Correlation-Id: 509a6a8c-3060-4868-a027-08df1dfbe4a8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|19092799006|18002099003|22082099003|56012099006|3023799007|6133799003|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	t6c2zPS25GRGbHSKJVS366ho0C3okhx7EC14H0NZ3FUEY7++XS+6buijtI38O1IcjKaK+4/9viaAfMOkKg3FvnR5052gAJgBe18IgMLxL1q+sVNh1O/cTaTHxjjJcBaxUd0YIFRZ7BXtGAiq63H7I0BeudvfBW8LqARxh3SXSxUacOv6is0TNbiLOmMqcKRgo5i6NQyblH/ZbFqAkLJcGIttjVFpXWMU4eEL+OBdkcMkmEfrcNdqEgsQ6DmAILAtQPeL8szYHr8GADA5mwzZwB9mxT2xTBnNdEb1u81RP9D9+lqXo/US2egl9NTi5FWCrN1Hq4BbOlyAVkDDTj5N/lgjB28OJE4zJCPvLIHK0iKpRyU+f5wnRU1pQ5ZHy4N105/30CYhLKjQovoQ4yem3it3L7Mc6/Qp0gpWpIJY0VLr/tfNARsV9JeksmYeV41yBYK+/ICHrnWtYwX0uYK42RBEs4s613WKPmCc7vO45FBSObFHoaFHomHIpyRxUMN3N/8on2UGWCFOdeDliwTLcYe6IUD3U45NeIC8Ip17/wjVaG6BvfpCF/4TB3AII75iyz8QgOED34sFT2scvCcsh/LL6HE0OMCrgmVByUfPh06dEOsE0OA6tlGqfTv5Sawasc6XSmWCpjM8x/DsNvfyqla/lVp+pZArlULWJ2q7edY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB9809.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(19092799006)(18002099003)(22082099003)(56012099006)(3023799007)(6133799003)(10067099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjVXUm9oL1pRZlNPWjZTOUZncEE5T290QTgrR0lCTEJxT3hWTHFucU9zQnN3?=
 =?utf-8?B?S1pPWVhFdmZ3dTRSaHBuMyt0WW5qUTd0TEJpMVBHTHdPWUxla0czOUNPZFpG?=
 =?utf-8?B?bmRlbDJaNnVxdTV5Wm9BUWw0ZldvMG0veFgyZ3FBYnVJWWl0TDhvd3BsK2gr?=
 =?utf-8?B?aWdIMHdDcUUxTnVURGVTY0JiSjBEWlVVazhkMEprcDhJWjl6RVV1dFVsZDRN?=
 =?utf-8?B?ZjA2cFpPU3lGZmRRaXh3NTRnNmFIYlU5SWNlWVZ2ZzdaamFvYklrRjRtWWU1?=
 =?utf-8?B?NXR0NTE4MGxmMUNQaFowSktKOVpBY2FqOE1YTTFRZXpvRDNqa1pBbnZqUVBi?=
 =?utf-8?B?YW5saTFhaHo4YUhaUXUwd1cxTHVpZlZweWxjbGxDN1M3WlRmM0VBRTBaczVw?=
 =?utf-8?B?QitaUnFmLzI2N2ZZdmNPcmNOR296c0NmaTJaRFFWUkxyMXN0emY3aXd6OWZZ?=
 =?utf-8?B?bmdMSGtMdVlVTFJhdEdMV1d0SGpsNU0wancrTExtVS9wRXFvSFlGNStvUVpw?=
 =?utf-8?B?ZFRQR1BhdmRVWWdhSUJKWitRT2N2ZTZVc1p3SktDd3ZVOU54UDlRYUlYbXJQ?=
 =?utf-8?B?T1Y4MHBpUjk5dG9MZ3VVSVBOeW9naCtSRmJUOXRGOUI0V1B0a2NpSUZOMWFu?=
 =?utf-8?B?SXJORGRBRHpPZVZxejZtelZPamlzYzNkUEhpZHh0b3ZXR3dHUXFsbjgya2ZS?=
 =?utf-8?B?ZG9VZlNseGovaTZ3WlFTUFNBNUd1QlNHa1FCQ3htNkkzWjFHbkhyNVNza1du?=
 =?utf-8?B?SWcvaHNDeHRIVDZGTFpaV3ZaMHlpUzdRSVNkaWY2dktkWnRFT2tMakpaSVZX?=
 =?utf-8?B?OUQ3M3pnTWlEVlVVQUs1Z3VxSWZTVnJHYWFhbGdxaFZIc3ByZE12WGErOWIz?=
 =?utf-8?B?WHpjRmE3N2ZsMGZvSnVhNU9wU1FxdERyUDN3ME1HQnJDRkdlYlJDR0FkK1VC?=
 =?utf-8?B?OUw0NzZpZmxuN2d0ai8wSUx5QmxoRWZGRjh0TEg3ODBnRlIyakplaHh0WDFa?=
 =?utf-8?B?Uy9MbVJ0ckYyS2dWTkR0TDVEVUNNdTEvZTFSU1UzS01EMEU1VlpnRjAvdjNa?=
 =?utf-8?B?QkVpdTl4ZWJURHNGZlIyWnVHZ1hYUXFsb0NITjdUUTlPamN3MzZaVURLd1Fl?=
 =?utf-8?B?WS9URkJKaG84SkVLdEhSU0c4clFqcUtjV1hmR3dhUk05TklRc0pGRGM2NUpK?=
 =?utf-8?B?OEtOdDN2bERZNm5Oc0NiK3pveEp0M3dTaE9aMXgxUGFPVngvK3p5RlhRczlO?=
 =?utf-8?B?UGhLMHRsODdEY0pONG8wbDIwOENETUdyV3NTOGYwcGV2MjlnTE15cWdEdGtG?=
 =?utf-8?B?M3RydGdIaGdXZVdXSHBKTTM0UU95dUZvdXE2QjhBaE00Y0RQMEdramM1TG1p?=
 =?utf-8?B?VXo1K2Z5dlQ3MURISlFTWDd1a2J6TW9wSUlMK3BPemUzbnFSQ0UxS2ZyVWI3?=
 =?utf-8?B?Sms0Yy9vaE9HMXkrY05mWGVuM0NTUDU0c3ZZczVYMkNLZUZpODVROGJVcld4?=
 =?utf-8?B?NTN0bUFScXZvZkhBWHdIVURicXl1SVMzbTA5dytEYnNWKzZTdyt0QnlYZjVO?=
 =?utf-8?B?cFQ1TFBKU0R2bjNlOFF1MFdFR0NnUThXclFqQUVVT2dVazlKZVdPbG5qRmp2?=
 =?utf-8?B?bXZmakFXWXBGU2xoT1NjZ2ZDT3hjcEJVcHl2THJiNG81M3JZQzhrL0U3UUx5?=
 =?utf-8?B?b3FadDZtV01yVkI5b0pUeDN3SXVJRWRqbkRkR0RBbUgxc1ZNRlJVcUo2OVNJ?=
 =?utf-8?B?L1k3SUQ0bTM3NU1majF6SnhpckRzWFphcVRQWExUaElXcWlDTlRFUjcyeDFH?=
 =?utf-8?B?SDdXYVo4Vi9JVWo0bFpKS0tKSDc4VlR6VjNHaWJWTTI0dDZoS0ZJQ3dZK21X?=
 =?utf-8?B?Q1R3K2hudURROW5kV3ZDM3NkYWFYenJrc0dnMDNQeGNETXZuWnBXaHNnUXY1?=
 =?utf-8?B?TEg0TE9oV3drUkI5dE5mcmlBdkFjZk1VSHNpUVFFem85WWFlMXIzYnJKdEZ4?=
 =?utf-8?B?ZDFtTzdCKzVMQmFBcVY5WlVsWk1SZDRDMEFsbGdsYU05WlVOL2Z0VTdXU1lF?=
 =?utf-8?B?dmhFVnRHdFRURjdhNWVWaHpwR0szR2FPUVZ6dEttZnpqdHF1STljVGV0MFNK?=
 =?utf-8?B?aVJ2eXdMTUxubE5ZeE9LelAxKzc3K3g3SXBIbldyNlllVll4cWpSQnBTa1Rs?=
 =?utf-8?B?U1ZCV1d2QUREM0p2R0lPUURTMlB4K1VvWkRmc2ZybTh1U1QvcDdTVFZKcXlO?=
 =?utf-8?B?d0lpVFF0OHBSaDRGRlB2bUVsQTFiak1sUW1LV1hybDN1bVVJRlE3cy9vRXFR?=
 =?utf-8?B?SlFtOXdJYXRHclZpc1NLUHBwQTlEYzZOdDFtNnBJaFZpUXhsdVgyZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 509a6a8c-3060-4868-a027-08df1dfbe4a8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB9809.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 07:33:02.4682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NKThI3OXhKKdD3b6N1pQkB6q2hZ3lJjtDxJaSytU3ptZ3vCmUarBeRBwfd1GgmmzOldNRtBDzsjAq4TMk8iC/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB606764

Hi Nicolas,

On 9/29/2026 3:39 AM, Nicolas Dufresne wrote:
> Hi,
> 
> Le lundi 08 juin 2026 à 12:56 +0900, Ming Qian a écrit :
>> The amphion VPU decoder always emits an initial V4L2_EVENT_SOURCE_CHANGE
>> event after parsing the resolution from the stream header for VC1 Annex
>> L format. Without V4L2_FMT_FLAG_DYN_RESOLUTION, userspace (e.g.
>> GStreamer) cannot determine that the driver will signal the initial
>> resolution, causing it to skip waiting for the event and fail to set up
>> the CAPTURE queue properly.
>>
>> Add V4L2_FMT_FLAG_DYN_RESOLUTION to the VC1 Annex L format entry to
>> indicate that the decoder will emit the source change event during
>> initialization, consistent with other coded formats supported by this
>> driver.
>>
>> Fixes: e670f5d672ef ("media: amphion: only insert the first sequence startcode for vc1l format")
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> 
> 
> Can you send a non RFC version of this.

Sure, I have posted the v2 and drop the documentation change.

Regards,
Ming

> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
>> ---
>>   drivers/media/platform/amphion/vdec.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
>> index a9f0521f2e1a..75808482d090 100644
>> --- a/drivers/media/platform/amphion/vdec.c
>> +++ b/drivers/media/platform/amphion/vdec.c
>> @@ -136,7 +136,7 @@ static const struct vpu_format vdec_formats[] = {
>>   		.mem_planes = 1,
>>   		.comp_planes = 1,
>>   		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>> -		.flags = V4L2_FMT_FLAG_COMPRESSED
>> +		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION | V4L2_FMT_FLAG_COMPRESSED
>>   	},
>>   	{
>>   		.pixfmt = V4L2_PIX_FMT_MPEG2,

