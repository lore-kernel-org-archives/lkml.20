Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013047.outbound.protection.outlook.com [52.101.72.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C6E44AB84;
	Mon,  7 Sep 2026 10:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775967; cv=fail; b=scf9kEiAYxvMDUL1mtwElYTV+tLz7FAlIfJEeaHLGafn7X4cK/b0yjU/HoHd+XymbUWT8LWa+tWswHiCDKP143L2znLnLC2Fkoeb4BEW+O5Coz2/PUfr2FpnkWLpUzmagW/e1T/RdStn1ufen7yDK+oNmHWtaQoZ13+IK4WPqZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775967; c=relaxed/simple;
	bh=mqGjQXV24dbrrOfkfdAmMCc6TZarCyFS4YC7MlXAJI4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=CciU5ugtCMsPbY01gtazdYhtmf1Bf5hUT0gA7Qbr5mOErhKfVSD6GBXByWuzXryPYU4KpHnXlJb720SCIPByXUpql2syiVvQSM/7d0czF1VyaUnxnfGtsJ5BgtjOlZ6E8+gGfxeh21H5NVVsYpOnVzaGoMfxsVURjZdefF9AHyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oBujLVy7; arc=fail smtp.client-ip=52.101.72.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oBujLVy7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOjPMCXzdezJRAIxVKIfvtf71zGdegknr9hqN7/axqy0mjWCJ8qbOfhRs5o/Sq8+1vAzLMmpUXhd4CWXyD/S+C0h5fV7Kr/y/TEm+YZ9w18gjKHv0MXMD9XP4RqhTGPQU8y9ZG05QrScA6D8lIFRzVNqAWD0nBavSBQkIyrxFWpIWLO4MOltOgyT/tJPUdLhu9UflWww/LbIy5aHd9ds6eh0U5VJDy+UiPxC/ikxekBhudAWgK1pJg0sCJDgnMZjOpooXQqUZvxMMurbXxXkhuaBAtawFOz5VFMXyg/DP5mJMqPn5oJRwLuHbpZXPV7WhNnigHbNZJgB2m5tlTqDDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AL0MUTf+1mqbnt2uYHxV0hfMurc3JxfRr/JbJ1xQe20=;
 b=QziFjJZEFvL3Dp4UaaU934KFg6F2Trnj6Ugp6dOPdgPfdHI5ClR5uZdM9+UaAmMA5mtqStJUoqS+LHSiFFrpxPBabk6kGC73pbsvO4c+T3Xtsb9TJdCabfir2b8oQ+1t+EMyZdlTvrm39F3SrrwH3AnwIKm7aayDeZgwLUtJGgK5EKDYSFvS5V8YX1/9IyYzF5DR64SgAIX7MEfsFVM7tdr3XGg+FED9lnIXj+bak0hRStEF4pqJd8in3tIh2dX0jpBFCGAXw4cJoGA4RxPoUzuUV/TiwlnGsL92peQsF8vXYxUFDIdJ6iT78dSxeVeKLEZtxG1iHccTc97/0w8zGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AL0MUTf+1mqbnt2uYHxV0hfMurc3JxfRr/JbJ1xQe20=;
 b=oBujLVy7E3LDTY1e0E9Lh3SB5yxNN3fJVnoZJ4s1AIMCt6kwx3z5duMUHqYAtCJFBPweoybp/RvuX46sz5RsVh8qUTfZRrNG8T+iEfDpov0BUEgTDTboW7OkLqmpuX/l6iuJmhmx1/8fgY/T7XnfP8LaXY/alrKck6kIvSi52ZWmWd88UXnTMNm9XIu7ZkMfY0E73DGoUsG8CacBi6AbTZmL8UPEFYffjcpp39MajO7nnFYDtn6135VSPPQ+5Die5YC11Xi3vsulMbAhWVS+E6jwWW6VDOio14HsJQEL2ruYKl19s/kp9bHWp4XPpYHnBwOwwBM9wh/g3Kr+O/1Gow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by VI2PR04MB10091.eurprd04.prod.outlook.com (2603:10a6:800:22f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 10:12:41 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 10:12:41 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2] usb: chipidea: otg: fix invalid role name print when no current role
Date: Mon,  7 Sep 2026 18:16:43 +0800
Message-Id: <20260907101643.2844296-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::9) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|VI2PR04MB10091:EE_
X-MS-Office365-Filtering-Correlation-Id: 981cb080-3b3e-423d-8775-08df0cc88d45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|23010399003|1800799024|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	T4yNDBakQcNKIO4IMADbPRQlSmMlhWR9CuJ+jobSYCWcwYZYWJFL0wGrzcFJu12IcP/gMdPMdHA9Vfsxza/V4M+LdSpuSvrte4MXuFLVYTazrP2QYU7DvVCKN5MZgZApjLX9Vm3xne48npwXWk2ifaQRgWH7MKQzOHuM9OtVi2LSf4UopDjggp3tS3l23Hiwlcrc9i6kRAN5MaFFAkjrlfBwmn2RajNBzkCLDhFWUfM0GHxK0d7cRv5gk22ohLTysimgpaRN8hfrkZtGyfJaNpo7X4Opt+sJR9AanzgKAeSMCXYQAI7xOFWOASX5P0lnoB/Uh4xzOuEjKh2MZ8jojl3GlerBZKSG+sV66QTWuiZvLy7+MM/y4drtvM42lZWXGuxnSL8B7gXeUUNlFYXMtOkR4cxxxaJa6tRkbnD7z3HsTBsymr/AdbBwabWJDcMqCCA1MVuj4IMUEeQWXHY2kT2CH5k5ZWsx99GjqMM6NEDo+2isA/H8Rhnj67LbDYerhKJ4ns1hNBioaalHmVrZRDtPSn+CQbJtR4U033DrsmHg0ToyyUMUJ/fYTDTgKqVCayv6xjXAZcT0MjxxIkYDj/eQxA1wgqpn5yD6FMCZRLuliPhKviZVovRaFabwZ1mmO4NB6O+wung0IpaBBKY6ZW6BFaAOFFbEOd4tILKsNsc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6RudOWdbmrMk/CH/QKKLEDIQmp6GxtbaEvG3hqMXM44eWUO6hpKhj2QU37L4?=
 =?us-ascii?Q?s1DGAQnHsqju0dtwnRIg6A0jyklCuPU4ChRDVpj2XfSdZMZAcRgZ+2IgtApr?=
 =?us-ascii?Q?Av1HYdg1YLPGxOtTttREh1eaRz03HwzQ8AAEFmpy29BNpJWpZmVjkslM/tTj?=
 =?us-ascii?Q?DV5TOOhnCyKCRsBTj/xt9zayQYXe7uhgXJ/P2gGu8jDcQZ0FOdnSQKyrACYp?=
 =?us-ascii?Q?hvp/uwnJfbplUBQ6Tl4tqynlQZ5zOEQXATM8MkqNMVlzIH3err9EP2cyOLq5?=
 =?us-ascii?Q?BUUOYzOnhZdG4j905LQ5M989iDF0ks4VubRMfmy+UImmifRVtoMQlmFkw7y9?=
 =?us-ascii?Q?dICLk4LcTJ1koREGjuW7YsObU7iXXgGAUSnMOXbBeCdVIFqYdXr5x7YRh8IL?=
 =?us-ascii?Q?wpZy0pQ6DfJalbDfheTwiicTpgWu9xcWMf4e1tv4xmpN1N28LAXS+cwF6Wok?=
 =?us-ascii?Q?vR1+UWeUDmy+URE9R4BHDl1gKy9820ItwZW06n4fPwgGe3IPocqHPdhEulVT?=
 =?us-ascii?Q?fDcPX1Jf+dJTuMyNCojM1ZLJWvy/EaDkfHiJAr45e5Whv5GpcVdUdQp9vktZ?=
 =?us-ascii?Q?l9XleQQceOlkOD+klNFV3zV/G4tVroz3MyPRR0+eTtJHLBOocLRCYknJYwXM?=
 =?us-ascii?Q?v41BE6eiJmrQV+FkBEjT1Ot6Qz3vumhryEeJSRaiiH5mftPG4utbNDTJ3x4t?=
 =?us-ascii?Q?3Kcy4eP4BICHSW7szbd/JhsJfhTVM/8naajU4SSbq+gQGLHH+r2G4m/1LTaL?=
 =?us-ascii?Q?2ijWptI07LhbP6Lb9h6jZ9LL7AJxt73gLWJ/3rNMhcS3L0dBL+t2fQ1t2a9Y?=
 =?us-ascii?Q?TksQVQ6qi8JlUYxGfPG53UFnf4mY9uL2+WluVyBpFqImUstzFouzeFW7xY+H?=
 =?us-ascii?Q?YVlVbMbrecZqEMNAz8sq7Q2FBKZ+XifPZkaYIrbndr09VhxsMaoGOrNNcy6m?=
 =?us-ascii?Q?urDadhakDtg+XvAvC2Liq7yb/zK7AT8w4ONS66PzpPQ51/uPr7TYRxKcdY9K?=
 =?us-ascii?Q?jWLc3XZHmmTVBAuAsraL5YlAJck0cQ5zQ7qSlvdeRaf6jVrCkqVUWQNQQp0y?=
 =?us-ascii?Q?TfmZqLUDwNI8/vONeYBsJWpfHXS2cZYaoGqAmPoTZsvQSkFpKS2JsDko2Syj?=
 =?us-ascii?Q?AUSVsA3j1LQAq9s62eJhro+qubQwnopmxsM6Md/SHZcEogbtyVv/6mT9Q0LM?=
 =?us-ascii?Q?Nnskq8A4ijJqa4s54KVY/9M/rfcPyH5Pg3tUmv7UPyxN2PJStT9bT50kcOMF?=
 =?us-ascii?Q?/o9P3ogD3v/nTdR6x/s0b8ZfOpxSTSU9kqUGuUOkTRh14ARMDByHeu6I6Mv0?=
 =?us-ascii?Q?dh4vFXwgAGAAWzZTP953ww/Re26zI6QRuJq5TF4VY3L6LUPksGw+IFwJxRAU?=
 =?us-ascii?Q?PZ2ilAdXXX8qebChkt7b4ZEoATyiwJPUSi/0WExoxONxiOeeQff/Wck875gV?=
 =?us-ascii?Q?MiAf9IyQDII+XE5hUVL54U0oqsmnc4IUsHTmtqclFcLvW49yZdFdzhxV7dYN?=
 =?us-ascii?Q?HEbfOdAQrpuRMGnGZpbMog4TI6G/04BptJOne26wxVy0JzPr8ds2i7rZ7LAr?=
 =?us-ascii?Q?OS9e7aHgtxzQBZoBamjEvRjL7syduUz4MHDGka6UWd1bQbo3a5EGk5F+7buV?=
 =?us-ascii?Q?e1L0ESo0BD35va7Utlxw1yokIiwB3bRVUGK5SMHiJNtg2Z4jP8WSn0VjTDb5?=
 =?us-ascii?Q?we2uPoHWAOEUkbZ85NnQZyOsB+V/n45fkgtFyn/J+ifMk+FthI++BfeWtTcq?=
 =?us-ascii?Q?vwXbGBS2wUiCYwWMnMW3FvR/KMW4wI3u1w5YMzq+72RsqJUSQXN4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 981cb080-3b3e-423d-8775-08df0cc88d45
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 10:12:41.4865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P9/rtSIwXm67XC5JO9c5GlmCt1HWN4951F/JgXzKlgCzSBK7SNQsjmrLeAtcZwgDwbVthZKH/Bvs2bsSrRm2c3ib6i4EUY446XfVS2E6PugACDR7O7pUurU2JewNdGL0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10091

