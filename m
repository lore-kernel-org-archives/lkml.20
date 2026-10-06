Received: from WA0P291CU002.outbound.protection.outlook.com (mail-polandcentralazolkn19013080.outbound.protection.outlook.com [52.103.53.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFE7380FCA
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 19:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791315252; cv=fail; b=ot5012GXjANeUQnetu19uNq1/Ogau1WnrGVJgPQrlAi3ipBMTQ7+X4Bx4CoeF7j7XY3cAp8fb9OVQQLLw1PVsO8YO1tylUKaKERoPU1l52XzW8/O/df/HoMHlJ0BvxJsTdcSKXoYyMgKzo3l4rxX5NGkfWQ2DfVnXmGZwyxLFt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791315252; c=relaxed/simple;
	bh=pBWdrZPBecpH37jBl1Km/giCGZdXdgfY5FYoD4ekBW0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=InmQ0eeUOU1N8CEtJlBgVdX0y0oBjqSPXRtHu41emBLHOGvJ9wcIh+hI9EYmdIShMTqzoU24Q295uX3HkcNqEOTV46H1Bf10gVkvu0tpP9bxUQpQYCAUEsljZgk1PaJnjL5peAGUXbYn2+Lqhpqh9UuauQ+mlhex+satRKSxlew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=g8FqRKt9; arc=fail smtp.client-ip=52.103.53.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="g8FqRKt9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DWAOO+NGnxb8T1LeWC20FSFWMNRnn48rdGhNDzhXYyhzs6Kc1A41gVSai3DQhmRkrOAk3UfjU9EVMwZNFvvLJn4MWBRi56MVdr3vS9F4cGygMBe4ZCh4Xf8IS2I541JeF5of1SakbKB9rF5PPa+Xs2aSgzrMbNjTlEhNndOGz9PJQCS6hDO2iUzqugaFxS4hloc8qPVI8GCIZtI93rnK8Q7boVrTx1rBrH4Yd70dwS2frmO9F8OBGmXlV25hDvuFJw3f1IbbgLxhZG+j9c/VuX3rW/q+wzZGTMWES0tFQ1xafO+RBwdsdOaabZAAdleahRfPTSCrCnLVuLIT0HbPUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBWdrZPBecpH37jBl1Km/giCGZdXdgfY5FYoD4ekBW0=;
 b=o1ns+l1Yzs2qKSvll1k2LmX11kAZO1+HtMa9+IYPx/s+WpYKLrglyDMuMjSKMZDh/zoamXJ80lKSanVpcIRiAFzCsMvV/LcsQfNy9hbyx5J09lDLIKn5qkUoQRa/+QT+Buu2c8c4KtMXIWga0UR5zFG8jOCYVkVqYR/W+1IQXqr5NVlwUiaJ1GX7NdCQFPtn2FU66lKO5NmGhXR3Gp2PyEiPPhbnp9TYV3wTjfg3+Kz+dAnOtYXpvzb4+/BZmPPxv0GIgXjMzGicIacegFdxy6J71+xftjY8BmfgJ5ywDun/Uy0YW7Ej+CyZdltCoBWYUHkiFMCyFdz7S/TJLszNGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBWdrZPBecpH37jBl1Km/giCGZdXdgfY5FYoD4ekBW0=;
 b=g8FqRKt9SjHdLfLoPOaOi7R2k08lZhhmpLByCoiiMZduKZkYvNHg/rUmS72mvK+9k/3Dm1Xim8xpFrj7SHqNo/Vtu1Px5RZ2gYyMwFVDKoPUMOxxcmtSKO3pOZZ4El1nuk6CX6MrjgX+aHnBv48GS4pLacjuras+fmqAupXZlnh2mj4u4QWDhZ4UJVVzlSrN9z/jl0+6A819e4jkYVxKgnkxxIfn3dhSpiGbblpoXKiK65rXzna6xKFijfqCbPh/SzPGhesUFIgsfvUb1JotRDHWLgwFEz5JNme+mBu0A/ZVDocYKD4Y3eJTnPFzxN9rHxhNpibMKbe/kZFlivrzyA==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA0P291MB0123.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Tue, 6 Oct
 2026 19:34:07 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 19:34:07 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
Subject: [PATCH v3 0/2] x86/apic: Replace deprecated simple_strtol() with
 sscanf() for robust parsing
Thread-Topic: [PATCH v3 0/2] x86/apic: Replace deprecated simple_strtol() with
 sscanf() for robust parsing
Thread-Index: AQHdVcmnI0hh72dsckC85UWqBt7yRg==
Date: Tue, 6 Oct 2026 19:34:07 +0000
Message-ID: <20261006193402.526407-1-habilerenturker@hotmail.com>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA0P291MB0123:EE_
x-ms-office365-filtering-correlation-id: d90cec61-bbd3-42c6-c387-08df23e0c9b9
x-microsoft-antispam:
 BCL:0;ARA:14566002|25010399006|38102599003|24021099003|31061999003|19110799012|8060799015|8062599012|55001999006|15080799012|51005399006|40105399003|2607281247196008|102099032|3412199025|440099028|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?cWsvR0lsYUFhN2wvRW5JU05HZkdHNExmeHl2RlJRajlWVCtEYStuNC9BRE5z?=
 =?utf-8?B?TURNeTB6a1EvZFFIZXFKSGtzL3ZXYnQ4ZmkyeDRCaTdLcTBWVE5JRC85YldD?=
 =?utf-8?B?bk1GeXl1UGNWTVdoRnJ2bFU3NHU4ZjdVcDVtYkd0YUVpcFhveDFhb3BrYnc3?=
 =?utf-8?B?RE9NemRnTWxOUk0zbS9NazVMakxzTEJUSy95TGNXQ0lhNXd0N2p5bGFhY3pB?=
 =?utf-8?B?YWVFL1kzR0lQTW82MUpCQlFSZHR0T2dObExjanJGNXpTRjNqSjloZ2lVbkpa?=
 =?utf-8?B?TGpQQ1o4Qm9FR1NXOC9GU1hLWGVLbTFQME5oLzV0eE16TnV6NllyejFkMnk1?=
 =?utf-8?B?b2g1Y2tCeER4emhVN3AwcVB0Um9oSE45Rjd0QkFJOWVPNHVhZ0tqRTE5VzUx?=
 =?utf-8?B?VWd4alQ0Q29DQm1kUkhRV012bjRNUFNDU0Y5a0NQOWY5REZNM3F3bUk1NUZo?=
 =?utf-8?B?WU1Vb0FDZjE4TGp4NE1uR3p5Z1BKLzVPMWFRSWhiaEQxaXZaQys0dDJkRG9z?=
 =?utf-8?B?VlJQK2lYSW0yaDFJbGZUNkFYVHNlVFRlOXJMZU9ROEo0eVFkWmJ3SlJ2OEhW?=
 =?utf-8?B?UDZJdDZXVlNiekcwZWw3eE84ZUVoSVVyWHNWTCtZVDZ3VnNEYlFXMjY1TDMx?=
 =?utf-8?B?MmJOTGFZcWJjSVVNM3lYLzh6S1JOcTkyOTdDQ1NiZmxJOXEwTHA5eFRhc3hq?=
 =?utf-8?B?Q0U1WnJreXI2Uk50WFduZytYMU0yVnAxKyt1bFQ3dTB1K3ZQMTZBeW4vVTlJ?=
 =?utf-8?B?TWxGRnVrRkJNeXpvRkw1OWppV2FrYmNndnVPWlJ5SGVFb25kOXI5Rk0xREI4?=
 =?utf-8?B?RE9LSVN2bWxuQVlPUVdWOUFRZ2JjV3RTd1VKenBpM0R0d1AwRmxDZXBpYnlY?=
 =?utf-8?B?elB0NEgrN3RuRXBMRmxmcDFvTGExQVREVlJ3eDNTcXZLaUZqUWpibWhTUDl2?=
 =?utf-8?B?azEvL2YxNCtqVzFsNFc2QVhZZmROM2FpcU9kb29vRTlnb2E5Tm5TblpZSDZj?=
 =?utf-8?B?Zy94TEdrMEZ6c25HM3BjeTNNRzhoNHVhNjRmU1ZnbGg0QVVxVkdSdmY1TEtK?=
 =?utf-8?B?QzZUbVgrUTMvTW9kaUxmVDVTZ2FuU3pmcC9PM3dWVG1YNURFSFVLNW9mQ21U?=
 =?utf-8?B?VDB1MWxHb1VKZmQ2WG8yczlLSTk0VGJBWUtFOWVFWWxjMk5WYzMyU0RMbGlj?=
 =?utf-8?B?TUQ2QnllRS9JUEVkclZaa1p0aC9rYU1URUlVRmJoOGVpMU1CSVcwZUQ3dVFT?=
 =?utf-8?B?TkJOUzJ4ZWxjWm5wdFRjb0VpNklCZDJDa1dSaU91eTMyVk81M3E1RDlSM0pZ?=
 =?utf-8?B?WUwvbkR3ZWtHRDVTRDNCN0NFQ00zVXVaUU56TkpKWm95UkJkNVlOZS84WC9u?=
 =?utf-8?Q?LbWcVYnh+Mj6u8WdrNzfE7A6/xnLhpvY=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M2tSZlBkaWNTOUpMZzI4WFJRTEl6dXMrc2dGY3EyWUY1bkNVcDJWYWZKTHFD?=
 =?utf-8?B?cWNrazlpclE2N21xT2FKVklJdjUzbUJsYm5iUXRtakd5azRZZkZzOCtYSEdI?=
 =?utf-8?B?R1RXM1FjYWtVanpIaDFBODBUVTlYMU1BcHpoUmV3M1VuV1lwald4Ym4vTG5Z?=
 =?utf-8?B?SWJLMlpzaEhtY21mVktuSlVhSThJdjJwWGVtWmVBRVRmdFhIVkJIZTlpbDVt?=
 =?utf-8?B?R05saUljOFkyUU40Smc1eXNueVN6dGtNbGJNSzBUR2NxYXJPUHVIMVQwZFhs?=
 =?utf-8?B?QVRacHB0V1BWbmJVbGN5WkRaT05rcmRuTXd6Wm5uMWw1R08raElhUVJUYWF5?=
 =?utf-8?B?UURSWU9mOURjTWEvUXRSeS9yUVoxbUVwYXFRbHd5T2dKS0wxL0VwWGF1U2RI?=
 =?utf-8?B?QXBhS3poaUZUSGp5bmxuV1ZBU3hIRzFMQ0VKZmNsZ2N3WFU2cFBsWVpaQWVM?=
 =?utf-8?B?dlJTSWRlcGVGaGMzZFIrQkdIS1hOVzZqOWF2RStwS0xYaUNZTFZQOWRJUzFB?=
 =?utf-8?B?U2lkU0dGdDZUVFgzQjQySTF1L3dzSTc0VXU1ZDhtYzJzeXVRcWpqNTJSdDF3?=
 =?utf-8?B?UDA1QnVzV2JWOEVyOEg0YzlHUk81TG44d3NDc2lwRm5TMHdTOFc4V3FDR211?=
 =?utf-8?B?SmRtbzY1b0FpR3Bjam85U2ZSM2dwY0JtTy93Q0xHY24yY2VNR2FUUkNTOVFa?=
 =?utf-8?B?NDl2Z0FjUFlGYzRrcksrK1RnUlFUZnJqeDRNT2tjS2hUTjR1bDV2dWxkQjRp?=
 =?utf-8?B?akpCS2ZTM3pTdTluWlFjaFB3SzRJVzNnU0lqU2FRUkV0M05CTDFGZ08zc0I4?=
 =?utf-8?B?K2NmVUJIUVl4SlVVc0luK2d2S2F4MEJoenlSYmY2UVJISlNHRTFxRVdQUDAv?=
 =?utf-8?B?U2RhbC9KWEdBYWZYTmwweUh0anFQVWdpM2FQZUFVQ1E3OGlMTG9NbUFqN0NI?=
 =?utf-8?B?cU1vN0ZScmVrUlkrQ1VFcFh0K0Z0YVdrSkpPdFJmZGQwQ1VqOEVTdmFjeHI1?=
 =?utf-8?B?Zm5ROVlFdndxSmViOVgxYnYvSlNrRFBXME5VQW5yWkpuSzB6SUdsakltRHZW?=
 =?utf-8?B?WDFTczZoV21BemVydDdxYTFhcXFDeFJuVVk5enB4U1R3ME1sOGlVUEVCaG41?=
 =?utf-8?B?Y0Zpd1Z2RllOUUlxSzVFNzRma3FabC9uQ1RFbFozMitOV3JXQUdBeHV1cWQr?=
 =?utf-8?B?WDZpeHd2WVNUMXlNeHZGU2VKNXBoL2U2MFdITFdiNkFHLzllVDBiVmkyQXlD?=
 =?utf-8?B?dFRkR01zby9Pbzc2V2JoMnRoQmZnU2lsYzNLVHNkWThLWVlNSEJ5cUZEYzN0?=
 =?utf-8?B?Nk9CTG5TTmI3UUgrQ1RRTVlLNWZjRHlIZ1p1eldUMGlGVjlFOWRubXFsYW1K?=
 =?utf-8?B?cEZXbHNkQXVqeklVZ2NDekUyYnF2WnFLQndLQ0s4Z0x3VEVZczBZTnJ0bmVy?=
 =?utf-8?B?Y3BmeVF6cjNyekpCVmJVOWRUUXNCcVBNQm1DdDlnTjg1dHNEMkt6WWdlUVk3?=
 =?utf-8?B?dVBqUlE1MFFZdVNnRXR6TVFFODRoTmIwaEFaeFozNUhZbkgrOFI4Wjh3b2lp?=
 =?utf-8?B?MWRiZUp4U002Ukx0azM4S2Q4OTZITE0wQ0x5NW53aE01a3FBQ1VxQkJRRUxx?=
 =?utf-8?B?aGdIbHZkSjI3dXYxb3JvczFJSDByWkx2a1JzNUdRcVN4NzRHY1dMSUVqMDRO?=
 =?utf-8?B?SXEyaUYvRFFLa1I3MUUxY0tjeC93K3VpN3QwL1BqaDRkV1JoYTdYZ1RDaEJt?=
 =?utf-8?B?SE5xMDRuaXk2WUo0OTJPdlFZQXZpcnR5TGFQaU14bG1yQ05xZUVxTHZnVzh0?=
 =?utf-8?B?VTNOZDJVazVLRmRPbDVIQTg4ZWZhcG95NDhFdmhXWEtsTWFZR1VxRkhnTFds?=
 =?utf-8?Q?DIbkZP73+320V?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7A17AE13FA12C46B2823921E882AA5D@POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-2112e.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d90cec61-bbd3-42c6-c387-08df23e0c9b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2026 19:34:07.3471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA0P291MB0123

VGhpcyBwYXRjaCBzZXJpZXMgcmVwbGFjZXMgdGhlIGRlcHJlY2F0ZWQgc2ltcGxlX3N0cnRvbCgp
IGZ1bmN0aW9uCndpdGggdGhlIHNzY2FuZigpIGluIHRoZSB4ODYgQVBJQyBjb2RlIHRvIGVuc3Vy
ZSByb2J1c3QgcGFyc2luZy4KClRoZSBzaW1wbGVfc3RydG9sKCkgZnVuY3Rpb24gaXMgZGVwcmVj
YXRlZCBhcyBpdCBzaWxlbnRseSBpZ25vcmVzCm92ZXJmbG93cy4gUmVwbGFjaW5nIGl0IHdpdGgg
c3NjYW5mKCkgbWFpbnRhaW5zIHRoZSBvcmlnaW5hbCBmbGV4aWJsZQpwYXJzaW5nIGJlaGF2aW9y
IHdoaWxlIGVsaW1pbmF0aW5nIHRoZSBkZXByZWNhdGVkIGZ1bmN0aW9uIHVzYWdlLgoKQ2hhbmdl
cyB2MSAtPiB2MjoKLSBSZXBsYWNlZCB0aGUgaW5pdGlhbCBzdHJpY3Qga3N0cnRvdWludCgpIGlt
cGxlbWVudGF0aW9uIHdpdGggc3NjYW5mKCkKICB0byBwcmV2ZW50IHJlZ3Jlc3Npb25zIG9uIHBs
YXRmb3JtcyB3aGVyZSBmd25vZGUgbmFtZXMgY29udGFpbiB0cmFpbGluZwogIGhhcmR3YXJlIGFk
ZHJlc3Nlcy4KLSBDbGVhbmVkIHVwIHJlZHVuZGFudCBzdHJuY21wKCkgaW52b2NhdGlvbnMgc2lu
Y2Ugc3NjYW5mKCkgaGFuZGxlcyBmb3JtYXQKICBtYXRjaGluZy4KCkNoYW5nZXMgdjIgLT4gdjM6
Ci0gU29sdmVkIGNvbXBhcmlzb24gYmV0d2VlbiBwb2ludGVyIGFuZCBpbnRlZ2VyIHdhcm5pbmcu
CgpIYWJpbCBFcmVuIFTDvHJrZXIgKDIpOgogIHg4Ni9hcGljOiBSZXBsYWNlIGRlcHJlY2F0ZWQg
c2ltcGxlX3N0cnRvbCgpIHdpdGggc3NjYW5mKCkgZm9yIHJvYnVzdAogICAgcGFyc2luZwogIHg4
Ni9hcGljOiBSZXBsYWNlIGRlcHJlY2F0ZWQgc2ltcGxlX3N0cnRvbCgpIHdpdGggc3NjYW5mKCkg
aW4KICAgIHg4Nl9md3NwZWNfaXNfaHBldCgpCgogYXJjaC94ODYva2VybmVsL2FwaWMvdmVjdG9y
LmMgfCAzMCArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
MiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKLS0gCjIuNDcuMwoK
