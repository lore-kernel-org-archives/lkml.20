Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204953;
	b=Vs+qq2a8Ld3sTgVXIBbkXWNuw4OUirRkw/hHa86OG44QuEqplb6RGtdUIHc5YFJQU7ik
	 ccEsXrJdYUZcGtuqf+UTICM+PWBZqlKA0tP2oPKD2E7oMDcm1brUwRpZObZjGyA3F/WB9
	 oxVaQkEoq7+iN2CxrhdlV16RVo3TRvYs7B/vD6+Z3HEv5cmYehAPTdX9xWnPMffUpudEz
	 DC3+igjW+tSLRvPYyt4qNFA02ouyDsRX7o6task5bo+Qf67apevGuUh9wJO7BLM63Bfud
	 UCEXZl1+Jcak+VzWJLEVB5MoA67HJsnOjaZaiuIYyiOdvOZdi83tmADI7yzOYoTBpPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204953;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6cnuEJnvW6lfgAkxwp5j4btXtUzOXabWpPgzUeOVG40=;
	b=qeQMKy1JMz/1gZUVPitzBqwHsZKF5IbnhDO6W1xLraQYnvgPabksHT+oSxlQceegsh4r
	 IQr0cmTLNOKqraDf5wWl4IfUIyg9lUBjd9/FPkMetDQVUvZrX+3IFBeppB5lIIXC6J/ma
	 1N7ZyW/r9QGMtZforvFNrniZla/tXn+xLwuKDO9g0VDvD4ZFLUtxWbZgyqw6ENcMfSGK/
	 CZZ1BBY/LqLk/LjwdpGiC5SgsQfda4840KATzC/4x+JnuuwiHk2RU3npB8CyAtehNkuui
	 nZyJmbCRBbBM1yGVcx+YnupvOMDJM0c7DpS5pTbRe6/Od/rf+EMbycpdqK5k1/7bseg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TlkAUAYv;
	arc=none smtp.remote-ip=95.215.58.136
