Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2933254A0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354984; cv=fail; b=IjSfUDpLmb7RYItaw80ar2JLGWfCGQg14cxDWAjnWHHTdwVRInGVvu5TkPkpR0hggCJpJxuIcHThFq3U2wu49OW/w1sACBt8tSP+AqOVheML3agCgTbIb+dI5/a+eEDMSYfcFhTyQvTJBHtV79s4rQLBIQlw4OY24XCZDBoNB3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354984; c=relaxed/simple;
	bh=yj5LFeAu9Nx6YP21YBk8AIqPg5n95z/xE7AB70KxICk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JP0CB1rw13tKqIheL3sUAb16234Hp7jjVd03Kl0kDctXnXiQ9/nz2RcZFh1a7LA5WCsEA8rvhH93LFULDo3FPF+L3HTYg2shrb4f3eQD0RTBArSQYw0qtIpObQobwm9mW0lx5mmfDSyWrH8G1nToTnnidTxoTncifulH58iBZaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cNpThPv3; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cNpThPv3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789354983; x=1820890983;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=yj5LFeAu9Nx6YP21YBk8AIqPg5n95z/xE7AB70KxICk=;
  b=cNpThPv31jiX1fj0K+HjX+Psk+QQVXbfx6guSXY49WJjF5hf+9HwuXgM
   VsOQ9/OClqV//82oFL6k2wQIuI37JnscWMxDsPz/ZYrBINYPRu3YyCgR8
   zTSWF0FRiXpZS502nZwQ1MacOrgtW5cUyzVkiN97OFlSH61wi9LK2YtPI
   MgFxD440SnVYGyB9IV30QJV7MZz0pC+mJFzfKMgloqPhxIgQqnelGkchq
   8r42gvVt6ouZwPdgo/a1a8MFYSJMJhC6tPXA6KEOXSzjQiSN7T4kQ+FQd
   a8hqR/wA0t0giVE9xsFtBvZJCXzrPQm6e2ARSYwN9VK540nFk+spt58KO
   g==;
