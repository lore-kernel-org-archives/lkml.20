Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.102
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794810168;
	b=RhPfTzXtbHS6ynJcAthg+CpLjnqbBA55JwLX+Boim65RWbw9b6X9BjQBNNWB1POGbqMr
	 jrFo/wgpBTqeoMnFj4vZMWKtpVLPaX9qmq21FylIzfKZ5Fu5RLiHO/Bpp5wNFO2C74w2G
	 FJIOZ1mO/SyJ4pvwEPferfKr6evbnxhOa2iI1nd3rA2fiMz0T14SHOlJI+8U44PRsY71p
	 +5Fk8IVyOotVQbjheYCrlOs0/zqHGvJabzOr4BjglBv7GCq9umrYxNCnMHJ8UZ615FwC6
	 bYODv2IK5vcG+MTMs0tgJYue+Pu4OHLWpPFIGqA/0IJ99zCayAX5nHJXmFdnJIPaDYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810168;
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
	bh=I66VCwB8U6KqMZqm/jOYZ89MwWUFsrGxIloB6REqzFg=;
	b=IS3PKDruTk6LObfGQxzvV5h7ev73wh7HLiqd8a8rU+LV2aWngjLvx+EojtLSiPKanM3F
	 WJG8aoHMEFZ5XU1S2QpjMqN+9dRoUJKDbU3OPNgBfFlWAGC1tbgDHXY0bJg4Ki/7RvOMA
	 0gklH0BfPbzooNulsOI72DkiALmpyIlmlsZTZYhLG019mHEaxegDGQyJJOyMckxxYorQ4
	 ABwKC4yHBTFJumpJRffaWHzHWPHcJzYd1AQXUlIzbeLb2RBcDkNOlk1Dy4eum82GCu8KP
	 9CsapFb32ZZFHznl7CZGd4oz0LolrVArzekhjWIAr/LrsaWZwJkzn0dJGXqUQLodZrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=axiado.com;
	spf=pass smtp.mailfrom=axiado.com;
	dkim=pass header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=gDfCVlne;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.102
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11020102.outbound.protection.outlook.com [52.101.61.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D9E606A323;
	Mon, 16 Nov 2026 06:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01D9E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=gDfCVlne
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciw3xGxwS9VWwBwyjQEYyHEEY1qvYOXlHfstUk1hy5m8ks96oyk0JTwqg/7aiTcCWPdYTV77HucmMicM328ofs87TPqkMfsyXb1R3obcEsFf5Dj5cIqBMrn4xq486sAsT1EnfNmByApC0ksrlQt0iAFt3xF/aLiNcH9gzjpAIMLM4ST1NM63dCWeZDgfx57ZkhI1vQWSRW8h3EqfziuPpSW83PsvCMSmo74eqtvQhYXm+21o4Bvt0DBuSxbHlsfGEIxRiPupujbLXMNFY/k3BOwDczhpDsWmvgX8Pcp0aYaH1egB1eww63Hk4QRZE/t4nvay9KtvkRZl6G6hky6dOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I66VCwB8U6KqMZqm/jOYZ89MwWUFsrGxIloB6REqzFg=;
 b=w/V4hRQdsQ1i4Zsd5zbJWMtawoME2wMS98btopkF5haaomsTIxegRDOxcfx9nb0shlUtLFXdY4PPm4tOKa1GL3tpamqc8mgQo6ElFeGmYrdqyCotP4Dpe0kl7xkeQSd4+KI46b+yWN/fm9/xnqjF51vUClDM5+kwFBomzaC4SUNmfR7XRGvbosL/oIBbj64TSLkLA6qXG1IWM8pfvBrVSFTQ0seBioOmoqL3ugrSbnLVM2hGbp4eHKVEghlPGOTDYEGW39y9NrXkNOjTPJopddxeOxDyMUWqY82WJdde1gYWsM/Ej8yiAb4/KhEpatBveyjYQ2WKgH/VQe2qgSvQJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I66VCwB8U6KqMZqm/jOYZ89MwWUFsrGxIloB6REqzFg=;
 b=gDfCVlneglpkenvumjIUvBtLqH/sXS/r1iVipglRNqmmMCQQFz/c+NHpFDRTpMuJ11Pq+3XZnI8x0ngDT/nU259hxhfSqZDFy4nSUt6bEonsO7ndwpIuWe2e1eJaEkPDx3UzjP8AWupSWjQAfC4k+C9nVH9fZU0vHQMxz1nd/WRfudPZmdvVVtMYUljbRQu6pUVuST1OXkhzlgSBK4DGOP3vRSjHbiYewzm4Nh58GJ/zxpEYMj7SEqvPDDkwyjLqPg8GjBlFqlfMBxbnVmDjnHzIx2Xsy9KyZSeg15Jp2gGAeVDlbNJj0XXmYdvC0kn4gA09VHyX0W0S0rBxLRcJGw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from CH3PR18MB5671.namprd18.prod.outlook.com (2603:10b6:610:1a3::11)
 by LV3PR18MB6132.namprd18.prod.outlook.com (2603:10b6:408:275::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 06:22:09 +0000
Received: from CH3PR18MB5671.namprd18.prod.outlook.com
 ([fe80::d361:9d9c:4a15:4b84]) by CH3PR18MB5671.namprd18.prod.outlook.com
 ([fe80::d361:9d9c:4a15:4b84%3]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 06:22:08 +0000
Message-ID: <f752d203-8239-4203-aa04-884b4d7e5d80@axiado.com>
Date: Mon, 16 Nov 2026 11:52:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/2] net: mctp: Add MCTP transport for the Axiado
 AX3005 IRoT
To: Jeremy Kerr <jk@codeconstruct.com.au>,
 Sammai Chakravarthy <schakravarthy@axiado.com>,
 Prasad Bolisetty <pbolisetty@axiado.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>,
 Karthikeyan Mitran <kmitran@axiado.com>,
 Matt Johnston <matt@codeconstruct.com.au>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Adam Young <admiyo@amperemail.onmicrosoft.com>
References: <20261101-mctp-transport-irot-ax3005-v1-0-36ceb822f01e@axiado.com>
 <4102c20ece135c4d94e94af4441a01425ad159fc.camel@codeconstruct.com.au>
Content-Language: en-US
From: Akhila Kavi <akavi@axiado.com>
In-Reply-To: <4102c20ece135c4d94e94af4441a01425ad159fc.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0359.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::10) To CH3PR18MB5671.namprd18.prod.outlook.com
 (2603:10b6:610:1a3::11)
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
X-MS-TrafficTypeDiagnostic: CH3PR18MB5671:EE_|LV3PR18MB6132:EE_
X-MS-Office365-Filtering-Correlation-Id: 75e66229-d74d-4727-60e5-08df43a9f124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|921020|10067099003|5023799004|4143699003|56012099006|261021135927099003|261022105027099003|261021123027099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	VVXsywo5e2hbNcWp8+5eUXjDTVAkWvDOr1CB3uJ2ogoMmmrVWMSYAIYES0IAzTaVxJ5Fd5ngapOcnwVwDMv3IvkNToWDcmJkNZwJl2oM7czVoNt5F+bxuLuwZbAVLhf/Uw+ICFUQ2EUF5sRH4DRtFrkpAkgKLZ1zDvFTIndQO/9/u29JHPbxpza+WYxfSV4+hM53xNjErLGBde1y0ZcxkrwZYrsojoIOpjvLqbMpB+NzrjB4bNC3M9KOvBwHvVTnn9aZ6juDPOSDJevnSP+QbRCPH6RY6QpcHy4rWSefJWWK4FWDDYw7dUy7f2+v07fBz117ykuwbalsPDtRNVViquQ/CuFalncyEI70fJ5rRUYslI8x4Pc3Pm9A4w0dDlUmFj73M1H9G23+Ha1EWJ8FXMiHr7sX32rgdDuruHIzJidHiB90pAN3R5FoyYDv8UrYDGvZE/CNDBW/vGlC1K8UU23dLMhi92jwRtY+081qraYZXiK2Qjqt1NVOIs2TazzdJwEqlmT7qGBDlO0uFkKluKh965iG50hbyCSxz8hycac5u/0OmwxdO7Gv0auuZ4xvXZoG7L0iHVLLFPB29FaeKdAi7aQP7iKBLIDIO9f88NHBNJYjJAHzFmcHY4y5AVNhjvsF90vS1zeWJK3dvgyZYhS2SVtcwGBMDPXur4WvHozZPdfN6a0QdYYbvqyxwDlXKvgKr73pxS3MtVMl89ah3Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR18MB5671.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(921020)(10067099003)(5023799004)(4143699003)(56012099006)(261021135927099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1k1Tkc4TzQ3K0hvRjJ5M3d2a3dQM0VRSkFwWXVuc204NFN6VUViaEMwWXRQ?=
 =?utf-8?B?RURVaXdMRVo3ZlBGTDlDRGlHOHh2N0tFQXdxeWNUTlo5a3JOUjR6dC9pUDhP?=
 =?utf-8?B?VVdzNEdQWDZ0V3VobWNLS1cvSDBEbXBwT1h4aXVRYlA1aFdNSzJqSVR1NnVX?=
 =?utf-8?B?cDFqb1ZrMjFLNy9FdlUvVkwyMjJIWWFaY2tmM2tTSFlnQll0TWd1WHp3d1Vw?=
 =?utf-8?B?dzlsRlBpSWt0V0FZY0h5Z0RnQ1R1WWRYUXdKZ2QrZWkrdFdMaFgzTVp0TzFL?=
 =?utf-8?B?Nml1L3V0Qnh0ZURNamF6OGtucUlFbllIbXBZRkZkWUdjOVhiOXpFNjZNZmJI?=
 =?utf-8?B?UmFqT2RvM3VzOHhFTVNidVYyeEhBVXJGVXJQaHBibXQ0ZW92eGphRjlDY1Rx?=
 =?utf-8?B?UitNZ3Q0Nks5ZFZLdzZ4WEsvdUkwTDRwWW1Kei9oNlJRWDQzUHptM1BINUpD?=
 =?utf-8?B?M1ZRSXFoWk5XaVozM0JMODJwNXM0ZStOVTJCZ3V1dlhScHBBSHhYUytLY1VT?=
 =?utf-8?B?SGYrM0cyVExGRUF4OFpKWFJnR3RkSFluTXhic3NjemJtNlhTLzdPaHltSUp1?=
 =?utf-8?B?QllJOUVUS0tZRld2Um9WN0YzMitBb2NTQTlMY01QMVFnVkhjN2k4S0V0dW8w?=
 =?utf-8?B?dVFQLzlCMjQwMmlsNGNHUVZhWWZYZjBpYzZzY090Z0hvMDBSL2xiZ2EyaEl4?=
 =?utf-8?B?Z2o5NEtMMlZleVFkdHVOdjUvSlhKcitCZlZTcTFUSjh2bFFHQVRQUHUxMmUr?=
 =?utf-8?B?eG1sbG9oMEV0dWZNVlJxcmpjcXU3NVo3Q2FNZHJBV2t6MDJnMUFXa1VCT3FB?=
 =?utf-8?B?NFA0ZHZkajcwVVFJM2hITXJVbW5RZ1J0NklLWXFIWjJ3MjFVMHlqN2VjNlRw?=
 =?utf-8?B?Qk13UDB3TEE0S1cvVHVYVDdaMGEwMFhMb2tJNURJS0hidURpSXpCaWJJVGZI?=
 =?utf-8?B?NkVtYlVhOStuY1E0aEZmekpCZkdDd0hITHRUcXB3YjJMV0NhU1djTWtmN2Fw?=
 =?utf-8?B?NzRDYURsM1JCV2ZHYTc2ZmxFUUEwMmhPeTRyWXJnMjg0THFzWVFyR3VZZ2w1?=
 =?utf-8?B?MldscW9pNVZDWHRuSU1HRzBPcjZCbVptdHdEUlg5eFVYTzVjdjQ1d1hJK05h?=
 =?utf-8?B?UGpFT1cveFFMV0k1Z1EyZElUb3RZVzJpbkNJWWc1ZkU4VkxQUWN3R1pCVXFC?=
 =?utf-8?B?aFdPc2ZLclY2Q2VmNHhIY3VFbVJ1TmwvVlI4amlhamNVVzA0em4yclc3MFUy?=
 =?utf-8?B?SzBKbS9IVnZkdVNhV05VbHRxVC8zUWIwbWZ1TjgvYUd2cmo3aDJncU5tSFJo?=
 =?utf-8?B?UWN6a1lESnJVbFQ5UDN0UkFyZlJLZThkMDJ2emF1eWIrR1pXN3hNNGVkNjh0?=
 =?utf-8?B?L1d0b0gxNVJkUjgvZnN4TFBkWWtvSklEOE4rQnNQRkZnNUh4N280Tlhsano2?=
 =?utf-8?B?UjBhSllWME8zcTVuV1dWb0J6cUo5dWZpZ2xFZytud1Z3N3NKbkZicGg5SW8z?=
 =?utf-8?B?NDk0b2I1aXcyMVBUVjJ2SGhSVTV6Qmc5VHROVGpPMVgzajA1Q1p3N0pwaXJX?=
 =?utf-8?B?RHlSblRCVFNkZm1KRVZHb1VrNDNGeEp4RkhaeVRWdXlhSlNuSFNlWHd5TVFi?=
 =?utf-8?B?U0hIOHpUb2FPVzJDRGsyZmNwQmtUR0t1VVV1eUJObVErZ3IwTWZ6Wk1pTHpH?=
 =?utf-8?B?M3lwLzhpMnAxYk54bm1qWE11U2FFemZCVnlXbjRla3ZFMnlnS29BcUFDTWV2?=
 =?utf-8?B?Vk5UTGZUemV4YjlyK1M5QmwzTDh4OTJjb0E1WlR6VXNJQWQ4elNrSHR2RkhM?=
 =?utf-8?B?SkJrZkIzVnZXQ2w5a3dVYis3UFB3dGI3NklJbEQza0Y0VHJFMEhpOVBuVVhT?=
 =?utf-8?B?elovTFNCOVdSem1pVEFkY1NMOXJaMlpPNWxrUFdzd1orc1Q5R2MrYmFOMHJl?=
 =?utf-8?B?alpaZmJzWjhsN0svQzZFSjBKRTBYL1NVQjJ6aEJDbVVFWlM5blRtM0xROHhI?=
 =?utf-8?B?bHIya3JONGNUeXhoOWMzTE9obVhlRzl6U3pNRk9tT25sRnN3WVFOb1lQNGhP?=
 =?utf-8?B?Q3F2a3VoOTFtWWc2eTdJZ0RuTlVLNzY4ZGFHM3lSZWhZd3dpVjBqTzllWU9B?=
 =?utf-8?B?TnpOWldlc0FwS09SL1Q3bVlLS1VITEN1QzJnV3BzM0VycXlKWDlHdFZ1aXpO?=
 =?utf-8?B?aEUvclUyZ0YzOFpYMWYyYmk3elFMaVB0aFA0b2hYYUhNb1R0U3cyWFF0VlBP?=
 =?utf-8?B?RnY0aEdEcFVVbzBidERoK3FWOURKd1NjeTJtNG5SWWczM25hRE5lRG1wT2R2?=
 =?utf-8?B?Vmd1dWRibktyNTVscC95b0tZd3RTSDJTanVHVTRxWDcvd3ZmdmhUQT09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e66229-d74d-4727-60e5-08df43a9f124
X-MS-Exchange-CrossTenant-AuthSource: CH3PR18MB5671.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 06:22:08.6940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iVJ0tSVh+satdHZwB/NrShB+LJ7edRfE2Df8GBZWDcpzDbDog2cjecX6qUNLMVPreSqW+spoB5N8jcQ2p8ZA3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR18MB6132


On 02-11-2026 08:25, Jeremy Kerr wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
>
> Hi Akhila,
>
>> The Axiado AX3005 SoC has an integrated root-of-trust (IRoT)
>> co-processor next to the application processor. Security protocols such
>> as SPDM and PLDM run between the two over MCTP. This series adds a
>> transport for that link, so the host side uses ordinary AF_MCTP
>> sockets.
> One overall thing: why not use the MCTP MMBI (DSP0284) transport spec
> for this? Sounds like this would be an exact match for the MMBI
> use-case.

Thanks for the review. To give some context first:
this link is entirely internal to the AX3005, and not for host communication.
The IRoT's MCTP endpoint is only reachable from the application subsystem on
the same die, through the mailbox and the shared-memory carve-out.
There is no hardware path to it from outside the chip:
no PCIe, SMBus/I2C, I3C or USB connection reaches the IRoT.
So this is strictly one point-to-point link between two fixed endpoints
on the same SoC.

You're right that the mechanism is close to MMBI: shared memory plus a doorbell.
We looked at DSP0282/DSP0284 and decided to keep the existing protocol,
for the reason: Interoperability, which is the main benefit of a standard binding,
doesn't apply here. Both ends are fixed on the same die, and no third-party MCTP
device can ever be on the other end of this link, so carrying it as MMBI would
add nothing.For that reason the driver stays a narrow vendor binding:
It uses MCTP_PHYS_BINDING_VENDOR and matches only the axiado,ax3005-mctp-irot compatible.
It isn't meant as a general shared-memory transport, and it doesn't claim to be one.

>
> [Also: CCing Adam who is working on PCC, which may have some overlap
> with the mailbox protocol used here]

Thanks. The two look alike: one shared-memory window per direction, a doorbell,
and a completion before the window is reused. The differences:

AX3005 is a DT platform with no ACPI, so PCC itself isn't an option here.
Discovery is in-band. At probe the IRoT replies to a mailbox message with its window
addresses and MTU limit.
Each packet carries a counter, so a resent doorbell is ACKed again without the packet
being delivered twice.

Adam, if you see something both drivers could share, I'm happy to look at it.

>
> And finally: how confident are you that the peer will never be able to
> reassemble? Even if the peer's own MCTP stack may not reassemble,
> there's no chance of it bridging to other endpoints in future?
>
> I have a few (minor) comments on the implementation, but would like to
> sort out the overall protocol usage first.

The IRoT can't bridge anything to this link. As above, nothing outside the chip has a
hardware path to the IRoT's MCTP endpoint, so the application processor is its only MCTP peer.

Defaulting the netdev MTU to the negotiated limit only makes sure that today's peer gets
each message in a single packet. It isn't meant to stop anyone from using a smaller MTU.
min_mtu stays at 68, so if the peer later reassembles or bridges,userspace can lower the link
MTU, or set a per-route MTU for any EID behind it, without changing the driver.

If you would prefer, v2 can default mtu to the 68-byte baseline and leave max_mtu at the
negotiated limit, so the platform config raises it explicitly. I'm fine with either option.

Please send the implementation comments when you're ready; I'll fold them into v2.

>
> Cheers,
>
>
> Jeremy

Regards,
Akhila Kavi

