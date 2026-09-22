Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazolkn19011029.outbound.protection.outlook.com [52.103.13.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344081E5018
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.13.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790038365; cv=fail; b=iVor/H6dhW6jN6/JO9Lo02GDj9ndbNNyHExd3f9OOo9Sh1hk2kQH6ccw9v9SzDhy5dmDTyn7292a9wLWaDdlthhHmsG7VBae4JXc/Sf1xrcdkZGa0GfH0c/6h668Rt/4b3A51ETjIJu5KbnHCitOAUCxiZGrKq/SRBCEBf9dDjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790038365; c=relaxed/simple;
	bh=QJMuBjIOisPMc9cKlhoQvasJoiMUNsrSlOGd4ilzx2Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Qqr0jWvMkwR3OfrNBpumNHsU2pLtgo9Wxh2B/CGXym0Iapm2UhkZDf52RLJwrxZyX1Q8a3/360JtZNCV7cIwVXnUQmXFWv2qExHFKGdRK8xx8sPQSmMoxbUXGB6PdWwKRFWn4B8cfhMDytAxeqohHrZ95rLzUhwAwlNYcQaYhQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=kqJEaIaq; arc=fail smtp.client-ip=52.103.13.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="kqJEaIaq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1Cr4QXkff41rdKVymnFd9YQVxKC7Ihdic9zkogzW7P+XDleStBNXsDKmcNgNqcKlaKKuMdpmYdg0klGq+WveW3z9eHKww+Qu9ceCRjmdjTvugPzhklW5sYOjYFUcT124yV0flxlexfZXarQBekxB2j/cFgN3WA7UtOYI/pvzPjAKQefc/QwJaQ6UDP1SYS+jCL3OuxbNMWfff5bfN/5UhPM+avZoweYtoHwFhi5yCcB7of8olyQxb83auw+ncCbAhIO+PR6DHtCoTjmf56Bs8AjzFB0ozdkPl3qd7j/jU54uji0ma8775kq5gWmH3Opp7vWmifZ59Ly8SjZFpSkMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJMuBjIOisPMc9cKlhoQvasJoiMUNsrSlOGd4ilzx2Y=;
 b=vyhNen+sXCQcEoJEnsx7Dvx4ur+nfGrOUvNVS/PHlWNvkQVQCb467C1idTA7FunvT8rxlTZC8xHsolQHesMcl0skvY+btIRxOOuICaKW/vQoD9EqLG8+/RXFRG+QjhJzLHUo/avyjxUVBccT/YmcY7v1JaB9VuMNUqIFMJpxrJvNP4P6eKPbpMVUL5XvT3aYgqRcuXbPcaIrwNavnI+uaSJWf7ny0PolTBPgKa7FhxXNuhFMub1+3/yM5UereG7xSfDfeUtnKQHiG4N+ooghkxydsMxO+YAuntxDyV24nM+SqWOeGkmCE8xWD73HVxvYfBS5AzJeqdJZmC1FO/waUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJMuBjIOisPMc9cKlhoQvasJoiMUNsrSlOGd4ilzx2Y=;
 b=kqJEaIaqNiMAaR4OKrmsIskzFOpdbl4aqixd5xWynW0Eh5CA+wJQ3pfNvLPwpJWtko9Xr0utcbdpnHMZXAsHaR5qfNUeHAKXls+8G6u8NPQcFURPGKhmzWs44BUj2BrWMJpGKOmB1ugmW3Ya37o8a4t7sACD9m9mzsLLwZG2PsVAbXOvRsn4VFMtg/Kj4hSdavYQqeprYtAu7BJEPx+rcKHyq860UD9CkHNbw+yGg1zpx+5vcCvKIZmKyz/DBbe8czR+paxFIS4m1fk+TrtEnl5ciLGONJptE4iqPL2CUFrjBsVOy7n2MD8Wubo6BXd47SU6hoeWDVIpfOtRiYVVnA==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by IA1PR02MB9133.namprd02.prod.outlook.com (2603:10b6:208:42f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 00:52:35 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6%5]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 00:52:35 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Haris Okanovic <harisokn@amazon.com>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>, Dmitry Ilvokhin <d@ilvokhin.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] genirq/proc: Fix missing CPU header in /proc/interrupts
