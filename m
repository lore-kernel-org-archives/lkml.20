Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794281485;
	b=xdbqSBQjKBR+UF4VuTNfkoATZldeCWnPmSwqUPJRxLUDf11kPkU+wvXmu0ZcRHX+y/KI
	 2hlzofUf5Kx8s+8tgv+vm2h0vsPYlabrdxYFqyIjcttoe4fBkyhJr5QmZ0XuNRPauAnE6
	 OD1OhXhkmhbYqTvxSZLhta7Zf/P5rgsQdt0LZ+ctEIG94kinoHi/QHS/umm2zKQrpibrA
	 luNhxr8Frm4uukHnZo1K0wrPVb2t9Eij5UCAUiDWNvxT2lTKGbX2DkaYS+/N6BljwzwpK
	 c+tHUo9Lx0ywQzTkmnw6XfcZVhKE/eX2oTfGDqRYtSJ0yyBYAadvSX5hrjMdwTk7Rfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794281485;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent;
	bh=XzzTILdfbYBLvw0MWiIRHVzcsuMJFD+V9XadsyocBCs=;
	b=iSOIKsErrI6viq9kdNi62hL7agbhSdZJoE53UPGs6urX9hHpH7USg1aaFWerrZzbPqCx
	 LvJtPS6WTKmtOzlJ/KZHOqdIKi283PpSFAQFNUJaj44TWIsVYV1KnCJLeD919YnEK0GUc
	 yKafYC1Rqoy4vSxg6ghljYgDN72WrOT5d0HeQcZ3ufsK20u1e5+kNYPN/qikW5MJS8TyI
	 JxW0ecjWUQ8RsDrRX/TwAeD/2Tk5GTT4xTuskUQ4eu8a9HE0NdPUEbA8HEYl/w2GbtBim
	 5bjK9PEHt478oaYp4bfNJCZE16dHa5phLAhRH/yMoz4N3ddBaUrEe/cot+Emvd+opcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FcOl3+Eg;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F88C606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F88C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FcOl3+Eg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794281485; x=1825817485;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8UETthy2DqGK6OxbGSELIutxELUHxSSjiu6K8rj6CiI=;
  b=FcOl3+EgqP4M1DF326nt96DRLr9vakl4YeaoLlCS5BS7JzoiOWL1q58z
   Ogp8FJXA3thi3q92A19MIT+CunRxE7VoL62+kuiJq1jmiZ/ytJVBMsfRI
   aGRSrRWkvTJUJL4AzTr0nKJluQUeQdODkjq/eAFYkf+3j07K8eSnVrxmq
   Wms3wtcE1FFS6hji12Eqvbdf15KFJBGxcGX04RdJpVF53FmSX4Cidc1W6
   wHtQ75cYDTPj2doBgiYAyQTmFu9hERQu2IuHNNJvySEJQK6Hd41dIMsPq
   BcUaZmDt0ngIPS5Jm5AKhhmnZF75haYJoQhic1rG+dg2i/SHUUGPJxgoD
   Q==;
X-CSE-ConnectionGUID: BPSgxG1/S4yvArZZiKHeDA==
X-CSE-MsgGUID: KtJbT3zeQmuCMv9JTe7Nlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3017289"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3017289"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 19:31:25 -0800
X-CSE-ConnectionGUID: lvwgFE01SeODw4B0rb84cQ==
X-CSE-MsgGUID: aa7n53KeSJe7hEqTlfVN4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8349576"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 19:31:24 -0800
Date: Mon, 9 Nov 2026 19:39:29 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Javid Rzayev <rz.cavid@gmail.com>
Cc: darwi@linutronix.de, kprateek.nayak@amd.com, len.brown@intel.com,
	linux-kernel@vger.kernel.org, ricardo.neri@intel.com
Subject: Re: [PATCH RFC] x86/cacheinfo: Remove get_cache_id() due to ID
 collisions
Message-ID: <20261110033929.GA26452@ranerica-svr.sc.intel.com>
References: <20260319-rneri-x86-cacheinfoid-bug-v1-1-5875849dd0e5@linux.intel.com>
 <20261109165537.6656-1-rz.cavid@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109165537.6656-1-rz.cavid@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Mon, Nov 09, 2026 at 05:55:37PM +0100, Javid Rzayev wrote:
> On Thu, Mar 19, 2026 at 05:38:00AM -0700, Ricardo Neri wrote:
> > calc_cache_topo_id() and get_cache_id() both compute cache IDs used to
> > determine which CPUs share a cache. Intel processors use
> > calc_cache_topo_id(), while Hygon and recent AMD processors use
> > get_cache_id(). Intel processors use get_cache_id() as well, but only to
> > populate /sys/devices/system/cpu/cpuN/cache/index*/id.
> 
> Hi Ricardo,
> 
> On Intel hybrid parts the bad IDs do not stay confined to
> cache/index*/id: after CPU hotplug they leak into shared_cpu_list.
> 
> I hit the collision on Arrow Lake-S (Core Ultra 7 265, 8P+12E, no
> SMT). Even without SMT, CPUID leaf 4 on the P-cores reports 2 threads
> sharing L1, so get_cache_id() shifts P-core APIC IDs by 1 and E-core
> APIC IDs by 0:
> 
>   CPU  type  APICID  L1 id (unpatched)
>    4   P     0x30    0x18
>    8   E     0x18    0x18   <- collides with CPU4
>    5   P     0x38    0x1c
>   10   E     0x1c    0x1c   <- collides with CPU5
> 
> When a CPU goes offline, cache_shared_cpu_map_remove() clears
> cpu_map_populated. When it comes back online, the LLC is still valid,
> so x86 populate_cache_leaves() is skipped and the generic
> cache_shared_cpu_map_setup() rebuilds the maps by comparing ci->id.
> 
> On v7.4-rc2 (unpatched), right after boot L1 shared_cpu_list is
> correct (cpu4: "4", cpu8: "8") and only the IDs collide. After
> offlining and onlining cpu8 it becomes "4,8" for both CPUs, i.e. a
> P-core and an E-core appear to share L1. On a distro 6.12 kernel,
> after several suspend/resume cycles both pairs (4,8 and 5,10) were
> wrong.
> 
> With this patch applied on v7.4-rc2, L1 IDs equal the APIC IDs and
> are unique. Offlining/onlining cpu8 and cpu10 leaves all
> shared_cpu_lists intact. L2 IDs change (e.g. 0x3 -> 0x18 for the
> cluster of CPUs 8-11) but the shared_cpu_lists are unchanged.
> 
> It may be worth mentioning the hotplug effect in the changelog. Do you
> plan to post a non-RFC version to the x86 maintainers?
> 
> Tested-by: Javid Rzayev <rz.cavid@gmail.com>

Hi Javid,

Many thanks for testing this patch and making the observation about
the CPU hotplug effect.

I do plan to post a non-RFC version of the patch and I will be sure
to mention your observation along with your Tested-by tag.

Best,
Ricardo
