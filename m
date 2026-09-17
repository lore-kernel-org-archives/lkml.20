Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0597F336884;
	Thu, 17 Sep 2026 21:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789680168; cv=none; b=dTJMd3clku/faJU12fAU4kePKZm/izkNV6DtKvmzGsgzn32gWAq9cfL1G2pwJ6LxJ0uE5sBpeV7p1/VogpmPMs6HhgQVRQrPTPwwo9+MH98ERMdseH8jvvWCmJw4LMHVQK1LOQ0UWct8XeH1jVvkg/nsUo0kCmaA7M0znf0vhpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789680168; c=relaxed/simple;
	bh=cz3beJ100hvyn8J52w20seF2119WecGMTTCyXxMv57Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sEDgiEkfox3L+SaAfXYDo5vInz8URO7gcjVWwk0V/dyTMnqUfbFLwEFkOS2am+txEx15Gfa6utCH1TM9iB90dUzI+n51O3i0aqViPuWU598h4kxl6Ixvn8A5uuk64JCsks2jtpqX5MdYK1B+BSqobFlzodYCYN0Pdx/eMJgYav0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sy8Q5bc2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sy8Q5bc2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4741F000FF;
	Thu, 17 Sep 2026 21:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789680166;
	bh=isJtL9Alg5A7U5hdU42lwq10NYoGxCnVR4iazJCAWTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sy8Q5bc2c0Q5r54SUUpu0nAhRYrHd07s1OtQDK5pebIjw43n7Mjgd4aPPZOQlY/27
	 itltFMSzWyWNOgzn8ghQFo44myD7bUpzUwFiQ9Qy9tdOtczE5gb9umnRCq1kbZJGiw
	 IF4WqXA+YEPETv9w9NsfxbzScw9vwy/cScWqN9MBtwm3QEpl11fW4yCEGgGvYv9M6+
	 EhJNePjXkJ4OyBhYIbmAxr5Yc5IHimezF+tJH5Z6c+t/Sv3ugUDnBkGVhu5o59p2B4
	 yqPRKp2g1vlYnyHKQ8nqK+U7pFNLz1F9rWGApF2ogLNGzqV09rZKzxo5MRMXivPmiK
	 bq3siupm7hhuA==
Date: Thu, 17 Sep 2026 21:22:45 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, David Hildenbrand <david@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Zi Yan <ziy@nvidia.com>, Chao Yu <chao@kernel.org>
Subject: Re: linux-next: manual merge of the fs-next tree with the mm tree
Message-ID: <aqxaJR1pQZ-rn-W5@google.com>
References: <aqv9gg4J1n0sB0GU@sirena.org.uk>
 <20260917121352.05daf1e0017a7d67091ffaff@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917121352.05daf1e0017a7d67091ffaff@linux-foundation.org>

On 09/17, Andrew Morton wrote:
> On Thu, 17 Sep 2026 15:48:10 +0100 Mark Brown <broonie@kernel.org> wrote:
> 
> > Hi all,
> > 
> > 
> > Today's linux-next merge of the fs-next tree got a conflict in:
> > 
> >   fs/f2fs/f2fs.h
> > 
> > between commit:
> > 
> >   08071592211dc ("f2fs: stop using PG_private")
> >   32e05e39cb443 ("f2fs: convert the ->private flag helpers to folio-only")
> > 
> > from the mm tree and commit:
> > 
> >   60105162524e9 ("f2fs: stop using PG_private")
> > 
> > from the fs-next tree.
> 
> It's risky to cherrypick a couple of patches from a 16-patch series and
> carry them in a separate tree.  It'll all end up OK in the end, but who
> verifies that these two are OK as standalone things?

I applied the first patch only which looked a standalone. Though, let me
drop it and see how it'll give the conflicts with other f2fs patches.

> 
> Also, as the changelogs say,
> 
> "It prepares for a future commit that removes PG_private"
> 
> and that removal is in mm.git as [16/16], so I'll need to retain these
> patches so mm.git compiles.
> 
> It would have been preferable for the f2fs maintainers to have simply
> sent along their acks so all this work can remain in the same place.
> 
> I'll continue to hold the f2fs patches in mm.git.  Which means they
> might hit mainline before the f2fs tree is merged.  Or after. 
> Hopefully Linus's git will figure it out.
> 
