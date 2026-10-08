Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0182A497B87
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456300; cv=none; b=Ls5tiyLLtmg6sb/IqOAhOMRRquyRej/0qNadamhRX6p9WArnSD9d0NARZ7HZzLHupsrsKZA4bxUNbelx3Ky2f+5Czg3zPbv4jobDSjfsUMyfvznEd1A2VjbRNagkFB9O+RJmaUVSp38vxi7QIkgssrO73ZDMleaEWdWyIukGKfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456300; c=relaxed/simple;
	bh=maDdtaErG0HEiphcfEJYV2BkFrxfFYOvxUhDvySilEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bTHZzgFJ23zAMA9rP++/f+G31Dr/SkhBl8apetssFIJ0MDTGKG2DPnQ++cLIvnIdB5DFROyKL+91uLCAQpKYmi+AQmOMPagArpQKF9hTD2O47NzmPwZA7qXUuu+C6jKx8T7DICdWGac/eTkW0q72U7xbBh/I97YCqgWtgKXzosw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFgB13R5; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFgB13R5"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4e9e56e9aso1468996a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456298; x=1792061098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dH+v/ufGOq7i0ts93hi9MHjSRomJDT2cVjr72NMJIW0=;
        b=kFgB13R57DJNADlCrebfBPxbk7bhXQcdtB4e939Yj0PZW89LY7N9Y4A1tXrlfUsLQr
         stayz1pmHwANfCBxwzp4m/uFLI/UbxdSuT4nWRBkrFr4qVHqJC9JmsTc7F817fFpfsxK
         RQ736eX+16uV3d7edgKcyBJxKmVTxJc26gOqVKoUTVOcPWtnH205yOGdjboaHn3XOpTf
         pHkDykA3ycmOiMKI2i+RspfKihn2L//XneGdzVnocD5j277gueWEYhW/HHhK1mYhJAGS
         KmF2Ui/Ax70hUe7TjXukDLZGbWTeCbqNUNnEO6tDc46IzReK3cB2V8zxOTGB/gyBQAMJ
         eSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456298; x=1792061098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dH+v/ufGOq7i0ts93hi9MHjSRomJDT2cVjr72NMJIW0=;
        b=JXSTNXegKqCrUD2e80V96p3jYYxu0gD2qpgcvr0ldDFk3CemuuJ40XIedcN9F42RoJ
         +gBK2mJnk5twSLF/QX0pj6WGZigQvKhfAJXNQgzqdAjYEOOMazilAuKM4Zcwirxjxp8Y
         dlWeGeqlNJqix/cfBzSSZNozAdF/0jgG8V5ReCu/EbXm+q9/SgaYu8XPvevyrKs6pGZ1
         RzGwRzoSK1RDty03I6PhtqNrvvQHaR4oxa5jGQWIGMyNpMxnWau6SdV8PHJUGbWd8kky
         p9U7KaY2H/dq8aZ1fPA0VQcq+7P2gmZUysZJHFENveZHVw9MJUmcHw63gmXzPOjzPG7m
         Aukg==
X-Forwarded-Encrypted: i=1; AKwUvBxQYlmhP2bdmrTvsqLHGIfTS1bg5+i2n0JGSKVyymjBH7yiUYhRPyp1IP1Iwl4AT23L8bYE4IMre7cbi0o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUhfutJU5VMMXizOaTtj31WLsBnJ0p95FX+LgiqNACttFXYWOf
	x8YFELdMNjHFRKVmTWSSgGpYgAm/kj9xYKvHrsf7m3uBaE6fdfrmLlEkZ59ZEHHw
X-Gm-Gg: AYBFou1lq2X8ZOudwsIjDNxp1bxOqdWfoN0t8pwJL3jxD/8BoIG3mg5n9GCKgNvBIbN
	W7c96HrAEjvBbr8IIPoQKxhIf/STSgdCsiQk4CbPpMWagK62jo3XRtsI1S3M2bMyjFgLCLizYah
	FeFGokCRf7ZBPQ8HzLecuPWJMU5a7+gvQCS/R9PLFK4mTRQ8/hKQV1fBzHZ1fsuzbavL32c1Otd
	xuwcq3XZveTNtazHcI6owA902VNoj5GWUsbePzv6/YX4qVMytBMJB8BMnn+s4ashnqQdMJMkYPy
	nOpgQYzd7TB6altiRVehOrYoJf3aTTu6heq0MZfVLL2SAGQWGPEL+Kv6juzkbwaJLFwu7e+SJVS
	GTWufFPYZ6dQ5lYo8BHupuJrFR3WAmhjUGdj0XNXY+h+oLjeTyL4VqE4trU12o8F/umOzwDpAcP
	n5rvXMfnL5ly3K82fiEeHMocuzlfIZUfHIu9EoSiF6KMGleLgHDwuPNmFYrHPY8Qx7xZTK3Oqch
	n7cMRiQyFPA+1dQZ2qDMO5H8A==
