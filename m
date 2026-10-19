Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013028.outbound.protection.outlook.com [52.101.72.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26D23DB31A;
	Mon, 19 Oct 2026 05:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792389110; cv=fail; b=rz99fKdWGep2sA51YfCIsjCkncWy/GZ40H5BH4AaWD6RjUWfASVjWs9vUU9MDzZlUCrHKEbLzZsou6UDUXLrlC41UkB1z++OfDKP3pNJl8T2Rh8UR1/8l5o9dQ1dLCjvuZNGxN/RiYVYGn61D9KAW5KC/Qjc5AlGTbt+ReXEuZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792389110; c=relaxed/simple;
	bh=gYgWryd1LUtkJ8IPoE7aisMgP102C/VEmOkO+JM+Tic=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Vo0m7WEVBuSbofXsrwb1C6HeASwXXF++6HnrlTm+lqzEEx6fgyyi3cKlZysKt4NC6l/hQEAt1aS0iOGoahOIthL0Kah5+4NoCb9SMpE4Km29IWz8gNz094mKkXG+wh8UwAtckwt70iuWL3VigWP4Y+3gz3+EZ/nV16xdlJDkV/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pi31CYvm; arc=fail smtp.client-ip=52.101.72.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pi31CYvm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmZS5o68VmjrgL+OUhfvzFFWKOWBVNXw2iS9rSY5PxAZs9T24dj2ATRKD87MBIidbIsDvn+gC52fmBCFUPowpFG5wLy52Xkk/GP9dEjZ5dvLk7qbNc0lGN3krwsfg/1xAh4iKwytCkPAvrBBGWCJ8NXdpX+B6fP4MGLqNG522LdqGC1TvSDZJrOvwGNq7Zyl8NqYgAfBWjj7Q7CLiIq7j/Poi2TMxz6YOjmnrEKSKLL0vw5rr1QcKxpcm5HW1u4RXRVHEe4k14Fu+DGD+qIAgGtOp4dlqK/VPtt7I3Yad0W7J4D7VE8w7xYYn08nZ3JvozdCLMRdbH1LW74t8fVWQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSEPHljDo8eJM3nnbsmX+shU1Y64g8liDNojV7hKO0c=;
 b=LlRKfGm3g0y45xq1WbJNyoIaSq/KS1v5WLb9S3ozVymAB0SRj5OxgND9ITwbTBGnWywSuXZa/i+gof0Phppq7TYCHb5KiidB48DKW06gKGrWok6RS8KUjU3cxtQBoGIjvVGCy6BGwAVBZfHbkEhZC9C8MfGuKQ3kknD+yaEakjJrTqxLcNGj4TTdRFlTBuu5G1gjXPoorwttEZ0rY+ZrMpFmdWcBCZ6mU1ghODsD+DiqV4Y/ET6F5svvagfmr0wR2sFcd0BZblaZvlfNMQY9dkEVhbAVk9vlC7pdG8ysu4Loys1sEeXHQYLFEx1wqVzn0iTQgyqGc0vv4B1mpfRgkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSEPHljDo8eJM3nnbsmX+shU1Y64g8liDNojV7hKO0c=;
 b=pi31CYvmlPkY156k81UC/ntGif3Mpn4R9Gdks2muWXvDh1k7kaVm0kE0DMmJnx/QL/oqtBW99LBIkGOabi4f829riqQS17fISimPNowC8n7o5hoHDvVVR7d3SgaR2zI+2L46m49cKhHUiaeSFbnAKlkEEGoaRUHz3VABzz6eduz/SpbL0hxcM6bICjr5ateG8wJ1xfFlIa/b2Crou3JTQ1lsgszj+IidWrm+jXdbm7oW7fY6Xg79Tb0V7DKmEO3L4Lc1HxyL6LbTJgjbdVegjnT4RUAbzQuOiyefDf0KvBtnw3RF/E/OoDIJeftHN1l7xsNLBT4kPOlBoCnBFSgj/A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by AMBPR04MB12229.eurprd04.prod.outlook.com (2603:10a6:20b:757::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 05:49:08 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0522.016; Mon, 19 Oct 2026
 05:49:08 +0000
From: shengjiu.wang@oss.nxp.com
To: p.zabel@pengutronix.de,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	hansg@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	broonie@kernel.org,
	alvin.sipraga@analog.com
Subject: [PATCH V2] reset: core: Serialize concurrent deassert/reset of shared resets
Date: Mon, 19 Oct 2026 13:53:01 +0800
Message-Id: <20261019055301.3234571-1-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:295::17) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|AMBPR04MB12229:EE_
X-MS-Office365-Filtering-Correlation-Id: 85cd81e6-a30d-4306-8128-08df2da4b14e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|1800799024|376014|6133799003|18002099003|11063799006|5023799004|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	W9Lj/UdRbYOkG9andFlagyDziGEfDhuke2WG1mV3CFWIefCdbnZeyyLytN4rsl4bwzQxDef/CRAvHrqp0mTZPniJYFqCseOFDRicFQHx7E+tuhewQ7yKzj9VkxVNGTz05MJXPTztMiZ1i+IXCA2zNwCkf3h19XTCBVJk4HOFg282YNzNFKMVPJZxrRtfT6liVzaz26mC0rQkCELa6NLaHkbDE5BAD3o6GOFcEU0zvG6Xz7O36CvEtD8UE9xdYxaZgNy4I53z1BZRUiJ3mrPrwSQX5xSnCenZth+09oEcAhe16q6ul3u4OcJ9Vmva71qX2tGZKQiLL2hVxNXXdPTB7QfsUXHUQ081hhE3AFleagpMiGp6jrhpXk6sdCuNUk5rQQK9LxOxERDiDKiFW6q1GrMBoBX0/BTkIovEGPVat6NRpEyrZIekDh2Q2wnFmXejz9pzhqNiL0zt8YPtL0BzzdqB7ZIl2HDgJHkqiGnhLBLrLx/d2GbIij5kNwfDM0Hf5EXMGyV7X/DgP6/FXYYx1G9PlJbvWYgBYlFQI86095243ZMl5jGGpCh//jk5qmxdWu/bu1QKi4LvcbH4kVy69WPxvwwKmsJbD/VbBdUFfEmbR2UaLwWJXyTHo1EQXOMM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(1800799024)(376014)(6133799003)(18002099003)(11063799006)(5023799004)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iXogVhzz3g7vTlLMp7x1zKgxexig/CuHcORJnQo9nO+0AzZ5aIH0Lh8QdUDf?=
 =?us-ascii?Q?6oDkarkIUotU1He5fQVORNbA7EvonBRut4JY8isdPAtagvz0K7uy7y1CEzlc?=
 =?us-ascii?Q?UTys7eHUlr/r8Ir3njAPgCEmX6z0jibcTJsRFHZ0c2ZsovN8OGjBfFWm1ONV?=
 =?us-ascii?Q?zjwEQlPxHTnn0nbaUqp6PWmffhzqO/QFBTI5BCV/WeCuG6F8JhW9ViydV3Fm?=
 =?us-ascii?Q?XcAbQkQy+RtlyoCDts7PsHkE/q+33b8ykH9BwOBsA7ZBedyRkMlhFT/wv40m?=
 =?us-ascii?Q?7rER9RsgDO4DtU8p9qvD6Q2CvF9v1HrTgfmLpP4CX1k/hxNo8cJqUjk/2WPP?=
 =?us-ascii?Q?1LiIdyPNJE5NYV30tcQn7JV+ilgPDXgUQYwUqvhJs9EdYXWUxJez9+T6wqpH?=
 =?us-ascii?Q?yK4x8Oo0ZjYY8FFZQkYY0W1S6eBx8LXw/1uTnpaus4RONDBJOi0dqOSmJSmg?=
 =?us-ascii?Q?i/YKqqBog71OY/cUx5P8QbDef+m9TxjnIG1ink07Bd0v4Dsg30k2+YFFY8Ow?=
 =?us-ascii?Q?THdbyfj6/VBuj3abK2j/DECEl8bxqgf/uA2IwZJ2rx9+JEt3tTJQnB/eHJqB?=
 =?us-ascii?Q?DmuEY86YchCsmqoTlKtycHrdBPCytEo7fZAgx/rSbarSVWU+luz44NO85HrZ?=
 =?us-ascii?Q?lObjPl0Rz9zR+4gSPNCtYzhgaoRFjgpUzm8TO4e1xRGZBDu4IuwYSMN9fz8m?=
 =?us-ascii?Q?6+ZzE0KvkPU8FoD/QyXm9BTEExWsf2mrek6YQLBIB1CdD6yZx2uQ7nrhZr/c?=
 =?us-ascii?Q?Qi3F066+c5FlTxA6YfuJxUoPJ6Vghws6K10LKKCgEhaXFKBzFntSEZ12dwgA?=
 =?us-ascii?Q?RKGoxH68pim1DTrJSVH+rUTn6ekdoMO8H1FJ35Fvyv2a4Aw+vXOS4GJgbaEc?=
 =?us-ascii?Q?wQD8W+FnnH5p8bdsE1hj0Lw2rJsTvJBhyI54kcJrdjPVU/k4eUUcSBTVga9O?=
 =?us-ascii?Q?Xb6dkk+Qd3najbBoPoTtetzvAlZBScBt2AHIBha+fQHI/Xj8wLaF6JFkZhOW?=
 =?us-ascii?Q?8BL8gUUE5ywnWOgFlNH7AvOTjphbluIIyP2mIfVvMoxRBzglzS+Am1TIfzzE?=
 =?us-ascii?Q?miDbYyUb9kYjyfVbO6FWDWRBOFq+Ttiz8ybZA77rv5vyhdZ1Lc/yXF+5KztJ?=
 =?us-ascii?Q?0K37v4ApTQhzqc7o5F4+TeybUqQGItmoUulJgxlRfJtSkYmZUXi2JXPP4jMJ?=
 =?us-ascii?Q?qn6Oeov7afs1JRD2cF11SGk/Idkq0bxRyEm/0NcpfSiW26aJrvkK9S6zvWpe?=
 =?us-ascii?Q?rSj3zkjF3ygt8ciXSvaH+3HKsTyHwXAZqljg1JQygdXIoLq2i1QdxZhFacRg?=
 =?us-ascii?Q?1hafL0Oz9+Zj9iN0edScXh7vcrNfpxboky6FcNjyYLK5m2L0T14CgPtWRZOq?=
 =?us-ascii?Q?fNmpbBRHGPxLVH+906TDyPbUZFszoSZVvFA3gVFnUFnqIlnNcBTnXKpY7oOD?=
 =?us-ascii?Q?LOJMz2m2cgQwnYXXo2T9Rcjwj/NaQvSDNrFqXGWv4D5FBESLvzqG8UIAwJoV?=
 =?us-ascii?Q?JGM5OauXv64XZEtAa135WAQsTIz4A3lTy6YZ9P+u8fZs+xr58h1EfejQ21tt?=
 =?us-ascii?Q?HnrKPvMF1n9qbVwQPUTeHbGt0G4AzCwJq2/llT6WjCVALlJwickB2lPT9Y7F?=
 =?us-ascii?Q?cyj5A3sp99N+uK+JtsCP3Qg7S7EIAxTfjr0Ycq1d2TXdoktFJm/Yk3rY0M7g?=
 =?us-ascii?Q?N8Kro8sDS9zcM6UmkBN07TEMsWt5YnkoVOLvBjzGHCaI66PlzZAu1//Sb//0?=
 =?us-ascii?Q?qghFIpV8UmdeVcHjmbsLK9bFWt08UL32rttZ4vzVZuP8QJvNU9TM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85cd81e6-a30d-4306-8128-08df2da4b14e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 05:49:08.5194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mC2RoMCa+HDoicNyCqw0fwQh0i6XuTb6Cmv9qG94yCMpzRlIkjwyXeNw89ckEIFI+FFrLa26nqu4N4Q7NLFLfC26cafDe5plxrG08MfKsL+b9n3YMclF6y3QFQoVljYf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12229

From: Shengjiu Wang <shengjiu.wang@nxp.com>

reset_control_deassert() and reset_control_reset() guarantee that the
reset line is deasserted / a reset pulse has been issued once they return.
For a shared reset only the first caller runs the hardware op; others just
bump the refcount and return early, so a concurrent caller can return
before the first caller's (possibly sleeping) op has finished.

Serialize the shared refcount update and the hardware op under the
existing per-control rstc->lock, taken before the SRCU section to match
reset_control_acquire()'s mutex->srcu order. The lock is taken only on the
shared path and only for may-sleep callers (reset_control_reset() and
reset_control_deassert()); the exclusive path stays lockless. Callers in
atomic context must use the new lockless reset_control_reset_atomic() and
reset_control_deassert_atomic() variants, which skip the mutex and so
carry no completion guarantee.

The op is now called with rstc->lock held on the shared path, so it must
not re-enter reset_control_reset()/deassert()/acquire() on the same
control; a lockdep_assert_not_held() at each lock site catches that.

reset_control_assert() is unchanged: a shared assert makes no guarantee
about the line state, so there is nothing to serialize.

Fixes: 0b52297f2288 ("reset: Add support for shared reset controls")
Link: https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/
Assisted-by: Anthropic:claude-opus-4-8
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
Changes in v2:
- Serialize only the shared may-sleep path under rstc->lock (taken before
  SRCU to match reset_control_acquire()'s order); exclusive path stays
  lockless, and reset_control_assert() is left unchanged.
- Add lockless reset_control_reset_atomic()/reset_control_deassert_atomic()
  for atomic callers; gate the mutex on can_sleep so no shared consumer is
  regressed and so it works on all configs.
- Factor the body into __reset_control_*()/__reset_control_*_locked()
  helpers, and lockdep_assert_not_held() at each lock site to catch a
  controller op re-entering the API on the same control.
- Declare the new variants and stubs in reset.h, and document the sleeping
  vs atomic variants in the kerneldoc and reset.rst.

 Documentation/driver-api/reset.rst |  10 ++
 drivers/reset/core.c               | 204 ++++++++++++++++++++++-------
 include/linux/reset.h              |  12 ++
 3 files changed, 177 insertions(+), 49 deletions(-)

diff --git a/Documentation/driver-api/reset.rst b/Documentation/driver-api/reset.rst
index 932699c57d1e..0fbc1ba92dd8 100644
--- a/Documentation/driver-api/reset.rst
+++ b/Documentation/driver-api/reset.rst
@@ -185,13 +185,23 @@ Given the reset control, consumers can call reset_control_assert() and
 reset_control_deassert(), trigger a reset pulse using reset_control_reset(), or
 query the reset line status using reset_control_status().
 
+For shared reset controls, reset_control_reset() and reset_control_deassert()
+may sleep and must be called from process context. Consumers that need to
+operate a reset line from atomic context can use reset_control_reset_atomic()
+or reset_control_deassert_atomic(); these never sleep, but do not serialize
+concurrent shared callers and so do not provide the completion guarantee of
+their sleeping counterparts. The underlying reset controller's ops must not
+sleep when the atomic variants are used.
+
 .. kernel-doc:: include/linux/reset.h
    :internal:
 
 .. kernel-doc:: drivers/reset/core.c
    :functions: reset_control_reset
+               reset_control_reset_atomic
                reset_control_assert
                reset_control_deassert
+               reset_control_deassert_atomic
                reset_control_status
                reset_control_acquire
                reset_control_release
diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 38e189d04d09..d477935e37ea 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -51,7 +51,8 @@ static DEFINE_IDA(reset_gpio_ida);
  * @triggered_count: Number of times this reset line has been reset. Currently
  *                   only used for shared resets, which means that the value
  *                   will be either 0 or 1.
- * @lock: serializes the internals of reset_control_acquire()
+ * @lock: serializes the internals of reset_control_acquire() and the
+ *        shared deassert/reset refcount update and hardware op
  */
 struct reset_control {
 	struct reset_controller_dev __rcu *rcdev;
@@ -240,12 +241,16 @@ rstc_to_array(struct reset_control *rstc) {
 	return container_of(rstc, struct reset_control_array, base);
 }
 
-static int reset_control_array_reset(struct reset_control_array *resets)
+static int __reset_control_reset(struct reset_control *rstc, bool can_sleep);
+static int __reset_control_deassert(struct reset_control *rstc, bool can_sleep);
+
+static int reset_control_array_reset(struct reset_control_array *resets,
+				     bool can_sleep)
 {
 	int ret, i;
 
 	for (i = 0; i < resets->num_rstcs; i++) {
-		ret = reset_control_reset(resets->rstc[i]);
+		ret = __reset_control_reset(resets->rstc[i], can_sleep);
 		if (ret)
 			return ret;
 	}
@@ -304,12 +309,13 @@ static int reset_control_array_assert(struct reset_control_array *resets)
 	return ret;
 }
 
-static int reset_control_array_deassert(struct reset_control_array *resets)
+static int reset_control_array_deassert(struct reset_control_array *resets,
+					bool can_sleep)
 {
 	int ret, i;
 
 	for (i = 0; i < resets->num_rstcs; i++) {
-		ret = reset_control_deassert(resets->rstc[i]);
+		ret = __reset_control_deassert(resets->rstc[i], can_sleep);
 		if (ret)
 			goto err;
 	}
@@ -355,33 +361,11 @@ static inline bool reset_control_is_array(struct reset_control *rstc)
 	return rstc->array;
 }
 
-/**
- * reset_control_reset - reset the controlled device
- * @rstc: reset controller
- *
- * On a shared reset line the actual reset pulse is only triggered once for the
- * lifetime of the reset_control instance: for all but the first caller this is
- * a no-op.
- * Consumers must not use reset_control_(de)assert on shared reset lines when
- * reset_control_reset has been used.
- *
- * If rstc is NULL it is an optional reset and the function will just
- * return 0.
- */
-int reset_control_reset(struct reset_control *rstc)
+static int __reset_control_reset_locked(struct reset_control *rstc)
 {
 	struct reset_controller_dev *rcdev;
 	int ret;
 
-	if (!rstc)
-		return 0;
-
-	if (WARN_ON(IS_ERR(rstc)))
-		return -EINVAL;
-
-	if (reset_control_is_array(rstc))
-		return reset_control_array_reset(rstc_to_array(rstc));
-
 	guard(srcu)(&rstc->srcu);
 
 	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
@@ -408,8 +392,83 @@ int reset_control_reset(struct reset_control *rstc)
 
 	return ret;
 }
+
+static int __reset_control_reset(struct reset_control *rstc, bool can_sleep)
+{
+	if (!rstc)
+		return 0;
+
+	if (WARN_ON(IS_ERR(rstc)))
+		return -EINVAL;
+
+	if (reset_control_is_array(rstc))
+		return reset_control_array_reset(rstc_to_array(rstc), can_sleep);
+
+	/*
+	 * Serialize only the shared may-sleep path: holding rstc->lock across
+	 * the refcount update and the controller .reset() op stops a
+	 * concurrent caller from returning before this caller's not-yet-
+	 * finished reset pulse has been issued. can_sleep is false only for
+	 * reset_control_reset_atomic() callers, which cannot take the mutex
+	 * and so get no completion guarantee. The lock is taken before the
+	 * SRCU section (in __reset_control_reset_locked()) to match the
+	 * mutex->srcu order used by reset_control_acquire(). rstc->shared is
+	 * set at creation and is safe to read without the lock.
+	 */
+	if (!(can_sleep && rstc->shared))
+		return __reset_control_reset_locked(rstc);
+
+	might_sleep();
+	lockdep_assert_not_held(&rstc->lock);
+	guard(mutex)(&rstc->lock);
+	return __reset_control_reset_locked(rstc);
+}
+
+/**
+ * reset_control_reset - reset the controlled device
+ * @rstc: reset controller
+ *
+ * On a shared reset line the actual reset pulse is only triggered once for the
+ * lifetime of the reset_control instance: for all but the first caller this is
+ * a no-op.
+ * After calling this function, the reset is guaranteed to have seen a reset
+ * pulse at any point in the past, not necessarily during the function call.
+ * Consumers must not use reset_control_(de)assert on shared reset lines when
+ * reset_control_reset has been used.
+ *
+ * This function may sleep when called on a shared reset control; use
+ * reset_control_reset_atomic() if the caller cannot sleep.
+ *
+ * If rstc is NULL it is an optional reset and the function will just
+ * return 0.
+ */
+int reset_control_reset(struct reset_control *rstc)
+{
+	return __reset_control_reset(rstc, true);
+}
 EXPORT_SYMBOL_GPL(reset_control_reset);
 
+/**
+ * reset_control_reset_atomic - reset the controlled device, usable in atomic
+ *                              context
+ * @rstc: reset controller
+ *
+ * Same as reset_control_reset() but does not sleep and does not serialize
+ * concurrent callers on a shared reset line. Because no lock is taken, a
+ * concurrent reset_control_reset()/_atomic() may still be in progress when
+ * this returns; the completion-ordering guarantee of reset_control_reset()
+ * does not apply. The underlying reset controller's .reset() op must not
+ * sleep.
+ *
+ * If rstc is NULL it is an optional reset and the function will just
+ * return 0.
+ */
+int reset_control_reset_atomic(struct reset_control *rstc)
+{
+	return __reset_control_reset(rstc, false);
+}
+EXPORT_SYMBOL_GPL(reset_control_reset_atomic);
+
 /**
  * reset_control_bulk_reset - reset the controlled devices in order
  * @num_rstcs: number of entries in rstcs array
@@ -575,30 +634,10 @@ int reset_control_bulk_assert(int num_rstcs,
 }
 EXPORT_SYMBOL_GPL(reset_control_bulk_assert);
 
-/**
- * reset_control_deassert - deasserts the reset line
- * @rstc: reset controller
- *
- * After calling this function, the reset is guaranteed to be deasserted.
- * Consumers must not use reset_control_reset on shared reset lines when
- * reset_control_(de)assert has been used.
- *
- * If rstc is NULL it is an optional reset and the function will just
- * return 0.
- */
-int reset_control_deassert(struct reset_control *rstc)
+static int __reset_control_deassert_locked(struct reset_control *rstc)
 {
 	struct reset_controller_dev *rcdev;
 
-	if (!rstc)
-		return 0;
-
-	if (WARN_ON(IS_ERR(rstc)))
-		return -EINVAL;
-
-	if (reset_control_is_array(rstc))
-		return reset_control_array_deassert(rstc_to_array(rstc));
-
 	guard(srcu)(&rstc->srcu);
 
 	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
@@ -631,8 +670,74 @@ int reset_control_deassert(struct reset_control *rstc)
 
 	return rcdev->ops->deassert(rcdev, rstc->id);
 }
+
+static int __reset_control_deassert(struct reset_control *rstc, bool can_sleep)
+{
+	if (!rstc)
+		return 0;
+
+	if (WARN_ON(IS_ERR(rstc)))
+		return -EINVAL;
+
+	if (reset_control_is_array(rstc))
+		return reset_control_array_deassert(rstc_to_array(rstc), can_sleep);
+
+	/*
+	 * See __reset_control_reset(): serialize only the shared may-sleep
+	 * path. can_sleep is false only for reset_control_deassert_atomic()
+	 * callers, which cannot take the mutex and get no completion
+	 * guarantee. The lock is taken before the SRCU section (in
+	 * __reset_control_deassert_locked()) to match the mutex->srcu order
+	 * used by reset_control_acquire().
+	 */
+	if (!(can_sleep && rstc->shared))
+		return __reset_control_deassert_locked(rstc);
+
+	might_sleep();
+	lockdep_assert_not_held(&rstc->lock);
+	guard(mutex)(&rstc->lock);
+	return __reset_control_deassert_locked(rstc);
+}
+
+/**
+ * reset_control_deassert - deasserts the reset line
+ * @rstc: reset controller
+ *
+ * After calling this function, the reset is guaranteed to be deasserted.
+ * Consumers must not use reset_control_reset on shared reset lines when
+ * reset_control_(de)assert has been used.
+ *
+ * This function may sleep when called on a shared reset control; use
+ * reset_control_deassert_atomic() if the caller cannot sleep.
+ *
+ * If rstc is NULL it is an optional reset and the function will just
+ * return 0.
+ */
+int reset_control_deassert(struct reset_control *rstc)
+{
+	return __reset_control_deassert(rstc, true);
+}
 EXPORT_SYMBOL_GPL(reset_control_deassert);
 
+/**
+ * reset_control_deassert_atomic - deasserts the reset line, usable in atomic
+ *                                 context
+ * @rstc: reset controller
+ *
+ * Same as reset_control_deassert() but does not sleep and does not serialize
+ * concurrent callers on a shared reset line, so the deassert-completion
+ * guarantee of reset_control_deassert() does not apply. The underlying reset
+ * controller's .deassert() op must not sleep.
+ *
+ * If rstc is NULL it is an optional reset and the function will just
+ * return 0.
+ */
+int reset_control_deassert_atomic(struct reset_control *rstc)
+{
+	return __reset_control_deassert(rstc, false);
+}
+EXPORT_SYMBOL_GPL(reset_control_deassert_atomic);
+
 /**
  * reset_control_bulk_deassert - deasserts the reset lines in reverse order
  * @num_rstcs: number of entries in rstcs array
@@ -726,6 +831,7 @@ int reset_control_acquire(struct reset_control *rstc)
 	if (reset_control_is_array(rstc))
 		return reset_control_array_acquire(rstc_to_array(rstc));
 
+	lockdep_assert_not_held(&rstc->lock);
 	guard(mutex)(&rstc->lock);
 
 	if (rstc->acquired)
diff --git a/include/linux/reset.h b/include/linux/reset.h
index 9c391cf0c822..ab697193dbe9 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -73,9 +73,11 @@ enum reset_control_flags {
 #ifdef CONFIG_RESET_CONTROLLER
 
 int reset_control_reset(struct reset_control *rstc);
+int reset_control_reset_atomic(struct reset_control *rstc);
 int reset_control_rearm(struct reset_control *rstc);
 int reset_control_assert(struct reset_control *rstc);
 int reset_control_deassert(struct reset_control *rstc);
+int reset_control_deassert_atomic(struct reset_control *rstc);
 int reset_control_status(struct reset_control *rstc);
 int reset_control_acquire(struct reset_control *rstc);
 void reset_control_release(struct reset_control *rstc);
@@ -117,6 +119,11 @@ static inline int reset_control_reset(struct reset_control *rstc)
 	return 0;
 }
 
+static inline int reset_control_reset_atomic(struct reset_control *rstc)
+{
+	return 0;
+}
+
 static inline int reset_control_rearm(struct reset_control *rstc)
 {
 	return 0;
@@ -132,6 +139,11 @@ static inline int reset_control_deassert(struct reset_control *rstc)
 	return 0;
 }
 
+static inline int reset_control_deassert_atomic(struct reset_control *rstc)
+{
+	return 0;
+}
+
 static inline int reset_control_status(struct reset_control *rstc)
 {
 	return 0;
-- 
2.34.1

