Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C679336494B
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 08:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791276098; cv=fail; b=pRFa7CnI0L0lj/mJi6F3ReDEJsqfTOyk7azIbBWDfBg6byRWSABGtRlVR4RjDEkhHGvN7cjXZzZUoUB/fT5664CPmRcolqhwqCQDWA0hoBJ7xm276ujLdKl4Nu1svIIQ60cR+zBX0+pNxxKgPmJ1fDRLv4xAA83wXi6f7rj7GXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791276098; c=relaxed/simple;
	bh=CAR/sgsR3w0AtIEz2mBeYHPDNzW7msQnZ1lPAi7EufE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EayrTLubNBQoOffkjEuWcpP0y82HzXuWp7FBXp5iFXMH0PAMacWFcbdAJdr8V6seX8L2wEc1+hypStxXFAK3BNjnwueKO3c0V8NWe+cDto8s3HLbQXVqTFStoeAVPqeKoX3r1AEAtBOzmEiUI5E3RMBb+K+yX9dfJJNf0kQ6spA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CTwU440V; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTwU440V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791276095; x=1822812095;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=CAR/sgsR3w0AtIEz2mBeYHPDNzW7msQnZ1lPAi7EufE=;
  b=CTwU440VETfhGWzfA6nbzeApgjQ6EYndhZjMgJjdu/eKdf+rnV7JwLed
   BUIVmM/lbJwdWVohnWPW6+r/Ef9x5/NY+GJXnZJpp9gYFfTT4QNWqzS+O
   SrEU6zNqqezOVfk4e39xBz5aaOZD2T8yc7rF6Gy0zZQvNgwcTc+VYZOPH
   SqsRrZim8K+9wI0MxErotN0C74bQi8Gzz08JphS6SYzncqJkKM6DIsTvv
   Jqv8Di/s1k9Gjw5VcqB3X1Aj65MblzF/9WIz8X9rR52OywF2jrdX+E64/
   DOok22KrkklFB9mYNmKZMAevfb5Dll9/vKNjrQcHHeNcGWyu+9lKknEjx
   A==;
