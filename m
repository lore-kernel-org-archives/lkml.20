Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792679137;
	b=dqg2cIfkPpLtOgPH6laMUGpEDo3L6s4CzF7JXhwP3LGOtzXh/sCa6h4NjuKdOaPQ53Ob
	 Ztai4iNhf24KjWoNS+7WMWaJF8LcaglQLFXIYS9Vi0wxbZ4nd4g1UU4b2VuIuXyERCgjm
	 DO/BsIpADApL16C4QGOxZVFC5YJt8RXpBVxso2fgx6Y9hcxKp7tmUFN3/fKD6Z1c3dYBs
	 rV3EFsihB5v1k3ODZTJJw31iSX2YA+yOZ3bUbXvHXMQ0afR9YsNsGV/DlXa87/v+JwSAx
	 2IDFp6TmRZoM2szLbSCwzQAt81S3vSGnydRi7XcR4taWUg7WubBkEt36B+diHmjNp3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BLPsOYsY2Fo/8WqeAuLv7fNXJKo5hs+vI/mKlVqvfTU=;
	b=4Cs+WM+j3W/V7tsHSW1ZazdBQuBo2IQRR73Cwc4U/joGdFtuLkGeBTwfckr+wGga/zgU
	 VcGm2IByIP4n2ZO0X0KrJ0CcQ9/BLPQXUNxN2WHT1N9aYYxauX5I7Zkm8+Utlve7Htm2d
	 8yKAEb1Q1++vym0+QkoBEuERGobL/NtZSuO3U1mtN3z6HsRaBuuS1J9DGx7qalPNYc4Ho
	 D9SrKMKfiIxAlYpiKcYBsinOtyGoHcJuwYTQAQZiYp55KtTZ+qpwlBieKPUKD2Qukf8KU
	 lnFAECZaBXQm+khgweOKK96zUcTy1MT9FXKkpIuzenWHnPuCixjZ32htrHZ0yUE1aaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=SPWWbVcR;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7C6606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A7C6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=SPWWbVcR
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e011d370dso1544166f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1792679135; x=1793283935; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BLPsOYsY2Fo/8WqeAuLv7fNXJKo5hs+vI/mKlVqvfTU=;
        b=SPWWbVcRQLngZWZL63qID8ZXfFtujJcvktWGaoltXi4IZCBJBJyqnnndxfBbazhz5B
         ZTu48UzMOeXgFHgvtXhdpknu3h2nKHQYoZdG0/yi+QSREvPHR1+Q2mhTx4NMtuWkgJKv
         q0K65lqb+rWmTDH9ldd5Q5nILFM52bRe+tIyhW7dlpE/ZJE76/zevbHVl/ODYHNNimMq
         wOGY0Uy+c24X0xwrNkv0WWzOennSQD8wuZ41YyrLkcTS4AT+6uw47btEQ8DVz9bCRb9h
         zgO6Dsk/5juXX11IbNXdj2ru2rYt5rE4NshCySqeBV6sLgYXO1buL5nhZyP0sd0IsVbp
         f+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792679135; x=1793283935;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BLPsOYsY2Fo/8WqeAuLv7fNXJKo5hs+vI/mKlVqvfTU=;
        b=Nqf12aVuuP4Tx2p0zo6BUdWgVwKfPXNaU7DV4jsoSE2HIGitWCMpfY2oV1xEs+gaqy
         8FzAEIKmDkfPMMn+yVmn16KO7Y4g8Kik4Nkaw1ugqNvx1bZuPA7XwpIBVS5Au00P7y36
         iEXGo/pL3KT2tWmmpLNppLqovXccGuVjEdzDKeevFpoU6255cDJMWu62/0ZUI3iR7aQZ
         5H7bJeN+FrKKquD8O/vZE6pRAKhaoSHSZscCnzhZ1UErYBQdpT5bY3sJOuzEu018yANJ
         VLGRGG/WeVRSvVfr5Xo50xoKAsYkEasCa15FRCYl/wn/iGiLm4Pd1Y3R4ZO5Wi7kBfON
         UgFg==
