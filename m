Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793019072;
	b=qZc5AV8Up3Voaq147MXmmbxnLyhXohK/Vfkn+VmPWkB7pIbCcXKqkTxjMM4BQw0sE4/C
	 +tL1OTiJ04KUhG6QtyP7sv6qQv7nScmrWiIMYy6bGFWjus+aeYtz0EgZv+KWcVB2OZ6UN
	 quWXYi14yFJy0W/E5WXsJgUdB6DKXtMHa6FVBBBgM9dPj3girRLO8czofsPpVUUbQBjB2
	 /eyTHPHZ721L7QxbZ0y/4zsyrPuRxI/QBzLx6+cZ9WofYX21fpT/ylAPeWMiGwrumjwdj
	 spIBfUqzY4uqoBtnD25Udmm9XJ14Qwr3jz4Re0HOnXbUtYbAtCsjQ3J84xc4fg2y4VQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019072;
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
	bh=lndx5EHpUHUxuEsY0Ym0d/6cRncm4Buyk7Tmq6LCKxA=;
	b=vBLaYPzm/D8WTiSJOe3wBoVLkyMHs7+9uFqnDyASC+o61UZM7KWgQe4Ost46r6kc3lYz
	 uBVsCApbqr3viRiFM+R57sdBlphk4j8ik++za1LvLvCGSnKXZQFdgTkEthXSMG/elkeVp
	 K3HFJAym+QJNeOmhXgNtnFrd53w6cJP0Hct5k47TXvrQfCS14QwIr04b1ONe2FtiRwn1W
	 +5pvVoq5K1mGeQrw5G/qmwq1YcusaZD0TrHeJscQNINic4nsXHlNxrT1qOwy/uxkswyQz
	 GErrUZyxaV9jyNuX1SQg1/d5Eq42A4gHiWLbj8zKz5qB9UZky/cS5dLdfyUkFobL9eg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pRh7DZqy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.19
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011019.outbound.protection.outlook.com [52.101.52.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EB2606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1EB2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pRh7DZqy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=msrSqZUlk1kedD0ZoovqZjRdJmpYLq7NxtERploWG2rTQrPmfihzp5coxs1irHBU1OAQQjslBvkTlECuNuWpvWcNvHQisX+EhLK68gzJ6SW6ajAxRAk5xxfbtvFC4Jn6ITv74Sk40a14rMLFzohRat9/YfZDfqAd4MaS+Iq8+GDY2G9P0r/WEpJsOTYUTjEaspdNGSdsdxz4KvbyyPunCMQTVOAe9ljeeUUXTc09atgxyQ8ONCLQtH8VI10w4x/hl0KQS9YcL8xk46iE4HeAoFb1PRXCUMqfa24gZTFiexDD6eBIdRVycYZtgCa15O4SsOhxMKcn66dqYuNqVju5wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lndx5EHpUHUxuEsY0Ym0d/6cRncm4Buyk7Tmq6LCKxA=;
 b=RYVGj/+2WyMbEj7sDP2Nz37bcDsYxbdMQsPEc1vP/JYdmy88n2QaOlBa6F/v9uuFzRVwKRa6dFg457SWVjIW6MRnW6ynfE674VGjUB5DYv4SZ1LhOrko++ywRYg0HdaK8lpknRCYoARwrSnu4QiFWsUCkAer/HwA3A/kj7PeHf8ajSRBn0m4sdaZ2XnRTkujo/7JfqPoaUJgNRkfV1m3fvR5KUzfZEAzqq9tIp2hNg3sZPKrh3Odh2GRaESL6uqPYVh5sv4DEe/AK9pip25XNC33h5qop2XgFzy2O/uO3sdIAXE+t5Dwm75T0lESimsUdac1ki8muiC3J0TLo6kMGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lndx5EHpUHUxuEsY0Ym0d/6cRncm4Buyk7Tmq6LCKxA=;
 b=pRh7DZqyQtD3fSF2SkiFJZmSk5cbW3AAtWLxQ/ONLkTUxWSR6tEfUVuuCoUVjyRhhvf7HC8S9GWnsWEAkeRMl3tR+uFQh4nA+Qf5qYZm3yGfkr4UxxeWTYpwhkB6ihePqrWjLVKLAVGLhOk0gwZNHc2cYNtUNxkhjl3IuNE5nCg=
Received: from BN9PR12MB5259.namprd12.prod.outlook.com (2603:10b6:408:100::17)
 by IA1PR12MB9524.namprd12.prod.outlook.com (2603:10b6:208:596::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 12:51:09 +0000
Received: from BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed]) by BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed%2]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 12:51:09 +0000
From: "Garg, Shivank" <shivankg@amd.com>
To: "david@kernel.org" <david@kernel.org>, "ridong.chen@linux.dev"
	<ridong.chen@linux.dev>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>
