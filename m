Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022133.outbound.protection.outlook.com [52.101.96.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46EB35E955;
	Wed,  2 Sep 2026 02:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314584; cv=fail; b=V0xII44gNndH9sDf2C8Up1xXTV6nWOqeHA2a8E2NDYJq5b+g+HTbe2ErtqhnSbpGKOdzw9xbNiQPpizAl6RT0wpJbU7JG76w98EczOnaF56EmLh3zc8KzMYZVCUwv+MWj1EX4J7ExGD/k2GSWm4CLABdFQhrHoy57U7ahIFBd7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314584; c=relaxed/simple;
	bh=n5E/tNmzD2mFGOo1Qpg23+SQBw7Md+2WaSjJlYsa/hk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=htMTnfRJfi53nn/XtBkT7chBGApaUtJ6nGemwORJj+cIzNnFCDPySdZLbkN/Orj+ySVH/o9t1X1NS2ke1GUzv2XQwY918JtKKMzFN8KS/mKE7h2q9N4qzvR6VfamogAUX2jYAxBHnIsYwBIN82OCzjIBI5hZ3iTkLBdFjL0KCiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.96.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vu1oxW3o1Pjy8+zRN0kHsI4mWxUhceBGxhijIsjcrUKtxzsLsifqK1YVeUVDeJJrfVWFFFiGgOkmT8Tl2p+l4AU8eBy1DdqKiMeEQeuEESWJMGWBmkFd/lQdl0pCr09JNVJgn+nCXGbHe0Q4xkDINAUn5SPxydyCPp7VvczmVh1xZoXKRPIzAc3FWky3HZHJ+8xUeX8xJ+GB4+G4hecWhuU+tLebJ7U5O6veh21Wot80uNSA72jYsxkpHG+VrJCrVyXrcczfL4cQo/F9kpkq4OAYpMPGNdypswVh2N3wYVhGXMVs+14XxBkp2XEt3NEKW97W6aObOdC0WwTz6wKhkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=70WBcRKBPzl33S0pV/+sVHUoq9eapbcYDHBZQmq2hHI=;
 b=LQF3YR4RwR40pvdp+QKph7UcMUxy/Ll23n3sCiZgn78KrBG6uoANwx7u1Q9LS7RNFIVz6NDxVm6sVGv8PUSzrhzgS7VGUG24LfUxu+eTa3mpFSEQS4iIj6SF7b+8PrK3R+ymk5RJTErc98sNSDln0WwR7RJ3xrZdIG4K4+lL8daVF4OjF5EZCRHCcN9BSUU0xjECU7aPjWy83lBm+qGYxO0k25esPgsVKXi7/nkxQCsMZmdA88W/6EnRn+TMeQZWgcWKOurdObZr55tuAmVOwD4Ng4OgjDNdIZp/roej841QAvlL9yDQWhyzMuXxIKr6G8QpYi/R+8UIw1tmIurqAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LOAP123MB8292.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:43b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 02:02:45 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 02:02:45 +0000
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
	sean@ashe.io,
	chjohnst@gmail.com,
	mproche@gmail.com,
	nick.lange@gmail.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] x86/mce: Avoid arming periodic polling timer when not required
