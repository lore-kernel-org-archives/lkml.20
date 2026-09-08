Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020078.outbound.protection.outlook.com [52.101.225.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541994B04B2;
	Tue,  8 Sep 2026 09:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858201; cv=fail; b=dWa45y9GR6bKjvyfpakORwoWyuKIjg3d835CqOKCaWC24tW+hR7iRqXU2ftfGNPGOPQ+cJBiLRKzX16Y7tnHzKW0801Lcf3p1NfVySNkqvVFWII6V7IJzS0ufVnHGv+rlJfDfnMQ9dZbjZ6NSJGAeXOryXjiTjO4Ov9Kt5Vk23c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858201; c=relaxed/simple;
	bh=JM2Sd8fbJH3nRVkAZrVIVxpBe7Ck3PfOwFFL5i9pFSs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ru/2inKC77PjlJTr6EPoo7SmR4LhYPEcDolG5tqTJVVEPxME70TONTJCTYv7bA36Hcvvr+tatxV8ZVnycoTXXyCpcEev4ApVl9mRWBeD854ReHCj4Q5M5/EwaFnVIu4SfJYuONxzkBKK+SadpZZM96Ay01EWbjarfVOCRwzswws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=MsMxFZXW reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.225.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="MsMxFZXW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GiTcjxgGvPabOMEX6NxWB86B+A4c62O0Vs3kDQVI5gg+Wdwpit9ZRITMRfx0EobnCUsF++FfeVzE6Uu3tZY2o803ZSx82rPBFth3G2ZHyUbsq6VWIPYgX38HN/t4kBBjxyrQPHlW3vC+n7zUL7HjRhLXw1vEqQYRhLbvP+Hs5PzctZOoYw6e/KITZC5MxmVmh5KHdzhbFDvfwtpOhdjEwjxoN65rf4IEXCRXrosMu5K99JFmJGu/9dZfBSvN18JuCsTVzu5LjBqU9TIIVe/0VwZW2eTybrJuJmKha59WQnPRlarW9fLaaWhlvITdnTTuJ0N+7hTRlU0JU4iJ9AqRpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/H1+yeCI/3wbAWPtj9lO6p6W/KSbd9Gz4l5CXA97aM=;
 b=wcLixsrSXufMgYURYzLUsJrJFJIVTEO2J/MZW59+PvEgxouHsAFLhNOiAXeRxoSsUnkXHl9C+KVmYjdg78Mzz+or1nXz4RFuSVqFiqWhpMabt8Mvbv5apKsJqMUUqua7OPIlDglA7BGX0VjYWDRS6RkbfYDhpVgIfSblKOnVVEIJKeGoKsh5xUT7aEsMpl/9Bi38RlZiv8jzMasr7MFEkcNZ59UrDEhmYYkui+k+FozZ+7o7ST0NGfVyPDu+fZi0ccSqaOr09RjQ5B5TvquSD/+muj71900emWfPUdTC5Og8KYEnM7CF9MU95Hskos8xNfatmrPJExMk6IripRcZQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/H1+yeCI/3wbAWPtj9lO6p6W/KSbd9Gz4l5CXA97aM=;
 b=MsMxFZXWZ3uYvsQmyEWMP8WpfXj7oZcvN66rhRMBOr5avE5xq//EPK9Or1F0bOrWHSp95NkW4OSfHOuShz7mteZk+6iFA/HG1pWkENXsIcEIwiA1wMirLQUS23rkfrb3z+/OHyNSdoN7aCQyEeF9ltrAmpQHY6kg/N5WgFEYKcMqniVs6IND0mtxMrJ3Y3+SdfFaRunpwbj851zuXVjvPtcx+XD7K01Fe/P3p6AJoxkgCt8Wst0bEY+xaSLP1X0pJ7Hk+T5sgibBfmezbpUaRnEBqDlIZo7XMv1YcSDTfwMsLWjdxoUnVaFtu68623vB4Y1newMLzca1VXe5AS7x7w==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PN2P287MB1126.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:135::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 09:03:10 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%7]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 09:03:10 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC: Tarang Raval <tarang.raval@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Walter Werner
 Schneider <contact@schnwalter.eu>, Kate Hsuan <hpa@redhat.com>, Yemike
 Abhilash Chandra <y-abhilashchandra@ti.com>, Svyatoslav Ryhel
	<clamor95@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 0/2] media: i2c: Add os02g10 camera sensor driver
Thread-Topic: [PATCH v5 0/2] media: i2c: Add os02g10 camera sensor driver
Thread-Index: AQHdDspl9ppXmum65ESzuXKgK/RNX7aCoL++gAtqjtqANrh+Bw==
Date: Tue, 8 Sep 2026 09:03:10 +0000
Message-ID:
 <MA0P287MB2178A6EBE37DEB29AEF632C388B12@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
