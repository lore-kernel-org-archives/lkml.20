Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793387187;
	b=yKMPqg7enPXS3pI9CBO7U3ajdumz/E7XsQSWT8s00u2xgY9Z8dR9O40lQTJkPKWq8Pr7
	 ImaiIUsZuanmc6ps4lFJ8p+hDTRZCaRoAAoN1nN2JBUDTG+4h4PY+hjB8ZeHs25WCPLy1
	 yzZ622FVnu6z4dSHPNRfGS7oIcW+ulrtVplHHaWHvBpODYUUBOKJPsd1XmA6IgDitS46R
	 B8GWH/r2jCW2FXhUXtzVDTDUMjFdaRYZFdiPOG4ONMg18DHDpw2YGTpwcxkV65Ht9qgzz
	 6HgY3hzrJcpJJgUuyp4/p1xO9k9AGF6mKJfqL28A4/cwijeNw42XFr8YFQJjEEs2VQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793387187;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=P34PV8Gm+eH9EYncABOzzwaQjPvD79yWmom9r8Oz8AM=;
	b=Kw+7Oyyg8pLt6wXuHMSdOl+ZJifYEyA9SiXNtRS1MUvrkK+is62xJJVsAfxHWZhtlhCM
	 h4mMzSsSf+cGp1kqWIIOANOk6jJ/WygSd5pAVKgpAUGVjMw0pKsxN21VioDNpFul40wnO
	 keHyuFs+0nDdTA3nLwtEYntqm//kSjW5o1idCt7qh1p4394vM4ZXFN+wf8syKJXFfiEKc
	 Rp7OnyxH+BT5+bDmiedWBrXRyvdLhn17x8typlBOwlG+qeHM+7oUzTJudfaDYXI8/0Y0N
	 sNoK0pDT947jx3CcwWTP7b+tb7BPScDH549C3CHnOm1ftTgyTh8SkDuYTMzvRZcQ9Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=efENOTEs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABE4606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=efENOTEs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666C11F000C1;
	Fri, 30 Oct 2026 19:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793387186;
	bh=P34PV8Gm+eH9EYncABOzzwaQjPvD79yWmom9r8Oz8AM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=efENOTEsBtK2gX5ib4tCjhpG5DyOZiEQaiCmzyqXq4PCXRIDX1h3u/sp59LOUG5VZ
	 HA4iTppjwzs9nqIynwW3ktF0kkh2KSd79OVFDSh+Md/fCF8BXhexVXoPWKMJIjTGxw
	 4btgvHlY9mtYNmt/7uXFlttC0Wt9EF85qvQvGmLU=
Date: Fri, 30 Oct 2026 12:06:25 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, David Hildenbrand
 <david@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 kernel-team@meta.com
Subject: Re: [PATCH v2] mm: kmemleak: scan modified objects as soon as they
 are grayed
Message-Id: <20261030120625.c2aa64b3e6378a2e78f2f676@linux-foundation.org>
In-Reply-To: <20261030-kmemleak-gray-drain-v2-1-3ec29a96668e@debian.org>
References: <20261030-kmemleak-gray-drain-v2-1-3ec29a96668e@debian.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 30 Oct 2026 11:31:10 -0700 Breno Leitao <leitao@debian.org> wrote:

> kmemleak keeps reporting the guard page of a systemd-journald thread
> stack on Meta's debug kernels, even with min_unref_scans set:
> 
>   unreferenced object 0xffff88829a30ae40 (size 256):
>     comm "systemd-journal", pid 961, jiffies 4294814590
>     backtrace (crc 49b3881c):
>       kmem_cache_alloc_noprof+0x2ee/0x630
>       vm_area_dup+0x36/0x750
>       __split_vma+0xef/0x7d0
>       vma_modify+0x11c3/0x18a0
>       vma_modify_flags+0x1ea/0x2a0
>       mprotect_fixup+0x249/0x630
>       do_mprotect_pkey+0x531/0x820
>       __x64_sys_mprotect+0x7c/0x90
> 
> The VMA is still mapped. It was never faulted in, so it has no anon_vma
> and no file, and the only pointer to it is a slot in a maple tree leaf.
> The mm tree runs in RCU mode: every write replaces the leaf with a copy
> and frees the old one after a grace period. journald rewrites its tree
> every couple of seconds, while a scan on a large debug host takes many
> minutes, so the leaf kmemleak queued is freed before its turn, and the
> copy that replaced it was linked after its parent had been scanned.
> 
> The pass over modified objects is meant to catch such moved references,
> and the new leaf, being a new white object, does get grayed there.
> 
> But the gray list is only scanned after the whole object_list walk, and
> by then that copy has been replaced and freed as well. The confirmation
> scan has no such pass, so the miss repeats round after round no matter
> how many consecutive scans are required.
> 
> Scan the gray list during the walk instead, within a jiffy of an object
> being grayed. Do it from a variant of kmemleak_cond_resched(), which
> already pins the current object while the RCU read lock is dropped. The
> live leaf is then read shortly after the walk reaches it, before it can
> be freed.
> 
> Scanning the gray list after every grayed object made a full scan 41%
> slower (1.72s -> 2.42s, arm64 guest with lockdep) when the pass grays a
> million objects that do not point to each other. Scanning it at most
> once a jiffy keeps that at the baseline, leaves idle, file storm and
> mmap churn workloads unchanged, and still removes the false positives
> at HZ=100.

Thanks.  I'm thinking

Fixes: 04609ccc40c4 ("kmemleak: Reduce the false positives by checking for modified objects")
cc:stable

Agreed?

