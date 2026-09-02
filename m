Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022137.outbound.protection.outlook.com [40.107.75.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41A730149F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337091; cv=fail; b=VKowz81HlUDtbfH1yZRx6qAd6zmitSAxi+sXSTfII31mA44SAy+xPdX8Bj8Co605R1E/4oTPe6kX/AW/FpqA+z4nbIr015/IoqtWdPSQIn5OYfN+AyTEnCZwAM0sIgYyozVnes2Z/HCuIoPDFEKJGkMkUVp0V/crtzACkMm1MNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337091; c=relaxed/simple;
	bh=w41HdG4iW0iGFcSkbnV6pGKIs6mbwqOtF6t6qdrZvt0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NLxP/eVtr3+il29RqpwPyd6pFnUasJQ3RGoXbKgTpJP9S2kP95VkLADfPu9kjxfYTyMV4VZVPrFaXurSdZBT31r47NUqwDfWw3v6zeQMdMKO6PRvv4mghP9YvmBL/iCbPx/uYuffxsv45jOdlmUS3dvY46hkbgwIWrSmG1u3ako=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=transsion.com; spf=pass smtp.mailfrom=transsion.com; dkim=pass (1024-bit key) header.d=transsion.com header.i=@transsion.com header.b=Dj7JjGzc; arc=fail smtp.client-ip=40.107.75.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=transsion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=transsion.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=transsion.com header.i=@transsion.com header.b="Dj7JjGzc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eA6KPrJo9SvEZBlzYnghfDbKF2llMqJRCojYrR2BOIex8CzJ/PPc1+jgY3KKQsmtYPXgXJ1k9+RBs4S8Z0/zP7/G9e3zLObxlKUSoZI+2hHC2PN/Jp0ZTqUwxq109tvItYEJRL03rhKGPTbfuqm/W1QRpSP9Htrq3hmt/1dOlPsokhvYIxxNePMfunJhB2GLTjKmYEYryGmktWjeeu7WKXcpIja8rwbmBlA9ckZdp4blt8+TQFs0szKgSluYJkNvAlpddTLDGYjkHN1UaRpoVAnQd3H0IaGM7keDTjBL/BqAVFpL2vH46SY++XRHYRmtkcHm/5XesJQbmN8Z+bsJOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w41HdG4iW0iGFcSkbnV6pGKIs6mbwqOtF6t6qdrZvt0=;
 b=S4k4wDN8ZPcsLGUgcdK5RlS5FRWFEl1SR32U+eDh59Le4dfwG7Djgxi96AWYYt63Dz0tCAnSj0tUo02weW78ocMhXy3DSdmWdT4PuFR6eMgKIK1I7b14WOtA8ruuI5eHnX398A1b0njWkvshcxXP9V5rl+FVNWOqUfDSYmEE2lqdzeofNub8D7/a3CND1gmrf/G0GnDjHHbcO2fJyCQ5Gh1ybPjt1XJN+MmNVqiFBngVQKisYdXPvdDLHBBBnXY+0/LhVgMfsPLhCf2funFjxO5ieo0bAI+ni5nNZ4pcZIa9doPUJbcOREPqCbhmmxIolyalDJsLdF3L8yJqMidUtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=transsion.com; dmarc=pass action=none
 header.from=transsion.com; dkim=pass header.d=transsion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=transsion.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w41HdG4iW0iGFcSkbnV6pGKIs6mbwqOtF6t6qdrZvt0=;
 b=Dj7JjGzci3e6G30XtS4VJf1v3vzRmrnLhbD1cZ9ENaihCQ2bBD/PdqYQygqT2eYFBrN+MdoSi96/hHyhHKiLwuli6ECLCH244aLtd7ItZwkKvD1tw7v0alqHcXdStAaMTJgwV9kfhYBz7OXx/z+HlChnkpWME9CoBZo3PwL7Guc=
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 (2603:1096:820:c7::13) by OSQPR04MB7873.apcprd04.prod.outlook.com
 (2603:1096:604:29c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 08:18:06 +0000
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3]) by KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3%3]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 08:18:04 +0000
From: Hongyan Xia <hongyan.xia@transsion.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Jiazi Li
	<jiazi.li@transsion.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] sched: Move some scheduler fields to new static
 branch API
