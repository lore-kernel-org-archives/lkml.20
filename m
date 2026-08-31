Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012058.outbound.protection.outlook.com [40.107.209.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3049F3C3459;
	Mon, 31 Aug 2026 07:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160647; cv=fail; b=IX7N175zyLSl63+p7vmgBZFPnNEFz7nEE3p6roCRFZMfL9zkIwz6P7tHKX0BGGodqPUjCtsg6FpC1iuj3S+08s4o4lih1OmFl5oKP3t2/P8tAGvqFX3+ClhpXmAEtMsDaLgUCe+YgEGlYv7DVlBEN0JLOMeoq5S9cBveZKWBBEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160647; c=relaxed/simple;
	bh=hdHWQhS0uuShSeXSyV/JbpECo6qDaIcfJmFs/sTvsQI=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A0kX4TTPviIlu82XO4Inn/4VrNAlStsb2APd+GNi9+ch2ZrVQKyelxRWhnsbXdesGqj1qytFF6hg5lN83Nvzhvizxlr815S5myF+nfyQl/UiQA44CzR1FGF/SFcRRZTw7Zk57E4W5I8qQ7BC/ae9pV6JEusqODqFiGr+tRILzNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XnwMdUfg; arc=fail smtp.client-ip=40.107.209.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XnwMdUfg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJSXHXf7ygzgAWyMWwFB/nGIyYlEv+b4Rcsn7KvwlK++A32TcOA+IYbgPA+Fv/CWcdE3qRwRWMM9CdzZBekPYjxnWxXJGZ1nn74huptAGSJ+kBNoS/g3Kt1PWNFYDMhuBYIzALfFjovOOMrcQf9Brn4R/v8Xw2mqc7T9bLZtfPYTIlXWkB0u0u5I60qtp0NIVjpGEFNKLuGwjahGLaOseYUp1zYmGlfFd21lb/xCHC5cgW01ZoaqdQ5ygk+epsuI5KTSvId8Lo2IJUtnspCK1+TB0Ck7X0yXatF3JIxYLPr1zvTU21yI3BfHLjoeuvYl4KMhIA7YcxrHNidN+i0DHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbh5KdNYEjmolnBnypRR6U05VmE1pUFy0kJYQR1EhSM=;
 b=I0NIpodb68s8SU+WPXYg9YIJoEJaq+ymExtUn7jL3OPOz9LA3HciM6tomrzQYgVZfwqMWEXsvC/lqPuLrNEuUwmbc+FyYTXvGvu0lihaRLK+Xm3DRLvQW2gB8VGN9t3zpT2anunP3b7Ut/oln2YBoZTNwAz5B+WAhtT+bYL0jMkq+qRVZwjI7rM7PP1OWoqMnK43XyGIsOvyumqtrHtfkOulj6+arEITpsXszJvZmPwsavJn4C4zIRwF7WlVtpKlSh/LFbvqR1ClJzmunPrIns4QFgGIcOxhz14zIUA0BNHjSouTXf6ISRCfsYqpLYzjc2U3r3juVkY7aGRNXakquQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbh5KdNYEjmolnBnypRR6U05VmE1pUFy0kJYQR1EhSM=;
 b=XnwMdUfg0dD+oyyTxSVtBtP1ZdG1/UokqSC1d9GdMadzVuj6ZVXHnMN74ypKtEdei8eDvyPs6qEQcLmdvpRx6UTg6JtRv6KZP1MS1/6b2QsGfVaWxtVAu6KMoye7VslONAHxirIZh6ILr8i8OKt0ee+qpdecC1U1pcCzJZI9c60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by SJ5PPFD5E8DE351.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 07:17:22 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 07:17:22 +0000
Message-ID: <fcab5971-0014-461c-988d-579927977cbb@amd.com>
Date: Mon, 31 Aug 2026 09:17:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: xilinx: Replace spaces indentation with tabs
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260829193951.107616-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260829193951.107616-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:510:33d::35) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|SJ5PPFD5E8DE351:EE_
X-MS-Office365-Filtering-Correlation-Id: f0436fcf-ee4a-4be6-e596-08df072fe6a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5YbNWq2JMYNCJUiKUd/G89PYDbf4PICcuHK+caPKT/2+fJRzwbddp/G3OYvSO5F96i/lf6qRI42jcNf0P5UPz9M2V5Uj9VYZ5cXVavt6Pq2I1vKorghtz6EDxwcbSyhU9Oje59Lr2Ki7f7TpK16n41EpokVMbYnYAJPMU87e2t6muCmYHEiBnByDKlq2ivfDt2MjVC2h9LZGQFj6KywucNfvNuWffa8D35yCYAe7yn4DVrhI00CywPBh00L7dGAtqOrB7jmptstQ53KOKGD6GSSCBJMLdjKiqXeUoM3j+IH3Zd49N8aeaVMj1z9w35LcnQvegAn+bBNQgsSMdt+6NB9unrb4ofu+RUnksbtiLFIW92DlQPMSZjhWzh9K1AHLNGh3soe8H2VfVVVkpSF6Vz0oot1qQus4q5BaLe5IYgdSwGhpqhvw/Rfprv13x/4AuHkEOsBQJzlSIo3lSHZ6f+H6okfAcFinXhnVvQlSq0eJfdiwU8vrLCIKW68jlAMeKMYZ4fOkcL+NV4J/DKett3NryWl4ZCNHxabLa1Djx7XiarENqwnHjXwLvvZw424ySBbegleo7JQG97T3RQwdqBYeBy6doiKO5rEYM/i6WTl7bD11OrSodDRPv9R0ruCHlJc4qj/ygRNeBpjB7/w9cuhDpnb5VEjnALM+KTFYpdo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTZnM053TnR3UUE0aTQwbUZVR3lWcWtXMDhyUzF6OU5zckxDN01YMDJxY1B4?=
 =?utf-8?B?WWJEZmxPOHpPcTF2Wi81bEd2NHhnME9SL2EyVjA5dXJTeTlnYzhXM2pyMDcw?=
 =?utf-8?B?YWdZWFg1d0kvWDZzNjNsM3FyMDZmVVhielZPakpTMmRrU2pPL3hQZFpIT1ZC?=
 =?utf-8?B?OWNJVmpuV0NCR3Q5SVBUZmZzenFJZTk2NitHcWl4TDRtbmc0OWIrMEJBbGFM?=
 =?utf-8?B?TVVVa1ZnUmI0Wlo0VWN2d1k1VXQvWm1aMldYOGpHQUcySnltZnNRZ2ViSFZn?=
 =?utf-8?B?c1JpSGVoTlFSMFhZRWk2a2diZTJRdnBtdk5uSVNZSGY4LzlRVmNsb25RU1pw?=
 =?utf-8?B?NFhVclJGS3NBeGtKSVU0SGpHQ3NOdUoydzBVZkhCUVdac050VVZpQ1VtZUFS?=
 =?utf-8?B?VjYzd2s0T2p5WEszSXh6aVlJNmZ2RnJTY3Z3Nm1Dc0lWZmRlb09Td0Radnk0?=
 =?utf-8?B?OEswYldyK0NZUXBSeTgxVDloV21wQjBnamdGU1NEd0NJNC92emxpRmxUMzh6?=
 =?utf-8?B?bElmOXhESlVRbnpDV1BqaGkwNGhuRGN6aThXK3FRSW9Ed29GNmhCUXlYUTdn?=
 =?utf-8?B?K2p3VEdOYitKK3Uvb01MZEpkV1kzQ3Q1MkU2RzZ2YVh5eGt4dGZjMXFBWlVy?=
 =?utf-8?B?NGhySm5XeWtTVjRpRHhIYlVCL2l3SndzU3VkZGlBVzBoYVArazRwbzRFdmlo?=
 =?utf-8?B?M2ZKMCtlWFNaMDhpR2YwbHRRQWZrcmhkdHlzYzgya3IxdCtxQ05oTXYxVkNo?=
 =?utf-8?B?OEQ3QngxY1NQc213VmMzcWNnUW5MVUZwbllTOExpTE1CR3N5UjJjVFZ2dENw?=
 =?utf-8?B?cUdUaGVvMUZEZ1lWbmJLMGlucUY3d1FKUWFYeFRiT1ZRZDdTWDVna1RzZTZH?=
 =?utf-8?B?YzlyV2Z4Zk9sR2dzZnRVQlpESnNPYk9PVWwyWk1kTkhTSUR3eUVlRVpEeHEw?=
 =?utf-8?B?OExTeXBNK0hQemVqdlZVSFpxakR1QlJpdTVndVMzMDFJUEdpVGZPeVpNc1l6?=
 =?utf-8?B?YU1XZUM2aWFLb0JSZFptMVZvQ0wrMmtoZkJ1ZnJUVXY1TGxlUUN1V1ppQ2p1?=
 =?utf-8?B?OUpKVUFqVUJkSkhUT0lCeTBsNlJTZm5ZVjliaFBnMW1pVmJFdVVGT1MwR1Fm?=
 =?utf-8?B?R0xreGduc0ppdW5YMVU2RkNBMGgxMjZuUVV3aW5NTDg5QjF0QXUyamlTTnU0?=
 =?utf-8?B?SnJiVWN4VE1BSUxscjQ0S2RaTHFsbkhjU0ZldW1XNll1bm1GWmk2ZHVBbU05?=
 =?utf-8?B?dFBqZUxtN2E0d1doTmxkSW9SWHBZa0NacHJpZ0hYbDBWRUo4MWp4Um9oQkdu?=
 =?utf-8?B?SGdqbjh2VUtOaE5qZWdqQXNER0x6SldSVkpFT1hnTDBySnVMak9qTjlqNGZl?=
 =?utf-8?B?MUY1am95V3Vpb2VSaDZQbkFXWjBoeTZhUzlZd3pmbkpVVTdEZFFLbndadS9v?=
 =?utf-8?B?LzQzNlR1LzZ6UWcyUmFSdEE4RjdrSW9nY2c1OHU4U3MzMXQweEt0WWVHaUpm?=
 =?utf-8?B?NVd5Zk82YmdnNHZPa1JVS2hNMnNscktYZ2o1QXAvNDg0RVBOUDQvZEtCeVgv?=
 =?utf-8?B?cFQ2V1VkZjh6UnlzY3hYeUF5cTQ1YTQ5UVpHZDA0cEI1WmQ5QTFDSkJ6NjFV?=
 =?utf-8?B?b29vZ3lGVTJOZnR2NVdNU0Y5UXVyWTMxMWJveEhFSU05WmdENXBNNVhEdWpn?=
 =?utf-8?B?SEVZYVNoUjE0TXNITWd4c3RIcTUrOUxmc0ZUZVQrZEg2OUlPUFZkRkcwOU1H?=
 =?utf-8?B?SUZMUzRUdGVpWUlVSjdFdjVlNENVN0xEOEtJRXA5bFFoYmhDamswTzFxK3ls?=
 =?utf-8?B?L3UxUnE2ZkphOFMzbzlpMnpXbXpvT0tPdW5ZOGpIZVBNeU9nQ2JPNEpwSmFL?=
 =?utf-8?B?b3FudlNLZVJwWnpwdVhRbWRJRDJOMkhzejMrYm9NWk1CZXhBa21aTldEd3No?=
 =?utf-8?B?Nk5IbmxRYy9waGoxZ1BHMXBkSnpSRWhrZXRhNjFZdGpzQUhacmJKTERicW1R?=
 =?utf-8?B?MEFWNFNTaTV0SHM0cm9oOTZ6cXIxQ3BGZk15dmVsOG05SEFLaDBVblJ4VHYr?=
 =?utf-8?B?TjBoR3FyZ0J6VTVYeE94ZlFXZ3pqQ3hNQ1phdXdNalVDYzJOUG5VSVhhSE96?=
 =?utf-8?B?QkVXZENEcEpwQS9YZXl3NlVaTENDRU5Mb2hXSDdTR3BjbnJvTm5ScE9NdHZE?=
 =?utf-8?B?VVBrQ0IrbXNFeXlLcEhrMDZjbG44Vk1uVmpDeHpTUml3UDg5VTY5K1RZTmcy?=
 =?utf-8?B?dHoyWjIrbUx1bTlEQ2dkZEtDaU9FdkdoelJqcDRkSmpSWTRUWGVKZXZzTHRM?=
 =?utf-8?B?dGpXdEdIc3pSa2JCTFhmdXd1bzRxMEVlY2lpSkpyOUMzTmJmUkQvUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0436fcf-ee4a-4be6-e596-08df072fe6a2
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 07:17:22.5160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2oZQkbunZREBeGxTKgY5ZGtT8Aw8iCTky4FhbWct6sG//msX51bovkdr2A1vMJkd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD5E8DE351



