Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794284214;
	b=Qybie+iwzenPmwkHZkf3qZLosNsAry4Srvd6ivf/LaoNfEsynrhkQSNnmnH0GqKXSqOT
	 QcQzbnAARAKO3/sNjTR0EKlh7kcDJwUd8gDc/GFMkpqR4Ky7twRrerwEACaT+Yderl/Dn
	 5VQ2dy7N3D1g6kZ2Yhq1ssHkRTiUrr4nd3E6C1GQ6mkd80ZINUmIdcmiIrmGgTkm9tr+9
	 f7cEyRVv93vyLRGoqdncOE6ecebKGuTjZc607DN2uNW7o8fuJUJX0bLJmBegMl6IzOMf1
	 /3PAe+8UOynSkdjgLpVV01yQxdW7WSBEsbqbevGUg9YQExcBusL2sz1PeABD7QjpI3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284214;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=OKJ6WobrwbDkYqLAH6fb6qljWiugsDiTZ6U4AQymzpA=;
	b=3vK6v3WkXxpV4bss7rJuJYBD9TwFmJ2PsA2aS11upNs1KaZnBcRp2P+ZNtwgCjiZqdU6
	 mvUazqtjp+uv9b19bvQXYbdXoh7j5byHS47fSStC/Aw4NbWnnc4Qgmfg/EkLjB2IJpjoE
	 dFdhydjW86OoVsxoGM56ZC1no3rj4YNoS9iQTtjJ1Cn+hZYgaYnvzSGz4y5f1yYc7gNJP
	 A3lOb22IydilBaCS0HjyqrSpL4pxiot1JT8CLi/zqJ/hBNYjxCFUx66yYjsBZg+hRrmKf
	 wyz4Dt3SGybkZqG+wX2kY6q2dWPMYqGiNC2yImppW20zoSi6huHnQRfxntSKrDYN6hQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=L681TkNB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.38
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010038.outbound.protection.outlook.com [52.101.201.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BD5606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58BD5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=L681TkNB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZyD89/ADt59TdKkzYpHgNY58YS6iLJ2Bs9YEs1MQTOQcyCeSk5tAHVQhw9YsiR9LwSEc+tWLSyCvGW53HOE/L571niSS2wqKqBtZruZdkcMwONq4vXi3REvcEbw3Lq9SXCUPFbgWm507apTlRO/c8AFr06S0DrXg0doXTuteyB+zweAsc8U1NK1YABCCbZuc+XCo+b/l973LjD6BwE0dCNYVLobe4PpMvxTL+rqQDFHcwPBPoXTTlANlOITZaYWbHXlS168nxw1WbQMUKvoDeXdb/Rhrs0nuoN2eFHl2Tjh/GbV3aLOb0N0fomyLQc6SZ/Qj8LzuM7kh/1sHqkYVbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKJ6WobrwbDkYqLAH6fb6qljWiugsDiTZ6U4AQymzpA=;
 b=ESqPy2FD0K6BqYErmiXqSeLQIc0cJp5fWZNFbdB5ifAOihgNgVixOk6D4pr6DUdP/ULojvAGa4eWGIBK55dBquL6s1frJTyGb2xirll93WsjUomoNiFO/HDWQHyTrOMcYXf6ohJ1mZgLFk6GZX9Ub+nLHZBY7HGWSbmaVtt/8PQRWacIy2dIVpicQF3G9KMn6FnzPUAcjiDwv9XjM2g49PeSITduF5A+ioh7b3XVw6/YjaiL1PNM+mDiBL4jJWfWS/Rp8c89gyVFrLLyYN+4HBYCh3HBDMswsf3cFQYTqmyib9sJYSEMs9rJCNaKIKgvqrNCdwVsiWzad55Jo7+ITw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKJ6WobrwbDkYqLAH6fb6qljWiugsDiTZ6U4AQymzpA=;
 b=L681TkNB7DInJOgulGKcB+qw9d/MHcjqMHTBK+OjpT8kf/7P7tIeT0csY8k0rFGffwuHQrLru5aldpZPeyI2QDTPEi5bFrpojKY2QNhjj3Z4kG3UTmujaroIKW5fZs8mYAC1OuMGDgp15U2eeCf/XsFcbbnyy5phD0s4YPJ56tM=
Received: from BN9PR12MB5259.namprd12.prod.outlook.com (2603:10b6:408:100::17)
 by DS6PR12MB460083.namprd12.prod.outlook.com (2603:10b6:8:4d3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 04:16:51 +0000
Received: from BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed]) by BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed%2]) with mapi id 15.21.0592.007; Tue, 10 Nov 2026
 04:16:50 +0000
