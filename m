Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160CC1A680B;
	Wed,  9 Sep 2026 05:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788930279; cv=fail; b=dzQ4DXwZf6y03jmp8FIU+dscoCUJvCI6NUl6S4QhXZB+u+uULVnmX6nZWQYNhOrHUVCkWyy8L1oh24H22K2gEWrMIHVW3CZslJtiMOmr6YpZn7L7QQ3lMqZwc11YMj3dlE7qEmt6AUiMFL7N0lVuXK0YS5DJOOtnCAa5xJ63Cc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788930279; c=relaxed/simple;
	bh=v78tphpm5pkEKuQo8WLcEa7oRDKMIRetYrdWwmqlv/4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jnWqb6pV+aAO7SCeybfwq0MUZctMfCSG9UL8MEuGgmEYze5HwD7F6RilZIn6u0UkYU+KBseLp1z8Ko8Z2M6jgXtkWMlHGg7OeUsUtDqKZoFzAFiZxulH2Wfi5uA3aFW21vIKRJ2iu7m7KOR2vzK7cLznvSkrjImg6vI5lvqEzjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=be9x2+zq; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="be9x2+zq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788930277; x=1820466277;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=v78tphpm5pkEKuQo8WLcEa7oRDKMIRetYrdWwmqlv/4=;
  b=be9x2+zqYbL8+R2aupoa5rGq4Q2ev8u8JR8XYzYXzuLunYDUJAYf4bb/
   15LvN7Yve0NSRxXgZEWUGN5y2hzZHpl3Cxho46Asjt819iqhqkDZua/qf
   qw8hUbm5VteLhMYT9NdsvidyiCoGDZmVddXgdCPUZKDSt8lGnkm1eHMIH
   NPkRm0T9Dlirokvct38fvAXrbmcVuyF264p0DdbEdCye/iVZ4w9AFuZ6a
   dEoG6lLGk1Q6AOmzJL3a/RaBVenJM+N+b2/vUaLPJ+Kk2FrXXNi8REHH9
   Z00Whsk/eMQL2xIXc4oAtklWN9aPSVeoyi8VgAiqneLxzrX45mv0N+yUj
   Q==;
X-CSE-ConnectionGUID: i3kcAo/xSWyrWfKutdP2Jw==
X-CSE-MsgGUID: 8hL5FCHiSBS9W6J1YZMRgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100503221"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="100503221"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 22:04:36 -0700
X-CSE-ConnectionGUID: hGXu+8VHSjWwY7RpspG/hA==
X-CSE-MsgGUID: qzhR9BukT/WInAt/zgK/Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="275340896"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 22:04:35 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 22:04:34 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 22:04:34 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 22:04:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBrjhRQZ1cuF5wCzUPvFTxryQATWn+lZ7Ochsauz2NT4JVLiADoJqLAIYZlM0iRgUILs4iMse1GdcmyDAKum0LmoZ9bnFFkLneclrptutIgZ0CqspeCTaFCaielHhNLAt2eCyEriIsbvn729mYvOQARHRN3uJIkv/i8/5pxQmWwMFjACyiI0HicCaOMD25qdwyUgA0TUXH6S6NigCS25pw78S3QIuLhC9OEq3/mAicdCGqpgJpiEvdxcj7gxbp9kxeCCbvyg7noXNzcTzKd/srAaGSQ0xhhbDMHcavg/ROPrX7N4REkk61fMkLIsWeqbDz1ybbSlmWJAWZIXFB/U+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYdzPplgxGtroBp/y1YEc0iSspRD4rVXXEwCeQP+zYo=;
 b=rycl3K+P99tg5aoHh7LJkj9NbFaVsaq5ad+rZfdKd7bwXSbHxogyj+aBqFB4OmuqHKlAicEbJ34RdJw+PgWXm4AhjSwX0B5/sUHNFfeuZr8/+z4uo1FVAvhVW+iofbdhrLpHZdeoHlNqNXTUOCLGlHhKvOOmo9mC4pp5ebs6a6HWAdFnZsvR5SMcFT+4Bj1LTx3urUj0FBLzI6TFdBrHDi7AL8jBQsf3oLvmfwiKLFj5nw3k8DAMdqCXY5i5SVNXtFoRHxH8A6NGC8wq1RBItXW0obN/QDI1E3uwhKLwIjXYAEyszLwrwf9AnBirBME8Ta+uQ8el6xMplh1xDpU4Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 (2603:10b6:518:1::d1e) by CY8PR11MB6915.namprd11.prod.outlook.com
 (2603:10b6:930:59::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 05:04:26 +0000
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae]) by PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae%6]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 05:04:25 +0000
Date: Wed, 9 Sep 2026 13:04:13 +0800
From: kernel test robot <lkp@intel.com>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>, Srinivas Kandagatla
	<srini@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Prasad Kumpatla
	<prasad.kumpatla@oss.qualcomm.com>, Sarath Ganapathiraju
	<sarath.ganapathiraju@oss.qualcomm.com>, Kumar Anurag Singh
	<kumar.singh@oss.qualcomm.com>, Mohammad Rafi Shaik
	<mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v4] MAINTAINERS: Add Qualcomm QAIF driver entry
