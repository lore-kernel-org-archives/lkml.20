Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.154.141
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792459584;
	b=ggqSAjcSmINWH8/G9xSWLls9Jlbfe2oygQ8QG9FUvRWysu/rdn0wbPMh1l7MAQl6+7oc
	 7TdcLwLUR5agps+kN6QTS+5SBihp1PaC5MGmKB5hamc3L2S0j6SMDWZ+AaW0aAEyvY2dT
	 vSk9sBmPMPcV7D/NNJf63WxPL5CTH/I6fLjipcX2wwfMo4BPnvROESho2U9XwaOpD4xX8
	 qQgPsQU8+n4A7vtDNvItloWYwTU0rlw9u5TK9y4TH7wOy6kAnXZKj0BdiWjZqKFxll5VG
	 2l+Lq+WLJnxlaRFn3VLSET1jRJx/b/rvOWrdd1nAHPSX3knP/MrnDLXJGPVs4qWfXFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792459584;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=zsU1EdV+LtoFOTDvlNWiZam6dcM9p2Ejd8XJ7enufO8=;
	b=3LW1Wa2xLLTFwfIYwnrCvfkg4lUUBJVsdPDB46nczXyQBflPb+QpuW/DzKNkI7tGoFoi
	 d7cGQm+RZISaf3t+Hb4q0u74lVWYRjv7uVKqqWjUj5FUCwpzjkNPKshZl/dUWtw2V/n7j
	 WMgNMQAzIfGiqnHk4/GpHats8ADdR+p0IbzK+gbbGkS8Xs5mTJv99Gb6iFicQg4lguxVZ
	 SPIvBR/3U0BW++GrCz+jTht/ow6hLqFOCqZKxu/9klZ71QVJ011nfP80/kKa5k84gCsQB
	 PNcr2HUFV5U2XazYrmS9RbMqQT4czPaYiqOQxr99E9vcm/1iA6lC5UfRF6LB6asSaHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chipsnmedia.com;
	spf=fail smtp.mailfrom=chipsnmedia.com;
	dkim=pass header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=pzZ1bjR5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.154.141
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11020141.outbound.protection.outlook.com [52.101.154.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33173606A319;
	Tue, 20 Oct 2026 01:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33173606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=pzZ1bjR5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WB8XWtssi6DEouauf0VNwMP6fOjP3/LIm1dImUPDqBLc8Y7Nu5Cf4+cRR8107gsEnZ+zUo0jO5mSIOBAcxGK0KoeXlStKWHkgP2CnxXCSQJFbMqaAPdxAeMVmLtvvji5fttN3nYaQZQV0MjMe/0EsjNi0UaCQLbk8dhnXjpEI+KYa8l1XXoH2e07oBDWI4aewsBIT/uAu800VX9KgT3bvWWxqNxHIDarK8YxC3dXtPx7YjcuTzI4hiXrVE22bhR/JYffkBAKjmy1ccJ7l94CFCFp6brBShNqORvCQ5u+gPlC4EK6xxDjdN2YjEVQe2hEMBTQz2HagF9SvKRKUFeTAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsU1EdV+LtoFOTDvlNWiZam6dcM9p2Ejd8XJ7enufO8=;
 b=M6nasy2kXbRG0/9rcCx3OfmEaay+ZXgAPntondAIGSrcaC/KioAKZKIneLbrd4w6FlLWR27VuhBmj16yHFM+rAA0HQ8cjCR7Co6173NdoGuLWd6hzTJEurkeuaVKmu6uZ78GsAmujTieZZMztAdF3WX7gABU0nkyiAmgMhbr+eAPPDA8kAFhKnmGoI3TMrFUwtl9KDBVo07fFwj5Ho16zoD8Pqcv655wKQtAW6P0lZvonrl/kgA8pxJqeZ4HyR0d2J1KUb64h6CSm3RnXlu2fJDjK3aW1H2KizJmn6muUWds/ipVJVNt3VMV8YNpPN1DXTkFzeIse9m0JHafxt8k3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsU1EdV+LtoFOTDvlNWiZam6dcM9p2Ejd8XJ7enufO8=;
 b=pzZ1bjR5lL7E4cCWx6BIrKbCNeuiVQIu3R0Y1Jlf4Q7lnaKESpwj7oetLRuvfYOGHYs2k+/Ypv8WiPanTtlX7r3esECkDhqAN5VbOdRVl68aDufo1gienyvIn57OcH2Cvw0cwBq4SsSEOi3sv4iqk9CjBHJLTkSbCmY7sC2GKOI7Z6BmvzoDGZHXPR4yoLaMiYj+DZK43D5ViXniOUB4IoRx1f/7u1LQYfZPWKtq0+9NNP7RrZ2pxuHyy7UA5ayOcFJDCGK+A/jbLoCd11JuLYZPv9VON9KrfHJg0n9cLPCGIx+N4/CihGZfgfhu1BPPrG/E0c6I/OJR5uSXmLRGwQ==
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE1P216MB1800.KORP216.PROD.OUTLOOK.COM (2603:1096:101:63::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.19; Tue, 20 Oct 2026 01:26:19 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%5]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 01:26:19 +0000
From: "jackson.lee" <jackson.lee@chipsnmedia.com>
To: Jiale Yao <yaojiale02@163.com>, Nas Chung <nas.chung@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Hans Verkuil <hverkuil@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Brandon Brnich
	<b-brnich@ti.com>, "lafley.kim" <lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH v2 4/4] media: wave5: handle runtime resume failure when
 closing
