Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C04B2F5337
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787890123; cv=fail; b=Vhsz0HT864GsCB4tX7KAdJHR3KvBd4N684uCp84H3SvH2BaAelvc6sInDvg3DwUuALcwJPfDs1/3AoK4I3FbRVVvQibS9MsLiruDsXdDT4dIceLwSq6aFeyx86HWlE1BtD3WXs0SkzDLV57MqSIGRBJ6zPl/JrqUHyrk87ClVg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787890123; c=relaxed/simple;
	bh=O/8G/+VInTDuiBivXWYqyQGRbW1bPakD0ZldW3dkiZE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=tW0MCw5jsHeXcpKjUmFPHpVsb6oYMj9SVAQzr07D9iEPP7Vu63ch5ejvU4qNAoGD6K2etxVfIXJxoCGXE+4VlxIclTEjdSJj2x1OkA264PHl+s1m3L/UZBHlzZaKSMp2CryK1Ix5GjBS12JdyVyGlV12TM67zUpY3JHdsl8Hhb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W5SSclAH; arc=fail smtp.client-ip=52.101.61.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W5SSclAH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2ZvBbU3Ou6x56OhvvvvkIe2EZfoPwLtb5T2/JANg359vetVH97hUCONAm2ZN4/b4Xf+o/7On27qj1astZhP3MW1wTEIWy+ayrIwRmHwHD57l+EmtZrSjau/1T/H1yhO5d2DfUB8H5sNGiumukDV3gaWRC1bKOv3IKTVUMMkMq74p4Og6GhGG6d2lIi2kgkTQSVCr8+8bkAUPDLHAd0u0z61ZevMroWFTbgASdpV3trDJbtUIOssY97BLFKXU2jGv2AFJxSAnoRq/iuCIm6uvvx13aoMozF+5p/rAtTybWlstAVS8aAu+9dLNc0SDifCXkaKtA3bK7S+MQxNkC+2Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoDQuZ1b2TPlK6SMGeCmJvd7Mwy4sAAKTysqv6njKo4=;
 b=IBaW5kco13za/QcXzqSNzQ0aR8ohauP4MRWithiifMF/uu064lQ366x7JxN871yeHoKUx5cn/oTQ9BuloKRmQyXMLlF4ot8QTs3R4bnJfloxCsCb4X+2ZjApInnh98rn3HCFjfFQsLAEMwtXhj158hkbm+Gr6IlJaG5H3SxtTzKNbqXQHmZGPIERCfYZimKGmfWOtbgYoib/TojQf/QhVxPiy0y4RewuzS0ZZJ5sniKacVKsl2tVj9d+n11wta4TsaGZ+RhQfZpMqJkkFP0aF32La7mtYlQzlRFKsa2paDGx64BPaReB37c+JvUJrPTjPR1kljuvm7q1ON94syDYfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoDQuZ1b2TPlK6SMGeCmJvd7Mwy4sAAKTysqv6njKo4=;
 b=W5SSclAH3HqXOFQCyrroViv6pTEOuH3k7f++McLZ1GiPvqpG/pwFweDUaF2gbVApesD+ehxeZpwnzLe2ygljzHTPVPA4CYiDc2/YYDi9vPi95kaen0eelLImhv4YqYqu0rg0O0jX7iTreVhqGjPgE7SogL3FGSreD1sJPntNIHPVu3nwQNmyi1k/ghJOm2eVDf0ZTbeL2FAyrk1TzRe2p9/hNcG00DGMwRIxRf5aorm5OxJKfsgQDH0cFbpkbDKCCqcfKW3s/bu/Zm2h3QxfSb7MxzsWcQ+Fd19NzO4Bjr6ZyYFrPQGPjEsEoLGuI/NkMCHPMziBIvquY8Ph+tZu8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PR12MB9670.namprd12.prod.outlook.com (2603:10b6:610:2af::6)
 by LV1PR12MB999330.namprd12.prod.outlook.com (2603:10b6:408:3f8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 04:08:37 +0000
Received: from CH1PR12MB9670.namprd12.prod.outlook.com
 ([fe80::416:ea1f:d17b:2811]) by CH1PR12MB9670.namprd12.prod.outlook.com
 ([fe80::416:ea1f:d17b:2811%6]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 04:08:36 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Balbir Singh <balbirs@nvidia.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>
Subject: [PATCH v2] mm/migrate_device: add class-based migration trace events
Date: Fri, 28 Aug 2026 14:08:17 +1000
Message-ID: <20260828040817.1504092-1-balbirs@nvidia.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ME0P282CA0026.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:211::28) To CH1PR12MB9670.namprd12.prod.outlook.com
 (2603:10b6:610:2af::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PR12MB9670:EE_|LV1PR12MB999330:EE_
X-MS-Office365-Filtering-Correlation-Id: 42a4039b-27a6-411a-985c-08df04ba089d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|10070799003|23010399003|7416014|366016|6133799003|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	YgdId5w4kBtkp1J6l6oMRQtoor7qiIqlSbZH260+2y0YpwnJt+JMdX7MSRvzmv3hbWAd4mPKamvJ5IzlkVR5NilniXze2T+d9YONihvW3sH6xY/iC5H/FFveOguvRmbAsu9UbNZQ3UIVdKORiRyqY2XlhKxstAIvwyxa/LfuplKxwY9TeQrTpF823yshAVwxn8lQDO9Z3iPhoJZA9nSTdqJ1HMEurJHSOCGZBrUq3nLAiUuMK7MUM0LzGyIpegQjqKV0qjQ7fClKR94v9H2U2i/+6d4OJ2SuxCTJveSC6poJYOfj1Ar0Wc82y+4uGITV/iutViBA0/Jmt8xnOVE8tOfbNJYMwrnhFs0/A4lszjHlPT2dJje1nUCeY+XMi9axqTkfYO06gutzpC7JFzy/aACVufnw49anJmsfv7Jizv3PwJ00m2IQkusJZjxgOYAGdFKLQMRa8bFM6BofOxFX1wSBZZNE96HU61JQAM2a5C+aV6b5ftyxxm7v9WWVL/73qkT9YiFkcGmwDjAauMDHQ7WhLrPEizD4FdZZKf0Jgjt1+XKy8TKvgA3JgPUMNvrBbCKViD3bVb5ML/DqyXj0aI/e9i51N1B3TTOI9AoK5HkKgt1naG1UgAWrBaTFjcoFBYSwb0OADQjO4C0NaatQcU4aJKo+mZn4Lv2Cfj2sYlg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PR12MB9670.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(23010399003)(7416014)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RkrNpJ9oD22lupD6QgwRSD54fSjH+iH6QECygmKwUJIOpzN+5QYwWbRu08YY?=
 =?us-ascii?Q?LJDHYC3Pb5/0ldjggVYqG+eQNKUoD3Wir3s2Apu84yVoDEAZGn5ZnCYFbDB7?=
 =?us-ascii?Q?6flCX54jnJS6etMVQauYnhfG9x7FAUHLkKOJApuVu9Sn6Dg8/zklM9F3JKYr?=
 =?us-ascii?Q?3S9ZWI+U5vQs3NgRhbp7nHGvMygQXWxXbh8TW0mPZAdO8o8wRtc6zmdZoM5W?=
 =?us-ascii?Q?dPcPuiMLs90bc6qHWt8nVcZkab0O7sNV1v5tAa8BcO3lG5f9+NaBFI9d2UkK?=
 =?us-ascii?Q?D7Mkg9Ih0TntkLYUC9t/pHd9NEQFrOioFQKbndECMyqYsPBI9tNjd8zU/WEn?=
 =?us-ascii?Q?rZEK/ndX/yMaPaxZzqi+l1kywhaZRDynoAztQcQyMe044O6Iy27ob/Xc+4vt?=
 =?us-ascii?Q?zDc9MMTL5zebgJj1XtVd6UCCiSvyp9CEqtZFt5ufCMuUr+ePBllpPcjSII3M?=
 =?us-ascii?Q?rZA2dkl8wEyibWVqrAVRLJgP7jH33RUv/RA8W3cVsjMbIO3c5Vpm8i4SsKg6?=
 =?us-ascii?Q?PgvpWMOlhnVMZ0iCEJ2ijp42KKKzCCOsHi/8+QDWTyPHMvjwsHJre7Nm1NFF?=
 =?us-ascii?Q?SEvH7EP0VU6pCBbVtbuM3z8ZxnpujD+fU+K/pOCdcLIfajhamZZtqZN7DKp+?=
 =?us-ascii?Q?+48fIs/xK4QM/A5gr19Hw2GWmBVz/GmbXi+L1YfAPP2TKzRX0yk3VvD7ZSA1?=
 =?us-ascii?Q?cNgWVhGqNXYjeYRO0osGG41zC6O0pNimBbo3qr2HOqVeEC4rYC46LaIs7pvg?=
 =?us-ascii?Q?Zh5lYF43y7nDqXai2eL7SOrtmdDl02+2arjaC2MwGsnYIzBjdhA+1Qmy96f2?=
 =?us-ascii?Q?fuNd/fvLoXxdM7un+rvwOa3UIwYmXFkRB4wPxtfxYWYQXqCQuHYxmSztLjUh?=
 =?us-ascii?Q?M+rKbporCvcg0CgyXHdC45cbatzq+Rpaf+2m+zASQRZAtn89EvXKZTKWfE7q?=
 =?us-ascii?Q?8dlgDsM6InRVXBwu0bHxZ1uVLGAfcpTowjMg0wxQdCjn69kHWaLmZEvxbmCy?=
 =?us-ascii?Q?dPTcQ6cogZ3V5/QBd5QLAsrsr9sPukf2ZQWfdV2UxLOmGV5jaNXkAUt32xD7?=
 =?us-ascii?Q?yp8G6BbfD9tDmJm+Aj9e0/qqsFfToftCO7p3DqRjYwOOn65AsOnAcgFSKMuA?=
 =?us-ascii?Q?4apntrDrV0zkhKZXyn+EeixKdZyRcHwUKcTc4d3RzN/pWqeWJvx2IM5XzcZ1?=
 =?us-ascii?Q?ZnSdFLJSFsjRGsRNEddIX2sXGKGv33xlHZgR31VUdpKF/pnyGswI8InDkbyW?=
 =?us-ascii?Q?A5linYPA0PA7xdwkqh/wusVmgc+69feGXNEeAoHFA7pDTRGtHnfv8VvlgLJF?=
 =?us-ascii?Q?/zaR9LQKwjlWmVdtMugN/a3jkWZ8KYgGqYKFyNqYPEY0g++Y71CuthFEIO1n?=
 =?us-ascii?Q?mptIFMnUUZmai2NR3GRwojB8raNpsFiZT7wLPfltWFKnVhmXMbmrtiKJPlr8?=
 =?us-ascii?Q?L3fXN5CT+FIqmnSwzBnMpFP6P1U4WsUv+sZWJjmCVkcHOZX9V9V24ZIUrTMW?=
 =?us-ascii?Q?61CkaH3u4VkbT05Xo7du+mnpxYefgrlNNHDdvKW25z2WR1jqxsCa5PlQ/gdJ?=
 =?us-ascii?Q?3NxYO/OZlabotX0u/VEquoV1h5tzF4yE/insbiHpNli6jTq1TLw2Uy6sV2DK?=
 =?us-ascii?Q?GXgQt0uWImcEmHuW1FXtoXRCCHbtC3xbPiiahGfdRljV7869KcDq47tlGYHl?=
 =?us-ascii?Q?1RqqFyKckkPUOd7uRc/Tl64vIC7LLxq7Y8DjYLzuM3ElD/nsKuwiLSmbleUc?=
 =?us-ascii?Q?8v3GAJXOb4Hamrb1u2aRM82psrK2Fc4kTcaJbL28INNz6xPamLvMKg8wuMuB?=
X-MS-Exchange-AntiSpam-MessageData-1: 5t8u9RrmrigeMg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a4039b-27a6-411a-985c-08df04ba089d
X-MS-Exchange-CrossTenant-AuthSource: CH1PR12MB9670.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 04:08:36.6690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WbuowmCVOOey2ifaIS6CvZaiSZ3/FvyWJlRI6kj72Xw+8j6LL68d539Fr0NDPSxf668Kta8+gGifdgOCX5ZvYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB999330

Device-private migrations currently require ad-hoc instrumentation to
understand selection, unmap, copy, and finalization behavior.

Add reusable ftrace event classes for migrate_vma ranges, device
batches, and individual folios. Emit start, done traces with
ranges, flags, page counts, success/failure summaries, PFNs,
and migrate flags.

Enabling all traces can make the migration traces verbose, when used
they can also help debug issues with device migration.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Assisted-by: Codex:gpt-5.6-sol
Link: https://lore.kernel.org/linux-mm/20251110161954.47d88433@gandalf.local.home/

Cc: Steven Rostedt <rostedt@goodmis.org>
CC: Masami Hiramatsu <mhiramat@kernel.org>
CC: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: David Hildenbrand <david@kernel.org>
CC: Zi Yan <ziy@nvidia.com>
CC: Matthew Brost <matthew.brost@intel.com>
CC: Joshua Hahn <joshua.hahnjy@gmail.com>
CC: Rakie Kim <rakie.kim@sk.com>
CC: Byungchul Park <byungchul@sk.com>
CC: Gregory Price <gourry@gourry.net>
CC: Ying Huang <ying.huang@linux.alibaba.com>
CC: Alistair Popple <apopple@nvidia.com>
---
 include/trace/events/migrate_device.h | 324 ++++++++++++++++++++++++++
 mm/migrate_device.c                   |  79 ++++++-
 2 files changed, 391 insertions(+), 12 deletions(-)
 create mode 100644 include/trace/events/migrate_device.h

diff --git a/include/trace/events/migrate_device.h b/include/trace/events/migrate_device.h
new file mode 100644
index 000000000000..46582c919dc2
--- /dev/null
+++ b/include/trace/events/migrate_device.h
@@ -0,0 +1,324 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM migrate_device
+
+#if !defined(_TRACE_MIGRATE_DEVICE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_MIGRATE_DEVICE_H
+
+#include <linux/migrate.h>
+#include <linux/tracepoint.h>
+
+/*
+ * Define enums for tracing information.
+ */
+#ifndef __MIGRATE_DEVICE_DECLARE_TRACE_ENUMS_ONCE_ONLY
+#define __MIGRATE_DEVICE_DECLARE_TRACE_ENUMS_ONCE_ONLY
+
+/*
+ * Why a page table walk callback classified the range the way it did.
+ * Several call sites collect the same kind of range, so the reason is
+ * what distinguishes them in a trace.
+ */
+enum migrate_vma_walk_reason {
+	MIGRATE_VMA_WALK_HOLE,
+	MIGRATE_VMA_WALK_HOLE_COMPOUND,
+	MIGRATE_VMA_WALK_HUGE_PMD,
+	MIGRATE_VMA_WALK_SKIP_NOT_ANON,
+	MIGRATE_VMA_WALK_SKIP_NOT_SELECTED,
+	MIGRATE_VMA_WALK_SKIP_OWNER_MISMATCH,
+	MIGRATE_VMA_WALK_SKIP_LOCK_CONTENDED,
+	MIGRATE_VMA_WALK_SKIP_COMPOUND_TAIL,
+	MIGRATE_VMA_WALK_SKIP_SPLIT_FAILED,
+};
+
+#endif /* __MIGRATE_DEVICE_DECLARE_TRACE_ENUMS_ONCE_ONLY */
+
+TRACE_DEFINE_ENUM(MIGRATE_VMA_SELECT_SYSTEM);
+TRACE_DEFINE_ENUM(MIGRATE_VMA_SELECT_DEVICE_PRIVATE);
+TRACE_DEFINE_ENUM(MIGRATE_VMA_SELECT_DEVICE_COHERENT);
+TRACE_DEFINE_ENUM(MIGRATE_VMA_SELECT_COMPOUND);
+
+TRACE_DEFINE_ENUM(MIGRATE_VMA_WALK_HOLE);
+TRACE_DEFINE_ENUM(MIGRATE_VMA_WALK_HOLE_COMPOUND);
+TRACE_DEFINE_ENUM(MIGRATE_VMA_WALK_HUGE_PMD);
+TRACE_DEFINE_ENUM(MIGRATE_VMA_WALK_SKIP_NOT_ANON);
+TRACE_DEFINE_ENUM(MIGRATE_VMA_WALK_SKIP_NOT_SELECTED);
+TRACE_DEFINE_ENUM(MIGRATE_VMA_WALK_SKIP_OWNER_MISMATCH);
+TRACE_DEFINE_ENUM(MIGRATE_VMA_WALK_SKIP_LOCK_CONTENDED);
+TRACE_DEFINE_ENUM(MIGRATE_VMA_WALK_SKIP_COMPOUND_TAIL);
+TRACE_DEFINE_ENUM(MIGRATE_VMA_WALK_SKIP_SPLIT_FAILED);
+
+#define show_walk_reason(reason)					\
+	__print_symbolic(reason,					\
+		{ MIGRATE_VMA_WALK_HOLE,		"HOLE" },	\
+		{ MIGRATE_VMA_WALK_HOLE_COMPOUND,	"HOLE_COMPOUND" }, \
+		{ MIGRATE_VMA_WALK_HUGE_PMD,		"HUGE_PMD" },	\
+		{ MIGRATE_VMA_WALK_SKIP_NOT_ANON,	"NOT_ANON" },	\
+		{ MIGRATE_VMA_WALK_SKIP_NOT_SELECTED,	"NOT_SELECTED" }, \
+		{ MIGRATE_VMA_WALK_SKIP_OWNER_MISMATCH,	"OWNER_MISMATCH" }, \
+		{ MIGRATE_VMA_WALK_SKIP_LOCK_CONTENDED,	"LOCK_CONTENDED" }, \
+		{ MIGRATE_VMA_WALK_SKIP_COMPOUND_TAIL,	"COMPOUND_TAIL" }, \
+		{ MIGRATE_VMA_WALK_SKIP_SPLIT_FAILED,	"SPLIT_FAILED" })
+
+#define show_migrate_vma_flags(flags)					\
+	__print_flags(flags, "|",					\
+		{ MIGRATE_VMA_SELECT_SYSTEM,		"SYSTEM" },	\
+		{ MIGRATE_VMA_SELECT_DEVICE_PRIVATE,	"DEVICE_PRIVATE" }, \
+		{ MIGRATE_VMA_SELECT_DEVICE_COHERENT,	"DEVICE_COHERENT" }, \
+		{ MIGRATE_VMA_SELECT_COMPOUND,		"COMPOUND" })
+
+DECLARE_EVENT_CLASS(migrate_vma_range_class,
+
+	TP_PROTO(const struct migrate_vma *migrate),
+
+	TP_ARGS(migrate),
+
+	TP_STRUCT__entry(
+		__field(void *, vma)
+		__field(void *, mm)
+		__field(void *, src)
+		__field(void *, dst)
+		__field(void *, pgmap_owner)
+		__field(void *, fault_page)
+		__field(unsigned long, start)
+		__field(unsigned long, end)
+		__field(unsigned long, npages)
+		__field(unsigned long, cpages)
+		__field(unsigned long, flags)
+	),
+
+	TP_fast_assign(
+		__entry->vma = migrate->vma;
+		__entry->mm = migrate->vma ? migrate->vma->vm_mm : NULL;
+		__entry->src = migrate->src;
+		__entry->dst = migrate->dst;
+		__entry->pgmap_owner = migrate->pgmap_owner;
+		__entry->fault_page = migrate->fault_page;
+		__entry->start = migrate->start;
+		__entry->end = migrate->end;
+		__entry->npages = migrate->npages;
+		__entry->cpages = migrate->cpages;
+		__entry->flags = migrate->flags;
+	),
+
+	TP_printk("mm=%p vma=%p range=%#lx-%#lx bytes=%lu npages=%lu cpages=%lu flags=%s src=%p dst=%p owner=%p fault_page=%p",
+		__entry->mm, __entry->vma, __entry->start, __entry->end,
+		__entry->end - __entry->start, __entry->npages,
+		__entry->cpages,
+		show_migrate_vma_flags(__entry->flags),
+		__entry->src, __entry->dst, __entry->pgmap_owner,
+		__entry->fault_page)
+);
+
+DEFINE_EVENT(migrate_vma_range_class, migrate_vma_setup_start,
+	TP_PROTO(const struct migrate_vma *migrate),
+	TP_ARGS(migrate));
+
+DEFINE_EVENT(migrate_vma_range_class, migrate_vma_setup_done,
+	TP_PROTO(const struct migrate_vma *migrate),
+	TP_ARGS(migrate));
+
+DEFINE_EVENT(migrate_vma_range_class, migrate_vma_collect_start,
+	TP_PROTO(const struct migrate_vma *migrate),
+	TP_ARGS(migrate));
+
+DEFINE_EVENT(migrate_vma_range_class, migrate_vma_collect_done,
+	TP_PROTO(const struct migrate_vma *migrate),
+	TP_ARGS(migrate));
+
+DEFINE_EVENT(migrate_vma_range_class, migrate_vma_pages_start,
+	TP_PROTO(const struct migrate_vma *migrate),
+	TP_ARGS(migrate));
+
+DEFINE_EVENT(migrate_vma_range_class, migrate_vma_pages_done,
+	TP_PROTO(const struct migrate_vma *migrate),
+	TP_ARGS(migrate));
+
+DEFINE_EVENT(migrate_vma_range_class, migrate_vma_finalize_start,
+	TP_PROTO(const struct migrate_vma *migrate),
+	TP_ARGS(migrate));
+
+DEFINE_EVENT(migrate_vma_range_class, migrate_vma_finalize_done,
+	TP_PROTO(const struct migrate_vma *migrate),
+	TP_ARGS(migrate));
+
+/*
+ * Page table walk callbacks act on a sub-range of the migration and can be
+ * reached from several call sites, so they report the range they were handed
+ * and why, in addition to the migrate-wide state.
+ */
+DECLARE_EVENT_CLASS(migrate_vma_walk_class,
+
+	TP_PROTO(const struct migrate_vma *migrate, unsigned long start,
+		 unsigned long end, enum migrate_vma_walk_reason reason),
+
+	TP_ARGS(migrate, start, end, reason),
+
+	TP_STRUCT__entry(
+		__field(void *, vma)
+		__field(void *, mm)
+		__field(void *, src)
+		__field(void *, dst)
+		__field(void *, pgmap_owner)
+		__field(void *, fault_page)
+		__field(unsigned long, walk_start)
+		__field(unsigned long, walk_end)
+		__field(unsigned long, start)
+		__field(unsigned long, end)
+		__field(unsigned long, npages)
+		__field(unsigned long, cpages)
+		__field(unsigned long, flags)
+		__field(unsigned int, reason)
+	),
+
+	TP_fast_assign(
+		__entry->vma = migrate->vma;
+		__entry->mm = migrate->vma ? migrate->vma->vm_mm : NULL;
+		__entry->src = migrate->src;
+		__entry->dst = migrate->dst;
+		__entry->pgmap_owner = migrate->pgmap_owner;
+		__entry->fault_page = migrate->fault_page;
+		__entry->walk_start = start;
+		__entry->walk_end = end;
+		__entry->start = migrate->start;
+		__entry->end = migrate->end;
+		__entry->npages = migrate->npages;
+		__entry->cpages = migrate->cpages;
+		__entry->flags = migrate->flags;
+		__entry->reason = reason;
+	),
+
+	TP_printk("mm=%p vma=%p walk=%#lx-%#lx bytes=%lu reason=%s range=%#lx-%#lx npages=%lu cpages=%lu flags=%s src=%p dst=%p owner=%p fault_page=%p",
+		__entry->mm, __entry->vma,
+		__entry->walk_start, __entry->walk_end,
+		__entry->walk_end - __entry->walk_start,
+		show_walk_reason(__entry->reason),
+		__entry->start, __entry->end, __entry->npages,
+		__entry->cpages,
+		show_migrate_vma_flags(__entry->flags),
+		__entry->src, __entry->dst, __entry->pgmap_owner,
+		__entry->fault_page)
+);
+
+DEFINE_EVENT(migrate_vma_walk_class, migrate_vma_collect_skip,
+	TP_PROTO(const struct migrate_vma *migrate, unsigned long start,
+		 unsigned long end, enum migrate_vma_walk_reason reason),
+	TP_ARGS(migrate, start, end, reason));
+
+DEFINE_EVENT(migrate_vma_walk_class, migrate_vma_collect_hole,
+	TP_PROTO(const struct migrate_vma *migrate, unsigned long start,
+		 unsigned long end, enum migrate_vma_walk_reason reason),
+	TP_ARGS(migrate, start, end, reason));
+
+DEFINE_EVENT(migrate_vma_walk_class, migrate_vma_collect_huge_pmd,
+	TP_PROTO(const struct migrate_vma *migrate, unsigned long start,
+		 unsigned long end, enum migrate_vma_walk_reason reason),
+	TP_ARGS(migrate, start, end, reason));
+
+DECLARE_EVENT_CLASS(migrate_device_batch_class,
+
+	TP_PROTO(const unsigned long *src, const unsigned long *dst,
+		 unsigned long npages),
+
+	TP_ARGS(src, dst, npages),
+
+	TP_STRUCT__entry(
+		__field(void *, src)
+		__field(void *, dst)
+		__field(unsigned long, src_head)
+		__field(unsigned long, dst_head)
+		__field(unsigned long, npages)
+	),
+
+	TP_fast_assign(
+		__entry->src = (void *)src;
+		__entry->dst = (void *)dst;
+		__entry->src_head = npages && src ? src[0] : 0;
+		__entry->dst_head = npages && dst ? dst[0] : 0;
+		__entry->npages = npages;
+	),
+
+	TP_printk("src=%p dst=%p npages=%lu src_head=%#lx dst_head=%#lx",
+		__entry->src, __entry->dst, __entry->npages,
+		__entry->src_head, __entry->dst_head)
+);
+
+DEFINE_EVENT(migrate_device_batch_class, migrate_device_unmap_done,
+	TP_PROTO(const unsigned long *src, const unsigned long *dst,
+		 unsigned long npages),
+	TP_ARGS(src, dst, npages));
+
+DEFINE_EVENT(migrate_device_batch_class, migrate_device_pages_start,
+	TP_PROTO(const unsigned long *src, const unsigned long *dst,
+		 unsigned long npages),
+	TP_ARGS(src, dst, npages));
+
+DEFINE_EVENT(migrate_device_batch_class, migrate_device_pages_done,
+	TP_PROTO(const unsigned long *src, const unsigned long *dst,
+		 unsigned long npages),
+	TP_ARGS(src, dst, npages));
+
+DEFINE_EVENT(migrate_device_batch_class, migrate_device_finalize_start,
+	TP_PROTO(const unsigned long *src, const unsigned long *dst,
+		 unsigned long npages),
+	TP_ARGS(src, dst, npages));
+
+DEFINE_EVENT(migrate_device_batch_class, migrate_device_finalize_done,
+	TP_PROTO(const unsigned long *src, const unsigned long *dst,
+		 unsigned long npages),
+	TP_ARGS(src, dst, npages));
+
+DECLARE_EVENT_CLASS(migrate_device_folio_class,
+
+	TP_PROTO(unsigned long index, unsigned long nr_pages,
+		 unsigned long src, unsigned long dst),
+
+	TP_ARGS(index, nr_pages, src, dst),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, index)
+		__field(unsigned long, nr_pages)
+		__field(unsigned long, src)
+		__field(unsigned long, dst)
+		__field(unsigned long, src_pfn)
+		__field(unsigned long, dst_pfn)
+	),
+
+	TP_fast_assign(
+		__entry->index = index;
+		__entry->nr_pages = nr_pages;
+		__entry->src = src;
+		__entry->dst = dst;
+		__entry->src_pfn = src >> MIGRATE_PFN_SHIFT;
+		__entry->dst_pfn = dst >> MIGRATE_PFN_SHIFT;
+	),
+
+	TP_printk("index=%lu nr_pages=%lu src=%#lx src_pfn=%#lx src_flags=%s dst=%#lx dst_pfn=%#lx dst_flags=%s",
+		__entry->index, __entry->nr_pages, __entry->src,
+		__entry->src_pfn,
+		__print_flags(__entry->src & ((1UL << MIGRATE_PFN_SHIFT) - 1),
+			"|",
+			{ MIGRATE_PFN_VALID, "VALID" },
+			{ MIGRATE_PFN_MIGRATE, "MIGRATE" },
+			{ MIGRATE_PFN_WRITE, "WRITE" },
+			{ MIGRATE_PFN_COMPOUND, "COMPOUND" }),
+		__entry->dst, __entry->dst_pfn,
+		__print_flags(__entry->dst & ((1UL << MIGRATE_PFN_SHIFT) - 1),
+			"|",
+			{ MIGRATE_PFN_VALID, "VALID" },
+			{ MIGRATE_PFN_MIGRATE, "MIGRATE" },
+			{ MIGRATE_PFN_WRITE, "WRITE" },
+			{ MIGRATE_PFN_COMPOUND, "COMPOUND" }))
+);
+
+DEFINE_EVENT(migrate_device_folio_class, migrate_device_folio_finalize,
+	TP_PROTO(unsigned long index, unsigned long nr_pages,
+		 unsigned long src, unsigned long dst),
+	TP_ARGS(index, nr_pages, src, dst));
+
+#endif /* _TRACE_MIGRATE_DEVICE_H */
+
+#include <trace/define_trace.h>
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 009bfa8b212d..cf2a78d2e18e 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -16,11 +16,16 @@
 #include <linux/leafops.h>
 #include <linux/pgalloc.h>
 #include <asm/tlbflush.h>