From: Xu Yang <xu.yang_2@nxp.com>

ci_handle_id_switch() prints the role transition via ci_role(ci)->name
for the current role, but when ci->role is CI_ROLE_END (no role
assigned yet), ci_role(ci) call BUG_ON() and return ci->roles[CI_ROLE_END]
which will cause invalid memory access in the debug print.

This can happen if ci_role_start() fails during a role switch, since
ci_role_stop() has already set ci->role to CI_ROLE_END.

Fix it by printing "none" instead of dereferencing ci_role(ci)->name
when ci->role is not a valid role.

Fixes: cbec6bd55a45 ("usb: chipidea: move otg related things to otg file")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - improve commit message
 - use " >= " sign
---
 drivers/usb/chipidea/otg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
index fecc7d7e2f0d..5eb3b32c2e87 100644
--- a/drivers/usb/chipidea/otg.c
+++ b/drivers/usb/chipidea/otg.c
@@ -179,7 +179,8 @@ void ci_handle_id_switch(struct ci_hdrc *ci)
 	role = ci_otg_role(ci);
 	if (role != ci->role) {
 		dev_dbg(ci->dev, "switching from %s to %s\n",
-			ci_role(ci)->name, ci->roles[role]->name);
+			ci->role >= CI_ROLE_END ? "none" : ci_role(ci)->name,
+			ci->roles[role]->name);
 
 		if (ci->vbus_active && ci->role == CI_ROLE_GADGET)
 			/*
-- 
2.34.1

