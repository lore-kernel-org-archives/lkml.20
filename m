Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazolkn19011036.outbound.protection.outlook.com [52.103.43.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4BE379EC8;
	Wed, 26 Aug 2026 17:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787765424; cv=fail; b=tst6cd3rWl9We+C7bnvN8yw3Giqwyp6wYcopJxQAK5K/o3VPaSM08xn2CWPq4phETe2JL3HpJrql7DXYkv5pQALGGb+RxRimjBCrAhyF+NR+pCOW1kz+1JtTdrGuLSn1Lmrou93TUCWQs69WPG+SEw5rFEinIJoE4l/PujVRCgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787765424; c=relaxed/simple;
	bh=p417mZmEK+lSVQnEtujYR5CbTbMCct1zI1M+EqfSR5k=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C+Ps6cDdk469i9x9m6vzpHlzzqgS1QPEUoky3jwweXItKB4gesbSO0JXpISTxJGtXI1Rv928B0/w/uxSElfl35dwT8D5hARJ0ozLGVo++RT8i/Wsw5+r4mfVNznOPsWHnxP3NJq3agRkIbOQCa134bu2KoB1TIK7P4JjNdxHjb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=uTne+xeo; arc=fail smtp.client-ip=52.103.43.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="uTne+xeo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdjQdrsYIKPlSMmbub1zX7D4czXnVDltCtYXsmZirI4BcjYFWdbyfn8mKOj1EDWSVZ6WjtHgzXHndMQKNcZRQO4LcKbp5pNLzFEgTHGEsyR31j0weVQ4i9jcOJ0USznRSS/aDNVPdNgXH3y8xCnIspV+aXEDEO19E0frqTHMy7S3bBI+TUlzQT+6QnChGn2w6PePppKrrpWp12/9cQaXr3kpqbk9QjeydjsDNqmtLvQLq6NsgSIcoscNW0ZIaDrkD/dfAhrKnep7TqdbKuZ4AVriFuWG2AL/Lc9lB+93ZtF3ZeY/nEYqgpTUPoNf6La4koNJk/yZORU02NNw0v3w0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+HVJRZuZ4JJi4s4JB4B4C2p52UiZfPiuIWSfkE5gDY=;
 b=xRzhIRMRVXSVFCCALuRgE+t8odsNUviogatrC35wMs0aJrN0gu7zi2N3UyMEXkREx/YhwdI13dHwD8//Ogb2oC4G29CBlYB+LRO4ROEmo6jQyWAhqgTG8m7TdlatdoGfwlJD5Rkvlbsikt7QVnM/iFAuqmPRR9T1Ul9+M/LY/l6SyElfeXGq9mYfZNhECKvyPrBcjJEGvxVqGxZFWuzpbKp0ycjdTmk22ftjt8B8Ew5IX/PPkdPqsgCiWtYplYITIV/ai+dkiAgXVsnATZig02xoyQ2YwSthIpQiuCP+rO7j/Adaa8a+a2mMTddKNddAjJ+k9jUNZRabZssMbUPifA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+HVJRZuZ4JJi4s4JB4B4C2p52UiZfPiuIWSfkE5gDY=;
 b=uTne+xeoNFRuv35CfDEsxUes9ZY7kl8PyCP/KTOgdeMaGPsVinAF9d23TJq+mJUvN+V1AzRJggh+X6qh6BD01RcRhok19QsSEsQHyHumim3nx/2fOYq6ZJnlZehOqJDHw571+0/j8aUYfDFDHfN96CRvtKNq0H/VBKX8fytfHW67ulb5AIIRyWJWtzI64Ublb8LnLH5t/A+i4n0hClJLmtjwaOpMtP5er2kO4ngiCV1t8Ha0aqbKysImtGaNSXyVTjMd7mRrrXRDontHMf2XJddnTJldhE/8qm5HXjceLJ6daeAzHFLlGAygcqtuhbd1ar92/J2MKgsLmAsRAbOOUw==
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10) by TY4PR01MB14223.jpnprd01.prod.outlook.com
 (2603:1096:405:20d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 26 Aug
 2026 17:29:59 +0000
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::de2b:6c81:9bd7:99c2]) by TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::de2b:6c81:9bd7:99c2%6]) with mapi id 15.21.0360.008; Wed, 26 Aug 2026
 17:29:59 +0000
