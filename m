Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE214192FC;
	Fri,  4 Sep 2026 21:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788558723; cv=fail; b=c+btJYesrwkORHxgm2kQK9UbjafeqniXVbehADHTU8iXfSn0/iyLehAHN7Ya4qkVOmgyxCsTlZAkV2ptvzu2g4NqYAy5vzJ3OpnNLINSKhtJinBUQDlV9la9JshyHZVvo8cAhT/Wd9P+kxoraZx12zQ/q2sBRU0vkufT4ye0boo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788558723; c=relaxed/simple;
	bh=u/FEt4/zUnXkpuc3l2hRvfjjJaCTbtOtc2DYyrt0zGA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L4EszguDvFehZ0BzCdCvXg6cqZYaZ3pcgMBdVysxXav9XLE7aTyL7QK0BRKneurD2wHeXcunTqUtQxqHfj+DqxkjXJkWak9+j9KmFGDsMYstj0jHEh8huBqpRvSObfUiMFTll0+pN4lc+xiy545TZ3CXJZ565OsPVSBbaYjoIEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZ3f26Fq; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZ3f26Fq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788558710; x=1820094710;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=u/FEt4/zUnXkpuc3l2hRvfjjJaCTbtOtc2DYyrt0zGA=;
  b=kZ3f26FqHfEDGPgJW6tU0Cx6odi9UmdzJQiGWivhqSNTjNosPzXRYKyQ
   MhAx66AvOwY3E7nSUrltCAusp0HBJDU7LQcaBCoRe6FLlq8h6LslrFev5
   6EmEgmHnAzKXj3YbWwu7XfsDzPyw4+tq3qPktSmvQ0NJ2ie+vtjU1Ogff
   KS4Ag1imEAWdha9Br8R4y6ImBKaqqZBegd7l/TvDZS/DiiJ5R0+eXQSPX
   xw8C0zmihvD7f6whq8ahvgNCJ/7zbSpwWyGln557zWc42nmZN9vf9pln3
   G53U6c+V3BN968MQ4SKc4amj3lVXdnFFEGhVyB9drYhRZGEoWN0AjgIek
   A==;
X-CSE-ConnectionGUID: CVOSXHIYS46f9reSlxBw7A==
X-CSE-MsgGUID: xmpJI22mTpalwqBDVOU26w==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="100224226"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="100224226"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 14:51:48 -0700
X-CSE-ConnectionGUID: vVmwIOhlQyKkSfPaoS7EMg==
X-CSE-MsgGUID: Y4WSs3rXT220HRgwIlLq9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="270673175"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 14:51:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 14:51:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 14:51:46 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 14:51:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQPkpHHiv1Ve6jrDM+3caKmjEOva7Exm+mDS1vAXodHnqEIB0jn0Rb+lnCYVpxAeuvGghhbmFHY0hxBmPDRipkbPTACYW9ni2jGUt3EXPU0gC2mzfpC03Dj3xT0qigLrYdlnbXCVrXrqOwbfzM+WdIv+Ojw3H8rG0OyZdAmHRbVG8HkDRz9V9KcUQR7euUoIvBFuG0/7BoEbQHbqhPZLv2rwnDUMx8JBv5eZWQ2c123+FPJt73/FVigfjjhP2zcdMMJ2zi8s3VZ1aWI3of2OOHiHyRlksoK11VQJm1ODbHbqQE0CVlrZrWf34UmYUR5aCzwAHc5VsahBc5/lBZEoWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ed+VxG/6hz4rcsZc3AI+8szJf9myNoqLdxB+GcyT6NA=;
 b=fjI0b4o3x/cJmmbyNyRAQ+K4LbJoBlovyyd9iK3sxQU6ShMAmWX9ixCJg7B85TP7ZdcRManF041hpqyR7QmpeFr/tfurQDBMmNj04xV/h7UccPQ6G/SPi5W32aoGQZKh/G5vg0WS4Nr2Bk26Xg4pvMKbA+G3SU6ryoNyIsWkNjDhBAQYeOUEyYfqN2c1DCdj+vPNZ7EKqC0EdZw5OL7jJ8jBW4JnDiQy3Kttb+pwbEGyhD9p1UW6IN/TJA2mo/a2jWlg3i1+gscwW/sHYOtLbaS5f53tMD2Kzr7cuoFIb9Q3QI6HOjdQSjs3uliSxs7lCdrdHIlyfeNryZfjg0uWHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by LV0PR11MB195454.namprd11.prod.outlook.com (2603:10b6:408:3ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 21:51:44 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 21:51:44 +0000
Date: Fri, 4 Sep 2026 14:51:42 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Aaron Tomlin <atomlin@atomlin.com>
CC: "bp@alien8.de" <bp@alien8.de>, "tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "frederic@kernel.org" <frederic@kernel.org>,
	"marco.crivellari@suse.com" <marco.crivellari@suse.com>, "neelx@suse.com"
	<neelx@suse.com>, "sean@ashe.io" <sean@ashe.io>, <rishil1999@outlook.com>,
	"chjohnst@gmail.com" <chjohnst@gmail.com>, "mproche@gmail.com"
	<mproche@gmail.com>, "nick.lange@gmail.com" <nick.lange@gmail.com>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 0/3] x86/mce: Fix timer list corruption and avoid
 redundant polling
