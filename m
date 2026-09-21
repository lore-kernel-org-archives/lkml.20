Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA033382EC;
	Mon, 21 Sep 2026 03:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789961779; cv=fail; b=npndEnHeXJgYeTWUYwGlkCGXvwLedoRLxDD8XkKjk6caIZTpP9MbuixRvtNPKrF0thO8j3PpE+ta8Fe2X23tB/tSVtHtvnpcveXEPKiqdB8Qn1cnykzhKsG3+ptaTl4dEP808rNAo4N2Z9i2TgelsqkPYk1EXXNWXe+06auNN6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789961779; c=relaxed/simple;
	bh=aNzHdS8y+/dEu/Fqah6KkBZp6X2f6DdsAjnhdtvz+ZQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UEcRLBVibNHZUKPvJA2jONbbnKnGkL1IqA8LQpxektk/DslWIbTThTW/TgVP+hOdBGwyWsYoIdNaclGSzeWj2PyOMiErgJN8hD8ipd3HgGIKvZeKKsBGdrw5K6s3UzIXSziZaVENLSLXfeim4zcMiDyb8wiNLf10VV3ppm8n9zk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cvF00vjW; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvF00vjW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789961776; x=1821497776;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=aNzHdS8y+/dEu/Fqah6KkBZp6X2f6DdsAjnhdtvz+ZQ=;
  b=cvF00vjW+SF4WA0srjXVr4JPjR8/gpln8XDGx9VQak+33nJwCcKcfw8Z
   /Mw2VNFG9w7JamMwe/bL/FpXfHXQf/IaW4s4dZWoxpOHcx93BntxWN9ee
   zjPczMpkihCuCFRX6MQu+Nhlgwl8ptgFHJDBD0M7G+o5ORNDGjR6EwqQ4
   S7Ao6/SHNFoLrangcGo5UwpKhPZq835d6wJt/WWTeRRWMS4+h82PQD8d9
   OajsDrw5g7Aqc7m7A0+NH0fwe/Uc8zuAXkU9hmqf2gXKzI0fIHJqOtAFo
   uZkVivnQsLdQKnFd+iuadR4DYjcOQwPIqX5SDJfeCECy2HgFCtm7jTxg5
   Q==;
