Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazon11021085.outbound.protection.outlook.com [40.107.39.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90661222597;
	Sat,  5 Sep 2026 04:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.39.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788582640; cv=fail; b=TCagTOQBLUw+3K9/Y2grZAxQVGlJplyPrVTHFvCJND2gnU7yewzo3KfoQhlj/0H5g0Q6d3CRqZYX5SsCx5lvleBJ0f/Oc5N+Pbln44cmA66hAZThF9BZoM/cMf9KY1vcMROjNPONpmbwslD4p7RJzYrS/7bH/mioWx1GbfrG358=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788582640; c=relaxed/simple;
	bh=l5eFSWmDrWUmlGzbag1icVP3QsrBf1/XmaJ0kgccP/E=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=XJMO/QJDx6NwlD7rH3dH9BKxlogJWVYFO5d0YNZypd7jaf0wiB+bi6lbgDsQ4WH1NvpOYPxHkdI8J3X/X98TVNhbcKv0Yg5sG3UThAdDvr46JeH5J2k/GZGtmqsA3K17knhH3l0e0Ew4bXi/MX5vnWqdkbtKRKTkG5RGt/RzRzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com; spf=pass smtp.mailfrom=heitbaum.com; dkim=pass (2048-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b=Xe7RXmEF; arc=fail smtp.client-ip=40.107.39.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b="Xe7RXmEF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DenOUPWv38mli+M5zePJtR4ppcG+TI/KDw8u3fQDWUhw439Jhs8ztvqHAmpZKJw3LocGPpH8ol7+2hoRqN2/9S0NrKgdcHirw5sf9vsS3ztQG0sYrpVzJUSjQSJjzn2XQ2VdlOprZU8eV0fv8d1C59IOqwBSiQ1KoKK/41D2P0QwjtgIhzk2e/kQXI8gPmaV+ituggf9Vki/R2A0FAt9jc531WxWB2a+W0VbNfni5h0kjqRFN5Il63/2vRnzSfrCbI8oQ5dFLhLbeAtbE3JkLU2Vyaf4G0EAz5O8N+0d88v7av8asHtS4weyvAi0kfok0u9B+23Krys97hcfOPlSKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKYNfv7fUIyGoeuG98IwjaZu2+pcz+Wi2Zy+6/QOmOc=;
 b=hsPuqbkH3XaBK/K7d8Qrh9nkWtvQnWsE3JQFMvCXffR1rQ46ymQw8yh8Y9av+88mwEfqbPrygnfgTZ4E7YmWHOxCe9o2jnXO7G1HdDAtSNQJ501tMuauB8UPBpOW0Bv4tE1f5lPddsN+AFCDohg3SZSuB1PG2tV7pACj7AW/1iGRIbzxs5OMF+kWsy47Ansubk1r2JGlTr82dprugahUhg2FLGstKZS+2C+I20TgmGu2OZAGGk27uIgFrdxADeszYeX+LK5n5JEdx2LPs9liEK1lCkIVFgWziUGG7i49M+UlmxjXFRJnOjuU3dTBJU3x72sLsSrovpuvNDyD5fuw+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heitbaum.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKYNfv7fUIyGoeuG98IwjaZu2+pcz+Wi2Zy+6/QOmOc=;
 b=Xe7RXmEFI2EsFVqJs+89tN3oRKTr8a6GsKibE/cBqvvDqzSHeD49tIhrhoY1bGAXL4vj5kSQi0FwA69PUjb0JA8TT3WbIJgOzVbTGpTBTlJuqXjQ2pySFi6HipKycqVt81GL++6NKs8Wx5SJJyIsSLF55GSRy9qQqpcwP2GpW0YY46QmbdJ3djq3buH+syp1wyEYMCfUh9ZWgnUCPWawhNriM2eeikUSIdgSeoGRbWJ0EIpwELUfxeZTUUkoOOR1P68a1NBoz5OWItwpuq6Jm1GC4Mr+ki/NdUPBW3QejkI9XTh6Yvysivd6gN0nz/miXgYyocgn+RboEp3Yl5ovjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:279::22)
 by MEYP282MB1542.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:c2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Sat, 5 Sep
 2026 04:30:33 +0000
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd]) by SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd%4]) with mapi id 15.21.0382.012; Sat, 5 Sep 2026
 04:30:31 +0000
