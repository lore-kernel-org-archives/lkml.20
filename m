Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA6646AA6F;
	Wed,  2 Sep 2026 17:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369338; cv=fail; b=A7zqH4ePHmKXe5e8OhVcEBaaPopBOQIPiErqE8dWF/9chZCidGy8VG2xGK3iniKii8bR9xmSxFJrZCdb2LZmwqQu5dEaYoIACvjJBaEIB2HoTdvI1rL/NwR8SZVtjwNHqFP3tu7w3g1Nywcof2ijTXktKVttkjEPj3fDXjHTwL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369338; c=relaxed/simple;
	bh=Dq4oqMcrQn5SiE3qpn2r45OHcpA3gqNEmsCcjAUcx/E=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YxXaqH3F3CU5ERax3CtQzG2Soq8ZgnGofA3w4cx5Dj4dPV06vyEiaBSyA3s5zfB/jqEYPWoMzK5PLvUs9Jq9OUn8vbSxMFUEVNiH65pUP602jyv55tVLlWv5uV7hEtmf6qcqg69oCmVEUhOC1j9TBkNHA8o2t/aCuQwXmLardj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RBDs4HWu; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RBDs4HWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788369336; x=1819905336;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Dq4oqMcrQn5SiE3qpn2r45OHcpA3gqNEmsCcjAUcx/E=;
  b=RBDs4HWuvOgWVdola3Y0TYiZR43wNbc4f/clIx1k8n1WngnZGqTNfYLB
   k3AIIyhCAsqZWG7clviPY/4vypuDWdT2leoWpoqpw2RaK8oWHcfVNb2Dy
   +Dydi79dhRzlw1IkvvRbITKnIaHn0JReJydEYcBkg57O5R5EQvDrj7p7D
   Ui88hKpkVZZPQbiquZcEbllka6Re4pnQBafVPG/zJ4vdf5XdKZGpBLyO5
   Puk1UALLSRfX8n4GlUxYaU2TB0q+xCnSZosRGpOu7bR0vG2eO0RNgQ7jw
   Ym1GAWZ8MCDFdyzqipLpUXyp3GfHOwgoXa3iLLBlJyiXY3cf4SJeIUtxI
   w==;
X-CSE-ConnectionGUID: /g/UYsI7RxOGzJTw+50Axg==
X-CSE-MsgGUID: JrwrQ6+qTaig0rgranpDig==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88761989"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88761989"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 10:15:34 -0700
X-CSE-ConnectionGUID: xkiqDMHOQUeUBi/0squSRA==
X-CSE-MsgGUID: 99UEsVl0TYm9AMokalj2VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="274747731"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 10:15:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 10:15:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 10:15:32 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.21) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 10:15:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SY3TH6vYfvlynXrbF5qGWTj3wgf6mv4vND0mWW6qSN/fUogsm0rnDvAsh0VM9JWmTjZiNrzTDk+LJPtYZ3rcyi3/ko6JPLg6SQb6cXVS5N5LVd32mkZdnSx3jspZ3e+8TnKFi36R2vy7b/8n5nUVZWNGoV0EXzAnWnRewqAF2XWcmN2vwW3ldk3tEtO2j70shG90uVS6UDZ6EWrurNpdTgVv+LYVwrdShWLDEr9Yv2PYQvKxt39Gah/peWERohs5jOimWVZQMFNhst8MAscmHV7CIY3J8/QLoBtzARxJpilbaAeB3LvTmkqcQ/dGGV/X7O/icio/qiMlTCMHRLMWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDcwdDXRWTQ9RsQoGSyUu3baIXpb3wS9+godhZO+TB8=;
 b=IwIgzhtNT1Ya2kSAfhV4J1rnreNoQWcWZ+kPfMyT3PEDXY7Mnw0Mbs0t2361ugKk6MneLb9APy/TtymoCcvqbOh7So/8EmSZFF8uvMmWTr2iE/qk8yT/Imsv1TeDRGoCJoLjryzoddduYL5WjD1yNzZVtAtTDUsv5hUc7//3c1cxEvaWZrOVbzdrAZAPONWRHNUandhD2c+r9+mgpsP/yb4rMeXHuCnLYlYGL8P05Zj/hhtlD4k7JBjRxX7+Lm/bwyHw3H1DCwFVjnvvRRvwieUwrD0LaQe678qv+JQcNKh4BK0+0QCeeR+BVRgNax9W2x+hEsS4m8ykUU3j8MWfEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by IA4PR11MB9321.namprd11.prod.outlook.com (2603:10b6:208:566::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 17:15:29 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 17:15:29 +0000
