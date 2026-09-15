Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013028.outbound.protection.outlook.com [40.107.44.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADD647A88F;
	Tue, 15 Sep 2026 10:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467105; cv=fail; b=dOJwo3KT/ZqL/P/ETY3BmzuDUtUZMq/hXw18MsgmhSlogfksmkDVU20PgRsJPVVbyCh3MkiHQAnHrPemkOqjSPFo2symaVaD/TgdgdvUsa30JLfSOG15q5EDQYiRfprjzIleHdKYIQsKPrgFqM6PG1MGG37O9UrBeD7r6QYz5jo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467105; c=relaxed/simple;
	bh=s4BvLnaVm1ewk4Q//tt5Qk4L5cCTH236uZ20Kte686k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u2sIqUTMWhVRT5BWi3z/U5h8TPF7BgTGFuzZCr6uCFAGtyL7tvKAAz8Jh7EVBo6GW1v234smICsbB8K5fP6g+VS7J9UagKJZkhqk+5piSK9sKyJQoydPut+tzhxniMhC72h1sqKnBdnnDz3u4TpM7YEtNILbFuo2M61Hn8F72Io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Xcogra6G; arc=fail smtp.client-ip=40.107.44.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Xcogra6G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y80xQVwhybdPE9YTFjkppWfnwbhy+aiWKWVC6da3AxbS12g/TSQGvTZUQ8okP/f3c4xX3/+qK2UVh+1mFbqMigyfn7X6uYKJTrv9Ql2uxV7ooGVGmM+EcItc1ThmQV8PLrB5Fg4T0i7X9H4Rl3A2JMfCyedWL1zOEnZDeHaFZF+XLBSakoBE1rldVgMoI0EwP1StwsIzLGVi9rOjKg/fl1IH3rrdQxu9GcZ+YKM5kTOaZz8MejzPa9Xtkjxw8EE8Kqfvh9+WQjXp8sQwOvg0gERbIznuKEfQq7KxQI7Ijz8L1sWIkGDi7cYcMd5BBtczmAStWGTikwmAycQ8AwtDHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4BvLnaVm1ewk4Q//tt5Qk4L5cCTH236uZ20Kte686k=;
 b=pPg7hPqtIP7Gcq+NckzsIj/RunXLNfx01ld0xPFV/z2RgX1FVoeb6MjXcoDZPRvKReC9qcyvgQWe31IjV3yF5Tx8sCA9FiCSmdnGrjfD9J6sMsaH8j1DKT0MjlaDPqBatsi8Vxkoa4brujKr06V0X7ndudfQDoXk41hmlwxjLfRQ2JBJNFx5nOOFTsa1IEQkxKLLpHUlh8NIpoDKV21/qKKd4suoCIryMK7dgd5HFyTGG1jlccYDw5yd5P+Yb4prXYyIz0UhQsB/bxzWX7oTSTUcI41eZZTq71oUFM4b22XQkksXb0kwyazaU212gC68hyhY8rLk3Zh3xSVbAv8WDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4BvLnaVm1ewk4Q//tt5Qk4L5cCTH236uZ20Kte686k=;
 b=Xcogra6G382vMVXioe09ab+tc2JBFBfURddT7Nma19L4FHm83aHRXlVbbp+6PQSTY5iH+VKbBLp01SYw7BATS7o7tnuVlbyClUUuX8lrzx8QOa33+9MLlnqsxwRgMKWZHlkhcJJ3YB9wbyloGXc3WLoiBKnKqxvf/l4MsKP4/IaVWKkbE7i2DQ/A7I3dhguFg1qw0bP+N3Z77sZL/NEYUH1PYsOuC1UNM8kpCjGY1oGrMFwTJBQ/Qg5RLGX9wpJkCN0i/Ps+jrmdnU+Bu/5ddeUdwH1VjnOK5BeH3OJTMVbs0clZJqUSmeyLazneQ2vnbLi/sICMGVqWKIgS24UUgQ==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by KUYPR06MB9087.apcprd06.prod.outlook.com (2603:1096:d10:72::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 10:11:37 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 10:11:37 +0000
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
Thread-Index:
 AQHdQrDeGfWFiGmxd0qOioBk2uqA3bbNqDxAgAAj+ICAADb5AIAABlEAgAAQIwCAASzQUIAABQkAgAAIPjCAABKzAIAACJSA
Date: Tue, 15 Sep 2026 10:11:37 +0000
Message-ID:
 <TYUPR06MB6217AF91F5971E84DEA802F6D2BA2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<750468423.101789103583573.JavaMail.epsvc@epcpadp2new>
	<TYUPR06MB6217F0788C14DD89D237C807D2BE2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<937773018.41789116303608.JavaMail.epsvc@epcpadp1new>
	<191ee5d5-d93d-4fa3-9654-b3735d344118@linux.intel.com>
	<20260912141837.06b2f3cf.michal.pecio@gmail.com>
	<TYUPR06MB62174110FB101AD6B7B069EBD2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<20260914110949.38a46596.michal.pecio@gmail.com>
	<852003c6-317c-4004-ba2c-d6c4b0bd31e6@linux.intel.com>
	<TYUPR06MB621791B56D232A2219614493D2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<20260914154656.56824fbd.michal.pecio@gmail.com>
	<TYUPR06MB62176901C1E1403E65F9A365D2BA2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<20260915100136.38b4c31f.michal.pecio@gmail.com>
	<TYUPR06MB6217CD9B8231A5A7EBECEB53D2BA2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20260915113802.22b04c57.michal.pecio@gmail.com>
In-Reply-To: <20260915113802.22b04c57.michal.pecio@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|KUYPR06MB9087:EE_
x-ms-office365-filtering-correlation-id: db712b83-fd3b-4aa2-fb82-08df1311baa7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|7416014|376014|1800799024|23010399003|11063799006|56012099006|4143699003|6133799003|10067099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 Y9elodkNbE+Cyqq0XzWzRcq0dzmSZyGnGeYmjVr9k6VrUPU0jErlNk1V1k+uZvaRWLFQuSnMziG1aUGlCbAObmOJV8/scmiZ/U0UEdvZo3fwt8av+0tyUngPFw2QmxOFvoULNbCNWY8IzGZlZgFBvF6MABRw7xrf1T4GZPe57lm4SAeui4uaQH9RzZB56+pXtdkCIFt2fxOVzzmk/Hx8Qk/T0Eh8Z9MmigzJOxI6RbLi1ygVjU2bdIC7r7V/ChPOJ3kzoKsKDf8iDUy10y5OxG7m7lg+9Qu9ZwJXi0z7eaaEQxyC3crq1Cy8BKAqCEOdT9ru42BTN895VGj0TqGDno3KdMec8ldd2Cos4Xri7qboPFtv+q1iDfIkLaJDG1UX8XKH6UNkIK4nkQvw0pDa6OWgs0I+/Is/q2YqxEQKzLH+8QPv54Na6Ux2Bpm49Z+Hm/Ju78L+wnqQ7FQt+WMA0uc7aNGIys73vTuaYyww6iEzaLQn+CkQ2QRzPghv2ruqK91PR+BBPSvF2JGz9M/3eIvQtKqH4+bTRmzJVn4lFUbHk6f+vPQuxyZuiTDMUUi1L5XBn7VS+PfbNFpV9gxOpHBx/DiYPcAOXWJP9f2Ep4V2nouahOndFPMuIEzwVotFceA+9dwP4zxF/m+TG4FLcan49N2J95PnoMOWF1jUHiC+z4I4JAh7WjOb4FcvBPx4ezaIUl0c6XVnPnm6yWfw8+BSiWYOyjBp+ukk3odspzw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(7416014)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(4143699003)(6133799003)(10067099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bS82YmhlaXo3T3laS05HK3U3N01YK3VpVDlqb0dIM1RheHlMQXp3U2R3dG5G?=
 =?utf-8?B?QlV2WWZkREpDd0Q3c0tkQlFxUTljWU0yNkQ3NmJOQXluNklUTjAwa0pwMGY3?=
 =?utf-8?B?SVI0ME14VitieG5RVGE1MVVqckNSSnJybnYyanlYTnc4ZVNHZDJqZ2V1bXVP?=
 =?utf-8?B?K1pQYWxyS25QQUl4NEc0RndQNU8vWDBNVDhsTFU1NlV4UlJBR2Y5L1VPLzZT?=
 =?utf-8?B?cGY2V1o3QjIybnhZSDI2T3ZHSHdBWFlJU0o1Y0hGM0VFS3gzQ0dURDNkY2tn?=
 =?utf-8?B?bFM0U3hWYVM0NWVxaytvOTF1ZElkclZCVCtVMGcxTnliVlpJZkIzSnNKWC9P?=
 =?utf-8?B?QllUZDFzbGZMQUpic25OTmRyc29HdmxsbXY3VnZBM3B0eHlIR2RtVDlTSTlF?=
 =?utf-8?B?L2ovUWRRU1F3aHQ4MFRKWnE1STdpZC9MUVpKOGt4OFU1azVmMFd6ek1UcEo1?=
 =?utf-8?B?aXN2bGFodHRqcUliNTZOWUtPaGZvcXNHb2V1L0U1dk1SYzkyWHIxeVdERzkr?=
 =?utf-8?B?WTdhMWtKQW9HcmpwSVhaYWN5U3hyTEF5Z2NkUGlzVnZrckQvOE9CNkRueElk?=
 =?utf-8?B?SDk4VkNST2xVKzVJRW9Lem9iYTVTWFZtVTlTTVFoOWV2b0VpL1FMV0pTajIw?=
 =?utf-8?B?ZGRvNU05R0ZwVG9aSWpYUG1FOXZvckl1cHF3alAwNXFCdGFPVnUwekYvanM5?=
 =?utf-8?B?a21DYk15MGhaTE5mSm8zSERRNm9ZbVh4UXZZM2NFOEV4SlhKVlJEcWJ3UGxk?=
 =?utf-8?B?R0Fzd2VXMUdUMDBzM2tzTGRqdlo0QkNEdXF2ckpKWlJBK2o2QVU3NXpub2o1?=
 =?utf-8?B?aG85MTRDZ2pqSzlwZTFxbG9rcW51Y3hCNk8ya1EranhqbkpreU1WWml5WTJV?=
 =?utf-8?B?c2wxVGFzb0JhY2prYklFOVA4dXByT0JFR3V4Rlcvb2F2bnZVNkVwb25FeGJo?=
 =?utf-8?B?dG5kNHVRUTN4QktWamlhL2pNNGpqZkhCYkxBamFnbFkyelh5YTZpS2ZTQ3ph?=
 =?utf-8?B?QVlMUE14L01xYnBxQTN1MFhHS3hSaFd4cWswZVA1Y2o4Zi9vUnJlTHZ0RCtH?=
 =?utf-8?B?R0hIemFlNjhWN3pFbFMyRkxGZEhCQjMwZzV2ZkNkVUdOM0lUU3dmeFVleXc5?=
 =?utf-8?B?M1ZhOG0wb09nK0tkOTZ6Q2wrN2RJU2FIbWxwRkt6ZWFFN1lmbUJUdnpMQmFk?=
 =?utf-8?B?MlZKaG1ETFFnNnJvOGxlUkh0RW1DcExENzhXUk00OTR5NDI2dDdPNnJRTHVM?=
 =?utf-8?B?WUliVitnWnJUdG1oRDlDOWQwUk1KeTJTS0VpM3BHcXVremNJM0hIR0hSTkV0?=
 =?utf-8?B?YUloUElScDlWSGF4alNQWTB4dE9yaUd6OFlYSHY4clkvRk43SWIvMy9Ic0VK?=
 =?utf-8?B?U0padXhUTll1OVFTaDYvakYzTWxHSzdBb1VQcEw0eGtTaFpVblM1UDU2SmU2?=
 =?utf-8?B?dGRNeTNSZ3JSRElicWNXUGZ3Y1MzOG5DcDcwSjlici9SQUlDWVZQWlJIbGxQ?=
 =?utf-8?B?bkdMZnpBYlI2aUI3aDNHSnVZcW5RQm5pYkU5OFpDRG1SYkxxMU9ZaVJxUzhO?=
 =?utf-8?B?SVNDbkFJQm9qMHBtcGpEQ296bGdQRmRvTkswVlpVSjlENzFVcDRNN1VEY1p2?=
 =?utf-8?B?QkdPTEg2SGNhOTJkM1dRdmJuUU1CaGF6cUtKZExzWjZmWWxmbmJ6eWp5MG81?=
 =?utf-8?B?NmluMmNHTFlyMWZSSDV3RlZpU1pxMkN5R3ROYitVamt6SDVOR2k5UHNQcVVv?=
 =?utf-8?B?UFc2RjlpVUErTDB0dFlZWTd6SmprMkhheTNMd0VpMDN6S0IxWExjTkR2Nmo0?=
 =?utf-8?B?b09pdjNNWVh5b2xHUTNyOE5CbitjL1dMVGxGb2k1YkI4NGoxTktnc2ltaTJk?=
 =?utf-8?B?RGdOa2RpUmxINzdwdTdFVlp6SE0yazZTV21XZmRrTGlKQVZ1ekVJeWFxQ2hm?=
 =?utf-8?B?Tk5YV21vbERJSTdHUHZHcnpQTUh5a3VJaDhma3VjV05OYVRkNTMvL0N4UXZa?=
 =?utf-8?B?eXdYQjZqU0JlbkV3UUhvVVgxM0c0Um93YlREc1dvc3BjWkNHdDVOYVA2VXhM?=
 =?utf-8?B?aTMvZ0QySElCWGJCbUE5NzBHQjRNUWZlZVRCOFFINms3MjZJTUJHaEI2Qjcy?=
 =?utf-8?B?QTFjZUtSVlJDdGlTR3l1MUhyQ29yTjZsWFZzS3BsNHIyZFlsUGIrQWsvTjNv?=
 =?utf-8?B?VEk5V2lTei80aUlTRzlMa2h2SzhFZTk3cjlVczl3VUZoSElIbnZBRXNGYkd5?=
 =?utf-8?Q?VrfWHMYUmdLWkR5HewgYeYGkZPt/y7IwUj8TPNUc68=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: db712b83-fd3b-4aa2-fb82-08df1311baa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 10:11:37.6485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PRXO6/UuJkTG9bpO1r52ggzNZqB7C3Eiv0J0zuJWVUYU0Svg5H0ChpUXc0/PU68B+uYL5HBxbvcCyu6tkjBp5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR06MB9087

SGkgTWljaGFsLA0KDQo+ID4gVGhlIHNuZC11c2ItYXVkaW8gZHJpdmVyIHNldHMgc3VwcG9ydHNf
YXV0b3N1c3BlbmQgPSAxDQo+ID4gKGNhcmQuYzoxMzQ3KSwgc28gdGhlIGRldmljZSBjYW4gYXV0
b3N1c3BlbmQgd2hlbiBubyBhdWRpbyBzdHJlYW0NCj4gPiBpcyBhY3RpdmUuDQo+ID4NCj4gPiBE
dXJpbmcgc3VzcGVuZCwgdXNiX2F1ZGlvX3N1c3BlbmQoKSBjYWxscw0KPiA+IHBsYXRmb3JtX29w
cy0+c3VzcGVuZF9jYiDihpIgcWNfdXNiX2F1ZGlvX29mZmxvYWRfc3VzcGVuZCgpLA0KPiA+IHdo
aWNoIHNlbmRzIGEgUU1JIGRpc2Nvbm5lY3QgaW5kaWNhdGlvbiB0byB0aGUgQURTUCBhbmQgd2Fp
dHMgZm9yDQo+ID4gZGV2LT5pbl91c2UgdG8gYmUgY2xlYXJlZC4NCj4gPg0KPiA+IEhvd2V2ZXIs
IHFjX3VzYl9hdWRpb19vZmZsb2FkX3N1c3BlbmQoKSBkb2VzIG5vdCBjYWxsDQo+ID4geGhjaV9z
aWRlYmFuZF9yZW1vdmVfZW5kcG9pbnQoKSBvciB4aGNpX3NpZGViYW5kX3VucmVnaXN0ZXIoKS4N
Cj4gPiBUaGUgc2lkZWJhbmQgcmVnaXN0cmF0aW9uIHN0YXlzIGFjdGl2ZSBkdXJpbmcgc3VzcGVu
ZCDigJQgdGhlDQo+ID4gZW5kcG9pbnQgcG9pbnRlcnMgdG8geEhDSSByaW5nIGJ1ZmZlcnMgcmVt
YWluIGluIHBsYWNlLg0KPiA+DQo+ID4gVGhpcyBpcyB0aGUgcm9vdCBkZXNpZ24gaXNzdWU6IHRo
ZSBzaWRlYmFuZCBjbGllbnQgYXNzdW1lcyB0aGUNCj4gPiB4SENJIHJpbmcgYnVmZmVycyByZW1h
aW4gdmFsaWQgYWNyb3NzIHN1c3BlbmQvcmVzdW1lIGN5Y2xlcy4gQnV0DQo+ID4gb24gcmVzZXQt
cmVzdW1lLCB1c2JfcmVzZXRfYW5kX3ZlcmlmeV9kZXZpY2UoKSDihpIgaHViX3BvcnRfaW5pdCgp
DQo+ID4g4oaSIHhoY2lfZGlzY292ZXJfb3JfcmVzZXRfZGV2aWNlKCkgZnJlZXMgYW5kIHJlYWxs
b2NhdGVzIHRob3NlDQo+ID4gcmluZ3MsIGludmFsaWRhdGluZyB0aGUgc2lkZWJhbmQncyBwb2lu
dGVycy4NCj4gPg0KPiA+IFlvdXIgc3VnZ2VzdGlvbiBpcyBjb3JyZWN0IOKAlCB0aGUgcHJvcGVy
IGZpeCBpcyBmb3IgdGhlIGF1ZGlvDQo+ID4gb2ZmbG9hZCBkcml2ZXIgdG8gcmVtb3ZlIHNpZGVi
YW5kIGVuZHBvaW50cyBkdXJpbmcgc3VzcGVuZCBhbmQNCj4gPiByZS1hZGQgdGhlbSBkdXJpbmcg
cmVzdW1lLCByYXRoZXIgdGhhbiBsZWF2aW5nIHRoZW0gcmVnaXN0ZXJlZA0KPiA+IGFjcm9zcyBz
dXNwZW5kL3Jlc3VtZSBjeWNsZXMuDQo+IA0KPiBXaGF0J3MgdGhlIHN0YXRlIG9mIHRoZSBhdWRp
byBzdHJlYW1pbmcgaW50ZXJmYWNlIGR1cmluZyBzdXBlbmQ/DQo+IElzIGl0IGJlaW5nIHN3aXRj
aGVkIHRvIGFsdHNldHRpbmcgMCwgd2l0aCBzaWRlIGVmZmVjdCBvZiByZW1vdmluZw0KPiB0aGUg
aXNvYyBlbmRwb2ludCBhbmQgdGhlbiByZS1hZGRpbmcgaXQgYWZ0ZXIgcmVzdW1lPw0KPiANCk5v
LCBpdCBpcyBub3QuIER1cmluZyBzdXNwZW5kLCBzbmRfdXNiX2VuZHBvaW50X3N1c3BlbmQoKSBv
bmx5DQpzZXRzIG5lZWRfcHJlcGFyZSA9IHRydWUgYW5kIG5lZWRfc2V0dXAgPSB0cnVlIGZsYWdz
DQooZW5kcG9pbnQuYzo5ODItOTg5KS4gVGhlIGFjdHVhbCBhbHRzZXR0aW5nIHN3aXRjaCAodmlh
DQplbmRwb2ludF9zZXRfaW50ZXJmYWNlKGNoaXAsIGVwLCBmYWxzZSkpIGlzIGRlZmVycmVkIHRv
IHRoZSBuZXh0DQpzbmRfdXNiX2VuZHBvaW50X3ByZXBhcmUoKSBjYWxsIChlbmRwb2ludC5jOjE0
OTIpLCB3aGljaCBydW5zIGZyb20NCnRoZSBQQ00gcHJlcGFyZSBjYWxsYmFjaywgbm90IGR1cmlu
ZyBzdXNwZW5kLg0KDQpTbyB0aGUgaXNvYyBlbmRwb2ludHMgc3RheSBlbmFibGVkLCByaW5nIGJ1
ZmZlcnMgcmVtYWluIGFsbG9jYXRlZCwNCmFuZCBzaWRlYmFuZCBwb2ludGVycyBzdGF5IHZhbGlk
IHRocm91Z2hvdXQgc3VzcGVuZC4NCg0KPiBJZiB5ZXMsIHRoYXQgc2VlbXMgbGlrZSBhIHByb2Js
ZW0gYWxyZWFkeSwgYmVjYXVzZSB0aGUgcmluZyBtYXkgYmUNCj4gcmVhbGxvY2F0ZWQgdG8gYSBk
aWZmZXJlbnQgYWRkcmVzcy4gSXMgdGhpcyBoYW5kbGVkPw0KPiANCj4gSWYgbm90LCB0aGVuIGRp
c2FibGluZyBzaWRlYmFuZCB3aXRob3V0IGRpc2FibGluZyB0aGUgZW5kcG9pbnQgbWF5DQo+IGNv
bmZsaWN0IHdpdGggcGVuZGluZyAibGFyZ2UgcGFnZSBzdXBwb3J0IiBwYXRjaGVzLCB3aGljaCAo
SUlSQykNCj4gYXNzdW1lIHRoYXQgc2lkZWJhbmQgaXMgYWRkZWQgKmJlZm9yZSogZW5hYmxpbmcg
dGhlIGVuZHBvaW50LiBTbw0KPiBlaXRoZXIgd2Ugc29sdmUgdGhpcyB3aXRob3V0IGRpc2FibGlu
ZyBzaWRlYmFuZCBvbiBzdXNwZW5kIG9yIHRoZXJlDQo+IG11c3QgYmUgcnVsZSB0aGF0IHNpZGVi
YW5kIGNhbiBiZSBhZGRlZC9yZW1vdmVkIGF0IGFueSB0aW1lLg0KPiANCllvdSdyZSByaWdodCDi
gJQgdGhpcyBpcyBhIHZhbGlkIGNvbmNlcm4uIEdpdmVuIHRoYXQgdGhlIGVuZHBvaW50cw0KYXJl
IG5vdCBkaXNhYmxlZCBkdXJpbmcgc3VzcGVuZCwgcmVtb3Zpbmcgc2lkZWJhbmQgd2l0aG91dA0K
ZGlzYWJsaW5nIHRoZSBlbmRwb2ludCBjb3VsZCB2aW9sYXRlIHRoZSBvcmRlcmluZyBhc3N1bXB0
aW9uIG9mDQp0aGUgbGFyZ2UgcGFnZSBzdXBwb3J0IHBhdGNoZXMuDQoNCkdpdmVuIHRoaXMgY29u
c3RyYWludCwgTWF0aGlhcydzIGJhbmRhaWQgKHNraXBwaW5nDQp4aGNpX2Rpc2FibGVfYW5kX2Zy
ZWVfc2xvdCgpIHdoZW4gdmlydF9kZXYtPnNpZGViYW5kIGlzIHNldCkNCmlzIHRoZSBzYWZlciBh
cHByb2FjaC4gSXQgYXZvaWRzIHRvdWNoaW5nIHNpZGViYW5kIGF0IGFsbCBkdXJpbmcNCnN1c3Bl
bmQvcmVzdW1lLCB3aGlsZSBwcmV2ZW50aW5nIHRoZSB1c2UtYWZ0ZXItZnJlZSBvbiB0aGUNCmRp
c2Nvbm5lY3QgcGF0aC4NCg0KUmVnYXJkcywNCkxpYW5xaW4NCg==
