Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.79
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793356476;
	b=s7V7WSQ8wnKuqkhWPX1PGOz9em1W6VwKuAYFloNvtXhEaLxbH78BFKv8/OGEVdZSLrUU
	 oStY03/OvQkxSZoP/S2LgPQqyRnJreSBj2BRGdAPVd0JGLP/xWfdyYu3kyN1I+kBm7WPz
	 TmzaflcFoQNpVGHpUdmMwezlPpvW1kYQl4vKHYSS1dKABqD4WpJXpMgrOX+PRB6mFbtU1
	 2nQ+IfMvT93uXQ51OcMIMvdHqFWyqYBjDtO/5SgDmgOAa4tp5iRdfWlcM5pIByhGQKMcy
	 CzeQmlaEYNDsVfT/ySC2DFruzSI1EbtNQSS41qwK/fjL9dwUiWcTlha8I1T7YIBJULA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356476;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=UBZ55AVg375ubyuavUBAY3z9O1elTHlf0FlR8u3qRG8=;
	b=dXO811FQZ5tSqt9EmzSf8SA3pft/T+ssMd8dIDCz3fhfrvl/qaN/khDTXqnfShcOTTrp
	 aFiXrsBjAE23jL7oyWWdPZpjj+8av+E0bt8GZds9RNr+nQ+LrcDt2SngWEsbvpVzBkobF
	 kSy/AJVxWltyxQIClwlwYn/7Rbz5LQJZyTHfwjFVAgjo2SgjnCK1GVyVa4+gOekC0A4LD
	 ubGRjjKSduHU9xu6tay8IDQXKhdNphKI+rH3ZSh9TFvaRj6NJ1YJpbhyjns9nSnhEMxis
	 P61ibqAB8ior+fShkFED01mIf/AMZRUuHa+7hIdTN/QYFJzjrkOBRkLt8yxHz7Cla9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=DQh2kEVC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.79
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020079.outbound.protection.outlook.com [52.101.225.79])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BD860A5BE0;
	Fri, 30 Oct 2026 10:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7BD860A5BE0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=DQh2kEVC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQPC1jCh5nF9q0MNDa4daO1zcEJP1LtCDd8XZmrRDWmSt/LcqDNZHTuL1D2DnLUU3MWAflQe5K3SkcaXXLAYJ5UkJQjEPpTQMlJtXdQSfOH9rg3Thci5Spsgi1W0APUreTolTzwI2YsNlhJVTfo7GWZYJ9/5yKff9AhFYcuPFTVXMoyAcYW1RR0FmlO7ISVRpaeigxdfnDzbo8feHrlRUhXGMtTsg4TFjBfpDu/8QQMdZjZBe3V2fekCQ2PG0ocZfpgjsqhw9ZHqiZ4jJvX+a5AkMPLFGkJfARTS8H5zgkkx7xO4j5dIaqgGUnBsCuM39v4owlKTL9uAd47ZbyAChw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBZ55AVg375ubyuavUBAY3z9O1elTHlf0FlR8u3qRG8=;
 b=yYRDkApJUczbiG2VhX1gq+efZkOXJK/ODfIAB8kCS40ZufzjP9R8mqVcGg3h+mRfYV3r1QywY9GqEA21qvlNFyMsuXl0KjpfVfA8na0lSY09ejPQIPtGTtAGRB0MpxWXiGEdKpFaWwaCI4ZiEBM0+IpqzozCbMMlJVtIzF4b5fU10Zc9hx59z8CeOUV1REnFK0y3J6Rg4rEV63CwLVdMQAkZgzJKniOq2WEDBKrYp8tB9bJbmGe67l8GHVC9nOg7p7lOSdXFL0PiymAjUsdFr8sTb1JFEm5OmDFctACjVfd7Nm3tYMO0BwKg4gbWHR3ghoEzdlhKOWGPZZhbNu2xRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBZ55AVg375ubyuavUBAY3z9O1elTHlf0FlR8u3qRG8=;
 b=DQh2kEVCBZqSXZPwB+8yBDlYrIgEASFusLJ5rmLQafYY3yhlyrosNm24xJWVBVYD06TC1WZXkqg0Qx1FOWLvMhFiZmvVGgsKsF+XMBpKLMzDqaBTZsKH2oMmAZYPWcqFy+p1eLfJfj6/fsKiox7yPPvPStDMyEfbXymkbpUXRZFT7Vq+MaKNc+CZ+EqfYa4InL0aK8gl58aOjM5xYZjCqTmDHWWBmOtKTRcUXJbSQflvcY3agl2Lg43ozgf9A2t0eCaici9b+sbzFrNKAniJNKmXr/koPscdKLpVGLpF6w1BbtJl76cEbkF7TTHrMVr7nDoVdANsmwfG4ESNIzdLMw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB1404.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 10:34:31 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:34:31 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 10/15] media: i2c: os05b10: Add test pattern options
