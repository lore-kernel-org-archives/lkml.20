Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793716292;
	b=YkV/X6E5jeesQjd/TaiKgXA7K3hcAmtU09NrAdN2tXpx11ExegPMmF2TTE6gijd9ewoE
	 vTGBYt6dDCczhMHJEC69D6KxwK76Hv0SfAJsGsXsoBaKbOjgq0iHHX9iCFlXN31wD1y4L
	 x4fKdE2V0QE0VrdTx5U0yqCF50cTY+o7wf1l36E4uhtDiQy7f5lMxsAv/cpuIQ0T0NENj
	 dfND4wxsSk0CD2xl8Imi7b3MgJwSE4kK8n4sHQbOmCSDdG5wxbxtCGuIDAiO9BWGJWbZm
	 Al8SF7cY0RI5Nzs97Q9HxbIYc7HAK0I/E9EAPXf5Pf6WqrZajdnqdKPt2612yGCr1ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716292;
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
	bh=uaZI0ocTGUV6of+6Mm3wfJ0f6RjHHhvK2KNnt+ql8yQ=;
	b=pON76c0+IhYxFDiDHTIQBxBiUqziyYduJ+iOCmAVA5VJmSWHCDH9iu7q90Szx5ZW+xiN
	 YTPVME/5B0CDKKaWnhdT+TjL+0179skPanP6juVwprbLyKXuTdoxEkqG5pzyW7SEHoot7
	 2HGxSdnlU9uVDYGWr+RlVsoMEc76uVpHgO7ChxRkH/BaQlXGf/KWfsm1VE2IKSFGxEeQD
	 Xyk1BMmbkQJdbZhXVM0UPAZF9emny5mNYr7acPG92GyVWpmEumpxadoULdGWWQ8xhBw94
	 XUQSuQJ4Zc7Zt5w4q/ftDbgKsOqfE0ynw5shtPJFBA0hGf7bXAVB6Y6W8BhGDU617JA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mobileye.com;
	spf=pass smtp.mailfrom=mobileye.com;
	dkim=pass header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=selector1 header.b=iNFiLWBI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.0
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010000.outbound.protection.outlook.com [52.101.84.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACBB6085081
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ACBB6085081
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=selector1 header.b=iNFiLWBI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnRorzl/4TqULBaK8a3ekeXsQsglC/2DYJsvyYZCOqVy4qYjHnKe3fnIidMNxg4BONmszri1QJLhiGBRbU4tZSCNCl24Fke8/bgXBm8NyJSpeQ5UZ3PNZ6ecff+XSs4XhxHZ6ghDaiDrIDIiHF3yCE3nDEaw9Z4Nu1Vve64b04gDofhTBRMu/4a8hvarx9vUIHu0UE8sM9PuoNfSd1eMAoIEPYrrrOnUSqgMocG8hY6hM//hNLObFf2wXIXqwHlUshUBxIdkqpomHm7u7IKoYwzXjmlj2zVfPyq9qR048NcLEql6lsO4/+2UgVylynZy/V8Iu5Zil/mxPckRZYZPeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaZI0ocTGUV6of+6Mm3wfJ0f6RjHHhvK2KNnt+ql8yQ=;
 b=GX6F4q3jFd6T/WtjUNXbTEceuDxbiHhgJjLFxSpJBa91GiAQPtCZDW2GZNFR5r+iouOMhcJz4gRw6ltdOrU00Z1p6ktG4rdUOnfV/Fi2/LRTFywlWhmJrWan90w+NdM0T14USfv+ZT14ZFwMGhLNXbKgY8K1eGvaRw/IKVHKJg3C4jdxpdew3N/5Okmfk9D5xCJK4sYDg0OSKzGh0712YkZT72KFb14lr9HPb8dKS8QEWpn5LqeSVi03QHM54bNMzDKw70Dj2aNRHyHc5uVvuNU4DL7ydOHCFpVUupCdeI9AeA+i/FxnBcVb0xW4DjP89ZkFd1BZQPWG+gJ4omQTnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaZI0ocTGUV6of+6Mm3wfJ0f6RjHHhvK2KNnt+ql8yQ=;
 b=iNFiLWBIgWq3RuRlqIMPfrYKSfiTUjh4Qs12Oa+H9aexCWMrj2ogcmMTFZGxRpMloTYGOtQDkbDm9Zjd4OVNrUI6YHGNEffx+CHodMtxfFqjINeNkR/MqBs6tsYmw53ejuRBHhI7xzzWR4KZhyIWwMKovyy7ke3hmEuHi5VZFYM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 (2603:10a6:910:e0::22) by AS5PR09MB6708.eurprd09.prod.outlook.com
 (2603:10a6:20b:678::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 14:31:26 +0000
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2]) by ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2%4]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 14:31:25 +0000
Message-ID: <4197b67b-0ef1-4ea2-84f6-b142f67739de@mobileye.com>
Date: Tue, 3 Nov 2026 16:31:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] riscv: accept the atomic extensions this kernel
 was built with
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
 Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com,
 torvalds@linux-foundation.org, olof@lixom.net,
 aleksa.paunovic@htecgroup.com, arikalo@gmail.com,
 Boqun Feng <boqun@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com>
 <20261026-lrsc-only-v3-2-ec29c8190fb1@mobileye.com>
 <20261102-shredder-pauper-67ef6eaae556@spud>
