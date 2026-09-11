Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013045.outbound.protection.outlook.com [40.93.196.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2386D327C08;
	Fri, 11 Sep 2026 14:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136357; cv=fail; b=l/dmmECEVn4Gnr8YGtd40yO1LEY5I+HQ7UIvTRWoI55GWCtxJdSuTZDpAOd6o4LdJi5WCr+VE0ek+diL1CLuVAQdhqoVmMe6ps3DhUNk5zyNy1Bu5KyGxiiSnWWaIUAFdH12B35R/Xhk/M//zV6/r/a4LCdbGAlNCI0m6EhOwZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136357; c=relaxed/simple;
	bh=G9z9YkD22Ka0uxooVHbB0/84ZRXPSDyIgEat55U6U7o=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HQPMvPCgPPtXC27fXOw/X8k9mmRgvcuEiYdyX/59Yfm8RxyftrHWf7WbK1PN5gVbIHuSvWEk9yW9+YLFBBHVZXpcTy4T0jGtL46q3HKMJu0ARkBXbKxd4vcryCuJbFO6D5ecsed1vW7Qtpw4AmtvlXSx8VlDjefbcIesBvXWRf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Qcy+BLl4; arc=fail smtp.client-ip=40.93.196.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Qcy+BLl4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bTAFZYBZ+C6l8rR7BYc8xdpIwQFMFDxDbHscAys2g7E3JPj7aSfaqDFUhhmAOkOfcvuMfLR2SQ7NVAWjS8Q5KsVvRxj7AS+Vvt50e+10uSUG5Pu1uk2OJqGO2C4wCY9SuGSPoNbat3ugcnbrk7hZhrBE/0WyhLMu9q92ZAyKo5IFwOM6Gxppc/KlQsV9m/CsXXnsMqUiQNri3RnpsuwIvnM+wMV01gi/3/QksduZHOBdvpFytj1xlJtQH1WEDWpfSJr5hJvhg6JcrF2xVxiyCBnddqtdOTJX8oIZqzzoBF2RVVO1Puq0kBIgrswQ4HxXrs3ostCmCAjggEKEaqnzWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4EpYyTCShvYO+Y3IaO6PJyoSl5R2KOtoq9wyXlFPLI=;
 b=G55acZbv2MAmynYdZ/m7G23iUz2A5sbv/KOqdgSQ/VEw503erAb82JQI2pR3RJSzdlQyACxJeHjMp+S8CVvgkJ46bmrREAosbzeEAwwtbw0KcFYPO0ugXQ7TcrLSnpYvVJofPBdi6FyILuSuPaHyqpW/DJd3QQwbumJfHO9ZiRerX4J2DW89up3doUv0Owk7b/YCpfKT1AeFihNURwUHe+jlvYx26kv/yf+0owILU2KxI4zf44dxyT1TUv5P/sSY5bRg4vsSCxRvfyrGkSxUT2qSikOqNrENluAH+owzu4yCJLTBEn50i/VuK+1JnMig8abGmaZeYqpgd7g2fCM9LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4EpYyTCShvYO+Y3IaO6PJyoSl5R2KOtoq9wyXlFPLI=;
 b=Qcy+BLl4tvmFnRMeTlj0SjtYRsWNW9Rwjmrhc7QeUEGGWHtJMlRnZgUk4478lZe2pBXxmRoXW68Tu6/t5b6yMnfgdusLPVomhA+ILeaXWbd9hN+75V7x64mFz1HAumJRSy56chvFNY9DBWb2828PbCF/YOUzio5bZx7o/D+B8RVcc6VkzVzGX9RhQRzdWaz1kbFk8LgUPqYS6UbXlEM15nsZ2TDEaYOFV34kIVaiCMME9vybZuDZYjgGmEDgZogBKBLFFIIsM+hfI6RXoo8eBHK0DKzUkqVeXDSu61v/JxAv6kwEANUiawlAYHloayc/b2iENNQnpkIjEyBk6DkIbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23)
 by PH7PR03MB7438.namprd03.prod.outlook.com (2603:10b6:510:2ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 14:19:12 +0000
Received: from DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b]) by DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b%4]) with mapi id 15.21.0382.012; Fri, 11 Sep 2026
 14:19:12 +0000