X-CSE-ConnectionGUID: u6X863i9QnSeHCzXWW8B0w==
X-CSE-MsgGUID: VhWr/E7VTYqHnjZ+kl6lqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="92218863"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="92218863"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 20:03:02 -0700
X-CSE-ConnectionGUID: eKMZMHdFTWGHZms+UOkXcg==
X-CSE-MsgGUID: oOZlBoaLTJOnpybyLS9YJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="270722513"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 20:03:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 13 Sep 2026 20:03:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 13 Sep 2026 20:03:01 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.32) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 13 Sep 2026 20:02:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0KX8clo0MwHhLWHZGHa1IsBNFdKtpUI6TW06B0ENxcxf/248UR9clTA3VB5B96DyhyJtD4sS7U9S9HURLr1bi73MKb64j14iy2E6oFYuv3UFrakUDLsxRYL60SJKH6bOUTiznFmLcfFsYxTjJLTEkpxyFlzH3SYzKOINPvqkvgYgZLbi0xpvBwDNFga6u2H4Qxu9WEVbuwJGYxKC7EwGJLjjYOJrD5TpMfzxRv6z8LcOil8gIwgKyxW+f41R9kgx8DRBHQNX/QeB+B5W7szeYoQFifplUNKEYjvFFzXfW4Fu5hlyUeYV0ZrZVSXTtJDIYeiTJ/pl8KMGQrX+L4wGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lh1sGVPDFdze1JxAytvDi0zNkOUXJFD6qiC8G1LwN9M=;
 b=mm7xXl27QgBD6jFvfMBQWwJQa+FFRvSEAuJ+Dclatkk6mc59nRN6G8pOubV52ZzoM/Ypu+IkplD30exi+kHyOBaVCFR6oAqHoufXNvAqhXFrH9nnWiY9urWhIpxbvliike+7pEjhP79a0C348AZ1BsR9VMOUY6+QJQwtCQOAo848FqxmwAuN1IV23hJ9YLcOkf2X2vDv3GHm4hEkaQwXu6zDNN1sWXhaQmEWzEFhwa55v/MrHCbRQqEi9/v81VBJE9UXNdJO0U8t/krqvlaCk0pgUb70brZiOmlxYveqxTgsX65pz6asZM+FYKbcIyjqlxAG1TPCbMZM8AkfHaIKdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SN7PR11MB8281.namprd11.prod.outlook.com (2603:10b6:806:26b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 03:02:51 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 03:02:51 +0000
Date: Mon, 14 Sep 2026 10:49:28 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
CC: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, "Thomas
 Gleixner" <tglx@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Newman <peternewman@google.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dave Martin
	<Dave.Martin@arm.com>, Ben Horgan <ben.horgan@arm.com>, James Morse
	<james.morse@arm.com>, Babu Moger <babu.moger@amd.com>, Drew Fustini
	<fustini@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>, "chen.yu@linux.dev"
	<chen.yu@linux.dev>
Subject: Re: [RFC v2] arm,x86,fs/resctrl: Generic schema description Proof of
 Concept
Message-ID: <aqdguFLXpds-FrEW@chenyu-dev>
References: <d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com>
 <9e38f138-7872-445d-9a11-105f9d0fa4d0@intel.com>
 <07a79f5f-ad39-447d-b43d-01e44c7870a2@intel.com>
 <e859ba7a-d488-4c35-b0e2-fc88cdb34f29@intel.com>
 <ef14b978-1b58-446f-b07a-691422220cb8@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ef14b978-1b58-446f-b07a-691422220cb8@intel.com>
X-ClientProxiedBy: TPYP295CA0030.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::16) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SN7PR11MB8281:EE_
X-MS-Office365-Filtering-Correlation-Id: f65e1e25-9fbb-481f-6cde-08df120caa32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|10067099003|11063799006|4143699003|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: Qb/CLSHaaHdYeQL7vODL80tSGADz5mqpqGwmVR4OcSSRTBpGbdaIMfsy6p3L9o9RrNjlrzBEJ0DK3RVY+zblyxfCbzc1k9ZN8WmLy3WUEewMNEMHkJw94DuIAJTqz4wTYWeF8V5V6l6w5Wjy492hS2pxufwxuT1dUtrSn51YYOuqCt+kr8tyvmKOQ7W+8XLgb08IbIiG882CfIzE11Bc/CVo9H2ZCwfu3fkgHPXFkWUDF0V78aOsb575n40DBHnq4Ol5qPQ0v51MT6KeUHjFW0LT6PRmJZJLckdfPUD2HPAbzjDfX+aumZZcE6iHRB58DqsTg4yKuU6lzwCo26IzAJ5mTogUmMvLDsNBGrRa6frTcaX/Ot9Nnk9yQSmorIVyTfoI7GD6IfS3rBhgclqzEsL+UHfaK5KBH+tzolu2SezUNw/MsiIIiSfr18fwo4o8amb3vedDX058XPlh8PXsXzXrJrLglcnDPn//bPpG25Vck9Q8bLj53yKXIkfcsa1tlGnRHDmeynEgzrZhafgBYiGCaQeYm17CdoJWH9NeLeHo8JjzQuU1H8JlaZ8FA7RIgF5ctWpc/fHV5Axo5dl1wIMclwi4bi7aRZjmWyH79e1FDEz37Jznyvguzn70f6UD9qrTj92nGJqSMvc41dj48L7ZbCQ5TxM04/A3S9ixlz8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(10067099003)(11063799006)(4143699003)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tgh2CyGL1cRpJSjrzFOYEl5c0CxYaVUH8ggplCNpFlg+OyGtTDwhTaKKk/Lg?=
 =?us-ascii?Q?7m4aWmLJE3LadSGbfDyndk6zh46Lk++Ltxy9nqUXhzeKy1Ss3zFm1BUxqh3C?=
 =?us-ascii?Q?//tyAh2zNEQm6QQGwgE5EzueFlBk60rgYJCbXPxoyLOnLVdiaP3nDlivP17y?=
 =?us-ascii?Q?QE/aB2jENY09Vsf/ej/apHBwPisPXLtwErxnDhBmdSy6gmbSyO+H6M7RE/ed?=
 =?us-ascii?Q?uuQVTctIWMLhrN+rZKEuHkncaYhh0gsJKY5GCETRKfwsbRc6StxvdWZKGiIZ?=
 =?us-ascii?Q?N0Mxgn6OOarTLS20G0o9NGNCim7Thfip2pILfKA1hp4MTTVF1pFB6XwCbRPP?=
 =?us-ascii?Q?SfLCYBloSK4s98oVti6LpbR/c2uuBK+zNqdLlQhuDuZW2I6W6sOeNa2GfJn/?=
 =?us-ascii?Q?F6znu881y9UalzzVjZHX/OsyG5yUl7qQbqIdIWE9XtjGSc/MLuFJUklXL9/n?=
 =?us-ascii?Q?R7lCzCXURM8lspbr6bNHAqA0YFAPAphkdwa5NTzCy/XbnDU/FUJ+wKc4YhXr?=
 =?us-ascii?Q?AShaqVe4tbGig+ZV9IZ+Izcrb6gazXhv/dNq+uwcNbF8CpXFzSkWW3upPhiS?=
 =?us-ascii?Q?gaWHCO2NzO38DEdK8dCMrhZojA+yhEBoKm8Axzv7URHXxcJzDAAB15Rfk3Qw?=
 =?us-ascii?Q?QHAE42Mb2kOKWeE4IsWAc6O9I0I0NZnj/RnAziMDuVbFMTsQ1ZCyaQyCoMLL?=
 =?us-ascii?Q?eMsk8+J0d2lp7xTFYd4A7BtxdoHROQj/SddKcz/7fXSGPWtRgYI6nQ5MU0yD?=
 =?us-ascii?Q?BEJzAHJJxWA8jWE766myMn5x3MNH2RoksaYb2r4raC6I1myKKyfldUYU9uCE?=
 =?us-ascii?Q?O8JTBsQMCE2EYxRixH4UP20dl9nBB50IfzNrACruF6x0L78tULHtlZoyltb/?=
 =?us-ascii?Q?/mYm1ZcMSQjoybJG7n5CQDw62Hl88LwhGBT6tAo/XxxeI3poSkzU9XMNunbJ?=
 =?us-ascii?Q?LCvP9B+6gT5h2dTh0S1Mlg5tzOOvV8BU1XTK9FIhl2jE5J6Uv+Mp9GoXrrjq?=
 =?us-ascii?Q?+on6a9GAZdxD2x2deYtYuwzQw/BrH8o/ZW+HflH9RnNWNYOB0gWhvbzrwk9Z?=
 =?us-ascii?Q?Z+5EW6WOk9bhg6ED15GETeL8nfzMSf5t83xnhME2mHtCkxYVVrqgsCNZPC92?=
 =?us-ascii?Q?PLS7fwd5hQrXg0lc1v4Vr+83lMzPPR4E0j3YO2QTfg/n4f/ekV5ODMMWLpG6?=
 =?us-ascii?Q?48TRDHXdicGdBRtMInBpLCnxkRdmy6H6TWH7iTbKG5pATCyak33OOVxQH+kn?=
 =?us-ascii?Q?ldD9k0/OKH6YZn1fKnDfye7p7nxhh27koqMln+YhyypPUSc2QOruK9hwSPRv?=
 =?us-ascii?Q?0j2ZjwOAEzL5+FshmE1pFEDwfqvx6mzRRlAblzkbLAFiqJkNVgdcreemVPkj?=
 =?us-ascii?Q?2dX2OJh5/JQd/coFB26LSpYz88i9B7CdxDIE8/bbp13SWWbWvqNXe+8u3CcZ?=
 =?us-ascii?Q?ui7Wq3RdnozwkEk+i1raNSAi/jIaZHLPGkFZKxao1nPN62IdEtJOU8H+JuUc?=
 =?us-ascii?Q?f6r/CpDPhkBbfmH30hVlsBql+KzMNwVDfc+Eeq0jEIU5Twb8t84bFFkmyRth?=
 =?us-ascii?Q?XtWKmk2zQjOQcZ/604mfFdu5MbWTqqeg5953iCO3tQxytQ/UZw/QjsnuHKLB?=
 =?us-ascii?Q?WPhZSa2ziBhxls8CpBtaeLKq70fhmMJtZ0fL6pdsPOoeoBC31V+x5Gf4knmv?=
 =?us-ascii?Q?yessu3f+oe8POFVn/NVxEHlRXiBp0f4j+/ORmVCGeh9ipCv2OTBmcZdXeWkc?=
 =?us-ascii?Q?4EQp+ufsSg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 0UQ2qxjExVH+N7HW08Ehzg/PqXVL6p8se1HWuT84HHcEPMKxXHvIdfhXpBBtHM1ZjgWL4Z8UXv+3cEXyDRwC3xtAHFg25ZG4QN3JlCvxBJoFVOwdmVzK344HIm8pHvnEEDMKPkXaMAkEBqA6OvEsoWPm6Ba0VCwcnTIG/h1yCIczbasnayZeWKwCXE/ZntBfDel6bxtmCu/MTWoPagaSpqkJK1ZQ2nxWOUKkAPxk+etzBqoNzTnqKPrHZPUjpYe9YySAfvM/YybKzxTI5frcifSIK935zAk/mK2DGqntSQQ+JZIef+mdjSGWgzkI71V8ldWVZhTJE3U6qrweUi6/WA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f65e1e25-9fbb-481f-6cde-08df120caa32
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 03:02:51.8017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mt4OpRWvZn/L0S15aItiwFYRXXJ09NteaaX2Cvl6oc4V5XNQOSoSk+UCQqwXeJfto2ThEzx8JPvwbkZmTXZAPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8281
X-OriginatorOrg: intel.com

