Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7739C277C96
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788062342; cv=none; b=kZWyltwoAFqyNEyQjfBpy4D53W/bICko20UDA906pEHQEQ3GrpLjqx8ejwBYoTQ+xd+3zTEp+J5uf7vq7bhuWCCsSOMgDL82vxiCaaT7XRKBiux+/pZA09IMACSI/oTw8qKUIf9seGxcOzI90H+fmmbtnEnzeBrvjFsP+3po658=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788062342; c=relaxed/simple;
	bh=qxAWLvKfdMNs+qMSByaRxvFcV3DKRTohVFWladS/eg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QUZgQJ8hYswcsuR/aqS4E9Qmr6qj9g7/XVVbrnQTpfKBcgOSZk5SuoxRRy7U/oXr3QoG3q23lkj/u/EXA4QLzQtVUhuTZ9zLGtRWmu0213DaFZpJFMblgQO9fpsO+iuLNZK+EGAOuQG5XSpq3TFxWwcbAhkSmutnmhQ+OSh8Lro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PR4rsqtV; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PR4rsqtV"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d58efc7356so27188675ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 20:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788062341; x=1788667141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQ8dbbiBgPJ6FDZbDcbGb0ykdxb6d7xQ7LY+xp+A1UQ=;
        b=PR4rsqtVjkeQJkzkCqB1NimaORo0z/qGbb67Y1V6GWoNqeS2O7H1ZLcGjTZqxT3Ua2
         oBByrCguOIKlrhX5rtcU2KVbGmzd8nCq7VXBC+yyofjbxmoELpYiaUFk62etXSziZvf7
         ZTH99qIYez9hDPPnVRYmZiQjlTwJf+5PaGYtJodGUYNj6lcFS0BRlMBzliZsWcUZKQ0D
         zkasTG6p9ppil3Ax8RDjeCJWr/1Y2BanRwBo2VFVksaJvZpec1uLB3nOgG/BDVvLd4Kp
         mjPKEJYvw71HzS711KMoP3bhLIfKtSKItf58FZRvUVTVtvCXWJ0o+snoX8hzy8EBFbJB
         MtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788062341; x=1788667141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQ8dbbiBgPJ6FDZbDcbGb0ykdxb6d7xQ7LY+xp+A1UQ=;
        b=pcZp00Mq0ft7Gpo9g9S+8/PAh7Kt7AKcC+E9iuYwFB3y1oggc0wf/QnBDB7nMzw3GS
         J3nWkRxSmvuIH017HuBlXHINE7oLx4/SVSfFJcFPawDU82n+vYOic3iGDdsym4ZhgD1P
         y0apM4AStqg8Jgfqny8M2zkEkrattGBM4zexxPWXOnnQ3xAl3DqA2QQLvxDonUJCQ2bm
         k8dcDTrsC4mWfGscDIPhmkwV2jV6nLrUX1aa7Ak7wRAwBnbTSbYdwXp1MtIBTrMgWf4n
         7lW+CvnSd3Wm/oFOuuDc0JXpgZgh9UKSaMx+TlnP8bh2Y1QKkW8sSMANIjwcOOnpRnzJ
         wKOg==
X-Forwarded-Encrypted: i=1; AHgh+RqltesjCaYv03atQR+QIScOt0qfAsJOPDAZ+FDqV9H7MMyNUpvtFbwo1J7ArdMzsZY5v5TMrgOtI0zPmF4=@vger.kernel.org
X-Gm-Message-State: AFuF++nhxcZtxZGNDM/8BJRidjybpFIkxuiivkSZbg1h0tfnKMLoNMJB
	2pkq9z0BFQUduFMWuE5gshR42+rZPINLACu4kybfHpG6ek4lhlBULQcN
X-Gm-Gg: AYBFou0VYjkToIARA6v7zeYQa9O9NaHMNxZiIWGSeWJsRJg1Iv7IRVUg8RprvigZLHZ
	k8fFm+p4aPhyCyS6Y6vDlaspFuI2J456VhA/MCl+eifMrzHc1Tf1NQxkZ4i/a9Na+N6V7RhI3ao
	yUIDOx3yLEBJQ3qKTCmInAQoNoiSXR/UKYPQ9S7JYvCEXJBgNdOiZpwctW+GgAiV7eKJByjKBUw
	saaWTkEhr7ZYkYDHazUCcTrPJGifb/DlI3UsdmX4CMVjwKCu9IDhgNYULHZ6ffDkPLmrQzXwgYh
	NcoQZW9SNIQp420tRvVoSAy8dLnROfjQYz5wYZTldFkkf3hDQW6Cg+RsmOs+O3LxAFqJui1KD+E
	I75qpUilpnlr2K3Q3x0R76fReqYWW/sxKH73B0WRG1jB2YWp7vll44jkgrZ4dgtVHCRS+b5/CKE
	fOjG+Dna6AXku8cveD4KMtL1vw3kem5D5hJO+k9ZanKnubIQ2OQBZCw5Rm1BGU
