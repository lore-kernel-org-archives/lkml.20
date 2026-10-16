Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012032.outbound.protection.outlook.com [52.101.126.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2D7395AF6;
	Fri, 16 Oct 2026 10:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145136; cv=fail; b=aGqBk8MeclzdMSaA6u0tgFs2/XfDthkqqDlRAG1shha9D/qTOUVIKTBy8ba3TeGYy9xwt4f12sk5WZkTOD0s23LOYTSJ+Ayg0DaoIZRijbXsZ5QeYGWUfxan0GG/dF79ZS8N5snFotI9BC38nzJe9pPs44hZ6kd+RDerEM+W/N8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145136; c=relaxed/simple;
	bh=TQvOaNe/zJWZeS9Xe82P4sKFmc7/14jNUw8ZQS1W+e0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DSH5R0dDF+DMd6w6mv7A3SFmDqNuJrxtKMwTg9FYBiWMYOv0aOEufJqEosrOKiE7ybrF1L/O2z/wvRzEvL9ZzXi+ajnFNpw5PCD6OzZW+AzS4hKgAN5RovGoQfyXXqAezBa5FzPToe9aq/8yWLBrBMg2qlyCjOoqluImKqM1/84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=QGMnE7nl; arc=fail smtp.client-ip=52.101.126.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="QGMnE7nl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZpvYwjAUYWiXY8/2rc6u5Jrr6BtnPT8YNxTSfHGpFCGVVh8REHfG9MqG6f+1OsKKf/OfsLb/Bu1gwHdPgm/KpJ2Ho3bMxUBNbJSRQhKBKxjbCoOqPICtzkau7EnP2wJcQ93o+nSwQN3dDxNzmsmPisA1G6UyZfR0cZIfiVmf1rSjvOJjGxHF8FPzGupQKuAtjHG/fhPeHB5f7XiuXqTYCWpOjMURO4F5QL+VBTJOS+4VK3RxTlYbazPOdRLWEp6/a4foppQBgmgsiXc3K20AUdIeUbAuIG5Iw/vJzL9D2JRxPqsadPOvlSinZJOpCVIPNJGCzad7w7RdnOtUcgYQxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5woM/VNMHGtKZug0pGJKWYoBy9EOpFMMDPqeOOgkA+0=;
 b=L0dv+5ms/QNBEue/49Wi+WokpTkohiRA282EEcR+Tk7KNXW3jHGHpwg6xVS3EbrDfsqhN/K67RJ5MU68eaPWYuEeTcYFHEqo2lxeWN6SqfirbUXH+16mjeDRPPUyHicktK8tB3j5smyql16Drm36+GCUneMSUN/fmtStI/BFGyEBBxxUani4BmT9Dx3aFrx1+znLmkmv+vbYUiUghkh+Lt5OpHpYyVn5pXI9fkI79ybE80trUI/t/5K1ZlGQJTWfB8Z8cCryQxDOlzajRUKoJ9m8uaLw5Eg4nzqY09v5EHWTahYJZjiElCYRr9F7w0ghk/K+CvXs4R+lh7fnQeMVmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5woM/VNMHGtKZug0pGJKWYoBy9EOpFMMDPqeOOgkA+0=;
 b=QGMnE7nlvgaDLzdRd7/Dv9tkNlbqmzAFMZ+81PFDEs1W10iw6Ij63pQ1T2IUCKT/3gppYGBkb14TUNhG5t94pRhy3tmtGwfv4vwVXqo3Hdco4WgZ4yu5U0Io3vOoaTm6WmoPEvCIs34Urgx/8qoBiPqiUotHJFZ/aDGFsmqesQU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by KUXPR01MB8120.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:a1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 10:05:30 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 10:05:29 +0000
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Cc: Fangping Cheng <FangpingFP.Cheng@moxa.com>,
	Epson Chiang <Epson.Chiang@moxa.com>,
	Eddie Lin <EddieSY.Lin@moxa.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>
Subject: [PATCH 4/6] USB: serial: mxuport: handle output flow control
Date: Fri, 16 Oct 2026 18:03:49 +0800
Message-ID: <20261016100351.681390-5-crescentcy.hsieh@moxa.com>
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
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|KUXPR01MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: 72dfd3eb-36ff-4893-2db1-08df2b6cff9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|23010399003|38350700014|56012099006|261009223027099003|10067099003|18002099003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info:
	sVXZ+2g9ySIBH7WtcdLWBsciOIifPKKnRT0vlirou5qvUBE0iaJ18lA6ddG541jjthPMupJhD3ok/ruanNn1NTuttqYEMdb17kI/+pjCz/VMxO/C/Pf8cr8P8fgVw+qDlsMn7e3/TZO+gh8ZwpoZkEL8T4FqsXrHMKktKT4dMvxt+49IiKBZgpZ8Oy9bi9a8meIchq9TqdIplBzaCwpL39xpVRxDEUj7qdXmwFN6TQSuVhUbFukN66X97lIrn6od+c0OZ3nN+pYfiXtpaqW3ES60fL2HNqwlb3mQwpYTIhiKHRQgD6+YKEweQblZwS7ljxx7+oUCLSrSyM8Zd8gMe8hnpkxahlslb3vXY803alLhihg4hVJ6AOQCR/UZQ7POhabretVdqRCm+VDEXQY/hDH9V0O4TKvxJfYdesndF/f1Rz4m0OuEQgentOlcOOqVFUYfPnp3J7J86R5GXlAkx5IuFJ1WwaQEz0EB8zPVDc/r0xHorrcege+C+ZUKZJ7UBwR4Cxj5loHreQTSKyA6yy5Zg7ykg/zGZWll/x4BzjkdK9MoTq2XJLVeGIq8sULs0BLRjcA1B49uxVL9vPqGHp34hZbEBt61hoE5R37C9aqSTxpuKoxSu9EguGSVQO1oOH8gVrtLZtpWoZyZKPHgC4siqza9F55v3Ru1xdVrAQletRE14laxRoj5a6u6wjrfVFWbRGzuiD0wxnb130FXoRzR/oyz3Blas7msvl5TvLI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(23010399003)(38350700014)(56012099006)(261009223027099003)(10067099003)(18002099003)(3023799007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FJhWgXJN/smP7PAWZVwDlTi2lT/e6Z8vsHEoJrg+taIuorV3QFmPt2SWONsz?=
 =?us-ascii?Q?w7m0U/5bC3t5s8NSnt0emA1Xbr1FyvgH5iHKP9rStTla9a1zMKydtssT2487?=
 =?us-ascii?Q?l1e+c02ciEVdhmBD/S9ZJO8OiBKVUQ7pqYQVVdlrW7llVijVVvJn168eggQA?=
 =?us-ascii?Q?ohBrKOwS0HYP3kvKksiGdGxjdr/pLOfiWIxKmHhPaZ1/9AuX9dCJGu/DhzFS?=
 =?us-ascii?Q?/GE8fzhMyENN3cy3OGdxneWh7S7CUj8Chy5zKoxCcuy7A8b1WztvVT0E5KAx?=
 =?us-ascii?Q?5Du2TcnwRz9FfAFFi5cw0/vvKqlw4EfYEpl6PP+abEx7jBRsTp7WmVUmFWA/?=
 =?us-ascii?Q?E4ztXqfBNYIuAEuEuOMY4tjq+gxBKtoKzo3zeFsqhvnBHmTIssAtwEcw+rdp?=
 =?us-ascii?Q?ajtyy7dxMfvt7zoHoRxHi5jlEr1hD/wM8BzE+OnV4599xmzUCozIAF4oE159?=
 =?us-ascii?Q?TUiTVrEkkqosPMvXkcVqnt74cVEG+GNp1gm5ZbQwDwpph/bKFcqHRjzBvCqU?=
 =?us-ascii?Q?/rC4SZHZ81Ua58kKvIr2+OhuhnBKVIMv7Sa3JDCmufmEExYpQxAR+GprZr53?=
 =?us-ascii?Q?uRq+f9a0luw10zyojb2anc+tpM7AS3M+diVf38PFSV4prArKDvVkZOEFDYtv?=
 =?us-ascii?Q?8l+nL9/lG8LPniNsQ14u8QLRHuIAeFLw2jZtazbjSi8jU4KOI5abHjfp+Nrr?=
 =?us-ascii?Q?LS6taMNZu9Y/BQBuKDkw+WthpgE4JZg/WdElh11wjK5+km1uxBRRGNb6zdcE?=
 =?us-ascii?Q?os+HQCiVeAzjl9Ns2BdYbppxkheyzFERtmbr9hceiUfoiVVua3Ckms6WYU/W?=
 =?us-ascii?Q?CmZJyujqtk3BS1Ff4gz+w8ZQgPWlCBPdSvKHwIrtHBg0R2uhOH3QBbjBPuQZ?=
 =?us-ascii?Q?Gf9a+nGun0wxoyEvMrucS+dh4mj3XRNvYWF/Qu9zwz/b6RzltE+muAFK2vyl?=
 =?us-ascii?Q?ZbCA7zgagUjk95J+IZf8YSxW6maedfbn+8cTrX8aKt7m47mEsgER8gOcUaR0?=
 =?us-ascii?Q?YTjkLxDMPrY+WcEj4zgKsQIolKR0qQ5s0zX6DwKvtoHrpsUgusd3wdDC9E9c?=
 =?us-ascii?Q?mCzGJleep9YbjxjAOnSYfvY0/llq4cgha6sItXfn3MaHbyaoiQvkMuzOcf7+?=
 =?us-ascii?Q?UAif9y6QkIBuIK31Uz21aGdBf/JtNdJB+U9fLed0LidSmCOmQazMGthVWLwZ?=
 =?us-ascii?Q?/mQbXvTvfVyH5bfwxmZ2MxW0UDAr9eToHZUJcniJK5chn/XAgpCT9gh8xdo2?=
 =?us-ascii?Q?5N7HdKIE9zX02zDXv7QivhyqowL/o/keCxrahW4G6TSbzibOzeBVLL1GvN8K?=
 =?us-ascii?Q?JdpkIQNuUC9KzN9oBxPq30kcSIZ3Wdzx7YoqHd5U3Ga9Eve7wRAoiqbFACw1?=
 =?us-ascii?Q?B7ZcLrZeM1+HCDRFOvgK47/n90i9/WLzORWu8mUBuFtmMbeQT2R1P74pfOzJ?=
 =?us-ascii?Q?o2ADMJOwb8mOfONunNAPTWAbyEM/SNzWh7pjuaSvtdEEfNQikvEX9BHve+e5?=
 =?us-ascii?Q?Aa64eU0HSnne+O1ZpCsGDb6WpmML7F2mkHpL9W854eaKmcQRtZsabDUrU8oL?=
 =?us-ascii?Q?syVrf/EWCQqlXrcpu2NwBXhQTznWh8kXQq5bxW4wUlM+pqecGfksW/KXjjQt?=
 =?us-ascii?Q?OkJ78DeT0rcQHJtRKQRmQ831/47+0Nfo8tRqcYGlMkjxUbNR5TS/nNTGDkQR?=
 =?us-ascii?Q?nNdx7n9bRuMvtUE1D5rS6TWNZji19EY2sFB6A/EKQJ7GrhLkYhnKTbxj55+7?=
 =?us-ascii?Q?v7KKeUe8z407PmQgkXE7KV98p6LR1Y4=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72dfd3eb-36ff-4893-2db1-08df2b6cff9c
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 10:05:25.6150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BnPV+zvu6H7ETknRy/DeMDkgcDl8S9dPY1sjeTMg5L6Ob7mvzHg4CgcybsALFVjpXcLh+hIgg+vKlxUlpp7vKuTgcZJAklCRrXW3lWdZS1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR01MB8120

Use the USB serial stop and start callbacks to prevent mxuport from
submitting buffered data while tty output is stopped.

Record the stopped state in each port's hold_reason and prevent further
URB submissions while it is set. Keep this state separate from the
SEND_NEXT hold so that transmission resumes only after both conditions
have been cleared.

Clear the tty stop state when opening a port so that a previous close
does not leave the port stopped. This only stops new submissions; URBs
already in flight complete normally.

Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
---
 drivers/usb/serial/mxuport.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index 3f1989afde30..326a5ce18c6a 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -265,7 +265,32 @@ static bool mxuport_write_ready(struct usb_serial_port *port)
 {
 	struct mxuport_port *mxport = usb_get_serial_port_data(port);
 
-	return !(mxport->hold_reason & MX_WAIT_FOR_SEND_NEXT);
+	return !(mxport->hold_reason & (MX_WAIT_FOR_START_TX |
+					MX_WAIT_FOR_SEND_NEXT));
+}
+
+static void mxuport_stop(struct tty_struct *tty)
+{
+	struct usb_serial_port *port = tty->driver_data;
+	struct mxuport_port *mxport = usb_get_serial_port_data(port);
+	unsigned long flags;
+
+	spin_lock_irqsave(&port->lock, flags);
+	mxport->hold_reason |= MX_WAIT_FOR_START_TX;
+	spin_unlock_irqrestore(&port->lock, flags);
+}
+
+static void mxuport_start(struct tty_struct *tty)
+{
+	struct usb_serial_port *port = tty->driver_data;
+	struct mxuport_port *mxport = usb_get_serial_port_data(port);
+	unsigned long flags;
+
+	spin_lock_irqsave(&port->lock, flags);
+	mxport->hold_reason &= ~MX_WAIT_FOR_START_TX;
+	spin_unlock_irqrestore(&port->lock, flags);
+
+	usb_serial_generic_write_start(port, GFP_ATOMIC);
 }
 
 /*
@@ -1475,7 +1500,7 @@ static int mxuport_open(struct tty_struct *tty, struct usb_serial_port *port)
 
 	spin_lock_irqsave(&port->lock, flags);
 	mxport->sent_payload = 0;
-	mxport->hold_reason &= ~MX_WAIT_FOR_SEND_NEXT;
+	mxport->hold_reason &= ~(MX_WAIT_FOR_START_TX | MX_WAIT_FOR_SEND_NEXT);
 	spin_unlock_irqrestore(&port->lock, flags);
 
 	err = mxuport_recv_ctrl(serial, RQ_VENDOR_GET_MSR, 0,
@@ -1574,6 +1599,8 @@ static struct usb_serial_driver mxuport_device = {
 	.get_icount		= usb_serial_generic_get_icount,
 	.throttle		= mxuport_throttle,
 	.unthrottle		= mxuport_unthrottle,
+	.stop			= mxuport_stop,
+	.start			= mxuport_start,
 	.tiocmget		= mxuport_tiocmget,
 	.tiocmset		= mxuport_tiocmset,
 	.dtr_rts		= mxuport_dtr_rts,
-- 
2.53.0

