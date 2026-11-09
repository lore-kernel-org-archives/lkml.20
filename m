Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794220121;
	b=oU67lC8dlxUmv+taqJZXlNcI3EgD5gmB46T49MeVj7aDDWNnH2TUXFs7pNRqbhJ/cvaL
	 h4S9qw/zPG8fB4WE+9wWnPeOLBOQBzZ8NIJsqnU4SgBk1djaPf4BuJhzVmlM/TmO21o0R
	 ti5qt4luRimsW0Uv8muqqtZya4WJFGO/v6SjVj8eTkbMUg/vBf9GGDJycKPNgpd6/RSvl
	 tCsUuP5k/uEHTqElMO/FhPft3nNvtX7zcNoH/gg4xhU0VHF3GIrZWTmw5iPg0HndctZhu
	 3pvL06krTIDM3b9ya4mg5shBkb5iqA5M7cY1XeifWmJkQDTvb6azIOXG27WnXK3kCTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220121;
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
	bh=uRtHK259Uyo4BEJBmeQTnGXDYL6FkcvV+BmCbaFcibo=;
	b=5T1YQYbp6wkwXTO+yVehsIxalQgXJEnSpnYNgwMmueeUWFrd0rq0PVCAccXzNPjN1brF
	 Dm+ljqbvVIXF0arY2oc+rHm81Ct9NPIIaOCnH6YOZDXlHjh+JA+KocPMCaURr66KBPGTe
	 eim6EPNuVosla58tpmIJkf8L8MifYdSLLDiTx0KxyzIOXsjHibZxC0RvOTulsnxqhQ84H
	 B8PiMIhmsbS4Soo0g4e7hR9Z6kFYvWcR9GgNd5sk6XbW8AReQ3nkhCjPjUb32co0qJ64j
	 96F5ic3BR7DPMZqMrWotZZhbgrVYGmntfmi566wMPpwhMQ9bexqYKXVuFSVWJOB1DvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FrT7Ft1L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.60
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013060.outbound.protection.outlook.com [40.93.196.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D9D606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53D9D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FrT7Ft1L
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dnmhVrE4Q1r+Q+eCdAj1KHhk0VwuXLN0njhs2vIxqSaSHKGDXiCqY0yhUfCnnh6wJcWfS5V3KJrEa4yBN62J9dKfCEk7mN9X8w4Nvhp8GWDHb9KiUmMWMyz6T3Xuf9HdTsFKVFqD1TqftRfDzCj8G72Ta9jG5NZ81rDGUVe+H4eUlEaoTwo5tfOHuZJ3T7B1cSaWReBKXaWeN9QU2JfdCEm43bcrFBDvUpu9RR1MXvZsFriSatPfoYFBV7R1Jb2xfPPupPHj9rt7FoBJefm6J32p6AHLZUvBALZqpS9wHUSeX59w7XlWQzy/uZxQRwxrsfNWmykXyoWNTzMrQ79CRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRtHK259Uyo4BEJBmeQTnGXDYL6FkcvV+BmCbaFcibo=;
 b=DC/By1bNYzuf3efNyzvTruynBlEdzw/WQRI5FVUS1W/7r37imt//2rOvF1cZqIMjiZN0AoI7HjqP7gHARVmY18ATBs4Qz8gswhcUQer5cne5j+HSuirVXEW6qD/DtFgh1zm0AM3zASO8oX9niFR24eWg/lPibUSfB2PxJN8L+3eA5n2Ek2hR0oS1AK+nZzG9rGOXhAOHg5tEN6lIHgTxhGQxCZW2uierAGOFSr7pQv6bs/UeVBrd4mjuD1KkOCfGBO3mXYIqenAakKeKH3xQgGCtnz7mM1B1jnw/lSLDAKCDhZ2UHrjJN3QH4vxem8U5CI+bPY1YY2xGFHkHw3npFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRtHK259Uyo4BEJBmeQTnGXDYL6FkcvV+BmCbaFcibo=;
 b=FrT7Ft1Le1n93rcczQwqH2tEx82byBIk8wtn4pagmgKg5Nxkup9IsfaT3YxvG0NXikCTR9ZdoVVSxwlhVo++eFit6XOQpE0JzX8dJQlNzgAB9MSDkTi8km+LHLV8C8yegqSAttHgV5oYl4B8F4+ghuBSN/gIJhNDJFY/U5UOTDQ=
Received: from BN9PR12MB5259.namprd12.prod.outlook.com (2603:10b6:408:100::17)
 by SJ2PR12MB8977.namprd12.prod.outlook.com (2603:10b6:a03:539::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 10:28:29 +0000
Received: from BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed]) by BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed%2]) with mapi id 15.21.0592.007; Mon, 9 Nov 2026
 10:28:29 +0000
