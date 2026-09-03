Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020119.outbound.protection.outlook.com [52.101.84.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6E64DA52E;
	Thu,  3 Sep 2026 15:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449347; cv=fail; b=Sxfl+UN905GjS0arkdbdwJLn59SCC6rb+D7skjh0LIYvM2Uo+anq5eRsDv+tx06XMpk3NgRDZogrLI6kVlFeYNc6pDgno5xOUDqe2mnqNSE6OHX1/WeeJShIdn/wnponI1/+vYGPX3uGL846mtE1MrFkoYXy3OBOIl/P1kWFJm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449347; c=relaxed/simple;
	bh=35GjeMFKgqfijokTyq3bPxSfGZvT1Onan3YiMXewUcM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pYkMDKGFAq5PyRO977yLGiz0n5D0nwsTGcyrHZHrNkDXguOVyz6ajvQq2xNFQzLtGvAAi11OJmj4bykGIIMgscY0IU1omVkMl49AbHF7gIrdRo9dVerMSwCW2riSjbuYfjfrxaKNwQXBnqPNr8VE1M2UJTNkEJvVLUimyW6eRaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.com; spf=pass smtp.mailfrom=phytec.com; dkim=pass (2048-bit key) header.d=phytec.com header.i=@phytec.com header.b=tZKLGomj; arc=fail smtp.client-ip=52.101.84.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.com header.i=@phytec.com header.b="tZKLGomj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvMA/xZmhH+xKjAczKU8I5QARURU6WHj88VMdNb4lrHhFAZ9ZNZ8oin4L8lHg3aEBRV4skFy/48Kmc7SkCsZuWS1KIXeH/L0Pinne13GjsZ7qnYCwgzmKsHxrEGgQTDyN8jO8qhAhDggyDLHV/86IPudSDJ3CpJgDuzZGcoGaP7udwW6nQoxeJJUue4gn0lq93Ajworm22cbCzXb5hOUjvGj1VgoUnLy8i0n0u45Ya/Bwm7n8a+OKdI1t9Kf+1QbHWuC0Zo6hbm3/8AekzgjRDFc1r8IszXD6r182RnBSH/VnH1ZxQVjJICmJt2bkAQ0ZK0T/AFUfc7eCOvhKE3shw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35GjeMFKgqfijokTyq3bPxSfGZvT1Onan3YiMXewUcM=;
 b=ZnkwZs6BoLCuxm809Xww3ngR84BT5OeYAZJ9US1yNCvmomRVit2PO/Uny2JX4YWFeKiadJnDV88DM76h4wNmOxyKb341r8xzv2JFuOnc6/utXLJclKW+IbLXXKvnZVENSa9vrkDZ+t09SNIu+brS2Raylx/ST8uBYN5fwqE+YZneHrUxESjwYYu3WwnkWqcVnjAkiEVnSIl0wV1yBDXxTBTI5nPtIFWRoUM37Jh7EN9rJRlgE6wkY+aLdpb5xqVXq9sTwu1kGjJkZhFnx9BMkPCe812Ag35BYr2qaLlYnfM1FkM/ckhuIOMztelV2VftE8niPJylYo7uFZWU3yTPlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.com; dmarc=pass action=none header.from=phytec.com;
 dkim=pass header.d=phytec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35GjeMFKgqfijokTyq3bPxSfGZvT1Onan3YiMXewUcM=;
 b=tZKLGomjsSmCu/MGQICZXZlMVZeiMVO6pKya33YMTBjBj9Fs5MeYtYQZPoaxxmY6Ythj9+DET102EWq+tWzdGigqPT4ODeNd9SICHrl5U4N1UjA4Nnez3a9MCW9Azp68HZ+dy9tcUKbv69byIkvUgWWKdwbwdmmIYmwU8tIu4iDEX/c6L6lvt3WARD0l8QsZ4SRrSgoXKunZxGdI+ERr5EjaXVPP2rbqv2KGwscLl4R9SDOIzJ54ZYDJt2oTtMZiCmXYplTPSM30AxNFHD11Bw3gKgN3PFFPIqz86kpFC+0L2QK89D8jX+M6fEMrZlgZToWcYWbd+zZkQMQyaQiiWQ==
Received: from DU0P195MB1745.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:3b7::10)
 by DB9P195MB1395.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:327::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 15:29:01 +0000
