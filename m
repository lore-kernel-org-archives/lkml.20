Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870406;
	b=yX0vjIliBSvM8ch2CR4KIwLREbVJijKtyVk3OeL8uaunyyC4f68XOzmw3VJZgBd/PZAp
	 tD+AYK4MM2g+z/WuTit7UJteQRiTNhTSR8mjz1PNlFoduS5MhTuKkxTQHM0i+SN6w+chC
	 EBU43bU0Qr4/RLLQeW+SXUnpRXOAffxibpPVb2Mx8D5LbLyzxh7iZsSIu4i1NXeENaBji
	 TQI0LYVquhNwr2gPEH3QSGhNAxyPqOB6/EoIuDUIqQbWdr8aza2ebdfKNTTlhL3scGoU0
	 10snXAdUiZKqwvBbC4pKONHG+8UYOH2QGXp8IZdQCUNFTYEQigpi7CXnT9TWJklW4Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TIKThpPDZ4NJSXYRfFfOL841Z/zWYVoqxjZupCxQAek=;
	b=RPWJYb60TNrKqjFvAMAIPik1sBvYoojMFUAKB8SUkO2QugIASrY2EpbN+ijtFPd0wNo+
	 iVjoJUi8sN3bUEr6tkeKiQi37r9+riw5mR0Q0eW66TAM9wp1btf/pWVwEzvXWa7lyrt5P
	 0y6f/0+49K07d5Bd4wngOeDwrWr9ieUD5Ht1WeuwBSdys/BarVeGLSdLYEE1boIhqlAJ/
	 uGr4vXXaOd5pCaRJDRvttsmGIJhsh9CmHsO0Qvmo+M2rrrKmAPO7wKnVLdRouNFRAvJ8A
	 ZBj4C6f3xdaV+ojQk9CVYSqb7y4sLe0uaxUZ9bcMfa914S20bfW4BOWHuhnfyykbUAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nB6j1neL;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69443606A33B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69443606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nB6j1neL
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b083afebe4so728117a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794870405; x=1795475205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TIKThpPDZ4NJSXYRfFfOL841Z/zWYVoqxjZupCxQAek=;
        b=nB6j1neLP6BTtlE9eLU58Dg5+zZMn4yWSoSY1E5fQMLVTWZoksrY3sjPGHmbYPREpg
         ytJ+72GHTehAS6Wr+r8k22lsqzsa628Lo4lNDr8CXApne874lOtsHkT8m5QllOm67Lh2
         7S6cydkvakpwx9YFJkw3cPcJyo2mAAFXh34Cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870405; x=1795475205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TIKThpPDZ4NJSXYRfFfOL841Z/zWYVoqxjZupCxQAek=;
        b=qSXvPwhG4ESR/3gUMyXTNR3YVJKv7xpBXatnbXi+gYjtZSRt3I+Beyw4v1DNcdm8X7
         krDFAmMaZfVhwqWAhobFwyJ9hur9i9pBtI2htcA/dOi09BJ5Rj8yT8ZH8HvrjSzBD4db
         zIU0OTAd5/UE1K2xdH6S+hii4jP04VO4apv7fkS80ty25WsuD8NHvfcrR2NGuNyN8MBS
         tagaybYIL1qM8Rv7llKiO+vWE9YOdLmjKh9yAUxJov38ZJdt7f7j1uJ3jqgclN0TLPvN
         +GjliW9HSWyR3FLbby0lFzH9v/+ek5w3e9FC2FN5Pi3QUh5Ba9FDxF63hOKFmPKS5X27
         tmwg==
X-Forwarded-Encrypted: i=1; AL+hErEJER1QmHTzDx/Wc2n5kVGwxibYtJYAQes3L+Xw1PkXcryCXQG0P+VL/avYa4QoJWS74aSO13Fe5YQP2XM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+R47JJeYCObj4hm60vjbzf6xlKmtoNWZM1/01YdiDnng1QaV5M
	Tu9lVEw5LtmCPdLnWUSJmfXunlH9TpZEz8jMIV1VWcpVfQUGdr3Lpz4+MOvEXyrZPw==
