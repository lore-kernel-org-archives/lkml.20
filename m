Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010061.outbound.protection.outlook.com [40.93.198.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5854AA575
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196998; cv=fail; b=qII/EGRbq82hhyksnljWR4p2jgN2yLEoDaJFSg/6akMSHdYlGNqFFarmddBBkp8HOcJE/+jmLKvI4E5mR8vSbplgpDb3keKSXdqxX+Uu8ib51lmhLL8lLnmrTsDNSO40PDdXm180WP8V8T3msd2SCjt9+lMasMrSf+hxX04PpX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196998; c=relaxed/simple;
	bh=Uk+sVR2polOs+xmR/UHrUDDc/yWz39Y8Oav6UjDrGHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=etzRqdCopb8AdNDI5tekIPapns3ibQb2HdlbBkn3asGs3mRIujlmxhgAw6oM7iHYb8dz2ZExu2qgCfcodujLYb3WwN1gfupL69viLecwK/8EIY7vtyLdTkr486C3i/wvf63ymAhy3I8pQW8YRse6qx21ZcczgexJc1ocxFa5LhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mQRN9Zuj; arc=fail smtp.client-ip=40.93.198.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mQRN9Zuj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BBYO4BRlSMtC70fIR9JVxivn8IzD4Z4yNg4lxUpObQHbs9CoH6cUnL5U32eyDWR3/+W3g968mdoRHFKIidUmig4NorngsE6Mb2t1012RURJPbpautWjKCvvCDl3l1IwcTz7KMjRioPh7KUtHOT5EVKNKoaYY/7FHIHHb714EoZU0U44mjxczFrg7OLVRkSXltw1+Ft4tG9q3WRU1jq6Ok4OyJ/r6+drvuCrEP4jWrRqyrGVW52QVDlr0nSb39JdOnnvjjLMCxBJM9A7QbLPxp7xsmsLV1uzNl6rmp5KnDJHDMB5MDpAdVP/80r9WWK1Ii+w4RgWlUIZMvunIRjGqKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jk2ATjwFFzVVeQbSJe0mWqFUVO+QhqxiwsMm4IVD3+M=;
 b=g3Rc7Mnp6NZ8MsA5AMZANeuBsjVdEjDY0i/SXdkM/hL09yoN4nzcEBr54Z6QAbi3dWUBdL49GsZv5UCk3MFbAtiuEFTCfNePALx1d1DyxC4o3Ba9+Tq49lVbDijlS+aIO3L9cN6sUPu8OJfNLg5xDTZCqGccAC3skQ1Vp1JatcgzojNPWzUdXiDaD4NskwVmvBACNZ6RfaIghLVqXUxcgbpYb9JXQpaOOxa/YysbHUyf6Wn2wfr95pngN5DY1zYI0BzMGlsgsIbJ2M5RwWqf4xOkeH7ctb0S47fagyVv5REE6a+Nasf5FwMW2r34YWquadtr+S4/6kPhOtUI0bouTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jk2ATjwFFzVVeQbSJe0mWqFUVO+QhqxiwsMm4IVD3+M=;
 b=mQRN9ZujKDSBy7HBO9IiroYf/cOh2rm+EGDzMtJiX7Fr5fpFiNVP+hbf2JxDFGha36QrEqo/2Obuj09Ns8byna7jCkV719EKd8Am1oJ3AsWIiArvFtIivOEX1xIuGxY4/UreDmKAcinZzsnlHy1yH42w2xu7GaBG2rO5l57I1pTchkL1+3iHKu5J4OwDK5PjdSlnM89WUMzTjC6NSgJUSreLP2qzoaVlUocPLRfKEAV8SGHTiTBMM0LwPwEiw9l2tYXSVNvwhIn+wTkfBGCyilneEtyar+36HsX3s/sK78TXoPREbqkazm+38Zw2oTvXh2NAbNi5Ik65tyiEMao+Ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by MN2PR12MB4406.namprd12.prod.outlook.com (2603:10b6:208:268::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 17:23:12 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 17:23:11 +0000
From: Fenghua Yu <fenghuay@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <fustini@kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Newton Liu <newtonl@nvidia.com>,
	Richard Cheng <icheng@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fenghua Yu <fenghuay@nvidia.com>
Subject: [PATCH RFC v2 15/19] Documentation: arm64: mpam: document memory-level MB control and NUMA nodes
Date: Mon, 31 Aug 2026 10:22:41 -0700
Message-ID: <20260831172245.42253-16-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
References: <20260831172245.42253-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0352.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::27) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|MN2PR12MB4406:EE_
X-MS-Office365-Filtering-Correlation-Id: b8576bb7-e65e-47fa-4b3d-08df0784874b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|921020|10067099003|11063799006|22082099003|18002099003|6133799003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	Qo31ME/9Dub6+S/5QLLyQZuwnr/76ngJN76gSAU8x/pCD50r9pQxd21hy5M511u3sMqwUzlx/KYR1GrVdH/OSNzE3X4ocx00OIeBe7qTGUxBru7sTfIIUenfGlvrimw7mNfE7NJ5yZEqJgf0fIT33vwdJ6pcXlFId94MAdU++MhgkWmJy++o9Wsr9oniT09som5pVIMX1zF81BXA6PGpbA0JAwSUwNHvkJoPZ67ZjzG9hDhLx9/oUiuS1bFiyqxXtfdaeATsjVkdVdU3BPMIfCDyzbYKBL4kqUZz7VajdaGiE0vCR78y2K4JvZfXunOl9xzGppVclLXdTSiOx8rBoZcWZRAEciBCI9e574eK+naOiWOvo2QaebiLnPdDwIRY6m83nmyWIyVzI6OYrRonJhYoAtpNrxThmDwv2BOqvVt2+Vl3atDF7DfmsyN3F2PkWwsO7fbzOrr6bvnBquSb8l/N4ltahhwrm8uBQG44yd+758kUYi59Dk9vkl3KJYZnV6jDSps/NyFJdI1dmxSfidSnieEuiyzm+7jV4kqsA8ZqknR8vKQlWZgA5lIvKYjnIPcpcLW2ed9xukG81y6JxVDkQiCRNyBO8XUoitCKH57EPW17doFrxoWPekxMUbV4hZG/R9fyfgornE6D0AZyTYXishK5gvns4cnXMLgr8HcF5BkCX/XiVoqqLpmLovoWwkLU8eRhVIacg1IB1jtcVw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(921020)(10067099003)(11063799006)(22082099003)(18002099003)(6133799003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qibJYfZkn6YuCzBMgY6BTQM3pnsfPOd25LWFWbgc88ul/0Qw6w5owulu45ds?=
 =?us-ascii?Q?LD89cL94M5mvi351HF/ujDES5QZcrnbJtxejJTaxqNdUugvtmiO2jckghr5N?=
 =?us-ascii?Q?kQ6m+5CRzb78tGwlG3V+5/e9ebdUhj51pGfZyQ7kw0BLoA9PbbPs6/Ya1GdW?=
 =?us-ascii?Q?Eq3Iz8eTmpb2BFPnicwzCSQFBxMQQhI269pZ2gnIN/2XtJZR/+Zd1o4MPXIh?=
 =?us-ascii?Q?Dtv0PL/zP+xCUa7ri0DxBuopIdimjcj7eGdwXQuc3rPUuQ45Th4sC0HJf+Nl?=
 =?us-ascii?Q?u3VewQ35AWvy5iE++Kwx28CbVLBXa6PuHpijiXglioPsFGPNgv8yIn53jxHU?=
 =?us-ascii?Q?2JqCApF+Z71HoGAbGgCdXXfa1cULXgGlY8+qqHYs7zXrnrQMV3p1EYSBHrM1?=
 =?us-ascii?Q?wJ1zDNRRiDPnQ6PD1n0A/v7HBut2OBxN68sHA6sQPCBj31t8Z/qIy6f7xFve?=
 =?us-ascii?Q?ipPjJeQ5iXhqCSmg5u1gQdg7N7MP490i23muflwfw/yhnKCgkZkCaDS2asRf?=
 =?us-ascii?Q?4e2oV6cCr4wXe13pCLy6cSr36LC6stx9nzWhRzWPjjMNgqxQzT99FPYi5ytw?=
 =?us-ascii?Q?PLsDxullo9fLKwTUThCbvxFvVrDyO1pAt4dIIruFwIiiBdENoCk+3YhQtYqd?=
 =?us-ascii?Q?SSWjrLQxP6YhLE9T5j5TTck6047ZGMVnR8tAU7uujTfkQUuw6MhdRGVzDbiz?=
 =?us-ascii?Q?CeQRWyyUemJhB68YjkYBSI+cj7tAXijoCckvH8aQsdLAxl7pIYPoOjHWBGE6?=
 =?us-ascii?Q?lL3mqgLax8IU0CLtdFdNyWYGDclXZJ84aVpY2SxiB2S3+DyH7yjAmjmWI/v2?=
 =?us-ascii?Q?zcN3yVrBbPeIs2/WgXYIjle8uZta7fYL6ee0SwbNlYCcbg+FRdiwcW2gn/lM?=
 =?us-ascii?Q?GDbrFX099ZbKl8k2Xv/vNv5SmyHEaiV2F9aD6acIxkW4Mds9M6er6Ige+d8Z?=
 =?us-ascii?Q?S+QS9I+DHI+jhsvl2MW9lLsIqGQdjl5rOzBAL9YpG0u5949xPGtI4QMlpmQ1?=
 =?us-ascii?Q?kIA9LOGw/Cse0BWzYmv+cDq1tUVSt9KHO0hQro6neo6s3Flxh0+uXsXlX/ku?=
 =?us-ascii?Q?GazAKk2zmFLwVpSzjQi1uCeA6cwXDn+gufSYD/TO1vdUSm5c4TIAhRkfaGZF?=
 =?us-ascii?Q?l0RDZe0/CfXotOeNDKzVbzREg/gaKL8XXc86Pk3GOwWPcTVbJ4GQVjuh0ezY?=
 =?us-ascii?Q?PJ1CvvvU3SMVoHHKwBB2xx1N8IK8ROb3aAc+2iN99SPrn2J4n20G6wMBLv4c?=
 =?us-ascii?Q?5HBOJa6f8mVvu/D/KhbjIXMhTQBRxXTeLFFiQ0Z6qLMlFKzOA0frDliqxV//?=
 =?us-ascii?Q?R2W027Sk7E/Rpp67Tid1xjBFRWd8RyoTdcooBDkYwyUBI7Z2Z/4i9LdQF0g0?=
 =?us-ascii?Q?aab/QJgH+VCFFiNkFVFPX8zTZ2BUGMwlYAEUWe8yu4M1EihlAgI4HbGm6LsP?=
 =?us-ascii?Q?Trrc+Q0I572cD+qVLMj81MZ4kOtsUO0BV80w7dmd2mhuch+jE+sLun6Fb+Db?=
 =?us-ascii?Q?gNvZPLCLlOHSjcdf69MiXY6uM3EI28LBTuP9TXHQ6pTEk0hzcClZQ3cnpW0b?=
 =?us-ascii?Q?dazRU+Zlhqnxzi443ZjNG4d/jUrmbJrO7oBP1XaewDyRNn4uJcIodOk9foMH?=
 =?us-ascii?Q?TKrmu6KkUS8Csw2khtcyjQ/Mz3aX50hKBAzrGLyfYvH4nRkAE0NqPYK7RfXt?=
 =?us-ascii?Q?Sz0V8RdFvGgujgBr+ckGtl9M2KO+yeO6bBjxgPHlYj7uLyBJ+E2fRV8gANJZ?=
 =?us-ascii?Q?qMlpR96h3A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8576bb7-e65e-47fa-4b3d-08df0784874b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 17:23:09.8552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+c/qkN8CsnwOI1ApMeu/4Hb8705pG8I72rK54BWk3lH7rwgs+AJsfSHAw2ketC3pNC9L26/wxUAKaedM1to+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4406

The MB control can be backed by a memory-level MSC above L3 rather than
the L3 cache MSC. In that case resctrl identifies domains by NUMA node id
instead of L3 cache id, exposes a node-scoped MB_NODE control, and can
manage CPU-less memory nodes by falling back to cpu_possible_mask.

Update the arm64 MPAM documentation to describe the L3-cache and memory
MSC paths for both the MB control and MBWU monitoring, how to tell them
apart via the control "scope" file, how NUMA node ids map to
/sys/devices/system/node/node*/, and CPU-less NUMA node handling.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 Documentation/arch/arm64/mpam.rst | 105 +++++++++++++++++++-----------
 1 file changed, 68 insertions(+), 37 deletions(-)

diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
index 67fe515ed501..88ddee8705e4 100644
--- a/Documentation/arch/arm64/mpam.rst
+++ b/Documentation/arch/arm64/mpam.rst
@@ -44,48 +44,79 @@ The supported features are:
   placement.
 
 * Memory bandwidth maximum controls (MBW_MAX) on or after the L3 cache.
-  resctrl uses the L3 cache-id to identify where the memory bandwidth
-  control is applied. For this reason the platform must have an L3 cache
-  with cache-id's supplied by firmware. (It doesn't need to support MPAM.)
-
-  To be exported as the 'MB' schema, the topology of the group of MSC chosen
-  must match the topology of the L3 cache so that the cache-id's can be
-  repainted. For example: Platforms with Memory bandwidth maximum controls
-  on CPU-less NUMA nodes cannot expose the 'MB' schema to resctrl as these
-  nodes do not have a corresponding L3 cache. If the memory bandwidth
-  control is on the memory rather than the L3 then there must be a single
-  global L3 as otherwise it is unknown which L3 the traffic came from. There
-  must be no caches between the L3 and the memory so that the two ends of
-  the path have equivalent traffic.
-
-  When the MPAM driver finds multiple groups of MSC it can use for the 'MB'
-  schema, it prefers the group closest to the L3 cache.
+  resctrl exposes these as the ``MB`` resource.  The domain identifiers
+  used in the ``MB:`` schemata line depend on which MSC group backs the
+  resource:
+
+  **L3-cache MSC (cache-level MB control).**
+  When the MB control hardware sits on the L3 cache MSC, resctrl uses L3
+  cache-ids to identify where bandwidth is applied.  The topology of the
+  MSC group must match the L3 cache topology so that cache-ids can be
+  repainted.  If the memory bandwidth control is on the memory rather
+  than the L3 then there must be a single global L3 as otherwise it is
+  unknown which L3 the traffic came from.  There must be no caches
+  between the L3 and the memory so that the two ends of the path have
+  equivalent traffic.
+
+  **Memory MSC (memory-level MB control).**
+  When the MB control hardware sits on a memory MSC above L3, resctrl uses
+  NUMA node identifiers instead of L3 cache-ids.  The native node-scoped
+  control is exposed as ``MB_NODE``; the legacy ``MB`` control keeps the
+  ``MB:`` schemata line for backward compatibility and, in the default
+  legacy mode, is emulated by ``MB_NODE`` when it has no hardware of its
+  own.  See the MB control emulation section in
+  Documentation/filesystems/resctrl.rst for the control layout and
+  emulation modes.
+
+  On either path, read the control ``scope`` file under
+  ``info/MB/resource_schemata/`` (``L3`` or ``NODE``) to learn which
+  identifier space the ``MB:`` line uses.
+
+  When ``scope`` reads ``NODE``, each numeric ID ``XX`` in the ``MB:``
+  line is a NUMA node id and corresponds to the standard NUMA node
+  directory ``/sys/devices/system/node/nodeXX/``.  That directory
+  describes the node: ``cpulist``/``cpumap`` (the CPUs local to it, empty
+  for a CPU-less node), ``distance`` (NUMA distances to other nodes),
+  ``meminfo`` (its memory), and its ``memoryX`` symlinks.  Use these
+  files to map an ``MB:`` (or ``MB_NODE:``) entry to a physical NUMA node
+  and its CPUs and memory.
+
+  **CPU-less NUMA nodes.**
+  A memory MSC may be associated with a NUMA node that has no local CPUs
+  (for example a memory-only node that still participates in bandwidth
+  control).  The driver falls back to ``cpu_possible_mask`` for the MSC
+  affinity so that traffic from remote CPUs is still accounted for and
+  the node can appear as an ``MB``/``MB_NODE`` domain.
+
+  When the MPAM driver finds multiple groups of MSC it can use for the
+  ``MB`` resource, it prefers the group closest to the L3 cache.
 
 * Cache Storage Usage (CSU) counters can expose the 'llc_occupancy' provided
   there is at least one CSU monitor on each MSC that makes up the L3 group.
   Exposing CSU counters from other caches or devices is not supported.
 
-* Memory Bandwidth Usage (MBWU) on or after the L3 cache.  resctrl uses the
-  L3 cache-id to identify where the memory bandwidth is measured. For this
-  reason the platform must have an L3 cache with cache-id's supplied by
-  firmware. (The platform doesn't need to support MPAM.)
-
-  Memory bandwidth monitoring makes use of MBWU monitors in each MSC that
-  makes up the L3 group. If the memory bandwidth monitoring is on the memory
-  rather than the L3 then there must be a single global L3 as otherwise it
-  is unknown which L3 the traffic came from.
-
-  To expose 'mbm_total_bytes', the topology of the group of MSC chosen must
-  match the topology of the L3 cache so that the cache-id's can be
-  repainted. For example: Platforms with Memory bandwidth monitors on
-  CPU-less NUMA nodes cannot expose 'mbm_total_bytes' as these nodes do not
-  have a corresponding L3 cache. 'mbm_local_bytes' is not exposed as MPAM
-  cannot distinguish local traffic from global traffic.
-
-  All these restrictions based on L3 cache are due to resctrl, currently, only
-  supporting monitoring at the L3 scope. It is expected that going forward more
-  MBWU monitors can be exposed to the user after support for more monitoring
-  scopes is added to resctrl.
+* Memory Bandwidth Usage (MBWU) on or after the L3 cache.  resctrl can
+  expose ``mbm_total_bytes`` from either an L3-cache MSC or a memory MSC:
+
+  **L3-cache MSC.**
+  When MBWU monitors sit on the L3 cache MSC, counters are exposed on the
+  ``L3_MON`` resource and use L3 cache-ids.  The MSC group topology must
+  match the L3 cache topology so that cache-ids can be repainted.
+
+  **Memory MSC.**
+  When MBWU monitors sit on a memory MSC above L3, counters are exposed on
+  the ``MB`` resource with node scope.  Monitor directories are named
+  ``mon_NODE_XX`` where ``XX`` is the same NUMA node identifier that appears
+  in the ``MB:`` schemata line.  CPU-less memory nodes are supported the
+  same way as for MB controls above.
+
+  ``mbm_local_bytes`` is not exposed as MPAM cannot distinguish local
+  traffic from global traffic on these paths.
+
+  When only L3-scoped monitoring was supported, platforms with memory
+  bandwidth monitors on CPU-less NUMA nodes could not expose
+  ``mbm_total_bytes``.  Node-scoped monitoring on the ``MB`` resource
+  removes that restriction for memory-class MSCs.
 
 Reporting Bugs
 ==============
-- 
2.53.0

