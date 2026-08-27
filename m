Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7AE383328
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787802499; cv=none; b=MI8nbiRZKr/ENhtDCPZ5M5C8/0KXqvjhsGT+msPyXXml8CVjc6E69tleY77S6g7se3x/tkQ5eF+X4erRij8GopzFxJ2csEYXb/VHOrsedahp05QiuzxCIcRdlps9KNM3FFVOAckET3rQpg4tgEdE9h7GcxLHb8cuSuhaAH3uOiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787802499; c=relaxed/simple;
	bh=BQRoFAmQhNvZ81U09ROOTSBVRDxpfTh3lG0VzjIm/6I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=EEB2ngnF/8xZEQK40XvKTA0Idy8ppQR8UaOEXRE8kSw+h8RusjingnApIIVFjsnTXxDEncLjHSPQuXJF0RPaBEWhm/JAj8i+JLzfgRZ+cf3dAoHvXVW/lzfsiviZRCiqlKxX91PKfSm+TRkxmAY+lp7E12wiXz1Oxd61d/P79Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IyK6Rxqf; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IyK6Rxqf"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so2046113a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787802497; x=1788407297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ASdk2IOeNuFGEIsjmCHgLUlwUNJIVTG3wsjeSpdDNkA=;
        b=IyK6RxqfPpLoxIXpK+aLmfqYigSviSeen6Q1EadDNDjLLzh6ZA2BsXIhGwmP+oeqau
         XgqXb/48dv5rDjwmRkuU0LWrkXCkif1fFAoYFmoMX1hDTnUOxQw5ga/yIXMOJPl4TKwj
         XF35AY3crWx42kzS4Rj2iMGxHKbtAUoPCFMajP38Dku7Pmoo/uvdJBbAgdBl+j0CN/Er
         iUJOVeAHmgOkilbrXiG8ZUYTzrZv5RX6oX0c/ZrbDmBIkmX2pQiEhF6RdqP1E6GYVvf9
         BVr4OY6SEheaWx5aWas+UsvJ57ffgJOxcgF+n1zscma3Nr2000GDDyHZK5KiHwSHNRl+
         8yKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787802497; x=1788407297;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ASdk2IOeNuFGEIsjmCHgLUlwUNJIVTG3wsjeSpdDNkA=;
        b=dtyjUrTx1NWRQ+HxK2Mna/K5+7DGVsSuHpN30Ul9TcdZ3GSpfTuQyuDazh13xwnZW1
         +LFqBgTiWHt6FtUQI6L5ett3DUpS84v0E/U6WvCAfxn+sp3K6x9aNu8d0PsWpdfu62K3
         YOzh0I9cfHHsPwDCp53hL7IPOyDtDbKqVhBvRxaKT9Ve1YogD7O9FWrVSZt9CzE9dRPI
         R8dTrTcaKSSAHONz6KthvF2Rh0QKKrD3q0HMgkKB+yRc3nTHiWsmNZeIJ7c532BiXlXV
         PbLsOlWg1mGR3wZQzl1L3FRmQiUrOfFMaohTe+VnUC+KlXqmJIDbAzE9Vmny1NP0UIxt
         WTsA==
X-Forwarded-Encrypted: i=1; AHgh+Rr18mDbw/OGb/HyABkQxkogXlZFscTGS2I75TNqts+K3/x63eDbNyIhk3VzwYQ2L/TN0o5Q9xOb6ha9dxw=@vger.kernel.org
X-Gm-Message-State: AFuF++mkV2hEhXMWx64bDpXVRNDc+gankPb23CqID7F5tBFdLjRSBkll
	FBjQ6EgP4wg0oyJzcKDmjfqJja2jlKx25buHL3YA1dGEqOn7/SMMKXFowkTv1nnukRID18cV6cp
	GDgg71qTMPA==
X-Received: from plbkb13.prod.google.com ([2002:a17:903:338d:b0:2d3:768a:b66c])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2392:b0:2d0:cc92:f7a3
 with SMTP id d9443c01a7336-2d707a53a0fmr241134785ad.2.1787802497345; Wed, 26
 Aug 2026 20:48:17 -0700 (PDT)
Date: Thu, 27 Aug 2026 03:47:40 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260827034807.2822234-1-wfelipe@google.com>
Subject: [PATCH v3 0/2] selftests/cgroup: fixes for test_zswap on single core VM
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Tejun Heo <tj@kernel.org>, 
	"=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wilson Felipe Pereira <wfelipe@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This series fixes two test failures in test_zswap observed when running on
a single-core VM (-smp 1) with 4GB of RAM.

Patch 1 addresses a race condition in test_zswap_writeback() where
waitpid() returns before the exiting child process is switched away by the
kernel, causing an immediate write of "+memory" to cgroup.subtree_control
to fail with -EBUSY. We fix this by waiting for cgroup.events to report
"populated 0".

Patch 2 fixes an implicit unsigned conversion bug in test_no_kmem_bypass()
where small negative timing differences between debugfs stored_pages and
cgroup zswapped bytes caused the comparison to falsely fail due to
unsigned promotion.

v2 -> v3:
- Patch 1: Collect Acked-by from Michal Koutn=C3=BD.
- Patch 2: Explicitly cast stored_pages to (long) in delta calculation and
  inline the return comparison (Michal Koutn=C3=BD).

v1 -> v2:
- Patch 1: Replace EBUSY retry loop with cg_read_strcmp_wait() waiting for
  cgroup.events "populated 0" (Michal Koutn=C3=BD).
- Patch 1: Clarify task lifecycle in commit description (Yosry Ahmed).
- Patch 2: Remove abs() and declare delta/zswapped as signed longs with a
  signed threshold comparison (Michal Koutn=C3=BD).
- Patch 2: Add Fixes tag (Michal Koutn=C3=BD).

v2: https://lore.kernel.org/all/20260824033533.2147900-1-wfelipe@google.com=
/
v1: https://lore.kernel.org/all/20260804042053.56940-1-wfelipe@google.com/

Wilson Felipe Pereira (2):
  selftests/cgroup: test_zswap: wait for cgroup to unpopulate in
    test_zswap_writeback
  selftests/cgroup: test_zswap: fix implicit unsigned promotion bug in
    test_no_kmem_bypass

 tools/testing/selftests/cgroup/test_zswap.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

--=20
2.55.0.887.g758fc8c411-goog

