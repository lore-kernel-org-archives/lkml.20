Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.95.119
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793365650;
	b=WiJRd2jumA1X2FKjnErK1eXXftKew4JYSULaQWAS2zMirifoXM2AyFFzNmbpj8FRdntP
	 0y+3GLpeMHc4RsfhuyvSxN0gPQelKhOqgQECHx6tH3/np0+wDcE0yB+/l76lfTXNEeEsK
	 2O0ON1lKVL2m4bxdhFHSnPZnDlgx/K+KhzJjtnQuQ2aYt5C1xKkE7KmBymr+ZgoyAcj96
	 1wU+cN7UjrOEERQxNjpYiSjyBLefYXGmnAlUNVZ33UDha+kojDgPT75BTFrEQV+BEx1mw
	 +MFgwNY1Kh+ZKfgXKalKvBg0NFBvcMU9p38IjQwkc7F3MT64cl4w5IKiu4S0gZJNG5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365650;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=XTQlfaK3oIc6b0XDvgs4waOTEc4H3CLoa8crwq384nc=;
	b=ajMuJwHCPF4vaQ2vEOvFseJmqUoXX0DupSSuH5tbj/U0gPzSHkudegxkin2bQB61zbQh
	 asERuoF2uNvDK3FNlWtSoI1GtbVLAzzSl60pTtG/VylaQIc1lY9gTmTNTsTLOQVwyJkBL
	 v+GWf2Yfm2Apz4N7FiKQZuU3FsVuLrvXWO0VXzUEuDBiL4LTHdH5CQwgqE48hHvP1jACf
	 AyWN7Al4NNqdNKxRrmXxRxZCI1BuKLwh3cApqJ4htAaA/0e5pS17Ah1/aVXptVuv6eb+K
	 WXXfTMeJJ093V3FlSdRiTctar86iyXj6sMvQGnACuGEsjvjUGMvD+gDqnfps6Sqh2Dg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.95.119
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021119.outbound.protection.outlook.com [52.101.95.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23256606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23256606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eM0JDYpfG5G7rrw/tpzQbQns0tMDpQR0syArjaJIicNBnKNrgm7ae8EE9J9ttLKYWKP1IwuR5hZl990bIihvGuR0xqcMKou1R33U/uhrRfHmfyTVhlwxYaH4bIHRBW1CWFVjsHxCGkri81hpj4OmVgRkX+P0iupT+2qC13EWqA/qMHG4yhIBRiNCSbJsux5YBufCyuXc3g1P8Qpaymq7uI70Qj9k/EY6oMb/B285prAqc5pcN5v0NpWUgQRmPiU4SaM/pyUC+9RrXJvQAc7tyEcHmJkh14Uu/JS0L2N831TA8Sgx9pDFUXvInZI0YGrviRSimxXWhosdd8kJWT7vRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=XTQlfaK3oIc6b0XDvgs4waOTEc4H3CLoa8crwq384nc=;
 b=xLAC/Ul68FdnGnkpPJCklp1ERRsZZCM3JNcL9vD2CSXrY/Jp2TrdkpZkknOlDiX7CuKhMwWowMbIdstKZE2ciA181K75G7Z+SagKHaUeMIC4PHSVegctIX4meNPICP6zCwcCe8FPyoKxe2lBuG4zEBXHHJfmIN1Q6flNHJeZyxHtHiRMoSqK1Fgh8CMsHgeK25f9NvCcITNrxCAvfVO54zEuCr0JjSAm54TkNSo5ZMWasgrVrQsHtlpHp/JSlJCFUZ1DMsaDxmVMcmwyIPAz+SRUCZfAZGbAbxpdUjvL+k5+9buo9trw5MYHZzUtAn9SxzINnWExHOgyJWXdz/cXHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO0P123MB7337.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:365::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 13:07:26 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 13:07:25 +0000
Date: Fri, 30 Oct 2026 09:07:21 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, paulmck@kernel.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	zhanxusheng1024@gmail.com, neelx@suse.com, chjohnst@mail.com, mproche@mail.com, 
	sean@ashe.io, steve@abita.co, rishil1999@outlook.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 tip/sched/core 6/6] sched/debug: Introduce per-CPU
 debugfs files
Message-ID: <tryed57muxq3zunokd32jvdtf6jp7rq6orsftalrc4ozzdqgzp@wby5u5gcl647>
References: <20261030013817.753804-1-atomlin@atomlin.com>
 <20261030013817.753804-7-atomlin@atomlin.com>
 <5ba8f652-6f82-4384-9343-1ff093880c39@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5ba8f652-6f82-4384-9343-1ff093880c39@amd.com>
