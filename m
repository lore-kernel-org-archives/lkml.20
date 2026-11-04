Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793792514;
	b=ey1mUg0co72rmfsTaWXBGtKPx3vXYHV2FV79xbYBq9APYi0KE/K6HHcKkvuxZmyhePt0
	 HFHCc1MeYJ3EmuIMh07rgihfnSRjl4oc/CikannzUdvWHQgL4XkyCWqGdQmTsOnqwlir7
	 Gv2LOnqV9YVjuQhvL1P5TUbqPjN+ssbokzhyKW3W/n+eOlQr9c3/TKkn9ugQ1OkhQipfM
	 WTJFO6g231f0FogZ0eh2lsd7dDgaWl01UoboHTG2ac9qxGHTNT0R9hmaTnGsEwFCvS6S6
	 pI0/b4+wZhHR8uxqCUscEjLfGQdHMgoZoYumMzxzrTSTsSA2cr6J2obDEVlDiT63WAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792514;
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
	bh=A35hgcep/lsQ+GAMtP1yn/k4CnWU+R9xhFBn+NXyxAE=;
	b=dxhEsM+1642N2Y5J5ntRrDI9GmpSTD4q/T0CQ0zRBnucFzwJXgJMsPEH26NUd2VGSHgV
	 sW1ucZykqUzI69DL/NwefgDxhBpwHkko5p9Ra5l2t97kLb8tYX847YPR20Qet+DqWl0Qa
	 +k0kkEQ4atjnF4MO0kkYjEqzhXGjon5edRdMj3JbHmkjJ036X510tqk5rXCy3+4HkJKKw
	 fbTj0cx7/RAwX7RlCbRSM4/nwREXDiiySCYMqfd5PpJLK/sB5R5yzXULsZL8TVBu0cwuV
	 AWCvVWD4MME0w3IvD4MwZYn5kL2sPlzjHuFi4zYItzrelqcdmzWTILB2cAtPs3psrEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mobileye.com;
	spf=pass smtp.mailfrom=mobileye.com;
	dkim=pass header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=selector1 header.b=TJ9gwzUO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.22
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013022.outbound.protection.outlook.com [40.107.162.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282B5606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 282B5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=selector1 header.b=TJ9gwzUO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=csxqNYALcwULClzF1ADHuRtLcpHu8Lmj06j5SYXxDANyFWi7Ant7BLX5O27V8UtnFS1kMG1gJ2LkMjQs3dJpx6MIdbMuRpJDa9IEM8A0D22W9w34by8WhwzuEKFWiJ2tyVx4O/dQfH+vdWe6ldRloV3Uk/IwoCJHuNCkPxQF6ZCrtE5HU+AI5oE0fJ64n//u5C6LR5eLGc/PLbTLfej7xi+zZeGvEGWmCvRwqiNihTkFxOVxdI/pJ0jzg4drCyAVVzBbdNtNVLSI6G+rRuYThczeTLhqx1VGPmzpZ8ZHcz4O3oH4TDhEm9niW+oiyO6fzU5z2CwJ9CEbY/76q0qCqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A35hgcep/lsQ+GAMtP1yn/k4CnWU+R9xhFBn+NXyxAE=;
 b=JxImqcKLfxDEzozrlI3yzmUiHMy0Vn3J32mctO9kq+Coim/w2sgm6MC48Zddq+U7RCMdEnEjQjMsPIdPtVvHnxA4+h4CPIu+tzD0GROKmNsmKOz4y/WqoLOqW9j2L4D7stB8ZZ1DKcimS78oLwlqliJSRzJjA4+uWLle7fkQlKbWexaAAwniTcBPjslhiv1donw1AXP3LVpK0twBNcwNx6D0myiwu2Tn3NaMfDsEy483fHecQhsAFSfNMVBVxPS4AwUP5a6zOsDyJbFxAqqpULA1SfG1PSHkIkpgIEF2wst2BUi5ZpDOcfs9EgrOYPSNfFdZXTZb114qsbkHKhMycA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A35hgcep/lsQ+GAMtP1yn/k4CnWU+R9xhFBn+NXyxAE=;
 b=TJ9gwzUOlOJPpc0AK+E7KgyATZM8Juan5I0/5d7DBgSEvv5Byb+nz0tQjLjWpruYII7ggSrxHHqDL83gGz4MoLF5rPfCYpNostQyVD3MswrkSNWm+y3vnoLToaXauErl8WDZswYHPb99adopLqPIYLyeipCdrMmSAlsyX3qaMLE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 (2603:10a6:910:e0::22) by MI7PR09MB416415.eurprd09.prod.outlook.com
 (2603:10a6:290:109::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 11:41:48 +0000
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2]) by ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2%4]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 11:41:47 +0000
Message-ID: <28a25fef-2a53-4d4f-b43e-6e8740c08e1e@mobileye.com>
Date: Wed, 4 Nov 2026 13:41:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] riscv: build kernel atomics from LR/SC when Zaamo
 is disabled
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
References: <20261101-lrsc-only-v4-0-4e1d010463b3@mobileye.com>
 <20261101-lrsc-only-v4-1-4e1d010463b3@mobileye.com>
 <20261103-distance-audio-9b6aac0b1b4b@spud>
