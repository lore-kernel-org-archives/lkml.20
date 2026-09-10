Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3EF4BFE8A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789004475; cv=none; b=nu1qzBve0lpHLgxIaqU0pwBEt6x67Pdd6zwej9ZL6sV82eX5fMUgqrWCk6eKZpO5Bclnm6yco71N0gX/ciAlF+x5BXWYA0MLDOxA2ho/rhI/IlSybkypZvfEX4zreJ2ielWnkag0bpNS5MKhScDsdjUX2QAiRg4d+qImuc6NBOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789004475; c=relaxed/simple;
	bh=ya9fTQF0ooVBrstV4wYhs3vnPwcFbrtNMA43cuJBI3I=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=b/qMOsFg2xrWRZqbPBR0Q81PpMdHcnh+Sp1my1pHJ6LeImn/oVA4+Hlqf+KYXnzvs6g3UmigfXOwT4LeYP8nyeB+HKVfR8IIfjucScG5vT3/Y/3i6lmwp8usNOC2vmoi731OEvM2woEJxpXP07BzraBzRNMY3y/7GoEfthM0Ojw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=alyW9fFP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="alyW9fFP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28D71F000FF;
	Thu, 10 Sep 2026 01:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789004473;
	bh=IaUHZEF7BQPMLgknLj3GrbaY0NGvoQ5+kD0LNy89SEY=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=alyW9fFPbFHJkcFRl88y+lq4YdOfV/i9oN4x19TZI9gz4nV9F7z6MOzVmWToQ7EW3
	 ZEJ9kM96Hi51+2BgzV+T5/WTnS3GMjB+9GjLz85GdDy0sEuDIUejTpa/wPCHyjTOsL
	 2ReuFogFXb9wI1CLgYpdws+225+/5xt78yoUZqPCPACzgd3M84+bXdvEUE955gcvHe
	 0W+swggrvXXTN3yaYMRP6jULmEXwm+14D5EeJhEmhZGRL0fLBTjzUmW5Cm0mGl9/Ow
	 kvN2fgpw3bPikh92KySRIl1O81vvubbP/9GYp9pZUZc+h/aRWfkpyRv/dmg39Z5a3n
	 6utRZPvcV71tA==
Message-ID: <f5da23a3-7cd2-41dc-b28e-41118cf113e5@kernel.org>
Date: Thu, 10 Sep 2026 09:41:11 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix livelock in syncing dirty inodes
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20260909190636.3151580-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260909190636.3151580-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/10/26 03:06, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> During checkpoint, f2fs_sync_dirty_inodes() and f2fs_sync_inode_meta()
> iterate over dirty inodes in their respective lists. If igrab() fails on
> an inode (e.g. because it is in the freeing state), the loop continues
> without moving the current inode to the tail of the list. As a result,
> subsequent iterations pick the same inode repeatedly, preventing other
> ready dirty inodes in the list from making forward progress and leading
> to a livelock.
> 
> Fix this by moving the current inode to the tail of the list
> (list_move_tail(&fi->{dirty_list,gdirty_list}, head)) before attempting
> igrab() in both f2fs_sync_dirty_inodes() and f2fs_sync_inode_meta().
> 
> Additionally, if igrab() fails, yield the CPU with cond_resched() to
> allow the evicting thread to finish eviction. Remove the redundant
> f2fs_submit_merged_write() call, since .writepages already submits cached
> bios via f2fs_submit_merged_write_cond().
> 
> v2:
> - Also apply list_move_tail() to f2fs_sync_dirty_inodes().
> - Remove redundant f2fs_submit_merged_write() calls from both functions,
>   keeping only cond_resched().
> - Update commit title and description.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