Message-ID: <aps9bi_M1p_Adwkg@agluck-desk3>
References: <20260903194130.186096-1-atomlin@atomlin.com>
 <4pab5o5tt3qvpu7jcwuf27g5klrkeoyjgzhvw5s7sc3v5wdtl3@dlwjcvr55gck>
 <SJ1PR11MB608333A92F98196EC747C75CFCB62@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <wzefzyuv6cq3ql72fee43j5e5z3zkziv2cisaln3kyai4557mc@nkhusexbckeh>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <wzefzyuv6cq3ql72fee43j5e5z3zkziv2cisaln3kyai4557mc@nkhusexbckeh>
X-ClientProxiedBy: SJ2P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::8) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|LV0PR11MB195454:EE_
X-MS-Office365-Filtering-Correlation-Id: 115836bd-9bc0-4cbb-2e19-08df0aceb5ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|56012099006|4143699003|10067099003|22082099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: EAxN41o6QKMgolhyR+WR1fTd6k8mdfPsZ5mEwkPmVRd00eORyPhi3RMtqmuF+pN0qeJbbx+hlX6rk35T9/A4BOVmC//ctZWQYyl0mpYNscv2AUQ1Op6ivEi6XnrTEFB9J1YpY7w/+OL6HVOIPIu5jfSOtPkdaoj7MPbElu45umsFk8EE3WMVgtiht085UR1llyB9pDdBi+zjZoVdDdS3Uh1SdjCYqkU3YBGVCyhv6tmQ8ciQHepiNh+v+9v4K+Ntf5iP4t89Suz8z4/Zhyvxr6yLhPZLlZLwWKYNXYjhQVDN0R6PKa2G5WaGHp3sHuG0Razm/dD20+ptu83XxfCM1rLWSNhADXEl8UaMmb/7c5WX+vDcs/gGkgGgy6AXMu0RcZOpW2sgZEClRMGaO4Re9EqXxhDOKCm7qEwFJxzzIwWC4m6vbMwmSoALRz2+D2e1kAcroat2AWI7Lk8l9xuYlZS+JdOQunVwPNVbeMlT+XM+2SQUqeUBomDTQoIovEwVzFtOnR9iPeIDwz62N0bpaC6l8/MqB2xyCgwE+QnUj0hShhBRFvDhAYPF/HDjrt92dPjcl2xYY/q8xi8KrjSChRodKy8NiXHT8z7kZS3abbXyNWkZhAhlS7eNI3U295AfmOaMo9TPOuWXiEPglzDJ/40Qg9tX8/6ilEI80xmbqkA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(56012099006)(4143699003)(10067099003)(22082099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VAQH/F1ASJ9taeAzIol2KuJuJzJLQ4Ke7BcwToFlU/HkkqTMV5BnNUMGbc8I?=
 =?us-ascii?Q?Kzaer0XJ15brkD8URyVKWnY5o8a1dRg/MKWptEfpOF4GEdwmN4SMiYGazqf5?=
 =?us-ascii?Q?LmZw8ITaKzpnnxtTw2XRg3kSzUG6jC239Fww0RrsPeG35UimtNTSF7WuDXSx?=
 =?us-ascii?Q?uf2CuyPfjNdrOdxUJz0qFzWrDYgi7pJOVan1d163hFIROd+oymVBv1uh5xNI?=
 =?us-ascii?Q?oDEGkLVBmsgTQ13jQGmP/fzQsRp4905U6W3i/XBOw2rJOV5ts5B+mIeJDoG6?=
 =?us-ascii?Q?XZPV2QnmRpRsOS1HMo4hOe7NoouKdSd0JPWcxnWXPZF3QCjpMXCCF7+h8P4o?=
 =?us-ascii?Q?A8fn6Th3/UlkTmVf76dZR0zvVVVfiOjAyEWNz7da5mAu/+Gz8yELzhsYmrup?=
 =?us-ascii?Q?iZszVNAGJKxy2nagIbMabNjf58Rv8ktF30LdGRKvfRPVmT8/guhE41KMkW9p?=
 =?us-ascii?Q?21bLrAEQL69+wz0YTrRmgEVoiO7oW6OmY/mkt2mh/FA6MSafvNZn1IYJTWSe?=
 =?us-ascii?Q?apSlP8BDMP7xzJjtDbDsjIxJ4+Tl9KH0flzclwVvb/vlbsy0GR4h4qhOIzad?=
 =?us-ascii?Q?4lKoQMhgOAo+egcwfiRzjJpMXl1bZwZfMhYmhVxH1nxrjx9/nyUOqqfc5U68?=
 =?us-ascii?Q?B5jxZVVtKUav61/KYfoEspket/j4eJvlKlNrEkUixFJ7YA8Rp6L47ZkT496y?=
 =?us-ascii?Q?3Pj5E0hP6GtSvb6xgt1pf1nk256jbBrhpyQmb2+gK1Nln7RvKmr2xELjtWtm?=
 =?us-ascii?Q?yIcX+569gikzHnbcuqzHGa2JEUD2arEe/LGKnyGE5oUTsIGCMhtH9nncJvI3?=
 =?us-ascii?Q?774NgJK4gGbMQPuQ+Bg7t3vylyKqYnVVzjgyXLNJziY/tolQatmZ/yLt9FVs?=
 =?us-ascii?Q?oxHxYPWj0/P7oc+nW4/Nt2BuypQOecFinMXBTyOPN6bHaiOOggLQ9OZrdprY?=
 =?us-ascii?Q?FVyW9G4ZZuHK7LV17ylXtJRIgA6/3D6Fl0BoKhm6/Mjk2oYPuWF5MSz+Iqhq?=
 =?us-ascii?Q?V+578s/5jdiOtPT8ORAQntA+CEQXGasz+dlPCniLeoMwivgwC1FcI6k4iTnd?=
 =?us-ascii?Q?paJAGYiH2l5VDh31PJ97KYVaClLf+ygqQAx+9YVQ4rV6n2lpgzAmD4EE21jD?=
 =?us-ascii?Q?O4VvIFrLUdudl6fBxZMqVPGv4T10QIeolAhdjcXzHqlKH/nCTV9F1bJzFTdl?=
 =?us-ascii?Q?EfT+TUVarGIrp44aBXruWNZuq0YJgO7FlFx8t5XBy8J5H+YACHIzaoQsYqgJ?=
 =?us-ascii?Q?iJKCxvO8K0EKLk5A/5RAQgQyUBiBMrxR48wZybyM7yaWn3+/ym3R83o9xfjU?=
 =?us-ascii?Q?Y9Yii0yK1V9RjU/VNMs7YY99vxEtQ1UjjF1pgag/U844FCrPgYCvPqlR1KFB?=
 =?us-ascii?Q?AJBxrR7d3K7ZDsNYAb3IPZa1x8k1GdcbT1ukGFsFLbheLq/c902TzonbQtCj?=
 =?us-ascii?Q?fobPSdjeSkU68V1WaTKYTZFmAuPmDiZhroT71aaizozmO+l4lYJoA97f4xLZ?=
 =?us-ascii?Q?YXzy2hGlDwfzkhH+9lkhas0epj4dZqMQST8D01ard+k35738H4UXGpwUqWwd?=
 =?us-ascii?Q?/6g2umHWktQId13TdOrwX9OubkOH5T6sP2VcoHIGn+wFENv5MEP215BzG48+?=
 =?us-ascii?Q?l9izRu7kcaj3Z6OlIjRiV2lUuwtWjWcjve3kP0DotB3P9nrSOGNPAhvGdZto?=
 =?us-ascii?Q?QeGYsx0e8swNxpERa2I7b/mxM0LO7PlJUkGCrqbYV/Ne7myVMKMzVMPTNR+y?=
 =?us-ascii?Q?WpHq/rEU3A=3D=3D?=
