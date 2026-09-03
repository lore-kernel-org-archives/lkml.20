Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1484A385A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788457969; cv=fail; b=MkoZ9Zfcu2v/lL5zfPFZhVQOflpq9RKuVYqsPHLtl2SAjcd7/tEMeKs3gKTqFkj/eIc9KgFmVugp530D+v0ldVNMO40Eeid3nGB1aGBxE2GPFiKz4hjgBwA3ZTEcAClySzSo0IfTy78RIPUJFxq9FNMH0Q3XN6H863tFet3Vp/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788457969; c=relaxed/simple;
	bh=85ZhFkt2J7MAwDBiqicXr3RbzkcEUHaVLXHE74xkNVw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XfGAVdCDLp3icQGUzV2nkigeJJJWiPK6pXZSQtTvym2VII86zCh6kfSm+AXPGRIBdyHgFPKS7ydIElBA7zW5slKtEa+nf1w4xikKiKFHAa0UpBlTbJFlwmTZPJsz2EhnwaQ+eydpUvdWSFtF9XhP8Mn33MQLHo01MrSYHeVEPvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQgfNylF; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQgfNylF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788457965; x=1819993965;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=85ZhFkt2J7MAwDBiqicXr3RbzkcEUHaVLXHE74xkNVw=;
  b=bQgfNylF6f0Fxne0hUG/ODsBfoIXlnAO+xjunZ6qh3UEl/QpNIHjXWGF
   LmF6nySDxutzSJQikkHrIKtDTmfrPoOLwmyeH3230dz1+BUbU0pqiY5DI
   +6bG4xHcOcS+tMfsG7WmGD0tKu4NY+OYgNJqabXZmC0UGqYFBTbuMDv+J
   ItZcEUXMZeRCtFfhVz68HRzhLIzgJEiCUMkzsL4QgEKIRLpAWW0ikPMkO
   IVKigkx2D+Fm8HqZ0kEEwzMrlz1hWyWTKRYJHOcVhbQwXnch2zkw3CIY8
   DMuoY/MfrPlSIPlNPcDcDLDxZG2HherCq0j7FYxhxak+DZJFaCQDlStpt
   g==;
X-CSE-ConnectionGUID: LC9coAMoSuecMWqbo6kGrQ==
X-CSE-MsgGUID: pqUqP4xvSv682KIt4k3pAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100310048"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="100310048"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 10:52:44 -0700
X-CSE-ConnectionGUID: b3VjZDiwSUe6kjLWUA5IzA==
X-CSE-MsgGUID: R+AgbyiJQ2+/7xMSpbn2hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="263609992"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 10:52:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 10:52:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 10:52:45 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 10:52:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dbZawj4sTU4FyhQ+Vo5RqLACrVaz+jpyLMplMi4+c7ccKGUzEX5iMx9K2ndMhmANRe5jaxCzCr1k4zcH+vquK3+1VCQtqk3CjwJmv3P5S5sAT5BSrxJN0TjoqyE0923dsvu8lcVQitpIGKIrnjh767tZJ9gYJVttk+Hxu6Q4VVXAZHgpJi3Kr7HBmhksvgAdMjkuQvlVLZPFfqvlI6Xb83CbuatO/wqJlBjI2gDqKA+wzm2djcwiQZLE/VFWeGNnWIGvmSri5dlVyBm267etegkApOG86iCrqlhK6ItonYnzZ2kh72st6n2vFJRb5o0W9j+DIoxWsD8/MJYol7Hnuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mF91Lq/QbtT0j6IqKP6YDnNoo2fX7kcW8PYHnmXwgRI=;
 b=Myb9BiFLm5hdQZmSxnHz2zCy/lKROr9edVi1+x105pMCdvbZ2ORc57Toj8QBz/qwqyHtlyIGrp1BV4Mj+dPBFtjLqAHBF8KMXId5lrT1PLsiNL0zC8BD3go9bhabZf655TR6iYcWYO9++M/ZVio0MGk25e/l/heVFlK/nrfEsp776fZ6dYv5SkRt7VQCTbtgaGF08kRarVf779k4SwqCng0urgR3vzNvXOTXTYP0eJHUwrNf4OutjZswomYwOBm6nnl/xStsd3wC9ezr81b7xaU9pTitrO5Gd0nAPoGkzpX83WzcthBsGwojcyEl57ZrGhllTYptWrh1p7yoFA6b4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14)
 by CY8PR11MB7825.namprd11.prod.outlook.com (2603:10b6:930:71::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 17:52:39 +0000
Received: from DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246]) by DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246%5]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 17:52:38 +0000
Message-ID: <524cc003-f886-436e-b881-f5e7698b9040@intel.com>
Date: Thu, 3 Sep 2026 10:52:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: Introduce helper for checking direct map 1G page
 support