Thread-Topic: [PATCH v2 4/4] media: wave5: handle runtime resume failure when
 closing
Thread-Index: AQHdX6K8fCfIg+kJ0kKP5+YmfZdSDLcFooBA
Date: Tue, 20 Oct 2026 01:26:19 +0000
Message-ID:
 <SLXP216MB114802B1D531E9B75068A621ED672@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: <20261019082026.1798945-1-yaojiale02@163.com>
 <20261019082026.1798945-5-yaojiale02@163.com>
In-Reply-To: <20261019082026.1798945-5-yaojiale02@163.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB1148:EE_|SE1P216MB1800:EE_
x-ms-office365-filtering-correlation-id: fd69ec90-28fb-4689-8182-08df2e4924d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|3023799007|921020|38070700021|4143699003|10067099003|261009223027099003|56012099006;
x-microsoft-antispam-message-info:
 qxm+hFvhfC7bC03oj4FJAwKMJbDv9Ob47NR4Uch0QKX4lBrSBdfN2c4IYppwLhD73Rbsi2cWZSUc5tmlLzZvUV6TrPWwVa7jjgSee0Xhf7SenZKDcH3BYSBj74I9ncyKBmvzcdjYKQKJf7R9YN5l6CQedUiIx6ECr/kcPBAik2OOQPVpbiVtAQlGlF7y0d1EDX1GlA7RNCgsY2SVy6sEtbPjmT6imGXIJ+hpRb8wV/7dXQ3dALacf7HlYKg6Uc90if5U9cwVgFCrOPl2fMEP29na9lNo0dqSp+8mTjhvAYJz7cUsPNTHuZ3LbjXWnzCmsyhyKhUg/51q6CjmlzjHQeLpGZP2F3lUptkLyWCKpG5jGgz0d/1HpAzQrEDEQnoo7C1PI/v7omgU5x92eR4IM9XWIbAlSWJIZCnS+N2W8FswJYkfqpXJFz8fmRQvBWKT+FoHTw5AKh+a1199LM1ajcNx4QssO0XWe7OipRMxjq5ffJVBqXLvy+JITE/AqPmH11nPcWyL/nU/moOlNpw766NVH07r2WewHDC7aOtDQFQydc8mBW+9Oyn+xPkns4iM0aoJBTSbCUQQR0hm0qHg1UcOyQzdByT0gKcgANDiaFx7RnNkg7BMDrCWyg8Q2VL8O9GgPMRn01Z1O3JAN4Sb5T8riHpRvIsBoqMLsJBn+7wb7rGMIJDjD/1sQczLU25ld69r5R6hLDH9Ay1atla8TNvw4SIPcuv8I/P2OXAbTPs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(3023799007)(921020)(38070700021)(4143699003)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?p0KOFUlMP72IdLnHn8qbF6yugxw32JP9/9K5K2TTtCtHJhyV8NdiabHDBXuY?=
 =?us-ascii?Q?8AgtWXIp4YO+bWiSpSmWYcjlJN2A0LjlA8E7g5fNbOaUMdZ7feMPRJZwLcj6?=
 =?us-ascii?Q?1Avabi/HOTimiK9e8b9G6OV9OPtPzDVzIr8JWJib0jjB4NKzVqOdWaMHohcB?=
 =?us-ascii?Q?e+TTwk6W4+mPlt2Ez2xPVQrF8FjF9s1dn/qsC0OOUE6dXbs9M+Q6szYxQ9If?=
 =?us-ascii?Q?kDI1ohVo/bSpgXFMM+I5mT2UhVbTNJI9X5C8MclqejXtSsbIMdy4i/2FvHvL?=
 =?us-ascii?Q?DVkSoDoWFjwZ7Chebd5B2++HXFwFqTFIVhKw7fR/yM7CaAIS7bkAGAeVMkVI?=
 =?us-ascii?Q?a8aaHOfcg0Qh24gQSoMDDcWXRahy/VKvcm0cUF8dTyYZr3pFU8ijfPpYHvOn?=
 =?us-ascii?Q?Sm/aANnNL4opiBMIcs5GKhhzKOA2g4r8AhtJ7EmXhtBhc5jpPlH2zJmLBIih?=
 =?us-ascii?Q?6TzldNmk4ZhCyo69MIjlq30NtY9a50r+31bNrxraWm0RSjrEyJV5JYVbvEMO?=
 =?us-ascii?Q?IAOCdtTgzPsm7LrtIBCB8Kc1dVCricFFlqf2Mj6iLyQKF9rp/XGzxKo7bkCC?=
 =?us-ascii?Q?Ia3jc9+68xlKosBXqlRpszrzSvsn8kq6WgzZC8ujDZUPD6Y+YdTEvqm9N58z?=
 =?us-ascii?Q?E2fF44tKYLgdfbIf1Ccc9eDzOYfWfP7wahHNMb258I6b1W9iK2Lw3MqP+2zN?=
 =?us-ascii?Q?v3jyi33dmsClEiD+2EgtHf9pqAt8FNozjvFasSGNbykTgqriSFHaIqYOAMKr?=
 =?us-ascii?Q?natOPjOKP7D8JJWOzrkFvezcgF0NGvikvHHKD1h3VbOzgvySVRamqBDwDLgH?=
 =?us-ascii?Q?XKC30xQAUL0pP7DaNfwe/xXqgVrVWx7Ek/JmBbNQb3bSLORvgu6r4vkbAA+/?=
 =?us-ascii?Q?34vRweF7wu2aRH2NwbFZUBHusyrVygDv+stThzcXsfqEe6HzYR7YWc12+yKv?=
 =?us-ascii?Q?PcJOaWgtAbkVXHBz8SurimD0dJe999yMjIuDIDiUJ8skFslC/0VACnsCUNsc?=
 =?us-ascii?Q?KZpxkkUdGJzgxqnEm3a9feo5fg6LKbjLUoIBkyv5YRGyvH+4enCZjPdEb83K?=
 =?us-ascii?Q?Qeicb5uk4qyq/8s//E4dudn3CQYJUZ/6hIVk++qVpecd55luDIWdqBrQMW8L?=
 =?us-ascii?Q?14EPLORqiZCXcTNe5csUa3nrgPjxndZ6eTNLs2qJ15xB9k6Dkt9wQ/4XyUSg?=
 =?us-ascii?Q?Wr7QcEkatqb7pJ0zf2bN3xChhPMGWYXQLevkvJeJPNg8CcYuaRdUCnLMEAuE?=
 =?us-ascii?Q?p/8IB/SGWilcG71tkTmPs8GCdMJdFz+tCrQoEPF2t31HvrIRGgvwfxBdZZp5?=
 =?us-ascii?Q?aICRllpQV2bAAA9JlHKhKxz2yrSxstJyHFk92zw2vrjF5SYVcAqJd4oktCZn?=
 =?us-ascii?Q?AMiuW0h8MDaTGUC8iOqI7ht5G+WB8dVPSYRDF1hwz7UHHH0Cs9nzuT1xUXUk?=
 =?us-ascii?Q?jTrQAFMs+0DnYj3eXEcOj2oMNpi/AFPA3hO6xkBDgL4YqLLwFkUw9GK3s0+h?=
 =?us-ascii?Q?+8NdKezMcDNr2I5oDOfNQT1rYsl8CD90YXiRhs0HswhY8soL9wPT4T9lEo+M?=
 =?us-ascii?Q?A43QTHotjqwj7YJqfZHf7mWovvf+O4QVfLItK3gwUMXORQJz6n9Z/e+Z9aJ3?=
 =?us-ascii?Q?5n8urQBOCX7RsHM2RbLIiDq4osvngnDXqAEc80hMPkyCKXweShUQopN3b8Rn?=
 =?us-ascii?Q?XKgjZP4RedVUsuAjvN6GJskTxzbQKtf1RBTyNmDp/LRPy9Ietzbv4GHEn9zT?=
 =?us-ascii?Q?rW/Gu9y0Mw=3D=3D?=
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
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fd69ec90-28fb-4689-8182-08df2e4924d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 01:26:19.4937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g2lHiVX3c7UHqLXyDA3i9Tem/s6+lJnIYdtPBQkF0AH8zIA6g5xn+aWD/XY9T9Ri0F8ROOlnJLUF813IoEgXS1/jLKy72Jp5yNWBNdcaxMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1800

