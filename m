Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011043.outbound.protection.outlook.com [40.93.194.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7DC34E75D;
	Mon, 12 Oct 2026 12:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808658; cv=fail; b=s/FVASRzr8IfGgYf0dHzNeVPTD4xxzSuxTSa3Ths/YnnfYtNQkBPgeyOj5fehTUtnJfiHt1gmF105Egg7XTLdbcLgTLX/jo0MSXjUvjO+1w5XK6sL0ADBOoE+VlNftrQXcPQP2D2IvocTjmRdecWZlb6i1D/GTwLJ1OuqLM7xBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808658; c=relaxed/simple;
	bh=PXeDR8rlGZb+Uc0qQpr0W/uEhrwzPd9DeUAWeQncjhA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HjRfDvV3CcryLS9NOF2RJrSDv4RtisMfWN8+JKlSAyj2xThU+vJwRCMEGybvzS2zuRH+SC6vh9K0/s3yFWVqz98okqy6kcEA2+HVl6XCFrhR3R66RjEpZ4xDPvVEYKGh6+jogZ8hkFJvj4UM9WprJ7O49qTUTohopri0Ak91dAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4o9D5XGs; arc=fail smtp.client-ip=40.93.194.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4o9D5XGs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Spub8oafw3u8BHceAN+hQT1+n7w58uFlUqAUkMZz6gjuImBmTLtIrrtJ5ijnlf6PJ015I9t9HwKBahCU1SWwwioQJxzl73Nv+Y51WHya5D7kA7C46jtt+uFbG6V864iuteUnMSwHWFTOC/qri/9DYE2t5HiW8keTr8iJFUOWiisc6ThxP8RKtwhGIlAKKeHC7F1Ia7TlZsY9icIBsaGC1pJhgkJpgrb6bmu4GxNHUutXQsfYzELnjf0PiA0YEkS0/94QTUn7PvpKL2OlYYIs2aCh8L9vTYb1lLl7tmy37n2Hwt18CNqON4kXmaaSdypyVgTpRjJa9X5oLZ9hGE/1Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRGhAe8pUFvvzJPKPKTxCC4bXu6S1byGnjB87m/nNHs=;
 b=QjTEuuiOb4OhLq6HB6r+CCCjMDKc1j6EhY7P6WaEl1c4vCfgIyDsMoIBSSzNEB84X1rE+3qRU2UfloleLtCdJEcPCmvX4dgtrHDXeLlM8pWPArUG/KPBo0bPnxwlBUpFyRqCO+C2DP/UtUpWRTigHBi01AJNDeNdNRGZL2QIfA77m5eBIwIiv71qsspYBwlipfWLIkgyQADZmI6U0foo0SJX+rp8OQSRaiBz6b/VbkvkD9BAhgaWwUfw1zJISY56rFEhb/SIoDPTS4C3sx77hIfUVF58DKX4ryp/mSYe5M2SLOwW6tZLnbJZEUJgKFZmvwjxEuZpWZFFIzTCgCOoQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRGhAe8pUFvvzJPKPKTxCC4bXu6S1byGnjB87m/nNHs=;
 b=4o9D5XGs1rkdZGP5eC2lreYWupqFVUOh+AExbWPndxfqKsEVDCbE9JCYbcH0QV6eZ/7F5dr/QXRfu8//+g6r4qws1v0H5gcOYW3JRHRT2NNm+H4yblBzdfyFHTIf5UNAmImCF3RGxLiFzMpucVTzWhzbXr+XICYbboDRCGyQpNQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by PH0PR12MB7095.namprd12.prod.outlook.com (2603:10b6:510:21d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Mon, 12 Oct
 2026 12:37:32 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 12:37:32 +0000
Message-ID: <917db1e3-1bfa-453b-b993-55ae20fa3055@amd.com>
Date: Mon, 12 Oct 2026 14:37:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] ARM: dts: zynq: Use dynamic CoreSight funnel and trim
 clocks
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Wei Xu <xuwei5@hisilicon.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
 <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-4-c3edca1c480b@arm.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-4-c3edca1c480b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0185.namprd05.prod.outlook.com
 (2603:10b6:a03:330::10) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|PH0PR12MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d4cdb0c-c3fd-4e56-2c5b-08df285d963a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|261009220027099003|261009223027099003|56012099006|11063799006|4143699003|921020|22082099003|18002099003|10067099003|261009223327099003|3023799007|261009221727099003|261009221227099003;
