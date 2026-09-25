Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79E01940B0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790297332; cv=fail; b=fyGpxx2Cbjlp737QwwGT09n3GKw/Aof3OJiTXlYz12IPPUM/CZ45gF4SKjBA3y2RpQflfN+9vWzmwIXLj5nJ0INQfH2nHsBtyBB2EEXGR4rXMfrXOw2BC7zbcPjuao9aeSkCcII6thMal6Fp5fOhrbI5PhtuVdcfM3SG3w7rCmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790297332; c=relaxed/simple;
	bh=oGUn/ZpTcyoFMIotsKqUgUWySiGI0sw3WX4GO/WUNio=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y4QhTOSramVNiaM6lG6MEvdM1bRWBNn06LLwprhrOwKnavzbi7cc3hGouboYGHGzuxo2dDiJRNNPPBgwls9x+y0BoQ4RUPcknwFLC5wqfM3VW0c3ugSCTiL8zt033DoNFmNtbIJ6U4QKzcOPP3PZwNxTZLUt8eH4sLzMABVFK3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IeCRwE6v; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IeCRwE6v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790297331; x=1821833331;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oGUn/ZpTcyoFMIotsKqUgUWySiGI0sw3WX4GO/WUNio=;
  b=IeCRwE6vgZtp0P7bk9NqV4z0MXVHrlBq6t9be/DI0rv0MLSwoRxZGPDG
   rJpqb6juHHU/EGBi6f0BII7dJ2qraxypNVEAqz8Tjj7ATBgpxK4Xla2aO
   2TUyWwfk1oiiE/DdKzRY0DhLLnuLZS83KeaFDV6nXuS/F3BT4pWapay8t
   bcvVvRl65mYgUA93+gE0fnftoPElOMzRVabN7KOXroXkPVfLOX3nqoxIp
   7odQHD9RZORfIuo4dimnJv3wqRzhsrk2wCAbslSmMB39q0EJzbDLYDoqT
   uH4kdScVDtpznBTWUxCNVZ0B6ewwYEom5OT5slGW89iyfi7/mEII9wV6g
   Q==;
