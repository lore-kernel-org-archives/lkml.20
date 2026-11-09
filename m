Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794216530;
	b=JlP4lUMN9pPo20a6vc+AIMin7GreAkHlR2i9cAPftHYk8Jag5OODXwcOEpcLzDrjqiqG
	 HRaUhsWEYfQE/i00E5xdbgsGapeSVH0/pnEcINa8WG3K6XE10T0TWQCRguwjhG3m0mKlB
	 TIReYFUNwMEiFLthRFrpzlFF6EwSjZUfWp8E56QVZ5I1MzY3xrUI6izzIjsgse/3LGN2q
	 16FM2WHnGWNrBrnYFOKkKtDoNA5A3/lcI0i7K4OmV5pO/fTdbK/Dm37bD5+yabIRJCeby
	 IuYHXE0LTmFqVoOIRdzFcCF9IxU20RkoO6A8N8LcD8b7wmigw2sfLWTmRclss1QgqFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216530;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=AK236fqNk7tKsGhDQcCG2hLzYXXEM3Pjaykmc74C2Tc=;
	b=YKuN+pM+N1mUAgDbA4GMkTXynJDEy8GcVG2rEJC6HrKLA0wy20WjzWvSWInXYhssEE6Q
	 7W9zzE+uTRZ1akvs9shiDE6JxwLc4HFWyp7GY1cDNZjWQZ53bggaZmwBWDD3uTWur3Dp7
	 dxFopBYJ/2gho+T1xQN5tV105Zji5aDaE40fn5cjEY7fe17BJ6Lu5VmZFaiVKmepfapVK
	 Lb9DeCe7AnnjE83O/HxI3MuTaChdza7rwm/DneelJ/vzTYVw0lZ5SUYYij7JZ5GYV9r5P
	 NAVkIaDIM4VNK74NV/QuhauXjum662UK5R7PijmpphzE6E1WtyvAuN/ao8vKVTawHkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nh7xE3Nm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.9
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011009.outbound.protection.outlook.com [52.101.52.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BCA606D832
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56BCA606D832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nh7xE3Nm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jf5la4ck72Sx/C9IU6Rfiu/sbnyQvIcj+vZG5LYXYAzZ7Ol1PWVv5tdZS2J9xzyNFtTiziOl+HX9yvaNPwcD3/u6DVlpsDgISE5/qR7fsDLhaFgP9aRkWnBOMGb3xWHjexaaLI5r50Zd5iuiu2SPwuu9UC4kTROkepHMJPkGeSPT+oEcVuiaTxv+lCe9X3iVGcI1Zu47+vK+kV3KCUWgmAkbC0YkIdU7QFSkr8Ts4tfixZuIc+D9hjeLLJG0lkeoyZpzwHLJYI89wBalrn2Y6O/KW0+2ASJXO1XSY90zBijEkVzuLk+x6+hp2nWN+8l61IzEBBgUfdLHIdynv3eoKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AK236fqNk7tKsGhDQcCG2hLzYXXEM3Pjaykmc74C2Tc=;
 b=WjDfVreknXndhfdUbZgARUyhuVIzEpwOUv4zP7wdphcEc3NM80Y2Zh/Re1ZYYr8QDE6HHtb5wvsswKFvYg1HbWB7i+rTWlJ0QWuhb5qk6Oo2TmTDZpoHx3gMT3iTQdtCSK3Fdb2co45N1wHYus6sVYp8IC3RHQbpZsiiOv+QRFV83PxbXVy2cux1ZE23shNPSLou2dqX29Fo0L84iGR2YBcDpWI/gPhENQo80ruU91UCUNATTqsNyo82PJF9FLnYhNK/V54WpNyg4NRDE9b14jZsJYzrBGkAiDaPqo5jrUFU2NyO3BkSQMu5+tp8quclT5CUHTr+lXSuEOXNNjstnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AK236fqNk7tKsGhDQcCG2hLzYXXEM3Pjaykmc74C2Tc=;
 b=nh7xE3Nmu9qF73efM/2QZMYpyc9pyhqweORhatyxxjqAW2CymxgsNh3cAQA8GmN0NZsCjnfdp/YRXC0aLaaxBj2P8kjn4Knk6veozQdDNaN0EHMMHmExei5OjrRlglodxUn7Q/ZRgdHDV/dLxD2XQq+x1MHiaLaxVQ9qSgLG1CQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by IA0PPFAF4999BF6.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 09:28:45 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 09:28:45 +0000
Message-ID: <2755837d-a7bd-4220-ab80-5a05289424c0@amd.com>
Date: Mon, 9 Nov 2026 10:28:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: convert to subsys_platform_driver()
To: Brian Masney <bmasney@redhat.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261106-mailbox-subsys-v1-1-a0696237223d@redhat.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20261106-mailbox-subsys-v1-1-a0696237223d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0164.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::19) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
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
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|IA0PPFAF4999BF6:EE_
X-MS-Office365-Filtering-Correlation-Id: 734718bd-c825-4982-c982-08df3e43d9f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|10067099003|11063799006|261028144727099003|261022075727099003|261022105027099003|56012099006|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	x1E7dtu7TG5V/MgC3AZr5NpJAwuhMkKYDYGmIMg+AtOVPtW2srYOWO0T8zG5YpP8KJSk0ISYasaA6ertaDH7rZPA7S6xfjChiSH8AAaEb55oZpM9JyxXS0DUbFzP2NpU5lXw3lI/FRJeKHucrWH5lo8/+v7UgeDlsyBcADxat2Gi6i5f/27UoN/ZhoTlcveFuWO6tQPWzvsYnoLqulfDlatQpHfaNVmzSBeX62tnEVdImuM5o7qJH26MgU7RB5OjD1nAbOE4eOvh3Yp48gDHx/mCAQnARtGzbupKHMwTe4hbr298kmAELpuXp4GZTf5dgBgOyCXpAa2ULhKp8JQ5RrfPgHNvj/VwVITxBdIbQyafPhi6CY1Nha11kB+LZImAjdEBlu/5oN+ohuRdA6Ni45mfa+mAu86uI2+LcQlDfeHN0TM2a8MhbLWsfBy0ZCN72EMwlCsFJRek3XJQ4CWFTbkvk3rUUWHNVHrIMcspE5aEVxxU7FlRmM2+rT8oloW39IA1kUJO9Rbp1PDo68SsLJvrH9hxrSFoYU2Pq75nXi2ttye9JEDnR/YOZVpZbk97wwuULFp1pX90NhJC/5f9K+YsoaHRuFODLBJwTnAh9SagIpN2GVR6mOj26ggVO+1WVQGlGVIpT/BVabm6tAaauyJoewwMel2RlWPdqu0fH/k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(261028144727099003)(261022075727099003)(261022105027099003)(56012099006)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHQ1bEtVWXlNTFhyTHVLZzNISmpxL3lGOWF4SnJGMXZ4dXJaME93TUxYSHNs?=
 =?utf-8?B?bXJmV2tZMHlCNi9tdXlFQTgvWXVaWHdOTFdZeVk3YVk1QWtxYmtYZXIvVmJC?=
 =?utf-8?B?TExmakRCR1ZqZU5RWjRTbjMzQlFnbGp4bkE5V3p6OGNTZStxL1pmRStjbmdJ?=
 =?utf-8?B?QU1TZjhwWmlJdElrNG01L2ExWG9hVlJ5S0xqVmgzMXY0M0UrSVVBSmVmeW1n?=
 =?utf-8?B?WGtmSXBEdGZHRE1icktGcTlYZktkbXM4b1V0SmZuOEs3N3VhVnpqbXhOMkdU?=
 =?utf-8?B?eTVJN3hUNU5nRXJ2WEJDRXZlMkVSL0tscXBVOHNEYmxFYk1QcCttTHUrRkN5?=
 =?utf-8?B?WDROVld0bHNJd1RacElzUHJid2pucWw2QmNsQjF1eFV6N3RPa0YxT1huaFhK?=
 =?utf-8?B?d01od3kzZS9UcWhtM0p1dlplZnhORWRKbEtQOGdWVzlZQTI4OGNLV0EvNDJY?=
 =?utf-8?B?TWFhMUcrK1lEYko4QUU0dlcwMTJ6YllEUU03WmJvcVVnWjNtUVZHQmdaSGFP?=
 =?utf-8?B?RE5EN2NmUzJURXRVYkErTTBERXdaQzg3MHZuc1dVK0xyVFFxZ21uTFFNYTJG?=
 =?utf-8?B?NHdkRC9xVUlsTzNsN0VoYzBVMXJ4QWZDd0dpSGJUMFM5dzFHUllyYjY5R2p6?=
 =?utf-8?B?V1R2RFFndk9Ra2RsTnJuQ2syMTAwSXAvTysrOVFjRzJxVTBoSURRVXJJSjF3?=
 =?utf-8?B?MmhhdzNCRFg5bllxclB0ZnE5ekcyK3RpNmMyQkJtZmxCOExBUklvU2RUTFJR?=
 =?utf-8?B?ZDVrRFJNTXNIdGw1dmdQa284Q1h6RGJySUE2QmxLeVJKdklSV3BjbGtOTDB1?=
 =?utf-8?B?aUJtWTV6aWI0WUI5NUVib3NvSkpORDU1MmJYOUhUL05ZQlFvRm15aCtlWFgz?=
 =?utf-8?B?SWNKY0t3VS9kdmpIS3VlYll1ZllPQ0t4Uk1lQkpQQ2w3VDREUzQ2YVRDaEpY?=
 =?utf-8?B?TkI3amNUME5kcUU2Tkx6TlFvVW1HUm95NTlJQlNYSHpIZjEvUTFLTlR4a1g1?=
 =?utf-8?B?bnlkcEQ5aGU0bWZEOUdLRm9YaW9ucE96NTgvMkR3TWQrQlBYNWhTU2VSaU02?=
 =?utf-8?B?dGx3OVp0TDF6RUtUK2phY3pZd2c4L0xYTU5Ib1lxSmVJL1k5YnRSVlRpRllr?=
 =?utf-8?B?ajFvN010L3JlZ1ljWEcrNVl6SlY4SWZkekdLOCt2aGpwUWVFdHBFZytHdHUz?=
 =?utf-8?B?WHFMREpUTjdyS0EyUmc2S3NBYzB0eklWSjNnK1Ixc3ZJYUFXYzZwZFppZ0s1?=
 =?utf-8?B?VktwQ040VzVVK2tyMkhIc1ppUHh3OXlxYTUzKzZmNGNYNS9RQ0ZybU5KYlZG?=
 =?utf-8?B?VmxkV2N1di9QZ2l3TFNRTVNzNkt1djRwOEFQckNCeFdEVDFvOVZ3QW45Qkk2?=
 =?utf-8?B?TFljc3crZFQ4VkQzOVZIQmIrS0EwRU9LaGNJOWRibGJNdlFuQlpaQUxlQmho?=
 =?utf-8?B?bW54cVRTUmlFR1FGeTN2bisveFQxZVhqNDR6MFVZeFFTL0JSNnVoWklRYkNs?=
 =?utf-8?B?NndnTnR3WUIxOXJTQUQ2ZElyUlpZZzNxQk55U01sVHpvVGRVd0RIZ3RSZHlP?=
 =?utf-8?B?eGxkK2RTS2hTVHpjWkp2d2kvWFozakw2NkUzK1F3QVZ5SWNic3RQMHlJdnBs?=
 =?utf-8?B?MWcwUmdtWlUwRXg1cGdva1BlelFBVXBlMVpYdy90Z3JyN0FFekw5aWl2TlJX?=
 =?utf-8?B?MGsxUFVOQTc4R1FlNHJaRjcyamFaTUJ0c3BTcWppeHVMMmllRUFtdWE0di9S?=
 =?utf-8?B?RGo5UkJkU2lHRDI4Vit1SUVVaTJvKzBBYmhzdWRQQy9zbGdpRXVFRE5kaVEx?=
 =?utf-8?B?amdSWGdyZjVxOTZrejJhME5xRU83OFUrRkpBTlVURi94TDlqa2t4SHV6UkN5?=
 =?utf-8?B?SWRQQkhTbm5JUjhDa2hpc3dWSXNLNWU1NzJ0Rit5UUhPdFBrTkpIRnM1RTFo?=
 =?utf-8?B?VEtvM1JpMGZ4eVVuY0Z6V2UzYlR3TlZsQVJObHNGQlhreWF2aGNNakJqNkFG?=
 =?utf-8?B?TTlxcnBMazhqNDlNU2g3R2thS3daY3lKUFZIY2RzVU0xVFdOeFdySllyVGVN?=
 =?utf-8?B?ZGJyNnlqSDRvdytrOWQrTVRHR0cxSFlIMDJ1a3ZCdWNXQ3BMVXpsT0JHT1lJ?=
 =?utf-8?B?Q0ZvVlNIMVRpc3NISkd1emQ4Z282ekF0SkJrdkZOKzVCbk9KejBMTWx1ejIy?=
 =?utf-8?B?cjJuL0h0RSs5MkM5dTNHUHY0NDRGcWNVQXFsc0pMd0IrMFNYNnZSazkzME1F?=
 =?utf-8?B?SkxSQXJRTlRYWHJZVFhUamZtYm1rOTRsWDJZeWdmMW1VUUQxOFZ2NDhvL1lM?=
 =?utf-8?B?TFNMa3B2TCtsRHJLOVdlclZ0SlJRSG1UQ3NVa2RTK29VTkZUc2g5QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 734718bd-c825-4982-c982-08df3e43d9f7
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 09:28:45.1823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPT34qbEhWMpxjn+CXHEnK0RIWMN+ZOEJEBa5nAjmNnlDCGcNjrQ+qUZ2ocQ7oCn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFAF4999BF6



On 11/7/26 01:14, Brian Masney wrote:
> Reduce boilerplate code in these drivers and convert them over to use
> the macro subsys_platform_driver().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>   drivers/mailbox/mailbox-xgene-slimpro.c | 13 +------------
>   drivers/mailbox/mtk-cmdq-mailbox.c      | 13 +------------
>   drivers/mailbox/zynqmp-ipi-mailbox.c    | 12 +-----------

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

