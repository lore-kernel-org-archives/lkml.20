Received: from SY8PR01CU002.outbound.protection.outlook.com (mail-australiaeastazolkn19010019.outbound.protection.outlook.com [52.103.72.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596771DCB24
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791388301; cv=fail; b=aPBMnbYpxy6F2kqfO/SndyVbiiLRZsQzxtAbtSrfy6to8f1jyYOK3uSWzzdNWKBS+z0ZDaxDKA8lmtSsvUS2nbDSlR0tNy8pD8bxzyBEicjvz29FGyEi3z+Gv/Tm1jH+8JQMYo8v7Uy3/rfi0f11Jp6c7OJJRi/4mS01Firpnuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791388301; c=relaxed/simple;
	bh=InNOrm4Zul6wQkx7wP7K8OLKJP0nggYxJclrB624HtU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sDmDHbenP9MxWSkRc7ZyQQMeBKRRUfFhL0dyoSnghaRCJ8UaH/sDe3sg0xirf8u/A4gfXGtOgMZ183iS0CL5ilVv9XZ2wnj1sP0UK6zGcHuU3OZ11hrWapcdzahNqlPMMozh2JGQsRbxf1eq6Bo2KWlyBJXwYliiHrZEZcn8zrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=euleIYVQ; arc=fail smtp.client-ip=52.103.72.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="euleIYVQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FX0H4XDgkVItW1S1UFSFhvpfqeb7nZPwKIw08QJ3HFQiX3GpPWUylS8V6SHERrBOG/GdSourwGYejj5+G8FSiqjN4BIbGG/H/0H+B93r30Pi1dErkJNP85g8P6Y+GmMW14ZnyJez13KEieoqPs6DS5r5K426FekL4CgTduqR1z9VU0iIk0ta3BgCSSjHKx9y2Aj7h2nS3/7N2ej50vN2lj0myzB2ztUY4/0RCPK6flPLlXrRWT7Z2/gfcZJdJg/+/AhefMA7PKTuJEo/hR2NitAHLvTIjkV+YDQNN4IipPhl10D3bYVMMmGOY9D4M/r7sJ1LNRzAB7/1NvhvPRRuyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InNOrm4Zul6wQkx7wP7K8OLKJP0nggYxJclrB624HtU=;
 b=SRyhGgR9nge/TWd7meyUpWo6Yk4u0TkpfMZ47UXhCB9PFKCthngQqx8FUrIWCVmigbXNslqVXo/CqNtW6Hy9ZsR0ie4DBTX/bZSkqFILfY/q5CwIqqnWSAk+ccsLS8En1I30aJYQYUWR2epchjhJGIlSS5r+LHjd/q+JilsEkKoJG03Y4E+wGNK1Opfvzcb6dsxmvy/8jyQTar6nNk0b22XhiZfnsFB6S71SS/+05gEroV2/pyOE1Shv1ZVsXbG5BLS9k6ZZmBBzFboQt5WuxAkyE3I+6DPYgssNJ2UlDaAU9DPImfYPLDIIcK+XoQ58jMhD/OYUo5KSNpyxnC/bnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InNOrm4Zul6wQkx7wP7K8OLKJP0nggYxJclrB624HtU=;
 b=euleIYVQf8k6m/XuS7gCuVbz1fQAhK5tkbsm07zeCqeOL3BvBMumJnNewHkl9nujWgr/7fBiLacbHUBkpyLrlm3WAGoF5p5KnburXHc68SKEajHK3hW7X/d3zY4jzp5/ezZCFzvv4EyiY+Pw1EJlu+kdYgw/4CDvNJ7+G9wVDikgL/apta7P8nJYAdeGqG8l2NuoZWrfX7aDaVghORj46G2uw/NmfdExVqbbnumIOzM0kMEA79t/xcMM44vYB0tglbsQ/t5xBLxcr+rN6HAR6rOppMxqACpmSQjJjBtw0ikueUxdWo7eowtIjg+d2T+ow2gpH3N1sjTD6ZdIzxAPPQ==
Received: from SY0PR01MB10988.ausprd01.prod.outlook.com (2603:10c6:10:33b::24)
 by ME3PR01MB6194.ausprd01.prod.outlook.com (2603:10c6:220:105::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Wed, 7 Oct 2026
 15:51:34 +0000
Received: from SY0PR01MB10988.ausprd01.prod.outlook.com
 ([fe80::2313:f539:f431:ae1b]) by SY0PR01MB10988.ausprd01.prod.outlook.com
 ([fe80::2313:f539:f431:ae1b%2]) with mapi id 15.21.0522.002; Wed, 7 Oct 2026
 15:51:34 +0000
Message-ID:
 <SY0PR01MB109881D4E8F08FBEBD9F43089FB942@SY0PR01MB10988.ausprd01.prod.outlook.com>
Date: Wed, 7 Oct 2026 23:51:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC/DISCUSSION] x86/tsc: Handling legacy PIT fallback
 calibration on modern platforms
To: "Hahn, Matthias" <matthias.hahn@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "peterz@infradead.org" <peterz@infradead.org>
References: <CH3PR11MB08137159D0CC079C8BFA13F6E7F1952@CH3PR11MB081371.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Ping K. Jiang" <jiang_kangping@outlook.com>
In-Reply-To: <CH3PR11MB08137159D0CC079C8BFA13F6E7F1952@CH3PR11MB081371.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0103.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c4::13) To SY0PR01MB10988.ausprd01.prod.outlook.com
 (2603:10c6:10:33b::24)
X-Microsoft-Original-Message-ID:
 <b589fbb3-4a09-4c5d-8f4c-077cc6038e07@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY0PR01MB10988:EE_|ME3PR01MB6194:EE_
X-MS-Office365-Filtering-Correlation-Id: f369171f-c425-49ea-046d-08df248adccc
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|4140399003|19110799012|8060799015|6090799003|5072599009|39105399006|15080799012|23021999003|24021099003|25010399006|20031999006|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?em0yZ3d5WXlOMytGT3pGZGE4WS9XSWFZbmcyQzhDdDhJUXZha1JIaE1IVDVS?=
 =?utf-8?B?QUYwc2VQWSthd0thOEJMa2trQlFzS3hvWDBET0tXR1Z6WFluUWRTUmhPbFNH?=
 =?utf-8?B?czREbG9YanExMFpRWVlYWC9lVFFCVjBlRWxWMngxV2xmTFpwR2RpNlJMNjQ1?=
 =?utf-8?B?TzBHVDYyc1FqSS93ZTN2d1VMMGY2NWRhc3BXSTBpVndhVWtRN0RqRlRLcU9R?=
 =?utf-8?B?VHhOQUo1am1Qc1FYbjJHVHRmaERvMi96c0FyaGUrMG9HYWFqc2k1NmViTWFh?=
 =?utf-8?B?dEJ6WG1IVTMvT1d3S0ZVeFJScjNVTE9zVTlaMFp1UDFETlFycFpFUTYzZ2RC?=
 =?utf-8?B?REpPWXFVc2NxVnBFVzhlcEZLTkV5SnBrd2pBTVNuc0hQOUpJOXdVSGNFUWNo?=
 =?utf-8?B?bllqM3FqM3RseW5sMVJseEZDSy9IbWdnQ0VqWlcxSnN5NElTNHlxNFd0N3Iy?=
 =?utf-8?B?Wm9pOGM2ckxnZkZOeGpBL1drTTRlejVkeXRRMXZuZk9KdmlSbldWcHZUdVZC?=
 =?utf-8?B?ZXdxVEFpdDhnRTlQMlVPanpLR01UckJmVEhPbWpOK2FvL1Q4cWlpYjVzSllT?=
 =?utf-8?B?b1Q3bnRUVkw4dXQ1L1lHNDZKeUVOQWJ3WGRCNk5FN3RiYlQ5c2h1RmgvK3I4?=
 =?utf-8?B?czdaWHNseFhLWkJnaU8wSWVZc3BuOC9uY0F6TzI0eTBVd3JvcnN2UUJCMXAr?=
 =?utf-8?B?UXlMZDY4VWpzNXlZMzRTZDlVQm9ycmEyWVhBSmdINmJjd3Q0TkQzanZWYTVL?=
 =?utf-8?B?T2VYQUdoM3ByeFcxU2k3YXRycUpkNWlDUkZ3RTR3M1RyQWZWRVBPd1daZ3dN?=
 =?utf-8?B?NU1VT1NSbk1QY0dFcFIvK2kwRGtpbllGZGpqNGdnT3puQVFnbzJSank5TzBZ?=
 =?utf-8?B?NG5mQW51RjNaSEN5c0FkOHlGejAyVTRnM1BhNjF1Qm8vSXd3SEJyYkxGUzhM?=
 =?utf-8?B?UmQzVDJYb0RVTVUvL0dwZ2h6V3FLaHR4SUpNK1dJTEdXWlBPcFYwaUc2N3NH?=
 =?utf-8?B?Q2pqN0x2bEZWU0pxVlB0d2MvY081UzZaSmF1U3hTa3NYSlEyOHZlZWZIRkNO?=
 =?utf-8?B?L3VMTFp3eE9ZRVg5N3Y5TzQ3Vzh3Uy9QVExtWS9POHdPTVoxa01FMGFUYWZ5?=
 =?utf-8?B?Z2tqVll4OGRxeGxTdWE3bHRzMlpNeXdJbmVTdjhRR1U3ZlZ6ZURGMHNSbWFI?=
 =?utf-8?B?WEZtcnJPajJ2TEkvWlRZa1djemZBbzJKVkVrYU5iWVpDdytyWnpCQWwza3RK?=
 =?utf-8?B?bnhWaloxZWM3bnZVcVdzM3NqbStPQWVtY3poK0lNazc3Z0poTGFRb0ZjM2E5?=
 =?utf-8?Q?YR/zUfzY2AIFtzPCqAyJXxU++VIlE/qSAr?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjR4YTdzbEVJQW0valpzRERGQy9vMlJSOFVWNlZuZU54d3pZTUNZSjE5UFdi?=
 =?utf-8?B?aHJZNklTdkpUZFBadXdnZUw0SGRGKzR2a1dMNXJyQ3FFQ0doZlNuOGNCdkZ1?=
 =?utf-8?B?QUszUk9YSFk5bVBBRzhTMTUzVS82N2NFSjdXYk5VN2VoMjNsakkvQmh0UGQr?=
 =?utf-8?B?QjNScHFzWi9yUHRyb1RaUE8vTWFuNDBjdllUMnFpSjNzQ2x0dmptSFdLd0xZ?=
 =?utf-8?B?YUsxZE9xZGZ0VTdtQ0w1ajBRdkVkdWxmcVZtTnF6T0pFcnZPYTkzTEJhOUM3?=
 =?utf-8?B?RWIrcXV6a3l0UmtFdUxJMjJuMEIvOXJjcjBmdm9CbEVlK2FUcS9Kdzd4Mkxi?=
 =?utf-8?B?aUpaWWhTUUJJV3lobzI3bmt6QW9KK1F4SHNBMll4WHJXVFVJVVVYdkl3WUpO?=
 =?utf-8?B?WmRjZ1dnVS9XcEp4cElFbjhoWmFDdE9iZStKYVJUUjF2anRPaFg3YmFMeFBK?=
 =?utf-8?B?TU1LRUlqVE5ET1dkR0s4VXZvdHRaN3VPTEpLK3NYN1NnK0E0c2FGSmx5N2lH?=
 =?utf-8?B?M3d2akRsaHp2S2Nob1QySlFyY3pWeW5MdHlLYkk4SzdyMlhReUFQY0ZIYndH?=
 =?utf-8?B?VDcrOUVITkRHbmpvRW5oRy9XdTRmUU9INWZpaWZHdjhHcGJPbHUrN2JWUTh5?=
 =?utf-8?B?Q3F4a2JOTWFNL2NvQ3BsRU1BeHVzS0gvSHRWUnVBcjlERmtqWThPQ0JFYnFm?=
 =?utf-8?B?Z2p2RERqWEpndGRaMk1zYnJuYUNGb0lrYjkwaTJrVmxDNjg0YUpVVEtoSFdn?=
 =?utf-8?B?MXV3TndCZHFpOExqaDlWdXpDTFAvVWNzVlFMRWlYNVc4cU1sdmZmTHlmcm10?=
 =?utf-8?B?MHhiVGZranptak1sZTRLOVhxZlMvYS83YnA0b3NJQjlsTjRLMzdsd1QwSVVR?=
 =?utf-8?B?WnhNN2FINmpkNEhwbDFrM0plSm1Ub3grTTlhek5yRlNsYWxSdjk1Zmsyc0ZM?=
 =?utf-8?B?dllzRE9DUHJQam9EdjNSVmlIVWNMR1crZ2ZnYjJQVVRPOHhqb3VqM25ONTFW?=
 =?utf-8?B?UGV1aUpOV1ByOWRIYkEzZ3dEWXNQcGZkcGh2YmdsZ1lOanNITDFZTG5YWjNn?=
 =?utf-8?B?Z3VGdXFZSGhhd0dGVW5pN084aDRGNjgvcy9hS21vTGJrUGFzWU9HRmRJQlZR?=
 =?utf-8?B?SGVISFI3LzVKck5oS3pQQjlyWnpWb0Z1YXFrUUdhRjQ2UG1YOGdOeDczY1NN?=
 =?utf-8?B?c1RzN0tXaUFmL0ZSeTdQYXAxQmw5V2RRV20xSFFYcmRyMStDYXZ3N0lMKzhC?=
 =?utf-8?B?NXYzV2MvQzZaeUk4RkJQWnVDdHRndXR5QitJTlVoeDZkL0JObnRCc0NyZUpx?=
 =?utf-8?B?L24ydzZCZnFOSHQ3RlVPYVZYK3dUSGxGVS9mdHUvVE81Sy9yZUY1ekxsMnRn?=
 =?utf-8?B?dGI4WG05R0JOSmJWeFFNdHduNi9lTHVOa0szeEtOcXBOb1BlSndROGpGM2x1?=
 =?utf-8?B?dE9pTUszWjlFWDhvQlNEaG1OcEQ0T3o1SHJ6VExVS0EzamVPL2o5NVZGQTZk?=
 =?utf-8?B?enI0YmNySFVnMDFUVXZsRVNZU0IvejVRaXkxZXl4Sy9BeHducGpkaXd4Q0FL?=
 =?utf-8?B?bG5nNnlzeFJ6dmpZTno5SFlGRDBnSWdWMVRILzhnRXlZYjE2ckNzd2NIN2Fl?=
 =?utf-8?B?Uk1FRGdEM3RmQVJ6NmFSdTBNL09IMTI1bWI1R3JNUnp2M09xeTRnaTdHSUgx?=
 =?utf-8?B?ZEwrTUJvNUkzQ29rdlAvWXdQUU5CK09Sc0kyUTVISThyUktCSjR3ZnRGWFhX?=
 =?utf-8?B?SFVkN2xNRlQ1bzl3b3ZPQ0NIWGxRNjZmUGNIRVdFY2lva0VrVmdmb1FEM3Mx?=
 =?utf-8?B?ZjhlNmJiV0V0UEVhNi8zaDJmZGxZQWE4a0UxUko4YndVdjJ5UmhTc1QzWjc0?=
 =?utf-8?B?T1hCMkhtMTlrMW50anlJS0pxTVMydTIvUXJGRWdJcTNaL1dNdXIrcjN5bksv?=
 =?utf-8?B?MUdGeTFhWEVyakRmSUFpbEtoODNRZXI0TFp6NXdEZE5aUnBwcDVmb1Y1S1h0?=
 =?utf-8?B?SHM2T2p5Vk1RPT0=?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f369171f-c425-49ea-046d-08df248adccc
X-MS-Exchange-CrossTenant-AuthSource: SY0PR01MB10988.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 15:51:34.4551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME3PR01MB6194

 > We have recently observed an issue regarding TSC calibration fallback on
 > modern client/server platforms (Specifically Raptor Lake and newer) when
 > running inside restricted virtualized environments.
 >
 > On modern platforms, however, legacy port I/O cycle latency has increased
 > substantially. In benchmark comparisons between older platforms (e.g.
 > Broadwell-DE) and modern silicon (Raptor Lake), 1024 PIT reads took ~2.7M
 > cycles on BDX compared to ~21.3M cycles on RPL (~8x-10x slower, yielding
 > ~10-20 us per read).
 >

Dear Dr. Hahn,

I was reproducing this on i5-14600KF. My PIT delay wass ~13000 cycles,
resulting in TSC calibration with 30 ppm error, tested by running
`sudo dmesg | grep TSC` on host and VM.

I wonder why I can't reproduce it.
My motherboard is 'B760M-PLUS WIFI II'.

Thanks!
Ping Jiang
