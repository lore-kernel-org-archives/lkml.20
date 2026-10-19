Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792436072;
	b=gS+e64T6r+fWr27P2bajgLLIhXf+lUhMmds4ebJ9LMA1FjtEFo3WYtJ2vShfxNZiU9r6
	 vLhKxUVqoNgsf6HDwlAjt9MGIJVlgGJh970DGNAZ4ncyoegigmOluPmGXvxl9ZOv9e6SE
	 +mpUo/XDPeVI/4Z3K+NhMsRme2mRBEnUeSEuJCr6onW+7JLBmAanGtEOWfnMAwCTIwTxj
	 PUlXDk8Jj7u5s/8Ibur/g31tN2+VD09cRxH4qsw0bquDkAXY+4ducK6KYOwJ+lADKjEgh
	 eYC5+AxCpB/p1YX+lQKKEZrlpe1g9G85VxEddM60Up0AXzUdQ6B6Z43l7Tz3eJhr5RA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436072;
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
	bh=hRGj+ryqwyT8zg0gEWovwPA0vIo0aqv9eviwhbeC66k=;
	b=p+fqyn9tjS3rXSMe9LmrEYWGABsnAUQn5cAl4fRlvWOLoW0aFgWy2V8k97J/24CKtKcD
	 5XKNR6xJbIY3BAnTgfUnDbtw5DhgmNta59UKfMo0QI4K/+jrWhjSM/7zko35Fn3maGyc9
	 9lFafv7WVSPRHSKBu545wIWe0V09NAXCQNeT4Je/ZAzJvzM2BHm8m2T74ZGAkFzy6IKGG
	 z/jdkDQ3Cnq6onC2c2HGVpWKna9GQ/uLv2l0ASgn9GIP+mmj6+9HL+FyjuaaOuXB0bhZD
	 9mqEQltgLWXBlzIKLAJ+968l66HEr3j5nXry4Ica5LdUbDi5diVJxEProuCltdPgQEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RmaE3gGG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.59
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012059.outbound.protection.outlook.com [52.101.53.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8CF606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF8CF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RmaE3gGG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOv+moM3KPfSOBH1v9cX7sRomGRYbQ95UJAPwkUvUMHbnDylkDX6h2+IhoZBtdE0Bk9dWWdm7dz6DXRzvSxYrYBeZ/ZHPGa8QmDHNsnb8JsCv1cyKlQW+tZqwCBdJ7l1LOuJbHeeRPMUKLxj80Fwgv28JLYrDkZvb5wx04L9+3yvnawG7kQV/teKhjgCkblQWI1WyMH2JO8rT7EUPVtkyAvE6TYAbnxSjydn+vLhtTj38zn6cK9zIhziBIviSNa2v8vt/XgnUDwO2YsZ5N78tjaM8wh0e/ZbEaNBHof9UnxrFFiMOrgsRKl3la7pb5Oc8e1RSOlW36GcPnXSuhBYZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRGj+ryqwyT8zg0gEWovwPA0vIo0aqv9eviwhbeC66k=;
 b=sdlDHoUZ7WNNRK4mYDe/ZMJotK7Ehv3hYk9mUYt2bAKO68YVMjVtwCICo8LbIb2g3RFdmm22UW8wht9GgGYfgwRGEC2V7IVYYMbASqu4VFwoNxFqW/20xBvIsyTvZ8vmek5Exch3YXhXekrDXiS2e9Z1mM1LzuiS6hDoJmGGxoYVOfNGq8VNGQn63m4hjNyYVD60yks7cy1mx9HsSWmO1OOeo8hls6vWeQz5SLDuegsNBgEgXZUEs1dXPHGU956ZbEVy8F2a4eJy+b2d0RDlWc5V3kbXWhRr58FZtJjVoLfAD5MYEG7ZlFyNcy9SD4lBB5SG7AiKkmpbeY+azlhgOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRGj+ryqwyT8zg0gEWovwPA0vIo0aqv9eviwhbeC66k=;
 b=RmaE3gGGLhNjGaUtD+xE2N26S8jgH0SBX+NV9b/7cDohhG5OsMEbG4XQiXbA1n74Yxo9DdUFnpAC5fhWa9uwmAUtXCWGC+wjpA0vph26LF1xHrgwfid3iFjZlsBxxVL2rlC/FbuOcPZsXne7Pt/DFEW/kK2RGh3BKbyolxeaGlM=
Received: from BN9PR12MB5259.namprd12.prod.outlook.com (2603:10b6:408:100::17)
 by PH7PR12MB6693.namprd12.prod.outlook.com (2603:10b6:510:1b0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 18:54:26 +0000
Received: from BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed]) by BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed%2]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:54:26 +0000
From: "Garg, Shivank" <shivankg@amd.com>
To: "david.laight.linux@gmail.com" <david.laight.linux@gmail.com>
CC: "tejavojjala@google.com" <tejavojjala@google.com>, "Rao, Bharata Bhasker"
	<bharata@amd.com>, "rppt@kernel.org" <rppt@kernel.org>,
	"ankur.a.arora@oracle.com" <ankur.a.arora@oracle.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"vbabka@kernel.org" <vbabka@kernel.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "surenb@google.com"
	<surenb@google.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"nhuhuan@google.com" <nhuhuan@google.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"tglx@kernel.org" <tglx@kernel.org>, "liam@infradead.org"
	<liam@infradead.org>, "Salunke, Hrushikesh" <Hrushikesh.Salunke@amd.com>,
	"bp@alien8.de" <bp@alien8.de>, "mhocko@suse.com" <mhocko@suse.com>,
	"ljs@kernel.org" <ljs@kernel.org>, "rientjes@google.com"
	<rientjes@google.com>, "torvalds@linuxfoundation.org"
	<torvalds@linuxfoundation.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH RFC v2] mm: introduce copy_mc_highpages() and batch copy
 in folio_mc_copy()
