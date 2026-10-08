Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BB13B19B6
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 17:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791480020; cv=fail; b=MLibalBXg7NQxHdLZAR5ZaPEuXowlM/eP6Rp6gyeFRNDnIGVWJGKxkkcrp0qWUUrskE1EuBpBswUwgyZWKK8L2R6I/Pglb07HPqchXTQ2850WAO2xvmAQ//6K5nbaTQDSqG3h9HiyKH7lGJeKky4I6uWX29J7Hs+iIApBbBBmSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791480020; c=relaxed/simple;
	bh=3K766AA+ZcZO4lsj5hrJ9ertveLBmZp7KB/qw5pA8IU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gw6dJbrJDHU4Xwa7Xp2IMPD8s8qJgFcETHFnFBXhpUck1npVHXQSNoV1FwA3/7EJicPy5Tfxwtr+u6NnRY6/2FUsXvNuHv3FT4kmCc9YHUgnZ4bX3KB+yno6ufwBTx1vFPjXb66YUjs+s5XdgoOjo6+/ZR3P282ZjqjWe98fK0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BDdNbTDj; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BDdNbTDj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791480019; x=1823016019;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3K766AA+ZcZO4lsj5hrJ9ertveLBmZp7KB/qw5pA8IU=;
  b=BDdNbTDjn961kWXu80YKBGQKfgyMUgdvL4qun5UJDIWA1E0za7XelRNJ
   pnB7E23koVG50uqAob4LalWK4vkAFgHtAbaz/tMXCQTQ8neMzFrRuqp7R
   i7p+X9EHHMHYHhAoirQj8ArLCbL8oOumfkaPn+4KAg/ycYrD8xSyA303a
   7IvetP/dbbmX/YwjRizHtBHNIX+sm0lWbIKShGlnHi8VB6rSKhXQxvBCM
   DunbEtdtbjjc00ae5HmRlhWY6uUhLEBtrB/ldPdRrNO6uui70TyjAD4C2
   RjLKlXgiq292CiTX0yx3ptl6v0oOn4a4UESq2+F+3iKILoKN8X7d2+jB8
   A==;
X-CSE-ConnectionGUID: c3soqH/YQDG/qVXcYmCwZw==
X-CSE-MsgGUID: LDr+RrgxSUWqEgRMc6Xguw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="151486"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="151486"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 10:20:17 -0700
X-CSE-ConnectionGUID: jOWCvXU0TP+evzrsHT7DdQ==
X-CSE-MsgGUID: xXju/Ns5Qje17srnPScEFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="191663"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 10:20:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 10:20:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 10:20:16 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 10:20:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5TXZihnVhXaokfZ3U0LN1LrZgPdmrcGb+BBtuFZelpOV27ZKbdxLOS2a0uItkbD0CBKmyQmsavYqJ3taXd14/QdNRNMPp7M2JQpXI5yBPma+zrlWIo0j2DNGagl5Ck/tEUnR3IrneQhPzzJ40bpevMI4kmeWhWG9qT51cd70mfnTk10P6iK7j4g8d4ayT47D50JYxA7524i5Qj8zz2I4t8yRost1/5hMUeryMTuEhxn3J2ji7NVAep5qXfIR0P2n7XlgyTrKnXoZLea3+f0RP7yxClpKGBpxrVcwBWWfTmMyzGSBO5GwZTrUPvhj7UYqP6XJ1o7HOfan5pA3ma7Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cF7d0SfSFlJ3dA281XGo6Jf8gBjeh0xWKhgDotme2WI=;
 b=muoanNqQekDTiBW+JD17Cf49fwMAXV+QeYuhfEkaQ8k1lK8zTOmco6uW6quB+aO2pZosaLu212+IZpKjKhorNoA4qt6mq+Pf9w3GzezLqd3kb/z/JCHW3ryGqq9foS72PaWowt78DMPpS8BFaYHf9mZn8Xfh8qQq+7CKfEFcyD3ulIMh5NKrWraHcGW7x+UBs2GRTdPG4LBI7iXOl9XdefQPuydK11WWsmuL8j5vDAd0nyTxJ3jDnIMB737JIhohhGfXVtCQJMU14RUyOgXXTFqH/FfyrZpPReTbigfY59/2ih+u7jVhUhOIq1V3fxhfEcXTapLUyg2H9S7sx5OASg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8230.namprd11.prod.outlook.com (2603:10b6:8:158::21)
 by PH3PPFF8C186950.namprd11.prod.outlook.com (2603:10b6:518:1::d62) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 17:20:08 +0000
