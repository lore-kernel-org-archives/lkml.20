Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021132.outbound.protection.outlook.com [52.101.95.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19FC3D6CA5;
	Thu,  3 Sep 2026 19:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788464511; cv=fail; b=p+A08Jwrg+28UTJro78oh/ruK/xdiXD4UpatXcucvxzP6jRBv+TCun92ygF/vxcNLif7J2RDCkmmlA931MpBJffyb+1B5tMVms8qGDyYNUnv2uGs23+dDTYnEwcJTwi08j9HLHOvyLkgK8E1FR5lWxSHJQlPtRBEuxHEISKhUpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788464511; c=relaxed/simple;
	bh=zaMewGcBbo9A4nYpJ3A9RJr+XCjNBF46eFtxRK/YDIc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Hn1Fo4WGVDxx3zim72V3DKIWtkFWFIc/Tk1u+9uRwOvN7OQxC7vJZT8kvwsSwH05XJrRrHkukoxZ8KE7riKdNzjkrBfiVkPR/EdB8ogqzx407kQ49fGXUO+zayMuqsiPdUofk6XUQMk354ed0HV7ujD44d78Oi6ObDlK8v4oXxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.95.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7PBCJBbtjBKgWlJWjADaR6zjVf/oR5//YT2W5WL3bFErEjzdPB2cDPukG44PhCVc6nWKVipO0xnjsPOlG3OzC0n/GeHVmmho1RDFZI5m5WV49IVWQprrk2Rj/od1TKTmbv1+z8uNL4ByJn4l8eCP0MD2TQH7ynyOPsI+sTpgPFTgfdOB+S59Go9VEmQK6EN9bZnVHuNSDjlhFhx95EeURbmAPOcPTSkRAHHQOGst6RMxXhwPDI0OHVnsT1maTfXw+9M16iBVB1aaenaLD+FcG4VXLPG962J5TNIr8t3ns/c4u5yORtyY5FQQrBOQPk21u1lif4m1MCz5Op/AH9OAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=0oG0S80u3nvxwPFel10uwlnRPkMgM382qPSSow2TMkY=;
 b=TiBMjK/Ahb9sD1V0jYV1mp8QQI1DQQMcLNe/QAyyFD4OYS76ekyvQntGNDv5h7eO877++GQ3SoWS7s6UMXHysjuhUYC8p9Pm1JVqcTB4Aec9ZFtXGunlEyOxypYQbew/6EGKvFzcZYa2yqtV611TJpzLgpFP4WUxyTxX1M6fWIMToCa+edI+/ScBv1rNU8PobZc/c9ZsXk95VRHct8Pmxx91IR2VgBzBGMlnI/7cxM7AenCWG9H1eH88JeJ81/Kfown4rNWShezaXCCDPP3e2+QUzejeWsS4FrnBXbIaKR/nREwCAlzTS28uBsZE3H9pRHa++ju9eAVEadnerKVR2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LNXP123MB3609.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:130::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Thu, 3 Sep 2026
 19:41:34 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 19:41:34 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: tony.luck@intel.com,
	bp@alien8.de,
	tglx@kernel.org,
	mingo@redhat.com,
	dave.hansen@linux.intel.com
Cc: x86@kernel.org,
	hpa@zytor.com,
	frederic@kernel.org,
	marco.crivellari@suse.com,
	neelx@suse.com,
	sean@ashe.io,
	chjohnst@gmail.com,
	mproche@gmail.com,
	nick.lange@gmail.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] x86/mce: Fix timer list corruption and avoid redundant polling
