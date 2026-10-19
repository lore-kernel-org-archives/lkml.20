Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013027.outbound.protection.outlook.com [40.107.201.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA183CB56C;
	Mon, 19 Oct 2026 05:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792388369; cv=fail; b=gZQfyj+/jgV1nKs8VudfAqfMpr+OBKq4FsXflkmqbLR3pfl0B0YPpaN1Tkclp96eDe9f/C1TYdZcsOXA0ac0YCLAmC50sTCpClyG5OPaZIez3AYaAeuj/FszkuleGctN2EKwK2B1lazluqWfrWs59znpmw9/gA3oVy2cf+PN3FI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792388369; c=relaxed/simple;
	bh=udgpnaN8cVSiXu4oZhM+BfbJqiuaknrvJcb+xikqqQ8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tU96Wpm5rdtpC9zq/u9gEOrIrjBJ/cbpEucD8iiZOOcDylfMf+0FdvM8Efo0m+KTbsTN8GUfjnF+a5ztea/v7TcXlJUHKUIatf7y2ttkND+NhvwZVtYT7912OGN6eFUg+lYiJzujIAcBONl6tUUF8xqyGga3eDd7ljfouD0rd3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BuOUdyhK; arc=fail smtp.client-ip=40.107.201.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BuOUdyhK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZrF8Ey/8pm8EddP/4TOlZO4VwTXriOnBoNC0y9eXS7nuoSP+wZkBK+lx1pqNVglOuP/Z2vDS8OGArMqJuCt6jlFa9QeRa9wqXFpkFwYHrwoMzRF3Ua8kwPC531OCs+2y5oxsbRcaLnxBTUAzhNBrw4OCYmfxdczI9bXKYr1ILUgL4wvfn5+9OfZGE34uDl439SXXE3LQlIE2/TQSEGDkiNT7sjxF648zm1zFPoS1Pet/v8mRhG7gwLrLBttXZSS94W+Gf97+aTF1lryNW8284JLtNOwAOpaBxe/wPZdcWjTOeqkho/lONK6ePTYywLCe3GY6Sszmbv3YGwxrNUUBMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16SQiWS/mChqqfPa/4JB+QomD5m7RiEdR3SXxEVJ7Rw=;
 b=qlSKQ4mY1cbpYfHtcTFwAJ7Sc/m9+AHftKHNMcE7f9lJtqt1sP/oD6LEks9qP+XB1ZnOYjfpL8Rup8Dhz/qrwVmMgJEyewzrSk2ColOqgKWU6OdL36v6sFVsv5vKLSSNUy1B+lL3ulHvl7xsx7bnGNMEZnbBJ4FmJH88CesxjH96cwjha6K7TgwcSb4psdFD79PscH+K8IlvpLng2AuDJHdTiV0JFpYkac72/i6YySMobaYn2ribYdgy/MXekBud8jq259VW4wypll0hNs9LyJra31HfsRcvi0lMt9hPa1cg3bJTkUT43OOtqfMTuKR+80Tzt9RO/kFIZa1b+lW1Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16SQiWS/mChqqfPa/4JB+QomD5m7RiEdR3SXxEVJ7Rw=;
 b=BuOUdyhK34XQzJxRfh6B8sdQPmdejELObXbmLPOZIJHAhb7NkRyK+80uT4kzYSyYssiM1FM0xikbRbiMDr+q2QHyg28oGcWzdV+psJd02a8XVzvvJHYR6WJsAmeZB9S2EC6pn+ClbC9OPdJxmqDF2muMpckb+zF+7ODll1LY2I4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 SN7PR12MB6742.namprd12.prod.outlook.com (2603:10b6:806:26e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 05:39:24 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 05:39:24 +0000
Message-ID: <3a459fa9-9033-4ca7-873a-0fa433f94b8b@amd.com>
Date: Mon, 19 Oct 2026 11:11:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] ASoC: amd: acp: add ACP70 SoundWire machine entry for
 ASUS RC74XA
Content-Language: en-US
To: Matthew Schwartz <matthew.schwartz@linux.dev>, broonie@kernel.org
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261016232416.2628603-1-matthew.schwartz@linux.dev>
 <20261016232416.2628603-3-matthew.schwartz@linux.dev>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20261016232416.2628603-3-matthew.schwartz@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::13) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|SN7PR12MB6742:EE_
