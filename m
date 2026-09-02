Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17424A5EA7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361734; cv=none; b=EfXFn5kSaENfePkMnhUu1RhJ40CTM9mwz2cDA1s/yOVja6nuNGYl0wrIeakEAUA3/wzggWFk+RbtmbFHslXGcANPspYaB0LaqvQrMp+3UyZ6+fMcn31IqkPX7oueT5R5/Jurwv1l0WYz/hxKq7gEi4ti/1vlVi+eIfDRnrGqbYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361734; c=relaxed/simple;
	bh=I3mYKVGTKqP/H3LNKqz4oW31/g3MR2FuJzgjMuRu5I0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=crzTkyxwSHqeVYhDipiCwgnIKQI0WLjhWnzqQeHNc8MhZnuAf4u2mPhHBVK1i4Ueyw9kqmKK7MlHN51kuhs4ce4gDgTbqGVZfJzSQep2YKlqRdaUxI5EQ+PGbRnQ91e415BLiexwM/uWgbr7CDoeDHBI9bsJgfi2C1fbCERo8sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dd2O+JSr; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dd2O+JSr"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d01663d816so10314785ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788361732; x=1788966532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EIdbnMs2RBr+E/C3ONkDjLCzcgL/LziyquabNv/nyLY=;
        b=dd2O+JSrI+Pwg6yAIH2N8NSywBvs7n/y9wwtKMKhyxoIkY3QT5s+5QtFzyPbp7ncyK
         YB3TqyrybZmLD14twJFpiNJRvU+9yNnmHmYH/fBjED3t/M5upLKjySQ+Kcf/GI5zVsT3
         vQldSzvT0aNazu5XqNyc2puRltZo6OpddXpPvtJ0gQUDCyYyvtOJcHn8s0XxQR2v4dK+
         Z8kkwxlkIu3mK7qWt8U7xDFVSHQ6l0sWGbUt4huao/KsNfX03a0IjENr/OFn/XGTN7va
         atkfScCOEN2YdlYEVoOostxumqSNpc3UvY/FwJeyJw/Ixa6xG2scrC+WzBPVtaZm0RFM
         j5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788361732; x=1788966532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EIdbnMs2RBr+E/C3ONkDjLCzcgL/LziyquabNv/nyLY=;
        b=ocbi6tGyY8xvwlKRAFXh77MKzz/flKiELeqNlQnqoKNobLQd4fkwKz2xzPl6Zj7trA
         j+HrOIxsBVOcVKZXOOTNd6qm40kEmvXkFb7CpupSp8ICh3BuKeT+vmvzBKxpAf38wSdp
         DxubPqcMvv1K4PYYMLa+fLxm1YXQkfFAFeszZISs7i0Zie0hO2Dxr5yAWDVm2Z/3mPqO
         bcqoQwni4h5j1p+xZfsbHvncta1VLS4HW7LOEvZtsfE4OdAiwzedSVPaK3V4GAxKLM7Y
         ql9syL0uRfadJyqPJxt+IqNcVUAtkvOSppx2nxxus9ZBj4OfuEUCR5ZaaJ+cOGLTL52K
         nAdQ==
X-Forwarded-Encrypted: i=1; AKwUvByW/voWm6XmweYB79WdLyzaUjdEox+d4RzBI+kPqlPa5Aj21Jup0D+rcJ6I6FchR8DsEb8/6mzx9Ryfu+w=@vger.kernel.org
X-Gm-Message-State: AFuF++kao5GhZA6VxrMv3lYrR2vT+WErgZ5ajSazuCCtS3UV3Yo6iyBG
	8vjJCuoGubdQygX/oyuZgTuENMESjvyXS1nF9oBU8GN9BHY1vfeg4AYn
X-Gm-Gg: AYBFou2yCmMotB1+UuQ8ytrMdzstm883CH3Fdc7D98QiQxJtpUUj2+gTYDqNtpwW6zR
	aJhZFi8I/RrzzbrMD1oclZYNg7tKXSgEuG12yaCVtifTqeHzMo7bj/Flt33bToAEZsvmztzGSpt
	kPuyU+KwdaM1c48GJXQOnrdaov1qdKJt2msMWKxNTb73UVSYP7kuIksFnkJIQgWa4I8XT/WAYcs
	Ff9lDc2LEJAGwdHVInElQnD7dYB0nkEeDQfnB89y3WvUiNn9OLeqOoU5j0AP5y6BtBRsA+KCQ7U
	fDjm0PZzWJDBQr83/y7tqLJiSF+F6PAN+WfjHzKr8YvHpc8etVoK+EfLNdGOypMyE3lfmBpN4/q
	DdJRghJP5/g4YhOhXWxrYAMaGUoEgFA8abWh9mOurZzOyGxFV8Omq/wT5JIOyWjF1nVyrqeMln+
	nSnrF4UxMFPK7O7MrDT71+qquZuzjmn6reuncD1ot0tMkXqBrKJIeBkCvmcQfu