X-Received: by 2002:a17:90b:4fc5:b0:3a6:dc2f:f07f with SMTP id 98e67ed59e1d1-3a8a1982a7fmr4554157a91.10.1791456298338;
        Thu, 08 Oct 2026 03:44:58 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2001:d08:1334:29ed:db11:2c4c:ee4f:606])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff848f9csm3616656a91.9.2026.10.08.03.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:44:57 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: suhaas@s-joshi.in
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	SJ Park <sj@kernel.org>,
	Liew Rui Yan <aethernet65535@gmail.com>
Subject: [PATCH 2/2] mm/damon/core: Copy only installed probe in damon_split_region_at()
Date: Thu,  8 Oct 2026 18:44:45 +0800
Message-ID: <20261008104511.5290-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007154851.45368-3-suhaas@s-joshi.in>
References: <20261007154851.45368-3-suhaas@s-joshi.in>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 07 Oct 2026 21:18:46 +0530 Suhaas Joshi <suhaas@s-joshi.in> wrote:

> In damon_split_region_at(), we copy the entire probe_hits[] and
> last_probe_hits[] arrays of DAMON_MAX_PROBES size. However it is possible
> that the number of probes installed is less than DAMON_MAX_PROBES, in which
> case one or more iterations is/are redundant. To remedy this, iterate over
> only as many times as the number of installed probes. To do so, accept a
> struct damon_ctx pointer in damon_split_region_at(), and update all
> invocations of the function to pass the new argument.
> 
> Also update damon_test_split_at() and damos_test_filter_out() in
> core-kunit.h to supply a context to function paths that call
> damon_split_region_at().
> 
> Signed-off-by: Suhaas Joshi <suhaas@s-joshi.in>
> ---
>  mm/damon/core.c             | 42 +++++++++++++++++---------------
>  mm/damon/tests/core-kunit.h | 48 ++++++++++++++++++++++++++++++-------
>  2 files changed, 63 insertions(+), 27 deletions(-)
> 
> diff --git a/mm/damon/core.c b/mm/damon/core.c
> index a3af5ee685e1..025df4d19e20 100644
> --- a/mm/damon/core.c
> +++ b/mm/damon/core.c
> @@ -2049,8 +2049,8 @@ static unsigned long damon_region_sz_limit(struct damon_ctx *ctx)
>  	return sz;
>  }
>  
> -static int damon_split_region_at(struct damon_target *t,
> -				  struct damon_region *r, unsigned long sz_r);
> +static int damon_split_region_at(struct damon_ctx *ctx, struct damon_target *t,
> +				 struct damon_region *r, unsigned long sz_r);
>  
>  /*
>   * damon_apply_min_nr_regions() - Make effect of min_nr_regions parameter.
> @@ -2075,7 +2075,7 @@ static unsigned long damon_apply_min_nr_regions(struct damon_ctx *ctx)
>  	damon_for_each_target(t, ctx) {
>  		damon_for_each_region_safe(r, next, t) {
>  			while (damon_sz_region(r) > max_region_sz) {
> -				if (damon_split_region_at(t, r, max_region_sz))
> +				if (damon_split_region_at(ctx, t, r, max_region_sz))
>  					goto out;
>  				r = damon_next_region(r);
>  			}
> @@ -2494,9 +2494,9 @@ static bool damos_valid_target(struct damon_ctx *c, struct damon_region *r,
>   *
>   * Return: true if the region should be skipped, false otherwise.
>   */
> -static bool damos_skip_charged_region(struct damon_target *t,
> -		struct damon_region *r, struct damos *s,
> -		unsigned long min_region_sz)
> +static bool damos_skip_charged_region(struct damon_ctx *ctx, struct damon_target *t,
> +				      struct damon_region *r, struct damos *s,
> +				      unsigned long min_region_sz)
>  {
>  	struct damos_quota *quota = &s->quota;
>  	unsigned long sz_to_skip;
> @@ -2523,7 +2523,7 @@ static bool damos_skip_charged_region(struct damon_target *t,
>  				}
>  				sz_to_skip = min_region_sz;
>  			}
> -			damon_split_region_at(t, r, sz_to_skip);
> +			damon_split_region_at(ctx, t, r, sz_to_skip);
>  			skip = true;
>  		}
>  	}
> @@ -2581,12 +2581,12 @@ static bool damos_filter_match(struct damon_ctx *ctx, struct damon_target *t,
>  		}
>  		/* start before the range and overlap */
>  		if (r->ar.start < start) {
> -			damon_split_region_at(t, r, start - r->ar.start);
> +			damon_split_region_at(ctx, t, r, start - r->ar.start);
>  			matched = false;
>  			break;
>  		}
>  		/* start inside the range */
> -		damon_split_region_at(t, r, end - r->ar.start);
> +		damon_split_region_at(ctx, t, r, end - r->ar.start);
>  		matched = true;
>  		break;
>  	case DAMOS_FILTER_TYPE_PROBE_HITS_WSUM:
> @@ -2779,7 +2779,7 @@ static void damos_apply_scheme(struct damon_ctx *c, struct damon_target *t,
>  					c->min_region_sz);
>  			if (!sz)
>  				goto update_stat;
> -			if (damon_split_region_at(t, r, sz))
> +			if (damon_split_region_at(c, t, r, sz))
>  				goto update_stat;
>  		}
>  		if (damos_core_filter_out(c, t, r, s))
> @@ -2826,7 +2826,7 @@ static void damon_do_apply_schemes(struct damon_ctx *c,
>  		if (damos_quota_is_full(quota, c->min_region_sz))
>  			continue;
>  
> -		if (damos_skip_charged_region(t, r, s, c->min_region_sz))
> +		if (damos_skip_charged_region(c, t, r, s, c->min_region_sz))
>  			continue;
>  
>  		if (s->max_nr_snapshots &&
> @@ -3643,10 +3643,12 @@ static void damon_verify_split_region_at(struct damon_region *r,
>   *
>   * Return: 0 on success, negative error code otherwise.
>   */
> -static int damon_split_region_at(struct damon_target *t,
> -				  struct damon_region *r, unsigned long sz_r)
> +static int damon_split_region_at(struct damon_ctx *ctx, struct damon_target *t,
> +				 struct damon_region *r, unsigned long sz_r)
>  {
>  	struct damon_region *new;
> +	struct damon_probe *p;
> +	int i;
>  
>  	damon_verify_split_region_at(r, sz_r);
>  	new = damon_new_region(r->ar.start + sz_r, r->ar.end);
> @@ -3658,11 +3660,13 @@ static int damon_split_region_at(struct damon_target *t,
>  	new->age = r->age;
>  	new->last_nr_accesses = r->last_nr_accesses;
>  	new->nr_accesses = r->nr_accesses;
> -	/* todo: do this for only installed probes */
> -	memcpy(new->probe_hits, r->probe_hits, sizeof(r->probe_hits));
> -	memcpy(new->last_probe_hits, r->last_probe_hits,
> -			sizeof(r->last_probe_hits));
>  
> +	i = 0;
> +	damon_for_each_probe(p, ctx) {
> +		new->probe_hits[i] = r->probe_hits[i];
> +		new->last_probe_hits[i] = r->last_probe_hits[i];
> +		++i;
> +	}
>  	damon_insert_region(new, r, damon_next_region(r), t);
>  	return 0;
>  }
> @@ -3691,7 +3695,7 @@ static void damon_split_regions_of(struct damon_ctx *ctx,
>  			if (sz_sub == 0 || sz_sub >= sz_region)
>  				continue;
>  
> -			damon_split_region_at(t, r, sz_sub);
> +			damon_split_region_at(ctx, t, r, sz_sub);
>  			sz_region = sz_sub;
>  		}
>  	}
> @@ -3723,7 +3727,7 @@ static void damon_split_some_regions(struct damon_ctx *ctx,
>  			if (sz_sub == 0 || sz_sub >= sz_region)
>  				continue;
>  
> -			damon_split_region_at(t, r, sz_sub);
> +			damon_split_region_at(ctx, t, r, sz_sub);
>  		}
>  	}
>  }
> diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
> index 5ad89c1d9fc2..e02604c7e0bc 100644
> --- a/mm/damon/tests/core-kunit.h
> +++ b/mm/damon/tests/core-kunit.h
> @@ -141,12 +141,26 @@ static void damon_test_split_at(struct kunit *test)
>  {
>  	struct damon_target *t;
>  	struct damon_region *r, *r_new;
> +	struct damon_ctx *ctx;
> +	struct damon_probe *p;
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
> @@ -156,7 +170,7 @@ static void damon_test_split_at(struct kunit *test)
>  	r->last_probe_hits[0] = 3;
>  	r->age = 10;
>  	damon_add_region(r, t);
> -	damon_split_region_at(t, r, 25);
> +	damon_split_region_at(ctx, t, r, 25);
>  	KUNIT_EXPECT_EQ(test, damon_nr_regions(t), 2);
>  	if (damon_nr_regions(t) != 2)
>  		goto out;
> @@ -176,6 +190,7 @@ static void damon_test_split_at(struct kunit *test)
>  
>  out:
>  	damon_free_target(t);
> +	damon_destroy_ctx(ctx);
>  }
>  
>  static void damon_test_merge_two(struct kunit *test)
> @@ -1648,19 +1663,35 @@ static void damos_test_filter_out(struct kunit *test)
>  	struct damon_target *t;
>  	struct damon_region *r, *r2;
>  	struct damos_filter *f;
> +	struct damon_ctx *ctx;
> +	struct damon_probe *p;
> +
> +	p = damon_new_probe();
> +	if (!p)
> +		kunit_skip(test, "probe alloc fail");
> +	ctx = damon_new_ctx();
> +	if (!ctx) {
> +		damon_destroy_probe(p);
> +		kunit_skip(test, "context alloc fail");
> +	}
> +	damon_add_probe(ctx, p);
>  
>  	f = damos_new_filter(DAMOS_FILTER_TYPE_ADDR, true, false);
> -	if (!f)
> +	if (!f) {
> +		damon_destroy_ctx(ctx);
>  		kunit_skip(test, "filter alloc fail");
> +	}
>  	f->addr_range = (struct damon_addr_range){.start = 2, .end = 6};
>  
>  	t = damon_new_target();
>  	if (!t) {
> +		damon_destroy_ctx(ctx);
>  		damos_destroy_filter(f);
>  		kunit_skip(test, "target alloc fail");
>  	}
>  	r = damon_new_region(3, 5);
>  	if (!r) {
> +		damon_destroy_ctx(ctx);
>  		damos_destroy_filter(f);
>  		damon_free_target(t);
>  		kunit_skip(test, "region alloc fail");
> @@ -1668,27 +1699,27 @@ static void damos_test_filter_out(struct kunit *test)
>  	damon_add_region(r, t);
>  
>  	/* region in the range */
> -	KUNIT_EXPECT_TRUE(test, damos_filter_match(NULL, t, r, f, 1));
> +	KUNIT_EXPECT_TRUE(test, damos_filter_match(ctx, t, r, f, 1));
>  	KUNIT_EXPECT_EQ(test, damon_nr_regions(t), 1);
>  
>  	/* region before the range */
>  	r->ar.start = 1;
>  	r->ar.end = 2;
>  	KUNIT_EXPECT_FALSE(test,
> -			damos_filter_match(NULL, t, r, f, 1));
> +			damos_filter_match(ctx, t, r, f, 1));
>  	KUNIT_EXPECT_EQ(test, damon_nr_regions(t), 1);
>  
>  	/* region after the range */
>  	r->ar.start = 6;
>  	r->ar.end = 8;
>  	KUNIT_EXPECT_FALSE(test,
> -			damos_filter_match(NULL, t, r, f, 1));
> +			damos_filter_match(ctx, t, r, f, 1));
>  	KUNIT_EXPECT_EQ(test, damon_nr_regions(t), 1);
>  
>  	/* region started before the range */
>  	r->ar.start = 1;
>  	r->ar.end = 4;
> -	KUNIT_EXPECT_FALSE(test, damos_filter_match(NULL, t, r, f, 1));
> +	KUNIT_EXPECT_FALSE(test, damos_filter_match(ctx, t, r, f, 1));
>  	/* filter should have split the region */
>  	KUNIT_EXPECT_EQ(test, r->ar.start, 1);
>  	KUNIT_EXPECT_EQ(test, r->ar.end, 2);
> @@ -1704,7 +1735,7 @@ static void damos_test_filter_out(struct kunit *test)
>  	r->ar.start = 2;
>  	r->ar.end = 8;
>  	KUNIT_EXPECT_TRUE(test,
> -			damos_filter_match(NULL, t, r, f, 1));
> +			damos_filter_match(ctx, t, r, f, 1));
>  	/* filter should have split the region */
>  	KUNIT_EXPECT_EQ(test, r->ar.start, 2);
>  	KUNIT_EXPECT_EQ(test, r->ar.end, 6);
> @@ -1717,6 +1748,7 @@ static void damos_test_filter_out(struct kunit *test)
>  	damon_destroy_region(r2, t);
>  
>  out:
> +	damon_destroy_ctx(ctx);
>  	damon_free_target(t);
>  	damos_free_filter(f);
>  }
> -- 
> 2.55.0

Thank you for your patches!  LGTM.

Reviewed-by: Liew Rui Yan <aethernet65535@gmail.com>

Best regards,
Rui Yan
