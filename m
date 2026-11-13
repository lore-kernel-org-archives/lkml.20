Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794584332;
	b=CXaFe7wZ8033WgMotNvm6z/tUfbCnGK7/MikRUFuwvj9wejmu97/CgIIN+5ZXu5m7NyE
	 sLHNQ8Ue+jPfGlqksyPCAJI6PM7hx5DcCiryzWQ59T3Loyq+Y6oc+xd4nfft5Y4/GdZGT
	 HPMOXqs5Rk2A/hoFFk77/TB3bC/FabAMzpoqTeqtXVvTFcFjJf5JkqVQjfCr04Ye/5Kt3
	 J6LeLX3DqyUgOkyIs47BgvDSEONGwJFzVIw6FhwGDjy8yPEZh97ZWBEWN6gOOY18SQFBg
	 B4Hf/cokjFUIGHm529+CeMTnORzIaLKgxHbXUJMpdj8Ir2qomkRuKCBcIKaRXQbTFOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584332;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=tajjZCCyQqa0wsfxM/YWzJN75onxCBmeCEQ4wb6aivo=;
	b=idGON1HoDW/Yadf7QCJtB6JZXjcPEfEyBo0fUi9zPJeIXQ2BYp38drFK0i/zqo015hIl
	 +nVjbMIods4N+Oq9JPSxFRKpJGeoPJL0D7AAkw/ABzhiVtHYjFSmjVQ0+0OSb2gcOrXY0
	 Pfw1Z/MVr212zgxaqwtkxgFzFCdJWE/MR3GawwNzgslJb54/TMMqZ5JTb0Bn7Z/gMPorr
	 TAMHFB1TGOMLb5y93WKQHP6PgE50WTJARnT0UT0tc1QYF4fHnBrSiLv4dGHOsVAeR/okc
	 tnFg9yHeBJWw0BFj5QvT5ma3F9nrucshUWiTLm7DWApYIsxdiLArN4xlk//4mCK1gCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Xr8k7dGt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.53
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010053.outbound.protection.outlook.com [40.93.198.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C284606A327;
	Fri, 13 Nov 2026 15:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C284606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Xr8k7dGt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Owv2oC6JndNZQ4bWJ76TV6AZQHBRLt4PKDBTESI3hC8effZ3TO5NcmEFIh+bI0rpMPRNbCzUOv073aBwsfp+Cr8Fmp0F+as9ceXKBvWXigA3z6S8tRVAwihOAo1lGIn+OABXUYo3yrnWL0NANor8yYRf/pXdl60iBpejVtzAjso1Typ9dkqhQD6fvrY2kf23P/sSzMInQH8+72v4kWVq2JkrpI944NEl2WTUVLCqIzFGJhV82a0Mq4kCF2kcK87TVaC9nRFnjbGdfbpo5AKHUSZy04c5l7sgP+V6ci7rssw4M6pdCyzyFKEbJp2EJibmPpS3dqEcf9Tz4aY2k+w+ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tajjZCCyQqa0wsfxM/YWzJN75onxCBmeCEQ4wb6aivo=;
 b=xpPIt2UPEYOBujOK1+0YYR1C0kxCv6kB4H6qyD7yW/p0de/1CW5mZERTnDrdjhBq/cNka+mKLcaEKs7CBc42GJ2u6tfx1FgFBYcNATIzBOJ0CLpS4z16SgnsQwOYqUPl/38e9masMNgz/aDTVy0ptIdQX+6MMCxcHwqyFc9uNvtJrZupa+zu+1bH4bXP0OIiXTf+/WCi5bA2RsSq7UbWnYUMCPBH4n+dELx5iEJDT+iHfPcZQMAk3RBWwppjvr/vMWfWaVsuEp9T5NVH4JDjDvj8O8CSqovs9mtb1d6ql4Zj20CFJMFvcwWP2DJhpqBQo+l2TgQ9VCzIi3cHsaejCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tajjZCCyQqa0wsfxM/YWzJN75onxCBmeCEQ4wb6aivo=;
 b=Xr8k7dGtvhpZVXzoagRd2phn2nU9fraOQSTVwTuuaC4OAnD4LgC6SWp/Tfn6qL9pMrKq0BXbw3sEwqISNRdBr6oNUUTgUKg7rCsjJtIH6QJ5B9nLSdfad+q5yJ+PN1lqme/E+Oo22EMSzBYLZ+tUOTQ9OKHiQ2KmyeW5jGCR465+fZGd/gKXiTO+6xz1my1w8Qyu99Wbi/m62tpa2pPHIo7EhBLwI8pOzXXlloNQ1ByIAu7JReQPVLflGKz0AsXkr4yvrM731BtEwWVwUqq3YYe08nzGAQ43opuHsgy2zsmhX5u99XnJiJQijyM/a+WlKWTylrr9y30WZpZVKCqdKg==
Received: from CY8PR12MB7290.namprd12.prod.outlook.com (2603:10b6:930:55::13)
 by CH3PR12MB347562.namprd12.prod.outlook.com (2603:10b6:610:367::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 15:38:48 +0000
Received: from CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc]) by CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 15:38:48 +0000
From: "Qiuxu (Leo) Zhuo" <qzhuo@nvidia.com>
To: Breno Leitao <leitao@debian.org>, Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Qiuxu
 Zhuo <qiuxu.zhuo@intel.com>
