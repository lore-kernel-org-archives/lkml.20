Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79143AA9D4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788987508; cv=pass; b=uf1V+rpAdxq0B1VZmP/70plw4rkueNtPyaHOXXr36kZVjszUhno/rvVyQjs36GUWhWkEIAtHSEuguCCGKwpqFr3QbxcdgdigZzMQPXeLqKqZHZ40XqkHHT0NijYQDuUgOOR5p5jeEFeIi8mab/qWtk4FvD5DEV9yxxC214HZ2Go=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788987508; c=relaxed/simple;
	bh=GNBnlEEqI8nyGt1DXIN/Q2A1UEs04PydxXQJhFl47ns=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xnn1Q3e12H7S46meLJcueknhymFVsr62fv5xxK/hyOlQZGl1DqXiRqacJc+QEX7VZMeWBntHr4JT4pXf5qRNj9Y2FMqP8XUk4eTH/SsWvgaSy2iPlSKi5OnX3FcSmRr/ka+EjIwTihAe411cl6wGu7Mytbr9oLD1VXeZzbfg9Ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pXfzXM/7; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pXfzXM/7"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4bfceso511303a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:58:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788987499; cv=none;
        d=google.com; s=arc-20260327;
        b=arKk+DKa0bGnqUPRO08o3Ry5CwiJkuCo/74UFULmbhCg7cOCzZSXsWw+vtVjYeveZg
         XSR2fJjj6crKlTdOVSsS2zesxlBn2Fu7JogZtvR6QCsDS7ZpjA7r9w7dPIZKw4QFyhVD
         sr8Blxc5m8iSRuiLaUkJPz6TM/wY0w7hbZ+aR0scm3fBealuKJVMHOq/t/n96YUe2Egs
         fbarsce7MBu2d0ZGNvapV2Jbv02xWtigGqheUhwJLNbLu3Ap8oKk6tqIbnDoqvahkaLL
         qtCNxihT4cEdPaRtXMLti2elWGWatF+2UP/PJ2FW4QDo72AR4OpRXzVSMrdfDdmmpPy8
         d14Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Fto8QffRRzc1iPbh04C4QLWgSTkv6xI4tqguxS1zB/k=;
        fh=r7dDE97qX+ID6RGep0Favh7EMzJPaqPrQQmxdzfqwFk=;
        b=LL3fhx9F8G0EmIRw/ZErlnkkTMOuZsmhX9P2p5SQSnLQflA3SDhn+/RMKM9cJHVau1
         wl0vakdvIK4OjuY70ngskS1DJrKRzd4B8jy8lwe8hSYr66QsMkHvK5rp8qo21tXrcRx2
         oTxZ0823uPS18aE3hRpihS3gCc3tXI0mk/arUxj0mtDjj77RXby6TMvTTwjRyBAZ+Wpe
         9PmbUDzJxkT2z3kwd3ks6C3fWYZhwksU6fkDW76mL76miQ5yh9Jrdq55NkDaIO81TJDW
         oI5JvAwlM5Osi2Gka/4OSsFdkaaOHuMzOMTdHUq9p2n2tmook9y85we9fYk1W89Q92Wz
         /Ybg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788987499; x=1789592299; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fto8QffRRzc1iPbh04C4QLWgSTkv6xI4tqguxS1zB/k=;
        b=pXfzXM/7pUcdy3qiACdJMAYnalpVUTe9gTGVxItQL3fc0LKvhK4c7DkK6FzA5PT2D7
         e1kGRkFZi2CyAO16TpUDlMKJfDylNlABVmsDDu/1tZckjDPxvs3inC1WEMneYIhosjMT
         DzTqm+VyTiN6WmPzBM0d4yDPHjHgP+QM0MjjUzi255yFF1Q28DfrxPJaLZtv2EngFvgY
         diKVo2fljU8ZYLTVtAqWRO2afECrAEvKCQEVRtAM97M0A8OvIo/Z1mxoG9r/QmuOzjKp
         q7r7axbByxQBYnuonpfYdytNPrCSd30kUiLcH+MDT1MFj0hKOBTEOhCOI9yeMgTQU9Qb
         Vqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788987499; x=1789592299;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fto8QffRRzc1iPbh04C4QLWgSTkv6xI4tqguxS1zB/k=;
        b=Avgdp8mR6FJ0B0uWcFqdyxge1VUynJEVTC/k+hCcu82KVGQQ4j/Z2e0JIOorjSJaQI
         CRf8A+m6UccQJL0yy6FC+ZF8vqWmGGV5TeHtuJWpQAQxgSQpA8PZsmlVsmxLjRXnLTT+
         NjfsLm+SMRJcy7268VStCZhwr3pHlgrdRGJHAaBI1G9d1uWUgyhcFpyNcBDsJ4eYUmSm
         N1ISIxk7vdIzr6Vf4PTY6FMV4UczaOX+43ESJE5Di1oTaYJG4Us5rwxq51ZTrNB2ZHLf
         kCeOdlolR2YRC4QFcWcxTblGasnXX2gOYdVdpZvje+W1SqOUoWSZAkTfsg3/5lv2Gb8a
         +q4g==
X-Forwarded-Encrypted: i=1; AKwUvByanKFcIGpyChryhm0aqlCVxhWe8mwZ16OrrgFx10W1g3huS16v45j6iH8l7rGy6YZjFqbL9q0DN1HNppA=@vger.kernel.org
X-Gm-Message-State: AFuF++l8lvuWVYWZmnqqJNnQXvdiNKotzituJaT7iX/Tlu8oluZP8M8A
	ZLgoYDZ+lcINE6+zrjvfkKZJ1IJidRIJzQ2bNEVpJsK8tpB/uDJFeudgb90BPGN/DXkJnWBOc1x
	PP6YHsaUDSHm182gr3hgkKtEt662uBYgkqun1bOoU
