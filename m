Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792627382;
	b=rZeAOXG4Xv/nZqhg9MK8gSSqRGNUoV8bOtDuT7mSAKgbf7Yw1aOwHEb+FR2Kwjknd8R1
	 igfjbYkFWGLAtTi+uwzrqwiJJcw56sbo/rWdMHpheaUdLbZMijUGM+sfB70GNBeDEJcD2
	 sPekCanDVo6+sfrffnlk/aPZl7j/r6WfyBvFy/6CzFnCKduCwTH/oydFA2zJapW9RNjIY
	 AA9t119scoHxSbprJPQhjMMTPwS8CWIUOTlPK7AUSm7RcO+HnCsjeK+Gqg7sAvHtQTyvA
	 e3L5wyhT9UxuU03D7+JzprI/mEQ10GNy1/mwzhWRQanG1xFf9Z4BKi9nM3MoGoUHx4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627382;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=9g6rAe9GK0V2QiCXnpc6S1VQQTjxunJpgH7CdIdx/PM=;
	b=JKugOVY+f9eJAbOjsVyBgmahh9+5Df+HLqj+dTfJo1fJ/v6P2nr1wfeYQUlsa3Vt9jEL
	 lkw02UDAMtaEG1uCUEaOQmtQm1rBISib4g2ePpRflaU4yHvApKyziCerX/di5WinXXsGS
	 efUAJeUvpUegtzPKtdH0KHPdQEyKS8aTAQuFuMqgcn7RsAvjNV5maKNOOygLbnOQv5TVL
	 2S26VzCd0V8cSPDY/zc1srJlYO7XVSaDZDJMfxKlbhF1XA4LpeTgLjrl3PoSeldqvXZDT
	 BBqDLph7WU0/rZlEPAtteTZaSUjMlUvu6Wb6y2PrEILUXhQJWh7t9XssB6Ui7QlQgbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fujitsu.com;
	spf=pass smtp.mailfrom=fujitsu.com;
	dkim=pass header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=selector1 header.b=CX13nnCG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.69
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011069.outbound.protection.outlook.com [40.107.74.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57117606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57117606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=selector1 header.b=CX13nnCG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FL88RY/Q6JIoZNtnYjBwJN3qV56+0NCKf9U6uSjR9tyXUYR7HasX0bnkBq5fLyx12j6YPEbGcTBKC8CwLHkJI5BE1Kl3GAu0UaGLyuYoO3xdgHcN9iul5ivmS106Ak1MDUW/9WKuX7XjsjR1v2rQVEeK85ET1tceCCjAE5buxMN3Zb0pFHwGd2Yowzia6eU0Btl6Hc7CY9ESK971Lgh1EJEUrjFOtVEryWwrcttKw7VN23N2mXSukvCc3sKM6gitvFSYCYtaC6h2y1YH7tZW/5gCb4QDDPJpqctDxP3YBsbCBTuZLmEHS6WdhQ7xH0qCxYC+OpKVyhQpfdptwwivhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9g6rAe9GK0V2QiCXnpc6S1VQQTjxunJpgH7CdIdx/PM=;
 b=cqjr5sdQOEdbEArVgXFVKlx8g18C/aZth0ysbiNcidhkxcOZAaDdhzyxwSvW4tXamGayY+6X/H22qW251dggEKoBcUIOEkXTOq1YXv4uU4C+BqYI8LllRY7r+ft5uLf4BQC+e3k53bIFzT1+t3QjWo3Wkly0o2IFszDftsaxC+llBM5xYlBF/OugpnPPQGZEVdF3Prbojk/XGz2tfyAteRdnOgSN/cQV2oW8TpqLB34jJDE+njmZP8FuQNHedhJBwXJeODmVJ96hQCyI4rPuBr67zj7V89wQ7E0KG7gIQvg9VHOPSlybTqZ4aK0xXcWWI+0uL9eC6hW/7MIgJwoMqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9g6rAe9GK0V2QiCXnpc6S1VQQTjxunJpgH7CdIdx/PM=;
 b=CX13nnCGq7J7l6n/DuRTrPNdu8zkBTqD7LIYCa2AzEb5F/zQc0qs0wGHojOmAAvlhI7U2yunIg7JgaQ62Be9+JtgN6R0RWPVrbnp1CXvttatkeHnLoeg19WA4x2ftHeaynF033SINRjaIP39hfdpFjYcKszDo2SaHqGKZriFZw2eACdHkRrSlADIQOXsw6s1q+qhWuzBlBoDWpO109pr3OYiC0HMur+1GUUs6gfrO6BVrj/qBft4w3/zzpjAI20GW4viNdnkz2wFI+Dr86FF0rsTChKvLII0bF1KUhBkyBLW5HgGjIHPn5uAxx+/0qDnSPCMpj3TGItlqhHnYZ976w==
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 (2603:1096:405:338::19) by OS3PR01MB9446.jpnprd01.prod.outlook.com
 (2603:1096:604:1cf::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 00:02:58 +0000
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957]) by TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957%4]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 00:02:58 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: "Jinjie Ruan <ruanjinjie@huawei.com>" <ruanjinjie@huawei.com>,
	"tony.luck@intel.com" <tony.luck@intel.com>, "reinette.chatre@intel.com"
	<reinette.chatre@intel.com>, "Dave.Martin@arm.com" <Dave.Martin@arm.com>,
	"james.morse@arm.com" <james.morse@arm.com>, "babu.moger@amd.com"
	<babu.moger@amd.com>, "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "ben.horgan@arm.com" <ben.horgan@arm.com>,
	"fenghuay@nvidia.com" <fenghuay@nvidia.com>, "x86@kernel.org"
	<x86@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 0/9] arm_mpam: Introduce Narrow-PARTID feature
