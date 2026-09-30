Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C44A518149
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788135; cv=none; b=RGrRPyietWkHZkK1DU2AyJx9JMeHlQFo54kZSaGSOAFr++yJPFaD6yR4lv9W6ixGwlRtV+Uvbw+hekTj0r9sN8RwJcWPEKLIGj+WVx+YkthREgTiOx5zvM6xbtbgZFYb4DbUic0hTgK/ofEmKycxbBb+doqghatclz6UjmEQZ1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788135; c=relaxed/simple;
	bh=hTLQZXjk4RuyLFLWNLjOAcTRWOX8P7V0j2BEsprpc8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvdWa7xy6ReFVYpInqD2SpIBzzn67THdHGsKHbU/zl2K+B1wj9aEG+GOvHrprzI7nvzwGNzcEdsyzwErx07RP4s85j8SvayAVGlbVJSeNLyN8Edrtn0lzQxCn3Sues/S0zeov1QHCigkQIzS4Ox7H+1uezbHprbnJ0ouQ82cCVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JmjO9ohh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmjO9ohh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7721F000FF;
	Wed, 30 Sep 2026 17:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790788134;
	bh=jSjqplrgiCHFH8A0JtVNipwXww+bF6YjcE6zbN6wZVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JmjO9ohhyftJ89qzAloluBgpiACFtYFR5m5CaJdPxFAKeQDVrKxfTZivE7U7EYseS
	 L8CPR/+os9sU+2T4m5aPEHZmGyE1MayJ+XmB2HqxnsJrzcPMxr/wtCE/hkg3SKCqtA
	 s3AHQ8WFbRE9C1rVTn8K02Z2X2WcaKwJ0GAmRMMNKhaoyZ1PyPJR6Q8uzuV7duuZUT
	 LGRde49EpH7at6f/iKFF5b7TvR19uLQv/FwG/FiI8rPADn9jZ15VR60JV+0P3+Z2NU
	 qjfd68/O9J8sYjJnMHJuxgclOVG43wt7M6fwsCT+3ny7F0pGIASI6cfcDqPqoFkPgS
	 hmZ58kXPql/Bg==
Date: Wed, 30 Sep 2026 17:08:52 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, Chao Yu <chao@kernel.org>,
	Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>,
	Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>, Nanzhe Zhao <nzzhao@126.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH v2 00/14] f2fs: support & optimize large
 folios for writable files
Message-ID: <ar1CJBRumJ0hcNdB@google.com>
References: <20260915041909.2903887-1-zhaonanzhe@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915041909.2903887-1-zhaonanzhe@xiaomi.com>

Hi Nanzhe, are you going to submit v3 soon?

Thanks,

On 09/15, Nanzhe Zhao via Linux-f2fs-devel wrote:
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
> [1] https://lore.kernel.org/r/20260622160830.324455-1-zhaonanzhe@xiaomi.com
> 
> Changes in v2:
> - Addressed most of Chao's and Daeho's review comments.
> - Updated docs for compress policy with large folios.
> - Link to v1: https://lore.kernel.org/r/20260826082641.2007658-1-zhaonanzhe@xiaomi.com
> 
> Many thanks to Chao and Daeho for your extensive reviews and valuable
> suggestions!
> 
> Nanzhe Zhao (14):
>   f2fs: extend folio state for large folio write path
>   f2fs: carry subpage offset and count in write IO
>   f2fs: support regular file buffered writes on large folios
>   f2fs: support atomic file large folios buffered write
>   f2fs: support large folio writeback
>   f2fs: prepare mmap write faults for large folios
>   f2fs: make GC migration large-folio aware
>   f2fs: optimize small block size large folio read
>   f2fs: support partial uptodate large folio read
>   f2fs: handle partial truncate of large folio dirty subpages
>   f2fs: fix zeroing paths for large folios
>   f2fs: handle block cloning within the same large folio
>   f2fs: allow large folio support to writeable files
>   f2fs: make compressed files compatible with large folio
> 
>  Documentation/filesystems/f2fs.rst |   10 +
>  fs/f2fs/checkpoint.c               |    2 +
>  fs/f2fs/compress.c                 |    3 +
>  fs/f2fs/data.c                     | 1221 +++++++++++++++++++++++++---
>  fs/f2fs/f2fs.h                     |  105 ++-
>  fs/f2fs/file.c                     |  229 ++++--
>  fs/f2fs/gc.c                       |   32 +-
>  fs/f2fs/inline.c                   |    7 +
>  fs/f2fs/inode.c                    |    4 +-
>  fs/f2fs/namei.c                    |    1 +
>  fs/f2fs/node.c                     |    2 +
>  fs/f2fs/segment.c                  |    6 +-
>  12 files changed, 1404 insertions(+), 218 deletions(-)
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
