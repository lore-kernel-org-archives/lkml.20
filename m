Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793948305;
	b=NpZoha+PTXXmhI/N/c4fDx4A2+AWH2w7BKtyMC8k/EeD4Kwgg/+sqndlmuxGGG0g9NeZ
	 td/K2rD2YgFwFM4veWzNzYYggqe7k8nhVtNEGKDP7uqDSEl7XEuSNXYf5wI86sm3AOZOv
	 P3mP3DOwu5YwP8Cu5R/dthDsY/zWJHNL1otolzqgP7iNAfm23bSLwH25kmBRjXbpS7M/3
	 KaAaSaAbwdqvjxWx692qUEBZaPu0DqncsdBjneRahB5AUieX8fE4rnj/+3N4trWpM3a1x
	 Y0lM6k1TDIEb96L2H+LzXs5J7fvsVaLOTYoJ4C53LRSskrUNhhjflpq78oI5/U6oXtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948305;
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
	bh=B0XMlJrpR/p17F9nRjvo0bSS0yuOSDvD0hOsuzPnirg=;
	b=hecRAodBpB04F22v+UGTRGGxkVf2/F1CV2C92feZDAfzx+hC4jfI4h4Fse0rF8XbrUDM
	 9r1PSsIETjDOL7B5/m1pkrTbeavZNtIL9AROt3FLA8Z4nupE7FTMBk9W4X4ZYcA88kFUr
	 LyoxW72wrNdTBb9POnZgjfWWrYgGznWl0/UU2y8kwSpoZGQZQKWDkqxBtpwVt1VUEnvjb
	 EB31ZDZrTqCSXFJkfM806qHd5DhIDl5FoIVutnEAR7Jvc3AIJALIfXVeQrpWLhCUYJoGD
	 YUqAYHz2IikXgTBzfIrhoz0+zYxyXRUDIyaJmeosPJlFvkwAzHGal7eB/gnFon974mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="Zeh0PO/z";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.48
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012048.outbound.protection.outlook.com [40.107.209.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55705606A326;
	Fri,  6 Nov 2026 06:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55705606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Zeh0PO/z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZauFgbUr0+S6OX3bRh+zjuAiCHWbEz3eZJ/1L5IqsS5tGD2xpPfqrpipv7q9kyfmfy/FjpfVEkxEqJ8oCDsIVGvbRuKjUt3pkg2860UJBpAH0lx3I5x5As+v5XupsWpmfIe0/tkYeXpWcECPeM8rW7+8lmtKpSpsVetL+JmPka8tIpHn1nqnWshGZeW30duHvqRi8+G+/PzFMxXlmu5yGjukKP8FnQBcYF92BV4NyrERttPN1Up26Cw/9MXdhUKV6yjf3Wuf8e8Vax0oD18KIlD5mmcoLUdz8ygy8assVN1qvOCbng65GaUZDzGs3xfXrZLIZeGwKWYKhErLJideOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0XMlJrpR/p17F9nRjvo0bSS0yuOSDvD0hOsuzPnirg=;
 b=WxRrJJ8CddL9UEMby7Om0ABNwr+SXbi40SDKDdkogqQeIuS/LVZzz1P6HJJg0G38BcpligBBgcHDGoU04b1253LdNBOZ8sV75TV77o3eAlubNooKtfxStj8ot1GWSosbrlkRbbsL6TYGvtwV/XFjNGrsjLpQDUTjdG3Qd356SNam/FGExrhcc2sJA8fVWdfhjeYvQqf/rQXHFEbtbAaxNXy/43QRtnwfxllssRB3mqYmxJFKbvjKsKD36yCvvqJCNJ8j8LEqyfDs74ggShEWfzz9k8yaU0RC414oj3116+ahilcwaeYaYnJMDVx1tgPF3XDFJyGotFZZqO527aH0kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0XMlJrpR/p17F9nRjvo0bSS0yuOSDvD0hOsuzPnirg=;
 b=Zeh0PO/z3Ah5EIMp5DdMkjZ2rkg2rEIaSPAP8tuti+pm5O7VvZvuFRLcDhKZcuh7T6pTUC0mndkAeKYg2FqWdxFAs804mz1nTpS130u/Tjq2xIkgJVOjOpM+uNYEVB7qirMipWyZoB4579al5Dy3ZBfUC2mtKWypa7VX/cuEMGQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA4PR12MB9788.namprd12.prod.outlook.com (2603:10b6:208:5d5::11)
 by MW4PR12MB7261.namprd12.prod.outlook.com (2603:10b6:303:229::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Fri, 6 Nov 2026
 06:58:20 +0000
Received: from IA4PR12MB9788.namprd12.prod.outlook.com
 ([fe80::aac5:ae06:3bf1:36db]) by IA4PR12MB9788.namprd12.prod.outlook.com
 ([fe80::aac5:ae06:3bf1:36db%5]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 06:58:19 +0000
Message-ID: <57a1ffaa-c545-4c8d-91b1-bd507048b869@amd.com>
Date: Fri, 6 Nov 2026 07:58:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: xilinx: Remove description for USB
 host controller
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org,
 stern@rowland.harvard.edu, saravanak@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20261106051820.3414532-1-radhey.shyam.pandey@amd.com>
 <20261106051820.3414532-3-radhey.shyam.pandey@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20261106051820.3414532-3-radhey.shyam.pandey@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::27) To IA4PR12MB9788.namprd12.prod.outlook.com
 (2603:10b6:208:5d5::11)
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
X-MS-TrafficTypeDiagnostic: IA4PR12MB9788:EE_|MW4PR12MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fb4ef1e-0c47-421a-71ab-08df3bd35717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|11063799006|261022105027099003|4143699003|261009223027099003|56012099006|261021123027099003|261026121527099003|261026140227099003|261028144727099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YzWjjcek0i0RauUx/eeAmR4u0ibGEyPWMNW3sOU3ey1bJRLYguPPDBbzgusFGa+Lv/8hWNLZeXv6jb7rpDs4gUpqZqpJF8GBGhXFvBTZQ0cdvxLp/bJUyDVGtI/c6OARKu55z2n3N39H1soGvdslg9VrzEE8ZBt2psKWL7ppRlkfLxETDRDahYAqbZajVWTiUBFzO4u6eN+jWU7zH9dOBVtvTI/Lr9zHaNYZRCAeVF44WzIvgGI+PFh5UdOVq7tbGtP7dWCotRJ8nrmX2cTuKQG0udVIejgukMaki4I1Q7UflOP1og07DeUnQCvD5tVKeYjBJsao45CICP7SErdqn5sZlnQQj62mnn6N9ZvmgHnfXETrphrtHy3/Brw1fQyLLB2dfDDTUjC+ONlUDe0P45EY+HzV0IRvAy0r2RzwVdb8aC2rz1Wh4InMBE+3bYfGtsflGLT8xdFTF/DYjXOjHN40GfK6AiTRWW70raKert+03dVd6kRN3v3ZtoltgbaG9JBYPNa2vEK0Hoy2M5tipft7OTuf+fRHrOR4v+egm0d3e8CyGs5IOvA1vXJoQl8a9G3XO9AGPO66PAtrn2s7dzU2/lWRiBsmMvBA3IyKm/3hvpbNqr8f5qUmTKpGtR1xYA7+xkSNmzoGrIhjCyA9dtlXVvCtxIdYedRdCVB/yvk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR12MB9788.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(11063799006)(261022105027099003)(4143699003)(261009223027099003)(56012099006)(261021123027099003)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?allxUi9jdTJyd2ZaNXRwWDgwSUVWZXV5MXhESXd4OFM4bTVTWE5xQXJBaGUr?=
 =?utf-8?B?b091WEFXYU5WVFVSM0JMZ0xDWEwzRlBwVEpPS1JWRTJURi8yYmFsTjNwMzZy?=
 =?utf-8?B?NDV1OUMvOHFGWW5CV1FZdVpUNUIvQ3lQQkdsMVl5QnZzNGJDREs5T3JONkww?=
 =?utf-8?B?WjRJVE52SWtOZmt3clgyaFk4bXlFbjhPalpqK20rN05zYTRlSDJvSWRYcDhW?=
 =?utf-8?B?UVRtbUxISjllWkhlTEUwNTQycFFZbmZITmJNSlRpOUF5bTBYQ29pQ0hYK1J5?=
 =?utf-8?B?UFNkTGxZNG5ZL3grSFdUUjZ0c3ZyQUVzSG5udFZqdlgxUHlrY0VOSzJONHd2?=
 =?utf-8?B?RFBNMysxM1VGZGpJNVFqdjRsSXE0UTV4cUhtSndJeU5URWJER2Qwc0ZET043?=
 =?utf-8?B?MjgyUmZGMXRTa2VrTmwzVDlWZS9NUW1qSGFsWGp5bjY4QkNHUDAxU1pSR0Uv?=
 =?utf-8?B?WWtibjdwL3cwREEveXVvWGlTQS9sMkZkUEFMSUxxeXN6MXdqa2Y4NmQ3WkxQ?=
 =?utf-8?B?SE5ZOFF4RlRTNUlDMExCWG92WmZPeHJCMXZtRVZpZzRaaDFkRFN0cTBMbGtP?=
 =?utf-8?B?d1BSVUxrNWZ0WGNQNkpOVG94MWxiYi9jMlhZNW4xNFJRUWo5RSsrVUk3bjI0?=
 =?utf-8?B?MCtwUVgwZ3ZSQWFLQXlPczErT1pjU01Icmx0T3hnL3R2SkdFVGEySnVZVllW?=
 =?utf-8?B?aVZkQmdhTVNKZklZWkF4dnVCUnN1Wi95RlZYWVpkSk05V1BXeWJWdVppdG1i?=
 =?utf-8?B?eFZOU0ZnMFdHUzJqc2JpNjZNVEt2R2FCNWVTUVZ5Qjd0UmxybDBpc3FlOWJR?=
 =?utf-8?B?MDI5T3dOUEtVK3k0WnI3QWZKQTdlUXUxdC9WNHEzS0VxR0pZNzIrVnU2UkFa?=
 =?utf-8?B?OXdFR2drWllRcUQ5VCtxODljSmVXNTI4K3dFNWFrS04vZ1dGQkxlaFBJbmFK?=
 =?utf-8?B?T3RtcGptM3VaTDEra0lQaFRsWlIrTko2MkZnT3QvbkZEL29wbFdRZ2Vhcmxq?=
 =?utf-8?B?c29pem0yWDVWUXNJclB5b3JKamE1N2tqVkZ6YlNRak1LV0ZWNnZHWFk3VWZw?=
 =?utf-8?B?Vi9EYndVY3Y0S3daZnY5eVVoVUZkTWJyZ2E5WEZlUHFjYWNKSmlCTDh3WWF6?=
 =?utf-8?B?YnFVbVZqYVV2aHo1bDhjSVJUOXJBY3p3Z3BFbS82SHI1anQ3ZnFxZGdsUFJC?=
 =?utf-8?B?eVh2dVUzOEt2V2s1L1lDMFI2aEcxQ3NURW9hTlVyazlRZEtiaEJ4ZlNSeW0w?=
 =?utf-8?B?aUdoa1IyVW5MS3ROOTVtd3A0NGx4cGhwN2dFNlNjd081aXNoelZuUnBQOEt4?=
 =?utf-8?B?VC9McFBxMmRRY2VXeFdYeXZwYXZGaVFhN3BWN0gwZWxrOEdZaVBVcUIyeE1a?=
 =?utf-8?B?aWxSYnl5N0dJR2FtdExodjhDR3BVS25FUStDZXl0Y1hZNS9aT3kzdzJaVC81?=
 =?utf-8?B?anhVMzNHcy9EOTBzbUhjbnBSZllTT3JHRi9jTVVaeTY4ZG84SzhBLzh3Z2M2?=
 =?utf-8?B?NVlYSWxlYnpjM1d4dU9JT2IyWmF3cUgyWDVuL0hxZzRhT2FOeUtqUDBNbmNi?=
 =?utf-8?B?dmxyZFJwQ2VjdEZpR1RtR3hrQWEvcDZydDZZUWVtWEtlQnc1ZHpncXNYYTFk?=
 =?utf-8?B?ZVBibXRDY3RjVitETWFpZXJmT2xzQTFITnpyT3VYTUZBWnV5VU41WmJGYzN1?=
 =?utf-8?B?bmdFRjlna1pna08xdEVIbkp3VXJPelJYemp6S0J3QWZXbW1DeGFHVENkN1Ez?=
 =?utf-8?B?Y1ZiRTNRdXYyZGVRSWIwKzVwcHVqZXI1bkprdy82Z2Zla1lFTE5SWkRhMWJX?=
 =?utf-8?B?TG1PTWlUTi9MZEY5QkRpUUZOTWlHanh6eXl6ejdDU1FVMWNkelVWN1Z6MDRr?=
 =?utf-8?B?SHkzWGV6Z2lDSG43K1hjcEV0VjRicHgzUnR2NUVVTmQ3c01zbUliSldrc1dM?=
 =?utf-8?B?UklKNkJwMEYrUnZRaXRHYXdUUnM4VlBuRWVDRlh1djE5Wkl1ckc4Z0tuWjE4?=
 =?utf-8?B?dURReU95OGRPN0ozUWR2OGpzTEYwazFORHVmMTVKRHBTL1dneGNmVCtGa1VB?=
 =?utf-8?B?YzdPS3RnbW8rTDZia2YvY3lEbDRMZU1BOU9HQzVXb0x3d2p4WnhZVWZFZlFs?=
 =?utf-8?B?a1RUSFB3Yk8vdC9nSEZvbEJHNzJwdmxvdzJXblZyaEUrQ3IwUGxDeUI1bHRq?=
 =?utf-8?B?OHFyNjRZSkl6MEZRdm0yUmpXbzlzbzUzUk1qcjM1YjNMMjhjWXMwVk1NMGRL?=
 =?utf-8?B?ZENZeFdBVkZPeUU5NDVNMFo0cElpWWJ6dDhLVlREdHk2c3JmUXF3SG5pY2lB?=
 =?utf-8?B?b292UWJLa0ZsTlNPcm9Hb21HUS9NQXBDSXBYUkU4cmJDUS9saWdiZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb4ef1e-0c47-421a-71ab-08df3bd35717
X-MS-Exchange-CrossTenant-AuthSource: IA4PR12MB9788.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 06:58:19.6384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4uOtIVMEsqm3gsOFYZ0jT03rMmm6LUpZ/AD9zIOWc4OX1qKZmO7NSZ38JDAM0ZnG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7261



On 11/6/26 06:18, Radhey Shyam Pandey wrote:
> The Xilinx XPS USB host controller IP relies on Xilinx Platform Studio
> and the ISE Design Suite, both of which were discontinued years ago.
> 
> Driver support for the controller is removed by the preceding patch. Keep
> the bindings in sync by removing the corresponding Xilinx USB host
> controller description.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
> Changes for v2:
> - New patch to sync binding document.
> ---
>   Documentation/devicetree/bindings/xilinx.txt | 12 ------------
>   1 file changed, 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/xilinx.txt b/Documentation/devicetree/bindings/xilinx.txt
> index a1a2cde7b7d8..5049af6ff4cf 100644
> --- a/Documentation/devicetree/bindings/xilinx.txt
> +++ b/Documentation/devicetree/bindings/xilinx.txt
> @@ -29,15 +29,3 @@
>   		- compatible : should contain "xlnx,xps-hwicap-1.00.a" or
>   				"xlnx,opb-hwicap-1.00.b".
>   
> -      vii) Xilinx USB Host controller
> -
> -      The Xilinx USB host controller is EHCI compatible but with a different
> -      base address for the EHCI registers, and it is always a big-endian
> -      USB Host controller. The hardware can be configured as high speed only,
> -      or high speed/full speed hybrid.
> -
> -      Required properties:
> -      - xlnx,support-usb-fs: A value 0 means the core is built as high speed
> -                             only. A value 1 means the core also supports
> -                             full speed devices.
> -


Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
