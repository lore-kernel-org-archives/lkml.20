Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793016601;
	b=kIBrX5Cv7VvzLGVgAaIPGCTj9YPAzHeL5C5VtjaH8RxExPxk05ksrme2jS2nuHbJXiA/
	 o/qOwazjSFIURbD12OUvqwNBrA9qR2xzKw3knygA/JY8DeXUZCahC67gMzgBSO8bJqlaV
	 p6xf6H3zh99Nk2oNSSK7RNov8ph/HBeLU9Kvh0R3wFqvamoB6jbYbmCVNCRFKRbEcudeg
	 Abaynb7x3sVe4N2BojDArJfHs26veyizdYXzmBIyGpxjSrbkSToGBH6EZhH/7ukgEfGH9
	 yiFs+QOPbC0KAnmS5IktQJIZukcFnWKe1FZeGCsTmlVXS5OFsb5wymFUX4uPNeIyt4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016601;
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
	bh=1OS4xAqAlug39q6EQvvENOZVx6u/tWpBKch7Frenq+8=;
	b=KD+URSzsapYn8UZJ3Io67SjfRr8dZdebz4Ebk41L+yrvodTt0g0EriWytWNbGwqUA4LC
	 WNpVrDGWPa/Nk0Vw2QBrXqjfFMeX310MhOPI+Af/W6QgLUNQurec6X0vFhhMXUiULpl+t
	 Owcg7CdAAz+cjkc/yxlwVohSrp51FudjDZuO5YyofCze5r0aPN+HgDd4iBgmnSMV9XzyJ
	 ARqe93gmd9fyMJWs4FPGvCK+Kc/q8NJZEQOJFh9I+JLsn0OrfkJfoMCJK+hS/zm8guRVO
	 WINuIsQ0vC73hXHcEukMN5p8ApSNOwRCJ5bdpL1/UKNEHQIavn5P+zi001yaBid9yqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rUiZ+DTQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.20
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012020.outbound.protection.outlook.com [40.107.209.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E551606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E551606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rUiZ+DTQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EcrSo4Ij8xCzKkyljhemQPnJsfUV+D1T7tqlK1b5TReWddD+oXg31CfWWHZtLyz72UhqkbU8AYS8oulbXgoKkzZjSeBNMgZF/3+a7/RKurx77Vqfp6lxyv/CtQ8lvanz1yKq92B3r9wnqBNHvda+S93lgrvr1SiRc3pz2OoxrA5y7gh1Be2WnJ8TytLLqQqW6MgxwEZmc82tgRX8s/OUcNB/5Xl4AGF0kn7Fl75wme+tOxk8uv/nfG9rDF9GV1K+h8DJhjSAtMiSVmRENuFvDsLaF7G6Wnxosk3Z0Lsz/g8/du/Nl3TuBBoJUgVBsdEG0GFB1MqRF2fC3N2q3Rw/sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1OS4xAqAlug39q6EQvvENOZVx6u/tWpBKch7Frenq+8=;
 b=khPxW2Gg43Z0lDur5u7FYKmyxn+AHoyuPfKL41g8L+vCXbgR/igms+3S+M4Vtsb9JueUTnYPJYyXnFCg0K59lwVrj+ZvFBbtA2/NKB5YQYZYRKkv3hBBjdGeb59Z7PnafDeMMBL9LJM4NRUhDLuD+vbDRrOelXkxpRmDQLblisnuvCTAwMOQFrJE3mv/CBwdDB51JStcr9RaTNWiy8zRKKIe4626TBrlFGDrkZrWhOHM8UXccSMHtt1qj1/4BJN6Y8JWNbpasYg6VGyOB3p47wPzouJ89ytdqf5INoQ1WTHwdrjdjOL1yB9kZzIjS75HPRSzaghxqRrV2cRZo+Dkdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OS4xAqAlug39q6EQvvENOZVx6u/tWpBKch7Frenq+8=;
 b=rUiZ+DTQBxGDg/uyS2gQJx3/FqldbJmEFo4J6QqQRmxdIHE6s6ZXhgq0j+OJrd3OQD7CpBdAjqp48C3ahzCc5KL868yft7STwSawXGhhVBPzxYKyrQ/rNes7MAbfo1t9+RgyooOGFPQPA3nh1iNlMYrPNGiLUBunaZDsnWT8b1U=
Received: from BN9PR12MB5259.namprd12.prod.outlook.com (2603:10b6:408:100::17)
 by PH7PR12MB5686.namprd12.prod.outlook.com (2603:10b6:510:13d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 12:09:57 +0000
Received: from BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed]) by BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed%2]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 12:09:57 +0000
From: "Garg, Shivank" <shivankg@amd.com>
To: "david@kernel.org" <david@kernel.org>, "xiangzao@linux.alibaba.com"
	<xiangzao@linux.alibaba.com>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>
