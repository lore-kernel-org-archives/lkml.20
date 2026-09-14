Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013051.outbound.protection.outlook.com [40.107.44.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E2D455199;
	Mon, 14 Sep 2026 12:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388663; cv=fail; b=R70E8o99Bn3Nlg6oR1PO24BG4Ff2d1Vpj4ivP16PT035FmPG/NoWBK6FepSYJZPQR6RpoenSYCQBcqgJd8KmT0GFWbxW95Nm2iNhzi5iWVfIeYcgnLZ/Y6H7XxndUggLmK03GYRC3jMG6/eI1aim9Lpkvo0l/zjLcwvqZquQgQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388663; c=relaxed/simple;
	bh=NBc10SKObjAr9riLY136GHP9Ee51DtmfQkXv4Gpfl34=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZBTEO3huRTgFYHHxKUnuxxFGNk95M4BGKD5m7a6hEbZSfh8IFF8oPcjtKSvHLq8Hm6Ql+/XKgJfPizKyyIDy9CzZ52sAAZxm1LfGFeHfH9YbSvMyOZVj1z0+l7pSdjZfx6pO2y+68VsJcAxedkChhMdYy14MD0i4qCBeonMQvnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=BQXpy73f; arc=fail smtp.client-ip=40.107.44.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="BQXpy73f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LeFXRkpt7hDar5/ce2SrXxpTuje+990K0wHlzLTaFo77s1yDZF65SOTeImmPkmmFP/ruDB7jFWKN+YEunJEy+MkS30UFIrF9YbkrJFaXMDmvAgpZF7p09Bx/eKG8WnADH2Of/QDgQTWkapxRCKj/MvrrFhTHXi2yADcN2gUc3DdHjEf27tOw0e4pMFAaX9IxS7Sqlf6fwv73nSWBwoKw+ykEvZd8yxZNdRxZ5Mg6d5THA+E94sXnZEsXFM9p0jLazavgupX96phfnEDLCWqcUoGmHb9KCDIMuhfNdWUoi0xFZzb7Hbm+Kk+svkjIaT7h1FYGHmx+gKqgjhDUlLRVsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBc10SKObjAr9riLY136GHP9Ee51DtmfQkXv4Gpfl34=;
 b=DS372RUoiUN3BrnDpdn3478csvJrdxnMXhCrv+boNsgHd7eB3DxTdcyoZLNBgFsKg8dW/bUmB8Tqh5Swoqa6DTlJemN9R4v1BhNmmOwEg3ytbCgWaL9mLhQMzurrSMKanqdWohqiRk3QensOfRHDRDo+NGko5ybtzYlwmpw32Wrxl7gyr7SZKzKDzYolxz439YxGVe0ZMJXdJ/DKvtX6o+WYEmXGmEfMWCBUM8KdfJkP6udEpBJBdC45TQKnQJ+TI/21VHTeihlblieueHHJwJUXqaatpMlu9wP8FzOjpBtfUj+WzVWOBSZFUOWPEvocmUFaptpv34dEs6HJOFTyoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBc10SKObjAr9riLY136GHP9Ee51DtmfQkXv4Gpfl34=;
 b=BQXpy73fv6jLaoaIxWQrBArcE7Xjqsu1lC9AjqpkjcpJgJlOUCLm/ve9TSpHXJYN4yChXXdx1W0MgMYTp5CTEAZybs1O3TlolwnIO4GkvZ1dVmV6v7HSOIKLHG7tgnJKdDxlKrsG2cuIeaLg7JYeWoXd2iZZ0qb5cTB1qgcdGiHFwbaIiEigQ+FUvSVqVjJUGAomeR47louPZv49CuuXzUxMmf35patlz8sBTQn48+W9118g++HfhN88RAccE4pShRufHbAfkWRjV0e/fEvHgaeTzTfy75bqa5jb5JPkbcoEseBLBhPc7bGHr6iukJbVPqKFKpqeYhnVZdsOm9/NEQ==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by KUXPR06MB8295.apcprd06.prod.outlook.com (2603:1096:d10:5c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 12:24:15 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 12:24:14 +0000
From: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
To: Michal Pecio <michal.pecio@gmail.com>
CC: Mathias Nyman <mathias.nyman@linux.intel.com>, Selvarasu Ganesan
	<selvarasu.g@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "quic_wcheng@quicinc.com"
	<quic_wcheng@quicinc.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"cpgs@samsung.com" <cpgs@samsung.com>, "alim.akhtar@samsung.com"
	<alim.akhtar@samsung.com>, "thiagu.r@samsung.com" <thiagu.r@samsung.com>
Subject:
 =?utf-8?B?562U5aSNOiBbUEFUQ0hdIHhoY2k6IHNpZGViYW5kOiBjaGVjayB2ZGV2IGxp?=
 =?utf-8?Q?veness_before_removing_endpoints_on_unregister?=
Thread-Topic: [PATCH] xhci: sideband: check vdev liveness before removing
 endpoints on unregister
Thread-Index: AQHdQrDeGfWFiGmxd0qOioBk2uqA3bbNqDxAgAAj+ICAADMKMA==
Date: Mon, 14 Sep 2026 12:24:14 +0000
Message-ID:
 <TYUPR06MB62170DB4AB23F7A79E8DA466D2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<CGME20260910101324epcas5p1faf6f82de85c9468f42f6f9b2f13e99b@epcas5p1.samsung.com>
	<c17e0351-d390-4a40-89c4-51d4be9f0123@linux.intel.com>
	<360067785.01789039502721.JavaMail.epsvc@epcpadp1new>
	<TYUPR06MB62172308C897F81F7DAFF557D2BF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<750468423.101789103583573.JavaMail.epsvc@epcpadp2new>
	<TYUPR06MB6217F0788C14DD89D237C807D2BE2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<937773018.41789116303608.JavaMail.epsvc@epcpadp1new>
	<191ee5d5-d93d-4fa3-9654-b3735d344118@linux.intel.com>
	<20260912141837.06b2f3cf.michal.pecio@gmail.com>
	<TYUPR06MB62174110FB101AD6B7B069EBD2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20260914110949.38a46596.michal.pecio@gmail.com>
In-Reply-To: <20260914110949.38a46596.michal.pecio@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|KUXPR06MB8295:EE_
x-ms-office365-filtering-correlation-id: 548b13dc-e8af-45ae-2d54-08df125b16bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|42112799006|23010399003|6133799003|22082099003|18002099003|3023799007|38070700021|11063799006|4143699003|10067099003|56012099006;
x-microsoft-antispam-message-info:
 wwFlCULWOYpjuJ/IiZarpwUfwnxwJZFULeaT/JMSOCNXlqF/95bt+5+AxBJczIlO8YPHdAh3xMI4Oiu6cUYSUHorFZX6J+6q7nuFZJYuY0IzJqIOxeGCtKd3awt5RZK13HQArFzaHS8sd+0cbaH49SCwp8EWqLCsX3Z5OCne9tZ+KOtg/e35rzIb3z0SXaTRPvzaKj33sahqXx+BnMQ6fLlIjyxgx+IDDKGzh2yxTfsUfB77CGE7vYFtS2ply/Be3JGpCdP1ZVaEgJl+2E2hU3tJN0BercwIrfbjMuGAW5xdmT360oPqXZrEhIuZKOxXdNr3U2OsInziR6G3U1Fv2SrhSNCzcDq21m6Gs5XycS1Jcje/VFWPYtwJaYzEkhjrUjag+YTDBZ1gVTkF4g49tggnEifAHuuFulzwP7q5a2TXWuaVMKUA3AkuSn+mg76XgWPjpjo5r9TRfg6xXemrTQczIQPz29sF3cTGI2opJeNqjw8EElOUNUB49GRi5P2kqr4uVqw3d/TBpHrB8e3Gl0ThYI+c/CK0p2gadtaQe+pvIWfQirvQtu3u57RowFTXOY/lKugxKKdpsQvZsgFSBoqT6ZNJgcK809hIt3GkLQpFtinO0cgeUQRSL2zaVirjwYa46iwGzL1oAkfovrnBwDb3fBAYt0ydmIhQfi0Lhbt5rlB1VwzvCwBaLSCualf5Xhz/E+ZrHsoaDlzLN0fduIqC8+ap73DtqBIkeyXeVAs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(42112799006)(23010399003)(6133799003)(22082099003)(18002099003)(3023799007)(38070700021)(11063799006)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U3ZleXQ5ZHlVUE5sUGMvd2luc2VMaC9lbjZsY1FqSGN2QlFGN0lUYkd5K2FW?=
 =?utf-8?B?TkVQb2tzZExLL0drV2ZNM2pId3A1Q09aeXZTSlord1MwU29aRHd2STk0Zm8w?=
 =?utf-8?B?Wk03c1IxVHM0UEV6cnNJU1c5cHRUZHVHZFp6R1RhbTB6WTFpUjVkbDBzWW1r?=
 =?utf-8?B?cXRVUnZoaWRyQ3dXaTZFRWpleWo0SWVYdkFnR0JpaFFxdU5GUkgrY282OG1G?=
 =?utf-8?B?aDFzejFyNG5FSVpCV2dpT01QWVhJUmNHbDRBbnY4c0VSVWNPM1JoTUx1NWVN?=
 =?utf-8?B?dFVTY1BUMVNvZ1FQeXdyOFRQK25oV0NUOGtrUDJ6NXZSUll6YmVxY1hvNyt0?=
 =?utf-8?B?OUF4dDR5SjZJME1mU3Y1YUhCcUlhdWNiOUYvSkJMeEtOL3VYZTZtem1XU3Bu?=
 =?utf-8?B?QUFlM0xWZERFeDFQNDYrTUhRUklwZmsvWDkwdUp6K3FoUFlxWWhoRVVaYjRS?=
 =?utf-8?B?TUt6bnVzMGJEcDhZckt0TUVqcWw3Unp1OUVZdGR0ZlQzYUhJTmhhTTZMRnRG?=
 =?utf-8?B?MVh2VVdjZHhFVlM4TTBlcEFtUm1uc2pDNkF2TFI0dWZuRGdtTE9Gdk1WMHY2?=
 =?utf-8?B?c2NNN282aDVJbU5ZaVY5T1gySlN0cXllRlMrU2plRG96RncybjFZR0tjK2xK?=
 =?utf-8?B?YWtKTWNWYTZPQmpIQVZjenA5ek9XZjVjRVdqNGE4K3JSNkFpWTVsQk9sNnlB?=
 =?utf-8?B?TFZ6MkM2bklJTmNRZDJXQ3pWd2FkelJwYjFxUE1QZlJyZmJLUkhFZUNBRXAw?=
 =?utf-8?B?TTcwMkhzcnVENXhKOXdqRTZZMkpTMlNiSnZKaXRLa0d4NnBVQUlBRG5OSVdY?=
 =?utf-8?B?b0NEV0kyVnYwRGxyWjVCRW9sRjVWOG1KU3dXUUpWWHNvOGovUXRBM0tQZUNJ?=
 =?utf-8?B?eFp1UVNIdnhUdWp3dElNU0hEOVQ1YTh0Rk5QeitQMjMrRUpDREZWY2pBdisx?=
 =?utf-8?B?U0tKMXB5ZnZBN3RBTjJQYW5INjhQbzYzNGp2OGNPbUErWUQzWmFIaUhGMHJi?=
 =?utf-8?B?QVRsVmxaaDl4ZW1NVW5raGlCTmZzMTNjNnY3WlJjc2xIcXdjN1lPVEY1bkM0?=
 =?utf-8?B?Y0plTE9GczVaSDdUVkhRTlVSYzFaS0E0SXR3WVZOWXROZmI0VzZkbFZObFhI?=
 =?utf-8?B?bUhrTWNHcVgrSWloYnM5ZCtuamZHNDhSTnF4VUR1cUpKRTNPWE9tUTdDSm5W?=
 =?utf-8?B?MU93aVljbCtvT1pMMjFEVlkwdDd1SjVtRVZNTHBjZW83RU9CcEt5MC9iVllN?=
 =?utf-8?B?Ui9VVlZYS20xalFCNTY2dVhFbGtmSTA3cGxuRURqNTN3RTZtZmY5YWV0Nkd5?=
 =?utf-8?B?QVl0WmFqODdvYUE0RWY4VUpWNW1WUkVkTzdKSXZaUmlaRHE1SHQ3WUNGQ2h6?=
 =?utf-8?B?aUJIMHFCRndQRUlwSnY1MjJ6bnM3ak8zejljeWczSmtXSFdSSjdHNXdpR1Ey?=
 =?utf-8?B?Ny9rdzExaU5pT3NwL2lYVTllczhTa2NMNzYzcDZJSlA4MkdZckE3RlRpQ1Ev?=
 =?utf-8?B?VGFydWxhODBTUUthelJRZ3plWDhqWmk2ZWpjS2t6b2JqbitjQkRUdW1MaWox?=
 =?utf-8?B?VkJSUVBzTGVobnBleGVVb2lBeWE1RG5nbGNJOGVqcjBSL2FyNW9ZaTVHUlV6?=
 =?utf-8?B?SllBamcva3NsRytQTlk2aVBvem1nbkVXSXY4Z0hZVU5ZeU82WVhxZ21pVHRn?=
 =?utf-8?B?SVVqMVVHWmhBamM0ME9aSVpuaXlsbWx2UzhjR0M4cU1JUlZUUmtXTlpRSjNh?=
 =?utf-8?B?QU54Q29EK1VpSWdNQ1ZKODJFQmdWTTJ6YXJKSFh4L0FCOFZmZnlHc1ZxeUlJ?=
 =?utf-8?B?N3BtdG9JRUdZeUNUb0xlM2FBZ3REN2hhV1U5aGlTRGxhcXhJZTRaUzV1Nk1r?=
 =?utf-8?B?VG1KZjJSZjEzQmZJMWNCUHhwbTlWQnlmeUtUd2ZZRkdlRUJ3dk8vTTh1M2VE?=
 =?utf-8?B?TC9zZXRmWEhHMkcxOWJDd3YwRk41aGhvRnhreVR1bjJXQTA0bHN1OGc2UjQ1?=
 =?utf-8?B?QU4xY0NKeVJMV21CaUQxUU01S2FYUWc5UU5oVFZqb0U3dk5yNEdKYUxyKzYz?=
 =?utf-8?B?WUdkQ29Pa0V5YWVtUFJYN05iVzNrSkRUdXE3RkQyVW1obFlNMW1aRFExZW9U?=
 =?utf-8?B?bUhMcVJDRTZ1QkhQZVcrYTVBa0RBMHpnWkdWQ3JNbUV3dkRJOUJXbzBXaVVN?=
 =?utf-8?B?bTdoTFo5TnRCc3ZPNENTaUwraHNjTWViYlZlTVh1MWF0NmlKbDBpVTBOTE9I?=
 =?utf-8?B?L1lmbEk3Y0xaUGNKdFoyTWlKejkwNzRseXVIQllwdXJWZEJvMXdSVzBicTdr?=
 =?utf-8?Q?PzLNIMn/e8AK1kFzHy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB6217.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 548b13dc-e8af-45ae-2d54-08df125b16bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 12:24:14.2154
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KLvd4jHaQl9jwNwmrUtsuZGfGMXchKRCqvjkvIlzeevNRiNiQ0d4YknL8YoyHWugD/gvDBLCbcr0GKRBE7snYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8295

SGkgTWljaGFsLA0KDQo+ID4gVGhhbmtzIGZvciB0aGUgYW5hbHlzaXMuIEEgY2xhcmlmaWNhdGlv
biBvbiB0aGUgaHViX2V2ZW50KCkgcmVmZXJlbmNlDQo+ID4gaW4gbXkgcGF0Y2g6DQo+ID4NCj4g
PiBUaGUgY3Jhc2ggdHJhY2Ugc2hvd3MgaHViX2V2ZW50KCkgYXQgdGhlIHRvcCBiZWNhdXNlIHRo
YXQncyB0aGUgYWN0dWFsDQo+ID4gY3Jhc2ggY2FsbCBzdGFjayBmcm9tIHRoZSBmYWlsaW5nIGRl
dmljZS4gVGhlIGZ1bGwgc2VxdWVuY2UgaXM6DQo+ID4NCj4gPiAgIGh1Yl9ldmVudCgpDQo+ID4g
ICAgIC0+IHBvcnRfZXZlbnQoKSAgICAgICAgICAgICAgICAgICAgICAgICAgIFtodWIuYzo1OTY2
XQ0KPiA+ICAgICAgICAtPiB1c2JfcmVzZXRfZGV2aWNlKHVkZXYpICAgICAgICAgICAgICBbaHVi
LmM6NTg3NV0NCj4gPiAgICAgICAgICAgLT4gdXNiX3Jlc2V0X2FuZF92ZXJpZnlfZGV2aWNlKCkg
ICAgW2h1Yi5jOjYxODNdDQo+ID4gICAgICAgICAgICAgIC0+IGh1Yl9wb3J0X2luaXQoKSAgICAg
ICAgICAgICAgIFtodWIuYzo2MjI4XQ0KPiA+ICAgICAgICAgICAgICAgICAtPiBoY2QtPmRyaXZl
ci0+YWRkcmVzc19kZXZpY2UoKSAgW2h1Yi5jOjQ3ODFdDQo+ID4gICAgICAgICAgICAgICAgICAg
IC0+IHhoY2lfc2V0dXBfZGV2aWNlKCkgICAgIDwtLSBDT01QX1VTQl9UUkFOU0FDVElPTl9FUlJP
Ug0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAtPiB4aGNpX2Rpc2FibGVfYW5kX2ZyZWVfc2xv
dCgpICBbeGhjaS5jOjQ0MzhdDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIC0+IHhoY2lf
ZnJlZV92aXJ0X2RldmljZSgpICAgPC0tIGZyZWVzIHZkZXYgaGVyZQ0KPiANCj4gU28gbm90IGEg
bWlzdGFrZSBhbmQgdGhpcyBpcyBpbmRlZWQgYSBkYW5nZXJvdXMgY2FzZS4gQW5kIEFGQUlDVCwg
aW4NCj4gdGhpcyBwYXRoIHVkZXYncyBwcmVfcmVzZXQoKSByb3V0aW5lIGlzbid0IGNhbGxlZCBh
bmQgdGhlcmVmb3JlIGNhbid0DQo+IGJlIHVzZWQgdG8gZml4IHlvdXIgaXNzdWUsIHVubGVzcyBV
U0IgY29yZSBpcyBwYXRjaGVkIHRvIGNhbGwgaXQuDQo+IA0KQWN0dWFsbHkgaXQgaXMuIFRoZSBj
cmFzaCBwYXRoIGdvZXMgdGhyb3VnaCB1c2JfcmVzZXRfZGV2aWNlKCkNCihodWIuYzo1ODc1KSwg
d2hpY2ggY2FsbHMgZHJ2LT5wcmVfcmVzZXQoKSBhdCBodWIuYzo2NDEyIGJlZm9yZQ0KdXNiX3Jl
c2V0X2FuZF92ZXJpZnlfZGV2aWNlKCkuIFNvIHByZV9yZXNldC9wb3N0X3Jlc2V0IGlzIHZpYWJs
ZSDigJQNCmlmIHRoZSBzaWRlYmFuZCBjbGllbnQgaXMgYSBVU0IgaW50ZXJmYWNlIGRyaXZlci4N
Cg0KPiBCdXQgeGhjaV9kaXNjb3Zlcl9vcl9yZXNldF9kZXZpY2UoKSBpcyBjYWxsZWQ6IGJlZm9y
ZSBodWJfcG9ydF9pbml0KCkNCj4gY2FsbHMgcHJvYmxlbWF0aWMgaHViX2VuYWJsZV9kZXZpY2Uo
KSAvIGh1Yl9hZGRyZXNzX2RldmljZSgpIGZ1bmN0aW9ucywNCj4gaXQgY2FsbHMgaHViX3BvcnRf
cmVzZXQoKSwgd2hpY2ggY2FsbHMgaGNkLT5kcml2ZXItPnJlc2V0X2RldmljZSgpLg0KPiANCj4g
QnV0IEknbSBub3QgZW50aXJlbHkgc3VyZSB3aGF0IGhhcHBlbnMgaWYgcmVzZXQgZmFpbHMgYmVm
b3JlIHRoaXMgY2FsbA0KPiBpcyBtYWRlIGFuZCB0aGVuIGh1Yl9wb3J0X2luaXQoKSBqdW1wcyB0
byByZV9lbnVtZXJhdGUuIFRoZSBmdW5jdGlvbg0KPiBiYWlscyBvdXQsIGJ1dCBzb29uZXIgb3Ig
bGF0ZXIgc29tZWJvZHkgd2lsbCB0cnkgdG8gZnJlZSB0aGlzIGRldmljZSBpbg0KPiBzb21lIG1h
bm5lciwgSSBzdXBwb3NlLCBzbyB3aGF0IGhhcHBlbnMgdGhlbj8NCj4gDQpCeSB0aGUgdGltZSB3
ZSByZWFjaCByZV9lbnVtZXJhdGUgKGh1Yi5jOjYyMzUpLCB4aGNpX3NldHVwX2RldmljZSgpDQpo
YXMgYWxyZWFkeSBmcmVlZCB2ZGV2K3JpbmdzIHZpYSB4aGNpX2Rpc2FibGVfYW5kX2ZyZWVfc2xv
dCgpDQooeGhjaS5jOjQ0MzgpIHdpdGhvdXQgbm90aWZ5aW5nIHNpZGViYW5kLiBUaGUgbGF0ZXIg
eGhjaV9mcmVlX2RldigpDQppcyBhIG5vLW9wIGJlY2F1c2UgeGhjaS0+ZGV2c1tzbG90X2lkXSBp
cyBhbHJlYWR5IE5VTEwuIFNvIHRoZQ0KZGFuZ2Vyb3VzIHdpbmRvdyBpcyBiZXR3ZWVuIHhoY2lf
ZGlzY292ZXJfb3JfcmVzZXRfZGV2aWNlKCkgKHdpdGgNCmNhbGxiYWNrKSBhbmQgeGhjaV9zZXR1
cF9kZXZpY2UoKSBmYWlsdXJlICh3aXRob3V0IGNhbGxiYWNrKS4NCkdpdmVuIHByZV9yZXNldCgp
IGlzIGF2YWlsYWJsZSwgdGhlIHByb3Bvc2VkIGZpeDoNCg0KMS4gU2lkZWJhbmQgY2xpZW50IGlt
cGxlbWVudHMgcHJlX3Jlc2V0KCkgdG8gdW5yZWdpc3RlciBhbmQgc3RvcA0KICAgIHJpbmcgYWNj
ZXNzIGJlZm9yZSByZXNldC4NCjIuIEFkZCBhIHNpZGViYW5kIGNhbGxiYWNrIGluIHhoY2lfZnJl
ZV92aXJ0X2RldmljZSgpIGZvciBkZWZlbnNlDQogICAgaW4gZGVwdGguDQoNCkRvZXMgdGhpcyBh
cHByb2FjaCBsb29rIGFjY2VwdGFibGUgdG8geW91Pw0KDQpSZWdhcmRzLA0KTGlhbnFpbg0K