Received: from DS0PR11MB8230.namprd11.prod.outlook.com
 ([fe80::2592:f5a9:a751:be40]) by DS0PR11MB8230.namprd11.prod.outlook.com
 ([fe80::2592:f5a9:a751:be40%6]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 17:20:08 +0000
Message-ID: <b49ed175-5777-4578-9ee4-5d820450e133@intel.com>
Date: Thu, 8 Oct 2026 10:20:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i40e: fix integer overflow in i40e_dbg_command_write()
To: rivaldihormat-debug <rivaldihormat@gmail.com>,
	<intel-wired-lan@lists.osuosl.org>
CC: <linux-kernel@vger.kernel.org>, Aleksandr Loktionov
	<aleksandr.loktionov@intel.com>
References: <20260908153933.2417-1-rivaldihormat@gmail.com>
Content-Language: en-US
From: Tony Nguyen <anthony.l.nguyen@intel.com>
In-Reply-To: <20260908153933.2417-1-rivaldihormat@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0233.namprd03.prod.outlook.com
 (2603:10b6:303:b9::28) To DS0PR11MB8230.namprd11.prod.outlook.com
 (2603:10b6:8:158::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8230:EE_|PH3PPFF8C186950:EE_
X-MS-Office365-Filtering-Correlation-Id: efec1c81-124d-4a93-2f9a-08df256066cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|10067099003|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: ZxdOLvk9buXyoxkH+SS+dOVmnYBYrGPgUoCoUd767pnob3XcVJNB6N6S2XkUbVOcu9HtMSqjNxKTL42hIaHaXhGQb9Pni2ViO/fAMK1/FHgrXNNqHekaW2UeNbbSfrve/2Q1mTXkvypm6CQ3alhl02fFIxpAJhqvdPcOScc6qh0KQiTMUkVl7IsHA2dQbJXxDb0fNTQ5iScLZc/8XBsDsKNexy3ybQIk7m3vOA7aSGrOSngLKkx0SOD5dlVRXmoY0Q+a68/X5y9OdY9FRZa6OytGHBig41XIo6Z3i9rVHcLnw80MqZVu3BU+AqxJ47fXOekrfhpZkAD0rX0RIkCNgQByrQGu92Wi3tTJ0Z098MRn+QFhhJGztofmVDPVpTE/scdZVqPCzxqaZVVpe/ru0wyvT03s10q7HgE4ZAKKuOk3lJRv6TM8/toJoeInRXuNFBWTNkPkPsFKWLAz1EDcSueNTWtuzTCow08j2vXb+trU7Hi3Ty46yV5338qhTNycW9ekWEylMRop9gNjsFyM/QqzCFa8BcpL4MYT7aJkclDEa/DSgEnxYijewzTKAEOG+VVgzzRsrTaC0fEcCW4Pqiel71bTjBGKlNVi+GIsrgM+oPIMC0YqK9Sdlh6sRtZshafBhiT4eoCewJiUr39uubVyepi6zlnW6eDujL7eN3Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzN4YVVRYW5oclZMZUdySXVGVWVTVUxaU1RqaXVpNHFRNERjRFM5d0JHV20v?=
 =?utf-8?B?UVRQYUlZNkRmbXBxblJJaW1zL3dQUkJES3VGQjNlN3VwNnd4bjBFMGlNM3dS?=
 =?utf-8?B?dWhZWXJyZitFK2tMcjBMVFpaN09LQUNwdjNRSmRKZXhYNjRPdURMMzlXUkRC?=
 =?utf-8?B?djJjM3YrOTBJQW1uYTZHWVNndDRrbktUZHp6dXdzclQ3em5CYS9OaTFFT1JL?=
 =?utf-8?B?M29zc2NKVkFhSUFxbnpva2M3TjhjUlhnUnRuSHNPYkxCWno4c0x0djRJblN5?=
 =?utf-8?B?NldpRnc0OW00SzBLQ2RCaFU5OWdLdVRQSFgwaDVMOTNiZVZud005OVEvTVdB?=
 =?utf-8?B?N3gwak8yVXRkWGlaWjM2TExFeXF1azV3UlRkUmRjVDhNcTRnYUwzSGcybEFV?=
 =?utf-8?B?WlZHM0I1TFk1ZlAxUWNzOWVVNk1FbjJ2ZC9hYU5GTUxQeFpZQjBsQlZjeEcx?=
 =?utf-8?B?cU1SRTRtS1phMVRVN01xWDZkQ214ZDVLbjFRQzhkSEdrNVNnaDJ6eWxleFBw?=
 =?utf-8?B?SXZaUG9RbTdvWXNaQVIxdWpuSnEzclp1WnN4Yy9Nb2E4aDBnMWVlQWF1Uy9t?=
 =?utf-8?B?bytjOC8xWXVZRzdEL3VOWk1oSEtSV0hHQU9wR04zazhPb1puUElIQTc4bG5F?=
 =?utf-8?B?czF3Y0RQejNsTVFQb1FMdzdBOFFEbVErRkFKYkNKRisvd0grc2VtM0Vpb0Fz?=
 =?utf-8?B?UzZiRG94Wnl4SEMyREkvVURaU3F0VGxyZ2pBQ3h1YWNLeHhyaU0ybkNVSkpP?=
 =?utf-8?B?QXRKb2QrUGhHYkZyY2Q2UlRlQVFyVkVob0d3cjBDWWNlLyt0WXp5T21BcUc2?=
 =?utf-8?B?aHFOcXVuSjI5YTJBVjFERUxwVDdXS2t1K2JsT1l1SzR2Y3h6L0NGS2pnN2Ry?=
 =?utf-8?B?cm02aUJNeVViVmlqcHJYUzVpcExUUG1sbEFzK1p4a294dkR5UlZNM3MvZ3hm?=
 =?utf-8?B?dkw4dEtVNHRIZTRmSWtXWFBJQ3ZDL2x0RVptQytoYnBiSUxiNHhkalB2T0kx?=
 =?utf-8?B?OUw3ZkJVUTI0VFdObUJWVzIzYmYwZ25aenNoaHBhUmZ2eHg4Yi96Y0lXSlRl?=
 =?utf-8?B?UGVRYWpkMEk4MWZqc2REM3lWTTIyaFlPa2wzM0ZMVm4zYmJWbDlEbzlnR2x4?=
 =?utf-8?B?RkRjK2NWK1lCSXZMQVV1OUhyUDlVakZZUGdTNnBkTkRHSURKU0tiUU4veVpV?=
 =?utf-8?B?U3ZtK3JheHVBOVdnekFDZU9PWVY1R3pINkIwek9leW54cWdodmVSRlM5bnJL?=
 =?utf-8?B?dUNpUzRJNmJLRFVkcHdIUXJzTGVaZWVZUGZLOXdBUTdiZCttVjRPVWNidm1S?=
 =?utf-8?B?aUw3dDM1eCtId0UvK1pwT2Z3R1BGUEZhWUdXOVpBSWFQOHBZMEd2ZVZWZSs5?=
 =?utf-8?B?ZlR5SkpxcUZFTEVsVkE0N3RwYmY1T0lPLzczL1g0bTQzckozRG5CdGxvaEd5?=
 =?utf-8?B?U3FrOW12N2FNZGVsK3FzWUNnY2NUU1VOWHhMM2pYcjhnMmtqMVNnN0h6eGg3?=
 =?utf-8?B?MnRiNzAvRDhrbU81SG9VVG5MNWdvVHoyT1N0c2JTa0ZwMG9tQjl2S01mY1oz?=
 =?utf-8?B?cWhiY292eUppVHgrZ0dKYjZBWkMxQjhYeTdOVjlacUlUMFUxL2ZSd3FGd05o?=
 =?utf-8?B?MUsyeSt0alVXUHp2K2tGUlp5TnFmMkVYbkNOOThJZGkyeElzV3F2U0hraWZv?=
 =?utf-8?B?Wk1Sbkd1emlKL0UvU2JnZ2lyZkRBTmJCei9xUlhEMUhRVU1tZ0VoV280Z2NU?=
 =?utf-8?B?TExQVGN5dHQwN2pic0JDYWcrK1lvSVBsK0NOTjA2S2dxWnVLVDhwaGErWXM4?=
 =?utf-8?B?Umdac3V2MFJJNytVblVnanZJNnQ2dkF3SWNOTmJVNXFiajFqaFIybmxZdjdS?=
 =?utf-8?B?dkZSUGtQL0hnbWFRN0t6S0FoZHB0UWdObkFYSE16U1lzU1dOL29vQ2N4Uksr?=
 =?utf-8?B?S0ZIOVlpZzFFWERMM0UvUmpER1RyTmhSeU5WYWVVZXltcWkyL2RoN3BHL0hH?=
 =?utf-8?B?T1k4UU9LNVFLQ0c3Yk0rRTNDci9xSlVLWkF3a2xJMGZWays3NFdmWkJWWkk0?=
 =?utf-8?B?NHNjQ094MEpRSUp6bTFtWGc0cys1NW45VXU3NkV0SzIrU0Vhd3hzeXFocEZu?=
 =?utf-8?B?RVFBdUpENVE1ZzY5Q3JXSXlLMmtDTWl4ZnJGcnpQVHorWnEreS9NbTZBeFJW?=
 =?utf-8?B?SnArc3RYb0QvQ0ZIdjZBRUxHY2llTGVXdWI2ekpPTUVFTWp1RWplanBOZnYz?=
 =?utf-8?B?MmxsNWI3c1JwaU1pK3B0R3QwODZqaEVWYWxFWW91ampPeGNaL1FjaUwyVGlH?=
 =?utf-8?B?L0tFQnVLQU1TRWpLYWprSXNEYjhlMzF0YVIrZ3pMZElhWXlYaWlPS0IvSFoz?=
 =?utf-8?Q?zA1OdulSFadz5qLY=3D?=
X-Exchange-RoutingPolicyChecked: OvDlMJUkppMT+d9FT93Qx1jdArrNW1514zlFWyuKLVGxTQHnrrDJgLI/pnhpyR/L2BAVlISPEskEVLgIk0MJ8pJVhmIxa/NCTaKqVYc/58+CsBGE4hpI0fajDOBBFmk19ytCIc3vVfXzua0lNUJD8KBpLCuvoYf+JbD6T5rTh4B2CFfQZhT0WDIcwJarJsszb+XEUzP0GMaj3oAht2TbH62nLqXszA+T/T5E1IIr84iIWIb9H7ofqvSR/6njRcMgPlH8u0zAXUjO2f2frXdV6hckpAtNemm+95MQ4CImut+DIbKQvLHjc0IXIv7JHr8OEO8j/blXZ/abSKpfj0hqrQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: efec1c81-124d-4a93-2f9a-08df256066cb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 17:20:08.3860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EK5FWTUjfiBdqOkXMMOdRd7wJ1UMwxPM3ETVAV4FGCLwnR0cykhWhsMHzkU9lxCwspgm4Bo9wsYJ6g67/D5QhEWuZzDC3B4Hu7KD0sTXXeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF8C186950
X-OriginatorOrg: intel.com



On 9/8/2026 8:39 AM, rivaldihormat-debug wrote:
> The i40e_dbg_command_write() function uses 'count' from user space
> in kzalloc(count + 1) without validation. If count = 0xFFFFFFFF,
> integer overflow occurs.
> 
> An attacker or local user could trigger a buffer overflow or integer
> overflow by writing large amounts of data to the debugfs file.

I re-ran this through Sashiko and it reported a few things:

Sashiko:
Is this description accurate? count is a size_t. Before the debugfs 
handler runs, vfs_write()->rw_verify_area() clamps it to MAX_RW_COUNT
(INT_MAX & PAGE_MASK), so count + 1 cannot wrap on 32-bit or 64-bit.

The allocation size (count + 1), the copy_from_user() length (count) and 
the cmd_buf[count] = '\0' terminator already match. A very large count 
only makes kzalloc() fail.

This looks like hardening that caps the allocation size, not a fix for a
vulnerability. Could the commit message say that?

> Fix by adding validation:
> if (count == 0 || count > PAGE_SIZE) return -EINVAL.
> 
> PAGE_SIZE is chosen as a common limit for debugfs writes to prevent
> excessive stack/heap allocation.
> 
> Signed-off-by: Rifaldi Hormat <rivaldihormat@gmail.com>
> ---
>   drivers/net/ethernet/intel/i40e/i40e_debugfs.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/intel/i40e/i40e_debugfs.c b/drivers/net/ethernet/intel/i40e/i40e_debugfs.c
> index 0b52509cb14c..74e75504fdda 100644
> --- a/drivers/net/ethernet/intel/i40e/i40e_debugfs.c
> +++ b/drivers/net/ethernet/intel/i40e/i40e_debugfs.c
> @@ -722,6 +722,8 @@ static ssize_t i40e_dbg_command_write(struct file *filp,
>   	int cnt;
>   
>   	/* don't allow partial writes */
> +	if (count == 0 || count > PAGE_SIZE)
> +		return -EINVAL;

Sashiko:
This changes what userspace sees. A zero-length write used to return 0 
and now returns -EINVAL.

The check also runs before the *ppos != 0 test. A write at a nonzero 
offset that is empty or larger than PAGE_SIZE now gets -EINVAL instead of 0.

Was this intended? If so, should the commit message mention it? 
Returning 0 for count == 0 would match normal write semantics.

>   	if (*ppos != 0)
>   		return 0;
>   
> @@ -1605,6 +1607,8 @@ static ssize_t i40e_dbg_netdev_ops_write(struct file *filp,
>   	int i, cnt;
>   
>   	/* don't allow partial writes */
> +	if (count == 0 || count > PAGE_SIZE)
> +		return -EINVAL;
>   	if (*ppos != 0)
>   		return 0;

Sashiko:
i40e_dbg_netdev_ops_write() has the same change: empty writes and writes 
at a nonzero offset now return -EINVAL instead of 0.

Tony:
For these last two, we should try to maintain existing behavior when 
possible and it seems to align with general expectations.

Thanks,
Tony


