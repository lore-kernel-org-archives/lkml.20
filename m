Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020098.outbound.protection.outlook.com [52.101.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C6D48A8D3;
	Fri,  9 Oct 2026 10:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541875; cv=fail; b=qfQqIeI19bIvscP69oStxj3KTYRt0a8NQOZw1D/QXYZgU747ypCkGpHNyJ7xE5V3vQ0/thPC4xJP1NkwJrwhjKcYBoGOaeedpeeGcy+VXz2rkudzWnmvsBhCoG3CVsNfBbSJPdKHP6XmUs249F+0cE+L7Gl0CXIe6y6r3A4XctM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541875; c=relaxed/simple;
	bh=rX1c/4aAp++FNQcHzKGJp1kAqI1taQX+FPGbD21Nexg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NsYckabvRWPAKv2dYNvxc1yUiKBAVf452uQEDjxqsZY0GgJBHNPoXO82TULyb9VHl6hak8osBu4JmOC4WFKDG+l0iZlsfi5gS9Hn7ujxrq/+5dFrTyq4gUije5y4LRhA5MMuSvkAp1vhvPjQyWpeEdujnaRunwsVmBDkPKuXXgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=giCKzG//; arc=fail smtp.client-ip=52.101.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="giCKzG//"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IN+4MxfoDzotV/e2X5fdzunqNYlBLf3iekyP3es6XCLak4aBoQYD5tXKFNTlFFcT/8UdbKZNFfhoEGGwoIEV+DsODICPWafMuz1sfyd8nYMZmhS+iDFxQCqkqhVcg+x9SkIz3i4gNo7CSHiF/pqYx16WZyjbVcY5WpzUTNtWhj70/E0dszcLr3lkIXCxW/cwqSbsCMFyMFJg4bIuytP1puVDKNsxOGxGpyjwBvDJ6qb3fC/BrMYsd1MLtTae6b0UatIM16F4MmySdyTN6P8UddscfCopCLNCgyG17T2CvOQo35tCM0XOX543UcrgL0AixlivXMwNQOg35SykRzCnsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHlX0zrGPEsXQ7Z1MXXIxTNbQas2cQZ5qx4pBBHmcXo=;
 b=VKoKtoJweJhDTkAJtS/+hq4vUeYy92OmQ6BJDG/QhArUDMQjPdtUVkG80bGQebdmPljJ8l+E//msEc5aG7ySmrZAm3Ax17Ln+pdfAFyqp8CNCeH8leMa7WhMOLDGJNb9fTMFeq7SSeqVrgSvINjEQtDA9C5R1LAVRMYrNGUTAZ18NQEiV//lxMKL2G4y7/F5gwV6wndCtnc6hL52Ky3o/tQz87f2+BJLXn3F5aNtsgYyyr+zh5i5lD3b/WZNA8ezEm9egiAHvcID0dMf0Wumoo3aB4Ux0xeDuri1NKVzxFU8s2AGHk/y6VZ6XoHRTFHk3H/vN5/4sHlY7oCguYEuFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHlX0zrGPEsXQ7Z1MXXIxTNbQas2cQZ5qx4pBBHmcXo=;
 b=giCKzG//gOr6MO9JYTscPoWJvXN5RdcWsfnLIFVVEjFYiTwpPnnFR5JncCMvokX3pvPHgDV7v28J+sKhbxKOQYUwZI8vFF9oFGvJjnRlkHMSj6scWFRGjZq8V4UGI2z4uITwOPayb1NR0oJxkwUXmqPS4Jtb6OuWE4tB3BRZG52FfcVgICrOGEW3oFBD4OTkasrYipJxHFmjk2KZ8osx1AFMKyok3JhbGQBb+2cOxPU3dJaGJKiGx8bXAPg2wKlHuQxZBdtAZ8fvFkRWMPK6qUs5kL9jBq4G46z+ZyOoi7Ys3sNACy8SLlMymcuwf/yIYY4OjJ0LwrLYwHmlKnn1tg==
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN0P287MB2152.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 10:31:09 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%4]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 10:31:09 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: David Carlier <devnexen@gmail.com>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>, "mchehab@kernel.org" <mchehab@kernel.org>
CC: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: imx576: Fix line length register
Thread-Topic: [PATCH] media: i2c: imx576: Fix line length register
Thread-Index: AQHdV6k7FP1iArUzk02MVhQck4Naurb1AwbT
Date: Fri, 9 Oct 2026 10:31:09 +0000
Message-ID:
 <PN0P287MB20194B3A8041DC1FDD5D2DD69A922@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20261009044655.7586-1-devnexen@gmail.com>
