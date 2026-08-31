Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010061.outbound.protection.outlook.com [40.93.198.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9124AA590
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197001; cv=fail; b=szXKrfTEu/9LSQhh9zBQYh4LJbd73Q4U20wPyAFFY13Z0hSAs7HmFhQC9p7uQQAMnZ9hIfaM8g5aLtVRm1/3mJonyHDSk2Aekz06f24eqR/s4fA6EoO1xGg1hjcSQuQ/T97N6LdhRRJcVP6ZaEF85KipZpQ+hX0HOS4R4OFlAFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197001; c=relaxed/simple;
	bh=whejGFhonAKCDqO3nf8TygJ83IyeHbwDEcSpMJ+GOCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iyeAE8zAu+e5DgHfX7NLSUk0Ps3revGVn7Dy972CIb5h3+56VJJBXXfUlRNVF/F+ziUTctHgLIcCV6BKl0HIzsC+iedjvCS8B311u2tFyshiMPOiqY56sReezAps9k6vizwIzhifTTE1+BboFDKx3w36TzyKwK37E1uRWEItNNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TOfLG4fE; arc=fail smtp.client-ip=40.93.198.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TOfLG4fE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rirMyO94l9z6C+4Hfh4Q6uuSUx0pG7WKUJmBrat0sAlGba/vDZqalz3vWr3D3zOYkudZOo+Kbl276mQpWPdpTAmVCFFzu7QCIRqc8XnGal3ltMOnEAV4O6RavoAJUt2V0qLWYyOihqHBfFXzsfph0IZOEs0mVTwdsMXsMmKi4rB0RMKrV66kl1MA4+puZCWBIXUvy0sWMpChscTwMjWomq4JWZtYeqzv/T+JuY94V5TSR6vh5gnW3Phhj7NZTLxSsSbQfQUaMX7sLCey/3yKHdy1UoLd/o25mpZmXoYg5hgeQI6lLd34uh80owXKid2I2NKijXqOwUFNvx/g2xlxUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhsqMa+lNu7dNO2rcpM8+Z4WapdaiempHBmzvDTNwxU=;
 b=DiSYwHPn6Oo/t2j2Ey6U0jBiJmYNIThPt6WVFZwHpSI6IsTfkM3XIZMGIZ6WH4qxgv3JD9LCwzaKHSO2DABr4UZCn1U8z8zL90Dagt1yDgeDwEpn6Ks98tVHPVWd5e4rcaLjpn0NKIN5BuVKNO2vgBvnNoe7n72IkswDz/bJ0MHnityfv63PLPKvPO6SA/dZ+qdCrgr8WBGdye4+FO7NUeclY4vNSVw+YrZTSTaLuMERaczbf2ALojDddRONnkAY1M5pQRdePeli0XUBXsFO7SIn6+tNkj6yQk8d8+li3bAz0dW7GdIX0f3lqHXh8HBvxLv9w69i0YyNzwq0oSAkjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhsqMa+lNu7dNO2rcpM8+Z4WapdaiempHBmzvDTNwxU=;
 b=TOfLG4fEIzpLiFX6ptybfOG7mYsvbpUjwxQLOTZY2XV87XitbEEf8AF5ysKrUCqCplMNfUpHZGQIJCLfaM0svzOHM2YCn5dynUTedqlUyp7klEQKuTRzN8WZqYTEnItbZA/eQJDH5ZIynjWgfvXowdQyCgTeGvzp+6BJcksdZFEV64B5E7aKwcgvpXvT8L2w6q0aUoAyehYiO6EqiVSEpZ53qnq4Cmgu2NQg5wZgp3dXsU+FJudT7/6hFL8+pwPmGJxHLFZ0dCJEcUlp2wVwqJZlnRowrdOf4VybmxEXfJZv5SrbSKcDbgqBqDJ9sVzP0mDAJS3uFPri+5jQpAFdhw==
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
 17:23:12 +0000
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
Subject: [PATCH RFC v2 16/19] Documentation: resctrl: document NODE-scoped MBA domains and mon_NODE monitoring
Date: Mon, 31 Aug 2026 10:22:42 -0700
Message-ID: <20260831172245.42253-17-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
References: <20260831172245.42253-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0331.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::6) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|MN2PR12MB4406:EE_
X-MS-Office365-Filtering-Correlation-Id: 0992682a-13f0-4588-c1fb-08df07848809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|921020|10067099003|11063799006|22082099003|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	OQK2UTZfZZkwFE0idsR8gdFAWubuO7oLaweI/RWZrh/658qDnubuZBioMqAYPtGGToZicrsQ7GJ+9omFEIMqis7nNmXqdXYbdgyXUlddIyWwG0GpnkeGOdukikp+ClVsph0Bm23X1YdV1f1oCyFVT1+VscQEAxRSCnOznqf+q8/NTiGNseqmi6K3TLmkFFeGXmCUxP2omcczA4mW65AVP4lmxukdwC3j7ROH6ib70ebtz4/zcvofhbmeLc11dRtKmURw5IYOuTHjN6Y/7b0L/5jAKnREcGHcFOxQdGVMP8JIK9Gp+6TCmRnl2Xf6/YqevylD3jzDEhcMgqzvePk6xOiLOYZXwhNW5yJ9bLb8PCIcKBoJR3qwAtqlVg9kPl/2rTpm7M8TTbjTczLLS0U8P9xbJ2ZVCLYb5HxewWycvNlKEfp6VVAK9+aIbeXMBevL0WmBE192ipXZh5+AZKLXP0fy2RNJdPh2itaHyHbnfuKkacvzmMmadN8RdJgIgdDU0br1VBbPKueh02GMnlT9PXacJ3rFj6s8jb8iSvCZMT4dVuLaurFVGNr21a3MKeGmotT6NfumS/GyFOILEZ7tqYumWLt0ATf4Go01HJksDZFYQ//7C++WK3r3E6HRh/RXEzg3HCG2IhxAtpoXPA1ZHH1EDUmqSOuTKkI+Cb53XlCMAcQenxwokyv68IZ/6aulRCjT47JjI0tAGWPpWvvKMg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(921020)(10067099003)(11063799006)(22082099003)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tt3bY1/vp5MVEmbgmMZPG8rL7swcbVAqgwd3hyOuLINvzo2rsy2Vdf7B2bBP?=
 =?us-ascii?Q?wmcHksSPHKcBn6ICloBpuhIGLcMeWoWDBmOlTnO0pE/l/2dHVZR4yBkmJ3Ql?=
 =?us-ascii?Q?4sFutzJgcdg8Mvrrz7xdYc4yj/XU93qTluw5IKgYCNwFb4OyFR7SAMjY8XIU?=
 =?us-ascii?Q?1lBL4LjBpUQgbV1nv8VvRjazVnwMBLdf31Xp4otie1ZaZavp40N08yKst8jp?=
 =?us-ascii?Q?wh+MsUFdcRnnmvWyWGiTOXHDFDVuaVR9jKfJ8vK+bmWefOFYa4o4bmSYjvex?=
 =?us-ascii?Q?XJ4GkmfqIfb82wo+j7TPpRQVHvvBayfjPKngiWrySJbnip1VFqTI7f1uEC9q?=
 =?us-ascii?Q?UNARyQDNw01nNUHq2D1w13z61HIcsXrwoBR9fI+xDbJ856Wm5IdjfVG3K+/n?=
 =?us-ascii?Q?g3jrUN0z76e4zs4iyt62B7CLBENd9mDDLY83QqWBRD0v51q7+bR6yIqJC1zd?=
 =?us-ascii?Q?c5LJDlWnAG/oktwPfmLByxRP4qKct2gNETEmbFrHo09sQgOoUrG3sCXAxPfo?=
 =?us-ascii?Q?2wUZlMDjMYaofQ6PR2kTBnMMs2WfwWQUNZ732gxq4FJZqZ+IcmeyYPa2Xzl1?=
 =?us-ascii?Q?g+Ja00QRYoCOeW//1Cp0w01WXH+7XvI2KZdxaTLG2Pt7EBOSjlYVZ8xRei+e?=
 =?us-ascii?Q?Wy30wCMoOXHe5D/LKtJNPWr4o3nYhlQ8ikbmcIAkL4iJkW7TEFxAYKkvinTl?=
 =?us-ascii?Q?YFaFqp9aQmKiMHKE3IjPRVxWPuMbB2KiRbL57Um5yLmpdHGRUWJdkznAnbWZ?=
 =?us-ascii?Q?LlFHvhsRuE2GVb+2H2X8jL2EZxhmqcpY+G1O4BdouN6C9+tQiIoQ/6RPhxv5?=
 =?us-ascii?Q?aFoEHHe28P1/H62c1imQfQzaeBtgCcudOpnslMyHAk119pUuhAaZC+Fx8iU4?=
 =?us-ascii?Q?ig0G9az5vq0MS5+p5mxR+zS1sI837jc4M+LzKlLoifIN/fQNVZMBbfdYmq+d?=
 =?us-ascii?Q?GW4NZjDWBSG0siy2mlJ247KUi4vnChI4dILIVBugDcSjUaeXeESkAe3GgrQh?=
 =?us-ascii?Q?hDJilr5ABEvLjN+VDbll801hkt8e9DCRYZZ2Fx8ll2NoOoaNM+9ipS8hDBJP?=
 =?us-ascii?Q?Us3Yq8bcsye4TQI+VaeR906DFQF+6/Y6RhPDo7U0K2FcgxHGTB5KDAWNf12s?=
 =?us-ascii?Q?PBTne4GDOdfWvTrKTbtS0wGMd/eBBF1IWIT5x5KMr3Uc4LlIs4MFfsTRLF3o?=
 =?us-ascii?Q?7VTPukHl7m+9XLSzKnMhrkSZ/dY7Y5igWJNf58hIbZcnubvOd/SXSa4ftzG7?=
 =?us-ascii?Q?8bsD+KMHHskQZu4kvmvW4p7Vi17Vsstd8kf3NTQRbvw6OtSlXFPSXpS9PasZ?=
 =?us-ascii?Q?tx963VXp7OoGGzfD6c1sJnT8hSLnWkoAH3w5yvDSWmmvWRvf4/z+nkVem+0N?=
 =?us-ascii?Q?38v5saj1DWjUN5l1GNPb4MQu6I81IK0bRzqp99nmtUGemdolQ8xETe3Dnkml?=
 =?us-ascii?Q?e5mqAa3gsDqaBxhdcXuzkSMS4o1zYvhpgNXbnJAbbwWw5HcIg/6CIsRg7qsZ?=
 =?us-ascii?Q?EgIYp51KFCItTla47fYo3zl3Opq45woEHzoCuwCCAxC3UIYfaQqkeSyPJPH6?=
 =?us-ascii?Q?hYm0tjw5n7CSQji0NLGyweYGxM3QL9RW0t+YM/C6qBxxNkD+THWfyut1fkcu?=
 =?us-ascii?Q?82UcpKY6VQ8CX6OHFPcvSMLlymVW0vZgVgfREr36EtYn0igjP4GkycACxx4z?=
 =?us-ascii?Q?R3ojrAWxg/UyuDIt4n5/ziNDn2gUl3/1FjO5TOHLlrkgXdo5PyBp4D4wAXFk?=
 =?us-ascii?Q?1G7yXVzOMA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0992682a-13f0-4588-c1fb-08df07848809
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 17:23:11.0713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6HiuxS9eU1rhTOzByZez18HNLOUi35a6n/8FQ3/4BefdSzKNglwP7S0NzuextjSVW7QT4zgerduTT3X9WLCdkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4406

