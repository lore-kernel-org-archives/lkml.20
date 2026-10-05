Received: from iad-out-004.esa.us-east-1.outbound.mail-perimeter.amazon.com (iad-out-004.esa.us-east-1.outbound.mail-perimeter.amazon.com [18.207.52.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5777441A903;
	Mon,  5 Oct 2026 11:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.207.52.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199155; cv=fail; b=hijWuBqdTA0ZZ+YhlBt4agcRMoC50hbRiro3xZYthuLO3obW+Q7lPKIk61qrBrhwkQUOwmmX7IQfR8Kh5yGmF8Ow8bHrNMid40vQac1B3UZ6LSVK7fL+yozzgrEKNBrsTB0bs/RTLMrbC+E7z+wIBRmK+5qMl5Q6UCckEvN/baY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199155; c=relaxed/simple;
	bh=0AUDnun6DeWGZEDCW60wZU9rYKVWiIj1AdfYXLRgVl0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tpHCWg6YRgFcAu6r/VETXEtOPEBwQDkmFQuAbzMirYJFTvstE87g+GOzrsn9yBTkUku9F4NrbTYljeTBvv/Izq+FGn3zry3m8khWbmQ33VLH18ievU5ok22LcVDh06iIynXJtggJJbAPSNgy0SZh/0TJQVnAHdwinknmqqQgctU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=BzOwS1y7; arc=fail smtp.client-ip=18.207.52.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="BzOwS1y7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791199153; x=1822735153;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0AUDnun6DeWGZEDCW60wZU9rYKVWiIj1AdfYXLRgVl0=;
  b=BzOwS1y7/UyPGnVhZPbE9s2mFtoGTPachezL85ehHjWEwWl9GNSei49D
   QjxnsKk1EiZi2dw51Wp5wh1RZgHPf0nn0DpJKtfym9RaU36E2pwR72cnA
   aOeJV6GPu//5OfNxPK+/6AucTzHRaYcdeMgFAI8s4DYrkgqcXJpzjJnX+
   axtAseva8qF+jmLwyb8kSJS3TL/KW+XD5f1NgIj3/RImDSEx9pqG6R0p2
   /jZ1kdjk0IchaPN1RrAmaBqpEmeDILIwvHL+COeB4yMLK3EWcYeZx4U7G
   r7C3pGzki4vE1p/arHShYQRaVKxTHn+g9YZV3gclj3yv0hzN4LogVNbit
   A==;
X-CSE-ConnectionGUID: q8vU3TRnTyu6WP2jBzaJPw==
X-CSE-MsgGUID: J91NTqjsSIqyiYBjZmC6nA==
X-IronPort-AV: E=Sophos;i="6.27,141,1787011200"; 
   d="scan'208";a="28863719"
Received: from ip-10-4-22-235.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.22.235])
  by internal-iad-out-004.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:19:05 +0000
Received: from EX19MTAUEB002.ant.amazon.com [72.21.198.67:7399]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.14.71:2525] with esmtp (Farcaster)
 id 251e028a-af16-4a0e-9b70-a6513fa297c3; Mon, 5 Oct 2026 11:19:05 +0000 (UTC)
