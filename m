Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010062.outbound.protection.outlook.com [52.101.85.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5394582D8;
	Fri, 11 Sep 2026 07:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113542; cv=fail; b=EiynBzhykEzfAspCCom2bfcn8la17M2ENUE3WnJiJ9xuh9ECN63x0isVBYps0mPNCLvnOf1AgEh8OkBvB0EGk8nRBaOTGIP7EXJd8HjjcnKyUH2ScZ7uZ03vFXAVt2PKL4ViUouUNkgYZrRLCMHC6MM/uQumC9lZWYNEOiqCvrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113542; c=relaxed/simple;
	bh=DW2O860wcQKz6+wKHs17g2R09eHwu5VAp1StinTimZE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RCnUCQ6sCS8lMAkCpvwYKfL958MrnBBZsBJ6FinCz8ysxZ3XLTzfuH4g+EbRoDi1wSEqT7HIx19Zs1z31H4yEluHRguOE8rnA+X9ZJbi4avm9h+7kX1D+ujoX0Cu0uZF4coJVLTdK8HvHXZlSYaPyUxR00+/zX9VI+sjmjbPAPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Aefpj1q6; arc=fail smtp.client-ip=52.101.85.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Aefpj1q6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDfKsWEMJeYokSSOJGlZnc5CvfJIsca60+c5WVTYhb9SWA6pWVUMESVsf04kkLKOL9uvyBMH7Yoxj57OOqTa3nb9cL3rIpoNOETYO5QIqqyJABJsSdbZwGfRpQH2p3XTI7IQ3yOgT04hbBDkpx8bH1Tv0XTshVQYxCtTdmCaa/fFrVIyVuXuw1J2iFCFW6U2K1T/Lq7Rmd6OBijWP7lhMDQwgg8ggoTZsBxr87HJTh7eIK2xx2OG0YouJYkkGGV/lQ8cLNYX/tBYVhHKU9WUH+xJCEd9ZVl5MrwfYYglhCSMYjIAf4aglgPXfvEzoM6FeM2/nxseafVBsZ8BwbohNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DW2O860wcQKz6+wKHs17g2R09eHwu5VAp1StinTimZE=;
 b=ncnHtq/X6bOpIUEMf5X12JQIk6cIgm3T/xrFj0IYBlWYFJiMWv+EhftUPHzt7TsxjEPZk6U6W2IlSDXZPYKQ2dItcy2onrtq20S99IcYgp4mhy5LkeOI05Ril+NHnFwWqw7SPBTGnJFUimli4cGCCWEbMEoQtbcpF8tkuGcOqJkI9haVVPMq9uVgMexGe7wdLFX5zgJYJRCpIYoJpJttwe3Kji4TxVD1VUtsl2NUn7TSaLPvBPjIyqFKc3eQR1TgA3G5aN1d7Xu7XACTR/HxsU/7CPfc6a6PiTvUEN0vTkLMhnMB8PuFumzpXgs/qi0Qo62BEfJkQ/RVKZEBAA85Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DW2O860wcQKz6+wKHs17g2R09eHwu5VAp1StinTimZE=;
 b=Aefpj1q6xy5ZuPDBApmWxL7/v6udPhED3CsmLT2wvtecFXzWyCe/phppLyxz0D+RkPhfDwhVm/bMCJrWLoJSCWTNemWcXe5lb0Tl3S6oEofEad4wQbl3o2f6jlihBF/PY3Lu3v3bMKrcSOqzw1jJUXbzB4vQct6WUZLYOw84npnJk327ZdmPGqRDgRlgf7DYjACLx3woN8s/8e+/oc7KJflqrPzcpcyhx82UKkE/a3/gYk7SXvZ/ibKBzBm1I73f9GFKtgCik/lFDyyWbpuSGNw3xKgYW08HgRGPrXdPslYm/FCM7wT196IzCSaDPN5akzpetbU3prmoiwyAsuboJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 EAYPR03MB989276.namprd03.prod.outlook.com (2603:10b6:303:2c9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 11 Sep
 2026 07:58:58 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 07:58:58 +0000
Message-ID: <8e69bb7c-a98f-4a33-9e26-b6aa17f07ad6@altera.com>
Date: Fri, 11 Sep 2026 15:58:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] arm64: dts: intel: agilex5: add USB3.1 controller
 node
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
 <17405f3736bb2fb20456d00b7bb75ffa8c1311b9.1788886615.git.adrian.ho.yin.ng@altera.com>
 <20260911-courageous-ninja-gibbon-9f8b0d@quoll>
Content-Language: en-US
From: "NG, ADRIAN HO YIN" <adrian.ho.yin.ng@altera.com>
In-Reply-To: <20260911-courageous-ninja-gibbon-9f8b0d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::29) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|EAYPR03MB989276:EE_
X-MS-Office365-Filtering-Correlation-Id: 778f10bd-03ed-4726-23ce-08df0fda8890
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|4143699003|10067099003|11063799006|56012099006|55112099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9QJDVz0LFoaU9IISkI+nIWmyQa2dw6lDpzQFMb9NtIV2P6xpc+7r1N65qbBKR/3Tn+A6OOjQhjTrYZ5IP2hwV+8AJlNTlsKyG3lZt78YV17DIy8qBYMqoe+KApTsKMyVCzR0aTbR6P6Dbs8ix49S5Y1oEEAheV7pzL8U8gGnMitJ+MygF5W4rRjiIa3ejaw72iVOskyovDYHtuIsANhmCAhirO9UsK6b3xCoDzxwqdvMxL1H4CQAo1tNBMR/SHxdNW4m2EhCegEX/nfsbLZKtWS1qRoJ8pE8FGHW0BOBlmyNNYHMjlRCRmyrEeqBSepfiuRO3P0Iev+LPYe4lxiY7pznxrKghj5FiitkBg3Yk1lt+DAKaMhyiHZekT7vVZy8N0tD3oWlOi6Dq5Th7RyRGhgn1f9j613a9v0jjul9llam4w4+5fxdVVybRaWXcyGBwfmNmCVLWJ5wXMdWY/I+tQsDEKUcRvqOzO7mAULNX1ScHoew6j9MDKD+mePrI9w+1aUPCD8sOET77/Uch527lJEn2WMD153lII+9j4EYQS6sl78OFMUyeA0pp/y55DViiZrphZ+Zud5k8t7CXC8/tplt+yPzZ4ExlpEsFYTteQEnlpvnjQVMjWUFR34SRRqgyzLjlKdH7ktNL2mIBLCewKohl2ozibo842sSA856Ne0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(4143699003)(10067099003)(11063799006)(56012099006)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHdlYVdhUk5ORDB5S3IxV0dYWGJ5c3dlV25BMFFBQlNyQlRkWDAvWHNoNnhm?=
 =?utf-8?B?MzV6eXlma1VBMnFuYVZNTXBMNHYveXZyeXFxcFlaa3c2a2FjZlg1WkJnWTJE?=
 =?utf-8?B?N2dmMEM4ZjVUWElhcFROdXIxWEtYbXl2bWZ2U1pVTVN2d3Z5bXdyaFc1allH?=
 =?utf-8?B?RUMzNitHRm4rdjc3dmNOSU9LbXVFdnZTa0p5dDhkKzBwYkh0UGNMZWQvd3A4?=
 =?utf-8?B?VWZwdnFacGxxVk55T0cvMlVIUGtXRnJNSmtJbFNtcWJWRXBxNUl6ZUJ6N0xB?=
 =?utf-8?B?YTdFczVMMFV2bGxhQmR0anpaZVFBeW9PTzhaVUlzU1h0czRyVkMvK1VibG9v?=
 =?utf-8?B?WE50bTlReDBiL2trLzloU1dFY3FpYkU2cWNzMWQ2R25mdTJKS0ZOSFIyUGRC?=
 =?utf-8?B?TXBUSVorMllEV3FhNXAwZUJtb20vOWFmMjRobDhQRHBuVGdWZ0puRzJjdVQ2?=
 =?utf-8?B?RE9YSTQ2WnZoK3JiWkxhbENEV0dyTHFndndaaVc5NCs2N0Y3QTB1WnhuVEFt?=
 =?utf-8?B?aEEyMjBjcXJENEZ6dG9Yd3FEdzl4OHM1RlllV001TEFVMGRMZFVpNW53ZzNE?=
 =?utf-8?B?dUJ5QnlDWjFEcmxNSXRSeHhrTmNoR2ozT2lDdkpEcFhQaGYzRFpzUkZhdUFz?=
 =?utf-8?B?bVRKR1Exdi82b1IzRXYxN1hXM2V6WjFzS1UvWGlqM0d3SEdWQ25kNDNVcUNu?=
 =?utf-8?B?Q1ZqWS9ESk9JVGtHU1E0QUozelZvaEJvd3ZFUGtGVXVLUzh0eTlsUlM4UHRU?=
 =?utf-8?B?MjNsbHplbzB0RzJxWW9LbnVScUhBb0NGK1c5SWpDYjc5dUowQk9YUnJzSVht?=
 =?utf-8?B?Kzh1eGlIOEtNZk8vVW8xWHdCaDNRbnJpaTdiQlIwT3VRd243a3hzbGtkRDBP?=
 =?utf-8?B?Y1VYQnNUSklTaWV1dnJINGNWSENocFZ1a0pwMUpKcGpOamFCWlkxNnJYNTFX?=
 =?utf-8?B?SFhaNGRVL09nOC9nWHVSV3ZnVnJ2N0xFb1hvNkdFQnVHbStrMFhQVG1XUXVO?=
 =?utf-8?B?ME1BNFRpcXBzU0R5RHZaMTF5ck1QbngydTRtOUNFRERUR1o2dzZMZC94c2Z1?=
 =?utf-8?B?OVFScDRTeGZGU0RJbVpja29iVUlNSTNXdEJCN1FZbndDSFI0ZXhKZzlTbG0z?=
 =?utf-8?B?ektrU1JZUHNmWkRhZWYya1NjaHR6Z0U0dGpPUzlEUURGUGs0OGxZMS8xUkdI?=
 =?utf-8?B?akkyWGQwSCtkak16UTF2N0FNTk5BT21JZkFQYWYwRDVJNjlXRTl4K2d6d01l?=
 =?utf-8?B?ZDNGYjhLS2dSSjBwZFQrZ05Pd3dvSFFDQ21VTyt4elZocHJ3dmRUc1VjK0Zu?=
 =?utf-8?B?MDh5a2l2TUh2U3RjajI1STEzdnhXeGl5Nzc0cDhyTDJCV3d2bExiYlhJZ3p0?=
 =?utf-8?B?dTk3TGxTT1NXUUV1aEI1Q2t2YTlQb0I2V29yc1NaMGJxM055c2JSKzBmdVE1?=
 =?utf-8?B?bVNjTWNMK0Z5d3dnelZ5bnkzb21QR2UyT01UMVQ4WjZrMi9NeG1RTXQvazF4?=
 =?utf-8?B?NitrK1BkS1VuZzNKK3E0Z2pHUXh6bEs4aXhtUVVsS0dLQk52b0JRNGtUQUlP?=
 =?utf-8?B?ajZzaGRoQ0J4cmE5Tjd0aUhzM1JvOGZ1QWZzVU5uTnVtenBEK0VwcFllQnUv?=
 =?utf-8?B?eWdmZmJSS0RqV2JVNHVwbmxlcWRhaGg5MGZ0a2YzcnZXcFdlYitQM0kzSGo4?=
 =?utf-8?B?SS8yWWVKWko5YmxCbEJYVWIxdEpUMmxKMy95NGg3c0xnU1IwVHdQYmZCR1NU?=
 =?utf-8?B?bmkzYkIrMStqS3MwRlNHRmt2NDE4eUhwbm1UYnN6Y3E4cU5uOFk2c2dlRE5m?=
 =?utf-8?B?ZmpVaWk3Zi9WbmNSWDdVU29VdDMvMmh4U0Y2MEI5Tml2dHh6cnd2VTRld2Vy?=
 =?utf-8?B?TnZtNm9iS20zS3VMNU5vVHc0ZFJwaVlaeHlJRjRaeUVrYlNjSFUxRzFqMEpR?=
 =?utf-8?B?Q0pHb0NVbmhjdEptaDEvQUYzUlJmRTRQWXFBMWNteWEwQy91L0VuVHhxUGo0?=
 =?utf-8?B?ZEx2T3NxbHoyMFA4SGplY1FNSHlKV1dDbTRYRUNDaitvVDNOVnlsVXRYcENZ?=
 =?utf-8?B?MmxGR1QrS1BNNWY1N2xCYm9kVXhlazdYaFlBdWN2Tk81dFh2TVFiWVkvTGhX?=
 =?utf-8?B?S3luMVBSL09Nb0VMMytqNDI2b3NYLzJWWXNKUWZWTDg5UFNKMmdCc0wyQnFr?=
 =?utf-8?B?MGc5TzYzUVlhMlFpMGU2ZWhqejd6NTc5eEgvb3JoVGFJcEIySGFmWklIaU5G?=
 =?utf-8?B?SHBJUWhiQ0F3QzVuMDEyblhrZ2l4cU84YUh6S0h2d1lJRlJmUlNXYlVoTzBt?=
 =?utf-8?B?V1VITEhpNWxjMFVzcXhyc3BUMUNNZmhBOVk0c3FYOFdwankvbkh4b1JGMk5J?=
 =?utf-8?Q?Y5JZlOAWa16/l0oo=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 778f10bd-03ed-4726-23ce-08df0fda8890
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 07:58:58.0398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMgK5j7T+xGs0oE8wlEISlgwLMHtHpduBdxwFXVcy/R2CkdgGrgA3lNLNMfWWFvgCh0MbcRavFO9MBIFNeouD9/Iwb9ZvTTDF8GFnDA/6zA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR03MB989276


On 9/11/2026 3:21 PM, Krzysztof Kozlowski wrote:
> On Wed, Sep 09, 2026 at 01:04:38AM +0800, Adrian Ng Ho Yin wrote:
>> Add a DTS node for the Synopsys DWC3 USB3.1 controller on the Agilex5 SoC.
>> Place it under a simple-bus with a 40-bit dma-ranges window (#address-cells
>> = 2) to match the USB DMA address width of the interconnect. Enable it in
>> host mode on the SoCDK board.
>>
>> ref and suspend both use AGILEX5_USB31_SUSPEND_CLK because they share the
>> same hardware clock source on this SoC.
>>
>> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> Same comments apply. From 5 revisions ago!

Hi Krzysztof

You are right! sorry for repeating this across revisions.

v1 feedback was that DTS must not be mixed into a USB-targeted series.
Splitting the USB3 add and USB0 removal into separate commits inside the
same USB series did not address that; both are still SoC/arm64 DTS and
belong outside the USB tree.

I will send v7 as two postings:
1) USB only: dt-bindings + dwc3-generic-plat
2) DTS only: Agilex5 USB3.1 node + SoCDK enable, and USB0 cleanup

Thanks for the patience.

Best regards,
Adrian
>
> Best regards,
> Krzysztof
