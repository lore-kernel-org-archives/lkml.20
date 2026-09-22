Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011020.outbound.protection.outlook.com [52.101.70.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFDB399019;
	Tue, 22 Sep 2026 02:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044504; cv=fail; b=e1/Qvz4nkPuJYv7WcWdr940lWhf/hEJ5S4CPk935BnfFJsFmQ+Hhan85pH8BZifIPfc9aVl0zOWv7WHQwvuNjDkQlFCKOF3pyeXXlhpVQNUEzAG9ZbH2Fg4V+qkHwPw+Z70fQ5XSJPc7CcWpOGpO5UzQ9ZpVWsZNP8+xeknRAhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044504; c=relaxed/simple;
	bh=eK6wYV1KFtw69hN0kpx2R20Sfh8vZJGwTzGVfWhscmQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cat9CYlYke1Ckoo/Q7Yi+rJUfjI3xj2kxt19RMVWs9TFeYc0x/j4mSIcp3habkiupICmGbhCBcILwTR1kHThh898EFFAU3SzMgI6JUcGLV0zTKe6i98hZ9eR1rUMr8pTcXmeMZXfEUK/1o5MsKtNpBPHK4eq7w0uIZrNVU1BwzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=C7cOF2Zg; arc=fail smtp.client-ip=52.101.70.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="C7cOF2Zg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UiUGoejGoShC4a4pcAPIOluYrF06dQdA35t5c/mZIEVlt4Sa+7xrt55z4gJuVyyCD4QBzoW9RJ1GLIJJbl5Pge2n9Ca5gHjroOfZwoknXx8LuC7c6Unvde3eiPmEOwt5foagA8nhaEtKxXbG+KH82wqq+TLkZz52hB01NSny8OKEdtuxH1msLphbe52FYZATOYReT5eAl3DO+i1TEHrkoMMzadA61mr8jaLbjXELcLLqhQ7Tm2ca7GQI5k8DWxQhH0eGLlgLziiFqJ1p4lG38PIwNPh9n6I94vMvetGwgn36cEg5lXI8hCSiHJ3vgGhkabpaKx2QDfYuiqeqBh/USA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=On81Gk7MIf+urL0sEIuLVOImmIvEYCIV7ayjvbAmWP8=;
 b=gokuhHbIqzf3vK4NBTtAkJMeRf2BKymnrA98aiOI50mE85TJAy0yP8/Otrw8hv6owzV0/APpoqI6mNUim/usz5UrqBl/mBZKKS/dX1aKID9XmH8Q8qHT5/EkMxLY/mtEzWK+KaPlhFh6A9QaTixDTMH9TrERo9yCj6K1uNIqa5Jst/Bx99gX/My97ymwjwRqD8FlGFR44mjaMoy38ecdE2VQPP2aVnUWLFHqeKAGj5nCAtdiswS2vKPFdoFxj6wK5FkRwS6L1b/aQzOZMcfr0jhI/TT08lp9i7WQcZNxILXL5VDM69b/eY6e8P19MmPphfTbSFjF54o3a1gFd1gxkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=On81Gk7MIf+urL0sEIuLVOImmIvEYCIV7ayjvbAmWP8=;
 b=C7cOF2ZgXKAtQ8P0MFbvZWP/l/GLIFply3EIe4/0U6DPE2YjTDLApLP/TETpIJLmsGuvW5TQ3tyf7SNg8xYtC6okauHPO5LNyLgHr6u2Zgpi09Zgym0N2C6eaz0Qj6CIBlXMT4M2ssyYd/C9T0buibXPHqnWfgufsEj9zrhV3QlLt+0tY4xzwduvAtW/B3SpzWov2zBMD4a9ipB6n2RLFd3tnWhBcI5zHQkcXU+B2J8gf71H73Ohvoelge1JKuFJGzX5qjIJXB5BmE4xlsd17T8J14Jog2OIufgDxC6xqgyumKnjVdZ7/SNyynlqlHk+lEXWi6gpqWCTohFZ9Zuyzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by AM7PR04MB6903.eurprd04.prod.outlook.com (2603:10a6:20b:10d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Tue, 22 Sep
 2026 02:34:59 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%3]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 02:34:59 +0000
Message-ID: <ece18c44-3469-46ae-895f-ddc28763494f@oss.nxp.com>
Date: Tue, 22 Sep 2026 10:34:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/21] ASoC: rt5682s: Move mclk acquisition to the i2c
 probe
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Oder Chiou <oder_chiou@realtek.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
 <20260921104640.1941554-13-chancel.liu@oss.nxp.com>
 <efe2712a-a36b-49be-b6cf-1d2e52b836f9@intel.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@oss.nxp.com>
