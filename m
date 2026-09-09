Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272465221C9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950152; cv=none; b=S1IYCVPDvGcwrwBB6qHCmqNZDLVUpAFJe/nabEcg7RhuME1Z+lcWG+uAxHULUoaze5eskUJi/TMp6IZ9SCojJCa9hbreR5XQq9pU8ohqrl8IZzXxTC4mmXwXOq+gAW6wIH7X/531d1J4nhzZgFd3FhJ6btryqNpLP1XlZmbJGtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950152; c=relaxed/simple;
	bh=RILLo1OM8wUjyazDx0uYb0ZEOlSa7QCNuPJs8t0VB8g=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hDD9pw8j0EIjSGWp4A+KuWHupNfksZKSOzqxc+XIYvVABRMSs2K5jp8IsuPEJ79NuIrBykkh1v8qGkvJyswImKnCSMXkarzpfX/OUreQhSwMoXnbPwKCaPPntCjvxaewc8xxsnOwG/1b0cx5vidKDcu1xJmgPra/CH9xPrOVkkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y7JxXRY9; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y7JxXRY9"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-861a2ae9c51so67081607b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788950150; x=1789554950; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01Cz/m/rw5yJ2Ele+bEMQyVaRjGaQszVRRuNtZjuAys=;
        b=Y7JxXRY9lDl6xdfun4kcEv86OTrEQM55JJNMOAS8dS9x5sWlAJSxDXreUGfqQPbcED
         XLQ9/6f3pvZLbK708V2enROPzlPuXEvHEfQ/GnIh82qtIw7Lo1M7yFN7pJJRDk66KwNM
         WImd6FUjuy/FxntUCo9elqCDafrWOPGP2ies8hazChJ7X79X9kFm3cTDSdPFAWQVWhHS
         xidR9NaO0mxL8ydAVtn/4c7S2u2ZbV/c1lGaUjhNJby3ij170xuebuagtoMCx3hY6wJc
         fqa64N/b1umfpyLtF2U6dMZCE393S8+Thee29sMSB5YV5tLMSvUGQA7Z/cjxlFHJ11Lb
         cwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788950150; x=1789554950;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=01Cz/m/rw5yJ2Ele+bEMQyVaRjGaQszVRRuNtZjuAys=;
        b=fa8RauNe3yWgEvXRxLpC/MCl6LZhTq7BRcPTkR6qbsRpHWnuf8n/mXcyApL81RvugX
         cn/qc+Z8+gTIsBEBtYKX6i1vC0RHgXt/JAk1BSVLxVV42GdyxbQ/UOEsKca0UyhwOWRS
         R3DZJA7m3XG+VcFnH2F71jPzBtnI0a/1YFtRLSLeovVMKJIf8ptBhBQ1Pu+R1WPAP7bR
         //pPj6VBQBwAVcURUgB/SVg7dg+felq6hmVJJsAStE/6YzHgNELsfYRl/aY0OoFEkpYy
         oJNJMbzt9OT07tPZ5nz1kk81G6tO6evxsaZh2N2JDX+/I46IdhPT71PgafUZsjf4yMWl
         F9tQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGLg+Cl+L7DPngMtjS8I+aDYm7lZMDcwndVFd5xPq0ePKJrAcL41HSrOdcPj7a3rnihNvT1IFp+qpsCwo=@vger.kernel.org
X-Gm-Message-State: AFuF++nXf9pS3Hye+HQrLVMoDQv4O/YfnJG0eKQF/6MXyUPlqXjAMM5O
	TSHG7tQm6iTv49GcD9u2s2IDwX83iuEmZ0ofnm8jliC8mlaf64q6Yv9lK9sN8yJPpA==