+
+#define CREATE_TRACE_POINTS
+#include <trace/events/migrate_device.h>
+
 #include "internal.h"
 
 static int migrate_vma_collect_skip(unsigned long start,
 				    unsigned long end,
-				    struct mm_walk *walk)
+				    struct mm_walk *walk,
+				    enum migrate_vma_walk_reason reason)
 {
 	struct migrate_vma *migrate = walk->private;
 	unsigned long addr;
@@ -30,6 +35,7 @@ static int migrate_vma_collect_skip(unsigned long start,
 		migrate->src[migrate->npages++] = 0;
 	}
 
+	trace_migrate_vma_collect_skip(migrate, start, end, reason);
 	return 0;
 }
 
@@ -43,7 +49,8 @@ static int migrate_vma_collect_hole(unsigned long start,
 
 	/* Only allow populating anonymous memory. */
 	if (!vma_is_anonymous(walk->vma))
-		return migrate_vma_collect_skip(start, end, walk);
+		return migrate_vma_collect_skip(start, end, walk,
+						MIGRATE_VMA_WALK_SKIP_NOT_ANON);
 
 	if (thp_migration_supported() &&
 		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
@@ -55,11 +62,15 @@ static int migrate_vma_collect_hole(unsigned long start,
 		migrate->npages++;
 		migrate->cpages++;
 
+		trace_migrate_vma_collect_hole(migrate, start, end,
+					       MIGRATE_VMA_WALK_HOLE_COMPOUND);
+
 		/*
 		 * Collect the remaining entries as holes, in case we
 		 * need to split later
 		 */
-		return migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
+		return migrate_vma_collect_skip(start + PAGE_SIZE, end, walk,
+						MIGRATE_VMA_WALK_SKIP_COMPOUND_TAIL);
 	}
 
 	for (addr = start; addr < end; addr += PAGE_SIZE) {
@@ -69,6 +80,8 @@ static int migrate_vma_collect_hole(unsigned long start,
 		migrate->cpages++;
 	}
 
+	trace_migrate_vma_collect_hole(migrate, start, end,
+				       MIGRATE_VMA_WALK_HOLE);
 	return 0;
 }
 
@@ -154,7 +167,8 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
 	if (pmd_trans_huge(*pmdp)) {
 		if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
 			spin_unlock(ptl);
-			return migrate_vma_collect_skip(start, end, walk);
+			return migrate_vma_collect_skip(start, end, walk,
+					MIGRATE_VMA_WALK_SKIP_NOT_SELECTED);
 		}
 
 		folio = pmd_folio(*pmdp);
@@ -170,13 +184,15 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
 		if (!softleaf_is_device_private(entry) ||
 		    !(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_PRIVATE)) {
 			spin_unlock(ptl);
-			return migrate_vma_collect_skip(start, end, walk);
+			return migrate_vma_collect_skip(start, end, walk,
+					MIGRATE_VMA_WALK_SKIP_NOT_SELECTED);
 		}
 
 		folio = softleaf_to_folio(entry);
 		if (folio->pgmap->owner != migrate->pgmap_owner) {
 			spin_unlock(ptl);
-			return migrate_vma_collect_skip(start, end, walk);
+			return migrate_vma_collect_skip(start, end, walk,
+					MIGRATE_VMA_WALK_SKIP_OWNER_MISMATCH);
 		}
 
 		if (softleaf_is_device_private_write(entry))
@@ -190,7 +206,8 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
 	if (folio != fault_folio && unlikely(!folio_trylock(folio))) {
 		spin_unlock(ptl);
 		folio_put(folio);
-		return migrate_vma_collect_skip(start, end, walk);
+		return migrate_vma_collect_skip(start, end, walk,
+					MIGRATE_VMA_WALK_SKIP_LOCK_CONTENDED);
 	}
 
 	if (thp_migration_supported() &&
@@ -220,8 +237,12 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
 			migrate->dst[migrate->npages] = 0;
 			goto fallback;
 		}
-		migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
+		migrate_vma_collect_skip(start + PAGE_SIZE, end, walk,
+					 MIGRATE_VMA_WALK_SKIP_COMPOUND_TAIL);
 		spin_unlock(ptl);
+
+		trace_migrate_vma_collect_huge_pmd(migrate, start, end,
+						   MIGRATE_VMA_WALK_HUGE_PMD);
 		return 0;
 	}
 
@@ -234,7 +255,8 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
 		folio_unlock(folio);
 	folio_put(folio);
 	if (ret)
-		return migrate_vma_collect_skip(start, end, walk);
+		return migrate_vma_collect_skip(start, end, walk,
+					MIGRATE_VMA_WALK_SKIP_SPLIT_FAILED);
 	if (pmd_none(pmdp_get_lockless(pmdp)))
 		return migrate_vma_collect_hole(start, end, -1, walk);
 
@@ -323,7 +345,9 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 					if (unmapped)
 						flush_tlb_range(walk->vma, start, end);
 
-					return migrate_vma_collect_skip(addr, end, walk);
+					return migrate_vma_collect_skip(addr,
+						end, walk,
+						MIGRATE_VMA_WALK_SKIP_SPLIT_FAILED);
 				}
 
 				goto again;
