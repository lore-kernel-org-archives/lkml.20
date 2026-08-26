Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047E43002AB
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762522; cv=none; b=tHssNy+z6RlGYt9uhT3zNXQ4LaGzfx5K9x4FnOfsSzLgCxktelP7g2V5KOE3e2QeUqUAyamAbOymIagaStoE3zMmHDibl/FWNC+DE0dEVe4kdZL29V7TrebI73Hu7ot5EA77b6HqO+0onf95bvAiffFNUBoQbMXEUSZHoEa0Afc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762522; c=relaxed/simple;
	bh=Gt4TlLjfguPYCFiF8utC6Q9G7kxO+CsyHAYXjDHcZJI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=pxat8+rXiYWbSAxss4I09bb94g4cCgemU79rV1YC0g1T5ZpvjmBgG5Bu4PYc4iQNFd1cm94ACGT7UkXZHuZdjmFgzV98woke/Qyi7eZLGSF8OmaIG1U/bPGqw7ErjSRAffRR5YA8Sh+JIWxtEvQZUECFdiko8V00vOCYwjtAGgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gfyXWyJA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gfyXWyJA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4111F00A3F;
	Wed, 26 Aug 2026 16:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1787762507;
	bh=TPjkwU0mp8K1sg0RQauhq6nWb8WLYzhdL28QYw4YzWs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=gfyXWyJAAoC+SWNzywo5H8E7eZPuZn7ZYQEBQBR/7ZSlXqLv4LEaAS8oL/I41lFhP
	 6emZEdySsJrp1L/L41obUbRI0Q2aTQwJCRANgKNLHyci7acwaJH8t7wTbUzoj89JlC
	 h/2gz5h1V4rXhMKUqYup5qMKtIGC815OLKk00bok=
Date: Wed, 26 Aug 2026 09:41:47 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Hui Zhu" <hui.zhu@linux.dev>
Cc: "Liam R. Howlett" <liam@infradead.org>, Alice Ryhl
 <aliceryhl@google.com>, Andrew Ballance <andrewjballance@gmail.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
 linux-mm@kvack.org, Hui Zhu <zhuhui@kylinos.cn>
Subject: Re: [PATCH] maple_tree: Annotate lockless pivot reads for KCSAN
Message-Id: <20260826094147.42e1e71e91a5a537ced30a21@linux-foundation.org>
In-Reply-To: <20260826074430.1139325-1-hui.zhu@linux.dev>
References: <20260826074430.1139325-1-hui.zhu@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Aug 2026 15:44:30 +0800 "Hui Zhu" <hui.zhu@linux.dev> wrote:

> In RCU mode, replaced maple nodes are marked dead and freed via RCU
> after the new node has been published.  Arming the RCU free writes
> node->rcu.next and node->rcu.func, which share storage with
> pivot[0] and pivot[1] (see struct maple_node), while lockless
> readers may still walk the dead node.  These stores therefore race
> with the pivot loads performed by the walkers.
> 
> This is harmless: the writer marks the node dead with an smp_wmb()
> before arming the rcu_head, and the walkers re-check ma_dead_node()
> after reading the node and restart the walk when the node is dead,
> so any pivot read that raced with the rcu_head stores is discarded.
> KCSAN cannot see this protocol and reports the plain accesses, so
> annotate the lockless pivot reads with data_race() through a new
> ma_pivot_rcu() helper.
> 
> Found by fuzzing on a 6.6 kernel; the race still exists on
> mainline.  No functional change intended.


Thanks.  AI review suggests that the patch is correct, but incomplete?

	https://sashiko.dev/#/patchset/20260826074430.1139325-1-hui.zhu@linux.dev
