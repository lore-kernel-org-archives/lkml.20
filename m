Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022080.outbound.protection.outlook.com [52.101.101.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E0845D922
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789160800; cv=fail; b=bK6afzhT4DGkaBylMlYBZqTx8BQ9B/Fby4EtQjf2vIiQN4qS8eak9urDHhw8lV6aL4ssCaI2wn6Q/nQ6fDNTHnXj6QPGhPOo0sJTQvmkL2zxJ9oiqf8DSUtyNaz55NO4GRlNhYgYiqd1J43l7V4SJP9y9Y8F2M8OygvvCOWfjrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789160800; c=relaxed/simple;
	bh=uijcNaZUeRd6636Y22IsT2xmd8/z7WQfDRXCKhJrWE0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fgo3nHzdnHoXNClWk3ISeXk/t/PeJvH5y+h6UBQqIVLx56GUCgnr8I3WMFOMz25aa9AfAf7wZKaQtaINDMeFCmHjJ0WRYpxu3J258Wiya6aoIHe2nKC3mwE9dWe0PgybChFPl1vuSbHApC1sRsgalhZnnwuFVQ5ZBoWfK/wxqz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5pwt1+dthUQe9UsY+jazSHCThMMmesObBHcsk3/PdiBIkXmHorGkw44ocbayQCnoieSF5UVHZRqMEPnftxxhzun9zCmEE/fNWSe2kuXuwbwd+gDyBiHKXPuRSRXQIINnWYKZkX6WP+68wOADDUJi61KWqiadoK7IqqALSsetWEbCvyQRDw/1F0QzXm/xcrayyt47rCb2hNKVS8L4fiqNUvXlHbq/DYB86Dtd/YXBJJP5CFeaWhSEnkjPjiD8aM7dW3tZ2kODCe3RuCYNVZxcAL9j7eXGLRHOVJnwM4ACynM03nlKpB+J24W3ybE7KLRjdWSO8YMCa3OCTfJIS6cEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=1J7gU8RwPsPPx/Uv7J+RGGHDwb4RJC/B/R+sK9d1pEY=;
 b=urnXHqBG8yKbH+eqhs64YFhkXeTgb/EnIz0hxVX2sB+ItfbsVcQiwG5BchiwEh9UrdRMQoSAeyic4yB7iH+aDsdlwzqmWXDYUnsBf4j5DhY3mOT+2wAOTv8+rXWoYmga5AvUiC93pw2VT2+WHL0prIfK4e6SlUpDkIJmAHfE8bb2rKA6+gkBQ3x+omSotWgDJG0Fv46MGAfe9lmyxymJ4Nv2ye0Gu1SQnObEu2i/vF0R2p6wxOy0jWjyTfVsDr4Z/kGv1VuuG6ZgQiG8aUNN2S2uZHRuusZvW+pqVnDqULd317S3sjExkd0w+dFcfX/IlhrrVHGBob/zaOOZKbfhyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO4P123MB6321.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:293::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 21:06:30 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 21:06:30 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: tj@kernel.org
Cc: leitao@debian.org,
	atomlin@atomlin.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] tools/workqueue/wq_dump.py: Add busy worker inspection and BH pool states
