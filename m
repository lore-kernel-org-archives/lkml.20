Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022119.outbound.protection.outlook.com [52.101.101.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0A74DDB5A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779226; cv=fail; b=LK/xhFbga6ovdKr2HPneevrbITdRQZrUiMo9DLrbwKjWlU4JVY9+P0NJuDsLodU5+HspCq+2qt8oQBB9d1WRYha5k90sn5NTant5HqgXe2WNeqj3WmacaLQMQL1wcz3sVNJgL86le2DVhf4VobDt5fBY3USe6JR5SGVfuT2iKMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779226; c=relaxed/simple;
	bh=ARrVfN+J0Mct/Xf/VWyj2J+qRXi6/57aZZfd/dAHR5o=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hgBGksJI1fipFIQRi4PsX19zaP4b3spFe78tnlF0sEtnCc9vCltppwyv7f+ZW4RaJ+Fikrf1XuTbAcSw4dHunbI/ZUYAyGaSpHZPXKnz/lmZCrr0Asl8HhNIqknB8DhVfk42kf7sL+Kep6JReIpZsMcKE8d6qFt7vL4E92wQwNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uaUIExpnJNBsPGm6Bmx2WAi+9wMLSWW981ukW1F3tDI3pYcNDf3KyE7+GluxyB+0f6xFnjWI83TlkkkrYI8VcQURaGat9PdgRMJgl+gZhZpe0XtTVXNKVJ9P6muwh2lZS+H+0aPrOrO8aEGUfHst/JMpPOixBL91z0lijtP+gy0OAh0K3rBGPyyJXzsIKYJYkka4iYp5Ao0FWml3lfNJFiZvNuJ49Mg/QPLNZ/A5WEWXyqGH4u5tRSjLQctc3ZLy0nV75xotPJGDKp+PXJJgBXZAHf2aiARCU1KQv5tPIJjLGOqBblOhI2/ncFa5Ne0N95IVfn8QbqJKpaoyjscnWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=uOnLvuCdcVO4UbGPPItT4lTyP9nYg1f+vwAIvvIHt2Y=;
 b=VYu9h2wZ3ih9RkjYM6hOdkWLrVix/RtxTTDCYF+HEjYfElPD1P99fmvRjr6HQv0Ih5CiofDXwQlC/zEi4akwQ7PVChCHlFev55ZfkHKKPibz0a3E88PUscKNTYgAKZGbZJhDadre9uFXO03G7adO3OmM3iRQq2A8vJHuKXF9jethvXrL3DPHJEh7fS97Bd7wp9soGLsEgUR2jmtiYM+LgvRdM9GAke2dcRdRcZ+opEQcN41+/iUgbzZP99q0b3/D+3xHNVXPuJkJcTKyo70++/3Z7FTujbikAd31CA6QIKmocaAVLbGGUpb6CAEwhBQkIQh3e3gAYd3Hx/8xXk1taA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO2P123MB6056.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:25b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Wed, 30 Sep
 2026 14:40:02 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 14:40:02 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: tj@kernel.org
Cc: leitao@debian.org,
	atomlin@atomlin.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] tools/workqueue/wq_dump.py: Add busy worker inspection and BH pool states
