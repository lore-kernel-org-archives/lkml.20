Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.120
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793841492;
	b=cJcVojknlfD06HW6ROCrJEJ/scTqRAAJ0RmiXkXXW8N9ry8vpj3z5bT7SaL0qfST4cDI
	 UiMqzZd4xm7E9yfuFDEe8LBs/z68DqDGye/7KzcO6Sojry2PrLEGoZltaD8+2bjhfmsKz
	 kj+4/XwqhRmpYWEW6SkBhCdacub4qG8GqliPILWDcl0Iin/5bkygbQgBU1xz3QKglZECS
	 wUvpuUKZlYLvQDIYAETlipTOXW81lzqjSSo1TGf+gZTw5iZH7hornW1suc1IhlzfvJE8Z
	 edr38rrLp8XczQXY6dK05VygYpmjJvtgXxx4QGNdoQ0u7fj2Obj/aQ/D7qJzPsApzug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841492;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
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
	bh=uyTMPlSo8J08T436NfenhjstbNn28KsY6Iy7AcCUSWY=;
	b=rHkhlpOXGeABeKgTj1nmPJv1+UISHbAVAEPHVcMwy9GGN9cJ9ES5GHFZwFYgfsYm4xRz
	 kwXf/RDC7wAhorxM8jwVESLjkn3jjHez82Hf/GBTmClI15k+Hy3xwpDoyerbG1ktklwtz
	 hd9xg+E+bupSic2IK1vsP1/7egols4ye2JvPgzt6OcQ1GLCFgunRtN4pGciHlGDu+cSl+
	 BTCtsxa+A5SpD20qzsis09Fgn6Hnb4mRGiM7P+cJr/pm0PFD3mNhTGL3LCdii36+g7cZy
	 BT6cnee5FvloCA52Gcf9JbC2X0yfT/BSatflzcRS1hSB2huZwW460fOV23tf0YgmvLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.120
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023120.outbound.protection.outlook.com [52.101.127.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E43606D809;
	Thu,  5 Nov 2026 01:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6E43606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXh2iVxrBqaibFqgLndYzWs3XAtPN89eoB7nRzMrK6kGi/GNNsWYsCrj5K6wqETk1Z69BtaXdWjkIIp1mTVGFVmj+JX6N+Vu6u3/2HTfF9BaF2gXheKb2xQL4i1leX8aC1lJjut9ahDA8Ew8Q9GJ/9JAZAICZVSLuTv5y4X2tmRuNJz5KVorjgk+FFn2XcCK5/clxxt6iKW4uHDHZCNt2xNlOpl+HPVJab7ZJ4kxTW44xAqeQVwkODy8EbEtEkQ/Od/TbU8UqLZIeO6rcZ06IzwsYNFmw4jMhRBwdyuwRzTo7XrsAKc5YpCJH6ekrA7psmX5jF4ZuTulnyJWbgRhgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyTMPlSo8J08T436NfenhjstbNn28KsY6Iy7AcCUSWY=;
 b=qQ1io6aKyrhH+Jx3vxSf2Tckrm/HmIEGBRoYtyCXz4Q7jshfYNjnRAWBTsqWmggbJnpUZKGOTj+ifcv2+aSWLbwLqf2RWdK7q7UGItNXnDcRyCBQvMMdV1oZSnA742+LV0viihRWYIQ3yQDSxe2alCwuz1sPkf/rg6auxIB+TeVsnEx+hWe5RZvuX+OiNI16Lt/TP3bzTHTUUuNyUp//mTohzonfM2jFJFPmWjQX4sLvdj8blL3aFZYqOFL57QhlFYNLykYz1RJM5XJYT8iwTl/oiBjMgs3Cozso4sZzgaLh9yQXsL16h1S3iMf24mXPdZddMymKmCoHSlqHOeaYsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com (2603:1096:301:80::7)
 by TYSPR06MB6921.apcprd06.prod.outlook.com (2603:1096:400:468::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 01:18:08 +0000
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac]) by PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac%3]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 01:18:07 +0000
From: =?utf-8?B?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?=
	<hongliang.yang@cixtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen
	<peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, Roger Quadros
	<rogerq@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, =?utf-8?B?R2FyeSBZYW5nICjmnajmlrDkvJ8p?=
	<Gary.Yang@cixtech.com>, =?utf-8?B?RnVnYW5nIER1YW4gKOauteWvjOWImik=?=
	<fugang.duan@cixtech.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>,
	=?utf-8?B?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?= <hongliang.yang@cixtech.com>
