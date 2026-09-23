Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022113.outbound.protection.outlook.com [52.101.96.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE4439B947
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790133235; cv=fail; b=tD6dzKumS+ppNf9xaJzjcnVwHYH1L8G44nGx7v4+EuuexEmRyT4E/684dkO1JJ5iY7AS1hHeboj2FXRaG/LripBjDLv8XQ/hVanrwP9Bl7sgmhY3e9g/wMwktHfcGnmUqMggBYszICSB7ubjcbyLD2rYJfa7UJxLxzq7GLmWzZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790133235; c=relaxed/simple;
	bh=mZzCgD47rubxBvoHJo2Gir7e6jpQ5KvmADHgBhaYvoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=f8dqoeMzfzWydubAV/yAeA+5jiVz8Eg/dRLSKUq4hPV/AwZW83NoUNkMtkgtLkLWCf5NAHuuvEbBwhN4o0CMm6910bRxqrhbLvIvyqTe+WppqbnHREii/8uMJGI/Jam/fJwvsv3ihvAw6KHMsQEbwawgCcncqb8h4AelKIUy1oo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.96.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGlgW1cZtd1SYJ6e+W0QVN5BcZyJkRwqJdkVkZllHQcXH3kFknXqhU6rC8QROsXQdm1+6DLHbqY/2ohS4J+oWk5Jb6LGJx8TV2ZSh/6U+FtEY1Yn4DOWkk8wKG2E+CDz2ZSWpXzU6/BPxCvfRXdqQtAyXweq8o1HbRXYyVZttVpLHzrP3UGBdasfbHEPCTf1Z9tNDm5g022vZRpJtmhv9ZlIUEu85v4Di2u46iKpFo6EhpLLVBFKx6CPSURm1jjBTsGKILlTg+kAcDJkwfRuGTxznhliTTOHx7dWm/+2Q+5jNxaeX4JqaaE50vY0ZfBT5wYHc/Kc3UyjVqAUasqJ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=qU5MWN3zMnr+5dtOSqvmuoYBymXqsntIe65yMidAfHo=;
 b=AcQBgoVVAOXS26Ox/Tp4TRA0z15M2qpKe/h+hWxtaeTWNPh4McV7Eby8bI23LmhYp0Ouh5Yt5avPDy4vmCuemCm/zdy8oMBNU7rmorN+mk6RCcqb6x/Ut/yvBgTqvuZbft/avN/6wqZUlsTMRBDeXxpUWM5i/vqSpQsJNHzJBSXFL1jIDjOqcA/XAZZVSZ+qn9JY9o5r37qX3oPotpX0aQs/yifRwp+hFax8gvmDwij+TTrNcwznyLlN7n3hmOPp4PsC/YZAfAXRiloMMsJcp8on5UoktdYL+a7AMWqSNdARSS5A+lvFsoKGfukSPADfF5kKbuUA/zY7fIysA9E1nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO3P123MB3498.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:103::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.15; Wed, 23 Sep
 2026 03:13:50 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0428.011; Wed, 23 Sep 2026
 03:13:49 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: tj@kernel.org
Cc: leitao@debian.org,
	atomlin@atomlin.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] tools/workqueue/wq_dump.py: Add busy worker inspection and BH pool states
Date: Tue, 22 Sep 2026 23:13:44 -0400
Message-ID: <20260923031344.60494-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7P220CA0096.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:25a::8)
 To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO3P123MB3498:EE_