Thread-Topic: [PATCH RFC v2] mm: introduce copy_mc_highpages() and batch copy
 in folio_mc_copy()
Thread-Index: AQHdX7GhnuOfO5oRrU+HnM1hVhc+T7cEyKiAgABud4A=
Date: Mon, 19 Oct 2026 18:54:26 +0000
Message-ID: <b22a59fa30183e13043e69ee91dfc77eca4d4a26.camel@amd.com>
References: <20261019-batpagecopy-v2-1-d75e7d0dfaae@amd.com>
	 <20261019131901.7a8fae90@pumpkin>
In-Reply-To: <20261019131901.7a8fae90@pumpkin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5259:EE_|PH7PR12MB6693:EE_
x-ms-office365-filtering-correlation-id: 29fbdff3-a0f3-4f69-6937-08df2e1265bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|38070700021|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info:
 r0G/4773H9oC94jVWMFISoPsfx4FCis93W18/Sa6pGPM77VcrU0bH4UX2urzwhsGzG1OvBVgEkFJncsQRdN0m/oc/KSVyDLt8q+Xs1MNuJzuKWvV1FMeyNEQaPR8KwvZAYwvp1XkoE15CAaphViaRTOdbKoiiY+3w9tFp4n4z7wRFlIvqeQMMhoZZj6Q9xu5zZtVt336JA0rR/hHBslpT5bie66yiGXQMGVMY2tuKTfrco3CHvfraVEQhFSxwTln17lVaz2Sk3a0HeMu0yAfFBHziNbEB1SFK3glFHeTBui/03UmkJxhWTlpI1sHSMpMUU901ba3JacCTFsc0gB6Crgfr8Uo/BR/RKbrd4PhMcJZZj/bdzqG58CDHBL0eAtDMkYzInE5wDs7WJeCAYhe9OksDN8QjIvbGqIf7QnPTPEs+sgDbf7Nx7YOrbK9+FdAmz7xAQpxvKpCdMwS3tbEEMNzSGJ0VZEYLXp23fuO9KVdlpGCleM3lhasqOqShJjFkcGfzSdJtDV4ndDJF6irUeibtPs6p7wygCVmjeXMhTE8b+8Vxwt2c4wcJTlOwidjKhbunh10NLIqXjXdf87H2JLYj2WkJislpUHbVdlTwFyXTBsh6izw9IcICreah6E4eZVIWdGJ2tE0BgIGNgJIG8T2ZsrLlioSuPhxR+Tlr3EQDgAsuaucfwqfWlMr66tZ3y+fiZUMukV4DFLSTWOoveRB9SuAQHk/ibA/7uj3AEw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5259.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(38070700021)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WURZd25uQUJQZ1IvWDRaNUh0MXUxZG9jVjZoRC9YejJZSzFsWHVnV0ozRWdI?=
 =?utf-8?B?aGFSNlZpZUJsK1ZZOFJ2QU12elh0M0V3WlBQUkFFQUpHS2t1enNaQnF5MVlh?=
 =?utf-8?B?WlZra0xvSU12TjBxbUh6WG5Ncnk4aWZtZFBQNW00VlZMckViTFEwSDNCanNP?=
 =?utf-8?B?Mko3NHIzWTlMcG56czRaajhTWU1xelNCWk1qejB0YXNDaFFPdElZSGkwK3Ew?=
 =?utf-8?B?cklWQTN1RFU2UElWaU9WNzN0OURmQjZaQ1hkekxFc0wvMnA3bnhLUEJUQjlD?=
 =?utf-8?B?amNOMjRVd2IvZkVRMENOeTZkM3FYeXBRSHltdjdvdTN5djU4UElPbklZWWl6?=
 =?utf-8?B?bmRpRGZBdHh1S2VCNjEwVTlaRnlVbWpudHZQMWVkajZBMFN0RlY4dzlacU5P?=
 =?utf-8?B?MnJ2eVcrN2dETEFTdFJLbWJVN0FQcHBlTjRTdGZZUjFzMDdVaHZFN1NaNUtU?=
 =?utf-8?B?aDRPY2o1bVNsMEpwd2xwd2MvTVF0cC8wSnUyTGFDOWErcGxJRFRrS0VlUkJI?=
 =?utf-8?B?NmhCcUtjMGVScXR0L3ArdXIwQWlwTFEvM3JkeHNYeENjRHQrbFU3UktDMWdB?=
 =?utf-8?B?eEhvZUZycUJpNnNFdzMwNGNud1ZJRngwUG9NRFIvM2p6b3NqRXV2c2Ura0Rx?=
 =?utf-8?B?OXp5ZUg2Qk1PUlk2dFhqZVlFRmRldWNzZy9ZRDA4d3Q2dVNUbWZ6Y2FJZVBH?=
 =?utf-8?B?cmxLMmFpeVlKbXEyTlVSY1JQM21iZmlKa21PeU1VWXkzRmJ5OXZLUmx3NFVV?=
 =?utf-8?B?SXpJcUFLOWVieU9yb2tGVVM3a2pyUWM4RGVWQW9kTlo3UFZUb3JXNWV4Ym5i?=
 =?utf-8?B?UVMxWWc2eCt5ZVJPSHpCWk9WK1FyaFovK1FNRzVSbytGS2Z6NUxSWDU4c2Zl?=
 =?utf-8?B?NnRDL05reHlMUzZ0MWVvdUs4REdXbllXZHcwWmxYc2VpTFVrektXa2RVTnNS?=
 =?utf-8?B?cnpMckJEMVh5WVd0K0huOVYvajFGcjBUd2hFcnFwdW1ta2Q0SnFBd1hFOW00?=
 =?utf-8?B?OFJDTTRLM0J5M1FjSlFhTXFnaFFZRXJHNEZwVTcrV1FrSTluNDE2YXpDVnF0?=
 =?utf-8?B?ZUtneFlqMGRTOWk5cnVUSlNHNHJZNVVGSWNnT2NrOFRKTFNPNzRFY0VzaWN4?=
 =?utf-8?B?YVRKWVNUem1HREJqOXE5L3gwbUVETlBReHNYekZuREVUeUZOc1lGaTV2Q2VT?=
 =?utf-8?B?Ti9GUi9xcG5naFVxWExDZ09WbzJNUDBVS3dOWGhRNnc5MFVLYW9ERU1Ib2My?=
 =?utf-8?B?Tm9kZWFrL1ZKVEljaU5Ob1U3RU9EK1ZMTE51NWIzU3pyeDFnais2VjNDeEd4?=
 =?utf-8?B?UUVnUEJXclhyeHRtR0NSUERNYlNxZmk3V0F6M0VxMml4UjRkNXFyQ2xiSHc5?=
 =?utf-8?B?WEcrSExCVlg4emJvbU54anhBR2RTcVJIODhGancwS0ZLRzdRTFd2NVZCWGdM?=
 =?utf-8?B?dzFkOUhKRGsrWi9XeVhkM3pZSXNISm1pMzE2bjhZOWdxRkZZWlYwK01YdEZm?=
 =?utf-8?B?UXU4UUpNU21MVHByU2NrVUlSVURoLzFVdHBVa1hsYmFiZVNjRHBqMy9RTDlK?=
 =?utf-8?B?RXZCWWpBdTFGcmlrYlMxYmNvYzY1V21XNWZGSWJkYmpOdGgrVm9YZ2JneEx2?=
 =?utf-8?B?WmlaYU45am5kQ1NvNG9KNVFNZEU1SzZvZ1cyL3RUZzdNcXVSOUprZkhMOXMr?=
 =?utf-8?B?ZTJCMVBzMzA4YmFTQnhVYm8wN0ZMcVE2R29PQzZSU0E5czRtcDVxRy9CSHV3?=
 =?utf-8?B?UXIwMVJ1TW5LLzJIOGxZWVlpdE4vZTlBUG14YmdwZGV3cXdrUEZRZ210RU1h?=
 =?utf-8?B?UVZwTmF2L1NIRXNRbmxQZkhvb3QvL0d1UGNJU0xMTWZwNmJvTWZ4RnBQYnJM?=
 =?utf-8?B?V2ZDTTBnN241dDEyVHdJOWNZSm1yODFzUG5EMmNlb2RyZ3h6bG5WdkVpVFd6?=
 =?utf-8?B?bUpYeVhkSVdCcGNmbWFEOUNOUmxJNEVLTlg4NWhpZ2orN0I3cTBxMVljWXVl?=
 =?utf-8?B?dVZyTGRqVHlNaTFtdlJENk1hNDI0N2lQVTZKandqVHJxRUtPK3hSRW94RW5O?=
 =?utf-8?B?MFRQQTAxcmRvQ2sweUFHY0NjVmY5aUp6QmMzampjRlY5d1d3Q0F3WHJ0TGtt?=
 =?utf-8?B?cGZaWk5OY0Q1K0dHSzJWa21SSE11UmtIcG50ekp4MVg1NmVZZDNmcER2NUpO?=
 =?utf-8?B?NnAwaXNkeGVEYk5XUzlmVC9SVUVFUGd6NmZuNGVOTGt1SnVMQm13a2pUT1dz?=
 =?utf-8?B?YjUwaENoMUZsb3lXSGlBWmwzNEUzUDh0LzdLbFJZdGhUcm5XQnZxZi9OZmU2?=
 =?utf-8?B?ZXdjVitJMnlzSlIycnFKUUJiOXUvUzVxQlR0VUFLa1JpYVJkam1yQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE79FEDF3B6E9048A734A4F30D75C7A6@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 29fbdff3-a0f3-4f69-6937-08df2e1265bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2026 18:54:26.1069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kDU22ALusuugg0Amp5vg+R1AM3JLf9M8HDNt1jc4ZWSUjKmsmaY90k/LxxZdKt0McGS/54NuIGTYmWNkfKypJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6693

