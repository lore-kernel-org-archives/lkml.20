Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1171D353A94;
	Tue, 15 Sep 2026 06:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789452306; cv=none; b=hPUtNmyb7Ezvo3IES+rWtQfNkAq2C1tACfisdoxyu4j+byakEtS/9FTHpBaaD2vgnx+k+uqlQ2DdPmN6gaCKHB8SbPF6UlFDx8qDVxOvMRDJnzgyZpjUOQn0n4DTlOsZNR9kGfjQ6767q4nRA1yUqluLHQc399QwDLqilb4Liss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789452306; c=relaxed/simple;
	bh=IqlWKPvg8bK/ZokRX2t1XAdAV/hSsCgbgwoTVO6jzwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CgP+PxyXR4jSpnKq9bJKhpjVfbDUCTbfhwOy8mYe+Hnq4YzbM9f+Rus0YnTNUZLz7uUPNATEoLS2UT2hOwk1NLZekmPV1uuMUFA9FtWvTskeuoOAN4Ta9I410RgKeI3DEpgOC4t/adDxYYJ1zIywznk+9bZfnI43k6gtcpCbGGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MNPaOL3d; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MNPaOL3d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789452304; x=1820988304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IqlWKPvg8bK/ZokRX2t1XAdAV/hSsCgbgwoTVO6jzwY=;
  b=MNPaOL3dabJp2IkAD8ACFGEt02TuJrEcgmu0xl+M3GXH4vcFqNGzDzSD
   1cp22wczKqYTorLkTnbqq0Kqp0P9vhbEsYJVOlJ23oDWI4AtCUVOq+SnI
   lUZVRQhwrWf6xLNTirV1G/m4cAierTly8JIr8ucyfPdFwSo7VkJqAvT6H
   48XiKyjGJDEqaQ3L6s9m2r6xsMG+eWxtUkIjYz3phpOBaZ6Dylqr8u6ws
   1oWIfzTLREPUo+8pKaz5BLPjiHQLBjg5nStERIaS7OwJfhopRJklX9N/J
   svIR4R9pRPUGlbZxtc1RE87qQq0UOF8O4Txgpxw2F8cx0plT8UBAhzTsZ
   A==;
X-CSE-ConnectionGUID: m5FvpWo5TIyjx96Lmx2asA==
X-CSE-MsgGUID: TICsfZdbQRWMQxZqzEV9YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89567046"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89567046"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 23:05:03 -0700
X-CSE-ConnectionGUID: Y8jRlnWyToaUKtxyhFskhA==
X-CSE-MsgGUID: ZLlM0n82SFupWVIFWOfVyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272848343"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 14 Sep 2026 23:05:01 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5B2F199; Tue, 15 Sep 2026 08:04:59 +0200 (CEST)
Date: Tue, 15 Sep 2026 08:04:59 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "S, Sanath" <Sanath.S@amd.com>
Cc: Mario Limonciello <superm1@kernel.org>,
	"Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>,
	"Martinez, Juan" <Juan.Martinez@amd.com>,
	"westeri@kernel.org" <westeri@kernel.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5] thunderbolt: Fix tb->lock deadlock during hot-unplug
 on AMD USB4 routers
Message-ID: <20260915060459.GJ106095@black.igk.intel.com>
References: <20260831130638.GK124825@black.igk.intel.com>
 <20260831161610.1322731-1-juan.martinez@amd.com>
 <ae19d381-0fcd-45fb-9e53-033c7d664d73@kernel.org>
 <20260902054800.GI106095@black.igk.intel.com>
 <21cbfbaf-ef1f-469b-a33b-8d623dd7f9a3@kernel.org>
 <MW4PR12MB7016EE093475BF1821A0046281BF2@MW4PR12MB7016.namprd12.prod.outlook.com>
 <70448c19-1ac5-4350-bdcc-eb3ebd008992@kernel.org>
 <MW4PR12MB7016137EFD6AEB235F3D50E481BA2@MW4PR12MB7016.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <MW4PR12MB7016137EFD6AEB235F3D50E481BA2@MW4PR12MB7016.namprd12.prod.outlook.com>

Hi,

On Tue, Sep 15, 2026 at 04:51:00AM +0000, S, Sanath wrote:
> Ported it and stressed it on two Strix Halo hosts connected back to back.
> REG_CAPS reports hop_count = 3 here, so two usable DMA HopIDs. Observations:
> 
>  - Single tunnel it works: 50 x traffic then link down/up, plus 42 x
>    dma_test create / transfer / teardown. One reset per cycle, no ping loss,
>    no errors, and every ring restart had a reset before it.
> 
>  - Every reset is preceded by "dangling request in request_queue" and a
>    WARNING from tb_ctl_stop(), 8 of 8 cycles, via tb_domain_pause() <-
>    tb_ring_start() <- tbnet_connected_work().
> 
>  - Two tunnels: the networking ring is stopped and restarted with no reset
>    in between, because the check only runs in nhi_alloc_hop() and tbnet
>    reuses its rings across a reconnect. 18 such cycles did not hang, so the
>    unsafe reuse is reachable but I cannot say it hangs.
> 
>  - When the check does fire it takes networking down, reproduced twice:
>    "RTNETLINK answers: Cannot allocate memory" plus "out of HopIDs that do
>    not need a host interface reset", until the second tunnel stops.
> 
>  - tb_domain_pause() takes tb->lock from tb_ring_start(), while unplug holds
>    tb->lock across tbnet_remove() -> stop_login() ->
>    cancel_work_sync(&net->connected_work).
> 
> Moving the reset into a per-NHI work item scheduled from tb_ring_stop() when
> the last DMA ring stops removes the warning and the tb->lock inversion, and
> passes the same tests cleanly. The reuse hole and the lockout still need the
> reset to key off ring reuse rather than ring allocation.
> 
> Mika, Can I respin your patch along those lines and post it as a new version?

Of course. I'm thinking though that should we do the revert for v7.3-rcX
now and then do the proper fix for v7.4 with your updated patch?