From: "Garg, Shivank" <shivankg@amd.com>
To: "Salunke, Hrushikesh" <Hrushikesh.Salunke@amd.com>, "Rao, Bharata Bhasker"
	<bharata@amd.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "david@kernel.org"
	<david@kernel.org>, "mhocko@suse.com" <mhocko@suse.com>, "surenb@google.com"
	<surenb@google.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"ankur.a.arora@oracle.com" <ankur.a.arora@oracle.com>, "ljs@kernel.org"
	<ljs@kernel.org>, "liam@infradead.org" <liam@infradead.org>,
	"vbabka@kernel.org" <vbabka@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>,
	"Nayak, K Prateek" <KPrateek.Nayak@amd.com>, "bp@alien8.de" <bp@alien8.de>,
	"peterz@infradead.org" <peterz@infradead.org>
CC: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v3] mm/memory: drop PROCESS_PAGES_NON_PREEMPT_BATCH
Thread-Topic: [PATCH v3] mm/memory: drop PROCESS_PAGES_NON_PREEMPT_BATCH
Thread-Index: AQHdcH7OSO+J2tGPsk6kyOa+UPv/DbcmSl4AgABpQIA=
Date: Tue, 10 Nov 2026 04:16:50 +0000
Message-ID: <420c59779498e976307ce4591347cd75706a9964.camel@amd.com>
References: <20261109-clear-pages-batch-v3-1-6693efe18dff@amd.com>
	 <b47cc8f4-3f8a-4893-8a2a-f88dd5ab762d@kernel.org>
