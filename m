Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0688374187
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791711072; cv=fail; b=EWkCSKw0kbwUemn3SX1iZw3uF9diFK1Aok2bgIMYpGtasVl6tnuWa/RawvQozWDti7BNagRFjhIViKF0rZQGq5t9UE/r+a6X2CvyGdXyy2Dg4/2gOh06fm/M9JFbJnTeTRDWqjFiMkg5smfCCSKe4WDsoh2er1SNdibiaUQ3dCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791711072; c=relaxed/simple;
	bh=uqAhh1duSE0UFSzUObX3AUnV+yw8FvP1u2JwfvB1FAk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=seoohP4K+z2D9Nd9vRa0yPEmmvmUlpYbzWWs/MfJeP45RRy8yQR4hZa1VvTq701xzatBBjm6mxY3jS+m0QGb+EBwIziDGqv3RN3sMJCFGfBAEo8Ui6aa0RbtRWoQU21ua6RS1XInBwS6i0lLuqD5yUO3ynnPmGGeosZ/E+vzAjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VNfqLzPU; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VNfqLzPU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791711069; x=1823247069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uqAhh1duSE0UFSzUObX3AUnV+yw8FvP1u2JwfvB1FAk=;
  b=VNfqLzPU/jDMsPahXX1SmU6YME6DYakyFES5+eADK4YbBp3+Yd0gfTPM
   2Yo6FwzLsrVXmwa6MskJ8ObrMhBvUz1xYSKOJmoY3yj0pyQv1CYjDZbrw
   1fadTOuyjZRdUJTjggmSWJ05I7MCnWRuIntS2oTxn1nilWTTn4sUpX3Dq
   AP/C5vl70kHiZeUxi75830FNo3D+wXh1K9bgZiyOswUKiEnRy/SE+bXYo
   Sd0ipu/GyPxPBgS6/9pR0egBJHnv9qEUEhZqC+8ke8hBS8rZqR7c3hj3j
   GHnj/++VAVmzs+MGr9mvczTk9fybxnQB5lvBa23vpn9FmeCq6AgNaKY4l
   A==;
