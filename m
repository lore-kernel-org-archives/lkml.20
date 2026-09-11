Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012022.outbound.protection.outlook.com [52.101.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D734313E1B;
	Fri, 11 Sep 2026 01:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789089062; cv=fail; b=lqe68tz/GZ15zOey3+DA73mzIRFoO2GpaEcw7yWy80VmzYGsSOiP1rl1wPLRjMyLfoj7tKm81UPZQxU48BQVhYC5WvmXsrLA4j678Gws/go0FFbZERCPKKB2N9R10nV1U1AGIuXTH+3IzXPmnQRBY23u07m79shcMKdsk/rbyOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789089062; c=relaxed/simple;
	bh=Q2qFFpdMWde87M/1lxxZuRs9WsOlNEBClbnO0G0pZaA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y+P8CfXSLRWMKal189H09a5EM96R6CWOEaXRepQFDhpZQ0R55wOmKPpqZfsREndGPs0TixLG3+sx5cguMBIqIj3iW9pjDpJrAWv7tfLh6Heqzf2+ArF0vEy8plZa3W+iPh6YKuQqDxYwXwQZgs6MXZD7L7+qiuNM6zX2ojFtVXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=q1Zn1B0v; arc=fail smtp.client-ip=52.101.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="q1Zn1B0v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPRTEXuFU4ENAjQ78XCBww92pFE17RWqfxXtsN40kS/pAHSp+YI34vuNmxfoI6euvHNtf2wRyFvJaLpxWS2nie/aY2p/3jlYUAVRMllL6AE2KoVnN2xWuFTmCwbMo1mDVk/bRQcgk2KCeyk3E2hn4+S0LZrcl00CfSAlBSZhzh922iDO2z53k0IrvZYy3QEGi3/mh82RTLKwI9hcDNQmQgWDmeJmwzwbtKDSVAueJTG2VEWUuGtHtab7FsfC4k/2qvFmNO+etMbilseb0imxWluntk70/SsUTXhpzTdc2S6NWXBuUdFQE6UFZKcnmL3g709gP7H6WcleSQTOtlYtqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2qFFpdMWde87M/1lxxZuRs9WsOlNEBClbnO0G0pZaA=;
 b=q9LAAL0Fyyk9bNSZ6tNBX0+JPhbAnxq3CFQl319V5xfFHZO3FoGJZS9NuPelX1KnHKcN1vDVBZm/x86sD5Dv2SiMmR41ZbbJy0OlIBpsQx7sMA7WDwYwsJwgyWO4AuARYbvXYUvWGa92oJMb+kkYn5bO73QIbKLvZvayCqNKjagW/x3Wn+/NDb6VmP279PxcojoT479U7sWnr0A6avBxm/pZwOwhoEoCzXoSXlBCDZg/CSbVhIQ7e24kIy6dYPXwyXHMO6up9mJYC26pT/E+Yj29q9dZ/26DXzmbuw3Je4/Kf6HEcxVk5+Ijk+V3FaDzh/AC70iR5STFdN62x/PvKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2qFFpdMWde87M/1lxxZuRs9WsOlNEBClbnO0G0pZaA=;
 b=q1Zn1B0vbdxS9NRCs+ggLSczO2EwQrtu9C67aob3hqjYUpkc8qKpnNpfe96fma5sJ+nhrN+rxqX842BTH5NN3Fs4zj7yk6gvuV/7hjzy59LkcJYEk6p3vs2FTdv4CYd+u6TfXv0MODcBzCUVaP8MAQqIRwj3BimIWkDLwzTGzSOD8rSEKiLzUVJ5fDj8xqPgSy+LQqGJyE9HksmzSx2N6KJLEYMpUEo5XEpFGXUWKs6ulNB8p9sSuVlTRbGl5KRRO8zX9FDlaXOBP2SWZ7BHx4C5ipscgsKE0F1FDKac58cIP/uX90vJoUloZVy6gtSWMpuuz8oRAMNITcJjEMx18A==
Received: from CY8PR12MB7290.namprd12.prod.outlook.com (2603:10b6:930:55::13)
 by SJ0PR12MB8089.namprd12.prod.outlook.com (2603:10b6:a03:4eb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 01:10:53 +0000
Received: from CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc]) by CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 01:10:53 +0000
From: Qiuxu Zhuo <qzhuo@nvidia.com>
To: Borislav Petkov <bp@alien8.de>
CC: Tony Luck <tony.luck@intel.com>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/1] MAINTAINERS: Update my email address
Thread-Topic: [PATCH 1/1] MAINTAINERS: Update my email address
Thread-Index: AQHdQG4oBWj+KZ5gc0ajhRCUEVZKirbGhmyAgAC2M/CAALpuAIAAnBUw
Date: Fri, 11 Sep 2026 01:10:53 +0000
Message-ID:
 <CY8PR12MB7290198D59C3A12FB1D2BCBBD1BE2@CY8PR12MB7290.namprd12.prod.outlook.com>
