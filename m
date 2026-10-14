Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011031.outbound.protection.outlook.com [40.93.194.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4260A4DD3B0;
	Wed, 14 Oct 2026 12:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979715; cv=fail; b=aKrWCK2w5/IPuzCoMMW7H6yBc7zNvrd7xwxBlVd+yHQozdUSx6wQ6zmGxsqfqvylFVCWEW1hj+Y6e8xjZY17jlLxTmnMidt3DObX+8pDzueCgd+iTqvEGwnD9CwMjcnDk2JTkfDtWAGUlEHbR1gS0D/Ps/pu8ZRjLfmPPHNJ5oo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979715; c=relaxed/simple;
	bh=Yvkham6xieYfQbbOD+Clqmin8OcCX9BRsD+iXl8Pzn8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VBTvn3PtSwAEZouEV7uPlps+exVwg0VjHl8VIKeg82XwT9mxvF6ADzU8klVdmCcIKM7pGvB8yk+Vs/HwdsCelzs24NrcLljobcF8KUGOJLzQrWdnPTYFiTMb2AoE2ewZDcdrOHW8AIMFa53ImmKR62j7BmtdhoqcI/vDy2QHA4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Xpc5kMy1; arc=fail smtp.client-ip=40.93.194.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Xpc5kMy1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oBYhJkBrtgHggi4yOSdssPriUhYs0Cdd05F0JZu7dAAIk9HikyWHAW/vnk2RvTzU9EQ2BtDcYkzeoi1OGQY5J0LQ8uOndenWio/HitroWOQt71zDA9Pw9RN6+nRObedofFfFzvrqhjrydZfFSkDSx3Bu7WSfAly+iOp+9xhJnvtrubnTq6m/l2xAODlCTP9cJgiNozi8C76O772l/AepAm0LRd66I5iZoJhr6T7N76SML7SUf3DY86IFt1RSeBQhJOZ+wpUcITZDLVLkvoaj2FgpKV3umqK+ZClyoknUyZi4grDYmJZ/gz43nCH0N/gQSiHzuL0Qfy3CZiGLD66KqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmEMorPGK45El99Ng+zdeF+2n2r2J21sUiMwA6/bUvA=;
 b=cfUZQ9XiPJtLq6Vb7Totxp8KaM1CawOc5icMkv3kdZ1dxR8I2vr9PNbWuW3ZEiKH64LXly+yQWoNhMAJwhxy9VDS4qYH011LeJWWTeQ+QO6Ci1pxGnfz1ATwe3iL4TNStUqVn96VYPoN4rSn/dqsRaikCAw+19DQFjEaH9FbuoVNVVj08p75pOT+QDqlN+8pQKPtZmd/HXmFsXd0mDb9HCfpMDgnJXRJp92Nik4N2g8f7dfgTAuPDMh4L9AMoJrGGpIS2peq9epPT/I3IANQyUKHiTtB2QsWgRMoNNczgO7hcCUIOvbkAq4E/4asmoSoJxZCGug9kHL3p0jyGbqGAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmEMorPGK45El99Ng+zdeF+2n2r2J21sUiMwA6/bUvA=;
 b=Xpc5kMy1X0X/ZdAEZ7LaVbWpid9YZRAcaC0K9xxdq0ClkYTp6m/uV2JIWdlBCu65DWvSjGww840m419rsgIDYKqYgDAugkk9tQQOS7+UNoi3vkM3d8AtxpzoTVst335qHaTTQcseQmykgyGY681T7KbyDZiD70W1GYAPMVreUKs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 CC6PR12MB857392.namprd12.prod.outlook.com (2603:10b6:170:204::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 12:08:30 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 12:08:30 +0000
Message-ID: <0316cefa-bcc1-4f02-bf6f-6e3d678d8053@amd.com>
Date: Wed, 14 Oct 2026 17:40:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] ASoC: SOF/amd: ACP7.B support and ASP carveout
 firmware loading
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, yung-chuan.liao@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
 Mario.Limonciello@amd.com, Richard.Gong@amd.com, Poojitha.N@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
References: <20261014100902.1215212-1-Vijendar.Mukunda@amd.com>
 <a22f2a9b-3bb9-40d0-80d6-4ce36758c4f5@sirena.org.uk>
 <031c7453-9652-4573-9de0-5db2a795562c@amd.com>
 <1736b25e-608e-41ac-8e8a-4b0a125766ab@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <1736b25e-608e-41ac-8e8a-4b0a125766ab@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::8) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|CC6PR12MB857392:EE_
