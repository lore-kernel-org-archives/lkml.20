Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E86841A551
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855872; cv=none; b=iE1oEsx+Mw2IuxEpsvuJdppw6QziABIxn5aOfO9ecENWSDZsoFEKY8mK9EUSwSKfBaMwJu9l028CPqhEImI+g3sTVkc8E7AM9ZKozFaX7gclgaio+pVIt8Zm5gueQ6G7vAyGVpp/mAwc0xG22g9WaGFqnH6IW6Rc043rAeLolz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855872; c=relaxed/simple;
	bh=cs6YmFEVJahAJBGBREGBxfIH2Ax+NsbUVRI942VY/do=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Twsg8gvtrweRlMiv4PKEvqBZirQEdJm8/kwFopXfzTZPFOi73QtayspVFXQuTUE9ZESn/i/0lbS1AmQclXFxaOSt7E3SFGNpbCAZ8+PJ4Mk88eOphoXXZTQ5mwcvb7yYrDs5wEqEOkUDW4EFBAQvGJXFMVg7nhrXxs9lsCxJr0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dv7iKqUT; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dv7iKqUT"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso36392115ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788855870; x=1789460670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oK4yZ0KXSZYf7SN3RbE80ZIj6P3fE7TSyC7nlXOk0JQ=;
        b=dv7iKqUT/OM8T1HzB4QDV/3OuLPVZ8CuPTc1cNw4qP4HoBSoYyhlPAKxnq4k/qqKmx
         mRj1U22VTRPnh6eKPLHhlJ3etcWl0UHyE+I/t1PW9J+xo2/PzR5wBRWXDdffgHVPhEqZ
         akZ45CmAXcGQhwowSTEtRWP9Gr5GqlPiChDAJ7A8QmeyMVBGoQdC+LTMIzaLtWJwMGKK
         DGHfebP+pOyPy6Lfe1831YvMCvTHwZH3d9w/uvJFA/2fg12IqZNYVangGP30VgzR0xR4
         ABv3bG4SSxd5oKbq+rEQYkLRh74iLbYBCo+PyEfH4LJ/MEtr/l/13u/s80Hy1OF4XpzL
         R9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788855870; x=1789460670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oK4yZ0KXSZYf7SN3RbE80ZIj6P3fE7TSyC7nlXOk0JQ=;
        b=ouxl/uzO6fVdwWDSziTKaB/ogORzZDENWKp99Ge47Qsa0F6fy8/WSDd8rI6+QUDFGZ
         wz4nUSqSuFK8YpssFIXqLJ0iw6t8xK+s7J/koC9dp0pGw6Yr1LizY4zNjkzlMwHQwyUm
         yr6D6GL8TqQPHONcUo/SXSZrRmB90npVgFHU+H1lBljpdPFjEmZyuRd63DCOCSgWDQXH
         kzvOfourjYDhAlE/2y7SOWJ92Ciq8yhqFcDWfasA/wlS3yXSquqKA1kcW0iVKIG1pmAu
         2zsJ8g/fUfI6zvdAqda+Fq/5dAwoF80OZXb0RrI9mzo5e4yVicVGtHvHkhTayUSmcWJk
         BfBA==
X-Forwarded-Encrypted: i=1; AKwUvBzVR6V9JHa4Fsh8CHwrtAHPzv3Vphh9XkqEMFw2sgR7jkMy/m9yvB1OHmJre+BlLA2XD+P/6xVEtg9lMF8=@vger.kernel.org
X-Gm-Message-State: AFuF++l8reCjTsJoaxzC6OJSU7OVBJXQcy2RjJKyoUZnFTlv4Hd13cs0
	otB7btjzp9iq3v1PMBr0aesVqj7LXRh/jsc8gvDalJZw4dPzrV9v0Cpj