X-Received: by 2002:a17:902:f78b:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d74dc78debmr295950455ad.4.1788062340334;
        Sat, 29 Aug 2026 20:59:00 -0700 (PDT)
Received: from gmail.com ([185.220.238.38])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988d184sm18386975ad.62.2026.08.29.20.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 20:58:59 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: Kunwu Chan <kunwu.chan@linux.dev>,
	akpm@linux-foundation.org,
	lianux.mm@gmail.com,
	axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	stevensd@chromium.org,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: Re: [PATCH v2 2/7] mm/mglru: batch update lrugen->nr_pages in inc_min_seq()
Date: Sun, 30 Aug 2026 11:58:38 +0800
Message-ID: <20260830035843.712320-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827234704.63163-3-baohua@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 28 Aug 2026 07:46:59 +0800 "Barry Song (Xiaomi)" <baohua@kernel.org> wrote:

> Currently, folio_inc_gen() updates lrugen->nr_pages for every folio
> as it advances generations. Instead, accumulate the size changes
> and update lrugen->nr_pages in a batch after scanning the entire
> oldest generation, or when the scan stops because remaining reaches
> zero.
> 
> Since we only move folios from the oldest generation to the second
> oldest generation, the active/inactive state cannot change. We can
> therefore skip __lru_update_size().
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  mm/vmscan.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 8f187d296b8e..07c22d51debd 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3918,6 +3918,7 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
>  	struct lru_gen_folio *lrugen = &lruvec->lrugen;
>  	int hist = lru_hist_from_seq(lrugen->min_seq[type]);
>  	int new_gen, old_gen = lru_gen_from_seq(lrugen->min_seq[type]);
> +	int target_gen = (old_gen + 1) % MAX_NR_GENS;
>  
>  	/* For file type, skip the check if swappiness is anon only */
>  	if (type && (swappiness == SWAPPINESS_ANON_ONLY))
> @@ -3927,35 +3928,47 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
>  	if (!type && !swappiness)
>  		goto done;
>  
> +	VM_WARN_ON_ONCE(get_nr_gens(lruvec, type) != MAX_NR_GENS);
> +	VM_WARN_ON_ONCE(lru_gen_is_active(lruvec, old_gen) !=
> +			lru_gen_is_active(lruvec, target_gen));
>  	/* prevent cold/hot inversion if the type is evictable */
>  	for (zone = 0; zone < MAX_NR_ZONES; zone++) {
>  		struct list_head *head = &lrugen->folios[old_gen][type][zone];
> +		long delta = 0;
>  
>  		while (!list_empty(head)) {
>  			struct folio *folio = lru_to_folio(head);
> +			long nr_pages = folio_nr_pages(folio);
>  			int refs = folio_lru_refs(folio);
>  			bool workingset = folio_test_workingset(folio);
> +			bool gen_increased;
>  
>  			VM_WARN_ON_ONCE_FOLIO(folio_test_unevictable(folio), folio);
>  			VM_WARN_ON_ONCE_FOLIO(folio_test_active(folio), folio);
>  			VM_WARN_ON_ONCE_FOLIO(folio_is_file_lru(folio) != type, folio);
>  			VM_WARN_ON_ONCE_FOLIO(folio_zonenum(folio) != zone, folio);
>  
> -			new_gen = folio_inc_gen(lruvec, folio);
> +			new_gen = __folio_inc_gen(folio, old_gen, &gen_increased);
>  			list_move_tail(&folio->lru, &lrugen->folios[new_gen][type][zone]);
> -
> +			if (gen_increased)
> +				delta += nr_pages;
>  			/* don't count the workingset being lazily promoted */
>  			if (refs + workingset != BIT(LRU_REFS_WIDTH) + 1) {
>  				int tier = lru_tier_from_refs(refs, workingset);
> -				int delta = folio_nr_pages(folio);
>  
>  				WRITE_ONCE(lrugen->protected[hist][type][tier],
> -					   lrugen->protected[hist][type][tier] + delta);
> +					   lrugen->protected[hist][type][tier] + nr_pages);
>  			}
>  
>  			if (!--remaining)
> -				return false;
> +				break;
>  		}
> +		WRITE_ONCE(lrugen->nr_pages[old_gen][type][zone],
> +			   lrugen->nr_pages[old_gen][type][zone] - delta);
> +		WRITE_ONCE(lrugen->nr_pages[target_gen][type][zone],
> +			   lrugen->nr_pages[target_gen][type][zone] + delta);

Hi Barry,

One subtle point about the `remaining` handling:
when `remaining` reaches zero, we now `break` rather than return
so that the accumulated `delta` is applied before returning.

As I understand it, this is required because `__folio_inc_gen()`
has already changed the generation of the scanned folios,
while `lrugen->nr_pages[]` is now updated only in batch.

So the invariant is that every successful generation increment must
have its corresponding `delta` flushed before `inc_min_seq()` returns.

Is this the intended accounting invariant?

Thanks,
KunWu

> +		if (!remaining)
> +			return false;
>  	}
>  done:
>  	reset_ctrl_pos(lruvec, type, true);
> -- 
> 2.34.1
> 
> 

