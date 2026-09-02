Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13A74CCDC9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383725; cv=fail; b=m/2T1ZRLJOytmGoAeVdFle87f9wnzEP3dcTqhQ1f1QU1tiL0RDIT0JrfBhHBcfvlwmHsgY2yinIF/JkaCttI8gdBbAMIuJDZyzgP4Mrp7mRUiy74Vg1/5FW77UjRqN0AQXFyocMret5YJ7+o6CFN0uO9y4QOBpZCfav7XjmDNXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383725; c=relaxed/simple;
	bh=i6YUSVXDXMGQLDkuvdUU9FDtG4TZIwJmRJXS/EqTbYo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FBjQWDg4rexlB/ex/nVM2u6+8eU1+T8O3RL4gEdDHAAXN69rpB22/nXk/xVr0O0rpI9AMoMf8w83VjUSLw+kE76930l/kNRu+CgKqmVSFVdhBfqGuHWexuYSiIC7K7RIl0jJx2XIbz5gGHl1vd0j2OAgwwR/BVqzh8f34V54MRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FML+7pBW; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FML+7pBW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788383719; x=1819919719;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=i6YUSVXDXMGQLDkuvdUU9FDtG4TZIwJmRJXS/EqTbYo=;
  b=FML+7pBWEdk2qnFG7Td1MNUIlNxgSPmNRkLsY6zfNLoZ+mcp5hfbAB9d
   SwQnOXotDArt/+gvcsqxr6/QXxJsgpH+Mdtd2byn8cfvszXj0HuXafOqi
   pCmK+/wp8MOB6m6BIn6eecaGvqtziZ9Vpk8DqQZJ1+QKHl5Rncqfx/dF1
   Mr900NLwipzINXOsOzS4QHXeqL1nsodMbxfYchD08aYzPWmzo/f1WITW2
   a5YrDZrq2ssoli7HzS5RtJ/Xxn8G6Fh/RVJ4Zxm71cOwqgTSTHuAPV6+c
   xQcWvtUtm8ggHmtGwaD7wOI2DHYreH8xYbjhvKl0q0ckcTRS79Ivy4Jx0
   w==;
X-CSE-ConnectionGUID: ZWU6eDsFTvaISJPBSOV30g==
X-CSE-MsgGUID: QhRLxm0VRG+xn26Tu/Vchg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88703290"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88703290"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 14:15:16 -0700
X-CSE-ConnectionGUID: 846RMGvrSHSNAxm3xLg0qA==
X-CSE-MsgGUID: LQUtP2iFSkqP11MhC2NHKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="271484612"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 14:15:16 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 14:15:15 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 14:15:15 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.62)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 14:15:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+r8tdQwO7eQjY/SKFzb7pFHiVc83qoiuoB5xIX+Fr+PaO6uud2cc5HB5WGbr26kgWWnKk+R0ajzpxHS4rYPgOKICg9WvaOE8J03v5yR2JxtiFSqxX7rSqy6ugPSf7M2/a9l4sf3tH0cRkhfLAT8oiBtdWa2XMa0Ous/UjI0sveWhumuXCNd8fukDM/VzXVB8zejjjcFL8NQ62NfYHnnZpLYroH4cXWvLKtJlaF5OXOyX9o9WrQxk9gZY5gvT9fYXEhQwEvqiJ/dfiADOQFE03LE5kzp4ZSHba9nsGPvHk3tkIPX0oTQxmBW2MQEuO8zlR0p3yY9qp+ka39yEHINDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3U8SFkFeZLBuFRRrTWldPl2V8eShxMmLS+n9VTz//Y=;
 b=N/P/8sbgA6BFrgzjNg628UDdoS8n4wzMHIemIWpENifCSLJD8EW3upoJiCPc+kh0Yk6mDw8W++t1t5mtZyULkRxwkmql3XEfWOL9nixhkVKgr8MW3Q0C8AgQl/+AgeSS54NMKqpwwDURmBmo9dQetxI12i0vTDmd6+o0JVoaFuv9/nzuMQIeUvStG6ESc4oVhYjbb29rIdjWtB/7Ee/yxKHWufH0pNuKDEw0tGEkOjSiW/6v09GQIvOqle+/4S6M7vycNZ/lMY+3wWSNwnlr3pGLanyoAXzgEZDQsC6aJ/z8OsERuZXDmwUFsYClJgCPXRMcZIFvR3Hl3/cY3EAzVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 CH3PR11MB8240.namprd11.prod.outlook.com (2603:10b6:610:139::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 21:15:12 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 21:15:12 +0000
Message-ID: <f5334ec7-db8f-4203-8129-b05704fe0e6c@intel.com>
Date: Wed, 2 Sep 2026 14:15:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] x86/fpu: Document signal frame portability
To: Andrei Vagin <avagin@google.com>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>
CC: <linux-kernel@vger.kernel.org>, <criu@lists.linux.dev>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, Alexander Mikhalitsyn
	<alexander@mihalicyn.com>, "H. Peter Anvin" <hpa@zytor.com>
