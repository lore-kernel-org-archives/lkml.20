Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.95
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792590617;
	b=40I3W1QJUBSMJobqMvRSYg+BDt4HyQl3h3Ypx7hd2qm3wUVoIompwG36IX6ghxux0bKa
	 682Yvtzq3t6xH67VL+OkBg0aVkQIYhGXuupGDhgVj4nkK+AawG3WW8PbYAc5qH4DaYdqQ
	 KLosQQmjBUhQtI56CMEatAlW+2IQsq8Zf+rCsZp8AE4of1lWCqLoFHJmmyGdgcrAb/B2N
	 riIe0kpa7s2SFu7G3Oy2crTo1YEnbA06GMd2UfEjY7amOn7Ld+W5PM9ihBJK3NNMoxWwJ
	 kZKBn4S+iaNNt/p25e0KzbDe7kRtAj30/y/fyHlP7ROoQY526WFh/m5P0BKE1MyeAIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590617;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=5VLb85Zp+0SvZAEfBkvRfWsgYSdgnnGuOmsQuh5eAmg=;
	b=ISUFXDnSEl+dwLc0yh8OYUPG+AG0dHx3SQVN00Shc1HHjvDKFgnMD3RMo0PBt1R7ZdKP
	 ovJkbwBrVgfOU7SoP75vbBDFGC91IAsdaX4yPqe9fZGeefOgCsXbKh7SCi7JVk8ykKa78
	 slTqmHP5WbeXUzHaKCfhDz4hcgFMTonMMuUhsdyu7CwC4sxalzdDPDQu1U9cC2X4DBBZX
	 QWPLnUsG1CdqOefHrwW2h8+96/C0Kp+jb3owclLi+KpW2C03nedArnXGAtTa8yo45DE27
	 asytV8AW2a5oZ9dUw88XaHwhU7LkPBlatHk+kvRnevdjEoyAs+k8WYIh5m4LeAwRwKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=ebytelogic.com;
	spf=pass smtp.mailfrom=ebytelogic.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.95
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021095.outbound.protection.outlook.com [40.107.57.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F09A606A322;
	Wed, 21 Oct 2026 13:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F09A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/Ko+fmKWSv34qPLTazr1B21B3dDw6yfu3ev35pgXVRjeXsBaILy0Ojcx2bwnlbUbNrcut9M8rDaU7mpr1TqApGvj+FXqKFJVhUTPn5eomqPg2yGmXu7VAmBMblMjVBKiRHSi4wwW7KCSVQSrd4s0ttT52FNXXx19YdW6inrmjggYRPIzk0RtXO9e+zrug+QGEi2F2MMjnx/WR8nJb90XoDz4Mz0g/jKLWQQdjn+nSMvK8B4bAXJCr7ZBafR7j/ZdRX6nsRFROZRrb+P83cCUWCizVNDjNMnDpoLQ8rRxz1fQvdQY8KDqZ6A22LNiuuu3YFC48Ksa6UlUQ/zDPP70Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VLb85Zp+0SvZAEfBkvRfWsgYSdgnnGuOmsQuh5eAmg=;
 b=RplQ+fJEt05VHcxyPu5/CCuNXlsBwdQ7hvnKlf6g/GlS7w8JFI0qugbza/yBu/O+YmBG92iiEGV7NJnLA9n0fGy7u9nfhcDu+/mr2BNyXRu4Vo0BpQaUTwAyfzKR0vduHDwDQrCjqfmEJ5wcxi7hbF//0uvATWojMCr0C65zMhtGiHbOC8PUS6z6Kgf/N7yZads+eo7dCZzo5vUSNptTXAtmIgFF7u+j8q5UUuMn2XFhCJSkou3kq2TNCEz99A0bIjtKBd0SThn0y8+vqX5zAP15VW1RTkBOy6NwFfLDwz62fPMCQgLrKktc9koBBZ1otyYkS/PI1bYZw4f6gNBfzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MA5P287MB4699.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:196::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.20; Wed, 21 Oct
 2026 13:50:14 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::4cf2:bb74:999f:d6b8]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::4cf2:bb74:999f:d6b8%8]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 13:50:14 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v6 1/4] media: qcom: camss: csid: Match the current set_fmt pad op signature
