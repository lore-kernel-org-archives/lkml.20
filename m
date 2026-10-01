Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020076.outbound.protection.outlook.com [52.101.227.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E57C1DF98F;
	Thu,  1 Oct 2026 18:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790880098; cv=fail; b=bi3lSqgDeuQof+N2PUCw66av+x0khY/4rX1YZCz26AUJTkNHlzBf/yjUhExkPX+CbYse3uVDZ/lrqdukcdITZbhqzO85BpSH+UQEMrwNMSAQoxUQMauQl7OPMp2Vd9mrTuLdMdz27MwYi1l2vEbpDza6vYkfHZ3nl6TEwL5olTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790880098; c=relaxed/simple;
	bh=FQdJr+GeSNNpUOtIjHEoDMS/SGC6urKxM4Y/XO/EhOw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pKGtMHdxkuSzSsmvvEZsLl2uZBAFYFASSF1VBm0db4tED1OLcQFRJN6BJ9UsbpE08/gdDaqAULq88b1B5c+knNaVH3BARUo3gsOmvpxqmrt3duxYfl4lye97ldiIdgfVR++kUIM0hLEo38MHgSm6rGnOvYkxIzJ2RkeZGyNhYUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=R2hdyACA; arc=fail smtp.client-ip=52.101.227.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="R2hdyACA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYdqBw73rL4hLNj+kBtqyWtQPDmojtknS/JRBmMCRdWLn/1bLLC5HwJA5GADTcy9RtxcLTUDgfPFUXQD4XqifcnBaDQbY3rX+Y4ew6IIK1T8nsOqas0C8Z5bpF7eUChz6k0ThkXVhdVtephRTdKBVeZ0QM2IrUe8dZAjleBtMB4mHkbsyYXpHUdewKunsNXVClW64Fo4GV11Amlts89Mz4baESrfADyNSmfpp7pdWOXhUDsvPSMPeDuOD+ZQDn8JI9XXVqdnpVKaTnDa0JyFueTt117dZfWYS5gQu1oSR5akKR0yMQIg6sE7NboFlIk9csnq8xFj8gyThGrqbYMPNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1OilwmxN+X+YWHuc+MMAic1luVTcrnWPMS1bVn7nqE=;
 b=e+1podw9jsfeRo2EuRfn6ipxVpWaOJGy5RBTy5fb6TvyAqe2iv5GpurQ568Rv22hWi+TJFJk6YNaVf+x0WWTbPUzWiUBZJYfdmdiugG6dzbhxt9sutzxNCvWiM/nxAvBbsEYRV+qeFKcBYtsKDHiJi8FYqQuOULL16/f1NBi9CmPfEvTZeN1gdOcv0FsjTAFYqBF5CwB/Zg+aN5pcFF+D0I/2vVvoHSVL9SmlWSBYlBN1xulnhT25JqGrEt8Ms7B7mV8ZThH7iMXr2G3ZojqdQdZAKlygy7CqONQgPdK2OZv5dgPg6Fw/6hNROH1AD+bD+OPVWb7Qkz6vRiPQgEoww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1OilwmxN+X+YWHuc+MMAic1luVTcrnWPMS1bVn7nqE=;
 b=R2hdyACAoTckIzxt8zo+G8ET112x0x26hVFVwLPtXbwqXf2UFnzOHXr+utBpsK0m1fsuKAVNT6clIx6MTmbsfkc9bm8dFfo/yaCaFeQZgjrKHlqhHCFzAeOVe4pIwysypI6FTpyeTfX2EfqvXr6uBDATvAUTc+l0NAApktGHypVOgocL2enu/8Fan9SA/m+6Zng0Tz4G2/K+ladAj6Y6yas5c7UuU93l1/NdKfalZm7pIeR/1FNvvxA1W02I2dtOXFgkUZ6aYuB9ogX/SitqFi2rgCu0ph5Xy9K3os5kLw9wpLDtKNNpJiSEogUEOinQ8J2uVbc+3ppbn/AhaaAddw==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PNXP287MB4019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:27d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 18:41:29 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%7]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 18:41:29 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: "armandas.kvietkus@proton.me" <armandas.kvietkus@proton.me>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 2/2] media: i2c: Add Samsung S5K3T2 image sensor driver
Thread-Topic: [PATCH v3 2/2] media: i2c: Add Samsung S5K3T2 image sensor
 driver
Thread-Index: AQHdS+hdRvsbY5cnsEGMs0AvPAsrs7bpD4hi
Date: Thu, 1 Oct 2026 18:41:29 +0000
Message-ID:
 <MA0P287MB21789760986BD3C1EE2A0486888A2@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
References: <20260924-upstream-s5k3t2-v3-0-a5c58dfcec29@proton.me>
 <20260924-upstream-s5k3t2-v3-2-a5c58dfcec29@proton.me>
In-Reply-To: <20260924-upstream-s5k3t2-v3-2-a5c58dfcec29@proton.me>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB2178:EE_|PNXP287MB4019:EE_
x-ms-office365-filtering-correlation-id: 6e12146d-8493-419d-a3b6-08df1feb9b68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|10070799003|1800799024|38070700021|4143699003|6133799003|10067099003|22082099003|56012099006|5023799004|18002099003;
x-microsoft-antispam-message-info:
 /TQACCaEqWPFhQlVbbKzS1Xcdy65gnI+4b5C+CnTt/1Zb2dIhjdX7LIHVDiiiVUVk4Hue9EaO6oIiuWmd0GYSRX/FS4QjHrZqvT84QkuWyGB5y1KW02YlzzfTjMdmhscJuV5cfUtkr0cbKjO0pkObVKdzlWiqrxx2KE0jU/nrkwPS7HxrqoK4qyBeXIyfmmKM87ZycNV2AuoiccihhaM1Kl8v8t4qO/jhfmanZuhgxGtbPDcwLnENJWGMrLjFsL0m9ANFBKFZB3A/OdBwz+dXQAKPW5ya2KlKdUJUDfSJJ+CadUxUXdgsJbJtyiT00EMNq7CXVfe2oBGgIF4x67kwIY5aFzAlhMkXXQhJxogthjyj8KBmXQQMrpq8hrZAQfxUlpVh0fTgMnp8Lt9UPP/iJEae86LiJeBsusD7wg9+iFrQ8UIKOlI1LOqyjjNdkwlJYQZk3+sXNbp0+GsBMaV3NzQpaE5u6oj/c6G0CAhAFwsNyIfJ9ZEBIdJ3h3yBuXTtZLMSwlV6gCbRidSHVu0PNGXRQrdY7T24VzfrDA9iL7KPO42ojOulf3NlPR0Tbcqqtq3yZO/aiYhWYzjUQbQjskBYBHQ+7bi1aagecglq7VWk2iIQkSYUgmqUhuFRfkaw+npdHQJg1MGmPc01OFGHcp0jNqJqaNGFGAHzr9lgMRUbRFKV3LZdoumiMNDv/R+6LgNNQMhNiVc6Pm+dBFe7n94tJ8Vr66ZoaKqIroXlCU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(10070799003)(1800799024)(38070700021)(4143699003)(6133799003)(10067099003)(22082099003)(56012099006)(5023799004)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?72/ZMXpxNhX1olyGjOVy3KQea1g5LGUouTf1vBzLp1xVZvgqNHQ9BcuSvQ?=
 =?iso-8859-1?Q?yl8T+6/IIsbdNkREa1F3V4lMiQvwZC2K7GJnmxCbdhZOJKRGbf5F43MyzM?=
 =?iso-8859-1?Q?xCp4kqwPNEX/MLm5iN+VucO1NHBQdWAAAXIpdMfWSY+CuNnoDqrOPv8xLM?=
 =?iso-8859-1?Q?ufWLOCGXFQQJovhzH+QYLZfMbzU519TX2eTUt6Tj1qpEKLmN5uBNwEcPFx?=
 =?iso-8859-1?Q?nZDVIQ3u5jdZAfKyyeDXqCdcYwHC4C0u+MT9scYF4tkOpIGaY9T2OA1RI3?=
 =?iso-8859-1?Q?yvivEH0G7cSJawbJvfT5RvKznXPtXGbCHI/UTXdq2tcl9YPxtcPN+EOIoe?=
 =?iso-8859-1?Q?Xsn878Y5TSNA++Clq4K4bw90Wi+fC/KQtecBh7PjBvqxKFeXcPP34MXzyb?=
 =?iso-8859-1?Q?cy47TIMf+IvqgFPA13sfx7mACOZOXnw/8iODGHWOKUeIIsPuh0NeN/5tv+?=
 =?iso-8859-1?Q?EBl22U32zcJZiDjEfTPJf7/OpERyqrDcBCKTtIJJqFNXVRRsuSbAY3zYYB?=
 =?iso-8859-1?Q?kHVZiWjuBmP4lF0FdJnG4HYsvQwZBL5vgOvpFkNVHUiZimRzQrL30Qcv2I?=
 =?iso-8859-1?Q?lyqWumXHG5dU8PrgnzwNdiivKkaujQzS6t9EVzwuTOKA4owXlTSbuabxf4?=
 =?iso-8859-1?Q?2N7L+3ppzfeqwl9eP8M024TRLeIYfxSY4ArGGgNC0yUOSKTejJ66qudLbt?=
 =?iso-8859-1?Q?at4wi/Kv8N9FtpP+OG1eYMfLHL0oDECpXobtYdpk7SsDvtEi7Iqy9kNXNZ?=
 =?iso-8859-1?Q?YKM4/nh2aX3fe8kxpCT56JbY9CIZy7IuHrg66Ky2xLkYTf8TgzminRy5Qh?=
 =?iso-8859-1?Q?rm5wibZ2K4mvsX6YE7e4O0z/uU2DNpEIChRD9tgbRzeg7Bj0Mm0e+NeQiG?=
 =?iso-8859-1?Q?dHo0TaMmOlfU0EQd+HKHMljA9+kypzqqFxgxDOh4/BHf2STnVUHP3nkupt?=
 =?iso-8859-1?Q?3IycixHjISNZXDXrb9ea1NBEKFBrTGwxz81WYC+vXsJvP6WXng74LF33Dx?=
 =?iso-8859-1?Q?zVnUNFqh4mrHuG5550pO4XkjXqU1CyMkvaJ8gl2cXcG1Rr3ZDPZIJOtEJM?=
 =?iso-8859-1?Q?42uP7oPT5mau3ummomCAEg1fibZh6zzAu53YglsBSi12v3OHdKN3SGE+Ti?=
 =?iso-8859-1?Q?6szeQWqLJpx+SNAo3Kk/i8xLILbF/H/kW59t04YmvqsUv72vSGdCyblvL5?=
 =?iso-8859-1?Q?myplvvd2dPFEDIAU7spnRx6P8klpBAq1PGksFmB9oMVadlxKC/gF25kpgr?=
 =?iso-8859-1?Q?C57cb31haTkvmrFOkD+qSd/LZaoC+hZw1gxE93j++n5d09K/zRMptuAZWY?=
 =?iso-8859-1?Q?gggex2biplO2o2UZuPqSczfveAFUJUn0lvTuCTskzT+HiGhMpY3sZeF1da?=
 =?iso-8859-1?Q?X8f9UHVxpQfQuk/rFwSyfmEpCApgBWs6AG4oQVeGUasYrk5uVzGCkIXy2e?=
 =?iso-8859-1?Q?Hv05cQgRchBmgpxkqF2vNmOL6Tg2FdCyTiJtS6H/ux6jVWn3hQTcpQrQia?=
 =?iso-8859-1?Q?aoKl9pSo3K1UvT2QW8FflXQ/vSSGozppXSfdlTwC1JglWxdR5rphXR6/2P?=
 =?iso-8859-1?Q?jvfLiCxmBtSZv9uF85+bjMBjxTj/kAoN4CoJFW94SUCokn9LPWHZFbsdcT?=
 =?iso-8859-1?Q?NqdMEjqAmB1ZMMOwcVwvYVGCL7HcHYVW3TB9IaiFJ5uOaAMlVR5kj93pP5?=
 =?iso-8859-1?Q?1doc4A9R1QIhDB9NuCPiGs0KSUyFsemWrCic0XrgJc3gVYMZpUniNYbo5S?=
 =?iso-8859-1?Q?3KjKsVluLu+nVGBy0V+n0llq20c5RZCuh1y4ntg+ySuDUlYmnjNEooVMyG?=
 =?iso-8859-1?Q?W5lCWUICjfKOPJHCINnBF3B8ykAUqJsEfogzTf6kWf8kiglC+JD/f0GvgZ?=
 =?iso-8859-1?Q?uz?=
