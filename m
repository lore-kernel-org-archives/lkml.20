Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021095.outbound.protection.outlook.com [52.101.95.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB563B9952
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791131779; cv=fail; b=GUQpp3AmqdDtTg8x8SsKRknYlI3pnphFHby2T38y7ucCYR7aMZfcIO+sYVWXznp4JIMjyYyBM4/bpUh2kD096jrOoPtTi/Z6+ww+7VsLBzxKf/XIjo6O90Yl54TpIzDSk6Wv+fhBlQkG54oEtyZSKtsAxnn8ARZt6KDWhdEHom4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791131779; c=relaxed/simple;
	bh=zyPplqC2CMEbI+Aq1Zm+jR0VtIsAR8jHBOIDm/QDXmM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PSYnJTSmI7wdRjITp/kT5w0hWLsakPeeD9/GKwCP0+K8dBaT7XP4Ox8R2YxFIl98i6rxiDml+/cNU13jcLUD5HGf760AMkGgzQyc0BfCFYv9Uw6gnIY6odqv5pLLqwftG7kcdibvKWbXsGzPNi33TlSLgBXoCa69FqMonnhDW/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.95.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppGKG23nkyACzyxayFTn5WGWkvJ5idIA5ff6XCY7w8dcjbYDOTLqZHSQX0mQeHpCf5nlCiUN0V+kMjgqgbkXpmpsuRqRzOSxy4wMU4pQxbLaE9EV8Sn5JMNKTOkwxabVZmGbfnsOKCYiUVjOMBTR207vQZutP2T9GgarTiyL0eY55wZpN8k0xT2AXqVsQtZBZuVqzM1CtEIvaYDAEbxjglE8cgf7vFXaQU5dEdq717AI8P8GOR7vqi4kQbx0cAndMj+q97apyqGeOOjb/QKj8ATo1uD6d0jyZqpJwkrZP+Z3Jh0u6HA78LhMpA1Sk34XRkUKVijkm/Fd+sVQ0A1Z0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=GZU5RxFOpUCKVvkP05OyUpayxAM/FxZmuYBZQ30CwE4=;
 b=lcUrgOnpfDctlL4nHBiQyVgBJw0rHwZ82D2zSrIjsnG1JGwqqZP/b7moQP1bnmooUkYh1syWnx5+0e6J8xb32mCMOl9bxJks4krTHfewDE6KpioJXgzsZfSV6PatlG1csXe77Mm0UHNDLRKGUtUkEQPxaf2uZX6W7I0nvVuiAcT6/S+nqvQs5BCbIw/SO8vJO/03w40ecZoeglfvbUB7sdE/+X7ibxcA7Ne4rbGX9RAoiDxUvtbuxd1R0BSEfREM8ufJraRUwDQU+Z410vmAjDYsCRF3nRGGJjewpkBIZzCeRomSAWyKqpffZeHhSAmHzhCZVMf7xhZWb3v1wb9WKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO6P123MB6439.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:2a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 16:36:13 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0472.016; Sun, 4 Oct 2026
 16:36:13 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: akpm@linux-foundation.org,
	lance.yang@linux.dev,
	mhiramat@kernel.org,
	pmladek@suse.com
Cc: linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	brads@mainlining.org,
	atomlin@atomlin.com,
	neelx@suse.com,
	sean@ashe.io,
	chjohnst@gmail.com,
	steve@abita.co,
	mproche@gmail.com,
	nick.lange@gmail.com
Subject: [PATCH v11 0/2] hung_task: Improve warning budget handling and task reporting
Date: Sun,  4 Oct 2026 12:36:08 -0400
Message-ID: <20261004163610.413506-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::19) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO6P123MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: 610ae0f1-2f24-43f9-5111-08df22359a4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|6133799003|18002099003|10067099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	d0RMHtbsFCRFrRVVLI+I5nOi2l02cVp8w1y9jVzVzefkAvmhnpZxwd4K9WW7IOp5/+H28VWDx3U6cDZqSe26IuhQXxU5s0JYSICVsOGZAOhsHzd2RZRNhytuWM3RlpnPp54kpJkHcf+FQDYxCCOo4lHiOFT7roKgGowaOrMser2CvNCya5+E/ZjZd6cvQoJggokwrUwLiOA4EYrsUOBnSyqko+OG0d2dSL+y/dH/TDHkbG+BApQsgUnP//d53/7kiOqFge7dOqchmi5o8LFqAxDkmeWoeCoyzUDAHGMmkz1CCiho+zhFnjCbkDpueWCpDLkHG8rE/21ZbyZJVVrBBKEedyAMWS9AJ3+xSRFz8oVd+R6dahg/ipPfE9V5teCJL4jLIQtxCXfc9GvDXmIK/8ZaqolbvpfG4timfQyE8uJjV193E63dhAy/PEelZk6hET09HCR0cAsZXi/K/mVE1JvcqTRXJ0QBvjJEWJPvm+XZy/SPJ7Ag8H6+4EVFjdhkFCC+bXINbQ3eCNgoJGRpyZLKX+IUe2KwlLHyB3vFxld6MfDRQU79t6FwAEEvuQivWBIZSdNrpYb6/cIetHqeFzsobtzmHeKrx9sRNGmJdQv3LpdUwnS3uMzoZF2P52689XkZWWQ4gPRmZXuAD9+moyuYHMUTspfWlarvbOqDz5E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(6133799003)(18002099003)(10067099003)(3023799007)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NpsLBOMNQS6DGAWD7yUoFWSDoQye57xMhDm26qje9p9DSt4MULKnNkoE/Adl?=
 =?us-ascii?Q?D/+OMXYk/qeo5MrCoQ83XPJ//Uq9Vxb8Ara3O5WQ66fq+Lp/WEJg4MCsA1Yt?=
 =?us-ascii?Q?4HHy0L+p/9VmhGlyFpvUMLQ3UdG1UnIzRM9zt/afUXAY8APuYYkdM6eBXYu2?=
 =?us-ascii?Q?DkzG7R1xsBD49fAdBUlJbfX+bU5O0ar9D98M3VNOfl60QJXsv4l16vperrF2?=
 =?us-ascii?Q?2LDxGXsQAiUFMiZUjEMf83J7LUQEFK0IBVxk2qwigs5Bxl58Lc03FG3D4cBj?=
 =?us-ascii?Q?s7MhP2n/baYneoQkl+fmx+FkXtSBAyImR6gVRAmJwxlPdJ3zXak0eST/zIUY?=
 =?us-ascii?Q?1VXoCj7IbJM4xbHhQv7/ifu+1tRAJ2PRHnC8zjSdo5iIqzfcT68aYq+4z0e3?=
 =?us-ascii?Q?whaz6WEevZngjDI9fi626U/T9CyPr2Y7vuFLaQEy3/GDP+ba5JAJMngjPHei?=
 =?us-ascii?Q?GJ8x3ulbtgSqmYGCAzHuciiyCH0nzg/XPQHr/kpDM/c9VJqSFcIw80JLuSlt?=
 =?us-ascii?Q?RnAnQILMLLDPAIatsMKm5dTAtNkZnZOaDPnLWmhWKMfZppHtVfq2yOXu//ph?=
 =?us-ascii?Q?tbHmWLIAOGiIOM9qKwBKtxtDgJ20exoxRVBTmds+mZ7KfKMUqqL0KUKsqenM?=
 =?us-ascii?Q?L1AHHbjoC+vMvKMfuZnS4z2Yx9vcT6ltjXQzgOTxGClOiXYiuRXdeY1DZ6er?=
 =?us-ascii?Q?bc9q9pBIHLOnUXFBghx3758ATzBug47LbVtp5Y0wSBrYzEJRyr6RchZedrSq?=
 =?us-ascii?Q?I1Oe1YIQS8BCL5YKd6XGY6JV/B3ppPWnX9Uwhb6FUGo2/+LEtSSq28tJD+NX?=
 =?us-ascii?Q?Czze7OC4wvwT5AYTJhI+WySed0PBZuSa56LJrjDAwQRVtGwVquVESnD+tVaO?=
 =?us-ascii?Q?P1Lwa2TxWQkkqckliP4FjEUI15WJZ4xwWsEaAQdGOGExad5G/+OOqqeCKupH?=
 =?us-ascii?Q?ml9GEERlWyHbcC/kK2xGuMzeYvzwod2WdqSBPrV9y3yW5vyFpR80jxzeHekW?=
 =?us-ascii?Q?9hTROR2zA9m3Vgi4xDyswyGlKr1NGPFJY+KDYfSCclqHmW1CGgYJxrbioR4J?=
 =?us-ascii?Q?Rz2zFaFUvLiv0gQWLOrbh3PpJOpcQAq716lSmUqzCFqCXK0FYk5Mw17hAX2m?=
 =?us-ascii?Q?1sXWF/zHlIrLR3RzGZ7c7ah5duDngTc6sTW5JL6VcwIVhURbMJ+f7E9HqE5F?=
 =?us-ascii?Q?ifC6OMxHm3yEaTmp0uQ4rogNmSOTDHEf71SVP0qtvUZ8Cb3S9Hv1lYuQkvLk?=
 =?us-ascii?Q?gQbJdgQBqDfPQHWaO55b2hM3SYTqxo5exmMlYtS+OJs/G6+T4JWqadjMAbie?=
 =?us-ascii?Q?DZl0/YV/KxbGU8rqdteqh5TurzB9gtfZqvQ2AyE5kA7cFvWVBsCq/Kx/8/L8?=
 =?us-ascii?Q?nc2NWkVQNGEphKIydLIN9Uxa/0r0AQEICBaclwCwMkMyNnb265DOZU7T1znP?=
 =?us-ascii?Q?grEa52REJHSpzXRHcnLUcli7DZHmGoR/rGCllaLk/MDwdMz2Rd+IEVERSIQv?=
 =?us-ascii?Q?/CWqNEQh8O5yggoQyv9nRv9QsR8KeWzjRlvVyxfb8ILJS3N9xrefk/Uah683?=
 =?us-ascii?Q?GaUSd5dBOXBcJIujaokyX+lMj6Afvtput45C3DJ7K6PVLR84E80bNlD7PSNG?=
 =?us-ascii?Q?66a6z/cDtN37Q+Gk17v4Gb6RYtwtGBpOymFG04awflZ0lDxQRZujOzqI4RaL?=
 =?us-ascii?Q?niWGMdRUyAWXS44FFhDLAKct9qDhaei2BHQYvEPQr6V1K5Q5gVjhFMwcgKAN?=
 =?us-ascii?Q?IzaPPpfy4w=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 610ae0f1-2f24-43f9-5111-08df22359a4d
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 16:36:12.9241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9NDyLwPOCqiE15iHfJZhFk7XxxICS9jjqdUe1Fq3NKPQKYQK81b3KBdFKJim9Nzqbee3jzP8QmY2Rc7g4AL3PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB6439

