Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596228;
	b=xX2/NYe/4hBJXDDMBeeiKcsSDX5GsHOPC/glFfrKYbU06JAVle3y+hnRaBMxIGaE2L5l
	 4A30Tbx8bF57T91lUbyUBXDAeqJuiP4ufxwNtbAyuKKxZGtKyOFXn/OGxUNr5I+wUwc57
	 d32GIBdGgJLWM8SPyvsTtae8hACKEV1QAASl8lQ3SeP+FqghMBhUOb4i/ihQOuMpKNAr8
	 TdGpHEIUwpoamW0WxRHPB1BkhJRPS72/JUI7XobpGHShyNdrmxn8ElQCTiieWFtwFFeDp
	 zgee9FesqTs7Xg2mrbPQyMT8zBdoaKwudeEWm4zPVmx+BKRjooIeOxj70FDwA1Y/jBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e1AVEuQ7/0Q/MGJ9DZTfOv+grpHr5U/1zcdAaccW6t4=;
	b=wxOCZpmdlPDAjowhrLX14ZFyPs0vfo3cLB3SVN8FOcNLmB/GgU8crR/H8FN6MW+x5O3A
	 fvVAm30KIAE/aqnENVn/kKQ/xTZmhCoVR7ykJYbH/ygkbcOh9E+4VKCskhzVjbf6OLNdE
	 mpoj4yNpcOhvbki8DnTC3DSppk41QRDcXsCiLYSoCEK9nn0fiG3e6lnMXuvwHq9mLBm1A
	 ARYuiqjgfBYDDZ0BiP+FNGg9IotqvcpD8F7gGjymQWNcBwxnJ1lQwodC8wsyI2ggMwII0
	 J0awKGbVLbXmp27Lu3hyVwC48VOKsVdZybQwNO8ooKa5PQQK0M1rQ4SC21JuO/udR2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=readmodwrite.com;
	spf=none smtp.mailfrom=readmodwrite.com;
	dkim=pass header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=O8ypCIle;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32EE606D06E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E32EE606D06E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=O8ypCIle
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48fd2e38825so919496f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20260707.gappssmtp.com; s=20260707; t=1794596226; x=1795201026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e1AVEuQ7/0Q/MGJ9DZTfOv+grpHr5U/1zcdAaccW6t4=;
        b=O8ypCIleIP+p01ypTCpzmJpnSv+ilNvTrklF/wSvqzxfXXEQpSAfbuy3S+kuuk/i8e
         lSxXjFvSSUZEwCZInwKF1RDCb6I9GhpzHmpadVk/9DrTG1MJ1470ils2YBc/KfO/+xl/
         MSaB2PMelxgSC8PCuLa47+EtN2AbJcOveVrbVZwv5RyLfSZfcf8R1GfjjazuZ7gUXh/4
         20LRssHAweRPYh/ZdcUJtU0eYsci0i/OlaCupHJnSspZYfOeZW3cRujKwqZzS88mmNfl
         K2iLb3PBSy+Z2pNIyikCQvAy2N/3f2Fr3i5Fjn6HRK4kc8dU7au4ejWVCeHQsd8K9ut4
         kYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596226; x=1795201026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1AVEuQ7/0Q/MGJ9DZTfOv+grpHr5U/1zcdAaccW6t4=;
        b=YjIG4ZCopJvUMB/RDfPiZczpn7o4ZBCORSrIr2tG+l5E5EqSzSSW/ZUHFQYW2dtYST
         wqgTBGIVwQxuvmBj3T6oZiyYa/9pHoAWRugsbdLsaWemIUEX3fcmUmQKRNnGB/sGVQdk
         V0/c/2NKMBzrWgjJ+q3VaYT9YmjUexzz2JWH36074TdgxI1Zq8EL+ZSyqv+RWE6TbT7Q
         OoDlMCB3IfGXILcxgCR+3Pf2VRDyesBvP7bNEFJX+oTIp/ubi80yl+j5dEt+fnapOoJu
         0zWP57e15Pf48aFACqiDepOuaL8lajOimt5sEFOcqm4NN5Z3+7za4VVk+fckEry8GcQz
         r4ww==
