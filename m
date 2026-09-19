Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C7A3033EC
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789824197; cv=fail; b=ul32eMnKBIPjaEN3gPFbsMw60zM60z9q9IqLieTrA1zxSIzOaPtnfWyl1yqfqr/oERkZkOj3wgFDdihBI/Sv9LFcO0iqLQ6gkr64zkFzqBDk4X2XCX3QDvFLnj5Tv8uwHWKh9iBOs2mx8JqA0B1HpZCCRdNxQLSx6V79A2ZkQXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789824197; c=relaxed/simple;
	bh=fXo7NGlDGTPt1CL1NxwF4tdVubP9Uqc8n1RyNEBLsYI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=NXD4tgIAjbQF9uQPD9UzUARKlRpom44qv5djnORsabVQ+ZxHiIcrRDNgEZT7wyLTX9UT0qIFir07PUnacSswT6OET8RKlesusMEzcfyGtbXPm457Th4KkkfxCBRzN4xKaeqQ6DBm3k090Np7uXVIPjZwJqfl5+5Dwn0ey542Syg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mn0WNafp; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mn0WNafp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789824194; x=1821360194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fXo7NGlDGTPt1CL1NxwF4tdVubP9Uqc8n1RyNEBLsYI=;
  b=Mn0WNafp9DBZq4wMatE6O/H4QcJXmz1oyKZvrYlNVgeqafcjlC+oGco5
   encqxD8fUCY6ykaaXFnYpWWjm9c1wYLy/umjOHmj/7ep8mdGh5ivCbkeE
   0IoMYhtj/RCqVXLkr88TaAK7T0X0mmcM+QrZQdUhCozQnoEPsK2P6eMsB
   Y3qRVtalUZfwavwLlAip/Q0L19GKgqKyT2xzZsQ9GPPSraXRPILGFT+JX
   OkfNu+UIN3QZiGUeAtIym0IjF5PYo7Tk10rwQAdMyoFJK5MZbh4ji3b0D
   ngUOGQ+bj0gssZegaibgbjCRscUk3YB9ryWjXngvmT9el02D/l7Yw2/Iv
   A==;
