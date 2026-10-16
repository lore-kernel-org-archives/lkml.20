Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012060.outbound.protection.outlook.com [40.107.75.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EF04779A1;
	Fri, 16 Oct 2026 10:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145139; cv=fail; b=tOIF2K0z4LyHQYv7Ox+wiEyfhsCPZ73M5O/Iqk/0sLLTIq1W36GSDtzvFo+A+hJXMTbWd3+oFhAlb6gWkdZX8oQT4CHeAgBE+147ZbYF8wIWfLCSrDaZrj3bBs+0d656IVRldoW6mXdPOwcwEz10z/hoIiHfqif9sdn2c/cM78A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145139; c=relaxed/simple;
	bh=ENuN5zA+K/Ed7gwz5AuFxTPYr8qg5t4TlkehImXEmCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FPtekcQ60eRIt39mQbRV9T6ri0OMEP6iAf4HRPXGmMh8oU5vgzWNqBvxqddvUhuRlOTjwtHCP9tLGeU2gpgM1OeZ6MEzWmp9z/MBRa3CQLRTu01OStwoie1D9RZm8l50PY7jbRtmKO6KHqyQ+z1fP+VGQsmDDFedPlMxrznM9WQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=NrPGC8Nk; arc=fail smtp.client-ip=40.107.75.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="NrPGC8Nk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2pb0NexU6c1mkyuQaXmUi4ZUGODb+3mBT/SutbvfBgarFDDjUkT0t6DLZP7hMPprs3DkYoNgPA/kSfXGCkD4zeaHtCQeYXXuP2IyXUL5etJSJXVFeCcga16UCuVmM6GISyKUYqo9ZWGb0CD9hA311snvBK0hkjoNnZU6zrrcjZDGMK55iAgWbKsXIj7X1xD4p2zYzpb9w36ZtoD5+Mrg1F0W1l/5o723S4Wtd9DhbyTNy8uwtuQACvCoQqRYieS7NGXTorrlpgKlnPnkvRdOp8s6Gci7vWRNntGMbxtd08IGd0hraEoxuxhyCR+XMo2J4N19tKFSisQiIJM50gPIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0sFASYZ2gWTclTSICbfJOh7/ZidYJZfSdOpOs3sf8lk=;
 b=sWrL/o+g9uqyz2yjIGZLDdcdP+O6RtDxhOT38nXUyteSlD3NDsHDCeKmn0/pL4l4VlwdNNfwD4o1Bs6kTDcxUhf77GB3cPv6hWC+VfGQDyB5lYOLA7B36zWPyId5OU2xUJFR+i1GqZkVOcwUJ4/sHvvLWl+UTOyyCjnaUA63on3vx9V160CQ0faoYdr5IJGVUTl3QJTHMIzm8i8rUt1Jf3hSz9QJESy2h4U+iirJ34aqAzc4nXwUBL+TrKWJcHA98xTLVlk/FBZzay+IHnDYBAJkJfP3W1CY949ThKq1XJCFMqJPTp/x0y45F588/EeLhzEUk8U6oUwod6/JdjjBCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0sFASYZ2gWTclTSICbfJOh7/ZidYJZfSdOpOs3sf8lk=;
 b=NrPGC8NksjPx3tH8IeDaXEL516M9kz1t21dfjBBDIMGGreuTa184FvjmbrYomw3EknnX1aHYlcm7s6eHVZHKthY8Ajx756iLV2DczheYg1iUbCdtlCA0Nc/UEWr2zwPAHCFwudozrbOCpv74s21wbv9Odja5pTeWobCsAA85ZJA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by SG2PPF0F153BD5E.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::409) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 10:05:32 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 10:05:31 +0000
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Cc: Fangping Cheng <FangpingFP.Cheng@moxa.com>,
	Epson Chiang <Epson.Chiang@moxa.com>,
	Eddie Lin <EddieSY.Lin@moxa.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>
