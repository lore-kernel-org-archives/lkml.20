Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793285586;
	b=3PmBv9qkrplkZ1eGa0irK+L28UMFH3mudgzM9xcbyTTZkvbSWqvHMAtA4JmmhN4tx7vr
	 1zHkhpEo7cwkf5dWcpPh7ypdQP+YF6gRyIkIQ6pcd7NT9WfenjIwlgzlEH3DVg2kBAJsu
	 ceIzdrMytZHbCdtqMqBToLVpx4DURszpBVDF1BrjvvaND1HTnDZRxJmPVgePKN22ag0rR
	 uihz/renEETGlRaXwRep0IqwfDWAS2kDB+m3eevWFprRJNWoqEqIph9WbMaMIX5s/k9wU
	 EXDdmC1Aw+0x/eSXGR0Wee5C9qKcHHAgKAGlnj3zFdlPJjdIz1pZVfT+P1WqzndiBjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285586;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=JT1uYplCOaQfe3G3+EMKKziiiwJNG0Lhyr/PlEVnkxg=;
	b=QluabRt7uu3LS2tFfOCN48kADsxQoN82WVp8rsAb31XAuOk6bd4Ca2kHzHFx/GVqDljA
	 Tg7v9OhvwyeQFFnFA+1bx5RnDwk9eIq7ZOiJP4NAkZkWMW3f70sbExtptc6/fy4s+9RsW
	 M/MnQNtJk5RbW+lqk/z4k+z+o/yt1M3oe0bFbRfiWROQKtH/pBOIQJC+DP4J/0jSuKv4U
	 Tq1FXlKAXWKCoy3zN5SM0EaDmld03CLi0c3YhzdOrNviIcCQyoqTtsYA9F5COhFZmp0Lz
	 kmxrcDiab7rqN7qeoaKddIhX6qsESq4ym88pEOcoRv13UgW0yMzFaFxCubQb51f6XSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wuxehzXf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.1
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011001.outbound.protection.outlook.com [40.93.194.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DED606A31A;
	Thu, 29 Oct 2026 14:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2DED606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wuxehzXf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fsg0pGDxeyRvnPXekBEAlVmEAoN2PKfJTQHNzG6xK/8f+y6tFbMqwbrYZVMLQuPsLR7N2XTI3N77wD9+gs9XTPY76EwhmrJfx6TSVTRKWiqkxOmqZYrdzhdqkzDtxXZyXXOBxuDUP9Sk51/OQXzyyt2rx9rBX1Sd+trF8mU07B1IWNBUvlCVtdiE3QTqhrQh55h96jVxXxm7iScaMaYR5USDbKtlv7RhQWsY/OELKCcsp9WunCtfrUAogQx7+fgUsUnxQK1WiKgk2N+6wcgAFtWiu0pus9F6bNesoJyAgmB5GhsZu8WvRFY7iJscelxawE7Kg2xMDXmIrL6hIr+pVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JT1uYplCOaQfe3G3+EMKKziiiwJNG0Lhyr/PlEVnkxg=;
 b=ESf7n7mflvCp3BQVI4Ab0Iti1JMjduC860F/fe0ENjwsae9PuOt1+peoFI422S4LVc/Pii5zq1K1gklznNGiF3h0wZH3u1PVd1Tg9Y0x6Bif1zQUDk6Wv8lapJadHKmALEtyjQs7jSqcogQ2qcvdrUTeKXF1yprqdQ4kMPDDnJJuoW3GcaOLUYtRQFcedtwGZ0rfHUkq+1S3/OGdgWFG5ZyoyhXkXlhsOSj0hpPaZ2XJBvYOTqsi6BcGO6vWT9y5/j7WynLXd8AuKOBdF8RHSbWZBQ64DgBV0Hw/3HbNE8yRRm08zEgKQYyCOSkys9q5zmPxbv+ayGFvYYl7EMmBRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JT1uYplCOaQfe3G3+EMKKziiiwJNG0Lhyr/PlEVnkxg=;
 b=wuxehzXf1V41bq6ddgt83jpeuF/R4wCi8AfMaXcCDYGZe73o+rplNB4/iEdAUVfFKhUlAT8rRZEwhIfqrwKMMMyzKUZlp3glDgc3rWd6711Qp0ck1A1qMx/FJFYHne97np79l/uWxqhDO3HPid4AopTYMjxGp2UHa58wEvFu0Os=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DS2PR12MB9752.namprd12.prod.outlook.com (2603:10b6:8:270::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 14:52:47 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 14:52:47 +0000
Message-ID: <b683fcbd-ae5b-416c-96e1-7b0d7146c468@amd.com>
Date: Thu, 29 Oct 2026 15:52:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: edac: xlnx,versal-ddrmc: Add
 xlnx,versal-xilsem compatible
To: "Veggalam, Rama Devi" <rama.devi.veggalam@amd.com>,
 "Ghannam, Yazen" <Yazen.Ghannam@amd.com>, Rob Herring <robh@kernel.org>,
 "bp@alien8.de" <bp@alien8.de>
Cc: "tony.luck@intel.com" <tony.luck@intel.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "rric@kernel.org"
 <rric@kernel.org>, "git (AMD-Xilinx)" <git@amd.com>
References: <1792587442-2794880-1-git-send-email-rama.devi.veggalam@amd.com>
 <1792587442-2794880-2-git-send-email-rama.devi.veggalam@amd.com>
 <20261022143730.GA1287910-robh@kernel.org>
 <20261026203920.GA696395@yaz-khff2.amd.com>
 <PH0PR12MB8125B27A7814A3818739C4B9CE6F2@PH0PR12MB8125.namprd12.prod.outlook.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <PH0PR12MB8125B27A7814A3818739C4B9CE6F2@PH0PR12MB8125.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIYP296CA0008.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::10) To LV5PR12MB9779.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DS2PR12MB9752:EE_
X-MS-Office365-Filtering-Correlation-Id: 178d169f-c026-4215-1f39-08df35cc4c0f
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|261028144727099003|11063799006|4143699003|56012099006|261009223027099003|261009221227099003|261026140227099003|261026121527099003|261021123027099003|261021121427099003|261022105027099003|10067099003|261022075727099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	fx9en4EkUYshWot9JOAp1XRZU5W73jEyv5zk5/RBlQo+0LjywZ2I+oNsWE4jtDKeiQkZjxuSi9U0BE+bh6UfpJTx6fWbh5Rp4fWNqI1RYJZD9bZlVvjL0b4w2RfaiEgqYNJheyqPYq/QqzHaaia874XfsrFjrdIsZRkKkaFcRoremEJDLwh1JExej6xl5HzNrGpaazVrpM1IhhN7alZsae/k4cx9q6kjxK996Jmwk5JXG0vgN7NM4wvIoOXLt3wIkZWiLpetBURDH6HhZSNKgvxTeWdtU1zMhTiNeFtkqBjug4gPyJNOFCn9WezImZKHJ3ymVVUS2A0DMhwp4Bu7QJeQa5wDnUXjlqDG1NyyTFL1HGN2YV/yHSHiB++Z7pPp1Yp8gNBJ0MzgrRnEDlMN9V4/xzLFrX1gdvjvxi12PHrE2Ym362chDmCv1+pdw61uWtn0bsC3WlsZ5+ubfCXmIqbrqccVCzpdGEk+ziKDVTdXvnpHlfly1OJ/LTVqRd1UlhRj42B1EH7rKkTQdDVehmTioW8PPoxNhnytpdUQax2BkkzS/sfTnF4I/UQK/R7EFVv1VMzU08QM2H5xLgIbXI+NK8Y65YlfbJjCl16WSZEdc6Kn2t8wnFaDkfPzpxuI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(261028144727099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261009221227099003)(261026140227099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022105027099003)(10067099003)(261022075727099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVZTRTNKc2h6YTA4em50NGpHWlFmK0JTcThXVVZ3YUZaS1NRWWd6bU1aenNI?=
 =?utf-8?B?bC9vbzRoR2Q0Wk92dDNJRExwd0NqTXBIVmhEM2tDOU9tODV6bXp0Y010cVh2?=
 =?utf-8?B?MUdubjE5R3ZCTE42QU5uZmlRSDB4ZmZXbkNWSGZKVlhNekxKM0xFdmZOUjgy?=
 =?utf-8?B?SDI4NmQ0aGE0OHVBY1F5a0EvZ2loVDFZRGs4OXVtaWczSGpIbkc5VERESndQ?=
 =?utf-8?B?cmI3UXlUUE5OU1B6Y0RURU40c1ZLSVU2bUVoL2tiL2lJWWkzK0J5YVlrT2FD?=
 =?utf-8?B?VndGNVk0a2Z4cFVXNlpMTEtNNDhLbC9zVFliNU9DNkM1aTFMcFJ4a3k4TFZB?=
 =?utf-8?B?QnRnVzQ3VE9seXBPYUcxMnFVTVhXTnhYVk9zS3ZCazBxUmZjUXZHcHEzdFJJ?=
 =?utf-8?B?V3AxTW1FV1hucEJGcC9xVlg1dHBVaFpiV09TRDJjWEc3d0Z4UmFhYzNjblBm?=
 =?utf-8?B?RXpqMlRRck8zTVZYUjZtK0ZuRFEraHF2WGYwR0s0bWpWSXdBOHppY1BseG44?=
 =?utf-8?B?WHBFMFoxWEt3ZHF0NkEyK3UvcUNKMVVTaDkzNVU1UWc5MmpPZm9BN1RiVVg0?=
 =?utf-8?B?VHBReWdHUFV4QkVjYmhZQnhsR0k3bnh2RHhsNlkzMTdLNmhKL2dtVlV1aFBI?=
 =?utf-8?B?TmtSOE4zWjVxYWUyaUVZZ0F4UWFaNE5yRm9YTWh2NjFYRDJ0eDRlWWlFejlu?=
 =?utf-8?B?Y2lFc2R3QUJyQzFrWWNJd1NYNFBOTGlzRXliMlFINUdiY21EUjFmWC96SnEy?=
 =?utf-8?B?WnJyeHIrWjVGNWZxYmdRcllQZUZ4M3YzYzVHYjdSYTJiZ3ZZQUh6WkR1VG9p?=
 =?utf-8?B?bnFEY3FRZDU2cTBSYzh4dUJqOHNjaXJXWDE1MDFWUlpIY09DeWFaZ1RvUXg4?=
 =?utf-8?B?ck9BdkkraG9KQ29jNkNpK2N3d2RLbjE0aFN5N2M1WVpXeDNwZGR3d0dndXBN?=
 =?utf-8?B?cnMrOGZycHRlMVErU2M1d21BOUZKZ09pTHN3UzdOS3F3SlJ0SENUQmNGYkVm?=
 =?utf-8?B?d0xDSFk0cHpWejQ3ZHpUWGM3QnlqbXhLaVM5RXBBaitBOXYralJacTVKcVBw?=
 =?utf-8?B?S0p1RVAwWC83UEVXRTI2Y2dFU1daU002UC9MaEdRNGthVkd3ei9aRTVhWHUz?=
 =?utf-8?B?RURmZjNKM2xmcmo4ai83WlZYR2Rwb3ZCdmdzNHV5ZGZLMGVBWmZ0amF3SGxH?=
 =?utf-8?B?WVNldWpsUlpQUXZoUEJZV2VqTHpXMXRlSTZNcml2ekJzZ0ZaSDEyVGhUR2hI?=
 =?utf-8?B?ZXZyUFVpSFJVMGIrY1Z3aGpUeEdVWXIzYmRrVXBsRTNyZytqOTdqd3VROExv?=
 =?utf-8?B?anpIU0dOMkpvclk0bnM4YXdVMjY2TkRtajIrSXY1ckZncDN3bzFQTG1sMU9J?=
 =?utf-8?B?b0FNbkhnTXo1TUJ6RXBscURQRzZYWHkrejVNUDNjK0JoT1RrNTdHN09oOEhh?=
 =?utf-8?B?dXE4ZE94OUk0eDJwc2JWelRFejNHUDJmVVhBVVhQQ2x2c01ES0lIOTJzbHpm?=
 =?utf-8?B?Qk85bUpXSWE4bnFKTE4yUVl5RHp0REo3TGh1MlpycEZqRVdSUlowaVNHZTJj?=
 =?utf-8?B?dVhPakhTQzh5djAyRzJtQitIaEc2NHhRRXhqR3pSTTlVdk43QmNPbVFmcGhp?=
 =?utf-8?B?WEpNRllFQWsydm1PeDQ3aXBWcUoxTURUOHRsODNNUlRsVmhYWXV4QklKM1cy?=
 =?utf-8?B?TjUwZjBGNnRYT3FsYmwxSzRVWnNPL3lCekR2c2NVUU1Pa0p6SUEySFMzZmZ3?=
 =?utf-8?B?OFhLOU1WSi83c0lvdUF4VUZrVFlKUURidHBrQjRraTBuZGlYT2l0R3R5aVhB?=
 =?utf-8?B?QnFMSVM4Zlo0bktya1N1cEFIODBzZXRtMVdUTUErcTJKQURIbGIrMTNScWJF?=
 =?utf-8?B?ODhUbVlqZmp2Y3RuT056MVFmZmVyOUJVbkVaNVh3bkxkcFpzbVFiU0duS3RC?=
 =?utf-8?B?U1JkZ0lyTTh3ZUp4S3owbnVFMTRaSHRkdTVyR2NHQU11TEhyaVllUW9BZWtw?=
 =?utf-8?B?bWgrVnpkeXZ6YVNJVG9oQUNTenF4b2dqVmozSmk2VDl2ZDM5bllOcDVaY1dK?=
 =?utf-8?B?ZGZQbklKWUNjRDhLK1lQWXBFRWhYZzNkc1RCb1hTa1hhZzAxNUl4V2dUTXFw?=
 =?utf-8?B?akpZV25IbjFNU1hyd1BBTm9KZ0ppNFFtenRoMXNiVWgxS3VSSmVYMHFlT3Zh?=
 =?utf-8?B?d3M4NTNPSW54cFFaUWJjVGJiWGhZNmVLTFdpM1lrQUIzTEo5aGwwZ1hHamhB?=
 =?utf-8?B?bkdndWJadUZPNXFGSGM2RTJtKzZTOUZtRGtSVjIvOTlGRDQyVm9CbUxzV3E3?=
 =?utf-8?B?cE9ZQmdVaW51MWtES2NqcEJocWxDSmdzaFpJTStidThQL2lzb2ZMZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 178d169f-c026-4215-1f39-08df35cc4c0f
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 14:52:47.6978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: quF/1RYECQuhBFus52m4jwpctK5iCwchHjLrRozQhym0zDyLXNQ96q6DYjHaHRzU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9752

Hi,

On 10/28/26 05:48, Veggalam, Rama Devi wrote:
> AMD General
> 
> Hi Yazen,
> 
> I am evaluating both approaches and will get back to you.
> 
> Thanks,
> Rama
> 
>> -----Original Message-----
>> From: Ghannam, Yazen <Yazen.Ghannam@amd.com>
>> Sent: Tuesday, October 27, 2026 2:09 AM
>> To: Rob Herring <robh@kernel.org>
>> Cc: Veggalam, Rama Devi <rama.devi.veggalam@amd.com>; bp@alien8.de;
>> tony.luck@intel.com; Simek, Michal <michal.simek@amd.com>;
>> krzk+dt@kernel.org; conor+dt@kernel.org; linux-kernel@vger.kernel.org; linux-
>> edac@vger.kernel.org; devicetree@vger.kernel.org; james.morse@arm.com;
>> mchehab@kernel.org; rric@kernel.org; git (AMD-Xilinx) <git@amd.com>
>> Subject: Re: [PATCH v4 1/3] dt-bindings: edac: xlnx,versal-ddrmc: Add
>> xlnx,versal-xilsem compatible
>>
>> On Thu, Oct 22, 2026 at 09:37:30AM -0500, Rob Herring wrote:
>>> On Wed, Oct 21, 2026 at 06:27:20PM +0530, Rama devi Veggalam wrote:
>>>> Add the "xlnx,versal-xilsem" compatible string for the Versal XilSEM
>>>> (Xilinx Soft Error Mitigation) hardware block.
>>>>
>>>> XilSEM runs as part of the Platform Loader and Manager (PLM) on the
>>>> PMC and detects (and optionally corrects) soft errors in Versal
>>>> Configuration Memory, notifying error events to user applications.
>>>>
>>>> The new compatible string only needs a single register region and
>>>> does not use reg-names or interrupts, so the schema gates these
>>>> requirements per compatible string.
>>>>
>>>> Signed-off-by: Rama devi Veggalam <rama.devi.veggalam@amd.com>
>>>> ---
>>>> Changes in v4:
>>>> - Added a new "xlnx,versal-xilsem" compatible string to the existing
>>>>    xlnx,versal-ddrmc-edac.yaml binding, gated via allOf/if-then so
>>>>    DDRMC and XilSEM requirements (reg, reg-names, interrupts) are
>>>>    validated independently per compatible string.
>>>>
>>>> Changes in v3:
>>>> - Merged XilSEM edac with Versal Edac
>>>>
>>>> Changes in v2:
>>>> - Changed "xlnx,versal-xilsem-edac" to constant
>>>> - Removed "compatible: in required section
>>>> - Removed "|" in description
>>>> - Removed "items" in compatible
>>>> - Fixed indentation in examples
>>>> - Updated title and description
>>>> ---
>>>>   .../memory-controllers/xlnx,versal-ddrmc-edac.yaml | 64
>>>> +++++++++++++++++++---
>>>>   1 file changed, 57 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-d
>>>> drmc-edac.yaml
>>>> b/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-d
>>>> drmc-edac.yaml
>>>> index 12f8e9f..b5dc320 100644
>>>> ---
>>>> a/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-d
>>>> drmc-edac.yaml
>>>> +++ b/Documentation/devicetree/bindings/memory-controllers/xlnx,vers
>>>> +++ al-ddrmc-edac.yaml
>>>> @@ -4,25 +4,35 @@
>>>>   $id:
>>>> http://devicetree.org/schemas/memory-controllers/xlnx,versal-ddrmc-e
>>>> dac.yaml#
>>>>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>
>>>> -title: Xilinx Versal DDRMC (Integrated DDR Memory Controller)
>>>> +title: Xilinx Versal DDRMC (Integrated DDR Memory Controller) and
>>>> +XilSEM EDAC
>>>>
>>>>   maintainers:
>>>>     - Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>>>>     - Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
>>>> +  - Rama Devi Veggalam <rama.devi.veggalam@amd.com>
>>>>
>>>>   description:
>>>>     The integrated DDR Memory Controllers (DDRMCs) support both DDR4
>> and LPDDR4/
>>>>     4X memory interfaces. Versal DDR memory controller has an optional ECC
>> support
>>>>     which correct single bit ECC errors and detect double bit ECC errors.
>>>>
>>>> +  Xilinx Versal Soft Error Mitigation (XilSEM) is part of the
>>>> + Platform Loader  and Manager (PLM) which is loaded into and runs
>>>> + on the Platform Management  Controller (PMC). XilSEM is
>>>> + responsible for detecting and optionally  correcting soft errors
>>>> + in Configuration Memory of Versal. Whenever an error  is detected,
>>>> + be it correctable or uncorrectable, XilSEM notifies the errors  to
>>>> + user applications via the firmware's event notification interface,  rather
>> than a devicetree-described interrupt.
>>>> +
>>>>   properties:
>>>>     compatible:
>>>> -    const: xlnx,versal-ddrmc
>>>> +    enum:
>>>> +      - xlnx,versal-ddrmc
>>>> +      - xlnx,versal-xilsem
>>>>
>>>>     reg:
>>>> -    items:
>>>> -      - description: DDR Memory Controller registers
>>>> -      - description: NOC registers corresponding to DDR Memory Controller
>>>> +    minItems: 1
>>>> +    maxItems: 2
>>>>
>>>>     reg-names:
>>>>       items:
>>>> @@ -35,8 +45,39 @@ properties:
>>>>   required:
>>>>     - compatible
>>>>     - reg
>>>> -  - reg-names
>>>> -  - interrupts
>>>> +
>>>> +allOf:
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: xlnx,versal-ddrmc
>>>> +    then:
>>>> +      properties:
>>>> +        reg:
>>>> +          items:
>>>> +            - description: DDR Memory Controller registers
>>>> +            - description: NOC registers corresponding to DDR Memory
>> Controller
>>>> +        reg-names:
>>>> +          items:
>>>> +            - const: base
>>>> +            - const: noc
>>>> +      required:
>>>> +        - reg-names
>>>> +        - interrupts
>>>> +
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: xlnx,versal-xilsem
>>>> +    then:
>>>> +      properties:
>>>> +        reg:
>>>> +          items:
>>>> +            - description: XilSEM (Soft Error Mitigation) register region
>>>> +        reg-names: false
>>>> +        interrupts: false
>>>
>>> These 2 devices have absolutely 0 properties in common. It makes no
>>> sense to share a binding doc.
>>>
>>
>> Right, and maybe DT isn't needed at all?
>>
>> One option in the Sashiko feedback is to use a platform driver.
>>
>> IIUC, here's a summary:
>> 1) Drop this DT patch.
>> 2) Have ZYNQMP_FIRMWARE create a platform driver for XilSEM.
>> 3) Have the Versal EDAC module use the XilSEM platform driver.
>>
>> Rama, what do you think?
Let me jump to it and start that discussion again
https://lore.kernel.org/all/20250814102909.GBaJ26dZzvSs9usTKm@fat_crate.local/

