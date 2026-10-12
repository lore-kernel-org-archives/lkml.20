Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB797475345;
	Mon, 12 Oct 2026 11:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805515; cv=fail; b=C4h7FFsLJETF2NqXx873MehLkFPqc/CWugbMmG8SGZ1DXkORgM6jquMBNCvkw9jwlFbjeo0+FBFboYBPt7RjusOit+wZghP7h2oFTMzOI0X9mnsCvnyJeix2jakoFQDZnLXsOabqjUpDmFt0acDZdk7X3LkCacO5s7CWY7Kxg8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805515; c=relaxed/simple;
	bh=aTN49fx43kwOCXNMzaU5JQp7VwhJs85mYMJqme6qPqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=db5oE6aZeizSRx05yLfBihPnbH6ffsZrhi6Bziamq3R79JuN9d4x/wf1SSijMZXQ4vlCB+hlYJxiCI3d+TMf59GEfBzM0iZALCRO1wl61TOHyBTWIodEoztR6qtJ0now7p4o0OhlkCCxrg/oHr/h/vEjdo9BCQxRL7nmt1y2n1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b=GM8fB8sk; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=ymDwwKf6; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b="GM8fB8sk";
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="ymDwwKf6"
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8Lk1A2042051;
	Mon, 12 Oct 2026 07:44:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=n/NRpD49/hVkdzYNrCGOMpcVkRA+r0v0z7uL2mF8Ms8=; b=GM8fB8s
	kjDMHPGHDvf6Xka6eeSbgGiVr5+OQ7oV9mnRSJ5UvlG65ilwm10NgwIhzw+XKUgC
	Y/DO4KC3/vs/RfD21LQ2zPtSVxyuThSz6PSPQh1OF7aqGb6lhPNp8dkdgoIoY5XI
	HDg8EwZGELfTbSHQUGiHSxlMWGe1SL9JoApsiG2IT9OMvQfi0ZfqNiAEtgTkitKX
	NdzbwAeP9NE1C0M/QDBeUn80+yO+3GvqJt2KxJ7NfXwlVfjKLPQzJnYFMB+b4550
	98cpjLE1wkPuDyd0/n8AnVjRq7z99HerNr5HYDqJ27WZv9LQokXtSAsfOdqs+v/x
	23MrcNforIDsO9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=n/NRp
	D49/hVkdzYNrCGOMpcVkRA+r0v0z7uL2mF8Ms8=; b=ymDwwKf6+ncIRofUfsmWb
	LMB14oiaC/gKPthIbAOxur0Yb2biCwKPf3fJTrC99xB645vjmJbunpaE5UvN7fSY
	hhl5Z8nj8DCQjXZtny/vAhgOUdCjgRCX+FvyBWwrlDqa1cxSykPrlnZSdoNXFRYT
	zCrgrWPReDcgamGbhaDu0yqg7+bA5oot+sGWxHO2CrzEElJF7KLHnmRP4V5rQSya
	ZzPyWaCagBj/E6lgZKttg5jchybHYDKVtZzKZSbt2T47hqQpL3hLx//QldUTDOyJ
	UrVRe4zikdU55UWuP8g3M9dOhjcOizC/wgeHxh3oJqzg7kuncvfNMeyFyDD762L6
	A==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010020.outbound.protection.outlook.com [52.101.46.20])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4h85yhds5s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 07:44:54 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mF3m0KU7eoWsdUOtyt5qhR4SV6w5R450T4uvZnaXe1O5cjTUrKQRq2wejQsIEM+sQlU20JnNgiuBn7eoaptNvn9iEfyBnHQ4GSk7Z6qVPw6AhoujHbj/4TNw8ViU6M8s+kXU4TZjHXVjTI/NLG9OLwR5K16rHeYjq+IwYm3OdQT5w1qmNGmd/m5WGOSngVPowKwclCqq4R4t8c8J1bExQkHo432HUncWHLY/uU2a5NXymySrj8yQEX/3WNWBKOJngJQZ8Idlpmq1PG1ZH7GfH5Zu6GJeBgdQNnu5xuJWUXob5x4fN8g3X+el8aNu6SEAiu5IDl3bfxeYuzRWANrB4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/NRpD49/hVkdzYNrCGOMpcVkRA+r0v0z7uL2mF8Ms8=;
 b=BODzKvojw1GmvuyyHNJCriz+zvIm9yfJwQBWrCZ25rYDJMcHerSwx+g8JxgTvupIS2t3udQRZ/VKNm+0dkfLuIUf7BIOdSW6F7gPJJK0GNP/uPk+B7gfGci9YMlOnj5pVJcMAOgEOaEdFltt1Ui8Iux185GBHCetbi5bRLBCpFA8c+vvDClesrwJq0huBz2S219H/meW4v6aVq04G7K1bsSDLPNUXTLs8R2+EnEC3BzJacWGb7AvVwxFtY5arFFeSwq0k7d0ZxdbcweKj6Vekwnv5jU3kEhbVzui51HwgDNyDsEH4L9EkPaQU7Z/FWw2uXVGZhK4rxi5rp1sqQPrBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24)
 by SA1PR03MB6562.namprd03.prod.outlook.com (2603:10b6:806:1c9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 11:44:50 +0000
Received: from DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed]) by DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed%5]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 11:44:50 +0000
Date: Mon, 12 Oct 2026 13:44:46 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org,
        perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de,
        kuninori.morimoto.gx@renesas.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: ak4458: Check reset status after deassert