Date: Tue,  1 Sep 2026 22:02:13 -0400
Message-ID: <20260902020234.149814-3-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902020234.149814-1-atomlin@atomlin.com>
References: <20260902020234.149814-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR08CA0019.namprd08.prod.outlook.com
 (2603:10b6:408:142::12) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LOAP123MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: ed0719cd-b7f4-4d33-932b-08df089647c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|10067099003|5023799004|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kFiC20dgA5o9UTSxtzPDjBvpK40fOCv/0DMZ+u22p0axnCM0XR81fySjsdE5q52YLTjzGXjYLyOKTrY/3xBGg9HpexrqPAS3q/Aci0GR7L5T0bS9u1UvojVImcSFs8pP6VV76CeG8Gl1VkgPxh7kQnxXAKrpWgpmoQDiwsKqrZexRvBBvApaDfhkXwKtFEXDvntqvKGsb86xgZK3Woay4puLCPiTcgi0kkvSpBEz40jI6nSJkgng7EM4lRQZz2E1BT2nRcRB2ewjs51qcwYmqAA6H0KnJc+G9f8ZCOEK3Hk8oEu4Vufn+8DvoSMplOzUiQ0oB4WicF59W/mzosIJMJyfGKTZyZgzNvuJj3XplAK9zz0AV0xjNh87xEJB87jCIVv4nAovNKoaiOxrEAO5CPCwblDnoUsMrlEqf0DDBi++TTQjlIbTQ4CT7A11hj4liGTqPk0mZu+f9jjZpQZ/QOd7cwL8Kw1ckWO48zOH5GYFNPCS21TpdIpD6w0b+M9BBj52+85PlUBE2/jxAw2bIMLApUy6n6xtXYaWde/bgotNfmmuIM7kA6PkTWWO30ruy63oaBoWjj9d4RZW4mz/3li+xfTD/YzZDREr/vQkPKzKtsN+uEak0NhVz1JyThUSkH2ZsZFSQbjV5HXD8FfJUE076+UheRyToqC6oqT2B3M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(10067099003)(5023799004)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4YBbkCaSLrycVQi4LTF/IaOMusBG0N3M6ALrYKVHhrj0RrJlfPjlEBE4i1ez?=
 =?us-ascii?Q?M4bxlex+2igU/WSC7doWJXtwc9eXTYjnogPbgIWCbHPBa3lMRrvbeRUW1fPc?=
 =?us-ascii?Q?8SUM1Qxn6cTTEyeKVheveeL6O3AimPDivqlB7Im1k6/8GkRQqYbFHITQAXGO?=
 =?us-ascii?Q?4hjPngS5q13GyQ6qwDdJWGGFiLqiP/0vDuH3sYb9M60yLarphdQcDSzeEPWE?=
 =?us-ascii?Q?xsv2RhYfiAR0aS8mpHozedp6AW99aoeoIs8fDrvPqpfOPOOb+6P/EZQuGRlD?=
 =?us-ascii?Q?8O0VGcj5qbbNk0FnVFtNFVIoWPPwTuke6owgevXIr8cm7aGpjwCXonw/8lRT?=
 =?us-ascii?Q?5KLXGyUlQ00qLm/Gjw/PGf4toXwzG4wUlG6vrMTAjHpJ74M79mafgkxVl0hL?=
 =?us-ascii?Q?5B6Uvt6Xwpp88FTbJimbwWVVYGVaB3q71fpfwFBuPRu36+qbhncXzpQZcy3w?=
 =?us-ascii?Q?7EAOEkVMzPF8C/fZV5E9hOJARmwNXhiaWSIPesih8a0cfgytsUJl/def2HJz?=
 =?us-ascii?Q?Y1j/GtDvhEs/Z9q5vV5FCtC15g44elaSfV/tVvebhvdVDJPbS4eqDi4jPpez?=
 =?us-ascii?Q?UCqb0neYR3UmxiUBo/bbFWR5KToicUN9rPvESi3Fs6jIbkkdW/WICb1cPkWH?=
 =?us-ascii?Q?2FrpfUB3faqVBiIeZkm9j7S3Rn+ra54wt+9mREfQ+4ED+nqMVLNoUgZeHMhP?=
 =?us-ascii?Q?p7vksDIxXaF7o3h84MXJRc1r1x5/f+mhdPkwFIn7KF1ibdz9vuT8B07FAEAZ?=
 =?us-ascii?Q?xkwXQJ4ePzynSPir8jzdBe/SdSQxrmIJJxhYtImT4abS1c7IMdtEnqxBXbpy?=
 =?us-ascii?Q?oObzF3N9Zo0Cy5CAJRP11TmghpKxLof2NE1tm5YX5fUmyg3fcAt7xJNp14Nk?=
 =?us-ascii?Q?lmfuTQqlN8bOYFGwIsIcUo5qmx2aK2SSzyPCoXB9qRe/gl8GbdxTNZrL4lVi?=
 =?us-ascii?Q?vsV6ec6sR4U34ypk9eKDUbS3KtVSvNr7l5uOqn29uDjB9D4FSbNa0E8JNmY8?=
 =?us-ascii?Q?O5vNS4QmE2jGzzRIBMxxsW3BWtk5Pabx9b1aViZAKhclyzy9q9+UDxp4xMh6?=
 =?us-ascii?Q?kawySwJkcDgbKackTqFCL3Ls4gU3HB8KMnPVILLPOIrwA6ETs9jz1q+AR3LG?=
 =?us-ascii?Q?MxLyqH/eCr12sODlFdfN7R9EtnzbfhbrZCr3f3HI9caXFnL2PD5bIxZ6a6mz?=
 =?us-ascii?Q?cJcx3vlTFeNDdL+TsPNd1YZGGjy0NRSEuZC1SZv5eONOwMFM/aW7Yx/H3EFa?=
 =?us-ascii?Q?NkfCoUGTGcnfBbwp4QnLzD+JSt+aArRts3L6POvgc/Mnkejnt/Ipy/OD8R6t?=
 =?us-ascii?Q?j1vLE2Q3HMoUPGA4uoAmpQpSipSvGI5xEonTvyOQ4pZiViqTW7HGVeAuYc+p?=
 =?us-ascii?Q?s/WJB161fUa9DZ32AU/GTgH6lwgHxc9tyqQdSr7xrOui4hoQB/gZ/UL2vUx6?=
 =?us-ascii?Q?hyStmsiIwhOhIkiDK+1VxLu7EeXnISFp1zVQpqVgK8hRmdi4HA0aKlKPXzV4?=
 =?us-ascii?Q?ARy/djW2cSNDlBcglO+8CBHPapYG6D113lA4QIXmFHdHOvAIdeUpMt7xAtcF?=
 =?us-ascii?Q?7W3FauVAzFkb0CAIts2x0Uey+NS0P1JglacN6BHkyngPOzEtVwmNyexXG/5s?=
 =?us-ascii?Q?vxFjapChyWVdfdKAi/Z3UpDDm84UOPtI1ZaepEEdy6G+QtMILOGBtvRp3xuR?=
 =?us-ascii?Q?4oCSG3sXxpykAF2qwVS7/dX0mwE4NCUu1hljwlEHkrPt0dZZpmxMwqFDPKa1?=
 =?us-ascii?Q?Mw3V43mCUQ=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0719cd-b7f4-4d33-932b-08df089647c7
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 02:02:45.4193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u86lhyr3Yna1zskftk9ZXk19E8rSwlUF0STs2CAhJcAFmjn5jdvsLp0DmSMOkp10Axi/iUdakGGpKUbLqEWrkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP123MB8292