X-Received: by 2002:a17:903:19ec:b0:2d6:e4ff:9cad with SMTP id d9443c01a7336-2daec5ab9c5mr86317615ad.3.1788361731078;
        Wed, 02 Sep 2026 08:08:51 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd488d18sm15030855ad.45.2026.09.02.08.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:08:50 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: SJ Park <sj@kernel.org>
Cc: Kunwu Chan <kunwu.chan@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@davidgow.net>,
	damon@lists.linux.dev,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 09/12] mm/damon/tests/core-kunit: test damon_nr_samples_per_aggr()
Date: Wed,  2 Sep 2026 23:08:41 +0800
Message-ID: <20260902150842.4033320-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902054747.99370-10-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue,  1 Sep 2026 22:47:42 -0700 SJ Park <sj@kernel.org> wrote:

> damon_max_nr_accesses(), which is a previous version of
> damon_nr_samples_per_aggr() before the renaming, was wrongly returning
> zero or random overflowed values for extreme intervals setup.  Commit
> 35d4a3cf70a8 ("mm/damon/ops-common: handle extreme intervals in
> damon_hot_score()") updated the function to return correct or more valid
> values.  Add a kunit test to ensure it is working as expected.
> 
> Signed-off-by: SJ Park <sj@kernel.org>
> ---
>  mm/damon/tests/core-kunit.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
> index a4164ac489a61..d0bed01a5b7fe 100644
> --- a/mm/damon/tests/core-kunit.h
> +++ b/mm/damon/tests/core-kunit.h
> @@ -625,6 +625,27 @@ static void damon_test_set_regions(struct kunit *test)
>  			(struct damon_addr_range[]){}, 0, -EINVAL);
>  }
>  
> +static void damon_test_nr_samples_per_aggr(struct kunit *test)
> +{
> +	struct damon_attrs attrs = {
> +		.sample_interval = 0,
> +		.aggr_interval = 0,
> +	};
> +

Hi SJ,

A small question about the first test case.

Both `sample_interval` and `aggr_interval` are zero here.  Since
`sample_interval` is the denominator in `damon_nr_samples_per_aggr()`,
would it be better to keep `aggr_interval` non-zero when testing the
zero `sample_interval` case?

This would make the test explicitly cover the divide-by-zero protection.
If the `aggr_interval == 0` behavior is also worth covering, perhaps it
could be tested separately.

Thanks,
Kunwu


> +	/* Zero aggregation interval doesn't cause division by zero */
> +	KUNIT_EXPECT_EQ(test, damon_nr_samples_per_aggr(&attrs), 1);
> +
> +	/*
> +	 * Too large aggregation interval on 64 bit system doesn't cause
> +	 * overflow
> +	 */
> +	if (ULONG_MAX > UINT_MAX) {
> +		attrs.aggr_interval = (unsigned long)UINT_MAX + 1;
> +		KUNIT_EXPECT_EQ(test, damon_nr_samples_per_aggr(&attrs),
> +				UINT_MAX);
> +	}
> +}
> +
>  static void damon_test_update_monitoring_result(struct kunit *test)
>  {
>  	struct damon_attrs old_attrs = {
> @@ -1736,6 +1757,7 @@ static struct kunit_case damon_test_cases[] = {
>  	KUNIT_CASE(damon_test_split_above_half_progresses),
>  	KUNIT_CASE(damon_test_ops_registration),
>  	KUNIT_CASE(damon_test_set_regions),
> +	KUNIT_CASE(damon_test_nr_samples_per_aggr),
>  	KUNIT_CASE(damon_test_update_monitoring_result),
>  	KUNIT_CASE(damon_test_set_attrs),
>  	KUNIT_CASE(damon_test_mvsum),
> -- 
> 2.47.3
> 

Sent using hkml (https://github.com/sjp38/hackermail)
