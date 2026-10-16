Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012053.outbound.protection.outlook.com [52.101.126.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8B8378D7B;
	Fri, 16 Oct 2026 10:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145130; cv=fail; b=PVAtPKyNHyWMhpsaRhtqxOryulpMBJSVXpcGcBm4/IqVNUxqq23JDOioH13va+zgHMyiAzQZkepelWoD1ytc3o/n6QAeLvr1eI2LkXVibRvFpQjrtMFe8WlDrG+rqznZ2oT7XMsH5EPu53Y7pVU0Vlu2IZhqFoBDb0JZ/79gbq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145130; c=relaxed/simple;
	bh=MUd8qX08/P9vCqJIDr8GEjmOx6LWJBLUTACqJY7DMew=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=WnOp+qtI073jwk7XilJ2x6ie0EyJq/Fqn2/YFMGVBgJaz111oBkA+IJPWvGd8wFdcR2ZLjJs3HFfC34/KSAs/brfxHHK4uAGJkTQivLf61lSREK+A7cU2Kz54h544yD047tC/glLfRl8LuHzdwvhfiB4i8UHDxujUG65y6o+TjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=GVaoSiwj; arc=fail smtp.client-ip=52.101.126.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="GVaoSiwj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UfAOZZiWr8eI/qJaO8yGYJ+oFPDEeyXQwdtPdRW60CPHjg7TCiZ/CbInysC3tv8J5kWEElKlafJrcupPZR5L2DkAzEQRACEfWVTus6BfJjFSUOWheB8fiAAjlbxFYG06QXvUCmPewhC+EXu5QeLJkeeBCPXmVPkrXuYf5fuFDBH6de5z2tLb/IRncMZPgX5X1NyOa49Oe4mqyYsB+EpiJCGQaIf/bulZdB9UCxUwFBvhcIxwg35245JYRZKbFPW6+j1Up5Av6PkVmI5dXexmOxEdhakVxznXTRuZ+7JuPHFyFEC/OHtSzj8iPKScRL2yKKAcjprAUQYNqp/EHoqUbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0Oir+aKJjF5xyPUy4jjBvxVUXStdRmRWE2HxUVDro8=;
 b=rpBAQLlrUuQizGJwH0a8imMLktOazqt7qUcQBQ1FPVEKs9xIuQcbERiNOARMX6QXuP8yoLrzGjz5G2li2UhTaLNlafnFmuq9XVRtH1GBMwiDf7Krioy5hrAyNrzy4Jb6Wiu4uBek2n7h7UFTsXhac0vj0lWC6Xgw0zVmGXNU8g+TNLeaZjtUMtclxrr1SUvjTi+VP1tFXyCA6Dii9SwMC0KeV7n6dYhHeCa9+OwFom1H9zfMCgIkrObCkfFPR5m2Ope2TCzUou0MZdT5paP3hyMjdvO8QBEgDBLiRbsfSAZrRcBBfwPs5/4p2pD6MJTXafhXzYMWcUErYBQ81VkGOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0Oir+aKJjF5xyPUy4jjBvxVUXStdRmRWE2HxUVDro8=;
 b=GVaoSiwjDUgBfUafEHYB3ovH8zyH+ta3s7LhgeODvuuJ6y0DdFT0N+iqQisXMBZzBu4nbqq7RrFT3YQbDvkOf0T+L+t+RioJW/k5wWobov1qj1xJdg3WXYQaB2I2fODGyfXSzew/R37U+765Y8Fdy9K1hB3bcFgYPPA6yEODnek=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by SEZPR01MB4279.apcprd01.prod.exchangelabs.com
 (2603:1096:101:4c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 10:05:23 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 10:05:21 +0000
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Cc: Fangping Cheng <FangpingFP.Cheng@moxa.com>,
	Epson Chiang <Epson.Chiang@moxa.com>,
	Eddie Lin <EddieSY.Lin@moxa.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>
Subject: [PATCH 0/6] USB: serial: mxuport: improve tty operation support
Date: Fri, 16 Oct 2026 18:03:45 +0800
Message-ID: <20261016100351.681390-1-crescentcy.hsieh@moxa.com>
X-Mailer: git-send-email 2.53.0
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
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|SEZPR01MB4279:EE_
X-MS-Office365-Filtering-Correlation-Id: f2db0057-034a-45bf-d7fc-08df2b6cfd21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|38350700014|56012099006|261009223027099003|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	PiJ4FiZVV8MD9WUhg0oN0Mha55sPjmkJ/CwToszPPqgBOn4TLlHjq8DyfG2SezxEiNdd7aYtQ4Wc6kHVbx38j/2G8XPumLaEIslvBTGJrN+JP4EM/jrTCLJRFIB8ZZJ24sdeZOwmQS0z3ssqcAunthafaxuPg6FsSZ13z3TX4if/X9DKaoZb8idWcCXsvDswDhGHuewh2azIm21DzfRP1GlLfpVPH7Yv9MFInfxa76DKkQhJWdX0CXbY94WOMrxlNq6ULc3QGkSE1YUZdJyN191d90Js2okkP1ky9wm4DTcFD5UqF2mm1rjS8YS3iBZP0xBjIqH3OKkD26RdlyAGWzQ516mTsYnBsOeVOzj0SeZh7gWJDwWbx/w6OVIS+9PLamc94eWa5leqvQUo5/O8fCcbKBgpl+mOC5y/8QR9XfrDmzOb3081CXiKLBm8NdpYDCdBF4cGB0Gvu70k5Uh3whh40UQkoJa93/zBHirMMd10B0BKOgjf6UPvP+J9SpYbLsX1V9dPNLxjIXSvD3bkRbWkrSGhAMwgIT/zvF096MdnO2hu/4BrymRnP4iQwxPRbrTvItC8eVBO8mw3i+LxlJa1pGSXJcDcJb3kA6ocz+UTSDhifXzqLNELkoxrKVakyp1ugRX5FLFj9bmYRt4tMsRLG7R8UqLVbNkHaBH8O5mIJC5urQQPzb3hoxZGW5NBAHcrySAh68ydfGun3Ur57VTlYlY4wY70JMRhYBo+pcM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(38350700014)(56012099006)(261009223027099003)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4EuHNn6xhK2k/C16GIrNrYSWnoyNWqpeXzd3CCIwebLphKP2SKGm+cizwapo?=
 =?us-ascii?Q?X6UJGyqadLi4iR41huXRUB1P327/H2qxBhGO8OXj5QCeR1gPr2F8bWcfA+iw?=
 =?us-ascii?Q?Oe2+hqUVdR92D1j4sLz5ekNhlZZMe6XViZp0/LtdN3EuFqJt2B3aTjiCTa8X?=
 =?us-ascii?Q?Vv7m3ldPyo1vF49CkvJ1Mu9dr75SBj6ovcH/ImazOSpeTlMA8NR2tSvWbane?=
 =?us-ascii?Q?oQqKd3SfLN4M2fJcBiL124fbYhE/IbbilP93A8KkobMn8gcqbypzhoP6Do2q?=
 =?us-ascii?Q?oS1elhI+AL9PiqRJBF3e+TdczKNB8V/7Memzw7cAmWeO8uDrzAryDHGJNjHC?=
 =?us-ascii?Q?Cv8eZnHs+boe8W+2wG1gPeT5sNnS3y/dnc5J/tXrmdQGSPlBUMYptlL5RD1U?=
 =?us-ascii?Q?AS9Z6CN+BLfoMM5bMjqkfogjeKj3vjDVzRzUdmDqhGzUj6ZSdHclrjsDGggp?=
 =?us-ascii?Q?kYD1SvdiBFn7qIN+tKdPy6FYYR/e1JSnC/QDvTvO1tLBlU3mcTc3EQbIpKko?=
 =?us-ascii?Q?oqjdbUqjkfApcyi/+N+gm8klt6t1qBR4EPDoMVsSCU9uINSp+s5AGQi0un+F?=
 =?us-ascii?Q?5DmNiZNBzytKrab+2OfgQWCrR/W3dKOUgnyOAKhhazmnWzQIMSuxKPo+b4jo?=
 =?us-ascii?Q?K/3cabfh2eC5Oq4HrQUgFbU/GfLa3JfKGawyuOp6rtn28rgPW8IyYpSVFHth?=
 =?us-ascii?Q?I64doAz1DS9oSmROFrgjPYg68l4HJn8l2yIjT9T4qDUN3p1eb55A5R9b1H2d?=
 =?us-ascii?Q?1JPyvDS5bJL6WFd2RqK1BwykGvriY9MqWo/udrO0h9rsCWwuGBFcJY0WqQ7L?=
 =?us-ascii?Q?3Gw1Q2HPtU1QGUxmxWJQR9CAMrHl9/8OqwubMMiTkGh4knE7ppYzDvj+4k/h?=
 =?us-ascii?Q?9110rMQL/tovspxfraqbrhl7xEDxgKONjS/xGIZKbFUCMespMrMWKYG8bHNt?=
 =?us-ascii?Q?TnYfMHfxTmNxKQyOUQjtdI7dCUy/PNvOHa3DoTbJDD8f0EyJtt5ywRRbkn60?=
 =?us-ascii?Q?iYog1fEqWb/CRWinkvNuk1/fZ3CG3/txIZC6tbNTIAEgxO0jIWrF3122R7CV?=
 =?us-ascii?Q?CAoCSwoq27ec/YCE+o/c2vGdOIT6XseYuQvzJVQBEkn/m2sFnwWgB7O1+3fy?=
 =?us-ascii?Q?ieJCyVSLRoCniovS10ku+3o396scdC2eLhVEFDz332ZRFz8g14zO6dQMW/GE?=
 =?us-ascii?Q?S7rAOZGeIrFOqRLd3+rymt+PwFIglx8snDmj2l+YpJRbRw3kL4Jun/VqOJDK?=
 =?us-ascii?Q?Xw43dCD4XZHu1Z8LvT+PQ6evFezaWnAuRiNZGzeUDW6xL5z0fQUOI2VGRth8?=
 =?us-ascii?Q?miEM7VdMmSFNGAtpWdiY/dbwdzMm4NsQQiUDgXE+ThuYIxTy0ZLsqBOkyLkg?=
 =?us-ascii?Q?xFLP3yVmSmGlAi3cHFXa6dT42DQm16c6DIhPqov84TbzFQn/jEXWLQeSwopy?=
 =?us-ascii?Q?tUvfp144de2o8pRDTSEkA7YoLxyUDkn1nWCzDOQSmcP7GIJxxMVSy2UlqFdb?=
 =?us-ascii?Q?T5TQOpJeVZOWoxI71/G0oXLnZlh9sGFwfg5KI1H/KF/eNBFlYEZhsw0UfkYj?=
 =?us-ascii?Q?tJiG2kSS0zx+TZN4I8M0Y/lxUEUEzE42rfOXk+Bks7bMfeU8dO+RbHcvH+4V?=
 =?us-ascii?Q?aluSYEanJeqMVZvqdVIGYM+lyhgByXKX4WSMXym69dxLvTwL/q6338K/ixUQ?=
 =?us-ascii?Q?xDoQbHCeJMoOFI0qPhetc4GDNssOIa2MZpTJTKEBRqop7OSTSPOVLGeYC1Yp?=
 =?us-ascii?Q?Q2P6Mp/KXBTD4iLE72sXZzcJYtG0trQ=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2db0057-034a-45bf-d7fc-08df2b6cfd21
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 10:05:21.6568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rfHAhFCEsrh0YZgqAfZbAjiQ++ieRgxj9hGE8lOGTsqMoH8MVvTB0YDBYjteQossTeFvoYM9N+5gZ+5o7LAQw8MBRO+1jcids1hVbWGRLLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR01MB4279

This series improves the mxuport driver's handling of several tty
operations.

The first patch converts the driver's control reads to
usb_control_msg_recv(), which handles DMA-safe temporary buffers and
validates the returned transfer length.

The second patch initializes the cached modem status when opening a
port, preventing TIOCMGET from temporarily reporting stale input-line
state.

Patches three and four add optional stop and start callbacks to the USB
serial core and implement them in mxuport. This prevents the driver from
submitting new write data while tty output is stopped.

Patch five adds device-specific TCFLSH handling so that flush requests
also purge the corresponding device buffers and USB serial write FIFO.

The final patch adds a wait_until_sent callback. It retains the generic
USB-serial queue polling and adds a baud-dependent delay before
reporting transmit completion.

Crescent Hsieh (6):
  USB: serial: mxuport: use usb_control_msg_recv()
  USB: serial: mxuport: initialize modem status on open
  USB: serial: add stop and start callbacks
  USB: serial: mxuport: handle output flow control
  USB: serial: mxuport: handle TCFLSH buffer purge
  USB: serial: mxuport: wait for UART transmit completion

 drivers/usb/serial/mxuport.c    | 287 +++++++++++++++++++++++---------
 drivers/usb/serial/usb-serial.c |  18 ++
 include/linux/usb/serial.h      |   2 +
 3 files changed, 231 insertions(+), 76 deletions(-)

-- 
2.53.0
