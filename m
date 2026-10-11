Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E201E5B63
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 00:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791678669; cv=none; b=CE3p5RTwS6QI0rak0ZBKa3TB7Kpx+6KKGIbEUQDKqdo0N5IH4KxKwTHBBFbG5tXSym4rAZGErzci5sC9pRi6vjhIHrQFp3lrTA34qLJaTi5QnyXXGV5dZ7Pdl24h3KctTRxwuBCkBtV3hs33g7kuuq1luWFArvrfP9jyHBlWdLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791678669; c=relaxed/simple;
	bh=847Ia3IGc+y8ajZnza1rYhksWRa32beXNH/by2oLOFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o/y3rNGZ3pggQ24cKF4hYE7VUXD4W2DGleTwtXITgvIgBNWt3qQfr5OKNv0FST8oqneSOZaKKO49qCdGzC1IRckjwlxhFXdbt06BCNHDnbV/iiyflVd8BsIX7ndFmJOSYOGIiKuTq3KYaDyCD47UJJi2iGHr3lA+Tywu6oJVCmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzsQWFiq; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzsQWFiq"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e60f9af6e6so6725165ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 17:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791678668; x=1792283468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Texf7avohcxbJhjAidkKzynfx9gkSXyM44DuVmdFRSI=;
        b=OzsQWFiq9PIoRbF9yoR1vZMUWuAqhyOm4AB+X5uQE457te4ux9rHL1XIKZ5JKRqagB
         5T2xnjxhM4dZbU5hfSsMotMkZozgwt+GFtHwZb/A7Pi4egeTn1OEj+D5Ayf5KDFo68yo
         kVpfgr52xyXJPeinmZFqjYGyVHGzJ7viXFl6K/70bpB3aUSakeXlNBUhmE1v6wcrCbg9
         cXvca3bCbuQWkRk2U72sFw2n81ZGTB4W1RkTowAXLpT5LZTsSBERt05xHXs7CJPQ2N8q
         u3nVHskvODGQUcXLBPyT6yU/n0Pwimxe1pWX3wVtfeEO0EIEoRti47xhrEA2d0G4GH5A
         zp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791678668; x=1792283468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Texf7avohcxbJhjAidkKzynfx9gkSXyM44DuVmdFRSI=;
        b=nnEqM599wRdqx+N1dgPbbpTqU3PKAm9VdQq+qXjG1FA5988/YhxGnsWlj/dIcGuRg9
         tniMn91D7L/14Xqc+BsG8j3I7vmvYQCH+bMSaVO7RbKItkPO8cbxPpBzCGUS5k0ECp+Z
         jl20nACP2ExBQOIECb5q5RHJ6YY+E2e89cttuR4z5IPaHDVHQe9rX3B5UNUwmRdj0TVW
         B8Wl91dIjix58UMp/P4sZIvhRdpb8Oygo0rUIloSm3svX9KlyZu+N8dQdLD07TvyC5DH
         0pATGxHL7SOE0JK8Uy2/yaDN6iMu76Fx2zUK7GYbwMyZXLxa7pFRsSyDZ1eNxamwRhWi
         gYmw==
X-Forwarded-Encrypted: i=1; AKwUvBwm0lqxZGvKIjIRmTMm/CK33EsTWA1DVyE6NrmzUCutzdpEObBsjBtzz4gH2ClMyYMATVb14U5FjrG0o5Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9WucFR+nk0v/yvDZVwZdEr00cR3f+me9g0XYXYYhLMG7T8bFj
	6XJsaypsVQqyVnkNc+xIIiOlmh931CpF2vWvIF8F9+5EKyX/mC5Ek/Uf
X-Gm-Gg: AYBFou3n49uYKsYsOMH2UumCO5T9e6cSIRJDR6RzLOWBlvIhMnXFBo88FFYcf2WoV3l
	w5t+t/30G66wQ5H6MrqkP/CeW1uYul77F1ntjSPW41qK6b6cnWbs9GAyZGtaVGdCLFuBu9gWmQU
	cAxIPMbjwjjo8jMXS0Qfu0RWxmOnbV2Xlsur/kPGy137LYSJ/S4YruU5QDCBavlQuckYZrN4NSv
	PB7UHv6r9I3gQucsjzyFmlkmURbEoGWcM7GwZXJLK16sNmvvgdQu0ilNhePPrwfcUIU+wbzGFli
	fduQ+WqHiLa1WulnlbxPXaw4TceAv6LWNe36oOwpWXPN6n03WTRlqv3MtDYKEiGhQafMdU1WsY4
	QMSOvsx3itWyROfvJkFC49n1zb4JDeIjGwncq+J/m5I7JP/oCzpqFJotNeE4M9vjeAxHYAokmbQ
	EXfgewj4bGiU86Z3qM4SQ5e6yS5IijIkh/tp1AuQJO/VnrkF9N66F8AQD/0rQm/Ezi9S/LcYdB6
	oiGCLfWJ9sIhi2aVHAyEZVOlkuaXiMZIuJ/BZij6nuvWrWcDsw2w5z79N479xFo
X-Received: by 2002:a17:90a:ec87:b0:3a8:c0cd:57fb with SMTP id 98e67ed59e1d1-3ab3ac9a1b0mr4922031a91.42.1791678668019;
        Sat, 10 Oct 2026 17:31:08 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::a891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab371c32cesm9681761a91.16.2026.10.10.17.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:31:07 -0700 (PDT)
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
	Ivy Lopez <skunkolee@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] mm/cma: do not count skipped ranges in cma_declare_contiguous_multi()
Date: Sat, 10 Oct 2026 18:30:59 -0600
Message-ID: <20261011003059.169430-2-skunkolee@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261011003059.169430-1-skunkolee@gmail.com>
References: <20261011003059.169430-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cma_declare_contiguous_multi() adds the size of every candidate range
to sizesum before deciding whether to record it. Once CMA_MAX_RANGES
ranges are recorded, a candidate smaller than the last recorded one is
skipped, but its size stays in sizesum. The replacement path already
subtracts the evicted range, so sizesum is meant to track recorded
ranges only.

When more than CMA_MAX_RANGES ranges exist and one is skipped, sizesum
can reach total_size while the recorded ranges cannot. The sizesum <
total_size check then passes, the reserve loop ends with sizeleft
nonzero, and the function returns 0 with fewer pages reserved than
requested. cma->count, available_count and totalcma_pages still
reflect the full size, and the final message reports it as reserved.

For example, 8 free ranges of 1G followed by one of 512M with a
request of 8G + 256M reserves 8G and returns 0.

Only count a range once it is recorded.

Found by code inspection and checked with a userspace copy of the
selection loop.

Fixes: c009da4258f9 ("mm, cma: support multiple contiguous ranges, if requested")
Cc: <stable@vger.kernel.org> # 6.15+
Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
 mm/cma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/cma.c b/mm/cma.c
index 527b2d894f3e..c2cdef953ee9 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -594,7 +594,6 @@ int __init cma_declare_contiguous_multi(phys_addr_t total_size,
 		size = ALIGN_DOWN(size, (PAGE_SIZE << order_per_bit));
 		if (!size)
 			continue;
-		sizesum += size;
 
 		pr_debug("consider %016llx - %016llx\n", (u64)start, (u64)end);
 
@@ -620,6 +619,7 @@ int __init cma_declare_contiguous_multi(phys_addr_t total_size,
 		}
 		mrp->base = start;
 		mrp->size = size;
+		sizesum += size;
 
 		/*
 		 * Now do a sorted insert.
-- 
2.56.0

