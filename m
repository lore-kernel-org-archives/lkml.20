Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020140.outbound.protection.outlook.com [52.101.156.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCA5427FB0;
	Fri,  4 Sep 2026 06:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788504434; cv=fail; b=kED4BhIAkIrOhQI0wdb9+xsNsq4/il5q2XbnpVPD1jIqqi0oCi0KV3uedN2GFRJl6+aPzYb9wCi4v5KU680Xdehsl9qJFIhH40rvPdy9SUKB1clgy244OStjVztkiUUIAWmxEG6RH02LkZ4xzlZj8XwK4XcC19Xp+Wfl1iG6Pxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788504434; c=relaxed/simple;
	bh=oThRTSenYrPWZPfapNQTyZb+aOUC+S26GoYDSTvNmS8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ujchplV22YkxW/BJS5Hu1xgu5Tfv6t8bFnpTSdySWQ/EhZksJaduPe1hP9XuqBw/3n3/bmQkBq/jpf3aIU0R1C/r0774JXuatu114ca6K/ILiFQH+Mea/QMEu9qTOreIDU7a0ouKbqETToFRhLK9BevgHcQt4dczm/cMM4fMvXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=pgXY1Mxs; arc=fail smtp.client-ip=52.101.156.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="pgXY1Mxs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uTqIxihuVlMfD9w07DyRBGXgR+fpvV5K3nW8EjDIl5/Ma8LY0YsTGTof4k1l4g+dxlFWbtqAOEKTWf2sO2h6ewllpHUAF78WwWJkQx9rmQBnqV74qtm4PrsVe+T8+pZ6xVaGgmPqmcsr/ItxnytS6KgZIJ/wt7IUUG2Z0FF1RuW2h7gTxJ29L2RJRo3+UbpsOcNiVmUVjXiqiP++PTSRdgSUzMW8S5Rs1AuhKpQ5hNnzXPTolh/rSJGTCEPS/qu1nqnlIzC+no4jjakAfRD91FHWVcuj64uInKcE0K9kA2bOhM4clOKgiF0pqutbQc3zdmt8P17b8NXNFUGR04crQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TN1UVtEy88dDo21r9FLmbaitPxT3RI46Eyn83/FxOI=;
 b=O5IISSHfEnMnkGZiJ4NLHfwdr9K7JyiOXN7sYuQkJk7sU0J1RjxDSxJmezKINuCb1CT1JrIiN1CAIxJdkG0qU20wkbkG1LMkhS6NEttPBXwk0JOLKSnfIcr6FXYJCBIQt1HkbiksBYF1vy2ePkukCXiafegKDumXLdCs+Rf1kmeVR++E0QQyd7h9hCWT8RIYPBGC7PXAa438ewNbci2yyROwSPGVSqWvAxn5Yn0P7KKnr8+Gykg9Kzl7YX5WF0loLCs/HkVCnKIks5zxZ7p4o28Q9PpWzD8cTxSMw4a+mJvd5iByupi15MJM3CXOOBoUqVR7vX6tk0eyUAy6lMsxTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TN1UVtEy88dDo21r9FLmbaitPxT3RI46Eyn83/FxOI=;
 b=pgXY1Mxs2V0ShtX2ybGNh78Zvo3qEEP1cVpGHAdvpUq/J6JkPBJwql0oUZj2U09D/sSec9XTViqeOjOSMlw0JSsLLjs/CclZU8kR8DC+4N48ECozpEzApjbl2o/SwwFYiBkoVUPIVsMP1Wh8Wt5668SnUAmTkojXGN9sGBpAy8a2JUBBs7AbKoNOz2tR+TZok3akZDmhI2I0Qm9HedJzvHvwCThoj3HrmPouJ30liZAOlLlar+y4v+hRT4ScBEq8kX18jOnn84Iufrjq82pW3RUbCCkkRqVhxWDgf1XMTybndCOucJSLrGf63RU8U4+le1v/X58L4fIjztXg7HCEyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SEWP216MB2979.KORP216.PROD.OUTLOOK.COM (2603:1096:101:296::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 06:46:54 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 06:46:54 +0000
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
Subject: [PATCH v7 5/9] media: chips-media: wave6: Add Wave6 core driver
Date: Fri,  4 Sep 2026 15:46:31 +0900
Message-Id: <e8323267420b8e8d29e71c7ea018759cb7298c8d.1788496816.git.nas.chung@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0b99ffe5-8de7-49ad-c0b7-08df0a504e78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|52116014|366016|38350700014|6133799003|10067099003|18002099003|22082099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	yPJRm7aga2wnWu2oc/xlzYEBWNVybIgGwgegnV4/VVwFQcE+j26qOiMW8uvKRdOYmvD/Rs7KADx52oTeHpo/S+S+XUBGFsP5vq+/R/dDwFspjLQwS1nUf/RiNLzEihm0wRqm21V3j+xOIwMNkmPQO3Kbd7zBqjfvTGFMPDh+aG2vIW0o8gq1svoBuskhbg2ZUpA0Vh1HOUVc5UwPJ4wjbzytBUbNN5otkadTDZX4iL2xaG++z+IZqeWglpZLsU0Rqo+T2rnuJckdyt9oC90kVfnlj7joZZKfKjG9z+mbUjxGhd44cQeY0AwIvgxV6u69yf1ge3CRc9FO8ip8m2gGkKj1SgUCH8NPb2VH6AaZRQAjfzA9xb8jdUDWaYpeaEoTHo00Zc/E9K643bpcCVvpF6LqJEdIG4SOVlPF9qPP1Qr28tXdAzMy9omjWev5KQyLDBcF+Woe7nvsypGYfu7wMhDkL5k9OS0TFZ5PTmutNdu/Ih33P0DgZpfJmeAPMts8VlTEVnAuYJniycUGqXNXpw7XDJ2dN8oWMYfoLKZIbV9wbSB1qhIW7FPREM4Iupj2FmG/oDvuDEbI4zcRR9AkPxUgXykuha0xULguPKpj/o7YJuz9PRtXffF0bGw0g1gb+yQhWYlEvY+mW9TPjycTTNK1La/e68kr5SwNFR4oEPveUJWEnemfcFGHA44wfpbG98kKYym2z+obH7MKOVhFrz5mLDZ8EgVSgmvaCqcC1F8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(52116014)(366016)(38350700014)(6133799003)(10067099003)(18002099003)(22082099003)(3023799007)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RNEujsBJ3oeJjAWOxJvlEdaX/yU2z1j19mR0nbn+gWxpXNXRl4pduvelUe+h?=
 =?us-ascii?Q?Rbt1XGh6xNyg/DkdKthShId4637Ak4W79x1jaMUBIPMHbrOqukPW6FoTCR35?=
 =?us-ascii?Q?gIAbeS0BEQXO8iJXrHM2nguLBclAuYyFsWl0D0V2PN7Wsf0aTJ+ocgk2VxFf?=
 =?us-ascii?Q?OgAD7NvFj/QDjc5ejjsiAzHbSfzPbIHKSmWHEw4qul+/9gWwyPH77/GoFu1M?=
 =?us-ascii?Q?jIejpCSk7uyEAW2WqbsUE8LQ3IGwSIas87+huIfJ7ZC5+R9VqRE2qT/G19Dp?=
 =?us-ascii?Q?XzM0uPSdveiGg21qDaMgubuukFqEyA4+uYfEwI0wuwNtIoklqgm7HL87nYS2?=
 =?us-ascii?Q?0gW2SOsiofw8MJ6xqxvLhuG2kmDVkd4MHgLlIofmUu0EW0FKoFoBnaCpuusS?=
 =?us-ascii?Q?J/w7yq1hJXs99upnpTgslnWLuqnNaeRArzFa3oOjiVZMyq+yeWfYwJLj9fju?=
 =?us-ascii?Q?fXDqosY2kgc3dmUx2Cu+ZG9EOM7RzJgU0GfD1KYF332u9vjSYOzR9MgaKZD4?=
 =?us-ascii?Q?gXgBqsspeteEB48Pwc+ZjDEzlnE8HzvG08Kk/s8zfQsRjdMlzVFvArcw4jlo?=
 =?us-ascii?Q?Nig3dktxBPvESJPESQpp8iO/qTfRB5kwT+uzKoVBi6fCA5lpn+rtIO5I9FZT?=
 =?us-ascii?Q?cDnEw3kRq9LXepMLXrGUo7PDdPSH6VbdH1BDkPsdjGEA3nWBsqIUNur0xo2P?=
 =?us-ascii?Q?TTovEgLQhZBRZblDkVXrGaKd2zm199ZA0OZAZJ7t8Gx2Zxqv8cEeUclpff6T?=
 =?us-ascii?Q?JQX51FFAjhl89/Lw8HOxsy3F+UvrJDYM3LSeHq0ISBrxyBmvplITTbqj6d48?=
 =?us-ascii?Q?DOoM3S6mcd+SkJg4LKNmVDYfpFNxIV+eJEbKhx6Z6W47nfQ1HMQXfhMg1/RP?=
 =?us-ascii?Q?+DXSnMa8ai4FyHO7VFTQZpMiz8/xGL7siMgtFsNn89Mf75kKZOJoYwwtZIZL?=
 =?us-ascii?Q?6tnUdGgzLEPwBF4nUwK6dnQmZ+P3h2y/Fw6BvgTOs4mvB/Mm/TjmVwZ2bnVw?=
 =?us-ascii?Q?IglvWmbC1EXYxpR5C9kJujFHQvb9ieCsDsq9V5y6zMRkmlIh61Afb5NxMmwd?=
 =?us-ascii?Q?N6tg+AuDtwbE/eaZUXblgkMq7YyMSxz3TgKzNQ7Et7wOgEQdyWyQvl8cJaJT?=
 =?us-ascii?Q?PViEj3d/ORDvuAOcFayqis+JlzVxPP1PRREQjI5ATZOA3bzSl/pXTjdAb7k2?=
 =?us-ascii?Q?QSRaAwE9pYwCCw0FXLXnh4bXQwgdeMQrAJey4JovVnolMlN/UaOsLbOQFiSE?=
 =?us-ascii?Q?5WOWD4d0XvSo0g2Yr2gGkd8w7gAXx6Cwc+ZPIQgTKlX8VlFoanqxhBlesM1A?=
 =?us-ascii?Q?2QA6Axl+djexA8zYvyDVJmL5mgd7n31HAhG7obT8S5qV/DQzXKfrTTYZ7QYS?=
 =?us-ascii?Q?gjSSr7JqAhdZCU9u3ik5TTjol27KqYOmT3pgvDFiIJgpGvSb04WJPmi39WYb?=
 =?us-ascii?Q?lOcX5EDp66Gf+sK43yvw8cJ/u3DWACZWC8ZIAgUtg9V7aAfsTXfPaEE7dGa5?=
 =?us-ascii?Q?VMsfKAj/uNrntc1hrgp61gbiBYzjcEkjG4luiUl0B3+vKweOWrF5gQh5sEwk?=
 =?us-ascii?Q?hsgf7FS+3nqJ1cwftgnojXRsEK70NF++bsHjzj3z4L19lee7ALtSLn63y9tY?=
 =?us-ascii?Q?1Ol6YM/Yf9Y5d8p57i73BEV202eabvKJ24tm28U4TITfL0facWw3akU22FhA?=
 =?us-ascii?Q?07Xhmbkm2H/WIwOvVeHP9mcV0wVJhoaeDT+a2qNAJP5kUXgKMVYWQB/CRlnD?=
 =?us-ascii?Q?UAA4AtXqgQ9mrz1aaPJZSSa4wOFKR7Y=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b99ffe5-8de7-49ad-c0b7-08df0a504e78
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 06:46:54.1580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NnAwc03G0aIudrxk7bJqGNKR7n/lPvyUQ88E6ynhuKG2fpp6BsRqiXZMC2RTxkLiOkAGP8sl3pWNfri4tLRoGD2rx4ly2WmTWQFmH3QvYK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB2979

Add the core driver for the Chips&Media Wave6 video codec IP.

The hardware contains one control register region and four interface
register regions for a shared video processing engine. This driver
handles the interface register regions, each with its own MMIO range and
interrupt, while relying on the control driver for firmware loading and
shared resource management.

It configures the V4L2 mem2mem devices and communicates with the Wave6
hardware to perform video processing tasks.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
---
 .../chips-media/wave6/wave6-vpu-core.c        | 448 ++++++++++++++++++
 .../chips-media/wave6/wave6-vpu-core.h        | 126 +++++
 2 files changed, 574 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.h

diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
new file mode 100644
index 000000000000..89cce27802cf
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
@@ -0,0 +1,448 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 core driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
+#include <linux/debugfs.h>
+#include <linux/iopoll.h>
+#include "wave6-vpu-core.h"
+#include "wave6-regdefine.h"
+#include "wave6-vpuconfig.h"
+#include "wave6-hw.h"
+#include "wave6-vpu-dbg.h"
+
+#define CREATE_TRACE_POINTS
+#include "wave6-trace.h"
+
+#define WAVE6_VPU_DEBUGFS_DIR "wave6"
+
+static irqreturn_t wave6_vpu_core_irq(int irq, void *dev_id)
+{
+	struct vpu_core_device *core = dev_id;
+	struct vpu_irq irq_info;
+
+	if (!vpu_read_reg(core, W6_VPU_VPU_INT_STS))
+		return IRQ_NONE;
+
+	irq_info.status = vpu_read_reg(core, W6_VPU_VINT_REASON);
+	irq_info.inst_idc = vpu_read_reg(core, W6_RET_INT_INSTANCE_INFO);
+
+	vpu_write_reg(core, W6_RET_INT_INSTANCE_INFO, INT_INSTANCE_INFO_CLEAR);
+	vpu_write_reg(core, W6_VPU_VINT_REASON_CLEAR, irq_info.status);
+	vpu_write_reg(core, W6_VPU_VINT_CLEAR, VINT_CLEAR);
+
+	trace_wave6_vpu_irq(core, irq_info.status, irq_info.inst_idc);
+
+	if (irq_info.status & BIT(W6_INT_BIT_REQ_WORK_BUF)) {
+		if (core->vpu)
+			core->vpu->req_work_buffer(core->vpu, core);
+
+		return IRQ_HANDLED;
+	}
+
+	if (kfifo_in(&core->irq_fifo, &irq_info, sizeof(struct vpu_irq)) !=
+	    sizeof(struct vpu_irq))
+		dev_err(core->dev, "IRQ overflow status 0x%x idc 0x%x\n",
+			irq_info.status, irq_info.inst_idc);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static struct vpu_instance *wave6_vpu_core_get_instance(struct vpu_core_device *core,
+							u32 inst_idc)
+{
+	struct vpu_instance *inst;
+
+	guard(spinlock)(&core->inst_lock);
+
+	list_for_each_entry(inst, &core->instances, list) {
+		if ((BIT(inst->id) & inst_idc) && inst->enable) {
+			atomic_inc(&inst->refcount);
+			return inst;
+		}
+	}
+
+	return NULL;
+}
+
+static void wave6_vpu_core_put_instance(struct vpu_instance *inst)
+{
+	if (!inst)
+		return;
+
+	guard(spinlock)(&inst->dev->inst_lock);
+	atomic_dec_if_positive(&inst->refcount);
+}
+
+void wave6_vpu_enable_instance(struct vpu_instance *inst)
+{
+	scoped_guard(spinlock, &inst->dev->inst_lock) {
+		atomic_set(&inst->refcount, 0);
+		inst->enable = true;
+	}
+}
+
+void wave6_vpu_disable_instance(struct vpu_instance *inst)
+{
+	int count;
+
+	scoped_guard(spinlock, &inst->dev->inst_lock)
+		inst->enable = false;
+
+	if (read_poll_timeout(atomic_read, count, !count,
+			      W6_VPU_POLL_DELAY_US,
+			      W6_VPU_POLL_TIMEOUT,
+			      true, &inst->refcount))
+		dev_dbg(inst->dev->dev, "[%d] disable timeout\n", inst->id);
+}
+
+static irqreturn_t wave6_vpu_core_irq_thread(int irq, void *dev_id)
+{
+	struct vpu_core_device *core = dev_id;
+	struct vpu_instance *inst;
+	struct vpu_irq irq_info;
+
+	while (kfifo_len(&core->irq_fifo)) {
+		bool error = false;
+
+		if (!kfifo_out(&core->irq_fifo, &irq_info, sizeof(struct vpu_irq)))
+			break;
+
+		inst = wave6_vpu_core_get_instance(core, irq_info.inst_idc);
+		if (!inst)
+			continue;
+
+		if ((irq_info.status & BIT(W6_INT_BIT_INIT_SEQ)) ||
+		    (irq_info.status & BIT(W6_INT_BIT_ENC_SET_PARAM))) {
+			complete(&inst->irq_done);
+			wave6_vpu_core_put_instance(inst);
+			continue;
+		}
+
+		if (irq_info.status & BIT(W6_INT_BIT_BSBUF_ERROR))
+			error = true;
+
+		if (inst->ops && inst->ops->finish_process)
+			inst->ops->finish_process(inst, error);
+
+		wave6_vpu_core_put_instance(inst);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int wave6_vpu_core_check_state(struct vpu_core_device *core)
+{
+	u32 val;
+	int ret;
+
+	guard(mutex)(&core->hw_lock);
+
+	ret = read_poll_timeout(vpu_read_reg, val, val != 0,
+				W6_VPU_POLL_DELAY_US, W6_VPU_POLL_TIMEOUT,
+				false, core, W6_VPU_VCPU_CUR_PC);
+	if (ret)
+		return ret;
+
+	wave6_vpu_enable_interrupt(core);
+	ret = wave6_vpu_get_version(core);
+	if (ret) {
+		dev_err(core->dev, "wave6_vpu_get_version fail\n");
+		return ret;
+	}
+
+	dev_dbg(core->dev, "product 0x%x, fw_ver %d.%d.%d(r%d), hw_ver 0x%x\n",
+		core->attr.product_code,
+		FW_VERSION_MAJOR(core->attr.fw_version),
+		FW_VERSION_MINOR(core->attr.fw_version),
+		FW_VERSION_REL(core->attr.fw_version),
+		core->attr.fw_revision,
+		core->attr.hw_version);
+
+	if (core->attr.fw_version < core->res->compatible_fw_version)
+		dev_err(core->dev, "fw version is too low (< v%d.%d.%d)\n",
+			FW_VERSION_MAJOR(core->res->compatible_fw_version),
+			FW_VERSION_MINOR(core->res->compatible_fw_version),
+			FW_VERSION_REL(core->res->compatible_fw_version));
+
+	return 0;
+}
+
+void wave6_vpu_core_activate(struct vpu_core_device *core)
+{
+	core->active = true;
+}
+
+static int wave6_vpu_core_wait_activated(struct vpu_core_device *core)
+{
+	if (!core->active)
+		return 0;
+
+	return wave6_vpu_core_check_state(core);
+}
+
+static int wave6_vpu_core_probe(struct platform_device *pdev)
+{
+	struct vpu_core_device *core;
+	const struct wave6_vpu_core_resource *res;
+	int ret;
+	int irq;
+
+	res = dev_get_platdata(&pdev->dev);
+	if (!res)
+		return -ENODEV;
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", ret);
+		return ret;
+	}
+
+	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
+	if (!core)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(&pdev->dev, &core->dev_lock);
+	if (ret)
+		return ret;
+
+	ret = devm_mutex_init(&pdev->dev, &core->hw_lock);
+	if (ret)
+		return ret;
+
+	spin_lock_init(&core->inst_lock);
+	INIT_LIST_HEAD(&core->instances);
+	dev_set_drvdata(&pdev->dev, core);
+	core->dev = &pdev->dev;
+	core->res = res;
+
+	if (pdev->dev.parent->driver && pdev->dev.parent->driver->name &&
+	    !strcmp(pdev->dev.parent->driver->name, WAVE6_VPU_PLATFORM_DRIVER_NAME))
+		core->vpu = dev_get_drvdata(pdev->dev.parent);
+
+	core->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(core->reg_base))
+		return PTR_ERR(core->reg_base);
+
+	ret = devm_clk_bulk_get_all(&pdev->dev, &core->clks);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "failed to get clocks\n");
+
+	core->num_clks = ret;
+
+	ret = kfifo_init(&core->irq_fifo, core->irq_buffer,
+			 sizeof(core->irq_buffer));
+	if (ret)
+		return ret;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_threaded_irq(&pdev->dev, irq,
+					wave6_vpu_core_irq,
+					wave6_vpu_core_irq_thread,
+					0, "vpu_irq", core);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to request IRQ: %d\n", ret);
+		return ret;
+	}
+
+	ret = v4l2_device_register(&pdev->dev, &core->v4l2_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register v4l2_dev: %d\n", ret);
+		return ret;
+	}
+
+	ret = wave6_vpu_init_m2m_dev(core);
+	if (ret)
+		goto err_v4l2_unregister;
+
+	core->temp_vbuf.size = ALIGN(W6_TEMPBUF_SIZE, 4096);
+	ret = wave6_vdi_alloc_dma(core->dev, &core->temp_vbuf);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to allocate temp_vbuf: %d\n", ret);
+		goto err_m2m_dev_release;
+	}
+
+	core->debugfs = debugfs_lookup(WAVE6_VPU_DEBUGFS_DIR, NULL);
+	if (!IS_ERR_OR_NULL(core->debugfs))
+		dput(core->debugfs);
+	else
+		core->debugfs = debugfs_create_dir(WAVE6_VPU_DEBUGFS_DIR, NULL);
+
+	pm_runtime_enable(&pdev->dev);
+
+	if (core->res->codec_types & WAVE6_IS_DEC) {
+		ret = wave6_vpu_dec_register_device(core);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"failed to register video_dev_dec: %d\n", ret);
+			goto err_temp_vbuf_free;
+		}
+	}
+	if (core->res->codec_types & WAVE6_IS_ENC) {
+		ret = wave6_vpu_enc_register_device(core);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"failed to register video_dev_enc: %d\n", ret);
+			goto err_dec_unreg;
+		}
+	}
+
+	dev_dbg(&pdev->dev, "Added wave6 driver with caps %s %s\n",
+		core->res->codec_types & WAVE6_IS_ENC ? "'ENCODE'" : "",
+		core->res->codec_types & WAVE6_IS_DEC ? "'DECODE'" : "");
+
+	return 0;
+
+err_dec_unreg:
+	if (core->res->codec_types & WAVE6_IS_DEC)
+		wave6_vpu_dec_unregister_device(core);
+err_temp_vbuf_free:
+	pm_runtime_disable(&pdev->dev);
+	wave6_vdi_free_dma(&core->temp_vbuf);
+err_m2m_dev_release:
+	wave6_vpu_release_m2m_dev(core);
+err_v4l2_unregister:
+	v4l2_device_unregister(&core->v4l2_dev);
+
+	return ret;
+}
+
+static void wave6_vpu_core_remove(struct platform_device *pdev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(&pdev->dev);
+
+	wave6_vpu_enc_unregister_device(core);
+	wave6_vpu_dec_unregister_device(core);
+	pm_runtime_disable(&pdev->dev);
+	wave6_vdi_free_dma(&core->temp_vbuf);
+	wave6_vpu_release_m2m_dev(core);
+	v4l2_device_unregister(&core->v4l2_dev);
+}
+
+static int wave6_vpu_core_runtime_suspend(struct device *dev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(dev);
+
+	if (WARN_ON(!core))
+		return -ENODEV;
+
+	/*
+	 * Only call parent VPU put_vpu if the core has a parent and is active.
+	 * - core->vpu: prevent access in core without parent VPU.
+	 * - core->active: execute sleep only after m2m streaming is started.
+	 */
+	if (core->vpu && core->active)
+		core->vpu->put_vpu(core->vpu, core);
+
+	if (core->num_clks)
+		clk_bulk_disable_unprepare(core->num_clks, core->clks);
+
+	return 0;
+}
+
+static int wave6_vpu_core_runtime_resume(struct device *dev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(dev);
+	bool boot_vpu;
+	int ret;
+
+	if (WARN_ON(!core))
+		return -ENODEV;
+
+	if (core->num_clks) {
+		ret = clk_bulk_prepare_enable(core->num_clks, core->clks);
+		if (ret) {
+			dev_err(dev, "failed to enable clocks: %d\n", ret);
+			return ret;
+		}
+	}
+
+	/*
+	 * Only call parent VPU get_vpu if the core has a parent and is active.
+	 * - core->vpu: prevent access in core without parent VPU.
+	 * - core->active: execute boot only after m2m streaming is started.
+	 */
+	boot_vpu = core->vpu && core->active;
+	if (boot_vpu) {
+		ret = core->vpu->get_vpu(core->vpu, core);
+		if (ret)
+			goto error_get_vpu;
+	}
+
+	ret = wave6_vpu_core_wait_activated(core);
+	if (ret)
+		goto error_activate;
+
+	return 0;
+
+error_activate:
+	if (boot_vpu)
+		core->vpu->put_vpu(core->vpu, core);
+error_get_vpu:
+	if (core->num_clks)
+		clk_bulk_disable_unprepare(core->num_clks, core->clks);
+
+	return ret;
+}
+
+static int wave6_vpu_core_suspend(struct device *dev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(dev);
+	int ret;
+
+	v4l2_m2m_suspend(core->m2m_dev);
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		v4l2_m2m_resume(core->m2m_dev);
+
+	return ret;
+}
+
+static int wave6_vpu_core_resume(struct device *dev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
+	v4l2_m2m_resume(core->m2m_dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops wave6_vpu_core_pm_ops = {
+	RUNTIME_PM_OPS(wave6_vpu_core_runtime_suspend,
+		       wave6_vpu_core_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(wave6_vpu_core_suspend,
+			    wave6_vpu_core_resume)
+};
+
+static struct platform_driver wave6_vpu_core_driver = {
+	.driver = {
+		.name = WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME,
+		.pm = pm_ptr(&wave6_vpu_core_pm_ops),
+	},
+	.probe = wave6_vpu_core_probe,
+	.remove = wave6_vpu_core_remove,
+};
+
+module_platform_driver(wave6_vpu_core_driver);
+MODULE_ALIAS("platform:" WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME);
+MODULE_DESCRIPTION("chips&media Wave6 VPU CORE V4L2 driver");
+MODULE_AUTHOR("CHIPS&MEDIA INC");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
new file mode 100644
index 000000000000..779e8a132f57
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 core driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VPU_CORE_H__
+#define __WAVE6_VPU_CORE_H__
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/videobuf2-dma-contig.h>
+#include "wave6-vpuconfig.h"
+#include "wave6-vpuapi.h"
+
+#define vpu_write_reg(CORE, ADDR, DATA) wave6_vpu_writel(CORE, ADDR, DATA)
+#define vpu_read_reg(CORE, ADDR) wave6_vpu_readl(CORE, ADDR)
+
+struct vpu_buffer {
+	struct v4l2_m2m_buffer v4l2_m2m_buf;
+	bool consumed;
+	bool used;
+	bool error;
+	bool force_key_frame;
+	bool force_frame_qp;
+	u32 force_i_frame_qp;
+	u32 force_p_frame_qp;
+	u32 force_b_frame_qp;
+	ktime_t ts_input;
+	ktime_t ts_start;
+	ktime_t ts_finish;
+	ktime_t ts_output;
+	u64 hw_time;
+	u32 average_qp;
+};
+
+enum vpu_fmt_type {
+	VPU_FMT_TYPE_CODEC	= 0,
+	VPU_FMT_TYPE_RAW	= 1
+};
+
+#define VPU_FMT_FLAG_CBCR_INTERLEAVED	BIT(0)
+#define VPU_FMT_FLAG_CRCB_ORDER		BIT(1)
+#define VPU_FMT_FLAG_10BIT		BIT(2)
+#define VPU_FMT_FLAG_RGB		BIT(3)
+#define VPU_FMT_FLAG_SUPPORT_ROT_MIR	BIT(4)
+
+struct vpu_format {
+	unsigned int v4l2_pix_fmt;
+	unsigned int max_width;
+	unsigned int min_width;
+	unsigned int max_height;
+	unsigned int min_height;
+	unsigned int num_planes;
+	enum frame_buffer_format fb_fmt;
+	enum endian_mode endian;
+	enum csc_format_order csc_fmt_order;
+	unsigned int flags;
+};
+
+static inline struct vpu_instance *wave6_fh_to_vpu_inst(struct v4l2_fh *vfh)
+{
+	return container_of(vfh, struct vpu_instance, v4l2_fh);
+}
+
+static inline struct vpu_instance *wave6_file_to_vpu_inst(struct file *filp)
+{
+	return wave6_fh_to_vpu_inst(file_to_v4l2_fh(filp));
+}
+
+static inline struct vpu_instance *wave6_ctrl_to_vpu_inst(struct v4l2_ctrl *vctrl)
+{
+	return container_of(vctrl->handler, struct vpu_instance, v4l2_ctrl_hdl);
+}
+
+static inline struct vpu_buffer *wave6_to_vpu_buf(struct vb2_v4l2_buffer *vbuf)
+{
+	return container_of(vbuf, struct vpu_buffer, v4l2_m2m_buf.vb);
+}
+
+static inline bool wave6_vpu_both_queues_are_streaming(struct vpu_instance *inst)
+{
+	struct vb2_queue *vq_cap = v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx);
+	struct vb2_queue *vq_out = v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx);
+
+	return vb2_is_streaming(vq_cap) && vb2_is_streaming(vq_out);
+}
+
+u32 wave6_vpu_get_consumed_fb_num(struct vpu_instance *inst);
+void wave6_vpu_core_activate(struct vpu_core_device *core);
+void wave6_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
+			  unsigned int width,
+			  unsigned int height);
+struct vb2_v4l2_buffer *wave6_get_dst_buf_by_addr(struct vpu_instance *inst,
+						  dma_addr_t addr);
+dma_addr_t wave6_get_dma_addr(struct vb2_v4l2_buffer *buf,
+			      unsigned int plane_no);
+enum codec_std wave6_to_codec_std(enum vpu_instance_type type, unsigned int v4l2_pix_fmt);
+const char *wave6_vpu_instance_state_name(enum vpu_instance_state state);
+void wave6_vpu_set_instance_state(struct vpu_instance *inst,
+				  enum vpu_instance_state state);
+u64 wave6_vpu_cycle_to_ns(struct vpu_core_device *core, u64 cycle);
+int wave6_vpu_wait_interrupt(struct vpu_instance *inst, unsigned int timeout);
+int wave6_vpu_dec_register_device(struct vpu_core_device *core);
+void wave6_vpu_dec_unregister_device(struct vpu_core_device *core);
+int wave6_vpu_enc_register_device(struct vpu_core_device *core);
+void wave6_vpu_enc_unregister_device(struct vpu_core_device *core);
+void wave6_vpu_finish_job(struct vpu_instance *inst);
+void wave6_vpu_record_performance_timestamps(struct vpu_instance *inst);
+void wave6_vpu_handle_performance(struct vpu_instance *inst,
+				  struct vpu_buffer *vpu_buf);
+void wave6_vpu_reset_performance(struct vpu_instance *inst);
+int wave6_vpu_init_m2m_dev(struct vpu_core_device *core);
+void wave6_vpu_release_m2m_dev(struct vpu_core_device *core);
+int wave6_vpu_subscribe_event(struct v4l2_fh *fh,
+			      const struct v4l2_event_subscription *sub);
+void wave6_vpu_return_buffers(struct vpu_instance *inst,
+			      unsigned int type, enum vb2_buffer_state state);
+void wave6_vpu_enable_instance(struct vpu_instance *inst);
+void wave6_vpu_disable_instance(struct vpu_instance *inst);
+
+#endif /* __WAVE6_VPU_CORE_H__ */
-- 
2.31.1