Date: Fri, 30 Oct 2026 16:03:42 +0530
Message-Id: <20261030103348.1222201-11-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030103348.1222201-1-tarang.raval@siliconsignals.io>
References: <20261030103348.1222201-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::32) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|MA0P287MB1404:EE_
X-MS-Office365-Filtering-Correlation-Id: dcffd213-781e-40c6-87cc-08df367161d9
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|38350700014|56012099006|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 L62bWzMRJuqHIz119Le/46BjygWIlbFly9+CcleDF36ALZ9cV7rBAL/4tOBesSJv1uHBjFiSKainCm5o634dqB5hHLG9oTZ/24J9ZMO6gLVkAd5o6FTOQNPRBpTYiMoeaxVtUG0onJCBJFP5/TprTYruja/DjjnXV5qzXA8NnAooR/Hy7jZkoAXztJKafHC+TtJ0BIqdjf5oF+/yQ1VpWhxGIu2a98oyh6HNCqvpZX+/uFQ2dml5lpqEYSbHsxt60tygi1vcwp1YtjhObZRqJPTsaos8F70gmzBmZ57UGWJ0C6UcxtF2/P/lvhxQ97pzs87OyUVCvvnADSRdNkaadr6sgz/9+Vqh7GQogjqLz5HJRzv1gFgFWSdlnT0D5wthTBG/eOU+IWp2auSWkxSgGPSb0p4i6OHzA4A9Xe5pr7OYxA4g85wD3/jFDDzAPzCoLDxTBKCLGoEfIfEMOfo6F+n5cYrDMCl3ZYA7SSOmeL7CYGN95qDFVo6J96G9bB4NrpBVR1AZVrK8ffiTZb2SJWskYhWMKK58EDhv/vfTrdIKasvHGVLt6j3zx3wbsnvNWu1NFoiLu7pXNlDXPCyMuhzVY9OIR/IYf/LxIUMfYcsnZnT6CnPlLI1SsHiW4QYtbYKF4+t3JoQocI9+hzjOHsV2PLr8NLaPVpkVemJnRivJ1ucKH7EsWP0X/gKpNzOvs8LgeSi0z2GIsG/5fYYfbj1ha9ufNHFukiCQuJK5HAI=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(38350700014)(56012099006)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?3FqlUnsJebZrAD6TLwE8eUK/Sx7+2KAmTgT/4Auh65HI1v95WGOaKRvJaiey?=
 =?us-ascii?Q?Ap1XruxSZ+h7AWSr/7EqMGqrZ2op8NaBVP0SIBSwV6keLFpfnbgmlZ/cSyp0?=
 =?us-ascii?Q?yiIaH5Xe2WjldMwmdxjilzs4k5Iu15KZvE7O3j/aJsN+GFQmXJc1BFqOpBUX?=
 =?us-ascii?Q?IFHuu09unQj1ty6u+6VK6TjK0uZjFRQh2Q3jywp6ZKO/QGJ/LlYC0Y9WbuAc?=
 =?us-ascii?Q?F052Zd7utzYzhgpGB3t2fQhgFCIhZLsXcD/TaPsjCn7QOBBzQ0ncvrACYMMN?=
 =?us-ascii?Q?XUPBRsle3V25vTT3OLszbvjRKrLGI5olm+iFpeOS2v+inu5+6FOD8irR292o?=
 =?us-ascii?Q?7lg25Z9e9xbCt0m/ZYlXS9ioJNUWLlo5+FohzlR67ZmrdX0a6czo/SaWX5tp?=
 =?us-ascii?Q?nhfO6dgxHHBluRF4yVdBoX0XNaYlBDyPQZknsvKK9c0jFYCFn+EBegq0FZf7?=
 =?us-ascii?Q?J5s0w3fGZJLgY+IQmVQPYrzAa9JOa2HxWi6bVztiM2h+qcInCqO/ksVlE8Sz?=
 =?us-ascii?Q?T1Sq99PdSKzzlTZhqg/oyMvrwE8GMPpi0ZUaJW2oOz+UXZtqIqyJKUaGbmhq?=
 =?us-ascii?Q?DF2lZDubQKfA4/6ZZ5nTA7uE9mpNHDaS4PDY7m3YSpO/hEMLUbFCE6ehNlua?=
 =?us-ascii?Q?7pd1wUXvFo9e6bJ221jmrOM+DpDCIOJvkKs+VEXDt9pKAgMqvNtffv5DRw7m?=
 =?us-ascii?Q?U+rroHyRVHvZyCZFSUVWmL0DmvFKpGXaUz/fvuvzsC+SU8Gh5E0xLCwazvyg?=
 =?us-ascii?Q?FTaeRIg7LU3HKMXg1emSm/nmhvq9zk8vTLrxxfn6JrTEZOglrMl1rl0tBnrG?=
 =?us-ascii?Q?QmWXvNppZ1r2ZhXBYUo8x7tGLCHc7yEDYty6Ibbg7ZccUdD6oSVGR1fVb0To?=
 =?us-ascii?Q?ks0FRAYRqXqLJKm3NNB61elOb69iOWG1J7naVvlLaE718wGzNrtjtRZ5/2rk?=
 =?us-ascii?Q?hGslAkYYVYM4vOW8SZHtM5kGUzKIuCVectBpI3Z9vZqH8gIqh+R14BicNO2W?=
 =?us-ascii?Q?XHVKbhVJSj6LI3KTLa54GPQawR/0ZorbRR/2pJLcitNfhxWHNP5zAJvd7Z6a?=
 =?us-ascii?Q?c4wmTjIAqZ7eChww8I7X+6FY9x5tKU4XmDfAgsserToh0KC0J2rLWK8trg02?=
 =?us-ascii?Q?NU0RCcSsn3LIlxgKHluENfyr70UXOwb4hIQKMTWs9YxqtqtaGPIOE//fJIgf?=
 =?us-ascii?Q?/jjYqMhsd9DHy0pHQBndnT4WO3172RU788tpNzfHxQFMBzcnWCEYVy7yNZNP?=
 =?us-ascii?Q?STgMnY9GBbJNWvH98lxFzwvoP8LbrIeZW9kxaYbVCRiaSDuvJLpKm1Ywl5ef?=
 =?us-ascii?Q?U8DrW9OroD44Unvahc8W+f9KzUiBcbLid9Z1+0pFmmphbxkZ76HA03+l6xoz?=
 =?us-ascii?Q?SwWTW6dC1rVHkUn8WDFqk24Q9AE9u5Aew461GnyKRkmXyfDgsCbx3D13rIa+?=
 =?us-ascii?Q?wefzc73Wy6uVd7G1MOhSEKBaMLcF9EO+/O456kiMTxXD4BlvAI9OvR8A0mah?=
 =?us-ascii?Q?4Db63AIphBa5kXlSP6JXvGY95TokYLJC85stqHZkzhi4JrGCA48KBNW3DHLi?=
 =?us-ascii?Q?JcNsdDMgL2ttxhkYoLGrebCLYbKKVGndGw4qwoXsZpwnrpODqdmgSqBfej3/?=
 =?us-ascii?Q?e1ZMygsguoCIUPMXfavHb4Y+4NSN131RUuVRQJlZj5ML+AgeErPzdhfSfe35?=
 =?us-ascii?Q?CeRCIdcHOTOZvhsyFdufEdPKrrLYz30NfBvgDzJbWt1oyrK28tPrqXGyutWM?=
 =?us-ascii?Q?FL8FxEZd3ZqfWYlWFJAVow4vyPS98mk=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: dcffd213-781e-40c6-87cc-08df367161d9
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:34:31.2004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oqlOd8fCW6rOXYSsPrVaCazaVyuG1HDRIXZ06ie01pCsEP1MRl2KY98/f+i9DbF7LPQWxsctIlDPyQntPp+IaiFHILzoM2Y6+kmKE61f3bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1404

