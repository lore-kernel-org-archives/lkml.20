Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793207849;
	b=qn043ozIeGfeaUvapgBHouUqDNXb8tQSpFno2fabx5VWV6kzu2fKEbeBTG8HFYSQYSJd
	 3T3vnQ92FIJawajI79t/KvRu3UEoYyLj848vMvr1KPIQcfr+4Cs7oTGr4i9EiMDOdfkZl
	 qvEikwHI3zFwFzpWOaMqdYo22RUdJQAiABnDZiAUQuZjv+Qib9cB9Ii5JYUEiahB/xpF0
	 5lBhpltIB7f3wmsO0VJvl/Xw0iurjQegdIPX6ku6SvMLky9i2fucAhoh/Lwht1V7MnY8w
	 jR/ZSfI3f+Rbv90RQTr0zug4av9aPHXVkBxz/I6PeSW9S5tD8d3DevNbiO7K+pc2cvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FC7uHBzaVJ4BUk5uLlNk6IJEROP7WjcJ9ABFqisilS4=;
	b=cCEiXTRNtlk7SMBYE2tOVHyGJGKa/au5zQrRm118AJgroLhS+HGWJQ1YKkzsqS7rVjYx
	 VHHor5A7j5h+HRuHSWyXJGzRIP7WABCE+vgEKSmNLB9z9pBqxqI/FRHY1oOuqy/Ewkuib
	 vUd5f4gqPIkxVatepDf+eAFieDznZ/Vk65c1m6JM8W5J1f7Q783VYMtMZSvqcg3YTzQoD
	 Z5F2uco70PyApQpXhDDMpidR/WKoTdMuFy7SCR9g8hScdI7wktVSKBaijYR8jGD1fTvBO
	 i1QdAn2C8COQv3qfiBLIsvQ3I4L1bye480vgwKstj8KIZNoUQSk3qXdtqSTCY+/kjXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=u4SJRtng;
	arc=none smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00139606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00139606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=u4SJRtng
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-679334baa1fso1582553d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1793207847; x=1793812647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FC7uHBzaVJ4BUk5uLlNk6IJEROP7WjcJ9ABFqisilS4=;
        b=u4SJRtngGAA8WLrI1f5rtpVNST3V8hkYef+YfdRbbetPnaEZTUj4VfWk/1a+dyhr7K
         oEdqIllqLljbkwJgI3qRezcUZcZoeXBY6nCgitRtkhFl+wrTr4Q1m7gD//jpGQjgWhBQ
         mARXDROS/B4aR1FD7C/OdiDro2p/rGxehOe8/8dB/QqNvICvK68TI+xp95DEQ1dDphvK
         C16pb+W1dubZiBgyi9QdKx6Cp8BdBRtnkaWrMsUROQyaOqqRWC+NE33rnpfTChUawduU
         26AOzm3PJqg4HmYyrR2McCuSzVra4jZLQZ0j/MfKUtqq6VOTeY4nqZxddLBBXpAU+H2Q
         ARVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207847; x=1793812647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FC7uHBzaVJ4BUk5uLlNk6IJEROP7WjcJ9ABFqisilS4=;
        b=RYBtQE34jker1iWxY+lG1d+VFxT+O++zFYDFy2myx0921ekf5BjkTSC5gTZe9SDVlf
         L2emFIdiN8mhnsQ1GlAMLUQAJZDPoQA0tkhDPYKKek+iHdmLKIw3/6li3HxCxff+siyS
         J3Yh7Mvc/+eKBnLN/65dAcVjQwBvSHqzgXFVD7OMeMtGxwNfcRrjHn3FR2QrutL4U8sb
         eyL4T3WTJq+ejaoq0g8oplG4l/9bFjgraBlSZZLm9FzWGAlMfu2F+b4N2/78IUkL18Sl
         TGHrN6m8TQqNNooPJMdQ7Yau7gJhA7ugkcdy455Ienb5n9+exf+A5E0TC7Rn9F3gNxeh
         tN6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzCj6Q2UVzWIx0NknLpw98/j8W/8LbKHrI7vc/wRZqVVuIDDh8wwHr053uzz6fLPAYHTb1C/Er8LaOTbmY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmSpZhnlt3Ep1R8z9EZUFx48q+4p5EI0wLaXc9fZpd8/3hkzUz
	DdyVSJJPXgX3fJoKsWKg1vtgTuId7Mx+YYc6HYwEnMOrJgkdyhO2FxOPhvIPzrsc+/M=
