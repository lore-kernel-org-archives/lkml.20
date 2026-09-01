Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012053.outbound.protection.outlook.com [52.101.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5338D2F745D;
	Tue,  1 Sep 2026 05:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788242270; cv=fail; b=l0nDrZAeIMOh32EeyKAeGf22i3kql3iRYaZFom3S9EgOtSIyy4y0Lg3YynNhp4nU5+ZYzVzFX21aJh64BsI6jGs7Gcla8clcVWb6+RHHEpAA/IYCLcUx6GOpwrB1CP3Fq6WR5IrKI8nLUJlagvmgrJuqCwsIjVuMxBNHJTPcSco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788242270; c=relaxed/simple;
	bh=W57ufiPcG6vJmxwqQWryqwm2VYzKpWQVfdPWC/sydHw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=FawfB9a/rOu2iY4EG3kk+94Kn2L9CgBr4eRot3v3JDCBRPLLg0VMGchKzWVekLl9itppgTkY6LvZMQWX1yPqCQpBSH9xFegDx7lzPFyxHUw87Qr8YgCB3MPsYqMfYXNMPEwiN36A3Nr/CXuoOlwThVaW32FET4G2SEt05etbSPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JfcGxQ7Y; arc=fail smtp.client-ip=52.101.66.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JfcGxQ7Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yHzCvv8RFH8/qPCaNkCKLNGnb7z8y8Cap0LIGU7p42auBUBg9TS4nChO/PjbQixrCLy74Jp0T6t7X3vU0ReqI5U2tsSfnOPUKN+3M01VkkfVSC7XKLKDJnm7xJjzPSoTnAInAeIroydkYxT+HAWyHYk6AGkez/sIV06gzJ2eSloG1+uFs7bmegL8f4+4DWPlW3d0Ycunz081wODKdXDIOYkmvsf6vpBD20GV9h7pxTc4uUCAvPC0xf63gd5aXR9ZKmVrsXN/6HDAMLyDjP2g1cVdbsuCuu5+VeWjCqNYJpdoMX7xXvBVilTTKKnxmY3ZIycqBU88I4qWW1Fv9PTZqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ceohFjW0JktZ+4Fj+8SRFL+h5zm8/TB4tkdtaj2QoY=;
 b=D3pBBIYjKkuAEi8Q5qwrrpbXdn7mjh9M3DJQsyClzH8PGZW+E/DHN5L2z2FDb4zWxRQM6Bj1U2B3c8YU2wefGrJ4cgYNDbIr7FNyEVoyDcKqQOyD+iZgxc+yIKgbTviXkzKKNHWauo9ID65ISLkP8Kp8sRGNO0mSkwl/pn+pmiQUWQmKLrzFE1Gnh96eBAWrowbhJdTT0KpE8OfEe7tUd3E43+9nQ4v9gWJNFOt9af5N7Crbwuqca4zSrb+i0t6Ur4fN6KwxmVL/n4t3+3V83fW/mt/4K54Phboyaqyf24hyBBG4sGCQA4XjarcC9VQVpLiIxHAdH/VT7dsD7ebJNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ceohFjW0JktZ+4Fj+8SRFL+h5zm8/TB4tkdtaj2QoY=;
 b=JfcGxQ7YMQSFbyDB6uoJxP+Z7/Jt3nWq1KQ5DMFtkj9vTT9RHLJSWYnIIkALjIpZYYDV6ZXt9Sd/mUUQ+/g+WXo6u5bURNWh9n8NaOZ2fk6O6n0r9BA8xSdkfHxvkc+yKc3TLbtDpdF6jCpda+jOY3+qUX9VCy3OWhZ09myWbwsxKRdh2VEPcLp+cQcctwusladQNJInhpAyHyrdbzvxDK1hEwFWwaASzCVwpkfwZaHSgGlI8DIh2JZ16wsjs94jtiOFBhRisL0nNb/ECTH4U6wsn2oWEV6ea9Hne79gyUYTwQ19xo73anO2VND0kCPhI3viZldpaIvejIScPX4SjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AS8PR04MB8040.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 05:57:46 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 05:57:45 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: alexander.shishkin@linux.intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] usb: chipidea: otg: fix invalid role name print when no current role
