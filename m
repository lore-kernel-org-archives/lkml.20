Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013012.outbound.protection.outlook.com [52.101.72.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6413DDDCB;
	Thu, 15 Oct 2026 08:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053439; cv=fail; b=ZefJgBPCzFzonnc1BJAUcgtxRn1JruJGCetr5a+ba9PL/2dYzxZFt7PqJXMWrHM8OMyQetd8Bs7xPVuI8pJHBO0ZtzibsZJjxlgbtQYCd9Ij35ROOF1WqBv3BwOianP3XI86LyfQ3qQ6aNaIv2cR4tJMm+fRgbe42tH25sbjOa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053439; c=relaxed/simple;
	bh=nMEVS/tmDd2nfFYq7235NJA0OOl8SuAJqLZbtMH5fLA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=RpVtwJOEUr3vVhhKq9LJtKfKJltwIGbvdjhfDRGSHobUEw/NJu5KP0BJdmeHQGQctTdIw5k2qymz/EKMmQijglr7st1BfWMfubSVNxYvUummJjvuWuLtEt6b11+eLT0H9JDMTtyATvR7/awJ34zXkKkHTBnRMINJTw30oK4N040=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ieFs4hi9; arc=fail smtp.client-ip=52.101.72.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ieFs4hi9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKesrXv05Qb+tHw+4HhWZl0jlbMNvd2W6XkbjdKO6PIL+AuaJxs+ZwXpkF3PDJcvzA0faB7O5sbNdcmtVtC0cElxZ0rBcTofK9WjnIVLNLCnnsPoOgAZDgq6SRiPWhZ3sJX53r1DZppmEZ/PX9Ny7FluMA1pwJPklrM0umlnumQ6tpqKK1vqVmP1EQGbT2e3pyJbpIWBufB5sMc1mQT6PueCfNhIAlpzwzqX93Bt9QfxmPOD9z9gKr3RudKp1GxW3llxzY5X3VDm6bKud93M+nUmwuarUzx7dgxgzncPgazxMrgAa9wTvGL/g1tHItZmfQ73wVgpNU/OQXYwVPCd+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYlZPvQuHvj65ToX2Gpf0xcDzUS1JOADQYvoxSVj/3E=;
 b=ZeqFr5UXzY31wHNhnDqaPazK1z5zCyuOcK5diqERbph3Wjg+BFYM6GzV33tkxcsKb3qi3L6mglzUr2yALjv3UGJRoJ/BkUUdNLEx1rGyMUGHMrIgYQaW1dkob+Lh3JrnEHBYhxbFwXjCWQGZpJaNqTIJlZIJQfZZToMJWFm/j9XXUS6sXhvt1Jo/nPNBWE0R0Ty+CeOmad7R1rQr6BS4KaIUQnclWG0TMVMdXt64hISwj88jbkqcF+qmO0xb1eU6tbZnJzUSJhozeXZXUbJibb3qcMS64ExZlUglZ+8QWKs4Xd6m65SjTFf/a+2u8M/aW9mp6/U77FfMTWT8mMe2fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYlZPvQuHvj65ToX2Gpf0xcDzUS1JOADQYvoxSVj/3E=;
 b=ieFs4hi926tTVwdaMHARE/LvkDSPJeC50tlTsEBdFGWeJANtukh89ES8LQui9y2yizwS6RqcO7StR0Rf7I49wv1ymXIZ58evoNXPRdEtQkW7G6FL81hFzNsrNCC+QrJgX3c4dt1NtGxiIts5rW2oQQ1qOUgAD8pZyptjA62vMzAnzWmWhj1MUwNzS8HOQMWBU0mHpHgekOnrDxf5lOACNzQ8meVQ7YFEuvDo3rqKfoFWwN/RItkNobO5HkHfBfSAiQ9iis2oubnqSY+JHSAyePAU8YB7FKxrmXeOuygp89kS/WI5C8ATxCUdAPky22/qyRIIIlh2jXCN6qh+VIlyFg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by WA4PR04MB308399.eurprd04.prod.outlook.com (2603:10a6:1d0:109::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 08:37:08 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 08:37:08 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com,
	guptarud@gmail.com,
	regressions@leemhuis.info
Subject: [PATCH] usb: chipidea: otg: fix fsm deadlock and B-device gadget registration
Date: Thu, 15 Oct 2026 16:41:40 +0800
Message-Id: <20261015084140.61544-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0216.apcprd04.prod.outlook.com
 (2603:1096:4:187::18) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|WA4PR04MB308399:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6e41a6-5fc9-4a05-9375-08df2a977fbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|366016|1800799024|56012099006|5023799004|11063799006|261009223027099003|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	AVSBp0gPBTxYEnkSiFBfeRxN9BUYYv02nHwmOC4cjJCmlTSvQ08fws07WKFRf43uKRtCIDF/1rt9shL/+igA6lfr86R4b+OIfWpkb8FsMy2eq75bYNay0Qv1CKaLAQWkcuFTvC9eo+1E7pDAawhKFEIJrpksnaaCk8wWHGbnWz8y3TO9WVf+KB0IoNUlaIdwSr9NK4nZx+WR3hMTHLYQpkaLdjZBgMtYOwoYE4BvwTbJloRbLsKR4r6HslkDHt4JuxfcGatx1/CrVbp1GsI15jwHqStycZtPtYJvk6OGMY/jWeHhHx0DvgjBJ1KrfwnhaaSDkATnmPCOVFwPdJ0QeIJjtdb6T4Lk/oYuUjdBdooGy+X4+oyEU5diqfP7NJevbobeQR1ZwrRpG8qN6FyD8Hi1Qab92YVFadqzF2C51zBlS9fEyOD+9UqHQ7JtZGdge/9TQ1kKPbsEBXTfPLufCdA+iq25O7vEugUFhk9jBNMajPyONcXB4yKrQA5voHHR8wJboiKwuH03NCEygv2YWnkOqgCRXA98l7bI7LrUHDmyJAua2cKSz1JGl9Zfxip4+oz139v7hsHvi6wjSMHdnnh4w9YzsptCBlGaHFeMPySWcnUrWq9xntyWHNZWKPdj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(366016)(1800799024)(56012099006)(5023799004)(11063799006)(261009223027099003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t4f9X2Paef6Q269ihbWRP99hH3X16ZmxN9o+fNv11FIoD2V2D/uCYzeZ3hDU?=
 =?us-ascii?Q?U1VqBzo78achQLsmMDNbbZ/fsv6H99ytNl9ZZv7O+kbQZTpSwjcRt0PLFT+a?=
 =?us-ascii?Q?5NGWNO2IJxkXmVEmYLjpOURbG3fOiZUFlxUpG8fz7jZpXm0tWOC35YANSGMM?=
 =?us-ascii?Q?X1feq5tDcn2R95IyllXb1gbpgAoku9eAZdTLV+d0Yy6LUAikk/zVqfWJlQOJ?=
 =?us-ascii?Q?QSYv3MxWihQOneP6HQTba93WN5J3HAACUMr3iWEQlDx8AY+OHqhtd8gkSDMp?=
 =?us-ascii?Q?VOxwaOA8E2FeSd2RLcn+SCiDr07UCyhfkh5QpWVkiWMOSX7Feebt4Kd8HoRi?=
 =?us-ascii?Q?KqKSIZ0zGcLiqM947DNEx14CduywfusAlrbS2XZm36NVgAJ/MubMrU7qwxAt?=
 =?us-ascii?Q?++NFXacCz8K1IWm2O49BE3rN+ie05Rs5oTysljFYdgodOu4VXkzTG3jvcmTg?=
 =?us-ascii?Q?gCQdamEMYbQ+QoyY/9ad7CR6vtxif6uxNix+ZM9lSP5D5nESY0vDBRdh0SGV?=
 =?us-ascii?Q?E86GZBR4ubPx0dPeFdeFIBdjCIv1PFyfq2gV2KKtr+2M4cavoKzrHrmqnNH9?=
 =?us-ascii?Q?oq2WmDFZaFlVl4atl9NUv8zZopG7i6MO86VQlTKgFf4wJ+T7tPF7VjonXsUv?=
 =?us-ascii?Q?CMYUkW1Tp9gX4muwGzXI6p6BhEbtBk70mwkF+CWe/lqk0kE+P9/qnnJM4TMk?=
 =?us-ascii?Q?C0+MC7TCBhJaWbhGAIC/v2varOCxauzyNKx3JuoTukVmzJjYLNN9xSa7Lg8j?=
 =?us-ascii?Q?64Y5XFQHWvnpKgQgiLYs6nbGo3Gq12klfNMkcpY6Msz9fqgdr+B6CIMe+Fzn?=
 =?us-ascii?Q?3C7e/88ayRI6ujbqKDJmK+0ph5tBK1rkviCP53XaG6XAfLKOsMBrPMrl+fvk?=
 =?us-ascii?Q?TKuAYxyMpiUW/VV8K6+66JYZuwI+VaaF8GtODC/DI/uRC0nqyuazjW2wGV2f?=
 =?us-ascii?Q?u0DjG/nJXp3k2PhWCNlNO0Ht7hfZPcm1WW1E9JU/zlGX7OYq/pdVJbUSF4O6?=
 =?us-ascii?Q?pY12ilZiiHZ1ABonhY38+ksjOTuJaS78LgyH2k4VOZCuMZSvYTLkugKeE1Zk?=
 =?us-ascii?Q?oVOXdaSf5LKeKTtNEqxesM7k7JTy+wHGsk53AlevzpTpp1iPfDRAx0QIjtju?=
 =?us-ascii?Q?RVtzk8NAzOqajxozH4Cug5WDOwAyWWqKSCdWVladVu80y0oCb4Aw2UJJHW4+?=
 =?us-ascii?Q?oaYl1vz5Mt8yrt+HQ/9ca9g/LcdUTIR6jG7IhCF+Ol0DZ602S2QIgUbHGvbl?=
 =?us-ascii?Q?8sPrgjtgpvcIgaOyyt2uOboIPLs/yjNN4qqpqGoP4Ftyr0dDrxsfYrmPsbyz?=
 =?us-ascii?Q?kCXPULyWY+AvzbzxAsEVW8wpnkqBfFCpc5oFjw4v+8WdRZndD/J8oycpLSBI?=
 =?us-ascii?Q?Ydkc6goDKrLxq8b6N6UPtkyVlrC1kqtUDIz8jlIs4NR+A7PNRqx2A7b368Xo?=
 =?us-ascii?Q?KdExEOCQjRHdT7gwdT9DsWX2Tv24dnHNyihfbWG4s1I3mCznI8A/zPgjKJ30?=
 =?us-ascii?Q?20R5XgUsMlaC0BEm9mLJsx9CwcHDCFYrCwVSixy6ISoay1gYrV9pp6NJQX3/?=
 =?us-ascii?Q?2qmjwlvmGTW2gVA07C1gie/onLTKqy5PkaS+WdQYmN8HhZptHX02pUuFVEl/?=
 =?us-ascii?Q?6MwPh+vdOOjTNAFbNz3lxJqY9okM0UEdZwJTPMtGssGt6gH6i0RGin5xuC85?=
 =?us-ascii?Q?xVlxgYU2WYDLeVn38WBic92mUGxmVIAnZ3R+dJy+Ms7/ezUQSEbjatG8EyRz?=
 =?us-ascii?Q?84RQvZJ5j+RUq8hOM9z5f0qlzVM7eYPSdsQ8axEpOr5ZBi1um5fz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6e41a6-5fc9-4a05-9375-08df2a977fbe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 08:37:08.4738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5hcQzNRohLJ2bE8aR8SGSUPEA51N+nDTtIdGIU1TbjRlWM3WHoQFHEdubKGDRX8FITJEwM39T2g2cIz+Fuu1+2R2QdbJXVYohFXHdwITZmzHfDTuKErnviRXIJeMSqQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA4PR04MB308399

From: Xu Yang <xu.yang_2@nxp.com>

Commit dd0c03d68522 ("usb: chipidea: udc: support dynamic gadget
add/remove") introduced two regressions on the OTG FSM path:

1. Self-deadlock on gadget->host role switch.

   otg_statemachine() holds fsm.lock while calling otg_set_state()
   -> otg_set_protocol() -> ci_otg_start_host(fsm, 1), which calls
   ci_role_stop() to tear down the gadget role. Since rdrv->stop is
   now udc_stop() (previously the lightweight udc_id_switch_for_host()),
   this reaches:

     ci_role_stop(ci)
       -> udc_stop(ci)
         -> usb_del_gadget_udc()
           -> gadget_unbind_driver()
             -> usb_gadget_udc_stop_locked()
               -> ci_udc_stop()
                 -> ci_udc_stop_for_otg_fsm()
                   -> mutex_lock(&ci->fsm.lock)  <- deadlock

   The same thread that already holds fsm.lock tries to acquire it
   again. Use mutex_trylock() in ci_udc_stop_for_otg_fsm() instead:
   when the lock is held by this thread, otg_statemachine() is
   already driving the exact same transition and will leave the FSM
   state consistent on its own (otg_set_protocol()/otg_set_state()
   overwrite whatever ci_udc_stop_for_otg_fsm() would set), so it is
   safe to skip the redundant correction rather than deadlock on it.

2. B-device gadget UDC never registered in FSM mode.

   Before dd0c03d68522, ci_hdrc_gadget_init() unconditionally called
   udc_start(), which registers the gadget via usb_add_gadget_udc().
   That commit moved udc_start()/udc_stop() to rdrv->start/stop and
   removed the call from ci_hdrc_gadget_init(), relying on
   ci_role_start() to invoke rdrv->start when a role becomes active.

   However, ci_hdrc_otg_fsm_init() does not go through
   ci_role_start() for the B-device (id=1) case, so the gadget is
   never registered in FSM mode, and no gadget driver can ever bind
   to start the state machine. Call ci_role_start(ci, CI_ROLE_GADGET)
   there to register the gadget, same as the non-FSM mode path does.

Closes: https://lore.kernel.org/linux-usb/8e659c4f-723b-4241-9c2b-8ea42c6c3600@gmail.com
Fixes: dd0c03d68522 ("usb: chipidea: udc: support dynamic gadget add/remove")
Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/otg_fsm.c | 2 ++
 drivers/usb/chipidea/udc.c     | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/otg_fsm.c b/drivers/usb/chipidea/otg_fsm.c
index 642729893cc2..03bebee17eb1 100644
--- a/drivers/usb/chipidea/otg_fsm.c
+++ b/drivers/usb/chipidea/otg_fsm.c
@@ -840,6 +840,8 @@ int ci_hdrc_otg_fsm_init(struct ci_hdrc *ci)
 			hw_read_otgsc(ci, OTGSC_BSV) ? 1 : 0;
 		/* Enable BSV irq */
 		hw_write_otgsc(ci, OTGSC_BSVIE, OTGSC_BSVIE);
+
+		return ci_role_start(ci, CI_ROLE_GADGET);
 	}
 
 	return 0;
diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index c29b2d0dcc7c..1e0d295f5431 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -2167,7 +2167,8 @@ static void ci_udc_stop_for_otg_fsm(struct ci_hdrc *ci)
 	if (!ci_otg_is_fsm_mode(ci))
 		return;
 
-	mutex_lock(&ci->fsm.lock);
+	if (!mutex_trylock(&ci->fsm.lock))
+		return;
 	if (ci->fsm.otg->state == OTG_STATE_A_PERIPHERAL) {
 		ci->fsm.a_bidl_adis_tmout = 1;
 		ci_hdrc_otg_fsm_start(ci);
-- 
2.34.1

