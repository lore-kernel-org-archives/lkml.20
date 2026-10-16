Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012023.outbound.protection.outlook.com [40.107.75.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC0B44AB68;
	Fri, 16 Oct 2026 10:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145132; cv=fail; b=jvw+tuDraFXCiWvmN+ZCrptMFA5I46P7KRCzLb/ko2fo0rO5MfAOKnC8warEmfUjki18w+qnA5rpGuonT406jCuywjCY9JE8bAglhiZzbu2Jb+ku6BAemoInKb3u0kqyqIFMnOSICfPQ+AzELXf+qffWfZL+PCcopu+SM1KJwQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145132; c=relaxed/simple;
	bh=HXKhrZeG/vm9DlXFFG9XVtA+WLWpoEa/6bfjQyRPBhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s/QpQsobGIQS/GHaRa2aVDADwSzYkne3ZsHRuyueIDOj4+KaZjROfXQ8lEBu1laIU0v8C53ugCzvLLk1RjcH3UcfV5kYxrjVw9iE5zv97HVaPNig+965sHai3573uOxK5Vm2AJkiZ/00UtMj2Jrj1DLomv8soiXrIG2y7bJhUCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=IcdWWG9E; arc=fail smtp.client-ip=40.107.75.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="IcdWWG9E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RO+cunQ6LrsBD2HekfD7emwibbd6hAdLF45Jk1NP+hpH2qbmussXU3Y/kMijCoyMh1RVJoZngUGDF2NIzQzfVAy9ICcP4EZvW/oVZ6Phuw2XWLQsLzHEJKc5HZVBiWUpsD1HllAcym79NOH1I5jD9FRXmfL2Y0cpnurq6hLR5Tyb8Z5AqqE7g//l3ceNAInh5BxXyEQ0QccJ8L7aC0tqVTqpbgKb8MpUI7vEwM6GWlBlI8YJJBwDOHyzQeps8cUy3/1xBLjqDb+DQ78opp6DZiFS0iVWYy46Ziirec1szAIWutVKzk3jCN6kCtWmIGpLuTKGxPK7vK5b5a1MkTxNAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFHuvhi69eXkT19Q40w+f2lQT++32QBGa2GJVjDDLa0=;
 b=sXzOGlS6Wnb2WYhxyFUvqsR3WjlzBWfnh1At26jIUNsWro4QZGo7Im0cGWq9+XXxzh0jvbiYac2i6f1CcaLP2qNIReSjIQdQs92pQ4K+8EuF719NowJ7Ml5cBU8aJSF2oitWjFqlIUCuestWreHAZlkKagxR8OFvmP2BNIH38qhGqLK5sTYGySLIg8xM0ar3q0iw94pTyFk6arPXofkcmsL8t0ScWMUd4J9lWBVYuxlaG1jafTnQkHdpXdX0/gbXKWo/5d6+3/G6UGnbbTSUHg7YkNGsdDCECblmrfAtxk1fDwMkTKsKAuPci6auhLWw52K4LGhuk7Swy46Dt1BcBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFHuvhi69eXkT19Q40w+f2lQT++32QBGa2GJVjDDLa0=;
 b=IcdWWG9EMnSjMUV/YhxpoutvL6OXt4NzpDxP4MvmxjlUJNNA7valf3qFNsEc8VVxp/VywSEaKYz2shHGQ3l5pxjuxoOIqxpWtqKFgo91ztCWgdqK73eDYzDL3TIJmVX4PwIMzCR8EvQCq2J3gb9BMTI3J6k3KfLD2Zx45JEEhzM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by SEYPR01MB4485.apcprd01.prod.exchangelabs.com
 (2603:1096:101:8c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 10:05:25 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 10:05:24 +0000
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Cc: Fangping Cheng <FangpingFP.Cheng@moxa.com>,
	Epson Chiang <Epson.Chiang@moxa.com>,
	Eddie Lin <EddieSY.Lin@moxa.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>
Subject: [PATCH 1/6] USB: serial: mxuport: use usb_control_msg_recv()
Date: Fri, 16 Oct 2026 18:03:46 +0800
Message-ID: <20261016100351.681390-2-crescentcy.hsieh@moxa.com>
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
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|SEYPR01MB4485:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d27e474-19f3-4123-9d7d-08df2b6cfdbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|1800799024|366016|18002099003|22082099003|10067099003|261009223027099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	6pGLspSd9G7TTPNqtmSwsWHnFplyGQnMh5bHg34x08sW1q6gmaRCuUCcX26vgVOazGr40cu1sSzCmlC0k7OPifZRJe37Mt+1Cr78pF/IGQUy4zkqJIrtupAkEIxY08tc6WJKGGlt7lLiqxskRqJFFGuY7iUDJdTtHvpu5qtsf8FJ5FkMNcZlAiyPGwPy1UGyN2dAwl/M4wqUN0dkI3PTggGQBWTZzXWH3MDULctb5his869ud3JPvNuxG0dwNTy5JKlWBeCbbtoIBJVORYMUHolN7smZlsAFfcsetUw/r0M5qNEU8UbGnrWnLuVE2d6C82vT/UvcV+YZ0nsViH0exQnOlGGpZ+D2Y5c1dwCBd5cH/emSwG7qucL5LQxC4cNmR/bKFKRel3VSyMMsIEPF2qup/BRD6FE313an1ZpJQgeiNFhW64iA+qHEszRntRT8J0axcB1mrwOwXrkSYYZYzcd0OrpkAIjW1dSnn9jC3laZ/CRwYXAEoRBjJrmOSO44qwIA+6LW1+uiLgD0cAjl41q18Jn0XiMpHzFH3JHSLSOVQiJIe8/AoZLd4pQpOlSuhDVnKqrAazATtXLFrzuadAFHgajL4DY+MulDyGR9ewCsFQUwLKlya7i9a2EEg6ihNM0fsFYborjEhmpKpar0XoMQVYucAOE3lzWwQAgGNgVYDW0TwkQsWc2fAeeSvad/JkWV6t0kAsnKrsbGN876Lo1eTPBZ8jqQOhwWGWBKdlY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(1800799024)(366016)(18002099003)(22082099003)(10067099003)(261009223027099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J7yZg/brSC7708xPTqIYsFIZd/IVZm5TDjYtX9l9mbVAKNOScfVhyG/ZvnrI?=
 =?us-ascii?Q?njmmaZs9soIpS8id2lPWzaFgTY/W4F8oMxrlVtlwMXJmoWfMb8IT6ow0jqvb?=
 =?us-ascii?Q?WfDLPl3lS5DXNJHdJN8gK0406qSztdsxumbW6jj9MTDSOD1+ReUv3PsEJRQp?=
 =?us-ascii?Q?QpaqbTL9KerMKqmdCxFRCV9JbcPUknSQ9rsdGI3etXECDiZr9LHHbZOZt3wZ?=
 =?us-ascii?Q?ZWWr62zSMnDFs/neQmDUSjQ0MuUY96syEg4rP1aVmqzuYr8vxUK/u7d9pF2v?=
 =?us-ascii?Q?JBNTEnjdec0is0neBuVaw2/FCJd8OUfuFAK8+g7ODaExV0yCcWk1SbNQclxO?=
 =?us-ascii?Q?pgHeJv4U2YRQEidmFBwHe5hsDH/4q5sEdY5i9kX+jT41ZQ3TKO3T8ExmLa/B?=
 =?us-ascii?Q?bqQmPcHnjUT/n7qmkimHXko1w3r3CXkX31KNvGpbX1tVXGoBvHeqrYS2vX0o?=
 =?us-ascii?Q?2rjuDnmgCIIs/w+zI2gPnQVl3OptOS33rEIj5wKDoO3AQU1/7/HnAnHlME9H?=
 =?us-ascii?Q?mVEXAVPvQjYFTriExuK/Q1yDmPBAZWnNAQri1rM/Ue9JKSfvnqKkB+ApWRoB?=
 =?us-ascii?Q?Pk6tJxxqZ4+rZX60B5rnG5W2LomVMETrDi121auGXNjRlCQHcw+nIxGSvq3r?=
 =?us-ascii?Q?4qy2+pOP0XGrYdSwU5TeOKrDdhgg8S1bh/KfTWpA53sYgAkbgzO6ff6Mkucs?=
 =?us-ascii?Q?dhlsOIw8t+uDFfziwdeOY7DVrxao8kj485yDHUcvwu+aP5/A8Sai8GTGTLEm?=
 =?us-ascii?Q?W23losJOAQQTRs56V+S0Yghm5EWXWZAGAbcj0MJBwI/A5Uswo4t1k5in2+Lz?=
 =?us-ascii?Q?z39OQfreibKWp0zqVOIHXU+G+UPUYlhwVyLEH3iy7uuhJGpOaZe3dhSgAhdr?=
 =?us-ascii?Q?ZtKiM3oGExisXgOUABFD6+4/1seOGfoABKGZECGpFpdq/bWf8tXwM5CRPq40?=
 =?us-ascii?Q?SY144P0OQvNqQZ1wUv0DNaRNd9hN0KrFIWImB4NfaWif5z72eLTgTfpxoFE5?=
 =?us-ascii?Q?al3RtctVlFGFUsCAUjg7NI3tzpixT1joDTWANtwcq8bilMUi4JBZQkxG8OVg?=
 =?us-ascii?Q?nDoXaA3o8qOXc4Wd+D9+X2kxMsBAw27sEUTPQGZC29yjgPyThfQFvaqn4b4M?=
 =?us-ascii?Q?+6jJ1f04WpnGd+lao1uFINOJzfXVyvEGBiPKeBw+yrScczMjqgb62s3wz+FV?=
 =?us-ascii?Q?QtjGdtb/IttvrugQCqk3c6828WsSOebTbKkAn+NiKDcBfbCpHBRXrhY7gIE6?=
 =?us-ascii?Q?AeoDjOdPwhxdY7c907KAhdPcTH/CjMB28dWJaV3R1Q8TJgU07Z7uEtZVz45m?=
 =?us-ascii?Q?p6HtHoTKK1dyxC2UIYLxFvxrneyWqvIcW3mcDULXoxaS1gq07wrBZ8nIqT2j?=
 =?us-ascii?Q?AlKCQXSNoRHFTXJP1DzY0iKD+Jgg/AeRHZzMWxkaKE5zdA02LrjD7MD2l2lz?=
 =?us-ascii?Q?nMTuMOvyGSnAPNZV09Rlik7V27bFiuDuvbUD/AWKCtBuatTK1e+gE0wKiJtg?=
 =?us-ascii?Q?tlO4ni1vcJa8uFpD6qlYRxcZyPZ/J1zX9CMUlFblgNdMq6bjjmZvSIF7Mwcp?=
 =?us-ascii?Q?2QWD+zKRozhxivOr+9g0ghqamp/5pbA5wR1Ta8iKTInwsQ2M63o5hkfsLSu2?=
 =?us-ascii?Q?00J33RXWp8Is+FxKG3t6CF1ZBABM7M/2WeICkcndNkfrx9/i0ZiaNR2mFe4W?=
 =?us-ascii?Q?kaCEFrowm6lPlCHiRl2G5aANgiX+nNO18UrwVWuyolzlfoDW/EF9FLkZFBoh?=
 =?us-ascii?Q?jF1GNS0YsdwhiMJ6YTucO2MV9OXjuqY=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d27e474-19f3-4123-9d7d-08df2b6cfdbb
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 10:05:22.5979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IROxJXt2ISz3YvY9PsAvl+63eq+SHcG7i97Pksq6V8t0DqLwI+OKXfSTgy8aqN+nE9m0KlyTWHx6Ph942xa1uJ/4GEz4bp8fAAd7nS7bk2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR01MB4485

mxuport_recv_ctrl_urb() uses usb_control_msg(), so its callers need to
provide DMA-safe buffers. It also checks the returned length itself.

Use usb_control_msg_recv() instead. This helper provides the DMA-safe
buffer and reports an error when the device returns an unexpected
length.

The three existing control reads all expect four bytes. Use stack
buffers for them and update the callers to handle zero as success. This
also keeps the original USB error when reading the firmware version
instead of replacing it with -EIO.

Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
---
 drivers/usb/serial/mxuport.c | 100 +++++++++++------------------------
 1 file changed, 32 insertions(+), 68 deletions(-)

diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index 319704e64528..fa75f844050d 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -311,32 +311,20 @@ static void mxuport_write_rollback(struct usb_serial_port *port, int count)
 }
 
 /* Read the given buffer in from the control pipe. */
-static int mxuport_recv_ctrl_urb(struct usb_serial *serial,
-				 u8 request, u16 value, u16 index,
-				 u8 *data, size_t size)
+static int mxuport_recv_ctrl(struct usb_serial *serial, u8 request,
+			     u16 value, u16 index, void *data, u16 size)
 {
 	int status;
 
-	status = usb_control_msg(serial->dev,
-				 usb_rcvctrlpipe(serial->dev, 0),
-				 request,
-				 (USB_DIR_IN | USB_TYPE_VENDOR |
-				  USB_RECIP_DEVICE), value, index,
-				 data, size,
-				 USB_CTRL_GET_TIMEOUT);
-	if (status < 0) {
+	status = usb_control_msg_recv(serial->dev, 0, request,
+				      USB_DIR_IN | USB_TYPE_VENDOR |
+				      USB_RECIP_DEVICE, value, index,
+				      data, size, USB_CTRL_GET_TIMEOUT,
+				      GFP_KERNEL);
+	if (status)
 		dev_err(&serial->interface->dev,
-			"%s - usb_control_msg failed (%d)\n",
+			"%s - usb_control_msg_recv failed (%d)\n",
 			__func__, status);
-		return status;
-	}
-
-	if (status != size) {
-		dev_err(&serial->interface->dev,
-			"%s - short read (%d / %zd)\n",
-			__func__, status, size);
-		return -EIO;
-	}
 
 	return status;
 }
@@ -682,29 +670,19 @@ static void mxuport_process_read_urb(struct urb *urb)
 static bool mxuport_tx_empty(struct usb_serial_port *port)
 {
 	struct usb_serial *serial = port->serial;
-	bool is_empty = true;
+	u8 buf[sizeof(u32)];
 	u32 txlen;
-	u8 *len_buf;
 	int err;
 
-	len_buf = kzalloc(4, GFP_KERNEL);
-	if (!len_buf)
-		goto out;
-
-	err = mxuport_recv_ctrl_urb(serial, RQ_VENDOR_GET_OUTQUEUE, 0,
-				    port->port_number, len_buf, 4);
-	if (err < 0)
-		goto out;
+	err = mxuport_recv_ctrl(serial, RQ_VENDOR_GET_OUTQUEUE, 0,
+				port->port_number, buf, sizeof(buf));
+	if (err)
+		return true;
 
-	txlen = get_unaligned_be32(len_buf);
+	txlen = get_unaligned_be32(buf);
 	dev_dbg(&port->dev, "%s - tx len = %u\n", __func__, txlen);
 
-	if (txlen != 0)
-		is_empty = false;
-
-out:
-	kfree(len_buf);
-	return is_empty;
+	return txlen == 0;
 }
 
 static int mxuport_set_mcr(struct usb_serial_port *port, u8 mcr_state)
@@ -1229,51 +1207,37 @@ static void mxuport_get_fw_name(unsigned long features, u16 productid,
 
 static int mxuport_fw_running_from_sram(struct usb_serial *serial, bool *from_sram)
 {
-	int err;
+	u8 buf[sizeof(u32)];
 	u32 reg;
-	u8 *buf;
-
-	buf = kzalloc_objs(*buf, sizeof(reg));
-	if (!buf)
-		return -ENOMEM;
+	int err;
 
-	err = mxuport_recv_ctrl_urb(serial, RQ_VENDOR_GET_SYS_REG,
-				    MX_SYS_REG_REMAP_OFF, 0, buf, sizeof(reg));
-	if (err < 0)
-		goto out;
+	err = mxuport_recv_ctrl(serial, RQ_VENDOR_GET_SYS_REG,
+				MX_SYS_REG_REMAP_OFF, 0, buf, sizeof(buf));
+	if (err)
+		return err;
 
 	reg = get_unaligned_be32(buf);
 	*from_sram = (((reg >> 24) & MX_PWR_REMAP_MASK) == MX_REMAP_TO_SRAM);
-	err = 0;
-out:
-	kfree(buf);
-	return err;
+
+	return 0;
 }
 
 /* Get the version of the firmware currently running. */
 static int mxuport_get_fw_version(struct usb_serial *serial,
 				  struct mxuport_fw_version *version)
 {
-	u8 *ver_buf;
+	u8 buf[4];
 	int err;
 
-	ver_buf = kzalloc(4, GFP_KERNEL);
-	if (!ver_buf)
-		return -ENOMEM;
-
 	/* Get firmware version from SDRAM */
-	err = mxuport_recv_ctrl_urb(serial, RQ_VENDOR_GET_VERSION, 0, 0,
-				    ver_buf, 4);
-	if (err != 4) {
-		err = -EIO;
-		goto out;
-	}
+	err = mxuport_recv_ctrl(serial, RQ_VENDOR_GET_VERSION, 0, 0,
+				buf, sizeof(buf));
+	if (err)
+		return err;
 
-	mxuport_compose_fw_version(version, ver_buf[0], ver_buf[1], ver_buf[2]);
-	err = 0;
-out:
-	kfree(ver_buf);
-	return err;
+	mxuport_compose_fw_version(version, buf[0], buf[1], buf[2]);
+
+	return 0;
 }
 
 /* Given a firmware blob, download it to the device. */
-- 
2.53.0

