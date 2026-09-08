Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazolkn19010020.outbound.protection.outlook.com [52.103.43.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028B6383993;
	Tue,  8 Sep 2026 20:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899638; cv=fail; b=npv2JBs71Jp4qNs5JfvrdqQlH3E0Bv7yzga2AwwM4YmredoccsfmiS7roK08WPcAy0Yeevme4XxMwfG/9UHN+i2nC0Yv8qm4+1BJl9Fo4IiafnhZK/xfRhJEp8QEliz9ZjuhNrFxPJfKJ+m4OjlWiq5oRku9Yi3EN+bUn1owk5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899638; c=relaxed/simple;
	bh=eASNFQTI7F8JL+w7QqRXGFZ2Qjleb53OURsUTVYWBzo=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FNdbGue3vial21VFl3gzzN7el2/Q/qFomjDf4uhfa3sMZ7EtxgqfhHdUC6uSqeCFNPCFkTrxV3WsHLjFR0ScY6E1v/5MoJvbEOYzxCYmGNVTx18YTvGgMEuMPa7YJ2MMaRPOrd+7icdy3Yvi3GLrmB0iriTMt3lamkjBXqPe9bg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=LjqTV53v; arc=fail smtp.client-ip=52.103.43.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="LjqTV53v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LrXkJD/wZju3AmNy6tGTz+fKkEbCqoBJtM+m82JAllx3qUZxv99/c4A8NwvGR/nFa5UJJ8G/e5Tz4m2J7hdCL/dslXDPaOlDem+P//D1nDdoU9GObbSn+LfXJPOYJ/K4srmGV9s3SLwxu8FMsunLjWhoIW9OE0tHVkLbt+kvqlxQ5Cz1ipHFOhuL98HbB70sTR3uNTgI0zZc3qcftR4c3UuiWhoNB9hEsO8cusNCjDoPQ9Uh9RGr52rbKYoDJIi377QQQurr2WMoGl7EdKTpe/4EGrDOGfohRmBqlsm+fScFKVkit3IJxn3bf7Oq9IAqNT7a3ZGqmiy13/Ht5MF2eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8CtUxzWCWRU7WgqU0KlOvt5Kz8G2eITkgw5CemPy34=;
 b=pF7bYezzOa2j+TRslVB9jE8Uw+Ov1rLnU665uErNhCtHVZu0Wg6TkHEIY6coWDsYT36Enl8/oxXaDauLPixNhp4PgZcDHhEavY6ETyH8UJXDYns0OBsMf4jVZVIyEGWakVbbBLu1o1x4L4DHBUmTHUXk64jQcPFqVqiYCoaaOa9De4ODZOJ11YaIqKQTOa2eNEblx2r7wIEUPSQ0CIKsRdCSoVAUL4QHl5LOlt/tUKhPN/rBKn64z2UUFYNVLGFYRYYb27tNedOqT5eMsyCBw2JiTGhNu56jEdNXkim4szwj0QyTLYE0I2hUAqlR3zRvTK41qouOor5h7TIQZC0qhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8CtUxzWCWRU7WgqU0KlOvt5Kz8G2eITkgw5CemPy34=;
 b=LjqTV53vf0XRcClMx6hHGuJdIZp0HYaje8WOSP0UWUg/v1UBxEG47dAT/kLw5bxk+Z3SZrUOfPwi9luF+8tr98SZ6yrF/m2B85RrlILbG3cmv2qLBnxA07IrFQ4aDhdzjFiWJLPo54rzwlWVlH9XrqHMpUxspIRuRClhBa8JKV9JcpCBc6bhNZ0HdaQg03giwhhqiv/pGE4OnCQjFH+pOuCYhRv5RebYw8ciMKVaRIWe2+cgtCvFOlwOK19BUzpqLYHils12c2TKf564GlSU2HIiakVMx7Tggza+sxg/vSyElHgOUhI+s8TBpKhsijEVUJC9+/NZHpr0p4Oc7Dxv0Q==
Received: from OSZPR01MB9313.jpnprd01.prod.outlook.com (2603:1096:604:1d9::14)
 by OSCPR01MB14838.jpnprd01.prod.outlook.com (2603:1096:604:3aa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 20:33:52 +0000
Received: from OSZPR01MB9313.jpnprd01.prod.outlook.com
 ([fe80::90bf:9b82:54c3:1542]) by OSZPR01MB9313.jpnprd01.prod.outlook.com
 ([fe80::90bf:9b82:54c3:1542%4]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 20:33:52 +0000
From: Keisuke Tsukuda <catnyaaan@outlook.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Alan Stern <stern@rowland.harvard.edu>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
	"syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com"
	<syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com>,
	"syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com"
	<syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com>, Keisuke Tsukuda
	<catnyaaan@outlook.com>
Subject: [PATCH v2 0/2] usb: gadget: avoid warnings during configuration
 transitions
Thread-Topic: [PATCH v2 0/2] usb: gadget: avoid warnings during configuration
 transitions
Thread-Index: AQHdP9Fc4+KUIYz+SEyjvEMmaLeL3A==
Date: Tue, 8 Sep 2026 20:33:52 +0000
Message-ID: <20260908203348.95825-1-tkdkei@outlook.jp>
Accept-Language: en-US, ja-JP
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB9313:EE_|OSCPR01MB14838:EE_
x-ms-office365-filtering-correlation-id: 98e2c750-2c4a-4456-5120-08df0de87efb
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799012|25031999004|8060799015|8062599012|15080799012|31061999003|38102599003|24021099003|12121999013|8022599003|25010399006|1602099012|10035399007|3071699003|2607281247196008|102099032|4302099013|3412199025|440099028|1710799026;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?FV9FcCcYBwdvalczJqYOa+u2AMECLwMkhsGq8a/ltGf/uh96/IZvqQCBOL?=
 =?iso-8859-1?Q?Q7gpL80MjGG8FdHblK3erVTOWMz1wB6Glq6NBFK4Mgpel7gYfjKhyBPRmb?=
 =?iso-8859-1?Q?klO+3L3UWbR1OZU2nADakf1SGO8mbZYCJcVe2VmAc4Mt7mHhTVs+a/WKq+?=
 =?iso-8859-1?Q?HlmtNgvtIi3PalZAhvZv/ZnHcoyRT4UWVc3xd5wlmw9Iejt0GMUHYL8S/k?=
 =?iso-8859-1?Q?xxDlt0Wr/DB+T0glV+cQavLOexDKpoHIPHx7wekZyJJ0sFtAtpR7HgTcSS?=
 =?iso-8859-1?Q?VRmorZhiJQ8FyB2CROP+tl2V8GEmwm6Ije077qdolOKLIjF2/cN6TDBjXB?=
 =?iso-8859-1?Q?sKdE8zcDtI9UBvsm+t406fD0agXXlhj6xaU30Xbb9+RsuWFosUDZajKbsL?=
 =?iso-8859-1?Q?gotGIXOTQjmHYuWl5PAeDBLxkdRVhwky6M3oL+sYULTNAC3bkw57PYQXNo?=
 =?iso-8859-1?Q?/xjjah3eUJJyW4owrnrJ6/FDr2xuoY0BYEQL3mBRjAgmRQZZUC8YbLBosZ?=
 =?iso-8859-1?Q?Ld4Lc8j4GZ4Lq0ufaTLBzCY2rWd0ShI1hDt+BH94QVHRwvwdDb1FC/BDJ1?=
 =?iso-8859-1?Q?b87ufiehwBZcTDFmyEyI4mJf/vc6wOau7bpJFoblY0s/bgbmdSRq5DlGEZ?=
 =?iso-8859-1?Q?Ay3AUMB3Ncn8hWOgmQgrQHKi7Hx/J+LGgL2Gjw0Vi/J6Ps+mWz34JeXeKj?=
 =?iso-8859-1?Q?0m7+Zoddeo5yVYzlZDpkDtRPCURPIrxnHqHANG9IiK9cLVA3nFmKhgj8jo?=
 =?iso-8859-1?Q?k8I9F4Ru419pf9p3sPO8nNhgBWCSnLDfFsm6CvEkA5dgo/16LrUYnvBPpw?=
 =?iso-8859-1?Q?R8PxF1nvaosFAuhm+M4y5Jk+i+pFBQQ1v8p0LqNlavuVZid1SVlpEMtGA/?=
 =?iso-8859-1?Q?+Tx6HUgThgJbK80mbQAU2Uqd8R23395C7YLdp2on8HfxLviCgKA5iux/oo?=
 =?iso-8859-1?Q?+yxUwc9yk7MFVdj8ik+Twq0bd1xaYWy1Q6yzBChGwaLsKQTTM7t/ISkDpv?=
 =?iso-8859-1?Q?TCa4PM6cshA9Qb02fhdQZH4i9e2C2LcmIKDU6CYmIr4JjevGfBh9UtISJL?=
 =?iso-8859-1?Q?+a6d5aB9ZqSv1PNXXz3mbmaqVhd4D04hRZLh1mpqtFfL4Xy5wY1MAIq6fU?=
 =?iso-8859-1?Q?DN+zytgJO7TdcpZ3fGMNZKTzm3AhU=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?WiUmhTdigLZ6jW0ZNYrnC3y9SrDyw/fffDOyuIgp1DLfw0lYOoE5rEKdda?=
 =?iso-8859-1?Q?MlE3/E6FtVlsfZbA/GDYZ3x997KVPqB7ECmAIiQJQ08t4iJov5u5JB4WfD?=
 =?iso-8859-1?Q?VrkDaLqwwuZTiN4BI+lsqW2zXMRiga8d87WreARzEk8IMKZEEf31FnNj3n?=
 =?iso-8859-1?Q?arw6ImXVpde2M63mwbVBX0Doqg3eVyVCqKrRgNoH31Jiq3mB8qVGvW/NP8?=
 =?iso-8859-1?Q?+tmVyfLjTflF4iGv33o5fq8R+cesBktJ+bidhBpzp43PzTpTxeR3vtPP/Q?=
 =?iso-8859-1?Q?08BVo10HZzd2vGh5e7WH64o0aGIlqyBrMuxYXtvIFPxQYBluV/KlD0WS3Z?=
 =?iso-8859-1?Q?nKTZ6bE+FjbOlpF/ndWOlPIeFPJryy7+/TfcnqJT2MkbOk6wDLiVa2omuK?=
 =?iso-8859-1?Q?pKIvVO2bRMUm+CFOAbfxewLRQ7pqVWH6ya9q+fE1uL4oW1KM/EJwtvcx+I?=
 =?iso-8859-1?Q?D68q0edl0zTIHRuCLQzgxYPaGedk3gktAQEry1tdNyQVMSN9x/Sh3JYcZz?=
 =?iso-8859-1?Q?EiD1mKkvSSAUn8c+XIg1z5Ah6unDsvJtSfxFDsVZGl1Zc4llwgSJWSOz7b?=
 =?iso-8859-1?Q?MA3JNdemdeLWM0OK3UStk7kXPcfNoYxfdi419+NpJuUOYw1x5EAuNX8dGZ?=
 =?iso-8859-1?Q?iG4XTOpTQMr2Dim62Yvn2JE0LA5ryjCNyM3UxnNTy2P3oRI5+O30A+HC2B?=
 =?iso-8859-1?Q?zjPQwPMGEJe9fkUoT1xbO4CwYkVk/y1vbt0GeFwRyLC+HLGDxuBHgVNQh6?=
 =?iso-8859-1?Q?xIHXwKOrisS9yzk5BQMiF/zPpayOQaJUUYEMbhdp0ps9tVPVMxrc1yKWNb?=
 =?iso-8859-1?Q?++UZwhB/WoSA7cH84VwzjNLZpd2pOev9tSNq5ABKWJhFJ24/YBGMKW9ZKV?=
 =?iso-8859-1?Q?IzZwRjLfTjkNmPUD2M5OuJSEHuja+FywdrSw0cLTFH76WvwvsaPFSx0b2l?=
 =?iso-8859-1?Q?vAU1gjHXnvSoN+WBc/wR06AH6ql9Qfm3iGgZTWUHGlIWzkWG24FNmlkhK+?=
 =?iso-8859-1?Q?ThiGvjMToUs2Up7S5/WHrTk7EqY2PmltQu8MC1hgjFx4WlwOZvoyPTFg/X?=
 =?iso-8859-1?Q?ecf6/Zd1eo0o0PE6NnccptPValoi0G+MQQN7gtbJ8/TjDPbJf0idp0QmjB?=
 =?iso-8859-1?Q?+7uj8LGatsmjsAjzxrw+hprYh5ta1+lufPl2hy8rh/uMYOekFG7PH8Nc9u?=
 =?iso-8859-1?Q?mcHZqCj2cxYEpNbSeie4HQNEfpQcscJ9ZtXkZECOKxUOKNw3eGmmpPmtYx?=
 =?iso-8859-1?Q?6ATcb/QOvAaQAEif2EYHw10snsSaWEGAWdlcHLuhe15lHshnuB2ZgBImxx?=
 =?iso-8859-1?Q?1ITlkyj+z7UO/9FQmsXT7QkdnWofMS/17iDfwVDwA1eTWD613UjMtqdgbC?=
 =?iso-8859-1?Q?sFRNxHh/pHGW7nu7150hQKSuLuibACqc3U29xFmYMqIS4U+shSHD4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB9313.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e2c750-2c4a-4456-5120-08df0de87efb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 20:33:52.3465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14838

Rapidly alternating SET_CONFIGURATION requests can overtake the=0A=
mass-storage function's asynchronous configuration work. This exposes two=
=0A=
states that are handled safely but currently produce kernel warnings: a=0A=
delayed-status completion after reset_config() cleared its counter, and a=
=0A=
class request while common->fsg is not installed.=0A=
=0A=
The first patch keeps the obsolete completion as a dynamic-debug=0A=
diagnostic. The second avoids the warning only in fsg_setup(), where the=0A=
request is already rejected with -EOPNOTSUPP; warnings in other internal=0A=
f_mass_storage paths remain unchanged.=0A=
=0A=
Both reports reproduce on an ARM64 Ubuntu 6.8 VM using dummy_hcd. With both=
=0A=
patches loaded, five 10-second, four-thread runs produced no WARNING, BUG,=
=0A=
or Oops. In a separate run, a kprobe observed five calls to=0A=
usb_composite_setup_continue() with delayed_status =3D=3D 0 while the targe=
t=0A=
warning remained absent.=0A=
=0A=
syzbot tested the v1 code on usb-testing commit=0A=
edc1518454f6439e50a9220e9a3ba09044ea8d8b and reported OK after a=0A=
50-minute run:=0A=
=0A=
https://syzkaller.appspot.com/bug?extid=3Da83a5a1ba9ff57935171=0A=
=0A=
Changes in v2:=0A=
- Add a comment in fsg_setup() explaining why fsg_is_set() must not be=0A=
  used for this check, as requested by Alan Stern.=0A=
- No executable code changes; patch 1 is unchanged.=0A=
=0A=
Keisuke Tsukuda (2):=0A=
  usb: gadget: composite: avoid warning on aborted delayed status=0A=
  usb: gadget: f_mass_storage: ignore class requests while inactive=0A=
=0A=
 drivers/usb/gadget/composite.c               | 2 +-=0A=
 drivers/usb/gadget/function/f_mass_storage.c | 7 ++++++-=0A=
 2 files changed, 7 insertions(+), 2 deletions(-)=0A=
=0A=
-- =0A=
2.50.1 (Apple Git-155)=0A=