X-Gm-Gg: AZFdTZeUEnNaH6Ewrx7UkdNj6JIyr+EN8qaIdH3c4JszmrcnDLHZAJIUzT8jFTQkkBk
	kWdlr+/AAnDJGjQt6Hy6JUxqBvj7Bbg341Lbol6LfPSenT1pRAnYTxc45BZU4pT48SRbTW4bmF6
	JGu1g1gzw7vxg/cKvR86r30XPZtuQkTlcwHK/cmDdTSuNoYDiygottAGT23rp/gI5UMnUTlVWrp
	PTcHK2o+kZ8x6mmnrZkxtpsIKaRJMbUc3HbsQXER63cdkXjg4Me9kxoY7snw5BulMf4SCfj9/Yl
	fjrSdEb5b0gRbpNOTTIB3PAtl+xa01SGn3OW4IK39JP7vgXdDSnNu8/0t7C/orsyqO+I/Arr9Zv
	QHN6LX5nvuSd0q27cg6G3uSjpznRa3BRvcJbyQYJkoPStBfZ5niz1lQwxFGVTyNgk64pWwgObK3
	ME/MwXD0IS7uPJ2Yo12pl8ITzneqpCl5xP8enNLU3vSNKqmmVtee0KONwiOfa/hhprNMtjwkyCM
	P3V748KoVaT6Xs6+4YgIGPggMrYVItpAWnOcDNDgU1llBw0GrCvUOKuCXJu+H6P4o0TlMWq9iV0
	doWHQQDK/rWwMTQ0odGPjwSjaV1Q1pD55x1BplGQED2FVVETxjWoACcLIik1DSybICipwPWR9IY
	HNbqI3t7i/sz0nTkI
X-Received: by 2002:a17:90b:5546:b0:3a0:238b:db4d with SMTP id 98e67ed59e1d1-3b1b0a49be1mr17581397a91.5.1794870405500;
        Mon, 16 Nov 2026 15:06:45 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b1b3b110c0sm9530818a91.3.2026.11.16.15.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:06:45 -0800 (PST)
From: Jeff Xu <jeffxu@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Jeff Xu <jeffxu@chromium.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Marco Elver <elver@google.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chia-I Wu <olvaffe@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Evgenii Stepanov <eugenis@google.com>,
	Ian Rickards <ian.rickards@arm.com>,
	Jann Horn <jannh@google.com>,
	Jeff Vander Stoep <jeffv@google.com>,
	Jeff Xu <jeffxu@google.com>,
	Kees Cook <kees@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Collingbourne <peter@pcc.me.uk>,
	=?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?= <ptosi@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Will Deacon <will@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Allison Henderson <achender@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	kexec@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/7] mm: kasan: skip KASAN for GFP_HIGHUSER