Thread-Topic: [PATCH RESEND] sched: Move some scheduler fields to new static
 branch API
Thread-Index: AQHdL7IUjAwk514CTkuiOmYMCHi/b7alDosAgAAFbYCAAAa0gIAV7NqA
Date: Wed, 2 Sep 2026 08:18:04 +0000
Message-ID: <b61b830d-4c6f-4c35-8b8c-1adc4340aaed@transsion.com>
References: <20260819080932.11564-1-hongyan.xia@transsion.com>
 <20260819084438.GG1247881@noisy.programming.kicks-ass.net>
 <c29c0e12-8e31-477b-b9ae-162632bf1cfb@transsion.com>
 <20260819092803.GH1247881@noisy.programming.kicks-ass.net>
In-Reply-To: <20260819092803.GH1247881@noisy.programming.kicks-ass.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=transsion.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0401MB6196:EE_|OSQPR04MB7873:EE_
x-ms-office365-filtering-correlation-id: 0cb178b2-5571-418b-8f70-08df08cab67c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|10067099003|3023799007|6133799003|18002099003|22082099003|4143699003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info:
 IaOKAoeBCT36SldRdjRLXPjIVCoWQHr53Lpeo0O7L4YM8hOAMWX3a0Q+6jdSNJTM3IJgSEKWXU55baZvY1VPBQfGiYLyEIj4YXEJpR6i5gzM2RH00gNpBa6YqNHyCPh0TMEwsG9ZZxK/dxURlPIktruUBkNvhiXM3mJ0p7se4MYoNNj93JU0xP3i6gsxA+895e83rRm+tbb3CBpKp4ahYMAkKXUYOo+iT0Q8VISPBEbbRc6rDW0ifAkVKtR0XE87rxG4aN9FpffoNHoGTGRmAA//8hriyHizFoFb1SW+/LAb8/BdwT3sfI8CIlF51lVDbkSaA7E/9LXr0gMQOW6aCPUlCu2+U8udDZ7BZgOwr6fartx2TvKEo8u6kGNW5wLYo24v6t4CSmnU/F5RRMt4Yi2Jmwk9zh2H6jpC5fCeoGJ5VrDvbbnbhCrNJDI2eML+9eAfFsipr/r/ci0hsWTx1VDPazpBi+vcUEDBgj9ixlBTp/of/7Q7ZnyLgWAmuFplbrPhxTh3U7E1m8ZK8Df1XKQ/Dkw7FiCZhku2GId8eVCnq+ySp5Jv51duniHyEnEKiQg65+gVObBc5pBUJfBuAkRg/B32W+FBbqbii+WF0vNpulxRIHTCU6S9nnhonersmqaeGXtjbNfUg+PFNWWRfolkvDAfdIXGlmL/06NkuCxo9DQEahh1AUXoMycqdiiV/LNgy5hd29HpgxxCd84SSpKS78EIrhxAInd98v7JWX8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0401MB6196.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(10067099003)(3023799007)(6133799003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MHFPVVpmQ0ZDNUd3ZkxlRnpjdWNRNFU3NVdwb0VVT3BzUElyanIyNWp6bk9q?=
 =?utf-8?B?UGtUOFU2UWpNVGs3OFhrQklQNGZ1ZEJNNmVVOVhXaUg5d2xQL3BTcVlxdFEy?=
 =?utf-8?B?T2VRVTJ6SE9aU2FVRWtxSzV1RmJzM2pSdnZjZ0Y1bzhlL0hRVGl2V2hoTG0v?=
 =?utf-8?B?WTVMYmlGUG1IaTY3bnJjT0F1QWlvdlRLdXE2clFUVHZRMVcrMmpON3czWGZ0?=
 =?utf-8?B?eFlrREZ0c2NHTE01angzSGFJWmNNWFpZVlVlL08vaTJBUkdiOG42aDhGY2hh?=
 =?utf-8?B?N2NUR2ZnbVkybkZ0bUhQYjBCbVRRUERyTUQvMG55MTRyNkhtbDBieFlMNTBa?=
 =?utf-8?B?WjNXY0oyRHBxWGdiZFppc0hxSVVkcFpCdUhLd0VGRzlBWkI0SWF5TGlUTE1O?=
 =?utf-8?B?Sjd4K0hnRVUzS1VlSk1IZjg3bGx2OHF4dFVaUDhtV3k4dnJReVpBbkFoQjc4?=
 =?utf-8?B?RWpJdnZLaytWenBYN0t6VjkwTE5JRjE1cmYvRTFGWDc2MUVvM3NTOXhQbitP?=
 =?utf-8?B?WEMxVzc0Z3l2L3ZOVThtM0pYaGhOQWFIOEtsOVJUQnhBMENuMjVwS3Q2QlVy?=
 =?utf-8?B?eE5iSVlab3Y2V1FwVGNqZWhFYXBnZ0pYZlYwOFp5eW1idVFKZE1LZEJBQ3ZB?=
 =?utf-8?B?eWEvRWZFUFBKN1dwSXJBaXJYWkh6azlVazVDdmxpeFgxUkdqZGFRd1ZaTVRa?=
 =?utf-8?B?aXNvOS9WQlBHTFBmTThzMzJvUThZR0Y2alBVZjVwUHN4SC9WUmNEYUhBS25o?=
 =?utf-8?B?THVVakNndmtnWjhhV0UwcURoa0lVckFqT21paXZLampaa0FYdnAzb3dVSkxF?=
 =?utf-8?B?RXdwYU1zbDFmTnNKYTlYT2h1eUJLOTlaWWdNU21OeDRSMjd4ZC9SK0JaL2VH?=
 =?utf-8?B?WjE0QTFGdDlDVll6bTQ5V1R5V0FnUlpPMGdtWWNSTHlSaHU5MW5vTG5XZHVR?=
 =?utf-8?B?QzArVExtZlFncUdxYjJ1ZkNxaXFWa2VRS1R1Y2RWenNnbzUxdGtFUHJQdGVn?=
 =?utf-8?B?QUg1MHBFY01tWGFqNzVsRG5aeXlpUlRjR01LTlRpR3J2ZU1obEdEU3ZpOTcw?=
 =?utf-8?B?MVZTS2cxd0h5dUVRVk9VbmtsbjFFTm01OUJWa25icDVJeGhMSEZxSXRob3Vj?=
 =?utf-8?B?dEdvSmsvT0o3bjRGWWU5cCtSVU4rRXkzcktOeUkzTWhlUzdCdXR6S2xDUGQw?=
 =?utf-8?B?OHloNG03WUNqZ2ordlMzOXhocGVTVlpxNVI5c05HY2pjKzlSOSt3aTdqSXBD?=
 =?utf-8?B?eEcvUDZWRmVZMkdzUkxWamlqQnlPaitPa3NSRVBGODFpN2xiNkI1YmZ5SFFE?=
 =?utf-8?B?U1cxSkFQak5adTR0Vmd0Nnc3aStzME5qWFVjWFBrc2dnVXhRZ2FOSE4zcDJy?=
 =?utf-8?B?U05tUzl0ZFdRTi9rNEdXdmExeEtVc000WE5kV3VyZHFjVEpENUtsL215V1RP?=
 =?utf-8?B?SHc1aTlQbWhxM2xIbGgxUnpDdmd0NWVYdDBBa1h1VTlGa1JkenZZRHBsc2Jz?=
 =?utf-8?B?RlBxNzByQ1VTdUFOZG9hWGE4R2NLWmt3NE1ZVHJZeERnTjlNeUdMM2lTNFpn?=
 =?utf-8?B?a3AxWXE1elBZYzRKZTBKMld1bXQ4eFE0Y0QvOFNZeWM2TjQrYi9lNWxtV2Ry?=
 =?utf-8?B?MUVvWUlDaHlXNzgxZGFGZ1dmMHYwMWR4eWRldVM3VDVsK1BCcTMzNHQzN2d1?=
 =?utf-8?B?VmtPQzhXWWFTWDM2Q1ppTlQyU2NKT2hSSFJhdnFqc0I3ZDJQOE9GMGtPYnNr?=
 =?utf-8?B?VllyOTIyYUd6L09wYklrT2djczhWc3ZkNlBxRkdNWWZOTDNkbFF6T3dXaS9M?=
 =?utf-8?B?eTNkQ2hoRitjS2FFZ0lValZ5RittUExuZWtUUDRPRjF1bk42VGdqTjlzOGVD?=
 =?utf-8?B?OVBMM2pscGREd1E0UlpnWDFFQ3JVMEwvYW92OTJQNENaVFFZa3htVHl5OHUr?=
 =?utf-8?B?Y2l2bk0xZHFXRTNiK2dGSXdPKzBOTENRSEsvQVBOM0xWcmlkY3lXdExRYnJq?=
 =?utf-8?B?clBaTVlOd3I3T2x5dHg0SkVubU0yK2g0Yzhkb0hxbWJUY25LSEJpTjNEenJy?=
 =?utf-8?B?S0N3clRMS2l3bDR4eGF2WFVzN2N6OG83bU9KcVY5UlJxU21iSTdKY01UZ2c4?=
 =?utf-8?B?dUpyRjhQU1o0c3BkMGRvbUJMbmQzY0duelBhM1EvektuN2RKaHRPNnNicTlF?=
 =?utf-8?B?Y01ibC9IQ1pQYmptMnRMSkFtTktqdEZYRXhxejArcG1jdzBFdkk5N08weG9s?=
 =?utf-8?B?MTNvNU5hZWVNbjVDNVFIK1dIOTRzUkJBUVp4YUppTS9vQTlRQ3JRN3pVWWl4?=
 =?utf-8?B?MUpyY24wdjdObkpEbTZiOGJ0UVdxdk85dzM4MHBMMDNXODVpc2haR1UzMytB?=
 =?utf-8?Q?NbEYFzyBakWgpbU8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <446018FA678E3F4782DE06CFAE2C9D3B@apcprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6196.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb178b2-5571-418b-8f70-08df08cab67c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 08:18:04.7747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T1jFL7NwgcZWYH0SzgKBIIoKgjJbcVl/p/AZvBzaOUj2WDdiVKLaGq1yu4LLXWqTAYVSBipyhxoRRJMmHN+tFJpy44/Iclp6dW4Gk+bw5Ms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR04MB7873

