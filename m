Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56B93D0C18
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 04:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788496222; cv=none; b=PL2fFHSEOU+CLqK0KWWIy1Co+yv8ivc2rGFDaw3Htz1CEEOYywNzvJmEXzPLELfk9gX6w9gm6llzZ+kHsN944Fmxu0SQii9msOEWYggEPQ99CGik/y4tP6veP/NDD/XXL1PoBbXAKDGNhz82pBDSiavX0+r+y+k181fNjV0oWGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788496222; c=relaxed/simple;
	bh=W1mm0wrVwOH+dcIHbpR8vhmojEuqbfaoUAlhJsPu70A=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kjg7cKgZIMpKnlvx9TBaZghE7zoNNNyivQmk05q8YMvO+qxH6Cij/cB+K2Fr1CHJYwOpQs+eZY2W44NBb4CQp7lkKc5N3vJQ3eIdGVG4m7JPGNFHDILUg52rxQmaHZMXVYjj6LyPXyMZxd7PJl7J81LFEOkbSSAxc02dQBaOo0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=mur/72WL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="mur/72WL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145D81F00A3D;
	Fri,  4 Sep 2026 04:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788496221;
	bh=hfftmsa8TDfeo1LBQjT5xMFLuIxo7M1ZT1hU+UD0CYc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mur/72WLEwGUsqBE9CU4iMK90/oNqx7DHImjtz5FgERS0n5U713zNsRz7c4jP/BY3
	 zSo+9KRxjYkXSdrud+BzuO78sM38S0pKYiZhCQJe4K7DytBT9mhg7UZ88bFoihra8F
	 bnB1wVxJquR6eLc+ACOMfUbTGFgN8prdJeOG6tak=
Date: Thu, 3 Sep 2026 21:30:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Qinyun Tan <qinyuntan@linux.alibaba.com>
Cc: Michal =?ISO-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>, Johannes Weiner
 <hannes@cmpxchg.org>, Lance Yang <lance.yang@linux.dev>, Qi Zheng
 <qi.zheng@linux.dev>, Roman Gushchin <roman.gushchin@linux.dev>, Muchun
 Song <muchun.song@linux.dev>, Dave Chinner <david@fromorbit.com>, Baolin
 Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>,
 Xunlei Pang <xlpang@linux.alibaba.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/list_lru: don't copy stale shrinker id from
 non-memcg-aware shrinkers
Message-Id: <20260903213020.6c609d3ec36453f88953d367@linux-foundation.org>
In-Reply-To: <697713c4-0857-485b-aba7-c74f37a3c8b4@linux.alibaba.com>
References: <20260901115104.2944996-1-qinyuntan@linux.alibaba.com>
	<aphXPCn8isUVV87k@localhost.localdomain>
	<0c5aba0f-137a-4aaf-bddc-060118322602@linux.alibaba.com>
	<apktMn_hwvZwsRUG@localhost.localdomain>
	<697713c4-0857-485b-aba7-c74f37a3c8b4@linux.alibaba.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 4 Sep 2026 10:10:20 +0800 Qinyun Tan <qinyuntan@linux.alibaba.com> wrote:

> Andrew, thanks for the sentence fixup yesterday.  If Michal agrees,
> could you please also retarget the Fixes: tag:
> 
>   -Fixes: 03375203e1da8 ("mm: do not allocate shrinker info with cgroup.memory=nokmem")
>   +Fixes: fafaeceb89a5e ("mm: switch deferred split shrinker to list_lru")

Done.
