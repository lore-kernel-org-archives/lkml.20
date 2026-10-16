Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013032.outbound.protection.outlook.com [40.107.44.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF7747534A;
	Fri, 16 Oct 2026 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145137; cv=fail; b=mILcJefnFxFHfkxAfhgtGlntEBcFoSnzeQNQe0M9lBEK9zk5uFfOSHEx4qTi+gbjrF9yMxH8Vo44kxuxfEK1TUyXsm42O8s5j1Eg90oNOdsNoOFZdYBgRzrRzMXz+fuGoNft8uPSgHXSlCY+1PnVHMTC5oLPSHWZ3c224HE78ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145137; c=relaxed/simple;
	bh=+avG2YXiIvFJQK8qc/6fBVgw0A3xwcY7ZC18mLXJhpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aXN2bTsz9K/VVeIQlFOxfwST3gZxvk3ubKkHNYsKLj3O5r/5mKUwWJKQpv2x7X1VYOmQ8mzt8S04R7mwB3CUcSY01ZZc6Oe0dXUhJmwnyN+eKVy1y1tIYOAcytzyDI3j1BHPu+64HOr8+9UZvYjPEK0dlFnD4k5OTCJdZsZ7Y3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=BgvpJqH2; arc=fail smtp.client-ip=40.107.44.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="BgvpJqH2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CrBGft85WJSmcz3W1reSVMmX6gzsxDlqM/s9YxBUe1AdsZLLYLz1ufs7bF38xcSOchFz0U3zVN+Gp4zYpJ4K2/KXDMOj02oF8721UJCxeDjPoUg9us1MpEO0//qRZdEbkUpAi/PXNxzTXghp+IgRvrvvydYwYFX4Hh3A4Jw+2AH5qZteghD8gdbQ30JWsQvsonEtFuxOC+wNmjG7tajL+SajRpBHVAVLxSej6wEnO7SgGvk+DCVuIwZB/jlonKpDb7pMSc7vQ0R9BA62yOBr8L5x4vkGtZHQHvBBmiOrdsUFJ3dm8RWZFqs+kqqsGvzTRC4cEFA5tvQRXU3uKG+uWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UrPtCrQUHyllNyVbiFNsdYuN4M5exhDM+G5CJvpsZE=;
 b=KtH9mgi4h2jKRFD7eJArUfLl/W3xVCeyXkLw74ZpQyrbFZCmh/Bs253a/tatKU9TzWUsOWTVHJd7NKnNb4mtIX9PQybByJkbcGO1DAcsq64wRP1v+ZTrXBs7l8jtPcKks+3RLLi0GnSTwbNNbWo1cMoa9RQtGb3z73YhncK8fvR8g0e1TCE44bQhSeoKIDYzNK6MnjTB5Sxqu0UcmfKWXfWCH1VzhZM/vz7SHeg7//vT84CyFiIa7abYRlJQ3pcs+f6VcXoIAA9bsjlzS3vc6TEMlFokmXX06N1VM3kawVRjjfZlHxAT0W2Y8xSMTdBH7T6GemXu1SV5GpBTYP0HLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UrPtCrQUHyllNyVbiFNsdYuN4M5exhDM+G5CJvpsZE=;
 b=BgvpJqH2WB8gAyUyLUSBM5iJts6P405BcB7sawqaof9+VF9Ls4CcXcLB9dSDolK6m/APObUqW7F105iaiRUrhNEJQ/Nb7juNJXmZ0Ua2TqM9alVj++GW6QH7xIlZpPSfTVpRQn3Oty+xCRcK+zYJwSzyP2JJYKJjtdeyM6mZazI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by SEYPR01MB5388.apcprd01.prod.exchangelabs.com
 (2603:1096:101:d9::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 10:05:27 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 10:05:26 +0000
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Cc: Fangping Cheng <FangpingFP.Cheng@moxa.com>,
	Epson Chiang <Epson.Chiang@moxa.com>,
	Eddie Lin <EddieSY.Lin@moxa.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>
Subject: [PATCH 2/6] USB: serial: mxuport: initialize modem status on open
Date: Fri, 16 Oct 2026 18:03:47 +0800
Message-ID: <20261016100351.681390-3-crescentcy.hsieh@moxa.com>
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
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|SEYPR01MB5388:EE_
X-MS-Office365-Filtering-Correlation-Id: 04343fdc-1e12-4f45-3b47-08df2b6cfe50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|10067099003|18002099003|22082099003|261009223027099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	zwBql3llOS/YrGHYmb4bYi35AzattoYBYUaUIgsAP3pEu/L01/nKrRV57Ka+dvDRgXN71HUYaw3kuhBTdVjYFCzkBDrDXY1aV/cy5PFrL7syM+k+a0PEPT9FzTqoVxpXQjX92bi5rgaTjkV+Qs9q/7xTFdovR413wp7KxN0PMe/vaqcndXN5QMndgkzo7iZD2X5rtPj50snwazEXmZ0BbHtcdaxUvs29wacFMZCfsIC4AenMKRNBxW4uik89LS87v/kabT4SxMS87Ykpb2s+2e7kWHrS75iIFKQ3nKzwPXv6o8+fDfPgE7/xuuNBK0onSc8CIwFRGnv14cGQuong/H5CaeiAThLm/kzgeo0q9u2j29cdn5SNz5ncHJ1W4udL6oRb/J0n/YuQlgIS+WIRsnrALLdsIHwIMesUbQ0/FxZi/EXxWhbh33DnfMmkMmOQKxrvCorvppMlyndRfMpCNMqfj9vppyGimPqOj3FMzL351HmPyX1uScS6wCDWncb5s1Qd+Y7ptIARc5jbLDWSiHjOucEW7KIZljkiV6a9LZDjzazdh86LYo9P4MATmj50XHt6jZ+SLFaOA7WNQDYGnninjI/JkrMhsUiA6bABSQMUAlQcZDEjM1FQUsy4vuWoyZBw/g4TMvgll2doCwBs+kgWsqKV6dUA7umkUCK82UQZ6YBWKCeO4KlETO+W8VK6kk5k1E1FoES1PqPyfg8BgaZannEDoV6dSxb85/aF1cA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(10067099003)(18002099003)(22082099003)(261009223027099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nTADIALScT5PHY4I8FgchEVw7ZjYQvWUQ8FGm62TQG1c/G5fz6kJvKusUwLt?=
 =?us-ascii?Q?J1p+8Lgfh3hHKXAPtIEYtsZCYF6sUDHrRlXZ1Eq4ae7n89pHwGXgRfGUXTVe?=
 =?us-ascii?Q?WKdkFCqDWVy88GsUS5Fd0rHfyHQvWjqPilIFFRS5YIKOvOw0uHPWo2u7z59r?=
 =?us-ascii?Q?VIKgCupzgDfnvFZX8x16R8a7FxXjOi+V6YZZ0lFyuu6kesJ/bv1WCYq1ug4c?=
 =?us-ascii?Q?i7UdiftYqCCbheKtvBUfqITNzrD2gi81LYqx5u6Q1I/v9nUqSMl2wM1R1xoZ?=
 =?us-ascii?Q?FSqxpkjUNqrXxxzkvYi1+mcpCf3UT+Gsac4WLc/4K09LNM3J5kLZ6ZcrtCIR?=
 =?us-ascii?Q?SKoJyhCcBBj4Oai5+N3lyB3em/CC4wzpheUT15toeYWofY5UKs6+c3bup/T2?=
 =?us-ascii?Q?fXjj/KHFfXn8On1BIdb1LRG56rkipvZ0ipW91wMuuBL1QNb5uinq8bnXUuxu?=
 =?us-ascii?Q?cuGeDccF68JNUm9v006r7/8HAKuNUYMxt6TSndt4MuuffKwaIVwJXx2S19kQ?=
 =?us-ascii?Q?NkkQTCVEKalCK7AqVvpR7hMGo0+sNYLDbUZ2MUuUnbe41KyIDQhjboB6+35N?=
 =?us-ascii?Q?5Ra0qobIeDwBw7MoV0YGu+e18SclR75VF//9Lv2fbUeoaE0GJcu8GmPQyg9H?=
 =?us-ascii?Q?/+OvB7LIv4H/cJebH4yKYjnO79LYwhwb2v1QjXGLGoAzR6nVyNT+6CqSYnd2?=
 =?us-ascii?Q?kLkBHwhxh2jBn+g3mG/F+QxIkb2NCQCw+L3NqQL8+nE1WcW5Rydvoa55KImi?=
 =?us-ascii?Q?wIRMssr2d1gq34Pv9x/cQTzZFray9C53mShN0ImZMArglGKcMD0DLoK2TBEY?=
 =?us-ascii?Q?JgvYKer2Ka/5Mt9bnYgPPIyq1iB6Ntq77u606HEp9dJCKuMEA+0GJm1rrGc0?=
 =?us-ascii?Q?pGb9msWxvH4fvMm0etdFi0palWDlddYKeJ6twvHThWDHnwIHcOEcREpnka/j?=
 =?us-ascii?Q?DNlVbhL6OsPiZ3f6h0BYZaILcpFCgRvokgLcphXcBzAwThquAFoodyRV3sEz?=
 =?us-ascii?Q?pEm2K/mAjIRRP7JUwj3Fdm9yrxWDLvVFHnM0soxdV15lD87pgSY2HWgis5jV?=
 =?us-ascii?Q?hYuQ63dNcLejOOkVuvnXAIkjOJRFX0V041sVGvm+Lg2Of46hHKrajjDzotzH?=
 =?us-ascii?Q?jQTXchbTqxTdB6+WHqPEk97JXqWqK5XDQ9vGEMO0QbQRbyEH+khFBHskBGZY?=
 =?us-ascii?Q?pPFLqYBpLyjG4bsaVH8o9c16cswyeKIatQ5wr8iCUOJRpFJLj86tTV6MGJOe?=
 =?us-ascii?Q?Zyi1ESyoRnxGmpxSkI8DJkjBlaKA5J3fLVkvmp0Dz24OrVkIVm8nP1q5T8vo?=
 =?us-ascii?Q?kdryZj0vpB/f9gO+hz7c949TtvhINj5doj/VaFPueY42+6gbstEKXIPYznqn?=
 =?us-ascii?Q?n2SDpPcAQiN15RL67Cidw2xxtL36P4REtIkJJHTCs5uWTueOGWpl4JfDLICI?=
 =?us-ascii?Q?LIiFcqDSlbrvmkJOmCoZ/CGLX0CauEcUhRVKIlrhpCByl7+TYG3E9XokWoBx?=
 =?us-ascii?Q?SRvDOM8KnUXqXQmDAHoUvY9+Z9R66pCde2qqR277eWzJQXc7goK2kfCkP4YG?=
 =?us-ascii?Q?3nswDdXIjjpnU4uEdKKc3C/IM+DdhWG+CTagJS+EbPhwbVaHMkHRmthxd3pT?=
 =?us-ascii?Q?HsaWx+y96meQTaFVaBIteikb4H8HMS8DXcse1naVakx03CPzT2Wows6m5Vz4?=
 =?us-ascii?Q?nUdvzdBn/MyKP+Szuj7dCNJGwbh+VMObkbl53Ik0qrxpZFrIACWOo1UpoJlk?=
 =?us-ascii?Q?WbnIo++lByq4cz61d2cubIfoFEIjfSI=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04343fdc-1e12-4f45-3b47-08df2b6cfe50
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 10:05:23.6018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMKaymorssnEkC4IkK53X8Z2Sd5sKBvm9E2KEkTD3F+MobApqEqIXEEVFU7r61JoDMaE1ALKmNIFTvLxoHAnBNVYYnNShjU/tyE/+MWiqsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR01MB5388

The cached modem status is currently cleared whenever a port is opened,
regardless of the current modem-status inputs. Consequently, TIOCMGET
may report asserted input signals as inactive immediately after open.

Read the one-byte MSR with RQ_VENDOR_GET_MSR after setting up the port.
Ignore the transient delta bits and cache only the current modem-line
state.

If the request fails, keep the cached state clear and allow the port to
open, preserving the existing fallback behaviour.

Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
---
 drivers/usb/serial/mxuport.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index fa75f844050d..3f1989afde30 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -1452,6 +1452,7 @@ static int mxuport_open(struct tty_struct *tty, struct usb_serial_port *port)
 	struct mxuport_port *mxport = usb_get_serial_port_data(port);
 	struct usb_serial *serial = port->serial;
 	unsigned long flags;
+	u8 msr_state;
 	int err;
 
 	/* Set receive host (enable) */
@@ -1477,13 +1478,19 @@ static int mxuport_open(struct tty_struct *tty, struct usb_serial_port *port)
 	mxport->hold_reason &= ~MX_WAIT_FOR_SEND_NEXT;
 	spin_unlock_irqrestore(&port->lock, flags);
 
-	/*
-	 * TODO: use RQ_VENDOR_GET_MSR, once we know what it
-	 * returns.
-	 */
-	mxport->msr_state = 0;
+	err = mxuport_recv_ctrl(serial, RQ_VENDOR_GET_MSR, 0,
+				port->port_number, &msr_state,
+				sizeof(msr_state));
+	if (err)
+		msr_state = 0;
+	else
+		msr_state &= ~UART_MSR_ANY_DELTA;
 
-	return err;
+	spin_lock_irqsave(&mxport->spinlock, flags);
+	mxport->msr_state = msr_state;
+	spin_unlock_irqrestore(&mxport->spinlock, flags);
+
+	return 0;
 }
 
 static void mxuport_close(struct usb_serial_port *port)
-- 
2.53.0