Subject: [PATCH 5/6] USB: serial: mxuport: handle TCFLSH buffer purge
Date: Fri, 16 Oct 2026 18:03:50 +0800
Message-ID: <20261016100351.681390-6-crescentcy.hsieh@moxa.com>
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
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|SG2PPF0F153BD5E:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bb6984c-a131-4b59-3d4e-08df2b6d0005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|1800799024|366016|38350700014|56012099006|261009223027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	UYX9ELqrju08kHvvuCSBuaGHYwFB71c+Ax311Q+PMDL0GhCAIIl84HNv1/YbGxXnpY8JzW5Z2u3vXrvI2Oumhw7nit7WXyaQbNcfSvxOgJU4UTb0oV46RYh85gDAFN8RalF3a3CfDA9P3D5TMHH9jbEL1x5q7ZRtLlRwLzOQIdPxxWUR05WI5vOMo42O9TqV+ISRdKHcWS5TBfythJPP2kF4fNyIK+/5PKPG9zeiCrXsVi/WgmNrfLRptaWuL3UIaXNX9YsplpOZJDBlv81aDjkkI7JSyy9CFvK64eEdIgVaAJv3n7xun5WT0K23PfXRC+ErzOsBY66MPkNwxDUNiMtMy8f5e6x5BsfaG48eepZUW8IBALyJeuvDrZs7ELvd2nzfWD7UMQNF4JehIauT2s2+OtMXA6wQ+zcxrksundE7PEVXEGiBANCybXI6VzYkw4a3cKRNWrquspNE8XzxQMbz2vXmisCoSsAOLy9POZTw4KxtLqM1chn24p/rHFNcGC7OgRA1nY5ZzIJUeK7VA6yfwfIVwaegzGBi2/SGKP903q0vqPm8sy9hBWl7SKE3SBmFDu4f9qo8obTzZYGQYwebnXkHZjlnYi/Sn8O3i09/7aANUo66wWThXA1ulG4XHbM28K01aDHgdfoDTjm8d3Enztn5kVuclJU7zBEjklIJlj3vPpDDWO488hU5t3hV2yaNxYD0rxWjJ05yhCudTrHRdmwpNAHty8wEBS8qcww=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6jmZ54P7JIi8oq3pHv1AVK488Tpp19Xiih8ONqtECjayJNJTnzwAfWezVhqf?=
 =?us-ascii?Q?ifTDcYRJvWCS23M+wZurgQTx/K1ZZfs7kgrq/n4jX89cXAHipVCcL9yTXx0v?=
 =?us-ascii?Q?tSDaA9heBBPWAprDWuvbKSz5EP8zVyPto1i6FfC0PWo5zaImzQUu9cZ/sPjn?=
 =?us-ascii?Q?QqJB1cvanBszS8lPPI0EN0T9mGyMT4Zp5HdSm2VZu21LkVClTewaMeSizdLH?=
 =?us-ascii?Q?Om5MqC5FGcwat50e9qS5o7rTH3OFEodopaw+BaaKaNa0KHh6UyFjQe8pGcIy?=
 =?us-ascii?Q?yMjLQyG1YPe12+tKFiGf1fYx7H6BwUBzzoiQPWL7cA6uhUKwt5nujSxnrubE?=
 =?us-ascii?Q?kcdGiQt7Gj6BSvqQKV6YtK0/txYpOR73xIFnRiCsZ6/wB4+pRTwPg3GGOyAy?=
 =?us-ascii?Q?5CMFe3bUatBfB4Qt4kw1lmEKkkzY1eWar4L7d7R+9m5tN0u1urabFwvy5rA/?=
 =?us-ascii?Q?PITwvaLMPrj2zMaDCTlpSDl+N8b5EuCASC7wQqMigzW0kXw+d2jgWOE7n609?=
 =?us-ascii?Q?dkDUWHsit+iFaEHySFMQ3Jtu38JNe/ksdHLL7qMhYLAyR4VTYd+T330M6Yh8?=
 =?us-ascii?Q?5wut0CxLwaL6p3QYzXczOG7r2Vq3OJHfGsuLOOpU0HVY7f0WY9Ha+6Ag5xfS?=
 =?us-ascii?Q?DdfHJWKAUTYnTNMMk6XR/2mai5ljo1x+d73qbc9egAEYTvaBhUT1eAlJ6Jkm?=
 =?us-ascii?Q?9JYEgOO3P0yso5QVgoKyXUGXluqTT1J/vhVROV5A4Z1MMcpXgRQEOa8BnJHY?=
 =?us-ascii?Q?ZyCJHn3stc/KJgZQFoIrAjK1lLFKLxnnQetCn78Yi0dI+erH4Aol6krzUqXO?=
 =?us-ascii?Q?TpIEzyKuGftp2aoe3H0+9/E9EM5x6SX5E5wi3F+0NrUea/+MdoeamA6LA4QQ?=
 =?us-ascii?Q?FgR4PzKlNN/ywJx2Dqv9zT4R1xO4JKtGSvJ5MQBvREbutPN9i/jTwGFk578B?=
 =?us-ascii?Q?EyY8WWpeC38XkA9C3BjIafWbcdNairwx8z+84qOz5qbgk2bQfdhtp07iXc+H?=
 =?us-ascii?Q?KHnU7zWxGFZlPMDDcAMy74nXwFt6bEH2vYEU0PQ3J2glLxzMLuly18bPr0fC?=
 =?us-ascii?Q?smmzNslLmnFf/mScIG19Gi3SLl+4pRwI2rSdcxH88ny1PVJH5w0hmK4SpDYQ?=
 =?us-ascii?Q?GvOUCX3xC4l9mb1xqg9G+kPT89SDjWNLiMGZqOIBH/kejCxwJ4XAupveNON7?=
 =?us-ascii?Q?p4W+BhPbSEANBpL2WTZyJPW/2dhlTkL7i3I0eRTNGmRhgt1fkOlJGO2DA7o8?=
 =?us-ascii?Q?VbWV6J7xj83RtNNFhbcQpi7rujJ49yMXhP5hND2tsXFzTxvClF6n0psOT+LZ?=
 =?us-ascii?Q?7RQgeS08dxxkpk0QJS+67XOvPRylN9lXS7GFyeyZbGdIx/vAuAwR7BRTYxT6?=
 =?us-ascii?Q?9x5v8vKbdZE9sdbuVu4YqdJGdZK7ljMj8clTvmvaCds0tS2Eu4Ou/Y0VwBXw?=
 =?us-ascii?Q?85PawzTgoX6Fgq9nbHK6GRw+fYVpVz9OINd1BzDMrwjEiGKbk6Z0COZEVEnO?=
 =?us-ascii?Q?cMgWdf3Hawr9Jyozx8AnQFv3WYN6TUzi0UWyVquiM/C7ofGH32+ZlhrqKzxI?=
 =?us-ascii?Q?4f938gYnybxVvXLbntgGOpCXq89s/0xMWsBwh3FGLlKIvxu/Fo7bRcSC+uz2?=
 =?us-ascii?Q?zwiCv2kw5KMNOBnwStcj3HlJBE3uIyQRg4B90HD93pvt0Z9u15lr1F9xEmn/?=
 =?us-ascii?Q?FSl0AVFnehdaYAhZp4+qc9IYn5nk3KuqLs2OTJFPiizL56pEMOSnJtotP9Cg?=
 =?us-ascii?Q?G5iB6/OGrWOyTaEXyVFuQIUmXo1tpIE=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb6984c-a131-4b59-3d4e-08df2b6d0005
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 10:05:26.3758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2U35zTiFn3wHbD6mXsp2YFaQ03hbHEH1rdBrtNpshInQ5sfvG6IqpyhiUQWNu6ndD5Bamlr+BT/094TBUiW5QwFUNUaq/c3Qdp1L0eitAvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PPF0F153BD5E