References: <20260817042048.1579415-1-avagin@google.com>
 <20260817042048.1579415-2-avagin@google.com>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <20260817042048.1579415-2-avagin@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0167.namprd05.prod.outlook.com
 (2603:10b6:a03:339::22) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|CH3PR11MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: 69929e30-0eca-4961-b5c7-08df09374689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|6133799003|4143699003|11063799006|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: +uTuCC+zzIlZVqos49khsC2IPWEjNLsBOYSYrDeXXapjEVrrlhXLn1sAdDADidQMDGvnfNWgV0oAMrPI4zT863Z1bv3KjM1Kp+BEmjKLNmUEGjfQfviOSKi7AE2t9KzRg6t3P3elphMPegOctbDHfqF3sstFUUNzQ+sWF2wEISZ38woLoqdgn4aaizJUAzTaCLN3Pmz6t1F8n8uc9StcrDbOHiKme4BcnKKQatKbVhLkamQcR+XlyMgECehfn1uYColul32roeHxRA7FM+OGa23d2Bm/bKOWOfm/lqUfGoTyNXt7DugJEsBmSwXOd6ujVAK5OuQQGcXJq/agEAXpZr1Jd8ASFxFBQBM94B9vgEtx3pj1LgPu3NPsv6tj8y5mvw6nlKF8ioh+PlU26PlCSqfUZ8KvIQroHbdyCXtMGBzviQPa/LDiyLzuTnmm9XRB32dO8P9n5YkA1Gm0g/HQ54KJd4YkA2v+tF8OJrMjZPmBQ3PHwIqkqFrTZvJPsKxuK/SYAsrswgEs5J7kn4JPR8oQuDOtQPUWCcoD+cjocnCw5f2axtXfKFIoHyrxb/i3w/xiRqiz/akVxa2GSvO3rymLo2ftljH89vlOy6o9qsWkBR9rGziQrut8uybubYhiZW/pzZTAgxPM7J0BfYoc4iq37eVHOBFyqJ2RrlWdqYE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(6133799003)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVdaeVlhaGxIOE0zL3FrSUhoZ1V4RERoZHVYcWZaYTZBQVdxTG5WNnB3MUhB?=
 =?utf-8?B?M1Y3ZWxBTFNkL0VvVG82dk5NUU81TVNNRjNTMGtIVG8wZzRSb1pNVmxWeFh2?=
 =?utf-8?B?aDh6SW9ydGQ0SzM3cXFSdi8zd3BpM3Y0NkRCK2dUZklEUGNMQWZqVFN6ZDVK?=
 =?utf-8?B?MVJvTERxdjhPdzltUlN2UWpjcWFHVU9qbVJtMDhIcGlWMHNsamZQSkdZK3Qy?=
 =?utf-8?B?dGF4NWZ5RkRNS0JuK3ErOUdKSmkzN3hKaFNuOElxU2RBd01kc1cwMzYzazJT?=
 =?utf-8?B?aHJsSjZPNzhMdCtCR0JuOForZ3JWM2FuVHgxMWtGa3pHTGxXODM1empZRkhO?=
 =?utf-8?B?ZndheGFFMGpibjg1YW5zTDZYQldsdmNKSTNNYWxWaDVJcEZBcC9PcU0yK1dT?=
 =?utf-8?B?eEpyREswOHlNNHdEb2MxaDUrTEdnV0dyM2t4T0hSbEp6NnlhdzVvQTU2R2Er?=
 =?utf-8?B?ektQZGVJSndJVHZJb0c3MlBOdHp5VDhCN3prMjZ3aEYyQWVRb2RvQ283YWFq?=
 =?utf-8?B?WU9OUStXd2JNTTQ2MWY2c3ZPUW81eXBHakFkL25aRlRjSWRTWkt6VmNHbXhP?=
 =?utf-8?B?aUljS0pCSk9uWGtRRStxSzV1MGdZbzBZSUZjUGc3cXhTZ0dmOU8zeWhOOXVG?=
 =?utf-8?B?OW1raDcrY2o1VkVrMURsMENFWGUwR0NhUXFMa3hwTVhxMkx3eGVDVzMzYWh3?=
 =?utf-8?B?WDJMK3QrNU10VjM0anViWFFnaGErQnRkcXUvSGF0S3JnNnZXZE96YUVrV01w?=
 =?utf-8?B?MDhZUzF3V2RmQkJ1WjFtTTNCSFdmTGE4K05BU29ZNG5uN0N3UCt2bzFUT2Fq?=
 =?utf-8?B?SGxJb3d6cHVnMnNLNU1nNU4welZpQWRSMVFwdjVxaU4xNjBSd3kzZUIyMEJj?=
 =?utf-8?B?a2crRUprZ2hhZTYxTTYrQ0hjQ0Y4NDQ2YnJFRDl6eThiVkdyNGxoMnFzdWhU?=
 =?utf-8?B?cDVpY1ZyTzdaYVNTOEZkbUVwckN1eXB3RlVHNGR2LzZESlRtMmhxeFhwT21G?=
 =?utf-8?B?ZnVNdTRiRE1ZbjBrY045ZytzQUE1KzZ1NjdVMXJ1SG9ZdkhzUWsyV1VsUlR3?=
 =?utf-8?B?blJLdnVOTkx2VmJJM2wrVWtwdFJ2em1nS3RzNUxIWld5Z0JGd213WUFoSWls?=
 =?utf-8?B?RWFDdG5hbmxTTy8wUGlxM0FKQVRtQnJTMmZBa2U5cGkxU0pwQytlRXRxeHps?=
 =?utf-8?B?Rm1uOVlxMjFmcnVmcXh3RVQ4ay9XK0RjaVNOYUlmQWNGdEhmWFh1a1ZScVNC?=
 =?utf-8?B?VnNlVDU3djFFOHFraFJVenlNYW5EMlE1aS9PQVUyb2VEMXg0VFVHREVhWVRv?=
 =?utf-8?B?amNra2QrcHp5S1dCV2ZHQTZtWTFSOS9PK1ZTSDRrclhHYjUwam9lVGcwVjF0?=
 =?utf-8?B?dkxVQnVKSy9Qb0RLNXJ5TWFoNmFLNW9neXdjUHNrMlQrTWszZW1aUDJSUEQr?=
 =?utf-8?B?bVRaUWMyV3NpZXUxU1J0NEduMVdmaHluY3oyeTE3bWFuWDBLMjNnSnJIZ2d4?=
 =?utf-8?B?UFZtd1Z5TXM0VjJ6QUR4MTRjUHZUTDJuY1VLYUMxWkRVdm5NYlBqVjZwbVFD?=
 =?utf-8?B?N0I5VENJSVc4VmFlQ3VZNHB6eW5pTmZLNUhLK096TldVaVpKYVFGNGZRUmZo?=
 =?utf-8?B?blZzUHBENS9rdUVRTzltbTdrZ0lhUXljaytxQVZ5a1ZZRFNFSzZpMC9ZQ2RF?=
 =?utf-8?B?VDg4RkRSTHEzeEMvWXdyYmR0UjEyYlNLSEpBYUJTUUFZWEZTNVkxbUIrSDFo?=
 =?utf-8?B?ZDR1UUVaaEx3LzI5SVVZazdEWi83WWlqK1k0RjJrbDd0Tm1hVWRpcURCSWo3?=
 =?utf-8?B?NW4xZld2eUNmcGk2RWR6VS8yK0NzT2RNV0hxaUI0ME5mU2pmTnhJM2c1Mngy?=
 =?utf-8?B?SVc2cVFYSk5HTTltZ2VGZzJCRHlyMjRTRUozd3lxQW5vWTFHeUZzRkVBRCtK?=
 =?utf-8?B?WllzMjNDV2VjVlJXNUhHdnlkQVFEYXN3aklsSlp0bUlLdVQ1MUtobjYrM3hR?=
 =?utf-8?B?N01xTWtmV2lnS1Y0QUxXWjhxYlI1MG5ULy8yUklXVVRNUGZWbWNPVFN1NFc4?=
 =?utf-8?B?ZlMvYS82NlJFc2lyNDNRdllkTmpac0Qrd3lwUkhpRE9qMUdMaFllVEhGemw2?=
 =?utf-8?B?VnJGSVMzbGRpUjhjVFZ3MWhPUWI4WUorM3NtY093ZU5zeHpDakYzUE10M2Zl?=
 =?utf-8?B?LzJBNnE1YVdTRER2Znk2WnVLNmhwZXd4M3Fwd2N4OGZnZ3pmSG9mUUNEUWdH?=
 =?utf-8?B?R2Q2UTE3MWVqTTExcDhQZXJlN21kWVUwNEhMTUFMOXFQSWZFdWI2b0RuWDdS?=
 =?utf-8?B?eTVDaGx0dkkvVTA0aVN2NVBySXhEeHhIWnJmOEFtSkhLRXpQTy94Zz09?=