Thread-Topic: [PATCH] genirq/proc: Fix missing CPU header in /proc/interrupts
Thread-Index: AQHdQhvpGao5W5OLOU2A51Dzq2STNLbZ1RXQ
Date: Tue, 22 Sep 2026 00:52:34 +0000
Message-ID:
 <SN6PR02MB415743EDDFEB5B52EF1DC698D4832@SN6PR02MB4157.namprd02.prod.outlook.com>
References:
 <20260911-dev-harisokn-proc-interrupts-fix-b4-v1-1-f9ff208efcfa@amazon.com>
In-Reply-To:
 <20260911-dev-harisokn-proc-interrupts-fix-b4-v1-1-f9ff208efcfa@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|IA1PR02MB9133:EE_
x-ms-office365-filtering-correlation-id: ba52c642-caf0-4ac8-6abe-08df1843ca93
x-ms-exchange-slblob-mailprops:
 5fu/r660v9Mj6U6kz+12O9pZy2TuKGHD/RpyJE5YJBcaRpiRrpwJ0s9NwsnSTXbyttQXmaN/OPBprvhevCtG4BxutwNvyLVhIgiytEIjlRz8VdzygQZHDP2Hd1a2F/k+JRLwr3EbHIfqp/TLcfHEp469lfbCLk8FMbuti1TFJg4UjbHLQUCtWOeEbJM4VUaCTcVSkChOFrJtsH+jWEcEAG3QIhEee0X+6iKWeAgtIWEWxFkajujCt8jClNFgaQ89KfgGrg7zT9EOZTa80y45XXsiBgs1HH+cRSuNdaY5uXofb5U61GXrDGZLfcaxlQa/fekPzN3yLdLbs4OpmbWM97vMgTYKwWL+mCJps+yozCqfL0GToAmc16xdErckRrfZu11KgmgI1nFHxoXqpp2QVO14n7a03jefYFdxKpZ6JMghFj2wntGgA6sHPiqWgBXCxrZ8M0TfCfxZuLqzKQtIec8ecGZWF4PewVcDaS3PwI7/C2veXS1afs9dEmzkb10BR8sAvn/iTv2ky/nb47W5mnX4ZorRIm5w0Kspp+BZAYuGr06QSBsOKX4k/Y4D3Y/qyn6IgKlwmws5lnYWEKnR0BvccETu6U8A1SOCMTjJANASF8UlkbMzHxWINgqiQTAh54ltQumF5Hks6P4rfflUvMAiwo4yBaLr35lnt7c0yu6CCEzhaY8GaMjCxTSbeVfkSagvKZVdOho2TSiKddt0eDuHvOUWUWpayCs8ZWpjbkw=
x-microsoft-antispam:
 BCL:0;ARA:14566002|25010399006|8060799015|8062599012|19110799012|51005399006|37011999003|13091999003|15080799012|24021099003|41001999006|21061999006|55001999006|31061999003|2604032031799003|3412199025|440099028|102099032|40105399003|2607281247196008;
