Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.53.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794915563;
	b=5Ga6u1cDFLsz95ReVQ/4duN3WIQCkwEeMPV43ErbNlvdnxM0hbkwo1IJ7A094GoXMTu7
	 0j4gmgUdILjeCPMAL+RSXOtUZLRl8xryl4zNQHA6CNVTKLKbx1WRHZqCojMXpNvH09ib5
	 +C8KRkpT3iX4TdjwX50SVP3yTndI2oKNJRjp130TTZUs3mvX+vOnTqyEEVtOeBEOTxAww
	 7LlUjk8I8+90Dbv3NyhHSTDx7xnfa5V+WNDVHdqUprZYmzkKQBU5OMOuIhM9JV+wieGV6
	 YzqyMoqTIyIooC3og6JRG4VXwyoQdpnAe8g8BJEElf7ye0PzQmnE9TqlGZU/0XvYC0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915563;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-slblob-mailprops:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=aUcFkiBZPom2TVWF1exqWFCkeRizGoqgehwQFgCCVXw=;
	b=pFa6NjyqTUqdzdshCLbpGqaQiFH+rrhbiFs+MYyyvB/gsnydxdyRjr6pCHL8SIMb0BBP
	 yiDTjjodHbSyKpYJGSL3yGKhlRv0KpkUQECWwyW7Nb4PI3LcjW8UHnCs/pWWP9TTm0F1E
	 KFofYNS5Qiyb97B5xmK6Ly7IsxLcezHQwLFCgLuandtlV/ogvfGmghxvCTqAAbQ498jVu
	 BSm9hb4Ch8e57A5IilnS7LCTrOoBe2jDSbyELeiLnoN6cytA99Y8Km0SsWlVeEi0zipGX
	 Ik8bLdWmdtuf8B9iVXybxIHxzxXbmJY2bnDdIyoWQBkWl+KtYumE9S8feR5+Iqlk0uA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	dkim=pass header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=ngf9CLeT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.53.54
