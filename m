Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012046.outbound.protection.outlook.com [52.101.126.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEA2436377;
	Mon, 12 Oct 2026 06:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788109; cv=fail; b=ZjfIq9iPejXrLoyxRF6Yvv32GPSuA6cJsIgFsWK+26t34QzTUk5nC2xNvxu9LS22Lx4buxscUs2xyI1lkcx8Lmo50NEuyoa2DK71O8ZuXs259NDGdYi79vpvNATFpr7plCOhxs2/dlTHfC/m/KQ1hbDtGOup196wKy3fc431Nz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788109; c=relaxed/simple;
	bh=rJyeeC4GbfYvUzz/S4mLwhgShUk40R8Z2mtD+uKfvs8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=iH7HiVhBIaPVZ0UBJGfHZq4xJacEgtn8tI6qGbfMH4KHjkHfEbeabJvafQPdBHGesVQFZFhmxq7JZuJjvdnRNjoIC1QYhuN3GB8B0w0nUqxv3FNn7VIEMGzX0aaIAWs46QDNBChk2NPR9GNtPhgnYBy8bCibR7IuEmjK/80KnP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=TZ8CSnzc; arc=fail smtp.client-ip=52.101.126.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="TZ8CSnzc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9EYUy9TTqPHZSvNjWczWtOEqEpNA1JMoOfZ18o3MFs9PrVn/uc1jqrQplXgzc2zQTjtk+/DwsgmJObZw2orKuN9ieo3RlQo2uKXtkSBpsjsPTUJFgsX5sjVJ8d6C7WWtAm2ybt/p6susXNBayiI3Au1KKIgWNwlQdlTznEPbBQEs7xnO+BinFilzPmpIjk+pREXLm3n21FrI882IFbwQIWN/jPkrzoSabNuJVOlMUjjnU+TCOQKfZEsdcGBc8LZfGJiIfcFL6d/njyDABVO3jkoz97IkkWaq8CuENbzY8ZvD2PhUxROcA86JR6DlwwfNIEoo2lNiTItXL6YoNqQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJyeeC4GbfYvUzz/S4mLwhgShUk40R8Z2mtD+uKfvs8=;
 b=IYYyyvtvfZ9RzokeOpnmvzzhZCjrGxFF3Y7KLw8N/SDE4mHtZ7zHyQ4wu1vhM3DcqvvovjuA5g3WpC9k76AL2f+TYbk2qAvlbtTM5ZEQP/5sNuR8RtoqoQ3k1nrFdmfQpQBgeg3Z7VH18fCPAWO3G1/AC8gl8RbHxYISWdMdyn8BDkzwo8ZgjUJ0lftDEDlOKoyn/y/l7zHKQcHA01LeV9TKmUKrpQ0/K+5QF69kHmBCI4vDPwXHEzmJBRs+ABw157dxgVaXF8CHGzzrTe3gzoY0g/34jH7UqUXhLgwnomESpPnlo4E+LcWyrXxEJbulW+owJm+MBixtscrbPDvGVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJyeeC4GbfYvUzz/S4mLwhgShUk40R8Z2mtD+uKfvs8=;
 b=TZ8CSnzcz5TPLUYlMby1LLom0fMq/mRGylmalga4gxOQTaAbxWlTnp/GFrauVKArgjQb1CF20Ud836Okn2MY6vzyUVbkcLG/MQqNAHuVG/2GUNQFbVN/zEpAZ7oZvvtlnX1ssxfXLxBTSU99NPeR01L4/79zMVJK5FjzMi72yoj+VgHo24oqgsFwNdj3DrU+vE+Iyh/6Sfr7nYUrGZQUkrLuLvg0nvFuBF1X0Y6jo4tHTCanc/1rErALwaCd1IMqvn5qVPeUb9MKv5ktrW/qa5lxnkcxoW4jHj45l/153oYTfWCeB+fDFmcUJzTZWLR5mKGkEOwOflEh1+yUbnydhg==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by TYPPR06MB8077.apcprd06.prod.outlook.com (2603:1096:405:31b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 06:55:03 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 06:55:03 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Subject: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for rongyuan
 GS20
Thread-Topic: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for
 rongyuan GS20
Thread-Index: Ad1aFnLUNo8+xC5PQcCpkW1NmNiVtg==
Date: Mon, 12 Oct 2026 06:55:03 +0000
Message-ID:
 <TYUPR06MB62171DFA33D7E17FD3F73D24D29F2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|TYPPR06MB8077:EE_
x-ms-office365-filtering-correlation-id: 8b444604-3484-4b93-2fd8-08df282dbdfd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|23010399003|376014|1800799024|366016|18002099003|10067099003|38070700021|261009223027099003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 TXS1RiIfGLXlmx2jba6bWuwdpGnx2RYYYKruViVWnh6HBVESj0p9HginfyV+rYtZwQEpovNvjc4U4Jvg2po7nNvY8ivYUSvz34IRA8tMwUDLmYtTizfm5jVAfWSutCtSiXRL4AFMHINoMzSnzY1jK1Ul5eFk8HokWYRa4a9bzfHkX81V5Uwg9DuzCN4biiYirvgw2ixcPhaRRgYPl3YHV3njGLaG0lDvcK+9r0SJod5o79jOYe67nydj4unx+nO2wDo9LlGYbShWJAhFMQjx3d09ZjgCBAUG4MfCWAXjdnQLu9Rm3xGtpWdQOv98G3NJPpJZ4BJtcUXUgGNbiARRCfAaZk497ArTf6S3b+oKbsmi++3TktRsFGxfgcyUJH/l/G5N4VfC1Go5MAvp0L311Xv/JcWF3Gi+5U0R7/coh6KeTV8KoOT0JXoPXCHeqmoH1+++LAYYxSJjJCOmYITusakQc+b1MyN8/XIRfKj8OqLcyA5XdZrjROg5KIApRk8wsMAAN07p60ZPigbnl1lL1C3waLlsIuFqGODznGzyQG+X1/9PhTzpkMCDQeR8x/gmvZ7ykPw+PKjgNjtmsv9xMMO7L7WBShu6fTzuaNCO6euZG6Iy9zzp/wpQ0K4FTXcrjiMtI5or0cbgVDerW/mz6bp3PXp60w+LfCVYibrpkKPwHDvLlMLEo7t1Y//ynY5KimO0j59YsxAITUn/ImIRaJMn1KCxYQ1oEiP8eaxngMU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(23010399003)(376014)(1800799024)(366016)(18002099003)(10067099003)(38070700021)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?RTlzRjN4VzJxSzZud0hrS2pjUkQ2QkpPcUN4NEJ0VzE0MUxNajV6bWQwSTdo?=
 =?gb2312?B?SzdOU3BOazlSMUZMODA2Q2ZJS1lPb2k5SjZCRlFEZEp4cEZWL202Ui93a0dm?=
 =?gb2312?B?Z293cnZnOXFvZkxhU2dhNHBveWMvS01zWjdFTkF3UnYzTkNiOTJ1Z3pQSWZo?=
 =?gb2312?B?QVpXdlhMbUhMMFhUTUsrcmNSaW5jcit0Y0wyaEdOL29YZ2ZpYnhGYVUxZkt6?=
 =?gb2312?B?Y3QyTGc3RjVZMHM3Zmd5YnZ5L3ZZZVNvUm5PaXYxWnIzNjB2ZmxDRXFmVzlt?=
 =?gb2312?B?U1BwS2J6cnROTmtmYk9Pb2wrU0VpeEdMVmNpY1RMb01IU1NPNmRnZEtoRXpH?=
 =?gb2312?B?T2VhZmZXL1VvbDhiYU1jNUVIaTRmWXAwYW9VTi80RDdyVFY0cC9WRlhVSHk2?=
 =?gb2312?B?OXEvY3VhMHlFVFh2eWhOK29uaUlwZjB5UUIxLytMWVkwakxyZnRmNlE0MjFW?=
 =?gb2312?B?K0ZyZGZTZ3dyQUF1WGlrNHZVaGREb1FuWTRtTUp5U0FWQmszcWw2NVI3Wmdp?=
 =?gb2312?B?VmF1V0d3TTNRSis5ZnoxcmV5L0dta08zMTFDMzE5WVYyRU9XUXN2dk1ZenYv?=
 =?gb2312?B?cDlseGJ1WWlEb1VyaktjMkE0Q1QyandkemJzMUxvY2Q1UDNJaVg2K0RtVlZT?=
 =?gb2312?B?cUVCeitLS2gydXFNd1V2UGZPcGlkblNMYWsvNlRmVUVEeFo0Q2FOVU92enda?=
 =?gb2312?B?dUI3MnZUdG5HNGxqcFlGeXNtZWxheklBeURvaGlyZXhVSll6bmgxc3llNWxh?=
 =?gb2312?B?WDc4dE4zZDBOTDN1RGgwRkNqS1d3MjFLdEljUjZiYTBIOWUzTU96TjYzNWpx?=
 =?gb2312?B?SjdhWW1sdGhOZTJqSXFZa0dBUnY5a3o4OHZ4aHFPUmlEMTlQY0gyWXRWU1ln?=
 =?gb2312?B?KzFvUkhqb01hcUNoY282QlZDNEhJSWZTQzYydlQ3cEdFK21melQvT0dMWkFu?=
 =?gb2312?B?dCtRbUpzS0hkdCtWZ3E5M1pTN3VvK3FRVHJpTmdGZytZOGUybjkrbUFOWnNN?=
 =?gb2312?B?UXQveVZMNWw0QWZKamwyYWlybDJoYk1hQXdsRXFZY1ZzdUIwVzE1S1pjOWky?=
 =?gb2312?B?bFgrbDVyK0NFYy9Jb3BYellwQlgyVHBkNHFqeXpzVUVFSUhEaU5OUWVaaTcw?=
 =?gb2312?B?M0R6eFFmNURzaW9kTGlMdDI5VWxNTTM3QXgxYm90bGlweGNERjBFc3JNaGhN?=
 =?gb2312?B?YnVrclFRNFNaMXpjMkxTZUlMamo4VnVhbmdIN1R2bTcwek40QTZpS3psUHBC?=
 =?gb2312?B?dkxOZldLMW94dXVIbnNBcXB3YVU0bVRBL1ZuS2piVWlzVzY1RDMrQjhuaHdj?=
 =?gb2312?B?NVhWNi9qdGkrcFphekF4azVpK1drMFhhRmF3V3hwTnlrZWRNQkUvQjI3b2hr?=
 =?gb2312?B?WCtOZUlLVjlsczJxVmQwRWxLa1ZXbi9Mb01WR3BBQlRCb3NRTnJsTkduZUl1?=
 =?gb2312?B?M2NuUytyWFBObDE3d2RhbnRwMStmdjhwU1RvVFR2WURGcTcycVZBdTMyeUYy?=
 =?gb2312?B?Yms5dlJjS0FlZDVWc3RKN0laYjMyRjR5SnBwRVhMZ1R3K3BrTU5BRUlIelA5?=
 =?gb2312?B?STN4QzlweGdMY3ZaZHA1ek1aOExSa2l1c3Rma0c5VzQycUVBOTBIYjUrRE03?=
 =?gb2312?B?Y0VnQXdmS05KSmlRSHlMYkNObjVHQ1NmcVNISndncGl4N2lQM1JGS042ZHl0?=
 =?gb2312?B?REJqZFgxbWF4YXhuUm04VUxlUUsxNFFBcDBsT2xYTTl1bU5SM29YOC9yTElB?=
 =?gb2312?B?enZCeU1YbW1BWFJwbHlSOENNSi9SaDk4KzJuTjJHbnI4ZDlnbWFFWW16Y2tP?=
 =?gb2312?B?WjZUM2xrOEFpRGJHd3Uzc0V1KzBVZGliZFJyTlFaOW1sTS9KT3FnRnNXS08z?=
 =?gb2312?B?TkRJRVIwNS9wSVkxb1ZiUmVmODBZam5ieDBrWnZiRmpjVWV0VU44ZFdyTUJo?=
 =?gb2312?B?ZkIrQXlhSE9OMWxxS3R1emE4cldMb3AybmdnRjhTRWdHVlY2UUhYTlZPWU1z?=
 =?gb2312?B?YkhTSW5LL29WaSt3clFZL3F1cThkdDZLT2t4ZVhVQ1R1Z1ROOEZVUW4xQjNV?=
 =?gb2312?B?SisrenF0UFVvSldHODdkbHc4Z2xadVRoQXRqWFFldGR3a1p0Q3JmWVM2d25H?=
 =?gb2312?B?SUc1NDk0eC9zU2dSbGRCelMvMkNQYW4yR2RCTEdZUHlqZ05MTnZaQUVwQnpa?=
 =?gb2312?B?c2VvcFVQaWJmSE5TcGdsNmNtcm02MGQ3TmVaeTZ0d3JqWG5BVDlWeC9QN2xi?=
 =?gb2312?B?MDg0b09qZ2xCM2RaZForbGo1Z3ZSMnlWWmd0dTVVbnpkOFZiaFE0RUJKdU9C?=
 =?gb2312?Q?0xRjuz+nqS0HVKE1nv?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b444604-3484-4b93-2fd8-08df282dbdfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2026 06:55:03.4951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jhhaUiUEIMVIHsOBScghovet7BFcnMIWNKkGDwpituVnuxk/VfXBjw++yu31RPG0Wn9vbio7kjFaHDz+dUVA7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR06MB8077

U2V0dGluZyB1cCB0aGUgaW50ZXJmYWNlIHdoZW4gc3VzcGVuZGVkL3Jlc3VtaW5nIGZhaWxzIG9u
IHRoaXMgY2FyZC4NCkFkZGluZyBhIHJlc2V0IGFuZCBkZWxheSBxdWlyayB3aWxsIGVsaW1pbmF0
ZSB0aGlzIHByb2JsZW0uDQoNCnVzYiAxLTE6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRv
cj0xMjM3LCBpZFByb2R1Y3Q9MTdiOA0KdXNiIDEtMTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczog
TWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTMNCnVzYiAxLTE6IFByb2R1Y3Q6IEdTMjAN
CnVzYiAxLTE6IE1hbnVmYWN0dXJlcjogcm9uZ3l1YW4NCnVzYiAxLTE6IFNlcmlhbE51bWJlcjog
MjAyNTAyMjgNCg0KU2lnbmVkLW9mZi1ieTogTGlhbnFpbiBIdSA8aHVsaWFucWluQHZpdm8uY29t
Pg0KLS0tDQogc291bmQvdXNiL3F1aXJrcy5jIHwgMiArKw0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL3NvdW5kL3VzYi9xdWlya3MuYyBiL3NvdW5kL3Vz
Yi9xdWlya3MuYw0KaW5kZXggYTU0ZmFiY2U3OTIwLi4yOGZhOTg0NzNjOGMgMTAwNjQ0DQotLS0g
YS9zb3VuZC91c2IvcXVpcmtzLmMNCisrKyBiL3NvdW5kL3VzYi9xdWlya3MuYw0KQEAgLTI0MDQs
NiArMjQwNCw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2F1ZGlvX3F1aXJrX2ZsYWdzX3Rh
YmxlIHF1aXJrX2ZsYWdzX3RhYmxlW10gPSB7DQogCQkgICBRVUlSS19GTEFHX01JWEVSX1BMQVlC
QUNLX01JTl9NVVRFKSwNCiAJREVWSUNFX0ZMRygweDExMDEsIDB4MDAwMywgLyogQXVkaW9lbmdp
bmUgRDEgKi8NCiAJCSAgIFFVSVJLX0ZMQUdfR0VUX1NBTVBMRV9SQVRFKSwNCisJREVWSUNFX0ZM
RygweDEyMzcsIDB4MTdiOCwgLyogcm9uZ3l1YW4gR1MyMCAqLw0KKwkJICAgUVVJUktfRkxBR19G
T1JDRV9JRkFDRV9SRVNFVCB8IFFVSVJLX0ZMQUdfSUZBQ0VfREVMQVkpLA0KIAlERVZJQ0VfRkxH
KDB4MTJkMSwgMHgzYTA3LCAvKiBIVUFXRUkgVVNCLUMgSEVBRFNFVCAqLw0KIAkJICAgUVVJUktf
RkxBR19NSVhFUl9QTEFZQkFDS19NSU5fTVVURSB8IFFVSVJLX0ZMQUdfTUlYRVJfQ0FQVFVSRV9N
SU5fTVVURSB8DQogCQkgICBRVUlSS19GTEFHX0ZPUkNFX0lGQUNFX1JFU0VUIHwgUVVJUktfRkxB
R19JRkFDRV9ERUxBWSksDQotLSANCjIuMzkuMA0KDQo=
