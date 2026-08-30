Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639D9382295
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788075907; cv=none; b=LWHV5JpA/d531ewAP+8kdCQltN6fjyvsjP0NUG4Dm6RDrvr2aYLYHGySx5za04Pmptr5UelpjHBfEA6sGCXRVoLM9V/7Kp1E/T1TJHheek4aseMaQIsZl4uh08u8RgytLQ3skX5TfnlaZmH0YE4DoHXgEE4CgTQWEZr8J71LHBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788075907; c=relaxed/simple;
	bh=/VGQ63AfaY3zFHxTCv9OLtPTRCZGUd//RETv1E2mm0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QQYe+dQVco8qG1xX+VbNVu8huo9O1mC4Z0lFs90tNilq7JSoOw+TOm1vQVrJRV+DQkbVoj4EGDOdQ6lJVh9TuvLg3ASmmvS+Im5pPEmeoehk9ZRpI4xCAvdrt6t75k5W9SyrB32VeUuHCSntQ3S/CntrwOs3Nz3FnLj76QomfSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KY+y4RX/; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KY+y4RX/"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-39675172593so2025639a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 00:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788075906; x=1788680706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dnQmRfOj9jURwrL7DeKDSG0H8W6p70+xYqiH8s21HTY=;
        b=KY+y4RX/PwE95Y82Lu9LtYfXdH95+7p+iTJ39wlJxXhjLwzuOApfg7uv4j87M+W/9G
         hRlOqnyX6B+b5tIPfWwi7g2dqb+fm+zncjAkIJ5VpHQMzkOXugJFxUHhs0WXL24VyUHt
         rebbrLmeO2H7HKuyyK3CL/BiuCESnuZFGRJoqudE7394iZguPFfTduQMSV8kOJLoX3w1
         Yn4fbBR8VmoIqvF7JkskGeHtjykVeDKFMKhdsm1HSGC5fIJdQiRlIZY5M9cquY5LpUDE
         poEhO/Wno0awF3lrQAYtNZWObAM6DbVqJBwMjp1pQAnQzqw3cE2LAL/rTmkz7lULHFIN
         S3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788075906; x=1788680706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dnQmRfOj9jURwrL7DeKDSG0H8W6p70+xYqiH8s21HTY=;
        b=UDMQ5t4gkVbbgVrM6MkZuwky9BfW05xIRe7OWpD7+m8g8cYoKVHi/G5ImXPydA+/Xz
         niz2gTSdd6qK+ZPNtmTtCEKoVchMJvUs8QCsU3Fa+V7DhEqdS52H7MAZ/uCcxYigXang
         jBoMiz3Vgc/bSf1zkTziVFUxfcm9jMETu7altia2+yWprBJ9Vq+I/XNyAQ81c45zNvQR
         1WqUW8C+AWptbkYqPYaOEEVmlNKNFcuY6sDym21sC5cz3P9ehJx79DMl+GN2xmEzbvoI
         sfTkG+SF4YT+jR7xiAZ0jOEL/IJgrZCmfGgnx5P8ek2RoHufufhJW7WfhVreew3tIdBE
         FNTw==
X-Forwarded-Encrypted: i=1; AKwUvBzHmTC+9enBqTpKK2ILdpjJ8/9f5zjD28jDTdB7lDbDSUc/C8bjKTtrhwFsWzURwr2Ee5jTVObwiuIf4So=@vger.kernel.org
X-Gm-Message-State: AFuF++m3+PnVWNepG9xaN/2ptCTb8PZdzFgLvJU+BFlYGZR/UuZJ6w9Z
	XuLvJXcufHa8lnNhUT02lu3mnNscyh3vYnS4vsVR27UmHqywZrYNkmWG