Content-Language: en-US
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
In-Reply-To: <20261102-shredder-pauper-67ef6eaae556@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TLZP290CA0015.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::11) To ZR6PR09MB889505.eurprd09.prod.outlook.com
 (2603:10a6:910:e0::22)
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
X-MS-TrafficTypeDiagnostic: ZR6PR09MB889505:EE_|AS5PR09MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f9f96af-a79a-48fd-0d3a-08df39b723f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|11063799006|56012099006|4143699003|261009223027099003|261102123227099003|261028144727099003|261102124527099003|261022075727099003|261022105027099003|261026121527099003|261026140227099003|261021121427099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	C8RGgaIeUkaOxvrvsxDsxFEtsY8mnyqO6q3fKiVMtv2+s8Tyo+E+tmDLlTpqe4JDwXd9euJ7fTnaTj4vExuMNAwh0hvHt1GGZKFFbO2TsS4DXxps06PZgmrfg0M2VGlukCYRdZsrhh27ZJsAJ4ukjykFKvMBdElb+7WR9gzcJo/J9H518ppBPI53sckxWpuUbsBReSNyOwAmbThEcZ8kqGILg3ePOoR/Y2AZObZkEoCZqctToDvr+TQ9v/u0F/kUrheAmjhfIj3nO8D7V4OM8CkqGErmBw16IO7oLgtCcZ5tYy29b5QtErm70ZoDY6mIKGXZuXo7JYTkfRpe0SAy/vyEVDCJh5vISiE0yvK5YA9iXdRVvqB+jld1HfyZSaDepBHbW0jZHYZJa/sEwjVmGm49S/9No9vB1MsAFnIQitnEdm4bd2VfOFnHVwZjtjvTqL26HkGyC7hXOC03mB3PTkXRJIIX2Q5SJVHYSGR/2quQkPzvS3XBIo7wlQh2XD8QoTn33yhmJUXPtCXL5mRgeaej3cpbL5W/oskEEVjwPcRv71gQpqpRiwMu6tSwTkG2s7MRQTIhENModFzaINUCDQj1ag5YqQT252+hYboyK/n9pdRPq+5cYzZmUdwa48HYjXfv3pSuXsc7WpaoSJfgSLK5PFzLz0quvLU+ARX1Hrs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR6PR09MB889505.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(4143699003)(261009223027099003)(261102123227099003)(261028144727099003)(261102124527099003)(261022075727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFFhWDFwcEpJbWQzL1JyU2pDVFFURkpYb0RVd00wZkhRbENsWkFJSXFGRkpy?=
 =?utf-8?B?cFBNTWZjY1R5M3kwOHErdk5qTGJibjIzd084QWc1cnpzcDdyY3UwVi9ydVlD?=
 =?utf-8?B?NXFxZjROS216eWJ3K09DcTJpa2t3WGpFMmxzSW4xQmcwQ2VyYUlnQ2NIYzRx?=
 =?utf-8?B?dzg1U2h5THM5R2RzVzdmZ1ZwTlhqZGtyYjhtd2lHMURPTHRQWk9PN3FUcFFI?=
 =?utf-8?B?N08rMkx0b2RETit0UDBUcFhuZ1dDb1FMcGFtVjluYmRlak5sbVlCMXpJTXZq?=
 =?utf-8?B?bjI0MHcvZWZhTE5aaEpuQmFGWisxNVJYSzhEOWxSRUQxNERueGluZlRhMlN2?=
 =?utf-8?B?bHpjQkFTNXZGYllONVMxTDZMUndLdFczOENyUEVrT3Z4TmJBQ0xleSsvSEQz?=
 =?utf-8?B?RmlnZnFQa1dJakd3c0lUZS9WVFh3TTY1RDVNNTFScEc0eENWU2EzcHJQb0RH?=
 =?utf-8?B?T0ViTU9rMS9yOUxDZEV6UUdxZnc5bEg0clE5d1p0VmRwRUREc1dtbFVHazRK?=
 =?utf-8?B?dnJ0U3hnQ0xjd2RReFhQQkNKU1ZGckl1QXNJaFlVTmhGSFVmSGdhUUtMWE9V?=
 =?utf-8?B?NlNXb2gyYnUxYk1oWnh3ZEhpM0hhUVpZSGlUOHhIL1ArSHdWVUduM1A4b3NI?=
 =?utf-8?B?RGhJSmFzYTlRWE8xdHRuWVJ2RUQ4R0w4UXNRQWxzYXBqc3JoLzRzS1lPa0RP?=
 =?utf-8?B?NWc1bzJJSU9panIralg0S0pWa0JBRWhjbHQwRU5DRjRDNUZ3T2JVd1AxdzRn?=
 =?utf-8?B?MGM0YzdJWlZubzFQcW1LYmt0SmxhVzlTdHA3Mm9Hc2NOMWVCY2wzUWh3U2Fs?=
 =?utf-8?B?aEZSMHAxS3E4aVpGMjc1NnFFc2RGcmtRb21pRHEyc3Bjakt0ZitVZEZ1NWM0?=
 =?utf-8?B?ZHdRODBTZmhLQXJWNzVPb3pOSmVqVy9jdkxlbXpTeWFaRzFndUo0MitRbVJP?=
 =?utf-8?B?ZExIYmM3MXVReW41NUZPNC9UUkJPcmc0YXlNd1FlTmI1b0FRNW1GUzAzKzFS?=
 =?utf-8?B?T1F4c0dIQklaZlVKRWkrVys0TDJxQTR5TlZzMFhKWk1GUmFsY0NFWlZwUEQ4?=
 =?utf-8?B?eUhsTk5lbWZTb3VWeHdkMFA4bGYwZFhZRXowZFZmb2diVXB2cktGRFBQUTRF?=
 =?utf-8?B?TWx4ZTM1UFVXNkJ0S3hPSDFkV3ptOEZwb1owTDRUSDRQalNKY1M1S2RnY3ZN?=
 =?utf-8?B?OTFBOEw2WklZZk00SmpsRkgvTlhTaGhKdXJYVFlTWHVrL0pockdPNjRpY0Fv?=
 =?utf-8?B?SlhmSTFJejdEVkNsR0tsRlBVQmNuS2k1a3grQldPT0hLanJpeCttMEFrVUtN?=
 =?utf-8?B?d1RoTG9ZSFZvYStDWThlazZwb2h5NlBTUmdxNDJTbHZQV0dES3M4OWdDeUZ2?=
 =?utf-8?B?cTM5NkdhZ3ZjcEVoL1krZzEzTlBqNTZ5YlgzU1Q3ZU41K1kzZk9Dcis2RjZn?=
 =?utf-8?B?UktYUlhDVmwzbmVQak42b2hzRUtVTW5oYzFpazR4aExWREZaUnJaQmpxUlZD?=
 =?utf-8?B?TEtKeXZEbFNGejVYWDFWWGMzLzBpNXRQZ29NNEJwM1h5VGhIaXRqejE5TUpj?=
 =?utf-8?B?QUtxK2lzamdTSGRMTk9kTjNFNy8zS0tJTFFkK0o3RnlyaHV1Unc3SmVMR0RE?=
 =?utf-8?B?dnVwZmE2b0xqakcxNEVJclNWYzJhbFJaVkZoS1ZlYWZVamt1WnhETyt0M0py?=
 =?utf-8?B?MHVRRklLMkE1dWZmeXJmcnZBMnVySzhUSWVNMFd0YXdjMkJITjhrWVBycG94?=
 =?utf-8?B?citPNXFlZXBsTEp4a21yTkJTZU9VNzl3WWRkUGwzOENVN0FMVmw3NkRSZTNj?=
 =?utf-8?B?MEVUdnJsV1RPdzN4OC96VjNXN1hodFU3YzhMRlJNRHJmZE9qaHF2dFA2MFR4?=
 =?utf-8?B?YzR3WTZFQTM0bExGeEZoRE9jbWgzWWY5V09tQTAxYWtkWFIrWDAySHlvWExy?=
 =?utf-8?B?ZmlyRG96UUlyRlNBVkFPVVpCR0xjUjZmUEZKTWFGTjVMOXJIK3MrUmVEcWtJ?=
 =?utf-8?B?Qk9nVnloa0ZKVFhvZFR5R0NJc2IvOEFvQ0ZqUGZGd0w1ckpLS3BoTlJwc3RB?=
 =?utf-8?B?cDRVVW45eWZGZXhVdGUwWmU1YnBlenNFZ3Y3NWtQVEhDK1hicjRpMUhaSENr?=
 =?utf-8?B?OEg2SGtDRHBrSmJDSVQ1bHg1ZE1qSTVIaUUvQTkrL0JKY2lGZ2Rsdlo2ZjM0?=
 =?utf-8?B?NjNtaFdlS0ErU24yY0ZYQkVzMU9ucTBtV3Fod0NpbS9ySW9RSzNBNzA5bUYx?=
 =?utf-8?B?V3dNS243RCtWZitsMGxwanBRU0JtN0dwcmwzUmt4ZE9adlIrbGRQVzBNWGhC?=
 =?utf-8?B?YmF6dUVaRnBocmh3RHg4OVRORXBjMDZhQzZWUDRIMCtva05FUnBYUT09?=
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f9f96af-a79a-48fd-0d3a-08df39b723f7
X-MS-Exchange-CrossTenant-AuthSource: ZR6PR09MB889505.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 14:31:25.6436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4w2d/Q2+UhgZt2Gwo25x2qT7uqpxI2jabCXCwW1o2SPtQXptZ78WZCCtGU0wpZEJeOspDti4DI2GKVe9IWSmbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR09MB6708

On 11/2/26 20:21, Conor Dooley wrote:
> On Mon, Oct 26, 2026 at 11:20:03AM +0200, Vladimir Kondratiev wrote:
>> riscv_early_of_processor_hartid() rejects a hart unless its
>> riscv,isa-extensions property contains "a". That rejects a Zalrsc-only
>> hart even when the kernel was built to use only LR/SC.
>>
>> Require "a" or "zaamo" when the kernel emits AMO, and "a" or "zalrsc"
>> when it emits LR/SC. A normal build defines both toolchain macros and
>> still requires the full A extension. The legacy "riscv,isa" fallback
>> keeps its rv{32,64}ima check.
>>
>> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com
>>
> 
> IMO, this should not be a separate patch.

I can squash it with previous patch.
My thought was: it address different aspect. While previous patch allows
compiling code that don't use AMO, this one is about correct
manifestation of the extensions supported by CPU. One can use only
previous patch and declare "a" support in the riscv,isa-extensions. Not
exactly true but works. With this patch, one can say "zalrsc" instead of
"a". This have no effect on how kernel get compiled but let user space
know exact CPU features.

Thanks, Vladimir