Date: Sat, 5 Sep 2026 04:30:17 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rudi@heitbaum.com
Subject: [PATCH v2] usb: onboard_dev: add the Rockchip rk1808
Message-ID: <apua2dvd7gBXHVM-@1b5ead44ca90>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: MEVPR01CA0042.ausprd01.prod.outlook.com
 (2603:10c6:220:1ff::6) To SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:279::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY7P282MB4909:EE_|MEYP282MB1542:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f77573a-9fdd-4755-42e2-08df0b066bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	Y7LYbEVjiFx/I/LHBRm9Svf9s3/YSgE6AGDfiJZD44HyiDoktCPCSceHUYdDDEFGGF+8KanR+aWnCOk/yZG+8zZFftlXqPTnjbg6EVKBYf4J0aCJOjYtKxKfhHiXwVjn1PkLRXoC0QOzuQF39MPqxXabPBLS04cJBJ3U3r5NlAho8ShUFRii/ZT05OUFFyl78+dx32MghYflnK6yK7fAGUmgcHXFwkIQLLVnN7u5/TpUyKEyJM/QfhND1pwvOt5rZ9jOzpnW7Vlzfcn8/lv1be1hM5VIXnvDCZvX7UDG24MllqXFyi8Tmv8kd05mXz5x5Lh4bl6YxFvWc6VD7NdcA8eLZwPjOghQdU1A+pr+1WBL7zYLZAIOaFHKLaGoAOw27LrISdeWMhVFV8j88MWtnOGviXDYGBiowjTzzE+snxHnSROnw4JIMfvAQ/Cd6PEJ22GKAuBkbczu6vM6AIoCGxrLPPA40RA8Zm+03ONhzO5k9mtJv83CK0T2SMYWcyn7C8Qbp8AiukQz60ALOkJb4iIRo9Av3IjNDcBXUBomjRtwnxyimz1Kvgv0ff5Ifb2+kz6gWjoUUshfDpbad7jakljuJ7ycJ3aqWFJRML7xdYQHImUQax/54GVv6YcxVWi2LiLHdFVbZNnaX1ZkhA8+BDIRXq7xAz/CfCEufRdr5ms=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TO0UWNI/0nPiXP5ggHYMoruhxpsn62qr7e0mfL7vFCTZOpP81ZUorc/iGk1b?=
 =?us-ascii?Q?4+A3uZhCsFJ2OIAfsrbX/yaSQSVTa/XqXxmgjlV4lVG+0oLPujpG6qhHjFYA?=
 =?us-ascii?Q?k3cNs4lFtZ7IFYM8nV9r2kKiiWwLn0iReJ9XMsZaUNyNtUT/HIwkMfaRsDyY?=
 =?us-ascii?Q?Dc+mcJiVyIO1TQbnXVmuH7fdbag9V1/IHo/IDX5XT0inY5g/kYW0iQdKdP7U?=
 =?us-ascii?Q?7/FzGJOAjU8SpALBtk88pfVYc/nRyzJGrGQt61IjzggtJcG/Yzn4yRlka22l?=
 =?us-ascii?Q?yaJ4qxPPOrW9MTqp9uNzbcTbQrk0Zoa7kVKorEdAdNXZsCUZv0UN3zkc+bKa?=
 =?us-ascii?Q?H6Vsn61gzVBtbkWaPnZh24k7xrNfMqsEZklJhU8/vn96mi1ArC072N3yMuvo?=
 =?us-ascii?Q?ov0/ek0jC33tQRApnp8chVrnnx9LDuSm6rcVrGT5+lvCPBZnamSzg2krdCnf?=
 =?us-ascii?Q?Fs0QuN37wZk2hTL7uo7PhZlf69dCrCHejIhNId65ENwB9+SPjSf4V4q0Rz99?=
 =?us-ascii?Q?zgonpxS6W6Qpa4MWTvWyPONDEJEb78pAvHrOBiKTRkg3WN288jjkF1ycEoUJ?=
 =?us-ascii?Q?2YtUatwl7DwlLSxlZii/00FHIMnf23TIM6jCG2Y6qH58+6h6YToukS2Q1oRj?=
 =?us-ascii?Q?J1y6iS6SjMwwIiD/Ly9d3mYmWe09BJN938kyc4n3UIRgmD/BJ3QUcm5pXVVi?=
 =?us-ascii?Q?s3QL8yECHTZ9no+0sd18P+U66CYvt/c0CoygzvH7feOo9mKAz7rbxUQJLSqD?=
 =?us-ascii?Q?yBHApxcrTp2exl+e7id+oozm2EPVQ0WUOA33iDn1W46dQoHIOHgbiZClCSYo?=
 =?us-ascii?Q?LacWDXAIuZWm0jFGugqEIOsKFNw5MwcoX1OIB8Bg0faIxEPCQ9FU/Fktdxbo?=
 =?us-ascii?Q?3d9MtNdysTgjeYLJArfHHV3Zs+lLW/gz8jVdtHLVR1r3Ac3rjFFeuP+pp7EK?=
 =?us-ascii?Q?FFC8WW6BB1rkHyJFuc4d1Sj+JXfm/jlLorebTJZqPp/IYAgAykaCx0v2ZT2F?=
 =?us-ascii?Q?+RfMo86MaUD1ehUqFpXnrsgzTafpocKrGk7rjRYJLpkYJQP+x9hM4XTEOyBr?=
 =?us-ascii?Q?bfgqekjg1VKXY1S8YGRybD/tkRTW0mAQzaJXlIEn+MYee4ICAhhrLBd1xlWo?=
 =?us-ascii?Q?qoxhKXlROKx0qCAciWX+rG5klu1iOB9KGmUOHKM0S9Ajh6s0v+nH6ZNph7Gq?=
 =?us-ascii?Q?UVq9zGtZdBFLFxGRYs1kUlmUi8jWnP9VQUEsa5mqjZoju23BWvTXaR9vsQ1h?=
 =?us-ascii?Q?DcES8o62qJZDa2L10imhbydPpwmeke9Nn92qNM4KMZZJNnBjD6/v5D+eBfR9?=
 =?us-ascii?Q?pMRaer5cxEeSeJH7053SbV0dllhtUnTSu/E/krUYLRaxHrQnXQI5bOzrUbgF?=
 =?us-ascii?Q?upoWCSF9rKhiWfyKlDMUNlD2mYgB2XdFS5BK9RActCgCjKQ0OzkmQvV5MZQH?=
 =?us-ascii?Q?koQ0WmxoJJ7LTQpSql7qHPizupYNlMIThq/W7odyUIoOKtRHMXFWhguDmmrR?=
 =?us-ascii?Q?0IVw5w4cn5s/wADWRo21hfR+JFFGUESUYdpCPdrNhhO2ZWcZsKb20vF7VePK?=
 =?us-ascii?Q?JnaQdktCW6CjZ4MLZVIolSR7RKZmaGBIJ0R9d5qiiLnqm4fMEM7c5gZz5J0M?=
 =?us-ascii?Q?DxPdfqj0GyBp+XIVfY24Dh5IJ911oW1dHk4eQPx8rzW2ZLtVZr5he63oQdy/?=
 =?us-ascii?Q?owi+i1x4+Q/9s7VbeSW9yPAVNI7P6KZdAwMA9Wey7PrS49S5?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f77573a-9fdd-4755-42e2-08df0b066bbb