X-Microsoft-Antispam-Message-Info:
	Qt512JjgdViuR+lNFhh3glEUTh5Fnx2JK5VX9TDoekB0R53WL4ZUelryZlPQzvykfHg0JRBFp2g0USKcJ6hkOnwHv81rMrIodASxxF26N4c30zTfdKEiFqRRkxV7fakexl7hqmDtU4dsSnhiz+wkyFcNgRW/MYlhKGC//jT4HwwkZ+DaGYVyK3eN1CWjR/hE5ARfMb8c5IBiSvGsw/6VumSd414gw080OSvq/GHY4cgUKcv+H3DcniKtBR4OFZ9kAvlpnRBkPqkvz2Re3xj4o1TTgOcCuXEK8OC36t/ggsAESgwEKCMKAl8+wdHOp9KhWJe69Ra2KVx3+nMf+yPvAOEr4LnN2ErMxO05yZi/jAmOCGpDeB6d1dM3x9xJOjFLnQT2bydnuWqkZibktm64vbdf01TJUbvBAgCt0iba6OAE9QLb+ARsqSLUkgq29j9KY7pcfm2FuXLmvdtbEOWk2T3giiAdyGf4ZLZXJKiX4OZFjUJGgS5muIN1BDfJM3cz/KdCcyt9C0QzylgP8YAKSZvVXoZia25HWZvl8MtM+mdbl9h1HBCNha5AgkZ/ZcP3nF6bM3bHKpMklIheyryho1/xk1XvdN6BCEaPKUIBmNccp0ILv7Tasumqeku2zJ0vLNYh37NnW5mcOpzkJbzNXLIdEWxxANIw2C99POsSjhrtbNCoiH9Vm+6Je9xiWmkxmgRFOLrG0lxUnQdMWmfdlQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(261009220027099003)(261009223027099003)(56012099006)(11063799006)(4143699003)(921020)(22082099003)(18002099003)(10067099003)(261009223327099003)(3023799007)(261009221727099003)(261009221227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVZKb3k2U1RlWDRNRTdYVDd0VWlpZ2Z6K1FPekp3c0FYdFExRk43YVpOaWxT?=
 =?utf-8?B?SWtsR29FdXJId0pxV204RVNuaUV0RlNxUWlUY2JKUVlDUnUxQ09LY0RodUE5?=
 =?utf-8?B?V3M1VlZoZUR4UmpmTkx5dzRBRXlaSVVKVzdha3ZhY1REMTlTV3hYSnhsdkdp?=
 =?utf-8?B?WmRsdXZubytYQzRJVDkrbDFaYXBTczRrOE9BOVVsakJJVnZkNUxiMmd0Q0dG?=
 =?utf-8?B?aVZCMUozQS9XL1Q5TE1BSHJmWUJOZ0xkVXBKTmJuSXdaZjNUKzZRN1p1VVVi?=
 =?utf-8?B?NUdyYll3Q1ZjVzIyRzlRYXdUd1FLYzBzMG5RSDdQakl0THVmL1FSZ0xiY3VG?=
 =?utf-8?B?dUp5NzNtZCtxUmpTS2hqOXRCMTNPbFlsUlQ5Qm5EUjhVMisxc2cwbjY0cjdE?=
 =?utf-8?B?TXF3VU5Wb0Q0TjJSS01wVWFXOXJab1BuNGNYZDFZZWh0RkIwVll4T0s0Q0lL?=
 =?utf-8?B?bURBNWI2RzRxak5WcDFOYm9la244dC9kVCtmTFNoK0MwYUlyR01jQ2VlNlNE?=
 =?utf-8?B?ZktiSG1TT2ExZVFhTXN1SEc2dVFtYklQUmMwQ2FBMEQ4TU9DcjNQUzQ1eXA4?=
 =?utf-8?B?Q01kUWk4S2FueTlTODViVmtsQmsxR0plU2d3MEY3VWRNc3ZkTXBXaFBJdzB6?=
 =?utf-8?B?K3JleTZRSzBvOUNMTTY1Q3A3TXUxSTd5VGduV1FyK2VFOSsvS2ZNS3dSdHA1?=
 =?utf-8?B?UXpXN09YdmZVZzlVWUI2bjhVL0t4a1lQVkJTR3pWVEMrWUYySVFIZkRnclo4?=
 =?utf-8?B?aTUvK1FhWnA3ZmRJWm5EbUFFamg5MWxXZ3d4SG5WQWRxcVFOTThwVnhQYW9I?=
 =?utf-8?B?dWRMYzdwSEdvdkxMbjRYWFNrcEpVZEpzaEJESE10bDZJalFhS2xrWkJtWDlu?=
 =?utf-8?B?bWVQYWJIakFNNDBsQWxwRS9yUVJLV1JhaHhCdVVXQ2p2RStTRXFWZmFXOTRw?=
 =?utf-8?B?VXd5WUpIM1hoREtoS3k1L2xuTUN4VVhkVjUyMmcrODJGL1U4R0cyak5YRnB0?=
 =?utf-8?B?OG5mc1hXZThHMjV2SHlNTEM0Rm5rdnJSTUkrVGNEUm5QSnhIeWpXMURxci9T?=
 =?utf-8?B?c1pjcC9JWHdHODY3Y1RKeGgyeHo1Q1NEYW8reW1iOVpiL283YTRNRXBsTlhw?=
 =?utf-8?B?bVdmZUJUZGl1WGkrbitwYXVLZ2V4WGlUTDdWaWI5blA0cXltVmJsYmxmSlZG?=
 =?utf-8?B?dWVRbE5SZkJrTHQvL2VNM0Zrd0NRUEtNVTVrYWlPbTQraGtndm1VMlFWOE9O?=
 =?utf-8?B?bnBsWDQxVlNHMzZ6SmFkR2FBS2J6cDFNOUFXalFGNk96QTQ0a3UwekpRc2pU?=
 =?utf-8?B?N1o0cytoL1Y2MUNqaWFLcGtBbHg2ZXc2aG1pOXZ6RGEwYkdVTEE2aEV3S3Q2?=
 =?utf-8?B?dEx6WUwxZmR1ZmdhU0d6WTczdmdxaTFhQjZQKzFKbXUwclU4d3ExbVZXeE9j?=
 =?utf-8?B?UXF2WjQya3NMSi8vc1MzNHE4OVQ2R3hMTzBmU0p1NjZRSEZBeTVoY29ML3pM?=
 =?utf-8?B?R2ZsOVBoNjcrc0JPaXBCWGJaZzI2b2J5YVA0Y3VrOUtDd1VhVWlDbmJta05B?=
 =?utf-8?B?VkUwemxBTHBBUmNRc3ZoQXduQXhqbmdHWkFvODlMTEx2dUlsSWVIKyt5UHpz?=
 =?utf-8?B?aWh3ZkJGL3l6YSswYytJaklkUG4ySStaZGlPR1dGT1YwOGU5ZzF0Y21LS0pG?=
 =?utf-8?B?Zlo0a01OMGViK2IxVUdzWFkrUWNjL2h1cGt4Tk9COEQrc0ttTnNyOWtJS3BK?=
 =?utf-8?B?N203dlgyMDI3anVXblY0dDVYUWhFRjc2S2RCVEh4cWJ1Q2pQNlJDQTBWNXRV?=
 =?utf-8?B?UDhRak5BTDBlQ09hMzhUaEFqN2hnWVNzNENVZHh1dTZ4S21EaXUwODF1VGFJ?=
 =?utf-8?B?WHhGd082OTNkQXhVYlp0L1NtN0tMbkFaUTdIaHJocHRXNy9XUjJCaHM5cmxN?=
 =?utf-8?B?emUyV1NjSzdCaEZLVkF3Nm5xRnB0dFRhTW9qNDVoV0xNVnV2bml3TVBZbk1R?=
 =?utf-8?B?V2FjeXdtNlB1N2pUWUgyNlZQaDNRN3NLcW9hekZOTWE3OFFJT0JUS2NqVGRz?=
 =?utf-8?B?ek0rWSswclJSYTZFRExVUm5EZ25KN3k5WlVRaUtZQkEydjhoL014YTd1K2xV?=
 =?utf-8?B?QktsSU9naEJoaTNTNURLSndMbHRjNmxNcUlwQTA4RWw3WnRRYXVrcjEwVFFE?=
 =?utf-8?B?NlJBaVpyRU5PY2NvTWo0SWlXU04zYjVIVEhHdFBPZm5mNHhWVWlHSXpkNHo1?=
 =?utf-8?B?aTYxRlJZWTFUdHVYbXcwUHdFRVVyaFJzRm9SalRRd1ZHWmIrWU9oUlFCY2ZG?=
 =?utf-8?B?bGZDMjVvNVR3dnUyR2ZhdTNpbldaazFpOEN1R3hIM1Nkck5ZVXlHZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4cdb0c-c3fd-4e56-2c5b-08df285d963a
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 12:37:32.8054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pHNL57/tloIvsPdOqOSOr78b9/5yTDXnSd5w1ov7mx1n/I929Q0X2tUXfK+phlVR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7095



