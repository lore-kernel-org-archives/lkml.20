Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F99A35836E
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788076086; cv=none; b=Tlf0l7jwmK1/tjZ0lsnR8QJfGOYqPRPdxcaC9Ih6S1QASHtcoVY66FdsZ4f5hJ/ujEWxlXI0eqDWy2QD8PE9Uf+/uZVuoEVdUH8zOHl7Gxi0nQ73ikgv3kGvW2U/0H3I03fkDCoLy5Q0+z9BaRlAhPl54yV9GVHU5U1FqmtTK4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788076086; c=relaxed/simple;
	bh=4LTNW+B1VYaR3rSi+gtNh9uqKardCXvz/n4WZKm71qE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tFMExIbsR4R1EQiICNoB/dd4yA09+fZ33UBlmdwDvcaZJk0uT0a6on+1+8IQL40h+hAG/7/GgP8+ry2k3PuQoyQ11OlSSZySX2DiFAjPe4aYihOHoTt9LZPFBFtEihoufCKcD2/DwX/KS1BghvOJVptvNVJvBCcO7jrXNrwKY5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXZjfJn/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXZjfJn/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A1DB1F00A3D;
	Sun, 30 Aug 2026 07:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788076085;
	bh=OUSBuPbkgvvs7WqRcGgbke6rpMilgaQ3CVPiWBPYFtU=;
	h=From:Subject:Date:To:Cc;
	b=XXZjfJn/l9reN3sv2uNRKT5zpSYocUtRxKxv0hFlqrV2qAEv3KArYO1bQ5PW/ZzXH
	 +6kirRWN0MtdcbEr5t8AcnRqqDN66u266Jz0y749SjJeez9cY1jd8xVH+zOXVcsSxm
	 NcWySLa70EOYMctxt31QjbYGu6nLpYSWa94OkoknlcjRT99gYC8/e3M0BDRsRXw8c1
	 cfK8mDOHqBmw+Vbj+guW2u5KC6quklkb6MC7Xhw1DQ4T8CGy41suH4Ce++HEwiMPGC
	 1uQU3w+ur5AR/DGX88A29qzh3rDHzoaB9MRDS/t/K9w32a77MxjoBFVTMOBOaxewBa
	 33LT3VS739U6w==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: [PATCH 0/4] char/misc: replace page allocator calls with
 k[mz]alloc()
Date: Sun, 30 Aug 2026 10:47:57 +0300
Message-Id: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QrCMAwAf2Xk2chsxU5/RXxo08xFsEqiIoz9u
 +18vOO4GYxV2ODUzaD8EZNHqbDbdEBTLFdGyZXB9e7QD+6I1SrexQgz0Z69D2EYM9T+qTzKd32
 dL3+2d7oxvdqgFSkaY9JYaGpqxbD1sCw/fME+7YgAAAA=
X-Change-ID: 20260829-char-misc-dcc4e33778fd
To: Arnd Bergmann <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>, 
 Eli Billauer <eli.billauer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Michal Simek <michal.simek@amd.com>, Ritu Agarwal <rituagar@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
 Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
X-Mailer: b4 0.17-dev

This is a (small) part of larger work of replacing page allocator calls
with kmalloc.

My initial intention a few month ago was to remove ugly casts [1], but then
willy pointed out that Linus objected to something like this [2] and it
looks like more than a decade old technical debt.

Largely, anything that doesn't need struct page (or a memdesc in the
future) should just use kmalloc() or kvmalloc() to allocate memory.
kmalloc() guarantees alignment, physical contiguity and working
virt_to_phys() and beside nicer API that returns void * on alloc and
doesn't require to know the allocation size on free, kmalloc() provides
better debugging capabilities than page allocator.

Another thing is that touching these allocation sites gives the reviewers
opportunity to see if a PAGE_SIZE buffer is actually needed or maybe
another size is appropriate.

For larger allocations that don't need physically contiguous memory
kvmalloc() can be a better option that __get_free_pages() because under
memory pressure it's is easier to allocate several order-0 pages than a
physically contiguous chunk with the same number of pages.

And last, but not least, removing needless calls to page allocator should
help with memdesc (aka project folio) conversion. There will be way less
places to audit to see if the user was actually using struct page.

The patches are deliberately kept small: each one deals with a single
driver or subsystem and with a single type of allocation, so that every
conversion can be reviewed, and if needed reverted, on its own.

[1] https://lore.kernel.org/all/20251018093002.3660549-1-rppt@kernel.org/
[2] https://lore.kernel.org/all/CA+55aFwp4iy4rtX2gE2WjBGFL=NxMVnoFeHqYa2j1dYOMMGqxg@mail.gmail.com/

Note that the xillybus 'salami' buffer in xillybus_core.c is left alone: it
is allocated with __GFP_DMA32 which kmalloc() does not support.

---
Mike Rapoport (Microsoft) (4):
      char: xilinx_hwicap: replace page allocator calls with k[mz]alloc()
      char: xillybus: replace __get_free_pages() with kmalloc()
      misc: ibmvmc: replace get_zeroed_page() with kzalloc()
      platform: goldfish: pipe: replace __get_free_page() with kmalloc()

 drivers/char/xilinx_hwicap/xilinx_hwicap.c | 18 +++++++++---------
 drivers/char/xillybus/xillyusb.c           | 25 +++++++------------------
 drivers/misc/ibmvmc.c                      |  6 +++---
 drivers/platform/goldfish/goldfish_pipe.c  | 22 ++++++++++------------
 4 files changed, 29 insertions(+), 42 deletions(-)
---
base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
change-id: 20260829-char-misc-dcc4e33778fd

--
Sincerely yours,
Mike.