Thread-Topic: [PATCH v9 0/9] arm_mpam: Introduce Narrow-PARTID feature
Thread-Index: AQHdYaoTFl99kBy38EazIQLq1qR3Q7cIq2QC
Date: Thu, 22 Oct 2026 00:02:58 +0000
Message-ID:
 <TY4PR01MB16930CE9AD3B1D0AF7BEE6C208B662@TY4PR01MB16930.jpnprd01.prod.outlook.com>
References: <20261012082337.822258-1-ruanjinjie@huawei.com>
In-Reply-To: <20261012082337.822258-1-ruanjinjie@huawei.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-10-22T00:02:31.126Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB16930:EE_|OS3PR01MB9446:EE_
x-ms-office365-filtering-correlation-id: 2be1f11b-8e3c-4385-2314-08df2fcfd4c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|261009223027099003|10067099003|56012099006|3023799007|261021121427099003|6133799003|1580799027|22082099003|18002099003|261021123027099003|38070700021|11063799006|921020;
x-microsoft-antispam-message-info:
 /GYTvUvtMcOxSW+zkhgjx4lJxKKn/VRrrLOf2lcWQJgYAJG1jGpGiqSXamuwgv1d4gSNf5FbQNpu+q64bDm3l2nATFW4x7y8TjGcIMKRxnzhWAEehWY9edC8HxOLGoDuSYHL7wMhliNINyoj3BVmmDDKMyuMeYmkzcxKgUi6Q0rbKr1G80sPtGBQvEXU2qtX4cYi1lX45m03paO41z6X6wHDeTctRS7K97JvICmrilvJKRgr/fAu6Ut0JCfprWR0sFacksSq9rFJEA74LXKunbbheIVJTrbG4V1iwwhv+3ZL9k7LCuJHNnPD+7zeOg8wSwAz8Ql9xa6WRGkE3mNmN2TJ4DAcyEcXtPVc7+Dp3hXPB27jOS3ci5LiQMFZR88E3MWq14bmeqdWMg9Ex/9pvXWXPLrRJiVpxvpR21dY7AZZC8Fkb7SA2iCaksH7Ce5OHTTIfZ63PA/xfnJEudn+ibSNJPu9LoVI4tBiGch8z0O6ydZUDspaBZJJ+/pt4AZgYI9o0gB3HcKPTRrXS2lZttwEEZwS9M86Vpfq4ZRuYeEAR34KkHrqgzSL04WcB+UvjWsdjScJapgNWHsfR9s/W5sBbd9Q5i0PTTivlpOCS5Rod7HS21Sx7Bk76KwMwCUscWRQiGplwMC1G0JagEAX0kLahu1TnMZ6UhDqt6itizyd3PSLhQ7yIOwY5+8AmGUQpi2VgjsZtw8qh2fTFEocyQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB16930.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(261009223027099003)(10067099003)(56012099006)(3023799007)(261021121427099003)(6133799003)(1580799027)(22082099003)(18002099003)(261021123027099003)(38070700021)(11063799006)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d1QvVHVSdEFRSXJFMFFLTEFKd3JvR3NSSFpHOEIzNWxaL3VHMmVSUnBqeEVp?=
 =?utf-8?B?S3dUZVhsbFlMZVZrR2ZXSlFoWjZocHBMTnNvVHJxK1VSYm15YjdocnVQcEJN?=
 =?utf-8?B?b3hTWGdOK2p0Z1BhM0UxMHNQRm5IL2NuYnJJQXlJVGNZS29FWWhyQW1vNnhn?=
 =?utf-8?B?UG5Ec0tjU25zaEpURFRobFoxTUx0SitzcXJlZWJrSUFIeDB5VXFPeE9FNmox?=
 =?utf-8?B?NVg4SzBONTM4TGVESUVZVkFlQmlwU0pXTTVWVDlabkQrNGp6Ni83YjZQcnIz?=
 =?utf-8?B?dzNwSmZtK1UvSnBTZGhQaXU1MUd0VnpOQVBGV3NvRWZmdGY5RFc2dkN5b0pX?=
 =?utf-8?B?cVp4UE1BaTYzQTJ2RWVuL1hWRVhuWXE2SjFESFpsU2JycjZzYk8zd3d0RTFI?=
 =?utf-8?B?RjVsOW1WdlNUY1RWN3IwS2o2U2JZL3hGUUJEUWdlczNGOUxuL0VMbkhMSTVw?=
 =?utf-8?B?Q1FGems3WElFaHk0Uzk0RnlBWm1MR1FwS0lMUUVLUnpGQ1lLNkMzdGNEUUkv?=
 =?utf-8?B?RnM1YmtHNi9GTUdDdVl1bGJuVUU5dHk1KzBJZkJpNTFFLzczbjhlZkVyNXd1?=
 =?utf-8?B?Zlh5VjdYL3lpRDlYMGFLNXRCOTZ6ZE5tNWlseDA1cXBoRE1vK1hWZ2doaFRV?=
 =?utf-8?B?WjVxbU1GTERpUFhZR2ZtVlZjUjFqNW5lcHFpQXJPeWNhYzFTWjgvSVZTSTEr?=
 =?utf-8?B?RENyckNnVnVjcTJoSnN0TlZrajJ2SmNTMXhTdzhXTFhKL2hFcE1jTzkyVkJH?=
 =?utf-8?B?dnh4LzhMSE9yU3U5NjhoNDdCeEZoUkZpS1hPbWFtYUhuUC9hMC8wUEJ4M0lK?=
 =?utf-8?B?TVJqb1lzRDlOVk5UOGxpTDRFbktJMENQa2kyc21pcml5UWZETTB5aWp2OGNy?=
 =?utf-8?B?Q0ZKZExFUFZYa3pFaXVqYTZSQkM2SXpTYy9QaFZPNGFZaitkR09xZWwyTDFR?=
 =?utf-8?B?S3QxOEpZd1ZxUEZhOWY4NXB6dGtoSUZOWkJNUk1KVldkZ3JGN09ySmx2VFhC?=
 =?utf-8?B?M1pxQzEyL2ZEemx4Um9FSUovdVl1dElHL0R2Y1R4Wnh1M0JXa3hQcU4xSzFs?=
 =?utf-8?B?djVENkxSYzIzd0wrS20wRXVwcEwvVGxEMmhJMDZRVUVMUHNqeVJwL3J2VkZa?=
 =?utf-8?B?cjVDRXFUamlZb2krOWVRMDVLTUduVUt5TjAwQmNhUnIxVkNOL2huWWg5R254?=
 =?utf-8?B?alBRUnlURVY2NU9LVUxaaHhDTXpSQ0d3TVAxR0xaYjJuZnVvNUE5YzBXbTJE?=
 =?utf-8?B?aFo4Nm9SRjE3T05sTzJFZjRzRFcvSWJ6QzRNL2ZEa2ozZ04zYXdIaVdURlNE?=
 =?utf-8?B?MXVZekRsYmRnVERWb3p0T2ZOeHk3OUxXc2pKOCtQZkNJSThkRnNRU1RwcEJO?=
 =?utf-8?B?YXlISXR6T0J0UStSSlBkYkdXdnk2Z1ZqN3ZTU2RiZ243RERSMFRhTWJjSFF5?=
 =?utf-8?B?L1krN095MGYxMXo5RTBQZTBCV1pxOWoxSmo4RER5RHUzZldIRERrNU5SOU5j?=
 =?utf-8?B?Uk01WWZxN002QlZUaGZPaHZzOTltZ2RUYzQyK1NXWTlPK0x4azRvZU5EZVg5?=
 =?utf-8?B?RGh3dUxLbDJxTkxmRENCeURpbnRlMFpab2h5VVowTzVCNWNNLzFhbEtrTSts?=
 =?utf-8?B?STVJWDNLUXBLUTVzeUMvazQ3WnBVd2tCZyt3VktlR240Ri9SdGJLWVZVRE1j?=
 =?utf-8?B?bFZaTVYxdzFKNEU3TDdRa2kxdEovMEE5UTNoUDUvb1FUczdoSkliaWlTbk9i?=
 =?utf-8?B?MjJjTFFhcS84QldVWmFiY0c0NFpXaEdvam52MVhQMlkvVnV5eENmby9YWlQr?=
 =?utf-8?B?YzFMWW9OWlFWVzNZR290RkpUUCtneEU1by9jSmFrc3MzWkJ3U3BIc29BYStE?=
 =?utf-8?B?RVE5RmlGNFZjN3QyOHVhK1RGc05iVXQxSWR0MDFvYU05OFdFK1pwRldjZmhS?=
 =?utf-8?B?d1d5NzdSOWF0S0RKVTlBY1BYbWJ5S2NXK0drdEFjV2k5dVdlRXEvSVlYU2Zr?=
 =?utf-8?B?QS93OEQvZFpncFR6TnB3R1hZalBuUWdqN3d5NmRuU0V4VGFkNlRDMTNKZHZ3?=
 =?utf-8?B?T2IxNjludjFvNHI1dTRYTFM4c252V0FQS0NXb2xyNUExM3k4Q2gvSFlkYkZP?=
 =?utf-8?B?cEFmUXNseUhLcDRRWGM0T1lLQVZUNjB4c2cxNHk1Z2ozMjhDVWN5cVUxendt?=
 =?utf-8?B?cHlWZUVPZzJncjVjQjM1RHlpbmE5Mkh3SFRtbVBIZzlUT0E0Z2xMVFNENVFU?=
 =?utf-8?B?TkxwejBuc1hoYnV5SlU0aWZIR0hXd1JST20yaXZzV2k4Tjh5ZkwrNlpwOFZT?=
 =?utf-8?B?NDJDSEdSbXZ1VnVlOXdNblhJOENVc1ZURjVEWGZkYkprd1RLd2pRUT09?=
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
X-Exchange-RoutingPolicyChecked:
	w/Q7c+UwpgpRyZBLBNixUDw+Mv2lDZUmrpHo9xYDc89Xi5UHrQYcSfQV1vdWGIvHiXUppJhgqAce8pRBD+tMg3YytxVzHVtA5JrYnxs1a7rjIywmEfzKRJPjlT+MZtNvnRMsks8SkvNU8Rt9/KoITLZoBlySZwaWRe8+gA1+BdpFL7OLcgx7KQngmPP+6w3x68q3fvhmrQQjBM3R07WGZEJ0Wm8bIOaeLWIJNxCpSlqynUg1n5r5D52WISNTsGwabX60PAheK/PxvQ8X9JSsYoaOoUmiK6PEOTNFmBDl8W6gy+kSYqF4+csbmg4s6OldwAvpr7pZAiOEtCwNnf1i2g==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB16930.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be1f11b-8e3c-4385-2314-08df2fcfd4c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 00:02:58.3879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sa3AEqH0Ldcb89t75y7gkL7zu5wwck3Av6GUMO7nQPAiytSXLOeY6RXKHiETLpdP0binKG0zbOS8Z+RpYsgLm5wJGm+bn8r4GInh/S3eN6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9446

