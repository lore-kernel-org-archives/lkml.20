Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020137.outbound.protection.outlook.com [52.101.84.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9033ECBC7;
	Wed, 30 Sep 2026 11:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767697; cv=fail; b=X4/5FT8LGrIWU1X7lDyb3TWiKvSjnZiyrT/KqiviQfDuZ646rz89D1Gmd1lLysbs0tr+QRS2TWT38HixfhyInrq6Nj+gDrL3eyatVprkgQFPm66oZ/HIwobLZ2gr7o98v4d/T4emct8txrymNHEJ7aCLbyJNeJRZoRyhIRSFrgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767697; c=relaxed/simple;
	bh=jZ3VmDLccpHMpalhssmyKslgSYSnZcCyuBudh0dTgNY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BJ6L3Ak+3JYQqlGbJQLQu1XBfQLMee5iU+EeQ5tiT6FfkTmtngZdscNhbgYny4mVhv7RspfhU4+AQzE18TvObrx0yz4PxgaUVhE3BCSzHqhwpyFMfWsnOcO02BP2FrgUBBlCl6bV7YB6Qm+y7ENQm2J+i2MRXJMAdDdT3913Kks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it; spf=pass smtp.mailfrom=santannapisa.it; dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b=ZkEu9nDc; arc=fail smtp.client-ip=52.101.84.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b="ZkEu9nDc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7U300mtnsNrDbMVBlZAwUcDrL6ZPH6eSOWEaN4siOtFYPwjLKYuMsNJDD2IrqioUOrEJoeoPmU2NP5eJD/2T1gQKDIuTUhpTsH2UYVTMCYm/aY+EmQ4VvQu9FFiGNzsHpzFmKGn11ALdEI1JUEGmH0u3wTospUg3yDQZT2z41x8zhl4OF0t1ro0p27paIp6UYajZhDIjv9Cr3kZDq/9U57eIjJNR1LUQW0Sc6Kn6HESe941CI1/6Z2EcfEQF5mj4QKl1B5n+Qo8TZ0ydkMBd+XaHzUB+LZEE+Xn/UldcvX6ZosZMkvSpLXg2zNhjxGuVTIruKkQAwdIB2WoMoFymA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMoMP5mMVl/wOIHleAbkCYoZx7xCxqEtNpebg0bgco0=;
 b=DqGrlKaoW5uQArfA0IW8ltwFyKPTGXFRwFR2vEe4tywKN/REaIoTZDePeMHSo23IQESLgbXNLy2L5z8G9nD6lfhPFEgHzzCgpYBZnmOUHMpdVRDbcoE3v6RJycWWroN6cEe1gAlSgDlbCBetMNVawlbjb1sS0cOTXmHUIKt66cZ4WBWfBFZK4t9gIUUveI6NfhFtEI6ymnI/MOMOg9+DB6CBDevhGXtUMrr5u3u3cm0N+uQqES60d8Zd/H7GZhBLgpsA/0bdmjz5HQa9ZVBq+dmpzCwVCkuHo2/a1QuRRjXvH2mk/QfaR1OV75SyzSFDVxRnV7yyn/KW0UTfVp+9jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMoMP5mMVl/wOIHleAbkCYoZx7xCxqEtNpebg0bgco0=;
 b=ZkEu9nDcDHs7YjIPvsJTX86dZPItNzxgbcSUFcVLpXrsbm9uV1fVZMNgU7RdvUxgX6xeX6PHYnu9IxmFtetB7hJKRDbrxY9jY4/Ya0GXQc4ZJMvSeOfTSSne5OB5NJ+y/Ui06w8lEgR3We4z4Pbj7bhKjJCVDlcUo2jkXaadduk=
Received: from AM0PR03MB4113.eurprd03.prod.outlook.com (2603:10a6:208:74::27)
 by AM9PR03MB6836.eurprd03.prod.outlook.com (2603:10a6:20b:2d8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 11:28:11 +0000
Received: from AM0PR03MB4113.eurprd03.prod.outlook.com
 ([fe80::57d1:3e47:721f:a0a0]) by AM0PR03MB4113.eurprd03.prod.outlook.com
 ([fe80::57d1:3e47:721f:a0a0%6]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 11:28:08 +0000
From: Mauro Marinoni <Mauro.Marinoni@santannapisa.it>
To: "miguel.vadillo@intel.com" <miguel.vadillo@intel.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Subject: [PATCH] media: i2c: cvs: Register subdev nodes upon binding remote
 sensor
Thread-Topic: [PATCH] media: i2c: cvs: Register subdev nodes upon binding
 remote sensor
Thread-Index: AQHdUM6zy4KzYqIh8EmqxrbA7zHptQ==
Date: Wed, 30 Sep 2026 11:28:08 +0000
Message-ID:
 <AM0PR03MB4113B0FE1173B693F4598C7A918B2@AM0PR03MB4113.eurprd03.prod.outlook.com>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB4113:EE_|AM9PR03MB6836:EE_
x-ms-office365-filtering-correlation-id: b6d114f8-4603-4793-55b0-08df1ee5e6fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|786006|18002099003|38070700021|3023799007|6133799003|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 je2oHHV3V1r5naQrA+Y52kQq/vO/hJlSALgWOgYlJAYSswvsZ5BrWjyTG03cFtxF1FGdPNU24jtYzDC2kaplyIsodWIPrx0NRr7HSjYdKZd2pn0RQYjDAe3H6YSUHg8gXnDH2rjAleGenNu3Y9ZkIToi9sDKKszUHC8spdTGVHC1Nvbr8Rw9ujZYq5W2i0ONqP2W/HxhgPqlhfP518/wEINmZ+8oUMN6OiSO0uddYC+2x+mWLvbxtwqcTUettkLGjce7nbeKsheGPdL/sUa6xgODOL4KOWScywL/eJIN2xMWA64TK9isfSnswtPVfqBpJ+uMh34qYWb2h/4o8prFDl9MD5tI6N5qHrcDYdEIzG/P7jSZ9ucWc19cZDE13/xEzY3lCkuS4RqxAr0xQvlUlPxSYPb32+rM2cX5MP2ZXtdT7m9reUqtPRtk+JbEhoA9ss1sg20bKRp3RnNMWKf3acIulIRDa/JnNt+JarndysYqSiq87vOejG5G1/jjLqkpTLVzql59H/MY5iUdAeLdOQpaDOwYoUbRHjM9vzeQ249F5QI2VLluEfaejmByd5/z6S8Xf/DEzJ7fLEvBb0bpSynyhZ1fa/DMBU51Y2aymlAvVA6v8KfIM/tKHE+9QFf7thpqa5F6eoQM0bXMNAhz2u4r2HXlJzMoJetbTT3OlnQmbKQopXx589qbvjHMd2wm8FWLTA1lmkVZTh/obI6Z0aQOEgZBWmWRVy1UdxXg2lo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4113.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(786006)(18002099003)(38070700021)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ciZd6bNj1I4ha9G8vJeYgJZQQ58vkAzVt3lspc0PwwbxoKzWmKSaHgeBzb?=
 =?iso-8859-1?Q?pe6HWDfKRjG6llm6xcABuJIWVnYoOI/TEM5RDwo6b4zpKnfRRv5AMkFIrf?=
 =?iso-8859-1?Q?lMPwA0ulK1V5rBUJtflN4QyckSH3+N2jX1oOJezgjzU8D9V6MDlqU/LcQm?=
 =?iso-8859-1?Q?ojNg8kkEaFRzN5oOToy9CkK07kzg02ZYUTWb8CS0hmTCauSD02bL/HOI4T?=
 =?iso-8859-1?Q?VBklwNNjufvre6Ef19hreLvN3eMufAWV0oxhqxx5I8TBQg5LZaz1a1egiX?=
 =?iso-8859-1?Q?/+dh3HtY8IA4AdGvDMZVDadF4j9Y7YSLSgaQ5+q1ZAyUZ3+6g349mPMXWl?=
 =?iso-8859-1?Q?CmCP+KePrncLQstCu0L55j1lTSGhncwI23WHgzGKAVC/Uhr3VJiS3iyFt7?=
 =?iso-8859-1?Q?h5lwPZukoDoRzHpIt+H5a5McsSbRAkwv3c2R6EIyL/uez904tWC3Qs97X0?=
 =?iso-8859-1?Q?RIIWCxM9Qk2rp9bQSmtZxL3lDQPzyMiK62tHGn2yp39MUFqdgcZcQuyqGX?=
 =?iso-8859-1?Q?1PJwt+l4f8DOvwL8tL4dZXPGvd9LkC6gWajuQguIA3TqSffpo9aki0cQSl?=
 =?iso-8859-1?Q?j9EL3HIJP1zGV4LvLS5282lQSu0jYyPOgVVZ9ktqtoor8QnO0rYzgo4woZ?=
 =?iso-8859-1?Q?aLtD8u/rgZ1mP9/d/HLKFpFp+lY42g7w9c334jULPdEVbkCH3IrP5s7F4V?=
 =?iso-8859-1?Q?w84th+a1SUcmNQvXVP7I+EVBXzjkdTqUnQTHJ0qYCa9+hBMXOrnE1JxKZP?=
 =?iso-8859-1?Q?EikZtVFlGGAqMytGyKUBSdiKOuSKST+tssyleQyYAh1DPaATNXR+lQ84OF?=
 =?iso-8859-1?Q?G47s6CVk11Ku6n986SJ3laGKC0JlhsMMTX6MYFBMyG46SBpaiTZWc4QZ6q?=
 =?iso-8859-1?Q?ysDqJ1x5zdc25EHjacEs7QwO3TF92sNVPpfFrhkhXgFuTOhD2uB4sMa4/Q?=
 =?iso-8859-1?Q?/2qD7emLVSGqn/lHQ37RrNiDUd1YfAJuCu2L0PozqMdLJr0zfr0Lrv7FcA?=
 =?iso-8859-1?Q?tBHQYzEEYpkwXunMrhKfyMjDMvOgeKSQqnZuIjuE4P7E+Y3QNddjxK/Oev?=
 =?iso-8859-1?Q?Ja6PvJRsJ9HsvVPBYtl/5RDSPy02UKHlAv9w0YgM86p89pBUiQdlP91x6i?=
 =?iso-8859-1?Q?BJQD9pGcX46BOa3LJQ34Qjs4uIoq7Z0CEbHIOkvsoLV3f2m+ffyCTq9xv/?=
 =?iso-8859-1?Q?0VgLnatMlIs5LxSIxNetaGAs1nbfAO7KkzH3GOk8WMtyHBuLuJWjOalhwl?=
 =?iso-8859-1?Q?m0fLpHUHI0w09Cwl/cSFPbyCB2+TWmnowL83qyxyw9UBzno974YnyTzYgc?=
 =?iso-8859-1?Q?K8TWzfUDeBc5/MyrHrk0Y2i4qnKK4lmR6bvQqnqgDmS7FRR0Fb6C9B1tKu?=
 =?iso-8859-1?Q?WpAXU133aGtb+xKq36eQsCb/P1kcw5tSmPTsdbGW1jz015nymqw9CYDkmq?=
 =?iso-8859-1?Q?J1SOSeaFj4WyB2qJmzI5IP5vla5NAg42Zlb1icb7c5W5abBoaStNtUQRrf?=
 =?iso-8859-1?Q?htFk02DbSYDaZRi8KR2s9p+o/GHLoB00Ba7nDUZ7fqTKyWvG6H2j8G87u/?=
 =?iso-8859-1?Q?efoU3xDP45yHd08JS1KHrLtmQrB9FK1xJSJAfHWqR5G7nCMxh8AFM1vVu7?=
 =?iso-8859-1?Q?82MZTVWzpOTBbdpuciPUyLiVekyJAtS6oBoAMFyU/iiWJmxZaiY3RkUD8Y?=
 =?iso-8859-1?Q?+6VQBvWSit9gIKRXj+WRFikfxmn8vJ8xtZwttNk2ExRMtTobpfjfegaWzK?=
 =?iso-8859-1?Q?rFeDKVEz28VaV7yIZZbbrqseRM0f66L1kHYZRcSe4ZmmMbxN3QCGDcU4qE?=
 =?iso-8859-1?Q?51kfh2Xxvg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d114f8-4603-4793-55b0-08df1ee5e6fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2026 11:28:08.0877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qIfIPZyLIFi+Ye2sv+BPe2p0IKIyrcX1NjBF79gFAlJqB5kfRVNrX3B8ZjYozrts7XppD8AqQiC2UgbujgecKK/kGCnk/5W5D9Ndf2iBANo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6836

The Intel CVS driver acts as an intermediate CSI-2 bridge between=0A=
the host receiver (e.g. IPU7 ISYS) and the downstream camera sensor.=0A=
When the host driver initializes, its async notifier completes upon=0A=
binding the CVS bridge and registers its initial subdev nodes.=0A=
=0A=
However, when the CVS bridge subsequently binds the downstream sensor=0A=
via its own async notifier callback (cvs_csi_notify_bound), it creates=0A=
the media pad link but omits calling v4l2_device_register_subdev_nodes().=
=0A=
As a consequence, downstream sensors declaring the flag=0A=
V4L2_SUBDEV_FL_HAS_DEVNODE (such as ov02c10) never have their=0A=
/dev/v4l-subdev* character device created, preventing userspace=0A=
frameworks like libcamera from opening the sensor.=0A=
=0A=
Call v4l2_device_register_subdev_nodes() in cvs_csi_notify_bound() once=0A=
the media pad link is established to expose newly bound subdevices.=0A=
=0A=
Signed-off-by: Mauro Nino Marinoni <mauro.marinoni@santannapisa.it>=0A=
---=0A=
 drivers/media/i2c/cvs/v4l2.c | 15 ++++++++++++---=0A=
 1 file changed, 12 insertions(+), 3 deletions(-)=0A=
=0A=
diff --git a/drivers/media/i2c/cvs/v4l2.c b/drivers/media/i2c/cvs/v4l2.c=0A=
index 9fadca7a3bee..6ac4ad6d871c 100644=0A=
--- a/drivers/media/i2c/cvs/v4l2.c=0A=
+++ b/drivers/media/i2c/cvs/v4l2.c=0A=
@@ -13,6 +13,7 @@=0A=
 #include <media/v4l2-async.h>=0A=
 #include <media/v4l2-common.h>=0A=
 #include <media/v4l2-ctrls.h>=0A=
+#include <media/v4l2-device.h>=0A=
 #include <media/v4l2-event.h>=0A=
 #include <media/v4l2-fwnode.h>=0A=
 #include <media/v4l2-mc.h>=0A=
@@ -401,6 +402,7 @@ static int cvs_csi_notify_bound(struct v4l2_async_notif=
ier *notifier,=0A=
 {=0A=
         struct icvs *ctx =3D notifier_to_csi(notifier);=0A=
         int pad;=0A=
+       int ret;=0A=
 =0A=
         pad =3D media_entity_get_fwnode_pad(&sd->entity, asc->match.fwnode=
,=0A=
                                           MEDIA_PAD_FL_SOURCE);=0A=
@@ -409,9 +411,16 @@ static int cvs_csi_notify_bound(struct v4l2_async_noti=
fier *notifier,=0A=
 =0A=
         ctx->remote =3D &sd->entity.pads[pad];=0A=
 =0A=
-       return media_create_pad_link(&sd->entity, pad, &ctx->subdev.entity,=
=0A=
-                                    ICVS_CSI_PAD_SINK, MEDIA_LNK_FL_ENABLE=
D |=0A=
-                                    MEDIA_LNK_FL_IMMUTABLE);=0A=
+       ret =3D media_create_pad_link(&sd->entity, pad, &ctx->subdev.entity=
,=0A=
+                                   ICVS_CSI_PAD_SINK, MEDIA_LNK_FL_ENABLED=
 |=0A=
+                                   MEDIA_LNK_FL_IMMUTABLE);=0A=
+       if (ret)=0A=
+               return ret;=0A=
+=0A=
+       if (ctx->subdev.v4l2_dev)=0A=
+               return v4l2_device_register_subdev_nodes(ctx->subdev.v4l2_d=
ev);=0A=
+=0A=
+       return 0;=0A=
 }=0A=
 =0A=
 /**=0A=
--=0A=
2.53.0=0A=
