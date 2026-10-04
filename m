Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF4972602
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 04:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791089299; cv=fail; b=IXbdysUH3Hwib/4yZf9OBF7ZZTYtx3iAqK/UXpZz+GtOmzK3i2wLhWlRQz5XA5rV8HNSWW7thOsYQoJfhBW1lElmhcivCl8Ux8F16PMrMLlRG3BJ27voS2AUgfO0V8LL/gGjuYt27uMRDT+HsDB+5Dc4rDpeAl2nPeIpWprqt2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791089299; c=relaxed/simple;
	bh=lFeksZEm75k3Nx9TX3W7Z4VWkepwrWHuloYtp6w/zh4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sFhtqnDrwldN9FIwXDy855IE4opya2bY3xDjwf0ei8lAC9aKQMsBVXoCivii2mb4L4Y8JDx0hjQuKlHx17dsG8mK0L+Q8Y1MuHTLDpc6ORUCtD9oLnBZG08sQId1c+G+7a91S5GojL2zOoV04zRXBiokspZuqpJS2kf8fKfl6Q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHhVD+EA; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHhVD+EA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791089297; x=1822625297;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=lFeksZEm75k3Nx9TX3W7Z4VWkepwrWHuloYtp6w/zh4=;
  b=kHhVD+EAfKO1x2r+PX+SBMjwpuHLqORHfERvtyU6RWJxjIqo5ZhWnQk7
   cSfHJXWFWcT2isw7KOyYN9bJfrTkY94RNOSD6WlKOZzGryYh7YYkxH16w
   M5AqKRpmNwCNmiaBCYF3sc1sFP3yi9OEYLnB9PYcZHYtNx7UIOgLdz/Pr
   LibK06WtX7zv3EFR4/4ney+P1pbh09rcTfgw0b7DXtfu2GvFG1i8dcDaz
   Hdyh30Y+HIpsnaatpIyRJ+o89IC5HgUI9NwNdmlAjDgAwTTlvzHBM2EEv
   rn9U0PuAXOzaiCp3SIO7hmK6X9yewXkKoUIY2Jz80lPv0wNLYlRKSAXx+
   A==;
X-CSE-ConnectionGUID: 9XawJSyKQ3e5LRyAnz5aow==
X-CSE-MsgGUID: 3wq5djCJRROxAAbQkfLGvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="108174029"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="108174029"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 21:48:17 -0700
X-CSE-ConnectionGUID: n+TGhYtrR1KUkl2FhHqf0w==
X-CSE-MsgGUID: v1cnRTMeQoa3c3Qr/TPjxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="276620791"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 21:48:16 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 21:48:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sat, 3 Oct 2026 21:48:16 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.12)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 21:48:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f7wp6XqCBWFpIiKxxLnD6JVH8cuoP0gEUq73Wgw7cyc4IHePlPnzTwIUONbVt+82Dnag8SLprC+Fafr5nmNUKH33nmslmtNtRbobMCimHrQsxnZYsg56oaQPwFSIIW34H0CpIB05z9Tf9btUCXXdECXO9tl2Rl31/PcC2jNRD+ie2dSNKqF8nbaxosN1cSwFrshrCxnPBUqReGSQwGB+ablP/hrt7kGP+jDfYcyXngCR7L9Ny5eiIB0f+4HCVvmUfrhBCKWZTqNOHHTrculfD3VBUbZ9wkCBaenRL3rluSWALIRkL5AXknjMYy1EhhzpXGklHUmUxnEyb9+b2R/6rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFGZG80hGP4kgEjhb6Nuy3V5nkCxSN7U2OmXrbfCL+A=;
 b=DMclIocyrHxD7J7maEWwJIMLb/UNjGIF+BCVP0KUnMJuYmMVf/fdTBL62pFl7U4ph2VpHey9NIkgmWOocmXSFNFA3k92hPdDHoRBt3xh5I9Cx5dA6+D8BvTIYVV7VfseSTAciVZc6j4UCOszjKX6STfETwpJfPp/ojEQiT61LjdHAZ0IEFks/ZSJ3LTLMuGlI2RBLIkhLyjX9hHi7wjEiCh5a98qfS1cUb4RPCutmr5boicpG4vn4+YGOKhL4fO6TF8SozFiKmMpMN/wJsEMKfnJmscEt9YmvD2wbV35pf0+LQOegRPW6AlOlfWceSoeU+b7+j8emEA/+lI+jLQ9vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 IA0PR11MB7789.namprd11.prod.outlook.com (2603:10b6:208:400::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Sun, 4 Oct
 2026 04:48:07 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0472.015; Sun, 4 Oct 2026
 04:48:06 +0000
Date: Sun, 4 Oct 2026 12:34:58 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
CC: <tony.luck@intel.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <babu.moger@amd.com>, <hongyu.ning@intel.com>,
	<chen.yu@linux.dev>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	"Hongyu Ning" <hongyu.ning@linux.intel.com>
Subject: Re: [PATCH v8 5/9] x86/resctrl: Parse ACPI CMRC table
Message-ID: <asHXcgv80IIA1TzL@chenyu-dev>
References: <cover.1789705667.git.yu.c.chen@intel.com>
 <51bf1ffbd3a6efe53dc457f32b0863cc6aff0e3f.1789705667.git.yu.c.chen@intel.com>
 <fcab8cf3-b5d6-4d67-86d6-b8d9f9092fbf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fcab8cf3-b5d6-4d67-86d6-b8d9f9092fbf@intel.com>
X-ClientProxiedBy: TP0P295CA0050.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:3::6)
 To DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|IA0PR11MB7789:EE_
