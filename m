Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020103.outbound.protection.outlook.com [52.101.69.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4049A330647;
	Mon, 14 Sep 2026 10:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382870; cv=fail; b=YWlaf/kHPtLE8fnrDKwJP7Uumg48gUr9wluyIzxfe/xA0EpvcSgZ4qu7hrwTk4qOwKn4Os5fFubU3/B86JxfJiTH9+x9wjgSinW3S+d8foPUT9z0VEU8dmxqiI3POiZYFtEJBtUaeAT6Lvapt8QrK18gh+9zbkQY99fzhfwihhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382870; c=relaxed/simple;
	bh=YvJC91S0oZwwnonZ46UzBHCOknudpJ+byfFYqLNm5D4=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QRyOq4CqP5kw8YZW2F/NHgZkLAG3rIxbdXMY4oFIvmaTx/62LwMEqKiZuDkND24WvT3BLt0K2WlRI6H//Zas6CVBzFAwiWoKjg4oIZ2NHwrbuNVDJqeeG5VocYXLCIXXZgVx98wGGKKW3NgLjzcHI2nTyAmeeTLf0ljGRBiWReM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=w89dPPvM; arc=fail smtp.client-ip=52.101.69.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="w89dPPvM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NM3MeNN6p/jycURAw5nisNaV6xlm3HtIT81Gtmjijw8RrxWvDoRp/5deK/PCaOdCBHY0iiuv0yVmkKjE6loKPFLfbtrEkSB6V1CSiL5ahs1L1axxmcGVAYYPByi+tRYOyZ2/jpYPtPU98FEsoAejSRAAUEEkUjGdJ6OqUYWDph/Db5HobwC7KjFI+TXkZfKDZ9+m/eWZhRKOp4nzdjK1ZapFrjUOkbFCOaVbdjIRuz8Egb5utX2EH/vNxgV7Hk12wJc/RZzzlWKUqZzJKfQ3jdUKcamptA+gXX4a8Vjc9JjhVmF9HZ/yIccOJUnqgqJJNAkL7Z4+Wg6vOP807BWw1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FCluIoCDR0lf5/KCGbkxh7D1E8IOttXRrxzO6kDpY8=;
 b=K/PpOoezzU7eohMmgxYgcPHk4qsJgCQSkRyl61SkhFVCeO7tMLr0GX5HNpfOxH7FsLQSllDA2oqLQVN25jHHGnAfrQ1o+AWL3YpQ7+/opp/+ZfxcyF3NbYUbcOLeOmZiZ8ynxPNhU0V5xBnn6L21LhJqjWfQMY+BWB1kFDH3zhm5JwGlnj487TsuOcQI3ewHI7PFbDzeruln8U+wL7w1xbgrYLuNWgBbOr/EmRyApoINym4XPzNGFgSH4kNrzcpy7nwB/lPjFgDurO/rnKHYV59Nyh4nSYXyXrNaK8IEDi4GrVQR0f/j3z1kZ8ZKP0S8WK+SONzZ9Dq/7FApdaxsbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FCluIoCDR0lf5/KCGbkxh7D1E8IOttXRrxzO6kDpY8=;
 b=w89dPPvM4jyzM8Kgzm+SDMMMflfC4C7YyTxnzDZjZxq4xPTPnd21L0NMZ4xVVCEUrwzleQIr2pOPEW899tOwrHuh+3bv4OCFqz6QwYJ6rxh0nGTzGBOCxS11K1sL1sxvKQQ6BOI6jd1mgocwAuroR9+dloe/y92iXz4YtANY9g5OvHUSe0aJvAINfnjGdDqZCtebqOGdxAf013v6+8uIcxEvGhQOBkKjyc/cihja2b/Flm8HM08R+x3C0NiW9u66TPCR0wMbnuTcS3OYoZL8XwG2CPOmiMWD/VpKVjMkZCGYCQwOnX+uPS64A0WSqJ8ISodz6LO2Mf0imvoEcYQ+MA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by AM0PR10MB3553.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:15b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 10:47:39 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 10:47:39 +0000
Message-ID: <9d1fb5e5-e0ad-4fbb-83ee-5f267db4f030@kontron.de>
Date: Mon, 14 Sep 2026 12:47:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v50 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
From: Frieder Schrempf <frieder.schrempf@kontron.de>
To: pankaj.gupta@oss.nxp.com, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>,
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260912-imx-se-if-v50-0-80834ef510d3@nxp.com>
 <20260912-imx-se-if-v50-3-80834ef510d3@nxp.com>
 <2062655f-886d-4194-b7bf-3048b7139c7f@kontron.de>
Content-Language: en-US, de-DE
In-Reply-To: <2062655f-886d-4194-b7bf-3048b7139c7f@kontron.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0256.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::19) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|AM0PR10MB3553:EE_
X-MS-Office365-Filtering-Correlation-Id: 83b92fd5-d9ec-4dbd-de36-08df124d98ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|921020|56012099006|11063799006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	IQDvRoKsESfPZciYvMK/qMCHhruzjszdyR7whTi8L3d0bThWwKqqDdi9Qz5C2Po99GZwDfVX5O/qWUCfbx5it9iP5f6ZCIBjvF8+SSIOWOdCO5koCLBe3fncbGA4uYMadTP0+96TV9mcBd7W3/2Y9YUsenejvQ1wJsCqDJVKjPN/JU/LGU+rxoFjaa5BMlOtISFAe0WzAnilGvt8aqaKw0AoABqsPFuqjKzFXC6YsGYXZYml5VPf1bfHPviTI2aZLMjJ2qlmclPcstte0DRvyABIAtQlJUnAIhYsUyZ3rmK/LmnBB2fredL4QLlOe2YCfnDimhRUhvHoaKSGOfp9CpxRL+xaVOfelAQbJMvqL7fi9RHutYg3o/cPEsEUgsQKaqXNOS3pw7sKitjSwQKeiLlqVjME96Mgypmlo8N9plGmbdOU/5ELFCB0p/YLzUEV4OsZU6yg+I0NJ4RDvsKuB41BSCbQ5O0hypraO5bp1+A6v8tcaz8ytNTSjPkjTqbKbbyRGTYK3X82gH9nQpCPZyh2TfpL2EaMOmT9STZ4vI75u1gx4OMg/z59nzSJPWnA0uWBhXdroE+TCYnx6i2j8FuvjQe6Cji8Vx3/VJWSf5ay4wXni7pmBnPOTl+BAJfm/0Vi56465DmhNcDmzhF/ueTX81gpjbecQhWZ+6WOYQBSak3487sQUedpav6DhS4yvMh6rO78h4p78APuUI290Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(921020)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3AwVUQ5RGJBMjNWcWFzc0EvSDA5cU4rL1lTVUR0cktzZUU5NWpvRkVzd1Ry?=
 =?utf-8?B?TDR2VzVkZkhyUHJQUHhXaG4vOFpmVThLaTRBNVkrMW1abDNyeHFjWVdiWWtC?=
 =?utf-8?B?bGJpa0ZXZEtaVjlwSkxuYVNhRXVzOWNSaEdGTmlsSkduRG1TTUhXV1duQzR4?=
 =?utf-8?B?azg4ZldtTFZ5WklhTGxZcHNuV1g4ZE9vSFN2YXkyVGFJNE9Hd1RmRzlHTXc2?=
 =?utf-8?B?dm5LbjRkUzFYWHdlbkRKaUhMd1NlYWpxb0lQZDJ0YkQ4THdpSjUrNEw3ODkr?=
 =?utf-8?B?OElzWGVzd3ZWRWF6QkJFRitzYzl3aVZ2S2ZtbENpOWdHejVwbnNad3RDM1Bp?=
 =?utf-8?B?MXFGV1RGMEdNanpvVWVaWGJlVHhqT0hLa0hONmJweUpVY29iektocithMlRN?=
 =?utf-8?B?M2RTcHZYaThqOEsxcjAvZjFSUVhBOS9XSWc3ZXlSYUlGczlyOGF3UHg4MHIx?=
 =?utf-8?B?OHpUdzBkY3FZMkZmMkxleXpZMjJCQlFrQXhiVEt2QXZhQWRSNHF1YUx4N3Qv?=
 =?utf-8?B?T3hkZ1A0MnNoaUh4aHNYMm9qNmp5V1E1b1pXd0F2dEV2U2REUkVXa0lndTNO?=
 =?utf-8?B?KzQza1h6V2Y0L01Mc3FMbGk4U1NsZVRxRHV2V2Y1SEx4OGtzcDlBRjk2Y2VX?=
 =?utf-8?B?MWFXS1JWQ1ljZlI0Y01wcVJBcGdCdUF4bHpBck52Si94M2diMXRMeFNWdEVz?=
 =?utf-8?B?WXZEbzhtWDRDQmhsdm5JcU1TbG51NHJsZng4K1JkelhYZ1kwZHhaMm5SNWhp?=
 =?utf-8?B?OVoyRWwzTjlDZTVydjFNVm54QjVYWXFFY2dIdkYxQWRqN0lya2duczBwS3dK?=
 =?utf-8?B?SEZKQ2U1eksxWk05ekp3OTRjY1BXdjBQbjZPMWZoMk1hZDFkeUVpT0lHQjRH?=
 =?utf-8?B?TUkvY2pPVDBQYzlsejc4NHhINFZhdlh1UmpzK1VVMTM3QndvUjllQVd3N016?=
 =?utf-8?B?dGZBcUo1OVA1cVg1aS9UMlc4dWFPSXhzNjE3NGMzajVtMXZSd005Y0NRRVBz?=
 =?utf-8?B?NkVkM0ltUWNlaFpqNXB3MlpsZUpzZVNiSVdxdjJJZFZNTWM2bnZzbEprNjFn?=
 =?utf-8?B?dWx2UE95b2dxQXVHRlJNbngydnl4blhTZGJQbTFpYlVLWnY1SllzZ0xBanJh?=
 =?utf-8?B?UWs2UG1peHdDQmR2VUNKWGh5bzJVUEdWWDRYYS9DbU5EaFlxUDRGbGk3Uktq?=
 =?utf-8?B?U004cUgxczRkZU96b2NhWldyR2lFV0RmSDdic3hmTmsyZWpCcU1BdHFBb2li?=
 =?utf-8?B?ZzlOeHIxTHk0bW14QWRuUitsd051Sksrd1JwNEJtQmNleExxaGpPN2tTWjNW?=
 =?utf-8?B?T0RkZ3plWWlCU0ZsbHA0a0hSOVluMXc4ZnZuQUV2Y0VuZmhjMVZ0N2hiRWp3?=
 =?utf-8?B?WTBsSUNVbm1sME9kYmxoaXU0ME9GSExSZmFvM0JJU3JLZzFJUTFRMGl0dWRv?=
 =?utf-8?B?aktKVC8xVkpoQm5LcERjSktUTGxkVmdzNnhWeWdnb2cyUmdtWVZzQVN0eHNY?=
 =?utf-8?B?V0pWTXlKQW9nYWZVRzNyYW5yMkhZVmVCWWxGb1U5c1IvNkswRU9pRmNBVm9Y?=
 =?utf-8?B?SGhlL0plTSswa3dsa1Y3SDZKbzIrUGQ2UTE3bjNPYUpibERvMWIzZGZDR3lZ?=
 =?utf-8?B?ZlZSY1dsc05SUVMrUGtsVEZXdVZaQUxBY0xuRlVkOUd4VUlta1lWZGRaUHN5?=
 =?utf-8?B?NXRHbnFsUVNBek1RN3VCNFlyTk5EVmVaeDhaUUw3YkhlRG1hWnFjYzBMd1dm?=
 =?utf-8?B?SkpmWmhiU0pnN2s4TkJBTWI4MU9ycjQ1SVBwcHNZN1JvQUhpVzZTTGgwNzlD?=
 =?utf-8?B?VjUrdExDOEdKVXJiaUZJdERxSWpkZGpmSnlXcHhOUm5lWWdldnRMS0FSUWNj?=
 =?utf-8?B?TGZ2VUdwVFhoWGN5TUk1TEZtWG9TdlpjYU1EMEYwSTFqaGNsejVTVC9zMllH?=
 =?utf-8?B?Y2JzRlBOTTNFY3RpUmsrZ1dHMnVTVmFmYlFNWG1jakJwMnhjLzIwK0c2RXpG?=
 =?utf-8?B?dFlWK2tIMzZtenY2QjJzVXNjOU9LQkJRdUViWnFWaXBlN0ExRm5YYWJBSG53?=
 =?utf-8?B?TUhndEgxT2I2VHk5QzdpNFU4dVJ4MDV2S0ZmbTgwT3d1S0xURE9PeUlSNU1m?=
 =?utf-8?B?aG5obkw1TkErWHJxbkw4RXA2TExGa2FBcG81cEJ3bzVFYkR3dDhpY2V2eWVQ?=
 =?utf-8?B?ZjlvbnRldzd5N1FlQ0NmV1k0aTcwM2xtN3U2Wkx5VUhXOXFTNnJXSFhxVTVw?=
 =?utf-8?B?WlhwK0hmbDQ1Yk5Lb3F3YnF1citRSnpqaHU3SVVFRU9Xa20reThNYnk2RktS?=
 =?utf-8?B?Q0NiM1ZwNzdHWFpFWjJyQWhDcnpSbDJaRC9yNjAzbHgycXcwTnlUY05UNEF2?=
 =?utf-8?Q?OVx3s/vkrthwJ1Qg=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b92fd5-d9ec-4dbd-de36-08df124d98ee
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 10:47:39.8535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFAINY/82IjynpuPIDi7N/q36g1ijIQTQ6dd4RBGrmVF4wifwZ12dmuQDW//UtGcnkLjBOhJMs1r97LuhyksxrByJVEgHaQ4LNa6LRL+YoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3553