In-Reply-To: <20261009044655.7586-1-devnexen@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|PN0P287MB2152:EE_
x-ms-office365-filtering-correlation-id: ddaf5b61-4e3e-4152-67e8-08df25f06ecc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|56012099006|260925021911599003|260925022911599003|260925021311599003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 A0yCKorlOMltUyOrxTqzz7whz900k+SV3tZsGECsn993+/46SAFMISSIBklrwFcT7ZigGVHIguN5PNx5zo+t8z/l9xjtXPk7ZYoBdMuPgBaKvi/+JSA/eKDNyYPH8acHZCJa10SnxpVvtLnVp1n8HX2MdoCsXitImCzfaVILWFmdrTgKOX3WF6LMiNurYsD6btGbl2+eIwDMT/CUFSTaFCW/I/pnf2p+SsACtYj211xd0Wy3+BYUE7Q5km03iIjxrsaO3e1Yf4ozLGmME7CO2TPVMbWHK7n8Oe2N/jlsdrYRjEf9sUYOi3pFojkULrvZE85U3NuKg79z6Rv4jmi0CULFJlgQgyohacMfPNFP5jc/YZvBjHmepu9LAS/R2BACML1Z8yGN8BBU9EVZgMCr9HYpLqaQLpNShMjUx2hOUXvsgpifrTNYmxtkWumOTCcke/PC7ofVfIWHFXb5USExsW0hueHdMSA3OMY2HQvZ2XGuH+gz4+FJpj0r39AxH0fAKBgtlphcqfwPEUZj2GgwxjUr/64g4Wv/9k1KVjENmx1uae4gu6KnaCUPN3qRMN5NwaaOFXaanTAb2VGN0rXk81TUZpNIYyONpZjV2xkuhdkpkiOZm5D8KhwQLT8bJqd6J7WOiFxEv5tGzk6WmrNokLLTmCZSympD5MpUIAD1PYucet6+qnEbsiG32FYxR2ZZ2WYqtoxlLQaYda8NZ1HCKS2aZA1N3QK4RToy6WpOtIo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(56012099006)(260925021911599003)(260925022911599003)(260925021311599003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?t5XqAOZfSTqEDTcsFyobMIAjK3+IbSy/6zFFnz4f3FXu3IBMbloxbTy6HP?=
 =?iso-8859-1?Q?HlNl71dD2tPJ6ZcymKKfWAdNeu0belEmP6yDxpp3ZxDy1yEPOLTkW3D/cv?=
 =?iso-8859-1?Q?unTF9d0honMAOHkM7ONJJLTMfSFFj/IiUjwY0k6SdSyO7U086DObIDrYE2?=
 =?iso-8859-1?Q?S26Wv83OyeHgDXb3vbEnCeBmj09n6sxL4hlJ0SlSm2wYpoTYWtuGy4kvUP?=
 =?iso-8859-1?Q?6xRTvHdJgAlVQBqVj+Dy7++TBFOC75nmEP6irUvzJx3t6khcfSPBwWNLrA?=
 =?iso-8859-1?Q?i2OiCPYYsdckh89CcZ06mKfDC5sxuPhlsdvoimfZrH16QxoU6aVdPw+zNm?=
 =?iso-8859-1?Q?3X3BHIUW1JF+szXEkQCDaqGpZKLfofya0JA6Y1EkNABvUqG7CTbw1G3IZz?=
 =?iso-8859-1?Q?Tk8XDQ/8VSLccx9zZb40DO1Yf+QHRIH8um0uVU9U+q3ScHMig9++I/6fyJ?=
 =?iso-8859-1?Q?2sMiiBfvJGOSFy6D19JNGciGVqbjW7oz3GKSVhFPFBgelqS05IjfEqwMzS?=
 =?iso-8859-1?Q?M52bvyD7JoMVwZ65y4zrl+BxgfBccfl1kuXVGUet8TNMIKisnGyAuuqIbq?=
 =?iso-8859-1?Q?AjrtqX0uBRVJ8SS66Jw2MT6/J1kFxNaQEOtB80QxusPtOjbztDPA1/7dWV?=
 =?iso-8859-1?Q?lLENpu4lC8Ri45snTfZeyDsGm/uUKJptFVPWa9AeGKUFk4UGKmsfNlyPTw?=
 =?iso-8859-1?Q?SNjkzDO2C7Xk+oh61yYJ3rblv5jH5NDOFDXlQrBXhpv/uNnC6RqiN9s6ns?=
 =?iso-8859-1?Q?GZzpo29HoVMzk6mQpoM2J7Fj4qcdzWgYWZ41A75OVpuWtbNkuj0EdlKAHx?=
 =?iso-8859-1?Q?/b7J3cKbbM2eKJW6EgllBw5VEeqYawLccKCwnFZZ4AhgehGlOrn6WYtsyi?=
 =?iso-8859-1?Q?hM4ayoWJbQX0qWEWJ9lGVEUoOUuXjofty8aNC5tidKbu/mH4Sq/FhQ4zEa?=
 =?iso-8859-1?Q?1XdBQsV1JeWjyzJhLidOvQbpI9XIw/5nzDr+ksp58c7skM6ZzRAoUwDkaq?=
 =?iso-8859-1?Q?VbHNbuzg4XKhYkEwYujH7syBdAVnSWyyM4SQXDvmsIo2N4siai9MnRAfiK?=
 =?iso-8859-1?Q?C/38W4M/2WACdgp1bPvnELQzXj456OpLaoNuPqhmYPUbVY88jAXDAPQQF5?=
 =?iso-8859-1?Q?S4S7pGdVorVNXPvl6ziU1ulmNfVXGVkJlUqMuN+5zCKWp7NxRiRsX/P/4u?=
 =?iso-8859-1?Q?GOUPtnoPCeD5CeFfXgjCfQVkA40NSUyuI/wxJ1Jky7HuGBBW9uSdNQ25PA?=
 =?iso-8859-1?Q?IYWuaXsbcAxDj5Iwm1glRNmkPGBCn3N/nra7X+rBV0yqn6rqHYygMxlKIA?=
 =?iso-8859-1?Q?vivF+19mshN2PBt8e6K1IHiP+0bvJ8bV24RxnxZGyGxS+rpYvNxWVic1ge?=
 =?iso-8859-1?Q?mImgj+cGVYAw+WsnRnuzYUK+FiypwObN1gcNCyAHafDxwv+9ClENHE5Jh+?=
 =?iso-8859-1?Q?oRrH6isOhxBX1nYB+b837TcJlidmsDLH734OZLdUosdECA8Jf+n05gJy79?=
 =?iso-8859-1?Q?xMBObrZ2qtul2cJRd0OxOchf5jNjyX/F0TqBEA7ufwR3LlN+XKWvn2ps5O?=
 =?iso-8859-1?Q?OjYhic8K8IZaMBRWxvZ22aKDNEE9X0cPFnWlNQmIo8gtj5R7VwJNgUoywb?=
 =?iso-8859-1?Q?4kZIlvmhKoOKrtGTIQqeAKIfrC96MI9yfEru9o3yh2QK80bPTsf143UGg4?=
 =?iso-8859-1?Q?IUeyPx/NduLEi+JQjCx33uZTmiAToIHIGCD4CuCxeXIgKxMCYXzlMTqfXb?=
 =?iso-8859-1?Q?b0r3rwdIqIQw9C5DOdJ5GrlxrPs+nC5dizSBgL85bIyKVjs/GSQP/ECCvx?=
 =?iso-8859-1?Q?6DUJv/stFpSN/WfZOQ4iC6iBY7iWuPA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ddaf5b61-4e3e-4152-67e8-08df25f06ecc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 10:31:09.0613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iE+A+T2oB65dYGPSIKh0EvTdWhfqIM71anviPNPa0qjQryrAS/e5dP3WblZ/zSTo25b+ry9Aq0tM/V5c1BfukdmHUguGCsNyu4FEDnDgYrIrvL7SszFaRLiP2ZmkDF64
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB2152

Hi David,=0A=
=0A=
>The line length is written to FRAME_LENGTH_LINES instead of=0A=
>LINE_LENGTH_PCK. The value is later overwritten by the VBLANK control,=0A=
>so the sensor runs with its default line length while the driver=0A=
>reports HBLANK and PIXEL_RATE computed from IMX576_LINE_LENGTH.=0A=
>=0A=
>Fixes: ee2e9bf41d3e ("media: i2c: add imx576 image sensor driver")=0A=
>Signed-off-by: David Carlier <devnexen@gmail.com>=0A=
>---=0A=
> drivers/media/i2c/imx576.c | 2 +-=0A=
> 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
>=0A=
>diff --git a/drivers/media/i2c/imx576.c b/drivers/media/i2c/imx576.c=0A=
>index 3fcd28d18a51..6243683302c7 100644=0A=
>--- a/drivers/media/i2c/imx576.c=0A=
>+++ b/drivers/media/i2c/imx576.c=0A=
>@@ -507,7 +507,7 @@ static int imx576_set_window(struct imx576 *imx576,=0A=
> 	format =3D v4l2_subdev_state_get_format(state, 0);=0A=
>=0A=
> 	/* Line length */=0A=
>-	cci_write(imx576->regmap, CCS_R_FRAME_LENGTH_LINES, IMX576_LINE_LENGTH,=
=0A=
>+	cci_write(imx576->regmap, CCS_R_LINE_LENGTH_PCK, IMX576_LINE_LENGTH,=0A=
> 		  &ret);=0A=
>=0A=
> 	/* Imaging area */=0A=
>--=0A=
>2.55=0A=
=0A=
Ah, thanks for catching this=0A=
=0A=
Reviewed-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
=0A=
Best Regards,=0A=
Himanshu=