"EDAC drivers have support for multiple hw RAS components in a single driver.

The stuff you wanna drive is still part of Versal, right?

So what's the problem with adding it to versal_edac?"

versal_edac/versalnet_edac and drivers for memory controller.
Xilsem is not for memory controller. It's purpose is to check CRAM 
(Configuration RAM, which holds the programmable logic configuration) and NOC 
NPIs (Network On Chip Programming Interface).

Please correct me if I am wrong but today edac core only checks that there 
should be only one MC edac but there could be multiple EDAC devices.
XILSEM edac device is present on Versal and Versal NET SOCs.
https://docs.amd.com/r/en-US/oslib_rm/Tool-Configuration-for-XilSEM
(Actually also on Versal Gen 2 but firmware interface is going to be different).

I don't think we should try to integrate EDAC memory controller with EDAC device 
because their usage is independent of each other.


Second part regarding platform_driver with DT or not.

XILSEM has two configurations depending on how many SLRs (Super Logic Regions) 
are used. Low level firmware (PLM - Platform Loader and Manager, the platform 
firmware) is configured different based on amount of SLRs.

- In case of one SLR MMIO access is used.
- If there are multiple SLRs (master and slaves) the only way
how to access data is via firmware interface where SLR ID is passed.
Also there is no need to have MMIO.

If I go back to platform_driver data and instantiation.

There are definitely 2 ways how to bind the driver
- current DT description
- or passing physical address via platform_device_register_resndata() from 
firmware driver, without DT.

Both ways are valid and would work. Which one do you prefer?

Thanks,
Michal
