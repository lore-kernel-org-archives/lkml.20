Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792674616;
	b=xs7D+KjNUrM/ciBEizMHb3M/f0mnwGz92fXVYV5zUEU4odpaHMIewj5+MheZJthJs9Vj
	 R9JiIf+mdmH3IdWqX/tbYB+0mS9SfnFeyoWiqOB9gSq5q8ql/QOKAmI2+b0ivqxQDZGIl
	 IihtYyKKs8M0wkjQBtzQqSC1koMjHR9FCRdnjjNEkTJgYun00QQys2UQAOZU1odKxru1r
	 /3ijO5Zl+nas9hE2eWMEQr+KYAU4/RccmztSEeZSMAV6LJG/vjR6gAAgoCGKDMGxvhyHV
	 o1m5hm43LdQLMgip/CjdyNYF0Ou/RCk0CIkRsLlRLu9tKJWzvIkQyjMOkdl9zRsICkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792674616;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=2lH8hAhqZyAccI4aZoGUInK6A5k9Wj1b9MbWKOEQc64=;
	b=m7SA5e6ewW3Xs7niyd/3mbc8LqtVjJgD121/hdNf1yanh/H0HuYSWqVsNVX+mXpD1OiC
	 qzR0qrUdzbTH9pEGd/moGaSPENzetV+sDIj3JjkwoXkRof6RefY/YedN5Knc9a05VjXW+
	 IRPE8FMTbLkFyvZcNDh7dY77DBpCpHGwVW9OuhjHQnDbbp07Nkk601d/QWiYsFJdvGLcx
	 kZBseOKYiHWci8+P0y10rLbztXH4hlLykV6VnzHhnm0ILs5iEFQIdNejL8RtqK5oxiX5g
	 dj3oZrkaQFVx4AVQJ0zx3JGu9TCH/1jGNw2hldceM8enPavNWSGr4K46ViRy7kU+v6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W4GWITxy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BCD606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W4GWITxy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97EE1F000C1;
	Thu, 22 Oct 2026 13:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792674615;
	bh=2lH8hAhqZyAccI4aZoGUInK6A5k9Wj1b9MbWKOEQc64=;
	h=Date:From:To:Cc:Subject;
	b=W4GWITxyfysJH4O1c1wifcIOkhTUB9v+TBMFMiuxj+WC7mk/Q1kjg9H27fGPdhIP3
	 +QHOw53aLm6s/2jlwZjMLhzDBZxVAlS6LPtq58OYbwVII+vHefRL2POcYY+EZJDVD2
	 iovdJbTSAZjD8JM13ZjkA9Foj4oQQiKPpLV+j87FDbr/5HfB5ZoPgasY1JG7BzoSAz
	 bCgDb3+Ouk5RpYsxT5CvtwlBnoi41n1f3fef1cPxJHsA92/eNWq4jezAN8ym1kgcAj
	 btezOgdi9nUGVMb7KihlmECcthvb92JqIpTcr4EqeoYlsyZ4FuZnnQFoM7fG3ZuPn5
	 xg8EBZa90dv1g==
Date: Thu, 22 Oct 2026 14:10:13 +0100
From: Harry Yoo <harry@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
	LKML <linux-kernel@vger.kernel.org>, Imre Kaloz <kaloz@kernel.org>, 
	Karl Mehltretter <kmehltretter@gmail.com>, Kees Cook <kees@kernel.org>, 
	Longlong Xia <xialonglong@kylinos.cn>, Matthew Wilcox <willy@infradead.org>, Zi Yan <ziy@nvidia.com>
Subject: [GIT PULL] slab updates for 7.4
Message-ID: <atoJsKNb5KiE44jl@thinkstation>
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

Hi Linus,

please pull the latest slab updates from:

  git://git.kernel.org/pub/scm/linux/kernel/git/mm/slab.git tags/slab-for-7.4

There are no known conflicts with other trees.

Thanks,
Harry

======================================

- Performance improvement of the sheaf prefill API, by allowing the
  barn to hold a partial sheaf and refilling sheaves from the barn.
  This improves will-it-scale mmap1 throughput by 24% on the
  maple_node cache. (Hao Li)

- Restore memcg accounting of ipc msg_msg allocations, lost with
  e.g. CONFIG_SLAB_BUCKETS=n where the allocations fall back to the
  general kmalloc caches. (Kees Cook)

- Fix an old race between kmem_cache_destroy() and slab_late_init(),
  where a cache destroyed late in the boot process tries to release a
  kobject that was never initialized. (Imre Kaloz)

- Remove slab_folio(), the last use of struct folio in slab code.
  (Matthew Wilcox)

- Reject kmalloc() requests above KMALLOC_MAX_SIZE explicitly with a
  warning and NULL return instead of relying on the page allocator's
  order check. (Zi Yan)

- Various minor fixes and cleanups. (Hao Li, Karl Mehltretter,
  Kees Cook, Longlong Xia)

----------------------------------------------------------------
The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mm/slab.git tags/slab-for-7.4

for you to fetch changes up to d15d7703166daf7bd62c844a3cb1b3a6279adb4c:

  mm/slub: initialize the free pointer of the bootstrap kmem_cache_node (2026-10-19 11:57:03 +0100)

----------------------------------------------------------------
slab changes for 7.4

----------------------------------------------------------------
Hao Li (3):
      mm/slub: unify slub stat definitions to simplify metric additions
      mm/slub: make the case handling in __slab_free() easier to follow
      mm/slub: refill prefilled sheaves from the barn

Imre Kaloz (1):
      mm/slab: sample slab_state once in kmem_cache_destroy()

Karl Mehltretter (1):
      mm/slub: initialize the free pointer of the bootstrap kmem_cache_node

Kees Cook (2):
      mm/slab: Mark the kmem_buckets_create() context as a Context: section
      ipc, msg: Account msg_msg allocations with GFP_KERNEL_ACCOUNT again

Longlong Xia (1):
      mm/slab_common: reject zero object_size before calculate_alignment

Matthew Wilcox (Oracle) (1):
      slab: Remove slab_folio()

Zi Yan (1):
      mm/slab: reject unsupported kmalloc() sizes

 ipc/msgutil.c    |   3 +-
 mm/slab.h        |  28 ++---
 mm/slab_common.c |  23 ++--
 mm/slub.c        | 329 ++++++++++++++++++++++++++++++++++---------------------
 4 files changed, 228 insertions(+), 155 deletions(-)

-- 
Cheers,
Harry / Hyeonggon
