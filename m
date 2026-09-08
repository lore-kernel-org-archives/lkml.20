Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010037.outbound.protection.outlook.com [52.101.56.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9722576ED5;
	Tue,  8 Sep 2026 17:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888019; cv=fail; b=dg7tXh+lrS5TocDXqExHqDc9AhZf05a1IzJbWx5dEP9pnDHQsvOTUJEj/4QAHBJraW1l9D2mVygHPn9I3F1ZUAlaPoCoNH4mKbMnMMzJzS00BBzl+BB7Or4vZIGfbiRVio+ZFxvnPye7RZknOraXre9Pk21N0FH1obqOHmKlgAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888019; c=relaxed/simple;
	bh=LnMp9RgIPlftIF9UnlVkpRZWq1aixQ8bw6rEnLgZtRk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CczpVNX5wyXliU/AkGwbS+H/A672kCtKaDI9DgHE16f7JhV1DBmbgS5mye/tHVag1G0IBadptmNUnaJ8/o0nP3FVeoc71WdxEO3jY2//PQaUTFfcpxtdTGUxbl+0QVk6TEnJjewvZSk1nwnw3N7Ss0+M4mKF8KajdxJScOS6u9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qFYuHawz; arc=fail smtp.client-ip=52.101.56.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qFYuHawz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLyiSrXRfvVjj1c3COyfugqSRTU1kqovSkiDNIu+SO9mb1HsQIjFb+UcwWqB17ag/cjx4P+CeTtFz13Hnw99YKyjpfjCmk73zFfeorUcS1xANTjLpXgHI7xBNqrCtvdT4203Z6iysR1sgpiB9pSYf2bP+GjHSc10rijJF5o/h/UfesyNC9sC1+t/5LxRFsQQM1M6gWEVa0awYC0qqmsHnObaUVaxFZGShFVdrYhtSuv8yN91d75vEiaDvcGeyNaNkEUaVc/ev0MKPbzJmqy26HbDz4NNPS9XlKiVVTFj7R8/oye56nXfeARizBVx2QbN5B3TsFAl5XCKTqD4kxoGjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnMp9RgIPlftIF9UnlVkpRZWq1aixQ8bw6rEnLgZtRk=;
 b=BDqH4BtMd/7rj+4cinj1guz/Hd3fhclpoYyxblMvzS5uc5nBSmRSIrK8e3OgubsiXFvoymEj+CRcDiQGgqA7DH0rVcY+kbaolJJwiT37u+/VkZp2U/SSj6sOp1anjkCQ1XHVmTP9/7mAB9DE9qL5UZHU5r+AibvfBgBOE1BkUJUBZhoRbPD0FAiiBpwXn0cr9FhCvVEL7tRYd/v6EbmheQgxTWuEJikUm5keZxFXiWAtnVbjw2CvaMxQXgXal2/+AbrwV1yUGCl+mzJaFaKsOnVw00PKeXMqz5SoVoSnhEi+KKdVA91RmxbFr0aos1Wqx+CX3L2I/yTRORjDQo6/ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnMp9RgIPlftIF9UnlVkpRZWq1aixQ8bw6rEnLgZtRk=;
 b=qFYuHawzSmDkIJbPUv5LiRxAswlpCa4nuXtohkVT312eNG8Sf1TSupN5nAaikxnE6xVu/cb04y+L5ZdgcFNqxI5S6Czb01M1E+jr3lSlON8XfXFaE2QfmqmX9ozRB4gx3MBtTTYVsAnywK5cUR7poSaeo3ZAUE6VC1fFHtjrk7oh6b+pOjahphzs64C1on13CIBD4FOzloeTTMxX3sDvmPDMuFhFyWPePxaRruw4MuXdO+I16HrZYmu32BazuXLBjrmlsOJ3UFBV0umTYDnfV5AFpK2P4cGud3KH5MMdfyM4F6vbuOJIxTvdlVUaM7MIlWRXyBfQRkfix6h5RMZgtA==
Received: from SJ0PR12MB8113.namprd12.prod.outlook.com (2603:10b6:a03:4e0::20)
 by CH1PR12MB9621.namprd12.prod.outlook.com (2603:10b6:610:2b2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 17:20:09 +0000
Received: from SJ0PR12MB8113.namprd12.prod.outlook.com
 ([fe80::fe5b:a71d:fca1:fadb]) by SJ0PR12MB8113.namprd12.prod.outlook.com
 ([fe80::fe5b:a71d:fca1:fadb%4]) with mapi id 15.21.0382.012; Tue, 8 Sep 2026
 17:20:09 +0000
From: David Thompson <davthompson@nvidia.com>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, Shravan Ramani
	<shravankr@nvidia.com>, Borislav Petkov <bp@alien8.de>, Tony Luck
	<tony.luck@intel.com>, Zhao Qunqin <zhaoqunqin@loongson.cn>
CC: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] edac: use named initializers for acpi_device_id
Thread-Topic: [PATCH] edac: use named initializers for acpi_device_id
Thread-Index: AQHdPHuQaHRRDgPQfUqkSbYfkovcHrbE7vKg
Date: Tue, 8 Sep 2026 17:20:09 +0000
Message-ID:
 <SJ0PR12MB8113D223E7A03AD66750023DC7B12@SJ0PR12MB8113.namprd12.prod.outlook.com>
References: <20260904-acpi-edac-v1-1-ef93d60bbda4@thegoodpenguin.co.uk>
In-Reply-To: <20260904-acpi-edac-v1-1-ef93d60bbda4@thegoodpenguin.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB8113:EE_|CH1PR12MB9621:EE_
x-ms-office365-filtering-correlation-id: 045fcfa0-19a4-4111-404e-08df0dcd6f4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|10067099003|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 AVxahAvM7m0AZ1D28EVxYqNuu2+OQ4phkdTaNnlzW2PEURR8dY/7PpVUQL1uYhYVKCs36CS9RoHIQODiSlFrzf5UUr+qF/7Qkgtfa0p0pb2JOozQUgadxMn8OWMgH0eJSwLEj+tz2HGmj5lP6h7Hiiv+ImevjFNISYl/z3EGUbPs+aXjw6ANIWOmJiScKVbVFFCfrIyGqG035DsFYz4YCQD1rJoX98qJk4Y/Su3eIDGTQlm6G8RR3cq3DbObL6Awphi26V0pjYSYQfo3fl0L4me73759WwWzhowrp2gLykkpaEZX7ZqfGe9oM7DK/13FGSL2qhtbm30oJXI4vSvVriPTaypVNMfy7l7MZJJLC/ewKpUZ4WceHC+hPkYqc+xS7oOzYadcvRZqZ9m5m53vhPdK+0OnqnWPM8n6ZzXtVwIH+xtBOfz4Ut/UTP6RmlKQwaMO2EAdFVWRFX6iIF86fev7oGbNnWuIYjECGy22hGKv9zcT7n1MwpIMrpI7Sqw/6mnNzhEx8PSYEp2nGk87vE3grmzdFtll2Q1LpYODjTqpItUsifZP9PwPhcXtGCWxbfnWYKTJS1egCGsr0GExj7/JjS9ooHsUaYby9FTlw43InufmPpn0QjiKsdu2kU6WS5z9AJrlCkhRGXK5FFgh1lTAsXXMo+raBPgUWI7a+ktg1d4/9AKfeuOP0Lhvt1t/xW/RwGJl4ZvvBn3hAa6RoMJh7v27TdJrGApnTWNFx8U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB8113.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bVNvbE44OFF5MG1Bc0d0U3hudGZLODBrNzdGakJBTUhmeFBPQ1V3RjFtOHVI?=
 =?utf-8?B?clM3YWhoejJ6SzFNYWR2RytCdHBOQm1uNkE4dUxvaHVWMnZWSVBqdFlCZjRs?=
 =?utf-8?B?c2hnNTNpWWs1Z1pvTUtnZE1KRnBWQ1d5SFBNYXFuUHBBOXJFdjJCL1Juakx2?=
 =?utf-8?B?ajh4ZUNQVm5KUE5NeEVHVmhTR1d4MzcyUnJKaTg2bnpTSGt3aUlsakJCZzNr?=
 =?utf-8?B?eWZ4SGpqMnoyOW5oTmJHbWVadEdIUFl3VmFCUEJ6dzNSTm9zaVFScTIvcHNs?=
 =?utf-8?B?WkFXeUFmczViSDBtZ1VGU2ZneDRYa1FTY3VvS0dldm9Pd3ZVU0Z1dzl6MDNF?=
 =?utf-8?B?TENlVHZHRWQ0Q2Y0V2Q1QTJpYnUvT0J4UVJJYWNCN3BzTWt2VjR1OUN6SUZD?=
 =?utf-8?B?MFNkUHhFN1cxckZncUhyQUdwditFU2o0ZGY2RFpFV3ZnSnNLZHd1bi9EaklK?=
 =?utf-8?B?bFUyY0FEOEVBTHNNYUNSSjFZTmhmb29nSVNnQ3FqQmo3WExrNzV2d0V2WFVr?=
 =?utf-8?B?TTE0RGdxd1lDN00yUzhlaWtFYzNOQk9tV0hDVkcxZGl3dko4Tk9seEFPOXN0?=
 =?utf-8?B?SVBLN0xSSExFR0RhVTYvcFhXWFZubEhPeTVneEVPeFJwK3c3RU1SU2RYWmFB?=
 =?utf-8?B?NmFhZlhKWk1UOGtqZFNPUjMzaEwwSWoxNWlqbHNHdUFTbFZDZVFDWCtyVmsr?=
 =?utf-8?B?UHNwclhkQ0FCVkhLNTNVemNsM2pwcG9MTGVLVkNUcCtCVUpFRmIxSVFkYXo2?=
 =?utf-8?B?K3EwTVFxR1N3S2s1V0FNTEVOYXE3SkFvc0dDRXJQMC9oTEhkMHRVTDYzK3Iz?=
 =?utf-8?B?VHhiL2JtKysxeG1Tb1BhVDc3SE0yODg3MFBKeENWcm5FUzZvRE84d1BoaEtj?=
 =?utf-8?B?SnJHQzgwY09nTlBBa3F6QTJqakNMYldSVnlDYlpSKzBwbDRkMWRFYzlxSXN3?=
 =?utf-8?B?KzdZRTJ1aWJhNnFsSW1NZVczMGVXR080NkpKdTBudjZoek9hcnF2ZTEzYTFk?=
 =?utf-8?B?d054WlNFczZvV3E3MHBtVks1MEdVZkduMnQ3ZklGZlVvdWVZelQ4aTZnZUE3?=
 =?utf-8?B?WjgrdUNMUExaS1NacmJqbWJMM21WSFJwcnRreWgwY2czNnVqWWJCcjdLeG0r?=
 =?utf-8?B?WVlTWTMwOGtSUXZBT1YyOXdZQlRzMUhnbGhyQm1uVEd2VjUzdUZzaXJoOXlJ?=
 =?utf-8?B?MjBEd3U2U25wK1hBME5lSlZRTXhldmhPTWxtYWVaU085cmV1SDZmdWc4WGgw?=
 =?utf-8?B?N2tzbWV3VDVNNHJYVXQxeFJVTUtkNWZmMWxjWGwvUERESDJESmpIbE1rNUth?=
 =?utf-8?B?UHltcVoyc1ZHc3N6NGxqZmtEUzBkSkYvbzBUdGJRZHJFdnJZdEVRenl0R1FE?=
 =?utf-8?B?d3FLbnFVSGVNZlV1U0dncDhVNHBodEg0OGVlek5jbWVodmdQTFVKU3BiVVVw?=
 =?utf-8?B?RG5lSFlDUEVCK2VGYmRRSWtnTDNxTk1YOGhjREdCVWo1aDJlSDJVTXNqWkp4?=
 =?utf-8?B?eWdycmxHNjJqUFNNR0llK00rOTlKdWYwMHgzYjl0bTVSUmZMMkFFWUZxRk5k?=
 =?utf-8?B?dDR5MGF3KzEydElHa1A5QjB3RG1hT2xmOHBSME9XOEZST2RGTjE2VjlPVlRa?=
 =?utf-8?B?eHMzZEtwNWQ2NkdyR3FIRnF5N05lMlJWRTZObW14amVGcDZIZzhVcXhUNlpP?=
 =?utf-8?B?bklGbUVyNkxqcHorQm1ZMHNGNUN3WFZPOVA5V01zVFFqWTRWV1hDeSt6c1Rw?=
 =?utf-8?B?RDBTODJ6YWlucCtxZnRNYVB0Y2N2ckxVQURTWWZZVFdiTVIvdVZRK3ZaSEdI?=
 =?utf-8?B?eW9TZmVVdXl5ajJLTXVkZXQxMkh1bU9JSG1XZ3VhY1paUWlFcWdjRHkxZEo2?=
 =?utf-8?B?QTdkanRSbzJxQlI5U1dZNGdJYlVhaTJtbXI1dWptYUhzRkdyZG9sVzgxWFhG?=
 =?utf-8?B?YUxIaTBWbzBNR0c2ZUtlaGJwOTJCczlkT3p4STdCRnRTMTFLWW1Dc3hGRmxp?=
 =?utf-8?B?akNlOWlJT0t1YmxRbk9OOFZGcmRSM0hOVEsvYVQxOS8zZnIrN3pTOHF0Vm1a?=
 =?utf-8?B?NVoxaVpNL3RxcGFzYXdmY3NPY3cwbEpWOGZlUmxxdU5GMVZoZ2pMRzIwNG1x?=
 =?utf-8?B?cXZhKzVGSll3eE15WE9EUVJiKzZNS3o1L1dtb0d0cEx4QUUrcEY3OFZzZjRy?=
 =?utf-8?B?RjlPZSswdm03aWFQTG1oSmFyWW1EMXozbVNZSXd5UE9Gd1NhZW11ekh1N0VB?=
 =?utf-8?B?dDlOMkpkSnVCZm9qSGpTUW11L0YwaUlUZmZIZ2NNdTVwV1NpOTkxWUpXRDBM?=
 =?utf-8?B?RDBFaWRCdXhNT2RiS3o4VnByS1RKZ05yRFVhY29LNmpxWGZ2b0NVdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB8113.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 045fcfa0-19a4-4111-404e-08df0dcd6f4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 17:20:09.6667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vCLjcrysf1Hz7ZHv08Zf/TgvkM5Ok96Vh6Q7fK/gwlk+AC6NOgnAjfIIojs7+9D0Ta7TCOsDdS/OqTayW4edZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9621

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXdlbCBaYWxld3NraSA8cHph
bGV3c2tpQHRoZWdvb2RwZW5ndWluLmNvLnVrPg0KPiBTZW50OiBGcmlkYXksIFNlcHRlbWJlciA0
LCAyMDI2IDEwOjQyIEFNDQo+IFRvOiBTaHJhdmFuIFJhbWFuaSA8c2hyYXZhbmtyQG52aWRpYS5j
b20+OyBEYXZpZCBUaG9tcHNvbg0KPiA8ZGF2dGhvbXBzb25AbnZpZGlhLmNvbT47IEJvcmlzbGF2
IFBldGtvdiA8YnBAYWxpZW44LmRlPjsgVG9ueSBMdWNrDQo+IDx0b255Lmx1Y2tAaW50ZWwuY29t
PjsgWmhhbyBRdW5xaW4gPHpoYW9xdW5xaW5AbG9vbmdzb24uY24+DQo+IENjOiBsaW51eC1lZGFj
QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgUGF3ZWwgWmFs
ZXdza2kNCj4gPHB6YWxld3NraUB0aGVnb29kcGVuZ3Vpbi5jby51az4NCj4gU3ViamVjdDogW1BB
VENIXSBlZGFjOiB1c2UgbmFtZWQgaW5pdGlhbGl6ZXJzIGZvciBhY3BpX2RldmljZV9pZA0KPiAN
Cj4gVXNlIGEgbmFtZWQgaW5pdGlhbGl6ZXIgZm9yIHRoZSBhY3BpX2RldmljZV9pZCBmaWVsZHMg
d2hpY2ggbWFrZXMgdGhlIGNvZGUNCj4gbW9yZSByZWFkYWJsZSBhbmQgY29uc2lzdGVudCB3aXRo
IGhvdyBsaXN0cyBhcmUgaW5pdGlhbGl6ZWQgaW4gdGhlIHJlc3Qgb2YgdGhlDQo+IGtlcm5lbCBj
b2RlIGJhc2UuIEFsc28gZHJvcCBleHBsaWNpdGx5IHNldHRpbmcgZmllbGRzIHRvIDAgd2hlcmUg
aXQgaXMgcmVkdW5kYW50Lg0KPiANCj4gV2hpbGUgd2UgYXJlIGF0IGl0IC0gdW5pZnkgdGhlIGxp
c3QgdGVybWluYXRvciB0byBoYXZlIGEgc2luZ2xlIHNwYWNlIGJldHdlZW4gdGhlDQo+IGJyYWNr
ZXRzIGFuZCBubyB0cmFpbGluZyBjb21tYS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBhd2VsIFph
bGV3c2tpIDxwemFsZXdza2lAdGhlZ29vZHBlbmd1aW4uY28udWs+DQo+IC0tLQ0KDQpSZXZpZXdl
ZC1ieTogRGF2aWQgVGhvbXBzb24gPGRhdnRob21wc29uQG52aWRpYS5jb20+DQoNCg==