CC: "chenridong@xiaomi.com" <chenridong@xiaomi.com>, "apopple@nvidia.com"
	<apopple@nvidia.com>, "ziy@nvidia.com" <ziy@nvidia.com>, "gourry@gourry.net"
	<gourry@gourry.net>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"matthew.brost@intel.com" <matthew.brost@intel.com>,
	"joshua.hahnjy@gmail.com" <joshua.hahnjy@gmail.com>,
	"ying.huang@linux.alibaba.com" <ying.huang@linux.alibaba.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"byungchul@sk.com" <byungchul@sk.com>, "willy@infradead.org"
	<willy@infradead.org>
Subject: Re: [PATCH] mm/migrate: move NR_FILE_THPS on cross-node migration
Thread-Topic: [PATCH] mm/migrate: move NR_FILE_THPS on cross-node migration
Thread-Index: AQHdZUap6b89HZSxXkmOXK0M45UPB7cPp6wAgAAfHQA=
Date: Mon, 26 Oct 2026 12:51:09 +0000
Message-ID: <6372d92c7b0ec9c3fef4e803e39e54a36f3aa918.camel@amd.com>
References: <20261025110209.4105994-1-ridong.chen@linux.dev>
	 <c021e641-f415-48bc-badd-d340d70dd850@kernel.org>