Received: from mta1.migadu.com (out-136.mta1.migadu.com [95.215.58.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4B9606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB4B9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TlkAUAYv
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=euyNRM4nzOyoMOPvqz19w86AtMhDDtspYlJVh4lVawE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794204950; v=1; x=1794809750;
 b=TlkAUAYvdtdt++B68DPxUwN7wGxgseOvJ/3q4RMTzqJRH+LWnuIaHWf6QhhrDXso2jIHcWXr
 EqyDuaSYqOeb4FQM6BMVrqlQQtK/RpLMTkA9EgwsbcvkmolDa92PvIckOPcgDZg0lzLSTvMen15
 6a/7fkm41fNoWOCqQOAOZAjY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 1d173c1a73d69c8c;
	Mon, 09 Nov 2026 06:15:49 +0000
X-Mizu-Trace-ID: 1d173c1a73d69c8c
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 14:15:38 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org, david@kernel.org, chrisl@kernel.org,
	kasong@tencent.com, nphamcs@gmail.com, baohua@kernel.org,
	youngjun.park@lge.com, corbet@lwn.net, hannes@cmpxchg.org,
	chengming.zhou@linux.dev, kunwu.chan@gmail.com,
	klarasmodin@gmail.com, linux-kernel@vger.kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: Re: [PATCH v5 00/19] mm, swap: extendable swap devices (xswap phase
 I)
Message-ID: <avFlClZec9mNayjd@fedora>
References: <20261109055455.536925-1-baoquan.he@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109055455.536925-1-baoquan.he@linux.dev>

On 11/09/26 at 01:54pm, Baoquan He wrote:

Forgot adding change history versions before v4, please refer to below
v4 patchset cover letter if you want to check.

[PATCH v4 00/14] mm, swap: extendable swap devices (xswap phase I)
https://lore.kernel.org/all/20261003003136.750633-1-hebaoquan@kylinos.cn/T/#u

> Changelog
> =========
> v4 -> v5:
> - Rebased onto the latest mm-new (2c5dafa7f289). 
> 
> - A device now has a stable id instead of exposing the swap type:
>   /proc/swaps shows xswap<id>, the debugfs file is named by the id and
>   prints the type as well, and destroy takes the id. The id is assigned
>   per boot and never reused, so a value read earlier cannot name a
>   different device.
> 
> - swapoff accepts the name: swapoff xswap<id> and swapoff -a tear the
>   device down, while a real file or directory keeps precedence. A name
>   that does not exist reports -ENOENT; the sysfs destroy keeps -ENODEV
>   for an id it does not know. The interfaces are now documented in
>   Documentation/ABI/testing/sysfs-kernel-mm-xswap and zswap.rst.
> 
> - CONFIG_XSWAP_DEFAULT_MAX sets the default size of a new device. It
>   takes a percentage of RAM, a size, or "max", and defaults to "200%";
>   xswap.max= still overrides it.
> 
> - The cluster_info accesses are RCU-safe: the allocation fast path bounds
>   a cached cluster against the mapped range, and the shrink drains the
>   per-cpu cache and waits an RCU grace period before unmapping.
> 
> - xswap_grow() now links the clusters it mapped even when swapoff has
>   already cleared SWP_WRITEOK, so a failed swapoff cannot leave them
>   mapped and on no list.
> 
> - swap_info_remove() skips the commit limit probe for xswap; real swap
>   devices keep it. See the overcommit note above.
> 
> - The cgroup zswap gate is checked again after the allocation when an
>   xswap device appeared after the initial lookup, so a slot is not kept
>   for a cgroup that cannot zswap.
> 
> - The patches are reorganized: the VM_SPARSE work is split into helpers
>   and the xswap use, the max/pages widening moves before the sysfs
>   interface, the shrink trigger now carries the workqueue deferral, and
>   the unmap helper is prepared for range shrinking in its own patch. The
>   series is now phase I of four, with the swap-table backend records as
>   a phase of their own.
> 
> Baoquan He (18):
>   mm, swap: refactor free_swap_cluster_info to take swap_info_struct
>   mm, swap: add VM_SPARSE cluster-array helpers for xswap
>   mm, swap: use a VM_SPARSE cluster array for xswap devices
>   mm, swap: widen swap_info_struct max/pages to unsigned long
>   mm, swap: add a sysfs interface to create xswap devices
>   mm, swap: refactor swapoff and add xswap_destroy
>   mm, swap: require zswap for xswap devices
>   mm, swap: use a stable id for xswap devices
>   mm, swap: let the command line set the xswap device size
>   mm, swap: add CONFIG_XSWAP_DEFAULT_MAX
>   mm, swap: let swapoff destroy xswap devices by name
>   mm, swap: add xswap grow trigger on cluster allocation
>   mm, swap: add debugfs counters for xswap
>   mm, swap: make xswap cluster_info accesses RCU-safe
>   mm, swap: prepare xswap_unmap_clusters for range shrinking
>   mm, swap: add xswap shrink trigger and defer it to a workqueue
>   mm, swap: do not give an xswap slot to a cgroup that cannot zswap
>   mm, swap: skip the overcommit probe when removing xswap
> 
> Chris Li (1):
>   mm: xswap support for zswap
> 
>  .../ABI/testing/sysfs-kernel-mm-xswap         |   43 +
>  .../admin-guide/kernel-parameters.txt         |    8 +
>  Documentation/admin-guide/mm/zswap.rst        |    9 +
>  MAINTAINERS                                   |    1 +
>  include/linux/swap.h                          |   17 +-
>  mm/Kconfig                                    |   20 +
>  mm/page_io.c                                  |   19 +
>  mm/swap_state.c                               |    9 +
>  mm/swapfile.c                                 | 1569 +++++++++++++++--
>  mm/zswap.c                                    |   11 +-
>  10 files changed, 1593 insertions(+), 113 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-kernel-mm-xswap
> 
> 
> base-commit: 2c5dafa7f289d760f4492260b0988029aab478b0
> -- 
> 2.54.0
> 
> 