Received: from WA2P291CU004.outbound.protection.outlook.com (mail-polandcentralazolkn19012054.outbound.protection.outlook.com [52.103.53.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E23E606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E23E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=ngf9CLeT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdXNXO5ggdhfH+XrF/VTF4zrpY3EwVZwiAWnPi3of8pFK0583UhlQ8ZFM3uWXRkDBYx47dQJzgj4Z5cNDd5gG3+ah0TGYa79lxPJDBAnXBjhztkR+Om4eyhsVtJRH+CMeMk9OzhSsE/ZycAb+lYYN357gZVjycVTGZbOFPhjyX4WSX4ybeR1j8rxfdM/kuLMHf32eu6VpXRMMW9uAnDKhk3eJz74+dHeuDnbLdlx6wOlyYmQ2zejWozIqx24pfkzrnJUq2DVeo9Bwr2gfprX1sJuhPM6vetfnjCOw4NkifAEPz4kx/cHc64VaqADLH/fgUz8f4CYWP/TIhKy4oBJrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUcFkiBZPom2TVWF1exqWFCkeRizGoqgehwQFgCCVXw=;
 b=nOvhnvWOlkoDmDfTW/TblIOWAPDjBPh5s0BqMGLidJrh09cXeSwgiaXnM21xbNAZOxEjOlR1rzHiGbIJbjwG+E6PFEAOu4veeOMKL4T+TuxCHmsLyybDDPt3qc1Hypedz3FLpG+ztwrMlsXj4dRzzSP4hBd53KOnpdZ/WcRB3K1iakprGHDmViRMeZQMHDvxxFEdKLQ21BRpPOp+s2V6h3U2GVUQxC141zOP84tutLRprTR4RGICnQVvogawpl8OtGInKlhNUszJRqPnejblb5rz+EF9OUEuHZsr3B1fqgCZJ5ree3fSxJas4JnAaEFzcufAuDliU7tMgAKBRLAIjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUcFkiBZPom2TVWF1exqWFCkeRizGoqgehwQFgCCVXw=;
 b=ngf9CLeT4WFST6l4yzrH/wBYtUB67nb18eSNp+bYUcMkr5IkcaHN3HMmx44TtGVvTAZrK+bupkWsL1JSguDy2XtdBaRcSsNd3aGzWZ15jU3695Ekj040BXgJwOWIFnmRk0uXosLUmmNfW/sehFPt5gi8/aHqxkex7JH3/yPQUVQhj6JO2pGQZFkG1Kik8PGj+d8yscemoBW6mYjv0R5iaobdanrlVVKWXECvbcPwbUx0r0rc9+P0sFAxh99OdTg2/t/xGupmXAH8CHmNTereenVijClnJtITs876DXE5U+6AJrPj1eyk9BXzh9mW4e5rVYhLmH9h6mamJlNVY8FbNA==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA0P291MB538408.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:44::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 11:39:20 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 11:39:19 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jiri
 Wiesner <jwiesner@suse.de>, Daniel J Blueman <daniel@quora.org>,
	=?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] x86/hpet: Replace sprintf() with scnprintf() in
 hpet_select_clockevents()
Thread-Topic: [PATCH] x86/hpet: Replace sprintf() with scnprintf() in
 hpet_select_clockevents()
Thread-Index: AQHddohI+TLOqhQheEKSKFYW9eZNrA==
Date: Tue, 17 Nov 2026 11:39:19 +0000
Message-ID: <20261117113916.57740-1-habilerenturker@hotmail.com>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA0P291MB538408:EE_
x-ms-office365-filtering-correlation-id: 486e374e-52b6-4ce4-63b6-08df449f6b3d
x-ms-exchange-slblob-mailprops:
 7J/vb0KDx3j4EGtrWC76yZtYjXYOkK33D9bXOMioHsIjaA5xoNA8TWY79iO3deNsOJzxg6UycRl4YQhZJf9Z+I9qURpSGp275jEb2P5Oat2bO1b6ywfGk5iHQ9uWmq+HZ6kOshvRJ8uecKKXqmXrKoDpA5irbVudutT217d2h5+IlTVemETE0qL3asCAuU+CaSuyWWKNZijNY1D/s5+mvDuRu9UgtL3wTR3fa1QLV5N5HZkYqRc2nq3XWVwEvzRNPUb0GBRh+m0TzXpiAbochxrKty/m22CapKgMxNOEXy3s191lsVc2pEZeoSK+JXyhlG+AX0MkHpEZSluc3B1yDj9lsaSjznKZKh3CZWWWfEpMKMyPdPltS9zi+EJWOosGXU1lYRt9omDi7EEdUdhNd36uYAv0ZTZUY1elJp36pjWCh84vPUDTtZvmFPVZml3ch5/iB3k5bU0lvEVUTH6Rf5vtnT60aUBnDBoN4m71yinq5l8om4yyTxjJbYpoadk+vas9L7fUqZCNEXYCWITeS1Jmv8j5oyL1BsQUYXUs6rkAOOjzWfzir+pElvJnIZG8Wq1NAT65lWE9EYAZ6b/j2G1QzDYULo7gVLl5I4SebhVvItZiz/0Lad2yRfNHGleqb0KJ5cdfhhkFpQ3C1ySXymdEMPliRhKW25RvVYth9Vwxz/QnyE+ulVYfMe2fiOYPCwOAv1CFrVWYXijRS2ILByf9vWs/0vI3g4G3rgORNAuuNlKvWPB8tAC0ZLZqr48+43Brh9Ux1V5DzLFAOAkLt+aLtlmjxuU7gvsaHNkpu8Q=
x-microsoft-antispam:
 BCL:0;ARA:14566002|31061999003|25010399006|24021099003|19110799012|38102599003|4140399003|15080799012|8060799015|8062599012|51005399006|40105399003|102099032|3412199025|440099028|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?UjFKR3ZXU1lOdGZwQ0trczJZSEhab3FrTFhlRE1nS1AwTDRneTN5dSs1bmxm?=
 =?utf-8?B?UzRVY1NTeUxLUGNBRHdWbWZpQXo1Slh5WWtiNHQwZFBVdUVOUDlScHhCZVJZ?=
 =?utf-8?B?NnFsRmhtcHJ3aVBiSUdYbExPZzZvRyt1UFdPekhOVC9WdHJwMmFIZk4rUDh5?=
 =?utf-8?B?aitWY2NrYWlCMUVBQnFsMGZpRmh4bkZGUUVpQWsyTzBxVHFQdktycUk1cmh0?=
 =?utf-8?B?NUlrK1dHcXJJcmhJTitiVnhyek5ZaS9wNHZjUlhVb2tYbUVnemFmUHBLTDB3?=
 =?utf-8?B?aWxLdDZvQW9CWVVoMVVKdnZmbUdXWFVDSDdRV0Y2cWtXajIvZGs3TXRTWlpE?=
 =?utf-8?B?TWpoNGxPZ3BCSTRCU1FwUU5qaG00cDlCcE1haCtqWVA5bE9OYUF4SDNmdjlG?=
 =?utf-8?B?UitkL3dsWXFMTFkxdXdzU2YyRmNPYkpHVWlBdUIyYzRnN1oycTJnME9XTDAz?=
 =?utf-8?B?dkwyK2hxck1URTJ0VlV2dGZzbVJISk5xUG1PSUV4TTJ5dlBZZ1cvbDBLQm1t?=
 =?utf-8?B?QzJGNDBrdS85NWRBVEdzUVYrZGtsRDJsUDMzb0RsNlZibTdUaWxTMnNId2U3?=
 =?utf-8?B?SCs2TFcvNUdkQjBzVExwN3dTSU5jN2pjY2tYWlVzNTFpay9CWFNEUzlaNURQ?=
 =?utf-8?B?MjNaOU1oWHhDQTVvSnRNemtzdzBkNitnbGdlUG5la3pUeUJ3V2JUSmtIaVZx?=
 =?utf-8?B?aDdZcU40bDl1NmxyUmF0SVU0ZHcrRGdyKy9iQ1RaZktLOFRMbUJ4KzY4U2U5?=
 =?utf-8?B?MzlsYURLakljL0xKN3B0a0JkTmkzYlFzUjVRakJuVWplbzRta25aWmNQVzcw?=
 =?utf-8?B?WWVkaVg5RVdGN3pMdCtIQkFXZGZ4OHhqMzM4a2pzZW9YRkt4YXFqSm4wYjFa?=
 =?utf-8?B?QnVPZkdvTmk2NW1nNzRkMlVYeGJkTE9ZYUhYM3RuT1FEN1Izcmg3RzcxZ21w?=
 =?utf-8?B?SHZDa2R3WnJQek5rbjI2UksrQ2R6Q2E3WnhCRWQvQlFvR1RRUnVFZFpJcGNH?=
 =?utf-8?B?cDAvNFY4MzZ5d1R3V0dyVE5KT25OYlVIOXVFVDFyQ3M3Y0Zmd2lkNW0yakpu?=
 =?utf-8?B?RlhMLzZ2a01XbWxRY0FLbStwQVJuSmQ5WmRvcUlyMnVOQVVoZnFxbDhkYVNP?=
 =?utf-8?B?VHRTRENUZWo4MURnRjhjVElsMlUrd2dPY0pMOUp1bTA1Sm9STGMxN1ErL1pU?=
 =?utf-8?B?cThJYmlab2RKcWJIUFM5dEx3a08rdE1oeVhIQk9yREptWDhOZ08ySGVOdDV4?=
 =?utf-8?B?dFhuNXo2QWtidVBnYzAyOW1abG01bWJXc2VxODdXOVd0dDN6UElCMHBHWU44?=
 =?utf-8?Q?d5OX00Hw/eeDHRbhidU4OilIh1ySOjPNtD?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VHV0L0VyL00wNTNyanpjUVJlRVpYazl0QTNPbWtwQjdDcHZPdjlDMmxISW1F?=
 =?utf-8?B?cHdpY1RTZnV0ZWMwNGd6Q3RxemFwQUtnMy9hSFhYQ2ZsK3o3RXdMNFhYVFdU?=
 =?utf-8?B?QmVVNk1xc1ltLzZYazU0YzhnaXN1U01PSWhqd1htdkpZQk95RXhjdU42SzhM?=
 =?utf-8?B?a29JKzRUNFlXSXNDNENlaGVMOUFDWVljZUNMUW03NWUrUmpLdDB0eGhkZ3F4?=
 =?utf-8?B?b1JyZjBMVlZhMElpVEh4VVBUcE5oeWJqc0l2eHZ0VTlsUXVGUzlyN3c5SlVR?=
 =?utf-8?B?TExmU3QwZ0g5QWIvWThiOVJMTW0vNjRmZm1xL08wOTl1QTZJdkYvVk13K2E2?=
 =?utf-8?B?UEJmQ1IxQXh1NFJuL0Y2WjU4NUJiZGs4V3cwbjd1NEZCQmcydnh4MGl0WkNS?=
 =?utf-8?B?WEdXSDY1REdIeHg2SG04T01DMGNjQ01uQ2JWTnFHNUVwcHNRR1BmNkpoU2VX?=
 =?utf-8?B?R1V4OVA3SUFmMkxHMEpOU3ppMU5JUFozY2s4QUtXTHh2dnR4eVRGMDNmL25u?=
 =?utf-8?B?MDQxRWc1Mm9YS0VvWkFxaTZSM0svZkREMVhISXVTNmlRaHV0VFpHL1J1WTZG?=
 =?utf-8?B?MjVGUGU2SDhJWDg1QW5DeWZBZjJYekdiOUxkT0x1QVNUeGhHTTlrRmg1Q2gv?=
 =?utf-8?B?QTlHeG5SRUN2SFB0Vi9zbWxhSlZXUE5wQWdjRS9tRTZPQUY1dmtqMklJUk4y?=
 =?utf-8?B?Z1p3eUZ5VTdzS0RsQU9jTDU2VDBUQzczMTdBNmNEMWxTM09uOWdQeWEwWW92?=
 =?utf-8?B?S25PQXpxTVlPdkZ6SEYvd2J5aXhrZEJFTjU5WE1lQklDSXJrbVNpbGtCMEov?=
 =?utf-8?B?M1hXOFJHd1hFR0JNQmYwR0NhTXJoSW4vaDNKaHFUYnY2K2g5ZGtZL0w1OWk2?=
 =?utf-8?B?ZjQ5R2dqSjRkUTAvRnVoU3UrcWY4QjJOaUE4dFBtM1VsZU9tcTd3NFV4RlFo?=
 =?utf-8?B?dlZZTEdydnY2UnlwaUYxa2J5MHlSMkJ6WXI4VUwzenVJOWlOWjFSYVMwTHJt?=
 =?utf-8?B?QjJSSmpEVjBOMmE1RXY4a2hSZ2NWNTdlR3JXRXBxMG92V0tVU0VMeEcxV0NI?=
 =?utf-8?B?U3dQUnNRTXl0bmdjdGdQd1BuQldOd0cycksxUHRVZ2NZZ296dloycXVYbDl3?=
 =?utf-8?B?d3lPRm40anRGa1VvMk53SzA4YkpZSlVTcFNCbXEwNFA4ZFZkY29DT2VuSUlC?=
 =?utf-8?B?V09pdzNyNkczZDhVNTVDSzhZUTM1TlJWOFFlbzNMamtudTJKQ1dkM3hWS3ZZ?=
 =?utf-8?B?TFFtZTRhRlRYQkhuRTRYd3F6c2U5VGpWUkZham9MNGFxMTZBaGo1T1pjMERz?=
 =?utf-8?B?OHpEM1pPYlVlSDZYNjEzOTBGK1loY1JQK2tFcWg4OGkzZDRWYVZoS0JGWWlR?=
 =?utf-8?B?T0Q0K2Y1aU5vamZEc0tKVEVNLzZkdm5UdzhUSGhGUWVxWkJWNXErNWRCMGhL?=
 =?utf-8?B?cVhVNThIU0ZKTXBrY0JjWENQRFBpSFRGTVg3ZGVaSHR6OXFNL1VNUjJIcUxl?=
 =?utf-8?B?KzcvRUxEV2w2NkR6OWhvTk9XUkNMc08wUno0cVRlc1RqNWdzdHh5cHpLMlBD?=
 =?utf-8?B?ZVAwdWhtdU80T3FJekZXb0JGN0xQYTZKY0oyQVpQVVpIeHc2Zy83R2EvbWRx?=
 =?utf-8?B?WWdyMnpDTm0rSEVSK3U3aWQ2ZkxnT2ZQUGNhN1BTMmFia0lweEpSVUY5ZWpN?=
 =?utf-8?B?RXhUUXhKRkJOdE9hRTNJVUJtY1ZSeURpSmpoOUVnOVo0YTMvUzYyK0hadlZ2?=
 =?utf-8?B?MmhKV09zK2pieHpjYko3RFl3N2NVTTF5REpvMERsenpEcGl3aEpwNzVLUnps?=
 =?utf-8?B?cUpCbHBZT1o5OWJpYXZMZGtUQkdZZVVkQytoaEhUVE1WTFMrMkgyMlJMaGZQ?=
 =?utf-8?Q?crX3BABJim9w2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6BC7C872B7B3F046A27B04A498333D4C@POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-2112e.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 486e374e-52b6-4ce4-63b6-08df449f6b3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 11:39:19.9444
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA0P291MB538408

UmVwbGFjZSB0aGUgZGVwcmVjYXRlZCBzcHJpbnRmKCkgY2FsbCB3aXRoIHNjbnByaW50ZigpIHdo
ZW4gZm9ybWF0dGluZwp0aGUgcGVyLUNQVSBIUEVUIGNoYW5uZWwgbmFtZSBpbnRvIHRoZSAxMC1i
eXRlIGhjLT5uYW1lIGJ1ZmZlci4KVXNpbmcgc2NucHJpbnRmKCkgZW5zdXJlcyBudWxsLXRlcm1p
bmF0aW9uIHdoaWxlIGF2b2lkaW5nCi1XZm9ybWF0LXRydW5jYXRpb24gd2FybmluZ3MgZm9yIHRo
ZSB1bnNpZ25lZCBpbnQgY2hhbm5lbCBpbmRleC4KClNpZ25lZC1vZmYtYnk6IEhhYmlsIEVyZW4g
VMO8cmtlciA8aGFiaWxlcmVudHVya2VyQGhvdG1haWwuY29tPgotLS0KIGFyY2gveDg2L2tlcm5l
bC9ocGV0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvaHBldC5jIGIvYXJjaC94ODYva2Vy
bmVsL2hwZXQuYwppbmRleCA4ZGM3YjcxMGUxMjUuLjBlZGYwZmUwYWMyYiAxMDA2NDQKLS0tIGEv
YXJjaC94ODYva2VybmVsL2hwZXQuYworKysgYi9hcmNoL3g4Ni9rZXJuZWwvaHBldC5jCkBAIC03
MjIsNyArNzIyLDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGhwZXRfc2VsZWN0X2Nsb2NrZXZlbnRz
KHZvaWQpCiAJCWlmICghKGhjLT5ib290X2NmZyAmIEhQRVRfVE5fRlNCX0NBUCkpCiAJCQljb250
aW51ZTsKIAotCQlzcHJpbnRmKGhjLT5uYW1lLCAiaHBldCVkIiwgaSk7CisJCXNjbnByaW50Ziho
Yy0+bmFtZSwgc2l6ZW9mKGhjLT5uYW1lKSwgImhwZXQldSIsIGkpOwogCiAJCWlycSA9IGhwZXRf
YXNzaWduX2lycShocGV0X2RvbWFpbiwgaGMsIGhjLT5udW0pOwogCQlpZiAoaXJxIDw9IDApCi0t
IAoyLjQ3LjMKCg==
