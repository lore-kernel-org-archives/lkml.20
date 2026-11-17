Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917225;
	b=YjxCyt9T+8euX3i6RYXFs40Qa4a1tfQM30OrIaC0/o9nQ29hsWF9/sJu8gVybnln4MnX
	 fZpwWdN5nyN2Sn5kIhXbkMtHK76TUoVrBxjW+DGrx26PdRfAL/qKb6QXqteY8ANZjHR/f
	 Vpdgp9WdTDE+mWoa/RSWJT/tVmwZYcDDVD8wxfymkVkMlDM6apnGOc86sNXHB4z/uIXeS
	 8eYQMDNHEZzm0/AiGihsemDjBIMVRYw8AK0+sT/DFfD+ZT3Bq49FBEozSSQawzx4WOIHJ
	 l8DkD6Yu75ooCmYfm9c5z3TYoulzzOn+lhJ3prV9hS7Sah0dWofsn0aFS9w3DpQhPhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WWAo/gwd4eMoC/+fl3ejBvS36alJNcf0i4jJ6DJ7zUo=;
	b=yQHyHubogUNEF8RJMOc92LM8F/P/eiwUiWkO9LVOPk1uJATix+whNJGJrCJcjCvGbTbX
	 UrsgfCl/gOjeek886ZYsTjG9b/5RgTYUuWz/ajY/5DssU24DfxHhOJC3kqN5G7grOupou
	 ONBwgeTI6Socl6VH8U42FUCZdK0TmHc1dgt+qCJeU9lQZzn2AZ7VGoKr+auEixHZvhiP7
	 pE1pTvwu13aLkm9TOFIv815WYXsnXoHfEDNPeEhtwKAe9pRlQOlvsMFEnkap+atLPLsKp
	 DnObMGyumfE0GI1S2fZtxfefmxjT06Hc4RgV/q8qDHA/TIMppo5wEeAlr/BbpG8e3jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=cHbIKhuJ;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3DB606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A3DB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=cHbIKhuJ
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso5698404c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794917224; x=1795522024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WWAo/gwd4eMoC/+fl3ejBvS36alJNcf0i4jJ6DJ7zUo=;
        b=cHbIKhuJXQm39ojplyF68OrX3o6M4TKhuXxVAYbo7qSYxv9ZSirxKr0F3V7fNaE0D/
         u/sSUDRGvIP+7olL97zw1YQTWJk9PPyOKD6N074pCfYzp65J5zQFRiYBYMONiubC2IuM
         Zlky56VD9FpyGr2JTQGBJtpILpLcdn1lkh9bKdHMtIPZ2yudq9N8R3dscopBUNnRRTgM
         xewrVrzArjQZDJvhGvRDuR5vmZVFCnQtEmK1W+hSA8WOs7AkKIROak4UmCpUYB3Q2ChY
         tfkC+I2p1ikD5ewq/pWAR2Mp34l6L5XpFpj2siDatnrzaCUQIEYCyYOZd+73scrQ1odx
         eDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917224; x=1795522024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WWAo/gwd4eMoC/+fl3ejBvS36alJNcf0i4jJ6DJ7zUo=;
        b=yHP6Hhd+XGZZkUowgSz5sm4j4YP7y0L+23nxhaOT0ncvc4QP/0ZgZeH+Fp7mSdo9G4
         WEMCdQNCUaQHd/pvyzvOvenHC83ERMxplVMgu92ggKYek+KbUYrYxmSrkFFRgTreMT5P
         y6J0DROMXNf6aCF8gfQXGDjLIUhkxvNT32mWUvhLMSBfJgMtKozb9gz5C1BQoCqyT24d
         1Fnr3BIojdjf6uHbP89cvdrvlH3zxcWLYhZiqLRqUqgtQCn9v3lA8ayyNZQm6dsTB12S
         e/n7ijkx4Dy4xHQFuC6VMToCpfEaqx6G6/+9GoWFu9dyVrNbbgT9YMI8f1OtASTDWM5i
         Lu1w==
X-Forwarded-Encrypted: i=1; AL+hErHxW8sk9Jku5r6YhrWPvOZLFqZSZP0aTfc/6hXkaGaHhcVvNq3XQ3xZCFPZUpYF7hVyJvPjZghW2VrJpeo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8go0CltC9l2DF94XXIvJ1Or8Zd/OwcdNgjdWLSr5N0udlMS3Vc
	f9aZSr3j4pEsHTEUFwCn/slEREpF/nf9DSOEf7w09o62t/IoyLK/t9jcQftsii7fJ80=
