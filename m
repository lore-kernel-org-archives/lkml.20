Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433CD44AB64
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365374; cv=fail; b=WGPev9O0f0/spdQz1gD2Dm9SzomSGW5vrAIdry+WGojTIq2PYmZEuqun0ZMcd7Yhl2/jJe9A+VHQOYu6F/flAlmhB38g1LAlUlSSHg1G2HLDfdebpCe8FTekaFDA8DXRMtWAenYKCFLNEiGyhKa0Rb55w0sKYuf2207xcyWSjF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365374; c=relaxed/simple;
	bh=lwpUfcNVzMrDa3TU5YEhJLAdYrDnKeiQk1LNpxq2azw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I2Sr1hwn5i2mbiTGxHJOJAenN2edlsQxHj1qgJKX6IR+52BrLlPwmsqb5t4n2ZHiSSreO0kLTvuJPkF13iClwwLyZMqFHzh59G2DV18nGxWqCAxVB+eTO6NCabRNhYRZzHsApDFT3oNwqYYjlcb2c5JwBMT6D+HekwJIBUtf5sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qti.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cb/pzO6S; arc=fail smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cb/pzO6S"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jjhT151987;
	Wed, 7 Oct 2026 09:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	qcppdkim1; bh=lwpUfcNVzMrDa3TU5YEhJLAdYrDnKeiQk1LNpxq2azw=; b=Cb
	/pzO6S/q/K04a1g/WtTIHc7lNOmANtV5mTxdggkpPbRJRzqUBoJ519eWRra9m/Ps
	XdV8mWLp+IleeVQSViaf5bkqxYPQhR4SE+Q/cHMg+d/iMylpBwT0nvMBZReeCX6K
	3Z/7m1g9uRCp54cb3xGiORUTKX1sjpewHWLEmHOB+xBXLembW6O8yFklIVZwEk+u
	WdXm2nZ9Jft3fN3L5rISOvi2W+D8yFhCM9blKzTgSRTfoHmak9v/+AzWz5hczD3W
	SSYGFWdCaCWO/Z6cdErWIp2RYQ4bbGT2v91lUPHdpR6R8H89DcZPLWxuMP9t/B6U
	7+39cYvCfh1XulZddGtw==
Received: from ph0pr07cu006.outbound.protection.outlook.com (mail-ph0pr07cu00602.outbound.protection.outlook.com [40.93.23.90])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c719f7w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 09:29:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMlac7b4CdDS4dJ3FE8diRN+P58jcA9H/FxHyECOSRXu01acU4qIxmzMtpoA1c07Ydkj34+pO+5+V/lVnwL4LUyGzO3Onz/kcfcBvNRGmQ0BJ1kL4LLMQUeGhcjMAWdPhavc5bxVE8UOYi4rQSWuIfp+SdcSS+sIDOTpYZdkQnvVNNr+J3Ppe1wXYnx1G9aAnFlKbsJC/G4WQEW2gl4oLusrnUrxIXbUFGUuEWC4CcxCjK0RXW+OrIdHyyNtkoS0fcd1BQdly4C5YAjojP2HjnECHsOAPvmSf70DTiUdxyL5pRj8UhJl5Kvo+iS3iOGiUDY2sXmSxg0u4Aa+ys8Mvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwpUfcNVzMrDa3TU5YEhJLAdYrDnKeiQk1LNpxq2azw=;
 b=GWzwzD+5NlOY5y5rLOqXDQdpKJM5Dp5e+yPBd8NlL4goQBUV8CJgyguTGeasQ6IKfyL3AKyf04QgnUUQTQmX9x/I82gOpU/2zBb+rIw0q6rE//XJYqPe1bjZCI7iO4wSKhcJlchEdbdnZiofuMCtutdrsIUhq/cnzVSEU4oHWrxga7dBgnmvtb7vUHI3lPUsdOtyamSWP0bWKDVxuuMQzyCsDtEMTmDaSjCnsHBxBxnKWyYCttyFkafjmUJMMTOo0MtdWdk86gKAENov9ZtMoohKXZ3pUJ73V/sQaVILQvoz+uZvu8f3KATosQWLnvsG2mnH9wcV87BPL5WC2dv+UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BL0PR02MB4435.namprd02.prod.outlook.com (2603:10b6:208:4a::23)
 by CH3PR02MB10153.namprd02.prod.outlook.com (2603:10b6:610:195::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 09:29:03 +0000
Received: from BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0]) by BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0%6]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 09:28:59 +0000
From: Radim Krcmar <rkrcmar@qti.qualcomm.com>
To: Paul Walmsley <pjw@kernel.org>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Walmsley
	<paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Atish Patra
	<atishp@rivosinc.com>,
        "ajones@ventanamicro.com" <ajones@ventanamicro.com>,
        =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
        "apatel@ventanamicro.com" <apatel@ventanamicro.com>,
        =?utf-8?B?VGhvbWFzIFdlacOfc2NodWg=?= <thomas.weissschuh@linutronix.de>,
        David
 Laight <david.laight.linux@gmail.com>,
        linux-riscv
	<linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v2 2/2] RISC-V: make use of variadic sbi_ecall