Add V4L2_CID_TEST_PATTERN support with multiple sensor test-pattern modes
and program them via register 0x5080. Drop the fixed 0x5080 setting from
the common register sequence so the pattern is selected only through the
control.

Removing the default write of 0x04 to register 0x5080 does not change the
sensor's default behaviour. The value 0x04 leaves the test pattern enable
bit (bit 7) cleared, so the sensor remains in normal streaming mode. It
only programs the color bar style field, which is ignored unless a test
pattern is enabled.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/os05b10.c | 55 +++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 4b87ef60a2a7..48c905165954 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -98,6 +98,17 @@
 
 #define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
 
+#define OS05B10_REG_PRE_ISP_20_0	CCI_REG8(0x5080)
+#define OS05B10_DISABLED		0x00
+#define OS05B10_COLOR_BAR_1		0x80
+#define OS05B10_COLOR_BAR_2		0x84
+#define OS05B10_COLOR_BAR_3		0x88
+#define OS05B10_COLOR_BAR_4		0x8c
+#define OS05B10_COLOR_SQUARE		0x82
+#define OS05B10_BW_SQUARE		0x92
+#define OS05B10_TRANSPARENT_EFFECT	0xa0
+#define OS05B10_ROLLING_BAR_EFFECT	0xc0
+
 #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
 
 static const struct v4l2_rect os05b10_native_area = {
@@ -391,7 +402,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x5004), 0x00 },
 	{ CCI_REG8(0x5005), 0x0e },
 	{ CCI_REG8(0x5036), 0x00 },
