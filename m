Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C08D45000;
	Thu, 17 Sep 2026 19:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672434; cv=none; b=kSPbd3tIfn3xBiH7pFpRQ8jtEq+mKIChVvzPKx3I1Q/9KXlr/B3pP5DWEqOThHESSXjLulYpYwkchKO7v0LSXY7CE4cVgmBCiaAgXqNAXCP5588msKuXQQKArGx7+1+9th4jSeFEdHQN4AYKyrJU/sVxPmLdbTYd596n6SklsaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672434; c=relaxed/simple;
	bh=AOjC4H0odoEYQFy0qUsCJOJMXpuiMUblLQ55TFYEv9s=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=YWE8XnJOMco7t3E8EgnvGRWsIgrFNqjjeCq7+z7qm0AYrZBYkuawjTGVXcl4s8X5LAxNLrQGQT1UkTHhD0bF2uCCAOx0z6gtA3IgTdTTIKIEU7eDkoXS94ah9QLk4iqQKgo+wPl5MhzNGnWwytB/Cgj3ls2RsFmO+MgOUg+xl+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Xjcwt/mL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Xjcwt/mL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E221F000FF;
	Thu, 17 Sep 2026 19:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789672433;
	bh=nRd+VI7M2npKuf+gulkZ4Ak0QgV5ad0cLi55iYMsw6k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Xjcwt/mLmiqmM4haBcc5W74ZLCnfiP122J9xSF/hP0vs6iquJ5iIOKZ4HjhXfO8qI
	 p27LJyY4lx8Qguj7Q5ILsvv2qDUt9jKOp2gI/Q5rdj/vdivCbBpIUJztvVWifdWMl6
	 S0EzhdOkMIQzfBXTVOCoLioClp594l04uXDhVrtw=
Date: Thu, 17 Sep 2026 12:13:52 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Zi Yan <ziy@nvidia.com>, Chao Yu
 <chao@kernel.org>
Subject: Re: linux-next: manual merge of the fs-next tree with the mm tree
Message-Id: <20260917121352.05daf1e0017a7d67091ffaff@linux-foundation.org>
In-Reply-To: <aqv9gg4J1n0sB0GU@sirena.org.uk>
References: <aqv9gg4J1n0sB0GU@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 15:48:10 +0100 Mark Brown <broonie@kernel.org> wrote:

> Hi all,
> 
> 
> Today's linux-next merge of the fs-next tree got a conflict in:
> 
>   fs/f2fs/f2fs.h
> 
> between commit:
> 
>   08071592211dc ("f2fs: stop using PG_private")
>   32e05e39cb443 ("f2fs: convert the ->private flag helpers to folio-only")
> 
> from the mm tree and commit:
> 
>   60105162524e9 ("f2fs: stop using PG_private")
> 
> from the fs-next tree.

It's risky to cherrypick a couple of patches from a 16-patch series and
carry them in a separate tree.  It'll all end up OK in the end, but who
verifies that these two are OK as standalone things?

Also, as the changelogs say,

"It prepares for a future commit that removes PG_private"

and that removal is in mm.git as [16/16], so I'll need to retain these
patches so mm.git compiles.

It would have been preferable for the f2fs maintainers to have simply
sent along their acks so all this work can remain in the same place.

I'll continue to hold the f2fs patches in mm.git.  Which means they
might hit mainline before the f2fs tree is merged.  Or after. 
Hopefully Linus's git will figure it out.

