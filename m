Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013038.outbound.protection.outlook.com [40.93.201.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EC942DA3D;
	Mon, 12 Oct 2026 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808878; cv=fail; b=pUT5bwR9dIYRFdlt5xrmpgYGk+vt+X3BAhY9Z9Bm/GNvOBBTioqOsbce3sn1nkBQAsy/to5A3rvKhX/nOPzQVFAufo5gk/fxj8DiBHsgtDuART1fvH2EWiHT5xRLMgKOaZ/fLAklECwP2SIecS3PAYuN8mWyVK5FZGEfuxMhm0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808878; c=relaxed/simple;
	bh=E+hN6zQVS2lMSdXdSkYxmlopC3iacYzFJSA2bHcZuLM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qvFVGV+/FXft4Au7kx9R+nWWFIK8rQZjyLDDY5eSfaCSMY3E6G3IpS2/edDpliWbvJ+cCBafoywzqc6cpVwR1gxxp1vdBYyJ1Jd9LJNetk7xv1ZcvFpvR5D4SP11B9tzXFxbnmVIQRwCLsmxzaYDjPniaZJXNW1UUiTZHxo2HK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QVnt7QNw; arc=fail smtp.client-ip=40.93.201.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QVnt7QNw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wB0UqCWO346da2DbPpLu7lBFy1xxdzk86QXYkAmrKItf9Mr3mQ76Dt/MSuARSbpcvnruK/fmMJNQKwzsgpQmpXZ3mLUZik9aPUWtfTa1enL6hlwgCAiyMUg6Yv0mHqf0FWwjWye55EIs6luYI4+zpRVr2hmCh2S0BbiBGATu8ziiuPSPJWKbXPtFnAX2oJbsDnzYpqSoaOU7nh3QpnQcrzE/FMk3pDF8WJVVD3aF3DIqZ7IfAIT/IdWuO0zsW+OXReOKlwF2GQkSBlQnNSsWo9qLekdBkR6quhablFRoYlxj1VzX3tGlUZdee1kIRLZrz/opnEUjxi+zYq0k29J7rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KurqwNvFdK3Yxc+qjzjMEgbfINS6hgTAZ5T3APCr4I=;
 b=UtSsXPQZa+KzpQD7+eXUuDoBoV50/CDG5O1fhI4v6l63iDLUMRKmmghtYrKp1A/BqlvGPSH50RFD7QKmdZdhwDUfeP6yRIhuuT5mS8nphda4WvcWX8aMSnnm2RWa4IQb8PSGiBRExmJ71mKBiYj/RfIHr7wdG60L5fZ88F+A8ddbV9/fJICwOMhm5+BMRD4+3xqSzNsLV+zzdvQHoNjoEP1N0UHo34ZFn6HDo+IYBSl/0q3uouhVn8hipaEfOgEpZCbLljX9JHNg12WmBJjilZLfgBvbxeKTPCmpiP4Fw6CJ6kED57O4KMfxzwYc+b49g/ydj7ZRgFk+ohZGc5PUnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KurqwNvFdK3Yxc+qjzjMEgbfINS6hgTAZ5T3APCr4I=;
 b=QVnt7QNwSUUpUDudvGzP1NTfSZvnyjCKai2bEPS45QJv4lWYs5krB+VE7OSFmSQxMA2Bya2vHy0qZ/FmQ2VI3qOC3b3aMZd4EMkwNk9XQHJeUqlYS6urGeIxmiWqDjOB+nZZ64Rk+XyIKr6u3SusxKeghRuPy2LtCXNBInK4pNo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by MW9PR12MB999207.namprd12.prod.outlook.com (2603:10b6:303:301::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 12:41:15 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 12:41:15 +0000
Message-ID: <b79b530d-fd21-44b1-851a-97f63e92f6cb@amd.com>
Date: Mon, 12 Oct 2026 14:41:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] arm64: zynqmp: Add support for ALINX EdgeBoard
 FZ3A
To: Pufan Jin <2254650260@qq.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, andrew@lunn.ch
References: <tencent_AFCC7B9046C57B49E6FDBD8009981E935006@qq.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <tencent_AFCC7B9046C57B49E6FDBD8009981E935006@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::8) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|MW9PR12MB999207:EE_
X-MS-Office365-Filtering-Correlation-Id: f470d784-4858-461e-cf55-08df285e1adc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	PRpVaUA60kp4eFlAQciuyItn+u/speurVxxHmyp/+FUzvmZRQOZl0GUyGGx6SYFeyWxH2zF7gE8ZU41+WOwlBY39tJ5d4yF0ek3unnsq14jZkiNnwKPxiQ13qzl2OO+toxru8sV68377+5wfO4c2K108rJfBVed758k1ZyoHeG9boFK31v3KlmfI/e+0LMsx7tIcji3TCweTullnof0i1g61rB0tMK5ZLqp7WJNMPrqyamGSYhenQbM9qxL35/aFiCgi+zeJNKKi+I2o5Ik+mi+5K95kzXN8bQc2qmQw+TAgUgoFnaBijBYP7WiHAQSHjwIGh7/j8URS3f5pftiCdwZQvujT7Yn1KmVRjdJQyrIDCVVggZQ8j5D3vb+Vs2TbLkqHK4QsBHXHGiIhGBJsnbNx2WzQ3j5+8GIEQAhQbmvcNjiYuhPGJHql1EQoMbXBsRs8NYDbVWECfyarcs9fjxAIlpxbfzJfpwcTiGK6DyowiXF2Yi1jLCejHOUZ+R3SqXV5kO/U3Txx+V1dW2iIRHUoK/WhLL44IUrHovdhYV+TMGluVJ/+07WsdHcRe6FcQ8ujdiajRKZuQjg+30OtvccR+HB3sgr6kx7Xd1cfhKPjgg7fAMqbqnQ4xHUaFxXVrOhO0G1hRxx+UJCgD3fcFcPs+LyTyQW9jGl+rxIXVOg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S05HcmduVTZFci83N3NBb3JScFFiYjF4b0xRdi9CaGNyVTd3K1BhcHVZMlM3?=
 =?utf-8?B?azM2NWlrSXFacWdwRlQrM0dwZ1VrSXpQYWcySG9WOURKNXJ3Qm9mSWpxOENp?=
 =?utf-8?B?elpsUkJZQjlwZ1dpWFRJV29xSGhTL3FrQU1wSnFzb0p0UzFJWUY4QWYrWWZx?=
 =?utf-8?B?UEgvdzNnL0xIS01SWEFqL1dibEZYTU9la1E4YkJCVW03ZFM3b2RucGRsMGYw?=
 =?utf-8?B?VUZNK3k5WnY5T3I5SCtGL1ZFUzhUU1BkTHJYZWdyaklEWlg4cGFkei8xdHRi?=
 =?utf-8?B?L2JzTVFpdklSeVFVeFFHMGNEOXJRUDlaaFA4cHI2SGhINkQzNGpxdEVHVjk4?=
 =?utf-8?B?MFBvZ2JLanhLUGp6RlZzVmtyRHZYdW9pT3p1d0tRVERBRnlMWlM0TWpZNnZH?=
 =?utf-8?B?YlFmYjgxV1BSb2VPM0RraEd1eTRrZEh1c0FwRDBFMXNjbDJuMnVGQ1JYbHVa?=
 =?utf-8?B?U1I0UTcrZTVQdkxWcXJuY2VQV1p2OHZJQUFVT1dQUzBTbjR2bmgwYUliK0Ex?=
 =?utf-8?B?UnFxU002c1lvemh4R2dCTUo2MjRhMlBldUpiaFliSGg5VE5VZHA5clJCRldp?=
 =?utf-8?B?MGs3RWhSZ2VtVXIreXlZS3F0RVBpQldVWXFsQ3g1aG9sYkJYMVZBemd5UTVH?=
 =?utf-8?B?bWhiWjBRNVpXMGI4eHcwcjBERmVqakRRMXRyK0lyZU9tYnJyNVFOS0Z6alNr?=
 =?utf-8?B?VFdqUHkwakNTK2p3ZmthL1FQUloxelpmZzBMaWh1eERMU3Y3bG5OOVZsWFlu?=
 =?utf-8?B?OXl0NlhocmlFSDJxRUxoMGZtOVkzTUZKbWZIU0drdWk4MGhGOGRxZVJTeG1i?=
 =?utf-8?B?aGZyQzV3VUtxUTEyVUx1ODhTMUVRUStiS1lyZmpPT3hMcHlsSDZOS3F4SGFl?=
 =?utf-8?B?cTdFeDN0b05hSEkrM2xQQ3lFVEVKR0pWakFLUDZ1dlBVeGd1eG1OempLcVFG?=
 =?utf-8?B?cWZ5YjlPR0ljU2ZteGZQVGgyVEdINFNyYnV0Q1lsSE5QVTNHNHRMeWxEWXo5?=
 =?utf-8?B?SGhqZVlOVXhiTStIOXZ3ZzRJUTlTRkJtWkRTcmYzOW9scWtUeXc2N1YzVEg0?=
 =?utf-8?B?VmdJbFhQNDR3U2ZmQWdZcDVXdEIzOXZpOVJ4ZTFZbitIaWZyeSsxNkJxTDJB?=
 =?utf-8?B?dUpyTWFhYUtta3RhU3kvTzY1bUwyei9zK2VNeFNTM0hMRGkwa0ptcWoyemZ2?=
 =?utf-8?B?MXdIQ0FkK2wvQUg3QUE4S1hISFpCQmFvS3ZEVWd2bVI5SFlLU2RPSE1Jb1hJ?=
 =?utf-8?B?SnRWQnBlOWpuWmdWSHhWN3R1aWNjNFhGc2I1bCtqRjlsQ3dYRmRxWWkyTmUr?=
 =?utf-8?B?ZmhSZkRJd20rbXBxSEMrYkxNYTlRZURCeThRc05xb2Rjd1pMN25SSHcvNngv?=
 =?utf-8?B?VE83ei9TQVh0QVUweENIY280NFNLbHEydWRCb2lrL2E3TjhhZ3psamt5TUlH?=
 =?utf-8?B?d0NHSTcvSlc4a1NaNUI1Y1Q3OFVmaXRaOG1GekgyOU40N2U3cE1HTjh3cFl6?=
 =?utf-8?B?V0F4TTZYbC9BM2dsSnZaVUh0STVYUHJIR0YyUTkzZ2oxajNBNFVJUkZpQ0Jm?=
 =?utf-8?B?SEVPVUtTNTRlSzJjL1JSazU3V3JJcExGZUo3K3NpcU1lWEt5MCtjTXFmeGcr?=
 =?utf-8?B?dHNjWDFXakg0UEdMQkJBSXEvZXhEcDEzNWZqYmt1dFpzVklRMWVOR2FRRE1C?=
 =?utf-8?B?QXBHUVhzbTFhTUxVeFZVOUMyVzgxV3doc21aa0ZGVE5MNkVUVDJKNmJmVEMw?=
 =?utf-8?B?Znlrbi8za0FZakxOSWxoTDhhVWQ5QWhlYTEyWFBZcHpDRzdLa1U3NzdxVGwr?=
 =?utf-8?B?S0tzV2NST1VNNUxid1EwU1A4aWJma0lkeFlwUDJMNUVySWRmRENXSkUxSFNk?=
 =?utf-8?B?Mzg4VFBrV0JWQTBTd1NIUGFWSlluK2htMG9XMFFhR2VtcDlZTzNqeEFJQ1NU?=
 =?utf-8?B?bE1Bbk5DWFFDREZkTitwbUtBam5neTNxWG05dkhFNGdVdTFCWXhRRkxMdnBT?=
 =?utf-8?B?ak9kNENaeHQ0cFBsdjlWeldKeVVPdU1NelFTSUhpakVsd0xQaDEyT0pHcWI3?=
 =?utf-8?B?bFNvZ0YwMXdidGE5bXFYZTJPU1JkNXlHb0h0a0pOc2FjRFhtTk1zTkxaSW5Q?=
 =?utf-8?B?Q2ZpakRLaEQ2SldVcFZ1VkVQbGR3eU5jdnozU3p3c0tmQTZVZVZUdXVGV2Va?=
 =?utf-8?B?RHlNdnUyZ0ZlVlQ4ZnZCb3FVZWRRTXBhdkRtdjF4QWtFS0pLODNPQzZROHFK?=
 =?utf-8?B?VmVlY0k2aDVYUFF1Z3Nsd0lKVTcyZEd1bHJ1bGN5aUVwOG1UUUZ5eitrdXFh?=
 =?utf-8?B?MHhOeW55U2NTam12TnlTN3hUN0o0MExhWGRaYS9USmt2dy9tZjFGdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f470d784-4858-461e-cf55-08df285e1adc
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 12:41:15.3423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ybayzwEZog47+IJRxCVJpLXGsPLB4F2VLDZ6klTcDPdN4uLd+R3CMHiMcTUGQC1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW9PR12MB999207



On 10/5/26 19:33, Pufan Jin wrote:
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

Another way - send it as one thread.

M