Message-ID: <aszDZlJ0KahNwgZO@analog.com>
References: <20261010084058.2365291-1-shengjiu.wang@oss.nxp.com>
 <asqIvOi1iQrIkB3w@analog.com>
 <CAA+D8APebaDpME+025EUnyAtLrAC=h9WSMwpWtFX-TdooLTdiw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8APebaDpME+025EUnyAtLrAC=h9WSMwpWtFX-TdooLTdiw@mail.gmail.com>
X-ClientProxiedBy: MM0P280CA0102.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::23) To DM4PR03MB5981.namprd03.prod.outlook.com
 (2603:10b6:5:388::24)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB5981:EE_|SA1PR03MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: f0231073-fb9c-4ba2-841b-08df285638ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|4143699003|11063799006|56012099006|18002099003|22082099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	f1548Osgab1ER0mVKo8t+1O1Hm0JUHzQQgediKj9yfHwkQXWaEct0O3rDgu+KV7NgLzgFlIwSzw/xbAgKcntQSTJCGDOvriqbDD0qRY4QJ8cAPFIB6qlrxlVneLsfNCudx3mR1zgnKJp8lu2kY36d/c/rqtKjCCAiu/4QTPPyLqSKgApYDFLDvyp+16NjCffQ4krMl3AJtrwVU2Q2ZYVcaL70PBgUQ47n4Ri7HYrXzIDFe0oAzgbAetzSCnK+gkXYEDwywX2jkPtZ6i69oD5TtoReelM5tYQssI2wfb3oAE3uIj26Gb9UTPKK3ucswfWb4ZLaaxtGyWeD1UDK/HhK7Xmz+mfcAt1xeRqoWKIFyFNWcP4hKbbCCP1YLHolgMQJ+IQIpFttmZ68PD3o9l/JaGSgDVVc0lR1PzB6GVZf5s0FctGP39uOwikwM/iUdC+IOsc76oysfgpoEK2UNpT+ZIjwbs1RcDXnbFRyIfihjdMt4USz/oqMOX8yvudLZw/WaGaRg/BwznraFzhBUi+7dmHYr942MZFIOzFDrj9NY9INb/vwxouVRqgs/UiOWxtl9uirbCTdHkvkrw16ZxYQWNqAbb3MtuyeVXUrRCC76cIcYeU+t0MqG3clZMqzO6nW+/g3HK5ASnx31sPiOnMfGPUdUyW4qSMM691diXMIL0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB5981.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3JPb0FKUWM4V2x5d1pFS1pwQzBtdUtxZjkwR3ZGcUhTZXIxcHhhbUw5RXl0?=
 =?utf-8?B?ZTNQMzZxY0Zwd1gvWkZjT21qbklQRkRmMUxFaTkrRURrcmVRYVVqVFNhRXRi?=
 =?utf-8?B?ZHhHc0FkSHRVSjVRTTlXS0F0Rkl3SlppaEJDQUtoSTZRTzVEUmdlUzNGeHV5?=
 =?utf-8?B?THB0MFB0QmFlUWhQZFc4ejNJMm9qZUxnMXBxdmtuK1RRblF5NUc2ZmFvZ1pp?=
 =?utf-8?B?dkJtdTk3TFNlci9UUGVZYmpTVlFDUlNHSjJlcmlsc0NuQXVKcS9JZkdCKzc3?=
 =?utf-8?B?U1JOTDIrWTdtVlVOQzc3RElYYWNaT20rWlpwQllGbng5bDJLSC9HRE5OZmc1?=
 =?utf-8?B?S0ZHRGFlT1owbUZMeno4ZWNBWEVZNy9WVTVsN0hjcXJoYiszVVZlc2J3bElk?=
 =?utf-8?B?VFd0YWo4bE9wTXVhamwyZi92elh6UTRPMkZPMUJkNVoxaG9qRkYzaFVEak9s?=
 =?utf-8?B?aXVqSFhsMFgwK25kVnNvK0ZveVR2VDYzaGpWYlJRemN1bmttUU9aK0x6NnV5?=
 =?utf-8?B?UHJUQjc5UEhKUVNsS292TElOVUhzWnpGdEpsNmxLY3h6SlJNWi84VDE0bUZy?=
 =?utf-8?B?QzZTTTZPOFZVUVhocm1HOGtxNWxqTVNoL1RIUnBIdU9uMkczYndnSE9rMzU0?=
 =?utf-8?B?WTEzUWVwM3NGcW9wQkRDTGllVEFiZEJkV2kxVXZpZ25DYlBpckFkUWhveHBL?=
 =?utf-8?B?Tkdyd3pCSVV5M1BoMDVVS0F4YlErNXhzbk1Sd0wyN0xYbEhFYnZFMEEvbkpy?=
 =?utf-8?B?NzZMRGZVczliRVNwaTRBVzBnRGFnbFNxdTBIVXMwVmZJK29VMEZ3YWhDSmdm?=
 =?utf-8?B?RzB5N2VuRGQ2WnVFcEVoekNCZVNIK0V4YjUxb1ZrSndPOTdaZU9SSllBdEU2?=
 =?utf-8?B?dWhyRUpqZmxPZVY5RzUra3BsenpSNEpXQ05VWXk2ekoyWkdwS1dSam10V2ww?=
 =?utf-8?B?dkdTOEY3RWtoN3N0TFp6VllLRXgzZ0hIci9oMlVJNTExaW5uZERXY0Jtekkx?=
 =?utf-8?B?TzA5WHVLNlh6MEczRjBObDMzYjZaZHNrU1lmbUZ4VzlRMDNtSFhrakduVXZa?=
 =?utf-8?B?Q0RtemRZOVNvWjhXZlgwdjlFRVlQOHhWQ3dMUWtXZUw3a011bWt5czhvNVFV?=
 =?utf-8?B?U1F5WHJaSi90bC9IaUc1NFEwYVJ5ZDZ2bzBMVjh4OUxFVVZJMmN6WXhINUVL?=
 =?utf-8?B?cmxUdlVBTGM1REhDd0lzOXlUKzFvNGVqMERaT3JBTi9CbEhDVEt5REJUTzhK?=
 =?utf-8?B?NU56VEpFcnczM0MrVVFlWGhPYXBJNCtabkRoZFhlVnN0bmpiT2VPL1hOd3Vq?=
 =?utf-8?B?b2hmaEJMMGphakgyVEQzNm5jeGdHSFZiRXVaQjRZUW9maWNiZ0lWYy9CYzM1?=
 =?utf-8?B?eSszTnBwT2FucFBkNy9meW84dC94RC9EOVBXRVhHekErd2pqTm5Va05KYUJH?=
 =?utf-8?B?UklidkhVSm5iV2kxTFZ4bzFFVXRiUmRYWjcxSUJ5UGNQUTZxSUxXR25KZkxt?=
 =?utf-8?B?UFJRd01ybEd3bXNabGRqWmFQa1N5Yi9aMDVkMnFYeG95Tmh6TkMyWFhCeGRC?=
 =?utf-8?B?Q3dQa05wNGNiVDNFMXdWamZPMlpROEJjOHFHWDJHRlNlVlkzY1JZWE9LbUtX?=
 =?utf-8?B?cC9mcjVxYWZCek9KdnRZYXRWbkVSdWtkbS9YQ1o4VjRSaktoalF0WHc1VmE4?=
 =?utf-8?B?ZW1uVFEySjBndnRrcGlhc3J2M1d1U0czb3ZaUThEeFdYaGtCUk83STk1Z1ov?=
 =?utf-8?B?Qlpibzc1bVFodTA4L2ZNQUZPWGtmRktkNE9PZmlKRlY3Vm5GTzFaSnJ3NnpW?=
 =?utf-8?B?NEJnYWZYcm5hWHo0M1BmOUU3TC9yUDk3VFZGbyt1OG5hNWR1YVZNQXFRR2x4?=
 =?utf-8?B?NkJjdmxGUmtuZnY4L2hkaWJobHBGYTdXQ1VTQUFlYW1na1NEeERKdFFKSWZ1?=
 =?utf-8?B?cGFmekhSVHpNNWxrdHJvUnQ0UVN4RE5TZzEwU1ZjL2t0RlZpaVowckZoRVpW?=
 =?utf-8?B?aFpOUFoyaHBoTFIrSE5MUUVQSTFXeHZLNFN0eHphOWNNZjZFZ0Y2NXFzeTBx?=
 =?utf-8?B?NVBUd3dWZCtLTWhwM1RXRXd4RUpjcnIyTjNYVG9JTDJyYy82dlJmME55ZDRP?=
 =?utf-8?B?a0Nsc1YzSTZ0akZIcHdXQzJRd3V5blFvdzBaVzcwbEptRC9tdituUUhWRnFv?=
 =?utf-8?B?N2pPYU9TSzFRSDgxQkYwWEZOMDdnKzR1MlNWMHl5NnM3MGxiZXpwYmdVdGtS?=
 =?utf-8?B?ZzdYSlpSekJZWjNwSk01bFBjcGpwWjk1eVdqWk9ZbmpFYmxHU3BQdFdBZWVW?=
 =?utf-8?B?WkZTNnBaWkNEQ3Q5QnMvTkp3TTNWeUc2Tm1FWElyRlVBQldCTllvQT09?=
