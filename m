Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794641345;
	b=xVFg51XivmAv+aaaCl6EIFnAP1Yma52JI3aw5yhu1tnnOyXRygu/TipSXN5UfI47xO0E
	 yDFHD0XBy0HIgtOU+SSUjGjYvEoroF1oaG0iCqOTPgtigt7v3kVlC5ImRGsbiz18MG4bY
	 LnHNtOI6FmQcJwo/rSSDPP94XTIPbnb+BP+dFgedaHMBcRUsXe64BbAdM12MrvRXm02tr
	 Rrjtl7beO8w6+2rYZ5COc+2wyanfWq99/jeqtbfKVAnJiuYQHBtuSjCo9EGSCP/kspJnl
	 VVqJlJ7BuAMGv90f4H9HUYXdfiX8T2YOtjOyZud6MLPRBJvXp+woc0JEtKBpCO4qviA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794641345;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-slblob-mailprops:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Uqdw7wvalXhrKewZONyCtGFgpWgA/sgC6/zwvosujG4=;
	b=gsssLlYqq2DCjhHrc0PNvFuHC/WshFYKCDgfMfZIWHcpfO1hU0AltoaqScFPEZVzdVO5
	 OdbsEYcU3XnuLXGA4nyUCV+xnTX5ang77Cx9uGEhQKVb3SqN8/7GusanRnHZRtQWL03Wu
	 s0R1KDGLTCAb+o/72AGZFDvt6CXAVxyQ+IflgyXtCFrqIo0NCmU/l7KF6RjeuaSzS3njG
	 vNOiPeiMOqEo4KMb0zRs7i8QYVlib5aRMI6cEQPIMZHsZ0nPhUpgI6njlZRFVJE+MCBtV
	 fTwN/FUhOavxlhHsLAxMMXz+dycDaLKuFXXFcM/waJh/Zu0glJo3/41wTeTSo7Qtqww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=gpxSaHro;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.34
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazolkn19011034.outbound.protection.outlook.com [52.103.43.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD94A606A329;
	Sat, 14 Nov 2026 07:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD94A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=gpxSaHro
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLMOoYe2zPtdCX/H726PgOm0B3HslYi37WWuvyCrtBRd19WN/4Y4XvJAWCjVN749AJlonl4i3/NnY0ss8hX0Ip8ByQPx47Od6EgGoCCKUOKHwmiFcGU7NNOa5GwJriudlKJbJvc1wFnA2OeiRrL8ykAS3L0JrIs5HX8nxqACK3R4+XyZN01ey5B3zjkWdgo3iRCQH8LZI5XnEipBx+RI4Y3zgnr7CDKLL8pGvro5WSd6WqXm9Lpqgj5P4NtgjCEjnadgXdytnCiCIWx6sdUlbpz2UtBNQDQfxSwrPnDtshgYEknK9TUvLBVFh/H08I4hDfkzSYhHW9HHLcn8anyhSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uqdw7wvalXhrKewZONyCtGFgpWgA/sgC6/zwvosujG4=;
 b=NhRrEUOOynQp8k0biW71mShFZXiXqAW7C5s9Yz3kO4Ph4jW+8oz50G6F21R76OHmY8vEbEzvlr8GJRl+VqHpw0vZUqHsRTO/QwyD5CucnSUgX6xK9yuvnpyEeQWJ3R2aWhsNMpRJk3Bs4xWNO7hRwDNVhuPccoJTi2UkrHdVzCAUoTyr3Per/XB9p2FvJWnfYYx+Fl6menAXXzQyhsbg+rKUO5RyZppq32Wp/O2XwuvdlHeb/U1YrQ1QXs6Ynol8xZZh8mYOAYbVo05kn7P7a+5W5/H0cKdrVdo5qOPFaTpB9XW6IhdGO26kQFyklTkDm5IE7Qlcfm+IJZevEC2m3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uqdw7wvalXhrKewZONyCtGFgpWgA/sgC6/zwvosujG4=;
 b=gpxSaHrodd5oXQCqw20dN/RUV8JxkXqn1WXB3tjQaHCvR+3d7CBNdH+4k6ql6zXGEUQJq0OFjCY+vQ6AmPWTd5ooHUCpkxXDYNbvfDbC5ppb4jJNd6vllNsUVPRXnMOB+YpqLOU6o+dO2iAMQ5i11ulh+qw6aiwaIcePi1xUk6kEpbpHVGtlBjZbJtv42mK503F67D5eGeXpjnp48sawrwKxo4MZFveNvqRB5WYPrdgbUhmKP2ptOpla124QzcTt68tXjEeofWCwDRTxRLe0kQtJjxnpgwUCBv1V/KjQ1zr1lHQ35Xo9jsGxvMszLYK2fyuWAdBxqr8c9q+HKMX6TQ==
Received: from TY7PR01MB804852.jpnprd01.prod.outlook.com
 (2603:1096:403:403::19) by TYYPR01MB8046.jpnprd01.prod.outlook.com
 (2603:1096:400:f8::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Sat, 14 Nov
 2026 07:29:00 +0000
Received: from TY7PR01MB804852.jpnprd01.prod.outlook.com
 ([fe80::4c0d:ea93:5322:ee61]) by TY7PR01MB804852.jpnprd01.prod.outlook.com
 ([fe80::4c0d:ea93:5322:ee61%3]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 07:29:00 +0000
From: Zou Jianqiang <jq.zou@outlook.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: "liuc63@xiaopeng.com" <liuc63@xiaopeng.com>, "byu@xidian.edu.cn"
	<byu@xidian.edu.cn>, "25181214217@stu.xidian.edu.cn"
	<25181214217@stu.xidian.edu.cn>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] media: flexcop-i2c: validate the register address message
 length
Thread-Topic: [PATCH] media: flexcop-i2c: validate the register address
 message length
Thread-Index: AQHddAnRTKfYu3Z8q0+Q6+Wo5LcVrA==
Date: Sat, 14 Nov 2026 07:29:00 +0000
Message-ID: <20261114072819.107049-2-jq.zou@outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7PR01MB804852:EE_|TYYPR01MB8046:EE_
x-ms-office365-filtering-correlation-id: 50ab44a8-f3ca-4829-babd-08df4220f3b4
x-ms-exchange-slblob-mailprops:
 obhAqMD0nT+6TxoHw5fNkboUl/ASnSn2ZwrxVbrJPnKPT/B5XmmuMaLAvk2WlYFlHBT3ZRwHfk34XHqQmRrf0OqzHZfFovBAPY9lt5j3hAdutYmFTCy+HfX5XmthqJPdPKuP6Z4Qrf30y2D0vyRt9r2PJGuyWO0B55Iwdw3AnZiAEGdCqMRwcIyjfHBXbio8vUNsvsrRDheWv8xSWOZcze1Z4qxdFVRE3BNtmmbknABCSnl41xbqm2jgtDjMm6wDSLmM+f4lk4DJQZnA2HFZcR8UF/89Wacr9uzCxuaNrbPBNw/a56Z1z2OmF1EZ3KYAkBwqbm660QIu9d5OjNbTu3LBmRwG5jLVT61KJbYx+rJfzBka0lxSPPa8rcg5OKD5pcyYaUihQBlMA1+Cl55/kaZhluJvqP8w4cxv/sUZ5+FdNuZLjtIKrDlpbuJ/9+CCsZ7Qi9HyGjBLUv5iABW4DYiq+uWedARybgKUnV/Jf5hLHmZsv7Z24MdMQ0qEK68sof9rSEpVvrqgUSyGq2jc8Vdsprik8ozTP81jEWMksNILRKb4c8L3i3xEVJfHEHTnrnUeATJ48k1eIjHL4fVIrT41s5TSzhaO7m1xL9uv0pJLeI6XXYckLMopwNrOlSzWKyzk9/VtjTL9YAI3EaeyejDdOBwvKCpz/BLt7/40ctffQj9n6Z7PzeO862H4wCvYgEzI2A+SI3fzC92+WsYLoOGlq8ri83y67jYCzcbRO121Ajk2l0DcgistTh4qz0O8r45ox2tez+SBcDfY1d0T7y3sxmlZxu+HeysQoYuXeJ+NXdnSnboFcdL+GF9TqNMg
x-microsoft-antispam:
 BCL:0;ARA:14566002|41001999006|15080799012|5062599005|8062599012|19110799012|8060799015|31061999003|38102599003|24021099003|25010399006|12121999013|4140399003|26104999009|440099028|3412199025|4302099013|102099032|52005399003|40105399003|1602099012|10035399007;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?snyuOWYNetdhUoaNqDhwF4U633avT7F7gy8diU+Y4QCXNJxa7QN3DkH4hy?=
 =?iso-8859-1?Q?NoLrVfZPrILNIb7zDpuBK5oK/2o7HrURn1GXXCODfSDckVXNh4Ha4B6WEV?=
 =?iso-8859-1?Q?1Dpgs24RJEerv9vRskOnlTqNQQY88wATe7mXBr7nLElc3L62h/0jNwg8sL?=
 =?iso-8859-1?Q?WgXRhRBb5w92s/62D1/BkJeZKiOnYYNyPH6d4Fsd0XcOnMOPbvebQK1VT2?=
 =?iso-8859-1?Q?7mXfk+PXoSNnK/Nuo+2n4u/znqFce5lY9e06vCgzFPekJT0Ajr4d7y14AW?=
 =?iso-8859-1?Q?DLCK1ysmjIrQYPVgiQ4+HC5ujmu6GltdM8Ttcmr94YpiBuskFoo6/NRV//?=
 =?iso-8859-1?Q?337Z5Hyl4ZRputK0t31WBlzg2l/B9KuzGXQetrst7sY0ajQPO+GJdUUfYd?=
 =?iso-8859-1?Q?4pYadQmpCTSaAEMUbLnDL2MlNaJ5vhHSs1Fs51pypgK+RwAOvQQrgvM5Xl?=
 =?iso-8859-1?Q?bJYQpt9/KRfMdxvdf1liOlyAcBmj5vBznhqFRvzVnk4RrWRt9oZ1uauzUi?=
 =?iso-8859-1?Q?lLM3wMtSwfDjQGFLQrgAHWaIY5LTn4yD1rfPtNQf6i2qYmv+rvHpwX9GMN?=
 =?iso-8859-1?Q?Gq0dQwbSRGA+mDgfRAJtSVbkv/Mtoly95ysOh0oQBcV/sHCwhqyRI4eLDa?=
 =?iso-8859-1?Q?xonuyutIK67qfbemy6ByPCycaWTbXssYWRUn3i0oBHbHW5dFigjuiNNKF0?=
 =?iso-8859-1?Q?znQAnJFQjsdNAIAR5aY8OO3vDArzMMDMfVPUPno3VgXIftvQyTtzWa1gO5?=
 =?iso-8859-1?Q?wBXPTpxzsKPI05nFbNN7de5vzve21ZS1bySpSMzZIxIIMAqn/aq10oWi+G?=
 =?iso-8859-1?Q?d2kKwKuE+3QfwavgCdSJPYJxvT+GsACUH2YxCpTSWHx5WCZRkdBFJxtezy?=
 =?iso-8859-1?Q?UmkYCji/lfzNcVgzqP647a+eQZwSTx9gDTdICFPPNKQNsuohgHSS8hu1VJ?=
 =?iso-8859-1?Q?As/K3+lBRHq7r6cOxAQlZf43rj7xscz2OVc4g6knfw17NjesoYsEcATNmD?=
 =?iso-8859-1?Q?y5neYY3513NfyoTCOelx4zC0Thx1ZrFLJITKDeQIR4sY2wPiRFS19IcnrH?=
 =?iso-8859-1?Q?gyeC6QZmC+YNvV77QyzdFJRv4jmvmIZLIAZdvwkA8k1QDv1r0TjdOZG++6?=
 =?iso-8859-1?Q?1IY3rsheFK5h3s/7kHdRIFVIJdEWw=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mJZN/yikw4RbP1B+M1yXdHh3h13nzmjFq4qw+3sMAU5lT7yteh+tzjotIM?=
 =?iso-8859-1?Q?hA6phL4XWYFsHwCgBaEK7IXH/1BEXl3vmwc0N7vFwYdDUJXG7Fr7dcKM5c?=
 =?iso-8859-1?Q?gedWBmmYA5/Do0gync1TOhLZhfV5sfEJ7hHaLK5mord0hQNyHtLW9ZMAgv?=
 =?iso-8859-1?Q?bBE7wKJ39vPGPIqQtC4s9G+tNkPU/rdHFHLV2T0pCstEGs3zhvpukm61VL?=
 =?iso-8859-1?Q?atnEilGgxB/iLh8CoZJOuWhPPoBNcpx0WdMmC4eL04EFBQuPckjgSraPhe?=
 =?iso-8859-1?Q?EPZNQ5h+N5EbbiivnK9ECVramRlLnj/erffDIMJ1T0RNLCzNTZ7tEIfVhy?=
 =?iso-8859-1?Q?ALixq8bYZh29KkGl0VaXzC5JcMsrknSsMFOQswkVkEA2EztWigRPtdUPxQ?=
 =?iso-8859-1?Q?DSXNEhHtp56YdAjnKvyvCAwoIDQfhom/Il+UUb2wXIg+Cc81XoP+xCAzPN?=
 =?iso-8859-1?Q?QtA0/MwrSBMUd04+eDiqkppfy+HrXv1z+7TabDO3Bw9mx3JppFwrXvIC3v?=
 =?iso-8859-1?Q?8V5Ahw34JTZNx4AS3QPffDVOqGStA4DQY/l3r1Vy8UIomBbb6hzvvAMEjz?=
 =?iso-8859-1?Q?r7WFesJKlKze0J82y+Y+BexIg4lUYD+qG96if1LT65/X92dd29QIx3fRXd?=
 =?iso-8859-1?Q?IFRWb37jSXWf7n8J5srojyo4FXQ7mCw2r9zWELrmpkageLGSNHmasFfAHj?=
 =?iso-8859-1?Q?Um2jDqxfX5AImPtm4beTUxFT83ZikZZNcrqq1SIS3rU90fniaEXiDkMeoa?=
 =?iso-8859-1?Q?yGovR7J9YonH891O7Nw4rwposPeTjMkob1fvSalmVnD+M5HYAddypbukeV?=
 =?iso-8859-1?Q?Wb4rWB7qA7pXqjTxZm6HuU4jjhG16G3xEyvtsM07DcKd0eiMGIVKzpMd9J?=
 =?iso-8859-1?Q?GNQCRk2XzRMxZuWTuy+0rLnaaUs/gy2bR5RZ4xIbLZwWQtrwHShW9JyaOC?=
 =?iso-8859-1?Q?vdt2CkY8kswd9Ro7HImiaknk2PKTGMRxd1mGeadKDVrjzS+ZLVInrm1KX2?=
 =?iso-8859-1?Q?rYi71dYBZXskfrsCPMXObofmzxO9PaeP7e1RpfhMT+bgiBTUjRXYkx9cBN?=
 =?iso-8859-1?Q?5PMm4bE5nXGwO4RbLLQjy4Vd/1BTUYitn6Wkkh+VECwr0MrohdXpN2zAYU?=
 =?iso-8859-1?Q?O1LgxZjcXqGuZlxr0kpnrdRJkiQRN/3T7UQ8CGEGGdvOjJQ6Tz4+zxMot/?=
 =?iso-8859-1?Q?8c5h6YhCk3HHStcDc+VAgT6WnwMV/Dxjs76ut3MKXW30LnTyWqIAuQVEdg?=
 =?iso-8859-1?Q?VtyUPE9zm4J58fkhoI1lGe1y/P2mu/uYrXZ9QbPacyEMmCsuNslOEFDtxZ?=
 =?iso-8859-1?Q?bT5FlKu29wAt58yfbmPgr6jTqSDHtFZEPBd+kgYAfM03nBPScPFi/uhwAU?=
 =?iso-8859-1?Q?2dzWovQSugC6GrbxvNEqydmvubdyjS3A2o7txhue7p9k0EmxdurWk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY7PR01MB804852.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ab44a8-f3ca-4829-babd-08df4220f3b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2026 07:29:00.4815
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8046

From: Jianqiang Zou <jq.zou@outlook.com>=0A=
=0A=
Both the write and combined-read paths in flexcop_master_xfer()=0A=
use the first byte of the current message as the register address.=0A=
A zero-length message has no such byte. A syzkaller run on Linux=0A=
7.3 reported a KASAN null-ptr-deref when the write path tried to=0A=
read it.=0A=
=0A=
Check the current message length before selecting either path.=0A=
This protects both register address accesses while preserving the=0A=
existing single-message read probe and register-address-only writes.=0A=
=0A=
Advertise I2C_AQ_NO_ZERO_LEN_WRITE on all three FlexCop adapters so=0A=
the I2C core rejects zero-length writes before calling the driver.=0A=
=0A=
Guo Zihao previously proposed a check in the write path [1].=0A=
=0A=
[1] https://lore.kernel.org/r/20260918032427.803874-1-guozh23@xiaopeng.com=
=0A=
=0A=
Signed-off-by: Jianqiang Zou <jq.zou@outlook.com>=0A=
---=0A=
 drivers/media/common/b2c2/flexcop-i2c.c | 14 ++++++++++++++=0A=
 1 file changed, 14 insertions(+)=0A=
=0A=
diff --git a/drivers/media/common/b2c2/flexcop-i2c.c b/drivers/media/common=
/b2c2/flexcop-i2c.c=0A=
index 21edf870d..3a13d73ff 100644=0A=
--- a/drivers/media/common/b2c2/flexcop-i2c.c=0A=
+++ b/drivers/media/common/b2c2/flexcop-i2c.c=0A=
@@ -181,6 +181,12 @@ static int flexcop_master_xfer(struct i2c_adapter *i2c=
_adap,=0A=
 		return -ERESTARTSYS;=0A=
 =0A=
 	for (i =3D 0; i < num; i++) {=0A=
+		/* Both branches use the first byte as the register address. */=0A=
+		if (msgs[i].len =3D=3D 0) {=0A=
+			ret =3D -EINVAL;=0A=
+			break;=0A=
+		}=0A=
+=0A=
 		/* reading */=0A=
 		if (i+1 < num && (msgs[i+1].flags =3D=3D I2C_M_RD)) {=0A=
 			ret =3D i2c->fc->i2c_request(i2c, FC_READ, msgs[i].addr,=0A=
@@ -209,6 +215,11 @@ static u32 flexcop_i2c_func(struct i2c_adapter *adapte=
r)=0A=
 	return I2C_FUNC_I2C;=0A=
 }=0A=
 =0A=
+/* A zero-length write message cannot be represented by this hardware. */=
=0A=
+static const struct i2c_adapter_quirks flexcop_i2c_quirks =3D {=0A=
+	.flags =3D I2C_AQ_NO_ZERO_LEN_WRITE,=0A=
+};=0A=
+=0A=
 static const struct i2c_algorithm flexcop_algo =3D {=0A=
 	.master_xfer	=3D flexcop_master_xfer,=0A=
 	.functionality	=3D flexcop_i2c_func,=0A=
@@ -246,6 +257,9 @@ int flexcop_i2c_init(struct flexcop_device *fc)=0A=
 	fc->fc_i2c_adap[0].i2c_adap.dev.parent =3D=0A=
 		fc->fc_i2c_adap[1].i2c_adap.dev.parent =3D=0A=
 		fc->fc_i2c_adap[2].i2c_adap.dev.parent =3D fc->dev;=0A=
+	fc->fc_i2c_adap[0].i2c_adap.quirks =3D=0A=
+		fc->fc_i2c_adap[1].i2c_adap.quirks =3D=0A=
+		fc->fc_i2c_adap[2].i2c_adap.quirks =3D &flexcop_i2c_quirks;=0A=
 =0A=
 	ret =3D i2c_add_adapter(&fc->fc_i2c_adap[0].i2c_adap);=0A=
 	if (ret < 0)=0A=
-- =0A=
2.43.0=0A=
=0A=