In-Reply-To: <efe2712a-a36b-49be-b6cf-1d2e52b836f9@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:4:195::23) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|AM7PR04MB6903:EE_
X-MS-Office365-Filtering-Correlation-Id: 0954ce16-ba8a-4db2-5256-08df18521894
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|7416014|366016|1800799024|376014|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PGtL+C+gufnzgwr5/iZk9BX4LY444WDY4zmHKpW+ql6vYkE1xnhlW1x9FwSi2S6bAb/FvXUaY34QBCWgrsBBa6Zipt/d4KPBi4Ty7QINnP9t3e8pktL/kUb8GnrOMhrfCHc3AzH3boGj9Skw5psAVct5+xAwLFbEmjqJA+NGOlCmZrVx+Rj3XXSIzfg0F0Hjku2U/cwTdlSinqR5AbfI9pFJgaIQr0DRq7GkZfdvzfUo4KPHbM/oWikos8qJu2E+nhSJjQDtXVAJoR1vHthlZOUodxq+M6nNgCGGiQ4mSKK5Jf9TIGaNdNBRfTPUVwOx6wybMVd4shC5MOH7R1wqFKudMMWeIkaxgTGuAoSpwYbf/RAyjss5sC/z4ndzEXwFPPTz9ogVVr7GcexUlCwQVFzvZi4g4EvPJZyrBHo732RVuT4djMm8Ah+VOSceG/D44fKcfrOxtAnx6/YblV8av4yKMMUcUfuYAcZrZwRKGgpHru4paCEaJxqgG85MxyS2vt3Xk5NCpH1eO1Uu+NwMA5AiQJCUHgfmEHNiXqSFDFK1S8NBeXn4XVNR4NFzKuMSmfxqcykHk5/VHbyT23T0Xl+PABTvPAuNbO8LENiUtBgkGCfmbe4MyCGTNYOdGvvO2ePu2sxV7vqOubZTAeqTcmSBoaX62/pkzXDR01QsFXw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(366016)(1800799024)(376014)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUErRW9rT2dWYVZuOENwRHhHOGIyblhQQm13cFQyM241UDdIQWtkV1c1cHll?=
 =?utf-8?B?djdHYUpyTnFqQzZpaEFJNGh3LzVLSzcwd294MlpnN3QxV0U1a2NuWW5ZMTdI?=
 =?utf-8?B?S2szMU5pOVZ3WTdjSmxSV1J4dk9vU2JOaXozb3hnMGE0M2gwa3dsNUFpWkY0?=
 =?utf-8?B?K1R1MitQSUZaRjN6NVBaa0NLYnhTT1htMjI1RzFXYjlyQWtmL0wzYTd0dmxa?=
 =?utf-8?B?NE5RckhHQnVUSVJDa0hBc1JRSWtNTy8zN2RsV29Fb3Evc2RLY1lMRUdMNDQ0?=
 =?utf-8?B?Nk92WmM0Z3FhQmFPV2FZUXVUVmkycVNaYTNXT2ZrU3h5MnNYZzEycTI1eWJn?=
 =?utf-8?B?K09ScWVPSnJvOVUzY0RTNDR6UVRFaURQa1FsUFpENjUwc2JyQTZNc3pua3lo?=
 =?utf-8?B?UTlEV2RIOExzQ29maHBBZlB0MlJMcTFTdDZEOVBIbmJ6NUVDYWhTNHcrSmRQ?=
 =?utf-8?B?MHhjcXRoK2drYVBUUEZkV2tObFBFWWc2V3NwNlZvQmdySnZiNUtuN3Bubi9G?=
 =?utf-8?B?WGpEYjJKT3hadDc4blEwQ21WamVNZmpHdDU0NVJqZjUxZ1VBM25wc0JJOFZO?=
 =?utf-8?B?S3JNSWdYczlFK01zeEVtbW9sRFVIdTJqTFhwVUNteGlOdDBJYytVY2FiRDFz?=
 =?utf-8?B?dEwvaTVieCtZdkRSclh3VXBmdnZjSy9VZVR0R0luVkoyTkhtcnVvZ2pNeEdP?=
 =?utf-8?B?RWc5OHNuRUVia2xrakw1a1Jtb0JIZHRXeEx6YTZYVUZKaFhzcm1UVzMxNHEx?=
 =?utf-8?B?Tm1relNNVXNsV2RQMUcwRVZ1RmZYQ2lsSDJDVkdjWXVHU0dSWndNcWtrZk5N?=
 =?utf-8?B?NHF5OTZnc0NjeXpJL1FBZWhub28yU04vZWxMWGJGdndvQlRneHFRK2hUc1J2?=
 =?utf-8?B?d1lVU210RXJ0Y3lBbGlnM0R1ZHpnS0FTTVd5RHRHRUtXcmZKQTVuZnk5UG10?=
 =?utf-8?B?UllTbCtrdG9qaTE4VjF5N2lET2RnUG0rRkV3bS8ySldwL1FML2p6Tmw2aHNF?=
 =?utf-8?B?WWpjb0pXQ2xKYmZzYklzdUN0MmZxWG82UzFXMTNBcUVMdGFrT1RFMFVFSWg1?=
 =?utf-8?B?dWtaT3k1S2Jha0dMdnp2WklMZU1KYXlVOXVzU1prbytQSVpSMGlwOGM1VEYw?=
 =?utf-8?B?dS84UkRWd3gwM0lFOHNnSG51Y0dQbktyVkg5QTVuNE1UZVUzVm5NWFo2U0lP?=
 =?utf-8?B?SmhQbG91WHVydWRZeWkwSnI0dDgyZFF5QTJSbVZEOE9nczlTOXU5ZlNwQk9N?=
 =?utf-8?B?eXJKYVBzV3Uzbzhnblp2ZnFYdDhNb0VZa3pkYTdON0lIVFAzbUkyL1p4U2c0?=
 =?utf-8?B?SkZvSDUrblFPY3JTNXdGV1lPL2owUmNGOVdSVm53cXJXTkVSYTVxbDhJNDh6?=
 =?utf-8?B?eUN5YnJaVGtKbEc4Um1hb29aT3hha0FEbG55SkRHR0ZhaGZqanh1Wk42cXIw?=
 =?utf-8?B?MFc1TzhZeHpiVE53RW1vK1pEZGU1WTcvWVZEZS9WaDJMbytOQTByemVnWTl5?=
 =?utf-8?B?ckZ6bmFqaWZjZEtLQ1VIU3A2SUJrS2E2RFE0bjllU05IYm54L29Jd0d5RmV4?=
 =?utf-8?B?Z01BMXk5WjZlQ1hWV0JiN2psd3ljRUJVeXQ3N21jTW1abm1Oa2NYcms0dFpK?=
 =?utf-8?B?b1lHTVBleGtSNFJCcCtRb3N1UERGcUw1Z1l6Zmt6bGFZOUVhMmZiaCs5aHFE?=
 =?utf-8?B?QkFzdVRKWS84Qk9aYVZsS3NiRjJ4b3I1S1J3aEZPQ0w4enhMQUxnTEVNcGs5?=
 =?utf-8?B?VnRMNG1TL3NERjZVSVVnTUNnRHEvRXcraDAwc3JVTHlIR2lXbDBJb0tDQnhZ?=
 =?utf-8?B?Zzg0djZJU1UyQTNTRjZHd1Rpb2NaYXMxejNuV3RCSXB3dWwzMUxmUTN0aG5J?=
 =?utf-8?B?Ri8wWmY2bUc1OXY2cUZodXZDWmhNWmVBbnZOSmE3M1hCUXZ1bU1qMmpBUXJZ?=
 =?utf-8?B?RzlQczhSVzVVangzT08xMUxkL1B1UmlML0pabmhqSFNzek4zTWxVTDRGUzdx?=
 =?utf-8?B?SXVqTDNZOEpFc0hWY3l6VkJEMStnV3NVbVIzOHM1ODNSNkpiTkl0QUdBVEky?=
 =?utf-8?B?Z3ZIeEJzSVl5WXBKSSs5RkltTHhyZzU2cnlzdGIxYW1hajRCc3VHc2UwdUo4?=
 =?utf-8?B?WnRVZXFjRXZTSEFZR3M0QnF3OG9zSXA4OUdvMDQ4dThnTDE1Y3QzQkVsVWxx?=
 =?utf-8?B?OU93TzZPU1hoc3p0a1pnaEMxekgreWlNcjlWZGkwWmdxMGU0T25NMzlJR1N6?=
 =?utf-8?B?bElFc0tIbGpGUnZ1dDNjQm5MajlnZjBDdUxVcmtXNjhZMkQxOHdvRUFuUUMv?=
 =?utf-8?B?T1BCV2lSZmhINHBKNzlvSWpIU1JvTnl1TCtaanZScDdkeEZ4enkrQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0954ce16-ba8a-4db2-5256-08df18521894
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 02:34:59.1739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0IP6g+asAnXWiQptzeA+Q2aM+jxFNMOWhofx3aZyHc3X60BCkX4LypYV6b47AOX/l+/wJHw6Jm8u6j2MJ9YX1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6903

On 9/22/2026 2:44 AM, Cezary Rojewski wrote:
> On 9/21/2026 12:46 PM, Chancel Liu wrote:
>> From: Chancel Liu <chancel.liu@nxp.com>
>>
>> component->dev is the underlying i2c device whose devres is only
>> released on physical device removal, not on ASoC card unbind.  Getting
>> the codec clock with devm_clk_get_optional(component->dev, ...) in the
>> component probe chain therefore leaks a clk reference on every card
>> bind/unbind cycle.
>>
>> Move the devm_clk_get_optional() to rt5682s_i2c_probe() so the clk
>> reference is tied to the physical device lifetime.
>>
>> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> 
> Nitpick: Same as with rt5640 (and TBH all the patches here), updating
> the title so it starts "ASoC: codecs: (...)" would be appreciated. Alone
> not a reason for resend.
> 
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

Many thanks for your review. I'll improve it in the next revision.

Regards,
Chancel Liu