X-MS-Office365-Filtering-Correlation-Id: e9c6a375-1f04-4202-8fdf-08df21d2ae30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|56012099006|22082099003|18002099003|10067099003|6133799003|4143699003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: XaGQozTVt2sU861IRxvHX7ZNT/A49LAYYT4mhkNrFsukHnWiLa1WtfEJwpk2UrEckSI9sbQMqAeYOGdTpQvVeLzuXjYawROkLQUdwnoiF8+dqYOMavhyBlVwJHUtx79gAPmjIYBt/6v205XO7z0utLnTN5dkdwBO2QacmK8aIelKg2cy2Rbpj78uVW4fCg+d7HDDm+otMccMUB6nCEdrF7yr5npRt/XbclfDl9gwfmgw83aQ+M1orBYXJnGnjOefjbv3hChdPb5zvtueUqV1OeL/NpGhbP2+nJMGFI/0R7brqZDO3IEeN3+VBvGLHRyKbptGWzMCaiSFVvHKhlS5nWTRXX/ZHUpze05nCJUxLWZTf6Fi41gpxETTQWDdtuICloGrBCTuL5tEWBsZpOoh9oaPal3VMxdj7NkesOTSwrbU3ECLwdZR2nMBZovDkr0R2zTHiTpWKt/AQi2S5iM7yBpKXjPvEYRx7f4KAbdgC/s2zKdzZ49OnBavD/RRvujFqPpqx5TQfJKalXhxJ0jhYbqDS0/B7iDCrYJpNqmGFce2NYElOlF4jmf2nRzoUjSsXpxNJhhMRQObfVfPNMUrbAd77NzUpHMCiAoNezbxzf5vTYb3UCxvWyIR0xa4tIbh0qq18mC2vrDBNPofoq91lcB8xB+U9gTAdrOt3tXmUyE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(56012099006)(22082099003)(18002099003)(10067099003)(6133799003)(4143699003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H0QZ9jys6USQ6oRnJU0o7DfK15Ycr/oV2Q59dDNQftJLXNl8VMlnR+S47ISA?=
 =?us-ascii?Q?NeWlduYgqa88bTLA2SbnrbT6wItcqno2AZQUwVR3r7AROxHCBCp1TELmXJ0/?=
 =?us-ascii?Q?yca8Unva6Zx6uiuOACaKZ9+k4rpQNAy3wTZcSrJrxHqi7iy9FFcWkGFv9QaP?=
 =?us-ascii?Q?AgAtNC9TzKbkRyXMhLEmXrRLpOHq7TWFAOddUI9gXvfP8aRMjJxAm56Gs1Lu?=
 =?us-ascii?Q?j4mgzdZwp7nMFJWgP+n6FII0manemTJDbgX70xbLFHhnrt6dZZlhneE5xjJW?=
 =?us-ascii?Q?XKi1ewQIGcphMAFEZSIC8uuNnz8OfLGoNcFGnONFtZ2QclomC3h95DV58Hkx?=
 =?us-ascii?Q?7jyaIvDlkPTLs30xJSDMQp0BRvbyH/R7AsS0i7WbiZxiH1QBhGrzJQW06wOC?=
 =?us-ascii?Q?YOXtct3y7GW/n7f5D0trRLSalSyWjof0CHayz39sAiuGzHjE5484TNv2rzwm?=
 =?us-ascii?Q?JBqiSV9N1seABp5Z+K8sA+7zHZzpMRBuW9Zq8W+d0Kg3F19iIIkZ4nunW77U?=
 =?us-ascii?Q?zfjruOF2F6E2stjUXw47+R7KWu+tHDXUbDNcnj7wVpPoNH7UALl+IDhTmQti?=
 =?us-ascii?Q?0pIW1Uy2OJP1MLxAVgsYmuFM2z5+z+oHup57odvkxKGdNPMCPThXKSKojnQ+?=
 =?us-ascii?Q?91ZxGcfLOWqWA+BSHRDvTIHVUo5g6HTd790t9KgyJPX0xMrZYkrZ/UmAZs9C?=
 =?us-ascii?Q?P5rMIhfEq9RLe0vh4WrwmPfeAveMpt7WAoxe8wvQPYyu9JCaYGoKMs+QnWtX?=
 =?us-ascii?Q?CH0DTpFSpHXH7OaZ60rhB7UTz3OQgQa1xM8nxLfkjpCfRjF2gUjBV51dBuYd?=
 =?us-ascii?Q?/An3enhr67wusdSS+tXMffcH9n4RLaGIA1z/NGHq58I6em2EJ9t0/bwUcePc?=
 =?us-ascii?Q?Wiiiar/N8xWtB0e61ukPSgCPe9U/1RCSWmeScwPJQ6hbMtbFw6woTq3lGH0U?=
 =?us-ascii?Q?rhMUT5dEYQgl5cq2WgOyh+5EI6jJwjqTolUcy6jqjVpK9+NSYq6hyRUFKn3r?=
 =?us-ascii?Q?FSjVDll87KJS5+c+WCHve4cZwmm0YTo0FVFTAF3lnY3Bh1PHMaDkJQYSy1aa?=
 =?us-ascii?Q?CFRxTy5wgFBTzTNJlzXBH7f5ImJ0yr4+wnev5tiDk/GjWq8h+DO3z0bgnFmz?=
 =?us-ascii?Q?udVdQkZDlluto7Q9aHQtBUC0HZbAc+VQwnORASpFiCO5Op7XhQKW3kEFIzlu?=
 =?us-ascii?Q?glhzaD+iaOhjI0i611T7p96UHsiDrKpL7ilVgUTGiH7qSoiY1eoSM/aJpC0F?=
 =?us-ascii?Q?PHIPxK1eKQMvBqIaqQnuJmt+yqEd62trmuObPpjes1qkToRkWbkIOkU1aRVm?=
 =?us-ascii?Q?dFV2iysMgqMprQOabI4W9iyS1kwQ2PM/VbwLtAFe+Iag0n8NxaGzi0HfMXqy?=
 =?us-ascii?Q?wXofKiZOvDKPALuX7SnFGyfQbrtUjP0kSHMGdI58kyLM2fPT6cOi6Ycb+KlS?=
 =?us-ascii?Q?cBnGDTer/AVCQZpjwrGmxrGdvJo3VI9gTtrfYcZPu0zDpDjm+zuwqNO6RGIY?=
 =?us-ascii?Q?oun+y2tMWLkd90zc4DHbnoWdg34ZynY5ZgajGcylOyrmx4W3/lI3ieK3xjnN?=
 =?us-ascii?Q?ujbLQE5/ncyH/LXYg38wBg7x9e0pWLUQOYhgclin5Icch7UqW9/zDCDBnq6x?=
 =?us-ascii?Q?ZGVzlrYQOlub1mOliNqsekcxLlmm0D1KaOF52vxAlbk6ts6IhfdbRboMtn4y?=
 =?us-ascii?Q?miP8wPekkaQ2nwvyMA5kerz3lOCxkTnFjuGD2UF6udL/g4MGSOg69xA8Fduy?=
 =?us-ascii?Q?rjQbKgM6VQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: YM20YffzxZ8v2cE0PfobDqmGp2vr57GgeF2uu0d3NxDNbXQwACy5kEsoHFFjxJC6L6ZT9cs7HEyCYVPfZ+p3MvSl18YjYAkdW+X1F1AqPU6sP2pBAMp4dvmGbrKS/SRS2pshnlChWxM2SbCHGfz94wAKyo4gHy7UVrJKeY9Bdi6bvQK+PHtyKfvv2v6yGK70iOY1EJqgY2XyS0PgbNRsDqPJJgzrYOIh1Lc9+XYxwTg2EmmUpV66gEFBuDKK0G44m6e5vQSPSFDyRB8MP+UX67xMCpu6DxpazWsy3PCYTtj5gqKvFFJcCJa7tyIZToV38vcTAYn1U1pmNqGYNSD72A==
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c6a375-1f04-4202-8fdf-08df21d2ae30
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 04:48:06.2435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GSy02ororwKJVmsCob2/w5rDcEkix/zVlMt2J8M8BNukWCjYVi5o0zXjrNX7NHsptgsjqtB/Ej65Wlk+l2BagA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7789
X-OriginatorOrg: intel.com

Hi Reinette,

On Mon, Sep 28, 2026 at 02:46:32PM -0700, Reinette Chatre wrote:
> Hi Chenyu,
> 
> On 9/17/26 9:50 PM, Chen Yu wrote:
> > diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
> > index 8f6edcdcfd87..9a32ed418c33 100644
> > --- a/arch/x86/include/asm/resctrl.h
> > +++ b/arch/x86/include/asm/resctrl.h
> > @@ -49,6 +49,8 @@ DECLARE_STATIC_KEY_FALSE(rdt_enable_key);
> >  DECLARE_STATIC_KEY_FALSE(rdt_alloc_enable_key);
> >  DECLARE_STATIC_KEY_FALSE(rdt_mon_enable_key);
> >  
> > +unsigned int erdt_get_scale(void);
> > +
> 
> Adding this prototype to asm header file seems out of place. One needs to look
> at later patches to learn this is because of upcoming use in
> resctrl_arch_round_mon_val(). Beyond that, resctrl_arch_round_mon_val() also
> later needs erdt_cpu_has() that even more looks like the wrong thing to do
> when it comes to the asm header file.
> 
> resctrl_arch_round_mon_val() is used in two places, during system initialization
> and when user space updates resctrl_rmid_realloc_threshold via a write to
> "max_threshold_occupancy". Neither is a hot path requiring this to be inline
> code. 
> 
> Aiming to keep resctrl_arch_round_mon_val() as an inline function is causing this
> ERDT support to be unnecessarily fragmented. Could you please add a preparatory
> patch that moves resctrl_arch_round_mon_val() to a c file and add its prototype
> to include/linux/resctrl.h? This means that a change to MPAM driver is also needed
> that I do not expect objection against. To make this easier it would help to
> place the stub among the more stable resctrl_arch_* calls in MPAM driver.
>

Got it, thanks for providing this detailed information. Let me make this change.

> >  static inline bool resctrl_arch_alloc_capable(void)
> >  {
> >  	return rdt_alloc_capable;
> > diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
> > index 249ba547d7c8..a8a7417c2f82 100644
> > --- a/arch/x86/kernel/cpu/resctrl/erdt.c
> > +++ b/arch/x86/kernel/cpu/resctrl/erdt.c
> > @@ -23,6 +23,7 @@ static LIST_HEAD(domain_info_list);
> >  static bool erdt_enabled;
> >  
> >  #define ERDT_VALID_VERSION		1
> > +#define CMRC_SUPPORTED_INDEX_FN		1
> >  #define RMDD_FLAG_CPU_L3_DOMAIN		BIT(0)
> >  
> >  /* Bitmask of valid sub-tables found in the first RMDD, used to ensure all RMDDs match. */
> > @@ -37,11 +38,26 @@ static u16 first_rmdd_domain_id;
> >   */
> >  static unsigned int erdt_max_rmid;
> >  
> > +/*
> > + * Used only by the limbo handler to round resctrl_rmid_realloc_threshold.
> 
> This implies erdt_scale is used by limbo handler but limbo handler only uses
> resctrl_rmid_realloc_threshold directly, no?
> 

Right, limbo handler only uses resctrl_rmid_realloc_threshold, which is
rounded by legacy/erdt_get_scale(). Let me revise this comment.

> > + * resctrl_rmid_realloc_threshold is a single global value, and
> > + * resctrl_arch_round_mon_val() takes no domain argument, so a single scale has
> > + * to be derived from the per-domain cmrc->up_scale. max() is chosen because the
> 
> This does not sound right. Using the fact that a function does not take an argument as
> a motivation just makes one wonder why the function cannot just be changed?
> 
> "resctrl_rmid_realloc_threshold is a single global value" is accurate and the reason
> why it needs to stay that way is because it is exposed to user space as such. That
> was done before RDT introduced per domain scaling. If keeping it a global is ok for
> ERDT then please highlight this, otherwise resctrl needs an enhancement.
> 

It is OK for ERDT to use the global scale factor, let me revise the
commit log as well as the comment.

> Apart from above it looks like introduction of erdt_scale and erdt_get_scale() would
> benefit from a separate commit. The comment above clearly notes its complexity but
> there is no mention of it in changelog. 
>

OK, let me split this change into a new patch and add a corresponding description
in the commit log as well.

> > + * rounding is a floor: a larger scale yields a slightly lower threshold, i.e. an
> > + * RMID has to drop to a slightly lower occupancy before it is reused.
> > + */

[ ... ]

> > +static __init int cmrc_init(struct acpi_subtbl_hdr_16 *subtbl,
> > +			    struct erdt_domain_info *domain_info)
> 
> Same comment as for cacd_init().
>

OK, will convert the return value to bool.

> >  static inline struct acpi_subtbl_hdr_16 *rmdd_subtbl(struct acpi_erdt_rmdd *rmdd)
> >  {
> >  	return (void *)rmdd + sizeof(*rmdd);
> > @@ -170,6 +230,19 @@ static __init bool parse_rmdd_table(struct acpi_subtbl_hdr_16 *rmdd_hdr)
> >  
> >  			subtbl_mask |= BIT(ACPI_ERDT_TYPE_CACD);
> >  			break;
> > +		case ACPI_ERDT_TYPE_CMRC:
> > +			/*
> > +			 * Only one CMRC is supported per domain as there is no
> > +			 * method to distinguish different CMRCs within a domain.
> > +			 */
> 
> Please note how this comment style is different from comment used to describe parsing
> of other RMDD sub-tables (before or after "case"). Please stick one style and use it
> consistently.
>

OK, it is one single-line comment above the case, the other a multi-line block inside the
case body. I'll standardize them for consistency.

thanks,
Chenyu