X-Forwarded-Encrypted: i=1; AKwUvBwVd3iB+Z2TvVg1tLJJozrmHK3fQKMbU11kZwkoE+JWQ5KtNYHhyLQ2NwdizhRULWL9YjUqBfY1H9OyEtI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPO1x9XqX5UfeybGMvX75DmLwG+0nfxBTAq4QqKDdlMTbR9nXg
	2bBNAJMDJyyjM1JAB2PFK4RadEQbwDvHGrYGw83I9YXi39LOBHzYkQWU5gNW/Hkgofk=
X-Gm-Gg: AYBFou1vaQX981viHQnvt1wxs4MylhIa4Jrr86DHpFwTmSXyi95gEt3/F/vQblP/85L
	5Nyhsitlr3Z5NoJ45xBAytMuF0j3TyIzLMSeHId2baUAzimsgha4BlJUyL7rrT8fbpXS7UaQxks
	savL8bmfXIz6oCSsKCap2ARyipK2Yp34CXgMbAQs23PWbCzWvkucsxBhIlF+Fb0ORNyD55Y11kB
	ZdDYh13jN2xACs2e6/EwRgihgEV+AeMT/by8pQ1jWE05wlONa7N8SvKBvG9K6D/pNs5YTKJPS1C
	PG5MK0tIYZQ7EvVapU3Ab1shHtYcDKHjXnSSRa8bUzAwGQj1OFIDXnfTSIFAH6LCoXYjpLj8vCf
	9h1qb1mLRMeblqKvTzoh/1Ab+MVipgkBXXZZBi2dgpK8uPk9ZYRRkSY8nWMf+H/62CMgURFd8Dz
	CoYsJs0kKHmfLJA7MsSNJs5RWHX6vLXaSX9agN5BtDrglchCvIHdAVX5W01D+I2jxxIMmFaZzuU
	WhDmWoE2R7Q37l0lH9oOLdgUFGIobqjzaWjDWdGp7yxt8oxWw69RNPJkZ+Zqy3W
X-Received: by 2002:a05:6000:260a:b0:486:e707:42eb with SMTP id ffacd0b85a97d-48e26495969mr10185612f8f.33.1792679134760;
        Thu, 22 Oct 2026 07:25:34 -0700 (PDT)
Received: from localhost ([2a09:bac6:37a8:294b::41d:9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258213cesm12905886f8f.11.2026.10.22.07.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:25:33 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:25:31 +0100
From: Matt Fleming <mfleming@cloudflare.com>
To: Marco Elver <elver@google.com>
Cc: Caleb Kan <calebkan1106@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Vlastimil Babka <vbabka@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
	Caleb Kan <ckan@cloudflare.com>, kernel-team@cloudflare.com
Subject: Re: [PATCH RFC v2 03/11] mm/page_owner: preserve accounting with
 countable stack depot records
Message-ID: <atoIzppNHvUGlv36@matt-Precision-5490>
References: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
 <20260908-stackdepot-trie-v2-3-1996d5cef732@cloudflare.com>
 <atdMXELJWveehYmX@elver.google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atdMXELJWveehYmX@elver.google.com>

On Tue, Oct 20, 2026 at 11:11:24AM +0000, 'Marco Elver' via kernel-team wrote:
> On Tue, Sep 08, 2026 at 02:13PM +0100, Caleb Kan wrote:
> >
> > @@ -609,6 +611,9 @@ static inline struct stack_record *find_stack(struct list_head *bucket,
> >  	list_for_each_entry_rcu(stack, bucket, hash_list) {
> >  		if (stack->hash != hash || stack->size != size)
> >  			continue;
> > +		/* Page owner countable records have a distinct count lifetime. */
> > +		if ((stack->flags ^ flags) & STACK_DEPOT_FLAG_COUNTABLE)
> > +			continue;
> 
> This splits hash deduplication unconditionally even when
> stackdepot.trie_enabled=0 (the default), and even for page_owner's
> free_handle traces (__reset_page_owner()), which never touch
> stack_record->count. Prior to this patch, persistent hash records had
> refcount_set(&stack->count, REFCOUNT_SATURATED) and page_owner safely
> overwrote it with its 1-biased page count while still sharing records
> with non-GET callers.
> 
> The interface looks error-prone to me.

OK, fair point. I think the best course is just to make the trie
backend work with the ->count mechanism too so this whole problem goes
away.

Thanks,
Matt
