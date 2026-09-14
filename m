Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011012.outbound.protection.outlook.com [52.101.57.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31B43DF000
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789418990; cv=fail; b=bEM4oWNVLv0X9E/0/2zOKgiCZs86O+2l+YAaXfvoZtFgwyb35ldcVshHyK4QuQ3jkZ85kqFyBeBMRLKv8b1LRp1VmDxV+7wR8KAFlgngrmwOWW6RTRmWagxM0lRFAf608HRztnQj1Gc3s2QBEIwf04FIOcSwnn5bwoZN9lc0v6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789418990; c=relaxed/simple;
	bh=9VmMiYWoNr9ePwnv3rxHIa19FUMiND2eMBeJ46/mxrI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QcuQqvdEeQ38vP/rwi+RZrJQ/ZxoQKN8B3oOh13vCeJIV2NpI3V4R85lmToaDgl7uIbRBs1ryBNYaj8rzXa8oJiVKZSV2fQ5feWwO8Sj/gFCPE/sgfRtNapE4idKLbKSwaMzvsOGqTrRBzCrfTWfpR0sc66+nY2IANVSBWOkKwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=devzYFe3; arc=fail smtp.client-ip=52.101.57.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="devzYFe3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OpgZUvTF9E+VZiIbTd9veuQEBqXTTpBGfwvmAI5+1jwiFgzX9czNo39uD7XyQMIn+KeYqFO3h6anj8Fc77ExeTTZuuf4vBPDg6jegfaYcSAm5buf6tk2Yn4bHhi2+Wh3AsWFakDEw/JLEprqMCtviUM3vkWdVOJaOidBHa4cWiu3hq1I/UvZT0rrkdObTe/g2BOStvEv/55liA4YzG8EKlrAh/u8/piI8YN+xcy993PMZNPnCkw6vbGvjug/HiftlSrWx3feM0BjSEuee/272qOPQcQ0vmwPZ/zzGR4gMjByCfzC1gPra8mRct6j0AWJGF7YTtSj+VFsWUGTkS3tQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTTV/jONeQoPFp/f5fYCWjngJ3nDWSAgp9WAzv3YRfs=;
 b=YCCExGdQh4VTQdJy+TxPXr4H8FBycA1sgrca1mGjz38ZM64xXDU7hAjY0RiO9yZ9SJeJFQs5RArTS+iryKCRNu8pVWwysa3cml3UY0Qf40yUYc2uUQk7Sx1rtMp//uh9fLQmJDnIb59yQ2f7D1bgfELYvA2jgTJEGhDJEd6j971C+64W1DUhnO4jiOgUE/17+HO+XrN7wQ0z4SixmKCzucPhYZVrkhQwtR4yULl0Eo5ZClagT0oTAwydwVA1eeD0QaAHQ2KB2/3Ezx6D/5KEG3F/DLU8onJV27bZBIl5BRIwWC0PBk1To0+FvjY/+EaVCoVb+ARRhOnzOIauHlwsuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTTV/jONeQoPFp/f5fYCWjngJ3nDWSAgp9WAzv3YRfs=;
 b=devzYFe3nFLxx4s626FDyEop3qJhDdDMpzWWu3MVTtl1EYU4JU6boPCaoJXeDLPbzjy4yRCaQLBFuOrDr1jUj57eDOmbIKHfQLxP29axRSDxQkLgclhjaoddwC2E/w8qxO8nZkOsDCUWZ6ss8Tj0W4ywsKgbJlmn7uXJwNacIZ7ZJVIDGBiQ3LcnuhfEqkhZ6gNUXKwtcBoE4BkwftiER482ZSoga3KWwODXnyP69oNGI1sIuvqT9OWqH7tq3nceV9Htaou3CX8cDX10Jewtb5tp6wY1NpiXp+Ah9XUxiGnzuhh5e+Wit+zb+QcBHV9pb7BM08kY4j1nGTrjxBCmEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by PH8PR12MB7206.namprd12.prod.outlook.com (2603:10b6:510:226::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 20:49:32 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 20:49:32 +0000
From: Yury Norov <ynorov@nvidia.com>
To: linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jakub Kicinski <kuba@kernel.org>
Cc: Yury Norov <ynorov@nvidia.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	David Laight <david.laight.linux@gmail.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Yury Norov <yury.norov@gmail.com>
Subject: [PATCH] bitfield: get rid of __MAKE_OP machinery
Date: Mon, 14 Sep 2026 16:49:29 -0400
Message-ID: <20260914204929.240310-1-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0005.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::19) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|PH8PR12MB7206:EE_
X-MS-Office365-Filtering-Correlation-Id: ec4c5db0-93a2-432f-d4ad-08df12a1ad7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|56012099006|11063799006|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	PPMNK6qqhkA7APbs/A3TWYuzRR2m5OIgQ1LH+uNv7eyjKBUlEsm8j78/wOOS5BlJ0MrsnYnn9ehfUS210CEkmQsgvde3EDTogec+DGZvk4yo7ogTcUbemEvTKiEeVtXJg6J8Cd6GModgOecgImOtKPQnpWyRTqoJF3e4BObprQY/QMmGtkzFccSlKjROpmrR+7JG7nL352krAauYLbk59k0QrkXIeYdUUnEdcmOIXPPqzivgqDqv3H4pdz3v7aO7Yonz2LG0UhUfFF1GwHROHtYfD6ZIbJQQ32x/Kx2kgEqvI59u6ctUjbD53C9o0yXmexFBgiZVH5OtJ2vIx1JOGsdxNWwQwD6RDRFypFDvy1Ri8G4G+LNVYCiwi+LdH9ijKugPVSayJFy+POch3vka0ggwsJd3caTCeEQCHnGkKbfFj1KU6ZB3tInHXrvR1x1bjM3fTwVmuOcUKUOTC+ZN83fLyrbffPbiSCBuvHDyis06DQHK9RzjVBAuXm4cOIyYWaOnuaVbK8+eC7gMHAuI+ESLGjLfU/CJdlKKXpdFYVnvtXbJEGou5zu9aY2/N/TlUy6KlhqqtSQd5JEah0FKwl6QE0m2soArlYK2kGe9R89m/mEmnOtq6uFylj/gE9r94+vDfJ0dq4XJ7SDVxzAKIy5dwMWZ3sV3j+C26Bk8X4U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tIrO4KozXM5NDsepQhxkzK9OBqAZ7w5yyFm8hzF7M8K9tnnTnjAfTKBVYwNg?=
 =?us-ascii?Q?Z2gDgZDknEvLA2dTp7Oj7457hbmwmppSF19hK/quwgDDcRuLyNi+jaaEQ8Tm?=
 =?us-ascii?Q?Sxb5mAnVlfWHZkpYeQaNlND0hlczy3bu3JRlVuznbxfnZdzMC/DSgQA6BDQ2?=
 =?us-ascii?Q?pOCpOI0iJhfGkXgYzzbneXvDB7Pt3X1m+2BL3bJ8UFfFpb5ziae8KPJWNpk2?=
 =?us-ascii?Q?uVIxy+yepwslUJz12G2qzZSW4cQRPvDlYXIkcJTBbcXwtkjpdYPbCRqEDhIu?=
 =?us-ascii?Q?wrXZxn62K42WNemouy93dmED+TMZMYN+VRFlorbZzfD9pC23xWaIGkELfp71?=
 =?us-ascii?Q?Gh7OyKap25SZWHIM8LWDY7yeOEcETsIBF37/0PV/4vbvVE4dK5HQ09JuYHeC?=
 =?us-ascii?Q?MkBHyTlUZFTdQgkly8iwuIsSV69eKVxW7BWyAS06WfyKHno13MTPaJ5tLo2P?=
 =?us-ascii?Q?cT37XHU+I8eFs9yfba6MOTFVbD8Us6OUrMhvH0Ag9anGjxlBJL1p3U4UkBcX?=
 =?us-ascii?Q?AIGXTBOPjHOarzuCcbLgZ0afeMsoCNA2WFzLKyuiN2ebhQppkSnA4uFyKtWo?=
 =?us-ascii?Q?D222oAd/uwEpmEcUkT0kaZ8tVMLVSW3Iz0zgUSyxkjZiAK/8OQ6X9NXSfeBP?=
 =?us-ascii?Q?AhnGIUVSq1RT47IEVR7flnOgfQO8ZbEDIRqu2kq5/E31wyIFSzUrNh3FpleU?=
 =?us-ascii?Q?YEqHnJ9evmYDb5AvGWXRHJoXo7ZINHLK+thuvYJUnRRzo7tP6OcbgQC8RRJk?=
 =?us-ascii?Q?8VQLkOBiUyg36PK3IcZ3QE4bJMuYXNAt+VEML+qbHSsKnvHkNpPzql6QTTPG?=
 =?us-ascii?Q?LFISbxYX721tTp2fL5cDEQNi3UQRk1h5caWjPm+kCInlsSiOS8nseoJ2ZMDU?=
 =?us-ascii?Q?1umIS+qSa1e044bRce+rA3BZrrAwalIRcr/RCZ2JYiaYyI3JaHy9L3R+f1Qo?=
 =?us-ascii?Q?zx3JbWgfi3sdWrMHE8GeLWz0Nue33+pGa/c6nmaM+7GnrxikLWTM+qkaEA54?=
 =?us-ascii?Q?IndhXrFO/AgpVartAQQDpoPrkkyBXmHgQWpNb7544F/qsVvx8e1CxBub03+S?=
 =?us-ascii?Q?pTBe4xLtD/EaWVI4QIm9GEfwJIOvC+qOF+hmQvBQVozg2LLpPyBHl2rt1fnu?=
 =?us-ascii?Q?qCQwHCVslxNYuDiGWjoN4+fi/UgMFus8F6w0L2HweUfMfUNtEm1gQk7Opol1?=
 =?us-ascii?Q?OvNifnB2TGQlVTJvjBsNR3mcoImeB0POeFIBaC1KODg/vt5qzvIx1t7f6trT?=
 =?us-ascii?Q?KCxXY0xo2JWD7HTHBynhimCom2WEbKJ/2VE1iJxigGaSjQ+vVUo0kYSg2Lta?=
 =?us-ascii?Q?P/jJZD5VZHNjvyDjthraT74oLEb54jkUBMRf2Wx30U+PjG6W/4skANnafalI?=
 =?us-ascii?Q?XUBM+V+Uz31sA4fpCIeC6kl3VnhmRGxcuwjsdQ1QIYlviKXyR/be6drNx05/?=
 =?us-ascii?Q?dEHCJJxVx60C7iGGs0RYX9f0TLxvSRZyMP5lFY6rC57P0OBqVtX2AGlFjeSI?=
 =?us-ascii?Q?PBXZ6Z0OiqYTOtxsUv8yGMgexg8vEAC4rG49oq+vPCzLWzRVA35MeRFXlos7?=
 =?us-ascii?Q?waXBG9SlxcPMawG/4udReA7eaZmFTZLPQv1jvFDBc4eQrgyCcOpdx0VMVxz8?=
 =?us-ascii?Q?TeXQWKtgra/yGR9CkG4wT+PabnsGgNbdpUR4qNURPpytXJ9gMj6+QVdO1+l+?=
 =?us-ascii?Q?vXahFMA51k5bivnf/x4vfY6dz/soi0NLVyCD2BiK5w6u0FR2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4c5db0-93a2-432f-d4ad-08df12a1ad7c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 20:49:32.1811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ti4VifZs7q7RGlXqEpAe30lQYt/9j1NZEYGsuiLhs9VtliqmhaaxvRZK3/ddncHb2HVGcZse2v+U64eCUFAWBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7206

The __MAKE_OP machinery hides the fixed-width bitfield helper definitions
from source searches and makes the end result highly obscured and largely
uncontrolled.

This follows earlier discussions about making these helpers easier to
find: [1], [2].

Move the explicit helpers and their shared checks into
linux/bitfield-fix-width.h in both the kernel and tools headers, and
include it from bitfield.h to preserve existing users.

The repeated overflow check is factored into __assert_field(), preserving
the original condition and compile-time diagnostics.

With GCC 15.2.0 and x86-64 defconfig plus the bitfield KUnit tests, the
before/after kernel builds are binary identical.

The __MAKE_OP generates the following 40 functions (including the direct
____MAKE_OP(u8,u8,,) invocation):

  u8_encode_bits()
  u8_replace_bits()
  u8p_replace_bits()
  u8_get_bits()
  le16_encode_bits()
  le16_replace_bits() [dead code]
  le16p_replace_bits()
  le16_get_bits()
  be16_encode_bits()
  be16_replace_bits() [dead code]
  be16p_replace_bits() [dead code]
  be16_get_bits()
  u16_encode_bits()
  u16_replace_bits()
  u16p_replace_bits()
  u16_get_bits()
  le32_encode_bits()
  le32_replace_bits() [dead code]
  le32p_replace_bits()
  le32_get_bits()
  be32_encode_bits()
  be32_replace_bits() [dead code]
  be32p_replace_bits()
  be32_get_bits()
  u32_encode_bits()
  u32_replace_bits()
  u32p_replace_bits()
  u32_get_bits()
  le64_encode_bits()
  le64_replace_bits() [dead code]
  le64p_replace_bits() [dead code]
  le64_get_bits()
  be64_encode_bits()
  be64_replace_bits() [dead code]
  be64p_replace_bits() [dead code]
  be64_get_bits()
  u64_encode_bits()
  u64_replace_bits()
  u64p_replace_bits()
  u64_get_bits()

Functions marked with [dead code] have no in-tree callers and are
removed by this change.

Link: https://lore.kernel.org/all/20250214073402.0129e259@kernel.org/ [1]
Link: https://lore.kernel.org/all/aeub59FBHbCy-KKP@yury/ [2]
Assisted-by: OpenAI Codex
Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 MAINTAINERS                              |   2 +
 include/linux/bitfield-fix-width.h       | 235 ++++++++++++++++++++++++++++++
 include/linux/bitfield.h                 |  49 +------
 tools/include/linux/bitfield-fix-width.h | 236 +++++++++++++++++++++++++++++++
 tools/include/linux/bitfield.h           |  49 +------
 5 files changed, 475 insertions(+), 96 deletions(-)
 create mode 100644 include/linux/bitfield-fix-width.h
 create mode 100644 tools/include/linux/bitfield-fix-width.h

diff --git a/MAINTAINERS b/MAINTAINERS
index be05b0c3684757fa2da3aa1f02265f6e9bfebcb2..03973f947121491a44a5dfd946b3c0649e7a77e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4638,6 +4638,7 @@ BITMAP API
 M:	Yury Norov <yury.norov@gmail.com>
 R:	Rasmus Villemoes <linux@rasmusvillemoes.dk>
 S:	Maintained
+F:	include/linux/bitfield-fix-width.h
 F:	include/linux/bitfield.h
 F:	include/linux/bitmap-str.h
 F:	include/linux/bitmap.h
@@ -4658,6 +4659,7 @@ F:	lib/find_bit_benchmark.c
 F:	lib/region_alloc_benchmark.c
 F:	lib/test_bitmap.c
 F:	lib/tests/cpumask_kunit.c
+F:	tools/include/linux/bitfield-fix-width.h
 F:	tools/include/linux/bitfield.h
 F:	tools/include/linux/bitmap.h
 F:	tools/include/linux/bits.h
diff --git a/include/linux/bitfield-fix-width.h b/include/linux/bitfield-fix-width.h
new file mode 100644
index 0000000000000000000000000000000000000000..fba86bb76999f1d9a96045dbdddb72f4806a305e
--- /dev/null
+++ b/include/linux/bitfield-fix-width.h
@@ -0,0 +1,235 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _LINUX_BITFIELD_FIX_WIDTH_H
+#define _LINUX_BITFIELD_FIX_WIDTH_H
+
+#include <linux/compiler.h>
+#include <linux/types.h>
+#include <asm/byteorder.h>
+
+extern void __compiletime_error("value doesn't fit into mask")
+__field_overflow(void);
+
+extern void __compiletime_error("bad bitfield mask")
+__bad_mask(void);
+
+static __always_inline
+u64 field_multiplier(u64 field)
+{
+	if ((field | (field - 1)) & ((field | (field - 1)) + 1))
+		__bad_mask();
+	return field & -field;
+}
+
+static __always_inline
+u64 field_mask(u64 field)
+{
+	return field / field_multiplier(field);
+}
+
+#define field_max(field)	((typeof(field))field_mask(field))
+
+#define __assert_field(v, field)						\
+	do {								\
+		if (__builtin_constant_p(v) &&				\
+		    ((v) & ~field_mask(field)))				\
+			__field_overflow();				\
+	} while (0)
+
+static __always_inline __must_check
+__u8 u8_encode_bits(u8 v, u8 field)
+{
+	__assert_field(v, field);
+	return (v & field_mask(field)) * field_multiplier(field);
+}
+
+static __always_inline __must_check
+__u8 u8_replace_bits(__u8 old, u8 val, u8 field)
+{
+	return (old & ~field) | u8_encode_bits(val, field);
+}
+
+static __always_inline
+void u8p_replace_bits(__u8 *p, u8 val, u8 field)
+{
+	*p = (*p & ~field) | u8_encode_bits(val, field);
+}
+
+static __always_inline __must_check
+u8 u8_get_bits(__u8 v, u8 field)
+{
+	return (v & field) / field_multiplier(field);
+}
+
+static __always_inline __must_check
+__le16 le16_encode_bits(u16 v, u16 field)
+{
+	__assert_field(v, field);
+	return cpu_to_le16((v & field_mask(field)) * field_multiplier(field));
+}
+
+static __always_inline
+void le16p_replace_bits(__le16 *p, u16 val, u16 field)
+{
+	*p = (*p & ~cpu_to_le16(field)) | le16_encode_bits(val, field);
+}
+
+static __always_inline __must_check
+u16 le16_get_bits(__le16 v, u16 field)
+{
+	return (le16_to_cpu(v) & field) / field_multiplier(field);
+}
+
+static __always_inline __must_check
+__be16 be16_encode_bits(u16 v, u16 field)
+{
+	__assert_field(v, field);
+	return cpu_to_be16((v & field_mask(field)) * field_multiplier(field));
+}
+
+static __always_inline __must_check
+u16 be16_get_bits(__be16 v, u16 field)
+{
+	return (be16_to_cpu(v) & field) / field_multiplier(field);
+}
+
+static __always_inline __must_check
+__u16 u16_encode_bits(u16 v, u16 field)
+{
+	__assert_field(v, field);
+	return (v & field_mask(field)) * field_multiplier(field);
+}
+
+static __always_inline __must_check
+__u16 u16_replace_bits(__u16 old, u16 val, u16 field)
+{
+	return (old & ~field) | u16_encode_bits(val, field);
+}
+
+static __always_inline
+void u16p_replace_bits(__u16 *p, u16 val, u16 field)
+{
+	*p = (*p & ~field) | u16_encode_bits(val, field);
+}
+
+static __always_inline __must_check
+u16 u16_get_bits(__u16 v, u16 field)
+{
+	return (v & field) / field_multiplier(field);
+}
+
+static __always_inline __must_check
+__le32 le32_encode_bits(u32 v, u32 field)
+{
+	__assert_field(v, field);
+	return cpu_to_le32((v & field_mask(field)) * field_multiplier(field));
+}
+
+static __always_inline
+void le32p_replace_bits(__le32 *p, u32 val, u32 field)
+{
+	*p = (*p & ~cpu_to_le32(field)) | le32_encode_bits(val, field);
+}
+
+static __always_inline __must_check
+u32 le32_get_bits(__le32 v, u32 field)
+{
+	return (le32_to_cpu(v) & field) / field_multiplier(field);
+}
+
+static __always_inline __must_check
+__be32 be32_encode_bits(u32 v, u32 field)
+{
+	__assert_field(v, field);
+	return cpu_to_be32((v & field_mask(field)) * field_multiplier(field));
+}
+
+static __always_inline
+void be32p_replace_bits(__be32 *p, u32 val, u32 field)
+{
+	*p = (*p & ~cpu_to_be32(field)) | be32_encode_bits(val, field);
+}
+
+static __always_inline __must_check
+u32 be32_get_bits(__be32 v, u32 field)
+{
+	return (be32_to_cpu(v) & field) / field_multiplier(field);
+}
+
+static __always_inline __must_check
+__u32 u32_encode_bits(u32 v, u32 field)
+{
+	__assert_field(v, field);
+	return (v & field_mask(field)) * field_multiplier(field);
+}
+
+static __always_inline __must_check
+__u32 u32_replace_bits(__u32 old, u32 val, u32 field)
+{
+	return (old & ~field) | u32_encode_bits(val, field);
+}
+
+static __always_inline
+void u32p_replace_bits(__u32 *p, u32 val, u32 field)
+{
+	*p = (*p & ~field) | u32_encode_bits(val, field);
+}
+
+static __always_inline __must_check
+u32 u32_get_bits(__u32 v, u32 field)
+{
+	return (v & field) / field_multiplier(field);
+}
+
+static __always_inline __must_check
+__le64 le64_encode_bits(u64 v, u64 field)
+{
+	__assert_field(v, field);
+	return cpu_to_le64((v & field_mask(field)) * field_multiplier(field));
+}
+
+static __always_inline __must_check
+u64 le64_get_bits(__le64 v, u64 field)
+{
+	return (le64_to_cpu(v) & field) / field_multiplier(field);
+}
+
+static __always_inline __must_check
+__be64 be64_encode_bits(u64 v, u64 field)
+{
+	__assert_field(v, field);
+	return cpu_to_be64((v & field_mask(field)) * field_multiplier(field));
+}
+
+static __always_inline __must_check
+u64 be64_get_bits(__be64 v, u64 field)
+{
+	return (be64_to_cpu(v) & field) / field_multiplier(field);
+}
+
+static __always_inline __must_check
+__u64 u64_encode_bits(u64 v, u64 field)
+{
+	__assert_field(v, field);
+	return (v & field_mask(field)) * field_multiplier(field);
+}
+
+static __always_inline __must_check
+__u64 u64_replace_bits(__u64 old, u64 val, u64 field)
+{
+	return (old & ~field) | u64_encode_bits(val, field);
+}
+
+static __always_inline
+void u64p_replace_bits(__u64 *p, u64 val, u64 field)
+{
+	*p = (*p & ~field) | u64_encode_bits(val, field);
+}
+
+static __always_inline __must_check
+u64 u64_get_bits(__u64 v, u64 field)
+{
+	return (v & field) / field_multiplier(field);
+}
+
+#endif /* _LINUX_BITFIELD_FIX_WIDTH_H */
diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
index 14f86e455a678b04a4588e80789ab74902324c9c..e3f7315c1d539bff0491f570b607881032ce1ddb 100644
--- a/include/linux/bitfield.h
+++ b/include/linux/bitfield.h
@@ -10,7 +10,7 @@
 #include <linux/build_bug.h>
 #include <linux/compiler.h>
 #include <linux/typecheck.h>
-#include <asm/byteorder.h>
+#include <linux/bitfield-fix-width.h>
 
 /*
  * Bitfield access macros
@@ -211,53 +211,6 @@
 		*(_reg_p) |= (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask));	\
 	})
 
-extern void __compiletime_error("value doesn't fit into mask")
-__field_overflow(void);
-extern void __compiletime_error("bad bitfield mask")
-__bad_mask(void);
-static __always_inline u64 field_multiplier(u64 field)
-{
-	if ((field | (field - 1)) & ((field | (field - 1)) + 1))
-		__bad_mask();
-	return field & -field;
-}
-static __always_inline u64 field_mask(u64 field)
-{
-	return field / field_multiplier(field);
-}
-#define field_max(field)	((typeof(field))field_mask(field))
-#define ____MAKE_OP(type,base,to,from)					\
-static __always_inline __##type __must_check type##_encode_bits(base v, base field)	\
-{									\
-	if (__builtin_constant_p(v) && (v & ~field_mask(field)))	\
-		__field_overflow();					\
-	return to((v & field_mask(field)) * field_multiplier(field));	\
-}									\
-static __always_inline __##type __must_check type##_replace_bits(__##type old,	\
-							base val, base field)	\
-{									\
-	return (old & ~to(field)) | type##_encode_bits(val, field);	\
-}									\
-static __always_inline void type##p_replace_bits(__##type *p,		\
-					base val, base field)		\
-{									\
-	*p = (*p & ~to(field)) | type##_encode_bits(val, field);	\
-}									\
-static __always_inline base __must_check type##_get_bits(__##type v, base field)	\
-{									\
-	return (from(v) & field)/field_multiplier(field);		\
-}
-#define __MAKE_OP(size)							\
-	____MAKE_OP(le##size,u##size,cpu_to_le##size,le##size##_to_cpu)	\
-	____MAKE_OP(be##size,u##size,cpu_to_be##size,be##size##_to_cpu)	\
-	____MAKE_OP(u##size,u##size,,)
-____MAKE_OP(u8,u8,,)
-__MAKE_OP(16)
-__MAKE_OP(32)
-__MAKE_OP(64)
-#undef __MAKE_OP
-#undef ____MAKE_OP
-
 #define __field_prep(mask, val)						\
 	({								\
 		auto __mask = (mask);					\
diff --git a/tools/include/linux/bitfield-fix-width.h b/tools/include/linux/bitfield-fix-width.h
new file mode 100644
index 0000000000000000000000000000000000000000..8c2a0fa224e9976d3587bb76c947b7cf8df4b8bb
--- /dev/null
+++ b/tools/include/linux/bitfield-fix-width.h
@@ -0,0 +1,236 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _LINUX_BITFIELD_FIX_WIDTH_H
+#define _LINUX_BITFIELD_FIX_WIDTH_H
+
+#include <linux/compiler.h>
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <asm/byteorder.h>
+
+extern void __compiletime_error("value doesn't fit into mask")
+__field_overflow(void);
+
+extern void __compiletime_error("bad bitfield mask")
+__bad_mask(void);
+
+static __always_inline
+u64 field_multiplier(u64 field)
+{
+	if ((field | (field - 1)) & ((field | (field - 1)) + 1))
+		__bad_mask();
+	return field & -field;
+}
+
+static __always_inline
+u64 field_mask(u64 field)
+{
+	return field / field_multiplier(field);
+}
+
+#define field_max(field)	((typeof(field))field_mask(field))
+
+#define __assert_field(v, field)						\
+	do {								\
+		if (__builtin_constant_p(v) &&				\
+		    ((v) & ~field_mask(field)))				\
+			__field_overflow();				\
+	} while (0)
+
+static __always_inline
+__u8 u8_encode_bits(u8 v, u8 field)
+{
+	__assert_field(v, field);
+	return (v & field_mask(field)) * field_multiplier(field);
+}
+
+static __always_inline
+__u8 u8_replace_bits(__u8 old, u8 val, u8 field)
+{
+	return (old & ~field) | u8_encode_bits(val, field);
+}
+
+static __always_inline
+void u8p_replace_bits(__u8 *p, u8 val, u8 field)
+{
+	*p = (*p & ~field) | u8_encode_bits(val, field);
+}
+
+static __always_inline
+u8 u8_get_bits(__u8 v, u8 field)
+{
+	return (v & field) / field_multiplier(field);
+}
+
+static __always_inline
+__le16 le16_encode_bits(u16 v, u16 field)
+{
+	__assert_field(v, field);
+	return cpu_to_le16((v & field_mask(field)) * field_multiplier(field));
+}
+
+static __always_inline
+void le16p_replace_bits(__le16 *p, u16 val, u16 field)
+{
+	*p = (*p & ~cpu_to_le16(field)) | le16_encode_bits(val, field);
+}
+
+static __always_inline
+u16 le16_get_bits(__le16 v, u16 field)
+{
+	return (le16_to_cpu(v) & field) / field_multiplier(field);
+}
+
+static __always_inline
+__be16 be16_encode_bits(u16 v, u16 field)
+{
+	__assert_field(v, field);
+	return cpu_to_be16((v & field_mask(field)) * field_multiplier(field));
+}
+
+static __always_inline
+u16 be16_get_bits(__be16 v, u16 field)
+{
+	return (be16_to_cpu(v) & field) / field_multiplier(field);
+}
+
+static __always_inline
+__u16 u16_encode_bits(u16 v, u16 field)
+{
+	__assert_field(v, field);
+	return (v & field_mask(field)) * field_multiplier(field);
+}
+
+static __always_inline
+__u16 u16_replace_bits(__u16 old, u16 val, u16 field)
+{
+	return (old & ~field) | u16_encode_bits(val, field);
+}
+
+static __always_inline
+void u16p_replace_bits(__u16 *p, u16 val, u16 field)
+{
+	*p = (*p & ~field) | u16_encode_bits(val, field);
+}
+
+static __always_inline
+u16 u16_get_bits(__u16 v, u16 field)
+{
+	return (v & field) / field_multiplier(field);
+}
+
+static __always_inline
+__le32 le32_encode_bits(u32 v, u32 field)
+{
+	__assert_field(v, field);
+	return cpu_to_le32((v & field_mask(field)) * field_multiplier(field));
+}
+
+static __always_inline
+void le32p_replace_bits(__le32 *p, u32 val, u32 field)
+{
+	*p = (*p & ~cpu_to_le32(field)) | le32_encode_bits(val, field);
+}
+
+static __always_inline
+u32 le32_get_bits(__le32 v, u32 field)
+{
+	return (le32_to_cpu(v) & field) / field_multiplier(field);
+}
+
+static __always_inline
+__be32 be32_encode_bits(u32 v, u32 field)
+{
+	__assert_field(v, field);
+	return cpu_to_be32((v & field_mask(field)) * field_multiplier(field));
+}
+
+static __always_inline
+void be32p_replace_bits(__be32 *p, u32 val, u32 field)
+{
+	*p = (*p & ~cpu_to_be32(field)) | be32_encode_bits(val, field);
+}
+
+static __always_inline
+u32 be32_get_bits(__be32 v, u32 field)
+{
+	return (be32_to_cpu(v) & field) / field_multiplier(field);
+}
+
+static __always_inline
+__u32 u32_encode_bits(u32 v, u32 field)
+{
+	__assert_field(v, field);
+	return (v & field_mask(field)) * field_multiplier(field);
+}
+
+static __always_inline
+__u32 u32_replace_bits(__u32 old, u32 val, u32 field)
+{
+	return (old & ~field) | u32_encode_bits(val, field);
+}
+
+static __always_inline
+void u32p_replace_bits(__u32 *p, u32 val, u32 field)
+{
+	*p = (*p & ~field) | u32_encode_bits(val, field);
+}
+
+static __always_inline
+u32 u32_get_bits(__u32 v, u32 field)
+{
+	return (v & field) / field_multiplier(field);
+}
+
+static __always_inline
+__le64 le64_encode_bits(u64 v, u64 field)
+{
+	__assert_field(v, field);
+	return cpu_to_le64((v & field_mask(field)) * field_multiplier(field));
+}
+
+static __always_inline
+u64 le64_get_bits(__le64 v, u64 field)
+{
+	return (le64_to_cpu(v) & field) / field_multiplier(field);
+}
+
+static __always_inline
+__be64 be64_encode_bits(u64 v, u64 field)
+{
+	__assert_field(v, field);
+	return cpu_to_be64((v & field_mask(field)) * field_multiplier(field));
+}
+
+static __always_inline
+u64 be64_get_bits(__be64 v, u64 field)
+{
+	return (be64_to_cpu(v) & field) / field_multiplier(field);
+}
+
+static __always_inline
+__u64 u64_encode_bits(u64 v, u64 field)
+{
+	__assert_field(v, field);
+	return (v & field_mask(field)) * field_multiplier(field);
+}
+
+static __always_inline
+__u64 u64_replace_bits(__u64 old, u64 val, u64 field)
+{
+	return (old & ~field) | u64_encode_bits(val, field);
+}
+
+static __always_inline
+void u64p_replace_bits(__u64 *p, u64 val, u64 field)
+{
+	*p = (*p & ~field) | u64_encode_bits(val, field);
+}
+
+static __always_inline
+u64 u64_get_bits(__u64 v, u64 field)
+{
+	return (v & field) / field_multiplier(field);
+}
+
+#endif /* _LINUX_BITFIELD_FIX_WIDTH_H */
diff --git a/tools/include/linux/bitfield.h b/tools/include/linux/bitfield.h
index ddf81f24956ba069b2c1a7b096a6c9bf92fc9182..4508cefabec92d4e05a09ecf93b98bf4e304d305 100644
--- a/tools/include/linux/bitfield.h
+++ b/tools/include/linux/bitfield.h
@@ -9,7 +9,7 @@
 
 #include <linux/build_bug.h>
 #include <linux/kernel.h>
-#include <asm/byteorder.h>
+#include <linux/bitfield-fix-width.h>
 
 /*
  * Bitfield access macros
@@ -127,51 +127,4 @@
 		(typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask));	\
 	})
 
-extern void __compiletime_error("value doesn't fit into mask")
-__field_overflow(void);
-extern void __compiletime_error("bad bitfield mask")
-__bad_mask(void);
-static __always_inline u64 field_multiplier(u64 field)
-{
-	if ((field | (field - 1)) & ((field | (field - 1)) + 1))
-		__bad_mask();
-	return field & -field;
-}
-static __always_inline u64 field_mask(u64 field)
-{
-	return field / field_multiplier(field);
-}
-#define field_max(field)	((typeof(field))field_mask(field))
-#define ____MAKE_OP(type,base,to,from)					\
-static __always_inline __##type type##_encode_bits(base v, base field)	\
-{									\
-	if (__builtin_constant_p(v) && (v & ~field_mask(field)))	\
-		__field_overflow();					\
-	return to((v & field_mask(field)) * field_multiplier(field));	\
-}									\
-static __always_inline __##type type##_replace_bits(__##type old,	\
-					base val, base field)		\
-{									\
-	return (old & ~to(field)) | type##_encode_bits(val, field);	\
-}									\
-static __always_inline void type##p_replace_bits(__##type *p,		\
-					base val, base field)		\
-{									\
-	*p = (*p & ~to(field)) | type##_encode_bits(val, field);	\
-}									\
-static __always_inline base type##_get_bits(__##type v, base field)	\
-{									\
-	return (from(v) & field)/field_multiplier(field);		\
-}
-#define __MAKE_OP(size)							\
-	____MAKE_OP(le##size,u##size,cpu_to_le##size,le##size##_to_cpu)	\
-	____MAKE_OP(be##size,u##size,cpu_to_be##size,be##size##_to_cpu)	\
-	____MAKE_OP(u##size,u##size,,)
-____MAKE_OP(u8,u8,,)
-__MAKE_OP(16)
-__MAKE_OP(32)
-__MAKE_OP(64)
-#undef __MAKE_OP
-#undef ____MAKE_OP
-
 #endif
-- 
2.53.0
