Received: from WA1P291CU004.outbound.protection.outlook.com (mail-polandcentralazolkn19010000.outbound.protection.outlook.com [52.103.53.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA0D45C6F8
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 20:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791317586; cv=fail; b=G7TM4C779cb6wAtEa3WseQKu08A0rfXvVyazOtBQsodrCLOr2icLopgYtIgNdlwqsCEXi3m+Nt12uKLVqEdFb4F0KWe5NBSfFw9vLI031V4BYQxWFWQTapjR03i8j7gY39uB0iPJZ1EdIh+kFPtoKxC+1cAExd5UAmMKJT85eyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791317586; c=relaxed/simple;
	bh=cb4/50vujUmn2rDLHNSgqhV+jjm9lr/J0Gjrk3G3ED4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kkTGJViVORHwQKcrHjEEr0PoabVF5y9OhXcvkIoJtp9n742hE3CFOWjw/RXbNrypuJGfOJY19hW0xaqZB8zGkgGmImBpUxyqlsEXjgvjedsZqkiTYk8sb03d8Y3Otk0kz7MDvxdRhYZsQAl889APEZe6hGHqW2D5H8U3t8KEV5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=um0OgOVK; arc=fail smtp.client-ip=52.103.53.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="um0OgOVK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=reEZ/OVh1b+unwcsSJQdJTeKlKZkl619iT0tVzovgyXUGmWasEsLX7CRcqkuf5rFz+u2AryIBenjlfNkPtad0XL3RJpV0sFhOwFbnMP2TuZskiCawW2Vg9y6Rne+9GotVGf1JuJMcieWuuCEyQeVYX6ucEdfFTsKSicFyj1Iyx7lKTr4Bl8P8ZMEOKwkyOBd8O69uPNwd8r5QPwkTvHOA1Z6W4UqSLE5P0eRnEpGtfyaBZVYHJ/FNfNuesbk5W9FxbsntdY+x5eVdNAfu+dB85FoS//vpytGCHbjrnSXmULgytj6xufdl49ZB5az+aeVG2JJmVZXwju/5vrWcD2F/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cb4/50vujUmn2rDLHNSgqhV+jjm9lr/J0Gjrk3G3ED4=;
 b=evXH8HOeZq46rM4u26s9Dj2TK1V33lldH9xDQMp8ACXApi7UhIxnDzxpYvwdCnMDPPIc+hriN2J7hJgKIOy+NMabrKdOYbQFYHGsmBkb31cghpnfJrSNa58tUO7+1+hiTwf4iETI3Z5pQxxJA3PL3v3CiSyLWNLwBiDBah9lCk7I0CTTAKlSB3jJoAuRD30JCuQtaAqybANNPxxTxhSwdC9vVNMz9/+t9LSU+JyHq81y2+cyKvYdmWKsHbJ2c5VzU8Vu8CEvwaDiJu/fLXJ+Ihj4D0l11XQ1d4eVp5ImQKj6SbaaNJnFyPYG8OjU6Rgeib77/KUyL+6VUOv2OMJsMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cb4/50vujUmn2rDLHNSgqhV+jjm9lr/J0Gjrk3G3ED4=;
 b=um0OgOVK9E7im34MJAlWRWhR49YKIb4T+ryNUZULl5l5fBdJzjDLaFZmP7L1EOYBtVeuABOv2mvcte8YhCVz/B06JyNwna6fgojQj8uyRjIvLjoXBu8c8UiJp0Tyump3Gg4x7lED2SUo2a2+icJbPfzaeO+/A/PFCsLs2Oj+z3H+rCAhwsLVsBz78WoQfVsoFfXxKain1rrGXZTwSh9C8In+qndP1F7cRTLjQ4hPFK7+73yvvc3xOarbT/FgIefAzRPwjm3vc+3CYAfYMTBMVCMyng9Qrxgu3pNomkfUKeM8SryUJ/O511LJl5+GYMJGau7KdG8Ru7gvdbrnk8bIrw==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA0P291MB0031.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:b::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.15; Tue, 6 Oct 2026 20:12:59 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 20:12:59 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: Thorsten Blum <blum@kernel.org>
CC: Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin"
	<hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
Subject: Re: [PATCH v2 0/2] x86/vdso: Replace deprecated simple_strtoul() with
 kstrtouint()
Thread-Topic: [PATCH v2 0/2] x86/vdso: Replace deprecated simple_strtoul()
 with kstrtouint()
Thread-Index: AQHdVc8V1Nc0mRjprU+gP+GgthnFzA==
Date: Tue, 6 Oct 2026 20:12:59 +0000
Message-ID: <20261006201255.598040-1-habilerenturker@hotmail.com>
References: <asPZRBSZy9jf06As@kernel.org>
In-Reply-To: <asPZRBSZy9jf06As@kernel.org>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA0P291MB0031:EE_
x-ms-office365-filtering-correlation-id: aa94cc05-7a89-4ee4-41bd-08df23e637d2
x-microsoft-antispam:
 BCL:0;ARA:14566002|4140399003|38102599003|31061999003|15080799012|25010399006|55001999006|19110799012|24021099003|8060799015|8062599012|51005399006|102099032|440099028|3412199025|40105399003|2607281247196008|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?QzkySUJKRE10a2RKRmlVck01UjVtbTdocEhSbmpBSHByekE0MThzZ1M2VzFa?=
 =?utf-8?B?MEpEOWtMNEoydUM5TjV0Q1ErVjl4b0srOE9FN2ZCNzM5cHZPc3MxR0R3QkEy?=
 =?utf-8?B?aE1XbU12UzVzSFhKUFh6N1ZqQk9NOGcyU2plQjJNdVR0MWQ3ZnY3SDNEc1Q5?=
 =?utf-8?B?bXlBZjlBY0FhWjRTU3daNHFlUFREb3c2cG5Vd2JXRHBWZWpXWUhEYU52MGlM?=
 =?utf-8?B?Y0RsN1ZIdlZkSHZWMG9menc5alcwYU5UZHk2Qnp5aTA0cXhrclVCOEVFbnkz?=
 =?utf-8?B?NEZ5VjQ5ZjFRM0xyNG94SThCRHd4bCsrYVNXT3J2cXJlSDRXQ3pvWjY3NDlM?=
 =?utf-8?B?MlMzRVh3M1diSXVmSTJJVHZYcnlaWlpMdGllTEljMXIzallUeXZ5Vm9QZTd6?=
 =?utf-8?B?WktjS0MxV0I0Nm1hY3dxMDBhOWJaY0hma2VLbkMvSlg5Um5Rc29zNEpiQ1E4?=
 =?utf-8?B?R1RCTlR5TlVneVIxQm0wNG9jdEpmRDFFOTd2cFB3QVhCSjltQ1dteVkwd08z?=
 =?utf-8?B?eVhoL3kvT0dTK3gwVGZkWVdhVzNaOHFFWFFtNE5seHVWU1RIM1FiMEg3dk5M?=
 =?utf-8?B?ODZpbVd5bG5Nc1VXL2JNYTZQSU56VDVXQXdzQ2FpNDd2M2FJYlMzVWVtY1pa?=
 =?utf-8?B?OGMxQldqc0hSYjhRQzJJNVh1dlNHMEw2amJsY1RiaTJnNm1HRmZCS0FEbmdN?=
 =?utf-8?B?S1EyeG11Q2NraFppNFpKdllybDZkNjJsYkRDODVIa3g5eXFQd0lDazM3MjFR?=
 =?utf-8?B?Y3FidkxTRWdZRDgxSGtOWHpHZUgrZXBIbjgxb3BKSHFrSjYwbW1TaXpudnVL?=
 =?utf-8?B?bzVCNThqYjhHenZHNXZrUzVlL1VDd1FGU1Rtd3FRNnFRakZWRDduTFV0cUFu?=
 =?utf-8?B?VlQ3eVZFTFpsaWpXQWIvZGVuNG9RNHRvaVUzaUpCYS8vUjdPeHJDRkZGOStZ?=
 =?utf-8?B?MGtJclRGbW92K3dWcVZaRklGd3JqMTFHaWYxbS9qWEZuZWd0V2h6ZHBDeEZV?=
 =?utf-8?B?S1VrODUrdTdFUmY3WGh5NEFWSmFJaUo5bjU1aFBpNUd5UTlvZmdTbDkxQlFE?=
 =?utf-8?B?aVZDS1dWYWNNVE5ucER5VWNBL3h2cjU4VUhTR1ZNZWdBSG85MExYZ2tiL2dz?=
 =?utf-8?B?Wk9rZDcvL3VGSnNaOTBqSi83S2pCUU5iZVdSbFkyWjlCMWxGZGo5WDgrQ0pU?=
 =?utf-8?B?TzJyV2dGOUZpZ0wrNmYxZXNud1dMcENHVllqK1lnd1NyY081WnBjdU42dlVF?=
 =?utf-8?B?YzQvMVJycUdOblJSS0dRalp1ZGlkOTVIYkNlK1F5dlFUNTQ1VUpFRE16Z3gz?=
 =?utf-8?B?U1REbzdCSWZPN0YzN1g1ZlJrMXVSZy9uY01uMlZsMm8zQWZHOFFiRjJ3RGxn?=
 =?utf-8?B?TmlyTCsrM00rdkE9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RGFjQ01WYlNGYXRxQ0orSXR1ODlPRTlEaklrT0tHdW9EYWlyU2dWNkxJbEd5?=
 =?utf-8?B?VVBNaEZmWU9iRUxzM0FTaGJkeCtyUlNmM3l4ZnlYYkRtWWkrTjVkanpKcnV4?=
 =?utf-8?B?WFFmSHU1UjNkenFWUURVOWppakR2ejJncEVubGtMamRxVWticUYxZ3BLYkFI?=
 =?utf-8?B?c2xCNmJMMU5ZODZ4c2dHU1pPT0Y3TU9hVFZNMWJLSEJ1YzhqWkduMUt1NDl3?=
 =?utf-8?B?VXJsdWUydmx0Mno0MjZJWU93dWg2VkNBTXo2ZXNkTFVENzM5WmFBb09lRnZp?=
 =?utf-8?B?SGQ5WHdUcTUyNmVzQis1RUdvUTArTEdPSWtjTU9od2xlVVYyT3FSdVNvZ0dD?=
 =?utf-8?B?cm4rL1B1NjdxRjBKQUlvSnRoYTFiV2R5QWZScjBQbnY4NWdtSGYrUXpqVXBi?=
 =?utf-8?B?UWRtdldybTRUQlI4S2piUGtFMm1FcmtNRUZmVy9SV1E3VmdVMjNETEhMbjNZ?=
 =?utf-8?B?WityMDVpR1pCWDJ4QStFT3BtN1NOQitiNEN0aVN5emJyU1BCTjBGUG55dFp6?=
 =?utf-8?B?LzFMb0tYMFF3V0wzSUdueG5FVGd0Vzl4UXU0em1CeVZ2dGs4ZmVpMm5UekRi?=
 =?utf-8?B?czNxTTJ0eTM5UWJ6a01ITTZyOXlJZHgrQXd4TkMvbGZmV0pPdThlc1BSeVZK?=
 =?utf-8?B?RWJBR01VTkkyYmVBS3F0MHNSSW5rc2JkREVPbkhsc2NuVlFGMU9Ud0dpMG1w?=
 =?utf-8?B?aUFqU1pGVnR1YW10cXJobG1DcVNqd0tTSkIvcFZpdkxjVW9XaVFqbTVzbXNp?=
 =?utf-8?B?eENTdm1CNzJzc0xPMzFBU25SeHp3V2szMFNhdG5JUE1RVTgvSVBydXZycVJu?=
 =?utf-8?B?ZzRhcXpaNXBpc2hZbnJuMjBBM3IvcnVzK0VPVGF4WklqQzZRTlNpcGV3MW1E?=
 =?utf-8?B?blZQN0FUNU5JeFk1YmJHcjlUcWw1YXozWEdjL2prM1UwejZXN0oxVU8vMU9N?=
 =?utf-8?B?bHhsc050cXZieUdhVmo4T1RKUUJRTkwrT2kvTVRTQjQwbkErdTluSDluM1RY?=
 =?utf-8?B?SnZhNGR3dWZzS2ZrZVBMbktHMS9xQklZczdmdXlBV05LSnl1aTFFdGJGZUIx?=
 =?utf-8?B?YVhzUkM1S0JINWlZZTBTRzdNRlpISDZsK29OOEtvQlIvZm5LeTc1Q012NEJo?=
 =?utf-8?B?TGhqV1hiS3gwZ0ZaMmM1K0dkRi85aWo0ZXJjbCtMS0g2Z3VOWjlVd2NidUIv?=
 =?utf-8?B?NUphT0tNRlhsSm1MT3pPUHRvOCtJKzl1NUhGdFFTQ0o3NExrdHMvTlpldTM2?=
 =?utf-8?B?eEF5cFlFcmdLVktBWW9SWGNJdjZJQy9ucGFsSlh6MEl5cU44QmpacDRNNGNY?=
 =?utf-8?B?d2lGVW81MXFWaUtWUmNEaFp1WW52cG1mNVFjclU0YllMQUo2dEEzS1duSWdS?=
 =?utf-8?B?NGVMajZ3Rk5CMmt6SFZWeFl4bEZZVENXVDhha2xsK1hsQUxJbVpvKzN0a3Zr?=
 =?utf-8?B?VFFmNnIwNWpzdWQyOXRYdmQvWjVobDRVQ0JLL2pCNU5LS1ZJako0V1BIMlhI?=
 =?utf-8?B?UDZaRm10Wmd6NEIwd1l1SXhnbkhRT09obWRCaW9IRW1LcnJ4ZU5sc3UrUEZS?=
 =?utf-8?B?WkY2TjdFYmxEU3Fmd1ZBc1pCTmpvWEFqZ0pmckd2L2t3STB3eFVSZnZmS2pS?=
 =?utf-8?B?OW10Z1dpeDNrZ09DVDdvNDlLRmU2OHRJSk5HbDFHUW9yTVRzT0VvTXJ0OHJt?=
 =?utf-8?B?UjM1bFg4K1Z4STVtQzlnalBweGQ4eUtFN3FjUzhxNEZqSmtBY3MzYU84MnJP?=
 =?utf-8?B?OWZIMytUTTlUTGtGT3pyQllTVjUrdDB5UkwwU2NZOTdFMm5idFY2VWdoTGM1?=
 =?utf-8?B?dy9QZURaNlB3ZlNIQ0ZrN0luamd2Z21RZlN6SzBRZzcwMWZUTFdRZzd1UnhP?=
 =?utf-8?Q?qhqtQ+Hbi9qF6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC84144FC43E3D48ADCCDAD3C095835C@POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-2112e.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: aa94cc05-7a89-4ee4-41bd-08df23e637d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2026 20:12:59.5247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA0P291MB0031

PiBJIHN1Ym1pdHRlZCBhIHZlcnkgc2ltaWxhciBzZXJpZXMgYSB3aGlsZSBhZ28gWzFdLCBidXQg
aGF2ZW4ndCByZWNlaXZlZAo+IGZlZWRiYWNrIHlldCAoYmVzaWRlcyBhIFJldmlld2VkLWJ5IGZy
b20gUmFuZHkgb24gdGhlIGRvY3VtZW50YXRpb24KPiBjaGFuZ2UpLgoKSGkgVGhvcnN0ZW4sCgpZ
b3UgYXJlIHJpZ2h0LCBhbmQgdGhhbmsgeW91IGZvciBwb2ludGluZyB0aGlzIG91dC4gTXkgc2Vy
aWVzIGlzIGVzc2VudGlhbGx5CmEgZHVwbGljYXRlIG9mIHlvdXJzLiBZb3VyIHNlcmllcyBjYW1l
IGZpcnN0LgoKSSB3aWxsIHdpdGhkcmF3IG15IHYyIHNlcmllcyBhbmQgbGV0IHlvdXJzIGJlIHRo
ZSBvbmUgdG8gbGFuZC4KCkluIHRoZSBtZWFudGltZSwgSSB0b29rIHRoZSB0aW1lIHRvIHJldmll
dyBhbmQgdGVzdCB5b3VyIHNlcmllcyBvbiB0b3AKb2YgdjcuMy1yYzUuIEJvdGggdGhlIGNvZGUg
YW5kIHRoZSBydW50aW1lIGJlaGF2aW91ciBsb29rIGNvcnJlY3QgdG8gbWU6CgpDb2RlIHJldmll
dzoKICAtIGtzdHJ0b3VpbnQoKSBwcmVzZXJ2ZXMgdGhlIG9yaWdpbmFsIHNlbWFudGljcyBvZiBz
aW1wbGVfc3RydG91bCgpCiAgICB3aGlsZSBhZGRpbmcgcHJvcGVyIG92ZXJmbG93IGNoZWNraW5n
LgogIC0gRXJyb3IgcGF0aHMgYXJlIGNvbnNpc3RlbnQgd2l0aCB0aGUgZXhpc3RpbmcgdmRzb19z
ZXR1cCgpIGxvZ2ljLgogIC0gVGhlIGRvY3VtZW50YXRpb24gcmVtb3ZhbCBmb3IgdmRzbzMyPTIg
aXMgYWNjdXJhdGUuCgpSdW50aW1lIHRlc3Rpbmc6CiAgLSB4ODZfNjQgUUVNVS9xMzUgZ3Vlc3Qs
IFRDRyBhY2NlbGVyYXRpb24sIHFlbXU2NCBDUFUgbW9kZWwKICAtIEtBU0FOIHByb2ZpbGUgKEtB
U0FOICsgS0ZFTkNFICsgREVCVUdfT0JKRUNUUykKICAtIG1lbW9yeSBzdWl0ZSBhdCAyNTZNLzUx
Mk0vMUcsIDMgaXRlcmF0aW9ucyBwZXIgY2FzZQogIC0gQWxsIGNhc2VzIHBhc3MsIG5vIEtBU0FO
L0tDU0FOL2xvY2tkZXAgZmluZGluZ3MsIENSSVRfRVJST1JTPTAKClJldmlld2VkLWJ5OiBIYWJp
bCBFcmVuIFTDvHJrZXIgPGhhYmlsZXJlbnR1cmtlckBob3RtYWlsLmNvbT4KVGVzdGVkLWJ5OiBI
YWJpbCBFcmVuIFTDvHJrZXIgPGhhYmlsZXJlbnR1cmtlckBob3RtYWlsLmNvbT4KClNvcnJ5IGZv
ciB0aGUgZHVwbGljYXRlIG5vaXNlLgoKUmVnYXJkcywKVMO8cmtlcgo=
