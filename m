Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010046.outbound.protection.outlook.com [52.101.69.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102C1329E5A;
	Mon,  5 Oct 2026 18:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791223421; cv=fail; b=Z5KZpEBJkJDdM1b1zBO1Jx7qOrXusXQXez9ldlMzVkjGvGPy17SuL9DazY/VIMSpBoaIE3p2lytJMhEpc79yQo1i3xxhWBJHMuAXCoMcvcWHW0mV/NLF0GJWGU1oZVKXUX4NgjYds3cU9QN2Ejb/APUsbsKoapnwrOxgZjX2MxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791223421; c=relaxed/simple;
	bh=SqaEyJZt4WaxX7Do2xG7+Sxq02av+1mBNlRkCL2hjxE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YdvG8VzqGn9bBs/PbSHT7pFaqRP4EY4PZSJGkgbsP05nISi7bUpI1DNvQ1mti2fGR4HSVrZDWvXo8RK5dZ3LXj8pnZ2bbZcZU76OaavuXc2ZakObXdtwwhnar8pG+gw5Z9KVSPBkJi5nc6qw2/GFXRuMuUPgWRG0BJau0gr/J6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KiW61CYv; arc=fail smtp.client-ip=52.101.69.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KiW61CYv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1mEQ46uT9jG/2iExNVhyJ8XZi8dQNhdQWR0csKaHvFyyIJqJQvipre79uvsu7NufALvXnKS18dNmicjpHuB7MIECwF91yjX8r3ipHn+J2w9PzS9qa3QTbkYAvEFD2bxTGi+zwWCXJ14JiAq5HaZvIx+41/krEHwwC36IOYAeWLQ7yCAeqQhxfRyslkKpF9DP3WkzzzWGUfs5SokYADnKNJurcLJNEzVaLuE86SfRoNEx/v8E0uUMrM/igup3xejlW9sCa2EjzO/k7nm5kgrLAX7td0NwnoFuHJoo6+jBNNJ6ziqRsOlJK2gg4HSIsqh9pe0bRLxIMeZhXYvi2E8+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1GbukxDml3bIbwuFYVBQ90r2+oWUik2Vf0JMy0PjgU=;
 b=LA6v61DczUNzUVVm2NocdS3RPr1Uus7BOa9bnf6NZDrjQPPPfa990cBwPMKClTNegoHY3DYbKCKVO5X5Z5cX6yRfH+/DaQ6FFmppm+2gXfkgUFqnMxLMD1fFzEofnqnoYVuiaJiyK2hAAqzAeuzAlsejZttVEL22d1L9vJkO5MAfXd7B0LojFWyYgbi9Miq/YK4BdBGxddhBwCtN9/ne17kA+MTLtoTAbXZD/39qjNbG3kAjlpOHR8TXa8u+IKWrpWxrjvTyVr71NJbj6H/uYh32s9jbpbPVhaXe1JqluZgpm0IiWaFziyx8JyVOwqXpeLt7ZNH01xGceocePXT7RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1GbukxDml3bIbwuFYVBQ90r2+oWUik2Vf0JMy0PjgU=;
 b=KiW61CYv9Dks5ofQD5/te9MZNzSEVGoGTRwejAZbAad9fqd0KIk805/r/N1SZLFF/PooCxoKQbr6esEvEJ45zCwZ9ZDSkO2X83KpVKod2UUTkDmPkEOr9EBulw4vIelXnWlGOrExt3MG21wwYA5mibvMA9z+Ky1B9WgFjLRJQqo1+XYsWbBixsU7OWtXSk5Vfe7cnK0LhmuuxdGx4+l+l25QcVGuirRRv1ew3K57e3SmurGFG+z71TEOIruDg+rcBx82+gHSpup5qbNcszzKeYzWl6g5hEW/YvzopYnPoHNdMmnGFOT9Oo7wWmwIlYxexBq41Kg+HfrLN8+fLRL7Vg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by BESPR04MB493404.eurprd04.prod.outlook.com (2603:10a6:b10:138::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 18:03:35 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%6]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 18:03:35 +0000
Message-ID: <65b200db-f7a4-4289-874e-8f54a1974618@nxp.com>
Date: Mon, 5 Oct 2026 21:12:20 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [RFC PATCH 6/8] media: i2c: ov2312: add Omnivison OV2312
 driver
To: Jai Luthra <jai.luthra@ideasonboard.com>,
 Rishikesh Donadkar <r-donadkar@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Cc: tomi.valkeinen@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com,
 kristo@kernel.org, sakari.ailus@linux.intel.com, mripard@kernel.org,
 jai.luthra@linux.dev, devarsht@ti.com, y-abhilashchandra@ti.com,
 laurent.pinchart@ideasonboard.com, tomas.babinec@nxp.com,
 daniel.baluta@nxp.com, Frank Li <Frank.Li@nxp.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-7-r-donadkar@ti.com>
 <e469d168-39f9-448c-a7ab-5d02b79d8cb8@nxp.com>
 <179099311665.241161.3689416902838951007@freya>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <179099311665.241161.3689416902838951007@freya>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::10) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|BESPR04MB493404:EE_