@@ -369,7 +393,9 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 					if (unmapped)
 						flush_tlb_range(walk->vma, start, end);
 
-					return migrate_vma_collect_skip(addr, end, walk);
+					return migrate_vma_collect_skip(addr,
+						end, walk,
+						MIGRATE_VMA_WALK_SKIP_SPLIT_FAILED);
 				}
 
 				goto again;
@@ -514,6 +540,8 @@ static void migrate_vma_collect(struct migrate_vma *migrate)
 {
 	struct mmu_notifier_range range;
 
+	trace_migrate_vma_collect_start(migrate);
+
 	/*
 	 * Note that the pgmap_owner is passed to the mmu notifier callback so
 	 * that the registered device driver can skip invalidating device
@@ -529,6 +557,7 @@ static void migrate_vma_collect(struct migrate_vma *migrate)
 
 	mmu_notifier_invalidate_range_end(&range);
 	migrate->end = migrate->start + (migrate->npages << PAGE_SHIFT);
+	trace_migrate_vma_collect_done(migrate);
 }
 
 /*
@@ -653,6 +682,7 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 		restore--;
 	}
 
+	trace_migrate_device_unmap_done(src_pfns, NULL, npages);
 	return unmapped;
 }
 
@@ -763,11 +793,13 @@ int migrate_vma_setup(struct migrate_vma *args)
 	memset(args->src, 0, sizeof(*args->src) * nr_pages);
 	args->cpages = 0;
 	args->npages = 0;
+	trace_migrate_vma_setup_start(args);
 
 	migrate_vma_collect(args);
 
 	if (args->cpages)
 		migrate_vma_unmap(args);
+	trace_migrate_vma_setup_done(args);
 
 	/*
 	 * At this point pages are locked and unmapped, and thus they have
@@ -1115,7 +1147,9 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 	bool notified = false;
 	unsigned long addr;
 
-	for (i = 0; i < npages; ) {
+	trace_migrate_device_pages_start(src_pfns, dst_pfns, npages);
+
+	for (i = 0; i < npages;) {
 		struct page *newpage = migrate_pfn_to_page(dst_pfns[i]);
 		struct page *page = migrate_pfn_to_page(src_pfns[i]);
 		struct address_space *mapping;
@@ -1257,6 +1291,8 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 
 	if (notified)
 		mmu_notifier_invalidate_range_end(&range);
+
+	trace_migrate_device_pages_done(src_pfns, dst_pfns, npages);
 }
 
 /**
@@ -1285,7 +1321,9 @@ EXPORT_SYMBOL(migrate_device_pages);
  */
 void migrate_vma_pages(struct migrate_vma *migrate)
 {
+	trace_migrate_vma_pages_start(migrate);
 	__migrate_device_pages(migrate->src, migrate->dst, migrate->npages, migrate);
+	trace_migrate_vma_pages_done(migrate);
 }
 EXPORT_SYMBOL(migrate_vma_pages);
 
@@ -1298,11 +1336,24 @@ static void __migrate_device_finalize(unsigned long *src_pfns,
 		page_folio(fault_page) : NULL;
 	unsigned long i;
 
+	trace_migrate_device_finalize_start(src_pfns, dst_pfns, npages);
+
 	for (i = 0; i < npages; i++) {
 		struct folio *dst = NULL, *src = NULL;
 		struct page *newpage = migrate_pfn_to_page(dst_pfns[i]);
 		struct page *page = migrate_pfn_to_page(src_pfns[i]);
 
+		if (trace_migrate_device_folio_finalize_enabled() &&
+		    (page || newpage)) {
+			unsigned long nr_pages = page ?
+						 folio_nr_pages(page_folio(page)) :
+						 folio_nr_pages(page_folio(newpage));
+
+			trace_migrate_device_folio_finalize(i, nr_pages,
+							    src_pfns[i],
+							    dst_pfns[i]);
+		}
+
 		if (newpage)
 			dst = page_folio(newpage);
 
@@ -1339,6 +1390,8 @@ static void __migrate_device_finalize(unsigned long *src_pfns,
 			folio_put(dst);
 		}
 	}
+
+	trace_migrate_device_finalize_done(src_pfns, dst_pfns, npages);
 }
 
 /*
@@ -1371,8 +1424,10 @@ EXPORT_SYMBOL(migrate_device_finalize);
  */
 void migrate_vma_finalize(struct migrate_vma *migrate)
 {
+	trace_migrate_vma_finalize_start(migrate);
 	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
 				  migrate->fault_page);
+	trace_migrate_vma_finalize_done(migrate);
 }
 EXPORT_SYMBOL(migrate_vma_finalize);
 
-- 
2.55.0