In-Reply-To: <c021e641-f415-48bc-badd-d340d70dd850@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5259:EE_|IA1PR12MB9524:EE_
x-ms-office365-filtering-correlation-id: ed4e66a9-e2cc-4c49-cb77-08df335fceb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|38070700021|4143699003|11063799006|56012099006|261021121427099003|261022105027099003|261022075727099003|261009223027099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 45eK30wxETx4Nnyk7ZrFnOhQOvoIoRRWBPiTGlkGJPLbJc6BH4IHgp52/pH3B3haqZeQWr5U4CsfAhIbPk6rCPE8n/HhTF4573tMkYImnRmgPWM+bbX02Wg6uD0t7jBCXO/PmaKvegCF+ywLQDfRLou9qIY1dciNb/D3U1V0yycqUS/P40T/gZcU17uReXVGXnnFPITCdYj6RXTnaysqpaBbFFTkPqVNB+0cFlDwuezMZpkbsHnbLyZYYQ7nbvhu7aF3Fmf/PMWSCP7nmvEH0DyczLwlZIVVxlyLjwG8vnLyie4j3hAd8mix+g4HJlmwQYllRe8yNRqZ6NKCqIP6/HZRP+QDAIfUDTjpZYkHjQnentEHG//kKlDj3qtBvzWgos90zRmj1FciXO44gpofK89QXU21eKCZ6db3g3K6Zs2e74gYQ2rlpqiJyNlWJTH2MBoI9xKjcv55DdMygAao6eQ0odD4ez2KggqO7B0PKjZ/3BhrkKj1O63J0uqO2f18rQuQ8uRPQeL3ZHP5KB/1i1lDRWAaG+a/lmKFjV5CEAx8z+crL3Kox3jtpAEmjV02FHMWzjjCAC0YBUZtaPFMvEROC+NdGOSOUJM8qTik/yTI5G2jaqmLh3x+gTVprRWkNooahvfTafzxXh8WtAxbg/rQDhZEDxHZMaCE/4fZ1k6smImdKhxmbeY3TaS/73xh8bpUoicmhaKzIp4HGk6uP7oEVG3y5aEZ/cZyuFSh90Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5259.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(38070700021)(4143699003)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U0lGVzhLeXRlT0c1NXpBS3RDTm1GU3J2RmI4cEd1NjVMS0pURmc0Z3pKQkps?=
 =?utf-8?B?MkRtcXhoaUVIT213S0xMbTdPSVdBWWtraDdCLzB3M0x2bG95TzJPWjhLS1F2?=
 =?utf-8?B?Y3dMRGw3QjRpTXc1TTZzUE9FS05ZQnFUb1VqaFVKYmVtamFlRXh0SUsvM1NF?=
 =?utf-8?B?bmI2MVl5ZW5ZWEtWL1hDZTc1bS84NG0yOEZ2T2dTTkRlYmY1K2lXZHhYL1hi?=
 =?utf-8?B?RFVSMVhjSEJWcHp6ZWRwTFNtaU1DQ29QOXdWdUpDbGcxL2ZDQnREQTZSWm9a?=
 =?utf-8?B?TUxHb2RKUzdEM1MrQ0RMb0l6b0krWnpqNFpncjFJY3EvUDN3NkhHL1hhUnF1?=
 =?utf-8?B?MWhDN21zNDBoOVcxMWZpR1AyMGtKc0w5S0VMTUR4bk95TnNhb3hOTGk5aGFQ?=
 =?utf-8?B?SjVXMHlLTEc0VW9NVmg3MFVkUzcxWWtBSW9weGY1YS92eGNWeENuTEhvSnpl?=
 =?utf-8?B?ZGxnSFViVFl3TisyNGtESGFwLzZTM0k3Y1JNOGRLRVFLbGlHK3hMN0hBaE5w?=
 =?utf-8?B?NjRXcHNST3p5cGVycXVJYXd1QkdBTmx1dS9HWUVmWGtQMGFBbFZWNTRhTGF4?=
 =?utf-8?B?ZTZ5ZzRkTTVvTkE4TU5SSi9GMjBVcUtRWXRIS1hQQUg2bWk2Rjh3UDF1ZU9l?=
 =?utf-8?B?UWwxNE1HUGdHYTE0bU93cUJESnlIYzA4SjF2WTk5N2ZzUjhVWDM3UjNyYkcr?=
 =?utf-8?B?ekVCdlVSU0FId3NpTm1RR2M1T3QwU0F4TjFWTXpBNGxNc0VUT2hxa0VzcFpR?=
 =?utf-8?B?TEx3TXNWUmlCNjZqZDJQTlVJa1djYXl1TmJ1UUQ5aWN2NTFlY3VJRG9JcGpz?=
 =?utf-8?B?bmJCMU8zWVhkYUt6VkNsWjRWYjkraFpxSzN0Qm80c094Q0F4SWxYTlM3c0di?=
 =?utf-8?B?ZEZpN0pWczIrTDI3RHFwNHhubVNQUDdGTFFUZTJvQnFIRUlUdmM2eWthRGEv?=
 =?utf-8?B?NnNSays3Mkk5RHoybEFaRTRNaUdHMGJLMlZqS1lUdWh1a01kdGVCeURoNlQ1?=
 =?utf-8?B?YXY2dmFzd3EreVN0aGtEaUE4RHdtSnl6cm5NNE1tZEc0ZmRwc3VWb2lLekgz?=
 =?utf-8?B?UG54K0VsM2VPTTNaQ0kvK3lTRERoL01qMlZNbmRIWFhrdnp0ZkpLVVpqOGNk?=
 =?utf-8?B?aE43YjcvODhZRlhIYWZqUXR0ZTQxMGM5ZlZQODZLTUlPdHgxS0VnVVYwRFJu?=
 =?utf-8?B?WVMyRDd1Sis4dXJHNzl0eUpsNW5kbC9CeTBHOWdaODBqUE92c2s0VVhjdHJT?=
 =?utf-8?B?RllvOW5MUis3WU8xaU83UzdNTGdabUJFaHJtc2JxL3FxQkVyTW04QW1lSGtt?=
 =?utf-8?B?eHJzbUNyREdySWVIemg2ZWd4MlJBSmFYZ09VRlZQbFVJUzJWUEgrcW5jZ2Fo?=
 =?utf-8?B?ZUJZTFgveHYwTEkvb3RSRk5aNThrR0tQMWxiY0hweDkxeUdkR0phTExXS1lF?=
 =?utf-8?B?czkvdzBFbkdXaDdFZjRoWUhVOHFSaCtHNkQ2YjcraVQ5N3dGNkk0SlcveUxU?=
 =?utf-8?B?bExsZHJqaXhqd1Fxc1RkV0tkTW9rc0xLSUdLajdTdDE4alpiZ3pvbjYza1l2?=
 =?utf-8?B?MzlLZWhyZEgxLzlUWUx5OE5hUTZReGJQUFZ0TGFTZS9zS1FXRzJrYVJWb21Q?=
 =?utf-8?B?QnJzQUtjTW9kVDRBTERCUEs0UW53QmNVNDIzbStEMStlRDRXSUlIUzlTeU01?=
 =?utf-8?B?aXBOektZblNDY213ZGZ4bmFveVB2OFlXdUhrVkkydUZZK2d4UGhhUFhnSkNR?=
 =?utf-8?B?dnVHaEN5YXNOajhHVURtM2FOR2srSUhGUXlVcTNoZG1EOFZicHZ6WmhWTWpX?=
 =?utf-8?B?WlRWTVNqdEV6QnVlQWYrZHMzeFJZUDJza21Nems4WnNTellaSlVkdVdjRGt1?=
 =?utf-8?B?SjhrOCtTaVdGK1hJRUxYS0U2R1UxRElwVEFRN1UvL3NpZlJ5WFdYTW01WmhG?=
 =?utf-8?B?V3FHbEhBRjVuNHU0WjB6R1hQZ2tva1JUT1Vlb1NtemZMN2pqVlB6TVhFU1pQ?=
 =?utf-8?B?Tm8yV2ozRVVsc1F5cGtWV3N0WW95dlIyYVBtKzBLTXRyUXh4NWJMZXVndm1Q?=
 =?utf-8?B?eVlXd1Z1M2FmU1B1bFErclcvNG9UZWJJRkRXSVRYa3o0a292K2hhZWhsWjZr?=
 =?utf-8?B?emN1aGV4UGlaNUN5Y2NLUzFSQXpTeGYzczV4bUlsZE1sK0ZjLzNMd3cyamk3?=
 =?utf-8?B?cDJ1Y0Z0cHl6RlN2QzFBblkrMXBHbmV6Y0VkaWRCZmJFY0Z0MHN1VnJIT2Yw?=
 =?utf-8?B?MDAyN21VcS91azMwd3djUXJnbzNheWVqNVR3MHoza1R6MTVpRGRSM1VieFNH?=
 =?utf-8?B?bVBZK3hYMjczcDRjVjBkRDYzUHlCNUxYY21hankwS0l3amRaYnhjQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB99486E0C725F4AB56F71258941BD26@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4e66a9-e2cc-4c49-cb77-08df335fceb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 12:51:09.2766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /jQtA6DAKK1rOxXb6cfa2A65FZ6j50IUNypqGQiSvZSuwHYY2L45DHu/n7cv+H0BNzlXNqk7l2kWx5kufSkHjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9524

