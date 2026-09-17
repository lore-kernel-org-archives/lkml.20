Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD11A4F5DF9
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789667826; cv=none; b=ji9KMLlOMob5+79cqkK/x3SSSdMaCnCaK+EEdjmzzuz9WGYP3/hGSBi3gyr+SEhs6X0eoFuT9/IUR4YE8ooGn+4J7PhNg5wqCU650IpRhs08WQ6GkusGbNrhzDkKpE0uefbf5rguNn4DDyq/+nIrT4wy2Ebe3IWNwXYcdvTx+Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789667826; c=relaxed/simple;
	bh=puSlUV2kHgNle66pG3NUaKXN4ZatxoIWNs+bOAAg7a4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SaXv2VksH9Kc5LLjCwY5bbh6fOw2apNlx340N3fVRxQCvyIU5C4nr/yMozSLIEh/IYuYSAWYa2j9bJwvFjJuQTKXVGRuVNeAlDb5PI/pbNllrtM5eB9V6s+B/SaMGXkWb6pr/jMHeLCk/qYbE0Us2vHkZEldErw33jQKMk8LZxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZQ34fQw; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZQ34fQw"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b5c61966d0so625578b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789667823; x=1790272623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vbjWNmPKTP4kQU9l/195vv1JQgSjVzz8hVj2Dw5IYw8=;
        b=CZQ34fQwI0k9m4tf7gOpbbBgIeRTuHVr+9hWtW7Qu4g/UMnfygTqTuR3l6FAXScCS/
         BoVdbf5yg4d28j3e5aS9O/2lSiXXYBA+WNsa0vYUIhXREHc1dgLXtluAUAjLPNjV0EJO
         q+/K3SVRZFpG3+FwbgzfRD571Fk00tq1JOI2I26zXgwi74DOnjZZOjDHIVDsZq+cXwQH
         12444B/7CowDXyiYRN0UKoQDjaUa/WIknq9OMlrC3cfkJmDCDIAXQY6Pcp/Hier4q9QC
         u8yhIo5sWBXOaQJzJTnj1ZZGc3+8EdDBl4tgUkdw2jS5GYCytzmJGH8JIQ2XG4lOb0+y
         s76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789667823; x=1790272623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vbjWNmPKTP4kQU9l/195vv1JQgSjVzz8hVj2Dw5IYw8=;
        b=yjm7FMeUGKnqE6Dzd3jG9Lg0TmSwby9i1LBV/SjLHdJW4i2mIff+Q32l5TazfMRwqG
         tWnl67kLuiq6NKriqjaMU95iihIWq1/4AkM9GTyoEGLTh8/B6/i3fsLD98MhUCOJIhGU
         i/hK6f/qqqViMvYFbc3BiKritjXUzsMmtUxcShukQAWoB3pYkIYoX55RWho9SfToZtNd
         GLfX/n6OovxFYg3vl4Vr8qaagF2WE1e9QWLIN8h1fN2wGtGvozZ/goJdxtpxuG5EVKYq
         gwovBKyxt3k1Ue6p5/mGJ0ch3BMPjgEbALiXfUzFyEbI4KRZB/lglXZQV/SWbwsL9Wtv
         TBtw==
X-Forwarded-Encrypted: i=1; AKwUvBwu/UMNOiVz4VRz+9nqyiFHheVzK0cneoUKFjzLU6t8gDe6Bey0St+S7PmXVGbLmt3g0MUY15txYbpvd5U=@vger.kernel.org
X-Gm-Message-State: AFuF++nfN/4MY6QI7+uxtjFKYIbSSUl2h0txODTA5hjWf1IHaADNwFKy
	nSAcXVaxoP4SirLif+7UYBSsPopGVOynlXjVNhU2i13ysww085H8bh8D
