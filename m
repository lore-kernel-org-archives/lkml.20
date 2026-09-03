Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C2D509EF3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788465713; cv=none; b=afbl7hXX0jXzUz6JA+X3Wmbq9+QJ4Q6iqTQk4qiiDuWApw4hXb+btJCptqRXFawvWcLyNqS6HCL8aR1+xN2NuGA1rdKNU50abOXHvWMuI5A7jzTsDMjgmD+V0k73dUfaVf7mDjBqngXF9rZBn/V9lUN/Nx8VcfmngyR8MIfITHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788465713; c=relaxed/simple;
	bh=GRhZAbIZLvugFM26o9wcgicdprWyWz8K0VkPBkeL+fw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=SfotP4GHiQzN0fpU6DsTrKa5rvvLNLDIr/ZNkLLiAbsMQLxB6W2DDcf2YHtY5WDAb2yLlg2MuK5SUHRvff9waZ3wp31r16wCwQsRLgjsiPndaeAsK3yYkGWexlIaYgwDd8l5CFegCQf0FHSEN+XiaWZGUIrc1WKdAKkr59QxoHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WBnLcCcp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WBnLcCcp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9BEA1F00A3D;
	Thu,  3 Sep 2026 20:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788465688;
	bh=IXUouC5ZrR7v9zjeOOFihml7UaPEh0xjvbsdR4q8cH4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=WBnLcCcpVTJVqdABoxFvSB2Sa+8mSerElIug58NG2muLX9XOPrhfTW9NlbWuP91Rx
	 FUH01R78/TN/OUErLi17t/4IoN9+toOebFmlGioJzABnagiCWEM4+99vgmr+cKJY+u
	 JA+Qdj7DRPGpu6DtIkkktTcXTehWqjHNp3vG+rFY=
Date: Thu, 3 Sep 2026 13:01:27 -0700
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
Message-Id: <20260903130127.1d3b3ba8155b21a0bc10e605@linux-foundation.org>
In-Reply-To: <0c5aba0f-137a-4aaf-bddc-060118322602@linux.alibaba.com>
References: <20260901115104.2944996-1-qinyuntan@linux.alibaba.com>
	<aphXPCn8isUVV87k@localhost.localdomain>
	<0c5aba0f-137a-4aaf-bddc-060118322602@linux.alibaba.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 3 Sep 2026 12:06:53 +0800 Qinyun Tan <qinyuntan@linux.alibaba.com> wrote:

> Andrew, since the patch is already in mm-new, could you please update
> this changelog sentence
> 
> 	"Since no memcg-aware shrinker can register under nokmem,"
> to
> 	"On a system where no SHRINKER_NONSLAB shrinker registers,"
> 
> per Michal's comment above?

Done.

Such changes can also be made while a patch is in the mm-unstable
branch, btw.
