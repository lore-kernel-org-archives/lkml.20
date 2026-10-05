Received: from WA2P291CU004.outbound.protection.outlook.com (mail-polandcentralazolkn19012049.outbound.protection.outlook.com [52.103.53.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C5E4C33D2
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 16:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791217943; cv=fail; b=cJO0slYm1YITEvq+kKtHKZ7A/EA7OgKQPCZEiK8TkQEd/24ZGYI8uuLlo7SmbhFAxsNouo7w/Y/FnFHmlNTgI8agq0nhSf6ckFH/kpD2OlIeTAEhyUho3xI3Jn+O5l4FEh4KwuIWfmOdjTBiDJ+F56OhkPQSFgD7dJFmsw6DmjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791217943; c=relaxed/simple;
	bh=Y/MpQBVv7Bwj0D1Efk3C7g5EEkyP5jANtHxW4Nbh9LM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Lz23GBSZIAznb3KoXGUQseapinUn14lEI8D/h3d2ajlMGau8y961LSf3kC+i6WfZuz93Ef/xjJmp7ofISfx4i3soaCifMTX6VSFEseyfI6l1Abek1BoR0nEZXvesxEMJMG4+czwibcm53+SGOj716mdoVTk1k6XXTkQ1lxGXKR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=NPjsPqBf; arc=fail smtp.client-ip=52.103.53.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="NPjsPqBf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9GNQqhapXW4/JXaeZMo0jjXsGMHmpD7UnaZTRZZSSTKXc9co/JpGG+XdHirs9XHF54JDHoLPwocPptHHOh2tKOHIQ0ToW/xRaEkhasei6N1nbphTbznlmmqYsoJUXVHc3KZNHypxVp2jM4uZcZyzRLDU9BogXg6NrOVu47MX2PtQ3mzDRRZ7A87O+7Nz43K2nqmqk9VZjSbL8D56f34DWgyKxCz+8hxgKqvhJT7nK+msT7xY6Pzp1UkkViT+q5zR9G4ffYebSCKCLqtN9O6jS7R5K2bVITQ1erjEbzU/7TsfxIpNkqh9as9AG4W0ImmZtY40hc8VNaoINB8agNo3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/MpQBVv7Bwj0D1Efk3C7g5EEkyP5jANtHxW4Nbh9LM=;
 b=i/70tETQe+dj5P9Fz7nTVFoasYNPM0p4v0vQWj7C5WW2XevpueW6hsi+EzcaiHUoBcyvpmQ/9nYXPKZQy780uBzDByC/+0s6YfutZaT8DhCuKTjmVOaz9wJHaxT9FxQqXkHxXOZLYsB3jBPdxcL4kPyyefbxG8VvviPOBlvlstHRr8hKocdUMefZbobovaC0ELmxaSmDVFuwSZfDDLZAHUatpMqVTys1Jw+vKs/FSmypax0SH2oiP0xMQi+rOAJLLtqpEQiYfNpPGaOmvm88xptwc+IiH7nxGvnzcjwuCn1/GCn7HryDTGMI9qxBaRYerulIMko8JLnWAGZ8b340nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/MpQBVv7Bwj0D1Efk3C7g5EEkyP5jANtHxW4Nbh9LM=;
 b=NPjsPqBfxuehQyreycy4by5ziB6+9cgl/04X3L3e+r0NXit6e/ZlABqMXVRsUy7BV+tnfzRPuKHZmoATRGoJjVc/CuAL7M4fRJbQHfSN/ijw5PCl5y9wDxAnmZvOBr0v7aZD46bFKGHeaSX+6kyVKgtb1keynS1IdxIzZtTrSmOhCKo79dY9qKcyH4+t+jiI2QIM+qmZrk7ykvTxI5GoHwEIt6gRDeyPi1+55QEKSOqKr+g2AEFE/WqnBBhMlpxufLE9Tm53YP/cHJKpugQmxY069wDhJKGb/4XT6xS3pOgw1N9HsBW2VEmqR3k+ChIO9qZPrRHokLbTnb0xdniA8A==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA0P291MB101427.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:43::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 16:32:19 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 16:32:19 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>
CC: "hpa@zytor.com" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?=
	<habilerenturker@hotmail.com>
Subject: [PATCH v2 1/2] x86/apic: Replace deprecated simple_strtol() with
 sscanf() for robust parsing
Thread-Topic: [PATCH v2 1/2] x86/apic: Replace deprecated simple_strtol() with
 sscanf() for robust parsing
Thread-Index: AQHdVOcXqaAK1kP7lkytnI7KQi3r1Q==
Date: Mon, 5 Oct 2026 16:32:19 +0000
Message-ID: <20261005163213.6515-2-habilerenturker@hotmail.com>
References: <20261005163213.6515-1-habilerenturker@hotmail.com>
In-Reply-To: <20261005163213.6515-1-habilerenturker@hotmail.com>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA0P291MB101427:EE_
x-ms-office365-filtering-correlation-id: 78fcc68d-34a0-4215-9c21-08df22fe39d1
x-microsoft-antispam:
 BCL:0;ARA:14566002|55001999006|8060799015|19110799012|8062599012|31061999003|12121999013|41001999006|24021099003|38102599003|15080799012|25010399006|51005399006|40105399003|2607281247196008|102099032|3412199025|440099028|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?RlRjeDgvUEUwREZSREJkeEZabkhueUxENENMOVptNmw5MjAwSE1HSUNMWXZN?=
 =?utf-8?B?TkF0US9qc0J2RjYrSjhFUm9sT2xLSXpRcjRPdGszQnlrZlFGeG9rSWd5Mmho?=
 =?utf-8?B?WEhDNWw1WFd3SVN2OWpqaGpXMVNwTXNPVTRCbWh2ZjBlNXZNUUdGQnQzUnR0?=
 =?utf-8?B?K1pXeUJGa0RtRWFqaWFMMW1oeDUyTk94Vmg1aFd1WUVnUEVtVVNCY1lEc1cx?=
 =?utf-8?B?bGYxb1JmWUpPY2orYzFCdnIzbnNleVVtdy8zS2tTUDQ1SExGWGo0WVF6bk9w?=
 =?utf-8?B?NU9rYzdaUm5MRkVVa1dJNDBKWWRkVjJLTFlZMk1Qblh4UjkwRkN6M0RrMHF5?=
 =?utf-8?B?dXVtbjJBYk11aGNKVmhHaXFsVGZJL1psOGYwOEp5b2kxbzRQQVJlTURKclBm?=
 =?utf-8?B?bGxzUzAwZjZhSllFeUJLT2ZKemcvaU9YYXlaYllkakNXWEwvd1hxNnkvMS9D?=
 =?utf-8?B?UGFSeWhoc3JNb2JQMjc4OUJ6WnFKZFN6d2hESjJ2K2J6OUJXQ3ByZ0h6a1NC?=
 =?utf-8?B?Q1Fka0lEaCtuL1N6THNHVlVUbWkvSk1oZG1aRUFDN0ovdGFEWTFHSHlWWlIr?=
 =?utf-8?B?UXl2TlNPaEZyTlhWbjBva205ckY4dzZjT01VMFhqNTJFWXk4R3lPUDZtN25P?=
 =?utf-8?B?RWFWWUNZNGJ6TzhjT2x6bW5WektyQ3MxbzlJUGdpNVAwRDZxcUcwTGdpNHk1?=
 =?utf-8?B?dWwxS0lXN2l0ZlhYMmxYYzdwSXBabjBOV2pJWVNNOVZ4VjlNTFJiTDdjNEVa?=
 =?utf-8?B?TEpBL3V6SXZSRkJTakFCb2lrYlNjSkthNlhnMEQvd290OFNnSEg0aGQzRWZL?=
 =?utf-8?B?UmN3YlQ3cWRvRlhQVjJsYVVKUVRYbmZqNGh3RURPdytBWWpUeTZKUnFlZGF5?=
 =?utf-8?B?Tm9ZU3ViYkg3em1keENTVVVSdDhuL2NXTFBUV1JpNE5tL3R0RWdoOW0zREVv?=
 =?utf-8?B?RXNCZWZuVXVuVXNTYWdaRXBLelFhM0t1MUdENE9UQm9tVHlKM05ZS3ZKa0dk?=
 =?utf-8?B?Tk1Yc3NjUzV3VEJOeDVTQmMvSEpoUVF4VGlOODdVTmVSVUxIOVdkbElYdldR?=
 =?utf-8?B?dUpCTVpLWmZKN2t1bHVVU09zK2lNQjBYUks3OE1kWXFwVi8yUW01dHBzbE1C?=
 =?utf-8?B?TG96MzUvbk9oN3ZTOVNlYWtOYXJCb3d5SW1lRUtOUUI0U3BmaFNXL0I4NEVR?=
 =?utf-8?B?MmYvR2g0TUVFa0QwNVNNVlBGR1dhTUhBSVpTbmlWbFhaakhWcFBITGpwM3dq?=
 =?utf-8?B?NGxxSkZEb1B2U2pTWk1tY3BKeXdLbStOak41Q1FtamREN1J5RURQSUVWWHhy?=
 =?utf-8?B?UWMrbUJZekhiWEZuSktyN2Fla2FSdEhiZlRVb0h2djcweHlJWUJPY2pBZXFy?=
 =?utf-8?B?cmxRUkt5R3JsSzh0dmovZXN1ZlZLalBoZ04vcXY0cmVFRVJETVlMUVovTk5P?=
 =?utf-8?B?SjFYdjdicmsxa3dKcXlNZFVxbU0yUWdQeGtlczRHcjcwWUdGcHpIekVCTmQ4?=
 =?utf-8?Q?chGA3o=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z0dUVDV2czRkRzd2SkM5dUxDcTd3NlExY2U5TEpDd0d3RjdjbGpweTZ3c2dY?=
 =?utf-8?B?cFVGSW1ZeVB2bkhpVDZOVzFxQkhYc0crOE9ueEJta3oxT3NJaWFHQUdrRk9X?=
 =?utf-8?B?RmF3NW1oUkEyQkY0ZnRDUWM0MTBlNDVIQUN5cDZnODFmZGpXZTg0UVVic2hn?=
 =?utf-8?B?akJQRDMxUG1MM2pyLzRla05XbWlZbTZzZU1QR2hia2FhYVNuL05lRmZkNUR6?=
 =?utf-8?B?V1cvdTZiMlVaUVZYUXhTZHQzUHVOR3dkVWszVEZFUmdVNzRLTkVZcGlLRHl5?=
 =?utf-8?B?S0VRRmhMblh0YndVMlp1a3N0ZlVFcXQrWlRMZTFpK3JVQ2hUb0ZCSnZMUTcz?=
 =?utf-8?B?RVlDdGpOS0JaYWZmellkZVVSMkJHZUQ2QTF1d0RxQmRibXlKZlovamxNeDd2?=
 =?utf-8?B?MTVSMlM3S0MzWTFNOHh0WEdEazQyTzlXVGo1TWQ5Y1VpOG5ucS9kQ2xrTTNm?=
 =?utf-8?B?N3RKR2pDUTNMOWtUWjZaaE90b1A1UWcxNzFweXAxTlhjSlU3NzhwRlYwL3A5?=
 =?utf-8?B?Y3JrdW5JcmFGakFUZFNTQ1oxK21IWnpDYWhMVmVBUkR5V0toTlE4SENwbjRj?=
 =?utf-8?B?QXZLWFVxZzhNcWJWbFV0S0s1Tytob0xaT2hrZ2pyeXU4VXY5Zndid3BTem5T?=
 =?utf-8?B?bnF3TzBmQW1ibHFEUU0zTHZKbUN0d21Wd0Q3cGJoYU9DdUkzYjlJVGNtN2VY?=
 =?utf-8?B?NGZ5a29tTmlMRDdsbzdEVHhjY3FXd0o0T1JRTEhOZGtjaXhxb2hDaFpNV2tG?=
 =?utf-8?B?emNnVEwxUTRGaURKTnA2SkhFblU5eXdGZmVzbFU2cFBwdzFNSUZ6NTVZNXl0?=
 =?utf-8?B?aDYxZ2dUdmdxYUZXT0VHUXFlSkJRMktQcSt0ZjF3Q1ZnQ0hnak9CQ3RBM0RS?=
 =?utf-8?B?UjZ4bnFaeWNiRUJBKzcxa3R0NExyekFwT1ZVc2ZNTUYvbVhZanRZK3dEYWRh?=
 =?utf-8?B?Y29kVUl2dmE2ZEd3STJJRStpc2tNeW42YVJ0QWY4MFR1aUpCZnh3cm1sSHBP?=
 =?utf-8?B?MkF0em9FQllEU1pyZVNnUWVadzBHWExRZ3RCMUZaTG54WXJUVXJqczNZU1cx?=
 =?utf-8?B?ZWhveU9rSDFZK3dBem1nWVhSL0hmallGYjByZ1hoNXM4Y1QwUm5nS2pMR1lC?=
 =?utf-8?B?U2p0dmtDV1BQM0hhQzYxN1FYYnpBOEsxMVl1bVUrSFp6cVFLRmNKOVNmd2d2?=
 =?utf-8?B?ZHhqTEhCeXpxNVVWZGFLSHdOa1Y5aDVjeFN6Q1FvWUZOZkNyV2hBbFkzOHRo?=
 =?utf-8?B?eVVidkhnVTdHQzBxMEFVUHY0MUoxRDlzeFI4Y3JPekc5NG1DaFlOU3htQTBr?=
 =?utf-8?B?azBiWU5OOUhGV043KzRWNjVtWmUxbGNHV1dTVWo1VTRnam40SFhOeSsvNzNs?=
 =?utf-8?B?REFtZGRmczdmMjltallGNGhwTXh1Q1RWZmR0OHhRb2treXUzS29iVTFwb2lB?=
 =?utf-8?B?dzVvVjFGd1NUQjB2TnlneCtZRVhoRWs5WlBCWnJUbnBPZXdjT0c3NTlVaitY?=
 =?utf-8?B?MHh1aXU2dm9RbXdRdHowc0R3VzZTNzc0SzdhdzZXY2FXTjR2a2VXRDdaVzNp?=
 =?utf-8?B?MDJRZ2FXVDdoVEE5L202TGkwRG1aUUt4UmpySm8vTG5WVU16d3JTVVliNHpY?=
 =?utf-8?B?Q0cwTDMxVHlwS1RkaE4xdTdmNTgyQWxVcDh3YUtBSkJvRTFKMk5Wd2dKc3hI?=
 =?utf-8?B?Wi9xblo1VEo2ekxET2FwbHpvQndxTVpRdjJid2NNWVVCamFpRnJSVjFpWmZa?=
 =?utf-8?B?L1RaN2RueW9BalloaXVhb1g5RjNJSHlxajJYMW42dWc3N2czcXlNU0dObk85?=
 =?utf-8?B?d253OEI1dVZKTUdHcmJQRE05OWM1M3pNOVhhNGJNb3VwTzJ5SkdGdUxrckR3?=
 =?utf-8?Q?fIf9az6MH9DIQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <37245E6A05B8F048937615D337E343AF@POLP291.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 78fcc68d-34a0-4215-9c21-08df22fe39d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 16:32:19.6947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA0P291MB101427

VGhlIHNpbXBsZV9zdHJ0b2woKSBmdW5jdGlvbiBpcyBkZXByZWNhdGVkIGJlY2F1c2UgaXQgZXhw
bGljaXRseSBpZ25vcmVzCm92ZXJmbG93cy4gUmVwbGFjZSBpdCB3aXRoIHNzY2FuZigpIGZvciBw
cm9wZXIgY2hlY2sgCmluIHg4Nl9md3NwZWNfaXNfaW9hcGljLgoKSXQgd2FzIGRldGVjdGVkIHdo
aWxlIHJ1bm5pbmcgYSBzdGF0aWMgYW5hbHlzaXMgb24gdGhlIHVzZSBvZgpzaW1wbGVfc3RydG9s
KCkgaW4gdGhlIGtlcm5lbC4KClNpZ25lZC1vZmYtYnk6IEhhYmlsIEVyZW4gVMO8cmtlciA8aGFi
aWxlcmVudHVya2VyQGhvdG1haWwuY29tPgotLS0KIGFyY2gveDg2L2tlcm5lbC9hcGljL3ZlY3Rv
ci5jIHwgMTMgKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva2VybmVsL2FwaWMvdmVjdG9y
LmMgYi9hcmNoL3g4Ni9rZXJuZWwvYXBpYy92ZWN0b3IuYwppbmRleCBiZGRjNTQ0NjUuLjFhMzBi
NDdjNSAxMDA2NDQKLS0tIGEvYXJjaC94ODYva2VybmVsL2FwaWMvdmVjdG9yLmMKKysrIGIvYXJj
aC94ODYva2VybmVsL2FwaWMvdmVjdG9yLmMKQEAgLTY2MywxNCArNjYzLDIxIEBAIHN0YXRpYyB2
b2lkIHg4Nl92ZWN0b3JfZGVidWdfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHN0cnVjdCBpcnFf
ZG9tYWluICpkLAogCiBpbnQgeDg2X2Z3c3BlY19pc19pb2FwaWMoc3RydWN0IGlycV9md3NwZWMg
KmZ3c3BlYykKIHsKKwljb25zdCBjaGFyICpmd25hbWU7CisJdW5zaWduZWQgaW50IHZhbDsKKwog
CWlmIChmd3NwZWMtPnBhcmFtX2NvdW50ICE9IDEpCiAJCXJldHVybiAwOwogCiAJaWYgKGlzX2Z3
bm9kZV9pcnFjaGlwKGZ3c3BlYy0+Zndub2RlKSkgewotCQljb25zdCBjaGFyICpmd25hbWUgPSBm
d25vZGVfZ2V0X25hbWUoZndzcGVjLT5md25vZGUpOwotCQlyZXR1cm4gZnduYW1lICYmICFzdHJu
Y21wKGZ3bmFtZSwgIklPLUFQSUMtIiwgOCkgJiYKLQkJCXNpbXBsZV9zdHJ0b2woZnduYW1lKzgs
IE5VTEwsIDEwKSA9PSBmd3NwZWMtPnBhcmFtWzBdOworCQlmd25hbWUgPSBmd25vZGVfZ2V0X25h
bWUoZndzcGVjLT5md25vZGUpOworCisJCWlmIChmd25hbWUgJiYgc3NjYW5mKGZ3bmFtZSwgIklP
LUFQSUMtJXUiLCAmdmFsKSA9PSAxICYmCisJCSAgICB2YWwgPT0gZndzcGVjLT5wYXJhbVswXSkK
KwkJCXJldHVybiAxOworCQlyZXR1cm4gMDsKIAl9CisKIAlyZXR1cm4gdG9fb2Zfbm9kZShmd3Nw
ZWMtPmZ3bm9kZSkgJiYKIAkJb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUodG9fb2Zfbm9kZShmd3Nw
ZWMtPmZ3bm9kZSksCiAJCQkJCSJpbnRlbCxjZTQxMDAtaW9hcGljIik7Ci0tIAoyLjQ3LjMKCg==