X-Gm-Gg: AYBFou0Xc4UKatktu9vBfeGflIRkiVBaauZLUQSr47ADQAELjFji1XvpdFaWk35KeIN
	yyAkqFpCdVCqtt3WhST0uSO8FcClt3/mUJBDhm9NjLy16hevdxtr4X6Y4Jr1vVEoepKoA0G7emL
	f7+FO7oC4cyTBDPQAiU2hMhpSri59T2ILfe9cXvvUkneaTbJGS7F/1peW2kLd03rkwjYh5CetZc
	uGe6jSM2YWLbLVhcsys/iMfpCJivU3kNSCcfHnFoweksFOgLljUgxcB+4FQuYIR2ttAgakPfxdJ
	iMtQSgr27qEVi5BMZDPy/bSQBK/54AO5u1PNSgdvYrTvS7IzGgbeGhz7Rpq/drMSH93ZQzlNGxr
	GpuywMnUvvcUXrzoQ0ofgq5ohpj2hwlTQ3N2z4IFsyVgyKAL5B3OxLCrMDQEbzp4vFPOsJwg1Yt
	6KoItetqxWROM4bO4K30Ot9SDzLjnSi0bk5GB2YEfXO6VYQerAArPg5jURkttbZmXJrkILpQQzp
	f+ArbnCERFy54EMHasaIUfQiFaXLw==
X-Received: by 2002:a05:6808:5190:b0:4b9:e5fa:8906 with SMTP id 5614622812f47-4ca4b643e8bmr7461249b6e.25.1789667823338;
        Thu, 17 Sep 2026 10:57:03 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:23::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cb6cc42831sm3206625b6e.7.2026.09.17.10.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:57:03 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Maarten Lankhorst <dev@lankhorst.se>,
	Maxime Ripard <mripard@kernel.org>,
	Natalie Vock <nat@pixelcluster.dev>,
	Tejun Heo <tj@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Oscar Salvador <osalvador@suse.de>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v6 0/5] mm/page_counter: move stock from mem_cgroup to page_counter
Date: Thu, 17 Sep 2026 10:57:00 -0700
Message-ID: <20260917175701.2343946-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916210552.891730-1-joshua.hahnjy@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 16 Sep 2026 14:05:46 -0700 Joshua Hahn <joshua.hahnjy@gmail.com> wrote:

> v5 --> v6
> =========
> Following feedback that v5 combined the (1) stock abstraction move from
> memcg to page_counter and (2) changing the allocation / draining
> behavior, v6 limits itself to only the first goal. It retains the
> existing seven-slot per-CPU design and drain policy.
> 
> INTRODUCTION
> ============
> Memcg keeps a per-CPU stock of precharged pages so that small, frequent
> allocations do not walk the page_counter hierarchy every time.
> Today, the stock implementation is within memcontrol code, even though
> the operation it caches is a page_counter charge. This makes it
> difficult to add new page_counters to a memcg and preserve the fast
> path behavior.
> 
> This matters for future work like my tiered memcg limits series [1]
> which introduces multiple new page_counters to memcg. Without making
> stock a page_counter-level property, it means that every memcg charge
> now goes through multiple page_counter hierarchy walks, instead of
> being able to cache these charges.
> 
> To make future page_counters scalable and performant, move stock from
> mem_cgroup to page_counter so that each page_counter can opt into its
> own per-CPU cache of pre-charged pages.
> 
> We get an added benefit of simplifying try_charge_memcg code, which now
> has all the stock management handled transparently within the
> page_counter layer.

Sashiko raised one bug for the series:

 @@ -192,11 +245,20 @@ bool page_counter_try_charge(struct page_counter *counter,
  				WRITE_ONCE(c->watermark, new);
  		}
  	}
 +	if (charge > nr_pages)
 +		page_counter_refill_stock(counter, charge - nr_pages);
 +	if (nr_charged)
 +		*nr_charged = charge;
  	return true;

 failed:

And asked: Does this unconditionally report the batched size to the
caller even if the excess was rejected by the stock and uncharged from
the hierarchy?

---

This is true, but this is already the behavior for vanilla memcg.
In this series I'm hoping to preserve all existing semantics without
changing behaviors, so I can fix this problem in a separate issue.

Specifically, in vanilla try_charge_memcg:

done_restock:
	if (batch > nr_pages)
		refill_stock(memcg, batch - nr_pages);

...
			current->memcg_nr_pages_over_high += batch;

So I've just preserved the exact semantics that we used to have before.

The problem isn't that big anyways though, it's a transient inflation
in memcg_over_high and will be wiped on the next high handling run,
and there is no effect on accounting or permanent inflations.

So I think this issue is pre-existing and a minor transient inflation
for memcg_over_high at best. If this looks problematic I can write an
orthogonal fix separately.

Thanks anyways, Sashiko!
Joshua
