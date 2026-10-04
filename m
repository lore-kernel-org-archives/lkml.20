Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48B33F7AB7
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 06:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094066; cv=fail; b=RnEjo1wG9ZcWGP4TPulU8crBbiuKZtSXizigweRUmEsrWXi6UEnjxLWLe8C80bxrM0xpak1MFJEiV7gyB7ITaXfAfzlL2OLy507VCtxMw9zboi2CaZZIZoKl5dq6B/wSnXuGRDK5e1XJZhE4AUQvp3e2xZcb0qeKjyIs61r3HUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094066; c=relaxed/simple;
	bh=edh8FNLodXpHr9W+WGnPCW9AT0EvSu5P1d1hgGg8iTA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YmC/z3S8MfPzCxrvND1NfQUVNWxOfld9JshjM3qNPlomjbuYKqqo6U5MSHc3qkA+5unV4QFdJd6gxxGH22CmMvVOWLrqyicRa0HO6zo/BcCboB8842s+lo0ApruGUG3BBlx2ejnD5OyLRttTxY6jSp+IMWwgHncMXPIgN3pmMoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lp3gdvwg; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lp3gdvwg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791094064; x=1822630064;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=edh8FNLodXpHr9W+WGnPCW9AT0EvSu5P1d1hgGg8iTA=;
  b=Lp3gdvwgxWaM8XD5jD3yHHPdT4gS4mpDe6XkdhZPMxfKpw5KJI94XxaU
   WxoaM4MwLGh+UzKMcmdrIEeLfWzORQU0szs3bqvhAEErbzk011XBx48sS
   zDVLpAv8dG2V3VQHz+G3W/bafU0IFHAgNH6njFyzs/Sj9laP4rw4RShps
   7mJUVFge4pXvxjM5sXe5REf8Mt8g78kN1D5k+c8vffBFBqLyZT1FyIITq
   3adWqTWvol1GKVpBdqiEJhjJF6CF1CzGIdKj6l8C361u1Ng5QZYtxtaOW
   AQ9WNdyDH6CA6xP9J/08MxzbNeNg/b12NgfjxUtjQzOmufroYW3LORII9
   A==;
