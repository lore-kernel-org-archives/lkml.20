Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013033.outbound.protection.outlook.com [52.101.127.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBBF47535E;
	Fri, 16 Oct 2026 10:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145141; cv=fail; b=nDsG7xJ2Id3wrZe9U2SvRDtaLDUaxGE/VCGuz6E/y3tMJcTtM+aSD00uxC2S2z1lt1T5GTHIhHulpVDi7EeditcbwGgyI/f/2NYYsmNOnD/uiAI6O7b1eK3gqa8tCI4YMRpvMD6ChuvWBS7B7/jYwko7cAM/KbYB7nqMgV9AJM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145141; c=relaxed/simple;
	bh=j9rDFYam4BNB0yqH/6dAR34KMBIF9ln3bvbmMG27Pxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZEpqd0VXx8+mWSbG3x7NY8SdFdzqv9PBiXQygblSJxWQQ3lF9vANXmvEWSjF88VX3d8xQwqXBKOGiHSKD3ebLQARjbVi8A6t51cd9WHZN4CIACGD9NuV/tv+3iaocUDOOJJ3ymSsWEe+yjzld0y0K6821X9SyifyfyqYFvR+eLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=DPwYQ2Me; arc=fail smtp.client-ip=52.101.127.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="DPwYQ2Me"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqZAtQWEDQFNIGtUrHJxjwKO08TF2yJrHuiraLNr2m91j/60JvdBWE5V2obu+iFrSagOZxzg8R09S7dRtYpOtb22LVXZGQtRofaCqJiLEUEOOmEecIZxY/wCloVGH7xDcoUKjNP+5z0gtjE/twee8YhLE4f2kl+RbkPa68wHAZ3c/ORru9g6NOkIc4g7x8ZVAHqmegxjDporxC67/6HViG003yvTXFsBBdUel5DchdptA8n2JFAFq+F+bu9bgZzwksIbTA/xh8olF3vpeev1FAAvtjYAUAobLPMgcs8QOfD79ChqwOkIMn2fsuosyo27JhXccbrWaobnE0qN+TXZAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGakW+bQm5W+i5iMaoZdN5jFnKQmfwX1EJPFQMcWRFA=;
 b=bVnB281O3dQ45jVKeSmK5MmrFbiN6dA7UxhmfYcd/Bpy57XkUm3dmiQZ9rmo2cTJwnvPdN8PuNcuOV/QbiJwHRierUC4jJ0WzirQNMao621ZXCjBHuvJHoIOXuqInFRXyLPyiySuNBbn/lXDWwCQ3WQPGqnqSqU0PTCWcxumyJl8vAinoW180Os67TZcVwDabj4Z0wUqgThVIxkSXuOZmUkxY0kDMOxksDTQF4U4QAExXeBfkSxlAua7r3B9X/UQR6EQWkIZyoK6KEFNkpKkqx2RpQR0L4q7wv2lF+sFqWZI99lplGiXmue9imaGINEhe/p+HankORXf81lK7zb1EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGakW+bQm5W+i5iMaoZdN5jFnKQmfwX1EJPFQMcWRFA=;
 b=DPwYQ2MegQWyNZ4iJrIosMr0GoyHvpN+DeYptVhCM3k0pOwDx/stpjqKbIEjOQ5wecKLHCa1wB08H4ajpV5yvnr/PhBTF0RmrPX/soszbcm/H2CYQoILHoT+GNnVVrSuUQC54Blx8BDwiHtZfus1juygAgLdv2lqjFUOxrBnCl8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by SEL0PF7EC1E1493.apcprd01.prod.exchangelabs.com
 (2603:1096:108:1::5af) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 10:05:34 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 10:05:33 +0000
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Cc: Fangping Cheng <FangpingFP.Cheng@moxa.com>,
	Epson Chiang <Epson.Chiang@moxa.com>,
	Eddie Lin <EddieSY.Lin@moxa.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>
Subject: [PATCH 6/6] USB: serial: mxuport: wait for UART transmit completion
Date: Fri, 16 Oct 2026 18:03:51 +0800
Message-ID: <20261016100351.681390-7-crescentcy.hsieh@moxa.com>
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
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|SEL0PF7EC1E1493:EE_
X-MS-Office365-Filtering-Correlation-Id: de59689f-5c98-47a5-67fe-08df2b6d007a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|22082099003|10067099003|18002099003|261009223027099003|38350700014|56012099006;
X-Microsoft-Antispam-Message-Info:
	Z305Ip1F5BoEf2/Up9TOaxsejIqJVx6OAXnSuaWnmszhhuAhySA6Cp/EAeHfn76uTOaX5snnuChtqxHVjWL+YDJ7hglJQLyqZSqkWj7uRDvoC1ZheJlGbaMqjC1wOJ1L/JUGxQ2g842Z7TjdD0jid7XtCpb5on3NmsCDRvtUMLbXKmF77O8kNL4d+r4SiTTd+sfLLnsJXocpnCABDKdIUrisOqXWmdn30nJkHmrnEkmc8RFEe49uccqIj8jFs/+eNNUV5HdcBSs5BkpLVVFXcdX0PYNf7u+dwHc1ZxJDAdP+3WLKE509MHj6xOk1r1Ot1YteyK+13o1OGfoSj2MLVici8jg3Tnvl79d6myMCTg1t0iKwocx4ClJZuBjkB9ltRGzw0KRF7YmQdvKj1gaosOMqcI6ud9mFJmiuR79cKAObeCwse5tn5Xgxw4pmn3hO4PHx1uqKp9Ga+fctDhFw28Wc5iTRUgOEfJv0F3ZZquW9b3QWOrYCjLDvaPY/1uSp93Dfklsu44hCo48SqUEr7eO/HWEgcFoaZQK0l3rTbHm+Jhj9GaRI3BiDPMbN/Cv2B0ZMFJuwhs8/SRyj+vi+T7bxkWtoX68y8UxvkvkFeQWVzuY+equC8GHgB571T/cIsON1lH5LBxPlyZ7KMvT/UBry4SFmlMe8/IySVGZDLjIHFu96Ix3sjPDLgxKTA6nRaooBpURo9EPGZG7Sr1edQdtLohxcWNiX+/8HC/prehM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(22082099003)(10067099003)(18002099003)(261009223027099003)(38350700014)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mjbxXIMddsazaAulbctDPxf2eMEHfOmmyJJppXzOQYLIH3T6oveenrLYwZTd?=
 =?us-ascii?Q?dRYnxRFa3E8/BLrTzH40xwUP4Y/Eq1BZ0TL3haM0zf5v/DBcWMV50BGrxgP/?=
 =?us-ascii?Q?bCW+1NIMIQZ5pTe1wupvqb6soSjMjz/gJCnGb2IZyqczGSFZ/hMRDLICauFR?=
 =?us-ascii?Q?zkvG0RauB2Da1mR+qB2TLb5LR8Z19p6JY52bkOYpgVe+jo3lK+pkBSaLHCgA?=
 =?us-ascii?Q?7rnsThJOOWItI3w2pRVPY4MhQ7uc43MrnGXayEOUQjzarX+7mBYWWIeicQdn?=
 =?us-ascii?Q?OC7rblwHeIgTqjv+jDnj9H/SJWCk7mnI7apEAqlCr904X4lfmZIIoccmYLvu?=
 =?us-ascii?Q?umbXcjuPy4gGJDhUv2NXfdMzX3CWpmDB8triVhg7wVIOTDWlSJdEai/QauYn?=
 =?us-ascii?Q?+MZwbxV3Zfe2UFQSP8GaBGLiFqpwciV5C4y4rUP1GuktigDD9L4DkTZf3XlI?=
 =?us-ascii?Q?1UW4bNy2zANX81X+xj//ZNrHhJ7fG2uCCLE4c76Bt8I2N9KbHmxcHIJ5VNia?=
 =?us-ascii?Q?NoHosvI2Os3+CdypPMpeFCK83YRCpIQI26JqT5JsgB2Gnf8MyZoaL6kZyfmy?=
 =?us-ascii?Q?ue/OIGYCYwugDd5IiKFyj/tgpxQvjYH8X52XtAMdKUTgZ/afKpMf18jC0OmW?=
 =?us-ascii?Q?J1AiCusR1EcAxTaA9yBOxIOgI482quLOvyz2Zta6b5gJH/7951UKlML8bIzL?=
 =?us-ascii?Q?m/kq0b14KzM0Cnt6oHHwR2Nl0nChdkBgDja2YYws0seLVEjF5iCqsKVSkQDZ?=
 =?us-ascii?Q?gqjtYzBHyy2DQY7WNA+kncNfgc1pwnnIL112/g+u/X5PRRd/Rd/yS4mACwPM?=
 =?us-ascii?Q?SofsETaUv0ypPguVH46hYvVlFzPlWVu1mf5hmyhCE5h6gRhL5fk8UZ2j84u1?=
 =?us-ascii?Q?bduw7YD2lRdxCrbm3i2OKdmzANu9GeiUTuDvqIodOQNREx0z1LWNYNMJbzUw?=
 =?us-ascii?Q?C/m3PNmPNF6JtBO8QDZVtCuxwvMzmyeo8VaA3DqHpPpXrPUSCBFPj960ybGC?=
 =?us-ascii?Q?mRVtZBXM+VRt602kvZZ/SkKfl3aXYPd9voW0t3X4VEncI+soqdfKUn/Exsv1?=
 =?us-ascii?Q?weoLOCiGGHNoioWFQ4JrhMht2Andef0VphkmMDW+27YfHIvAKSZ8AmO34IeS?=
 =?us-ascii?Q?GedJvEcQSmbOPJ74xgRLE1mkWRsiZUKZiuszjRyTUQgtHdvwz9EWjNTIgtQQ?=
 =?us-ascii?Q?Ej6JSJ06V7TgvIxyU0ANJuwR84+NNVmsQllX0f2+m74DAsHdZ9eWeX9D6ABd?=
 =?us-ascii?Q?0NNnFBpoWP8avFrYdBBMvWpY/mMV745QpfrGhwq2lTuHWs+R7r3yDOH4JzqC?=
 =?us-ascii?Q?AW3JDKkonMUIntgnmEbef77TBmhuEgHl938kK1UUJCbDVXheqPFSK+FPrwgl?=
 =?us-ascii?Q?8XHxTH6180pc+xFxZr0SPcWn13rBHgONvEUhV29h/7jhcEAzRxUMRBA+UtgR?=
 =?us-ascii?Q?i1IjO4ieASAv2ZzwaueJWR6BEvujln6tqPwf7W/IyuJzodACDrgMvAcz4vJz?=
 =?us-ascii?Q?ct28UFdjutzKllraxFzhccePrqnchhsv1/dcwA47vcWLhXQsXINBK6zInr1T?=
 =?us-ascii?Q?Qbpa1QONf+1BIqEpwYjLo8KJL2P4NPb2VMp8fmeEUaOJ+IuwWTKRxFI9CHhW?=
 =?us-ascii?Q?euuRVaWdHbk3MZIle7SXaof6MJqD8Z8l++dD9ULUjAZkze8yn/0q9jVASJgM?=
 =?us-ascii?Q?QNvZtYHMapXVpPUcgqjbQOs6E6RAvNfvXDuzFiQuAzKYmGXeHtabSfsXLLIG?=
 =?us-ascii?Q?HMZvvg3xHX+Y/tNlefn5EEyEKYhljhc=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de59689f-5c98-47a5-67fe-08df2b6d007a
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 10:05:27.1223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zft6COdSmKW6Iod1hDYUhwMRHXJKSKsgnXYuyOqavnzipdGkM6TBR04ioGuImkP1d85b4u2BtXD4/fhZM5DqG6c6mEgn3CbTabwq8Y1tv1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEL0PF7EC1E1493

The RQ_VENDOR_GET_OUTQUEUE response only includes the firmware transmit
queue on G1, so up to 128 bytes can remain in the UART FIFO after the
reported count reaches zero. For G2 and Platform UART firmware, the
response includes the UART FIFO count, but a frame may still be in the
transmit shifter.

The generic USB-serial wait stops when the reported count reaches zero
and can therefore return before UART transmission has completed.

Add a device-specific wait_until_sent callback which retains the generic
queue polling and then waits for the remaining UART transmit stages. Use
the active termios baud rate and frame size to wait 129 frame times for
G1 and one frame time for G2 and Platform UART devices. Keep the generic
polling and supplemental delay within the caller's timeout, and allow
both waits to be interrupted by a signal.

Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
---
 drivers/usb/serial/mxuport.c | 65 ++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index 9d304fb3aa02..53ab284f82aa 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -25,6 +25,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/firmware.h>
+#include <linux/hrtimer.h>
 #include <linux/jiffies.h>
 #include <linux/serial.h>
 #include <linux/serial_reg.h>
@@ -207,6 +208,11 @@ static const u16 mxuport_mux50u_fw_ver_offsets[] = {
 #define MX_WAIT_FOR_SEND_NEXT		0x0080
 #define MX_WAIT_FOR_PURGE		0x0100
 
+/* G1 queue count excludes its 128-byte UART FIFO and transmit shifter. */
+#define MX_UPORT_G1_DRAIN_FRAMES	129
+/* MUX50U queue count includes its UART FIFO but may exclude the shifter. */
+#define MX_MUX50U_DRAIN_FRAMES		1
+
 /* This structure holds all of the local port information */
 struct mxuport_port {
 	u32 sent_payload;
@@ -716,6 +722,64 @@ static bool mxuport_tx_empty(struct usb_serial_port *port)
 	return txlen == 0;
 }
 
+static void mxuport_wait_until_sent(struct tty_struct *tty, long timeout)
+{
+	struct usb_serial_port *port = tty->driver_data;
+	struct usb_serial *serial = port->serial;
+	unsigned long features = (unsigned long)usb_get_serial_data(serial);
+	unsigned long deadline = 0;
+	unsigned int frame_bits;
+	unsigned int frames;
+	unsigned int baud;
+	ktime_t expires;
+	u64 delay_ns;
+
+	switch (MX_FAMILY(features)) {
+	case MX_UPORT_G1:
+		frames = MX_UPORT_G1_DRAIN_FRAMES;
+		break;
+	case MX_UPORT_G2:
+	case MX_PLATFORM_UART:
+		frames = MX_MUX50U_DRAIN_FRAMES;
+		break;
+	default:
+		usb_serial_generic_wait_until_sent(tty, timeout);
+		return;
+	}
+
+	baud = tty_get_baud_rate(tty);
+	if (!baud)
+		baud = 9600;
+
+	frame_bits = tty_get_frame_size(tty->termios.c_cflag);
+	if (timeout)
+		deadline = jiffies + timeout;
+
+	usb_serial_generic_wait_until_sent(tty, timeout);
+	if (signal_pending(current))
+		return;
+
+	if (timeout && time_after_eq(jiffies, deadline))
+		return;
+
+	delay_ns = DIV_ROUND_UP_ULL((u64)frames * frame_bits * NSEC_PER_SEC,
+				    baud);
+	if (timeout)
+		delay_ns = min_t(u64, delay_ns,
+				 jiffies_to_nsecs(deadline - jiffies));
+
+	dev_dbg(&port->dev,
+		"%s - waiting %llu us after transmit queue drained\n",
+		__func__, DIV_ROUND_UP_ULL(delay_ns, NSEC_PER_USEC));
+
+	expires = ktime_add_ns(ktime_get(), delay_ns);
+	while (!signal_pending(current)) {
+		set_current_state(TASK_INTERRUPTIBLE);
+		if (!schedule_hrtimeout(&expires, HRTIMER_MODE_ABS))
+			break;
+	}
+}
+
 static int mxuport_set_mcr(struct usb_serial_port *port, u8 mcr_state)
 {
 	struct usb_serial *serial = port->serial;
@@ -1666,6 +1730,7 @@ static struct usb_serial_driver mxuport_device = {
 	.set_termios		= mxuport_set_termios,
 	.break_ctl		= mxuport_break_ctl,
 	.tx_empty		= mxuport_tx_empty,
+	.wait_until_sent	= mxuport_wait_until_sent,
 	.ioctl			= mxuport_ioctl,
 	.tiocmiwait		= usb_serial_generic_tiocmiwait,
 	.get_icount		= usb_serial_generic_get_icount,
-- 
2.53.0

