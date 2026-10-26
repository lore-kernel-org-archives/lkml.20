Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.95.111
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793029846;
	b=Gmo4uTy7NIPafMXqv7ByGNXxDaHyEmBArPiJxU6OvbXVLwR+Nrh/v0XDb/mP1N/PNzpE
	 u2Jn14c8NbH/5fFZkJ2VsdE2jRK27JOYdMYU5CZPgmmkHo8QU72Cdo3LFWoW88tMdJ13w
	 WV+Tr2Ll1G7IZAx0L0dT+ee04jiVN8hE7wWbD/xXHUciaTg0AC2BnmYBRkrME7ZEbLgcQ
	 Ipjg+abIRPsQmhIFsP8fIVcAQezQ9WQltwnaOi0QtbzMNOtIcegqT0wVX43+jRSXyjtpv
	 DkrMKcEfeih/f66B7LD146RpJVOKaYoBKN6vgW0OTAH5TMl1s0rqx8odfMSveMXPL4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029846;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=G49Ho7nV3B2g8u/dU0XnPPER/DbjleAV5x3lFjsAcXg=;
	b=grrMb5QMHELNUSY7vYwU2nSalaD3f4AcHge48JcBCk+G9Gp3htwITBZm6GWYhC39FfZd
	 d3fcBR195RtAeFjtDiOb8WQK+LiIg48QbDeqHIUXlBvlGcX4GQtqIB4en8qaKCG5YLeBn
	 Bprd9cD5yAY17z84pa0+M1VYJ2pfJNVUPZikvjlfg8OVIDa2rn2g+F1d+XAkw91sHjhIi
	 HI2qcsaSvwT/QiFLyMKZenf93Glocoqx82jAEZJvXSzBrm4x4enQ5WXsMAa0DfZ6jbJIw
	 R7klJwDIlJUbKyRMneJqYc/3UM21ZKR5bRmFrfzhX3glbNhcpv5yu1Yn5H7UrkMTK3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.95.111
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021111.outbound.protection.outlook.com [52.101.95.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87D1606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D87D1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JzTdQCzx0Gg+i6+TOty8KIsATlXiXl5Y0OV9c2RgpSOPfu0vzPU++I7VLjGnZljco+gviIX2CZwXqAZSedBr653ZU2jOAYkl+vuV1Ki0F4epP6lCqQLWlg/xQjLQE+oNMdbmnvU+fi+hkdcXGifoEUEfZXeZMPRDFgbtFYT9uv7Jqm0jq6PaC2RgoHz8Ks3myIMI6juAg4tKRxMN0cuWMF0es/eEC7Z940ZAdkiPFP/Q6dgKiTKYka5IHwxEngTNAxRq9NaeQGQCDRNTQixSpvmYuaFIhmOWr/7ThfWR/XSMPHeieDjeaNIfpZaBxqHcWp0SirqZoMw+yUWEWx84og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=G49Ho7nV3B2g8u/dU0XnPPER/DbjleAV5x3lFjsAcXg=;
 b=H+Z3HNIzZaCnKVZH8Nf3Ok4+N0TSAx69RhgPualIe8+eOihAX0Z9rCO5T1tVPUbZKW2vpdZUdPTwSFd2+BT++bdhYDK2dkxeDyvx2yBlGCYd0mYd2V8glghg2nfkxDxUb6/XnR3zPlRr7+wW9jiGgakIlbR9lFVm+VIPlz+ns1gMimN6GYr8Q1tVM4zSaLtJ9a9GNQCnj9pZnKEGTr+8zGltAA15546cXsOMBeQe77Dc5zlz7Lobt6A4nuiEEY+sJfbCa1P8gPoSVwf1CiCCoqLL5AOXoMiSdac4+xeuJLevOaiIJJ/dVg9BBsKB3AJFEh4pOrzHJ/HOc5o87t+8wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by CW1P123MB954970.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:2a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 15:50:42 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 15:50:40 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: tj@kernel.org
Cc: leitao@debian.org,
	atomlin@atomlin.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5] tools/workqueue/wq_dump.py: Add busy worker inspection and BH pool states
