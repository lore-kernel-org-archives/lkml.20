Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013035.outbound.protection.outlook.com [52.101.127.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D5548EC73;
	Fri, 11 Sep 2026 13:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135094; cv=fail; b=omHyWN+1EqREhUjsyVX+qRXX4cW4vrjUcQCPiF7L2Gt1miN1/yWP8N43NVZzAiWx5EWEzSlOuHpkII+Kco5AcGKLcvoYbWKaNlLOdO5zwmm5l/CfNCwWfhbCUU+wIz51qKdG8hveXGK6Fdkc1NowsV+RSTBZPeeiGa1cpDzpFOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135094; c=relaxed/simple;
	bh=7Vr23GQ/C2/J5EKf7bSop/ItbZhOgE5CCfYB8sgV/98=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J7FCwteylcKKlRgHxphYJ9x2cbL/am8M4bYuncPrS1MuFhXBkT0EFM6qBYFSGbwSC17gaGP86IZWGpD/Gkazo2WCb3kyeK5/huMj1X8Xb2m76444Tsrd3pHC2V5VbvkkWxxqon4S4lgZrV43uIi2Kf1Ahb6vb2p4L2OuaJOSqZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Liw+Nolc; arc=fail smtp.client-ip=52.101.127.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Liw+Nolc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjPbSmKs9bR2WUOjmaIwjYIOsGzMho2Uvh9q33fOBFjrRs5qbliMB6lKPdneVUwEE6Cu+267QKWnvEdSTegSjJqdJxbxsXxqkO+wcNePKaP2S0+ZywacfXHscA861735IRJzLEj1XhdAPcf3Jq5iyQYuqQdqpjg0gDccJioAO/jpTqvU2b2BvJ0lp5APqkp24vhRH+gu6DUVaRDyGqv7x9Q92D3rxwsbP6MJ+lj5wQlHqGswyLa7NhVTOgdHXvKakXVpsXqQ878vb93nMVtveCkJjKXNX2Ft62ZCmA+PUL1kKQv+o/JXKVAYIp97Pa9WHhWZI+Fvbh34kvNG9XUyXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Vr23GQ/C2/J5EKf7bSop/ItbZhOgE5CCfYB8sgV/98=;
 b=gi257xHYGzfZcbODmlcywsH1+nDAOiWgr/zoZDGEIHaOLOB9PLTyZLBrQa3+H968ZC464DjI7NBTyechd2xVqH41v3Vavv9lJbocvzlo7/vAckSYS2y5vNVRDGt2FepUaC0R+yMg5RJtAIDPJv+He29Jq6AN2idxuGaoYw+iVG9CTYQMYvnpsIFhQIXPIcuaiHNpl/kwmmplErdPHmObkjriKiTUURKlVihlgC+iPEt6QiAJ0pIAcVX57/6m/SnADfSXG/hDirryf9xOpxb6AOW7hoQPOCv4TXPY/2Xo/mRjqRywP2cvEb4H5aCoEYamq/JLBS8a/YkkYWLkY9b1rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Vr23GQ/C2/J5EKf7bSop/ItbZhOgE5CCfYB8sgV/98=;
 b=Liw+NolczLoSitCJqYQvHBrA6cM82PxlMTuaSiM/Qzat5lWVvSfMkoJ+HAMB9zBye3ZezH4k1zERLwvSNddYK95yiHFLw4y5T1Iwwssm2y8wsjByrqdgireZ2LwhwH1pr9JbDA8DfU4BlzlELVhH3kyzzbm05gq3r8seYuoYN24+7SHplcGHPez5JqH975EJiu0d4F97ZqSgW/Yu3i9eZVwBiYPqjZkVbp0gFo7joK6pyVBr3apNvrG4ic/q+7V9bGSgVr3yaTw7n0mMl0F7Tlv8oLITvyN+H3gj/92f0zpFzzVM8F06U7pNYCi907Ao32XzV1ZFI/ciDnOY/IReyA==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by TYZPR06MB6353.apcprd06.prod.outlook.com (2603:1096:400:429::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 13:58:08 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 13:58:08 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: Michal Pecio <michal.pecio@gmail.com>
CC: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "quic_wcheng@quicinc.com"
	<quic_wcheng@quicinc.com>, "broonie@kernel.org" <broonie@kernel.org>,
	Selvarasu Ganesan <selvarasu.g@samsung.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject:
 =?gb2312?B?tPC4tDogW1BBVENIIHYyXSB1c2I6IHhoY2k6IGNsZWFyIGRhbmdsaW5nIHNp?=
 =?gb2312?B?ZGViYW5kIHBvaW50ZXIgaW4geGhjaV9mcmVlX3ZpcnRfZGV2aWNlKCk=?=
Thread-Topic: [PATCH v2] usb: xhci: clear dangling sideband pointer in
 xhci_free_virt_device()
Thread-Index: Ad1B1wnGFfGQTYLgSGeVRSWnSsaqQAADjzkAAAOUYYA=
Date: Fri, 11 Sep 2026 13:58:08 +0000
Message-ID:
 <TYUPR06MB6217DEBA09B8807D3B4ECACDD2BE2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB621762AD5F5F586DD177A77AD2BE2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20260911140128.2f05ad5d.michal.pecio@gmail.com>
In-Reply-To: <20260911140128.2f05ad5d.michal.pecio@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|TYZPR06MB6353:EE_
x-ms-office365-filtering-correlation-id: 42f96243-f83e-48ba-3539-08df100cb5b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|23010399003|376014|366016|38070700021|6133799003|10067099003|56012099006|11063799006|4143699003|5023799004|22082099003|18002099003;
x-microsoft-antispam-message-info:
 mcDOrLfUVh/1OAyAsebvlVr+iB4KH+cjLlpOtomOOEbzf1e7DMQDVqnpSEz6NVmpusml3Hz67/rdfDblf58nC/6pKvbadzADbA8o2sv0xVIrTe9p9ww5fJuTVmXgmZhdW18ISJqFyWWXAMRyanbg/IqgQBIeN2uW+2ZhRacuXZy8dCKYuRxV0z74ZDbtmSZa7Qm0Wv8D4Og7gByjvQbL2BupR1LB9ztAb3n0jKXREBNkM2EY0c0p71mtcvGwj5MJYrEqnH5lCLCD0WXbkK3PnMCfi4BCOicUoBuKKvZIlzd2GH85i0AcReUXA3Xp8oV3styhelmr6bqWF5GCNrami6EMjO3KpQQGkZPoiIawLHOP45s4cM1/3e0LIhlqTpSzdDqhz+bosIWX28tsIY24cXPmrfbY7tvMq8xOJoCy30vTkUW6xuXSdlbq9tQz+VhvFi1rawoexCfSjevnf4rhDp5aYXBLKRrgXLiF9G3/rLUwcjCPB2Gl8Elof+Ut/n2GGu7PTbjPUz09oShVSMovDHQCkeDekIaEVO89sdt3SZEEgW72PhpDgCoASJjSwRFGN4mqIaRUbFwZoXxt03WeQG5t2JLjNkCtx6uTEGqVH6jmLiQvj66RFHAR4+NzSz/Z56XWj1i0+V7AaxXNnW0FIbVHGYxWi3RVDk62NZIavh5gZs55UK/hYITdiIPkwKG/p3k7dGGYY6W1GKW+CFuety8D68xxh8Jb/gN1JIww3E4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(23010399003)(376014)(366016)(38070700021)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?TEJNeS9pelh1ekNrR2JDeUZyOEN0Z0dBSHBKVGlXNkZPbHJkeDhiNTRnamxt?=
 =?gb2312?B?Mm1wNTJubWxCSzZyRHJmN2U0MEtOZ0Z6Vm9VdFpha1puWUc4VmN0UzBZRmh5?=
 =?gb2312?B?UE1kc0VqT2lxbkM2KzJyanBvSWpDcmVabGFQK2N4anpXWjMzVFVpdWt0ZHpB?=
 =?gb2312?B?OEFXNU00ZWFXa0lOOW5Sb0xYQllDdDNialM3eGF5LzM1TCtIakxQRWVEZXFt?=
 =?gb2312?B?eC9aeHRvUlEzdXV4ZEFHMGt0QzBDbm0yT042Vm01T2pRZTZldEFoV1RCKzhx?=
 =?gb2312?B?aG1pbi9Za0tKaUVSZFkxSkxWZmhtU3RCMWpJRW9NbTRaaUVSTzMvT2g3ckhI?=
 =?gb2312?B?MlBTMlMxZ1hMcStjUE1XRXlTaTJ1VTVEdGVDNzJTR3pnRUV3a1hjYkdkQVpY?=
 =?gb2312?B?NXl6ZGdmMlpCVW1OZ2JYd1pKbWljeVprSzBjR2QzN2tRZ2RVdjE3UGJIU3g4?=
 =?gb2312?B?YStqcW9OTzAwQ2U3YXdHUFNxYk83OXh0YmVZRklUblNSMUg0WkpVeDRVckg4?=
 =?gb2312?B?T2cxRFNNOWpPcmhCV2p1bk9CcXNFK3ZzdHZnWTJ2YTJmZ0YzUnorWHRWN3FQ?=
 =?gb2312?B?TUg0TlpiVjI4ZEg4dWVPTlhsZFhuM0t4RVFIc0paZDVxYjFVWXhDcmVDZW9a?=
 =?gb2312?B?L0IrUkVteG1xRitzVTdpQjhpR2JBRm9iNHFFOUJoSE9VUk9Va1A4SDduKzVv?=
 =?gb2312?B?bzlSTmxnRC9PNXF5dGt6K1FPTkZHMitQTzBaQXY4MTVFdHpGaFlGd2d0eHB3?=
 =?gb2312?B?MGNNTFVkNzY3ZndPcEVGRHFFb1BEV0MvQ1paQ0pVdkFzMjhJb2lobkJSdVg4?=
 =?gb2312?B?eXV3VGZSRGprYU5nNEF4WHAycmp6Szd1TEVmNVBWKzltbUVSMDhDdWZ5SWZk?=
 =?gb2312?B?d1p5UHVyMzJUc0ZoN2dkRG5jYWdTMWNBWVE5TlR5U2dGdmpqMEdkYUJMdWNI?=
 =?gb2312?B?OEpodFRqQkpHR3pxWFZ2L2YwVXN0U3BQVU1YZE5nZG5kVklYbXZ6UGJLbk5V?=
 =?gb2312?B?TkVzQUFMU09zWE5zNktwNkY4RUIrMVh1QStvWGZTRm84bGRRVDcxWmoxVmN5?=
 =?gb2312?B?Yk1zVldBVzBpRHF2ajllRDJEL3NwcEZkVnV1NUxlcGtPcFZHR2lxUTdiT1NQ?=
 =?gb2312?B?a0JTaGNpeHdTQlFXUmlFV1ZFM3M4L0tUSDZuMUZpckViSVZKcXB4TmI1TFVS?=
 =?gb2312?B?cHdHaWYyMkhIUFQ4NjhXNEpjdGRoL1kxaVpzWVNBNzFFQW9xSGErY0pESVR6?=
 =?gb2312?B?QUhLR1BZdjVVV0EwYWsyajVXbUNXbmpJYnc4c0FjTkd4c3I1enFkSFFpZGJp?=
 =?gb2312?B?T2dCcWRSQ3hEOFFIWUFpaVJGNzNuU0NZRHRMSEhFTEk4OCt3OTZWMkYvaGNR?=
 =?gb2312?B?NHVBU0o3RmFyT2ZaNjVpVjBNMGZwV04xQkpoaVZVVG9EU09NZmtKWjFFSk16?=
 =?gb2312?B?cENNelVyaStDSkxVQjJXWlZZTDB2eUdDYjFXcE53bS9GY2tOandoTEF5S1J3?=
 =?gb2312?B?bXZXMThMdmp6bXoxSVJUcTFQMWhoQzkzb2lnRERpcGZJYUdvaHpZNWtMYkpK?=
 =?gb2312?B?NkVEalh6Q1FqSEQrMmgwMysvbDRsQlJJSVZWM0w5RTdwWnkrSzBQV0kzd1Az?=
 =?gb2312?B?MFd4ZE1mR2FWaUhldDNvcTEvbDgvaE4wVWw5YTFGdkdIYTRjS0s3YWV6RCtF?=
 =?gb2312?B?S09TTzY0c2lsWmtPbDlKRXlBRGZaV1NNVHdVcDZEZVBsMW40ZTBxclRGOHZS?=
 =?gb2312?B?b0xMMmJHa0FmMklNUTdaeHMzL2lCN3dMclNnK3BjTDJxT1pKaVBsM3lrMWFT?=
 =?gb2312?B?R3lRenBNZTBiMlZOYWQ0aVZuc1dVcE5LckdqU0dGRE1yVG9QdnB5R1cwSEl3?=
 =?gb2312?B?Z3YrTVJqTmY1MHptZEhwNmNKbnFPaGxtc2xRRXVyNkpVUEhZL0F2QUhBczdB?=
 =?gb2312?B?Z3RRM0RhRDJ3bURRenR4MG8zRnUyS1IzbjcvbmtYMUlueGw0VCtIMEIxakFJ?=
 =?gb2312?B?OXlDbkFKVkJsNWdXVXg0SThkc2FZZFR3ZEhyODhxVG01ZWJ4S0FQeGpMeFU3?=
 =?gb2312?B?aW1jZlMxdW1ncStHcmt0TDFmQU8xajIxM05EREVCaDNZN1BDc01rTkZxYW5M?=
 =?gb2312?B?VHRGdC91SktSRVV5ZHlWZUxRUUpsRFhTWVlNcjhZZUhMbU1BSWtvVHdOZ0lr?=
 =?gb2312?B?SXF0SkMxTHkxNVhva293YUpVVnhKeXhCM0tPUHZ3NURqUmsrS1AzTFdpOENm?=
 =?gb2312?B?aFc5K1hlTGxkZzkzclFoTmc5dUR5UmdZYjhBUWdxQ2ZacitZeHpPR0dGOFll?=
 =?gb2312?Q?tqycPl50bAY2ieVxHW?=
Content-Type: text/plain; charset="gb2312"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f96243-f83e-48ba-3539-08df100cb5b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 13:58:08.3747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xoZbzSM4lSU7PzRNPN0mDcN3XDksPDmtH7EdR53PpVceo/tWz/UWwgLG2uV/u595wLcKV8xbz/jVlsQ9zkmmvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6353

SGkgTWljaGFsLA0KDQpUaGFua3MgZm9yIHRoZSBkZXRhaWxlZCByZXZpZXcuDQoNCj4gPiB4aGNp
X2ZyZWVfdmlydF9kZXZpY2UoKSBtdXN0IG5vdCBsZWF2ZSBhbnkgZGFuZ2xpbmcgcG9pbnRlcnMu
DQo+ID4gSWYgdmRldi0+c2lkZWJhbmQgaXMgc3RpbGwgc2V0IGF0IHRoaXMgcG9pbnQgdGhlbiBz
b21ldGhpbmcgaXMNCj4gPiB3cm9uZywgZS5nLiB0aGUgc2lkZWJhbmQgY2xpZW50IGRpZCBub3Qg
dW5yZWdpc3RlciBiZWZvcmUgdGhlDQo+ID4gdmlydHVhbCBkZXZpY2Ugd2FzIGZyZWVkLiBUaGlz
IGNhbiBoYXBwZW4gd2hlbg0KPiA+IHhoY2lfc2V0dXBfZGV2aWNlKCkgZ2V0cyBDT01QX1VTQl9U
UkFOU0FDVElPTl9FUlJPUiAoZGV2aWNlIG5vdA0KPiA+IHJlc3BvbmRpbmcgdG8gc2V0dXAgYWRk
cmVzcyBkdXJpbmcgYnVzIHJlc2V0IHJlY292ZXJ5KSwgY2F1c2luZw0KPiA+IHhoY2lfZGlzYWJs
ZV9hbmRfZnJlZV9zbG90KCkgLT4geGhjaV9mcmVlX3ZpcnRfZGV2aWNlKCkgdG8gZnJlZQ0KPiA+
IHZkZXYgYmVmb3JlIHRoZSBzaWRlYmFuZCBjbGllbnQgaGFzIGEgY2hhbmNlIHRvIHVucmVnaXN0
ZXIuDQo+IA0KPiBXaGVuIGFuZCBob3cgaXMgdGhlIHNpZGViYW5kIGNsaWVudCBkcml2ZXIgc3Vw
cG9zZWQgdG8gbGVhcm4gdGhhdA0KPiBpdHMgZGV2aWNlIGhhcyBiZWVuIHJlc2V0Pw0KPiANCj4g
VGhlcmUgaXMgc29tZSBjb2RlIGluIHhoY2lfZGlzY292ZXJfb3JfcmVzZXRfZGV2aWNlKCkgd2hp
Y2ggc2VuZHMNCj4gbm90aWZpY2F0aW9uIHRoYXQgZW5kcG9pbnRzIGhhdmUgYmVlbiByZW1vdmVk
LiBEb2VzIGl0IHJ1biBiZWZvcmUNCj4gb3IgYWZ0ZXIgdmRldiBjYW4gcG90ZW50aWFsbHkgYmUg
ZnJlZWQ/DQoNCllvdSdyZSBhYnNvbHV0ZWx5IHJpZ2h0LiBMb29raW5nIGF0IHRoZSBjb2RlOg0K
DQp4aGNpX2Rpc2NvdmVyX29yX3Jlc2V0X2RldmljZSgpIG5vdGlmaWVzIHNpZGViYW5kIEJFRk9S
RSBmcmVlaW5nOg0KICBsaW5lIDQwNzQ6IHhoY2lfc2lkZWJhbmRfbm90aWZ5X2VwX3JpbmdfZnJl
ZShlcC0+c2lkZWJhbmQsIGkpOw0KICBsaW5lIDQwNzc6IHhoY2lfZnJlZV9lbmRwb2ludF9yaW5n
KHhoY2ksIHZpcnRfZGV2LCBpKTsNCg0KU28gdGhlIHNpZGViYW5kIGNsaWVudCBnZXRzIGEgY2hh
bmNlIHRvIHJlbGVhc2UgaXRzIHJpbmcgcmVmZXJlbmNlcw0KYmVmb3JlIHRoZXkgYXJlIGZyZWVk
LiBUaGlzIGlzIHRoZSBCRUZPUkUgY2FzZS4NCg0KQnV0IHhoY2lfc2V0dXBfZGV2aWNlKCkgb24g
Q09NUF9VU0JfVFJBTlNBQ1RJT05fRVJST1IgdGFrZXMgYSBkaWZmZXJlbnQNCnBhdGggKGxpbmUg
NDQzNC00NDQ1KToNCiAgLSB4aGNpX2Rpc2FibGVfYW5kX2ZyZWVfc2xvdCgpDQogICAgLSB4aGNp
X2ZyZWVfdmlydF9kZXZpY2UoKQ0KICAgICAgLSBrZnJlZShvdXRfY3R4KSwga2ZyZWUodmRldikN
CiAgLSBObyBzaWRlYmFuZCBub3RpZmljYXRpb24gYXQgYWxsDQoNClRoaXMgaXMgdGhlIEFGVEVS
IGNhc2UgeW91IGRlc2NyaWJlZCAtIHZkZXYgaXMgZnJlZWQgd2l0aG91dCBub3RpZnlpbmcNCnRo
ZSBzaWRlYmFuZCBjbGllbnQsIGJyZWFraW5nIHRoZSBub3RpZmljYXRpb24gbWVjaGFuaXNtIGl0
c2VsZi4NCg0KPiANCj4gQkVGT1JFOiBpdCBzZWVtcyB3ZSBoYWQgYW4gb3Bwb3J0dW5pdHkgdG8g
Z2V0IHJpZCBvZiB0aGUgc2lkZWJhbmQNCj4gY29tcGxldGVseSBiZWZvcmUgcnVubmluZyBpbnRv
IHRyb3VibGUgaGVyZS4NCj4gDQo+IEFGVEVSOiBmcmVlaW5nIHZkZXYgd2lsbCBicmVhayB0aG9z
ZSBub3RpZmljYXRpb25zLCBpcyBpdCBhIGJ1Zz8NCj4gDQo+IFRoZSBzdWdnZXN0aW9uIGJ5IE1h
dGhpYXMgdGhhdCBzaWRlYmFuZCBzaG91bGQgYmUgZnVsbHkgZGVzdHJveWVkDQo+IGJ5IHRoZSBj
bGllbnQgKmJlZm9yZSogVVNCIGNvcmUgYmVnaW5zIHJlc2V0IGRvZXNuJ3QgbG9vayBiYWQuDQoN
CkFncmVlZC4gVGhlIHJvb3QgY2F1c2UgaXMgdGhhdCB0aGUgc2lkZWJhbmQgY2xpZW50IGlzIHVu
YXdhcmUgb2YgdGhlDQpkZXZpY2UgcmVzZXQvZnJlZSBpbiB0aGUgQ09NUF9VU0JfVFJBTlNBQ1RJ
T05fRVJST1IgcGF0aC4NCg0KVGhpcyB2MiBwYXRjaCBpcyBhIGRlZmVuc2l2ZSBmaXggdG8gcHJl
dmVudCB0aGUgaW1tZWRpYXRlIGNyYXNoDQooTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGluIHho
Y2lfc2lkZWJhbmRfdW5yZWdpc3RlcigpKS4gSXQgZG9lc24ndA0KYWRkcmVzcyB0aGUgcm9vdCBj
YXVzZS4NCg0KRm9yIHRoZSBjb21wbGV0ZSBmaXgsIEkgdGhpbmsgd2UgaGF2ZSB0d28gb3B0aW9u
czoNCg0KMS4gSW4geGhjaV9zZXR1cF9kZXZpY2UoKSBDT01QX1VTQl9UUkFOU0FDVElPTl9FUlJP
UiBwYXRoLCBhZGQNCiAgIHNpZGViYW5kIG5vdGlmaWNhdGlvbiBiZWZvcmUgY2FsbGluZyB4aGNp
X2Rpc2FibGVfYW5kX2ZyZWVfc2xvdCgpLg0KICAgVW5saWtlIHhoY2lfZGlzY292ZXJfb3JfcmVz
ZXRfZGV2aWNlKCkgd2hpY2ggaXRlcmF0ZXMgZW5kcG9pbnRzDQogICBhbmQgY2FsbHMgeGhjaV9z
aWRlYmFuZF9ub3RpZnlfZXBfcmluZ19mcmVlKCkgYmVmb3JlIGZyZWVpbmcNCiAgIHJpbmdzIChs
aW5lIDQwNjItNDA3NyksIHRoZSBUUkFOU0FDVElPTl9FUlJPUiBwYXRoIHNraXBzIHRoaXMNCiAg
IHN0ZXAgZW50aXJlbHkgYW5kIGdvZXMgc3RyYWlnaHQgdG8geGhjaV9mcmVlX3ZpcnRfZGV2aWNl
KCkuDQoNCjIuIEFzIE1hdGhpYXMgc3VnZ2VzdGVkLCB1c2UgZHJ2LT5wcmVfcmVzZXQvcG9zdF9y
ZXNldCB0byB1bnJlZ2lzdGVyDQogICBhbmQgcmUtcmVnaXN0ZXIgc2lkZWJhbmQgYXJvdW5kIGRl
dmljZSByZXNldCwgc28gdGhlIGNsaWVudA0KICAgZHJpdmVyIGhhbmRsZXMgdGhlIGxpZmVjeWNs
ZSBleHBsaWNpdGx5Lg0KDQpJJ2xsIHByZXBhcmUgYSBmb2xsb3ctdXAgcGF0Y2ggZm9yIHRoZSBy
b290IGNhdXNlIGZpeC4gV291bGQgeW91DQpvciBNYXRoaWFzIGhhdmUgYSBwcmVmZXJlbmNlIGJl
dHdlZW4gb3B0aW9uIDEgYW5kIDI/DQoNClRoYW5rcywNCkxpYW5xaW4NCg==
