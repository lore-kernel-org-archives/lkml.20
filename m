Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013060.outbound.protection.outlook.com [52.101.83.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD69623507B;
	Thu, 10 Sep 2026 01:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789002437; cv=fail; b=f6Z2CgnDuUPY7zimNe7j4gnsYTCQ++54PVC5mB70ECzxuMiIzdfPqERw9Uysj8VZJEb+bByM6Gav68HmotATpzLoEKYXOC/Nkw4EdxF9J42Nzk4q3WBAkNawwKFPvZWi/6S2KFIoK6uWQTiCMX7q/66tk8qzqoHWo2UqFl6i2Z8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789002437; c=relaxed/simple;
	bh=jr1hW6gQ8UPkb4Mg8ItTpRnCXYRGw+AGjWm2J1YM5+s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IqgzoIp/y8PeywIasS+FJIyf6sE6tyTIjf7GGR8b22ct5pGv+VTVUiWYQbKGT4CLDP5oxLo5hcCToKMitKS+dXbNRg/SeN1v82GL2dEy+Z4jQpTQda8izmAchucwNnQPFMPOl3avCtQA2Hnrh337M4vxwodUGwkKX3ostE5nkKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HQHh+4AG; arc=fail smtp.client-ip=52.101.83.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HQHh+4AG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J19kjzGVWNFvxss4nvgNo5fyjQZPeM1EwwSYdO7sFgK97NhubDMUuktmFLzCNmi5rLBLm4LwHqDeV78h+mEHbQSzqZmBthQ1kuyMBhjydOlOG66lXK0H1PZEeLZE0cZTmsc0457eVlU6mY6TwPpyBAvBnCyt6vpL0WoA57k2FOYX+FlkZrwxYsaGFTvc7FVDXNdjFDhGBZkdgY6XAe7wQ1BmhD9NWI3oEYk+01hBpwmidw2QWaZyQ3ywxBkEZ2SdBbmJI/y93cOE+bi8peSwYQbmK0y206AnxAy+Qb3u0OGv1DZD3QliBlq6pb8NKg/zxgZQ/f455f4RSfA15WoA5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wBHkAJvdIIJWzdnjTOnh4Q/SX8HAevTJeyGoY0b83Y=;
 b=NJhNnKq96OUHUySwMI1/rCMkRuGAVKYRhyz5IcSUHz8k8iSMZnPY+z1WZt506R3mDBqW7EPt03en3W+UxDe1FMfJGE9JFYG55yRLYOuN75aYeN7rFbumS8KY4FlcTD0GHV2/1oRu/F9p66j3jkzOEMu91OgkGNQj1GOpBvcmMCHhglqtASyqwmH1u9WZ/te3kcnQ3kQTALOkHwIIUokMHW7ym/OHLTSvs5BPjpUBq2jFa1x0niQ0ea6sa/iXSsnG1vb9l4xIZEu2X/260RgPrGNvo/myIPwGsxqvm5XfCQBfRz/3r2HQy6T1+CzAIGrKWmkstXF2nPzqGywwhow4OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wBHkAJvdIIJWzdnjTOnh4Q/SX8HAevTJeyGoY0b83Y=;
 b=HQHh+4AGDiOoFXUWtxOYFqfcycSvtzB9rTERaPLt5Mt/l5y7EMerrGXRE236gmQDHn/qG6D7Pzp9eDytYiGD5+IR2cfbohowSENP4w1xaIevrd9hZPU9jxgICfFku/g8xlOND4G4gSTiuDGpOEx8Z+bBGgGQ9kcvUIdT7NcXzBmmOhsfYN+ALqP+j9iWZaDEpX8mhMKZMQmn+pn5F124j3/kZ/4qxTxWcF6++b8w4+wlwYqrdVtq5FNstW3Mx0jK/iOpqjcr7O4k31O2hBK22evhLxaw2yhpTiCA+BRt3V/BF+G6fOlvDeT0S/5aGT7ft4wxFFb6qmx/wAx2Es/nfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by GV2PR04MB11739.eurprd04.prod.outlook.com
 (2603:10a6:150:2fc::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 01:07:12 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 01:07:12 +0000
From: marouene.boubakri@oss.nxp.com
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Sumit Garg <sumit.garg@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Subject: [RFC PATCH v1 1/6] mailbox: riscv-sbi-mpxy: add riscv_sbi_mpxy_mbox_call() for hart-local requests
Date: Thu, 10 Sep 2026 03:20:52 +0200
Message-Id: <20260910012057.106966-2-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910012057.106966-1-marouene.boubakri@oss.nxp.com>
References: <20260910012057.106966-1-marouene.boubakri@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR15CA0022.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::19) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|GV2PR04MB11739:EE_
X-MS-Office365-Filtering-Correlation-Id: ed65af90-6dcd-4daf-dc0b-08df0ed7d849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|23010399003|6133799003|18002099003|22082099003|56012099006|3023799007|10067099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	k+gg6N9QbFBqMr9DKBcdcJXWql0xvuIUIG2gtOpLRhHrUqXDz34a+FWj7NQMg5F5tiqTaNdPJbG0I1eYo4baruv0rs2RDsDSOJMRNwGDtIfdO963saYjx0a/ZcDA4jL3Qe8nPgX6BBoQSW3YxRTgcI7PiTiDYfOOTn4B0RbWSkPRiS+u7Oigo0GTj8WGK8XkfOqcX6ZgW9StCFvmLmGTsgMDRSFPdBHFH0aZpyTj6UyAcnoRbFmr9+brlDPRuxtnopd2zW/3z3YJdbpNPK+L2+hMh5o7HThCQ32ARPHacPisJpzquj9tu5Aumaftc/Q/+qiipdxY6qrQFPojx7qAcmFdTv1GgH/7AfkbDE85woql39wfq0EeT0QlkXbntVPMsWL26tEZp3IScV3aFuu0W/Fj3U6VpC4YlJXcS485VkmkIed6lPIkfB1k7XNVyNatCcqRVL3dKpZkuTipaqzolETw1MPIZsgYUn+oUYpJnU6N7fDp1SOxzV9S+/ta5Yh+yfP3gALfKS7b0oUVnAJhFVsAfp7djicvg4tOKj6Icz+w4MDhkf7iWeft7Tj2iCA93rVI7d7qTV6tvyoVnQjkphRsiuK0tGfe89QVVxZFSLN90o9dRH1YJ4yIyo1MgzNe52Tt2XKxImUcLMGf5/XCQ6BXjY64lnMVhF8TwIAjdLc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(3023799007)(10067099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CHV7EB1q4862tzyvNnFfp1t4eXOt7q9zTy0r1lgb8zCYAUXqupEwr56fVlR2?=
 =?us-ascii?Q?7IErbI3UlA5jHc2xvvIsW+MteQHyRIaym0Ly+5/nQp06o1+/fU2kjjDryRR2?=
 =?us-ascii?Q?jSnpVGklUAcfpC20rnpZnRbDRJxHl+PslvUPm99BVKTOQStn6M0B5eEAt2D+?=
 =?us-ascii?Q?Fs9KUVAKCVYS28UyXljoNl0i2g3gqDbahDNqT/7TM23W44gznSqkNDQFf6iU?=
 =?us-ascii?Q?N6Jc/Z90Jh7JBgpA2r2ZPATJgjRK7v93O6by7ZJbaLj+DjPWlGj8xjHoWjRD?=
 =?us-ascii?Q?MRVagOEzQ5oOBg+GwjjFh6XjWPOO7bQgysiuuUQzET1hNxmzacCJTXabHbu/?=
 =?us-ascii?Q?NlGDqrSxXafGbfgmoX58xHBVfLlDxvslPWjdXd+0zdNInMSeaeR0bAuy1qaX?=
 =?us-ascii?Q?yeT7ObcSjMruOVYn86DtAqOGp5mAXCMNxPbAGAO5NdZF2TKBtjcRrPU1jJK6?=
 =?us-ascii?Q?bU3xt8Wb4+zub7VvgwMQ9eXK/opF0Ebcdr9zC/imum+gcnp3/tK0/FeUxzId?=
 =?us-ascii?Q?GKBHiabI5i41wSQa5hVNSO2TAPqSMZds6vx5TrVT0tOngRVMSCBUBjVCf8s+?=
 =?us-ascii?Q?7kvQhBvlEyw8lzZdvCKDwAtHMN+u6biG+mIlBTkC3XLRLbqOm0DAGcw3UaR+?=
 =?us-ascii?Q?16okXErXG7djC2m5sEnzC3k41hkx3A0nGZxwX2TVkGctD6LcDutnOxFEqNKE?=
 =?us-ascii?Q?FIL7zPhc8kjvlpc3cmuSWfppKscrd3l32aib7nHoD34R2N4FhLw2GAswNutx?=
 =?us-ascii?Q?dygTrwWriZWfvZTmVlFzaBVvo3+rHdBf8KBWXmK7DgubSKCr8yrQcSeSui0X?=
 =?us-ascii?Q?sfIztcYNoR2kYnRmWYfB7yqK6H3BOBvw3AdlfkHQnY65SheaLet108nrUcjJ?=
 =?us-ascii?Q?fkCsjwKActiFJyaQF5abE4VbAjUQ1H+GDbaMt/79vbEe6rXdNOWXOaYaFukT?=
 =?us-ascii?Q?C6w/T8mGl+9gnf779hJbhBFpNB6B8/yW/TxG1WwxfWY0W7RFJctlW3q9OqZa?=
 =?us-ascii?Q?AHPrCwqI650iGgqO2xQIe1W44PR6XlOfoldqc4eewx24SJi5hfFsHa9dREeE?=
 =?us-ascii?Q?OEDaajb7yzWm6vESyMd8HZOQtKkC+cGG7H1EVb22t6Q3AVYO5MJJiVdyqn5Q?=
 =?us-ascii?Q?NOPhqiyCyX5wU31CHls7jpncUc123ifpk4+4i5+7zeHRqSMI+v1baVgUT132?=
 =?us-ascii?Q?kkZ/Mt8Jxc6RF0qaxGbzoSVh7mhbtIKkkHnTQwEfTM7HlcOYZklpoK0g7Q3p?=
 =?us-ascii?Q?pAvSZuwK0irSQ35nHcoxzgfUnEvaY/7PkzCQ8rii9s7Bsi1YC+NyU3StNlfM?=
 =?us-ascii?Q?qawaawSDvcfWJDNDcmfPJXC3DSffl2yri5Y5mpIBKBcDToVvqZwTigNOUJwt?=
 =?us-ascii?Q?ENMn4EmOGvMXNhUNfwP6qIRuQRLxe79ljz/mDTRZTdm2hpJrPa+yJ+FedoEm?=
 =?us-ascii?Q?pcPS8PemDIb+YP4zoGrMXZDl66ZU/uUBkAIbBQ2OiBWodSp5uUOc2U8Iv1OJ?=
 =?us-ascii?Q?06F2neFLiKvLQ2AKMB+M/eU82sjq3a3k8NTd7agd/sEVT2kb3avJH5LFncRj?=
 =?us-ascii?Q?Q8Gwl1XNBHwPnmpjNiiaiVC/oFe7KrmyVW1MjCuSL08JTyASU7AeK4LHHmyi?=
 =?us-ascii?Q?R9lh6oZr1fxYFXwjphp7q4qUkRyKRWItfL1FhP7acM/vUNwzyoeAGNdgZYAx?=
 =?us-ascii?Q?qftmilsORKSG1FNoTaEVbag0fLR4Fv337kv4Ypfydgk2bmVR7hzLDkskFehN?=
 =?us-ascii?Q?Hz0VCVoP0m8IN6blSVbkrQMAp/Gf2WBTKDDYYsOxbD9Dyl+rOdW/M3lBkuRA?=
X-MS-Exchange-AntiSpam-MessageData-1: MafBKdVg32DbsA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed65af90-6dcd-4daf-dc0b-08df0ed7d849
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 01:07:12.0406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqLADqi5UpEQm+XH3XEqlyNONCHwC7scjMEEh2e6+JbUdJ261uozFkLRv5PkblWzsAD0edDKS5l8LTsiqusSaDG4+IeqgXu+0SOpToijz4XIk6LAAGouBStMMSSCVCVo5dhcBKc469LQttqt6ymw2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11739

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

An SBI MPXY message send is not queued in a hardware mailbox: it is an
ecall executed on the calling hart with the calling hart's shared memory
which returns once the SBI implementation has processed the message.
For most RPMI service groups that means forwarding the message to a
platform microcontroller, which takes a bounded time. Some message
protocols are instead processed on the calling hart itself, for example
when the SBI implementation forwards the message to another supervisor
domain and switches the hart to it until it responds (this is the model
of the TEE service group of RPMI v2.0, where TEE_CALL runs the target
TEE on the hart of the caller). Such processing is unbounded and
depends on interrupts reaching the other domain so that it can yield.

Sending such messages through mbox_send_message() is not an option: the
mailbox core calls the controller send_data() callback from msg_submit()
with the channel spinlock held and interrupts disabled. Every hart would
then serialize on a single spinlock, spinning with interrupts disabled
for the whole duration of a message processed on another hart, while
the calling hart would run the other domain with the channel lock held.

Add riscv_sbi_mpxy_mbox_call() which performs the RPMI transfer directly
in the calling context, bypassing the mailbox core queue and channel
lock. The channel must still be requested through the mailbox core so
that its ownership is tracked. Local interrupts are disabled around the
ecall since the per-hart shared memory is also used from hard interrupt
context by mbox_send_message() users such as the RPMI system MSI
irqchip; calls from different harts proceed in parallel because each
hart has its own shared memory.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
---
 MAINTAINERS                                 |  1 +
 drivers/mailbox/riscv-sbi-mpxy-mbox.c       | 60 +++++++++++++++++++++
 include/linux/mailbox/riscv-sbi-mpxy-mbox.h | 23 ++++++++
 3 files changed, 84 insertions(+)
 create mode 100644 include/linux/mailbox/riscv-sbi-mpxy-mbox.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c392ded53..44860f991 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23581,6 +23581,7 @@ F:	drivers/clk/clk-rpmi.c
 F:	drivers/irqchip/irq-riscv-rpmi-sysmsi.c
 F:	drivers/mailbox/riscv-sbi-mpxy-mbox.c
 F:	include/linux/mailbox/riscv-rpmi-message.h
+F:	include/linux/mailbox/riscv-sbi-mpxy-mbox.h
 
 RISC-V SPACEMIT SoC Support
 M:	Yixun Lan <dlan@kernel.org>
diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index ea69c6b6b..2c80e6fd1 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -12,6 +12,7 @@
 #include <linux/irqchip/riscv-imsic.h>
 #include <linux/mailbox_controller.h>
 #include <linux/mailbox/riscv-rpmi-message.h>
+#include <linux/mailbox/riscv-sbi-mpxy-mbox.h>
 #include <linux/minmax.h>
 #include <linux/mm.h>
 #include <linux/module.h>
@@ -719,6 +720,65 @@ static const struct mbox_chan_ops mpxy_mbox_ops = {
 	.shutdown = mpxy_mbox_shutdown,
 };
 
+/**
+ * riscv_sbi_mpxy_mbox_call() - Send an RPMI message directly on an MPXY channel
+ * @chan: SBI MPXY mailbox channel owned by the caller
+ * @msg: RPMI message of type RPMI_MBOX_MSG_TYPE_SEND_WITH_RESPONSE or
+ *       RPMI_MBOX_MSG_TYPE_SEND_WITHOUT_RESPONSE
+ *
+ * An SBI MPXY message send is not queued anywhere: it is an ecall executed
+ * on the calling hart, using the calling hart's shared memory, which only
+ * returns once the SBI implementation has processed the message. For some
+ * message protocols that processing is unbounded because it runs on the
+ * calling hart itself, for example when the SBI implementation forwards
+ * the message to another supervisor domain and switches the hart to it
+ * until it responds (the RPMI TEE service group's TEE_CALL does this).
+ *
+ * Such messages must not go through mbox_send_message(): the mailbox core
+ * invokes the controller send_data() callback with the channel spinlock
+ * held and interrupts disabled, which would serialize all harts on a single
+ * lock and keep interrupts disabled on the calling hart for the whole
+ * duration of the call.
+ *
+ * This helper bypasses the mailbox core queue and channel lock and performs
+ * the transfer directly in the calling context. Only local interrupts are
+ * disabled around the ecall, because the per-hart shared memory can be used
+ * from hard interrupt context through mbox_send_message() by other clients.
+ * Calls from different harts run concurrently since each hart has its own
+ * shared memory.
+ *
+ * The caller must own @chan through mbox_request_channel() (or a variant of
+ * it) so that no other client can use the channel, and must not use
+ * mbox_send_message() on it concurrently.
+ *
+ * Return: 0 on success or a negative error code.
+ */
+int riscv_sbi_mpxy_mbox_call(struct mbox_chan *chan,
+			     struct rpmi_mbox_message *msg)
+{
+	struct mpxy_mbox_channel *mchan;
+	unsigned long flags;
+
+	if (!chan || !chan->cl || !chan->mbox || !msg)
+		return -EINVAL;
+	if (chan->mbox->ops != &mpxy_mbox_ops)
+		return -EINVAL;
+	if (msg->type != RPMI_MBOX_MSG_TYPE_SEND_WITH_RESPONSE &&
+	    msg->type != RPMI_MBOX_MSG_TYPE_SEND_WITHOUT_RESPONSE)
+		return -EINVAL;
+
+	mchan = chan->con_priv;
+	if (mchan->attrs.msg_proto_id != SBI_MPXY_MSGPROTO_RPMI_ID)
+		return -EOPNOTSUPP;
+
+	local_irq_save(flags);
+	mpxy_mbox_send_rpmi_data(mchan, msg);
+	local_irq_restore(flags);
+
+	return msg->error;
+}
+EXPORT_SYMBOL_GPL(riscv_sbi_mpxy_mbox_call);
+
 /* ====== MPXY platform driver ===== */
 
 static void mpxy_mbox_msi_write(struct msi_desc *desc, struct msi_msg *msg)
diff --git a/include/linux/mailbox/riscv-sbi-mpxy-mbox.h b/include/linux/mailbox/riscv-sbi-mpxy-mbox.h
new file mode 100644
index 000000000..4fb7b04cd
--- /dev/null
+++ b/include/linux/mailbox/riscv-sbi-mpxy-mbox.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright 2026 NXP */
+
+#ifndef _LINUX_RISCV_SBI_MPXY_MBOX_H_
+#define _LINUX_RISCV_SBI_MPXY_MBOX_H_
+
+#include <linux/errno.h>
+
+struct mbox_chan;
+struct rpmi_mbox_message;
+
+#if IS_ENABLED(CONFIG_RISCV_SBI_MPXY_MBOX)
+int riscv_sbi_mpxy_mbox_call(struct mbox_chan *chan,
+			     struct rpmi_mbox_message *msg);
+#else
+static inline int riscv_sbi_mpxy_mbox_call(struct mbox_chan *chan,
+					   struct rpmi_mbox_message *msg)
+{
+	return -ENODEV;
+}
+#endif
+
+#endif /* _LINUX_RISCV_SBI_MPXY_MBOX_H_ */
-- 
2.43.0

