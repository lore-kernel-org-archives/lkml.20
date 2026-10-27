Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793074933;
	b=SvfXL/Gq+xTdIX2M5ocFXHm+nEYhv0T+3jc8jlhG/xB6ayIlZjm1DFWwWZNlVx5XMBGE
	 pE9l2zLzEG69IKtpok0D316uyQAC4ypYcOawDjVRB37UELmrxkSREmFsbANOnlI9M6/ig
	 t+1xmFLSkjvqkjlQmG6WA0tzA8scvR17qdJR3X9iXJ3TK95bu4Sh3XSUSWgiZmfBTpXx5
	 YtOosTij30oP1zkAlj5LvomV03gPwnGDEQ8d3/YQCAqF+IMyJoGjeH9giS8j8KWi9HI/5
	 YKeLD6tJgshHghM40wv92nRGrcHhPCflcW53/KZWWKX+uyt2vcZUe78R0nS3FF3yHUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=fubOaxOgmofN/3iFYwSrZzfn2/O9nYxlfixW+9HNaRE=;
	b=S07m0teR5jNJe1fKl6hr2bHOmdhdvmKsJQhwRx4IUHMGM3+orxipyVoPTxoQd221q9qB
	 hmRfX1OKmLYoQ8mnhaTBDPINTMd7y84oRUXAGyesZG4DbTSp/dejLRvb3SW0jpixHLkrZ
	 qv4TWzqlyi3RtPjw+3OlF41+0UyzCD5JA3k8RGIfDWLTDNCPEep7sJlFNIEDhBVlCIs1W
	 51DZy2NDTgbAgGTRYK7E+pRSzWuWn7iQ5jQ2Mg16gWA0YqRsyetvsaQVd96XI32zxPVRC
	 3F4Z8lwcXR8XBQ8/oyzUKW14kfVDBmDeUy8amRpArjbWVGRh9uwjy09LLPSY4NCDbfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=GMv5hpEW;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E76F606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E76F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=GMv5hpEW
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91b54d1e9cdso29982936d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793074932; x=1793679732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fubOaxOgmofN/3iFYwSrZzfn2/O9nYxlfixW+9HNaRE=;
        b=GMv5hpEWLffJj9XNe0rwhZUg80o07hoik0Uc+bdjO8vwxOQnXkUSF2+8mMCp1rmSGt
         422HUdWwtLS1VB4wScEs1vP49yWF/b/QIcZxcCvLGxpzxfdkG/QO4ChVjpkFxuKC50av
         6oet7ESWbw7JYI0zgNc+S3eHXRo19L931xfvoz5yHwgtnffWGdvqjFpmhI5R8RXOk1h8
         0QkNJnQBTryIkwOvq8GkKCIoMwQgtoiUncL6CeJHYrfyrJOlDrurfXyQUbvTS6lnsRWJ
         ZSvfU9OVAQxYd/F/o7A7Mx0OejzztF3cokITVw5wmyN2qP8i+PKMkKIgvSpomA/S4/Mz
         xU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793074932; x=1793679732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fubOaxOgmofN/3iFYwSrZzfn2/O9nYxlfixW+9HNaRE=;
        b=TfkZpn//3tfO4uzD7eoCmB7nJvKcQ/Pqdgs5JirWASZarGf/OOUD0mfOLXXqPf//s/
         +/0wk4FrLL6hyMn2beUc7RauS1cihGIdhnPg6f9+d6Trnb4YHA25YkHMzIYlnn3D+Po3
         fbfhf1ic6xRk3hUcoCrrTdzOxvmtchvoUekq6kJvDQboPK8bEI0C29eyHBkGiswlMAkb
         jLrj2h/QH4sJKXBg4Sv52ooC80+C0Yfhz/RSgyOCVoAJAWe/169l/cnDzxAAanL+EvB+
         Vk3GIx1E9b9phskviK8TITf7H1Ra2NCmCvwFlnrZoCffmaJ349CjrwCYR5pjNrp+xV6J
         3KXw==
X-Gm-Message-State: AFq9FYLIkiC4hKRUxVNXQ3ly5LbTqTrMiDACG9Vzlc+D2A9bptV3Fp1/
	y6m7H2AgMIWXXGv8KrMjrQLgiRGBl5pi++TXRL45Eosxf29Vr1hwC+/J1BrZia3f59WmEujG+5E
	DkjEgbRA=