Date: Wed, 2 Sep 2026 10:15:27 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Aaron Tomlin <atomlin@atomlin.com>
CC: <bp@alien8.de>, <tglx@kernel.org>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<frederic@kernel.org>, <marco.crivellari@suse.com>, <neelx@suse.com>,
	<sean@ashe.io>, <chjohnst@gmail.com>, <mproche@gmail.com>,
	<nick.lange@gmail.com>, <linux-edac@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] x86/mce: Avoid arming periodic polling timer when
 not required
Message-ID: <aphZr7bHxvkhBKiX@agluck-desk3>
References: <20260902020234.149814-1-atomlin@atomlin.com>
 <20260902020234.149814-3-atomlin@atomlin.com>
 <q763ak7xrotyqmzuu4uwxtk5aec5p4mrdwdtsnq6i5sdtlnm5q@ujq4y6wtztlf>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <q763ak7xrotyqmzuu4uwxtk5aec5p4mrdwdtsnq6i5sdtlnm5q@ujq4y6wtztlf>
X-ClientProxiedBy: BY5PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::36) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|IA4PR11MB9321:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e2a26ce-451d-44eb-dc8a-08df0915c9e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|6133799003|4143699003|5023799004|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: aWfrzBFrvsbbsEtsRY8ZMfVIu3Sp45cJKLhXZ7M1FsQcRWf57NWFeZBkjZJX3d+ULawHVAma+4VCaQ9qceSTbC8Mc8wr5lgPFvdU1K4NM6dklDIDcfz47sujDpScUBDazw+TWzk6VF9ro9vm6SDkVn8g8a4IsRVlPyUxY7lfF/I60kBCWX7mmucqcnMftaV8u2lYGGNmQRH6K3xhi5LhEeL9E8Avh2FipcWBVk31vLcxOnvOe1SLVQmS2NLWoliS2RXRLlIslmAvp8Yfej54az35k99mdUgDd0ovb3ZSkKeo08x+vLmbOFG4dNM/OVtuuU778epZvj74YzzQjtfNJ9iyAeNTXPZI3i9+mDN4FLUZ+6HkToaqf1TbwfSyv3mVOMy934c4Ey6BdpOhCYaKppQDJ44FMS3baJP4sicqsaIEdBWglNGghGK3OU2NUvkE4/e4rZ5wIPqdekNsVS7SKhKwemypC5ee2SsezFmSAkqyWJX3HqkmuLatDOdWvfxP+pCNs4boeM4gD+N2bP23Xa1tMcksOX/KMZFrrvblgjpLLjQfciUSepFpFmhtHgpWktedzcIYMv0ZSydzOEzC3whnwyngJhQja1P3AZI3yZ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(6133799003)(4143699003)(5023799004)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OaDi81e9nZc7a1a9MHSrbB6p3DXbrl55Jj4ImhCzO+m3uGX4uS/Fstbb9j6p?=
 =?us-ascii?Q?GiSdcfvNj51lywHWaB0CEnP2AAE5R010eaInj2871x7gZRTaltWMGL02U2Ya?=
 =?us-ascii?Q?1ziFirm+tdUFo+x9S6E3MvX5nE1Eoh3B+hRJP8F5QUaDSMfF8Gzwi04NzGjm?=
 =?us-ascii?Q?14RFEGrb25i7BEYAfOjjE+bCnjYC/SavJZO4KIGLU10KYjvOo2KEUi6t4Upp?=
 =?us-ascii?Q?3H4FXetlb4aUku72BweEGHJX0RHLiswXp9eQH6EmqOPPI9d6C9YpKzHpqtzZ?=
 =?us-ascii?Q?9NwxRpnwJWsM+XrU7nud/a3gqrlgqGNtGXDlDwX5E/VlEIDyGXpifqfcVxGR?=
 =?us-ascii?Q?s7Bi+IR5shcWZle4p7GRSDUwp4qtUTluYbVF/o2v7LUIBu9ceZJlRULL1Jym?=
 =?us-ascii?Q?DszM9IbltcoOfi3lsPHebOhFKdXoWnwUz67+rzJ2Ua1WIGY0gbQJVpPQ8vsn?=
 =?us-ascii?Q?mUirqyiekn3asqsHWvqcsZ5acLQbVdu4QvQz65jbXYOD6JTdUqFgGJ0LiNbx?=
 =?us-ascii?Q?KHD8nguI4fcaPl26OF1CwCJt6fnnXpQutU+MVnzo/BsgMOF/hTHnokd19Fq+?=
 =?us-ascii?Q?Kys80NNYYiNG8aO2E+qswDzXjyx2yDQi1jyOOEgsGX45QeVPaaseypSqQx6Q?=
 =?us-ascii?Q?Vw1hJBp5nHnYxqNc47v32eoBiIt9cuti+y5bnkr0MgPC7Nvbv6Ujmx/7iYWC?=
 =?us-ascii?Q?tUJskmAP42hiuSNLBJbidB9rMnudZwQnwnfQt3koX0riRJQg1G/POSFYeI+X?=
 =?us-ascii?Q?/D/bmF7e752C9Rzucvj3gv8PvthKds2/+n6euoqmSaKzLjW9N3SF7lTEbLrb?=
 =?us-ascii?Q?dHH/lu49b5l//x/I44uhOsz8/ksKkksm3z5vDN5D1QaDWdm+vrz/HVBeCg1Z?=
 =?us-ascii?Q?nGMxnKq6uf8Q6kmqMB6uhG12H8jpfmUM0aX1mp4wYGNm1ri+csyTjDQwjPFG?=
 =?us-ascii?Q?QI14t4DVRPGi/rHGF+S3swH5WjF48QDMz2VgGen/L1KzS/E1JBAN8tH79R7i?=
 =?us-ascii?Q?GuaYOhwSAp/K75n6aun58set2lFqm0+p+HIFGkoJmVK+gNwJfW3T+RHzUe6y?=
 =?us-ascii?Q?VzlYGM6lg2xJgvA+/XRce1cCmx7w42ZyRlg+FIFIDMAV+li46h1vuvMxxqzt?=
 =?us-ascii?Q?iFIOgF7nAaoZm+vgcIa0zoF8Q5jGD6d6iAmPBRMrxeiuXsRSawrEU8faIYbd?=
 =?us-ascii?Q?v6WqsvPBvjJRxujHHK7nHXyudPxHtiPzHKSreMAnoE8BCUFzvxifLoqOcja4?=
 =?us-ascii?Q?K2PZkp/gjHZhg/eeRk4O7fqfPO4cFdpHJzwGgXPH4yQaDDMRCw6D4ZaH3NWc?=
 =?us-ascii?Q?ud25TsM6rxpeqWgCCHeFnqDGzHapfobhKxBz5rtmX5SSS+Q+N0t1pqF0CQuC?=
 =?us-ascii?Q?V2yqz2S+nBbEwUvE6pfxLsUuYsES8Q8tivbXj1JEgMxIL6srcxShITv/ANtB?=
 =?us-ascii?Q?Yfvo/VAslgaKGNp2g2KXVpQIvNrxcSB94LE5jxkajiGwearLVLjoQKNJ/fYK?=
 =?us-ascii?Q?eCJja7jQCjfwvo+CmZ6Wm/ymBtAiXO3aF4stSHpX/o3U3jhN2WBlzIvnHswE?=
 =?us-ascii?Q?O4pKhnvLcJFD2BsQF2AQpn0vxANEiAgtx1lt4qcVkHH5Egg1DyuQHm9td78L?=
 =?us-ascii?Q?PU+/XZMLU0jhHMLwZsKGAsMk0FAQQi0XvMxQUTu1VT8nQd8eFslJybNXX7hf?=
 =?us-ascii?Q?KzuC5bS75j752CqtWH4aPP1jKNwEYzA/G2f1B1dSgHShAoBNghykZh7CIyic?=
 =?us-ascii?Q?BVxT8YWSoQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: wbJwiaTN4yTc0AcvpzdpAGKZ07ySb2aAdPqkB5+5h0V8qkI0Eu5zPOIMEQ9133znRZ7ThZfQujqIRnWa65e+ng7UKx+vL5ATx7Ca9dUMG/HvyHtkZom5E/WWpdqcO/7LRgKyJ/08Qd84cKTLon+jq3lfb4FrV+cfV4qb2EAn2bKQQ6QSHxQLCNAGZnhyvz3p57vYXIpyqycaUVxu5Tz2EcPad7Kw6LZOCfcgipO7ZfhfFOtDZCPRvNdmWvOBhj7jhSXv4XrrBbVLVO9NovtE51Jkzw7UZYvM+YRKlVlkSgYWoW3XrAoWmjPRHta9AQKGtHvc9HNx+SQ82rzZGcx3pw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2a26ce-451d-44eb-dc8a-08df0915c9e9
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 17:15:29.7635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N73kHZx4MYX+gBB147FsbJmyw21o2GK5Lm6q1IsURKoBZSRXuwCbR/X67eD3OBV0CAwIdgeG7pUElRdDQ5FYJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9321
X-OriginatorOrg: intel.com

