Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022116.outbound.protection.outlook.com [52.101.96.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF082D8370;
	Thu,  3 Sep 2026 04:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788408811; cv=fail; b=TFELU9S7RgoOsMfNcSsr+eaIGdIYQ7TvK3XSBZKHw9Zr5CHA9LWTF2o/Li3SAIB3oudUBKt3y8QWNON2+vAKykN+MLWLVryPhLppPKno7t/yhUCRya5xiq2HNpuWy33rWzSaYZ+jdGp5z3sJuxeqnPUAuEWPLBtEiSiDmqtLzSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788408811; c=relaxed/simple;
	bh=ctnvajHgQaBvtfH2xSigiEw13Qmg1D96Xa/qGdWK8D4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YiAeNWvTSvVgZIW0YU1u2KQdgt4UaVOD9rdEPOkSa8jp/lhN1VAyWhE6Nmm8CcFA9V0fJPgHc3es23Q6h+tuso60fr3kglCj4ng2LDYM/DccIrAmTVrhshFsKBqHrmzk/iZvLU1dYidCHWwPYzA4KRrSjBXVW8PmXWbWeYlkJtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.96.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGxfAFnZupEdCoiDktDRhZqtQ8gJJqSitxa73KyCuX8I22xwhgzEYiXZcgTKL73K/0OwcDhv4RwMzTMJC4fwNua34JADu8UUlEe0srbdze36TC7IUbjgDjohb45wavLfUizf2djf0bWBc3fs/f/gyHrEcRo3ifBrA2QL/ZZPeY1knaWTMoWLuACV1Jxns5LmUR8gH9kfWL9h3Q/3dtRSp82iOlNuxWrgflMTMwIqE5zKOFKfO2e1t57XNoQRmsbYccZjMSggp6WjFEFF2In5CKS8OWDRa/xkXzo8AJEwYE3nYRXMsDynuKvGdt+mgFDsYnPuiORyVcP+Z1KRb7q4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=CPotxlLMF3l6M3qGmcOpuNBTBH4OEdSRUFvbUET0SLw=;
 b=Kt+AcjTWnZV7+TEnbVMQsfev38zPSSv6QDUvp2WEShGzd4ExmSSKT59ZsORiWUJ+CEkHJV7eWXdMZ8eYCvI4jjxLF0XOhIka2hsWU7QxaHxqmW7SfCX5venxSnUx4K+/OgGngV5KdqsB8lyrOvdVetIbSpPq7pE+kjWXv3stGY7qB2dGc97HV0pPrBftR61D+BQQMr1JzVnrZZLVTftdR2JXS+0cXPYabpACatgxpYg32+cEddlHg/kGDmbdGpIdRDGLI+2oi+xi7Gzi6dXsIDHYZNaMi5wYvk00Ai8kaiiU2Day0B2GJ+BZxEBi1ocE/rWFyYxGqYA4M97TSp2qXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO0P123MB3868.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:13e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 04:13:25 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 04:13:24 +0000
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
Subject: [PATCH v4 0/2] x86/mce: Fix timer list corruption and avoid redundant polling
Date: Thu,  3 Sep 2026 00:13:18 -0400
Message-ID: <20260903041320.179965-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0120.namprd04.prod.outlook.com
 (2603:10b6:408:ec::35) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO0P123MB3868:EE_
X-MS-Office365-Filtering-Correlation-Id: b2dbce80-4923-493c-3c19-08df0971b264
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|6133799003|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	NKU7ZM1xIrGE1xAedFvTct9T0PzgYXJnmqH5qwegll9aLMODA5d3moE037ACCJisGr2xkF2r2X6qkKLpSSl0kiMDlbp4IAZtPjPTKF9PGNlbD52Tu1yuEciozW2uHlUVK8LTfox8mGkKMfqBzJuD6ZRzoUfgk/x2Ha/ZXFk8VlEjzDtf65alGeZ/BUtLmkp7PRluWUuDOLj1vBHUgPAO2D3EW8pOWd3i5lJiNbyjUAoDoimk1vmMDmnszDYjj3UdFAGzJqtYd3C4R1e9n6JK3JNmK6kYm+PCkOyBwX+vC6D/eMDQTrUsuzCe50qDNfi+taqA/3mvMxasEuaSRAiCn9vCw0t2jDmA23mdeh4ekMh4WzGaVIdgtNKHLUWJCS6szfuguuwmO8QqM8xhAixHvz6ILX4LlTNY9e55toqvcKxFZ/7cB+6xdq4YPs67n6iPZKnBarWvy3+MTdA08icVSzYRX/IiUZd7vVvqXQjX2FXGWM4TJkEo1278E560YLs438QQesIHcNx3d4C5bjjJ5iqr79vqRUEsvJ84JsTVrV9bqTwuWGActtlgbosge93oAeafObN28TzMND83FdIvcSyVhhBNWU5cTxJhRI64f7ePRT0CFku+uIpQqif+MS+XjFXVcClYxrej6eSoCTLKu+VLzphOd3yWJRm1s+bvI30=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(6133799003)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w+i2Q3yGT3fDVFhg3G26eNaIOswPymIpMeEmA526anU89c8MmRXS4deybqVM?=
 =?us-ascii?Q?VPPSoKEglU8g89VRC2xK2k9K6OM46BrcIR9/gGajWySGqFLpz8n2yCB3SaUS?=
 =?us-ascii?Q?J5lJ6rBwbp67bp/a7UHygosV/yiCoPhrd1DuItSm6AD8cAZP5FJ5N0DUgp9S?=
 =?us-ascii?Q?svMDl2r/2jzBua9wTopr37rvKfLOib/v6b6T5bvG0Cmo2BsptI4T3phi4f1q?=
 =?us-ascii?Q?v9bdjn5qhVasAW+DzY8qE5Ovvpj2EVbKhn94nre5YHDyVGoiKSZSpcBqmLHE?=
 =?us-ascii?Q?oi3tR4lGXUghdlaaKJYwJLgbHIc7PWTeKtGjK8P5Ia0SvKnUFD5V90E+2YiB?=
 =?us-ascii?Q?/EZR+/oYsNtXXwNbip3kmUWsOT66B2yoNNsjM2FeeLob+fyCgOj781mYlRyd?=
 =?us-ascii?Q?9zKWY5n7xK1CuaFh+FSjo+dgijKSwU7+tjY9lf28dahPIMNHBJ/DptwwfbOf?=
 =?us-ascii?Q?1NMWYLp1Jv7K1ELfxVR5Evg9J9nTFXUiWFZICrlQyGMBcxDIbo5WGuJiKq7z?=
 =?us-ascii?Q?pTqGYmkLtBJZZ2i2fIFVhKp4Qy7qmCabX6s6U8GJR7UVPx4AO+KyvABGk1xN?=
 =?us-ascii?Q?lDC7q4wI1BFFgYvS+8jrJXkP8GMrw3f1PvlCA3u3K08e3+YjsUKl/XAPqGAj?=
 =?us-ascii?Q?d3kR2JnWypiG6p8QVe3NKVrKeDyDa2IIk0E8oTlHVoIix9dBCwMGbvBRGOzF?=
 =?us-ascii?Q?r/6ahRMynfJXtvJjjK1wqdPKWIr8XDvVr5675ot8zE+sfgHBIJv7gJYhiNYw?=
 =?us-ascii?Q?3PBp38CrzpVxwmIByX8xaLzk50XasRGBv/jbcbWE2PBqkXVcc60ELkxroyxI?=
 =?us-ascii?Q?CqsCx0hLgoi5EmdVTP3WPaJzpi0GtAwBZ6VvVGkCnE/Vok8cZx92KI61uLp0?=
 =?us-ascii?Q?xCSTr1jQgVOaL+a0E4NZwXVgMrutEoqH6IybWZhrREGok5KvbPBkdaGwgqQn?=
 =?us-ascii?Q?ZFST1DEUmIJHJw0PFR/r/cAkEpef0qNOPZ1ut8gNkH8rCC0nWssNtTn3Qvif?=
 =?us-ascii?Q?0B6OkqADBVclTGPl2A1uua0L8zIW5ujN5yfAe4TD+6ZNO3Y0rOB5Kvder+ah?=
 =?us-ascii?Q?O4rgEsSKmnc8F5GMoQQTVmJHlIwFSt21wsEOOZ5zuDt9VGhIIh9ZXM3Pztu5?=
 =?us-ascii?Q?sbNuNWZA5CST+uKamsC08TKVe4k4YTJyE7eu5jpVXLlFbne7SyR7JQ+Fn91l?=
 =?us-ascii?Q?YDjoJSkhO7L4YItr1GXkol0M1OdzIK8GMwr8llnQIVuzphYX6OTmysnH+tGK?=
 =?us-ascii?Q?wOsELGiNSC7QbQWqZ+jTlR9O8GmYgp1hDI7qwcZZi4hVfGUUh1fB1tanCGAV?=
 =?us-ascii?Q?QnApc5hCJydFc2KZjX+BZizU87ysLQBcwj9rcxOTR6amILBpjsCw33lHvlYK?=
 =?us-ascii?Q?5DVNf7h/aAzLZuLhzzEec8rJbvLXSwzbb1TbG6aXajyLtqtX5MC0JcI1ow/f?=
 =?us-ascii?Q?Q0hc008OVqpS13Z7au6P5Yg9lzYH7O0zUPyY3fDsHbsb8WN6lvQ1WKSIHMhi?=
 =?us-ascii?Q?8rvSfK7bzLDwUl7DjoOcqsdgKAqIrVvaGAH8QDfTsHOCE8XCJesWxC+UvXs8?=
 =?us-ascii?Q?WLw66GS3rMzQYLEu1SHbwMT0o5/lIA3oKTIwfLWcEmWrKjEVCMZ8bVVuiiPs?=
 =?us-ascii?Q?w9aLaeJx2fGIJpz8rVMbABp9Etm36diutmeBicYkFtj9Z7M8R3QEjlPpjJJn?=
 =?us-ascii?Q?+PPN+Zkbe1RN00GdJlD4XOY5lndeBRSkbQtEiie9x8tnQC7N7uajYRFt7aOp?=
 =?us-ascii?Q?y2IaGlQ3Gw=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2dbce80-4923-493c-3c19-08df0971b264
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 04:13:24.0338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wl0mVr5++IPH2NhC0FhIB4H+0YUdASOXyZQ85SKwmvgvfL/roYRTyOlv8N6xD0O//IXYehmnbRk42CxsyTLNMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P123MB3868

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

Patch 2 implements Tony Luck's suggested approach by recognising that banks
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

Aaron Tomlin (2):
  x86/mce: Do not reinitialise mce_timer structure on CPU restart
  x86/mce: Avoid arming periodic polling timer when not required

 arch/x86/kernel/cpu/mce/core.c      |  8 +++++++-
 arch/x86/kernel/cpu/mce/intel.c     | 11 ++++++-----
 arch/x86/kernel/cpu/mce/internal.h  |  2 --
 arch/x86/kernel/cpu/mce/threshold.c |  4 ----
 4 files changed, 13 insertions(+), 12 deletions(-)

-- 
2.55.0

