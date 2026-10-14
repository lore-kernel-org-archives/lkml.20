Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021131.outbound.protection.outlook.com [52.101.70.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC4E5208A6;
	Wed, 14 Oct 2026 13:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984574; cv=fail; b=T1T3hgWHtoY0SvLC7ECOwZW3sz4qi3C+HTMts1YYhFtvsDmNF6vMCxa0s88HQGoeIXLlErr5nEUdMg+vqII26T3A3xFaJhV72RP+iTDjgmmwBsa6O8zl6t2bR6BDpHWPXPtFk/vPILOZW7o/SV3KdXVaPz4/SeQzmehkswVrlyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984574; c=relaxed/simple;
	bh=qb1yLa4ia5yTMEs/NH51FZsswkWD8Kv9gLdxWu9Rxrc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dRX1ptQpMMs5FZgoAVjclkcrqRFeZjXjA6KWUw1Cs6/lxN9g/OmRyl0br53+D+F9gOuhWgagp1s7suIbQl9ysGTPcTcyOiap3nWtaZ7ncEmIaxdmIb9SONZCr/S8OX1CubQvQm98kwY/0slAUectYO3bIdsPET8wAg2GSCxoZz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com; spf=pass smtp.mailfrom=htecgroup.com; dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b=OFSyvKR/; arc=fail smtp.client-ip=52.101.70.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b="OFSyvKR/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpERLZIMCKJ+/8jrrGEiUCeOCiXBlI7gC7vg/IKROM1FMEJ8fW7aw3ubAXajiqX9wM1i0hPFAC/hv+ha0GPh13dhB22+jMwjwlBZCwtXB4V79YK6sJE8WWhonwm4ILe5dKqaaZxi+BEy3p8QcTEkTZEqnzscQAForOTcfaZ3yJgIBp+ayvrkoFcfBMLP2wSe7V9GnmUrDZsu0aEn0Suv2xezk5XlaeZVlyxQ8WKqhbJCvfCqUSLv1DWptVWsDOIsKdTrEbQSFYLZ8pF6u/BNK4kgNgGpJEruu/W7mZupiMNEYQhbKsEqFsEcZ5UZPp/sfo1fjUfHx2dVMrKwxl6iXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qb1yLa4ia5yTMEs/NH51FZsswkWD8Kv9gLdxWu9Rxrc=;
 b=BmLQUmfWy7vLZzW9yVFsSK3ByKQq7ERr6T8k7cKjuZb/s3cDGZo6NdNXyK5dDwno1ptNX4gf99aSDUd/SxarIRbw5WJlD5bodI1iXLZ04qRO2SFTowxsZmL3Sg6Y0VyQn1Lhlb8kPf5NlC3sHSDTbSxG8qZDhiW+k/p17nPP2FNJ8bMklN23iWJXlhjRkUDN1nem5YLSrSE9zB6LO+TwSnnsB7Iy1adcrvY1L9YgIAOehSApCIs+jXYlbDep15w5NIRoT2v35BpJliq3Nn9IAgb9SGpXFThYXNzP6z2/gxjneI7JRSwusAxDR3uRpsPp+gDWFfK4cMKwdHQUKaFiZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qb1yLa4ia5yTMEs/NH51FZsswkWD8Kv9gLdxWu9Rxrc=;
 b=OFSyvKR//Wl5WeYmrBhqHDL0jUB5j7qNqimbXBinsHqveDNIpaZZrCnyZdzflQ49eE4GRNyjvVvi7NRaWQiq43Z6+tvarT6wIQpJdHF5B/2osmWRJRc4TN73VSNXEQIoPhluy4LBWH7IQQkriIwLwNMoLtwEvXXEk95R/0ZQFhOd0wyDPhmg6BCk3GaMzVCxf+Ph/Dz1Gl0jvmIVSDNPv8YsUKKNSmQo4+pDAsSZdVNlyw5aiYZcyKHAopGLEyHHR34u8a/CXc0GTASM9qJ4dmtkvmBYynu5QIl/BXkbladCLtAL2L7UdeqAXrhWmM4DEuBL4H3Gv6Rrz2XssPEtEw==
Received: from MMZPR09MB547520.eurprd09.prod.outlook.com
 (2603:10a6:190:56::10) by VI2PR09MB8128.eurprd09.prod.outlook.com
 (2603:10a6:800:296::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 13:29:19 +0000
Received: from MMZPR09MB547520.eurprd09.prod.outlook.com
 ([fe80::5b5:f191:1ccc:f9ee]) by MMZPR09MB547520.eurprd09.prod.outlook.com
 ([fe80::5b5:f191:1ccc:f9ee%3]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 13:29:19 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "conor@kernel.org" <conor@kernel.org>
CC: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "anup@brainfault.org" <anup@brainfault.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "daniel.lezcano@kernel.org"
	<daniel.lezcano@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Djordje Todorovic
	<Djordje.Todorovic@htecgroup.com>, "inochiama@outlook.com"
	<inochiama@outlook.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"radu@rendec.net" <radu@rendec.net>, "robh@kernel.org" <robh@kernel.org>,
	"tglx@kernel.org" <tglx@kernel.org>, "vladimir.kondratiev@mobileye.com"
	<vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH 5/9] dt-bindings: interrupt-controller: Add MIPS P8700
 ACLINT MSWI
Thread-Topic: [PATCH 5/9] dt-bindings: interrupt-controller: Add MIPS P8700
 ACLINT MSWI
Thread-Index: AQHdRFDO0zg0iKiZzUGIz+QA9vUnLbbP86aAgC1DwIA=
Date: Wed, 14 Oct 2026 13:29:19 +0000
Message-ID: <80f45cb7-e569-4ccb-b01c-a3c0f94db9e9@htecgroup.com>
References: <20260915-pasty-ungodly-f034f7a3b9db@spud>
In-Reply-To: <20260915-pasty-ungodly-f034f7a3b9db@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MMZPR09MB547520:EE_|VI2PR09MB8128:EE_
x-ms-office365-filtering-correlation-id: b446dde7-1de9-4138-bb23-08df29f72700
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|261009223027099003|38070700021|56012099006|5023799004|11063799006|260925022911599003|260925021311599003|260925021911599003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 DrNUUzQCoZ680YgqsDFXKAyEDLmT2QD0BfLr5ioouSFR+D4texxXqyHC/3DMHrH3Egk854l2uORmEBWmj7zqM9Xz3JRG2lp68SwqbaPUrbLkouv2Fx9UnaNpEKTeNpKLdYoL1FBLbihMvqhehu6mwkEpe+hrty2oyJ2ucFz8h8r5Us0V2wF8GyBGdz+B8whIw8Mta9XbxNZAB5BVUDD/HP/u8MzrY0hkqrlJyOlmWN65TjWpVq2sGElyohJZchRUtac/dY6vQ487UDGQwc7NxC+NCVAMIgyW/8lCjuMLGY1cMH/JusYsu4iEKnH9oGJ4Ta5blHKlHWMNfJzGDzqo6sHz1uG7oqS55CgZE7hYUAtYKDuMpb3lilXLYaCFutsUMFgwWowYFhGyfc3pYbRPVtOpjWESDEeYgjAOnZlKcNKXew1NECELXEbSduSvPT5yffladyqqjQ726bG9H9WeSP88POCzIfjcSbPGiVAup3CHcXkOIP3uWa4J6nzN6aKlYfxzKB42VqRkJBv0rF1JqxWCYQMN12kqbav5aks6L9FKjpPjCCIu/wGshXkDzzh0sH9oZyfDV/BAJMNfFrTYYCmNnnl1HxakVUtAEItCax8fpqPyQrdOOaPDiSu8wKRHDYXZKPckl2Bwf8lzxa1ffBdlTwNHGbgiWopaRpYE9xfMYRrR44LBWdIJFDofrYcG7EEbgKkLKw25hfNogzPrf88XIzeiMmuTdBvajOxxNG0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR09MB547520.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(261009223027099003)(38070700021)(56012099006)(5023799004)(11063799006)(260925022911599003)(260925021311599003)(260925021911599003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V3U4bWNkNWdFWm9CZVRvUnViLzBaaElMalNaWFF5bGtMR25lNDNSUzVrMEts?=
 =?utf-8?B?ZFcyb0poTTlQTjloRFk2d0pxZFpyak9MOURoNVdPbVdOK1A0cUxGTlRBb0k1?=
 =?utf-8?B?SzU0RzR6bkJYZHErb3FwMmtNUnZ6cExGN0dwTVhMMzI4cm1zT0MzY2tKbWpQ?=
 =?utf-8?B?c2Q5aFg4cUdqK2kwRURIVWtTMTVjcWJvL09wR3REOWs4dmRJcENTMUc3c3RB?=
 =?utf-8?B?dWVXYTZpWS9zVEpQWENrckZwd05VRC8yYmpPemdOZmd5SjZXWTMvWHJid2tP?=
 =?utf-8?B?dCtvYmh2SXlrMldJNm1oVXVMT3FaTGJRWUllWmd4S0dzVkc3T0RPcGxIY0gv?=
 =?utf-8?B?U3Z2NkVBdHNDaDZxMGJLSHVrL0NzSXpkVTdTeVdqYkpBMUJJbXpWZEJJb29X?=
 =?utf-8?B?SUcrOTU2Z0NKS3RldFFxcmQyN0JFTUFyRlhRZG5xZ3RGblV4NFBQK1I0b2pE?=
 =?utf-8?B?MzZBUkFmUXZvVEVEcFdvTDBVbHdOcExnWDVhVVdJSDJyZzY4dE4vUGpqUXBK?=
 =?utf-8?B?UXJKaG5jQmhTdFExVFgzenFZVHg4UjlMc3JLZk1QekFVRWFYTEpHWlZXRXJu?=
 =?utf-8?B?T3UrNUdLdmZkK3BoYm9pQUg4V0tnZGJ3bUFUY1EwL0xZMlk1TVVWbytoNWtE?=
 =?utf-8?B?dy85RzN6dGhLRGVqUWJtb0pNcC9kbVZWSGUyYmFaZDZrMW1tZVlnNDBrV0J1?=
 =?utf-8?B?M1Evdm5Zd1N3bzFoY3Z0cG4wVTBVb2ZmdVhYeEo5dks4YmJHNCtiYk1xR3NJ?=
 =?utf-8?B?MWorOUJyNG9lRmlORDV2TXZCMUlzT1FscXJtdzRsbExrUmtRNW8zOStjZjN1?=
 =?utf-8?B?aHdGL2JGMVFaVTBoMitNOXNldWZTWjc3ZEludm9UczZqSnpUL1ZMeXJlS0g5?=
 =?utf-8?B?cDBMTTdoVDk5eFpWbG40SkJkWkYvVTZQallOaXpvdmQxbkZxQzZDNGpWaDdO?=
 =?utf-8?B?THAvcnJtV0hWa3RwQWhWRUNVYUN5WEpmenA1ZnROMkV2SW94RWhKRHdJL0VM?=
 =?utf-8?B?a2xHOUg1QjFpQUJzMUowOS9MOEY1akZ5TlozR1dtQVBIVnkxaDlQSDNVQmhM?=
 =?utf-8?B?UjYrdXlTejRDV01hbFJDY2ozNFFQUFdjNitCNE5jR1lEMFFYbk9iTnkrazc3?=
 =?utf-8?B?UG01cHBsN0JFWEpOTlRJMmhTbFl0U0VaQ0JtdUpWQThuUnlaMlNTOUNpanJ6?=
 =?utf-8?B?MlpBZElUZ1ZQbHFCaEthWmNYcCs5SWhVRkNZNlM1aHY4TDFsVEt4RjZDN093?=
 =?utf-8?B?NWticU5ubWdWdzBmVkdhdEo5bE54MjZYQlpEMFBneGY2WndhWklCTHZYYm1W?=
 =?utf-8?B?aHFSMWo4cEVMb1Y3SS9Rc2RGSEJ2ZG5VRGpvVzdFWTFQNW5wbmw1eFRhVW1P?=
 =?utf-8?B?aU85TENOb2pMYk9DVXQ1dWJXUEFrVEMyUE0yOE5xQlVXNjRKZXkyaWVLZG1t?=
 =?utf-8?B?SVpIOFZkb1M2QXVhYjIyMjZla0ZuUFY4aUV5RTdpOVo5eHlIVlY2RkRRREo3?=
 =?utf-8?B?ZnVTN1RGOUdtTm11M2FuTlIvVU1WblU0V1pzWndmUi9WbTQrSXJtMldGSGVp?=
 =?utf-8?B?WE5tY2hTSzhiZ0ExaklON2h2dHpMNnlvelVzOUVpQjNFU1ZMcDVFR0RQZVNH?=
 =?utf-8?B?enRJWjRyakc0eW5XK0lDMTJDNmNtaS9LdjJWak55Mmk1dWp1dmwzeGJzUGRi?=
 =?utf-8?B?VkVmTHA2Vm5xMVVGbzNOdDh1eWVkL0t2ZHRySkJuczNCdHE5cXg0SDVLd0Uv?=
 =?utf-8?B?VXgyRU1hTUtUZThzUitXWi96Z2F3NURjN0hGSjZkSG1sUGVYcmNCT0tNMmkv?=
 =?utf-8?B?QzJIQzc0NTIwczYrRHVvUkdKMFd0dmoySkFkRXlLQklSQnY3U1lXRU5WN2hS?=
 =?utf-8?B?ZXZ5RlVYYU1OOEJFZUIzVGZnbU8xUzI3TG90ejdyYkxmSzVTcm03bHFXOEcr?=
 =?utf-8?B?VnQ5QUl0ejJQRWZDd296dGNqcXQyLzN5RGpWaDA5d0ZmQTV4M3JnRDVXbmpz?=
 =?utf-8?B?akt1NjEwVWxiS2tHbnM2Vkh0ZUhZNWVaT3YwMW84ZCtjVmRneDFIa05idFVE?=
 =?utf-8?B?bjBCN28xQjFGbktVbFR0R0VkL0tmZGplb3FucnE0STFUSlBVTkY2WHovQno5?=
 =?utf-8?B?VzhmcExqUzZIM2w4RkZ2eTAwdFloT2ZqL003RDFPdUU1ZVdiQzEyYk9TT1lz?=
 =?utf-8?B?UHlscm0zUG5mdDMrQjZLVERsMmNBZXc4RG8zWFdldWNsMXZQbUtldFBDSEd2?=
 =?utf-8?B?VnEzMzU5NEVtUlR3azg1dkhNUTBtTXIySEs3LzNXNEtJdUtsQ3dJWDFBK213?=
 =?utf-8?B?bExaZ290c0VRbGtCamVjYkpKOWp4TGxmb3JQcWx2ZW1uLzBBN0RqRUw5c1ZC?=
 =?utf-8?Q?I4r5ATWm4raU41Bk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D786347D91FB44E971FF315D877CA23@eurprd09.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MMZPR09MB547520.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b446dde7-1de9-4138-bb23-08df29f72700
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 13:29:19.7533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 67vmAuACqmVfAXssCRHdTDCB/GSy+gePD0KPHLejC8BhIWzjERbMt5XFA2L6EwlYuzvBcIrS1lndq1rk5hG+uLdNMjbxaY0vHcZuhFz8LSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR09MB8128

SGnCoENvbm9yLA0KDQpPbiA5LzE1LzI2IDIwOjE1LCBDb25vciBEb29sZXkgd3JvdGU6DQo+IE9u
IE1vbiwgU2VwIDE0LCAyMDI2IGF0IDAzOjU1OjUzUE0gKzAyMDAsIEFsZWtzYSBQYXVub3ZpYyB2
aWEgQjQgUmVsYXkgd3JvdGU6DQo+PiBGcm9tOiBBbGVrc2EgUGF1bm92aWMgPGFsZWtzYS5wYXVu
b3ZpY0BodGVjZ3JvdXAuY29tPg0KPj4NCj4+IERvY3VtZW50IHRoZSBhY2xpbnQgbXN3aSBjb21w
YXRpYmxlIGZvciB0aGUgTUlQUyBQODcwMCBhbmQNCj4+IGludHJvZHVjZSB0aGUgJ3Jpc2N2LGhh
cnQtaW5kZXhlcycgcHJvcGVydHksDQo+PiB1c2VkIHRvIGFkZHJlc3MgdGhlIHNwYXJzZSBNSVBT
IFA4NzAwIGhhcnRzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFsZWtzYSBQYXVub3ZpYyA8YWxl
a3NhLnBhdW5vdmljQGh0ZWNncm91cC5jb20+DQo+PiAtLS0NCj4+ICAuLi4vdGhlYWQsYzkwMC1h
Y2xpbnQtbXN3aS55YW1sICAgICAgICAgICAgICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysr
KysrKysNCj4+ICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRy
b2xsZXIvdGhlYWQsYzkwMC1hY2xpbnQtbXN3aS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3RoZWFkLGM5MDAtYWNsaW50LW1zd2ku
eWFtbA0KPj4gaW5kZXggNjJmZDIyMGUxMjZlNjUwZTM4MDBkOGVlZTJhNzQ5ZmRiYmRlNjEwOC4u
NDdjMDQ5NDNlYjBjNzkzNDY3YWFhNTU3MDc3NjYwNWNhZTBlYWRmZCAxMDA2NDQNCj4+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci90
aGVhZCxjOTAwLWFjbGludC1tc3dpLnlhbWwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci90aGVhZCxjOTAwLWFjbGludC1tc3dp
LnlhbWwNCj4+IEBAIC0xNyw2ICsxNyw4IEBAIHByb3BlcnRpZXM6DQo+PiAgICAgICAgICAgICAg
ICAtIHNvcGhnbyxzZzIwNDItYWNsaW50LW1zd2kNCj4+ICAgICAgICAgICAgICAgIC0gc29waGdv
LHNnMjA0NC1hY2xpbnQtbXN3aQ0KPj4gICAgICAgICAgICAtIGNvbnN0OiB0aGVhZCxjOTAwLWFj
bGludC1tc3dpDQo+PiArICAgICAgLSBpdGVtczoNCj4+ICsgICAgICAgICAgLSBjb25zdDogZ2Ys
bWlwcy1wODcwMC1hY2xpbnQtbXN3aQ0KPj4gICAgICAgIC0gaXRlbXM6DQo+PiAgICAgICAgICAg
IC0gZW51bToNCj4+ICAgICAgICAgICAgICAgIC0gYW5sb2dpYyxkcjF2OTAtYWNsaW50LW1zd2kN
Cj4+IEBAIC0yOSw2ICszMSwxNCBAQCBwcm9wZXJ0aWVzOg0KPj4gICAgICBtaW5JdGVtczogMQ0K
Pj4gICAgICBtYXhJdGVtczogNDA5NQ0KPj4gIA0KPj4gKyAgcmlzY3YsaGFydC1pbmRleGVzOg0K
PiBOb3RoaW5nIGluIHRoaXMgYmluZGluZyBpcyBhIHJhdGlmaWVkIGV4dGVuc2lvbiwgZGVzcGl0
ZSBob3cgcHJldmFsZW50DQo+IHRoZSB1c2UgaGFzIGJlY29tZSwgc28gSSBvYmplY3QgdG8gdXNp
bmcgcmlzY3YgYXMgYSBwcmVmaXggZm9yIHNvbWV0aGluZw0KPiB0aGUgb3RoZXIgZGV2aWNlcyBk
b24ndCB1c2UuDQpJIGNhbiBkcm9wIHRoZSBwcm9wZXJ0eSBpbiB2Mi4gVGhlcmUncyBubyByZWFk
ZXIgaW4gTGludXgsIE9wZW5TQkkgb3IgVS1Cb290IGFzIGZhciBhcyBJIGNhbiB0ZWxsLsKgDQoN
CkJlc3QgcmVnYXJkcywNCkFsZWtzYQ==