On ARM MPAM platforms backed by a memory-level MSC, the MB control's
scope reads NODE and schemata identifiers are NUMA node ids rather than
L3 cache ids. Document the scope file values, mon_NODE_XX monitor
directories, and how to interpret MB: lines for both L3-scoped and
NODE-scoped MBA resources in Documentation/filesystems/resctrl.rst.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 Documentation/filesystems/resctrl.rst | 40 ++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 5dac9aa1da01..fbce6a1bd4c4 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -285,6 +285,11 @@ properties. The name of the control is used in the "schemata" where user space
 can view and modify control settings or portions allocated to the control group
 as the control's properties allow.
 
+Numeric identifiers in a control's schemata line follow the control's
+scope. ``L3`` means the IDs are L3 cache IDs; ``NODE`` means they are
+NUMA node IDs. The same identifier space is used by the matching
+``mon_L3_XX`` or ``mon_NODE_XX`` directories under ``mon_data``.
+
 For example, below shows MB, MB_MIN, and MB_MAX as controls for the "MB" resource.
 
 	 info/
@@ -847,6 +852,14 @@ When monitoring is enabled all MON groups will also contain:
 	each instance of an L3 cache. Each directory contains files for the enabled
 	L3 events (e.g. "llc_occupancy", "mbm_total_bytes", and "mbm_local_bytes").
 
