Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023096.outbound.protection.outlook.com [52.101.127.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A8E4E66A1;
	Tue, 29 Sep 2026 09:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674886; cv=fail; b=PgpJx5xS9N7TbWtF8GTKspPgvApoRovHWLNAUP93lQhAxx4E+pnyrkMpRHw8Kq6YBT8Poq/VXhRKJsBaEp7zpIOqbZp3fZnif99EPBmBugyW8BdRuDT1cF8wjDoxAL4FhZSz9NEi5elfP0K/WGOkioeVmGoShZv5KjnYHPNbGVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674886; c=relaxed/simple;
	bh=yTWH1B2JMLo5dto4xsxhUDGPzeR211ghR21LbFPAEJ8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MmfDnnNee504XVt3MA7euq9RaqAZcSlUy0/ILoSTfbG68bA0uIbaVgLY3ndGs+uimwxPw8jP6L6ZUEyFxowKb+XR485WHZ/Ydse+intTWBXUxKSJ/mwSK+MaZicwLMFe36SIEioH8UoyfG2gsrzJlYvTq+o2hq30SeEnUaVQ9E4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=T1479drB; arc=fail smtp.client-ip=52.101.127.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="T1479drB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UuG3hvyVyPe29V7Ct9FQNAJmMaGx9Ot3MKSW7j3JDqiN9QXb6vzfixyO2HIEj099qvYEBRsrOh20BMS+gbJr9uBWojo4UXdjlAjD+pyGHYub/1r4i7+rlI/njcNmwNQMCKEyCVl8o6p41qMgsd4t+qkkyRWaPCzKXk70Z4Ayll0rwLcPLg1b+bbcgehWFHEN2vDTLRZik2HcTD8+5MCV7dQr+ccnYjZ0dMuvTb2NAF6f7WHAmuRlq0FJJUIjk8kOpBvQGKnlJ6MyfEvWvHYJfzEkCFFBq9T0PkVW0OVTjS5qBZDVStvBKRFVKFFRRilKc4gseSUSJXGK7Ts2b3ksnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFhYE31qj5dyqcrQZiuC/xCAEvuQfOsYebE3VHwAdgA=;
 b=ZWZ7eNfcMljl/6t+vLaH7N6IhQra6zJ3ABnVDw53ogIlsh53p7douhjdAGGfGqzXHGybXw4ROqk/8blwe/MalyUSZVBvCgSQXq0kPXpRSUlhRSR08aXlXy0DBV9Zoov7kHzT7102g1eo0uuBl1OUbvTc3EWxazcmYmg+hfmoj8rpPzM1DsHKRy4Cc3K+FvTPgCNoLJvYZfQ6E5bATfRhJU7TqgwCW3+dUK5w0Kafw3T1WzKKMQo+ojwFnVhreUH+9BQGV0BPC1eVefqEFxv3940km6UUtfeXCm9VVx8SdMawidhJb2cs+NbYZHYArEHQdSfT4hHZnn7uM4OWHee9tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFhYE31qj5dyqcrQZiuC/xCAEvuQfOsYebE3VHwAdgA=;
 b=T1479drBsc9KMBIBFfk8pKz5ksXcFXNKmWWRxFvjlhaukqeZDsS/EBs4RCd1cIZ7eNh0ayhUt378MPdEux0d+wcrvvuxmm41KSBwSMVHOQlceL+aB4eNgcup2apbuAgzlYH5O/Tngp4kb1T0E1zY7x2+Rq3+uRAmbIF61BGXqCRwjE82mKxxkxAiC4rNFx77TO9hXg5M4dujY9Eh1Jyx2iNW6ZHglnofZVE+LwmQfCdt4+toVogTwIWnlxiWf7pBEPNBOdZSlEyI0zEQIpyDJgse2FqDpR9WXF8Fx6B7SEo9WDFIxJ5hiPDun1hY+C6Ed6iF+kqHZlTQ+uvlYOow8A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by SE3PR03MB9967.apcprd03.prod.outlook.com (2603:1096:101:336::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 09:41:22 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 09:41:22 +0000
Message-ID: <e0f29358-f5e8-4bf5-83aa-dba342b49e07@amlogic.com>
Date: Tue, 29 Sep 2026 17:41:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/6] media: dt-bindings: Add Amlogic V4L2 video
 decoder
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20260924-b4-s4-vdec-upstream-v10-0-1289303a58a4@amlogic.com>
 <20260924-b4-s4-vdec-upstream-v10-3-1289303a58a4@amlogic.com>
 <20260928-efficient-secret-manatee-2fcca6@quoll>
 <7fe35ef7-e894-4137-975a-9a5f621a8156@amlogic.com>
 <33499600-5df7-48fb-a2ac-5a703df8dc2d@kernel.org>
 <59541a34-eba9-4699-ba19-69e7b5b1525a@amlogic.com>
 <3b1e23f0-76d5-489c-a5eb-0774a21b0f63@kernel.org>
 <ab0e83e6-c0a1-4c8d-847d-81628c49a436@amlogic.com>
 <d4f72cef-0973-4f98-9c9e-277894f72a6a@kernel.org>
 <d89c3a48-a90b-4dba-aade-a71c57458f9d@amlogic.com>
 <9679c161-d36c-401b-80a7-46b0524a7eaf@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <9679c161-d36c-401b-80a7-46b0524a7eaf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SEWP216CA0022.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::19) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|SE3PR03MB9967:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e4c0b29-0935-4989-0b99-08df1e0dd236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|4143699003|10067099003|3023799007|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OHTctk64OtWxPUmh1uga7obOuVkxZcyqrQB09HQ7HOlCiyqN7eLVkamq188Xnx9kjyY1CcYsjb3DELgdrbTz76SEsM+zVBn3/NWXfzQQ0O0/lknxm9wIkS0DBqkOb2ckQlPltpedEBuP3ZRU8obwhts5anBhmIfs/JbCfMMLnX7xMYvgayNlYK4+1TM0El7iwcyokibEFRkYSTH3RkSzt+iENEf4s9au9i4Dvhl6YfHxanbxKHRhdZHZMnUcVLE8kN0zqm8IpyztAsaUthDTkNanIBNSklbnlXKmoDsmxpBJBeecUbLn0kpmezV6Ht9dlsxw2ELBZ3DdnzhLGvVe+xKGBMiX1akXrZBx9WZWJ5bpnJzLdL2ejL2X8cn1oMm2061NIhku/QmAV4xOQ18qrcWjc5vjn4CK4g+cO/qhv5Rb+3717olto0IKszYPwwI7Jh9I4DQq+WFiUfyf7/EstnfeG8SiT9FLoYDwrZfMGTIB5e0XEuCc7/bnS6ZmJ4aI5UitGUa6HtMreFC7E3XHgiIHR0Xc7YrWeqdC1K3ru95gveWtLrnLsWVHFYt8KXG7cA5zNvW5imN2BbyggpCBIaAFA76kUnb5eg7IF2Sm2uma9jYBqVQlP6VHJldTPRP9g00wFbZ4elxjsTDBZkcdtjuDyCfnHwEGRsSeT+SVTYo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(4143699003)(10067099003)(3023799007)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2FnNnBoYUcwMWxWbVpta0p0VGd6N2Y3TXFaTGtURjZkd3l5TW9MbzlnZk5o?=
 =?utf-8?B?dS9admt6VU5FSFpTVE1oMzZLOG1VejIzZTdxaHFHQ0ppa1Z6ZnN0Tno4WVVa?=
 =?utf-8?B?RXZrejlsU2tFSlc5Z0JRZU5ra1Nzcnk4cFovSy8rdTAra2F0VklDd002WXA0?=
 =?utf-8?B?L0pNalNJQmFMcnpHQklvS3FOZVFRV0FGeFVzbjFVdFZwcXBpS2dCbkVZVVNC?=
 =?utf-8?B?eGUwMWY2NWRYbzd0amVqcm5HOW9xOHRFRitoSzMzZ2I2RC9jYU9WY291UlFv?=
 =?utf-8?B?SlozTGhDK2tOUFRocklqOFk0MU9LeFlqNGc5ZEJCbzFpOFR4VENSVnh3U3Nw?=
 =?utf-8?B?OXgzU0dVQ1dFeWpQY2dZTHhmNktRMzdnZ0NqN3hSQ3RRWU83RXg4YUVUQkY4?=
 =?utf-8?B?VUN4cHRGVWlXUTVVVmZWL1N6OS9KS3llOWc1Z3JXdDFMV2xtZzJuZGczWVFw?=
 =?utf-8?B?aURBc2owTWkwUkZXcGc1OWhmWWxtK1BkNEcwVHBzNXpsT3lqWTVDcXo4Qkh6?=
 =?utf-8?B?Z2ZEdjJ2NjRYODFzVWNpSmdDamxQeG1CZXRJc3FuV09wMDhLWVFLc01ETU9S?=
 =?utf-8?B?OW8wZm1WQW1nQ2VBc3NYdDU0QkRReXZpUFNhNUlScnAxSittaGNaUm9sMDU2?=
 =?utf-8?B?aU96bCtJcERqRmx5RUl6SnhyTUlPeGV4bVB4My9VVnBEK3FCZ0V0NWVjVTZw?=
 =?utf-8?B?K3o5dXVUdW1RNnhkaDUxR1J6am1PR2JSVUp1clBYMnFBaWhnNHBCY3lHVWVk?=
 =?utf-8?B?N3hLVUk2cUJ1Q0JzWi82bG5BZzcvWGRzQzlpMnJUZnlDL0dGNUlGb3ZkdjZB?=
 =?utf-8?B?dk5zYm5HZDFMRVZLQXZqU0MvWjU5cDZFRWcxVEtRcmFuNDBpRTltSGRPWVdY?=
 =?utf-8?B?bjZGN2ZUOElvTlZmb0tJWnUwZHJCbWRUbFRHQmMzbDErUGNlK1dRRFMzZ2p5?=
 =?utf-8?B?RFB4RGcyTGcxWnhwS053OEdxbGdMaVNQQndxN2xOdEpSaG9vdWh2cVI4dHJI?=
 =?utf-8?B?M0JWdnlZT2kzZmNvVDlheVFBNklyMGpQSzFmSjBaNitMbElNWWRhSFVsaUtW?=
 =?utf-8?B?amZkb1JiV3FUZ2NtZW9PcjNjU2JqSWJ6TDVmMURoZDVVZzVONzMxRnh6Z1BC?=
 =?utf-8?B?ZUVkS29hUkluWHNBdFQwWnBuTHdvUTRFTzZUdnNic0ZVYm9LTGdLeGJvZnU4?=
 =?utf-8?B?UC96UDNUN2RKQm1qVVNpQVBRS3JJMFJiRlppYmNkMVNKTDQ5RU1hZW0wVTNv?=
 =?utf-8?B?d09sTmtrWGFuYUtZLzBiYklTakt4NS9PYWR4NFJEdlVWbVJrenhoYVVvMit6?=
 =?utf-8?B?amtjckU3czUvWitzbVhXL1NBQ2FOTlhRT1lndU5rdE1xbFZ4dkJmZHlaU1Mr?=
 =?utf-8?B?RThIYWxGcmI4OG1ITkhhTUNoYVlaVUxsODlYSWpOMkZTc0Q2dVFYMFJSSW5T?=
 =?utf-8?B?WDg2NlNTNG5PTFhaUDZkSm9IdHlYdE9teHJlMnAxdUtxQ0U1b1VBYUZDRXYr?=
 =?utf-8?B?SVV4aExaMlUvUUVPME1OeUZNMXBmK3hpZUVVR09EUUgzOGgxblBVenBsZHBi?=
 =?utf-8?B?Z2VJalhpSVptME5aclROekNwMEhuNGtDOWsvazJPcnh5R283RFBiMmpUcDRM?=
 =?utf-8?B?dHV6T0R1Sks0azgrbWw5alZBeTRCSHBKNFYzMTFTS3lMa3V4UlV4OUREYlBH?=
 =?utf-8?B?SXJJRWdBSHhRM0VGUi9yTWRkUUNXKzhrcDFtUkJaTDNBazBTYURsb2h0Ni9K?=
 =?utf-8?B?WUxSTmd5aGhvaEF4YkhpNXFIUFR5T2JEMlVjYUpoT3o2UDl3Q2lZVkZvWFYz?=
 =?utf-8?B?UVlMZjZmQlRlMy9TSnExVjZEdDVyNTlsSm5rQmxFUDJWRTFmNnV6dk5kanQ1?=
 =?utf-8?B?YjJxblMyRzFXRThoRGNmaHI4ZGc1dTl6Qmt1dGt1YTJvcGlDNVlPb2p2Nlkv?=
 =?utf-8?B?RGZQcmYrMHYzWXpESlNmeTdiUFA1dEpCbFdBdGc4dlREZFNVOFVjcnVuQmpv?=
 =?utf-8?B?UVQ1OS9TUHMvVmo3Q0VVcmJqampiNzhiTGhzU2RwMTdRODFrdnkycm1sSzhk?=
 =?utf-8?B?azRvbUtNZkszV08wQWVFTzJySjVqN3JuSFpZQmVBVWRpYXNBZTBtK2R4dC96?=
 =?utf-8?B?TzFCTitxRlUvNEhpRjlRbWc3aFJHaXNEc0RYTm16OE1yeW9pSDZxOU5peU5E?=
 =?utf-8?B?UmNIRkF1bWVZcTMyME1DR0pqZzNhb1hITUd3eE0rUmduRDdOU1gybDUrYS8x?=
 =?utf-8?B?aGxrUU9nN1FUYTQzdUdvbzh2YU5wdzJoUzlWM1k5NjErSTVmQjNsdUpoRTV6?=
 =?utf-8?B?a1NUU3UvS2x4bTgxb0lFVk92MGcxTVhZWU5jQnpwR1M3K3JIUUtOUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4c0b29-0935-4989-0b99-08df1e0dd236
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 09:41:22.3121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apIa1CLM4tn1YV91PJ4pPnY8q2GeqsnJ5gk+/8iuEDpX0P4Z2h7dTCHo+tUAdFud6+aAJlkGJOn9tSPT0Dut/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR03MB9967