X-Gm-Gg: AYBFou1etCuISoQiS6nQxrNRwyBk4bneT76KlkMMNw2SqzfLcUzV3EYilapLSLO6RWN
	3R1tmhGy30ILu0gahddTGpYfo5i0vfenRUEpvP1kWf8L8YxRZ4e3j7KEckAb0DT1NjAmrws6iTq
	Ac1XPexSSf2pomD0/f4oRki9XohWtiYxIJpMeUwQe40msxxgBQoWKD0zdqNwJtP6AU5Xbi0ML81
	jAKxWohG0eLsaCvrLETK3ArEMnDGd9li0P29HCoMXx8uAYWbclqddERwhElr9xLaVfUPhL/NFey
	qZW1EDh0BWp2UCYcwsR7Wq1sKh4gq8YmfSRN3djCO/FswiLTWRQzAkQjpIjLQwRJrunh12Snb1l
	Y5xUX1Wdt38+4pNMv2uNR9iiU7fQB8qjAhr7O6eCzIU3NB1dNQXZzH/1f0pfm9Fkki4yvbgTUb3
	HdpP8DuzMN5TTntKMHdXNvkesuEhdPdP9jhdrR2kpQyNigrwKxkBAxYeak/tpCrQk+rQJl86Ir0
	EQYdlMNHrfder0VGduTbYWXNWUIUzlSwKTpBNIf9icWuZRSYNrvwLdGNXHWB0dkTR2b55RUJEyN
	16MTjshALQiSdZpQ7+mzvvlLB4Tf
X-Received: by 2002:a05:690e:1a5f:b0:672:ede8:d0a2 with SMTP id 956f58d0204a3-67a7bd62e6fmr1340912d50.93.1793207846761;
        Wed, 28 Oct 2026 10:17:26 -0700 (PDT)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a7a10a7dcsm2116484d50.13.2026.10.28.10.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:17:26 -0700 (PDT)
From: Johannes Weiner <hannes@cmpxchg.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>,
	Salvatore Dipietro <dipiets@amazon.it>,
	Christoph Hellwig <hch@lst.de>,
	Dave Chinner <dgc@kernel.org>,
	Matt Fleming <matt@readmodwrite.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Michal Hocko <mhocko@suse.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] mm: page_alloc: fix reserve access for non-blocking requests
Date: Wed, 28 Oct 2026 13:15:52 -0400
Message-ID: <20261028171719.2043421-1-hannes@cmpxchg.org>
X-Mailer: git-send-email 2.56.0
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

Hi Andrew,

Two fixes for how non-blocking allocations interact with the
highatomic reserve. v1 was posted inside Salvatore's thread on
skipping direct reclaim and compaction for costly __GFP_NORETRY
allocations [1]. This is the same code as a standalone series, rebased
to mm-hotfixes-unstable, with the changelog clarifications from
review. Salvatore's patch is parked in mm-new behind these [2]:
mm-page_alloc-avoid-direct-reclaim-and-compaction-for-costly-__gfp_noretry-allocations.patch

Patch 1 narrows which requests may physically take highatomic pages,
patch 2 narrows which requests may count them in their watermark check.

Both are prerequisites for Salvatore's patch: it clears
__GFP_DIRECT_RECLAIM for costly __GFP_NORETRY requests, which turns
every large page cache folio allocation that reaches the slowpath into
a non-blocking one. Without patch 1, those requests may fall back to
the highatomic freelists reserved for atomic requests. Without patch
2, they count the free highatomic pages in their watermark check while
being served from regular memory, so they can consume regular
high-order blocks below the min watermark by the size of the
reserve. GFP_NOWAIT requests hit both paths today, so these are
existing problems worthy of their own stable backports; but
Salvatore's patch would widen them significantly.

Patch 2 reproduction: a GFP_NOWAIT burst under memory pressure can
drain regular free memory to zero while the highatomic reserve sits
idle. Measured on a 32G box with an anonymous working set, swap, and a
full 290M reserve, three synthetic bursts drove the 28G Normal zone's
regular free memory to 28M, 0.8M and 0.6M against a 60M min
watermark. Swapout failed its swap table allocation inside reclaim,
reclaim scanned 13M pages to free 200k, and page faults stalled for
tens to hundreds of milliseconds. With the fix the burst stops at the
min watermark and nothing else happens. This was found in review and
reproduced synthetically; it has not been observed in production.

GFP_ATOMIC order-0 requests have a milder version of the same problem:
They are entitled to the reserve but are served regular memory first,
so the fix there has to change the watermark check and the freelist
order together. Salvatore's change doesn't interact with this, though;
fixing that is left for a separate patch.

Changes since v1:
- rebased to mm-hotfixes-unstable (2026-10-27)
- 2/2: changelog states the bug was found in review and reproduced
  with a synthetic burst rather than observed in production
  (Vlastimil); notes the remaining GFP_ATOMIC order-0 problem as
  follow-up work
- kept the ALLOC_MASK_ATOMIC check inline in rmqueue_buddy() rather
  than adding a helper, as discussed: it pairs with the
  ALLOC_HIGHATOMIC attempt above it, which is what makes it order-0
  by construction

[1] https://lore.kernel.org/linux-mm/arFBWvzXPYrKuIYi@cmpxchg.org/
[2] https://lore.kernel.org/linux-mm/20261001082152.2879289-1-dipiets@amazon.it/

 mm/page_alloc.c |  4 +++-
 mm/page_alloc.h | 14 ++++++++------
 2 files changed, 11 insertions(+), 7 deletions(-)