X-Gm-Gg: AYBFou3L0645UycIQrncZvuoxvwjvQ/x31tVlRMkwXGa/IFIKnEopMaOkPyC3XXmr+t
	c5UXoVQmxAIZ+GCUDatzdrbYF7OS3P0GSI93Byn8fhnSazdiXU6XHL9qRFWmswCpCgmXK/9Fo5t
	O7UIvpipZoT5qg6oSK/scriQvE2Tz23KVhSr8qkGugVehQbPwKaqE1awWvPsBE7eGsZLfkiqnuc
	ptWPXplXkyzaGPu82QxPs37g01PCq05i6VzLn9hi864NgcIFjqbIMg7d6ilQAnsSWH+fWS7KBBk
	mNmu+QE6+KUMou19Ir6ucLV+1jCaPTzGAryLuo5QvcXvWom98fY8MfSt3rsq7JdU+GRVPdWYil8
	Ya2KLYYE2kMiOSfHKLieRZui30iYWEiEG9OJq6U8AMlHZTt4qq9RDhSrUdU2gn5HUnHtIK+vlDJ
	c3fPwCE/ddAq3aGKQSVK/17XvxNNUi021POYrOGTr8qmtVuPqAA0bnfCu6jRQ=
X-Received: by 2002:a17:902:d586:b0:2cf:b68a:340 with SMTP id d9443c01a7336-2db125f0cf2mr410415385ad.10.1788855869776;
        Tue, 08 Sep 2026 01:24:29 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495acf7sm55472585ad.25.2026.09.08.01.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:24:29 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Kunwu Chan <kunwu.chan@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kairui Song <ryncsn@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Wei Xu <weixugc@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] mm: zswap: drop cold writeback folios via swap dropbehind
Date: Tue,  8 Sep 2026 16:24:15 +0800
Message-ID: <20260908082416.2356617-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825135209.3135169-4-alex@ghiti.fr>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 25 Aug 2026 15:52:07 +0200 Alexandre Ghiti <alex@ghiti.fr> wrote:

> zswap writeback decompresses an entry into a fresh swap cache folio and
> writes it back. The folio is cold by construction, yet it is left on the
> LRU for reclaim to find and free later, wasting a reclaim scan and keeping
> cold memory resident longer than necessary.
> 
> Allocate the folio off the LRU and mark it PG_dropbehind so the swap
> dropbehind path frees it from the swap cache once writeback completes.
> 
> Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
> Suggested-by: Nhat Pham <nphamcs@gmail.com>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  mm/zswap.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/zswap.c b/mm/zswap.c
> index 8163e6c5f76c..d16822a516e8 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -1013,7 +1013,6 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
>  	 */
>  	if (IS_ERR(folio))
>  		return PTR_ERR(folio);
> -	folio_add_lru(folio);
>  
>  	/*
>  	 * folio is locked, and the swapcache is now secured against
> @@ -1046,12 +1045,26 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
>  	/* folio is up to date */
>  	folio_mark_uptodate(folio);
>  
> -	/* move it to the tail of the inactive list after end_writeback */
> -	folio_set_reclaim(folio);
> +	folio_set_dropbehind(folio);
> +
> +	/*
> +	 * Drop our reference before starting writeback so the swap cache holds
> +	 * the only one: the drop in folio_end_writeback() needs that for
> +	 * remove_mapping_reclaim() to succeed, otherwise the folio is handed
> +	 * back to reclaim instead.
> +	 *
> +	 * Nothing can free the folio in the meantime: we hold the folio lock
> +	 * until writeback starts, PG_writeback then blocks swap cache removal,
> +	 * and folio_end_writeback() takes its own reference before clearing
> +	 * PG_writeback and donates it to the drop.
> +	 */
> +	folio_put(folio);
>  
>  	/* start writeback */
>  	__swap_writepage(folio, NULL);

Thanks for addressing this.

I checked the refcount handoff in v4. Dropping the zswap reference before 
__swap_writepage() removes the refcount overlap I was concerned about in v3. 
The swapcache reference keeps the folio alive until writeback starts, and 
folio_end_writeback() takes the completion reference before clearing 
PG_writeback, so remove_mapping_reclaim() sees the expected refcount.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks, 
KunWu

>  
> +	return 0;
> +
>  out:
>  	if (ret) {
>  		swap_cache_del_folio(folio);
> -- 
> 2.53.0-Meta
> 
> 