References: <20260909151531.69074-1-qzhuo@nvidia.com>
 <20260909175003.GBaqGcS96zIUbWmIJ0@fat_crate.local>
 <CY8PR12MB7290F0B20CB72D255AD77C35D1BF2@CY8PR12MB7290.namprd12.prod.outlook.com>
 <20260910154926.GDaqLRhmFs76RBX4jm@fat_crate.local>
In-Reply-To: <20260910154926.GDaqLRhmFs76RBX4jm@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7290:EE_|SJ0PR12MB8089:EE_
x-ms-office365-filtering-correlation-id: 49903922-6607-4006-edf9-08df0fa186e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|38070700021|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 o+ETn3XHyRIZJJvlujJUrNxqN7JVFH0T/vQJCqyT8Z5ku382dIxajrZ6Ytb0SnxpCAfQ7DHs3Xv2ztEfxOdQTwcZOazDQOkfVD/2jSk0oV53WoKYx766JfWJEqKFzog94WLlfeqDwuOz/yoEpmAyAhMzVaWzrbHdPSzEELGE1FN8YooExb5omvK8UyeY3dLOmd129WsULK9WrZA5Ug4oQ5bSBDiDV6RT5EBzGMtmldAKMk2sl8VII7hWENP71Fh991oQS8ImP94nrEJPCuzdFsfMOWeeyoxXUM3ARw1QPojZ63PJ2GWHdPqpIbIh9cqXXX2CxH8PwjXyk2wwj3S68547heyXLF+VAWZd5QiaOn1BjiGz+BA949PVmL/kOqnNxlJ/yCIh88/Ke8NKqfhQJwubMrPvEtZppNgmfYSuPEVff5ONHhnnkemm1/lv8t5g9qHRfMmKyUsMky+raOVUE3CcUz5kHQNOTkx6bOyyUHUpEGd7asrAvarYSV1nI+DObmYe8Fy+vxPSdd0tNF7qnjBmWvarpGlIGPtCwoLprq+xXChgHLjOXyE8GW73c8gpM+PwLi4+J2mXD2U8EBLmS39FSI/Z5kJCPLpXNmFTluZ/h2c3PvDSSt+s8x6rKRhgzZ5LTgE5cqqFrxRY/8BeQE/MbNwooh2sUD2rWp+QFHUvHdy0TwB6CO1B//kCAYhL7rCDqUxXY5WbcTV5KtUWGQQMHkfi/l3wJRxJHszJvUM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7290.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NU94WGkrS2o0dGVNK010Ri9teWNSL0Q5eGQ4MTVtS2JVbWdCVThVQm8yaVln?=
 =?utf-8?B?RlV5a0tVL3ZKMlk2SVFaRnp1RzlQSmN2MWVmWjZnTVBmWjh3QStKM0gzc20y?=
 =?utf-8?B?dlBUNUJIVUZmSUpmSU1QQWxqbUNJQkdWdnErTWFEV3M0WVBUeDJnNW9RRFJS?=
 =?utf-8?B?a1lONGs2MEtTdHRzNGR2NG9INnhBeVpDeGZDWGtFcnVWdkNiRzd2Rzdma1Qx?=
 =?utf-8?B?Y3p0S3BrTEpLUXZMREZxY2ZsWFErSmxxcXhuTm5RcUx4Rk90RE5nRG5RVFA5?=
 =?utf-8?B?TFp3WHZueFk2ajRiTXUvVFFtTUlkQ09tQ3NpcVVDSlFoV0Q0Y0RFb2NmK0Fm?=
 =?utf-8?B?SmIxVWdScjdpNzFhckQ1azRTYlZQY0JQM1pjZ3pwVVB1Rkl5dDREWVJEVHB4?=
 =?utf-8?B?OHZBWmVXb3pvNEl0ZTQzVW1IMll2N1lWZ0xTYTYwVTlhMHFZaTc4REhNakJl?=
 =?utf-8?B?ckdjMngxMkxYYmVGMGtOVmM4eSt1OHIrWG4wWDdCNzNjRnFmcDhzUWE0aG9M?=
 =?utf-8?B?bWNXSlJKK2U2OC9PVnhiNEk3MThXOS82TW90VTRLMW5iWlVONHR5allxRGQw?=
 =?utf-8?B?bVlidk5tS1ZoSlV5cUk3WGlBR3A4bCthV3NPNFlkL1R3dnlGd3I0TjhaUDRU?=
 =?utf-8?B?YkE5QTg3NHFyK0pMdFRRN2xZNktDcmp2SHpwYndMVTZBNWRaV1dDZU54YnZ4?=
 =?utf-8?B?U3dqUGwvME1jRXo4MEh2YVQvR241dDFCKzBBQ1hLYUQwYmxqSmdKWFR4QkVr?=
 =?utf-8?B?bWUvUVJ0SEtHOWxJRGFaa2xsUmV3SHdRNC9TaVh0SHhMQ2hxL1B4YjlGa1gw?=
 =?utf-8?B?RVZ3d05Cc0s0YmVSRlpRdTRpV0VYalpRTERKdlpNendyVVE0S0tRR1U0SEg4?=
 =?utf-8?B?Y0grbkl4N1ZVWDJ1Mm4vcEVpTXdTTm96YjcwaXJHeE43OHd3ZTRvNit3MEhX?=
 =?utf-8?B?NnI0c3JpVGk5VU13Q2xpSjByV3pHTFlucnJ0cmlORzZYbU5mOVprVVJERi9L?=
 =?utf-8?B?UnBrWUh4U2NpSVVNYXRZV09obHhMcVdLQlVXT2h0ZjlBTXZSRkM3eFhFenZs?=
 =?utf-8?B?WGgwb3pqSWk2QWRsaUlHelRYYjhqTy84RUQvTnFRVHVOcVI5Z2ZQWk1va0NL?=
 =?utf-8?B?eU5PWEF6M3RMVGJRNTJlczdwMHlDTWR3NzlnQk1uNjZPck1uRUVTUlduaFhl?=
 =?utf-8?B?TU9ZWTJBY25iRHlXWHhnQnRiV0JCcHp0eGNRYS9GdFpKY3diK3k2cEx2OUs3?=
 =?utf-8?B?b2VEVkhCU2ZVc01lV0piaHYyK1VUbDhGandIQnRWMnZSdE9vV0l1RDRYNU5P?=
 =?utf-8?B?Tk1GYi9LNHRxWmZKS3FnSmxYK2x4aUdlc2gxUDcyd1Q4VytHbm9hdkFnYXc1?=
 =?utf-8?B?dlpDTjhGSFNFTFFZSEFLM3Nzdjg0S2pHdzgwbmtTY0dtNWlxMHlwd2FQbll2?=
 =?utf-8?B?dkFsaVl3WUwrcEhNcmttYjREaURtS1JRV1JQQ2lZZUNiKzlFb1c0TE9QRFFJ?=
 =?utf-8?B?SEkvQlAxOHhiYStnRTRTemptMGVtSTluZEZjc2R4ZGdiUUpQRWdrNEM2dXE4?=
 =?utf-8?B?UWFQVzZqU2ZoWEJ3eFBlUWVjR3Z0UlE1Z0FrNS9xY3dhcGpLL1IveENPRUMy?=
 =?utf-8?B?TUkzV1VUZlFvK0RtejBmZllQUkhlTEVQVndDWGRUSXE2TTBkR1pudHJBenBY?=
 =?utf-8?B?R1Mvb294SU9OZlBuSlZEWjFYSkZTbjNpenJsbHBVYXJ1ZWV4dElpS3RicGY1?=
 =?utf-8?B?dnVwb1FjdzN5bU5wTHZqOUsrSGpJb1doQS9zM0RER0Vwcm01OVBNSEh6WkpS?=
 =?utf-8?B?Wndqd2NreVRzR25zTXVCTjZQVlZoWHVTZnBPV0g1ZHc5SzIwWUtTSHZpdUll?=
 =?utf-8?B?T09DV2NHMzVrNmRnenNWeENaSnFMbWl3SENJWkZNSS9ORVp1cjErMlllYkM4?=
 =?utf-8?B?eGlndm5sUkdaSWE0L0d1cVZHNUM1SmFPOWYzdmhuZE5KT1NZaDc1ZG53b1Zh?=
 =?utf-8?B?cVNHSTFUbDRGS2I1V29ZOTg4RDl5VWJzMWl1NzJLMHdzZEdHRitiY2Y4MXNE?=
 =?utf-8?B?WmtpZ2ZEVCtjZ1BDSE1HcDIxWHdEYU1BdE5DcjFXaFJIT05qV0dFc2sxZ09F?=
 =?utf-8?B?UElYL1lMNzFoQW1kVnJ0SVczbHpBQ0tTUGR6VWxUNUZmcFdlZ1I0ZlQ3SC9a?=
 =?utf-8?B?NzhmNDJTblZKTTMxUGdSeFFuYVFSajJPdm80YWx3TFphcHF6SnM5dmlSL2ho?=
 =?utf-8?B?QWtONDhINExROUZFODEvMGFmV0wvWFBaZ091cklYcmtYOFV5ZTNrVEgvVjJH?=
 =?utf-8?Q?W5UGklEZbYmapX7zzP?=
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
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7290.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49903922-6607-4006-edf9-08df0fa186e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 01:10:53.7027
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cu8qlTwn76xjBMBywxMOPQMEa3P1ki0PCmD+o1w5l5b/78pm1tLwMY4SwAw2tnGgTZCVjJK3D6qfg3z9dxHoRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8089