Date: Mon, 16 Nov 2026 15:06:20 -0800
Message-ID: <20261116230627.3537051-1-jeffxu@chromium.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Currently, GFP_HIGHUSER_MOVABLE includes __GFP_SKIP_KASAN (commits
c275c5c6d50a, 70c248aca9e7, and 0a54864f8dfb), allowing movable
userspace page allocations to skip KASAN page unpoisoning on allocation
and poisoning on free under CONFIG_KASAN_HW_TAGS (ARM64 MTE). However,
GFP_HIGHUSER does not include __GFP_SKIP_KASAN, even though it shares
the same kernel-accessibility contract in include/linux/gfp_types.h
("for userspace allocations that may be mapped to userspace, do not need
to be directly accessible by the kernel but that cannot move once in
use") and differs only by !__GFP_MOVABLE.

Moving __GFP_SKIP_KASAN to GFP_HIGHUSER addresses the performance issue
below (following up on the earlier drm/panthor discussion [1, 2]). The
swap issue from that discussion is not addressed by this series:

1. Performance: For every 4 KB page without __GFP_SKIP_KASAN,
   mte_set_mem_tag_range() tags all 256 16-byte MTE granules (via
   STG/STZG and DC GVA/GZVA) on allocation and again on free. In
   graphics and UI workloads, DMA-BUF (system_heap) and DRM/GPU
   (shmem/TTM) buffers use GFP_HIGHUSER; while steady-state rendering
   reuses buffers, window resizes, surface transitions, and app launches
   synchronously allocate and free tens to hundreds of megabytes (~32 MB
   per 4K RGBA frame) on UI/compositor/render threads. That takes a
   significant share of the 8.3 ms (120 Hz) / 16.7 ms (60 Hz) frame
   budget and thrashes CPU data/MTE tag caches (especially on
   cold-cache free). On Armv9.2-A, skipping KASAN cuts ~32 MB DMA-BUF
   alloc+free latency by ~80% (~98% faster close()) and improves the
   OpenGL score of an app-loading benchmark by 15-23%.

2. False-positive KASAN report after shmem swap-in readahead [1] (not
   addressed here): when a shmem page is swapped in,
   swap_cluster_readahead() also reads the neighboring swap slots and
   allocates their swap-cache folios with the gfp mask of that shmem
   mapping. A neighboring slot can hold an unrelated page that
   userspace maps with PROT_MTE. If the mask lacks __GFP_SKIP_KASAN,
   that page's folio gets a KASAN tag in page->flags. When its owner
   faults it in, arch_swap_restore() writes the saved userspace tags to
   the memory, but page->flags keeps the KASAN tag. Later kernel
   accesses through page_address() then use a tag that does not match
   the memory and are reported by KASAN.

   This series does not fix the readahead path. It only removes one
   way to hit it: shmem mappings that use GFP_HIGHUSER (e.g.
   drm_gem_shmem_helper / panthor) now pass __GFP_SKIP_KASAN to
   readahead, so the neighboring folios no longer get a KASAN tag.
   Shmem mappings with other gfp masks that lack __GFP_SKIP_KASAN
   (e.g. GFP_KERNEL) can still trigger the report. That issue should
   be followed up separately, for example in [1].

What changes for users of GFP_HIGHUSER pages under CONFIG_KASAN_HW_TAGS
(other KASAN modes are not affected):

- Access through vmap(): nothing changes. Those pointers already carry
  the match-all tag and are not checked today.
- Access through kmap_local_page() or page_address() (for example
  ramfs): accesses are no longer checked by KASAN, as is already the
  case for GFP_HIGHUSER_MOVABLE pages.
- Buffers that the kernel itself fills (pipe, FUSE, kexec, RDS) keep
  KASAN checking by using the new GFP_HIGHUSER_KASAN (patches 1-4).

GFP_KERNEL, GFP_USER, slab and vmalloc() allocations are not affected.

Patch 1 adds GFP_HIGHUSER_KASAN, and Patches 2-4 use it for the pipe
buffer pages of pipe and FUSE, kexec segment pages and RDS message
pages, with no functional change. Patch 5 then moves __GFP_SKIP_KASAN
from GFP_HIGHUSER_MOVABLE to GFP_HIGHUSER. Patch 6 adds a KUnit test
(page_alloc_skip_kasan) verifying the __GFP_SKIP_KASAN page allocation
contract under CONFIG_KASAN_HW_TAGS, and Patch 7 adds one for
GFP_HIGHUSER_KASAN (page_alloc_highuser_kasan).

The conversions come first so that these buffers keep their KASAN
checking at every commit of the series.

Testing: on arm64 with CONFIG_KASAN_HW_TAGS under QEMU (virt,mte=on),
every commit builds and boots, and the KASAN KUnit suite was run with
kasan.mode=sync, async and asymm. The two new tests pass, and each
fails when the property it checks is broken on purpose. vmalloc_oob
and kasan_strings (async and asymm) fail there with or without this
series, and a few other tests fail intermittently under QEMU. The
changed files also build on arm64 with generic and software tag-based
KASAN and without KASAN, and on x86_64 with generic KASAN and without.
The FUSE, kexec and RDS changes are build tested only, and the KUnit
tests were not run on real hardware.

Tooling: an AI coding assistant was used under the author's direction
to audit GFP_HIGHUSER callers, draft GFP_HIGHUSER_KASAN (patch 1),
the subsystem conversions (patches 2-4), the page_alloc_highuser_kasan
test (patch 7), and the revised skip-test helper (patch 6), and revise
patch 5's changelog and this cover letter. It also scripted and ran the
builds and QEMU KUnit tests above.

Feedback and thoughts -- particularly on whether any other bare
GFP_HIGHUSER caller using kmap_local_page() would prefer opting back
into KASAN via GFP_HIGHUSER_KASAN -- are very welcome.

Link: https://lore.kernel.org/r/20260519-panthor-kasan-v2-1-b7384458f076@gmail.com/ [1]
Link: https://lore.kernel.org/r/20260521105148.5497c281@fedora/ [2]

Jeff Xu (7):
  mm: add GFP_HIGHUSER_KASAN
  pipe, fuse: use GFP_HIGHUSER_KASAN for pipe buffer pages
  kexec: use GFP_HIGHUSER_KASAN for segment pages
  net/rds: use GFP_HIGHUSER_KASAN for message pages
  mm: kasan: skip KASAN for GFP_HIGHUSER
  mm/kasan/kunit: add page_alloc_skip_kasan test
  mm/kasan/kunit: add page_alloc_highuser_kasan test

 fs/fuse/dev.c             |  2 +-
 fs/pipe.c                 |  4 +--
 include/linux/gfp_types.h | 15 ++++++--
 kernel/kexec_core.c       |  2 +-
 mm/kasan/kasan_test_c.c   | 72 +++++++++++++++++++++++++++++++++++++++
 net/rds/ib_recv.c         |  2 +-
 net/rds/message.c         |  2 +-
 7 files changed, 91 insertions(+), 8 deletions(-)


base-commit: 4b028d0cedf95f66b8c5294fde2d7d698bf830da
-- 
2.56.0.611.g1030f0b940-goog
