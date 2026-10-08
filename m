Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E603ED11D;
	Thu,  8 Oct 2026 07:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791445540; cv=fail; b=aEh7scNwPGTtCarOAQOrcGy4Fo5RMz1MYK/Ww24Eb9y5DLKwtzuiYGBSw90W3tELoWKZV0i3xn4e+3sIrepo6xHDvWLHR+4GUBjOcvD8wI5KPwtw/J6LQWc0uDmIxG9r6/A6jKNs+RcvJItFbf17FBj9ZMuUpt9ZhN+psVCsWjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791445540; c=relaxed/simple;
	bh=z7ouvLhSWQAvofx2WgWRfUHJWdcs+J+sKxqL5IZmgwg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XkQSAum8efiY73yMlQgUZ4FbkqCkkxs0MiiPz2bELFm5cTZpI4mTtrGZMkgjs/0aMeRsJHJEznUzch3KvLxBQBLFUvmwWapGCipc++xNjYwkssWCSIL+UcsAxwhx+lqd/6Z+aFL4cpIFOaphFga51qmWtXShG9b6cayOVMAeAyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qRLBOS4x; arc=fail smtp.client-ip=52.101.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qRLBOS4x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qx45ayZjA8YTuRZAaj1HkGai3+MXDAO2bYhp8hoKIah93REI47q7aP6vIycilZ/wUm+BHEo7okfO1T9puME8dcUkAsGL1P5mXJ696afvHPFSQlXxD1Hmp+FhHPop0NTgmD/tTXSzacum8D2yy1k3H5wy99RG1yDR7N93R7JQK+PZ18BG31YKjWVO3Sth4+/EY4NTikkSL5cJxisC4DmOQ1LOgKlNWNCQhcmlkeolbN0HHHR8nARvbliJWYoKDJ6nnOZkn3R9WAgPN4a/iGyDdE7o+PPrORJBrrFlacqEqZkMcKYf7QeStXdHrbxxak+La8OocVIRvlFCAseohzciWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OL6vKukJyOi305freXjbdykRjXqaAS9BxLQCol+sC/M=;
 b=ZhRXEgLsYKs8rttYs+mdbr3nH1n9p0zjHfBhWa/UbDGdr1wOmuJvE4d8A1r4dv5h1gyun/suLYjtyyIgvr1Q3TQ2ksycb4LWxWnbJpWUNYOYih3Mmrkgc2Uuj9RSzLhc0KF5OcpQRkAFXJHji3GJ6lg7gaDJBSWGm0ygjstVybsWkIjQZjyxDpxHXGcdZ/V2wqLkwZ3iw950Z4vS59GCRsn9Q9FVaIlQiGtfwbM+6VYnSuQbTYIrj2aevyidxYsyRBSAFYAf9ZiihqPgxib433q7Z5MUhk5O8eZiezpGQCSLXvB/Lb+oe/jz4q9yulrQR1NbnndnT123MfceqwzEaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OL6vKukJyOi305freXjbdykRjXqaAS9BxLQCol+sC/M=;
 b=qRLBOS4xaPFgbrNZBbnZs3nrh2a5JMAborKxBo8zsU7eI9Hoch7Ynt+U2GUqmupTr1q9QqOsI2q+wgl1d2YaEt6rWbYCvhh8OAqFYsgjwpAegHOc2YOSvDkuNxurCZIUB3IK8INgeZGV4tpRz9N1OsZsjfG0JFJ2pIWAvgp4aG0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OSOPR01MB12281.jpnprd01.prod.outlook.com (2603:1096:604:2d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 07:45:35 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 07:45:34 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@lysator.liu.se>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Restore RZ/V2H(P) USB2PHY reset and VBENCTL mux state on resume
Date: Thu,  8 Oct 2026 09:44:45 +0200
Message-ID: <cover.1791389435.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0502CA0004.eurprd05.prod.outlook.com
 (2603:10a6:803:1::17) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OSOPR01MB12281:EE_
X-MS-Office365-Filtering-Correlation-Id: b8e61880-c1ae-479d-90f6-08df251022db
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|23010399003|366016|18002099003|10067099003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	HxvU+oniUBsK9UI0uqq/fUgW2Nlyb/Nc3NtwOVImIHOj5qHgUwiWpM/MCUMOTpe3SJsB54ZEtqFFg8K21jRmfReR9JAikyaqFi1Y6vWkrdGTuNoynG/+GS6CRg6WehL57Um3pN8GseQUxN4IwXXstAKdhtwo3shMLAgsP/v6nQPb2dOoj0H0n8DCj267ySl7AlQT0RyD81nmNqWqYLLEs2uSRDhxK9L8W9/SNooRMuOnA9jnPBkCC/TiZ6V/vDTkykoWgWRglm7kks+eOPvM/S3VqiXJN84cLNL1q1vsFyUHhDjua49O1ulB0p4+/dOmHbNLZ6sym+nmAFUVjErFICs8GTRNFEOZDZJf6C7Svs7PQrUVR+955At509WHLhesjlAEKcqLF+Q0U65ev77H8nBBsamN7vnFfEODLctGQWcKgpRr+5owQODSPAR7Ep+PZogkk26/t2KsbueCZffyZ8E1eADyWSdCSRnK5QXKwIyPuAuIugrSmZzTRYzap7bliJdjoaQHIl0NFZzLnDeKow2TswJ1RUCf8b4Bg20y7MSs1M84hVcPM+LagiN9/AeAt1yn8p77HykrljBQ8uTgffvfQsw57QEccILjEXSsYGczeUXb42qmCidbWKtKOJN9Ymzs0xJK/FG1HVajxK4Ii+VpMP1Yz+bF+BJmxTq4w9Ot0CY9nBQxphs7IJ76AY7ZGwRptKrdWVhglnJTBE5wmjBLB35bi5x9mVoZaleXEeM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(23010399003)(366016)(18002099003)(10067099003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vAe1C0B4vcx9V5r0MX1usOBRgYFBeNCtNiLhF5acbWmYXWU2B43jrgaTktn+?=
 =?us-ascii?Q?ttFBHYY0YyoGZ/rWOW13tIgJ4sWCMA20lzZYyWt/lIb/PkjMtD6lRZNha7Gi?=
 =?us-ascii?Q?ZimXJvpXfSg4Col0bHkJcstIlmnhyngtJoffI/cXAlDOCOuHgWXbhvCJxylY?=
 =?us-ascii?Q?aIRN6823P5lgD+D/m4IJyBCDmtdt1USznlwqT2Q6WgP1xdSS7BYqu/lXeGpo?=
 =?us-ascii?Q?ExNVeDsMoXINrT4fFc0ARBs0/txiw8NTMl3HhlDm/U93+soLNbF0+KboI48x?=
 =?us-ascii?Q?GaHwbcoM1aWsfyKX0tp/lSusWAzSX8ZJ/ywvFCuIZ0LxGA7axK8xzYbjXb8H?=
 =?us-ascii?Q?1C7GfmwNCbmSiMKp3FEIgo2G4IvTMIh/nz2/OYhDR/MmCC2JfFdZs6L60rhm?=
 =?us-ascii?Q?i21mSdxUJRHOfKaOK0vnqgS07nayFY1r3zwzWwIFVVeohF2hd+eKkRvuRHHN?=
 =?us-ascii?Q?ojJW8nE9n3uz9y1b7niKtqM41Ri88SPPrFy2ud/D44wivFOcv9Lhp6Bk/sxr?=
 =?us-ascii?Q?RpHwu9s2QCB5Qe1GdkzFUaggiayuwl3sWgr+OUCqDYuSIchMdsquUAMlUbiu?=
 =?us-ascii?Q?nQq425HBXsb1ywNRScjCtrNsZ3gWTb+eQac2HCdi8ls2rnfjJ4TUVRE0u27W?=
 =?us-ascii?Q?9FsKDWGLWNagbuJJE0wiqaezPnZeE4Iwou/6Ic/OVZokg9NR3n8i6eyGhof6?=
 =?us-ascii?Q?1hNFy65zelvvctpA8NNdH+0BMZwBV0ozczwJ3JpHdBcySIsJlSWGMKn7zRmv?=
 =?us-ascii?Q?yl+u8bcfAHuYvK6ufWS//JlW/AVa3Db6zQkESwfjx/zjgQCPiIsutGXoCtG4?=
 =?us-ascii?Q?ahxg9CbrbGjbIdD7hpnl2K51zm5uLiWSoQDfRyHZTcOeury6xL7qW0iS4dAR?=
 =?us-ascii?Q?IWPoKGziPBmV4ykPEnQx2H2hAHnwxqpLtB1R4mE5VSGa9MBOn5PTv7c3drlU?=
 =?us-ascii?Q?qsvO3RyvcLNnxZH6FcGEEJy+72A92EXVoKcfiUG50Nui+AbpeVZtMaNoEGjd?=
 =?us-ascii?Q?KQMVahIrV+FsmORSnm6dCgMH5g7ZZDl+vTKnKv4OzcohzLzq3whBwgd9U1MC?=
 =?us-ascii?Q?R81H5Cr8LFN8d+xf+3aDhXjnnrR9OxY+SjGuFE//zFJy7LAQQQ70PVscX//Z?=
 =?us-ascii?Q?9mF7jABTwRBM6REzkAWzv7bZFfa0+vEnjPWHE5IgpKIDHKDSAEysIqQ4IChn?=
 =?us-ascii?Q?mTzFfCW/dopsHFW/ryXKOqTXtM+4ZCRCSgJarAmSm5K/Ip7v5yamilQIs0lG?=
 =?us-ascii?Q?4s00CrQOpmt2vAgur+2QrVu15/SX2X+f9BYl26S6mQK1D3+M8tiYfuWTQG55?=
 =?us-ascii?Q?RBmjYz+wqEo7U/kfxbqazRJjVtoiU2Ti9PmpKjcHEWFaE6OPGSarqH8PAo8w?=
 =?us-ascii?Q?ZnvkBOnbPExG6qOl/rVCdKkAlptn4xNPuQbmm9URvhMBqxQkSn/JnoBE1Ogc?=
 =?us-ascii?Q?dmA8z3yPvo9vgyEQAFjxpeFco+wFRQHAdsXzag2P0bpdoan+9f7hg3I6kFpL?=
 =?us-ascii?Q?nCtBOXYcP8Euf1I+yUCDjc1iC30MTBgGJ/RUt7NUy3E5iUSUC+ihB402pTeJ?=
 =?us-ascii?Q?3KyI15XtPccilKwBFi61A+HZzDM0cQHI29Zyp70auVDfWFu36DsZbJ9h9IhL?=
 =?us-ascii?Q?Z+yBJA9BSEvorc6LUJDuTglOYM7zdTSaNWXDrJRDln+W6wfX0AGRIt+YOr7i?=
 =?us-ascii?Q?0B9x1RBJsKvbyaVNZZav/IQ3Nop5WckYYVvNUAyMRLxz4JYZ2+Znbyr8azBf?=
 =?us-ascii?Q?2bSkkNPzY107AvnDInQ5Qcak02IsDLu7QYeZMMXhYVK1rNV2Wy+5?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e61880-c1ae-479d-90f6-08df251022db
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 07:45:34.8904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uYH16CxPRLXgVZFYhJSZovUK1eiyO84nL6134ChB9fbH3Z/JiQI+9/fEPzcqNZL7ZrsZyZoq6QUaAE7ywwPwtkQ7XHAm+koE0wC0pMZJ4gizia2a6z3qbMrTXnXlFlnH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12281

Hi,

This series adds suspend/resume support to the RZ/V2H(P) USB2PHY reset and
VBENCTL mux drivers.

Thanks,
Tommaso

Tommaso Merciai (2):
  reset: rzv2h-usb2phy: Add suspend/resume support
  mux: rzv2h-vbenctl: Add suspend and resume support

 drivers/mux/rzv2h-vbenctl.c         | 24 ++++++++++++
 drivers/reset/reset-rzv2h-usb2phy.c | 61 +++++++++++++++++++++++++++--
 2 files changed, 81 insertions(+), 4 deletions(-)

-- 
2.54.0