X-Exchange-RoutingPolicyChecked:
	S0vRkOsFpgTO6m27hoaz+5JU/V/WUH/QMAWriB5lpu/s/35PFrDQk9pRxC21OHHGIEblhxRa6g87NYqj469DxtB8WSbiO2mMHv+k5ae5MknOLvNEaC9rgZqZCre0xh7WgeCDYKdb7iFFLQjZVfiu8Hfb6lrGuMGduVpzkrwam4YrfVzfa7+N3oIBsyXBUIxV4iRirgohl/1NczXTmP0FAIz935UfbksOsN6CIEvh9qciyAFHRQTOpF5iMMjkXbdHKN5BMRjOybvs3P7RQzlBoah2sh9RWPItPzy9M+1dggy54itrHJ9irls+FmfYjFj9ejjrwuxZqxjwBviYtn1wAg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0231073-fb9c-4ba2-841b-08df285638ac
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB5981.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 11:44:50.2886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yz+ISzNvmvuJcoTtssved77QhADqECHQ3mCV8/N55brGrviojWp1HhCmnkufjUksNZkx07MWpmrLJYPojCsbaKANNcUNjXNjI5i44w7UrwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6562
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0NiBTYWx0ZWRfX1uKlZAyWus1t
 Iauzd6B7NPtsxH6kobHex0POXjAUUlwZBASIqoec6189TS6ScmcK0VtQMseknbGtemA61juB4Bz
 2EU3u27HWCoLwebNBJ/P504z02y2kiqScYQ0y9zzOhOOztwsgXEsdvBK6qgFI85ggWvla/VEF8T
 N6wYH8WPBClwLYZyAkE/aUtMl4U+ARMW8z7pBuOHPtxbvGqTuL1YQysuk5HkcQL99VJFQjf4nZU
 5XCWNUkQWZcwcV1krkWKM3FWuLP2D/9CbgOmV+uJUpVDOJQcLIcKEIkKSHwk+YptI5ogMbbf0FL
 fCaEGfwdspykIkPn7JnF+O9tY/o4RJglJ1V7d1dWkTLMCQMmVHTdU/abaOB0oeE/wQD+UjJtY+3
 EIqHCN2b4sTZssFvtUvsfoIldngc0QO8RcP/p9Gtg3WYtE4f7xt1znezfHNapCoRvOqrJCpXbIf
 /TuTQ7i0B/8OJ1vzFmA==