X-ClientProxiedBy: MN0PR02CA0017.namprd02.prod.outlook.com
 (2603:10b6:208:530::35) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
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
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO0P123MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: 265cba3a-bfe6-457b-a309-08df3686be2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|18002099003|22082099003|10067099003|4143699003|56012099006|261021121427099003|261021135927099003|261022105027099003|261026140227099003|261028144727099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	PfFbUtpiSXz/mUtT1SCv98bdcOOTj7QtsXzAc/vPNoYFWsfxyUK0z/5dQFbBQTcIPzvaVUi0KFI0HbDyRMXbLk1d1OuLq4Kcjs/AsLOAQOUEHwAdQ6vo1PTu1x+pl5qhjYNt+EJERvaZGB9Nc7WGhv0162UoBndVtGoG7ywgLfGWVD9C3SnesCWXKiK1XOBsfSwWEAZlUq/FpdAxgsSmELwRqlM5jpV7R4sbUNTN7ofehJIGRrxrbljoAr9yZ7X0KUhU7H14MNu2Jy+MewpYJa7E/IQryua3zxA3LxR8BVXVPzFzgOOy2f4R4Rs3xuYlMD4Z9YM/s4G287CotGp7F/YfXp6fS1dOWOr/He/dRDjQug0MMwdwzndsOitGNJYqPuxGVaH7I2qt3Hv4x86jGKOAi2EiRfjHAGChtND1bpPWkWp1g/nFLBjDv6aBShQw01ZK+urNMfTPO1o2JImzHwGJ2O+U6IYmSFSYREjBJ7cydUBa51oRHXG7RRBfaggX9b7q+1A7rycEOxMBXGGUW3ZKwG+McDxhhYhr5ntM/dHQVtFOp3XS3BgqdaON1PlBdXIcRsw8dp2ZucFBZRNNvmFgyh/6fz0R7ty9wE23P9e+kaP/F9434n5/UIlzmvKhamGBEkDcgn/WbZG8jgEw4V69WonbhvrmTUZzI6cdwhw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(261021121427099003)(261021135927099003)(261022105027099003)(261026140227099003)(261028144727099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rlh5bGhMYUV2d3l0M2pJaytxNVhwYi9zSWhsQ0MzdzdQTlZDbnZ4L1FmcWpq?=
 =?utf-8?B?aXE5a0J5UWxnSkpKZlp6ZWVReEtHcTJEckhEVHdvcTJmRDgrTkh6VmZsa3FG?=
 =?utf-8?B?bWZCSVdKY3RudlVHdDMwQlBySWhiczF5QWJESEQvRjNJZU1oaWMzZkxwUXVV?=
 =?utf-8?B?L3Zia0lHSFdCWHpZdWV0a2RzekVzQ0d5Q2ZjQzh4L2NZaGVFeTZiM1VIZ2JD?=
 =?utf-8?B?MXpVb2JxU2dMQ29qdEdPSVVNMkVBdDBwS2NPc1kxeXp5MW9NdjB6YmpkSys5?=
 =?utf-8?B?Um9lTnl2RDRBRzB6bi9wVmIwS0VPbE1Bckx6YlFrcitxbXhrTS9tNFpabW5D?=
 =?utf-8?B?NDRkd3lBSWw4SjJQMDlydytPUU1vQ0ZXQVZzWk91eExWVzdDb0svNGxmQllK?=
 =?utf-8?B?WjlpSDllTzhWZDlPc2phVUk3SUk2ZWJHbm5raWN1bUErVEVjUGw5RFVpZU8w?=
 =?utf-8?B?RmlGUmh1ZytmKytadWdzVEFBTDdiTVlMb2pLc0U0WWhiNFpxYXgyMjRENENW?=
 =?utf-8?B?M2dZRGdJVlJ0QXo4aXBFL0JnckR4NHFlbSswSnc2MW5WWS8vZzY3WU1xTzcx?=
 =?utf-8?B?emx5T2ErUi9XOE5iSjA2TVd1OHp0MS9BWHhOTzJ0cDNBYklDdnlHRW1NRjU2?=
 =?utf-8?B?MjA0RE9LQVUvU3lnaDVCVHRTMTdpeVJxOVRXYlcweXB3UXdjVmtVU1o5YUFL?=
 =?utf-8?B?K3FzUzByNmNIbVl1ZTFKV0VhSStNK0JHblJOVmQraVlqRDhzWTcrUXMyU2cr?=
 =?utf-8?B?Nmc1ZWxCLzMrc0NrZHNtVkJwaWRwMEovR0hCZlhvNkkreGo2K0txQmRJZzBG?=
 =?utf-8?B?NlZVcmoxTjRMaCtBQ3NZZnpYVHVLbFMrNDRZRXJsVld2M0tNU1pHUjNNYlRz?=
 =?utf-8?B?V2VxckRwNkdPWjNLbkNpbUNURzVhVW9FVlFsVHN4UW9hK2VUaWNDRHJoQmJm?=
 =?utf-8?B?SXFRVi9qOFcxZURXdVpuYzl1Qk1TTUwzc2kvdVFJYVRGb01aYnZXWE1PNWtP?=
 =?utf-8?B?Ui9Ebkp4Ym9tQ3NTL29hWWRtTERTT2lFNkVXYXdyNU1FY0FlbHJUbGF1aFNt?=
 =?utf-8?B?MXFXdmpTdFQrOTFpMHRtZ2YyZTdVcy8vaEJGRTduUExySXpoRm1palp5Zlls?=
 =?utf-8?B?RTRGbngxS25TVnZUQmdhWWpCSGkwVDN3cnJGNDJQVkdnWm92L1BvZlVLaDZh?=
 =?utf-8?B?b2J5SHRReWtvakdQeFNadmhwdkJoSkQ2bGdWd2tVSEJQT1hlMEtDSjNmZXlH?=
 =?utf-8?B?TWFaaTJXWHRWR3V5aHNCQkp2anRVekc3REJFRmxoQXRUWG1oeHh0YWswMDFS?=
 =?utf-8?B?TE55citZTTEvL1l5NFJ5clVKRVZkQW1tL0s4TDVnMnR5R0VtNVpIT1dJdkdp?=
 =?utf-8?B?WXNKMVpKLzNIRzc1WVI4Y1pUVUtGUWxKblVTaU1KbmkveHNOOFBFNEVRcWph?=
 =?utf-8?B?N0lBcU0xMjBXbDdqMmpUTUZSaSt6REZ6d0JBTUVEaEFRdUNoNTlzV08rMGRl?=
 =?utf-8?B?Kyt4VGVhb2s0SWdBakVRN1l6TjdvL3c4dnByeVRvWm1tZkpheWxkejNrM0dL?=
 =?utf-8?B?cmlaR3pPeFc3ak9Md3lNQms4YWpKUXJITnVLL2FCQTExZXozZkwxYm5UZzR4?=
 =?utf-8?B?OFhjbE5xbEs4MGZpemxGUGRxTVorWS9tZVJFL3QyWW82VmZvK3VITy9PRVVq?=
 =?utf-8?B?TEo2aXBFRXdYanphRjhYRjAzbGxkVGE3bFNQcHJvSDJic09sSHJLSHlmNm9M?=
 =?utf-8?B?dWhJMkltVjRaT3Mzc0hvTTVvd0tsVk1odThhK3k1amlOaTFJdDhGT1pjdjdK?=
 =?utf-8?B?YnQ1VnVXTXR1dTU2T0JOZUVBUDhrbVRiMXNlUWlhQWd5TU9teE5CTjY5L0dW?=
 =?utf-8?B?dGQxNjBZRFZzSzZOOEw1ajQ1bjVaUmRTTDRzekJRcUxhMHdubmhmWGpjNXJM?=
 =?utf-8?B?d1d3Rnc0empmZEZnbWsrVE5CNDQ0ZlliOVdiWExIN3Q0dnh2S0k1a0hQOWQr?=
 =?utf-8?B?NDhjQ1c3dUczdER3YTFueHpFY2hHVGRQcHp5dlgzd3RGZGlTanRGODlOcmlF?=
 =?utf-8?B?WDZaSzVCRVlvSzJzWm1HYVdiaWZYcmYxeUxQYmJMbFV1NG9UcENvZ3dQV21C?=
 =?utf-8?B?L1N5NGZwMFhmK2FmcUYrb2ZNdWZJZjAvWkdQQ1R5VmhieXBTVWNUV0liTjVE?=
 =?utf-8?B?Yzk5cVVsSFFLazNiRnF5WmhOeVMvLzI4Tlh5czF4UlZvQk5UeUZMQlkxTHpv?=
 =?utf-8?B?Y1EyOUJZU0d6NlhPSEl4czhORFFoQnZYM3dZbUpVbXdPQm5rV3BDMTNMelI1?=
 =?utf-8?B?ZzFOeHpVTWt6SW5PU0dSWGFUZVpYdGJaWFJ3M0VtVjNhVlhrUC9Ldz09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 265cba3a-bfe6-457b-a309-08df3686be2f
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 13:07:25.7018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJ5PXfPH6Ph6tXMZ4gzuxp11FmOxBSbywpvcmJPEktJ3sT/f1ZXfk3bN96HMYvdcR1HkGKJSKoSYcwodpbzb2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P123MB7337

On Fri, Oct 30, 2026 at 11:35:03AM +0530, K Prateek Nayak wrote:
> Hello Aaron,
> 
> On 10/30/2026 7:08 AM, Aaron Tomlin wrote:
> > +static __init void debugfs_cpu_init(void)
> > +{
> > +	struct dentry *d_cpu_dir;
> > +	unsigned long cpu;
> > +	char buf[16];
> > +
> > +	d_cpu_dir = debugfs_create_dir("cpu", debugfs_sched);

Hi Prateek,

Thank you for your feedback.

> Missing an error handling here in case this fails?

Not checking the return value of debugfs_create_dir() is not only common,
it is the intentional and canonical design across the Linux kernel.

This matches the existing pattern in sched_init_debug().


Kind regards,
-- 
Aaron Tomlin
