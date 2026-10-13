Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012019.outbound.protection.outlook.com [40.93.195.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504393C060F;
	Tue, 13 Oct 2026 13:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791899242; cv=fail; b=HfYooBBxDNksWBrhFSXiGXDcbvcQX1QlDbe5vDdj46W56MGzGit3/UCAgx5s91PXDZOnOTVaptO+PtbRLJoclNRLzbJxCnLV8ESHFwua/L2xfg1IUQ08L4IAHTkVif5x0R1g5TUKrzVZ4o1yeHDHyiBW2AKB/ldaw/1UF5J54FE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791899242; c=relaxed/simple;
	bh=qi4RTEIo05RgEy1qO2tIxY2g4vA/29/b50GWEtqOle4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oPFnDmseSoNfqlaLjcPN+ZFqT8oyNHnQvWhIzbndP28ujHscjhiaynhvI8DIUPlAX/r4VpBzBzeDuM+JAUkLUjLwGDZx/EZBHhIm9t5LOSi36TktzLuYTUnwQs1IoJLCMdXclmiOSn8pfxJtKw1AaUTBz4G0URm0PqzY3UXAJHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=q0XE4NfO; arc=fail smtp.client-ip=40.93.195.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="q0XE4NfO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPNlzrIsg9rmXMenNMl5EqJ3GsnHHTHfKdyY41tVacuaQNKS4V1fOLxZzyjr1K6bL1PLXCY2dPb9VMJTk4o3fPQ+HJO8ikO4AMjMOjCEZCkeFk9XfQ11Xo4r9mr/k+jwjiNzaCBnzNV1AJqm4N/nrPwWWJKDyGV+Lt1Fh9pnOIqBCxBebYCOfkMm5KDZArxC7GMwF7lGBG9lMluK31dS1hVfab3qr9J/hZ+olPuCux6Heholvppu44xjYveEjhbk5CS2cLvImnM8IbAn2LriOUOID2/Op0jXRt5Gm6hUfG02KB9cvnBvMUzBjRRjEuN3J2t4MrfD7iEOtINWrhOyig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uuYyo0EFCtQbnVC8NEi4F9cOe6CZmDtM0pcIj9fqhc=;
 b=DpIA3CO7onGdRfm2g8iL8G5S/IEwF/SUvG4n6DlBVigGvcqfGia1Sn/OpVe/ZHa1wqh8JwjoIcXfx93X9caTqL8/uXcVT3wQrQFbrpKhptXVQX9RTr7JxCQcKxDrw72yI1AFt/XtlK0sywMa0D60et+yFoVJctSK315104hatv9UydrLmd4URnP1Bm5Qi22OGVP1Axzx6qKesEyg1jUubVGu60olIueTV/Un3+eIkbvIVmCaUw7UckLgQh41g+MvRLFwDfGMWp8Q4XnLLi/ctF/UZ0NY2BvoEVkq79v0xdwgOYsimygAyMeXvZnm0nppw7YHqbX2NR5TIbzRekwh4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uuYyo0EFCtQbnVC8NEi4F9cOe6CZmDtM0pcIj9fqhc=;
 b=q0XE4NfOEKdIBFL5kRby+7zN2M+wzqzCdsu57LiuVb8gJ1A3FnPPf6n2+Q7RR1C9eFR2rAu9dWKWWyNSukAtF2Y5r6Y3tNVTeesInvrMVcZ1Bs7kijodCoyNPX+Ctxin1BygNxJ9LNyKRB09a8lPBXuTQyh06M+MPqbtPaqMH4k=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DS0PR12MB8293.namprd12.prod.outlook.com (2603:10b6:8:f3::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.12; Tue, 13 Oct 2026 13:47:19 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 13:47:19 +0000
Message-ID: <acdfefce-a7cd-4918-bcca-52357bcf182d@amd.com>
Date: Tue, 13 Oct 2026 15:47:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Marek Vasut <marex@nabladev.com>, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260916204509.166633-1-marex@nabladev.com>
 <20260916204509.166633-2-marex@nabladev.com>
 <ad7fdd3a-489a-4573-8dec-961a16e6539b@amd.com>
 <20261013132625.GA159927@killaraus.ideasonboard.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20261013132625.GA159927@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0094.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::9) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DS0PR12MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: f97db46b-ed43-407b-fc4c-08df29307fc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|11063799006|4143699003|261009223027099003|22082099003|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	BWxiIY6TsucbKvFUdl/AXSWeP1tVYcTxeDTlEO9pgatr0V0CpVIPg14rXDvY7RJwcchYxcRFN6wP1xOWkwwaFWCakoE8PFFx11HQSwfZc2JNre0c8hM963nipPrmooP+nNRjjAoLifAg9u7zEa3+wS2nFxS8Wr8/lb2FiSXZ1XKhjHhjH8aglJgePxsyhXEmy2fuSqanOAFdG+zg9tS87yg37M/whmKqFwlhvlQDC08+75t/nocqjnkJ+T1RUB/ccM23JSxM9WTIpJVT8dd/6taSeo0qyeGdYktEXUuPZlOx7fzhW9gIFqrmkj57uwrTaZOuOChRhZOSapsOJR2G9Ed23yeAjrIm9DOXY+2wKeN0tXZ5k65SIF7M8J3DKWbz2PaTfIO2PgeiGV7O8hC1JIIo/aJsoI41+IFLgixtZA3FisFt1Mp/PKT5C2aRg8bDAvDsLIDfjSe1x5O/EY9UurPKIU94/pWVKhRwhilKxZ0lmFpwaURlhfomjtwW3Vr5Ho8expe3Pe9UQJeykWHwa0uqea1x1i85HBwRNwr/Qqn0D6NSg5K1LA8F2POH61M6P5OgYrUQA5wOIe+Zvmb+VZrXiHnw0kqvf6JQFhP+mdQib0X1/2jHshCNq5cmVu8mPt/DwmbtExwcirj15Ilc9KAamyV1s2f0hrnN3FZfBrU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(11063799006)(4143699003)(261009223027099003)(22082099003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXJ6UEZpQ3d5STRCYTZiQ3Y4ZmorNXZIeS96MnpHdmdObk52a1lwT29EaVpo?=
 =?utf-8?B?QXJlVnVQZDI2UTZKRnFCU3IrOXlXUnBhcE9aRm4vaURlOVovS2p0Z2dTd3ph?=
 =?utf-8?B?Z3pPY1Vqa3ljc0kxbXhiaHdRamNycDhEOHZJT3Job0x6Q2FGMFA4UHNIUFlt?=
 =?utf-8?B?b1IreC9qOUwvR0tuMXAvcmE2VEFaaDVJRjQ1dzRHM3UwVFBmQk5IeVlqbk1Q?=
 =?utf-8?B?ZEFUN29EajYxdFl1NEVWdkdrZkhwVnI3eURnNDJRN3pTMENCVHcrVkF4T0lZ?=
 =?utf-8?B?eUwwTkVRaUhlckJ5S2FHK29scXJLbEZNd25JWm0zTmp6eGk4b0poQkpFZXBr?=
 =?utf-8?B?K1lvamZwZUYxdU5wR3lKc1FHMTQ5YmR4NWZWNzVqWVIzU1UxRWJIN050bjg5?=
 =?utf-8?B?SU1xRnI4MUlpa2hKNnAwemJDR0sxcStvNEVQOGhtKzQ1aGQxb2lWZFNPVkh3?=
 =?utf-8?B?RTh1Z0NZVEhTTDRJUEx0K3poSUhMVkpVRmhjUVFycTdJY0RIZXFqUy9EME4w?=
 =?utf-8?B?aXhpeG1QUGgxbUdYMC9teUpEMXVOSnJ1bUFjNVNmTGdudHJRam5iOXcwdEFO?=
 =?utf-8?B?bC9BdEFFaVcvdDN4WkpWUEVaVXlubm4zMmpiUTNmNUx4OGZYck5VMmRUWFRU?=
 =?utf-8?B?UExIdmVmMG9kNDFDc2VRc05WTG0xWVdjbGszb1VZdTl1NzRyZkJKM3VsZXhX?=
 =?utf-8?B?VkVjVlVpcWQwN2pEU3B4Q0RkS3U0enFsWTVaanNQS3REN09ZT2RsSlF0QlpW?=
 =?utf-8?B?T2cxWEIzVnpTa2hnSnFCKy8xTGVSRzFnR2lmTjJTRElpNG9UY2p3d281cXZL?=
 =?utf-8?B?eEhWL2Y5RUp5ajhlVzVreFhrRHVyVkd6UE8wMkFJWkZRMEJ6ZXdWVmdnM2Iz?=
 =?utf-8?B?WS9BNmdYMjdRTmJVM3p6aUpBZVhIM2xYdXl5aDFXczJuR1JEYTA5VkFZSitX?=
 =?utf-8?B?RU9LQVVXN3pWZTNuTjV0cEQvU3JJc0VDZG85ZmVPWGJrYW9oak5yZGt4RnJx?=
 =?utf-8?B?WFBid2dDSVkvbFNJcGZGUmlyVzFGTDlUVjBES1o4WkhkU3k4dFNNb1NLRVFT?=
 =?utf-8?B?USt1L1gxMk51V3k3aW9UQVdQcGJ0OVRUdmRuQnE3LzNXRnU5QWFSWFEzZWJo?=
 =?utf-8?B?Y2JjSldnWkJkMlA0a3V5UGEyQ1lEdUhodzNJd0ozcklDRkVjRmtJT3JDMUpN?=
 =?utf-8?B?QklWd243NHNTR2hHc1l6dWZQVGZpdTgyRmx4NUo2cWhvdW05MXg5Qm9HMXIw?=
 =?utf-8?B?clBsNWE2OC9vdFpSNHJONmM5OGJiTmZZcy9qRVk5UWlQbjhSblZCZHdvdWR5?=
 =?utf-8?B?dUFNN0czeVUzcjI5cldXaEx6bkdrNndienExczg2MjZLMzBWd2FubENDS0Yz?=
 =?utf-8?B?dkFUMjk1aENJM3l2ZDY3eGc3YmZwRFRnRmlwNm84WjhUc1hnc2tkdFdhZWg1?=
 =?utf-8?B?SUhtUTB4OEVoU0drb1IwcE1SeWNCV3dwaWFQNGJXcU9zY1FVaVp5VWtFai9U?=
 =?utf-8?B?a0xYUTJvZ3JkVUdRVEhwU3NRT01ic3JJVVlIdXVNN1QwbFJFcDVBV010MUJa?=
 =?utf-8?B?c29MUHpRMVdWc291NmJndEhlV3hUZld1U3hrTmZVRityWkg1YThKbmlXSlJX?=
 =?utf-8?B?S1ZnSElZWnU1c1g4eHEvTVN0V3dGT3lJWENlNU9aSlIxYStPdkRlWHRVcTFZ?=
 =?utf-8?B?K0UzMXQvL0d2YTgvNzNIVU1BTXhzOUZLd0ZlSW1uYmJKa2cyM1FQL3R6d1R5?=
 =?utf-8?B?TnltNTI3V2NHWU50d2dmRHdMZXcwNmF4RmN3T1RwYWFkVUN1dkh6NmYvSitX?=
 =?utf-8?B?TDF5R014Nzg2OEdGR0J6ZnNxMjVjNVN2U0pkQWNjNitaOVRaOE4yaHZnbTFB?=
 =?utf-8?B?L1AyaWhtUnZaNkNhVjZJVnZieGVIV1VmWEJicEF6cHdYUFo3OXZVbzhFS3g3?=
 =?utf-8?B?NUtiNWQwOS9ua1I1V3Vud3RCc0xmK3M4MWJ3ZVZ4RXliN0w4OU8rRUFneVRq?=
 =?utf-8?B?Z2p0ajJqcTdua2Z4ZWoxbnFxdnZDR1BuQWhaQ3gyaGhaQTNOMkZiUU0xWnJJ?=
 =?utf-8?B?eHZPVDV3WFdZeXN3bUJxcGViS0RBU3lLR1NPbW9Yb2hMWXVpelhCLytjYnRL?=
 =?utf-8?B?K2ZheVdvVXllQTRNYzgrK01KclpjRUtubWtBQ1hKYVdFK2t1enRwdyt4bGFm?=
 =?utf-8?B?ZkRXRXBpSlArcHVOQnFQQW5iMzZkYmdsU0RxelFYdUE4VjJTaUtnbWhIeTNZ?=
 =?utf-8?B?ZUZWMmRseHlzR2s0bXhmK2VyU1RUS0lJZ2lBTGcraFFjSHlKNi96aG01RkFP?=
 =?utf-8?B?QU5DOGVRUjdESG01TkxwTFJCS0JvUHJvbTdTKzVRWkJLdzVvMjlFUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f97db46b-ed43-407b-fc4c-08df29307fc5
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 13:47:18.9593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6oOdasiB3tKImiLIqNL/FRGQodqD8Cl0QycaNSi+KULrI1WCIq6aLPf0SKxnT8kp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8293



On 10/13/26 15:26, Laurent Pinchart wrote:
> Hi Michal,
> 
> On Tue, Oct 13, 2026 at 10:21:26AM +0200, Michal Simek wrote:
>> On 9/16/26 22:44, Marek Vasut wrote:
>>> Add support for ifm ZynqMP VHIP6 EvalBoard reference design.
>>> The board is populated with four ethernet ports, QSPI NOR,
>>> eMMC, UART and USB host interfaces.
>>>
>>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>>> ---
>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>> Cc: Michal Simek <michal.simek@amd.com>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: devicetree@vger.kernel.org
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-kernel@vger.kernel.org
>>> ---
>>> NOTE: Checkpatch complains about ethernet-phy-id2000.a240 being
>>>         undocumented, but the TI DP83822I is generic C45 PHY that
>>>         is valided by Documentation/devicetree/bindings/net/ethernet-phy.yaml
>>> ---
>>> V2: - Rename lm75 node to sensor@
>>>       - Use GPIO_ACTIVE_LOW macro
>>> V3: - Drop bogus clk_ignore_unused bootargs
>>>       - Drop gpio line names
>>> ---
>>>    arch/arm64/boot/dts/xilinx/Makefile           |   1 +
>>>    .../dts/xilinx/zynqmp-vhip6-evalboard.dts     | 300 ++++++++++++++++++
>>>    2 files changed, 301 insertions(+)
>>>    create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts
>>
>> I am not able to review or take this board support further without publicly
>> available hardware documentation for the platform (board-level and relevant
>> interface details). Please share public documentation links once available, and
>> I’ll be happy to revisit the patches.
> 
> There are plenty of boards that have no public documentation. Pretty
> much all phones and laptops are like that. We even have a whole
> architecture that only runs on a few machines in a single person's
> basement [*] :-) The kernel has never required public schematics for
> boards, SoCs or IP cores.
> 
> [*] A slight exageration possibly, but that's how I heard arch/alpha/
>      being described at the maintainers summit.

Pretty much every SOC with programmable logic or FPGA boards have unlimited 
amount of configurations and make no sense to describe all of them.
It means what make sense to describe are boards which people can look, check and 
compare that configuration against their custom design.
But if there is no public documentation what you want to use to compare against?

Can anybody even buy this board? (I expect you can buy that phones and laptops).

Thanks,
Michal
