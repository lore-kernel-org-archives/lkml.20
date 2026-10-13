Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013052.outbound.protection.outlook.com [40.107.162.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54293E0C77
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886566; cv=fail; b=ETBi1X590QkXWXXB9KctWHYWJ7ABNBHfb7Pyx98v8eeiqmyGjBGzq2ch5ZuRPwTazRq3G24GPCly0Txqs7LUUfGUzJWnrzhcRsvWPbTqqnz9V3TX12AacZRSvdsbvkTGXgxGWBFQmu3PuLZZQoxGcY1XbSYiio4pKz5d93TKlqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886566; c=relaxed/simple;
	bh=VXSmDVkgOFp2trqOTan/hx0N82QMeXtFMXOR7x3mMZI=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ibAfhNFzTNMCZ2HeFQ5Ct0tg/kgLILXpzPtJk7qDQN28sj0XOm/zHAGtVyyMtYp6YiWvv/MCCqn/5aTl8NKYKkvti8sUeo2HlAQxv8ehXWV9F31kMrh3t1bmxsB5Plbt5kGHO/s3wL2xMSyxc/EktKdRykOuwuTCNqFfuahVN1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ErpZIh3x; arc=fail smtp.client-ip=40.107.162.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ErpZIh3x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTFWrG11lyhqW2dGXJkYSoIbQo4gX3owNkLY67qluYH2A+VmRZ1oi/Y0t2Krqrc+JttO1WrTz/47mjCVTAd0AYsN9YyItDuVzQ8LiSqTI7UMkMAsYDYAk27HlG8saVugtiJYMz7CXorUPVIeY9RNKqa4AMa1Ie3EsGMMESR4s+EOEhTCHrjjl4w6tR1c9bfcbYOFviw0kZAF9tuJGK73RIhi/nxCJE7hgk1Uj4cSPBz2NP0k9S9hq0pk1QMpUXtIhFZZJd7e4xlzPhmtzhxVcokd6AGkPDrvvjb8vXdq+w40yRRXIayyeqUqCyMyfdjnW848c8TyWG2n+xt0W0SeAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gj6yIMGElsctiy8Yv3GrYU+njvp0rr/L5SHlZq16+Ig=;
 b=Bbv5Yu6GxH9ADdL8eRTxfQ/wHitBD+4JgTi9b5d/gXKqVF5Vo6B5S1H4PSgzmTA/sXF4SUyXXfpNOqWSlfzKaxwAc32tqibijSQoGQwuy8GCoC8eTkmQLUQrqbxkH+gRdmakqv3+PgLUz3zCy5904QuNOyQb3W7vp2ZuRJsDXnV2xprYDEpznvUEqz4nAo0sIsgkLi8uFcBTY5Bbal/QFpEiOwRQwKBhC5vS4wszMIkm7gFUFQw1Dw8EtURnZOcZJdbZYenvUQR9aEdN8h9PZwaq6GXQLJ9q3g+WEahRVPRcJVRmjDicsDfJ0sKe1bBO1ggjWpgrQrp9buyUAPc8WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gj6yIMGElsctiy8Yv3GrYU+njvp0rr/L5SHlZq16+Ig=;
 b=ErpZIh3xcqBeHfv0EEa2snRiEQEkcfNBILOcdlM+uYC7P6W0xd6zM6Ok+ckRLahCuXijPLlXhvKgbY1zXZwpiv2xJX0KEHFD+HJHrtLuUfTdJhQgpX1Eoaun+vbc+vdb65Rkdb4nd+BotriebRsR4QvUHfR0ClWlLE/tXFS36mcV2tGy1JPZoi/Vr+H1Bl1AvZT3EPSztkyChOqs7btNJcJWNjkvS8xUbiaolgmyjBU5EAni8zyXvdSyNAc6oYXOJ+G2EzJCNk/BZLwMUNMYWyVz7iwkINIlizHORWyftV+spe6BuD2wIxJQ+q6Ybe/g59Y01umh3Lxl20EewrDLbQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by AMBPR04MB884360.eurprd04.prod.outlook.com (2603:10a6:20b:788::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 10:16:02 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 10:16:02 +0000
From: shengjiu.wang@oss.nxp.com
To: p.zabel@pengutronix.de,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	broonie@kernel.org,
	alvin.sipraga@analog.com
Subject: [PATCH] reset: core: Serialize concurrent assert/deassert/reset of shared resets
Date: Tue, 13 Oct 2026 18:19:47 +0800
Message-Id: <20261013101947.2478989-1-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0236.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::10) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|AMBPR04MB884360:EE_
X-MS-Office365-Filtering-Correlation-Id: ea83a3ce-7601-4a48-ae9f-08df2912fbbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|23010399003|6133799003|10067099003|18002099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	znXO95QR2YPKALmclGkyXi+s8E1GkKN/nAnoGmNcjxYW53e8OmrvYLD8C9n0cLXawAwMqjIMPvDiBumIqwgXXf8Cz+6kutF76kEmmtynU890TNKOz6zcspN1oYD0i73CyxbFG0FTtZ2DKdl9G4x7e+nek9w0Y868akxbtKKCEshsgqsMuuJTihl03RzTfLqJ+PCBgUD036ywzma/gT42jo629dBvQQgS3F6IfPkKX2fhWUWUUy2I6zVN40ZajVHKzzuINBw30Ai/iZofaSGQfv4K5fzJ0+cQvmFLSbfZj7DlhogAIs3W5GKcc/4IHmuVST6Lxlrza63MeyqYztN670CezQod2BwoXtnJ5mkAzfm+xmPGUfxy6xYTCZShb1hT77/Rw8YjAfaoUxc+1HN23WGjtNCQR0BbjUJ/sLrPlhYDYdONvU8rk4r7yA0IZnuHDRbtv3RvQO5QuyWprCH82rfCfcALy53nTN9Cxzaxhgr8Uvrp9qEDJj/m+2SOZAZtJBod72T5E0Hmkef1biA/IL3NMgd1zQkglsIu2WBU+vtff5Lkr55oaO8MoE+H7TIAENjcQJpXvgdi9BNsA8yzoKeznHPr2ZRdupfWgbEDgp9L07PSLOrDVZmkwemzNDA5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(23010399003)(6133799003)(10067099003)(18002099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WAyIJTMpbS5Go6jA+ieEKBvEMN6pGJXVdz17HLBy6/o2cU6l3j2+kJ9m5x+0?=
 =?us-ascii?Q?qZvXvLBAcI+OHfZ84c0OLdijIwECCvh060PENCIO5ghS3xFtV7bLQEEs2MM8?=
 =?us-ascii?Q?hazgYn6GMqk169WkJ0uXtbYb32IkYpGuIH0yj4y3LhoVPsYtmjQQDVKA8D8N?=
 =?us-ascii?Q?pp3ZKrJoVkebe6f+KEi3052xCPVS1TzGcMuKVOy1hgvyBBtHb31ktk8m71qt?=
 =?us-ascii?Q?5NFtEsfqDFtCOxwUTaUAn2QTwaG7cfUna/wFG9bORWiM0Nrb3YlLNkqFLTbH?=
 =?us-ascii?Q?o0hKzDB+uHT3z44TXM37U7MzUh0BgO64WbIC25/C7z+LzLw9l82Spy7ixHAm?=
 =?us-ascii?Q?fFHUy9YWJDoRwgCJYFVbM21sUOzTSwS6EBX6rNlQh5nF0ytxAdkeG45/Ib2J?=
 =?us-ascii?Q?1Ri4b3Pzc7Wqb0ZWATjdXFafoL/YPqjgsF3lC+pjGAaZ0jFY6gEndVtnedTp?=
 =?us-ascii?Q?CNz82pSE6ruxKYzhRAwIGahrbu43gPQDJtucxmthSGYgmW2MS3kfWAz7U+cH?=
 =?us-ascii?Q?6z8Xq5Lghw4BsJasxgm4z8MD73oIwZcxaLVxWZ2+cvm7Uzu51Mi22eHts+KE?=
 =?us-ascii?Q?gup1x/5Zi7VAtTzx5a9A0fYBAatyO68fWQNBQVUJQ6I/R6AbHsZ6XRfXD2qy?=
 =?us-ascii?Q?MBCEmRkY8sS9q3oIbUUngJOJMUtT1j9Gtw9z4c2fhdLU0PT5CPYzJB0PTBzs?=
 =?us-ascii?Q?JkFh+5XIePiP597xejfnPxDoad4y7WlAje5t/dnPj/uWsgdiKopEpMuNMlqf?=
 =?us-ascii?Q?vx3plMtG91v7sZ/+rjABmw52gdp45XB2pPBf/AEkCdf+8W6+DDiu0wN6ut+A?=
 =?us-ascii?Q?Q2dfkkA+bOrUYdTa9zLjMdEQTheafEVJNfmyGFarab2KTBJTvvrYKIMROSgk?=
 =?us-ascii?Q?wGC8FGuRXrwASO0Chtv+jYBEs7AuIPhUEP6Jd+3wFPe9HxFLoKmh+Ml7W2tL?=
 =?us-ascii?Q?MMRtqIVREpO0m11JbNOg7JdBFdPdC7mlCj2zOOknkRxiPCl0h/MnfSUWxxq/?=
 =?us-ascii?Q?Wkkh8Cm892slLWi50nhh1/sEVQHbjWYqSh8bCNoh44FTWmJF8ODtlcNGcgy1?=
 =?us-ascii?Q?RVnX/I0ceuO7N+1pVrvkCbZbE6aFl8sIm7FUSa1+lgTn9hYbwF+oKsLOYRPr?=
 =?us-ascii?Q?HmfAFQwcNJP2yTFp241a4jZyHjB2qSyn9Ruf7aYrb3pR5DyKJqZBsSfJoqqG?=
 =?us-ascii?Q?cTAc5EHyt/VT42RjuJ5Hn6It2fL9u0V5hbqjbBOJ5FzeyrQeAWfWLmBdvDbJ?=
 =?us-ascii?Q?74Dk68B+1FmVM2niSWKOc1m8WxSl8XDCnISanmdba2wYYRyXrdReuRE91o5I?=
 =?us-ascii?Q?aPoGEegNyOCB9Czumh/3bAaIw9Q5yUR7o8yRHXQbmDvWRjL+x6nnSKdvc76z?=
 =?us-ascii?Q?Xj238tsjDFYV4UjOxNaPByP+Jv8Q+HvY/00zvv00qIfo/2bJ2mzHzfbumhJl?=
 =?us-ascii?Q?gxiwD5CPn6w8qk7DY3oW/EZ0cRnEQLbLySmFY+25L6aXPDyDG596/z93TV1O?=
 =?us-ascii?Q?ZPNoGXjb0OM0xQ9JfvV56OpEUERGI48wz/Nba9kTxl16HDmHVp37ReZVUdNK?=
 =?us-ascii?Q?Y/iKBt0nuwLCRMjSizWkpUuhE6j7FbhWc6PSltwys1F4JZ8gDpsyU0mQF8J4?=
 =?us-ascii?Q?swKWHhGE9rYGxIbPSmuECIbCXn6zMoaJM5hcKlK6O7LNkfFSmucf6It6ckV2?=
 =?us-ascii?Q?JYog17nQNEredO1MyVAxgWIYC2H8I/jHhjviXyFVux/IKhz6eBF8euqZ5CQe?=
 =?us-ascii?Q?agkj2HR06GRVoarlLvJFoOZVsmzj+UG0KIv5gtvQp45aKV/ZZDdt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea83a3ce-7601-4a48-ae9f-08df2912fbbf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 10:16:02.1746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gKg+qPWJRzLATq6j5RpgVRetxwi0YV6JOGcetmVW0PfoHksT63KEoqvC3RPwuyhDDvWafISqK0nST7JRSFH+xO2Gk+8Qyvw27TJgRY4BGsrpC68HrBfCYcAAiBd+8hv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB884360

From: Shengjiu Wang <shengjiu.wang@nxp.com>

reset_control_deassert() is documented to guarantee that the reset is
deasserted after the call returns. For a shared reset control only the
first caller runs the hardware .deassert(); all later callers just
increment deassert_count and return immediately:

	if (atomic_inc_return(&rstc->deassert_count) != 1)
		return 0;

When two consumers of the same shared reset (for example two codecs that
share one reset GPIO) call reset_control_deassert() concurrently, the
second caller can return before the first caller's .deassert() - which
may sleep, e.g. for a GPIO-expander based controller - has actually
released the line. The second consumer then proceeds while the device is
still in reset, contradicting the documented guarantee. The assert and
reset paths have the same problem: only the first shared caller performs
the hardware operation while concurrent callers return early.

Serialize the shared refcount update and the hardware .assert()/
.deassert()/.reset() under the existing per-control rstc->lock so that a
second concurrent caller waits for the first caller's hardware operation
to complete. The lock is taken before the SRCU read section, matching the
ordering already used by reset_control_acquire(). These paths do not take
rcdev->lock, so no new lock-ordering inversion is introduced.

Fixes: 0b52297f2288 ("reset: Add support for shared reset controls")
Link: https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/reset/core.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 38e189d04d09..7536b61cc5df 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -51,7 +51,8 @@ static DEFINE_IDA(reset_gpio_ida);
  * @triggered_count: Number of times this reset line has been reset. Currently
  *                   only used for shared resets, which means that the value
  *                   will be either 0 or 1.
- * @lock: serializes the internals of reset_control_acquire()
+ * @lock: serializes the internals of reset_control_acquire() and the
+ *        assert/deassert/reset of shared reset controls
  */
 struct reset_control {
 	struct reset_controller_dev __rcu *rcdev;
@@ -382,6 +383,12 @@ int reset_control_reset(struct reset_control *rstc)
 	if (reset_control_is_array(rstc))
 		return reset_control_array_reset(rstc_to_array(rstc));
 
+	/*
+	 * Hold the lock across the shared refcount update and the hardware
+	 * reset so that a concurrent caller does not continue before this
+	 * caller's not-yet-finished reset pulse has been issued.
+	 */
+	guard(mutex)(&rstc->lock);
 	guard(srcu)(&rstc->srcu);
 
 	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
@@ -503,6 +510,12 @@ int reset_control_assert(struct reset_control *rstc)
 	if (reset_control_is_array(rstc))
 		return reset_control_array_assert(rstc_to_array(rstc));
 
+	/*
+	 * Hold the lock across the shared refcount update and the hardware
+	 * assert so that a concurrent caller does not observe the line as
+	 * released while this caller is still driving it.
+	 */
+	guard(mutex)(&rstc->lock);
 	guard(srcu)(&rstc->srcu);
 
 	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
@@ -599,6 +612,12 @@ int reset_control_deassert(struct reset_control *rstc)
 	if (reset_control_is_array(rstc))
 		return reset_control_array_deassert(rstc_to_array(rstc));
 
+	/*
+	 * Hold the lock across the shared refcount update and the hardware
+	 * deassert so that a concurrent caller does not continue while the
+	 * line is still asserted by this caller's not-yet-finished deassert.
+	 */
+	guard(mutex)(&rstc->lock);
 	guard(srcu)(&rstc->srcu);
 
 	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
-- 
2.34.1

