Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346252E737E
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791267434; cv=none; b=O/AP9AMFPZ+x6QhoCMS75lslfUxSw/CDrqjtnK6tMfnlHgltFeSQWaydWSXSvRBfj59b1k/WaFsv2o2GCOqlkT+k2D9/bz+WryXhl5cG7FoyCqA1xDK9Bb8wE2XCfGs0GhmmQk4t4PyKAjdO/5u7agjU5I/DmBorv+ySa7P5Ro8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791267434; c=relaxed/simple;
	bh=FHrnFnUSAWmZNX0SWBNQDgoJTqUbfpq0tVyXroLnvKk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k9RxTGgDEgGLZaEgyR7J0MJj7r+z9exJPcFQYPmc3D0NWO45nSxdhNbimrpTbzYfI2lXF7SE+rGj86khRO3/CwUTVjjXCI6MRW7bhVbSxOnP2Hx/za4EdEpcoi2rgCfXe9uPtGlk3EgbIv3tXdwR2nAZm6aAb7jpXweFgAkrPWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CC0M9Kdj; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CC0M9Kdj"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a80e169311so357513a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791267430; x=1791872230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OoJmGRoqngODEsvXRKt/ZMhZp/J8z+h3M6E+QYGZLJw=;
        b=CC0M9KdjjqleMFVkCq91Om5KVMt+hQA9h8DxJ1BK9h6c1t3bWIE37uVrLhOcgGGgS8
         6yAna/KrwDkPrc+arRSyoo/uOB/+bGI7xjv6Hv8WTBp9+0lBwvZh3tRDNxtm53qvf9g2
         RZU/+2sLXP0PYVDDJ5Y/mQ4La46Ho0FvnxOzq2a9r4aIUeMxTV6/eG9ho9/oyeDeKRLW
         7EfeqsTekYzNDUqrmfff9EOm1jBOOFUVUyWt3R0cK07BJj4UQj0McsRz9J9xxRVGgY10
         ATUHaIqnhWBRkdD0Fo/bOotFXS5+UZOrxvtbTD4/EnXJF1y53AOZqfkWgIBJ5EaZePEX
         XuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791267430; x=1791872230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OoJmGRoqngODEsvXRKt/ZMhZp/J8z+h3M6E+QYGZLJw=;
        b=CbgR/vsM+N8JxVqrufdQzcFAmfqGnJgDOpCg1lH04z9H/gnI443BHlfY1YipegJjFK
         DbhUEzHfY3vo70lJto5n4R/FVGOnWAKe4eGIXNqQdxjgX2VENAkGbNKT/W5jJu6MicsA
         3ejWzM/P07Ze4fRafuqEPfyryn6SBBrG6HDLTFrnPemHSsBBuHQzaT8qF4hQVQBJieWJ
         xdtcMYcYFsYA+VjPYSHh1oSMpJ3+7O0UqX0LYNthPoVmNYlVkD98hEpxOy7/Uksz8a5f
         Xi/3JtQvJvXW2+VE/lMoDHLRjgqi4rxIAXE8ocCLOLs01KSWQ/iC2hBxY+iZ4ejelUHJ
         WbWA==
X-Forwarded-Encrypted: i=1; AKwUvBwKD+jyUi8J/BtXLG7c/Xsx+LyJhkg0IVqArtBv6GEmxfW5aQcymQU4VEaOc0QD2Ul/njexyO/7KzYQNIU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdlJ8VQRATTUOlux+uaMq6y69BQ0f46ByUGmfWPRtfwo3rB+/Z
	h22HhC7dxWXS/eXi/C60ExPGDqez0bCtjHz2siPxZ79Ww6Q0VGmksYL7