X-MS-Office365-Filtering-Correlation-Id: a93fe2e2-d50e-4bf2-395e-08df230af95c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|7416014|376014|366016|10067099003|56012099006|4143699003|11063799006|3023799007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	X629Mqzl1YMH29mj2AZ881aQFjeB/eMp3Eoj0gjg9hrkfV5fVippXgMLdKXarnhfXZo8qopKSnAMohG87VvQByyqsgfMyR2wIKQom/QNzGmiuyq5B/kDg2NtptBoXNE3icKvTDXTy0PBzYfE8RSv8te3/uIQzlkcjsk45CdIv11bUxYuqVbfSqjbvwU+PCDEP1VSc6UYVGoFTbnCbdzD/6tWBnOiVJd8dzCIQLh9bkyvL48M4TcuxNRBkPpeF6KRIU0FvD0wvfDgaOglrU1onNVfITaL7wqA51q0LVnvBzqaNWb9Pr22AOi0NJ4qV1cZXBy/t7IpUAI2ZAZVX80vHbQs/D38hscqS5sYd1Y4BWY7oJ1eYUTF0PCKz9Szopgt+nXBwm0ypBphRa+iwCOpFSjyH4L4a0RyUlya2JXKMbgaxTOwo9MGuAWoFxK32z06ZIhBglQyNBNeJ20aEypXxcJDHphRHJQwAcm7mHmvOYa5uBTNnxMzl1iHQdkijYAbqqtIlGDdc/QcsYaKzwmi9uUD8qwyxCyw7N637edrfsisSoJG02ZeDdnej8KVixQ2hFvF9Dvpz34SxpsYq+uhkW7+BR/jt7PO+VLt0OJ4/KD9E9+w1PVGWLEjjXmGk/5J
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(7416014)(376014)(366016)(10067099003)(56012099006)(4143699003)(11063799006)(3023799007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzI3ZGdRSGJ0YjloNE9RQXJTUU1INTlXMHlLdDZ0b3VtWlVpaDZFVHduY2JO?=
 =?utf-8?B?dDNPT2I0MSs3enl6MlpMczc2OWkrZzJhanJDeit4N3AvTTNicDFueFc5WTV3?=
 =?utf-8?B?NS9ndmxoR25JT2c2WUl5VC9KbVBWcjRabEdKeGpMV1F5MThHY1p1aXRsSjhp?=
 =?utf-8?B?aDdObG42UHJDaGVoQ2EvbzBxRUxyUDcvUjhGVWJTVjZYVDMxWHdWbnRmR2VZ?=
 =?utf-8?B?K0tIZ0pYMVYvNVB4YTlOcWRUZmtnaWp5dXBIWUpRbk1kUlVRaXhnVDZXS3hF?=
 =?utf-8?B?VGRYbXdjVEhyOU4vQS9mem9hbjMvcWxTT3E3U0VCRzB0MWo3VU9DTlpuaVVW?=
 =?utf-8?B?ZWFKVXA1UVJPRWlLZ1pKQXBjWUhCQVhKbXB0RCtYZmZuTU5hYmk1eDNSVDlU?=
 =?utf-8?B?RWYxZ1JXSzkzdEZDRlg1YWxsVzM5b1k2Umx6d09ST0o2VWpnQThnc3RLT0tt?=
 =?utf-8?B?d0tISk5lVFVjbVA3KzlZNTdqZWs5NlJ0WEJodGxGTEZTWjUvbm5WSzdEVDF6?=
 =?utf-8?B?bTZxaS9vM1JQUEJhemVDa0tESVk1eDUxcUh0TkNFOFdBWTR2OUdvTGpNTU1V?=
 =?utf-8?B?bkxzSE5ndXh6aDdKZ3ErY0RaQUlMdzZiMG4wRzdTNTd2QkRuY21GZUhqOVFF?=
 =?utf-8?B?d050VFR2SnVmMnFEVnBSemhseFVOV2VXbjBsNGFHZTdadnVXdCtkMjMzS1ZI?=
 =?utf-8?B?UEtjUnMrUmJDRno4bjZ2WEVvdUtWVStHQVZyWlR4blgzYTNzck4zQXQ3bWZI?=
 =?utf-8?B?d3U5UThVSHhJZkdjeVNQWXVXbGtiL2gxMFdEenp0WjJFMFVXbUlsS2dkNnB0?=
 =?utf-8?B?bnhxMGlRTmoraGtHcHVZUFdIQ0tVV1l2dXBGUm4xeGtTWFR5V2JySDR0K1NQ?=
 =?utf-8?B?QWZ5V0xaRFcxbnZhTThmc0hNdC9QZHNzRHJMKzQzRG9qMVhYT3NON3Rnb2pl?=
 =?utf-8?B?YUdXQTk5cXBSK0tCRTdNY0xqOHNuWkNWcEc3T3VvS2xqcVBFNm1hcXUwczFI?=
 =?utf-8?B?MHR3Y0NXMHZMOHZ1TitSMzArZFI0NVRhMmx5K21Jd2xBeVAra2hIektuYmZv?=
 =?utf-8?B?MmZRZTZ2NWcrOHpGOHdQVVNtcVBKM3huSlFrb3Z0TWl2VkJpSEJGY3BuZUt3?=
 =?utf-8?B?eGhndHlQQlRHMVBKRUZZZkRBWmtBSGxoUGV2d1BEcExTdTQ0VHZObEtCN2kx?=
 =?utf-8?B?czRXTmhib3NycE8xcVBQSmpvRmJuYmNYTzBsV1MrbjVEa1RJYmIvQ0xuWTBO?=
 =?utf-8?B?UldRbEZ0SGNZRjl2aWdYRmI4clMxSWRObVhKcU81QS8wblRZZUQ2K0ZwUjZ5?=
 =?utf-8?B?MEY2cjc2Q0hMYlZuYjNPYlF6LzZHbDgrT2pMemhwQ1pNSW5xQ1FDUGx3RUV6?=
 =?utf-8?B?N1BTb0thaXpFV3NKdFpkcVloMUR4RkNwYUZYMHZPVUFIQmxaNHEwUmFYRkxx?=
 =?utf-8?B?MEl3VzB1MHgwdnh3MGFPQUtycGwvb0dMOWY3NEduWTNmY1JYK1hwaHA1OHVo?=
 =?utf-8?B?YnN1eGpwL1VPRFhuYzJSQ25NUE5qTStEREhHM3U2UnMwS25xWXh6aGJtUFRX?=
 =?utf-8?B?aHBKdmFNZXpKMmdsRy9lcjR5NGg3dllYbUNHZjUvNTkvTktkY1lpbnh4Q0pq?=
 =?utf-8?B?MXVlWC9FTlBxcEc3UXc0N2w1d0dIQVdUdGlhdGR1cmU0bGZSN0M1TXplOE1E?=
 =?utf-8?B?bmNMNU5WdkROUmFjWmQ1Z1prcHBma1UrUmtOaG5GWW5pUkdza1ZNN0tsYXJW?=
 =?utf-8?B?cis1NzhBcFM1Q0g4cUswRjFzVlZQTDJvTG53ZGVzMXVhREpCVmdDdWxlejNJ?=
 =?utf-8?B?NG1zUFFkNVVmTEM1VjZZY1k4bjdXVktiWmFKY216ZGRqeVdPdWpsSnpmc1lB?=
 =?utf-8?B?NmpvUWdnN04vTE5wY0lpMkhtWEFUb09TTXl6V2haS0ZQS2JzSFVuRUQrVTFX?=
 =?utf-8?B?NGRqeXF2OWprTUZUZ090OFNndFBEWVVuQ3VRZWtYVWg0YWxVam95cXJicHAr?=
 =?utf-8?B?dlJaelZxZmRURForSGdXUUlueWRMZm5RN2tqZ1VSNStmWnBHOWhna3RBek1z?=
 =?utf-8?B?NlV0UXBaL0hmWnZTUnU2WVBPcXkyaWxhRUUwRGRBaWRnMXFTK3dJNDR2L0N6?=
 =?utf-8?B?RmtXKzUyV3pWdlE3NmRPVy9MQ3RvSEVCL2dYdjJMbFByQXZ6ZUhUUEVITWZr?=
 =?utf-8?B?M3Y1MEtLZ3dmWGdvd0pGVWFqZWlWUjA2UkNIbkV4YkRjU2xJMHA5Wlc5YVU1?=
 =?utf-8?B?dXpBZ2lqa3loOFlpM2tMd0pMeDkwN0RCcEpaOU9LUmtTRXRuT0JVWldwbVhh?=
 =?utf-8?B?eHVoOUtXY3h5UEZBWmxzb3QzNDBtTnhlMDFKV2hKamg2dlZsZTc0QT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a93fe2e2-d50e-4bf2-395e-08df230af95c
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 18:03:35.1570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q5R13t5nD58/dI2vs+2OOsBAgNVfC38lBDroTxilohdJ1CW9b+WF2QZQdQnIUuwpPyWBdgPVnB7QCwzNXEH4Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB493404

Hi Jay,

On 10/3/26 05:05, Jai Luthra wrote:
> Hi Mirela,
>
> Quoting Mirela Rabulea (2026-10-02 21:46:11)
>> Hi Rishikesh, Jay, Laurent, Hans, Sakari,
>>
>> On 9/25/26 16:29, Rishikesh Donadkar wrote:
>>> From: Jai Luthra <j-luthra@ti.com>
>>>
>>> Omnivision OV2312 is an RGB-IR sensor, i.e. it uses a 4x4 R,G,B,Ir bayer
>>> pattern to capture both visible and near-infrared light. Every alternate
>>> frame, the sensor changes the exposure and IR flash strobe registers to
>>> stream an -
>>> A. IR-dominant frame on CSI-2 virtual channel 0
>>> B. RGB-dominant frame on CSI-2 virtual channel 1
>>>
>>> These A/B frames are routed as separate v4l2 streams, which may be
>>> mapped to two separate /dev/videoX nodes by the CSI-RX DMA driver.
>>>
>>> Both of these streams are captured at a resolution of 1600x1301, 30 fps
>>> each (60fps total). The extra row (1301 vs 1300) is an embedded line
>>> prepended to each frame by the sensor, containing the following register
>>> values:
>>>     0x4813 - VC (Virtual Channel)
>>>     0x321A - Group ID
>>>     0x3920 - Strobe
>>>     0x3501 - Exposure HI
>>>     0x3502 - Exposure LO
>>>     0x3508 - Gain HI
>>>     0x3509 - Gain LO
>>>     0x350e - Current Exposure HI
>>>     0x350f - Current Exposure LO
>>>
>>> This driver also supports a few v4l2 controls like horizontal/vertical
>>> flip, multi exposure and multi gain controls.
>>>
>>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> [...]
>>> +static int ov2312_set_ctrl(struct v4l2_ctrl *ctrl)
>>> +{
>>> +       struct ov2312 *ov2312 = container_of(ctrl->handler,
>>> +                                            struct ov2312, ctrls);
>>> +       int ret;
>>> +
>>> +       /*
>>> +        * If the device is not powered up by the host driver do
>>> +        * not apply any controls to H/W at this time. Instead
>>> +        * the controls will be restored right after power-up.
>>> +        */
>>> +       if (pm_runtime_suspended(ov2312->dev))
>>> +               return 0;
>>> +
>>> +       switch (ctrl->id) {
>>> +       case V4L2_CID_EXPOSURE_MULTI:
>>> +       case V4L2_CID_AGAIN_MULTI:
>>> +       case V4L2_CID_DGAIN_MULTI:
>>> +               dev_dbg(ov2312->dev, "debug: %s: %s = [%u, %u]\n", __func__,
>>> +                               ctrl->name, ctrl->p_new.p_u32[0], ctrl->p_new.p_u32[1]);
>>> +
>>> +               ret = ov2312_set_AB_mode(ov2312);
>> So, the group hold for A/B context is set right away, when the control
>> arrives.
>>
>> While working with the Omnivision OX05B1S, which is also an RGB-IR
>> sensor, we run into this problem:
>>
>> The normal expected sequence is that the sensor will output alternating
>> frames VC0, VC1, VC0, VC1,...
>>
>> But  when user space tries to do automatic exposure and gain control via
>> v4l2 muti controls, if the driver applies the values immediately, if the
>> virtual channels are not switched within the proper timeframe, it is
>> possible to run into frame duplication (no more nice alternating frames
>> VC0, VC1, VC0, VC1,...but duplicate VC0,VC0 or VC1,VC1).
> Yes I remember seeing a similar thing on OV2312 as well when the AE/AGC
> algorithm is turned on, and thus exposure and gain controls are updated
> frequently.
>
> In our case the streams get mixed, so in the captured frames for VC0
> (IR-dominant) we would occassionally see frames with the exposure/gain
> values that we expect in VC1 (RGB-dominant) and vice-versa.
>
> I had assumed this mixing was due to asynchronous nature of the control
> updates coming in, where the exposure+gain latch on with a delay of 2
> frames, but the rest of the registers in the group (like VC ID, and IR
> strobe) have a variable delay depending upon when the group registers are
> programmed.
>
> Without the AE/AGC the frames are stable (no mixing), so we must be talking
> about the same or very similar issues.
>
>> The information we received from the sensor vendor is that group0 update
>> needs to be between 2 group0 launchpoints (similar for group 1). We can
>> use the status register to query the currently active context, and in
>> order to avoid frame duplication we can update each group only when its
>> context is active.
>>
> Ah, thanks for the pointer, a status register for group launch points
> sounds quite useful.
>
>> This is problematic in the v4l2-api context, it implies that even while
>> streaming, a v4l2 control cannot be committed to sensor registers right
>> away.
>>
>> Even with workarounds in the sensor driver, to defer for later the
>> updates for the inactive context, it is still problematic: defer for how
>> long, and problems with overloaded systems, a stress test can bring us
>> in a broken VC sequence, as there is no atomic way to determine the
>> current active context + update the right group.  A broken VC sequence
>> shows up for example in libcamera as lost frames.
>>
> Indeed, I think we need some sort of a mechanism to enforce timings of
> control updates in V4L2 framework. And I don't yet know if system stress
> would make this impossible to ensure without enabling RT?
>
> But knowing the sensor hardware provides status registers is a good sign
> that it should be possible to fix.
>
>> Rishikesh, Jai,
>>
>>    did you notice this problem on OV2312? A way to reproduce this is to
>> stress the driver with frequent repeated set controls (for the
>> multi-controls), and observe broken VC sequence (I observed it with
>> libcamera and on the CSI analyzer).
>>
> Yes frequent control updates reliably reproduce the stream mixing on OV2312
> as well.
>
> Would it be possible for you to share the downstream driver or the status
> register you have used? We could experiment if the same solution helps on
> OV2312 too.

Sure,

here is the latest driver in nxp tree, please be aware that it is ahead 
of the upstream version, with some experimental features:

https://github.com/nxp-imx/linux-imx/tree/lf-6.18.y/drivers/media/i2c/ox05b1s

This is the status register we query to determine the active context:

#define OX05B1S_REG_GH_SEL_REAL        CCI_REG8(0x322d)

Today I also sent the v5 of ox05b1s RGB-Ir driver upstream (less features):

https://lore.kernel.org/all/20261005175102.2358881-1-mirela.rabulea@nxp.com/

>
>> Laurent, Hans, Sakari,
>>
>> did you encounter similar situations? Any comments or proposals? The
>> concern here, to summarize, is: v4l2 control cannot be committed to
>> sensor registers right away (even when streaming) and we are also unsure
>> when the right moment to perform the register access may come.
>>
> I think this is a good candidate for discussion in the upcoming LPC BoF
> session [1]. Are you planning to travel to EOSS/LPC in Prague next week?
>
> I won't be travelling unfortunately, but hopefully Rishikesh, Laurent and
> others can discuss this.
>
> [1]: https://lore.kernel.org/all/22a0424b-c67d-4dcc-a31c-26acd764c653@ti.com/

Thanks for letting me know. Unfortunately I will also not travel, but a 
few folks from NXP will be there (cc-ed).

Daniel Baluta will be at OSS+ELC, leaving on 6 october from Bucharest, I 
asked him to attend the RGB-Ir presentation at ELC
Tomas Babinec will be meeting IoB in Prague on Wednesday, but will not 
be at LPC/OSS+ELC
Frank Li, I asked him to attend RGB-Ir presentation at LPC

If it is possible for me to attend remotely these 2 RGB-Ir 
presentations, I will do so.

Best regards,

Mirela

>> Regards,
>>
>> Mirela
>>
> Thanks,
> Jai
>
>>> +               break;
>>> +
>>> +       case V4L2_CID_HFLIP:
>>> +       case V4L2_CID_VFLIP:
>>> +               ret = ov2312_set_orientation(ov2312);
>>> +               break;
>>> +
>>> +       default:
>>> +               ret = -EINVAL;
>>> +       }
>>> +
>>> +       return ret;
>>> +}
>>> +
>>>