Thread-Topic: [PATCH v2 2/2] RISC-V: make use of variadic sbi_ecall
Thread-Index: AQHdVXjPEonUwfokmEGaKWhvsBA8QLbx0ZmA
Date: Wed, 7 Oct 2026 09:28:58 +0000
Message-ID: <DLYI0I8PT4LZ.ZSXV160QVO0H@qti.qualcomm.com>
References: <20250619190315.2603194-1-rkrcmar@ventanamicro.com>
 <20250619190315.2603194-3-rkrcmar@ventanamicro.com>
 <650d23e8-b51b-85da-f9f3-52a06fed81e5@kernel.org>
In-Reply-To: <650d23e8-b51b-85da-f9f3-52a06fed81e5@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4435:EE_|CH3PR02MB10153:EE_
x-ms-office365-filtering-correlation-id: 935581e4-8a60-413e-dafd-08df24556aa4
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|22082099003|18002099003|10067099003|4143699003|11063799006|38070700021|56012099006;
x-microsoft-antispam-message-info:
 c6h8gMTVVL1QGlKzuh3i1ZE5+aqL6sHnNqKkJ0LQwBgYfu4C8Qo/YN5CzNazfEu3TYUje71pWjcYDMXdyBQTYf6YwpniEqpradD76v8VqcNXNsW915bWXxy18iJn2jJaoZyhsAPCjaZUmWl34CS2NZMqM8K1ZgcuBmR/piBt+Y4h7mbuVgqvWvy7y6qDsfXeGwPkSQw6lxQqDyhELeazTd282Ni9v5oAcp7mTncEGMbzbwxDRIJ4qQftMBpipDg8ZpEjU2/84h1IGaBkNMKB8i0UR3rGYH5J3s7Ke4jDJ97IzMfywqAeahAlCo239ZtQu+6esuG64D83qQ8QnM2BEmmI2xzzNbB+cNrhbYvcy4fJVcRpbXiH52XVv/h9F16Ui+8FYtuhsa7PBIDq8tejXcu91DzAgXXGQk+v6H8j3s2Q9JDBe24d55Svg//PYoQe2S7TSjTdfLZuJhx4hr+zWa8Kg9889rl2A0D+4SmUHs8O6DA6RGkt0W/zm3oy8cO6JI5TGKP2m0P23wtBL3WNqPKl2K7EymBgWjf5Djmz55FVUMS1v+z8tjVc21qtrDcbxH+6D0hXbd+LNIskNexE5K7IRoi6cqeGTBKT/IoYDhyVgaV3wImKjCKNEhIaxG02ktLkUxE5f5X7itpWtNqVMATNURbdVfbgq346j139SMhzhBwaz4o8MaPnHwSaDsT1VAnCiXEQ2znMNS7InIcXmdQ0CmEsVFyIPBSK+BzQNc8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR02MB4435.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SlQ4V3h3UW44bzI4T1NCZlVFWFI3WklFR2x2UFF0NUswMlBzaHA1UjYvMS9m?=
 =?utf-8?B?Qy9GZmdLY0xJREpYdkxSUUpKVkhlOXJjS2thV3FLUGgzKzJINEJEMG4xSmlP?=
 =?utf-8?B?Q29QOHIzUkVIUUgwdWJxdHYwcFpwYmNzaUNsOEljc0hLQXRKUlBzSmcxTmFn?=
 =?utf-8?B?RXJDcnhsbUtxeXVnRzFaSjZKdnpHRTY4U3dibmtYNVorNnFGWWxOZlZGbngx?=
 =?utf-8?B?QnptWDhRSGJwUWVoa0xBd2swdnFTMW9Ub09tT0pkOW00b05MZmxiektyY01r?=
 =?utf-8?B?L3Zkc0MyUDRFSDU4TUs4aFFTSXpsM2xOWHhzNTd3YnRCZHc2cHZSTmpTNDk3?=
 =?utf-8?B?aDhXZDFDYnZIeE1BSmtsOEJaMzRFZnp2aUhCdU5ic0ZHN1pZUnViVFN0UnRw?=
 =?utf-8?B?YjE1bXVieFBuaGNlZjF0aGVUVk85eFhxMGZiL0g2bVJWcnpVMVdTOFRqQTBL?=
 =?utf-8?B?YTVYY3lGVDlnd2VhN2hsdVpJTEhtVWRzcjhVUFFJekxZdEl2QWF3OG02NnFl?=
 =?utf-8?B?THFhTnBKOWtJNVczeXg5NnZvbExRT21aRWNIZlNIWGM2TGZIV1ZmT2tpR3E1?=
 =?utf-8?B?TW9NNldHN0dSUlFTVnFOOSt4OHZyUy8xTmpjTjVxamI3UlIzRGZiYXZ6b3l4?=
 =?utf-8?B?N3ZtUmw2VkNqY3BiVVZiSStyU1FGZFlmLyt0SmZnWm54T2NrWDBad3RjYW5X?=
 =?utf-8?B?d1pqRmN6d3dibktqc053YTdzUmlrTmFhVXNjV3JRRXV4RndZd3hjdklDd3V0?=
 =?utf-8?B?NXU4UitYUVZ5WEk4cjduT3F0Rks3R25QaElGaGZDMFJIWmtKUkJUOU8wT0ll?=
 =?utf-8?B?ZG1HdlBjVTlTYy9mSUV5UFcvMG95OVA3OGU3SEQvSWFHMllzeUZwQ09RL3Rz?=
 =?utf-8?B?NVk0ZFJDalhHNUg2SEtDS0ZYVDF2bkM0aFBHdkVMbStvZDZyZllvYXoya1cv?=
 =?utf-8?B?NGp1WjBRemtjZzJxRFY3VjI2Qjk3aWJrV1lEbitkZFZHTVpLVjZrUUh5a1hR?=
 =?utf-8?B?SGxRcXlBQlBoNkREb21keWRiNU9lYjdUN25oL0FFK1ZJNENjOGdsb3kxMUtR?=
 =?utf-8?B?LzlBVG4zN1pPZEkyWTJpMWV0WEYrRXk3UktmSThUSnpBYmM5WllJWVBkVWh0?=
 =?utf-8?B?T3NwTUhBTG9QYkU1OVZyMTZJQVdNZHRxN0NHNVJjanYvSnEyNEFocHIvcTlC?=
 =?utf-8?B?aFI5SU9JYmpNSDRNQU1aRFVKSXhtZWgrMW9LMG40cFc3Q29vTnZ1WnQ3VUJx?=
 =?utf-8?B?cURiRzBOOVA3QUlYK0V4SzcvVDVWNjZ5VnA4RnhTdXo1bmhuK0lJZ0hsdkp4?=
 =?utf-8?B?MlVudnoyUldlblhoQ0xnQlR1a0tIQk1PM0dCVTB6MTNEV283VzNYbmxIeFM3?=
 =?utf-8?B?VFFleUtOYWo3N2RMVDA2SW9UVlJWaXBNR1VYWWJmTGZkRWF5TVNCZ0g4bGEy?=
 =?utf-8?B?M1grZ0FnK3ZmWVdoZVh6anNyU2pTRWJ6WUV4VXNMNGd1RVJ0TnJ2b3NkTDJj?=
 =?utf-8?B?N0FBeWt3OXlQelpDSWNqTHc0ZkhHVnMzTEtUSzB1T0JVNFBZSkdHZTdpcWtX?=
 =?utf-8?B?YUlNdklEdWZzL05XeHR4VkxPT1V5ay90a3NPdGpQSSs1OXhKcnpPUmM3dTFQ?=
 =?utf-8?B?cXRGbTRXRi9YT0lVY2QvY2lheXkvTGF2U0lTM2docHJ6M0ZqSWRWWlMyemQ1?=
 =?utf-8?B?MU9qUFVwemxYeVhGMzQ2MytJRzN2K1IwYmp2L0tRamtwWUVWUld3Y3ZJbzRw?=
 =?utf-8?B?WXF2dUMra0VSYkxjUXFTbWtYek1HN0JWUTc0bW5FR3FCeVF4QUdKVzV6b25v?=
 =?utf-8?B?VmpJWnBSdGpqekQ1NHFVT2VrZGRXSTQvUThBOHBtcThYWnJIRnZubVF0VlhI?=
 =?utf-8?B?cytrck1JY3p4NGxUalFmRkNZSHRPS2FGTnRMbGhOY3VobEw0amxYdmdkdzNj?=
 =?utf-8?B?VzlNSUtuQ2FyQ0tLdnpPb1J4a0dZd1BNenZDcVNjcnlwQm45bmljWG1yMFU1?=
 =?utf-8?B?S0tydWF2c2N3RWxCQ0JiejdrbTJ0b1ozb2Y0dmcvWHArMHJEY3lkVFN4bWVB?=
 =?utf-8?B?RytjeGdGZjVBT0lPME03UVhRdHlMS2tMdWZ5RFNUakRkRzlEak9GS25ZZWRv?=
 =?utf-8?B?UUd2UWEwV2Y2clpzQXgzNzM1bUZwODVUeTk2QjN4aFZUNjZ0YmozTHh6SXBZ?=
 =?utf-8?B?NmN0RTZXOXhBSlBlZWZrZFV2TU1NQkpEZCtLbkszWFNaUEl4L3NxQ1dTbDFn?=
 =?utf-8?B?UzhPc3M5NlhSUGJtNlNRcUtmL3dwUTgvWDE3THlkd0ZMMDlaQmVnbCswd2Jy?=
 =?utf-8?B?ZXR4SGRSTGlCSkhHbXU2akNWU0Y5WFlVekZ2dTJBMDNzK082ckw1alJkYkJo?=
 =?utf-8?Q?dzdb71e3gURlAMhU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B0024D2137A9143A5592F7C1AE4985B@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	wcX2S3WeeNZVQuWA0cG9SfaPAVhKGKpiD+GYafaB+fJysYLha9OrLSL2sK38EVR4TuyUQa1fSLTZfACElnnwABkqFjL8wvvroT582AGHZgEWtIEbeQmA5rPDfgl6ETGvgVTag/nfj6609bJZduiIx33zZHYOMGct3shgMgaFZE1RALwm9xn9MnpokeSOP3bLy61q829j1l3xJCPeZAGMbrF30XxuIaDdTb47eJPBPLLzUeCemtV+PgWjDjWx60su9f4K2us1VOKBLoW9e/REZoVjHAqBpp2qtBt4nX4BEp+P599JOasT/s7NrGW9cuQ84kPv8Wzg5AN/PYuHPpw4Iw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8LKBd6YlWCYGROuG3AjI4aqMWXY1Ren+6p+J4xCikW1yoRdigQflOBWigzsVfNZ2/FWEwI0wKrbiNFR829+9ZPJeNMazomQZzJy9Xh6aoKQBJzj1bKoXMpQwsRK7OwXtt4VYH72rBviP84CUF533d6cIbXnOjUUP9Bhaw4qlPkwaGs/1xxeJkOFcZYaG9tABiqvrf7IhHesoeXT043WqT5Usc071+V94sthATi0H+rWLCFS5368JSlUFHrPc+tyrwGDhChezhRQk6hQ5OE+ufNxZB5h2kJQrXax/I6lmqrjZ0qj3dWL3Sw+gd8pQjPXV8UXWyIFAz7Eg59Th7T7fH7prxc1R3JTVlZiE/ldG7CdSiH7UJJjDoSbpWoXfw35CwbDk8foCupq9NGx2XNoog/JMqLKSIQeZGgw+GWqo6wD/sQob3/pyrzm4//S3JBe8xh2fmo6XydIWJRm7AHZlcG0s40jOptVGy/vUGKxqw7zPOkYOx/SzzUJNfH70mzGREwtEn94HaSOlMpw4ZxREWfs6RhaNzoP/7y49yW2wOgfmgVEjKkVTQkZZ7z9iHoAd9r1RXbEg0iO8ogLiR0GSqqe1YrZrS+IvUlh0SXH+ucRl4UqcbFsiYTMxBjvKqdZE
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4435.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 935581e4-8a60-413e-dafd-08df24556aa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 09:28:58.9293
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cVTce59dXjrB2dPt/EqmRlpwaHsExi51OSN8bsEUAVqBbEmJE9RP0T5y3PLHqv6YKDmKoFoGjBQzAKgCsplLkQRoWoaBERnDw3LE3owSu9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR02MB10153
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNyBTYWx0ZWRfXy02NgXKhB8Ze
 0IafUC+lVd5r9BNRYcXysJdh8qA48RSe74gud5aI22XSrsTUy9Y3zhUvgO+vR8TOqm0fvWGWURb
 gASXXSY6DnbHtFw/9uSAmqo3myaUSMU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNyBTYWx0ZWRfX1fVuu4HCcbHE
 Urf5flHRq8MgWjOOAIUGd6IwwHj3sNmXPtZyMnQpJBC5+yDONUe+NT7zRSxFBcg54hXyOCRLlqs
 Ky+eF9UnnvsoeyVpV5vCYo3tRb06Ee/MDk0FiQ8s2c9eCWkzBOAIYF3eqmhZddBM3tfuwWDfhIF
 RwTZFsHINZcCyJZgpt9Znym+BHzyigxiZZ0oIQtFAjWuhYMKhmtyBKy9GviYoBWt8ptVrWaDLKY
 iFWe5phbooVbvCrTLGFICT/yj5Rdl6iThQYJV3qhiqMpfS8IUyuMMoo0SjVQFGIu8avI5cnCiha
 sduBIhcMKx1UwxE+mKB4LNx2QCKp8Ue6zEkUB69/FPP6v7qYNO+1CkZIH/a6L2kzIHOf9uVopK/
 iD05p9D5ePzg8YaU10UNNTGjzIRNAo8EAf6S2GboEXDoBrooCGXd5kwwfAolqGFItnppdoah0+D
 dVwganBFtYNEaUYwNOg==
