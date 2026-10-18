Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558C14302FA
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792348026; cv=none; b=HR/S+1iBs5I5ebn8Igpw7rLp5gSbunFWakay0mq+ctbJOklmYMPVFg1994FBm00NWgxgyTLFpVafM7AWWNEE343hjfUHkauJj0820lN05mSyORcxcasxoUFM+5OUgZ6HBFQTmRMC0Pu6ivmeXLXz48KFgyYS5ugCMqI1Z/JuMb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792348026; c=relaxed/simple;
	bh=RgYfAsUYyvQ1eVI24kfpSKb10ilvOnXUTO6cMuwp/g8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MLCN9n8Ei+jX7FPyQCjLNi2sZjmkDyZ0obLRiwmQhmxuodObW5JAn8uuSbnhww8bxmMWGtplIB9hVD1RS9Rsr8eF5G23grlllSm60hyWlcqlbUaJFmd/7Zv4Yy0nE6492pFHEfWHvdUCRJTwGjm98NkVlvlFo9+KnwuchsjvI6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rpjuoaEf; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rpjuoaEf"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9d1114320so4729635ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792348020; x=1792952820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8nNlgkcX4wMrSryMAB7DXxwINAkHdxw6jSwpiwjtPcY=;
        b=rpjuoaEf3QSgpg+hU5HVdQPaTZnwTjFYYRrSRibYWlDqSSce1Mc7rMP+T7VdTk42Hg
         qk2nFbqjP4hBHKctAkRwy0hFLZzZy2SUMX33lHzPJXWRcQmrXKRp/WYtrKJiQt4BAl2G
         IEpJBIjrPgB6yXsaf/9EiaD53ScGoH3ubYr+D5me9zM6J8YYovvibbj7B6SNv+pKL8zc
         seAPJOYUIwUJmFKxVILN4Tte8hc9C95Md+U1MAYSd6mDNIiQItJCn41eSqKloMfvD5aU
         kZB2eWA6ObFdg5ZfmUxOL7uPHTiHaHyK1GxmF5zIcn6VE2Cwn5LTSSBXeAZgektmq/aH
         xMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792348020; x=1792952820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8nNlgkcX4wMrSryMAB7DXxwINAkHdxw6jSwpiwjtPcY=;
        b=tWieDmGZl2+mavOzwlZcjU0f1DiJ5t8so9isz5pf64JSCMDRPVOtSSjnvakgJCJzdA
         aGRGsDs58BWKCgOxT9DSgtf18V+royJNeqsMa4aJ00SKv0Dv0gZ+Ggslb+juqqDsVbLC
         E88jDKowuSGfVs4a/x5H/rV6MTu4I8+DHPMbnXS3xdEzzVwKnv1H4XKtwpakznmZDS/A
         VlJ6m9UTj6mwJxQInmbi/pGpIEX9QL1rM+hcZ2vRI7QJ5XYSXG454FSqY1tBJLL+ZTKi
         YYfeSkdYtXDyVu3cD1DcKWvQ670cDv6snko5exnrMKEAmpg6AFrS3+bgDS5U05U9dyax
         VkSg==
X-Gm-Message-State: AFq9FYKfujlVzdakICEkVxu/cL+HOlycrooZhV1dV3uVtP7178rkyO6C
	nUqe++CGng5u34xv8ubSzwFNlgGBJizvuPfip/26OaLB5BAyqnYeQThA
X-Gm-Gg: AYBFou2wYvdEo+15AK5hD0QBPeBrDoMAIWIX51sp/AHmJ+3pqn+HPodAHs8OVDEQtlt
	SgVWVUIPavAGXAnJrU7zsuQxW0Z6nGNFc9GE6ATqkoeOd6MYF8n9c1SmVVV7vS88tkRjHeLFqbG
	3ND3E3mqrxKSvvlQJ2gTRFPEGXif/eA3vVTHMfHSGgLAXnHGi1b33wEgkv3ldfJ1C0Pur186BDE
	zupcOKS7cGSPIQwsM9vnLRjKWHhxIlQl+GxEW0S/uSXSnThYwOzAyLSFt1TXePXEpKpXm1EbJS7
	gL3Bhmo/Yx+70xzrJnja2SAHJ+8Oxz0zNkIqkysszHxZy9d7i5Y/qkxVzlw8UrN8OpUwIMT8xqQ
	fF01j2/7iliuEEIzvbwDQpUZlwcjCJdgcomBNwJ/s+tjZSsxgqorpfhulUWSzduZ7TbjdUt9uH5
	0AgEkBbAXZloGCg8gB2fj0vJuaRE5nHi2XzjkvzGY2ieXrIbWF3vN+HonTZoeY2s5XKBT8A2Gu+
	6po63TEObBwJokGQFCCl7EmapOGQvkKg/1frUVz+Okfona2aJYkiFIXp8htNWgrMCiCAKglNYAI
	dBofOTLuk9LpdB/Gh3O4pX8mFYu3Ug/Nz0yYMo/flj8a9G8izymFQG/aef0GPXqPfNO+y+qh0Co
	sM/bEKrs=
X-Received: by 2002:a17:903:fad:b0:2e2:c602:2072 with SMTP id d9443c01a7336-2e9a6c0275emr48223185ad.36.1792348020411;
        Sun, 18 Oct 2026 11:27:00 -0700 (PDT)
Received: from DESKTOP-TJS95SS.tail460ce2.ts.net (114-38-149-183.dynamic-ip.hinet.net. [114.38.149.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e83498csm30202765ad.35.2026.10.18.11.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 11:26:58 -0700 (PDT)
From: Yuan-Hao Hsu <aa9736195201@gmail.com>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v3 8/8] mm/gup: batch contiguous same-folio PTEs into one refcount grab
Date: Mon, 19 Oct 2026 02:26:52 +0800
Message-ID: <20261018182652.691-1-aa9736195201@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811025157.1632867-9-riel@surriel.com>
References: <20260811025157.1632867-1-riel@surriel.com> <20260811025157.1632867-9-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 10 Aug 2026 22:51:57 -0400, Rik van Riel wrote:
> Add follow_pte_batch() and give follow_page_pte_commit() a run length.
> Each run starts with a full per-PTE resolve, then follow_pte_batch()
> finds how many more PTEs extend it with a pte_same() scan rather than a
> re-derivation of each page, and the run is committed with one refcount
> grab. Runs stop at folio boundaries, so plain base pages are unaffected.

One side effect worth a sentence in the changelog: with FOLL_TOUCH,
folio_mark_accessed() now runs once per run instead of once per page.
On the classic LRU the first call only sets PG_referenced and the
second one activates the folio, so the old per-page loop activated a
PTE-mapped large folio from its second page on, and a run now leaves
it referenced but inactive.

Measured with one get_user_pages() call over 2 MB of freshly faulted
64 kB folios (kprobe on folio_mark_accessed(), flags from
/proc/kpageflags):

                       before            after
  folio_mark_accessed  512 per call      32 per call
  after 1st call       32 folios active  32 referenced, 0 active
  after 2nd call       32 active         32 active

That matches what the other two paths already do (follow_huge_pmd()
only calls touch_pmd(), GUP-fast only calls folio_set_referenced()),
so it looks like the right outcome.  It is still a visible change in
aging for anything that reaches these folios through get_user_pages()
rather than the fast path.

Yuan-Hao Hsu