x-microsoft-antispam-message-info:
 =?utf-8?B?SnFsTy80QURITmduMUZDL2dTUE1hbmFObS84NUpnOUZIMEw3Q1hLT0JjWDQ0?=
 =?utf-8?B?c0tYQXVMdHVlRlJxZFVYUTdwK0dCMU1GVWNFNU9LMzhydWpHMTFrSmE3S1ZC?=
 =?utf-8?B?VWU4Rnl6V3hpVnhidWxXalRqZFpiWkZmSHl1SUVZOHZNQ2EvZVBYQUx5clBy?=
 =?utf-8?B?UUt4L0NONlEwV05sdTJHOCtVWjlNVWdGZGwwSkRkRFZlb1NHMzUzQktKNktm?=
 =?utf-8?B?ZlNiK1hJNmg5L2t6OHZHaCt1SmhUanRPQjRCMDlUcHNxMk1aK3lrVCtwekxB?=
 =?utf-8?B?V0ZYUm1lODgyL1kvelZETlQ5Tm9ncTlmb2dTcnlzb2xIbjZXZXlpVE83UEdm?=
 =?utf-8?B?RGVzWXYxdGNYb05rTXd5c2Y0MStRdjQwbk8vMEJlZ01wWHpERjZUamljc3pJ?=
 =?utf-8?B?U0Z1NXJsOGwvRVBDWDZZdXJvWVpnRGRFRUVTU0lLMmxEbDg5b0VhU3EvYU5S?=
 =?utf-8?B?Wm5DNGJYdTl0L3lLYk1Fb2lraW0zVmJPeDl2UWZpQ0lGUGF3L0lySFZmRURz?=
 =?utf-8?B?cnF0alZabkx2YVl6ZXZGVkdKL3BDTmQ1VndxMHB3a0E5WmljR09sS0gwek8w?=
 =?utf-8?B?RFBIUzhURDFVMmVXUXh5OXd5akpkOW1udEExeE95WVJ3bTh1MWY2U25EWFF6?=
 =?utf-8?B?Sm8zOFg0aENwODVqUlh4UTRMZnlPWUdkcDFtcXVhWG1QeDhWTEVybUg0VzhV?=
 =?utf-8?B?MUNsU1FwR1lQOVpOREI2WHFIRWtGOFpSekJ3djhmT0YxWExpazRZbkp0MFFY?=
 =?utf-8?B?TkFvc3RhZE5YQkJSZk5vWXlzNjMwYm55ektJY2lRdDBwYThaTlBHR3ErN1ln?=
 =?utf-8?B?ekhQc08vWVE1dkxvMllqcWRNaEVPaVMxTk9pWHJPdVE4dlg0Vk9mUlJPaGd5?=
 =?utf-8?B?MlY2aFltUkIxVE0xd1hzNFZJS21RSVZIUXk4SjlHM0NGSkduTWtZNEk2dXJn?=
 =?utf-8?B?cmZ1NEVod25OZ1FDcGNRR3p3SEZBSWZka0d3TGlld0ErK2dxTmRpVVhwYjBN?=
 =?utf-8?B?TkdhbEQ3Q2ZadllRVTA4cUtvS3NNREJFeGRTbmc2R3JPc2hDUW55Mm00NWpk?=
 =?utf-8?B?SGVuaVBCVFpCZlUwM0VjMExobHdzZzloeml4dkdXVWp4N09USE9yTHdCRjZp?=
 =?utf-8?B?ODAxcVlXSWM5aTJPWEYrY05EaG5jZlpuT1F2d05WSGRnYTFldGg5U1ZrZkJC?=
 =?utf-8?B?eVlyL0tReDVvaHVCWHRqbkpuMFZvYTltOXhWMDVUZmtxTStDaS9HZWF6bXNW?=
 =?utf-8?B?RnhXQytkRWxIM3pGVGV4YkNGZEgxUjdkQkdsV2ZsNE5OWGh1Z3JSdDgyeVho?=
 =?utf-8?B?ekhMdDY4RUp0QW5kRjJUNmZmK21ET1dCaFJTeEluWUFMd2NuMVMvc01HdmlZ?=
 =?utf-8?B?QUFwRXNQVTZHbVVBYVF4anJPeXlLYzRQVmdyK3N1TWZ4Mis3VVNpQWFnRy9Q?=
 =?utf-8?B?K3lsSkMrL1VrdzVQR0NHaU12R2lZUmNzNzZOdDZVZ1YxOVNacndRaVovNWNq?=
 =?utf-8?B?UDdUQWJUZHdkbVo1ZXNIV2tqcnFxeEVVTlFLdzBXMklMNW1BMXUzamgyQUp5?=
 =?utf-8?B?d3NtZz09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YWgvSDNlQUJoZTNtQklwaEF2SjBrZGxuM3hSM3BkSzBjQVpEbkhEMjdIWUp5?=
 =?utf-8?B?eTJ3dUZyYmpBMnl1cFVSQ0cxZVJrd3k2bG1xQk52d2gydHFDN29TaWhpODRx?=
 =?utf-8?B?aUlTWTdwTjVSa2FsbUlCNzVNYWRWMzVDSHBKaFRPeXFPUjNHQWIyMWViTEFV?=
 =?utf-8?B?bmJVV01jWXM1ZVB2bWFlMExjYzdrOTBZMVF0dnNpN0RtZHZObytEQ3pHNFQ4?=
 =?utf-8?B?VVhRREt0WVNFYWc0dlF5bCt3aHBDd0VCMXVOT0lYZUg0MW1CVnk2aGhjY1l2?=
 =?utf-8?B?eklad29TQWFPVTgwbHpxL3VQVkduOFJpdkgzL1JEYklFcUgwTXNlRjQvNXNY?=
 =?utf-8?B?eGU2ZHdDeXczZHFSZitiRTZRQjlubituRWN2Nkozbm5JMFdLSzk0UEkvNXNO?=
 =?utf-8?B?ZFZQZ2VZdU9yQXBUeWp0QnhlTENzdFRQZUZFOHZpamFqdWRSdkMrYktoV1cw?=
 =?utf-8?B?Z1NQcVA3Q3FxNnRQeVU4RWVOVkN2NUFQVXdxbnlTdmtaRFUzdStzbGNwbXVj?=
 =?utf-8?B?SXVhUE15VG9PbjU5OHVQa3hmMFBCbnoxbWpDZzJKTVNuZGozRElLVmhqazJt?=
 =?utf-8?B?NHE1Q3cvVUFUVytlYmNKR2JwUm1qeUpHV3ZRRWFIZFQ2TU02ajhwcVVmdkJa?=
 =?utf-8?B?SnBtWmpWei9TK09DNFB2VlgwTndJTm00cjRzeW5lVmtLZ1BpbmhpbHlLRzVk?=
 =?utf-8?B?UG9lb0JhbnU5aERYZlRpNnVQK2ljclJIcDJ0L3RrcStIZzNHcFJadElReEhq?=
 =?utf-8?B?Vlc0WEVENjRlVVB0c2VOWHIwQXcvc2lyeEFPcUVzSnAybTF5RjU1UjVQVE5h?=
 =?utf-8?B?QjVmSVhXSVdkV0RXNTNWZFo4U091VkNzZDlXYnU3YldzYXcwNEgvRlpxUTJT?=
 =?utf-8?B?RSszYU1YMHZIQVhQYjJBa0E3UXV4dVQ0RGZ0Q3VXQXhWcFdqY1VtazYyWEZ1?=
 =?utf-8?B?NGVGMWx4ViswcUdXcVkvS2tUZkxmYndrWjNhMWFvUjh3ZGhEL0xYUDlnancy?=
 =?utf-8?B?NjkweXE4MzFDSUtjQjJhcHZORlNHSjEzZWlmamI4a3dTem05bTd0KzZhNE5P?=
 =?utf-8?B?eGVUSlVvN2JPeUthTER1TEY4bUVUVGp1c2p3RlliM0hYRUdvNjFRVncwS0c5?=
 =?utf-8?B?Zzd3M3V1V0xBN3JVeU80aHArdnZLUXZITHRUWGN1U0JvS1VQVGlDbWJUWE1j?=
 =?utf-8?B?QUVtek8wQ0YxcUdhdncyZ04yNWxhY3NjdFd0NWtPNlExTUFWNDZiM0V3VTly?=
 =?utf-8?B?aXRCWFFJNjdEMU1PQTdwT1BoUTN5MHpNZGZzOEZVbzNaZkVDWVJFbm1pOTNl?=
 =?utf-8?B?MEtCb1d4YXFvUVlTV2d1ZTl3a0FKMDYwbUdzKzl5T2I0YXRjWlBGQkIvbFFB?=
 =?utf-8?B?V3B1YUgzRm1NRE1QdndxSXhOTTVXOEJUL1Y0cm9lQzJoeERidzRpbXFzbEJN?=
 =?utf-8?B?MWFNUk16T29JY2grQU94aUdBOG1NeHlCK0FlV09ZMGRCMm1jWHROOVJOa3NW?=
 =?utf-8?B?UjJpdE1kZVJvdE1SUDdFdmNwUHNPQktYN25SczhoZVBaaVNiWWNkR29oMmk0?=
 =?utf-8?B?NTZQVVZDYS9HR21kMDNza3ZRU2I0TFlzcG5hQXZ5Q0hDa1FmeFZKMVFqQXpP?=
 =?utf-8?B?MzhWMU9uby91QXNBR0xFSFVFV1JEQWVYaiswOVY2OXdnVEduZ1hhcHVVZ1hu?=
 =?utf-8?B?TGZxS21CcmNiVU5KSmVqMlFkaml0T24rdTMyMzBMelQrVHdIaFd3WERzeEQr?=
 =?utf-8?B?RVY4M3owaVIzS3YwZmZzQ3dLYUdTK0Znc3pVckczckhkRzRuOU5VckIxeXBY?=
 =?utf-8?Q?yBJ38+12ubzt+a48vnFXHKKHeSvnKqM+Ij7SU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ba52c642-caf0-4ac8-6abe-08df1843ca93
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 00:52:35.0398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR02MB9133

