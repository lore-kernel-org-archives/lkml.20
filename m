Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793157056;
	b=Ad69BNi54m7edtFOduIzT6/kXTmcsL19y+IBwygH935Ftvz2sA3OMFB8fH6ZkhHCmeUV
	 BYHwLacFawHcd8EhKe7X80NgJU9ZkpFrMVKde5eVbyMpdDvY7t5rRUvbimdjzLg8E7Y70
	 pOx/sdfyCJ24PHsom/4+60jbaNozo0bNjbSqbP+Zr6ck8B/yWy+wLTEX2c9gmKfta0Xpu
	 PC4qUiZSimX8aXRQDTX5NymCmXzQZdDr22+1iFRx1wu3SWXA1Dkusppw/R8/0Ka54hOKh
	 mJpvi39fhm55WVqvHJMcvbWeWeTYmhgMrDCDmd9bAzocOjP0MDKnwXCoD8T8lZ/XQYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793157056;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=oAqMTh/Z1FEH3AaftZHF4un+NmAMK+TRAb0fKCVffvA=;
	b=GNdzed/rzw0sp3W6ROtU1VXottA3qpYXdrgO6DAYY9ml1K/+3gdDtYlDPa5VTqFRmW3I
	 jt7DX6HEtMCC+SjZJXYpYAMgboA/yFLLylFZjUlFQ0UpHKboMlaAT77uWcSSsucGLFSeD
	 VjlYW/INvMZzr/yNKMyK0Mcq9GxtHzywdGjZhD0CC8uUePEDGVl5ml1CGwtZKgwhvOqJ1
	 glqkx8gDyR20gXDTuWJWwkQ3s2mrP1ECdWKrdXn7a9WOMdfriQ+WQtOaTbt4RC+iiPyHj
	 eYT8fAs9oOXQWVzmYE2bu3SKvXCD1s1OvuXXrgTvrzKOpKS3or69WevPAXxCN3mO0MA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LmF157Uk;
	arc=fail smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987F9606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 987F9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LmF157Uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793157055; x=1824693055;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=yrhcRYwEu9WNUNWGsYhyCw6SDFStdNm7KAaVxaoXhuQ=;
  b=LmF157Uku9vm+5Fp1/kHL4xHrxWVCPyq6Dh28zwqWUXok4bciR3WJuGw
   GMjPdDqvt/WjdXszHAxy/4+foHrAayvatnvWFyXOk1dvyxV2+AQNSPgyC
   xxUbr3DOZ+Epq0SRFX1f6k2lkZxgeyEdhH1QMMzniJ58R8Spcoledj/dq
   mhogCW18b7+QicvkcQm8Lsvjvm4MIUsJlNTfaH/wum7yVELcUupNda3Z3
   nX7dvRp6YY1SgeDnXYACQvfgyPVmBDRYOF08Uc7ZsFMCNKhESQYdFHtMb
   wmX8TvnLoLy3h3GnyX3BaNYxZvc9n3Ybrp6Baqj9qzhuGrPTM572vzYbj
   A==;