X-MS-Office365-Filtering-Correlation-Id: e246b9d9-128e-4227-b286-08df2da354f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|260925022911599003|260925021911599003|260925021311599003|261009223027099003|10067099003|56012099006|6133799003|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	8WJIGttov83GPGzale56CruL/7qtYGLbbRJYlEZWC5cC8z2ifSjn6aUnpXKCxLiISGiKGhwNXfyGN/7+DitoUDBc00y9mjwsJq/XajZPwc6awXDJbWUB5n9P7NzmKwyEfHELqnSHtVCsBrD6gmWhEZrMGUu/Kw3Qgj+alje+dAjp/gEwZuXrUGhPTDYgOyUnUoSMd4HNE2FEZhwI2wROnbNyxGkKizKqfKmKaFHkDS/GE6ld1Lcn25h0oPWaNOy+dNErT0TjicX5vpiZDuuk4ttlPCBxWgZcTSzvBilSZzvS9ZUootVeyBtbO5Y00uV64oD1LyhZEiJFHNFxx2pov0UvkNSH+VMPh3/ZdF1/IqgjrvrJy/jKSQ/fYNq6FhjhX5O1ai2Obk+S/dOiZJOl4BHqHXE/708qhPmYmq/IL8ZzUorfPPp+qr9K/hFvK8OHDxbiy/M+NGg/Ubv+fNcrzhfp4e8RWa4bjsT+ybMRJiQo8D8gK5s+vtkeooO4kxOEbH+Rs0W8wjgp5EgKKAvN4FmBKG2syggVSV7rH6ChKLV5RQqu4sdgWZiaoU+wxpBdUr458SG22xRr4Ua4BVqnKdxdlIOVW5EhgUuWpQxFTehsHWMxbLF3EJ66/uqgqqXVzjqp5x05nv9TULfkgZblVfXQHPfeAtBa2m5DsrpiHbg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(260925022911599003)(260925021911599003)(260925021311599003)(261009223027099003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHR6SWpOUEFuTm5QUTJUOFAxczN1YUgyQXluTkJ2SUZjR1o4b2o4eERjYzNS?=
 =?utf-8?B?ZFAzdnlWY09NTDdvWHBLWnFFN1gzYTRUcjgwOEcwN3pNOEU3WkhVOWp6WmlL?=
 =?utf-8?B?QnAyTG95UlUvb3duTWtGKzBvUTBlSTRORjlNN2FQaXR6bEFYQlJhMUFvRlBE?=
 =?utf-8?B?RjM4bE5rMGZzc05WLzZzUmJCNGcvY0pNNXdlaHpEUnFpTkx1N0pjQTFRMFcv?=
 =?utf-8?B?VTRsaFlTUnM5V3k0ajJTWkI3UFVBUWtyNFY3L0c2cTNXUzA4NDEwQ1VtMURs?=
 =?utf-8?B?b0YxYjh2T2dRZUhNR2ZTMlE4azU4Zklhb05ybDhRMXBVblBVYzNCODVPQlc3?=
 =?utf-8?B?ZzJHNEFGbktzaGZCSzZYSWo4N2Y3RkM2Z3hsN3ZUenZvRFlmUGRsT2piWjNJ?=
 =?utf-8?B?enFsWEphTDQvQVozRnFuc2g5bk43WlVnbytKd0dGSGo2cVJXd2xkY1pQMDZ3?=
 =?utf-8?B?aHEvemErRFdIWm0vWEw2WUc3NFlQZEZjTjh1VUc1QzNjeEU1dlYvSzc3dThZ?=
 =?utf-8?B?dWM5STRtRlM5dXhLSktScldnTWkyYTZCd21qVGRISHJDdUQvaHRTc0Qxa1Mx?=
 =?utf-8?B?REhBbFp2WVlEb1cvdUFDZGlId2o4NlcwVzllL1dhb2VlNDgrRGVnc1ozQ1JP?=
 =?utf-8?B?ZE93cFNKbVVxU1Rra0FmOUVyOEFTSDlzMnVOTDcrK2ltdndjMGJxLzdEalgz?=
 =?utf-8?B?d3FvakM5UUNoam9Sd0d3eTdreEF6YlRqRDJ5S3FNTlRsNGNERmJIYnJsNEVh?=
 =?utf-8?B?YTZNa3k0aGVIQ2RPUFNDblN3S2d0a0I4eWhuZk5GbjQxKzA0RmlaZCttQmth?=
 =?utf-8?B?Smd4ckJmR1dtVUcxNGJIRk56dGVhYklQTFdJRkQ5ZmxVTGtxVkR2dDdiNmFZ?=
 =?utf-8?B?OTg5WmFTTnA5UjBPalpJSFpYSENSK3l0SkxXdDlXR0RBRVJrbzFHRnAwekhs?=
 =?utf-8?B?THhUUm1SRVFBNndUQjdwL3pGWjltTzFGYU9jNGQ1UFdiR3BVN3Jlay9NcUFp?=
 =?utf-8?B?eC9qb0Zlc2piLzhpV3hxODRhN3p3ZnFKZkJGeVVDR3Zwa2RCNHAyS0pJdWMx?=
 =?utf-8?B?S2hRaGZDYWNXbmg2Q1h4dFQwUWtpK05Gdnhib1dlMWJlL3VBeTV1RWVHejNK?=
 =?utf-8?B?TEV3dVptRmFYQzBGTDZFc0Uwa2hXOU01NVVDVmNmWG5pbXJYUjJEMjArdDV3?=
 =?utf-8?B?SlNBY25Gc25ka1luajZSL0ZFdWN1WHFpWUsrajBxeG5hTUVvMkJtSG5QVW5D?=
 =?utf-8?B?NVlSS0JSQlQ2d0U0SXRpN2hoTWttQXR2R2lmZE9wZkhNdVdhODM4YldNWUJB?=
 =?utf-8?B?TEhFcUl5YU04ekZUVDNTT21kbVhoUkZuTnJGTzJwb0xvMzhhb1BvYVNIbEtW?=
 =?utf-8?B?RFhVbUdVdFhaZVNGRnJyU0RZQ0xybEJZdmJYeGpYZGRHUzZyeEc1bzRjZEN5?=
 =?utf-8?B?TnBWeUIyM3UwVFY4VllQVmc5MVhrSWxpeVRaSGZTaEJNdzFzTUpnNnlpQlRV?=
 =?utf-8?B?ZXRNVkdqTUoxb0d5ckxWbklNK05JaGhRMlczV2ZjaGlNazA2WXRHTHFLR2cv?=
 =?utf-8?B?YURCaDZMOWVzSE5IOGFKcEUxRUh3T3RpZlV1eUdkUGxwMXpTZWVOdkx0ZGpw?=
 =?utf-8?B?NjNZQTAzSEZWcTVoU0FqcXVUbTdiWE9uemtWekI1RzdGbmJQb3Ztaml2aWh5?=
 =?utf-8?B?ZEJlT0NHMXdhNTA0Ym5JN2VqQ3BpejV3TEYrKyt4a25IUW1aK0k5U2R4U254?=
 =?utf-8?B?Ym4yS2ZFSEhNYXl3bW80TkJSNlVOUys1KzRySmovZGx2TXhKUXFEYUo1VmFx?=
 =?utf-8?B?eHNweExib2t3c3dUN3BiQU84YzcrczZ4MjdnZjZCOE91Q0dlRkVPcTc0TERF?=
 =?utf-8?B?TW1ZN0wxTDkxRy9tK3l1RmdJZGUwVWtKcy9IdWJaS3JZQk5yM3B3bFZsKzlh?=
 =?utf-8?B?MDZxS0xVbTd1SzYvcDJ2S1p4SUVZN2ZqNnp0SG1vZlhhRWhZdVdVb2dqRDJq?=
 =?utf-8?B?R2NTZVl0SFdPSUtnUlhNOE03OXdSRWpQTU9qZzQwRzErNTBLR3FJTTNZWTAw?=
 =?utf-8?B?b3YxWFpINU51Ymx0V2lRbmt6WVY0Q3h4a0gweE1KRHkzb1IxR0hiUGZ2eEhK?=
 =?utf-8?B?UldKMEwxNEhQc0hLWHRxSVZqYjBWQm04UkFXcHZZbGs1bGxHTDRQeDlHYkxa?=
 =?utf-8?B?UUFBek1MSC9UWG5MNU5paytnUSszaU9PYUdyUHQwRnViL3hQZkYyRUY4Y01V?=
 =?utf-8?B?S0xOWXNFZ3RSRzA0WmN0dlFMbHFlemVCM1RBZ0M4NlZmek1xbEdkRjAzRVN5?=
 =?utf-8?B?UTNOSlpOZXRIU3NmZXhac2NYV0RUVXVPamRqalZIWDRFRnNvSGEwUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e246b9d9-128e-4227-b286-08df2da354f8
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 05:39:24.1328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P0Nk4gK8bjyB8ir7t06k2uUJCHBJ20Nq2R4c8hYOUfWKwBE8+vUtt2EKGRm8vzW+4V48eWT+jY1XguxqXddHTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6742

On 17/10/26 04:54, Matthew Schwartz wrote:
> The ROG Xbox Ally X20 (RC74XA) has two TAS2783 amps on link 0 with
> unique IDs 0x8 and 0xB and an RT721 on link 1. No table entry describes
> that layout, so machine selection falls through to acp70_rt721_only and
> routes speaker playback to the unused RT721 amp endpoint.
>
> Add a two-link entry ahead of acp70_rt721_only with the RT721 limited
> to its jack and DMIC endpoints.
>
> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>

Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  sound/soc/amd/acp/amd-acp70-acpi-match.c | 44 ++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/amd-acp70-acpi-match.c
> index c2f0479301ebd..0c1a7a70ce146 100644
> --- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
> +++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
> @@ -739,6 +739,45 @@ static const struct snd_soc_acpi_link_adr acp70_tas2783x2_l0u9c_rt712_vb_l1u0[]
>  	{}
>  };
>  
> +static const struct snd_soc_acpi_adr_device tas2783x2_l0u8b_adr[] = {
> +	{
> +		.adr = 0x0000380102000001ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_l_endpoint,
> +		.name_prefix = "tas2783-1",
> +	},
> +	{
> +		.adr = 0x00003B0102000001ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_r_endpoint,
> +		.name_prefix = "tas2783-2",
> +	},
> +};
> +
> +static const struct snd_soc_acpi_adr_device rt721_l1u0_jack_dmic_adr[] = {
> +	{
> +		.adr = 0x000130025D072101ull,
> +		.num_endpoints = ARRAY_SIZE(jack_dmic_endpoints),
> +		.endpoints = jack_dmic_endpoints,
> +		.name_prefix = "rt721",
> +	}
> +};
> +
> +/* ASUS ROG Xbox Ally X20 (RC74XA) */
> +static const struct snd_soc_acpi_link_adr acp70_tas2783x2_l0u8b_rt721_l1u0[] = {
> +	{
> +		.mask = BIT(0),
> +		.num_adr = ARRAY_SIZE(tas2783x2_l0u8b_adr),
> +		.adr_d = tas2783x2_l0u8b_adr,
> +	},
> +	{
> +		.mask = BIT(1),
> +		.num_adr = ARRAY_SIZE(rt721_l1u0_jack_dmic_adr),
> +		.adr_d = rt721_l1u0_jack_dmic_adr,
> +	},
> +	{}
> +};
> +
>  static const struct snd_soc_acpi_endpoint rt721_endpoints[] = {
>  	{ /* Jack Playback/Capture Endpoint (AIF1) */
>  		.num = 0,
> @@ -906,6 +945,11 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
>  		.links = acp70_rt721_l1u0_tas2783x2_l1u8b,
>  		.drv_name = "amd_sdw",
>  	},
> +	{
> +		.link_mask = BIT(0) | BIT(1),
> +		.links = acp70_tas2783x2_l0u8b_rt721_l1u0,
> +		.drv_name = "amd_sdw",
> +	},
>  	{
>  		.link_mask = BIT(1),
>  		.links = acp70_rt721_only,