X-CSE-ConnectionGUID: Q3Wr8l7URO+aszI38EB6NQ==
X-CSE-MsgGUID: nEtdOqxWQyeQfbN9ncSqxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91187454"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="91187454"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 17:48:50 -0700
X-CSE-ConnectionGUID: yv1oGSqeRfCQYe+sOsaaDw==
X-CSE-MsgGUID: z8OvAmZUSOmsPz4MItACYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="273681120"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 17:48:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 17:48:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 17:48:49 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 17:48:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lDF4B/fuxykK+6tLYAzFVhtiq4koRFufxa6VmLxMZEktH1fs+t8CJoZpXlmR7kI6SgqM/Aj3VrbE/rLQNhJjnihkbBmP+JRBnihcfA5ftKO1BCgSZjInJA1qMrieJzb4UpW28X3OPs09EuHXC7sGT28JRfdtWK856fHospP1q1StkPpk8PuB4esAaUNy1+K5z0qdaIYuMQY+12V9vF/T7sRR5Bo1i+xfvoI2CRVatqMFHJYOBoypVcNZj7khLi7criyKA8oLMUPC3RVUvCRx5lv0fgL567vS9iPvJE1sy9WnWBI7YvAOtnIbk8t20gEvmdLK/xfkyee5+XzyHEsUPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnDjCV5YCuMy4n9EjEjCFNE8KmTbrTgqlZl6HQfHGM4=;
 b=YclH5nb+dV0aRmzivKhNxX8959EZ+bKRnWEQM0H+0un6XXYX3xg9Vf0jhajn+xafIlbuZtAmrg9qT9E1uE7JA1pDIwv83i82Quw0ERne0vGD6S18bPLnAhAN11K8PyUfa9ypO3d6Lo8p4iFWJ5kfRnNZsukWq4BdH12bfePWQIDnrmHmbt8+1aFeuwmP1Jom5igSieBTGm2e1RKMJyMj2QxDR2vIlXmhQ4UiZYJ5VWCOCcifBu/wT26C2WETZbPYrR9hNtCH8osbJcXHaWsOqY/+VRO78CW/XBSbIkWV9ByLm1Uy8HLTerjKY2vGVPLnQICMHjF+XmSsiQHWqMS6vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5)
 by IA3PR11MB634048.namprd11.prod.outlook.com (2603:10b6:208:549::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Fri, 25 Sep
 2026 00:48:47 +0000
Received: from PH7PR11MB6932.namprd11.prod.outlook.com
 ([fe80::cca2:8c49:b4b1:761e]) by PH7PR11MB6932.namprd11.prod.outlook.com
 ([fe80::cca2:8c49:b4b1:761e%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 00:48:46 +0000
Message-ID: <cbca714e-6bbc-4d4a-88a7-47bfbc3b76fe@intel.com>
Date: Thu, 24 Sep 2026 17:48:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/microcode/intel: Refresh old_microcode defines with
 the May 2026 release
To: Dave Hansen <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>,
	<x86@kernel.org>
CC: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "H .
 Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "Josh
 Poimboeuf" <jpoimboe@kernel.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Dave Hansen <dave.hansen@intel.com>,
	Nikolay Borisov <nik.borisov@suse.com>, Tony Luck <tony.luck@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, <linux-kernel@vger.kernel.org>
References: <20260925004234.2634052-1-sohil.mehta@intel.com>
Content-Language: en-US
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20260925004234.2634052-1-sohil.mehta@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0121.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::6) To PH7PR11MB6932.namprd11.prod.outlook.com
 (2603:10b6:510:207::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6932:EE_|IA3PR11MB634048:EE_
X-MS-Office365-Filtering-Correlation-Id: 396bdcab-3851-48a0-21f7-08df1a9ec193
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|11063799006|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: oa+wsx0Y6Pa5nNRuq/kmI68SrZ4HcO5ERCvYQwNXLmrI7Pp83Unp+zGsbJDWTL92U4u/JEXRnXGL6MzI9c8rWpPUnezsHhBOF7amtiBSQNDS2sdpFvFSMhCQ/rrk11mMKFsjYRgH+K5rtMM/9yHX1M06O/f6RafnqBIJPqjR9yjwIT42qyTGbuXZgeY0kP0LmzRwP0oOv0nIsFHqnE1/B4cnwPfZpm8gL4Eq+CIb0CvO1ApYwZgUbjG9+uW5NyGfCzYsjwPiXj3qy/J4xN8/XzARFtVRPzSd5ACHgKyeflPWb0Ks/KDO0cDnULyRjJu9+N5lbzd9WXx+sW9ywiF1uEctZaLjQhIU/ojoKz5QQBq8e5KOMySzIbkhABeaioLlObJUJPA60oOtWDyHINVt7p+ik0KL/6F+hX+9+NvvZaOW/221Waf+TF2knu0AfLdViur4H0NBDmTXxrommtoDNWsTKT2qp6sHm5ED5pYFX/TSbMgedqmfxMkY/2xNiPWvXuG936p0tM6er0Mdao3Hsrwv161YaDFh7P7YLTtr9xxLZ4r78D96vw1+mFl6Q4mDDC9mz2W+AMhBTkIFPXTU+s6HsehHfU1QmO1xLNJeBuDsVxQLHUkYHtqQxz1tpWj0nMQtNyqWMuDls2kXKpJN/kGhj+YU471VxXOMUKjy5z0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6932.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(11063799006)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTBCWWZhZ0c4bUhaS1g0eDdDdVYrQlYwV2JEb0RmaEprTXhWMXVRWGFhVWNv?=
 =?utf-8?B?cmU4Vm1WaTNFUDNQeGlxUVlxUExSaGhKTjdTZ2tNRzc1Qnl5cVVCNGhXVEE2?=
 =?utf-8?B?ZFI4eUZ5S2xwSXAzeDRSTVkzMmJWM0RqcU1ZZ25kK1FzdzgzTlVIZ000VUJy?=
 =?utf-8?B?OVNPcWtNTzR0RkNJVnZZUFhjNzk3eHVnb3doY1JKclZReFhQNktQclk5MXpD?=
 =?utf-8?B?TnhHUEZtQ2JMNlZnTHJtSHdYTFJzV3JQVTduL0pEUjFFd253MENLaHdNS1Vy?=
 =?utf-8?B?blFkNlJjdWwwYkdTMk5JQ3cxbURod3lrMHZoYkJHczg5M3NrdXhJdXNyNnB0?=
 =?utf-8?B?VkFLVHExMlFsRm1GMzVLRlY4YWc3SDF1NXNEV0hYZW1TK0Q3alZlUUg0TWgz?=
 =?utf-8?B?SS9CSEFZVitPRFdqUzIzZHBMR3RHSlRrUUhpMWJHYzlQbXk4QnBGZXBocnh6?=
 =?utf-8?B?MW1vVlhXOXA3aENqTzRvQmFaM1BNQkIzdFpSNllCWGFLSnJ3OUNxUEREc3FU?=
 =?utf-8?B?N2Jkc3N4NVNOQmtobjI3Zk5oZ0ZTbEtLQWpsVmF6dmpGRmtVaWtqQkZIaXhx?=
 =?utf-8?B?UXJmS3F6czdiMlRiVElLemFSWTdmUUlkQjdOeEV1Y3NOVCs2VFdRKzBTbGg2?=
 =?utf-8?B?ckI3b2pyVGplSDlqL2RSeXc4MDFSd1B1cDJZRHVVbEpaOGt4bCtnbUxENXc5?=
 =?utf-8?B?RFdQQjhNeTN4Y1IwdnBPQkxUcHZob3Rza1l2VlRzUjJqbCtPRHlxRWQvRUJP?=
 =?utf-8?B?N0FUa0Q4eGwwb1I5RkxqbXl6TmxXWVkzaC9sM3lUWjFYR21adElJdjQxTEdG?=
 =?utf-8?B?ekhLUjVzazNFYVF0Syt6azZnQ0tVWmFzd3hJQzd0bHNxNDNGQVlLMVBaSWp1?=
 =?utf-8?B?RzBmSGNYZmNaMzBIcjMyb2lBdTJ4OFp2b1pFSzgvNjRlamJaOUl4aktzaEtm?=
 =?utf-8?B?MCtqQ2RoMUk1YkdSei92c2g5ZUJjVDByMlQxcE1CZ21GZUxvaUtxVVZtcUZq?=
 =?utf-8?B?c0ZaZXQ3WnBxdDc3UDh0b2xlclVHemZXckdqUElhTEF0NVZUTkR6Y05UeTJy?=
 =?utf-8?B?bllNbmE4VmNsNERrUUJoNWNUcG9iaWg5UFQvaDcwODQ1V3VMODdSSFUvMGpI?=
 =?utf-8?B?R0FkQ2RXVTJUQmdSeFVkYVYwOEJ2ZWFMU0VkTnRvcnNPTFA2Z0pmVmpoR3Vo?=
 =?utf-8?B?aERqZ0ZOM2ZTZE01TEtadHFCU0grem1sblJxZ1NXdlVtZVh1S01oQWlBTlBn?=
 =?utf-8?B?aGJxbFRQQWF4a01ERzZra202TXBXeEJzblltWUhzUDFtQ1ZZdTBHeHBUcXZq?=
 =?utf-8?B?dzNEbTVhQjQ5ZW9QZ2g4T0o1OVk2ZEtpaHJyNnhKWmdkTVAxV3kvNDJqZUV3?=
 =?utf-8?B?VGFJdHdUQldSUlZtbkt0MGx2WWdGdUpjbllsblNsa1NYQzkzL0YyeUpRTE9v?=
 =?utf-8?B?N2dpbzV0OTF6ZUJJN2huOXI3bU90VlNkM20vWVNEMnE2dngwQllRZUVPQWFi?=
 =?utf-8?B?VVE1My90TzllMW5HcXZYTkJCSzIzU1JRQTByd0Q0ZnppTHBzMm1vNWJnWHR6?=
 =?utf-8?B?SHpPckF6dTdWZ2l4LzR1YVkwWXU3aW45MjZwUW1mT1hTMys1SDE5MEFhWW9y?=
 =?utf-8?B?TzAzckhhaytkN1hhRHV0cG1zV0ZZUERzcGZXendxSUUzUmtvdW9FSm1DR2sw?=
 =?utf-8?B?RStYNU5TdWdiOEd2UWVpbUYzYzFTUDFCR2UyTUd1cGZEUUxHbGdPOUhBVHpG?=
 =?utf-8?B?NG9lTmtWS01JK2V6T3lNeDhKVjNZRWU3dmJkNEV4STJaUWluNzYvSVN3YkZM?=
 =?utf-8?B?VXErY3dQSkFYMWZQS2hZWVhGS2NXU3k5MmdBVGZxR0V3SjVBd24zWnk1V0hz?=
 =?utf-8?B?SXBsNGZaM0dOUDBZaXNMQ20wUkF3R3Z0TWJCWGwrN2lVREdobVc1ZXBNODEv?=
 =?utf-8?B?ekdxSEp1SlNuTTBDR2ltTS8xbXRKRkZZT0QzV1hMcHgxM1VURDloQUpKOE9q?=
 =?utf-8?B?MitINFBjdE00TjBUaTJKeDZtY2h0YjI2TjJZVFZYNWMzeGVHYVE1NlVleVQw?=
 =?utf-8?B?QnBRQi9lNld5dzFiL1VRaVVXN0s1OXlwVTBDK28rc2xrblBOUk13d2hsUXlJ?=
 =?utf-8?B?b0x4eHFORWw1TWI4L2Zuc2NhUVI0L2FTRlVxZUVqNnFYRnBXVkFaZUlCenAz?=
 =?utf-8?B?WG9lSVk3V2RNT2I0WmZzdGhsSW9LdTZnR09MQlNQeDhwMUJKc012bE8vMjVl?=
 =?utf-8?B?ZDBKNnpMYjNKMHlBbjlncjk1QkN0UUlQdVhGd2RQVjZvQlFPdmhrY2hjdENI?=
 =?utf-8?B?QmxQVUNDTmthWUFCMFhaMnEwL0U0dUdrVUx1N2UyUVZ6cGlrU2c2QT09?=
X-Exchange-RoutingPolicyChecked: sVqrbpY5qDwu4JkOuMH13FaxDh8bjBQCJzrbKpZROGTHmaAL+0KYdsktqZXbeCI4SIOv5TasjneVT4yA3naSVM01gobTTgbgsL8x/b+m3wk4rrITcDNWw9euGp87kiBKmkY2dz2W88utwcM8gYBh2zlqwuEwxkwwFc4aiS+dtE8aon3obzuxuHPKac9kruRUEvh7nPaDbZ0Uj/SXwXJiDETSFzMwIaaIv7TkzsWGS2QeJH5PmCpjGSNFJe9dgaiQSkpyIXcLPJxLMFgLCnV/ZnzEYEc9T2hSxwG8ymzs+6NDXccDxNRj7HQnZk4U3NmKb5wAH5utV2aN0sUbEtTIdA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 396bdcab-3851-48a0-21f7-08df1a9ec193
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6932.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 00:48:46.6543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YzjxCFOvKVpDPjKz6ZMxavgHfAs8Qd3gD0Yht6ionF04mQ/6SpPPUD0vE7QknQ5q3hUby6TrTAwtxgDD7nVSag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB634048
X-OriginatorOrg: intel.com

On 9/24/2026 5:42 PM, Sohil Mehta wrote:
> Update the minimum expected revisions of Intel microcode based on the
> microcode-20260512 (May 2026) release.
> 
> Note, the three new entries are for INTEL_PANTHERLAKE_L models.
> 

s/models/steppings



> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
> ---
>  .../kernel/cpu/microcode/intel-ucode-defs.h   | 91 ++++++++++---------
>  1 file changed, 47 insertions(+), 44 deletions(-)
> 
