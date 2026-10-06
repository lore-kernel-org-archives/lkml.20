Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F2639D6E8
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791267431; cv=none; b=es8BfknQW6r4AJY1wjyjwYL2KS+7lhUee/ibIBhYaAY8mE6UKc4kEfW2Rtqynwwlb1qmSFLF/2btkbsTpcLjryug6+/vamkKyFGW3TB3fiSJ0n2G1gAqaaFTLp+tnrV9NiYt6FVGL1/TXEcBb2vQbxCUXp+IVKFp+i4ZsYUcyQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791267431; c=relaxed/simple;
	bh=c52s+1rtQJ0Q70cxAwYJIZomn2o6AOpxotKtFgeYSpI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qVHzTdWQIw87Io+uJFX8+fF9OKlQCU0CTimsiM15tt3dfiaexjctgddqSktzEc1PMZnR/fDK7zjCwiC5qCvDy/S0wUB8iYHsKt22QAVycdRMVt/V9AuuoZX49UBb0xmtOAmtmmEbDr6COJ8xJZd8vZegJFri2b/s59qaLTFVwtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lB8Ymg67; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lB8Ymg67"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1545740a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791267427; x=1791872227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXj+ppi34PaHFxHHINamngQe5IHrKp/NnyfjPYvY7jg=;
        b=lB8Ymg67Vr1k5jHMVO1wyN5wHdZfhnqsLSE2fe6Coo0bDvsdOiCMMYASR4kVu6FgEU
         Hwlb6lEo9ex6IWXGHzzVsfJAX2ZfrV04foCSuNESncAPMGbjJblcgK7NUcwSJQI973gQ
         qxUr3tJZ82e0k4ouSbFSLdEDNwSr0NhUz8uB061pXN1SwRFBbfxDlshah97ah8UB1y/F
         h/GHkT3oJMarwrA1oCHopaISB7vWzQKhKbufhNBeYzBaJskg6G0wfQM0FTYpCMgMZ1RN
         h2uIBaMEs/0m76RT0nd9bYOtVa84dSL19ChwNgBv/PZiE5lI9neNoXg1KcWBYdB/zmSz
         h/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791267427; x=1791872227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kXj+ppi34PaHFxHHINamngQe5IHrKp/NnyfjPYvY7jg=;
        b=rUEBnDiSQcw8zJKJG7YuR3dWHLD7j8YUqCVYQPEwQA9yR8mBfXBQhTKGW7r6aVKEEt
         wowh6zzoF1OYd9jH0cOsN0TwR0bYSQCUKt4La+BEDdKq+qWyO3vzxlIooWP5qruU1fpT
         YaYX5gza3ircp+qL2/6U7u5RIpYvfXFKKVxB5exsRcZw4myPs5byrP/5wMLJr8ny6dRS
         n8IJSKkW1rimQs3wJRvuc3z8tI3ZKokPg++B/bzDKQ6defK8rpCOPTmd31xSFuL0DkyH
         q4MI3L6NAn3C3qwlCz015SnXEjsvM3e4nmWOx/qgOIZ5COB63s0p4KYJQH7OyhfDAdEs
         rufg==
X-Forwarded-Encrypted: i=1; AKwUvBxjFdivnUQAy9cJTTObnEE89+sOeShY5YGgVzvb/bDJ9AUUO+taFYKpUkD0I0Z7HxSsD5+INRmVhYSOk7M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4GElQtMcb/YFyNpng5vdjCjAnpJGEMvvA07ZX1H3hnQ1XqyQg
	z1ppNSE94rqC8CH/vRbeVuyUTYpuPh016CjKj65XL+7k1/ncB/4rTRtA
X-Gm-Gg: AYBFou0WVCyPLvVT5Hst3OfwXkPdGa718PuX9oy/M9xmvLAg4x33jtsvxk/ADxpde16
	ULQpMSucWMYvKxVMNqktLsaQuHnUgmthTpIw0XWEc+Q9+v1UY11xHz3Mmgu/zd5vDvJOBmv6dfS
	+akmaYYOpcgWmzuZoMfBq8my4BwHSuD0znaczTDypiDPwSLtHaSH6tarI83BMXuWxwd7xa1fUxi
	Lizn4uTxNocfpGI6ze7ILADQSUXHAIqOfJv4Gyx181FLgFnjC7BoA6o6NlwYG0UtA6yfBfpfSa9
	p9otlgSqv9jD6kgUVgtxInmktIfDIKyzPpUDmnCnKzMvcGImWYefVikW5QnGxAW4wkLr0h4i6Yx
	NLaU1smtJJEy99yhEGrGJVnizBKxkDWJB8RKm4/ttk43+4df/oqaVvwnAzt52+VsP5/Raex6Hsb
	cqeNiMsxkotGI8yTnMKhHzNSdJZ6YNHqXKifSIW04BXUKJYjHEdd39vvsiyygI9U7gUkS8bHXrr
	1AM8v+uhNDOsBqJ6pDRsY2g3MZy/1273slDmNyJVpeLXz0b4rmxba236rIByYbuZMbqguXWemrv
	LCrxjqfTYEYULAcU
X-Received: by 2002:a17:90b:3912:b0:3a4:bc68:e867 with SMTP id 98e67ed59e1d1-3a87268878cmr360148a91.7.1791267427477;
        Mon, 05 Oct 2026 23:17:07 -0700 (PDT)