Message-ID:
 <TY4PR01MB14432A17F4A7E2071D182C42298AE2@TY4PR01MB14432.jpnprd01.prod.outlook.com>
Date: Thu, 27 Aug 2026 01:29:48 +0800
User-Agent: Mozilla Thunderbird
Cc: wiagn233@outlook.com, Vijendar.Mukunda@amd.com,
 venkataprasad.potturu@amd.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Syed.SabaKareem@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: amd: acp-config: add quirk for more ASUS FA401EA
 variants
To: Mark Brown <broonie@kernel.org>, Shengyu Qu <wiagn@4d2.org>
References: <20260826094209.29299-1-wiagn@4d2.org>
 <358dac57-4c5c-453a-a82f-41258e664be6@sirena.org.uk>
Content-Language: en-US
From: Shengyu Qu <wiagn233@outlook.com>
In-Reply-To: <358dac57-4c5c-453a-a82f-41258e664be6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2P216CA0184.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::8) To TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10)
X-Microsoft-Original-Message-ID:
 <ef3f4005-7a67-45c8-9016-01558a7042fd@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY4PR01MB14432:EE_|TY4PR01MB14223:EE_
X-MS-Office365-Filtering-Correlation-Id: f679a011-48ec-48c0-bdd4-08df0397a771
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|22141099003|39105399006|23021999003|8060799015|19110799012|15080799012|24021099003|5072599009|6090799003|4140399003|25010399006|40105399003|1602099012|10035399007|2607281247196008|440099028|3412199025|26104999009|4302099013|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWVVbk1ERkN5Mm9XQ0dNSGVDYmJuU0FTNFRoRzFST2lIN0JjaEY2TU5BT094?=
 =?utf-8?B?N2N3WjBaUklxbC9uT3RHRUQrQ2lhaXBOeUNLVjNsT0luRUhDQTNtVlp1M3dr?=
 =?utf-8?B?NVdnL2s0cnN3dm1Mb1VmRzJURVgrWnk3OGdNTDNNcVhoR3VtYk9QMzQzdW5a?=
 =?utf-8?B?ZWJieFZPdzlvOGo3UnFGMHFVYVl2Mk1Gd3lPTnFpKzhNNExvT2RKNm5hRzdJ?=
 =?utf-8?B?VFl2ZE5WbTdCWnMwL29oSEQvaTloZXZENWJ0MzllbUo4MStiM0RhMkhxWTQw?=
 =?utf-8?B?WmtDeXM5Z3p5amV5OWVvS2dxNTFTb09PMjFuNmpBR2FnVW9Ra2l3cURpZE1Q?=
 =?utf-8?B?a0UzSDlpVzlyZ0gvQnBLeThuL0E1YjhYdUNXa3JvcTZnYmxocmpiM0E1Q0E0?=
 =?utf-8?B?WmMzd2l2bytyVk9FRWRRMHZQc1UzU09pZmYxSVpBUkoraDFDcDgrQmVQN1Q2?=
 =?utf-8?B?TU9MNEFXY2NuSHlCTTVUMVJpRklONVNpb25VRnNya0YxbjNmQzVwQVkrQ0Js?=
 =?utf-8?B?Z1BXWlB6Y21xdXFqVDJoVEg2MHdreDZZRW5IdU5KeVZoZFltbFRkbGJFeWdY?=
 =?utf-8?B?amhsOVVHdDZ5ZTNnNTJ0NHhBNE9FVk96THA4RVJrTlcwNEYwWFp6cy9QK2pB?=
 =?utf-8?B?eWpXa3VveTd5bmtjeHhhVjFRZHM0SGtOL1c0R1B4K2tvSkc0Z3ZacUVXcExG?=
 =?utf-8?B?WjNtNCtPTzNxeEVDQVhWb2ZraEFqbGN0MGJDSm1CdlFoL0J2VWo0N2lERXhM?=
 =?utf-8?B?em5wUS9CeTdzM3d0U20wdnkxMVN4SFA3NjR4UFZOQW5RcGZGc0ZBN2VoQmtF?=
 =?utf-8?B?cjBhQWpKeXp6dENMam9ZSGx4bHYwalhGVThSd2FhQ1RjWWZWYjRGUk9nVkpM?=
 =?utf-8?B?UkJDQlZpYzAxY2h4VnZVMUl1RG8wWWVPQ1BXcmRwVURkbkNkWVJ6WGFEeHdO?=
 =?utf-8?B?eWoxMDBBMDRuN0F0WGg5ZFcyNmttVm1OakxZdDlkYW9QTStIOU9hdzNyM0da?=
 =?utf-8?B?TTdoakcvMzhYY0h2aDVuTHlWSW8zNVhubXpJQk93SG83ODE0TDlXZ0tUdWN5?=
 =?utf-8?B?MGtKOHVUU2NpaXRHNVRBaFNqTVlndmZyZUhrcUVrSU01TUtBam8reWluUWls?=
 =?utf-8?B?cnE3WVRIdmg4WW5UaWJHWmVvdmN3YytJWjVUV3hCazdDUm1RWU9rV3Y1cEFX?=
 =?utf-8?B?Qjc2RndYWkczNWl0WEhqZkNkRFM2RTVwbUdURmNlOGhpWXVtU1pVYkxEOEdt?=
 =?utf-8?B?a3lqSG5rV2t6Y09jdWwyNXFMUjFjRXlDSUIzQUpkLzR5UC9uZjYyQkpLZTZV?=
 =?utf-8?B?dW9Gc2pUMU43a2JSeC8ybjVqbURqa1p5SWhGL0RtTFY5bzBVN0hHU3duRkxn?=
 =?utf-8?B?VHNjdUtwODVIdEhXeHVhRGUxL0NMUkNXYXpaTUtGbHJjRi92K2NZVG9RWGJy?=
 =?utf-8?B?SXVZL01kKzhZblphQXJjUUlnMG1TbXhuMWtiNGtXdWlpOXZGWnNvYWNOSklk?=
 =?utf-8?Q?4TC/kInUF0oyNrmw/J8eKZ5OMRS?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VExweXMxUzZaS0hsQ3I0TG9ZSzlyNTB4bmVqamwxSy9KTXlZb2Y5aTQ5YkFT?=
 =?utf-8?B?SEcvS2U0WUlUNTlIU0hmemY4WkEzSUo3b1JaQVZOcEwrWVUxZWNBS2VjeDV6?=
 =?utf-8?B?Yk1pdWRvUkZ1MTR6VGZ3cDlKLzZCUGZLT0N3TXlVdkhlRTJUOHBwd1ZlR3k3?=
 =?utf-8?B?cWg4d2RSajc3UzVvWDZlOWF3VG0xd015QmJ5cktMUlkwaWZ2VkdyYkdmQ2pp?=
 =?utf-8?B?T0dZMVozUUZrbi9nU0ZkK0xwYkZNd01WU0lPQ2Z1UmpFeStzY2FQUnVnK2Vy?=
 =?utf-8?B?WVBPYzUrWWc1aFlneXFpM0tvRDhpamZQZzZEOHUwelkyR3FCV1Y1YTQ3RFRk?=
 =?utf-8?B?WDJCZC90QWhxQU9HVnNsTjFqVC9lVzBOVnVXZHMyUzNVRERKNnBlREFsODRD?=
 =?utf-8?B?YU16RHViaHpRS1FRbnRtbWlaNzRGUnRpYzBYZ3E0U1ZhR29FNkprZHA3TGNI?=
 =?utf-8?B?Ni9NYVJDYTZPUlNoZHl3alpqbkJNZFFEUHFOYTJjRCtIdHM0KzFkRURIc09v?=
 =?utf-8?B?QXprWVBSQjJzbjZJUEY0R0VkN3d2VTMwLzdtNXVDMTA2djQ4blRoak9NaTR0?=
 =?utf-8?B?eVloMDhvYmwwc3UyTlVWRXdOUTFZZVdJMngrWkRGVjBEaElnMmxLL2YyTjVr?=
 =?utf-8?B?WU5kcnZ3bGFlVDNSQTNJOFBWMW1QREI3UTcwZ1dVaVNDaUExQWhFdnJ4L01B?=
 =?utf-8?B?ZGEwZ01XVGdQLzFSS0RZZEd0WFVyS3ZZbjRNQVFjTy81QVVUWkQ1RGRnZDFW?=
 =?utf-8?B?ZStlTWRaQ0F4UkM5V1hoNGtIOFJCNFlIVkZQKzNUank3K1hrR3dzZUVvNUZa?=
 =?utf-8?B?QkdIcFBvNW5HcUVGUW5jOWZJdWIvenkwUzJWSkxGSTYrcm9pdmdXQ1FvMjNH?=
 =?utf-8?B?ZmtMK1Y0SkRHck9wbzh1aXIxSWV2RGlzNVhrQVlITHp3SHQ5Wmk0MzRteWMy?=
 =?utf-8?B?VWxHRXNlVGdIeFJoMkxoZzZHZlNvVGlPaG1LeTR5eW5WSEFFTHl5ZjRyblZM?=
 =?utf-8?B?WE1MQTdZNCtDT2pURWRmN3NnYTBjNkNxODZxR1dVbkFwTmd0WXcrVXdWNC8z?=
 =?utf-8?B?TElCSWkzQkhkUGlpeXh5cndBNUYyRkVralR5WjYrWmhCS2lhRGoxWE1qUE5N?=
 =?utf-8?B?bkx6MThYSVlyUGxab1ZmUGhvREMrVldSNThPV2ZocFdsZmJNVVhoL2tiZUxO?=
 =?utf-8?B?RzUvbW5FSGRnaUdhM1d1K25iTjQrNUtHcDVOM3NiR0c4THVRLzkrUHdYVDBY?=
 =?utf-8?B?OG44RjNBa2djcEx3Qi9BMDFpaUdxK09zUktpcUlvbHc3S2w5TXQ1bldmcGJm?=
 =?utf-8?B?ZHR5WHp0R3l6RmxDWU14aVRlaUhkUzFac1BMaWQrZjkydEJhZHorZ1AzSWlM?=
 =?utf-8?B?UTdzQUN3bDRBTWJYZ3VHcCtYeElFREhWeFIxNGc1VmZpV0g4aGZjUG10aEJJ?=
 =?utf-8?B?dTJrVzlQazFxR3pWZHR1M3BCL08vVk4wd0xPMjI1YjdHWk5jTDduemFMNGQv?=
 =?utf-8?B?eW4xZGRKRmRkTXNSVW55SlFNVFJnbU1QcTAzUnZmUzlVMlAwcDNsc3BYenNs?=
 =?utf-8?B?RW5IWW1lUlBHNk5XdDkxdXhRQjcxQ3B0VUducHJKblNaTlZRMlNNQ1kyRVJu?=
 =?utf-8?B?bzJkZkNBTjZ2RUJiSkdCbTVWeFVyS1BNQXBsTFVXZFNZS3g0Y2NvUGl1R0dK?=
 =?utf-8?B?OEJWTmxCblVzeE5oM2o5ZHl1d3oveUJZOW9Lc0JwUmJlV21ITTd3SGZYYkRV?=
 =?utf-8?B?WVB1TW1DSlZMOWJxSmVwWGZjdVBRaDFsekllUE9yMjB0b2c0MFhDblRoNnBJ?=
 =?utf-8?B?NHZqL2xDbXZYdVV5R3RvK280aWFYdll2WkVUb2NNM3dUbXNQT214NVpnbkFh?=
 =?utf-8?B?a0IxeERNdmtmTEh3OFl2SDRrQklXQzdMRFBxVmptQ2s4Q1ZmWFBVcDFRSTI0?=
 =?utf-8?Q?cb3M3SsqwWdDU1VIApQq+z6BmCp9tZpY?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f679a011-48ec-48c0-bdd4-08df0397a771
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14432.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 17:29:59.7082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14223

Hi Mark,

I've tested your advice and it works well. It should cover all variants.

V2 already sent:
https://lore.kernel.org/all/20260826172050.15686-1-wiagn@4d2.org/

Best regards,
Shengyu

在 2026/8/26 22:24, Mark Brown 写道:
> On Wed, Aug 26, 2026 at 05:42:09PM +0800, Shengyu Qu wrote:
>> Existing quirks doesn't cover all known exising FA401EA devices, so add
>> more quirk items to cover them.
> 
>> +	{
>> +		.matches = {
>> +			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "FA401EA"),
>> +		},
>> +	},
>>   	{
>>   		.matches = {
>>   			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC"),
>>   			DMI_MATCH(DMI_PRODUCT_NAME, "TUF Gaming A14 FA401EA"),
>>   		},
>>   	},
>> +	{
>> +		.matches = {
>> +			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "TX Air FA401EA"),
>> +		},
>> +	},
> 
> Do we need all these entries, DMI matches use substr() so I'd expect the
> first entry to match on all the machines that the other two matches,
> unless I'm misunderstanding somehow?

