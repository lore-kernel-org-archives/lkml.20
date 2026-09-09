Received: from mta0.migadu.com (out-69.mta0.migadu.com [91.218.175.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70332332615
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788988793; cv=none; b=UIqoP0f/cTyc54Q1TbFw+POUPGct8VP8hxWJWBL0rywj1ucN8BMyq5XGHldC2zMVmJYSO1G++PkdVOmv2GJGu148J0rPryOX2vle1Fw1dqPsFGDeamcyNNijcL13AG2DjMSnCJGxcGDn9Za5S2joyQ0I5KuNRaIv7rGGU+AgcDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788988793; c=relaxed/simple;
	bh=XRX7D5+qIu+nyobBVV27AMpjipKGZgLW7iTQSvfvVK8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qS7HiO91/FCIC4XiZwJ2XU4OxlbmaCa/cRhCxBUIBsBLDZv8hYO5hRjqhwNRjEOqHOq6svy+yTNAnYVwcng9sA5kz8jYdJjrxCLvEdg0YY9WqVPMwvDD9plQ8Uc7+xpaLYF943xeFEvmIOTA8PJA6gH/aC01H2+jco4OLiDs5iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aSKYqCH3; arc=none smtp.client-ip=91.218.175.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aSKYqCH3"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XRX7D5+qIu+nyobBVV27AMpjipKGZgLW7iTQSvfvVK8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788988787; v=1; x=1789593587;
 b=aSKYqCH3GTC3ZkA9rnSuBXpMT9VvRSIy1tBI0LP3LtsF4wyY51TBgSbzgIy11Ji7LSP4Wacw
 +hRrAzu//qgIeDGvQU8BUMsoC+7Gv0NvIdV5Bwm27zpNGYut2kPwI34Jl1E7MtVdbx5CK4bcCGi
 PiRE67B3tq3U44seP6UzKGY8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 809fffd4d1b542f4;
	Wed, 09 Sep 2026 21:19:37 +0000
X-Mizu-Trace-ID: 809fffd4d1b542f4
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: "Patrick Lu (Anthropic)" <perf.patrick.lu@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,  Christian Brauner
 <brauner@kernel.org>,  Jan Kara <jack@suse.cz>,  Tejun Heo
 <tj@kernel.org>,  "Matthew Wilcox (Oracle)" <willy@infradead.org>,  Andrew
 Morton <akpm@linux-foundation.org>,  Dennis Zhou <dennis@kernel.org>,
  linux-fsdevel@vger.kernel.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH] writeback: bound cleanup_offline_cgwb() rescans by
 rotating b_attached
In-Reply-To: <20260909-wb-cgwb-rotate-v1-1-f2eb994d2a46@gmail.com> (Patrick
	Lu's message of "Wed, 09 Sep 2026 18:50:27 +0000")
References: <20260909-wb-cgwb-rotate-v1-1-f2eb994d2a46@gmail.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Wed, 09 Sep 2026 21:19:32 +0000
Message-ID: <7ia4fqzijf6j.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Patrick Lu (Anthropic)" <perf.patrick.lu@gmail.com> writes:

> cleanup_offline_cgwb() prepares at most WB_MAX_INODES_PER_ISW inodes
> per call and is called again until the dying wb is drained, but every
> call walks wb->b_attached from the head. Inodes already prepared (they
> stay on the list with I_WB_SWITCH set until the switch worker runs) and
> inodes that cannot be switched (I_FREEING, I_WILL_FREE, !SB_ACTIVE,
> DAX, already on the target wb) stay at the head, so each pass rescans a
> growing prefix under wb->list_lock and a full drain is quadratic in the
> number of attached inodes. With ~17M inodes attached to one dying cgwb
> we have seen this end in soft lockups, with CPUs reported stuck for
> 21-48s.
>
> Move every scanned inode to the tail of b_attached, so the next pass
> starts where the previous one stopped and the drain becomes linear.
> b_attached is unordered and isw_prepare_wbs_switch() is its only
> walker, so nobody else sees the reorder. b_dirty_time is ordered by
> expiry for move_expired_inodes() and keeps its current scan.
>
> Fixes: c22d70a162d3 ("writeback, cgroup: release dying cgwbs by switching attached inodes")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Patrick Lu (Anthropic) <perf.patrick.lu@gmail.com>
> ---
> Seen in production on a 6.18-based kernel: with ~17M inodes attached
> to one dying cgwb, a node spent 36 minutes in back-to-back
> wb->list_lock holds by the cleanup scanner (~6ms each, ~46% of wall
> time, starving writeback on that wb); with this patch the same workload
> drains in ~30 seconds. Also seen on stock Amazon Linux 2023 6.12.68 as
> isw workers spinning on the list_lock in inode_switch_wbs_work_fn()
> while cleanup_offline_cgwbs_workfn() runs.
>
> Tested with a QEMU A/B setup at 100k attached inodes and patched vs
> unpatched on production-class hardware at ~17M attached inodes.
>
> Josef Bacik's patch making the drain loop report a Tasks-RCU quiescent
> state [1] fixes BPF/ftrace detach stalls behind the same drain; this
> patch bounds the walk itself. The two are independent.
>
> [1] https://lore.kernel.org/linux-mm/20260909-cgwb-tasks-rcu-qs-v1-1-967a7754771f@toxicpanda.com/
> ---
>  fs/fs-writeback.c | 39 ++++++++++++++++++++++++++++-----------
>  1 file changed, 28 insertions(+), 11 deletions(-)

Acked-by: Roman Gushchin <roman.gushchin@linux.dev>

Thanks