The hung_task watchdog detects tasks stuck in TASK_UNINTERRUPTIBLE (D)
state for longer than CONFIG_DEFAULT_HUNG_TASK_TIMEOUT seconds. To prevent
log spam during system spikes, sysctl_hung_task_warnings enforces a budget
on the number of logged warnings.

However, the current implementation has two major limitations:

    1. Permanent exhaustion of warning budget

       sysctl_hung_task_warnings is decremented directly when printing
       warnings. Once this budget hits zero, no further warnings are
       reported until an administrator manually updates the sysctl value or
       reboots the system. Consequently, a single temporary hang episode
       permanently blinds the kernel watchdog to any subsequent hung tasks
       after system recovery.

    2. Total log suppression when budget is exhausted

       Once the warning budget reaches zero, hung_task_info() completely
       suppresses all output, including the basic single-line alert. While
       suppressing verbose stack dumps and lock debugging is desirable to
       prevent dmesg flooding, hiding basic task alerts leaves
       administrators entirely unaware that tasks are hanging.

This patch series resolves both limitations by decoupling the configured
warning limit from the active runtime budget, automatically resetting the
budget upon system recovery or sysctl updates, and emitting a single
aggregate summary line when hung tasks are detected under an exhausted
warning budget.

Patch 1 separates the configured sysctl hung_task_warnings from the runtime
budget, making khungtaskd the sole owner of runtime budget updates. The budget
is reloaded directly when a scan finds zero hung tasks, or via an atomic reset
request published on sysctl write.

