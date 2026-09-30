Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68954BB26B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790811994; cv=none; b=hUdMIemFZsSdWfec3IHGl2H5pVgOTPeQZmx5YQVoP6ToGBtWn055CHXjfzh3e4DHsnF5ewYJd2gKHFNt3eMvtW9zMAtKOCCTa0lGkiRk13XMH0gveKNXP/mOPqxyaJyibJMoSUib2HWL4bXbhf26nIVN7sADCqkGoI2DHBIFxQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790811994; c=relaxed/simple;
	bh=hRZU/NARpk17J1elQpt+Ix3CsF/eukczAgMSprZWXok=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=W1EPcURzxo2ZalXix7MSP5XSW6nTfa/1I+U3YdeR8iofRKLnKGD3eZmrWO/sWbvsnWEYC1xxJ6/rzUpojHuYeH9bR9J5e65nyL2MOTxKUIRrnlKztPCqbu7rGHmfNwXDRsqBE4PE9r8R/7o32vdSJusGM/0CXHKmNGe2cn8Mxn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dCl3evOG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dCl3evOG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7AA1F000FF;
	Wed, 30 Sep 2026 23:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790811992;
	bh=DhQGe+RD+fiFkRmm1C/pXVjw/6OQ02jTbbVvy16bHsU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=dCl3evOGSEmQqqbpP8nVEYUZD57g8vXRpyjRb742VDor14VGCaX3XxbgTizPHqgeU
	 9S4l6sLZSg6Rqqf7bz867wLT9RqO6NUwsgwIBbrxSm7ve0Gex1suI4GVzThhE1wUD+
	 fnrAhjq9ziMf6pPpkWADQ0xTF3JfRCjS7wvJwoQU=
Date: Wed, 30 Sep 2026 16:46:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Chris Down <chris@chrisdown.name>
Cc: Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, Kairui Song
 <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham
 <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Barry Song
 <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, Ying Huang
 <huang.ying.caritas@gmail.com>, Kelley Nielsen <kelleynnn@gmail.com>,
 Vineeth Pillai <vineeth@bitbyteword.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH] mm: Make swapoff interruptible when unusing mms/shmem
Message-Id: <20260930164631.0468fb0caa7e47f60c9a1a9d@linux-foundation.org>
In-Reply-To: <ar2YlFYjYUZ49ZA5@chrisdown.name>
References: <ar2YlFYjYUZ49ZA5@chrisdown.name>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 1 Oct 2026 01:17:40 +0200 Chris Down <chris@chrisdown.name> wrote:

> try_to_unuse() only checks for a pending signal between mms, and
> shmem_unuse() doesn't check at all. That means that once swapoff gets to
> a process or a shmem file with a lot swapped out, nothing can interrupt
> it until every last page of it has been read back in.
> 
> Just as one example of where this can concretely show up, freezing tasks
> for suspend or hibernation has to wait for swapoff to notice the
> freezer's fake signal, and gives up after freeze_timeout_msecs (20
> seconds by default).

(cc Rafael)

> Here's a facetious example where one swaps out 2GiB of one process to a
> swap file on ext4, starts swapoff, and half a second later tries to
> freeze with pm_test=freezer. Writing to /sys/power/state then fails with
> EBUSY and this in dmesg:
> 
>     Freezing user space processes failed after 20.003 seconds (1 tasks refusing to freeze, wq_busy=0):
>     task:swapoff         state:D stack:0     pid:3175  tgid:3175  ppid:2955   task_flags:0x400100 flags:0x00000419
>     Call trace:
>      [...]
>      io_schedule+0x44/0x70
>      folio_wait_bit_common+0x1ec/0x3d0
>      __folio_lock+0x24/0x40
>      unuse_pte_range+0x2d0/0x348
>      unuse_vma+0x158/0x248
>      unuse_mm+0xfc/0x150
>      try_to_unuse+0x104/0x3f8
>      __do_sys_swapoff+0x220/0x5d8
>      [...]

ugh.

> The same goes for anything else that wants swapoff to stop, like an
> admin hitting ^C in a panic, of course.
> 
> Prior to commit b56a2d8af914 ("mm: rid swapoff of quadratic complexity")
> try_to_unuse() was driven by find_next_to_unuse() which checks for a
> signal before every entry, so let's restore that behaviour.

So things were all good before that change?

> Just as an example of the improvements, here's how long freezing takes
> in the same test while swapoff is happening on my computer:
> 
>                       before                  after
>     400MiB anon       8.925s                  0.028s
>     400MiB shmem      1.639s                  0.003s
>     2GiB anon         failed after 20.003s    0.011s
> 
> Fixes: b56a2d8af914 ("mm: rid swapoff of quadratic complexity")
> Signed-off-by: Chris Down <chris@chrisdown.name>

This sounds like a significant usability regression.  Should we
backport this?

otoh, it's been this way since 2019, so presumably nobody cares much?
