Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023073.outbound.protection.outlook.com [52.101.72.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703EB4E0B7C;
	Wed, 30 Sep 2026 14:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779047; cv=fail; b=UcOhn0WsPa8NoO613f5DAdoLxoHcgtfpBJNsVxeQqi8rxns5vZKpPpyDxiXh41mIU1jtQdebl7l44SDlDqdjz8uwOPjewSDju2NNhdnJeYSy0iF6/UKzmAkM1oVDi5tDrFWRibnLl4vpwxqjaiMPfbsUrxh6aG7w06o4+VEHrko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779047; c=relaxed/simple;
	bh=THgeAKLasJB3pTi+LUtV+zTDlYEMzZ325QHtXuqeUFs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D8mqJC4v+PV8Tt521WTB+e1UzrAxsAhOzTVZtIwX6gkPp5oc7Xo36MvR1NP8M1MQeVqX6EwbRX6sOeQOdnpMHrjkUose/EGI1Y1GKk+cn+ojv8uvTLVBTlMyC4zUKwGOxvoyI2/VJOqw0Tszt+Nqepl0heXY/1x+dY9rMON+FW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it; spf=pass smtp.mailfrom=santannapisa.it; dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b=E9PODR+8; arc=fail smtp.client-ip=52.101.72.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b="E9PODR+8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZV0ff235kkG4mZZgxU9uUAQ3jOFqvmpj1EMgIEZUt5IsH8GPLy2R1+/UJODDfcHVE7OtEShaYrcQbzN3QDnP+dPjXx0eQMYvzstad5HbEHzLhlSB0/JP42Cp2IHkiDWiZPlrx0FalNT1T6ir/uA8TRegc4F3kCz1UJoUu7NDlTcxgahjjwY1J74Gx4uo9/fP943KzkwuhG15PqyCUW1RIyh5K9tI8fclvjjXFkWgckP2GTjWLGPFpsWIU3X+uFcDuLosD0SgEddVanf/jRnazGoBGkanYoqIaa167Zw5I453nJryX0S15d5T90BN8w4kZGuuwqr7PSHxRi2f3R2A4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THgeAKLasJB3pTi+LUtV+zTDlYEMzZ325QHtXuqeUFs=;
 b=mH1+IEHCfkfMBTmNn5nkV37PULJMbwuT72TBGTF+0CN3n+kDs6wxnnpeQfcQ0QXl6oeBZ46X4C2DmBdAOAag3K92iY2vsUEfTlyZmdkr+Tm9ffVnoqgI3OXHuc9DS/IMbd5RdV0pDAi5VwCIY5oK30WPbBoCKGtkIlfGvEPROgTsh6zHTJn43RbYDJEt1+inh3Ag01I6nOhb+tYygNkxPheYqmcGTddgv8AqF7Bc4C5ftKKaozhjgQ5VM3bRebss6G31tg12Yzr4XZ9kTtLmkDbMz82ytT1RMPTgBFYyPcOxECiwPyIPoCvXclgeG+lXoycp1Hc4QYjvKYmaLHUskA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THgeAKLasJB3pTi+LUtV+zTDlYEMzZ325QHtXuqeUFs=;
 b=E9PODR+85blmXYS8KzKjTrO14EcSPEDPJLR47XPZjY0qiEXYjhEivSJYFGG59CvqjdIUQqVMQ2OT35QgGOJb0nxT4CDpIU36bLPD6oCAbXtv2H8cuaTHaPix7jqVonq6pT9bewg40lE+uEiLCNltp+EO46IOhc+KOZBAX3kUgOA=
Received: from AM0PR03MB4113.eurprd03.prod.outlook.com (2603:10a6:208:74::27)
 by AS8PR03MB7955.eurprd03.prod.outlook.com (2603:10a6:20b:426::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 14:37:09 +0000
Received: from AM0PR03MB4113.eurprd03.prod.outlook.com
 ([fe80::57d1:3e47:721f:a0a0]) by AM0PR03MB4113.eurprd03.prod.outlook.com
 ([fe80::57d1:3e47:721f:a0a0%6]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 14:37:09 +0000
From: Mauro Marinoni <Mauro.Marinoni@santannapisa.it>
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC: "miguel.vadillo@intel.com" <miguel.vadillo@intel.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: R: [PATCH] media: i2c: cvs: Register subdev nodes upon binding remote
 sensor
Thread-Topic: [PATCH] media: i2c: cvs: Register subdev nodes upon binding
 remote sensor
Thread-Index: AQHdUM6zy4KzYqIh8EmqxrbA7zHptbbnBJkAgAAr3Kc=
Date: Wed, 30 Sep 2026 14:37:09 +0000
Message-ID:
 <AM0PR03MB4113BAE895A5797236332113918B2@AM0PR03MB4113.eurprd03.prod.outlook.com>
References:
 <AM0PR03MB4113B0FE1173B693F4598C7A918B2@AM0PR03MB4113.eurprd03.prod.outlook.com>
 <arz5kIUTJ4YPuFm3@kekkonen.localdomain>
In-Reply-To: <arz5kIUTJ4YPuFm3@kekkonen.localdomain>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB4113:EE_|AS8PR03MB7955:EE_
x-ms-office365-filtering-correlation-id: fdaff54c-ebc2-4d16-ab09-08df1f004ec7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|786006|23010399003|1800799024|38070700021|11063799006|56012099006|3023799007|10067099003|6133799003|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 AZI0mY1agmW//NA9OD0EyocGT0QCQX5Q2F482Jw09eXPdAlrYpMOdiYIOXG/76ARiaWxYmlayr4dyja4EEbi8QEfk+uO18GVAyoB9CqVv04ckJqjskPacQn/piWRpWsEjtiQ5p1tRykzq/SKRO5Pns+KwY4J64YuqkfW8isRNQUPJkYdLGfvcoXVlQs0YIOdqBLw1QznE462pP1mCZiYs9Q12TJojFLkfxiIrWvoYo+ST49x7bcd2RwsEYxeItnB7/RzX1j008DlhrKN9fXkamxZRDy330BHrEXrPfWxGaWM94g5dNwq7vQS0bCoeAvCZHIV8F4E6bYjZL4WymdmU4nFAvStvVHzkLDvDws8aPlk6LTzNvhFcE+lpeQ+9j9qQSoM5JeA7c2nwRmI7RqosuT/XlH+g8nMjiU1iibbehRhTs94odFfPHh9XgX7L4tBL7BYAlNRHZV355yFWwCJyTHZAoh3iCP7KjQQHhESiGWwuyZYVdx6uq8k6dOmS2U85qi83RgDYBYSLyhkzxCh3PYLB0SEnXyXj8as3rBp7UL97PJ9JPQ7topQBjvCI1uOCpeAB5Kgb3sNYNz8FZgHlF3VLe+VaZJHxouzzd6lAMnGkf4wC2C696cGjkvqnTZNSYcDlsaxrTQ1AnJIsbhdcdGyoF6a4mX3hOygFtek+MJk4u2G+hot+8NOn6xZhiDxTWJfuRQya2EJwvzdoQ4SXDIWAWVE1PljqxoLRjpt3H4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4113.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(786006)(23010399003)(1800799024)(38070700021)(11063799006)(56012099006)(3023799007)(10067099003)(6133799003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?f+fj6MAq7Mvcx74ophwofkI94qX84TrrtAfHTKZrvxgXUTgZZVqA3b++Ry?=
 =?iso-8859-1?Q?Nz1B2VEejKDy9pFfMK7Xio05oVJjyLO9lJ74OS0PCEZmwdwT0LmTwmNFvT?=
 =?iso-8859-1?Q?gOP3lZOv4yr75FDa1p7RjPeF4SVXWeUzzTmF3KoLMNDFACCUeNX8hiB2LI?=
 =?iso-8859-1?Q?JuTOzP5B/Wke/jBFktinDC9sc6PikSdib65t/hPyd5Poth3ibfyP0V8vDq?=
 =?iso-8859-1?Q?1jZ+Wyn4m5Tfh6oBwXftEAjxdJeWdEgnfHeLrcFmI1ZjcrbYWKyD+5RUaF?=
 =?iso-8859-1?Q?2NH4NVyHzyQq03hVYbk2EcTCxWsw4G7dfc1da/uHlir35rUVteB4hqcDmm?=
 =?iso-8859-1?Q?3uBJOXmjRJRk/acKkemi1bmoA0xmuVBxOvm27mX+NI7HxZo0QDijR4bo2W?=
 =?iso-8859-1?Q?KEv5OaILhbZ0K2lfdwjDudsq91Ne0Rz8m32te8nw15o0B5pG+Uxa8xp+1s?=
 =?iso-8859-1?Q?4k45z/SgvwDVyLPxc+eIb3BXXZ4b9XP7rry0QOYAN6998xDIuftklLkAr7?=
 =?iso-8859-1?Q?UXU3l6S0Xe6ZA//Uz/oCtgG8CXZjW4D0jLQIc1wv993k050ruY6ZnoGh4d?=
 =?iso-8859-1?Q?NhIhZT1wwzKUeZohPAXRqPnX04+hxqEFk7XjkDzY8+jz14cXerNsiCN/RR?=
 =?iso-8859-1?Q?Er5DS/OsNVA0bTn7tD61T9uv6y9jz7aQU/Rnu/G0nrb6Y31CgNtiYB12DI?=
 =?iso-8859-1?Q?Iba6udFtUr9QUK4HML6MePDGoQAPZq8VClKtuEHbEWkMZiK3YgV9GHUm+c?=
 =?iso-8859-1?Q?/AA0vyZndN71XS5xejLpjDZU1fAHYQHEWq9j9ArdF6uNCEDe0qEVCEnDnN?=
 =?iso-8859-1?Q?o70VDceR8qbbbKREQeDdIu42zNrjAhZl+YXCwEFtJYROe4xiqJVHqYe74T?=
 =?iso-8859-1?Q?27yEPnwQZ/b/oTaLZu7a5QIwbruwuSY91bMu9rT6AgCied0I4chxRTFH+n?=
 =?iso-8859-1?Q?NFGtsD7WFbxlBqPHGvN7HruBKLc4EORKP6kNgN4dCWrq7DVDLP7r1aiH8u?=
 =?iso-8859-1?Q?Fd1ZoOssu4Ov1JyWSEksNjhCT5rN5j3IRbjFr+JugmyanrP3GHgz09W8mO?=
 =?iso-8859-1?Q?wfzzhcONwmLQbu/E+I4Az6G+dTFSrU+33dMPJlBxm99wyjw7aiZl6eqmyx?=
 =?iso-8859-1?Q?KGccNXdsuQg8UTkD/ZyhWjl/3ebaUz0+BEGGpDWam014zfdHTlpUMX0Mcq?=
 =?iso-8859-1?Q?Sv5qBoMugI15UVNKLiVoQS3eBHMDLRNe8QwJtmUU2U4Ts7g56vAbgLlALy?=
 =?iso-8859-1?Q?JMiSVJGMmfVOup90qmWZuEA6I5pDzEXxAU8efkPeffyKhQL3Lx/N8lsDG7?=
 =?iso-8859-1?Q?Wp67Cwo16sk6A3A3HXvgKq63lCuDvngQ580GjePOZBPLV2CsMFvBHe9x46?=
 =?iso-8859-1?Q?zy+OA/FXkUrs4UHVrmNUb+V9wLi/wayuK6cgcIPl0V+zK3Ix0FLu4KQkaH?=
 =?iso-8859-1?Q?dtvcoMF1uq0r8zGIs75p8Ywk4TPjYzuqsHp+FmuIjiwYKDmWrSiNsWA4Wg?=
 =?iso-8859-1?Q?CemqJauxfGofR+7skelCD2LS/ZHoK2nsRE25RnQldO14mjwaJqIX2p+47j?=
 =?iso-8859-1?Q?K+VNNfN2iHj6SV2+Y2/8yyRFUlCwJR+u29HOYt9ZtLcBIVCx+4RqTHSbS6?=
 =?iso-8859-1?Q?NCjp51CtStH0te4agNu/YFcwO3BhU7/36l06wTHrY8xmE+qJ8g0NoiH8Td?=
 =?iso-8859-1?Q?fsw5xDptd673O+x4Gc1J+Bos43wthcioaFJOrM2rkNxJuX4iDAotwRMRwv?=
 =?iso-8859-1?Q?1FhvMHvKFBDpPi7+dWvX3TPkHeuTVQJcSrzM4A5zyTQraSVqZFnDAEGNgA?=
 =?iso-8859-1?Q?KKbR4+C8Rg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4113.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdaff54c-ebc2-4d16-ab09-08df1f004ec7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2026 14:37:09.2015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: snPmgSHw+FMDf0CEKBc3R4TYDcgy7HAiyIzMqAvNYj2SNY00fsoLxGQRiFTun9gLCZG31XKdwjRAXW2+qKuEkx6nYXPGt27WLlckXlUBGlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7955

Thanks for the pointer! =0A=
I was testing on v7.3-rc5 and missed that commit in media-committers/next. =
=0A=
I can confirm that commit 7456b40bc992 properly addresses the missing subde=
v node registration. I've tested on an XPS13 9350.=0A=
=0A=
Sorry for the noise, and thanks again for the review.=0A=
=0A=
Best regards,=0A=
Mauro=0A=
=0A=
________________________________________=0A=
Da: sakari.ailus@linux.intel.com <sakari.ailus@linux.intel.com>=0A=
Inviato: mercoled=EC 30 settembre 2026 13:59=0A=
A: Mauro Marinoni=0A=
Cc: miguel.vadillo@intel.com; mchehab@kernel.org; linux-media@vger.kernel.o=
rg; linux-kernel@vger.kernel.org=0A=
Oggetto: Re: [PATCH] media: i2c: cvs: Register subdev nodes upon binding re=
mote sensor=0A=
=0A=
Hi Mauro,=0A=
=0A=
On Wed, Sep 30, 2026 at 11:28:08AM +0000, Mauro Marinoni wrote:=0A=
> The Intel CVS driver acts as an intermediate CSI-2 bridge between=0A=
> the host receiver (e.g. IPU7 ISYS) and the downstream camera sensor.=0A=
> When the host driver initializes, its async notifier completes upon=0A=
> binding the CVS bridge and registers its initial subdev nodes.=0A=
>=0A=
> However, when the CVS bridge subsequently binds the downstream sensor=0A=
> via its own async notifier callback (cvs_csi_notify_bound), it creates=0A=
> the media pad link but omits calling v4l2_device_register_subdev_nodes().=
=0A=
> As a consequence, downstream sensors declaring the flag=0A=
> V4L2_SUBDEV_FL_HAS_DEVNODE (such as ov02c10) never have their=0A=
> /dev/v4l-subdev* character device created, preventing userspace=0A=
> frameworks like libcamera from opening the sensor.=0A=
>=0A=
> Call v4l2_device_register_subdev_nodes() in cvs_csi_notify_bound() once=
=0A=
> the media pad link is established to expose newly bound subdevices.=0A=
>=0A=
> Signed-off-by: Mauro Nino Marinoni <mauro.marinoni@santannapisa.it>=0A=
=0A=
Please post patches against the media committers tree next branch or=0A=
linux-next master. This issue has been fixed by commit=0A=
7456b40bc992a3fc34b587545716729923d507b9 .=0A=
=0A=
--=0A=
Regards,=0A=
=0A=
Sakari Ailus=0A=