X-Forwarded-Encrypted: i=1; AL+hErGXOOQPmMLcvvFy81W12aFvhk/Hvz3anXo3/S4GbC6SIO8eeNoRBUU8qqH9cqa0V2JUxaJiV8ReiQYoAAM=@vger.kernel.org
X-Gm-Message-State: APuU4Z81s1Mft21rYC78sFpjd9dNt39w0nzK6wUQXBfBjNzE3JJqT3jt
	Fi6bcuoepe+KpS9i1lkYr8KJtVOttPWu/JVBRbJevlNCXdOshCX2HUjd8tBskGz1w8w=
X-Gm-Gg: AYBFou06gJ8FcywvccSnFyf00HYXKKskRL5fr9McPEqdJDKtxwlM3ocToIAsJxeBFq1
	T7SSoBFKzBf+pEQO9d+wOv/09VENUsLWePBfCnXCNCWI7QY140tZzuCgkV21j3PeJx0Btxfx9Ih
	D1FwdQaeKoBHhGEm915tpgL2M/cIRx+b9Fy4TFAJ5W0ttKDRB7nkIp1261+D1Tzcqdy3xqfq5O7
	F24CWauvr2sOhELSF33CeixlJDl6ffAY5k/u9NMO/Vj0nt4QJzbgE+nbNLELzo4BypDJbMS9VYn
	DwUxZgFfbU5zCi4cWgQUIm+7n7pyXElT2DcIz8jbHIr3rxkXEQfDhIG7EtgCJKT9u4nQlmbqcum
	MHaiXu4IyjWVeoZ7Ui3RGV8xw9/KIZEhvIadOeZ2M5dX2283FugnreB5VaJvs3LXI212fxF53nF
	M4qvBHNd/fMAc/ICLLvUHNkFWBa0VUCACosmfGpA/yPYBgDmja9xdUPDD46tf7RTHq0BL3pUWFS
	VRhlIo/lfdMAepJRnUvdIV71kdujSJLR6uq/N2mFbn6DnbjbrbC+W792VJH17OvEXeGYXW+i5N5
	tUbgBqu1oW7HOh5LxbbH2h+KVnGBlA==
X-Received: by 2002:a05:6000:4559:b0:487:27f9:834 with SMTP id ffacd0b85a97d-49c725e5a73mr4785615f8f.41.1794596225990;
        Fri, 13 Nov 2026 10:57:05 -0800 (PST)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:ec8::179:1b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm6417589f8f.21.2026.11.13.10.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:57:05 -0800 (PST)
From: Matt Fleming <matt@readmodwrite.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@kernel.org>,
	Caleb Kan <ckan@cloudflare.com>,
	Caleb Kan <calebkan1106@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	kernel-team@cloudflare.com,
	Matt Fleming <mfleming@cloudflare.com>
Subject: [PATCH v3 00/10] stackdepot: store compressed frames in stack records
Date: Fri, 13 Nov 2026 18:56:52 +0000
Message-ID: <20261113185702.1332171-1-matt@readmodwrite.com>
X-Mailer: git-send-email 2.43.0
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

From: Matt Fleming <mfleming@cloudflare.com>

Hi,

Cloudflare runs KASAN on pre-production servers, and on some of them
stack depot keeps running out of pools even with stack_depot_max_pools
raised to 65,536. Once the depot is full, new persistent traces get no
handle and later KASAN reports lose the allocation and free history.

v2 of this series [1] tackled that with a trie that shares common frame
prefixes. Marco asked how much of the saving came from compressed frames
alone [2]. It turns out we can get a decent saving with just frame
compression and none of the trie complexity.

