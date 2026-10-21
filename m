Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.72.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792587162;
	b=O4FENdCGwpwkMNUeC4cnVjE6EoGdbQ95w+3ulOrCKkjGSL03xgrStAgGF9/IIMPM8Q9S
	 w3e8IAfdMmMNMGY9o60rtE7FtWjr9Oy/TpSb/JdxLMVAAqVra9alShoaKw7Zt5CtstP1I
	 sG2wQ20ZACHlSi08Iz6fiO7ShWdbrqCqLhkDrKLZKhkxWQxZexxZF0cBalqJca94/1jDF
	 a9+cWADbvhvrW523YnSQb7mpkp95YR7U0EsTYDL8UhskwV6E/S/QSchAs2JNDa8Rzz5AF
	 l9iTm3ns1Ph2/qC9xWQiYgrVc+ds5NntxgHfr4Appe+H1PE7wRU4ETGvKy6o6v3vc7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587162;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-exchange-messagesentrepresentingtype:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
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
	bh=wU+LcX4FRbNYpRuEnjYxTiUMOh55Mx4Trj8JRoTFFu4=;
	b=LNnOHMnbUfp+mb50qLETFDSOb4yGFqyLyab8HXSrXdEtvKbKSaYCkuMqHGsf6Nh6cBlb
	 YdkEp9xZQUQeWyMmemzS3QKvAp5aE4wBTkEwEWEU5OfGTEOWD6xJ6lSHSJjlsp9ffNwcV
	 ItxlOvH+1GT8x9JlxRlAFi/jNUFAN0RICwN3wNJ8rBDRcw/AVDFGM65dGP4LzByPscaG7
	 PB4Ar8D7kg3HaMFbBqVGNIaMVReWWKIPpMf7OHcb64sa55DawghKFttdrcU8LC65yY6ZN
	 DbuqjLe6isDM2iEAL/DqRk5y0QI/t7H8jy4qcf/YgIEU9ZfBOxXpaaMby39nkRMEjMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=SfN56+fV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.72.19
Received: from SY8PR01CU002.outbound.protection.outlook.com (mail-australiaeastazolkn19010019.outbound.protection.outlook.com [52.103.72.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25088606A319;
	Wed, 21 Oct 2026 12:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25088606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=SfN56+fV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RA6I/unVKKQ6CauuxMgOKO10cL4ESfYsnkA0PCeo3gjytkOncaIQ/IGYJd8BbK9LlcB9OfbSI/H/2cVTZSq+Ece/VLH2cjfEGV42Mcpr6JafvguPJo/H4oSAzdztMqlSkUWj0qstKGRCwqUbxix2fWs3uzjKGYt7hAlPJaGko3bYGE8acTSRpO2Va7ji5NYd2h4xQUMV6kwbtBVnJvtjSONkvDXPgQwHRNLXkX10TXVf0hGFk1F5CqnEIrsl/q6dC8LQBB7JL+VxJMzajihzGi4VI4Tu75EyzqB65nrhatEeFAoQ6hz1mxVkAH3FP0aKzospOB7BFonBtMiu94O0GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wU+LcX4FRbNYpRuEnjYxTiUMOh55Mx4Trj8JRoTFFu4=;
 b=U9C/+EjUv8jb7LJFOVM8yuwpSi/9S7Z9T4LIixkhxj4KsHVkKsn+fSPedV7qH8GT7VgwXdMc+bVTqiksYNxth7n60qZMehjgU98Mevjmh6zdnqUm6rmdFyJIef/PZ/UfVblFUxFElRBGPJa8JjsnZieeCk8N1v7ocrUJr/pEHwLhzKFbAhNqx3x815FqWkWlF320lKaSmjns8acY16MVPWTy2qxl5DAf5B2fEzKtkqh9zSLJRlkSpu31lyG6rzDPRahVgJ/7xPzb4OfUWQt53dd7V5Wbf4v4/IuLyo8//5zqSgEtroYSfXK2mU9gOLsNw84FoXJAeO1NE+jJ8nHIWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wU+LcX4FRbNYpRuEnjYxTiUMOh55Mx4Trj8JRoTFFu4=;
 b=SfN56+fVf5lyUJiKq0jTcu64GJcMgTLS7gQN3lUIMU1B3J97xUnSj8e0FAO5d7DYSWuKFw/IkYK07zQTR3xobWx5qAOa0wuXKkL6OO0qSHG5/E4T1eMPmDMfX3TvmvMEXrHo4/gLto9fFY1/350FVRkKUtlwDdTLMa9J1rrjEOxzIbR6t051gLUrMAJAhYqN5E99n1DtypVxlwDRKZEfXzhPUNhh/Li625U74sIOkWHBtDunMGy8FL6MXnekgTglRAAwR/18f+3Dyahzn4Qt/4JUMdsw+pyuD5VMkP/xvEDmQ7deITPvX3e8h6zcvT6pcp7PhhV0m8rLCr1hrrl3vg==
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com (2603:10c6:10:32c::14)
 by MEWPR01MB8671.ausprd01.prod.outlook.com (2603:10c6:220:1f3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Wed, 21 Oct
 2026 12:52:33 +0000
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19]) by SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19%3]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 12:52:33 +0000
From: Zhang Jiaxi <Z1529105815@outlook.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson
	<andersson@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH RFC v2 2/2] arm64: dts: qcom: Add a minimal Xiaomi Warsaw
 description
