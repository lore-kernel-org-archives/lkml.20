Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3D69463
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789285714; cv=none; b=Hl10zivuiHXOlNFt+w9pMwUCQum1BxlGCXfuDAC3P6krv+rU2MUH+yPrIZocJCK7WTs3380Wx7zSX6BUEvytOEQ59NIERG9MrGowheu3q6gmR0BVMq+uUlHq0sU02ubIuM51dCMjkOJ+SXQ20KnrVkunV0BaXLJZ6n0FZ69Qa/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789285714; c=relaxed/simple;
	bh=b5QmrmWiPjuBwlLb+PYJwvKbkv/GDPkI77vpDJcWD90=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=R6Y5IO0eMxj0CDruURy9YykpLoBkXamVt2V+IzorifbaK0ZusnPi8q1/Xkh6PKK/Nr1XkvKN/Iz7tzghYEu7o2xoYw7CA+3Ykctpd084cGoKT5jwK+M5LSU7V6nBBXjPJXUi5t8e8G9yKEBhyFEkjIy2jgOUZj+jsJXNCt7fpUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AQUAf4uF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AQUAf4uF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527F81F000FF;
	Sun, 13 Sep 2026 07:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789285712;
	bh=qbTN56aFJwoSV1zh3LBt3rCv31f9RqWhm969uraW4/k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=AQUAf4uFkNStZ1Tb45HwVwL+jD4BDOL1WJROlgROMNZxvnKJ+C58K3zQn90022Z22
	 5YKPPtJJ4vXOvkJPPwHpKa2lcbBb03d0cwLGDwnpOZwAwUjItS07Q3ueELNy/b7JNp
	 Ac3EM806qvU69cwSlSAGYkBY7fvEsup5fnuhlPig=
Date: Sun, 13 Sep 2026 00:48:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: hannes@cmpxchg.org, yosry@kernel.org, nphamcs@gmail.com,
 chengming.zhou@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 kasong@tencent.com, chrisl@kernel.org
Subject: Re: [PATCH] mm: zswap: return -ENOENT when the swap device is gone
Message-Id: <20260913004831.884d37afd92249d763b7f1da@linux-foundation.org>
In-Reply-To: <20260913063031.1689420-1-hebaoquan@kylinos.cn>
References: <20260913063031.1689420-1-hebaoquan@kylinos.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 13 Sep 2026 14:30:31 +0800 Baoquan He <hebaoquan@kylinos.cn> wrote:

> zswap_writeback_entry() returns -EEXIST when get_swap_device() finds no
> device.  -EEXIST is the shrinker's "page already in swap cache" signal,
> which makes zswap_shrinker_scan() stop shrinking entirely.  A NULL
> get_swap_device() instead means the device is being swapped off, so the
> entry is simply stale.
> 
> Return -ENOENT so the shrinker skips the stale entry and keeps scanning.
> Independent of xswap; affects all swap devices.

I'm struggling to understand the userspace-visible runtime effects of this.

I see that reclaim will prematurely abort, but is this a once-off thing
which will resolve on the next reclaim attempt, or will the reclaim
failure persist for a significant period?

