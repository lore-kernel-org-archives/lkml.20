Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012041.outbound.protection.outlook.com [52.101.126.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2A047125F;
	Fri, 16 Oct 2026 10:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145134; cv=fail; b=e150A4jOsIuaBc8vp8UBV9yh4kKEEt6KT3kVIqQoJfyoZUdKJ5ysfronzf54/vfWsJRfuP+zR/8dWiJ8hBkLDPgMMcgoNkABVWNMKTlmUhcu7rIV4RzrLwwMI6xJR6LVT5Wi6e9IVLpk0ZDFtKQvDCfZdgVIwRNlG5IaqQnXYmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145134; c=relaxed/simple;
	bh=chvSlXoAidA8iFMT34FRlEAVKrkWpSjl+qa9TZN5Vfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M3dtBWzT15R6+V82EkJfsu9q2DLZbie2gnRHsxa+mbZ4h7o0IIoqlx1ELvq5U7cc0l2bfmdB5U+A+CFrnFLFvNve0tIAVWZHT6L4ytrV+PDtUzXZ9n/PEhkew4A8XVjeqg4iA0CsBQb4XznQsFjnjnpffP+pCfpSXUFhleVyVVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=C+dZ+UT/; arc=fail smtp.client-ip=52.101.126.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="C+dZ+UT/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSBRY6kOboInEI1Bmz3PylCjYTfXlIkMhDO7OMPXXymNvzxV4dp46v2sTfEQ4PDXWXNus0vRq+e2FYew2WakuR4yRbSBftmRw5YGqWMUYM5WSoqiNk28AoocozD62d8XIB5L+2276iUzd+I6m6hAtepqgASttQqp0nsZ68mvemCXWMJVJXBWDomWw4Y39uDYu2KteF+P90AxaeV4BfLPAYQmEHj/95VeVQR6p7sd0HePxb9n8V5qElVo1KbMMLzoQOF+N/RpQVyWC9IVgNVUEnbFi6prfyYOhc/c6tUjd1RFjkXFeDbbkCDpV8soyqhw0iXIm83plVL+itGLDX2sNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kgnni1knBVCgq/fqlKAytsZ8dih4tnIyXU/AI0yriHc=;
 b=n5eeP5ZmPugBuT6wBCG6X59GJtSgDRm+7kR3C3ZjFLMKdN2s2X6HOSyjYPsVTqNqv4BxAbojLNIG8tYh5dls1d/zqHnNi+7ZGnbIxcaUAwdl7OZxVyTGzMxDei3/r5Jj+1dLOKDmnZHW8+jfHG/sJSw/R2mzvSNyZXfmKiQtSQzDPP0l4UfpgMhkF9ZXZtc2C6+D/4teBCRc5ILocIkUKQK0b14qsJ9Df/m6Ac6zn+2EaGxIXcqrlSY/1Kwxail0NYSPzo1Mxshe3uIvgu+ZbkA1OwdziSF/0rbUNp769nD+ACol/6fMPbQx5CW0hf6p5mLncVBko1yF+ofmGFAVkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kgnni1knBVCgq/fqlKAytsZ8dih4tnIyXU/AI0yriHc=;
 b=C+dZ+UT/YmqaBRZXHuGMD7rkyDpM9nZdGyxpv6sNwdyFvJ/k54WCunbscsVky7iEMZXFaKzuO6Re9KOa5UoLQDzVgFmSjIn3/x9ViAQLeLeu90V1x8zaMW7AmChKdD+Y+Kk4PrpCA+NOnK6VNcwgf6CqImdCzZpuVnnV1AVn2b8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by SEL0PF274D7EE5D.apcprd01.prod.exchangelabs.com
 (2603:1096:108:1::592) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Fri, 16 Oct
 2026 10:05:28 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 10:05:27 +0000
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Cc: Fangping Cheng <FangpingFP.Cheng@moxa.com>,
	Epson Chiang <Epson.Chiang@moxa.com>,
	Eddie Lin <EddieSY.Lin@moxa.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>
Subject: [PATCH 3/6] USB: serial: add stop and start callbacks
Date: Fri, 16 Oct 2026 18:03:48 +0800
Message-ID: <20261016100351.681390-4-crescentcy.hsieh@moxa.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016100351.681390-1-crescentcy.hsieh@moxa.com>
References: <20261016100351.681390-1-crescentcy.hsieh@moxa.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0054.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::18) To PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|SEL0PF274D7EE5D:EE_
X-MS-Office365-Filtering-Correlation-Id: f664bdaa-59da-47bb-3493-08df2b6cfed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|366016|376014|1800799024|22082099003|10067099003|18002099003|3023799007|261009223027099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	YGgHzABqtccyPMvT+fthbYTj20KU953t6EOXaAseO3fvtyeyqgpHx7GfdH4Swspw675f4TUqFyGLHrZwNWa305z40GoBAXFc46gbIFyHFllqSdehtxQDQbSCxey2iz/k+kP1GpJL1dLDd+dUt+3prZmGVAXo3ch9f2XWceiwhrozf0lKvJ6to3TMOiCR33iWptuW96mWNzuNK7VeyocduifQCegX+Uw87YI/9HEUFLR6y6hJGR8bDVWE34c1MJCdOIp+s4Ot4iIcbHpMZNd03Si95yLiTi3GHxiDvs+Wz0GX4geQDihO7tJIWSPO0dHlYne3aNc9dyoSAFnUIpDJouIEX1nnlD6DTx6+sWoUByhAZ0tWVrbnyP7W/+0lzfuUPY04Qgc18CVBTwfpb0cRAuD+DmecLL53gJnkxqrIQPYrPLJAoiWDU3IgF0hnDbj+QB2rR5qTEXzUVA6sCA9tmSXj5WYWZG4eU7wrc0DyKtCwnLHw3NEhEM8LGL10emkxCjCpcN7Rwo4To846nKK7Z1efjjslktciZiLDDMWBDPQu/oMOPseEY38hlBjmqegTJsnlnw0B4TuEyP8WPkEIFIBfjAtBeCTiYtWO51Fom1fmnwWNuEvjG57i7M/nOLam/YN0LfSqMDMmMe/b/sx6x/Li4RF+JunrYDylN2iwocBK0l20sMgCGvS+NvUmqEiCsGTK8bT6xWS6gE2UDd5NQUO8fVEEDFVPDy0M50JL68c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(366016)(376014)(1800799024)(22082099003)(10067099003)(18002099003)(3023799007)(261009223027099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5Jb5gUEAh7YmA96VfP0Iaf+WsjHh1OPRCsGQVPmhuGGS6K8KQe/G+I5Y9fdP?=
 =?us-ascii?Q?Ox2LvH6K+jwIbf/XiH6gJHAFiGarCQzeSWNrZX/L6y608UFo7lkV5bnE1uDl?=
 =?us-ascii?Q?NNHYzyU6soTQbGtCNiAvsrAM6LC4QTqL/zlW2+IGvO8TCvL/Q4ZQX0YPwBdd?=
 =?us-ascii?Q?MwymuWPZBjXX45cAJP1K+o2BNvIeslQJZylILjSd53Qu/OwYoL+Ajz5/pGKu?=
 =?us-ascii?Q?VUwKNlhm+HKtATaKyAIvqcgtZ/jDJy46PnNnEUjh4vMhPbhw8k3HlGSAGrUv?=
 =?us-ascii?Q?fiReJ7NBjCyBejU9TfvEhwGJfMGmeTgoGaktFqw7z2+mPZEQOG4h0czka2e0?=
 =?us-ascii?Q?9aEjtYEl5RUQMnz9MHnNn0NiKAdt4wznaCv3WMr4y213wtVl81Xe4Ia00rJO?=
 =?us-ascii?Q?3WVOiZrnMQxyeS4zI1FruvtA7XNGmCLsatzZZv8JC2a1QbJ7V6EcrOnIgqmZ?=
 =?us-ascii?Q?cT/dlwNdYoalY6DqGZJODBba6UvnGTOHvfH40V47NdGvxhZq2XX8lmlkD716?=
 =?us-ascii?Q?YnnTh+t3t2l5H4sOtF1SNWH5rtU7KRvLOAYdSsBT+wrolj/hMZO201CSv/gh?=
 =?us-ascii?Q?5/0zA5Eagfm+trMUZTc77gid29WzE2zCf7TnO2lbxljiW/qiYqyRQeUTOPhI?=
 =?us-ascii?Q?DazuWd1TRRtm2ZwtKG3wrAZsUJ5P3L4ZhgdzCsuhsCz8aUNqBbrKwNgTHJNf?=
 =?us-ascii?Q?/7eOzaz1lPG3ebC+0B1bz8FbKOMCSL/1Dx5UallfeDEpnHACi/dAqG8M0mcs?=
 =?us-ascii?Q?A1LgUkGTELK7Nzk70p/+sHRl+32s1Wr3f9sJnVKAg+YSA2khkeAaWluldfyr?=
 =?us-ascii?Q?eEeqU7lQ78w7JaxiM3vf9JLXzNyzpJ8g3/cjo50Df0bqG7ZZm07zrfWUlG89?=
 =?us-ascii?Q?hOx/Ysl4yMa9w2tuPOp+zkYh8DHQlHCfvV/AScdcYzWzbRLIddkixzY2glqH?=
 =?us-ascii?Q?rK0smrT2yi04BqgdbWSssiYtIehqewEOpl7yrwN1TwmiJYmnLNm2eQagSuIB?=
 =?us-ascii?Q?VwUqagQTLdzPgsZ0cWkITIEyVyjsriOUwnSNS26cfqWLiITxNmUbAydiAePg?=
 =?us-ascii?Q?zUh4ANmfk6TLFiqr7sgeaBdDmCs1S2MdCEfULdjPQymohaG7xxQ6Cl82m7Dd?=
 =?us-ascii?Q?9pwgQCiX7EZeBvGsaaNlfVQ028h1RCBpTmDcLdVPA7iKbMEKD6XIBNieZebj?=
 =?us-ascii?Q?4Dkb2gkJ8JtTSBXS7ltEK4uMZyjHXv2+aUgogLTeg3utBREOi2+bL5/KSjM2?=
 =?us-ascii?Q?VNaVDBjg6IZbGWEiqhCQxjsWsME07rVFzHvOND3dYxj3kz+r/kof1GzQjKOD?=
 =?us-ascii?Q?A+8HnvX5HoShWMDa9rquYZjPfs3o9nd05P8vI1+yUyJas712ZRufwg+WCLBO?=
 =?us-ascii?Q?qr7Q6vnkXGRY9IS4h8UoUn6HN6m1sBWNx3srn3v1MpAQk44iD/qMQbhWf/PB?=
 =?us-ascii?Q?ZZPMDJEg66UjbGSXx9mA3N3IzakJSDTF8jk5p66AzBwVkf84vxXrIUsVC2Dh?=
 =?us-ascii?Q?E5ew0lZdzo5CCEiJdYWF5LeBGsTA41DXnBaIszzy4g012Y3qm2sqjst/0xY0?=
 =?us-ascii?Q?tGWRwUPwlJ6o2JQ5qu8HMUTqwa7SlTnpKq46rEzu006x410Lox3ZV3/hscTB?=
 =?us-ascii?Q?QYA1TZ0fanwg8Mq5dfiLiXL8Q+tUBTP0a074XcCIQeFC9cJ+ok1VMfZiipwH?=
 =?us-ascii?Q?+6etSdj4lgv+XnZgiEl57UXvCKWqXEqF1Ld0+vSee9u95zeNd5jBQwjx1aUv?=
 =?us-ascii?Q?EVLykpZYie4KDUd06b2h8RNoCUtSgWs=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f664bdaa-59da-47bb-3493-08df2b6cfed4
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 10:05:24.9354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCc4NQYPN8ZOfjT/jCY3+F4XjtbklvqrXSpqtZUAU8uWa+moEyLbAtngG6VZxss+nu883o546AjlBaZahtMDsuZNrBVYnsWUSSl6REW8+9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEL0PF274D7EE5D

The tty layer uses the stop and start operations to suspend and resume
output, but the USB serial core does not currently provide them. This
prevents USB serial subdrivers from handling output flow control through
the normal tty path.

Add tty stop and start operations and forward them to optional USB
serial driver callbacks. Drivers which do not provide the callbacks
retain the existing behaviour.

Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
---
 drivers/usb/serial/usb-serial.c | 18 ++++++++++++++++++
 include/linux/usb/serial.h      |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/usb/serial/usb-serial.c b/drivers/usb/serial/usb-serial.c
index 4a19621f08ba..73bb0cb0be6c 100644
--- a/drivers/usb/serial/usb-serial.c
+++ b/drivers/usb/serial/usb-serial.c
@@ -429,6 +429,22 @@ static void serial_unthrottle(struct tty_struct *tty)
 		port->serial->type->unthrottle(tty);
 }
 