X-Exchange-RoutingPolicyChecked: QZQsZpGdgayPZ88BAmCmNGozUBtBdzFoBwK3jJiF4s/i7zIkAO2nPGIjsBMzKABLu5LiAtXvmraD2ZLNSv9xhrgpebr/XX/CiPPt/XrGbj+gbHa9NxwzAGGePfiBIsOjRM1NafRhaf16yS5h8dJ8qsvmPpb5cokIc6gw9rtJ+7e45x5GtOGqRXcwPZwF4elY8bQHQY/uMwdNv0PbnnkfJrmuH4bWs38ZBwHAoqdhOYFq7weJx2hZy3DKwzV/XjgRKIaNmHS5lzhyYwYklA5ddPVyr++RfGi6gEtOgfoEVtgcdgaQxqHvse8F/EarInH+I8o0Z2g9j0+2hEYjpFhxTg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 115836bd-9bc0-4cbb-2e19-08df0aceb5ec
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 21:51:44.3167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pe9kWcTPEBXFWZQAd0iy+eaIrGKcyyYNXyLuFPhJv33ZhbvfROJeEquC7QG1P9y55uIxFoB5xsmMwJ6NhHOwhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB195454
X-OriginatorOrg: intel.com

On Fri, Sep 04, 2026 at 09:54:18AM -0400, Aaron Tomlin wrote:
> An elegant solution is to protect the storm transitions in both
> cmci_storm_begin() and cmci_storm_end() using local_irq_save() and
> local_irq_restore(). This serialises the counter updates and timer kicks
> against local hardirq preemption:
> 
> --- a/arch/x86/kernel/cpu/mce/threshold.c
> +++ b/arch/x86/kernel/cpu/mce/threshold.c
> @@ -85,29 +85,37 @@ static void mce_handle_storm(unsigned int bank, bool on)
>  void cmci_storm_begin(unsigned int bank)
>  {
>      struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
> +    unsigned long flags;
> 
> +    local_irq_save(flags);
>      set_bit(bank, this_cpu_ptr(mce_poll_banks));
>      storm->banks[bank].in_storm_mode = true;
> 
>      /*
>       * If this is the first bank on this CPU to enter storm mode
>       * start polling.
>       */
>      if (++storm->stormy_bank_count == 1)
>          mce_timer_kick(true);
> +    local_irq_restore(flags);
>  }
> 
>  void cmci_storm_end(unsigned int bank)
>  {
>      struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
> +    unsigned long flags;
> 
> +    local_irq_save(flags);
>      if (!mce_flags.amd_threshold)
>          clear_bit(bank, this_cpu_ptr(mce_poll_banks));
>      storm->banks[bank].history = 0;
>      storm->banks[bank].in_storm_mode = false;
> 
>      /* If no banks left in storm mode, stop polling. */
>      if (!--storm->stormy_bank_count)
>          mce_timer_kick(false);
> +    local_irq_restore(flags);
>  }

