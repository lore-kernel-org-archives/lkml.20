Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180F337C923
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788208976; cv=none; b=UrQlqgfdQUGB97A8LEuT9Me9XxR5pZ49PWZdOjMSLKOL83dFy9C4MEIoPKqLbbYfno2IBPuKTu0cxnr8egOj/duN7nksPwP6Jdsy+xpfZldDPXRECPZN6FfGZyQQ1+ZM/13qMgcJsWvRZtEwC9zcOA722o8U+ZXw2r2nIUmEPtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788208976; c=relaxed/simple;
	bh=b1jGFPWDhs4PTVJaFW/RuE9jy/+NPjpL56Z2TdSANSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dtSjHsjIpoToC89Nx36f9HyO1SrbDU9nIn+hRt15Vq2vQlsMBf281hB0iITSNMMKsiVExnMnTwuPUhLCc308v6EwJ5Ux2ETX1vL8h0F3QoH45MVBeTCTxtNaMmCiX0hjg0LBA/d/1pcqvltL7rNbL+1BKUlbT+jkgwJBjmSFyZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dAAjSV36; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dAAjSV36"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD401F000E9;
	Mon, 31 Aug 2026 20:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788208974;
	bh=EcsqIntohDBj7T07atoCdhzgU+9ZNI8GEG8azdvgvJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dAAjSV36Im0KXym3fl6aCZsYF7UXjbdF0EVKD7PT4GhNaG6JFsOVEPUNApNhbs66Y
	 oq/L0aNfPFZfjq52rnznStVLOCk+H4k8CfhCynCp9UuMgWj6erLwF9WcB+2mw27AG/
	 u4Plxihgr50APIHEpiELpva/MHjbyQuolf36O/mGsL+RzjlSQtU/WEKk/z/D7/Vx7P
	 vmE3hetnL6KajuIiq+Do9BwWkj6GyrNutROj9BvxMw9JhxakxnJ5S1FMyAdRL+4FNW
	 WxpVMWiwAXQXy+IFMBZfpWPQuezikM9YmBkqdlis75Hs/nccI21HW9mYQPsMJYyec5
	 ilvmJVLDInbVw==
Date: Mon, 31 Aug 2026 20:42:53 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Kelvin Zhang <zhangxp1998@gmail.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [f2fs-dev] [PATCH v6 00/11] f2fs: prepare metadata layouts for
 runtime block sizes
Message-ID: <apXnTaf1gQOxBmLk@google.com>
References: <CAH=xXfE6o2sLwcYdoH9cayZpbf389y8PeJ_aDRty61i7q4QKow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH=xXfE6o2sLwcYdoH9cayZpbf389y8PeJ_aDRty61i7q4QKow@mail.gmail.com>

Hi Kelvin,

I see only the first patch in this series. Am I missing something?

