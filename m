Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023108.outbound.protection.outlook.com [40.107.159.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E45D4EBAFE;
	Wed, 14 Oct 2026 13:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983781; cv=fail; b=WJFh53YaG/uUEHdmg935f8w0gOOz/bx/4JDnFRuk+M0AjrThz6ID4x82fnRCvzc0rXtkKbKeYMiH3GMkjYtvNw9mqYdlA2S1R/+rQLQwyL8nK6a8IXB4y+Ve6EuRJmj/r9kxsMZamPOvC14P/CJFwU2WUecEa0xxhmyjcsE/RT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983781; c=relaxed/simple;
	bh=eU4wrSoFBrztoShwg362dCNXaYhmnAwlrLh3JglhLGo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iJ1hw7i2PDr0/Bb6tp9Tn33rbxfsMf8xmpzXpr9jKd0QWCUrmLEG9bB7D0s86OTzYmRHBa3CSmmyDGujoTqlQPEpnMUbEcSSCuUyD7Pf3vkfRT1gHdRotX018acwsX7Ilqrkf0NT0gU7IfOE2RbSMYQu2klMOwtWSBnFzF72jeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com; spf=pass smtp.mailfrom=htecgroup.com; dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b=dJNArlr+; arc=fail smtp.client-ip=40.107.159.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b="dJNArlr+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWX4r2FKZzQUIZ6pbF0xSIUcyVl5md+7wGWiBAeEkh8nUUDA2o8buIlrsMMldqDHsKm4rMBozMV6oTbC94uA5us9l/FuZgH/NA9/0dVAGk+hdLuL9QXk59RQz/VWLS5JPuqSBIGIXDSxsDI3EO9FRAKkSWDBbIq8lfm0P/2vg5ycAHA7AL1vu0yggAPho8eScHbdodl0RJMYgKR7cIB18esNZVZuwA5U/gkcnzEqpT0ggLzH8AptRkde438sxm3+VTnsrgmg/cxGZs6SFiC7wuUX8LvOmuDCF4jixIinqYj1RYwO5uKMiUl7d2UQ2mCSIOC7UGZdbXGboa4IcMtlHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eU4wrSoFBrztoShwg362dCNXaYhmnAwlrLh3JglhLGo=;
 b=xkHOpX9QavK8GuUBWD/Twt1RBBlZjJ74N6x73DommPcauOq2IB7YNqXFMS8zEG4NlMU3ODqdjnmrCoKh4MqqewHvBDBHeyaX0RhzSkOC193qaBtg+gDGptJZ4uB53UIBS70V2MAdQpC5gzF8if8zMmaLPSM+y9VFOCQEXVRJEBR0FDdq7uZWB+XVT0Ef8Zd0Tpm9iTD83XimCKoEgjJBU2jAPc02LvWy7LUy2SUZKEWhraFdONyAHxYtAW6tX7QsBTY1vYgJb/6HgPWrolEzsQVdHWJfnAv3yRY6Fy6CKYyjCIGMwHGkDm1Qj+w5l4Ad+Ya6C/FgwCYbc6ngYNC7vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eU4wrSoFBrztoShwg362dCNXaYhmnAwlrLh3JglhLGo=;
 b=dJNArlr+GKObkRB+lYOI2/EIli/crU1v5jobAsfcO1h38V+odjlb1xcx/6uDHe4tojg4RSzcC2fpl/BzgnyujZqQ2cWWcMbWlQ9M5EYqptpnVp//FN0agHTrX9JeyWoRWKo1e4QOYEFULEB7+DITTjzKCpkcOMaQUIe5nmOZ8Ik/t+S11mveq/Tmo9MWQDyUTVqvj5epx5+L6UBcjbzTE0mWQ4sKAOwsQufWYnhTVRAed+AeSkjlVSRsUKL+GwAHcpIWnQo8E/VoCTpsA3ryQ0n29XcPU7WvJqtcVwBI6Ae1j2UPuyXtjZEP5DkYxf+Qo71H5n4ETD/H/nOYbVRLHw==
Received: from MMZPR09MB547520.eurprd09.prod.outlook.com
 (2603:10a6:190:56::10) by MI9PR09MB364267.eurprd09.prod.outlook.com
 (2603:10a6:290:c1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 13:16:16 +0000
Received: from MMZPR09MB547520.eurprd09.prod.outlook.com
 ([fe80::5b5:f191:1ccc:f9ee]) by MMZPR09MB547520.eurprd09.prod.outlook.com
 ([fe80::5b5:f191:1ccc:f9ee%3]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 13:16:16 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "conor@kernel.org" <conor@kernel.org>
CC: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "anup@brainfault.org" <anup@brainfault.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "daniel.lezcano@kernel.org"
	<daniel.lezcano@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Djordje Todorovic
	<Djordje.Todorovic@htecgroup.com>, "inochiama@outlook.com"
	<inochiama@outlook.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"radu@rendec.net" <radu@rendec.net>, "robh@kernel.org" <robh@kernel.org>,
	"tglx@kernel.org" <tglx@kernel.org>, "vladimir.kondratiev@mobileye.com"
	<vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH 3/9] dt-bindings: riscv: Add MIPS Boston board compatible
Thread-Topic: [PATCH 3/9] dt-bindings: riscv: Add MIPS Boston board compatible
Thread-Index: AQHdRFDNcAlfINcodEeR7s5jjfhkNrbP7wkAgC1EtoA=
Date: Wed, 14 Oct 2026 13:16:16 +0000
Message-ID: <3d13e372-80da-44bb-845c-14f5022e326a@htecgroup.com>
References: <20260915-woof-ducktail-5e2f52bc5762@spud>
In-Reply-To: <20260915-woof-ducktail-5e2f52bc5762@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MMZPR09MB547520:EE_|MI9PR09MB364267:EE_
x-ms-office365-filtering-correlation-id: 637c3288-4372-4aac-ff37-08df29f553fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|38070700021|56012099006|11063799006|261009221727099003|261009221227099003|261009220027099003|261009223027099003|261009223327099003|10067099003|22082099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 uzVGnTfOA5NOOudCEqJL9+FzRbJCbDnZjwMmQm5buFQSEPNchQi8OStuBOjZMdrl50/82XD02NBbBkK/WTxFjA+hSETif4Hh8QwtXc7lWmbMpDNMVKQAVi5blpPcXmRyfLuBfBkIdoWLVxQ5EgOmf73syrDPAPJFSltnUor0nhD72dVVUr99b89kJFHjTYpoKShxnX8jeSSFUqTisiEm3DqmAR6NppQN+tr4+YLzPBogsR5K1jYtVkt5E3yAygZs74lp3uLRspIkNvmJnG/AOaayGNXq/YUpooeSpG3Xv02KWs45Pvp/rDIHMMG55oI2KxW0yTXdoWqyfKQ9TBec34tW9/hZI1KQ705YklP7NI2wE9hlqlGHGs5sa3AeQ8fEmwa7t8iq0WKQIMbFRoTrEsdPRdBEKzLs7Qq7gEQOY8hJ9Y3gqb7Q1zGtKwx+EX38GjpArktYNt4jBJ/+0wz0dXpIlU2s4x1lP2yB04rp1ZyrQ/C9cEdOh2uDe3G2vqg8hyelEbBPunIA3GYT32PgZ7C7Vl16KHrKH/48I7KJpBCRVNrc61IV9dk9/+D8Q4WMyq8fzfgBycggytqsUFq7B//cMZuMM4lf359o+k+/K2dxHCwyOR36X9p8I5JfdrpvEFyDO9QF0EWGAyTa09nHcqQmnt0KRz2GJs6ZP5XPU9Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR09MB547520.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(38070700021)(56012099006)(11063799006)(261009221727099003)(261009221227099003)(261009220027099003)(261009223027099003)(261009223327099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Vko2aVBpYm0yUVlSU3VVUWV5OFcwQTFnekYyVEVqSS9Na0lnOUYzZURJaDMw?=
 =?utf-8?B?WDR3alZDZ2ZpRUsrR1lVeHNxbFkzaXBlWTFsa3lOZWZrRkY1eEVZcE5Ca0NK?=
 =?utf-8?B?K0oxRmN1QWM5a3p6UmxoL3JrS3FCS0U1WlNSWnBxQ2pNc0ZkQVJVUVFHNUE4?=
 =?utf-8?B?b2s5c2NYSjFIY2tvbGxxZFpiVzNUN3RMYTZTZ3VqOVlmUmtJUzFvTFllUWtp?=
 =?utf-8?B?NEFKZXhYNG80SlFhSWJ2LzJlZmZmdUMzM3R3UDhTM1N2ZFpocU8ybkN4dHNJ?=
 =?utf-8?B?UE0zOUNkcDZsK0Nzc3ZvaDVycGZRbXpmbTQxbVNSUU1sTEgwTWV4UEhBZ2ha?=
 =?utf-8?B?VDRad2tqeUJxTVBlZFVtaGJFNmtza0FVMzJhSURRU0c2UkQzY0g5RkhuZVJM?=
 =?utf-8?B?R3p1NnkyZkhkK29aNXNqU0lxaHkvNXdYUEphZmFNRkMrOElNZHdjTW5MVS9a?=
 =?utf-8?B?ZUZ5dEV1K05oQmQ2QmRWL2JxTlpoU2kzMXJud0Q0VDJZWVN5Q0s3dWZHaE9p?=
 =?utf-8?B?Nmx0UFZGSnNabWgwUVRiM2FBenFCN1ZCaWl4RkU5d1hpdXBYYWN3WGpNSm9p?=
 =?utf-8?B?VUhNU1ZDenZQaWl5MGhTWHZuclJYRDlpeEVYY0tHWEpYUjRuVzNxbmlwQ0Va?=
 =?utf-8?B?b1AyZ0JxZzQxSnNkcmY2TjdYWENGS0krNmx2UXRvU0dLNFdzTkpsbzZxSE1z?=
 =?utf-8?B?ZWxTeUhVS2dPcXpETEhyYzcwSWdsakNEalpJa20yUU5zR3BWck9WMFV1WHN5?=
 =?utf-8?B?ZDlMMGpaUmMxWjVITFdZQ09BWmltV3R4MHRQeUVwdmFWV2RjaGpmQUsyUktW?=
 =?utf-8?B?SkNrQ25td290TFpSdS9ZeStjdnBJMFJmdWo1OGNSWnR4L01LZzQrczdMbEJT?=
 =?utf-8?B?dm9XZWtIM1lDb0Q0TzhGMHZkZXMzYVRNVWY2cUFsdzkwSEVWSHM5VTI1R3pF?=
 =?utf-8?B?SWJRNnhvdW9MVlNQd3hmK2o4aHQ0b0xZQWs2dUhiOTB1aE5jN3JJeTBnNFoz?=
 =?utf-8?B?QlhMTGs3ZUlBeEN6WjJPUHZTY0Vsc3c3OEl1OWs5VnBLc2xpWGpsQzZyeEdE?=
 =?utf-8?B?cVpnbkZsaXRKK0p2YmZKbXRjTDdIREVYV29TaG1hRGRVN2pyV3BIWEtYTytr?=
 =?utf-8?B?MTZtdjBscUFmb1ZTN3hjZGFPL2pEb1pJSWUyWjBxV292NG0wdWZuMVc0ZVNK?=
 =?utf-8?B?K1F5VG1TdE1uaUhabnJVT1dqU090U05mZkFkaGFLWE1xNm45QTZmc1ZGMzU0?=
 =?utf-8?B?R3dpR08xcFNhL3NacW1jSGNxdFBadHRMeVlBWldZZ3VQY0V2RnJjbU96M3By?=
 =?utf-8?B?TEVhZ0x0Y3FPRFJsTzNaYWt2Sk1FYkhyajFwc1RMUUxmTWh1RjJwbzBwenpo?=
 =?utf-8?B?VHJIeS9PdUJkU2s2MURsUGhZTHIrekpYNXcxSXJGYUw2YmUwYURoT1hSaStR?=
 =?utf-8?B?U1B4TENkUURLOUZxTHR6SlI1TkRzUnVkcm0zWUhiRHhWMlppVHhpVWY4VU9v?=
 =?utf-8?B?Tm1KNEZDeU1JSlJNeXRxNys4LyttK2R5WXVUR1F3dlp6KzgrRVNQQW55MzY2?=
 =?utf-8?B?bVgrWGtETHZpdExqSWJBeXBUM3hXbFNzYkxMVklXWVhHUVkvSUg5RVB3d3Zz?=
 =?utf-8?B?R05RTEFIZVEzWktocm0zNDNRNnBjZVJ6NFhNTkNJalFPelI4TmFUS0I5ZmxF?=
 =?utf-8?B?Ui9nMXVHeVg5ZElKdlRtdldtVlAwZ1laSkU1NWt1Z2JzREtYeU0vNEMyUXRC?=
 =?utf-8?B?TTZlVXBBOWVFUU04aVc1QmI4eUNBeUpnN05yR3Nrb24wUzc2Rjk3c3RDb0ZS?=
 =?utf-8?B?akNHV0E1ZkowZkl3NzBOcU9DL0hFd0VTOGlGZ0lmb1MzK0c4aitiM0xqTUp6?=
 =?utf-8?B?NFV1WGNERXFUbGQzWXBRWUNkVWhaVmJxeWZhV3J4OUNvM0oyNzVvN0FySlUx?=
 =?utf-8?B?VExQMGVidThrZUF0d0paMnYxTTJSeGI2clVUSWNDL0NBQnNWZForT3pXdHRw?=
 =?utf-8?B?NzFZdTdSUFpGQW4vS0o3cnVxRUVBQWdWS3VQbStHOEhhU0tidVV0eG1EVmt3?=
 =?utf-8?B?UkxnbFNodGxJaFFrZXFzc0dpVWF4R1Y0QkU5VjdyWCt6SXE4RTB4bTdhS25T?=
 =?utf-8?B?Rlc5d0s4eDYrRFIxZW9tcjZrZjh3djgyT3o1R1dzTmFLU0Z6SFYrNDNNM25v?=
 =?utf-8?B?OTVXZ3RNQTRndEd1WG1mUmZoeHFoZEIwdzhSY09oZGMwU2dadElvZ2FKUlFn?=
 =?utf-8?B?RnFHdnQyNG1qdWhwb1docmhQbUU0djlBamJRVzg4RWsrcGorSEorc1ppc3NT?=
 =?utf-8?B?aFBWV3dKTHo0b0ZSRUJDdEhjRVJ0MStZcTlIQ0dybHpGQ0pQdHFrNUcyd2dv?=
 =?utf-8?Q?kXiFCoPShsLg3BjU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <194C0462539EF6449A5735D60CA002A9@eurprd09.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MMZPR09MB547520.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 637c3288-4372-4aac-ff37-08df29f553fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 13:16:16.2038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /PLJRN8v0ZgAhsXQqJRDnmB9GNR0Lxtw5vphcxpwos2snI06yfDTmWIfXcr1Yc7vhevFRELqUNpxmZ7+/RL5Q15p0K0WfFROsaEU5KQOn4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR09MB364267

SGkgQ29ub3IsDQpPbiA5LzE1LzI2IDE5OjU4LCBDb25vciBEb29sZXkgd3JvdGU6DQo+IE9uIE1v
biwgU2VwIDE0LCAyMDI2IGF0IDAzOjU1OjUxUE0gKzAyMDAsIEFsZWtzYSBQYXVub3ZpYyB2aWEg
QjQgUmVsYXkgd3JvdGU6DQo+PiBGcm9tOiBBbGVrc2EgUGF1bm92aWMgPGFsZWtzYS5wYXVub3Zp
Y0BodGVjZ3JvdXAuY29tPg0KPj4NCj4+IERvY3VtZW50IHRoZSBNSVBTIEJvc3RvbiBib2FyZCBj
b21wYXRpYmxlIHdpdGggYSBQODcwMCBiaXRmaWxlLg0KPj4NCj4+IENvLWRldmVsb3BlZC1ieTog
RGpvcmRqZSBUb2Rvcm92aWMgPGRqb3JkamUudG9kb3JvdmljQGh0ZWNncm91cC5jb20+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBEam9yZGplIFRvZG9yb3ZpYyA8ZGpvcmRqZS50b2Rvcm92aWNAaHRlY2dy
b3VwLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEFsZWtzYSBQYXVub3ZpYyA8YWxla3NhLnBhdW5v
dmljQGh0ZWNncm91cC5jb20+DQo+PiAtLS0NCj4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcmlzY3YvZ2YueWFtbCB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKysNCj4+
ICAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZ2YueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9nZi55YW1sDQo+PiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MC4uMDYwOTEwYzliMDRmNDgyYWVlNmYwOGY4ZjcyMjMyYWNiYWQxMThiYg0KPj4gLS0tIC9kZXYv
bnVsbA0KPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2dm
LnlhbWwNCj4+IEBAIC0wLDAgKzEsMjcgQEANCj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4+ICslWUFNTCAxLjINCj4+ICstLS0N
Cj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3Jpc2N2L2dmLnlhbWwjDQo+
PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwj
DQo+PiArDQo+PiArdGl0bGU6IEdsb2JhbEZvdW5kcmllcyBNSVBTIFNvQy1iYXNlZCBib2FyZHMN
Cj4+ICsNCj4+ICttYWludGFpbmVyczoNCj4+ICsgIC0gRGpvcmRqZSBUb2Rvcm92aWMgPGRqb3Jk
amUudG9kb3JvdmljQGh0ZWNncm91cC5jb20+DQo+PiArICAtIEFsZWtzYSBQYXVub3ZpYyA8YWxl
a3NhLnBhdW5vdmljQGh0ZWNncm91cC5jb20+DQo+PiArDQo+PiArZGVzY3JpcHRpb246DQo+PiAr
ICBHbG9iYWxGb3VuZHJpZXMgTUlQUyBTb0MtYmFzZWQgYm9hcmRzDQo+PiArDQo+PiArcHJvcGVy
dGllczoNCj4+ICsgICRub2RlbmFtZToNCj4+ICsgICAgY29uc3Q6ICcvJw0KPj4gKyAgY29tcGF0
aWJsZToNCj4+ICsgICAgb25lT2Y6DQo+PiArICAgICAgLSBkZXNjcmlwdGlvbjogQm9zdG9uIEZQ
R0EgZGV2ZWxvcG1lbnQgYm9hcmQgd2l0aCBhIE1JUFMgUDg3MDAgYml0ZmlsZQ0KPiBJJ20gbm90
IGNvbnZpbmNlZCB0aGF0IHRoaXMgaXMgc3BlY2lmaWMgZW5vdWdoIGF0IGFsbC4NCj4gSSBoYXZl
IGFic29sdXRlbHkgbm8gaWRlYSBmcm9tIHRoaXMgZGVzY3JpcHRpb24gaWYgdGhlcmUncyBldmVu
IGENCj4gc3BlY2lmaWMgRlBHQSBpbnZvbHZlZCBoZXJlIC0gdGhpcyBjb3VsZCBtZWFuIGEgYml0
c3RyZWFtIHVzZWQgb24gYW4gQWx0ZXJhDQo+IHBsYXRmb3JtIG9yIGEgWGlsaW54IG9uZSwgd2l0
aCB0b3RhbGx5IGRpZmZlcmVudCBjb250ZW50cy4NCkknbGwgZG9jdW1lbnQgdGhpcyBpbiB2Mi4g
RldJVyBpdCdzIHRoZSBpZGVudGljYWwgYm9hcmQgYXMgWzFdLCBqdXN0IHdpdGggYcKgDQpkaWZm
ZXJlbnQgYml0c3RyZWFtLsKgDQo+IEknbSBvbmx5IGhhcHB5IHdpdGggRlBHQSBiaXRzdHJlYW0g
Y29udGVudCBiZWluZyBzdXBwb3J0ZWQgaWYgaXQgaXMNCj4gdmVyc2lvbmVkIHN0cmljdGx5IGFu
ZCBtYXRjaGVzIHdpdGggc29tZSBjbGVhciBhbmQgb2J2aW91cyByZWxlYXNlcyBmcm9tDQo+IHRo
ZSB2ZW5kb3IuDQpJJ2xsIHNlZSBpZiBJIGNhbiBmaW5kIG9uZSBmb3IgdjIuIEEgdmVyc2lvbiBp
ZGVudGlmaWVyIHdvdWxkIGFsc28gd29yaw0KYXMgYSBTb0Mtc3BlY2lmaWMgZmFsbGJhY2ssIHNp
bmNlIGl0J3MgdGhlIFNvQyB0aGF0J3MgYml0c3RyZWFtIGNvbnRlbnQgaW4gb3VyIGNhc2UuDQpJ
J20gbm90IHN1cmUgYW55dGhpbmcncyBwdWJsaWMgdGhvdWdoLiBJZiBub3QsIEknZCBrZWVwIHRo
ZSBib2FyZCBjb21wYXRpYmxlwqANCndpdGhvdXQgYSBmYWxsYmFjayAoaWYgcG9zc2libGUpLsKg
DQo+ICBJIGNhbm5vdCBldmVuIGZpbmQgdGhpcyBib2FyZCBieSBnb29nbGluZyBpdCwgbGV0IGFs
b25lIGZpbmQNCj4gY2xlYXIgaW5mb3JtYXRpb24gYWJvdXQgd2hhdCB0aGlzIGNvdWxkIGNvcnJl
c3BvbmQgdG8uDQo+DQo+PiArICAgICAgICBpdGVtczoNCj4+ICsgICAgICAgICAgLSBjb25zdDog
Z2YsbWlwcy1wODcwMC1ib3N0b24NCj4gIml0ZW1zOiAtIGNvbnN0IiBpcyB0aGUgc2FtZSBhcyBq
dXN0IGhhdmluZyAiY29uc3QiLg0KV2lsbCBmaXggaW4gdjIuDQo+ICBTb0Mtc3BlY2lmaWMNCj4g
ZmFsbGJhY2sgaXMgYWxzbyBtaXNzaW5nLCBhbHRob3VnaCBpbiB0aGlzIGNhc2UgaXQnbGwgYmUg
dHJpY2t5IHRvIGhhdmUNCj4gYSBtZWFuaW5nZnVsIG9uZS4NCg0KTGlua3M6DQpbMV0gaHR0cHM6
Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL2FyY2gvbWlwcy9ib290L2R0
cy9pbWcvYm9zdG9uLmR0cw0KDQpCZXN0IHJlZ2FyZHMsDQpBbGVrc2E=