Date: Mon, 26 Oct 2026 11:50:37 -0400
Message-ID: <20261026155037.557670-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0275.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::25) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|CW1P123MB954970:EE_
X-MS-Office365-Filtering-Correlation-Id: 48966cc5-3f62-4d8d-d24e-08df3378e2f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|261026140227099003|56012099006|261026121527099003|261022105027099003|261021123027099003|261022075727099003|261021135927099003|261009223027099003|261021121427099003|260925022911599003|260925021311599003|260925021911599003|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	S+Q1pk3a2YjkJHyGbyiCNzvGa4SNk72yADP0dxDQjLAALqWLP7KLZTYCUCtwrizr29ZsdKphjWbS2brdIpXknd62z7LFXihgVAjTvWwlAYOP5EOdfCW6Q29o1GCk+IwOtSQZq9HllAsF1LpoP+Uf7dlr+LiriSkp9XE+RUmsqAeO5XvCLiEouWp/FdYuGO+nF9USPvvXf7wYb+Xpvu06WE2ynzpbhnxA9NMtOV9TdW0I9b6W9VA54LDBFhhswRqFYbIlo68nooNOfaW9m5tQitPZFjIDRa/8+FetbzcvIDL/JPBRYtTN1pf938avE9+ga0R5LuVKSuDLFXRvnhVjT9VTQblDT7HP6s29DyXnhyDTru2aSYot88YhN8T7UC5QysU10wjCpnqkKP3LXtaSzAEPRefS1fVEFA44C2QV5dfT0UdDVfdAohON92ge0/HO/4moR5Qc9dGP4tlLMmbELueifPJ49Kkb+90u43mxVbxR+Jqw9+u38jts5bguw0YfUlyaJlDFvCMM2rbGGz7Zb86+r1+LX2ayECBB21ubvw98p+usVhFCKfMkkBUOXR5DRU6Rubad+DDlQ/NiSOwfI9HTEVHQ2KdzkkR6KlU2ByzFcyfDBVIbM2WrozWwhEpz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261026140227099003)(56012099006)(261026121527099003)(261022105027099003)(261021123027099003)(261022075727099003)(261021135927099003)(261009223027099003)(261021121427099003)(260925022911599003)(260925021311599003)(260925021911599003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?opzouhm/aTlA/s+6QqgTN8a+5sB3ODyMtZhUQJxpC36uQS4gNf7mjLrdFH6n?=
 =?us-ascii?Q?HQtAYRy19B4A0KAzb9pdqyWCZeGUYmn78H/PQTPdo0PaRE+Iv/ZcSMPhfMCm?=
 =?us-ascii?Q?LgluRDPrH1YrrvwOoyIfv8deOKCTMPP/IgH84/JHcvXBT5w4FRxjtPH9cw9a?=
 =?us-ascii?Q?cBXkqTG3dUSAHYeqAYl0i8PJYZOxcyiybGtYVyq51jfYOOSj3wFzbQZiL2ka?=
 =?us-ascii?Q?WihJ+JOkTYAVWespB8gCpZnhD5gcjzzGi2zA1ckb8uw65GHKpMZTyBEVYIvk?=
 =?us-ascii?Q?tPuLLQRutUq/ili4s6qlVcfhP7NL0gCBI7tc5Aak1mZqkbYy+h+3AK7tHTjE?=
 =?us-ascii?Q?dyPcHCsQDqlFekhPOJGvvA89LElH0BrPpKj0BuNZZapf3gu7nNZgenyX+qhy?=
 =?us-ascii?Q?SbMTt7xbueXJV+K7h2MyEBzI8Kp0mCMOIQ7I/iSgm7rQ2drofsWooTrNmQgY?=
 =?us-ascii?Q?o0pjbsjOsIx6Rkw0/vawg6xa94OJL7gc3Yi+SdluJb636DEv21/oey8c6zJ4?=
 =?us-ascii?Q?BW3hlIB2a1UIp0FE/ZJMdzwbYsz3ilU0MvF9rTSWxRMRa/SjZzHDecdlz6yX?=
 =?us-ascii?Q?00fIWu+HkyLFgyjGwEoReo/udVW0ML4LSfM9LCB/Ey00zLdOZfrNQldxyS+N?=
 =?us-ascii?Q?aNmp04542iXHeRg72s5eCl0RnWqPRswekaP79Lcg3E57T+AXNDZ4cxWxCdQf?=
 =?us-ascii?Q?me2B3b03UE51cbNP7n8fWoOPz1tEkGOdV5vpZU5/0BJT5fKpqS5+w0pvfFfT?=
 =?us-ascii?Q?P7BBYkAXFoF2o4NT273lgSPDBsDq1q5UHc3h5HxOW5VjlNruwXm1deKsQ61B?=
 =?us-ascii?Q?dZB03e8O5iw2vayAAiFmWYSSdH4/BK5kPC3pOv8ttBRQqTIq9B6U8UHnSME4?=
 =?us-ascii?Q?X42bk6q2KBWy5y18R7s3yJn0U2o+GlRRDFLS65jqC8078E79Ur9xcAgyPpfR?=
 =?us-ascii?Q?41idoRFWA3C0bcctixHf/vaXitFhr6e/3OIOb7wvBHX4krZ16mIYC/OkZkRA?=
 =?us-ascii?Q?yGElQRUov1HXYo7Bh+ijBghkxceWlDYdSFBZ4XtqIrgUQ7xgPipPMsbnz+IM?=
 =?us-ascii?Q?m2ESwM+MB888VHaKM3cor1zqnwGXVitt74c8d4Etvh8HAxv2Kvddn03i7pMn?=
 =?us-ascii?Q?CgYa61hgTyeEmHO/tKKZUWB7Q/mAtzAx9mwZoY76BtqBahc1Kcn2yggm4lfZ?=
 =?us-ascii?Q?rHAqUiNoJyJFJxkJFZeogGRYKXHQK9JhHnXi8XGmWxJJceX8LuS8EGxv5kjG?=
 =?us-ascii?Q?xuFQuzQjgQVelbcPMOEr2kxU6gJXbD4DhmnfMNVoryJvORa/jxHAVTH1r72H?=
 =?us-ascii?Q?ZwsbQpsVUky/6++s5XbPH4RhqwxNaI4NENlzoxNxmsx7xQydSj9+GfRJV8Pj?=
 =?us-ascii?Q?MPtGlnRizw97AyhTTt2KeLhi8YPxc25l9K+ixA+I5U/nx0O0ahQ/ZywpK/z3?=
 =?us-ascii?Q?3lWpvEJpgyQ9SXWCTqyHgYxpwOb2y9AU7gAauPdQo+HeuVIK+7jWl0jo8rEi?=
 =?us-ascii?Q?kl4r1YShKBox6ulTmT7qnh5fpim3qsfp69peqF93np2ipIUKqjW34GlgqiYV?=
 =?us-ascii?Q?gRyfcescWORUrj6LrxM8hLKBKqE5UARe/N7cDV5JOILFejxUcUXpmufqZB9T?=
 =?us-ascii?Q?jUdtgGSHbM4bhQGyMI6BTmYYD2Nyp/nw7TmvCyGle+VlgB6wI6m2hZii7+pf?=
 =?us-ascii?Q?6WqKY31633HT0AFj7TzaAmBatyxQk1P2iPbgVqUSbxVECyMGJHNVYk8JloQH?=
 =?us-ascii?Q?RVffjmb9lQ=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48966cc5-3f62-4d8d-d24e-08df3378e2f8
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 15:50:40.9060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xgcbVv5W+6JBIgYKbhON75ZV2HWUoDLAqFmP/OEJ1Wbzu7OQLVNEwLqBx3haO96LvB67Rtz6JeMiG7Ely4Kfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P123MB954970

Currently, wq_dump.py displays static affinity scopes and pool topology,
offering no visibility into in-flight work items or transient pool
states. Enhance wq_dump.py to:
    1.  Distinguish between normal ("bh") and high-priority ("bh-hi") BH
        worker pools, and report transient pool states such as
        "draining" (POOL_BH_DRAINING) or "disassociated"
        (POOL_DISASSOCIATED) when an associated CPU is offlined.

    2.  Provide live busy worker inspection via a new -b|--busy
        command-line option. This iterates through pool->busy_hash to
        display in-flight workers, identifying their task PID/comm (or
        BH context), target workqueue, callback function, in-flight
        execution duration, and any custom work item description.

Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
Changes since v4:

 - Document "flags" as the hex pool flags field in the help text and use
   "state" for the decoded pool state indicators, including "bh-hi"
   (Tejun Heo)

 - Compute bh_type once per pool and reuse it in the busy worker loop
   (Tejun Heo)

 - Continue to the next busy_hash bucket on a bad bucket instead of
   skipping the remaining buckets in the pool (Tejun Heo)

 - Drop unreachable worker[id] fallback for non-BH workers with NULL
   ->task (Tejun Heo)

 - Link to v4: https://lore.kernel.org/lkml/20260930143958.252572-1-atomlin@atomlin.com/

Changes since v3:

 - Decode strings with errors='replace' during busy worker inspection
   to prevent unhandled UnicodeDecodeError when encountering arbitrary
   or uninitialised bytes locklessly

 - Fall back to hex(func) when prog.symbol() raises LookupError for work
   functions without loaded debugging symbols, preventing the retry loop
   from exhausting attempts and dropping the busy worker from the output
   (Tejun Heo)

 - Link to v3: https://lore.kernel.org/lkml/20260923031344.60494-1-atomlin@atomlin.com/

Changes since v2:

 - Harden lockless busy_hash traversal against idle-list diversion,
   cycles, and iterator read faults by checking WORKER_IDLE, tracking
   visited addresses per bucket, trapping (drgn.FaultError, LookupError)
   across iterator steps, and warning if a pool dump is incomplete
   (Tejun Heo)

 - Replaced bare Exception handling during busy worker inspection with
   drgn.FaultError scoping to avoid masking unexpected errors (Breno Leitao)

 - Link to v2: https://lore.kernel.org/lkml/20260911210625.535285-1-atomlin@atomlin.com/

Changes since v1:

 - Dropped former patch 1/2 ("tools/workqueue/wq_dump.py: Support
   backward compatibility for wq->attrs rename") as it has already been
   merged upstream

 - Corrected POOL_DISASSOCIATED flag handling. Restrict inspection to
   per-CPU non-BH worker pools when their associated CPU is offline,
   preventing "disassociated" from erroneously appearing on every BH and
   unbound pool where the flag persists by design (Tejun Heo)

 - Hardened lockless busy_hash traversal against process_one_work()
   entry and exit windows (Tejun Heo)

 - Preserved backward compatibility for worker->current_start
   (Tejun Heo)

 - Fixed 32-bit jiffies wrap-around; masked (jiffies - start) to the
   target architecture's word size (jiffies_mask) so duration arithmetic
   does not yield negative values following INITIAL_JIFFIES overflow
   (Tejun Heo)

 - Link to v1: https://lore.kernel.org/lkml/20260831181554.117795-1-atomlin@atomlin.com/
---
 tools/workqueue/wq_dump.py | 84 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 81 insertions(+), 3 deletions(-)

diff --git a/tools/workqueue/wq_dump.py b/tools/workqueue/wq_dump.py
index 9313ebe0c525..f81d6ee01c79 100644
--- a/tools/workqueue/wq_dump.py
+++ b/tools/workqueue/wq_dump.py
@@ -23,12 +23,17 @@ Worker Pools
 
 Lists all worker pools indexed by their ID. For each pool:
 
+  flags     pool flags in hex
   ref       number of pool_workqueue's associated with this pool
   nice      nice value of the worker threads in the pool
   idle      number of idle workers
   workers   number of all workers
   cpu       CPU the pool is associated with (per-cpu pool)
   cpus      CPUs the workers in the pool can run on (unbound pool)
+  state     pool state (bh, bh-hi, draining, disassociated)
+
+  If -b|--busy is specified, lists all busy workers currently executing
+  work items, their task PID/comm, workqueue, callback function, and duration.
 
 Workqueue CPU -> pool
 =====================
@@ -49,12 +54,14 @@ import sys
 import argparse
 parser = argparse.ArgumentParser(description=desc,
                                  formatter_class=argparse.RawTextHelpFormatter)
+parser.add_argument('-b', '--busy', action='store_true',
+                    help='Show busy workers currently executing work items')
 args = parser.parse_args()
 
 import drgn
-from drgn.helpers.linux.list import list_for_each_entry,list_empty
+from drgn.helpers.linux.list import list_for_each_entry, list_empty, hlist_for_each_entry
 from drgn.helpers.linux.percpu import per_cpu_ptr
-from drgn.helpers.linux.cpumask import for_each_cpu,for_each_possible_cpu
+from drgn.helpers.linux.cpumask import for_each_cpu, for_each_possible_cpu
 from drgn.helpers.linux.nodemask import for_each_node
 from drgn.helpers.linux.idr import idr_for_each
 
@@ -62,6 +69,10 @@ def err(s):
     print(s, file=sys.stderr, flush=True)
     sys.exit(1)
 
+def get_hz():
+    cs = prog['clocksource_jiffies']
+    return round(1000000000 / (cs.mult.value_() >> cs.shift.value_()))
+
 def cpumask_str(cpumask):
     output = ""
     base = 0
@@ -84,6 +95,12 @@ def wq_attrs(wq):
     except AttributeError:
         return wq.unbound_attrs
 
+def worker_current_start(worker):
+    try:
+        return worker.current_start.value_()
+    except AttributeError:
+        return 0
+
 def wq_type_str(wq):
     if wq.flags & WQ_BH:
         return f'{"bh":{wq_type_len}}'
@@ -118,9 +135,15 @@ WQ_AFFN_NUMA            = prog['WQ_AFFN_NUMA']
 WQ_AFFN_SYSTEM          = prog['WQ_AFFN_SYSTEM']
 
 POOL_BH                 = prog['POOL_BH']
+POOL_BH_DRAINING        = prog['POOL_BH_DRAINING']
+POOL_DISASSOCIATED      = prog['POOL_DISASSOCIATED']
+HIGHPRI_NICE_LEVEL      = prog['HIGHPRI_NICE_LEVEL']
+WORKER_IDLE             = prog['WORKER_IDLE']
 
 WQ_NAME_LEN             = prog['WQ_NAME_LEN'].value_()
 cpumask_str_len         = len(cpumask_str(wq_unbound_cpumask))
+hz                      = get_hz()
+jiffies_mask            = (1 << (prog['jiffies'].type_.size * 8)) - 1 if 'jiffies' in prog else 0
 
 print('Affinity Scopes')
 print('===============')
@@ -165,10 +188,16 @@ for pi, pool in idr_for_each(worker_pool_idr):
     pool = drgn.Object(prog, 'struct worker_pool', address=pool)
     print(f'pool[{pi:0{max_pool_id_len}}] flags=0x{pool.flags.value_():02x} ref={pool.refcnt.value_():{max_ref_len}} nice={pool.attrs.nice.value_():3} ', end='')
     print(f'idle/workers={pool.nr_idle.value_():3}/{pool.nr_workers.value_():3} ', end='')
+    bh_type = None
     if pool.cpu >= 0:
         print(f'cpu={pool.cpu.value_():3}', end='')
         if pool.flags & POOL_BH:
-            print(' bh', end='')
+            bh_type = 'bh-hi' if pool.attrs.nice == HIGHPRI_NICE_LEVEL else 'bh'
+            print(f' {bh_type}', end='')
+            if pool.flags & POOL_BH_DRAINING:
+                print(' draining', end='')
+        elif pool.flags & POOL_DISASSOCIATED:
+            print(' disassociated', end='')
     else:
         print(f'cpus={cpumask_str(pool.attrs.cpumask)}', end='')
         print(f' pod_cpus={cpumask_str(pool.attrs.__pod_cpumask)}', end='')
@@ -176,6 +205,55 @@ for pi, pool in idr_for_each(worker_pool_idr):
             print(' strict', end='')
     print('')
 
+    if args.busy:
+        incomplete = False
+        for bkt in pool.busy_hash:
+            seen = set()
+            try:
+                for worker in hlist_for_each_entry('struct worker', bkt.address_of_(), 'hentry'):
+                    addr = worker.value_()
+                    if addr in seen or (worker.flags & WORKER_IDLE):
+                        incomplete = True
+                        break
+                    seen.add(addr)
+
+                    for _ in range(3):
+                        try:
+                            pwq = worker.current_pwq
+                            func = worker.current_func.value_()
+                            if not pwq.value_() or not func:
+                                continue
+
+                            wq_name = pwq.wq.name.string_().decode(errors='replace')
+                            try:
+                                fn_name = prog.symbol(func).name
+                            except LookupError:
+                                fn_name = hex(func)
+
+                            dur_str = ''
+                            start = worker_current_start(worker)
+                            if 'jiffies' in prog and start:
+                                jiffies = prog['jiffies'].value_()
+                                dur_s = ((jiffies - start) & jiffies_mask) // hz
+                                dur_str = f' for {dur_s}s'
+
+                            if bh_type:
+                                w_id = bh_type
+                            else:
+                                w_id = f'PID {worker.task.pid.value_():<6} ({worker.task.comm.string_().decode(errors="replace")})'
+
+                            desc = worker.desc.string_().decode(errors='replace')
+                            desc_str = f' desc="{desc}"' if desc and desc != wq_name else ''
+                            print(f'    busy: {w_id}: {wq_name}:{fn_name}{dur_str}{desc_str}')
+                            break
+                        except drgn.FaultError:
+                            continue
+            except (drgn.FaultError, LookupError):
+                incomplete = True
+
+        if incomplete:
+            print(f'    warning: pool[{pi:02}] busy worker dump incomplete, please retry')
+
 print('')
 print('Workqueue CPU -> pool')
 print('=====================')
-- 
2.55.0