Date: Thu,  3 Sep 2026 15:41:27 -0400
Message-ID: <20260903194130.186096-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:208:32d::31) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LNXP123MB3609:EE_
X-MS-Office365-Filtering-Correlation-Id: 97bfa986-586f-40b1-46fc-08df09f35c48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|7416014|1800799024|56012099006|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	SEnFI/u/AaUVepmJCpHbjnfVGAHarbwn57vJpMLD0fU8gYIu1Ni1p68vdo1DprFDbI3XIqIvMcJ9cNjusyPcLXPw/rAKfCGBjqKj0Py7jDzsf2YcHVx7u/IsK6nChWLIxFNKXr8imbkJ09lIO4xfgRIakkf5HI8dkU2bI7EJIsGo41ODwUkWuvBjjcpOa4837jm6m1TyDDMHD2NNt5qFeP3D6XJpAC/2k5WhojYG686XVvi1joz1Tx+6ZVlYE5hiDdzl45SSMSdyw1njhu7AOgW3jECbVdWf+JRYPRYTSvyIUEzFbWWloejPvimPI/ES3sKGD+wXgKqUot9ZAo4flHZt6lN241lfXbO4s+9MQPLTRG2DWtzZ+F48Sn4dAkLtKTcb+0i1CLHrMlJF779Vut7Rp2hhp4KnD7vHQ57TQParA6akjt51LLjxUzZ4welk8jeWXk/ieHGY4HHtV3OezA0ijaxgq4iHECbVvdrqP8pTwQdIO3AwFia4lyffSG7n+b6EUKlEQHcUQEm35JQAd4r/iTOHlgi99lBi7eRiGQlEpS0ztRNZ8vndL3x+W8zt96J8xv2KHjl7QBFGFuRWUyL7dg8+IC24ixmRd+8N936tux6+aiiJsgene1vqogJoOIl6vcvkhEl1v2eOz0IqbpUJjlNUYWVLhkH9SLz5As4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(7416014)(1800799024)(56012099006)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MzO/6OrSyKdVQlXJoXxuueottYh0EMf0SPGplsl+pSAo0XYlPDOXKbzYFcw/?=
 =?us-ascii?Q?PTZLBt+YAGVTot7NnMX4s8hjacYCsaU0Jaq/uftk3tRaH2IwxpmD9qfgeFKu?=
 =?us-ascii?Q?nZW9+DOWTSgJTrcjeZ6rmVZKVJzy3alarMFE4b3mcsJOR12XIl/vDutYnqek?=
 =?us-ascii?Q?Dv0W9QdgGVUz6TnIwDt+ZorsMTF7IULrYVO8tEGa0wtZx2OdJsi/zvyJnsAe?=
 =?us-ascii?Q?aSATW+QSAHQZYPzMp7NiFiy7llFvznXqhoxfBdleCDAiD+jXd5BFuYBVviwe?=
 =?us-ascii?Q?DTZRVgOXY7tf4X/hIievvBXShBVTGdkIl0fcXf2AO4LudVWJjIowz0o6uQs6?=
 =?us-ascii?Q?jnowzaPCg2fee9IH0Rx1zFVLdIFBpis9Mikgx04UOUYdO95kT1rAcHS8Gt4j?=
 =?us-ascii?Q?02dVf5GQ9TIW0j94+JyBVrSJF1au6dAroD1MtEsx/fBsLACX9Uc3Ma++t/5g?=
 =?us-ascii?Q?eJ1/QkRiryT8UKqcVyIPC9cylW5zT1QvUTxKhD5Pimue3QK+m9H+d4I9f8gt?=
 =?us-ascii?Q?6iEwHNcA3NcTtVs5CIrPq0cpTIcC2gGdVPjEL/zydhNb6Gs0xgIaEHc6v+cO?=
 =?us-ascii?Q?JbVo60618ERKF8vrVUnwJKhwB5LZJ4m0JcUsgoJCYguXelJme70HehWeQTL+?=
 =?us-ascii?Q?NoPkPAIqG54BhZZyDZMua4BUsFrSPMROavvdyK69RaLF9ovRmcEKcczKwWGi?=
 =?us-ascii?Q?3G52FVRM7VLQA+CM1En5PLDpnqSEUXs1Qx33rlJNabHJLW3RUZP2ZzW+u8Lo?=
 =?us-ascii?Q?U/JeHZvY2BGH6d/VHW7JN9wLA4O3Kl05ZcrqFXujPlFvHml19SyyNgd7aIQK?=
 =?us-ascii?Q?vwIW11P2oUBOnGHc0vD6tyz4JXIvtQQWD3ZEwcBfVLljnesdYfZmM8r3J904?=
 =?us-ascii?Q?I8ug1IBKMM5hquQXrZuCTkDhQwRGAL//o1+bHPdUnWshX1OshBE1jau5QMLB?=
 =?us-ascii?Q?DeeoDG+jO8Zl10LgV1xJhbBJsX49c+4/dAgAEXA5qVXt3XNWHJXGDV7Ff7Sz?=
 =?us-ascii?Q?3Tth7qRmralh0lo3twOzczd5eZ289A88OwtB7FC/y2kwgYEP+uCOz1TVLqJT?=
 =?us-ascii?Q?mI+q8wt8SzCmD8OBO6ciXl/5ILu2XEzUKTW4hptkgL+97WhYCr4qLdIx/A0l?=
 =?us-ascii?Q?p6APJjymL2hfmVxscpH/tsZT9ADP5gvj1PaZdUV9jDFwktsiiazwcL89w6Qk?=
 =?us-ascii?Q?00I6+5ifoFbGlGbdM8NAhGC2fdq+7DMpPOav8DaQOt1GOHzxvQr93Xs5xW1I?=
 =?us-ascii?Q?cG/pFbRspprCAhvMt3vRlK4h+BDgYMc8d3PAgfKAstXlZgPHTdsWcRChzq0e?=
 =?us-ascii?Q?UfSWCYCXQ8uJGk+/OT60URB1xFabQRi01oXPjQ17sMFZ1vcmjbTkJnEeXR1k?=
 =?us-ascii?Q?X4tRs/7cdibZM7PA2NhRLAm6fEivCiBZN/eGuoxdaB0dujsxY2gc1YkEtfqb?=
 =?us-ascii?Q?eMy6h/ObMEWX82zmwuOW2hwB2ipEGBCyiW3v3p/BUl/MNsW/HGLRh2TiphVw?=
 =?us-ascii?Q?oXBHCQpNP0oR1NxKHFpvJmM20tIKSJqoBIE8WQaU/PgQAc3SMKh9s12k/rrB?=
 =?us-ascii?Q?QTqFeTLQZenZvntwE4BvYdn5YswCraE7mDh1zZa9oghn10gum/7QSIWaCZzz?=
 =?us-ascii?Q?zRRG+1f80+qNTqSvyGnY3VeM1Qwymec/bC93qNVyBbE4sLl1sDWtAIlVyZ+2?=
 =?us-ascii?Q?PPWUsUzTPa3eT6zRKciCn8EBugrbSYIGirQ6ZTwYZ/HI9KbhAeuW4Uh2iHLs?=
 =?us-ascii?Q?0ytlviLvCQ=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97bfa986-586f-40b1-46fc-08df09f35c48
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 19:41:34.2135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bm8t6xbWxQprMqQxfIqIk5dCoLkRGHKN1q1dBeiOiAMzEQWDc0amKzDcFheIVRfErJgd/Gx/CaVbwGChxGq3BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP123MB3609