X-CSE-ConnectionGUID: C8TVgDaZTvm4DhXORuECdw==
X-CSE-MsgGUID: NhFTi8P5QsKntN3u7TQMAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="106942"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="106942"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 01:41:34 -0700
X-CSE-ConnectionGUID: 6DIF1B+KQI2mfF96zZSLxw==
X-CSE-MsgGUID: kjHIZjZlTnupNSvSM7doww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="1154543"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 01:41:34 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 01:41:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 6 Oct 2026 01:41:33 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.39) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 01:41:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uOULxg/6ebCUIUSIikHfUeQ6ETjpwhEjPcnastw01KbSwcFb2LlPR18fzu8Uw+QRdGT1lgbVlI9R9xE47ptpMmxYHKEy777RrzI0NMjQ0Ip9ifvg8Ypn/1WzWagv+f/z5cSQX/UQkvvBpQtIQkkrioJwdNcGjAAGbz7glprhQBNy6Dt3NF9KYD1WF+fs0zGjtRO1tU9CuPyOxqyfDxyAfIleSNuqodj8eClpUqU3f6tHZ5H7tayaS7FgTfqyA8Ry8jgMILMpuTZMT0KaeeCHOnalKPhpAn+VgzyIIjNDtboCglDKGPiRS6vJSNiWi42ZEkCAqOOhD89Wbl77MG15/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ECxQII435vcxplFm4g/m2NqcSXTr/URmKL68h1Y15g=;
 b=haB193+bu8zc5og+pdMYeBesK639dFKrISBOKbJ1B08xe01jSsCpVoj8R1Z6HJptBgJXcug5mUR1w82+q6xLP/7M73BXcVWhpezImL9zxVdc2e0ck+G2ATenQ8DLCs+HQd7AxYaRYCTcS2qPsAyikPSoZR+IKijgMgEqrij9aFRIUD9ASFva3/RGZGTpCcsc4vyV9EphbyfQPYj/2jGfCRvZFzJMfg1F+mYuHaJ4wqTBfScAyXDrvzqJX0kPRU36/7YlHhgWLy7rEVpNOIzzyABdl4NS/SsH2Lc0aBPPXOIinqQjGXNjYwm0nbU9Ln1AdIXPHcacUW2H3E2qnufzfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 IA0PR11MB7791.namprd11.prod.outlook.com (2603:10b6:208:401::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 6 Oct
 2026 08:41:31 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0472.015; Tue, 6 Oct 2026
 08:41:31 +0000
Date: Tue, 6 Oct 2026 16:28:24 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
CC: <tony.luck@intel.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <babu.moger@amd.com>, <hongyu.ning@intel.com>,
	<chen.yu@linux.dev>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	"Hongyu Ning" <hongyu.ning@linux.intel.com>
Subject: Re: [PATCH v8 8/9] x86/resctrl: Introduce erdt_cpu_has() and
 erdt_support()
Message-ID: <asSxKAMlbP0ULCAj@chenyu-dev>
References: <cover.1789705667.git.yu.c.chen@intel.com>
 <b279eaa7bf8b3b0b09532e8b184ba4d410eb6f86.1789705667.git.yu.c.chen@intel.com>
 <de9ffda4-c837-4a0b-9468-6cc7b14e0748@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <de9ffda4-c837-4a0b-9468-6cc7b14e0748@intel.com>
X-ClientProxiedBy: TP0P295CA0022.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::18) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|IA0PR11MB7791:EE_
X-MS-Office365-Filtering-Correlation-Id: e51c655c-7e35-427e-4082-08df23859e74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: xVyHpbGegz/AnpUmDP2PBitCJsayd9UAkkpqiVonI/E8d/g30vmA1lx6CBZ0cQVm7c2LVJXkkFD9iUvYrPTS57ppWrmCR/msM6w3alZzq7f1lLNa7ih5/jyirD4ZiXqFfvmdRyg7ibeGlm91Xzb+St+uzoNTjGlXfBbpKqVIyDPpNFgidUriO+CPw+sfe5VyEvvbIaQ8GsjH3GmrWXQZjwxaH/nZ2rRE4uYX1/o67SmPPDSdjTOrekahEudcY0wcmNOFf9Q57oz6sikW4dNRt/FefnP+SXI8/Myq13bv3GXpNrk8DMAziO5ID1UoURZM+mYCFKrbWGZcsjSUQ3Ah4/QrP9EU0IS0BAimsuUOtfOV6U1rQmHqeZdXAov8ZM+dGSneE14D4XE3K1qXwTJTccvK4jShC1k5B1AfKs+M6k+hsAyfp+iyNdxHugnvycuxdgvxLSkegsZ8dUD9zaAH2oDEVDnYrZzVJ8lt+TDDeS6eliSlK/pI2pXFny1obTZHfExEjKI0TYlYKNSV/JuXIniz+rsvnpmeG6O2VmgX1msicWjWkygMl7Ab7SewYSHxnD22uDBkYw4ST9r9WKJMAgqLhG7SMXLT9P/9wWymfCRjlPgfA+XJslKg3J6h3TxPRri1NZxhOP2ss8w0I3+1ID5k47Xm4Md4yl1Bb7GpByE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?erKx2zof92APM8X+Cp5Hfg7vtFWbBLsy5DxkHQFEJxAXVl0L3wdz5j0axCmr?=
 =?us-ascii?Q?qmWymDpCdWBf/Wy3Qxg2HA8nA1AtsCGZ44bnfJv4E45/imiDGVMNoSACbW4m?=
 =?us-ascii?Q?WvKIOwy5eOlJ5k3X3K608l1kbaiZ7iG6ycTn6jxUbcrtoi2UrfWUAEZa6j2a?=
 =?us-ascii?Q?T067H9R4Fn1CPV565y5KW/bjO+Wue/aebg8h9WtgspLM5SpOeNiTG9el/5Al?=
 =?us-ascii?Q?nlCvhFTtYmjo0uDBRalsLVUXQh5vcy4R91by/IIHY+s30osMcXoe+vuTfP3x?=
 =?us-ascii?Q?M2jCdjVuW3nC5xWXwSVkR2DG7QSeDeiXsm/9k6iQXGtOzSldSVpQNIHd5MZl?=
 =?us-ascii?Q?htA+0+42Rp4IvDs1+U8E2KwmVgSPXZGSmiOI+wZU5LCbor+V1lt9Cm6qEZS3?=
 =?us-ascii?Q?QMlINZYA5O0lBDa9sVxTml7AaWCs1N++DEOFvL5+nAfNqa5q7k1hvmSsJDrP?=
 =?us-ascii?Q?PkdOkGK1WYxVtOtqDqCSagB+QLjwjMuNscbBmuy2T5qWU1u9ylI46eY/kb2w?=
 =?us-ascii?Q?T0Hnymd4iAS+swwenB6JSJNAJ+PGWNX94dcfYydCOWGleU0TU7x1r2SXlh7d?=
 =?us-ascii?Q?z/gaXbcUFFayY1NmdrFy4fBJrQTCGcmJg7DgTvAZXpq1W5zUaWWE4h3luS8M?=
 =?us-ascii?Q?oOPNC8VDNzGO6h8dQZGm+9u8ehY1V740gWy7X1IfkHeOX/lcdpePyl4lTZrN?=
 =?us-ascii?Q?B2Av5pbxsGgswRFaxL+PucTFfPi4dAeffXE9+7dhGg2ur9fMKJOn2YFBCXQc?=
 =?us-ascii?Q?krp3LKzy0N/fvsHZ/NvRIAIiYdNSky2A6kGWtNbhIB/zN4qp2LrsN5Pb+3aW?=
 =?us-ascii?Q?Grl/SneN9kiYN7mFEFw67NK1KrJlZznIZTkhqUNuPqR0X1FOmLA41Rivveom?=
 =?us-ascii?Q?8CvFJzMOU2CEJ+/fqcsUf+zq9wFhUhIkYcNvA7DddqFiPmeyAKhfiY9tM/pe?=
 =?us-ascii?Q?kiqrkCGCHzX6Hq3EX3dqjWfGu176UoYGJMbpJokLK7P8Fx0RPGN8Z+EY3NGX?=
 =?us-ascii?Q?m1DpkOxrBpj680EwmaDk3R3VpBXxpsOHTlm19f7Sg85KJtXkLypKSrqoiYm2?=
 =?us-ascii?Q?Fdq1x9txU75OLNiyYNkfD6IoDekT3IQ7/d3vMZJTnal7J4FX7YLskZNMVE1M?=
 =?us-ascii?Q?uRLgMsfdGja7xzGW89qwo7V+SraDPBq9OjJruGGWg2t1sJ2rzrIKB4155WbC?=
 =?us-ascii?Q?Az0o629I4Sx1rBPHcFEM5dtJYfqHnR4bk06CsYVHNUubq5SsV629C1mZsyeU?=
 =?us-ascii?Q?eW7ucwusYhxOrv9fncP+Rw2c7A7/rhmi96USfVqxnre4346kpERcTJ+E7DgA?=
 =?us-ascii?Q?xwq2VtQXLOSRLRg4Rnt/r7rYKGJbuZFXfV5ihQEb+u1uo4T1NvC09tRWHgbE?=
 =?us-ascii?Q?c+YX5i8S5/8qTpBhStREpZWmsyhPmjIj5wYkIvUKJSEeQuTHxA2Mn5MyXsQq?=
 =?us-ascii?Q?c6tG6ug4RDqyqcoDffbpeBF4Wx/7A0QNTwoyzkYf9UaQCtCiImn455OPj3LF?=
 =?us-ascii?Q?Yx4d+5j7Tl1x2EFOiG2UMzQJEQSHNWhjJC/yusAdzKMP5BpG45QhqIfdZ/F7?=
 =?us-ascii?Q?U8fH6SUmMV3jq/z52l9W56OJrww9UnrlnbvIjNKPoLMa3iD7qSGheBdPpzxe?=
 =?us-ascii?Q?t81bgkcstFR2elkrAHwq3+Ooez5ZLqKXR66Mhz8USJjKG7FqJ8iumfD3tX/E?=
 =?us-ascii?Q?ldyxNWCNVSFuVaxi+SMTqLKhVaE9xtym76fLQbCeNBrsWdyh9vCYEnSrcV6f?=
 =?us-ascii?Q?HLuePXBa1A=3D=3D?=