T24gTW9uLCAyMDI2LTEwLTE5IGF0IDEzOjE5ICswMTAwLCBEYXZpZCBMYWlnaHQgd3JvdGU6DQo+
IE9uIE1vbiwgMTkgT2N0IDIwMjYgMTA6MDY6NDkgKzAwMDANCj4gU2hpdmFuayBHYXJnIDxzaGl2
YW5rZ0BhbWQuY29tPiB3cm90ZToNCj4gDQo+ID4gZm9saW9fbWNfY29weSgpIGNvcGllcyBhIGZv
bGlvIG9uZSBwYWdlIGF0IGEgdGltZSB3aXRoIGNvcHlfbWNfaGlnaHBhZ2UoKSwNCj4gPiBzbyBh
IDJNQiBmb2xpbyBtYWtlcyA1MTIgc2VwYXJhdGUgY29weV9tY190b19rZXJuZWwoKSBjYWxscy4g
RWFjaCBwYWdlDQo+ID4gcGF5cyB0aGUgc3RhcnR1cCBjb3N0IG9mIHRoZSBzdHJpbmcgaW5zdHJ1
Y3Rpb24gKCJSRVA7IE1PVlNCIiBvbiB4ODYNCj4gPiBDUFVzIHdpdGggRVJNUykgcGx1cyBhIGNv
bmRfcmVzY2hlZCgpLg0KPiANCj4gRG9uJ3QgeW91IGFsd2F5cyB3YW50IHRvIHVzZSAncmVwIG1v
dnNxJyBmb3IgdGhlc2UgYWxpZ25lZCBjb3BpZXMgKG9uIGFueQ0KPiBjcHUgYW55b25lIGNhcmVz
IGFib3V0KS4NCj4gSSdtIHByZXR0eSBldmVuIG9uIHNvbWUgdGhhdCBkb24ndCBhZHZlcnRpc2Ug
RVJNUy4gDQo+IA0KPiBUaGUgZmFzdGVzdCBhIGNvcHkgbG9vcCBpcyBldmVyIGdvaW5nIHRvIHJ1
biAob24gYW55dGhpbmcgYnV0IHRoZSBsYXRlc3QgY3B1KQ0KPiBpcyBvbmUgd3JpdGUgZXZlcnkg
Y2xvY2sgLSBzbyA4IGJ5dGVzL2Nsb2NrLg0KPiBBIDRrIHBhZ2Ugd2lsbCB0aGVuIHRha2UgYXQg
bGVhc3QgNTEyIGNsb2Nrcy4NCj4gRXZlbiBhbiBvbGQgc2FuZHkgYnJpZGdlIGNwdSB3aWxsIChJ
SVJDKSBjb3B5IDMyIGJ5dGVzL2Nsb2NrIGlmIHRoZSBkZXN0aW5hdGlvbg0KPiBpcyAzMiBieXRl
IGFsaWduZWQgKG5vdCBtdWNoIGxhdGVyIGNwdSBkb3VibGUgdGhhdCBmb3IgNjRieXRlIGFsaWdu
ZWQgZGVzdGluYXRpb25zKS4NCj4gU28gdGhlIGNvcHkgcGFydCB0YWtlcyBhdCBtb3N0IDEyOCBj
bG9ja3MuDQo+IFRoYXQgbWFrZXMgJ3JlcCBtb3ZzcScgZmFzdGVyIHVubGVzcyB0aGUgZml4ZWQg
b3ZlcmhlYWQgaXMgaW4gdGhlIFA0IG5ldGJ1cnN0DQo+IHJhbmdlLg0KPiAoSSB3YXMgdXNpbmcg
bGZlbmNlIHdoZW4gSSBkaWQgbXkgcGVyZm9ybWFuY2UgbWVhc3VyZW1lbnRzLCBpdCBoaWRlcw0K
PiB0aGUgZml4ZWQgbGF0ZW5jeSBvZiByZXAuKQ0KPiANCj4gSSd2ZSBuZXZlciBtZWFzdXJlZCB6
ZW4gMS00Lg0KPiANCj4gSSBhbHNvIHN1c3BlY3QgdGhlIHNsb3cgcGFydCBvZiBhIDJNIGNvcHkg
aXMgYWxsIHRoZSBELWNhY2hlIG1pc3Nlcw0KPiAoZXNwZWNpYWxseSBvbiB0aGUgcmVhZCBzaWRl
KS4NCj4gDQo+IE9UT0ggdGhlIGxvbmdlciBjb3B5IGlzIGxpa2VseSB0byBiZSBiZXR0ZXIuLi4N
Cj4gDQoNClRoYW5rcyBmb3IgdGFraW5nIGEgbG9vayBhbmQgZm9yIHRoZSBkZXRhaWxlZCBleHBs
YW5hdGlvbi4NCg0KSW4gbXkgbWVhc3VyZW1lbnRzLCAncmVwIG1vdnNiJyBhbmQgJ3JlcCBtb3Zz
cScgcGVyZm9ybSBhYm91dCB0aGUNCnNhbWUgZm9yIGFsaWduZWQsIGxvbmdlciBjb3BpZXMuDQoN
ClNpbmNlIGNvcHlfbWNfdG9fa2VybmVsKCkgdGFrZXMgYW4gYXJiaXRyYXJ5IGxlbmd0aCwgYWx3
YXlzIHVzaW5nDQoncmVwIG1vdnNxJyB3b3VsZCBtZWFuIGFkZGluZyBhbiBhbGlnbm1lbnQvbGVu
Z3RoLCBldGMuIG9yIGFkZGluZyBhDQpzZXBhcmF0ZSBjb3B5X21jX3BhZ2VzKCkgKG9yIHNvbWV0
aGluZyBzaW1pbGFyKSBmb3IgcGFnZS1hbGlnbmVkIGNvcGllcy4NCg0KSSB0aGluayB0aGF0IHdv
dWxkIGJlIHdvcnRod2hpbGUgeDg2IGNoYW5nZSBvbiBpdHMgb3duLCBpbmRlcGVuZGVudCBvZg0K
dGhpcyBzZXJpZXMuIEhlcmUsIEknbSBub3QgY2hhbmdpbmcgdGhlIHVuZGVybHlpbmcgY29weSBt
ZWNoYW5pc20gYW5kDQpiZWhhdmlvciBvdGhlciBjYWxsZXJzLg0KIA0KV291bGQgaXQgYmUgb2th
eSB0byBoYXZlIGhhcmR3YXJlIHNwZWNpZmljIGNoYW5nZXMgc2VwYXJhdGVseT8NCg0KDQpUaGFu
a3MsDQpTaGl2YW5rDQoNCg0KDQo=
