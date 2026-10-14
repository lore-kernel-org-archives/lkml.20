Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011054.outbound.protection.outlook.com [40.93.194.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBD64B1468;
	Wed, 14 Oct 2026 11:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978550; cv=fail; b=FNRK6dYAuE0ax4YHkTJ7JEO0CsaezabzBHe1V+xhMSVkyvfszB1xIKRs3NacCbFLwJvqaCdvdHBgCsFhSAuiX4W9YZWwiNE3dxb4fFGWI8uH12T8FZzzNGLtnSFwofYTSYVK5l8beN+ZyBqXvQrlYLpy+jwG3TEHgp02gAj6C5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978550; c=relaxed/simple;
	bh=uUgMeSo5cFaiN44gHjtusgY+9qBSh/lrSo2ki28xhSw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lILrGQ6Jb4C4/mW74zTXcXCURJj9SYI1VK+3TnYKNE8MoGmFMqTXyTrU/MTAmFVkTnAVl6d/6Kg22UpGZz5KNH7sJTjrvBxROfjN3Pz3B8vfbNlx3/++YTue8Ca1/tR/tNcWoo0MwlXIR4bUTNyo9ypp70MWxVQ77VTgqdFylAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LtobhNwS; arc=fail smtp.client-ip=40.93.194.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LtobhNwS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DzuLgECYoKvo7zR8aHyPl6S/ZHn7oDpM5Sb8c1siBUe343o3BYL+wp0XjPCiJN36sIeYLjWVKQbv10AQDJs/C/P8S1NX6QfZpDvykubSRExBaIv7k2HDFTE0Q3pLOlWHwsEAhxbDDO1/lON/awmQntmSwZSbZ77WIxM1n7oDk0keET9+lR72gNY5qNsVapRrL1K1bp5jdU3yTjG4AXAkUQjnMq0TL8t3D4JwNLh+SW3Rd/nR1xIyx/4pLHkH5QROL+Og7+Ensd0fgAWCB7GOMpMiWkLWF8FYqFgDLi76JY6qgRndlYIqzMF/0J9i15pnuCd6T3HMEkBg7XDYh5NNTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUgMeSo5cFaiN44gHjtusgY+9qBSh/lrSo2ki28xhSw=;
 b=yw8iTVv3XPfoUBWwWdd+/7RJjGO1kum191mjtJbwwdki+DxFkhJBSf0CRf5DwCN3KEzMcZqmcfiMMewwUfq36A1XRH9bR3F8Mw1rvINn2FaAk7K8U4v1uKzXBxOTdlqEnGPEbospCLx9riecnfh3jZYOXkUERgfay87zSbRB5gHMEOhc4ndljEeHc4aEsXFgwJg8d9HFH3QnkLbBnhChbhno9f+09RKrpcZsgvtbblf2WfGjhbVvjz6LI813ygMjsz+5A5D4V6J6VS35+d0ZR4d9kjZb00ncGQK2TUdgSy6IJw/MCvR6Nkys6FbG4wxNJaGZe4NU20mZgKYKKWHD0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUgMeSo5cFaiN44gHjtusgY+9qBSh/lrSo2ki28xhSw=;
 b=LtobhNwSDwGczfryUfRBkHm60+elgfA6y02eeqJ9lwmfdwWIsouDVf6P6FB3QvaCRIzdFwGECFDfldxR7nTf/qV2JsVRXkFv7gWceTRaBS9FAFgRhinKEQXNglP3MGlFVapuaKKoAC1jaTFXxbuKxwXP/xMsUBo1oVRwbpVsSRQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 IA0PPF0C93AC97B.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bc7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 11:49:00 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 11:49:00 +0000
Message-ID: <031c7453-9652-4573-9de0-5db2a795562c@amd.com>
Date: Wed, 14 Oct 2026 17:21:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] ASoC: SOF/amd: ACP7.B support and ASP carveout
 firmware loading
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
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <a22f2a9b-3bb9-40d0-80d6-4ce36758c4f5@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYP287CA0089.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b6::6) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|IA0PPF0C93AC97B:EE_
X-MS-Office365-Filtering-Correlation-Id: 1196a510-64d3-41d7-e274-08df29e922b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|261009223027099003|4143699003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	b6DSCquS4MfIvZvqhJSkKgrx4RazbRqf750xHBX0TSUZ4I2HFRWiIKyasL8OmG75Sw0Q79j2/3NSmrCxQLI+kkcQAmGS/oaN8Kv4FBH+Cq9xSlvLRt3kyJQrVrnEETETT9zUANNbmss+aAC+0q46NZxoDsJDT02wk5XtyffjT2yYr6KCKDXMkea4f1MJkTMbrTuqGA59lahkGhsxqhGEMyyhPyRo1lmZpI1qJ2jgEhrm3nW2YxBEVwXDrpNbf5cOh3yDxDy1R83OiKIk/Zz8JD5hyjJKU1hlg0U2qrTXLjqpNmRM/+5W0GDmtibTgGjtsSMVpW+KUSqp312NFcCiT68Nar89ovxAGwBN+8WMjuTf+lqeq51YmFgWM9UyuNqUAzD6SYDnYTG97whIoEluQgkVbVmLwtSLENMDQWdPm/Rtx3K5bW2pIhc2hl+w+RwMY5HT7FTMDSu0TqALkALB5Ued6UBnUK0UO2DOeYBX+VwyJWvzwwWK4uSjOekgaI2sLHn195KTCSoqk2nxiChl+bBqDD9GuhbWzk487EDiZ3dacmYDR+kBsJ/De9MVi/PbRnClu3YTloubiEAUx1gP6VCptetjrBiTB/1M737mPeA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(261009223027099003)(4143699003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3paUzF6dnhLVktTVjBZQ2pCZ09iS1ZFM24vbmI1YkxPM0djTEQ0ZEt6NE4r?=
 =?utf-8?B?d1ovQkEveVh2SE4zNXFvRUtqN0dKbG83VVErZUJpa0RRN3JRdUJxUlY1TktE?=
 =?utf-8?B?eHBsR3J4WlVUTHUzcFY2V3MrQm1yUGI3NjlsYzJKMmh1cTNTbFFLc2JMUC9s?=
 =?utf-8?B?emJ0U3htcG5peVIyVDdRdFlyOGF5OSt0NFRLNWFjQ0ZyVEpYU3RKWjFEZFhK?=
 =?utf-8?B?aTJUK0F4MGlqSWNERmwxUnJDNzBiUWRzWnVwSWVmM3BNUkVEOWVCek10am9h?=
 =?utf-8?B?dU1IM2VLVndQWWNVM0pLRWtCTG1WVFBBeGdTdmNmUmFkTjM0NGI5ODk4djZv?=
 =?utf-8?B?blhIbm00RG5GM0kzTzhIUW9BcXU1SGFCcW9lNWVtbURrNnF6KzlxejEvUmR5?=
 =?utf-8?B?d2kzODMrUld6MjNseXdPK1Bxa0FWdzNpK2RuZkxSdTYrdGlISndDVmp1VUth?=
 =?utf-8?B?c3ZiMm5ZTGFMalVLOWwyUGx6SEtzR2x0SEIrQjhiUmlHZDh2M1VYVDc4TmhQ?=
 =?utf-8?B?TlNkWElSSm1SQ1A5MkRQdEhheUwwWDQ2VTQ3cU91UkU5MXJaTDM3R24rdkd3?=
 =?utf-8?B?MXdDK2oxeTQxaHlMU2tjQ3JrMk54b0ZEaUxCVW9qZk5lU09EWGtXMHMrUUtK?=
 =?utf-8?B?dVllU2NRQ0JSVG5mSzY4bVB6Z2J6ekpoaHNicVh0dFJFbDRTUzV0cTlPRVFy?=
 =?utf-8?B?Sjczc1BuRTJ6d25Md0hnMm5Yd1VCLzIvamxQazZyMldqRkduVk1Rb3lrcFRL?=
 =?utf-8?B?TUxra1N5bE1UT1lnSEZlN2p5Tm9jRmFHLzhodWFMNVVoQkY1eFNWTjBvNm5Y?=
 =?utf-8?B?UnE0THlrWDR0ZlhuaklvclE3TEVubGxyWklEYTNTbzJLbU5IeVVDSSt3eVpm?=
 =?utf-8?B?WUlsbUovdWV4eXpIWEJQSHR5c2FZQWNzU0QrQWNJVytrU0c2NDVaOE5FUC9L?=
 =?utf-8?B?OGt1YkdVVUUrR0tjRWlaMFBqYWl6cUo5VFNheUZyakRxcFVNN1VHMXZXSnlj?=
 =?utf-8?B?Uk9YTklhTUNKc3VMQkI3MTFHdHNxYkw0RGdveHhxcy9CTkh1OE1JdmZqRFY5?=
 =?utf-8?B?UmFKUkJhTkx3bEg1b0RVR0VSSDhESlRoeFpUZEZoSVNxeVErb0psVjAxQWFj?=
 =?utf-8?B?VGVLdTJRa2ViSE5kcitoTXNXNWQ2SWdsRURNTUpyblBsRHRRZElISmtXUHZu?=
 =?utf-8?B?aUo4dy9PVFZ4alFrSW03L0dSYmNpQnpqbVYxRFl0bGt0UEZwcWhoZ0F5b2Qv?=
 =?utf-8?B?M1k3N0c4bDBUbFVIQVdzcE4vcE5qeGl2eVcvRFZuMU51TGRyMUNGVjgzNkht?=
 =?utf-8?B?TStiNjhkQkxHRjZnVjdtQTl4aitic1h4Szlmd3VLRUlIK0R6SHk4MVpWTGFZ?=
 =?utf-8?B?L0JvNnhNcUNsNThPZFcvclFJOWswQWZlL2RnS0lvLzZJRTJrQlVYVHdjc3hs?=
 =?utf-8?B?VFV3VzJSRDVTd0NReGZRLy9CU3BPNlJ0NmVkdSs4STZPZDRrakdLQiszcDhX?=
 =?utf-8?B?MXprS2FxTjZ0TFNHNjJ6bFNrVEExbkFLTVk1NzNTOUl3RmxwMXFSODNLK2Nz?=
 =?utf-8?B?Wk1yOHJ6dlRJYlk0OS9sN2k4azhtbmgrVUF4YzBmM05JbHlnMC9nN1RlOFBs?=
 =?utf-8?B?RzBnanJ2cm1ibXR4ckhUN2RjV09FV1U2YnZTcEtURjVraHhUci9lTXdqaGp4?=
 =?utf-8?B?YTRCdzM3U3JFZi9NWWNSZXh4LzBuOWVZcXhNWGhSQW50YnF2RWV6TUdUT0Vp?=
 =?utf-8?B?anQ1OGdVL3ZtUTJnWmFYMm5DU1VpbmJWNE5TYXlWVkZkejBTUWRabDMyUmxr?=
 =?utf-8?B?WXNQTWhYSEJ2UGFZbUJaelpQUlM1T01UbkJZSWY4bFpwTE44THk2RUNudHdC?=
 =?utf-8?B?ZWh4Q2NQUnVscEJtd0MyOUxlMk96UkFyaUFjZmtVSjhOc0FvZi9IbDM5VllW?=
 =?utf-8?B?NTVHdDNUQXo4dkRvZ080NlB1VVN4MlhucjBpbU5vYWRPaHFkZDh5TmtXelpv?=
 =?utf-8?B?UEhqUGZOM2ZuakdEMHJCT3pjN0RVS0NXOGdoeTI3KytVZ25NTzRFMkpHblIx?=
 =?utf-8?B?L2dzRVFNSjJRYU90bCtGK29PRGxvQ0E3RFdDSlJRcXRkWXcwR3VMRVhORE1B?=
 =?utf-8?B?cWEyeUdIVUxpWEhobGliSEdTTTZ0M2dsQnlQUHAycVNEZWoya01FM3pFWW1T?=
 =?utf-8?B?ME9ZTXNXcWF5SkZuM1hJU2Zhd3o0bnZGSkJoRmtYRE1yY3c4dmVzaGFhc2d0?=
 =?utf-8?B?M3dya0JreFFITVlmVWhPc1R0TVhteWZrYWR1MFFKZlFHbFN2eXBLTkIrayti?=
 =?utf-8?B?SERSNVBpS0RvZlRIOUR1QTlUNEVUVXl1eW8vVzRhWlBqUzNIR3dndz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1196a510-64d3-41d7-e274-08df29e922b9
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 11:49:00.0353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bN++hWO9kwLl6ZUQ8k6eI4StZ1N/uCoAoozpCMvHYArgPBdIzBhNCQ2iqn5svsejhd6pXGsPYNyjBscu1UpYog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF0C93AC97B

On 14/10/26 16:14, Mark Brown wrote:
> On Wed, Oct 14, 2026 at 03:29:08PM +0530, Vijendar Mukunda wrote:
>> This series adds ACP7.B platform support to the AMD SOF driver stack
>> and implements the ASP-authenticated firmware load path required by
>> both ACP7.B and ACP7.F.
> v1 is already in my CI queue, can you send an incremental change with
> the new stuff in here.
Posted an incremental patch set on top of v1.
https://lore.kernel.org/alsa-devel/20261013154644.3788064-1-Vijendar.Mukunda@amd.com/T/#m6b17b469c043e46ee50a3a85903324c896c81c4e