X-Gm-Gg: AYBFou17gyErNVnqPnnQgn3W/rEjfhkhA+4/k922C8UQ5c0d89yErIlnxQt3cRBSbQh
	lDTWBX68nkEolw5nPWLNqttL+9Enkyec6ihfb4BKjvzVg0az+Vs/3URLWqPOteWt9kLpzxCqTrS
	EYJzGCYvGVCznYmSyPmUZgtop0C12GW/dp85WNDWBBLHMMTk5NHdaW7WDTMsWFmsRMhscSoFgiP
	1GJwGoVJka7uczK5couBtYl/oO88eWgish2GzRBUGGDmxg+hG5fv+YH1ytBGq6+NeRyiN/+gZiB
	sTVEmPj97brjfgXYIU2cYi/BEZeK1MZjH/h0fQ7HHvUUnCLqeffRrObKhAUpEvB64+JfTA64r9b
	0s6JMB3xyFeynMgi+a6AIsGuu8pgOFm0nTrPWFqhk8e0K7SzZzWNfjIK2PzNgWPnsBS0v6mp24W
	BE+4S8fLrDJ69oyMnL+X+LT/nZ1OlClHDwZ4AuUvjw0JuhGOQ/pmABu6eEyEp177vPzmT39Qub9
	Lf340Yo5OQdOVRdIddK0B8Jm8d9iiFW097OhOQpMFhVJ02q6xuAMapdVT2hIQMky4RsKmz1vsxq
	JJOFX/iJ2aXzrsjvRJUWi9Zv2gQ=
X-Received: by 2002:a17:90b:2f88:b0:3a8:6b84:235b with SMTP id 98e67ed59e1d1-3a8726c1d9fmr135343a91.7.1791267430371;
        Mon, 05 Oct 2026 23:17:10 -0700 (PDT)
Received: from AHUANG12-3ZHH9X.lenovo.com (61-221-208-111.hinet-ip.hinet.net. [61.221.208.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm3662789a91.2.2026.10.05.23.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:17:09 -0700 (PDT)
From: "Adrian Huang (Lenovo)" <adrianhuang0701@gmail.com>
To: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	ahuang12@lenovo.com,
	"Adrian Huang (Lenovo)" <adrianhuang0701@gmail.com>
Subject: [PATCH 2/3] Docs/admin-guide/mm/damon/lru_sort: Fix copy-paste mistakes
Date: Tue,  6 Oct 2026 14:15:48 +0800
Message-Id: <20261006061549.627-3-adrianhuang0701@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261006061549.627-1-adrianhuang0701@gmail.com>
References: <20261006061549.627-1-adrianhuang0701@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DAMON_LRU_SORT documentation mistakenly refers to DAMON_RECLAIM
in a few places.

Fix these copy-paste mistakes to correctly refer to DAMON_LRU_SORT.

Signed-off-by: Adrian Huang (Lenovo) <adrianhuang0701@gmail.com>
---
 Documentation/admin-guide/mm/damon/lru_sort.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/lru_sort.rst b/Documentation/admin-guide/mm/damon/lru_sort.rst
index c3b688385681..0c04d238edc4 100644
--- a/Documentation/admin-guide/mm/damon/lru_sort.rst
+++ b/Documentation/admin-guide/mm/damon/lru_sort.rst
@@ -264,7 +264,7 @@ addr_unit
 A scale factor for memory addresses and bytes.
 
 This parameter is for setting and getting the :ref:`address unit
-<damon_design_addr_unit>` parameter of the DAMON instance for DAMON_RECLAIM.
+<damon_design_addr_unit>` parameter of the DAMON instance for DAMON_LRU_SORT.
 
 ``monitor_region_start`` and ``monitor_region_end`` should be provided in this
 unit.  For example, let's suppose ``addr_unit``, ``monitor_region_start`` and
@@ -347,7 +347,7 @@ memory regions that not accessed for 120 seconds.  The prioritization and
 deprioritization is limited to be done using only up to 1% CPU time to avoid
 DAMON_LRU_SORT consuming too much CPU time for the (de)prioritization.  It also
 asks DAMON_LRU_SORT to do nothing if the system's free memory rate is more than
-50%, but start the real works if it becomes lower than 40%.  If DAMON_RECLAIM
+50%, but start the real works if it becomes lower than 40%.  If DAMON_LRU_SORT
 doesn't make progress and therefore the free memory rate becomes lower than
 20%, it asks DAMON_LRU_SORT to do nothing again, so that we can fall back to
 the LRU-list based page granularity reclamation. ::
-- 
2.43.0