Generic tty flush handling does not purge the receive and transmit
buffers in mxuport firmware or clear the USB serial write FIFO.

Handle input, output, and combined flush requests by issuing the
corresponding firmware purge request.

For input flushes, retain the line-discipline input flush and
unthrottle behavior.

For output flushes, stop new write submissions while clearing the
write FIFO and purging the device. Reset SEND_NEXT accounting after a
successful purge. Submitted URBs are left to complete.

Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
---
 drivers/usb/serial/mxuport.c | 76 +++++++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index 326a5ce18c6a..9d304fb3aa02 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -148,6 +148,10 @@ static const u16 mxuport_mux50u_fw_ver_offsets[] = {
 
 #define RQ_VENDOR_GET_MSR		0x86 /* Get modem status register */
 
+/* Definitions for purge request */
+#define MX_PURGE_TX			0x04
+#define MX_PURGE_RX			0x08
+
 /* Definitions for UPort event type */
 #define UPORT_EVENT_NONE		0 /* None */
 #define UPORT_EVENT_TXBUF_THRESHOLD	1 /* Tx buffer threshold */
@@ -201,11 +205,12 @@ static const u16 mxuport_mux50u_fw_ver_offsets[] = {
 #define MX_WAIT_FOR_UNTHROTTLE		0x0020
 #define MX_WAIT_FOR_LOW_WATER		0x0040
 #define MX_WAIT_FOR_SEND_NEXT		0x0080
+#define MX_WAIT_FOR_PURGE		0x0100
 
 /* This structure holds all of the local port information */
 struct mxuport_port {
 	u32 sent_payload;
-	u8 hold_reason;
+	u16 hold_reason;
 	u8 mcr_state;		/* Last MCR state */
 	u8 msr_state;		/* Last MSR state */
 	struct serial_rs485 rs485;
@@ -266,7 +271,8 @@ static bool mxuport_write_ready(struct usb_serial_port *port)
 	struct mxuport_port *mxport = usb_get_serial_port_data(port);
 
 	return !(mxport->hold_reason & (MX_WAIT_FOR_START_TX |
-					MX_WAIT_FOR_SEND_NEXT));
+					MX_WAIT_FOR_SEND_NEXT |
+					MX_WAIT_FOR_PURGE));
 }
 
 static void mxuport_stop(struct tty_struct *tty)
