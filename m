Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021073.outbound.protection.outlook.com [52.101.65.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8788C4E2F28;
	Wed, 14 Oct 2026 12:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982474; cv=fail; b=m7i95I1Tb+palOgcYj/x3p7koT55X4ckeeHIAwEexps7x45TpFkGBv3JmEwGV1mptD1C6c/0eA9KkC6OKttwt+koJeP9hpWyRyHcNp23B3nWxyzSnL20bWkWSaoTGrXqoRx/USm9J4jCfOhopkQmy2DtF+PJHpY7Fc+BClCBQdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982474; c=relaxed/simple;
	bh=MErTHghmnsisVrM5OkaIZ2wrSGJuC4g7z1mNVkENkwI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BQ9vQC9MGT2NqVBx+DHbeYNo7J9SIWz+N0baZN69fKhUWCO/UulZe+srdZKHFuoYlZPBlzf89olcDtQxe0YNBr8JW9+3ubD9vNTYNAbD/7UG4lZtP2PUsmTkdp1cqeX57WV7ibNhRlTHat36QoZxcA6LFXVYwK2VyZ95qSJEz24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com; spf=pass smtp.mailfrom=htecgroup.com; dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b=sQw+63eQ; arc=fail smtp.client-ip=52.101.65.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b="sQw+63eQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JesN9MPFlqIVNn+446GzSRTf1kRcA3nT7wKha6S2PNt3TeAtnPlddSffGzL/xHypxcTE/59El5JKcgU1bnv2Fs41Ts5M0LcEyHSsdt8TDZuK57JrvEjCZHL561I1p+FgZZvyTmXWaWkPsLZASMR6/eAzByhtd/nXMiFKvxUQ5BbTlmzCZldzATdSs313CUJUHkIea3yW7hGkeGUQsZ7TsSlN1l2dGsK9tC8UoXSwiQZDU4AqIfswoVptn3P4daUWQyI7uIpYs1AiZCVk2+GDO3x8vv6T0Q6C4kFyN+CFjc9EqQA+MWRMQu001V0RoB1VIFQTs4ggZlPRkEX9Sy17Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MErTHghmnsisVrM5OkaIZ2wrSGJuC4g7z1mNVkENkwI=;
 b=wBMVbjH7G4iFf/qopp267/olz4rkBWkBEol4DRAY28c1I0swjkA+x08NFdath7+3nVrd/K3atqxemx77iT8SeGFGRhfNvA1xjxZyPp7uQzdIqXbRIO/we98jDZkSYXfTQ77d3P4Tp7HE6LNzQZNEQDVRsWrOjBxVMBmppr27uxarz9OFakp3mGzcRsdo6O5julgBvCvfK7FQmPdmjUk6LYo9xfqtKSzjMeGnqFxN+gsLSl4jDAnyy/8IDoyTkwwLo2wOAVpSyUo5NHZJ5WKD7sSCbzJ2QjSviTSFIVovaTrRXs1cWpysI7NypIYgFynxclHySjr1xwAZJtf0/V6hag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MErTHghmnsisVrM5OkaIZ2wrSGJuC4g7z1mNVkENkwI=;
 b=sQw+63eQmToO4gRhVripQvXkjJRXVte7MCppgPVirqL/9YI20gK9zTwRPUoMbBFdrTF0gP51IffVpFAgKuX40/A6ALVsqTPa5/CxVxGXFKBNGHQc1vPW2xSRAGoWBrbg/Ap2LgQcnvw4weaWqNR2Q0f7GDHlCs6jIZkrChzr5Q18uTTPQycZbXQHnllu1bN6En2F1OYO4PZq7dT7PAsEuxe1nOkCZ4rB70vY8h1srWtItFmf37BW+X8kg2izpEj/rL5pbkqe20MzDLeXBG/v6clrsir9pYy0ay1bZdmafP+RQbKtSK6/2JNyztiwvFd15N6hQbcqS+YvtkufKEe+bg==
Received: from MMZPR09MB547520.eurprd09.prod.outlook.com
 (2603:10a6:190:56::10) by MMZPR09MB055232.eurprd09.prod.outlook.com
 (2603:10a6:190:49::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 12:54:19 +0000
Received: from MMZPR09MB547520.eurprd09.prod.outlook.com
 ([fe80::5b5:f191:1ccc:f9ee]) by MMZPR09MB547520.eurprd09.prod.outlook.com
 ([fe80::5b5:f191:1ccc:f9ee%3]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 12:54:19 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "macro@orcam.me.uk" <macro@orcam.me.uk>
CC: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "anup@brainfault.org" <anup@brainfault.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "conor@kernel.org" <conor@kernel.org>,
	"daniel.lezcano@kernel.org" <daniel.lezcano@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Djordje Todorovic
	<Djordje.Todorovic@htecgroup.com>, "inochiama@outlook.com"
	<inochiama@outlook.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"radu@rendec.net" <radu@rendec.net>, "robh@kernel.org" <robh@kernel.org>,
	"tglx@kernel.org" <tglx@kernel.org>, "vladimir.kondratiev@mobileye.com"
	<vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH 1/9] dt-bindings: vendor-prefixes: Add GlobalFoundries,
 Inc.
Thread-Topic: [PATCH 1/9] dt-bindings: vendor-prefixes: Add GlobalFoundries,
 Inc.
Thread-Index: AQHdRFDMjousBHSoKECPSyesbZWZc7bP5TmAgALHoQCAKoC2gA==
Date: Wed, 14 Oct 2026 12:54:19 +0000
Message-ID: <6eb3e3d6-d9dd-4391-a205-f0695b57ac51@htecgroup.com>
References: <alpine.DEB.2.21.2609171247190.15569@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2609171247190.15569@angie.orcam.me.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MMZPR09MB547520:EE_|MMZPR09MB055232:EE_
x-ms-office365-filtering-correlation-id: c29f7ea2-2428-4a08-d2b7-08df29f242f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|38070700021|56012099006|11063799006|22082099003|10067099003|18002099003;
x-microsoft-antispam-message-info:
 rcbehlIeN80C85L8TE4vIyZOPz0NhRK/sCwVMHbJI3LjJeFNXmN6UaDKvp3+Q3N0yXgZjYSy0Ey07sT0qwXx5FMWHMWqmBQK0qNtvOWsBjVSWKurlbKeXNUiBaAOPbE1jjDHDex8m52nqSANQqq6TeaG4HYIu/KiO/wEQY4CMBAc54BPXu89cAw+S7fz8bRcMWsPExlAtL45DAGUm1I1DlnRsPQsYVgVfIlRHdaq5sunGX7/mRD3jm+OKOLm7VvJuX5xHy0rDtOZv/eKTrN5jq/GIdEJZ3T57enxsh3fPvBhrC9r/AUg1Dp0uf5DqcRw9qSjhSKatRoaIK7FzvGFE0UaCt543bhd9TrrzEZYPLfrMGzEzf76eL3ApsnYTZih+THx5JPD1lLDWyNnVqPHoIARlAerBFuGQSqCmDOwgSQzsvcP/rZ7HxSIilQrUAVhXqpHkkaI5UE5M0Z90lRAgqecYOhn/fIHO8l4xprgOgoda1q3jLZ8lerYB+neC2bqCOTXzWsFOjqkrbdTtYlNm854oYdbcHvvWvILhjCYd3hEy5b3s/B4O0k399+Sw4mFq11KNkxwZxB+sRerQ9qhk9K5N6cB9FIjHPjJkvC71X4b7/Z0pDuK0VliG0Ui6ESYSuDpJEqKLOq/TSoPievAgRrvqUltFKtbrfqbPsNI96NM4meqOwzI72Dq08QyPwAuK4kyG0CRasO7mNyq8uYzxww+qL0OPhXWnyjBY7joFLU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR09MB547520.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(38070700021)(56012099006)(11063799006)(22082099003)(10067099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MWRJdmFtWlpCTUo0aGNZVkVLazArd0xnZU5CNEg3bGthZm1RaHVXc0hiZU8z?=
 =?utf-8?B?SjBFU0g4QXlLVFg2a1NFT0dFM1VMd1MvVHpoWHA3VmtPa2FCNUlRTDVIOUli?=
 =?utf-8?B?b09OenFveVR1amVHSGl4b01tWlpENXpna2dVTG1PR3crOC9sWmVpbXlFS0k5?=
 =?utf-8?B?RGtlNWdxZGV1NVlleXJIYU0rVVJYOGJZbXdCeDhFTFNNQ0NaUlZUNUZNOGdC?=
 =?utf-8?B?K3d3bkNxSFJSZGd0dnYvZDcwM3dyMXhyeFRCd3pxdmIzaDZ2R0JkckR2a081?=
 =?utf-8?B?VVRpV2tVWGJqOHJlT3VMTW45NlRUc2pYUExrSjd6V0M1V3g3amx3YW1LNGZL?=
 =?utf-8?B?cTRGZ2hLVTZSajFVb1lkUzhoOVJCTFdLd1J1NVJidStaaUlITlI5bXd1ZTRx?=
 =?utf-8?B?QTlNN0NacG9EbHN6Vzl3bXlPa2VGNHEycHhyMGpOTUlmQXRCY29aS2piTzR4?=
 =?utf-8?B?cGZyZ0hjc0M3THRuV2Nka0Q5VVdFOGYxd2M5bFdjalg1NzR1MWxsNnFSTzZ3?=
 =?utf-8?B?bU13RTB0L0gvR3dqWmNSQTluaFVwVFFsRXVpcGtFU2M3WGtCQlZDcVhlRnVN?=
 =?utf-8?B?VjNwWDBrSmxrNjFkWXlvUno1a1ZmaEF2R2djSThUbFdXNkNUU0tTalZhd3NT?=
 =?utf-8?B?WWlDVmxwQVprYlNQZFBIcElHL2oyTkdoc3RlTHo3U3pNVzNINWo2ekh5YWZK?=
 =?utf-8?B?VmcwMHh6b3E3VGFVOUxjVnE2ZlNTcWEwT2M0RitERGUyQm9wbWorQzRnaW9w?=
 =?utf-8?B?NE5HRS9qYjZ1UnBXeEJocnBTSEtnMHdnTWk1WTRPaEd2V2ltcGVmNmxzWURR?=
 =?utf-8?B?cmpqL2hVTm5idlVGQ3hueFRUMml6R0ZjWWdDckR4RnRHWWhBcUxGejlZTDY3?=
 =?utf-8?B?MWVVdy9SODVRcXE3Q25MTitBV2VVZFh3MFZzcDQ0TzE5UVJEK3NwOWpMSGFG?=
 =?utf-8?B?b3NZZUlYeEJBeitBUTNvaW4xVlU0aWsyQmo3WHAxSlhFQmcxRWJQVW0wZHgr?=
 =?utf-8?B?S2hQTmtjTXBhSU5rQXFmWUZpeFp3U1lEMzN5YXc3eWMvN251S1J5WTlmSFVW?=
 =?utf-8?B?ZCtnbjZNVU9oVWtFNnUwV2xOQjZXWFRRNTlJU2h6bVRKYitVQUl4TkpIa1BI?=
 =?utf-8?B?YzcwSTVVbE1FU2w5MHd5cDlpVGZDTjJkWXA3S0FIK3l0bG5zWmlaVjhFVVVD?=
 =?utf-8?B?dExBcTV1L2pkb25vbTVWSmNVSUJ4WGJaaDdBMTU0NWtRWkFTdXJHMEMrTDFi?=
 =?utf-8?B?UzNYSUt5Y29HUE1YcUpNRVhiRTBWN2hCZDFxc3l2RVMzU1FuS3diS0ozY0Vn?=
 =?utf-8?B?QXF5Y1lFR2kwV2JuZm5FMnEzM3JjL3dLekQ3cUxxTHB5d2krZTJyRFpQanUz?=
 =?utf-8?B?UytkRTJhSE1UNWlDN1I2blZNZEU2NUVITlVUL0Q1ck9lUEJRazZnNjV0ZER1?=
 =?utf-8?B?d0RTOWE2dk9SdURVYmw1Qm9lNy9maUtUem5YSGdzUEJuY09mTndMNFdldDZu?=
 =?utf-8?B?WHVsRzJBVjFBUjRrRU1MSE9TTkVLK0xZVGlrend6M01kbWtsRzdQSHVWcWps?=
 =?utf-8?B?N1lzNnZ0ZEVsTUhObzJWNmZFeGNRMUU5d1BqU2pZeHNDaC9zR0tSYmlCRkRm?=
 =?utf-8?B?b2tlbE83WG1YQk9uWm1Sc081NWYyVk1JSlB3a3BzQkdjMXRJSmdGaDhwOHlV?=
 =?utf-8?B?TkhkKzlUdVU2MWtwdE5pUW1FV25ONElURmthbitXZGlNQkVaejBwTWZMVlNn?=
 =?utf-8?B?T24zQXZnbHEvRFdmdk9RbjNYc0NYVzdGQkVQZlYxa0hFYkdpeFZNVVVaQXFL?=
 =?utf-8?B?QlU4d2FIbXZNZjk1Q2Y3M3BlS0NNMlRRZDl3aVhKUFl4cW5hNjc5aDhXbUJ4?=
 =?utf-8?B?Q3ZJOXJobTMxQ2lrMG91VFd4MGg0aXJkREdwdk1MdzBtZElJOHY1U0xlK2ZV?=
 =?utf-8?B?RnNqbzRDSk9LTVdwak1mUkc3NVBtNXlwR0dCMXJ4akhhTnRPcVp4N0V0NWZ1?=
 =?utf-8?B?VmRTbXZGdCs5UzlFZ0piWFNwSm12R1F3T0FaQkdOQWlpZ1RrRkZja1VnVEpk?=
 =?utf-8?B?cWU3UWYySEZIZlhST09sRVdqNlltK1pIMmQ2WUgxTHF6NEdWRUVaYTh0MDBF?=
 =?utf-8?B?TWhVdTc3TEt6TVpmV09lNjAwWnlQMVF0MW5HbzJqVzFIdEtxT20zM3pKMk5o?=
 =?utf-8?B?KytKM2hLOEdJOEliM2g1VXhMZ3VVTmtwK2R5dndCQmhJcmhEQ1o0OUpSODdC?=
 =?utf-8?B?WkRWczZJc2I0bGtwRGRkbGlWK3g2cTJJdGFYTzFuME5MRHIyajZqVEZCTGZR?=
 =?utf-8?B?cGk0b2g2akF1VGFaMURlNlAzRjdyUndRbWZ1RmVQRWV5U29OY1o0aGpTbjIz?=
 =?utf-8?Q?7j4OeOh8+/xuwoAM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D57B0E49DBA504E990B26C97C784132@eurprd09.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c29f7ea2-2428-4a08-d2b7-08df29f242f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 12:54:19.1572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PnTa74JUhHi7Uehrzv5M4YnCWskViw7xsC6XTXfTy31rGTQPFWEsnRDu8vsFqs1NKwJT4kmQtnrbtcUaX+DAKLIzkgzFtpYaTXEG0mvcK2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR09MB055232

SGkgTWFjaWVqLA0KDQpPbiA5LzE3LzI2IDEzOjUwLCBNYWNpZWogVy4gUm96eWNraSB3cm90ZToN
Cj4gT24gVHVlLCAxNSBTZXAgMjAyNiwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPg0KPj4+IEBAIC0x
MTA0LDcgKzExMDYsNyBAQCBwYXR0ZXJuUHJvcGVydGllczoNCj4+PiAgICAiXm1pbml4LC4qIjoN
Cj4+PiAgICAgIGRlc2NyaXB0aW9uOiBNSU5JWCBUZWNobm9sb2d5IEx0ZC4NCj4+PiAgICAiXm1p
cHMsLioiOg0KPj4+IC0gICAgZGVzY3JpcHRpb246IE1JUFMgVGVjaG5vbG9neSAoZGVwcmVjYXRl
ZCwgdXNlICdtdGknIG9yICdpbWcnKQ0KPj4+ICsgICAgZGVzY3JpcHRpb246IE1JUFMgVGVjaG5v
bG9neSAoZGVwcmVjYXRlZCwgdXNlICdtdGknLCAnaW1nJywgb3IgJ2dmJykNCj4+IFRoaXMgaXMg
c3RhcnRpbmcgdG8gbG9vayBhIGJpdCBoaWxhcmlvdXMuDQo+ICBUaGlzIHNob3VsZCByZWFkICJN
SVBTIFRlY2hub2xvZ2llcyBJbmMuIiBGV0lXLCBhcyB0aGF0J3Mgd2hhdCB0aGUNCj4gY29tcGFu
eSB1c2VkIHRvIGJlIGNhbGxlZCAobm90ZSB0aGUgcGx1cmFsIHZzIHNpbmd1bGFyKS4NClRoYW5r
cywgd2lsbCBmaXggaW4gdjIuwqANCg==