> On 29/09/2026 10:21, Zhentao Guo wrote:
>> Hi Krzysztof,
>>
>>> On 29/09/2026 08:23, Zhentao Guo wrote:
>>>> In the previous version of this patch,
>>>> allowing one entry was simply a mistake, not an option we ever supported.
>>> I do not think it is true, please test it.
>> I re-ran the dt_binding_check against the new schema and a full
>> dtbs_check, the binding validates, its example compiles and passes, no
>> failures found.
>>
>> If there is any additional testing you would recommend, I would be glad
>> to run it.Or do you have any remaining concerns about the change? I'm
>> happy to clarify anything that is still unclear.
> So please kindly provide a proof that one entry was before allowed, how
> you claim. Remember, we speak ABOUT ONLY one thing - the quote I started
> with.

Sorry for missing your point eariler.I tested it:

With the previous version (|reg: maxItems: 2 |plus the 2-entry 
|reg-names |items list), a DTS with a single |reg |entry is rejected by 
dt_binding_check ("reg: ... is too short").

Let me clarify what I originally meant by "maxItems: 2 implies that a 
single item is also allowed" — my point was about readability, not about 
dtschema's actual validation behavior. I should have phrased it better.

Just to make sure if my understanding is right: the two items already 
listed in each |"*-names"|array imply an effective minimum of 2 for the 
properties (including regs, interrupts, power-domains), so I still need 
to specify the maxItems for them? I would greatly appreciate your 
correction if I have misunderstood this.

>> maxItems: 2 implies that a single items is also allowed,
>
> Best regards,
> Krzysztof

Best regards,

Zhentao

