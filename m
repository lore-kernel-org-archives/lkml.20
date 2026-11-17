Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794920422;
	b=zPVbotfPpPfS7r42xQ4pbk8PSn8VQ0IXdt1hk8LE4ImnnZo15TF9IPcTk3atKel/Pxer
	 IR8sO+aZUIZbFIWoJdU3PYAcdQO94Xsod6eU5+VRNDaGUSfqLkhJ69xfVV+DQW5CKXwSD
	 eDrQWH+ObOyOCp+2ndZ1TYiWX0Ho7zVSqQrNIG8v9Nl9bEg37REU+t2sOVju184wWCUyX
	 n2w61E6PCDndUR6ORAPg0ePg5XfFbPWxchP7Wx18Y9/zBUFxNm6KuVO6uOpTQElgCSrA6
	 Qbe3Pqqi49SDKuXFCi6u0S3k8FMYd1WLffhU7R1xaT3oxe0cke24DGR3qz3AIOPY6AA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920422;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-slblob-mailprops:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Hm8/gpbuOoam14k9MRzbR/4FFF0MgbrH9rmLtrJ5vl0=;
	b=SR1A4K8sdlPTKhcj2shqYNVdob1z1vUeqEQ1VbVPI4QyALRllWvRWMP+FtnvHY80jdsW
	 qd/ftyk63RKu+U7yEvxMh7uyDTwz1H++Y+ZqVvC7bVitCDEX37IwGPJ+niIJWlJu6um8h
	 JYDFoDK5Ee7BMPyiepII6tSfIJcKHFpmkkOpUGActgyWDviklc1oGprQXQSedBDjp0zAv
	 /Va/FFKri4H2qyFbTFCZaKC2b8NEfPBqTJpdkOVcXY42vN9obR9vKRgWDUMisEFa+SGXW
	 8L7329B1/SIOPu+YWxa5SGP91u5fScQAS7skUgodfj8KpAsQdRRS6O7p3BlrF657dsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.jp;
	spf=pass smtp.mailfrom=outlook.jp;
	dkim=pass header.d=OUTLOOK.JP header.i=@OUTLOOK.JP header.a=rsa-sha256 header.s=selector1 header.b="LrB/nmMe";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.31
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazolkn19011031.outbound.protection.outlook.com [52.103.43.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D14E60A263F;
	Tue, 17 Nov 2026 13:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D14E60A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.JP header.i=@OUTLOOK.JP header.a=rsa-sha256 header.s=selector1 header.b=LrB/nmMe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qRj1cb++PU4UHEhanls/myUdi8rQ6V/axz/mUx1icJ5ivPPqV9I8qvcmvz6sbUs47JEgiy1x1gYdDXmwMBQDgPsWmPlBYTReR/zKrnNmdivC67ulwwTbp7mq0tlg38DBatd3cSbADqMlAxF5hgLZCRysJB0VW2cglOHUfa10Lw2Uh17PQF21QlofrqMoNTf5uGfcCHNDLcZTbZEBsRGF3W6J1LC1z/xA/Xv3iThQrjaS28iPY4XFetOGG+jYhwdPLb2pvMUu8ekyi+HsNxjINwIFoi6bodBQhWBbr40cETpge7RdWpwRjBPlwL7jwP+xVxvdo4axbLZmgXJLiu1Sag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hm8/gpbuOoam14k9MRzbR/4FFF0MgbrH9rmLtrJ5vl0=;
 b=Y7XbE/CyYGgnUi/xHuknqJi0cZRAhiMG1AwLuaOXtFq3C7wdQxNqh7elAK3sv1nq6MoveBkDxJ0gGpOUSL3OsVJxkv7jWJbxj0CHtN0SvBMygZuAwBaWaNnIQ+yVosCE016hTTZ6Iv4TzH7vCw/uMjsz05pCoEiAiMiOfGERiCUniWMIkgYeOWKhGer8jpU0Avexrs+l+BWcW7a+a/L5W8cl/tenWEZ6z5Mjj9mF+bxWBOtjkYULF/1C0zGCFvPWcA+J9E/AkWOaDvmIb8d34BKFr9c1lfYIDJjZEYuL5DD5J1UFLMr0Bmq5vXt55IJC3H1zbis1xqucLbwwhWS5mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.JP;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hm8/gpbuOoam14k9MRzbR/4FFF0MgbrH9rmLtrJ5vl0=;
 b=LrB/nmMeshrK6Dw6fBlOLvb5FG3Ve1aarAcHU4PTR9QXAD+wCIHYmCzDmOJy02OBNqwhgsDMzNqnA4B+7TzHVnIAQooMcOqOO3a6HZuB5QEDYLZxiSkLQFy9rgl80azTAqom3pgOx2pTeZI4E2tIWbpIzMMR8HbeADA+GdpfB9w48cyCrC4f7dgadcCFtu6rVZmWQMVoJ6al0PwDhGIqmN3wR0OkrcGiC8hnr7tLxFCsglWY05u5OppVGNzwg/6//yPXXm0H9d6l+44sOlRrNLhJ/EqmHnnf8Zl2G3MpA4qOlR1gUBb4fK4Zh5kFegMx+s7uhncEs9RE5La2gx3d4Q==
Received: from OS7PR01MB14363.jpnprd01.prod.outlook.com
 (2603:1096:604:388::11) by OSCPR01MB16379.jpnprd01.prod.outlook.com
 (2603:1096:604:342::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 13:00:17 +0000
Received: from OS7PR01MB14363.jpnprd01.prod.outlook.com
 ([fe80::eeff:dfdb:bd3b:591b]) by OS7PR01MB14363.jpnprd01.prod.outlook.com
 ([fe80::eeff:dfdb:bd3b:591b%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 13:00:17 +0000
From: Keisuke Tsukuda <tkdkei@outlook.jp>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sven Peter
	<sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, "asahi@lists.linux.dev"
	<asahi@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] usb: dwc3: apple: unregister role switch before taking
 lock
Thread-Topic: [PATCH v2 1/2] usb: dwc3: apple: unregister role switch before
 taking lock
Thread-Index: AQHddpOXDUkjY6EZdU2ii/EAXIPNiQ==
Date: Tue, 17 Nov 2026 13:00:17 +0000
Message-ID: <20261117125825.27629-2-tkdkei@outlook.jp>
References: <20261117125825.27629-1-tkdkei@outlook.jp>
In-Reply-To: <20261117125825.27629-1-tkdkei@outlook.jp>
Accept-Language: en-US, ja-JP
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB14363:EE_|OSCPR01MB16379:EE_
x-ms-office365-filtering-correlation-id: 2d8d08a1-2b88-42be-2b4b-08df44aaba59
x-ms-exchange-slblob-mailprops:
 7qh87CJt6y1mqZO6407WRLxlypE3k+ejht4tp32MfZqs7GjnrYiPLwWtkxUGw3ipxWiwtAPGyj8twG3tEBuB8cNbPcl/uEVP3PxE2ZcoJ9omtPrRqGinDtSfPcuRWjgFN1SfPKX8p2MKaISLi/IVRKzIP6wOY+BTBcNq2q0He6EBY0Lkb/3Va3RMf5yLrULejmP4Vvqg4k37zyp7e9cTItsP7CkGeIMvgDKbdsO2vzU1gc7kKw/QPyzKzCZN8kUco/drQDa0+JlXdXDL/AjrrZeXHSW4qw2LiN/vQOFJmB9jEtP/Z0vV+TJUU9e/ga+8VoHgIqU/jAJMQMktIKdJB7QMr9mAt1xbyGCZpAmENEHiwtgQ11sdgdAVhbFbBePyjHKGOKJYNtXtrBXdC3uxNj/k7qhSpR7d1AXQvSwsGs04LQzCHv8CxGVtiNP2rF+HQgOX82xz2gf+AB7wxkud7PIaTF24rIMRAk86bATjgy+owliCwQS6FCWL6Cuj4yDyXUBZW2V/vGNn3oiNrzQiqgy6feX9hXqtOX/T1mkFN53xA7YJauYd5Wl4gDI0z+mxeTfAyh/KS+F+zMIkIqgDgca8Sk7s6KWNCn2+48elWYxAoI1KnbLnHnEr0E7HXhk7BLx6uJ7jw34jUOP6K7ma7+WZIl8vPzIhb/kxCKbMsMqpGEDy8uqGt1ijQyQykdAJ33nCsIGa+JRyIanbPE8NnDPBsLAwM0/pZ69I8XQknnQMs+2joGsELTdUBQVjt9YB
x-microsoft-antispam:
 BCL:0;ARA:14566002|38102599003|15080799012|25031999004|31061999003|24021099003|25010399006|8062599012|51005399006|8060799015|19110799012|440099028|3412199025|26104999009|102099032|40105399003;
x-microsoft-antispam-message-info:
 =?utf-8?B?aHhQWjBEaUtRVGw4NUFqZGhJdUVVazhvYTh3NnZCR2NhNW1PSVBZT1l4TXcw?=
 =?utf-8?B?RjJ1RE5QekFtWmIzMWIrUWtaWWV5THl2cHhackpqVXJGMHB6NmdwUDRxRTVD?=
 =?utf-8?B?N29IWW90T3VWcDVvdlgzOWVHNmlUZlplYW9wVm5ia0dsLzZZOVhVQit6MlNm?=
 =?utf-8?B?K3lkcmwwVFhaeWZ5andoTjR1RDBvM3U0cWl6YWRzOFNKREJ0VDduVEE1enJs?=
 =?utf-8?B?b2pNdzN4aTZEVEpaSU5KMEdUTUlMbE1rMitBSUVBdlViTjJYNmVSY1FRT2Jj?=
 =?utf-8?B?VlNyTEZzci90WmtIRnVPSXdxMU1KbDNsN1hFUzZ6a2ZmY29YbzFISERvNDk3?=
 =?utf-8?B?Zm1wcVUyanRBK2VjWlRLUTJQelpsS2NYMDNyNXhlWDBReVp3RGU0dFh2ZHVx?=
 =?utf-8?B?VHZhcWF4RkU3Nng4VEsrTzRBZG9sTU1aZ2J0ZDBtcFFxY05OT2dJY3dXajdW?=
 =?utf-8?B?MWFXU1JNcEg5L21SdVpRSHdzNVJ3bCtTQitwWTFpWVpzSGpMVDBRREVXWFdC?=
 =?utf-8?B?d1d1cTZHdy93ZzJvVUNFeW4zTWZPd21ybTBFVXJMTWxhS1BmbmxVSXEwNzY0?=
 =?utf-8?B?RVRCUXhYQUdwVHAvMmR4WmNDTnYrZUJ5bDNxQTAyaHhvNDVhSlUvbUlmRTRY?=
 =?utf-8?B?cUpJcTlBR0cwcTFIT0JvaVNtTFZvNmovYTh4MTBCU1g1Vi9PQWlORlJuNTBm?=
 =?utf-8?B?NnZRZmRQMWVIaXBzQWthWnVOQkdwTkx1a2U0b3hXR0duM1FWeXNZazlpUjMy?=
 =?utf-8?B?ZEw5dHU3QlhDTWJ6WUQrM0t1WEJLL2JvOFhSV05wSmdwQzd0Z3lhZmlwdG00?=
 =?utf-8?B?Q2RGQkNVVVdSR0ZYWXJuQjJ1NnIvbnBJSEhCamZYWUxxblN3MmRxbUVPMGZi?=
 =?utf-8?B?dVhTRlJjZmZ0T1lKVGUxSXpjTEVOU2pMTFdiRXVDaS9rQnRycmUwMHpJcnJE?=
 =?utf-8?B?MUF5TGVnZTdIZDlqTFVTMEFGdTh0VE04WUQrdkpZMkVvVzlSMTV4b3daRnor?=
 =?utf-8?B?SjVkZE43eDZJeXpkNmdaUU5hdDFOY1ZnWE8wcVZZdjhZa2o1bjhHMGkveTFv?=
 =?utf-8?B?Ylp1aGM3NS9xU2pDNWdVcHpzSnNvZktBSXpwMWswUVRoZUQ1cUhXQWgzRnJz?=
 =?utf-8?B?c0s3SThZMU9JbjdFZlVkMUtVZ0RhbEUzQUdRcEpGTnU3L1pkYmtncUpSeVJz?=
 =?utf-8?B?VzBJengzeDhzWTN3UVRuVFZYVGtsNXVoSkFVOXN4cFlTTDZHaEx2bzh6aHJT?=
 =?utf-8?B?aFdJOXpkVGlJOEZ0dFRtLzFNTUxlQTNDVnlpRzRZMjAzblNSREF0ODN0RlRW?=
 =?utf-8?Q?UKh3/QfxIn2nCq1Oe5GGsJ2AyX1ZNAROol?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N0xRMjNJZWZIOWlUbU0vN1o2bytNRFkzRU45WkVVdUVtc1pZWjJJT1JQbW9L?=
 =?utf-8?B?a0FrL082eXlQWksxdDBEcjQ5aXo5QWkwSnFINmp2dmM0ME1USmFpQk1Uc1dk?=
 =?utf-8?B?YlovNGN1R1owVVlWNkpPa3VOd05SRm16ZnN6dWl1dE5wMGJ6UWkrTjZPN29H?=
 =?utf-8?B?S2cxWklqMnlRR2R6eEQrQUFtdFFxQ1paYXZGUGthZ281RktPVlBkbFNnOXBq?=
 =?utf-8?B?bkdkbE5HUUdmdWdIQmZtVnRkUFNFYzExcE5uOEFDQzZUKzFCOEhUZnVsalMv?=
 =?utf-8?B?MUdYUzM5aU9BUVpJVWhQd1lLYUhnRGdOSmVUakZEQUNPQ2lKMHVnUzNlaFMz?=
 =?utf-8?B?OXJKZGNCUFFqNkNoNDVxSlo0T0ZDWHBYUCtJeU1HMElUU2Rvd2VFbUQvL3Qz?=
 =?utf-8?B?RDhoRU56NUpLZGVvTzgvL0NKYjI2SWRvSWV4dytPRHU5d3FIbUhYMW44eVBB?=
 =?utf-8?B?REJWdmlkdjYybkxUdkpsN2VLSXZEc3B5Q0JVZlhHU2NtSDRnemE2aER6dEJY?=
 =?utf-8?B?bFdRdnhja1VLazRaMEF6ZU12UFl3ZXJuZ1ZsSmhqYmpBbFl6U1g0OEx1d1RU?=
 =?utf-8?B?cXYrdnBrKzQrc21mN0NCb21hSUJ2QmZIT3ZtMzR2L1NhOWRYU2tBUmRnSVQ4?=
 =?utf-8?B?bXZ5STQ2YkVGUkhXbk44T0YzTnVzT0VqbHpieE55UmlueU16ODJqcXBNQlpm?=
 =?utf-8?B?Q2tZYTRCWW5mNzE1Ym9hZllNa0t3eW1jbXhPcm9JZEE3dTFaVHNsQ09oWEtk?=
 =?utf-8?B?RW0zSlZvSnd2QjloNWxPc0hpMStkRVJkVk5ReHQ1L2w0YmtudEtDYVVFeHJU?=
 =?utf-8?B?MEVaSWdIQlNPV0JrUUVIamIrT2hUMlZDQlZCQWRJU0ltWjRQRmZHSEQvREZH?=
 =?utf-8?B?TzFJdU9ETldYR1V6OHNOL2pQK0JHY1lwNVY3WGQ0MFhBVkhJanA1RWM0UEhh?=
 =?utf-8?B?aVVhd1ZaOEhYU2lHMGN5bWc2N1R3dGZIcVRhVzJvOWg1ZUt3N1NsK3R6bUxj?=
 =?utf-8?B?bmVQcXhIRmQ2RGx2NWZxa0MyMi82TFUvdmtFamtxVUlTVEdiaC9zUjJQTlFl?=
 =?utf-8?B?MFpqeGNkSVVJaFNPT3lKSXZDbU9VcjJ6YW9CengwWXkvdEhVQnplOVpWZmI5?=
 =?utf-8?B?Z29ONTVyQjNWWHVNbCtuSkwyOHNRMXpnM3Z1aTJZK3ZoNU50OHhjaXRPV25Z?=
 =?utf-8?B?RVBRdDNzakJtN0RFdmFIamYrZGVWT3U4dnFVM1hLOUIrdGVPMlUrWkNnc2Nt?=
 =?utf-8?B?MGdLQjlIRjVPTjNzeVhsN1NNM1A2QkhZaldicVJPN1BNVlVsUzBiUkk3N0g3?=
 =?utf-8?B?b0hBMW9XK2NsMEJ2NC9FZEQxK080bEY5OGdNMkRmaTUwN1FRYUdJOFRzdktI?=
 =?utf-8?B?eWYwYVhFRUxCdDZQLzlsSEErRVNnaVFGaGxQb2x2Kyt1N245VExmOXNmUkF6?=
 =?utf-8?B?SFFEczIzZUVjZkJBSE1ESHVhMVdwOERMNmxaZkxFbW91MnUrZEM0UEFJMVRx?=
 =?utf-8?B?VXZTS282OExxMDFaUzRKV2hIdHF2Wm5SaTAvNlQwS2ZiTk16WkQyL1ZQZXY3?=
 =?utf-8?B?NTFnYXgzUkc3SlgvaUVJNUdQWW53WmptTDd2Y2lIUGI4YmNTNFdBLzFFTW9Y?=
 =?utf-8?B?cllaTE1GNGlXU0ZsSTBMaWpkMnlsaHpBa2lmNzdiRnZIUGo5VDg0QmlDMjJP?=
 =?utf-8?B?cnF6RnhBZG04eTRJV2dIcjFZNHd5VjdvWmZBOTFya0liVWQ4VCtmQXFsaEZN?=
 =?utf-8?B?MVY3SkI4aVp1dERXQ1hMcEtGYk9lK3doYm5QbndBNk81d2IyVkQyaHZpL1ht?=
 =?utf-8?Q?brd0okN2lRFci2CuRdPr8XcPfvqMCbhck8rMg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-b83fc.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB14363.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8d08a1-2b88-42be-2b4b-08df44aaba59
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 13:00:17.1309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16379

VGhlIEFwcGxlIERXQzMgcm9sZS1zd2l0Y2ggY2FsbGJhY2tzIHRha2UgYXBwbGVkd2MtPmxvY2sg
d2hpbGUgdGhlCnJvbGUtc3dpdGNoIGNvcmUgaG9sZHMgc3ctPmxvY2suIFRoZSBjb3JlIG5lZWRz
IHRvIHRha2Ugc3ctPmxvY2sgZHVyaW5nCnVucmVnaXN0ZXIgdG8gd2FpdCBmb3IgY2FsbGJhY2tz
LiBXaXRoIHRoZSBjdXJyZW50IHJlbW92ZSBvcmRlciwgdGhpcwp3b3VsZCBpbnZlcnQgdGhlIGxv
Y2tzOiByZW1vdmUgd291bGQgaG9sZCBhcHBsZWR3Yy0+bG9jayBhbmQgd2FpdCBmb3IKc3ctPmxv
Y2ssIHdoaWxlIGEgY2FsbGJhY2sgY291bGQgaG9sZCBzdy0+bG9jayBhbmQgd2FpdCBmb3IKYXBw
bGVkd2MtPmxvY2suCgpVbnJlZ2lzdGVyIHRoZSByb2xlIHN3aXRjaCBiZWZvcmUgdGFraW5nIGFw
cGxlZHdjLT5sb2NrLiBUaGlzIGxldHMgdGhlCmNvcmUgd2FpdCBmb3IgY2FsbGJhY2tzIGJlZm9y
ZSB0aGUgZGV2aWNlIGlzIHRvcm4gZG93biwgd2l0aG91dCBjcmVhdGluZwphIGxvY2sgaW52ZXJz
aW9uIHdoZW4gdGhlIHJvbGUtc3dpdGNoIGNvcmUgY2hhbmdlIGlzIGFwcGxpZWQuCgpDYzogc3Rh
YmxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBLZWlzdWtlIFRzdWt1ZGEgPHRrZGtl
aUBvdXRsb29rLmpwPgotLS0KIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1hcHBsZS5jIHwgNCArKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1hcHBsZS5jIGIvZHJpdmVycy91c2IvZHdjMy9k
d2MzLWFwcGxlLmMKLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWFwcGxlLmMKKysrIGIvZHJp
dmVycy91c2IvZHdjMy9kd2MzLWFwcGxlLmMKQEAgLTQ4Nyw5ICs0ODcsOSBAQAogCXN0cnVjdCBk
d2MzICpkd2MgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAlzdHJ1Y3QgZHdjM19hcHBs
ZSAqYXBwbGVkd2MgPSB0b19kd2MzX2FwcGxlKGR3Yyk7CiAKKwl1c2Jfcm9sZV9zd2l0Y2hfdW5y
ZWdpc3RlcihhcHBsZWR3Yy0+cm9sZV9zdyk7CisKIAlndWFyZChtdXRleCkoJmFwcGxlZHdjLT5s
b2NrKTsKLQotCXVzYl9yb2xlX3N3aXRjaF91bnJlZ2lzdGVyKGFwcGxlZHdjLT5yb2xlX3N3KTsK
IAogCS8qCiAJICogSWYgd2UncmUgc3RpbGwgaW4gRFdDM19BUFBMRV9QUk9CRV9QRU5ESU5HIHdl
IG5ldmVyIGdvdCBhbnkgY2FibGUgY29ubmVjdGVkIGV2ZW50IGFuZAo=