Date: Wed, 30 Sep 2026 10:39:58 -0400
Message-ID: <20260930143958.252572-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0146.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::28) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO2P123MB6056:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b354baa-6556-45b1-090a-08df1f00b61c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|3023799007|260925022911599003|260925021311599003|260925021911599003|56012099006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	J3RLKrJTRuuU+HqPvZhrDDPMPQcG5iz7lCLQ4Yz3VVmDN9tNl+PBzU+CeFwzz9MN2ep4HhYUsJjC7cEaXk+vu3Eu6OjhgQiZ6GdxNDV1C9lOsDofoqXxxAHZjVWg4hneZwftWDdQvC4zlHUTac3NAXS2RgN57DnfJbbQpeQc/VZ0eDm6HIWgt93j58G+z7sl+cerqgPHBBoKg30GQBJsMCxa0beKE0ZewdYlbt9bd4iGxKI3lGzCEEEl7O+YpPKcxKh1ZOJ7wpkOKmZpglJnJfIVk0v+uUufSP0GMcUX1i4jq0CDwVRAa6GC2x3BlQ0zIMXMYVSsEBH90KEj0XMSyXnGTHZHJL1sd6CpEqrxuz+kbZLOskrkx0H59VtCfhjrAtSySpIKreAMKiJGyVIjtUpChNJmEG5MgSq/9d3f4zZF3/nJiHvxzsDoXWF1iRTynvO1OxrJy/ynDbL9S350E0t4x3RcvHxiUmHXeLxm3sJkVIp1ad2wvnZm1AxCuqq7p0Ekxk20S2R4r912Cf6c2GjTStrvZeXB1kEHImWVIzMhJ+7HQnBVmaaWDc9G6va56ChiOO0weGNcfgmJCnJ6AVEhREkrgeWSsCVIwEDM0dXj7KdpYUHH3XpXrhtSyERuQl9r21It7H30P2CSaAV0NuxL1Xd/57+p+sMq6+r/y9Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(3023799007)(260925022911599003)(260925021311599003)(260925021911599003)(56012099006)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?moXgax0rG3Azw3MidYrCVHpoeE/0mR2FkU67x5EbG/nny7+GaGAMSa1PXKpI?=
 =?us-ascii?Q?5/a3Dqg3Jf7YFoWig4x01IJl1YxQ5tWSJTnpuyLs3eI288NC5ChfCK9IwxOs?=
 =?us-ascii?Q?DgiQIX49mpInqMFHZCIwlmreB/9xXtToiN26E2D11r0Wy8fJbN6FVXYTqqKf?=
 =?us-ascii?Q?MGbmAKm5fvlbOrBgVTic31DhRkIDMkPoa3+wHpC6OXdj3VjN2E79JcTev7sX?=
 =?us-ascii?Q?kUPU72y2GYMR7+OsjzhO90T6nYJFaxyyYAQ4wJ93Q6nKyRr44200LSPuP81p?=
 =?us-ascii?Q?TPs2lCFg5RLyDnQ/VwHUem0o9v6O0joPnIJjv/XyJvgh8H7UqRNEXY5ZqTYp?=
 =?us-ascii?Q?8xcxHexmLPh0QXhZkkzRuynVkKR+/rsh0TZaGyhscnNvORE2jN95LfusfYKb?=
 =?us-ascii?Q?0xdMQ0shloHsqgm16SNbKtOzyORXYhNTeFYO6QjyMwkx8CqdA5qoQcv1Hkc5?=
 =?us-ascii?Q?s3VifY9ZYMfFKZeujP+wwR0AkthW6i11zKm73gT7jIIwqlYiAJ4HLCdEeMg9?=
 =?us-ascii?Q?oj7S3QncFmO7cr8ZivQu1xkkYN7+qOXdll7DSfCMQQlvtVpraxjXLl3XgtYl?=
 =?us-ascii?Q?bqbwvXbF+p0kxd38j4SS8t+KM3EUu4eR76DD9GWP+FIY2rbywz0w0juLwCPA?=
 =?us-ascii?Q?Jczy91RQ1qqSvmp5osNIqLkoRAoVQYpZDN7PsR99F3dLJnKcBw6aEByyCNNF?=
 =?us-ascii?Q?5Q1edzTBTv7NGhLN9giB3C/SJzRTAemSdgJipv64mWmj6bxGnGQpVsvGW585?=
 =?us-ascii?Q?1ik1BRVuC2l7HnihH4kE+7EKUPFlgJnvNRbqgk93WPnlUXl+2DOrqSR+wSGA?=
 =?us-ascii?Q?CBpGs7QQi8seDUdfOqnNL2G7grcKq8TByoQKJ/l/5t9fpOh7RBrMWi3vfzSM?=
 =?us-ascii?Q?oVaPtIhBFYASde6dGm9paHh1TnoLQjO4uxnMFWKoOZHsPGMqlxd5AzYvx6Jt?=
 =?us-ascii?Q?JbplFgPxl69EXfYzuVi4Zu+4nb7DDbrA9+b2BkA3kiUhOiOT+nZNIoer237k?=
 =?us-ascii?Q?9FpxiYMkRox9O1hPfpNiOPGyVy3G5UduMB0NgTXCSixlysnJYsk+ecEz0rQf?=
 =?us-ascii?Q?oRY+ac780/zlRnCiUziyR1UvbsKmcNf+pC/uhcifgVxBcOeXeVAVvXeG8vGX?=
 =?us-ascii?Q?jVRZD1SiaK3RBew73q5TkjNiMcmxUJk8/Fw2ssE7pe5vh4+/lqaYYJ6AJQse?=
 =?us-ascii?Q?aZp2iZ6JNBMpZ8ipzTbfXn8r5EJZ/U78PYVoXs25VpY79OO93cJkVPcROwyV?=
 =?us-ascii?Q?nxwjxpOfzbRMKXN+fRJTYaZxNnxiGnv3j6RM9g6BJiutsHhBSfNBsJpzlC78?=
 =?us-ascii?Q?qBWKGOb3XadKWiBvZOwtdz68M6rC5lo8ydoNi7L+RhC8gKvnUxBfdb0LXzuo?=
 =?us-ascii?Q?YStioKKIrH8FFf00neAi+N9+AmbewYCl7JfvXuMbXMtg4sC4epmLTHLiXqMf?=
 =?us-ascii?Q?g7WDL71cm5bIGdtsG/mathxOSEbmxce21DCHPp4zD5u4VgxrX2IPWgzrCkso?=
 =?us-ascii?Q?IbMSsZ5ncOCVgLdBzJxYtKCIzBPduVZ4Nt5sXp/ZvExTOTcF8ECEhgZc9XGw?=
 =?us-ascii?Q?7EYS7TRMOQ2CdlTkR9UjNZRTV5hpnuAWDNUf67tCqvOkgj6akHPULJOf24RY?=
 =?us-ascii?Q?GbFwtw22v7ZXyJXydb2G9ooCeT556vDNzgLxo+J9h3/Dh3liJE2sk8t9m76W?=
 =?us-ascii?Q?W0r4gx5QJUVyxwTMjldp0myaiyTY2jsA3EbBjDICjDb1lsxIjVHI/32rThV4?=
 =?us-ascii?Q?LASVjPboiA=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b354baa-6556-45b1-090a-08df1f00b61c
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:40:02.7357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T65eRezKk+Nw58lm2VisnuBkbQBjsCZa1fF03XkIT80xfSaxLA1DsnsXihrT638ZpXh+lELEHoe0nGH2cBirCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P123MB6056

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
 tools/workqueue/wq_dump.py | 87 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 84 insertions(+), 3 deletions(-)

