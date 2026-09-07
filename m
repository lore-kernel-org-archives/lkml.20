Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A66E44063E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770809; cv=none; b=tVX933LqF/ZFZ4B9LGEWsKdWA80lofjm+jCDM0COxLp0O2J7Ajhllar8ZasOXJvqlbYiX5E5NqaprMg6Gak4CdbHUrxNXHWEnAlyzjWllfsgHxm5FfN6y7MFn+cEs0B2P4FJqyR1k4EiBOZ1/HfMJMek3o2JUX1mcjzWdDihbck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770809; c=relaxed/simple;
	bh=bo+3ezyb4Sv4NQNeQMvoxqsPDGjYgbnA2PqCEy61drI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aG60h403nkcIM8pm1V1P0mLCoLSTwojC/K7c0HVQYER8X6cNsK0Qdt0moeSGiK5srkcjjcYviNmPO1bqmhi3DNR4f9lRN6B92WqzItnBrp9zc2a5AbTQt+q0TvTTSFsyMYNHZRUO1XKAlaL/4UF9QaHAwyU1U4FIg1suD6kprrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fubBKu5E; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fubBKu5E"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-382ef647e20so3297106a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788770807; x=1789375607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bo+3ezyb4Sv4NQNeQMvoxqsPDGjYgbnA2PqCEy61drI=;
        b=fubBKu5E8KCuyDi/eKNOUb+B0gYji+NMEJCNFm8/XbBd58hTb58qTsUZD+odqMWHtK
         Ps8neUnxC8O14XP4u4MA+L363zJRdyEVccaAeV2EBNDjYKLQ2mUPBv27HLxZpa5APehW
         fT2UcoNkQgTJw9I3EEJzT+HOA+C0Ck1hH6QRxI6IC0BGvuep7QxaajpCZUcMHgT3BtHu
         evjMLDuSYfbSglY+fZRd7B6Umfqt3K4ApRR8REV6qHDGy/kahyXrYKaDftA2/MOVd8GC
         6+YoVjMrdU7xgVQp6zMWrvMdOdWKNjOdCGjrAa7pec7bF0fie7oRMsuGxrRmOu/nIcLM
         BEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770807; x=1789375607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bo+3ezyb4Sv4NQNeQMvoxqsPDGjYgbnA2PqCEy61drI=;
        b=cXbeDWFkvvN4+orcchDf4w3LidKy3JuZTq8fbn+TRidwG+SpMV5S+DrDW6c07BfLB0
         70blCo9+pXKQYDk0JB/XbyhLu9wQxkd/cXTYNYzEuAPFytbYYc1yMHzzAhV7wmh5yaTx
         NYxW9/uuV07nKmfkxHXxwkr8qq1rjHxeKnNh8iVWM4XF02Iytq1Z1MUBA94Pl+RgCJmz
         cvlK/99lAW61ib70njuvgRUxejx7ioJbpeHlDzqrFopmXqX1rU1Ag7QlJJBW34MCgDJq
         7y9JceIqU11OHQbWqOLGWfDNyYzNDXSZlFljLbQQLvKUUjrtgbcARg4JOEP6rcQcrAr2
         dgPg==
X-Forwarded-Encrypted: i=1; AKwUvBxbygEEGmzgxz1tKx8LlW9fqCzwQtvpEHuoDHVWBexpKCJFJwtztnrHzt1wkuK+OGK1HFUfxmeJwG1DTPU=@vger.kernel.org
X-Gm-Message-State: AFuF++lBLnDfQCBz8SnM3Vpi0DIdZietstycjzSRw9dcAwGngleDcF7i
	2S9S79BCLRVAtdBqREwrP8LRyCpnU6Dww/yZVYaHMQfg312f9FaV+JsQ
X-Gm-Gg: AYBFou3Wi5D1tBnazTKzA2g7dodsUrzGwQu1bKqc9A4RLFcyUcgDd5rEyQHWj4Qk/oc
	072Evzzi+/VhULE2B6re0/Oljwx9wlpS3loyaA+2g7zI59CDWEZnsxCgbiAGf1LSwe60udT2YJd
	rhSAEVtkcQohuwSklvxl5FXDY6y9Sy/R1PdE/R8bKrLq+7MJhc+5kQG1GTvsWZu4X2kNvEvnqPB
	tO/dJbXOkIt3PJ7OF2sGRBp1ikWDDEOWtx+V456wsf2UKuw9M8bKXs0MacAXw6qXmRD475YtvDS
	VSSJC1idnqvTFEtQwf7vYmd7Iza5ZgJ46FGnA2uNyREUiGUBhnTPfwsAa8hyrow2EqqjaenXWvz
	yRqmepfgeDL2L6j462UJ67j46xk1h785T8zcmQPm6dR6LsiJB4ZN9ixLARhjy6r2R0e/fBhg2Rl
	mvZYt1N6YU926lzTnaj5NNHUC6Q4cZzh77vCGR8XTDqI1UwAcF/0CSHslgp9Vlsecxu072MfUpJ
	m6MAg==
X-Received: by 2002:a17:90b:5790:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39b2624f0ffmr32121138a91.23.1788770807373;
        Mon, 07 Sep 2026 01:46:47 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae8f1cf6dsm9357274a91.3.2026.09.07.01.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:46:46 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: ziy@nvidia.com,
	akpm@linux-foundation.org,
	vbabka@kernel.org,
	david@kernel.org
Cc: surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
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
Subject: Re: [RFC PATCH 0/4] mm: compaction: mTHP-friendly memory compaction
Date: Mon,  7 Sep 2026 16:45:12 +0800
Message-Id: <20260907084512.670883-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DL8QRV0RZS55.238LGA5F34MYG@nvidia.com>
References: <DL8QRV0RZS55.238LGA5F34MYG@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun Sep 07, 2026 at 10:51 PM EDT, Zi Yan wrote:
> But skip_isolation_on_order() skips a folio with an order >= target
> order.
> ...
> Oh, you are targeting proactive compaction, where
> skip_isolation_on_order() does not apply.

Right. To clarify the cover letter: the "migrating folios that already
satisfy mTHP" concern is specific to proactive compaction, where
target_order is -1 (via compact_memory) and the order >= target_order
check in skip_isolation_on_order() does not apply. For compaction with an
explicit target order that path already handles it.

> What about the impact on THP compaction? How does it affect direct
> compaction for both mTHP and THP?
>
> It sounds to me that this patch series target proactive compaction. Am I
> getting right?

Two things:

1) Traditional THP (order-9) is not affected. The mTHP-aware branch in
zone_effective_free_pages() only triggers when order == compact_hpage_order(),
i.e. the minimum always-enabled mTHP order (e.g. order-2). An order-9 THP
request does not match that, so it keeps its original behavior exactly
(NR_FREE_PAGES_BLOCKS under defrag_mode, NR_FREE_PAGES otherwise). We
didn't change the THP path.

2) The series isn't limited to proactive compaction. Patches 1-3 target
proactive compaction, but patch 4 also covers the kswapd -> kcompactd path
via pgdat_balanced(), so both proactive compaction and kswapd wakeup are
addressed.

For direct compaction: patch 4 does touch compaction_suit_allocation_order(),
which is shared with direct compaction, so order-2 mTHP direct compaction
would also fall into the new accounting. However, the direct compaction case
needs more testing and thought. How direct compaction should behave for mTHP
is something worth discussing together to decide the right approach.

Thanks for the review.

Bo
