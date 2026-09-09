Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012009.outbound.protection.outlook.com [40.93.195.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2EF3DC878;
	Wed,  9 Sep 2026 07:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938399; cv=fail; b=M1J1jVs3zutQRA4wpBd0B7FfSp4W/zIzfHLex+4feH1hz23ssD8wBl69NmVDrDwTW9B9+N1eRL8vP5vvYtmK0NCCIgZ2M0tqhSmJmp8EoSMqIPkbsg/H2T+nW6UBLuEJSlM0INEpMitbL/yiEn3gBdISSVo0hj23kYbNpasKPjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938399; c=relaxed/simple;
	bh=UUtucPOXr6yFzi4beVa4526GaQ4dIL7L3nztQrsse1g=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EtqHz8WcH5+Qe6GmhmofgtRdMpQoqpLAm2fv8EBbf7YCoGG08umKSR+wB1Fjco+K1E99z6r7lyyV3cHk/VTBe7gLxEFEGE1uldB1+JULjiohrD149JfD6Gm9ICUArrZKoMXIwRL9dRwQZWhoSY5oRffxzliM3Tb46o3+iEnEyNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=ScFNof53; arc=fail smtp.client-ip=40.93.195.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="ScFNof53"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFI0Qshh+OePZ6cKp0cVtVOLpRZNrKrnpZdyTVNnbKk4Gqss1D5Md3EXs2Bevva0XqtJRgRIYGVUkVm5p63kxdAMxfJW/JJzDcrml60HCwf07aDJK8Df/y6wS7naIPVLzb+mB9vt6RmO9LNzZ2DvO10pBkLJjBqXLO9di35rEnpBQK3jLCaFEktB0Mcv4aYbx+YfuQb5f1MqIAKzAybNkHLla1+Ur4sxBG8IyUyy1qFnksYZ1vv4/6IcwoaIzFhv+cygZ7ZhSIhBkK69XyiOw8akJsQmD67ZXT5BS8AvWCp8PVS81krEHnlzwo2eFP/724nb8RjPYX3CYOx+jGn3fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yGNjy6Tchi2sNjLoMYE/kahO0wMd70Ohwwyx0Y5DIg=;
 b=AuBkVPZkJAXdAUiFm+a+AwbmVmRJQwtmQlOKhVyWZyQ4ItKVctiXHll4UtWnLW7kYDl91Pz5Q+TrK+oa3DInTP2c1hna8pLgqJt0FTteUtkNRrIgDFB6gE3Igru1z1LOQuvAlURVerxjN2OICwNLJnMchwblJNIFa7ClaWpMEGUawjjJTV0odXU8hHzHDXGrxM0u5ED9ycJZjOeZ5JadOmidyKHAZMI6V3pAyTg1zyUoPg0SSGOyjwrU+0TqB5wAS2ghmZ1bfjZFM2teY3XU1bd0KPKcwuLqB8ErHSFUyBAshdY5ag6t/ElThgzO3BBICn+o2FpOVMKYnv7G1TPkrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yGNjy6Tchi2sNjLoMYE/kahO0wMd70Ohwwyx0Y5DIg=;
 b=ScFNof53WQTqUxBnMOcgNsZWSrzk7u7OZBw+YnIzK/MSC7a0NCQHwYymTEEamxJZOrLRLa0xxU7cKbIJcwpHucHJhMGPW6nSjgrbBiHOnky+voH15RfsIeWgiWWarJuMxhxQdnb3LHIJ6IkHeLIL7plC5CnCJoYXgti0kHNhouaghksvTNhdeOJQe0enPQYp1ULTAxkGJMLYhnCbGjLC0T9WmXVoM1k02FMahGusw7MJ/tV7x8x5/2wpIrxQ28gdp0faX3807PQOr24HrYWph4eYgwd17VDMtiGY/X7ZOXn1unteoLEOxZ8JaNxUkYlbLgc92dFjq2fmnni71RKPfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23)
 by DM6PR03MB5146.namprd03.prod.outlook.com (2603:10b6:5:1e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 07:19:55 +0000
Received: from DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b]) by DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b%4]) with mapi id 15.21.0382.012; Wed, 9 Sep 2026
 07:19:55 +0000
Message-ID: <40947009-9861-49e4-8b60-80f81d8c5b8b@altera.com>
Date: Wed, 9 Sep 2026 15:19:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: altera: move all SoCFPGA device trees from
 dts/intel
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <802bf0d27fbff9b1ddb6b9fc323a1a9f8f050f74.1788512748.git.evon.chiam@altera.com>
 <114057e1-f35b-4ca4-ae8f-dd2fd66180b3@kernel.org>
Content-Language: en-US
From: "Chiam, Evon" <evon.chiam@altera.com>
In-Reply-To: <114057e1-f35b-4ca4-ae8f-dd2fd66180b3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0016.APCP153.PROD.OUTLOOK.COM (2603:1096::26) To
 DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:EE_|DM6PR03MB5146:EE_