Content-Language: en-US
To: Dave Hansen <dave.hansen@intel.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, <linux-kernel@vger.kernel.org>
CC: Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, "H.
 Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
	<peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, <x86@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>
References: <20260902194718.E1FF3041@davehans-spike.ostc.intel.com>
 <ff13fe1e-59e3-42f4-a438-bbd3cfbd94c9@intel.com>
 <98f78187-de25-48dd-a833-16e6a86feed0@intel.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <98f78187-de25-48dd-a833-16e6a86feed0@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0370.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::15) To DS0PR11MB7997.namprd11.prod.outlook.com
 (2603:10b6:8:125::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7997:EE_|CY8PR11MB7825:EE_
X-MS-Office365-Filtering-Correlation-Id: 48dc95c2-9aca-40a7-f316-08df09e424dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|10067099003|11063799006|5023799004|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: DTTRsY0qdrKIqVuLhxftnJtQZZ/4zvEY+F7uVzuVhJ9JAfbl11O9ybfYbdMudLRvMFDdTZPLC06cYv6c5zqFSxp8gOwYijdrqA0xOHEFuYeERxaQ74Rf0c4HEqVZSQoluQ8wpcbQyxtH8QROja+4OpEe2Ip9Wo4A03gRumrCko8s/a2rII5gf2NsF/8TqdqGBzhgJx7VstcSUQbvtqUdMbUSSttUBPUq+ygR0CG2ErWPtH98+0eQoUFs1lgdRc0F0g5fWcOmxBkq+N1jO+uktaHEhO5vGpJhgL1Ib8guFYIopG21ZMsDZvO6QvC6hGr/Sg0mXSB8FvtFFBPMgXQyUaR6WeiCjlX8bZruI4TkJ4l4neLUPsOwTAtNA/udxp9EET1zsqugchr24xcMw9Nz7Y/LLumoA3Rj1bqpD92zRrQkq9kHtC08Bv+7PDUze3JuWS7R5bdWoVx3PWhwQJEO1x2aJ7kCorWg4GAXObQeHF7iNsE7YcNUnGNaESGxJEZE81tHuS+Q/cZiHecZ3tjZbpPLy0Qf1A1yZHgCPQGpxKtnl3dGCSzHiDBNK24/exy5ghHhneOCCifp3o+f3N0xgTv6JlV/iUdB04pN034U5FQDC0PClU0HaQK/AN5lbqzsBSoSiP7DVODV5wPAq6Ap/PpytdhO/56miIuPE/Y96ws=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7997.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(5023799004)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUlScVpkcVYrOVpqMU15UUVuT1BGalRaZ2FPazF5ZjRyaGk3MlVYQ3Y0bnk2?=
 =?utf-8?B?ZlVHckM3dzdyNkJmSWdYcUU3RkZDcksxeUJPRUVjc1ZnU2pLY0lUTSsyZWtr?=
 =?utf-8?B?bFNDeWpEN0N0QU8xbFdhTy8yelpTM1Rjc1AyRmtqYm4raGgrWEJ6bjFnYXIz?=
 =?utf-8?B?TlFHY2wwZm9iakdUb0NqN05FZE40Vis2UW9kbFViSFJoTkNYdzdDK2tlU202?=
 =?utf-8?B?L1dYNytCa2pyS1ZWekFTQkNsQU0yNDZtYnRDcUVYdkRNTFF2Z3JkWSt0TEpm?=
 =?utf-8?B?UEFmejllZ3FobFpuSUxyRlJxTnptREJKcThmMU9paGk0Nm5Icy9GUm1ibUdt?=
 =?utf-8?B?cVFxS3JudVZud21vNlhFNWdIUUtNMWZZNGFIbWxTRXVQMVluQnpSWC9lb2pS?=
 =?utf-8?B?R2FrckMrbHVkQUpuZG51SWN6dUg2Tm4vOXI1MTRHdnAzTkwyU0pZeW0vRGpI?=
 =?utf-8?B?aDdrV1NUUEZxYjh5Qk9GbElEQjNyMnVHVUJCT01CT3kvUlVkZTJhbElJb3l3?=
 =?utf-8?B?QXVWN0R1elNoQkhMTWZOQnFYZk9TeTR1N3grV25QdTdDVUlESmMxS29zTVFO?=
 =?utf-8?B?MEFiTmRhZXlmRjVQeHZDRFc0SGhIck5hcDBZMXVTY2p5WE83b0VLbkVkdjNH?=
 =?utf-8?B?U1o3RXQyOWVvZVdMRjJGTGlBSGZPWkVsVmFtQk1uNDJJN0lOSE5PTEFTMmcy?=
 =?utf-8?B?NmhOY2lsNDJqVHp4anZ2NXBZY2xoVlFsU3BuMXhDdVRMSldnVWg3T1M0TjdI?=
 =?utf-8?B?UWFpVEd3U2Q2QWduYVcyeHovd1l6M1M3ajBKZ25PWTBkQzU2cEpJaWk3WUxx?=
 =?utf-8?B?Z2dYMmxMT2JmdVA3SVlYR1FnZmtwUWMzUUhqd2tDOENoZnl1a2RuTDFyUHNI?=
 =?utf-8?B?QzR3ZEZtTkhxaExHU1dlYnRVcGY2QlRPb2c0RVJZTVUyV0FZR3RGZ0VmL2x2?=
 =?utf-8?B?VXlUWnBlelpsbmUyNndpdjBpTldIWTZqT2JuM3pKcXBsRHczcTIrbDRsNTZ3?=
 =?utf-8?B?Tnh1TG1nOWNRcXg5bXJHcThxZDg2bzJWR2xRUDc1N0wweng2U0tSWFdhbEoy?=
 =?utf-8?B?bVJ6alRrZ21QSEZ2QUVNak5aNnVhb29hZWpvSjNkeElIYi9iTnRwZGQwemxV?=
 =?utf-8?B?YlFzZmtsQmp2Q0xsanZaNFpQT0hrWCt3MS9ub0RqdHdBYW9EUC9TSFloUU52?=
 =?utf-8?B?ZkxXTy90RWxhYmtyQm5rMkRXNTVlQVNCRHdQUFFqU2lxRWlnWGtNRUJxay9J?=
 =?utf-8?B?Ym9uUlFnSUd0MWlsUDJzVFY5eTRmSEZsTmwvUnR5OWt4ZUVRR2lqMW5NcXdE?=
 =?utf-8?B?b0N1bS94K0g0RFdtQ1EwanZoRkZhMURWV2JFTUl6NnhCTWxhVWUySGVvU3J3?=
 =?utf-8?B?YVhsdjVkNHNlUExwZllFekFjRjNtL3hNSVRDdDJ0azI4RUpkNjBHOVJaNkhB?=
 =?utf-8?B?b1ROQ2ZVejZhREhHZ29FSk5TZmhITEZHNm5KamYrbVh0V05zOTh0NUl0YVNU?=
 =?utf-8?B?dWFJK09iU2M3ZWxKTGNnMGtXSG1WaXJtM3FIeG5Jcmlpelc5ZElQNUY4RGFa?=
 =?utf-8?B?TFUyYnhrWE9vaFh2TkQwN25JS1RRS3hwcE1aQUg3aWtmczdZQzE0LytPSHEy?=
 =?utf-8?B?QzFGSFlyT09laUhDYWZjV1Zjd0s2Rmp6ejUrNytjR2gvekxTbmFpUEVUa0Vl?=
 =?utf-8?B?c1RtQVZzVndVRkNDUG84eXJOVDFoeVIzcW15WjZMS3hZRldSRWx1TkVUdmI5?=
 =?utf-8?B?YTFBWUJZdkNDaDdnY1JxWUpYV2MyU254aVZTSlQ3UmJ6ZkhNU2pnSnJCbU9N?=
 =?utf-8?B?cnRJSnZwL3NCMHcwRUJXKzJoMVY4V0NWZDBEbFh5NTZubDVxWmk3TnpCeTJp?=
 =?utf-8?B?ZUp0c0kvYWNOMG1lQUhZd3ZjVks3UEc0N2RZaTQ5RCt5QUdMTHBKd0xFbXIx?=
 =?utf-8?B?WlVwUU5paFUycHd4bG81R3Rta0traS9tMkVWcEE0WE15MlZDWkovU2ZGN2V0?=
 =?utf-8?B?VHFUTVdOVDlsZXJ3bEowblgxbkZxbU1OYkFEc0gyNFlBTzJvYkhWSUFVSEg5?=
 =?utf-8?B?Q0VTT0N2TERKdjJxenlqeHU3QW9rU3IyeGU0ZGUzYmU0Y01RNWNxM0lGWGI1?=
 =?utf-8?B?UDN4NytJVWZNSTBOQk5HS0cvREtPaFJjVWJKdWZIN0xVQStaNkRsTjlOS1pq?=
 =?utf-8?B?dkdhRkZLbGtRdzJxMDFrQVBFazJ5N0UyZE9HVExRZjBVVUJ3QmgrdmhUWUtP?=
 =?utf-8?B?alRkL1ZvRmVjdDlTR2JmY0FDT2VwSEcyaWNFVEsvK0p6MHZlUHIrQW5sU2Mv?=
 =?utf-8?B?NFVtR09RU3p1SlBRVlZPb08rc3U4RDdvdC9VVnp4UnFRVVIydWZ0dz09?=
X-Exchange-RoutingPolicyChecked: gWLnLbYZb0Sqf99KsgVG4q+7TOFLFYfyuDW2iZHWhzM7Rz3kMQeNpBU3v3RFZyS1gz9O4v+Klr5DIc1uO7hfIJoCPUlGLcWEjDJCCo+IeZYumThvg6371xeFWN9EroqlEaijRqgiUGgCMQAigm5Zu2AVIMNukECPXvB2Eb8qgXquzuMpP9hs7sRpRet0B7Y3fycmxfhmA2YtO7jw/UIaVvAEdrosDavf9dJG5OJEjlXj+Jupt6XCTYMFUp7rnZkZO2XZ0rBdB/hiYkaKMad2kAILLHjq0/BSJ4r+PQ15LO/59BW/YClwxGHjaAbWQR9AdoIcrrOSv0kXreBGYBM3FQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 48dc95c2-9aca-40a7-f316-08df09e424dd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7997.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 17:52:38.7847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e6ixsDxdYIiaT584L64q3ObfQCc365Ny07u0d3i+0DvVSYwTd1ytLS1cSdj54QOXERDyfXCo55rehPc8JIFquw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7825
X-OriginatorOrg: intel.com

On 9/3/2026 7:05 AM, Dave Hansen wrote:
> But even when writing this, I was
> forgetful about what CONFIG_X86_DIRECT_GBPAGES actually did. I _think_
> it was the fact that these:
> 
> 	CONFIG_X86_DIRECT_GBPAGES
> 	X86_FEATURE_GBPAGES
> 
> kinda read similarly if you're reading fast. The config option also
> doesn't have the most enlightening name.

Yes, the config option is a bit vague.

> 
> The comments are more there to get the reader to slow down than anything
> else.

Sure, makes sense.

> First and foremost, in a refactoring patch, you must resist the urge to
> do this. Refactoring patches' job is to show -- in the most plain way
> possible -- that they are not hurting things. The easiest way to do that
> is to make it as stupidly obvious as possible to the reader that nothing
> is changing.
> 

Yeah, I was trying to sneak in a minor cleanup along with the refactor.
Will avoid it next time I do a refactor.