X-Farcaster-Flow-ID: 251e028a-af16-4a0e-9b70-a6513fa297c3
Received: from EX19EXOUEB002.ant.amazon.com (10.252.135.74) by
 EX19MTAUEB002.ant.amazon.com (10.252.135.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Mon, 5 Oct 2026 11:19:05 +0000
Received: from SN1PR07CU001.outbound.protection.outlook.com (10.252.135.42) by
 EX19EXOUEB002.ant.amazon.com (10.252.135.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49
 via Frontend Transport; Mon, 5 Oct 2026 11:19:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/igVffG+F1aNrOAt81ZiM6/wxH/XrqgG6lB7WR4LIdec2F6q9040PrlANy4xZFbpKeuGGtZiqM36kPyFeufTPHc4oq9NnrdB2w+mvvGV9nPHeXQiSCSuXkV31SeulmudwfcQArfkat2aN6oB9Ni2aYGDKLrttSCMxbmUKqWxjfQLI69G2H1c/i/nkq1KJXbJIGsMow/Zlgtog4cjty1K7gpmWuHoyaWlWSwM/Z+HWMp0JjPW/6B6srzfGgkH1ub2KtRzCnF1PQaRw4KHbMMhPqcjV39cVeMmtCrkMOURjGSc8nmRyaLw/03WsiSmcIecddZv9eAWKSx0axYsDRZ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0AUDnun6DeWGZEDCW60wZU9rYKVWiIj1AdfYXLRgVl0=;
 b=N37hTs1+eaYNbN0Po6wmjnuUoAPK9ga2vo7yIBQZ0psd++NVEDuImCMfbHPyDKY7atg3EfEcSM5xXAgliWEFMuAVcH1e9CegZk9jzMq9n0ekCYMJwuCDxeG07Oo3kP4Cjw9VeBKiHGrHd10av3QcahJe7Gdt7DtCQjp80QrRHL3qY8nq8886Q0YnBP+x6byT98UEwQB81I5D3c4dN7XEni3dKBFkLIpxlxZlgVEsIXnv3MJokjRy/31U0Xqou0N1T2kPw3Vd6Wr6/AdveCXU/J9BekUtIL5k7IQXzbAoUbFRUvijEB40rQrciFEOyRXR90qj/eZVPh5krfN0CS1pNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by DM3PPFA08CB310A.namprd18.prod.outlook.com (2603:10b6:f:fc00::6ba) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 11:19:01 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 11:19:01 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Radu Rendec <radu@rendec.net>, Thomas Gleixner <tglx@kernel.org>,
	"Shenhar, Talel" <talel@amazon.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 6/8] irqchip/al-fic: support error and fatal outputs
 and FIC v2
Thread-Topic: [PATCH v2 6/8] irqchip/al-fic: support error and fatal outputs
 and FIC v2
Thread-Index: AQHdVLtSVk4ybO1bLk+uQVNgYIrZuw==
Date: Mon, 5 Oct 2026 11:19:01 +0000
Message-ID: <BY3PR18MB47223DDF986081E1A74E4A40C6962@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20260927080637.27285-1-farbere@amazon.com>
	 <20260927080637.27285-7-farbere@amazon.com>
 <a74366542ddd5e0e3fca71c5dee5d535cc9c560e.camel@rendec.net>
In-Reply-To: <a74366542ddd5e0e3fca71c5dee5d535cc9c560e.camel@rendec.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|DM3PPFA08CB310A:EE_
x-ms-office365-filtering-correlation-id: a132d124-68e7-46d5-b393-08df22d27502
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|5023799004|4143699003|11063799006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: nno3WDNdkKBVjLsnsaH1j+5NEtb5ae7kj8dhUvv/p84K6BWNPKe6Iuynth5N37oefUkG29Q207jyycvUBmoRDoMRZHAu7ifyPdqTSrG0gP95/QYOETWA3aPD6+0jC2fCRKHcRtjq21zbFyuBn44ah2L5ZVLI3ODAQPY5NcOpKJ4gzPRPE7YbmXQ+zVN0kdAypIXUjnszGCbuffRZJ35rZ9VZLr8YsJSOtlKQrWsOX/l07EpHmiVKzWBvIqLUGjgJYXxr2ygycqr/zSpuBKPkBMLlMOVR/tS9hVDwiHolVZnsMssWoiHMhcC4k56aHlab2wIQ7VM75PJUn7/OnZwVY8b0OK9FQNmvmndPjE6XpXutTMUIxKD1dVWLD5pi1yQs9T3SXbad7cl78FONrU9LN34FbmuVdv1ooO6Aohk8/MMr23DhJGPSWpTSDZXcD2+kVJ2cpmla258HDPrKT6aWdvhwNkKLz+r9afXG2s1+f87M/g4U7+NX6cxXdA7FKLGOj8qzEf5eX0QAqs2+c4OEVynd/+DrGf9DAlHCB5bsaF8y7KtPNJfN4Vd2gs4sa6dLtmGIVzqvkLq4560DEjXSMJpKYb0rxaZvLRqiuBM74LGbFe8bBAoHCfhRgn4BYd7mSvUJqoZki/FJcM4NAtHdpsVLyVOmWkByhouPecuSz6iEkN4GvwmQygubNkbe6OmTP/XY51s1XKrAkCsAl6mETFqyHqnHib+ytWmy/8ti8Oo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(5023799004)(4143699003)(11063799006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1BwaGJzS0ZSaDRzaHFoTER1RWZMbDJWSWwydGwzMmMya2VaZzJFc1h3UHpa?=
 =?utf-8?B?NWUvd3BwMlJIdmZPNWl3SHRYaHhJbXhZRzkzdm1ja29EK1BpeksrbHBJWXBY?=
 =?utf-8?B?by9ERWFJSFNONCswZ3hBWm9nNzZRRGJLM2MwUFlPVS9hcGxRLy9mRi9jVmlG?=
 =?utf-8?B?a05RZG9wMVZXbjZwSmVKVkdlRjZEQTZsTWo0ZUw4WS8xNjdBNVpNUDN3MWVy?=
 =?utf-8?B?SzUrbmRWNmhZTTBtVkFkdS9SYjd4ZklIZEVEL2Zqa0xYdGQ3bXlkQU1DWnZG?=
 =?utf-8?B?alEzUWZXVGNxNTJjbjIvdjBzTHRYR2p3cHAvcFQ2UzVBYmZabzBQWHp1cXVr?=
 =?utf-8?B?UW93QzZBYVhvWGVKZzI0Z3VrZ3BrOFFicVFjdFRrU1RCYWc5UStIY0dGMTNI?=
 =?utf-8?B?S0ZJL0hBUlZMcmR5ZDc4ZERWL1NtV29FeUNXaENPSTdLR1d5WUYyTThvalo4?=
 =?utf-8?B?M3JCbkE4cGx6RXhHNmYyeVBKQ2ZkcmF3ZTF4Qnc0eXh4V0piRU1ROVRxdG9u?=
 =?utf-8?B?Myt4ZWY4VDBiM0lYb0dZR0E4VGJSb0p4U3RUMTFWQ1F6elhLOFdoT0crN3ZN?=
 =?utf-8?B?WXZLNWdzMU1NdHdndm95NzczNUVITmoyUnBDc3ZNaXI4T0NveVBTcmRhK0Rh?=
 =?utf-8?B?dlhYdXRZcW1oRmV0OTk2VDZmTnRjMG5BbWoycGx1RjZnWTZSS1ExUER3U3ZD?=
 =?utf-8?B?T1JmQVdCV1UvdU1zUk5DOHo3NG0wT1VOb0JjTXdPaFdJNDF1MHArVFR5cDBX?=
 =?utf-8?B?aHM2RnRqdXhCQmNwZUdJNE9EQ0ptSG5XYmEyYzdLY2pNQTlpaTM4TjFvRUFk?=
 =?utf-8?B?UU5jZFM1c0hFdzRDOVlXbmZYdTZ1QStVd2tMSVR0MlFWc0VLTmRselJsbGFi?=
 =?utf-8?B?NXlMeUtac0ZvWlgxS1h4ZStJMnVhTEpLanM3d2VJSHNuRm0zL2hXWFJ3ZmNs?=
 =?utf-8?B?ekRiVktVVFoxeW1HWHRVaGRBSTBaT0Q1dVFrUy8zZmpvTTJIdEdMWUQxclN2?=
 =?utf-8?B?TXpHVDNzVER6NzZWWlJId0luT1JtSW1FZExxWGJxN1NMN05wY3o0bFdvWmg2?=
 =?utf-8?B?aW1QZzBqZzVBb0ZxQm52QnNLS2t6Qi80S2lBcnJvNmVRZ2xJNzVjdmJWc08x?=
 =?utf-8?B?ZnhUKy9GK3NPUHJVZFRjd1NaS3lPOTVDR1RVQmdFWVFKODlxMm5BTTJTNnVO?=
 =?utf-8?B?dWxwQ1M5MlN0VVNLaCtmbmdQQnU4TXRjWm9VT0Z5dzVtc1V5YmU0NUlIbWU2?=
 =?utf-8?B?b1dvYjFkVSthdGluM1lwTzhhbVRrOUJBS1JwWE5RcXZCV1FrR0treWVLVHli?=
 =?utf-8?B?NVpuTEFwUDQ2blJmb2p1ZGpLcGpGSTRjMldUQ2VKc1ZuM24zclpwQ2krRmlD?=
 =?utf-8?B?TWFlRFBCZjkyWkgyb2NXWHJ2R0JCVFpNMmEyRm00eE8wVHNZMCtWR2tiYzlx?=
 =?utf-8?B?dnh2eTJZaWo4SnJTU2VvR3M2UGtsU0p4RUlmNFN6VVRPUXVQeVV5WFJ2L1B6?=
 =?utf-8?B?dWR0aDVlSkM3Qm1BQytXK3ZuQldjMjl4OXp6bGptL0NQVmtzVVVWOUZhQUly?=
 =?utf-8?B?N2Y1N0Qxemlhd0NQbHZocUtzWUZwaVZHTkdlYXNZTnpsQjNDaWF1WEpFY25C?=
 =?utf-8?B?bVovYkNuWFZsMVhhS0J3cFJJRnY5ZWZYenBraEVyMFRnVXJwcDNUNGJzU0tS?=
 =?utf-8?B?aGplRVA2WXR6dUwxQlArNlkvdVYybXI0NitmNWkxYXIrTXhnRm50dU41bi9P?=
 =?utf-8?B?ZE9zYlBOUThvMXgwRlVDeWphcXUyQ1IvMnY4bVNGaHQvbU5NSm1kWFgzWGVG?=
 =?utf-8?B?UXlvZFhLRXl6RFROWU9uSU85U1hxWlR2L2pGd2QySkxnMDNJdW53LzdtTXBa?=
 =?utf-8?B?MW5qQ2dFSVFLRVdOMStQb0NPdk11bWhnWVJxcWIzVVNBOUpSNXFjNjhITWxT?=
 =?utf-8?B?TGJOODNDNzl5ODBVcjNJTzBjSzNBSkhFOVVZYnhIaHVyK01penNqV2sySEFF?=
 =?utf-8?B?UlREVkJ3V1RUbkUwM2tKK0FVQ01ENnltMHUvR2o2Ky91dHJxL2YyUFhkYm9O?=
 =?utf-8?B?ZVdaS2pNU0YxQU9HbXRkcHhvRjd2d2JLeTViN1FrS0NhRXJ0T0RoeDFSU2p3?=
 =?utf-8?B?dGxJMHV4dndHOGJqSFRnYUhoOWYzM1ZpMnNDclVmb3R0bmluaXorelZjTUpF?=
 =?utf-8?B?NG1pN3lGeC84RGdwa01aUkdQTXNyYkxiSnJtSnZiL1N2Mkg4Qkx4UDBXM0VR?=
 =?utf-8?B?dEhLZHNrWkV6Vi9oUGtJdHZSelNPMmRPa25kTHNnT0NsMEQrRnMrUGFGMkdv?=
 =?utf-8?Q?vFJE/ALeFQc8E51jww?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Sx4Ac+/hBpNVspzNIJNNaRrHVXHv+Qwdi1Xldjw2CKssojAKopuE1OAi9MLVEGgX1RkCOS5K2Uj+a0hk7WjRYPXf6Ix4Y/bs4b+oaAyF0GRBlsrWzTvmOMQLyGvrUC7f71hJaeYmIJCfoeopwNhXSgP2AC4EAiVRBdypegVVB9/wPlNIv5xSMTdp+X03/UK2OFMFGItuJFol0NDgQekfMx3L6moSz3OdL5AGCSgQOy3hEvpPyjL/lNjVXEJEIcdsPGlC2uF0iEop03cWwdgFVrmzEvE7tSgARsoirLZrj0nDw0lu27g3k6dCpSNHc6Xz9iGDfazYV+B9vB9clJmDng==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a132d124-68e7-46d5-b393-08df22d27502
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 11:19:01.1313
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9e1nFs4sc0wXFiJ0OSf1p/2kdWBvbFvlYNH+MimNMYnTYu4IZIUdfEIuMBOtwTQo6/NXG0+5VvmMfLMA5O4T6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA08CB310A
X-OriginatorOrg: amazon.com

T24gU3VuLCAyMDI2LTEwLTA1IGF0IDAxOjAxICswMDAwLCBSYWR1IFJlbmRlYyB3cm90ZToNCj4g
T24gU3VuLCAyMDI2LTA5LTI3IGF0IDA4OjA2ICswMDAwLCBFbGlhdiBGYXJiZXIgd3JvdGU6DQo+
ID4gKyAgIGlmICh2ZXJzaW9uID09IEFMX0ZJQ19WRVJTSU9OX1YyICYmDQo+ID4gKyAgICAgICAo
ZmljX2lkID09IEFMX0ZJQ19JRF9FUlJPUiB8fCBmaWNfaWQgPT0gQUxfRklDX0lEX0ZBVEFMKSkN
Cj4gPiArICAgICAgICAgICBnY19mbGFncyA9IDA7DQo+ID4gKyAgIGVsc2UNCj4gPiArICAgICAg
ICAgICBnY19mbGFncyA9IElSUV9HQ19JTklUX01BU0tfQ0FDSEU7DQo+DQo+IFRoaXMgaXMgY29y
cmVjdCBidXQgZ2NfZmxhZ3MgY2FuIGJlIHNldCB0byBJUlFfR0NfSU5JVF9NQVNLX0NBQ0hFIGF0
DQo+IHRoZSBkZWNsYXJhdGlvbiwgYW5kIHRoZW4gdGhlICJlbHNlIiBicmFuY2ggaXMgbm90IG5l
ZWRlZC4gT3IgaXQgY2FuIGJlDQo+IGluaXRpYWxpemVkIHRvIDAgYW5kIHNldCB0byBJUlFfR0Nf
SU5JVF9NQVNLX0NBQ0hFIGZvciB0aGUgdmVyc2lvbi9pZA0KPiB0aGF0IHN1cHBvcnQgaXQ7IHRo
ZSBjb25kaXRpb24gd291bGQgaGF2ZSB0byBiZSBmbGlwcGVkIG9mIGNvdXJzZSBlLmcuDQo+ICAg
ICBpZiAodmVyc2lvbiAhPSBBTF9GSUNfVkVSU0lPTl9WMiB8fCBmaWNfaWQgPT0gQUxfRklDX0lE
X0lORk8pDQo+ICAgICAgICAgZ2NfZmxhZ3MgPSBJUlFfR0NfSU5JVF9NQVNLX0NBQ0hFOw0KPg0K
PiBUaGF0J3MganVzdCBhIHN1Z2dlc3Rpb24sIGFuZCBpdCdzIHRvdGFsbHkgZmluZSB3aXRoIG1l
IGlmIHlvdSBwcmVmZXINCj4gdG8ga2VlcCBpdCBsaWtlIHRoYXQuDQoNClRvb2sgdGhlIGZpcnN0
IGZvcm0gLSBpbml0aWFsaXNlIGl0IGF0IHRoZSBkZWNsYXJhdGlvbiBhbmQgb25seSBjbGVhciBp
dA0Kb24gdGhlIHYyIGVycm9yL2ZhdGFsIHBhdGguDQoNCj4gPiArICAgaWYgKCEoZ2NfZmxhZ3Mg
JiBJUlFfR0NfSU5JVF9NQVNLX0NBQ0hFKSkNCj4gPiArICAgICAgICAgICBnYy0+bWFza19jYWNo
ZSA9IDB4RkZGRkZGRkY7DQo+DQo+IFRoaXMgaXMgY29ycmVjdCBidXQgSSBwcmVmZXIgdG8gd3Jp
dGUgaXQgYXMgfjBVLiBJdCdzIGVhc3kgdG8gbWlzcyBvbmUNCj4gJ0YnLCBib3RoIHdoZW4gd3Jp
dGluZyBhbmQgcmVhZGluZyBpdC4gQWdhaW4sIGl0J3MganVzdCBhIHN1Z2dlc3Rpb24NCj4gYW5k
IGEgbWF0dGVyIG9mIHN0eWxlLg0KDQpEb25lLCBoZXJlIGFuZCBpbiB0aGUgdGhyZWUgbWFzay1y
ZWdpc3RlciB3cml0ZXMgYmVsb3cuDQoNCj4gPiArICAgLyogbWFrZSBzdXJlIHRoZSBjb250cm9s
bGVyIHdvcmtzIGluIG5vbiBtc2lfeCBtb2RlICovDQo+ID4gKyAgIGNvbnRyb2wgfD0gQ09OVFJP
TF9NQVNLX01TSV9YOw0KPg0KPiBUaGUgc2lkZSBlZmZlY3Qgb2YgdGhpcyBpcyB0aGF0IGFsbCB0
aGUgb3RoZXIgYml0cyBwcmV2aW91c2x5IHNldCBpbg0KPiB0aGUgQUxfRklDX0NPTlRST0wgcmVn
aXN0ZXIgYXJlIHByZXNlcnZlZCwgd2hlcmVhcyBiZWZvcmUgdGhpcyBwYXRjaA0KPiB0aGV5IHdl
cmUgcmVzZXQgYnkgaW5pdGlhbGl6aW5nICJjb250cm9sIiB0byBDT05UUk9MX01BU0tfTVNJX1gu
IElzDQo+IHRoaXMgaW50ZW50aW9uYWw/IElmIGl0IGlzLCB0aGVuIHBlcmhhcHMgaXQgZGVzZXJ2
ZXMgYSBjb21tZW50IGJlY2F1c2UNCj4gaXQgbG9va3MgbGlrZSBhIGJlaGF2aW9yIGNoYW5nZS4N
Cg0KSXQgaXMgaW50ZW50aW9uYWwsIGJ1dCBpdCBpcyBub3QgYWN0dWFsbHkgYSBiZWhhdmlvdXIg
Y2hhbmdlLiBFdmVyeQ0Kd3JpdGFibGUgYml0IGluIHRoaXMgcmVnaXN0ZXIgcmVzZXRzIHRvIDA7
IHRoZSBvbmx5IG5vbi16ZXJvIHJlc2V0IGZpZWxkDQppcyB0aGUgcmV2aXNpb24sIHdoaWNoIGlz
IHJlYWQtb25seS4gU28gYXQgcHJvYmUgdGhlIHJlYWQtbW9kaWZ5LXdyaXRlDQpwcm9kdWNlcyB0
aGUgc2FtZSB2YWx1ZSBhcyBidWlsZGluZyBpdCBmcm9tIENPTlRST0xfTUFTS19NU0lfWCBhbG9u
ZS4NCg0KSSBrZXB0IHRoZSByZWFkLW1vZGlmeS13cml0ZSBiZWNhdXNlIGl0IGlzIHRoZSBiZXR0
ZXIgcHJhY3RpY2UgLSBpdCBjb3N0cw0Kbm90aGluZyBhbmQgZG9lcyBub3QgcmVseSBvbiB0aGUg
cmVzZXQgdmFsdWUgc3RheWluZyAwIC0gYW5kIGJlY2F1c2UgdGhlDQp2ZXJzaW9uIGZpZWxkIG5v
dyBoYXMgdG8gYmUgcmVhZCBmcm9tIHRoaXMgcmVnaXN0ZXIgYW55d2F5LiBJIGRpZCBub3QgYWRk
DQphIGNvZGUgY29tbWVudCBzaW5jZSB0aGVyZSBpcyBubyBzdXJwcmlzaW5nIGJlaGF2aW91ciB0
byBmbGFnLCBidXQgSSBhZGRlZA0KYSBwYXJhZ3JhcGggdG8gdGhlIGNvbW1pdCBtZXNzYWdlIGV4
cGxhaW5pbmcgdGhlIGVxdWl2YWxlbmNlLiBMZXQgbWUga25vdw0KaWYgeW91IHdvdWxkIHN0aWxs
IHJhdGhlciBzZWUgYSBjb21tZW50IGF0IHRoZSB3cml0ZSBzaXRlLg0KDQpBbGwgb2YgdGhpcyBp
cyBpbiB2Mywgd2hpY2ggSSB3aWxsIHBvc3Qgc2hvcnRseS4NCg0KVGhhbmtzLA0KRWxpYXYNCg==
