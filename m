Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25194FD782;
	Mon, 19 Oct 2026 13:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792418044; cv=none; b=OxWPgdhgjTj5/Sph1ZJ9wTslkkh1jfZLRCUdaPo3qUujwn9g8Org5Cw7BtoWtYxZvUKup0QezwxQ/qgaT5NQ3VYXhbHNiqFs2H7NFD1GuykX0/V+nRcKBVa5dKNct+NbXZRcuFyTXbQgoNqT5pNDa2DRW4Z3OMmj4sn8rdH0QZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792418044; c=relaxed/simple;
	bh=PvNOvOG3k1nyIl2xJtTo7tvobYYA6w/S6Rs1N7sF+aE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZwGdCHh5KNu4kVUMfhaE811CytWeVjTAViB4DxIHB8OYt35Flp84B9CRGNZkPCn+KHSnb55b/l8ZAG68l3EuoWUj5wIMfyPWkmbfgQcS8EsSggFC74wJcJhcnuYW8467neput6482uO2zAEyPr9sb9KW2BmEWPtzxOX2bT4p+kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLtVbW4t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLtVbW4t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 259CA1F000C4;
	Mon, 19 Oct 2026 13:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792418042;
	bh=h/7HJtb6+Lht2UwV3mRdqEstIbANi/Ys/pJBas6kykI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TLtVbW4tAFTyV2J2WBygjBhShYTN1UW44rrFgBJc2zNZFqpjTikm+kOY02YN46KvA
	 l2qxFi5A3tgPOcA75yuYVq3yvAla/0Zzvk4cQqzjhKEqSwKv3XYA4stUQfOoRPiFon
	 pUka423K81R0Gkl5Y7rbM7pLXkDIr6mzi5rPTWSKrpQRCumZGPe1ByJnIWm9Xu+L0w
	 eMT2xUHXdIsi01sJFczisu6PG2L+IxRHZvjGaO0IdSxc+w8IeRN8MrVwtODcK0fUhy
	 r6vT3JF1lE+fsuhSwtM1avcKQpsJDTjJ8BrYjy+ZOWm9OQk46vIMdindesBvuPvmCb
	 rRmiafew9Tk7g==
From: SJ Park <sj@kernel.org>
To: Dan Carpenter <error27@gmail.com>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] tools/vm: rename tools/vm to tools/mm
Date: Mon, 19 Oct 2026 06:53:54 -0700
Message-ID: <20261019135355.87175-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <atYOvqkdVSgjXZVM@stanley.mountain>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Dan,

On Mon, 19 Oct 2026 15:36:14 +0300 Dan Carpenter <error27@gmail.com> wrote:

> On Tue, Jan 03, 2023 at 06:07:52PM +0000, SeongJae Park wrote:
> > Rename tools/vm to tools/mm for being more consistent with the code and
> > documentation directories, and won't be confused with virtual machines.
> > 
> > Signed-off-by: SeongJae Park <sj@kernel.org>
> > ---
> >  Documentation/admin-guide/mm/idle_page_tracking.rst | 2 +-
> >  Documentation/admin-guide/mm/pagemap.rst            | 4 ++--
> >  Documentation/mm/page_owner.rst                     | 2 +-
> >  Documentation/mm/slub.rst                           | 2 +-
> >  Documentation/translations/zh_CN/mm/page_owner.rst  | 2 +-
> >  MAINTAINERS                                         | 2 +-
> >  mm/Kconfig.debug                                    | 2 +-
> >  mm/memory-failure.c                                 | 2 +-
> >  tools/{vm => mm}/.gitignore                         | 0
> >  tools/{vm => mm}/Makefile                           | 0
> >  tools/{vm => mm}/page-types.c                       | 0
> >  tools/{vm => mm}/page_owner_sort.c                  | 0
> >  tools/{vm => mm}/slabinfo-gnuplot.sh                | 0
> >  tools/{vm => mm}/slabinfo.c                         | 0
> >  14 files changed, 9 insertions(+), 9 deletions(-)
> >  rename tools/{vm => mm}/.gitignore (100%)
> >  rename tools/{vm => mm}/Makefile (100%)
> >  rename tools/{vm => mm}/page-types.c (100%)
> >  rename tools/{vm => mm}/page_owner_sort.c (100%)
> >  rename tools/{vm => mm}/slabinfo-gnuplot.sh (100%)
> >  rename tools/{vm => mm}/slabinfo.c (100%)
> 
> Is there a reason we left the tools/vm directory even though
> it's empy?  Is it for backwards compatability or something?

No, I think this patch didn't leave tools/vm/.  I cannot see that on my tree:

    $ git log -1 799fb82aa132fa3a3886b7872997a5a84e820062
    commit 799fb82aa132fa3a3886b7872997a5a84e820062 (HEAD)
    Author: SeongJae Park <sj@kernel.org>
    Date:   Tue Jan 3 18:07:52 2023 +0000
    
        tools/vm: rename tools/vm to tools/mm
    
        Rename tools/vm to tools/mm for being more consistent with the code and
        documentation directories, and won't be confused with virtual machines.
    
        Link: https://lkml.kernel.org/r/20230103180754.129637-4-sj@kernel.org
        Signed-off-by: SeongJae Park <sj@kernel.org>
        Cc: Jonathan Corbet <corbet@lwn.net>
        Cc: Shuah Khan <shuah@kernel.org>
        Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    $ git show 799fb82aa132fa3a3886b7872997a5a84e820062:tools/vm
    fatal: path 'tools/vm' does not exist in '799fb82aa132fa3a3886b7872997a5a84e820062'

If your local tree has some git-untracked hidden files under tools/vm/
directory, the directory might not be removed.  That could made you think this
patch left the directory?


Thanks,
SJ

[...]