Subject: [PATCH v6 0/3] usb: cdns3: Add CIX Sky1 USBSSP controller support
Thread-Topic: [PATCH v6 0/3] usb: cdns3: Add CIX Sky1 USBSSP controller
 support
Thread-Index: AQHdbMODCRmwEXC/EEm2gKkfb8EMRQ==
Date: Thu, 5 Nov 2026 01:18:07 +0000
Message-ID: <20261105011803.4058557-1-hongliang.yang@cixtech.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4439:EE_|TYSPR06MB6921:EE_
x-ms-office365-filtering-correlation-id: 53f79d5d-ff4c-48e1-03c3-08df3adaa65e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|18002099003|261102123227099003|56012099006|38070700021|261021121427099003|261022075727099003|261026121527099003|261026140227099003|261009223027099003|261028144727099003|261022105027099003|921020;
x-microsoft-antispam-message-info:
 jtFrBBSU8v5NVS3YKfu32RBJ4jbBQRBd9LJk9iJlcgDI1zEZcWnDZahONHunMRrjopq+WEabRswTqJR5pE45RtGgPzktbIL+5oxIU1A9jd907vuIAXlwWlEzZjBcVW3IXqf7Obkd/njHtLFk8p27ATaiTcDhAaDUGjfZvl+eqTjauY3aNjWWsCUvaaM2HiVikMEW1JxfSlWOgII2iZcv3O+M+bIqnS9x7x/MNARXSg1+4UfJGkHFgvDwi0X7ctcNI5+hlAFrpIIdLB8ZerlOCSt90q+TNQV6yUvEUEnjo77Kb8N06fTsrA6M0iIHiCRSMUr7dXYloFd8v1XuAlZrwajLR0mZzL1GqTSfKizfYD0CpxxKEHc3QNxoMgUzpFgyMVmOc1sSZXCsxGpaTQkjuLMsJH81rfUyRhSWEuX8pDUFcgkLYI55exM2R/H4BgXjelw430PjM4EOIVDgJM3uw/e8qL7pjNIHGduwo7ir7xSu62WQj79qEVFbKPwG373jd5r+LzoXfb+J1JDsSWRau/VIta+NB4orSGKaSAZ7FFZXtBQ1cJlWr/s+vTeUeFcz84XI3l8jgNzdMhGFsInM4VNIxzfOvLl1onFXYZVJ5BCk/ucnDd4zQsPZ9S6UwxNhfC5KEO9prd3glUOJ4oE4gqEsso17sBuyDkpecQy93rDYotbAAh3F7pcuAYxQ00r+EDr0BFPzKtpvBiy3IyjOQOIWJxgOK188CBgNwRmYzWU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4439.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(18002099003)(261102123227099003)(56012099006)(38070700021)(261021121427099003)(261022075727099003)(261026121527099003)(261026140227099003)(261009223027099003)(261028144727099003)(261022105027099003)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZXg1L3ZQRkNDaUhzTjRaTGhCLzFhaTgzMDNVZEhHRkk3citUVU9zbUF6Sk9W?=
 =?utf-8?B?V0dUOWpYcmJ4UzEvSXdZZWxLekZ1MXA4WXhPL2JxZlROOE9CRmN0SHhBamU5?=
 =?utf-8?B?MUJJbzdXN3M2OG9pb3JOdWFiMC9ZN3VVVXU1K1lQQnp4R04yTStiaVdzUjlk?=
 =?utf-8?B?cG1mdVlieGRoS0prWU8raHc3OGFybW1uVWUxSlBwMmp6UGIydHBsY1FBSm9W?=
 =?utf-8?B?WUhSK1A1M3FPUjNoUmVwUG5kZFNwYjlQNVI4UnFnL0VtUUtYNm00VWZzdnQ5?=
 =?utf-8?B?L2E4TzkvbnAzL0g0QTB5bGVoNWl5ZVVWUlBqaVF6UXVsV1ZBZ1g5Nm9uY290?=
 =?utf-8?B?SDNUS2dtVy9vbWdLZFAydi8ydExJVWhjcTdTS1dJU0YzT3hsdkFPSUtDcEVy?=
 =?utf-8?B?dFA2UWo3cjBDbHNyeFl3R1Z3aXJQQWM5OWMydkhiODJqdFJPMFFFZERMWGtW?=
 =?utf-8?B?RVNpdHp0UitQeXR0dnpVRG9iNS9mL1JhdHRKeEVwMXBOejdEY3UzeUM4Q0Fo?=
 =?utf-8?B?OCtRblVwSXB3MkRZbzc5eUYyWlJQM0RFL1RpVjdycUhjZkpXSkY3MWJhOEpQ?=
 =?utf-8?B?Y2YzREh6Y3pjekJQbUtSdkpYWG1VOXNjK3d3MGExU0sybEs3R0d5cEw3eDBz?=
 =?utf-8?B?R3ljM1lyK1FNU2RTeldEWTZTZjBOaHd2a2VZZTJmWExBM2hPWGpWOG05dSsx?=
 =?utf-8?B?V1FxTVdtY0dFZk81TEtFd3UrdzZJUU5wUzBJM3R2b3kzWVh4OXNtK3pzdlRQ?=
 =?utf-8?B?V0NJbzRyQnVrSnFiSml1eTY1eWYzNDRIcUc1dzlRL1J5aUVyTXFOejVFNi9z?=
 =?utf-8?B?QlBLL25PbmxVajRiVXlaVUFHeVcxbmdydjAzMzlqVzMvL1hZcjhIL3htS3dU?=
 =?utf-8?B?YkhLcUdNZHBGckx6ZVZpNzBpRlh0aDNhc2FjMlFVaDJEMk1xUlZuNnBSZ0hS?=
 =?utf-8?B?MDFONFUydFhlbkdJZWh5YXRnQXA4MXZPYmJJUlZjMk43bHczbHVEWTNDRG1k?=
 =?utf-8?B?OUhnZFF6Z0dPdU9ZUmRTdm16WHUwNmlXd1FUOTFnbWFXbUdaYm5NODUyWlRP?=
 =?utf-8?B?OFRLYzdvT1gxcDJPb25ieVVQOGJlT3F3RkgxMFhEeFpMSnhTdGtoUDQ4VkJ3?=
 =?utf-8?B?ODhYelovUEhSblBVajRNRThtQmFTd2ZKNTZCNmxsL3BYRGNFSURsaE9uNTNv?=
 =?utf-8?B?cTNSa1lsSklTWWlTOHAvb2g5djlmdG5qVG1GZVZJOStHWW9KMDNlYXF5TWlv?=
 =?utf-8?B?UytQVk9IeXlaLzYxczNqb0tRMnlsZ2t4b3R3MXp0S29lcXlhVldZL0JsdmxE?=
 =?utf-8?B?OG5jOS9taXg3aFdOUUJ6Q2RmSnNvN1VBQ1RIajVST3oxdVJDSEJ3VHRDNjZY?=
 =?utf-8?B?YU84Y1JHVWZnVDdqL04xcnlFU3BzQ2RSS0hhcEwxbndXUW0wOVA3bHF0VThq?=
 =?utf-8?B?a2lmODJydFhTY3JGSjlOU3hQcnlTTTNlTWF5eDhYNjllb1p2Tzdybmh3d2pX?=
 =?utf-8?B?RDdqZFlzTzQvOWF1LzFkTGNnaW1ITEFtajY3d3FveEcxSnJjaDZBQXdrS1RR?=
 =?utf-8?B?dXRodlVWRnhkY0VVS0RhTWsrUVNXOXpxVWY0M1EyOGw1dk4rZ0dwREpCYm9l?=
 =?utf-8?B?Z2ZLK2hOOXBxWGVoSVdZSHkvdnZLa1h1MGIwRG1CaGNvVVhGeVF5NlJhUytz?=
 =?utf-8?B?SXdTdndGejVUaStmUTFIL3lEeitJL0loNjJxSk5GYkhWWGpzblI5Y1JZSk55?=
 =?utf-8?B?TEJtbGV5UDFGRlRQWFEvNlBlVGdHdkFKVmd1VUZ3REZ5Nm95aGJBdm9jbFpN?=
 =?utf-8?B?bFNyWm1RMDFBb3BpQ2FRaWVsVTNnWXpBbTRBaDY2dmhodXNyVlF5eFZPOEMx?=
 =?utf-8?B?eUJjMGxUbk9ZWU5zY21Bd29Wb0VXbzFFTUpYSjJnV1hjd3F0eXJxZjFPMEhV?=
 =?utf-8?B?bktuLzJwYVdHWEJLdVRGUFFvbWZUQVQyTms2WnBseGpwdFI1bkM3NmxkWEVQ?=
 =?utf-8?B?clZGYldLblRDMFMraExXYnNNUkVRR1FQYXVYRlllUEsyRkJ1ZUJ1d1FMVTJY?=
 =?utf-8?B?UTNiZkFwNHJHeHpUUzR4UWpDUmgzZGJFMGhVaTQvalcwaG0rbkpHOVpaR1FK?=
 =?utf-8?B?N1g1NlRBb2dpUnRjNnI3RGw5OGdUR01RcmYyU0VoQ05pRElFL0Zsa1ZCYTUv?=
 =?utf-8?B?Y2ZkMVRvS25icVlXbzVMeHo4eHZvYVM3STRwam1CWDhJMHd4a285Um1sd1Jy?=
 =?utf-8?B?cWNZaEJHdHZnNnIrKzl2L0srY2xTNVE0RUlWZXcwVVNjUnFXa0dGTFFGa0Np?=
 =?utf-8?B?R3ljS1I4aXlqTk43akFQZDBlcE9ZMzlIZXJTT1Z1MXYyck11Y0RKRURHdU8x?=
 =?utf-8?Q?TvDIyyHdGLD1ZqDI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4AAF2FB45823F44867DF989B66A9F68@apcprd06.prod.outlook.com>
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
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4439.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f79d5d-ff4c-48e1-03c3-08df3adaa65e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 01:18:07.7738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gdPodoEzyXeD4wYpR4v2q4EcizMPfoHwSqGplPSRgwtjRDoqkKvxAHx2rVZNw1n5Q0W95a/OyVBIPHCrVKEjmwdRnrWeT+WKRGtPuUetBA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6921

VGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgVVNCU1NQIGNvbnRyb2xsZXJzIFVTQjQg
YW5kIFVTQjUgb2YNCnRoZSBDSVggU2t5MSBTb0MuDQoNClBhdGNoIDEgYWRkcyB0aGUgZGV2aWNl
IHRyZWUgYmluZGluZywgcGF0Y2ggMiB0aGUgZ2x1ZSBkcml2ZXIsIGFuZA0KcGF0Y2ggMyB0aGUg
U29DIG5vZGVzIHBsdXMgdGhlIGJvYXJkIGVuYWJsZW1lbnQuDQoNClRoZSBjb250cm9sbGVycyBh
cmUgQ2FkZW5jZSBVU0JTU1AgaW5zdGFuY2VzLiBUaGUgQ0lYIGludGVncmF0aW9uIGFkZHMNCnBl
ci1jb250cm9sbGVyIGdsdWUgcmVnaXN0ZXJzIGluIHRoZSBTb0MgUkNTVSwgYW4gQVhJIGJ1cyBh
dHRyaWJ1dGUNCmNvbmZpZ3VyYXRpb24gcmVnaXN0ZXIgYW5kIGEgY29udHJvbGxlciBzdGF0dXMg
cmVnaXN0ZXIsIGFuZCBtb2RlIHN0cmFwDQpjb250cm9scyBpbiB0aGUgUzUgc3lzdGVtIGNvbnRy
b2xsZXIuIFRoZSBnbHVlIGRyaXZlciBtYW5hZ2VzIHRoZQ0KY2xvY2tzLCB0aGUgcmVzZXRzLCB0
aGUgc3RyYXAgY29udHJvbHMgYW5kIHRoZSBnbHVlIHJlZ2lzdGVycywgYW5kIHRoZW4NCnBvcHVs
YXRlcyB0aGUgQ2FkZW5jZSBVU0JTU1AgY29yZSwgd2hpY2ggaXMgZGVzY3JpYmVkIGFzIGEgY2hp
bGQgbm9kZQ0KYXQgdGhlIGNvcmUgYWRkcmVzcy4NCg0KVGVzdGVkIG9uIFJhZHhhIE9yaW9uIE82
IChTa3kxKSBpbiBob3N0IG1vZGUsIHRvZ2V0aGVyIHdpdGggdGhlIENJWA0KVVNCMyBQSFkgc2Vy
aWVzIHBvc3RlZCBzZXBhcmF0ZWx5Lg0KDQpUaGUgc2VyaWVzIGFwcGxpZXMgb24gdG9wIG9mIHY3
LjQtcmMxLg0KDQpDaGFuZ2VzIGluIHY2Og0KLSBEcm9wcGVkIHRoZSBzaW1wbGUtYnVzIFJDU1Ug
Y29udGFpbmVyLiBFYWNoIGNvbnRyb2xsZXIgbm9kZSBpcyBub3cNCiAgcGxhY2VkIGF0IHRoZSBh
ZGRyZXNzIG9mIGl0cyBnbHVlIHJlZ2lzdGVycyBhbmQgdGhlIENhZGVuY2UgVVNCU1NQDQogIGNv
cmUgaXMgYSBjaGlsZCBub2RlIGF0IGl0cyBvd24gYWRkcmVzcy4NCi0gUmVwbGFjZWQgdGhlIHVz
Yk4gYWxpYXNlcyBhbmQgdGhlIHVuZG9jdW1lbnRlZCBpZCBwcm9wZXJ0eSB3aXRoIHRoZQ0KICBy
ZWdpc3RlciBvZmZzZXQgYW5kIGJpdCBwb3NpdGlvbiBhcmd1bWVudHMgb2YgdGhlIGNpeCx1c2It
c3lzY29uDQogIHBoYW5kbGUuDQotIERvY3VtZW50ZWQgdGhlIGNpeCx1c2Itc3lzY29uIGFyZ3Vt
ZW50cyBhbmQgYWxsb3dlZCAjc3lzY29uLWNlbGxzIG9uDQogIHRoZSBTNSBzeXN0ZW0gY29udHJv
bGxlciBiaW5kaW5nLg0KLSBDb252ZXJ0ZWQgdGhlIHByb2JlIGVycm9yIHBhdGhzIHRvIGRldl9l
cnJfcHJvYmUoKS4NCi0gUmVtb3ZlZCB0aGUgdW51c2VkIG92ZXItY3VycmVudCBHUElPIGhhbmRs
aW5nIGFuZCB0aGUgdW51c2VkIGRyX2Jhc2UNCiAgYW5kIGNkbnNwX3BkZXYgZmllbGRzLg0KLSBE
byBub3QgZGlzYWJsZSB0aGUgY2xvY2tzIGJlZm9yZSB0aGV5IGhhdmUgYmVlbiBhY3F1aXJlZC4N
Ci0gRHJvcHBlZCB0aGUgcmVkdW5kYW50IGRlcGVuZHMgb24gVVNCX0NETlMzIGFuZCBmaXhlZCB0
aGUgY29tcGF0aWJsZQ0KICBuYW1lIGluIHRoZSBLY29uZmlnIGhlbHAgdGV4dC4NCi0gUmVmZXJl
bmNlIHRoZSBzaGFyZWQgVVNCMyBQSFkgdGhyb3VnaCBpdHMgc2luZ2xlIHBoYW5kbGUuDQotIEZp
eCB0aGUgMTI1dXMgcHJlc2NhbGVyIHZhbHVlOiB0aGUgaGFyZHdhcmUgZGVmaW5lcyBpdCBhcw0K
ICB0aW1lICogZnJlcXVlbmN5IC0gMS4NCi0gTWFrZSB0aGUgQVhJIGhhbHQgd3JpdGVzIHJlYWQt
bW9kaWZ5LXdyaXRlIHNvIHRoZSBwcmVzZXJ2ZWQgYW5kDQogIFJXMUMgYml0cyBvZiBYRUNfQVhJ
X0NBUCBrZWVwIHRoZWlyIHN0YXRlLg0KLSBDb3JyZWN0ZWQgdGhlIG1haWwgc2VuZGVyIG5hbWU6
IHY1IHdhcyBzZW50IHdpdGggYSBub24tQVNDSUkNCiAgZGlzcGxheSBuYW1lIGluIHRoZSBGcm9t
IGhlYWRlciwgdjYgdXNlcyB0aGUgcGxhaW4gQVNDSUkgbmFtZQ0KICB0aGF0IG1hdGNoZXMgdGhl
IFNpZ25lZC1vZmYtYnkuDQoNCkNoYW5nZXMgaW4gdjU6DQotIEFkZGVkIHRoZSBNQUlOVEFJTkVS
UyBlbnRyeSBmb3IgdGhlIGdsdWUgZHJpdmVyLg0KLSBGaXhlZCBjb250aW51YXRpb24gbGluZSBp
bmRlbnRhdGlvbiByZXBvcnRlZCBieSBjaGVja3BhdGNoLg0KDQoNCkhvbmdsaWFuZyBZYW5nICgz
KToNCiAgZHQtYmluZGluZ3M6IHVzYjogQWRkIENJWCBTa3kxIFVTQlNTUCBjb250cm9sbGVyDQog
IHVzYjogY2RuczM6IEFkZCBDSVggU2t5MSBnbHVlIGRyaXZlcg0KICBhcm02NDogZHRzOiBjaXg6
IEFkZCBVU0I0L1VTQjUgbm9kZXMgZm9yIFNreTENCg0KIC4uLi9zb2MvY2l4L2NpeCxza3kxLXN5
c3RlbS1jb250cm9sLnlhbWwgICAgICB8ICAgMyArDQogLi4uL2JpbmRpbmdzL3VzYi9jaXgsc2t5
MS11c2Jzc3AueWFtbCAgICAgICAgIHwgMTU1ICsrKysNCiBNQUlOVEFJTkVSUyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKw0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvY2l4
L3NreTEtb3Jpb24tbzYuZHRzICAgICB8ICA0MiArKw0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvY2l4
L3NreTEuZHRzaSAgICAgICAgICAgICB8ICA4NSArKysNCiBkcml2ZXJzL3VzYi9jZG5zMy9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICAgfCAgMTMgKw0KIGRyaXZlcnMvdXNiL2NkbnMzL01ha2Vm
aWxlICAgICAgICAgICAgICAgICAgICB8ICAgMSArDQogZHJpdmVycy91c2IvY2RuczMvY2Ruc3At
c2t5MS5jICAgICAgICAgICAgICAgIHwgNjgwICsrKysrKysrKysrKysrKysrKw0KIGRyaXZlcnMv
dXNiL2NkbnMzL2NkbnNwLXNreTEuaCAgICAgICAgICAgICAgICB8IDEwMCArKysNCiA5IGZpbGVz
IGNoYW5nZWQsIDEwODEgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2NpeCxza3kxLXVzYnNzcC55YW1sDQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdXNiL2NkbnMzL2NkbnNwLXNreTEuYw0KIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL3VzYi9jZG5zMy9jZG5zcC1za3kxLmgNCg0KDQpiYXNlLWNvbW1p
dDogNjYyOGU3ZDRjNmIyNWM4ZDE4ZjEzNDVlM2EyMGQyMTgyOWFhZTdlNA0KcHJlcmVxdWlzaXRl
LXBhdGNoLWlkOiAyZjE0NTlmNzVlOTJkN2ZhZWI5M2ExZTJmMzlkMjc5MDFiZWEzZTM5DQpwcmVy
ZXF1aXNpdGUtcGF0Y2gtaWQ6IDM5ZTc4Y2UxNzY3OTA4ZGIxMjkzYzQ4NjhiYzMyMGFiZWRhY2Zl
YmYNCnByZXJlcXVpc2l0ZS1wYXRjaC1pZDogMGYwZmQ0NWFlMGQ3Y2M1N2ViOGM4OTlhMmVjYjlm
MWVmYTZlYmJmYw==