X-CSE-ConnectionGUID: nfFI78NiQXazwl+4nM9YCQ==
X-CSE-MsgGUID: SEeisCgrSCO6vyAbreghIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1861347"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1861347"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 20:10:54 -0700
X-CSE-ConnectionGUID: MlwoGON2QWe1Va7hRTEA8g==
X-CSE-MsgGUID: boNe7ryJTT2phsmBTQabcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4662768"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 20:10:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 20:10:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 20:10:37 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 20:10:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=at+MkPzCEt8fdj0cvDaIA5s4VdOb6whDoKALrJ+Br8aUPNuoyziTzUs2YZYejnVPJph2duIb1l3jUP3XzoS+xKI2uERHx3IEocXxWCSBgU1V1D85WnBGib3ZTa2ytaDT4CXgi3ptDq+tbbDUPDbBZM/rokIGEmg++3o5Upr7JuD+3extvWqBzPC/l3e7ADvHz3XiPatGQSwdMkz7B0e9Z3lb8XX+UedZdctuKmAUV3KIe2k9bMdSZhK+o2/Kdy25omjeSD9YBCAblMtsGgFXiJb9cFl9CvtTrrJVxTUmkJtah4PX1BiSvPR6Xi4sl4fUc+WEMQcqxLH/zlhvBgXcNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAqMTh/Z1FEH3AaftZHF4un+NmAMK+TRAb0fKCVffvA=;
 b=dt5eIhc5+/xANDOsfTh1AtR1AmI3KU9s2d+c/InK23xB9jpJJ0xLZN/BDMpecbTga8fnWVl3ASWg3fOCSN8c5TqnLFgOJgW5w1o52jI/FX2tCM9NlNQ/IrwdpQB9VDM8cC0nK/iHlPFHjp7ESH3Uo8Yc2DPkFYPIBOgXq+kCFv85PK6KtsK3V3/Nbut5i9XvRiUQvUgPl6KHLnYCER19VORqRmYtOFvO5trN7gS1QPpZH6T5TCoof4lmtNyHvVHCKbq3Z6Wp4+PTFvmy02SpdYQSMdCzPBplKCs2+ltZW+OlNlPnAXdDSuC9A5uADsj9OYP9l2O/6sj3WfXPcPHogg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 PH0PR11MB4936.namprd11.prod.outlook.com (2603:10b6:510:42::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.22; Wed, 28 Oct 2026 03:10:35 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 03:10:35 +0000
Date: Wed, 28 Oct 2026 10:57:42 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
CC: <tony.luck@intel.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <babu.moger@amd.com>, <hongyu.ning@intel.com>,
	<chen.yu@linux.dev>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	"Hongyu Ning" <hongyu.ning@linux.intel.com>
Subject: Re: [PATCH v9 05/12] x86/resctrl: Attach ACPI ERDT information to L3
 mon domain on CPU online
Message-ID: <auFkpic31H1xWXUV@chenyu-dev>
References: <cover.1791933001.git.yu.c.chen@intel.com>
 <2d3327d86480b1a41bf1a7c935317f14884a83f9.1791933001.git.yu.c.chen@intel.com>
 <2317c664-0c9b-4dad-b135-a771959be024@intel.com>
 <auB-vz3-QCXxfGU4@chenyu-dev>
 <f5cd13e8-532e-4c4f-ae6a-152d5001cbd7@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f5cd13e8-532e-4c4f-ae6a-152d5001cbd7@intel.com>
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|PH0PR11MB4936:EE_
X-MS-Office365-Filtering-Correlation-Id: 08bda5fa-cd88-4f29-3d8a-08df34a108a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|18002099003|22082099003|261026140227099003|4143699003|11063799006|10067099003|261022105027099003|261026121527099003|56012099006;
X-Microsoft-Antispam-Message-Info: gec0U73ufPjEOKahlC9D0xoIMgmdZLfynP5bkPRFwIH5ilyhju5ZADSxSsUIXu7yMx+Efj1JZ82HbGHiW6yzCasaKgv9g80jrOiNKGBLXS3u9i6bRVY4ILuDkMUKQLJ8kLAiCAnaOAfUUw0o9snTEVeg9RI+DqoTeoX71RaytJYBQZzw+FvxAccLfbZ+6NxoQ92Oi67UyUakN/5iZuhKe2Hl6ladVdKxY1qqfczfjxpQp63JJBymQXrLJGt+eAuZ0iMRXbovdLsyLFGs5BKt0dy5CmnGQb6xJiWZNwU63rqiDj+7NE5jE0RdXV4ecaq4qJU+d90ZGTDpsej5tMbOFED11049ib5z2pcFHW0VkY8KG941VfUffWzoh5iKbdeKuqJqvn/9ePQ/GCJEcDTHhMVrFJUabZtP/mXtXYz6rhqazJtYjYSp/WavL92+WVHWCMy+KSWYsBsj1wRAev08uUrmIfOP+04UEZSHARL3AFX+BYVHcKJXXJe0HZz3UPhQSJ6j4k/6KkhjvhJDcjt1T/3Z+jFCDDY1VKwlg9W9xPe9SS+MX2WBn25gTcxx8dLlo+b/xEP8rwCDwnsEKWIuUSy8XcHPmIcxcWfbtxvWVQeR15Gap0MXoUBLuDE58PBuhmMDvoT4zkT2u+U9arL0dDhdQr3EmM+zA7rdi0v92ZU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(18002099003)(22082099003)(261026140227099003)(4143699003)(11063799006)(10067099003)(261022105027099003)(261026121527099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hv6hs+vSFSa8OH0m04rPfo53nLOCDJhW6LpTCgWXyO40hRccnyG36SnD0OUZ?=
 =?us-ascii?Q?ihDXaTZX1xpkSqxlsdR/Q1nWR2Bcsz14JMb1qgI0XVw1FFts/jJ/RQDNIG6o?=
 =?us-ascii?Q?E2swGM9ilYC0RcxLHYTpYMQbsh0u7/OfX7E8fHvOPx0RcgtLIcMFpKpdmtDS?=
 =?us-ascii?Q?zlQlQIS+1sskYZ6fzrz79ithb4p0NRMQ237RAC5hLxYsUtbJnz3H0Ds5i3f9?=
 =?us-ascii?Q?2kMFmBiHyu/2UEjjBqxrnPzj+fatk8duXwckPlkTxrX2nfoeQgBT7njxfdm4?=
 =?us-ascii?Q?NroEui/GbEdchuCQCa7lxcAtyDwTIVuOjmtGpJlPHeZ7qjpg0SxHZyU7Ri2l?=
 =?us-ascii?Q?jKggYH1tLlSAXmNXpPEJpsGyEG4Dt6Tb2QEUAams7gG+FvrIByDVyY2HyCuk?=
 =?us-ascii?Q?PYdGfJvuS17B/woxGYpYD76sdhu2uUtYgtn+BE8BLaGuS38zmZZkYU84vdYs?=
 =?us-ascii?Q?IcXxxZ327ZfdIAptn6ieB+wLnEm2niDAMie75lsm8RrM2bLFEEE3SWMOfpka?=
 =?us-ascii?Q?n3+g5bjuYrSN/iHPvb6pCivNvhN/xgS02g088N1jGJT66b0Qj3Dd7HEIQ9Hu?=
 =?us-ascii?Q?z8GOezJeq+ZmYDzWpBypJP9lQbJSwzOneCE2ca13ZyPPsOSXfthUmeXDpOUM?=
 =?us-ascii?Q?zCYbBjs8gxcZxfY8K94lDqNxu7ISmbUPywlvTSeP89adb/5UmrjPG5wW8boD?=
 =?us-ascii?Q?o4T2S8m0erCydmj35Oe1fcpy8YqHpylgJ+Iys1DywpuuZRYx4MKCtxTWtrY8?=
 =?us-ascii?Q?5sd5aZUVjE+aDBczGUySNCk7UPAFxAQ5Fx6YWtK5YhoyDMrjIjeW4a2ajgYB?=
 =?us-ascii?Q?rp0jdqBf5iyZwVLxB9u1/VaogXxs+pW3Fr005gP6D2zH5SVa8R0g3NuvgNxo?=
 =?us-ascii?Q?hmJVOzQ6mw5xoBrpLgPSWvm1U9+HA5rOZMnJa+6AOgh3qxPG9g/1jqgPzCVB?=
 =?us-ascii?Q?4lHB+DzP18oN3BJob+iY96NfzjAgGtbyKmOciV1lQS4tP7AuZbF8oy3TcxnT?=
 =?us-ascii?Q?XkOizecqx9XK6FFIyi99V5ALxmHgkIm2x2AF2mcIjXKupxTyYuCiuMLQ1XrX?=
 =?us-ascii?Q?G2v+f6uzqarcmYxrxHAVNkdT3e2iDQJI6eYNOwqwHvoQIiKWRb81N1kW2AVp?=
 =?us-ascii?Q?q54q3wPFpRjP/OsyuOcYbiDbqYTUhvT8dTjjCjGUX6AqYX+Pdz4trj55BgzW?=
 =?us-ascii?Q?LPoLqyRY96YD6IKWsnIhuT7HBhTQlfrDGjlcSi6v+nDM0XMfuHcyEm/0KgYr?=
 =?us-ascii?Q?42JO1QVhJ1pRlCpwXfySLA/16yCZZysisRJdcCpIFseI4ddrhbfFYr0vO+ma?=
 =?us-ascii?Q?afB8t7pyDCTYNQmd1Mu2JidQW5Xj1LLJ+3bgjUQ0RumcXLtBLYmnZZ6qp/uG?=
 =?us-ascii?Q?xIQ5M2yPnG0x6Kt6bQAGvqgdODVlAJGL/1ySoYxzFHUtjvrWrKR/OTLQhO56?=
 =?us-ascii?Q?8meVwl8A9CLGp4FmDgKY8ulR/D+AdXbszZQFD4qCmeQHlQIbfcmtDt1bZ0Rc?=
 =?us-ascii?Q?WvchTUk7frD09JO6j7aLCIp3BEzUbzaQsqWcqwh89BOn+ihcnYA9/WyHacoc?=
 =?us-ascii?Q?A8K7VYV2wmSdni9iB6XVGkvmEkNXjCnXI8gGjXxbDWsjrVJPW8XZD6JZbK3h?=
 =?us-ascii?Q?odkwz+/559l8lwPOMdFDEe24nONwIhv1jj2V+dw26DEpl2rYeyvxCI+5h4/1?=
 =?us-ascii?Q?K17cvaI1T9DqUpHghjz3lIxsILTItqYjAmqK2QY4FikNRz2VJYYkyMyjjvtU?=
 =?us-ascii?Q?j23yNTOzBQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: QPQHUxqYzmKwBr9WS3d44GdUdgKfoIGBok5GhoyKwKewer0s+t7YFG4kSNYWBR66ZY8p/aGaBVs/svt9YrFNHjRIHYPdQ+/Cif2rXW08jAyy0u0m6nW4UM85cmUuJTPWmNcI0LZ9EMEWww+gd2RhSAxgyvLw0ndxHxAG5VMLZlDHayf/AamwxUbbRxRt9fHwiVdZoNu0hFq1rpzEz2uEIQ2XeNHIeP094A1f3y/5oYdZuk9kEdyxepX2tgKXwifZPSeHw3YWeDrj4u/vXH3OoT78qe54AUn5Qc56AZcEIZ9Z3xUwCUUY89OWjCJWDZsz6/qwH9Cp+ZDS/N1v9p2S0w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 08bda5fa-cd88-4f29-3d8a-08df34a108a2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 03:10:35.0699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/JN1OYaf6IfJoVZ+znDoc25IjheDvSyX1fhpnfcqCLTUE1jsgK4xUCQBQGIatbUHT35CgyewmSUZEIPeg1K9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4936
X-OriginatorOrg: intel.com

Hi Reinette,

On Tue, Oct 27, 2026 at 09:17:18AM -0700, Reinette Chatre wrote:
> Hi Chenyu,
>

[ ... ]

> > 
> > OK, how about changing it to:
> > 
> >  * Return: true if @cpu can be added to resctrl domains, false if @cpu must
> >  * not be in any resctrl domain.
> 
> This refers to how caller acts on result of this function as opposed to what
> this function actually returns. Compare to, for example:
> 
>  * Return: true if ERDT is unused, or if the ERDT domain containing @cpu is
>  * bound to @cpu's L3 cache ID, whether that binding already existed or was
>  * created by this call. false if ERDT and CPUID cannot be reconciled into a
>  * one-to-one binding, in which case no binding is modified.
>

OK, got it, will change it in next version.

[ ... ]

> >> Could this add a note (if it is actually true) that earlier checks ensures
> >> that hw_dom->d_info will *always* point to a valid ERDT domain ... or does
> >> resctrl need to check for hw_dom->d_info everywhere like erdt_mon_read()?
> >> Or are those checks just for robustness?
> >>
> > 
> > It should be always valid if ERDT is enabled. The CPU that creates the L3
> > monitoring domain has passed erdt_try_bind_domain(), which bound an ERDT
> > domain to that CPU's L3 cache ID. The L3 monitoring domain ID is the L3
> > cache ID, so the lookup should always find a match.
> 
> Could you please add a this information to the function comment?
>

OK, will do.

thanks,
Chenyu
