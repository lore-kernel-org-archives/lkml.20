Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793019747;
	b=Pyn3Ku7pyLrQSzxSFOlpDkq/zDGleGafS5Xdd/XCmPzIzebnoY9wytODHTtEgs0jZBtt
	 bheO0F1rzk8+7haHQYRAkw/H7x72PpGDuTDK/u4NZzZS1iXH1/PCA1GTVbLCDEF+ows8e
	 23WjkSXNXPZAxVi2Yw+vAtWWh4ziJeDGdvqsFh6UWJ9K5LAooOnfi5VvtE3sV2HOkwY3w
	 QbifsdRH3Hnrxi5UPOM84iqQRaCsp2epzjK92be4RqDlLazHrZUujTCFkaoU5wz78EvXm
	 pr5wREFP5C2/qhMXAnJG3cU/G/bXfP7BMPfjF3FBS3YDdxeSo+wK6T2d03+0ghbf2gQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019747;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:MIME-Version:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=FJtrPelfwImWBg6BKuwyZBinkN24OyZac5qNFayOIo0=;
	b=24LoqI+fWBkkRTnBgVCeS0t/aGAjiTIPU4ceUDgjOaT4CPErFA81cQLAMUCNorwiqWOk
	 ckTlvTh9BBfUzFLdFjgVQw0RgnXArr+HRNdfHFyJEyi1XJPNwctpnIdQjGL+2RpbL+KSq
	 z2BCXrZFtF3yYoVpyNh7ODTzvyGR9RKuB/JHKsyEKaFl6gLPE0abKASIBNW655/Ztc+uR
	 j5TXPrPN/WKaZfAzm/xM+hjGot2q1JLIs4TMvIxXGT4lcQWV1/zE68++LVJP4QkkOk8//
	 jlis/EqGcRtB8Z7QBIbyHVekiZXdHAYx3jSF3Pne+Boc9UKPk7554VvwdKxQE5v2LMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=axis.com;
	spf=pass smtp.mailfrom=axis.com;
	dkim=pass header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=qo9U0x4N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.11
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011011.outbound.protection.outlook.com [40.107.130.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2618606A31A;
	Mon, 26 Oct 2026 13:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2618606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=qo9U0x4N
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbhV3Iq5qR1d9/WUcHJ1AbHaCzomnQXiEvtXiSfkWY30wjg60ugej6qql7w1D1SZ1Tc+ithxLildYMCeQM7jUFgDtYm+CtDnQxGZwxvzFGgQjYxPrn1Uqw7px1UghxBAjb52vZ1j8fzjiuih9e+hphhfOLla42qW2IVk5mIMaAQJmyGsPA3uXAL6O9IiYpP0G6j//aP/kzj4LnqQxhno3odFpj02Pg0e0I1ly6djugaEUb9pOVmLSJvWzMNHnc8jhCqRkUMdi5D159gOL7LYt+wODeYFCwYKpkhV9WiFs7P9ueXYMS6unNJIjKxn4cp0kbdCsnYSi5r4mX3/3GkSFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJtrPelfwImWBg6BKuwyZBinkN24OyZac5qNFayOIo0=;
 b=QP8cVwAG83q2PW+IQPfvaKqIr+xusMDUSWt5lFERb/6SmKeh6jhNgSRi8nyfs6AiSpDLE+JYCumoqjJ1k2gNlu5rqQcHlsMdZnTf2DDaDE0prqM3mpT5FrfplpvS5w0if8ZUMJp/VV0B1YA+ScM3Kzxva0jd7dYuik6NSRt7zLkWw5IfLCmQRo+Ilk4vZulKI1HGyI4fMM7yFK3RJcsGndE7AIAO6W7sYgNVKJBgss/YTl0tCTTzVunWWsX+Cu4JzuOtnt9wr5SrlKKarNWwqGFvbg9vsNyai2B/t3m4oRJOjSCbYq0HlhPFkLou6Te6po6YsD1MGzL2qTMWsgHN9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJtrPelfwImWBg6BKuwyZBinkN24OyZac5qNFayOIo0=;
 b=qo9U0x4Nsq3t1b9PWKhWk1PByfnjrvd5QwFdurIycuyZ3y7CN1CnT3K1S4427L1W395sXyYfOHc1jReWOJeWNx7ZtfJQGEUQS8XdJS9bNzJuKkuh+wkrF0+2gXOR8JKY7p4BGZhGfI2pcgaDE3N43ZbFVsI1eS+KKuDq1ravG6U=
Received: from AM0PR02MB5281.eurprd02.prod.outlook.com (2603:10a6:208:101::12)
 by DBAPR02MB6214.eurprd02.prod.outlook.com (2603:10a6:10:193::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 13:02:23 +0000
Received: from AM0PR02MB5281.eurprd02.prod.outlook.com
 ([fe80::bdd1:15c4:7979:b16f]) by AM0PR02MB5281.eurprd02.prod.outlook.com
 ([fe80::bdd1:15c4:7979:b16f%6]) with mapi id 15.21.0546.017; Mon, 26 Oct 2026
 13:02:23 +0000
From: Kanak Shilledar <Kanak.Shilledar@axis.com>
To: "alex@ghiti.fr" <alex@ghiti.fr>, "guoren@kernel.org" <guoren@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "fustini@kernel.org"
	<fustini@kernel.org>, "wefu@redhat.com" <wefu@redhat.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] riscv: dts: thead: Cleanup with dt-check-style
Thread-Topic: [PATCH 0/4] riscv: dts: thead: Cleanup with dt-check-style
Thread-Index: AQHdUnQQfxVW0/+LnkmafgmyIWb0+bcP75IA
Date: Mon, 26 Oct 2026 13:02:22 +0000
Message-ID: <55208f641473e0714e4509fd5d071343b3a0de98.camel@axis.com>
References: <20261002-fix-dts-th1520-v1-0-9a8810091d47@axis.com>
In-Reply-To: <20261002-fix-dts-th1520-v1-0-9a8810091d47@axis.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR02MB5281:EE_|DBAPR02MB6214:EE_
x-ms-office365-filtering-correlation-id: 392c443d-ffa4-4e66-362c-08df33616054
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|7416014|6049299003|1800799024|18002099003|22082099003|4053099003|921020|56012099006|11063799006|10067099003|261009223027099003|261022075727099003|261022105027099003|38070700021;
x-microsoft-antispam-message-info:
 4kDVs8Zj7d8fJyVP53Jawc/4b7BqRMJ+F+jELbVpSHKu4FxdTHQYsZUa+Tk7JgBjeNxongTUk5RHZk9U826j2qjnmJt4o5oniHUmYIJELSkD/uxzJnAH2FHZTSVHXcnj4In1c216tMBhNwq9wJUvCzyM7DnfcTbcvB7BAM2EuuT+VMwNmw4n2f/tOQUajyRTjzkzmOitz1TXLLVhQ9kixteOGwa76SboUrLs2qzV85df07nrbEwto9j9x8aPvkgWPWqdpaPMDAbbUObrxrrFUTfAygGH8DXtAkI8l70q8P11uLQhfQRTFJfGpE/56Ie3j8c2P/YiEbEjQA5E1wXqe0kycBaIq9ibkd3KIkiOLvVDmLRK18obrYwlQmyJNKhRlT3FanO55mT5t4Jt60B+poePHcDXROG9Ghq3jtGiqiTE3LqG6s+n6mFfajbR1VcQKWx7LjhQ0mJMSCw1l+/y4TUpXyv3XMVzCa0Q+9XGoCBoFAtqmtcf/S1mm1T+QRVtu/1lqqsYfknkU5qtBWXVWl43hDcqMy6B+9mseeXPYPIivWbKpDwQq0GveOH8yXH0M+1jK0Se7CCjFnLcd28R7KqojJi5ZRQiFPOxhoaSiym9kIEbG5/arnKDED04V0pQp6q6RVdUmxntJjPCisd5u50qsJ6E1PycgZMFsS+qFbqFiVzxBFW3XZ5769RxHnVxb7dturfaPw5ri9GQ6GUn/7BiY1u0LPsaNWiwyS7+UI7UsR+UuR2372DL8bswm/bq
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB5281.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(6049299003)(1800799024)(18002099003)(22082099003)(4053099003)(921020)(56012099006)(11063799006)(10067099003)(261009223027099003)(261022075727099003)(261022105027099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a2JPYm1kOWtWWUl5akxncGpkY01sVEk1WEh4OUN6VmpKQ2FjMmhNRVNQaHBQ?=
 =?utf-8?B?Y21laERGTTF3ZGhYL2xZd0FmZ0pRNkliWktaTjF2MTc3UW5XQ01CaHVHeUVj?=
 =?utf-8?B?cDAzT2o3R003dXlQUWZTWU94dFdnRG1zTVd2d2IwQUF2cWQrb2FTZUU0MFdP?=
 =?utf-8?B?QWltVDJvbTN3akZpVm8xM3hYQXFGWUNKem56OWNzUEFyZU1uREd2TFREdmYx?=
 =?utf-8?B?dWV1SnpUc3NXSnZTVWt6Y1I2UzlWeXMwMVp6VGZPZXNnOE9qZjdNUlMvV3l4?=
 =?utf-8?B?ZXByaGJkNGx0cDIyRFFOOFBtOTlLTmZ5QjZ1V2wwamJtNW14bWdleHVoMXMr?=
 =?utf-8?B?U1JiMjJodEp2RHRlNVVKQmlCQTZHdFdHMmNlUmFJK3JSVURoK3NDV2dsUnR4?=
 =?utf-8?B?WCtoOXhkMDJoY0dsYzdOQlpVR0thWmFVZEt5ZktkYlpkRk4wcUR3dWhURkFl?=
 =?utf-8?B?VnAyTlowVUxsYys2RXdtTnBRMmVaRTVaS0VVcEZKdVhZRGFtR1dFaW1kMlZx?=
 =?utf-8?B?YzYyM1VEcVJMMVo2UldRU3pMbDVBZEJVbUZMR21HUjh6T1BnSTJhd2lLWkZt?=
 =?utf-8?B?MFBBbTM1SGYwSjhDTFJqUFZURHhHcFArZzY3aTFjWmJmbTNZRjJGbE5NVWtV?=
 =?utf-8?B?dk44YmFJaGpvSDFncEVqbnRCdXpzeitBYXRmemljbElLdDRvcVNjRitYcHVn?=
 =?utf-8?B?Ulgrc3R4RGU5bG80R0ZYc3lMMHhrc2NrcHRwUkNlQ3BKYkVsUitLTGF1Zjdz?=
 =?utf-8?B?bWRBZC9ETG0vbE9wNVRRSFpIU2oyNEZ2M2JHRHhzUFJQN041OUJWUVlGL3R3?=
 =?utf-8?B?a0dvYlhaZW1aN1NHOUZjSWczVDRmYytGaEtySVZtb1o4WE1pQytVTmFDaGtC?=
 =?utf-8?B?MXlybzVibkpvS0NPWnVTUENMR0lkZXhHNjU3bWpaMHhoNytyaWE4Y2dwSEtM?=
 =?utf-8?B?YTdyTkFGKytqbWFxcjRQTS82cVpFSWJoWm0xOXcvMTlrUy9lUjBLVzVGTDhT?=
 =?utf-8?B?bTdON3Q4ZTBnVEJ3cENBYlZzR3Z0ckF4cUhrSmtyT2M3TURaa2FqSDJhTk0y?=
 =?utf-8?B?MzJFU0xOZmJ3TkxHaS9UaCt4ZmxGbEk2VnB4c2FQVUwwaUk3eUxJN092Kzg5?=
 =?utf-8?B?S1FQMTZsUkQ3cUNGaVd4RlRiSEhvLzAyZXNLRWtBNEpXYytsUWJCdDZHeU5L?=
 =?utf-8?B?UGlWQkl6dGxyZDRKcHZLZUY4ZExUbW8rcmtZNWtvc2VUc2o1UHo4YnFINmdR?=
 =?utf-8?B?T3MvNi9jbGtLZ0NPYTVVem1HVU1YYWR2Lzdyck1MbU9DUDhiVUdlRExzL0Rt?=
 =?utf-8?B?bmxYbTZGL0YxS3kxWHZyZ2E0SjFob1NpSXNDcDhnSTBDT05WUlVQbEZudlFO?=
 =?utf-8?B?RWo2UWgvcWRwN1NhYkJiVGJmcXpjS015Nm1HckxvcG1JNjZWcnArZEFKbGh3?=
 =?utf-8?B?WVpNM0dqVUVoQXZVVk9RT1RNQ2RMM0xURFRjUmxNb1B6d1NhNVhOYXE4TCs3?=
 =?utf-8?B?ait0NExxQ3M0b0ljNDdMTW5RZ0tMd2I5OHAzejhydzlJTUNXeWNaRjJJd2s0?=
 =?utf-8?B?dUI3SXpqU2JXTEQwZUNlc0l4a0tvaHNmTFVOVFdqQnpNcElESDBud1k5QTJx?=
 =?utf-8?B?WnFiZ21Yd1lDN1BUNzR6SHFvZmo3TmxWL3BBenliTEdKRDVuMnZXTUZBUytV?=
 =?utf-8?B?cm9GUEpOeHdzdUVMTjIxelJkeHYyblhVOHZVMGVWeWFwcWlPUXY2Zk8wWStN?=
 =?utf-8?B?Sm1udXdoYXhzUnQ4L0NGRC9RYm5VU3ZncmxjNFYrV1hmRDVqRW5iTkx2cW9J?=
 =?utf-8?B?WUtpVkZvYUhxNHIxK0tXcXE0aHM3Zi9LblRVcGlMQnoweXF5VDR5WjJkU29t?=
 =?utf-8?B?WDE2aFZYZFM4eUt1TURKQlRLVnMxSE54WTQvVEJoajlEMGpQTnNOazNPa0JT?=
 =?utf-8?B?RHB4VnVzamtkNk9TRGEyZ1dXclBqZU1OYmd0dmRJUThGbHdDcS9uMXlvdytW?=
 =?utf-8?B?Q1ZMaUpCYW4vbkM2S1NTU2xWYTFwaG4waXl6T2dDN1JXY09zc1MvN09tc3RB?=
 =?utf-8?B?QURjK3RPck41dzY5YXVmRjlSeEdvTjFDM0oxazhpWFdlMS9VRlRFd0wybEdR?=
 =?utf-8?B?OFpMbktHVzFRR2hLNEtJTTlObU02RUN4OGE2OGhYRnhnRjFPQ2h5ZEh1OGY4?=
 =?utf-8?B?ZlFDYUtDSURXSCtwVXZ5WjBJeFFjZjdxTlJXeVhKTHo0Yk9DR0NWZkhpSFB0?=
 =?utf-8?B?M0tLVng1Rm90a0pPSDhrNHpVR1pvTU9iZmtSRmtIN2RrTk1CMUEyeXYyeUpI?=
 =?utf-8?B?Ulh4RXU0dmtxWC8wS3Z5YnJoYWNPVm9JTExQMnpxTitsWnhpeFlvZz09?=
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="=-3wbNAObFIz/Pse7Ra5sc"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB5281.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 392c443d-ffa4-4e66-362c-08df33616054
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 13:02:23.0703
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OUIflCldRWYMK0E1/Ao94+2gk7rd8eoXy1fsycJbX6YTTS9oHG7vYnUDg8JzG7Qx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6214

--=-3wbNAObFIz/Pse7Ra5sc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-10-02 at 15:43 +0200, Kanak Shilledar wrote:
> Fix almost all warnings thrown by dt-check-style after krzk's updates
> to the tool [1] when run under the strict mode. There are still a few
> warnings remaining which are documented in the relevant commit
> message.
> By doing this the files become easier to read and maintain.
>=20
> After this patch series only the following warnings are thrown:
>=20
> 	arch/riscv/boot/dts/thead/th1520.dtsi:221: [child-name-
> order] child node 'oscillator' out of name order
> 	arch/riscv/boot/dts/thead/th1520.dtsi:227: [child-name-
> order] child node '32k-oscillator' out of name order
> 	arch/riscv/boot/dts/thead/th1520.dtsi:248: [property-name]
> property name "snps,wr_osr_lmt" is using discouraged style
> 	arch/riscv/boot/dts/thead/th1520.dtsi:249: [property-name]
> property name "snps,rd_osr_lmt" is using discouraged style
> 	arch/riscv/boot/dts/thead/th1520.dtsi:253: [child-name-
> order] child node 'aon' out of name order
>=20
> These are left for future work as they create a very large diff.
>=20
> [1]
> https://github.com/krzk/linux/tree/b4/dts-style-checker-blank-lines
>=20
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
> ---

Friendly ping :)

Best Regards,
Kanak Shilledar


--=-3wbNAObFIz/Pse7Ra5sc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTOMrdbv2P+LZwbQtLEY9j7t8KaZwUCat9PXgAKCRDEY9j7t8Ka
Z3iGAP9iAZ/wdUIrK3aNeUCCZyh4woUZhN2AAeip0J6PlXrUWQEAsOiouaCXDX0A
DoVT05pNYZl5bqkWVt7x5cmKWl4ingQ=
=52ug
-----END PGP SIGNATURE-----

--=-3wbNAObFIz/Pse7Ra5sc--
