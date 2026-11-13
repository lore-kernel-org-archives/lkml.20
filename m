Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794575160;
	b=mHOuYfAHzD6UXm9pM9EnARLTrWn2L8gOjvBVgRF5YIHl/Op3OdGFIqV/ZbtbGx7vysqj
	 /owsMrUqrDcTK//1aJ92/OJM+hx84VmMdAljRPYzi6kCB+KnDHncLwuMDu2uNFaebRkBw
	 uOVyl9TecmIftMy9Xc94IuCMoJC2fLJCxYLaiU9ray67fFONspt0aPc5949sb53CgdxE7
	 pK2+qmr+2lUiKetqh2P7zTWwKZkmmqVWF1flokxd+eXD+66tODWL3WVuEQzXgpgvaJf97
	 IF314n2NVtrK9z7s8iL/bkCfD6DMUm4jNRepM4yIfQFbDiqR6pJy414VDSiLOXdxGoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575160;
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
	bh=l3vUTCiFrqYPsM7jXOQkc8hoThEnNUzOHIfBZ7FEwSQ=;
	b=45WCCxQp+C3v5slxEdt5Yh+Z0TAJ9KfFGFvuDcJQKrkkuhxMI/d+5wl+g37Qb7nD0HFy
	 iWTi2u5WOb2Qg31nW6op9aPd4c6XaF1455M9ZBxx6u6NJRFpuc03ZaErgdX4Y3dOcDB03
	 GmPkAoQBemTkV40MmWOagV6hv9IhkjYkMJ2m1MdCmav65QhFmzpFFt+Ea7d4qz3bKJ0iF
	 40U7iXMqVv2GjL9Q8y1MF1j9XJjXtgRwTzuSPW5B67UI2R01atvJAyk1kEfqDONqv5Pd6
	 bFef6MHVlpY8ya/buZbaqQQKfh4Zkro5k+nHEPx+qvx0OpW//N4sQIomVSAKjg5XSEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4EObd+72;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.19
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010019.outbound.protection.outlook.com [52.101.46.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FB860A2630;
	Fri, 13 Nov 2026 13:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62FB860A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4EObd+72
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBwUV0o8ie67mKogpU82/Up/55BbXJZ3mAaHk5TohnvcSWLYDRffijXaCjjYYS3i4oKnXD9IyuciENx/86Crw2us3aM4kcgDKr9FLfJLSYbmcxNkf4e6VizQuV8eX2sZJE2pTJMZubQeP5W5JoEn834ocQOxbSeNCtNtWXC1BRZwV0+RBF6BcSJ3fKO4fwA/hKvkLfIrCZwkBXFenXaJ94H7gX3Bwjo++fYhXQRH/IGnHP78T289fp1H7EmX+af7RZCr6vaH5fNYJg4hz1jq3YtuF+iLd+xcmfR54P+BJUFktdAcxsdNgGmaxBLxBR+NDYVBs8QhzHuJhIxpc4lsnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3vUTCiFrqYPsM7jXOQkc8hoThEnNUzOHIfBZ7FEwSQ=;
 b=x7KZ1QG33a+KkGqe0XOh370PbTtIXZ9IdwxDp9YFgJvUZW3CYCyv8kD9Hq3/xN5PFKwEBBRouB/HVOsJSLtWCBWlrjPlSX7Ie5VlQJ5aHCtnWGJAVoJcERK4qRbuFenffHmbwEV7MD21hiSPLa1hzlrmsrswPUJJDDTDU0bbvgXc1IJ21ijbWbcAvt3b2NF4eo5T1/kNYGig1dQHcwhqAXaYEjGojdA4Np+Ct2Xej6RTn30/VIy+1gjcDKcCEqipQNb+XriDg6Z6nRV5ChthyGrNdzABFX6XVMrrONHdzjmhsA8Qosjanr6BW6f7pnayeUEtJ997D9Hjl9VBCOOr0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3vUTCiFrqYPsM7jXOQkc8hoThEnNUzOHIfBZ7FEwSQ=;
 b=4EObd+72I73pDkojXjqjnHE4EBxyo9VB+rOLvJ8ymOAT0lPeu2CNy6QeZDchYfa+v3k0L/lWuvb//Z2H0pzkOCZ50m1RFAlpkZQwhrt3pBbAPuZLYBDr2Rmi7YK7TpDwbwakZZ2noessPTzCpivUCNH7X9BBg6WSg5vR6o6yHss=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DS0PR12MB8444.namprd12.prod.outlook.com (2603:10b6:8:128::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 13:05:57 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 13:05:56 +0000
Message-ID: <45adea9b-be14-4954-8335-267dba33afbe@amd.com>
Date: Fri, 13 Nov 2026 14:05:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] ARM: dts: zynq: Add ALINX AX7Z020B development
 board