X-MS-Office365-Filtering-Correlation-Id: cbbe0c38-6518-4a71-d139-08df0e42bf5c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	ddIvP551Wi8dAt2/YGxXAFuYZdKBnf1MJgkUx+XHQBnJfecunNDDM1pzSjrO12KnevKxASvY5N2GDqA0PuUbMZFdgQ9yEYCEvSL+hEcYyLdxteW2L7QvPE1LzM8pp7pqF+36Uvm0L1OVkC9iguxWx0jCl4/Ob6LZKEDjuqH19yyEU6V6fEDsyelPhKJQe2Oyb9JiZCrBmxEfAW4p5gt4ZiQ54Gx9ttsdP8nd3bBQUsCn6iwRxICGBmE3ug4l5kVKzpoFR+NrQRm6swSGX18tQ7T2ZsubpTOxFt9P8EjDO9WsAPIkGEnqZ8pg0xqYLj31ScJGDwkNtcMu6HBhqjB8RU/HZq+DHg+6DjelaBn7AvKO9rCqMAG5peZYK4AwrvZZ9+Kq9d44IaLj/k7Ww7rc89ynU7C1HNEEXtpNEDJf9h+pN2AWfcK6RmKdkebTo4EnOIQydKWbXHEcyVGkfGbDjV1NXO6nhAiznfmvweAEx622EpCPdPculw86pH3LaaLeHVM41sfDFxCVGrAItHTzh+SBYwbaai2egbCec84mTdVax6JYiRM2U8BAt0Ks1FpHXmL4hcJJ9JnOWq+jAQXS9nAMXRabjb6QrFGUal7RkstK7/h/xZTj4l7jZM0H9cuxICXYIPJQdy7n/OLAXA3UWYHLHTPp5aXrP8M9deGeFKI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6192.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXZFQUNSMWdySzdXcGpLbVhjZldVSzBsTWFwMXRZVEFNSWNyT3RpREtETDNk?=
 =?utf-8?B?VS9DSFJqanY5eVpZWk5OZEYvUGcwaHE0Q2xaRnliOURtUzdoUVBvbGZlZk9W?=
 =?utf-8?B?WlluQXI5QlUrc0plNnFZVHQrdzhrR0V0UFo2Ynl5N1ZqbU9zMmFRaVRsY1Nm?=
 =?utf-8?B?ZFExY2J6TlBBWWVHLzNJU3ZqcW9RS2dvaEpIcGJzSmxGT2xMVG90ZUltWVdz?=
 =?utf-8?B?Uis2RTdudVhJYS82bkV5bnd4UEI4djdBUW5Oc0VhRjJHNXRiL05Zd1ArR0kw?=
 =?utf-8?B?RmlkaEh3TW9HS0U4eEJ0c2pLY3U4dnVTaEErT1UxbyswTUFqRFh4L0R0cXo1?=
 =?utf-8?B?elQrcXZZZmFoVU1RUDNrazZ4NmduN1Vqemd2UVVaNU5uMHVrV09VdGI1ckVt?=
 =?utf-8?B?bWVqRFZZdlZPeHdvV3EvazBjUU5zR05OdWlKRUEvSmRMeFRDelZqSVZyczBz?=
 =?utf-8?B?QUs1VFhpNHFXZDRYelZuanR4ZGZSMEJ1NUJncHdrNjZoYlBJb0wxL0FlM0Rx?=
 =?utf-8?B?YjkwbFpjYlBpdHAvS3NtWHk2MHJqZnpFbUNoWFpncGgrVEZ4cnR3VHgxdjJn?=
 =?utf-8?B?TUV0Smd5MnJGUjRyZHEwUklUSFpPZWE2eEJYZllmM1B0dUJPUFgzQldQMUZT?=
 =?utf-8?B?ZUE1cHA0a0psR2dRTG5TcURuUGNWa2E4Mkg3Wnl3ay9ORUtXUGsxb1o0dkVS?=
 =?utf-8?B?RUVCMU1MRC84S3pxekQwVVl4dHhMY1NXOWlDK2xTSVlBVzhWcEF1YWNDaGNl?=
 =?utf-8?B?cU1jVzVQTlpTRHhrbjZpY0lpRmxhSW9COWNyR1djZS96VHc1dDFRbVpXbW1R?=
 =?utf-8?B?WDBxVSszbVZKM3hnVnJYcGY3b0RRSDk1OFJWMjFuRXlVL1FhMlM2cHZvdUVN?=
 =?utf-8?B?NFJrM1Z3c3pTYzdEYkxRbXRtbjNnTDhUY2pBVW9QR3kxYnVLN2NWSi9lODZu?=
 =?utf-8?B?bWNuYkVuK203dzZxWWIyUFZDT2pTa2VwYlZERjlMU29aeUVKWDh6TXEwWGN4?=
 =?utf-8?B?Wmx0OVE3cWtkWk5nczQ2ajM3QmNMV0Fpc2NIaWNjK1NZU1NUMEx2SWp1bVVP?=
 =?utf-8?B?ZWN5WFdyK3FmNDFZb09pRit6d2dzTUpWcFovMUhXVGcxMXhYWUgwWnoyN25k?=
 =?utf-8?B?VlZTVHQ3RE9lUWRSMEFPaGE4Vk9ic085TXJmME1qQ0FNd3YvcWVwSmNSTW1L?=
 =?utf-8?B?dTNnOVpCOHl5VjkzdVY1ckI0TjYzRVorcm9tZWxoalB5QXR1Vm95bHB0Vmoz?=
 =?utf-8?B?WURNamg0U0VJcmR1MktKNnRQalQ5RlcxUkhKTGxQZ0JpU1ZaTHZGZHRiVTBh?=
 =?utf-8?B?YnVyODN2QU03djRSaEd6elYvR0QxSVdZL0dQQ2JSVVF2cGtRdm5oZldTb3Ny?=
 =?utf-8?B?MWxKY2kwNTRZdjNRaXhMaTIyY1ozMFlUWkJxSmxNQkwvRFVxUGd0N0RYUGZC?=
 =?utf-8?B?aWhOMmRqTnhNblBTdGt1dzVwMFNqRlRIcFkvcXIvQ1lnd0txbnc5SE1YZ1JX?=
 =?utf-8?B?ZW93N0psNVduQmRZMWpwWk5JTENoUVJrZHpVbUh6TnZpQmtPUnV5bHdNVXNX?=
 =?utf-8?B?cGM5VWcrTG1ZVTh6dkM4MDdiQnlaRTlSQ0VGanVDQlZ3WUF3Y292M3FzK09L?=
 =?utf-8?B?YkxKQ1ljOEhZRVFtYk9mZE1mQ0Vwc01yOFlhWjFoUmllQjN4MWJVWDlQdHNX?=
 =?utf-8?B?M2RKbGJPcjNQTEUwRm5SZm4reTZFKzh1V1BDZGE5cmhaUzlnZUlsMjBTcGZG?=
 =?utf-8?B?Q016Vi83TUU4Mjl5bkVBZlRPS2ZYQkRPN1ZoTWNja01kM0tQS2E5UjE5OVJZ?=
 =?utf-8?B?Z0tiVmlFd2VheTBJclo4ZWZCaHd5Ykk1YURLbWFsSHl0eDFFaGNVZTc2THIx?=
 =?utf-8?B?VlViY1ROYUFYWkFPOG96V0R6WUhvdlVHbnl3WVdsNVdCblRKMXBkelNKVkNF?=
 =?utf-8?B?Zk1vRGFwNzdWM0N5ZC9LK0JlVzZBZEtkTEVjSEpETEJwVzJTZGVZUDBrK3Zv?=
 =?utf-8?B?TXMyZTMyMHcvcXZuWHpZUEFYSzVNaXZPK1hkbE9mcWdJSjByT3RaRG53NWNY?=
 =?utf-8?B?K1M2OWpvdXhpZ1dNU1crc0lPN3U1dHRnYVJsTHNVcTdncjJFY1pXakN4WHZS?=
 =?utf-8?B?SXI2RHVsOE0vREJCNEFIZWFJRFkvY251KytKd3FXMHhOWC9BRU9UV0VhTkFP?=
 =?utf-8?B?Vmp2bk5JaFZvRW8vR1lHYVYrN1VYZDBHalhWNnZzQ09iSXlHc21WTWlGYTZl?=
 =?utf-8?B?SnJhOXdDcmpneTNvYlZYV0haczNRdml3Nlp0VEZqRzlXS2FzVEpVcG5td2gz?=
 =?utf-8?B?OCtBMGpqbUhVdWptVVNKb0JRNGw0WU5hNllXK2lRN21zVjJtN3h3UT09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbbe0c38-6518-4a71-d139-08df0e42bf5c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6192.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 07:19:55.1900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pgnST7xtEcyQOng0i+oT4AVyBacE/OFk6gaS/JZ72OU1tshoSHIdeZrcagzhrTeX30g6aSIpKbeFNjfXl/844Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5146

Hi Dinh

On 8/9/2026 6:18 pm, Dinh Nguyen wrote:
> 
> 
> On 9/4/26 18:06, evon.chiam@altera.com wrote:
>> From: "Chiam, Evon" <evon.chiam@altera.com>
>>
>> The dts/intel/ directory contains two distinct families:
>> - Altera SoCFPGA platforms (Stratix 10, Agilex, Agilex5, Agilex72,
>>    Agilex7M, N5X)
>> - Intel Keembay
>>
> Nit: replace "device trees" in your commit header with either "support" 
> or "files" . The "dts" in the header is already saying these are changes 
> to device trees.
> 
> Also replace "from dts/intel" to "to dts/altera".
> 
> Dinh

Fixed the subject in v2 and reworded it as suggested.
https://lore.kernel.org/all/4b78273b85041f74b12245d0bf222f018afd2bd6.1788933630.git.evon.chiam@altera.com/

Thanks and regards,
Evon