+	On platforms where memory bandwidth monitoring is associated with the
+	MB resource (for example ARM MPAM systems with a memory-level MSC),
+	there will be a "mon_NODE_XX" directory for each MB monitor domain.
+	"XX" is the NUMA node id that also appears in the "MB:" line of
+	"schemata" when that control is node-scoped. Each "mon_NODE_XX"
+	directory contains the MBM events enabled for that resource (for
+	example "mbm_total_bytes").
+
 	If telemetry monitoring is enabled, there will be a "mon_PERF_PKG_YY"
 	directory for each physical processor package. Each directory contains
 	files for the enabled telemetry events (e.g. "core_energy". "activity",
@@ -1183,19 +1196,38 @@ or
 Memory bandwidth Allocation (default mode)
 ------------------------------------------
 
-Memory b/w domain is L3 cache.
-::
+On most platforms the memory bandwidth (MBA) domain is the L3 cache and
+the numeric identifiers in the "MB:" line are L3 cache ids::
 
 	MB:<cache_id0>=bandwidth0;<cache_id1>=bandwidth1;...
 
+On ARM MPAM platforms backed by a memory-level MSC, the MB control is
+node-scoped and the identifiers are NUMA node ids instead::
+
+	MB:<node_id0>=bandwidth0;<node_id1>=bandwidth1;...
+
+Example on a system where MB domains are NUMA nodes::
+
+	# cat schemata
+	MB:0=100;1=100;2=100;10=100
+	L3:1=ffff;2=ffff
+
+The same NUMA node ids appear as "mon_NODE_XX" directories under
+"mon_data". See "Resource controls" for how domain identifiers follow
+control scope, and "Resource control mode" for how a native node-scoped
+control can emulate the legacy ``MB:`` line.
+
 Memory bandwidth Allocation specified in MiBps
 ----------------------------------------------
 
-Memory bandwidth domain is L3 cache.
-::
+When MBA domains are L3 caches::
 
 	MB:<cache_id0>=bw_MiBps0;<cache_id1>=bw_MiBps1;...
 
+When the MB control is node-scoped::
+
+	MB:<node_id0>=bw_MiBps0;<node_id1>=bw_MiBps1;...
+
 Slow Memory Bandwidth Allocation (SMBA)
 ---------------------------------------
 AMD hardware supports Slow Memory Bandwidth Allocation (SMBA).
-- 
2.53.0