To: Pufan Jin <cyan2254650260@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
References: <20261112193245.250149-1-cyan2254650260@gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20261112193245.250149-1-cyan2254650260@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR10CA0092.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::21) To LV5PR12MB9779.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DS0PR12MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: 0920e253-bde6-4be9-0cba-08df4186daf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|11063799006|56012099006|261026121527099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	9pCXQjBMwAR+39p5Wj/Y417s/G77NYVy8/CjWndJe6HAc6sXJjRFGTFBcwToW2FUIdbtZtAvL/olKEtBPEqMDeF9G4ZuyMnkLH/b+Gin+jenA4DORbqKasI5EtCh5C2kHuciQnHHactn2DMiy70lKw2HAlWHf89vmdEq8g7CMpmHM1UPErfhxvVTiZNwxFsdGzrPjRiDz7Jt0dQ2hurH9IefRBnmat44udQ1wKcrTYhm2vDr/0MvhQ6S3x5H9iFZ3Bfo+8nEKNbQ6+3QAZ4UvhAr39hieOAR52O7BOcp4EfV259Qz/DrFp1gcZOk/YIlvmZfyqdJTmQ/6S0jOpagBBaKm25xEhrCqlwTe/E9LTN9yCyNe1wqVIQP3SOHdXcyT3dZ+cQhJ1mCDm2O/5l0xNleGwa3HZzlOUNvdhbZ+esl3jAhgWSyW/4mJ28TA2Qllh8/SvrbdAswNsOBjRuvS0r23VwedeB0TcxYtTsn5dkDjpMxS7KGN+K3/MNwXVqKXRG7IdgFUnDAjbE5M5wHYDMp5v45JN1gojrtAGOvhkedimp1qgBrGy818gxtz+knlPZB+m+eSg0fjxQ0q0bt+97ha9kokDlkDypj4Y3WVHwkQvAVXddShwRIOPj1SYmxw/LNHu3bSLJRCzyvfA+nbR2y05Z9Z8C1KPjqBp3FRJs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(261026121527099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YThaMUpHS0NUcEJETkk3b1JSUjdPbG9zNUhJQ0lnTzhxajIvcHhHekwvbFFj?=
 =?utf-8?B?L0p5cDBjWG5IUjhLSWZTRzlRVlB0QjBwTTRySXdpaDlYanlmUHpmYlNuNUxT?=
 =?utf-8?B?T0VUMm9RVkhFWUdaUXFYbDVkVWtNamxxOHRjakwwUlh3SURNL2tBaVA2SzVE?=
 =?utf-8?B?NVpKc084SlJQMlRzNXNlcCs3SUhKM0dLSWhTOWNld1NsZDBWM01mYUdsSVdG?=
 =?utf-8?B?VURINzJwN0xVdGI3ZGlPSm8vbjMwMnlpNk5WWW9NUEFTajVhNmtDbkNTRStl?=
 =?utf-8?B?aSt6WmY4SU5mWnJYTWZTTG9GU3NNY3VsYjdEU2Mvdjg5bzRUeWN4TFNDT09P?=
 =?utf-8?B?SGh1bTVlUHcwdCtUcFVvOVVGdWExQVNwYlIzRTFCYlNDTC9qYXZTc0p3bm90?=
 =?utf-8?B?QUhEOVkrcjd3OHRzaGNzMGkvMXE2Nzc4VkFqZis2cUlibEdkV2FYc1JIS3dx?=
 =?utf-8?B?TnVRSzdXQk1Ubks0RFRUbFd0VmNvL1M1MnhQWFFxRGlXc2FPQ3ZJWjZHUUJC?=
 =?utf-8?B?ZzFLbjVkbGRPdC94NWxyY0R2RkVaY3AwdUNTMFdYRmU1aCtvQnFVMEc5RmNP?=
 =?utf-8?B?clo2bVBoSlIxaWN2WWs0d2plNUFEaHRpcEZ3NnlFM1ZjT1NiMFZMbEhOZTRr?=
 =?utf-8?B?MWhCMFFSZitHNnVxNlVBMklzR2xvdFowUHZBMUNGOExhZ0d3S3QxeFowUkFi?=
 =?utf-8?B?Q3ZKVlNzSFN6QlptVXpYdW9HQXNhMXdmOUxwbCtuR0s4eEtkRVZMY2Fpb01s?=
 =?utf-8?B?K0xkT2M4eCt0dlA1dUFBMXVTM1VzZGpqNExRT2J1d0owQ3RLZTEwV0tyV3Yz?=
 =?utf-8?B?aDFsRHFJQ3U1dUN0RExlT3Nrb2lyWXlITHFsNWx0VHZ4MTM3M2pYVDh0eXAz?=
 =?utf-8?B?NWZIUVMxVkNndGJhRGo2NDhzY2tNT3V2Q0orSkc2enBCWHUrQ05XbzVOaFBp?=
 =?utf-8?B?YnhzK01NTy9KZFphK0JJbzJ0SEM4cXhrb3M4bFE0YURyMWJEeGtPQ21PQ0lo?=
 =?utf-8?B?aHRPSFpEMGthaGY5b2l4b1VxU095U3FrV25pekFlNVpObEwxYWQyWGQ1Qkdu?=
 =?utf-8?B?em1FeGhzcnh3dGZyRllVRTFSYTdqQlFHbzdZKzc4a1hlQkduTVp5MHFlYlJH?=
 =?utf-8?B?aXc4MVVyai9qV1Y3SFNYYUNNeWNFc3lGMlNBUUEwVWMrekY4THpKaVFmVC9Y?=
 =?utf-8?B?K1VxRHJCMXN1WDRtRXlxRFBlTDV6NEdEcDZEdCtRUmhUSkU3SDFFS1hxY0VR?=
 =?utf-8?B?QmRDTFZMTURCMUhYQVZBSkhZSmV5Yk5BTFBQTlBHbHdaNmg2YzNWRnhaVUNj?=
 =?utf-8?B?YWxOUkV3MlFJMTdUaW15Q2pTRFVqRkZsb1hkdzdyWmFaWlJ4c2NyS2IrWDNq?=
 =?utf-8?B?bGgzbzdMTzBVaUphL1BWbWJmSEhOMmJ5K2d6dUJJZmlkMlViSGRCajdhL3BO?=
 =?utf-8?B?dmtUVGlYcHQ4WFVsRnlHeFVlTVBvbHYxODQxVmdmSDl6NUh4Q1hqQXB6UVpB?=
 =?utf-8?B?OHBIQ2Y4dHY3NDZXRHJJc25mc3dVaU9helpzUm15am96L01pRVFIS1RWeFF1?=
 =?utf-8?B?Y2F3MFZyNytHSzR6eGlDNS84WHV6d3RsM29hRGlkeUp5S0JBVSt0V2ZQN3VQ?=
 =?utf-8?B?STF0KzFYeXFiYVZ4bDUwZnBsSWd4NktXOGFkSHl4eG55a29XcHYydTkxMks5?=
 =?utf-8?B?Vm1WVGIydFhUc1RLQjlKSDk0dVFrK04xMjhXVmJqTGxzcUNnMll0VnlpWW1T?=
 =?utf-8?B?K2xaUHdwY3RoU0xqUjZpa0RlUVBlQmlQMUpnT1p6Zm9wQkE4YjhUbndzeVMz?=
 =?utf-8?B?dVNudWZSNEJxMmhJUFR2WjY2VkdQOUtTd283eW5zdXg0dS9vQ1c1bmxCRjF3?=
 =?utf-8?B?cy9WNk1HMHEvMVpaRk5Na2k2ajl4NVQ0QTVFUmdydmtKYU5jUktuSzRqdTJx?=
 =?utf-8?B?MCswL0sxZDZZN0hvZmw3eTdzLzMxZTRFZTBqTUkvK1lmVW1qODNhT3djNkdz?=
 =?utf-8?B?dk5aSmx2VHhaTlY0UHl1TUk5WVN4WkxRdUxXb0dXT0JlaHZ2TEtsSU9YaVlz?=
 =?utf-8?B?VkpFSjNHemw2WUZlM1JGUGNEWHdNTHg5T1FjQlRiZFZEamN4SjlJY2ZxSlpG?=
 =?utf-8?B?eWQxMTkvT3d3L1JFLyt0N0NQQm96S0dwVHBMTGpBSXVOYzQ1NjRzZFhaVEdI?=
 =?utf-8?B?N2pXOVpOakMydGVDNWQ0L3pFUkp0ZFBjMCtVdTh3Mno2MjB3QXE5S2xFODlZ?=
 =?utf-8?B?aEt5bGZZQUxxcURZeUY5a1dDYnlCSjhIZzcxS2xMYkhuVjNlSk1lU2Fpdjlp?=
 =?utf-8?B?VklFeklUZjZkOVQ1U0tCYSsyZXdMbFVsR3dJL3owTWlrUzFocXAwZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0920e253-bde6-4be9-0cba-08df4186daf7
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 13:05:56.7568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcrlk3+KH24c9ZZCykBt0nCYnayaAXeyWYxAY8bVLtW1Hv4ZSz58uiNX7PdTVz5D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8444



On 11/12/26 20:32, Pufan Jin wrote:
> Add devicetree support for the ALINX AX7Z020B board, built around the
> ALINX AC7Z020 system on module with a Zynq-7000 (XC7Z020-2CLG400I) SoC.
> 
> Changes in v3:
> - Drop the vendor website Link: tags (Krzysztof Kozlowski).
> - Drop the empty bootargs property (Krzysztof Kozlowski).
> - Rename the USB PHY node from phy0 to phy, as there is only one USB PHY
>    on the board (Krzysztof Kozlowski).
> - Keep the explicit mdio node under gem0, as requested during the v1
>    review and reviewed by Andrew Lunn in v2.  dtc W=1 flags the parent
>    node's inherited #address-cells/#size-cells.  DT schema validation
>    reports the same Zynq-7000 diagnostics as zynq-zybo-z7.  The MDIO
>    layout was also verified on hardware.
> - Sort I2C child nodes by address and reorder status/reg properties.
> - Add Krzysztof's Acked-by to patch 1.
> 
> The "alinx" vendor prefix is already queued in linux-next as commit
> 1f06cd374a60 ("dt-bindings: vendor-prefixes: Add ALINX vendor prefix"),
> so it is not part of this series.
> 
> Tested on hardware before the DTS style reordering: SD boot, UART
> console, SD card, GbE (900+ Mbps and LED hardware offload), dual CAN,
> I2C, QSPI and XADC.
> 
> Pufan Jin (2):
>    dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
>    ARM: dts: zynq: Add ALINX AX7Z020B development board
> 
>   .../bindings/soc/xilinx/xilinx.yaml           |   5 +
>   arch/arm/boot/dts/xilinx/Makefile             |   1 +
>   .../boot/dts/xilinx/zynq-alinx-ac7z020.dtsi   |  71 +++++++++
>   .../boot/dts/xilinx/zynq-alinx-ax7z020b.dts   | 146 ++++++++++++++++++
>   4 files changed, 223 insertions(+)
>   create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
>   create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts
Applied.
M
