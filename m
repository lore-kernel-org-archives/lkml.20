Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296614;
	b=LLtMp4Aquawp4/iSAGToVgYQdrJmzh7h5P1DLSDd82xX5F3zQ6+Yk+Ib0w2l/TwErUjx
	 /th3xwgBrfOEencSIaNCXDSStg01PxDV6t22nfy39uyDDQ4R1BN6vaPHCbZYVqEbEpsXX
	 0Se1AXh1+CykOSdtSQ+hxw0ysQ5j3b0cKs7WYE+tgs3tvohXCQ7bRt8lx7yv9+oPTJBA+
	 XRCcIWUdZbdGUO5FDVfz755HZOc+k9Iy7hpecHUuFhRjjCO6iGqs1tgWOzeRDaoj6kNB0
	 gnXJPiOR1Abv7Ztd7FqJcZiiDvo+nST8Hvqqm99HfmqlguLgsAJm8gPWjlEbXeqJ0hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296614;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=yIKrqUa698jtkq4S+tNE275rUsH+jw4iBZHp6nea714=;
	b=UD3/DD/Jag7RbH7Hoho/MqOoW8FfxLzMkvPaIsbVXi2RZSuaygDkS1+sD4JjApwSkjOA
	 +PCYkL4fHjCiK6UvDMdrdVU2cBsZiAfz+vBYblk4ZdETuxG6NT5Z8ZooQ2YlZs1b4FAfj
	 4cui1nbRmJUvSgHH1Pny58mWKuO5P5oAiTaHYNxCsjOWiya3RxfG2lHWTX+PjnBMKAclR
	 r1AcjrxsM+5YNv110B8q730thv8vn/EwmAkgME0D2Zk6J+UPbX6mu9Bu/BBV7FxMzEWCb
	 +VkPVm7aY+3hAi+q6Ef7SJz2fNN1adaFNBr3JWGT8bzSBwoL1zDWPjdFiNeYhRLIvWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aOeOHpYh;
	arc=none smtp.remote-ip=91.218.175.163
Received: from mta0.migadu.com (out-163.mta0.migadu.com [91.218.175.163])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A68B606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A68B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aOeOHpYh
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PqgEJ1qFzNTxxzLoVkBM63dh+frDqe4TYsbrUm3uZw4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794296611; v=1; x=1794901411;
 b=aOeOHpYhP4JC5moGBDMfC0Xadr1TZnY18hEpwkIH/tKibJ4X9IS1g3lIjbFEI6l/2Lvafrt4
 VBLSoGU5m2Dx5iOUydtuPRQ/N/OnSNUqE9DIJ11/bfgAIwrRKSR0pE8QOcA9VkI3g+C5XhR2ee6
 qsmiud3Q4h7Kx7WPVxjN7fLQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 9b3c4fed74b348b8;
	Tue, 10 Nov 2026 07:43:31 +0000
X-Mizu-Trace-ID: 9b3c4fed74b348b8
X-Migadu-Flow: FLOW_OUT
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: David Hildenbrand <david@kernel.org>,
	Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	Qiliang Yuan <odys.yuan@gmail.com>
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Huan Yang <link@vivo.com>,
	Wang Xiao <xiao.wang@vivo.com>
Subject: [PATCH v2 0/4] KSM: introduce only_merge_zero_pages
Date: Tue, 10 Nov 2026 15:43:12 +0800
Message-Id: <20261110074312.219847-1-xu.xin@linux.dev>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

This series adds a new KSM sysfs attribute, only_merge_zero_pages, which
makes ksmd merge only empty (zeroed) anonymous pages with the kernel
zero page and skip the stable/unstable trees for pages that  carry data.

Patch 1 adds the attribute and the early return in cmp_and_merge_page().

Patch 2 (co-developed with Jinjiang Tu) goes one step further and skips
non-zero pages already in the scan path, before an rmap_item is
allocated for them, which is what makes the mode practical on
large-memory workloads with mostly non-mergeable anonymous memory.

Patch 3 consolidates the ksm_stat readers in vm_util.c into a single
ksm_get_self_stat() helper (pure refactor). Patch 4 adds a functional
selftest.

Changelog
=========
v1 -> v2

- Patch 1: Take ksm_thread_mutex around the check-and-set in both
           use_zero_pages_store() and only_merge_zero_pages_store(), so
           that a concurrent write to the two attributes cannot leave
           use_zero_pages=0 and only_merge_zero_pages=1, a state in which
           ksmd would scan and checksum pages but never merge any.

- New patch 2, 3 and 4 are added.

Motivation
==========

On an Android device, I measured the KSM savings potential on 15.7 GiB
RAM, ~1100 processes, a typical usage session with several video apps
running) using a userspace survey tool that walks /proc/<pid>/maps +
/proc/<pid>/pagemap, deduplicates anonymous pages by their physical
frame number (PFN), and hashes page contents to find identical pages.
Key results (two samples taken 10 minutes apart):

  Category              Resident    Savings (upper bound)
  -------------------   ---------   ---------------------
  anon, non-zero pages  2.9G        67-74 MiB (2.3-2.4%)
  anon, zero pages      -           281-424 MiB (9.5-13.9%)

In other scenario with a MySQL instance from huawei, there are around
15 GB consumed by hashtables, which contain many zero-filled pages that
are eligible for merging to reduce memory footprint [1].

[1] https://lore.kernel.org/all/2a642af6-b97a-4f24-9889-1844812de4cc@huawei.com/


Xu Xin (vivo) (4):
  ksm: add only_merge_zero_pages to merge only empty anonymous pages
  ksm: skip rmap_item allocation for non-zero pages under
    only_merge_zero_pages
  selftests/ksm: consolidate ksm_stat readers into ksm_get_self_stat()
  selftests/ksm: add test for only_merge_zero_pages

 Documentation/admin-guide/mm/ksm.rst          |  40 ++++-
 mm/ksm.c                                      | 149 ++++++++++++++++++
 .../selftests/mm/ksm_functional_tests.c       | 135 ++++++++++++++--
 tools/testing/selftests/mm/vm_util.c          |  40 ++---
 tools/testing/selftests/mm/vm_util.h          |   3 +-
 5 files changed, 327 insertions(+), 40 deletions(-)

-- 
2.34.1

