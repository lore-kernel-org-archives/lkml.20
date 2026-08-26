Received: from mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FDF3AD50B
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787769357; cv=none; b=VvDUpyHkuIOBfSwHN7NpPS1oY2Ch5OcRq/7Jc2PLD4b0z0m58LMa1QrW4xjDm518awmXDYdrDcvcpMpIQFe3GP8YB6dHEZHjDoVh46wMl5zU1pbbCaPY9teaZ4fQwtSMmONfgr2TbbuXWhcP4hxlpDn2Yf9+ojyzH+0Ol5F7vBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787769357; c=relaxed/simple;
	bh=ZyrhrAm7j38NGOmipO+o+kjkSYfh0FE7Hm9WXO5o6LA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNaZZJG2CmLef2FIIbuS3Fqk+WqADyrFNifrSLif02raVaN3P9kJ7hE3cz7yzEo7o0P8RUHRal3tMkI0jpVCciVF/T526ue7mvpAQMQ+qsoK1KMylaSBIU/lYv7LMwZK1LZnxLv7oJU/ZRFvj86phHBXRzMf4OCblNr7jmhRtsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hhDrfRDY; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hhDrfRDY"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZyrhrAm7j38NGOmipO+o+kjkSYfh0FE7Hm9WXO5o6LA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787769346; v=1; x=1788374146;
 b=hhDrfRDYhKkfpSwP9PNCv6Uakdp4iyxNRK9IYGEw6fc0T9fBe+6KkcbdIto8F+rvWFfzIL2a
 LzucZZv8LnyK9Ou0J+wMdvcIkyok/GhLLfVtAgBN6AhAg53uFvt6UiJsUkgSqWFSwHMACzX9dPr
 txGaB6Xr/bs9Cb9Y0gytDlJI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: from localhost (2a03:2880:10ff:b::)
	by smtp.migadu.com with ESMTPS id eb79b8ec4e60aea3;
	Wed, 26 Aug 2026 18:35:45 +0000
X-Mizu-Trace-ID: eb79b8ec4e60aea3
X-Migadu-Flow: FLOW_OUT
Date: Wed, 26 Aug 2026 11:35:44 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Hongfu Li <hongfu.li@linux.dev>
Cc: hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev, 
	muchun.song@linux.dev, akpm@linux-foundation.org, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, Hongfu Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH] mm/memcontrol: remove unused memcg parameter in
 calculate_high_delay()
Message-ID: <ao8x787ZgJvUvhbr@linux.dev>
References: <20260825120153.1405-1-hongfu.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825120153.1405-1-hongfu.li@linux.dev>

On Tue, Aug 25, 2026 at 08:01:53PM +0800, Hongfu Li wrote:
> From: Hongfu Li <lihongfu@kylinos.cn>
> 
> The memcg argument of calculate_high_delay() is never referenced in
> its function body. The delay calculation only depends on nr_pages
> and max_overage, and both callers have already obtained max_overage
> from the same memcg.
> 
> Drop this unused parameter and update the two call sites inside
> __mem_cgroup_handle_over_high().
> 
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>

