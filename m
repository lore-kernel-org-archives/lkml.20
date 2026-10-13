Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022098.outbound.protection.outlook.com [52.101.126.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085CA3BB12A;
	Tue, 13 Oct 2026 05:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791869571; cv=fail; b=VbNFodjG1QlIQ1PvuDGtwSOLek0i+91FPwtO9Rk8T3Az+GBslbMFNtmCHqBQx5lPPwc+rbDnXCwO168BMzhQ/TGcFK8H0QaITlaFztqCcUEBMjVoin6fRo9IcIqhe2in8ew5qOtrAgZ1d5uWs9Me4XH2MIiG9o0bRnzZOmaGoDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791869571; c=relaxed/simple;
	bh=igItYK4II0G13bwY+AamOS4O0Vn6P2rLyL93Zhzwzrg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Xv0SSN6cUWZNyG7LyrETtBlmZFS7K4sDX3VEdsRyNm8DsumSFCtYE+nFBt4YlPZOmB0Ncf1fIttlGuOmZrIN6whanWYxmVfO+TJi896JfmwH5giF5pj1bhqxwsTGVTbE2d9XFHQK1sKBUxSh25rRWHV1U7+GDeYNJ99CqA4Et9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=Kc3i2HND; arc=fail smtp.client-ip=52.101.126.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="Kc3i2HND"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oda/I5xrdOtTNvEQQzqqnlqQcMWeL+CNVnYi7HrdK/5tYSC9iP2PyHL3koDYYWVFjddW7wuYAidsKCAkMt2Jv8jMQAdcY3XODid2LTIWj1jnNs632WclN2/5suIcSUHvEPztQuObL5xM/iWkKmZqaBwOzBIYd/FtXTUa+9yn31fQppTrTlhoMOHdjxpbIqgVVZvAebCjyzaNI5Rd1I1hcAFvfHRa8EWFBrWrRse1XE5RXWCKzujT/s3Up2onJ/b6KQrmYrOAO5ZYvzsx0Uqbs82ZL4hpkC6t/vdqFfNeVNfBceqbvqHQWh5kMqmYI0nxt6idklWz8ZCnbqBmf7LexQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igItYK4II0G13bwY+AamOS4O0Vn6P2rLyL93Zhzwzrg=;
 b=oVx8pEp3WNjWiNoHuh1cRu5hTo9QQz9nx+L/feY5tIkv/OqxCm9KCmjBJVAEH00iIyHyjOID3TOnxSo2LNLbYOOgtcZJ7UNDuJ2Pl8w8hgYp2FeWSpMDLnAEZLaixOE8pZ7+TldM8gf9Oze9enB2QuMFI/d/+eW/PyJN22ncKBxwFgDUm+JjIDOc+v2GH/a+JXZIfN76yNC8xhfX4E2Jdp3Nyk9TUNk8eFHVjZOgC5Ie8izVo8tph/7Lfzs5IkWCICVeNMSi0jVdt+HOGSHHvwJO6Myf8rXesp/VQ3u37P7CxqQOyqFP9kEdyea2cEUq7ODHQxMNenLEXGTOA2Vq7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igItYK4II0G13bwY+AamOS4O0Vn6P2rLyL93Zhzwzrg=;
 b=Kc3i2HNDH2A/MtqER14n2gM1pblvznkhxd2kQuU7Qb11r8Y4Ji+dXX1q2zjXGTdmIIYWg61gleRHQIwhCeNLWiaWIeVZflZGVyXo3xhISe7s1VqTgauHVv0bvWFFmojjI1eymGD71qgSnCnVQm1PIUhVJPraFVRz1Kf0VfLO22b/V6ZFWtVi5TLWqfA3BqFluAUXOyq9llghH9Fe6MfkqxmQd2IPvVeebeO4lSOJG0WYnMEpfAR6Ht/ZKovNTB18UhYeIf7mjKbMXjlRWEHcQ9IaM2zUH/b+ju1lBCEVKiGBm5TTZVfva+0QWQ6zgZoyo4ZJwvr8uzGlbLTZsfW70Q==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by SE3PR06MB9263.apcprd06.prod.outlook.com (2603:1096:101:325::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 05:32:47 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::f53d:547a:8c11:fc6c]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::f53d:547a:8c11:fc6c%3]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 05:32:47 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@codeconstruct.com.au>, Manivannan Sadhasivam
	<mani@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject:
 =?big5?B?pl7C0DogW1BBVENIIDAvM10gcGh5OiBhc3BlZWQ6IEFkZCBBU1BFRUQgUENJZSBQ?=
 =?big5?Q?HY_support?=