Patch 2 prevents dmesg flooding during system-wide hangs by keeping non-panic
per-task stack dumps budgeted, while providing ongoing visibility by logging a
single aggregate summary line at the end of each scan iteration when the
warning budget is exhausted.

Changes since v10:

 - Guarded the suppression notice in hung_task_info() with
   !hung_task_call_panic so suppression messages are not emitted for tasks
   dumped while panicking, and simplified the log message to state details
   are suppressed until the budget is reset

 - Added Reviewed-by: tag from Bradley Morgan <brads@mainlining.org>

 - Linked to v10: https://lore.kernel.org/lkml/20260829145321.18423-1-atomlin@atomlin.com/

Changes since v9:

 - Renamed hung_task_warnings_printed to hung_task_warnings_budget and
   added top-level comments distinguishing between the configured sysctl
   limit and the runtime remaining budget (Petr Mladek)

 - Used atomic_xchg_acquire() when checking reset_hung_task_warnings in
   check_hung_uninterruptible_tasks() for explicit acquire/release barrier
   symmetry with the sysctl handler (Petr Mladek, Lance Yang)

 - Refined the suppression message in hung_task_info() to explicitly
   reflect that details remain suppressed until the budget is reset or a
   panic is triggered (Lance Yang)

 - Clarified commit descriptions regarding khungtaskd single-writer budget
   ownership and panic diagnostic retention (Lance Yang)

 - Added Reviewed-by: tag from Petr Mladek

 - Linked to v9: https://lore.kernel.org/lkml/20260814135718.494513-1-atomlin@atomlin.com/

