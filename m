Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021140.outbound.protection.outlook.com [52.101.100.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A84D311597;
	Thu,  3 Sep 2026 01:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788399586; cv=fail; b=tTqeM095eDVcTP4TIXjA8SLwY2Tcphr7f2DHpcPzf+3rR3UujgcUOOR5lEWE6y8HPE+tFerQlfecAReMXl8dEYr9+GHuZ7BWMnkwVt58wu46pqtw3n/2AAz96zE3hx+VlRctLZtX8xm+TLNz9Ey8T659tJ3JIaM8MfPsFg8SMIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788399586; c=relaxed/simple;
	bh=i2EUX+g4lmuRnapzgZb4cIZojJ1gN2xsorwd6uMJZL4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LsEeqHh03TudY+TYH/SntnqOLjjHPqUx0EbN0LIflI28LHzsf2AeC+5B9lXpT96A0cxH9BaGIHIxrZq4aNixgpDruf1a/eBoOQnc69QWM6SjUvcTZYd4gGEp7+GDNr5HABpgdWgUfNwPph/RB0NO/N7vs+1Sr9S7lhzL9ecXFOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.100.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNJDWbR2QM2zKYmu6A9OzUEKl67fdXO0tXqcWZr0bmOYE7cLeb7WCXHB7Q7SduJ4dOvDU2v6IwUODDkLvwsqCyRQDYSjalO3f1TMmUCYJQIDqLlwgTzxTupDzuMOBKjCCT+ufwdDerJJQ95N1U6dJJXlah9Cv/wTfkx9R5C2oWYgKQ1WcikuTLj+NBB420wUypwaovvCfsrlzh/IycZsr1/YuzfQVuowRv00Ih0gvtQJMV1EK8QCKHw3u0u8LPjyjDJvd0Oi2jA5WSqmy7zhOG55WV29+JRDXndA8a0OyqE82CGyqwfpdHLOYjlcdPHoDcpeuKS+24oY6jtwIS+fHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=4nciEWhORYiQK404+1IJyDAz+qOPMdYHFuiNHy9LK/c=;
 b=U9WAuFodf+3ka9v56PTm33JTesHl6m9XrzekD+qj2Iy5V+MzN7BoMY3ZaVhq++U2v41qp0t1b9hGORas0sVQyLx7A2IQ65iYxNBYVRFQPDd1RDRlZPbZaazrR9PFLGfnj+Nym5xroXEg1aPEzQUwYuXqvW9al0+I5+KIFGyHFrcG425Ul6hJahAxKQhi3lIWn+MjrzcJQdYuv6tm5UR8lyQV552OvNHes5rqnKaSDvMChWxtm/cz9qky00XDS9m4eH2ldwUGZ3LmfBXiPU+s6G0PelHBae8ALqm0k07XcmnKqoztMfRJs6f1aaVrOe0F53TzkQDMJyHsAA5NhR6jKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO4P123MB6532.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:2aa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 01:39:37 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:39:36 +0000
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
Subject: [PATCH v3 0/2] x86/mce: Fix timer list corruption and avoid redundant polling
Date: Wed,  2 Sep 2026 21:39:31 -0400
Message-ID: <20260903013933.172063-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0100.namprd03.prod.outlook.com
 (2603:10b6:408:fd::15) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO4P123MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: e48daa35-c731-4a4d-cfce-08df095c368e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|1800799024|376014|366016|6133799003|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZgxePK69aWdGdXBdZpiG2bgjISicqbcyV50atFVCoUHjOLUn/lUVOySr5U9xjQ+GQgB8nQxAmWrapqdTXuJdd0i3huMZec58b+OF/QDM3/tB9aMYlbULg5Y2B0qgwz2MdITwt4h5c0zJREuCJ1/MGm4L5/eVHFBidtKRNFloj8cfoGbyC4I5vB5Odkikqe1ykbD68MZmFCj0JacBaSFXc9j6hHLu6hg61n/4h4I4HvzzmhB2fkcWmzd33UexqluiheabEn0Nmfh5R4V2CSQY587YkFCX1vZh65WT3BP5YCPVWv0WU2u2vfm+z1y1gGQgvHHHBahBy16V8TR5eYq+JwPiR5JiwF83hF0Tj1IVI4LsMSYWtBSwqVEynIhr2tCq35ZPa2FFpdRLtve1dn/ehNTIU8wekIZR9E5j1jUfKk1A65gMEzhXx5s5/3X7aVsIwi261FplgSOTwos9A2MreTi6HGLyy0xuwY6yrOlQdFpKr3VlmqQzLM9rPjjiwq8cbT+9ZQnOrnMc+VbX0wRX9oxZ0DU1YLVCgSpsSdf3rEtg96H9s+gp5xJhNr1WoFo5bOWo+v/rMz/RlYGxOx2dMUdwXveqVHbgOLgyc16ZRHXt5WKk0OOM2qFabvwdmqZY2dyFuUt3DCelbgqeMnBqrTH1r3Ark1GI6nk83sa1OC8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(376014)(366016)(6133799003)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7EAla+MnUfaYw6a3ozZ8F6ce7lsYqX/RFgy3bMp0qaqJT6tyO/dyYcEV8OGi?=
 =?us-ascii?Q?ek8pbr1afPDgugO7tit8/GAQ+5B62xyMLaS8d/tNyMWortJ612ssYplQnqXs?=
 =?us-ascii?Q?YtzWkU/2EC+Ug7Y/FM/I139vPtsbmQojpaD8YPArw3SipqbdU9aBdscpr+Xj?=
 =?us-ascii?Q?pD0kkox1STsrxQh4CeWFvHnDbb5P8nPfKKwLogMSOZpthviQGGxXH2Dxs94I?=
 =?us-ascii?Q?GF1IaTAgiAdEVRY1WHUeM9zmljvAKtSSjxMbmdYRamRND19dZT6Fz+fIvBAv?=
 =?us-ascii?Q?Ndb4/Mgfkgtd+7y5j8UCAjTGB1AgydV5QCoAEzYEyybwcla6AgKPvQYkvS2v?=
 =?us-ascii?Q?J8wgqZRfurWrAvB4A9I9/5fwpJqhKpzhenoeGzch5LVVuPp+yMhKGwSrgAdz?=
 =?us-ascii?Q?5pkBe7aNRhLx8kMMDsmk0JLWf9xDfr1ILuTnYqpAVb9GQg2N9vNuAFqElE71?=
 =?us-ascii?Q?RisVtGoxBv4TPX3WGBYLaK3R3JzrT+rTLxDlubvk3GKv9sFxyO0Arx+v07mv?=
 =?us-ascii?Q?qazuO/ijJScsp14TQGqG5TqH/kI5LlAkG74JDZUIIympgyC1e3b5/KSzXAD5?=
 =?us-ascii?Q?oQ+W0V3lbvcZsneMo7iZ+FmqVVz2Na8AVl0cIWLCkLAKtfekPPgNCvkNiTVI?=
 =?us-ascii?Q?rE1CnbLLFYhaOsNWYyaXZqAx6GCtuGFdEy2if9h528hq4oqBLu7NiFXDT563?=
 =?us-ascii?Q?3BhrkvD3QqGfGxLlhxdKolUPuc2Sun4Mk4A4JZvgeAfoesX+VT38v82ZpyHd?=
 =?us-ascii?Q?MMd7Araru+V4fhcqpZ4c177mmXNUP7rXSsJ6ARog/cg0esDr3EpzLuD5CQjo?=
 =?us-ascii?Q?GIOJIc05OpWGh6LZdiDcmJx0VFJo36DJ0SI/ZF1lys3dLrbOiSr9Njw/wEpu?=
 =?us-ascii?Q?3CvlnvSVx0mVTxNtxJ/cUbOlv883Y+dzdQVGCoiIziV4c6RGrdrdRZ6Vhd33?=
 =?us-ascii?Q?TAlNBuUPMfDzFlEP6onpie5BlPhepk0GvscfWUDXNaim+L1lnh/yWA8QheaO?=
 =?us-ascii?Q?PdWaUByfGUM3PYfijKoM8ReEZBXiIuMuKqA/iOBxAnNRTH8lemaYuppGMsBf?=
 =?us-ascii?Q?Xet4dt7oVU8Czwt1s17yo0L6flNGQcu6MxhSFzxU9/6qXQQli9wY7bCajPwk?=
 =?us-ascii?Q?epPOTSA5OEzVT2rd0DVm/6lPd3LiUmSdrkM1PD8dZPHeY0dx/MQtiAefL7PZ?=
 =?us-ascii?Q?IFXD0EYavUA1ImyOhhyK0/RNK54K/ttkjBocaYZxhc0XnAhSwKynFz7dGb8d?=
 =?us-ascii?Q?MuGSKp0PmYxCsne59Bp3vB+IDXIkEs82FPGtofVvtHt6Pi+sOrAxHtC4HxaV?=
 =?us-ascii?Q?tDokMPEj2OoBtfH/60ltuhMTIYMF338JFslOYxrByTgNHAjVTxiLzv3lhlmY?=
 =?us-ascii?Q?5YBnKpV1COqQSbUtLkcH42zUWgaxdnP9CpJmAM93XtdZ2emvyVsDOTb4dteX?=
 =?us-ascii?Q?JjDZGu96ZBFh6hLBLDs83wh2Tm+MgUfbFgAsZcG3rNQLmbE1sXLMol9MHOpY?=
 =?us-ascii?Q?0vJHTxx7a0+PWYkAo7sZTqZQKXLdgqVNFBa8oUIgty9qHB+LjB6nVESW4S2g?=
 =?us-ascii?Q?kXGmqw88ul+9pvZnU+EXT0Y8jaziLtdrFS3mRkv6Iu8sA+W7sWHm38FxLDQn?=
 =?us-ascii?Q?f/GR6zhK0mgchEpHE5LWp5nKPgF9WzLsOyzX3QS1H3oK75QabbBwg7DEqDvY?=
 =?us-ascii?Q?DaJAJOnJluitchdkH1CGp5HzA+IZ/bJg/ojq38rHiLnRhGZk9WntlRmaha6T?=
 =?us-ascii?Q?dIC7tZ20Gg=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e48daa35-c731-4a4d-cfce-08df095c368e
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:39:36.8891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O70WDy1/BN+v9A6Ks9tElOXyvD0uBPy0ZzqrsYQ07NbMkVXxVJ8xxLwgNnjt4Hc2LYqWLqk7uyRFny8kxNnuUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P123MB6532

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
  x86/mce: Avoid arming periodic polling timer when no banks require
    polling

Aaron Tomlin (2):
  x86/mce: Do not reinitialise mce_timer structure on CPU restart
  x86/mce: Avoid arming periodic polling timer when not required

 arch/x86/kernel/cpu/mce/core.c  |  8 +++++++-
 arch/x86/kernel/cpu/mce/intel.c | 11 ++++++-----
 2 files changed, 13 insertions(+), 6 deletions(-)

-- 
2.55.0