Thread-Topic: [PATCH 0/3] phy: aspeed: Add ASPEED PCIe PHY support
Thread-Index: AQHdVxgnr7aFySEh9EaR5GOQ5ow9pLb1BNkAgAXz0aA=
Date: Tue, 13 Oct 2026 05:32:47 +0000
Message-ID:
 <SEYPR06MB5134FDEDBA70AD7A2E61A5CB9D9E2@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20261008-aspeed_pcie_phy-v1-0-96764937aef0@aspeedtech.com>
 <20261009-vociferous-puma-of-amplitude-1c4dde@quoll>
In-Reply-To: <20261009-vociferous-puma-of-amplitude-1c4dde@quoll>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|SE3PR06MB9263:EE_
x-ms-office365-filtering-correlation-id: c243654a-b44a-490f-6e6a-08df28eb6a03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|7416014|366016|1800799024|38070700021|56012099006|4143699003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 QuzgrEycdTG+ZoYBAaeGt3GzT79L4daT2u1URVKfbX5tUqJafwQnKF5IrAExOyGwxoRcU2TepSeyliKHllbXxBo5JPohhMfCI2unNeEVW2Elp/oXwQhDpeborWtCSrPsGoSwGoFW5UecezhdEnJjusPEDSSj8CUXgMuIgJJP3Nv7Q4t73jRlD7XyAcTNZwPkq8W7qw04/EC0TxyRNmEFKe4ltQRIWjOJyeRgMBmiwoG+8WBunJMXx+PnxfnZdtlZVHmSDrEMPBH6Aw6XNolkxtRbcT0VpPOGx82v6MTd95DomP2Fhcbp/nfOfv5SGpnyr1FSTEpv52xy3lITFk0TmJJYj7fDBG1qP2JFgbjXaD/umdOVmiYYjolPwTlxvU4z991/+2RFknENEIoXtev/CItZPDiNzREawV5RMdzpUKIpDsDGWnl05xpWU9SdumL/nrxAIC1qRCUYMgE/ssIN7G/irdrnFtYiTvGs871qHTsT0IyygZs1xDNTRBSU706TketmJisMzm8DXoSX3+JgfwOLT0tXr3fh0UmCHjtqG1l0xy4/f/otiGy+vD8fL6uuHwwgThXLtPKPouO0XLkWH/v2OfgmFPs3EleZy9ecvyFrp7P68LnLoNQ39TOJU8NeCvOMz5OY9fJk1ndWzRWsr0d9M/eXpxeVzM3gBsWbfH/55OsHq/qXfgjsaN4pjNlPcJozazQqpGf6d1VGpFuaT6kq77XoPQcDOxc1nwNF3hY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(366016)(1800799024)(38070700021)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?big5?B?ckRwdGFrVktDRFBVY0Vva2xGQ1d6bkljQWF0dlJyeTUxWTZnS1ZLVjNjSnExZnZu?=
 =?big5?B?bjkrdVFPL1NTd1ZJVGg2SWV0MURoeVZXQktiQWtVQTFsc0JZSTIyK2F4ZzF3U2ha?=
 =?big5?B?Q2VYUEttOFkrQkpDdEd3b04vdkZkMGFNVWZJdStMbDlnLzE4WmhRVVR0U3UvQkgx?=
 =?big5?B?QU1PYVJCS1V6TXRGbXVob2NhYkFmODRMSXJOMlRTSXFpVTBvZythRTREZVlQbXdn?=
 =?big5?B?bktqM1M1ckthcUdEdjNiTDU0KytsYkU0ZnpRYkFPUUd4UEFJWWt2akl4cFo0Ykhr?=
 =?big5?B?dTF5KzNxMEF4aHMyK2I5RytWcXNwaEFaY3pBQzYrZDNwTUI3TUprc1ZtUXBuY2pz?=
 =?big5?B?bnJvSnpIS3FIaTRBdEc0MU8wWnRwR0ZES3ZNdXBRMWcyQktSUTM3VWlsSU5HMzBY?=
 =?big5?B?N1IxTEl4MnpvZHM0cjI2N2l3VUk3cWhHY0puaWUwTzhJbHY5L0YzaS90eDBiSDRT?=
 =?big5?B?Nkp1U3QyVnhOa055ai9QU2ZtTE5heXEvZnpLeEhBS3U0a0YxRVNzNEt1S1g4YlRU?=
 =?big5?B?TmE5cktLYmpsblQyRGtqaisxOWRiMGV6MllvM3diSmxMR0tNTjZWZi9tZ0d4VzNE?=
 =?big5?B?d1I5M3RpMWdXeTBNMHZKMUxHWUk4cGdycG5VTmd4WlZKZVhuOU5SWXhUTkRNdXo5?=
 =?big5?B?QnZvZUNyc0dQNmVZeVJYcE94Sml4cE55Q252aUF1ZHgrSEJ1a25EVGcyVUtwc2Ns?=
 =?big5?B?QUFsaXU2UkdCa0FQSUlBd0NCT2JDdmdaa0lKNmpvcG83eFNqMGJidk40WUQxL2VX?=
 =?big5?B?bW9QMUpadFNKNHFMeDlWWkxEOFJxbzQrZHlRM1BRemQ0UEtUTzVWUEgwN3E3Z0Ni?=
 =?big5?B?Zjltb2RtMFkzdDg4ZWJMbTgrREcwdWd0TWlhTHNNS2d5MjJoNFhnZm9tdWV6OUcx?=
 =?big5?B?VHZCbWt5MmpqenNvb1lOWkpQMUdtaW9xTWJpZWtkazZrRDE2c1ZEYmJHVDdyKzl3?=
 =?big5?B?NmJGZ1ZObkNvejJSa3F6c1NNRmlLUHMrZFlFdDZndlpJN0s5cUg2S29Ca043Wmlv?=
 =?big5?B?VjhxRkFWanVKNkxpZ2tBSXN6NWYva2FzbG5YV0xxakJMM3UweUNpeS9GQ3pPcS9K?=
 =?big5?B?RitQTkk5SzdrK0xCbEw1VlpjWEg5Yis5MmxrTDBkQk1jd2dUd0VUMXh4L0xGc2ZN?=
 =?big5?B?WW9jaHpNSmt0Nk82MWNRUUZqVFVLS1Y1WFA2N1I4b3BlZ2EydXV2UDA4YW5pamJV?=
 =?big5?B?TXVTRTljMmN4eEs2Y09SdXE4SUNwalFIUDlycm9CNEZWZFVtalZhb2MxaExobHMx?=
 =?big5?B?aUNVcFoxZ3NSVTNTWUY1TkRta1FLcTVGZHJZOW5vRko1cmdTaUpiNkRxWnBGeGVl?=
 =?big5?B?K2d4bVFTQVVqandNN2VNVnNlM2RZblAyOGJ2YlFJWG96bEtLVGx0RFZscFNROXZm?=
 =?big5?B?eDVEN2Q0bWpqOVNWcElKc1BleEZnYkoxSG51K0lyQnhPQnd1VE9MYjJJV0M0Uitz?=
 =?big5?B?S2J4UjllS0hXb21wSG1pL0ZTQ24yQU01N1RHT3FBNFNBNnNQVEVCMzBuOVlHMGxR?=
 =?big5?B?cGJ2UDFQUXVkZDkyVXg0NmgyWTg4TVV5c0JkeDE2N3k4eG5MOUxkeW1LaDBZTWpT?=
 =?big5?B?b29Fbzk1ZDRzdHl3NFhrelBOM3h5T3hzbnRjeGJtUmNXMEZScTFvbVpyZGpmNnNZ?=
 =?big5?B?RmY0U0pqUWkrTE8zZ2tKQm9rLzRxL0VYY05XSG13Q0xBSmJ2a2NoNmtTU1l2R2FH?=
 =?big5?B?M1ZXYlYyYXpaRmlwaGR0YlE3Y1FFTTZRMTNsZk5CWStaaHhTanN3WS9YR1haZElU?=
 =?big5?B?MW9laWN6L01hWTFGQjZSSnJtOUdhMU5Jb0hhY2c4c1hLbXptUGhyTTJCZ3NFUVB4?=
 =?big5?B?TTloWlNiWTZMdHlCZUJPWCttSHN1cU5BWmRtY1RydnNwTk9HRkJRQkxma2g2OTdh?=
 =?big5?B?R1VXQlBKc2hmR2E0TmgwdTBGeEhVSlhxUFkzQzdDOS9nY2h2eGF5QVNXaHN3NjZT?=
 =?big5?B?eEJhdTZEOW9QTVJ3QUQ3cDAxbDUwT3RJZHd4bi9NUzJ5R3hzNVlqcTlnckNHa0hj?=
 =?big5?B?dmxkRjcrV05qUkI4bnJQcFVobkpDZ0FncGdWN003OWRUWDBaeXBmT2JSZ0k0Rm43?=
 =?big5?B?Q2N1ZG16eVJrNmY5ZWNMMGxTTUxqU09xa3ZqZ3pxaFBkMEFGTHA1TDRQSnlsaVIr?=
 =?big5?B?VDNFaWpWRTlkMEhyVUlVTzJlbEVGcW5QYkcrN1VtMTRhQlI0T3FQK01EQUFsTzRy?=
 =?big5?B?RGhnU3lrbDNUVjk4UlN6OVR0bURWUT09?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5134.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c243654a-b44a-490f-6e6a-08df28eb6a03
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 05:32:47.0668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kkmf4DSgcS8ZctjcRw0BnKw/Psm1COmyaPTlMZVpkwdGhg23ELE2iI67vrv9GVuN84t3qb1w6qKQ/j+20MTDoSLXnzLiK7whb3V22wouBL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB9263