diff --git a/tools/workqueue/wq_dump.py b/tools/workqueue/wq_dump.py
index 9313ebe0c525..ecdc434f1989 100644
--- a/tools/workqueue/wq_dump.py
+++ b/tools/workqueue/wq_dump.py
@@ -29,6 +29,10 @@ Lists all worker pools indexed by their ID. For each pool:
   workers   number of all workers
   cpu       CPU the pool is associated with (per-cpu pool)
   cpus      CPUs the workers in the pool can run on (unbound pool)
+  flags     pool flags (bh, draining, disassociated)
+
+  If -b|--busy is specified, lists all busy workers currently executing
+  work items, their task PID/comm, workqueue, callback function, and duration.
 
 Workqueue CPU -> pool
 =====================
@@ -49,12 +53,14 @@ import sys
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
 
@@ -62,6 +68,10 @@ def err(s):
     print(s, file=sys.stderr, flush=True)
     sys.exit(1)
 
+def get_hz():
+    cs = prog['clocksource_jiffies']
+    return round(1000000000 / (cs.mult.value_() >> cs.shift.value_()))
+
 def cpumask_str(cpumask):
     output = ""
     base = 0
@@ -84,6 +94,12 @@ def wq_attrs(wq):
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
@@ -118,9 +134,15 @@ WQ_AFFN_NUMA            = prog['WQ_AFFN_NUMA']
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
@@ -168,7 +190,12 @@ for pi, pool in idr_for_each(worker_pool_idr):
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
@@ -176,6 +203,60 @@ for pi, pool in idr_for_each(worker_pool_idr):
             print(' strict', end='')
     print('')
 
+    if args.busy:
+        incomplete = False
+        for bkt in pool.busy_hash:
+            if incomplete:
+                break
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
+                            if pool.flags & POOL_BH:
+                                w_id = 'bh' if pool.attrs.nice != HIGHPRI_NICE_LEVEL else 'bh-hi'
+                            elif worker.task.value_():
+                                w_id = f'PID {worker.task.pid.value_():<6} ({worker.task.comm.string_().decode(errors="replace")})'
+                            else:
+                                w_id = f'worker[{worker.id.value_()}]'
+
+                            desc = worker.desc.string_().decode(errors='replace')
+                            desc_str = f' desc="{desc}"' if desc and desc != wq_name else ''
+                            print(f'    busy: {w_id}: {wq_name}:{fn_name}{dur_str}{desc_str}')
+                            break
+                        except drgn.FaultError:
+                            continue
+            except (drgn.FaultError, LookupError):
+                incomplete = True
+                break
+
+        if incomplete:
+            print(f'    warning: pool[{pi:02}] busy worker dump incomplete, please retry')
+
 print('')
 print('Workqueue CPU -> pool')
 print('=====================')
-- 
2.55.0

