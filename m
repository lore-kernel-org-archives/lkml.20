Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3008D522EFE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917188; cv=none; b=jflxB9MS8d21NlFhrWFUazCQ/6zqZI0Sqs/3WPTKOVebmXwY0Qgni6b8Vx025P0T8Y+fHs3IB0UNq9A9k45nes5F7NI6YpivXq09n03op/hJzTEll31DyihV9XN/5vtNhg2LQALut2JUDBKuVXOcu5Op0dWBSSzIjANCkPM9v2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917188; c=relaxed/simple;
	bh=LxxSs4Q+jmMYO5apP9Bqx2gwYDq83vinoJqhu0CZp3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AJ8ZHC8/n6IufiVAiO1jfrZapOdyt51y37rpJjEGZL9I3KQvpel+nDaA60JNg9DSMxn9Bip+wFT39UA6xNR5gvkOygzKpIBaxZC6t6INOQy29SaIyL5PBSRibnN4YNVYr6+eIcwO1rTqbKkpmVkP/SwHBRe53gOtuIVgP8nBJ28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njfjwD9M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njfjwD9M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B68B1F000FF;
	Tue, 13 Oct 2026 18:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791917186;
	bh=nGhjLiCB/kpOC+4xcqoKGX7gdUhs9TdWF5/M85BZM4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=njfjwD9MrmIinPjPJ9qJkSvGk2q5SR89KdvOEXMGh9/fXVc7Pfn/gktYXd6Lf+Gcq
	 vQ2rdXMJEsV6e9V5cKAUARfYq/PuPNWRG2POYM2IMO9CKOtILaIfY6ukhbqrtFIZHf
	 1U4hrcBbtxyZ/jXJmGUldfPq7X0lp/1ukmaJqn+iVitpDw6MuQIqsuRUgenSbiss3f
	 FmClyfrudm+ieuBvrR1mgII7i2TjRBoDh4J6uS1VCbKQ2hGpogNfmdVQe8Uz9r8a87
	 ZrmCXvkxV8Z8U7/HF6d8M61BgFhd1hZt6mCugyqKW2aHQqlbOwEUbhZDTB8ZyAOiEF
	 qnqP2pO00y83Q==
Date: Tue, 13 Oct 2026 18:46:24 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, Chao Yu <chao@kernel.org>,
	Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org, Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>, Nanzhe Zhao <nzzhao@126.com>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH v4 00/18] f2fs: support & optimize large
 folios for writable files
Message-ID: <as58gCX6mzaExhxs@google.com>
References: <20261013115621.968742-1-nzzhao.sigma@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013115621.968742-1-nzzhao.sigma@gmail.com>

Hi Nanzhe,

Could you please rebase your patches on top of dev-test?

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/log/?h=dev-test

Note, I applied [0] and [1] already.

On 10/13, Nanzhe Zhao wrote:
> From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> 
> This series supports large folios for most readable/writable files
> in buffered I/O paths, including normal files, block-layer encrypted
> files, and atomic files except for inline-data files, compressed files,
> and quota files.
> 
> It also extends f2fs_folio_state to coexist with f2fs page-private
> flags and to handle large folio write path and partial truncate of
> large folios correctly.
> 
> Benchmark details can be found in the RFC v2 cover letter [1].
> 
> Changes in v4:
> - Rebased onto linux-next next-20261012 (4eb2586bd40d); its f2fs part
>   is the f2fs dev branch.
> - Added "f2fs: read i_size once in f2fs_vm_page_mkwrite" as a
>   prerequisite (also sent separately).
> - "f2fs: remove mappedtodisk flag usage in mmap write path" is kept as
>   a prerequisite.
> - Link to v3: [2]
> 
> Patches 1 and 2 are prerequisites for the large folio work. They are
> also posted independently as bug fixes, and are kept in this series to
> make it self-contained for the sashiko review.
> 
> Many thanks to Chao and Daeho for your extensive reviews and valuable
> suggestions!
> 
> [1] https://lore.kernel.org/r/20260622160830.324455-1-zhaonanzhe@xiaomi.com
> [2] https://lore.kernel.org/linux-f2fs-devel/20261009161224.4163796-1-zhaonanzhe@xiaomi.com/
> 
> Nanzhe Zhao (18):
>   f2fs: read i_size once in f2fs_vm_page_mkwrite
>   f2fs: remove mappedtodisk flag usage in mmap write path
>   f2fs: extend folio state for large folio write path
>   f2fs: carry subpage offset and count in write IO
>   f2fs: support regular file buffered writes on large folios
>   f2fs: support atomic file large folios buffered write
>   f2fs: support large folio writeback
>   f2fs: account large folio dirty data at block granularity
>   f2fs: prepare mmap write faults for large folios
>   f2fs: make GC migration large-folio aware
>   f2fs: optimize small block size large folio read
>   f2fs: support partial uptodate large folio read
>   f2fs: handle partial truncate of large folio dirty subpages
>   f2fs: wait for folio writeback before ffs_detach_free
>   f2fs: fix zeroing paths for large folios
>   f2fs: handle block cloning within the same large folio
>   f2fs: allow large folio support to writeable files
>   f2fs: make compressed files compatible with large folio
> 
>  Documentation/filesystems/f2fs.rst |   10 +
>  fs/f2fs/checkpoint.c               |   40 +-
>  fs/f2fs/compress.c                 |    7 +-
>  fs/f2fs/data.c                     | 1425 +++++++++++++++++++++++++---
>  fs/f2fs/dir.c                      |    2 +-
>  fs/f2fs/f2fs.h                     |  173 +++-
>  fs/f2fs/file.c                     |  252 +++--
>  fs/f2fs/gc.c                       |   38 +-
>  fs/f2fs/inline.c                   |    9 +-
>  fs/f2fs/inode.c                    |    4 +-
>  fs/f2fs/namei.c                    |    1 +
>  fs/f2fs/node.c                     |    2 +-
>  fs/f2fs/segment.c                  |    3 +-
>  13 files changed, 1706 insertions(+), 260 deletions(-)
> 
> -- 
> 2.43.0
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
