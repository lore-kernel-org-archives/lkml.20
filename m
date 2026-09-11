Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020120.outbound.protection.outlook.com [52.101.196.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3D8404BF9;
	Fri, 11 Sep 2026 20:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157539; cv=fail; b=iogK6Qu/AK7PJa7K3OgtMJeVAaDeqnOAlJRr+YICEg2XBOKKUUVjrF9+Ts9H05UtKahgH/ClDLPdUDKHI2YMbxA6odh9mhSMQFrqGPZK3YFF7BlCgRvx/I3toCEz2PnKRoCiCyj2KxHewddS1cPri4sHQlKtklHPFOi0mCwaT8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157539; c=relaxed/simple;
	bh=S5GdVuVj7jMcnRpQ5Wo03kyHXn8rx1aGT5RrnOiHWFg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lj8lAbaU1QgOTgX9NHIpTDQlaxBTQgl8eRBuf+9IfZsp8y8jA9b8uMogq03fVJTAalk0rf4cskLhFlnZHtgJr/YJWuwf5kElLaPWJO3GZTmamIqW/r/vGr0FLfVnbsQ/Na3/LMQn3EvKpLPEkKEjiulJQuFRjwkVaX110awhSeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.196.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9F6xZIBaLb0Xl/bksbvGlJXUEoQorL8B6JEMd4FdB7qswxhA0EXwwTfNKl3L0SiXpuzdhk8/6c7C+NCmuQlZVLHiGgWNids9U75fKJ+cYMAM3C0mXbURNzK8xzMk1I1JpFSZIhMYuXxq6bx6Q1aD05UT6gnetwXEwV0DDRZKt9ThFRom8X/x9qHxtL9cjORwdkwgHo1hVJYwwc9PKpCPwGznN5o1oyFJH5Ssqf3fu6b8n8UAl3iOhchoGZCgf3UT+GEIzl4vIxIlhQCcj0qj9gMkMsDXMlpbdWWbhEqwAQn0O9M0q6FcQHb93IMGAlQFjhY/Tt6218vf3ferud2Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=Qb1aiyVQZTpBAs6aku5DkrgDxlhSPP9DBWkcBOpgiOg=;
 b=Y9tdxZNLD9eLj5HJ9dTw0yHYpo4uyJ5Gkvzamlsz6lRR84X0X7N5dI0oxQKn512XD8WgDn4Wi1+P6O4MXNsd2sqWyMQOEVq1p6jIbNLMjATZ1F7OONMCxsze0IrS3KhhFQLynodH+sBDzuXnC7rPxq1DFsSeoX149B4LQ97usIl/MjYBq6RcJwlM9WyCNRVBcqfxbCW2G6feAnMBh5rGRmEniAG2Vkdjh7vtGpSRNA+TBZHqI0r196uXyebGQOHicRnOpa5nzqGifZeRHSfmIh36t7dVKWRmOtPa0xWkAg+bsJg701kjWu6T5FHZdCXde18fvNfKOVIc0Hq/Tm1M/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by CWXP123MB3207.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:3b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 20:12:11 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 20:12:10 +0000
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
Subject: [PATCH v6 0/4] x86/mce: Fix timer and storm tracking races, and avoid redundant polling
Date: Fri, 11 Sep 2026 16:12:02 -0400
Message-ID: <20260911201206.532113-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0881.namprd03.prod.outlook.com
 (2603:10b6:408:13c::16) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|CWXP123MB3207:EE_
X-MS-Office365-Filtering-Correlation-Id: b544381c-a388-4b99-9e25-08df1040f602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|6133799003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	wklCuM2W75ayPFhxkOBGcJS+jtn1su2TLPgEbfD9VMfN3kViO5K3TZOQ7bUIuFgVOGZWoEq6EcaKdCG+jTYRBjl+MdlRQyu3PBxRUasCe+/xY0PkRCxD97hrOLBx6qrAwc/YfoyLM+xNh38kNvWMwD4bHZGLrjahAUf+h9irrkWdhwVzIBxU786o1ub1/P04EvnFiCxiKHzHYmljhqCbVdNx+h0vE6/Q9TlslzIFyz542JFa9BTP6PksQJfHf82tpk0TjhiYKRDhHlViINl2ws3h/EkTIamKtKU9+ADApMgdOlYR99h4YTEzL4rj2Zr7fapaOto6/eFEIlpls5E2dTAVnOMjkv6SNC2VuzgMk5wQTUSawn1G3ds0jQjqjzyKrYjjMCjXZNOI26hl81tSsynuexlYoAE7OxmDdDfwWCKF9yYpLLhJ0KCGFTtSZ2IgQU6ir9d8N65MLtwqC6O9Z5s78dfsdPbmxg/IPhRL8JXVMhHpP6bFEnSpjCBPlThkFw23YZebC4fTiMU8fjJtqF3ihB04m5eY56HKlJmptw6D9QQlXVl4ayjgQzpr42b9B4X7036NUTX9ngLcoPpxpCEP0wW4gECZVRgGiYzNnWpr53L2VPf2xfrB/z18lrDPo99iSVATl4QVLxQA0B6XFdfQ6Y8jsWc+mfSxoqcnjpk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FO1kdVjz/JAHCKaGCONF5FKaDcm/cyLpTWAN67rMJ+ypSGhL0ljp9lYQCkZP?=
 =?us-ascii?Q?yIMXY7e31c0y4VKVpYSgJm5kTQVo/yol5z+2YktaFQZYEzesenQO1Z6M7vWh?=
 =?us-ascii?Q?DclKPWEHbuCZNZbZtQ+jCzDIA7vkxeVVjUr2lCXkGSpMQIXCP/J1D5wRssOQ?=
 =?us-ascii?Q?GPZ5wS+jZGwdV/qID73mm8yJ3BGqghJqZcidkQWioyRR+B9CNbnqqssO4Ac7?=
 =?us-ascii?Q?/oDcb401WcAm0xRpZ9/xP0qUw53RU2uAVfraiI7an9U1tYCSm6VSkEGP4wT5?=
 =?us-ascii?Q?3XS3ixD5dOd0gtLfPC4+vdN/JOwEb+AYlW3uyarisYyPkNbhLrVWSdnH50sW?=
 =?us-ascii?Q?F0cebgXItfMPozOtHEWjDOsKVkRkhEC7V3bdKb72+VNs05LhFY5JMR6sUv0F?=
 =?us-ascii?Q?S2n1sOVHiw4FkZfKO8eUaMUXLFObVzBeztk7J3ysCkDSwztAtWCqoMLkJKuH?=
 =?us-ascii?Q?6yD3/KVhfhB4Lwg+PEhzdNic8Zq9yOtr3gYhwC9IIlQePUdcjaWPywnaPGkT?=
 =?us-ascii?Q?yUGUhVu+pGaT/Cgq4Qbm0t5dgqT2LC3iRjBv/aJlIeF6byDnuIyECdSGvsSS?=
 =?us-ascii?Q?YxJQWb2DEcmyhcVfHhO39djd1q/8jxpqmuffyrR9l9bh/BQT8W8j/FlrmwvF?=
 =?us-ascii?Q?wYTa4Ingp7CQBPN9wiAJqp8UuviOXt7nLLIdCZks3zNznzUEP6XRI4YS/GRH?=
 =?us-ascii?Q?Fd+IyX7YfaVUc0ZEQ3LsW4t8z/0SYRhRQeeTIbCUgqmIpa8eTIw70TS+iVbm?=
 =?us-ascii?Q?yjZE/ZtG3oV5BNpbvDRUYb4oREQ1V63RRfsMZqpuSx91VXo8NS/ckUOINCCu?=
 =?us-ascii?Q?sv+h5RQjf17uC6Xb1tT8RnYyYib0garD24Ln/YqqM7HvHlpWypz+sG3NYHZX?=
 =?us-ascii?Q?hFNosfxO+RMPsUIkUhK+P9L11fQf3tLdomu7hnk/JYMPcvqFupkSPfxcyI1L?=
 =?us-ascii?Q?BIiMYO71riq5SuCAw/3nzQcuXpuL11b730+PDKdgFtLcOZFHTiSshkUaGKsi?=
 =?us-ascii?Q?V+e2pAcIGZ3qlc8flzrouS08kuIfd3w0+XsUBL0ZQUfyB6XkI94K1S2CMRRP?=
 =?us-ascii?Q?mw7887i9zvvBO6+FRRGsHShR1P5mkY0gaDuCFCrd2jVV4EFeorRqT27LtIqP?=
 =?us-ascii?Q?gbGXmXKD4sqAntYrDJlIh8l4QRyKIKiPQGyUoUyChOijU/d9RTgFHETp8Kt1?=
 =?us-ascii?Q?Zm3FwDsv1PYNkS/8x21LyOjqPMvGwsppM/NUe93RdJqNy06/GqI7DXCm/7HG?=
 =?us-ascii?Q?6v/UszQG8M5InGJ1x+rB7X5z+arf7SHwqXRGqAm0UsdgL+bVKt9v2wQuDxn2?=
 =?us-ascii?Q?nOwU3/3BSuGBD5PaQF9Vxwc4PRWoJ5iSLqPoaoa3iT+I5iy3Tg7jG9RERrNR?=
 =?us-ascii?Q?smcn/ywkbITfDkLVYM3yBYEFcEiX6pFPqnbPAbWAT3qEqPJNOg8WPtOFh8pa?=
 =?us-ascii?Q?QW8IFMz87OwuTOiDWBYd3tDI6/LjhoDCph/wsmP+dHuk8ZzSMympSVzSloQT?=
 =?us-ascii?Q?DZMXvBPSaTC+s94/GRYHpxO/sp5isZS0+Ct1mYAewqc3iPUXSgKAwIj2DVpN?=
 =?us-ascii?Q?ZEm0A9Sa0tXQkhcPG3mL3bcybhQ4OoXXXhmkBFxFrGmGq2/X23Wx5YtJoaom?=
 =?us-ascii?Q?joQcRz/xt9Hs6fRmpTVN75pXGZuZCRnLGh3rjAHqQyXEvP+I1sqMikhHMRhX?=
 =?us-ascii?Q?0eFTiFnwi9/6AelhKWByA3+s/OU5UVm4jNDioEJB1GEd5oHRYLsxYgz1/USC?=
 =?us-ascii?Q?kcrFIs2Gyw=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b544381c-a388-4b99-9e25-08df1040f602
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 20:12:10.4142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMCA+h/zr5Q/lXI9nMYzV4n3Oz2XOCNN3rB1BaugQx8Y+YIfavbaNMGaYB29dcRM9s/rTUGLThYXDJO9mugEeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB3207

This series addresses several distinct issues within the x86 Machine Check
Architecture (MCA) timer and storm mitigation subsystem: a race condition
during runtime CPU reconfiguration that can corrupt the kernel timer wheel,
concurrency races and re-entrancy in storm tracking, stale polling state on
hotplugged CPUs with Firmware First banks, and redundant periodic software
polling of banks that never log corrected errors.

Patch 1 fixes a concurrency race between sysfs configuration updates
(mce_restart()) and asynchronous CMCI interrupts. When mce_restart() runs,
a concurrent CMCI interrupt can arm mce_timer on a remote CPU before the
restart IPI arrives. By removing the redundant timer_setup() call from
__mcheck_cpu_init_timer(), Patch 1 ensures that mce_timer descriptors are
not re-initialised whilst actively linked in the timer wheel, avoiding
potential linked-list corruption and kernel crashes.

Patch 2 resolves concurrency races and re-entrancy within the storm
tracking subsystem. By enclosing mce_track_storm(), cmci_storm_begin(), and
cmci_storm_end() within local_irq_save() and local_irq_restore(), it
prevents incoming CMCI hardirqs from re-entrantly corrupting the bank's
storm state machine or overriding timer kicks when a storm subsides in
softirq context. Additionally, it converts all remaining non-atomic bit
operations on mce_poll_banks (in threshold.c and __mce_disable_bank()) to
atomic set_bit() and clear_bit() variants, eliminating lost-update
read-modify-write hazards.

Patch 3 addresses a bug on CPUs brought online late or physically
hotplugged after boot. Because acpi_hest_init() broadcasts via
on_each_cpu() to clear Firmware First banks only on currently online CPUs,
hotplugged CPUs retain the static ~0UL initialisation value in
mce_poll_banks. When these CPUs come online, cmci_skip_bank() skips CMCI
setup but fails to clear mce_poll_banks, causing machine_check_poll() to
periodically poll and clear Firmware First registers (stealing telemetry
from firmware) and defeating bitmap_empty() checks. Patch 3 ensures
cmci_skip_bank() clears the bank from mce_poll_banks.

Patch 4 implements Tony Luck's suggested approach by recognising that banks
without CMCI support on modern Intel platforms (such as the PCU bank) never
report corrected or UCNA errors (per Intel SDM Vol 3B 18.5). It clears
these non-CMCI banks from mce_poll_banks and ensures mce_timer is never
armed when mce_poll_banks is empty. Additionally, it integrates a
housekeeping check (HK_TYPE_TIMER) so that on legacy platforms or
polling-only configurations where mce_poll_banks is non-empty, routine
polling is restricted to housekeeping CPUs, sparing isolated nohz_full
cores from timer interrupts. This eliminates polling timer jitter across
all CPUs in steady state on modern hardware whilst preserving full polling
capabilities and isolation guarantees.

Thank you.

Changes since v5:

 - Split the series into a 4-patch series

 - Enclosed mce_track_storm(), cmci_storm_begin(), and cmci_storm_end()
   with local_irq_save() and local_irq_restore() to eliminate re-entrancy
   races from CMCI hardirqs against the storm state machine and counter
   transitions (Tony Luck)

 - Converted __mce_disable_bank() to atomic clear_bit() for uniform bit
   operations across mce_poll_banks (Tony Luck)

 - Added Patch 3 as a dedicated bugfix to clear mce_poll_banks for Firmware
   First banks in cmci_skip_bank(), preventing hotplugged CPUs from polling
   firmware-controlled registers (Tony Luck)

 - Link to v5: https://lore.kernel.org/lkml/20260903194130.186096-1-atomlin@atomlin.com/

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

Aaron Tomlin (4):
  x86/mce: Do not reinitialise mce_timer structure on CPU restart
  x86/mce/threshold: Fix concurrency races in storm tracking
  x86/mce/intel: Clear mce_poll_banks for firmware-first banks on
    hotplugged CPUs
  x86/mce: Avoid arming periodic polling timer when not required

 arch/x86/kernel/cpu/mce/core.c      | 10 ++++++++--
 arch/x86/kernel/cpu/mce/intel.c     | 19 +++++++++++--------
 arch/x86/kernel/cpu/mce/internal.h  |  2 --
 arch/x86/kernel/cpu/mce/threshold.c | 23 +++++++++++++++--------
 4 files changed, 34 insertions(+), 20 deletions(-)

-- 
2.55.0