X-Exchange-RoutingPolicyChecked: gXLJJ6ATEntcHzmSpVt0RUCQS76ccLhMCkwksYew22rb62DvQnlU/QpeATiFk6NqrOQwS/X+2wvS9Sd0sWUw8FJGF5SEN9YvFtTU4RO+A1aSkO2Yh4l5p/iYwvVr/r8iF8kxn6LXGdegHjFwepOAwqHQG33eLLdpZ0UFjb6bCJyjIBnVqWSDqtXfa9IZDFtjQn5EKDORyY0jsikTyFg8mZ1R7gCjXi6rWwbEOT5Tt6hRpN4vzqNaVIMTB8iLUfJksePjr56sXTl6M8Nstj60363W0dIjgZ9/KdiqK5aOplSjtBFkDoDnZ3HRhTFGTCf2KMm6Y+PW0eJho7Y61X9JVQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 69929e30-0eca-4961-b5c7-08df09374689
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 21:15:12.7361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kUVPBIN5Q8zqlGN58wHr/GLS1lg7vEF0sSEi6BvkRs44xMQIbfdoR2eJm1rCT30p80+D9tipG+tvVezNN7J2N2Egc9jmWuEJ44YmBmr+S3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8240
X-OriginatorOrg: intel.com

On 8/16/2026 9:20 PM, Andrei Vagin wrote:
> The x86 signal frame is designed to be self-describing, with the
> 'xstate_size' field in the software-reserved bytes indicating the actual
> size of the context. This design is required for portability, allowing a
> signal frame created on a system with a specific set of xstate features
> to be restored on a machine with a different (larger) set of features.
> 
> Document this contract in the uapi headers and Documentation/. This
> requirement is critical for checkpoint/restore tools like CRIU, which
> should be able to migrate processes across machines with heterogeneous
> FPU capabilities.
> 
> Note that portability is constrained by the architectural XSAVE layout
> (component offsets and sizes); the destination machine must share
> matching component layouts for all features present in the frame. While
> layouts are consistent across CPUs from the same vendor for active
> features, differences can occur across vendors or if the XSAVE space of
> a deprecated feature (e.g. MPX) is repurposed for a newer feature
> (e.g. APX).

