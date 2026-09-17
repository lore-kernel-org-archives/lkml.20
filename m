Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121B21917CD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789606781; cv=none; b=pk/INntkGnSyVhgVzvTUbNAjr1lJXI9pPs3y98VhV1kFKtJy9v4M9w9Jy1rDeTi0XdieuSpFt7DjNJqbHtdGOPy662J8AmgQZwvpsn9ZZq8rMXbBADL6fijFgm5mE3zv/Y31oWbJv0NbzD07yvouvmAtsnBVRnkw4rSdE4/Vxfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789606781; c=relaxed/simple;
	bh=cBbWfX3HtJdvSHGbQkWjqY80B4cC8QqWuSVuF0RPt4A=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=IvjHD1Go2wrtBVF27PyhM4439AqXNMguGWqStGP52RUOQEPGplTw6qbzVfEcF7MgxL8gP5Jeqpcq/9Kpmpx+R7MRlv/B1kAgaeh3ptCGWnbzCjzjMukKCCJ5SIJrZ3tpa4K5HM7+x+DL+pwl+5Q5dfgVUKQsW6aKmIMB08OU4rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Jr0ZAE3l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Jr0ZAE3l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 777D81F000FF;
	Thu, 17 Sep 2026 00:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789606779;
	bh=m18M9q0iDPw/ZXWMaKyREc8QRrR725skItcYr3dWbPE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Jr0ZAE3le5lu5f6Eg2cxs2J4xWqUi10TE7oiSypYZJImDK1S/fsERFeuHgEdRPvj3
	 FJRAxip/J7XyO9Ff20cjHRz7xtg01De/TKLQSJVfLf+csWT/S58O0kc/C7D0mmC0E2
	 4bKYS73q3Dqb3tvewS4b0WO5GA9cyGFPFFGnm+JI=
Date: Wed, 16 Sep 2026 17:59:39 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ye Liu <ye.liu@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH 0/3] mm/vmalloc: fix vmalloc_dump_obj VA lookup
Message-Id: <20260916175939.01ecf1e866621427b7f09f21@linux-foundation.org>
In-Reply-To: <20260916-vmalloc_dump_obj-v1-0-7aa402d224df@linux.dev>
References: <20260916-vmalloc_dump_obj-v1-0-7aa402d224df@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Sep 2026 16:25:27 +0800 Ye Liu <ye.liu@linux.dev> wrote:

> vmalloc_dump_obj() has two bugs that cause it to miss vmalloc
> allocations, plus a minor optimization opportunity:
> 
>   1. PAGE_ALIGN() rounds up, pushing last-page addresses to va_end
>      and outside the VA lookup range.
> 
>   2. The function searches only one vmap node, but allocations
>      larger than 64 KiB may span multiple vmap zones whose VA
>      is stored in a different node's rb-tree.
> 
> Patch 1 fixes the alignment, patch 2 fixes the cross-zone search,
> patch 3 adds an early is_vmalloc_addr() check to skip non-vmalloc
> addresses without traversing all nodes.
> 

Thanks.  Sashiko asked a thing:
	https://sashiko.dev/#/patchset/20260916-vmalloc_dump_obj-v1-0-7aa402d224df@linux.dev
