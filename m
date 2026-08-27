Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7050E29B79B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787803876; cv=none; b=S1kIxzyRAy6i7rj6RV8YTmBLuSGsJNrEgy/xTeGJ0/JTIT+bj6HDzu6X8kl/0Vnh3fbypJNex8sY28fSW+3HOFn5lvDqGKKbm/3N2dCMQPZf+9ZujO3BfugQwloJwyEvel8Ne7mLUgqTvsrE0qVg1+HY1c4/gyJmNIV8tw54U6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787803876; c=relaxed/simple;
	bh=cL9x6Pd5g4ypYhwSfC1QHJU86Y71iXecsHAlMHgRVOI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=RVOD6sgpndDs7DEmfpjp4pR8tbqcQs4yKUJb9xzW8tLWzTGeJdcxN9TKJDSOnJ4JqX85KZeTyOTEtzd2CTVNf2/yqfbZlJdEgxbl7bjy48xaw2AHotDhDYJOOJab33Dgt1YU5GgVtHZyivJiUrujwMdx3Ajom2LraDiGFbZ6HDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Az50jHWP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Az50jHWP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67651F000E9;
	Thu, 27 Aug 2026 04:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1787803875;
	bh=TckfMnyGR0QCFTyUeCahI52REXoUQAOwubXzvRhQ4gs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Az50jHWPmNGAf+1eO7jEzdxff10EYwWZxfaDfuitiEb0pKgsZOnu0iaj75hCSubdL
	 M8Fcal1LsD+PvuTbl4EzeY/baHFhuZu+rLA6Q8AV27gD36tgxJB1PGrRFo3FqD5ejI
	 isGkPvnqImF+bW1v8iRHmb3peI81x0Xs2H1qDgXs=
Date: Wed, 26 Aug 2026 21:11:14 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>, Al Viro
 <viro@zeniv.linux.org.uk>, NeilBrown <neil@brown.name>, Manfred Spraul
 <manfred@colorfullife.com>, Jan Kara <jack@suse.cz>,
 linux-kernel@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH] ipc/mqueue: release notification resources during inode
 eviction
Message-Id: <20260826211114.69f01811929877dc73f41914@linux-foundation.org>
In-Reply-To: <20260824042359.925145-1-4ncienth@gmail.com>
References: <20260824042359.925145-1-4ncienth@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 Aug 2026 13:23:59 +0900 Daehyeon Ko <4ncienth@gmail.com> wrote:

> mqueue_flush_file() removes an mq_notify() registration only when the
> closing task belongs to the thread group stored in notify_owner.
> 
> A task in a separate thread group created with CLONE_FILES can register
> SIGEV_THREAD notification and exit without closing the shared file table.
> If another thread group then unlinks and last-closes the queue, ->flush()
> skips the registration and inode eviction loses the only pointers to its
> resources.
> 
> The orphaned registration permanently retains the notification skb, its
> netlink socket, a pid reference and a user namespace reference. An
> unprivileged process can repeat the sequence with new queues and sockets.
> 
> No inode users remain during eviction. Remove any stale registration there
> after dropping info->lock, since netlink_sendskb() may release the final
> socket reference.

Thanks.

> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org

Pity the poor -stable maintainers (and others downstream from them)
wondering "why was I sent this".

To answer this, please, in all bugfix changelogs, provide a concise
description of the userspace-visible runtime effects of the bug.

I asked Gemini that exact question and was told

  This bug creates an unkillable kernel resource leak by failing to
  free netlink socket, PID, and user namespace references when a POSIX
  message queue is evicted.  An unprivileged process can exploit this
  leak repeatedly to cause kernel memory exhaustion and lead to a
  Denial of Service (DoS).

which I'll paste into the changelog.

> Assisted-by: LLM

OK ;)

> A reproducer and regression selftest are available on request.
> 
> Tested on x86_64 KASAN at the stated base. The unpatched oracle reproduced
> 3/3 and the patched oracle passed 3/3, with no KASAN report, WARNING splat,
> Oops or panic.

Useful info, thanks for including.


