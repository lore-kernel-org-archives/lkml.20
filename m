Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793969332;
	b=I4X9G4127MuEBkN25HaRUMNquhnmnjhcRtS0OYKXrfqjMNvF2Kl8qD7OI9qGyK9o8D32
	 vor3GIBm+voVFIdIZKALd438Jo7+w0C2VqmL8OyylqGgXjUK+GJHZ6I9YxyJQpzn1pgk6
	 Z3HAJSJMmwDhAbfoG1oL4fvSxEOpe09RmFjkt+2N4UAU99c3r6qtbf661NkYIq8TIXiyt
	 J2Pvugcnpp1LxpQFH3oRvrJUGDpXsWjcm0bowRLh9IOvoFQUgkc/qbpD0KdcjhLQ5QyQf
	 HbpeJWGBGZehnIjGpvkTsZPoaXL9MwmBV/Gg+DgjHMsheTPVpFICH+foovDVT1S49Dw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969332;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=EFRLte/LPTs24SO3F0NkgoFiEi4unT+GoqToTBl/kGg=;
	b=lXkz0U8rndfIP+gZtWr9+MAdYci/6s3a4827cgb9mRRmsGl1Ci3Ld8vRR1VR6x4AJO+7
	 felKrFD04VyP9clqMljMvev8Pmjo2D6S2jkhVs7Z62tjaJy1Y7JeEC9/zrOJ0LvqUCp+W
	 pBVVoU+B6t6vlErB9VV7uygmUyJ7C7IuwwOWH3fUO5lrnoUA2Tc24akBJI7TlojHvME99
	 rsjLcPjQt/wX2D+UqTd7i3DhHS7/j/BQH0c8Z73OQTSALje069J91zHsj+JH2VJnSHCzC
	 0tv4vX4Yg7eWc4wGUh7BW2Jv+Q99KlwVIBhH2FcSgZQlLrLhtGb+j/btpqK8D3MK9rg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KpzrNOH4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.1
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012001.outbound.protection.outlook.com [52.101.53.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F89B606A330;
	Fri,  6 Nov 2026 12:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F89B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KpzrNOH4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yoaIFh6HOKOzoaxXq85OVXJ/VcpYORp7p/BRFAst7H+SCJ3n9jqcsMDAZHaDhR4D8PY+cfMorz6h0XwHk4tQaICiDECaOC6pE/miu2jP17XzN/un837YVix+iwtZWyAOwqIROPMtwFAG6BfN6V+ZglaLLTPO9LG28uS0XExECyFwn0J0PjXzUhpDVRwxeV0PXPr/tNQRMKUwVN9CiIygmJd3tdGCmiX9ggEKhXdvpEvTSQG4J3Q5X1bbD2l3IfBIk8dPqxQaCgYTy9d6H+uiM5xm9YwL2L/k7GI+89eL4Lt6K9SpIry299tOzNesKsXsSU8zq1/CngHN4gnq61foew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFRLte/LPTs24SO3F0NkgoFiEi4unT+GoqToTBl/kGg=;
 b=OQ9zbwh6OIbiHu+Owe/SN4Aa7EzAn1gd8ykcn2fcrktZf8ofMPXQqMya4ApIKrEx5M24fW1iSCXLlqkpSzRi4SHOhqQwcJ60NR3HCM5P0tMm2ydMxnTTk8/Au0vh70yaxwZ55fzIAH2KRZlJPyxNihwxcy3LTwzuEVVAQs2BNsqGHMdcWYRStFbr2btKp750jYhVzlEEhLZrP91otXdipTEvS6JhQ6G/KEo3+skfRn2CY/iruqfkg+TyEPf3p+3/0eicLzCEaaPpGiH4tueqzBaZ3l2UkTjLB9I+/arh6LwBSxXd5p9oegT5h3fHmremzChllKRlLhpBXLzrDMHRMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EFRLte/LPTs24SO3F0NkgoFiEi4unT+GoqToTBl/kGg=;
 b=KpzrNOH4ENsVzcM9paasOk455eLd3MeAhvbc9VeEdG8nIu6xCv0RWhYBaDXI1PecECyBcR36B0PL1PYm96rc3/uoCl5JBmMGK5OOJAwUpBU45+CSRr6ziE98MUor9B+igkhFQguy7TiWitngKdbB5qgNycZB1KwGIXq3IdTcJig=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by MW5PR12MB5598.namprd12.prod.outlook.com (2603:10b6:303:193::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Fri, 6 Nov
 2026 12:48:47 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 12:48:47 +0000
Message-ID: <2d887588-cda6-42a9-bf0b-890b89826b57@amd.com>
Date: Fri, 6 Nov 2026 18:21:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ASoC: amd: acp: supplement patches for ACP7.B/7.F
 SoundWire machine driver series
To: Mark Brown <broonie@kernel.org>
Cc: pierre-louis.bossart@linux.dev, Basavaraj.Hiregoudar@amd.com,
 Mario.Limonciello@amd.com, Richard.Gong@amd.com,
 Sunil-kumar.Dommati@amd.com, Syed.SabaKareem@amd.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz,
 tiwai@suse.com, venkataprasad.potturu@amd.com
References: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
 <20261106114622.219126-1-Vijendar.Mukunda@amd.com>
 <1a75c8e5-975b-4225-9e25-5b6b1148fb50@sirena.org.uk>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <1a75c8e5-975b-4225-9e25-5b6b1148fb50@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYPR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23f::14) To CY5PR12MB6252.namprd12.prod.outlook.com
 (2603:10b6:930:20::17)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|MW5PR12MB5598:EE_
X-MS-Office365-Filtering-Correlation-Id: 0841c4a8-028e-4a27-8638-08df3c044c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|22082099003|10067099003|261102123227099003|18002099003|261028144727099003|4143699003|261026121527099003|261026140227099003|11063799006|261022105027099003|261021121427099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ibJybjeMyXpiKK98vjfbOus2LhalHbqA9dJfiRMZGW7OHzDXcGzeNqU6iMsDqU09NcArJeh1doXbw7jntf8Ajs1n5LfmgY7PGTfIC+qR021G2GA/Yb2IQ9yid7X1j7jOCRm9l9sKHzvqWDX6mO1VYZqBQfm09XVZ4x/JRP/KfiDE9gZZ16Npyj6gaGUHW+tU5DP+aCeHdG5wWxfWcq2PIFZw+9yMWcqTZwsqgH/mUc35U3F931tEhO8UJ+Dhs41IWfH4C/4OPioe5+OO8fcaODUbaeMUSBr0zhXLZH5daJTLjvz49qKl0tEAvkQ4PMA2dR5MbyMdBvxeCz5Ic4W3b48rQP6/ozAiWw1vBjkAkwyFpLusjmOeTAye34ywNArnWlouvHEeBlaqZhO1zSvj2hOUSzkosAHBUjJSaOiShAoSWTyaO5mS1OZYL+gGeFN17zAl0L+qZQURNlLQ4XdX9otX1Gr7agHQ/EMXy5Cm0KqkLKMS5iAUtcmcSrbWEoXARLX0XfC5h+jMSXEzx9Slqw52ujzl6QUDCjlNGhQ2LA0RVQJSN6KI7h3ZVNtY4GicKEdZDgifqMyAUiuWiB75mVv1mer29FJS6/zPRkS5De+Y862ZT+Z72d7movi93qltdT+ji6xpMG2LlJuMg/7M+ZDjOVsVSPFfPT3/Bag/Q3s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(22082099003)(10067099003)(261102123227099003)(18002099003)(261028144727099003)(4143699003)(261026121527099003)(261026140227099003)(11063799006)(261022105027099003)(261021121427099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTV1MzFIanZVc0JmcCtHWm5IcVI1cHdXQ3dPeGRqT0h4MnFIc0RPbW1Db0Zr?=
 =?utf-8?B?VWpkMlptYzE0d2VPR3kvT3N6RWc3aE1TNi85V0J2QzhXZjVraXAzZkRRV3Ey?=
 =?utf-8?B?d0l1R0JjSHdoL3M2WFNMc1ozODdvcGdPekkzWEdpNmlWTmI3ZVBLUmxlNnc0?=
 =?utf-8?B?QU1LZ1ErWGtiamc1ZjQ4Z2dlemp2SEh6RVZQbCtZcUR5RE9Ydk1qZGlFbHdl?=
 =?utf-8?B?VU1NVU9kbzBPOVVqZUI0TmlQeFhnZGlJZTBnVFZMYmJ4WTZJeDR0U2JuVTJ6?=
 =?utf-8?B?Z1FYTVB3UEJ6Mm1ucFM0WmJiSnVCRkQwamNjYk9JRlZ2blpWbmhVVEdURlFj?=
 =?utf-8?B?Z3ZqU2VmZmJJNTVRRzQ2WUpCUzBuNTVVanBYcjRXclozOE1HYWNaYkk2WU9J?=
 =?utf-8?B?Q1RGUEEzUUNQWmtRTzRadnl1elpTWDJGSDFXSlo5cGlkaHVMVENXaytyVWkr?=
 =?utf-8?B?aTcvR0FEVlZ3bGVEN0FUa1hzSkFLUFhXUzd5WHpmTFFFaGVNUWt3NFAxQlc0?=
 =?utf-8?B?WXp3bkNrWklHTEFpTDRWMWFBWjkvNHlheDJjeUdnbUJ5bGtjNUlvMmNBdFFi?=
 =?utf-8?B?bzFsdWorUk1VMEE2NFAwUWl2T045eTBSQVJYWHNSSUVobFZtY2JON1gvMkx6?=
 =?utf-8?B?VzJkQ1hkMUw5cEFVejNNOHZ1SmhRYk1iNXYxWjR5bGt1OWVINitZV3N4NWdk?=
 =?utf-8?B?SncxQkg4SzRWVjBLU3g4YW5XZ0xxeFZpNUM2OUxMZy9TUzBQODU0ZzFQNmxI?=
 =?utf-8?B?WW1NTkZkRTVTanRqYjAxeVlUZ3pqN0JiaG8xZDhvVEVOZmVMNncvUzlsM3Uv?=
 =?utf-8?B?YklXSEQ3VXJBanZuWVY3S04wQkQ3VnlzQ1dZWjlIVEduNTdGSHF3cGYzeDhP?=
 =?utf-8?B?dk91RDBIOXZQMGdJZEJLbWVJdllVWWtCTTQySmdDMzdJdTRGbmQwUXlsQ2tK?=
 =?utf-8?B?NmFURG81UlhYSi9ac0JHRU9XdFdFOG5rRjJZakJ3bzNSWFk5cFNlRUloeHVL?=
 =?utf-8?B?d3Z0dmJpREYwREd4cDFjSm9rQ0FITW51cEtCMWZUREN6ZmFBZ1VueW1PVk96?=
 =?utf-8?B?NGF6NHQ0T21JMlNIOWlweXBLVlBCQ0lCakMyOXhkUTM5UWNWVWpQaUk5S2la?=
 =?utf-8?B?aEFFd3Rkd1ZTbHJPNGY3SmU0ZE85eFk4UDNFcDZrL3hiSUgyM0x0cXgzN3M0?=
 =?utf-8?B?UlA3U0t4SE9OdkRCUUptMzlCTzVlM2pqQ1ZxK0xXQVJWeXVTWHQ4aVlwSlFu?=
 =?utf-8?B?Ulc2aHBNSjhSYkEvWnBQTEpMZzNRblQ0b2Y3N0JIdmNXczQzUEI2VlFjRG1H?=
 =?utf-8?B?eUlRaURwRTArdHlRd1NtWkp1QllMVUNNaS9vRTBlckJSL2Z0OTRpaHVGTmEv?=
 =?utf-8?B?dlNCaHlOaDNxV0Yvc1Y2bSszdHl4YzlRWEdEWS9FWFNlU2pXbTk3STMxVmpM?=
 =?utf-8?B?SFRjSWZpK0szSWpMMFlQTEF0YnhQUFlJMWswU1pDK2NKMkQxbHkvZjhHcHQv?=
 =?utf-8?B?V09yMGV0U2gzMlJXM0V5THNHcGVTZ2F1M3BreUM4WEVFelZBOXRQTXpyZitw?=
 =?utf-8?B?bHZBVHA0elVJemt6TjBLcXhDMk5UVVp4bE9pTVRJZmlRdGE5NXg1Rjg1b0Zl?=
 =?utf-8?B?TEhXVURIZ2dkMkZzcGJDYWQ3bkRyTTZHSWdPc2xMZys0Z3dXRDRnakNScXBU?=
 =?utf-8?B?THd5bDllL0N6ZUFKUDBOdlJ1T1l3b2t6VURJc2dTbFRweitUbDJBUHFhcXhD?=
 =?utf-8?B?aWozWllwNnhROVIwY2JNOXZ2MXA1Y0VqRGlqa1VxWjBBajhNWGZZT2UxVXg3?=
 =?utf-8?B?OXdUa25JSkh0UzhoYVZKNU5SYzJWSGNwMFhkUDNmTXJLOG5yRXhnY2R3L0h5?=
 =?utf-8?B?UVZTWUdDTjNrdndTeVBJMVl3Z2wrQWxHL0ZvSHk4ZXpRdjdTcGpvTjBxeElo?=
 =?utf-8?B?Tlk0TDgzZ1Z4SUl0SEtaQUlCWGRaWUdNbXFXSVpyMVdHSzFldFNCM2NSZlZB?=
 =?utf-8?B?UjhEUklnbkd4V0tEVmt5VXRDblNuWHlDTUhYWkZSZDdXblUxTXltSkxneGJh?=
 =?utf-8?B?dy9iUzJnVWl4QXRzeDBnN25Kd1ZSMmxwb0phbVJyY2FiM28wcGU1SVJ1T0FT?=
 =?utf-8?B?b3BWdHdNeWgyNzNudUdFZTdJNXI2Qld3N29wTUlxRjdHamZXZDI4YzVueXV5?=
 =?utf-8?B?b0E0UllHaGJCNU4vMzIwK0tVbDdOZ3BvVnFzZzFCUXRVckptMjFYYUppUktz?=
 =?utf-8?B?eVl3dHVRbTd0enBlR0VYdi9zZjJ1OGNoNUNSdUo3bmNpb3JVcmJhZHArRDBp?=
 =?utf-8?B?ZGlqbDgvWjlpb2JFQ081OUFrWEovT01YaVIxSHY2YjJIVHgxNS8yZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0841c4a8-028e-4a27-8638-08df3c044c42
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 12:48:47.0722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZLpmDiydqZVsCBp8VakiGQOMlLlB2Vz/ZNXrl9E6gGb+OrbwLsVQ6E/CQT5x8s0I0U9bCn+9ZSOeM+iGZ+jbTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5598

On 06/11/26 17:54, Mark Brown wrote:
> On Fri, Nov 06, 2026 at 05:16:20PM +0530, Vijendar Mukunda wrote:
>> These two patches address nit-picks raised in review of the ACP7.B/7.F
>> SoundWire machine driver series posted at:
> Please don't send new patches in reply to old patches or serieses, this
> makes it harder for both people and tools to understand what is going
> on - it can bury things in mailboxes and make it difficult to keep track
> of what current patches are, both for the new patches and the old ones.
>
> This has really confused my tooling :(
Understood, and apologies for the confusion.
Since the original series is still under review, I sent the supplemental
patch as a reply to it instead of starting a separate series with a
dependency.
Going forward, I will post such changes as a new series and clearly
mention any dependencies.

