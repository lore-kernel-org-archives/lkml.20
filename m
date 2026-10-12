Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010001.outbound.protection.outlook.com [52.101.85.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC58344839F;
	Mon, 12 Oct 2026 07:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790226; cv=fail; b=qx53+MHzWlm++tNDKmz27vn2Yb6ybCVuXV5Z9xjYwX4WbbIiOxubF1bWdjvPP2WMCjTfp31XxPLe/OtH3apkiUxmpXE5G6TKFa/taOyJ9ZzpGOUKyxCBXT/X2ra3ls6pwko/rErjWMmWdSAyMw1vMBsv/T8NuNUK+/7Vb0ALCRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790226; c=relaxed/simple;
	bh=WFlZjGVzFOJSb16DQALDfoB61l3DNFWIULyiPk3eB4U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X9zSOuBxRPQVjsXAuHqvZkyBn7wUBx7trP3QeLibasyAlRXwsua7scJyI+xowS7pyX+CgyCTFR3Rf3olmhY9Ce/D6Ra5byA7geBdMMB96TwjP4rZjmTLvrzmQq9Rqbgjk5wdACbvcWBtQCv4tcCgYhQdv+dV/CAHLVUDiLJAVt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=gpJVpS8a; arc=fail smtp.client-ip=52.101.85.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="gpJVpS8a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCjv/a3Yv6G1SiuTWq2mGy18Hhi9UL7UDkGROk3mqbvzboHIE7V7e55kYvLNxh4V83Rit4/iX5IKg1Y9AXt7RMg+smly7ks+V1UG50dIrfpLXPTrFn6FXV0EDiyXU+HTGLI975Jal+XSRgEuRrp9AbOrph1LOQ2M/VLm7qYmmBx90eiEyWaOsNV3/BrCJTDJshaJL3v8JCllZ281rOwPvoYlyxP1A4m46FLkidrZL7EtCNhyUtqHzYQcPLw+6kHB7/aaP1Fh/DLI/QaUtQm+BbQ+mgQ1Yk/UBgiXoBmu1wufxTucgDoIMNi0BaBwJUs/k4XldYaODy0uPpngaAmBYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCIT1YSE7kfRXvfcYnvNZ3gValqc3TVtSdRiU6d5LIE=;
 b=oKZVVu6Tl7TMPQt9BrNdi31CSjnmyxZ4jEvxjYjEfdq05CD4y0xkI6JpuzgbFI4lcnGpEov5XdBHkGx1LATbVDUn6EMTJZSuHRnwfrz6JdG7MLjY4tqGJ5PuYVrC2VPoZPY1kb1OtK0Z1/j88bkWmO0+O1zs+yq21taQqVjbUHU2fVhZn3jAG0dqiqdKc7pcH26UKnBC1tAGyuHdYX/6WIscq2Lq+9kZ0CbgVGdMc+lKtr5PqJ3FkyxNqpl/L0fZ6z3jU1ts2A/CTKUBFL3pLyk4d9AiX2UMufxxDY57OCW59BjtArzANtxWhVx4E2SZGvkkt+spWHcRKrC3isZfdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCIT1YSE7kfRXvfcYnvNZ3gValqc3TVtSdRiU6d5LIE=;
 b=gpJVpS8awbhUtKc4H1AUwNNs4lQdkJnGY98qrARPYymPvpElGmfK/dniX7LgtbBfPZZlRkZJF+U4IuJZTwGyv2Wh1yUSud9nWOB7vdIF7tHePIQiZPlp5//4mhP+YY/3fA6XYjQcpW0gQ5wYdIPQrJCMzT2MUoQiZIk6cuIIFmKDBQDGwXCcaHQkZz4zd5f9ald1JzVmJiRet3r/V1zx5w3Q30fPPH637KyvZpVsgAkX4b80Y1Vhd1uRG6xXMf4jAHmaZhp9xyqmTERt7fyq7HBtQg+fkunKb4MESCACNqQwLeMiCWhxLcsLKuch5z+35e7GDS5IDC1aHKpamoxF+A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from LV8PR03MB7398.namprd03.prod.outlook.com (2603:10b6:408:18f::13)
 by SA1PR03MB989204.namprd03.prod.outlook.com (2603:10b6:806:4de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 07:30:22 +0000
Received: from LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982]) by LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982%4]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 07:30:21 +0000
Message-ID: <9e759ae1-e407-41d6-aab7-82a28906c9dd@altera.com>
Date: Mon, 12 Oct 2026 15:30:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: socfpga: agilex: add Agilex SoCDK
 multi-QSPI board
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261006025418.31931-1-genevieve.chan@altera.com>
 <20261006025418.31931-3-genevieve.chan@altera.com>
 <8cd59aae-4f68-4cf8-a12c-5c63b11d29c0@kernel.org>