X-Authority-Analysis: v=2.4 cv=cp0OAF4i c=1 sm=1 tr=0 ts=6accc836 cx=c_pps
 a=VvAZzv+PhNtEUaR8E1V7rA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ZQxX5BWu6Z8IJBb2zLX7:22
 a=gAnH3GRIAAAA:8 a=8AirrxEcAAAA:8 a=ABnnHevGHhzjX6CumKcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: 8I71ir0HHdUBOJJxvexxTfk4QMHzbVf4
X-Proofpoint-ORIG-GUID: 8I71ir0HHdUBOJJxvexxTfk4QMHzbVf4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0NiBTYWx0ZWRfX2kmQF0rjLL3Z
 OuzZV5Zq7DeQiy1/wY3/5wl13vCAQEpFunN8kUvy6mAUvpPjhCq2JHcvfnaP7EKhvqmFLch2q8P
 XaFRvktwSBbq2DjV64NnYHReVaHfhkxVid0McoPXWsXYvLcmJ5PB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120046

Hi Shengjiu,

On Mon, Oct 12, 2026 at 02:49:03PM +0800, Shengjiu Wang wrote:
> Hi Alvin, Philipp Zabel
> 
> On Sun, Oct 11, 2026 at 3:05 AM Alvin Šipraga <alvin.sipraga@analog.com> wrote:
> >
> > On Sat, Oct 10, 2026 at 04:40:58PM +0800, shengjiu.wang@oss.nxp.com wrote:
> > > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> > >
> > > The reset line of the ak4458 can be shared, for example when two ak4458
> > > devices use the same reset GPIO. In that case the two codecs may call
> > > reset_control_deassert() concurrently from their runtime resume paths.
> > >
> > > Only the first caller performs the actual hardware deassert, which may
> > > sleep (for example a GPIO-expander based reset controller). A second
> > > caller merely increments the shared deassert count and returns
> > > immediately, so it can continue while the first caller's .deassert() has
> > > not finished releasing the line yet, leaving the device still in reset.
> >
> > This seems like something that should be fixed in the reset controller
> > framework. In fact the issue you describe seems to contradict the
> > documentation of reset_control_deassert():
> >
> > /**
> >  * reset_control_deassert - deasserts the reset line
> >  * @rstc: reset controller
> >  *
> >  * After calling this function, the reset is guaranteed to be deasserted.
> >
> > ^ (1) seems not to be the case as you have found
> 
> Agreed. Looking at the documentation again, the guarantee
> 
> * After calling this function, the reset is guaranteed to be deasserted.
> 
> does not hold for a shared reset control today, so the issue is really in
> the reset core. For a shared reset only the first caller runs the
> hardware operation; later callers just bump the refcount and return
> immediately, e.g. in reset_control_deassert():
> 
> if (atomic_inc_return(&rstc->deassert_count) != 1)
> return 0;
> 
> So when two consumers of the same shared reset (here two ak4458 sharing
> one reset GPIO) call concurrently, the second caller can return before
> the first caller's .deassert() - which may sleep, e.g. a GPIO-expander
> based controller - has actually released the line. assert() and reset()
> have the same pattern.
> 
> Rather than work around it in the codec, I'd like to propose a reset-core
> fix for your review. The idea is to take the existing per-control
> rstc->lock across the shared refcount update and the hardware
> .assert()/.deassert()/.reset(), so a second concurrent caller waits for
> the first caller's hardware operation to complete. The lock is taken
> before the SRCU section, matching reset_control_acquire(), and these
> paths do not take rcdev->lock, so no new lock ordering is introduced:
> 
> if (reset_control_is_array(rstc))
> return reset_control_array_deassert(rstc_to_array(rstc));
> 
> guard(mutex)(&rstc->lock);
> guard(srcu)(&rstc->srcu);
> ...
> 
> Does this approach look reasonable to you? If so I will send it as a
> proper patch and drop the ASoC: ak4458 change.

Yeah, I think that is the correct fix!

> 
> >
> >  * Consumers must not use reset_control_reset on shared reset lines when
> >  * reset_control_(de)assert has been used.
> >
> > ^ (2) isn't this rule also being broken in the suspend/resume path of
> >       this driver?
> 
> I don't think so: the ak4458 suspend/resume path only uses
> reset_control_assert()/reset_control_deassert(); it never calls
> reset_control_reset(), so this rule isn't violated here. Please let me
> know if you had a different concern in mind.

Ahh, sorry! I conflated reset_control_reset() with
reset_control_deassert()... Please ignore this part :-)

Kind regards,
Alvin