CC: "rppt@kernel.org" <rppt@kernel.org>, "wangkefeng.wang@huawei.com"
	<wangkefeng.wang@huawei.com>, "chengkaitao@kylinos.cn"
	<chengkaitao@kylinos.cn>, "vbabka@kernel.org" <vbabka@kernel.org>,
	"ying.huang@linux.alibaba.com" <ying.huang@linux.alibaba.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"surenb@google.com" <surenb@google.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "muchun.song@linux.dev" <muchun.song@linux.dev>,
	"ziy@nvidia.com" <ziy@nvidia.com>, "nao.horiguchi@gmail.com"
	<nao.horiguchi@gmail.com>, "liam@infradead.org" <liam@infradead.org>,
	"linmiaohe@huawei.com" <linmiaohe@huawei.com>, "mhocko@suse.com"
	<mhocko@suse.com>, "ljs@kernel.org" <ljs@kernel.org>, "tujinjiang@huawei.com"
	<tujinjiang@huawei.com>, "kaitao.cheng@linux.dev" <kaitao.cheng@linux.dev>,
	"mgorman@techsingularity.net" <mgorman@techsingularity.net>
Subject: Re: [PATCH] mm/highmem: refuse to copy hwpoisoned folios in the
 !copy_mc fallbacks
Thread-Topic: [PATCH] mm/highmem: refuse to copy hwpoisoned folios in the
 !copy_mc fallbacks
