Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14FF412BE4
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790419293; cv=none; b=bpkI4QicZvzGX7HU8P2FKQ7uW7Nxd9+KA6xMeWqun/eWOW58plxnd3mbzOyPzPkMjEiCDM4P+M3ZcL8tEuPrDDYZ1sho2J++WefP5pLOntpgAXlExug6grlTRyE9vl3IiYa6QaXR+WlUj/SaMrbqVHn6RQ1zvA2fUFTdajvdKMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790419293; c=relaxed/simple;
	bh=D0CO0+ihg7meYeGNjhwY/+aAXCuXnhBqrGSdyXS60XE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mL2pdRyq5G2REzcMkvpfd6bIuO302eDeAbbCRmKorR8h8yQQGAw4skwmpu0R8Gd2euIEq/iLazBl2HREvqZec9BrOPK3HycB6zSfhdioLWDPmXNw0GJ8OuMUmlcnKqsvaZdtWlSG4uPwk/4+wTYHJtE+tjyATQNeXOkT0BIITDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xAP4O-0007Km-00; Sat, 26 Sep 2026 11:51:48 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 0CF00C0A44; Sat, 26 Sep 2026 11:33:29 +0200 (CEST)
Date: Sat, 26 Sep 2026 11:33:29 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] MIPS: fix typos and repeated words in comments
Message-ID: <areRaWK4LwUtW_5L@alpha.franken.de>
References: <20260904124922.10256-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904124922.10256-1-hemanth.selam@gmail.com>

On Fri, Sep 04, 2026 at 06:19:18PM +0530, Hemanth Selam wrote:
> This corrects 2 misspellings and repeated words in comments.  Each is a
> separate patch so that any one of them can be dropped without touching
> the rest.
> 
> Nothing outside comments changes.  Every touched C file was checked by
> dropping its comments, replacing each string literal with a placeholder
> and collapsing whitespace; what remained was identical before and after,
> so the compiled code cannot differ.
> 
> The mistakes were found with scripts/checkpatch.pl against the list in
> scripts/spelling.txt.  The scanning, the edits and the changelogs were
> produced with Cursor running the claude-opus-5 model, from a request to
> find and fix spelling mistakes across the tree, and every correction was
> then re-checked by the comparison described above.  Words that name an
> identifier were left alone deliberately, even when they read as typos,
> because correcting the prose would make the comment disagree with the
> code it describes.
> 
> Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
> is clean.  Nothing else was built, so any patch touching code that
> x86_64 defconfig does not compile has been read but not compiled.
> 
> Hemanth Selam (2):
>   MIPS: fix typos in comments
>   MIPS: fix repeated words in comments
> 
>  arch/mips/cavium-octeon/octeon-memcpy.S            | 2 +-
>  arch/mips/include/asm/mach-loongson64/boot_param.h | 2 +-
>  arch/mips/lib/memcpy.S                             | 2 +-
>  arch/mips/n64/init.c                               | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

series applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
