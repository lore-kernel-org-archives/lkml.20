Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020129.outbound.protection.outlook.com [52.101.84.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62912D0292;
	Wed, 30 Sep 2026 11:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767188; cv=fail; b=TEXwdMTirmTcpeUrCVKBfBGWxLAogiwP2SV6k6qu9wj8N7g0kIxFxVRLe1VpMvBaMZ3xiAHAMAPNEy0wWiFdW+Q6dXfblwPrWbLBF41T1QyeazRXKsu545M0zlU7zCRec3PqP/DGCKBdzRVb2knVYAwvBpTUSJN16dQaDGBbuvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767188; c=relaxed/simple;
	bh=YqkqPT6gmhPrALc8V9VWTPyHXoOTqAmfm0V41dxPQsA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rxuVby5IK0k7jvddb6CS4U5s/M4IYu4++N67eQxQvP1HaehKbQoT/GoR+vYLJttffyFORRV4+lCeMIiCyfEzvKvdcWk8EzQRAh0HjXdR+66VAHKCgB0qtDdUqNLsyZu1EnkxQvLVAJF1y1FbwgLdgtvC0EpuPF5vkyPjbZ81opY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it; spf=pass smtp.mailfrom=santannapisa.it; dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b=wl/KgCXG; arc=fail smtp.client-ip=52.101.84.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b="wl/KgCXG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y/e81besAJEr4Fl8vGOq7sENerrPOAf+tT3W+f0TyyKHKwrZHJZtO6/8k2N0xhDyXyG7ZjzAjdqJEULjZchtyLQt+2oJkOUvCR57u8y7zZbLMp4OP1iIBhxjey+Eev4xJTjUN9WlSSCoHKIJC115lk0x6D0XfgClRVxNEL31UL5EKvWM0vMjMKXNeXcdSvIAFsrAI6d54oaOxhYer89jG0FeLlEg6EjNza7PU4StCqxNNDQD3JtasWzcSHzQqziPwfy+ehh4STfVPoyG2vkjbaGjojHEcaEzEnXnIXR6v34lUpJ0nm2H3gDHeSImSH/nrqieYT66OOSSnhu1RC2UHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EP7YSG+7EfzzOSdz3SLUOdxfXWgC5POwlbnb9HKkeos=;
 b=JvMYIo4c5wmy5RkSPEmbtFN2FO1mH4ZKMqmuyo1L4v7SPqlNpbxQEhTqCfd9OI8/rXztNKt7xrcp+2s1gzRviLdmXJWibaix3S0fOqe7I+PmDNnI3IHj78FyqPo57JM/jEAZUV9z1WfsZfNQAGmJGqxMmHhG+IrIj08f+5oLbMZE5BzaU91ozpBfzxxpMz45MTOC+njk8vKvGNxYFFHlf4OlbKjI74SYS1td8vfej1ZhErVqWzlS10PfUKELZLb2KD5DueoSFHF5FBCQBOJIzj24T3JlOQBR7JPsbRnzv4p228A6joZaILW+2elOb912leu7S/WlPAiylni0Y5tI7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EP7YSG+7EfzzOSdz3SLUOdxfXWgC5POwlbnb9HKkeos=;
 b=wl/KgCXG8j2WGMBbMyZZ/OM3l2L+YoEF9L6hluwcZo0Ed9ubAW4vh4Vot5O1FrbCSzc5F4Udb6Mot/NTmdEOZkoCORGryJIZoy9S14h0G002eK7+qVOXcPRp4Zj2B/ALOwadNBLQee6xln/LhhXgdbJ5OQaGnupu9TYAovRj46Q=
Received: from AM0PR03MB4113.eurprd03.prod.outlook.com (2603:10a6:208:74::27)
 by AMBPR03MB11494.eurprd03.prod.outlook.com (2603:10a6:20b:733::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 11:19:40 +0000
Received: from AM0PR03MB4113.eurprd03.prod.outlook.com
 ([fe80::57d1:3e47:721f:a0a0]) by AM0PR03MB4113.eurprd03.prod.outlook.com
 ([fe80::57d1:3e47:721f:a0a0%6]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 11:19:40 +0000
From: Mauro Marinoni <Mauro.Marinoni@santannapisa.it>
To: Miguel Vadillo <miguel.vadillo@intel.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Subject: [PATCH] media: i2c: cvs: Register subdev nodes upon binding remote
 sensor
Thread-Topic: [PATCH] media: i2c: cvs: Register subdev nodes upon binding
 remote sensor
Thread-Index: AQHdUM1nmRnvfDJuw0aAAGWiw0p6gQ==
Date: Wed, 30 Sep 2026 11:19:40 +0000
Message-ID:
 <AM0PR03MB41134A56B8F1697407D08D54918B2@AM0PR03MB4113.eurprd03.prod.outlook.com>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB4113:EE_|AMBPR03MB11494:EE_
x-ms-office365-filtering-correlation-id: 71e8d07a-670f-4f28-9757-08df1ee4b88d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|786006|1800799024|376014|366016|10067099003|11063799006|56012099006|6133799003|3023799007|18002099003|38070700021;
x-microsoft-antispam-message-info:
 1P6sAjSoWqajZGDy2U0+nII5bLEbqYIGXPAgPRDZG5H/rpAUkRvNvfqS9w/ntz8OUMz0Yq8IuwoApP3c7M/fEeHf6wdiRN4vJ5dcjNz5XguF1Ic9+jp05dhcvvcIp2pNXx2vWnAgG86gHHYDmnexFOEERRvjylOLn8Hj8eUywhJxQDSEM86fVHJ4yJGkyTQnnsoPPoLpjdwWNGiz+ITjDyRmZPBNKlnZxVs4YzEXZVBfRWVD1dzWjYJhFZGwHBhphwtLikXBH35WE94h05rC7qDK3/9tCcNVscYTCkNB5mGBF9a2rb+jeQ4qKFKkRl/2/S4iVWOWij2zZceUM+GbI5FdM/L8ggWJUCgKvXP8c5S0fpvRvdYliRtu2QN4lOfTgVUeBiSZtKH6bZWgmlnEjDsimnXtNkm5ABGaBj4gs7zrEXwq1UaGbNQnYQHA6XtB9uNd13N4x+yVePrlOsBOAmLLyT6E1fCogontZFnycz288NvjElWuoCDU9P980F9U+xH53LYArNn6yOYMTHhGONLSy3jrfIyfDbbbngFyude763KPgu3OUwlydJ5m6H9KJGf6vdGu2B363aDyC0cSOaULw6fhDt/aHyzfWRP64b6WWmKkyw/vVra91WzZNwrL7xYa5WU9qxcz33y2sgbo7y8wIql4v249/I/Ljwl12ctZ2Z+DVqV6BPDVqAD87kBNfjyGsetayYsBLJMcYMWFPkCgGU4mlPC8FA3gH2ej8JY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4113.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(786006)(1800799024)(376014)(366016)(10067099003)(11063799006)(56012099006)(6133799003)(3023799007)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+bz7X0h9ETZ/OsCBB6QXLan95tvF4LdOHzIfKSCZ/hY2lFvQ1cuGQC+On8?=
 =?iso-8859-1?Q?YwMSgjrkc5b4RryQi/K9O4nNDsP32BhR68D/2vVair6b7pWH1voRm2bPhl?=
 =?iso-8859-1?Q?jkWDnRiK0zziLA/zGBmPIO34mC7CvM60Ta3awUB4Tq0CmyBrfYtIbQXhng?=
 =?iso-8859-1?Q?mhVaNKhUaYdP3HJYsO5wKYUX97hg8CK6HBfFukqmjcjIYGvlm1hndzCNmh?=
 =?iso-8859-1?Q?2EhkrRCkPTYjy2Vl43Izs2qvdKeTFV/VfYiSbreaVi9TkIeq06qgvAt4k3?=
 =?iso-8859-1?Q?1fBec5L2r4B5pz4rfTWNCbHsWx43P5eXhyqyaP7kNzC7BDRwdDaLeofT5C?=
 =?iso-8859-1?Q?s+iuPoToRiE0Bq+CBtRSSYTjkOhH9u8177x4nb/BkukpLUIKXW2lTNohr4?=
 =?iso-8859-1?Q?iJxcKdcNynLptO6qGoxNSQ7l1fSy79bBMrRFpBXftW3NQS3BRggu0em5JC?=
 =?iso-8859-1?Q?51l1AJ6m6OcySPedaED9Df3ksZQFuppSgfPinfAq5v88k2lfAbDncUnyzV?=
 =?iso-8859-1?Q?4CIYkUzKL+pOBUPDWo2D8itltXf9f2FLHDGUn4M/yQJjj5iVo3YUXKYxXf?=
 =?iso-8859-1?Q?xvqglnr4+z5U1MrqtL0q+6UBWmR3gU8gN880DaQyt/dsIZQQUijimyu/Hn?=
 =?iso-8859-1?Q?RMB8RmG/3BUDRM0W2yDswm3/LF2awzFwrhI1B7lKOTFOis/WD36Nwixi0J?=
 =?iso-8859-1?Q?fpuoON1fZsVgBhDllCbIcBDsUByO5Ns9eCV9w2vXADJrGUzQcW27uQSj9b?=
 =?iso-8859-1?Q?h/CoLNwMzCFv41xvvNbq9foNdieSmJI+Q9EitMSEcCnbT8udWUnKNRnZrg?=
 =?iso-8859-1?Q?HZQ+XKBtmO62e4ukjSz6TpNlhBdwJUnn8vtTBOhsofEPWKerLZG/RBzc2M?=
 =?iso-8859-1?Q?6M38gWYBuvJ+pIy/ZiRnSwnu6Ch7BYw93SPwcEOPzL1LKK2VVtOnYQvZDF?=
 =?iso-8859-1?Q?cJBosn/pou3Rdaj7f3jUG9YDXw9sQBDTOn6rI6l8/Q7B6uczfoxhjQi+sD?=
 =?iso-8859-1?Q?xR6HycseEyghH50aFT3F04wKPFvMIWLlKhPZp8H6mHzcn2JNCF3norJtHD?=
 =?iso-8859-1?Q?l/i4ojDJd+u8WvCCQZ19H4d4f1MvLyzYCb6dAniOtNn2KXqoIwN6f8mARb?=
 =?iso-8859-1?Q?RIJ1IWgzfrRad9gFhlRQq2RgkNyER0jm0BFHV2NMz9w0+clDV+ZGkezWMJ?=
 =?iso-8859-1?Q?v1Y5LNVZkJc4MEY5m1nLNTcd0yELoesIwpkNc4YQflfzZdIreAEREcV+fB?=
 =?iso-8859-1?Q?t5HR1CQXLQySsQdpivIOlVwpwqFoBsSGc41Dpm6M0+SSQlISka3y+ygmxA?=
 =?iso-8859-1?Q?reBkzH2lm5d1GAqPtiXEwLFSleaj3CNLfrE6nKfUBq1lzlm43IPC/qD6Di?=
 =?iso-8859-1?Q?jNG/41+SR/akJo/Rl8NZxmsYuk57SjgSZCJljCvZEksaVfktI90ldX49RM?=
 =?iso-8859-1?Q?j1VECH7UCAzekcTEPLQr9Amcu1usO2QHmYmhgIh9l/ysHU+ZuJDP+l1SVD?=
 =?iso-8859-1?Q?Iy2sL7XgsoffnRYeZsT23I0kbqlam1S6k3xyCF8/KImETq8BtGSVEx0oCP?=
 =?iso-8859-1?Q?PtvZI82Rhsfx4N1b7wFd2eR8ORK9k1GcHMho3Obpv7PCz6fauQNBTDY+KN?=
 =?iso-8859-1?Q?C45Tuh1E7BICyMol6KHeXeIwuAuzEGzZjj6ep69qwsRsSEe874++N49kTf?=
 =?iso-8859-1?Q?Hiw3wGCSFmHUllQkJbmW7wlLHmibq67P4Lfne98+bJrOUOW/jKqQv5Geji?=
 =?iso-8859-1?Q?sHPU1FD4qvRNlLOQ+EEC+HHE1zHCuxKW6SKO81PwZZ+MjA0uguQHoZq3uU?=
 =?iso-8859-1?Q?xskt6XmqzQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e8d07a-670f-4f28-9757-08df1ee4b88d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2026 11:19:40.7322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S6WBtgqBACBtuSMQCQjcrMwaNnwO1drIHBE1iJfEHhjav/nYQnFImm855stt6D9QVRMfKrVRwdwLNYoBUZ2eOlGSe+btSqjqLZWgPvYltnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR03MB11494

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
2.53.0=