RnJvbTogSGFyaXMgT2thbm92aWMgPGhhcmlzb2tuQGFtYXpvbi5jb20+IFNlbnQ6IEZyaWRheSwg
U2VwdGVtYmVyIDExLCAyMDI2IDExOjMyIEFNDQo+IA0KPiBpcnFfc2VxX3Nob3coKSBtdXN0IGJl
IGlkZW1wb3RlbnQgc2luY2UgaXQgbWF5IGJlIGNhbGxlZCBtdWx0aXBsZSB0aW1lcw0KPiB0byBy
ZW5kZXIgdGhlIHNhbWUgcmVjb3JkLCBlLmcuIHdoZW4gc2VxX2ZpbGUncyBidWZmZXIgaXMgZXhj
ZWVkZWQuIEl0DQo+IGVtaXRzIHRoZSBDUFUgaGVhZGVyIGJlaGluZCB0aGUgb25lLXNob3QgcHJp
bnRfaGVhZGVyIGZsYWcsIHdoaWNoIHRoZQ0KPiBmaXJzdCBwYXNzIGNsZWFycywgc28gdGhlIGhl
YWRlciBpcyBsb3N0IHdpdGggdGhlIGRpc2NhcmRlZCBidWZmZXIuDQo+IA0KPiBUaGlzIGNhbiBi
ZSBzZWVuIG9uIGxhcmdlIHN5c3RlbXMsIHN1Y2ggYXMgOGcuNDh4bCAoMTkyIENQVXMpIGFuZA0K
PiA4aS45NnhsICgzODQgQ1BVcykgQVdTIGluc3RhbmNlIHR5cGVzOg0KPiANCj4gICAkIGhlYWQg
LTEgL3Byb2MvaW50ZXJydXB0cw0KPiAgICAgIDk6ICAgICAgICAgIDAgICAgICAgICAgMCAuLi4g
IDAgIEdJQ3YzICAyNSBMZXZlbCAgdmdpYw0KPiANCj4gUmVwbGFjZSBwcmludF9oZWFkZXIgd2l0
aCB0aGUgcG9zaXRpb24gb2YgdGhlIGZpcnN0IHJlY29yZCBhbmQgaW5jbHVkZQ0KPiB0aGUgaGVh
ZGVyIHdoZW5ldmVyIHRoYXQgcmVjb3JkIGlzIGVtaXR0ZWQuDQo+IA0KPiBGaXhlczogMTcxY2Mw
ZDllZWQxICgiZ2VuaXJxL3Byb2M6IFNwZWVkIHVwIC9wcm9jL2ludGVycnVwdHMgaXRlcmF0aW9u
IikNCj4gU2lnbmVkLW9mZi1ieTogSGFyaXMgT2thbm92aWMgPGhhcmlzb2tuQGFtYXpvbi5jb20+
DQo+IC0tLQ0KPiAga2VybmVsL2lycS9wcm9jLmMgfCAyNCArKysrKysrKysrKysrKysrKy0tLS0t
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9pcnEvcHJvYy5jIGIva2VybmVsL2lycS9wcm9jLmMN
Cj4gaW5kZXggMWI4MzU3MjVmN2IxYy4uMGMwZGYxNmRlNTgxNiAxMDA2NDQNCj4gLS0tIGEva2Vy
bmVsL2lycS9wcm9jLmMNCj4gKysrIGIva2VybmVsL2lycS9wcm9jLmMNCj4gQEAgLTQ2Miw3ICs0
NjIsNyBAQCBpbnQgX193ZWFrIGFyY2hfc2hvd19pbnRlcnJ1cHRzKHN0cnVjdCBzZXFfZmlsZSAq
cCwgaW50IHByZWMpDQo+ICBzdGF0aWMgREVGSU5FX1JBV19TUElOTE9DSyhpcnFfcHJvY19jb25z
dHJhaW50c19sb2NrKTsNCj4gDQo+ICBzdGF0aWMgc3RydWN0IGlycV9wcm9jX2NvbnN0cmFpbnRz
IHsNCj4gLQlib29sCQlwcmludF9oZWFkZXI7DQo+ICsJbG9mZl90CQlmaXJzdF9wb3M7DQo+ICAJ
dW5zaWduZWQgaW50CW51bV9wcmVjOw0KPiAgCXVuc2lnbmVkIGludAljaGlwX3dpZHRoOw0KPiAg
fSBpcnFfcHJvY19jb25zdHJhaW50cyBfX3JlYWRfbW9zdGx5ID0gew0KPiBAQCAtNTQzLDE0ICs1
NDMsMTMgQEAgc3RhdGljIGludCBpcnFfc2VxX3Nob3coc3RydWN0IHNlcV9maWxlICpwLCB2b2lk
ICp2KQ0KPiAgCXN0cnVjdCBpcnFhY3Rpb24gKmFjdGlvbjsNCj4gDQo+ICAJLyogUHJpbnQgaGVh
ZGVyIGZvciB0aGUgZmlyc3QgaW50ZXJydXB0PyAqLw0KPiAtCWlmIChjb25zdHItPnByaW50X2hl
YWRlcikgew0KPiArCWlmIChwLT5pbmRleCA9PSBjb25zdHItPmZpcnN0X3Bvcykgew0KPiAgCQl1
bnNpZ25lZCBpbnQgY3B1Ow0KPiANCj4gIAkJc2VxX3ByaW50ZihwLCAiJSpzIiwgY29uc3RyLT5u
dW1fcHJlYyArIDgsICIiKTsNCj4gIAkJZm9yX2VhY2hfb25saW5lX2NwdShjcHUpDQo+ICAJCQlz
ZXFfcHJpbnRmKHAsICJDUFUlLThkIiwgY3B1KTsNCj4gIAkJc2VxX3B1dGMocCwgJ1xuJyk7DQo+
IC0JCWNvbnN0ci0+cHJpbnRfaGVhZGVyID0gZmFsc2U7DQo+ICAJfQ0KPiANCj4gIAlpZiAoZGVz
YyA9PSBBUkNIX1BST0NfSVJRREVTQykNCj4gQEAgLTYzNSwxNCArNjM0LDI1IEBAIHN0YXRpYyB2
b2lkICppcnFfc2VxX25leHRfZGVzYyhsb2ZmX3QgKnBvcykNCj4gDQo+ICBzdGF0aWMgdm9pZCAq
aXJxX3NlcV9zdGFydChzdHJ1Y3Qgc2VxX2ZpbGUgKmYsIGxvZmZfdCAqcG9zKQ0KPiAgew0KPiAt
CWlmICghKnBvcykgew0KPiAtCQlzdHJ1Y3QgaXJxX3Byb2NfY29uc3RyYWludHMgKmNvbnN0ciA9
IGYtPnByaXZhdGU7DQo+ICsJc3RydWN0IGlycV9wcm9jX2NvbnN0cmFpbnRzICpjb25zdHIgPSBm
LT5wcml2YXRlOw0KPiArCWJvb2wgZmlyc3QgPSAhKnBvczsNCj4gKwl2b2lkICpyZXQ7DQo+IA0K
PiArCWlmIChmaXJzdCkgew0KPiAgCQljb25zdHItPm51bV9wcmVjID0gUkVBRF9PTkNFKGlycV9w
cm9jX2NvbnN0cmFpbnRzLm51bV9wcmVjKTsNCj4gIAkJY29uc3RyLT5jaGlwX3dpZHRoID0gUkVB
RF9PTkNFKGlycV9wcm9jX2NvbnN0cmFpbnRzLmNoaXBfd2lkdGgpOw0KPiAtCQljb25zdHItPnBy
aW50X2hlYWRlciA9IHRydWU7DQo+ICAJfQ0KPiAtCXJldHVybiBpcnFfc2VxX25leHRfZGVzYyhw
b3MpOw0KPiArDQo+ICsJcmV0ID0gaXJxX3NlcV9uZXh0X2Rlc2MocG9zKTsNCj4gKw0KPiArCS8q
DQo+ICsJICogUmVjb3JkIHBvc2l0aW9uIG9mIHRoZSBmaXJzdCBvdXRwdXQgcmVjb3JkIHNvIHRo
YXQgaXJxX3NlcV9zaG93KCkNCj4gKwkgKiBrbm93cyB3aGVyZSB0byB3cml0ZSB0aGUgaGVhZGVy
Lg0KPiArCSAqLw0KPiArCWlmIChmaXJzdCkNCj4gKwkJY29uc3RyLT5maXJzdF9wb3MgPSAqcG9z
Ow0KPiArDQo+ICsJcmV0dXJuIHJldDsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgdm9pZCAqaXJxX3Nl
cV9uZXh0KHN0cnVjdCBzZXFfZmlsZSAqZiwgdm9pZCAqdiwgbG9mZl90ICpwb3MpDQo+IA0KDQpJ
IHRlc3RlZCB0aGlzIHBhdGNoIGluIGFuIEF6dXJlIHg4Ni94NjQgVk0gd2l0aCA0MTYgQ1BVcy4g
VGhlICJDUFUiDQpoZWFkZXIgbGluZSBpcyBtaXNzaW5nIHdpdGhvdXQgdGhlIHBhdGNoLCBhbmQg
aXQgYXBwZWFycyB3aGVuIHRoZQ0KcGF0Y2ggaXMgYXBwbGllZC4gSSB2ZXJpZmllZCB0aGF0IHRo
ZSA0MTYgIkNQVTxubm4+IiBjb2x1bW4gbGFiZWxzDQphcmUgY29ycmVjdGx5IHNob3duLg0KDQpJ
IGhhdmUgbm90IHJldmlld2VkIHRoZSBjb2RlLg0KDQpUZXN0ZWQtYnk6IE1pY2hhZWwgS2VsbGV5
IDxtaGtsaW51eEBvdXRsb29rLmNvbT4NCg==
