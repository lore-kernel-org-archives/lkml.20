Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396942;
	b=0uxKjdZzTpMG2NdghK6O6KnqG/dWUkTvW9+WDzjsWFJV8IcgefRZ/+bYkTxFVoRsSwP3
	 dyw/hzflHc95W772zKCuA1BPBXuqJKBzjlr5qT1+JFPFAqwbAZBwc1GwCvuRXBjM1Ub/n
	 8fkBF04jyrzVmwNKM2Qtg0d8yBUnXz6WiDY6AK4ryQW7UhQ0S8IjnH67zFILMbtJspfOk
	 3oIBGDTAT5zoUT4QipH7lsaCx5DeMsiV13zdkDb4LrCoUwIFcPWb9xtkcEcmG2GmjVGr+
	 wXhdfO7VO0hJA2YiRJLO+DXohxZruKR16d5OTyPkQwSwlNVepGdjE0Du1qntybN6aaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NjJjHaen9J/fp2I0Vpm97Xgvh0z3rGeImkxT74DWJ7E=;
	b=mHsgBfrPkIQW2iEjoJsZcCjtYB6+lSCAVjS1TSycPgnxEr1nLIx90bRzE4DrukjMRiY8
	 tGRSJfb7++8BtZGEINASwHcnB5MAvZgBtPnhFhlcZmMVJfC3UZ5sdfICUyPFJ6nWk9C4e
	 xiwe5D7yvLrdxILdvpd6jkH9rzZnUB7W36RJQhRgS1BxqxrZHxmh+gxPycHz1n54k60LJ
	 ovevMocM15dHE7t54tH3dY60/0OlxRr6NgaJknjCzhEpcz0INuV5PNo7GiIba/asLkhI9
	 sscpgZnIf8aD5J78tDQy/UGLSk6jOtzsFIVBQzY70Y8Fdph9Lm3+nysHr15hnIA+OsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iH6QOxA+;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238C1606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 238C1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iH6QOxA+
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so18233845e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794396940; x=1795001740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NjJjHaen9J/fp2I0Vpm97Xgvh0z3rGeImkxT74DWJ7E=;
        b=iH6QOxA+e1WFpODUvpLHhVIzL8iNnBnfGgkma4GEngCj5kY4MZ6AdeLlfL14zE3JQB
         IoowHiUFUFRC8s/3E9rNHIwaMX9yZQqSAD5r5eXcmWoCQK+85nSHt374zEj3AxMoaW2E
         vH6SIXIijss3XOFnpMGRFoGafIQG3fgGWeBMEZcYk5z2ypQEuz5Z5dug5KTSLlr5bF9i
         U35dbITR/Ihxw/KcXUb8CT44gXi0euwWp25fhzyphnn61GDszsfOL4IXOKcBzjCRlKrv
         F9OeDaZOPLjMBvrso9hAuFC94clmgNfu7z1BvNPNXPniKE+GCEtfwWuLbqXA+JL1E9Zc
         JniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794396941; x=1795001741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NjJjHaen9J/fp2I0Vpm97Xgvh0z3rGeImkxT74DWJ7E=;
        b=X/1IIyXkoIBbvk+ivasmD/sxYmVW1kQckNw7036xs4wyj5kyAuJtx7WmWdt/B+D8xf
         mIv3A2627HTCeYSATDghs+QLY+xuuSvLjo1DoTbtaNN/qlwJWF/esaWKUMTKmx+W/POw
         aG7vmDEPvoiatYrwJk/+3Le30AtJHEGIjBE8k6rfZsLX4qBenfDSajUBCvh8Q12vXPTe
         im4G7zCPUijjKuLyHtecK3fpdS3TfOEFLXP+8WfBaVepvOj6oC4OTokscAT9ewB6HKCn
         6gFHnzgJ2lXDJcoX7i4Qm1Yt0gT871ObBi5u/hsKAgzD/T2a3jzKTA48arSjzh9Xrlzu
         TGtg==
X-Forwarded-Encrypted: i=1; AL+hErE1xPWqlBeCHnJHvteAKgNp9f6bTDKpHh7MCmOt+Y2+W6LJW98FBeS1smy4/Az8CgN42CHSxB43h1rKx1w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0UPMbkPUXNrR0VeF4NskLpIzSveTfyGJzD1kmrDsVkClR8V6f
	JAt+C1t649Qmvt8li8mOFyDYmmFCdhiEM/73bU1EulPc05MIjQ6I/9lD
