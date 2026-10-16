Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319F02D9796;
	Fri, 16 Oct 2026 14:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160390; cv=fail; b=gWS/DA3zARLQZFG/Xy/GfRn4p49JVP6Hvzcoeotl4x3wcw3NqUqhVtLp0v55Z/hTS+ahgHtnQvH1uj37PJfmv8ApvjkMzIugOiHDHcaUU7N+2azNCG6DGZHSeknakSTLKqtwI29DJWU+7Fh0kxWMtcbqAj8dOXFcsTWDQD89yiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160390; c=relaxed/simple;
	bh=ECXsVKWfIDbEPMLBdCl5Re3KfaKwIXkMmr98S9/++pU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jUw18KF7cEaitEmvHHNS5zRTT+Rfz8q6n9SCi4+6Ze67MpeLI9evW8OU1IQEN/S/Q6nHfTs+tAJFIv9p9cSg309V7Qyf0Cjm3O7IhzV+0RgOOs45c2Lh1m0H/7H42NPpEI5wx/KZU+kOTCPyAEOpvBJTy5H5BPj/42kgoRjLzOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A822xxgH; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A822xxgH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792160389; x=1823696389;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ECXsVKWfIDbEPMLBdCl5Re3KfaKwIXkMmr98S9/++pU=;
  b=A822xxgH2kAqFWr9wknliRbge5GuzpaPvsbhT8Z49R2uq9O+LPsY9JDD
   +oaaRUajmkwJf5IzO/Yme4wNylcLRtKif/p6RiIQNMQ64uV2VdJS4hfhr
   21GveWn/RVUrKUCRe95VmbZxiKaLcvfML6ch5r5SMl2KxIZ+/NldRsRG4
   9I8LBl2ttIFLzR2nYYQW1fliUfLM2wW9zMXswCkFghUFPElZ0QOY34Vyd
   vAE9BeHHcTUE/do3OjQx1e/2JOFF7z3zfSRQgwg/GbQuVO60E06Ej5kgO
   CqpdbKPYNgJiUnMjpmot1amdT87j+JxVA2NrI0LxghykE4haRFr0rXADJ
   A==;
