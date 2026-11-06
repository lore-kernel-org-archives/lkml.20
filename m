Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.51.81
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793958561;
	b=TjLz7MTWH4sOiLLPSM+H5BvTyXAGtzFs7jgLBL2HOAWM1ZlKMZ4tzsxPYD1WwdZgGcha
	 rz/HnDd6Uwzk7XQW4woZL0lVj8N4CsrkR4vLD/gWKxGV8349XJtOX9zxoc3O9p+jRzlcy
	 q/H7vP0Nn4uAAVvmgcY9+TO/HVMQHGzmVtTOh86lXPVavJngRiag4KVpEoEBHGJRIUwrQ
	 9LvJA8ZlJHu4zX2/K8AxZGhlZdMH5PvGCGgRjOnJI7cwVOgITp1fmVI9j/HG0CtQTdk6O
	 V6jfRkFsywXO/g+92KNlO1cKbWKs/iKSuWMckWdL+XHDW22QBGyUsyTU5Wn5ud29oFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958561;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=S4y4HdRxiLYtQLy/+Siq8nVg3Yo/6FgZ8i5zgoTMt9M=;
	b=EYRdUEgf1TKjv0cfCz+Lo/fAAE3GGCg52M/19FSlZomo+a9cWV/ocKvTIGfZ34FVuwDC
	 XRHeoWnvp69xrCBmNMRmbeRBfUFW9tQnavFi75SmrnNPLPnXCglQc/0HG0fzDc645HMsB
	 DvvrWa331TsL/eMOad1rqtoM7lMcjpghJ7USwRO080oCE0k5obIBLKtJYPmVr83FbK8+N
	 PZEFaLb0IpEij5L7h+u3tUX+ULwEJY88GXjbs/a7tT/cDpUDwcpDTOtb2Q9ZaUmBbMwHO
	 BOOgVA/mtM5qFk6Xqe2UAfSUJa/68s4sZt0GmHFhYR+/60JMWtn4Wm/RWFB6eVLl6Yg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=outlook.de;
	spf=pass smtp.mailfrom=outlook.de;
	dkim=pass header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.a=rsa-sha256 header.s=selector1 header.b=QnnXk8OU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.51.81
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazolkn19013081.outbound.protection.outlook.com [52.103.51.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236B5606A326;
	Fri,  6 Nov 2026 09:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 236B5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.a=rsa-sha256 header.s=selector1 header.b=QnnXk8OU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVahSN41gzMBdPMgKOlvgio2afVd9gdoCR6xW/cSNQ+qBg5Z/aAlT6uX6QO4h4Chg0z6gaVtWJLsUStgFMp8pCLzlYDCfvoDOZ+hN/gAZ32+YWpjdUZpPQASBcqEezyg4UTixnXyBo46+lA20SP8clgCXtMwjwfQa5kb3CDWfFHa+NAul+4SJuMCT3dhdtyu+bJsPkA9D5B3wbVCGbY1PgBC1RKKofvKDDDktfJyg/DtEcpbyc8EbCaQ4b6YAzxzdqtlXFi/7gWa03ui32t5un82y43n8S+GRJRwqIPyD5JiknDomQbYD/WK4+SdmXuRH5vc3sm5QkP/eZgSH/ut6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4y4HdRxiLYtQLy/+Siq8nVg3Yo/6FgZ8i5zgoTMt9M=;
 b=JbADUVm1a9XwScizSdyTvwRxKKNiQ2EdLKlop6/tvTZVa+RVKDK3GFrKObgGJCmm1yifr4SqnTI+mkza/bd4bLqhbGlFiWXA3Gtj3nwGl3bKZMgR/w8H9kqeyG77qsZE7iQ7EzfXU9lFg1woHJ7YN6UhhIK9GBhwy/NnVaj1/im/AowYgml/Mg6oPGT1/PodpVryIqxVi280Ri0kA7r1EuRsgmfLJtrXrnwIR4RtuSGMI9Of87l0FozlN+p2hTUYu++fY9N7uiPN0pAbN6jAQoUNGRTBWGWv5VldKVivMrovcDyn9gGZqcKcHWicTx1nVrMNlQzcaoqcybzlLVufRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.DE;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4y4HdRxiLYtQLy/+Siq8nVg3Yo/6FgZ8i5zgoTMt9M=;
 b=QnnXk8OUSJOZh98HA5uF2tFgU3q8k41R7gBo3ZKty9W4kNcTnVzoWiwWdueg9SIim/QyLHEbpO6RspdzAIOTnRsZS9QcirZANwxJhjJRxDTpSZiQALyGSTCinAMLQD7o5gqNgvh4N3vuKjFJ+L5RG1GXUylOoSf1ZopN6Lu7ByCsLumsU/Oz+pHNqetmtDEqjgdWfbZxjVJD+0GRG5ThITUXx4HbDnWD7dMKarIwxwmCYFH9tvLmthUAS8kdr2k115ybipm2tKZX1cHnv5oMI1mn5hqVcS8b41DsAfvAU3ocd7kCB6eTh5UJGGLj5zwzSRtyW8GIlkpOzTXOZuBCwQ==
Received: from MMZPR08MB549315.eurprd08.prod.outlook.com
 (2603:10a6:190:28::19) by DB8PR08MB5450.eurprd08.prod.outlook.com
 (2603:10a6:10:116::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 09:49:16 +0000
Received: from MMZPR08MB549315.eurprd08.prod.outlook.com
 ([fe80::21ab:3314:172:c7e5]) by MMZPR08MB549315.eurprd08.prod.outlook.com
 ([fe80::21ab:3314:172:c7e5%5]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 09:49:16 +0000
Message-ID:
 <MMZPR08MB54931532353849461514925621DF762@MMZPR08MB549315.eurprd08.prod.outlook.com>
Date: Fri, 6 Nov 2026 10:49:13 +0100
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Christain_Stefan_K=C3=B6ver-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 2/2] media: rc: meson-ir: allow the receiver to wake the
 system
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, sean@mess.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261025192320.209446-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192320.209446-3-christian.koever-draxl@student.uibk.ac.at>
 <CAFBinCAaV0WEsO1oNF6q1t1hLF7oeO4oEpJQY_vHXvuQbWA47w@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAFBinCAaV0WEsO1oNF6q1t1hLF7oeO4oEpJQY_vHXvuQbWA47w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI6PEPF00000206.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::90f) To MMZPR08MB549315.eurprd08.prod.outlook.com
 (2603:10a6:190:28::19)
X-Microsoft-Original-Message-ID:
 <c34c8a73-3c28-4aa5-bb8f-f05d946d01e7@outlook.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MMZPR08MB549315:EE_|DB8PR08MB5450:EE_
X-MS-Office365-Filtering-Correlation-Id: f44ad0b2-50a5-4b9a-c8e4-08df3beb3851
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19101099003|16051099003|25010399006|51005399006|6090799003|15080799012|19110799012|5072599009|8060799015|23021999003|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2Naa2JxbVYyZkFsSzhMNVhzWC9LRXd6TXlwbktYbmlKa2ZQUlBqZmgyNk5l?=
 =?utf-8?B?RmNnbjBrdXFUbTJCKzlDbng4bk1oQ1IyUEhvRGt6dUZWMXhjekR2MDVSYVpH?=
 =?utf-8?B?SkRwSis5YThkMk1jY2l6SEFraEhmMXdBWlhkZGRFcGsrRWM5aklxT3JFS3Yr?=
 =?utf-8?B?NnFXY2l2alBXejlnR1VHMGRYVjMwM3YrUS8rWjRLMTNOOC82RzQ3V2dEdGRv?=
 =?utf-8?B?UVpkaWNGUzdwRHZiZERQK2FZUGR4OWZmQ1VrdW84NGVxZDFwdVNJWGNCa2tI?=
 =?utf-8?B?UE9Yd0NOSVUzUlFUdUJERm0yaXJiUEo5a213TTNGQzJKUDJQMnRDcUhRREdR?=
 =?utf-8?B?NFRhUFRzSjZzQW04ci9zbDZqbVo4ZHl0MWJHc0RGUXJYMmdPMVVyb3QvRGRM?=
 =?utf-8?B?elMrWXYrNUF6WUh6ZFloVUxNOW1vL3FzNlRGaTZ4cmVXQjRzaFluSDY5TmJz?=
 =?utf-8?B?Sk5NNWZtTG9wc0J0YUJDYVo4Y3NqK0x0OUhxRnJTNVBRZlcwUDV2SEUwNEs5?=
 =?utf-8?B?Y2hrenVXT2VYVk94QTI5ZGhDQ21ZTUw0NVFWZnNLaDg4UkRxRkNrQmQvb1BN?=
 =?utf-8?B?Ni9BY2dKbDZEWHdDN01BSElkRmYxdWwrY2wydUlDQjUyWUNXUFNYcEdVU1BY?=
 =?utf-8?B?aVlWNFdkeGRUS0ZvTG1scmNTZlNqQjRrUjNSUW5PN3BlRnZDS3pEN1FtckpC?=
 =?utf-8?B?d1BKMktkbk5UWFVKN2l0TzBkT3FFSHBzVHVDOGJ5aDNvTUhpeWl5bHpWUThh?=
 =?utf-8?B?KzZnOFpvTmo3S3A0Q1pHM0h0ck93VXBNUXI4Vnh3am5XYld3eDI4THJINlYz?=
 =?utf-8?B?YnZ2aExDcXVRQ2IreWVKNUd5U0JHL2NRaW5jdmRMQlRYUHAyRy9uemJKOTdu?=
 =?utf-8?B?NlJZMDlvME5BRDlsZW8zc2o2T1ZXMDZVWHN2R3RmUzBzRUdQWlpMZk1jU1pz?=
 =?utf-8?B?cW91aUk0WG5xKzBrMWdOK3RnOTV6cUFkYllBNVR2NlRDZ2dyRlZMUy9OeElU?=
 =?utf-8?B?OGtwYTN0NEo2enM5OW5KN3BQM0NYOUg3NFBrYWRsZEFpTUUxVXB1YzBhWmpp?=
 =?utf-8?B?ZC9wdnlOVThTcFY5YjJEZ2xmcWhDZDRPQkcyTFl2bUF1UDUvTFRsVGdiOUVu?=
 =?utf-8?B?T29Nd1JEN1l5aUw0U2IzU3E0UTdJMGwzNDV5c2swaCtGNzdoaEE0Q2hST0cy?=
 =?utf-8?B?SHRQcytreGVzZ2YrUlNTekUwU2w2ZFVibTVFYUxXMjJTMjF6MElOKzZXZGNF?=
 =?utf-8?B?NWRIaS9KdS9lbVZTQ0d2aWlyY1RXbCtiSkRHVmR4TTRsa1RkRElRSktBT2hC?=
 =?utf-8?Q?rFvUC9FKHmIHA/b9g0NQ0xdhLQ62+21hwj?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFFjYzZQS3U3Vmp4RkYyT2VaNFlwZWNmemlKMkFOb0lqVHdrNWdmdDRvU3ZG?=
 =?utf-8?B?NjVlRHJVdHdYcWR4YmF3RnhGeFdBSkwwY0FHTWdYRENMMGUzTytWdWZ4d09I?=
 =?utf-8?B?NUtucTZYNlF6VC9iT25hSU1DUHpGQ2hGN2lIOTRaUzhOL2xKRmc0QklQYmhx?=
 =?utf-8?B?TmlxTVEydWFjcFhPSFExd3V6bTZjRzU4aS93cytOa1IrdzRpQ2FOSUllaEl5?=
 =?utf-8?B?Y01pWVYzWUt5TEQzVmd5WGlaM3IvN0FvZ2tlcVZUcFRGNGZwdlNJMUxnMGtU?=
 =?utf-8?B?Z0JzOThOQ3ZtakZ3ZHRKMTUrSkNCTDFGdlVIWEF3a0RvUkl1OHo4c0V6V08x?=
 =?utf-8?B?TzEwUCs3QmJxdlVpWHVkYjFBQmIraVFhTk1VeURIQmJ5d2prNFROb1JuUWtR?=
 =?utf-8?B?bzcza0xYSUxSUkJOcFI4Y1VHb0VCbHRNRThidFF4WlJOM2ptQ2ZVQVhnM25v?=
 =?utf-8?B?N1NEeHRKRmhvd0h6VCtUQnYxTGZQa3ErYVNyb3NRTUFUN1VjRnZGanoybWlh?=
 =?utf-8?B?L2dwNXM1S1JjTFQ5Y0Vwem1NMmVmYm1QYXhKamNSc052SlBoczF6a3Y3a254?=
 =?utf-8?B?ditIZnRFYXB3a2tleGQrYVh0K3ZZdm9sYTlSbytlVEtnR0F4QUNSK1ZBMWlM?=
 =?utf-8?B?RVZ1Ry9uNkdJV1ZwRFJaR2tPeTN0SzBkUTVBWjVXL0hEbkpQNThmOFJEemVZ?=
 =?utf-8?B?REV6YnIvRVRlaUM2RzZyNmhOWWYxdnprWkNOL2FLVkI0eVRzdENwU2JCMzBv?=
 =?utf-8?B?YTNLL29YOTUyNUM5RVJmTU81UzRXNXJrMFpJR0U2MEkyTDM3YkRaelZHZ0lt?=
 =?utf-8?B?QVlMbjlVbFhjM1VNZ3licU9uNHl1WHpLWWo5Y2dHY3gxMktLUklIWEtQTFdD?=
 =?utf-8?B?cXMyaXRnZlpTejUzNUNEdFUyMktJSmFtMU02TUNEVU1wVWc0MjJDdVZJenVU?=
 =?utf-8?B?cUk2cnVKL3dZMEJOdWZ3bE5wTG1FNFRvSVpKREx3RDlvQ3lIcGRuUGo0dVUy?=
 =?utf-8?B?M2pIZlkyQ3NWTEY4ak5aYmR3Rmhvci9qZXhIaHJ0ODZBSnlBMlBGbGZuMkRU?=
 =?utf-8?B?c1NucVhTSTJ4aHE3VDIxMG40c3A2WjFiN21yWVJFV3B0K1VVcU93K3lwN2Zr?=
 =?utf-8?B?ZzBoRWpaeUwrMGdOVVZVSnhWc3hXVWRpdVkzQ05LWlYzVnFMY1VNVGI3eEE2?=
 =?utf-8?B?SFVKVzMrVmZ3bGV5Qzc3SkFrN283aGw1RGRPbUY3WDFJQlMrMHplU052SmxM?=
 =?utf-8?B?WW0vamFad25acVRxNURqZWNyeDRJZVcxWTJFS0U2a0c1ZDhJSUtoWlNUYnVi?=
 =?utf-8?B?bm54UXoxSzUvZUl6UlI0MUwxRGVzL2NHV0FJSW95bXd4cjBVK3ZhaHNoVnQy?=
 =?utf-8?B?M1pJc3ZIK2w3b2NZT3NCRVgzRkI4M1g4MjJvTjJuUjhERGlJVERUeDMrL3g1?=
 =?utf-8?B?TElIMnZsb1RxcU1SUjI5TFE0OENjdzlVNlZKKzlBd2NqYjYxVGFOa1VuNWxG?=
 =?utf-8?B?Y3AwMHJJMS9VR2xQem54WjloWHJCVnZtVzhtZGRYellBT1dtTUpUbmNLWXBn?=
 =?utf-8?B?bkNFNHVQTzVnZDNqbHZUUkpjUFg5WVNpcm93QWdiWWp2VjVGY2QwbGplMndz?=
 =?utf-8?B?NklJcjloUDJBRkVTRW15VG1maTlLUjd4dXhKekVpMlZPSDVVa1M4QlM2U3VQ?=
 =?utf-8?B?S1RUdldOWjdWbzN5NkorN3lGQlhDTmJsNHdpbXRZbTFHQjFrc210RmtGbVd1?=
 =?utf-8?B?elBKbmQ3WHZNeWRFWEdvTHV5RHhGOTRtRWRkdVpjTlZ0bmZsRFpMeXFsNFJ5?=
 =?utf-8?B?aENMNWYyOWVOdHdZY2tSNlZOdkc2Z1VaRGFWVTlNWWNWWFNmcUxzdW94ZmdO?=
 =?utf-8?Q?+epEdnylQHhkq?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-fbb9b.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f44ad0b2-50a5-4b9a-c8e4-08df3beb3851
X-MS-Exchange-CrossTenant-AuthSource: MMZPR08MB549315.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 09:49:16.0188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5450

On 11/2/26 00:01, Martin Blumenstingl wrote:
> Can you help me out with better understanding: is the firmware
> involved in suspend or is this CPU core idle state suspend (meaning:
> firmware is not involved)?

Hi Martin,

a follow-up to my earlier answer, now with the s2idle test done on the
board:

   - s2idle with this patch: the remote's power key wakes the board.
   - s2idle with wakeup disabled for the receiver (the old suspend path,
     which switches the decoder off): the remote does not wake it, and
     the board stays asleep.
   - Deep suspend is woken by the firmware either way, as described.

So the patch is needed for s2idle and does not matter for deep suspend.
For v2 I will reword the commit message accordingly and replace the
"Tested" line with the s2idle test.

Best regards,
Christian K.-D.