On x86 platforms, the Machine Check Architecture (MCA) subsystem arms a
per-CPU, pinned standard timer (mce_timer) to periodically poll hardware
banks for "silent" corrected machine check errors. Because mce_timer is
pinned to the local CPU via TIMER_PINNED, the timer core cannot migrate
its expiration to a housekeeping CPU, causing periodic latency jitter on
isolated cores.

On Intel systems supporting Corrected Machine Check Interrupt (CMCI),
hardware generates an interrupt for banks with CMCI enabled, clearing
their respective bits in mce_poll_banks. However, for banks where
MCI_CTL2_CMCI_EN does not stick (such as the Power Control Unit bank),
Linux historically assumed software polling was required and left the
bank flagged in mce_poll_banks.

Per the Intel SDM (Vol 3B, Section 18.5 "Corrected Machine Check Error
Interrupt"), if bit 30 of IA32_MCi_CTL2 is zero, no CMCI is available
for that bank and no corrected or Uncorrected No Action Required (UCNA)
errors will be reported on that bank. Therefore, polling such banks is
redundant and wasteful.

Clear non-CMCI banks from mce_poll_banks in cmci_claim_bank() on
CMCI-capable CPUs, and amend should_enable_timer() to:
    1.  Check bitmap_empty(mce_poll_banks) so that mce_timer is never
        armed when no banks on that CPU require software polling.

    2.  Pin the MCE polling timer to a HK_TYPE_TIMER housekeeping CPU,
        sparing isolated nohz_full cores from periodic wakeups on
        systems requiring mce_poll_banks polling.

On modern CMCI-supported platforms, mce_timer is eliminated system-wide
in steady state. On legacy or polling-only configurations, housekeeping
CPUs perform routine polling whilst isolated CPUs remain jitter-free.
Polling fallback during active error storms is fully preserved.

Suggested-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 arch/x86/kernel/cpu/mce/core.c  |  7 +++++++
 arch/x86/kernel/cpu/mce/intel.c | 11 ++++++-----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 765e8103b0d2..7415d05076eb 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -25,6 +25,7 @@
 #include <linux/delay.h>
 #include <linux/ctype.h>
 #include <linux/sched.h>
+#include <linux/sched/isolation.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
 #include <linux/slab.h>
@@ -1759,6 +1760,12 @@ void (*mc_poll_banks)(void) = mc_poll_banks_default;
 
 static bool should_enable_timer(unsigned long iv)
 {
+	if (bitmap_empty(this_cpu_ptr(mce_poll_banks), MAX_NR_BANKS))
+		return false;
+
+	if (!housekeeping_cpu(smp_processor_id(), HK_TYPE_TIMER))
+		return false;
+
 	return !mca_cfg.ignore_ce && iv;
 }
 
diff --git a/arch/x86/kernel/cpu/mce/intel.c b/arch/x86/kernel/cpu/mce/intel.c
index 4655223ba560..cc7d0dfcf9c7 100644
--- a/arch/x86/kernel/cpu/mce/intel.c
+++ b/arch/x86/kernel/cpu/mce/intel.c
@@ -229,16 +229,17 @@ static u64 cmci_pick_threshold(u64 val, int *bios_zero_thresh)
  */
 static void cmci_claim_bank(int bank, u64 val, int bios_zero_thresh, int *bios_wrong_thresh)
 {
-	struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
-
 	val |= MCI_CTL2_CMCI_EN;
 	wrmsrq(MSR_IA32_MCx_CTL2(bank), val);
 	rdmsrq(MSR_IA32_MCx_CTL2(bank), val);
 
-	/* If the enable bit did not stick, this bank should be polled. */
+	/*
+	 * If the enable bit did not stick, this bank does not support CMCI
+	 * and no corrected or UCNA errors will be reported on this bank
+	 * (SDM Vol 3B 18.5). No polling is needed.
+	 */
 	if (!(val & MCI_CTL2_CMCI_EN)) {
-		WARN_ON(!test_bit(bank, this_cpu_ptr(mce_poll_banks)));
-		storm->banks[bank].poll_only = true;
+		__clear_bit(bank, this_cpu_ptr(mce_poll_banks));
 		return;
 	}
 
-- 
2.55.0