Changes since v8:

 - Resolved a concurrent sysctl write race condition on
   hung_task_warnings_printed by making khungtaskd the sole owner of
   runtime budget updates. Introduced an atomic flag set via sysctl write
   and picked up locklessly by khungtaskd at the start of a scan iteration
   (Lance Yang)

 - Restored per-task header logging back inside the warning budget check in
   hung_task_info() to prevent dmesg ring buffer saturation and console
   lock contention during mass hung task events (Lance Yang)

 - Added a single aggregate scan summary line printed at the end of each
   watchdog scan when hung tasks are detected and the warning budget is
   exhausted (Lance Yang)

 - Linked to v8: https://lore.kernel.org/lkml/20260804202050.262427-1-atomlin@atomlin.com/

Changes since v7:

 - Consolidated the commit message of each patch (Lance Yang)

 - Linked to v7: https://lore.kernel.org/lkml/20260804155406.254810-1-atomlin@atomlin.com/

Changes since v6:

 - Restructured the series in a new direction. Introduced an internal
   counter (hung_task_warnings_printed) decoupled from
   sysctl_hung_task_warnings. The warning budget automatically resets to
   the configured limit once a check interval completes with zero hung
   tasks detected, or when modified via sysctl (Petr Mladek)

 - Ensured the single-line blocked hung task message is always printed even
   after the warning budget reaches zero. Now budget enforcement is
   restricted solely to suppressing verbose diagnostics (Petr Mladek)

 - Refined the description of sysctl hung_task_warnings (Lance Yang)

 - Removed field hung_task_reported from struct task_struct

 - Removed the CONFIG_DETECT_HUNG_TASK_BLOCKER integration and
   hung_task_blockers[] used to track memory addresses of blocker locks
   across check intervals

 - Removed the skip_show_task logic and dmesg log suppression messages

 - Removed tracking variables (warnings_decremented and
   hung_task_has_active) and the dmesg recovery notice printed when
   clearing the blocker array

 - Linked to v6: https://lore.kernel.org/lkml/20260719161305.428947-1-atomlin@atomlin.com/

Changes since v5:

 - Skipped hung_task_info() and sys_info() for tasks already reported in
   previous rounds to avoid log spam

 - Linked to v5: https://lore.kernel.org/lkml/20260712202100.123934-1-atomlin@atomlin.com/

Changes since v4:

 - Replaced the stack-local hashmap implementation with a persistent
   array (Petr Mladek)

 - Persistently track blocker addresses across scan intervals. Suppress
   warning reports and keep the sysctl_hung_task_warnings budget intact
   if the blocker is already tracked in the array (Petr Mladek)

 - Reset the warnings budget and clear the blocker array when the hang
   resolves (Petr Mladek)

 - Output a recovery message to the kernel ring buffer upon hang
   resolution

 - Linked to v4: https://lore.kernel.org/lkml/20260627205733.90983-1-atomlin@atomlin.com/

Changes since v3:

 - Deduct from the global budget if printing a full stack trace

 - Pivoted from heuristic Wait Channel hashing to deterministic
   blocker address hashing via CONFIG_DETECT_HUNG_TASK_BLOCKER

 - Replaced the hung_task_reported bit-field with a standalone u8 byte.
   Move hung_task_reported into an existing structural alignment hole
   within task_struct following blocked_lock, resulting in zero overall
   memory footprint increase and optimal cacheline grouping

 - Linked to v3: https://lore.kernel.org/lkml/20260621213756.43225-1-atomlin@atomlin.com/

Changes since v2:

 - Replaced the per-round cache flush with a task_struct bit-field for
   persistent cross-scan tracking, mitigating delayed budget exhaustion

 - Abandoned exact-stack hashing in favour of Wait Channel hashing

 - Transitioned from jhash() to hash_long() to optimise single-pointer
   hashing, and relocated the hash map to the local stack

 - Linked to v2: https://lore.kernel.org/lkml/20260620013559.1537893-1-atomlin@atomlin.com/

Changes since v1:

 - Preserve "INFO:" headers for all hung tasks; suppress only the stack
   dumps for duplicates (Masami Hiramatsu)

 - Print a clear notification when a trace is explicitly suppressed

 - Add #ifdef CONFIG_STACKTRACE guards to prevent Kconfig build errors

 - Optimise overhead by unwinding the stack only if a warning is
   actually going to be printed

 - Linked to v1: https://lore.kernel.org/lkml/20260617184841.1447955-1-atomlin@atomlin.com/

Aaron Tomlin (2):
  hung_task: Reset warning budget when problem gets resolved
  hung_task: Log summary line when warning budget is exhausted

 Documentation/admin-guide/sysctl/kernel.rst |  5 +-
 kernel/hung_task.c                          | 55 +++++++++++++++++----
 2 files changed, 49 insertions(+), 11 deletions(-)

-- 
2.55.0