On 8/29/26 21:39, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   arch/arm/boot/dts/xilinx/zynq-7000.dtsi      | 8 ++++----
>   arch/arm/boot/dts/xilinx/zynq-parallella.dts | 4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/xilinx/zynq-7000.dtsi b/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
> index 153b8d93cbee..715299f5d860 100644
> --- a/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
> +++ b/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
> @@ -380,10 +380,10 @@ dmac_s: dma-controller@f8003000 {
>   			 * "dma4", "dma5", "dma6", "dma7";
>   			 */
>   			interrupts = <0 13 4>,
> -			             <0 14 4>, <0 15 4>,
> -			             <0 16 4>, <0 17 4>,
> -			             <0 40 4>, <0 41 4>,
> -			             <0 42 4>, <0 43 4>;
> +				     <0 14 4>, <0 15 4>,
> +				     <0 16 4>, <0 17 4>,
> +				     <0 40 4>, <0 41 4>,
> +				     <0 42 4>, <0 43 4>;
>   			#dma-cells = <1>;
>   			clocks = <&clkc 27>;
>   			clock-names = "apb_pclk";
> diff --git a/arch/arm/boot/dts/xilinx/zynq-parallella.dts b/arch/arm/boot/dts/xilinx/zynq-parallella.dts
> index 366af4fcf8d9..b4651540935a 100644
> --- a/arch/arm/boot/dts/xilinx/zynq-parallella.dts
> +++ b/arch/arm/boot/dts/xilinx/zynq-parallella.dts
> @@ -44,10 +44,10 @@ &gem0 {
>   	ethernet_phy: ethernet-phy@0 {
>   		/* Marvell 88E1318 */
>   		compatible = "ethernet-phy-id0141.0e90",
> -		             "ethernet-phy-ieee802.3-c22";
> +			     "ethernet-phy-ieee802.3-c22";
>   		reg = <0>;
>   		marvell,reg-init = <0x3 0x10 0xff00 0x1e>,
> -		                   <0x3 0x11 0xfff0 0xa>;
> +				   <0x3 0x11 0xfff0 0xa>;
>   	};
>   };
>   

Applied.
M