Date: Tue,  1 Sep 2026 14:01:50 +0800
Message-Id: <20260901060150.1667914-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::8) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AS8PR04MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: 209b6a81-fe1b-43de-be20-08df07edf178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|19092799006|1800799024|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	xS+y914JF1aHQBqrhEJEmmekpTDqD92UH516l2SBUISqx8tt0eq0fU0Yvt/vDK+O/7p9hoJju48bSojkvQJHYSwG8f8TMW2D8CjofS7Ooec1EP/SsJswPdceWpIlIdzFTzHzpI80yRei7whYwT8F2b8FNyVgQStCQSz4BmqOwm2jkulauJmu98AZxWjUI01ELCxZ3u0jNLahRkL5n9uOhn/ElQNrDrMpvapX1Awzydf6TaWbduGzBDIHHoGE9XUgi9s5AWHcNCpGCuM6lz8wnYO8Znj4BnXHPMR6szRWg7Q6uGtlIuGiD/xO2Loi5x27L2U6TWs9r98gnNRQXnnLOp2gAl5Pl8e+RGFu1QdJ2jTSM9uNqAaQg5ilHWvqMPCFzQVWXqSGb01/Eag3rnjxPM95hVpoJNL2IVbE0vKLYFGxzlxx+RQofw9pYemU0Vu1bisRRHzcZQGzADX1hezbLGVpFzzPZbuxCHdpp2v3XaVJDHoXFZEQ3y1W3YL/6sPeDGs7fIZUWNpdaxGe8SndfSwNN+LuJd/hjndC3YI9sTptgXBbGmWutESaMXtg2DhKux6dXT/yxiWfNhqMBj+GZIyb6C/bTGBUCHsG7REb2FwNcHt7KVCnMxpXN8PZ8jCpnxcZXG+AoHMmIP1XBbvZugWGhIkwuuyAGq3U/JhpTzI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(19092799006)(1800799024)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O/nl8y5UaQR1UkyYsYZ+GGshuZzAPLjFI1rIUhgxzrvdbgX2BBFFHSjvrALT?=
 =?us-ascii?Q?5w1cD+KuFgNRl9Om9BD3VaIh3rRl2BKybVica9fl9UX0kBjASRMCLGMLOv9p?=
 =?us-ascii?Q?MSdlRc9VO0eaktYZQj0ormY6dXlcAM/E1sD8kkr4514B8aXhWyKl71kReVgS?=
 =?us-ascii?Q?oSJjIFnnJujXCVXvS3RHtTFvYFUscUfcBg1oiDjS277qu6/1qY+mxyrT9lN4?=
 =?us-ascii?Q?dXALtD4mYQ7eLG3kfORlAaK2Qv4x8gcA0EXhGPksLomb9o3GvT17/7kRdcp9?=
 =?us-ascii?Q?u5Nitx+piPq9tyf8L5Sn4P0ssd3dsT/7EihDTfSvOR1cGKEM5F8HHsJk1ehj?=
 =?us-ascii?Q?MHFFSIrI6SRWXmSUuyH+6X/2I/zOxHpXXki/iwxdhNTX9QyEWmd74XmqRyHT?=
 =?us-ascii?Q?A81Sl7RSgFOLnZyPFSnQKUrrIReMisT9UtBoWloFRUU+1NPkLy8UC/q8DwQ1?=
 =?us-ascii?Q?a/Zt4QHC0uJVGMT5YYA03IpPYp2y5JQkEp6S1tKLA8JprQtq5Xf5Uuxg765e?=
 =?us-ascii?Q?35ItV9ckbYUwm2N/M4zF8p+JyfSH/MniKmWxTtXOmROxeDOg0/bCpKNFkpYp?=
 =?us-ascii?Q?OW9VnWYbvLHuP9aK/en4VAKV1+GOUrGyhkvpvdTfxwHP0RuDFoTTUUO6MuVd?=
 =?us-ascii?Q?nzg99/njOHuHKgw571OQ5/Fl4Qg/aUcIm8wa+gpQYLTv8NuRjkrRawT/VmA9?=
 =?us-ascii?Q?mJpBLkXj9fK79mNX6mCZ8OXkvyY3MUdWhHd115Blo3TrEA9Wm3j0oSfE7oW3?=
 =?us-ascii?Q?0+bKcgc6HbSwy0vTC8X3uxVlDjSHyT7Epnc5aoebPAJPAbTz0pWp2UtBMUqm?=
 =?us-ascii?Q?M34lZNJhMGmwMOdX4piv/0LNWrvQt2vmMrAfY+/8Qdz6aFTPPuS5c9nOovGv?=
 =?us-ascii?Q?ws1hkTzhuM9U1UQXDJoTSpWfaw/T7boSEHnlcjLkTE3PusBkqRUfl57nxhhD?=
 =?us-ascii?Q?dSRtcMf8AqsDrCgXeV8yq2KMY2Lzx8X2/l0Vf3cOud2Lvj8QEjXKn8PyXB6r?=
 =?us-ascii?Q?LZUDkg7zkyRWPC5YwuHOtl8Uqqxvrn5UNUaeG3gAuufXeByemkJdGCgw4wcD?=
 =?us-ascii?Q?u0QgBZLxuPAH9w3Qcavy9dpCc3LLVvCFNW1Jq6F0VT77893z8Ezwk4jOunmw?=
 =?us-ascii?Q?kmAwk8X5rPtrlvE/SVCpQXupZ5ulG7LLawD5sDzcCOVyKGj26fdvVlFtDKPI?=
 =?us-ascii?Q?GrLT36jB9VimQGwnlDfUgkZwRkNpOBrOBn/8Qfs56+2vsNLq7u3Hz1MYxDnW?=
 =?us-ascii?Q?Vs78LaYD4qms36qdxj9Ihglj+1NkLBFXDcutXjnX/YKBtc9EqeInbYyLyycU?=
 =?us-ascii?Q?Cj15VmuZYyD8E8ToCLJjhZjoq5F6Q7ZPIPBuwBxSh8uaR1XR7AeKp3Wdq7tW?=
 =?us-ascii?Q?79V4aCfHCxIunYwMlm3UxLsiMhJXuUfXTdHzmbCYhV3w+PDNv94IelXHkiF+?=
 =?us-ascii?Q?V8iEgIfccYfUWliQQoZgaqqoLpyUhW5D/lK1pKjuBE4eTojUEJT/lPOZKaKI?=
 =?us-ascii?Q?VGffpMpjBnAPyIq/jkxGzYifeEMI3a/GEee1WJ60qv49PhOgGsYGk9JU50Oj?=
 =?us-ascii?Q?LqE11lWHwb8rcoDXsyupyPgW1X3rwsyjBZjYw8/AmfgHCpq9Rg3kpqH8Afls?=
 =?us-ascii?Q?+jJHdRQHj7wkO1c0/PhMkCVHQ6D9mVCifFdos9u02XV9yV0RP97JafMqOyZ4?=
 =?us-ascii?Q?qrm6Owc6YP9sqOhTgj+a5V6lIgo/VVEsCXrKj8WAj+GsKQhcCAyQo8Qv7bvf?=
 =?us-ascii?Q?NbkglHMNLvm4Hb103QXS0vlfX/P2n6v/bhSf4/br5eh27YB5qLy3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 209b6a81-fe1b-43de-be20-08df07edf178
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 05:57:45.5784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ksm4Z4ko0jsOkXEvoy0cgN4dA0gIJwqiX1AdgC/xm/554yZvJPupSGQCDyO5MkobK+Yb/+Ev9A0fwZWOH0Cd9dybTGTFSouZueNlhM4L/rpkFeXPvSOcuazUyGxlKbtu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8040