On 08/31, Kelvin Zhang wrote:
> F2FS currently describes several on-disk metadata layouts and filesystem
> geometry values with constants derived from PAGE_SIZE or a fixed 4KB block
> size. This series derives those values from the mounted filesystem's block
> size instead, as preparation for supporting filesystem blocks smaller than
> PAGE_SIZE.
> 
> The patches initialize sb_info early, describe the SIT, NAT, orphan, dentry,
> node, and xattr layouts dynamically, parameterize sector/byte/block
> conversion helpers, and derive node-tree geometry at runtime.
> 
> This series does not relax the block-size mount check or enable subpage I/O.
> It is intended to be a behavior-preserving refactoring for currently
> supported 4KB-block filesystems.
> 
> Changes since v5:
> - no code changes
> - send each diff as a base64-encoded text/x-patch attachment because Gmail's
>   outgoing transport reflowed long lines in inline text/plain bodies
> - verified that an actual received raw message applies with git am and
>   produces the expected tree; the list-side copy of patch 01/11 will be
>   checked before completing the series
> 
> v5:
> https://lore.kernel.org/linux-f2fs-devel/CAH=xXfH7TPGt-zKXvJRNTgGDZKa1Xoq_sF3-WGs5kdsQLuYn4g@mail.gmail.com/
> 
> Changes since v4:
> - no code changes
> - resend with CRLF-canonicalized RFC822 messages; the delivered inline patch
>   was still reflowed by Gmail's outgoing transport
> 
> v4:
> https://lore.kernel.org/linux-f2fs-devel/CAH=xXfHWPg6qRwW+N2ziH1cvG3OD3wJc1z_Tm04MtFCpqYmQFg@mail.gmail.com/
> 
> Changes since v3:
> - no code changes
> - resend with git send-email because the previous mail-sending path produced
>   hard-wrapped hunk headers in the delivered messages
> 
> v3:
> https://lore.kernel.org/linux-f2fs-devel/CAH=xXfEFL7w7nsU3xjNubKJ1soYMqT-DbJBuyzfEX4Rv3rdFEA@mail.gmail.com/
> 
> Changes since v2:
> - use DECLARE_FLEX_ARRAY() for flexible arrays that are alone in a struct or
>   used in a union, fixing the reported m68k GCC build failures
> - use F2FS_BLK_ALIGN() in f2fs_sec_trim_file() to avoid a runtime 64-bit
>   division and an unresolved __divdi3 reference on 32-bit SH
> - no other code changes
> 
> Changes since v1:
> - rebase onto f2fs/dev at c966d29e01bb
> - drop the unrelated free-NID underflow fix from this series
> - split the preparatory changes into 11 focused patches
> - initialize sb_info earlier and describe the xattr layout explicitly
> - separate sector, byte/block, and block-size macro parameterization
> - update commit messages and address checkpatch warnings
> 
> v2:
> https://lore.kernel.org/linux-f2fs-devel/CAH=xXfHWW_J92z3YgvoLSx8+z6rekq=p2kiP15KE9=2+Ju2RjQ@mail.gmail.com/
> v1:
> https://lore.kernel.org/linux-f2fs-devel/CAH=xXfFVAwQ3r_NdUDtmXhtg6Lw8kDWoNTzGL5oy4mwHMsJLJw@mail.gmail.com/
> 
> Tested with:
> - x86_64 W=1 F2FS build at every patch
> - arm64 16KB-page W=1 F2FS build at the series tip
> - m68k W=1 F2FS builds with the two reported randconfigs at the affected
>   patch points
> - SH W=1 F2FS build with the reported randconfig at the affected patch;
>   fs/f2fs/file.o has no __divdi3 reference
> - scripts/checkpatch.pl --strict (no errors or warnings)
> 
> Kelvin Zhang (11):
>   f2fs: initialize sb_info early in f2fs_fill_super
>   f2fs: describe SIT block layout dynamically
>   f2fs: describe NAT block layout dynamically
>   f2fs: describe orphan block layout dynamically
>   f2fs: describe dentry block layout dynamically
>   f2fs: describe {i,d,id}node block layout dynamically
>   f2fs: describe xattr block layout dynamically
>   f2fs: parameterize sector conversion macros
>   f2fs: parameterize byte and block conversion macros
>   f2fs: parameterize block size and mask macros
>   f2fs: describe node tree geometry dynamically
> 
>  fs/f2fs/checkpoint.c    |  75 ++++++++++--------
>  fs/f2fs/data.c          |  85 +++++++++++---------
>  fs/f2fs/debug.c         |   4 +-
>  fs/f2fs/dir.c           |  51 ++++++------
>  fs/f2fs/extent_cache.c  |   6 +-
>  fs/f2fs/f2fs.h          | 122 +++++++++++++++++++++-------
>  fs/f2fs/file.c          |  84 +++++++++++---------
>  fs/f2fs/gc.c            |  27 ++++---
>  fs/f2fs/inline.c        |  11 ++-
>  fs/f2fs/inode.c         |  22 +++---
>  fs/f2fs/node.c          | 171 +++++++++++++++++++++-------------------
>  fs/f2fs/node.h          |  89 +++++++++++----------
>  fs/f2fs/recovery.c      |   4 +-
>  fs/f2fs/segment.c       |  60 +++++++-------
>  fs/f2fs/segment.h       |  32 ++++----
>  fs/f2fs/shrinker.c      |   2 +-
>  fs/f2fs/super.c         |  83 +++++++++++++------
>  fs/f2fs/sysfs.c         |  10 +--
>  fs/f2fs/verity.c        |   6 +-
>  fs/f2fs/xattr.c         |  10 ++-
>  fs/f2fs/xattr.h         |  15 ++--
>  include/linux/f2fs_fs.h | 131 ++++++++++++++++--------------
>  22 files changed, 636 insertions(+), 464 deletions(-)
> 
> 
> base-commit: c966d29e01bbf829f8bb4a39a49811c56cdb49c3
> -- 
> 2.53.0
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