I ran this past an internal AI, and it said there was still a race in
mce_track_storm(). This test:

	if (storm->banks[mce->bank].in_storm_mode) {

is made with interrupts enabled, so another CMCI immediately after
picking which of the if/else paths to take could change the value of
in_storm_mode which then leads to corruption of the storm state machine.

> Now, regarding the second report, Sashiko appears to be correct. During
> early boot, acpi_hest_init() -> mce_disable_bank() broadcasts via
> on_each_cpu() to clear Firmware First banks from mce_poll_banks, but CPUs
> that are brought online late or physically hotplugged miss this broadcast.
> 
> When those CPUs come online, cmci_skip_bank() currently bails out early
> without clearing mce_poll_banks:
> 
>         /* Skip banks in firmware first mode */
>         if (test_bit(bank, mce_banks_ce_disabled))
>             return true;
> 
> Because mce_poll_banks is statically initialised to ~0UL, the bit remains
> set, defeating bitmap_empty() on hotplugged CPUs and causing mce_timer_fn()
> to periodically poll and clear Firmware First status registers.
> 
> Clearing the bit in cmci_skip_bank() resolves this cleanly:
> 
> --- a/arch/x86/kernel/cpu/mce/intel.c
> +++ b/arch/x86/kernel/cpu/mce/intel.c
> @@ -181,8 +181,10 @@ static bool cmci_skip_bank(int bank, u64 *val)
>      if (test_bit(bank, owned))
>          return true;
> 
>      /* Skip banks in firmware first mode */
> -    if (test_bit(bank, mce_banks_ce_disabled))
> +    if (test_bit(bank, mce_banks_ce_disabled)) {
> +        clear_bit(bank, this_cpu_ptr(mce_poll_banks));
>          return true;
> +    }

This looks right.

>      rdmsrq(MSR_IA32_MCx_CTL2(bank), *val);
> 
> If you are happy with these two changes, I will fold the local_irq_save()
> fix into Patch 2/3 and the cmci_skip_bank() fix into Patch 3/3 for v6.
> 

I don't think these fixes should be folded into existing patches in this
series. They are distinct changes fixing specific long standing issues.
They deserve their own patches under the "one change per patch" doctrine.

Also we still have:

static void __mce_disable_bank(void *arg)
{
        int bank = *((int *)arg);
        __clear_bit(bank, this_cpu_ptr(mce_poll_banks));
        cmci_disable_bank(bank);
}

That should switch over to the atomic clear_bank() or there should
be a comment on why non-atomic is OK here and bad everywhere else.

-Tony
