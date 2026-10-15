Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0675629BD9A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792032827; cv=none; b=g5PoErarNylKAAU87zfFXh/zZhdg0W+K0wIvdNjqEZEqfNNjfFYDecsKl4HiZcqzz80ZYqyci164aA/R/NFvW9ofYaDpkxQXNqXTZhZhI6wfqGpEQTvVjQmngBIU07zid2sYtXr5QVg4xLuaTiVBQBMhqrGEtPItvTSSFpn3ldI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792032827; c=relaxed/simple;
	bh=+goexvJ0rwrjMhmWxwsLRC9mJ3wlevf0fb07kJ0niV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l1hG+5JYZOLV31J8g5TKek5qK2TOVPx5UfL1JYE+DUHX9fAq2TFllDa4cOr43B4/z1luoLrnbryYjKU/WdMaFFgzI/0M9FC1FSQ2zE0+ll4CNtEdt3ZNjAaNS88/AlErQGENRA3KqarXYgDGEStWxOgB0Zf2yVI2H9J4AUZ4kG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tB9v/yjZ; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tB9v/yjZ"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-88cfa501c5cso572063b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792032825; x=1792637625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gZigGVShNXb8M9xxdtd/aausWvbyL1B/6pZf5rZeo2w=;
        b=tB9v/yjZmcH/I1MHTb5y+bFI+7MxChRpzybJPeenrCCVSm7jDvvS48hi0TGYRw71VS
         jaHu0g64uyww20zrybUtTwhm1PMxHwx7TWZ8WYk+fs5p853IgVM7NnzSPsS5RcMyDII1
         b+JWZfEyaKgo2ocfkB4UhuZ7AeVasHY00HRnRB1tUHGFJyLpOaMzbxrFu+Ud/RafWGyq
         BYgwojs5L0zIl+MfD82In8Mf3/vNKTXnBGMMAj5LdUOpKX58drIn0r97OqTyYgI9azfS
         SsUyqxRiMPAfpc2qig1P987U2rucjZx8PLenI2c1C2GpBeGnXCYzYQNTutd6vKxSHa07
         Kgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792032825; x=1792637625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gZigGVShNXb8M9xxdtd/aausWvbyL1B/6pZf5rZeo2w=;
        b=YEB+9wumOEL1nKAPshSzDp+TZK89dkOpZgNBWBSCyz5agqxCpHMkA2tRyZvLpClZHY
         OoDgSquLOYphyMxBMhvbZgKL2NmEoVMVQvHMoQD04n6u9EPIwpRwpSEjakVv6DvRkzxK
         rS+C9aYqz4iOdpMEQhXUmd9XFrYTFxd+9l8SQ4SznpMvpYz0igdGIx7GmT9PvhdZ6Zna
         ngb9PGfepe7suOsK1NGeov2XF2FLkvWq1I9sWQEOVO/9N7u9guOyVGU9kjdrq1KBkli7
         jqHgvV1tXRPW8CcphzdLKFX/7k2YbcufDSz2CrlekH9sWK3BelrIWQ9UTv3/haZIX9Z/
         9OxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhrQcxn677IuHvszAdFrHidk+In5MGxJhNaEJL+mt7EdRCb14E4UwsxW8t+ZhlmVVv1uDy9b3Ubl6RxbM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDjQ+GUaIsoVSwh8nt6Yj5yOz7pSN284RU2YXX2J5npSTX3i0W
	UNVi/gnQxGfDcDsRAuTINUulwQAGfEOc9YG1ejvq5A7ka0fS7ThTBQ5a
X-Gm-Gg: AYBFou1NyUOXjU/o2NxnmRNAQWdrRAq4CI7RRoIeLntw1URA32mwO8UTenlTL9nlfQU
	vSEIYgfZ5/p87S1/HGcC++cq79grY5NAT3Zs0jI+g71VBDJr7/Yxj8yxnsRn4NAN9ARhrFi/N8F
	7n6s/a23BjaFk8tu37id+wokiG/vaFmJQ9vHaBtIkcde9Vine60Fl3A0+IbbGHP3bkRVzGeod3+
	JWadcuRHhvENkSF71Fs4HG16Sl6e2CYPJ6i0PLolrA/tkJSWMZmkWWhuqmNw0XyIYkP93a2Jqjk
	GE/4cZOMc7DhP/tj1fYFHGn9Q4gj08pBMa2PnITUH9EdaC5oA2yOJjOkDuQb0J8ZfdaceIyzuwI
	uz3mR+qxA9EYUZYZPd/0ibecUduPvsZX492/fWofCq7uHlk7cLr+F3dlnpsPX86ZrCtEZMVDlhI
	qHWqslKg5cHhNIRzXML42Y8UEpnZUl9132sNY6ZdmudsoPS8DIghvfXNBDTb756i4Bta5q+nKa5
	QTcpvSIZHIWFYG8shCBti/zB2/lPTEW+rWLbrpL+jUro/ui4HN1RuP/Dife8Pc=
X-Received: by 2002:a05:6a00:148b:b0:886:5f48:3fca with SMTP id d2e1a72fcca58-897c76e308bmr15340019b3a.37.1792032825083;
        Wed, 14 Oct 2026 19:53:45 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::a891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d802d10besm1706735b3a.28.2026.10.14.19.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:53:44 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	fvdl@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH v2 0/2] mm/cma: fix range selection in cma_declare_contiguous_multi()
Date: Wed, 14 Oct 2026 20:53:39 -0600
Message-ID: <cover.1792032699.git.skunkolee@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These two patches fix two independent bugs in the multi-range selection
of cma_declare_contiguous_multi(), found by code inspection with the
help of an LLM (both patches carry Assisted-by: LLM).

Patch 1 fixes list_insert_sorted(), which does not actually sort: it
stops at the wrong entry and, when no entry matches, inserts before the
last entry instead of appending. The caller assumes the list tail is the
smallest recorded range and that the list is walked largest first.

Patch 2 fixes sizesum counting the size of ranges that were skipped
because the list was full, so the sizesum < total_size check can pass
when the recorded ranges cannot cover the request, and the function
returns 0 having reserved less than asked for.

Each patch fixes a distinct failure and neither depends on the other.
No kernel-level reproducer was produced and nothing was tested beyond
compiling; the examples in the commit messages come from a userspace
copy of the helper and the selection loop, written from the source.

Changes in v2:
- resend as a series with a cover letter, as requested by Lorenzo
- commit messages now state how the bugs were found and that they were
  not tested on hardware or in a booted kernel
- add Assisted-by: LLM
- patch 1: correct the sentence about the first inserted range staying
  at the tail (only until it is evicted)
- rebased on the current akpm/mm-new
- no code changes

v1: https://lore.kernel.org/all/20261011003059.169430-1-skunkolee@gmail.com/

Ivy Lopez (2):
  mm/cma: fix list_insert_sorted() ordering
  mm/cma: do not count skipped ranges in cma_declare_contiguous_multi()

 mm/cma.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

-- 
2.56.0