@@ -952,6 +958,70 @@ static int mxuport_set_rs485_config(struct usb_serial_port *port,
 	return 0;
 }
 
+static void mxuport_tx_flush_start(struct usb_serial_port *port)
+{
+	struct mxuport_port *mxport = usb_get_serial_port_data(port);
+	unsigned long flags;
+
+	spin_lock_irqsave(&port->lock, flags);
+	mxport->hold_reason |= MX_WAIT_FOR_PURGE;
+	kfifo_reset_out(&port->write_fifo);
+	spin_unlock_irqrestore(&port->lock, flags);
+}
+
+static void mxuport_tx_flush_done(struct usb_serial_port *port, bool purged)
+{
+	struct mxuport_port *mxport = usb_get_serial_port_data(port);
+	unsigned long flags;
+
+	spin_lock_irqsave(&port->lock, flags);
+	if (purged) {
+		mxport->sent_payload = 0;
+		mxport->hold_reason &= ~MX_WAIT_FOR_SEND_NEXT;
+	}
+	mxport->hold_reason &= ~MX_WAIT_FOR_PURGE;
+	spin_unlock_irqrestore(&port->lock, flags);
+
+	usb_serial_generic_write_start(port, GFP_KERNEL);
+}
+
+static int mxuport_flush_buffer(struct tty_struct *tty,
+				unsigned long arg)
+{
+	struct usb_serial_port *port = tty->driver_data;
+	int err, ret;
+	u16 mask;
+
+	switch (arg) {
+	case TCIFLUSH:
+		mask = MX_PURGE_RX;
+		break;
+	case TCOFLUSH:
+		mask = MX_PURGE_TX;
+		break;
+	case TCIOFLUSH:
+		mask = MX_PURGE_RX | MX_PURGE_TX;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (mask & MX_PURGE_TX)
+		mxuport_tx_flush_start(port);
+
+	err = mxuport_send_ctrl_urb(port->serial, RQ_VENDOR_PURGE, mask,
+				    port->port_number);
+	ret = tty_perform_flush(tty, arg);
+
+	if (mask & MX_PURGE_TX)
+		mxuport_tx_flush_done(port, !err);
+
+	if (err)
+		return err;
+
+	return ret;
+}
+
 static int mxuport_ioctl(struct tty_struct *tty, unsigned int cmd,
 			 unsigned long arg)
 {
@@ -959,6 +1029,8 @@ static int mxuport_ioctl(struct tty_struct *tty, unsigned int cmd,
 	void __user *argp = (void __user *)arg;
 
 	switch (cmd) {
+	case TCFLSH:
+		return mxuport_flush_buffer(tty, arg);
 	case TIOCGRS485:
 		return mxuport_get_rs485_config(port, argp);
 	case TIOCSRS485:
-- 
2.53.0

