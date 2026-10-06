Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010006.outbound.protection.outlook.com [52.101.84.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CF93F54D2;
	Tue,  6 Oct 2026 12:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791290001; cv=fail; b=mmi7u5Wvhc17XaRplDfzpXNevBXkcZ9zIvaIzvww3I0aKN5GBvBm6C+1OeLgnnX7mmuvb2wR0JUp+MUlcSY/uxWNTqSOIGNwicL+T5cXuQj3M2hYhNjaQzLwxf5VhgpJ7w3xZLTpEhpNtsy9P4ivMNsEfkC/8oX5YAT6ej2a9ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791290001; c=relaxed/simple;
	bh=0W3YPkpLI8ulpI3LR7D3pQkDDyEsQ/psmGfgjUveWyo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gTFwduVYmNU1Gbz4l0tPsGYjbZ78ne8mxAvPRUfxbFkF6mgg85ehF+Fm+fwM1JDI2e+M8cykaqUfEZa8A720mjXe0bbgH+qwhsTa9QkJRvaDuA8AVopW5eQ3oyyqqevSYhAtz0zMDgV7y3kLzeLjgb8BJSoGuJqiNwCSd7cCq4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Xbu4pemS; arc=fail smtp.client-ip=52.101.84.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Xbu4pemS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hqcis7KiKIsI7UC3ddLwAs3Bb22iY5OTMecgt2OQIQlequspqjFGmemGg9sVPmwiUx5v/HiPEMKc23QSQMcGOs0MJOGFjUSdNZAzoU0t6SqhDDIzPEOUMtt3VWfqmmrlwZF1wczSZrLvzm9QKu5iUmUbBzAM906VcVWBEVq7vc4IArvl60Yyi6A39amiWeA0vB1cuBW5lo+240JvG4NkPG2Tucre9A3ESM4Z7I43055NGkaTkjfe0f+Joaf/Do3BS8dJ1c9s6t1b9KbD1Wr5+tyDX0+n6bn1De0QwkM4Lp4wwVDmSfwRqxU4V4+8Lg/QQnC8IQvCmHU0ozrSJaWdCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYe4EhmM6d/Zseobfy/qUsNkksLASh2Bv8kH4UN7/Rw=;
 b=iZ+fAMpuxyeGzgg/pqvoyZZLVtoud4xZ7V2LPzhQenyvosgiMB3Ha9zHu/cQmbvsXSTiTAOYyfa00E1yq6Hn5aRUeIPK9558Rilcwyn3595eEHRJgCWoTslBf0icfMXCYaHNNZfAsNSTuP4hI3W32nMaXigtQq1wGVl4s2hM78tkcypfvkUDbWYh1XN0LnRLZfDAIWz0TV1eG6282djA8JtPKmzMu98IH1+SnBiDpR5DIYgze0fj+n6yHme1gaN9/V7IjSEgOo8hFSKCiVoYLHcvLWTCpIqOQcptmZHCQW5nPFesukg2l1hAOO59PMPm7TeAA41zPCjanv2HuMz/cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYe4EhmM6d/Zseobfy/qUsNkksLASh2Bv8kH4UN7/Rw=;
 b=Xbu4pemSLgw0pSIz63gCHbLUy/qdjCNpmB6vkFlnJuaUNuQXEpKT9gXSvyUbkUB94jPtrmtp7q6ghgKRRpLoJr6JE2Bbpvn9oK8G4GuoG90JkCtQ4+icCS2fe+1xdh7ddRTx0ID6WjEQPQdrWiMflpsPyzqIkyqpvvdmbiHBEXgtgctBBebUUwGT+rCPfm6jcNUR2tAoxQlMpRpQiWnbuKVowelgF1gycbXACyeRvnLC6zkYO2aGNgsCqT+oBRQk6zqSksGb7s7TZpDBxBbCXo2AeXvuwefR8ceE94Xvhe9kEjxCf/ZwJqCmo3XdnfD3BBqWMKipDgAGXo6RM+XKKQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by PA2PR04MB10216.eurprd04.prod.outlook.com (2603:10a6:102:406::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 12:33:09 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 12:33:09 +0000
Message-ID: <8b8ec06e-ac08-491e-998d-a46e1d9ed524@nxp.com>
Date: Tue, 6 Oct 2026 15:33:06 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [RFC PATCH 6/8] media: i2c: ov2312: add Omnivison
 OV2312 driver
To: Rishikesh Donadkar <r-donadkar@ti.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: tomi.valkeinen@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com,
 kristo@kernel.org, sakari.ailus@linux.intel.com, mripard@kernel.org,
 jai.luthra@linux.dev, jai.luthra@ideasonboard.com, devarsht@ti.com,
 y-abhilashchandra@ti.com, laurent.pinchart@ideasonboard.com,
 tomas.babinec@nxp.com, daniel.baluta@nxp.com, Frank Li <Frank.li@nxp.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-7-r-donadkar@ti.com>
 <e469d168-39f9-448c-a7ab-5d02b79d8cb8@nxp.com>
 <3a488385-bf10-4500-b78d-e43c152387a4@ti.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <3a488385-bf10-4500-b78d-e43c152387a4@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0042.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::19) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|PA2PR04MB10216:EE_
X-MS-Office365-Filtering-Correlation-Id: fb86fe8a-f24e-403a-4941-08df23a5fa55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|23010399003|11063799006|56012099006|4143699003|260925022911599003|260925021311599003|260925021911599003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Js9gUsF1nZ/o+SSanmiNiKXcj+b2FdS2hCCubPMl1GmUmOw7UH8GRS/V8TAH4338HJKun4GzPWFzbh1J2GTg/sUWgDJVaKtCFU9FVEUQ88lqYXcapvlv3GUuqszws245VUXKGzJyPzJ/b4B5XWU2w/pxaddwiQMI682dw1l9Ysiu/XVYwsHN7vi6ajqaoLiI5tb1K0QU8VvFl8N3KYvYtUjlOyW7cPzGyLdiZZ2vmcIdlpp8G9o2x3C8AnCdg5zKkzeLDDLHIMI2D/B5mrTneizfWAr0D/nGiUMzXc1YRuZhhHx3mpQqmJDpWhMRzajKd2DEEkoPTsv42LzrkDRlysBRgSgQBY9kEqIpbNAaFlphUuud6sUhI8CpkcsxLABFbQvDB+EZYKu/4KVu2KQxaMXiZFXUBN4Rk8oIU0rXnsHD9jBGCrP2svZdv4MLlDQxLQkwCJ8seVEITyXwsI/Mt2ye0+Y0WOQbkYj+BkKSgglAp6gEA/K40e/iqPNUJra7KElcuGMyH3FflU2pciovtOjse46fnbdEoQ8Y127Cf0Myax1auN5JbI/srG/mL81iDblPe0zA209p0j27vh45Oqeik2nm5Aavqpa7jTzTmyF0fUlgeT5FjD5v/VyHfOH1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(23010399003)(11063799006)(56012099006)(4143699003)(260925022911599003)(260925021311599003)(260925021911599003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajFsY09CVE9EQmIwL3F5eU4xenVseGFwaHk5b1NZcW5aTXh6QnJkRStwTEZz?=
 =?utf-8?B?OGlHUlRBUmpNanZUV2VTWTF1dkN1Mjk4eG80aUthQmZId0ZTVTRmaHJ6a1Rx?=
 =?utf-8?B?MjVwc0tYOVdGZmZuNi8rclpzMW1FMWJOS1Fhd3RkalNYd1p3VjZHZW84NHFZ?=
 =?utf-8?B?L3BEZzdFblhGTTFKbXBSQ3dzQmlzdCtGRWgwY01jQkRNaFNsQzlHSGo2Rnhr?=
 =?utf-8?B?Z2h1MlhJVFBzSEpYcmZDOWhvdVdaK0FVRW91ZUhBellxQVEvZDNVbFEybkg3?=
 =?utf-8?B?aHhZaitlNHlTZkJEUEdWQW1pT3VpTlFubjdUNjZuNGV4S3JVSFpRNVhaYmhi?=
 =?utf-8?B?L0dJWlB6M1BtZFFRckZCOS93OWIzZUErTlNRZVZROVk2SGphQnJ1RElVK1lS?=
 =?utf-8?B?cTN0SlpXaHY4Ymlyd3g2L0trRGJmTnFnTkVxZ2NLSFhDZGRRclpLYk8rVERs?=
 =?utf-8?B?bklCYm1BM2FsS2RRTkdFYWZib3FjUmN5SlFwcGl4bTk3QnJlNGxxenNFMGRH?=
 =?utf-8?B?UzRXc01wL1Y3WW1sUHU4Z1BFOEZVbmZkU3hVcnArOCtSV3d5dnN4NmdDMTI5?=
 =?utf-8?B?QmR1TFJ3Q1Q5UTg1LzB5bHc2N0RXY3E1UlpVY2VTdk5vaFc2Q3B6OUo4R0pq?=
 =?utf-8?B?TjNucGJHU1ZBb3VaMHZ3TU1VcEZ3SmY2dXhEZExzRGNpQWRaWGVxRDhmZWRN?=
 =?utf-8?B?bmJ1aTRnWEtTMTAwb1h0a2pwMUdrZFZZSVBrdy94Z2F1NEg3N2lDTmNJWnNw?=
 =?utf-8?B?QXFjL3p1RFBMdFlYQlltK3l0ZHhzdVEydGNzVENmNGhXQzhVZGdrQmwxNnJs?=
 =?utf-8?B?cFZ4clFhdDZBSU12VTNvRmhKMlJwQmFCN1Q0ZmgxSW5wMWI3YWZLMHpjbXls?=
 =?utf-8?B?ZDJraDJLYUxsUFgyTDgzTm94eWpHRGtkS2NsZVZsV216c2NWd2w5R0cxK0Fs?=
 =?utf-8?B?cVFZd1QxdHMvWEQyb3BTdW81TFFUSVBDOVlLWDlGdFRKdWxOOUdaTGtiSGlI?=
 =?utf-8?B?TjVuZ2JnWmZmSVl6enJpd3J6UzJiU2dLSnJzU2VSRTFIeHNjeHk5bTlwSjBv?=
 =?utf-8?B?dG5KN20rRTM2THB2MGZQTDdJZXN2cVZ3SlRQd2Y4NWFNVytSZUtRWFE2TWk5?=
 =?utf-8?B?Zko3Zk1sWXBiaVFqMlpWYXJoTHZpMkNVcXluVHgvLy9OczhyVllZTHRWamZl?=
 =?utf-8?B?SVUxajhHbExZRFk5eTdtN1RBQlVTNWRkZmJ0SUc3L093aUV3MWpHOHNhdXZU?=
 =?utf-8?B?WG8vblFSR01ZcFF2WVVaRWZzaTI1dmVQd0h1TElaRUFiRkxHSEQ5UmsxNTNo?=
 =?utf-8?B?ckVUUmpTRno2QWFTYWdTQ1d5Y1dHRlFvOE45aUVWc2xGYkxtcGNJcE5MZVFk?=
 =?utf-8?B?a0w1NEJkRjZGaVhiNHUrZjZ6OWxJU2ZlWFR5WWNxNS8zRlNiUUgxeEtibmk4?=
 =?utf-8?B?eHRXMkJ2Z2R6QVcwdFY1WThROXFySnJUdEYwc250WjJWaS9HZDAvdDJwclNm?=
 =?utf-8?B?NE1WL3lhTjJFVjZTTUNXck1HQTl2Q2RzenB5VzA2eUZXSy9IRGFsdlk5d1NL?=
 =?utf-8?B?bllwWTJ3cVg1SXFlbUF2aDFJS0lmU3BaWmFKTGhLS2dvMHFoNTJxTVNJRnAr?=
 =?utf-8?B?RDdIT1lEVVpjTHFuN1dDYTFGOWZ5MkdCRU9BRjJrVEhQMW0zVlR1NG9MdFJM?=
 =?utf-8?B?RlRhTVlyTUY1YlBUQ1RIODJqWUsvSGo1dnFGb295eUdpcU5nZklJaTRoUFVm?=
 =?utf-8?B?N3FXbFFWaG1seGdkZFFPSFhEQ0ZXUkRhcVV2MnlkU2NVWW43QjM5TzNsTU9s?=
 =?utf-8?B?QnRreWoxd1JnRitGSDEvRkNVU1NxT0dKV3VZV1YwTE5NVmpyZm9ESUVjczdP?=
 =?utf-8?B?RHhqNFFMN1JKd3JabTdxWGN5U3JuOHBqVS9hUTRYM3k0Q3pFbHk0ZE5UMmVh?=
 =?utf-8?B?LzdkS2RzS1lRMGVYTmlpd1ZxaHBHYm5pV3VCQXdiM3hrRnl4RnRGTVRLMkIw?=
 =?utf-8?B?Mkd3bHpDKzBiaWxzQUhoUUxPdWlabStiRi80L05pV2pkRnNvdzBkeTRYYlB6?=
 =?utf-8?B?bFJGSy9BRFZ0SHRGVzBRWTVZWmlCL00yMmR0QkpHTkh0bXNBR0ZyTnVlSVBJ?=
 =?utf-8?B?a3dYV3hiR0dGT3dlZlJSTmJHQUpaR1EwaE9qRGtUMlZ4MFM3anZlRzJKclZS?=
 =?utf-8?B?ZGVMblN6YUZoeGtya21QZGZGUDVvZUtteXhtVUc5QWVjeDZSaFpPTDJLOHFl?=
 =?utf-8?B?b3JyQ0ZaWjN4ZUtpN0g2amduK250VVUvN3RUZzhyc250Z1IyMTZNSkpIVUFm?=
 =?utf-8?B?UlFYSktwbUdsOWFPcmhmdlQ3K3V3OXU1RFRLYWpsNmNya0Jac1NzUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb86fe8a-f24e-403a-4941-08df23a5fa55
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 12:33:08.8964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aCVu7QYcFeOVDS9VlufgDPn0ImfN8deBSNVfSucrlPoXmZgGcuhuQqSL96ZoPqxotX7XK3SYNcR3YrHnjjzz4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10216


On 10/6/26 08:19, Rishikesh Donadkar wrote:
> Caution: This is an external email. Please take care when clicking 
> links or opening attachments. When in doubt, report the message using 
> the 'Report this email' button
>
>
> On 02/10/26 21:46, Mirela Rabulea wrote:
>> Hi Rishikesh, Jay, Laurent, Hans, Sakari,
>>
>> On 9/25/26 16:29, Rishikesh Donadkar wrote:
>>> From: Jai Luthra <j-luthra@ti.com>
>>>
>>> Omnivision OV2312 is an RGB-IR sensor, i.e. it uses a 4x4 R,G,B,Ir 
>>> bayer
>>> pattern to capture both visible and near-infrared light. Every 
>>> alternate
>>> frame, the sensor changes the exposure and IR flash strobe registers to
>>> stream an -
>>> A. IR-dominant frame on CSI-2 virtual channel 0
>>> B. RGB-dominant frame on CSI-2 virtual channel 1
>>>
>>> These A/B frames are routed as separate v4l2 streams, which may be
>>> mapped to two separate /dev/videoX nodes by the CSI-RX DMA driver.
>>>
>>> Both of these streams are captured at a resolution of 1600x1301, 30 fps
>>> each (60fps total). The extra row (1301 vs 1300) is an embedded line
>>> prepended to each frame by the sensor, containing the following 
>>> register
>>> values:
>>>    0x4813 - VC (Virtual Channel)
>>>    0x321A - Group ID
>>>    0x3920 - Strobe
>>>    0x3501 - Exposure HI
>>>    0x3502 - Exposure LO
>>>    0x3508 - Gain HI
>>>    0x3509 - Gain LO
>>>    0x350e - Current Exposure HI
>>>    0x350f - Current Exposure LO
>>>
>>> This driver also supports a few v4l2 controls like horizontal/vertical
>>> flip, multi exposure and multi gain controls.
>>>
>>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>>> ---
>>>   drivers/media/i2c/Kconfig  |  12 +
>>>   drivers/media/i2c/Makefile |   1 +
>>>   drivers/media/i2c/ov2312.c | 939 
>>> +++++++++++++++++++++++++++++++++++++
>>>   drivers/media/i2c/ov2312.h | 285 +++++++++++
>>>   4 files changed, 1237 insertions(+)
>>>   create mode 100644 drivers/media/i2c/ov2312.c
>>>   create mode 100644 drivers/media/i2c/ov2312.h
>>>
>>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>>> index 4d9946479160..8d9d8d491b2e 100644
>>> --- a/drivers/media/i2c/Kconfig
>>> +++ b/drivers/media/i2c/Kconfig
>>> @@ -496,6 +496,18 @@ config VIDEO_OV13B10
>>>            This is a Video4Linux2 sensor driver for the OmniVision
>>>            OV13B10 camera.
>> ...
>>> +
>>> +static int ov2312_read(struct ov2312 *ov2312, u16 addr, u32 *val,
>>> size_t nbytes)
>>> +{
>>> +       int ret;
>>> +       __le32 val_le = 0;
>>> +
>>> +       ret = regmap_bulk_read(ov2312->regmap, addr, &val_le, nbytes);
>> I've received in the past feedback to use cci_* helpers instead of
>> regmap, see drivers/media/v4l2-core/v4l2-cci.c
>
> Sure, I will use them.
>
>>> +       if (ret < 0) {
>>> +               dev_err(ov2312->dev, "%s: failed to read reg 0x%04x:
>>> %d\n",
>>> +                       __func__, addr, ret);
>>> +               return ret;
>>> +       }
>>> +
>>> +       *val = le32_to_cpu(val_le);
>>> +       return 0;
>>> +}
>>> +
>>> +static int ov2312_write(struct ov2312 *ov2312, u16 addr, u32 val,
>>> size_t nbytes)
>>> +{
>>> +       int ret;
>>> +       __le32 val_le = cpu_to_le32(val);
>>> +
>>> +       ret = regmap_bulk_write(ov2312->regmap, addr, &val_le, nbytes);
>>> +       if (ret < 0)
>>> +               dev_err(ov2312->dev, "%s: failed to write reg 0x%04x:
>>> %d\n",
>>> +                       __func__, addr, ret);
>>> +       return ret;
>>> +}
>>> +
>>> +static int ov2312_write_table(struct ov2312 *ov2312,
>>> +                             const struct reg_sequence *regs,
>>> +                             unsigned int nr_regs)
>>> +{
>>> +       int ret, i;
>>> +
>>> +       for (i = 0; i < nr_regs; i++) {
>>> +               ret = regmap_write(ov2312->regmap, regs[i].reg,
>>> regs[i].def);
>>> +               if (ret < 0) {
>>> +                       dev_err(ov2312->dev,
>>> +                               "%s: failed to write reg[%d] 0x%04x =
>>> 0x%02x (%d)!\n",
>>> +                               __func__, i, regs[i].reg, regs[i].def,
>>> ret);
>>> +                       return ret;
>>> +               }
>>> +       }
>>> +       return 0;
>>> +}
>>> +
>>>
>>>
>>>
>>> + */
>>> +static int ov2312_set_group_a(struct ov2312 *ov2312)
>>> +{
>>> +       u32 ir_exposure = ov2312->exposure_multi->p_new.p_u32[1];
>>> +       u32 ir_again    = ov2312->again_multi->p_new.p_u32[1];
>>> +       u32 ir_dgain    = ov2312->dgain_multi->p_new.p_u32[1];
>>> +       u32 ir_strobe_start = OV2312_VTS - ir_exposure - 7;
>>> +       int ret;
>>> +
>>> +       struct reg_sequence ov2312_groupA[] = {
>>> +               {0x3208, 0x00},/* Group A (IR Dominant VC0) */
>>> +               {OV2312_AEC_PK_EXPO_HI, (ir_exposure >> 8) & 0xff},
>>> +               {OV2312_AEC_PK_EXPO_LO, ir_exposure & 0xff},
>>> +               {OV2312_AEC_PK_AGAIN_HI, (ir_again >> 4) & 0xff},
>>> +               {OV2312_AEC_PK_AGAIN_LO, (ir_again & 0x0f) << 4},
>>> +               {OV2312_AEC_PK_DGAIN_HI, (ir_dgain >> 8) & 0xff},
>>> +               {OV2312_AEC_PK_DGAIN_LO, ir_dgain & 0xff},
>>> +               {0x3920, 0xff},/* IR Strobe duty cycle */
>>> +               {0x3927, (ir_exposure >> 8) & 0xff},
>>> +               {0x3928, ir_exposure & 0xff},
>>> +               {0x3929, (ir_strobe_start >> 8) & 0xff},
>>> +               {0x392a, ir_strobe_start & 0xff},
>>> +               {0x4813, 0x01},/* VC=1. This register takes effect
>>> from next frame */
>>> +               {0x3208, 0x10},
>>> +               {0x320D, 0x00},/* Auto mode switch between group0 and
>>> group1 ;setting to switch */
>>> +               {0x320D, 0x31},
>>> +               {0x3208, 0xA0},
>>> +       };
>>> +
>>> +       ret = regmap_register_patch(ov2312->regmap, ov2312_groupA,
>>> + ARRAY_SIZE(ov2312_groupA));
>>> +       if (ret < 0)
>>> +               dev_err(ov2312->dev,
>>> +                       "%s: failed to apply Group A register patch
>>> (%d)!\n",
>>> +                       __func__, ret);
>>> +       return ret;
>>> +}
>>> +
>>> +static int ov2312_set_group_b(struct ov2312 *ov2312)
>>> +{
>>> +       u32 rgb_exposure = ov2312->exposure_multi->p_new.p_u32[0];
>>> +       u32 rgb_again    = ov2312->again_multi->p_new.p_u32[0];
>>> +       u32 rgb_dgain    = ov2312->dgain_multi->p_new.p_u32[0];
>>> +       int ret;
>>> +
>>> +       struct reg_sequence ov2312_groupB[] = {
>>> +               {0x3208, 0x01},/* Group B (RGB Dominant VC1) */
>>> +               {OV2312_AEC_PK_EXPO_HI, (rgb_exposure >> 8) & 0xff},
>>> +               {OV2312_AEC_PK_EXPO_LO, rgb_exposure & 0xff},
>>> +               {OV2312_AEC_PK_AGAIN_HI, (rgb_again >> 4) & 0xff},
>>> +               {OV2312_AEC_PK_AGAIN_LO, (rgb_again & 0x0f) << 4},
>>> +               {OV2312_AEC_PK_DGAIN_HI, (rgb_dgain >> 8) & 0xff},
>>> +               {OV2312_AEC_PK_DGAIN_LO, rgb_dgain & 0xff},
>>> +               {0x3920, 0x00},
>>> +               {0x4813, 0x00},/* VC=0. This register takes effect
>>> from next frame */
>>> +               {0x3208, 0x11},
>>> +               {0x320D, 0x00},/* Auto mode switch between group0 and
>>> group1 ;setting to switch */
>>> +               {0x320D, 0x30},
>>> +               {0x3208, 0xA0},
>>> +       };
>>> +
>>> +       ret = regmap_register_patch(ov2312->regmap, ov2312_groupB,
>>> + ARRAY_SIZE(ov2312_groupB));
>>> +       if (ret < 0)
>>> +               dev_err(ov2312->dev,
>>> +                       "%s: failed to apply Group B register patch
>>> (%d)!\n",
>>> +                       __func__, ret);
>>> +       return ret;
>>> +}
>>> +
>>> +static int ov2312_set_AB_mode(struct ov2312 *ov2312)
>>> +{
>>> +       bool ir_ready  = ov2312->exposure_multi->p_new.p_u32[1] &&
>>> + ov2312->again_multi->p_new.p_u32[1] &&
>>> + ov2312->dgain_multi->p_new.p_u32[1];
>>> +       bool rgb_ready = ov2312->exposure_multi->p_new.p_u32[0] &&
>>> + ov2312->again_multi->p_new.p_u32[0] &&
>>> + ov2312->dgain_multi->p_new.p_u32[0];
>>> +       int ret;
>>> +
>>> +       if (ir_ready) {
>>> +               ret = ov2312_set_group_a(ov2312);
>>> +               if (ret < 0)
>>> +                       return ret;
>>> +       }
>>> +
>>> +       if (rgb_ready) {
>>> +               ret = ov2312_set_group_b(ov2312);
>>> +               if (ret < 0)
>>> +                       return ret;
>>> +       }
>>> +
>>> +       /* Wait for 1 frame duration after setting AB mode registers */
>>> +       if (ir_ready || rgb_ready)
>>> +               msleep(33);
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static int ov2312_set_orientation(struct ov2312 *ov2312)
>>> +{
>>> +       bool v_flip = ov2312->v_flip->val;
>>> +       bool h_flip = ov2312->h_flip->val;
>>> +       u32 reg = (v_flip ? 0x4400 : 0) | (h_flip ? 0x0004 : 0);
>>> +
>>> +       return ov2312_write(ov2312, OV2312_TIMING_VFLIP,
>>> be16_to_cpu(reg), 2);
>>> +}
>>> +
>>> +static int ov2312_set_ctrl(struct v4l2_ctrl *ctrl)
>>> +{
>>> +       struct ov2312 *ov2312 = container_of(ctrl->handler,
>>> +                                            struct ov2312, ctrls);
>>> +       int ret;
>>> +
>>> +       /*
>>> +        * If the device is not powered up by the host driver do
>>> +        * not apply any controls to H/W at this time. Instead
>>> +        * the controls will be restored right after power-up.
>>> +        */
>>> +       if (pm_runtime_suspended(ov2312->dev))
>>> +               return 0;
>>> +
>>> +       switch (ctrl->id) {
>>> +       case V4L2_CID_EXPOSURE_MULTI:
>>> +       case V4L2_CID_AGAIN_MULTI:
>>> +       case V4L2_CID_DGAIN_MULTI:
>>> +               dev_dbg(ov2312->dev, "debug: %s: %s = [%u, %u]\n",
>>> __func__,
>>> +                               ctrl->name, ctrl->p_new.p_u32[0],
>>> ctrl->p_new.p_u32[1]);
>>> +
>>> +               ret = ov2312_set_AB_mode(ov2312);
>>
>> So, the group hold for A/B context is set right away, when the control
>> arrives.
>>
>> While working with the Omnivision OX05B1S, which is also an RGB-IR
>> sensor, we run into this problem:
>>
>> The normal expected sequence is that the sensor will output alternating
>> frames VC0, VC1, VC0, VC1,...
>>
>> But  when user space tries to do automatic exposure and gain control via
>> v4l2 muti controls, if the driver applies the values immediately, if the
>> virtual channels are not switched within the proper timeframe, it is
>> possible to run into frame duplication (no more nice alternating frames
>> VC0, VC1, VC0, VC1,...but duplicate VC0,VC0 or VC1,VC1).
>> The information we received from the sensor vendor is that group0 update
>> needs to be between 2 group0 launchpoints (similar for group 1). We can
>> use the status register to query the currently active context, and in
>> order to avoid frame duplication we can update each group only when its
>> context is active.
>
> Just to clarify, when you say "update each group only when its context
> is active" you mean when the frame for that group is being captured 
> right?
>
> Lets say group0 is launched, do we need to set the exposure for group0
> before the next group i.e. group1 is launched?
>
> Rishikesh

Yes. For more exact details on the timings required, you may check 
"Context switch (AB mode) group write timeline" here:

https://github.com/nxp-imx/linux-imx/blob/lf-6.18.y/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c#L795 


Group0 update (exp0, vc0) needs to be between group0 launch points (t0), 
but the sensor driver is unaware when the launch points take place, so 
instead, we try to update group 0 in the first half of t0, which we can 
determine by querying the status register for the active context.

Check if your 0x322d register provides information about the active 
group/context.

Maybe it makes sense to do an even more extensive study on the level of 
compatibility on the register set between ox05b1s and OV2312? I am 
wondering if it makes sense for these 2 to share a driver, with a 
compatible for each.


Regards,

Mirela

>
>>
>> This is problematic in the v4l2-api context, it implies that even while
>> streaming, a v4l2 control cannot be committed to sensor registers right
>> away.
>>
>> Even with workarounds in the sensor driver, to defer for later the
>> updates for the inactive context, it is still problematic: defer for how
>> long, and problems with overloaded systems, a stress test can bring us
>> in a broken VC sequence, as there is no atomic way to determine the
>> current active context + update the right group.  A broken VC sequence
>> shows up for example in libcamera as lost frames.
>>
>> Rishikesh, Jai,
>>
>>   did you notice this problem on OV2312? A way to reproduce this is to
>> stress the driver with frequent repeated set controls (for the multi-
>> controls), and observe broken VC sequence (I observed it with libcamera
>> and on the CSI analyzer).
>>
>>
>> Laurent, Hans, Sakari,
>>
>> did you encounter similar situations? Any comments or proposals? The
>> concern here, to summarize, is: v4l2 control cannot be committed to
>> sensor registers right away (even when streaming) and we are also unsure
>> when the right moment to perform the register access may come.
>>
>>
>> Regards,
>>
>> Mirela
>>
>>> +               break;
>>> +
>>> +       case V4L2_CID_HFLIP:
>>> +       case V4L2_CID_VFLIP:
>>> +               ret = ov2312_set_orientation(ov2312);
>>> +               break;
>>> +
>>> +       default:
>>> +               ret = -EINVAL;
>>> +       }
>>> +
>>> +       return ret;
>>> +}
>>> +
>>>
>
