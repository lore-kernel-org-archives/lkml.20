Received: from mta0.migadu.com (out-155.mta0.migadu.com [91.218.175.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5048E3E557A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789367279; cv=none; b=f+w31ChMbJ1OtJ2pwHHnZzWWLyb3bLMO3QuNsoRczji6ozm79IzCXqEuPZoeIB2SCvQ4r4MaGaoqGeQcdkMcNX/1j2sUjpnv/3TKuHCyVrbKegq0PQop8E3XkP1Sf1JIk0sSNm7qHvh0XEIYTa3aejYTLGn7Cs1dobRwb9gEufA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789367279; c=relaxed/simple;
	bh=djNIl/KI66JahUpFMSuKlhJQe7ZFtgYzMuSNU7iNmpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vCJkD+wNBVUg6sqKlnT67gu4cvKT2vfbRTMVbgrqpiJUIvmXLqPH3Ngh8yWx1nwwoPPT7Ovse+yZD6GuDwNzjaog+yrxSBzYN7uJyAE9GuJYBl53pLFozT3pCI1ZlF8Hpm+44XWYHfSCzByb+JqkqDVE5OTnZYEYr1aRQWVvNl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OwWlXJDt; arc=none smtp.client-ip=91.218.175.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OwWlXJDt"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=djNIl/KI66JahUpFMSuKlhJQe7ZFtgYzMuSNU7iNmpY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789367270; v=1; x=1789972070;
 b=OwWlXJDt7sfSLhJLsxHmFJEce+o+jumojbBilsHuNLqw8QX3jz0sPeP2uelItj1kNB7HVWsH
 Tc1eiXsXaAhLHDO03RCDr5yOGbSAxiK6t2Jo3fJvhwO/NZCHjSOjAILbif5e+cnsiZTckeV2bCP
 XW+F+bW4H6GtcfZf5ZkrfsSs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 9725185ab10d7887;
	Mon, 14 Sep 2026 06:27:40 +0000
X-Mizu-Trace-ID: 9725185ab10d7887
X-Migadu-Flow: FLOW_OUT
Date: Mon, 14 Sep 2026 14:27:28 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <hebaoquan@kylinos.cn>, hannes@cmpxchg.org, yosry@kernel.org,
	nphamcs@gmail.com, chengming.zhou@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kasong@tencent.com, chrisl@kernel.org
Subject: Re: [PATCH] mm: zswap: return -ENOENT when the swap device is gone
Message-ID: <aqeT0FkVptyVLaDV@fedora>
References: <20260913063031.1689420-1-hebaoquan@kylinos.cn>
 <20260913004831.884d37afd92249d763b7f1da@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913004831.884d37afd92249d763b7f1da@linux-foundation.org>

On 09/13/26 at 12:48am, Andrew Morton wrote:
> On Sun, 13 Sep 2026 14:30:31 +0800 Baoquan He <hebaoquan@kylinos.cn> wrote:
> 
> > zswap_writeback_entry() returns -EEXIST when get_swap_device() finds no
> > device.  -EEXIST is the shrinker's "page already in swap cache" signal,
> > which makes zswap_shrinker_scan() stop shrinking entirely.  A NULL
> > get_swap_device() instead means the device is being swapped off, so the
> > entry is simply stale.
> > 
> > Return -ENOENT so the shrinker skips the stale entry and keeps scanning.
> > Independent of xswap; affects all swap devices.
> 
> I'm struggling to understand the userspace-visible runtime effects of this.
> 
> I see that reclaim will prematurely abort, but is this a once-off thing
> which will resolve on the next reclaim attempt, or will the reclaim
> failure persist for a significant period?

Not a one-off, and not permanent either: it lasts the whole swapoff.

Assume I have two swap disks. zswap is enabled. By default 20% of RAM is
the zswap upper limit. So now if I swapoff /dev/vdb, at the same time
reclaimer call shrinker to writeback, -EEXIST makes shrink_memcg_cb()
return LRU_STOP, which ends the shrink pass right there. get_swap_device()
returns NULL for an entry whose device is gone, so every such entry still
on the zswap LRU stops a pass where it stands. The pool gets almost nothing
written back for the length of the swapoff.

# swapon
NAME     TYPE      SIZE USED PRIO
/dev/vdb partition   4G   0B   -1
/dev/vdc partition   2G   0B   -1

The entry is rotated before writeback, so later passes get past it. It is
a throughput collapse, not a deadlock.

static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_one *l,
                                       void *arg)
{
	......
	list_move_tail(item, &l->list);
	......
	writeback_result = zswap_writeback_entry(entry, swpentry);
	......
}

I can't reproduce it now. And I forget how I met this, just did too many
tiems of testing and code change. this probably comes from reading the
code. So this may be a logic bug that rarely happens rather than a easily
seen regression.

Thanks
Baoquan