From: "Garg, Shivank" <shivankg@amd.com>
To: "pfalcato@suse.de" <pfalcato@suse.de>
CC: "Rao, Bharata Bhasker" <bharata@amd.com>, "rppt@kernel.org"
	<rppt@kernel.org>, "ankur.a.arora@oracle.com" <ankur.a.arora@oracle.com>,
	"vbabka@kernel.org" <vbabka@kernel.org>, "david@kernel.org"
	<david@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"surenb@google.com" <surenb@google.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "Salunke, Hrushikesh" <Hrushikesh.Salunke@amd.com>,
	"liam@infradead.org" <liam@infradead.org>, "peterz@infradead.org"
	<peterz@infradead.org>, "mhocko@suse.com" <mhocko@suse.com>, "bp@alien8.de"
	<bp@alien8.de>, "ljs@kernel.org" <ljs@kernel.org>, "Nayak, K Prateek"
	<KPrateek.Nayak@amd.com>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v2] mm/memory: drop PROCESS_PAGES_NON_PREEMPT_BATCH
Thread-Topic: [PATCH v2] mm/memory: drop PROCESS_PAGES_NON_PREEMPT_BATCH
Thread-Index: AQHdcBbDv5xaImtpIEaeMVl7xxEmfrclhWcAgAAEhwA=
Date: Mon, 9 Nov 2026 10:28:28 +0000
Message-ID: <490893fe6ead90740ccd1fc1011004d03e49a27f.camel@amd.com>
References: <20261109-clear-pages-batch-v2-1-2e62c4f84f94@amd.com>
	 <avGbPpm3-Yrapry8@pedro-suse.tail5790ac.ts.net>