Thread-Index: AQHdZUBdgE3FtTvk10qUkek5AMi/c7cPu1KA
Date: Mon, 26 Oct 2026 12:09:57 +0000
Message-ID: <d1de051d8c3150df7dd0b963a51176e5221a2006.camel@amd.com>
References: <20261026025724.1430747-1-xiangzao@linux.alibaba.com>
In-Reply-To: <20261026025724.1430747-1-xiangzao@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5259:EE_|PH7PR12MB5686:EE_
x-ms-office365-filtering-correlation-id: 934497ce-1997-47d6-45db-08df335a0d5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|23010399003|376014|1800799024|261009223027099003|261021121427099003|261022075727099003|261022105027099003|10067099003|56012099006|18002099003|22082099003|11063799006|5023799004|38070700021;
x-microsoft-antispam-message-info:
 3WExT3sTq0mIVouuPIc1ywwuUrFSHne4/HZ7c/fz/osCz6MwT3IcQsjjrB32CaVrgSNhsQP3myQdAeoe0uxUPp2TEBNXp+QKRrqtszNEkvIVP95lam8KwE5+QVtge236H8hIXwZtuGoMUvXfk/HUB/ZXS0XNdD3MTXVl5OVxkBumUQ/9lJY9b0oTGaoZQKbcLIEsMWhwrgIJkFf6IjSzAu2LmzBTxOElFzQEa793W6O1YPSg6AqEte2oXoVoXoxXFbNu5l+hMLXJ2BdjI7dQkiu1wTeCV/wT9sK0Q7SyX7DtvbMVZl9p1HBHAqbDLdhjbAgZwqpAykaukV+hN8ubPAQmP9Us8jGaYJJCwlbEngSPzygbGJTqFWjzWPILOjVkRAEl8AJtbL1r8yZrOciRl7u1pptoTkf/f2CQnnwWtM1ZquA2wWpfvHHydx9Xt7MfxaK5+VG7e+hO6JUwMmiqsdgNb4uWS8G7w+/x3cdDKj729Slatf/zHhKiDW6e0uKwXIS0uWec9XQ8EoztfiLVACrjldjtfsWu5wKSj2RGu5yPQIYuSt0R8TznAYGazSnZqGexg+2utGonOC3tVoyAAL1fbLexrK64iZq8jsxbgrxbP9J0NzZmx4eWLvntkSFA9sLAHbV43GzNo+1ReiMPYP78R0XgRX6RuRWShyVTxWA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5259.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(376014)(1800799024)(261009223027099003)(261021121427099003)(261022075727099003)(261022105027099003)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006)(5023799004)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dExDR3l1WGV1bVZiQ0cvU3lvbFFzeEUzU3ZxMDdMSnVzQk4zS1JhQUo3OC9h?=
 =?utf-8?B?RGkrT2wwZStRM0p0NDZNYmtkckZVc2RYMG9BU3U5bit1SXhCT0ZLSHhmMXZz?=
 =?utf-8?B?SmZyNHVsbTNNeGg0UVN4MDBmTWJwZWQ3aXlBNk91c2toZG4zYUMzMkVUc1Iv?=
 =?utf-8?B?QmpCR1VOVGVzK2dmZWFlZFVJb3czMDMrNXlGb2R0TEJ2STdBdTJYVHV6Vy8w?=
 =?utf-8?B?djBDbzEzQWZORVB3V3NUREZUcUVPT3RZVllLK2kzQjdtRVo0aStVVkZxRG1V?=
 =?utf-8?B?ckJ6WXdmTWFLY3JmY09WeTFBb28yUDFQYjhWSm5XK1FQZ0tkZXo4ejV2SnUr?=
 =?utf-8?B?Wk4vdEt0endYYmg5Y2lseWhCdnNFRlQrYUhQOTc3NTdobkZaeGhIQ0xBMHJV?=
 =?utf-8?B?Mjc1Q1A1SWI3N0FKNGxXOEJINHh6THltTG5teXFpeDg5VGJuQWhFNHVxcjM3?=
 =?utf-8?B?UTVCdHdrcG1yR2ljQlE2WFZSbHFXT0U0ZG1nT0RnT3UvWlZ6c2lzT2hvdEky?=
 =?utf-8?B?ckhKYy9Demd1L29kMjlPQWNuTGhRRDR6ZlZUSGJBbXdDSkdnNDlhZndFbE1l?=
 =?utf-8?B?bDFldC95dldwbS9JK0tScHliTDdBbFZQL051ZERIblpEY2Q4YU91N1diTHR3?=
 =?utf-8?B?MjF4MS9tQVZHK09TVGoxWXBoMXRkTk1qbUNWUWx2ZXMzS0RSZmVobHN0UEEv?=
 =?utf-8?B?ckVMcXFLQmdZRlVaWjN3bmMxOTVEbHZ1MXZVRVp6VmxjeFFOWWtnODRqK1hw?=
 =?utf-8?B?TzNNVU5nOWg0dlRRaklobHhRdENmRnZyRGphK095aVRhMjR3OFpycm9FWlgx?=
 =?utf-8?B?Nkpwd1RMd1VqT1NHSlM1bndtQVhpVmd3bi9ZemN4cGhQa1kzNFZFeXptRjEv?=
 =?utf-8?B?QmRVc05zM0xKeGN3TzM3MmVYWFBxa1cwVUJ1anFkdzVkODV5ZWRKdCtvYk50?=
 =?utf-8?B?K3R1SjJKSXVIRWhaOTA0YmljckpCM01RTUZGbnZWaUQ3d2hRanRpVnJFL1VD?=
 =?utf-8?B?RFNPd1ZKSGV0OGp6dnNxRDYxRm94ZWRlZFRyNlFzc3lLRG9VaGNHOVU4TnEr?=
 =?utf-8?B?Ly9mcW5pR1NZYW5mYW1LcFcrT3JhbGsvTWdGRVJHQU5KeDU3clZZWWdBTzdW?=
 =?utf-8?B?NENseEJOWmMyL05LWlRqdUlVVTRRbVN1Zmtzb0JTQ09rQkFmeVhvVS8rSTIr?=
 =?utf-8?B?bDBMUVRUekNVQW5qUXBVVjh0OTdwaUhQR2hvdllvRDlUcm5malBzMVc1WFNh?=
 =?utf-8?B?dkR0eE1aVUZUUmEvWERnZkszOEVkNk1MUHNyRGtnaG9SSThPekRhVXJKNWJs?=
 =?utf-8?B?TjhiRXJCbGJZSkpNczRiOGpnaDNXOVZGd2trMUNhMHlPUit4ZnhiOWtlZXo1?=
 =?utf-8?B?K3ZRSm1PMWYxOUQwTjE1Q2haU0FFYlk0VFJJalpGK3FKNWwxNkNmdTZSQ0xa?=
 =?utf-8?B?YlQ2QnBSL3RSRTV4RE81dzg5TDZKc1ZWRzFRUkJsMlFpVkpycjVxMjQ2YTFW?=
 =?utf-8?B?dEhGbjVpT09HSDlHSUlSR25KYkVIZEJONHdjYkpWRkRwbGpkcVVWVSs0dU1k?=
 =?utf-8?B?dzcxUmxDQjM1SElSaWdiaDlTSnRJWEMzSVluaXg3YVZtdzVHVHNYdXVoTnda?=
 =?utf-8?B?SVVRUjJJUWdsMEFTNzZNYzNJMk1HZXFIdngvUlVYTWtrbVZwM2ZoQ1d2RUFs?=
 =?utf-8?B?WDMwV085OFJKbmZSN0Z0YmhnWWxvRFlOdElWVDl0ME42SzUzY3ptdnJYK3BN?=
 =?utf-8?B?VTVHU1VXTjF1S2gzRjZhOUZKZkQwNmNrSWt6bGZHTXRrVVBMWkcrZVZnT2sv?=
 =?utf-8?B?TVFrZXhBY3Z4RllkNzViTlhhelQ0UEFQUHpvUEgyL3hVMjNRWCs0UlpGS3dC?=
 =?utf-8?B?bm1qaURUUzJFQlFBb2JPYjY0bDdKdDFTYnlwMUFkM29vYmhSamx3bmNRV0hI?=
 =?utf-8?B?VEhsUk45U3hCZi9haFR5by91RkJnTXQyYXI2Vm5tYXRIVlhheGYxRkxSV3hp?=
 =?utf-8?B?N1ZYMnBHcVExdGJidWl0eVROSnhzT1pEOFQ4cHZpdnQxNEtaSEtQWkNrN3N3?=
 =?utf-8?B?M1B5ejdUN2FVbjFqWjRUSkt6SFNKZDlVWUY3VHdHVUlyMk9Zbkc4UFZWSGhT?=
 =?utf-8?B?SndGVUtoaDhwdjByZFVoejJXQUxyWWhTdURnODhxRkRRVDJmNXlVdUJwVkR4?=
 =?utf-8?B?WkNYVmpvMHhhUkcwcHBXWTl3VER6TG9iMHAzRlV3REhBWmoyZ3dmSW9kNWJF?=
 =?utf-8?B?a2psNUlzVVBzS0dvZkdqb2RZVFBPNVRZODZleFJEMUxWUnFwYk5HVG02My9h?=
 =?utf-8?B?bG1Fc3VpdVNFU29WUytnQXM4bXBmVDVOVHR1U0E3ME03T211M3ZpZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB7B19CF7DDAB346A733CE941786BEEB@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 934497ce-1997-47d6-45db-08df335a0d5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 12:09:57.3647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gQgk60nrbVxdLwWwyqSdGgM2xF6/xdfH9x7kJK4bcfzvbT6CXoBAG57E+rvmT2QJhbhrvH+cuiHiA18MdBKExg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5686

