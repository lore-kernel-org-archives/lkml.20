Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E4F4C8C4D;
	Mon,  5 Oct 2026 15:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214229; cv=fail; b=c1V5Ka3mqqG2S+7ByCucptk7wng+KxNZChmdHEEjjGRdNOiYPeONXz2mqcIIW9zTmkSV6pQfpY7Qz31/ZXEaZ2Jnz6yKqMHjzKZDXz99CTNrBR7C/w3kENt9kEwk5ksu8Zz4IJc+0HP31JRFUmeiKFrEESGn+geLz3YAiiSxMmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214229; c=relaxed/simple;
	bh=UkwwHrWjPizKKz8bPkQTXqGj9E06ZTQji6M+p1X54TY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lEO3ycoO2A30xCoFaccnYLWW3VY5Pu1M/7GYywtoeRC2qVahmeMFp9bpQhX+MTCxPRdEGoHnDdGmGOwyz6kjN+6gwGsBSjuIZoLLb9iB9UXlnb/rv3Iua4SiA54TdfiGMr0UlXpLRO5qhlhUqoaDvFuRpIf6w5uYHbrWUF065KI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kq3DOVGU; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kq3DOVGU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791214226; x=1822750226;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UkwwHrWjPizKKz8bPkQTXqGj9E06ZTQji6M+p1X54TY=;
  b=Kq3DOVGUj4atoMcDFaHJrP3Nnft+e8Kfb2jbK0yyg+A1M4p1VrwJ1cEQ
   CCVb+6V2BhRu5d/bvIjSNJsOZG+iEVAE10/6LfddVHaaJUt/mjmAkUM6+
   PgNoNirb+PCXpKhj3MNp8Ae5xBSNvFbQhaRTLJJ/P9UZHnS7Vib3m7B3H
   pfohiTVmKenpqPLI71nKmg36gMSz9c6Cnnc5nLYbfZ+dhr3xPc0d8vRhy
   T10tKC5pWqSh1M1f7iEqxKFvjn0TJ4fDdcm8bzZKaFqTnotNGb6lIyooo
   oUg2Yn02r8d14QGXyTMU0ZeTh/jfCMS6/v2MdvCIEPzkZHzYKSv6LfPKp
   w==;