X-MS-Office365-Filtering-Correlation-Id: dd1ceff3-b003-47eb-14be-08df29ebdc2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|56012099006|11063799006|4143699003|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hkA7Gt+mV6kG/Rd2mphW0eM4ECQFixj3DlhpzA9DQFVL/qCwcrxBDriybyhj/D8zByvUo49vYNTrCooPnu2Ct9zM+okPvhudwEQCQKi8ORolxVNnEO9+QHdV1daogG6kIlfPYVfTiHczt/JMaWaDxN8x7SQL+upXXHPmDcMrra8pXoGD/APfCcaCxu7nzO8SoOJquDA9RYbCrT4zaxJE9pSkuMAN7V3gF6O9SDmmudGuTJzu766umYkGsqunTSUFg4x9tH7LQ+SU8/oHco0iR47pV5YYSJjzfrSshL8YaLw2CjfWasWvHmXsTGtGtazmcCUOa6iOeQyU2KEhvC5tN8PdBcba6cOCTuflUuwzh+PSrGggrkkqnWnOZrpVCELyH24xzMH2Fc3cMOFkzjBD4/0y62Ahl/YiJTKsJ/ex6r4aA09DBoH9bNpqV1lcdjRATwPeACHCl7SqJ5Bd69n5XI01wyy946bBrp67sbbtJlhbRo67hfMv/dugQKqg1rELY4Cz8y4u16AXEN+U+GHYjL5PcNtEozycY170Yan8QPGCICKjo0ahy1cWDSVxc6vJSzczWiEgLwlvE/W0zvh38D0CGGANOht6OpYk7RvEULGvRiP5l7FWwG3h42ItZ0rX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elF1cDdOeFBWZnFYTGc4NmxHNVg5TXlhVXJheW9KRmRXM0ozUk5SNzM1Q09p?=
 =?utf-8?B?TEhxUHR4RDBvek01RlhDNUREdFpRbitRbVpUQVFCamNHUU1zb1N3bmNaMzI4?=
 =?utf-8?B?Vlhoa1gvTDJwckFXSzJTUUhRazdBSUlzYnJOZW41RHpHeTdEWWNQczU0bW95?=
 =?utf-8?B?bk9Ca21IZGgwclE4NisxcFVoY0UzODJ6N2UreGM4bG5SUm1lUDNOVStpVGhB?=
 =?utf-8?B?a1M0Q0dJQ0tNNk9sTUpSa0hCaklVWXRvZENDSDB0SG9Xa1ZFeFJpczVGTHJZ?=
 =?utf-8?B?TmpWYm9WaXQzZ0J3VjFwdnEvUDNHdnY2VVROeW5MY3NJYlVPOUVmS2d0d0d4?=
 =?utf-8?B?Rk9qN09JVHJYai9QMlVJSzYxUmFHK2hZQ2NWTXJhRDFsV09PQTR3dkExMEtP?=
 =?utf-8?B?K3BmL05GSzB6RkVmZHgvakVGbnZDYW1lWmp3UGtkbVAwRGczWUp2UUh3eVNF?=
 =?utf-8?B?OG45aEtPcE9peVFxUWp6bE8xUTUxbVhLVUd6bHhqczQ1OUM4T3N2OUtNN3pj?=
 =?utf-8?B?Uk54Qm0rY1N1M0ZiYUlnbUVmYVBoYnREa0hOck5ZRTVjNlNyNk9MVVRYVWU4?=
 =?utf-8?B?Nnc2c2ZBUW0xTWdBTlNiZ3prdUlIVG05ZkRiQ1BYaStKblM5MGRwcXI2bXRV?=
 =?utf-8?B?REdyVHJVdVRXUU05TW5KSlpPZ01ncnM1RFdvdHlUMld6N2U4d0paRjlDNkJU?=
 =?utf-8?B?R2JoZC8xako1dTdPZlVCNllSaFZabksvMU9MeHdjK1BzTWZYcmhzL1lkcG1K?=
 =?utf-8?B?NWIrYlRJVzlVKzdqWjB4WTdoODdsdHpldHM1OFljUFJsN1FGNUFJWDhFeUNt?=
 =?utf-8?B?dnZQbE9KaTJUTS9EYlZLS0xTUlZVNzdlWFFVaFlkQ0ljK0ZIa056QVBzT2pC?=
 =?utf-8?B?U0dKbWZiM0ZPWTU3eThBMVN3UVNPYWt6ajV1d3cwYzhZdEl0Vm1td1VEY2lS?=
 =?utf-8?B?OWl2STdwd1ltR1BxK1QyMUtFR1hBSUdjei9qOHIrMVZUU0xoKzhsY2oyOHNx?=
 =?utf-8?B?Y3pBNTROU3hmZzFRR2RKNTJxY0Z3SExpcjM1UW8yNEZlTWR6YnhpUUYycG53?=
 =?utf-8?B?bml6cXFEUkJlUk4zNEFlVU9NUkdiNGdNSVNaQXlSVWh2V0FDUzVXUzJ4bDlC?=
 =?utf-8?B?eUE2endBOHdqa3BnKy82cmtkSVRJVURnZm85NHNEOG8rS2xHUkF4ZUt0Yk1j?=
 =?utf-8?B?VlA4MlRCb203b1owdzg5SmVCWEpuK1RCRkhya1UvK001UFpTelQyMDRxaEdq?=
 =?utf-8?B?a3hqZnBYd0lRSnpkSXY5a1RkRzZzYVI4cW5mUm40cVFGZDRiVFl5Visxemtk?=
 =?utf-8?B?UHFGbVFkOHM4emJTZDhkUmdEUmhCaFNVZU9PbkN5Unl5TjJWQm9LZ0dVc2Jo?=
 =?utf-8?B?N1cyZ0psOEh6QVBGRDNrOGs5eCtpYjNWaXhHVlJFQ1FmdnMxc2x0bkhqc3A1?=
 =?utf-8?B?NjIxa0Yvc1pLSkdlTk81eFhjMkVzYW00dTZrTmNsN1lwU0x1ZEcrQk1pMDA1?=
 =?utf-8?B?a0VLdHN0d2R4V0pzVHErd0ZZZ0wxTko5NDhOS2ZScjRkUHlxcE5TTTloWFBZ?=
 =?utf-8?B?QTdYTzlISG5BelFhM09QYzAxc1JTRUNsZjVnMGlRdE1IUVFPRG9jSWRVSGJX?=
 =?utf-8?B?UjN2TkdpYTFmWWZLYUVIZEdBblpjQmNFMFRIdnFBNVpJRFB1bkE0ZWtndlk0?=
 =?utf-8?B?WkFhVnBWSjhVNUR4UVJ6bVV5Qm9rZHZ0SHZKQy9ENHVtTlR4WUZHVGYwMU1h?=
 =?utf-8?B?dFd3WEpXM1JMdkl0YmZOL3E2ZkVGV3NSSXY3Ti9uY1QzY2R3STFnWm5yVklP?=
 =?utf-8?B?bzhLUnBLRGtQc1g2MnYxTFRMcS9VRU43SzBRbE8xVDJteW42WnVQRGVmZTc1?=
 =?utf-8?B?TmUxOElRZEh4NWlQNm9LUXpmNUk3R0F2WVc4aXpza2V5ODQ4OVRLay9FNFps?=
 =?utf-8?B?RmczSkRVSFlTaTkvM240RnhyaktZMGVlN3AycTN4MGR4Y1k0d29jdjdMM1lv?=
 =?utf-8?B?eXk2ZE5ySmhobkowWFZiVUVkRyt6WE0zb2VVdmdUMHAxbi8wOG1zdmNYSXN1?=
 =?utf-8?B?Q0V3Mm83M29Kdm8zMC80ZUhCNUNBODVhQ0Nsa3RzSm5aSVVGc1VFUmI1c0Vw?=
 =?utf-8?B?a3B6b1BFMFZ1SXNjTnYwNm1BUHlubGJOMTNzdjJFaXA4ekZmWGJQNEhZT1BF?=
 =?utf-8?B?TGE1MG0wMHJOa2NFYUdlMjZnWTNNNVI1a1MvVzI0UzhrTklLbGxVU01YY0x6?=
 =?utf-8?B?WUx1SkREYzcrcmEzbDVEcUdydjF0R0pUcEY2VWpyMHlGc1BjZU1YU3duN1RJ?=
 =?utf-8?B?NnBlak9BSUduMVlIQW9YV3RqR05lWkYrd1JuNWxQY3dlQ3ZBY25hQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1ceff3-b003-47eb-14be-08df29ebdc2f
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 12:08:30.6156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJmDwFjPtbjb3BFJXVTeH/8NBYVfMp3gCQ5zpKx4TH7savcdyeHlALx31m92BZF1ZaIBQ5PRYFQm0+t9/3IMrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CC6PR12MB857392

On 14/10/26 17:25, Mark Brown wrote:
> On Wed, Oct 14, 2026 at 05:21:00PM +0530, Mukunda,Vijendar wrote:
>> On 14/10/26 16:14, Mark Brown wrote:
>>> v1 is already in my CI queue, can you send an incremental change with
>>> the new stuff in here.
>> Posted an incremental patch set on top of v1.
>> https://lore.kernel.org/alsa-devel/20261013154644.3788064-1-Vijendar.Mukunda@amd.com/T/#m6b17b469c043e46ee50a3a85903324c896c81c4e
> Thanks.  If you're sending a series as opposed to a single patch please
> always send a cover letter, it makes life a lot easier for tooling.
> It'll be fine in this case, just a note for future stuff.
Noted, thanks. I'll include a cover letter for patch series going forward.


