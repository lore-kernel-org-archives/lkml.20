Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012028.outbound.protection.outlook.com [40.107.209.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846FD348C77;
	Mon, 12 Oct 2026 12:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808865; cv=fail; b=a9eAnjdBr6M9QI8TIXfhGLIhb8yN/n6HUGUqaMD4cbRz5LkNKwjxHCPqunlubneftsBK2FDzafAubZ9USw8QfA8El7bRiEAIs+v28qxFglGX0HQjsPXeQvM9aRyxHz9cPFzuNJrAj/kTHc9PgZu8FK87qy9wgGiIleqIygV3Ams=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808865; c=relaxed/simple;
	bh=D/ltnm/8RcKYprfTJw8d+Mmt7kRWEcI8iSRFAa3A91s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qRN1K5eT6QOk5d866P/ptg2Lgn9Oz3kdPh8IBx/7iFDV2UayPFPz7Yb8TwVjbrmEvqrzKXk3nVCN8N8FKf5ixB5JqB1GZ4ASfAZrtwTQ28hmzcmPXGkviK1akjBdbKHul3LalrtIkzI8C4COFC5AP3J2zoN3S5CxTom74d2CCRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OU7uH0z7; arc=fail smtp.client-ip=40.107.209.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OU7uH0z7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvUgFMSPh+8jADQdwyXyBp+AgDAqcVSbyYM6t65tmT2gQ/CUlVWEVj38wpQIs7J9Hbph/JszmSsJNlyfM1A51kfwrgmBAZoIBbB1MZ2PkyYtPGHKjKI1H9Xd6hGVlWhmzenJmUa4kpRi4AjeGRGtI2h7sfp0wY1BRCzZwaCC1j+/mwcaet8ij8AHGASXL0sYz4ZvGTEtrIMyUoEnT1Ek1yPyGX5t9PG8MfXJNxJxtSegkl3Gxe3X0zdBz/yCCLr2AEDX5UuazGPbmN5hk4sM8ZHdDmbJ2yTt40vFSTrNEHkSIYPLGuYeXLc/v9ZIbKlj5jA1TEYYkq9t18NscVEsIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N85rQ+ugzjY4V7/If3X86Gt6TJltDmb3lmlDJ4Ikdnw=;
 b=I0wzBZG54udd3dmS94qGZLJAqZb2puImTtzGwhicl1868r6lL81B6gbT2wo3Rqk85WWsjP8gykx8IMzvgr0p0O1gt9ntKWW/nsQRaISH4+VS24N61WFmBYogtScebnHb2NIm/eJXIpX2v5NoG/CF9uX0QUWYHJKSjfQWKJYJnDzbTmX/DinmT2Dc85ktBv6Y69KSzOG9we5slcy48wGXSKjvn4F2cZoC4h3TUEqxGSCibplTuLS8n/n7uiboCnqcMA4ydve/A4tsoBA2LY60Kv0JISQA/em437n2HwHFiIXLDV5gg8L+ttA4lFa+JjmMFuYUEpveq86BxacDo0HPMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N85rQ+ugzjY4V7/If3X86Gt6TJltDmb3lmlDJ4Ikdnw=;
 b=OU7uH0z7FAoNlDKOLGy0yaDrWtGY+P7XDFX2cdHHp574Dve/yQ+4KVcvhMjVLoL1oA6lnSTp/5GSozPpAFyE/5GQCOcuZzIREqasN1Dwto3SX9BE6/WSTfTMiYO5bIRoN6mON9JDLWPTNPWHVUPvIzUB0cBxulhxSFUgRLPbgSs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by MW9PR12MB999207.namprd12.prod.outlook.com (2603:10b6:303:301::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 12:41:02 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 12:41:02 +0000
Message-ID: <dc6ed720-3b08-4e0c-8516-bd23546c1fc4@amd.com>
Date: Mon, 12 Oct 2026 14:40:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] arm64: zynqmp: Add support for ALINX EdgeBoard
 FZ3A
To: Pufan Jin <2254650260@qq.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, andrew@lunn.ch
References: <tencent_71C80AF592B6FB36817B3040A6EE18B3A007@qq.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <tencent_71C80AF592B6FB36817B3040A6EE18B3A007@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0247.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::12) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|MW9PR12MB999207:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bf07a08-1966-4ddb-db07-08df285e12fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	9I7DVPxundgCO2KO+aSoB4IfJ4eHPyaTuyPUOxmOlUXBT/9KdQxcp0Sgv7aFDNc7hEkbCHjLyRCcjjVF2tfZb6+zONUQ/zzPYMWnUtcSaRVD2ENp9dX9fCGUw7jJOMu4u2KiRigQScmgUtFLC9OrtD8HSyBRuRgE20JBt8o9iF6z3UGTN0idctyDjMsE4N/ZUXyfopzpRmEhCKML+2gOaxti2Z4o/CcCmTo4EpRn+mXYYxWDFjXjgfrgVJE8xn3hJzJt7SKrxjAIrORROAbEXpXyF6BeVJAT8gS5vnLXbYJv/urn4eqq37ubXM+tQ3c8xr8GCWiyWHQ57zBzDm8BY1ay1D3HMUFKt7JmPRq8qR/s7Y47bpdqZOmI5PrhwhwLKAfrR5Ffmec4KB4WFJxJNU1fMCFZv2Y1EkImbCcNQMRLzAaRFi6DaAmGbKjCGfsuAJrapVYOUAGxyypEBctAM8MB0JiX8VYyqPU69yDQWxvT2+skhQDPHAqWTl+hCePgKdNNb39ZQGyusP4ysWW8+1UHNcaY3JRLUciv9XdtDCFTeoN7JI+TzvQgFmwIzJko0TERAnd20waMFZD/9SstMaRJYaAHl5FagsvhOSkWrsYuqWKSYE9v48z9zN3KW6qZoOKym8Z42Gp1Dgzj8lcMqCkrKkM089ZK7BMY4z0lg88=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1ZtUDZxc0J4NG4rYWJ2ZFB2cVFsT3V3eFlUb1NLYUQyMXJKMEdLMDhwdC9S?=
 =?utf-8?B?SkdJQXM5bGU3Q3pKeWhPMXYxUGFwZmZZZjNiWGVLdEpKTXV4U0xRL2ZFa1VD?=
 =?utf-8?B?UG43ZHdzdVVIK1pwK3RSeW1UbkVubFNqYlhiM1hZQmd3THBWUW9tcjBqMlgw?=
 =?utf-8?B?cU4wRVFvREF6aUdUQ1pwQ1ozMGdheVBTaW8wS0pCcGJnRmxFb211em5Ld1JH?=
 =?utf-8?B?UUtuSGFreGo5NUxiK2lRNStEVUZjSll2cnliSmhuemZqbUt0OExpUHJmK0gr?=
 =?utf-8?B?UlVkMkM1RTBGczA5Z0pkVXR2eVhIeDROWjlMM0EzbEJPbjMzZW1naWdxYjdp?=
 =?utf-8?B?emFRaVRiTTV5Q3lnNi9NTnRPYjgwbnNITzV6cUx3Q2RuMGVCdnFWeVNoODhi?=
 =?utf-8?B?ZjVZd1RmN2hXek5abkhTVDNMTXJFUWd3TVZ0ajVCWmljZThWU2tDaE0wK2VM?=
 =?utf-8?B?blNqeThOdVdFR1ZvZkNBUmE5MkoxU0ZpdHd5YnhySExSenhYVzE3MEFKQ2Y4?=
 =?utf-8?B?bVpqSWVzSXdScWZxMy82cU43a05pTnhKOFUwRWhpZlpETzRPNUFDdGN3eU51?=
 =?utf-8?B?ZUdnYkliWnZCU2h2SGl3NVBiWkFDTXl6aHhtKzFXZkZqbjFLbkFPeWtVaHpr?=
 =?utf-8?B?ZllWam5TMHBKZDVDVmtVTTdQS1F2SzJkaWl4QjROeTlCZmR6VGFVbkJkMzlz?=
 =?utf-8?B?NDdUQkJZdWNDcjhvMUlBV1hqU3NVVXhBWno3Z1RwOHA4cEZKOWNDb0tLc1Fj?=
 =?utf-8?B?UG5ueGZkcStoMWlrUmJpNU9rZVRuQjV1NHgxZ2tNMVpEZlAvR3hDeXlGRy9O?=
 =?utf-8?B?VkNaNUFHV1g5T2tNM2x5WW1sbzFVdlJkZm0rekJVNVBIZTNBTm9KL2toaXF6?=
 =?utf-8?B?bGZjSWRZQ050b0RvKy8zbVg5b04zZldMNEdXSUMwSVY3Ulhxcm9PYnlldnBL?=
 =?utf-8?B?U0RSTHBxS0xrZk1GbU1IVGsyZ0UrZUtXQnpvV3NhRlhReitWZlZQWHJZQTBr?=
 =?utf-8?B?SE9qMzhLMVpZOVJvMkYvUml3QzJGVzZZZFhkV1BMM055RGEyRG8raUJpRFI3?=
 =?utf-8?B?amNjUndMRXlubUQyMk1oVUlBdzVQK29QUU9XNHVRVXF2Mm9od1drbGt1bEdG?=
 =?utf-8?B?ZllnWitWVG53VkIreVo4alNvdjlSdW9nRVlJZEZCVWNMUnBySy9hU1NwbnJX?=
 =?utf-8?B?ZEk4SC9lNVVSSFBMM1cvMzltaXFsWFVkcDczcDRqaDROY0NES2w4ZnpFWVY1?=
 =?utf-8?B?M2JpZlh6Z3llNXlWUDkrcDVsUjloSGdlL2dwL1RlVWxGbWN1bzBCZVFYZXRq?=
 =?utf-8?B?SzdvUGFuWWxsTXhPaWluU0N5TER4TDkyR3p3RFVqd240bytjNy9mZks3VjZy?=
 =?utf-8?B?VU03aEdCZ2VJRG1xbmw4c2ZEUDJtMi8waTgwVzZXckY4S0kzYXE0cTlGQVVG?=
 =?utf-8?B?NDJPV3Z0WHcwNFUwcm5qM2ZCTDlhRG5ST1lzNDlzY2I4UTloZ2JiTXB3VDAx?=
 =?utf-8?B?T1RQS25oSXJXaG82Q3Njc0N4d24vUmRwU0U4a3NoUmZIOVFFc2h1b1Fudmhm?=
 =?utf-8?B?d0I1cHlnY0kxL2dtc1IxNnQzYlJ5S1lWZUNObmw3WjFGS0ZrdXpsYU9RaFZ0?=
 =?utf-8?B?VUNpL1puanVId3ZtVmhwV2hMeGt6MEtVVXdwL3VFYkFCV0dhNWlsVDNUNC9C?=
 =?utf-8?B?N0c4clVqOGk5dXpSRUpocVZleGFHU0VqNDlxSU1DSjlwa0s5RTZvNkc1TUg4?=
 =?utf-8?B?ekJzdU83c2c5eUVwcEFVMTN1M3lKOWFnWHkwSjJBeis4MnlDeGlzMTJ6bnAy?=
 =?utf-8?B?OWlPMU9LdS9Oa1dVYk1QTU5oMHhMMUdYQzlJT09XQ05zMnlmVmZWUlBYQUdz?=
 =?utf-8?B?cFJFdVhFZWpyVHROOVZjZk5nWjFJellMdllBamRKcnJoWWttK0R1akNVemdh?=
 =?utf-8?B?SmpOK1FGYlh5a2FTb3RCT2pCaUxRd1RBT1VzOWc0NXV6R0wwUlcyWWt3YjNK?=
 =?utf-8?B?c054UnJPZ1oxdnZyWFF1L0dzN1UxaWRLOEFOY1AwNmc2WDFWdzVFSVYyNkVQ?=
 =?utf-8?B?RnBVcVhyRjdqUnVIWGN2SHVRcVMyaWRUbWVxUGVrRDNEN2l5UUE1WWVJa1Uv?=
 =?utf-8?B?MHFFU205MGpWblg3R3FJNVlpZnEwUDc4cksyOXhrVG5zRnQ4bXozYXJQd1Qx?=
 =?utf-8?B?dnNmWFJWeUp2U2dvRDFoUy9IVDBIOGgxb3RBeEVMemxyaDRaZlVwd2x0SjU4?=
 =?utf-8?B?Rk5MbWFkeHhlRzRGamZoNXM0cmRNdWo4c0dqV250OHZHWWNGZ0dteDd2cnRM?=
 =?utf-8?B?UmlJZkdGaVZnbDdYT2RYNVlIcVNTQlVJUG5pTThEOXUrMFpWK0RoQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf07a08-1966-4ddb-db07-08df285e12fc
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 12:41:02.1630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDez/nXICuYAWLOQjC5PLf8pKmB0gqWx6DpKKJBiE1IW4OeQnIMgvijrTDn0IAqf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW9PR12MB999207