PiBGcm9tOiBCb3Jpc2xhdiBQZXRrb3YgPGJwQGFsaWVuOC5kZT4NCj4gWy4uLl0NCj4gT24gVGh1
LCBTZXAgMTAsIDIwMjYgYXQgMDQ6NDc6MDVBTSArMDAwMCwgUWl1eHUgWmh1byB3cm90ZToNCj4g
PiBJdCBsb29rcyBsaWtlIG91ciBtYWlsIHNlcnZlciByZXdyb3RlIHRoZSBGcm9tIGFzIOKAnExl
byBaaHVv4oCdDQo+ID4gKGludGVybmFsbHkgc2V0IGZvciBwcmVmZXJyZWQgbmFtZSkgd2hlbiBy
dW5uaW5nIGdpdCBzZW5kLWVtYWlsLg0KPiANCj4gWW91IGNhbiBhbHdheXMgdXNlIGFub3RoZXIg
bWFpbCAtIG5vdCBjb3JwIG1haWwgLSBhbmQgZG8NCj4gDQo+IEZyb206IFFpdXh1IFpodW8gKG5W
aWRpYSkgPHF6aHVvQC4uLi4+DQo+IA0KPiBmb3IgcHJvcGVyIGF0dHJpYnV0aW9uIGFuZCBsZXNz
IGhhc3NsZSB3aXRoIGNvcnBvcmF0ZSBtYWlsIGluc2FuaXR5LiBNb3JlIGFuZCBtb3JlDQo+IHBl
b3BsZSBhcmUgc3RhcnRpbmcgdG8gZG8gdGhhdCBhbmQgSSdtIG5vdCBldmVuIHN1cnByaXNlZC4u
Lg0KPiANCg0KVGhhdCdzIGEgZ29vZCBzdWdnZXN0aW9uLiBUaGFua3MgZm9yIHNoYXJpbmcgdGhp
cy4NCg0KPiA+IERvIEkgbmVlZCB0byByZXNlbmQgdGhlIHBhdGNoIHRvIGVuc3VyZSB0aGF0IHNo
b3dzIHdpdGgg4oCcRnJvbTogUWl1eHUgWmh1b+KAnT8NCj4gDQo+IE5haCwgSSdsbCBmaXggaXQg
dXAuDQoNClRoYW5rcyBCb3Jpcy4NCg0KLVFpdXh1DQo=
