Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871429;
	b=eXQnqRlq7mUx0dnzGG/7wH6e238ObvlXyo/g4A/e0vt6Xi74Qog3nKmRjGkyIXgFZAuY
	 e6YhX70ORzDV4F/sCkgANOMRVcoN/tt16QgXQT5BJGGCjz6ygXHo247+QP89RAitYH9xe
	 UKCxgL5RHSn21cGWc9xcBUg83dXwJMg6RChRjFJhzbpDhfTOlK60AOCZxQAjgZO1XLl+6
	 nsjxWSP5fsPO9l/IK8cYB14OLb1VOhO0i0SJbY11JW+LIAMuSS4exkV5t5OIWiwjpHXyk
	 zkdHgf8bXUZ0iuf9DNeIdtI7LT0RpfLbW1W91ERvjRr3IkCSFfIZKlqB5Xs20fYRQYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VKxvJEBSpjGlsGfyxb4wEnmaujupzaQfHMLbEQO7Hww=;
	b=yVKzE8t9AyMs+8HT+CQQFcNHEpUfz3+iA846sPh1RnzhRd29FrOH+MV8MUIZu5qkMLFz
	 Jq+ODmNcEG4oWko3NbweKIdrQilA5EQh9mnbXs5X+a+QjuIulYkzkM1UHOtuDGXvCVFwg
	 ufpBAr6Nxls2tMx7DYMGgkPYX+QFY0M3x6ixgtM33q8+QaX1n2dCLJ9sZsdR23bx8ii7w
	 658eX7B1IDBu0xOkYeAB8Z7IshXJT1qQ90ND3coscbdcm8ysPPWcUJBRGHpIuk12OB3xR
	 l1ttk7AhW7If7GuWnPfMx2InsfRhZ2kOiG/5clbLHIGAuwgltn2+bpk42b67drZqcDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HdJp2evG;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8805C606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8805C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HdJp2evG
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4877837890fso2564692fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794871427; x=1795476227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VKxvJEBSpjGlsGfyxb4wEnmaujupzaQfHMLbEQO7Hww=;
        b=HdJp2evGIycMO9E1m8us6U5LrYKMfor1vUx8DWREl7XOBWHeAN/IR+9cymugv97J0D
         ZjAHZULoNYwL/yxkP1wOiRmeH+wjy0SZ+ch/KDfX+WIeTX+27JJT3aMR1S7OvabBZG1/
         uVoVSG0pOi+8VTPEALoSse9T2cy9sx5hF0ISZN7eMX7nv6Ch4gfLtvZoq1GFvohWO6sO
         zIuW+xLyRYjRyJfqzWhSaNBDegRn1FVLKgAY82RodSXLR6mknxv+Y0yVUu4GX/fxA0lY
         OnFRBwwTome7i9pzV4kS+Dlxk5E0e1sg8Mbl+TZjtiP+K9WWMC26MMEiABn22cKl7nmG
         2Aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871427; x=1795476227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VKxvJEBSpjGlsGfyxb4wEnmaujupzaQfHMLbEQO7Hww=;
        b=IgvvC2juvBXklqF18Smr5pXAA+ljp485Hk7LYGhv1Us77CcCjoWi3ay7luvEwtqMOO
         t6OZJpnAGbVCh2ZaAPdQWGOJv1EN2C+EgqNQOf3at6SQJ+MHldSXInbjLYyQdPPb4DPK
         tnm9HwQcHs554QNvASG7oFrrQOv/KUdPW/yAwGaNDUQbXpbXtFpuw+OLKRwSIiGJeCBc
         VXculSGqseBOoGQREt0YGh7U0Pkrq5qb+Sk0LnUvGl2/0RIw2YxScCgL0e8igUZa+5HH
         bXs+ql1k6tv9mTzTETSoN33LUg+jY40onq267HG8RwCBiZCPQCDyj55XKDjRlSYIo1ku
         qEWQ==