SGkgUGV0ZXIsDQoNCk9uIDgvMTkvMjAyNiA1OjI4IFBNLCBQZXRlciBaaWpsc3RyYSB3cm90ZToN
Cj4gT24gV2VkLCBBdWcgMTksIDIwMjYgYXQgMDk6MDQ6MDNBTSArMDAwMCwgSG9uZ3lhbiBYaWEg
d3JvdGU6DQo+PiBPbiA4LzE5LzIwMjYgNDo0NCBQTSwgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6DQo+
Pj4gT24gV2VkLCBBdWcgMTksIDIwMjYgYXQgMDg6MDk6MzhBTSArMDAwMCwgSG9uZ3lhbiBYaWEg
d3JvdGU6DQo+Pj4+IEZyb206IEhvbmd5YW4gWGlhIDxob25neWFuLnhpYUB0cmFuc3Npb24uY29t
Pg0KPj4+Pg0KPj4+PiBfX2Nmc19iYW5kd2lkdGhfdXNlZCB1c2VzIHN0cnVjdCBzdGF0aWNfa2V5
IGRpcmVjdGx5IHdoaWNoIGlzDQo+Pj4+IGRlcHJlY2F0ZWQuIEZpeC4NCj4+Pj4NCj4+Pj4gc2tf
ZHluYW1pY18qIHVzZXMgc3RhdGljX2tleV97ZW5hYmxlL2Rpc2FibGV9KCksIHdoaWNoIGFyZW4n
dCByZWFsbHkNCj4+Pj4gZGVwcmVjYXRlZCwgYnV0IHRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIG1v
dmUgdG8gdGhlIG5ldyBzdGF0aWNfYnJhbmNoXyoNCj4+Pj4gQVBJcyB0byBiZSBjb25zaXN0ZW50
Lg0KPj4+Pg0KPj4+PiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9m
Zi1ieTogSG9uZ3lhbiBYaWEgPGhvbmd5YW4ueGlhQHRyYW5zc2lvbi5jb20+DQo+Pj4+IC0tLQ0K
Pj4+DQo+Pj4gWW91ciBlbWFpbHMgYXJlIGVuY29kZWQgaW4gYSBNaWNyb3NvZnQgc3BlY2lhbCBx
dW90ZWQtcHJpbnRhYmxlIHRoYXQgbXkNCj4+PiBzY3JpcHRzIGRvbid0IGxpa2UuDQo+Pg0KPj4g
SG1tLCB0aGlzIHBhdGNoIHdhcyBzZW50IHRocm91Z2ggdGhlIG5vcm1hbCBnaXQgZm9ybWF0LXBh
dGNoIGFuZA0KPj4gc2VuZC1lbWFpbCBmbG93LCB3aGljaCBsb29rcyBva2F5IG9uIG15IGVuZCBh
bmQgdmlhIGxvcmUuIERvIHlvdSBoYXZlDQo+PiBtb3JlIGRldGFpbHMgc28gdGhhdCBJIGNhbiBk
ZWJ1ZyBhbmQgYXZvaWQgdHJpZ2dlcmluZyBmdXR1cmUgdW5oYXBwaW5lc3MNCj4+IGluIHlvdXIg
c2NyaXB0cz8NCj4gDQo+IEkgdGhpbmsgSSBmaXhlZCB0aGUgc2NyaXB0LiBCdXQgd2hhdCB0aGUg
dGhpbmcgZGlkIHdhcyBlbmNvZGUgJ1xuJyBhcw0KPiA9MEE9LiBUaGlzIGlzIHR3byB0b2tlbnM6
ICI9MEEiIGZvciB0aGUgJ1xuJyBhbmQgdGhlbiAiPSQiIGZvciBhDQo+IGNvbnRpbnVhdGlvbiBs
aW5lLg0KPiANCj4gSXQgZG9lcyB0aGlzIGZvciBldmVyeSBsaW5lLCBpbmNsdWRpbmcgdGhlIGxh
c3QgbGluZS4gTWFya2luZyB0aGUgbGFzdA0KPiBsaW5lIGFzIGhhdmluZyBhIGNvbnRpbnVhdGlv
biByZXN1bHRlZCBpbiBubyBvdXRwdXQsIGl0IHdvdWxkIGp1c3QgZWF0DQo+IHRoZSB3aG9sZSBt
ZXNzYWdlLg0KPiANCj4gTWFya2luZyB0aGUgbGFzdCBsaW5lIGFzIGhhdmluZyBhIGNvbnRpbnVh
dGlvbiBpcyB3ZWxsLCBib25rZXJzLiBCdXQgbXkNCj4gc2NyaXB0IHNob3VsZCBub3cgYmUgYWJs
ZSB0byBkZWFsIHdpdGggaXQuICBTdGlsbCwgcHJldHR5IGlkaW90aWMNCj4gYmVoYXZpb3VyIG9u
IHdob2V2ZXIgbWFuZ2xlZCB0aGF0Lg0KDQpXaGlsZSB3b3JraW5nIG9uIHRoZSBsYXRlc3Qgc2No
ZWQvY29yZSwgSSBub3RpY2VkIHR3byBvZiBteSBwYXRjaGVzDQoNCmQ5MmQxYTE4MmRjMmQ1ZGM1
ZTQ0MTg3NjU3MzlmNTZiY2JkZTgwNmEsIGFuZA0KMDg3YjQwZmU1OTM0ZTRiOGFhODBiMjliM2Rl
YmJkNjU0Mjc1NmZmZA0KDQpoYXZlIGJvdGggY2hhbmdlZCBteSBuYW1lIGludG8NCg0KQXV0aG9y
OiBIb25neWFuIFhpYSA9MEE9IDxob25neWFuLnhpYUB0cmFuc3Npb24uY29tPg0KDQpXaGlsZSA9
MEE9IGlzIGNlcnRhaW5seSBhIGN1dGUgbGFzdCBuYW1lLCBJIHdhbnQgdG8gYXNrIGlmIHRoaXMg
aGFzIA0KYW55dGhpbmcgdG8gZG8gd2l0aCB0aGUgT3V0bG9vayBmaXggeW91IG1lbnRpb25lZCBs
YXN0IHRpbWUuIElmIG5vdCwgDQpJJ2xsIHNlZSB3aGF0IGVsc2UgY291bGQgaGF2ZSBnb25lIHdy
b25nLg0K