Content-Language: en-US
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
In-Reply-To: <20261103-distance-audio-9b6aac0b1b4b@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TLZP290CA0009.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::18) To ZR6PR09MB889505.eurprd09.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: ZR6PR09MB889505:EE_|MI7PR09MB416415:EE_
X-MS-Office365-Filtering-Correlation-Id: bc5c9635-de6a-46e9-7366-08df3a689bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|6133799003|10067099003|18002099003|22082099003|3023799007|56012099006|4143699003|11063799006|261022075727099003|261022105027099003|261028144727099003|261102124527099003|261102123227099003|261026140227099003|261026121527099003|261021135927099003|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	l6vxLel0P0X61Zb6hA7J/evc1TUs2Srj+Pk5WtaIYc0prtYuQC1vN8IqnJhGRxAupDi4PJazqkz4/kVB3t3zgtJiR8yHWEfwaqxWUewBkwfPAlP3KkFkoLS5Yjk5sR/u7y6K/DdPfK9HyyujIqvLTdbJae3QvxptT9epNQX7OtmxrNWNGta45yNKhaI3E73YAHIoWKIQG8uoV14/999axOuu9SmB2iTEI6Lz+y3w9jXSUDvvchdEGAV5zgzTrBZiAXD8pnHFyZiFXiNJ1W9F8xME6y4hR2hn4cb3lUsA+NaSkCQU3eYXoFuONrAVQPQH5/YEO5MYuwNvEJVXLVNHtt15QWjMHGJ8tRmkJRoJvzg48Rpt5roO6v/eepfTGz0KAi3Q9p2mOe5PeO3tcAz7SSo4hRH1u+f/7ZmmdmN+rKi6qQLOfLFvJyvUB3fCKNfwLjG/0E72L3fsDdgdXCAXzFOA7xwgUsrFGtpG4IQMPvFRaRJM9rcPpRgjoy09vNOM8WSZQJGGfy2pOUXuZ9rIOw0T1xK0Kf2UTJjFUUgiTi8Wsh5fT9HLe21afIVtyIgYSTDumWhOVQHQgBgPcPKUpBCPW5Hb4nT8ZJJMpx2TWiQ9repeMa7+MICexsWbLlKQyixQeMeFX8BEXzsQN3z5HtAxnyUSlYMb9mhZ2Q1Y448=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR6PR09MB889505.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(3023799007)(56012099006)(4143699003)(11063799006)(261022075727099003)(261022105027099003)(261028144727099003)(261102124527099003)(261102123227099003)(261026140227099003)(261026121527099003)(261021135927099003)(261021121427099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3p1Tk02MXJHc2tEMkVhejF5Z3dYenZOeW16NVp3U2JwY1FVN0svRUZXUlRk?=
 =?utf-8?B?MVkvMEI5ODFjMmxlYWxuS2RjRTNqRXdUV3N5dzFPNkdQdHEyZTEvam1hanBX?=
 =?utf-8?B?RlllSE15WG84YkVpc0hUWEljeE5TT3p6S2tVTnJlMExnYXhITmpzSS9DV21o?=
 =?utf-8?B?Y3RuYXJZdmd0Vmh3SXMvVWpKTkdqK0tCL1RLSTExc0FzOXp6dGI2ZnljU1VR?=
 =?utf-8?B?S2NrZWxjek9RTmFPVFdySmtzeVUrQ3I5VnU4MGJJc3gzVVZGUFF1U0EyZ1lS?=
 =?utf-8?B?SjdqMlRTSkpuaUl3VWMxeVV6eEJ3amJLbksyQnZBWVNYTGMvUHJyUlpXUGl4?=
 =?utf-8?B?SmNaNUh4MitZWFdrYVdjUEp2RVlpVkdjd2o0THNnUGp4SXdISXgxOXZTVndL?=
 =?utf-8?B?dEQyUkpyM0NQdWZDSU1qbzlCLzdGVlpIaGpQUnRPZU5UWlN5MjlPaFBxenZB?=
 =?utf-8?B?RmhNTk5Ka3hvUGJDMFZreDFQWE5hQzhHTEJTVVozLy9DazRwdlRmVWFsdElN?=
 =?utf-8?B?T29JbEdNc2FqWldzUU5EY2ZtTjFKTWN0N0hZUEk2bWQ2R0JvN2xzZTB1WmNC?=
 =?utf-8?B?V2hYeHhSLzdmTGhLMGdqL0NMU2JNNFlTdkwycUxQSHRVbngrUHhmWTN2VFVV?=
 =?utf-8?B?Z1pweUo0SW5uRGxTd1BPcU9mOE9HRFJ3WkE3anR5djJ3VlU5OXJxQ0tvaWRC?=
 =?utf-8?B?eC9NY0Q2VzlFY09LWDE3Tm04ZjliR2FYTm9YSzN6ZS9HVXdHTWVrREVWb0pU?=
 =?utf-8?B?TWZwZHdKRjY4TXFkcjJUSHNkY0JLSjQ1Qm1lUmlmTzJQSGVHQVNEMVQyQ1Bq?=
 =?utf-8?B?RE9yRjJJUk81MTZpaDhPUmFSNmFNaUErS2VET251TjZUaFFHNFA1RXR0NVBF?=
 =?utf-8?B?eFhmSkNpbnNEUWhmNEJlTUtpaUVGMHQrVDl4YUNUOGlWYUY0dS9xcVBkNWpI?=
 =?utf-8?B?RkhIbTVBVHZsWk9TUzQ5cStoSUtUbGNITTdRcysrQThDQ3hNSFcxSklaelNF?=
 =?utf-8?B?NEJqV0pJTGNhTnZkMXIyaWd1U3Mrd1BucFFEckJNQmVvL1ZROHNYQ3luQm1j?=
 =?utf-8?B?ajNtT25qb1JrSG01NjhBcndUbTczME1ONGdVMW5mbEpRNXNhZWwySzlkL1BX?=
 =?utf-8?B?QWlaTFBFQmo0aVBaVExDSDl3bUtWWmU1TTQvUWFiUzJsQzJSeXVaUG92bUFJ?=
 =?utf-8?B?SHJPdkhpRElTOUhYRkNKK3lKOW1LeVFnVHBBcXM2QmxYanRRUXE5dTFaVmZn?=
 =?utf-8?B?WC9taUhVRExKb054UG5pb1RhNFBHRTY3OEg4OU41TFhRNjlwZ3ZabjhrSExL?=
 =?utf-8?B?K1MydHdUZlZyRUp6VDB2TEpNVDZhd2lobkFYQXVJM204T3NJT3N1bG9xZ0kz?=
 =?utf-8?B?Sy96bTh6S3lTRmRMUFJqMWZ6UkM5blR1SlphWSt3S2NLRjd6SnFPeU5icnVy?=
 =?utf-8?B?dXByNVZvcnRLYkVNZi9DZWl3dytUcm9zRlhQUHVMaFVERm9LMldLNGNOaHVH?=
 =?utf-8?B?RWdRenVldW1NTU9TUCtRTExjdEcxbWFMRmVseFdzYTZnQkpxYldtVkc5bERs?=
 =?utf-8?B?NkFBRlpoWE95eU9QUlJjSVFsbjI3MDk4emRCelF0Ri9wUkVJS3pqUHA5dUFh?=
 =?utf-8?B?akEyQjkyODFwemx5TE5VSXdQU3ZNMk1ZNTAvZ3VVR0dqWEdCWGowNkg5WGN4?=
 =?utf-8?B?NG9wUHFmRGQ0aW9RdVNnZjB0SWUvK2xvRUJVeWhGYlRrRzZjb2JhKzNLVnEx?=
 =?utf-8?B?UDhtbWh1YVB2TFR5Z0xHTkwvK0hISWRMazhtZm91UStSL29kOFQrWkI3Zkd1?=
 =?utf-8?B?NHc1OGpzdDRVNjViSTVZQ3pDRVZ1VFh6Tm52R1F0OExtZXVwdnc1Rk0wRFcz?=
 =?utf-8?B?eXIxaTVpeXBnOGxMcHk1Yy9TNldDU2NUcGVOUnk1MGE1U1NxTk1JbVk2VDlj?=
 =?utf-8?B?dFk5WS9OY3NXYjZzS1QxaVJBVW90ZGRXTjc0L3FLZ3FxVmwvTUwvL240V2F3?=
 =?utf-8?B?NEQ5R21XTVFvaTNRdnB6QXQra2FNUjdlVG9ZSWwzS0MwRlVlZEFBOVp1Zmd2?=
 =?utf-8?B?S3FiK3Z2MlJjcExobXJOcmhwQmVOdXIzczZwQ0tndHBDbkFuYUNBWDJybGh3?=
 =?utf-8?B?M0VDeE5nRHFWK292b2tNV1Q1ZEpTT2IyTndmeE9oajFDS2FhWGluQkVpaldx?=
 =?utf-8?B?Z3BSUEpGWFNKZ1V4V1lMdy9LdGE2NHUxdHdZWVJxSmJ5WjZPUEJkR3JBRFZh?=
 =?utf-8?B?b28vZnlJeExxWHRTTUVaNE0vT0duS0h5NVJuZkhyL2lHNVZINFRTcmpkcTc0?=
 =?utf-8?B?UmpJdTJKVFR2OUNtNFZmTDY2ZVZTZURPVy8vc29MUW9tQzFBejVXQT09?=
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5c9635-de6a-46e9-7366-08df3a689bd0
X-MS-Exchange-CrossTenant-AuthSource: ZR6PR09MB889505.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:41:47.5710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NjoGoRRgbpYA9CsKNAq4bUuy5iXVkV2WkJtdOZdOjkvWOcab0WGNbxSXxci5QKaz9bo5B26V2xlz0HmK3MlqGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI7PR09MB416415

On 11/3/26 23:09, Conor Dooley wrote:
>> +config TOOLCHAIN_HAS_ZALRSC
>> +	bool
>> +	default y
>> +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64im_zalrsc)
>> +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32im_zalrsc)
>> +
>> +config RISCV_ISA_ZAAMO
>> +	bool "Zaamo extension support for AMO atomics" if NONPORTABLE && TOOLCHAIN_HAS_ZALRSC
> 
> Probably this option should be called something like
> TOOLCHAIN_HAS_ZALRSC_ZAAMO if you're going to use it like this, because
> it is confusing why ZALRSC gates a ZAAMO option.
> 
> I'm curious actually, does every toolchain provide zalrsc and zaamo as a
> pair, or should you check for both here? I'd be surprised if there was a
> toolchain with one but not the other but worth checking to avoid some
> bizarre toolchain bug..