X-Gm-Gg: AYBFou363dGz8Fj1unjiC757lsrwPndu+vDvaSQs66wZtIB07kVJU9oAGNmNiCIcl6n
	LgFS/RT9H+remHyyP/00H6mPs1G8Eu73Sav/MtrJOhKVPfn27O0mhJhq2bjlRfXAtXiN2gbhrHs
	CG0YvUL1eX0p5aCe1ObhtcpdTc5+qso4D1PQXuHuW2FuyjjHO4f4sW7O+7llU3GJ2oozRD6PE6D
	yynt7dEXj1ngHsk+3HquUHz+9xRzKhY0Aj3m/phhYpF5GpGtlaQvwu4JVk4g6XKzJkX3+qyCxYo
	WUMz7RJkVJkz0a3o22VbsZ94qcQCuO52d+at5+lNm1pr7rxMnqfpoKWmbdc7m7G2msiSgDyYgyA
	FOMdOopkb9w3WoMAxTbRg38AHkqm601TLjtjAGcjV6I3lTfZYs7BYZ3sYVYmfR6kSg9VXqBugr0
	dG09mU4i+odMeprNfSPfFhkazR45YbnywhhOQcrDYZ69SLRea7sTKbkr6H+0vNOawMMqJ4LGz1Z
	PeeHABwUGw+Ru7oAJAURPSjk0WtkMlpLtMz/yQ6ugxTdpTI7GOI6axB7RpwgJQi
X-Received: by 2002:a05:690c:c50d:b0:873:ea3b:6c08 with SMTP id 00721157ae682-873ea3b77c9mr91382717b3.1.1788950148979;
        Wed, 09 Sep 2026 03:35:48 -0700 (PDT)
Received: from [192.168.1.242] (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87143ca6ddesm107684497b3.2.2026.09.09.03.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:35:47 -0700 (PDT)
Date: Wed, 9 Sep 2026 03:35:42 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
cc: Ackerley Tng <ackerleytng@google.com>, 
    Alexander Viro <viro@zeniv.linux.org.uk>, Alexandre Ghiti <alex@ghiti.fr>, 
    Baolin Wang <baolin.wang@linux.alibaba.com>, 
    Barry Song <baohua@kernel.org>, Binbin Wu <binbin.wu@linux.intel.com>, 
    Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>, 
    Christoph Lameter <cl@gentwo.org>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    David Hildenbrand <david@kernel.org>, JP Kobryn <jp.kobryn@linux.dev>, 
    Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>, 
    Johannes Weiner <hannes@cmpxchg.org>, Kairui Song <ryncsn@gmail.com>, 
    Kiryl Shutsemau <kas@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
    Leonardo Bras <leobras.c@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
    Marcelo Tosatti <mtosatti@redhat.com>, 
    Matthew Wilcox <willy@infradead.org>, 
    Mel Gorman <mgorman@techsingularity.net>, 
    Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@suse.com>, 
    Minchan Kim <minchan@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
    Oscar Salvador <osalvador@suse.de>, Peter Zijlstra <peterz@infradead.org>, 
    Qi Zheng <qi.zheng@linux.dev>, Rik van Riel <riel@surriel.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Shakeel Butt <shakeel.butt@linux.dev>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Vlastimil Babka <vbabka@kernel.org>, 
    Yang Shi <yang@os.amperecomputing.com>, Yu Zhao <yuzhao@google.com>, 
    Zach O'Keefe <zokeefe@google.com>, Zi Yan <ziy@nvidia.com>, 
    linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v2 25/26] mm/fbatch: move lru_add_drain_all() declaration to
 mm/internal.h
In-Reply-To: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com>
Message-ID: <26b1d94a-497a-fd6d-e700-342ccb65c045@google.com>
References: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Only mm now uses lru_add_drain_all(), in forced reclaim and in memory
hotremoval: help to keep it that way by moving its declaration alongside
that of lru_add_drain() in mm/internal.h.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 include/linux/swap.h | 1 -
 mm/internal.h        | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 423d9b669149..dfa6314c0cee 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -300,7 +300,6 @@ static inline void folio_add_lru(struct folio *folio)
 	__folio_add_lru(folio, false);
 }
 void folio_mark_accessed(struct folio *folio);
-void lru_add_drain_all(void);
 
 enum lru_cache_drained {
 	LRU_CACHE_NOT_DRAINED,
diff --git a/mm/internal.h b/mm/internal.h
index d9930b752153..f28fd310455c 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -54,6 +54,7 @@ static inline bool folio_may_be_lru_cached(const struct folio *folio)
 }
 
 void lru_add_drain(void);
+void lru_add_drain_all(void);
 void lru_add_drain_cpu(int cpu);
 void lru_add_drain_cpu_zone(struct zone *zone);
 void folio_deactivate(struct folio *folio);
-- 
2.51.0

