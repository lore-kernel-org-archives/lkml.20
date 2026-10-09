Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA413793BA;
	Fri,  9 Oct 2026 15:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560944; cv=fail; b=SpoHFO4sVImKE5n/yIgkPCSPq9P1dYIJa/lGO5BU+mGJ1x+JSENC4fziieCOJqIcbf00FFvRJ5+x/JAS78Z6SbpOeNOtD7QWkwwMxv+YcX3igzR8cpJ5qiGl4QEzgTVTM/ZGoZwrrBu9BI/fBPo/KwLsCb3BfMv0A3eX3uexz4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560944; c=relaxed/simple;
	bh=1BkN/fsUYAV1R5ElqDmHm6usRvgR6bIBGhXmD1tLvNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=U+YaVGy5PX2U9/nMp5eV0Kw1TPUZGNefTZGCdUy0Fkx4n+g8zrJzth8TlTrD1nvstqa2MrkTbT84tBVr+MI7L9r3f3yW38z4ENwwJr67xsI6aMSSvcRIJ0PfaR7PQpZQhJ06qxX370la6y1ejizdSXTJ1t+kU9Js1zk1ObTmrfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b=HKWKm8iL; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=W5ExpXus; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b="HKWKm8iL";
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="W5ExpXus"
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DMxDt2589142;
	Fri, 9 Oct 2026 11:38:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=LP3Qj/0u2zERQat29YJWm3O6dFPc9p7lzjz18gm/T34=; b=HKWKm8i
	LuspDQciqhS5kzmvcIuHKm3jaYyOoAAJTd7JmZikJGIr084pO5i9y6uLuErMc556
	YmC+aaPXxCj15rgaRTlR/KyV4cvMqk8lk7m30laUDzbe1t8xRpNSZm2pF4MPZAUl
	ZvtZ9cF2KQBl5cUHZRNJgxOZ/JGd1x+VXPgRZNK+KzMcHswJc9jH3i5T56gNqAEE
	wHdyIWOfQSa7MmSSBhwGxAM6/u/HRbT/nrfGdVGe1eeMaeVqUcfvYf+Vw8UOfCe1
	8qf1p7DqoEEiV9F57bsMRnVU9662kWFiVQAFwZmqhIzdjKbTB05r8F8Uh4ptFIfU
	7ZyKVCVCRW8Cn2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=LP3Qj
	/0u2zERQat29YJWm3O6dFPc9p7lzjz18gm/T34=; b=W5ExpXusJ11ciq95yhKo8
	vMCV0pr2FxZzI0pMX54+wYn+6bAUG6ARoALiAbUIeO3SS7htnJ+ix+9bWcx+Ia21
	+nU1Arsmf3aPLuctYCOgua/1P99fHKvKMSJNX59PDtIeaRgNbHq1sxjkl1N/Dnp/
	UkgMV+Y8gcvEZQWom4tlHGJuhv1a/DQV+2axGDy79SflEHzKKCTP2UMrjmoQTA90
	J/taPmiXYxFvkwyyIod47D68wggXGpj2B2CiJYT1Vm0Up4Kl7UHn+B0EmaSJiJox
	NQ+mBM7DP/glOsHXMdX+9Y8SCzUU6X31SowlUNKBgGJZC6hZCO9AaKNMDJWlpo0Q
	Q==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012016.outbound.protection.outlook.com [52.101.43.16])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4h6gs35mn3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Oct 2026 11:38:08 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVXn9/9Ycuk/daq5E4oILVKk0pZKjCaxQ0QtDLFXTerSAWva5pEv7ttIPR4l+YQczMgiAn5eiXOUU6ksRsneWowfaJb1HvpsKw9nRKIOil59YXZpDRH4NVu8UijQCt+W0NCDWNstLYZTT7FM5CZR7ndaZCzMIvRrXodvru06cfR6yRmMIZVcEty/QjV35575ptkgqYnit42gVrCuPEQTLOIoaX82QfICjM/gejqQzjlLYFtx11UdiMfNTX5InaDZQoOo46vSt0oMI/yL9TuF+lGetx3QYwkk5xaHKFM03QenSZ3KOBzGeP2wzF67VBIi6ch7N0cwA0fP06fsNfFGnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LP3Qj/0u2zERQat29YJWm3O6dFPc9p7lzjz18gm/T34=;
 b=CHrvtDWJFNQfiJHyAXt+YAYl0HllqHoOJsxewgHhJpNAkMmLEw7PYuC2dGv59SD8jFfDVlEXIRmB0GJ0T2VfKpiMPtbGTlfSZno5XEEwHmhGndjwb+ZQG2BedQWFofBq4D1OEr/UDD38he8OPDT3w2CiNWl/ZEba5vI5qmuqjDNwXsXTm2mwD6UAZ6lv2rUeRd+Lqs+qmRIV3b8MKJd+fwl0AaRTA8hSUNH29qMbjgDxwW7n7O4132YRPqv1bUZUa/vIsq2w1XyglkWdqhWveq2d2UioJE1jtISeHxeiM+NwZy+mGEMTWtAV3z41hpMYDqM3z6EDiz9T4Ypg4mpZ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by SJ0PR03MB5455.namprd03.prod.outlook.com (2603:10b6:a03:27b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 15:38:06 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 15:38:06 +0000
Date: Fri, 9 Oct 2026 17:38:03 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Oder Chiou <oder_chiou@realtek.com>,
        Bard Liao <bardliao@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: codecs: rt5659: propagate GPIO errors
Message-ID: <askKUo6v6qCuXwSN@analog.com>
References: <20261009112204.33199-1-phucduc.bui@gmail.com>
 <20261009112204.33199-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261009112204.33199-2-phucduc.bui@gmail.com>
X-ClientProxiedBy: MM0P280CA0108.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:9::9)
 To BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|SJ0PR03MB5455:EE_
