Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F663BB133
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456059; cv=none; b=mCrFjkrlGBGouOfqlnJ7G+EVcT4lfEWWUukWEyhnHYCyqyy0xtp8STGnpismvCQz1G8q2oGjFIBEVUQEU9sdsFflLgrGBbzZ7Wf4vrflVwCN2yZa3J/nh7Myz7v6c1ZZzrR8lEtX1yPag/nVtF+cUzxgzLjOa7loOq2Cgveng7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456059; c=relaxed/simple;
	bh=zyqVi6uRGacZJuyYnIV/rrUh2DaYU6AvckRl0AF+wGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bnBOSlwZhASV9oioBvUEWnb4Wk8cPSPrA0pvWKYpFlfczi5aOuoEZm+mg7S6Q6XnCdfxByhCWvZJB2Be9ievo+58cldeUCQjifPshaaYo6qerhGPRx6hrCpjocU1pq6eDa6ZkbMZrSlk27Civp3+fcy9dhzdsaCGW0cuezPSsOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ozO1uH2x; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ozO1uH2x"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc4d192643dso1261530a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456058; x=1792060858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOVAVdLWRpL18PaqCaCiNVQOBrQ2EgqTC57TyqXjPGs=;
        b=ozO1uH2xPwZChxX299aHfpYyy8BJg2HWZdAjte9e2qooAXLl5htmGdQNem9DYQzvOg
         V8LuKTGXdjTsHtBQ64yKqIWN6VDJe8szDctRNQkb9pZsE2R8J3sak+V4ccilsuQWeFUw
         iPnXhY0LOt3+innIFC+VNcI990hL1/Tc10d8ReNEmMHz8VZLX5olWYN7H4mHxEd7r8sg
         mAz9fZYW2wa5M4pRraou6QjWT4v1QIMtyMTNPApfJvM6oSyLV/oaegpA5yHXzIFyfU64
         QaLnRdhrjFaFasJI5HnByvv6tAE1E5et7Dicf2A4asjwNmxdc0pFqI1LPjjUYh1xUP2T
         as/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456058; x=1792060858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iOVAVdLWRpL18PaqCaCiNVQOBrQ2EgqTC57TyqXjPGs=;
        b=pKydyv2VaAmVivQwjq6aWsTqUR7QhemhEsWExCdLPXY72z7+KKGvWKlcrN3qBNi+Uu
         78gfMiyxS7lcQ3TJ86zhPHPmSGD/dS1tDcYbnhh4EGS7Crqs70wHTXLlgNX+s9mICF6V
         XFLOZm9aHmgtyZa2lTgxpQCTunuvY/nhCQUQy1vct/7axDZhwmf9c/4uKxBM6MmKag+q
         G6RFLonbRbHuHVj+yk1Tnp3R9BJt8H+E6ua5SL8/4pELokaXIvyQeIOhsg4UGrUIb+by
         OAWn75489Xla/YhPN0C/oVh0nTmZyL/ANbYfDhTGjBNM3KbHYfH5qJQvaVEkjDGai1jo
         Tfdw==
X-Forwarded-Encrypted: i=1; AKwUvBwm2iQL3433j3NyhZizmZMukW9/XGaqrg2VWuqyP1MqyXXUYLIL4hSlwonvI6uHr9gZTBmFBSTCK5+DBqU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6eJE5dIA9atpS8tjWC7LMs9nEZJRi2vTwK92twCk7nVAddeZT
	NTZ0AAUUTotfDpksygQ5s6lRPwopGynOvyESbNejfVhlvTTZOS3gHJmA
X-Gm-Gg: AYBFou2D57bpJoAORH7xy/IeqnL5lX2qFjRhP8Kcmdq/vG8lqQql3TPoqT1+JW8rfAv
	GX7NQc2cylTmEbpa7y5zRCszASb4oxgIB/xZu+/vhbfh80DaSHgJtReky566SJgIdnJCGh+vzAW
	hAWPh6fD5gkSZTvt1ixSSawLMfoAoJxYBLvrVdLOFlYOgTN7gP6kT+cN4VClcvjrDqHMBJo6P/k
	faK/wY9wmCJDryUatqgxJ6j0cqdAqV4dQ8TicMDmjaE0mIaisnqE/zaVEtNIRs+R1RJH7Iy3ReB
	7moZljpVMU9LVcgluON7ueXbvhgY7/nVNDsXPPx77c/nSDCx6H/zNI0tVS+cOJoo1UX6uHmQg8Q
	WjSiWkTxUFjDWFouM37/vWrJL57bXRQww4S3WMwEdjUVlZu8Qr2pGOXinUq+FliQqSYrbgN2rrT
	bHbpUNimueU70CELYHhE/XubeseNM4phoojofHHJdt5x2bCHiGEViNeg/Aenec2a6mvfbC+KjoW
	Xq0pXAyuAn2QpL2WEhkYSmmTg==
X-Received: by 2002:a17:90b:5887:b0:3a4:fe48:d418 with SMTP id 98e67ed59e1d1-3a8a0851582mr4004998a91.19.1791456057998;
        Thu, 08 Oct 2026 03:40:57 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2001:d08:1334:29ed:db11:2c4c:ee4f:606])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a51bf3sm3831271a91.1.2026.10.08.03.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:40:57 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: suhaas@s-joshi.in
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	SJ Park <sj@kernel.org>,
	Liew Rui Yan <aethernet65535@gmail.com>
Subject: [PATCH 1/2] mm/damon/core: Use only installed probe in damon_merge_two_regions()
Date: Thu,  8 Oct 2026 18:40:29 +0800
Message-ID: <20261008104112.4763-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007154851.45368-2-suhaas@s-joshi.in>
References: <20261007154851.45368-2-suhaas@s-joshi.in>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Suhaas,

