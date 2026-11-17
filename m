Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794931961;
	b=zVFvHS2QNYfAcbECVH3TsLSYmQ3fJHltNPVRCwNHDqP5TwZq1vtXiaJnhcMkWcEdmMQv
	 hOza4LiXGM9/VcFMdMRpMrEO3/DwVtIyEV4vZDsBpljYMDrxB3c9mzx6YRRfhZeYe+B7I
	 o7CR1CQrytFpBCmDZFOjcr6VETf1PU7ITFDiGD7GLGJgUPR2YRxxWsmwY3XfR5qYyyBJn
	 FssQlcNC/dxn+T6RL69bV7nT+o56kv7TVoEX9IsC767F5aYpcW9PdKRLxPNyABgimSq60
	 1S4MkQl4PnCq9MSSpqwb9Vu7OFPXsNtVdDGcTSbJ06x4sCQ8wLVvDCMs7GFXtvYVtpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794931961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uUg9oijFJngLvXeo3djJLK5OYdiXHydsItyj0Mca3qM=;
	b=hQWCA7YWj8a/yq54Tw+aP5rSghNgoYGe/woGulmJEGVnMC3Ul7koarUMaDSLPyldVJai
	 RugyAOr5dozRRgZQRKXCZizmXCrYil3yy8eJOAZ5SN/Yiv/8wF8d4ioxCrJyrTXmDVFoa
	 5BgZ0yVysaB8/O+/ymVpFAWYBqg4AXKjl+GmcaEKok3K344rCs6TTk8BnH9XZUo0KlgXN
	 skGR3l0UZJfQnIf6W4BU9GTTwfX0O1LH8QwSflswo6cpZNqpXQ2ub/OmWyINxDc5G873y
	 E36V6+io5lWGWRZaP13i2w8VpZa5brN1D7uXYC3hHu8qX6Mhw5wLA3crJCsh/eCzYRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bw9sZlGi;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B8D606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:12:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86B8D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bw9sZlGi
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b3a9a4a765so823507a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794931961; x=1795536761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uUg9oijFJngLvXeo3djJLK5OYdiXHydsItyj0Mca3qM=;
        b=Bw9sZlGiKCoZfi2kf04ctZl/R0ogQmKE1NkNS3ELjWQqjNupEpoc1lQhuVKs8pfbTO
         73Lzj7k58DrseGbgFUa4w+D+xR/LHw/YgOodndT3JoamWJELz+Ft9UNPVxYrtUnJSE3y
         ZW2dnh/FWtvbyf43PEMHNoWTH4DXscz2C5Xf2AVv4ch44ZdPGnVxGucIUWk0oUj6YH7F
         /OUiVp7r+XI02cLN8ssiqOfkny1vmymMirRz+oG/SKwHoJikLC/1E2cXBUebvQoR5V6q
         Iw9fxEhGgls9BYpceht5gadxMbjHmMnvzJKX4VZcuVqG5OOP1GPBxf8AQ2FpQzSNRhYd
         o/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794931961; x=1795536761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uUg9oijFJngLvXeo3djJLK5OYdiXHydsItyj0Mca3qM=;
        b=udLLdxbCf4pAEE3rPFks1/rbE+7sebXkCWkwbXiiX5kYEkD/Fut043NKjTtaoVW26c
         Eh2iyJNu/eyYkwqeYyU7OA/OEHQSBBDNQlzJwI2p/A75O8+Qsa0vHVXbg7GMhFytzD7c
         CRUNHkOGpoGcD6mpC93fnv39It+N53+rdyLrNljDXny4/0lNVdS1clpgDeDUFLF41bBR
         exnv/hOXKmUyUEHWtcKYVf0Hp5H3myEnOOk244Oh6WrkgBMNKIXDYdRZbKfZ5wbZ7Amp
         ylbQV4ahpEV0IdC9tLlNWtqPilCEcRp/ui9eQtpwd205OHCEm3ZDcA/F/ldFrw41WAzP
         OKrw==
