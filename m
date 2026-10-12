Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013013.outbound.protection.outlook.com [40.93.201.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAE1492199;
	Mon, 12 Oct 2026 13:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811229; cv=fail; b=A8B9Lu+qotiawDuhoVOwe4HFamcAUg5zmsx6XHikhRtqHKj2oKow1TwA4NqxD+0/S9Mt8hqMguhjos7cbwwAfJCooqcy0Z2OeMETuVf7XtWAdIeKTXRxf0H2+Eq3JtmRMTWV6V1+WBHJV9nC5GaBxzFDF+OglO+iaqxamamsDRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811229; c=relaxed/simple;
	bh=dzdlKVURFrSDRwStvKZ6rTj3/QZGmmNqfGAr6u/icFg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=in9q/8FGWm+ysAU2qme0vB0APH/HgDyAPp865fq1y7CfGF5iKvp5Qv6eh/R0JoLI/EonXE9wd8POUQZTu9KE0LrA3Gj46QZlv3G6CkL1DUc9nPKM2ktC2O3izGohKWRe54k3C/Sofcjx+1mIwniu0ljsJjvNN4TFD+vxVPEn+0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UwRINOaO; arc=fail smtp.client-ip=40.93.201.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UwRINOaO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lSqE6sPFQ09vBpSIowpmfoTIymXRmKoDdv+maHSaDfUHPmFc896PatJig7aiBgc5tSCWjUB+o+/jd4PLkLnlQelwsY17CQDrxiQUsuumPAsidQJwyTYW4tv2iiz4DCBkAshYceZ2sXgKxTYSFCh2UwaP6euViYk60D7+BiEm5oVccGe1AOSAmWal6nkljZ1i34TD2Nt9g1I+NoU6CpnJWDUE33XoedrQMwo1sgN2efsjWqPlI2c16FIOMv3kJnREb2NjIb0wmHyympFdHWRy85SmvIXdeYhl+GsLLliG+kvdY2cne3MM0wSITIVX+gWt9H5vRSz6Lm4LBQt76mO/tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsavDAX/3MDZHTw8z8wHbAfvPIx8VoY5AjONqabr8xM=;
 b=foImQKVOE0wv61kVdlEJ41yZnQjdMTCOygtFh+huEiP8FHdCpKjADvEBapwaexBSUpIW3yfoeBAua1klc1QiI7tHU6sdDz6QaOyKOw/04rQy9Lmuwn9Z0vabMYR84v2+XABu6W179fVQkaZEudq9/NSAXDsiY0wU0GS7HIEDi7I/YTSOwoA2XiyWKUoWSzLzwPOPdPloCxI+Wc3UxnYsCCneHj1q9zrg2h1xA2kGyQhstpupiizsH54LtJETLBsJjfP1KKrnX11Hdl3XiPaDVdW8iq5F2JEqTdbDg83ZHD6AJaypBRhatIay5TU/Tc/qWJs3+lg5fn/dIDWaHA5jKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsavDAX/3MDZHTw8z8wHbAfvPIx8VoY5AjONqabr8xM=;
 b=UwRINOaOrgeOmd0jGq8O21PGUVXvOXyCaydUsTDnuB6P8FGsn+g11n29DQC5Yk0Cih45j0aH4KfunMqSVyeTVN8Gl4E+MmvPQn3+vcoauQ2cq1uX4QujAGKWBBNiIXB5EVcb0/XPvQ1CC6N3uY+El+vrrdQYSwh7Ldptz0fHWxE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DS4PR12MB634945.namprd12.prod.outlook.com (2603:10b6:8:514::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 13:20:24 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 13:20:24 +0000
Message-ID: <93ce7c93-bfcf-4ddd-9f0d-4f34283acc50@amd.com>
Date: Mon, 12 Oct 2026 15:20:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: zynqmp: Add ALINX EdgeBoard FZ3A
To: Pufan Jin <2254650260@qq.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, andrew@lunn.ch
References: <20261005173308.710986-1-2254650260@qq.com>
 <tencent_163DBA80049809D3688C55105F454C89E406@qq.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <tencent_163DBA80049809D3688C55105F454C89E406@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::11) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DS4PR12MB634945:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bfc1dbc-5693-4200-a4d3-08df2863931f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|11063799006|4143699003|261009223027099003|260925021911599003|260925021311599003|260925022911599003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	djIIsDxKoWiPfZiVANg3dTQbbNrovGFkw+i+THwiFMR/7iB5yXlLVFGVvj26WYlYiFJimFS56lZbQzWxf/LeCZ8sInW7gH44yo8d+6Q1MepztRPmBk3TAGe9Onf9bdXXdziHceHcK2anjTk0WRHD8gf63FnNHddlq34l0hXfPFFqX1OG0xCibB+XfndXSOMvBhbDeoGf/tthOkEaWgu+9N1XRe4lK0f06PPnmJVsyxlfJFIW/P2ZyOD/g6EnMMC8sfeTScArGjRRhfTbF2SBtZAKtn+g2TB/enaxBPZVNyJz+v1II4MLMeyyCWk9MlbvKchTlHvFQY0PaQ59IkQmpVii35qmLvXgWHuuUezr4oFwwQkrzQA+7b4YPDo5sMxk1eDe7cTS85gK+sF8GzpjXDlXM064FIrfp9IQI3Z4gdUg/TLvpuVZWJn1MMX7akej7PZ5kZ2IiW1Kb6rtr424x1qqp8vsUHpMc7GXxpf3W7IDKPMAYqUydbc+lLyRG6j98wW+k3FNTAEoWJjeJPv7t2Na9uLVy1TopRLyot3Q63s8P2Nhgb2pskl/wNnQp3t729/QoBBDrc7imYasPtS5rWkmLEJr3ZrWmAgnB1W02gNnMLT85qgQYsO5i7BTU5vHYhwFv2PmY7U9IAG0r+V3wcgWZAFKdTqqTGgOLd6yAis=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(11063799006)(4143699003)(261009223027099003)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEZvcWloNlhncnJZcmF5V1VCNitpaW5PRnY0R0FrblJnZmVvemFOZkhqcHRx?=
 =?utf-8?B?bzQ3bXlNZi93dWxnZDRhWU54UGhOQ241ZUx4WWlDSXNWeEFpMXhoMmczVWJO?=
 =?utf-8?B?L3h6OTN4YlcvQnNuZmpqblNzc05YMUs0QTZQNE1rTjZjRUpPeXU2Nk1lbE5B?=
 =?utf-8?B?aHF1L2t6SUZGN1RkbkU0TGR5azZHZ3BVampmSHhIc3Z0bHROSStHOTRUYTBR?=
 =?utf-8?B?SHVqSSt2eGtHUGh0ZVV0R09PYWJhRUR1dGZ6MlBFVFZnbjNzZy8vZGNFMDBB?=
 =?utf-8?B?aWhFT3dnUE9IYWZqVVlnZFVSSHYxQU1QTFNvNnBzN0ZXMkM3UVJhR2tuOHRY?=
 =?utf-8?B?aXFqcmR0eVBnYkxROG1oUkpqUllRd0Y0K3pYcm1qL01GcXpTTnF1QW5mWExh?=
 =?utf-8?B?Yjh2Q0t6MlFnUTZ3Wm5MUmpqbDJvWkZYRDU5STc2STdtQzRBdEJteVd5clVD?=
 =?utf-8?B?emtjV0JTZHNNc25acXFPT1NCcUpIbkhHRUZRWWVjVzZvZ2FuUThkV0J1cUlT?=
 =?utf-8?B?S2k0LzQ1cTVnMWd4aXNkU0pCMEpCNWduTVNYK2pmbFJWdXFJcHNhbmVka3lU?=
 =?utf-8?B?NEl4cWphN2JmMFdSd0U4clRTcEJKYktRNTZuNi9ZYm8rQnpXcmtYMzRjNW5K?=
 =?utf-8?B?OU1kMmRHK0NIeUhIQkllNmN4NVBQODBMUjloLzR1ODJ0WWdoM2s3dWxRZnc2?=
 =?utf-8?B?S1hTbGYvVmdxYUh0OWtaUERoQ0hIVWhUbmEzczYwNm5FUFJUZlBBWDBIYUlp?=
 =?utf-8?B?eEs3c1BkbDVxOEx3YU9KbzB2OFdpYW43RTdlVkM2ZzduVC9mR2JBQVBwZnNo?=
 =?utf-8?B?ZUtLdFNUSGVhM1ZPakFKYXJJNGx1QS9vLzRuLzY3L1lZVHRzdEZNSjZZSGFT?=
 =?utf-8?B?MlhjWEFwdUt1eThjSy9sMDNhSG1zVzJRc3BMZlUyQnZES3VVZ3Z3ekVkVHZ5?=
 =?utf-8?B?MmNVU0EyemprV0ljdXI1d0tOek5kQThCc0VnaG1MMStwNktqV0Zqa1ZOaGtB?=
 =?utf-8?B?ZE0zTzNxZXV6Z0tEeWtkSEhYWnllaENHYjBETDNWb1VtNUtaaytwUlVLdUNK?=
 =?utf-8?B?aGMyNVRVakZibzdwRWMyNmhFcEswTklITkt6WHVFNFZxNmRIQXVDL3RUOUoz?=
 =?utf-8?B?MzFmT2VWbmhSUVVzY2hmOUs5NXNmZjBrS2V3bG84cEhrY0I0aHdjZEdUejBZ?=
 =?utf-8?B?ckNPaHBLekF6K3RpL0ZaYXlEdCtlSUU5bjVBbVJxUUhzRDIwL3VWMzg3RlVx?=
 =?utf-8?B?bnJ0S2dWd0V5RE9tY1JZY0lmbFRoQXdmSGk1Uzh0TFBSZjQ0amlXMlJScVp2?=
 =?utf-8?B?ZXRSTWtHeUZ3eUVGdzVPWGxQUGNJWlIxYmo0Zy9FUk5rb01qYkt1ZjdVSWUw?=
 =?utf-8?B?aTZWZWZNVmhEK2F2Y0ZnY1VtbGZvc25nMWw0NmdjZWs0MFEzNXlLM2tXa0tB?=
 =?utf-8?B?VW5NNW5pb2w1N004U2lPQk96UW9pczE1bDFULys1bmIwNXpBOXlXNGNCbVJj?=
 =?utf-8?B?Z1cyaGlmRGN1Zkg3bk5HZzJxNUc5YTNKSXNxclljRmtleG03QncvOE9pb0pi?=
 =?utf-8?B?S3FVYjhKVk5Wb0hpOHJmUitldTA5Ui9EK0RlUUNYU2t5QWJNN0RoMDdLVXR6?=
 =?utf-8?B?c2NtYzV4WW1oSDh4ckoyQlpZRTlBYzR5VGttUWRIaVhNRnpaL3p2OUVqWkZp?=
 =?utf-8?B?L1FOSTJiMHZLUzV3bWwzQjNTVldLaWZCbHRQd2pjeVN4UTdjTXFYWUI5YThj?=
 =?utf-8?B?aEN5OVQzNGJLWko4ZjBuL3RZb3kxN0Z1S2RPbEpvVE4vOW1nTjJkd2tScmpt?=
 =?utf-8?B?UTMyYWEvUWM2VnRJdHdNM3dLeVBPejV0SjdJYWMxVlJGNER5SnBEU1d3Tk9q?=
 =?utf-8?B?OTVoaCtNSko1RTlzV080WVBxeHZSWnhMQXRzTEo2ZkpDa05OSGcvaEpLSjI5?=
 =?utf-8?B?bm5jY1NiNXRSbDN0SXI5TEk0a0JSc0hQWVlhb3VJVkFjY051dFIvbitMSWFO?=
 =?utf-8?B?NjJxc3JQZDVBM1dZdDRKaE5jNTB0QzZLd2M1VXZXQVg1bzM2TG9lVXRMZ1I2?=
 =?utf-8?B?VDZBeW9pbC9MNThpVytkZUlGWlFzYnI3blNtS1Q0VDBzZkdySkhJbGthM2RQ?=
 =?utf-8?B?MkY3Y1g2aE9Uem1oMUpYQnZ3VlVSNk9wTkZSSHU4QUlQZkVCL2RsYWlBUnVP?=
 =?utf-8?B?WUdTSlRzdXdwWkJ6Tkc1Wk5pUEtnOFVIelFqeDN2U2Y1a0QwOHM5ZkJjUFRQ?=
 =?utf-8?B?MGs0ZWtRNzNrcDNlUXRKR3RvUlpzSGY1T2N3UzhuTnFDUTRjZWNaYWEvaG85?=
 =?utf-8?B?K3JubG9kVEJXM0RPMTZjdjFES2huNkcyL3p1Z3VRd0p6WDlXZHF5UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bfc1dbc-5693-4200-a4d3-08df2863931f
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:20:24.6568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4rYlphag0DHB/6tLkyH7xVrocbXZmllwaM3oVtD1oqT02GGZ20/hVAoYq1mqe9XI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB634945



On 10/5/26 19:33, Pufan Jin wrote:
> Add device tree for the ALINX EdgeBoard FZ3A, a single board computer
> based on the Xilinx Zynq UltraScale+ XCZU3EG SoC.
> 
> Supported peripherals:
>    - UART1 debug console
>    - eMMC (HS200) and microSD card
>    - GEM3 Ethernet with Micrel KSZ9031 PHY on the MDIO bus
>    - I2C0 and I2C1
>    - QSPI NOR flash
>    - PCIe
>    - USB 3.0 host
>    - DisplayPort output
> 
> Tested on hardware with Linux 7.3.0-rc5: the board boots from SD card
> into userspace over the serial console, gem3 negotiates 1000Mbps/Full
> duplex with phy-mode = "rgmii-id", and the eMMC runs in HS200 mode.
> 
> The base DTB passes CHECK_DTBS=y, and the Xilinx SoC binding passes
> dt_binding_check.
> 
> Signed-off-by: Pufan Jin <2254650260@qq.com>
> ---
>   arch/arm64/boot/dts/xilinx/Makefile           |   1 +
>   .../xilinx/zynqmp-alinx-edgeboard-fz3a.dts    | 350 ++++++++++++++++++
>   2 files changed, 351 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts
This series has no cover letter and I can't see any link to public board 
documentation. Please provide it and then I will take a look at it.
But please send proper v3.

Thanks,
Michal