References: <20260708110949.31313-1-elgin.perumbilly@siliconsignals.io>
 <MA0P287MB2178B8563D434B18699EFBD188CB2@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
 <MA0P287MB2178DE6EB4C9E675B9F967DD88D42@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
In-Reply-To:
 <MA0P287MB2178DE6EB4C9E675B9F967DD88D42@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB2178:EE_|PN2P287MB1126:EE_
x-ms-office365-filtering-correlation-id: 13b8250d-02f4-4980-df76-08df0d88017f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|38070700021|6133799003|3023799007|10067099003|4143699003|56012099006|5023799004|22082099003|18002099003;
x-microsoft-antispam-message-info:
 PIu4ZA3DVqGB6jkl+3mnkA5DYSDzpq5iKWdyXt89hXmrvH3B63v/ND25v9XrmBTgs57xs7nycWyGfYhzZ4V5uVS0/9bnU7EA87ggsNYabcmB8WAI2cEBCMHxx+tzQ+M423XBO7x4bp4LbRRwZxlAoNMH6+ocFf4Eq8YXDQkHVb1jK+kmQm1F3+6BP4F08YKy6rhlkW+h6+N0uhkaf7ydK60KwVYZs9RwewViU53uV86pgMzfpuy6rXBAd9IW5JcjuKuIXJ7LkteArz1PEggCUdc7Qv7IWBHvxd+DMTiLma03rDJifHH7WLi/i3xiwL9AKnwlEZxCmvmWXPit+YobEBKKKsKiN7A/N+MvQA7Z9QsG/I2Qa1TzOzzOibKBOGzYt7kKa1caCItTn6x3dkb1g1NAAZ99RWoO1SKICqpFE9EQpNrc5W0faJsHigCffYJnkZsnr/upcO0rIxGtOzOo/v1IlDQLZRaPfe+Sc4VPWz9IWPw9PexqUv70Eitrm7pUcNHsRYrH1GH2egEU56KaDCVDHSW9wauKpOlQrhvxVVv+3K1SWGfQV/qhLMWdG0aEUQDN/XyFz19tTaYDdMBdcAGr59U9RS3Svud5egiUlJ8QCb8ym/ixx/090cKs1XsDlfxPtCmCt27G5x73s4FYtBQVYFCpKnVE4PZmCQ2rRL353nlJxB9YWoHBsuZWxiPH7wz8G686xWvaP/j4+UmMYusCfPzhH//IP+qDDXIHK2Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(38070700021)(6133799003)(3023799007)(10067099003)(4143699003)(56012099006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pGVYlOAWYme149ELRZQGv56ANwJaKjNSfT++MHmen9bSx89Uz9ulB3KIOU?=
 =?iso-8859-1?Q?Bc1r/sBOdZA/sQXcZv5k8XoYmmpN+JP/KoDSeHiwhGFTO+9k35Mr05cpZN?=
 =?iso-8859-1?Q?vSy61wH7vRMATPajSDH2xybh/E4rXNNnhLLK4Gmpvk5F4yplfkpkYBnuUM?=
 =?iso-8859-1?Q?wJRtVT3qTA7kFQaHK3Lp30J5n7dAWS600f7CErV7HdqApQYC4pMOqWqDzF?=
 =?iso-8859-1?Q?DAH2jIgezfuUraUNVbyv8V1HXwA4x59NulZvTpCTWbQpgS9FXS/91Wq43w?=
 =?iso-8859-1?Q?Ad+7PaYcQuOQbb89kfNp8jJSlRFZUx1R6dBkBVj2ohiaz91/dFKbLgOTVR?=
 =?iso-8859-1?Q?cbR84szMtsx7W/z52BvXNuHoDHHeGEo6m/16zu7EfxV5udqqGDQqKmWSxJ?=
 =?iso-8859-1?Q?aWn05kXTRX+t2KxjdK0hYuVd1LwqZccIWJsW38Tejuba79Ua0MArRjx8rF?=
 =?iso-8859-1?Q?ZsM+5k3hyk90QtFJESVgLP7pGcsH06rd6OXxaKtFpMTUsMmAr+zNkomExz?=
 =?iso-8859-1?Q?SqICQmUKmcPJidls9+Vm+cJ2HBwZ5Vztab088LHXIaiwweUVyXXHfyv5FK?=
 =?iso-8859-1?Q?As/AgaSb6zC/6pf7EZQfjw3VYAwgjXuPW9DMJRxgP6O2hNCtF0iSTXstN2?=
 =?iso-8859-1?Q?kxeTVM+I62Wa+webv9QJr0M5/8i7EsQeaDGYZNAB730nxcVHZfFCisnMAn?=
 =?iso-8859-1?Q?ph9S3fAAPA3Lao0EvpHayJNpSICoZBkgk9GQTC2ZmPgkvDxJQw8ROPOkpt?=
 =?iso-8859-1?Q?UxZ3iyUJGPYgXAap7HdSS02NU80NFvWyF2a6ktUoEedIL/l3EeAs1323+M?=
 =?iso-8859-1?Q?VPojDQi4uTVg7ukCurT+gZ4V4XZvYQNzOc9D/WWm6ZJV2/6WB3HyXuCXz8?=
 =?iso-8859-1?Q?g/0FeHTAYo+kn9ksYZ7kNkD4ySETy75n2ii3ZxtLtVo+82PMEzWYQSMZ/b?=
 =?iso-8859-1?Q?qSJjWyRpsW1jPcBYHAQFPKr/uYs+AXTDi0eHfgyW0Zx/CNg3VMsPYco6Sp?=
 =?iso-8859-1?Q?AO7/WmOS/CyRgWUz8Gnmfypvq+E2FkRbVYCuQocGjo/ds9ZmHe5t9hxrCZ?=
 =?iso-8859-1?Q?V3z/zZPqEhPkjdYb0pS0cblEkVqesarhkRsl1EHrx3CCHJBtgePUuRdBzH?=
 =?iso-8859-1?Q?dJsdkhKtHkSDLsOWVJ3E4KQFAWc9gb/SOn7V9auIN9i7KAcf9XFbL++xCe?=
 =?iso-8859-1?Q?zGCV6Zols0DYj2K9N0179rfsL6Z4hPHPT3xxB5kSzfiGw5xlYUhDJRNPfh?=
 =?iso-8859-1?Q?OuCTUfl+JxnU39Asshj4lpHJIVNJieh5ZUA+f8wgSHZ8kfsYP0qZkx2OJH?=
 =?iso-8859-1?Q?tvEdJs2S6jAj0rkTGjQxmv5k04XCnrOXT07tsq14c6h+ZojLFQDV0Q9fWS?=
 =?iso-8859-1?Q?1Olqh5Xi/rriM1Rjs1vE/7Ag7xO41opaNXQVYZOc+zQd3+oLoKAajZhHqP?=
 =?iso-8859-1?Q?uiIE0lD8aCN1+jQyYo+uwKhZ+hn+naMaLenZpG1v8pvoDFSKA40/5eIKQP?=
 =?iso-8859-1?Q?DRJLa8XwtoK8E0TdTWSBz5yksedt5cfCrEg5s7WU6L0K9NidquGfk7pI0r?=
 =?iso-8859-1?Q?qA4BhVT0WsgR4On64jZt2U3RXqLcIbQMwzrqgv6n30um+CjUeP00WuPsOe?=
 =?iso-8859-1?Q?GyqLb+FjSinMWMZk+M4H8qQyjXvAtNnexDUTdPmn2l07OdCGxRxtfgcURX?=
 =?iso-8859-1?Q?fImmZk2esSM6wcp9DVeG7fXiA9RLe6h6QXRj/matr480ziVc9mlO9SMon4?=
 =?iso-8859-1?Q?KiGa4PT69qOK3ufNcrdwuV84ey91UCO3injjoBEU5KLLAJshhqZ9n4F61S?=
 =?iso-8859-1?Q?4n1T1sKBmE6/+P5RcMJDAfYLz8t16IU=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b8250d-02f4-4980-df76-08df0d88017f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 09:03:10.1442
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fWCdT/nWSGmLjBhi38aqfkrZMMCZCsHlnMAhSF0ze77HkjSwSnV6LR7M85qL6jRoWel/jJARLxBMUn3vWOXznIl/8vtMg7e06Vagp2cgZJze+vOPqe/EXk0wOQV+pp7Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1126