SGkgS3J6eXN6dG9mLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuDQoNCj4gPiBUaGUgZHJp
dmVyIHJlZ2lzdGVycyBhbiBBU1BFRUQgUENJZSBQSFkgcHJvdmlkZXIgdGhyb3VnaCB0aGUgZ2Vu
ZXJpYw0KPiA+IFBIWSBmcmFtZXdvcmsgYW5kIHByb2dyYW1zIHRoZSBTb0Mtc3BlY2lmaWMgUEVI
UiByZWdpc3RlcnMgZnJvbQ0KPiBzZXRfbW9kZSgpLg0KPiA+IEZvciBBU1QyNjAwIHRoaXMgc2Vs
ZWN0cyB0aGUgcm9vdCBjb21wbGV4IHBvcnQgdHlwZS4gRm9yIEFTVDI3MDAgdGhpcw0KPiA+IGFs
c28gY29uZmlndXJlcyB0aGUgcG9zdGVkL2NvbXBsZXRpb24gY3JlZGl0IHZhbHVlcywgbG9jYWwg
c2NhbGluZywNCj4gPiBkZXZpY2UgdHlwZSwgaW50ZXJuYWwgcmVzZXQgc2VsZWN0aW9uLCBhbmQg
ZG93bnN0cmVhbSBwb3J0IHNldHRpbmcNCj4gPiBuZWVkZWQgYnkgdGhlIGNvbnRyb2xsZXIuDQo+
ID4NCj4gPiBUaGlzIHNlcmllcyBhbHNvIGFkZHMgdGhlIGRldmljZXRyZWUgYmluZGluZyBmb3Ig
dGhlIFBIWSBwcm92aWRlciBhbmQNCj4gPiBhIE1BSU5UQUlORVJTIGVudHJ5IGZvciB0aGUgQVNQ
RUVEIFBDSWUgUEhZIGRyaXZlci4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEphY2t5IENob3Ug
PGphY2t5X2Nob3VAYXNwZWVkdGVjaC5jb20+DQo+ID4gLS0tDQo+ID4gSmFja3kgQ2hvdSAoMyk6
DQo+ID4gICAgICAgZHQtYmluZGluZ3M6IHBoeTogYXNwZWVkOiBBZGQgQVNQRUVEIFBDSWUgUEhZ
DQo+ID4gICAgICAgcGh5OiBhc3BlZWQ6IEFkZCBBU1BFRUQgUENJZSBQSFkgZHJpdmVyDQo+ID4g
ICAgICAgTUFJTlRBSU5FUlM6IEFkZCBBU1BFRUQgUENJZSBQSFkgZHJpdmVyDQo+IA0KPiBBbmQg
Y2hhbmdlbG9nIHBsdXMgdmVyc2lvbmluZyBhcmUgY29tcGxldGVseSBtaXNzaW5nLg0KPiANCj4g
UGVvcGxlIHNvbWV0aW1lcyB3b25kZXIgd2h5IG1haW50YWluZXJzIGFyZSBncnVtcHkuIEVhc3kg
YW5zd2VyOiB5b3UgZG8NCj4gbm90IHJlc3BlY3QgdGhlaXIgdGltZS4NCj4gDQoNCkknbSBzb3Jy
eSBmb3Igb21pdHRpbmcgdGhlIHZlcnNpb24gbnVtYmVyIGFuZCBjaGFuZ2Vsb2cgZnJvbSB0aGlz
IHN1Ym1pc3Npb24gYW5kIA0KZm9yIHdhc3RpbmcgeW91ciB0aW1lLg0KSSBhcHByZWNpYXRlIHRo
ZSB0aW1lIGFuZCBlZmZvcnQgeW91IGFuZCB0aGUgb3RoZXIgcmV2aWV3ZXJzIHB1dCBpbnRvIHJl
dmlld2luZyANCnBhdGNoZXMgYW5kIG1haW50YWluaW5nIHRoZSBrZXJuZWwuDQpJJ2xsIHN0b3Ag
dXNpbmcgdGhpcyB0aHJlYWQgYW5kIHJlc2VuZCB0aGUgc2VyaWVzIGFzIHYxMCwgYmFzZWQgb24g
dGhlIHByZXZpb3VzIHY5LCANCndpdGggcHJvcGVyIHZlcnNpb25pbmcgYW5kIGEgY2hhbmdlbG9n
IGRlc2NyaWJpbmcgdGhlIGNoYW5nZXMgc2luY2Ugdjkudg0KDQpUaGFua3MsDQpKYWNreQ0KDQo=