X-MS-Exchange-CrossTenant-AuthSource: SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 04:30:31.6638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PHz4LI992pDHY8R/D+ImIcDVOPvEdINUNMXExO5QbsQT3+OBYlrJicqZvJwk55o8YlhmM9SLdDtdIqKOiihDHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEYP282MB1542

The rk1808 is the npu die in an rk3399pro package. It is wired to one of the
usb3 controllers rather than to an external port, and it needs its reference
clock running before it will boot, which is what this driver exists to do
for onboard devices. It also needs six rails up and its reset released
before it appears on the bus.

MAX_SUPPLIES changes from 2 to 6 for the supplies. The array is fixed size
in the static pdata and onboard_dev_priv.

The rails have no ordering requirement, so enabling them together
and releasing reset 25 ms later is reliably working.

Both product ids are matched. 2207:180a is the die in maskrom awaiting
a firmware download, 2207:1808 the same die afterwards.

Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
---
v2:
- describe the six rails and the reset instead of binding with an empty
  entry, so the die is brought up by the kernel rather than a userspace
  script
- raise MAX_SUPPLIES from 2 to 6 to make room for them
- checked on hardware that the rails have no ordering requirement, so the
  concurrent regulator_bulk_enable() already in onboard_usb_dev is
  sufficient (Chaoyi Chen)

v1: https://lore.kernel.org/all/aouw7rH6FZxscUTO@0d3a7a881997/

---
 drivers/usb/misc/onboard_usb_dev.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 3523f8f8a149..b252cce32f86 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -6,7 +6,7 @@
 #ifndef _USB_MISC_ONBOARD_USB_DEV_H
 #define _USB_MISC_ONBOARD_USB_DEV_H
 
-#define MAX_SUPPLIES 2
+#define MAX_SUPPLIES 6
 
 struct onboard_dev_pdata {
 	unsigned long reset_us;		/* reset pulse width in us */
@@ -134,6 +134,13 @@ static const struct onboard_dev_pdata xmos_xvf3500_data = {
 	.is_hub = false,
 };
 
+static const struct onboard_dev_pdata rockchip_rk1808_data = {
+	.reset_us = 25000,
+	.num_supplies = 6,
+	.supply_names = { "vdd", "vddlog", "vddcpu", "vdd0v8", "vcc1v8", "vccio" },
+	.is_hub = false,
+};
+
 static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb-a-connector", .data = &usb_a_conn_data, },
 	{ .compatible = "usb424,2412", .data = &microchip_usb424_data, },
@@ -167,6 +174,8 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb2109,817", .data = &vialab_vl817_data, },
 	{ .compatible = "usb2109,2817", .data = &vialab_vl817_data, },
 	{ .compatible = "usb20b1,0013", .data = &xmos_xvf3500_data, },
+	{ .compatible = "usb2207,1808", .data = &rockchip_rk1808_data, },
+	{ .compatible = "usb2207,180a", .data = &rockchip_rk1808_data, },
 	{ .compatible = "usb3431,6241", .data = &corechips_sl6341_data, },
 	{ .compatible = "usb3431,6341", .data = &corechips_sl6341_data, },
 	{ .compatible = "usb5986,1198", .data = &bison_intcamera_data, },
-- 
2.53.0

