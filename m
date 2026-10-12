Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013032.outbound.protection.outlook.com [40.93.201.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B9448D879;
	Mon, 12 Oct 2026 12:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808899; cv=fail; b=RpgU/nnHjDGowyzbpbJ/KZEfFip4escAfeX+e9p/3ip6iXNkrh/BnsnJ48V2pKz9zmGB1xZ7Q56EExvuiCQ2+vJ4AManeLdS6onyjc8uLzbHs2zgwTLMo61/PkiSWLtITjtp84VOjPmmZH8QyIYgpMxOnlqAoYXxBYRr5pKDv0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808899; c=relaxed/simple;
	bh=JLDSQAa2SiNRk8Mtpqyqwwn3lnmQvknreSsslDUIvgk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W8RuQys7xjzpHp/AwKS2neS4CsX9GuPwhxQBnKBb1PdsqPVtF2IzRPCus3LymHzY5qhTVG8Cs7ZbMscUVaKfi4Wv5YBgD/kvAVarPtG0q7seNUHMTVfTXMlfzNRekqCzTwFPgeqt7lXsRG+GCR8+BFT7BMKZx2q4smuYZ1Qjtl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qU5qtcRt; arc=fail smtp.client-ip=40.93.201.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qU5qtcRt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wi7P/2bkrZsVmWaks7Qr6b+E9pe7hajD9zrKQNE6TDXTByLbn+b/yJUxyrpDSloq3hMTuI6sYDa+UyleqkBa90FGBLDGhQEf3JTa0g7yZ81ZPPwsThj/fhhnPBDmo2XxOZ74SGuWo3kta0B8ibIfM25HgqQ8JbnCeRvRFEbHbvFaSmsAVqEQ4sqPQTl4hUU5LM7SLhdGo8BON5PGJoua8ItC7LABykDyVmiMAPS0CeQfa8mIav2RISYNG1L/mTTRLOJJQ/p4sgnd/zz2W6yVTfIk4GesIozxhJlPVVdlE5xbipjSc7iMo3f6jh2WXuy2uDLeclgBO48kGDBfOANwGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zy5IfOVTwFFg3r2AuopReV8kofw/BQLRKc3iZ96G0/I=;
 b=xVQBZ5QqisQy0GCrUJKSxWnopYSkiw99xKhots8gXoX1AywnNDvkhfRfcMF1qVahovN8O8ygckCZZXWl06M1QJ2OCmptsHVvpFIssgcv234topqmPsYn5B+v/1kzyKiDzcneZzCOxL16R51J8mEXvySgCSi4D8iWHgGBKmvPi5nVt4fg1XBJMnP7t7YaBJQSaP9rUlhI+6P1g2K1ZA60YqRyHComxysCt0Z628uiV6ZR+l8/3BOxM0hYLQKMazVw6jnYzV2ZiHLXWfTR34nvFF4k6xzKc8BKn6qpr7dQi+i7Yqs5SHy7yU3qLq2IhoH3N8A7cC2dNc+2hxjOu2o5Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zy5IfOVTwFFg3r2AuopReV8kofw/BQLRKc3iZ96G0/I=;
 b=qU5qtcRtWGwEmsCQN3iHjP8yxz7yXN1E3ZFWHfWQO5HGgd4Rd8WCW76EIz2ssGyfrDW6uficA47IC+1OPJ1Vc/tP1FV8D1rha2LnURWKeHFIaUtwERsCaXnQ9fsfj4H06B7TxhS44Yr/MBZtaopXoT5G/uHMiX4z7DFa/0mx/DM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by MW9PR12MB999207.namprd12.prod.outlook.com (2603:10b6:303:301::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 12:41:35 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 12:41:35 +0000
Message-ID: <df09cefa-6c7c-4b5c-8215-1a1419fbbe9f@amd.com>
Date: Mon, 12 Oct 2026 14:41:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add ALINX vendor
 prefix
To: Pufan Jin <2254650260@qq.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, andrew@lunn.ch
References: <20261005173039.707304-1-2254650260@qq.com>
 <tencent_C77DAF0026980C137B8C46907F855FC9E506@qq.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <tencent_C77DAF0026980C137B8C46907F855FC9E506@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::15) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|MW9PR12MB999207:EE_
X-MS-Office365-Filtering-Correlation-Id: 7487053b-df6b-4834-ec51-08df285e26c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|11063799006|4143699003|261009223027099003|260925021911599003|260925021311599003|260925022911599003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ew49xLf1PZnZnCNw3N668Y7Iw8ACLGOba2Xr4b0x0sv8dfic6Sr+4L+3DrM5v5RrqDv0lpskJiOKOPrQTydBtC3w4XqXfXQ4hDoQ9tJqPDSFFuyuGyhFci/WYtHvVZq4C8+NXRtmXU7HH4TSKray9R+lGVcKG4I2QXWyAoZs/lxgVfDwd0/DSS9rMAwQKoD/azPt7LHpkL0cqU6gWE3wV2Ff0N1hzYDlLMyKvFY1Me9ch7xRy5ewsVqIpPR28edKKndUe1DzUM/oQY/fgkSJSg23CQhX7QKeutsS5FK00UHU3nvW0yKx7tejqJOu4259rSFtlB+0zGNUlJvq6gnlqhyeT2yxdN2+HuZEuwVnw99xtZWBz7Ss+D3HR8DWnTnSGGObJiMDi5DpfF4trEIYSbYVcAqldZDTyj+mzu7lfp+YEeJ6mV91P5COfNXHKgBbFycG38bYfR2Gkz2/6klwRUerDB/bLPWZRGOeEKVWtqCK6msTUDx9Ea77LilFN4gg9vrfUjUXNhYIokoa8fU/lOsy3/4Va26jwM7QKXZCAsZFoVlvRtmKrAZcQ9DNo05jeyMnU3e+HqfxUntOomeDSVRANHVRmDUAlLwXKy1ljXDnV8EPxy2nsbzNYeFAinHF0arO67jYPj/WFSTTv5O1tIKHXvab8xy8Ru7iVvgRTHo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(11063799006)(4143699003)(261009223027099003)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUpUYXBBaVNRNkVnYUZucDcwaWdNV282bnZxdnI4eWxZWWNlMldPS2hBWm5I?=
 =?utf-8?B?bHBVUW91SWVsUlIwR3p4TkZTamt6S3FCWlFXVlNKNXdEeWkwdUpyOGVJajBB?=
 =?utf-8?B?dVJvQ0tBTVdGbzJTblU2STdtVjR2NXZ0M0NCNmwrQmsrb21BcUhEWW9IWkgx?=
 =?utf-8?B?c2hJQ0xPWE1KSk9aMjk5NkhFZ1c1VkZ1VGViSkRFaFAzUnlNT2NzNVUzYlhu?=
 =?utf-8?B?N2xDQ0ZKM0plZ1VLdE5DaG1wK0dmZjgrR3NDdEd5dkZOSnpZWEVLODh5OCtm?=
 =?utf-8?B?T1RramM1S1JUUTZNbGt0SUxvSFlubEtYY3l4NHV6a3o5VkowcDRLUTdkNzVG?=
 =?utf-8?B?KzVGbnl2ckw1UmVZRk95T0Z6M0hhSE56M1JsQTExQlI4aUNZSGx3cnhNWVpp?=
 =?utf-8?B?N0N5b3dXcGFoSHlHc3JsckZRa0dSR3NESUU3d0VUb3dJcXlnQWVTZmc4ZzRX?=
 =?utf-8?B?TUE0a250dStPcVRPcmphU0hjSjJKcnFoZzRWajkxbVI5N0tFV0gwS29WZUU0?=
 =?utf-8?B?QVRicnBGZ29RaW15enpJQ2FtYzJkRFJZUDRVMUNyN0dUZnpzU1JRekV1RG5y?=
 =?utf-8?B?S2VwaU1WZzg2QlNHc0MySzFjbXUrdVRnbFo3TTBLM3lzVDFGRUlla0M3TXRV?=
 =?utf-8?B?bDZPbExqR2VwRmF1Qkp3cnZnZERWRHNaQWQvR3BPOVo1N2RGdGlhWTNHVHIz?=
 =?utf-8?B?UE1hNmc3bEpRcVAyTGtNOXprelYvenVJSmxCVlJldURGOEVXM0ZmMDY5Tjlj?=
 =?utf-8?B?Y201ajF5RGEyeklrK1k0SDVQL2tDMWZTU3RuUlBUanRIRTJ1UjNoWXFWRkNy?=
 =?utf-8?B?QXFzL3RyajdWdEIzZ2dlOVhNbWxzeHNYdjkwNDd2Rmt2UVB3TGJBSWxheXI0?=
 =?utf-8?B?Ujl4aVlOdElYQUJsd0djMlVpTHdxZWtzdFdEa2ZhZ1RJK3NTa3crYWtkMjRp?=
 =?utf-8?B?VzFXUHBLSkhtY3ZlZ1d4YXJ3Mjk5M3FBOERIK1h5UmJWaXJNcUtqdjJRWlJs?=
 =?utf-8?B?MDdBaVhIOEV3T3RYUnl4ZXkvRTJmaVpYME1zdzBHYzlmQ3FzdVZwRkZkK0E0?=
 =?utf-8?B?R3pycGQwblExc1IrOE1JUzNZVjVXZEZvWHBOZDJqeVhXYUNQbk1kTGEzYXg3?=
 =?utf-8?B?YzFBK3gyUDJJMWhnVzNyU0FPOWZLNjJJcnR6S1Z2T0tMa1h2MkU5Rk9mMzFp?=
 =?utf-8?B?UHJsdHRhNVc2RU5jOGhVa0tHQVNNMDVERDA0YXFnaHo4STBINUt4ZGdDM2Rp?=
 =?utf-8?B?clA4UjBHcHhScVZKOEFSSTI4YWtQVkM5M1gybi9kZUhqb2FNSTlUVDhMTnZ3?=
 =?utf-8?B?QllhMlRkTUN5aWVoS2V5OUkxS21QbVVnM3AwM2hESEx0c2lydTB1b0tkWjBC?=
 =?utf-8?B?eVZUblB4a1Y2RmJ1MWNVa3pxUFZRN2lQclBjeFR6d2dkeU1EdmtmWE1JQnYy?=
 =?utf-8?B?MXJ4SVBza3RlM1FQZU9EY0RxS28rWHc5V3I0eERJbGkrbzBkbThtZWR0dVkz?=
 =?utf-8?B?UG1DZzREaC80Wk5TTlhSa09pM1ZNMW4xcTVxOURYWnJ3ems5cnFjS1pxU3ZU?=
 =?utf-8?B?Q0NDZGVhZUZ2R0JrL1hiRE5IUW9pVFBBaFp1VE56WFprMlk4M1Nic292RTBR?=
 =?utf-8?B?T0piV0I0RWFkakdkMjZIeDk4Tmh1TzA5T1EyOVJoQkdUMGhSUG1PbFNuZVMv?=
 =?utf-8?B?WHBaY043aFZxWGh3bGZ3SWpwK0NRMHpMUWRhM253MVoyeWswait4eVYrdXQv?=
 =?utf-8?B?M2w3R3JrMGplZlcwWWhlcWs0T3RPM0ppRDd0NndOb3gyK24xU0RuWTFDWEMv?=
 =?utf-8?B?bWV1SFBxZWc1SXRmbVVIc2FJMDduRG5HSVpjdWQ1LzBIc3FHRCszekh4elVR?=
 =?utf-8?B?OXpPMEhrcE9vOUZvV0wyaDJiSlYxT05sd3BDalBPb1FhcXlBeHVQZXc4OEVC?=
 =?utf-8?B?YmJ3UmU2QU5yQThWYUJVSFZGazNaa1IwNzZVbUN1cjJkcGFrd0E0N1VadTQr?=
 =?utf-8?B?cXFNQ2p6Rkw4SC9PV2xUQ3BtYlU2b0dwSDJkSktwY29wQmhwdTI1REpHOTN1?=
 =?utf-8?B?SmlqbFFxTTBQZTI3eGRld2ptSDVCNVpObi9NREp2aHlQSnZrbDZSTzJvTHVQ?=
 =?utf-8?B?VHB3SzVNT0FpYkhKUjBBL1QrTXJudUhoR1RjSWQzdDZLZi9ZK05iWHhwRUVw?=
 =?utf-8?B?QzhobGRHUHJxMWJQS3hYZ0lqWVFSRXM2T3JZa1Q0Y2IzNXlBWm5Cdm5oSkJp?=
 =?utf-8?B?NGxjSVF2ZjZEdzhqUnBYSWpxTmtaci9uTlhBY0hlTDhhNGtpYTBDQUF2VlpG?=
 =?utf-8?B?ZmtsSTRXSk5GaGgwTVZTRHJpYThmSHQvWlo1eUhxMjd1NDhiZHVmdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7487053b-df6b-4834-ec51-08df285e26c4
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 12:41:35.3554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQGXxCOjtdiD1LSx12VjD+f94ADUtof9/91GdEao+7JemlpZajDE5Fd1l5DPPeRk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW9PR12MB999207



On 10/5/26 19:30, Pufan Jin wrote:
> Add vendor prefix for ALINX (Shanghai Xin'yi Electronics Technology
> Co., Ltd.).
> 
> Signed-off-by: Pufan Jin <2254650260@qq.com>
> ---
>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index ba2002969..97e7ef340 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -90,6 +90,8 @@ patternProperties:
>       description: AlgolTek, Inc.
>     "^alientek,.*":
>       description: Guangzhou Xingyi Intelligent Technology Co., Ltd.
> +  "^alinx,.*":
> +    description: Shanghai Xin'yi Electronics Technology Co., Ltd. (ALINX)
>     "^allegro,.*":
>       description: Allegro DVT
>     "^allegromicro,.*":

Another separate thread. Ignoring.
M