Thread-Topic: [PATCH RFC v2 2/2] arm64: dts: qcom: Add a minimal Xiaomi Warsaw
 description
Thread-Index: AQHdXYaO/yfvzmB1XEqXt2LWYTAxw7cH0/eAgAAnDY0=
Date: Wed, 21 Oct 2026 12:52:33 +0000
Message-ID:
 <SY5PR01MB10600F961AC57A32262D99ECCA1662@SY5PR01MB10600.ausprd01.prod.outlook.com>
References: <20261016-b4-warsaw-minimal-usb2-v2-0-1b03496396b4@outlook.com>
 <20261016-b4-warsaw-minimal-usb2-v2-2-1b03496396b4@outlook.com>
 <d5d28d79-474a-40bf-b511-e20fb0897b91@oss.qualcomm.com>
In-Reply-To: <d5d28d79-474a-40bf-b511-e20fb0897b91@oss.qualcomm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY5PR01MB10600:EE_|MEWPR01MB8671:EE_
x-ms-office365-filtering-correlation-id: aa91051c-4879-46d8-233d-08df2f722cce
x-microsoft-antispam:
 BCL:0;ARA:14566002|22141099003|38102599003|25010399006|4140399003|8060799015|19110799012|22091999003|25031999004|24121999003|8062599012|31061999003|15080799012|24021099003|39105399006|1602099012|10035399007|40105399003|26121999007|102099032|4302099013|3412199025|26104999009|440099028;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ACL9acsMGHqy/xmgf8QZLHGheDOnmZi355OHYtijTg9ZxSnb69BMkbJGp/hK?=
 =?us-ascii?Q?VBkvRsNFn+6FU5kSWQ3Z/Zmn9hy/fVZrHrgL2NE6S4CSD6bAgKQeMfsl++VN?=
 =?us-ascii?Q?TW/4ubGC/ESMZPhptYBF6N42WFAMBUInlRrkDDnVgUC+5o+IvFHm2yXzNOSr?=
 =?us-ascii?Q?yAQFvl0cJp33ImFoC5PhRwaz8gm71vtrUGcDxs8k6DoiuKFvVxDPpB9bYGZx?=
 =?us-ascii?Q?n2wYT71KrNe29BpEUv1eIc2p+sMtZudS8ns0EHcceKrdPkAWDuR6tN/4pGgV?=
 =?us-ascii?Q?PCB/syRgEEt/KupwIEhqDL6vX5mV1Vr4lq439pxEBAoIl2uh3Sb6L0Wf1xzF?=
 =?us-ascii?Q?V8MC3sW9nHMa/Sgx/GGCB+3FGccNzVtpr2zqVLHvePxbWDdX8c1OAO0GH0L+?=
 =?us-ascii?Q?kpFSr7wNLLjmebXUF+auQWp12nT/GOy5nwgLAEsgMoLOcRFYAuF0g8Qs8OJT?=
 =?us-ascii?Q?tVpnm0IdfinPTvVvf+ZizBXBmR+KO3pMgtI+WpmpBuLWJBOfAjt9sAcWlb4t?=
 =?us-ascii?Q?vLENFpePD90PwVTD5f5YjSVKBOZLl7OGpQo25CwOoiOh1iuxNGIGBioUROT+?=
 =?us-ascii?Q?4P6V+JCLaXe9lVsKp1oSzT/tUb2gtdyd5+bEQ4ibU551iImcg/RMESjYz7Iy?=
 =?us-ascii?Q?PmYBD83yZoIv5SSi9DwVMDZU2vPIpwhat67WvN9lQCisllzI9oZdH46wWucR?=
 =?us-ascii?Q?8fdCoYJjrYcxBUMVLjhpyjdzb6lkhtgb7u0cp4cGjyORT/4z2Z3iSXN1mdu/?=
 =?us-ascii?Q?OsVGWHnpI+Mh0MXuKb7r2FymobOxPC3Q4D6kmbJBtaCmxJm6SLwSNJoEKU8V?=
 =?us-ascii?Q?y3AGDQ+RE4SrzF3KrrnReC2hm+BrEobxr7FSrX1jT//sFHay6Ru8q0Kx/Aud?=
 =?us-ascii?Q?6OKPhfQR0H2CZhUgm0GXy1r+MGeb2SVMQycnzxW3FJGX/6E5gux4Wzx7kKav?=
 =?us-ascii?Q?uvuOubRlSG1ey929kwJj7MIf3bD0/S+Y6lTHT+7RULhxzIS6oamX6RvYi5nd?=
 =?us-ascii?Q?f93EvVpBQS3kRD10VS/rBQr3Zz9AefEMdBEz+ZFsxaCo5BgK9ZnE8kxRUYhb?=
 =?us-ascii?Q?AEIrQCgG14pZmWc9ntNl8bTwjj/U/EuHXWFwQfP/mxDZi1wA4J3AI1Rs7JVO?=
 =?us-ascii?Q?TZfsDWbh0BjdaHjmf27h0Keq+Ul6LiKPJcLxHoz+L76BCxf64AyKdTg=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?iRpsTL2GZvUwAtRA6KopMZQZM3K1v6kzovxHKgWzsBF3q1WJ1ncgNRPWVZlt?=
 =?us-ascii?Q?o8GjkzVdIGj0asYWphVIOKYlAL8Oq0AuqHqQKZhA7Ext2BgLzQZeFSQ7S/in?=
 =?us-ascii?Q?Qkn/qstaGO0GzVcbSCY3arIVjbQtT06xzBAoXsZzKmf0R+yuD+qwY5wv/juC?=
 =?us-ascii?Q?274oswQWvQZnSfrMUQZEn5JBiUwyRW74qchd1KEXXASQ1Xvxvbe/oHwt36eG?=
 =?us-ascii?Q?yraFUp8ageKlQKlWRI65ry/FdaXkf2mb7m3hRzcfNTz9CwxjN0xxOLSXMM3E?=
 =?us-ascii?Q?iRA/N0rRcQuA/x8PQ+/uqt8yvHa0vxhglUemvu51wwpYVtWDCLFIohC29sUB?=
 =?us-ascii?Q?VB9+HUSMAreA2EtEllDj7l90ruE1CQ1cIXEPTNbbSqqMm8tpD2TEKPLmlmQd?=
 =?us-ascii?Q?6E0J34R9EUyUR3YGDisi1/U/6JREuLKFCzNkph9MXZXEeqrv21kUzJqwFCAq?=
 =?us-ascii?Q?Hn3jdTyUTEMGHWaJ8cR0emkB5PXb4Jq06cBTFAFoI7bOdPBhZ3T1Fahhitqy?=
 =?us-ascii?Q?+qJsmPC3HvSjJJojRAfRlHTz9fPSbaF5p0cDEdF9rHHMaXfgJqKg43I0H3Y4?=
 =?us-ascii?Q?5HRmnblH+sE8fd2Zm8m4prl38I677UuzDDzrorAYgPPanWQPYTGPa9TklqW1?=
 =?us-ascii?Q?kJgP5e/HCd/aYzoL/5Df+yOV8Dx1ybHz3virTZ147PqbibEwF2OKF2XF99qO?=
 =?us-ascii?Q?m7b9B4g+1KVbBo6KApsRun69RqVItmz5ZNZ2iHhVMjiGe0sT91v/+RSturwt?=
 =?us-ascii?Q?SDj+eD4Qqsyjzb+Lef5tvcWWuyDTHfa2m8ZKJwzC2DZdGVpkUW9P8Hf2t0e7?=
 =?us-ascii?Q?9nzZehSkpMPkYYeRdDGVBtavnLhuW8GtG8QFJw1UjSsY8kBbsrXeYwCIY0SH?=
 =?us-ascii?Q?jI/2Yfv4Ne0ciizxjFMQ5zR7LKxyt37ynbQ5SXSaelzlhiPcQFGH0hQxuwpN?=
 =?us-ascii?Q?RxruwrP5oKv1TPwydfKd8cqPEGUUTDD0L+V/WmHBWaLYkRteAFP80f08Gveq?=
 =?us-ascii?Q?KpkhS/cuG/pUxu0BYWCPMfvT3zqQbsycBND3uW5d6uQbXRrjrVPH9soPRtUH?=
 =?us-ascii?Q?y2LZNaXqhKcCbxTOGwslc+HsNTzzpSZ6DNV+D9HDo8Ru9NQu0Ac2gFfTwwAC?=
 =?us-ascii?Q?Lzd6Z09GOz7qqPFaCo2B/MEJNFrPjtEqD5Fq8F4xGTWb1vHPQNT/vImcmTZ2?=
 =?us-ascii?Q?9PNFuWs+YUAoVgGnIixFqdEqhLcnmN8Wt+Uh3jhvqsqqVoq+6JyndrlGGfur?=
 =?us-ascii?Q?2fSLjQAxfsgZBA8CzncFO4mgKO2drtvAzlVp+ccWcHbgoYRqmna1QlJ68uR5?=
 =?us-ascii?Q?rpO34QF2H3eWnj1RUL8I44KoyE+LfWeT5/wp7Wt+DO6KlUX2JWgVhU4pMIYL?=
 =?us-ascii?Q?BZiu99Dczl8DUChVE0akfXNflEZZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY5PR01MB10600.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: aa91051c-4879-46d8-233d-08df2f722cce
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 12:52:33.4016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEWPR01MB8671

Hi Konrad,=0A=
=0A=
Thank you for reviewing v2. I have posted RFC v3:=0A=
https://lore.kernel.org/all/20261021-b4-warsaw-minimal-usb2-v3-0-9f4213ab83=
ef@outlook.com/=0A=
=0A=
It updates the model name, node ordering, common PMIC include and GPIO=0A=
reservation comments. The cover describes the revised DT's bounded=0A=
native core/USB test and the Codex/LLM assistance used.=0A=
=0A=
USB remains restricted to High-Speed peripheral mode in this RFC. The OEM=
=0A=
configuration retains OTG/UCSI role switching, so this is not a claim of=0A=
peripheral-only hardware. I would appreciate your guidance on whether=0A=
that explicit initial restriction is acceptable, or USB should remain=0A=
disabled until the dual-role board integration is included.=0A=
=0A=
Best regards,=0A=
Jiaxi=0A=
