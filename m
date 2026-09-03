Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B664B8DF0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445793; cv=none; b=cHKWwXNqdnQ9gqNa3TgAQQ3RJ+VON3MnhBtlIflpv4v6F6O1g+62KNmjza39kUfuAq6fWEx6OMdgqPyLP+0jp+M+u+F8D54kBtJFOM1v/7lQdUhkn8JbvdepdtJw8kvVvPrtOZxa64iLlzrCXiIXHvqOn6e0sUsC2e6C3lWjsoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445793; c=relaxed/simple;
	bh=8uRn6skkiCRR+c6DEQIznpHWiM4x0rvv7bYO7f0wU9A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DhLCe3Bp7+sNuE98clTu6VJ9xKIPMk5C5J2XjeVlkjMNQpaoYN6nF+yvIcJ+OQ4TW9ORC7flhtl+z3AjbBkkbrNjeODHUUEjg8v5iWlrF59OfhSJ2KxI+fkSiIPKijG8LrRGaN8cr5DybEbNW0A4ZCNzA0LP0sQ4X+cKGjarcZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLbliNAr; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLbliNAr"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d7195706f1so26244175ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788445780; x=1789050580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8uRn6skkiCRR+c6DEQIznpHWiM4x0rvv7bYO7f0wU9A=;
        b=SLbliNArWUDimVSd+5uMJMHcCNuGdq5wayULoFTRDjTkQ3vfRzIozuUPB9UL+p0Pys
         7mjvrCRwcB0W/Ysxq3ZXjU0eZQI54LtMRIApAc5p8qkw+Tw+cJad6LBkI0qD2A9desIk
         B+ncjyO86Gk9CDZh+eNV/Oo3fetM/dwvrNdW01I6otMLiaSvbkhfxi8mOyRYb66B4uYr
         PFIUYyI/rX44KiRn/dCp+ZLdSYiDY35i/A72ijXd0MGxOZ8yu0zhuKkdWPlWbGC6kGMS
         idh7s+OO/QeY6gi0mylLSN9jxbwzy+nGBizbd9ZpOCVLzvZjjrk23Qs/UIT/Qq/8ggFp
         hhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788445780; x=1789050580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8uRn6skkiCRR+c6DEQIznpHWiM4x0rvv7bYO7f0wU9A=;
        b=aCpB5FqPL8JPy8GnCKlavgbBYsJrhXLfU/66j7Oght2iN2b1fkV3FLKkx0yiQI84a7
         bkMKtXJ7j0+h78pddC2o5Wy1AjftIzdqWML+4fbJ5B1T/wAAvk5hG5LNxyx9fFlcqzHj
         27HBA9u+49ZOD8F3bimdHPhiMRpdcZqHpr3LuvCST/f3WGWXlsccdliBS08LAkBzdDwG
         b6QQr4cK01EK/3tpKa3MtIjZr2OnELQZdfxGRTcomIGoSNH2z2J44eHnR6794WijkKeJ
         fVXJijaA8RzmIyJmrslpGxt2hUuQporaxYf9gy3CxYD5yMVVOzfFhC66tnAyIxpuMQcv
         wrtw==
X-Forwarded-Encrypted: i=1; AKwUvBxOmnN1xFLwBKcGwrwNmtNTXLKxwJ2TYc7mRU6CxUq3mKIKSf9hpllfdbtBQ5GhRAJBUQFgdRrZijpGvLI=@vger.kernel.org
X-Gm-Message-State: AFuF++nGb7AWw/tcJz7wd+z293adpqmdzMijfJD/6mAsQEBfc41X3oqr
	FpkV/OTj6tKnBLvewVrufKN3GSttgaDS75NaQWimtCCN+GBDT5uAaIuw