T24gTW9uLCAyMDI2LTEwLTI2IGF0IDEwOjU3ICswODAwLCBZdWFuaGUgU2h1IHdyb3RlOg0KPiBX
aGVyZSBjb3B5X21jX3RvX2tlcm5lbCBpcyBkZWZpbmVkLCBjb3B5X21jX3VzZXJfaGlnaHBhZ2Uo
KSBhbmQNCj4gY29weV9tY19oaWdocGFnZSgpIHN0b3AgYXQgYSBoYXJkd2FyZSBlcnJvciBkdXJp
bmcgdGhlIGNvcHksIHJlcG9ydA0KPiB0aGUgbm90LWNvcGllZCBieXRlcyBhbmQgcXVldWUgdGhl
IHNvdXJjZSBwYWdlIGZvciBtZW1vcnlfZmFpbHVyZSgpLg0KPiBUaGUgIWNvcHlfbWMgZmFsbGJh
Y2tzIHJldHVybiAwIGFmdGVyIGEgcGxhaW4gY29weSBpbnN0ZWFkLiAgV2l0aA0KPiBQR19od3Bv
aXNvbiBzZXQgd2hpbGUgdGhlIGRhdGEgc3RheXMgcmVhZGFibGUgLSBzb2Z0d2FyZS1pbmplY3Rl
ZA0KPiBwb2lzb24gKE1BRFZfSFdQT0lTT04sIHRoZSBkZWJ1Z2ZzIGNvcnJ1cHQtcGZuIGluamVj
dG9yKSBvciBhDQo+IHRyYW5zaWVudCBoYXJkd2FyZSBlcnJvciAtIHRoZXJlIGlzIG5vIGZhdWx0
IHRvIHJlY292ZXIgZnJvbTogdGhlDQo+IGNvcHkgY29tcGxldGVzLCB0aGUgZGVzdGluYXRpb24g
Zm9saW8gY2FycmllcyBubyBwb2lzb24gbWFya2VyLCBhbmQNCj4gdGhlIHBvaXNvbiBpcyBjb25z
dW1lZCBzaWxlbnRseSwgdGhlIHNhbWUgcG9pc29uIGNvbnN1bXB0aW9uDQo+IGNvbW1pdCA4NDFh
OGJmY2JhZDkgKCJtbTogcHJldmVudCBwb2lzb24gY29uc3VtcHRpb24gd2hlbiBzcGxpdHRpbmcN
Cj4gVEhQIikgcmVmdXNlZCB0byByaXNrIG9uIHRoZSBzcGxpdCBwYXRoLg0KPiANCj4gQ2hlY2sg
dGhlIHNvdXJjZSBmb2xpbyB3aXRoIGZvbGlvX2NvbnRhaW5faHdwb2lzb25lZF9wYWdlKCkgaW4g
Ym90aA0KPiBmYWxsYmFja3MgYW5kIHJldHVybiBQQUdFX1NJWkUsIHRoZSBub3QtY29waWVkLWJ5
dGVzIGNvbnZlbnRpb24gb2YNCj4gdGhlIHJlYWwgY29weV9tYyBwYXRocywgc28gdGhlIGNhbGxl
cnMgdGFrZSB0aGVpciBleGlzdGluZyBlcnJvcg0KPiBwYXRoczogdGhlIENPVyBhbmQgZm9yayBw
YXRocyBmYWlsIHdpdGggLUVIV1BPSVNPTiwgS1NNIGFuZA0KPiBraHVnZXBhZ2VkIGFib3J0LCBh
bmQgZm9saW9fbWNfY29weSgpIHByb3BhZ2F0ZXMgdG8gdGhlIG1pZ3JhdGlvbg0KPiBjb3JlLCB3
aGVyZSB0aGlzIGNvbXBvc2VzIHdpdGggdGhlIHNlcGFyYXRlIG1pZ3JhdGlvbi1zaWRlIGNoZWNr
cy4NCj4gT24gYXJjaHMgd2l0aCBjb3B5X21jIHRoaXMgY29kZSBkb2VzIG5vdCBjb21waWxlLg0K
PiANCj4gVGhlIGNoZWNrIHJ1bnMgYWZ0ZXIgdGhlIGNvcHk6IGEgY2hlY2sgYmVmb3JlIGl0IHdv
dWxkIGxlYXZlIG9wZW4NCj4gdGhlIHdpbmRvdyBiZXR3ZWVuIGl0c2VsZiBhbmQgdGhlIGNvcHku
ICBBIGZsYWcgc2V0IGJlZm9yZSBvciBkdXJpbmcNCj4gdGhlIGNvcHkgaXMgY2F1Z2h0LCB3aGF0
ZXZlciBzdGF0ZSB0aGUgZGF0YSBpcyBpbi4gIEEgbGF0ZSBzb2Z0d2FyZQ0KPiBpbmplY3Rpb24g
Y2Fubm90IGhhdmUgY29ycnVwdGVkIHRoZSBjb21wbGV0ZWQgY29weSwgYW5kIGEgc3luY2hyb25v
dXMNCj4gaGFyZHdhcmUgZXJyb3IgdGFrZXMgYW4gYXJjaCB3aXRob3V0IGNvcHlfbWMgZG93biBh
dCB0aGUgYWNjZXNzOyB0aGUNCj4gcmVzaWR1ZSBubyBmbGFnIGNoZWNrLCBiZWZvcmUgb3IgYWZ0
ZXIsIGNhbiBjYXRjaCBpcyBjb3JydXB0aW9uIHdob3NlDQo+IGhhcmR3YXJlIHJlcG9ydCBsYW5k
cyBhZnRlciB0aGUgbGFzdCBjaGVjay4gIENsb3NpbmcgdGhhdCB3b3VsZCBuZWVkDQo+IGFyY2hp
dGVjdHVyZSBzdXBwb3J0LCBhcyBkaXNjdXNzZWQuDQo+IA0KPiBUaGUgZmFsbGJhY2tzIGRvIG5v
dCBxdWV1ZSBtZW1vcnlfZmFpbHVyZSgpIG9uIHJlZnVzYWw6IHRoZSBmbGFnIGlzDQo+IGFscmVh
ZHkgc2V0LCBhbmQgbWVtb3J5IGZhaWx1cmUgZWl0aGVyIGtub3dzIGFib3V0IHRoZSBwYWdlIG9y
IGhhcw0KPiBhYmFuZG9uZWQgaXQuDQo+IA0KPiBTdWdnZXN0ZWQtYnk6ICJIdWFuZywgWWluZyIg
PHlpbmcuaHVhbmdAbGludXguYWxpYmFiYS5jb20+DQo+IFN1Z2dlc3RlZC1ieTogS2FpdGFvIENo
ZW5nIDxrYWl0YW8uY2hlbmdAbGludXguZGV2Pg0KPiBBc3Npc3RlZC1ieTogTExNDQo+IFNpZ25l
ZC1vZmYtYnk6IFl1YW5oZSBTaHUgPHhpYW5nemFvQGxpbnV4LmFsaWJhYmEuY29tPg0KPiBMaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzg3N2Jqb3dmOWkuZnNmQERFU0tUT1AtNU43RU1E
QS8NCj4gLS0tDQo+ICBpbmNsdWRlL2xpbnV4L2hpZ2htZW0uaCB8IDkgKysrKysrKysrDQo+ICAx
IGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9oaWdobWVtLmggYi9pbmNsdWRlL2xpbnV4L2hpZ2htZW0uaA0KPiBpbmRleCBkN2Fh
YzlkZTFjOGEuLmY5MGYwYzYyMDRhNCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9oaWdo
bWVtLmgNCj4gKysrIGIvaW5jbHVkZS9saW51eC9oaWdobWVtLmgNCj4gQEAgLTQ3NCwxMiArNDc0
LDIxIEBAIHN0YXRpYyBpbmxpbmUgaW50IGNvcHlfbWNfdXNlcl9oaWdocGFnZShzdHJ1Y3QgcGFn
ZSAqdG8sIHN0cnVjdCBwYWdlICpmcm9tLA0KPiAgCQkJCQl1bnNpZ25lZCBsb25nIHZhZGRyLCBz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkNCj4gIHsNCj4gIAljb3B5X3VzZXJfaGlnaHBhZ2Uo
dG8sIGZyb20sIHZhZGRyLCB2bWEpOw0KPiArCS8qDQo+ICsJICogVGhlIGZsYWcgY2FuIGJlIHNl
dCB3aGlsZSB0aGUgY29weSBydW5zLCBzbyBjaGVjayBhZnRlciBpdDsNCj4gKwkgKiBhIGZsYWcg
bGFuZGluZyBsYXRlciBjYW4gbm8gbG9uZ2VyIGhhdmUgY29ycnVwdGVkIHRoaXMgY29weS4NCj4g
KwkgKi8NCj4gKwlpZiAoZm9saW9fY29udGFpbl9od3BvaXNvbmVkX3BhZ2UocGFnZV9mb2xpbyhm
cm9tKSkpDQo+ICsJCXJldHVybiBQQUdFX1NJWkU7DQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+ICAN
Cj4gIHN0YXRpYyBpbmxpbmUgaW50IGNvcHlfbWNfaGlnaHBhZ2Uoc3RydWN0IHBhZ2UgKnRvLCBz
dHJ1Y3QgcGFnZSAqZnJvbSkNCj4gIHsNCj4gIAljb3B5X2hpZ2hwYWdlKHRvLCBmcm9tKTsNCj4g
KwkvKiBTYW1lIHJlYXNvbmluZyBhcyBpbiBjb3B5X21jX3VzZXJfaGlnaHBhZ2UoKS4gKi8NCj4g
KwlpZiAoZm9saW9fY29udGFpbl9od3BvaXNvbmVkX3BhZ2UocGFnZV9mb2xpbyhmcm9tKSkpDQo+
ICsJCXJldHVybiBQQUdFX1NJWkU7DQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+ICAjZW5kaWYNCg0K
U2hvdWxkIHdlIHVzZSBpc19wYWdlX2h3cG9pc29uKCkgaW5zdGVhZD8gSXQgbG9va3Mgc2ltcGxl
ciBhbmQgbW9yZQ0KcmVsaWFibGUuIG1lbW9yeV9mYWlsdXJlKCkgc2V0cyB0aGUgcGFnZSBmbGFn
IGZpcnN0IGFuZCB0aGUgZm9saW8gZmxhZw0KbGF0ZXIsIHNvIHRoZXJlIGlzIGEgcmFjZSB3aGVu
IGZvbGlvIGNoZWNrIGNhbiBzYXkgIm9rYXkiIGJ1dCBwYWdlIGZsYWcNCmNoZWNrIHNheXMgInBv
aXNvbmVkIi4NCg0KVGhhbmtzLA0KU2hpdmFuaw0K