X-MS-Office365-Filtering-Correlation-Id: 00b9b985-e402-481a-0459-08df261b5023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qeQ9BVRQ/Zkx+lqOMID291Ba+vqfSY1zRMS/6yFXXilWbOPrkcnE+8uNl/I/dnvR+1F9RJk/9eaehhc2iZyMBr/uuWiUXyPLcirjvDPRJxmhE2mP9vkHNqy40KJ3y0ZZ5Itn4RqZhNa0+l/bah0C9EQXaJNRho7cBXKrfvKMWyQeq9Y3uvPXkU9ESmVf5h+yx2Sh+CqbLHENe+Z/K4pA2tp8UAW9sHqYB6GOhCqqchtQw7fcTeZKSNzcT598ICDp2DdzewXlEk4XUcTKYG12vB57hr23glczKixL2/YfsmBUOphcttKD41KsZVyDoXVux9elvmbJMPqB70RiFHwINw9jH0WHrt3qIwQ2AMdSrHnCQSsWTeYBkxzi1408Jl8nKQ+4F7m038IllEbhxj7cFQfHR0zt8lRJQL3Mbz8FQyiipVpuHhLRJB48/DOOrI8QElMLRcOwS7ZUBea7kqcUXTVkYHMpZO59C4twxwHn4GyYISwXMOHPMuUnWJV+UI7Rcz+UyTiGwV7iFMXDhrU67v9qyMKEetYwNCPwZJ9lRkBoM+rGaoUEDIzIwJKIeu1/Yplo6tV8luyRkVsQZDldvDyPePPb81BnLoFPzy5Srf7SnktoeYXsrZOxXEsPJx8yB1OSolioHipvuUsow9HVI5hB1XHXEzrG2xCI0/60Ebk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzZFQjh4UXRjeUQ5RkZTN283QmNUR3VCSGZNbnYvR2xEQWc1VlY5Z1R6bmIy?=
 =?utf-8?B?cnFRSy9yVUhvbEhrdGVZVForeWpPTDcvQ1ZZNHJ4dHZPUW1pMHZQUFNuN0tr?=
 =?utf-8?B?cEJtL010VmJ6d3k5REpoc0txb0hFK1QvTXJjMlFCem5ZSFkrTVlRNWRxTk82?=
 =?utf-8?B?Mkp2aXV2TkpEVDBBSFppOS9CaWFQL2Jyb0dzRW9iNm1CTFJTc2djM3lRWlJE?=
 =?utf-8?B?QnpnVTViRm1GdThSV3Izck1GUEJnWjgrQjc0QUY2c2NBelJ3VzN6S01kQXVT?=
 =?utf-8?B?TG9OT09sQmhUTFdiTklRVXdod3EwUVU2eU9VOXVmOU9vUG40eXNONS9qbmZI?=
 =?utf-8?B?bXZkemJta1dMRmRIM1ZzbXdCMjJmeEpJVU9PQjBWRzVaeWxLR3EvQUFNS1U0?=
 =?utf-8?B?UlIzR2daRmxPOGIvVE1Ba2w2UVZoMit3QThBVFpMeis4WXJMMG0waGdEMWVp?=
 =?utf-8?B?OEt6RVo2Sm1pbzJtSUpWM20rSjlzNmtGc1lpdjRrRXZjcjdBZWsxQTFHZldw?=
 =?utf-8?B?YnpkQjNYVitDYStnZmN0ZGJJampHbDdFdDAraEZHVG4zMnE2NFBiY0h5KzF1?=
 =?utf-8?B?eGhmckhpeDNjWXRyaU5YL2R3UVBSRzZWSUw1bTc3QTRSL1UyU0szZUhrRHk4?=
 =?utf-8?B?dDcyTXBYbXFGaHdJbUZXcUVLbXhMU0FpSTFJV3hZYXhDeVNEQkc4VjV1SUJO?=
 =?utf-8?B?YWxuRGUyQ253NC9iZEVHVXNjNjJUUGI2dGpmNy8zMFVTaXNWSHhBMUhrZHhQ?=
 =?utf-8?B?c05scTgxWkFqdTFVeVJEOWNaWTVTbUpMNlR3aHhObzczU2RtSmZ3eXgzUDJ1?=
 =?utf-8?B?akFkdmRHSTg3VXBPdzFUN25FRlNhTE5sUVpNY09LTGorcmpUOFdqUWdNQ3J1?=
 =?utf-8?B?YXhBZUJOclIxRXp1eG1LOVNFRTNTMHM2TmVLc1VrbzJDTCtLTnNzcG0xRm1I?=
 =?utf-8?B?cnZCT3J2anFtZ1grTDc0cDZ3dGlPdTd4OTc3cElDb3VFR0FmcUlYbDdxQzBs?=
 =?utf-8?B?VlljLzRwZUd6Zkw5QUJaZFV4aTRwNXJpUElCQytmZWJvUE8xN2JkZ28wSGVW?=
 =?utf-8?B?VkREM2NKTVVzcEZiWmxVaHZocER5Zm8vRENoNHppQmlsa1RDT1lFQzdIQkRh?=
 =?utf-8?B?eWlkc1F0b0ljOHlnYTRaOVB5TUlkN1V6Z3FIZlpqbWs5UWhSUUlpaXJlTHN4?=
 =?utf-8?B?N1JnVEorcU5ESXlKZ0dOY25YbndoODR2UG96STI2L21TcThnVTd4cVUrTzBi?=
 =?utf-8?B?aUZoWVdXVHVsdFBwZ0FnclhCSEVqL0pwQ3ltUUhBMnk2a0NpNlVYOCtySGFp?=
 =?utf-8?B?YlRqM0pxcytuQ2RnbTEzR3g0K3JlcDBseGZQT3QxKzlGVXF5bWc2Q25iWkpx?=
 =?utf-8?B?S0ZVdjgzQ2g4SlFMS3pTNUJZTExESkNkM3FTWFFEWjJIQzM3alpDOVZwamR3?=
 =?utf-8?B?K0NPZXFYSmEyNEJYeHVrRE1xY1QyakpXZXAydndRd2FFcE1jcEh0dm95WUlr?=
 =?utf-8?B?UVVnbDVBd3I1alFIMTlza0hDQ0ZaaWRSY0FrUExyQlI0ZWJyL001VFFzRlVG?=
 =?utf-8?B?TW90OTBZT1ZzRVFVcE83ZG1VeFkrQ1BhTEthbmRYSnNZS254UGFnK3YwdkR2?=
 =?utf-8?B?NjVuVUNDQzVhM1VnQlBDQTdQZnZuWFlkSUpENENpWUVrMSsvdk5SMUExaDFK?=
 =?utf-8?B?dVNHbjd3N2NPVElIeXlHVlJhemFNVnhPN3c5QnhaR0FxNjVHVHV6bVBqK3pm?=
 =?utf-8?B?cFpGU0JnVWZUUXEzNTVDUTIzNGxYekMxWEFsYzB1U1N4bi8wQ3ZIcENlUEQ3?=
 =?utf-8?B?aytvalJHU1NYVFlER2UwSCtIQTdaTnB3K2tzYWRjYmsrek5BakY1Ni82U2I1?=
 =?utf-8?B?eGtsQ2tmRU0zNnBWdmluTi96Q2JWL1QyNTBTU3R2SS9kSFdDYTl4Si95dDFa?=
 =?utf-8?B?UE9kby9FQVFtMGZFN0h6Zi9palAwcEVwRmcxUzRKWjFKN0FsdzgwZmM5Rllj?=
 =?utf-8?B?eHV4eTVXWU01SmJsV3Z6OVc5c0tiYTJpb1BkdTl0Z1RZYThDWXJDUjNWT0Iv?=
 =?utf-8?B?OHhTSnZiRW5ZS29TZUpVUUNhV09MV25wbzdQTTU2bTBoQm5vU2tQMjIzYjFl?=
 =?utf-8?B?QXZKQWtpTEFvQ3lMNDNCdEtOOGU1UEZFVkdaZktaeXFnNitTZEFRaHdOWGZR?=
 =?utf-8?B?R0Jjdy9xdlBoZmdOZTFUMjJPbXMxb3ZkNmNZUm0vS1E5M0xwVmVQcFphbGQy?=
 =?utf-8?B?d2lyM0crMDZ1VU5LcnNCZkw3OTFDb2dqY1kzTHNuR3g2aFRLK1dFbkc3alZK?=
 =?utf-8?B?enRjQSs5TDdMcm9NcitBM0t6Ly93ZXRrcHRkSC9Sc0U5Yng2NWpWZz09?=
