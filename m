Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011037.outbound.protection.outlook.com [52.101.125.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D7F3E49EE;
	Thu,  8 Oct 2026 07:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791445546; cv=fail; b=NAlw6V6HAjD5QXnQcY4wZiXLfchfutbfpwuFCDrgXzhP4QCRXrkXNaPKOHPyyr90lqT6gTVOUXpNAWetsI1MrCcFZ5Zc1Rt01WrIRY1Z6xfpwoRrAhxe0g3bUkoK3nM+E+henmCkEaB3K0r40qzgI4CP2jYBBZifFPka5pXKQhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791445546; c=relaxed/simple;
	bh=IMCwNLoiq9ATtBBkwfuxjY6EvBYKqHdIjyI6eQ8VTXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YbVKezOr+5TVps6d74XB+eAept/qvSDW2oyT7lvC1kmfVD828aHBajP/KcursaKNCqh8TlZC4pzdVpYRvw2w1pwVQISplP3Wsic90ZC+fK5eMHNzxjWSqzJx5AxePb8NagjCR+2THr7zj1eWYWvM1NC5IEukrvc/3nrL5QoYC/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=S2pdmHH/; arc=fail smtp.client-ip=52.101.125.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="S2pdmHH/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYq1F+iihFiumR2q8q934beX5TA1YthDQtbt1+X1jPwpwGOWLVlHjuieqsEzi56MUZkNtVLuOY40Om39tDgxTmD3aK78AlLzDFDZRTwd0KzJRodlB5LdbOPp6elvmSADra/RF8fbSjoADaFkXJbdFy5ccuYDl8dYhFjuY8nA5Pt48Qs8d/Mq8/46FdLLO3h0zhMLUugW9EFnaeb9aczKVa4FrLXXrCD9np7M0OxrBNTOvgNyH1D6wI5luRrA45TATgeGw/EbjSGiDIVLse8xl9i4lWAII5ywVrogQwEqDuZHE2X1i1fY4FiCMZVczGojKhFD038CoCzRmYDbCQSKUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWCvNS7ghFrnO1GqIKFRX+lMgf5rBP9oZR58qkHwxII=;
 b=O0BfSovOx9eYXPaZ/WmtoQOpFJVA9e5uNrajtDw8K3e06E4kecoakDQQlekLLka6gyZ/J0sUyQ4sFvVvFDwPWyVF1lhpL0ChLRpq/YcG0ZYrQjpRnjTSHLeIdemywd6+dDQkoEggc7Mu9CwjcyqyfcjiCoHxiKPAewuNIjRQdZgvwRrgtRWZqZl11HwPWUEYGnx47gTjfZ2++fH3QaFqdu6GCVGUgYXF9940PLTtX738gHiXMLc7W/+FMAY6gNvcSaQ9PMyL1iYdwqGzsBFIKyU2wzSYU5JUW1qUL6SsWnFIgk2aLE6l5Z4yYEd/OvZZltZnegV07CAm2kVPz82t1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWCvNS7ghFrnO1GqIKFRX+lMgf5rBP9oZR58qkHwxII=;
 b=S2pdmHH/ZkBTEGBY8gLf2E9vVZsZjYf983vrlj5gI4wfWoRun4ah7qsSLi9r3leD1zxXdnkfDr19OdGwgBkLJkU0NjcsPop1t1lBGtD7S2Oob7VKsritDxstGiGdhvoe1zu73jhPC82e+65eIIL5+U+IsYYb6W1ptmItSOpQjdY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYRPR01MB12525.jpnprd01.prod.outlook.com (2603:1096:405:1af::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 07:45:43 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 07:45:43 +0000
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
Subject: [PATCH 2/2] mux: rzv2h-vbenctl: Add suspend and resume support
Date: Thu,  8 Oct 2026 09:44:47 +0200
Message-ID: <26da5ba32948a30dd70475ad2ece3c84dcab4eed.1791389435.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791389435.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1791389435.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYRPR01MB12525:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a29edd7-565a-47fc-2f7a-08df2510284f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|52116014|38350700014|56012099006|11063799006|260925021911599003|260925021311599003|260925022911599003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3R37n8fGjtGDkcx1lfMIKwHCCZDQDr1QBBCkmmDXmCNEMj9M0/+Uyjj4QMRqS4S7MtFPodgdvLFOvS/rcVyzGh1Z4yN89O/mz3PI7iPtunbxMb9Z7hlm8E80B7jYepCmIDXvzU0MFvq2OKHijPLZEYafvJcUtOp7HL0h/wDVmSQhYMIwpydVOfrIvZq6tW+egNUmW3FkqZEX1wkvvSUhpjCWeIofgvUff7TtyTyZBufG7/iIOSyUilqim4JXCqvX2vdgatMY/8FbGsehLb7X4GurB5wJ7qt0LKR6sNFDfGVkpAuHGQSKhh+qTAku6uUJViRespgs6P32Js3HaHA5i92p2Q6Q/miKQnEd5nNzwARez29RCO57PERupKxJWkLau8tgGyQVKpebkL/rCSWRUTniFWjbXmzmhe19yt9Tq6eVI3t3+Iyg/eUdQrAlPuLYGb+44a81sU5rLfx5HmGhy7vR0lYepHqBf5rI9pvb+a18CYYU0QnZ6NcdN5BYglPjj+vrplptmaBtJbBLRHe6t6cL+1Ph3D5jiWq0Yv3h9jyp/qenbFjux/aeC3akysc9tNB24bUbef/fGjIBYp+beLZ1SczwkqnJPyCVZ6JcrHZqrE2w3np8Eh21Op+kIIXil5S2CRceqxZPVUhcdJiMf967G3w0NXW1S5GQncDfemkbIp0C84+tqenhJZZB5VwQDsuo8NF1mMWCFPU12kgr0U9oqJD80nyuaFOeaaFzCIk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(52116014)(38350700014)(56012099006)(11063799006)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vifzWuPjWlgca2PSRzF6k2aRTb3HX6PFKhhL1cvaUBppJeYpnvGB7e6vT92G?=
 =?us-ascii?Q?Vz1HdcU95Ns2S7Yev7ADnL55jBlCre+0+l/P2T1LNx8r8nkdnKuvBv9nfr0O?=
 =?us-ascii?Q?HmIDMUsBOdYz/qgTE26BzYzxHhoHzX9ZCD8Zm/u6KDEm9rOjL2N+0nueyrMm?=
 =?us-ascii?Q?n6pQv9aDnMNcc0XYsa41/Dfhy/1Lsoay03neetyucfwmj01VTxn4CahoCyTd?=
 =?us-ascii?Q?jn79QiQLsmV3CP1pfDCoiCjBjMfvBZ+CuMlWmTRh5PEPMGvwVCmC2yBFB0Q4?=
 =?us-ascii?Q?t3NmqSuGPYNTuI7AxuEzGT4iYBy2pC0Wuj2q4J6mWjz36B6+G1ovCCI/QEEO?=
 =?us-ascii?Q?ywV7FGmy7zMZQf7cwq2xn4TVa7CkgiaZY8eKMywDOvZjNn+OYMULlvv69icj?=
 =?us-ascii?Q?kt8gUCP8Yp9DFAgTiyLDnXUDkiLjVB4lsrxmc6nh35vdGfVFS4iFE6rRTfom?=
 =?us-ascii?Q?QAK19hFkkViSfkmYUKHjHTH4nNzb37n5kbyqZwk6ZiLn8wX148W4abKmkMhy?=
 =?us-ascii?Q?oD9IWNyoYW1r/iZJBfuHWpBObIEnwRThuGPnIbs+dZDOJtfwdTji09RRq72D?=
 =?us-ascii?Q?BEf/dZ4yKYXXbrYP5+nDlEN60n5HTkmu+0xCkiiGu6+Otq0HKDcXUMbAz/ci?=
 =?us-ascii?Q?SCCOi2Zsk9+lP8xd35dzs48fo/nj7PW7zbt7RpDabtiod7ssYR/Vxlqy5VR8?=
 =?us-ascii?Q?A61Nh+433j4UyQUR8zs3fpXQB1io7vNyN1YyX39M8Kglp5odeNqX8ibrm60Y?=
 =?us-ascii?Q?1/0t8M74p3S7dyQOPZCk0+MU8t6K4NzrLh1aZ34tD3epa0Xv4Yyeg5se3xkW?=
 =?us-ascii?Q?tFiWWnIFPWc38CtNoJm/YyHD0B4cj8cyZJmv4l4Wxgcblg91p+kRmGAeXB38?=
 =?us-ascii?Q?2S9CJwNNUsbFC7UCRNo9fGl71Iy8cZkUMOipH/Z8cBbgJh4jRIVfKrt/GS7c?=
 =?us-ascii?Q?VjKDbgmdoC0vBcD07wBBw5G2GUFiUbZkTOfbTOE+kmXIxRqcRoRnMqSXqDVQ?=
 =?us-ascii?Q?2FD5rnTjZLCkjzSLGCvIuHmYsL7WL3JP7PXRbAGnYTSrd0x14xZNRFQDt0MQ?=
 =?us-ascii?Q?IhW7ReJPstbpeFM+P/naZj7qa80ehf/IVdk9gNMo4yPpb4g9Gt5WbHwSrj8a?=
 =?us-ascii?Q?kpgKZISdKu+L90nHhL4Tpt2IjJkOMdOIOQxU/JfBbXeyGC0ByrJHTN0F6mRk?=
 =?us-ascii?Q?+By/UsXaPytipbMZsP1cEPizu5RtwAD1s0I0TdGCpIJXvVM1zPYmQRedjgAT?=
 =?us-ascii?Q?CuZlur2ZejKmSVGxmowJ4re2S8GSAX1qPbWZN0GcvQyYFnTmpvh9RdoOH+LV?=
 =?us-ascii?Q?oRhljlhT45zW0cZdThEjMAwEq48sus7/slb2dN7b57qOVu3Yp+wxvz+JmWBr?=
 =?us-ascii?Q?yz2EIXISVAriSGXNnhUWwMmxnj54SbrC2uSm/ZA4RLd+vMf9ejMdNxdNHFYs?=
 =?us-ascii?Q?+Y6nGD6oTeXfHxz4DrZYq8chXNYn0qraCKuvsUaaAAbE7J32aMg88+l0ghVc?=
 =?us-ascii?Q?h/V0vA+u4uZyL3muUIiTXxHr4TLiNmMl4pABXhlKxWrhGF9irees4h49/wGL?=
 =?us-ascii?Q?Z3TWWaPeH0HnMJURmpwPpqBf5RA37CqYxODFYAZ5hQSZw6Wlb7I6D7i5ww2A?=
 =?us-ascii?Q?YZYOxazLaNpV/Ac1mJi4qMYneEHzkklplJqpgBB1TTPIwSaWlv20wknu5SbZ?=
 =?us-ascii?Q?c0Ycs8ZNQRwKXdBD1zCaZmeWsg7XxVOWszvZdMV+ZtcP9D04AJmOJ2xCJWAi?=
 =?us-ascii?Q?a0YDmhjyIWDrgePcNlM5uZdqYslAu+tze/MLSkkg0qfbYacR3jfc?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a29edd7-565a-47fc-2f7a-08df2510284f
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 07:45:43.7529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3Qs2WXxFe+5SVMlcr9st7Kme0/cOT6InWNl/Qsh7md02mzMSSd/Ybj/GWu3CVIgBuQJjzi14i7vjkI8FsP9ygUfDeIcRQaCwgdnjIE/9J4lYWFBc9/Y8ReAki4KUdKi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12525

On deep sleep the USB2PHY block loses power and the VBUS_SEL bit is
cleared. The mux state is read during suspend and stored in the private
memory of the mux_chip. Then the state is restored during resume.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/mux/rzv2h-vbenctl.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/mux/rzv2h-vbenctl.c b/drivers/mux/rzv2h-vbenctl.c
index 2699458045f3..d088ac3cab2a 100644
--- a/drivers/mux/rzv2h-vbenctl.c
+++ b/drivers/mux/rzv2h-vbenctl.c
@@ -15,6 +15,7 @@
 
 struct mux_rzv2h_vbenctl_priv {
 	struct regmap_field *field;
+	unsigned int hardware_state;
 };
 
 static int mux_rzv2h_vbenctl_set(struct mux_control *mux, int state)
@@ -60,9 +61,29 @@ static int mux_rzv2h_vbenctl_probe(struct auxiliary_device *adev,
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to register mux chip\n");
 
+	auxiliary_set_drvdata(adev, priv);
+
 	return 0;
 }
 
+static int mux_rzv2h_vbenctl_suspend(struct device *dev)
+{
+	struct mux_rzv2h_vbenctl_priv *priv = dev_get_drvdata(dev);
+
+	return regmap_field_read(priv->field, &priv->hardware_state);
+}
+
+static int mux_rzv2h_vbenctl_resume(struct device *dev)
+{
+	struct mux_rzv2h_vbenctl_priv *priv = dev_get_drvdata(dev);
+
+	return regmap_field_write(priv->field, priv->hardware_state);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(mux_rzv2h_vbenctl_pm_ops,
+				mux_rzv2h_vbenctl_suspend,
+				mux_rzv2h_vbenctl_resume);
+
 static const struct auxiliary_device_id mux_rzv2h_vbenctl_ids[] = {
 	{ .name = "rzv2h_usb2phy_reset.vbenctl" },
 	{ /* sentinel */ }
@@ -73,6 +94,9 @@ static struct auxiliary_driver mux_rzv2h_vbenctl_driver = {
 	.name		= "vbenctl",
 	.probe		= mux_rzv2h_vbenctl_probe,
 	.id_table	= mux_rzv2h_vbenctl_ids,
+	.driver		= {
+		.pm	= pm_sleep_ptr(&mux_rzv2h_vbenctl_pm_ops),
+	},
 };
 module_auxiliary_driver(mux_rzv2h_vbenctl_driver);
 
-- 
2.54.0