From: Xu Yang <xu.yang_2@nxp.com>

ci_handle_id_switch() prints the role transition via ci_role(ci)->name
for the current role, but when ci->role is CI_ROLE_END (no role
assigned yet), ci_role(ci) call BUG_ON() and return ci->roles[CI_ROLE_END]
which is NULL, causing a NULL pointer dereference in the debug print.

This can happen if ci_role_start() fails during a role switch, since
ci_role_stop() has already set ci->role to CI_ROLE_END.

Fix it by printing "none" instead of dereferencing ci_role(ci)->name
when ci->role is CI_ROLE_END.

Fixes: cbec6bd55a45 ("usb: chipidea: move otg related things to otg file")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/otg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
index fecc7d7e2f0d..457417e81b78 100644
--- a/drivers/usb/chipidea/otg.c
+++ b/drivers/usb/chipidea/otg.c
@@ -179,7 +179,8 @@ void ci_handle_id_switch(struct ci_hdrc *ci)
 	role = ci_otg_role(ci);
 	if (role != ci->role) {
 		dev_dbg(ci->dev, "switching from %s to %s\n",
-			ci_role(ci)->name, ci->roles[role]->name);
+			ci->role == CI_ROLE_END ? "none" : ci_role(ci)->name,
+			ci->roles[role]->name);
 
 		if (ci->vbus_active && ci->role == CI_ROLE_GADGET)
 			/*
-- 
2.34.1