When every frame of a persistent record can be compressed with the arch
hooks, the record stores 32-bit frames instead of unsigned longs.
Evictable records are always allocated at maximum size, so they stay
uncompressed.

On our production KASAN hosts this reduced stack depot pools per 1000
stacks by 41.5% on x86-64 and 27.1% on arm64. arm64 saves less because
we run a lot of BPF programs, and their code lives outside the +/-2 GiB
range around _text that can be compressed.

Compressed records aren't contiguous unsigned long arrays, so callers
can no longer borrow stack depot's storage. Patches 1-7 move every
stack_depot_fetch() user to stack_depot_fetch_into() or the print
helpers and then remove stack_depot_fetch(). Patch 8 adds the arch
hooks, patch 9 stores compressed frames, and patch 10 teaches the GDB
helper to decode them.

Changes in v3:
- Drop the trie backend, the stackdepot.trie_enabled boot parameter and
  the trie KUnit tests.
- Drop STACK_DEPOT_FLAG_COUNTABLE. page_owner reads traces with
  stack_depot_fetch_into() instead.
- Remove stack_depot_fetch() now that it has no users.
- stack_depot_print() and stack_depot_snprint() decompress one frame at
  a time instead of copying 16-frame chunks.
- Store compressed frames directly in hash records, using the u16 size
  and u16 flags header layout from v2's COUNTABLE patch.
- The GDB helper decodes compressed frames instead of rejecting trie
  handles.
- v2's patch 1 landed as 8f56ea8e0706 ("stackdepot: stop preallocating
  after the final pool").

Thanks to Caleb, who wrote v1 and v2.

[1] https://lore.kernel.org/all/20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com/
[2] https://lore.kernel.org/r/CANpmjNMP=NdD8ZE9rPwikUBcLwc8V=J648X05YGPn41yAZ5hmw@mail.gmail.com/

Caleb Kan (6):
  stackdepot: add caller-owned stack trace fetching
  mm/kmemleak: use stack_depot_fetch_into() for leak reports
  kmsan: use stack_depot_fetch_into() for origin reports
  mm/slub: use stack_depot_fetch_into() for owner tracking
  drm/locking: print deadlock backtraces with stack_depot_snprint()
  stackdepot: add architecture hooks for compact frame storage

Matt Fleming (4):
  mm/page_owner: Read stack traces with stack_depot_fetch_into()
  stackdepot: Remove stack_depot_fetch()
  stackdepot: Store compressed frames in stack records
  scripts/gdb: Decode compressed stack depot frames

 arch/arm64/include/asm/stackdepot.h |  37 ++++
 arch/um/include/asm/Kbuild          |   1 +
 arch/x86/include/asm/stackdepot.h   |  37 ++++
 drivers/gpu/drm/drm_modeset_lock.c  |   5 +-
 include/asm-generic/Kbuild          |   1 +
 include/asm-generic/stackdepot.h    |  19 ++
 include/linux/stackdepot.h          |  45 +++-
 lib/Kconfig.debug                   |  16 ++
 lib/stackdepot.c                    | 164 ++++++++++++---
 lib/tests/Makefile                  |   1 +
 lib/tests/stackdepot_kunit.c        | 312 ++++++++++++++++++++++++++++
 mm/kmemleak.c                       |   4 +-
 mm/kmsan/kmsan_test.c               |   4 +-
 mm/kmsan/report.c                   |  28 +--
 mm/page_owner.c                     |   8 +-
 mm/slub.c                           |  12 +-
 scripts/gdb/linux/constants.py.in   |   5 +
 scripts/gdb/linux/stackdepot.py     |  23 +-
 18 files changed, 650 insertions(+), 72 deletions(-)
 create mode 100644 arch/arm64/include/asm/stackdepot.h
 create mode 100644 arch/x86/include/asm/stackdepot.h
 create mode 100644 include/asm-generic/stackdepot.h
 create mode 100644 lib/tests/stackdepot_kunit.c

-- 
2.43.0

