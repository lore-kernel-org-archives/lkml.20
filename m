Received: from mta0.migadu.com (out-228.mta0.migadu.com [91.218.175.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561882BE051
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 23:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788563218; cv=none; b=ZtKWpjY6O0hvhlTuHzLRN+58pf01Mi4YNDUZWDozuqu7+EOijRYs26C7dkosOzK16qEp2snb7+sZK5G4On9ZHHoN/KJlSDXG860c56FYR0bUawG+ZvtkCGj+aNrvDuIkyhZYry+mwfBcrOQMhZ4gB5wek2U7wBGyTL7DdKRJn7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788563218; c=relaxed/simple;
	bh=ZUM2AKTRyDOrNDBMw/PpojLw84g0UsyJaEenIna+gsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+uszWdHck1lhTRt32jqTHFyGlgsVVVus3+j/Eiv33aI+wp50z30KYDbJulhB4p6Hqmr5l8Z0eokajf0DRujCrcX7am+OVExT8OCJXXjBx+1CjzfaE3/XDL1rQ8mLaoq8LhS5XMgmY1k0E8QhQm/NOAjiqCG3ZaoxIIiS/3bc7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aQtFCJWv; arc=none smtp.client-ip=91.218.175.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aQtFCJWv"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZUM2AKTRyDOrNDBMw/PpojLw84g0UsyJaEenIna+gsA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788563213; v=1; x=1789168013;
 b=aQtFCJWvXr+WjgsZqHRE9+lFClfwQDNjBmh8txhqKugdL7x3P7/+DWpnER31CD5nmGIps5aA
 9CYS1sicQQoX4XxMSAQMSw81lmfkfjwcplJYh8qgt8FSTeuh8YnXK24aQ0EkGLofCD6ndVeqIaH
 yHIpsggT7GJVHFG4DGEBun5s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 553d8ee376d76e0c;
	Fri, 04 Sep 2026 23:06:53 +0000
X-Mizu-Trace-ID: 553d8ee376d76e0c
X-Migadu-Flow: FLOW_OUT
Date: Fri, 4 Sep 2026 16:06:47 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev, 
	muchun.song@linux.dev, akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	dev@lankhorst.se, mripard@kernel.org, nat@pixelcluster.dev, tj@kernel.org, 
	mkoutny@suse.com, osalvador@suse.de, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, kernel-team@meta.com
Subject: Re: [PATCH v5 1/7] mm/memcontrol: flatten try_charge_memcg control
 flow
Message-ID: <aptO87TL7KDvcX3D@linux.dev>
References: <20260831163752.2193337-1-joshua.hahnjy@gmail.com>
 <20260831163752.2193337-2-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831163752.2193337-2-joshua.hahnjy@gmail.com>

On Mon, Aug 31, 2026 at 09:37:45AM -0700, Joshua Hahn wrote:
> Refactor try_charge_memcg by flattening the nested memsw/memory
> page_counter operations to separate the logic between the two.
> 
> When page_counter_try_charge is made stock-aware, this flattening makes
> the control flow easier to follow since each page counter now has its
> own success/failure paths.
> 
> No functional changes intended.
> 
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