Hi Sakari,=0A=
=0A=
>Hi Sakari,=0A=
>=0A=
>>Hi Sakari,=0A=
>>=0A=
>>>The following features are supported:=0A=
>>>- Manual exposure and gain control support.=0A=
>>>- vblank/hblank control support.=0A=
>>>- vflip/hflip control support=0A=
>>>- Test pattern control support.=0A=
>>>- mode support 1920 x 1080 @ 30 fps, SBGGR10=0A=
>>>=0A=
>>>The driver is tested on mainline branch v7.0-rc2 on IMX8MP Debix Model a=
.=0A=
>>>=0A=
>>>v4l2-compliance 1.31.0-5387, 64 bits, 64-bit time_t=0A=
>>>v4l2-compliance SHA: 5508bc4301ac 2025-08-25 08:14:22=0A=
>>>=0A=
>>>Compliance test for device /dev/v4l-subdev3:=0A=
>>>=0A=
>>>Driver Info:=0A=
>>>        Driver version   : 7.0.0=0A=
>>>        Capabilities     : 0x00000000=0A=
>>>        Client Capabilities: 0x0000000000000002=0A=
>>>interval-uses-which=0A=
>>>Required ioctls:=0A=
>>>        test VIDIOC_SUDBEV_QUERYCAP: OK=0A=
>>>        test invalid ioctls: OK=0A=
>>>=0A=
>>>Allow for multiple opens:=0A=
>>>        test second /dev/v4l-subdev3 open: OK=0A=
>>>        test VIDIOC_SUBDEV_QUERYCAP: OK=0A=
>>>        test for unlimited opens: OK=0A=
>>>=0A=
>>>Debug ioctls:=0A=
>>>        test VIDIOC_LOG_STATUS: OK (Not Supported)=0A=
>>>=0A=
>>>Input ioctls:=0A=
>>>        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)=0A=
>>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)=0A=
>>>        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)=0A=
>>>        test VIDIOC_ENUMAUDIO: OK (Not Supported)=0A=
>>>        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)=0A=
>>>        test VIDIOC_G/S_AUDIO: OK (Not Supported)=0A=
>>>        Inputs: 0 Audio Inputs: 0 Tuners: 0=0A=
>>>=0A=
>>>Output ioctls:=0A=
>>>        test VIDIOC_G/S_MODULATOR: OK (Not Supported)=0A=
>>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)=0A=
>>>        test VIDIOC_ENUMAUDOUT: OK (Not Supported)=0A=
>>>        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)=0A=
>>>        test VIDIOC_G/S_AUDOUT: OK (Not Supported)=0A=
>>>        Outputs: 0 Audio Outputs: 0 Modulators: 0=0A=
>>>=0A=
>>>Input/Output configuration ioctls:=0A=
>>>        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)=0A=
>>>        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)=0A=
>>>        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)=0A=
>>>        test VIDIOC_G/S_EDID: OK (Not Supported)=0A=
>>>=0A=
>>>Control ioctls:=0A=
>>>        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK=0A=
>>>        test VIDIOC_QUERYCTRL: OK=0A=
>>>        test VIDIOC_G/S_CTRL: OK=0A=
>>>        test VIDIOC_G/S/TRY_EXT_CTRLS: OK=0A=
>>>        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK=0A=
>>>        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)=0A=
>>>        Standard Controls: 12 Private Controls: 0=0A=
>>>=0A=
>>>Format ioctls:=0A=
>>>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supporte=
d)=0A=
>>>        test VIDIOC_G/S_PARM: OK (Not Supported)=0A=
>>>        test VIDIOC_G_FBUF: OK (Not Supported)=0A=
>>>        test VIDIOC_G_FMT: OK (Not Supported)=0A=
>>>        test VIDIOC_TRY_FMT: OK (Not Supported)=0A=
>>>        test VIDIOC_S_FMT: OK (Not Supported)=0A=
>>>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)=0A=
>>>        test Cropping: OK (Not Supported)=0A=
>>>        test Composing: OK (Not Supported)=0A=
>>>        test Scaling: OK (Not Supported)=0A=
>>>=0A=
>>>Codec ioctls:=0A=
>>>        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)=0A=
>>>        test VIDIOC_G_ENC_INDEX: OK (Not Supported)=0A=
>>>        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)=0A=
>>>=0A=
>>>Buffer ioctls:=0A=
>>>        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)=0A=
>>>        test CREATE_BUFS maximum buffers: OK=0A=
>>>        test VIDIOC_REMOVE_BUFS: OK=0A=
>>>        test VIDIOC_EXPBUF: OK (Not Supported)=0A=
>>>        test Requests: OK (Not Supported)=0A=
>>>        test blocking wait: OK (Not Supported)=0A=
>>>=0A=
>>>Total for device /dev/v4l-subdev3: 46, Succeeded: 46, Failed: 0, Warning=
s: 0=0A=
>>=0A=
>>Could you please have a look at this patch series and let me know your th=
oughts ?=0A=
>>=0A=
>>Best Regards,=0A=
>>Elgin=0A=
>=0A=
>Just following up on the os02g10 patch series.=0A=
>Is there any blocker preventing it from being merged, or anything I need t=
o address?=0A=
>=0A=
>Best Regards,=0A=
>Elgin=0A=
=0A=
Just following up once again on the OS02G10 patch series. Could you please =
let me know if you had a chance to review it?=0A=
=0A=
Best Regards,=0A=
Elgin=0A=