X-Exchange-RoutingPolicyChecked:
	DkGt+0ONHhUCZEsw2E/wLhDK45Rlf2JOXxico1R7znmMdXhDzJPnuQzHkBjufq9rnkFn3daRw7KjLa7Gb/FvlEX+8SSnuUUY/OgO73ugxbmwETiMT4SuztEOZpyLmH82jdMzefXzutmQgVpx1Tm9oGhIUNLn/03KpppEajEMOleCWOtcplKIkoHICRwmwz4PCipuD91vs1lo55C5KLcnZqfllw6CgPQHIEEHLDytllx740dG8ilo95xiZueQvVOsYLzajQiwjJwyhJA5p7zbz1unC6cmmNd0+Ak/JfYLKhetWHYRPmrJjQR2d/2e7noNzq+KpezwrM5zzwun/sgkAw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b9b985-e402-481a-0459-08df261b5023
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 15:38:06.1218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hxvMyw5e9Pc6Z70+axCmHRxhYeLl784eQYiYwAcwT1304FPSOvtiycaSElxMdO8XtKbqFe+WtreH6KhIvS8c2mLP7eep5/w3GsjOfOi4GP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5455
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA2MiBTYWx0ZWRfXxrbC2g/+VWaD
 Ac3XCQuGT0oSHq27vkItMQJvf7bAOR7rhAu45D7BTTeEBRLGhcPyO9+oJQ7+gIBVag3r5W8hZO/
 pcAfW6T6winBJQ1qKtM8f0HYQoc8OFnd4qbDOoWvvFUC3kSg/LHs0XteWT3LMC5dmXzPdzl0IAz
 RToKJzgBfPY/SgHfiZFSO5fX3myy3XjaXTa6stMQDvIL5gWEk2WMpCBf73dQpyvLPky19l7ovN9
 ObNobSorYQqx8yBzY9OsK+c+T7Is143E24jVOEuNDhX/UWaBcUwdbMhl0vpok0GiTFl4wjiN3+B
 7SgA23cB+XevkGVdhgZRdAipOX/sPrLL9g/TL8LFeb7YWYvC/efDWfXAgkwqzjw+SWuscCWaBHT
 YatRtuhaYolsMvHSUxKFjls/Wg1EhpgDr2TA9HfzixssVk+diOd7OQbepl9jXAxKJZ7DB4qqL7V
 vdCNPqPu7hV+SbvPrFQ==