On 10/5/26 19:30, Pufan Jin wrote:
> The ALINX EdgeBoard FZ3A is a single board computer from ALINX based on
> the Xilinx Zynq UltraScale+ XCZU3EG SoC.
> 
> This series adds the ALINX vendor prefix, documents the board compatible,
> and adds a device tree for the board's PS peripherals:
> 
>    - UART1 debug console
>    - eMMC (HS200) and microSD card
>    - GEM3 Ethernet with Micrel KSZ9031 PHY on the MDIO bus
>    - I2C0 and I2C1
>    - QSPI NOR flash
>    - PCIe
>    - USB 3.0 host
>    - DisplayPort output
> 
> The Paddle-Mobile FPGA accelerator is not included. Its PL description
> depends on vendor-specific IP and an out-of-tree driver.
> 
> Tested on ALINX FZ3A hardware with Linux 7.3.0-rc5: the board boots from
> SD card into userspace over the serial console, gem3 negotiates
> 1000Mbps/Full duplex with phy-mode = "rgmii-id", and the eMMC runs in
> HS200 mode.
> 
> The base DTB passes CHECK_DTBS=y, and the Xilinx SoC binding passes
> dt_binding_check.
> 
> Changes since v1:
>    - Use the correct vendor prefix 'alinx' instead of 'ebdee', and rename
>      the board and DTS file accordingly (Krzysztof Kozlowski)
>    - Describe the board as a single board computer with the SoC, DDR4 and
>      eMMC on one PCB, not a carrier board with a MYIR SoM (Andrew Lunn)
>    - Add the MDIO bus and describe the KSZ9031 PHY with phy-handle
>      (Andrew Lunn)
>    - Enable eMMC HS200 on sdhci0: drop no-1-8-v, add pinctrl and
>      mmc-hs200-1_8v
>    - Drop power-source and bias-high-impedance from pinctrl_gem3_default,
>      which only produce spurious warnings on the board's pre-2023.1 PM
>      firmware
> 
> Pufan Jin (3):
>    dt-bindings: vendor-prefixes: Add ALINX vendor prefix
>    dt-bindings: soc: xilinx: Add ALINX EdgeBoard FZ3A
>    arm64: zynqmp: Add ALINX EdgeBoard FZ3A
> 
>   .../bindings/soc/xilinx/xilinx.yaml           |   1 +
>   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>   arch/arm64/boot/dts/xilinx/Makefile           |   1 +
>   .../xilinx/zynqmp-alinx-edgeboard-fz3a.dts    | 350 ++++++++++++++++++
>   4 files changed, 354 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts
> 
> Range-diff against v1:
> 1:  d6e565186 < -:  --------- dt-bindings: Add EBDEE vendor prefix
> 2:  f546b0d1a < -:  --------- dt-bindings: soc: xilinx: Add EBDEE EdgeBoard FZ3A
> 3:  b114e1da4 < -:  --------- arm64: zynqmp: Add EBDEE EdgeBoard FZ3A development board
> 4:  c33ea63b7 = 1:  c33ea63b7 dt-bindings: vendor-prefixes: Add ALINX vendor prefix
> 5:  888548b4e = 2:  888548b4e dt-bindings: soc: xilinx: Add ALINX EdgeBoard FZ3A
> 6:  cd96303fb = 3:  cd96303fb arm64: zynqmp: Add ALINX EdgeBoard FZ3A
> 
> base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e

I am ignoring this patch because I got 2 cover letters with no patches. Send 
them as one thread and don't create mess.

Thanks,
Michal