In-Reply-To: <avGbPpm3-Yrapry8@pedro-suse.tail5790ac.ts.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5259:EE_|SJ2PR12MB8977:EE_
x-ms-office365-filtering-correlation-id: ca03f13d-111c-40ba-823d-08df3e4c321f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|23010399003|1800799024|38070700021|11063799006|4143699003|56012099006|261021123027099003|261026121527099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 lQ0lLpAp+9UXKcwxw2OFGVjGZLy69ig5cCbkvX87Vu5bQXoxzwBVx3d1f1irNPrly2WF7z6B1AYii4QZK9riDDeLwviUdyZJz/sYQTk2D/lc2eDYC+Ws7wHfxouAQ2f8tRQ5Gnb0oKT9Mfahh0FkYbMAM+RLcW10h8e5YN1TOrd8cqgw0ZEHwnE3Kskde6dOrITLbgGt9951rBBDWcaS9gA9aBCwQDvO3Q+w53m1EZOQ02sPJ4jIa46jInb5ElQJK3/UhCDYqsbPkoH1ZpKM+f/sKNuDz7s2aSc5apExQVAZmaE/1cA2kapof4qEpJ5Ha5JFTxlii7gKauid71WU/gzpLLOrnl6WmViXXZnVLpbwxZv0i0M2M1L12kaCsDWEpd4g69DWGtAbvzD9cCyeTLeqfo2CfxwUpg3k98CR+/fWW+juII8zXE34Xd9/y5I7YusMuW8y6Sybda64UD/3VVVgHr4NgsY+mnZHo2GnP+ttgB56a3Wi/oSU/AAtuePQiN1Ilwtc07/1ld/HTHL5WbMpLPUUHn+BmLSE+I0HTw96vWobIinybI3tByKotSTKfYQzfPw2+sX2/KB+bkkGtwGndow5UYuZnf1gU3LzkQ8rmE6i6XXE3HoQ5QtE8HvFYw4/n3u3VHJcEQx0oo8LVObEt17qrU3aSRZd0BTdVhPrCQ/7kuzVHbrSyxM31veyzGuCWwg6psVEXgFEEbKXjw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5259.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(23010399003)(1800799024)(38070700021)(11063799006)(4143699003)(56012099006)(261021123027099003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M05oaHNSS3lJUjZRQWp3R2RlVXNTWUx6aEd2TVVGMjl3c0YwMFB3TWl5OVRl?=
 =?utf-8?B?b1R3VUtSRld5U3o3Tmc2UnBqMHgzOFZpbHBVTkFjNjBJeWFndERXZFBkd1J6?=
 =?utf-8?B?UG5SY08xeFNvSFk0WjJxdlRkUFVhNjRJeFRvZ3NpZmF5b215Ky9TZ1ZvaWE3?=
 =?utf-8?B?aE15ZTVNcVBEWEszbGJwQ3NrR1JrVFhvZlhwS0djeU1Qdm00VnpUV1ljWFJp?=
 =?utf-8?B?Wkd2MCtpUzIzendOeW5uS3R0MWw1U0NCcVZZanQ5MUQ2bFMyY2FhSFJ4SDhx?=
 =?utf-8?B?MWZKT3lvcUVkTHdlTzFCUmcwM0NMMlhSSCtrZTNIL3JRNmV5YmZTZzMreG83?=
 =?utf-8?B?Smw3RlJiRStNSkFrUm5hR1l1b2xSbU05NnA4QlFDZ3ZQVGZzdHRLdlc2QWE5?=
 =?utf-8?B?bEdKWTZmaHM2S2ViMGt3ak9vMUV1dlFSNjQ5TFp3bVJ5Q3JHY0EyK3M5L0lu?=
 =?utf-8?B?bGd5MllyZmtIS0JCVlUybFk0eUE3WE41ejkrZXVsRVJKNjdHR0IreE5lSWJo?=
 =?utf-8?B?Z1Q1RDdCRktXdVVvMGFHNTFMMWl3UTJ6UUhOS25FdjM2MjRBanZ3QytJSGFi?=
 =?utf-8?B?L3FFcjBYa3pEMDVqY2x6TVN4WFdXYkpvZitLYVlzOGl3alN3Q2t1VWlnMmI2?=
 =?utf-8?B?ZVU3UmV6WjNiZzQrWmVQR1hEMUZwSGpzdkkvVGllakJUdUI5a3RHdTVtdzJq?=
 =?utf-8?B?R3NZNURqNW5EMzB3djNUc1hMcFZiTDROZldaNldnaDQxNlRoa3IyRjZQSDI4?=
 =?utf-8?B?NzhKNDFZZGZHeEhxcmZLT050TmJDWFJ5bmp0a0dXR2Y2NVdkaVU5Z21vVEZ1?=
 =?utf-8?B?b3BINExSUkQ0ZGdMOTZmRXdINEI1LzZYeTRLbXJxaENKdFNOaFdZbEJCZnh0?=
 =?utf-8?B?SVAxUVpQY0diZFBtbmFoV0IwakpVYWUxMUQyS1lNVm5XYXFHUDJQZEN0N1B2?=
 =?utf-8?B?ek1yUkxLUnRMM1BJcC9BRXhlN0xVZ0FRd2pMSDVWVlo0cjljOGcwK2NJVnZq?=
 =?utf-8?B?cklLTUZ6Sm9BeEdsa0xPQzU3UkphN3R0Q1g2bTgzM0NHNVRmZHI2OEtsL09O?=
 =?utf-8?B?TmZlbWpIQm1NcXBiOWpEb1U5OS9RYklVWjhjQmZqTVR2RDBERkRickMzVG1W?=
 =?utf-8?B?R0FMRjMraTY5TEZqNW5mMkpxSkdRSUhTZ3JZMVplUWFNcHpGREdYSGNwYmcz?=
 =?utf-8?B?alpxbndlQ283RmhIUWhicU1zVGhCQXh6VTNXRndMSGczWXA0WEExTHp6cEdS?=
 =?utf-8?B?UFIzNFNEd051alVDcEhta3Vna3RHTGJCUlZqQmhoRVhha3lKdkkwanBhM2JP?=
 =?utf-8?B?RlVsMC9waXZTN2RVZFFhRnY3eGJpMXYwVDVxa25RbDkxQ0NtOEZ6aVc3aDFJ?=
 =?utf-8?B?U0dNSGRYVnloS0hiNEtlMGovM0luelJZclloOFc1WGRaQTBoODhXUFRWUlI4?=
 =?utf-8?B?VzZCaFpiMjljTWxRYmVGRFYzM3gzTzVLV1l4NlNIblFCMzUrM3l2NVpRNVZ1?=
 =?utf-8?B?ZTBGcHFXRlJhVlpaYmdjN3oxTWxuQi9Pdm1OU2hNaGVLZDBlVXVLWDhSTi9l?=
 =?utf-8?B?Q2FoMlk5b3ExVmFLWUxJc0xLSk5FaWt5MGRMYzZQSk5TVXRxTk8xVnRiTmgr?=
 =?utf-8?B?T0VQdWltNjc4WEU4WVM3YjA3OGNacG9PSUJOa2Jub1BrdzdTWXVWNVdTQlRR?=
 =?utf-8?B?SWZJUzZMc2VCMnd4RG9EVjd0TWRTZjh0R1lBN0p3THJmaEgxdzNKMUtCdmRK?=
 =?utf-8?B?RWdqTVBnc1RxMzFLcXlEcWFXczFacmRCQkcwTHNWa0pjQXo1ZlJnWlJIQWJh?=
 =?utf-8?B?cjlCb0lpdUhNRkFwZm5xYStTQ0dZOWduNUhGZ2MzQWF0MW9oU25pa1Rsc0Y3?=
 =?utf-8?B?SFpaZHNGN2IzSkZFb1ozQUVYSmRTSlkwMlRhdm9kVnJlYXVjczY3VFlabUZ1?=
 =?utf-8?B?NEhHN0g3QVhLVmwwSngxQUNsOS9OL2c2S1lrNmNNYTFNTkhJYUpDVVo2ZTFz?=
 =?utf-8?B?bU1ieVNnMyt1U3dCWVVhaEU5RkFLTmpESGFyMDMvODBMaWdnRnpKd2dXdExX?=
 =?utf-8?B?WTRYcDFsRmtjQTRvMVY1bTdnUlJOT2xxbzlJZ2VvOVBuU3FRNTd3emFjZ2sx?=
 =?utf-8?B?TStiZVFJTC9jMFJudmRoNDRkUzFRc1RuNmZGYXc2M2drQTc2ajJwSVp4alFW?=
 =?utf-8?B?cFU0cC84dFo0eHQ3NWVaNVR2QzVERC9TSVNIamtaL0d2WWVVZC9ndDNaYW4r?=
 =?utf-8?B?YkRIQWpHaHlYRlZtMGg4MnAwWkJiZUNQb2lUMGtQN2NBakQ3aVJMNitnV3JP?=
 =?utf-8?B?WXo3S0VTNDlGbHM3RG5qVmtsOUxIbUFkK0MrRzdDNGlwSm8xcUZWZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <884BCCD7B6D92E4082485A5A41187088@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ca03f13d-111c-40ba-823d-08df3e4c321f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2026 10:28:28.8880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ykG7UsOTEQ5O7Gojnbbt7p5nlHEpjHfpWNaiIWjByyL76f11s6/HnIRpe5vmD0J2xnYJq/Tbt9vm6BawhGJ81A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8977

T24gTW9uLCAyMDI2LTExLTA5IGF0IDEwOjEyICswMDAwLCBQZWRybyBGYWxjYXRvIHdyb3RlOg0K
PiA+IA0KPiA+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLg0KPiA+IA0KPiA+IFN1Z2dl
c3RlZC1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQGtlcm5lbC5vcmc+DQo+ID4gU2lnbmVk
LW9mZi1ieTogU2hpdmFuayBHYXJnIDxzaGl2YW5rZ0BhbWQuY29tPg0KPiANCj4gUmV2aWV3ZWQt
Ynk6IFBlZHJvIEZhbGNhdG8gPHBmYWxjYXRvQHN1c2UuZGU+DQo+IA0KPiB3aXRoIGEgcXVlc3Rp
b24gYmVsb3cuDQo+IA0KPiA+IC0tLQ0KPiA+IFRoaXMgY2FtZSB1cCBpbiByZXZpZXcgb2YgdGhl
IGNvcHlfbWNfaGlnaHBhZ2VzKCkgc2VyaWVzIFsxXS4gUGVkcm8NCj4gPiBwb2ludGVkIG91dCB0
aGF0IG1vc3QgYXJjaGl0ZWN0dXJlIHJ1biB3aXRoIGZ1bGwgb3IgbGF6eSBwcmVlbXB0LCBzbyBt
bQ0KPiA+IGRvZXMgbm90IG5lZWQgdG8gY2hlY2sgdGhlIHByZWVtcHRpb24gbW9kZWwgYXQgcnVu
dGltZSBvciBiYXRjaCB0aGUgY29weQ0KPiA+IA0KDQoNCj4gPiAtDQo+ID4gLSAgICAgbWlnaHRf
c2xlZXAoKTsNCj4gPiArICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfUFJFRU1QVElPTikpIHsN
Cj4gPiArICAgICAgICAgICAgIGNsZWFyX3VzZXJfaGlnaHBhZ2VzKHBhZ2UsIGFkZHIsIG5yX3Bh
Z2VzKTsNCj4gPiArICAgICAgICAgICAgIHJldHVybjsNCj4gPiArICAgICB9DQo+ID4gDQo+ID4g
LSAgICAgZm9yIChpID0gMDsgaSA8IG5yX3BhZ2VzOyBpICs9IGNvdW50KSB7DQo+ID4gKyAgICAg
Zm9yIChpID0gMDsgaSA8IG5yX3BhZ2VzOyBpKyspIHsNCj4gPiAgICAgICAgICAgICAgIGNvbmRf
cmVzY2hlZCgpOw0KPiA+IC0NCj4gPiAtICAgICAgICAgICAgIGNvdW50ID0gbWluKHVuaXQsIG5y
X3BhZ2VzIC0gaSk7DQo+ID4gLSAgICAgICAgICAgICBjbGVhcl91c2VyX2hpZ2hwYWdlcyhwYWdl
ICsgaSwgYWRkciArIGkgKiBQQUdFX1NJWkUsIGNvdW50KTsNCj4gPiArICAgICAgICAgICAgIGNs
ZWFyX3VzZXJfaGlnaHBhZ2VzKHBhZ2UgKyBpLCBhZGRyICsgaSAqIFBBR0VfU0laRSwgMSk7DQo+
IA0KPiBJIHRoaW5rIHdlIGNhbiB1c2UgY2xlYXJfdXNlcl9oaWdocGFnZSgpIGhlcmUuIEkgZG9u
J3Qga25vdyBpZiB0aGF0J3MNCj4gbmVjZXNzYXJpbHkgZGVzaXJhYmxlLCBidXQgaXQgd291bGQg
bWFrZSB0aGlzIGEgbGl0dGxlIHNpbXBsZXIuDQo+IA0KDQpTdXJlLCB0aGlzIG1ha2VzIHNlbnNl
LiBXaWxsIGRvIHRoaXMgaW4gbmV4dCB2ZXJzaW9uLg0KDQpUaGFua3MsDQpTaGl2YW5rDQo=