X-Gm-Gg: AYBFou31kQwHyp7wJAwpH1RUR1DHuExJZOJG+7dIQ9wcFfRJcve8MwTCGHiDh2xoYg6
	qDV8cdY+ZxnkkYmeDMV8NzI+KhkOdeMtvvtemn70AXfuiGGpLgQ3r0SchBIJWNrwYiHXmIM+EQS
	/5MH/XSivqajnTDOsEm2XS20rIWNpLbBgzxb2RFrSUApEjohbvDFp54a9PuJpzexWpSwAUvP3QH
	wPZnNUnCV2r38/25ifXkoRnsdt46KAqTK9X6WPO9+/zfXQZel7RbbeZlNb5MDXTIQrueiDI+/pS
	lAF7kLMNACTecK3WizrQ2t1UWG3q8rby3cSDfA5742JsRiYJEjBd/4tWf9P8TWKRpVDPZtmCoQu
	RgajrjTDIN9wOdbaS+bMAlKQyA66kbYH1ofn19661RUaHBeZG9n43v9vz790dwgmBoorRE+j0ry
	NyqqkBI+qTTBRRpI93qcIL/IVAjivDDHQP1LWL1RnYi9C9oJH8Fc01Cme4cqtQjUkTbQcOc4wRZ
	T7VVNg5z6PUcgoX1OeIhE3aqrq5YQTs9Oo+ZBJgFfWyjJO4B0Ec++GKInEvhKaMmxmZN7ySUxJ9
	PSX0LSb+DSqZig==
X-Received: by 2002:a05:600c:858c:b0:4a2:1002:223e with SMTP id 5b1f17b1804b1-4ba08dfde5emr38653035e9.7.1794396940348;
        Wed, 11 Nov 2026 03:35:40 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365cbbe5sm11598683f8f.42.2026.11.11.03.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:35:39 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rik van Riel <riel@surriel.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Jann Horn <jannh@google.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Joanne Koong <joannelkoong@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [RFC PATCH 0/2] mm/huge_memory: find partially mapped shared folios with NO_PAGE_MAPCOUNT
Date: Wed, 11 Nov 2026 12:31:36 +0100
Message-ID: <20261111113535.330078-1-azpijr@gmail.com>
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

With CONFIG_NO_PAGE_MAPCOUNT, an anon large folio mapped by several MMs
isn't seen as partially mapped while its mapcount stays at or above the
number of pages. If parent and child zap the same half of a THP after
fork(), that half is mapped by nobody, the folio is never queued for
deferred split, and the memory stays allocated until every mapper is
gone.

Patch 1 moves the split_underused_thp check out of
deferred_split_folio(). Patch 2 queues such folios as candidates and has
the shrinker walk the rmap to see which pages are still mapped.

512 MB of THPs with the same half zapped by every mapper, memory freed
by the shrinker:

                                before    after
  2M,  2 processes                0 MB   252 MB
  2M,  3 processes                0 MB   237 MB
  2M,  2 children + parent PMD    0 MB   244 MB
  64K, 2 processes                0 MB   252 MB
  64K, 3 processes                0 MB   252 MB

With patch 2 the shrinker reads shrink_underused itself, so folios
queued for the underused check aren't split anymore once it's turned
off.

David suggested a check from the shrinker for the opposite case in [1],
folios marked partially mapped by a PTE by PTE unmap. The walk in patch 2
could clear the flag there too, this series doesn't do it.

Questions:

- Is an rmap walk from the shrinker fine for this? Every CoW of a page
  in a shared PTE-mapped folio queues a candidate, and so does the last
  PMD mapper when it splits its PMD.

- The walk needs one bit per page, which is too much for the stack with
  64K pages, so I used a static bitmap under a mutex. That serializes
  the walks of all nodes and memcgs, and the mutex is taken with the
  folio locked. Where should the bitmap live?

No selftest yet, I'll turn the reproducer into one if the approach is
ok.

Based on mm-new.

Tested on x86_64 in QEMU, so no numbers from real hardware or with
concurrent reclaim.

[1] https://lore.kernel.org/all/20261109220958.2071687-1-joannelkoong@gmail.com/

Jose A. Perez de Azpillaga (2):
  mm/huge_memory: check split_underused_thp in the caller of
    deferred_split_folio()
  mm/huge_memory: detect partially mapped shared folios without per-page
    mapcounts

 mm/huge_memory.c | 86 ++++++++++++++++++++++++++++++++++++++++++++----
 mm/rmap.c        | 21 ++++++++++--
 2 files changed, 98 insertions(+), 9 deletions(-)

-- 
2.56.0