X-Gm-Gg: AYBFou3zN0xR/ZMIEEG8zNyLPAn64+5fuWPACdIlBFjsOd6NL6a+24TLlODvf0RfMzr
	NfrE0NvFSd+UE+OgeQaTtpWFtcQQ/aIbEX3HkE86lmv7n+Y5ITNIMQg6ylrfHKd50LKFcw/fOet
	mhT130OPlcWKDde36+Wl8DNd2ejDayWDFxC4kY4grHdJSget+ASIX5VXp+Xb7hYNRLaht3qFGOu
	2fuIyGcZmyhARbUvVI6S9q+//eIGZT1dAia/FRu6fHdsbxK8zPv26WS677MXDnm06XWTw1qfQL/
	NRhH3JoK+BAla+CCn1z6tWJekdqNgBKZb8R+GT4ivYePcsITdCSu6plYIT25fz3DlqrOdfKX/Up
	yW7obXWKl57aalsHF5CusTPVd0nVZe3fI/67uXQn9TsdVqp1Qgz5Y0RI3BfqMm09xFS8TIek9NW
	Rcyb0XNWdWIgK+rlaUc2clQ6Zq1yz23y2RWCAfDrftvgtt6jEqxqs2e3Y5YcY8bu1kFVwF7eQWP
	SEA+7VMoTpWNeBbSUJ7jDxyN0hzU77Jw7gGEf8pEQZOb44/4vwccJZvYPDWm8xj9GugEi5hJNHA
	5Zb2pjLTp3dvF4BY2LWLc6qWsdGWNR8prAbNaLwd13Zf9lBaawl4+Jp8IiDZgYEFDw==
X-Received: by 2002:a05:701a:ccc9:20b0:1b5:3616:59a1 with SMTP id a92af1059eb24-1b536165dc8mr3075671c88.8.1794917223191;
        Tue, 17 Nov 2026 04:07:03 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm47347116c88.5.2026.11.17.04.06.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 04:07:02 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Chris Down <chris@chrisdown.name>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pranjal Shrivastava <praan@google.com>,
	Ketan <ketan.kishore@oss.qualcomm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sashiko <sashiko-bot@kernel.org>,
	kasan-dev@googlegroups.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 0/7] KMSAN: Move per-page metadata out of struct page
Date: Tue, 17 Nov 2026 20:06:20 +0800
Message-ID: <20261117120627.50601-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
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

This series fixes a KMSAN metadata-loss bug triggered when boot-time
gigantic HugeTLB pages reinitialize their page descriptors after
kmsan_init_shadow(). KMSAN currently stores each page's shadow and
origin pointers in struct page, so the later initialization drops the
metadata mappings and leaves their backing pages unreachable.

Preserving the pointers around the HugeTLB initialization would add
KMSAN-specific state handling to the memmap path. Moving
kmsan_init_shadow() later is not viable either, because it allocates
metadata from memblock while gigantic page descriptors are initialized
after memblock teardown.

Move the metadata pointers to page_ext instead. page_ext storage is
independent of struct page contents and is made available before
kmsan_init_shadow(), so later page-descriptor initialization cannot
erase the mappings.

The series first decouples KMSAN metadata access from its storage, then
makes page_ext safe and available during early boot, and finally moves
the metadata pointers. The move also shrinks struct page from 80 to 64
bytes on x86-64 KMSAN builds, allowing HugeTLB Vmemmap Optimization to
be used with KMSAN.

v2:
- Fetch shadow and origin through one masked metadata resolver
  (suggested by Chris Down).
- Add a fix for pre-existing page_ext client misalignment.
- Use vmalloc for runtime SPARSEMEM page_ext backing
  (suggested by Mike Rapoport).
- Unify page_ext allocation and initialization entry points and document
  the later FLATMEM callback timing (noted by Chris Down).
- Allocate all boot-time SPARSEMEM page_ext from memblock
  (suggested by Mike Rapoport).
- Keep memblock allocations above DMA and suppress per-section free
  messages (suggested by Chris Down).
- Inline the unchecked page_ext lookup while keeping page_ext.c
  instrumented (suggested by Chris Down).
- Update the KMSAN metadata documentation and describe HVO enablement
  (suggested by Chris Down).
- Expand the series from three to seven patches.
- Drop all v1 Reviewed-by tags because the affected patches were
  substantially reworked and split.

v1: https://lore.kernel.org/20261114104150.58424-1-songmuchun@bytedance.com/

Muchun Song (7):
  kmsan: encapsulate per-page metadata access
  mm/page_ext: fix client data alignment
  mm/page_ext: always use vmalloc for section page extensions
  mm/page_ext: use common allocation and initialization entry points
  mm/page_ext: allocate page extensions early for SPARSEMEM
  mm/page_ext: inline unchecked page extension lookup
  kmsan: fix metadata loss during HugeTLB struct page reinitialization

 Documentation/dev-tools/kmsan.rst |   8 +-
 include/linux/kmsan.h             |   2 +
 include/linux/mm.h                |  12 +-
 include/linux/mm_types.h          |  12 --
 include/linux/page_ext.h          |  61 +++++++--
 lib/Kconfig.kmsan                 |   1 +
 mm/kmsan/shadow.c                 | 199 +++++++++++++++++++--------
 mm/mm_init.c                      |  11 +-
 mm/page_ext.c                     | 218 ++++++++++++------------------
 9 files changed, 286 insertions(+), 238 deletions(-)


base-commit: 67f3b04b277373438f17300e056306adbd9edf7b
-- 
2.54.0