Message-ID: <9c97aeac-566a-410b-aece-66d5b123d9d2@altera.com>
Date: Fri, 11 Sep 2026 22:19:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: altera: Move all SoCFPGA files to
 dts/altera
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <47719884b157863b2253b415daa447b417cd3419.1789048358.git.evon.chiam@altera.com>
 <7055515a-8892-4fc2-ab5c-81283e40e054@kernel.org>
Content-Language: en-US
From: "Chiam, Evon" <evon.chiam@altera.com>
In-Reply-To: <7055515a-8892-4fc2-ab5c-81283e40e054@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::12) To DM4PR03MB6192.namprd03.prod.outlook.com
 (2603:10b6:5:39c::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:EE_|PH7PR03MB7438:EE_
X-MS-Office365-Filtering-Correlation-Id: f7ab1e6b-a0e4-4c01-b7d2-08df100fa6c9
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10067099003|11063799006|56012099006|4143699003|4133799003|55112099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	hmTchVmW1bQlHg8wJSZKbsPOjJAsZxY2XyMULFeQCOHCz/3ANLKWbMAbkt1FhlVVdY4GQUN+XXaYxeHSE516jfK1ZNb5wkQSEG5+Rfjuk5984hM9DTomdycqd4tOlY+EOOYuuFC4ToFTgG19UDDKlus+assqfa/UmHp+mQykmJ9rbkyPNq2+pzPASn8ePcJtq9EGX5lFYR/xzQv8fO4lVA5UxgjZ8VsgxIDOw3cUHGc9JfSZOkJm31loOO8P5WGPjOHa+ktr45cZBh69J/Z0xvI0A5qtZB2oZkjPFB5hr1/063gIOBeffqdcAhvOMEOirch6N5FD+dhY4ub1RHM+0iiiCSbITX15oYUsfDL7/TxSnIJIRaLpsiLcpn5piDRtMxQXHFmtgahtQz1jgLqA8eSJPx8xMM5w1akjmc5f3PUVN1qXGlf5YnJrPSuHfDbk4ihyz1PyybTQqqmIb9k5V5N3QE1fl1S6W2Ph5EoZbjMi7dwm02UtXrxy6gVRorD183mwvOClw4hci4Nol1ClMAjYZ4M7NaBxGl40zOS0GDwJ3rK4mhJf2R/YiLrQnbLa4dEY8Ij729O80/3pwMAuPSjJby7lmEoTEUTRpz/UK5s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6192.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(4133799003)(55112099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVhvbS92VlRnVDdnMDFHSXpvUjRrTENBM1RmLzdTMkljcEdGUXYvVkdraFlI?=
 =?utf-8?B?eHdac0hnMTFhSzhVdlZaendxOTRESElOSUNyUnJiVDA0ZVdJQk1VZTNDQVJO?=
 =?utf-8?B?SGFyTjFmRm8wQmdJbVdWYXUyR1VpTzRISjBRNk1IWXQ1d1ltQzFmM3FkSWhs?=
 =?utf-8?B?OENuRE5LMmNzNGYyYVM2YzQ5V0Q4c0Y5Y2tiN21rZ0I0dnBkYlR6dThvaGNr?=
 =?utf-8?B?ZzdablNGNm9rRnRUMTVIcVRlRCt2UnNzVi8yMXFpa3Q3TkQ0SmdGZUYreGhL?=
 =?utf-8?B?bnJ0ZGJXcGl3SE9ubi9ZbjlxWkl1bW1JekVVWWlDQ25IRituaWVBSGtqWTFZ?=
 =?utf-8?B?WVRGZThUVlVWQU81MWorMHcxaFBLVGkycTU1Z0toazZTMm5qbHNoNVlqSzJx?=
 =?utf-8?B?UFZUa2t3cFlzdGtDN0xYT2ZLYWpVY1FZN0dNaW9qK09pSGIxYjVPWGhKVmx1?=
 =?utf-8?B?STFvSHdmcDAyZnAvVGNQRFRNREZkSmZ6NUp1aUZjdWZqMnMwNW9GQkZWT0w5?=
 =?utf-8?B?ZU4rWnF2TUp0TlJ2Z1B1R2dDa2sxbVRZUTh5ME5GRDdSdHBlSUNLeDhlSWth?=
 =?utf-8?B?eHI3UHMzbk1FMkV2UjY5bEF1cHBiaVM2RUpEblpDWm9INEtGOFZTNWdxbk1o?=
 =?utf-8?B?NlFTUGNNLzVtazdrRDBlKzRiVzh5UXc4eDNSYSt0SVZUaDQzeTNEelEzU3JB?=
 =?utf-8?B?MG93Y2N3bXFEWitabDRBSUp2U3RmbExnMkI3TW1KL1FiUkVueGk0ckxlTmh1?=
 =?utf-8?B?TUFiTmlKWjNNNXpGYlB3bkg3ZUMrenlaNndIVG43U3lPeExTRkZCRFNpdTNF?=
 =?utf-8?B?bXExZ2ZIQkJBS0psdXFoeE5qREpHb0JzSHJ5SGRRYksybkh5NytONFZGdThU?=
 =?utf-8?B?QllGRnk2NFM4bXNhV2krc0twVmIvenNZMUNwSW5XTXBWc0x2d3pwMVlJNE5B?=
 =?utf-8?B?L1RuREJGZitLYmhVZlF0bzFDNUNZM0ttUEZmQkNoMnk2Y3l2d0lGRnQvaVEx?=
 =?utf-8?B?a3ZIeFhrWS9lckFWTTI4TmxBZ0R0UlNzOTNOTFpSdkIxYVVOR010YXplVXdq?=
 =?utf-8?B?YXk1U0t3UUhWbXdkZHlNY2NyVGk0NnZEcUthZFo3K3kwQzc3REpCZGx2SGkw?=
 =?utf-8?B?RjVTcWRKUnNCOVZrclAyUnJDaW9iMFNKSFU3bWFyeVF1bWQ0alZoQnhwcW9r?=
 =?utf-8?B?cmVUTkVMQ0V6cnFJa1E1Z2tGbnRuMWRDVlNSQ2tqZ1RLdXBDanBXMk13a3RB?=
 =?utf-8?B?MHF4M2RDQitoN0FXekRQNzQrSUhTY3BnKyswSk1Pc3BoYlRyMWNrMnpuRHQ0?=
 =?utf-8?B?RjdTRGp0S0NTUmhjNmU3L2ZMWk1taWdFZnFUZ0NxWmhnWHljVEtwZDRJOERM?=
 =?utf-8?B?dVdsN3hkaEdBd0libE5jV3RXdy95OWdXOGdtRVZYL002ZFhYOUgrYytHZFBT?=
 =?utf-8?B?S0ZiNHpSc3htQXczZGttVUZCRW5YM1pPT3AybktCa3JMQlNaLzNIQzhmS3RX?=
 =?utf-8?B?OUpLcjYzUEVEOFZLWU5GV2VaM1poWnFrVDREYTgwNEwxekcvSWhvN01rWmFj?=
 =?utf-8?B?VlZHSlFjbGRQNnlqbnJWenBrRSt4Rys0WU9lWlV5ZU0wOFdVSFp3dEwvZGVq?=
 =?utf-8?B?R2VMQlllKzVNSmF2c0VjU1ArcWU3ekx4ZUFSYXYvWWpjVmNidWJDSUFGYUZq?=
 =?utf-8?B?bCthTHBqV0JGUFhadHFsS0Y4c3VGQ2x6Rk50SjFNb09oT3h4ckNNeGgyaXNi?=
 =?utf-8?B?VVgzWTRXQzVualRFemdKV1VlS0tZNDR6aFp0NXYxd2RocURaZ1UvZEhOblZy?=
 =?utf-8?B?cDJvT1BIS2Noa1FBdHVKQyswUGRCTnpkc2RCUTJ5b0xNZ1J4RXh6TmJxQ1Jw?=
 =?utf-8?B?NVl5dEtLZEt4TE9xWkdNZC9rYUg0bHRPbTdXUS9jS3AwUnRmc2djNGZtMWZl?=
 =?utf-8?B?c0g4VkVhVTIzcnUva3VWTUpGYUcwcS9vQ2pYaEtLeElqNVZFWm9CVDd4OXlG?=
 =?utf-8?B?d0pVd2xMMjdJanhXWmNSbmdiSk1odklEbHluYWQwd3VpcmVvcDRnd2lxOGR6?=
 =?utf-8?B?NjZtVFI5Q2huVG8rVndIOUxBaHlGNlRWTXQ2OW9Cbjc5ekpqcjBXem43UE9U?=
 =?utf-8?B?MEJYcWZGRVRwNHhpSFgxVzFIMkpnUmxCUlVoQUtkTVFoelVNNTFJMTYrbE13?=
 =?utf-8?B?SE1za3NIRDZkcm5qZVpLSmd1ZGZFRUtNNUdVc2FKQ3kwckNzeWdjeGpnd2pB?=
 =?utf-8?B?d1l5V09oV3krdjJyclBMQjkyZEFmVTNsSjRrdlRoYVI4NVZWbUFEWEZHSnhR?=
 =?utf-8?B?U3V2MVhuQzA5NmRRTk5lUXd5WVpkdG9wOWFGZWdOR0xnRE1vQ1NrQT09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ab1e6b-a0e4-4c01-b7d2-08df100fa6c9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6192.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 14:19:12.1257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjIZy8l1DcSSWlaYGRy70ZuCt/rANFkqwGcJR1WNpTLPtrzg66VP36epMKuT8Gyl8bW51AeA/88mitLuDqPXuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7438

Hi Dinh

On 11/9/2026 5:45 pm, Dinh Nguyen wrote:
> 
> 
> On 9/10/26 09:16, evon.chiam@altera.com wrote:
>> From: "Chiam, Evon" <evon.chiam@altera.com>
>>
>> The dts/intel/ directory contains two distinct families:
>> - Altera SoCFPGA platforms (Stratix 10, Agilex, Agilex5, Agilex72,
>>    Agilex7M, N5X)
>> - Intel Keembay
>>
>> All Altera SoCFPGA device trees already have a home in dts/altera/
>> (Stratix 10 has been there since the directory was introduced). Move
>> the remaining SoCFPGA DTS/DTSI files from dts/intel/ to dts/altera/
>> to consolidate all Altera SoCFPGA device trees under a single
>> directory. Only the Keembay files remain in dts/intel/.
>>
>> Also drop the stale SoCFPGA MAINTAINERS path for
>> arch/arm64/boot/dts/intel/. Keembay DT files there remain covered
>> by ARM/INTEL KEEMBAY ARCHITECTURE
>>
>> All inter-file includes are relative so no include paths need to
>> change. The set of DTBs produced by dtbs_install is unchanged; they
>> are simply built from dts/altera/ instead of dts/intel/.
>>
>> No compatible strings or DTS/DTSI contents are modified; the device
>> tree move is rename-only.
>>
>> Link: https://nam10.safelinks.protection.outlook.com/? 
>> url=https%3A%2F%2Flore.kernel.org%2Fall%2Fcd16fb78-551e-4630-83d6- 
>> a44a68e2e411%40kernel.org%2F&data=05%7C02%7Cevon.chiam%40altera.com%7Cdbebcf1cfb6d48efd95808df0fe96622%7Cfbd72e03d4a54110adce614d51f2077a%7C0%7C0%7C639247167296589037%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=YZT4tZ2b6W3InI1ubN1thEAmAkSy%2BdJXpya1Nknlkjc%3D&reserved=0
>> Signed-off-by: Chiam, Evon <evon.chiam@altera.com>
>> ---
>> Changes in v3:
>> - Drop stale SoCFPGA MAINTAINERS F: entry for arch/arm64/boot/dts/intel/
>>
>> Changes in v2:
>> - Reworded commit subject to drop redundant "device trees" and phrase
>>    the move as "to dts/altera"
>>
>> v1 patch link:
>> https://nam10.safelinks.protection.outlook.com/? 
>> url=https%3A%2F%2Flore.kernel.org%2Fall%2F802bf0d27fbff9b1ddb6b9fc323a1a9f8f050f74.1788512748.git.evon.chiam%40altera.com%2F&data=05%7C02%7Cevon.chiam%40altera.com%7Cdbebcf1cfb6d48efd95808df0fe96622%7Cfbd72e03d4a54110adce614d51f2077a%7C0%7C0%7C639247167296637660%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=vUgJ1yBU8%2FtFnCcXoP30XgamJOr1bhqrMNbqdt9BKTA%3D&reserved=0
>>
>>   MAINTAINERS                                        |  1 -
>>   arch/arm64/boot/dts/altera/Makefile                | 14 +++++++++++++-
>>   .../boot/dts/{intel => altera}/socfpga_agilex.dtsi |  0
>>   .../{intel => altera}/socfpga_agilex3_socdk.dts    |  0
>>   .../dts/{intel => altera}/socfpga_agilex5.dtsi     |  0
>>   .../{intel => altera}/socfpga_agilex5_socdk.dts    |  0
>>   .../socfpga_agilex5_socdk_013b.dts                 |  0
>>   .../socfpga_agilex5_socdk_modular.dts              |  0
>>   .../socfpga_agilex5_socdk_nand.dts                 |  0
>>   .../dts/{intel => altera}/socfpga_agilex72.dtsi    |  0
>>   .../{intel => altera}/socfpga_agilex72_socdk.dts   |  0
>>   .../{intel => altera}/socfpga_agilex7m_socdk.dts   |  0
>>   .../dts/{intel => altera}/socfpga_agilex_n6000.dts |  0
>>   .../dts/{intel => altera}/socfpga_agilex_socdk.dts |  0
>>   .../socfpga_agilex_socdk_emmc.dts                  |  0
>>   .../socfpga_agilex_socdk_nand.dts                  |  0
>>   .../dts/{intel => altera}/socfpga_n5x_socdk.dts    |  0
>>   arch/arm64/boot/dts/intel/Makefile                 | 12 ------------
>>   18 files changed, 13 insertions(+), 14 deletions(-)
>>   rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex.dtsi (100%)
>>   rename arch/arm64/boot/dts/{intel => altera}/ 
>> socfpga_agilex3_socdk.dts (100%)
>>   rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5.dtsi 
>> (100%)
>>   rename arch/arm64/boot/dts/{intel => altera}/ 
>> socfpga_agilex5_socdk.dts (100%)
>>   rename arch/arm64/boot/dts/{intel => altera}/ 
>> socfpga_agilex5_socdk_013b.dts (100%)
>>   rename arch/arm64/boot/dts/{intel => altera}/ 
>> socfpga_agilex5_socdk_modular.dts (100%)
>>   rename arch/arm64/boot/dts/{intel => altera}/ 
>> socfpga_agilex5_socdk_nand.dts (100%)
>>   rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex72.dtsi 
>> (100%)
>>   rename arch/arm64/boot/dts/{intel => altera}/ 
>> socfpga_agilex72_socdk.dts (100%)
>>   rename arch/arm64/boot/dts/{intel => altera}/ 
>> socfpga_agilex7m_socdk.dts (100%)
>>   rename arch/arm64/boot/dts/{intel => altera}/ 
>> socfpga_agilex_n6000.dts (100%)
>>   rename arch/arm64/boot/dts/{intel => altera}/ 
>> socfpga_agilex_socdk.dts (100%)
>>   rename arch/arm64/boot/dts/{intel => altera}/ 
>> socfpga_agilex_socdk_emmc.dts (100%)
>>   rename arch/arm64/boot/dts/{intel => altera}/ 
>> socfpga_agilex_socdk_nand.dts (100%)
>>   rename arch/arm64/boot/dts/{intel => altera}/socfpga_n5x_socdk.dts 
>> (100%)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 15011f5752a9..98f374ae7586 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3590,7 +3590,6 @@ F:    arch/arm/boot/dts/intel/socfpga/
>>   F:    arch/arm/configs/socfpga_defconfig
>>   F:    arch/arm/mach-socfpga/
>>   F:    arch/arm64/boot/dts/altera/
>> -F:    arch/arm64/boot/dts/intel/
> Please separate this change into a separate patch. Otherwise, LGTM.
> 
I've split this change into a separate patch and sent it in v4:
https://lore.kernel.org/all/cover.1789123511.git.evon.chiam@altera.com/

> Dinh

Thanks and regards,
Evon
