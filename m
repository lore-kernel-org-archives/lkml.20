Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34C7469855
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247958; cv=none; b=XOWE8h5bICP1QBfsH/TtLfmCDORnVtp7ALCjM+EzuzE4HVRPz30EMgZ//Npu9J7kctVBqZn1SfgCNJJxLSqetj0K7bE+qowHyzbRnE6pNgGQi/O6P/FDNWDgqPwy/CHYbQwSjee3CtYTdQnMszbjZnM9kl1yuZV7C7PyxruhEDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247958; c=relaxed/simple;
	bh=j3zw0fD8wRx7W4oYn09tTEsLT0uFNbUrm271JdAUnME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=surFB7p1CYhJhVxjAleK0HbSSdTcq8M0EEZILkSiMdrmqClk/pQt2QujL69eqDvdis5PoOdICktuJpoHCl6AR8ezdEYXIKHyu4bYnFnnyN7MpxHOzBAU/USuySwhfjcgvODUtVYgpdsS/aIcoE4AvLBxpBBS5Dj57XVPgKVPues=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L+ksxbY1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+ksxbY1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788247957; x=1819783957;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j3zw0fD8wRx7W4oYn09tTEsLT0uFNbUrm271JdAUnME=;
  b=L+ksxbY1VFzJp+ae2dRFdSa/mDLJuBsCRQ6Bs7dlu6zTHmbzpu4wmWLF
   mLkPj4N+5h9DwWM6459OuUfAOfjWFo/4Lj2kXvwKgT8yWK7xZvRI+BFou
   jQ5T0ZV1XtsQpy3MUZj9nxaB1rz8arOd6l6h2xCqhZKjI3WtK9tB95oNv
   AmWyNahXzpxwytDxlWI5zX52iFH2NLXDQykdsRxKMNVm0pSv4Qj2pFcra
   3k2f4X6O9oNPLLMgWmU6jI+nYSJ7PfSV5WWlXkKhGkjZjWnUyHbmiK7uA
   ivVyxJOIcIALZUzq0qPdDcDDey56gHnj9rSw15RlwOMkprHLmtLxGbPt7
   Q==;
X-CSE-ConnectionGUID: YhOzcF0iSQeCe0DQgWCthA==
X-CSE-MsgGUID: yohunNFfTHGHxS8P4kCkTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="111439146"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="111439146"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 00:32:37 -0700
X-CSE-ConnectionGUID: 5LP/gZfHTvqkCkf/yO86yA==
X-CSE-MsgGUID: qNvc1TfvRyeqG9epZa33rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="298906217"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 01 Sep 2026 00:32:35 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id DF71099; Tue, 01 Sep 2026 09:32:33 +0200 (CEST)
Date: Tue, 1 Sep 2026 09:32:33 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Neal Cardwell <ncardwell@google.com>,
	Eric Dumazet <edumazet@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] lib/win_minmax: use /* notation for regular comments
Message-ID: <apZ_kWb81yEVLt0N@black.igk.intel.com>
References: <20230102211614.26343-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230102211614.26343-1-rdunlap@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 02, 2023 at 01:16:14PM -0800, Randy Dunlap wrote:
> Don't use kernel-doc "/**" notation for non-kernel-doc comments.
> Prevents a kernel-doc warning:
> 
> lib/win_minmax.c:31: warning: expecting prototype for lib/minmax.c(). Prototype was for minmax_subwin_update() instead

...

> -/**
> +/*
>   * lib/minmax.c: windowed min/max tracker

Side note (just stumbled over it today), if you fixing like this it also makes
sense to drop rather problematic filename in the file. Here is exactly a good
example why (it's not the same as on the filesystem and in general easy to go
south with time).

>   *
>   * Kathleen Nichols' algorithm for tracking the minimum (or maximum)

-- 
With Best Regards,
Andy Shevchenko