In-Reply-To: <b47cc8f4-3f8a-4893-8a2a-f88dd5ab762d@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5259:EE_|DS6PR12MB460083:EE_
x-ms-office365-filtering-correlation-id: ffab0997-467b-4df2-231e-08df3ee171dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|22082099003|18002099003|10067099003|921020|38070700021|5023799004|11063799006|4143699003|261102123227099003|261026121527099003|261028144727099003|261022105027099003|261009223027099003|261021121427099003|261021123027099003|56012099006|261026140227099003;
x-microsoft-antispam-message-info:
 mYa/qUqdh7OEfz99LI3iq5IHVZkv4eH2oeON5ST0M6srKY1ZosHChpudY9484MnSmZO9TYOnX3QU0PExgXmyePf29uKno6wf6sg1Zy3RLyiaYLhqRa/e1vI4alOknuahqAOj+x1nd7j8xKjTayCiiJ5XADSPq5ffJiVVfwrf3evBsENsuBwcEERtF0XyYjkcF/JM7ZQEDlAokPihkreb+uRR94M/rTlbgD7wCfpEh84RDyKBgoX2iK7P8K6Jvz9T490pFCVjPpmOFflzvS8M8Iwf+beFeTKoW5/gnoNV9LhSI2YfqF4EtOgcLxRc8ZjuaIaeC1Uo73lSkod4efhxv7qRuEKO31wVJRkFZv5/Els6VFUWzng1lgWJbKcRjoOKifxJoQ3scdC+RnDRnHx+9RWboJZQsMWn5zagrYjxhhyVWeu61+nBUtVHh6eepjRL0FH9fmbwLth7Da2j+fsa29Gy3RdYH9MZeAYPi5UN3N6elrHYLLzpwdyxvLOzVVS0zDVSxFV0s021qnPzaJaPiC3Yag+68ynKb1ifg9dWTj+V1qa0VKU1G2F1/XopAnFB+QIwokSqthe0ZJIv4cQ6gYK4SK3vD3vst2jCsK6Q63Vs4pKCUpPV05uJDv9ClGDTLw7XGkM+/BYN72W2G+Bpwzryx6lYm6++/xZI+N8KHsgZEZVmTPYh/GPGLcbaIvn7
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5259.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(10067099003)(921020)(38070700021)(5023799004)(11063799006)(4143699003)(261102123227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261009223027099003)(261021121427099003)(261021123027099003)(56012099006)(261026140227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RWt3RHQvUDRGM3J5UWYrbjNzK0JYWDJIOUw1RjN0Q3I2aTZaS25xdDlXUzdu?=
 =?utf-8?B?RW9mVnBmOGFQdUo1T0lQbDAzU2ZsZlJRSUszdnJSYmFUcjk2OG5DVFpjKzFa?=
 =?utf-8?B?MnRTUHhTMXhMU01GZHpId0JWMEdEQnlQNzVsNnNoUWQwVTJHUk1zNSt4Wk1o?=
 =?utf-8?B?OHNBVFBjMXJiZGVaVGxaNjZlcndlNHFpV2tEZEl1eGkwTUlpdTFrRGF3NUpT?=
 =?utf-8?B?Vk9HV01DZ3dUbERLR0RSMWJkVVNWUGhPSDVDM1grYnRERHhsSTlaMFlIdk1B?=
 =?utf-8?B?d1p3UTkyTkRtRitBUEpOSG9oU2laS0NxcFVBL2Q2UUZRMHZ3c3BDMm5MUlcz?=
 =?utf-8?B?SnVWRkc0S0tncGRkZEtJVDU4RXBybkNlcXFNZVp5QzJDOWN4dmYrS2ZCeXNF?=
 =?utf-8?B?VTdVSWRTcHM2U29tTGZYaTA0V2xBSWZJYXBnV3lzWlAwU0hJMjZwNVAvYmF1?=
 =?utf-8?B?RDVySElaOGNGVjRkNlloV2h6NVhxZzE2S0gxdU1MeFNJa1ZBcDJ6Y0tLOU1I?=
 =?utf-8?B?VUpNQ0RQZTgxdlJsdjE4aXBvTkVzdkNXaEhpa3hDL09qd1RlSThoYnB5VEhl?=
 =?utf-8?B?NGZVNnhqTElqU0JnbDNuZVBKMTVqcG1VM0ZLbmJHZ1RHTXdyZGF0d21DZzl3?=
 =?utf-8?B?OXpmQUVSNTFxREY3U0VTZUMwdVpUR2MxT0xkUHJJNzFYV3VvUHpPaVVpeXNv?=
 =?utf-8?B?VFA4VnJzSEVNdCtONmJ2UHUrMkpQQzJMNjUxR3IrMUp4ZlBGQ0lmWkhTdlF5?=
 =?utf-8?B?MTk0SGozRGk4cEpuVXMxNW9BOGFDSWRQWW1QLzBXMlZUYWZ2MVEvMG42SmtL?=
 =?utf-8?B?NmRiaDNtWEh5RXcxUUVkWTV4WkFrUCtVWTcybUE3MzVLcmg3ZHpLaFl2VTdZ?=
 =?utf-8?B?bUlBeEJ3WmxXWFEyQk1UZ1hZQWNyMXZvQ3pnSEVyK290dXhnNXZrejFwcnNW?=
 =?utf-8?B?TEc3RXN1QTMrNmoxakdrcjB6UDdqblgwU0MvbGViOTgvQkxIRmR6aFdkMko4?=
 =?utf-8?B?T2JHMldzR1dDUUpEQ0xrYkVZK0Y4UllVN2tWUVlyTVpWdmtFRkkvTzdHamtn?=
 =?utf-8?B?aDF6aUhaR29ORVpYbWFJVDMvTExSWVhBVGwySmhQbkNWdVlhZXY5SSs3Rm92?=
 =?utf-8?B?QnRldlltLzNnN0RZdDgvaUdWdWc3elRZbW5nNUY1c2NzQmlSOE9xSlFHRDBF?=
 =?utf-8?B?TjJicTRNNlM4SU1RaWdKc080TmovTXU5RUZnMVRFdmpSblZqT2lLdW9XWlox?=
 =?utf-8?B?N2loWndmYVEwd2czeGxYVmZzM2FRZlVqVE5zL1ZibzZMY0Y0ZVNDRTlOMU9M?=
 =?utf-8?B?YmlVemgzYU1BWUVycXZIWFdxV2tZYmpCQnRmbkpvU3JGRnhOdzlGbXVVU2FT?=
 =?utf-8?B?QXJlY2ZIMktJcE11eG13ZE1PdUlwbVRKUVlhbDZrWTVnVXA4RGZ4eVh5RGph?=
 =?utf-8?B?dzZNVlI0VVVvY3NKSXhnK1MyOEdBK0NRUUJiWGMvQnVnckl0M2JUbFh0bkcr?=
 =?utf-8?B?TmRvckd2NFRZZjZ3ZW1yYnp6cUk4NXV1YUNDcFZ5SWpUanJ6UGdMeWQ1Zm53?=
 =?utf-8?B?b0pJU29LNHpKMDFWbW5FeUE0eWpjbFdlQlVaL2hjckJVSjhFM09BZkZickth?=
 =?utf-8?B?V3FKaFZDWWVyeFI2b2VxN1RmYmRpOU5rcE8zNTJ4T05lZVZUeERrdVRyZmJl?=
 =?utf-8?B?WkJVMkdwWWJqRnV6VWFtQ0EySTlPNjJpckEvUFVJV01penBZaEpWTGE1YVNv?=
 =?utf-8?B?MzJFLzF6Nmg3WG1tTzUzU0FGaGVhaU9JNUJRSmIveGxvWk80Z3lMci9rQmVV?=
 =?utf-8?B?NUdFdTY4dlNwdVJOWDZHY2F2N1F2T056aEVkMDNlMEJKWHdzazZ1OWZUSTM1?=
 =?utf-8?B?cFBZNUxQWjZZS3h0cjdDSGFrc1N2UlB5RHdLRnRNWUxtT1dHWGE5NU45QTNj?=
 =?utf-8?B?OEVhd2tHK09nRzFBcmlxQ2hBQjd3cG1MYjMybUV3N1V2bHlETlFhS1gvSU96?=
 =?utf-8?B?bzVWN25yTDNaY0h0RjE5Vjdrb2Q2cFlTTTVLcFRSK2ZDZUxYcmlwYk9nY1ZW?=
 =?utf-8?B?dS90VWgzZDk3RHpBYnU1VkgyRjRNUmVvYlc2QkRUU0VYdVhNNDhBUWlVc2Fs?=
 =?utf-8?B?RFJlYjBNMU5lWmdVajNkUXJaOTRGLzIrMzdHTEZMQmF4dFdHUWxNYzVjWHlr?=
 =?utf-8?B?ZEw4SGR3dkQwcERDbGU2QlVieXlaWmRWWnZnQWZCMTg0aE0xWThaUUwvMHp5?=
 =?utf-8?B?SXVqbTB1b2dRUG9uYkdrdWFTbFJod2paYkJKYmtMd2lrbjF0V0pVLzZRbnlj?=
 =?utf-8?B?bnI2ZW1Nc21WektQd3Z0NkFpZkw2Q1NNV2dpcXAyK3IwY1k3RlRpZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5ED6B53DF06D7746A8EC2B09D6593DB7@namprd12.prod.outlook.com>
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
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5259.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffab0997-467b-4df2-231e-08df3ee171dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 04:16:50.8758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PCBIuBTTcisVQj8hJmVLEcnEOFQGnInPj3zudUV4jTyKaWxng9M3g8cnhXXsMBH9O7If4duL+W94b4kEtugPLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB460083

T24gTW9uLCAyMDI2LTExLTA5IGF0IDIzOjAwICswMTAwLCBEYXZpZCBIaWxkZW5icmFuZCAoQXJt
KSB3cm90ZToNCj4gT24gMTEvOS8yNiAyMDoxNSwgU2hpdmFuayBHYXJnIHdyb3RlOg0KPiA+IGNs
ZWFyX2NvbnRpZ19oaWdocGFnZXMoKSBjbGVhcnMgdGhlIHdob2xlIHJhbmdlIGF0IG9uY2UgdW5k
ZXINCj4gPiBwcmVlbXB0aWJsZSBtb2RlbHMuIE90aGVyd2lzZSBpdCBjbGVhcnMgUFJPQ0VTU19Q
QUdFU19OT05fUFJFRU1QVF9CQVRDSA0KPiA+IHBhZ2VzIGF0IGEgdGltZSwgd2l0aCBhIGNvbmRf
cmVzY2hlZCgpIGluIGJldHdlZW4uIFRoZSBiYXRjaCBpcyAzMk1CIGlmDQo+ID4gdGhlIGFyY2hp
dGVjdHVyZSBkZWZpbmVzIGNsZWFyX3BhZ2VzKCksIGFuZCBvbmUgcGFnZSBvdGhlcndpc2UuDQo+
ID4gDQo+ID4gU2luY2UgY29tbWl0IDdkYWRlYWE2ZTg1MSAoInNjaGVkOiBGdXJ0aGVyIHJlc3Ry
aWN0IHRoZSBwcmVlbXB0aW9uDQo+ID4gbW9kZXMiKSwgYXJjaGl0ZWN0dXJlcyB0aGF0IHN1cHBv
cnQgbGF6eSBwcmVlbXB0aW9uIG9ubHkgb2ZmZXIgdGhlDQo+ID4gZnVsbCwgbGF6eSBhbmQgUlQg
cHJlZW1wdGlvbiBtb2RlbHMsIGFsc28gd2l0aCBQUkVFTVBUX0RZTkFNSUMuIHg4NiBpcw0KPiA+
IG9uZSBvZiB0aGVtLCBhbmQgaXQgaXMgdGhlIG9ubHkgYXJjaGl0ZWN0dXJlIHRoYXQgZGVmaW5l
cw0KPiA+IGNsZWFyX3BhZ2VzKCkuIFNvIHRoZSAzMk1CIGJhdGNoIGlzIG5ldmVyIHVzZWQ6IHdo
ZW5ldmVyDQo+ID4gY2xlYXJfY29udGlnX2hpZ2hwYWdlcygpIHJ1bnMgdW5kZXIgYSBjb29wZXJh
dGl2ZSBtb2RlbCwgdGhlIGJhdGNoIGlzDQo+ID4gb25lIHBhZ2UuDQo+ID4gDQo+ID4gTWFrZSB0
aGF0IGV4cGxpY2l0LiBDbGVhciB0aGUgd2hvbGUgcmFuZ2Ugd2hlbiBDT05GSUdfUFJFRU1QVElP
TiBpcw0KPiA+IHNldCwgYW5kIG9uZSBwYWdlIGF0IGEgdGltZSB3aXRoIGNvbmRfcmVzY2hlZCgp
IGluIGJldHdlZW4gb3RoZXJ3aXNlLg0KPiA+IERyb3AgUFJPQ0VTU19QQUdFU19OT05fUFJFRU1Q
VF9CQVRDSCwgd2hpY2ggaGFzIG5vIG90aGVyIHVzZXJzLg0KPiA+IA0KPiA+IFBSRUVNUFRfRFlO
QU1JQyBrZXJuZWxzIGFsc28gaGF2ZSBDT05GSUdfUFJFRU1QVElPTiBzZXQsIGFuZA0KPiA+IGNv
bmRfcmVzY2hlZCgpIGRvZXMgbm90aGluZyBvbiBhbnkgb2YgdGhlc2Uga2VybmVscy4gU28gYSBi
dWlsZC10aW1lDQo+ID4gQ09ORklHX1BSRUVNUFRJT04gY2hlY2sgaXMgZW5vdWdoLCBhbmQgcHJl
ZW1wdF9tb2RlbF9wcmVlbXB0aWJsZSgpIGlzDQo+ID4gbm90IG5lZWRlZC4NCj4gPiANCj4gPiBO
byBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4NCj4gPiANCj4gPiBTdWdnZXN0ZWQtYnk6IERh
dmlkIEhpbGRlbmJyYW5kIDxkYXZpZEBrZXJuZWwub3JnPg0KPiA+IFJldmlld2VkLWJ5OiBQZWRy
byBGYWxjYXRvIDxwZmFsY2F0b0BzdXNlLmRlPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNoaXZhbmsg
R2FyZyA8c2hpdmFua2dAYW1kLmNvbT4NCj4gPiAtLS0NCj4gPiANCj4gDQo+IFRoYW5rcywgSSds
bCB3YWl0IGEgYml0IGZvciBtb3JlIHJldmlldyBiZWZvcmUgYXBwbHlpbmcuDQo+IA0KPiBSZXZp
ZXdlZC1ieTogRGF2aWQgSGlsZGVuYnJhbmQgKEFybSkgPGRhdmlkQGtlcm5lbC5vcmc+DQoNCg0K
VGhhbmtzLCBEYXZpZCwgZm9yIHRoZSByZXZpZXcuDQoNCk9uY2UgdGhpcyBpcyBmaW5hbCwgSSds
bCB3b3JrIG9uIHRoZSBuZXh0IHZlcnNpb24gb2YgdGhlIGJhdGNoIGNvcHkNCmluIGZvbGlvX21j
X2NvcHkoKSBbMV0uIDopDQoNClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tbS8y
MDI2MTAxOS1iYXRwYWdlY29weS12Mi0xLWQ3NWU3ZDBkZmFhZUBhbWQuY29tLw0KDQpSZWdhcmRz
LA0KU2hpdmFuaw0K
