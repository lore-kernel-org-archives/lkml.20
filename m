Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344B0488219;
	Wed, 23 Sep 2026 14:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172079; cv=none; b=c66tHEpNHk2dvWlEldFtyVovakwkrEAuQD9aXpEz90/+5NhNkj6b5eCmDOkA81aZUTI/CriRI24z4LF92Frx5oWqObNpfggZreKHKGWxxeNeMlC3A8YRfM8CvaW94nYdsTetJBtWLMoI8bNdfxwmasKQ6fxemRy4+n8E8GEaT00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172079; c=relaxed/simple;
	bh=lWWYV/6sgrtGiy6kcFwdqaWktcyek5dC6Sfm7CBJFM4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fb4ZapM02JPFIS8ffKeoTuX5VikbaM1Tm3OJIayZWR6AZuFEGlzDJjyk2BVZVNUtaYMJcHCed0SmBDtsDWxFB2jci5xR0su+sENVoLCjEMSU6CAz55YNzLlvcoh3QEqme7/QQ0EHhPWIem9ihr/64H998Et4Y6rY7bsLQimhBp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MdpajThS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MdpajThS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790172077; x=1821708077;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=lWWYV/6sgrtGiy6kcFwdqaWktcyek5dC6Sfm7CBJFM4=;
  b=MdpajThSKD56z5AZ5/nbDqGHpjvYj3M7X61/8cVtk8YuF/2T9CZFEct8
   KWe7F1WstHlCSlfQESVTCKSO/ZbCgwgaFLbHWGghnjwPvsACTCBn/Bvg9
   mMG/F/U4sZRKQQLBCZrulR2ZqKZ64kUDAZAdnrw04kFSthLabaidfUuYw
   QHonKXjzDIRWt8RMcox9HiOIGdeyxzzuNVKcGmZX1HK1Qp613fXeWpt5z
   6EQP9coaSR5doLsye9YuVLQMDsejneKclQzS8pbYgVnI7c/lEWevraGyA
   nBTZPUVx1j2KsE8dHkK6hWjIUCjx3s92KHNct3Z12QU8hPXrLDLnHwEnO
   A==;
X-CSE-ConnectionGUID: gGKXYGI+Qtuxu9D/AsFqMQ==
X-CSE-MsgGUID: 0Dv/Y4JgSdiNZWkL5xDyeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="78423050"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="78423050"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:01:16 -0700
X-CSE-ConnectionGUID: 4NUtWgeQR9uSbPYK1Rb4WA==
X-CSE-MsgGUID: 6S8LK0O6SUSe1we/VeL+1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="299871741"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.253])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:01:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>, Alex Deucher
 <alexdeucher@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>, Intel
 Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
In-Reply-To: <arPTRF4qS6o1Q3vD@sirena.co.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <arPTRF4qS6o1Q3vD@sirena.co.uk>
Date: Wed, 23 Sep 2026 17:01:11 +0300
Message-ID: <70527adbe5ab6c73b87abf6a866e8ff34de96d42@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 23 Sep 2026, Mark Brown <broonie@kernel.org> wrote:
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> /tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/dc_memory_pool.c:87:37: error: stack frame size (8264) exceeds limit (2048) in 'dc_memory_pool_create' [-Werror,-Wframe-larger-than]
>    87 | __must_check struct dc_memory_pool *dc_memory_pool_create(size_t size,
>       |                       
>
> which I am exceptionally frustrated to see was caused by commit
>
>   bc3f07516a992 (Merge drm/drm-next into drm-misc-next)
>
> which merged the bug I originally reported in the amdgpu tree:
>
>   https://lore.kernel.org/r/aq0vYhZXtMqA41wZ@sirena.org.uk
>
> and then in the drm tree when that was sent upstream without the report
> having been addressed in any way:
>
>   https://lore.kernel.org/r/arJoCiRM1hRbgRb5@sirena.co.uk
>
> neither of which have had any response at all.  It really seems like
> there is some room for improvement in your processes here, currently
> that's three drm trees all held out of -next with the same fairly simple
> build issue.  Can I suggest at least check to see if the code you are
> trying to merge is in -next, the drm merge was done after amdgpu had
> been held out of -next for several days.

I don't really have a skin in the game, but it all builds fine for me. I
have CONFIG_FRAME_WARN=2048.

I presume the problem is the compound literal in
dc_memory_pool_create():

	*pool = (struct dc_memory_pool){
		.size = size,
		.capacity = capacity,
		.unaligned_pool = unaligned_pool,
		.unaligned_memory = kcalloc(lines + 1, PAGE_SIZE, GFP_KERNEL),
		.free_list = kcalloc((uint32_t)capacity, sizeof(atomic_t),
				     GFP_KERNEL),
		.free_head = ATOMIC_INIT(0),
	};

sizeof(struct dc_memory_pool) == 2 * PAGE_SIZE, so it's clearly not to
be stored on stack. However, I think it's up to the compiler whether it
actually holds all of that on stack or not. It could just generate the
equivalent code instead.


BR,
Jani.

-- 
Jani Nikula, Intel