Agree, will be in next version.

> Ah, right. But that kinda goes against how NONPORTABLE is meant to work
> since the default cannot run on all platforms? At that point, just get
> rid of NONPORTABLE?

Agree, dropping NONPORTABLE

> | My logic when adding it:
> | There are 2 sets of extensions related defines: one is Kconfig ones,
> | CONFIG_RISCV_ISA_<ext>; and another one found in the
> | arch/riscv/include/asm/hwcap.h, RISCV_ISA_EXT_<ext>
> | 
> | In the hwcap.h, there's already
> | 
> | #define RISCV_ISA_EXT_ZAAMO		97
> | #define RISCV_ISA_EXT_ZALRSC		98
> | 
> | added by commit 35173b666a16 (riscv: add parsing for Zaamo and Zalrsc
> | extensions, 2024-06-19)
> | 
> | These 2 sets are logically coupled, and used in the BPF JUT code like
> | 
> | #define rv_ext_enabled(ext) \
> | 	(IS_ENABLED(CONFIG_RISCV_ISA_##ext) &&
> | riscv_has_extension_likely(RISCV_ISA_EXT_##ext))
> | 
> | So I thought if RISCV_ISA_EXT_ZALRSC exists although it is mandatory,
> | CONFIG_RISCV_ISA_ZALRSC counterpart should exist for the same reason.
> | 
> | Do you suggest this is different case and it is worth to remove
> | CONFIG_RISCV_ISA_ZALRSC anyway?
> 
> If this is the justification for it, then you need to provide this
> justification in your commit message - but if zalrsc is always enabled
> then there's no need for any code like that in the bpf jit in the first
> place, once more making this dead code that should be deleted?

Adding justification. Also, it is possible to have zaamo+zacas and not
support zalrsc; in this case CONFIG_RISCV_ISA_ZALRSC will be "n"; adding
clause explaining this theoretical option.

>> +# Zaamo is off only when the compiler accepts _zalrsc in -march.
> 
> I think the comment here is not quite right, it should be "can only be
> off", no?

Sure, fixed

>> +ifneq ($(CONFIG_RISCV_ISA_A),y)
>> +riscv-march-$(CONFIG_RISCV_ISA_ZAAMO) := $(riscv-march-y)_zaamo
> 
> Isn't this dead code? The logic for RISCV_ISA_A is:
> config RISCV_ISA_A
> 	def_bool RISCV_ISA_ZAAMO && RISCV_ISA_ZALRSC
> but ZALRSC is always set, so RISCV_ISA_A is equivalent to
> RISCV_ISA_ZAAMO so there can't be a case where RISCV_ISA_A is not set
> but RISCV_ISA_ZAAMO is?
> 
>> +riscv-march-$(CONFIG_RISCV_ISA_ZALRSC) := $(riscv-march-y)_zalrsc
> 
> And here, this is effectively just riscv-march-y, since if you get as
> far as here, it must be true.

See above, in theory one can have zaamo+zacas but not zalrsc
> | > ...why are we making this a compiletime decision in the first place?
> | > Why can't this be an alternative, starting with the zalrsc stuff and
> | > moving to the better implementation if available?
> | 
> | I started with alternatives approach, see
> | Suspicious Link - Removed
> | Then I converted it to the static compile-time decision following input
> | from Gary Guo that I think is valid, here:
> | Suspicious Link - Removed
> 
> 
> Okay, that logic from Gary does make some sense. I'll accept that
> argument, but again this needs to be communicated in the commit message.

Done

> | There's BPF JIT that emits AMO instructions, patch for this is not ready
> | yet. These AMO instructions will be emulated and work correctly but very
> | slowly.
> 
> I think that needs to be part of this series. You're far too focused on
> your individual platform where the instructions work, rather than the
> holistic solution of lowering our minimum requirements so that platforms
> that do not have any AMO support work. The only way that it'd make sense
> to move forward with this without the bpf jit patch is if you disabled
> bpf entirely when RISCV_ISA_ZAAMO is disabled.

Added patch for BPF JIT.

Also, added is patch for kprobes/uprobes, to reject probes inside lr/sc
sequence. This is needed anyway, having lr/sc blocks for any atomics
only increase chances but we do have lr/sc blocks in code anyway and
need to protect it.

> 
>> +#if defined(__riscv_atomic) || defined(__riscv_zaamo)
> 
> Something else to note is that we do not use this pattern anywhere else
> in arch code as far as I know? We always use the RISC_ISA_WHATEVER
> config option to gate conditional stuff. Since RISCV_ISA_A is equivalent
> to RISCV_ISA_ZAAMO (unless I am mistaken there somehow) this just collapses
> to a single check?

Agree, replacing with #ifdef CONFIG_RISCV_ISA_ZAAMO>> +#else
>> +#error "Need AMO or LR/SC atomics"
> 
> And this error is actually unreachable?
> 
> (and so on in every other place that this pattern is repeated)

Agree, removed
Thanks, Vladimir
