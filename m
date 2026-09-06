Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FD72E414
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 00:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788653879; cv=none; b=gvcofZ7Gkk+iOI7Mb4fpTaJuVEK5+9R+L/u3jigjt64hetTfZvvS85Q9VakKxehrhocdHTg9v6rVGA1BiK+sUvComLOBhP7b5I6locwU7aGAJ31Zi+vY+i8QJ434Av/6p9NGfhqeq/HJaFr/MnbPB0Z9Gd9qWqoWSbs7lm+FfiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788653879; c=relaxed/simple;
	bh=u/LYZxMCyHjy/ciB0i0eqcdvHK4qhlIoVnYhWGhJoCI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=oK0ViTvyxMmle6m2OVQ4v0ATYQ3LOZr2r/9ixBNVEquvl8WbA7FLoNUhKhW3ZEMHN5fsiSNDun2F6WrykesyJFpFROSTWiZymnxToBVOvTk1BJI1b4xxvaVHaKzHd7nrwjdqurDVfYVDCdMh7oC7T3y8/uPc2SCVfJl3vc8223o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Xn7FIJdb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Xn7FIJdb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBBEA1F00A3A;
	Sun,  6 Sep 2026 00:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788653878;
	bh=uG4SsHwh6w3Rir3+3LpKzSaA094DGkWi0CEdHNVDXeg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Xn7FIJdbJUhPVjtDuTGi7m7q+xc0z298VETMk3ZCL0hWWPESP/xnw9CCf4Bzz9UQP
	 thhaoiSzXvurIIxh9Smo8ir7JuZsJLSXffTPsnI2dCcOVI4bnYWuCKbtt6Mw96Bxug
	 GiXBhazIZeTeigzUEwpsXO3zvlyNgzWXzvlReWzY=
Date: Sat, 5 Sep 2026 17:17:57 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Pedro Falcato <pfalcato@suse.de>, "Liam R. Howlett"
 <liam@infradead.org>, David Hildenbrand <david@kernel.org>, Vlastimil Babka
 <vbabka@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Mike Kaplinskiy <mike@recall.ai>,
 zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
Subject: Re: [PATCH] mm/madvise: swap in CoW'd MAP_PRIVATE-file mappings on
 MADV_WILLNEED
Message-Id: <20260905171757.ba8b0f8f0f18ebd04418bfeb@linux-foundation.org>
In-Reply-To: <aprjOxDy3JCPb2oa@gremlin>
References: <20260904-madv-will-need-map-private-v1-1-6b83cc99fcff@kernel.org>
	<apriM1q4GzAgP7JQ@pedro-suse.tail5790ac.ts.net>
	<aprjOxDy3JCPb2oa@gremlin>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 4 Sep 2026 17:01:37 +0100 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> Andrew - could you swap the patch out in-place with below? Thanks!
> 

np.

> Currently MADV_WILLNEED treats file-backed and pure anonymous mappings
> entirely separately - using POSIX_FADV_WILLNEED (equivalent of a readahead)
> for the former and a tree walk and swap in to swap cache for the latter.
> 
> MAP_PRIVATE-file backed mappings straddle the two and currently get treated
> as if they were purely file-backed, meaning any swapped out private pages
> remain swapped out.
> 
> Resolve the issue by explicitly checking for CoW'd MAP_PRIVATE-file backed
> mappings and performing both walks in this case.
> 
> Since the logic checks for vma->anon_vma this means un-CoW'd
> MAP_PRIVATE-file backed mappings retain only the single file walk.
> 
> Reported-by: Mike Kaplinskiy <mike@recall.ai>
> Closes: https://lore.kernel.org/all/CABeknB_S2XJSHFgnHdgnN0rjzHhH4oQJs_APq9fvxHztQ_pgiA@mail.gmail.com/
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

The failure mode looks pretty obscure, so I'm thinking that no backport
is needed.