T24gTW9uLCAyMDI2LTEwLTI2IGF0IDExOjU5ICswMTAwLCBEYXZpZCBIaWxkZW5icmFuZCAoQXJt
KSB3cm90ZToNCj4gT24gMTAvMjUvMjYgMTI6MDIsIFJpZG9uZyBDaGVuIHdyb3RlOg0KPiA+IEZy
b206IFJpZG9uZyBDaGVuIDxjaGVucmlkb25nQHhpYW9taS5jb20+DQo+ID4gDQo+ID4gV2hlbiBh
IHBhZ2UgY2FjaGUgZm9saW8gaXMgbWlncmF0ZWQgdG8gYW5vdGhlciBub2RlLA0KPiA+IF9fZm9s
aW9fbWlncmF0ZV9tYXBwaW5nKCkgbW92ZXMgdGhlIHBlci1ub2RlIGFuZCBwZXItbWVtY2cgY291
bnRlcnMNCj4gPiB0aGF0IGFyZSBrZXllZCBvZmYgdGhlIGZvbGlvJ3Mgbm9kZTogTlJfRklMRV9Q
QUdFUywgTlJfU0hNRU0sDQo+ID4gTlJfU0hNRU1fVEhQUywgTlJfU1dBUENBQ0hFIGFuZCBOUl9G
SUxFX0RJUlRZLiAgTlJfRklMRV9USFBTIGlzIG5vdA0KPiA+IG1vdmVkLCBhbHRob3VnaCBfX2Zp
bGVtYXBfYWRkX2ZvbGlvKCkgY2hhcmdlcyBpdCB0byB0aGUgc291cmNlIG5vZGUgYW5kDQo+ID4g
ZmlsZW1hcF91bmFjY291bnRfZm9saW8oKSB0YWtlcyBpdCBvZmYgd2hhdGV2ZXIgbm9kZSB0aGUg
Zm9saW8gbGl2ZXMgb24NCj4gPiB3aGVuIGl0IGlzIHJlbW92ZWQuDQo+ID4gDQo+ID4gQ29tbWl0
IDBiNTJjNDIwMzUwZSAoIm1tOiBmaXggc2htZW0gVEhQIGNvdW50ZXJzIG9uIG1pZ3JhdGlvbiIp
IGFkZGVkDQo+ID4gdGhlIE5SX1NITUVNX1RIUFMgY2FzZSBidXQgbm90IGl0cyBmaWxlLWJhY2tl
ZCBjb3VudGVycGFydC4gIE5vdyB0aGF0DQo+ID4gZXh0NCwgeGZzLCBidHJmcyBhbmQgZXJvZnMg
Y2FuIGFsbCBoYXZlIFBNRC1zaXplZCBwYWdlIGNhY2hlIGZvbGlvcywNCj4gPiBtaWdyYXRpbmcg
dGhlbSB2aWEgTlVNQSBiYWxhbmNpbmcsIG1iaW5kKCksIG1pZ3JhdGVwYWdlcywgZGVtb3Rpb24g
b3INCj4gPiBtZW1vcnkgb2ZmbGluaW5nIGxlYWtzIEZpbGVIdWdlUGFnZXMgb24gdGhlIHNvdXJj
ZSBub2RlIGFuZCB1bmRlcmZsb3dzDQo+ID4gaXQgb24gdGhlIGRlc3RpbmF0aW9uLCBpbiBib3Ro
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vbm9kZS9ub2RlTi9tZW1pbmZvDQo+ID4gYW5kIG1lbW9yeS5u
dW1hX3N0YXQuICBUaGUgZ2xvYmFsIHZhbHVlIGlzIHVuYWZmZWN0ZWQsIHdoaWNoIGlzIHdoeSB0
aGlzDQo+ID4gd2VudCB1bm5vdGljZWQuDQo+ID4gDQo+ID4gUmVwcm9kdWNlciwgb24gYSAyLW5v
ZGUgUUVNVSBndWVzdCB3aXRoIFRIUCBzZXQgdG8gImFsd2F5cyI6DQo+ID4gDQo+ID4gICAxLiBy
ZWFkIGEgMjU2TSBleHQ0IGZpbGUgdGhyb3VnaCBhIE1BRFZfSFVHRVBBR0UgbWFwcGluZyB3aGls
ZSBib3VuZA0KPiA+ICAgICAgdG8gbm9kZSAwLCBzbyBpdHMgcGFnZSBjYWNoZSBpcyAxMjggUE1E
LXNpemVkIGZvbGlvcyBvbiBub2RlIDA7DQo+ID4gICAyLiBtb3ZlIHRoZSBtYXBwaW5nIHRvIG5v
ZGUgMSB3aXRoIG1iaW5kKE1QT0xfTUZfTU9WRSk7DQo+ID4gICAzLiB1bm1hcCB0aGUgZmlsZSBh
bmQgZHJvcCBpdHMgcGFnZSBjYWNoZS4NCj4gPiANCj4gPiBucl9maWxlX2h1Z2VwYWdlcyBpbiAv
c3lzL2RldmljZXMvc3lzdGVtL25vZGUvbm9kZU4vdm1zdGF0IGFmdGVyIGVhY2gNCj4gPiBzdGVw
IChpbiB1bml0cyBvZiBQTUQtc2l6ZWQgZm9saW9zKToNCj4gPiANCj4gPiAgICAgICAgICAgICAg
ICAgICAgIHdpdGhvdXQgdGhpcyBwYXRjaCAgICAgd2l0aCB0aGlzIHBhdGNoDQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgbm9kZTAgICAgIG5vZGUxICAgICAgIG5vZGUwICAgICBub2RlMQ0KPiA+
ICAgMS4gY2FjaGVkICAgICAgICAgICAxMjggICAgICAgICAwICAgICAgICAgMTI4ICAgICAgICAg
MA0KPiA+ICAgMi4gbWlncmF0ZWQgICAgICAgICAxMjggICAgICAgICAwICAgICAgICAgICAwICAg
ICAgIDEyOA0KPiA+ICAgMy4gZHJvcHBlZCAgICAgICAgICAxMjggICAgICAgICAwICgqKSAgICAg
ICAwICAgICAgICAgMA0KPiA+IA0KPiA+ICAgKCopIHRoZSBjb3VudGVyIGhhcyB1bmRlcmZsb3dl
ZCB0byAtMTI4OyBuZWdhdGl2ZSB2YWx1ZXMgcmVhZCBhcyAwLg0KPiA+IA0KPiA+IFdpdGhvdXQg
dGhlIHBhdGNoIHRoZSAxMjggZm9saW9zIHN0YXkgYWNjb3VudGVkIHRvIG5vZGUgMCBmb3JldmVy
LCBhbmQNCj4gPiBldmVyeSBmdXJ0aGVyIHJvdW5kIGFkZHMgYW5vdGhlciAxMjguICBUaGUgc2Ft
ZSBoYXBwZW5zIHRvIHRoZSBwZXItbWVtY2cNCj4gPiBwZXItbm9kZSBjb3VudGVyOiBhZnRlciBz
dGVwIDMsIG1lbW9yeS5zdGF0IG9mIHRoZSBjZ3JvdXAgc2hvd3MNCj4gPiAiZmlsZV90aHAgMCIs
IHdoaWxlIG1lbW9yeS5udW1hX3N0YXQgc3RpbGwgc2hvd3MNCj4gPiAiZmlsZV90aHAgTjA9MjY4
NDM1NDU2IE4xPTAiLiAgV2l0aCB0aGUgcGF0Y2ggYm90aCBhcmUgMC4NCj4gPiANCj4gPiBNb3Zl
IE5SX0ZJTEVfVEhQUyB0b2dldGhlciB3aXRoIE5SX0ZJTEVfUEFHRVMsIHVzaW5nIHRoZSBzYW1l
IGNvbmRpdGlvbg0KPiA+IGZpbGVtYXBfdW5hY2NvdW50X2ZvbGlvKCkgdXNlcyB0byB0YWtlIGl0
IG9mZiwgc28gdGhhdCBUSFBzIGluIHRoZSBzd2FwDQo+ID4gY2FjaGUgYXJlIGxlZnQgYWxvbmUu
DQo+ID4gDQo+ID4gRml4ZXM6IGQ2OGVjY2FkMzcwNiAoIm1tL2ZpbGVtYXA6IEFsbG93IGxhcmdl
IGZvbGlvcyB0byBiZSBhZGRlZCB0byB0aGUgcGFnZSBjYWNoZSIpDQo+ID4gU2lnbmVkLW9mZi1i
eTogUmlkb25nIENoZW4gPGNoZW5yaWRvbmdAeGlhb21pLmNvbT4NCj4gPiAtLS0NCj4gPiBOb3Rl
OiBwcmVwYXJlZCB3aXRoIGhlbHAgZnJvbSBhbiBMTE0tYmFzZWQgYXNzaXN0YW50IChLaXJvLCBj
bGF1ZGUtb3B1cy01LjUpLg0KPiA+IA0KPiA+ICBtbS9taWdyYXRlLmMgfCA0ICsrKysNCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9t
bS9taWdyYXRlLmMgYi9tbS9taWdyYXRlLmMNCj4gPiBpbmRleCA3YmRjZGI1NzY1MmYuLmQ1NWY1
NzZhMjU3OSAxMDA2NDQNCj4gPiAtLS0gYS9tbS9taWdyYXRlLmMNCj4gPiArKysgYi9tbS9taWdy
YXRlLmMNCj4gPiBAQCAtNzAwLDYgKzcwMCwxMCBAQCBzdGF0aWMgaW50IF9fZm9saW9fbWlncmF0
ZV9tYXBwaW5nKHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLA0KPiA+ICAJCQkJbW9kX2xy
dXZlY19zdGF0ZShvbGRfbHJ1dmVjLCBOUl9TSE1FTV9USFBTLCAtbnIpOw0KPiA+ICAJCQkJbW9k
X2xydXZlY19zdGF0ZShuZXdfbHJ1dmVjLCBOUl9TSE1FTV9USFBTLCBucik7DQo+ID4gIAkJCX0N
Cj4gPiArCQl9IGVsc2UgaWYgKCFmb2xpb190ZXN0X3N3YXBiYWNrZWQoZm9saW8pICYmDQo+ID4g
KwkJCSAgIGZvbGlvX3Rlc3RfcG1kX21hcHBhYmxlKGZvbGlvKSkgew0KPiA+ICsJCQltb2RfbHJ1
dmVjX3N0YXRlKG9sZF9scnV2ZWMsIE5SX0ZJTEVfVEhQUywgLW5yKTsNCj4gPiArCQkJbW9kX2xy
dXZlY19zdGF0ZShuZXdfbHJ1dmVjLCBOUl9GSUxFX1RIUFMsIG5yKTsNCj4gPiAgCQl9DQo+IA0K
PiBMb29raW5nIGF0IGZpbGVtYXBfdW5hY2NvdW50X2ZvbGlvKCksIEkgd2FzIChvbmNlIGFnYWlu
KSBzdXJwcmlzZSBhYm91dCB0aGUNCj4gZGlmZmVyZW50IGhhbmRsaW5nLg0KPiANCj4gS2V5IGlz
IHRoYXQgd2UgbWlnaHQgYmUgbWlncmF0aW9uIGFvbnltb3VzIGZvbGlvcyBpbiB0aGUgc3dhcGNh
Y2hlLg0KPiANCj4gQWNrZWQtYnk6IERhdmlkIEhpbGRlbmJyYW5kIChBcm0pIDxkYXZpZEBrZXJu
ZWwub3JnPg0KPiANCg0KZmlsZW1hcF91bmFjY291bnRfZm9saW8oKSBhbHNvIGNoZWNrcyBmb3Ig
QVNfS0VSTkVMX0ZJTEUsIGJ1dA0KX19mb2xpb19taWdyYXRlX21hcHBpbmcoKSBkb2VzIG5vdC4N
Cg0KU2hvdWxkIGFkZCB0aGlzIGFzIHdlbGw/DQoNClRoYW5rcywNClNoaXZhbmsNCg==
