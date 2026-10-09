Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19010017.outbound.protection.outlook.com [52.103.7.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B5E3D9541
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 23:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.7.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791588929; cv=fail; b=oWjPo3IIoJNKKEKou6qRdneqTr3UdUKCe/YwarW7bOoR4+iPFV8lkyGpCWg6uDubzs4TJbAZ01fqy6knXP/oGvvvUqtE8utjBcH41zdasZL9WHdMzI5Rvj65S59MRJZMEunaVweVyJA3k9FiEvQGEk8h/TKF72/fEAgnnGeKTDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791588929; c=relaxed/simple;
	bh=BrBr/RL+EJMx9H4OkrOBgzJPh0U/30yR0YxjlIKrLJ8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aIJaFSNFx2pWVe2Q4xnJbTykLeeDuPNiOBwLX0YOCO2ZBaa0i6Rn4AHSCFV2ZGLZV/LQUDvS5GHcmRsGFgCyPwzzUNW5un09w0NsRwvQJ86jE8jqMnlM0zsdhZ5qZwsvNDL72tDZK9Dodg3yuHLP6iUNHCiXf7nbcAUzlK/haOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=QAMea9bx; arc=fail smtp.client-ip=52.103.7.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="QAMea9bx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjIk9TBNXagEmox5vjHqDeAmHSjdGNvViJNC0oufyngOcDV55e44kJI8sMbySMGRQbtFgDud5e8sSZOYzhVSmDNVKdNBtK6dlFQOPUh9ASj7V95NSlj0hpJfbWOgc3nBcUuljCoN+IbBxlnqUZFnptxwLnGa2M5eYQwas3ScYKGqpjscFovwQlhinxKgv6uTtMfdwIj3GyD9Zroq63oFLb5d1lpmxSPooc046QO+qXbuTNlB4Gl+R+2KpFoxu7/7kRhrCfYRVla00rmKpFSKTpy8V+2O1+B8MRuFHPNNXHEWOTHawdkvGMNSNJxZ5b3bbeggbz2j4bfawFxd/FrIIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrBr/RL+EJMx9H4OkrOBgzJPh0U/30yR0YxjlIKrLJ8=;
 b=U7LdFSmhd9iQyWfLWMjKWRKi5T5GzGNBpze9j7LZ3QemWRjg57hV79cZheAsmO7Ch60CUnQohtNyP8Jy9WkW9aLZr/AG6/vzacsOLlHg9MUJZlvwH6A2scCoIMmevbz2C+kpztI9OEb01lDeAOhvG3dU/LD3TJI1EUknK/U/0bknD+AqgVDBwpZV5sqv0K5NPwp2rNE9e/ui3seUDqg8clFKkUt3U8IfFUBoU5DCLwnwPAmoA8RfonRe6Jmgzv0mWjnifOlTffTR3wWO2OFzaaoTPc65sqdpAYMxbOuY48IueQwFMkQx9035TLcgUiBRz1TN291+Xgn089eMFrVV/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrBr/RL+EJMx9H4OkrOBgzJPh0U/30yR0YxjlIKrLJ8=;
 b=QAMea9bxPI57yK4dt26sNP8mqHKeyAX+OL44nWpieRMMQnl/BeRfE2ST5zMFHmo99dxy+mKRCuFufnOtfEm69bUH4SnpeVJUEqYTwTe6nKqOMsyDzf0W1vgyu12UOhpI5S8ijExt20/DM48iYjFM3eTFz58LV3mTRMzh+ANmJ79YZ94yn+JVT7MwSucaQrqm2Ppov8dm9jLenxiJgDRvy6P5qSYDK6sikgNOrU8P/XaJCZqw/lyELCWjhnv9o9znFNloxuDlPwRMg/mfiJCu+s8eBUATVLjps8sop5FhneNsqJaEW90Xk4CZIatZJUx+Xb9BjE1PS60LFKIVLcGjTg==
Received: from MN2PR02MB6863.namprd02.prod.outlook.com (2603:10b6:208:1d7::20)
 by SA0PR02MB7164.namprd02.prod.outlook.com (2603:10b6:806:db::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 9 Oct
 2026 23:35:26 +0000
Received: from MN2PR02MB6863.namprd02.prod.outlook.com
 ([fe80::da67:fd0f:d96d:ac53]) by MN2PR02MB6863.namprd02.prod.outlook.com
 ([fe80::da67:fd0f:d96d:ac53%4]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 23:35:26 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Konstantin Ryabitsev
	<konstantin@linuxfoundation.org>, Joe Perches <joe@perches.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"users@kernel.org" <users@kernel.org>
Subject: RE: [PATCH] get_maintainer: only use THE REST as a fallback
Thread-Topic: [PATCH] get_maintainer: only use THE REST as a fallback
Thread-Index: AQHwgd0js76wg5+MJbsDWsY/ETNB1wLxPR+ntrf+z1A=
Date: Fri, 9 Oct 2026 23:35:26 +0000
Message-ID:
 <MN2PR02MB6863D13518DE56116A8F9E33D4922@MN2PR02MB6863.namprd02.prod.outlook.com>
References:
 <20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org>
 <8e194f64-6add-4fb3-a1bb-9b27719b409e@suse.com>
In-Reply-To: <8e194f64-6add-4fb3-a1bb-9b27719b409e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR02MB6863:EE_|SA0PR02MB7164:EE_
x-ms-office365-filtering-correlation-id: d93845a8-ce0d-4dd7-c195-08df265dff4a
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799012|8060799015|8062599012|4140399003|25010399006|24021099003|15080799012|16041099003|55001999006|37011999003|31061999003|13091999003|40105399003|53005399003|2607281247196008|102099032|440099028|3412199025;
x-microsoft-antispam-message-info:
 =?utf-8?B?UzdUODBFWmtQREZndGpkdUxnWU80RlFzTzBiUTA3UHc4Y1hCRzFOSkVxNElk?=
 =?utf-8?B?NGNPRXl2bGZVcEFZOElMbEFDMGpCbUV1WnRBeWRVSlkyakc4U3VNLzd6SXZh?=
 =?utf-8?B?R1JrZTJGU1FQdFFxb016WEtGSCtaQmdXaFNTOUY3N1RIK2syYXIyblY0QzNF?=
 =?utf-8?B?eUFuOVBXemk0V2hzN29uK0JsdVllSGxjVDhWMmt0RWRWdXFCbWlab2lLZW1k?=
 =?utf-8?B?TkR0d1IrazBiVUMydjFhcFFBTlVNc2p4L3VEbDJvSHpZQ2daZWdETDAvb2Fv?=
 =?utf-8?B?NFhWajR6ekphdHVLdG05OG92ZWRGWDBBK2UxaWk0US9tQnhRZjJrN2hsTGNL?=
 =?utf-8?B?NjF1VkdKbHhhMTBadkV2dGFxODkwZ1phTFBsbUh6S1g5V3Fsb2UxKzlURHB1?=
 =?utf-8?B?TWdiSEVTVzZuVEdxWUVFN0NvNzNRN202cm5WMmFMTms0d01sOWM3Z3NQZVNM?=
 =?utf-8?B?YjlNdE5zRXFORFFGbWhzckY5a0tmZXBZTzlBNFJyQWp3UjgxZXRtemhMaHVY?=
 =?utf-8?B?VS8xS2g3ZmxzSGNrVEJUcGZpUEd5TnRPMXdiNGhhUVFYeWwxMjZwR3pCN0I3?=
 =?utf-8?B?N0x0MVBtUW9BSWJDNFd6UFQvWFg0Z3djRU93Z2RQZzV3cVF5UzgvYkVYSUJC?=
 =?utf-8?B?TDErL05IN0oyQ1ZFcnZLMEMxR1BYZEl0QzBPaHNWM1MwVndLTFhpd2tzT2hi?=
 =?utf-8?B?Zjh0ZFR0bWRPZFJ4S2dFRzhlOTQ2UVlNRGJFakZrV1Y3bXUwaU1URFlkaEdY?=
 =?utf-8?B?WWJJR21hbXZRMCtnNHZpa3g2OENMRStDa25xemZLSGZmV1o3V1pJdDMwdnhh?=
 =?utf-8?B?bUUwNHV3M0JXWXB1angrNzBKUkVySkplTjhUV2Uxa1A5elJjQW9LNlljaHkz?=
 =?utf-8?B?V0VjZHJhN25ZMFdnNzBxaFFqWitJaVhlUXVJYnRwc2tsSWpqZDludFNXNDl2?=
 =?utf-8?B?d3lXb2ZYcXhNcDZhRlVtUHVFRi84Y2xOSDZ6aU4ybEpFUVBrajFBZnlvTzZ2?=
 =?utf-8?B?SisxUHdaaVRmVVFLZVkrNEdFR0pYbUxpR21vM3R0RFowanV3eG1wWE9paXI0?=
 =?utf-8?B?QlRQanZucFY4RE1laFU5aDMyNkhYeG8wQnVQeFB5RGkwdElLUHJLa3oxbTdC?=
 =?utf-8?B?TXR3Q3Y0VmlWeXphWDdsbFZWcmI5WWJXaVNrYndRMlFWWlBUOE16WXJnbDZW?=
 =?utf-8?B?ZFh2YTN3RFVEeWJPQkUyQ0NpTHRDeGQ1N0tyYXBBYmhvTUZFeU1KVTJNci9r?=
 =?utf-8?B?Y2t3SnNkNnVFbDFiZVc5bE5zcnBRSDdsVFZoYjF0NGJXVzVWWm91b0JmdExx?=
 =?utf-8?B?S0NOTUk1L2l6VkJqeWllVmhrcEh1RFRlS0VWZVN4M3E3T2hlc2NBZzBZamF0?=
 =?utf-8?B?MW5NWTVxVW5xaGJwN0p1S1hXQStTNGlpMGJlY01qQm9FQXIrRVBaQjJQWFQv?=
 =?utf-8?Q?twFMjBNu?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K0VxdllSTTVaS3dYUk1JZ21DRjlpRFFSMzNxMlhMeW1DWTJGNDZjUjNjVWtU?=
 =?utf-8?B?ajJqd1pVVU9IekZTYlBzNElteDRaVnMyMGxVa01iOHZ5RFJnN295L0g0azc3?=
 =?utf-8?B?a0VYTTQ3QlZNWlJjakRoRnZvVTZKMEpEbS9DbHFoU1dEVnJ2MTQyeXNDME04?=
 =?utf-8?B?UVByLzRrRTRVYk5PQms2cTVkcVdQTUtIdW1oSEU2RkkxbGI1T2RRR3gzSUEx?=
 =?utf-8?B?cTRsN2czZ01NU3NPeXg5a0tkNHJSRFkzRGx2SGVCYmlDTlZ4TjJobEJ2a09E?=
 =?utf-8?B?NU4weGp2MWFuMlF0TVdVRjJDaU5CeEJZQVpHMTdyK1NGN1ZHMDA4NWV0dm5M?=
 =?utf-8?B?T2I1K3hOVXk5Mkx0WnEwQmlLUHJIQlJCRVZINWV3TEF0LzVPbE54VUhDb2kx?=
 =?utf-8?B?ek9GL3BhM2dWSjNWM2x6bzBpTEpTTlJZVFIxVGdjcmNpVjNvVm9GaWp5WUpU?=
 =?utf-8?B?blZtR1FlWXpoSmoyaHZxQkNsNVJleURmSGdwOXEvVFFvcmRGREdTQmFOTlF5?=
 =?utf-8?B?WGtnNFBRbENMVUpFZ2ZxblI1RnZaUGlPTHVBaEFRbTkzeCtKbEJXcHpPcmpi?=
 =?utf-8?B?L3ZTVS9SdXhWWnNaYUFtTmE1eHVGNm1pODQ5dlhxZ0Z4RUpFN28xNDdHOXhW?=
 =?utf-8?B?ekNsK0Y2NHpkSmxKVzlDTEdnVjZFbkxOQldSOGYrQVFuNGx1R0RtWHRzaVpI?=
 =?utf-8?B?akhwM09aVTJhbnlESHRLbTFmaE9BY2hRWkFaZjNKTjlYRFhDMjRTTXlPZzY4?=
 =?utf-8?B?MGpkSG9ydXlCNTFQczRYMkpKNXk0S2JjcXpDM1dRZzFFdVRWZWdYVnhoM242?=
 =?utf-8?B?dDg1VG9mOXA4WnNrUjUvMnJCT250bDk1Q0dzc1g2dWFKK3hzb0MrekFtek91?=
 =?utf-8?B?THIybUNIZ0dEM3c1bENQMjIrMHFBUzdMbGlMT2dYQ2YxNEpaQ09FNk00RE5X?=
 =?utf-8?B?ZzVkaUtLYkQ3NFIvcHNIU0s4VlF6aG9YaDFuamRWQzhCdW5mSm5YU3FCbjJ5?=
 =?utf-8?B?cTdUdjZKWm9EVDljNFgveXRYQUZFaGdYMmM4T0U4eEhOTlYzSjQ3Uno1Yk5j?=
 =?utf-8?B?djgwNDZLcTVXUXJpS2RremprMFI1a0xPY2FaQUhJUVZ4Ny9SMnVpK29PUGph?=
 =?utf-8?B?OTV6N2xyMGYvbktXMExDOG5JeEFzYUl5dXBqWkEyK3ZuQ2tKbXJVTmRZQng0?=
 =?utf-8?B?Nlo4T0xvdVR0YTNNS0xkR0RNcnRxQ3RwN1d6cmFkTEN6dmRPYzFkZGRSWXNV?=
 =?utf-8?B?b2I2ajgrWG85MlpNdzZtKzhIanRVTU9jQ0pGSnZHdGdDUm05Q3cyd0dIYmNG?=
 =?utf-8?B?MUt5WGFOVzM2SGJuQldoek9GbE43L2R3VS9VWVhwZGJLZ0FrUGJJRS9ENEhP?=
 =?utf-8?B?d1hJTGtPNlJ5UzY3bGZmZGI4bU96TXVVSGhFK0kyQXozS2pjWCt4b1dISCtv?=
 =?utf-8?B?dTJQTTZHSExUakFFa0VDbjN5ZS8rMGQ3OHBRWm1JbWRNWEdvQ0xuZEdBS0hs?=
 =?utf-8?B?NjJ6MjNIL3pRNlM2Y2M1SXFiM3A5OTRaTFF3Y3F0M1phVU90cThnaWRLbTdi?=
 =?utf-8?B?cFVqV3h4NEJ0LzB1cDZuelY4Ykl6RVhqeTJrWmVUbDUwblNCcE9TMlBaVWxj?=
 =?utf-8?B?ODJWSnB5YmhRbEhVTnd5WjRZdHFXZG1QZmNjQXBndHBsZFVGSVB2SmJ5U0RN?=
 =?utf-8?B?ZGd4R1dDVHNWc2x6b056SXdmcnhqUFpieG9FT1luOUFJTXhldDFiVjZCUU12?=
 =?utf-8?B?UmU3OTVQS0hCL2c4ZFRQYVZWSS9MalllQUVDSTlZY3A1STBlUDdvalMyVHBY?=
 =?utf-8?Q?vnw50gztLl5O1aNkEmWI8BRo+1N2CJqvNKRHg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR02MB6863.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d93845a8-ce0d-4dd7-c195-08df265dff4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 23:35:26.6719
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7164

RnJvbTogSsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPiBTZW50OiBUaHVyc2RheSwgT2N0
b2JlciA4LCAyMDI2IDY6MTUgQU0NCj4gDQo+IE9uIDA4LjEwLjI2IDE0OjUxLCBLb25zdGFudGlu
IFJ5YWJpdHNldiB3cm90ZToNCj4gPiBUSEUgUkVTVCBtYXRjaGVzIGV2ZXJ5IGZpbGUgaW4gdGhl
IHRyZWUgdmlhICJGOiAqIiBhbmQgIkY6ICovIiwgc28NCj4gPiBnZXRfbWFpbnRhaW5lci5wbCBj
dXJyZW50bHkgYWRkcyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnIHRvIGV2ZXJ5DQo+ID4g
cGF0Y2gsIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciB0aGUgdG91Y2hlZCBmaWxlcyBhbHJlYWR5IGJl
bG9uZyB0byBhDQo+ID4gc3Vic3lzdGVtIHdpdGggaXRzIG93biBtYWlsaW5nIGxpc3QuDQo+ID4N
Cj4gPiBPbmx5IGFkZCBUSEUgUkVTVCBmb3IgYSBmaWxlIHdoZW4gbm8gb3RoZXIgbWF0Y2hpbmcg
c2VjdGlvbiBwcm92aWRlcyBhDQo+ID4gbWFpbGluZyBsaXN0IGZvciBpdC4gRmlsZXMgdGhhdCBt
YXRjaCBubyBzZWN0aW9uLCBvciBvbmx5IHNlY3Rpb25zDQo+ID4gd2l0aG91dCBhbiBMOiBlbnRy
eSwgc3RpbGwgZmFsbCBiYWNrIHRvIFRIRSBSRVNULCBzbyBldmVyeSBwYXRjaCBrZWVwcw0KPiA+
IHJlYWNoaW5nIGF0IGxlYXN0IG9uZSBwdWJsaWMgbGlzdC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEtvbnN0YW50aW4gUnlhYml0c2V2IDxrb25zdGFudGluQGxpbnV4Zm91bmRhdGlvbi5vcmc+
DQo+ID4gLS0tDQo+ID4gTEtNTCBoYXMgYmVjb21lIG1vc3RseSBhIGZpcmVob3NlIG9mIHBhdGNo
ZXMgdGhhdCBhcmUgYWxyZWFkeSBnb2luZyB0byBhDQo+ID4gc3Vic3lzdGVtIGxpc3QuIFRoZSBy
ZWFzb24gaXMgVEhFIFJFU1Q6IGl0IG1hdGNoZXMgZXZlcnkgZmlsZSBpbiB0aGUNCj4gPiB0cmVl
LCBzbyBnZXRfbWFpbnRhaW5lci5wbCBhZGRzIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcg
dG8gZXZlcnkNCj4gPiBzaW5nbGUgcGF0Y2guIER1cmluZyB0aGUgd2VlayBvZiBPY3QgMS03LCAy
MDI2Og0KPiA+DQo+ID4gICAgLSBMS01MIGNhcnJpZWQgMTMsNjQxIG1lc3NhZ2VzICh+MSw5NTAv
ZGF5KSwgOTAlIG9mIHdoaWNoIHdlcmUgYWxzbw0KPiA+ICAgICAgc2VudCB0byBhdCBsZWFzdCBv
bmUgb3RoZXIgbGlzdDsNCj4gPiAgICAtIHdpdGggfjIsMTAwIHN1YnNjcmliZXJzLCB0aGF0IGlz
IGFib3V0IDI5IG1pbGxpb24gZGVsaXZlcmllcyBwZXINCj4gPiAgICAgIHdlZWsgZm9yIExLTUwg
YWxvbmUuDQo+ID4NCj4gPiBUaGlzIGlzc3VlIGNhbWUgdXAgZHVyaW5nIHRoZSAyMDI2IE1haW50
YWluZXIgU3VtbWl0IGFuZCB0aGUgY29uc2Vuc3VzDQo+ID4gd2FzIHRoYXQgImFsd2F5cyBpbmNs
dWRlIGxpbnV4LWtlcm5lbCBmb3IgZXZlcnkgcGF0Y2giIHdhcyBuZXZlciB0aGUNCj4gPiBpbnRl
bnQuDQo+ID4NCj4gPiBUaGlzIHBhdGNoIG1ha2VzIFRIRSBSRVNUIGEgZmFsbGJhY2sgYXMgaW5p
dGlhbGx5IGludGVuZGVkOiBpdCBpcyBvbmx5DQo+ID4gYWRkZWQgZm9yIGEgZmlsZSB3aGVuIG5v
IG90aGVyIG1hdGNoaW5nIE1BSU5UQUlORVJTIHNlY3Rpb24gcHJvdmlkZXMgYQ0KPiA+IG1haWxp
bmcgbGlzdCBmb3IgaXQuDQo+IA0KPiBIbW0sIGZvciBtZSB0aGlzIHdpbGwgYmUgYSBtYWpvciBw
cm9ibGVtLg0KPiANCj4gQXMgdGhlIFhlbiBjb2RlIG1haW50YWluZXIgSSBoYXZlIHN0dW1ibGVk
IG92ZXIgcHJvYmxlbWF0aWMgcGF0Y2hlcyB3aGljaA0KPiB3ZXJlIE5PVCBzZW50IHRvIHg4NiBv
ciB4ZW4gTUwgc2V2ZXJhbCB0aW1lcywgd2hpY2ggbWFkZSBpdCBwb3NzaWJsZSB0byBjYXRjaA0K
PiBwb3RlbnRpYWwgcmVncmVzc2lvbnMgZWFybHkuDQo+IA0KPiBIYXZpbmcgdG8gc3Vic2NyaWJl
IHRvIGVhY2ggcG90ZW50aWFsbHkgaW50ZXJlc3RpbmcgTUwgKG9yIHVzaW5nIGtvcmdhbG9yZSBv
bg0KPiB0aG9zZSkgd291bGQgbm90IGJlIG15IHByZWZlcnJlZCB3b3JrZmxvdy4NCg0KKzEgZm9y
IG1lLiBJIHNjYW4gdGhlIGZ1bGwgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZyBsaXN0IGxv
b2tpbmcgZm9yDQppbnRlcmVzdGluZyBpdGVtcyB0aGF0IG1pZ2h0IGFmZmVjdCBMaW51eCBndWVz
dHMgcnVubmluZyBvbiBIeXBlci1WLg0KSHlwZXItViBjYW4gYmUgYSBsaXR0bGUgcXVpcmt5IGFz
IGEgaG9zdCwgYW5kIGJlaW5nIGFibGUgdG8gdGVzdCBwcm9wb3NlZA0KTGludXggY2hhbmdlcyBl
YXJseSBoZWxwcyBoZWFkIG9mZiByZWdyZXNzaW9ucy4NCg0KTWljaGFlbA0KDQo+IA0KPiBUaGlz
IGlzbid0IGEgTkFDSywgYnV0IG1heWJlIHRoZXJlIGFyZSBvdGhlcnMgd2l0aCBzaW1pbGFyIGlu
dGVyZXN0cy9wcm9ibGVtcy4NCj4gDQo+IE9yIGlzIGtvcmdhbG9yZSBjYXBhYmxlIG9mIHB1bGxp
bmcgQUxMIGtlcm5lbCByZWxhdGVkIG1haWxzIHdpdGhvdXQgaGF2aW5nIHRvDQo+IHNwZWxsIG91
dCB0aGUgTUxzIGV4cGxpY2l0bHk/DQo+IA0KPiANCj4gSnVlcmdlbg0K
