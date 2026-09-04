Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020140.outbound.protection.outlook.com [52.101.156.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DF642A175;
	Fri,  4 Sep 2026 06:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788504437; cv=fail; b=D4AY0CL1u9a4CanMDU5i2cIoNzRlWmh0t75JBrlb3tFu+XP7VxaoO7AsXXOoCVJ5GyYGVQsjrtiNrC1hvSAjtAamqrfrM+bAqVq6Lk9qWYb/8TXrYIxbT74lVqjZJdEV+FdGjQUOX72jFgG7Hiv+PEB+AOY+3dcmm1E0Ymh+W3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788504437; c=relaxed/simple;
	bh=Ow7nYMfJqEfFS6RfkKsFgw0xOdVtrN8y/dMZMxJBAlY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lVz61PLpG/Dec618IvYFJZnCX5trQg1pSDVnxvJUARZDRft58lCwhO2WVZHnyACA6eLVVgWI6ApSrK13Q8aLMSK65v3ZaDk03jeC+9y1BIqlNn1LwyDOxjFvtCdrfn0rL56KOv55rqFeL0iXiEMNSv4MQ0dvNintem+0bbiNZdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=S2lA/7Qa; arc=fail smtp.client-ip=52.101.156.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="S2lA/7Qa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=my3d5bW5aqwgL/+ar+okvxHcf9OO4BU1fr2QaWZaKrzRu/OAwUF4CJmv9aYlbFpr8JLjwBrP/IHO8QtuluVVEAz0mYVMtKpiu2cwko/WFy6TaDRC002SZyGRQ9+eh9xhJ3fKhvKY3jTUYCjsi9N9k16pxOrB5rt1fcn9Qw+Q4zWjn+8KFGUdBqyppacsOCOwVaFPUAKj4aYY5BF2p5WcUD4+X2EigWBfO9p3Ypw6V2WiAI8sWlCG0EoQt4JA4YMPkGE+PfQZBIKJv4FwKvNiKhfTTNUYYwixgeeWaap7UBPCZ+lTpyPGZ+EajEEUbWIxyh9ufms5oiqLP5uPnxtZKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/OCeC1heoDP5S7sajCJbNaGdIv2ImSGyJGi/lz9Hb70=;
 b=wAq1hHCU7CKFxdkhj484gV6OIuF6UdJv+0eMrccDD2p/NY1PqSOTsy6EVn7MdNN5UdTPRHhQBjo41xDbFDDYsWa7AuGPP9NujKULSPztG9F9xvLM7D+Gs16hBUGi+VZPS36K7JN15k13C/JYQBwU2qe9b9FE6suB7dKtnvcEn7fgbJ/eHYs+YnVO/kvDulZhkRmAUXnh8pq27d2hY5uGVxhnwHCoLyDzTc+cmJafOpqkGX1Jk/EpVJirvOTtZuozGOBiv/m57DDnGpLk6gqgiXlWOQVnPBi7jVDuCinmGFiR/JkF9/5KCjoge+HSRqEEtfQOfWssKrqamtm6IgYdNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OCeC1heoDP5S7sajCJbNaGdIv2ImSGyJGi/lz9Hb70=;
 b=S2lA/7QaQuLp/QQxVsKISoo/MVuU8UP2+YMPA0MVpoYtGfT1Km/i73pMNoeXeZt1DBodgPxwL1xqeZri+IceJpFOmbMzAD0n069EqaTjAj6Cyoq3B/JAZb1H5kF0e6KinsBe/8VthHRU4QDOZzFIQ03mn5lhK0LRSubduR0Re9d+BbVnG3UOvaoV9qn632epCNo740y6X9JLWVfMhE4norHIw7TyI2ZM1uTmMIEf9EaEIBqQqea7A6jVwAybZRzDOFdsgVQpsE+3hWMfSIn+ew7KtNq8EhICAfkuLLXEmfX3y4xfNEz1f2+cqtTLEg/FvwBkFB+WTfu/7lN/HTiOXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SEWP216MB2979.KORP216.PROD.OUTLOOK.COM (2603:1096:101:296::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 06:46:56 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 06:46:56 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Ming Qian <ming.qian@oss.nxp.com>
Subject: [PATCH v7 7/9] media: chips-media: wave6: Add Wave6 thermal cooling device
Date: Fri,  4 Sep 2026 15:46:33 +0900
Message-Id: <e3cb770b50ce5932f0ec0ed25419cd8271a04780.1788496816.git.nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1788496816.git.nas.chung@chipsnmedia.com>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0130.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c0::8) To SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b9::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB2441:EE_|SEWP216MB2979:EE_
X-MS-Office365-Filtering-Correlation-Id: b21368c0-6ee2-4277-e373-08df0a504fbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|52116014|366016|38350700014|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	FgiS9kJJZWE43U/brioseIH6byJOmT3YfcMqdtqlqhBmN1s6uRmnFnjomYkY8jctASVnR+xX1VEi48MfOGILb1puB8Qg6KV14gtXe2iLByX4d3JxEPBWzIVQzhxvBlLwj4Dg5LrrENHbGx1YMDHai4vRxu5nWrRX9fyo6CCdB4CfL5JzSgqM+tj+swYg1WRZq/S27VPF1d+ijwrzoU1VHdNDautK5tMz2KNUB3nT3izg5StPbfao3bBG2u3tSR2zzw6kpz1KQFaaeZvTi1f+qkWU+iA6hP8/DEP3xJlYYDgNEAYbpxCi1Rd82P6nOAp1z4O5oaTaQMaLpjyew2rCPrk/PER/tMI9XKUHz8QOU8prN0/kXYvJfIU90c/bym0PR6EIYeaRVybAvf6TuXQ62N26ITTEO5k7tHXe/XSyL1XbTdNbBDtdzUVaHRAW+YDjmK+1d8JRejPdDe4/eNyewdggnjF715diTyQN/VH/VRQN7VaAGXnJEi+ZDn9YonMm91BPBYiYH93ArvcQ3Cks6rknRvkT90ujeXYRGJSmZVzU6E4rHoGGKj1QM4kffOdKNbeoMAAHneJpx9L54a49vNbLgpq5jvt9OmIzXt3rMLdEls7sE65WEj5AsdxyIYxm2Z5RO5cnson77tVj5gc/xhMMRDaCbJBBgbWZ1y/oINztoafzUnRRpx8yOYiqb3FFBujbN8XccTq6VzC1ohs7ztriTsqitFbVJiNFzUzxloE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(52116014)(366016)(38350700014)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rGML4XsEwK+ekYv+z4R9QnJePqohGQKDA31c6DcoWOQLqdkucNxsQBsGoGeH?=
 =?us-ascii?Q?k6yV3whahgtzET+yov7MR7nk/XZW3QOTAfAYiaBoBpfgAYtC9pxXb35t0si5?=
 =?us-ascii?Q?1s3yoUQmECxBMsOLw2XN0llSQuevwlLFaxaEPnMU1KiMlCFhAgj4ayfNSK4g?=
 =?us-ascii?Q?RALoMSzBZ1Z68RK+t2BUW2S9eY2Fk6AJrUxDJOjhV8XLQkVQe6owAxFPgZi2?=
 =?us-ascii?Q?TrHHvasc3r7vsqtQue1tn27NJgIrgzWKjJYOqUoVbayvYkNJPxAR43Pe1pXt?=
 =?us-ascii?Q?PRl0JE1+j4f+AIzlDTp+5cgbjZeo6EykobfnAw33orADj0PbzMt6tUh1YtO/?=
 =?us-ascii?Q?/qHiDwu413H6ZdpnI3T9bqjltWAYR6h/Y7vKCg4MsDQNZubTXY4+Q11PEn9S?=
 =?us-ascii?Q?Zzvvjw5j3lXR35SttALpM5KeMp+eMvCp9KX4y1+r3H9p8TPr00PYerFsTvj2?=
 =?us-ascii?Q?6bq6xdH5AU/39hrtAkOIdwYjPY/e0KvV0CaU2zJrJ3Erp4G7Pldh1aFX6P3e?=
 =?us-ascii?Q?k9+F4ypOJ09nq50RXzISNMZ4nUrPLh84QXB0xn70gVXJbgQinY/CF6EB3BFY?=
 =?us-ascii?Q?COFPfzc2Wkq2xWosw9f0E1En/P2euq8OOXEtVU+vaswqesmZw3tzRrkVbYWE?=
 =?us-ascii?Q?SNkunj036jr8tUbbEIKIGa8WzafL916uXA5A8jHyn5iaZiVJj8uTyLfSpNxZ?=
 =?us-ascii?Q?SiIjqbysS7Tq6KOWyA/Lp9aO6ds+pyk+aQu5lW2rsg7jSH/oqSTVaYb8e4k1?=
 =?us-ascii?Q?tzvo7Yu4wUmcuAJGKbX1G3aNnM6pTn5qXEE/wu9rMNmqX3rFxMrStKCCFfn9?=
 =?us-ascii?Q?8SN4gCZb16uvaFZrKmMieITkD//liWT8B+QZX9okfT72c3zZYQRnm/AyjRmr?=
 =?us-ascii?Q?3pxZPVaYwPnMS2UVowYsv5dBh27cVzdCg9Tnw33Po0Xf4KQyYCLXvyJ3ZlaG?=
 =?us-ascii?Q?UJVFT5UYSqerMRVQl7AahSb1fRr07lauLLaAnv7c+w1A/Dit8E9CNi6bMOsP?=
 =?us-ascii?Q?M5V9/YNdndUzH+4VYaaWBs+YRtOxXl6oZXGwQkXAzytbdg510sZyS9U0TDYt?=
 =?us-ascii?Q?BYfEflPqx4rn8uagkBwsLWxsjffQiQ7PL8o/wsQ9DcG7G4CMyL2yR0Z+xkQ5?=
 =?us-ascii?Q?ZsvH7wHjWJpdW3AsULpMU8meEqwjy90F0Fm1Vs7s2kSKQiibD0l0j7riBhip?=
 =?us-ascii?Q?sfCNavR+VKx4OokylCSTPJhz69TqX0qeizq3WHQjGwzYNmJ7H726X0UUPPGy?=
 =?us-ascii?Q?emsS7352r7ZZyZb0/hTZCsKzoc4IcN2MZQTHKSJ6lvpx/Ebqyv/cidsHAyRT?=
 =?us-ascii?Q?clkuee1DMQQXnsYoEx80pygZUqXFZlBCyqbIPk2R+LIFXy35RUoWjCawgTVf?=
 =?us-ascii?Q?ug5UEF6hfT+F07l4fR/YoDapXOJpH2jxIbbkV5JeV9PXrLmxHISsEUBeJ20y?=
 =?us-ascii?Q?TL87QnMmLJpdCcOxqb/8dZj4fXYw+RIkdHxVvg7ramsqWaShCB3iCu73Z5p1?=
 =?us-ascii?Q?idUNiualT6dIzXFpgSSZm0uLiRzslSIzsFnxAZBE1aBEV1dKus6mwCjopEoU?=
 =?us-ascii?Q?XvqRMV3sD+vbTQRGwAarcexHQeOW6tXQOFRsqC/R89IA2rJ3f1j1pXxRkd5S?=
 =?us-ascii?Q?12ywvQZ20SeRAFTisG9iEdWksLOG/jqYfcNEpb62Qaaz9MGS9CVuKEHrkY6k?=
 =?us-ascii?Q?Q89SkhOja3ohhF5PrRgkpoJNqXzb+a0dSr9CY/y+TokSL3y77yQmvCP3Sa/7?=
 =?us-ascii?Q?lC/ewrIDsnqlbkyBDGyRLS+0H1HwKIM=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b21368c0-6ee2-4277-e373-08df0a504fbf
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 06:46:56.2682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: beF0qSkfMYOpLWE+pm3XC4napcNf8MOhqR/51+XyiLFluXZazu9ysiSGtlB80eJhY3N7ES7Yj8Fx+9Ug1vqxjfiOu1SlkRvRClkvHWwmJks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB2979

Add a thermal cooling device for the Wave6 VPU.
The device operates within the Linux thermal framework,
adjusting the VPU performance state based on thermal conditions.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
---
 .../chips-media/wave6/wave6-vpu-thermal.c     | 143 ++++++++++++++++++
 .../chips-media/wave6/wave6-vpu-thermal.h     |  24 +++
 2 files changed, 167 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h

diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
new file mode 100644
index 000000000000..1e67943b213b
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 thermal cooling interface
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ *
+ */
+
+#include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
+#include <linux/units.h>
+#include <linux/slab.h>
+#include "wave6-vpu-thermal.h"
+
+static int wave6_vpu_thermal_cooling_update(struct vpu_thermal_cooling *thermal,
+					    int state)
+{
+	unsigned long new_clock_rate;
+	int ret;
+
+	if (state > thermal->thermal_max || !thermal->cooling)
+		return 0;
+
+	new_clock_rate = DIV_ROUND_UP(thermal->freq_table[state], HZ_PER_KHZ);
+	dev_dbg(thermal->dev, "receive cooling state: %d, new clock rate %ld\n",
+		state, new_clock_rate);
+
+	ret = dev_pm_genpd_set_performance_state(thermal->dev, new_clock_rate);
+	if (ret && !((ret == -ENODEV) || (ret == -EOPNOTSUPP))) {
+		dev_err(thermal->dev, "failed to set perf to %lu, ret = %d\n",
+			new_clock_rate, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_cooling_get_max_state(struct thermal_cooling_device *cdev,
+					   unsigned long *state)
+{
+	struct vpu_thermal_cooling *thermal = cdev->devdata;
+
+	*state = thermal->thermal_max;
+
+	return 0;
+}
+
+static int wave6_vpu_cooling_get_cur_state(struct thermal_cooling_device *cdev,
+					   unsigned long *state)
+{
+	struct vpu_thermal_cooling *thermal = cdev->devdata;
+
+	*state = thermal->thermal_event;
+
+	return 0;
+}
+
+static int wave6_vpu_cooling_set_cur_state(struct thermal_cooling_device *cdev,
+					   unsigned long state)
+{
+	struct vpu_thermal_cooling *thermal = cdev->devdata;
+	int ret;
+
+	ret = wave6_vpu_thermal_cooling_update(thermal, state);
+	if (ret)
+		return ret;
+
+	thermal->thermal_event = state;
+
+	return 0;
+}
+
+static const struct thermal_cooling_device_ops wave6_cooling_ops = {
+	.get_max_state = wave6_vpu_cooling_get_max_state,
+	.get_cur_state = wave6_vpu_cooling_get_cur_state,
+	.set_cur_state = wave6_vpu_cooling_set_cur_state,
+};
+
+int wave6_vpu_cooling_init(struct device *dev, struct vpu_thermal_cooling *thermal)
+{
+	int i;
+	int num_opps;
+	unsigned long freq;
+	int ret = -EINVAL;
+
+	if (WARN_ON(!thermal || !thermal->dev))
+		return -EINVAL;
+
+	num_opps = dev_pm_opp_get_opp_count(thermal->dev);
+	if (num_opps < 0) {
+		dev_err(thermal->dev, "fail to get pm opp count, ret = %d\n", num_opps);
+		return num_opps;
+	}
+	if (num_opps == 0) {
+		dev_err(thermal->dev, "no OPP entries found\n");
+		return -ENODEV;
+	}
+
+	thermal->freq_table = devm_kcalloc(dev, num_opps,
+					   sizeof(*thermal->freq_table),
+					   GFP_KERNEL);
+	if (!thermal->freq_table) {
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	for (i = 0, freq = ULONG_MAX; i < num_opps; i++, freq--) {
+		struct dev_pm_opp *opp;
+
+		opp = dev_pm_opp_find_freq_floor(thermal->dev, &freq);
+		if (IS_ERR(opp))
+			break;
+
+		dev_pm_opp_put(opp);
+
+		dev_dbg(thermal->dev, "[%d] = %lu\n", i, freq);
+		if (freq < 100 * HZ_PER_MHZ)
+			break;
+
+		thermal->freq_table[i] = freq;
+		thermal->thermal_max = i;
+	}
+
+	if (!thermal->thermal_max)
+		goto error;
+
+	thermal->thermal_event = 0;
+	thermal->cooling = devm_thermal_of_child_cooling_device_register(dev,
+									 dev->of_node,
+									 dev_name(thermal->dev),
+									 thermal,
+									 &wave6_cooling_ops);
+	if (IS_ERR(thermal->cooling)) {
+		dev_err(thermal->dev, "register cooling device failed\n");
+		ret = PTR_ERR(thermal->cooling);
+		goto error;
+	}
+
+	return 0;
+
+error:
+	return ret;
+}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h
new file mode 100644
index 000000000000..7c5e8aed6ef7
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 thermal cooling interface
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ *
+ */
+
+#ifndef __WAVE6_VPU_THERMAL_H__
+#define __WAVE6_VPU_THERMAL_H__
+
+#include <linux/thermal.h>
+
+struct vpu_thermal_cooling {
+	struct device *dev;
+	int thermal_event;
+	int thermal_max;
+	struct thermal_cooling_device *cooling;
+	unsigned long *freq_table;
+};
+
+int wave6_vpu_cooling_init(struct device *dev, struct vpu_thermal_cooling *thermal);
+
+#endif /* __WAVE6_VPU_THERMAL_H__ */
-- 
2.31.1