This series addresses two distinct issues within the x86 Machine Check
Architecture (MCA) timer subsystem: a race condition during runtime CPU
reconfiguration that can corrupt the kernel timer wheel, and redundant
periodic software polling of banks that never log corrected errors.

Patch 1 fixes a concurrency race between sysfs configuration updates
(mce_restart()) and asynchronous CMCI interrupts. When mce_restart() runs,
a concurrent CMCI interrupt can arm mce_timer on a remote CPU before the
restart IPI arrives. By removing the redundant timer_setup() call from
__mcheck_cpu_init_timer(), Patch 1 ensures that mce_timer descriptors are
not re-initialised while actively linked in the timer wheel, avoiding
potential linked-list corruption and kernel crashes.

Patch 2 resolves a lost-update concurrency race on the per-CPU
mce_poll_banks bitmap between timer softirqs (cmci_storm_end()) and CMCI
hardirqs (cmci_storm_begin()). By switching to atomic set_bit() and
clear_bit() operations, Patch 2 prevents interrupted non-atomic
read-modify-write sequences from clobbering bank bits, ensuring banks
entering storm mode are not permanently lost from polling telemetry.

Patch 3 implements Tony Luck's suggested approach by recognising that banks
without CMCI support on modern Intel platforms (such as the PCU bank) never
report corrected or UCNA errors (per Intel SDM Vol 3B 18.5). It clears
these non-CMCI banks from mce_poll_banks and ensures mce_timer is never
armed when mce_poll_banks is empty. Additionally, it integrates a
housekeeping check (HK_TYPE_TIMER) so that on legacy platforms or
polling-only configurations where mce_poll_banks is non-empty, routine
polling is restricted to housekeeping CPUs, sparing isolated nohz_full
cores from timer interrupts. This eliminates polling timer jitter across
all CPUs in steady state on modern hardware while preserving full polling
capabilities and isolation guarantees.

Thank you.

Changes since v4:

 - Added a patch to switch cmci_storm_begin() and cmci_storm_end() to use
   set_bit() and clear_bit(), preventing lost updates on mce_poll_banks
   when a timer softirq is interrupted by a CMCI hardirq (Marco Crivellari)

 - Switched to clear_bit() in cmci_claim_bank()

 - Link to v4: https://lore.kernel.org/lkml/20260903041320.179965-1-atomlin@atomlin.com/

Changes since v3:

 - Removed redundant code since field poll_only of struct storm_bank is no
   longer set

 - Link to v3: https://lore.kernel.org/lkml/20260903013933.172063-1-atomlin@atomlin.com/

Changes since v2:

 - Bounded bitmap_empty() in should_enable_timer() to
   this_cpu_read(mce_num_banks) to prevent initialised upper bits from
   keeping the timer active (Tony Luck)

 - Clarified that on polling fallback systems, restricting mce_timer to
   housekeeping CPUs leaves core-private banks on isolated cores exempt
   from polling, while preserving shared platform telemetry
   (e.g., Memory Controller ECC)

 - Link to v2: https://lore.kernel.org/lkml/20260902020234.149814-1-atomlin@atomlin.com/

Changes since v1:

 - Fixed a pre-existing race condition in mce_restart() by removing the
   redundant timer_setup() call in __mcheck_cpu_init_timer(), preventing
   active timer wheel linked-list corruption

 - Non-CMCI banks are cleared from mce_poll_banks in cmci_claim_bank(),
   and should_enable_timer() verifies bitmap_empty(mce_poll_banks) before
   checking HK_TYPE_TIMER

 - Link to v1: https://lore.kernel.org/lkml/20260901151138.132950-1-atomlin@atomlin.com/

Aaron Tomlin (3):
  x86/mce: Do not reinitialise mce_timer structure on CPU restart
  x86/mce/threshold: Use atomic bit operations on mce_poll_banks
  x86/mce: Avoid arming periodic polling timer when not required

 arch/x86/kernel/cpu/mce/core.c      |  8 +++++++-
 arch/x86/kernel/cpu/mce/intel.c     | 13 +++++++------
 arch/x86/kernel/cpu/mce/internal.h  |  2 --
 arch/x86/kernel/cpu/mce/threshold.c |  8 ++------
 4 files changed, 16 insertions(+), 15 deletions(-)

-- 
2.55.0