X-Exchange-RoutingPolicyChecked: PfmMeB/SkGznBipd3RbUAOyF3EUqu5CW64STCG0hIZS+lt5hkoDrWcZ3lFF7g7toG9Or6anTKLjej8vP1oK92GgmsOlwG1fIXHI55QYAhWeGSED4UlT0mJ1xdytwK/GjXgTaUiskz4q/GdYpeSfsMGnFsxSlaRsZuSApAIRNTt9k9djIg3ygouFnymDrOQhSyGuQNnsD5jwtDAQoeQJDWpkolHMh/zeZSQSVja6kSTxXz8K8T6exnoIFCJVM5zmEj320SUNUSIXRsvV3Kx/gHQSfPDluoz5xttiajkLgU66qjy45apgRvh9lhLS+mQ5HBLQHqhdF9yUtxGTwLQly+w==
X-MS-Exchange-CrossTenant-Network-Message-Id: e51c655c-7e35-427e-4082-08df23859e74
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 08:41:30.9196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSZmc14/eLRrG+wS0R5FiWgOnoNDjPhj79ZfDLUXUUG64gB1qsJyya5C5q2stCTm0NT46ZmxB2g5JIPnYvV0lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7791
X-OriginatorOrg: intel.com

[Resending, as the previous one does not seem to have reached the LKML.]

