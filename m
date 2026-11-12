Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.191.140
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794448099;
	b=LIIfDryVGLIffjEmQ6REz7fdqIMI30bZRQQFqzZ+sMLZHPWWej35f4GQ+VoqokgX4kWq
	 L2OmV4ll6X7ZYML/FwHpLdngUV7A9IGn+2rLFtM5mkNzbbPEuS2AqWaCLLrGmPjype5Yk
	 +d+IW75dq5FSRfiSd+FpSyzAggnNrt/DLUuDijgGjhyTUrl7MP72TMrzWQ04qQ1M6+eJf
	 DwjapaujRjd7asN6f01HbsYmmM0lUQxiIlL7sJNf6d0xwXZemZSgYmhonkHcOuevdgH8p
	 QsLmX3zXpKcLSSZalbkTY7gCfnbIhxQOOFJ0KhVmB0W2SZycxh66/Et06gu4881Naiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448099;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Content-Type:
	 Message-ID:Date:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=p9u5CY+dyF9+/+1LsfcBgNXVvM9cWR3wpkIqApV7zBM=;
	b=LgdZNj7efFIDIY2Oj4mphstDD1jCGsVX1JDbFsnT1QZUJRkAtWvbbsurx9eDz5d1BAe0
	 QOBl9e2yENQOc/ocuRttsCP+FYShG5zH7Q7MgtAwfoGPqzCThYxeDTzkuwzGGUJSk8YW9
	 WYcY/XIc0gL02qoPlYV1fl2s7VX7NwclfBlOuNPy+V3p3gadhH1E3atRn1KeOgyEnOwR7
	 VhFnEuxqYkBSPSqkLUPGu998TkXhoAaM8o1G7/BqcIqu8epwSMdiGgO0tV/3KJn2/wAKG
	 cZ3C6o+qTjbNSrnJy7YiCmNLzM3tKV9V1GEoSfqOd662LL5FNUrFC2/qUEkInb3370A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b="r/NisidX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.191.140
Received: from YQZPR01CU011.outbound.protection.outlook.com (mail-canadaeastazon11020140.outbound.protection.outlook.com [52.101.191.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB715606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB715606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=r/NisidX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qsn+L5mi8KPYXMGwAFimeos8Utyh15ZiwrtJn2CuTYpmp20l1cYGbrrKx5OFs8tDUAuqEYH03iEv+G+KdJxsRlNx+22IUrLPLz88fnC0hZNv3trhHvlcveVRvwUBEG54WiozGANDsDiaJUMb4NlMd/yCQOtalR2ZUC6CFYtZQYKoOKlH2ZVTlxJYTPvg6xjtXEq/z/DRHHOGYw3iVa3lYLDmq922T5QzUJ5YUrFLQ1H/AeyJKm7LXcyqdTCs2h3+SgayKv13P2UQsDEpYBl1EJocco5Zwh6reW2MIxHY8zoE2Ica11VLUfB813FeO+ehvQmSfH4WQXDZP/+723pLPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9u5CY+dyF9+/+1LsfcBgNXVvM9cWR3wpkIqApV7zBM=;
 b=AeOxxdaFiRCCGnhlgyWfzYiyixfh7OhBVxp/DrkhMgdGEHpABGHAUlcuYeRUlWGjNCEQDum7Xq8qE1CU6pmL9fvCra4bmFTRP+5OSdXUzUpx91nJRR55hmqiYpujzD8RnQGHbiIrwEuk1ifLDHNNDgulKgoYJQ6oPp817CZbqdbVyKFWrSuYejtagnpzWHsVnLZJKVZleEWsjb/zNc9yZ0kDoFFm6ATD+4t/pIZRd8FPlfJzAzwuol1YtknkiSPRNm7xpl7we9u8xoCQveiLe3AhAjrH5WUEqP8sXh/zsVInGVW5O/IM43u+k8d2x/keqzpaOxUTM9lNrKYTmvsbJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9u5CY+dyF9+/+1LsfcBgNXVvM9cWR3wpkIqApV7zBM=;
 b=r/NisidXl8t50SWATd3DbEviGbkVA0yOa8t6WQvyoBSc4rXTlMnc/E52eFauoeN54TudTJLi8MiPwCwnHeX5mzJWVrv21CvFZooNgXekRSnmF+61nRmMyjN5IZaV31PUrE9lEJKYCp9F++L+52ZHDXZukiwuseSIf9PUhq2RtNJi76erpsJhD4tptW7oGxn+hCGpmUCsx2T1BbVwKGn3ufqLPCxJDlqQkwQUPdTp4axTE+JYVkDhqn8Xn097caX0L5z7f1cmWo+UFbrHNYEFMkxLmZAYW+qDfgPaPZVPODrIshP8qybHtNr8k+Wgop1p+zXJ99+t5OjsEiKhoEEOtg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10) by YQBPR01MB10567.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7f::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 01:48:14 +0000
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc]) by YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 01:48:14 +0000
Content-Type: multipart/mixed; boundary="------------F1Id0wfGtH7o2MTEJao5oUm4"
Message-ID: <bd4c03e6-7ea6-4a21-9a3e-74ea9d36fe17@efficios.com>
Date: Wed, 11 Nov 2026 20:48:13 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/mmcid: Bound the CID allocation busy wait
To: Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org
References: <20260918013454.1850369-1-xujiakai24@mails.ucas.ac.cn>
 <20260918104349.GL776954@noisy.programming.kicks-ass.net>
 <877bjiem45.ffs@fw13> <87mrs8bhp4.ffs@fw13>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <87mrs8bhp4.ffs@fw13>