Content-Language: en-US
From: "Chan, Genevieve" <genevieve.chan@altera.com>
In-Reply-To: <8cd59aae-4f68-4cf8-a12c-5c63b11d29c0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To LV8PR03MB7398.namprd03.prod.outlook.com
 (2603:10b6:408:18f::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR03MB7398:EE_|SA1PR03MB989204:EE_
X-MS-Office365-Filtering-Correlation-Id: 388bd1e8-db0d-4f23-d7bc-08df2832ac12
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10067099003|261009223027099003|11063799006|4143699003|18002099003|22082099003|55112099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	bqumXUk5/WSBv2Zbym+l0lMlGIVskG+Yu1BuIAqQomTzMKWa3p/mCO8gwlcak1CfPyAPHmu+xsNWiR8nrFNN0Ybs6MNTCo2PiGAQDpiVU9lRmpiy0ce6hmWdKmKvHvt9xTElteSjukbYvMNGAL8/acQ/53uhm0E07VcM7v6Sg3B0mSYiWOMcbaKJUwSbpbiqsYz1Ls0tL49oHqs9PfU/eyIGO1D5pjn4Xz9wcb9EwkTg7kuSnsHAIwc/Kkur4YYmpN4GW/KJqw1nOo08z+vyNR/Kmcseq90lMQl8Swu+5MF/QMU6aViIqtASL766WnLjeSJY0bSV+65e43fNFYED4AHDnSNRODeJXWkS42PWrcOVV8CTF7gN81LkrmwerVFsUdISGUfpcbf5fLL5QqNmCy7V8LB55S/VkuaG0fN1XaLrspoRsLxAx0mfUm3hO5Rqypwd1QYkQwtiljzr0pzUW75xMTMl9mUDClkKEwLu4vnGhk6Voj42sFMOKVphOhEH6wQuX3VCvURwDc/F+g0kJoef4x2OmGR4e0HnDLzDwTwnfUPrcoIwvEwvAo1GfgJ9rb4X2+t7S/GtQGEB/6vil5qVHqJSf0O6FP9hCgiONie5KrqRtlb4p78lABK4B8qgAZaBJ5ShSLe0U8J8lmjRsv7Al37QbW03O+ZyoMDq9GM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR03MB7398.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(261009223027099003)(11063799006)(4143699003)(18002099003)(22082099003)(55112099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1BYYS9ucVpiSURWUnpGUjQ1aUI2TXk5NGFmUVdyMkdYU0l6VkNnWjZLV3VE?=
 =?utf-8?B?ZVhiNE5JenNQZng5bit4NGtSa29LQlJMbFgzMU9wakFYZ3NXbUtiOEd3VTUv?=
 =?utf-8?B?SFh3MFpwa2QxNHF3WWdGL0wzOXJkRnRqWGFXaUN6bXVtb2d1d25LL1dBNVkz?=
 =?utf-8?B?TFBnWFAvWjJCOVgrbXJsZ2kva1hyMGF4dFFnTHB5Qmg1NHZ4NnhWc2R2V0Rs?=
 =?utf-8?B?aGtLbnlaZG54YUR4aEo2MHZrNno2a1ZkemJTZW52Qm5UUHN4QUdlRXVmSVdk?=
 =?utf-8?B?cnp2R3dqMWlBcjlBYU5RN09oMGt1WVNXbk1Way9VTVBJRTZtWXhKVHlQb0pW?=
 =?utf-8?B?TXk5TzVjenZrQ2pKRVZ3cGFCOXJZdk5ibHhsbVVWSE1ycVBFVXpHZGZnSjdU?=
 =?utf-8?B?bE55OFBmTlUwczZ4dWlOK3lJUDBFaDNtRXNZUjl1R2NuYTJmcjdmY3RVNFU1?=
 =?utf-8?B?VWRGT2tlN3ZsNE5VcVRRd29Dajc0M2I1bkk0Z1p1N2hRL0hQK3ZZTEozL0Vu?=
 =?utf-8?B?QUUwYXVrWnFyKzZKbmdjMUNtdmtZS3U2Rm1mWWhhZUR3ZVpBcjR6VEdPam0r?=
 =?utf-8?B?Sjh5dkxwUUlJQm9nSGRwaUJscG5PUzgvYVFwTXRJNFY4YnZuWlVPWjlpRktM?=
 =?utf-8?B?NzdMM25POFo0M1JJQjFjSWV3WEI5em4ydlhQTjFjSzM5WWhSRHpoa1F3Rk8y?=
 =?utf-8?B?VjUwVlNuM3k4WUJhQjhmbHhRbnNsMjQzdWwrV01hUFhNVDJYbUxYNVhoWkVS?=
 =?utf-8?B?U0xIUzFKNDlNRGpoNW1wdlVlazZBMVoxU1Y4V0JNSzlhclNIemhXRHVBVGps?=
 =?utf-8?B?czRXSUdzdmhNYk5iNTM0YlkvOVkvNVkvRkx1TW9oTGNhdkJ1ZTlKVk5NU0lw?=
 =?utf-8?B?R2lETlVFR09JUWhDRlppem1USll6R1ZrQVNtTXdINkY3T3kvSEtjMi92a2lF?=
 =?utf-8?B?R0d0c3Zvb2lJbmpBbC9qekttVkNONXkrZWt5WGdEcmNmT2tGVUxDdlVjMjh2?=
 =?utf-8?B?VHdhd1VVNmFwRGs0elE0dDFkVklPRU93Uk4rRjJ1cnBPbjJ6VHVDeTVWQlpv?=
 =?utf-8?B?bGRNT2JHOGpOUk5lbklaSk0yQnVwUXJXN2pPRFpNMUU5M1ZDYVN2Z2gvc3F6?=
 =?utf-8?B?SHBDTy82V0U3Y0l4eHc4Zi8rclNwam9vNEx2RFg5bElXdElQVllvd1R0dHZh?=
 =?utf-8?B?SmVLRVRXOW5mYzFCeFVic1JFM2IwS1lTZWMwbTRLcGd3bDUxYUF4RVliVk5Z?=
 =?utf-8?B?U0s3L05hbHhZamxVNy9vRWhtb1lLY0FwOFVqT25yREtEUEM4clA5WUtaSFpw?=
 =?utf-8?B?NHdGL3RlVytrcDZ2aVhtUS9VeWVrRnQxTUpod3NlQjJRS0hlWkNFMzhGZ2RU?=
 =?utf-8?B?QkdITVNJK3BKS21xeHFWZnBlVFZCOFNOMlBxVlRIUlAzd09UVWNVc1dDYWQx?=
 =?utf-8?B?VDNMUStPUzNlbUlQTTFwTy9QUzlHbzVyWTBreEg5a2o5K3dKb3JFOTdDWGg1?=
 =?utf-8?B?TDJEd3NaWDkrb2ZZSmZpRFQ2RGxOMnp2WURZRVd5QjJROEZlN0FjWk1ZOHo1?=
 =?utf-8?B?RnIyb014NEZvVnM1Vjl0UUoxQXFaSEVRVW1iRGlKUGRUSjhiN2tuT2o3Q2t5?=
 =?utf-8?B?Q2sxMlJoWHA3cWxvbVByMkVuSVVIcjJNSmxxY3pFZ0UwNk53aU9iaVBtaWt6?=
 =?utf-8?B?a20xeDlaQk1HZ2lWUURHdjZiNW1tTHNRWlRad3JDcUwrWnRyZXdGa3pDc3hi?=
 =?utf-8?B?MTFBeHd2R1Jnd2RvcnFrSmcxNjgya0ZKSzNhWmdrRDdoWXFJdVpaSmNHRmM1?=
 =?utf-8?B?QzJUTjR1WndCSlBDYlFqMEF0OG1RQjZ4SkRLZ1FON3JBM2sxNng5cTVKdCt1?=
 =?utf-8?B?c25wdEV2eWR6MzV6dWxaSW5pRU05Q1FsQkhGTzRoNXNFSFBYeldPelpjVGRv?=
 =?utf-8?B?blNZMG1NTkZVYytIWFdjYlgwZThkUTZ4ZHduOTRacFdocGRzTGx6bndYVXI2?=
 =?utf-8?B?VXdvdytFZFN1bE5ZeGlmOXFsY0dpMTFlUWxSOUFEcEVndGJIbzhxalhwVlgy?=
 =?utf-8?B?ZVU1U1h5emVqTjRPOStmYWJ5SWQ5dGxIUlY3Uk44Z2gxUWExMnZEa0FTdWFM?=
 =?utf-8?B?QXpDVHlzNTJVMnVoUytkcyt0VkpPSlFwYjFwQ2dldExaVFg5ZlphVm1lWWRm?=
 =?utf-8?B?U1dOa2ozdUFYdUxacysxRnVtY1NKbGc4bjFWNlJoNWxpV0tPZTB1UU9VVzU0?=
 =?utf-8?B?TVJ0TTdFL0Y1Y08wb3ppcnBqcTl1MktaQ3U3TjdQQkFraDN1TVNNTUJPUm1s?=
 =?utf-8?B?bmtsTzZmcmdxZCtvakdTL2h3aW1jZjdrUHJXYkp5NFBLWFdTQkJKVkZXbFM3?=
 =?utf-8?Q?PBmYEeZEq8RM8Go8=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 388bd1e8-db0d-4f23-d7bc-08df2832ac12
X-MS-Exchange-CrossTenant-AuthSource: LV8PR03MB7398.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 07:30:21.4490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFI1UEj5bbVTvhnf5gv7fQvtBz14/i5lOsDeEn+R7N2jfuIdQKMyq29rBKr8x2LhNSG4jX2ALk1wI3mg2TOpBRqeYP0lcaigIgY+P1LZRVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB989204

Hi Dinh,
Apologies, v3 only addressed one of your three comments on v2. I
missed the other two; replies are inline below, and both are fixed in
v4.

On 7/10/2026 9:43 pm, Dinh Nguyen wrote:
> 
> NIT: your commit header "arm64: dts: socfpga: agilex: add Agilex SoCDK
> multi-QSPI board"
> 
> Avoid using the same name multiple times. Please reword this to
> 
> arm64: dts: socfpga: agilex: add SoCDK multi-QSPI board
> 
> or
> 
> arm64: dts: socfpga: add Agilex SoCDK multi-QSPI board
> 

Done in v3, using the first form.
> 
> On 10/5/26 21:54, genevieve.chan@altera.com wrote:
>> From: Genevieve Chan <genevieve.chan@altera.com>
>>
>> Add a device tree for the Agilex SoCDK fitted with the multi-QSPI
>> daughter board. The daughter board replaces the single QSPI flash of
>> the default SoCDK with four Micron MT25QU02G flashes on chip selects
>> 0-3, which allows the system to use up to 1 GiB of QSPI storage.
>>
>> The board is otherwise identical to the SoCDK and builds on
>> socfpga_agilex.dtsi.
>>
>> Signed-off-by: Genevieve Chan <genevieve.chan@altera.com>
>> ---
>> Changes in v2:
>> - Rename file, compatible and model to drop the "agilex7f" prefix.
>> - Reword commit message to describe the hardware.
>>
>>   arch/arm64/boot/dts/intel/Makefile            |   1 +
>>   .../intel/socfpga_agilex_socdk_multiqspi.dts  | 213 ++++++++++++++++++
>>   2 files changed, 214 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/intel/
>> socfpga_agilex_socdk_multiqspi.dts
>>
>> diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/
>> intel/Makefile
>> index b52cd2330cef..071bad408688 100644
>> --- a/arch/arm64/boot/dts/intel/Makefile
>> +++ b/arch/arm64/boot/dts/intel/Makefile
>> @@ -2,6 +2,7 @@
>>   dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
>>                   socfpga_agilex_socdk.dtb \
>>                   socfpga_agilex_socdk_emmc.dtb \
>> +                socfpga_agilex_socdk_multiqspi.dtb \
>>                   socfpga_agilex_socdk_nand.dtb \
>>                   socfpga_agilex3_socdk.dtb \
>>                   socfpga_agilex5_socdk.dtb \
>> diff --git a/arch/arm64/boot/dts/intel/
>> socfpga_agilex_socdk_multiqspi.dts b/arch/arm64/boot/dts/intel/
>> socfpga_agilex_socdk_multiqspi.dts
>> new file mode 100644
>> index 000000000000..0bf087fa7553
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_multiqspi.dts
>> @@ -0,0 +1,213 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2026, Intel Corporation
>> + */
>> +#include "socfpga_agilex.dtsi"
>> +
>> +/ {
>> +    model = "SoCFPGA Agilex SoCDK multi-QSPI daughter board";
>> +    compatible = "intel,socfpga-agilex-socdk-multiqspi",
>> "intel,socfpga-agilex";
>> +
>> +    aliases {
>> +        serial0 = &uart0;
>> +        ethernet0 = &gmac0;
>> +        ethernet1 = &gmac1;
>> +        ethernet2 = &gmac2;
>> +    };
>> +
>> +    chosen {
>> +        stdout-path = "serial0:115200n8";
>> +    };
>> +
>> +    leds {
>> +        compatible = "gpio-leds";
>> +        led0 {
>> +            label = "hps_led0";
>> +            gpios = <&portb 20 GPIO_ACTIVE_HIGH>;
>> +        };
>> +
>> +        led1 {
>> +            label = "hps_led1";
>> +            gpios = <&portb 19 GPIO_ACTIVE_HIGH>;
>> +        };
>> +
>> +        led2 {
>> +            label = "hps_led2";
>> +            gpios = <&portb 21 GPIO_ACTIVE_HIGH>;
>> +        };
>> +    };
>> +
>> +    memory@80000000 {
>> +        device_type = "memory";
>> +        /* We expect the bootloader to fill in the reg */
>> +        reg = <0 0x80000000 0 0>;
>> +    };
>> +};
>> +
>> +&gpio1 {
>> +    status = "okay";
>> +};
>> +
>> +&gmac0 {
>> +    status = "okay";
>> +    /* PHY delays are configured via skew properties */
>> +    phy-mode = "rgmii";
>> +    phy-handle = <&phy0>;
>> +
>> +    max-frame-size = <9000>;
>> +
>> +    mdio0 {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        compatible = "snps,dwmac-mdio";
>> +        phy0: ethernet-phy@4 {
>> +            reg = <4>;
>> +
>> +            txd0-skew-ps = <0>; /* -420ps */
>> +            txd1-skew-ps = <0>; /* -420ps */
>> +            txd2-skew-ps = <0>; /* -420ps */
>> +            txd3-skew-ps = <0>; /* -420ps */
>> +            rxd0-skew-ps = <420>; /* 0ps */
>> +            rxd1-skew-ps = <420>; /* 0ps */
>> +            rxd2-skew-ps = <420>; /* 0ps */
>> +            rxd3-skew-ps = <420>; /* 0ps */
>> +            txen-skew-ps = <0>; /* -420ps */
>> +            txc-skew-ps = <900>; /* 0ps */
>> +            rxdv-skew-ps = <420>; /* 0ps */
>> +            rxc-skew-ps = <1680>; /* 780ps */
>> +        };
>> +    };
>> +};
>> +
>> +&mmc {
>> +    status = "okay";
>> +    cap-sd-highspeed;
>> +    broken-cd;
>> +    bus-width = <4>;
>> +    clk-phase-sd-hs = <0>, <135>;
>> +};
>> +
>> +&osc1 {
>> +    clock-frequency = <25000000>;
>> +};
>> +
>> +&uart0 {
>> +    status = "okay";
>> +};
>> +
>> +&usb0 {
>> +    status = "okay";
>> +    disable-over-current;
>> +};
>> +
>> +&watchdog0 {
>> +    status = "okay";
>> +};
>> +
>> +&qspi {
>> +    status = "okay";
>> +
>> +    flash@0 {
>> +        compatible = "micron,mt25qu02g", "jedec,spi-nor";
>> +        reg = <0>;
>> +        spi-max-frequency = <25000000>;
> 
> The devkit has 100 MHz, why is this card only 25M MHz?
Yes, the SoCDK runs its QSPI flash at 100 MHz. The default SoCDK QSPI
card has a single flash on the bus. On the multi-QSPI card, the four
MT25QU02G devices share SCLK and DQ[3:0], with only the chip selects
routed separately. The added load of four devices, plus the longer
routing on the daughter card, lowers the clock the bus can run reliably.
Altera's multi-QSPI reference design for this card is validated at 25
MHz, so the DTS uses that value.

I'll add this to the commit message in v4.
>> +
>> +        m25p,fast-read;
>> +        cdns,read-delay = <2>;
>> +        cdns,tshsl-ns = <50>;
>> +        cdns,tsd2d-ns = <50>;
>> +        cdns,tchsh-ns = <4>;
>> +        cdns,tslch-ns = <4>;
>> +        spi-tx-bus-width = <4>;
>> +        spi-rx-bus-width = <4>;
>> +
>> +        partitions {
>> +            compatible = "fixed-partitions";
>> +            #address-cells = <1>;
>> +            #size-cells = <1>;
>> +
>> +            qspi_boot0: partition@0 {
>> +                label = "Boot and fpga data";
>> +                reg = <0x0 0x10000000>;
>> +            };
>> +        };
>> +    };
>> +
>> +    flash@1 {
>> +        compatible = "micron,mt25qu02g", "jedec,spi-nor";
>> +        reg = <1>;
>> +        spi-max-frequency = <25000000>;
>> +
>> +        m25p,fast-read;
>> +        cdns,read-delay = <2>;
>> +        cdns,tshsl-ns = <50>;
>> +        cdns,tsd2d-ns = <50>;
>> +        cdns,tchsh-ns = <4>;
>> +        cdns,tslch-ns = <4>;
>> +        spi-tx-bus-width = <4>;
>> +        spi-rx-bus-width = <4>;
>> +
>> +        partitions {
>> +            compatible = "fixed-partitions";
>> +            #address-cells = <1>;
>> +            #size-cells = <1>;
>> +
>> +            qspi_boot1: partition@0 {
>> +                label = "Boot and fpga data";
>> +                reg = <0x0 0x10000000>;
>> +            };
>> +        };
>> +    };
>> +
>> +    flash@2 {
>> +        compatible = "micron,mt25qu02g", "jedec,spi-nor";
>> +        reg = <2>;
>> +        spi-max-frequency = <25000000>;
>> +
>> +        m25p,fast-read;
>> +        cdns,read-delay = <2>;
>> +        cdns,tshsl-ns = <50>;
>> +        cdns,tsd2d-ns = <50>;
>> +        cdns,tchsh-ns = <4>;
>> +        cdns,tslch-ns = <4>;
>> +        spi-tx-bus-width = <4>;
>> +        spi-rx-bus-width = <4>;
>> +
>> +        partitions {
>> +            compatible = "fixed-partitions";
>> +            #address-cells = <1>;
>> +            #size-cells = <1>;
>> +
>> +            qspi_boot2: partition@0 {
>> +                label = "Boot and fpga data";
>> +                reg = <0x0 0x10000000>;
>> +            };
>> +        };
>> +    };
>> +
>> +    flash@3 {
>> +        compatible = "micron,mt25qu02g", "jedec,spi-nor";
>> +        reg = <3>;
>> +        spi-max-frequency = <25000000>;
>> +
>> +        m25p,fast-read;
>> +        cdns,read-delay = <2>;
>> +        cdns,tshsl-ns = <50>;
>> +        cdns,tsd2d-ns = <50>;
>> +        cdns,tchsh-ns = <4>;
>> +        cdns,tslch-ns = <4>;
>> +        spi-tx-bus-width = <4>;
>> +        spi-rx-bus-width = <4>;
>> +
>> +        partitions {
>> +            compatible = "fixed-partitions";
>> +            #address-cells = <1>;
>> +            #size-cells = <1>;
>> +
>> +            qspi_boot3: partition@0 {
>> +                label = "Boot and fpga data";
> 
> Sashiko's comment on this is valid. You give these label a unique name,
> "Boot and fpga data 3"
> 
> 
> Dinh

Agreed. I'll make the labels unique in v4. flash@0 keeps "Boot and
fpga data" since U-Boot's RSU code looks up the boot partition on CS0
by that exact label.
flash@1-3 become "Boot and fpga data 1", "2" and "3".

-- 
Thanks,
Genevieve Chan