X-Authority-Analysis: v=2.4 cv=KvvYSmWN c=1 sm=1 tr=0 ts=6ac90a60 cx=c_pps
 a=wX+iSCk909IGAd/hxyKeOw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ZQxX5BWu6Z8IJBb2zLX7:22
 a=pGLkceISAAAA:8 a=gAnH3GRIAAAA:8 a=sBCNVmACGdOOaFpFyogA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: g1pfts4_CdFmYy32aoskqTRw3Txj1nKN
X-Proofpoint-GUID: g1pfts4_CdFmYy32aoskqTRw3Txj1nKN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA2MiBTYWx0ZWRfXxpn15cwfL/I8
 Qb4UCRVph/+Erj5sVc3D+ALtsza2mHYNfGXzO4ZzRJJGhCSndjca1dM5XcndVXjpf8Vu/v7vuiK
 J/zwvxt4nwgc6KDonKr4P3rEnCqGDFX9f874IR0cPYj5q3swDZsd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 adultscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090062

On Fri, Oct 09, 2026 at 06:22:04PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> devm_gpiod_get_optional() may return an error pointer, including
> -EPROBE_DEFER, but rt5659_i2c_probe() does not handle these errors
> for the ldo1-en GPIO and does not check for errors for the reset GPIO.
> 
> Check the return values and propagate GPIO lookup errors.
> 
> Fixes: d3cb2de2479b ("ASoC: rt5659: add rt5659 codec driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  sound/soc/codecs/rt5659.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
