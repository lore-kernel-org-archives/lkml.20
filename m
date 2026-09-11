Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012023.outbound.protection.outlook.com [52.101.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6DB2E7F39
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116278; cv=fail; b=epz4zQl9Dk1h4FJfLmEzaqxh+u5kO8wPlnnE8yNaEYpe7T8Fa8NJxFcI30bJ0kNbhz1MsSPneKtDRnA9WG2G+1ME5eQbqYmcGJ0+FgTCv+pLdgQSNb4HK4WqTvxArQnWfT3/ildI6lctgasHHtS/CU8Tr+lGI6Xm7T18S+bWXM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116278; c=relaxed/simple;
	bh=iOcOQ6y5OteWPNTxc11XIB0mnH0C8qDY3Y56yn0XmS0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YIBPD3A7MfuKO5YMOnK/82XFC60PC8oteAA1CfIia5/DsPyxo5ZJmEuoXUn8ZCqCXKpWHc8+bjTLZTilV3qctIKz/Juw5QJ/U+EOebMTjpIrLa00FqKllv/t4m1dlvAndRF61nVdz8pf3dvxktn+sZvAzmCpoWl979LzAXoeJpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=wLUHOQay; arc=fail smtp.client-ip=52.101.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="wLUHOQay"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mSchNcrW3PjegRfdfXOiItfcCsy9SMLy67RLNNTyg5V4Y4Tl5n6Gj5KqxIhqBwvmAWNhR9AmXpd8w5hJXi1OjBk0iQBC2wMDXXJ9nvIONUprtuJbN+5hZePRzwsl4ztcfcM3QSlvCHZ+fVsI9osexakeAvtTfG+y40e7+RQfr/BBHrFYRpZQifF0vnKtm0TxnirD6uvPnprweP/IFuqz9ZfyZCKsMNBFbUcoktgQQqiDFNuUYqnZUD3nse/R9ghG6cm38vXf9cC+SmKgq9ilr1uf2yIlaTGnMveXpGP6z/7rw3XA4jMXQNNE6dPXdPkPB3sOfSORDAkQqCiqEdJG6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3nKfr5hK02hv446d51+Jfb98YJTwwAYMn6DnYxsgTfQ=;
 b=vF7epejJMeq/WGAd+SZuoIBedxytYfWy916pVpYRdvI+1n1O1XYdo3W8xMCvAUhNxXVBRZFAR87f2YIQ2MHagGegXNZbDNbnWZBzTanQq4mHbmHQYQKjkUha+tF+p+T7UqfQRIUiRAZtrnz9n5t/xUKlxBjOXZou+L8GpXbp77jh2gLqED49DYMqMicr+K+tUG0cgeUmLLfvDtRVSUVpdt3OTlhX+XF8oaxNCJSI2XGLtOz4q4gBbzMLDb6hRt7yO2Z13HkcrzTolL3pdMuFYeS/831p73Mj66x+hdIj/GVF9ZWmHOCzbF9wF4QhMchdqwHhK+Cft7z8l/q7nhp71Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nKfr5hK02hv446d51+Jfb98YJTwwAYMn6DnYxsgTfQ=;
 b=wLUHOQayxbbMwhO9iaoW0D5eM8SR8bpPcA/kk90/UX0bMyK3cZqti/c7CHhvKG/aMguIuc17bG0Zl9S4nz1iIHEAvE/6/Q6hjiKsUt4+58ECqFJQu+fpJG/ZvH2BIQzVB3dt0Rg4XYQj/HILW9xT5qtlfe1lOUw2Yt2BnTJfNJqAYmvROaGeHh64twUp9a6+ClsZ+J4fP/d1EdV6HgSMoziA+P41tiTzOixP8H+JFSBHt7+praB7rxd0cIqUxQ8Jxy/sGJjXwgnyu/kP/dJxi6Jfakq45SzGlt8xxK7wOcw/Ylcduhab++ApLxgVi1TD5Di92M5ebfc/jlGNzJGGhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 DM6PR03MB5084.namprd03.prod.outlook.com (2603:10b6:5:1ed::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.10; Fri, 11 Sep 2026 08:44:34 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 08:44:34 +0000
From: adrian.ho.yin.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v2] firmware: stratix10-svc: populate kaddr1 from config status response
Date: Fri, 11 Sep 2026 16:44:18 +0800
Message-ID: <2d8af331c37fcdd8a6f3dccdb6cc6cd903f0c4cd.1788972469.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:194::17) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|DM6PR03MB5084:EE_
X-MS-Office365-Filtering-Correlation-Id: 93902252-8a2c-4868-8d07-08df0fe0e766
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|56012099006|5023799004|11063799006|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	zSEYIMGs+Uu7nWaQihreK5QCHbHaAR67xaAS1QPHkSgZcK3+G/qlob7aZ0XKXTl3/ETIrp/ccOJwmVI/7yD5haZ2TWNR4lyLTTK78WWpEuWOTPPddH8GyHO49A6JP6MqdA6GZ3I5WKcbaL7kLK/wWw7GTAkMiHKcfQ3gsBM4SQZR2kSKhcIipno48gDdpfDc9xcckMyo6BkKr+G6S4oevWfwza/jDmCYj/bAYiFaJTBtSOCHE5gMLJT2oh4N7ocdWZrBLie2B6ccWZ251WGNGpyNqnZ4TXcihLAUDJ/rYr/dnjM88Y/lWw8jHKrVZYS5SaINoyH3jMvjcHxqIoTefgYTYavKvcVzKwKCkGTJq1gNNuyfoJhRRnW+ARP/irPEuS3pW5ieDahnwH99DAvjDSelJa2rT7hUdcuP/CSkLNXEiuJQxZX8b+EK1giSyig3wtyqm7Wxe1HqjP7o9/zOpgmdnFLJ2gvUbh+ZFHHk/24QRnvSlIzMO8L59xVP5u3cWeysnzg60piVFsmSdpo7f7pO04397OWN246DnJ9Saa2MyhQGLhJMXP8cu6ZySZDijzfdKazBoOPRDPHGkConVBnjCiUmqIJBoO8OvAAsG8fFAQ9ZSXxtQ68N2vTsjgOnkx6x6kJzdsUDJbqPv/V7mZFVvb4tX7geIOouly5e6II=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PUtf92eShQ5EFB8SPfAwMLhf7i+J3Z6DtdNrYQvE59P5Ztupk2o91sElTlSw?=
 =?us-ascii?Q?b9YIzhsdXPKZniZ7PHUUb3CCSVPXL/w4lgoMbmWFg8BkBv3GwfLVS0VSBMCu?=
 =?us-ascii?Q?Qx9rY1iNXQkGc/KHb8KhMHx4GlQECh3AY2XwqvYS+sTgxpkLS3iZuJXXjMSe?=
 =?us-ascii?Q?ugONwD48w+z4JVmA61K+qhEQFnr8651/KBW0teFJ/TANhpIfVk8laJ4iPyPn?=
 =?us-ascii?Q?nXgNfUTeK/OcYHtY8f6/HMGWbcZFjBGAH94QuNHnAN2IqujksGSWZZDj9GEM?=
 =?us-ascii?Q?7rIPr8o85jhajlGZEe5KQSmlgqqZN1oMQS9Mge3KLunz2hzC3AsCrSqwHp+O?=
 =?us-ascii?Q?/oV7xtFwUvUjad+a4np4y9aJUtGu6j25J6aGkM/8kT78Hp3cgo8/gFa7W0XU?=
 =?us-ascii?Q?dNMDpBFVzQVxIo4r+5D51XwNH9mUWt/btIHTRhGGYRuigcPQd8qUffgI0fv/?=
 =?us-ascii?Q?9/ySH6HFTRQS6L8aUugeXEU4SnPQC+wVp7vLrzvHzXtOFsJr6r3GarVBksNi?=
 =?us-ascii?Q?gVhq+Vdd3snoOP5kqfjUGpV5krfMppZs31OB6IaUrcR1CCc36PCSRNo+mjF3?=
 =?us-ascii?Q?JE8BNto5hIylpWSsZkNxtdfbkc65nZuPIO2VU/v+0DP3ocCuyvLfglgsmC/l?=
 =?us-ascii?Q?WFBiioJ9/X4XXYinyn5p3NR78ZonwR3NXMUIfzjEJGjGIXm03RjwEPScUZ0K?=
 =?us-ascii?Q?RKP46S13f3WI45OuAZIAJHYB7kDadfy07KWK0QAJ8u3N4zs+ssRxAHNw8fEf?=
 =?us-ascii?Q?Q1h1CMI2h59XzzeoOVRwQrI7CylIsSwUcKKVTdGP3KBLK9eZj3NZez5443Sy?=
 =?us-ascii?Q?V2pVudhEctDboxVqO4fwnyw+mPzzJv2fuvzGaXV2wrwprdj+f6KeeKwf+V2X?=
 =?us-ascii?Q?ixF+tEHgKgqV1XTuFLrKhMeKPVSi+sCNHTSwLd77/dELFeQ6SlthDZ0cu9+8?=
 =?us-ascii?Q?QhwL3pEbHvWHjgXBomzXpYoU9EgGsuW8LecV/vSFCnuXFRR5GCxNTjYaVKo1?=
 =?us-ascii?Q?wRupos3i7aiSWV6L0xklytn7G9fo54UyvKM9GvkHhyF4vQqZ32twnxBCQLxn?=
 =?us-ascii?Q?YPWL1KsZEwGE79jnXqBD613FxQ+ftBdckvRfhXGpOF6WaNQPFeuZyDFLIS8k?=
 =?us-ascii?Q?oiKEqxjHwPeUSgGqdbUzg3lr/wj543Wb2nc0D0JB/J9O4+j9FNb691awRGSf?=
 =?us-ascii?Q?yFlqJ7Fn+Bpy5aZlp9E29OvgRqwClTasRGyfqdsBemjNstsrF7x4SbA9+BMS?=
 =?us-ascii?Q?DPWxuBGJGI3gjK7TQpAkjB9nPgkXo43+243eNNb00Ds0TudYSvwXGuQtxKZA?=
 =?us-ascii?Q?h2QU0FIkIJFkwwqPQKZiUkce2jpPIVQAdxbntMQ1IcgbzFHYmzPTXtM+HoGV?=
 =?us-ascii?Q?NAeRMmQ+IHuY67ve5TcWPVA601VNE1sirwIRYZHwt8AulH2aC696v10aAslh?=
 =?us-ascii?Q?cZ2k8MhQMAmTqAzUvCmwuvCCJSmf7LOWH/SpkDu0AlYtMHnd3CHd60rTs47T?=
 =?us-ascii?Q?r1FD8dLraFdC+80YFLDwjPsr7FTYfmuwEMwxTROrWQ2PdCSKXwUpxkxUHsi9?=
 =?us-ascii?Q?9Rnt9Zv+g+D6N6LVvtVQldpbRuwoK4FtW2So4ckwdHZM98VvlrNgzYbSJfnj?=
 =?us-ascii?Q?zQHoCYudNz0bSnZKqPMN1xW7AX8xJp2hi+VfjCuZ/S+Qzu6kZARHkY9xi2ZD?=
 =?us-ascii?Q?Z1JE9deq2e+enrgukGIoG059RIk0tNu6orDUDpmG9t6FBcW1Jpi1SD0nxwPh?=
 =?us-ascii?Q?U/IFD7o0S0/l2L9PIunF5NhTZrAWcck=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93902252-8a2c-4868-8d07-08df0fe0e766
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 08:44:34.2782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/yRlmQexKik+fESq40Z2630VE7NwWBBQqEYTjx+yRC+fY+lpaCicGdadftB5vqRTalXfG75u35feySMzcsGvCQU6hpvG3tECIlVq1BlWDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5084

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Set kaddr1 from res.a1 when the configuration status completes, matching
the existing error path and allowing callers to retrieve firmware-returned
status details through the standard kaddr1 interface.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
Changes in v2:
- Drop the callback-data lifetime / dangling-pointer changes.
- Reduce the series to this standalone patch. Set kaddr1 with &res.a1
  on the completed path, matching the existing error path.

v1 patch link:
https://lore.kernel.org/all/cover.1779780223.git.adrian.ho.yin.ng@altera.com/
---
 drivers/firmware/stratix10-svc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index 34c591d7fd58..2333ea31e741 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -444,6 +444,7 @@ static void svc_thread_cmd_config_status(struct stratix10_svc_controller *ctrl,
 		cb_data->status = BIT(SVC_STATUS_BUSY);
 	} else if (res.a0 == INTEL_SIP_SMC_STATUS_OK) {
 		cb_data->status = BIT(SVC_STATUS_COMPLETED);
+		cb_data->kaddr1 = &res.a1;
 		cb_data->kaddr2 = (res.a2) ?
 				  svc_pa_to_va(res.a2) : NULL;
 		cb_data->kaddr3 = (res.a3) ? &res.a3 : NULL;
-- 
2.49.GIT