X-ClientProxiedBy: YQZPR01CA0051.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::25) To YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10)
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
X-MS-TrafficTypeDiagnostic: YT6PR01MB491026:EE_|YQBPR01MB10567:EE_
X-MS-Office365-Filtering-Correlation-Id: 0814616d-589d-4795-9ff3-08df405f0411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|6049299003|10070799003|23010399003|6133799003|9063799003|22082099003|261009223027099003|18002099003|4053099003|261022075727099003|261022105027099003|261021121427099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|56012099006|10067099003|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info:
	N2Bxxc84uhHT6FGeC0xPzNIoYJpHuaWH763ooQF52tniNvIC4CJ45OIq0DkEuvXGG5+9hq79dGWtGogl9iol7F8L+gJNXuDcRSxH/0t00boX1Tf9GKxoT/blihgVvF0x/IuqZj1mDEsNP3KE8v0s4GXTwwEqkZp/0zEUDtXxdmOP7gq16uxZ+sDfDyTvUTGZbWUr42VCn8G0Q8TuQqFyaH6FrwkLL/YJYfK1X4XfAGNPV61Vv3xcI6iBQJ+n1dP+615C/EJckBIFtOgOQZCtvR+IiNm0NyL5IAO84s7vnn/RJ290j89lSwhYPFNIhSSUAr+UEdu8pOsahT8uPSJY6gt8XGvL6JvH+Yhg2zJwB7DYx1B073Rja40WAtIWmJlHX0qnhh6bbIl9OtlSlDrqeDTKKywWyParXHuDK/jBGx4ins8Pgx2KBeb3Ce/6JL5ZuXWw9XOEhPhsUJhWwtslkikfIeNN/a1AfqDH1X0nw4/66DqXUjo+JsXIrt+Li4vGxhT4exmgsALA8UFZap4FfLPN8QmawNy6Y01ptX/qMWxUpBue1kAMbXMyq/kV1UcusOcCA1VLFmGz8dO8z8rXuxP/D/T8R2pfVnR8dY0Zn60=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(6049299003)(10070799003)(23010399003)(6133799003)(9063799003)(22082099003)(261009223027099003)(18002099003)(4053099003)(261022075727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(56012099006)(10067099003)(5023799004)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjVXODBmT3FYcVIyOE9JeDBnT2prK3dDbDM5WHlqR24xOXpFb21vRUs2WTZI?=
 =?utf-8?B?Ly9CZW1MZENoU3J4OWhkNVlPdjM3ejQxR0ZraXVhT2dIL1JORXVMY2F6VjJj?=
 =?utf-8?B?VjNMWXZac085aDBaRTNOdUk4L1d3K21Pbkc1Wjd5L1cwR2Z3Y3hoWEQxNlVM?=
 =?utf-8?B?eDJHU2RESjF6eXpGdHNIN24wb3c5VTcyWStScmV2NHM1N1R4c3RMV1FEUFR6?=
 =?utf-8?B?WHNGQkx4TThNYXpidWhadHRxSU5IaUpZYnhuUVJKMzR5MVRVKzBKZTIzUTYv?=
 =?utf-8?B?ZGtsSk04VVdWaFk3V0NpakZFc21kN0pacEN5NjZFQ3YzVzkwd0E4YzFvLzlS?=
 =?utf-8?B?YVVvUWgvTVBtTnd3VXB0dXNWbVNMZDd4UVI0T3ZXY2s4alVYOTdpcDkzM2Vp?=
 =?utf-8?B?S1ZicFFxRVVjSHVYdmdXUTZPbTdjN3lTY0RtVkVtcjV3WkcrMVVhQnZVK1lp?=
 =?utf-8?B?eVZVSVRvRWxuZmNxMWhNNXlyN2hqK0R1SGVXTWdnSGxpcWl3b1g3a3hCS0Rp?=
 =?utf-8?B?cFdxRm41U0kxT3JubnYvaWkxbEJVMzhBRUJkQmlMVU1vRU5kaG51dXFzWVVX?=
 =?utf-8?B?VW1jWU9JakRsY3RPZElBQVg2dERMTWhNY3hXRTUzU0VDUEN3STdkMmRpN0J1?=
 =?utf-8?B?ZkJqbFVUbEkwNzVpZWZGRlhXMTBXNHMyNTBLTEVMVWh1VmRzL3JvdnRLTGZE?=
 =?utf-8?B?N2poQWlZMHg5VkNsUVpzRG1jaDZHQVY3QjVWWE41cnJrRnp6d1JZVVV6VzVx?=
 =?utf-8?B?UjJmZkFraHBkSCtkejdFUkdKR2hYa3lrODg5K00ydFpMMER1bGs3UW5xeW1P?=
 =?utf-8?B?clU3WjY3TjB5S0Z3ZTZrRWI2LzhnTmV2SGhJOHQwaHdZTThiK3U4YVlQNW9s?=
 =?utf-8?B?QzZOaEplMGYzN1BRQ3cwRGZSQ29xSWMxRjFremY1QnpMWHgrK0x0VUNLNFVU?=
 =?utf-8?B?SVdlNEw2OGIzTTNtcmtQb0VxSGdTdzRzU1g0RGJKUlpqaUdiVTAyYVJZUCtF?=
 =?utf-8?B?bFZic1ljMlowTWpLNzdhQnF3K3hWd2s3OVZsREpwSFdUUHo5WU8xb2Y1Q3BI?=
 =?utf-8?B?VjVFL0kxT1FpTDRzT05lZ3VqaVlmR1Q5amhza2V3ZTRQQUpFYm05T05XcjNH?=
 =?utf-8?B?c0c2cUxTZmVQSjE3WmFZVDByVGtFTFRDQkQxek5QbnVmR0duN1djVWlpam5P?=
 =?utf-8?B?MjQ2SDAyZnNlQTZwcllQQkdRZkFEUy90bkthNmQ1WEJxVWxyTTJOMDNRc0NI?=
 =?utf-8?B?YjNRM3JlY1Brck9CejNJVytpVTcwa2VpTnBzUkFZTHdOUzVleE5oc3c4Rllx?=
 =?utf-8?B?QW5WUFVKT0MrY29mR2U1V3FqSHNXdGNZdWRweUVhVDcxTlBVM2V4RVZhcy9l?=
 =?utf-8?B?S2NZTjZJU3V4Y0IySzJmSEd2TnNmTUszSXFGN3JtODNwSldUNUFFNzFWV0Vj?=
 =?utf-8?B?NEUzaHJWOEI4dU43STV4UWlXWFRrWksxUU84cVpOazVNSnphNHpGaXo2K3pT?=
 =?utf-8?B?RFFIVEJ5V1hnT3hKYmVxd25VUG50czJWUFBBUlZWY01tOXdCU252d1ZNeVhB?=
 =?utf-8?B?UzlhbzgwYnMrek1WN3lPNWY3cVJ1L3o1clR0ZXk2R3RNMEwvNEluaG9sSHZo?=
 =?utf-8?B?UEJwUG9pV1FPV2Rhc0ZvNDFyMnk2TVp0WTNLd3JMQWdUVDV0Wk1SblVkdExQ?=
 =?utf-8?B?U0llMXdkVUM5b2h0ZnRiU200blVGU0x0bUxtRlhuSEZsU3g1eHVSc3d1dkZ2?=
 =?utf-8?B?U1hLak5lY3I2Z28xRHIzWjdISWlqNE9OcjI1ZkVqUVhWU0VtSDFvbTRqeUdp?=
 =?utf-8?B?ZTNzRWdsRnNiRFQzSTlKaU9scUNubUtWRjNwb1h5eml4M0lUZ2lmY0JrTXI3?=
 =?utf-8?B?RUhYRmZDWlRFaDNpWGE0bGhDVjVIWm9tcnR6NlhSQzNBZEFzTW1qbFlHUzFw?=
 =?utf-8?B?MzlqUjBhVFFnQzhac01MK09BZ2Jsa1BucmRKMUZLcEw1SHZ5cFRVK1hybnlM?=
 =?utf-8?B?RWhjYlpzYk5aV1ZsNGJFVkttTVhKMXNpVmNQUTlpSmVudFZORjRBUzNyZnha?=
 =?utf-8?B?b3U1SWpXaGdrcUxsWmFSR1hQR005UXhJQ2l4STMwWWxEemRSMVNOVXpIS3pt?=
 =?utf-8?B?N0Z4VWhybmFEL1p3UmJ6MzkwaCtqb2pWYmx0NGJ1S2tnVnFvdHYvRmtNRy9W?=
 =?utf-8?B?UFZ2YUxCU2c4TUtlUmJCZHNtRVg1MnhqWlJVN3pNRGlsR2VvWTl3ZW0xYmNw?=
 =?utf-8?B?WnFhZWVwNk5JN2RtTEpha0lMUElxb0FoV091dE1VRldKNlNTd2NROTdGaDJT?=
 =?utf-8?B?dlJFa0RjU0w4OWYvYTlTT0RLL2QwcHRXZEhwNFBFNGF0WmNpVnp1eENZVkg3?=
 =?utf-8?Q?Fjq7wKubNC7da/AB/3py3p76jGzkQzq6g6OJbSXU39kIc?=
X-MS-Exchange-AntiSpam-MessageData-1: 2IaHPOoxB0c74R+hlh+2V3jr7egIhmpy2vY=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0814616d-589d-4795-9ff3-08df405f0411
X-MS-Exchange-CrossTenant-AuthSource: YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 01:48:14.5144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHfOf7Sl8qW2/up7l/uN4X6rB0Bx+wWLDoVnch104b3Pipr0toCEV82Mf8vbBm3ymv5IIaw1srRySv9gAP8qxBKasbkkrt3g41HGBQp66OY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR01MB10567

--------------F1Id0wfGtH7o2MTEJao5oUm4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On Tue, Oct 20 2026 at 15:54, Thomas Gleixner wrote:
> Hmm. There is stale state, but there is always _ONE_ CID available
> because the last exiting thread drops the per CPU CID.
>
> As the mode is TRANSIT the whole scenario resolves when the new exec
> spawns threads or schedules around. That just works by chance, but I
> couldn't find a way to exhaust the bitmap for the initial allocation.
>
> So I really need to see the reproducer for this splat.

Hi Thomas,

I have a reproducer for a lockup that starts from the stale state you
describe. It needs two more things: the execve() fails, and the task is
moved to another CPU during that execve().

The changelog of the patch below has the sequence as a diagram.

A failed execve() rejoins the mm it left. The initial allocation
succeeds, as you found. But a CID stays set with no owner, so the mm
has lost one CID. A single thread should read mm_cid 0. This one reads
1:

   single thread, mm_cid 1 on CPU 0 after a failed execve moved from CPU 0 to CPU 1

On a guest with two CPUs both bits are now set. The next
pthread_create() loops in mm_get_cid(), in sched_mm_cid_fork().

This is on tip sched/urgent (006991aa8997), on guests with two and
three CPUs.

This lockup is not the splat Jiakai reported. That one loops in the
allocation of the first user, in the execve() path. Mine loops at the
next clone. I could not show that both come from the same sequence.

Your draft cleans up when the first user joins. My fix acts earlier,
when the last user leaves.

The reproducer is attached: mm_cid_execve_test.c, a selftest for
tools/testing/selftests/rseq. Its second case is the sequence of the
changelog. Without a fix it fails on guests with two and three CPUs,
in six runs out of six. Its first case fails on tip too. That is
another problem: after a failed execve() in per CPU mode, the task
reads mm_cid 0x80000000. I will post both fixes and the tests as a
series.

I ran your draft against the reproducer. I applied it by hand on tip
plus two other mm_cid fixes of that series, one of them for the
0x80000000 problem. With your draft the second case passes on the same
guests, in six runs out of six. So the reset at the first user join
also removes the CID without owner.

I would like your opinion on the changelog and the comment before I
post the series.

I found this problem with the help of an LLM coding assistant.

Thanks,

Mathieu

-- >8 --
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: [PATCH] sched/mmcid: Complete the switch to per task mode when the last user leaves

sched_mm_cid_exit() ignores the mode change when the last user of an mm
leaves. Its comment says there is nothing to do. That holds for an exit:
the mm goes away. It holds for a successful execve() too, which joins a
new mm.

A failed execve() is missed. It leaves the mm in
sched_mm_cid_before_execve() and rejoins the same mm in
sched_mm_cid_after_execve(). If the last user left in per CPU mode,
MM_CID_TRANSIT stays set and the other CPUs still own their CIDs.

In the diagram below, the machine has two CPUs. T is the main thread
of a process. The four threads it creates only wait. H is another
process. It stays on CPU 1.

   CPU 0                                     CPU 1

   T: creates four threads
      the mm switches to per CPU mode
                                             T: runs on CPU 1
                                                CPU 1 owns a CID
   T: runs on CPU 0 again
      CPU 0 owns a CID
   T: joins the four threads
      T is the only user left
   T: execve()
      sched_mm_cid_before_execve()
        T leaves as the last user
        drops the CID of CPU 0
        MM_CID_TRANSIT is set
        CPU 1 still owns its CID
                                             H: sched_setaffinity(T, CPU 1)
                                             T: migrates to CPU 1
                                                execve() fails
                                                sched_mm_cid_after_execve()
                                                  sched_mm_cid_fork(T)
                                                    T is the first user
                                                    mm_get_cid() succeeds
                                                    writes that CID to the
                                                    storage of CPU 1
                                                    the CID CPU 1 owned keeps
                                                    its bit, with no owner

The mm has one CID fewer from then on. Once every remaining CID is
taken, mm_get_cid() loops forever with interrupts disabled. On a guest
with two CPUs, the next pthread_create() of T does not return:

   rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
   RIP: 0010:sched_mm_cid_fork+0x1dd/0x660
    copy_process+0x2339/0x2ca0
    kernel_clone+0xc3/0x3c0
    __do_sys_clone3+0xe2/0x130

Per CPU mode lasts down to one user when mm_cid_calc_pcpu_thrs() returns
1. It does with two or three possible CPUs.

Fix this by completing the switch when the last user leaves. Run
mm_cid_fixup_cpus_to_tasks(), which drops the CIDs the CPUs own and
clears MM_CID_TRANSIT.

An exit and a successful execve() run the fixup too. They do not need
it, but the outcome of an execve() is not known when it leaves the mm.

This change was developed with assistance from an LLM.

Fixes: 653fda7ae73d ("sched/mmcid: Switch over to the new mechanism")
Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Link: https://lore.kernel.org/all/87mrs8bhp4.ffs@fw13/
---
  kernel/sched/core.c | 12 ++++++++++--
  1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 7e213e88ac28..9ef086f58236 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -11132,13 +11132,21 @@ void sched_mm_cid_exit(struct task_struct *t)
  			return;
  		}
  		/* Last user */
