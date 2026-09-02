Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022133.outbound.protection.outlook.com [52.101.96.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E2634EF04;
	Wed,  2 Sep 2026 02:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314571; cv=fail; b=V9OUjOanYxHs08FAbCpAswt+envp1SB6Y+PW6pKAVN9caqDKbMVcwtqXOGIZ/lJ8euYHurs95WgHm4FvJh1+mEhcZxuRJe6P1IGhdWzOkhPSq58ntvMhLuMiEEKNUbK1qc5dvxeumMrvAUh8vrEHDmN9oWSTia5noD9BuY4+Sbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314571; c=relaxed/simple;
	bh=ju3uQ3alenXQAxhVvhFPsLyNjouTwFfW3J8Jcc8oGKE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=c6EuA/K/mBOSDG+zA0Mo2slW3UkFrzaAjewBLb2DHj3liMPEIXOqS5HsCp7A6/7giNUk5aQG9akv8NQrPOX5DtgGurDsEgRjKpmkyXUTzobDRPl9UUUeFRZhLS6LLnb36tcgPdrZDRR/mMsw000e4Cqp/MD6M3Uv3Xgezz+GhtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.96.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/03a3zAbazBNmlDUcO9wEwvTF+LN7aNaHLS9c+ILUvZ3CzON95C6kwhqDJd66jsZ8fh+pzpk4Zg6Utqnt7pqv2XzbeL8JWO47Rc6Hs3QXl20Xj1a59MeEs2kzxnfJIztdeey9Gvq/qIKz0SjY0aZEY6A6CAmPA7fHqXT8WI57DU0hf4RbN7OrNy+Z7/VAuxDt/izXCWwEjwHtGNw8ZmY78dMkXEcAlBZatyRqCj6NcKoyUi/D5Rx7K3XfJsaWNt2FfJTvctxqOWpnlSFjxjVGULR+4VdpD9mMUoY67QbPACqjqpED2nl98iC1wSFT9L3Ni0Sp4Xoq4B/ezAXfvJqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=TLOjcMhFgO9J2rCo8kfa5KwNoKn1A0NDubKbqYbNMQw=;
 b=aZ8X0ImXmP05BxucSJzQO+bZq4cDrMFqgmdb7wMk4MFmgJMI++Bpoaz3+2Hnol50/BlLwIO4LAgFAdWUQNn/pWFfBmoul5tzkBWCqoMfYEen/eAbHqPicO3XziEeoe2bFjXNOL3AymVc1dInIAdlA+n7x4u/zdUqM01eZg6aMpeW//nNQUcsPJIklxnq+Y6YPoG0bUKeuzw4V+Md8W3VK5V0+oI8khaoTH7ZpK8wz/NaBucvghrS34fY9JA1lanXt4DWKClIdqQPE6fMKD8vwKqSyBCd2mxZTQU1kqd3EnAY5lvz8hDiS6FFtMo4Uuy5uSBoCXwLH/V4cCsQjep39A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LOAP123MB8292.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:43b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 02:02:39 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 02:02:39 +0000
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
Subject: [PATCH v2 0/2] x86/mce: Fix timer list corruption and avoid redundant polling
Date: Tue,  1 Sep 2026 22:02:11 -0400
Message-ID: <20260902020234.149814-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN1PR12CA0021.namprd12.prod.outlook.com
 (2603:10b6:408:e1::26) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LOAP123MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: 231f62cc-1863-41ef-c030-08df089643f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|10067099003|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/ySSuqYgFbjLL8Icz1nZvYKlVO7Aok3erKv0K0buMRTkznx8o3I1VIvOsRhEKpuel8jtJUjvz1S5ViZbjEedrqMl4o4lKjczHEtbZjW13GsP1NJRjxJVh6XiHIXlKeY0HChM73yflGpGvDZNsO1JGx3r79Spdxg7RaP4jZ/7IY5zCExSYxvt1S/amozbr200bqIECZCvED7kg6NNzwA3Zl2HtQexEAJWv4Lg1kSvxHg+9Q3PMtqmCxBfhxHF2tXJkwloUYzGW9C4H4J5R69fS5F1JMqdxde0bjJcQ81szZQV0B2uDSAsYPqLoL6g7yfSwXT0SgCrEHxJTGr/3jF4dSTTQoDAEu0iBqpd+E/hCqHWVKjpfTRnKX0KUTt+wzW7vwZ4qbOkBkaS6hOAEjk2eSHYBvCFllkBZ3kw0qUaiPSyUrkAgGpQ3GQj6lmG+AsjFS6p1luZry2I9JLYaFP4z4s/ruK86WvU/kwYYgMlr3KTAYlKgp3fgYPOqjWnl4qJayA/oq9XQ3lTwWOSizBN+9qxltWIdUaAF95LrJD2Pmw/ZMDVfI34i3N9hq/RcrZjiPrVE1roKdXwU4wTNWCPYZknlFZRFlMTmHEBjnKdDUVM5YDjIJ4Wd7eAwGAvpl5KhiqOozWFNT6vMErpys0rFowcjSVi16kZ1xf4Sh2OtyA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(10067099003)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTVtWHBHa21EYUVZdy9kenorOHZSTTM3YnVCMTI1c0t0QnN6czI0NW52TENY?=
 =?utf-8?B?NUY3SUJ1TnJMaXZiQlJ1TUd5MXlxNVdOTjVhalJBYUJtRHltYW9zblJYL3hE?=
 =?utf-8?B?ZmRTZnBZZElyNWpZZUFBQ3ZWNGFvdndpaEJWdVVLNnE0TmMySURXVzZxUHF6?=
 =?utf-8?B?REdXTXdOaStoWmU0WU1STllJRWpQMW9YYkc0NDE4YmNvSTh2R21hZkhwYjh4?=
 =?utf-8?B?OHluNk9nNjJDVnBHMWRFYUhYeDdhbHRqdHM4ZklUS3N4eGs3elF1Y29vQURu?=
 =?utf-8?B?M2xwU2FIRDlpQ2ZaSm5vZ0ZWczZuVWtHYm0zZ3Jwc2hMMnBYUDMwOWNJYVdK?=
 =?utf-8?B?QVczcnpLVlZFdkQveG1OYVlDUUFRbjZDNFdpVEFtb2VPZVZZTFE3cTlQSitX?=
 =?utf-8?B?cDhKcFAzSjVMbGRrQnFJTDd5N2xhYW5NbTNZV1g5dmhlZXBEZGtmNHM5Sk4v?=
 =?utf-8?B?RUV1RElJekVlV28wWHZFcFYrbXdwWmt0WlBkV0Jpa21lNklndnY5QW5xYlpz?=
 =?utf-8?B?OEVOam4xWXluVnJJMmdGOERVck9pamZJWXU3Z1hkbWR1MWNWQ0RSMlArbThR?=
 =?utf-8?B?R3JIamJWTC9OZGFLc2tWSzJzd21iZ0VLbnpvVVhFZjhyZkRGMGFLYUJqNkhM?=
 =?utf-8?B?ejlTd2sxbVZNTDEyaldMWHMzeWsvT1krT1RzblF1MGhnZHlPWmJJTklSeHpM?=
 =?utf-8?B?dUorNG45S3p3ZzVoUHp4K3h0cGtEUXkveHFoYlpGKzdYOTZmc0E3VlNUaFFX?=
 =?utf-8?B?TWdXdUlkTFFTdFZBTDZEUGNvVXlUa1ZJdnFrWklYREszUWRPSEFkaFhsQzZC?=
 =?utf-8?B?T2VmVnQrVzh2QmpPVlRuMDkwcG9iMC90OTlNS2ZNMVpHZENhMERjZ0dycUpH?=
 =?utf-8?B?L05nZjBxMElTN0ovQTBrZFliZFR5ZXp3amlVK2RIcGVIQkdNQ09HaTdpWWdx?=
 =?utf-8?B?NEFRblBnbnllTDg2SWpXVmVwMUF4WFhOYTlkcGJHYUYwZWloRkUzdUQzY3Iw?=
 =?utf-8?B?MmJjTEV2ZGtBWVR3YWdYWi9HOHhUYVlKTlA0QWdveWZmazh2N3NCbndzek5H?=
 =?utf-8?B?dzRtWXdsM2tRRW8rYjBEWS9Jd1lMeTFRUUxCU2JDTjhJV1UyNTZNRlNrV1I2?=
 =?utf-8?B?VDNWMm03SllucDNiM0hYbFd2dW5tNU8reCtZZ2I3Tm1yUmtZYWlGRkhyU20v?=
 =?utf-8?B?T1FxMHZXRndVWEFWekExY2pqZzJsYzZlcnN0clBnS3hOOUYzUzVvWElFL1Q2?=
 =?utf-8?B?OFlsdzZ3MXJsTzdnSUtsWWlUWkZGWnBTV251NSt3anJKTmsvRFhLNDN2OC9Q?=
 =?utf-8?B?SUhHejhPSGtteFpzaC9lRnVPQ2VmSVo3NHZvNWVrS1MzbVY3V1BVZzljUENO?=
 =?utf-8?B?ZCtxcTV5dWM3Y3FNbkNTZmRXc1ZvaHpSTXM4NWtWQ3MwU2RrSUtvcUJ6TG5V?=
 =?utf-8?B?d2VzZkx6eUR1Tnc0QktoL2h5cHR2UWpsMGkzaml0QkJENHJBYUF0RmZDVEN5?=
 =?utf-8?B?a1FnS3EzeVhmb0lkdG1VU280ZEFRV2MxNFdNbjVHRVRFRVViVWd6MlhOa3Zw?=
 =?utf-8?B?ekxjdjZJT0NvVjlOcWZCWWdNcm5xZ1ZBcnBLSUd2MXVoT3pvek9FYStWOUJQ?=
 =?utf-8?B?cjRBQWVXS2tUbThSSUUzNTF4ZFJwaWNsNkFRSk5LNm8reGRPUC8yUjVKQ09M?=
 =?utf-8?B?ajhxMlM3Wm1oZFVDOHdxRUZMNU9SZGxLdHlUM212WFIrejVGdVRCZUpiSzBJ?=
 =?utf-8?B?cXJIY1RJWXlidTBxeGxMQUhGOEk1eXBjZDJtc1doMG5wSGFLK0RKVThWckhm?=
 =?utf-8?B?ZDJ3MnhFOVZKdjhwUHYwSnNTRjQ5V2hCZU1xbjZkdlJsaWpGU1dIam9lVEdJ?=
 =?utf-8?B?aVU3aHVjZzI3ODdxd1U3VElReng0aDI1emdtYlRCTEd6KzR2RFB1aXE0K0F5?=
 =?utf-8?B?L25vZXVGNUYrVTg4N0hUQmVBdmxxclhFdFI0aGk2YlFHUlFzamtBb0o4UGJS?=
 =?utf-8?B?eFpndWx3Z21hWGtiVlpiOS9waTZkejBuWFc4MWgrTWM1bEhGTnlOWWM3K0dt?=
 =?utf-8?B?bjZPaGVja0Q4c1B5UU1HaDZlbEcvYlNmQ2ZUUjBnT2tMeGZtemhhOUJscWU3?=
 =?utf-8?B?U3dieXI2Mnp6RythdjdPUXhxTjJpbytPNVozMDg4Q2xZSlBHMjFtM1BlZW9o?=
 =?utf-8?B?TnBBeVFvelBGL3FNRVJNaEprcUh6SzZ4SEcvandscUJnQlJwTzQzdW16cEI5?=
 =?utf-8?B?dGc3eUtwb3Z5NW9RWCt2Q2dSNmZObkRSSGcxbnY4cnFMRDRHTFQ1R29hM1M0?=
 =?utf-8?B?SlpqR1gyVjViVTF6cnV2T29FUThucjZhWHc2UlVScXd4aGJQYXp3UT09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 231f62cc-1863-41ef-c030-08df089643f2
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 02:02:39.0372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xg35JoVZKV+S+m0sLE6kg5CYX6ylmIrYXDUX27hU9YLJpc4Vf2hUAaj5IZX3MIkEFXn6+iftZ74q80rDIMbg2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP123MB8292

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
report corrected or UCNA errors (per Intel SDM Vol 3B §18.5). It clears
these non-CMCI banks from mce_poll_banks and ensures mce_timer is never
armed when mce_poll_banks is empty. Additionally, it integrates a
housekeeping check (HK_TYPE_TIMER) so that on legacy platforms or
polling-only configurations where mce_poll_banks is non-empty, routine
polling is restricted to housekeeping CPUs, sparing isolated nohz_full
cores from timer interrupts. This eliminates polling timer jitter across
all CPUs in steady state on modern hardware while preserving full polling
capabilities and isolation guarantees.

Thank you.

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

 arch/x86/kernel/cpu/mce/core.c  |  8 +++++++-
 arch/x86/kernel/cpu/mce/intel.c | 11 ++++++-----
 2 files changed, 13 insertions(+), 6 deletions(-)

-- 
2.55.0