X-CSE-ConnectionGUID: da5gHs24S+aPy9B9XefbQA==
X-CSE-MsgGUID: i3trAKYST/S50sYtbIWXSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="446434"
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="446434"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 02:31:09 -0700
X-CSE-ConnectionGUID: h33azbWIQvGexE3ql8wK9w==
X-CSE-MsgGUID: VQpSF576QCOXKd+SOmhSPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="585056"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 02:31:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 11 Oct 2026 02:31:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 11 Oct 2026 02:31:07 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 11 Oct 2026 02:31:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4F5WUrMVya2qlbn+4mVvDZBu39gF18w9Y4SaRpe2quMw0LHSqHr/Idyw2Xuz+gLmcspdHO6vBQZO+ZuVnPa+noHnwozSPCxxr89RXPOPONs0NpsLKg0k6tg0IiNmN4+pmsRrZngc+ZNqn0S/tJWtg3jGGBcqIUMCbJSmkIJjKb7bRI8rnRZt2YC9MKaARbCYXLQhRnp4plJWZmHNvI6w8g/UcT+P4BhVFcUeDJbdvtjg/uxA4tBW/LS1dH0c7DAOiMcTaicyihAFfLqRP+QbVDrginKPE1GpWTO1oOZPhr4yO1XuGsSpi4OjpNJoRFy/BbxTWw0pV01Nf0QKQ1D/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+x9dRnShOFL/Z+fxcCAhbm0PsaC5Edqqld6j8tAmHQk=;
 b=Me1eYlotDu+/wqTbzmqc2KcbwJBGPGsBjUhNtFkUteblZaZl6SKqF9dDZIfF/rWnjO/xJxdFONNxr/60I2asIxbKLF8q+mVmUBx01cComQbcetRh5uHPeu5KmYWZxUFfrdwzaiqUAxsz9Ibn3KYw4+cczYuCJvdeqo8or5QKxcXX3kBSttX2CR8X2OzBKZQVKD8WGFHM31wjdV92l7w645jMoZZmIEFOioPKcL0CD5PZo3iPF+agaHDa6s+5mt3pF29/fMqPIw57ZrllmUSDH/vYwY+G6Iwl2vzWDAMXYoFkiNnPlaVwzehS8XNtL5TYZ4WunNY9S2iSBSstF8Q80g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by CH0PR11MB8234.namprd11.prod.outlook.com (2603:10b6:610:190::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.19; Sun, 11 Oct
 2026 09:31:05 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0496.019; Sun, 11 Oct 2026
 09:31:04 +0000
Date: Sun, 11 Oct 2026 17:30:55 +0800
From: kernel test robot <lkp@intel.com>
To: Miguel Ojeda <ojeda@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: vmlinux.o: warning: objtool: cfi_staa_erase_varsize+0x545:
 cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
Message-ID: <astXT0Ib6jSD1Yk7@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|CH0PR11MB8234:EE_
X-MS-Office365-Filtering-Correlation-Id: df14d28f-8c6f-4db4-13a7-08df277a5ef5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|261009223027099003|56012099006|11063799006|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: rP89aM2STUqyRHdYLWL4Tg/Trk9dvgRmaxQ1kouXHeuHi61UPxpxBP5k4CbMu2wNqIggp5o1UKxyX4qDynjV53WW08qxkILJEYIjQUgGw5BIlfcComGRtZtGV8svohGunrrW0Te11mmnrMC9lsQZ+lnCCxsjt+3Sht3cBKuranlNbhxCgofln7AMc/rqkjDaLWYYDKxOEW6zvYZwRY4gu1bTUab4VmU/5ARbca5YPMF6LuiQ4+0yV2ReOi6O+joGUkuhEumlZy3DYhHBSJ/6W/7kPR32DC6CtuHrSNq3XMxbW3WbtSj37jdP8Bcmttda8nIs5gyuMv8xb0XGRL2AwSr2c25bC1MY7tpEzHc0iUcPYeXmWw7YTQgDaedc54mFe5UcxpYxwoXeKRC9PGYjnQEIxL5Hh9ZyesxDpOhDoHkGPqvjyOY6g7A1cc3MlAE+uF19Zui15Kntvzw/T57bWqLTLyzMpQ5F0LljFqt1egpODz0wGxZhPeD82Ensfdx1tYGagYUSh/nA4n3Gsq7/d1CI+fBQu0UkcoxO9DZK+HE/62B4h1ZYgScoabSPOtevIWr55CM0hdg+lAr2VIFVdKnWqnkFvCjQ7wNy4QBU7S8p/fqwxuA9lMqNSErjSvWE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(261009223027099003)(56012099006)(11063799006)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eRtAwaH2+Vr0AKFElW8V89+CdY2zxOcy6Ia455I/36WaLYs5Y9ZH1dcO/5aw?=
 =?us-ascii?Q?OYlkpHddPY2dnEP5EIxeCEiwaiBdtZqEtBz3PV8EG7Ri8gloa0nB6935mtvX?=
 =?us-ascii?Q?O+bsTzWKGkcB/OsgGHsyND0wiC2FevQoZP7cekGP1gYuJ1p7zkKb2JtGCNDm?=
 =?us-ascii?Q?65d3mqWbkMjwnx6NLCmFZBdaBrTKBWopbghFWzr8C545ZpCPhV/8KhwVjuVZ?=
 =?us-ascii?Q?ixUbc5qnNZnhMHkCi6CptUQ6IHqIAkmlGwL75vUdqY4C24b0JtI6pk+WiYxt?=
 =?us-ascii?Q?DZt5zAVdyeA/WXappcNQb7Griwe9edpLVPH8JtIoSInh54KNqPCqv/KBGzmy?=
 =?us-ascii?Q?cm4P4jCKfBO///97NVsaGOVQ3AY9iXGPmih8GHWv8IzzNCf7AkPqBKzI1kmt?=
 =?us-ascii?Q?6kw1iI1XbRlAc7cQyqUmGnnWkykl0UY5neSr4Xtl1Ho7ahNdyDVgA90G1928?=
 =?us-ascii?Q?2XtrU/y5wABtwhdRPDiXd1+/loc3Da6Iok2HjXTmXqvOKCoXV1vDPMwugBjl?=
 =?us-ascii?Q?NSijVnKE/YE1ErpSE8tGVIQUsFl0lyE6kxAflH3HSOoTbXNesDuCefY/vaY/?=
 =?us-ascii?Q?i04Yy98h2JnzCmpGZvuNlG3zljgA3oRV5LfAyVE9b8ONdLypLW0Ub80lPjvm?=
 =?us-ascii?Q?8+Kcm73dH+YS/pgMUtZEbH/G27jUJCccjWWuKL6UD3sat2/X5S3bnILs4xwh?=
 =?us-ascii?Q?iAEJxfB+WCzimREnfA8RDJ2spM87+zLINzNBLfQXUOcSBb5dx2bwLEzetggx?=
 =?us-ascii?Q?qfoHTEKYfCPcAipanqYEAan4lFRGVoHSQ/ZzJ/oVSIu6HqyWDbMYEyI77K9c?=
 =?us-ascii?Q?4TZUFZY0Fe1UnPcgbmhFq8eVK+txVlHqr72Nv6oFt/pDzNpf+9mK0JKq9CcW?=
 =?us-ascii?Q?Dh7844hgY0OI5Ms+5Ir8pOkjSkXgoVvQFDPRNVS+u+GzcQVGusqdPC5QFlNE?=
 =?us-ascii?Q?EejQpZ+9+yHzJKQSWw7S4zgBGQYTmVACDmF0jD0k/+6AvqS6ENft7ZepT5Rj?=
 =?us-ascii?Q?kYekP1zAZzpuwTURBHqErE3KC56j0pfH3kOzqLwCPGoFZZQZRL9Nd9E4DAi5?=
 =?us-ascii?Q?Z5ixxo/AZCPBu2i24SR2lY/687x9FS3xgEnfB3ufkUTnQePEvozXtSlXKRX5?=
 =?us-ascii?Q?wGFU4QaQrvJr9I+0/w1BrEbrcNRmmma3ZDHPeCnrXLcAKWDoemToAP3PjUcZ?=
 =?us-ascii?Q?0TaMuKc0b5IEji5LjTqPD89dkncv/pBAZFACFIyf/VuiizJA/4zX6GIYyDc2?=
 =?us-ascii?Q?ZGwLvPddSUwbFLgCGIDcGoox6Qj+lBH6Ggf+qCWJxK1B4eWD/GIEkRYJmfaw?=
 =?us-ascii?Q?slxHDhX7Ma+g4KvZfRT7NKCK0AwhVQe721bZbCx4HQW0OBOh7e0u74zVwrqT?=
 =?us-ascii?Q?eGiHxobLNXHLPOl0LQM2lneu3KcBc4VkUptsDYH46EkyAufXVQ8aa4+7jrzH?=
 =?us-ascii?Q?vom+f91X4QmwWGAy+V7sZeXKbziZUGr7mdlyWAZB5ynBRf/1kSt68fzc/cgP?=
 =?us-ascii?Q?qp3YMrv79ffmOCG3xoyBCi4LdPA7sVx9NMEX3Hrt2eGjpM2i0esAk3j4tYxy?=
 =?us-ascii?Q?HodaKH9uoa/6myywc1G8MkO5f3WJhjtQ1fHnq8SG1T4nz2/s3uCqtm2ZcTdq?=
 =?us-ascii?Q?DqmHWSrLSf8Q/rJ538R8603iHU5VJozlbXo96DG4wy2zpNchILRDAbwPJESw?=
 =?us-ascii?Q?pz963CeXNorZ3kK4oAJppvTsL37mmVq/MG2ZBSG9ojENFx8EyiutSLhBkigG?=
 =?us-ascii?Q?cXcJuo5dPg=3D=3D?=
X-Exchange-RoutingPolicyChecked: HHUR7x6twYFHcOhvVWc4G32wv+DlxfOSDVqfc4ak5mvyfkPKqTS5x4p+eYrZB2HmBlKcd8MTFJtXpdaVDzbGFBHeduXt5PMSPrBahNb6Rzlhf71m1MuZaJ/DXu4382AYCyXo9M46FMUDYdtvXKXMdM0mBBSlg5mHcpqiBzGBEYVWDnr/1dIBufiIcKbGcPnhfec1nzja22XNxY33DHSjImvGvbPKwNulHWZceYTYlm3XRpn2NxpI6Do5JAkwmXN5scfSHUGYpiltqSP2FD2dotEDv6CJibdk9Q0VKEIUEW82lltnMyqhloy0nn8m32kXf2eugV0/XlqmQ1zjsMzl2A==
X-MS-Exchange-CrossTenant-Network-Message-Id: df14d28f-8c6f-4db4-13a7-08df277a5ef5
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 09:31:04.5635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FziOdezKSc9ZQ1XUdaruv8a6N2+UQElbCEe/u0+tLwz9Jn7C/poDXXmmt3j8R3XQW+bPclfFXMTWSfNtU25h2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8234
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0
commit: 5febf432df1cfa5b25d99b54c32103fafbdd0eb9 kbuild: rust: keep Rust objects out of Clang LTO with inline helpers
config: x86_64-randconfig-r2308-20261010 (https://download.01.org/0day-ci/archive/20261010/202610101604.FJT4WAKR-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610101604.FJT4WAKR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5febf432df1c ("kbuild: rust: keep Rust objects out of Clang LTO with inline helpers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610101604.FJT4WAKR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: cfi_staa_erase_varsize+0x545: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_staa_read+0x190: unreachable instruction
>> vmlinux.o: warning: objtool: cfi_staa_write_buffers+0x42b: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_staa_lock+0x1d0: unreachable instruction
>> vmlinux.o: warning: objtool: cfi_staa_unlock+0x1ec: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_staa_resume+0x137: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_amdstd_read+0x451: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_amdstd_resume+0x181: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: fixup_sst38vf640x_sectorsize+0x11f: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_read_secsi_onechip+0x2a0: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: fixup_sst39vf_rev_b+0xe2: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_amdstd_write_buffers+0x230: unreachable instruction
>> vmlinux.o: warning: objtool: get_chip+0x2c1: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: put_chip+0x1c8: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: put_chip+0x277: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: chip_ready+0xce: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: chip_ready+0x9d: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_check_err_status+0x13b: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: fwh_xxlock_oneblock+0x171: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: fwh_xxlock_oneblock+0x168: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_amdstd_erase_chip+0x410: unreachable instruction
>> vmlinux.o: warning: objtool: do_atmel_lock+0x14d: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_atmel_unlock+0x143: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_amdstd_reset+0x171: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_amdstd_otp_walk+0x388: cfi_qry_mode_on() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_otp_write+0x168: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_write_oneword+0x126: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_write_oneword+0x119: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_otp_lock+0x16e: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_otp_lock+0x75: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_amdstd_panic_wait+0x106: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_panic_write_oneword+0x190: unreachable instruction
   vmlinux.o: warning: objtool: do_erase_oneblock+0x310: unreachable instruction
   vmlinux.o: warning: objtool: do_erase_oneblock+0x1fd: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_read+0x2fe: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_suspend+0x4ec: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_resume+0x191: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: fixup_LH28F640BF+0x113: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_writev+0x290: unreachable instruction
   vmlinux.o: warning: objtool: inval_cache_and_wait_for_operation+0x69: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_point+0x54d: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_reset+0x171: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_otp_walk+0x6b6: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_otp_read+0x161: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_xxlock_oneblock+0x14f: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_getlockstatus_oneblock+0xd3: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: jedec_probe_chip+0x150: unreachable instruction
   vmlinux.o: warning: objtool: jedec_reset+0x80: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