On Wed, Sep 02, 2026 at 08:36:51AM -0400, Aaron Tomlin wrote:
> On Tue, Sep 01, 2026 at 10:02:13PM -0400, Aaron Tomlin wrote:
> > On x86 platforms, the Machine Check Architecture (MCA) subsystem arms a
> > per-CPU, pinned standard timer (mce_timer) to periodically poll hardware
> > banks for "silent" corrected machine check errors. Because mce_timer is
> > pinned to the local CPU via TIMER_PINNED, the timer core cannot migrate
> > its expiration to a housekeeping CPU, causing periodic latency jitter on
> > isolated cores.
> > 
> > On Intel systems supporting Corrected Machine Check Interrupt (CMCI),
> > hardware generates an interrupt for banks with CMCI enabled, clearing
> > their respective bits in mce_poll_banks. However, for banks where
> > MCI_CTL2_CMCI_EN does not stick (such as the Power Control Unit bank),
> > Linux historically assumed software polling was required and left the
> > bank flagged in mce_poll_banks.
> > 
> > Per the Intel SDM (Vol 3B, Section 18.5 "Corrected Machine Check Error
> > Interrupt"), if bit 30 of IA32_MCi_CTL2 is zero, no CMCI is available
> > for that bank and no corrected or Uncorrected No Action Required (UCNA)
> > errors will be reported on that bank. Therefore, polling such banks is
> > redundant and wasteful.
> > 
> > Clear non-CMCI banks from mce_poll_banks in cmci_claim_bank() on
> > CMCI-capable CPUs, and amend should_enable_timer() to:
> >     1.  Check bitmap_empty(mce_poll_banks) so that mce_timer is never
> >         armed when no banks on that CPU require software polling.
> > 
> >     2.  Pin the MCE polling timer to a HK_TYPE_TIMER housekeeping CPU,
> >         sparing isolated nohz_full cores from periodic wakeups on
> >         systems requiring mce_poll_banks polling.
> > 
> > On modern CMCI-supported platforms, mce_timer is eliminated system-wide
> > in steady state. On legacy or polling-only configurations, housekeeping
> > CPUs perform routine polling whilst isolated CPUs remain jitter-free.
> > Polling fallback during active error storms is fully preserved.
> > 
> > Suggested-by: Tony Luck <tony.luck@intel.com>
> > Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
> > ---
> >  arch/x86/kernel/cpu/mce/core.c  |  7 +++++++
> >  arch/x86/kernel/cpu/mce/intel.c | 11 ++++++-----
> >  2 files changed, 13 insertions(+), 5 deletions(-)
> 
> Hi Tony,
> 
> As per Sashiko [1], the last paragraph should be updated to avoid
> confusion, thank you:
> 
>     "On systems requiring software polling such legacy platforms lacking
>      CMCI or when booted with mce=no_cmci, the mce_timer is restricted to
>      housekeeping CPUs. While this intentionally leaves core-private banks
>      (e.g., L1/L2 caches) on isolated cores exempt from periodic polling to
>      guarantee zero timer jitter, housekeeping CPUs continue to harvest
>      telemetry from their own banks as well as shared package-level
>      resources. Synchronous (#MC) exceptions on isolated cores remain
>      entirely unaffected."
> 
> 
> [1]: https://sashiko.dev/#/patchset/20260902020234.149814-1-atomlin%40atomlin.com

Hi Aaron,

You have one small bug. Your check whether mce_poll_banks is empty looks
at all MAX_NR_BANKS (64). But all Intel systems implement fewer banks,
and only clear the bits for banks that exist, leaving some upper bits
set in the bitmask.

This means the timer keeps running.

Please send a v3 with the updates to the commit message listed above,
and with the change below folded into your change.

Thanks

-Tony

---

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 7415d05076eb..b01ad1a9b455 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -1760,7 +1760,7 @@ void (*mc_poll_banks)(void) = mc_poll_banks_default;
 
 static bool should_enable_timer(unsigned long iv)
 {
-	if (bitmap_empty(this_cpu_ptr(mce_poll_banks), MAX_NR_BANKS))
+	if (bitmap_empty(this_cpu_ptr(mce_poll_banks), this_cpu_read(mce_num_banks)))
 		return false;
 
 	if (!housekeeping_cpu(smp_processor_id(), HK_TYPE_TIMER))
-- 
2.55.0

> 