X-Proofpoint-GUID: 9bq2nqSnSSD-bdLWTRKZYlOpOmpovtPx
X-Proofpoint-ORIG-GUID: 9bq2nqSnSSD-bdLWTRKZYlOpOmpovtPx
X-Authority-Analysis: v=2.4 cv=LvYHWXdc c=1 sm=1 tr=0 ts=6ac610e3 cx=c_pps
 a=bHIXvagi91jMHRqDarHxyA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=bDdBU3oEAAAA:8 a=QSE1v3xbPfCcp7WvJiMA:9 a=QEXdDO2ut3YA:10
 a=DN7SgORnOiO7RqxRx1GC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070037

MjAyNi0xMC0wNlQwMzo1NToxMi0wNjowMCwgUGF1bCBXYWxtc2xleSA8cGp3QGtlcm5lbC5vcmc+
Og0KPiBPbiBUaHUsIDE5IEp1biAyMDI1LCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6DQo+DQo+PiBU
aGUgbmV3IHNiaV9lY2FsbCBkb2Vzbid0IGhhdmUgdG8gbGlzdCBhbGwgOCBhcmd1bWVudHMgYW55
bW9yZSwgc28gb25seQ0KPj4gcGFzcyB0aGUgYWN0dWFsIG51bWJlcnMgb2YgYXJndW1lbnRzIGZv
ciBlYWNoIFNCSSBmdW5jdGlvbi4NCj4+IA0KPj4gVGhlIHJlbWFpbmluZyB0cmFpbGluZyAwIGFy
ZSBpbnRlbnRpb25hbCBhcyB0aGV5IHJlcHJlc2VudCBhbiBhcmd1bWVudC4NCj4+IA0KPj4gU0JJ
IDAuMSBzaG91bGRuJ3QgYmUgdXNpbmcgdGhlIHNiaV9lY2FsbCwgYmVjYXVzZSBpdCdzIG9ubHkg
Zm9yIDAuMissDQo+PiBidXQgYWxsb3cgaXQgYnkgcGFzc2luZyAwIGlzIHRoZSByZXNlcnZlZCBy
ZWdpc3Rlci4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxya3JjbWFy
QHZlbnRhbmFtaWNyby5jb20+DQo+DQo+IFRoYW5rcywgcXVldWVkIGZvciB2Ny40LiAgDQo+DQo+
IEZvciBldmVyeW9uZSwgbm90IGp1c3QgUmFkaW0gLSBwcm9iYWJseSBpdCdzIHdvcnRoIGxvb2tp
bmcgdGhyb3VnaCB0aGUgDQo+IGNvZGViYXNlIHRvIGNvbnZlcnQgYW55IFNCSSBlY2FsbHMgdGhh
dCB3ZXJlIGFkZGVkIG92ZXIgdGhlIHBhc3QgeWVhciB0aGF0IA0KPiB3ZXJlbid0IGNvdmVyZWQg
YnkgdGhpcyBwYXRjaCAoZS5nLiwgdGhlIE1QWFkgZHJpdmVycykgYW5kIHRvIGRvdWJsZWNoZWNr
IA0KPiB0aGUgb3ZlcmFsbCBhcmd1bWVudCBjb3VudHMuDQoNCkkgc3RhcnRlZCB3b3JraW5nIG9u
IGEgZm9sbG93dXAgYW5kIG5vdGljZWQgYSBidWcuDQoNClBsZWFzZSBzcXVhc2ggdGhlIGZvbGxv
d2luZyBjaGFuZ2Ugb3IganVzdCBkcm9wIHRoZSBzZWNvbmQgcGF0Y2gsIHNpbmNlDQp3ZSBtYXkg
YmUgdG91Y2hpbmcgdGhlIHNhbWUgbGluZXMgYWdhaW4gc29vbiwgc29ycnkgYWJvdXQgdGhhdC4N
Cg0KLS0tDQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9zYmkuYw0KaW5kZXggOGYzOTg5ZjExYWQ0Li5hZjFjY2VhMjIyZjEgMTAwNjQ0DQot
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYw0KKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2Jp
LmMNCkBAIC02MDUsNyArNjA1LDcgQEAgaW50IHNiaV9kZWJ1Z19jb25zb2xlX3dyaXRlKGNvbnN0
IGNoYXIgKmJ5dGVzLCB1bnNpZ25lZCBpbnQgbnVtX2J5dGVzKQ0KIAkJCQl1cHBlcl8zMl9iaXRz
KGJhc2VfYWRkcikpOw0KIAllbHNlDQogCQlyZXQgPSBzYmlfZWNhbGwoU0JJX0VYVF9EQkNOLCBT
QklfRVhUX0RCQ05fQ09OU09MRV9XUklURSwNCi0JCQkJbnVtX2J5dGVzLCBiYXNlX2FkZHIpOw0K
KwkJCQludW1fYnl0ZXMsIGJhc2VfYWRkciwgMCk7DQogDQogCWlmIChyZXQuZXJyb3IgPT0gU0JJ
X0VSUl9GQUlMVVJFKQ0KIAkJcmV0dXJuIC1FSU87DQpAQCAtNjM0LDcgKzYzNCw3IEBAIGludCBz
YmlfZGVidWdfY29uc29sZV9yZWFkKGNoYXIgKmJ5dGVzLCB1bnNpZ25lZCBpbnQgbnVtX2J5dGVz
KQ0KIAkJCQl1cHBlcl8zMl9iaXRzKGJhc2VfYWRkcikpOw0KIAllbHNlDQogCQlyZXQgPSBzYmlf
ZWNhbGwoU0JJX0VYVF9EQkNOLCBTQklfRVhUX0RCQ05fQ09OU09MRV9SRUFELA0KLQkJCQludW1f
Ynl0ZXMsIGJhc2VfYWRkcik7DQorCQkJCW51bV9ieXRlcywgYmFzZV9hZGRyLCAwKTsNCiANCiAJ
aWYgKHJldC5lcnJvciA9PSBTQklfRVJSX0ZBSUxVUkUpDQogCQlyZXR1cm4gLUVJTzsNCi0tIA0K
Mi41NS4wDQo=