X-Gm-Gg: AYBFou33PmKTwygpmEQy7X0Gjy/81JgvjwxOmICyMSzGRb3IoJi4sMiy6PnUAqTHigv
	hX8FghcAoYpE+QTFah9AupQX99TdObMLDXsQZ5i/A0QSG46so4hCNd6OBqYSRjU5n1eJo670nWS
	3gpXJhbfWv/I+eIKZmGTrTRoN5gapjuZetromBUwd8ONkhZpgCtiQ0PZAUKru52mOVe9qkTPRX2
	y/E1li8+Mhpw+esabNWou3AWVawcGeNVtmQuwwyXfQBggI2Rn/wEX7qpkbStS+6BJwjKMrVCw8z
	vSVTLgWwF7/F3Ojddie0bWp5uKkgs+X9S7cOECBxOVCtDCpOuZkDUja0i/H5ZaR+OPqqRzr+eW2
	5f3rltI38Dk226IiLtLzbLozq53+UQHGZhqj0O+pzhA==
X-Received: by 2002:a17:90a:d406:b0:395:4de5:1054 with SMTP id
 98e67ed59e1d1-39d70b4e3bfmr4942649a91.16.1788987498156; Wed, 09 Sep 2026
 13:58:18 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 13:58:15 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 13:58:15 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260902-hugetlb-subpool-always-track-used-v1-3-de1cd14bd713@google.com>
References: <20260902-hugetlb-subpool-always-track-used-v1-0-de1cd14bd713@google.com>
 <20260902-hugetlb-subpool-always-track-used-v1-3-de1cd14bd713@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 9 Sep 2026 13:58:15 -0700
X-Gm-Features: AcwNN1VHOD9F3bWg7PfgqL3VQ7dHsVNaxKBOIXno-ubvbNrtHXi_elzy4mYJuNA
Message-ID: <CAEvNRgGRxRvAj_KC+RJ=7Xuddz+FRDP5pn7ZgVaZq5y9WAB9tw@mail.gmail.com>
Subject: Re: [PATCH 3/3] mm: hugetlb: Fix subpool usage leak on allocation failure
To: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, Alex Shi <alexs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Hongxiang Lou <louhongxiang@huawei.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, Nhat Pham <nphamcs@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Wupeng Ma <mawupeng1@huawei.com>, 
	Yanteng Si <si.yanteng@linux.dev>, fvdl@google.com, jthoughton@google.com, 
	rientjes@google.com, vannapurve@google.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
writes:

>
> [...snip...]
>
> @@ -3072,13 +3072,10 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
>  	return folio;
>
>  out_subpool_put:
> -	/*
> -	 * put page to subpool iff the quota of subpool's rsv_hpages is used
> -	 * during hugepage_subpool_get_pages.
> -	 */
> -	if (map_chg && !gbl_chg) {
> -		gbl_reserve = hugepage_subpool_put_pages(spool, 1);
> -		hugetlb_acct_memory(h, -gbl_reserve);
> +	if (map_chg) {
> +		long gbl_resv_put = hugepage_subpool_put_pages(spool, 1);


Sashiko:

Does this violate the subpool rollback protocol in alloc_hugetlb_folio()?

The error path appears to unconditionally pass the full requested amount (1)
to hugepage_subpool_put_pages() instead of the absorbed amount. According
to the subsystem guidelines, error paths should return the difference
between the change and the global reserve to hugepage_subpool_put_pages(),
not the full requested amount.

Ackerley:

Nope, the subpool rollback protocol has changed since the first patch in
this series, where now the subpool always tracks used_hpages. After that
change, pages taken from the subpool should always be returned to the
subpool. The return value from hugepage_subpool_put_pages() can then be
used in hugetlb_acct_memory() to fix up global accounting, like in the
line below.

> +
> +		hugetlb_acct_memory(h, gbl_resv_get - gbl_resv_put);

Sashiko:

Can this result in silent state corruption and accounting desynchronization?

If alloc_hugetlb_folio() fails (e.g., due to memory pressure) after getting
1 page from the global pool (gbl_resv_get = 1), and concurrently another
thread frees a page to the same subpool dropping used_hpages below
min_hpages, hugepage_subpool_put_pages(spool, 1) will absorb the page into
rsv_hpages and return 0 (gbl_resv_put = 0).

This causes hugetlb_acct_memory(h, 1) to be called, which attempts to
gather a surplus page from the global pool. Since the system is under
memory pressure, this can fail and return -ENOMEM.

Because the return value of hugetlb_acct_memory() is ignored,
spool->rsv_hpages remains incremented without a corresponding credit to
the global pool, which can lead to an integer underflow in resv_huge_pages
and permanent memory management desynchronization.

Ackerley:

Sashiko made the same comment on patch 2 as well. This is a common
pattern on cleanup paths, where the return value is ignored.

I think the fix here would be as described in [1], to flip the
reservation tracking to track an available page count directly, but
that's for another patch series :)

[1] https://lore.kernel.org/all/CAEvNRgGN0HSJ2iLSDD2haSKOxifa-uhkO9Hwossh0+Q_d9fzOw@mail.gmail.com/

>  	}
>
>  out_end_reservation:
>
> --
> 2.55.0.970.g62bdec98f9-goog