Hi Reinette,

On Mon, Aug 10, 2026 at 11:09:31AM -0700, Reinette Chatre wrote:
> 
> From user space view "legacy" is the existing percentage based MB control
> that user space has been using until now. The only way to support this "legacy"
> user interface with region-aware hardware is to use the MSR interface, no?
> User space does not care whether the hardware uses MSR or MMIO, it just uses
> the MB interface.
> That is, as you also say, until it is possible to map legacy control value to
> region-aware control value at which point the MMIO interface can be used and
> user space can continue to use the MB control without interruption.
>

While looking at the context of control_mode under the info directory, it is
currently used only for the controller to switch between "legacy" and "native".
However, there is also an explicit requirement for the MBM to switch between
"legacy" and "native" TOGETHER with the MBA.

According to the RDT spec 6.1.3.1 RDT Control Register for CPU Agents,
it discourages mixing legacy MSR for MBM with region aware MBA:
"It is recommended that software use Region Aware MBM when Region Aware
MBA is enabled and vice versa. Mixed mode use (e.g, legacy MSR
interfaces for MBM with Region Aware MBA or vice versa) is not
supported and may lead to inconsistent behavior"

That is to say, I'm trying to add logic in the code so that, if control_mode
has switched, the corresponding "mode" for MBM will also be adjusted to the
same mode. The code can enable/create both legacy MBM events/sysfs and region-aware
MBM events/sysfs during bootup, and make one of them visible according to control_mode,
similar to what Babu does in PLZA when hiding a file in
https://lore.kernel.org/lkml/f7bcf19ac8113a1e3d9575739c1a6400c455ce6d.1787772750.git.babu.moger@amd.com/

May I know whether this approach is doable?

thanks,
Chenyu
