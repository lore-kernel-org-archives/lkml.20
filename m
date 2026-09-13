Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842D437DE9B
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789285911; cv=none; b=e4iifi3E7gnF3059NvpYbWwElY8yMoMwW5hUqK7jLJ56JMXvMb0ITrKCPOWTEAdNBWHCVffq6r62LaIQdJU+2bAt62WVCgRpTY9McsdNFu51RCaQias2qwWrgWEwGmTGbPvURk9HkXSYPSnFdyRUOoS8xRh9Ae+MjKYSHWN1S38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789285911; c=relaxed/simple;
	bh=H1wNYbgjBI4ZF1ohoP+9bbwleo/XDUW7wgfKrHbd3Rw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=A18wXygmTPF1/vKfouuhm3qsPmuMO1xXcmZfqKA6M2R00IvDMk7LWs+vdKSq0FZKb/WHWjV450n1DYMHmH6ovlydxWd1L164goDGVtoT1w3IgQjFtq999KUommQNYruloD7TgLUZFq0Y6XvRqMhXuC8CAuRpSgpus3u+oE6WLSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=uxwBBs63; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="uxwBBs63"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CFB31F000FF;
	Sun, 13 Sep 2026 07:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789285909;
	bh=aOrXo3SB588cxrCHrTPRWSuBXcYnG2yUhEN0rKu7bVE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=uxwBBs63QYfX9q9Q+laXRdgI9HZDS7j1HcLVOBEDfGQk4vNQLhDbHP6jblsOFwMM3
	 l6zndEnCSF9c7pi2CQyxGstu8rhJHSbE8omXSak+0g3+ndGIolZL4lWbHMG/AugVc7
	 PK/Ro6cYPxWBAuffimQzFsx5e5GqKVdp0U38Dq3o=
Date: Sun, 13 Sep 2026 00:51:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: hannes@cmpxchg.org, yosry@kernel.org, nphamcs@gmail.com,
 chengming.zhou@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 kasong@tencent.com, chrisl@kernel.org
Subject: Re: [PATCH] mm: zswap: return -ENOENT when the swap device is gone
Message-Id: <20260913005149.a28c21aaca165fa0255f8475@linux-foundation.org>
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
> 
> ...
>
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -998,7 +998,7 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
>  	/* try to allocate swap cache folio */

Comment was always lame ("say why, not what").  It now seems flat out wrong?

>  	si = get_swap_device(swpentry);
>  	if (!si)
> -		return -EEXIST;
> +		return -ENOENT;

mm-new has changed.  I made this


	/* try to allocate swap cache folio */
	si = get_swap_device(swpentry);
	if (IS_ERR_OR_NULL(si))
		return -ENOENT;