Received: from AHUANG12-3ZHH9X.lenovo.com (61-221-208-111.hinet-ip.hinet.net. [61.221.208.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm3662789a91.2.2026.10.05.23.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:17:07 -0700 (PDT)
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
Subject: [PATCH 1/3] Docs/admin-guide/mm/damon: Fix various typos
Date: Tue,  6 Oct 2026 14:15:47 +0800
Message-Id: <20261006061549.627-2-adrianhuang0701@gmail.com>
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

Fix several spelling mistakes found while reading the DAMON
documentation:
  * trusworthy -> trustworthy
  * DAMON_RCLAIM -> DAMON_RECLAIM
  * charget -> charge
  * hetmap -> heatmap
  * colun -> column
  * evelenth -> eleventh
  * idlee -> idle

Signed-off-by: Adrian Huang (Lenovo) <adrianhuang0701@gmail.com>
---
 Documentation/admin-guide/mm/damon/lru_sort.rst | 2 +-
 Documentation/admin-guide/mm/damon/reclaim.rst  | 4 ++--
 Documentation/admin-guide/mm/damon/start.rst    | 6 +++---
 Documentation/admin-guide/mm/damon/stat.rst     | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/lru_sort.rst b/Documentation/admin-guide/mm/damon/lru_sort.rst
index b93ca9b0853d..c3b688385681 100644
--- a/Documentation/admin-guide/mm/damon/lru_sort.rst
+++ b/Documentation/admin-guide/mm/damon/lru_sort.rst
@@ -7,7 +7,7 @@ DAMON-based LRU-lists Sorting
 DAMON-based LRU-lists Sorting (DAMON_LRU_SORT) is a static kernel module that
 aimed to be used for proactive and lightweight data access pattern based
 (de)prioritization of pages on their LRU-lists for making LRU-lists a more
-trusworthy data access pattern source.
+trustworthy data access pattern source.
 
 Where Proactive LRU-lists Sorting is Required?
 ==============================================
diff --git a/Documentation/admin-guide/mm/damon/reclaim.rst b/Documentation/admin-guide/mm/damon/reclaim.rst
index ec7e3e32b4ac..e4e2ffa52e26 100644
--- a/Documentation/admin-guide/mm/damon/reclaim.rst
+++ b/Documentation/admin-guide/mm/damon/reclaim.rst
@@ -55,7 +55,7 @@ enabled
 
 Enable or disable DAMON_RECLAIM.
 
-You can enable DAMON_RCLAIM by setting the value of this parameter as ``Y``.
+You can enable DAMON_RECLAIM by setting the value of this parameter as ``Y``.
 Setting it as ``N`` disables DAMON_RECLAIM.  Note that DAMON_RECLAIM could do
 no real monitoring and reclamation due to the watermarks-based activation
 condition.  Refer to below descriptions for the watermarks parameter for this.
@@ -125,7 +125,7 @@ quota_reset_interval_ms
 
 The time/size quota charge reset interval in milliseconds.
 
-The charget reset interval for the quota of time (quota_ms) and size
+The charge reset interval for the quota of time (quota_ms) and size
 (quota_sz).  That is, DAMON_RECLAIM does not try reclamation for more than
 quota_ms milliseconds or quota_sz bytes within quota_reset_interval_ms
 milliseconds.
diff --git a/Documentation/admin-guide/mm/damon/start.rst b/Documentation/admin-guide/mm/damon/start.rst
index ec8c34b2d32f..d98b0eb8e771 100644
--- a/Documentation/admin-guide/mm/damon/start.rst
+++ b/Documentation/admin-guide/mm/damon/start.rst
@@ -69,16 +69,16 @@ monitored access pattern of the process from DAMON and shows the pattern in a
 human readable format.
 
 The first line of the output shows the relative access temperature (hotness) of
-the regions in a single row hetmap format.  Each column on the heatmap
+the regions in a single row heatmap format.  Each column on the heatmap
 represents regions of same size on the monitored virtual address space.  The
-position of the colun on the row and the number on the column represents the
+position of the column on the row and the number on the column represents the
 relative location and access temperature of the region.  ``[...]`` means
 unmapped huge regions on the virtual address spaces.  The second line shows
 additional information for better understanding the heatmap.
 
 Each line of the output from the third line shows which virtual address range
 (``addr XX size XX``) of the process is how frequently (``access XX %``)
-accessed for how long time (``age XX``).  For example, the evelenth region of
+accessed for how long time (``age XX``).  For example, the eleventh region of
 ~9.5 MiB size is being most frequently accessed for last 3.7 seconds.  Finally,
 the fourth command stops DAMON.
 
diff --git a/Documentation/admin-guide/mm/damon/stat.rst b/Documentation/admin-guide/mm/damon/stat.rst
index 46c5dd96aa2e..4a9db755a526 100644
--- a/Documentation/admin-guide/mm/damon/stat.rst
+++ b/Documentation/admin-guide/mm/damon/stat.rst
@@ -81,7 +81,7 @@ Per-byte idle time (milliseconds) percentiles of the system.
 DAMON_STAT calculates how long each byte of the memory was not accessed until
 now (idle time), based on the current DAMON results snapshot.  For regions
 having access frequency (nr_accesses) larger than zero, how long the current
-access frequency level was kept multiplied by ``-1`` becomes the idlee time of
+access frequency level was kept multiplied by ``-1`` becomes the idle time of
 every byte of the region.  If a region has zero access frequency (nr_accesses),
 how long the region was keeping the zero access frequency (age) becomes the
 idle time of every byte of the region.  Then, DAMON_STAT exposes the
-- 
2.43.0