X-CSE-ConnectionGUID: Js7F6hhUSbyfZu9FperROQ==
X-CSE-MsgGUID: YBF1CeEwQdaMW3KR3GGsrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="91007152"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="91007152"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 23:07:44 -0700
X-CSE-ConnectionGUID: ntyjflwBTLeT+7/Itugkcg==
X-CSE-MsgGUID: U5b3zMPeTZ+ZOQ59jtd8Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="272953058"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 23:07:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 23:07:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sat, 3 Oct 2026 23:07:42 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 23:07:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tfJVm+guEutVxfnSKVCMGrT9ybr7UMd4xGnhJI6izg0Km6HygriP7O2TpuaybS7b4L1ehG90I/cKWutH7bkDcmy01gzmu4nQZu9ef4FjTkvLvExMxvB2AbnJcYTiYbnbXG3MrAorL5T63fxS07XKKzy7UDU66VMKZ8qFk/gA67Ma7zGuWMkM24hrNMCb4y1xittAJ3FJmX0MN9I1KBm8rGsMVrKrwHqg5u1rsreXAxAla/92Ib66KbAasZzzIRt0/D48KGShXW5nqnkNtNeqjyFBoxitTyERQGtzq/awgs7fwC1i+Sk60aTaQ7tY8iA6L9HFXvTB1QThgkrr5k1ppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eELoQaI1t3LoZBII2hrzieNlaqtXpjz/Euk1eH7nt2Q=;
 b=NZpwa/3H4Sqgg4PJiJQrqFXF5igMkvLN3X7TWxJW8/yJ9qB3XV8mT3CLD56eSOzI9LHc2dyV6LTUAEs5sxX4b4xsgGIq1jPt/MXKbb+Mk2T4Hfg62aamkoWZpVnwyEdtEtFZwgZi8zxkOwmF29smragGGBs8FwYVxGOJz1sZwmcokGVk0lizLT5BXgOUni2t5BfaXGP/b6ERC4iKyeco7IoyXEkxYeEtjQmGFc4muwv6u7pgqpbANrhGosVPkdG+gqTkTFxeztr4SxachyxOWwjDBwyuIdJPZb/Y/7nARjig7cO+duo4+CQDjzHKvBpKQ0i4YgbT0IG7DGPnGL8hyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 CH0PR11MB5316.namprd11.prod.outlook.com (2603:10b6:610:bf::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.20; Sun, 4 Oct 2026 06:07:28 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0472.015; Sun, 4 Oct 2026
 06:07:28 +0000
Date: Sun, 4 Oct 2026 13:54:20 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
CC: <tony.luck@intel.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <babu.moger@amd.com>, <hongyu.ning@intel.com>,
	<chen.yu@linux.dev>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	"Hongyu Ning" <hongyu.ning@linux.intel.com>
Subject: Re: [PATCH v8 7/9] fs/resctrl: Do not invoke smp_processor_id() in
 preemptible context
Message-ID: <asHqDEBauXwTFo0c@chenyu-dev>
References: <cover.1789705667.git.yu.c.chen@intel.com>
 <6e0ff955200ead6a2ac689d492a5e5c73ebc3552.1789705667.git.yu.c.chen@intel.com>
 <432f616b-314f-4b46-bfa0-28759a493cae@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <432f616b-314f-4b46-bfa0-28759a493cae@intel.com>
X-ClientProxiedBy: TP0P295CA0038.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::11) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|CH0PR11MB5316:EE_
X-MS-Office365-Filtering-Correlation-Id: 48fe23b4-2a5e-4ee9-df9e-08df21ddc4cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 95xbCKC7LuElqNkoGZKYq23ok/Rh8XL/WIrO+EhCaYQbDhxUZH+dmblBQDT40vXqIhNbeWbXysrboUUYfBksfg7rawKeUViaA7XmdPATfoz6nURcceqbgFvHw46c6QscCsY9DcrLFxCDE6TGxrMkWJokf6PmVGJivDQTKIYOtD+BFR3umAkIJEwMNe+ya6CvaeL6UZ5SSCwfs8IbN/m2T3sLi1NKfBTle4ey9rQUxbobHGSDG2jAXoJaedXtprgNPLM5qT373tqVcvV6+Pk1WGr6A8Mb3LA28EFI2MlF5nqCQjpjRxM1duUYSM7oQ0Cj/DcGsGeKvQob5lqMH35WusQn6HEF1z/AOzQjQkfVG2kR7Y9flQLPhCQdc96RCJpRj67Vi0S0t8pbrZ2dS6TeNEk7Dn5s80Gld1/I8tkrbKma6b5PHSskKR1Z1YhVHOhgWOK40NoJY+53OeBcPEX8eOQH0yTlZa3W4pnkrJxAMDNOUGGal0hLDgF/FBQjJbEaw7HahBloJfwnAZ/HByRNyi1Vby7Wj5YoAw6yEgqtCP9dVaWKnvXWBqF1/4iCingHlM2bsyu0x8L3udpzacj0RQqih/gyShBnNPQPDWlI1ZrtON/Sn+9mxWqMxXWcAmb31SLc2OuP+KZc17UpieuR6Rwb8leUTrk85MXKPqZDagQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rj7IX1v82YNFWR9xXCwzksuJdR2s71ZEoPe6Q1Inqe2liDjj2j0oyAk/7QkK?=
 =?us-ascii?Q?Rx/QvfmwkwywlamXHeGzZU2k+keRo0f3I3UP5IFV4QcjQ++ewK/fzCKC99ta?=
 =?us-ascii?Q?/i7tQtCsrVSPp5O4ht9cbOMIKDXiwaPu5uZESV36J8LhD2dsv/OmGr4xRgpV?=
 =?us-ascii?Q?ykSdqfinnsgnEgP9+kT2/s0luIubwj49V4oYfLeeXcfncFm3+64+5vnewMNr?=
 =?us-ascii?Q?SzL/FhqKB0TcODNaubpAmb2JY09lU9su7mGamdV1q7a3b7ZKEimUQdchCOey?=
 =?us-ascii?Q?DjOyyap8xu+mlaEHPMt0rGEzEbDatS3k5/io+GeBq5E4sXAWRjy+zR72E3tS?=
 =?us-ascii?Q?j/dZB8piLE35K+X8hmv4mE12MdJOFzQXXHsVxs3wLEZWqxw87nzP0XbPFYhT?=
 =?us-ascii?Q?0OUv/SdcJcXYbSGlcy3ChyWpVZg8i46iyoRD7piL6Eakrad5NSbvL2ogOW9j?=
 =?us-ascii?Q?j77iAthXEzd9ryhJhXNrGeeOqj7AYLe5DQecFx+xS39VWx5DyX3/45Grlqo6?=
 =?us-ascii?Q?ChGs44KqLLDWK05wNE1lzDF402CPqLvTqYyceDUvWLxyS919vwCruCykRJBt?=
 =?us-ascii?Q?vyEBdz/sI1kGW5Xf+OYdxx4i+dubwpOunSUicPfgHnQG+M0b+PB8qOoU8YV4?=
 =?us-ascii?Q?Oj/LUueS3CB01TND+oAJiADGrAsUMOJZ2CGKEqAVK2gio3f3blPV9+oQnCPt?=
 =?us-ascii?Q?4T1beWTGHRrIuQYmExeF0s5vF3oowJwpNxW2TKCCXqLkIES2PqOBs/HKfkHa?=
 =?us-ascii?Q?X78PvjgaVt1ZZs3KT3b5dPI6qskezaN1LlIxxLpykNPZTjAJu3BBSZeROAQ/?=
 =?us-ascii?Q?yo3Izi1eWXPivkotF+GdbtKWbNq5Eh8+7b5orm/wAlG/YA1bVwqXh6OBkduf?=
 =?us-ascii?Q?DO6SaCGaC74P+TanuOKZQRj7/+/IuLgXn/219XkjqUVHDWn4MvqqPzvHc+K6?=
 =?us-ascii?Q?eYiCT2cWG/cWRh9v0oVDRCTemmpWSzbidbkCFNeOTMy/Sd4m3s4u4UpP/rWU?=
 =?us-ascii?Q?1OXU8iHW9CUx5AfSIEMxK5zGqeNoGnf4O+0re5Cia8LNAsQtAq18pptFd1vc?=
 =?us-ascii?Q?VevgDP/zlB3SKpUZJIqFVn+tcJJCs/IXZBoREhhiJKbKm3lSp26hkTQJ6c1z?=
 =?us-ascii?Q?AXDi6CLL8vZHr+mTkuHbjDSdDYpLjMwkJW386cwCPBbJViWwdXA9bcFzxVIo?=
 =?us-ascii?Q?W4GxMJJHCksoAF40mGmdDtSwhIWKXOky27dv4diokcS14tQX7QgO8kqQQfjn?=
 =?us-ascii?Q?9dfMMJrGS8mLBoyLr6A/0IhcyJ7ncnonKc9AwM7i6ZXjTlg0dMyeLGdBPG6i?=
 =?us-ascii?Q?NB8afP0OtMtdtzVfXMHshKlsrqBVsWj7h9mbyRwV7shlSQ76jbXSwvPwCI3A?=
 =?us-ascii?Q?o4jeGQvARbWfkJU0eTiE8x7OnzMl6aRU47i+1Ones+X4UKa5y0zSaDhCq5bC?=
 =?us-ascii?Q?yzIX/2ZcqrEb59peLgzQYb/jM3W0Q7sp+LlxK7YYnRM3Ym/os+y63b1vNTf2?=
 =?us-ascii?Q?XyjaKLDIqIiy++2QZ2rG9IF63Hz6rFsJkny3pd+YGnCZJUnfFrxMGtJ/+FkI?=
 =?us-ascii?Q?D253nQmy7S+/r0ziHYMkUIonxavR8WuCx5zuEq4Fkj3LW9tPhYzVz4Y94ro9?=
 =?us-ascii?Q?cnXc8BJAobRwcPDIi/8lhZl04xGSRaPBK++eVG5JoLA6/9Or/gYQQUwrrZfi?=
 =?us-ascii?Q?zTf/LmXs2k1aPnPLY6KNowTEaxHmdCntv17qBFhNZ1uNhYljA6CvXWpWPUjF?=
 =?us-ascii?Q?j6OO5XV8lQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: hSAiAg3Knn/NsNcPTN++36Ot5D7F4lMeeH9DvRr1FQ4Xyd8LgJJcUCS03ISPWSlxWt1i/xvdW4q44S/OOWEsEu7HqGoQPaBIZEt15Wl3NzHwqTm2Cu3tEYlFTI0NTscTGwhnqFQ+uXjfa/oAjGKFCwCJo8vOJhIWn+Fz4jYRCp4MbXoZlSw2l+CQjhuZpu5wdE/nW6iIIr7hRTa34FUgQFhgLI7Gz172MnA3/5AZ8Kfw82hxUSu86+GtOk2/zs/oKf1WKy/wFvPOUkUyaMlfKawbxg9ejQgZgYV5W9jyjmoZJNPUf5ZZe3rONzdbJnKFi+Uo9mQcew7qbENdSOhhFg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 48fe23b4-2a5e-4ee9-df9e-08df21ddc4cc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 06:07:28.5416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BktYeQxGhL/wHefJWakeG96ZEK1eRWIjLFX3thuWYm8v7EKqo1IZVG4qZCb9M77FGmgqFKTGTB7gWLz2k+VBuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5316