X-Gm-Gg: AYBFou3kihvwh6ygBr5Af5HLtbDWk4WQMlHGq+adjERihev8fcOu1Voa9LEmcCbndHF
	Eo+dddvlivIG66v/IxWKOIbFUbGCSqXmF9bhw8wtOJYfxEVPnZaivS85JoJL7h3Xm4QNH125Tin
	gDORxdI33+mMQ38p42EfE9HmM21AWCSFHQBQ9ws9INjkbSu2/cTxel57/i/Y9O465fBTmQHCx+n
	CM7mcfVNBEss4qqEr9Qk8NlQk8je3Mw/B1hnGv5FzIBog8hV4uaqMkzrFNToqjSpf6pBOgoAmiz
	7gHe89flX20Jic76USCUN7QeDf8YF4U0TGDjox8jMBzDy2OXVQqRU3lJwVROk4GOu/sOY6FLMSl
	HtHZ5OOWxE11mP+IEgqGd/49XHog2V1HA0zp3ohG6IcgvG/EY1JOdf0OKjKAGnsHsgQ0OmqCVNt
	TnqjGSk/3ObDyEPohJQqGlt0OEMr9ACXZrE2ffJAF1sogOXrojqf7lq4cDm3q+Jp4dlgxIaWOec
	8/4nMspfCtP8R0gzzoIPEbC21qdAVNqgjCMA4u0ZZkmLqUNJdYtKGGWOywgAmdNhl9xaWdzzSp2
	46lZ3ZwtbHyy/XHuXijxPddfQkgh7obUpgg/a0aHKQ==
X-Received: by 2002:a05:6214:29ed:b0:91c:65d0:1d78 with SMTP id 6a1803df08f44-91c65d0312dmr64203956d6.50.1793074932283;
        Mon, 26 Oct 2026 21:22:12 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47bd01cdsm91139676d6.7.2026.10.26.21.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 21:22:11 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	linmiaohe@huawei.com,
	nao.horiguchi@gmail.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	osalvador@suse.de,
	muchun.song@linux.dev,
	iamjoonsoo.kim@lge.com,
	anshuman.khandual@arm.com
Subject: [PATCH 0/6] mm: fix pfn walker races with memory offline
Date: Tue, 27 Oct 2026 00:21:58 -0400
Message-ID: <20261027042204.3741307-1-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
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

Several pfn walkers check that a struct page is online, then use it
after memory offline has poisoned it (CONFIG_DEBUG_VM) or removal has
freed the vmemmap.  Five of the races crash the kernel; the sixth leaves
an offline spinning with the device hotplug lock held.

Patch 1 adds pfn_walk, an SRCU-fast read section that offline waits for
before poisoning the memmap.  Patches 2 and 5 use it; patches 3 and 6
hold get_online_mems() instead.

  1. compaction scanners
  2. page_owner reads
  3. memory_failure(), soft_offline_page(), unpoison_memory()
  4. alloc_contig_range() undoing another caller's isolation
  5. alloc_contig_pages() isolating a range that went offline
  6. the hwpoison-inject filter

All six are for stable.
  Patches 2 and 5 need patch 1
  patch 5 builds on patch 4
  patch 6 builds on patch 3

Testing
=======

Each race was reproduced on unmodified source in a QEMU guest with three
NUMA nodes and a pc-dimm left offline at boot (DEBUG_VM, KASAN,
lockdep).  A test module holds one task inside the window while the
offline or eject runs, then releases it.

         base                           this series
  patch  outcome                 runs   outcome                 runs
  -----  ----------------------  -----  ----------------------  -----
  1      GPF                     3/3    offline waits, clean    3/3
  2      GPF or #PF              6/6    offline waits, clean    6/6
  3      GPF, or unpoison of a   9/9    blocks, -EIO/-ENXIO     9/9
         poisoned page
  4      offline still looping   4/4    offline completes       3/3
         after 30s
  5      GPF                     3/3    offline waits, clean    6/6
  6      #PF                     3/3    eject waits, -ENXIO     3/3

Without forcing the window, offline/online cycling under compaction
faulted in 8 of 24 runs on base and 0 of 12 with patch 1.

Cost
====
I was unable to measure a discernable cost beyond noise, stddev of
walkers and scanners runtimes on real hardware was wildly inconsistent.
Leads me to believe this change is largely imperceivable.

Gregory Price (Meta) (6):
  mm/compaction: wait for pfn walkers before poisoning offlined memmap
  mm/page_owner: hold off memory offline while a page is read
  mm/memory-failure: keep the page online while handling it
  mm/page_alloc: don't undo another isolation in alloc_contig_range
  mm/page_alloc: keep the range online while alloc_contig isolates it
  mm/hwpoison-inject: keep the page online while filtering it

 mm/compaction.c      |  8 +++++++
 mm/hwpoison-inject.c | 55 +++++++++++++++++++++++++++++---------------
 mm/internal.h        | 41 +++++++++++++++++++++++++++++++++
 mm/memory-failure.c  | 31 +++++++++++++++++--------
 mm/memory_hotplug.c  | 16 +++++++++++--
 mm/mm_init.c         |  4 ++--
 mm/page_alloc.c      | 35 +++++++++++++++++++++++++---
 mm/page_alloc.h      |  7 +++++-
 mm/page_owner.c      | 45 +++++++++++++++++++-----------------
 9 files changed, 186 insertions(+), 56 deletions(-)

-- 
2.53.0-Meta