Date: Fri, 11 Sep 2026 17:06:25 -0400
Message-ID: <20260911210625.535285-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYXPR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:930:cf::21) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO4P123MB6321:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e912f7d-6955-4a04-253e-08df10488d0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|3023799007|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	+xIB9eF+aOVV6+6u+r0rnZhnM8ue3jZ68pPWcINw4jKXgsELa/nK6MoOzdOv7rtiCCBLHQTdOtPhAwGjFFYxuUFavwji0wEiONWTx+q3Jfkw7lYitgmxYbAr9DIHoMWnUjpHDMmWY0c0QSl/8GfofkGnhDLqMn6IJHkr4xY1/c0O4E9flK6jDwwy0LtQrAZaLO7nCrUMxIsb9qXvZC4bvvbEm+VaXmYn0M1s70wNpzCy4QYOimCGBNwsHFkCUrZHxUiquIq84rXLUoSrDjEmBTfrqpjZW68gJ/iPr/WKQFdPkTkOwm6f+ZJz/tNbYHGN/PkiQSvLybIe2DNCjyEto+8RUqbsrcUhSZY2pBgqg+H50iOLn2Vap08aQWAMC6rvIe3QYzqpZr4lqu3fceASkMCOaJwwapZ2KLI+aDY1tYTrU+D7lRo3uUPQs2W1Vl7GDDGW1MSigLFCWXewBNJg4vHylxtAVFCjXElDmKgSuZEjmo/fJ0x6fRoxjl2PLEJ4ZOIbpW8kqxpzvdh0ogYXERKpgAB88khhpunk8jMwZoLDHKykKxGPAJcfwLP4EGsVx5EbjOMbB42PfPLSmijzWcYmSCGIECUcRC9w1ga3AK1ODudKb2hVTd6e3fz2XORpEq8KGHuI4gx4IHvwv2wu146cj1twN4g+sv7wCgfn8x0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(3023799007)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pixDnykn/qbHkx/KVTEiX4Gf6iwOwY4mkQRgwgr8yYVVh+R0G2UDS5LMU8ko?=
 =?us-ascii?Q?MemCl0+BtkC24GSKj3qFFZ4AFLVnylwA7XojJj3IyDlb9pPtsPycXTezUULS?=
 =?us-ascii?Q?YWBjbgPIUwB+Hcrp9O/afxygoNRu2cdSbSI5G+S4EyM0Hk+V2DF/SuwOzGS3?=
 =?us-ascii?Q?wlASUipIrPDDraaHRS+DjNtgRY0V6EgnIOlEIjtshRFYX4Mn+TNahXQ3gqn6?=
 =?us-ascii?Q?no4euAY9iIc+YPKsQP/IdaqKyphgDu2P8uta6l7y6xReDKcElUpR6uO0boz3?=
 =?us-ascii?Q?K+OqP6R7r4+0NuiOfsVV4zB2+LKyISSzggSxbdfLw7OMdiephiFn5P9pzGfG?=
 =?us-ascii?Q?oLftF4eU1ypG3rl/c2Ji2/l50lwQShMTJxBq82QjbjUM/PC3I2iZCeIajXdH?=
 =?us-ascii?Q?LfSFThVpDZ9HrgiZ145nMIw5CMEoDPYtWs59cipk3PIZHXvD/pS9G2yKI9+e?=
 =?us-ascii?Q?1lllLlzQeNaZEvDK0FG5f94S1QvTE8vZS1P7wxpV+TUJzzuIv4Upw6dplBoX?=
 =?us-ascii?Q?uk0X88+GjEZD7CZO1TR2ZkPMsBt6u5RBBUKMgDkA3W0TzU7TeU+A6tBZTsxf?=
 =?us-ascii?Q?us2E/GO6uTuyxYt3ecLk0oqswKJOn1iTgC957sqqBoC97Xe9ZadWZAs1epIj?=
 =?us-ascii?Q?Nh4BY7ywq7SqGU1y4EKWO7c8qHYY/EtismyRp0QNzPikRshb+4KX8nnXRMl4?=
 =?us-ascii?Q?wjVPtmD8tanJPVmNF5BPic82j6ghYYEIEDklsPK1mwfIdjcRlB5h/eInkJtH?=
 =?us-ascii?Q?wbiSJG237plS92psMsYxjkawxwgxvI4cqGL0GEJoGNQ12EDePf864EIwr+Gh?=
 =?us-ascii?Q?VODPeYTSAZCCIPYkrYVUAeEEOOvuUr6Y5CR4pYmhptofR0BLIaOePso0Swqh?=
 =?us-ascii?Q?2HGUzFtnc8LlQHWDlSne0j/hHyUKeCMXHM5vJIKUZaaCmCqm9GDmMwkymPO/?=
 =?us-ascii?Q?QAjhB2jXeuWsKO3bi4dI1Q4swznSOIp+bAvR46FwhPLV2p46D2jTidiMghmk?=
 =?us-ascii?Q?EvHN/b+2JbEheOIqR8oHfE2jDB+TQSJr02bC2kcs1IzrNiQDDqWDSkD8huQH?=
 =?us-ascii?Q?otFuFVHqn704dVa5UpiiRR2SxL0+YEPQvNp0eufcZl9Ob6+NvbbgR7DQCAKe?=
 =?us-ascii?Q?tf+uBLNNzuns8ILxlZhLCjqmhTy6sjOlEHhBG5wA99CjkeE2LGSSlCc2dIk6?=
 =?us-ascii?Q?zy1CKW+FvWY+0CaHWZjusiz6k5M7fKK5OeX2xO04qqD/x7htG9Sy8i6eRgZH?=
 =?us-ascii?Q?JSw6jRhxW9qGeXP7GPOmFBIDMm9jKYR66YQIcpaJjiVv0snke+kb8mYeI4Tf?=
 =?us-ascii?Q?9rpAJYI0xbDKrsEiAlsqLTG4/8Fx7ANFZuYpO8mgoEpOK8Qqi5xf6L3pNK75?=
 =?us-ascii?Q?RaB5s5O2ksfhanmmUAM3kza4mPAg7vZaOeDx/+P3JXMCoiZQzzB22XCNxOXW?=
 =?us-ascii?Q?F8DD+YUCz6Jd8I5+t2cIpCcsCZBNkodp7RWaRD2KLg9SDLnlB7bOvfTxBYfi?=
 =?us-ascii?Q?2173360xEvSj8dhZcs195nWTSRNXauKYZ1SdWdzo2pO8R6Qf7easTG4Y4K4G?=
 =?us-ascii?Q?6PZcRvGMQOKjjLHA8vWtVfJL+AYgGhVktIAdArxdTA9LowTHMyD7/NevpmVX?=
 =?us-ascii?Q?VIptWiaYdxMhv9aRPn/7qD36Tc7qFuqww+xxnwJILiej5Eeoqjtnw7IQHRxn?=
 =?us-ascii?Q?6fIyzRaQFTUtcppHdJ3nKpUYA4Uca8oHsjARRMxH73d/rDvNbcxdKnqmKUc0?=
 =?us-ascii?Q?QhyOzi8VDQ=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e912f7d-6955-4a04-253e-08df10488d0c
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 21:06:30.2794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJr4KBILaXorkuqi3N3i7UCcG1BK/HGwWq7dVRUTsP7zwNF/V7Vq03iwlbVytsR5J96v2wRJw2sCOi9WmXxjvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P123MB6321

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
 tools/workqueue/wq_dump.py | 66 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 63 insertions(+), 3 deletions(-)