X-Forwarded-Encrypted: i=1; AL+hErFqXZpnNapY3/1MsSul8F/+AgdWQ2LXk6CDztkbpIYR5G3cLd3WHXJ+sWGDiLKD0f/Jg6gNxv6Lw35Xdlk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Lp9IRBF8bdVoOnhvZ6IybZG27FTnwcpxDrzJWZV55u0A3Hb6T
	ApxHBdjskB3WnQ8+pOk6JNb+CUHnU7zoicpvCWFrClOEf+3PY1ygGfMS
X-Gm-Gg: AZFdTZc8QC25aCQ7+f+gJLG+njUK2cqjxIhJGBSUwmlgHcL5BL3y3oMZUvF8IAB5LeM
	YlJR3eHm95bunV/uxzW5auIPc65RKcY9872lfK2yHzsdAXgEOuU9icPsg9y+X/WeNcBR2mH82UZ
	paez6PxfBqmWEJFCQKsFS2sAa3mNy7+j36c1NQYB5+N6vgbT5CfbwwIozQdUyOw8vcrBGCYHsnN
	pwL4osTLxjtBBUGr4KIwaLRrBki2mBPr1Q/Z4juGDC3gvNgp5NmcYm+uaiYc3AOIystUxJj0iVL
	Lep49fRN2PBthTMda3O/6MJhIg35DUBge5yR6qsVTl8SSZPh9UT0wDWi0gYl7kYIdnK6pZSL5A0
	VtOoBeB4be7iKr69w+owoytENrrvroDENBxGR2VVhUECI1eumrt3tRiukFgOM2vsvNF4jf73ZpO
	QVhyJ2Y6KP0JC5Mfm2yJejhvbb7q/6CmcHywgJiH8a5PzUf5E2Pl0QYyFjKo7Pi/fJkVUNBL8Sb
	GNiBHCKxE1FHTbU8wz4jiM6MwzKyNPGAb7cli2bKJqcoAFEcw4tZXkBjbomUApYEHdcBAFZaqw2
	bWYoDGKMiBL5Y6xF4A==
X-Received: by 2002:a17:90b:4c44:b0:3ac:7f4c:a68c with SMTP id 98e67ed59e1d1-3b1b0a437b2mr14421846a91.49.1794931960646;
        Tue, 17 Nov 2026 08:12:40 -0800 (PST)
Received: from naki-PC.localdomain ([2001:df0:a640:2::19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1bfb607e7sm8435512a91.3.2026.11.17.08.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:12:40 -0800 (PST)
From: nakixii <nakixii@gmail.com>
To: Nhat Pham <nphamcs@gmail.com>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Yosry Ahmed <yosry@kernel.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Barry Song <baohua@kernel.org>,
	Hugh Dickins <hughd@google.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>
Subject: Re: [RFC PATCH 00/16] mm: add in-memory compression of reclaimed pages
Date: Wed, 18 Nov 2026 00:10:28 +0800
Message-ID: <20261117161028.475891-1-nakixii@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAKEwX=M64ZmMLBRiAQ6FiiP8f=jkA4m=HM8rgQo-cir2SENPnw@mail.gmail.com>
References: <CAKEwX=M64ZmMLBRiAQ6FiiP8f=jkA4m=HM8rgQo-cir2SENPnw@mail.gmail.com>
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

On Mon, Nov 16, 2026 at 06:13:46AM -0800, Nhat Pham wrote:
> What's the motivation of this line of work?

It started as an attempt to get something like the Darwin memory
compressor on Linux: keep reclaimed pages compressed in RAM, fault
them back directly, and push cold data to disk only when needed.

Honestly, your virtual swap series already covers the core of that
(zswap without a backing swapfile, no PTE walks when moving between
backends), so I don't think a separate subsystem is justified.

The parts I still think are worth looking at are restoring directly
from the pool without going through the swap cache, and packing
several compressed objects into one swap slot on writeback. Do you
think the latter would fit as another backend type in vswap, or should
it stay inside zswap writeback?

The numbers in the cover letter are from 6.12 and don't compare
against vswap, so they don't say much about this yet. I'll redo them
on a current tree first.

Thanks,
nakixii