x-ms-exchange-antispam-messagedata-1: bZKWtjBsDMudhgfy14JA4kEUxW7bl60VEpU=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e12146d-8493-419d-a3b6-08df1feb9b68
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2026 18:41:29.4906
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qVGVWlJQq+/e2AaFXB+sjGyXCd5lxb3t4iQPwAKYVVKUWTT/0ybSd2lQGnwUZ1x8S4Bu8IZ2IMqYhJQoIQAFjUMppdzy94TnWN65dEHIAHV6SIwTiTStIsEx/ZGmeNHv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB4019

Hi Armandas,=0A=
=0A=
A few comments from my side.=0A=
=0A=
>From: Armandas Kvietkus <armandas.kvietkus@proton.me>=0A=
>=0A=
>Add a driver for the Samsung S5K3T2 20 Mpixel CMOS image sensor.=0A=
>=0A=
>The driver supports three modes. All of them are RAW10 on four D-PHY=0A=
>lanes.=0A=
>=0A=
>  5184x3880 at 15 fps, link frequency 448 MHz=0A=
>  2592x1940 at 60 fps, link frequency 448 MHz=0A=
>  1280x720 at 120 fps, link frequency 300 MHz=0A=
>=0A=
>A mode is hidden if the board does not list the link frequency it needs.=
=0A=
>=0A=
>The pixel clock does not change between modes, so the pixel rate control=
=0A=
>is constant. The frame rate follows from the line length and the frame=0A=
>length.=0A=
>=0A=
>The controls are exposure, analogue gain, vertical blanking, horizontal=0A=
>flip, vertical flip and test pattern. Rotation and orientation come from=
=0A=
>the device tree. Power is handled by runtime PM with autosuspend.=0A=
>=0A=
>The register tables come from the vendor camera firmware. They were=0A=
>checked on hardware.=0A=
>=0A=
>Tested on a Xiaomi POCO F3 with the Qualcomm CAMSS driver.=0A=
>=0A=
>Signed-off-by: Armandas Kvietkus <armandas.kvietkus@proton.me>=0A=
>---=0A=
> MAINTAINERS                |    1 +=0A=
> drivers/media/i2c/Kconfig  |   10 +=0A=
> drivers/media/i2c/Makefile |    1 +=0A=
> drivers/media/i2c/s5k3t2.c | 1360 +++++++++++++++++++++++++++++++++++++++=
+++++=0A=
> 4 files changed, 1372 insertions(+)=0A=
>=0A=
>diff --git a/MAINTAINERS b/MAINTAINERS=0A=
>index 1924dbd20..e625cf3a2 100644=0A=
>--- a/MAINTAINERS=0A=
>+++ b/MAINTAINERS=0A=
>@@ -24386,6 +24386,7 @@ L:	linux-media@vger.kernel.org=0A=
> S:	Maintained=0A=
> T:	git git://linuxtv.org/media_tree.git=0A=
> F:	Documentation/devicetree/bindings/media/i2c/samsung,s5k3t2.yaml=0A=
>+F:	drivers/media/i2c/s5k3t2.c=0A=
>=0A=
> SAMSUNG S5K5BAF CAMERA DRIVER=0A=
> M:	Sylwester Nawrocki <s.nawrocki@samsung.com>=0A=
>diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig=0A=
>index 5c52007f9..999aeecd2 100644=0A=
>--- a/drivers/media/i2c/Kconfig=0A=
>+++ b/drivers/media/i2c/Kconfig=0A=
>@@ -804,6 +804,16 @@ config VIDEO_S5K3M5=0A=
> 	  To compile this driver as a module, choose M here: the=0A=
> 	  module will be called s5k3m5.=0A=
>=0A=
>+config VIDEO_S5K3T2=0A=
>+	tristate "Samsung S5K3T2 sensor support"=0A=
>+	select V4L2_CCI_I2C=0A=
>+	help=0A=
>+	  This is a V4L2 sensor driver for Samsung S5K3T2 20MP raw=0A=
>+	  camera sensor.=0A=
>+=0A=
>+	  To compile this driver as a module, choose M here: the=0A=
>+	  module will be called s5k3t2.=0A=
>+=0A=
> config VIDEO_S5K5BAF=0A=
> 	tristate "Samsung S5K5BAF sensor support"=0A=
> 	help=0A=
>diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile=0A=
>index d04bd5724..9a25d8200 100644=0A=
>--- a/drivers/media/i2c/Makefile=0A=
>+++ b/drivers/media/i2c/Makefile=0A=
>@@ -130,6 +130,7 @@ obj-$(CONFIG_VIDEO_RDACM21) +=3D rdacm21.o=0A=
> obj-$(CONFIG_VIDEO_RJ54N1) +=3D rj54n1cb0c.o=0A=
> obj-$(CONFIG_VIDEO_S5C73M3) +=3D s5c73m3/=0A=
> obj-$(CONFIG_VIDEO_S5K3M5) +=3D s5k3m5.o=0A=
>+obj-$(CONFIG_VIDEO_S5K3T2) +=3D s5k3t2.o=0A=
> obj-$(CONFIG_VIDEO_S5K5BAF) +=3D s5k5baf.o=0A=
> obj-$(CONFIG_VIDEO_S5K6A3) +=3D s5k6a3.o=0A=
> obj-$(CONFIG_VIDEO_S5KJN1) +=3D s5kjn1.o=0A=
>diff --git a/drivers/media/i2c/s5k3t2.c b/drivers/media/i2c/s5k3t2.c=0A=
>new file mode 100644=0A=
>index 000000000..595831217=0A=
>--- /dev/null=0A=
>+++ b/drivers/media/i2c/s5k3t2.c=0A=
>@@ -0,0 +1,1360 @@=0A=
>+// SPDX-License-Identifier: GPL-2.0=0A=
>+// Copyright (c) 2026 Armandas Kvietkus <armandas.kvietkus@proton.me>=0A=
>+=0A=
>+#include <linux/clk.h>=0A=
>+#include <linux/delay.h>=0A=
>+#include <linux/gpio/consumer.h>=0A=
>+#include <linux/i2c.h>=0A=
>+#include <linux/module.h>=0A=
>+#include <linux/pm_runtime.h>=0A=
>+#include <linux/regulator/consumer.h>=0A=
>+#include <linux/units.h>=0A=
>+#include <media/v4l2-cci.h>=0A=
>+#include <media/v4l2-ctrls.h>=0A=
>+#include <media/v4l2-device.h>=0A=
>+#include <media/v4l2-fwnode.h>=0A=
>+=0A=
>+#define S5K3T2_LINK_FREQ_448MHZ		(448 * HZ_PER_MHZ)=0A=
>+#define S5K3T2_LINK_FREQ_300MHZ		(300 * HZ_PER_MHZ)=0A=
>+#define S5K3T2_MCLK_FREQ		19200000=0A=
>+#define S5K3T2_PIXEL_RATE		676571429=0A=
>+#define S5K3T2_DATA_LANES		4=0A=
>+=0A=
>+#define S5K3T2_REG_CHIP_ID		CCI_REG16(0x0000)=0A=
>+#define S5K3T2_CHIP_ID			0x3142=0A=
>+=0A=
>+#define S5K3T2_REG_CTRL_MODE		CCI_REG16(0x0100)=0A=
>+#define S5K3T2_MODE_STREAMING		BIT(8)=0A=
>+#define S5K3T2_VFLIP			BIT(1)=0A=
>+#define S5K3T2_HFLIP			BIT(0)=0A=
>+=0A=
>+#define S5K3T2_REG_EXPOSURE		CCI_REG16(0x0202)=0A=
>+#define S5K3T2_EXPOSURE_MIN		8=0A=
>+#define S5K3T2_EXPOSURE_STEP		1=0A=
>+#define S5K3T2_EXPOSURE_MARGIN		4=0A=
>+=0A=
>+#define S5K3T2_REG_AGAIN		CCI_REG16(0x0204)=0A=
>+#define S5K3T2_AGAIN_MIN		1=0A=
>+#define S5K3T2_AGAIN_MAX		16=0A=
>+#define S5K3T2_AGAIN_STEP		1=0A=
>+#define S5K3T2_AGAIN_DEFAULT		1=0A=
>+#define S5K3T2_AGAIN_SHIFT		5=0A=
>+=0A=
>+#define S5K3T2_REG_VTS			CCI_REG16(0x0340)=0A=
>+#define S5K3T2_VTS_MAX			0xffff=0A=
>+=0A=
>+#define S5K3T2_REG_TEST_PATTERN		CCI_REG16(0x0600)=0A=
>+=0A=
>+#define S5K3T2_NATIVE_WIDTH		5192=0A=
>+#define S5K3T2_NATIVE_HEIGHT		3888=0A=
>+=0A=
>+#define S5K3T2_DEFAULT_WIDTH		2592=0A=
>+#define S5K3T2_DEFAULT_HEIGHT		1940=0A=
>+=0A=
>+#define to_s5k3t2(_sd)			container_of(_sd, struct s5k3t2, sd)=0A=
=0A=
Please use container_of_const() here=0A=
=0A=
=0A=
>+=0A=
>+static const s64 s5k3t2_link_freq_menu[] =3D {=0A=
>+	S5K3T2_LINK_FREQ_448MHZ,=0A=
>+	S5K3T2_LINK_FREQ_300MHZ,=0A=
>+};=0A=
>+=0A=
>+static const u32 s5k3t2_mbus_formats[] =3D {=0A=
>+	MEDIA_BUS_FMT_SGRBG10_1X10,	MEDIA_BUS_FMT_SRGGB10_1X10,=0A=
>+	MEDIA_BUS_FMT_SBGGR10_1X10,	MEDIA_BUS_FMT_SGBRG10_1X10,=0A=
>+};=0A=
>+=0A=
>+struct s5k3t2_reg_list {=0A=
>+	const struct cci_reg_sequence *regs;=0A=
>+	unsigned int num_regs;=0A=
>+};=0A=
>+=0A=
>+struct s5k3t2_mode {=0A=
>+	u32 width;=0A=
>+	u32 height;=0A=
>+	u32 hts;=0A=
>+	u32 vts;=0A=
>+	u32 exposure;=0A=
>+	unsigned int link_freq_index;=0A=
>+	struct v4l2_rect crop;=0A=
>+	const struct s5k3t2_reg_list reg_list;=0A=
>+};=0A=
>+=0A=
>+static const char * const s5k3t2_test_pattern_menu[] =3D {=0A=
>+	"Disabled",=0A=
>+	"Solid colour",=0A=
>+	"Colour bars",=0A=
>+	"Fade to grey colour bars",=0A=
>+	"PN9",=0A=
>+};=0A=
>+=0A=
>+static const char * const s5k3t2_supply_names[] =3D {=0A=
>+	"vdda",=0A=
>+	"vddd",=0A=
>+	"vddio",=0A=
>+};=0A=
>+=0A=
>+#define S5K3T2_NUM_SUPPLIES	ARRAY_SIZE(s5k3t2_supply_names)=0A=
>+=0A=
>+struct s5k3t2 {=0A=
>+	struct device *dev;=0A=
>+	struct regmap *regmap;=0A=
>+	struct clk *mclk;=0A=
>+	struct gpio_desc *reset_gpio;=0A=
>+	struct regulator_bulk_data supplies[S5K3T2_NUM_SUPPLIES];=0A=
>+=0A=
>+	struct v4l2_subdev sd;=0A=
>+	struct media_pad pad;=0A=
>+=0A=
>+	struct v4l2_ctrl_handler ctrl_handler;=0A=
>+	struct v4l2_ctrl *link_freq;=0A=
>+	struct v4l2_ctrl *pixel_rate;=0A=
=0A=
Remove the unwanted pointers if they are not referenced,=0A=
as they unnecessarily consume memory.=0A=
=0A=
>+	struct v4l2_ctrl *hblank;=0A=
>+	struct v4l2_ctrl *vblank;=0A=
>+	struct v4l2_ctrl *exposure;=0A=
>+	struct v4l2_ctrl *vflip;=0A=
>+	struct v4l2_ctrl *hflip;=0A=
>+=0A=
>+	const struct s5k3t2_mode *mode;=0A=
>+	unsigned long link_freq_bitmap;=0A=
>+};=0A=
>+=0A=
>+static const struct cci_reg_sequence s5k3t2_init_setting[] =3D {=0A=
>+	{ CCI_REG16(0x6214), 0xff7d },=0A=
>+	{ CCI_REG16(0x6218), 0x0000 },=0A=
>+	{ CCI_REG16(0x0a02), 0x003f },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x3aec },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0549 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0448 },=0A=
>+	{ CCI_REG16(0x6f12), 0x054a },=0A=
>+	{ CCI_REG16(0x6f12), 0xc1f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2c05 },=0A=
>+	{ CCI_REG16(0x6f12), 0x101a },=0A=
>+	{ CCI_REG16(0x6f12), 0xa1f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3005 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7bb8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3ca0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2670 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x9c00 },=0A=
>+	{ CCI_REG16(0x6f12), 0x70b5 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0646 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4348 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0022 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0168 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0c0c },=0A=
>+	{ CCI_REG16(0x6f12), 0x8db2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2946 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2046 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x9bf8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3046 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x9df8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3d48 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3e4a },=0A=
>+	{ CCI_REG16(0x6f12), 0x0830 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0188 },=0A=
>+	{ CCI_REG16(0x6f12), 0x1180 },=0A=
>+	{ CCI_REG16(0x6f12), 0x911c },=0A=
>+	{ CCI_REG16(0x6f12), 0x4088 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0880 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2946 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2046 },=0A=
>+	{ CCI_REG16(0x6f12), 0xbde8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7040 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0122 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x89b8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x70b5 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0646 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3548 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0022 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4068 },=0A=
>+	{ CCI_REG16(0x6f12), 0x84b2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x050c },=0A=
>+	{ CCI_REG16(0x6f12), 0x2146 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2846 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7ef8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3046 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x85f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3149 },=0A=
>+	{ CCI_REG16(0x6f12), 0x314b },=0A=
>+	{ CCI_REG16(0x6f12), 0x0120 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0988 },=0A=
>+	{ CCI_REG16(0x6f12), 0x40ea },=0A=
>+	{ CCI_REG16(0x6f12), 0x0110 },=0A=
>+	{ CCI_REG16(0x6f12), 0x5881 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2f48 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0078 },=0A=
>+	{ CCI_REG16(0x6f12), 0x68b1 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0022 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2e48 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2f49 },=0A=
>+	{ CCI_REG16(0x6f12), 0x80f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0xc428 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0a80 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2e49 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0e78 },=0A=
>+	{ CCI_REG16(0x6f12), 0x36b1 },=0A=
>+	{ CCI_REG16(0x6f12), 0x90f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0xe803 },=0A=
>+	{ CCI_REG16(0x6f12), 0x18b1 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0120 },=0A=
>+	{ CCI_REG16(0x6f12), 0x02e0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0122 },=0A=
>+	{ CCI_REG16(0x6f12), 0xf0e7 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0020 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4978 },=0A=
>+	{ CCI_REG16(0x6f12), 0x01b1 },=0A=
>+	{ CCI_REG16(0x6f12), 0x42b1 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0021 },=0A=
>+	{ CCI_REG16(0x6f12), 0x40ea },=0A=
>+	{ CCI_REG16(0x6f12), 0x0110 },=0A=
>+	{ CCI_REG16(0x6f12), 0x5880 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x66f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0128 },=0A=
>+	{ CCI_REG16(0x6f12), 0x02d0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x1be0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0121 },=0A=
>+	{ CCI_REG16(0x6f12), 0xf5e7 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2248 },=0A=
>+	{ CCI_REG16(0x6f12), 0x234a },=0A=
>+	{ CCI_REG16(0x6f12), 0x234e },=0A=
>+	{ CCI_REG16(0x6f12), 0xb0f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7211 },=0A=
>+	{ CCI_REG16(0x6f12), 0x92f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x9420 },=0A=
>+	{ CCI_REG16(0x6f12), 0x90f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7401 },=0A=
>+	{ CCI_REG16(0x6f12), 0xd140 },=0A=
>+	{ CCI_REG16(0x6f12), 0xd040 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4318 },=0A=
>+	{ CCI_REG16(0x6f12), 0x96f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7f63 },=0A=
>+	{ CCI_REG16(0x6f12), 0x581e },=0A=
>+	{ CCI_REG16(0x6f12), 0x022e },=0A=
>+	{ CCI_REG16(0x6f12), 0x03d9 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0220 },=0A=
>+	{ CCI_REG16(0x6f12), 0x9040 },=0A=
>+	{ CCI_REG16(0x6f12), 0x181a },=0A=
>+	{ CCI_REG16(0x6f12), 0x401c },=0A=
>+	{ CCI_REG16(0x6f12), 0x164a },=0A=
>+	{ CCI_REG16(0x6f12), 0x703a },=0A=
>+	{ CCI_REG16(0x6f12), 0x1180 },=0A=
>+	{ CCI_REG16(0x6f12), 0x911c },=0A=
>+	{ CCI_REG16(0x6f12), 0x0880 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2146 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2846 },=0A=
>+	{ CCI_REG16(0x6f12), 0xbde8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7040 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0122 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x31b8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x10b5 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0022 },=0A=
>+	{ CCI_REG16(0x6f12), 0xaff2 },=0A=
>+	{ CCI_REG16(0x6f12), 0xb501 },=0A=
>+	{ CCI_REG16(0x6f12), 0x1348 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3ef8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x064c },=0A=
>+	{ CCI_REG16(0x6f12), 0x0022 },=0A=
>+	{ CCI_REG16(0x6f12), 0xaff2 },=0A=
>+	{ CCI_REG16(0x6f12), 0xff01 },=0A=
>+	{ CCI_REG16(0x6f12), 0x6060 },=0A=
>+	{ CCI_REG16(0x6f12), 0x1048 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x36f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0f49 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2060 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7a20 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0968 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4883 },=0A=
>+	{ CCI_REG16(0x6f12), 0x10bd },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3c90 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x950c },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x16f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4000 },=0A=
>+	{ CCI_REG16(0x6f12), 0xd000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x19a0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x30c0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x9800 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x1dd0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x17c0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2210 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2670 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x6f12), 0xf45f },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x6f12), 0xd957 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x08c0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x49f6 },=0A=
>+	{ CCI_REG16(0x6f12), 0x213c },=0A=
>+	{ CCI_REG16(0x6f12), 0xc0f2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x000c },=0A=
>+	{ CCI_REG16(0x6f12), 0x6047 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4df6 },=0A=
>+	{ CCI_REG16(0x6f12), 0x571c },=0A=
>+	{ CCI_REG16(0x6f12), 0xc0f2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x000c },=0A=
>+	{ CCI_REG16(0x6f12), 0x6047 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4ff2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x5f4c },=0A=
>+	{ CCI_REG16(0x6f12), 0xc0f2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x000c },=0A=
>+	{ CCI_REG16(0x6f12), 0x6047 },=0A=
>+	{ CCI_REG16(0x6f12), 0x44f2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x9b0c },=0A=
>+	{ CCI_REG16(0x6f12), 0xc0f2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x000c },=0A=
>+	{ CCI_REG16(0x6f12), 0x6047 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4bf2 },=0A=
>+	{ CCI_REG16(0x6f12), 0xed0c },=0A=
>+	{ CCI_REG16(0x6f12), 0xc0f2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x000c },=0A=
>+	{ CCI_REG16(0x6f12), 0x6047 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x1014 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0100 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7000 },=0A=
>+	{ CCI_REG16(0x602a), 0x108a },=0A=
>+	{ CCI_REG16(0x6f12), 0x0006 },=0A=
>+	{ CCI_REG16(0x602a), 0x1092 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0005 },=0A=
>+	{ CCI_REG16(0x602a), 0x1096 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0002 },=0A=
>+	{ CCI_REG16(0x6f12), 0x001a },=0A=
>+	{ CCI_REG16(0x602a), 0x109c },=0A=
>+	{ CCI_REG16(0x6f12), 0x0014 },=0A=
>+	{ CCI_REG16(0x602a), 0x10a2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0022 },=0A=
>+	{ CCI_REG16(0x602a), 0x10ae },=0A=
>+	{ CCI_REG16(0x6f12), 0x0007 },=0A=
>+	{ CCI_REG16(0x602a), 0x10c2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x001e },=0A=
>+	{ CCI_REG16(0x602a), 0x10f4 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0003 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0003 },=0A=
>+	{ CCI_REG16(0x602a), 0x110a },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x602a), 0x113e },=0A=
>+	{ CCI_REG16(0x6f12), 0x0001 },=0A=
>+	{ CCI_REG16(0x6f12), 0x014e },=0A=
>+	{ CCI_REG16(0x602a), 0x13ea },=0A=
>+	{ CCI_REG16(0x6f12), 0x160f },=0A=
>+	{ CCI_REG16(0x6f12), 0x0d00 },=0A=
>+	{ CCI_REG16(0x602a), 0x13fa },=0A=
>+	{ CCI_REG16(0x6f12), 0x009d },=0A=
>+	{ CCI_REG16(0x6f12), 0x0107 },=0A=
>+	{ CCI_REG16(0x602a), 0x14e2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x04c2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x02ae },=0A=
>+	{ CCI_REG16(0x6f12), 0x0020 },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0xf44a), 0x0010 },=0A=
>+	{ CCI_REG16(0xf46a), 0xb6a0 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x0f5e },=0A=
>+	{ CCI_REG16(0x6f12), 0x0200 },=0A=
>+	{ CCI_REG16(0x602a), 0x0f90 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x602a), 0x17c0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0010 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0201 },=0A=
>+	{ CCI_REG16(0x602a), 0x1da2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0001 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0203 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0405 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0607 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0809 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0a0b },=0A=
>+	{ CCI_REG16(0x6f12), 0x0c0d },=0A=
>+	{ CCI_REG16(0x6f12), 0x0e0f },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x020c), 0x0001 },=0A=
>+	{ CCI_REG16(0x0bc6), 0x0000 },=0A=
>+	{ CCI_REG16(0x0d00), 0x0000 },=0A=
>+	{ CCI_REG16(0xb13c), 0x0800 },=0A=
>+};=0A=
>+=0A=
=0A=
Curious why 0x6f12 and 0x602a is used repeatedly in sequence here,=0A=
unlike in other drivers, Could you explain it.=0A=
=0A=
>+static const struct cci_reg_sequence s5k3t2_5184x3880_mode[] =3D {=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x0136), 0x1300 },=0A=
>+	{ CCI_REG16(0x013e), 0x00c8 },=0A=
>+	{ CCI_REG16(0x0304), 0x0003 },=0A=
>+	{ CCI_REG16(0x0306), 0x00b9 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x0e0e },=0A=
>+	{ CCI_REG16(0x6f12), 0x0103 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x602a), 0x1078 },=0A=
>+	{ CCI_REG16(0x6f12), 0x04a6 },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x030c), 0x0000 },=0A=
>+	{ CCI_REG16(0x0302), 0x0001 },=0A=
>+	{ CCI_REG16(0x0300), 0x0007 },=0A=
>+	{ CCI_REG16(0x030e), 0x0003 },=0A=
>+	{ CCI_REG16(0x0310), 0x008c },=0A=
>+	{ CCI_REG16(0x0312), 0x0001 },=0A=
>+	{ CCI_REG16(0x0308), 0x0008 },=0A=
>+	{ CCI_REG16(0x030a), 0x0001 },=0A=
>+	{ CCI_REG16(0x0344), 0x0008 },=0A=
>+	{ CCI_REG16(0x0346), 0x0008 },=0A=
>+	{ CCI_REG16(0x0348), 0x1447 },=0A=
>+	{ CCI_REG16(0x034a), 0x0f2f },=0A=
>+	{ CCI_REG16(0x034c), 0x1440 },=0A=
>+	{ CCI_REG16(0x034e), 0x0f28 },=0A=
>+	{ CCI_REG16(0x0350), 0x0000 },=0A=
>+	{ CCI_REG16(0x0352), 0x0000 },=0A=
>+	{ CCI_REG16(0x0900), 0x0111 },=0A=
>+	{ CCI_REG16(0x0404), 0x1000 },=0A=
>+	{ CCI_REG16(0x0380), 0x0001 },=0A=
>+	{ CCI_REG16(0x0382), 0x0001 },=0A=
>+	{ CCI_REG16(0x0384), 0x0001 },=0A=
>+	{ CCI_REG16(0x0386), 0x0001 },=0A=
>+	{ CCI_REG16(0x0342), 0x2a80 },=0A=
>+	{ CCI_REG16(0x0340), 0x1000 },=0A=
=0A=
No need to define VTS here as already been set from vertical blank control=
=0A=
=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x010c), 0x0000 },=0A=
>+	{ CCI_REG16(0x0114), 0x0300 },=0A=
>+	{ CCI_REG16(0x0116), 0x3000 },=0A=
>+	{ CCI_REG16(0x011a), 0x0001 },=0A=
>+	{ CCI_REG16(0x0118), 0x0002 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x0e92 },=0A=
>+	{ CCI_REG16(0x6f12), 0xffff },=0A=
>+	{ CCI_REG16(0x602a), 0x165a },=0A=
>+	{ CCI_REG16(0x6f12), 0x0003 },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x0b04), 0x0001 },=0A=
>+	{ CCI_REG16(0x0b06), 0x0101 },=0A=
>+	{ CCI_REG16(0x0fea), 0x04a0 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x3c98 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0a58 },=0A=
>+	{ CCI_REG16(0x6f12), 0x1477 },=0A=
>+	{ CCI_REG16(0x602a), 0x1da0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0010 },=0A=
>+	{ CCI_REG16(0x602a), 0x10ac },=0A=
>+	{ CCI_REG16(0x6f12), 0x000a },=0A=
>+	{ CCI_REG16(0x602a), 0x1110 },=0A=
>+	{ CCI_REG16(0x6f12), 0x001d },=0A=
>+	{ CCI_REG16(0x6f12), 0x003f },=0A=
>+	{ CCI_REG16(0x602a), 0x13e8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0804 },=0A=
>+	{ CCI_REG16(0x602a), 0x13f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x38c8 },=0A=
>+};=0A=
>+=0A=
>+static const struct cci_reg_sequence s5k3t2_2592x1940_mode[] =3D {=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x0136), 0x1300 },=0A=
>+	{ CCI_REG16(0x013e), 0x00c8 },=0A=
>+	{ CCI_REG16(0x0304), 0x0003 },=0A=
>+	{ CCI_REG16(0x0306), 0x00b9 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x0e0e },=0A=
>+	{ CCI_REG16(0x6f12), 0x0103 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x602a), 0x1078 },=0A=
>+	{ CCI_REG16(0x6f12), 0x04a6 },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x030c), 0x0000 },=0A=
>+	{ CCI_REG16(0x0302), 0x0001 },=0A=
>+	{ CCI_REG16(0x0300), 0x0007 },=0A=
>+	{ CCI_REG16(0x030e), 0x0003 },=0A=
>+	{ CCI_REG16(0x0310), 0x008c },=0A=
>+	{ CCI_REG16(0x0312), 0x0001 },=0A=
>+	{ CCI_REG16(0x0308), 0x0008 },=0A=
>+	{ CCI_REG16(0x030a), 0x0001 },=0A=
>+	{ CCI_REG16(0x0344), 0x0008 },=0A=
>+	{ CCI_REG16(0x0346), 0x0008 },=0A=
>+	{ CCI_REG16(0x0348), 0x1447 },=0A=
>+	{ CCI_REG16(0x034a), 0x0f2f },=0A=
>+	{ CCI_REG16(0x034c), 0x0a20 },=0A=
>+	{ CCI_REG16(0x034e), 0x0794 },=0A=
>+	{ CCI_REG16(0x0350), 0x0000 },=0A=
>+	{ CCI_REG16(0x0352), 0x0000 },=0A=
>+	{ CCI_REG16(0x0900), 0x0122 },=0A=
>+	{ CCI_REG16(0x0404), 0x1000 },=0A=
>+	{ CCI_REG16(0x0380), 0x0002 },=0A=
>+	{ CCI_REG16(0x0382), 0x0002 },=0A=
>+	{ CCI_REG16(0x0384), 0x0002 },=0A=
>+	{ CCI_REG16(0x0386), 0x0002 },=0A=
>+	{ CCI_REG16(0x0342), 0x1610 },=0A=
>+	{ CCI_REG16(0x0340), 0x07cc },=0A=
=0A=
No need to define VTS here as already been set from vertical blank control=
=0A=
=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x010c), 0x0000 },=0A=
>+	{ CCI_REG16(0x0114), 0x0300 },=0A=
>+	{ CCI_REG16(0x0116), 0x3000 },=0A=
>+	{ CCI_REG16(0x011a), 0x0001 },=0A=
>+	{ CCI_REG16(0x0118), 0x0002 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x0e92 },=0A=
>+	{ CCI_REG16(0x6f12), 0xffff },=0A=
>+	{ CCI_REG16(0x602a), 0x165a },=0A=
>+	{ CCI_REG16(0x6f12), 0x0003 },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x0b04), 0x0001 },=0A=
>+	{ CCI_REG16(0x0b06), 0x0101 },=0A=
>+	{ CCI_REG16(0x0fea), 0x04a0 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x3c98 },=0A=
>+	{ CCI_REG16(0x6f12), 0x052c },=0A=
>+	{ CCI_REG16(0x6f12), 0x0a3b },=0A=
>+	{ CCI_REG16(0x602a), 0x1da0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0010 },=0A=
>+	{ CCI_REG16(0x602a), 0x10ac },=0A=
>+	{ CCI_REG16(0x6f12), 0x0014 },=0A=
>+	{ CCI_REG16(0x602a), 0x1110 },=0A=
>+	{ CCI_REG16(0x6f12), 0x001d },=0A=
>+	{ CCI_REG16(0x6f12), 0x004d },=0A=
>+	{ CCI_REG16(0x602a), 0x13e8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x080f },=0A=
>+	{ CCI_REG16(0x602a), 0x13f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x38c8 },=0A=
>+};=0A=
>+=0A=
>+static const struct cci_reg_sequence s5k3t2_1280x720_mode[] =3D {=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x0136), 0x1300 },=0A=
>+	{ CCI_REG16(0x013e), 0x00c8 },=0A=
>+	{ CCI_REG16(0x0304), 0x0003 },=0A=
>+	{ CCI_REG16(0x0306), 0x00b9 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x0e0e },=0A=
>+	{ CCI_REG16(0x6f12), 0x0104 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x602a), 0x1078 },=0A=
>+	{ CCI_REG16(0x6f12), 0x04a6 },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x030c), 0x0000 },=0A=
>+	{ CCI_REG16(0x0302), 0x0001 },=0A=
>+	{ CCI_REG16(0x0300), 0x0007 },=0A=
>+	{ CCI_REG16(0x030e), 0x0002 },=0A=
>+	{ CCI_REG16(0x0310), 0x007d },=0A=
>+	{ CCI_REG16(0x0312), 0x0002 },=0A=
>+	{ CCI_REG16(0x0308), 0x0008 },=0A=
>+	{ CCI_REG16(0x030a), 0x0001 },=0A=
>+	{ CCI_REG16(0x0344), 0x0028 },=0A=
>+	{ CCI_REG16(0x0346), 0x01fc },=0A=
>+	{ CCI_REG16(0x0348), 0x1427 },=0A=
>+	{ CCI_REG16(0x034a), 0x0d3b },=0A=
>+	{ CCI_REG16(0x034c), 0x0500 },=0A=
>+	{ CCI_REG16(0x034e), 0x02d0 },=0A=
>+	{ CCI_REG16(0x0350), 0x0000 },=0A=
>+	{ CCI_REG16(0x0352), 0x0000 },=0A=
>+	{ CCI_REG16(0x0900), 0x0124 },=0A=
>+	{ CCI_REG16(0x0404), 0x2000 },=0A=
>+	{ CCI_REG16(0x0380), 0x0002 },=0A=
>+	{ CCI_REG16(0x0382), 0x0002 },=0A=
>+	{ CCI_REG16(0x0384), 0x0002 },=0A=
>+	{ CCI_REG16(0x0386), 0x0006 },=0A=
>+	{ CCI_REG16(0x0342), 0x1620 },=0A=
>+	{ CCI_REG16(0x0340), 0x03e0 },=0A=
=0A=
No need to define VTS here as already been set from vertical blank control=
=0A=
=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x010c), 0x0000 },=0A=
>+	{ CCI_REG16(0x0114), 0x0300 },=0A=
>+	{ CCI_REG16(0x0116), 0x3000 },=0A=
>+	{ CCI_REG16(0x011a), 0x0001 },=0A=
>+	{ CCI_REG16(0x0118), 0x0002 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x0e92 },=0A=
>+	{ CCI_REG16(0x6f12), 0xffff },=0A=
>+	{ CCI_REG16(0x602a), 0x165a },=0A=
>+	{ CCI_REG16(0x6f12), 0x0020 },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x0b04), 0x0001 },=0A=
>+	{ CCI_REG16(0x0b06), 0x0101 },=0A=
>+	{ CCI_REG16(0x0fea), 0x04a0 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x3c98 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0296 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0515 },=0A=
>+	{ CCI_REG16(0x602a), 0x1da0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0110 },=0A=
>+	{ CCI_REG16(0x602a), 0x10ac },=0A=
>+	{ CCI_REG16(0x6f12), 0x0014 },=0A=
>+	{ CCI_REG16(0x602a), 0x1110 },=0A=
>+	{ CCI_REG16(0x6f12), 0x001d },=0A=
>+	{ CCI_REG16(0x6f12), 0x004d },=0A=
>+	{ CCI_REG16(0x602a), 0x13e8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x080f },=0A=
>+	{ CCI_REG16(0x602a), 0x13f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x38c8 },=0A=
>+};=0A=
>+=0A=
>+static const struct s5k3t2_mode s5k3t2_supported_modes[] =3D {=0A=
>+	{=0A=
>+		.width =3D 5184,=0A=
>+		.height =3D 3880,=0A=
>+		.hts =3D 10880,=0A=
>+		.vts =3D 4096,=0A=
>+		.exposure =3D 1000,=0A=
>+		.link_freq_index =3D 0,=0A=
>+		.crop =3D {=0A=
>+			.left =3D 8,=0A=
>+			.top =3D 8,=0A=
>+			.width =3D 5184,=0A=
>+			.height =3D 3880,=0A=
>+		},=0A=
>+		.reg_list =3D {=0A=
>+			.regs =3D s5k3t2_5184x3880_mode,=0A=
>+			.num_regs =3D ARRAY_SIZE(s5k3t2_5184x3880_mode),=0A=
>+		},=0A=
>+	},=0A=
>+	{=0A=
>+		.width =3D 2592,=0A=
>+		.height =3D 1940,=0A=
>+		.hts =3D 5648,=0A=
>+		.vts =3D 1996,=0A=
>+		.exposure =3D 1000,=0A=
>+		.link_freq_index =3D 0,=0A=
>+		.crop =3D {=0A=
>+			.left =3D 8,=0A=
>+			.top =3D 8,=0A=
>+			.width =3D 5184,=0A=
>+			.height =3D 3880,=0A=
>+		},=0A=
>+		.reg_list =3D {=0A=
>+			.regs =3D s5k3t2_2592x1940_mode,=0A=
>+			.num_regs =3D ARRAY_SIZE(s5k3t2_2592x1940_mode),=0A=
>+		},=0A=
>+	},=0A=
>+	{=0A=
>+		.width =3D 1280,=0A=
>+		.height =3D 720,=0A=
>+		.hts =3D 5664,=0A=
>+		.vts =3D 992,=0A=
>+		.exposure =3D 500,=0A=
>+		.link_freq_index =3D 1,=0A=
>+		.crop =3D {=0A=
>+			.left =3D 40,=0A=
>+			.top =3D 508,=0A=
>+			.width =3D 5120,=0A=
>+			.height =3D 2880,=0A=
>+		},=0A=
>+		.reg_list =3D {=0A=
>+			.regs =3D s5k3t2_1280x720_mode,=0A=
>+			.num_regs =3D ARRAY_SIZE(s5k3t2_1280x720_mode),=0A=
>+		},=0A=
>+	},=0A=
>+};=0A=
>+=0A=
>+static int s5k3t2_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
>+{=0A=
>+	struct s5k3t2 *s5k3t2 =3D container_of(ctrl->handler, struct s5k3t2,=0A=
>+					     ctrl_handler);=0A=
=0A=
Please use container_of_const() here.=0A=
=0A=
=0A=
>+	const struct s5k3t2_mode *mode =3D s5k3t2->mode;=0A=
>+	s64 exposure_max;=0A=
>+	int ret;=0A=
>+=0A=
>+	switch (ctrl->id) {=0A=
>+	case V4L2_CID_HFLIP:=0A=
>+	case V4L2_CID_VFLIP:=0A=
>+	case V4L2_CID_LINK_FREQ:=0A=
>+	case V4L2_CID_PIXEL_RATE:=0A=
>+	case V4L2_CID_HBLANK:=0A=
>+		return 0;=0A=
>+	case V4L2_CID_VBLANK:=0A=
>+		exposure_max =3D mode->height + ctrl->val - S5K3T2_EXPOSURE_MARGIN;=0A=
>+		__v4l2_ctrl_modify_range(s5k3t2->exposure,=0A=
>+					 s5k3t2->exposure->minimum,=0A=
>+					 exposure_max,=0A=
>+					 s5k3t2->exposure->step,=0A=
>+					 s5k3t2->exposure->default_value);=0A=
=0A=
Please add error checking for the return value of __v4l2_ctrl_modify_range(=
).=0A=
=0A=
>+		break;=0A=
>+	}=0A=
>+=0A=
>+	if (!pm_runtime_get_if_active(s5k3t2->dev))=0A=
>+		return 0;=0A=
>+=0A=
>+	switch (ctrl->id) {=0A=
>+	case V4L2_CID_ANALOGUE_GAIN:=0A=
>+		ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_AGAIN,=0A=
>+				ctrl->val << S5K3T2_AGAIN_SHIFT, NULL);=0A=
>+		break;=0A=
>+	case V4L2_CID_EXPOSURE:=0A=
>+		ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_EXPOSURE,=0A=
>+				ctrl->val, NULL);=0A=
>+		break;=0A=
>+	case V4L2_CID_VBLANK:=0A=
>+		ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_VTS,=0A=
>+				ctrl->val + mode->height, NULL);=0A=
>+		break;=0A=
>+	case V4L2_CID_TEST_PATTERN:=0A=
>+		ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_TEST_PATTERN,=0A=
>+				ctrl->val, NULL);=0A=
>+		break;=0A=
>+	default:=0A=
>+		ret =3D -EINVAL;=0A=
>+		break;=0A=
>+	}=0A=
>+=0A=
>+	pm_runtime_put(s5k3t2->dev);=0A=
>+=0A=
>+	return ret;=0A=
>+}=0A=
>+=0A=
>+static const struct v4l2_ctrl_ops s5k3t2_ctrl_ops =3D {=0A=
>+	.s_ctrl =3D s5k3t2_set_ctrl,=0A=
>+};=0A=
>+=0A=
>+static int s5k3t2_init_controls(struct s5k3t2 *s5k3t2)=0A=
>+{=0A=
>+	struct v4l2_ctrl_handler *ctrl_hdlr =3D &s5k3t2->ctrl_handler;=0A=
>+	const struct s5k3t2_mode *mode =3D s5k3t2->mode;=0A=
>+	s64 hblank, vblank, exposure_max;=0A=
>+	struct v4l2_fwnode_device_properties props;=0A=
>+	int ret;=0A=
>+=0A=
=0A=
Please align as reverse christmas tree order=0A=
=0A=
>+	v4l2_ctrl_handler_init(ctrl_hdlr, 11);=0A=
>+=0A=
>+	s5k3t2->link_freq =3D=0A=
>+		v4l2_ctrl_new_int_menu(ctrl_hdlr, &s5k3t2_ctrl_ops,=0A=
>+				       V4L2_CID_LINK_FREQ,=0A=
>+				       ARRAY_SIZE(s5k3t2_link_freq_menu) - 1,=0A=
>+				       mode->link_freq_index,=0A=
>+				       s5k3t2_link_freq_menu);=0A=
>+	if (s5k3t2->link_freq)=0A=
>+		s5k3t2->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;=0A=
>+=0A=
>+	s5k3t2->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr, &s5k3t2_ctrl_ops,=0A=
>+					       V4L2_CID_PIXEL_RATE,=0A=
>+					       S5K3T2_PIXEL_RATE,=0A=
>+					       S5K3T2_PIXEL_RATE, 1,=0A=
>+					       S5K3T2_PIXEL_RATE);=0A=
>+=0A=
>+	hblank =3D mode->hts - mode->width;=0A=
>+	s5k3t2->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &s5k3t2_ctrl_ops,=0A=
>+					   V4L2_CID_HBLANK, hblank,=0A=
>+					   hblank, 1, hblank);=0A=
>+	if (s5k3t2->hblank)=0A=
>+		s5k3t2->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;=0A=
>+=0A=
>+	vblank =3D mode->vts - mode->height;=0A=
>+	s5k3t2->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &s5k3t2_ctrl_ops,=0A=
>+					   V4L2_CID_VBLANK, vblank,=0A=
>+					   S5K3T2_VTS_MAX - mode->height, 1,=0A=
>+					   vblank);=0A=
>+=0A=
>+	v4l2_ctrl_new_std(ctrl_hdlr, &s5k3t2_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,=
=0A=
>+			  S5K3T2_AGAIN_MIN, S5K3T2_AGAIN_MAX,=0A=
>+			  S5K3T2_AGAIN_STEP, S5K3T2_AGAIN_DEFAULT);=0A=
>+=0A=
>+	exposure_max =3D mode->vts - S5K3T2_EXPOSURE_MARGIN;=0A=
>+	s5k3t2->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &s5k3t2_ctrl_ops,=0A=
>+					     V4L2_CID_EXPOSURE,=0A=
>+					     S5K3T2_EXPOSURE_MIN,=0A=
>+					     exposure_max,=0A=
>+					     S5K3T2_EXPOSURE_STEP,=0A=
>+					     mode->exposure);=0A=
>+=0A=
>+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &s5k3t2_ctrl_ops,=0A=
>+				     V4L2_CID_TEST_PATTERN,=0A=
>+				     ARRAY_SIZE(s5k3t2_test_pattern_menu) - 1,=0A=
>+				     0, 0, s5k3t2_test_pattern_menu);=0A=
>+=0A=
>+	s5k3t2->hflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &s5k3t2_ctrl_ops,=0A=
>+					  V4L2_CID_HFLIP, 0, 1, 1, 0);=0A=
>+	if (s5k3t2->hflip)=0A=
>+		s5k3t2->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;=0A=
>+=0A=
>+	s5k3t2->vflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &s5k3t2_ctrl_ops,=0A=
>+					  V4L2_CID_VFLIP, 0, 1, 1, 0);=0A=
>+	if (s5k3t2->vflip)=0A=
>+		s5k3t2->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;=0A=
>+=0A=
>+	ret =3D v4l2_fwnode_device_parse(s5k3t2->dev, &props);=0A=
>+	if (ret)=0A=
>+		goto error_free_hdlr;=0A=
>+=0A=
>+	ret =3D v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &s5k3t2_ctrl_ops,=0A=
>+					      &props);=0A=
>+	if (ret)=0A=
>+		goto error_free_hdlr;=0A=
>+=0A=
>+	if (ctrl_hdlr->error) {=0A=
>+		ret =3D ctrl_hdlr->error;=0A=
>+		goto error_free_hdlr;=0A=
>+	}=0A=
>+=0A=
>+	s5k3t2->sd.ctrl_handler =3D ctrl_hdlr;=0A=
>+=0A=
>+	return 0;=0A=
>+=0A=
>+error_free_hdlr:=0A=
>+	v4l2_ctrl_handler_free(ctrl_hdlr);=0A=
>+=0A=
>+	return ret;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_enable_streams(struct v4l2_subdev *sd,=0A=
>+				 struct v4l2_subdev_state *state, u32 pad,=0A=
>+				 u64 streams_mask)=0A=
>+{=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+	const struct s5k3t2_reg_list *reg_list =3D &s5k3t2->mode->reg_list;=0A=
>+	int ret;=0A=
>+=0A=
=0A=
Please align as reverse christmas tree order=0A=
=0A=
>+	ret =3D pm_runtime_resume_and_get(s5k3t2->dev);=0A=
>+	if (ret)=0A=
>+		return ret;=0A=
>+=0A=
>+	cci_write(s5k3t2->regmap, CCI_REG16(0x6028), 0x4000, &ret);=0A=
=0A=
Could you explain what this register CCI_REG16(0x6028) actually does?=0A=
=0A=
>+	cci_write(s5k3t2->regmap, CCI_REG16(0x0000), 0x0005, &ret);=0A=
>+	cci_write(s5k3t2->regmap, CCI_REG16(0x0000), S5K3T2_CHIP_ID, &ret);=0A=
=0A=
It seems unusual to write the values to S5K3T2_REG_CHIP_ID (0x0000),=0A=
=0A=
The chip ID register is generally read-only.=0A=
=0A=
>+	cci_write(s5k3t2->regmap, CCI_REG16(0x6010), 0x0001, &ret);=0A=
>+	if (ret)=0A=
>+		goto error;=0A=
>+=0A=
>+	usleep_range(5 * USEC_PER_MSEC, 6 * USEC_PER_MSEC);=0A=
>+=0A=
>+	cci_multi_reg_write(s5k3t2->regmap, s5k3t2_init_setting,=0A=
>+			    ARRAY_SIZE(s5k3t2_init_setting), &ret);=0A=
>+	cci_multi_reg_write(s5k3t2->regmap, reg_list->regs,=0A=
>+			    reg_list->num_regs, &ret);=0A=
>+	if (ret)=0A=
>+		goto error;=0A=
>+=0A=
>+	ret =3D __v4l2_ctrl_handler_setup(s5k3t2->sd.ctrl_handler);=0A=
>+=0A=
>+	cci_write(s5k3t2->regmap, S5K3T2_REG_CTRL_MODE,=0A=
>+		  S5K3T2_MODE_STREAMING |=0A=
>+		  (s5k3t2->vflip->val ? S5K3T2_VFLIP : 0) |=0A=
>+		  (s5k3t2->hflip->val ? S5K3T2_HFLIP : 0), &ret);=0A=
>+	if (ret)=0A=
>+		goto error;=0A=
>+=0A=
>+	__v4l2_ctrl_grab(s5k3t2->vflip, true);=0A=
>+	__v4l2_ctrl_grab(s5k3t2->hflip, true);=0A=
>+=0A=
>+	return 0;=0A=
>+=0A=
>+error:=0A=
>+	dev_err(s5k3t2->dev, "failed to start streaming: %d\n", ret);=0A=
>+	pm_runtime_put_autosuspend(s5k3t2->dev);=0A=
>+=0A=
>+	return ret;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_disable_streams(struct v4l2_subdev *sd,=0A=
>+				  struct v4l2_subdev_state *state, u32 pad,=0A=
>+				  u64 streams_mask)=0A=
>+{=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+	int ret;=0A=
>+=0A=
>+	ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_CTRL_MODE, 0, NULL);=0A=
>+	if (ret)=0A=
>+		dev_err(s5k3t2->dev, "failed to stop streaming: %d\n", ret);=0A=
>+=0A=
>+	__v4l2_ctrl_grab(s5k3t2->vflip, false);=0A=
>+	__v4l2_ctrl_grab(s5k3t2->hflip, false);=0A=
>+=0A=
>+	pm_runtime_put_autosuspend(s5k3t2->dev);=0A=
>+=0A=
>+	return ret;=0A=
>+}=0A=
>+=0A=
>+static u32 s5k3t2_get_format_code(struct s5k3t2 *s5k3t2)=0A=
>+{=0A=
>+	unsigned int i;=0A=
>+=0A=
>+	i =3D (s5k3t2->vflip->val ? 2 : 0) | (s5k3t2->hflip->val ? 1 : 0);=0A=
>+=0A=
>+	return s5k3t2_mbus_formats[i];=0A=
>+}=0A=
>+=0A=
>+static void s5k3t2_update_pad_format(struct s5k3t2 *s5k3t2,=0A=
>+				     const struct s5k3t2_mode *mode,=0A=
>+				     struct v4l2_mbus_framefmt *fmt)=0A=
>+{=0A=
>+	fmt->code =3D s5k3t2_get_format_code(s5k3t2);=0A=
>+	fmt->width =3D mode->width;=0A=
>+	fmt->height =3D mode->height;=0A=
>+	fmt->field =3D V4L2_FIELD_NONE;=0A=
>+	fmt->colorspace =3D V4L2_COLORSPACE_RAW;=0A=
>+	fmt->ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;=0A=
>+	fmt->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;=0A=
>+	fmt->xfer_func =3D V4L2_XFER_FUNC_NONE;=0A=
>+}=0A=
>+=0A=
>+static bool s5k3t2_filter_by_link_freq(const void *array, size_t index,=
=0A=
>+				       const void *context)=0A=
>+{=0A=
>+	const struct s5k3t2_mode *mode =3D array;=0A=
>+	const struct s5k3t2 *s5k3t2 =3D context;=0A=
>+=0A=
>+	return s5k3t2->link_freq_bitmap & BIT(mode->link_freq_index);=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_set_pad_format(struct v4l2_subdev *sd,=0A=
>+				 struct v4l2_subdev_state *state,=0A=
>+				 struct v4l2_subdev_format *fmt)=0A=
>+{=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+	s64 hblank, vblank, exposure_max;=0A=
>+	const struct s5k3t2_mode *mode;=0A=
>+=0A=
>+	mode =3D v4l2_find_nearest_size_conditional(s5k3t2_supported_modes,=0A=
>+						  ARRAY_SIZE(s5k3t2_supported_modes),=0A=
>+						  width, height,=0A=
>+						  fmt->format.width,=0A=
>+						  fmt->format.height,=0A=
>+						  s5k3t2_filter_by_link_freq,=0A=
>+						  s5k3t2);=0A=
>+=0A=
>+	s5k3t2_update_pad_format(s5k3t2, mode, &fmt->format);=0A=
>+=0A=
>+	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY || s5k3t2->mode =3D=3D mode=
)=0A=
>+		goto set_format;=0A=
=0A=
It can be handled without goto.=0A=
=0A=
>+=0A=
>+	s5k3t2->mode =3D mode;=0A=
>+=0A=
>+	__v4l2_ctrl_s_ctrl(s5k3t2->link_freq, mode->link_freq_index);=0A=
>+=0A=
>+	hblank =3D mode->hts - mode->width;=0A=
>+	__v4l2_ctrl_modify_range(s5k3t2->hblank, hblank, hblank, 1, hblank);=0A=
>+=0A=
>+	vblank =3D mode->vts - mode->height;=0A=
>+	__v4l2_ctrl_modify_range(s5k3t2->vblank, vblank,=0A=
>+				 S5K3T2_VTS_MAX - mode->height, 1, vblank);=0A=
>+	__v4l2_ctrl_s_ctrl(s5k3t2->vblank, vblank);=0A=
>+=0A=
>+	exposure_max =3D mode->vts - S5K3T2_EXPOSURE_MARGIN;=0A=
>+	__v4l2_ctrl_modify_range(s5k3t2->exposure, S5K3T2_EXPOSURE_MIN,=0A=
>+				 exposure_max, S5K3T2_EXPOSURE_STEP,=0A=
>+				 mode->exposure);=0A=
>+	__v4l2_ctrl_s_ctrl(s5k3t2->exposure, mode->exposure);=0A=
>+=0A=
=0A=
Could you please add error checking for the all control operations=0A=
=0A=
to handle any failures appropriately.=0A=
=0A=
>+	if (s5k3t2->sd.ctrl_handler->error)=0A=
>+		return s5k3t2->sd.ctrl_handler->error;=0A=
>+=0A=
>+set_format:=0A=
>+	*v4l2_subdev_state_get_format(state, 0) =3D fmt->format;=0A=
>+=0A=
>+	return 0;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_enum_mbus_code(struct v4l2_subdev *sd,=0A=
>+				 struct v4l2_subdev_state *sd_state,=0A=
>+				 struct v4l2_subdev_mbus_code_enum *code)=0A=
>+{=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+=0A=
>+	if (code->index > 0)=0A=
>+		return -EINVAL;=0A=
>+=0A=
>+	code->code =3D s5k3t2_get_format_code(s5k3t2);=0A=
>+=0A=
>+	return 0;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_enum_frame_size(struct v4l2_subdev *sd,=0A=
>+				  struct v4l2_subdev_state *sd_state,=0A=
>+				  struct v4l2_subdev_frame_size_enum *fse)=0A=
>+{=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+	unsigned int i, index =3D fse->index;=0A=
>+=0A=
>+	if (fse->code !=3D s5k3t2_get_format_code(s5k3t2))=0A=
>+		return -EINVAL;=0A=
>+=0A=
>+	for (i =3D 0; i < ARRAY_SIZE(s5k3t2_supported_modes); i++) {=0A=
>+		const struct s5k3t2_mode *mode =3D &s5k3t2_supported_modes[i];=0A=
>+=0A=
>+		if (!(s5k3t2->link_freq_bitmap & BIT(mode->link_freq_index)))=0A=
>+			continue;=0A=
>+=0A=
>+		if (index--)=0A=
>+			continue;=0A=
>+=0A=
>+		fse->min_width =3D mode->width;=0A=
>+		fse->max_width =3D fse->min_width;=0A=
>+		fse->min_height =3D mode->height;=0A=
>+		fse->max_height =3D fse->min_height;=0A=
>+=0A=
>+		return 0;=0A=
>+	}=0A=
>+=0A=
>+	return -EINVAL;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_get_selection(struct v4l2_subdev *sd,=0A=
>+				struct v4l2_subdev_state *sd_state,=0A=
>+				struct v4l2_subdev_selection *sel)=0A=
>+{=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+	const struct s5k3t2_mode *mode =3D s5k3t2->mode;=0A=
>+	const struct v4l2_mbus_framefmt *fmt;=0A=
>+=0A=
=0A=
Please align as reverse christmas tree order=0A=
=0A=
>+	switch (sel->target) {=0A=
>+	case V4L2_SEL_TGT_CROP:=0A=
>+		if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {=0A=
>+			fmt =3D v4l2_subdev_state_get_format(sd_state, 0);=0A=
>+			mode =3D v4l2_find_nearest_size(s5k3t2_supported_modes,=0A=
>+						      ARRAY_SIZE(s5k3t2_supported_modes),=0A=
>+						      width, height,=0A=
>+						      fmt->width, fmt->height);=0A=
>+		}=0A=
>+		sel->r =3D mode->crop;=0A=
>+		return 0;=0A=
>+	case V4L2_SEL_TGT_NATIVE_SIZE:=0A=
>+		sel->r.left =3D 0;=0A=
>+		sel->r.top =3D 0;=0A=
>+		sel->r.width =3D S5K3T2_NATIVE_WIDTH;=0A=
>+		sel->r.height =3D S5K3T2_NATIVE_HEIGHT;=0A=
>+		return 0;=0A=
>+	case V4L2_SEL_TGT_CROP_DEFAULT:=0A=
>+	case V4L2_SEL_TGT_CROP_BOUNDS:=0A=
>+		sel->r.left =3D 8;=0A=
>+		sel->r.top =3D 8;=0A=
>+		sel->r.width =3D 5184;=0A=
>+		sel->r.height =3D 3880;=0A=
>+		return 0;=0A=
>+	default:=0A=
>+		return -EINVAL;=0A=
>+	}=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_init_state(struct v4l2_subdev *sd,=0A=
>+			     struct v4l2_subdev_state *state)=0A=
>+{=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+	struct v4l2_subdev_format fmt =3D {=0A=
>+		.which =3D V4L2_SUBDEV_FORMAT_TRY,=0A=
>+		.pad =3D 0,=0A=
>+		.format =3D {=0A=
>+			.width =3D s5k3t2->mode->width,=0A=
>+			.height =3D s5k3t2->mode->height,=0A=
>+		},=0A=
>+	};=0A=
>+=0A=
>+	s5k3t2_set_pad_format(sd, state, &fmt);=0A=
>+=0A=
>+	return 0;=0A=
>+}=0A=
=0A=
Please return s5k3t2_set_pad_format(sd, state, &fmt);=0A=
=0A=
since this function always returns 0=0A=
=0A=
>+=0A=
>+static const struct v4l2_subdev_video_ops s5k3t2_video_ops =3D {=0A=
>+	.s_stream =3D v4l2_subdev_s_stream_helper,=0A=
>+};=0A=
>+=0A=
>+static const struct v4l2_subdev_pad_ops s5k3t2_pad_ops =3D {=0A=
>+	.set_fmt =3D s5k3t2_set_pad_format,=0A=
>+	.get_fmt =3D v4l2_subdev_get_fmt,=0A=
>+	.get_selection =3D s5k3t2_get_selection,=0A=
>+	.enum_mbus_code =3D s5k3t2_enum_mbus_code,=0A=
>+	.enum_frame_size =3D s5k3t2_enum_frame_size,=0A=
>+	.enable_streams =3D s5k3t2_enable_streams,=0A=
>+	.disable_streams =3D s5k3t2_disable_streams,=0A=
>+};=0A=
>+=0A=
>+static const struct v4l2_subdev_ops s5k3t2_subdev_ops =3D {=0A=
>+	.video =3D &s5k3t2_video_ops,=0A=
>+	.pad =3D &s5k3t2_pad_ops,=0A=
>+};=0A=
>+=0A=
>+static const struct v4l2_subdev_internal_ops s5k3t2_internal_ops =3D {=0A=
>+	.init_state =3D s5k3t2_init_state,=0A=
>+};=0A=
>+=0A=
>+static const struct media_entity_operations s5k3t2_subdev_entity_ops =3D =
{=0A=
>+	.link_validate =3D v4l2_subdev_link_validate,=0A=
>+};=0A=
>+=0A=
>+static int s5k3t2_identify_sensor(struct s5k3t2 *s5k3t2)=0A=
>+{=0A=
>+	u64 val;=0A=
>+	int ret;=0A=
>+=0A=
>+	ret =3D cci_read(s5k3t2->regmap, S5K3T2_REG_CHIP_ID, &val, NULL);=0A=
>+	if (ret) {=0A=
>+		dev_err(s5k3t2->dev, "failed to read chip id: %d\n", ret);=0A=
>+		return ret;=0A=
>+	}=0A=
>+=0A=
>+	if (val !=3D S5K3T2_CHIP_ID) {=0A=
>+		dev_err(s5k3t2->dev, "chip id mismatch: %x!=3D%llx\n",=0A=
>+			S5K3T2_CHIP_ID, val);=0A=
>+		return -ENODEV;=0A=
>+	}=0A=
>+=0A=
>+	return 0;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_check_hwcfg(struct s5k3t2 *s5k3t2)=0A=
>+{=0A=
>+	struct fwnode_handle *fwnode =3D dev_fwnode(s5k3t2->dev), *ep;=0A=
>+	struct v4l2_fwnode_endpoint bus_cfg =3D {=0A=
>+		.bus =3D {=0A=
>+			.mipi_csi2 =3D {=0A=
>+				.num_data_lanes =3D S5K3T2_DATA_LANES,=0A=
>+			},=0A=
>+		},=0A=
>+		.bus_type =3D V4L2_MBUS_CSI2_DPHY,=0A=
>+	};=0A=
>+	int ret;=0A=
>+=0A=
>+	if (!fwnode)=0A=
>+		return -ENODEV;=0A=
>+=0A=
>+	ep =3D fwnode_graph_get_next_endpoint(fwnode, NULL);=0A=
>+	if (!ep)=0A=
>+		return -EINVAL;=0A=
>+=0A=
>+	ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);=0A=
>+	fwnode_handle_put(ep);=0A=
>+	if (ret)=0A=
>+		return ret;=0A=
>+=0A=
>+	if (bus_cfg.bus.mipi_csi2.num_data_lanes !=3D S5K3T2_DATA_LANES) {=0A=
>+		dev_err(s5k3t2->dev, "invalid number of data lanes: %u\n",=0A=
>+			bus_cfg.bus.mipi_csi2.num_data_lanes);=0A=
>+		ret =3D -EINVAL;=0A=
>+		goto endpoint_free;=0A=
>+	}=0A=
>+=0A=
>+	ret =3D v4l2_link_freq_to_bitmap(s5k3t2->dev, bus_cfg.link_frequencies,=
=0A=
>+				       bus_cfg.nr_of_link_frequencies,=0A=
>+				       s5k3t2_link_freq_menu,=0A=
>+				       ARRAY_SIZE(s5k3t2_link_freq_menu),=0A=
>+				       &s5k3t2->link_freq_bitmap);=0A=
>+=0A=
>+endpoint_free:=0A=
>+	v4l2_fwnode_endpoint_free(&bus_cfg);=0A=
>+=0A=
>+	return ret;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_power_on(struct device *dev)=0A=
>+{=0A=
>+	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+	int ret;=0A=
>+=0A=
>+	ret =3D regulator_bulk_enable(S5K3T2_NUM_SUPPLIES, s5k3t2->supplies);=0A=
>+	if (ret)=0A=
>+		return ret;=0A=
>+=0A=
>+	ret =3D clk_prepare_enable(s5k3t2->mclk);=0A=
>+	if (ret)=0A=
>+		goto disable_regulators;=0A=
>+=0A=
>+	usleep_range(USEC_PER_MSEC, 2 * USEC_PER_MSEC);=0A=
>+	gpiod_set_value_cansleep(s5k3t2->reset_gpio, 0);=0A=
>+	usleep_range(10 * USEC_PER_MSEC, 15 * USEC_PER_MSEC);=0A=
>+=0A=
>+	return 0;=0A=
>+=0A=
>+disable_regulators:=0A=
>+	regulator_bulk_disable(S5K3T2_NUM_SUPPLIES, s5k3t2->supplies);=0A=
>+=0A=
>+	return ret;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_power_off(struct device *dev)=0A=
>+{=0A=
>+	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+=0A=
>+	gpiod_set_value_cansleep(s5k3t2->reset_gpio, 1);=0A=
>+=0A=
>+	clk_disable_unprepare(s5k3t2->mclk);=0A=
>+=0A=
>+	regulator_bulk_disable(S5K3T2_NUM_SUPPLIES, s5k3t2->supplies);=0A=
>+=0A=
>+	return 0;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_probe(struct i2c_client *client)=0A=
>+{=0A=
>+	struct s5k3t2 *s5k3t2;=0A=
>+	unsigned long freq;=0A=
>+	unsigned int i;=0A=
>+	int ret;=0A=
>+=0A=
>+	s5k3t2 =3D devm_kzalloc(&client->dev, sizeof(*s5k3t2), GFP_KERNEL);=0A=
>+	if (!s5k3t2)=0A=
>+		return -ENOMEM;=0A=
>+=0A=
>+	s5k3t2->dev =3D &client->dev;=0A=
>+	v4l2_i2c_subdev_init(&s5k3t2->sd, client, &s5k3t2_subdev_ops);=0A=
>+=0A=
>+	s5k3t2->regmap =3D devm_cci_regmap_init_i2c(client, 16);=0A=
>+	if (IS_ERR(s5k3t2->regmap))=0A=
>+		return dev_err_probe(s5k3t2->dev, PTR_ERR(s5k3t2->regmap),=0A=
>+				     "failed to init CCI\n");=0A=
>+=0A=
>+	s5k3t2->mclk =3D devm_v4l2_sensor_clk_get(s5k3t2->dev, NULL);=0A=
>+	if (IS_ERR(s5k3t2->mclk))=0A=
>+		return dev_err_probe(s5k3t2->dev, PTR_ERR(s5k3t2->mclk),=0A=
>+				     "failed to get MCLK clock\n");=0A=
>+=0A=
>+	freq =3D clk_get_rate(s5k3t2->mclk);=0A=
>+	if (freq !=3D S5K3T2_MCLK_FREQ)=0A=
>+		return dev_err_probe(s5k3t2->dev, -EINVAL,=0A=
>+				     "MCLK clock frequency %lu is not supported\n",=0A=
>+				     freq);=0A=
>+=0A=
>+	ret =3D s5k3t2_check_hwcfg(s5k3t2);=0A=
>+	if (ret)=0A=
>+		return dev_err_probe(s5k3t2->dev, ret,=0A=
>+				     "failed to check HW configuration\n");=0A=
>+=0A=
>+	s5k3t2->reset_gpio =3D devm_gpiod_get_optional(s5k3t2->dev, "reset",=0A=
>+						     GPIOD_OUT_HIGH);=0A=
>+	if (IS_ERR(s5k3t2->reset_gpio))=0A=
>+		return dev_err_probe(s5k3t2->dev, PTR_ERR(s5k3t2->reset_gpio),=0A=
>+				     "cannot get reset GPIO\n");=0A=
>+=0A=
>+	for (i =3D 0; i < S5K3T2_NUM_SUPPLIES; i++)=0A=
>+		s5k3t2->supplies[i].supply =3D s5k3t2_supply_names[i];=0A=
>+=0A=
>+	ret =3D devm_regulator_bulk_get(s5k3t2->dev, S5K3T2_NUM_SUPPLIES,=0A=
>+				      s5k3t2->supplies);=0A=
>+	if (ret)=0A=
>+		return dev_err_probe(s5k3t2->dev, ret,=0A=
>+				     "failed to get supply regulators\n");=0A=
>+=0A=
>+	ret =3D s5k3t2_power_on(s5k3t2->dev);=0A=
>+	if (ret)=0A=
>+		return ret;=0A=
>+=0A=
>+	ret =3D s5k3t2_identify_sensor(s5k3t2);=0A=
>+	if (ret) {=0A=
>+		dev_err_probe(s5k3t2->dev, ret, "failed to find sensor\n");=0A=
>+		goto power_off;=0A=
>+	}=0A=
>+=0A=
>+	s5k3t2->mode =3D=0A=
>+		v4l2_find_nearest_size_conditional(s5k3t2_supported_modes,=0A=
>+						   ARRAY_SIZE(s5k3t2_supported_modes),=0A=
>+						   width, height,=0A=
>+						   S5K3T2_DEFAULT_WIDTH,=0A=
>+						   S5K3T2_DEFAULT_HEIGHT,=0A=
>+						   s5k3t2_filter_by_link_freq,=0A=
>+						   s5k3t2);=0A=
>+	ret =3D s5k3t2_init_controls(s5k3t2);=0A=
>+	if (ret) {=0A=
>+		dev_err_probe(s5k3t2->dev, ret, "failed to init controls\n");=0A=
>+		goto power_off;=0A=
>+	}=0A=
>+=0A=
>+	s5k3t2->sd.state_lock =3D s5k3t2->ctrl_handler.lock;=0A=
>+	s5k3t2->sd.internal_ops =3D &s5k3t2_internal_ops;=0A=
>+	s5k3t2->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;=0A=
>+	s5k3t2->sd.entity.ops =3D &s5k3t2_subdev_entity_ops;=0A=
>+	s5k3t2->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;=0A=
>+	s5k3t2->pad.flags =3D MEDIA_PAD_FL_SOURCE;=0A=
>+=0A=
>+	ret =3D media_entity_pads_init(&s5k3t2->sd.entity, 1, &s5k3t2->pad);=0A=
>+	if (ret) {=0A=
>+		dev_err_probe(s5k3t2->dev, ret,=0A=
>+			      "failed to init media entity pads\n");=0A=
>+		goto v4l2_ctrl_handler_free;=0A=
>+	}=0A=
>+=0A=
>+	ret =3D v4l2_subdev_init_finalize(&s5k3t2->sd);=0A=
>+	if (ret < 0) {=0A=
>+		dev_err_probe(s5k3t2->dev, ret,=0A=
>+			      "failed to finalize subdev init\n");=0A=
>+		goto media_entity_cleanup;=0A=
>+	}=0A=
>+=0A=
>+	pm_runtime_set_active(s5k3t2->dev);=0A=
>+	pm_runtime_enable(s5k3t2->dev);=0A=
>+=0A=
>+	ret =3D v4l2_async_register_subdev_sensor(&s5k3t2->sd);=0A=
>+	if (ret < 0) {=0A=
>+		dev_err_probe(s5k3t2->dev, ret,=0A=
>+			      "failed to register V4L2 subdev\n");=0A=
>+		goto subdev_cleanup;=0A=
>+	}=0A=
>+=0A=
>+	pm_runtime_set_autosuspend_delay(s5k3t2->dev, 1000);=0A=
>+	pm_runtime_use_autosuspend(s5k3t2->dev);=0A=
>+	pm_runtime_idle(s5k3t2->dev);=0A=
>+=0A=
>+	return 0;=0A=
>+=0A=
>+subdev_cleanup:=0A=
>+	v4l2_subdev_cleanup(&s5k3t2->sd);=0A=
>+	pm_runtime_disable(s5k3t2->dev);=0A=
>+	pm_runtime_set_suspended(s5k3t2->dev);=0A=
>+=0A=
>+media_entity_cleanup:=0A=
>+	media_entity_cleanup(&s5k3t2->sd.entity);=0A=
>+=0A=
>+v4l2_ctrl_handler_free:=0A=
>+	v4l2_ctrl_handler_free(s5k3t2->sd.ctrl_handler);=0A=
>+=0A=
>+power_off:=0A=
>+	s5k3t2_power_off(s5k3t2->dev);=0A=
>+=0A=
>+	return ret;=0A=
>+}=0A=
>+=0A=
>+static void s5k3t2_remove(struct i2c_client *client)=0A=
>+{=0A=
>+	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+=0A=
>+	v4l2_async_unregister_subdev(sd);=0A=
>+	v4l2_subdev_cleanup(sd);=0A=
>+	media_entity_cleanup(&sd->entity);=0A=
>+	v4l2_ctrl_handler_free(sd->ctrl_handler);=0A=
>+	pm_runtime_disable(s5k3t2->dev);=0A=
>+=0A=
>+	if (!pm_runtime_status_suspended(s5k3t2->dev)) {=0A=
>+		s5k3t2_power_off(s5k3t2->dev);=0A=
>+		pm_runtime_set_suspended(s5k3t2->dev);=0A=
>+	}=0A=
>+}=0A=
>+=0A=
>+static const struct dev_pm_ops s5k3t2_pm_ops =3D {=0A=
>+	RUNTIME_PM_OPS(s5k3t2_power_off, s5k3t2_power_on, NULL)=0A=
>+};=0A=
>+=0A=
>+static const struct of_device_id s5k3t2_of_match[] =3D {=0A=
>+	{ .compatible =3D "samsung,s5k3t2" },=0A=
>+	{ }=0A=
>+};=0A=
>+MODULE_DEVICE_TABLE(of, s5k3t2_of_match);=0A=
>+=0A=
>+static struct i2c_driver s5k3t2_i2c_driver =3D {=0A=
>+	.driver =3D {=0A=
>+		.name =3D "s5k3t2",=0A=
>+		.pm =3D pm_ptr(&s5k3t2_pm_ops),=0A=
>+		.of_match_table =3D s5k3t2_of_match,=0A=
>+	},=0A=
>+	.probe =3D s5k3t2_probe,=0A=
>+	.remove =3D s5k3t2_remove,=0A=
>+};=0A=
>+=0A=
>+module_i2c_driver(s5k3t2_i2c_driver);=0A=
>+=0A=
>+MODULE_AUTHOR("Armandas Kvietkus <armandas.kvietkus@proton.me>");=0A=
>+MODULE_DESCRIPTION("Samsung S5K3T2 image sensor driver");=0A=
>+MODULE_LICENSE("GPL");=0A=
>=0A=
>--=0A=
>2.55.0=0A=
=0A=
Best Regards,=0A=
Elgin=0A=