Thanks for including this detail.

>    * fpstate+extended_size-FP_XSTATE_MAGIC2_SIZE address) is set to
>    * FP_XSTATE_MAGIC2 so that you can sanity check your size calculations.)
>    *
> + * The xstate_size field indicates the actual size of the xstate context
> + * (including the 512-byte FXSAVE area and the 64-byte XSAVE header
> + * struct _header). This size is used in conjunction with the pointer to
> + * the xstate context to locate FP_XSTATE_MAGIC2. Note that in 32-bit signal
> + * frames (including 32-bit compat tasks on 64-bit kernels), the fpstate
> + * pointer points to a legacy 112-byte FPU environment (struct _fpstate_32)
> + * that precedes the xstate context, so the xstate context starts at
> + * fpstate + 112. This makes the signal frame self-describing and portable:
> + * a signal frame created on a machine with a certain set of xstate features
> + * can be restored on a machine with a different (larger) set of features,
> + * as long as the destination supports all features present in the frame
> + * and shares matching XSAVE component offsets and sizes for those features.
> + * Note that portability is constrained by the architectural XSAVE layout
> + * and is not guaranteed across different vendors or if space from
> + * deprecated features (e.g. MPX) is repurposed for newer features
> + * (e.g. APX).
Nit: the comment looks a bit large. It may be easier to follow if split 
into a few paragraphs. E.g. there are bits discussing the portability 
itself and that it is constrained by hardware.

   Reviewed-by: Chang S. Bae <chang.seok.bae@intel.com>

Thanks,
Chang
