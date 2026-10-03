Received: from WA1P291CU003.outbound.protection.outlook.com (mail-polandcentralazolkn19011037.outbound.protection.outlook.com [52.103.53.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A4A48664C
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 16:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791045158; cv=fail; b=lsVjzooRPtmYv3NwtGMzLycYXYkpRMbregykl65XYbsXUMwsjq6hW6AaCU267zq9D7aSDX+TYJ5Nn9tPDfkCaT5CvRW7UaEWdrjmAbqAcENpa6iVY66wv8NkE7OxenXSVGob9us8C2kRrT8sN9tlYmy9GVK5EKPXnvxCWgtCu4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791045158; c=relaxed/simple;
	bh=QpIc+Wv+ZTCi/n03AiADE3ikPW8LkDE7Re8o1zD+FQw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CuUqHoGhEAsO15hcTKO4CsVyTlUUX2cLWg7z1AQJXlk1QUa+c+tTlsb8W4iHLnBJWnMxrD4Gq95ysXpAJJnQXscVYF8hadTJRaBCnbo9jBTJcsLkMXALGTFIYua4ywTdLXvY6xQqEkNcLVINBY6EZ9GUNwSkv65hNI2fAvMqACk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=X1mLHnsO; arc=fail smtp.client-ip=52.103.53.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="X1mLHnsO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7YhXY6VwIHefUf8jVAS+wP4hOlKIbxh7urvsAsxXqVQr4Ykb5KoEMUI4u7Ok3++Q2jJQ6QnBDwyWPaS4eSSVy4hxOF1OxUuMxbRP4xco2gCt2LlEWnfPbR1eST+D09BmEyR5XSh9Huj8xEFA8O62Pb6eJwbeeZSJsVMa3qaJb6pswTnuz/coGD0LrCrrfpXMK4pm/wL6QQAhIXw3sAIIVOVFUnK9myI5i7y00qAbyfJvFPJxdFkYXnKtw5rtC2wU2Y+y3DSvlFLpW1y3LqgyltlTkPbnR9zfW6u8FKEVvbolbb5BTE17iJQW2m99bp1CYYE3HNQ3PIEYPquKs8zQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpIc+Wv+ZTCi/n03AiADE3ikPW8LkDE7Re8o1zD+FQw=;
 b=I81mPzeVQVklTlXgdRVQM0WQgdNsYfMkSNal7MJwJvw1qiGE0xJYkcAfm2dMZVsfrlZ3jZ1ZbHt638liQbcr1Y67zL/eHr8GTvpB4Dik+O+641TYuQuMkfl7U2Tpu3ayF+SBxctPLWzMfqvp/2Gaq6HN+Sd1Lsnn7W1tcvompEWqRPDJrBkLmm/wbBVhbeAk72brG0iUnKMezccyR792cuF/fBxvSNgkWNEnrNrwoF/vO2oJr3gHBadwEgX8TrfNPPpgxMfqCbdgXQjSQxRGN6u25O7qvJtuQ8UOQH9QXnGRSQtorzgstWhpcH5znyacCEfLk/KwLA26VmORpISc1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpIc+Wv+ZTCi/n03AiADE3ikPW8LkDE7Re8o1zD+FQw=;
 b=X1mLHnsOe4wH1jrp1VNrSTVnk9YafcUk7OGrhF+J/vp5YLFibx9G13F1xENHefHHUWIN3xq1J7betIbpjM5Ed/nYZDOxesUjjL22IgWpRwjeZDflrzI0PG1u3Zh0TbVJbK8/urh+C9ynMOP7c2FQHtVwPglRU9SWF+ckDbGGWhEm5ikR7YI9pyGQfRxhVMgwVKIlzWz+d7zrqmA1rg7xOumSDINiBdeBf5k0xysXDDwWt6b7rXTWgASKIvXbYiSTojgMXEgzIwlJOi3nOO3icmgvtATUUqvYU0/1d5+mJMcD2P8DS0CwjJl5WzOAYTk1UQriG9xIOc5FEdtYllfSpg==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA1P291MB0059.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:10::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Sat, 3 Oct
 2026 16:32:34 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 16:32:34 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: "luto@kernel.org" <luto@kernel.org>, "tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>
CC: "hpa@zytor.com" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?=
	<habilerenturker@hotmail.com>
Subject: [PATCH 2/2] x86/vdso: Replace deprecated simple_strtoul() with
 kstrtouint()
Thread-Topic: [PATCH 2/2] x86/vdso: Replace deprecated simple_strtoul() with
 kstrtouint()
Thread-Index: AQHdU1TLbwDqmKeXdEOwUfSlSDLBbA==
Date: Sat, 3 Oct 2026 16:32:34 +0000
Message-ID: <20261003163216.11547-3-habilerenturker@hotmail.com>
References: <20261003163216.11547-1-habilerenturker@hotmail.com>
In-Reply-To: <20261003163216.11547-1-habilerenturker@hotmail.com>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA1P291MB0059:EE_
x-ms-office365-filtering-correlation-id: 5812ef19-887b-4f70-932e-08df216bee05
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799012|38102599003|55001999006|25010399006|41001999006|24021099003|51005399006|31061999003|8060799015|19110799012|8062599012|2607281247196008|40105399003|102099032|3412199025|440099028|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?b09KUmRKZ0h5YlUrOERUdlBHeHVQdGlZcitwc0QvQ0xOdHl2eWd6QmlSL0tv?=
 =?utf-8?B?MytPa3dEWmMrWHNpdjRvdlorTG1tclp5NXIwbkxHWVBOdHRDNDVIK1FsSDJ0?=
 =?utf-8?B?Ry9oN1dzRHJLTjFjSnpadHp4UEJNVGdwUDdXSmthYUdzcDBWMk5jbmtEY2lE?=
 =?utf-8?B?L2V5YWNxL2V4Sm9SeUk3Yi94MEwwSVZCSzNmdlNXZi91WWh2cDZIaXRUejgx?=
 =?utf-8?B?c1JEalFDUTRieG55Nmx4ZUpNd0d5bVpab3VTeHM4K2FsVjZCMHpPb2RYNWJq?=
 =?utf-8?B?N2xXVkNNRG9aQlpxbXVMTWUyR21jaEVZUWd1RTIzS1QxRUlsUlhHclZoRHdL?=
 =?utf-8?B?bGMvVG5VWGJlWlk4TnhlS3BxQmhvZFVzYUlIOENLVFJ4c3Z2WWN4bmZsU0k1?=
 =?utf-8?B?aHhwVWVSL2llLzBJelVrdi9aVCt0NHlsMm5udmJnTGRQUVo2a2dUUXhuTEtJ?=
 =?utf-8?B?WjZSZ0wwSzJGOHRPUjYvTjR2Ym16aHZtekQ4dEdieEd4d0lYd0Yvc09wS0dw?=
 =?utf-8?B?RUFjSDRYVVRMYUdOeFNsdHJOcjNKTlZlcmVIa2ltcWovMDlkMVoxcHp1eU1P?=
 =?utf-8?B?TjI2VmJLL011QlhvUTN1QWYrRGRlOHo5WnNjc1R4OXlITXoxWk02Yno0TmZY?=
 =?utf-8?B?d0M4Z3N1ZHo5SDRlWkNKWkxLTWFTLzZkKzZ1THJsTXlSb2FYVjZhN3d2Uzd2?=
 =?utf-8?B?aUo3TFNrSTRpUGVaZnBjcVBIL2sxK3J6cUpYS0xBZEluUnZ0TFFpeUxmQklH?=
 =?utf-8?B?SDhQSzRSbUlVMGZnQkZhbEpYdnJhZ0tqTFhVSHV5blhwc20xWXFadFEvQjlE?=
 =?utf-8?B?Rm1vTHlicGZpOFo0OGRFbVByZmFGOUZGNE1OSTJ3SmNFMGpKT29FMjhkN0Vi?=
 =?utf-8?B?YTR4Wjh6WXhSckhLeUpaWWwzNHczYTFjeXVFZjhtRVRxdlRJSkdqSTRoUTA0?=
 =?utf-8?B?cDRBZlVyaHV5SnpBWEJCUkF5dTJRYkhxOWFPTjdKcFprMXhhWGtWNCtPalFT?=
 =?utf-8?B?dEQwQmY0NHNWZnp5VTNXaFluNUVrRnBQTzVIVk1MYk5kdkIzWlJoWk1MVkIy?=
 =?utf-8?B?M09KN0FRa1R4MUdRR01KWE90TG5DbWRxM21XdFk2RFY3NDhiZFpUZklwR3ZM?=
 =?utf-8?B?b1pvMHpjMUtYZ0JZMjFoeGpVV0xJOGwrYmU2R3d1RDNYemVScmpiMG1ydDll?=
 =?utf-8?B?WXZDMTlHTUE2KzhLMzV0c3prNWxrY0oxV09mbDZERnk3V3VZb25Zakg1UWpn?=
 =?utf-8?B?Z0FXU2pLQzEzM2xnZHlTMlNkZzlxaDdjZ2lCVjFEbS8wYnVKdnY5WVZWQlkw?=
 =?utf-8?B?TkVyb3h1WnQ2RWZ4bVorWlZwZ2dnZm9ZM25teE9MSzlQczl5dWd5cHE5ZDlz?=
 =?utf-8?B?TnF6TW1COXc1RXdZcE0wZkM0b1Z2bm1ZS3NnRm1aUlFpS0RxUThPckMrK1BN?=
 =?utf-8?Q?T064sgq8?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YnRkN2EvTGZYWXMyS2M3OTJVSlZGeUVzUWZKM3pkRkoxV3YwMm4yV2pDL3ND?=
 =?utf-8?B?MUpPMWpxekw4VllKcTFvZlhqdWZSMnJZeXFaZG5VcENLanFPRXVVeHJyRWRJ?=
 =?utf-8?B?K1JKZ2VzMG1nckZtZmZFRGpXVFF2UHF6TVRSTUxCNHRjL3BlY1pWLzJQQjJL?=
 =?utf-8?B?ZXJwK25MU2hoSWFHYmhxaGVXcC81TjZoQTBsZHA2dXQrcVFYWXNsVDc1YTN0?=
 =?utf-8?B?Mm5BblRhcmd3WHdnS1dTU1ArY2JMSWlZUk5OVHA5WFVVNWt3OG1PeG9UcU5r?=
 =?utf-8?B?TmVCMEtEYUR3YUVjVFBSVXVOd0VmVlNNcXpnaDgxdE12N1BaMjZVS2dwOVBI?=
 =?utf-8?B?MDkzZ3FJVHowR0pjREJtdGtzZzh4YVhWSXBVTVZHa25LSnhKNU5ENXdnU09y?=
 =?utf-8?B?UDAvSEZXSDNqS0VsTzIvWnphVEdhUldiSXJ6ZUNwUUtEMW1vOCtBZ3hkTmRS?=
 =?utf-8?B?S2dMYUgwUGtyZWttanduNWtPUVJlYkJMSG9OcVpPVVB0MDN0ZzA1ek9ESHNM?=
 =?utf-8?B?NmVocyt2ZzljdFVwZHdEWXBVcndmbXhCZ3RrVURvWkxDZGhFczUzTlBLWElt?=
 =?utf-8?B?VnljSlFKNmlqc3NsOWlkbUdJT3VDMXJsOFI2Q2pDZXZVSkNJTWpuekdhOG1P?=
 =?utf-8?B?TC9PeDNVSFJqeXh4bWlybFJ5Wmd1cm9TTWs4M3d6RWo0VmJoYjFJUkYxeDdV?=
 =?utf-8?B?VGxNQU5qN2xBdHZ5c2FkcmpsRHpvcjczUVg1b3dzblNFTUxkNEVwTTVVd09t?=
 =?utf-8?B?OUlCcWVFWTVUUERjMkNZMG9JcHhsVmNtVzJyQkZlb2JMYzQwTk1rYUg0ZFpY?=
 =?utf-8?B?VFdQVXNMTE1qdmxIUlBqQzM2MjRDOW1yTm1oMkM0c2Z1WVRxSWc3ampCQ3J3?=
 =?utf-8?B?UTF3ZkpRMHlxMFVmNTJQeS9NTGE3bVRjTkRuQ1Fhekd5NDVwTXFzWC8yaVBx?=
 =?utf-8?B?YzNmVlpyWm1JTEI5TTJ0TFdZZnFyYjNHNFdpVmppTkRrZ1R5R09zQmlqZnZD?=
 =?utf-8?B?cmlNdDBDN0YzK0FmTHVrb0MwTjkxQWNPb3RNRld4UnlrVnRGNWo0a1hmS0hL?=
 =?utf-8?B?RnU2UVdWQ1Y3bHdTWW4rcktDbUREQW1CeUljcnE4TXJETTk1SVZwb010b1B1?=
 =?utf-8?B?dEtMWlFHQzZVbk5rT053a0prNi9uNkh1NktDcTFWalBqUXJqUUd5Nmt0TzZD?=
 =?utf-8?B?WFNOYjJuYk5lc2lwWDZ3TFZZbWo2M05RekdvdTYvVmxGSFpzNWxxWTVxTHJE?=
 =?utf-8?B?a08zWG9Bcjh6TDcrN3BCblJBdUVRWVFDa1RjR0RvcExveUszZW1HSW9jMXE0?=
 =?utf-8?B?NU8xZmdqQnA4VWkvTmJBNWc5aTZqb00wanJqdG1scTVNYk1ZL2hyR0w1dVF4?=
 =?utf-8?B?Mk1Cc1FqWmsvRjFOUGEwcS92OFZNRUJ2OEI3N1lMZXhHeTJMQjkrWjJDV1pq?=
 =?utf-8?B?UUdLQ2lPZUR6MEdteUVhckNhUlFiQlEyMnNQenJZQ0Z5Q3VObFlFN3JudWMv?=
 =?utf-8?B?OFZHNzY5OFQ4THZJa2VlTUlhZTN0Yll4RFFINmYzNnFpUXZHYVVDOGNWVWdm?=
 =?utf-8?B?aUxNME9CQ1NiQVNRcUZsdTk3RXpYUC9IV2lnSzZzNDkrSHU4VGpyWWlzdEx2?=
 =?utf-8?B?VG5kOWFJN1dNZ0xvejhMbVh6VXZjZ0ZxRWFUL3BnV1JJMmtZTFIvZk1KSHND?=
 =?utf-8?B?ZlBaQkowN09wNkx0REozcFZkS2lLVjQzYmE2b2xWaHQrb0dLbXVtalQrSkRQ?=
 =?utf-8?B?T2ZYbTJ2MEFDOSt2M085bXNNSVlQaTdTbnFqNlR1ZW12ZkxNQ21NeG8wVkRm?=
 =?utf-8?B?TjFjb0dldHZONS9EVWJ1SWlUSWpwZWMvaDBvUGlJVFNHSWJ4anJDVG5vcUJP?=
 =?utf-8?Q?0GqW7uUbb501L?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <855C51D32D272F4DB2862D773CBFA6BC@POLP291.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5812ef19-887b-4f70-932e-08df216bee05
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2026 16:32:34.8338
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0059

VGhlIHNpbXBsZV9zdHJ0b3VsKCkgZnVuY3Rpb24gaXMgZGVwcmVjYXRlZCBiZWNhdXNlIGl0IGV4
cGxpY2l0bHkgaWdub3JlcwpvdmVyZmxvd3MuIFJlcGxhY2UgaXQgd2l0aCB0aGUgcHJvcGVyIHZh
cmlhbnQsIGtzdHJ0b3VpbnQoKSwKaW4gdmRzb19zZXR1cCgpLiBBbHNvIGFkZCBwcl93YXJuKCku
CgpJdCB3YXMgZGV0ZWN0ZWQgd2hpbGUgcnVubmluZyBhIHN0YXRpYyBhbmFseXNpcyBvbiB0aGUg
dXNlIG9mCnNpbXBsZV9zdHJ0b3VsKCkgaW4gdGhlIGtlcm5lbC4KClNpZ25lZC1vZmYtYnk6IEhh
YmlsIEVyZW4gVMO8cmtlciA8aGFiaWxlcmVudHVya2VyQGhvdG1haWwuY29tPgotLS0KIGFyY2gv
eDg2L2VudHJ5L3Zkc28vdm1hLmMgfCA2ICsrKysrLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2VudHJ5L3Zkc28v
dm1hLmMgYi9hcmNoL3g4Ni9lbnRyeS92ZHNvL3ZtYS5jCmluZGV4IDE4ZGZkODBhOC4uYjg1OGYw
MGM5IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9lbnRyeS92ZHNvL3ZtYS5jCisrKyBiL2FyY2gveDg2
L2VudHJ5L3Zkc28vdm1hLmMKQEAgLTI5OSw3ICsyOTksMTEgQEAgYm9vbCBhcmNoX3N5c2NhbGxf
aXNfdmRzb19zaWdyZXR1cm4oc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiAjaWZkZWYgQ09ORklHX1g4
Nl82NAogc3RhdGljIF9faW5pdCBpbnQgdmRzb19zZXR1cChjaGFyICpzKQogewotCXZkc282NF9l
bmFibGVkID0gc2ltcGxlX3N0cnRvdWwocywgTlVMTCwgMCk7CisJaWYgKGtzdHJ0b3VpbnQocywg
MCwgJnZkc282NF9lbmFibGVkKSB8fCB2ZHNvNjRfZW5hYmxlZCA+IDEpIHsKKwkJcHJfd2Fybigi
dmRzbzY0IHZhbHVlcyBvdGhlciB0aGFuIDAgYW5kIDEgYXJlIG5vIGxvbmdlciBhbGxvd2VkOyB2
ZHNvIGRpc2FibGVkXG4iKTsKKwkJdmRzbzY0X2VuYWJsZWQgPSAwOworCX0KKwogCXJldHVybiAx
OwogfQogX19zZXR1cCgidmRzbz0iLCB2ZHNvX3NldHVwKTsKLS0gCjIuNDcuMwoK
