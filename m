Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83245355F47
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121516; cv=none; b=KXUTLq8kYtVooNjt13p8QQkE10tiapAzQcJiPSwPBe78+aOjn8aqKSrCdoD2tIHGSMWXPliVvmZV3SbLRiS3ZKYW6fwrCK5hnmHdOJnRkZp1jpr+IFf9fyoFkdgEqGgKjkrQcSWlTqyxULRRQfdWImQfYZQEAeRZa2p+6ZAEAb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121516; c=relaxed/simple;
	bh=C0+eli1/2PCg3scQyWSb+mZ/da4k3uqdEWtfML+IuMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QiNIOWoDtP/6XG1PcNsxQqeXySXYXJIPs3ylOwurnd7FapTsefNOzeCbbprYgmrmD2u2JLfAiizHAWbKwiQRcorNyVHdHWq3FEBkkds8djxV/sxLmdg2NxMu3Ze1phtGSHKyHy+l51ebmXBDGWT953c8UNg03fWU4/yqRJNidiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=mHnQdh2i; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="mHnQdh2i"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-52fb769ca17so3676611cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790121513; x=1790726313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nk8Ic94Nq3xGjQr2vhar5wxqZxzYYAyHKDFKnt3gS0U=;
        b=mHnQdh2i9v9LAMH04J0N4xAWE7hiaGTVox9eG8bpiewdmgEF6Gcf5s5kjeB3Jy55wV
         wI4fgWssNi/SEEIWNkDs4vknMAH/F/BnBVHOVCtk6fieodf0WCPa7VZWb6FGvhG388pA
         MjNUrw1GYgY5o8GZaqqDp8h3RDoZLrbCyrUidTgjd5Th2UVzLRpxlCVNLPjds9jx2You
         DvEhPG7YYuipt7wp/lHyB84CMnM46XRcgaaBYrs8sSKlxvb38AKJyQuuljanUcDT4PrB
         x09wWi8A4Jc4mz/6UYAN5ccQhU6CCiGkY29rvTGXolHHdIcz4bLdC11d2Znru/k/zHeW
         TomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121513; x=1790726313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nk8Ic94Nq3xGjQr2vhar5wxqZxzYYAyHKDFKnt3gS0U=;
        b=ykk9KbioTiNGNI/u8xDb28GZ5Dmq02HJtDSOajhRgKZaVJy3meAj/2LkDKXH2wjGs3
         g+rjQBYGovbTBaHJgc/6+VpXXnn3T1kBhXC9zULCntoLKilPdV7/i06QCgLU9CmZ+YKB
         6y4yxsYK/dutLlowW3g5GHD+5/Hw4A5ShkvnySEqF1sryVdS8w0AwKfiPawvZIc0v+jf
         x+iU7nzqXrJX4Mv2HeOCexzcho0mPNSyiBq9tBXJOCdaym32TWBl/DKejkQmdG16NTfs
         VZI+kq437yGfr5UcJtqFri9ZjDW5CY1nCjIIXxixW4Fmh6IWTD8+cYRv2SL3e5Lh6Bub
         frsg==
X-Gm-Message-State: AFuF++kXQR4kc7k4TKpj+T6OJ19SkEBT7SUjP6YCkQe79XX2I03X1YzD
	K8j4duDbjzvprB/WKsd/KstCgPR37GtS8OucNyktB/S/z3psau9beyGOediKmIqhXeo=
X-Gm-Gg: AYBFou219/D241FtghDUcP0e9ViZVNrFANAXrnmw6GyncBoKDok8DXxz+I+Ew4i15Gr
	c8YXHWU7zutfUgr6rvRXAgYrKDe/zQ9PpgazJ+ihBMCSjDQ3rw1l7ueSyoqHF+d2686CcEzNEGj
	FriwIIgARXp1hjikgU76V03Vu++rt3HiWNuR8vle/AqajMQClAK1nILwY8RgQoBBroWJ8IoHzTu
	QpV4fGljlNsC2abjKZpOPWErjFBc2HqOnsT5ufqHaN7/86kdfG4WP1nxGNvUACiWLVjqPQWv/pl
	wARkCiVTUa9dC+wM78cuYvcAxTxa3REV2dgnyFrnEKiUZM0lBdjI2aGDZbqUaOn5511uYwu4ZZu
	RAZmFwoIcqxDXPyv+jHAjqOE66w1M7SWa5shjCYyI3GNTZEWpe+LRPZ8cNa1wTTucr4lrlkzKyF
	wUFBfZsf9Nhsczngl9fH5v53GN4dv3g2P16Q2DSlryH6NnICDH8ATa2wMkytmoyTM6wMT+1WfwM
	u63yK0gEa0++pNwEFbwpNxFBqlcX2IBmYV3XTuEeCUzRF5KQbmtosx4ZsaM