diff --git a/tools/workqueue/wq_dump.py b/tools/workqueue/wq_dump.py
index 9313ebe0c525..c5659c9d9273 100644
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
@@ -118,9 +134,14 @@ WQ_AFFN_NUMA            = prog['WQ_AFFN_NUMA']
 WQ_AFFN_SYSTEM          = prog['WQ_AFFN_SYSTEM']
 
 POOL_BH                 = prog['POOL_BH']
+POOL_BH_DRAINING        = prog['POOL_BH_DRAINING']
+POOL_DISASSOCIATED      = prog['POOL_DISASSOCIATED']
+HIGHPRI_NICE_LEVEL      = prog['HIGHPRI_NICE_LEVEL']
 
 WQ_NAME_LEN             = prog['WQ_NAME_LEN'].value_()
 cpumask_str_len         = len(cpumask_str(wq_unbound_cpumask))
+hz                      = get_hz()
+jiffies_mask            = (1 << (prog['jiffies'].type_.size * 8)) - 1 if 'jiffies' in prog else 0
 
 print('Affinity Scopes')
 print('===============')
@@ -168,7 +189,12 @@ for pi, pool in idr_for_each(worker_pool_idr):
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
@@ -176,6 +202,40 @@ for pi, pool in idr_for_each(worker_pool_idr):
             print(' strict', end='')
     print('')
 
+    if args.busy:
+        for bkt in pool.busy_hash:
+            for worker in hlist_for_each_entry('struct worker', bkt.address_of_(), 'hentry'):
+                for _ in range(3):
+                    try:
+                        pwq = worker.current_pwq
+                        func = worker.current_func.value_()
+                        if not pwq.value_() or not func:
+                            continue
+
+                        wq_name = pwq.wq.name.string_().decode()
+                        fn_name = prog.symbol(func).name
+
+                        dur_str = ''
+                        start = worker_current_start(worker)
+                        if 'jiffies' in prog and start:
+                            jiffies = prog['jiffies'].value_()
+                            dur_s = ((jiffies - start) & jiffies_mask) // hz
+                            dur_str = f' for {dur_s}s'
+
+                        if pool.flags & POOL_BH:
+                            w_id = 'bh' if pool.attrs.nice != HIGHPRI_NICE_LEVEL else 'bh-hi'
+                        elif worker.task.value_():
+                            w_id = f'PID {worker.task.pid.value_():<6} ({worker.task.comm.string_().decode()})'
+                        else:
+                            w_id = f'worker[{worker.id.value_()}]'
+
+                        desc = worker.desc.string_().decode()
+                        desc_str = f' desc="{desc}"' if desc and desc != wq_name else ''
+                        print(f'    busy: {w_id}: {wq_name}:{fn_name}{dur_str}{desc_str}')
+                        break
+                    except Exception:
+                        continue
+
 print('')
 print('Workqueue CPU -> pool')
 print('=====================')
-- 
2.55.0