Received: from DU0P195MB1745.EURP195.PROD.OUTLOOK.COM
 ([fe80::48f:7e75:c707:d440]) by DU0P195MB1745.EURP195.PROD.OUTLOOK.COM
 ([fe80::48f:7e75:c707:d440%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 15:29:01 +0000
From: Nathan Morrisson <nmorrisson@phytec.com>
To: "nm@ti.com" <nm@ti.com>
CC: "upstream@lists.phytec.de" <upstream@lists.phytec.de>, "afd@ti.com"
	<afd@ti.com>, "kristo@kernel.org" <kristo@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [Upstream] [PATCH v4 1/2] dt-bindings: arm: ti: Add bindings for
 PHYTEC AM67x based hardware
Thread-Topic: [Upstream] [PATCH v4 1/2] dt-bindings: arm: ti: Add bindings for
 PHYTEC AM67x based hardware
Thread-Index: AQHdCLZYgQ7onOgaZkKfc6F+K/l22ba7/f8AgAFAfwCAACH3AA==
Date: Thu, 3 Sep 2026 15:29:01 +0000
Message-ID: <e7805ab3055241d5886f03407a71e87f3a6a42e4.camel@phytec.com>
References: <20260630173131.3000303-1-nmorrisson@phytec.com>
	 <648d3128d73c6b27c1fa9a3fb1ff5b39156810e6.camel@phytec.com>
	 <20260903132726.us2vplb7fey77mqw@clarity>
In-Reply-To: <20260903132726.us2vplb7fey77mqw@clarity>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P195MB1745:EE_|DB9P195MB1395:EE_
x-ms-office365-filtering-correlation-id: aeeddd81-5335-49f9-214f-08df09d014ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|7416014|366016|38070700021|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 gHJnCfSJmvvRNSoFtiGYVtSkN5o6Vmrzhl3H3sXemwqohmnQFNkz0/ByHc8F2sPCdDC5GXqutao+s5E7iLcP1dLbd+rDI18PgjNoao/1tInV2t/IeGRAFy5fS0QFPTJGD7oA6cgamcZ+66e93CgBD3bCiAkOD9ev2l7vTqE/7TZqIqvnSiX3Yjufx16LuAVWmcWVu/bSbSRjhW8ru4DZ8B+hQ2BOzHFkCaQtiDUIOH4AKSjTk1I6FRqOJbjB/5Q+KH2+aBr8HtaqLvkvOnsmtrAwJoE4hKFKUkBf6m1/VT6gn7QQq5GmntZcY6K9yLzGLKek/7Wkh0Hh4qq6R+WgoyTMLPTPSanukRDLdRDvt4CvGeTTi+K13bZf0ZFkvOD8xBQ3VngzcaN84vtnkG43IPSyiQQ1jIjqWvS995j4vQFOBXrjYLhTxxOdf8T2Pymid7aiC6SbP1G4Xy5rs/ZSPiFCaY7yYosnmfiaKXFnyu2RhAfrQzad4ZQWQnjsAydlqpHNKpuzFO06Gyyp3Pf/dh8o5mz6DyEQrvE1z644a1oOUDU/ihOywvEzVVoN8GsZbJmAySiCDmw4PSmZcEXaQ89nv/ipy0w4iRvYfTK1JEpC6ciDQIe3pYoYIdACX7VzAMPa74QQXa68N9PaakJ+MYI7KKYwvp+wThq8GkNsFKR1EuQIfZAeWzaobJgg5ACZN/3iN6zZjNxWMexaaN0+WT8pX9lKifVCsivBvNFh2Qo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P195MB1745.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(7416014)(366016)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MWRsdmthRGJaeUdRbjluRVYwVmw2d0xKUGlUcmFuQy9zcnVnS0s2MlFFY21v?=
 =?utf-8?B?K0Y4KzlPSEUvYXc4NGwyekd2Mjl1UFNyUlFYZElna3BOazlQUG03MXFwdmFP?=
 =?utf-8?B?Q21RcXdKUnNTS0tvZkhRaTZRR0NyVm05UGFuTWt0eXZWQmU3bUxWZEFzQndn?=
 =?utf-8?B?OTcvdng0VTJoeUd6OXY3TjRRSCtTam82SENsK3MvRzlLSFVmcW1nZXV6Z1lF?=
 =?utf-8?B?ZUgrS2lJVkFPYXhOa0lLZDFiRTkwY0Q2RE9KdDdMK1lIbU40RkF2dklIU1B0?=
 =?utf-8?B?VEc1cUd3YTBLVmFTQWN6Ky8wV3JKVE5nSkJwQVFkZDd6cFlLdVhiNk9XSTNv?=
 =?utf-8?B?MWtxNzZmQVV4NThSNzV5ZEpVZmxUNFpXUkpRTmpzVlBLL3JrOTVPWE16dDNk?=
 =?utf-8?B?Wm14QjZzMTFvajdEeG5KUUduU3VkbUlqYmRpbS9NVUJHMlRDN3JkU1hrU0Zj?=
 =?utf-8?B?THE4SzFrRU9EZEJTaHhiTHFrUk9aY2FxY1RuTmtaWFpBWEk3SGVVWC9zb2ox?=
 =?utf-8?B?MHFLbEU0QkZvak9YQXVPQllSZmZmQWdzQlNNdHcwd1ZCSEY3QmZYOFVUek5J?=
 =?utf-8?B?S1lKeVlMK213eFI1U3hRNGFnenZ3UlhWcnN5SUN2VHFQdnRLZ2ZGVGlzSWtk?=
 =?utf-8?B?VWkzRDVXVXhxR0VSWHpuVU5oOHdMay9mZDFuQmpBOTMrTzk1SWM5cXNud3FO?=
 =?utf-8?B?N3FOTkNuM3kvMEZibmZiYVdsMDNVK3l6UGpEWUk5dXJYWnVJc2JuL25WeWE1?=
 =?utf-8?B?VDBhS2ZCM3lOb1VWWWlIQStNMEc3VmE2MTB5czd5MlVYSHBablpJZ2ltTkxp?=
 =?utf-8?B?RnNDT3pidEg4MVJBNWMyOEFsa3Vsc2dCSk9zcEkxbE1SSDUvMFc2eld6TGtR?=
 =?utf-8?B?VzZYWWpZTExzK1hnbWFpVWZNdmZHZExCZjltV2g3R3dwZFkrM1BhTzJGMWhP?=
 =?utf-8?B?QnZJVURhQU1XNmN2R0srSXJnTHJtQTI1MVRYQlI1bXk5ajVmRE0zOVZqTFNa?=
 =?utf-8?B?RVhrL0RXTkQ5dXlEb3Q3aEFRQXlzTWp6OVIxbFNTY01qM2xqeFNxV3BoTDlM?=
 =?utf-8?B?eHpDek1ySkVLQzVMV2dTbFppNXgza1NFby94UzAyOHNXckpmK2xNWjVQZ0dO?=
 =?utf-8?B?SmQ0eUExM2drSEltS1pkV2I5djBRMGFRUVM4M1Eyem9TSGkyMGdZamd4N0Jh?=
 =?utf-8?B?aEltTDZnQlJtTFNxQ1JwdEJLMTJtVGd3K0cvOFR0NENCTzNQeXJvTFcvM2dt?=
 =?utf-8?B?cUlkazJ5U1R0VFlCQzg0QVN1YmprOHh4RkNtYVdHTzJONUhuSk9XbkxZUVpy?=
 =?utf-8?B?N0pVaVp5NmVPdWswQ1hadVBxMTBlVUFvcHJxTTg1bEtpTTZxT1RYeUZ4K1Ju?=
 =?utf-8?B?SjBXRzRLSlBicGFJY3hWUE9iRXc1WmJwU1llZHRqSE81Y0RSdEhBMGp0bUU2?=
 =?utf-8?B?SEowT0ZBb1k0NjVxZDRFcTRMeEVsQU9SVWZmOUZsMThwMXk2cUtlZ1U3NUh6?=
 =?utf-8?B?NVlsdHIzS2tORGx2NURjOERTSlVQeDZFUGFpUHdNQXVFY204N0FoTEZka1J1?=
 =?utf-8?B?b2lJZzFtRkRDbFRxdXVvWUtKbm5jaitsMnNiUkJJZDBER1pQUDFpWGtkR3Ix?=
 =?utf-8?B?dS9XZCtZZmdPcmdXbGJsOHE0MERvZHMxcDZwTyt0Wmx1dCtLejdkaWx4MlJF?=
 =?utf-8?B?RHZMQ1loVEt5UFhQSGUvckwvNXk0N1U3bHZpN015YXQ1eVZUWlRSYWh2NlhH?=
 =?utf-8?B?OEpsRjJ3cTJZYzZKZEhYRzVsdlA3RVhnMUJRck9xdWVCWlo1Z3VVUjdsSDBL?=
 =?utf-8?B?YmZ5MkxYVm9jVkpkaDlLbmlud0hPVU1PRkhiL1lJdlplQkZ0NUR1ajRMaEts?=
 =?utf-8?B?bEV1RHFZd2ZDWjdmRmhKU1hzZUo5ejFGdWs2Ulozbi9wdFREUWxDMElTOU94?=
 =?utf-8?B?TDlRd3E4QXgyOCtJTm5xeGo0ZmMyZW4xKzlXMi93YVkxeXFzS2RZalNydG5K?=
 =?utf-8?B?VWdnb3YwWE1yRG1GeTZWSGQwaGlJNEovSVhvTjZDbTZ5TGYzcDI1NlNEa0xF?=
 =?utf-8?B?c3ozdXlXanEraCt0V1VIQ1lKUkxITUF1eVI1U2xCM0xueUVGZ2VTckxQNDA3?=
 =?utf-8?B?TFRNSjJzcGVkeTJlR05SbFpJK245RjBLRjRsYUdPZUNiYmNnNzBmeVZDVVZX?=
 =?utf-8?B?NmIxbEE1L3BZRUxrK2h0Y3lQUitOSHV1QWllczJ5bnRGQnZ2NllpMzZhc0oz?=
 =?utf-8?B?VWEvNUV2UXJJclVCTUxTM3RlMlN1SDlTWG83ellhdHdWYUd5SlJFRUZiNmxI?=
 =?utf-8?B?SFdFNEw3eUFHZ20rK2FlM2IvaUx3NnZBY0FlaWc5em1NSUEvU3JYdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA8A79A4A89C8B4F8FB293890420D535@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P195MB1745.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aeeddd81-5335-49f9-214f-08df09d014ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 15:29:01.6768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P7qrOkQr4bfhG3ccbWcUr4esd4Bi27F3t1FxBRQBNa7QhEr5td7BRk6NUQKjlfzV0ztWKGr9cuy6n2r7SRRzvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1395

T24gVGh1LCAyMDI2LTA5LTAzIGF0IDA4OjI3IC0wNTAwLCBOaXNoYW50aCBNZW5vbiB3cm90ZToN
Cj4gT24gMTg6MjAtMjAyNjA5MDIsIE5hdGhhbiBNb3JyaXNzb24gd3JvdGU6DQo+ID4gSGVsbG8s
DQo+ID4gSSBqdXN0IHdhbnRlZCB0byBjaGVjayBvbiB0aGUgc3RhdHVzIG9mIHRoZXNlIHBhdGNo
ZXMgYW5kIHNlZSBpZg0KPiA+IHRoZXJlDQo+ID4gaXMgYW55IGZ1cnRoZXIgYWN0aW9uIHJlcXVp
cmVkIGJ5IG1lLg0KPiANCj4gQ291bGQgeW91IHJlYmFzZSB0byA3LjMtcmMxID8gU29ycnkgdGhh
dCB0aGlzIG1pc3NlZCB0aGUgd2luZG93IGZvcg0KPiB3aGF0DQo+IGV2ZXIgcmVhc29uLg0KDQpO
byBwcm9ibGVtLCB3aWxsIGRvLg0KDQpSZWdhcmRzLA0KTmF0aGFuDQo+IA0KDQo=