X-Gm-Gg: AYBFou0dbcCtAfz3+EMgpcm8XTSv3wrTfZO14Is0tDIm4RQEu+3bTq3jYNzvu6xcduF
	PbCIfGBMD5JsbAiq1PmWSfClzCz2NyvDDA5idB/101pX4ZY6Bf3ZYf3OuwNliuh1eyrecxUwwAy
	duqX+SJOx72fUs5Ar8o1ieQgU7Q2eRFNugX5bUy2rH73UxTwgEgxNpAazGeec7u2YpgkiPKCo+y
	ZDdKDPwbQzqkienZTEr//LMqZclK0vh1TQJI+sRWn3Tl5t+mARnf8JPP6mI4MyS/2Cn6gnOa8sM
	39LwJP/+dzgOh5KUnFc0nRNUt9ziWvaz02l7vFiARIwFsOKkw1LeKAPh9J77zp1USbkxNXvk+S2
	5vuiuSNJz9dT/ozn240LmKHIQVOlo6E5ha/J/DtsMcLrVGa0de+wQKIs6w9ScsiwXBH80p8iBea
	HoJF9v6nbESQVxlxlXF1y24dQGMu4bMFbWIWcbWG1nR1x6u/sW/z55ma+V8nt4SMwTZHr7hg/QU
	8Bn9S8WuIaSQ9sM
X-Received: by 2002:a17:902:e545:b0:2d9:6db:9fc2 with SMTP id d9443c01a7336-2daec6240c7mr160309525ad.9.1788445779634;
        Thu, 03 Sep 2026 07:29:39 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafe927928sm11174225ad.33.2026.09.03.07.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:29:39 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: akpm@linux-foundation.org,
	vbabka@kernel.org,
	david@kernel.org
Cc: surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	zhaonanzhe@xiaomi.com,
	lipengfei28@xiaomi.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] mm: compaction: skip isolating large folios that satisfy the mTHP order
Date: Thu,  3 Sep 2026 22:29:23 +0800
Message-Id: <20260903142923.4108729-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260825043833.2659350-3-zhangbo56@xiaomi.com>
References: <20260825043833.2659350-3-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review. Replying to the two points below.

1) Build breakage when CONFIG_TRANSPARENT_HUGEPAGE is disabled

Sashiko says

"huge_anon_orders_always is only declared in include/linux/huge_mm.h under
CONFIG_TRANSPARENT_HUGEPAGE. Without an #else fallback stub, any kernel
build configured with CONFIG_COMPACTION=y and CONFIG_TRANSPARENT_HUGEPAGE=n
might fail with an undeclared identifier error."

Correct. In v2 the huge_anon_orders_always access is confined to
compact_hpage_order() and guarded by #ifdef CONFIG_TRANSPARENT_HUGEPAGE,
so this call site no longer references it directly.

2) Skipping isolation harms manual compaction and HugeTLB pool resizing

Sashiko says

"If smaller mTHPs (like order-2) are enabled, compact_hpage_order() will
return 2. This logic will then unconditionally return true for any folio of
order 2 or higher, skipping its isolation. Could this cause administrative
commands or automated HugeTLB pool resizing scripts to inexplicably fail to
allocate large contiguous memory blocks ...?"

To clarify the intent first: when mTHP is enabled the proactive compaction
target is compact_hpage_order() (e.g. order-2), so folios already at or
above that order need not be isolated - migrating smaller fragments is
enough to assemble the target block, and isolating larger folios is just
wasted work.

That said, the problem you describe is real: compact_hpage_order() is
derived from huge_anon_orders_always, so it also affects manual
`echo 1 > compact_memory` and HugeTLB pool resizing, which legitimately
want to form order-9/order-11 blocks.

This comes back to a question I raised in the cover letter: what is the
right way to determine the compaction target order? Deriving it from
huge_anon_orders_always is convenient but conflates mTHP proactive
compaction with these other callers. An alternative would be a dedicated
knob (e.g. a sysctl compaction target order). I haven't settled on the
right approach and would welcome opinions.

Bo