+		bool flip;
+
  		scoped_guard(raw_spinlock_irq, &mm->mm_cid.lock) {
  			/* Required across execve() */
  			if (t == current)
  				mm_cid_transit_to_task(t, this_cpu_ptr(mm->mm_cid.pcpu));
-			/* Ignore mode change. There is nothing to do. */
-			sched_mm_cid_remove_user(t);
+			flip = sched_mm_cid_remove_user(t);
  		}
+		/*
+		 * The last user can get the mm back: a failed execve()
+		 * rejoins it. Complete the switch to per task mode, so
+		 * that no CPU keeps a CID.
+		 */
+		if (flip)
+			mm_cid_fixup_cpus_to_tasks(mm);
  	}
  
  	/*

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
--------------F1Id0wfGtH7o2MTEJao5oUm4
Content-Type: text/x-csrc; charset=UTF-8; name="mm_cid_execve_test.c"
Content-Disposition: attachment; filename="mm_cid_execve_test.c"
Content-Transfer-Encoding: base64

Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExHUEwtMi4xCi8qCiAqIFRoZSBjb25jdXJyZW5j
eSBJRCBhIHRocmVhZCByZXBvcnRzIGFmdGVyIGEgZmFpbGVkIGV4ZWN2ZSgyKS4KICoKICogc2No
ZWRfbW1fY2lkX2ZvcmsoKSBtYWtlcyBhIHRhc2sgYSB1c2VyIG9mIHRoZSBDSURzIG9mIGl0cyBt
bS4gSW4gcGVyCiAqIENQVSBtb2RlIGEgbmV3IHVzZXIgZ2V0cyBubyBDSUQgdGhlcmUuIEl0IHRh
a2VzIHRoZSBDSUQgb2YgaXRzIENQVSB3aGVuCiAqIGl0IGlzIHNjaGVkdWxlZCBpbi4gQSBmYWls
ZWQgZXhlY3ZlKDIpIHJlam9pbnMgaXRzIG1tIHdoaWxlIHRoZSB0YXNrIGlzCiAqIHJ1bm5pbmcg
YW5kIHRoZSBvdGhlciB0aHJlYWRzIGFyZSBzdGlsbCB1c2Vycy4gVGhlIHRhc2sgcmV0dXJucyB0
byB1c2VyCiAqIHNwYWNlIGJlZm9yZSBhbnkgc2NoZWR1bGUgaW4sIHNvIHRoZSBqb2luIGhhcyB0
byBnaXZlIGl0IGEgQ0lELgogKgogKiBBIHNlY29uZCBjYXNlIGNvdmVycyB0aGUgbGFzdCB1c2Vy
LiBBIHByb2Nlc3MgdGhhdCBpcyBiYWNrIHRvIGEgc2luZ2xlCiAqIHRocmVhZCBmYWlscyBleGVj
dmUoMikgd2hpbGUgYW5vdGhlciBwcm9jZXNzIG1vdmVzIGl0IHRvIGFub3RoZXIgQ1BVLgogKiBJ
dCBsZWF2ZXMgaXRzIG1tIGFzIHRoZSBsYXN0IHVzZXIgb24gb25lIENQVSBhbmQgcmVqb2lucyBp
dCBhcyB0aGUgZmlyc3QKICogdXNlciBvbiB0aGUgb3RoZXIuIEEgc2luZ2xlIHRocmVhZCBtdXN0
IHJlYWQgMCBhZnRlcndhcmRzLiBUaGF0IGNhc2UKICogbmVlZHMgcGVyIENQVSBtb2RlIHRvIGxh
c3QgZG93biB0byBvbmUgdGhyZWFkLCB3aGljaCB0aGUga2VybmVsIG9ubHkKICogZG9lcyB3aXRo
IGF0IG1vc3QgdGhyZWUgcG9zc2libGUgQ1BVcy4gVGhlIGNhc2UgaXMgc2tpcHBlZCB3aGVuIGEg
c2luZ2xlCiAqIHRocmVhZCByZWFkcyAwIG9uIGJvdGggQ1BVcyBiZWZvcmUgdGhlIGV4ZWN2ZSgy
KS4KICoKICogUGVyIENQVSBtb2RlIG5lZWRzIG1vcmUgdGhyZWFkcyB0aGFuIHRoZSBtbSBoYXMg
Q0lEcy4gVGhlIG51bWJlciBvZiBDSURzCiAqIGZvbGxvd3MgdGhlIHVuaW9uIG9mIHRoZSBhbGxv
d2VkIENQVXMgb2YgdGhlIHRocmVhZHMsIHdoaWNoIG9ubHkgZ3Jvd3MuCiAqIFRoZSBhZmZpbml0
eSBpcyB0aGVyZWZvcmUgbmFycm93ZWQgYmVmb3JlIHRoZSBmb3JrKDIpIHRoYXQgY3JlYXRlcyB0
aGUKICogcHJvY2VzcyB1bmRlciB0ZXN0LiBBIGZldyB0aHJlYWRzIGFyZSB0aGVuIGVub3VnaCBv
biBhbnkgbWFjaGluZS4KICovCgojZGVmaW5lIF9HTlVfU09VUkNFCiNpbmNsdWRlIDxlcnJuby5o
PgojaW5jbHVkZSA8bGltaXRzLmg+CiNpbmNsdWRlIDxwdGhyZWFkLmg+CiNpbmNsdWRlIDxzY2hl
ZC5oPgojaW5jbHVkZSA8c2lnbmFsLmg+CiNpbmNsdWRlIDxzdGRib29sLmg+CiNpbmNsdWRlIDxz
dGRpby5oPgojaW5jbHVkZSA8c3RkbGliLmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1ZGUg
PHN5cy9zdGF0Lmg+CiNpbmNsdWRlIDxzeXMvd2FpdC5oPgojaW5jbHVkZSA8dW5pc3RkLmg+Cgoj
aW5jbHVkZSAicnNlcS5oIgojaW5jbHVkZSAia3NlbGZ0ZXN0LmgiCgojZGVmaW5lIE5BUlJPV19D
UFVTCTIKI2RlZmluZSBUSFJFQURTCQk0CiNkZWZpbmUgUk9VTkRTCQkxMDAKI2RlZmluZSBBVFRF
TVBUUwk1MAojZGVmaW5lIE1PVkVfRVhFQ1MJMzAwCgovKiBFeGl0IHN0YXR1cyBvZiB0aGUgcHJv
Y2VzcyB1bmRlciB0ZXN0LiAqLwojZGVmaW5lIENISUxEX1BBU1MJMAojZGVmaW5lIENISUxEX0ZB
SUwJMQojZGVmaW5lIENISUxEX1NLSVAJMgojZGVmaW5lIENISUxEX0VSUk9SCTMKCnN0YXRpYyBp
bnQgc3RvcDsKCi8qCiAqIFN0YXkgYWxpdmUgYXMgYSB1c2VyIG9mIHRoZSBDSURzIG9mIHRoZSBt
bSB3aGlsZSB0aGUgZXhlY3ZlKDIpIGJlbG93CiAqIGxlYXZlcyB0aGUgbW0gYW5kIHJlam9pbnMg
aXQuIEEgdGhyZWFkIG5lZWRzIG5vIHJzZXEgYXJlYSBmb3IgdGhhdC4KICovCnN0YXRpYyB2b2lk
ICp3YWl0ZXIodm9pZCAqYXJnKQp7Cgl3aGlsZSAoIVJTRVFfUkVBRF9PTkNFKHN0b3ApKQoJCSh2
b2lkKXNjaGVkX3lpZWxkKCk7CglyZXR1cm4gTlVMTDsKfQoKLyogVGhlIGRpcmVjdG9yeSBvZiB0
aGUgdGVzdCdzIGV4ZWN1dGFibGUsICIuIiB3aGVuIGl0IGNhbm5vdCBiZSByZWFkLiAqLwpzdGF0
aWMgY29uc3QgY2hhciAqdGVzdF9kaXIoY2hhciAqYnVmLCBzaXplX3QgbGVuKQp7Cglzc2l6ZV90
IG4gPSByZWFkbGluaygiL3Byb2Mvc2VsZi9leGUiLCBidWYsIGxlbiAtIDEpOwoJY2hhciAqc2xh
c2g7CgoJaWYgKG4gPD0gMCkKCQlyZXR1cm4gIi4iOwoJYnVmW25dID0gJ1wwJzsKCXNsYXNoID0g
c3RycmNocihidWYsICcvJyk7CglpZiAoIXNsYXNoKQoJCXJldHVybiAiLiI7Cgkqc2xhc2ggPSAn
XDAnOwoJcmV0dXJuIHNsYXNoID09IGJ1ZiA/ICIvIiA6IGJ1ZjsKfQoKLyoKICogQ3JlYXRlIGEg
ZmlsZSB0aGF0IG5vIGJpbmZtdCBoYW5kbGVyIHJlY29nbmlzZXMgYW5kIGxlYXZlIGl0cyBwYXRo
IGluCiAqIEBwYXRoLiBleGVjdmUoMikgb24gaXQgcmVhY2hlcyBzY2hlZF9tbV9jaWRfYmVmb3Jl
X2V4ZWN2ZSgpLiBJdCB0aGVuCiAqIGZhaWxzIHdpdGggRU5PRVhFQyBiZWZvcmUgYmVnaW5fbmV3
X2V4ZWMoKSBraWxscyB0aGUgb3RoZXIgdGhyZWFkcy4gQQogKiBwYXRoIHRoYXQgZG9lcyBub3Qg
ZXhpc3Qgd291bGQgZmFpbCBiZWZvcmUgYnBybV9leGVjdmUoKS4KICoKICogVGhlIGRpcmVjdG9y
eSBtdXN0IGFsbG93IGV4ZWN1dGlvbi4gVHJ5IHRoZSBkaXJlY3Rvcnkgb2YgdGhlIHRlc3QgZmly
c3QsCiAqIHRoZW4gL3RtcC4gUmV0dXJuIDAgb24gc3VjY2Vzcy4gT25lIGV4ZWN2ZSgyKSBpcyBk
b25lIGFzIGEgY2hlY2suCiAqLwpzdGF0aWMgaW50IG1ha2VfdW5rbm93bl9mb3JtYXRfZmlsZShj
aGFyICpwYXRoLCBzaXplX3QgbGVuKQp7CgljaGFyIHNlbGZbUEFUSF9NQVhdOwoJY29uc3QgY2hh
ciAqY29uc3QgZGlyc1tdID0geyB0ZXN0X2RpcihzZWxmLCBzaXplb2Yoc2VsZikpLCAiL3RtcCIg
fTsKCXN0YXRpYyBjb25zdCBjaGFyIGp1bmtbXSA9ICJub3QgYSBiaW5hcnkgb2YgYW55IGtub3du
IGZvcm1hdFxuIjsKCXVuc2lnbmVkIGludCBpOwoKCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpF
KGRpcnMpOyBpKyspIHsKCQljaGFyICpjb25zdCBhdltdID0geyBwYXRoLCBOVUxMIH07CgkJYm9v
bCB3cml0dGVuOwoJCWludCBmZDsKCgkJc25wcmludGYocGF0aCwgbGVuLCAiJXMvbW1fY2lkX2V4
ZWN2ZV90ZXN0LlhYWFhYWCIsIGRpcnNbaV0pOwoJCWZkID0gbWtzdGVtcChwYXRoKTsKCQlpZiAo
ZmQgPCAwKQoJCQljb250aW51ZTsKCQl3cml0dGVuID0gd3JpdGUoZmQsIGp1bmssIHNpemVvZihq
dW5rKSAtIDEpID09IChzc2l6ZV90KXNpemVvZihqdW5rKSAtIDEgJiYKCQkJICAhZmNobW9kKGZk
LCAwNzU1KTsKCQkvKiBBbiBvcGVuIGZpbGUgd291bGQgbWFrZSBleGVjdmUoMikgZmFpbCB3aXRo
IEVUWFRCU1kuICovCgkJaWYgKGNsb3NlKGZkKSB8fCAhd3JpdHRlbikgewoJCQl1bmxpbmsocGF0
aCk7CgkJCWNvbnRpbnVlOwoJCX0KCQlpZiAoZXhlY3ZlKHBhdGgsIGF2LCBOVUxMKSA9PSAtMSAm
JiBlcnJubyA9PSBFTk9FWEVDKQoJCQlyZXR1cm4gMDsKCQl1bmxpbmsocGF0aCk7Cgl9CglyZXR1
cm4gLTE7Cn0KCi8qCiAqIFRoZSBwcm9jZXNzIHVuZGVyIHRlc3QuIFN0YXJ0IFRIUkVBRFMgdGhy
ZWFkcyBvbiBhIG5hcnJvdyBzZXQgb2YgQ1BVcy4KICogVGhlbiBmYWlsIGV4ZWN2ZSgyKSBpbiBh
IGxvb3AgYW5kIHJlYWQgdGhlIG1tX2NpZCBhZnRlciBlYWNoIGNhbGwuCiAqIFJldHVybiBhIENI
SUxEXyogc3RhdHVzLgogKi8Kc3RhdGljIGludCBydW5fY2hpbGQodm9pZCkKewoJcHRocmVhZF90
IHRocmVhZFtUSFJFQURTXTsKCWNoYXIgcGF0aFtQQVRIX01BWF07Cgl1bnNpZ25lZCBpbnQgbnJf
Y2lkcywgd29yc3QgPSAwOwoJY3B1X3NldF90IG1hc2s7CglpbnQgaSwgZXJyID0gMCwgc3RhcnRl
ZCA9IDAsIHJldCA9IENISUxEX1BBU1M7CgoJLyogVGhlIG1tIGhhcyBubyBtb3JlIElEcyB0aGFu
IENQVXMgaXRzIHRocmVhZHMgbWF5IHJ1biBvbi4gKi8KCWlmIChzY2hlZF9nZXRhZmZpbml0eSgw
LCBzaXplb2YobWFzayksICZtYXNrKSkgewoJCWZwcmludGYoc3RkZXJyLCAic2NoZWRfZ2V0YWZm
aW5pdHk6ICVzXG4iLCBzdHJlcnJvcihlcnJubykpOwoJCXJldHVybiBDSElMRF9FUlJPUjsKCX0K
CW5yX2NpZHMgPSBDUFVfQ09VTlQoJm1hc2spOwoKCWlmIChtYWtlX3Vua25vd25fZm9ybWF0X2Zp
bGUocGF0aCwgc2l6ZW9mKHBhdGgpKSkgewoJCWZwcmludGYoc3RkZXJyLCAibm8gZGlyZWN0b3J5
IHRvIHJ1biBhbiB1bmtub3duIGZvcm1hdCBmaWxlIGZyb206ICVzXG4iLAoJCQlzdHJlcnJvcihl
cnJubykpOwoJCXJldHVybiBDSElMRF9TS0lQOwoJfQoKCWZvciAoaSA9IDA7IGkgPCBUSFJFQURT
OyBpKyspIHsKCQllcnIgPSBwdGhyZWFkX2NyZWF0ZSgmdGhyZWFkW2ldLCBOVUxMLCB3YWl0ZXIs
IE5VTEwpOwoJCWlmIChlcnIpCgkJCWJyZWFrOwoJCXN0YXJ0ZWQrKzsKCX0KCWlmIChzdGFydGVk
IDwgVEhSRUFEUykgewoJCWZwcmludGYoc3RkZXJyLCAicHRocmVhZF9jcmVhdGU6ICVzXG4iLCBz
dHJlcnJvcihlcnIpKTsKCQlyZXQgPSBDSElMRF9FUlJPUjsKCQlnb3RvIG91dDsKCX0KCglmb3Ig
KGkgPSAwOyBpIDwgUk9VTkRTOyBpKyspIHsKCQljaGFyICpjb25zdCBhdltdID0geyBwYXRoLCBO
VUxMIH07CgkJdW5zaWduZWQgaW50IGNpZDsKCgkJaWYgKCFleGVjdmUocGF0aCwgYXYsIE5VTEwp
KSB7CgkJCWZwcmludGYoc3RkZXJyLCAiZXhlY3ZlKCVzKSBzdWNjZWVkZWQsIGV4cGVjdGVkIEVO
T0VYRUNcbiIsIHBhdGgpOwoJCQlyZXQgPSBDSElMRF9FUlJPUjsKCQkJZ290byBvdXQ7CgkJfQoJ
CWlmIChlcnJubyAhPSBFTk9FWEVDKSB7CgkJCWZwcmludGYoc3RkZXJyLCAiZXhlY3ZlKCVzKTog
JXMsIGV4cGVjdGVkIEVOT0VYRUNcbiIsCgkJCQlwYXRoLCBzdHJlcnJvcihlcnJubykpOwoJCQly
ZXQgPSBDSElMRF9FUlJPUjsKCQkJZ290byBvdXQ7CgkJfQoJCWNpZCA9IHJzZXFfY3VycmVudF9t
bV9jaWQoKTsKCQlpZiAoY2lkID4gd29yc3QpCgkJCXdvcnN0ID0gY2lkOwoJCWlmIChjaWQgPj0g
bnJfY2lkcykgewoJCQlmcHJpbnRmKHN0ZGVyciwgIm1tX2NpZCAldSAoMHgleCkgYWZ0ZXIgYSBm
YWlsZWQgZXhlY3ZlLCByb3VuZCAlZCBvZiAlZFxuIiwKCQkJCWNpZCwgY2lkLCBpLCBST1VORFMp
OwoJCQlyZXQgPSBDSElMRF9GQUlMOwoJCQlnb3RvIG91dDsKCQl9Cgl9CglmcHJpbnRmKHN0ZGVy
ciwgIiVkIHRocmVhZHMsICVkIGZhaWxlZCBleGVjdmUsIGxhcmdlc3QgbW1fY2lkICV1LCBiZWxv
dyAldVxuIiwKCQlzdGFydGVkICsgMSwgUk9VTkRTLCB3b3JzdCwgbnJfY2lkcyk7Cm91dDoKCVJT
RVFfV1JJVEVfT05DRShzdG9wLCAxKTsKCWZvciAoaSA9IDA7IGkgPCBzdGFydGVkOyBpKyspCgkJ
cHRocmVhZF9qb2luKHRocmVhZFtpXSwgTlVMTCk7Cgl1bmxpbmsocGF0aCk7CglyZXR1cm4gcmV0
Owp9CgovKiBSdW4gb24gQGNwdSBhbmQgcmV0dXJuIHRoZSBtbV9jaWQgcmVhZCB0aGVyZS4gKi8K
c3RhdGljIHVuc2lnbmVkIGludCBjaWRfb25fY3B1KGludCBjcHUpCnsKCWNwdV9zZXRfdCBvbmU7
CgoJQ1BVX1pFUk8oJm9uZSk7CglDUFVfU0VUKGNwdSwgJm9uZSk7CglpZiAoc2NoZWRfc2V0YWZm
aW5pdHkoMCwgc2l6ZW9mKG9uZSksICZvbmUpKQoJCXJldHVybiBVSU5UX01BWDsKCXJldHVybiBy
c2VxX2N1cnJlbnRfbW1fY2lkKCk7Cn0KCi8qCiAqIFRoZSBzZWNvbmQgcHJvY2VzcyB1bmRlciB0
ZXN0LiBJdHMgdGhyZWFkcyBtYWtlIHRoZSBtbSBzd2l0Y2ggdG8gcGVyCiAqIENQVSBtb2RlIGFu
ZCBleGl0LiBUaGUgbGFzdCB0aHJlYWQgdGhlbiBmYWlscyBleGVjdmUoMikgaW4gYSBsb29wIG9u
IHRoZQogKiBDUFUgQGZyb20uIEEgaGVscGVyIHByb2Nlc3MgbW92ZXMgaXQgdG8gdGhlIENQVSBA
dG8sIEBkZWxheV91cyBhZnRlciB0aGUKICogc3RhcnQgb2YgdGhlIGxvb3AuIFRoZSB0aHJlYWQg
dGhlbiB2aXNpdHMgYm90aCBDUFVzIGFuZCBtdXN0IHJlYWQgMCBvbgogKiBlYWNoLgogKiBSZXR1
cm4gYSBDSElMRF8qIHN0YXR1cy4KICovCnN0YXRpYyBpbnQgcnVuX2NoaWxkX21vdmVkKGludCBk
ZWxheV91cykKewoJcHRocmVhZF90IHRocmVhZFtUSFJFQURTXTsKCWNoYXIgcGF0aFtQQVRIX01B
WF07CglpbnQgY3B1c1tOQVJST1dfQ1BVU10sIG5yID0gMCwgY3B1LCBpLCBzdGFydGVkID0gMCwg
cmV0ID0gQ0hJTERfUEFTUzsKCWludCBmcm9tLCB0bywgZ29bMl0sIHN0YXR1czsKCXVuc2lnbmVk
IGludCBjaWQwLCBjaWQxOwoJY3B1X3NldF90IG1hc2ssIG9uZTsKCXBpZF90IGhlbHBlciwgc2Vs
ZiA9IGdldHBpZCgpOwoJY2hhciBjID0gMDsKCglpZiAoc2NoZWRfZ2V0YWZmaW5pdHkoMCwgc2l6
ZW9mKG1hc2spLCAmbWFzaykpCgkJcmV0dXJuIENISUxEX0VSUk9SOwoJZm9yIChjcHUgPSAwOyBj
cHUgPCBDUFVfU0VUU0laRSAmJiBuciA8IE5BUlJPV19DUFVTOyBjcHUrKykgewoJCWlmIChDUFVf
SVNTRVQoY3B1LCAmbWFzaykpCgkJCWNwdXNbbnIrK10gPSBjcHU7Cgl9CglpZiAobnIgPCBOQVJS
T1dfQ1BVUykgewoJCWZwcmludGYoc3RkZXJyLCAiZmV3ZXIgdGhhbiAlZCBhbGxvd2VkIENQVXNc
biIsIE5BUlJPV19DUFVTKTsKCQlyZXR1cm4gQ0hJTERfU0tJUDsKCX0KCWlmIChtYWtlX3Vua25v
d25fZm9ybWF0X2ZpbGUocGF0aCwgc2l6ZW9mKHBhdGgpKSkgewoJCWZwcmludGYoc3RkZXJyLCAi
bm8gZGlyZWN0b3J5IHRvIHJ1biBhbiB1bmtub3duIGZvcm1hdCBmaWxlIGZyb21cbiIpOwoJCXJl
dHVybiBDSElMRF9TS0lQOwoJfQoKCWZvciAoaSA9IDA7IGkgPCBUSFJFQURTOyBpKyspIHsKCQlp
ZiAocHRocmVhZF9jcmVhdGUoJnRocmVhZFtpXSwgTlVMTCwgd2FpdGVyLCBOVUxMKSkKCQkJYnJl
YWs7CgkJc3RhcnRlZCsrOwoJfQoJLyogUnVuIG9uIGJvdGggQ1BVcyB3aGlsZSB0aGUgdGhyZWFk
cyBleGlzdDogZWFjaCBDUFUgdGFrZXMgYSBDSUQuICovCglmb3IgKGkgPSAwOyBpIDwgMiAqIE5B
UlJPV19DUFVTOyBpKyspCgkJY2lkX29uX2NwdShjcHVzW2kgJSBOQVJST1dfQ1BVU10pOwoJUlNF
UV9XUklURV9PTkNFKHN0b3AsIDEpOwoJZm9yIChpID0gMDsgaSA8IHN0YXJ0ZWQ7IGkrKykKCQlw
dGhyZWFkX2pvaW4odGhyZWFkW2ldLCBOVUxMKTsKCWlmIChzdGFydGVkIDwgVEhSRUFEUykgewoJ
CXJldCA9IENISUxEX0VSUk9SOwoJCWdvdG8gb3V0OwoJfQoKCWNpZDAgPSBjaWRfb25fY3B1KGNw
dXNbMF0pOwoJY2lkMSA9IGNpZF9vbl9jcHUoY3B1c1sxXSk7CglpZiAoY2lkMCA9PSBVSU5UX01B
WCB8fCBjaWQxID09IFVJTlRfTUFYKSB7CgkJcmV0ID0gQ0hJTERfRVJST1I7CgkJZ290byBvdXQ7
Cgl9CgkvKiBUaGUgQ1BVcyBvd24gdGhlIENJRHMgb25seSBpZiBvbmUgb2YgdGhlbSByZWFkcyBh
Ym92ZSAwLiAqLwoJaWYgKCFjaWQwICYmICFjaWQxKSB7CgkJZnByaW50ZihzdGRlcnIsICJ0aGUg
bW0gaXMgbm90IGluIHBlciBDUFUgbW9kZSB3aXRoIGEgc2luZ2xlIHRocmVhZFxuIik7CgkJcmV0
ID0gQ0hJTERfU0tJUDsKCQlnb3RvIG91dDsKCX0KCS8qIExlYXZlIGZyb20gdGhlIENQVSB0aGF0
IGRvZXMgbm90IGhvbGQgQ0lEIDAsIHJlam9pbiBvbiB0aGUgb3RoZXIuICovCglmcm9tID0gY2lk
MCA/IGNwdXNbMF0gOiBjcHVzWzFdOwoJdG8gPSBmcm9tID09IGNwdXNbMF0gPyBjcHVzWzFdIDog
Y3B1c1swXTsKCWNpZF9vbl9jcHUoZnJvbSk7CgoJaWYgKHBpcGUoZ28pKSB7CgkJcmV0ID0gQ0hJ
TERfRVJST1I7CgkJZ290byBvdXQ7Cgl9CgloZWxwZXIgPSBmb3JrKCk7CglpZiAoaGVscGVyIDwg
MCkgewoJCWNsb3NlKGdvWzBdKTsKCQljbG9zZShnb1sxXSk7CgkJcmV0ID0gQ0hJTERfRVJST1I7
CgkJZ290byBvdXQ7Cgl9CglpZiAoIWhlbHBlcikgewoJCS8qIFJ1biBiZXNpZGUgdGhlIHByb2Nl
c3MgdW5kZXIgdGVzdCwgbm90IG9uIGl0cyBDUFUuICovCgkJQ1BVX1pFUk8oJm9uZSk7CgkJQ1BV
X1NFVCh0bywgJm9uZSk7CgkJaWYgKHNjaGVkX3NldGFmZmluaXR5KDAsIHNpemVvZihvbmUpLCAm
b25lKSB8fCByZWFkKGdvWzBdLCAmYywgMSkgIT0gMSkKCQkJX2V4aXQoMSk7CgkJdXNsZWVwKGRl
bGF5X3VzKTsKCQlfZXhpdCghIXNjaGVkX3NldGFmZmluaXR5KHNlbGYsIHNpemVvZihvbmUpLCAm
b25lKSk7Cgl9CglpZiAod3JpdGUoZ29bMV0sICZjLCAxKSAhPSAxKSB7CgkJLyogVGhlIGhlbHBl
ciB3YWl0cyBmb3IgdGhhdCBieXRlLiAqLwoJCWtpbGwoaGVscGVyLCBTSUdLSUxMKTsKCQlyZXQg
PSBDSElMRF9FUlJPUjsKCX0KCWZvciAoaSA9IDA7IGkgPCBNT1ZFX0VYRUNTOyBpKyspIHsKCQlj
aGFyICpjb25zdCBhdltdID0geyBwYXRoLCBOVUxMIH07CgoJCWV4ZWN2ZShwYXRoLCBhdiwgTlVM
TCk7Cgl9CglpZiAod2FpdHBpZChoZWxwZXIsICZzdGF0dXMsIDApICE9IGhlbHBlciB8fCAhV0lG
RVhJVEVEKHN0YXR1cykgfHwKCSAgICBXRVhJVFNUQVRVUyhzdGF0dXMpKQoJCXJldCA9IENISUxE
X0VSUk9SOwoJY2xvc2UoZ29bMF0pOwoJY2xvc2UoZ29bMV0pOwoKCS8qIFRoZSBmaXJzdCB2aXNp
dCBsZXRzIHRoZSBrZXJuZWwgc2V0dGxlLCB0aGUgc2Vjb25kIG9uZSBpcyBqdWRnZWQuICovCglm
b3IgKGkgPSAwOyBpIDwgMiAqIE5BUlJPV19DUFVTICYmIHJldCA9PSBDSElMRF9QQVNTOyBpKysp
IHsKCQl1bnNpZ25lZCBpbnQgY2lkID0gY2lkX29uX2NwdShjcHVzW2kgJSBOQVJST1dfQ1BVU10p
OwoKCQlpZiAoY2lkID09IFVJTlRfTUFYKSB7CgkJCXJldCA9IENISUxEX0VSUk9SOwoJCX0gZWxz
ZSBpZiAoaSA+PSBOQVJST1dfQ1BVUyAmJiBjaWQpIHsKCQkJZnByaW50ZihzdGRlcnIsCgkJCQki
c2luZ2xlIHRocmVhZCwgbW1fY2lkICV1IG9uIENQVSAlZCBhZnRlciBhIGZhaWxlZCBleGVjdmUg
bW92ZWQgZnJvbSBDUFUgJWQgdG8gQ1BVICVkXG4iLAoJCQkJY2lkLCBjcHVzW2kgJSBOQVJST1df
Q1BVU10sIGZyb20sIHRvKTsKCQkJcmV0ID0gQ0hJTERfRkFJTDsKCQl9Cgl9Cm91dDoKCXVubGlu
ayhwYXRoKTsKCXJldHVybiByZXQ7Cn0KCi8qIEtlZXAgdGhlIGZpcnN0IEBuciBDUFVzIG9mIEBz
cmMgaW4gQGRzdC4gKi8Kc3RhdGljIGludCBuYXJyb3dfY3B1cyhjcHVfc2V0X3QgKmRzdCwgY29u
c3QgY3B1X3NldF90ICpzcmMsIGludCBucikKewoJaW50IGNwdSwgdGFrZW4gPSAwOwoKCUNQVV9a
RVJPKGRzdCk7Cglmb3IgKGNwdSA9IDA7IGNwdSA8IENQVV9TRVRTSVpFICYmIHRha2VuIDwgbnI7
IGNwdSsrKSB7CgkJaWYgKCFDUFVfSVNTRVQoY3B1LCBzcmMpKQoJCQljb250aW51ZTsKCQlDUFVf
U0VUKGNwdSwgZHN0KTsKCQl0YWtlbisrOwoJfQoJcmV0dXJuIHRha2VuOwp9CgovKgogKiBSdW4g
QGZuKEBhcmcpIGluIGEgbmV3IHByb2Nlc3MgYW5kIHJldHVybiBpdHMgZXhpdCBzdGF0dXMuIFRo
ZSBhZmZpbml0eQogKiBpcyBAbmFycm93IHdoZW4gaXRzIG1tIGlzIGNyZWF0ZWQuIFRoZSB1bmlv
biBvZiBhbGxvd2VkIENQVXMgb2YgYW4gbW0KICogc3RhcnRzIHRoZXJlIGFuZCBvbmx5IGdyb3dz
LgogKi8Kc3RhdGljIGludCBydW5fdW5kZXJfdGVzdChpbnQgKCpmbikoaW50KSwgaW50IGFyZywg
Y29uc3QgY3B1X3NldF90ICpuYXJyb3csCgkJCSAgY29uc3QgY3B1X3NldF90ICphbGxvd2VkKQp7
CglpbnQgc3RhdHVzID0gMDsKCXBpZF90IGNoaWxkOwoKCWlmIChzY2hlZF9zZXRhZmZpbml0eSgw
LCBzaXplb2YoKm5hcnJvdyksIG5hcnJvdykpCgkJa3NmdF9leGl0X3NraXAoInNjaGVkX3NldGFm
ZmluaXR5OiAlc1xuIiwgc3RyZXJyb3IoZXJybm8pKTsKCWNoaWxkID0gZm9yaygpOwoJaWYgKCFj
aGlsZCkKCQlfZXhpdChmbihhcmcpKTsKCWlmIChjaGlsZCA8IDApCgkJa3NmdF9leGl0X2ZhaWxf
bXNnKCJmb3JrOiAlc1xuIiwgc3RyZXJyb3IoZXJybm8pKTsKCWlmIChzY2hlZF9zZXRhZmZpbml0
eSgwLCBzaXplb2YoKmFsbG93ZWQpLCBhbGxvd2VkKSkKCQlrc2Z0X2V4aXRfZmFpbF9tc2coInNj
aGVkX3NldGFmZmluaXR5OiAlc1xuIiwgc3RyZXJyb3IoZXJybm8pKTsKCWlmICh3YWl0cGlkKGNo
aWxkLCAmc3RhdHVzLCAwKSAhPSBjaGlsZCkKCQlrc2Z0X2V4aXRfZmFpbF9tc2coIndhaXRwaWQ6
ICVzXG4iLCBzdHJlcnJvcihlcnJubykpOwoJaWYgKCFXSUZFWElURUQoc3RhdHVzKSkKCQlrc2Z0
X2V4aXRfZmFpbF9tc2coInRoZSBwcm9jZXNzIHVuZGVyIHRlc3Qgd2FzIGtpbGxlZCBieSBzaWdu
YWwgJWRcbiIsCgkJCQkgICBXVEVSTVNJRyhzdGF0dXMpKTsKCXJldHVybiBXRVhJVFNUQVRVUyhz
dGF0dXMpOwp9CgpzdGF0aWMgdm9pZCByZXBvcnQoaW50IHN0YXR1cywgY29uc3QgY2hhciAqbmFt
ZSkKewoJc3dpdGNoIChzdGF0dXMpIHsKCWNhc2UgQ0hJTERfUEFTUzoKCQlrc2Z0X3Rlc3RfcmVz
dWx0X3Bhc3MoIiVzXG4iLCBuYW1lKTsKCQlicmVhazsKCWNhc2UgQ0hJTERfU0tJUDoKCQlrc2Z0
X3Rlc3RfcmVzdWx0X3NraXAoIiVzXG4iLCBuYW1lKTsKCQlicmVhazsKCWNhc2UgQ0hJTERfRkFJ
TDoKCQlrc2Z0X3Rlc3RfcmVzdWx0X2ZhaWwoIiVzXG4iLCBuYW1lKTsKCQlicmVhazsKCWRlZmF1
bHQ6CgkJa3NmdF9leGl0X2ZhaWxfbXNnKCJ0aGUgcHJvY2VzcyB1bmRlciB0ZXN0IGZhaWxlZCB0
byBydW5cbiIpOwoJfQp9CgpzdGF0aWMgaW50IHJ1bl9jaGlsZF90aHJlYWRzKGludCB1bnVzZWQp
CnsKCXJldHVybiBydW5fY2hpbGQoKTsKfQoKaW50IG1haW4odm9pZCkKewoJY3B1X3NldF90IGFs
bG93ZWQsIG5hcnJvdzsKCWludCBzdGF0dXMsIGk7CgoJa3NmdF9wcmludF9oZWFkZXIoKTsKCWtz
ZnRfc2V0X3BsYW4oMik7CgoJaWYgKCFyc2VxX2F2YWlsYWJsZSgpKQoJCWtzZnRfZXhpdF9za2lw
KCJyc2VxIGlzIHVuYXZhaWxhYmxlXG4iKTsKCS8qIGdsaWJjIGJlZm9yZSAyLjM1IHJlZ2lzdGVy
cyBubyByc2VxIGFyZWEuICovCglpZiAocnNlcV9yZWdpc3Rlcl9jdXJyZW50X3RocmVhZCgpKQoJ
CWtzZnRfZXhpdF9mYWlsX21zZygicnNlcV9yZWdpc3Rlcl9jdXJyZW50X3RocmVhZDogJXNcbiIs
IHN0cmVycm9yKGVycm5vKSk7CglpZiAoIXJzZXFfbW1fY2lkX2F2YWlsYWJsZSgpKQoJCWtzZnRf
ZXhpdF9za2lwKCJ0aGUgcnNlcSBtbV9jaWQgZmllbGQgaXMgdW5hdmFpbGFibGVcbiIpOwoJaWYg
KHNjaGVkX2dldGFmZmluaXR5KDAsIHNpemVvZihhbGxvd2VkKSwgJmFsbG93ZWQpKQoJCWtzZnRf
ZXhpdF9mYWlsX21zZygic2NoZWRfZ2V0YWZmaW5pdHk6ICVzXG4iLCBzdHJlcnJvcihlcnJubykp
OwoJaWYgKCFuYXJyb3dfY3B1cygmbmFycm93LCAmYWxsb3dlZCwgTkFSUk9XX0NQVVMpKQoJCWtz
ZnRfZXhpdF9za2lwKCJubyBDUFUgdG8gcnVuIG9uXG4iKTsKCglzdGF0dXMgPSBydW5fdW5kZXJf
dGVzdChydW5fY2hpbGRfdGhyZWFkcywgMCwgJm5hcnJvdywgJmFsbG93ZWQpOwoJcmVwb3J0KHN0
YXR1cywgIm1tX2NpZCBhZnRlciBhIGZhaWxlZCBleGVjdmUiKTsKCgkvKiBUaGUgaGVscGVyJ3Mg
bW92ZSBoYXMgdG8gbGFuZCBpbnNpZGUgYW4gZXhlY3ZlOiBzcHJlYWQgaXRzIGRlbGF5LiAqLwoJ
Zm9yIChpID0gMDsgaSA8IEFUVEVNUFRTOyBpKyspIHsKCQlzdGF0dXMgPSBydW5fdW5kZXJfdGVz
dChydW5fY2hpbGRfbW92ZWQsIChpICogMzcpICUgMTAwMCwgJm5hcnJvdywgJmFsbG93ZWQpOwoJ
CWlmIChzdGF0dXMgIT0gQ0hJTERfUEFTUykKCQkJYnJlYWs7Cgl9CglyZXBvcnQoc3RhdHVzLCAi
bW1fY2lkIG9mIGEgc2luZ2xlIHRocmVhZCBhZnRlciBhIGZhaWxlZCBleGVjdmUgb24gYW5vdGhl
ciBDUFUiKTsKCWtzZnRfZmluaXNoZWQoKTsKfQo=

--------------F1Id0wfGtH7o2MTEJao5oUm4--