X-Received: by 2002:a05:622a:4d85:b0:532:dd80:70e0 with SMTP id d75a77b69052e-532eac9d4ffmr20101671cf.19.1790121513206;
        Tue, 22 Sep 2026 16:58:33 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb3c6715sm8323261cf.30.2026.09.22.16.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:58:32 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Subject: [PATCH 00/10] mm/madvise: refactor cold and pageout page table walks
Date: Tue, 22 Sep 2026 19:58:20 -0400
Message-ID: <20260922235830.2350770-1-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This code makes Lorenzo and Andrew sad every time I fix a bug in it,
and there's been [1,2,3,4] bugs of various severety in a single
userland reachable function in a single month.

Unfortunately this code is an unreviewable nest of... nesting.

Lets fix that.

The self tests are not intended to be merged en-masse, they are to
ensure the implementation details have not changed during the
refactor so that we may tear the refactored code apart for even
more nasty stuff.

The self tests originated as 28 individual commits, but it's been
truncated to a single commit for the first go around to reduce
noise / pressure on folks inboxes.

Some of the tests may even surprise and confuse!
Good! The code is confusing!

[1] https://lore.kernel.org/linux-mm/20260912110832.3203902-1-gourry@gourry.net/
[2] https://lore.kernel.org/linux-mm/20260912110540.3203010-1-gourry@gourry.net/
[3] https://lore.kernel.org/linux-mm/20260912034833.2952750-3-gourry@gourry.net/
[4] https://lore.kernel.org/linux-mm/20260817220810.1175596-3-gourry@gourry.net/

===
actual cover letter
===

MADV_COLD and MADV_PAGEOUT share a page-table walker that handles huge
PMDs, PTE-mapped large folios, ordinary PTEs, folio splitting and
deferred PAGEOUT reclaim in one function. The resulting control flow
makes page-table lock ownership and split retries difficult to audit.

This series adds 28 focused selftests before changing the implementation.
They cover full and partial advice at PMD and PTE granularity, shared and
pinned folios, active and unevictable folios, zero pages, swap entries, PTE
holes, file-page permissions, concurrent split attempts and NUMA migration.

The implementation separates huge-PMD handling, PTE batching, PTE-lock
ownership and shared walk setup. The existing periodic scheduling point is
preserved through the outer lock-ownership loop. Helpers shared only by
MADV_COLD and MADV_PAGEOUT use the madvise_lru prefix.

Some test data:

All 28 selftests passed before and after the refactor.  Some of the race
conditions are flakey due to being race conditions.

LTP madvise01 passed all 20 cases and process_madvise01 passed on both
implementations.

GCov data of ktests before and after refactor:
                         executable lines   branch edges taken
  before rewrite          179/181 (98.9%)    106/120 (88.3%)
  after rewrite           168/168 (100%)     112/118 (94.9%)

The last 6 branch edges remain untaken:
  - a large anonymous COW folio in an unauthorized private-file VMA
  - ZONE_DEVICE folios at PTE and PMD level
    (note that PMD zone_device is unreachable)
  - the warning edge for an invalid PMD softleaf
  - a pending fatal signal.

Gregory Price (10):
  selftests/mm: exercise MADV_COLD and MADV_PAGEOUT
  mm/madvise: name the shared LRU PMD callback
  mm/madvise: factor shared LRU folio handling
  mm/madvise: use the PMD softleaf validity helper
  mm/madvise: factor huge-PMD folio processing
  mm/madvise: separate huge PMDs from the PTE walk
  mm/madvise: separate PTE-batch folio processing
  mm/madvise: separate the PTL-held PTE scan
  mm/madvise: make cold and pageout PTE lock ownership explicit
  mm/madvise: share cold and pageout walk setup

 mm/madvise.c                               |  462 +++---
 tools/testing/selftests/mm/Makefile        |    2 +
 tools/testing/selftests/mm/ksft_madvise.sh |    4 +
 tools/testing/selftests/mm/madvise.c       | 1673 ++++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh  |    5 +
 tools/testing/selftests/mm/vm_util.c       |    4 +-
 tools/testing/selftests/mm/vm_util.h       |    6 +
 7 files changed, 1934 insertions(+), 222 deletions(-)
 create mode 100755 tools/testing/selftests/mm/ksft_madvise.sh
 create mode 100644 tools/testing/selftests/mm/madvise.c

-- 
2.53.0-Meta

base-commit: 854157fc9d011b8dd5a1a86a237447e28d681eb9