Hi Jiale

Thanks for the update.=20
The direction looks right, and the encoder side looks good to me.

> -----Original Message-----
> From: Jiale Yao <yaojiale02@163.com>
> Sent: Monday, October 19, 2026 5:20 PM
> To: Nas Chung <nas.chung@chipsnmedia.com>; jackson.lee
> <jackson.lee@chipsnmedia.com>; Mauro Carvalho Chehab <mchehab@kernel.org>=
;
> Nicolas Dufresne <nicolas.dufresne@collabora.com>; Sebastian Fricke
> <sebastian.fricke@collabora.com>; Hans Verkuil <hverkuil@kernel.org>;
> linux-media@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: Jiale Yao <yaojiale02@163.com>
> Subject: [PATCH v2 4/4] media: wave5: handle runtime resume failure when
> closing
>=20
> The decoder and encoder close paths ignore runtime resume failures and
> proceed to firmware commands. If enabling the VPU clocks failed, those
> commands access unavailable registers, and the paths later drop a runtime
> PM reference that was not acquired.
>=20
> Returning the resume error directly also prevents release_device() from
> calling wave5_cleanup_instance(). The instance has already been removed
> from the device list and its mem2mem context released, so its host-side
> resources leak.
>=20
> On a resume failure, skip the firmware command and hardware lock, free th=
e
> close-path resources, and return -EIO. This lets release_device() continu=
e
> with its common instance cleanup without issuing an unmatched runtime PM
> put.
>=20
> Fixes: 2092b3833487 ("media: chips-media: wave5: Support runtime
> suspend/resume")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  .../platform/chips-media/wave5/wave5-vpuapi.c  | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> index 4c1842f02c..806901e62d 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> @@ -220,7 +220,11 @@ int wave5_vpu_dec_close(struct vpu_instance *inst,
> u32 *fail_res)
>  	if (!inst->codec_info)
>  		return -EINVAL;
>=20
> -	pm_runtime_resume_and_get(inst->dev->dev);
> +	ret =3D pm_runtime_resume_and_get(inst->dev->dev);
> +	if (ret < 0) {
> +		ret =3D -EIO;
> +		goto free_resources;
> +	}
>=20
>  	ret_mutex =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
>  	if (ret_mutex) {
> @@ -259,6 +263,7 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u3=
2
> *fail_res)
>=20
>  	dev_dbg(inst->dev->dev, "%s: dec_finish_seq complete\n", __func__);
>=20
> +free_resources:
>  	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_work);
>=20
>  	for (i =3D 0 ; i < MAX_REG_FRAME; i++) {=20

On the decoder side, there is a problem with the ret =3D=3D -EIO check.
After the free_resources label, the auxiliary buffer loop overwrites ret:

for (i =3D 0 ; i < MAX_REG_FRAME; i++) {
	ret =3D reset_auxiliary_buffers(inst, i);
	if (ret) {
		ret =3D 0;
		break;
	}
}

So ret is always 0 after the loop, the "if (ret =3D=3D -EIO)" check never m=
atches, and the resume failure path falls through to unlock_and_return.=20
It then unlocks hw_lock that was never taken, calls pm_runtime_put_sync() w=
ithout a reference, and returns 0.
Could you move the host-side freeing into a small helper and call it from b=
oth paths, and return -EIO directly on the resume failure?=20
That would avoid relying on the value of ret across the cleanup code.

Thanks,
Jackson


@@ -272,6 +277,8 @@ int
> wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
>  	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
>=20
>  	mutex_destroy(&inst->feed_lock);
> +	if (ret =3D=3D -EIO)
> +		return ret;
>=20
>  unlock_and_return:
>  	mutex_unlock(&vpu_dev->hw_lock);
> @@ -750,7 +757,11 @@ int wave5_vpu_enc_close(struct vpu_instance *inst,
> u32 *fail_res)
>  	if (!inst->codec_info)
>  		return -EINVAL;
>=20
> -	pm_runtime_resume_and_get(inst->dev->dev);
> +	ret =3D pm_runtime_resume_and_get(inst->dev->dev);
> +	if (ret < 0) {
> +		ret =3D -EIO;
> +		goto free_resources;
> +	}
>=20
>  	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
>  	if (ret) {
> @@ -774,6 +785,7 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u3=
2
> *fail_res)
>=20
>  	dev_dbg(inst->dev->dev, "%s: enc_finish_seq complete\n", __func__);
>=20
> +free_resources:
>  	wave5_vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_work);
>=20
>  	if (inst->std =3D=3D W_HEVC_ENC || inst->std =3D=3D W_AVC_ENC) { @@ -78=
4,6
> +796,8 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_re=
s)
>  	}
>=20
>  	wave5_vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_task);
> +	if (ret =3D=3D -EIO)
> +		return ret;
>=20
>  unlock_and_return:
>  	mutex_unlock(&vpu_dev->hw_lock);
> --
> 2.34.1