+static void serial_stop(struct tty_struct *tty)
+{
+	struct usb_serial_port *port = tty->driver_data;
+
+	if (port->serial->type->stop)
+		port->serial->type->stop(tty);
+}
+
+static void serial_start(struct tty_struct *tty)
+{
+	struct usb_serial_port *port = tty->driver_data;
+
+	if (port->serial->type->start)
+		port->serial->type->start(tty);
+}
+
 static int serial_get_serial(struct tty_struct *tty, struct serial_struct *ss)
 {
 	struct usb_serial_port *port = tty->driver_data;
@@ -1351,6 +1367,8 @@ static const struct tty_operations serial_ops = {
 	.set_termios =		serial_set_termios,
 	.throttle =		serial_throttle,
 	.unthrottle =		serial_unthrottle,
+	.stop =			serial_stop,
+	.start =		serial_start,
 	.break_ctl =		serial_break,
 	.chars_in_buffer =	serial_chars_in_buffer,
 	.wait_until_sent =	serial_wait_until_sent,
diff --git a/include/linux/usb/serial.h b/include/linux/usb/serial.h
index 5866f19d3c7b..633bdde530c5 100644
--- a/include/linux/usb/serial.h
+++ b/include/linux/usb/serial.h
@@ -285,6 +285,8 @@ struct usb_serial_driver {
 	bool (*tx_empty)(struct usb_serial_port *port);
 	void (*throttle)(struct tty_struct *tty);
 	void (*unthrottle)(struct tty_struct *tty);
+	void (*stop)(struct tty_struct *tty);
+	void (*start)(struct tty_struct *tty);
 	int  (*tiocmget)(struct tty_struct *tty);
 	int  (*tiocmset)(struct tty_struct *tty,
 			 unsigned int set, unsigned int clear);
-- 
2.53.0