Message-ID: <aqDozWDTAkUewTSA@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260903072902.3870009-11-harendra.gautam@oss.qualcomm.com>
X-ClientProxiedBy: TPYP295CA0056.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::7)
 To PH3PPF4E874A00C.namprd11.prod.outlook.com (2603:10b6:518:1::d1e)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF4E874A00C:EE_|CY8PR11MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 3840074c-b3d0-4727-9aff-08df0e2fd0e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|7416014|6133799003|22082099003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: mxh3VD0RSNqFELaBMYOVYlpgLZBjHstm/idEvyfKHkVCv3PUkNAtaiu1w/MBlWgfwoEy0wdsMGtr8yHLx/swTDmsEaRytwirHT6gDwnzIFrn47GNt5++r++agV26jLnBTwnZ80nBalTI35MkjubqjbJWxaaOBlQjSNI7qvEjE1ZrZnS0otpvh3WejR6Q67liBCpeHh5a1A/uT16AVVrNYzn9ppuMk6vZgFtogTc2QFF+B/uHgwLqBq1LG/Nd+OWheZPPLj+lJn+IT4IloIekI/A97hK/1pb9X4PxPD3Qw8J5S4oIvVzQ3ghgMGRMqOZwHGuOBAebHxwqSv0fiU5Ec5t0RdBBieT4xrikvMEHpCNcpz/LdeeBvmvXs5EYwpltzlsI69wsJpd9dB75UJH2ntrly19eFBN5veTq9reOwMFjfAlEjpnNNE37iw9aJot8nOWmQdeAdgmdrUGy91J5Pwv2Ie5fo2KYPT8gkqTOhDZ30IsgBDCqRTMfW1HbOqSZ+c81W/v+2mYl9fg8PmacOOeLim/VNPZ3VLaFpzqH1bBZIO0IrLH0Cn5WUq4ZLEbQMgbKn32MHhxkmEDBzVLSgJkxUzX4f7VTuLYc6UbzRNVJAMM6dDYJKp55x0d5KI7s
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF4E874A00C.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(7416014)(6133799003)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZqqUWFrzG4zzHdpA5CuKuedn2K1iarSFx3LABCMTS7JG2c9gVhmMCjmA98YH?=
 =?us-ascii?Q?aTVByReFgWMKKBOa1yufGbuGVCVePLpQrSAxGy4KnknxYMXgpvqu0fzA580g?=
 =?us-ascii?Q?SkzyHpGPxHNwJLSr9SGtR5DMv6Nq4dyzhQ+iai3kAXQFXsPUCWgGnwYoPCXi?=
 =?us-ascii?Q?SudCfmCfNRfXA2ZnGlBZQ+zVN/a3xFQF1I1xs78eL8QBnW9LRzNL9h/pq2om?=
 =?us-ascii?Q?+P/yq9OOAGo2xCgSw7LP8ChcKGEgW/OV4tjspfvwHHOoMXy2KuHs3tdzgD01?=
 =?us-ascii?Q?TsClNoBYg/QcTJHuUBWEH2Rp4jQCZv0Cyp038RKjkr1BkEPsbGUTb314212z?=
 =?us-ascii?Q?Ss6/AcFze7g5c3jShukp4fagYJcyWGCAzMK86yU08b1QA2fAoohSLqDA9WDz?=
 =?us-ascii?Q?YCzfxVUcKQOHsUcoZwKM1kx2VWAQl3+axwhu4HVutgVwbcyIkvZLGCcAwF8j?=
 =?us-ascii?Q?G8Hc9eIAh89NDqf7hc9NpTswtNdnACN1BZH9n0A6oqeJffIYNQvj1bHezxX2?=
 =?us-ascii?Q?qRVLLvWYcKqd5J+SwHrFFEmTkGdP9VZcWxYZIH5Amosd7w6vSm/YLV2nNsoX?=
 =?us-ascii?Q?3GEmPAWcQHUckWvig97CzNg2hH/6OGBGW7IEAUawvhN89EqnPQS1wo8X7Yud?=
 =?us-ascii?Q?XGnjFEFVPPDRDSNp3vLac0IRPhyMAe+qOaP+2nW185B7EOUmPi4ijetsWggV?=
 =?us-ascii?Q?0rgb4d+g+V7eoh4maZnWdp9Oam99XXI3B3HpT8JEzf/G9zKgGaPVHQkORl6C?=
 =?us-ascii?Q?iIzX5JJBuK1iPQbCYGtAanWrASDfScl3eO7nCWmLA7txeRtswzjf8dOtAH7d?=
 =?us-ascii?Q?oqA1D6aAkvn5y6fP94yFCIr8/o9iPlEX91dVuAttCSGLkt4cwxPBYVZLFfdm?=
 =?us-ascii?Q?r0QXQRfqe89Ildl3HZ2IXYPhGqmDhquWIqhJuLtMepgHp9sk3mDDkyoeg2Jy?=
 =?us-ascii?Q?YK649p98mfOY9zupoyMuj+wyjY3XpnEXRI/+TMnuFCvHAHIiYNApMRocDSIU?=
 =?us-ascii?Q?u5Op81HKQMlVdRV7mxR51zzzJV5wGVfl9OhLRo0lfe7BfigRu+Vql/UeQKPU?=
 =?us-ascii?Q?oa1KF3Mw/FnjzBLsbbI7tJ4KQYLaRC1HwYzsjXcYz9GgT4RxA0wuSjLrPGWz?=
 =?us-ascii?Q?BuyNvYhRdXFaEIV3tZC9IBlH140KL1lgNRfgCZqVi05EUm7xOLuUuoqn3M98?=
 =?us-ascii?Q?Pidlx4aVhnsSB5lQyaGh0+RNmLw+4CohCHIFhuFwAR6SoppkCEQAkQZIJFSx?=
 =?us-ascii?Q?CVRZRB5VCcaqjGH7jmoMisofrG6DXKdtX1rchXBPYElEDN/6xXNeiOzIn3BI?=
 =?us-ascii?Q?KMW0QBTE2Tl5J219HhPw0CenZBx72HiDHy6TgjpOdS1fv4bzIJ0WUEJPky+S?=
 =?us-ascii?Q?vqo7M8juttRrgcumz8IYl7Hz8+JWfdpFblgwSEBdoFgV2r+v/VmN51kh8jbQ?=
 =?us-ascii?Q?64K6XC5gIB19eb07bGIVh/VUQyfEisF8DvzUliSaXE5hnaVNBdzY9/0dVHHk?=
 =?us-ascii?Q?cGvUV/zhRs02cRQam9ghk5KGvF7QeZFPW7sE9wyOiQJGhp50gBazgGp0j3zX?=
 =?us-ascii?Q?igLplUD5tL0xl8f9dkE/RP/7/0DRZeXgkY3CwKEg/sBuNBJ0orL04vfulfaA?=
 =?us-ascii?Q?exffvLTfMEblyoTJVLL4TYTzQuhoN5hcjruSTI3RGysKOVReF1OGXK/H2ag1?=
 =?us-ascii?Q?2vOlhuBACluLfXh7PiGd0XErD47DGi90HmnNzr2NfBrK1nU7gFvUw/OV4ZC/?=
 =?us-ascii?Q?gyE1HtpzjQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: aNZT+C7GL+NtmzelGVHkjAdXNtkyKMYNFIZlRsB1mqUC/Yg/RZvYv9wXB3D9mhG97LgizmCwa14DdJZXVQb4931VG3OH0q5U9SEgcw/Au1/4mjk34vbOWkc+tQdnjvrSv5CN5iWAdRreN/4cmP4Fg/FbkLJiqdBG0lLEwQIOVsObnEEesEf1qu9qldm6LBEm6g8XttR9bnD3erfB4a1cWsM3DUZqBbE4KW2HH8NnLYZoR6SANkGrDUIqH0L+a943ollMWA8VLwiDNHvzewzJgmXG3GvVC1pOzE6l3H21lZhtdVSusqQ6TivNbdast1cVo4m9yhFGoa8hR55CX9oTPA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3840074c-b3d0-4727-9aff-08df0e2fd0e2
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF4E874A00C.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 05:04:25.0124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 13ORbTySPhz5czEkkbe5SkRzh4vVCWI8hEh9AqE22YdgOwf2B9/EsFTCX3lGkAKPigoV5xlqzbTWUClb0OWGog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6915
X-OriginatorOrg: intel.com

Hi Harendra,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.3-rc2 next-20260908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harendra-Gautam/MAINTAINERS-Add-Qualcomm-QAIF-driver-entry/20260903-125901
base:   linus/master
patch link:    https://lore.kernel.org/r/20260903072902.3870009-11-harendra.gautam%40oss.qualcomm.com
patch subject: [PATCH v4] MAINTAINERS: Add Qualcomm QAIF driver entry
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260909/202609090624.axJcwPv7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609090624.axJcwPv7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/translations/zh_CN/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
   Warning: arch/arm/xen/enlighten.c references a file that doesn't exist: Documentation/devicetree/bindings/arm/xen.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