X-CSE-ConnectionGUID: N94vWLe9Tdi4Nz1YavypHA==
X-CSE-MsgGUID: pB82JSQlRUOXa8s8e7x4cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="101113456"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="101113456"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 20:36:15 -0700
X-CSE-ConnectionGUID: 0iSHPlOoR3W6AgmI3p09VQ==
X-CSE-MsgGUID: GfmnLPaFTiy4zK/7u9F2Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="271609053"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 20:36:14 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 20 Sep 2026 20:36:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 20 Sep 2026 20:36:14 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 20 Sep 2026 20:36:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dL586ymxcAAV//KzR0JJyOeH/1Mlwkkjd1k189KJMg5W42JyHiA3Pps3C5CeGyxq56nmDkG5EljCgW/an1RY/6MZ3wwKrlC5LRLdGL5kKJ0bYH6N8+RyeEup1c+EwVP5OX4LyeLZonYP9IGmZSzM4l9ppHzhYeErKVusrNIqg8QhrYE+MgZUJqz+S34/mToigEVDT19XeKV/0GKr9fz/rT1nK2sH5UxPzl0FQL2hLcZZMQS58vRywuQwB4hMrnT65VvBQjxKL+bsQ1T/58QoDQIfxYIpGl72kKLNtKfm7xco7leKlYLKfFu7PaDTcsroP3ehfUza/qjVABnTvr0kCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1lrXxzZU0pSYsqjYMG1c/0/jeq4IET48s1PEZtPURc=;
 b=yqVqUqjbxTmk3qboicofUTwmUEdav3XgNy0uxwofHqzePJ6hVfS1MSWweMGOBnOy7BRftk253hH94ih1a6arA4IqU0/FRyTtj6BVIT7O0LrQOw/uTg2LLycfNBNs9qWLJg+k0Z3mosTZVaE1a5RK59kR1DoTm1WeGitvcSNgtuW6vLrUaKKEHcnq00HBa3f9i5mUhiWsiJp8Lgcijd0VnmnUU20DRDtaynn7bINO6ZrkM8JNHLJH+ijnBCm9D35xKsjZhZmEcJBWzkchy+yDCUzqEycDCU/vWo4luJRCXwoT7CAqIayZ0JFQiFdlXFsADxhIjTTzFZkdF0FPtnZ9rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 PH0PR11MB4775.namprd11.prod.outlook.com (2603:10b6:510:34::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.16; Mon, 21 Sep 2026 03:36:11 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 03:36:10 +0000
Date: Mon, 21 Sep 2026 11:22:46 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Babu Moger <babu.moger@amd.com>
CC: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <bp@alien8.de>, <ben.horgan@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <fenghuay@nvidia.com>, <akpm@linux-foundation.org>,
	<rppt@kernel.org>, <dapeng1.mi@linux.intel.com>, <elver@google.com>,
	<jlayton@kernel.org>, <enelsonmoore@gmail.com>, <kuba@kernel.org>,
	<ebiggers@kernel.org>, <seanjc@google.com>, <peterz@infradead.org>,
	<chao.gao@intel.com>, <jmattson@google.com>, <naveen@kernel.org>,
	<ricardo.neri-calderon@linux.intel.com>, <tiala@microsoft.com>,
	<chang.seok.bae@intel.com>, <prathyushi.nangia@amd.com>,
	<kim.phillips@amd.com>, <elena.reshetova@intel.com>, <darwi@linutronix.de>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, <chen.yu@linux.dev>
Subject: Re: [PATCH v5 00/16] x86/resctrl: Add kernel-mode (e.g., PLZA)
 support to the resctrl subsystem
Message-ID: <arCjBqclcfHBP8fH@chenyu-dev>
References: <cover.1787772750.git.babu.moger@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1787772750.git.babu.moger@amd.com>
X-ClientProxiedBy: KU0P306CA0098.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:22::19) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|PH0PR11MB4775:EE_
X-MS-Office365-Filtering-Correlation-Id: 64ee4e33-c4f7-42e7-ec47-08df17917aba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|6133799003|22082099003|18002099003|56012099006|11063799006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: C2/h3WokE9CuQ79QyM0A0gsO9DaPpW2BY521gaay1WZjj9TU2JQJC5CLZUydcvDI6QvbzUrqVwqTgb/yaQK3Fp7BxpIaGm7wvP13SMQvfXPknx98PqG2tCb4hEYzUHdymBU8JKzMbcQP369BBTPzkaQI0Fput3h2L4yTrtqHr2tHbB+VfSqZUehj70GvoxXUhrfMurO1ZbtUr5cLJs2LCOgCnFNQ3dcjL+tm1FV2oelh86Y8CW/O2ShmCccjetHuoMlzEco9hCaDs/I1fe1mmRsPsnwZhTVvc5UBKxeTbaKl1YfSIKRPQzJK4GWMTOfpsB0SrqTVUd0mHKl3cvzmMZR8xHVBJjqqYga2BbVvMXHGVns7zXb8+hpE/1GuaZN5Tl8hwpP+YLAz3XhKhdAnvXV5QzjvOsLPZ6Q21zTs/G1abtTKR1Hvj8dl3krS9o1QhOm8aX4vR3NnqQEWHlaFVnmnruM8wqAkniehvCeXs2MKfq1sFDkXI8pZfMg5quwpmja9i2Kxdx1axQQFWp7gCTiEMw42v4RcoS8x+m1Ta8x75u1lScZZdhuzlFhT8psfnu3X2Q67zr747BStI/m8zS6r1dMEEmKEAmIq7cwJBcSYQ72jci30DiNuoQe1p6euTL5vclM2unClPdnkveSGvDZRcaVJNYD11+x2wmZEHJY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YoUvxAjBuu9kKEcdw8qY3Oa+VD/QHAOv86JgcjLxv+PZmjUCwEDXzs1NBqO/?=
 =?us-ascii?Q?8wQXRyTScvcx8LSTDWIvFPV+n8gTeF5Vk04Vh74FUoykZKifGtCMb1rfeyFL?=
 =?us-ascii?Q?q4mgyNr8tsrJr881sdbFcaC9TW21H2yW56mbv+kmwBMY3ZW6D4NOzgxOrKTk?=
 =?us-ascii?Q?wiozQSBhT46JwQqDM7n4zy+4kegUQmMh1rOyyZNoij85lo39CnUJ3UTV9Ghx?=
 =?us-ascii?Q?VajEQuorz66MmjLr9E+Jv8ONB2wCZm9coUOliXYgjdcnp2MFqOOy61AZS66I?=
 =?us-ascii?Q?y/tSrQHtw+050Qx/7SfFQFBz/mdeZKQoJb+N0lK/HQ+a/iOgCWxWnxrTQRHu?=
 =?us-ascii?Q?KPzPsh/nDhWOGZNf+jAS04+X6QS28U8tFHdsWgx2nB8ojWx7i6ctEL4RDy54?=
 =?us-ascii?Q?H+CizotR7bQNHQyoowU9b8l18pyoPhgMQkDxi4WJthUV1hYaSlgddRTlKbtd?=
 =?us-ascii?Q?f69suygXvIAtD9BakixqEwLJdmDG1TDzdIXx6GaQydd0h+HzesYAsbeKtPOF?=
 =?us-ascii?Q?dWXTJ92O8DhkAL8Rs3VIcL10nJFT9k4ONePIRlo8gmuF7LB4Bznxt6xfdJ2Z?=
 =?us-ascii?Q?kI2B6xpqfSdV8Z+BviZmQCC3QIsSHluQAPMtoq2zMT++VdDs/dwmxJqAk7gL?=
 =?us-ascii?Q?IjT1/PCOzlCjQ6ecO4WPvC6n1jBMIiRqtOvNy4nbczQXpd+h2PEF9jCF0Oqf?=
 =?us-ascii?Q?UGtBCKKte8rHQQBfd4MTtWdhzcm29EngMro0G/Pv4AkoeixvZTnFdp4UjLyd?=
 =?us-ascii?Q?riPVFx0W6cUfv9YbeF13sWho0QxxrPIXKVO8V6TbuOQ997iLydRwUCF3v9NZ?=
 =?us-ascii?Q?W7zPoWjkOQOeY8ciVa2X1omVoMi7J862kKjJxhD5lVtrufnFGoMtNAAAc77G?=
 =?us-ascii?Q?9oNi54hTZ00/q3t2qKw7t1/HD2pI5XwP/W6urzisv7TjVdvRFksUUH5DVjkc?=
 =?us-ascii?Q?LcPZ3OCw+EdMxQ8LhuYgArR6TwViEhqIdGt2oyMdCAvNzu0+N9Gvi5YODgXx?=
 =?us-ascii?Q?mPvcKPqIPNcJwsJ69GuFGYaKGpYlYtu/LbVtocj1WhbVaIGtbHgxhRaHa9vw?=
 =?us-ascii?Q?ie1laBYhofwdcFbrgTg2OWtsbdPLXSlnlaN7XWnYyX85tIOJJffcmkagpDw5?=
 =?us-ascii?Q?3y4Kl2NjoWreYLdbze+XUVzAngzU/d6Ie1G0xGg0tNAcsuwOIjaK4SJETGIq?=
 =?us-ascii?Q?t82H35M3SOQ8RrfvULElZoBWcz8w9DNj5QXtTIjXD1WlFrhPIKIvnfhk+Pns?=
 =?us-ascii?Q?E/N3NgTiFfCiluVVq1X3HEa2TgSA+RfiQmqvEFqsEX8WVKjM9aR7TXb3V9sz?=
 =?us-ascii?Q?G/QDeOL9yl0eb3bJZ0TTgFsFB/fou8VB+UjIsyleqJrqDzSnlmeVJ/zKjvLF?=
 =?us-ascii?Q?iaM5ChMtIze1Z34K8Pb0UsWUE28776y5Y0B+hHuO0xaYLVA65kS1UsFPOqRz?=
 =?us-ascii?Q?Mf/PJ0mlDna82SP/RMQ3fEpno7sMWoYR+nWLIEafK9bVjtxyQ8jCFDa1vIrr?=
 =?us-ascii?Q?mWUlzY/dB8g6zb2svriIP1LXrLQJhsHoaq0eUwcuDJge5SMuRZl3feXnzth2?=
 =?us-ascii?Q?17K+F5lp2guxskjZ8wzwMeXbSbWHUP9t46S2lCYXKyVjfiCPWQJNTxNqculW?=
 =?us-ascii?Q?UUQMD4EBS6AlsLHspVcaf4jD2b5tzfEie3WNVF3p8357lXKR8JumUVAe5tc5?=
 =?us-ascii?Q?Zx1pM55EWzy7LJo3b1fD0vhKR+qG+4obZxBen8VAMgaIy73lxVoa52x0IPTx?=
 =?us-ascii?Q?UzP9F5Mdiw=3D=3D?=