SGVsbG8gSmluamllLAoKSSB3b3VsZCBsaWtlIHRvIGNvbmZpcm0gdGhlIGZvbGxvd2luZyBwb2lu
dHMuCgogLSBJcyB0aGUgbnVtYmVyIG9mIHJlcVBBUlRJRHMgcGVyIGludFBBUlRJRCBkZXBlbmRl
bnQgb24gdGhlIHRvdGFsIG51bWJlciBvZiBpbnRQQVJUSURzIGFuZCByZXFQQVJUSURzPwogLSBH
aXZlbiB0aGF0IHJlcXVpcmVtZW50cyBmb3IgdGhlIG51bWJlciBvZiBjb250cm9sIGFuZCBtb25p
dG9yaW5nIGdyb3VwcyB2YXJ5IGJ5IHVzZXIsIAogICB3b3VsZCBkeW5hbWljIGNvbmZpZ3VyYXRp
b24gb2YgdGhlIG1hcHBpbmcgcmF0aW8gYmV0d2VlbiBpbnRQQVJUSUQgYW5kIHJlcVBBUlRJRCBi
ZSBhIG1vcmUgc3VpdGFibGUgYXBwcm9hY2g/CiAtIFJlZ2FyZGluZyB0aGUgbWFwcGluZyBsb2dp
Yywgc29tZSByZXFQQVJUSURzIG1heSByZW1haW4gdW51c2VkLiBJcyB0aGlzIHRoZSBleHBlY3Rl
ZCBiZWhhdmlvcj8KIC0gQ29uc2lkZXJpbmcgdGhhdCBBcm0gaGFzIHByZXZpb3VzbHkgaW1wbGVt
ZW50ZWQgdGhpcywKICAgYXJlIHRoZXJlIGFueSBnYXBzIGJldHdlZW4gdGhlaXIgaW1wbGVtZW50
YXRpb24gYW5kIEh1YXdlaeKAmXMgcmVxdWlyZW1lbnRzPwogICBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1hcm0ta2VybmVsLzIwMjQxMjEyMTU0MDAwLjMzMDQ2Ny0xLURhdmUuTWFydGlu
QGFybS5jb20vCgpCZXN0IHJlZ2FyZHMsClNoYW9wZW5nIFRBTgoKCj4gQmFja2dyb3VuZAo+ID09
PT09PT09PT0KPiAKPiBJbiBBUk0gTVBBTSwgYSBtb25pdG9yaW5nIGdyb3VwIGlzIGRlZmluZWQg
YnkgYSAoUEFSVElELCBQTUcpIHBhaXIuCj4gSG93ZXZlciwgbWFueSBwcm9kdWN0aW9uIHBsYXRm
b3JtcyBpbXBsZW1lbnQgb25seSBhIHNpbmdsZSBQTUcgYml0LAo+IGxpbWl0aW5nIHRoZSB0b3Rh
bCBudW1iZXIgb2YgbW9uaXRvcmluZyBncm91cHMgbG9uZyBiZWZvcmUgdGhlIHJlcXVlc3QKPiBQ
QVJUSUQgc3BhY2UgaXMgZXhoYXVzdGVkLgo+IAo+IEhhcmR3YXJlIE1lY2hhbmlzbQo+ID09PT09
PT09PT09PT09PT09PT0KPiAKPiBQbGF0Zm9ybXMgd2l0aCAiUEFSVElEIG5hcnJvd2luZyIgbWl0
aWdhdGUgdGhpcyBieSBtYXBwaW5nIG11bHRpcGxlCj4gcmVxdWVzdCBQQVJUSURzIG9udG8gYSBz
aW5nbGUgaW50ZXJuYWwgUEFSVElELiBUaGUgaW50ZXJuYWwgUEFSVElECj4gZGljdGF0ZXMgdGhl
IGNvbnRyb2wgZ3JvdXAgY29uZmlndXJhdGlvbiwgd2hpbGUgZWFjaCBpbmRpdmlkdWFsIHJlcXVl
c3QKPiBQQVJUSUQgZnVuY3Rpb25zIGFzIGFuIGluZGVwZW5kZW50IG1vbml0b3JpbmcgZ3JvdXAu
IFRoaXMgZGVjb3VwbGVzCj4gY29udHJvbCBhbmQgbW9uaXRvcmluZyBhbGxvY2F0aW9uLCBhbGxv
d2luZyBtb3JlIG1vbml0b3JpbmcgZ3JvdXBzCj4gdGhhbiB0aGUgUE1HIGNvbnN0cmFpbnQgbm9y
bWFsbHkgcGVybWl0cy4KPiAKPiBTb2Z0d2FyZSBTdHJhdGVneQo+ID09PT09PT09PT09PT09PT09
PQo+IAo+IFVzaW5nIHJlcXVlc3QgUEFSVElEcyBiZXlvbmQgdGhlIGludGVybmFsIHJhbmdlIGlz
IG9ubHkgc2FmZSB3aGVuIG5vIE1QQU0KPiBjbGFzcyBsb3NlcyBhIG5vbi1hbGlhc2luZyBjb250
cm9sLiBXaGlsZSBhbGlhc2luZyBjb250cm9scyAoZS5nLiwgY2FjaGUKPiBwb3J0aW9uIGJpdG1h
cHMpIGNhbiBiZSBzYWZlbHkgcmVwbGljYXRlZCBhY3Jvc3MgcmVxdWVzdCBQQVJUSURzLAo+IG5v
bi1hbGlhc2luZyBjb250cm9scyAoZS5nLiwgY2FjaGUgY2FwYWNpdHkpIGFyZSBhZGRpdGl2ZSBh
bmQgY2Fubm90Lgo+IAo+IFRvIGVuc3VyZSBzYWZldHksIHRoaXMgc2VyaWVzIGltcGxlbWVudHMg
YSBjb21wbGV0ZWx5IHN0YXRpYyBncm91cGluZwo+IHBvbGljeSBldmFsdWF0ZWQgb25jZSBiZWZv
cmUgcmVzY3RybF9pbml0KCkuIElmIGFueSBjbGFzcyBjb250YWlucwo+IG5vbi1hbGlhc2luZyBj
b250cm9scyB3aXRob3V0IG5hcnJvd2luZyBjYXBhYmlsaXRpZXMsIHRoZSBleHBhbnNpb24KPiBp
cyBieXBhc3NlZC4gVGhpcyBpbmZyYXN0cnVjdHVyZSByZW1haW5zIGNvbXBsZXRlbHkgdHJhbnNw
YXJlbnQKPiB0byB1c2VyLXNwYWNlLgo+IAo+IFBhdGNoIEFyY2hpdGVjdHVyZQo+ID09PT09PT09
PT09PT09PT09PT09Cj4gCj4gLSBQYXRjaGVzIDEtNDogQnVnZml4IGFuZCBwcmVwYXJhdG9yeSBy
ZXdvcmsuCj4gCj4gLSBQYXRjaCA1OiBUcmFjayBib3RoIGludGVybmFsIGFuZCByZXF1ZXN0IFBB
UlRJRCBsaW1pdHMgcGVyIGNsYXNzLgo+IAo+IC0gUGF0Y2hlcyA2LTc6IEltcGxlbWVudCBkcml2
ZXItc2lkZSBtb2R1bG8gaW50ZXJsZWF2aW5nIGZvciByZXF1ZXN0Cj4gwqAgUEFSVElEcyBhbmQg
ZmxhdCBnbG9iYWwgUk1JRCBpbmRleGluZy4KPiAKPiAtIFBhdGNoZXMgOC05OiBJZGVudGlmeSBu
b24tYWxpYXNpbmcgY29udHJvbHMsIGFuZCBlbmFibGUgdGhlIG5hcnJvd2luZwo+IMKgIGV4cGFu
c2lvbiBieSBsaWZ0aW5nIGRyaXZlci1zaWRlIHBhcnRpZF9tYXggY2xhbXBpbmcgYW5kIGZyZWVp
bmcKPiDCoCB0aGUgZXh0cmEgcmVxdWVzdCBQQVJUSURzIGZvciByZXNjdHJsLgo+IAo+IENoYW5n
ZXMgc2luY2UgdjgKPiAtIFJlcGxhY2VkIGR5bmFtaWMgYWxsb2NhdGlvbiB3aXRoIHB1cmUgc3Rh
dGljIGdyb3VwaW5nIGFzIHJlcXVlc3RlZCBieSBKYW1lcy4KPiAtIFJlbW92ZWQgdGhlICdtcGFt
LmludHBhcnRpZF9tYXgnIGJvb3QgcGFyYW1ldGVyOyBleHBhbnNpb24gaXMgbm93IGF1dG9tYXRp
Yy4KPiAtIEV4dGVuZGVkIHNhZmV0eSB2ZXJpZmljYXRpb24gdG8gYWxsIGNsYXNzZXMsIHByZXNl
cnZpbmcKPiDCoCBmb3J3YXJkLWNvbXBhdGliaWxpdHkgZm9yIHVua25vd24gY2xhc3NlcyB0aGF0
IG1pZ2h0IGdhaW4gcmVzY3RybAo+IMKgIHNjaGVtYXMgbGF0ZXIuCj4gLSBEZWNvdXBsZWQgdGhl
IGRyaXZlciBpbmZyYXN0cnVjdHVyZSBwYXRjaCBmcm9tIHRoZSByZXNjdHJsIGdsdWUgcGF0Y2gu
Cj4gLSBJbnRyb2R1Y2VkIHJlc2N0cmxfYXJjaF9ybWlkX2lkeF9tYXRjaCgpIHRvIGNsZWFuIHVw
IHRoZSBSTUlEIGFsbG9jYXRvci4KPiAtIExpbmsgdG8gdjg6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8yMDI2MDQxMzA4NTQwNS4xMTY2NDEyLTEtemVuZ2hlbmc0QGh1YXdlaS5jb20vCj4g
Cj4gUHJldmlvdXMgVmVyc2lvbnMKPiA9PT09PT09PT09PT09PT09PQo+IAo+IMKgwqDCoCB2Nzog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwMzE3MTMyMTQxLjEyNzI1MDYtMS16ZW5n
aGVuZzRAaHVhd2VpLmNvbS8KPiDCoMKgwqAgdjY6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDI1MDIyMjExMjQ0OC4yNDM4NTg2LTEtemVuZ2hlbmc0QGh1YXdlaS5jb20vCj4gwqDCoMKg
IHY1OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTAyMTcwMzE4NTIuMjAxNDkzOS0x
LXplbmdoZW5nNEBodWF3ZWkuY29tLwo+IFJGQy12NDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzIwMjUwMTA0MTAxMjI0Ljg3MzkyNi0xLXplbmdoZW5nNEBodWF3ZWkuY29tLwo+IFJGQy12
MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQxMjA3MDkyMTM2LjI0ODg0MjYtMS16
ZW5naGVuZzRAaHVhd2VpLmNvbS8KPiBSRkMtdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDI0MTExOTEzNTEwNC41OTU2MzAtMS16ZW5naGVuZzRAaHVhd2VpLmNvbS8KPiBSRkMtdjE6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MTExNDEzNTAzNy45MTg0NzAtMS16ZW5n
aGVuZzRAaHVhd2VpLmNvbS8KPiAKPiBKaW5qaWUgUnVhbiAoNik6Cj4gwqAgZnMvcmVzY3RybDog
QWRkIHJlc2N0cmxfYXJjaF9ybWlkX2lkeF9tYXRjaCgpIGhlbHBlcgo+IMKgIGFybV9tcGFtOiBy
ZXNjdHJsOiBBZGQgcmVzY3RybF9jbG9zaWRfcm1pZF90b19wYXJ0aWRfcG1nKCkgaGVscGVyCj4g
wqAgYXJtX21wYW06IEFkZCBhIGhlbHBlciB0byBjaGVjayBhIFBBUlRJRCBpcyBpbiBhIENMT1NJ
RAo+IMKgIGFybV9tcGFtOiBUcmFjayB0aGUgUEFSVElEIGFuZCBpbnRlcm5hbCBQQVJUSUQgbGlt
aXRzIHBlciBjbGFzcwo+IMKgIGFybV9tcGFtOiBJZGVudGlmeSB0aGUgbm9uLWFsaWFzaW5nIGNv
bnRyb2xzCj4gwqAgYXJtX21wYW06IFVzZSB0aGUgcmVxdWVzdCBQQVJUSURzIGJleW9uZCB0aGUg
aW50ZXJuYWwgcmFuZ2UKPiAKPiBaZW5nIEhlbmcgKDMpOgo+IMKgIGZzL3Jlc2N0cmw6IFVubW91
bnQgcmVzY3RybCB3aXRoIHRoZSBDRFAgc3RhdGUgaXQgd2FzIG1vdW50ZWQgd2l0aAo+IMKgIGFy
bV9tcGFtOiBEaXZpZGUgdGhlIFBBUlRJRHMgYmV0d2VlbiB0aGUgY29udHJvbCBncm91cHMKPiDC
oCBhcm1fbXBhbTogTWFwIHJlc2N0cmwgUk1JRHMgb250byB0aGUgcmVxdWVzdCBQQVJUSURzCj4g
Cj4gwqBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9yZXNjdHJsLmjCoCB8wqDCoCA2ICsKPiDCoGRyaXZl
cnMvcmVzY3RybC9tcGFtX2RldmljZXMuY8KgIHwgMTA1ICsrKysrKysrKysrKystLS0KPiDCoGRy
aXZlcnMvcmVzY3RybC9tcGFtX2ludGVybmFsLmggfMKgIDI0ICsrKysKPiDCoGRyaXZlcnMvcmVz
Y3RybC9tcGFtX3Jlc2N0cmwuY8KgIHwgMjEzICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tCj4gwqBmcy9yZXNjdHJsL21vbml0b3IuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEz
ICstCj4gwqBmcy9yZXNjdHJsL3JkdGdyb3VwLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMzgg
KysrKystCj4gwqBpbmNsdWRlL2xpbnV4L2FybV9tcGFtLmjCoMKgwqDCoMKgwqDCoCB8wqDCoCAx
ICsKPiDCoDcgZmlsZXMgY2hhbmdlZCwgMzQxIGluc2VydGlvbnMoKyksIDU5IGRlbGV0aW9ucygt
KQo+IAo+IC0tIAo+IDIuMzQuMQo+IAo=