CC: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rik van Riel
	<riel@surriel.com>, "kernel-team@meta.com" <kernel-team@meta.com>
Subject: RE: [PATCH v3 2/2] x86/mce: Rate-limit the CMCI storm transition
 notices
Thread-Topic: [PATCH v3 2/2] x86/mce: Rate-limit the CMCI storm transition
 notices
Thread-Index: AQHdc2+Xiee38t2R8UOZprEfA5wyqLcsIwag
Date: Fri, 13 Nov 2026 15:38:48 +0000
Message-ID:
 <CY8PR12MB7290CC3725299D8009357253D17F2@CY8PR12MB7290.namprd12.prod.outlook.com>
References: <20261113-mci_ratelimit-v3-0-ada38c5a6c88@debian.org>
 <20261113-mci_ratelimit-v3-2-ada38c5a6c88@debian.org>
In-Reply-To: <20261113-mci_ratelimit-v3-2-ada38c5a6c88@debian.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7290:EE_|CH3PR12MB347562:EE_
x-ms-office365-filtering-correlation-id: db570403-bdde-4113-3208-08df419c35a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|23010399003|366016|38070700021|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 geSGNq7v/2Mma6lnaujlsmqIDeYbBSliUjSL1jdenCniOfMidK3oW5cDJigNpxCubwcaNT/rVMcpktCN0LDSJg3iR6ZWMuj3EOkz3dnSOT+ZxKTGGIbOcMstsmcmzFvSc3hrjGtazClpVUA20LsUP7HWv+N65CmFXxPGo8xo3N+rBlfuyGjt0bJmXPgpcfc3B0KC24iDvBdQB8dsbh07+TLsOqyeUDRSgi3A70zR5mnHEpwNrmG1g2yUFGKHfnovW11mu85HOaqFxVLDRSZyqhguOjhI8CHr7b4q6QqzFSz8YhD1GdSjPJ4Oun3IP8dhQu3XqyzqX+n5p7yGNpP9o0svNvjzYceicpXJ1ow/3daWICkXQ3wQjGzqCpXTKq3Oy7VxyFdNUrUuWTVRV+RytauWNAmZngt566lw8UTt6xuJBXctmAi1Tf1i01P9AA1WycHhMeLOUxN4ulAPmwqz2ZaqN6hp+cXPjzWDK72miPhB9dl6pWW6Su0b5z2NUghzyZ2PPfW8WglKnGenZUC6TX6/RhUO0eBxNgnXWjz0Y726SrZo79fqWz2V9yb128cxxp/evsyiO9j3pKB+iTO7evLx4s0E/X38BmqRMJEtShCX/QZrl/74UUkJzbHTp2bxxcakNsZnP6Q0DrV/I4Xg1aFR3TUB7WOiKnA9Bp4KsP5nKwmyUQK8kHIbw8d7gXb7bbD2YKhoDDtts0ZOGA/pfQHw1oYhKZxK1iTpirYlnro=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7290.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(23010399003)(366016)(38070700021)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWFoVThWakVoZGVncXFXeng1ZUhTUHlYU0xwa2hZM1VuQ3BOSU1pdEUvS3Nm?=
 =?utf-8?B?VkhvRysyN2Y2c3U2M2N2VU1aL1psdVR0d1JsTTNDbGFvTTA2ZzkrNUNMOWRT?=
 =?utf-8?B?QWNnVllrWlJRc254Tzhuamdmc3JqUnhSOHhKemlCNUxRUk9MV2xrYTBjZDd0?=
 =?utf-8?B?UVlaalh4S0dsWEQ4V2FaVzlpcXdiR0JGbDlvcDh4Z3E5RGd0bzkvNll5OWVP?=
 =?utf-8?B?dlZFeWFQNU1Pdk95aXJCY0FHaDVGbjlNQ0tVSS9pUGhDRnhGT1plWW5QRXJX?=
 =?utf-8?B?OGNWL2w4NWtzbXNCSFpYSFpxRGluNGI5OVFlSjlxT0pKd3EvdFBoZTNhRGhx?=
 =?utf-8?B?TU1hc3dKNWxyT2VEa0d0TXdsYXdzVDdWallxZ0FRekIxMzhNTmtWK0tPQ3VM?=
 =?utf-8?B?dlQzSDhpbXlIUFhUL0YwNktBSFh5ZkRCS1pkdkJJME1vVFFMTTg4WlBUTDhm?=
 =?utf-8?B?WFlvYWpERHFEQ1AwSmVZOHM0TzNYM0svNnFYek9wSnkxQ0FSMTZTM3kxcmxB?=
 =?utf-8?B?Z3JiQVM2OEt1d2lzbDNrdDZTcHozYVZBb0dkcko5d3huWFlBT3djdzRRb3NR?=
 =?utf-8?B?Y3V3dE1MMFRHRlBaTmhRSUg1SlFOSFFjamJqVnJFaUdBZkFjYWRwYmtCWHlI?=
 =?utf-8?B?QzVieC9nR0dkZ0Jsa0U1NTUyWHVINy96NlNTdWR3Ti9maDl0aVV4Si9VSG15?=
 =?utf-8?B?VE01dmVUYnc5U3FyRE9PTWFFUjg1aGxGVDMzNlhCZUxoYlJZOUhXWGhqbSt0?=
 =?utf-8?B?M0prSC9TK1RGRjRUYTZrSGJwaU9KcU95SmJaLzBnMy8vTG8zYnBuU00wOVI1?=
 =?utf-8?B?cldMcUdLUEhpanVBcW1JSUZLQmxBbG02dGxGdEZxcE5SSXRuRzltMkxsc0hM?=
 =?utf-8?B?RGszWmRFL1NLZEJlUFhBQlphK2JySTZpMTZ2Vzg2YnphR2FueENRRU04OGtw?=
 =?utf-8?B?V3dsZVlrQjdVRHFIalpWdisySG5JNTNGK3ZUOHUxdUgzTUtzSXoyU0hPS3VG?=
 =?utf-8?B?eTc0NGZ1dUltZFZFa3MrdGUwemZ1eFlOSTd4UlZlaUxEY0NJNGt0dzFoa1Mw?=
 =?utf-8?B?QVFaajM3MXh0RnlsMUFEbnRFeVNCRzA3NEQzUVo0NkQ3alhTamszMm9CTlBp?=
 =?utf-8?B?bHZra1hSbzE5dUZRYlRYYlp0YmtlRUN6R24vOUwzNWhiWkREM0RvRFVMblpz?=
 =?utf-8?B?S2lmcnBCeUgyMjgzOEZoNm1CdnZjZjRlRTZyQkMwQU1qR29hcWpaek0wb0lL?=
 =?utf-8?B?NWVQR0RoQlVuZmZzVGhLYldXR3UzQzJCZmNidmQrKzRmcTYxV2RVeVR5MThN?=
 =?utf-8?B?MUlXZjkyUjQ0TWVBWW5pOUVyMTBjRFkvK0dUeVB5dnFRcUpDbG5tVlI3eUxp?=
 =?utf-8?B?RFNEdGpUdWVOUmtMUWVjcmNSTWVWTy9hSGpLQUJsM1B5Ly8xeWlyTEp3a1Yy?=
 =?utf-8?B?Vng4ZWQrQnpQS1pvK0dNVk5XK0x6ZVZUZ2NJMlpYek9UZWE1UTkrb0tRNTdh?=
 =?utf-8?B?ZEFPeXZUMHQrMFU3Ry8rS2xqMFhyUHl2aFdpS3AyaFdoWXk3a0ZVVGJJVDha?=
 =?utf-8?B?TG1UNXNoZThzREh2cEtmMkFvVUxnVXFvNDZPZk9IVmVic1FTd1Q5eUt5RjZs?=
 =?utf-8?B?dEdLemdIaDVoUFBMQjlFR2dYbkhlbTNsQVp5N05vUnArejVFR2J1bDNWb1lq?=
 =?utf-8?B?MWhjcjJscHhNZVpVRGJNdjdlYnY2MDFsd3JtRUFiZW5kaTdJdDNYNlRCQmlX?=
 =?utf-8?B?N01lSVRRK3cyUTZ0dStna3dZR3hhZnpKTmFROUxhZDI4M3FLR2tYMzJOTXk0?=
 =?utf-8?B?UVdWNmVHSVIzU3ppaFBoajdQK0hZSll4V2lua0JPWjhLNnF6dkdsYUFEazdY?=
 =?utf-8?B?aEMreE5JekNESmRxNUoxdFdmSDUyMEkvU1FiL1h0S1d1Vlg0eGFBaTdWeXJR?=
 =?utf-8?B?bU40OTFSR2tPVzRJQmNtVjJ4QmwySElUOEQxblRpUVEzcTlHLytTMXFGSmNW?=
 =?utf-8?B?WFpJY2tsQWVBNzcxbndKYmtQdkdsZGZOTm0vZDJoRFR5emttVFdKRkYzd3g3?=
 =?utf-8?B?dGNScXo1RzZzblZHM01YbHBDZWpRaUpEUmtMVkU2SHlIUU1hcFRIckxHWlVP?=
 =?utf-8?B?ckRRU25lL0wzclM5aitIVlF0QXB4aDdMWkhhMXZXVTJWdjhMcStidkdTQUZy?=
 =?utf-8?B?N0NPZ25ZU1VaQmpzL1Vrb0kwUm1MTHpCWit2QU5SaEZQNHFNdG11RGdLeFFE?=
 =?utf-8?B?aFFZVXVyQitVZHZBWHpNNUVvMllUNDFKenBKMzBPVlIrUEZTMWJCS1NPb3lB?=
 =?utf-8?B?dnp3dDJLM3V4YlhQUUJta2Y3YlFqNkEvZG1yRVRDNS96ZHlxdDduOGhZVnk0?=
 =?utf-8?Q?VSZavh8j1H8abjYRogLVnKjY0m1CpDZ8n2Sq/?=