-	{ CCI_REG8(0x5080), 0x04 },
 	{ CCI_REG8(0x5082), 0x00 },
 	{ CCI_REG8(0x5180), 0x00 },
 	{ CCI_REG8(0x5181), 0x10 },
@@ -507,6 +517,30 @@ static const u32 os05b10_mbus_codes[] = {
 	MEDIA_BUS_FMT_SBGGR10_1X10,
 };
 
+static const char * const os05b10_test_pattern_menu[] = {
+	"Disabled",
+	"Color bar type 1",
+	"Color bar type 2",
+	"Color bar type 3",
+	"Color bar type 4",
+	"Color square",
+	"Black-white square",
+	"Transparent effect",
+	"Rolling bar effect",
+};
+
+static const int os05b10_tp_val[] = {
+	OS05B10_DISABLED,
+	OS05B10_COLOR_BAR_1,
+	OS05B10_COLOR_BAR_2,
+	OS05B10_COLOR_BAR_3,
+	OS05B10_COLOR_BAR_4,
+	OS05B10_COLOR_SQUARE,
+	OS05B10_BW_SQUARE,
+	OS05B10_TRANSPARENT_EFFECT,
+	OS05B10_ROLLING_BAR_EFFECT,
+};
+
 static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
 {
 	return container_of_const(sd, struct os05b10, sd);
@@ -522,6 +556,15 @@ static u32 os05b10_get_format_code(struct os05b10 *os05b10)
 	return codes[os05b10->vflip->val][os05b10->hflip->val];
 }
 
+static int os05b10_update_test_pattern(struct os05b10 *os05b10, u32 pattern)
+{
+	if (pattern >= ARRAY_SIZE(os05b10_test_pattern_menu))
+		return -EINVAL;
+
+	return cci_write(os05b10->cci, OS05B10_REG_PRE_ISP_20_0,
+			 os05b10_tp_val[pattern], NULL);
+}
+
 static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
@@ -584,6 +627,9 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 
 		fmt->code = os05b10_get_format_code(os05b10);
 		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = os05b10_update_test_pattern(os05b10, ctrl->val);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -972,7 +1018,7 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	        return ret;
 
 	ctrl_hdlr = &os05b10->handler;
-	v4l2_ctrl_handler_init(ctrl_hdlr, 11);
+	v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 
 	pixel_rate = os05b10_pixel_rate(os05b10, mode);
 	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
@@ -1016,6 +1062,11 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	os05b10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
 					   V4L2_CID_VFLIP, 0, 1, 1, 0);
 
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &os05b10_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(os05b10_test_pattern_menu) - 1,
+				     0, 0, os05b10_test_pattern_menu);
+
 	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b10_ctrl_ops,
 					      &props);
 	if (ret) {
-- 
2.34.1