X-CSE-ConnectionGUID: QJQ2VWIsTHWqF3mqbDyEug==
X-CSE-MsgGUID: drtSWoufSGK9kI/y1S5unQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="101699405"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="101699405"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 06:23:13 -0700
X-CSE-ConnectionGUID: zKmit3+MTH2l64+aeb0TPQ==
X-CSE-MsgGUID: FcZzwVfAR5SjBxEChthVLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="272145185"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 06:23:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 19 Sep 2026 06:23:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sat, 19 Sep 2026 06:23:12 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.29)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 19 Sep 2026 06:23:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNGs9mFOD5Cglx43yn/N4WiQTPU+vYjWtAsIb8nQJ31LKNtAjUW/KAOXtGrHvdmwKNRKU2UGEXKpnqaPN1l/Bt4U9MYyBkGQfgxGp74Dowjse6k0iInR91b2gEyEnt4XrVEXHHyKZOp3tVPlEFCiYG0oKiW5123Foccf1xzT7OBMtKqueU4qFlzlASf8NUbQup7nr0ijUSD48cqrz0u6pPDf9zA0jB0PhdEVUEIqWM9whTtpTd72vOA5UTDgTXN8eHRkcaX4lAVTZC11Z9meLiZd4t/7EnRqCanMY3GuBfJUJnGwDlP3qrDkR1y6iqZYOMuEscC1ouYYnVfvwRu14A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jY1IM4XXFmIhF5a5l8wPJpG6DUCsPwcuXA+WF3TqKbg=;
 b=bYmYaVloTk90aiLvNKGK2YJUxFdGTpvZy7Ypm1sFVvsgDII4uWkwe746lNGTel2rrn8GQq65X5s3fZ1dwBA2h4MyQu4r9c6YOP8ucy9p+SiP2XuwrlNFu4I+Ch6sdXggrppQPl3MI5sC2nDzNQW3qZOJfndxM/Y3JRCwasPuqCecmIFIkLyFccSG9ZrGhR93oeTf/tM9Ag401o9JZbb17FcfgFeTpyHM9N7pf7iYp/tChUnVLdxCigWKnUUdas7bJ2wz6LFIWWccTxdo5Uoz9nhSlq3bVxq+sO+fLGWEozl0fSsTC68dR72dy5RR5p1KABBHt3+PPAoPrfBYu7TEhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by PH0PR11MB5111.namprd11.prod.outlook.com (2603:10b6:510:3c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Sat, 19 Sep
 2026 13:23:02 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0428.014; Sat, 19 Sep 2026
 13:23:02 +0000
Date: Sat, 19 Sep 2026 21:22:51 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Shen <sjg168@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>
Subject: arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb:
 /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible:
 ['aspeed,ast2600-lhc']
Message-ID: <aq6Mq1Ja/GTGussz@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: PH0P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::28) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|PH0PR11MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d1ecd79-1596-4c9c-37ff-08df16512177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|13003099007|3023799007|10067099003|56012099006|11063799006|18002099003|220923002;
X-Microsoft-Antispam-Message-Info: wGhziAgmf4lL0ElZyrrl/S95jI7fsMsWlM0+CskPXAHWlG1HR+OorTaqlwayPX0k/uvgxoEm4f2iD0eE1GPw/GkYs/HVefMhaRi9og/57nfTZGDgMMWNh3YIxBgHJTx3phlt6NxiqJYzBA1D2EXH7pU1KwgvBRx8014WUouTl2EtCqGEuMME51DMAtuBDogQNyUBVEBWI405k/5bM8IGkgSCg/Ae3mEm5oXAXUiulYyraNz+5jaVH3rgb9gAXpMI4NerkjL7GDI4jKXcdAOkUGM1zKfqpBCGIfbmMd8HCEupPyuAsi8e7LxHnca5ReGpiazZczQX/NpLAsyOccQMiJ/ffvzSQGFd7sXJlP8wuMbB+7ufZZIJ5V/gNahdsvibd5l4pekL2QBM1uR5d1UYVAn7FIZr8j6u3G08gqykOP2jMHjBvj+nw0sVva8uZbDEY/HXGhIuwUlSzlBfCh1PrCcHfSCrJdfl4tzG3XggrAuHFE7hZMLTgff1iihhsQpErKwdjuXaXQaqJooceZxbVkZSDg0/lZ6Yh+/qCyUtZES4yVdwNtrNNUsVSXRTB/UN4IHeqTMkwxfZtcb+fVztaPNJpZvqz+fgKIjpYiAoG73i0rmocz0i8ljFrvxXEL3Ff5iZJ2XorvzIZQIjku8XuK+iGLpIvQ7kxbjwC9A2RiY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(13003099007)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6ryWVPkdVS0bfKZk5J7Svruj/cpzYNfCL0iUtsRMhxIlYPI08REBlQqKUpyj?=
 =?us-ascii?Q?GmFOryxUB3moQsBxKzyj9TmXz3J/+WIGa2B/J1g2N4ZUapKTN5do49sdT+0N?=
 =?us-ascii?Q?IILZileBc9A7PxVENQyWhP/NVb3v9oQ8AiXV372E4xvv4/uzafSxUHfif4Vl?=
 =?us-ascii?Q?LG6/FA9IZJ2bzJ469nCZcwFwb2Sadd04xykZwof7dU/LKagde5LKKd/vFy0z?=
 =?us-ascii?Q?TOr0KfjbZXa5AxgIUQ0t59+BHceZrMkxiEoidmCctJEM/GBltyD8r5yA7YBZ?=
 =?us-ascii?Q?/0jbErSGj6EqqRnDSHmabNhVrGtu4EXoAGaTrdhfMA7ofHVKFE/6iG165C1B?=
 =?us-ascii?Q?rxDuGfmY2Y1BBk1dISDnW1ZxkfEQWt+TENJr+Bo6kDnhDV8b6Ut5dWW1Zhuk?=
 =?us-ascii?Q?UiPfezoldWk988NRbK1RWiNSYterct2F2EMEX8+JsduLJe505aPS2KN8nWOB?=
 =?us-ascii?Q?7xBFvQ5Azv5/Moqmx00jYRgjr2mg1/Qo1RShucU0gFnjggxyZcJshT5VBmkZ?=
 =?us-ascii?Q?M4+1SeNd4Lw86MzIuIm4qo9UfLZZK6oiqm+x196V+QXrFYaQykAvAggVRLnP?=
 =?us-ascii?Q?fvRHvcb3fnIuNMuDjPxZphxeRicw9BB6655xcJH5N7YcViymMzfv6W3+RuBd?=
 =?us-ascii?Q?d0jWdZX5N48JjiG6KwzoafTLsc0gI1GpobFPB1xwm+Xm5khsmdh79lB+rueo?=
 =?us-ascii?Q?/uIhEEVsy/KHtVRnANmREPodY2U5YK1PWfKbhP8qhFPKvrxUm6EYxguD2/wg?=
 =?us-ascii?Q?r+e6sPn+UpHRVuVmr/HD4mSZ8dCpa9BoBr7vH2PCenVscx+KmIFws9ZP64m2?=
 =?us-ascii?Q?5wcxl3JQ1qE/0BPnLLnjvpRxO559rzttoIlKiOmmpeBBjtKqeGojqp+O4M8k?=
 =?us-ascii?Q?ffNX1wtnSWY90F+09U3zscMa3c2uvGsUvrdz73gMYUkVOwz5a+4MErAtn+IT?=
 =?us-ascii?Q?C+qI2RGOcMLu34cI+U71mhCkHOR+08xpJJ6Hr+WySJcb4+0OWXyCmbh34jEb?=
 =?us-ascii?Q?Qu4mTSOp62VHYZ9ISGM415YX/LxubQw2FKVJQtSzgeLz+wa5I/tk0KI1NIjW?=
 =?us-ascii?Q?nrDYe9ECITYT2Bg2Szlmjm0BGmg2p5XoFRQDgN4pTvNH+kAFqnkP3t4V/4MZ?=
 =?us-ascii?Q?NjGsTGfTBp2M5efeOEzcNjgXYugE/EFMSAzdVY4WuEbAKA7VJYvTkZtAP05e?=
 =?us-ascii?Q?MTROzx6oWNy30aVZ4W71MOsd5CSOw1mrhEj52/bTQ2AAW8gmVqjaM/5tgs3s?=
 =?us-ascii?Q?YOdiB2o8YjKM4ViAvlIF8vxLSoGTKT2khNP3E2wIjU+u1bg3H1PfCP2nwhQj?=
 =?us-ascii?Q?p5goZJ9Tf3nKSUawTJqiwgftutmgQXzF9zrN0y3rpJs02iZJODHtO2h8qOZI?=
 =?us-ascii?Q?EUmXUfuXMnY8RU9uC6o69mZPKwQYZPQXxu27HR2vU6PJifO9fdh1rLULiY2k?=
 =?us-ascii?Q?IegYKgkD5kysxU9Sb2jeCYMwGI+Fv7pHJ7ffJvaV5xcR8/ki9ALgtc8QT6Fa?=
 =?us-ascii?Q?/wh5+Q658gRfv52x8pKRiDPTy5HVAmsItGSEDPMY/U2Av3eQKsA+9iEQZ5zt?=
 =?us-ascii?Q?d+UoRphTmD/C+ZvFpsJkX/IVaMDJXqqXulXhn6THR4TnsSuR7xHGbkpP/BEd?=
 =?us-ascii?Q?1sV3ToBRc99Hfse0YSAEzwdTMD3uy1TV3aPgo55d42S6B3ZXVJZSpkXk8hgI?=
 =?us-ascii?Q?Kw2OfD36bhxt54t8kxQHPEIVhEAUjCYR6lvHdTbdsfr0iX8cR6qlIyW2rcdW?=
 =?us-ascii?Q?+cj8LsA/hQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 5Un8L69O0ziLsDPkagKU/Hqu9YZUq2XAteHrwPOSKmXOnFPsywU4aVmNMVFntojKQHqjSnx8XnSclcGhjTz4SJ3Km+6giEWsOg3C1p6AY3ZSg3oKffS0vkEfEQFTYF9cXac0gi5c855cQUHbV+tNPyApJ8aY/jKgfNB+OgFN+mHE1LZ0kxwJS04pzua2FmqMhiPY2c3XGJ4lQPokvgeH3Ts+IpIkJ8KMB5L6Hgpix/AuSVMB2ijtKaK/c9fXQtxPMrlHjr7CbrJUVAEFzyRTEHUNWX3sPnr1EeITWr8NH5AYTcrQ5IdlKgNm8a1lFA8HSvxV6GSxVmC5gXP/6rTayQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1ecd79-1596-4c9c-37ff-08df16512177
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 13:23:02.2104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fmmrlWYGkrulV+lpP6x2j5fw8PPx/j1NxRtp862oesJTIpt3heLeWkzaNZAT1jbobuuhfbIEXRdKrSzr0qUCoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5111
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5a051f6b840d48f159166ef073d3021989bfb50
commit: bc83b7353d2bfefba73193335bacc3542d8a7ae2 ARM: dts: aspeed: Add Facebook Anacapa platform
config: arm-randconfig-2054-20260914 (https://download.01.org/0day-ci/archive/20260918/202609180625.NPn84cdC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180625.NPn84cdC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bc83b7353d2b ("ARM: dts: aspeed: Add Facebook Anacapa platform")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609180625.NPn84cdC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): aspeed,ahbc: b'\x00\x00\x00\x17' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