Thank you for your patches series!

On Wed, 07 Oct 2026 21:18:45 +0530 Suhaas Joshi <suhaas@s-joshi.in> wrote:

> While merging 2 regions, we iterate over the entire probe_hits[] array,
> whose size is determined by the DAMON_MAX_PROBES macro. It is possible,
> however, that we have fewer probes installed than DAMON_MAX_PROBES. In such

I find this a bit hard to read.  Could we change it to this?

    "However, it is possible that we have fewer probes installed than
    DAMON_MAX_PROBES."

> cases, we end up making redundant iterations. Therefore, to remedy this,
> iterate over the list of installed probes instead of iterating over the
> entire array. For doing this, start accepting a struct damon_ctx in
> damon_merge_two_regions(), and update calling functions to pass this
> argument.
> 
> Update the damon_test_merge_two() test to use this new signature for
> damon_merge_two_regions() as well.
> 
> Signed-off-by: Suhaas Joshi <suhaas@s-joshi.in>
> ---
>  mm/damon/core.c             | 14 +++++++++-----
>  mm/damon/tests/core-kunit.h | 19 +++++++++++++++++--
>  2 files changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/damon/core.c b/mm/damon/core.c
> index 733025b36745..a3af5ee685e1 100644
> --- a/mm/damon/core.c
> +++ b/mm/damon/core.c
> @@ -3499,20 +3499,24 @@ static void damon_verify_merge_two_regions(
>  /*
>   * Merge two adjacent regions into one region
>   */
> -static void damon_merge_two_regions(struct damon_target *t,
> -		struct damon_region *l, struct damon_region *r)
> +static void damon_merge_two_regions(struct damon_ctx *ctx, struct damon_target *t,
> +				    struct damon_region *l, struct damon_region *r)
>  {
>  	unsigned long sz_l = damon_sz_region(l), sz_r = damon_sz_region(r);
>  	int i;
> +	struct damon_probe *p;
>  
>  	l->nr_accesses = (l->nr_accesses * sz_l + r->nr_accesses * sz_r) /
>  			(sz_l + sz_r);
>  	l->age = (l->age * sz_l + r->age * sz_r) / (sz_l + sz_r);
>  	l->ar.end = r->ar.end;
> -	/* todo: do this for only installed probes */
> -	for (i = 0; i < DAMON_MAX_PROBES; i++)
> +
> +	i = 0;
> +	damon_for_each_probe(p, ctx) {
>  		l->probe_hits[i] = (l->probe_hits[i] * sz_l + r->probe_hits[i]
>  				* sz_r) / (sz_l + sz_r);
> +		++i;
> +	}
>  	damon_verify_merge_two_regions(l, r);
>  	damon_destroy_region(r, t);
>  }
> @@ -3565,7 +3569,7 @@ static void damon_merge_regions_of(struct damon_target *t, unsigned int thres,
>  			goto set_prev_continue;
>  		if (damon_sz_region(prev) + damon_sz_region(r) > sz_limit)
>  			goto set_prev_continue;
> -		damon_merge_two_regions(t, prev, r);
> +		damon_merge_two_regions(ctx, t, prev, r);
>  		continue;
>  set_prev_continue:
>  		prev = r;
> diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
> index df84d9cc7d20..5ad89c1d9fc2 100644
> --- a/mm/damon/tests/core-kunit.h
> +++ b/mm/damon/tests/core-kunit.h
> @@ -182,13 +182,27 @@ static void damon_test_merge_two(struct kunit *test)
>  {
>  	struct damon_target *t;
>  	struct damon_region *r, *r2, *r3;
> +	struct damon_probe *p;
> +	struct damon_ctx *ctx;
>  	int i;
>  
> +	p = damon_new_probe();
> +	if (!p)
> +		kunit_skip(test, "probe alloc fail");
> +	ctx = damon_new_ctx();
> +	if (!ctx) {
> +		damon_destroy_probe(p);
> +		kunit_skip(test, "context alloc fail");
> +	}
> +	damon_add_probe(ctx, p);
>  	t = damon_new_target();
> -	if (!t)
> +	if (!t) {
> +		damon_destroy_ctx(ctx);
>  		kunit_skip(test, "target alloc fail");
> +	}
>  	r = damon_new_region(0, 100);
>  	if (!r) {
> +		damon_destroy_ctx(ctx);
>  		damon_free_target(t);
>  		kunit_skip(test, "region alloc fail");
>  	}
> @@ -206,7 +220,7 @@ static void damon_test_merge_two(struct kunit *test)
>  	r2->age = 21;
>  	damon_add_region(r2, t);
>  
> -	damon_merge_two_regions(t, r, r2);
> +	damon_merge_two_regions(ctx, t, r, r2);
>  	KUNIT_EXPECT_EQ(test, r->ar.start, 0ul);
>  	KUNIT_EXPECT_EQ(test, r->ar.end, 300ul);
>  	KUNIT_EXPECT_EQ(test, r->nr_accesses, 16u);
> @@ -220,6 +234,7 @@ static void damon_test_merge_two(struct kunit *test)
>  	}
>  	KUNIT_EXPECT_EQ(test, i, 1);
>  
> +	damon_destroy_ctx(ctx);
>  	damon_free_target(t);
>  }
>  
> -- 
> 2.55.0

Other than the commit message I just mentioned, and the issue reported
[1] by Sashiko, LGTM.

Reviewed-by: Liew Rui Yan <aethernet65535@gmail.com>

[1] https://lore.kernel.org/damon/sashiko-outbox-163177@kernel.org

Best regards,
Rui Yan