Content-Type: text/plain; charset="utf-8"
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
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7290.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db570403-bdde-4113-3208-08df419c35a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2026 15:38:48.0265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FnCMF6czrg/RbW8dZ70DCpfFRD6nxX4CrMLhxFlHboN6sb43K0SNv2hPb1U6ijWstVZMs6L8qaitXwjRxBGdLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB347562

PiBGcm9tOiBCcmVubyBMZWl0YW8gPGxlaXRhb0BkZWJpYW4ub3JnPg0KPiBTZW50OiBGcmlkYXks
IE5vdmVtYmVyIDEzLCAyMDI2IDg6NDkgUE0NCj4gVG86IFRvbnkgTHVjayA8dG9ueS5sdWNrQGlu
dGVsLmNvbT47IEJvcmlzbGF2IFBldGtvdiA8YnBAYWxpZW44LmRlPjsgVGhvbWFzDQo+IEdsZWl4
bmVyIDx0Z2x4QGtlcm5lbC5vcmc+OyBJbmdvIE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT47IERh
dmUgSGFuc2VuDQo+IDxkYXZlLmhhbnNlbkBsaW51eC5pbnRlbC5jb20+OyB4ODZAa2VybmVsLm9y
ZzsgSC4gUGV0ZXIgQW52aW4NCj4gPGhwYUB6eXRvci5jb20+OyBRaXV4dSAoTGVvKSBaaHVvIDxx
emh1b0BudmlkaWEuY29tPjsgUWl1eHUgWmh1bw0KPiA8cWl1eHUuemh1b0BpbnRlbC5jb20+DQo+
IENjOiBsaW51eC1lZGFjQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgUmlrIHZhbiBSaWVsDQo+IDxyaWVsQHN1cnJpZWwuY29tPjsgQnJlbm8gTGVpdGFvIDxs
ZWl0YW9AZGViaWFuLm9yZz47IGtlcm5lbC10ZWFtQG1ldGEuY29tDQo+IFN1YmplY3Q6IFtQQVRD
SCB2MyAyLzJdIHg4Ni9tY2U6IFJhdGUtbGltaXQgdGhlIENNQ0kgc3Rvcm0gdHJhbnNpdGlvbiBu
b3RpY2VzDQo+IA0KPiANCj4gbWNlX3RyYWNrX3N0b3JtKCkgcHJpbnRzIGEgbGluZSBldmVyeSB0
aW1lIGEgYmFuayBlbnRlcnMgc3Rvcm0gbW9kZSBhbmQgYW5vdGhlcg0KPiBldmVyeSB0aW1lIGl0
IGxlYXZlcy4gTmVpdGhlciBpcyBib3VuZGVkLCBzbyB0aGUgbG9nIHZvbHVtZSBmb2xsb3dzIHdo
YXRldmVyIHJhdGUNCj4gdGhlIGJhbmsgZmxhcHMgYXQuDQo+IA0KPiBPbmUgaG9zdCBpbiBvdXIg
ZmxlZXQgbG9nZ2VkIDk5NzA3MjYgIkNNQ0kgc3Rvcm0gZGV0ZWN0ZWQiIGFuZCA5OTcwNzM0ICJD
TUNJDQo+IHN0b3JtIHN1YnNpZGVkIiBsaW5lcyBmb3IgYSBzaW5nbGUgYmFuayBvdmVyIGZvdXIg
ZGF5cywgd2hpY2ggaXMgYSBiaXQgZXhjZXNzaXZlIGZvciBhbGwNCj4gbW9uaXRvcmluZyBwdXJw
b3Nlcy4NCj4gDQo+IFB1dCBib3RoIHRyYW5zaXRpb25zIGJlaGluZCBvbmUgcmF0ZWxpbWl0Lg0K
PiANCj4gQWNrZWQtYnk6IFRvbnkgTHVjayA8dG9ueS5sdWNrQGludGVsLmNvbT4NCj4gU2lnbmVk
LW9mZi1ieTogQnJlbm8gTGVpdGFvIDxsZWl0YW9AZGViaWFuLm9yZz4NCg0KTEdUTS4gVGhhbmtz
Lg0KDQpSZXZpZXdlZC1ieTogUWl1eHUgWmh1byA8cXpodW9AbnZpZGlhLmNvbT4NCg==
