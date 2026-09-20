Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8323E00B5
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 20:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789934675; cv=none; b=DVCew2axusizU4KoXLMd54fzJUi+08WNQA3K4kQs95aPFyxGoAurEdv245IUkI+NwZci5vqihTIkOvprPFMq7MNtWb1M3h55MusCNjCVS6lDS5SC5EdXPhG1840v3ibScfeDJWs3HumHNyXVDb/yFSuu3CjmII4Hsr6gZIunP6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789934675; c=relaxed/simple;
	bh=Tsvc18uCAMPOrV/+2eV8YNbcdfa6iTH6rmS/RYt5o20=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=nzFCfLP8aBN9+jPDWkb4qRaUyxiUCX8l4SOIdY75XW39CbebX2oDmiruMxTwC0/VBGTUdyw3+xRQ4MpucPfpIvvWzX+oA+HHgTMUKRSw478fXN1tjVHZ6ZnO/jTVZ2mwEVBWhVBofRlO/0V2IWQJmusTTUvflkbdRKJo7Ua508c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FDAO02Mx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FDAO02Mx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FFD1F000FF;
	Sun, 20 Sep 2026 20:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789934673;
	bh=o7lwH/Oayopk1bBErSILDmV08l5E3TMFEPmonG2OoWU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FDAO02Mx0HtPRCxykwrJgCGrawrT62ethZkSD5daCtas+MWayyXsKOqrAWzJz7Axa
	 6EQLO39T6Ni5s3XCof88Rz9MRzs1kJhNr37Xx+nRCElWDvpV4tFMGRSnWP4R3VMSPG
	 07a8eUb8kI+owgL+H4a53NrGsc9z1qRfLTKGFM/s=
Date: Sun, 20 Sep 2026 13:04:33 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Carlier <devnexen@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, kasong@tencent.com, bhe@redhat.com,
 chrisl@kernel.org, baohua@kernel.org, nphamcs@gmail.com,
 shikemeng@huaweicloud.com, hughd@google.com, baolin.wang@linux.alibaba.com,
 syzbot+23b25ba3c6bf971f9c57@syzkaller.appspotmail.com
Subject: Re: [PATCH] mm/shmem: don't release a swapin-error marker as a swap
 entry
Message-Id: <20260920130433.7c68761144a2a63e2ce32bb4@linux-foundation.org>
In-Reply-To: <20260920155002.1030454-1-devnexen@gmail.com>
References: <20260920155002.1030454-1-devnexen@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 20 Sep 2026 16:50:02 +0100 David Carlier <devnexen@gmail.com> wrote:

> A failed shmem swapin

from -EIO, for example.

> frees the swap slot and leaves a PTE_MARKER_POISONED
> entry in the page cache. On truncate or eviction shmem_free_swap() passes
> that marker to swap_put_entries_direct(), which warns because it is not a
> swap entry. There is nothing left to release either way.
> 
> Skip the release for non-swap entries, as every other caller already does.
> 
> Reported-by: syzbot+23b25ba3c6bf971f9c57@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=23b25ba3c6bf971f9c57
> Fixes: ac2d3268284b ("mm/swapfile.c: remove the unneeded checking")
> Signed-off-by: David Carlier <devnexen@gmail.com>

I guess we should backport - errors can happen and WARN can crash
machines.  What do others think?