X-Forwarded-Encrypted: i=1; AL+hErE5Cn5k8C1XWDWSfYZ59ixJe3e1iizfxdijwt8tRYmnMZMZAY1Bj2eMHm7NFn0e0W8FaDODWx/5+7ZsoOU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8i4C0j+HQQAl7h+s7uMlelz5oLqa1XLzXW+h6X/Md82dtM1ZQJ
	gHFtQq4xryh/gIBR3GM3jnEY8pDVI6scpxHlLApDpgDpywMf0Eo4Hpn1
X-Gm-Gg: AYBFou28alfDhibJShK+4PgVqY4ESoPwv+CyWUIWYh9NNM4hOyrjfW6YnmjZwvoRYpH
	/B0E22iYSgY0u41+Ni7U/eBmSplMiHSKk4TY5NZ0tInTP2x3XUR4mySpwqe5SQFpO70cdxjDUXd
	19+u+TLGZfNB99l/PblFLNBfjY0b70fZKAglSzJmsyrDrymr3uLPIzh+1foguXAnR+mwbmJgQm1
	JQaYxGkzR7Q1w6EOPFml+yMbKAaAUcLkCMy6ounJ8eNUqUOB4Dx/c6dm+vzACjd6kVJWR6xY7DZ
	TTInIxjQX5VajFe20bzIra7imxpyHmfSdxUIWAsRqcfP2woPzRPUGxM4jYMlvahISbEiCBpijxG
	fR1mEm3jLQUoqK6NG1u7SilYFMq3LkP8PGMvnhFLcSROw+/JjlxvLuaO8tdsOv84hi8ixcAU1Hh
	T6VK454erQDREdJiJ4oEOExHSFP0WmGs90EPdRQp9+sLGmEMwRUomOsWhNkB7NCVU8tpTPU2JWw
	52FSXgpoZxLKN7uU+ndX+FjzKGRjpdvp593w0hvLm+SEYzu56x3dud+ZZo6N/V+TtS+LNhkcE7k
	pCGhk7o5Ekj9vFMm7sMzRGOduiKLQj5MsevDUraOk3JRSeH9ZQHwBZG/2G0=
X-Received: by 2002:a05:6871:453:b0:4ad:6057:560e with SMTP id 586e51a60fabf-4afdf0b94bemr10417482fac.8.1794871427343;
        Mon, 16 Nov 2026 15:23:47 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:1::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2288f59sm7849326fac.9.2026.11.16.15.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:23:46 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v2 0/3] mm/page_alloc: get_page_from_freelist cleanups
Date: Mon, 16 Nov 2026 15:23:42 -0800
Message-ID: <20261116232346.788145-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.1
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

v1 --> v2:
==========
- Typo fix (s/patern/pattern) as pointed out by SJ Park
- Wordsmithing kswapd waitqueue condition as pointed out by Chris Down
- Collect signatures
- No code changes

3 cleanups for vmscan and page_alloc code. The primary goal is to make
get_page_from_freelist a bit easier to read, especially after the new
kswapd zone skip conditions [1].

1/3 is just a nice cleanup that I found along the way.

Based on the latest page_alloc/for-next branch as of 11/13/2026.
Notably, there is a dependency on the aforementioned kswapd zone skip,
677dfdfad244a "mm/page_alloc: only skip kswapd nodes below their kswapd
watermark".

No functional changes intended.

[1] https://lore.kernel.org/all/CAN+CAwNsqWpPoag_XE6bxbrfi6m71xw1NS_wc3h_ShZjNspSjg@mail.gmail.com/

Joshua Hahn (3):
  mm/page_alloc: drop unused gfp_mask from zone_watermark_fast()
  mm/page_alloc: move the kswapd node skip check into a helper
  mm/vmscan: consolidate promo vs. high watermark checks

 mm/internal.h   |  1 +
 mm/page_alloc.c | 55 +++++++++++++++++++++++++++----------------------
 mm/vmscan.c     | 22 ++++++++++++--------
 3 files changed, 44 insertions(+), 34 deletions(-)

base-commit: 3a99594e62fce8c646e8aac01d38af16d6833a40
-- 
2.53.1-Meta