X-OriginatorOrg: intel.com

Hi Reinette,

On Mon, Sep 28, 2026 at 02:48:12PM -0700, Reinette Chatre wrote:
> Hi Chenyu,
> 
> On 9/17/26 9:50 PM, Chen Yu wrote:
> > From: Tony Luck <tony.luck@intel.com>
> > 
> > An event flagged with mon_evt::any_cpu is read directly in preemptible task
> > context instead of being dispatched to a CPU of the monitoring domain. Only
> > Intel AET events set this flag, so __mon_event_count() rejects an any_cpu L3
> > event with WARN_ON_ONCE(). The L3 read paths can therefore call
> > smp_processor_id() unconditionally to check that the current CPU belongs to the
> > domain being read.
> > 
> > MMIO-based LLC occupancy counters can be read from any CPU, so the L3 read
> > paths have to tolerate an any_cpu event. Move that check into a helper which
> > returns early for any_cpu events, avoiding smp_processor_id() in preemptible
> > context, and report a wrong CPU via rmid_read::err.
> 
> "report a wrong CPU via rmid_read::err" is obvious from the patch.
>

OK, will remove this.

> >  
> > +/**
> > + * cpu_on_correct_domain() - Check if current CPU is in the correct
> > + *			      domain for the event.
> 
> The domain is not always relevant. When considering "Return: true if the
> current CPU can read this event" ... could something like "cpu_can_read_event()"
> be more descriptive? 
>

Yes, that is more accurate, let me rename it.

thanks,
Chenyu