On 10/2/26 17:07, Leo Yan wrote:
> The Zynq-7000 funnel at 0xf8804000 has input-enable registers.
> Describe it as a dynamic funnel so the CoreSight driver programs
> them. Keep the existing apb_pclk reference required by AMBA probing.
> 
> The static replicator has no programming registers, so remove its
> clock references. CoreSight drivers do not request dbg_trc or dbg_apb
> for the funnel, ETB, TPIU or PTMs. Drop those references while keeping
> apb_pclk for the programmable AMBA devices.
> 
> The Zynq clock controller registers dbg_trc and dbg_apb and calls
> clk_prepare_enable() for each gate the bootloader left on (see
> zynq_clk_setup()). This does not depend on the CoreSight nodes' clock
> references, so removing the unused consumer entries leaves this
> protection intact.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   arch/arm/boot/dts/xilinx/zynq-7000.dtsi | 24 +++++++++++-------------
>   1 file changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/xilinx/zynq-7000.dtsi b/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
> index 153b8d93cbee2c30b399c0770f2022b307fe0808..4280fe6da379064b6ac5bf9e9a5b891830a094b2 100644
> --- a/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
> +++ b/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
> @@ -68,8 +68,6 @@ regulator_vccpint: fixedregulator {
>   
>   	replicator {
>   		compatible = "arm,coresight-static-replicator";
> -		clocks = <&clkc 27>, <&clkc 46>, <&clkc 47>;
> -		clock-names = "apb_pclk", "dbg_trc", "dbg_apb";
>   
>   		out-ports {
>   			#address-cells = <1>;
> @@ -464,8 +462,8 @@ watchdog0: watchdog@f8005000 {
>   		etb@f8801000 {
>   			compatible = "arm,coresight-etb10", "arm,primecell";
>   			reg = <0xf8801000 0x1000>;
> -			clocks = <&clkc 27>, <&clkc 46>, <&clkc 47>;
> -			clock-names = "apb_pclk", "dbg_trc", "dbg_apb";
> +			clocks = <&clkc 27>;
> +			clock-names = "apb_pclk";
>   			in-ports {
>   				port {
>   					etb_in_port: endpoint {
> @@ -478,8 +476,8 @@ etb_in_port: endpoint {
>   		tpiu@f8803000 {
>   			compatible = "arm,coresight-tpiu", "arm,primecell";
>   			reg = <0xf8803000 0x1000>;
> -			clocks = <&clkc 27>, <&clkc 46>, <&clkc 47>;
> -			clock-names = "apb_pclk", "dbg_trc", "dbg_apb";
> +			clocks = <&clkc 27>;
> +			clock-names = "apb_pclk";
>   			in-ports {
>   				port {
>   					tpiu_in_port: endpoint {
> @@ -490,10 +488,10 @@ tpiu_in_port: endpoint {
>   		};
>   
>   		funnel@f8804000 {
> -			compatible = "arm,coresight-static-funnel", "arm,primecell";
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>   			reg = <0xf8804000 0x1000>;
> -			clocks = <&clkc 27>, <&clkc 46>, <&clkc 47>;
> -			clock-names = "apb_pclk", "dbg_trc", "dbg_apb";
> +			clocks = <&clkc 27>;
> +			clock-names = "apb_pclk";
>   
>   			/* funnel output ports */
>   			out-ports {
> @@ -536,8 +534,8 @@ funnel0_in_port2: endpoint {
>   		ptm@f889c000 {
>   			compatible = "arm,coresight-etm3x", "arm,primecell";
>   			reg = <0xf889c000 0x1000>;
> -			clocks = <&clkc 27>, <&clkc 46>, <&clkc 47>;
> -			clock-names = "apb_pclk", "dbg_trc", "dbg_apb";
> +			clocks = <&clkc 27>;
> +			clock-names = "apb_pclk";
>   			cpu = <&cpu0>;
>   			out-ports {
>   				port {
> @@ -551,8 +549,8 @@ ptm0_out_port: endpoint {
>   		ptm@f889d000 {
>   			compatible = "arm,coresight-etm3x", "arm,primecell";
>   			reg = <0xf889d000 0x1000>;
> -			clocks = <&clkc 27>, <&clkc 46>, <&clkc 47>;
> -			clock-names = "apb_pclk", "dbg_trc", "dbg_apb";
> +			clocks = <&clkc 27>;
> +			clock-names = "apb_pclk";
>   			cpu = <&cpu1>;
>   			out-ports {
>   				port {
> 

Look at my reply in 1/5 and NACK for this. Clock 46/47 needs to be handled and 
described in DT. It means removing them make no sense.

Thanks,
Michal
