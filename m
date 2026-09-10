Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013031.outbound.protection.outlook.com [40.93.196.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9D638DC58;
	Thu, 10 Sep 2026 06:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021340; cv=fail; b=ftDlEuCj5Ruln2/IsvKlMrDJlzC9GLYIJjKNSlw2r/nkldzgh1R5jx4+2XXIXlSpbDtoqQATHY5WkWO0iR0VCcukMuL0KKf5lEmR2YGSR9BQ9KA+glj54z1Kr74ZDFOYEmTyxcJ5DCNv8Vjei+wKC/d1FmddqJ16M1JTfVa01PE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021340; c=relaxed/simple;
	bh=4E6RVnELHbAiHBh11wwcTspdKgJCIWAND3wRR427KRM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=l2XAX4EL/j838aLfV/XEPFsfTM9vCTfqLMRfkH84usPAAkaLAxw6GemTDQsSL1hf5z2W0sx5Ci4vsR/JgY3n/pKQaRRCxs8vE7IBzDXFpAjvV4+UrFT/UjR/JzBh2T8/MWLJH4qwRDBjcmdTHT+WFqj22OR/IVroP1OhM40rpHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gWMBGZ1n; arc=fail smtp.client-ip=40.93.196.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gWMBGZ1n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XtbPKsFLx+NYpcVznsmSljbMxWTm3GGFzJX6V/GUgox+uYV0aRYTwE1Z0rtbzbj8SShDwXmr6yweKqxKD5y3vPnCzJ1TnOLwRns2X7zp43vPzJ6XdEQvexFcvAJF7SEE2Dvzs4IHH0SjpGFM8Myv6Q9KklH+KuiDCsk8WPGzC9hMI7RwttX+rqYZi19zoRgx28bHUqt5GL1dUpB2ds2IT7xy3ZeZX6YhvqW7273JVoDLQyC2X8R5ddYuTS/x8MB2P/AWL5OQzDVcEfhvlWvV9LLxyVhJkOX8mZ2iQ0sDkRm/qNPENkaxBnPltX+TC6dYi7l2LgVKn/7GUrIbt0W3Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zj1vPZoSsEkL8SQhCkdtJZ/djnYc5NFTRDKXuUVyUEc=;
 b=TDHSYbaXZJ7g6f77X5XVla/Zao8YW7Nrw18BfzUqgcY1ejm6feMav2MZi23l0SgXY5xl8N6KjjKT0UCB6pj5ECC7Eo615j09+zdYCU+8nfmCvuCeWVAOV28PyEm+7bHKPS/KIl51/nqovjtZSNVND5vhCwJgBbiR+sJBtld/X1D6gLAh6mzXaVbBIGdh3Go6Ricapc2cqzASXQ6AK2+LsVEEDmxS3b7bLoVoaWQxZ0dX3tImjuetNDh6cAVFyLIh177c84nf9gGm8p1X9fLJ+0Ce1aUweqyz4Rxy6yX+4B9jJPpiIf4BLjokVcsy8f3RFN1hHFxEYIjmqEkqC7nYLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zj1vPZoSsEkL8SQhCkdtJZ/djnYc5NFTRDKXuUVyUEc=;
 b=gWMBGZ1n3w7IOVlCeaHEmoogO17MqjuhdTmUZCfQAYFyqOCjXQf50h3jiSjCSRXubsTGm2ul2G9OziGZJiemEm9FeuNTs6gEcjVP72pvFG3ayk9LgfijoyppqB7fg0yzOW3ww6EJeTybTZZ4Db20tx6gYEtFOv39R7nTCngJsCA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DM4PR12MB5745.namprd12.prod.outlook.com (2603:10b6:8:5c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.9; Thu, 10 Sep 2026 06:22:14 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 06:22:14 +0000
Message-ID: <082df9b0-0517-4580-8ba8-cf6f4d3e0713@amd.com>
Date: Thu, 10 Sep 2026 08:22:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: xilinx: Document ifm ZynqMP
 VHIP6 EvalBoard
To: Marek Vasut <marex@nabladev.com>, linux-arm-kernel@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260909182641.165383-1-marex@nabladev.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260909182641.165383-1-marex@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0091.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::6) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DM4PR12MB5745:EE_
X-MS-Office365-Filtering-Correlation-Id: 90eed80d-34dd-4a18-cb2e-08df0f03db2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kXHT0LolUgc1vJ2NQoBNy68vFqYWV+P18JE8y/znCNnJF8pLwgCa0pdcxA4vPQXFJ6M90WDCLvU2q+pQZjs1/cEFXDPCOkoW4zxEM6r2tMnwzz+g7XE7m49di4PmrlFkda5cMkb/yctM9+wcGZFi7NduhuKUOnA06n7y3lheE3G2Lb6MeaGAxm6jcJOVpVbK9R4blmRt+a4tjPVQXE8yeOSWNwf0NG1cDWVhiT/P0v8fPJAmb7w/2hNaml8jFXMhqZnQpAdtqmLAopYlFERfQ+qXIFu0gQ6LLYQpPaMHSP9QIiGJeXAG5dEw9zEC8mRa6vYXmFPrazVnnIXsc3iRm4R8Uvqy9/2f05dx7+9B8pZTJtnPiyFMb/ef6xAfMf5xjUpmIEgYNCqbtEwPkZqywanWpdorfpKQga12rQiz5+z289vR3q5z5ZUjewFDEE3JKRKVl7jg7NKR/MreG7X5Cr8NES/s5LnnhtzUaCM3aflGnPQma5ewprQghW2g6CAgYqWqm8u9UfjJ30faNKcrhMrfjZgQTyLXM/SGGjS2+nCO2+8R0V0fYXSgcfR572bhYDTorb6Qr0/S7eY1V2LnU2fZY4TeZK5rPIS+EKyxYhaDfCKkrwSek6FkFmmItYK62DUt//MVxsqrNgtt9KPWqHpUi/5g6SJxva2YCJsQAog=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnNQdVVtVStlMFJvWU9SbzMwdzU5MllxQ1FPSklwQ1RjUEgwMWloUGVWSEZQ?=
 =?utf-8?B?R01RRjNTeXc1MWNTVzIyMG8xdVNrMGdoc2Z1SXN3dTF5aVpTNi96NGlTYjQ4?=
 =?utf-8?B?V1hmRkxGY1BFVTZoOXBQL1N2aWJyRVdHMWJiWW1odWFLYnliNElMVXFaVE1U?=
 =?utf-8?B?RkFwRGloQVVPL0h6M3FPQ09QWVEyUkQzdzJOdEMzMUZWdUFPOHltN3NiLzF1?=
 =?utf-8?B?MzFTcHpnWmFTQ1ZUZVY1SEtkNGlPbjRwUWozMEc5VnE5UTNJWXYrb0FGMVY2?=
 =?utf-8?B?OFhPYnVDTUpsVEhUSUFBcmxneUw0SHZxSkovdm44aSsybXpxOFZsY2ZvRzNq?=
 =?utf-8?B?dDJtTVFPT0tNRmp0M0x1VWkrU1h3UmQ5b21Lek1hTlNNMDFrcG16STRzQVZl?=
 =?utf-8?B?dXlQSDVnYXVLZnV3TEZpa3JoMnV3UjNqZWFKakVXV3JHN3hhb211QWNjNnRi?=
 =?utf-8?B?NmRjNkI5TXc5MklrZVBWMTM4ditnWmgxSjhIVUVwd1luVUxWNG9hcklmZFhn?=
 =?utf-8?B?QkdudytyMERRTjBGczBCUHJzK1NxYUdtazdxT1Z2YUR2eUJlTzYvNFZxQ0xq?=
 =?utf-8?B?aEVaQ0NNc0VLcXkxMDBBU3ljUkI4S3pwSXI1K0NmSC9mV3pWeStaNE55N2R4?=
 =?utf-8?B?bk5BUllaUEVGZ244QTF2U05ES3ZQVXBoNlltbDVDOWdCcDZTM0w2MTR4QU9X?=
 =?utf-8?B?bCtlL3lmeWhVR3Vrd2kxR0M1Zi9RNXJjVy9rczkvSGNzMDdpc2JkNWVwNkk2?=
 =?utf-8?B?clpNbkxVeVMxM3MxUDRmYkpGUUZxSWxNT1JDOTI0VVRvYzJycWE3ZE1BcmpS?=
 =?utf-8?B?M1ZRWGZFOFZMWEh2MWlUU0ZBaURmMTZia01IbGxGOXFVSFNhQ09KbWZvZ09E?=
 =?utf-8?B?QnFjOHhXTC9RaHZRbEp1eFRrRFF1R1NJM0F0L3BHdjFZTjBpK0NnMVVjc25q?=
 =?utf-8?B?YzY3bytGdTV0dmorR0RMSU9uQkx2ZHViYUV4dzh5cGwxaDZnNHBWRm9KV2ph?=
 =?utf-8?B?MkJ4d2oxSVplNmIwSjdvWkdqcmZnYmlvS3NoazAyeHQ0ZDc0eGM3eTVkQUdT?=
 =?utf-8?B?aTQ1QW90UmVHZ3JFcXRPdTVrMk1VY3JzTVF6bWhoampRR2p3bEovaGluejhs?=
 =?utf-8?B?Y1dQMy9YRWpIYmtVTnJNaitvL3JxOFJEMTFwTkdvVmg2T0tNa2ZHR0tkeFdt?=
 =?utf-8?B?bitQaHc4ZVlOamJuUmNjWW1rejg4SldYSWdiWDdCNy9JUnlJRGo3U3pCR055?=
 =?utf-8?B?d1RBcXdzRWFRY015K1pjYU9iYUlreUtJN2g2UXNHeDVsd1FmdzhKQm41enBh?=
 =?utf-8?B?VFBqSWd3UC9FVzl6QWF0WmFFZERYSGt6Z2tOc05zK24vZlpNL1lPbG5KSnpn?=
 =?utf-8?B?RE9JWlNKTUdXMGV3NmhaL0FPWjZXM0dWWmpad083Rk91eGFWTUZQeXI1TENu?=
 =?utf-8?B?MGtrckFRSlBWYjhuUWZVaW9qeXpUazUvU25RYlg3VnZSUDNhTzN0aXlqTlE4?=
 =?utf-8?B?YnRCSDFBdEFHVlQ0UEpWYUNzaHg3akpaOXJhdTcvUjZNY0hSTmVLTlB3WUV0?=
 =?utf-8?B?VC8yRGQwZXlZRzlGLzV3eG12MldWSnAzc1dlc2JMV3ZZNkVnNTlnSldLQk1F?=
 =?utf-8?B?ek9DelFyamFqbW1OSVhORm1uV0NxTGduYW9saldRREhDbktWWjZ1L0NFYnZ0?=
 =?utf-8?B?eDMwMG5sUGQ1dkNLQXdONXdMTnlUek16RG1WTkNKbCtQaTNVZmdZUTlyY21u?=
 =?utf-8?B?MVRvT3NRTStsRGppOFFXV3R2SEg1M3VpVzczSDBJZDFMV0xtUmZoU05NVTJ3?=
 =?utf-8?B?TFlBZ3EyRGxHVHd2Rm9RblkvVUE2dTliRHEwZHBlWHo0VExTT3BDSnhsdkJX?=
 =?utf-8?B?QTBDMnBmV21GVjNFTEprYXJocGR1aHNrTU1RcU9iNWNPVFAyZUV6MHljdTFN?=
 =?utf-8?B?VW9qOUtFQnhQNVVZMDR2T3lwZzZBZytxeDJEL1dEbDYwQVNpcWJGcXBZWGFY?=
 =?utf-8?B?OFA0K2ovWTlPaGZWeXpIZ0VyNGk1QzdZZTJKTWVQNTBSWGF2SGhETHdZcmxU?=
 =?utf-8?B?VkRsR1dsOGREeXRQaHZGVm1xTzlXZXAvdXk3bUNSUW9Wck1Yak5jci9BcVZD?=
 =?utf-8?B?QzNXMUVCVkNSYmR5K1oxUis1UGJwcEc0RW5wNkQvc0VZN3dVNTYvQktvVW5j?=
 =?utf-8?B?OVloZ0xMN1V6dXpRQWpLdFJkZFFsMUdWOHUyQkdFM2lSQVUrZUNyRldRS3lN?=
 =?utf-8?B?bWs0R2hBMG1sc2JLNWdzcy9iOGtkMWk2amwxZUNTOFhNQmxxZVh5eHlQNDFq?=
 =?utf-8?B?V1JXR2NZNTFuVWhRNXpRWHZPdTBveCtsc3QxSFBYcEpFeDJNZURYUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90eed80d-34dd-4a18-cb2e-08df0f03db2b
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 06:22:14.7467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MPIBJPQEG74sbJdffA4htYJTIPqvZLVW9NERQAyyr+1peeu1nwfLOcoM5WH0mxbA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5745



On 9/9/26 20:26, Marek Vasut wrote:
> Document ifm ZynqMP VHIP6 EvalBoard reference design binding.
> The board is populated with four ethernet ports, QSPI NOR,
> eMMC, UART and USB host interfaces.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
> V2: No change
> ---
>   Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
> index c9f99e0df2b35..49ef4e0c68501 100644
> --- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
> +++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
> @@ -44,6 +44,11 @@ properties:
>             - const: xlnx,zynq-zed
>             - const: xlnx,zynq-7000
>   
> +      - items:
> +          - const: ifm,zynqmp-vhip6-evalboard
> +          - const: ifm,zynqmp-vhip6
> +          - const: xlnx,zynqmp
> +
>         - items:
>             - enum:
>                 - xlnx,zynqmp-zc1751

Can you please provide any link to public documentation about this board?
I wasn't able to find anything through google..

Search on ifm.com also doesn't find anything too.

Thanks,
Michal