Hi Reinette,

On Mon, Sep 28, 2026 at 02:49:36PM -0700, Reinette Chatre wrote:
> Hi Chenyu,
> 
> On 9/17/26 9:51 PM, Chen Yu wrote:
> > Introduce erdt_cpu_has() to verify if a specific RDT feature is backed by an
> > ERDT table. erdt_cpu_has() is derived from rdt_cpu_has(), which not only
> 
> "is derived from" - needs imperative
>

OK, will fix this.

> > considers firmware (ERDT table and its sub-tables) support for a feature, but
> 
> "rdt_cpu_has(), which not only considers firmware (ERDT table ..." reads as though
> rdt_cpu_has() considers ERDT, but it does not?
>

It does not. I intended to say that erdt_cpu_has() not only... but also...
Let me fix this description.

> > diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
> > index 9a32ed418c33..bcfcc8ac1fe6 100644
> > --- a/arch/x86/include/asm/resctrl.h
> > +++ b/arch/x86/include/asm/resctrl.h
> > @@ -49,6 +49,7 @@ DECLARE_STATIC_KEY_FALSE(rdt_enable_key);
> >  DECLARE_STATIC_KEY_FALSE(rdt_alloc_enable_key);
> >  DECLARE_STATIC_KEY_FALSE(rdt_mon_enable_key);
> >  
> > +bool erdt_cpu_has(int flag);
> >  unsigned int erdt_get_scale(void);
> 
> Same comment as earlier in response to the erdt_get_scale() prototype
> addition.
>

OK, will move them to include/linux/resctrl.h

> > +bool erdt_cpu_has(int flag)
> > +{
> > +	struct rdt_options *o;
> > +	bool ret;
> > +
> > +	ret = erdt_support(flag);
> > +
> > +	if (!ret)
> > +		return ret;
> > +
> > +	for (o = rdt_options; o < &rdt_options[NUM_RDT_OPTIONS]; o++) {
> > +		if (flag == o->flag) {
> > +			if (o->force_off)
> > +				ret = false;
> > +			if (o->force_on)
> > +				ret = true;
> > +			break;
> > +		}
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> 
> erdt_cpu_has() is practically identical to rdt_cpu_has() just above it. how about
> something like:
> 
> 	static bool apply_rdt_options(int flag, bool ret)
> 	{
> 		struct rdt_options *o;
> 
> 		for (o = rdt_options; o < &rdt_options[NUM_RDT_OPTIONS]; o++) {
> 			...
> 	}
> 
> 	bool rdt_cpu_has(int flag)
> 	{
> 		return apply_rdt_options(flag, boot_cpu_has(flag));
> 	}
> 
> 	bool erdt_cpu_has(int flag)
> 	{
> 		return apply_rdt_options(flag, erdt_support(flag));
> 	}
>

Yes, this will remove the duplicated code, I'll change it in next
version.

thanks,
Chenyu
