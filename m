Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022081.outbound.protection.outlook.com [52.101.96.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC3433937B
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 14:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788015211; cv=fail; b=P3+5ULashihxSULpVqZLGF6ilaqhXmHJE9YwrsYtGWjJiUgZza0A3hOli6kWSEg1jzqX1bgnhSC8fPWJFisVhqXS6BL4919KmUkVnZzTc81XjDfeyt10qlYKaLOsrddcMcsxm6206wvTOreoBn/FLkOkbG8IlgQxtnQEXxbmLCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788015211; c=relaxed/simple;
	bh=j/alSdt6ODvd1LY8Qh9jw2AhbFe6UVtX5ybZ687TVcg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=JOdHps/+Fp6ZppWpiZk4HlWBxrEleqAkx7bZibRSReggRxi8iFkHbrCs1HD+VBE9xNX0NfTYHT9ja4js0LgiO8RDXX5F0o2oPpjHttDh4xwkC4CX7Y/XSAmKxsoACbXQl3SeUvO4BIdPd3n4HyFCa+ES5pdlT8hH9gRfBa6cuWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.96.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xfD4hIcFgcFDRTxIcu7WKr2RkxkqW3nS8USGa+IaFbXo4SHb5Fm1Zh7IvvnVBgQvpWcMNtNsnN+66usug88vCTG2WZWOaicyhoyT4GsusUf2IKz8iv+bnqnTG6OcoweMi98/SOPte3SSlOugn5JD/1Q3pa9ANiPtKg1qBXFI2VmV4IAZMa9ZzqCzFp5aM0VX6BYydKQy1Vy3Sl7B/8vwrSQhBvn4nRZMuw6dbrL9hMaC7yrjc0KCoXBQJ20ABHHvvvXZ7yKW4dlt5t8JMyX9FAj0D/oANOuufokds7zjq3XPsIeb+t2+yq/4Y7Z1rHCvKt3+B8rur+NQH+MFH7dTkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=IxB9VCxooQ2QhNgG6A4Cg3vYx6f2lXGwobOQdU1/Q7Q=;
 b=UDOYLqS2kFcNipFHCWhrwg6vxMy8CLnZRHKqH6+xvm1NIvUyT4x3F8fxn3Jw02uh7UZxyk/Vyd1j0tQRFTTH5vTUlSG6nLWpQ09kVQLtpdD+Aaq+1notd9LokoeIAajFsFKR+Mi/xRNNLRDUaoTKVwwj9SjwGMP8CRvU7L9/nD4glRnPOfTylEYeTgkHUtrNb7+1aq/+b5BZynHSIk3aH/FWLTgXbuJH/w0GBppPairK1NZ+vcy1iUJCHRYsdyTDHYGqtt3uytWWKGyr/l45wX+hPVX6dnf+gubm2g1NfeIehqcHGwcyVDFwX40h3QRUkLySKiStLLc3AxahhsafHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO0P123MB7197.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:333::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Sat, 29 Aug
 2026 14:53:26 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 14:53:25 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: akpm@linux-foundation.org,
	lance.yang@linux.dev,
	mhiramat@kernel.org,
	pmladek@suse.com
Cc: linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	atomlin@atomlin.com,
	neelx@suse.com,
	sean@ashe.io,
	chjohnst@gmail.com,
	steve@abita.co,
	mproche@gmail.com,
	nick.lange@gmail.com
Subject: [PATCH v10 0/2] hung_task: Improve warning budget handling and task reporting
Date: Sat, 29 Aug 2026 10:53:19 -0400
Message-ID: <20260829145321.18423-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: IA4P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::15) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO0P123MB7197:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b1b31d5-55bf-4c0c-a20a-08df05dd4777
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|6133799003|3023799007|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	dBJbz2dxexfGfG4bOIxOlLrfGShH0EXR8K1gJIAIcrODAqVDhp3Wa/+65+Zl1W10C1WRNpMrbHFFl84XZAr5MkFkC41swygCfzLh7PCayQpCFF9S5ndKa/MTuSa5sgn64JEzMPvU7Ctpw6KkOu3k9AeGWMH7syQS6XsaVH1A/tgj598QiEID/3JL0Xqkgo81bXbUGAm0KkR2tWMPps+tAubAU/g77a823S2NI4Qoi6xPgyT47OLj/dOIAmgIRn8pWuipgF3EnZGLG6gnWgplw/KKRJJauLYWmfzskjMQpPhmR2qjnwVZ6biK+ABko86tr4y34bzwQe6bL5Na1BrfYXYdk7voXD0173DfSJu1qy3e6St1aJU7SdXxv1PPCy5OMn4VdlmvDKK7NKwY2j9ybM47zqPcU+wpqwGBM4DIF/U/zC5WIsnYAxSC4aRBWIL9cHhyu5/8Nm0O+eJqCuyDdOwx4+W7w6zDGlnjnm1s7NV2MUHQ58AEbq5nVRV+9u21AHCK0920h7qExj+GwREfILnKlGCDFm3JeB7JDJI+T+R77mfJmKsLbrMOxiyEn61AjUt6C2j0/M9C1I6fDUUP5Ey7rEypfJe6UTVOQLkI59UJnfUMZkk6MuSwrNRZbEGTPKgdoVCJ3fObDSoGYlbsks8rJ/Occ/o1taKToQfsa3Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(6133799003)(3023799007)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OEUtW1hwxhRI/Ub6qFOgTHvopzbVAqL2XRtByMJMcm6UAa4FQRzUM/4Eh0u5?=
 =?us-ascii?Q?NKN3ucWkQiMxP2oEODsgZvTdFHZx937TvL9xgS+kLDdVHPAm4MTqj+7t3FLM?=
 =?us-ascii?Q?eFKThnGq9gtyzU/m3+YiOabmm1HIb38htAv8g4texIodUqSMPQttrRz3+OJt?=
 =?us-ascii?Q?CvzMMdYpegmNH9YH5lNl5Ugr/sr1JoAPdoSF6YDUFSwggOKvrYAxC1x7J5ws?=
 =?us-ascii?Q?Ms57oANaKCoBzuszynLgRgXgGICaSbOGNutI9D0EQcSz2HrMCYXzYSmWDxlc?=
 =?us-ascii?Q?SH4Qj59QmVGoiltVAcAfIHC3lS0ubjvvFZry30d2WcYVQ0z+XjTbCbIbCxXj?=
 =?us-ascii?Q?A6AgoWeTsONdNuQkOeE51YFklYdgY2A75Tfe/7S48OG6y54EqbmLPgi6IWKi?=
 =?us-ascii?Q?Aj+9OjAV3hU0WxA9t0T+ErzSxcCm4SaQaVOfmXp+FW6F5Zsz/C8l43LtaWkz?=
 =?us-ascii?Q?SH+YiwYYPFLCPRzdYypsjV6R6NbjQxm96w3IzPdl1kRc8Ry21PF8FV27WEZL?=
 =?us-ascii?Q?digxsLav26LmDYf+BwgBjlplzHiDj6ZdUqAyLSEIxcRCnk6B5523G5uh7hnp?=
 =?us-ascii?Q?I6b4LOsLFcby2OnZKkrTIiYAf+vWQQagVBkDmZHUCFEbhQkaj1P5Wq/9AT18?=
 =?us-ascii?Q?JD3yFbkzw27D0Q/VgFWoWd/QOTwU/cB+tFeF3JD7/eXqOoXZfTpauq1IXN9V?=
 =?us-ascii?Q?BeKZWYAWtPoLzK0lJR4hksg0g5YIkXwIe/XAz5nXAQhWd2WED5/SgWbjgomA?=
 =?us-ascii?Q?1IkcIENisgujRPX+uwDScorH4b8rbJRFiO53qstKAqrzR2hGn39MVOl9vf5k?=
 =?us-ascii?Q?lIEEc5MYuZaEyz7nRnE63y5ivqjbwuXWbdcm70vCGyxIuceI/4+ooouOOrzD?=
 =?us-ascii?Q?81LLnEDIrwe9Mcay12J61ZpZ/4Djg8GupZ1af97p6izFneB4NzKV44l2UCZT?=
 =?us-ascii?Q?txpQaNlZkf5E61nE7vAsI4QH27zw2GDijegWFYB01VeQku88FxTvzZfBc7cT?=
 =?us-ascii?Q?LZJhJ8u5uVYHPdGtFhc0U8SQMem2W9zLm8ZY9EVhf8NEb3IUQNvRSQodLA37?=
 =?us-ascii?Q?vRD0ehuNyj8GTFPMHh1I0YBNXJ2aplGltSVKagwz3rgnrTHTfUwXYVDz/yej?=
 =?us-ascii?Q?OjOxefbY3g13lEXzAb6TJOSqhtbvyQ0SnqWlrQDyIaVCORreVftOeb56Mg4V?=
 =?us-ascii?Q?CgXlQJAsw82uQ6HF1qcZf3TJ3m2U6Yb48EoJJ3ZElsfNvTe9IDVmzGwbGVOi?=
 =?us-ascii?Q?e8wqxk+mmzYRXX3lfvHssQDqXkX7aC03Xp+NuLzPvKNrmiZU8DCRC41V5erP?=
 =?us-ascii?Q?6Xwx2q+VjCrBKggTNs9LvyWQ8RfOpZO64ulXBFIkjboE5Bm5OuC79eUI2sVA?=
 =?us-ascii?Q?Mb6mUDSmKkRa6ouVDV0s3cXpiDHwOtFe7X4lvH1+xIAR6wXUgFYtlOSr/RAT?=
 =?us-ascii?Q?Fg5qmxdrrULCGTL9hij9NTLHl7Ozohp3zoy8MDhBUGhgMAMXxDT/JVrgntd6?=
 =?us-ascii?Q?0V/ELTBUQu+8cgsW7OPsn7c0Aq+zM8x1sCpKWGg9YA4OM6NwimFHmgwvkDmO?=
 =?us-ascii?Q?bkm4irnKJQQIe9KP6nHpLRRJ7qo/8ChDMgAXHGNsprfbancd7laqtgqwdjg+?=
 =?us-ascii?Q?LKJAn4lhzqXaRuGvS/fvvdoegsGLbHc4a3dJriwnEpJAYHrl0nN5UYGxMR3d?=
 =?us-ascii?Q?27u+dxtr5KgawFhTO1+5jeLw6Z4rwcwPl9xBVTBlK0p9mHkiVCF8MHgFgIjv?=
 =?us-ascii?Q?v16O+Uonuw=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1b31d5-55bf-4c0c-a20a-08df05dd4777
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 14:53:25.6774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xd+z/q3Sqyub+4ESiiBSPrNfPAzMCd8mxbbKmlA6b6bCZKDeeWXGEvzXa5naxqrzH9MUisNF1JsqjpLLSEvyWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P123MB7197

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