X-CSE-ConnectionGUID: i8D4YmWqRfmG23qPEJVydQ==
X-CSE-MsgGUID: BwXKR4PnTGWbi85HHOTaEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="113668401"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="113668401"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 08:30:24 -0700
X-CSE-ConnectionGUID: W2kbONxuRn6+EvVjyphYNA==
X-CSE-MsgGUID: P6ZZ7puHS9qfYNuJBxKgaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="314853084"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 08:30:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 08:30:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 08:30:23 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 08:30:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ui0cZGKusx+QC6YdzgY6gkziIXIX+XgPnSZqqas3tOXeBO/9be1w5ISC5/BbmtSBVcQYxH+DsmB0+4oaYJc7SULaMVWHWMp/ogs3lHdm7FU8FgXA2TXk6uqmnZuRNfwkoOJj+TsbU+9cNIuEakuqgtCoIWINcCwlNBInGG4i7AtJxhPta5wUi38OD/3Cp1zSraofBNdRdwjpTCZiiNcFN29eYm4gjHBTkufibtMxwv7/PBSN94OzxpVlgxjqHBj7cLZ44+hsDkL62w4h0RZEbUdHjF+DlEDZeRbgjHFDKQUHI8IkDoKGcTdweTzRsh8qbOQRKbTd8kQNPHYMlaRtTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RjrNQ6C8rlj6hJ2Cvad8fdcJEhZRA88ss4GjPCYRvE=;
 b=JpL1NvWgbHQJfJS83c26OtbVyTut8BaWBID18vUeM905M3f1vwn9fH3nWwaaHaOYLuPIGQ2PcdBCkopeG3usf5V/DGnlPzXzJlaB6T2NSLaaxpSKytkF7WA5DY2c2+RtoxaxAAyudgaWdD2YRO1RDZica72yNLXtOhsKQv85WGB9a12EHsq6nVXB54pl5O16e/cVaSuq9WjthywUF57a0avUcv7ALJNMB4eZzpfdnlXrSvTtZPjmSqR4WlHw04WRIONr4Gd675PjnT3cUM7x8L25t03ZcfO8VwHNA5sfcfszgH+tRxxxwUcW6BCw36QzeLrCqYTahVxYwxRC+NMhtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6077.namprd11.prod.outlook.com (2603:10b6:8:87::16) by
 IA0PR11MB7259.namprd11.prod.outlook.com (2603:10b6:208:43c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Mon, 5 Oct
 2026 15:30:08 +0000
Received: from DS7PR11MB6077.namprd11.prod.outlook.com
 ([fe80::5502:19f9:650b:99d1]) by DS7PR11MB6077.namprd11.prod.outlook.com
 ([fe80::5502:19f9:650b:99d1%6]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 15:30:07 +0000
Date: Mon, 5 Oct 2026 08:30:06 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Adrian Schlegel <me@adrianschlegel.com>
CC: <bp@alien8.de>, <x86@kernel.org>, <linux-edac@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] x86/mce: Do not treat cache hierarchy errors as
 memory errors
Message-ID: <asPCfst7xxx7pqag@agluck-desk3>
References: <20260927151904.30524-1-me@adrianschlegel.com>
 <20261003222012.19685-1-me@adrianschlegel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261003222012.19685-1-me@adrianschlegel.com>
X-ClientProxiedBy: BY3PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:217::29) To DS7PR11MB6077.namprd11.prod.outlook.com
 (2603:10b6:8:87::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6077:EE_|IA0PR11MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: dde0efd4-c85e-47ab-a6ae-08df22f5894b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|260925022911599003|10067099003|56012099006|11063799006|4143699003|260925021911599003|260925021311599003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 9bc4IRuzOI0ktA8gl6XFWREG9SJAE7sqVgglra5mcIgDhd/F3Pb2hlgufDQoVwlSJQAhtAIZNXz30c5QEp/9g2TSKlTd1eC/kWpodnvrfp3WnyxnQUP6Id0v1e7oMwsEtkMqn218P8/jWSmSz/zKlSGuctAlQtI2W2WSgwkKmkE1TvUFNRu4V4Q9fdql6qMD9KU/sly0VWjVmgffXSrWfw4H06rAEO1uq7/Y7bMnNSoA8oikuG0oCf7jtkhvXFZZZibcOa9mjStPml6P/wBL2QGGKzfVerVc/mj4GvXKsLrKAU0z2ZMjXZ7Ee/R6Fp1r9hJ6/U+qLEjAb+UGvk+CwzNrVlxmZOGaZUpVnabj7qbYiLFd5lxjBNjHnRKcM1Oih+91BmLUhTsD2Am3i3l2HGFkTFEch7FAOXlfYRsSJ4wWOYFGmhYdqDFZtVepfpQFbK0raBpku50gQ80S4r2lGHmARsCaZz4PdhH1VFRfFQlz1l8VCvu9voBRVdqi1o/VqkPJkK6hBogE4HzWtQhv2hP8F68tnqF5LxXbFeOpNtIN/T5/QXjHakfqNm3Z3Gs9G7Vm4PJtl0cwaqjEv20uzFUb1s1r8c6ZHn6Qd1vSB4KMgTz6R3p64JIbOlR5IwlCNZOlhKL46d4fex8pKAPvvrwBIYIPYwrkzj9VxFA+jE4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6077.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(260925022911599003)(10067099003)(56012099006)(11063799006)(4143699003)(260925021911599003)(260925021311599003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CB2fWr3NhexmRpHnDxmISGejx+RCJNRg9grWOrpsAbkPqFMmsyaj99BrXSpH?=
 =?us-ascii?Q?OSI86U2FGKaqR51aWen8xlQgdAwPLGlCzPhfeyjc7yW61SO45DqTr0f/Fmxa?=
 =?us-ascii?Q?BW3HV/jChQu/3e+CYKo93joQD3J57YxqGCrRp/ii21dsbPx6Tq9OVY6DtlbF?=
 =?us-ascii?Q?IKFjKWGAXUz1YCVIR+ESblcIX0gRQ8EZqk9BULMMnOVgq93HV3sHhfhs0RT6?=
 =?us-ascii?Q?0yndQ5MiqUd/PkIALG0TQ94MX5B4T+ABBfqEcaj6gzMA/lwCLDNETOVrmvIE?=
 =?us-ascii?Q?SBxSLOxyxOxNfMCwszs/Y1eqjGzEaF6lzVl3/R5/4hZDaZQy0dR/VJlW3oFy?=
 =?us-ascii?Q?ZXeVgjDxKFjFOfhysLjEhUix2lxD7PIklbRzlcJwAiG5Pa7l0hyErauWeREn?=
 =?us-ascii?Q?vwUU8HlfwowPi5npRsZT2CLe1qbtU3jxUQYf03pcVpRIU4rjzjO51tXforg6?=
 =?us-ascii?Q?q4KYP3RyehAOf3Br5IVlj6wM0HVZo1zw0e3zvnQQ5Ti9i0qc67yDTl1WxYSM?=
 =?us-ascii?Q?5oomnLz2FtdR2Z5ocK8xO3IUjLcqhszACk87AK463w+bS8auwRx+M+EJeeBt?=
 =?us-ascii?Q?K3hZcxjF0tFbxs+MTEiWkMLfsPBqEAir/ao5ammCHk55nKB8Vwcp0jv5Yare?=
 =?us-ascii?Q?IqkBI/b1louHiw6x7imvyCewJwj1jxeKoRfIjetXXFmpEGUbZm6j7T9o6fhI?=
 =?us-ascii?Q?MBcM9OiNDXwNNal+JobyINYperxfg1VCQ2FTIPJHVyFwEDxpg7XPtThwgUdE?=
 =?us-ascii?Q?U4orq6yq5xJcZ5l8lDU/CyKym/ixkUuv/f35FA0JLEoqXFHw+olce6YFrwt+?=
 =?us-ascii?Q?+NToyvcPohDFVZ3tK94v6xE7xNMwlVBHgr/KehJJCW5NK7fUgTFJTZs+OYJD?=
 =?us-ascii?Q?gO/OFzUzJveeqkmx3P4VgkfHX89AivUhFAgNdB/T1QAo+6EAN9Dm8MRoQ7QX?=
 =?us-ascii?Q?DpC0eJC2B1S1TbyHlNaOXxlcxxia4DFP4JKIwDxNwZpkfpnTVlZ4jmcP5y5l?=
 =?us-ascii?Q?DKeqr+Oeh8WAjn4OGLvZjrrt8An/LmNoxENjXYQVb8yqf4ZAjqOyYWoRqc55?=
 =?us-ascii?Q?FLkKeB8ctPTmCID5Zh4o4WXUtDtBOcRbjOnMhbl1WdaAsAMR4MJ+V41TMico?=
 =?us-ascii?Q?RBQDMlmK9eOHyz9HxStIpeClOfEjmWRgdB+cAOOKsTj6h7iC1nvRrV1GtJt2?=
 =?us-ascii?Q?4gIl/+7HRag2BIc4CFxF8Z8lTOe7mST1N1GaQPB0TjC7eMX2WTGGkboTau+7?=
 =?us-ascii?Q?jbdFbFEjkHxhBbDFAU0CE1hEuV7cJgfEuKi6OjmT30ECghDrQNQwmbm40TG8?=
 =?us-ascii?Q?zdWXzxKwUboir2bTDSpUtVf3W8m725CksnDxKOmjzEgUxKTrzGAL54YgK6Yq?=
 =?us-ascii?Q?Oz4k4L3hU8QRXsAHKhLp6kxsJyg6udK0ua+asKknYicpFD20HIvU9ruE5sNd?=
 =?us-ascii?Q?CGYLH4N/HNA+SGczNrm48POnSZtn8XqSnTesdW6JDT8+10Ylr1EkMAosIXHr?=
 =?us-ascii?Q?jetD15ihCbCt81xCW9xBHfp9vBoePXQk+fyc9XW5SrXRDdu3RFy+RAHkMMlW?=
 =?us-ascii?Q?E3K9cui5UKSqIDesDp2miq8NAaaqZsQ0WDkJ6D+xqoU1idq+gVlOtb7mtRXp?=
 =?us-ascii?Q?NlJiGyalv/PoqptNatFYT1HfQFvh+XHBRNmhHKl2E1qjockhNrwg4w/eH/Uu?=
 =?us-ascii?Q?rgiz0PisbbdffB2mbB5C9gzl1EWxpOab+VdrJm5Gg7PN4YdC/clbTCWb+W6D?=
 =?us-ascii?Q?58BdY6holw=3D=3D?=
X-Exchange-RoutingPolicyChecked: SpVGtmkABstyd91t+eXuUQ5vxcUTTcLv4sYAubJK8F/8mXm1KENZaUbp7PE5jlvkVsS/BsimPdxJDpAoLYxfYlFls3HicJphEQHnUUdEWmg7SolWNY6i13NrNHUwbBSDaXpXxNyBvIsYqdwoHiPzrUcHx1YtQT3fNDEk+3LLwlp3qzsJCwAXH830L9j960HW0QJm8bDLF63S5WbnxFl+z4PqFjyNog811x8jlFlINocgrTCDqC4DXo4nojgOLacU8jte2vgTppO831NC0sqb24BqBAlInZkHXobtMhYEM2IqYAhAqasdb1A1pUbjJPwI/6vGKVZM1p2Mws+ViHWOzA==
X-MS-Exchange-CrossTenant-Network-Message-Id: dde0efd4-c85e-47ab-a6ae-08df22f5894b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6077.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 15:30:07.7367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qzgs2NPhqNWh5KFTNpumSOTLpyU1emhficxUIhoJBGyF/W0VGpczQ68G82jzB2U8292cIipxtt6d40IYCjnd/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7259
X-OriginatorOrg: intel.com

On Sun, Oct 04, 2026 at 12:20:12AM +0200, Adrian Schlegel wrote:

Boris pointed out the very long lines. I think you have more details
than necessary to describe the reason for this change. Be concise when
rewriting it.

> Fixes: fa92c5869426 ("x86, mce: Support memory error recovery for both UCNA and Deferred error in machine_check_poll")
> Signed-off-by: Adrian Schlegel <me@adrianschlegel.com>
> ---
> v2:
> - Fix mce_is_memory_error() itself instead of adding a CEC-local helper (Tony)
> - v1: https://lore.kernel.org/r/20260927151904.30524-1-me@adrianschlegel.com
> 
> Tested with mce-inject (sw) in a VM with an Intel CPU model. A corrected cache error (status 0xcc5ffc0000100179) is no longer counted and its page stays online. A corrected memory controller error (status 0x8c0000000000009f) is still counted and its page soft-offlined.
> 
>  arch/x86/kernel/cpu/mce/core.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
> index ab469605f..4d2ace76a 100644
> --- a/arch/x86/kernel/cpu/mce/core.c
> +++ b/arch/x86/kernel/cpu/mce/core.c
> @@ -542,19 +542,11 @@ bool mce_is_memory_error(struct mce *m)
>  		/*
>  		 * Intel SDM Volume 3B - 15.9.2 Compound Error Codes

Intel keeps adding new chapters and sections to the SDM. This is now
18.10.2. The split into volumes has remained stable.

Future proof this by just referring to the section name without the explicit
section number. Should be a good enough pointer for someone to find the
reference.

		 * Intel SDM Volume 3B "Compound Error Codes".

>  		 *
> -		 * Bit 7 of the MCACOD field of IA32_MCi_STATUS is used for
> -		 * indicating a memory error. Bit 8 is used for indicating a
> -		 * cache hierarchy error. The combination of bit 2 and bit 3
> -		 * is used for indicating a `generic' cache hierarchy error
> -		 * But we can't just blindly check the above bits, because if
> -		 * bit 11 is set, then it is a bus/interconnect error - and
> -		 * either way the above bits just gives more detail on what
> -		 * bus/interconnect error happened. Note that bit 12 can be
> -		 * ignored, as it's the "filter" bit.
> +		 * Memory controller errors have an MCACOD of 000F 0000 1MMM CCCC:
> +		 * bit 7 set, bits 8-11 and 13-15 clear. Bit 12 is the "filter"
> +		 * bit and is ignored.
>  		 */
> -		return (m->status & 0xef80) == BIT(7) ||
> -		       (m->status & 0xef00) == BIT(8) ||
> -		       (m->status & 0xeffc) == 0xc;
> +		return (m->status & 0xef80) == BIT(7);

Otherwise update to comment and code looks good.
>  
>  	default:
>  		return false;
> -- 
> 2.55.0

-Tony
> 