X-Exchange-RoutingPolicyChecked: n4So0k977NVZSLGPAN2XAJBOPFPDZwil4FEk8mjfnpmA+pHRhiBNFEU2w8qYjDuvsJM+lOdtT/9aLwdxrfHtDX/SlDybjJiYzQvdTP7ZHxOoLPZbd54C5DKmWA61MJqKdeQvIUrV/lJtl/WSKTDkE+3NtdbXOczC5tsoIAvQSFl2+m65PDfUsNoqxjnuRqFNV9C8u3sJMSbORJlPllX2J9ME0Bb60oxcMihYUqcC/Y7dEM2kOdwiHyLkOW2BpJDzLR7Z0hiSSBWxbAFSlEO5lqA+rpW5rPj8lZaq0pfX3JhJxoYxMuYJQ67DwN7eshUeX5hpY+70wnrhx3gYluRSzw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ee4e33-c4f7-42e7-ec47-08df17917aba
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 03:36:10.8967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: od9tpmPGTrtgto0Dh91nxnYbfZLORmZZ11iaZ0CSBFCGKHKZNTKIzpAuF3fELSfNYoN63txdn5KO931/oyH8aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4775
X-OriginatorOrg: intel.com

Hi Babu,

On Wed, Aug 26, 2026 at 02:32:14PM -0500, Babu Moger wrote:
> 
> 
>   # Create a CTRL_MON group and associate kernel-mode allocation with it.
>   # mkdir ctrl1
>   # echo "assign_global_enable_per_cpu:ctrl=assign;mon=inherit;group=ctrl1//" \
>           > info/kernel_mode
>   # cat info/kernel_mode
>   inherit_user
>   [assign_global_enable_per_cpu:ctrl=assign;mon=inherit;group=ctrl1//]
> 
>   # kmode_cpus and kmode_cpus_list are visible only on the associated group.
>   # ls ctrl1/kmode_cpus*
>   ctrl1/kmode_cpus  ctrl1/kmode_cpus_list
>

Just curious, would the other existing files like "tasks" be exposed under ctrl1?
If this ctrl1 is used only for "kernel space" mode, would the schemata of ctrl1 be
shared by all tasks in the system? That is to say, it seems that there is no need to
expose "tasks" under ctrl1. Should we hide "tasks" for the kernel group? Please
correct me if I misunderstood.

thanks,
Chenyu