On 14.09.26 12:45, Frieder Schrempf wrote:
> On 12.09.26 19:03, pankaj.gupta@oss.nxp.com wrote:
>> From: Pankaj Gupta <pankaj.gupta@nxp.com>
>>
>> Add MU-based communication interface for secure enclave.
>>
>> NXP hardware IP(s) for secure-enclaves like Edgelock Enclave(ELE), are
>> embedded in the SoC to support the features like HSM, SHE & V2X, using
>> message based communication interface.
>>
>> The secure enclave FW communicates with Linux over single or multiple
>> dedicated messaging unit(MU) based interface(s).
>> Exists on i.MX SoC(s) like i.MX8ULP, i.MX93, i.MX95 etc.
>>
>> For i.MX9x SoC(s) there is at least one dedicated ELE MU(s) for each
>> world - Linux(one or more) and OPTEE-OS (one or more).
>>
>> Other dependent kernel drivers will be:
>> - NVMEM: that supports non-volatile devices like EFUSES,
>>   managed by NXP's secure-enclave.
>>
>> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> My review was for v25, my test was valid for v29. We are now at v50, so
> please, as requested before, drop the tags as I don't think they can be
> considered to be still valid with all these changes.
Sorry, I missed that you already removed the R-b in the meantime. But I
guess the T-b should also go. Please ping me when all the problems in
the code are solved and I will test once more.