Date: Wed, 21 Oct 2026 19:19:56 +0530
Message-ID: <20261021134959.2599575-2-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021134959.2599575-1-hitesh@ebytelogic.com>
References: <20261021134959.2599575-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::21) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MA5P287MB4699:EE_
X-MS-Office365-Filtering-Correlation-Id: 8062a2e4-88c9-4209-d8d1-08df2f7a3b5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|10070799003|52116014|376014|56012099006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NmcYhL6S9wu5fU5OeIml4Lx0jxDOA9G9tmoLpadCKyDMm5LvagAXKShqJHfuaFTsvOtb0lvjdJkDDTul2mEMQd7KgESHjsOzBD/0iydd77PrcSqjEuGdZRQH8trW45oKH8OUhs7yZtdlSkzz75NiM61jgCMcqpdXYMRFZYosy0UM8VpZcqHWwMtRsbpfRvjutlO2HuclyWJSvtVdRz6zgeAaGmFZfivgWcCwrY9C3exVc7QOBLU/p+Y2JjNPpGoZ8HHpewv0MXtlMkEEajfXllZiUOoj/9XFtZ9s9zQfccFLXc+6ksGkOaG8c9oP0T6MQY1NGqvO2BVmOzD4iKCzZ6hs50DmbkH1EvzzzxnjYziqcM8frbz8Lz00nclWw5EiL+xupJ63G2vG5cAfTJeMxTHQ/Z9JTNlIemqsA9z0cxgVZodCoZYOFAWpGOoVs/osI1BDWgnTs7s/8xe3D0/tNZhg6XJH/HQmutWNsYVOnfersEqd7o5004ac3gYvoH6fPYP0WNGmEBgmbBO/jh00upaWUMiPXApyD9kky8Gpi2/nNBieXW/OSHjRXMi1q3cXk8P+gTm6ZCSJjVZ1JoyRGP3bE6etvrvKsSYjE6R1DY5Jq3SZC+MYDwcwy0ZCAmZHTQUdYX7hiwry+/LPtekSQ829wAHeEu/OPNsap7VKP/M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(10070799003)(52116014)(376014)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zlSZXE3pF/xd9KvO86NAD/Vl9TPTn3bZZk0J7UIngEgPaQo36PsBKtfTnHR+?=
 =?us-ascii?Q?JAAuCgNOxmyiDHli87mVb4JNus7txWHK1x1pDXY34Q6rQOMUnMgwePYbgppK?=
 =?us-ascii?Q?NcPnv8xHnvrC8KSFXaFhZyiI1ZrIKpGl8oCpWGSvXRdoPppWhI5xQxsOpMma?=
 =?us-ascii?Q?EB7MPde+yEAF6+QVJparoqsNUfxY661Li6spbiJ8v4zvkCy7B1/RE+36wpkJ?=
 =?us-ascii?Q?qT7GYHjuSwrWDUY8hi5SNuUq9mp08xkIRbWLqoloQ9dsxNku50Y8DZbgnxsq?=
 =?us-ascii?Q?UsFcNnjOoUzWCO8gPAL21kM91SomgauIKOkTDsnOxOoq5yEw6FFvssOcraA3?=
 =?us-ascii?Q?zEbx14U32waIDcjK1GZ5adFreMTCLUBriNNcoC8mZI86szKoI7GseAxs2aUp?=
 =?us-ascii?Q?vF4DxCzbUAi3TIaE28lVVU30fn7jCFLDVyNhAi9DqzHSrLO3j3ucZVCibM34?=
 =?us-ascii?Q?SiWKokHrh5R7SeFGnZ2+XtAUAWYxZ4WxHepYrq/Rf5oboCcEXxOyyl78qLaY?=
 =?us-ascii?Q?Up//tXKqBEZskUmm5QqeUTf+5DOABAGAcBB74PCrEjGnZuUc4/siHMmkbrEW?=
 =?us-ascii?Q?FyrIS8c235g3e4fljXTADzk4MPDGoO/cyKis3RC/I7r4XFBSXibn7m6yEvkb?=
 =?us-ascii?Q?hEF+CH27RwzKLjlLsDidVMisd0zUUYUCE2JdHJSqqDV8FD+/9C5gXzNoeG3U?=
 =?us-ascii?Q?vZWkTlb1ZTWdgkupd3RqOZtra+GO5NcC+CGMCWPD/ZKqO0zZ6UrPkwGKqBO3?=
 =?us-ascii?Q?nlW+lpnB9DZp8XWCIQHkGbF3kL6fYgHzw8CF6U7O3cGMSlfedqWetN9WZ1TO?=
 =?us-ascii?Q?x/KA61zOdaEmskUvOYKw002FPgdwU54jzJaKxuqy+Obt1nlOJ+BhRqngI/6x?=
 =?us-ascii?Q?h4I9AFLNyL81RU47zwWQKqbFqM+bmmYL2pBeMF1QrU3qQHU5XAlqL64uObN2?=
 =?us-ascii?Q?ySnoQ3eL2QsTeoVGpzwt/7DPy4yb3rxLXaLTZxQabkslHDcu/qRLC0Ab0ymP?=
 =?us-ascii?Q?uNveeXhtZN/cYEw4RmYmj3Pxcilc67LGYXwMg2Ey9xIyi55k9gHEYYPGy15g?=
 =?us-ascii?Q?7RuINuJecfLotO5ev9Vrc/2KLhVQlgauRHmS5xAkGYHpEKyACOlg4H/XyoUp?=
 =?us-ascii?Q?cHi4dNQJEtkbE/nyGihYV3viXWf1zex1RVtoCcCz0Hh/pz6HlL/LkMIEb0b4?=
 =?us-ascii?Q?fYGDg7jlqR8yK1mPHplF9z8gaLVy17L90hkvr0x2lnL7FPHeSJevkgs5Gqow?=
 =?us-ascii?Q?9lPvtK3TJ5gDI0l5vOYeWb4AGxXYWI5tKp87h77DEPofytA9s9gJ7j8VAITB?=
 =?us-ascii?Q?HMoJevGIs07Cx7oQXgQluUOl2JuXvnhAK6lgya+IwWXAwHCb3V551kc0GIRF?=
 =?us-ascii?Q?DXXjrk4g3Uc1bm6qTuexClgAKZK1FKzQUaoE8LPRYR3EdchgjIyKoE3Lm0Pn?=
 =?us-ascii?Q?GZD4wHp0qxQC/AEZQoiW7l/xdyCd94HUyX7YWjz80awgeZg3RXJU4PFK3rBA?=
 =?us-ascii?Q?YwXMYHmszLl43KuqY2Vk1q0ew0LNqoXBQ1dT+OvQj/1Z2SRaZAMp0BALC7R/?=
 =?us-ascii?Q?er7f4WnA35+fpUGPaBUX0AbcJmD2ti9PrqhQLFmsl8IjdrjONXYVbM6z+Oh5?=
 =?us-ascii?Q?IH8yB1T8sFQA34fg+DnWTsOjLAXcUVl/XN5o1nk5U78AV3Zd6f6T+w+NqGtd?=
 =?us-ascii?Q?PRv8IbMCZdmVJ53ZYcmPelb/CPPBNXlrk7cPcpRbKubM/vP2dL6SPedQy9hG?=
 =?us-ascii?Q?4AtHdUd0Ca8fyl85GZEiPOFtO1zk0Bezjyl0X6iOcIJ89Gld1aO9nlUQcd4L?=
X-MS-Exchange-AntiSpam-MessageData-1: g+b6RDAvX8paKg==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8062a2e4-88c9-4209-d8d1-08df2f7a3b5b
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 13:50:14.0516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: am+Vskz8ANMFBVnwPDzOKJBZNrNYKiv4Dww4Wr5vBST40dnAlnBu2+kjsAER5u9x29V/Xlxk9HLtihQMR9m+Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4699

v4l2_subdev_pad_ops::set_fmt gained a
const struct v4l2_subdev_client_info * parameter, so
csid_streams_set_format() no longer matches the op it is assigned to
and the driver fails to build with -Werror=incompatible-pointer-types.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 2559ebe9839b..991275398091 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1696,6 +1696,7 @@ static int csid_streams_get_format(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int csid_streams_set_format(struct v4l2_subdev *sd,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *fmt)
 {
-- 
2.43.0