X-Gm-Gg: AYBFou3qNDUDxShTdSTw81CGxOehhiVTsKkgvYm+dx3/nUlSOKeK6UK61UfOgkgNMvZ
	UtufwXBaxSs5penAHdIoccFkOjhiEd14wNtHRCpjFZ3eSPEP+pdzjxTdhZd3QAL/KcHElIpurms
	EobuTcFW/CFOsvssE1Hz391Mb4pg6RZ5ENl/96vFHBpoOl1dJn1QalTtoEAtOfk0CKAAZiyhHaF
	H7nNypIZcmUKAFKlTBQRSQUkB6OgDVPU/duv8ZX7+2nVHjBT0QZqDMFXUZNHNL8bm+w/ciIUo3P
	NVcxLFrgwmjKCVf9+vSzpKOqLpQrS03px8H2DfYoOvq1CjpxcoM3iAkKEa0AuzgVKeufvdgKhUR
	eyQ6HmJ5ZmkciaAo+DNTfcSwQiXNN5zd4CaY+AlJSJNnweQrY7DYlgI6vfPxaPpt7y23HjrTcgJ
	h5o1XwZl6L0xsk+/xj8tQJmqHuhqq7E3+0EolJ/C8bOpvz//7phZ19vz9yj46yW0Acd8hQyH2IS
	A25HiTNhd/2MW/xEbMbyqBqG9z4
X-Received: by 2002:a17:90b:1d05:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-396d0ff519cmr30220142a91.14.1788075905659;
        Sun, 30 Aug 2026 00:45:05 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b186809dsm15145238a91.10.2026.08.30.00.44.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 00:45:05 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org,
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
Subject: Re: [PATCH v2 6/7] mm/mglru: move folios from oldest gen to second-oldest gen from head to tail
Date: Sun, 30 Aug 2026 15:44:38 +0800
Message-ID: <20260830074446.79916-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827234704.63163-7-baohua@kernel.org>
References: <20260827234704.63163-1-baohua@kernel.org> <20260827234704.63163-7-baohua@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 28 Aug 2026 07:47:03 +0800 "Barry Song (Xiaomi)" <baohua@kernel.org> wrote:

> For reclamation, it makes sense to reclaim folios from tail to
> head, as folios near the head are relatively hot. However, when
> moving folios from the oldest generation to the second-oldest
> generation, using the tail-to-head order would effectively cause
> a cold/hot inversion.
>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Reviewed-by: Baoquan He <baoquan.he@linux.dev>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  mm/vmscan.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 81f95a968447..17524e96fe64 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -192,11 +192,27 @@ static inline void prefetchw_prev_lru_folio(struct folio *folio,
>  		prefetchw(&prev->flags);
>  	}
>  }
> +
> +static inline void prefetchw_next_lru_folio(struct folio *folio,
> +		struct list_head *base)
> +{
> +	if (folio->lru.next != base) {
> +		struct folio *next;
> +
> +		next = list_entry(folio->lru.next, struct folio, lru);
> +		prefetchw(&next->flags);
> +	}
> +}
>  #else
>  static inline void prefetchw_prev_lru_folio(struct folio *folio,
>  		struct list_head *base)
>  {
>  }
> +
> +static inline void prefetchw_next_lru_folio(struct folio *folio,
> +		struct list_head *base)
> +{
> +}
>  #endif
>
>  /*
> @@ -3938,10 +3954,11 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
>  	/* prevent cold/hot inversion if the type is evictable */
>  	for (zone = 0; zone < MAX_NR_ZONES; zone++) {
>  		struct list_head *head = &lrugen->folios[old_gen][type][zone];
> +		struct list_head *pos = head->next;
>  		long delta = 0;
>
> -		while (!list_empty(head)) {
> -			struct folio *folio = lru_to_folio(head);
> +		while (pos != head) {
> +			struct folio *folio = list_entry(pos, struct folio, lru);
>  			long nr_pages = folio_nr_pages(folio);
>  			int refs = folio_lru_refs(folio);
>  			bool workingset = folio_test_workingset(folio);
> @@ -3952,6 +3969,8 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
>  			VM_WARN_ON_ONCE_FOLIO(folio_is_file_lru(folio) != type, folio);
>  			VM_WARN_ON_ONCE_FOLIO(folio_zonenum(folio) != zone, folio);
>
> +			prefetchw_next_lru_folio(folio, head);
> +			pos = pos->next;

Saving `pos->next` before moving the current folio keeps the forward iterator
valid. Across partial-batch restarts, processing from head to tail and appending
to the target tail preserves the relative hot-to-cold order of these folios.

>  			new_gen = __folio_inc_gen(folio, old_gen, &gen_increased);
>  			if (gen_increased) {
>  				delta += nr_pages;
> --
> 2.34.1

Looks good to me.

Reviewed-by: Lian Wang <lianux.mm@gmail.com>