X-CSE-ConnectionGUID: rqINCtk2ThCgxcZzBnZLpA==
X-CSE-MsgGUID: ATmnnwwHQD2RBaNQq/+iOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="830546"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="830546"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 07:19:48 -0700
X-CSE-ConnectionGUID: lt/p+fhfT1W7FtTbzZuE7g==
X-CSE-MsgGUID: 7uosJGQHRbONfmN5LHv9cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2028251"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 07:19:47 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 07:19:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 07:19:46 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 07:19:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3SGY3Duw3vcOPKmgf8Z7ttM160PcB0SryYqUZsYS4BMtEwetbx5VC9dyDE6P44hKaDH28dlEh5MFAav2OBRdTOT7QwCj5uAhH9IwfuBd4Hf5HsquDo04FfI59e420k7kUO+9vrwlkapGt5+Bpom1hpKy4Df2cl9u3MO8qH7Lti2Zay29cHeN6adsjfqjvRoNiB1ITaOSmz3GheJuLhN6GSzwQiQytrcON6iCq5Q17pHbbFH+mMUwO4RqwuhxALXKJ93kxtbvpRHQKChp/2HDNJENniAXcN4VK65Sq3B1VmVqonQ/aKJ1SEKkmud/+NYqQ/zgV4uKylhvW7Pv0f9uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgXhZETM0H1pJsOIhNqs489lyaRCPLVm7j1Yc0j6m3k=;
 b=gievz8fjUgaRxynGqh3nH602BN2qqnm/jzbDWFbqNn6t9hmh0JEA1wCaGlzsBXkn+Lx3MXnNy1MwsHfROycDyoE3PBUhAvMwTKX/XO7eZm0BK1HsebgUtysRYSxUay/RmcIzHzCcVyMLsCIuktWQW+JL+d/1iA3n1sAmt3iUwu1hflnoGoDtm9OB2l1587c04oQSaZ1/LRBGAMo5don4vGJXbban3DkPoycAGdxuGuZzBD6xaO/hnEYyn8g9QtCdmzpgeVdMKmLTHxfzcua8lTMxvUiess8olnP3KtXk9R+I5vIMNma5lyac+EJjTcU2+I5fqIZLfH0FWR25nL5M/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by DS4PPF399DBF572.namprd11.prod.outlook.com (2603:10b6:f:fc02::1e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 14:19:38 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 14:19:38 +0000
Date: Fri, 16 Oct 2026 07:19:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
CC: Linus Torvalds <torvalds@linux-foundation.org>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Kees Cook <kees@kernel.org>, "Jori
 Koolstra" <jkoolstra@xs4all.nl>, Krzysztof Kozlowski <krzk@kernel.org>,
	"Sasha Levin" <sashal@kernel.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<federico.vaga@vaga.pv.it>, <apw@canonical.com>, <joe@perches.com>,
	<workflows@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Justin Stitt <justinstitt@google.com>, "Carlos
 Maiolino" <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Brian Foster
	<bfoster@redhat.com>, Christoph Hellwig <hch@infradead.org>, David Disseldorp
	<ddiss@suse.de>, Mark Brown <broonie@kernel.org>, Jani Nikula
	<jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>, "David Hildenbrand
 (Arm)" <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, "Christian
 Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <atIyeGHCGDTCIvkx@gsse-cloud1.jf.intel.com>
References: <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin>
 <FAD7F1E6-5FE0-47F5-8D10-40473B39A2D8@kernel.org>
 <907933931.787284.1791903485683@kpc.webmail.kpnmail.nl>
 <202610131000.43AB316FBC@keescook>
 <20261013174243.GC178151@killaraus.ideasonboard.com>
 <202610131216.C841415F01@keescook>
 <20261013201628.GO4214@killaraus.ideasonboard.com>
 <CAHk-=whTs09_ozN+e09GU68N1wPP56MUzDjrg9rnKxQUa0A_4Q@mail.gmail.com>
 <as-Ino4KNmaG77_G@gremlin>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <as-Ino4KNmaG77_G@gremlin>
X-ClientProxiedBy: MW4PR04CA0301.namprd04.prod.outlook.com
 (2603:10b6:303:82::6) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|DS4PPF399DBF572:EE_
X-MS-Office365-Filtering-Correlation-Id: 86ea4a50-f4eb-45f1-ccd0-08df2b9082db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: osAQSNZUWWBzYl28I7wNeDpEohJuJAObDPHGwVd/i1XQNGa9GQEZUeOXVUGxIKJGgH4TzCC5CGHUVKqUujxwkFBDxFBzxWYdj4rXkK8r9my6Q4DUmI6uLvViTMDqG09NHTLCvuLxRBdChEORQYi1JHhuYyP4FGOsihVGV1HA/i/Oi1JWeXr/eaPEuVBtWVet3MigYeAsxGEoNxhFIyHxKcKIJfQFab8lSm3KJR7//TyOrScMIbVsFn9LkpZ5ZH63AiWQnXnu/wrxLYnWUHU8nUErLYZJkq65qck//CjV06l+ysClgEjH8WhunofTxvtCdo6EoaY+mXSITdAu26zuERkjn2xJr2TOXlNY6wRX04Kr6E3x5QOrawopFkgywChNE4ZvF6M7kLWBRkszvNNW5UGjuzCtwyq15QoXjQGZsGKN/vVICrvZua0Wtx7lgRIf15Rfda5dONJGuXJW7PKYIVjAD6rklJ4Da2epzkTzPJa+CXbzAnKmIYYwGRfj3tyWXSHqO24jDBuWXw9/mj1liz9ZSwAd215pw5DCbf1zS67TbxFw5cixnI5sxlnU4fIj6xYHMvZXnttEOJPtqeI7Nxqnwnb6KmkcFfli3rHVNJVYN4e782t0XpMtPhMTAL4ifFHzxpTauIXz95WDzuuOXwE8zdKxFfWUNd3tkBw52sM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OiEWKLv/rmYP4m4w7X/vKhtyXdGTp3PZnqHvouAsbAK+LikSXGws9jMJ7mAv?=
 =?us-ascii?Q?owPYtcjB4ypd/+/38GaGwiVkNHAbguY1oGMBpjo4sMsI/CGtlJ8oad//Cb5y?=
 =?us-ascii?Q?878ArQFx5lPDl1GpPjwmgjbSyhG9ROX2WVcOl89QyyWVcsDGbxVW/3TvI6vI?=
 =?us-ascii?Q?7vhuzBW7YPk95aMMeT6fj6DXXUur92jgJyWsZx/Si+h78TNsPm0tT7oUunvx?=
 =?us-ascii?Q?VjqlhUVMBwrTl6IVWWdTw7NnJSTSGkha+O2f6mpSgszvwts8tJtHKX/StMCT?=
 =?us-ascii?Q?VnOW65NzuPI0r/GHIC49WN8YV568KWFeRSK9xxFFOwI6R0+dZdAoWcE5JHZ8?=
 =?us-ascii?Q?8uknwQIOgdMrkQeYeANOdru+SIVW6NBbzZhFBJczCEq2lgSBDNcFJLaVxdeD?=
 =?us-ascii?Q?Ab0ZY2nObMRLdvIejzjRD3f6/Sa3DPooXpQi7W0jdH37ZthLNZz3TvhEM8UX?=
 =?us-ascii?Q?4mhBFnRBZCYsq/zCYzinvbVLAUI9wmwMqxjz4UB90UbI1KWjBfbYsz8LkL3Q?=
 =?us-ascii?Q?ehLKPQq6otpvO9Hj7VhshngYqqjsKKIHBY5zLo3NgdNevlD9wdwGmOSsLKCm?=
 =?us-ascii?Q?6k6cH0qGd9iLROuLbwagte0aP7yPxVji7Wqjw8CyPYFll1YZL+DidVR0DCV/?=
 =?us-ascii?Q?cZlErkVT5GkFcTkFc0Q8aKNPwfeXWm/cq3RWQy3MXoQLoJBwqa5xsLJ66BQI?=
 =?us-ascii?Q?UgEHqGswk6kZqHkhSvDBkDkWsT4HgkA4PveODEOVcaftBmgGh5odQJOnw6n+?=
 =?us-ascii?Q?BhpyMTaDmNtcHjH9vcfBR6H/vPTAyGcEqKATaHqCmJP0UdS6m5rJiOfHL5JH?=
 =?us-ascii?Q?W5JK2PCUggWc5/VSulvhof0wwc9zGi0Bv+ej6UVAdBtXaG66DGb9Mkc8IxlC?=
 =?us-ascii?Q?EW3rYsQsY7i//s1r9Da0/1UbfWR7FwRzF/UoYa7PNTt6mocN5ZeijYnFWfbZ?=
 =?us-ascii?Q?G0WqBrDMHLq/YNTmo7mBR5PR1YU1BKUk1YACqm0MYFBZ2y4kWgUAK3Tf9yPN?=
 =?us-ascii?Q?GQcuM+Y+aGvdyANRFmrODz5gWn/zZ704T+6I4cn+Cy0hL9Jp5svV4ItZjtHL?=
 =?us-ascii?Q?NEg4bS5UklKzxPVkmNC8bVppidMoC5P1P4HOcBWtvr7MBjaAJMUS2UaK50Yw?=
 =?us-ascii?Q?VJQxzG+t9TG/LXrErTx6glr/uXGkmwOXe0kqqokBo3Q+Q8jR51UFIvx+2lH2?=
 =?us-ascii?Q?j/MrXLqQwrHNSwXToavE/+AmMKd2IwcxxoX07BUzLLase8nSyFSu9j+iurN2?=
 =?us-ascii?Q?MYBGD3iYCjoLciAhxQ8UV0Qb/rtWOML73WCly9eHDaoOMtIlLBdwSZhFzHV1?=
 =?us-ascii?Q?sKFPtSOHgRHCpLDj6OU0J2XSaHbLNVQXpp0bT6ogkovELjF5t4X0JkOQ22sW?=
 =?us-ascii?Q?YxOlanU0+Wi1lFwpu0+kVdysYSfZHh/frO6BQxIvZ8JwTjLXsY24b/IdILvR?=
 =?us-ascii?Q?ZpY6CbB3oNnFevOAOHjCQhAqqZsRBh5gMsglFv88tQQ0gs9A6GqG8kxdABRD?=
 =?us-ascii?Q?JtCVfBEnHMPggZyirvCCCCjMxoUJtw+abP3UpU76Ieo2pPvKPV+15sCV1nDh?=
 =?us-ascii?Q?sjOHUV0u3vlIg+aP3jHlmgT3hvbEQnkv2caiieiF3UJq3Vingjh7ZFBwJYUI?=
 =?us-ascii?Q?fnL28HMV2vhaN46N+bhRXqxRxNhBGh1TIXbA29q5AaTf6S97ts8iwxlsqCLP?=
 =?us-ascii?Q?cRvOygGaKH//5e3SENO+SkQrrHajn55uf7tZVanZtYIEPgwdlswBMc9b488S?=
 =?us-ascii?Q?12jNgEfxow=3D=3D?=
X-Exchange-RoutingPolicyChecked: z55w+BDER0BeZHDaYqE7/VWk5ttGZEpTOTpHQ8eC1cYxTk7inTo1pWRnYwt4vxnL/3rTbGWtvTkA6APyKT/6D0IvlxHtxdKZ+sAjCPEuDvPMnmtMWHgwqck1qfW3ka1ugEPKfQuYSmMe1aIbxLfJxwx+Xq9GagYPukms3ztQaSM/n5ZcnTnr3V83N7ytA1KkUrKghMZAAn9+qOs/nMN4B6jiJ0E1o2DpCfvpd7up6A1EDsg0el5v+d/Tn2jakY/wr7KUvhD+BkOKBlxFbyeL8ev64+2p/fVA4Y6B+WalM6lxzMIxKiFn7ySNlRxqXNbfz7qvLm+/oo2WNU/3V8uOQA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ea4a50-f4eb-45f1-ccd0-08df2b9082db
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 14:19:38.3295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GDBBif99WJtH1aF8pucgGq/ErWRw7fpUF5UbCQss62ZQujlyN/bTt3mss+UyWGXViVTBfRdtq/5VAllrBBSolw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF399DBF572
X-OriginatorOrg: intel.com

On Wed, Oct 14, 2026 at 02:56:22PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Tue, Oct 13, 2026 at 01:45:09PM -0700, Linus Torvalds wrote:
> > The kind of expectations *I* have is that people do their best and I
> > expect people to understand what they are doing.
> >
> > But that understanding has very little to do with what tools they use.
> 
> I think that's the crux of it. Don't send stuff you don't understand.
> 

Yes, never send code one doesn't undertstand.

Also as important - never send code you haven't tested.

The idea that LLMs should not be allowed to write commit messages or
documentation really gets under my skin. What if you have a learning
disability related to reading or writing? I do, and for years the
hardest part of writing code was documenting what it did in a way that
others could understand. When LLMs first came out, all I used them for
was writing documentation and commit messages because they couldn't
properly code my ideas. They could, however, describe my ideas quickly
and clearly. Fast forward to today, and LLMs can do both, so I use
them for both.

Matt

> And if you do, expect to be ignored.
> 
> --
> Cheers, Lorenzo