X-MS-Office365-Filtering-Correlation-Id: 6255655f-142e-46a1-6a0f-08df1920affd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|6133799003|10067099003|56012099006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	XTqMMg1qr9RNITlpcuiR9O7W7GinI0ONtjl79nT7qYf8vTMV6+wmAjyYAfEqq4JtTw5L/eT4nAjp8M+B5hxRgx74DC9hSv19L5E4rdXS0DarUY/S+OEiKAGP3Wjh8LjKC5KO/RAg5tWTm0U0txeZGK/VVSj0Ef2Abfk5m28xEnPqLu0zorpAbrSSxWBuHt0TY8l/PdmW4zgTfAzWOa0eNxdsPAYVkqfG06PHZz2fxUnJ7BV4mlygmCfF3JaUh4u0F6pl2vrknhE0mq3XZ801PEqQv/Qdx2vz2tDiGmFGDsgpAHx1bMuSdkS8eq+JjT03SAkD1hN9+syncYkPzAtSKtRKw6hIHFfzOxj1B9QYsCfvwV1m5Zn1cadZ/RmuFZgrUhv3Pf0JbcHR2SBBWYJRzW1RY7gPOovbiycfzpyeq26uWlucDUx72PfazcQG7qQ5Z3vwyNBmeRzzAqV3en/JH4wrhNMPyp2JcsdH/bNGiscUaBJ7Ur3qrUm0zOndh8bvC1sKiDbn/wpGLzmYVL0x/OX28j9dsMrMDZX+sASGdIzHwMhW4qle3+KbTL9zP4Kv0sSxLU2j5NVCIBP/5Dn5jDUTIrzZUzzSbZXNKUpmiziGWcl9tjAVUHHv+BaQox6fA00vpPE6PO7i8xW3MApixW8uPecysS8RNEpC98ZBdnA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(10067099003)(56012099006)(3023799007)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fan7Huk/rbi96lnin40BU21IKsYDEY92ZMCE3cnA70HXbv427y1TPjbCMfSh?=
 =?us-ascii?Q?n19/T7GZbIcwIjr/+UULqcFlOLYRMSuM9JVCSSW+M/PSqlrJmsactXxAMmuZ?=
 =?us-ascii?Q?UMQwTgwmsIKYGqwVN7IecQ8iK1etr8hFvhujT6HkuNJ+bx42I9Z+wH8Qgn0z?=
 =?us-ascii?Q?FSyNk5jWAJgd7vE5O/P80GfSEJiBU5ag+mnN1AhpIyZPN61XXjXj/jL0vIN7?=
 =?us-ascii?Q?bbupW35PCYW3s0vykc2fllpD/xmTqDyFttsrpygnwodXfQ2TgdUi/CrS1RUw?=
 =?us-ascii?Q?v9etXoQCyIjVR7B2/uj6f2a7s4SOGjsZu79R73nTzB5FRGU6Hy6bsTojuLDy?=
 =?us-ascii?Q?UsUEQQsWHe1xF0HzHJ0YWeT9NPmHTgmO8VXUxReR89yy+qEOZxT8qtcEJpra?=
 =?us-ascii?Q?7DCXSdiPFp4wGQ9IlZdG2Odr/kCpDn1vwEFw2EcAgwX9dGuLlcRj2Sagz9wR?=
 =?us-ascii?Q?3NjaVx3WNPasxsJaoRqNyFDqYAdzIxgSlD3awNQ10+JOWbZYjKqnb8UwkOrc?=
 =?us-ascii?Q?NVUPWCFAuu2B1o6rIvotUqXy8kQWfMbC9v6FRK0qQbh+g+Mn5cBNmuOQLS2e?=
 =?us-ascii?Q?kL7g3dbmjIls8D8wdiWdlogccN8E61JBd2if2Wvyl0UoNOGrpWebeEcQDq+E?=
 =?us-ascii?Q?K+V80xMBwAHFfsqLOPXP4GTQVWjGOS2+ROri9ELW8tSQC4F/B7U6RPxhLe7T?=
 =?us-ascii?Q?76EwEr4o1zuGbg2HRPWv+1gskwGY1c56WOB7j0JmZspIa7IEMDE5e2ExdF9h?=
 =?us-ascii?Q?FSG+Ls7Q74n/tJfbk4Aullbv8iSNqnLqnaHVSFG0dATjXOmEfl4VlTMqp8er?=
 =?us-ascii?Q?8g4yxEvU/AqEYfXy3yzltQDogI3trkPyGcJyoy9EiSEAHtu0x/QT7s3w6foX?=
 =?us-ascii?Q?PM7R5Ko+8TlWkPoiwsQWI3uMf6tHpMCpr+GVjaq+RcXzupDw7AJZ2I95BQ4J?=
 =?us-ascii?Q?OURaP4GD5bltlBdpc4ZPj0PVkmqoLSORh1OdRzpqQnjaFXmA6/Al6lzYt9zL?=
 =?us-ascii?Q?OItaVDmbAJhZ18h6vhJd+5LuY1inN7U7LGsg8NmgOj3dC6m5B7t+iMqgHbdQ?=
 =?us-ascii?Q?WpP/WaDVBUk30v+Nilo+NRia6ChSKpOYHON3T4R1UhKVidK97MHJykSjqlPa?=
 =?us-ascii?Q?RYIbQjTYu1WCQaFDAW+lEHDEMnd3yUpwah4YgArXikXePTA3X5DfNNwkQ4Qb?=
 =?us-ascii?Q?xYKivEAEX3vtgG6vQvb+PuDzJpF398h9Fi9GnG18y6Nq/xMPB6/Ac5Sy6ift?=
 =?us-ascii?Q?I2hUQwsOLVUJ7TLwFqaSje0k69jcsEuid10LRDUkJTDApD0pXXJtL/zUzbmS?=
 =?us-ascii?Q?/5T0yVbjqT0rL3oZ+Vj53gl6ss9i+G70vx7ra1gebjZjCCFUZUUdUAZ36es2?=
 =?us-ascii?Q?e+pf6zH6TaNVnNa+a6R6O8gXsXLp+Z2zfQmSbCFwUvvdGg8LuHJNbK+DSOsT?=
 =?us-ascii?Q?B6TJeP2XIrV0sVeSHUmJ/VEPkWFet1ibIx9KLoyKMXSLIdHSz6DSOzbm8ZJN?=
 =?us-ascii?Q?Z3GRFlOK56D4sT/8by8GD12J0SxLLFj8Oy/t+qXwx7rjbYINbh7ZOaEbH3qd?=
 =?us-ascii?Q?Pl94HIxTt/V1osd6eL50bBOTR7ibEPLbn2/JOkVHR3/P61THNJmAOwIrs/Vp?=
 =?us-ascii?Q?fcp7CzoSGZsaEQgpuvxyPLuBelJ2l4alYGVuWMni0ujoBqGjNIVWmsXltvs+?=
 =?us-ascii?Q?P0uO5EuyArGnTSBMc6jLFwwoBrBHyu1nWlTdpdYKROieovkvArmJcFmptG7C?=
 =?us-ascii?Q?N7Dn/Fa6yg=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6255655f-142e-46a1-6a0f-08df1920affd
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 03:13:49.4616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dmklha5d2z0pjFLKPNXBhzE8pGk3lS/Glnjo0t7SqRTT0I7rBr+mQQhVhoQIHJ7Rn1ZJZXIKgd3U3oJqSegXLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P123MB3498

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
Changes since v2:

 - Harden lockless busy_hash traversal against idle-list diversion,
   cycles, and iterator read faults by checking WORKER_IDLE, tracking
   visited addresses per bucket, trapping (drgn.FaultError, LookupError)
   across iterator steps, and warning if a pool dump is incomplete
   (Tejun Heo)

 - Replaced bare Exception handling during busy worker inspection with
   specific (drgn.FaultError, LookupError) scoping to avoid masking
   unexpected errors (Breno Leitao)

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
index 9313ebe0c525..32be5c69a61b 100644
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
@@ -176,6 +203,57 @@ for pi, pool in idr_for_each(worker_pool_idr):
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
+                            wq_name = pwq.wq.name.string_().decode()
+                            fn_name = prog.symbol(func).name
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
+                                w_id = f'PID {worker.task.pid.value_():<6} ({worker.task.comm.string_().decode()})'
+                            else:
+                                w_id = f'worker[{worker.id.value_()}]'
+
+                            desc = worker.desc.string_().decode()
+                            desc_str = f' desc="{desc}"' if desc and desc != wq_name else ''
+                            print(f'    busy: {w_id}: {wq_name}:{fn_name}{dur_str}{desc_str}')
+                            break
+                        except (drgn.FaultError, LookupError):
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

